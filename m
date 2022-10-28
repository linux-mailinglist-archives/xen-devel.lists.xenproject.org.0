Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51808610E1B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 12:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431872.684517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooMID-0006ar-Uo; Fri, 28 Oct 2022 10:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431872.684517; Fri, 28 Oct 2022 10:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooMID-0006Yb-S2; Fri, 28 Oct 2022 10:08:49 +0000
Received: by outflank-mailman (input) for mailman id 431872;
 Fri, 28 Oct 2022 10:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ooMIB-0006YV-Qw
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 10:08:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82626845-56a8-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 12:08:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BBB6F1F86B;
 Fri, 28 Oct 2022 10:08:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7E79213A6E;
 Fri, 28 Oct 2022 10:08:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uJRKHS2qW2NiMAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Oct 2022 10:08:45 +0000
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
X-Inumbo-ID: 82626845-56a8-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666951725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TnU+iYoPyoglay09VhRXgr5yQMxV8rttNsD3ycEHKug=;
	b=knfrsSVwOTS0meNdLoPwZ5FET3VH4F2+dmPsB0HSCCVbrvrxFtL+Vt7POXmnTzRZJxv3Sb
	vLXtZyALeePnfWNJTSzg/Xt/Pt/po5b7J7j9G8lEbGhkWt7urVYTSCEBxbo3dl6rv6xs4o
	zvHgAgq58dwb4sooEss2ugZwkeUkKa4=
Message-ID: <4977c33a-fe11-172a-11be-17acb01d61bb@suse.com>
Date: Fri, 28 Oct 2022 12:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221021145357.17931-1-jgross@suse.com>
 <Y1rKLJP/p+E+eVi7@mail-itl>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH-for-4.17] xen/sched: migrate timers to correct cpus after
 suspend
In-Reply-To: <Y1rKLJP/p+E+eVi7@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YlT41rAiS2D0e9gsCYcK3gDh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YlT41rAiS2D0e9gsCYcK3gDh
Content-Type: multipart/mixed; boundary="------------FL8GGzN6KMP3dgOgxr1IjBUU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Henry Wang <Henry.Wang@arm.com>
Message-ID: <4977c33a-fe11-172a-11be-17acb01d61bb@suse.com>
Subject: Re: [PATCH-for-4.17] xen/sched: migrate timers to correct cpus after
 suspend
References: <20221021145357.17931-1-jgross@suse.com>
 <Y1rKLJP/p+E+eVi7@mail-itl>
In-Reply-To: <Y1rKLJP/p+E+eVi7@mail-itl>

--------------FL8GGzN6KMP3dgOgxr1IjBUU
Content-Type: multipart/mixed; boundary="------------7vefNumKYJnunoQLa1wCcNQz"

--------------7vefNumKYJnunoQLa1wCcNQz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMTAuMjIgMjA6MTMsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gRnJpLCBPY3QgMjEsIDIwMjIgYXQgMDQ6NTM6NTdQTSArMDIwMCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+IFRvZGF5IGFsbCB0aW1lcnMgYXJlIG1pZ3JhdGVkIHRvIGNwdSAw
IHdoZW4gdGhlIHN5c3RlbSBpcyBiZWluZw0KPj4gc3VzcGVuZGVkLiBUaGV5IGFyZSBub3Qg
bWlncmF0ZWQgYmFjayBhZnRlciByZXN1bWluZyB0aGUgc3lzdGVtIGFnYWluLg0KPj4NCj4+
IFRoaXMgcmVzdWx0cyAoYXQgbGVhc3QpIHRvIHByb2JsZW1zIHdpdGggdGhlIGNyZWRpdCBz
Y2hlZHVsZXIsIGFzIHRoZQ0KPj4gdGltZXIgaXNuJ3QgaGFuZGxlZCBvbiB0aGUgY3B1IGl0
IHdhcyBleHBlY3RlZCB0byBvY2N1ci4NCj4+DQo+PiBBZGQgbWlncmF0aW5nIHRoZSBzY2hl
ZHVsaW5nIHJlbGF0ZWQgdGltZXJzIG9mIGEgc3BlY2lmaWMgY3B1IGZyb20gY3B1DQo+PiAw
IGJhY2sgdG8gaXRzIG9yaWdpbmFsIGNwdSB3aGVuIHRoYXQgY3B1IGhhcyBnb25lIHVwIHdo
ZW4gcmVzdW1pbmcgdGhlDQo+PiBzeXN0ZW0uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4gSSB0ZXN0ZWQgaXQgaW4gbXkg
c2V0dXAsIGJ1dCBpdCBjcmFzaGVkOg0KPiANCj4gKFhFTikgYXJjaC94ODYvY3B1L21jaGVj
ay9tY2VfaW50ZWwuYzo3NzA6IE1DQSBDYXBhYmlsaXR5OiBmaXJzdGJhbmsgMCwgZXh0ZW5k
ZWQgTUNFIE1TUiAwLCBCQ0FTVCwgQ01DSQ0KPiAoWEVOKSBDUFUwIENNQ0kgTFZUIHZlY3Rv
ciAoMHhmMSkgYWxyZWFkeSBpbnN0YWxsZWQNCj4gKFhFTikgRmluaXNoaW5nIHdha2V1cCBm
cm9tIEFDUEkgUzMgc3RhdGUuDQo+IChYRU4pIEVuYWJsaW5nIG5vbi1ib290IENQVXMgIC4u
Lg0KPiAoWEVOKSBQbGF0Zm9ybSB0aW1lciBhcHBlYXJzIHRvIGhhdmUgdW5leHBlY3RlZGx5
IHdyYXBwZWQgMyB0aW1lcy4NCj4gKFhFTikgLS0tLVsgWGVuLTQuMTctcmMgIHg4Nl82NCAg
ZGVidWc9eSAgVGFpbnRlZDogICBDICAgIF0tLS0tDQo+IChYRU4pIENQVTogICAgMA0KPiAo
WEVOKSBSSVA6ICAgIGUwMDg6WzxmZmZmODJkMDQwMjUwYzdlPl0gc2NoZWRfbWlncmF0ZV90
aW1lcnMrMHg0ZC8weGM5DQo+IChYRU4pIFJGTEFHUzogMDAwMDAwMDAwMDAxMDIwMiAgIENP
TlRFWFQ6IGh5cGVydmlzb3INCj4gKFhFTikgcmF4OiBmZmZmODJkMDQwNWM1Mjk4ICAgcmJ4
OiAwMDAwMDAwMDAwMDAwMDAwICAgcmN4OiAwMDAwMDAwMDAwMDAwMDAxDQo+IChYRU4pIHJk
eDogMDAwMDAwMzIxMTIxOTAwMCAgIHJzaTogMDAwMDAwMDAwMDAwMDAwNCAgIHJkaTogMDAw
MDAwMDAwMDAwMDAwMQ0KPiAoWEVOKSByYnA6IGZmZmY4MzAyNTYyMjdkMjAgICByc3A6IGZm
ZmY4MzAyNTYyMjdkMTggICByODogIGZmZmY4MmQwNDA1ZDJmNzgNCj4gKFhFTikgcjk6ICBm
ZmZmODJkMDQwNWVmOGEwICAgcjEwOiAwMDAwMDAwMGZmZmZmZmZmICAgcjExOiAwMDAwMDAw
MDAwMjE5MWMwDQo+IChYRU4pIHIxMjogMDAwMDAwMDAwMDAwMDAwMCAgIHIxMzogMDAwMDAw
MDAwMDAwMDAwMSAgIHIxNDogMDAwMDAwMDAwMDAwMDAwNA0KPiAoWEVOKSByMTU6IDAwMDAw
MDAwMDAwMDAwMDAgICBjcjA6IDAwMDAwMDAwODAwNTAwM2IgICBjcjQ6IDAwMDAwMDAwMDAz
NTI2ZTANCj4gKFhFTikgY3IzOiAwMDAwMDAwMDQ5Njc3MDAwICAgY3IyOiAwMDAwMDAwMDAw
MDAwMDcwDQo+IChYRU4pIGZzYjogMDAwMDAwMDAwMDAwMDAwMCAgIGdzYjogMDAwMDAwMDAw
MDAwMDAwMCAgIGdzczogMDAwMDAwMDAwMDAwMDAwMA0KPiAoWEVOKSBkczogMDAwMCAgIGVz
OiAwMDAwICAgZnM6IDAwMDAgICBnczogMDAwMCAgIHNzOiAwMDAwICAgY3M6IGUwMDgNCj4g
KFhFTikgWGVuIGNvZGUgYXJvdW5kIDxmZmZmODJkMDQwMjUwYzdlPiAoc2NoZWRfbWlncmF0
ZV90aW1lcnMrMHg0ZC8weGM5KToNCj4gKFhFTikgIDQ4IDhiIDE0IGNhIDQ4IDhiIDFjIDAy
IDwzOT4gN2IgNzAgNzQgNTEgNDggOGQgMDUgNTYgMzQgMzcgMDAgNDggODkgZTIgNDgNCj4g
KFhFTikgWGVuIHN0YWNrIHRyYWNlIGZyb20gcnNwPWZmZmY4MzAyNTYyMjdkMTg6DQo+IChY
RU4pICAgIDAwMDAwMDAwMDAwMDAwMDEgZmZmZjgzMDI1NjIyN2Q1OCBmZmZmODJkMDQwMjNm
MWEwIGZmZmY4MmQwNDA0N2EzMDgNCj4gKFhFTikgICAgZmZmZjgyZDA0MDQ3YTMwMCBmZmZm
ODJkMDQwNDdhMDYwIDAwMDAwMDAwMDAwMDAwMDQgMDAwMDAwMDAwMDAwMDAwMA0KPiAoWEVO
KSAgICBmZmZmODMwMjU2MjI3ZGEwIGZmZmY4MmQwNDAyMjZhMDQgMDAwMDAwMDAwMDAwMDAw
MCAwMDAwMDAwMDAwMDAwMDAxDQo+IChYRU4pICAgIDAwMDAwMDAwMDAwMDAwMDEgMDAwMDAw
MDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAxIGZmZmY4MzAyNTYyMjdmZmYNCj4gKFhFTikg
ICAgZmZmZjgyZDA0MDQ2YzUyMCBmZmZmODMwMjU2MjI3ZGI4IGZmZmY4MmQwNDAyMDdlNzUg
MDAwMDAwMDAwMDAwMDAwMQ0KPiAoWEVOKSAgICBmZmZmODMwMjU2MjI3ZGUwIGZmZmY4MmQw
NDAyMDgyNDMgZmZmZjgyZDA0MDQ3YTIyMCAwMDAwMDAwMDAwMDAwMDAxDQo+IChYRU4pICAg
IDAwMDAwMDAwMDAwMDAwMTAgZmZmZjgzMDI1NjIyN2UxOCBmZmZmODJkMDQwMjA4NDI4IDAw
MDAwMDAwMDAwMDAyMDANCj4gKFhFTikgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAw
MDAwMDAzIGZmZmY4MzAyNTYyMjdlZjggZmZmZjgyZDA0MDVkZTZjMA0KPiAoWEVOKSAgICBm
ZmZmODMwMjU2MjI3ZTQ4IGZmZmY4MmQwNDAyN2EyZGYgZmZmZjgzMDI1MTQ5MTQ5MCBmZmZm
ODMwMjUxNzU3MDAwDQo+IChYRU4pICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAw
MDAwMCBmZmZmODMwMjU2MjI3ZTY4IGZmZmY4MmQwNDAyMDljNzMNCj4gKFhFTikgICAgZmZm
ZjgzMDI1MTc1NzFiOCBmZmZmODJkMDQwNDc5NjE4IGZmZmY4MzAyNTYyMjdlODggZmZmZjgy
ZDA0MDIyZTQ4NA0KPiAoWEVOKSAgICBmZmZmODJkMDQwNWM0MWEwIGZmZmY4MmQwNDA1YzQx
YjAgZmZmZjgzMDI1NjIyN2ViOCBmZmZmODJkMDQwMjJlNzZlDQo+IChYRU4pICAgIDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwN2ZmZiBmZmZmODJkMDQwNWNhZjAwIGZmZmY4MmQw
NDA1YzQxYjANCj4gKFhFTikgICAgZmZmZjgzMDI1NjIyN2VmMCBmZmZmODJkMDQwMmY0NTVk
IGZmZmY4MmQwNDAyZjQ0ZTUgZmZmZjgzMDI1MTc1NzAwMA0KPiAoWEVOKSAgICBmZmZmODMw
MjU2MjI3ZWY4IGZmZmY4MzAyNTE3ZjUwMDAgMDAwMDAwMDAwMDAwMDAwMCBmZmZmODMwMjU2
MjI3ZTE4DQo+IChYRU4pICAgIDAwMDAwMDAwMDAwMDAwMDAgZmZmZmM5MDA0MGI0M2Q2MCAw
MDAwMDAwMDAwMDAzNDAzIDAwMDAwMDAwMDAwMDAwMDANCj4gKFhFTikgICAgMDAwMDAwMDAw
MDAwMDAwMyBmZmZmZmZmZjgyZTM3ODY4IDAwMDAwMDAwMDAwMDAyNDYgMDAwMDAwMDAwMDAw
MDAwMw0KPiAoWEVOKSAgICAwMDAwMDAwMDAwMDAzNDAzIDAwMDAwMDAwMDAwMDM0MDMgMDAw
MDAwMDAwMDAwMDAwMCBmZmZmZmZmZjgxZTRhMGVhDQo+IChYRU4pICAgIDAwMDAwMDAwMDAw
MDM0MDMgMDAwMDAwMDAwMDAwMDAxMCBkZWFkYmVlZmRlYWRmMDBkIDAwMDAwMTAwMDAwMDAw
MDANCj4gKFhFTikgICAgZmZmZmZmZmY4MWU0YTBlYSAwMDAwMDAwMDAwMDBlMDMzIDAwMDAw
MDAwMDAwMDAyNDYgZmZmZmM5MDA0MGI0M2MzMA0KPiAoWEVOKSBYZW4gY2FsbCB0cmFjZToN
Cj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjUwYzdlPl0gUiBzY2hlZF9taWdyYXRlX3RpbWVy
cysweDRkLzB4YzkNCj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjNmMWEwPl0gRiBjcHVwb29s
LmMjY3B1X2NhbGxiYWNrKzB4MTNkLzB4NDdlDQo+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDIy
NmEwND5dIEYgbm90aWZpZXJfY2FsbF9jaGFpbisweDZjLzB4OTYNCj4gKFhFTikgICAgWzxm
ZmZmODJkMDQwMjA3ZTc1Pl0gRiBjcHUuYyNjcHVfbm90aWZpZXJfY2FsbF9jaGFpbisweDFi
LzB4MzYNCj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjA4MjQzPl0gRiBjcHVfdXArMHhhZi8w
eGM4DQo+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDIwODQyOD5dIEYgZW5hYmxlX25vbmJvb3Rf
Y3B1cysweDdiLzB4MWVmDQo+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDI3YTJkZj5dIEYgcG93
ZXIuYyNlbnRlcl9zdGF0ZV9oZWxwZXIrMHgxNTYvMHg1ZGMNCj4gKFhFTikgICAgWzxmZmZm
ODJkMDQwMjA5YzczPl0gRiBkb21haW4uYyNjb250aW51ZV9oeXBlcmNhbGxfdGFza2xldF9o
YW5kbGVyKzB4NTAvMHhiZg0KPiAoWEVOKSAgICBbPGZmZmY4MmQwNDAyMmU0ODQ+XSBGIHRh
c2tsZXQuYyNkb190YXNrbGV0X3dvcmsrMHg3Yi8weGFjDQo+IChYRU4pICAgIFs8ZmZmZjgy
ZDA0MDIyZTc2ZT5dIEYgZG9fdGFza2xldCsweDU4LzB4OGENCj4gKFhFTikgICAgWzxmZmZm
ODJkMDQwMmY0NTVkPl0gRiBkb21haW4uYyNpZGxlX2xvb3ArMHg3OC8weGU2DQo+IChYRU4p
DQo+IChYRU4pIFBhZ2V0YWJsZSB3YWxrIGZyb20gMDAwMDAwMDAwMDAwMDA3MDoNCj4gKFhF
TikgIEw0WzB4MDAwXSA9IDAwMDAwMDAyNTE3ZmIwNjMgZmZmZmZmZmZmZmZmZmZmZg0KPiAo
WEVOKSAgTDNbMHgwMDBdID0gMDAwMDAwMDI1MTdmYTA2MyBmZmZmZmZmZmZmZmZmZmZmDQo+
IChYRU4pICBMMlsweDAwMF0gPSAwMDAwMDAwMjUxN2Y5MDYzIGZmZmZmZmZmZmZmZmZmZmYN
Cj4gKFhFTikgIEwxWzB4MDAwXSA9IDAwMDAwMDAwMDAwMDAwMDAgZmZmZmZmZmZmZmZmZmZm
Zg0KPiAoWEVOKQ0KPiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqDQo+IChYRU4pIFBhbmljIG9uIENQVSAwOg0KPiAoWEVOKSBGQVRBTCBQQUdFIEZB
VUxUDQo+IChYRU4pIFtlcnJvcl9jb2RlPTAwMDBdDQo+IChYRU4pIEZhdWx0aW5nIGxpbmVh
ciBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDcwDQo+IChYRU4pICoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioNCj4gDQoNClRoaXMgaXMgdmVyeSB3ZWlyZC4gVGhl
IGRhdGEgc3VnZ2VzdHMgdGhhdCB0aGUgc2NoZWR1bGluZyByZXNvdXJjZSBwb2ludGVyDQpm
b3IgY3B1IDEgd2FzIE5VTEwsIGJ1dCBJIGNhbid0IHNlZSBob3cgdGhpcyBjYW4gYmUgdGhl
IGNhc2Ugd2l0aG91dCBjYXVzaW5nDQpzaW1pbGFyIGNyYXNoZXMgd2l0aG91dCB0aGlzIHBh
dGNoLg0KDQpBcmUgdGhlcmUgYW55IGFkZGl0aW9uYWwgcGF0Y2hlcyByZWxhdGVkIHRvIGNw
dSBvbi9vZmZsaW5pbmcgb3Igc3VzcGVuZC9yZXN1bWUNCmluIHRoZSBoeXBlcnZpc29yPw0K
DQoNCkp1ZXJnZW4NCg==
--------------7vefNumKYJnunoQLa1wCcNQz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------7vefNumKYJnunoQLa1wCcNQz--

--------------FL8GGzN6KMP3dgOgxr1IjBUU--

--------------YlT41rAiS2D0e9gsCYcK3gDh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNbqiwFAwAAAAAACgkQsN6d1ii/Ey9v
YQf/fA51PCDgohgOEpyMCWT0gA1GkHGf6h7rbCr91B0jDodICKut0aps1JspTC02f0rwK0e3qKK4
Jeodkwe9SsXGuUhcxFXcx7hu9LOOAon3kxg5UFyAU9wQ5aJB7UxRF9rFDTdpR3imPiXOoVkwd2hf
BheUwjWV5YPIp64IKorthOmPJVFWpw9VVGvXlQXKqfuNItmLlvYBkyEtsGdsZfBTRn9dtNl+SKRx
em+P+cWgSQwxrBP/1mx9yQF6GN/3VMmbyEJPjEvJ4++XFBNVnCY58SCzb5CQ7cykeRCP6S6TaTm3
VxLROZK5te7AABQwunlloAQo/+lNYIUZELJ8TW1LEg==
=Pm83
-----END PGP SIGNATURE-----

--------------YlT41rAiS2D0e9gsCYcK3gDh--

