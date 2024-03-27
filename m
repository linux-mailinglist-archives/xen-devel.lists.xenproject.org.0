Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1915E88E5E5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 15:28:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698584.1090440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpUFl-0001rg-NW; Wed, 27 Mar 2024 14:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698584.1090440; Wed, 27 Mar 2024 14:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpUFl-0001q9-Kk; Wed, 27 Mar 2024 14:27:45 +0000
Received: by outflank-mailman (input) for mailman id 698584;
 Wed, 27 Mar 2024 14:27:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lksO=LB=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rpUFk-0001q3-Cp
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 14:27:44 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c85596b-ec46-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 15:27:43 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-515c198e835so372854e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 07:27:43 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 jw24-20020a170906e95800b00a49856ae93asm3739062ejb.198.2024.03.27.07.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 07:27:42 -0700 (PDT)
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
X-Inumbo-ID: 2c85596b-ec46-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711549663; x=1712154463; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6s9TY9/Cn4vJqrwwNmvG7/hGbs5cbUMGy83r/DdqAYU=;
        b=dMOmXAYnPmBrgmiBOAQLeLAlJ5Cd0yfJ0k5yEkljdGMFGw5AtD1CykvVwMdmCVn+o0
         TDPlNmTXQWsz8rnyD6vAk4BTdnXP36abuZWRKfwfCx73MIcSfy59o80TB+ugbVNeRrFo
         txr5tHiKJ4ZPWY6xGDu+YfgSRKJYoXWPDfC4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711549663; x=1712154463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6s9TY9/Cn4vJqrwwNmvG7/hGbs5cbUMGy83r/DdqAYU=;
        b=QNFYymALNI332gH0b4zEtuN9D1LeRbujqo+KnUyDGFGka6CwBdRRTJzQHmuW6C9EXt
         eh20XIkvFP45ZNCnup9yg8dHFXY+pYCXdBePcvZ8AT4NG48+zDcpNkDFVxHQJY8acoYF
         sk25ejTGqGCUjx79b6tuJttiJTA1QQ9n3BVzVfVxIGfZzDvMRbILIgD7cj9kgqXA2Kv+
         xvk+7Ulv/eWRdejZNlv3hWN2Uc71wKXwRpU/idTqPsNX+p+RCLXkLAAmuOmGYTcwi33n
         GH51EdTa+MXK1amWswr3gTbr5OYDlW2Bny9+dBtCOTQxohhi7yCu/YDtNERogSjaazch
         9T3g==
X-Forwarded-Encrypted: i=1; AJvYcCUNlGM+d2HfJ7fC/oerzDv+eoAwtbsWXO6GzWJT1n42WCLXlLR1GKSUlV9EUYUo0B5/Lcob/GZWx72gMIeIrA33cVAaM9E2SDC9ALt0dec=
X-Gm-Message-State: AOJu0YwOzts0TXUbaPu8kI8x0JcerI6a2cXWOt5SCw0KIefaTpu/fbpS
	tQa7Ne2m+eEu2rZIIaIcduHFWDdWWJYXiyBOK+9cEbsuytvBU5DcUGVHaPk0m8Q=
X-Google-Smtp-Source: AGHT+IGfOGc5SfDKXbq/6cWQXWrbWdawL9QipNh4y7lGdJ/Uq0Y4kUnfad0T2fo+7kdSA94cBcA4PA==
X-Received: by 2002:a05:6512:6c3:b0:515:ba94:8929 with SMTP id u3-20020a05651206c300b00515ba948929mr4374913lff.32.1711549662886;
        Wed, 27 Mar 2024 07:27:42 -0700 (PDT)
Date: Wed, 27 Mar 2024 14:27:41 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH-for-9.0 v2 12/19] hw/xen: Merge 'hw/xen/arch_hvm.h' in
 'hw/xen/xen-hvm-common.h'
Message-ID: <8829dd17-308b-45fe-8d48-a980470316e8@perard>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-13-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114143816.71079-13-philmd@linaro.org>

On Tue, Nov 14, 2023 at 03:38:08PM +0100, Philippe Mathieu-Daudé wrote:
> We don't need a target-specific header for common target-specific
> prototypes. Declare xen_arch_handle_ioreq() and xen_arch_set_memory()
> in "hw/xen/xen-hvm-common.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

