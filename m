Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515338CCE30
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 10:28:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728232.1133097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3nu-000479-3o; Thu, 23 May 2024 08:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728232.1133097; Thu, 23 May 2024 08:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3nu-00045K-0n; Thu, 23 May 2024 08:28:02 +0000
Received: by outflank-mailman (input) for mailman id 728232;
 Thu, 23 May 2024 08:28:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGfz=M2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sA3ns-00045E-Q3
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 08:28:00 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d2af421-18de-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 10:27:59 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a623cf23927so123728266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 01:27:59 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a8967a711sm1227007466b.2.2024.05.23.01.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 01:27:59 -0700 (PDT)
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
X-Inumbo-ID: 5d2af421-18de-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716452879; x=1717057679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jhpvbBfwpJWGF5iUcQkjO7ndJQwWC1rVlWpqUpT0O4s=;
        b=SU99fmFqruFm/5CSzURqPh2QCt+P+HAABoHSbdEyiMgmvOfAOpDEQcJ+h841SUUTU3
         3kfyCdg5CS/IdyNpzp62tzbY5/O4yLgE1gsoDAbc1BAGxbtkX3WrbxPKbq9pM4+3j46Z
         Ew1ExOYP3d37+Y2ddY5rfhFtAKRiCP4X5/HC/jDEmPSVcAekviBlfZvXgWoGAWcjPBvJ
         auV1OwPkuvKmDQ5N1YW28KBwBA6NlM2AGtEl959Y7XYCQkkVGs+iCmtCIeHSy9ef+ozh
         Xd+3L7HfMQB1A/eYZt4Ku4X9EA58IfvxSqEmOBHfXSr3uz5S8s7bkvHwfz4h1fvrCN+y
         KP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716452879; x=1717057679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhpvbBfwpJWGF5iUcQkjO7ndJQwWC1rVlWpqUpT0O4s=;
        b=KhDTWAbVPaUOleVuruGIisZFYA1c5o+y3/HPN5YG4Z8PJRk9l6DKlOkSAMAB2GbpyX
         Qxt0KoKijzQXlgwz8BVzrq5ERdNLBDrsLxhH8qtUBfn2ZegC2F4LEEPsvobtkVjE6TEN
         UP9MyhqOINyM/WVImfLmlDJr0tMrHGJRBZYuHMSS+LDgUd27VzJnRKNs6u8LM+tIMNGu
         g51HlfGdaS45N4Y1aOcKAH0q4Kb/Yj1jKFv73Aa7td0D18bPv7N21IoASeRhDR8l2H4R
         rz1ow77NNYrRwH3dTm3BFmbC8Dzip1k6t9R4PRe4L+2Hx1vL5RZ+wcfJoTfcAEl9NaHY
         28Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUcgdBXcHztM+7pqEreJpMmnya2mGG2R4QGxZtbG/U1OWrg51OsGcm/OCizO6GoplwdqZnw6fD26Ar/2Gw+3C55asbVFfSJzrGWenuMtT8=
X-Gm-Message-State: AOJu0YxxnZHJqkcFQZCun2G/yuf5Jmh3YFQI0D+KYCfD/WPd9oY1qRxh
	cALe3SBrqybgqcjoOrlD6Q5GxtbI3IRXewp13vPqLe6nLb/3xwk8ektq2CS+dT0=
X-Google-Smtp-Source: AGHT+IEuBhjg/MG9JEuabnR/N1PzCOaBGU5xNemthbK5N8Gkevd6Z9RRqTn5FvpAjVmlMfFBN+WCnQ==
X-Received: by 2002:a17:906:4a14:b0:a59:bf27:5f2e with SMTP id a640c23a62f3a-a623e8f7e02mr121836166b.20.1716452879245;
        Thu, 23 May 2024 01:27:59 -0700 (PDT)
Message-ID: <19c7a56c-5640-438d-aece-6a62f748e893@suse.com>
Date: Thu, 23 May 2024 10:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] tools: Drop libsystemd as a dependency
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
 <20240516185804.3309725-5-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240516185804.3309725-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.05.24 20:58, Andrew Cooper wrote:
> There are no more users, and we want to disuade people from introducing new
> users just for sd_notify() and friends.  Drop the dependency.
> 
> We still want the overall --with{,out}-systemd to gate the generation of the
> service/unit/mount/etc files.
> 
> Rerun autogen.sh, and mark the dependency as removed in the build containers.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: Edwin Török <edwin.torok@cloud.com>
> 
> v2:
>   * Only strip out the library check.
> ---
>   automation/build/archlinux/current.dockerfile |   1 +
>   .../build/suse/opensuse-leap.dockerfile       |   1 +
>   .../build/suse/opensuse-tumbleweed.dockerfile |   1 +
>   automation/build/ubuntu/focal.dockerfile      |   1 +
>   config/Tools.mk.in                            |   2 -
>   m4/systemd.m4                                 |   9 -
>   tools/configure                               | 256 ------------------
>   7 files changed, 4 insertions(+), 267 deletions(-)
> 
> diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
> index 3e37ab5c40c1..d29f1358c2bd 100644
> --- a/automation/build/archlinux/current.dockerfile
> +++ b/automation/build/archlinux/current.dockerfile
> @@ -37,6 +37,7 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
>           sdl2 \
>           spice \
>           spice-protocol \
> +        # systemd for Xen < 4.19

Does this work as intended? A comment between the parameters and no "\" at the
end of the line?


Juergen

