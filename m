Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0F227EC9C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 17:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819.2779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNe3l-0000Zi-FB; Wed, 30 Sep 2020 15:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819.2779; Wed, 30 Sep 2020 15:30:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNe3l-0000ZJ-Bu; Wed, 30 Sep 2020 15:30:25 +0000
Received: by outflank-mailman (input) for mailman id 819;
 Wed, 30 Sep 2020 15:30:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNe3j-0000ZE-JG
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:30:23 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70e9d759-9f64-4a0c-b412-8dc27a304ec9;
 Wed, 30 Sep 2020 15:30:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNe3j-0000ZE-JG
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:30:23 +0000
X-Inumbo-ID: 70e9d759-9f64-4a0c-b412-8dc27a304ec9
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 70e9d759-9f64-4a0c-b412-8dc27a304ec9;
	Wed, 30 Sep 2020 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601479822;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=mfqqaiwhmxFgi+3ybLlAYKtTiAs+aRYkTft+n6OLrJU=;
  b=UC3uP2Sb23IExjJpGPGYXRqSOrUfuoWU19YHGlvbaxkHyAvClz8IUYh2
   b/xcVRAX5iabFzZF1F/Auz1NS9ccT/Y2A7dSrpOKb9PSGz0YS7ZGmmI+X
   AjUEJSYUX3d1Nx9faaYt+Rz5xOzGkmpdp8NpINqufZlyRcIH9M+p20W5q
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: brWRXmcYitGgS5ETJSC7R+tS7+AUC8flIbVIRXmmRXUxzutnUpRn+Ts7KL0OoPEFKmjyfiqAbt
 95O1qJPLOmIbWlAoV53XLgZqipb3GmcgbcVi1Ivbev9M5HW6x1OaWiBp/Q0CEgKqdq+i1S4O6v
 8G5UF7fSRPLedtc9kKqS9161oCXM7KWb2Ltk47zCMtu43CGb3vFL5hCr8KtYsYtH5pSP6IERlH
 ivmV2G7iBL5zD+iI42WVe/1nWE9sLlert/OgqT9UD1u369av0HriavQUSNZ+n3m0QmV7p5804W
 h/0=
X-SBRS: None
X-MesageID: 28072303
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28072303"
Subject: Re: [PATCH] tools/xenstore: set maximum number of grants needed
To: Wei Liu <wl@xen.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>
References: <20200924143648.27861-1-jgross@suse.com>
 <20200930151442.25qnwooqxqu4tm4o@liuwe-devbox-debian-v2>
 <95c9ecc7-046b-b1d8-7778-7ca94a60b1e1@suse.com>
 <20200930152828.bh4q5sn23xvzf3ua@liuwe-devbox-debian-v2>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <65a3d0ff-2a0b-75ba-27d0-8fa9d6b8f830@citrix.com>
Date: Wed, 30 Sep 2020 16:30:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930152828.bh4q5sn23xvzf3ua@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 30/09/2020 16:28, Wei Liu wrote:
> On Wed, Sep 30, 2020 at 05:23:58PM +0200, Jürgen Groß wrote:
>> On 30.09.20 17:14, Wei Liu wrote:
>>> On Thu, Sep 24, 2020 at 04:36:48PM +0200, Juergen Gross wrote:
>>>> When running as a stubdom Xenstore should set the maximum number of
>>>> grants needed via a call of xengnttab_set_max_grants(), as otherwise
>>>> the number of domains which can be supported will be 128 only (the
>>>> default number of grants supported by Mini-OS).
>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>> ---
>>>> This is a backport candidate IMO.
>>>> ---
>>>>   tools/xenstore/xenstored_domain.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
>>>> index 06359503f0..f740aa02f5 100644
>>>> --- a/tools/xenstore/xenstored_domain.c
>>>> +++ b/tools/xenstore/xenstored_domain.c
>>>> @@ -630,6 +630,8 @@ void domain_init(void)
>>>>   	*xgt_handle = xengnttab_open(NULL, 0);
>>>>   	if (*xgt_handle == NULL)
>>>>   		barf_perror("Failed to open connection to gnttab");
>>>> +	/* Allow max number of domains for mappings. */
>>>> +	xengnttab_set_max_grants(*xgt_handle, DOMID_FIRST_RESERVED);
>>> Why DOMID_FIRST_RESERVED as the count argument? Is the expectation here
>>> xenstored maps one grant per domain?
>> Yes. This is the theoretical maximum.
>>
> In that case:
>
> Acked-by: Wei Liu <wl@xen.org>
>
> I will also add that information to the commit message.

And the comment if possible please.  That's where it will be most useful
to the next person doing a doubletake at this code.  :)

~Andrew

