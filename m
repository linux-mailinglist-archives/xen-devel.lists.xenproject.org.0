Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLgtNtaoHWp+cwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5585F621F6F
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323941.1589629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oI-0006k8-HB; Mon, 01 Jun 2026 15:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323941.1589629; Mon, 01 Jun 2026 15:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oI-0006gu-DX; Mon, 01 Jun 2026 15:44:14 +0000
Received: by outflank-mailman (input) for mailman id 1323941;
 Mon, 01 Jun 2026 15:44:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wU4oH-0006fh-C3
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 15:44:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU4oG-00BHey-NX
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:44:12 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1da8ba-e002-0a2a0a5209dd-0a2a450880c8-40
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:12 +0200
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1da8cc-63b5-0a2a45080019-d155da2ebdb4-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:12 +0200
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-bed19623d6eso180917066b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 08:44:12 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-be9d32d37b2sm353748766b.24.2026.06.01.08.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 08:44:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780328652; x=1780933452; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dhh3aknkmaLv0kAkw3FyTA3SDyH+omzqwzUqSrQ78Ds=;
        b=odaxBavqgHK2qirvjgfm4oe1UiF7c+SXBSuz7Nv4JGeqSmsH7zr2DL5RC1AXoWyR0G
         aE293HOeMwy/a4pPV7q7m+ClQNBonnOjoa7QjomKfTS6cJkDGcZ5hwB9CPTpFMiJNFR0
         +I4IL/R0YNYQa8cksw2hUUetfRrUZYXla26IIWxwFG4krLlmRGO4RZ/gmvgjo0LAWnoO
         dzARdwCJyHKIhk2Hrvzc6EU7zoE+rOgFd4CFQtcIN76Lh0v4fEz4Jg1qujFfz9bokbez
         cSHyUx8j669MOrY/ahqYyj18FMjgEcKgCq2sUhMc42zFaFQq5RgkHvvt3GkD003ZIvA3
         H1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328652; x=1780933452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dhh3aknkmaLv0kAkw3FyTA3SDyH+omzqwzUqSrQ78Ds=;
        b=E2Dae6jIbIlRO9daaRW3YamFDlJw2BJ31U6PdqahqL0Hq5z6TksLJEYql8UAzKvjXm
         2YSAzN1YtIuDm1tiGT9ooE0SS16wsgqVa+Uf2if7NyYUvDw5ks9G9W7ubyeSNK/hopCX
         D4s/OzquWUip3Wg2n+LvVJB36SfEnP+5ARzFDTEyJ3x0GVBtq9K9zc15+/gNqndjhr9P
         gRNiykBefKoGDzSGdWmWyRDj2BP0vPhKjHHnGhcZZXdfi8mfjsaZSSYJXQ0m7qcp2Beu
         dgNDX2akzNjgos71h8SKsC+y4P9WDIZdz+Q53/eUNCmoQw43nMy+G1T88wk5A1ARG560
         fD5g==
X-Forwarded-Encrypted: i=1; AFNElJ9we/Dw+U8aFwtCeO3bnXrjtviYB93Z2T3sAL0T+qIS5cLeYayQ3W//DTSt+EUj1qnw6BZa137xVTQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxqs0dMGmz6YWpsuhyWKqOdtz7oxY8NHUZDDNrZPfaAULIW7uj2
	MkxCTy+J971XKxUANIwvFOPp68rBy1J0PCEvt6F5aNpdqYxGmOcaBBmt
X-Gm-Gg: Acq92OHc6jyZt/XOeBaz+WqslYCfIrfGVZ2hVoocx5ktsWF2QV4nmLsA6QVANNNJ9tf
	qFTNbT9DRsKQag45cBaTkVJ2G+D5Xz7FM9o24ejebgh7P8m9R0tNfWmcB6XADLlAbJ4YiqiKMUB
	sHLpQX0QvO8Fpck+R07GtXwaH/4cV6CQi2TASxTedxddLpD2d4JzoMG6XuRBPcTSA/MWCYz/k9u
	Mrmvg1bpEkaDKIRWc+yOO9w0vI+H0d3JTaq2y6tmkdv7T2HuKPvySzRLsRKxlAsa/wLdFIVgBHh
	7M+Zy8pkeAGBfUP9E1gzQwb75ODtA7bJeHQuaA5IQCnK2YwaxoQieb8ym6Er8AHvU7scFlAye8n
	M9Ni5V+eTP7kJK6vABkAlKrjf1J5gUeZDgAMZouUWukTUqDDvc/njLThiRsOCPSf3H6rOQaL1NE
	glhKdk1OT0QOur5Oj/Qfizzg3ZxnX+KMTo0J2MBCjg1oiUMtRWS2/xClnGeF5A27wekfe0YogIg
	XD3s3H+Q7S6DK+d
X-Received: by 2002:a17:907:b5a0:b0:bee:6806:d69a with SMTP id a640c23a62f3a-bee6806de9amr120075766b.38.1780328651977;
        Mon, 01 Jun 2026 08:44:11 -0700 (PDT)
Message-ID: <05e9d637-0293-42f0-9e36-b3fe4eef6840@gmail.com>
Date: Mon, 1 Jun 2026 17:44:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Update Xen version to 4.22.0-rc1
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260601152709.2588210-1-andrew.cooper3@citrix.com>
 <20260601152709.2588210-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260601152709.2588210-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1780328652-B6F72DB1-05FB61A8/10/73395122804
X-purgate-type: spam
X-purgate-size: 2537
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,amd.com:email,suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,xen.org:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5585F621F6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 6/1/26 5:27 PM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   README       | 10 +++++-----
>   SUPPORT.md   |  2 +-
>   xen/Makefile |  2 +-
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/README b/README
> index 889a4ea906d6..3dcc00c4a4ad 100644
> --- a/README
> +++ b/README
> @@ -1,9 +1,9 @@
>   ############################################################
> -__  __                                _        _     _
> -\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
> - \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
> - /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
> -/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
> +__  __            _  _    ____  ____
> +\ \/ /___ _ __   | || |  |___ \|___ \    _ __ ___
> + \  // _ \ '_ \  | || |_   __) | __) |__| '__/ __|
> + /  \  __/ | | | |__   _| / __/ / __/|__| | | (__
> +/_/\_\___|_| |_|    |_|(_)_____|_____|  |_|  \___|
>   
>   ############################################################
>   
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 8e7ab7cb3ec8..abc7beac5b55 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
>   
>   # Release Support
>   
> -    Xen-Version: 4.22-unstable
> +    Xen-Version: 4.22-rc
>       Initial-Release: n/a
>       Supported-Until: TBD
>       Security-Support-Until: Unreleased - not yet security-supported
> diff --git a/xen/Makefile b/xen/Makefile
> index a2b442e76d5c..1f11610b5f68 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
>   # All other places this is stored (eg. compile.h) should be autogenerated.
>   export XEN_VERSION       = 4
>   export XEN_SUBVERSION    = 22
> -export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
> +export XEN_EXTRAVERSION ?= .0-rc1$(XEN_VENDORVERSION)
>   export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
>   -include xen-version
>   

LGTM:
  Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


