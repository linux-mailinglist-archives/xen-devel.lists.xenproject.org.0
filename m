Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D224B1951C
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 22:17:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068687.1432608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uif84-0004GQ-4A; Sun, 03 Aug 2025 20:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068687.1432608; Sun, 03 Aug 2025 20:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uif83-0004F2-Vv; Sun, 03 Aug 2025 20:16:23 +0000
Received: by outflank-mailman (input) for mailman id 1068687;
 Sun, 03 Aug 2025 20:16:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+tsi=2P=contentwise.tech=evgeny@srs-se1.protection.inumbo.net>)
 id 1uif82-0004Eu-Jc
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 20:16:23 +0000
Received: from mailrelay-egress1.pub.mailoutpod3-cph3.one.com
 (mailrelay-egress1.pub.mailoutpod3-cph3.one.com [2a02:2350:5:420::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7ee7e72-70a6-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 22:16:20 +0200 (CEST)
Received: from onecom-webmail-backend-production-957f95bc8-m9fsv
 (service.pub.live1-k8s-cph3.one.com [46.30.212.67])
 by mailrelay2.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id b75d3b88-70a6-11f0-9572-e90f2b8e16ca;
 Sun, 03 Aug 2025 20:16:19 +0000 (UTC)
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
X-Inumbo-ID: b7ee7e72-70a6-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754252179; x=1754856979;
	d=contentwise.tech; s=rsa1;
	h=content-type:subject:reply-to:cc:from:to:message-id:mime-version:date:
	 in-reply-to:from;
	bh=yaDO2zkeiZRQmNdej1F7o4pvt5aFjEGieQX3PkdBhME=;
	b=M3ioqw6iQT4GlZ/XkfcOX0RAJ2+EY2WUuzD4hDDhl3bV0rgknO14Z26XY8IbUy9YjY+8DHtBsyNBJ
	 CD4aQEpDKVpMKWqvWCAyn6nHSX+sKpQ0nvUhlSLkJ0F1Db5xmx6/ecBwTpa0/ZRZNavT9D7PINcamD
	 NPQFPTpk9Io20ROEbyUYqzfizXsMbxC05lc0arS4/UKGjng8Z6c6/Ts8DmG/p2QHEwgq/I8N406jIr
	 cUaU6Ki++tSdCmqLGd9AH/JdaNy2COhWuU5cju6DOEdipkVyjvOCx0qH3UqMBsooMPDwP4oKaN0/Gl
	 VkxgT81n5xBZd9XxGEZEyC2aihU/fvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754252179; x=1754856979;
	d=contentwise.tech; s=ed1;
	h=content-type:subject:reply-to:cc:from:to:message-id:mime-version:date:
	 in-reply-to:from;
	bh=yaDO2zkeiZRQmNdej1F7o4pvt5aFjEGieQX3PkdBhME=;
	b=nMyy8RwnvQDEXSF1YI07fZ5XjTp5de7eOF9KQjHfYOdrrr09PxdD5wPZ/W2K7KVpqDRWa/JV7JLFS
	 F+ZSi48Bw==
X-HalOne-ID: b75d3b88-70a6-11f0-9572-e90f2b8e16ca
X-Originating-IP: 5.180.182.5
User-Agent: One.com webmail 49.1.9
In-Reply-To: <2d218180-4be4-4c3f-ab65-04a112141b0f@xen.org>
Date: Sun, 03 Aug 2025 23:16:18 +0300
MIME-Version: 1.0
Message-ID: <1754252178882.7.40484@webmail-backend-production-957f95bc8-4zxxx>
To: "Julien Grall" <julien@xen.org>
From: "Evgeny Beysembaev" <evgeny@contentwise.tech>
Cc: <xen-devel@lists.xenproject.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>,
 "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, <miro@contentwise.tech>
Reply-To: <evgeny@contentwise.tech>
Subject: Re: [PATCH] BCM2711 reboot fix
Content-Type: multipart/alternative;
 boundary="----------40482-1754252178882-1"

This is a multipart message in MIME format.

------------40482-1754252178882-1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

According to the commit b334c1afad17 ("ARM: dts: bcm2711: Use proper compat=
ible in PM/Watchdog node")
in Linux kernel, the `compatible` string for the watchdog peripheral in the=
 DTS has been modified from
`brcm,bcm2835-pm` to `brcm,bcm2711-pm`, which caused `rpi4_map_watchdog()` =
function to fail,
leading to inability to reboot the system under Xen hypervisor.

Signed-off-by: Evgeny Beysembaev <<evgeny@contentwise.tech>>
---
xen/arch/arm/platforms/brcm-raspberry-pi.c | 9 ++++++---
1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/plat=
forms/brcm-raspberry-pi.c
index 811b40b1a6..74fca7ecc5 100644
--- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
+++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
@@ -60,9 +60,12 @@ static void __iomem *rpi4_map_watchdog(void)
paddr_t start, len;
int ret;

- node =3D dt_find_compatible_node(NULL, NULL, "brcm,bcm2835-pm");
- if ( !node )
- return NULL;
+ node =3D dt_find_compatible_node(NULL, NULL, "brcm,bcm2711-pm");
+ if ( !node ) {
+ node =3D dt_find_compatible_node(NULL, NULL, "brcm,bcm2835-pm");
+ if ( !node )
+ return NULL;
+ }

ret =3D dt_device_get_address(node, 0, &start, &len);
if ( ret )
--=20
2.47.2


On Friday, May 30, 2025 at 11:40:23 pm +03:00, Julien Grall <julien@xen.org=
> wrote:

> Hi Evgeny,
>=20
> Thank you for the patch. Let me start with the process,
> patches are submitted inline rather than in attachment.
>=20
> git-send-email commmand can do that for you.
>=20
> Now regarding the patch. I understand that newer kernel
> will use the new compatible. But I would assume there is
> still some device-tree out using the old property. So I
> think Xen needs to check both compatible.
>=20
> Lastly, for the future,when mentioning we commit, we tend to use a smalle=
r
> hash (12 digits) followed by the commit title. In your case,
> it would be:
>=20
> b334c1afad17 ("ARM: dts: bcm2711: Use proper compatible in PM/Watchdog no=
de").
> 
> Cheers,
> 
> -- 
> Julien Grall
> 


------------40482-1754252178882-1
Content-Type: multipart/related; boundary="----------40482-1754252178882-2"

------------40482-1754252178882-2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<div><span class=3D"font" style=3D"font-family: monospace;"><span class=3D"=
highlight" style=3D"background-color: rgb(20, 22, 27);"><span class=3D"colo=
ur" style=3D"color: rgb(224, 226, 234);">According to the commit b334c1afad=
17 ("ARM: dts: bcm2711: Use proper compatible in PM/Watchdog node")</span><=
/span><span class=3D"highlight" style=3D"background-color: rgb(255, 255, 25=
5);"><span class=3D"colour" style=3D"color: rgb(0, 0, 0);"> </span></span><=
br><span class=3D"highlight" style=3D"background-color: rgb(20, 22, 27);"><=
span class=3D"colour" style=3D"color: rgb(224, 226, 234);">in Linux kernel,=
 the `compatible` string for the watchdog peripheral in the DTS has been mo=
dified from</span></span><span class=3D"highlight" style=3D"background-colo=
r: rgb(255, 255, 255);"><span class=3D"colour" style=3D"color: rgb(0, 0, 0)=
;"> </span></span><br><span class=3D"highlight" style=3D"background-color: =
rgb(20, 22, 27);"><span class=3D"colour" style=3D"color: rgb(224, 226, 234)=
;">`brcm,bcm2835-pm` to `brcm,bcm2711-pm`, which caused `rpi4_map_watchdog(=
)` function to fail,</span></span><span class=3D"highlight" style=3D"backgr=
ound-color: rgb(255, 255, 255);"><span class=3D"colour" style=3D"color: rgb=
(0, 0, 0);"> </span></span><br><span class=3D"highlight" style=3D"backgroun=
d-color: rgb(20, 22, 27);"><span class=3D"colour" style=3D"color: rgb(224, =
226, 234);">leading to inability to reboot the system under Xen hypervisor.=
</span></span><span class=3D"highlight" style=3D"background-color: rgb(255,=
 255, 255);"><span class=3D"colour" style=3D"color: rgb(0, 0, 0);"> </span>=
</span><br> <br><span class=3D"highlight" style=3D"background-color: rgb(20=
, 22, 27);"><span class=3D"colour" style=3D"color: rgb(224, 226, 234);">Sig=
ned-off-by: Evgeny Beysembaev &lt;</span><span class=3D"colour" style=3D"co=
lor: rgb(179, 246, 192);"><a href=3D"mailto:evgeny@contentwise.tech" target=
=3D"_blank">evgeny@contentwise.tech</a></span><span class=3D"colour" style=
=3D"color: rgb(224, 226, 234);">></span></span><span class=3D"highlight" style=
=3D"background-color: rgb(255, 255, 255);"><span class=3D"colour" style=3D"=
color: rgb(0, 0, 0);"> </span></span><br><span class=3D"highlight" style=
=3D"background-color: rgb(20, 22, 27);"><span class=3D"colour" style=3D"color:=
 rgb(224, 226, 234);">---</span></span><span class=3D"highlight" style=3D"b=
ackground-color: rgb(255, 255, 255);"><span class=3D"colour" style=3D"color=
: rgb(0, 0, 0);"> </span></span><br><span class=3D"highlight" style=3D"back=
ground-color: rgb(20, 22, 27);"><span class=3D"colour" style=3D"color: rgb(=
224, 226, 234);"> xen/arch/arm/platforms/brcm-raspberry-pi.c | 9 ++++++---<=
/span></span><span class=3D"highlight" style=3D"background-color: rgb(255, =
255, 255);"><span class=3D"colour" style=3D"color: rgb(0, 0, 0);"> </span><=
/span><br><span class=3D"highlight" style=3D"background-color: rgb(20, 22, =
27);"><span class=3D"colour" style=3D"color: rgb(224, 226, 234);"> 1 file c=
hanged, 6 insertions(+), 3 deletions(-)</span></span><span class=3D"highlig=
ht" style=3D"background-color: rgb(255, 255, 255);"><span class=3D"colour" =
style=3D"color: rgb(0, 0, 0);"> </span></span><br> <br><span class=3D"highl=
ight" style=3D"background-color: rgb(20, 22, 27);"><span class=3D"colour" s=
tyle=3D"color: rgb(224, 226, 234);">diff --git a/xen/arch/arm/platforms/brc=
m-raspberry-pi.c b/xen/arch/arm/platforms/brcm-raspberry-pi.c</span></span>=
<span class=3D"highlight" style=3D"background-color: rgb(255, 255, 255);"><=
span class=3D"colour" style=3D"color: rgb(0, 0, 0);"> </span></span><br><sp=
an class=3D"highlight" style=3D"background-color: rgb(20, 22, 27);"><span c=
lass=3D"colour" style=3D"color: rgb(224, 226, 234);">index 811b40b1a6..74fc=
a7ecc5 100644</span></span><span class=3D"highlight" style=3D"background-co=
lor: rgb(255, 255, 255);"><span class=3D"colour" style=3D"color: rgb(0, 0, =
0);"> </span></span><br><span class=3D"highlight" style=3D"background-color=
: rgb(20, 22, 27);"><span class=3D"colour" style=3D"color: rgb(224, 226, 23=
4);">--- a/xen/arch/arm/platforms/brcm-raspberry-pi.c</span></span><span cl=
ass=3D"highlight" style=3D"background-color: rgb(255, 255, 255);"><span cla=
ss=3D"colour" style=3D"color: rgb(0, 0, 0);"> </span></span><br><span class=
=3D"highlight" style=3D"background-color: rgb(20, 22, 27);"><span class=3D"=
colour" style=3D"color: rgb(224, 226, 234);">+++ b/xen/arch/arm/platforms/b=
rcm-raspberry-pi.c</span></span><span class=3D"highlight" style=3D"backgrou=
nd-color: rgb(255, 255, 255);"><span class=3D"colour" style=3D"color: rgb(0=
, 0, 0);"> </span></span><br><span class=3D"highlight" style=3D"background-=
color: rgb(20, 22, 27);"><span class=3D"colour" style=3D"color: rgb(224, 22=
6, 234);"><b>@@ -60,9 +60,12 @@</b> static void __iomem *rpi4_map_watchdog(=
void)</span></span><span class=3D"highlight" style=3D"background-color: rgb=
(255, 255, 255);"><span class=3D"colour" style=3D"color: rgb(0, 0, 0);"> </=
span></span><br><span class=3D"highlight" style=3D"background-color: rgb(20=
, 22, 27);"><span class=3D"colour" style=3D"color: rgb(224, 226, 234);"> =
=C2=A0=C2=A0=C2=A0=C2=A0paddr_t start, len;</span></span><span class=3D"highli=
ght" style=3D"background-color: rgb(255, 255, 255);"><span class=3D"colour"=
 style=3D"color: rgb(0, 0, 0);"> </span></span><br><span class=3D"highlight=
" style=3D"background-color: rgb(20, 22, 27);"><span class=3D"colour" style=
=3D"color: rgb(224, 226, 234);"> =C2=A0=C2=A0=C2=A0=C2=A0int ret;</span></s=
pan><span class=3D"highlight" style=3D"background-color: rgb(255, 255, 255)=
;"><span class=3D"colour" style=3D"color: rgb(0, 0, 0);"> </span></span><br=
> <br><span class=3D"highlight" style=3D"background-color: rgb(20, 22, 27);=
"><span class=3D"colour" style=3D"color: rgb(255, 192, 185);">- =C2=A0=C2=
=A0=C2=A0node =3D dt_find_compatible_node(NULL, NULL, "brcm,bcm2835-pm");</spa=
n></span><span class=3D"highlight" style=3D"background-color: rgb(255, 255,=
 255);"><span class=3D"colour" style=3D"color: rgb(0, 0, 0);"> </span></spa=
n><br><span class=3D"highlight" style=3D"background-color: rgb(20, 22, 27);=
"><span class=3D"colour" style=3D"color: rgb(255, 192, 185);">- =C2=A0=C2=
=A0=C2=A0if ( !node )</span></span><span class=3D"highlight" style=3D"backgrou=
nd-color: rgb(255, 255, 255);"><span class=3D"colour" style=3D"color: rgb(0=
, 0, 0);"> </span></span><br><span class=3D"highlight" style=3D"background-=
color: rgb(20, 22, 27);"><span class=3D"colour" style=3D"color: rgb(255, 19=
2, 185);">- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NULL;</span></=
span><span class=3D"highlight" style=3D"background-color: rgb(255, 255, 255=
);"><span class=3D"colour" style=3D"color: rgb(0, 0, 0);"> </span></span><b=
r><span class=3D"highlight" style=3D"background-color: rgb(20, 22, 27);"><s=
pan class=3D"colour" style=3D"color: rgb(179, 246, 192);">+ =C2=A0=C2=A0=
=C2=A0node =3D dt_find_compatible_node(NULL, NULL, "brcm,bcm2711-pm");</span><=
/span><span class=3D"highlight" style=3D"background-color: rgb(255, 255, 25=
5);"><span class=3D"colour" style=3D"color: rgb(0, 0, 0);"> </span></span><=
br><span class=3D"highlight" style=3D"background-color: rgb(20, 22, 27);"><=
span class=3D"colour" style=3D"color: rgb(179, 246, 192);">+ =C2=A0=C2=A0=
=C2=A0if ( !node ) {</span></span><span class=3D"highlight" style=3D"backgroun=
d-color: rgb(255, 255, 255);"><span class=3D"colour" style=3D"color: rgb(0,=
 0, 0);"> </span></span><br><span class=3D"highlight" style=3D"background-c=
olor: rgb(20, 22, 27);"><span class=3D"colour" style=3D"color: rgb(179, 246=
, 192);">+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0node =3D dt_find_compa=
tible_node(NULL, NULL, "brcm,bcm2835-pm");</span></span><span class=3D"high=
light" style=3D"background-color: rgb(255, 255, 255);"><span class=3D"colou=
r" style=3D"color: rgb(0, 0, 0);"> </span></span><br><span class=3D"highlig=
ht" style=3D"background-color: rgb(20, 22, 27);"><span class=3D"colour" sty=
le=3D"color: rgb(179, 246, 192);">+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0if ( !node )</span></span><span class=3D"highlight" style=3D"background-=
color: rgb(255, 255, 255);"><span class=3D"colour" style=3D"color: rgb(0, 0=
, 0);"> </span></span><br><span class=3D"highlight" style=3D"background-col=
or: rgb(20, 22, 27);"><span class=3D"colour" style=3D"color: rgb(179, 246, =
192);">+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0return NULL;</span></span><span class=3D"highlight" style=3D"background-col=
or: rgb(255, 255, 255);"><span class=3D"colour" style=3D"color: rgb(0, 0, 0=
);"> </span></span><br><span class=3D"highlight" style=3D"background-color:=
 rgb(20, 22, 27);"><span class=3D"colour" style=3D"color: rgb(179, 246, 192=
);">+ =C2=A0=C2=A0=C2=A0}</span></span><span class=3D"highlight" style=3D"b=
ackground-color: rgb(255, 255, 255);"><span class=3D"colour" style=3D"color=
: rgb(0, 0, 0);"> </span></span><br> <br><span class=3D"highlight" style=
=3D"background-color: rgb(20, 22, 27);"><span class=3D"colour" style=3D"color:=
 rgb(224, 226, 234);"> =C2=A0=C2=A0=C2=A0=C2=A0ret =3D dt_device_get_addres=
s(node, 0, &start, &len);</span></span><span class=3D"highlight" style=3D"b=
ackground-color: rgb(255, 255, 255);"><span class=3D"colour" style=3D"color=
: rgb(0, 0, 0);"> </span></span><br><span class=3D"highlight" style=3D"back=
ground-color: rgb(20, 22, 27);"><span class=3D"colour" style=3D"color: rgb(=
224, 226, 234);"> =C2=A0=C2=A0=C2=A0=C2=A0if ( ret )</span></span><span cla=
ss=3D"highlight" style=3D"background-color: rgb(255, 255, 255);"><span clas=
s=3D"colour" style=3D"color: rgb(0, 0, 0);"> </span></span><br><span class=
=3D"highlight" style=3D"background-color: rgb(20, 22, 27);"><span class=3D"col=
our" style=3D"color: rgb(255, 192, 185);">-- </span></span><span class=3D"h=
ighlight" style=3D"background-color: rgb(255, 255, 255);"><span class=3D"co=
lour" style=3D"color: rgb(0, 0, 0);">=C2=A0</span></span><br><span class=
=3D"highlight" style=3D"background-color: rgb(20, 22, 27);"><span class=3D"col=
our" style=3D"color: rgb(224, 226, 234);"><b>2.47.2</b></span></span><span =
class=3D"highlight" style=3D"background-color: rgb(255, 255, 255);"><span c=
lass=3D"colour" style=3D"color: rgb(0, 0, 0);"></span></span></span></div><=
div><br></div><div><br></div><div><br></div><div>On Friday, May 30, 2025 at=
 11:40:23 pm +03:00, Julien Grall &lt;julien@xen.org> wrote:<br></div><bloc=
kquote><div class=3D"oneComWebmail-mail"><div class=3D"oneComWebmail-body">=
<div>Hi Evgeny,<br></div><div><br></div><div>Thank you for the patch. Let m=
e start with the process,<br></div><div>patches are submitted inline rather=
 than in attachment.<br></div><div><br></div><div>git-send-email commmand c=
an do that for you.<br></div><div><br></div><div>Now regarding the patch. I=
 understand that newer kernel<br></div><div>will use the new compatible. Bu=
t I would assume there is<br></div><div>still some device-tree out using th=
e old property. So I<br></div><div>think Xen needs to check both compatible=
.<br></div><div><br></div><div>Lastly, for the future,when mentioning we co=
mmit, we tend to use a smaller<br></div><div>hash (12 digits) followed by t=
he commit title. In your case,<br></div><div>it would be:<br></div><div><br=
></div><div>b334c1afad17 ("ARM: dts: bcm2711: Use proper compatible in PM/W=
atchdog node").<br></div><div><br></div><div>Cheers,<br></div><div><br></di=
v><div>-- <br></div><div>Julien Grall<br></div></div></div></blockquote><di=
v><br></div>

------------40482-1754252178882-2--
------------40482-1754252178882-1--


