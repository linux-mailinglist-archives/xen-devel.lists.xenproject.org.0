Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E8197D8E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 16:48:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Rs8-0007OF-4T; Wed, 21 Aug 2019 14:46:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k62z=WR=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1i0Rs5-0007OA-EN
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 14:45:58 +0000
X-Inumbo-ID: 6110559e-c422-11e9-8980-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6110559e-c422-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 14:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1566398754;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-ID:Subject:Cc:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=CKbUuzOyLVKnX13M2vSYji51CxqsN5USIQtVlv+0LJA=;
 b=lcmqiL5v58ilr82z5++veBK44GCGYeYBIkKIhlmmm/g97M7SAK4b8fg9uj93aLhbB2
 eW6RSomoA8qwmufQAqj1r6FRFmm8kmVI5MfXYnxDo5oIueOF/3yZG+e9hBgs9BNTx/0m
 6w3KQ/PXmXtBvI3LHTDV7lcs8bBMQUdIyi9ssijIFBYjJujCFztnwEowbblNoEBA+ysB
 Xeu9zMz4Qrn4oBWhLE0KG2xEMLoIXt1kixGp4kh0ZzGT3MjzHX0XBcVn4rFqmKpODXI6
 lLOE71cfv53T75XL38BJsw3YqwGxzpTF+5Z0ER6tQPEKGaMSI1g1TSzQZuoTlCteeJcw
 fa+g==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.26.1 AUTH)
 with ESMTPSA id q09c76v7LEjrRA6
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 21 Aug 2019 16:45:53 +0200 (CEST)
Date: Wed, 21 Aug 2019 16:45:44 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Message-ID: <20190821164544.7a57cefc.olaf@aepfle.de>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: [Xen-devel] error handling in libxl_domain_suspend
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
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============8403150574110289792=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8403150574110289792==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/U4sR9TWDxNvq8wVNloH8Z1j"; protocol="application/pgp-signature"

--Sig_/U4sR9TWDxNvq8wVNloH8Z1j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Ian, Wei,

we got a report about a crash from libxl_domain_suspend like this, from 'vi=
rsh migrate --live xen+ssh://host':

#1 helper_done (egc=3D0x7fc0284aa6c0, shs=3D0x7fc0180256c8) at libxl_save_c=
allout.c:371
 helper_failed
 helper_stop
 libxl__save_helper_abort
#2 check_all_finished (egc=3D0x7fc0284aa6c0, stream=3D0x7fc018025698, rc=3D=
-3) at libxl_stream_write.c:671
 stream_done
 stream_complete
 write_done=20
 dc->callback =3D=3D write_done
 efd->func =3D=3D datacopier_writable
#3 afterpoll_internal (egc=3Degc@entry=3D0x7fc0284aa6c0, poller=3Dpoller@en=
try=3D0x7fc018003f20, nfds=3D4, fds=3D0x7fc018002d00, now=3D...) at libxl_e=
vent.c:1269

I inserted the extra call trace manually for better understanding.
The issue is a failed poll will crash libxl, the actual error was:

libxl_aoutils.c:328:datacopier_writable: unexpected poll event 0x1c on fd 3=
7 (should be POLLOUT) writing libxc header during copy of save v2 stream

In this case revents in datacopier_writable is POLLHUP|POLLERR|POLLOUT, whi=
ch triggers datacopier_callback.
In helper_done, shs->completion_callback is still zero:

(gdb) p stream.shs
$32 =3D {ao =3D 0x7f3fa4002d10, domid =3D 0, callbacks =3D {
save =3D {a =3D {suspend =3D 0x7f3f99c8e220 <libxl__domain_suspend_callback=
>, postcopy =3D 0x0, checkpoint =3D 0x0, wait_checkpoint =3D 0x0, switch_qe=
mu_logdirty =3D 0x7f3f99c8eca0 <libxl__domain_suspend_common_switch_qemu_lo=
gdirty>}},
restore =3D {a =3D {suspend =3D 0x7f3f99c8e220 <libxl__domain_suspend_callb=
ack>, postcopy =3D 0x0, checkpoint =3D 0x0, wait_checkpoint =3D 0x0, restor=
e_results =3D 0x7f3f99c8eca0 <libxl__domain_suspend_common_switch_qemu_logd=
irty>}}},
recv_callback =3D 0x0, completion_callback =3D 0x0,
caller_state =3D 0x0, need_results =3D 0, rc =3D 0, completed =3D 0, retval=
 =3D 0, errnoval =3D 0, abrt =3D {ao =3D 0x0, callback =3D 0x0, registered =
=3D false,
entry =3D { le_next =3D 0x0, le_prev =3D 0x0}}, pipes =3D {0x0, 0x0}, reada=
ble =3D {fd =3D -1, events =3D 0, func =3D 0x0, entry =3D {le_next =3D 0x0,=
 le_prev =3D 0x0}, nexus =3D 0x0},
child =3D {pid =3D -1, callback =3D 0x0, entry =3D {le_next =3D 0x0, le_pre=
v =3D 0x0}}, stdin_what =3D 0x0, stdout_what =3D 0x0, egc =3D 0x0}


Even if helper_done would check if shs->completion_callback is valid, check=
_all_finished would apparently cycle forever:

(gdb) p stream.completion_callback=20
$35 =3D (void (*)(libxl__egc *, libxl__stream_write_state *, int)) 0x7f3f99=
c8e890 <stream_done>

stream_done would call check_all_finished again.

My understanding of the code is that libxl__xc_domain_save fills dss.sws.sh=
s. But that function is only called after stream_header_done. Any error bef=
ore that will leave dss partly uninitialized.

How is this supposed to be fixed?

Olaf

--Sig_/U4sR9TWDxNvq8wVNloH8Z1j
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl1dWRgACgkQ86SN7mm1
DoCqhw//SD4BdngHb7ujX93TFMhzRlpWV5Fcdv22dLWx0m3E7WXNRCh5+gleI4yE
YTg68J76GP+7sGE45QlIzO77v7JM4VAkPXU0CKc1IAbzpHpdLuV78o6lFD3AJhF2
KwjpkDvTldefcYeOWRVuMMqw4HVyAY+J7gOdCcRV5PN+ITCMhTNyFW2tlD3bMBci
U6P0tdypFTqMYAxbKdnsRAQXww5rSMY1J/JUth26GA0ZKw+E7DgkfOcHuOAghEmq
64pMiVXewn2iqdgThypPiGNsVBYmdnALo+O6NGWLD+qZiP7vMeRw9K/StMwFNCnS
9xMVExKNMBDS6HgKQLwl1nIJo7cCGo18hip5eUk02Ada7WYY7XjwdRrcVtIb/pPw
8wkzwgmRJPqiDrb/T93cXnFok3WlyTR9G4dOw63QvVaGL9PgUbKBsj/cNCvkkSAr
h91hlLFHDfWz3Axo1rqdGeq2AVg5ojGNUKIrYpTF+7uSM1QsYn96+kVo0ABeHnjv
oBMTsosLm5H8WSSaVi7M9vpnrFE+samdBzlDmfesv0cHqHMTS2dYC3lDm5n4Djh4
NqeHOX6up4/8eG+THD+BeQ9SYinivRiFNWtpPcZPE3q6T0hjbs+LDdxJvXm2ulmQ
ms1rAIcfPv09j3jSq4cOjtkmRL5D/psH1aJHlFLqGyUO/9LN+eU=
=Kx2w
-----END PGP SIGNATURE-----

--Sig_/U4sR9TWDxNvq8wVNloH8Z1j--


--===============8403150574110289792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8403150574110289792==--

