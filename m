Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FE82207EA
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 10:57:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvdDS-0007Mw-VD; Wed, 15 Jul 2020 08:56:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvdDQ-0007Mr-TS
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 08:56:36 +0000
X-Inumbo-ID: 16747358-c679-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16747358-c679-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 08:56:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B0DEAF44;
 Wed, 15 Jul 2020 08:56:38 +0000 (UTC)
Subject: Re: [PATCH v2 1/7] x86: fix compat header generation
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <a8139d0e-f332-b877-dea8-3ce8a6869285@suse.com>
 <20200715084325.GT7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f92d154e-514e-031f-aaad-f1534a06e514@suse.com>
Date: Wed, 15 Jul 2020 10:56:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715084325.GT7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.07.2020 10:43, Roger Pau Monné wrote:
> On Wed, Jul 01, 2020 at 12:25:15PM +0200, Jan Beulich wrote:
>> As was pointed out by 0e2e54966af5 ("mm: fix public declaration of
>> struct xen_mem_acquire_resource"), we're not currently handling structs
>> correctly that have uint64_aligned_t fields. #pragma pack(4) suppresses
>> the necessary alignment even if the type did properly survive (which
>> it also didn't) in the process of generating the headers. Overall,
>> with the above mentioned change applied, there's only a latent issue
>> here afaict, i.e. no other of our interface structs is currently
>> affected.
>>
>> As a result it is clear that using #pragma pack(4) is not an option.
>> Drop all uses from compat header generation. Make sure
>> {,u}int64_aligned_t actually survives, such that explicitly aligned
>> fields will remain aligned. Arrange for {,u}int64_t to be transformed
>> into a type that's 64 bits wide and 4-byte aligned, by utilizing that
>> in typedef-s the "aligned" attribute can be used to reduce alignment.
>> Additionally, for the cases where native structures get re-used,
>> enforce suitable alignment via typedef-s (which allow alignment to be
>> reduced).
>>
>> This use of typedef-s makes necessary changes to CHECK_*() macro
>> generation: Previously get-fields.sh relied on finding struct/union
>> keywords when other compound types were used. We now need to use the
>> typedef-s (guaranteeing suitable alignment) now, and hence the script
>> has to recognize those cases, too. (Unfortunately there are a few
>> special cases to be dealt with, but this is really not much different
>> from e.g. the pre-existing compat_domain_handle_t special case.)
>>
>> This need to use typedef-s is certainly somewhat fragile going forward,
>> as in similar future cases it is imperative to also use typedef-s, or
>> else the CHECK_*() macros won't check what they're supposed to check. I
>> don't currently see any means to avoid this fragility, though.
>>
>> There's one change to generated code according to my observations: In
>> arch_compat_vcpu_op() the runstate area "area" variable would previously
>> have been put in a just 4-byte aligned stack slot (despite being 8 bytes
>> in size), whereas now it gets put in an 8-byte aligned location.
>>
>> There also results some curious inconsistency in struct xen_mc from
>> these changes - I intend to clean this up later on. Otherwise unrelated
>> code would also need adjustment right here.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks. I shall send out v3, as I had to fix an issue with old gcc:
There were two (identical) typedef-s for {,u}int64_compat_t, which
newer gcc tolerate, but older don't.

Jan

