Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309D75856A7
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 23:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377856.611135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHXqu-0007px-E1; Fri, 29 Jul 2022 21:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377856.611135; Fri, 29 Jul 2022 21:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHXqu-0007nU-9v; Fri, 29 Jul 2022 21:49:00 +0000
Received: by outflank-mailman (input) for mailman id 377856;
 Fri, 29 Jul 2022 21:48:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A+33=YC=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1oHXqt-0007nJ-97
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 21:48:59 +0000
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [2607:f8b0:4864:20::e2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e714c65-0f88-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 23:48:56 +0200 (CEST)
Received: by mail-vs1-xe2b.google.com with SMTP id b67so5863797vsc.1;
 Fri, 29 Jul 2022 14:48:56 -0700 (PDT)
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
X-Inumbo-ID: 3e714c65-0f88-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=02+K6rwnRB4x16TS0dlwTtTDongDR9b82S5EJ//EKXQ=;
        b=l80fQSzVYdgBhL6QkkIaUComDaUTeKYiVDzLpbLTueT4ymtEcRMfzfYCEssNGnkCa5
         h380plIaOTv+UECAiiehXZ2RHivcsWtqcYfuCaRz3JZ2P8E9OKEehz1u5JjndpfUlCBf
         KemPQVko3hYalrt6JKsvDPTWPB5u41z1E2PxYI6f/qhKe0RD+JH7eT1MdbB0AGES3k0M
         NmSVdH5W1VvONNOTZQOGUsWWXdjKVDeGi4qsNSIe3Vs3P7jSaFSoKj1lgRGX3KWEP3nO
         xtY2+yp6vsmCndeZGtAP03wqi1ojZipwBPeg10PHooI/H591a+RDIcxFgLf2uc4F3MMR
         89nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=02+K6rwnRB4x16TS0dlwTtTDongDR9b82S5EJ//EKXQ=;
        b=s2s8DR2UjgIQs5c8qryz6frfHpIte/SfaHEim/k8OrretVRXTunrNmpzts7JgID6yC
         xMP42hBIJtIfBNKmIa9p8o6BVKDGZHITG542+QI+kZ1BSN/ERq5irGp9Ub/nVBaHuezJ
         soSQqniV1bZQOSAhWye7eVyQaMniz1Ryqk3c7LiGkdBETvC1OphrgIoc9YwEmE8N/eXK
         Cp9oMVoDIq+uIk7vnzA7dZ6sA2xiBMnuuKBf2AGvO8pS55EiT+nFxj99MgJOq/4cRGzs
         zN8JWBHDI9cOM4TuYL/ivdpVUDKftevM6cFCBOp6+w6/7KeMaPGJ1wuXCzlpEvGq4zQJ
         15+g==
X-Gm-Message-State: AJIora/p2EI9Bp6lPdffYyV6Z4AngFyXw9aHWoUJLJJ/ObKKKISx28pA
	31zB+GtMXWQu1kyAGWnFnNMdzaUtrc2Qjy09Niw=
X-Google-Smtp-Source: AGRyM1veHob3c6vsZYUUO3YaVmp2nFfHSEjWdi1JkYR1Zsqp2xZTxrAsU32D/6x1vFwZfJXydwUpBDbPz3FDPR/E6VA=
X-Received: by 2002:a05:6102:18b:b0:358:5905:c107 with SMTP id
 r11-20020a056102018b00b003585905c107mr2280650vsq.84.1659131335131; Fri, 29
 Jul 2022 14:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR12MB4297AA9CE29208A979437D889F959@DM6PR12MB4297.namprd12.prod.outlook.com>
 <CACMJ4GbiFNorOxWcVV=NZVckeBLrEGnmmY+5LeK514f6kUkytA@mail.gmail.com>
 <DM6PR12MB42970861BFDD03CAE8A8DF279F949@DM6PR12MB4297.namprd12.prod.outlook.com>
 <DM6PR12MB429755DCB52A5086F54C6E0E9F969@DM6PR12MB4297.namprd12.prod.outlook.com>
 <CACMJ4GZ_acc8mj9Wx-OVC-hdjHQpDf=-vNTA9v0GvgZr4ScVig@mail.gmail.com>
In-Reply-To: <CACMJ4GZ_acc8mj9Wx-OVC-hdjHQpDf=-vNTA9v0GvgZr4ScVig@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 29 Jul 2022 14:48:44 -0700
Message-ID: <CACMJ4GYXjPqDBFPjeq48h_EJQa7CoL2-u4QTjkSuoayuvTAP4A@mail.gmail.com>
Subject: Re: Enable audio virtualization in Xen
To: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>, 
	Daniel Smith <dpsmith@apertussolutions.com>, 
	Stefano Stabellini <stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 28, 2022 at 1:37 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Thu, Jul 28, 2022 at 12:05 PM SHARMA, JYOTIRMOY
> <JYOTIRMOY.SHARMA@amd.com> wrote:
> >
> > [AMD Official Use Only - General]
> >
> > Hi all,
> >
> > Can anyone please help here?

Hello again,

I have now been able to enable HVM guest audio using the Xen PV audio
front end device drivers that are included in Ubuntu 22.04.
The steps:
- remove the qemu wrapper script from my previous email, if you have
installed it, and restore the original qemu-system-i386 binary
- keep the pulseaudio system configuration from my previous email, so
that tools that run as the root user are able to talk to the desktop
host pulseaudio system
- add a vsnd device to the guest VM configuration file, in this case
using pulseaudio for output:

vsnd = [[ 'card, backend=Domain-0, buffer-size=65536,
short-name=VCard, long-name=Virtual sound card, sample-rates=48000,
sample-formats=s16_le', 'pcm, name=dev1', 'stream, unique-id=pulse,
type=P' ]]

- download, build and run the backend audio tool in the host dom0.

For the backend you'll need to download and build first libxenbe and
then snd_be from:
https://github.com/xen-troops/libxenbe
https://github.com/xen-troops/snd_be

Once you have the snd_be binary built, you can run it as root thus
before starting your guest VM:
./snd_be -v *:Debug
and then the guest audio output should be working OK.

I have not explored using ALSA rather than pulseaudio yet.

Christopher

