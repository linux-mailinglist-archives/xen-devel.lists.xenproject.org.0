Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CA51D9302
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 11:13:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jayIv-0000d6-Ko; Tue, 19 May 2020 09:12:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jayIu-0000d1-Vu
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 09:12:53 +0000
X-Inumbo-ID: e9989b42-99b0-11ea-a8e9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9989b42-99b0-11ea-a8e9-12813bfff9fa;
 Tue, 19 May 2020 09:12:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 47018AFA1;
 Tue, 19 May 2020 09:12:52 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] x86: relax LDT check in arch_set_info_guest()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b7a1a7fe-0bc5-1654-ff1c-e5eb787c579e@suse.com>
 <c36cac91-49ae-6bb2-b057-195031979d21@suse.com>
 <20200519090220.GA54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50050054-b081-5d6e-13e8-c50e52afe42b@suse.com>
Date: Tue, 19 May 2020 11:12:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519090220.GA54375@Air-de-Roger>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.05.2020 11:02, Roger Pau Monné wrote:
> On Fri, Dec 20, 2019 at 02:50:06PM +0100, Jan Beulich wrote:
>> It is wrong for us to check the base address when there's no LDT in the
>> first place. Once we don't do this check anymore we can also set the
>> base address to a non-canonical value when the LDT is empty.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I wonder if a ldt_ents check should also be added to
> pv_map_ldt_shadow_page in order to avoid trying to get the mapping of
> the LDT.

We already have

    if ( unlikely((offset >> 3) >= curr->arch.pv.ldt_ents) )
    {
        ASSERT_UNREACHABLE();
        return false;
    }

What else do you mean?

Jan

