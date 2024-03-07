Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C004C875B12
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 00:24:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690062.1075718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riN4d-0005Ee-I6; Thu, 07 Mar 2024 23:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690062.1075718; Thu, 07 Mar 2024 23:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riN4d-0005Cg-FT; Thu, 07 Mar 2024 23:22:51 +0000
Received: by outflank-mailman (input) for mailman id 690062;
 Thu, 07 Mar 2024 23:22:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXJj=KN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1riN4c-0005CT-Bp
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 23:22:50 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b6960ea-dcd9-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 00:22:47 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-413131d40f4so2135205e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 15:22:47 -0800 (PST)
Received: from [192.168.86.29] ([83.104.235.82])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a05600c341800b00412f6f4dea4sm3901363wmp.41.2024.03.07.15.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 15:22:45 -0800 (PST)
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
X-Inumbo-ID: 9b6960ea-dcd9-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709853766; x=1710458566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ex4/icQFidJpYIkE03Yk5gfU4TXdYqbRCh9cL/On5yw=;
        b=KRTWRPbKbXeg0P1e+88hVExKPHY7F1Zfg9QeQaXzq+8hwOXyBKBW1BP2tYy5aTPFiR
         T8jwqK8mGcDWtSngRRMGA1E51nmileIaRkrC9WUehCAh4tQoy0SY1IpxMaLHfTf3SHVM
         NBXDxcZqOgTFvjl5/odrPEwtaY2Yxp2G/3Kvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709853766; x=1710458566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ex4/icQFidJpYIkE03Yk5gfU4TXdYqbRCh9cL/On5yw=;
        b=TafA2EFm8rY/lpXP8qt2pWxURh5QCgHlNgCcU/alnrhqPdYYsVtVTYaO8t0DIxyErP
         phzz+qI2x4sdYDRxY1ZGvDjWKkJG3+yUcOkxucAOLshM5C2oJQSmY0pKZprzY5cVODty
         zonuz0XvveQlWqqXI/hP24xONTTcZ0dIxWJR0Ek2bA/qt/i0IA/9DRxIuFEai4KdDgWt
         4yNHKl+nS3gS48DxPhdH3tiJySVmUAa468wNle7mgp1wrEAXKgN3AIXq2uT9YKMkVwQW
         +Ku+v16OV24a0Grkerw7gFq4WPPjgjFT4rvaPK2ZR6oP4xrnRkFTBbE5NzvSI1QKlo7P
         rVcw==
X-Forwarded-Encrypted: i=1; AJvYcCW+xyjk+WkTf3BwVl/0enSy/xouL29RtDhhwhegjTVODICqdL3/E5oUMYPMZoziZgUXI/2QIsnFTW/oQSAn5iXxc55GkfJB+z1LYT2zkPg=
X-Gm-Message-State: AOJu0YyFUZfCPmPfncq/WeJ75qkAEEElXBQ+jO/uTlctJm2ZaC+55h78
	pEySe42nNVbMJEwDpw9GRAP3m+fdfvWMa94xpVCMJTcEqx4yEXrkctJsZc9PzLo=
X-Google-Smtp-Source: AGHT+IFZUEYyiKHjj7IZb9ZbXpLPMXE8UTH/cW5RfvQq+gIh7tmbnBD909WrSTnRhGSfds8kxazd2Q==
X-Received: by 2002:a05:600c:4ed2:b0:412:b674:28ff with SMTP id g18-20020a05600c4ed200b00412b67428ffmr14664570wmq.22.1709853766416;
        Thu, 07 Mar 2024 15:22:46 -0800 (PST)
Message-ID: <b72f8767-b21c-4dab-8541-e45b1c2f9582@citrix.com>
Date: Thu, 7 Mar 2024 23:22:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/svm: Drop the _enabled suffix from vmcb bits
Content-Language: en-GB
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com, wl@xen.org
References: <cover.1709846387.git.vaishali.thakkar@vates.tech>
 <3c419824febca229cedf2a3bd42cb68d3a3d56a8.1709846387.git.vaishali.thakkar@vates.tech>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3c419824febca229cedf2a3bd42cb68d3a3d56a8.1709846387.git.vaishali.thakkar@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/03/2024 9:40 pm, Vaishali Thakkar wrote:
> The suffix is redundant for np/sev/sev-es bits. Drop it
> to avoid adding extra code volume.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>i

Typo on the end of your email address?

> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index e4e01add8c..7e285cf85a 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -706,7 +706,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>      }
>  
>      /* nested paging for the guest */
> -    svm->ns_hap_enabled = !!ns_vmcb->_np_enable;
> +    svm->ns_hap_enabled = !!ns_vmcb->_np;

Because the type of is bool, the !! can be dropped too while changing
this line.

It seems that this was missing cleanup from f57ae00635 "SVM: split
_np_enable VMCB field".

Anyway, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> and I'm
happy to fix on commit.

