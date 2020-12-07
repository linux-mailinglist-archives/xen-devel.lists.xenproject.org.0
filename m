Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98DD2D1251
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 14:42:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46586.82672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGlc-00088Y-LM; Mon, 07 Dec 2020 13:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46586.82672; Mon, 07 Dec 2020 13:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGlc-000889-I8; Mon, 07 Dec 2020 13:41:28 +0000
Received: by outflank-mailman (input) for mailman id 46586;
 Mon, 07 Dec 2020 13:41:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xlZz=FL=bounce.vates.fr=bounce-md_30504962.5fce3105.v1-c51429d20de44e80987a2908f93cb7af@srs-us1.protection.inumbo.net>)
 id 1kmGlb-00087o-9F
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 13:41:27 +0000
Received: from mail187-17.suw11.mandrillapp.com (unknown [198.2.187.17])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10729004-03fd-4487-a5c9-bd2facc0a2eb;
 Mon, 07 Dec 2020 13:41:26 +0000 (UTC)
Received: from pmta01.mandrill.prod.suw01.rsglab.com (127.0.0.1) by
 mail187-17.suw11.mandrillapp.com id hpoogc174i40 for
 <xen-devel@lists.xenproject.org>;
 Mon, 7 Dec 2020 13:41:26 +0000 (envelope-from
 <bounce-md_30504962.5fce3105.v1-c51429d20de44e80987a2908f93cb7af@bounce.vates.fr>)
Received: from [185.78.159.90] by mandrillapp.com id
 c51429d20de44e80987a2908f93cb7af; Mon, 07 Dec 2020 13:41:25 +0000
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
X-Inumbo-ID: 10729004-03fd-4487-a5c9-bd2facc0a2eb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mandrill; d=vates.fr;
 h=From:Subject:To:Message-Id:Date:MIME-Version:Content-Type; i=benjamin.reis@vates.fr;
 bh=uwjndJrzvEh86+hmZ4HZG7uKSNuP8jinRy8UFX+YLjk=;
 b=oWAAAxX0JmVr3HVZ/U1zOau1KB89nT1uvicl0YF1y1adv2xFx9oxlE0BxTYniliJ9FvAbiKTcnYD
   xic0kpVM3HmdHxqogNqPeJh84+/NfZ2rq5x1vDxm5qS2X1rxdv8bFQM4UtM4kkVXKqBaxROONCYy
   IeUYv4F9PMVmTG76kyg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1607348485; h=From : 
 Subject : To : Message-Id : Date : MIME-Version : Content-Type : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=uwjndJrzvEh86+hmZ4HZG7uKSNuP8jinRy8UFX+YLjk=; 
 b=XzhHYpIhchXFtRm38/7Yc1zYqg7pgGJQlSF5LZ6YmCUnOWgJzs2K+qrVN1PAeJMy94m2Mo
 F8zFHepejDqXjICt+5H4RvOJmQp61ARZBB0TuI6pKjWyWMq4X9KJepaBdJAsk36EI2hqQo8s
 y9g0vXJTynF5pKLaXmKbcamfG0Beo=
From: Benjamin Reis <benjamin.reis@vates.fr>
Subject: [Help Wanted] New toolstack Rust PoC
X-Virus-Scanned: amavisd-new at plam.fr
To: xen-devel@lists.xenproject.org
Message-Id: <1b86b418-71e1-3422-6531-00af746cf7a8@vates.fr>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.c51429d20de44e80987a2908f93cb7af
X-Mandrill-User: md_30504962
Date: Mon, 07 Dec 2020 13:41:25 +0000
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_av-VT238g60RITZZ1j9P4kUSA"

--_av-VT238g60RITZZ1j9P4kUSA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

As you may know: we are working on a rust PoC 
(https://github.com/xcp-ng/xenopsd-ng/rust/ 
<https://github.com/xcp-ng/xenopsd-ng/pull/13>) for the new Xen 
Toolstack. We have partial bindings for Xenctrl and Xenstore and with 
that we're able to pause/unpause/shutdown a guest and we're close to 
booting a XTF guest (https://github.com/xcp-ng/xenopsd-ng/pull/13 
<https://github.com/xcp-ng/xenopsd-ng/pull/13>).

We are new to Xen so we're having a hard time finding what's wrong with 
our current code, so we're looking for some help/guidance to keep our 
PoC going forward. We're suspecting that in hypercall fails silently 
when setting the guest's hvm context. Would anyone be interested in 
helping us debugging/developping the PoC? We're currently tracking this 
issue here: https://github.com/xcp-ng/xenopsd-ng/issues/17. Hoping to 
hear from you soon. Benjamin Reis Vates SAS



--_av-VT238g60RITZZ1j9P4kUSA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p style=3D"box-sizing: border-box; margin: 0px; font-size: 13.5px; lin=
e-height: 1.6em; white-space: pre-wrap; width: 1598px; word-break: break-wo=
rd; color: rgb(221, 221, 221); font-family: &quot;Open Sans&quot;, sans-ser=
if; font-style: normal; font-variant-ligatures: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: s=
tart; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; background-color: rgba(221, 221, 221, 0.04=
); text-decoration-thickness: initial; text-decoration-style: initial; text=
-decoration-color: initial;">Hi all, 
</p>
    <p style=3D"box-sizing: border-box; margin: 0px; font-size: 13.5px; lin=
e-height: 1.6em; white-space: pre-wrap; width: 1598px; word-break: break-wo=
rd; color: rgb(221, 221, 221); font-family: &quot;Open Sans&quot;, sans-ser=
if; font-style: normal; font-variant-ligatures: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: s=
tart; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; background-color: rgba(221, 221, 221, 0.04=
); text-decoration-thickness: initial; text-decoration-style: initial; text=
-decoration-color: initial;">
</p>
    <p style=3D"box-sizing: border-box; margin: 0.5em 0px 0px; font-size: 1=
3.5px; line-height: 1.6em; white-space: pre-wrap; width: 1598px; word-break=
: break-word; color: rgb(221, 221, 221); font-family: &quot;Open Sans&quot;=
, sans-serif; font-style: normal; font-variant-ligatures: normal; font-vari=
ant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; tex=
t-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(221, 221,=
 221, 0.04); text-decoration-thickness: initial; text-decoration-style: ini=
tial; text-decoration-color: initial;">As you may know: we are working on a=
 rust PoC (<a class=3D"theme markdown__link" href=3D"https://github.com/xcp=
-ng/xenopsd-ng/pull/13" rel=3D"noreferrer" target=3D"_blank" style=3D"box-s=
izing: border-box; background-color: transparent; color: rgb(164, 255, 235)=
; text-decoration: none; cursor: pointer; word-break: break-word;">https://=
github.com/xcp-ng/xenopsd-ng/rust/</a>) for the new Xen Toolstack.
We have partial bindings for Xenctrl and Xenstore and with that we're able =
to pause/unpause/shutdown a guest and we're close to booting a XTF guest (<=
a class=3D"theme markdown__link" href=3D"https://github.com/xcp-ng/xenopsd-=
ng/pull/13" rel=3D"noreferrer" target=3D"_blank" style=3D"box-sizing: borde=
r-box; background-color: transparent; color: rgb(164, 255, 235); text-decor=
ation: none; cursor: pointer; word-break: break-word;">https://github.com/x=
cp-ng/xenopsd-ng/pull/13</a>).</p>
    <p style=3D"box-sizing: border-box; margin: 0.5em 0px 0px; font-size: 1=
3.5px; line-height: 1.6em; white-space: pre-wrap; width: 1598px; word-break=
: break-word; color: rgb(221, 221, 221); font-family: &quot;Open Sans&quot;=
, sans-serif; font-style: normal; font-variant-ligatures: normal; font-vari=
ant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; tex=
t-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(221, 221,=
 221, 0.04); text-decoration-thickness: initial; text-decoration-style: ini=
tial; text-decoration-color: initial;">We are new to Xen so we're having a =
hard time finding what's wrong with our current code, so we're looking for =
some help/guidance to keep our PoC going forward.
We're suspecting that in hypercall fails silently when setting the guest's =
hvm context.
Would anyone be interested in helping us debugging/developping the PoC?
We're currently tracking this issue here: <a class=3D"moz-txt-link-freetext=
" href=3D"https://github.com/xcp-ng/xenopsd-ng/issues/17">https://github.co=
m/xcp-ng/xenopsd-ng/issues/17</a>.

Hoping to hear from you soon.

Benjamin Reis
Vates SAS
</p>
  <img src=3D"https://mandrillapp.com/track/open.php?u=3D30504962&id=3Dc514=
29d20de44e80987a2908f93cb7af" height=3D"1" width=3D"1"></body>
</html>


--_av-VT238g60RITZZ1j9P4kUSA--


