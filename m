Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0392C498E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 22:10:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38073.70698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki23C-0001fk-4A; Wed, 25 Nov 2020 21:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38073.70698; Wed, 25 Nov 2020 21:10:06 +0000
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
	id 1ki23C-0001eI-0n; Wed, 25 Nov 2020 21:10:06 +0000
Received: by outflank-mailman (input) for mailman id 38073;
 Wed, 25 Nov 2020 21:10:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CaZ=E7=chromium.org=keescook@srs-us1.protection.inumbo.net>)
 id 1ki23A-0001TR-Mb
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 21:10:04 +0000
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce698c87-305d-4d99-8446-63f72c855e34;
 Wed, 25 Nov 2020 21:10:03 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 34so3481860pgp.10
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 13:10:03 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z68sm2599034pgb.37.2020.11.25.13.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 13:10:01 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8CaZ=E7=chromium.org=keescook@srs-us1.protection.inumbo.net>)
	id 1ki23A-0001TR-Mb
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 21:10:04 +0000
X-Inumbo-ID: ce698c87-305d-4d99-8446-63f72c855e34
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ce698c87-305d-4d99-8446-63f72c855e34;
	Wed, 25 Nov 2020 21:10:03 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 34so3481860pgp.10
        for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2020 13:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5kDOOuMOjwqEdI4fOY8lF/zJwxoesF7EbkKd66qXZt4=;
        b=AWR/7M4mhE4fi43nRvdimsQoF0WR0/yRvzcmpbbdNnukQZ4s3FUnDOA4HlPrcfy1KL
         TnDV3Sp7ib0l66wO1u9Qkihqc0ymqk7uAD73hLx1Hbj+4zgGkd46Av0r6N17g4aWHL9f
         T52peLS6H3gWn2HtVm1n8SJNqsSbmk3lehF9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5kDOOuMOjwqEdI4fOY8lF/zJwxoesF7EbkKd66qXZt4=;
        b=QI2cR1L0b1r/dzIT+KH2DJMMOwh7fUCSl6t/jZkcy74Jqb+jL8AaCNNSqVabBI6ehN
         8Qkn44kLQeGs0ABHv1NjfdIj48mNOBbup+BMnQOQ3wHwS7HffqS0erThB0+7C0zRarWe
         OjI/3AijHV4vkCnfo1ht1WFdEMvi3svlih9WsdMl7OUmuPZzFa4pMvetLCRB5n6NRseb
         aVXs0CFnseBxL220R2ImLa0wlzXyN5M13y39btgTn08L6sVV3xFMFN7IXCqPcu5b/Ud6
         ZInlNC0flo+B+cK0L3cFKeyWc/+xKpsWhMq6NLBgS8Jy/jCLbgTAwEVfgBWP5fisUX7R
         PKEg==
X-Gm-Message-State: AOAM531JlJOzmKnn15ylyNcSNCMUzAWyc2XL+e4X/IW2sK0/Ved0xjD8
	JcZ9l71nWEriLkocCwKObCkX2A==
X-Google-Smtp-Source: ABdhPJxtOU3VPA7Y7ucN799oMICSzuh5uhFKuAq1LiQpUAr5IO1/6yxlbfPxSFBqrEGEx7Z+PADUmw==
X-Received: by 2002:a17:90b:3505:: with SMTP id ls5mr6437623pjb.55.1606338602947;
        Wed, 25 Nov 2020 13:10:02 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z68sm2599034pgb.37.2020.11.25.13.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 13:10:01 -0800 (PST)
Date: Wed, 25 Nov 2020 13:10:00 -0800
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
Message-ID: <202011251240.1E67BE900@keescook>
References: <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
 <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
 <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
 <20201123130348.GA3119@embeddedor>
 <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
 <202011241327.BB28F12F6@keescook>
 <a841536fe65bb33f1c72ce2455a6eb47a0107565.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a841536fe65bb33f1c72ce2455a6eb47a0107565.camel@HansenPartnership.com>

On Tue, Nov 24, 2020 at 11:05:35PM -0800, James Bottomley wrote:
> Now, what we have seems to be about 6 cases (at least what's been shown
> in this thread) where a missing break would cause potentially user
> visible issues.  That means the value of this isn't zero, but it's not
> a no-brainer massive win either.  That's why I think asking what we've
> invested vs the return isn't a useless exercise.

The number is much higher[1]. If it were 6 in the entire history of the
kernel, I would agree with you. :) Some were fixed _before_ Gustavo's
effort too, which I also count towards the idea of "this is a dangerous
weakness in C, and now we have stopped it forever."

> But the broader point I'm making is just because the compiler people
> come up with a shiny new warning doesn't necessarily mean the problem
> it's detecting is one that causes us actual problems in the code base. 
> I'd really be happier if we had a theory about what classes of CVE or
> bug we could eliminate before we embrace the next new warning.

But we did! It was long ago justified and documented[2], and even links to
the CWE[3] for it. This wasn't random joy over discovering a new warning
we could turn on, this was turning on a warning that the compiler folks
finally gave us to handle an entire class of flaws. If we need to update
the code-base to address it not a useful debate -- that was settled
already, even if you're only discovering it now. :P. This last patch
set is about finishing that work for Clang, which is correctly even
more strict than GCC.

-Kees

[1] https://outflux.net/slides/2019/lss/kspp.pdf calls out specific
    numbers (about 6.5% of the patches fixed missing breaks):
	v4.19:  3 of 129
	v4.20:  2 of  59
	v5.0:   3 of  56
	v5.1:  10 of 100
	v5.2:   6 of  71
	v5.3:   7 of  69

    And in the history of the kernel, it's been an ongoing source of
    flaws:

    $ l --no-merges | grep -i 'missing break' | wc -l
    185

    The frequency of such errors being "naturally" found was pretty
    steady until the static checkers started warning, and then it was
    on the rise, but the full effort flushed the rest out, and now it's
    dropped to almost zero:

      1 v2.6.12
      3 v2.6.16.28
      1 v2.6.17
      1 v2.6.19
      2 v2.6.21
      1 v2.6.22
      3 v2.6.24
      3 v2.6.29
      1 v2.6.32
      1 v2.6.33
      1 v2.6.35
      4 v2.6.36
      3 v2.6.38
      2 v2.6.39
      7 v3.0
      2 v3.1
      2 v3.2
      2 v3.3
      3 v3.4
      1 v3.5
      8 v3.6
      7 v3.7
      3 v3.8
      6 v3.9
      3 v3.10
      2 v3.11
      5 v3.12
      5 v3.13
      2 v3.14
      4 v3.15
      2 v3.16
      3 v3.17
      2 v3.18
      2 v3.19
      1 v4.0
      2 v4.1
      5 v4.2
      4 v4.5
      5 v4.7
      6 v4.8
      1 v4.9
      3 v4.10
      2 v4.11
      6 v4.12
      3 v4.13
      2 v4.14
      5 v4.15
      2 v4.16
      7 v4.18
      2 v4.19
      6 v4.20
      3 v5.0
     12 v5.1
      3 v5.2
      4 v5.3
      2 v5.4
      1 v5.8


    And the reason it's fully zero, is because we still have the cases we're
    cleaning up right now. Even this last one from v5.8 is specifically of
    the same type this series addresses:

        case 4:
                color_index = TrueCModeIndex;
+               break;
        default:
                return;
        }


[2] https://www.kernel.org/doc/html/latest/process/deprecated.html#implicit-switch-case-fall-through

	All switch/case blocks must end in one of:

	break;
	fallthrough;
	continue;
	goto <label>;
	return [expression];

[3] https://cwe.mitre.org/data/definitions/484.html

-- 
Kees Cook

