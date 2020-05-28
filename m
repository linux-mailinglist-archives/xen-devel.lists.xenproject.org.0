Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D51E5875
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 09:24:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeCs4-0000ee-Bd; Thu, 28 May 2020 07:22:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=blJD=7K=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jeCs2-0000eZ-N2
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 07:22:30 +0000
X-Inumbo-ID: fd34a344-a0b3-11ea-9947-bc764e2007e4
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd34a344-a0b3-11ea-9947-bc764e2007e4;
 Thu, 28 May 2020 07:22:30 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j10so11170576wrw.8
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2020 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=lG1goK+j76bC1xgzoN5RNMDZSAMph60A5AtJ8km1I0o=;
 b=Lr7SjPYKWCR+htcjVxHMvdv+mCpf1sadXNCcM9IFhKuaKLja69ldRd2SOn3LRNumSu
 HRSg1cxgh7W92gTWYjP0WAAl8iw4Ec1h0JEttKppapN7tTaDDZ+XiBubDhrDO/IK28+B
 XXu54Cn1gEhQVSVHDdAZC7dPzTbYzBfm2UAjNieTSvnYITzTYC04GpSVnNWLHzN7Ekhc
 e+KEvumqJUPxWUosz5wPdY8LTeJa/1ztP6iYJF/9LLc3M5o6pGYHm9uDMCKKqFgW10zY
 h7W+gODx9k3RU3FpuI/s0JYIgDZY7JsGmU7N0iAGJr6+ZXwLIakFqWDJo0GYa+DoJV6h
 6/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=lG1goK+j76bC1xgzoN5RNMDZSAMph60A5AtJ8km1I0o=;
 b=kY8xiP7uHhNYprC6ECD86vmRbtRoF3uQn4f34Z+fr5GsnlCghFjPsuPILPvwY9BHi+
 fvKV6nYx3b4E40wKlltlkiUw5l2TIrEzfLBUltmoEI5dLRatLPTdmgPFaUFvGNrJQh3F
 TvOMqByfgtfL9RjPvFTthsD7dCnAw8ouCCb57jNjCZflXU2V3YalWkSyftq3N6UDZX88
 5nRffCGEN+vQCSgiLHcjyIvtWf+16bSt/K97KTrot0uUDi2C+rhvuUUs8lkfV9rInDbJ
 lN4QZ6uzkGuXCtZjdWtKIik1OP2CTeDx6eIhWoSFlBy0k2HaEgPfTELC2tSlHsiz0X1C
 lAhg==
X-Gm-Message-State: AOAM533OMMQ4giD6HYFtVfrP1ElYRRO37y4iv6+zFtlFx/i2CvYefT6q
 cd8rFEJNpMRR4JwkGISKW8E=
X-Google-Smtp-Source: ABdhPJzZeepf4f9Lhk6hcKohahXMsHQAxqVj1ZuAYT/Mm4ajGdUstVvT/LRiUMw5ohCj4bzJ7lehzg==
X-Received: by 2002:adf:eb47:: with SMTP id u7mr2142080wrn.14.1590650549215;
 Thu, 28 May 2020 00:22:29 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id p1sm5125372wrx.44.2020.05.28.00.22.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 May 2020 00:22:28 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Roman Kagan'" <rvkagan@yandex-team.ru>,
	<qemu-devel@nongnu.org>
References: <20200527124511.986099-1-rvkagan@yandex-team.ru>
 <20200527124511.986099-3-rvkagan@yandex-team.ru>
In-Reply-To: <20200527124511.986099-3-rvkagan@yandex-team.ru>
Subject: RE: [PATCH v6 2/5] block: consolidate blocksize properties
 consistency checks
Date: Thu, 28 May 2020 08:22:25 +0100
Message-ID: <009a01d634c0$be65dc00$3b319400$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIXeuT69nnYcgltbfOkY7MAd59asgG7AZYfqCyzbjA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Kevin Wolf' <kwolf@redhat.com>, 'Fam Zheng' <fam@euphon.net>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 "=?utf-8?Q?'Daniel_P._Berrang=C3=A9'?=" <berrange@redhat.com>,
 'Eduardo Habkost' <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "'Michael S. Tsirkin'" <mst@redhat.com>, 'Eric Blake' <eblake@redhat.com>,
 'Laurent Vivier' <laurent@vivier.eu>, 'Max Reitz' <mreitz@redhat.com>,
 'John Snow' <jsnow@redhat.com>, 'Keith Busch' <kbusch@kernel.org>,
 'Gerd Hoffmann' <kraxel@redhat.com>, 'Stefan Hajnoczi' <stefanha@redhat.com>,
 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Anthony Perard' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roman Kagan <rvkagan@yandex-team.ru>
> Sent: 27 May 2020 13:45
> To: qemu-devel@nongnu.org
> Cc: Kevin Wolf <kwolf@redhat.com>; xen-devel@lists.xenproject.org; =
Gerd Hoffmann <kraxel@redhat.com>;
> Daniel P. Berrang=C3=A9 <berrange@redhat.com>; Paolo Bonzini =
<pbonzini@redhat.com>; Anthony Perard
> <anthony.perard@citrix.com>; Laurent Vivier <laurent@vivier.eu>; Max =
Reitz <mreitz@redhat.com>; qemu-
> block@nongnu.org; Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>; =
Eric Blake <eblake@redhat.com>; Paul
> Durrant <paul@xen.org>; Fam Zheng <fam@euphon.net>; John Snow =
<jsnow@redhat.com>; Michael S. Tsirkin
> <mst@redhat.com>; Eduardo Habkost <ehabkost@redhat.com>; Keith Busch =
<kbusch@kernel.org>; Stefano
> Stabellini <sstabellini@kernel.org>; Stefan Hajnoczi =
<stefanha@redhat.com>
> Subject: [PATCH v6 2/5] block: consolidate blocksize properties =
consistency checks
>=20
> Several block device properties related to blocksize configuration =
must
> be in certain relationship WRT each other: physical block must be no
> smaller than logical block; min_io_size, opt_io_size, and
> discard_granularity must be a multiple of a logical block.
>=20
> To ensure these requirements are met, add corresponding consistency
> checks to blkconf_blocksizes, adjusting its signature to communicate
> possible error to the caller.  Also remove the now redundant =
consistency
> checks from the specific devices.
>=20
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>

Reviewed-by: Paul Durrant <paul@xen.org>



