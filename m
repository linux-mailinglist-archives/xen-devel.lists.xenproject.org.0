Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295758063B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 23:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374778.606954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG5PE-0001WH-Tx; Mon, 25 Jul 2022 21:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374778.606954; Mon, 25 Jul 2022 21:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG5PE-0001Tk-RG; Mon, 25 Jul 2022 21:14:24 +0000
Received: by outflank-mailman (input) for mailman id 374778;
 Mon, 25 Jul 2022 21:14:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fBZW=X6=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1oG5PD-0001TZ-Jm
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 21:14:23 +0000
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [2607:f8b0:4864:20::92c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c001397f-0c5e-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 23:14:21 +0200 (CEST)
Received: by mail-ua1-x92c.google.com with SMTP id u11so4941741ual.6;
 Mon, 25 Jul 2022 14:14:21 -0700 (PDT)
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
X-Inumbo-ID: c001397f-0c5e-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Set6ijWuGy4kk4KHbyLi++Jqn9CFwke25VQzsJfBHGY=;
        b=aUBnqkfjwMvxaWE4FNacP1IABzdQfFgWi9V0j1XB/z1htkE1lUlfAsSUV9pFjIdK/U
         kRYnMmwJ0EaRZw0Y6vTtGQlndro2vCZbzsh9/mVu6YcRtYFwe5WupUf+uwujNXE0IHxb
         F+6zDdT2760Kf3qKDuduzpCP3lsMTzgCUeMB/lIU7Yh4ti3BV4xV7qPVRNu3OX58L10a
         /IRh9QWAsAU+S+/GR1z5FKRuK1t0GIuRDV4xi227vSX18tv8g6f+ciIm7+CkXVjnEDxV
         wJ02XmRdWmCc/fdE8l29LPEPlq58vVci6qaIg2mykbpo60LM2kcSPanUUFLaS8VWSQFO
         KLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Set6ijWuGy4kk4KHbyLi++Jqn9CFwke25VQzsJfBHGY=;
        b=FmxSjOGJ+T/6zGu48dkk3FLbbkM1ZWOx8iiBNFwjziaaAxRmXTEZoenVl8CDKdwJzM
         b2kGj9V/2Cc4Xl5Uo6d8fKXFgjDTJ9GOdWuWg3ZTzjPTnMVSftz8pBemNNsWHAztzoT5
         AYYWNaAYRbcnXvhKownpwiLwMlEFGzrbmSrJjXHkYqO8H/jCkHaZ6FDPKW9QE4M42CEX
         WsccbjYBKRXReV3cB7p4ZJP3uN1AHsM1zBtP3xl0Dd7RI//IXVNhpxKvinUoZgPIbOYG
         v3ZtC1UsP2Kqiec5tb3fQseUoTAwIXqQusrw3M7z+jLB4pAAuxzQXvylg2FwXCvlTFav
         jPOw==
X-Gm-Message-State: AJIora+tCPMa1mgeeqmT9npVp0Lv7aViyVfcr70JrKSZQxxsJWTPPaIo
	/suHLAZjEfx3xuMWfJClqOOngvtS52iTOeJOeWs=
X-Google-Smtp-Source: AGRyM1ufAzmhlSrUAJlVc/2Qjeo927hVxJS+pcpWx+xPdoH3occbMYIcqWvmjZDPS2nGj9C9oafjut6n724RJrAfaQ4=
X-Received: by 2002:a05:6130:a1c:b0:384:679f:4ef with SMTP id
 bx28-20020a0561300a1c00b00384679f04efmr4097314uab.55.1658783660163; Mon, 25
 Jul 2022 14:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR12MB4297AA9CE29208A979437D889F959@DM6PR12MB4297.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4297AA9CE29208A979437D889F959@DM6PR12MB4297.namprd12.prod.outlook.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 25 Jul 2022 14:14:09 -0700
Message-ID: <CACMJ4GbiFNorOxWcVV=NZVckeBLrEGnmmY+5LeK514f6kUkytA@mail.gmail.com>
Subject: Re: Enable audio virtualization in Xen
To: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 4:45 AM SHARMA, JYOTIRMOY
<JYOTIRMOY.SHARMA@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
>
> Hi all,

Hi Jyotirmoy,

I have add the xen-users list to CC since this thread may be useful to
that forum.

> I am using ubuntu as dom 0 and also dom U (HVM). I want to play audio fro=
m =E2=80=9Cdom U=E2=80=9D Ubuntu.

I think that it should be possible to enable what you are attempting
to do. ie. audio output from a HVM Ubuntu guest VM.

Some questions to support assisting you:
* Does audio playback work OK from your Ubuntu dom0?
* Do you know which version of Ubuntu you are using? ('cat /etc/lsb-release=
')
* Do you know which version of Xen you are using? ('xl info' in dom0
should help)
* Do you know which version of Qemu you have installed in dom0?
* Did you build and install Xen from source code, or are you using
binary packages of Xen and its tools?
* Are you using the xl tools, or libvirt tools for configuring and
running your guest? -- ie. how do you start your domU VM?
* When your domU is running, please could you run 'ps auxwww' in dom0
and obtain the process information about the qemu instance that is
running, so that we can see what command line arguments have been
supplied to it

> I am new to Xen/virtualization in general.

Welcome! :-)

> From various reading I understood that I need to take following approach:
>
> 1. Use Xen front end ALSA driver in dom U

I'm not certain that this is necessary for your HVM guest. Instead of
using the Xen paravirtualized audio protocol, Qemu should be able to
present an emulated audio device to the HVM guest domU, and a standard
audio driver (hda or ac97) in domU should suffice.

> 2. Use Qemu to connect to the backend ALSA driver in Dom 0

I think if Qemu is started with the correct command line arguments, it
should be able to play sound on behalf of the guest, if sound is
correctly configured and working in dom0.

> Can you please let me know if this approach is fine? If yes, I have follo=
wing questions:
>
> 1. Do I need to recompile Ubuntu to support Xen front end ALSA driver? Or=
 will Ubuntu iso file already have it enabled?

I think the latter, that the Ubuntu installation ISO should already
contain a suitable audio device driver that is compatible with the
virtual audio device that is emulated by Qemu.

> 2. Ho do I configure Qemu to enable backend driver?

A little more information about what you're running will help with
providing guidance here. The xl man page indicates that there is a
"soundhw" option in the VM configuration file for passing sound
hardware configution through to qemu, so if you are using the xl
toolstack, you could try adding this to the config file: soundhw=3D"hda"

Christopher

