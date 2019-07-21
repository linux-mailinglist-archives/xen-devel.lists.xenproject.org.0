Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524C96F57A
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jul 2019 22:08:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpI6G-0003Cg-Ll; Sun, 21 Jul 2019 20:06:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ovs/=VS=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1hpI6E-0003CS-LV
 for xen-devel@lists.xenproject.org; Sun, 21 Jul 2019 20:06:26 +0000
X-Inumbo-ID: 03958856-abf3-11e9-8980-bc764e045a96
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 03958856-abf3-11e9-8980-bc764e045a96;
 Sun, 21 Jul 2019 20:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com;
 s=alpha; 
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date;
 bh=FC4CDtXxadhPdw31T9RyUNvTwASbivHrz/9AA4QnhZs=; 
 b=yYjvXALGyxj8fGiF0g32prxYcyWUAbz6BanYp54x2ogubE2BUrOwuaKqW5jjjUkXPaEg9m38KJEzpyELpXbjFmZv2t+jCuD76cNlKkcVhVzMVXQAgHhRoJs7/ysIib73BiWu/m4O01nLrug/aQqMyvNuFguE/8Fu39mMzNi6eHa4nfmLM69afZnj8d4Dd7OLmsrtZlPMq64urUoGrioXw82NNVffWmq8yiMAhkCSd4Idqh1R1Rb/gGL2/D2bpvfHbunabM7zfwabnnFy5y+EZfxKpnKs1cBf5oUwqNjW9GqSZsYbJVDZhRxpoIZwQLYwxVLynsnThpUeWijfzzB61g==;
Received: from andy by mail.bitfolk.com with local (Exim 4.84_2)
 (envelope-from <andy@strugglers.net>) id 1hpI6B-0004HK-FX
 for xen-devel@lists.xenproject.org; Sun, 21 Jul 2019 20:06:23 +0000
Date: Sun, 21 Jul 2019 20:06:23 +0000
From: Andy Smith <andy@strugglers.net>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <20190721200623.GJ11726@bitfolk.com>
MIME-Version: 1.0
Content-Disposition: inline
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false
Subject: [Xen-devel] "CPU N still not dead..." messages during microcode
 update stage of boot when smt=0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpNeSBmaXJzdCB0aW1lIHVzaW5nIHNtdD0wIG9uIGh5cGVydmlzb3IgY29tbWFuZCBsaW5l
IHNvIG5vdCBzdXJlIGhvdwptYW55IHZlcnNpb25zIGFuZCBkaWZmZXJlbnQgcGllY2VzIG9mIGhh
cmR3YXJlIHRoaXMgaGFwcGVucyB3aXRoLApidXQgSSBub3RpY2VkIHRoaXMgZHVyaW5nIHRoZSBt
aWNyb2NvZGUgdXBkYXRlIHN0YWdlIG9mIGJvb3Q6CgooWEVOKSBIVk06IEhBUCBwYWdlIHNpemVz
OiA0a0IsIDJNQiwgMUdCCihYRU4pIEFkZGluZyBjcHUgMSB0byBydW5xdWV1ZSAwCihYRU4pIENQ
VSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4p
IENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihY
RU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4u
CihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFk
Li4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBk
ZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5v
dCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxs
IG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0
aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAx
IHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQ
VSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4p
IENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihY
RU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4uCihYRU4pIENQVSAxIHN0aWxsIG5vdCBkZWFkLi4u
CihYRU4pIFJlbW92aW5nIGNwdSAxIGZyb20gcnVucXVldWUgMAooWEVOKSBtaWNyb2NvZGU6IENQ
VTIgdXBkYXRlZCBmcm9tIHJldmlzaW9uIDB4MjAwMDA1NyB0byAweDIwMDAwNWUsIGRhdGUgPSAy
MDE5LTA0LTAyIAooWEVOKSBBZGRpbmcgY3B1IDIgdG8gcnVucXVldWUgMAooWEVOKSBBZGRpbmcg
Y3B1IDMgdG8gcnVucXVldWUgMAooWEVOKSBSZW1vdmluZyBjcHUgMyBmcm9tIHJ1bnF1ZXVlIDAK
KFhFTikgbWljcm9jb2RlOiBDUFU0IHVwZGF0ZWQgZnJvbSByZXZpc2lvbiAweDIwMDAwNTcgdG8g
MHgyMDAwMDVlLCBkYXRlID0gMjAxOS0wNC0wMiAKKFhFTikgQWRkaW5nIGNwdSA0IHRvIHJ1bnF1
ZXVlIDAKKFhFTikgQWRkaW5nIGNwdSA1IHRvIHJ1bnF1ZXVlIDAKKFhFTikgUmVtb3ZpbmcgY3B1
IDUgZnJvbSBydW5xdWV1ZSAwCihYRU4pIG1pY3JvY29kZTogQ1BVNiB1cGRhdGVkIGZyb20gcmV2
aXNpb24gMHgyMDAwMDU3IHRvIDB4MjAwMDA1ZSwgZGF0ZSA9IDIwMTktMDQtMDIgCihYRU4pIEFk
ZGluZyBjcHUgNiB0byBydW5xdWV1ZSAwCihYRU4pIEFkZGluZyBjcHUgNyB0byBydW5xdWV1ZSAw
CihYRU4pIFJlbW92aW5nIGNwdSA3IGZyb20gcnVucXVldWUgMAooWEVOKSBtaWNyb2NvZGU6IENQ
VTggdXBkYXRlZCBmcm9tIHJldmlzaW9uIDB4MjAwMDA1NyB0byAweDIwMDAwNWUsIGRhdGUgPSAy
MDE5LTA0LTAyIAooWEVOKSBBZGRpbmcgY3B1IDggdG8gcnVucXVldWUgMAooWEVOKSBBZGRpbmcg
Y3B1IDkgdG8gcnVucXVldWUgMAooWEVOKSBSZW1vdmluZyBjcHUgOSBmcm9tIHJ1bnF1ZXVlIDAK
KFhFTikgbWljcm9jb2RlOiBDUFUxMCB1cGRhdGVkIGZyb20gcmV2aXNpb24gMHgyMDAwMDU3IHRv
IDB4MjAwMDA1ZSwgZGF0ZSA9IDIwMTktMDQtMDIgCihYRU4pIEFkZGluZyBjcHUgMTAgdG8gcnVu
cXVldWUgMAooWEVOKSBBZGRpbmcgY3B1IDExIHRvIHJ1bnF1ZXVlIDAKKFhFTikgUmVtb3Zpbmcg
Y3B1IDExIGZyb20gcnVucXVldWUgMAooWEVOKSBtaWNyb2NvZGU6IENQVTEyIHVwZGF0ZWQgZnJv
bSByZXZpc2lvbiAweDIwMDAwNTcgdG8gMHgyMDAwMDVlLCBkYXRlID0gMjAxOS0wNC0wMiAKKFhF
TikgQWRkaW5nIGNwdSAxMiB0byBydW5xdWV1ZSAwCihYRU4pIEFkZGluZyBjcHUgMTMgdG8gcnVu
cXVldWUgMAooWEVOKSBSZW1vdmluZyBjcHUgMTMgZnJvbSBydW5xdWV1ZSAwCihYRU4pIG1pY3Jv
Y29kZTogQ1BVMTQgdXBkYXRlZCBmcm9tIHJldmlzaW9uIDB4MjAwMDA1NyB0byAweDIwMDAwNWUs
IGRhdGUgPSAyMDE5LTA0LTAyIAooWEVOKSBBZGRpbmcgY3B1IDE0IHRvIHJ1bnF1ZXVlIDAKKFhF
TikgQWRkaW5nIGNwdSAxNSB0byBydW5xdWV1ZSAwCihYRU4pIFJlbW92aW5nIGNwdSAxNSBmcm9t
IHJ1bnF1ZXVlIDAKKFhFTikgQnJvdWdodCB1cCA4IENQVXMKKFhFTikgUGFya2VkIDggQ1BVcwoK
SXQgZG9lc24ndCBoYXBwZW4gd2l0aCBzbXQ9MSBhbmQgaXQgYWxzbyBkb2Vzbid0IGhhcHBlbiB3
aGVuIFNNVCBpcwpkaXNhYmxlZCBpbiB0aGUgQklPUy4KCkJvb3QgZG9lcyBjb250aW51ZSBub3Jt
YWxseSBhZnRlciB0aGlzIHBvaW50LgoKSXMgdGhpcyBleHBlY3RlZD8gNC4xMi4KCkNoZWVycywK
QW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
