Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134C746E8B7
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 13:59:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243004.420255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJ0G-0007dn-Kl; Thu, 09 Dec 2021 12:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243004.420255; Thu, 09 Dec 2021 12:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJ0G-0007bH-Hs; Thu, 09 Dec 2021 12:58:28 +0000
Received: by outflank-mailman (input) for mailman id 243004;
 Thu, 09 Dec 2021 12:58:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJm+=Q2=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1mvJ0E-0007bB-PL
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 12:58:26 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b25e9f36-58ef-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 13:58:25 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id bu18so11977287lfb.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Dec 2021 04:58:25 -0800 (PST)
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
X-Inumbo-ID: b25e9f36-58ef-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oJPBo2f3CEADWiji3FOctawMd4KgjhAZ3A/VYvnBXdw=;
        b=FtSZlQoX+uTQpyI2biMDutjC3uNjJYxKaFW6PpWLcNfZ857U7knQoZgHafqtizI4NI
         CyAmk2zQY3jxflmkTA/YQq3uylfmUVhko6IMB6E/IA26Wq60ePO2wL1OapxHpY25M0IU
         oguf6SZWq3v/Q4TqEZy9ksRGMVG1YfdGEDAZu9Z7D9PlffqkvoUcpKeh1svgIONlYsLv
         zRzCDir3fdcZS0Xct5GhY8XZvjH/UMw9PttlJZrjj3WkJ4je999vwkBHwRhd2W5aF1x0
         mUBdhWOrzWc8jAoAWOACf52diYu6ekcdxVmq9ycpNkocOXbXrJPpqdLUeE02XdjPt1hi
         YZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oJPBo2f3CEADWiji3FOctawMd4KgjhAZ3A/VYvnBXdw=;
        b=xX0aXQYNnNa6/Mou++ZVYgcWlTTTdZeAWaYH6bK3Dg6YbSLb8Icx6V/m9oVT989TwW
         FCCeJQHBzpQVnLzv+KwrFe5QVaRs2UUc3C2yMgcp4H/waQuqym1mSyCXA/buhSzdz/Kf
         0wERziCE/zGv9p2cD0vM3BvnhlfhsCBexjikVnN5tzZj2tUUsJDXy6qFNBxh85oAQqRN
         WGs/3icZFanvUS/PIfE0DI/1mU8ngXCGY2Kk8xWyAm3nZiSq/fxYZwxG4bDqCSZKtym3
         uhLXjTjVq5IGS7ZizBsiQB47NdMTeHU3FW7TyuoQbZdtQKHpCe+mhhrmyzPD6GYwC4/k
         kT7A==
X-Gm-Message-State: AOAM530wWBKUOqs2JGnU/GUOyCXbq3ot9QNGETqO4VGkFkoIX5zpbO/O
	iCfzXD+XmsDEFXvQCnnDoCaqAr1Zt66gFXE56aM=
X-Google-Smtp-Source: ABdhPJxzGD+IMg6HkEfBuX83EFH2So+u3DbTZPoxKyYeBVqzb80Kc8PH5sm+pujfDDJraRHOSuHAg980mMnV3klnXdY=
X-Received: by 2002:a05:6512:3c82:: with SMTP id h2mr5911978lfv.128.1639054705041;
 Thu, 09 Dec 2021 04:58:25 -0800 (PST)
MIME-Version: 1.0
References: <d82be159-c4a4-73a7-9fb5-2128b6925e3d@suse.com>
In-Reply-To: <d82be159-c4a4-73a7-9fb5-2128b6925e3d@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 9 Dec 2021 07:58:12 -0500
Message-ID: <CAKf6xpuDwV5nv9c3CX+Lo4e+dM=Uo=iv1nmeNtQNObfgD_wChg@mail.gmail.com>
Subject: Re: attaching device to PV guest broken by your rework of libxl's PCI handling?
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Dec 9, 2021 at 7:18 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> Paul,
>
> in 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are
> reflected in the config") you've moved down the invocation of
> libxl__create_pci_backend() from libxl__device_pci_add_xenstore().
> In the PV case, soon after the original invocation place there is
>
>     if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
>         if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
>             return ERROR_FAIL;
>     }
>
> Afaict the only way this wait could succeed is if the backend was
> created up front. The lack thereof does, I think, explain a report
> we've had:
>
> vh015:~ # xl -vvv pci-attach sles-15-sp4-64-pv-def-net 63:11.4
> libxl: debug: libxl_pci.c:1561:libxl_device_pci_add: Domain 18:ao 0x55a517704170: create: how=(nil) callback=(nil) poller=0x55a517704210
> libxl: debug: libxl_qmp.c:1921:libxl__ev_qmp_dispose:  ev 0x55a5177047e8
> libxl: error: libxl_device.c:1393:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/18/0 does not exist
> libxl: error: libxl_pci.c:1779:device_pci_add_done: Domain 18:libxl__device_pci_add failed for PCI device 0:63:11.4 (rc -3)
> libxl: error: libxl_device.c:1420:device_addrm_aocomplete: unable to add device
>
> Since I don't fully understand what that commit as a whole is
> doing, and since the specific change in the sequence of operations
> also isn't explained in the description (or at least not in a way
> for me to recognize the connection), I'm afraid I can't see how a
> possible solution to this could look like. The best guess I could
> come up with so far is that the code quoted above may also need
> moving down, but I can't tell at all whether doing this after the
> various other intermediate steps wouldn't be too late. Your input
> (or even better a patch) would be highly appreciated.

My attempt at a fix was this:
https://lore.kernel.org/xen-devel/20210812005700.3159-1-jandryuk@gmail.com/

It was in terms of PCI & stubdom startup , but that is the same as PV
hotplug.  There were questions about further re-work which went
unanswered, but my patch at least restores the old working state.

Regards,
Jason

