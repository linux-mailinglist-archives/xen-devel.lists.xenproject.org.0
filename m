Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6996146B597
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 09:20:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240725.417409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVhO-0006V6-1I; Tue, 07 Dec 2021 08:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240725.417409; Tue, 07 Dec 2021 08:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVhN-0006TI-UJ; Tue, 07 Dec 2021 08:19:41 +0000
Received: by outflank-mailman (input) for mailman id 240725;
 Tue, 07 Dec 2021 08:19:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tPeo=QY=actia.se=jonas.blixt@srs-se1.protection.inumbo.net>)
 id 1muVhM-0006TC-JD
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 08:19:40 +0000
Received: from mail.actia.se (mail.actia.se [195.67.112.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bdef06e-5736-11ec-a5e1-b9374ead2679;
 Tue, 07 Dec 2021 09:19:39 +0100 (CET)
Received: from S036ANL.actianordic.se (192.168.16.117) by
 S035ANL.actianordic.se (192.168.16.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 7 Dec 2021 09:19:38 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2375.017; Tue, 7 Dec 2021 09:19:38 +0100
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
X-Inumbo-ID: 6bdef06e-5736-11ec-a5e1-b9374ead2679
From: Jonas Blixt <jonas.blixt@actia.se>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: XEN CAN Driver
Thread-Topic: XEN CAN Driver
Thread-Index: AQHX6nupqGV1RK1HBkO11DPjYT8S66wlZuuAgAE7SIA=
Date: Tue, 7 Dec 2021 08:19:37 +0000
Message-ID: <92dbcb2a71fa4c25bfea7e802ad4ab21@actia.se>
References: <5a2d079fe8db41338464381dd2dc9575@actia.se>,<e87175c9-bf55-f79a-a910-b94d69aead86@suse.com>
In-Reply-To: <e87175c9-bf55-f79a-a910-b94d69aead86@suse.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.11.250.33]
x-esetresult: clean, is OK
x-esetid: 37303A29832D1F50627165
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

>=A0Is the data being sent/received by the domU put directly onto the
>=A0rings, or is it mapped via grant mappings by dom0?
>
>=A0Are all the requests on the rings of the same size?

The data sent from both domU and dom0 are written directly to the rings
 and all requests/responses (CAN Frames) have the same, fixed, size.

>=A0Are the single requests/responses acknowledged by the other side
>=A0(I guess "yes", as I presume this is what you are referring to as
>=A0"flow control")?

Yes, sending a frame from domU will trigger the interrupt handler in dom0
and similarly the other way around.

Frames originating from the physical interface is bound to a relatively
low baud rate but the other way around is only limited by the performance
of the ring buffers. To cope with this we hade to call 'netif_stop_queue'=20
in the front end driver to stall the applications sending frames.
And when there is space available in the ring 'netif_wake_queue' to
resume.


Jonas=

