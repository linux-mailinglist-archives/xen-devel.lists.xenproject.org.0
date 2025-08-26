Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD680B353FB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 08:17:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093923.1449291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqmzM-0004rY-Q1; Tue, 26 Aug 2025 06:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093923.1449291; Tue, 26 Aug 2025 06:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqmzM-0004ow-NN; Tue, 26 Aug 2025 06:17:00 +0000
Received: by outflank-mailman (input) for mailman id 1093923;
 Tue, 26 Aug 2025 06:16:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqmzL-0004oq-0S
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 06:16:59 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4523258a-8244-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 08:16:57 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-afcb731caaaso780936666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 23:16:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe79fba62dsm407958766b.100.2025.08.25.23.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 23:16:57 -0700 (PDT)
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
X-Inumbo-ID: 4523258a-8244-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756189017; x=1756793817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Sj7mj0iJbPH4QA+xVe5gk29okmodNFvFLcv4WQbNBc=;
        b=P2fNvg38O0zA/SP1xS6QBm2z8Uggp0zBwHVYORBVtZ4D7MvukFqV6SCNfDEWa55ZQs
         ScUckEdqHzO3EboHX8IFdxrbsBrd9q7MEtP8FVIHaUSeiYSa9FXKI5Nb8ovnCgoYw8cl
         6KR1YGWstQ3+4i6UISuUpUP5L9BhARMmZn5DPkMJI9rgNrgfuGG7hICeWIbCaS3tUCCm
         tMrnrQb2H7SBbZF6vwt+F9L3BbJqZkfIp2n7TkMxSA2dNc4Fqu4aSxYnnpC34+bnjkUO
         pf8GtlK6H+DNkDLVcT49d3Z5y0F/a0P/fMNKsqXsVQHCe6eBgNf1w/QGICuB1dWROYF2
         cDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756189017; x=1756793817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Sj7mj0iJbPH4QA+xVe5gk29okmodNFvFLcv4WQbNBc=;
        b=dTPoNpBYIoH3VIRqflg8x89PQkViOm8uOnGAXGIIaBlFAK63xjkKAzuBH4E2AB10AA
         N8ptmbFWaJYTSAZw5w35TeSpDeVKJ4IsSvQFFtGVeZwyufwH6yc0iFidK64emerAlr5/
         acVWCwky5ZNCFTFULBJaTldHsfJY62SVgzE3vZp2jxIFy5Ir/k4AwJulHjUPWdyOjlTY
         6RL/jfQ2lN0J9JTcPqWxsGnhS+8LMwjt576CT0xzDUvKFsgq7WqyunVN+wCZU0HNs5Qx
         HE6KpP/K5ND8yF8HSORuvytXKwaqgSRwWGUyAAbMtiAnlOC0aD74ch9cxNPL6yzQ/yQL
         B9Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUTFjMRhjYCmuk/r+fidqbtCL2zZpVUKtMgyQJQugP5xQu+Mqes00Oxi7A4wfd7WRjR2ilCFUHsG/I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0suiUz55vKanqEsdwoOc89lblCdnwQBS5nkanhqZekqjjUnuU
	5gsZBiXCXlD9ytRpZlCZxdA0IC2JpIqdXXXL8JzLFQv4XHeUKePmw3P9/i6i1egd5w==
X-Gm-Gg: ASbGnctx9FhXrveuW8OmAVu03dGQSprlYaxwYYP9T4Ao/PKHl7zbK4hpcSn1KBdymrt
	6xk5o0sZJ260+xnwoOur3sFKgl8W0x3zBqyqg+EJ56qca6LKZH8bPTkc+OF14QYv5+E8pLiSMdI
	zyYlVT4XRulvMrHJB7WksXYOe9u5Fzv0yuygWXp63t1J+NcOT6MaD866cnpGYtrW5iDFZvGyaHX
	Qd+b76UEnq1CK8gH8PYE20eL4vb9fpD+a3051r2T2Sky2anLIPxjpvePszVzPQhtY3VEydjjnMY
	DLn69i8rbVAtlnHjXz4XpFwE/WWnG0f6xqrjzyByf7ZK97xFDdExbaHNk6VQx9mmWkcUISXk/rM
	XznSuM/Cs7UQphjZanqnLN+2GzvfH92FsUg99YuyWbzgdh3gVL2JygkC6ryU5xq+qj8VlYaGrxc
	my/EAwfYo=
X-Google-Smtp-Source: AGHT+IEyjjwal51cRcwUoJND0R1YHlbKjI/bUo6y/RTDDxOMPu9wFgMPXJFF26g27+tsrvSOKmdu8Q==
X-Received: by 2002:a17:907:7f94:b0:ae3:63fd:c3af with SMTP id a640c23a62f3a-afe28fbe149mr1458968866b.16.1756189017254;
        Mon, 25 Aug 2025 23:16:57 -0700 (PDT)
Message-ID: <2aafbace-3aa2-4f58-8f6c-2815cd2315ad@suse.com>
Date: Tue, 26 Aug 2025 08:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MSI-X cleanup(?) issue with passthrough after domU restart
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <aK0St0oUkJzR9lO0@mail-itl>
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
In-Reply-To: <aK0St0oUkJzR9lO0@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.08.2025 03:49, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> I'm hitting an MSI-X issue after rebooting the domU. The symptoms are
> rather boring: on initial domU start the device (realtek eth card) works
> fine, but after domU restart, the link doesn't come up (there is no
> "Link is Up" message anymore). No errors from domU driver or Xen. I
> tracked it down to MSI-X - if I force INTx (via pci=nomsi on domU
> cmdline) it works fine. Convincing the driver to poll instead of waiting
> for an interrupt also workarounds the issue.
> 
> I noticed also some interrupts are not cleaned up on restart. The list
> of MSIs in 'Q' debug key output grows:
> 
>     (XEN) 0000:03:00.0 - d22 - node -1  - MSIs < 41 42 43 44 45 46 47 >
>     restart sys-net domU
>     (XEN) 0000:03:00.0 - d24 - node -1  - MSIs < 41 42 43 44 45 46 47 48 >
>     restart sys-net domU
>     (XEN) 0000:03:00.0 - d26 - node -1  - MSIs < 41 42 43 44 45 46 47 48 49 >
> 
> and 'M' output is:
> 
>     (XEN)  MSI-X   41 vec=b1 lowest  edge   assert  log lowest dest=00000001 mask=1/H /1
>     (XEN)  MSI-X   42 vec=b9 lowest  edge   assert  log lowest dest=00000004 mask=1/HG/1
>     (XEN)  MSI-X   43 vec=c1 lowest  edge   assert  log lowest dest=00000010 mask=1/HG/1
>     (XEN)  MSI-X   44 vec=d9 lowest  edge   assert  log lowest dest=00000001 mask=1/HG/1
>     (XEN)  MSI-X   45 vec=e1 lowest  edge   assert  log lowest dest=00000001 mask=1/HG/1
>     (XEN)  MSI-X   46 vec=e9 lowest  edge   assert  log lowest dest=00000040 mask=1/HG/1
>     (XEN)  MSI-X   47 vec=32 lowest  edge   assert  log lowest dest=00000004 mask=1/HG/1
>     (XEN)  MSI-X   48 vec=3a lowest  edge   assert  log lowest dest=00000040 mask=1/HG/1
>     (XEN)  MSI-X   49 vec=42 lowest  edge   assert  log lowest dest=00000010 mask=1/ G/1
> 
> And also, after starting and stopping the domU, `xl pci-assignable-remove 03:00.0`
> makes pciback to complain:
> 
>     [ 1180.919874] pciback 0000:03:00.0: xen_pciback: MSI-X release failed (-16)
> 
> This is all running on Xen 4.19.3, but I don't see much changes in this
> area since then.
> 
> Some more info collected at https://github.com/QubesOS/qubes-issues/issues/9335
> 
> My question is: what should be responsible for this cleanup on domain
> destroy? Xen, or maybe device model (which is QEMU in stubdomain here)?

The expectation is that qemu invokes the necessary cleanup, but of course ...

> I see some cleanup (apparently not enough) happening via QEMU when the
> domU driver is unloaded, but logically correct cleanup shouldn't depend
> on correct domU operation...

... Xen may not make itself dependent upon either DomU or QEMU.

What I find puzzling (assuming I can take the quoted output plus your annotations
verbatim) is that the device apparently uses multiple vectors, and we're leaking
exactly one of them. Also, since reboot is generally nothing else than shutdown
and immediate relaunch, is there a leak also after shutdown? I ask because it
might help to know which of the multiple vectors is leaked (first, last, random).

Jan

