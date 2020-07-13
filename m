Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6719221D322
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 11:48:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juv2q-0006BE-MV; Mon, 13 Jul 2020 09:46:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GELZ=AY=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1juv2o-0006B9-OA
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 09:46:42 +0000
X-Inumbo-ID: c15a7552-c4ed-11ea-9239-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c15a7552-c4ed-11ea-9239-12813bfff9fa;
 Mon, 13 Jul 2020 09:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594633601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B0Oe5UV2qyeUG9Z0o/6/qc3LlnZaZG6gs7b/Di/jHF4=;
 b=BNfy4jRNb+q7fTp8yS586Xua+3qTe/i7iKosN4pSzSpw3XCtc26N70zb6A6V04EBIY5Uj+
 f7Xrvi7xCjqubLKUqrg8V+OVXa9thi+U/JiOSBuNCtzMJ2DPMc+LIvszHSX9srJ2moK5ka
 OBg1B1C5BOXDp4BHcApNYInorCR9DyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-SmNjCEALNaCu-3G69JToMA-1; Mon, 13 Jul 2020 05:46:38 -0400
X-MC-Unique: SmNjCEALNaCu-3G69JToMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DB3E8015F4;
 Mon, 13 Jul 2020 09:46:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 303A327DE7C;
 Mon, 13 Jul 2020 09:46:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1CA893EBB1; Mon, 13 Jul 2020 11:46:24 +0200 (CEST)
Date: Mon, 13 Jul 2020 11:46:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 00/26] hw/usb: Give it love, reduce 'hw/usb.h' inclusion
 out of hw/usb/
Message-ID: <20200713094624.occmvxdb56kvbqy2@sirius.home.kraxel.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Jul 04, 2020 at 04:49:17PM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This is the second time I try to replace a magic typename string
> by a constant, and Zoltan warns me this is counter productive as
> "hw/usb.h" pulls in an insane amount of code.
> 
> Time to give the usb subsystem some love and move forward.
> 
> This series can be decomposed as follow:
> 
>  1-2:    preliminary machine cleanups (arm/ppc)
>  3-13:   usb related headers cleanups
>  14-15:  usb quirks cleanup
>  16-18:  refactor usb_get_dev_path() to add usb_get_port_path()
>  19:     let spapr use usb_get_port_path() to make USBDevice opaque
>  20:     extract the public USB API (for machine/board/soc)
>  21:     make the older "usb.h" internal to hw/usb/
>  22-25:  use TYPENAME definitions
>  26:     cover dwc2 in MAINTAINERS
> 
> Please review.

Looks good overall, I don't fell like squeezing this into 5.1 though.
Can you repost (with the few comments addressed) once 5.2 is open for
development in roughly a month?

thanks,
  Gerd


