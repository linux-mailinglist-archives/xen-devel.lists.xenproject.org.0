Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F839ECAD6
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 12:07:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854586.1267757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKYC-0002Pc-QM; Wed, 11 Dec 2024 11:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854586.1267757; Wed, 11 Dec 2024 11:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLKYC-0002O5-LH; Wed, 11 Dec 2024 11:06:40 +0000
Received: by outflank-mailman (input) for mailman id 854586;
 Wed, 11 Dec 2024 11:06:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLKYB-0002FC-KM
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 11:06:39 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe8034e4-b7af-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 12:06:39 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso3341992f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 03:06:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef7ad1293fsm8215969a91.34.2024.12.11.03.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 03:06:37 -0800 (PST)
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
X-Inumbo-ID: fe8034e4-b7af-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733915198; x=1734519998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FVwGXCYqnGM2KQQ89YrkC8wzN7koOMttXNKxKa5aFa0=;
        b=ZzrTWSyGA8k5OfEI0rH4xBsLBbasM3POTMlGbLYKap3gdKDrIXoM5AbrXwCBPWjOXS
         yCWutNWp8s0uoHbDBQDIF+WUyL89KLoZz5dinPGLgLsX26/Ox1DDSx8/1t1yxNn8hXOT
         LeMk4pBo4nmpoFbBVanJgvfE78b4TKQAc4Z7jTttGKmG40xd/4a4HK8EwdA3SJ9eR/VS
         TiWSJgjd46LYnKG8h9MtpOVhoG50jIRySWZMTks0K7QckFChzrbgr3KPiEU+BRfEK/EA
         If91t5153auFCNUTfDQQWnA/XVc2G94zHA4wD42lFlUVKJ8Nkgbld1tO7sYAwj2tq6EK
         xwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733915198; x=1734519998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVwGXCYqnGM2KQQ89YrkC8wzN7koOMttXNKxKa5aFa0=;
        b=J371zh8PIfory2xw+j0bVzlmn7IRfMZOQTZk277+R9k8WgifM6trrpdiYFccCRubYX
         Gl5Fs1+Sy8DkF6AMxB5SeRdYS5avF+baWUux+/slN2NAYgigmA5iBn+Uyy22+hqaE0Dj
         1cJtXfGwZgSQOpUrGlQpev0rChYyFyjZ3IgUyg7fPj2SsxK0sCol+D1bNTDF6XwmmoWU
         OmHDx3ZVv8IqBJVLWAMjWT+xOs7H0xP0z1U5DehA4Gfsp8mDHUsjqCdFRMhnkuFnxEHk
         4GKd7EtSNzxlr+xvyvDKtoCVXmB/J+AAcNpaycM/xuiCuNdO7J10UdntdBVL5TkU2f7h
         D6ig==
X-Forwarded-Encrypted: i=1; AJvYcCV46yTrZWbNCu53sqrA+M3iwOXi0NofqTLO2FgCJf2V5fTpSdmWZ2kYIZ1OlcvQwTDlbb2wP49tAcw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFXwPuYgdp4XDRuNuJoe5AuhRegLZ4vPDVqzgZUBKYHINWsH8E
	Vn9geDtCIviBlZoH+3fFyqYvO3hP9e8YNAUq91n2IDUP2TNkKYI/hMRV5w7VHQ==
X-Gm-Gg: ASbGncs/MIlXnNe8L8dRy2UIw/pmGvZ1OE2kDFvn657hhM+zVoIN98cozpjGwvRJ+Br
	xs8wqSlYLSKymKCXami7ApE0rFpQXZnOzM9QrRwMgJfzyeKDAEcaW0+VmLfFrn3UD1u97ru2eCI
	QQEkHee9vP6WFbxW7FUpOg+WX9g6ra8cPN+/gH13IcTA223zL7noeC25DbZYJuMsoj09bx8P6eZ
	EIORDLvD8xwKmqSxZ65AZ4XgWGHuXpKtQHh5e0NMsXKvaXL3AXv80GppQWIzeVftqS5tL5roq7L
	JXHIKT2TOx7vwM/OGDT4Ne3yCOpiLD1jvv/eG4M=
X-Google-Smtp-Source: AGHT+IFo2h5iCBNMatHzi43MTB9SpwrqCPAQGJSUAmvyLhBVco2wnV3x/O/n7wj2BfhgDtD10oV1PQ==
X-Received: by 2002:a5d:64c2:0:b0:385:decf:52bc with SMTP id ffacd0b85a97d-3864ce606b1mr1667407f8f.32.1733915198424;
        Wed, 11 Dec 2024 03:06:38 -0800 (PST)
Message-ID: <9e373326-5b20-4d47-ab3c-3b33da2d03c8@suse.com>
Date: Wed, 11 Dec 2024 12:06:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] tools/ocaml: Specify rpath correctly for
 ocamlmklib
To: Andrii Sultanov <andrii.sultanov@cloud.com>
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Fernando Rodrigues <alpha@sigmasquadron.net>,
 Christian Lindig <christian.lindig@cloud.com>, xen-devel@lists.xenproject.org
References: <cover.1733766758.git.andrii.sultanov@cloud.com>
 <e2caa6648a0b6c429349a9826d8fbc4338222482.1733766758.git.andrii.sultanov@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <e2caa6648a0b6c429349a9826d8fbc4338222482.1733766758.git.andrii.sultanov@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.12.2024 18:57, Andrii Sultanov wrote:
> ocamlmklib has special handling for C-like '-Wl,-rpath' option, but does
> not know how to handle '-Wl,-rpath-link', as evidenced by warnings like:
> "Unknown option
> -Wl,-rpath-link=$HOME/xen/tools/ocaml/libs/eventchn/../../../../tools/libs/toollog"
> Pass this option directly to the compiler with -ccopt instead.
> 
> Also pass -L directly to the linker with -ldopt. This prevents embedding absolute
> paths from buildtime into binary's RPATH.
> 
> Fixes: f7b4e4558b42 ("tools/ocaml: Fix OCaml libs rules")

Just to mention it: The hash is that of a backport, the staging commit is
8ffcf184affb afaict. Please use the canonical (staging) hash whenever
available.

Jan


