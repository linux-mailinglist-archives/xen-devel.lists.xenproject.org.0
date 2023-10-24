Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2FF7D4FC2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 14:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621885.968770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGXf-0002jI-Ke; Tue, 24 Oct 2023 12:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621885.968770; Tue, 24 Oct 2023 12:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGXf-0002gs-HV; Tue, 24 Oct 2023 12:29:51 +0000
Received: by outflank-mailman (input) for mailman id 621885;
 Tue, 24 Oct 2023 12:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvGXe-0002gl-10
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 12:29:50 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 055820f8-7269-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 14:29:48 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2bfed7c4e6dso66005311fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 05:29:48 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a05600c189600b004083a105f27sm16404394wmp.26.2023.10.24.05.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 05:29:47 -0700 (PDT)
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
X-Inumbo-ID: 055820f8-7269-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698150588; x=1698755388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6W+0Okxg9I00CjQFxVnV6ntSdHCpG+SP4y3vva54Y8E=;
        b=YyIoXv70xf/HYm5MSbrUVi/24zPyewtGMnQNl5Scn0txQ9ovBi1s1qge7cnFf6ze8s
         sohNJCT30g/zGOeGdU7c6s1KWvztX2GBS5IKNfQGxcuwN1XDnW/QKllee1ZznYA0qKEN
         eHR02O4XI1U5EWqCKLQuqNouGQtPF26RFgZVGwc1Sx0xjyLUxlvHOoJ1WOLR8zwmfBVB
         TvhTvopAMKWUsWvYS4I4IULqzFjRh56zZQMWRuxRrZ789TxxeJQBNV8msaCFS4Ab1poW
         c/RUEcOLuEDv1PL3SUcmCAO4eCZ6fTX7UQM09LOUwt4DhKUdolowcFiPSr8yHY+WsBT0
         ClDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698150588; x=1698755388;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W+0Okxg9I00CjQFxVnV6ntSdHCpG+SP4y3vva54Y8E=;
        b=YdizYQ/BPhIOMF9vgV8uQi/VGbYNgqcIA8sALOa/eFtHY5UA76KvyI49Rt08m97e6U
         2mCSvt85zLWuNLHSwT7KZOnTPMvHCISi7cfk7Q9BAiC4apOfYJs2a1H15X4VNFmXAdzo
         3bKxM2HXPCofO0qcPsf3yJgKBbKmA+wigluxH0oqry5n5qF425RdDCGNmKLLRpFmTNFH
         pZpF+7h3cxm6VjIazIhi1uRCWKbd7xUIjvhGuFi7uWZvNIghl+Sbr32steNw8djwaysN
         rOD2bM484YUjyp696WCXzeui7Ba3VDRvPY/9t4Bw7BIXrZGQjRYdoJ5q/cAyWDv1mlhJ
         kEJg==
X-Gm-Message-State: AOJu0Yyfd/NJmbUQhpc+Fl+lReUJRz6bLl+wNwFZw5iPCTovH/+2X6PQ
	u78dgULh35FjFaGwIisB1s0=
X-Google-Smtp-Source: AGHT+IHQXaOLRvR4fMkOTyZrwynUH3dk9Z2h9mBZ5MJ5cJrzsBPSIpwKJU7nccdNSAx+0KKpMf83eA==
X-Received: by 2002:a2e:3c19:0:b0:2c5:1809:69ba with SMTP id j25-20020a2e3c19000000b002c5180969bamr8123521lja.40.1698150587872;
        Tue, 24 Oct 2023 05:29:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9eeb2cac-2f22-4e42-9765-2fd5e5a960fa@xen.org>
Date: Tue, 24 Oct 2023 13:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 02/12] hw/xen: select kernel mode for per-vCPU event
 channel upcall vector
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-3-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231016151909.22133-3-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 16:18, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> A guest which has configured the per-vCPU upcall vector may set the
> HVM_PARAM_CALLBACK_IRQ param to fairly much anything other than zero.
> 
> For example, Linux v6.0+ after commit b1c3497e604 ("x86/xen: Add support
> for HVMOP_set_evtchn_upcall_vector") will just do this after setting the
> vector:
> 
>         /* Trick toolstack to think we are enlightened. */
>         if (!cpu)
>                 rc = xen_set_callback_via(1);
> 
> That's explicitly setting the delivery to GSI#, but it's supposed to be
> overridden by the per-vCPU vector setting. This mostly works in QEMU
> *except* for the logic to enable the in-kernel handling of event channels,
> which falsely determines that the kernel cannot accelerate GSI delivery
> in this case.
> 
> Add a kvm_xen_has_vcpu_callback_vector() to report whether vCPU#0 has
> the vector set, and use that in xen_evtchn_set_callback_param() to
> enable the kernel acceleration features even when the param *appears*
> to be set to target a GSI.
> 
> Preserve the Xen behaviour that when HVM_PARAM_CALLBACK_IRQ is set to
> *zero* the event channel delivery is disabled completely. (Which is
> what that bizarre guest behaviour is working round in the first place.)
> 
> Fixes: 91cce756179 ("hw/xen: Add xen_evtchn device for event channel emulation")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  | 6 ++++++
>   include/sysemu/kvm_xen.h  | 1 +
>   target/i386/kvm/xen-emu.c | 7 +++++++
>   3 files changed, 14 insertions(+)
> 
> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> index 4df973022c..d72dca6591 100644
> --- a/hw/i386/kvm/xen_evtchn.c
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -490,6 +490,12 @@ int xen_evtchn_set_callback_param(uint64_t param)
>           break;
>       }
>   
> +    /* If the guest has set a per-vCPU callback vector, prefer that. */
> +    if (gsi && kvm_xen_has_vcpu_callback_vector()) {
> +        in_kernel = kvm_xen_has_cap(EVTCHN_SEND);
> +        gsi = 0;
> +    }
> +

So this deals with setting the callback via after setting the upcall 
vector. What happens if the guest then disables the upcall vector (by 
setting it to zero)? Xen checks 'v->arch.hvm.evtchn_upcall_vector != 0' 
for every event delivery.

   Paul


