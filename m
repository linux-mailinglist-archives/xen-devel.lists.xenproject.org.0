Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59E01DE5BC
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 13:43:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc64t-00034D-V7; Fri, 22 May 2020 11:43:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jc64s-00033v-9D
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 11:43:02 +0000
X-Inumbo-ID: 638dc8c4-9c21-11ea-abb5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 638dc8c4-9c21-11ea-abb5-12813bfff9fa;
 Fri, 22 May 2020 11:43:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5B99BAE2C;
 Fri, 22 May 2020 11:43:02 +0000 (UTC)
Subject: Re: [PATCH v3 1/5] x86: suppress XPTI-related TLB flushes when
 possible
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
 <ae47cb2c-2fff-cd08-0a26-683cef1f3303@suse.com>
 <17f1b674-92f9-6ee9-8e10-0fc30f055fe8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cc806683-8a56-3876-6bd4-1ab660347440@suse.com>
Date: Fri, 22 May 2020 13:42:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <17f1b674-92f9-6ee9-8e10-0fc30f055fe8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.05.2020 13:00, Andrew Cooper wrote:
> On 25/09/2019 16:23, Jan Beulich wrote:
>> When there's no XPTI-enabled PV domain at all, there's no need to issue
>> respective TLB flushes. Hardwire opt_xpti_* to false when !PV, and
>> record the creation of PV domains by bumping opt_xpti_* accordingly.
>>
>> As to the sticky opt_xpti_domu vs increment/decrement of opt_xpti_hwdom,
>> this is done this way to avoid
>> (a) widening the former variable,
>> (b) any risk of a missed flush, which would result in an XSA if a DomU
>>     was able to exercise it, and
>> (c) any races updating the variable.
>> Fundamentally the TLB flush done when context switching out the domain's
>> vCPU-s the last time before destroying the domain ought to be
>> sufficient, so in principle DomU handling could be made match hwdom's.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I am still concerned about the added complexity for no obvious use case.
> 
> Under what circumstances do we expect to XPTI-ness come and go on a
> system, outside of custom dev-testing scenarios?

Run a PVH Dom0 with just HVM guests for a while on a system, until you
find a need to run a PV guest there (perhaps because of an emergency).

Jan

