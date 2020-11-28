Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7362C6FAA
	for <lists+xen-devel@lfdr.de>; Sat, 28 Nov 2020 15:43:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40017.73084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kj1RA-0002o5-Ov; Sat, 28 Nov 2020 14:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40017.73084; Sat, 28 Nov 2020 14:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kj1RA-0002nI-LD; Sat, 28 Nov 2020 14:42:56 +0000
Received: by outflank-mailman (input) for mailman id 40017;
 Sat, 28 Nov 2020 14:33:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IEe=FC=qq.com=2284696125@srs-us1.protection.inumbo.net>)
 id 1kj1Hm-0001tv-7v
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2020 14:33:14 +0000
Received: from smtpbg.qq.com (unknown [203.205.250.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7898ce37-7440-4b50-a020-856014c6d465;
 Sat, 28 Nov 2020 14:32:43 +0000 (UTC)
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Sat, 28 Nov 2020 22:32:40 +0800 (CST)
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
X-Inumbo-ID: 7898ce37-7440-4b50-a020-856014c6d465
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1606573960; bh=9xcn4M0R0XCRv1C2cX4i1VQxdz2N6enx/7LssllUF4k=;
	h=From:To:Subject:Mime-Version:Date:Message-ID;
	b=RBmvVyIjmaN1SSZ3q20AewNIwHPCGEP5WYwUi1fSO8k8u/v78vtaQjTQBEDWMHSyz
	 d8Y/8iBV7RFqaJUGOGJWkiWotBUX0NCErgx8Q4Rgq+axhz5HncuK1G29missiWhRaQ
	 KQMFzGIhifkjbanlHsX6B/zlMBNXAboMGiVqe78o=
X-QQ-FEAT: YuwbzFVdD1jhZGnyd/OIcNNnihs0ppT20efISsTMmjjcyE2TWhFTB5c3mjpk8
	VVhygR7QirI3luuflYsAH500/Uj2iGZW+jw4zjSVsr0kfq8guFaIUfCXDIZwkOWUF6bxSGY
	JBlfguWcOAw45clBogNqYdY8Jq8oMYxt42btoEF6fEk/LPooN5PD9EXRqaASxKmWNjGVNSk
	UsCfde16ygNHzVv/jPd/OC+0jx2xlgu1z1ic1BtmqkT95UIVcZeVXcThVzU2LiRyNgfHXIn
	trdw==
X-QQ-SSF: 0000000000000010000000000000008
X-QQ-XMAILINFO: OAYk33bJfOB1Tbu4xvO+1ePYoadnMSC9OvVXg1nUTNfJ+g0gFueyx6z6KDPYjx
	 UuaSEFKLI7O1H9suWNMq0cxI6idAQnP+/a45XWjTHq/QnTFF7l+/BiZMDMnVZh+uQKatjBjiBlgBJ
	 CnjnpQxPi2Q0EVmmPf0dN1xAwMgX+RUYVP7ZL0PJPB+BhbphJxqdF8OJqyWJQTA1HeVzlufq3a4GL
	 SIAq/8tA2v+FYtBuCV6S243Uj2zu2JMeJdR7vJyhiUGL7kbJhaGJcI1udT/MBCy/tTw8C0PpJZPfe
	 CWgc2UQn0Fx1BTJ8etdE8PcIBSs7Z1dU6ad250DKUpX/Cn5FYlFolg3JeUoaPqU0IyvueAkLznwKb
	 ukWXURHMLLz2J5lVsjJKSg+VWVj2+6a2tNs1yxFu+zMBBQGh/DAL0cS/XGE+8HBpRm0prgW8/24VA
	 ljUhWj9hMdDuNBTLhlVTwTy2N8GE2Zj6jSA0ndA+ekp3Ug+AWrBfx7e2FSMPn96VNe7L9dEgr3bhR
	 g+oLpqdfzQ3RIcy2OXt5EntT04xX4WtN1vo9C2JK0EapAwQQd3XABqcEJtniIT1ox/Zf7l97u5oV3
	 4H+hzgIjGL6Q5oXykQWguEoYJfDpQWFNgHREDPCyU0gEuZrveOpvYQTKrpMvPEnwD3LHzKpwp4ulC
	 kwW/Mn/BtfM5clotgjNOIpiJYWN+VPstTfwC8x
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 166.111.122.112
X-QQ-STYLE: 
X-QQ-mid: webmail801t1606573958t7901344
From: "=?ISO-8859-1?B?UnJvYWNo?=" <2284696125@qq.com>
To: "=?ISO-8859-1?B?eGVuLWRldmVs?=" <xen-devel@lists.xenproject.org>
Subject: help
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5FC25F86_0F661C10_7D003348"
Content-Transfer-Encoding: 8Bit
Date: Sat, 28 Nov 2020 22:32:38 +0800
X-Priority: 3
Message-ID: <tencent_11A93B706FAC57659EC62A5E5EBF22DEB705@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Feedback-ID: webmail:qq.com:bgweb:bgweb4

This is a multi-part message in MIME format.

------=_NextPart_5FC25F86_0F661C10_7D003348
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGksIEknbSBhdHRlbXB0aW5nIHRvIHVzZSBhZGRyZXNzIHNhbml0aXplciBpbiBsb2NhdGlu
ZyBidWdzIGluIFhlbiA0LTEzLCB3aGlsZSB1c2UgYWRkcmVzcyBzYW5pdGl6ZXIgaW4gdG9v
bHMgbW9kdWxlcywgd2hpbGUgSSByYW4gc29tZSBiYXNpYyBpbnN0cnVjdGlvbnMgbGlrZSB4
bCwgWGVuIHJlcG9ydCBzdWNoIGJ1ZzoNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo9PTI4NjM9PUVSUk9SOiBM
ZWFrU2FuaXRpemVyOiBkZXRlY3RlZCBtZW1vcnkgbGVha3MNCg0KRGlyZWN0IGxlYWsgb2Yg
Mjk2IGJ5dGUocykgaW4gMTEgb2JqZWN0KHMpIGFsbG9jYXRlZCBmcm9tOg0KJm5ic3A7ICZu
YnNwOyAjMCAweDdmNWI5MWFlZmQyOCBpbiBtYWxsb2MgKC91c3IvbGliL3g4Nl82NC1saW51
eC1nbnUvbGliYXNhbi5zby4zKzB4YzFkMjgpDQombmJzcDsgJm5ic3A7ICMxIDB4NDY3OTk3
Jm5ic3A7ICgvdXNyL2Jpbi94ODZfNjQtbGludXgtZ251LWdjYy02KzB4NDY3OTk3KQ0KDQpJ
bmRpcmVjdCBsZWFrIG9mIDEwIGJ5dGUocykgaW4gMSBvYmplY3QocykgYWxsb2NhdGVkIGZy
b206DQombmJzcDsgJm5ic3A7ICMwIDB4N2Y1YjkxYWVmZDI4IGluIG1hbGxvYyAoL3Vzci9s
aWIveDg2XzY0LWxpbnV4LWdudS9saWJhc2FuLnNvLjMrMHhjMWQyOCkNCiZuYnNwOyAmbmJz
cDsgIzEgMHg0Njc5OTcmbmJzcDsgKC91c3IvYmluL3g4Nl82NC1saW51eC1nbnUtZ2NjLTYr
MHg0Njc5OTcpDQoNClNVTU1BUlk6IEFkZHJlc3NTYW5pdGl6ZXI6IDMwNiBieXRlKHMpIGxl
YWtlZCBpbiAxMiBhbGxvY2F0aW9uKHMpLg0KL3Jvb3QvZmF1bHR4ZW4vdG9vbHMvbGlicy90
b29sY29yZS8uLi8uLi8uLi90b29scy9SdWxlcy5tazoyMjQ6IHJlY2lwZSBmb3IgdGFyZ2V0
ICdoZWFkZXJzLmNoaycgZmFpbGVkDQptYWtlWzVdOiAqKiogW2hlYWRlcnMuY2hrXSBFcnJv
ciAxDQoNCj09NzUyMD09RVJST1I6IExlYWtTYW5pdGl6ZXI6IGRldGVjdGVkIG1lbW9yeSBs
ZWFrcw0KDQpEaXJlY3QgbGVhayBvZiAxMCBieXRlKHMpIGluIDEgb2JqZWN0KHMpIGFsbG9j
YXRlZCBmcm9tOg0KJm5ic3A7ICZuYnNwOyAjMCAweDdmZDEwMjhjOGQyOCBpbiBtYWxsb2Mg
KC91c3IvbGliL3g4Nl82NC1saW51eC1nbnUvbGliYXNhbi5zby4zKzB4YzFkMjgpDQombmJz
cDsgJm5ic3A7ICMxIDB4N2ZkMTAyMmU0M2I5IGluIF9fc3RyZHVwICgvbGliL3g4Nl82NC1s
aW51eC1nbnUvbGliYy5zby42KzB4ODAzYjkpDQoNClNVTU1BUlk6IEFkZHJlc3NTYW5pdGl6
ZXI6IDEwIGJ5dGUocykgbGVha2VkIGluIDEgYWxsb2NhdGlvbihzKS4NCj09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
DQpJdCBzZWVtcyB0aGlzIGJ1ZyBpcyB2ZXJ5IGxvdy1sZXZlbCwgYW5kIGFmZmVjdHMgbWFu
eSBiYXNpYyBvcGVyYXRpb25zLCBkbyB5b3UgaGF2ZSBhbnkgaWRlYSB3aGF0IGNhdXNlIHN1
Y2ggYnVncz8=

------=_NextPart_5FC25F86_0F661C10_7D003348
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj5IaSwgSSdtIGF0dGVtcHRpbmcgdG8gdXNlIGFkZHJlc3Mg
c2FuaXRpemVyIGluIGxvY2F0aW5nIGJ1Z3MgaW4gWGVuIDQtMTMsIHdoaWxlIHVzZSBhZGRy
ZXNzIHNhbml0aXplciBpbiB0b29scyBtb2R1bGVzLCB3aGlsZSBJIHJhbiBzb21lIGJhc2lj
IGluc3RydWN0aW9ucyBsaWtlIHhsLCBYZW4gcmVwb3J0IHN1Y2ggYnVnOjwvZGl2PjxkaXY+
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT08YnI+PT0yODYzPT1FUlJPUjogTGVha1Nhbml0aXplcjogZGV0ZWN0ZWQg
bWVtb3J5IGxlYWtzPGJyPjxicj5EaXJlY3QgbGVhayBvZiAyOTYgYnl0ZShzKSBpbiAxMSBv
YmplY3QocykgYWxsb2NhdGVkIGZyb206PGJyPiZuYnNwOyAmbmJzcDsgIzAgMHg3ZjViOTFh
ZWZkMjggaW4gbWFsbG9jICgvdXNyL2xpYi94ODZfNjQtbGludXgtZ251L2xpYmFzYW4uc28u
MysweGMxZDI4KTxicj4mbmJzcDsgJm5ic3A7ICMxIDB4NDY3OTk3Jm5ic3A7ICgvdXNyL2Jp
bi94ODZfNjQtbGludXgtZ251LWdjYy02KzB4NDY3OTk3KTxicj48YnI+SW5kaXJlY3QgbGVh
ayBvZiAxMCBieXRlKHMpIGluIDEgb2JqZWN0KHMpIGFsbG9jYXRlZCBmcm9tOjxicj4mbmJz
cDsgJm5ic3A7ICMwIDB4N2Y1YjkxYWVmZDI4IGluIG1hbGxvYyAoL3Vzci9saWIveDg2XzY0
LWxpbnV4LWdudS9saWJhc2FuLnNvLjMrMHhjMWQyOCk8YnI+Jm5ic3A7ICZuYnNwOyAjMSAw
eDQ2Nzk5NyZuYnNwOyAoL3Vzci9iaW4veDg2XzY0LWxpbnV4LWdudS1nY2MtNisweDQ2Nzk5
Nyk8YnI+PGJyPlNVTU1BUlk6IEFkZHJlc3NTYW5pdGl6ZXI6IDMwNiBieXRlKHMpIGxlYWtl
ZCBpbiAxMiBhbGxvY2F0aW9uKHMpLjxicj4vcm9vdC9mYXVsdHhlbi90b29scy9saWJzL3Rv
b2xjb3JlLy4uLy4uLy4uL3Rvb2xzL1J1bGVzLm1rOjIyNDogcmVjaXBlIGZvciB0YXJnZXQg
J2hlYWRlcnMuY2hrJyBmYWlsZWQ8YnI+bWFrZVs1XTogKioqIFtoZWFkZXJzLmNoa10gRXJy
b3IgMTxicj48YnI+PT03NTIwPT1FUlJPUjogTGVha1Nhbml0aXplcjogZGV0ZWN0ZWQgbWVt
b3J5IGxlYWtzPGJyPjxicj5EaXJlY3QgbGVhayBvZiAxMCBieXRlKHMpIGluIDEgb2JqZWN0
KHMpIGFsbG9jYXRlZCBmcm9tOjxicj4mbmJzcDsgJm5ic3A7ICMwIDB4N2ZkMTAyOGM4ZDI4
IGluIG1hbGxvYyAoL3Vzci9saWIveDg2XzY0LWxpbnV4LWdudS9saWJhc2FuLnNvLjMrMHhj
MWQyOCk8YnI+Jm5ic3A7ICZuYnNwOyAjMSAweDdmZDEwMjJlNDNiOSBpbiBfX3N0cmR1cCAo
L2xpYi94ODZfNjQtbGludXgtZ251L2xpYmMuc28uNisweDgwM2I5KTxicj48YnI+U1VNTUFS
WTogQWRkcmVzc1Nhbml0aXplcjogMTAgYnl0ZShzKSBsZWFrZWQgaW4gMSBhbGxvY2F0aW9u
KHMpLjxicj49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PTwvZGl2PjxkaXY+SXQgc2VlbXMgdGhpcyBidWcgaXMgdmVy
eSBsb3ctbGV2ZWwsIGFuZCBhZmZlY3RzIG1hbnkgYmFzaWMgb3BlcmF0aW9ucywgZG8geW91
IGhhdmUgYW55IGlkZWEgd2hhdCBjYXVzZSBzdWNoIGJ1Z3M/IDxicj48L2Rpdj4=

------=_NextPart_5FC25F86_0F661C10_7D003348--


