Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56059EDCEF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 02:09:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855437.1268352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLXh6-0007ZG-FU; Thu, 12 Dec 2024 01:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855437.1268352; Thu, 12 Dec 2024 01:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLXh6-0007WY-Aw; Thu, 12 Dec 2024 01:08:44 +0000
Received: by outflank-mailman (input) for mailman id 855437;
 Thu, 12 Dec 2024 01:08:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IXdK=TF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tLXh5-0007WS-6z
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 01:08:43 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fcf93dc-b825-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 02:08:40 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43618283d48so319065e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 17:08:40 -0800 (PST)
Received: from [192.168.189.19] ([81.6.40.111])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362571776asm497505e9.40.2024.12.11.17.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 17:08:39 -0800 (PST)
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
X-Inumbo-ID: 9fcf93dc-b825-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733965720; x=1734570520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TP9LdhWnkwuR4BVtDr1TfyZDD6u3r+pSiUAXCQnKV+Y=;
        b=LBpokgrqHePVgGVLnSc97af83XTLYPmDfhd9Jt1IbwZ7D9w+0QePY+KMma9oW2rl48
         CsMKPlFeaGDzvDX8L2m7L37G1+k37lmcuOVoEBcodCiG18Gxud+a7NATZYNH+Pm8b8eM
         dDu0mrKnYlRToaOzcYw/HBXLUfcXkMR/0xjVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733965720; x=1734570520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TP9LdhWnkwuR4BVtDr1TfyZDD6u3r+pSiUAXCQnKV+Y=;
        b=pMlSnE+oEpI462ZZKWLhvwqI30t9W+Xh5/csUajROJFGn35atG+YduV+iCpBboyi+j
         vlsrkaS950UTDxXaD7cI8REY0ST/KkW5qX8ZJYAU/1tyg8yCAOMTKsuNgkFy1lo1Wxj+
         PYhIBFCY/C4G92N+LEcW0S3/iGzORTCoIs0au8xr85pdjP4d6NAy5p5fchjCreFyTLzD
         12UoRErbtRtbJ0K5jOivbcA4bXBZC4OJm/TV0PJHwfSyhcD+8yDzzREiHwLijcmKPd1T
         TP839M/7MGGkWQprUmtOhJwKkMXhgNQr76tNwIV5KKug7QnBVdnGO/PJKKejFJav1nSR
         RzAw==
X-Forwarded-Encrypted: i=1; AJvYcCUoargfCY+pmi5aq33ZLiAwGyeKUDDLGf/ocutEetAib7IKKE8GOSVsjvoGXZR6bodyvWpcMiwn9s4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzG54zBVuX8Ade/AZgqHdHTTAL+kpf7d3Zu11c0xj6eid8Fmcjl
	90VT3xpvCN/VGSUbbVzAtXSI1bcyMdNy/qzPeopBa4WJgm3HMeRKFTBCXtFZ4Q8xelZFVV1cFdH
	AJ97U5A==
X-Gm-Gg: ASbGncs7Urp5q/ojG+NJZYbt3Ctl5LC8esaXrv3YezyShZTaUlFFZk2C417IKfRTtSi
	STG61EXw7VpChZtidHVNR6GiKa+E/Ul2KYAHafNPFaInLs8PBEAtJ0X9BntWxYb8YpAFLUjFElR
	tY+AxVD4Nutnm56F8bmQKKOsX+3ZBDIBCPcUHjPwh5rDhhAZqxNzkIrrha56UKsjp8zfLbyOiRp
	+DDqtpXxkH3uVskb61KeR6jV7+bXAyL9INPkMF5f5SkvtUECY5mTN2He9B/P3lF
X-Google-Smtp-Source: AGHT+IFF6035NWPK1cRIr2atBUFPRX+LPderE7e4YKEWbhwrT4aDgMM15J/jXOxAEjRvvPs6mq6UCw==
X-Received: by 2002:a05:600c:5101:b0:435:136:75f6 with SMTP id 5b1f17b1804b1-4361c2bbc4amr41066375e9.0.1733965720192;
        Wed, 11 Dec 2024 17:08:40 -0800 (PST)
Message-ID: <c22384b9-f246-4d79-9ad1-ff9dce89cff6@citrix.com>
Date: Thu, 12 Dec 2024 01:08:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] common: remove -fno-stack-protector from
 EMBEDDED_EXTRA_CFLAGS
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <20241211020424.401614-2-volodymyr_babchuk@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241211020424.401614-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/12/2024 2:04 am, Volodymyr Babchuk wrote:
> This patch is preparation for making stack protector
> configurable. First step is to remove -fno-stack-protector flag from
> EMBEDDED_EXTRA_CFLAGS so separate components (Hypervisor in this case)
> can enable/disable this feature by themselves.
>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

This doesn't build on x86.

You need this hunk too,

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index d45787665907..ff0d61d7ac39 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -17,6 +17,7 @@ obj32 := $(addprefix $(obj)/,$(obj32))
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
+CFLAGS_x86_32 += -fno-stack-protector
 CFLAGS_x86_32 += -nostdinc -include $(filter
%/include/xen/config.h,$(XEN_CFLAGS))
 CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
 
because CFLAGS_x86_32 really was using -fno-stack-protector to override
the compilers inbuilt choice.

~Andrew

