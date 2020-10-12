Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E228B4D0
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 14:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5924.15379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRxCZ-0002ce-SI; Mon, 12 Oct 2020 12:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5924.15379; Mon, 12 Oct 2020 12:45:19 +0000
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
	id 1kRxCZ-0002cF-P6; Mon, 12 Oct 2020 12:45:19 +0000
Received: by outflank-mailman (input) for mailman id 5924;
 Mon, 12 Oct 2020 12:45:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kRxCX-0002cA-W8
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:45:18 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f8c5287d-de03-4165-b360-1c43f7f32b1f;
 Mon, 12 Oct 2020 12:45:16 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-puG-AytJPlqu3n4nFyTAxA-1; Mon, 12 Oct 2020 08:45:10 -0400
Received: by mail-wr1-f69.google.com with SMTP id x16so8849260wrg.7
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:45:10 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id d2sm14916054wrq.34.2020.10.12.05.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:08 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kRxCX-0002cA-W8
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 12:45:18 +0000
X-Inumbo-ID: f8c5287d-de03-4165-b360-1c43f7f32b1f
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id f8c5287d-de03-4165-b360-1c43f7f32b1f;
	Mon, 12 Oct 2020 12:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602506716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0VfM6Y1Z4oOM9AviCLT3C6cOeCH1n4rJ8RPo235glro=;
	b=YChWZiyCrsTVXV90QgJvNNBOvbWmNrcisjkDZE+iere73iZTsm7TJ2pTMqDpRu+8fQJuea
	9r9LqP5y3v5OPpW1gjFd18lJNIgm9drxFwPLh7WE7VfhU7na6x9n48/PpnNnFFy0ONhQAJ
	JydRwPt8pZUAtDKIWgUvPaEh3J4xwpk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-puG-AytJPlqu3n4nFyTAxA-1; Mon, 12 Oct 2020 08:45:10 -0400
X-MC-Unique: puG-AytJPlqu3n4nFyTAxA-1
Received: by mail-wr1-f69.google.com with SMTP id x16so8849260wrg.7
        for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 05:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UtSObLJfNIzbJcrgKRU5Cu+zNLd9lEQsFGBvfOC7Lok=;
        b=ihjbmfyF4AADUD1jmre+K6hMUPGDsvdq4zcOhn8pE42kiBRHIh9sDQDEMnn1HJGvyl
         Z7uetkgNGw3OU0Q1jEW8FVHornjJkEs+oDgyQISl2UfH1I/FDxttnnz+rDgukRESiLWW
         ijAxfek61N8A5KNO2GIf6uynh0Go4NwMrCIDLlR2gwQ4dHMWKG2gA87buvFJWeN3xUUD
         6CEofdu9KwUQgS54KSNWPLurjK+f60RZeC3wkqvB6Wr7gxcfmiWYhq/16LbHqpFWYA1m
         q2klXPoEfvcGMhGFn3sOaInFWqEBy5qv13S3xzyT+WJYHPYk6lk7zDuZM1C3moNTrw5/
         wRpw==
X-Gm-Message-State: AOAM530gePNyIgE+eTQ/deE+kk0p7MDmZzK3RtJc8oiY1okK46WM2Mbq
	sYT8klMcVek+jMxjT9DhED8pN+WNP35BHQGPyoq2xVQYns4zCjAw+9xT9cP2/Je+w7oVr5moDpG
	XRT4p0UAMBUE5lDR6EvnCBsRJK5k=
X-Received: by 2002:a5d:46c1:: with SMTP id g1mr9137839wrs.101.1602506709326;
        Mon, 12 Oct 2020 05:45:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz6hFiVJHdaU7cfa/kbxEMNRyQTLhhCcs5f5STC6wr7DnE8rXhJdscPh109XPd+XACdRYSYQ==
X-Received: by 2002:a5d:46c1:: with SMTP id g1mr9137815wrs.101.1602506709130;
        Mon, 12 Oct 2020 05:45:09 -0700 (PDT)
Received: from localhost.localdomain (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
        by smtp.gmail.com with ESMTPSA id d2sm14916054wrq.34.2020.10.12.05.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:45:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org,
	qemu-trivial@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Anthony Perard <anthony.perard@citrix.com>,
	Richard Henderson <rth@twiddle.net>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhc@lemote.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/5] hw: Use PCI macros from 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 14:45:01 +0200
Message-Id: <20201012124506.3406909-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Trivial patches using the generic PCI macros from "hw/pci/pci.h".=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  hw/pci-host/bonito: Make PCI_ADDR() macro more readable=0D
  hw/pci-host: Use the PCI_BUILD_BDF() macro from 'hw/pci/pci.h'=0D
  hw/pci-host/uninorth: Use the PCI_FUNC() macro from 'hw/pci/pci.h'=0D
  hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'=0D
  hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'=0D
=0D
 hw/arm/virt.c          | 3 ++-=0D
 hw/hppa/dino.c         | 2 +-=0D
 hw/i386/xen/xen-hvm.c  | 2 +-=0D
 hw/isa/piix3.c         | 2 +-=0D
 hw/mips/gt64xxx_pci.c  | 2 +-=0D
 hw/pci-host/bonito.c   | 5 ++---=0D
 hw/pci-host/pnv_phb4.c | 2 +-=0D
 hw/pci-host/ppce500.c  | 2 +-=0D
 hw/pci-host/uninorth.c | 8 +++-----=0D
 hw/ppc/ppc4xx_pci.c    | 2 +-=0D
 hw/sh4/sh_pci.c        | 2 +-=0D
 11 files changed, 15 insertions(+), 17 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


