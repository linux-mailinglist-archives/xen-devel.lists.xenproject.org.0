Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E3E2C32F4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 22:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37016.69154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khfve-0000lr-EZ; Tue, 24 Nov 2020 21:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37016.69154; Tue, 24 Nov 2020 21:32:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khfve-0000lS-B8; Tue, 24 Nov 2020 21:32:50 +0000
Received: by outflank-mailman (input) for mailman id 37016;
 Tue, 24 Nov 2020 21:32:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPaS=E6=chromium.org=keescook@srs-us1.protection.inumbo.net>)
 id 1khfvc-0000lN-DO
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:32:48 +0000
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5ef4134-0374-4573-83e8-93355b2c39af;
 Tue, 24 Nov 2020 21:32:47 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w4so333810pgg.13
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:32:47 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j74sm15845pfd.43.2020.11.24.13.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 13:32:45 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PPaS=E6=chromium.org=keescook@srs-us1.protection.inumbo.net>)
	id 1khfvc-0000lN-DO
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:32:48 +0000
X-Inumbo-ID: f5ef4134-0374-4573-83e8-93355b2c39af
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f5ef4134-0374-4573-83e8-93355b2c39af;
	Tue, 24 Nov 2020 21:32:47 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w4so333810pgg.13
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nUebvx46WK355IC8BSYKhA86maU/C5TyOra9y/oS07E=;
        b=lzAwh4po+9zegkg/2K9x7CHiUUthvj2PFJyxHwt1QdcZQIdrGCSiE3JgzWuDiv+VMN
         KwBJ/6n/jsAIvSMb6eOJqvl2BVv6D2OMXP8giSKXaaH9JwLNdR2oULKAXe3g8bDVfAub
         65Ll+320/JpDsvMBOWCFVSOrRLSDK1WOgK6ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nUebvx46WK355IC8BSYKhA86maU/C5TyOra9y/oS07E=;
        b=H2Ee8j6y2gDSj/kLnBUyjz9oxGGYaR/mQjX6ItJdb0PUUEnvSeN0pBATgwoxt1Ej+O
         gn3229icLBCPJHeGbgWiaV3B28e1K8WWGTnNSpGUZ7I0vRLvtkHfTYNfQWsgkWNlYQ9j
         0jmgPt9OOhIUYHNGBCUvzDhoeSrgvFZLgN6ldawJ4wMcGWoA4g0J5hVIVDmG9VIkSZkp
         6xWO6tFvrGSgG6aQm6XHSXjbK637yFmszXONCYYbAprzttmHmU7/XFVtFfGQLvz5Skro
         uDLBUrT2G9/8wx5HGb5DuByvUNkoF+k9IxhTqfdOW1DjmkZDWPKqqCUNB0h5jhOtpuRu
         xDsg==
X-Gm-Message-State: AOAM533gRRzGLwm0knw01jGkXdP/RZ9hvGdSAjlU4UJOSgKhmALHXS8/
	FUp4DJskByC7aeTEVUHHdHpGFA==
X-Google-Smtp-Source: ABdhPJxq53hoH5g966jwbYjUDwfs6lHQ9KOfN5qCJ8fiAFBBjxy/+X2rEoTmF5zSw2rlwmYa8QmuBA==
X-Received: by 2002:aa7:9af2:0:b029:198:273c:6be8 with SMTP id y18-20020aa79af20000b0290198273c6be8mr329847pfp.4.1606253566848;
        Tue, 24 Nov 2020 13:32:46 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j74sm15845pfd.43.2020.11.24.13.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 13:32:45 -0800 (PST)
Date: Tue, 24 Nov 2020 13:32:44 -0800
From: Kees Cook <keescook@chromium.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Joe Perches <joe@perches.com>, Jakub Kicinski <kuba@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-atm-general@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <natechancellor@gmail.com>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
	samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net,
	drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
	linux-security-module@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
	linux-acpi@vger.kernel.org, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
	linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
	selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
	linux-can@vger.kernel.org, linux-block@vger.kernel.org,
	linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org,
	nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
	x86@kernel.org, linux-nfs@vger.kernel.org,
	GR-Linux-NIC-Dev@marvell.com, linux-mm@kvack.org,
	netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-sctp@vger.kernel.org, linux-usb@vger.kernel.org,
	netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
	patches@opensource.cirrus.com, linux-integrity@vger.kernel.org,
	target-devel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [Intel-wired-lan] [PATCH 000/141] Fix fall-through warnings for
 Clang
Message-ID: <202011241327.BB28F12F6@keescook>
References: <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
 <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
 <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
 <20201123130348.GA3119@embeddedor>
 <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>

On Mon, Nov 23, 2020 at 08:31:30AM -0800, James Bottomley wrote:
> Really, no ... something which produces no improvement has no value at
> all ... we really shouldn't be wasting maintainer time with it because
> it has a cost to merge.  I'm not sure we understand where the balance
> lies in value vs cost to merge but I am confident in the zero value
> case.

What? We can't measure how many future bugs aren't introduced because the
kernel requires explicit case flow-control statements for all new code.

We already enable -Wimplicit-fallthrough globally, so that's not the
discussion. The issue is that Clang is (correctly) even more strict
than GCC for this, so these are the remaining ones to fix for full Clang
coverage too.

People have spent more time debating this already than it would have
taken to apply the patches. :)

This is about robustness and language wrangling. It's a big code-base,
and this is the price of our managing technical debt for permanent
robustness improvements. (The numbers I ran from Gustavo's earlier
patches were that about 10% of the places adjusted were identified as
legitimate bugs being fixed. This final series may be lower, but there
are still bugs being found from it -- we need to finish this and shut
the door on it for good.)

-- 
Kees Cook

