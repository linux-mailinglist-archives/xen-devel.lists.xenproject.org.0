Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AB658183D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 19:19:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375564.608003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOCY-00088T-Cc; Tue, 26 Jul 2022 17:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375564.608003; Tue, 26 Jul 2022 17:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOCY-00085Q-91; Tue, 26 Jul 2022 17:18:34 +0000
Received: by outflank-mailman (input) for mailman id 375564;
 Tue, 26 Jul 2022 17:18:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4P7=X7=gmail.com=asr7247@srs-se1.protection.inumbo.net>)
 id 1oGOCW-00085F-AK
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 17:18:32 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f76c9d10-0d06-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 19:18:31 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id mf4so27424542ejc.3;
 Tue, 26 Jul 2022 10:18:29 -0700 (PDT)
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
X-Inumbo-ID: f76c9d10-0d06-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=r48lO1KcX4H/r85dS2DpPqDwqQL+nXXdTD4DhticW/g=;
        b=eH8Qqv8DRNj9BwV/NaXDx+uGQj3ZtAdO98f+trGz68PPBYddBQlAuD3R6Gg0qNQ4Rm
         1qbFg15UKszCbBxcvt43NHc7NIyCsKlOGCBOo2W/5VjbahEYVMmAiE8ZkDxNNwP5KG/G
         3mI71iBFAe/7ahL+FzteSOXfVNmNwKh/2mbXpY436PjUrsaga6TyHhNE9rBVxMuhB6q9
         Fby9xqVb8hgsi/pwDFVwmcsEr5U74fadGC9StQtIeyYm6XpPVKj0sDgBb/2IsPl3mV31
         c1++b8eNZvUxk4z5+H6KGowT4trwofFEl/AM6YGhoxTLg9sgAnyVRlCz9l+zk3Nb5rgY
         dITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=r48lO1KcX4H/r85dS2DpPqDwqQL+nXXdTD4DhticW/g=;
        b=nWQjeEOarv+6zVf/a3DdCGQbP60pPGPYWMUkqU13uuqMJM45R4n2DxA8LGiIbRB0bO
         INAY1XoaMvCKSTXCosoJ7BsI62oQ1EIWSgH86Zas2K+fe3ZKOe3N3QqRpwPyL/AbFtL1
         76YxXpjbx5WDxK7YXFntu3DTn0Nemr2HKF0vZJWL6pqc/jQe8nxB7MEJTXEfXS3Hs6iA
         PkzmwePaBC6yrAvkdVx7P0HzNQZydJJUagqwEm/D96ee31XnZdI4CKVlxWMmcWKDSHnt
         bg9SU1TIyLqr98WMkpvpzMpf7fIfUCbIpLY8TfOhNmfvDZrQkUINi62ci1dep98/qmxX
         LY3g==
X-Gm-Message-State: AJIora/ck28DHOQ2QDseAML31DuGNIVdPr6EcSNeAb8e/xveTsOc4iix
	U5MsRrxlE2Ok2e/dkp8dBdmP0UFJHiBncTeey/6k5O5hEvybBL2o
X-Google-Smtp-Source: AGRyM1u8qVUAggX3bGychPPe0Cb1eEcYIcCzMXFnYkrE4xiyZxbXj+K2igSzlPdgi29jcI0uIizfaUyM/FtixB4R2IE=
X-Received: by 2002:a17:907:6297:b0:72f:9aad:fcb with SMTP id
 nd23-20020a170907629700b0072f9aad0fcbmr14527805ejc.161.1658855908395; Tue, 26
 Jul 2022 10:18:28 -0700 (PDT)
MIME-Version: 1.0
From: A Sudheer <asr7247@gmail.com>
Date: Tue, 26 Jul 2022 22:48:16 +0530
Message-ID: <CABg_Py+0ArEvO2d0sGv+VSsx3VKzRpUBRjs3_MP_aYUXKhHdJg@mail.gmail.com>
Subject: access usb mass storage from multiple DomUs
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000274ec805e4b87d81"

--000000000000274ec805e4b87d81
Content-Type: text/plain; charset="UTF-8"

Hi all,

i am able to passthrough usb mass storage to DomUs but only one DomU at a
time.

For passthrough mode, added below parameters in cfg file and is working.
usbctrl=['type=auto, version=2, ports=6']
usbdev=['hostbus=2, hostaddr=2']

Is there a way to share the mass storage between multiple DomUs at a time ?
How do i configure to access usb mass storage in multiple DomU
simultaneously.

Thanks
Sudheer

--000000000000274ec805e4b87d81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>i am able to passthrough usb ma=
ss storage to DomUs but only one DomU at a time.=C2=A0=C2=A0</div><div><br>=
</div><div>For=C2=A0passthrough mode, added below parameters in cfg file an=
d is working.</div><div>usbctrl=3D[&#39;type=3Dauto, version=3D2, ports=3D6=
&#39;]<br>usbdev=3D[&#39;hostbus=3D2, hostaddr=3D2&#39;]<br></div><div><br>=
</div><div>Is there a way to share the mass storage between multiple DomUs =
at a time ? How do i configure to access usb mass storage in multiple DomU =
simultaneously.=C2=A0<br></div><div><br></div><div>Thanks</div><div>Sudheer=
</div></div>

--000000000000274ec805e4b87d81--

