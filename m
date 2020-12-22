Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E952E08E4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 11:41:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57740.101138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krf61-00033t-Al; Tue, 22 Dec 2020 10:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57740.101138; Tue, 22 Dec 2020 10:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krf61-00033U-7e; Tue, 22 Dec 2020 10:40:49 +0000
Received: by outflank-mailman (input) for mailman id 57740;
 Tue, 22 Dec 2020 10:40:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=if9N=F2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1krf5z-00033P-PM
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 10:40:47 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e94d46a-c026-4953-b073-c31c134bc21a;
 Tue, 22 Dec 2020 10:40:46 +0000 (UTC)
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
X-Inumbo-ID: 8e94d46a-c026-4953-b073-c31c134bc21a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608633646;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=8TZ3AdM3+DNkMA8Ac+d1EZv+uIxkJKZ+d+5zZF/V3KU=;
  b=dTxGvDwmhpkNeWQY1rA6cj5ndf87kaggdXhqvCaXyeh1knjj7H5YimUN
   9ONAgkWAdvMQ4iB5JQ2CNFxAaDhK/9uywSwNuQCb/5XnaDm9pCXwtVkpz
   eaYJoJMEbhMhhITckYzHI9RL5eWv4YBcdiSdb+Q5lBgdl/55S+pBhss/p
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cNfxd2oaqNwIgqzKNxib/0M/w2mTSb/3oJGjQzn3m92al0/DXuVRsxiztDfpCTdP6t4cRae0IY
 mVL/uSpXHjpYllL+Dl7ff41MlNTVFwkxPmWqyVGJR9ppPjZEhyvFQm0gxEXwh/+WVB8bGjnJ/2
 ucsNtpLbsGATy070FeVm3LROarigxavxHDQD0LotkAPupqXD7YS/kHrJJbiRPQg7cD9BThT52e
 b34PGtDcUgssxSASj/Xw7KJm7dt/BVOhA2/IprW+EdwnGvS+3gILrSAwn9rO7oeBpb/P0mSo8x
 KGM=
X-SBRS: 5.2
X-MesageID: 33732350
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,438,1599537600"; 
   d="scan'208";a="33732350"
Subject: Re: [PATCH 2/6] x86/mm: p2m_add_foreign() is HVM-only
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <cf4569c5-a9c5-7b4b-d576-d1521c369418@suse.com>
 <f736244b-ece7-af35-1517-2e5fdd9705c7@citrix.com>
 <e2ee99fc-e3f8-bdaf-fe4a-d048da34731a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b4abbe2f-5e3d-5f43-80b8-cfa3fd97061e@citrix.com>
Date: Tue, 22 Dec 2020 10:40:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e2ee99fc-e3f8-bdaf-fe4a-d048da34731a@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 21/12/2020 08:10, Jan Beulich wrote:
> On 17.12.2020 20:18, Andrew Cooper wrote:
>> On 15/12/2020 16:26, Jan Beulich wrote:
>>> This is together with its only caller, xenmem_add_to_physmap_one().
>> I can't parse this sentence.  Perhaps "... as is it's only caller," as a
>> follow-on from the subject sentence.
>>
>>>  Move
>>> the latter next to p2m_add_foreign(), allowing this one to become static
>>> at the same time.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> So I had to ask Andrew to revert this (I was already at home when
> noticing the breakage), as it turned out to break the shim build.
> The problem is that xenmem_add_to_physmap() is non-static and
> hence can't be eliminated altogether by the compiler when !HVM.
> We could make the function conditionally static
> "#if !defined(CONFIG_X86) && !defined(CONFIG_HVM)", but this
> looks uglier to me than this extra hunk:
>
> --- unstable.orig/xen/common/memory.c
> +++ unstable/xen/common/memory.c
> @@ -788,7 +788,11 @@ int xenmem_add_to_physmap(struct domain
>      union add_to_physmap_extra extra = {};
>      struct page_info *pages[16];
>  
> -    ASSERT(paging_mode_translate(d));
> +    if ( !paging_mode_translate(d) )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return -EACCES;
> +    }
>  
>      if ( xatp->space == XENMAPSPACE_gmfn_foreign )
>          extra.foreign_domid = DOMID_INVALID;
>
> Andrew, please let me know whether your ack stands with this (or
> said alternative) added, or whether you'd prefer me to re-post.

Yeah, this is probably neater than the ifdefary.  My ack stands.

~Andrew

