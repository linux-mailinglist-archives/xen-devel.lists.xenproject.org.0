Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083CD8FFD10
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 09:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736297.1142321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFTyI-0003rd-TW; Fri, 07 Jun 2024 07:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736297.1142321; Fri, 07 Jun 2024 07:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFTyI-0003oa-QE; Fri, 07 Jun 2024 07:25:10 +0000
Received: by outflank-mailman (input) for mailman id 736297;
 Fri, 07 Jun 2024 07:25:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sFTyH-0003oU-7F
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 07:25:09 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1098eec4-249f-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 09:25:07 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4215ac379fdso17145215e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 00:25:07 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4216b398fd8sm9591025e9.23.2024.06.07.00.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 00:25:06 -0700 (PDT)
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
X-Inumbo-ID: 1098eec4-249f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717745106; x=1718349906; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVrIoBIptPdTqxav+phPDj10YQpzRTktNuWTKABvlOU=;
        b=LeQFUuWjoSHEMSyoDi2aVFVyYdng6IfJ6Aw5kOypBsMOyH952kAcCt6Qh1mQFJ4jXr
         Pk4btFMiWetzxt38TPja3Gsm9HD+3INg+jv20Iogkfb3lV3leQONbz1VV0RmGMfPmv2/
         cCqvealup139A3j7SPE+FeLIeSLUTFvhkaW6GAhGuJef87QAVJqNuk+TpC6PGHd9gPAd
         2eCgNuH3Z3+xrxMsfTv6NCBZXE1L7UB0xoZ69DUTvEFlqgZaujKec2QHTdEzznsDGl0C
         lps7ywJ8nnD3JZbU5rVzL7oF50+s0g5DqltRBgMnocPPzP2pPsKHrFXOlob9iy4tsWjN
         nmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717745106; x=1718349906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVrIoBIptPdTqxav+phPDj10YQpzRTktNuWTKABvlOU=;
        b=sZ3swtP29PJ4lgKKJQ2iJXAe5p+K8KHpspPPbb2TuZquObUJNg4dWvy61wesVXl1AV
         ZV4WiC2Uovc20guwssLIKMQ6rQDaloMQKPlIw461qP+zK+k2XfHoRBEWcfWBrXfqYzWn
         xmv9Eei24grHhlGpQpsTgRhNpqFvwVbRuIFPsbQBLQmzaGGYGuvv0RnGQ0diI04NZ03/
         spK01C3Pr9Xauk7BxvQiLGkmkraYSxidNYhKfSfVTWOif1TF2szNq0POsUC4ZdgHOP2U
         praI38OOTY7ff1VFyQ7t3cOx0elf7FPcaJxbAY1jzPBMM8j6OvZK6I/TtYHcBUFW6fVL
         fd3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXchgzJO3hTcsYSBXeEJ+ieGUtO93qEo1kXs1EW8U/spCFzhKutcNgKur9UQSCxFh7BwAscUAvumZnYYSwoMHibgLn/e/mwm3+7JDaYCes=
X-Gm-Message-State: AOJu0YzfK7Jwro8pZ8rmMdDzT+wt/FmDIN7ijH18OqPL78ZN+1Dp+Rmx
	LCFoxoPwnVDIlUbqxUKdBiAjnHgvnveICyxHc6mkcuEglBEkIJHYwRCDbmsULQ==
X-Google-Smtp-Source: AGHT+IFac/sceiIusDUvpOuRVCoxkNuzRoQAOooXFeVtDpx+Tdm7VI5MK3Gb7z+SEazebT9QSaE5ag==
X-Received: by 2002:a05:600c:4f86:b0:420:1125:dd79 with SMTP id 5b1f17b1804b1-42164a2eed8mr18927465e9.31.1717745106462;
        Fri, 07 Jun 2024 00:25:06 -0700 (PDT)
Message-ID: <7493c91c-070b-4828-a7f9-15d618d49ce5@suse.com>
Date: Fri, 7 Jun 2024 09:25:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 02/16] x86/altp2m: check if altp2m active when
 giving away p2midx
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <9306d31184b8e714c3a10ccc6a2b2c6a80777ddb.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9306d31184b8e714c3a10ccc6a2b2c6a80777ddb.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:09, Sergiy Kibrik wrote:
> @@ -38,9 +34,13 @@ static inline bool altp2m_active(const struct domain *d)
>  }
>  
>  /* Only declaration is needed. DCE will optimise it out when linking. */
> -uint16_t altp2m_vcpu_idx(const struct vcpu *v);
>  void altp2m_vcpu_disable_ve(struct vcpu *v);
>  
>  #endif
>  
> +static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
> +{
> +    return altp2m_active(v->domain) ? vcpu_altp2m(v).p2midx : 0;
> +}

While perhaps okay this way as a first step, my general expectation
would be that with ALTP2M=n there also wouldn't be any p2midx field
in the respective struct. Which in turn will mean that this code
would need re-doing again, and perhaps again splitting between an
inline one and a decl-only one. With that I wonder whether that split
wouldn't better be retained right away.

Jan

