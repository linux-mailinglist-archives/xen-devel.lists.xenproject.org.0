Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061799DA3AE
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 09:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844506.1260005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGDEt-0000sI-UM; Wed, 27 Nov 2024 08:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844506.1260005; Wed, 27 Nov 2024 08:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGDEt-0000qF-R0; Wed, 27 Nov 2024 08:17:35 +0000
Received: by outflank-mailman (input) for mailman id 844506;
 Wed, 27 Nov 2024 08:17:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGDEs-0000q9-3S
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 08:17:34 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a5908f5-ac98-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 09:17:28 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-434a90fed23so8641725e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 00:17:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad62e9sm15946436f8f.6.2024.11.27.00.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 00:17:27 -0800 (PST)
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
X-Inumbo-ID: 0a5908f5-ac98-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBhNTkwOGY1LWFjOTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjk1NDQ4LjI1ODcxOCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732695447; x=1733300247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=USh6vXam1LbUEiBfJ2czYuOzGdLb81gSU8rGdvPi/dQ=;
        b=L3o6o8NXlzwdljIIhxGD+/dXaDaPzSSX3GMQ5RfrMpKvpvHDG+ZfKbJDWfI52arhPc
         2g2Z4iipsOnv8oGTekL2E2SdjKUEecxAwSXNrfUJmeObdE1++91gOV6+R6X9SIsRsMCb
         5XAksGGrIECn2MvzN1ijte4oiALuerzhZYxuMMYmmbIRkrrRolfC+e29uBMPMugFzgVr
         SulOarnYupHXbkFBXdOkVQ5EkxMy6TS6i+997LCS7kx8h0asqLNv1lsHksX7IpoDbCmr
         yXZ1zH8aZpLDPBkUfqMy/o4t2YeUwAHYKUx1D75HSMdb/C3Sre8k06/J8mKX+USVL9EX
         /J7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732695447; x=1733300247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USh6vXam1LbUEiBfJ2czYuOzGdLb81gSU8rGdvPi/dQ=;
        b=q/CYk0/K080VatSuYL9GJZQx3lQKWqGll050twEybv07h5DAsi+YdgFwHdt9PX4zhl
         cvqxSOb1rNn3Sb/7bLNhyRQwIrTLngUcl/gv2WNRv13/fnTqBtZ7buq5nkhVopx3ZSBl
         sQx2jXdWjXfO8hPfhoaQaQpViITZ+9XWb38dyietMbQoCP+2Z4mgIWugZlT6ew60P2g3
         +IVNE8V+oxAt8iHDWTE4b/bN3YvbHo2jAeAPKNkBCg6C8Eya3fDsqmzHHhpmN7CyEGdK
         Y3XufqqZRMQKNNc1thPXBM9EafFmDvSOU6sWoyc6tuyOvvEPOtO57gVb+isb9w0eG8Ht
         n4mw==
X-Forwarded-Encrypted: i=1; AJvYcCXjlfKWfD2ALocPKrER47SbfoPFlvs43nBAGCRyc9ua9V31sU7l7SlMJXaIQLnRNrdshRRVBJ1wUpo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweA1bCFuG2U/DL303DPUTD9ulYMNfml8qItjy53+4bFcREo/7h
	+l+0NoDI4Dpib7DhlK+BUgrXiVkcViXUzaBKGyNqw4cTF8FXiN77ZpJ4NP8BhA==
X-Gm-Gg: ASbGncsM7l+Y0aHRfz1WZ5a54+HFCaK8ySr2yXohQ7fpGriQidh4ruQerwDu57i7RdX
	JwJbgI4lBI82mObOpewDlEs9jY9GgmjEEoj8tKHgRE1H2cgJrooJuuA7AbSlGGG+l3yWAF4wxvN
	RKpCx44Jbs5MNZOEKvgKDH4PWhLaE4r3AO5XK3Dmn1zmDRCevE64vSLHTpgDWs9TM/xcmEtZnvh
	Z+vINvAzIgbr6UIjSrggFl1KqL53Uz/uXaLhQHqdKJN6TDhEVm1TR/BUCLQNgIc6OkFEiqy78rH
	nQVog1rxmtXOm9ujXRGTjvYGyOUCh7PDMsQ=
X-Google-Smtp-Source: AGHT+IFLVXxoHP2v4PTFZbm0tpfWysjkXHZHg9Za6f3v+ZcRB0TpYOQNp1ZfvBhGLBDL/hcNYhN1wA==
X-Received: by 2002:a05:600c:4e8a:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-434a9dc5003mr17789795e9.8.1732695447634;
        Wed, 27 Nov 2024 00:17:27 -0800 (PST)
Message-ID: <e0fc3cd0-8684-48c2-8cde-8849a0d085d5@suse.com>
Date: Wed, 27 Nov 2024 09:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] x86/APIC: Read Error Status Register correctly
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
References: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
 <46949b57-242b-4724-8e81-62d205233829@citrix.com>
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
In-Reply-To: <46949b57-242b-4724-8e81-62d205233829@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2024 21:07, Andrew Cooper wrote:
> On 26/11/2024 5:06 pm, Javi Merino wrote:
>> The logic to read the APIC_ESR was copied from linux in a commit from
>> 2002: 4676bbf96dc8 (bitkeeper revision
>> 1.2 (3ddb79c9KusG02eh7i-uXkgY0IksKA), 2002-11-20).  In linux 3.14,
>> this logic was fixed to follow the Intel SDM (see commit
>> 60283df7ac26 (x86/apic: Read Error Status Register correctly,
>> 2014-01-14) in the linux kernel).  The Intel(r) 64 and IA-32
>> Architectures Software Develover's Manual currently says
>> in Volume 3, Section 12.5.3:
>>
>>   Before attempt to read from the ESR, software should first write to
>>   it. (The value written does not affect the values read subsequently;
>>   only zero may be written in x2APIC mode.) This write clears any
>>   previously logged errors and updates the ESR with any errors
>>   detected since the last write to the ESR. This write also rearms the
>>   APIC error interrupt triggering mechanism.
>>
>> Update error_interrupt() to remove the first read and follow the Intel
>> manual.
>>
>> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> 
> In Linux, this bugfix was further corrected with
> https://lore.kernel.org/lkml/alpine.LFD.2.11.1404011300010.27402@eddie.linux-mips.org/
> 
> However, Xen being 64-bit only doesn't care about the Pentium 3AP errata
> with writing to ESR.
> 
> I'm tempted to take this patch as-is, then do a followup on top to
> remove the remnants of the Pentium errata from Xen.  I don't think it's
> interesting to take bugfixes to bugfixes simply to delete them right after.

Hmm. I think the adjustment done here is actually removing part of the erratum
workaround, and hence ought to be removed in one go by your patch. The double
read there is - aiui - to be on the safe side wrt that erratum, i.e. to cover
the (at that time) potential case that the erratum would also be present on
CPUs with more than 3 LVTs.

In any event the comment ahead of the code being touched ought to be removed as
well, imo.

Jan

