Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351858D1BCD
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 14:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731132.1136480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBwNm-0003cQ-TP; Tue, 28 May 2024 12:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731132.1136480; Tue, 28 May 2024 12:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBwNm-0003ap-QL; Tue, 28 May 2024 12:56:50 +0000
Received: by outflank-mailman (input) for mailman id 731132;
 Tue, 28 May 2024 12:56:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+UYp=M7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sBwNl-0003ZG-64
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 12:56:49 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be5889de-1cf1-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 14:56:47 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59cc765c29so27172466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 05:56:48 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc8b980sm608662466b.154.2024.05.28.05.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 05:56:47 -0700 (PDT)
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
X-Inumbo-ID: be5889de-1cf1-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716901007; x=1717505807; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKO5pF0AuV1bNrDCOnTfXew1j1QeUsaF7EgHEwrkyxQ=;
        b=JbOb4Yn7DzD4LqHb5z95DtSN/5ltdKSihlwLmtpyPeBTc/0oKzJIRSlnX8i/fR1Lxw
         OXl40UV2IO0efdrScYkycjXgf4PGKdAHwnwnw7SzgM3P7bpGx5S2dD1Pyb4Yjb0nwyb4
         xecdWJ33VP3XrcymiyLaAoInvRjomqEFqlECqW0/c+e/bpkMHs28n3RlXqLIDraTGxOp
         8iugLVP8tzPPTe1nAZ0ZCBdQMDpCXCqn5yot1gcARtf7VxK5yHiGEu7jM0GV/avS7rGw
         TYplCuCttSKgV4mcMr2gv1agWjNpetELm/3/k/cr2muqjvuw2xh8kJNyamGMSqcKOjVu
         vpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716901007; x=1717505807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKO5pF0AuV1bNrDCOnTfXew1j1QeUsaF7EgHEwrkyxQ=;
        b=WCae1GuCSfE8dxSLHxa0+h+DwvaF4j2B5Um6QsIzfcfv1WGmBbLQPx/OFEgmGYHeK1
         E+DcJD+iE2eWFGDXkzzlPuIqwMHP1PdKPUf0euTLCqNTLwxSI6nBD3RYtU6gTU5JLE76
         wETxmRXr2BtX5SZdHHV4cyKDfYnAsZPBV+1S8gqwdxul/ETczKj3TC2naN4108Qtb3yU
         kfvTWbUk1MZsVpFNxjwpv+0UeDxnE0kxTv3iBhoSRwhRoxcEze+e3nab9FwG6+kAUtUU
         rxEaCQSt26xz206UO/n38PE58ZJM1MtUL8ZyAS2Xm8OvsY3VL/xqSH824HFTzw8jF80X
         I+lA==
X-Forwarded-Encrypted: i=1; AJvYcCXGAQqrPGhE3/B9elxCRFhB3j+35rHPb0s2pZBkNxLCOHkxzh8pI5bwLUkRCR6r6bBHB4anpw9BU9nzkQ4DCYMd6YU1PzfE6EvHNXnxvOg=
X-Gm-Message-State: AOJu0YzpSVAXtfq2a3dXiyX48UiAhcbgHsS4XAWOvREir2+/2DuurBZ5
	rU3ls48zVE/GlC27NBp/seKmHzR8DHl4IswQYneC/A+oFO2D4StrGri9LRlrNw8=
X-Google-Smtp-Source: AGHT+IHOiGiSxeg0Z6jHmUu8nh2M1BlKRDGSc7iXkeKPNevCo2TqBxYSAtMJcUWemYo2FMUZfXtVIQ==
X-Received: by 2002:a17:906:6d88:b0:a5a:6367:7186 with SMTP id a640c23a62f3a-a626536e538mr707619866b.70.1716901007554;
        Tue, 28 May 2024 05:56:47 -0700 (PDT)
Message-ID: <293200d3-5fe8-44da-a0c3-95e6f9899670@suse.com>
Date: Tue, 28 May 2024 14:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/pci/xen: Fix PCIBIOS_* return code handling
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Campbell <ian.campbell@citrix.com>, xen-devel@lists.xenproject.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240527125538.13620-1-ilpo.jarvinen@linux.intel.com>
 <20240527125538.13620-3-ilpo.jarvinen@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240527125538.13620-3-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.05.24 14:55, Ilpo Järvinen wrote:
> xen_pcifront_enable_irq() uses pci_read_config_byte() that returns
> PCIBIOS_* codes. The error handling, however, assumes the codes are
> normal errnos because it checks for < 0.
> 
> xen_pcifront_enable_irq() also returns the PCIBIOS_* code back to the
> caller but the function is used as the (*pcibios_enable_irq) function
> which should return normal errnos.
> 
> Convert the error check to plain non-zero check which works for
> PCIBIOS_* return codes and convert the PCIBIOS_* return code using
> pcibios_err_to_errno() into normal errno before returning it.
> 
> Fixes: 3f2a230caf21 ("xen: handled remapped IRQs when enabling a pcifront PCI device.")
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


