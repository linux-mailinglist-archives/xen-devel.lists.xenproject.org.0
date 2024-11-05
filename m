Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4139BCD2F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 13:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830207.1245129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8J80-00022w-Jg; Tue, 05 Nov 2024 12:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830207.1245129; Tue, 05 Nov 2024 12:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8J80-00021N-Gt; Tue, 05 Nov 2024 12:57:48 +0000
Received: by outflank-mailman (input) for mailman id 830207;
 Tue, 05 Nov 2024 12:57:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8J7y-00021F-Pq
 for xen-devel@lists.xen.org; Tue, 05 Nov 2024 12:57:46 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c0170e9-9b75-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 13:57:43 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-539e3f35268so6636804e87.3
 for <xen-devel@lists.xen.org>; Tue, 05 Nov 2024 04:57:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113e595sm16188373f8f.77.2024.11.05.04.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 04:57:42 -0800 (PST)
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
X-Inumbo-ID: 8c0170e9-9b75-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmUiLCJoZWxvIjoibWFpbC1sZjEteDEyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhjMDE3MGU5LTliNzUtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODExNDYzLjQ5NDY5NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVuLm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730811463; x=1731416263; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vb/L1a/IINIiB4BFiQ2QU4P/qDW7CMhHBBpZC2ykKYo=;
        b=Jm2mMzkY9Dhe5bI2WwG40VQEFWjzdx9wPwa6G0ZvLlHV45fdv+CKELQshVjitSK4q0
         GYBllV6oTFg3LeYzoealQi0cr2EGMwBorGrfahm+wrhG0lArG+PGETjf57xvGdCA38Yp
         HvoYUSo8WK3Vvz43ijYXGorRDQ9USZHSAu3OktfivXYd/HAkMYtTnNXJQgSlqlCMllO/
         LZldErtNrSiC02tmFtBOd4O7Z1VK0kypOeAkec/EtdiC9C30dug8xfFP7X4I86zaU7vB
         yDY9stDg27xAkTUv0QvHnVcUZCmhmtaCL1Na+VjzXeOTZcSY4SmwVMfDp9r3Vcp/ASXa
         H7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730811463; x=1731416263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vb/L1a/IINIiB4BFiQ2QU4P/qDW7CMhHBBpZC2ykKYo=;
        b=vyZGj2pBA2FYIa98P1hOs2tHs+UwUu1uO7TkC8HiZf85YI7+GONXZ/ppz8m0WKDiF0
         kq/jPoM7EfQB9lfzHZSiHRoHoyoKXbmqNnSvFEVo+jHp3z63Dni7eTu2vvqSBq41yil9
         /ydz3u+gQhcMN2QVxHXpmXtjOkHJqswVFodleqTu+1jGenaVRbzyd9LaU6upPieUSt7E
         q3zR05bvsHaTFgoFGJOaf7upRUVjoc0rN6I1J7dDr7PgyR3o7OvkX2gbhUhDaDbjaOIk
         Jhd7pe/1mNNqhUw63+jWj1PYZhnCGElh1Oh1CwWiuRUw7f15ZxDB/+GmrW0dI6c0jVs2
         rC5g==
X-Gm-Message-State: AOJu0YzwJPXQGz7DTqcA5tTDElKIhNTiz8M3fvK+vnmwfclpVo0eo9wM
	MiYLLzE0GDWVKJw+QQdA04Dp0L7EK68kTL1CJMueE8w2fUUy96daFpPnN/QoIA==
X-Google-Smtp-Source: AGHT+IE44RFS6YXZKbwmoeHy/Cwj7HiRI4Okz7N6T/qhEjIIBN4JUadPtCBl/hTTVNLhRDWMefaG/Q==
X-Received: by 2002:a05:6512:1089:b0:535:645b:fb33 with SMTP id 2adb3069b0e04-53d65de5606mr7534011e87.2.1730811462845;
        Tue, 05 Nov 2024 04:57:42 -0800 (PST)
Message-ID: <a111a4d4-66cf-4270-ac53-0e18288ad9ee@suse.com>
Date: Tue, 5 Nov 2024 13:57:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drop setting XEN_QEMU_CONSOLE_LIMIT in the environment
To: James Dingwall <james-xen@dingwall.me.uk>
References: <ZyoTBgbGGYTyphH6@dingwall.me.uk>
Content-Language: en-US
Cc: xen-devel@lists.xen.org
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
In-Reply-To: <ZyoTBgbGGYTyphH6@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2024 13:43, James Dingwall wrote:
> Hi,
> 
> Since qemu-xen-4.18.0 the corresponding code which responds to this
> environment variable was not applied to the qemu tree.  It doesn't make
> sense to me that it continues to be set in libxl so here's a patch
> which removes it.
> 
> These are the relevant commits for various qemu tags:
> 
> qemu-xen-4.10.0: c349189772cec43498b0bec8a84146f10b8937af
> qemu-xen-4.11.0: 2b033e396f4fa0981bae1213cdacd15775655a97
> qemu-xen-4.12.0: 4f080070a9809bde857851e68a3aeff0c4b9b6a6
> qemu-xen-4.13.0: c81d7597747f29432a0e197bf2c2109e77f2b6cf
> qemu-xen-4.14.0: 410cc30fdc590417ae730d635bbc70257adf6750
> qemu-xen-4.15.0: 677cbe1324c29294bb1d1b8454b3f214725e40fd
> qemu-xen-4.16.0: b6e539830bf45e2d7a6bd86ddfdf003088b173b0
> qemu-xen-4.17.0: 9a5e4bc76058766962ab3ff13f42c1d39a8e08d3
> qemu-xen-4.18.0: not present
> qemu-xen-4.19.0: not present
> 
> If this is approved is someone able to apply it to the tree?

Once approved, any committer will be able to. First, however, like any patch
this one also needs a (your?) Signed-off-by:.

Jan

