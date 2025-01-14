Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CECA107D4
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 14:31:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871371.1282382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXh1E-0003xM-57; Tue, 14 Jan 2025 13:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871371.1282382; Tue, 14 Jan 2025 13:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXh1E-0003vP-2I; Tue, 14 Jan 2025 13:31:44 +0000
Received: by outflank-mailman (input) for mailman id 871371;
 Tue, 14 Jan 2025 13:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIyo=UG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tXh1C-0003vJ-QF
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 13:31:42 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e34c0fdd-d27b-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 14:31:40 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3dce16a3dso3150306a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 05:31:40 -0800 (PST)
Received: from [10.81.35.177] ([46.149.103.13])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99008c371sm6306505a12.11.2025.01.14.05.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 05:31:40 -0800 (PST)
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
X-Inumbo-ID: e34c0fdd-d27b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736861500; x=1737466300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1mZ4UKGSguy5EH1X+T6Zge+QtjJs/EqNiKAuaEiMZPo=;
        b=XBvqwdmXXjWoaUxpHXBwEfHBeUO1yFLRuKbKpipfH5REHl6gelMQ18Fh4VTy/Embes
         mVVoEYemjqCEjGny2HYXlbllju3FbkvvvAy7K46fxA7ZjRYhRW2suqKWS4S0z4DQGYxi
         MmzyBeLiC75NdZz4yteU4HyPRnqKedzXwzxj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736861500; x=1737466300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mZ4UKGSguy5EH1X+T6Zge+QtjJs/EqNiKAuaEiMZPo=;
        b=hLKwzmqddmT49X49F+sRBWqGNbMXg5OSfdBNWqpOI+tFOCiHXF+x8w6QdEnGymJmti
         rre9puwhuSwKGkt8lSALJdSn1jcr19tOGUT7jMh7WzzYKSEsAPJGzMpNuARrdYJhu48U
         6Ts15mDOdJH47SJa41pQDCDsZ5ih0r+kT4tG1QGctlQgVm8v7/UfjdbuOEmYMT7Eq2Ke
         /xDMBkiL+Wu+W/xuEHzH1v2u2Eh7G1shADihCt0UmzGtlGpVr8YqQMY9DCwq2SWNZCS6
         /BBepkEX1daJJCJy20cZpvsczYS12E18w0wW63qqKnuLbcyJguY0zU2L9QZ6SMwmoxdP
         W3sg==
X-Forwarded-Encrypted: i=1; AJvYcCUyqORYaT4/fdWckRSQRYzc2OJASISK0Yzf7l/nUvE/DXsrPI+o+RcHaBFsIUCd6Ik5cuk4IZEvGW4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzr3kb0KrLPseIgKuuQfwahGllevWR+EhbVOUXez8ijuOMKGw58
	uXHD8DrI9aC5L/XqW2ZZl0yY0y5JXBFA6+Gd7ZR7UlIfOfgnRvAIKdwK6wuteUU=
X-Gm-Gg: ASbGnctbg+Tjvz/nqGc3R3Uj+PZJlmBNLVNKLxbZATd2z/Ko5KVAXphyx27TVc8WzoC
	Pusz1r1MLOEkdR/ZBhVMeQlbFyNFU13bXc30H13zMNEd7meKvDORIBtdgcOtZad0gJS77f5aIHD
	uPfChCsQx3TPftMP2rPDjuOCfEtWGf1qttefj1/HHTHCDtCncWuvhSihASpZRUnhGmKX7Q1hZLq
	tyQG3GBZF4Gk/7dlum73RnRSiJv5Egl1W4HyOXf8WNVhK0Pmd6fapOsQHbvyZHLfvc=
X-Google-Smtp-Source: AGHT+IFwog1UhQPheOAqtdtkToqjWjCmu/jYaKfgfHp/BWMgJbQbJx8chnusOkgGiuW0NkfSCs03jQ==
X-Received: by 2002:a05:6402:3903:b0:5d0:e7a0:154a with SMTP id 4fb4d7f45d1cf-5d9861d6778mr19187939a12.8.1736861500419;
        Tue, 14 Jan 2025 05:31:40 -0800 (PST)
Message-ID: <99a23fc3-3181-4c28-b9e5-8cb98ef907ce@citrix.com>
Date: Tue, 14 Jan 2025 13:31:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xl: properly dispose of libxl_dominfo struct instances
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <4460f13b-03bc-4ca0-aa97-facde3122be4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4460f13b-03bc-4ca0-aa97-facde3122be4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/01/2025 1:29 pm, Jan Beulich wrote:
> The ssid_label field requires separate freeing; make sure to call
> libxl_dominfo_dispose() as well as libxl_dominfo_init(). Since vcpuset()
> calls only the former, add a call to the latter there at the same time.
>
> Coverity-ID: 1638727
> Coverity-ID: 1638728
> Fixes: c458c404da16 ("xl: use libxl_domain_info to get the uuid in printf_info")
> Fixes: 48dab9767d2e ("tools/xl: use libxl_domain_info to get domain type for vcpu-pin")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> ---
> v2: Add call to libxl_dominfo_init() to vcpuset().

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

