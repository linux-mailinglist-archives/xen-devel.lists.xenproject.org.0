Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72132C72D54
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 09:27:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166575.1493068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM00b-0002Ce-Kn; Thu, 20 Nov 2025 08:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166575.1493068; Thu, 20 Nov 2025 08:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM00b-0002A3-Gq; Thu, 20 Nov 2025 08:27:17 +0000
Received: by outflank-mailman (input) for mailman id 1166575;
 Thu, 20 Nov 2025 08:27:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM00a-00029x-Kp
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 08:27:16 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8096fac-c5ea-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 09:27:15 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b735e278fa1so127691966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 00:27:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-645363b5fe9sm1524362a12.11.2025.11.20.00.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 00:27:14 -0800 (PST)
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
X-Inumbo-ID: b8096fac-c5ea-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763627234; x=1764232034; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GWCOFW6WLFvsPH+O+kr/D+58GC9J3bak8EY8+7MHnAU=;
        b=Z5ia/7/CuaW8qcZFcPbFMf9kyTQwiBdMwAc8P82QIF73yzUsOLBPi9Iwf6GRg9IC3T
         GbrOVpNYXzY5iqSViY5AE94z6gPm3dY+rDUeFor5Iw+PA1WWgJpQ/o5ehXnx/4Om+NVX
         c5OW7gUoVqR5Ee2AJ75opzQrZ+K+A8qfG82pLhGD6ANwh1+3diZifiW6u8er8rRVVgpP
         sYsmnR1ct5HcBj+D7EYRwVrkIFCUNDfpaVJWPKRZ9sGRDzHhfbzTGbCHmvQcHrDFynOs
         cYlwznr+gOpKRmYep18nmJYMz44GXEpyD7/d9/QeJgx+kr5tAS7XeA4LlLjKjeB6VAQz
         yMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763627234; x=1764232034;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWCOFW6WLFvsPH+O+kr/D+58GC9J3bak8EY8+7MHnAU=;
        b=bdR5+yZXKTaKlLXB/+lEaEERwOCEjokJ6S4aGap0SGAST8J8d/nsxmRoSYtgyBQhFx
         8FKu4Rt+q08I7WZ1hdhmVPoBuRQPSRRRT+rVKljEPUp53HcCZeHCdvnTrIMMxSWTDaz0
         Oc3Dvch/fC70wP1og4bOgRNocIwat4VW6z8miEUYhNYN6RThH5hqThrHIb6qlTZSm0r0
         KDBKk/7LSK/fR+2jlvNkjehSmGDENYYbcCe5RO5QHScCyLRLd+XVcfBlLSHnwbixj288
         g02XvRonJC6Xyhgu1h0ARo6ObrYzjaTl6eKTPIuPsbAEAoe1Mfy8nkghXSGJK6eT+bgK
         hZPg==
X-Forwarded-Encrypted: i=1; AJvYcCVa8bGSpWD4MbEIsj44nGKGGcAl8ghhRtagMhqj8pmupg+QHhanp0jbP0N/t4mx1J3//n3kF5EgOCc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWTL8sUkPzipD6IUmAOnA74j2jfvmqvyUdl+puIiBidREj168L
	eAjuT9siP85RCqThdsGJRq1/wEG+k1r8N8lvvoUHRpqGY8YLgsqbl/F0zzF1hnaasA==
X-Gm-Gg: ASbGncvIFJ5dRdudL9ilr7PXagt00Y0qSKK+oHUQFAPmnxNzG8BntwzVc8C/j6Vp8lh
	mWs6UuHMSWVlF8lNSwTHeURHyLhscwg+xwhH39FBmatVkSD003sd3dNYQgTxAcy1o/wmNfM5BiV
	wt3xd+fe+PbYQo+0ZG3IwgIjuz4UyKdt47droR/d3dHr335GlgNjrgYsaNCYiGQIImvaH0mPql3
	KwRM4loHaT3MX87hPKeLL/UDAcGffp1IsgrovrZbkTDxjytcgTGRGBi0EGrIvP3tnrZfUuM0lR7
	U0o2Yacn+D1h+cUGpWw2PG49Ym+RE1xZlKidaAPp91C2EYryywrJalliaHvEzG5dJrBNIdb7M4z
	c43F+xuy9RvooMY7QYaI6lvr7YbFnuPMRBKyjz2ZlrCHtX8CGHBITupCftvCNvN01wGwe2X7uw/
	Wmz3FHW7wA/jDQ9owYI0bdskxH9Vvc/b7XhzUz2o5LgxQJd33LuxR5BOK1k0p0oAf5cYmJspzmj
	bw=
X-Google-Smtp-Source: AGHT+IEEDEMmxnwvuTYTndLVeFHCdtFiUx40H8RFz/xZO5SzI0W2jXln4VZnGdNSAV6WfyKzk4LcjQ==
X-Received: by 2002:a17:906:f59b:b0:b73:9a71:13bb with SMTP id a640c23a62f3a-b7654fa2c37mr258575966b.32.1763627234560;
        Thu, 20 Nov 2025 00:27:14 -0800 (PST)
Message-ID: <6d38653f-8450-4bec-9650-db6af0cdbe73@suse.com>
Date: Thu, 20 Nov 2025 09:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen: Strip xen.efi by default
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Frediano Ziglio <freddy77@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>,
 xen-devel@lists.xenproject.org, Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
 <6729f3d9-618c-4dcd-93f8-d02ca7cea017@gmail.com>
 <8f8a769d-95ea-4554-8ee0-d6247f583e37@citrix.com>
 <CAHt6W4eDDm-fNUB7W1Zgj+x-bkK2fxTB50C38T4Uy0_Ofy_cww@mail.gmail.com>
 <aR3dFPTeH4Wegodd@mail-itl> <38ba402c-6920-47f6-91d3-7b499c407c36@citrix.com>
 <aR35jsEXBcV2uEFY@mail-itl>
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
In-Reply-To: <aR35jsEXBcV2uEFY@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.11.2025 18:08, Marek Marczykowski-Górecki wrote:
> On Wed, Nov 19, 2025 at 04:02:30PM +0000, Andrew Cooper wrote:
>> Given it's now only 16.04 broken, how about simply excluding xen.efi
>> with these broken toolchains?
> 
> That would mean adjusting README to say a newer binutils is required for
> xen.efi, right? Then ofc we would need to figure out which version
> specifically. FWIW Ubuntu 16.04 has 2.26 and Ubuntu 18.04 has 2.30.
> Would raising required toolchain version (for some configuration here)
> even accepted, especially if considered for backporting?
> 
> Alternatively, simply disable building xen.efi in CI on 16.04, and maybe
> document as "known issue" pointing at toolchain bug? Result is very
> similar, but might be more acceptable on the process side...

Along the lines of what Andrew said, the probing done would then want
updating. Which in turn raises the need to properly know what to probe.
That said, from what I've read so far it's not the building of xen.efi
which would need disabling, but (as we already do for certain cases)
its building with debug info included (which in turn is now going to
require its stripping during the build process).

Jan

