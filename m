Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zw+7CVCWR2q2bgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 13:00:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECC97018BC
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 13:00:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="pGvAw/G5";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353152.1609267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfbcx-0008DN-7H; Fri, 03 Jul 2026 11:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353152.1609267; Fri, 03 Jul 2026 11:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfbcx-0008BM-4X; Fri, 03 Jul 2026 11:00:11 +0000
Received: by outflank-mailman (input) for mailman id 1353152;
 Fri, 03 Jul 2026 11:00:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wfbcv-0008BE-Mh
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 11:00:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfbcu-000Np5-FA
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 13:00:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a479632-bab6-0a2a0a5309dd-0a2a45048592-24
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 13:00:08 +0200
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a479638-a01d-0a2a45040019-d155a732b503-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 13:00:08 +0200
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5aec5675c46so466737e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 04:00:08 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5aed13c5c11sm393585e87.77.2026.07.03.04.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 04:00:06 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783076407; x=1783681207; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Ohgw0X4VP/JMwTkY286QlvDpibdPKHXNfR1zkAuVBA=;
        b=pGvAw/G5XuLLNzW/xEa+ZrqPza7Mha4z3p2ERiMnY4ZmAGUecqQWJ+BGlvLw8l2xo8
         8wgaWLuIm3sZKFfV03snxgRMmguM1fDeflsb/6TmuA7oftSoHj1V5iToc1AYTEWA6A38
         s9AGAz8mrqZRm1YIC7N5V+qTIrW4f5BxnLK1BfmJ+xI0oGML7/Ro01u7DT/9kbpHNJtQ
         5LOURGoT0Fw3XmpHPqb7CyBivWHJy6gwwDmpZpz0Mnkmi0HzWov5qYf/Hh/S9IVoSbfv
         HyUgnNu6Hgw5WxSazRWlvdOYGbEyLi65Zv7bhtvhpxtDf2687ksaBqVuXUZn/juIaJ+j
         uxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076407; x=1783681207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ohgw0X4VP/JMwTkY286QlvDpibdPKHXNfR1zkAuVBA=;
        b=NMoSG+SN4184Kn9eKSXtK/IB9VNz5gq9SsIQkNhI0KM5S+BvqPk703Q238egYh6I7n
         64RBifGd927DN7dU/qn2pGVc8u3Fxx4FN+WlVJn9i7ZFCwawMjyChANB+QXa0IvaAMsT
         FIprYw4bp2Q2e0ezdQYF1ZWkxvTySZKDS+BHej+f5IU/RbkWfrafUTMmqexOxHmTq+QK
         N42DJpRc/S555zGIceFsvZ/+uhVW/zEvOATSSav/2GYiVB2uhjQd1GpZk/xHvkJkaWif
         zRVmHxX3n2Z2NDiCkNKORkgQzOPTjlMUyQC+bbfxUH7B4mVqgfgJkVdYQ9dON9TmTN3g
         U3Dw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5PcTya2QAc3wM08jhn754xaOYv/VKSSDEa6eqbt6tsr2G+ibIg80obLhvAkSoBygVu5MyBTvOzhY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFq74eski22lO+DjnBMQFUiMh5pfGIV32Be43d6pkphIIXfdDu
	ofCHAmRp0fvdX46FrOT3x+wHiK3uHrt+qZ4KCFkvUpkgKdjf2pQ9Hrhg
X-Gm-Gg: AfdE7clQQZqXJpDgjRrAM8Ge/d2xg+vvxzR3UO6CN1OyAy9xv2RG7lE8ujErG0/zv4K
	Gky75bhrap+Pm7e2P4xAAzO1NKgsC+ZSy2/P0ynCYGU4nZneIpgnZMdCPKPpLkVzGh4ijoOzQIy
	H8MN5AJb21SlPldgQu0nxtwwh4+Xuxd3Hl6NfgqhCceIhLbaqKuT6b+jTpyOZXBjRxbMneu9k5q
	r6AcZGErqPVdFw4fHqWuI+47UaFWPXWmLUoOIwwoh4HQDCQnPIONN2QrcBo/DsShmLPYCvC42qC
	+Xf/Wa6i4BmLanYVKbWcD0S3A9Ev/MLLmGol1yJM+FBHnBXtu7aiSgcZfVdd/tViYmKYL41YVYy
	t+4tOv4zFwKoDLIzKl/Ej1bdoHDaQiID4qNMYc8/sTU+8dHfiP4RNnFOnHp5V1Dbnsnq//EqzFb
	scOIQkV9Ink4cpPT82EwQhSS7/fhgfyFJ7yozj2RDE7iEr0pX1vmRgCswr2SKX/oE3+o76RZVMw
	f6duA==
X-Received: by 2002:a05:6512:611:20b0:5ad:518a:61dd with SMTP id 2adb3069b0e04-5aec68b8313mr1589861e87.46.1783076407393;
        Fri, 03 Jul 2026 04:00:07 -0700 (PDT)
Message-ID: <0c12eeed-5e3c-4289-9b19-156530c3b822@gmail.com>
Date: Fri, 3 Jul 2026 13:00:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] tools/libfsimage: Remove the XEN_FSIMAGE_FSDIR
 environment variable
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260702150301.825883-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260702150301.825883-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1783076408-AFD241CC-8B680338/10/73395122804
X-purgate-type: spam
X-purgate-size: 2631
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7ECC97018BC



On 7/2/26 5:03 PM, Andrew Cooper wrote:
> This was reported to the security team, demonstrating that code execution
> could be achieved, but without a demonstration of a priviliege boundary being
> bypassed.
> 
> Still, it's a high risk path with no obvious evidence of having been used even
> for debugging, so remove the environment variable and use the build time
> $(libdir)/xenfsimage path only.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> For 4.22.  This was supposed to be posted earlier but fell through the cracks.
> Given it's borderline-security aspect, we don't want to delay it any further.
> ---

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

>   CHANGELOG.md                             | 1 +
>   tools/libfsimage/common/fsimage_plugin.c | 5 +----
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ef4e6ae9c459..0a4e5f013cb1 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -63,6 +63,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
>    - Removed xenpm tool on non-x86 platforms as it doesn't actually provide
>      anything useful outside of x86.
> + - Removed the XEN_FSIMAGE_FSDIR environment variable.
>   
>   ## [4.21.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.21.0) - 2025-11-19
>   

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>


> diff --git a/tools/libfsimage/common/fsimage_plugin.c b/tools/libfsimage/common/fsimage_plugin.c
> index d0cb9e96a654..539dc247356a 100644
> --- a/tools/libfsimage/common/fsimage_plugin.c
> +++ b/tools/libfsimage/common/fsimage_plugin.c
> @@ -121,7 +121,7 @@ static int init_plugin(const char *lib)
>   
>   int fsi_init(void)
>   {
> -	const char *fsdir = getenv("XEN_FSIMAGE_FSDIR");
> +	const char *fsdir = FSIMAGE_FSDIR;
>   	struct dirent *dp = NULL;
>   	DIR *dir = NULL;
>   	char *tmp = NULL;
> @@ -129,9 +129,6 @@ int fsi_init(void)
>   	int err;
>   	int ret = -1;
>   
> -	if (fsdir == NULL)
> -		fsdir = FSIMAGE_FSDIR;
> -
>   	if ((name_max = pathconf(fsdir, _PC_NAME_MAX)) == -1)
>   		goto fail;
>   
> 
> base-commit: ad9f564a5d840389cbf1b230086e1dd8257d8820


~ Oleksii


