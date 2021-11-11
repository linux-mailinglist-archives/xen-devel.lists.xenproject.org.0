Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4E744D825
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 15:19:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224777.388272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlAuj-00086c-8k; Thu, 11 Nov 2021 14:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224777.388272; Thu, 11 Nov 2021 14:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlAuj-00084I-4J; Thu, 11 Nov 2021 14:18:53 +0000
Received: by outflank-mailman (input) for mailman id 224777;
 Thu, 11 Nov 2021 14:18:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6S8D=P6=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mlAuh-00084C-8M
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 14:18:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48f5b096-42fa-11ec-9787-a32c541c8605;
 Thu, 11 Nov 2021 15:18:49 +0100 (CET)
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
X-Inumbo-ID: 48f5b096-42fa-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636640329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AUjZmJxqwdOuAz7EgQE4hMCnziUrwwxqnhE+exWo6KI=;
  b=gURjl6M3djrUqJ7MqcOhnw9oyQgpyp2c8ORz8zwR8A+ZpeKQOTwQgVr7
   1u56qhz3DFlmKZGoqpGB0w++7B/agSzeP65/aPsiMT+j5S0/zBLKSXWiW
   bGphwU49zGDcrpK0HwwCpUu39VtZK4N/28aczAEvwLC5ryL/m8GpvPogt
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dUv2yyaTVvJGl7F6Wj2WxzdkqoJJRKZtzMAyiN4Y3YvmnEChMmKA+9di5Zj6e8HaEKgEc7Upz5
 tHLz4uSwIy498UepHiSzmWqxzdbsV7lz4B+WZmbhuN/gCodDESP4N/uKvUZIuI0Fqju6ikCtok
 YlUUttXq39RnXlz3S1mQX8k6TkSuU1FwkUiWzTkR1GRFoPSGLj4XlsGcm9g/OpOMZTyDXqSv3a
 Gw2b0EESoL2i1/LfGf+g/seerGzqZ4o424UXteNinsHCigABNeHlFA+nXJCPAYQkWvdiazFoIf
 W2lK8Xsdoc4htusPkMwihyA4
X-SBRS: 5.1
X-MesageID: 57136053
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5jakeK87mTeh44DGYvSPDrUDZnmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 GFLDG2GOv+JZmGnc98gb46zpE0BupbTyNFhGVdvry08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdg29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgs+
 vMUs7Ducj4YP+7xlcMNbDVJLnBhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0RRK2AP
 5dCAdZpRDvgZCMQP1MIMs5go9zyrEHjVQBhgU3A8MLb5ECMlVcsgdABKuH9e8OIbdVYmF6Co
 WDL9Hi/BQsVXPSAzRKV/3TqgfXA9Qv6Q4sTF7y+s/JvgUGJ10QCARsaWEv9u+TRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEeGA4Mj
 1mlwejQND0sjbCyWU2x54rFsmbnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQm+pn
 W3TxMQqr/BK1JNQif3nlbzSq2v0/sChc+Ij2unAsotJBCtdbZXtWYGn4EOzAR1ofNfAFQnpU
 JTpdqGjAAEy4XOlyHPlrAYlRujBCxO53Nv02A8H834JrWTFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzqVZl0nPewSIu6CZg4i+aihLAoJWdrGwk0NSatM53FyhBwwcnTx
 7/HGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlHyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l9UaKMmu14JNQ+90mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMBiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:czBLaaC9wCenvsPlHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.87,226,1631592000"; 
   d="scan'208";a="57136053"
Date: Thu, 11 Nov 2021 14:18:43 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5] tools/xl: fix autoballoon regex
Message-ID: <YY0mQ913ibP6kz7s@perard>
References: <54c1bcb40afa8a6f36ab4bec8c91523a535c911b.1633090722.git.isaikin-dmitry@yandex.ru>
 <844291636472349@iva2-5f9649d2845f.qloud-c.yandex.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <844291636472349@iva2-5f9649d2845f.qloud-c.yandex.net>

On Tue, Nov 09, 2021 at 07:17:53PM +0300, Dmitry Isaykin wrote:
> Up

The patch as been committed ;-)
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=2faeb4213d9b412836fe80e5685bfcccc51feb92

Cheers,

-- 
Anthony PERARD

