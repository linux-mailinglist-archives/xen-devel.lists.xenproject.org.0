Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 197DC84F5A4
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 14:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678697.1056177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYQgn-00025v-Tj; Fri, 09 Feb 2024 13:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678697.1056177; Fri, 09 Feb 2024 13:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYQgn-000246-Qr; Fri, 09 Feb 2024 13:13:09 +0000
Received: by outflank-mailman (input) for mailman id 678697;
 Fri, 09 Feb 2024 13:13:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSO/=JS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rYQgm-000240-Uy
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 13:13:08 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6c8658c-c74c-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 14:13:06 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a3810e975aaso109417266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 05:13:06 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 ps2-20020a170906bf4200b00a39e0196eecsm754537ejb.26.2024.02.09.05.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 05:13:06 -0800 (PST)
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
X-Inumbo-ID: f6c8658c-c74c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707484386; x=1708089186; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WGxuJXfyeGxLs1xzSfe3Sg7BNZubTJxTioPX7QPVyw=;
        b=JE4SBvyXMIJB3kiJ2eDLb9raXGIgE65QDjIJiE7C/+8RNoSbfQ1cDy1sz7ZuHCiRnd
         +flTQDUSvFW6+eG/3CyfdmgjPTgTOXsDcEH7NPrgGLCa7u4gZQ+RmsLeTwQJ7jmUaagC
         Z6y5rTJTL3T89sifVMKUsxeS4CPErm/m9Ki/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707484386; x=1708089186;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WGxuJXfyeGxLs1xzSfe3Sg7BNZubTJxTioPX7QPVyw=;
        b=Kwtp7Z5P9ml+LUG7VLn6WkNW/oQPZeuVSt5y8wGHVHz5zmIsArLf/dWln5PmFqsRq1
         IMUPSYubKto94D3Z6apwvMmOuMEjHqHNqzD9ia8P10T1XJQ1+biAyccoPPrEPHe4GYKs
         +gRFPQTBpgOsNe7URYKTdSgJyR4SxKv44eH4nJ7NJnvwiRh3b9rMZksK51OVXj43HjpK
         v5nlEcP3dMgf8ifGOU4px3BKMmVtDfkHGWF/vtvtlJm3M/WH+sfzcURBPSPzmsYP6Se7
         RddBEDDBuZshufAzUSP1tl8aHKHaJjJRchID84T2V4x1ZBkD79xea3sVoSZxN0LtSGzM
         0VYg==
X-Forwarded-Encrypted: i=1; AJvYcCWhSVvOghYB6bcZ7xkkBJzGxV4yMEdu7J9mTEwmamXZPEGJ5Ic78swQy3KInguoEnQ19L3Dw+e9gbvP05v1YIMthnXIFMkF6NQAHRdZu3s=
X-Gm-Message-State: AOJu0Yx/4wZxHyZtAdkAlCMlYfxx1S4MUdBQ3eibZ/oM7UvgtJ/iOyQE
	Iy2KiRAAKpc/csFyjw2gu1trOPWK1B8FvDGX4hD84C0CGPbl6m0PeuSAls4Zcz0=
X-Google-Smtp-Source: AGHT+IHpFTghhTKnw9mRC2bUTQmLlBHyEe3xfXY86lBBR9rWXOa9Ilp4nACA4nc5c5CZuU3mdWPFTw==
X-Received: by 2002:a17:906:2793:b0:a3b:dd99:c2c3 with SMTP id j19-20020a170906279300b00a3bdd99c2c3mr1315934ejc.73.1707484386297;
        Fri, 09 Feb 2024 05:13:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWO8pSvxSYIXApXZgEibC4MdKaXSKjQUZCoix+sGF+SPci3Xc3LtkYD18GwDKfL/mXYPdOD3zZSqAQTZry8E/r5oPpTgeUZ7sQXxgWBLhS4qDvI3aUJQVUloYQ4RGI4trEi2ao8Y3kIyDydO0UYTlofgo5SW2JKFhBWGzTiYwRFjZ/KKGT+qMEqUaxQ
Date: Fri, 9 Feb 2024 14:13:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/vmx: add support for virtualize SPEC_CTRL
Message-ID: <ZcYk4bHo0Cytndwf@macbook>
References: <20240206142507.81985-1-roger.pau@citrix.com>
 <91e3fd09-8325-49b0-9d7b-43aacf2acd81@suse.com>
 <ZcYCXrEaOyxZUb2I@macbook>
 <fe22b91e-227c-45df-a39a-dcccd8726cd3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe22b91e-227c-45df-a39a-dcccd8726cd3@suse.com>

On Fri, Feb 09, 2024 at 12:51:41PM +0100, Jan Beulich wrote:
> On 09.02.2024 11:45, Roger Pau Monné wrote:
> > On Thu, Feb 08, 2024 at 02:40:53PM +0100, Jan Beulich wrote:
> >> On 06.02.2024 15:25, Roger Pau Monne wrote:
> >>> @@ -2086,6 +2091,9 @@ void vmcs_dump_vcpu(struct vcpu *v)
> >>>      if ( v->arch.hvm.vmx.secondary_exec_control &
> >>>           SECONDARY_EXEC_VIRTUAL_INTR_DELIVERY )
> >>>          printk("InterruptStatus = %04x\n", vmr16(GUEST_INTR_STATUS));
> >>> +    if ( cpu_has_vmx_virt_spec_ctrl )
> >>> +        printk("SPEC_CTRL mask = %#016lx  shadow = %#016lx\n",
> >>> +               vmr(SPEC_CTRL_MASK), vmr(SPEC_CTRL_SHADOW));
> >>
> >> #0... doesn't make a lot of sense; only e.g. %#lx does. Seeing context
> >> there's no 0x prefix there anyway. Having looked at the function the
> >> other day, I know though that there's a fair mix of 0x-prefixed and
> >> unprefixed hex numbers that are output.
> > 
> > For consistency with how other MSRs are printed I should use the '0x'
> > prefix.
> 
> MSRs? It's VMCS fields which are printed here.

Well, yes, but it represents a MSR value.

Thanks, Roger.

