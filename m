Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293223D207
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 18:17:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hajPP-0001Lt-84; Tue, 11 Jun 2019 16:14:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7+wn=UK=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hajPN-0001Lg-RA
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 16:14:02 +0000
X-Inumbo-ID: eaf09479-8c63-11e9-8980-bc764e045a96
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eaf09479-8c63-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 16:13:59 +0000 (UTC)
Date: Tue, 11 Jun 2019 16:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1560269637;
 bh=4lhrokbXMT9bgFneaIb7S0prK+a9a1vMifYUJjIJJ5s=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=SyR7l1V+8Qs0afTcBZeSyhRTZGzz7QekiW98lsSTrl2pO6EYiJMGXCMRoNnCFHavF
 8BaeqHMlC46MjSkPe4c6v8jaSw3fv/Wc4cTugVPt8nOCWSL4be4gcaB7b0pQrJdlUQ
 3xZMMexN08tHulMnQUFeuCljCpYTppX2VXWORKqY=
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID: <c8HQuhFwndS6JeDqbDw89ygiDTPsJVdQCJqbEsuF1Zjap_IACv9Xeevj_tkJsuNuWMxC_W5q4Q-bcoUdB0so4D1mX_PoFdbzWpjKd8UqYxU=@protonmail.com>
In-Reply-To: <GS9qzlWkvvhj3zz1lTbvqgogs2oSC-YrNidLLI43lVOMLtzHz8VkB92Ki5jLo3o5wzJtRVDTnitxtpU853YJxPuJVHqj9F_vxPf4-n8klVA=@protonmail.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <rQKAjmE5sqmoHfveLrCC3tRz7edgAIkDUG5CRgmBhF975OXX_8ZdIsCFturwHzr04jeYiq5MPE5gHG3SeltMz5ZnrIs0XcO0QO_OXeBGhTg=@protonmail.com>
 <cf45071e-19dd-7afb-b9cf-55bb425d0908@citrix.com>
 <VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com>
 <0b97ca78-81f3-a45e-a651-05d2a420dc83@citrix.com>
 <GS9qzlWkvvhj3zz1lTbvqgogs2oSC-YrNidLLI43lVOMLtzHz8VkB92Ki5jLo3o5wzJtRVDTnitxtpU853YJxPuJVHqj9F_vxPf4-n8klVA=@protonmail.com>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE
 autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: multipart/mixed; boundary="===============3083553430680878474=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.

--===============3083553430680878474==
Content-Type: multipart/alternative;
	boundary="b1_80b9d018950661478e7183a2c1fc0d66"

This is a multi-part message in MIME format.

--b1_80b9d018950661478e7183a2c1fc0d66
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGksCgo+IFllcyBJIG1pc3NlZCB0aGF0IFBhdGNoR3VhcmQgd291bGQgZXZlbnR1YWxseSBjaGVj
ayB0aG9zZSBzaGFkb3cgcGFnZXMgYW55d2F5Lgo+IEkgd2FzIGFscmVhZHkgaGFwcHkgdG8gc2Vl
IHRoYXQgbXkgYnJlYWtwb2ludHMgd2VyZSB3b3JraW5nLCBhbmQgSSBwcm9jZWVkZWQgdG8gdGhl
IHRlc3RzCj4gaG9waW5nIHRvIGhhdmUgYSBxdWljayByZXByb2R1Y3Rpb24gb2YgdGhlIGJ1Zy4K
Pgo+IEkgaW1wbGVtZW50ZWQgYSBiYXNpYyBtZW1fYWNjZXNzIGV2ZW50IG9uIHRoZSByZXN0cmlj
dGluZyB0byAtLVggb25seSBvbiB0aGUgb3JpZ2luYWwgR0ZOIGJlaW5nIHJlbWFwcGVkLAo+IGFu
ZCBzd2l0Y2hpbmcgdG8gaG9zdHAybSBhbmQgc2luZ2xlc3RlcHBpbmcgdG8gZXNjYXBlIFBhdGNo
R3VhcmQuCj4KPiBJdCB3b3JrcywgYnV0IEkgZW5kIHVwIGluIGEgc2l0dWF0aW9uIHdoZXJlIFhl
biBmYWlscyBhdCBzb21lIHBvaW50LCBiZWNhdXNlIGF0IH45MCB0ZXN0cywgaXQgY2Fubm90IHBv
cHVsYXRlIHRoZSByaW5nIGFueW1vcmU6Cj4gSU5GTzpyb290Oj09PT0gdGVzdCA5MiA9PT09Cj4g
SU5GTzpyb290OnN0YXJ0aW5nIGRyYWt2dWYKPiBJTkZPOnJvb3Q6c3RhcnRpbmcgQW5zaWJsZQo+
IElOSVQKPiB4ZW5faW5pdF9pbnRlcmZhY2UKPiB4Y19pbnRlcmZhY2Vfb3Blbgo+IGNyZWF0ZSBs
b2dnZXIKPiBhbGxvY2F0aW5nIGxpYnhjIGNvbnRleHQKPiBpbml0IHJpbmcgcGFnZQo+IHhjOiBl
cnJvcjogRmFpbGVkIHRvIHBvcHVsYXRlIHJpbmcgcGZuCj4gKDE2ID0gRGV2aWNlIG9yIHJlc291
cmNlIGJ1c3kpOiBJbnRlcm5hbCBlcnJvcgo+IGZhaWwgdG8gZW5hYmxlIG1vbml0b3Jpbmc6IERl
dmljZSBvciByZXNvdXJjZSBidXN5Cj4gZmFpbCB0byBpbml0IHhlbiBpbnRlcmZhY2UKPiBDTE9T
RQo+IEZhaWwgdG8gaW5pdCB2bWkKPgo+IChJIHVwZGF0ZWQgdGhlIEdpc3Q6IGh0dHBzOi8vZ2lz
dC5naXRodWIuY29tL210YXJyYWwvZDk5Y2U1NTI0Y2ZjZmI1MjkwZWFhMDU3MDJjM2U4ZTcjZmls
ZS14ZW4tZHJha3Z1Zi1jKQo+IFdoYXQgZG8geW91IHRoaW5rIGhhcHBlbmVkID8KPiBJIGhhdmUg
YSBjYWxsIHRvIHhjX2RvbWFpbl9zZXRtYXhtZW0gd2l0aCB+MCwgc28gaXQgc2hvdWxkbid0IGhh
cHBlbiA/Cj4gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vbXRhcnJhbC9kOTljZTU1MjRjZmNmYjUy
OTBlYWEwNTcwMmMzZThlNyNmaWxlLXhlbi1kcmFrdnVmLWMtTDU5OAoKSSBtb3ZlZCB0aGUgY2Fs
bCB0byB4Y19kb21haW5fc2V0bWF4bWVtIEJFRk9SRSB4Y19tb25pdG9yX2VuYWJsZS4KV2hpY2gg
d29ya3MuCgpJJ20gY29udGludWluZyBteSB0ZXN0aW5nIHRvIHNlZSBpZiBJIGNhbiByZXByb2R1
Y2UgdGhlIGJ1Zy4KCk1hdGhpZXU=


--b1_80b9d018950661478e7183a2c1fc0d66
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9InByb3Rv
bm1haWxfcXVvdGUiIHR5cGU9ImNpdGUiPjxkaXY+WWVzIEkgbWlzc2VkIHRoYXQgUGF0Y2hHdWFy
ZCB3b3VsZCBldmVudHVhbGx5IGNoZWNrIHRob3NlIHNoYWRvdyBwYWdlcyBhbnl3YXkuPGJyPjwv
ZGl2PjxkaXY+SSB3YXMgYWxyZWFkeSBoYXBweSB0byBzZWUgdGhhdCBteSBicmVha3BvaW50cyB3
ZXJlIHdvcmtpbmcsIGFuZCBJIHByb2NlZWRlZCB0byB0aGUgdGVzdHM8YnI+PC9kaXY+PGRpdj5o
b3BpbmcgdG8gaGF2ZSBhIHF1aWNrIHJlcHJvZHVjdGlvbiBvZiB0aGUgYnVnLjxicj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PkkgaW1wbGVtZW50ZWQgYSBiYXNpYyBtZW1fYWNjZXNzIGV2ZW50
IG9uIHRoZSByZXN0cmljdGluZyB0byAtLVggb25seSBvbiB0aGUgb3JpZ2luYWwgR0ZOIGJlaW5n
IHJlbWFwcGVkLDxicj48L2Rpdj48ZGl2PmFuZCBzd2l0Y2hpbmcgdG8gaG9zdHAybSBhbmQgc2lu
Z2xlc3RlcHBpbmcgdG8gZXNjYXBlIFBhdGNoR3VhcmQuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+SXQgd29ya3MsIGJ1dCBJIGVuZCB1cCBpbiBhIHNpdHVhdGlvbiB3aGVyZSBYZW4gZmFp
bHMgYXQgc29tZSBwb2ludCwgYmVjYXVzZSBhdCB+OTAgdGVzdHMsIGl0IGNhbm5vdCBwb3B1bGF0
ZSB0aGUgcmluZyBhbnltb3JlOjxicj48L2Rpdj48ZGl2PklORk86cm9vdDo9PT09IHRlc3QgOTIg
PT09PTxicj48L2Rpdj48ZGl2PklORk86cm9vdDpzdGFydGluZyBkcmFrdnVmPGJyPjwvZGl2Pjxk
aXY+SU5GTzpyb290OnN0YXJ0aW5nIEFuc2libGU8YnI+PC9kaXY+PGRpdj5JTklUPGJyPjwvZGl2
PjxkaXY+eGVuX2luaXRfaW50ZXJmYWNlPGJyPjwvZGl2PjxkaXY+eGNfaW50ZXJmYWNlX29wZW48
YnI+PC9kaXY+PGRpdj5jcmVhdGUgbG9nZ2VyPGJyPjwvZGl2PjxkaXY+YWxsb2NhdGluZyBsaWJ4
YyBjb250ZXh0PGJyPjwvZGl2PjxkaXY+aW5pdCByaW5nIHBhZ2U8YnI+PC9kaXY+PGRpdj54Yzog
ZXJyb3I6IEZhaWxlZCB0byBwb3B1bGF0ZSByaW5nIHBmbjxicj48L2Rpdj48ZGl2PigxNiA9IERl
dmljZSBvciByZXNvdXJjZSBidXN5KTogSW50ZXJuYWwgZXJyb3I8YnI+PC9kaXY+PGRpdj5mYWls
IHRvIGVuYWJsZSBtb25pdG9yaW5nOiBEZXZpY2Ugb3IgcmVzb3VyY2UgYnVzeTxicj48L2Rpdj48
ZGl2PmZhaWwgdG8gaW5pdCB4ZW4gaW50ZXJmYWNlPGJyPjwvZGl2PjxkaXY+Q0xPU0U8YnI+PC9k
aXY+PGRpdj5GYWlsIHRvIGluaXQgdm1pPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+KEkg
dXBkYXRlZCB0aGUgR2lzdDogPGEgaHJlZj0iaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vbXRhcnJh
bC9kOTljZTU1MjRjZmNmYjUyOTBlYWEwNTcwMmMzZThlNyNmaWxlLXhlbi1kcmFrdnVmLWMiPmh0
dHBzOi8vZ2lzdC5naXRodWIuY29tL210YXJyYWwvZDk5Y2U1NTI0Y2ZjZmI1MjkwZWFhMDU3MDJj
M2U4ZTcjZmlsZS14ZW4tZHJha3Z1Zi1jPC9hPik8YnI+PC9kaXY+PGRpdj5XaGF0IGRvIHlvdSB0
aGluayBoYXBwZW5lZCA/PGJyPjwvZGl2PjxkaXY+SSBoYXZlIGEgY2FsbCB0byB4Y19kb21haW5f
c2V0bWF4bWVtIHdpdGggfjAsIHNvIGl0IHNob3VsZG4ndCBoYXBwZW4gPzxicj48L2Rpdj48ZGl2
PjxhIGhyZWY9Imh0dHBzOi8vZ2lzdC5naXRodWIuY29tL210YXJyYWwvZDk5Y2U1NTI0Y2ZjZmI1
MjkwZWFhMDU3MDJjM2U4ZTcjZmlsZS14ZW4tZHJha3Z1Zi1jLUw1OTgiPmh0dHBzOi8vZ2lzdC5n
aXRodWIuY29tL210YXJyYWwvZDk5Y2U1NTI0Y2ZjZmI1MjkwZWFhMDU3MDJjM2U4ZTcjZmlsZS14
ZW4tZHJha3Z1Zi1jLUw1OTg8L2E+PGJyPjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2PkkgbW92ZWQg
dGhlIGNhbGwgdG8geGNfZG9tYWluX3NldG1heG1lbSBCRUZPUkUgeGNfbW9uaXRvcl9lbmFibGUu
PGJyPjwvZGl2PjxkaXY+V2hpY2ggd29ya3MuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
SSdtIGNvbnRpbnVpbmcgbXkgdGVzdGluZyB0byBzZWUgaWYgSSBjYW4gcmVwcm9kdWNlIHRoZSBi
dWcuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+TWF0aGlldTxicj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj4=



--b1_80b9d018950661478e7183a2c1fc0d66--



--===============3083553430680878474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3083553430680878474==--


