Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A703B1924B3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 10:51:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH2eb-0006wL-45; Wed, 25 Mar 2020 09:48:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3Ydp=5K=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1jH2eZ-0006wG-1v
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 09:48:51 +0000
X-Inumbo-ID: d486183c-6e7d-11ea-85c2-12813bfff9fa
Received: from us-smtp-delivery-74.mimecast.com (unknown [63.128.21.74])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d486183c-6e7d-11ea-85c2-12813bfff9fa;
 Wed, 25 Mar 2020 09:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585129730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TxLNf2yYifu3dFESwhDhAFjemxg54heCW9dPm5VtnQ=;
 b=UZaOW18/zh7Pd2sQqVPqUF7/HhYk66Yfc03e48sbSH+oPwO77TkFV0lBSfJ0m6L+cdF+Lq
 wOhY7O8oPbW8RTiRGdV5HWh9SLvHRBLTHwjwZ1LWz2LVPnHWxBJCk6ri2gWTs1UrWaMBD6
 AW57oddORvsGaR8e9eMMHT1MRAqZN74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-ajmDLulmMgWOvxsxNjirGQ-1; Wed, 25 Mar 2020 05:48:46 -0400
X-MC-Unique: ajmDLulmMgWOvxsxNjirGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8DB48017CC;
 Wed, 25 Mar 2020 09:48:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 661C360BE0;
 Wed, 25 Mar 2020 09:48:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 557B817535; Wed, 25 Mar 2020 10:48:43 +0100 (CET)
Date: Wed, 25 Mar 2020 10:48:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20200325094843.ydpwwqrakfjhm3x5@sirius.home.kraxel.org>
References: <20200323164318.26567-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200323164318.26567-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Re: [Xen-devel] [RFC] hw/usb/xen-usb.c: Pass struct usbback_req* to
 usbback_packet_complete()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Mar 23, 2020 at 04:43:18PM +0000, Peter Maydell wrote:
> The function usbback_packet_complete() currently takes a USBPacket*,
> which must be a pointer to the packet field within a struct
> usbback_req; the function uses container_of() to get the struct
> usbback_req* given the USBPacket*.
>=20
> This is unnecessarily confusing (and in particular it confuses the
> Coverity Scan analysis, resulting in the false positive CID 1421919
> where it thinks that we write off the end of the structure). Since
> both callsites already have the pointer to the struct usbback_req,
> just pass that in directly.

Looks sane from usb point of view.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

cheers,
  Gerd


