Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084854FEC2F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 03:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303876.518344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neRiW-0003u3-H3; Wed, 13 Apr 2022 01:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303876.518344; Wed, 13 Apr 2022 01:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neRiW-0003s8-E9; Wed, 13 Apr 2022 01:22:44 +0000
Received: by outflank-mailman (input) for mailman id 303876;
 Wed, 13 Apr 2022 01:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqKT=UX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1neRiV-0003s2-3n
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 01:22:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3696f393-bac8-11ec-a405-831a346695d4;
 Wed, 13 Apr 2022 03:22:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EEAABB82083;
 Wed, 13 Apr 2022 01:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A9DC385A8;
 Wed, 13 Apr 2022 01:22:39 +0000 (UTC)
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
X-Inumbo-ID: 3696f393-bac8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649812959;
	bh=6l+CGf4T8Rw73qOnntCeY3bk40iIH1mPAe8On5wwcls=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XZR4+w4qJfrfsnvKWx/SkENFxau7Dli3kNTC+MOKSMYjVn6ItEpVWaSbTs8oEzpOD
	 KiYBFU41p/cVoduPIPs1barf6KNzbTXM20BaY3kGrjvdrvjzBpPzwf3A9RvXRyJuMH
	 71xZ7FGryI1g3rYQ1UbMVvFLPm5IhhrarIIRuZWUJH2Q5u7XToJctE2A9JRGV2tq9L
	 si9E2R2xnh89giVzlDNlyPcqmeWXvCODNTc+AL4qD1C1+ToV+SjiQArQaJg8+qqc5l
	 VP618r3INe/Wfq4gsHkWld+UntMq1aXU46HIX069X+GAPpm7arFqxCl23jyL6i1YAd
	 wYnStx7gW9FtQ==
Date: Tue, 12 Apr 2022 18:22:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
    Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 8/9] tools: add example application to initialize
 dom0less PV drivers
In-Reply-To: <7dc5887a-461d-506d-ce4e-fbcb7e5cb43e@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204121819410.3066615@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop> <20220401003847.38393-8-sstabellini@kernel.org> <e71ad6f6-f920-1e7b-9f4b-dd2e133a23c5@xen.org> <39fc312c-cf0b-d7ff-c560-7c6b96809416@suse.com>
 <alpine.DEB.2.22.394.2204051758250.2910984@ubuntu-linux-20-04-desktop> <7dc5887a-461d-506d-ce4e-fbcb7e5cb43e@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1031791000-1649812894=:3066615"
Content-ID: <alpine.DEB.2.22.394.2204121821570.3066615@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1031791000-1649812894=:3066615
Content-Type: text/plain; CHARSET=US-ASCII
Content-ID: <alpine.DEB.2.22.394.2204121821571.3066615@ubuntu-linux-20-04-desktop>

On Wed, 6 Apr 2022, Julien Grall wrote:
> But if we use the 'connection status' field, then you could just delay the
> initialization until you receive an event and the connection status is
> connected.

I prototyped this approach and I managed to validate it successfully.
See attached patches for xen and linux (on top of existing patches). I
allocated the page from init-dom0less (instead of Xen) to achieve best
compatibility with older kernels.

There are some rough edges in the two patches but let me know if you
have any comments on the overall approach.
--8323329-1031791000-1649812894=:3066615
Content-Type: text/x-diff; NAME=xen.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2204121821340.3066615@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=xen.patch

ZGlmZiAtLWdpdCBhL3Rvb2xzL2hlbHBlcnMvTWFrZWZpbGUgYi90b29scy9o
ZWxwZXJzL01ha2VmaWxlDQppbmRleCA4ZTQyOTk3MDUyLi44ZDc4YWIxZTkw
IDEwMDY0NA0KLS0tIGEvdG9vbHMvaGVscGVycy9NYWtlZmlsZQ0KKysrIGIv
dG9vbHMvaGVscGVycy9NYWtlZmlsZQ0KQEAgLTQ2LDcgKzQ2LDcgQEAgaW5p
dC14ZW5zdG9yZS1kb21haW46ICQoSU5JVF9YRU5TVE9SRV9ET01BSU5fT0JK
UykNCiAJJChDQykgJChMREZMQUdTKSAtbyAkQCAkKElOSVRfWEVOU1RPUkVf
RE9NQUlOX09CSlMpICQoTERMSUJTX2xpYnhlbnRvb2xsb2cpICQoTERMSUJT
X2xpYnhlbnN0b3JlKSAkKExETElCU19saWJ4ZW5jdHJsKSAkKExETElCU19s
aWJ4ZW5ndWVzdCkgJChMRExJQlNfbGlieGVubGlnaHQpICQoQVBQRU5EX0xE
RkxBR1MpDQogDQogaW5pdC1kb20wbGVzczogJChJTklUX0RPTTBMRVNTX09C
SlMpDQotCSQoQ0MpICQoTERGTEFHUykgLW8gJEAgJChJTklUX0RPTTBMRVNT
X09CSlMpICQoTERMSUJTX2xpYnhlbmN0cmwpICQoTERMSUJTX2xpYnhlbmV2
dGNobikgJChMRExJQlNfbGlieGVudG9vbGxvZykgJChMRExJQlNfbGlieGVu
c3RvcmUpICQoTERMSUJTX2xpYnhlbmxpZ2h0KSAkKExETElCU19saWJ4ZW5n
dWVzdCkgICQoQVBQRU5EX0xERkxBR1MpDQorCSQoQ0MpICQoTERGTEFHUykg
LW8gJEAgJChJTklUX0RPTTBMRVNTX09CSlMpICQoTERMSUJTX2xpYnhlbmN0
cmwpICQoTERMSUJTX2xpYnhlbmV2dGNobikgJChMRExJQlNfbGlieGVudG9v
bGxvZykgJChMRExJQlNfbGlieGVuc3RvcmUpICQoTERMSUJTX2xpYnhlbmxp
Z2h0KSAkKExETElCU19saWJ4ZW5ndWVzdCkgJChMRExJQlNfbGlieGVuZm9y
ZWlnbm1lbW9yeSkgJChBUFBFTkRfTERGTEFHUykNCiANCiAuUEhPTlk6IGlu
c3RhbGwNCiBpbnN0YWxsOiBhbGwNCmRpZmYgLS1naXQgYS90b29scy9oZWxw
ZXJzL2luaXQtZG9tMGxlc3MuYyBiL3Rvb2xzL2hlbHBlcnMvaW5pdC1kb20w
bGVzcy5jDQppbmRleCBkYzljY2VlODY4Li4zMjlhYTQ0ZGE2IDEwMDY0NA0K
LS0tIGEvdG9vbHMvaGVscGVycy9pbml0LWRvbTBsZXNzLmMNCisrKyBiL3Rv
b2xzL2hlbHBlcnMvaW5pdC1kb20wbGVzcy5jDQpAQCAtOSw5ICs5LDEyIEBA
DQogI2luY2x1ZGUgPHhlbmd1ZXN0Lmg+DQogI2luY2x1ZGUgPGxpYnhsLmg+
DQogI2luY2x1ZGUgPHhlbmV2dGNobi5oPg0KKyNpbmNsdWRlIDx4ZW5mb3Jl
aWdubWVtb3J5Lmg+DQogDQogI2luY2x1ZGUgImluaXQtZG9tLWpzb24uaCIN
CiANCisjZGVmaW5lIFhTX0NPTk5FQ1RJT05fU1RBVEVfT0ZGU0VUICAgICAg
ICgyMDY4LzQpDQorI2RlZmluZSBYU19DT05ORUNUSU9OX1NUQVRFX1JFQ09O
TkVDVElORyAweDENCiAjZGVmaW5lIFhFTlNUT1JFX1BGTl9PRkZTRVQgMQ0K
ICNkZWZpbmUgU1RSX01BWF9MRU5HVEggNjQNCiANCkBAIC0yMTUsMTIgKzIx
OCwxOCBAQCBlcnI6DQogc3RhdGljIGludCBpbml0X2RvbWFpbihzdHJ1Y3Qg
eHNfaGFuZGxlICp4c2gsIGxpYnhsX2RvbWluZm8gKmluZm8pDQogew0KICAg
ICBzdHJ1Y3QgeGNfaW50ZXJmYWNlX2NvcmUgKnhjaDsNCisgICAgeGVuZm9y
ZWlnbm1lbW9yeV9oYW5kbGUgKnhmaDsNCiAgICAgbGlieGxfdXVpZCB1dWlk
Ow0KICAgICB1aW50NjRfdCB4ZW5zdG9yZV9ldnRjaG4sIHhlbnN0b3JlX3Bm
bjsNCiAgICAgaW50IHJjOw0KKyAgICB1aW50MzJfdCAqcGFnZTsNCiANCiAg
ICAgcHJpbnRmKCJJbml0IGRvbTBsZXNzIGRvbWFpbjogJXVcbiIsIGluZm8t
PmRvbWlkKTsNCiAgICAgeGNoID0geGNfaW50ZXJmYWNlX29wZW4oMCwgMCwg
MCk7DQorICAgIHhmaCA9IHhlbmZvcmVpZ25tZW1vcnlfb3BlbigwLCAwKTsN
CisNCisgICAgaWYgKHhjaCA9PSBOVUxMIHx8IHhmaCA9PSBOVUxMKQ0KKyAg
ICAgICAgZXJyKDEsICJDYW5ub3Qgb3BlbiB4Yy94ZW5mb3JlaWdubWVtb3J5
IGludGVyZmFjZXNcbiIpOw0KIA0KICAgICByYyA9IHhjX2h2bV9wYXJhbV9n
ZXQoeGNoLCBpbmZvLT5kb21pZCwgSFZNX1BBUkFNX1NUT1JFX0VWVENITiwN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICZ4ZW5zdG9yZV9ldnRjaG4p
Ow0KQEAgLTIzNSw2ICsyNDQsMTQgQEAgc3RhdGljIGludCBpbml0X2RvbWFp
bihzdHJ1Y3QgeHNfaGFuZGxlICp4c2gsIGxpYnhsX2RvbWluZm8gKmluZm8p
DQogICAgICAgICByZXR1cm4gMTsNCiAgICAgfQ0KIA0KKyAgICBwYWdlID0g
eGVuZm9yZWlnbm1lbW9yeV9tYXAoeGZoLCBpbmZvLT5kb21pZCwgWFNfUkVB
RCB8IFhTX1dSSVRFLCAxLCAmeGVuc3RvcmVfcGZuLCBOVUxMKTsNCisgICAg
aWYgKCFwYWdlKSB7DQorICAgICAgICBwcmludGYoIkVycm9yIG1hcHBpbmcg
eGVuc3RvcmUgcGFnZVxuIik7DQorICAgICAgICByZXR1cm4gMTsNCisgICAg
fQ0KKyAgICBwYWdlW1hTX0NPTk5FQ1RJT05fU1RBVEVfT0ZGU0VUXSA9IFhT
X0NPTk5FQ1RJT05fU1RBVEVfUkVDT05ORUNUSU5HOw0KKyAgICB4ZW5mb3Jl
aWdubWVtb3J5X3VubWFwKHhmaCwgcGFnZSwgMSk7DQorDQogICAgIHJjID0g
eGNfZG9tX2dudHRhYl9zZWVkKHhjaCwgaW5mby0+ZG9taWQsIHRydWUsDQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICh4ZW5fcGZuX3QpLTEsIHhl
bnN0b3JlX3BmbiwgMCwgMCk7DQogICAgIGlmIChyYykNCmRpZmYgLS1naXQg
YS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMgYi90b29scy94
ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMNCmluZGV4IDA1NDNmNDk2NzAu
LjdiYjhjNjRkMzMgMTAwNjQ0DQotLS0gYS90b29scy94ZW5zdG9yZS94ZW5z
dG9yZWRfZG9tYWluLmMNCisrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3Jl
ZF9kb21haW4uYw0KQEAgLTQ5NCw2ICs0OTQsNyBAQCBzdGF0aWMgc3RydWN0
IGRvbWFpbiAqaW50cm9kdWNlX2RvbWFpbihjb25zdCB2b2lkICpjdHgsDQog
CQl0YWxsb2Nfc3RlYWwoZG9tYWluLT5jb25uLCBkb21haW4pOw0KIA0KIAkJ
LyogTm90aWZ5IHRoZSBkb21haW4gdGhhdCB4ZW5zdG9yZSBpcyBhdmFpbGFi
bGUgKi8NCisJCWludGVyZmFjZS0+Y29ubmVjdGlvbiA9IDB4MDsNCiAJCXhl
bmV2dGNobl9ub3RpZnkoeGNlX2hhbmRsZSwgZG9tYWluLT5wb3J0KTsNCiAN
CiAJCWlmICghaXNfbWFzdGVyX2RvbWFpbiAmJiAhcmVzdG9yZSkNCg==

--8323329-1031791000-1649812894=:3066615
Content-Type: text/x-diff; NAME=linux.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.22.394.2204121821341.3066615@ubuntu-linux-20-04-desktop>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=linux.patch

ZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUu
YyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYw0KaW5kZXgg
NTFlNTJlMTc1ODkyLi5kYzA0NmQyNTc4OWUgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMNCisrKyBiL2RyaXZlcnMv
eGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYw0KQEAgLTkzOSw2ICs5MzksNyBA
QCBzdGF0aWMgaW50IF9faW5pdCB4ZW5idXNfaW5pdCh2b2lkKQ0KIHsNCiAJ
aW50IGVycjsNCiAJdWludDY0X3QgdiA9IDA7DQorCWJvb2wgd2FpdCA9IGZh
bHNlOw0KIAl4ZW5fc3RvcmVfZG9tYWluX3R5cGUgPSBYU19VTktOT1dOOw0K
IA0KIAlpZiAoIXhlbl9kb21haW4oKSkNCkBAIC05OTIsMTcgKzk5Myw3IEBA
IHN0YXRpYyBpbnQgX19pbml0IHhlbmJ1c19pbml0KHZvaWQpDQogCQkJZ290
byBvdXRfZXJyb3I7DQogCQl9DQogCQlpZiAodiA9PSB+MFVMTCkgew0KLQkJ
CWVyciA9IGJpbmRfZXZ0Y2huX3RvX2lycWhhbmRsZXIoeGVuX3N0b3JlX2V2
dGNobiwNCi0JCQkJCQkJeGVuYnVzX2xhdGVfaW5pdCwNCi0JCQkJCQkJMCwg
InhlbnN0b3JlX2xhdGVfaW5pdCIsDQotCQkJCQkJCSZ4Yl93YWl0cSk7DQot
CQkJaWYgKGVyciA8IDApIHsNCi0JCQkJcHJfZXJyKCJ4ZW5zdG9yZV9sYXRl
X2luaXQgY291bGRuJ3QgYmluZCBpcnEgZXJyPSVkXG4iLA0KLQkJCQkgICAg
ICAgZXJyKTsNCi0JCQkJcmV0dXJuIGVycjsNCi0JCQl9DQotDQotCQkJeHNf
aW5pdF9pcnEgPSBlcnI7DQorCQkJd2FpdCA9IHRydWU7DQogCQl9IGVsc2Ug
ew0KIAkJCS8qIEF2b2lkIHRydW5jYXRpb24gb24gMzItYml0LiAqLw0KICNp
ZiBCSVRTX1BFUl9MT05HID09IDMyDQpAQCAtMTAxNyw2ICsxMDA4LDIxIEBA
IHN0YXRpYyBpbnQgX19pbml0IHhlbmJ1c19pbml0KHZvaWQpDQogCQkJeGVu
X3N0b3JlX2ludGVyZmFjZSA9DQogCQkJCXhlbl9yZW1hcCh4ZW5fc3RvcmVf
Z2ZuIDw8IFhFTl9QQUdFX1NISUZULA0KIAkJCQkJICBYRU5fUEFHRV9TSVpF
KTsNCisJCQlpZiAoeGVuX3N0b3JlX2ludGVyZmFjZS0+Y29ubmVjdGlvbiAh
PSAwKQ0KKwkJCQl3YWl0ID0gdHJ1ZTsNCisJCX0NCisJCWlmICh3YWl0KSB7
DQorCQkJZXJyID0gYmluZF9ldnRjaG5fdG9faXJxaGFuZGxlcih4ZW5fc3Rv
cmVfZXZ0Y2huLA0KKwkJCQkJCQl4ZW5idXNfbGF0ZV9pbml0LA0KKwkJCQkJ
CQkwLCAieGVuc3RvcmVfbGF0ZV9pbml0IiwNCisJCQkJCQkJJnhiX3dhaXRx
KTsNCisJCQlpZiAoZXJyIDwgMCkgew0KKwkJCQlwcl9lcnIoInhlbnN0b3Jl
X2xhdGVfaW5pdCBjb3VsZG4ndCBiaW5kIGlycSBlcnI9JWRcbiIsDQorCQkJ
CSAgICAgICBlcnIpOw0KKwkJCQlyZXR1cm4gZXJyOw0KKwkJCX0NCisNCisJ
CQl4c19pbml0X2lycSA9IGVycjsNCiAJCX0NCiAJCWJyZWFrOw0KIAlkZWZh
dWx0Og0KZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL2ludGVyZmFjZS9pby94
c193aXJlLmggYi9pbmNsdWRlL3hlbi9pbnRlcmZhY2UvaW8veHNfd2lyZS5o
DQppbmRleCBkNDBhNDRmMDliMTYuLmNkN2FlNWViYjEzMyAxMDA2NDQNCi0t
LSBhL2luY2x1ZGUveGVuL2ludGVyZmFjZS9pby94c193aXJlLmgNCisrKyBi
L2luY2x1ZGUveGVuL2ludGVyZmFjZS9pby94c193aXJlLmgNCkBAIC04Nyw2
ICs4Nyw5IEBAIHN0cnVjdCB4ZW5zdG9yZV9kb21haW5faW50ZXJmYWNlIHsN
CiAgICAgY2hhciByc3BbWEVOU1RPUkVfUklOR19TSVpFXTsgLyogUmVwbGll
cyBhbmQgYXN5bmMgd2F0Y2ggZXZlbnRzLiAqLw0KICAgICBYRU5TVE9SRV9S
SU5HX0lEWCByZXFfY29ucywgcmVxX3Byb2Q7DQogICAgIFhFTlNUT1JFX1JJ
TkdfSURYIHJzcF9jb25zLCByc3BfcHJvZDsNCisgICAgdWludDMyX3Qgc2Vy
dmVyX2ZlYXR1cmVzOyAvKiBCaXRtYXAgb2YgZmVhdHVyZXMgc3VwcG9ydGVk
IGJ5IHRoZSBzZXJ2ZXIgKi8NCisgICAgdWludDMyX3QgY29ubmVjdGlvbjsN
CisgICAgdWludDMyX3QgZXJyb3I7DQogfTsNCiANCiAvKiBWaW9sYXRpbmcg
dGhpcyBpcyB2ZXJ5IGJhZC4gIFNlZSBkb2NzL21pc2MveGVuc3RvcmUudHh0
LiAqLw0K

--8323329-1031791000-1649812894=:3066615--

