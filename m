Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB46B28E748
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 21:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6981.18269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSmSL-0005zW-U8; Wed, 14 Oct 2020 19:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6981.18269; Wed, 14 Oct 2020 19:29:01 +0000
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
	id 1kSmSL-0005z7-Qy; Wed, 14 Oct 2020 19:29:01 +0000
Received: by outflank-mailman (input) for mailman id 6981;
 Wed, 14 Oct 2020 19:29:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kSmSK-0005yz-4O
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 19:29:00 +0000
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7831302e-a03b-4909-86fa-03ee517314b0;
 Wed, 14 Oct 2020 19:28:59 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a5so606147ljj.11
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 12:28:59 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=x6PD=DV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kSmSK-0005yz-4O
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 19:29:00 +0000
X-Inumbo-ID: 7831302e-a03b-4909-86fa-03ee517314b0
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7831302e-a03b-4909-86fa-03ee517314b0;
	Wed, 14 Oct 2020 19:28:59 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a5so606147ljj.11
        for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 12:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=57NdamUPepK7XrLUB0t1rWCZ+s1OpvEZeQEb0MQTGGU=;
        b=mTawzr7KKz8RbPWokneHtSk5gesUVsppUe7cosu7qp3qd4lhm6xuquzUkGlr5UmZ49
         85Vt4pIP21N4tXLRWslgRnoxdtpO9iVT4uXFvRS7I83UR9FhE58fleHfs32yebGhOexo
         uC+3ipH0Ntaqyqyl2qzWUONhlcPk1w96PDnB5RAgvblmKhf6l/HliXGhNrxzeoV2UJk0
         Yp7xGWQUxMptodGT50j0JyJeuKUpvkzwZ1pv1W7s6C9+budAZ2yBcpZdfQy/k6xZUgFK
         JkylqpYBj3Yeqy9/eEYcg9vFjmoCPC0YvC1kK3VayEqrrEZTY6vdzqQOzkovYVnq/FlM
         KV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=57NdamUPepK7XrLUB0t1rWCZ+s1OpvEZeQEb0MQTGGU=;
        b=CIXpYEZXHIufacvLNQcAcyinXioQt+JVLfbq1tUvhNNdse8js/Ag23XWLMXudCsqaz
         afipaH2+QjPieJ6Bu8jDc/7mCwRd2F7qiGD8rMfuzDxle5HTUQ1/OHTztNokTWfYdEsJ
         y6Xt39eW8zMiJKWb7gM9rPirUisURZXQj2nEbm+8GgIHrCQVIa4qTKOOk+X/iy9mYYSj
         m+gqhIjcMylsL1ZnmbXS8X5EKNfs8FWV3fozebCTQjrEl676AzQpX/qgSg0E3XZ7KXav
         GTO7XDp7VXzjfVBQG9AEBcic2XVWaeey0BBVa62d7/ZCbZz7nfelXwbRfkDCOH67ZYkT
         Yeuw==
X-Gm-Message-State: AOAM531adcK4Xb+hPwtd3Fvn3cR4PjKUZgD0v7THPPfXpYfWi93VQOhH
	nkWQEBQexeh4QtX6sAXvDDEnwdg3HAVF8+c0m8w=
X-Google-Smtp-Source: ABdhPJyrbDWmZ3YcRPLZrVdntHLlMrtVDXONclYOum3m3DQm8wpP0M5mGc8gL+sLnhNvu5oziLgFxUgMVVL0aOJByvo=
X-Received: by 2002:a2e:924b:: with SMTP id v11mr88844ljg.262.1602703738093;
 Wed, 14 Oct 2020 12:28:58 -0700 (PDT)
MIME-Version: 1.0
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 14 Oct 2020 15:28:46 -0400
Message-ID: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
Subject: i915 dma faults on Xen
To: intel-gfx@lists.freedesktop.org, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Bug opened at https://gitlab.freedesktop.org/drm/intel/-/issues/2576

I'm seeing DMA faults for the i915 graphics hardware on a Dell
Latitude 5500. These were captured when I plugged into a Dell
Thunderbolt dock with two DisplayPort monitors attached.  Xen 4.12.4
staging and Linux 5.4.70 (and some earlier versions).

Oct 14 18:41:49.056490 kernel:[   85.570347] [drm:gen8_de_irq_handler
[i915]] *ERROR* Fault errors on pipe A: 0x00000080
Oct 14 18:41:49.056494 kernel:[   85.570395] [drm:gen8_de_irq_handler
[i915]] *ERROR* Fault errors on pipe A: 0x00000080
Oct 14 18:41:49.056589 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
Request device [0000:00:02.0] fault addr 39b5845000, iommu reg =
ffff82c00021d000
Oct 14 18:41:49.056594 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
PTE Read access is not set
Oct 14 18:41:49.056784 kernel:[   85.570668] [drm:gen8_de_irq_handler
[i915]] *ERROR* Fault errors on pipe A: 0x00000080
Oct 14 18:41:49.056789 kernel:[   85.570687] [drm:gen8_de_irq_handler
[i915]] *ERROR* Fault errors on pipe A: 0x00000080
Oct 14 18:41:49.056885 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
Request device [0000:00:02.0] fault addr 4238d0a000, iommu reg =
ffff82c00021d000
Oct 14 18:41:49.056890 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
PTE Read access is not set

They repeat. In the log attached to
https://gitlab.freedesktop.org/drm/intel/-/issues/2576, they start at
"Oct 14 18:41:49.056589" and continue until I unplug the dock around
"Oct 14 18:41:54.801802".

I've also seen similar messages when attaching the laptop's HDMI port
to a 4k monitor. The eDP display by itself seems okay.

I tried Fedora 31 & 32 live images with intel_iommu=on, so no Xen, and
didn't see any errors

This is a kernel & xen log with drm.debug=0x1e. It also includes some
application (glass) logging when it changes resolutions which seems to
set off the DMA faults. 5500-igfx-messages-kern-xen-glass

Running xen with iommu=no-igfx disables the iommu for the i915
graphics and no faults are reported. However, that breaks some other
devices (Dell Latitude 7200 and 5580) giving a black screen with:

Oct 10 13:24:37.022117 kernel:[   14.884759] i915 0000:00:02.0: Failed
to idle engines, declaring wedged!
Oct 10 13:24:37.022118 kernel:[   14.964794] i915 0000:00:02.0: Failed
to initialize GPU, declaring it wedged!

Any suggestions welcome.

Thanks,
Jason

