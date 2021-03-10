Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A283C33481D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 20:38:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96286.182017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK4eZ-00089i-2X; Wed, 10 Mar 2021 19:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96286.182017; Wed, 10 Mar 2021 19:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK4eY-00089J-VO; Wed, 10 Mar 2021 19:37:54 +0000
Received: by outflank-mailman (input) for mailman id 96286;
 Wed, 10 Mar 2021 19:37:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KX7m=II=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1lK4eX-00089E-R6
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 19:37:53 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 528de74e-9808-483e-8f82-34790a2a9603;
 Wed, 10 Mar 2021 19:37:52 +0000 (UTC)
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
X-Inumbo-ID: 528de74e-9808-483e-8f82-34790a2a9603
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615405072;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ID4rXGKPixiIuekEIXdMa5whMyRfr4VjHmPEXuxM1vU=;
  b=T6V12kghnrsngdqIhanG5ymffyMV4rxD/fdJxdXhNU1nogzvYzN8ZnYs
   FznXb3ZnWA4BX6wbtaZQyvTcOZmvbe1X3Q1O2BxuBB2iMtIQSl9kx9/SZ
   nV4nSftMnths1zWwxDRpngQAMvQiQvN2WSh20Bpg2fVQuf4JEPkXO/0yh
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9pReDtA9FFn03gxuG6f2MJs7UXOax9hpzzp8BvgSU/Js36UIJGg8zxERTt6Ftaa+VflxpoeEuo
 qwC4DRvdm6NPUgSN9SO98T8yUZV/lEZAJYRNAarGc8fT5bdDy09to5UYH2yeXbZZuufF1CfaWM
 cn28f7rk1K4mQZMs3lDgyGeamC3UPTmjiludRpHCRyu+/SntSFs80CTXdJgSTVOZjZRyhGP4hn
 EsRtxKS8+vwdqKgGdTAajEv8xmJqz6ps3iuJpD7ULpf28p+AUlXynhn4+mYhKIkhLZvgtvHRGT
 hrM=
X-SBRS: 4.0
X-MesageID: 39005932
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DHovQaioBBa3/sdFih4pxHTnj3BQXiUji2hD6mlwRA09T+Wzkc
 eykPMHkTr9jzgMUH8t8OrvBICrR3TA+ZlppbQAJLvKZmbbkUahMY0K1+ff6hL6HSmWzIRg/I
 dmN5NzEdjhSWV95Pyb3CCdM/INhOaK67qpg+C29RxQZCVncbtp4Qs8KivzKCxLbTJLD5Y4C5
 aQj/AvzwaIQngZYt+2AXMIRYH41r72vaj7ah0LDQNP0njtsRqU7tfBfiSl4g==
X-IronPort-AV: E=Sophos;i="5.81,238,1610427600"; 
   d="scan'208";a="39005932"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Roman Shaposhnik
	<roman@zededa.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: Troubles analyzing crash dumps from xl dump-core
Thread-Topic: Troubles analyzing crash dumps from xl dump-core
Thread-Index: AQHW9nsP4F6kEkHrzUmrgvtWz2V0Z6pAGduAgAC/cYCAAMlrgIA8OGKg
Date: Wed, 10 Mar 2021 19:37:48 +0000
Message-ID: <6466c5e156bf4afbb9fbbd44d7ff20b8@FTLPEX02CL02.citrite.net>
References: <CAMmSBy-wXf+YHa_m1N37537EQfUrs8RVi2i=Ur6yXGtJV_bCgQ@mail.gmail.com>
 <91837fa8-1d57-8b37-bf66-9e021855348d@suse.com>
 <CAMmSBy8vHstYXPUOZS1byK+JtcJRC_WqZXU8jtd4CJHUop3eGg@mail.gmail.com>
 <2bbb347c-bc5b-63f7-3e94-b90145ff5166@suse.com>
In-Reply-To: <2bbb347c-bc5b-63f7-3e94-b90145ff5166@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

PiBPbiAzMC4wMS4yMSAxOTo1MywgUm9tYW4gU2hhcG9zaG5payB3cm90ZToNCj4gPiBPbiBGcmks
IEphbiAyOSwgMjAyMSBhdCAxMToyOCBQTSBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPiA+Pg0KPiA+PiBPbiAyOS4wMS4yMSAyMToxMiwgUm9tYW4gU2hhcG9zaG5payB3
cm90ZToNCj4gPj4+IEhpIQ0KPiA+Pj4NCj4gPj4+IEknbSB0cnlpbmcgdG8gc2VlIGhvdyBtdWNo
IG1pbGVhZ2UgSSBjYW4gZ2V0IG91dCBvZg0KPiA+Pj4gY3Jhc2goMSkgNy4yLjggKGJhc2VkIG9u
IGdkYiA3LjYpIHdoZW4gaXQgY29tZXMgdG8gYW5hbHl6aW5nIGNyYXNoDQo+ID4+PiBkdW1wcyB0
YWtlbiB2aWEgeGwgZHVtcC1jb3JlICh0aGlzIGlzIGFsbCBvbiB4ODZfNjQgd2l0aCBzdG9jayBY
ZW4NCj4gPj4+IHYuIDQuMTQpLg0KPiA+Pj4NCj4gPj4+IFRoZSBnb29kIG5ld3MgaXMgdGhhdCB0
aGUgaW1hZ2UgYWN0dWFsbHkgZG9lcyBsb2FkIHVwIGJ1dCBpdCB0aHJvd3MNCj4gPj4+IHRoZSBm
b2xsb3dpbmcgV0FSTklOR3MgaW4gdGhlIHByb2Nlc3M6DQo+ID4+Pg0KPiA+Pj4gV0FSTklORzog
Y2Fubm90IGFjY2VzcyB2bWFsbG9jJ2QgbW9kdWxlIG1lbW9yeQ0KPiA+Pj4gY3Jhc2g6IHJlYWQg
ZXJyb3I6IGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3M6IGZmZmZmZmZmOTM2MTM0ODAgIHR5cGU6DQo+
ID4+PiAiZmlsbF90YXNrX3N0cnVjdCINCj4gPj4+IFdBUk5JTkc6IGFjdGl2ZSB0YXNrIGZmZmZm
ZmZmOTM2MTM0ODAgb24gY3B1IDAgbm90IGZvdW5kIGluIFBJRCBoYXNoDQo+ID4+PiBjcmFzaDog
cmVhZCBlcnJvcjoga2VybmVsIHZpcnR1YWwgYWRkcmVzczogZmZmZmZmZmY5MzYxMzQ4MCAgdHlw
ZToNCj4gPj4+ICJmaWxsX3Rhc2tfc3RydWN0Ig0KPiA+Pj4gV0FSTklORzogY2Fubm90IHJlYWQg
bG9nX2J1ZiBjb250ZW50cw0KPiA+Pj4NCj4gPj4+IEFuZCB0aGVuIHRoZSBpbmZvIHRoYXQgaXQg
Z2l2ZXMgbWUgYXJvdW5kIGJhc2ljIHRoaW5ncyBsaWtlIHBzLCBtb2QsDQo+ID4+PiBsb2csIGV0
Yy4gaXMgcmVhbGx5IHN1cGVyIGxpbWl0ZWQgKGFuZCBJIGFtIG5vdyBzdXNwZWN0aW5nIG1heSBl
dmVuDQo+ID4+PiBiZSB3cm9uZykuDQo+ID4+Pg0KPiA+Pj4gU2luY2UgSSB3YXMgcHJpbWFyaWx5
IGFmdGVyIGRtZXNnL2xvZyBpbml0aWFsbHksIEkgdHJpZWQ6DQo+ID4+PiBjcmFzaD4gbG9nDQo+
ID4+PiBsb2c6IFdBUk5JTkc6IGNhbm5vdCByZWFkIGxvZ19idWYgY29udGVudHMNCj4gPj4+DQo+
ID4+PiBUaGVuIEkgdHJpZWQgdGFraW5nIGFuIHhsIGR1bXAtY29yZSBmcm9tIHRoZSBkb21VIHRo
YXQgd2FzIHN0aWxsDQo+ID4+PiB2ZXJ5IG11Y2ggYWxpdmUgYW5kIGhhcHB5IGFuZCBnb3Qgc2lt
aWxhciByZXN1bHRzIC0tIHNvIGl0IGNsZWFybHkNCj4gPj4+IGRvZXNuJ3Qgc2VlbSB0byBiZSBy
ZWxhdGVkIHRvIHRoZSBzdGF0ZSBkb21VIGlzIGluLg0KPiA+Pj4NCj4gPj4+IEFzIG1hdHRlciBv
ZiBmYWN0LCBJIGFjdHVhbGx5IGdvdCB0byB0aGUgZGVzaXJlZCBkbWVzZyBvdXRwdXQgYnkNCj4g
Pj4+IHNpbXBseSBydW5uaW5nIHN0cmluZ3MoMSkgb24gdGhlIGNvcmUgZmlsZSAtLSBzbyB0aGUg
aW5mbyBpcw0KPiA+Pj4gZGVmaW5pdGVseSB0aGVyZSAtLSBidXQgSSBndWVzcyBzb21lIGtpbmQg
b2YgaW5kZXgvcmVmZXJlbmNlIG1heWJlDQo+ID4+PiBicm9rZW4uDQo+ID4+Pg0KPiA+Pj4gV2l0
aCBhbGwgdGhhdCBpbiBtaW5kLCBpZiB0aGVyZSdzIGFueW9uZSBvbiB0aGlzIE1MIHdobyBoYXMg
cmVjZW50bHkNCj4gPj4+IGRvbmUgWGVuIERvbVUgY3Jhc2ggZHVtcCBhbmFseXNpcyAtLSBJIHdv
dWxkIGRlZmluaXRlbHkgYXBwcmVjaWF0ZQ0KPiA+Pj4gdGhlIHBvaW50ZXJzIQ0KPiA+Pg0KPiA+
PiBGb3IgbWUgaXQganVzdCB3b3JrcyAob3BlblNVU0UpLg0KPiA+DQo+ID4gQ2FuIHlvdSBwbGVh
c2UgcnVuOg0KPiA+DQo+ID4gY3Jhc2ggLS12ZXJzaW9uIGFuZCByZWFkZWxmIC1hIFhYWFggKG9u
IHRoZSB4bCBkdW1wLWNvcmUgb3V0cHV0KSBhbmQNCj4gPiBwb3N0IHRoZSByZXN1bHRzPw0KPiAN
Cj4gIyBjcmFzaCAtLXZlcnNpb24NCj4gDQo+IGNyYXNoIDcuMi4xDQoNCkkgdHJpZWQgdG8gYnVp
bGQgdGhpcyB2ZXJzaW9uIGJ1dCBJIHN0aWxsIGdldCB0aGUgZm9sbG93aW5nIHdoaWxlIHRyeWlu
ZyB0byBvcGVuIGEgZHVtcCBmaWxlDQpwcm9kdWNlZCBieSAieGwgZHVtcC1jb3JlIjoNCg0KW3Jv
b3RAbGN5Mi1kdDkyIGNyYXNoXSMgLi9jcmFzaCAuLi92bWxpbnV4LTUuOC4wLTQ0LWdlbmVyaWMg
Li4veHh4LmRtcA0KDQpjcmFzaCA3LjIuMQ0KQ29weXJpZ2h0IChDKSAyMDAyLTIwMTcgIFJlZCBI
YXQsIEluYy4NCkNvcHlyaWdodCAoQykgMjAwNCwgMjAwNSwgMjAwNiwgMjAxMCAgSUJNIENvcnBv
cmF0aW9uDQpDb3B5cmlnaHQgKEMpIDE5OTktMjAwNiAgSGV3bGV0dC1QYWNrYXJkIENvDQpDb3B5
cmlnaHQgKEMpIDIwMDUsIDIwMDYsIDIwMTEsIDIwMTIgIEZ1aml0c3UgTGltaXRlZA0KQ29weXJp
Z2h0IChDKSAyMDA2LCAyMDA3ICBWQSBMaW51eCBTeXN0ZW1zIEphcGFuIEsuSy4NCkNvcHlyaWdo
dCAoQykgMjAwNSwgMjAxMSAgTkVDIENvcnBvcmF0aW9uDQpDb3B5cmlnaHQgKEMpIDE5OTksIDIw
MDIsIDIwMDcgIFNpbGljb24gR3JhcGhpY3MsIEluYy4NCkNvcHlyaWdodCAoQykgMTk5OSwgMjAw
MCwgMjAwMSwgMjAwMiAgTWlzc2lvbiBDcml0aWNhbCBMaW51eCwgSW5jLg0KVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmUsIGNvdmVyZWQgYnkgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlLA0KYW5kIHlvdSBhcmUgd2VsY29tZSB0byBjaGFuZ2UgaXQgYW5kL29yIGRpc3RyaWJ1dGUg
Y29waWVzIG9mIGl0IHVuZGVyDQpjZXJ0YWluIGNvbmRpdGlvbnMuICBFbnRlciAiaGVscCBjb3B5
aW5nIiB0byBzZWUgdGhlIGNvbmRpdGlvbnMuDQpUaGlzIHByb2dyYW0gaGFzIGFic29sdXRlbHkg
bm8gd2FycmFudHkuICBFbnRlciAiaGVscCB3YXJyYW50eSIgZm9yIGRldGFpbHMuDQoNCkdOVSBn
ZGIgKEdEQikgNy42DQpDb3B5cmlnaHQgKEMpIDIwMTMgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9u
LCBJbmMuDQpMaWNlbnNlIEdQTHYzKzogR05VIEdQTCB2ZXJzaW9uIDMgb3IgbGF0ZXIgPGh0dHA6
Ly9nbnUub3JnL2xpY2Vuc2VzL2dwbC5odG1sPg0KVGhpcyBpcyBmcmVlIHNvZnR3YXJlOiB5b3Ug
YXJlIGZyZWUgdG8gY2hhbmdlIGFuZCByZWRpc3RyaWJ1dGUgaXQuDQpUaGVyZSBpcyBOTyBXQVJS
QU5UWSwgdG8gdGhlIGV4dGVudCBwZXJtaXR0ZWQgYnkgbGF3LiAgVHlwZSAic2hvdyBjb3B5aW5n
Ig0KYW5kICJzaG93IHdhcnJhbnR5IiBmb3IgZGV0YWlscy4NClRoaXMgR0RCIHdhcyBjb25maWd1
cmVkIGFzICJ4ODZfNjQtdW5rbm93bi1saW51eC1nbnUiLi4uDQoNCmNyYXNoOiBjYW5ub3QgZGV0
ZXJtaW5lIGJhc2Uga2VybmVsIHZlcnNpb24NCmNyYXNoOiAuLi92bWxpbnV4LTUuOC4wLTQ0LWdl
bmVyaWMgYW5kIC4uL3h4eC5kbXAgZG8gbm90IG1hdGNoIQ0KDQoNCkFtIEkgZG9pbmcgc29tZXRo
aW5nIHdyb25nPyBIb3cgZG8gSSBuZWVkIHRvIHVzZSBjcmFzaCBmb3IgaXQgdG8gd29yaz8NCg0K
SWdvcg0K

