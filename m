Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EF599869B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 14:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816108.1230279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sysbd-0004Q7-Iy; Thu, 10 Oct 2024 12:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816108.1230279; Thu, 10 Oct 2024 12:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sysbd-0004Nm-Ff; Thu, 10 Oct 2024 12:49:25 +0000
Received: by outflank-mailman (input) for mailman id 816108;
 Thu, 10 Oct 2024 12:49:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O2aS=RG=bounce.vates.tech=bounce-md_30504962.6707cd51.v1-af092a954b1b46f2bf0a9f88ba07fd3e@srs-se1.protection.inumbo.net>)
 id 1sysbc-0004Ku-Lu
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 12:49:24 +0000
Received: from mail186-1.suw21.mandrillapp.com
 (mail186-1.suw21.mandrillapp.com [198.2.186.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12532b50-8706-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 14:49:22 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-1.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4XPV2923PqzBsV1Th
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 12:49:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 af092a954b1b46f2bf0a9f88ba07fd3e; Thu, 10 Oct 2024 12:49:21 +0000
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
X-Inumbo-ID: 12532b50-8706-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1728564561; x=1728825061;
	bh=qIhGHL9rPMAbYbiNvwoD7H0UW2iUiwMPXQwmq7Zmo6o=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1cPlnPzBrIp1CBUzeAF6wHP6GxhOVFHoW8wUln/BCWrTvpfoMJPdH85FNbh4BsOW3
	 YEnN5NLDyAFexg/jDXxJ7SEIazO+nKguhhB0jTfIqHC51JeZcnJvBpLOOHIU4lAX6D
	 3xMAEKCunVYVnYkLvqGsG+C9Ll4amxbzzOwLZlqAuWsu/1+6V4Cqsj5C3GZoOyFOXH
	 Vby53mFhNOPM5Iy1BKqevQBYFiGF3p+bJAH5CKLCDGgYn+q1e5Pge3MeRUo798GlUj
	 9RXJEPTafr6PM59RnNgI/ZLLZFNweqDhYgiu4vDvFQM1xIVSBvpass4UB3M0i0EnKM
	 qnTJlZuIL4pIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1728564561; x=1728825061; i=anthony.perard@vates.tech;
	bh=qIhGHL9rPMAbYbiNvwoD7H0UW2iUiwMPXQwmq7Zmo6o=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tFBqIx8FEYqkQXVHxP60VT1MMHUxhjApjrS3tYqvu1h8DY/VsFDlghpLUqxaFkHYN
	 omqT2/+8i2dk2eN/1mReQ0bH0Hkg41vJ19yuXLTL4sEEzZ5wuFOGbjQRQSDRoOo/sc
	 FYjj/88gxH+7Fdli6Mwucxm5UNBBcMen8ODlQy3RqZEB9uxI2a9tzGtgj5VfouX6f/
	 4B/G97PbUCtrGbMA+Nxdq8ob6eqZbto21JH+3/kotdMYPeC5oLsUFbnpx3OQYIW6hQ
	 fCVhjl4Bgve8uVnPPDzl6XAMMkze8gowt17hZaut10gjj0oYSIlCCaCvpiFhhh7TRT
	 eNP0+p+RUJ9Dg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20stubdom:=20add=20fine=20grained=20library=20config=20items=20to=20Mini-OS=20configs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1728564560541
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-Id: <ZwfNUKIXp44loWTD@l14>
References: <20241010111946.22173-1-jgross@suse.com>
In-Reply-To: <20241010111946.22173-1-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.af092a954b1b46f2bf0a9f88ba07fd3e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241010:md
Date: Thu, 10 Oct 2024 12:49:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Oct 10, 2024 at 01:19:46PM +0200, Juergen Gross wrote:
> Today Mini-OS can only be configured to use all or none Xen library.
> In order to prepare a more fine grained configuration scheme, add per
> library config items to the Mini-OS config files.
> 
> As some libraries pull in others, the config files need to be
> extended at build time to reflect those indirect library uses.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - rename BUILD_config to GEN_CONFIG (Anthony PERARD)
> - rename generated config files to *.gen.cfg (Anthony PERARD)
> - don't write config data to file in make macro (Anthony PERARD)
> - remove no longer needed $(CURDIR)/ from prerequisites (Anthony PERARD)

Looks good to me.

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

