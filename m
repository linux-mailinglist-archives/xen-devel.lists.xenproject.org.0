Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E087D4FD1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 14:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621902.968791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGad-0004kI-CP; Tue, 24 Oct 2023 12:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621902.968791; Tue, 24 Oct 2023 12:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGad-0004iP-9h; Tue, 24 Oct 2023 12:32:55 +0000
Received: by outflank-mailman (input) for mailman id 621902;
 Tue, 24 Oct 2023 12:32:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvGab-0004fM-7g
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 12:32:53 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7305cdb9-7269-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 14:32:52 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40806e4106dso25624485e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 05:32:52 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c1c8600b003fe1c332810sm16779437wms.33.2023.10.24.05.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 05:32:51 -0700 (PDT)
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
X-Inumbo-ID: 7305cdb9-7269-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698150772; x=1698755572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8xi1P/dcTtFP7ePzE6x4tmvxxQQYlCJaujecDuFetg=;
        b=a+pdmySDHmq3aciA8WrS6up6C2rO3ZNapV7FvazkC+OhKD7ndfuD4lZ6i3NRq9V33t
         U7vu9jCoNNE4ITtqoS0Asw+trAOE7Oq10gphepx6PAKkaj8Gy62bEfFOLanxdpeuEKk6
         6caMqoGHJb/w5tW963lbuXfR2WFzdGCk+pQ7N+IGfrtJDk9i2bSluPP0MwQN+punce42
         NDCFpo24ohxPNOknO5Yxn8/pkTY2+7rznE2QNFPo8vQJs0nVqqzlwUpTWpaU6E+jUAID
         fobDFGymEnAOamYvUtFW/VlIdGRmNyqFH1rurtm2C2hpMROrhBumpjyndYU8yd/Cz73y
         2PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698150772; x=1698755572;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8xi1P/dcTtFP7ePzE6x4tmvxxQQYlCJaujecDuFetg=;
        b=mnB/TQkZtRHbKoXfXC3Idylap1/urLhsAYzzxpBD/S75QBa+lznrve0mAr0LLecEce
         gl/9q2wyEv+5tHhyC/4x2Yu8tvEFBGlzvqdS4X2WxzNhwKazlqmTZSqXY0eKv0V5WX4P
         +l7lRA8et4VpPF1p5+HFc0xgY77f2AXpSV4+dyTJmry1zeGhdzjDApLf7/AvIQhdWVfL
         gCZdgLkdQRQNsXbhmznhMmHVIgL/A26O4UX4sQP9Ra+ZgUedDWOfsPzfjKyvifrqcuib
         TyZ9ncILbYqj5S4lZCMTla4KYhXGwaQvVXotOwx7LCqhbY39byU+0WPMMDMmffgc+8Cf
         Uptg==
X-Gm-Message-State: AOJu0YzdtlogRL0TeP1ER7j+aiDnOTaoWx3O0wOdpRU+URRRj9JwC+W1
	r0RnYZvC+XD8D/lxWm+WZnQ=
X-Google-Smtp-Source: AGHT+IGLdFkCr04zokQorvoqlEejP4kWXqo5hK8lgihYOMmGeEBHFMEAE6OQhDXnhcyIoipg+gCexQ==
X-Received: by 2002:a7b:c8ce:0:b0:406:5a14:5c1e with SMTP id f14-20020a7bc8ce000000b004065a145c1emr14719463wml.1.1698150772070;
        Tue, 24 Oct 2023 05:32:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2126ac82-3ec5-4535-b676-d4a745d6314e@xen.org>
Date: Tue, 24 Oct 2023 13:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 04/12] i386/xen: advertise XEN_HVM_CPUID_UPCALL_VECTOR in
 CPUID
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
 <20231016151909.22133-5-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231016151909.22133-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 16:19, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This will allow Linux guests (since v6.0) to use the per-vCPU upcall
> vector delivered as MSI through the local APIC.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/kvm.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


