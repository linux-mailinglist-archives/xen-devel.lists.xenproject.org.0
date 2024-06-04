Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 259778FAA59
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 07:58:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735123.1141269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENBc-0003ou-Pl; Tue, 04 Jun 2024 05:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735123.1141269; Tue, 04 Jun 2024 05:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENBc-0003nH-N5; Tue, 04 Jun 2024 05:58:20 +0000
Received: by outflank-mailman (input) for mailman id 735123;
 Tue, 04 Jun 2024 05:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7N6=NG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sENBb-0003n7-Ey
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 05:58:19 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 707153f5-2237-11ef-90a1-e314d9c70b13;
 Tue, 04 Jun 2024 07:58:18 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-35dc9cef36dso4304426f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 22:58:18 -0700 (PDT)
Received: from [172.31.7.231] ([62.28.210.62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064998bsm10468832f8f.91.2024.06.03.22.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 22:58:16 -0700 (PDT)
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
X-Inumbo-ID: 707153f5-2237-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717480697; x=1718085497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uH+BGHloHPFoY0kqG8mJDWzQPeJf/eNSm7qnnCIt5L0=;
        b=deY51aWo9stAgkIeGbpfogXb5IbOwNpNzmeEiumAFORd19lm4R7gYIu5sx5cT+oFLG
         TcwL79dtW3+zLW2xcP+oYmdoZC+BznRPug8b78bSXM6PMFBvng5z0LOvxtVK34IFiJy3
         iR9yHd+9p35+BPjGTzZrzFbqFU2yz86pG8phP+1IAiH1n3yRGMZQdVeOaGpalApUMUGf
         HtApS8YcLMdjjPgEt6fZ5YKZlpli71mFZTMCnHQtX5ZBKmseUFzbNQRN/EpHPAq99kx7
         zyod3yMztnIm0OvRL3YS5LHKFIWltMOf1W4C6dmTASzxghmmxZNDW8FcTF78cbyiiT6q
         LqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717480697; x=1718085497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uH+BGHloHPFoY0kqG8mJDWzQPeJf/eNSm7qnnCIt5L0=;
        b=CtbCdpW0R3u2CseOWJJ9vEXpR689PXuQvZDa95/0QeGdIM1czCTOQkRdjogCKuddK6
         DxornH5/yNtVTsc5YgHRXPNdtYJ8NMThmb2JHaVFCqbfuKNWACBcTEeFW2swcfvC0+Wh
         dGVaUlgkDK1/3Lomcnu996VZBztZX9NJtnmCJcDbLMxMf2c/cMdMzw+zwyJgFH87jysf
         9qO2to0u4hKR4zCv+vkZz6sZ2nU7GKk/edgRgOZO8/SRF0Zm57tkwTW+Ow0cvE8cBPLa
         sL12HEHq2qrAzjpkJmo2v33yZDxwaKGrudgCYBKexVPx+rSYaQ+hEIE4pohfJvHBhu6K
         e4zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXm88JsfzSkSu+4hzgUYu0RWhu0XQVGcwh3oepVknRDuareNbmWIzAMxua75hy6gmu1c2Sf1tJh6GUKUM+YB/ZIYYCKYn8dHX59Ed26Tw=
X-Gm-Message-State: AOJu0YxGUXSxERoHBz1RWPcSIN9A1Q1Ys6fK3e2ZP5ENBH+/Lulq2zGH
	G7dfbolC7M6uDWJXQ7rIqfZ7CCQL1mSZkdYjmk3akhn1R1H99mLhWZwweKYKaw==
X-Google-Smtp-Source: AGHT+IFz8CdByCZJp+SLd3/pBsKmAP5L+rIMGT7Jq9wJR9wz5gbJ5llKKpYxALXtibxKgjcMmHjcjg==
X-Received: by 2002:adf:f504:0:b0:354:e021:51ce with SMTP id ffacd0b85a97d-35e0f25c3b6mr7207594f8f.12.1717480697205;
        Mon, 03 Jun 2024 22:58:17 -0700 (PDT)
Message-ID: <917fd5f3-9b0f-467c-bc70-3b22a569afe6@suse.com>
Date: Tue, 4 Jun 2024 07:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/5] x86/domain: deviate violation of MISRA C Rule
 20.12
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <a8fe5f64e46e8980e1740583d59b95f88270f426.1717236930.git.nicola.vetrini@bugseng.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a8fe5f64e46e8980e1740583d59b95f88270f426.1717236930.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.06.2024 12:16, Nicola Vetrini wrote:
> MISRA C Rule 20.12 states: "A macro parameter used as an operand to
> the # or ## operators, which is itself subject to further macro replacement,
> shall only be used as an operand to these operators".
> 
> In this case, builds where CONFIG_COMPAT=y the fpu_ctxt
> macro is used both as a regular macro argument and as an operand for
> stringification in the expansion of CHECK_FIELD_.
> This is deviated using a SAF-x-safe comment.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

At least for the time being; plans that Andrew vaguely described my
render this unnecessary down the road.

Jan

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1084,6 +1084,7 @@ void arch_domain_creation_finished(struct domain *d)
>  #ifdef CONFIG_COMPAT
>  #define xen_vcpu_guest_context vcpu_guest_context
>  #define fpu_ctxt fpu_ctxt.x
> +/* SAF-6-safe Rule 20.12 expansion of macro fpu_ctxt with CONFIG_COMPAT */
>  CHECK_FIELD_(struct, vcpu_guest_context, fpu_ctxt);
>  #undef fpu_ctxt
>  #undef xen_vcpu_guest_context
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 9a72d57333e9..335aedf46d03 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1326,6 +1326,7 @@ long arch_do_domctl(
>  #ifdef CONFIG_COMPAT
>  #define xen_vcpu_guest_context vcpu_guest_context
>  #define fpu_ctxt fpu_ctxt.x
> +/* SAF-6-safe Rule 20.12 expansion of macro fpu_ctxt with CONFIG_COMPAT */
>  CHECK_FIELD_(struct, vcpu_guest_context, fpu_ctxt);
>  #undef fpu_ctxt
>  #undef xen_vcpu_guest_context


