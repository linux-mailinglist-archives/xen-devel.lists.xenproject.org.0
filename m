Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65859351077
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104129.198787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsFn-0001Uf-01; Thu, 01 Apr 2021 08:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104129.198787; Thu, 01 Apr 2021 08:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsFm-0001UG-Sk; Thu, 01 Apr 2021 08:00:34 +0000
Received: by outflank-mailman (input) for mailman id 104129;
 Thu, 01 Apr 2021 08:00:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRsFl-0001UB-JI
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:00:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df1147cc-8342-4dfe-b6d1-d69926d99a1d;
 Thu, 01 Apr 2021 08:00:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DD4E9B1F1;
 Thu,  1 Apr 2021 08:00:30 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: df1147cc-8342-4dfe-b6d1-d69926d99a1d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617264031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2sZt9qo8NcRMWOTASDKrGZPc39F8TkStruAYUradwBg=;
	b=BNI9vvGASYaxegAmu077BgRMLih4wIpzx5xfZ6xgZMVG7uo1OBWbtayuuxFSFbMn3YbVcr
	JmYaYTKewcCCx7v43l9n+CWJkPQKaHVPwYlZ3kDm70JCVxgS2K/ncgILy+/31+Pv/0ZijS
	WppXTO+lpU3Ems6Hg3beCRlhcMEm9ys=
Subject: =?UTF-8?Q?Ping=c2=b2=3a_=5bPATCH_v2=5d_x86/PV=3a_make_post-migratio?=
 =?UTF-8?Q?n_page_state_consistent?=
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <07ebce3c-4dcf-bc9e-6d82-7f3def486ab8@suse.com>
 <b733914b-1bfd-d95d-470e-af3ca7a4f69f@suse.com>
 <e2ac69e3-64ef-5362-427b-7e52735ea834@citrix.com>
 <8df7e434-6cea-54ca-4f24-09cbd692ad3b@suse.com>
Message-ID: <e0bd5b60-2c0b-77cf-8d3b-0c5ac9ba09c2@suse.com>
Date: Thu, 1 Apr 2021 10:00:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <8df7e434-6cea-54ca-4f24-09cbd692ad3b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.11.2020 13:50, Jan Beulich wrote:
> On 23.11.2020 13:26, Andrew Cooper wrote:
>> On 20/11/2020 12:48, Jan Beulich wrote:
>>> On 04.11.2020 08:56, Jan Beulich wrote:
>>>> When a page table page gets de-validated, its type reference count drops
>>>> to zero (and PGT_validated gets cleared), but its type remains intact.
>>>> XEN_DOMCTL_getpageframeinfo3, therefore, so far reported prior usage for
>>>> such pages. An intermediate write to such a page via e.g.
>>>> MMU_NORMAL_PT_UPDATE, however, would transition the page's type to
>>>> PGT_writable_page, thus altering what XEN_DOMCTL_getpageframeinfo3 would
>>>> return. In libxc the decision which pages to normalize / localize
>>>> depends solely on the type returned from the domctl. As a result without
>>>> further precautions the guest won't be able to tell whether such a page
>>>> has had its (apparent) PTE entries transitioned to the new MFNs.
>>>>
>>>> Add a check of PGT_validated, thus consistently avoiding normalization /
>>>> localization in the tool stack.
>>>>
>>>> Also use XEN_DOMCTL_PFINFO_NOTAB in the variable's initializer instead
>>>> open coding it.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> v2: Don't change type's type.
>>> Ping?
>>
>> Ping what?  There is still nothing addressing my concerns from v1.
> 
> I did reply to your concerns on Sep 11th, and then replied to this
> reply of mine another time on Sep 28th. Neither of these got any
> response from you, hence I had to conclude - after two further
> pings on v1 - that they were satisfactory to you. Now you say they
> weren't, but without saying in which way, so I still wouldn't know
> what to change in the description.
> 
> On the code change itself you did say "... so this is probably a
> good change", so I was further understanding that your concern is
> merely with the description. Maybe I misunderstood this aspect,
> too?
> 
>> To re-iterate - this is a very subtle change, in a very complicated
>> piece of migration.  As the problems described do not manifest in
>> practice, it is vital to understand why.
> 
> Until now it has been my understanding that they just don't happen
> to manifest, because guests know to behave themselves (read: pin,
> first and foremost, all their page tables, which means we wouldn't
> in practice run into ones with an in-flight state change).

Another example where I think I have waited long enough for a reply.
Roger has acked the change, so unless I hear otherwise by then I'm
intending to commit this, too, once the tree is fully open again.

Jan

