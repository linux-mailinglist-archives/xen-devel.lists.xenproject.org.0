Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9D68D5F00
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 11:57:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733540.1139852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCz0Q-0001R1-8g; Fri, 31 May 2024 09:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733540.1139852; Fri, 31 May 2024 09:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCz0Q-0001OP-53; Fri, 31 May 2024 09:57:02 +0000
Received: by outflank-mailman (input) for mailman id 733540;
 Fri, 31 May 2024 09:57:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Umgu=NC=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1sCz0P-0001OJ-Av
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 09:57:01 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f32fa44-1f34-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 11:56:59 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e95abc7259so19961621fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 02:56:59 -0700 (PDT)
Received: from [192.168.3.251] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04c0d98sm1473887f8f.24.2024.05.31.02.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 02:56:58 -0700 (PDT)
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
X-Inumbo-ID: 1f32fa44-1f34-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717149419; x=1717754219; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eTxotFDg5HC5VufmvEJCZwC0zHWN9oWX0NtnsJNidHA=;
        b=klU4urjHDGHfnBKASdxynv2vI7Fsit405utplv6jJCHDinIgjRXLjR/X/CinyIFxad
         Y7x4dLdQFAY6Us67qHOOmznMLgXXuJSyjidYSGo4S+OCwycTCxBnetTUMjz1Iji7eiQu
         Zn4eTcjlMsP0pZ+XewDpoQOCoziua9DTzEXI0gs9ItzbYQfbSgmR7XZmeqE4f8oyyW1i
         8LP/mf/3iHdo/dTNPR8KaVGIzBrENSw/YFV3n0QRaHhh7xoBt3EqI+JIkXVqkcihHP5V
         HYc9kCJKUsAV/2k0Gjito3UODzZB5bcSy6bNR3tojwMPmJeprxO2N3IQgSyuJyCZMLp9
         OB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717149419; x=1717754219;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTxotFDg5HC5VufmvEJCZwC0zHWN9oWX0NtnsJNidHA=;
        b=ENDGUgUxc8MqyXPR4gchurQmYSHrS8cNRAMzd2tV5EW9hI4nDnFZguH2QGje+CmL8C
         f1WV3J4YmsjdqgGJU1DbopoIOspsSjmVITWOEpA2m/h+Pf36yCwAgGN2iEunyCNa2Tfs
         eWM4+M6Ko0d3TEOJUpNXrgBdCA3uYKp1ml0JVxgO8XcGJL8YaRd4uG9DJr5TBhZggXhP
         vYJsILwqb6CihQVamWKjq/9TRnkHofUfGw+6LPh12lbVIvOG1+VBdSED/NaF7gNMrWzm
         aHN8oB6HMg7lWy6dmp82ViVDByJzJMSIZCJWUynO15QoEheuRxdSI4AX7w+3az61ihGV
         HFNA==
X-Forwarded-Encrypted: i=1; AJvYcCUDYZTIcQk13/+BUS4QhzqCX0ySphlQYon5PzyzJl43uFcbHM4Rr1Ky0VlCE5YyLnre+lMKMZJuFZEOwaFsVSEc90oOQoArr00XdDN6EDw=
X-Gm-Message-State: AOJu0YwWHfxTlNxCpAVx8rcuGeqYPeqyu0REkVvTDYNwL+CRbVzgSe33
	AqQJmfFyY7qNGWnNhNGEZQ6rCsn85+EW+Y7APU9O14xGbJGDlbuU
X-Google-Smtp-Source: AGHT+IEeGf9pw8BCYVzjYWzmpiH+1eGH7JhqRd4dZK/8oxCqOjugFt64RvUpuwxlKzw/gO+6K7zG9A==
X-Received: by 2002:a2e:9903:0:b0:2e9:794c:19ae with SMTP id 38308e7fff4ca-2ea95122772mr10466311fa.23.1717149418688;
        Fri, 31 May 2024 02:56:58 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <cd6fec85-c5da-4b89-9ceb-cb10ef4048e4@xen.org>
Date: Fri, 31 May 2024 10:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 5/7] hw/xen: initialize legacy backends from
 xen_bus_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20240510104908.76908-1-philmd@linaro.org>
 <20240510104908.76908-6-philmd@linaro.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20240510104908.76908-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/05/2024 11:49, Philippe Mathieu-Daudé wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Prepare for moving the calls to xen_be_register() under the
> control of xen_bus_init(), using the normal xen_backend_init()
> method that is used by the "modern" backends.
> 
> This requires the xenstore global variable to be initialized,
> which is done by xen_be_init().  To ensure that everything is
> ready at the time the xen_backend_init() functions are called,
> remove the xen_be_init() function from all the boards and
> place it directly in xen_bus_init().
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-ID: <20240509170044.190795-7-pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/i386/pc.c              | 1 -
>   hw/xen/xen-bus.c          | 4 ++++
>   hw/xen/xen-hvm-common.c   | 2 --
>   hw/xenpv/xen_machine_pv.c | 5 +----
>   4 files changed, 5 insertions(+), 7 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


