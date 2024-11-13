Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D17B9C718A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 14:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835724.1251586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBDre-000095-B7; Wed, 13 Nov 2024 13:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835724.1251586; Wed, 13 Nov 2024 13:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBDre-00006G-7r; Wed, 13 Nov 2024 13:56:58 +0000
Received: by outflank-mailman (input) for mailman id 835724;
 Wed, 13 Nov 2024 13:56:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gr6F=SI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBDrd-00005d-3W
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 13:56:57 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 224c80f4-a1c7-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 14:56:51 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so959481366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 05:56:51 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e2eb33sm882613966b.186.2024.11.13.05.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 05:56:50 -0800 (PST)
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
X-Inumbo-ID: 224c80f4-a1c7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIyNGM4MGY0LWExYzctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTA2MjExLjk0NzIyOSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731506211; x=1732111011; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CkMksHRHUDS7fxvNUwEysWZTb/Obs7BtWJoYnIcAhlA=;
        b=q0nozoAuJppaBaBhE2WuJCqtbRy5IMRXTDltUYGBciV58SjpxpKSZGPcBsKWVoMO2n
         WOGINRUnqcT4Tev7BDPEzbi9cIL1Z0YfO5ATfs2bU4xCqIvSso4tfE7FBsrB1GEA2jcE
         cNIAqFR9/BfPXYH6nwDclAhOQcyvwSnyfn0YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731506211; x=1732111011;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkMksHRHUDS7fxvNUwEysWZTb/Obs7BtWJoYnIcAhlA=;
        b=q2vvBGJ7wWp9YlJAKpttyyd8Kvgtjt/L70x9kDH614u2RlQfrrtY7VSgpiA2A5e4uH
         czkDqKLKLi1B82VhURNnRDABWIACuvoeNBrKQKjzEimCjnzbBJGsFKeDdx28DZbFs03F
         UPCqan8F51Jz9GppqkzBebZF4+qTAojv7kJeNlpePgBxkXoVyz//GRS0Ps9t1J4OaUy+
         ldaveujw+N5zt1b0CPAsaAO64sH7uI6ImiFZ34awdNIw6RJeKKnxTtDWJWx1zrWwztjv
         9nDoERwr2hkx410/766tEnQ6SUt0sSr4DVESSikmA8K+OJx8RMVgNCWqCk2kkzPKMaBz
         P8AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyfU64uKro2sPhzy//ci9DmrMLOIE1pAcP0+Zy+kix6dS7ZYpeo6/6DeYV+BFx6RFT0OWkOS1ZwX8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2DxpRbmJ2FJVVl/WjP9ZhhatstsilBDMB8FRsKKaDZNYqAQTu
	7WENlpy3Sbgb6vjeMtgXq8nFgcS9SF2e6NRfkiPfGRDVqFZpYAz1IQtclO5xwsY=
X-Google-Smtp-Source: AGHT+IF/RDN2iia2bg+X8k9+T+nEH0Hb0Jjzbkp94qlwy3b64o/OKrduiOzk1ekgTECdlfuI00ybeA==
X-Received: by 2002:a17:907:d8e:b0:a99:c075:6592 with SMTP id a640c23a62f3a-aa1f813b80amr188492366b.56.1731506210663;
        Wed, 13 Nov 2024 05:56:50 -0800 (PST)
Message-ID: <c70cee00-d5d3-40cb-a1a3-e581f0db4d10@citrix.com>
Date: Wed, 13 Nov 2024 13:56:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: avoid double memory read for RORX
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <655bd278-b3b4-4c7c-876c-ff5af335b4f1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <655bd278-b3b4-4c7c-876c-ff5af335b4f1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2024 11:21 am, Jan Beulich wrote:
> Originally only twobyte_table[0x3a] determined what part of generic
> operand fetching (near the top of x86_emulate()) comes into play. When
> ext0f3a_table[] was added, ->desc was updated to properly describe the
> ModR/M byte's function. With that generic source operand fetching came
> into play for RORX, rendering the explicit fetching in the respective
> case block redundant (and wrong at the very least when MMIO with side
> effects is accessed).
>
> While there also make a purely cosmetic / documentary adjustment to
> ext0f3a_table[]: RORX really is a 2-operand insn, MOV-like in that it
> only writes its destination register.
>
> Fixes: 9f7f5f6bc95b ("x86emul: add tables for 0f38 and 0f3a extension space")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
> --- a/xen/arch/x86/x86_emulate/decode.c
> +++ b/xen/arch/x86/x86_emulate/decode.c
> @@ -521,7 +521,7 @@ static const struct ext0f3a_table {
>      [0xce ... 0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
>      [0xde] = { .simd_size = simd_other },
>      [0xdf] = { .simd_size = simd_packed_int, .two_op = 1 },
> -    [0xf0] = {},
> +    [0xf0] = { .two_op = 1 /* Mov */ },

Obviously not for this patch, but "Mov" is an especially poor
description for this behaviour.

DstSt (vs DstRMW) would be closer to our existing terminology, and
clearer IMO.

~Andrew

