Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE338271B5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 15:44:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663551.1033499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMqrO-0000HQ-Qw; Mon, 08 Jan 2024 14:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663551.1033499; Mon, 08 Jan 2024 14:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMqrO-0000FD-O2; Mon, 08 Jan 2024 14:44:14 +0000
Received: by outflank-mailman (input) for mailman id 663551;
 Mon, 08 Jan 2024 14:44:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMqrN-0000F7-SK
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 14:44:13 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 637adc07-ae34-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 15:44:12 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cd08f0c12aso18994081fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 06:44:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b0035ae9f62692sm2449990ilc.88.2024.01.08.06.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 06:44:11 -0800 (PST)
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
X-Inumbo-ID: 637adc07-ae34-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704725052; x=1705329852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dZpn+YFnODHl51b0wZVOEo9Yh5JBs/xhGWoMpOaSkDg=;
        b=Vdlct8N8hxbwecLk2PXgNZXVFOv3bOMyi8ZNaS4azpZacJuBHIbF5bfGMWcpSZD9rD
         Y90J1XU4VzhPSx2sDSgnBsgU21tfJbSHqgTw4Vblmv/jHdgFN4Tob9HWO5MHXaOmnRrS
         l69FT9rHXtPsVxX1uLP1tSmqttoEr+74a0kPuHioJcm8CQbolHwXQtG5OR+IvR4eitE/
         hODFSfmKFSHYIV8EWf4MORi2kjpjxK/5fFga1NOpnGXIpqq2DsvmDC0t3fRVkbyvEKwG
         SEP859na34QOi6nuVtgn8sOcZaXpzdI6ZTSrpLdnmwux4FlOVXVOjgKymL66uGkt3tHa
         W5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704725052; x=1705329852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dZpn+YFnODHl51b0wZVOEo9Yh5JBs/xhGWoMpOaSkDg=;
        b=RLiz+4b/dH9J2xyY2Tu/lRhQTYOzMmFXWSCsz+H/moteJDbqAqtcsRLIJC5hzTLjpn
         Gqoue+/Zu3cahRLVXEZF5ZcFe+kplAzV4okVUKry21avEgSEye3ujwCGgIbBiUBcnHyd
         hzK0Oo8++zrmg4lMX6g3nn2uoBCTRFNLZZI1qRagVYAzaW5lIjhva+GnU7uqNZTjHgjE
         l/zUOdcweVhredFJ0OPT9ih/1bXsvPcour49nr+hO9NbM5vLRnveDGxyHb4Sl6+p23bF
         ARnMmrrO8cdGTfoeHHJwuld+xlg1oyWIZ5arWuE2El4SCx+9zDbZtrzMB8bfJeX5Dipy
         A29A==
X-Gm-Message-State: AOJu0YxmbyvhTF868wb0lt2nfnyXYZjQQgFYgE9/St/7KibPBdlm1t3x
	UoojT+PF760oNixgbB85pxP9V53/3giV
X-Google-Smtp-Source: AGHT+IHeNvHUhoLlBcrrCMKxkMXAAN/4sqXRkNtZ5Hyb4fBlKlhFo05+FGvQQEmQ6E9EH+jX0U4w1g==
X-Received: by 2002:a2e:b609:0:b0:2cc:8648:7d40 with SMTP id r9-20020a2eb609000000b002cc86487d40mr973584ljn.60.1704725052102;
        Mon, 08 Jan 2024 06:44:12 -0800 (PST)
Message-ID: <05f088cf-4736-40d4-9f4b-1f6120e12a08@suse.com>
Date: Mon, 8 Jan 2024 15:44:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC] x86/uaccess: remove __{put,get}_user_bad()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
References: <9cf852da1c03b614bf5010132c58a18adc2a4161.1703155225.git.federico.serafini@bugseng.com>
 <a2050ac1-e205-4d7f-b9b1-aa625136e63a@suse.com>
 <0c5bbfde-4cf0-4878-b1ee-ccc8eb775464@citrix.com>
 <eb53449bd6595ea0931460e62dd57b9c@bugseng.com>
 <1330c757-1ca3-4b07-898b-799cbfa67e8a@suse.com>
 <6a39fe3e-524f-4e39-81bc-ffb3d48ba306@bugseng.com>
 <192c393a-3702-4cc3-af60-e2711098ec6d@suse.com>
 <8fa1f868-c7de-4a46-a827-a75c38513f6f@bugseng.com>
 <19d5c152-3ab7-4762-980b-3570d3a948e4@suse.com>
 <7ecb7703-25c6-4295-946b-7b9aed7b3c67@bugseng.com>
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
In-Reply-To: <7ecb7703-25c6-4295-946b-7b9aed7b3c67@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2024 15:01, Federico Serafini wrote:
> Additionally, looking at violations of 16.3 on X86 [1],
> I think we should also consider generate_exception(),
> ASSERT_UNREACHABLE() and PARSE_ERR_RET() as allowed terminals
> for a switch-clause, do you agree?

No, and iirc this was discussed before. ASSERT_UNREACHABLE() is a
debug-build-only construct, so unsuitable. The other two aren't
global constructs, and hence shouldn't be deviated globally.
generate_exception() at least ends in a goto anyway, so why would
it need special treatment?

Jan


