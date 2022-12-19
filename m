Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6637650D0A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 15:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466127.724978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7GqR-0002bE-EK; Mon, 19 Dec 2022 14:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466127.724978; Mon, 19 Dec 2022 14:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7GqR-0002Yp-BY; Mon, 19 Dec 2022 14:10:19 +0000
Received: by outflank-mailman (input) for mailman id 466127;
 Mon, 19 Dec 2022 14:10:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gyHb=4R=citrix.com=prvs=3454adc0d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p7GqP-0002Yj-KB
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 14:10:17 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d517a0e2-7fa6-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 15:10:05 +0100 (CET)
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
X-Inumbo-ID: d517a0e2-7fa6-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671459014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bkhL5i1Zpu2u0dNJ8rDflE68+bM9GeYGaMZ8cE7WyBg=;
  b=NnKhLifkFaTxJKrM2dKpX+s5/B2qKngP7T8+XE6gOc8VwstpzCoI66V+
   0IduwQmkYi8CAhr1W8KxYJiWLXaAKSLAciLmAWcg7Zt84bOQhdup/i5eM
   ThwJI2Qmfb0e/tL9kz4e0y/cTEk3bDoohbBl5lT+PKvdo0+VBMkEIr8cY
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 89102970
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:REAz26uKIQm+B1lLID8TiCsKKOfnVB9YMUV32f8akzHdYApBsoF/q
 tZmKWyCaPrcMWunf98laIri9UhUuJTdmt4yTQRqpCgzF3sR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWHxiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdhMTYyCOgfiNmr+pcrB8n4MBBcSzFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27I9
 zuepTWmWnn2MvSi0Dq77SOutNaWsiP1ZrATTIKe17l11Qj7Kms7V0RNCArTTeOCokK3XdNSL
 0wepnN1hac3/U2vCNL6WnWQqWSBtAQBc8BdH+0z9EeGza+8ywKHB3YFQyRpctEqtMYqAzct0
 zehltfkFXplvbuTRH+18raSpCm1fy8PIgcqYC4PTQII55/5p50zphvKQpBoF6vdpsP0Ay3xx
 HWEtwAkirkThNJN3KK+lXjejjex45TEUAMxzgPQWG2j80V+foHNT4Oy7kXUxfVJK4rfSUOO1
 FAYm9WC7MgUAJ2NnTDLS+IIdJm56vDAPDDCjFpHG5g66y/r63OlZZpX4jx1OAFuKMlsUSbkZ
 VKWoRtazJlUOnSscOlweY3ZI8glzKzqGM75furZYtpHft56cwrv1DlkYkiC3mbsuFIhnaE2J
 dGQdsPEJW0GBKpuyjq/b/0Q3b8i2mY1wma7bZLgyRO4+aCTaH6cVfEON17mRuo09rmNpgrY2
 8xSO8uD11NUV+iWSirN+J4eKXgQIHQ7DIywoMtSHsaYORZvEmwlD/7XwJsidpZjkqATkf3Hl
 lmkV0pFjVPlgFXBLgOFbG0lb6ngNb5noG42J2opNEek1nwnSYKu6q4FcN0wZ7ZP3PVuyOMxR
 f0CcMaoBPNJRTLavTMHYvHVp4htXBeigg7IODCqCBAzdoBhSyTG+9X/eQ2p+DMJFiC6vNF4o
 rHm3x6zaYIKWgBKHMvQLvW1wDuMUWM1wbwoGRGSe58KJRuqoNMCxzHNYuEffeISJCXOwCGhj
 QuEOU4IvK7vioJt2Yyc7UyblLuBH+x7F0tcOmDU67eqKCXXllaeLZ98vPWgJm6ECj6tkEm2T
 aAMlqynbqVb9Lpfm9Ake4uH257S8DcGS1Vy6g1/VEvGYF2wYl+LCinXhJIf3kGhK1IwhOdXZ
 q5t0oMBUVlqEJm/eLL0GObCRrrr6B3ssmOOhcnZ2W2jjMONwJKJUF9JIz6HgzFHIb1+PesNm
 Ll+4ZVGu1fh1Ep7Y75qaxy4EEzVchQ9v1gP7MlGUOcHdCJwor29XXAsInCvu8zeAzm9GkIrP
 iWVlML/ulio/WKbKyBbPSGUjYJgaWEm5EgiIKkqew7YxbIoR5YfgHVszNjAZl8On0gYjb4uZ
 zAD2o8cDfzmwgqETfNrBwiEczytzjXDkqAt4zPlTFHkcnQ=
IronPort-HdrOrdr: A9a23:UTs5kqCJzyLV3uflHemA55DYdb4zR+YMi2TDgXoBLiC9Ffb1qy
 nOppsmPHrP4wr5N0tPpTntAsi9qBHnhP1ICPgqXYtKNTOO0AHEEGgF1/qG/9SKIVydygcy79
 YZT0FWMqyVMXFKyer8/QmkA5IB7bC8gduVbD7lvhFQpNdRGthd0zs=
X-IronPort-AV: E=Sophos;i="5.96,255,1665460800"; 
   d="scan'208";a="89102970"
Date: Mon, 19 Dec 2022 14:10:04 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
CC: <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	<qemu-ppc@nongnu.org>, <xen-devel@lists.xenproject.org>, Laurent Vivier
	<lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Daniel Henrique
 Barboza" <danielhb413@gmail.com>, <virtio-fs@redhat.com>, Michael Roth
	<michael.roth@amd.com>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, <qemu-block@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, Paul Durrant
	<paul@xen.org>, David Gibson <david@gibson.dropbear.id.au>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, John Snow
	<jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>, Thomas Huth
	<thuth@redhat.com>
Subject: Re: [PATCH 2/6] hw/xen: use G_GNUC_PRINTF/SCANF for various functions
Message-ID: <Y6BwvATqB0ka7qys@perard.uk.xensource.com>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-3-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221219130205.687815-3-berrange@redhat.com>

On Mon, Dec 19, 2022 at 08:02:01AM -0500, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

