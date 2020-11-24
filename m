Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF1E2C32B6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 22:25:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37008.69142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khfoo-0008GI-Iv; Tue, 24 Nov 2020 21:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37008.69142; Tue, 24 Nov 2020 21:25:46 +0000
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
	id 1khfoo-0008Ft-FL; Tue, 24 Nov 2020 21:25:46 +0000
Received: by outflank-mailman (input) for mailman id 37008;
 Tue, 24 Nov 2020 21:25:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPaS=E6=chromium.org=keescook@srs-us1.protection.inumbo.net>)
 id 1khfon-0008Fo-Ay
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:25:45 +0000
Received: from mail-pf1-x443.google.com (unknown [2607:f8b0:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 858a5b60-34e4-436e-8314-247b42b0274e;
 Tue, 24 Nov 2020 21:25:44 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 131so270115pfb.9
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:25:44 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z68sm129381pgb.37.2020.11.24.13.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 13:25:41 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PPaS=E6=chromium.org=keescook@srs-us1.protection.inumbo.net>)
	id 1khfon-0008Fo-Ay
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 21:25:45 +0000
X-Inumbo-ID: 858a5b60-34e4-436e-8314-247b42b0274e
Received: from mail-pf1-x443.google.com (unknown [2607:f8b0:4864:20::443])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 858a5b60-34e4-436e-8314-247b42b0274e;
	Tue, 24 Nov 2020 21:25:44 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 131so270115pfb.9
        for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2020 13:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hc7xHQdcWqcI1RL6yWHK3qM7+D3PcB+9wJ1f+Y4kOZ8=;
        b=oKmDT/E0BiqfYtxGd9S8VgvaixpTRLnYMRrsUV9kaRuJo3R/5oNlOHAboaJA72rvz5
         cPy+dYNpKpp/tW1abpWiBH/rmtZxXE/MLGj7m5uMt/n+RU1YTE1Rw6QIxNLzAajuHLbW
         OV/WWZm28UqOigi5ggHh0BMVZishCwQGNb1Ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hc7xHQdcWqcI1RL6yWHK3qM7+D3PcB+9wJ1f+Y4kOZ8=;
        b=iA0zVU08afAX62nOGW5pBcJIlS3YZsN6EsipEbNCtGK72pUE1ICSRp7sOBFX9SnU6B
         tZ0zR1g1RSEzvHIpNUNmzvle7dd1JyagruLCw1gxpGpOhV6EdmL+hosSp1SVyoq1oZKO
         zE1lXkvMzAHYHJdkoijfhk1Wj3amtX+XtfTQwqDgxOP7F/O0VCL0TWYczAE0fKClhpaE
         j0P7lJlC+FY493lc4SWTqdlxehjP7H8N3LVt1mIQpCwt3b9tnAxw4ZUf9zc8V1MfsD/M
         7321eecip59njQFA61gwEHG0UN/xFJCYYpDVchef64eEa2HT5fP6mepwpK4sLzdkJekW
         XBXg==
X-Gm-Message-State: AOAM530/VcmmNk/cJ8/6PE7zqyoudd6iLrhYHuCIh9eVQ+tPq9Actuj8
	+/BzoGMzcpqq/L0rvuQVUrxCnA==
X-Google-Smtp-Source: ABdhPJwtm7ki1o3tlMghBzBMLVUzEcZQN+PDIoPgB8WI7uCPSXlOMvf7LiH3SXaewZBRcFltugq6wg==
X-Received: by 2002:a17:90b:3505:: with SMTP id ls5mr176054pjb.55.1606253143764;
        Tue, 24 Nov 2020 13:25:43 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z68sm129381pgb.37.2020.11.24.13.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 13:25:41 -0800 (PST)
Date: Tue, 24 Nov 2020 13:25:40 -0800
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	bridge@lists.linux-foundation.org, ceph-devel@vger.kernel.org,
	cluster-devel@redhat.com, coreteam@netfilter.org,
	devel@driverdev.osuosl.org, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com,
	dri-devel <dri-devel@lists.freedesktop.org>,
	GR-everest-linux-l2@marvell.com, GR-Linux-NIC-Dev@marvell.com,
	intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org,
	keyrings@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	linux-acpi@vger.kernel.org, linux-afs@lists.infradead.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	linux-atm-general@lists.sourceforge.net,
	linux-block@vger.kernel.org, linux-can@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, linux-ext4@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-geode@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-hams@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-integrity@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	netfilter-devel@vger.kernel.org, nouveau@lists.freedesktop.org,
	op-tee@lists.trustedfirmware.org, oss-drivers@netronome.com,
	patches@opensource.cirrus.com, rds-devel@oss.oracle.com,
	reiserfs-devel@vger.kernel.org, samba-technical@lists.samba.org,
	selinux@vger.kernel.org, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	usb-storage@lists.one-eyed-alien.net,
	virtualization@lists.linux-foundation.org,
	wcn36xx@lists.infradead.org,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	xen-devel@lists.xenproject.org, linux-hardening@vger.kernel.org,
	Nathan Chancellor <natechancellor@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Joe Perches <joe@perches.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
Message-ID: <202011241324.B3439A2@keescook>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <CAKwvOdntVfXj2WRR5n6Kw7BfG7FdKpTeHeh5nPu5AzwVMhOHTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdntVfXj2WRR5n6Kw7BfG7FdKpTeHeh5nPu5AzwVMhOHTg@mail.gmail.com>

On Mon, Nov 23, 2020 at 05:32:51PM -0800, Nick Desaulniers wrote:
> On Sun, Nov 22, 2020 at 8:17 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Fri, Nov 20, 2020 at 11:51:42AM -0800, Jakub Kicinski wrote:
> > > If none of the 140 patches here fix a real bug, and there is no change
> > > to machine code then it sounds to me like a W=2 kind of a warning.
> >
> > FWIW, this series has found at least one bug so far:
> > https://lore.kernel.org/lkml/CAFCwf11izHF=g1mGry1fE5kvFFFrxzhPSM6qKAO8gxSp=Kr_CQ@mail.gmail.com/
> 
> So looks like the bulk of these are:
> switch (x) {
>   case 0:
>     ++x;
>   default:
>     break;
> }
> 
> I have a patch that fixes those up for clang:
> https://reviews.llvm.org/D91895

I still think this isn't right -- it's a case statement that runs off
the end without an explicit flow control determination. I think Clang is
right to warn for these, and GCC should also warn.

-- 
Kees Cook

