Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D993D88C223
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 13:30:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698063.1089366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp5vE-0001yO-7r; Tue, 26 Mar 2024 12:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698063.1089366; Tue, 26 Mar 2024 12:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp5vE-0001vy-4K; Tue, 26 Mar 2024 12:28:56 +0000
Received: by outflank-mailman (input) for mailman id 698063;
 Tue, 26 Mar 2024 12:28:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EqC6=LA=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rp5vC-0001vs-Nc
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 12:28:54 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68658603-eb6c-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 13:28:53 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4148c5de23fso7647445e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 05:28:53 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c315300b004146a1bf590sm11474364wmo.32.2024.03.26.05.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 05:28:52 -0700 (PDT)
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
X-Inumbo-ID: 68658603-eb6c-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711456133; x=1712060933; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mkMAk9/rqgY4mERx4ZT5H+A9HUYOAOACv8KMOJ8WR14=;
        b=Z8NE8ydY6hfm4XROqt6u9UQI76B/1WeJB730TfF3i2VkT/JBY0ufH4Meu6cJ2PqQ0p
         zvxnSFBTIc8a9ex19bxVS+UYs40M2pauElTQyytcLlgOp9vBYjWOx1Hf+DV8431mfZL9
         ByJg/ymQRMC5WKuxZTtQXr3/kciTSBRQ+l0yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711456133; x=1712060933;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mkMAk9/rqgY4mERx4ZT5H+A9HUYOAOACv8KMOJ8WR14=;
        b=oGK5SuS9Z0Y+BfUFDvymxXxIT3dVrJiqJDl0SmjAH1WKrp0KfYJo9c7Jt6GRqHqhjf
         xL904CHM7rOqKWiBId0gqi1ANEqsh8Vi1POT3rFsSxnP1sv8TWXuzYEQwWdM+WQae4bc
         cD5kt5fLdYvlS/470CR6WDqZRwyy+d7u93IijQiqaWbE2oAlcZ49Xx9B4i8gsBQI3S9C
         Y70Njy+cxcQ4Ju51ncSG66erLPDkBjUeNC67DnvACjM1YzXkaLIEWt0+OOeENYsHaWFp
         3jow0uKVP3ITt6xoBol+eZDbtEMCY8WW3lDyoqWyV8QNu3/rvCtg12twNiYdPKM2WPQG
         nfpQ==
X-Gm-Message-State: AOJu0Yxk9vXLJPBIK0Pbw2q7vGgLKdL5EaL72n6KZ783ecb0p97KBQNl
	a7ngQKwBqGy8E5w8U/nrJemYEdlqqOvzDHa3NscD65mf8P/KfaRvBCQ/m6FogEs=
X-Google-Smtp-Source: AGHT+IFJ0amuASLJGNlO7AL2H4DHgvlDTj4VN1K1r6S/vWZLgt4yiPQOPyG67uc3++z1Yw2ejr/K/w==
X-Received: by 2002:a05:600c:1911:b0:414:1363:53a4 with SMTP id j17-20020a05600c191100b00414136353a4mr7270968wmq.15.1711456133153;
        Tue, 26 Mar 2024 05:28:53 -0700 (PDT)
Date: Tue, 26 Mar 2024 12:28:51 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 10/36] preseed_create: Workaround fail
 grub-install on arndale
Message-ID: <d966e1c7-c95f-4a90-8c52-9d812914b0d2@perard>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
 <20240318165545.3898-11-anthony.perard@citrix.com>
 <ZfsQ-THtGas3sdEV@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZfsQ-THtGas3sdEV@macbook>

On Wed, Mar 20, 2024 at 05:38:17PM +0100, Roger Pau Monné wrote:
> On Mon, Mar 18, 2024 at 04:55:19PM +0000, Anthony PERARD wrote:
> > grub-installer on arndale-* machine fails with Debian Bookworm. It
> > tries to install "grub-pc" which doesn't exist. Skip installation.
> > 
> > Somehow, cubietruck-* installation works fine.
> 
> I'm kind of puzzled by this, as cubietruck and arndales are both armhf
> IIRC? (IOW: they should use the same repo?)
> 
> Does the install of grub-pc succeed on the cubietruck, or is skipped
> for some other reason that doesn't require us to intervene?

It's skipped.

The difference I can see is that, on the cubietruck, there's an extra
step. And it's due to this extra logging:
    debconf: --> METAGET debian-installer/flash-kernel-installer/title Description
    debconf: <-- 0 Make the system bootable

On the cubietruck, there would be these installation step:
    ..., Select and install software, Make the system bootable, Install the GRUB boot loader, ...
But on the arndale, it would be instead:
    ..., Select and install software, Install the GRUB boot loader, ...

Somehow, flash-kernel-installer does something different on both
machine.

Thanks,

-- 
Anthony PERARD

