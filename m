Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8E81A009
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 17:22:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP7Jv-0007rt-AG; Fri, 10 May 2019 15:20:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrlK=TK=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hP7Jt-0007ro-5x
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 15:20:21 +0000
X-Inumbo-ID: 1d58bf76-7337-11e9-9f7b-c34128e8f869
Received: from mail-40132.protonmail.ch (unknown [185.70.40.132])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d58bf76-7337-11e9-9f7b-c34128e8f869;
 Fri, 10 May 2019 15:20:17 +0000 (UTC)
Date: Fri, 10 May 2019 15:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1557501615;
 bh=cek1g5N1Q+HZpTb76P+OR1SI168KnM8YB8NVQWGalSA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=pX/hhmf/l3MQJTROf0PIC3+c3GIiYUcsK8qbjEtEKcfvfUdhBfHPqXrjzOVGWs0Oh
 r+bR4sfVWb9Rbe4GmDZ1ajQc5FAvco3df5ZM6872uapJ6uYmhJudNTNP0hFM+AjgU9
 sr29LYzRhksIBOTQ7eLg0edp1G0KYS4/EHVk8D4g=
To: Tamas K Lengyel <tamas@tklengyel.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID: <2CSFG5UToM6X2rdSXfVEGA7rEhE7WEwiocdQm0xSzDWqnWj1uhm-P-DJv_mTS7e9uQGLy2YOrCO5d_Jrl4lcCCu8Kt5H2wKAgve2jB10VuQ=@protonmail.com>
In-Reply-To: <CABfawhmMAy19_g_JKe5kc6HrZwk09fgnM_XNi4k02jfSmc+edA@mail.gmail.com>
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <CABfawh=_Xg225Tfw-zS9iXXk2pdUG0MyBi3+Co5Urmh6EfTOXw@mail.gmail.com>
 <a8f1adea-9d57-5953-614f-85f7b97be44f@citrix.com>
 <CABfawhmMAy19_g_JKe5kc6HrZwk09fgnM_XNi4k02jfSmc+edA@mail.gmail.com>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
 autolearn_force=no version=3.4.2
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGUgamV1ZGksIG1haSA5LCAyMDE5IDg6MDggUE0sIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4gYSDDqWNyaXTCoDoKPiA+ID4gPiBJIGFscmVhZHkgc3VnZ2VzdGVkIHRvIE1h
dGhpZXUgdG8gdHJ5IHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgdXNpbmcgdGhlCj4gPiA+ID4geGVu
LWFjY2VzcyB0ZXN0IHRvb2wgdGhhdCdzIGluIHRoZSBYZW4gdHJlZSB0byBjdXQgb3V0IGFsbCB0
aGF0Cj4gPiA+ID4gY29tcGxleGl0eS4KPiA+Cj4gPiB4ZW4tYWNjZXNzIGlzIG9rLCBidXQgSSd2
ZSBuZXZlciBlbmNvdW50ZXJlZCBhIHNpdHVhdGlvbiB3aGVyZSBJIGhhdmVuJ3QKPiA+IGhhZCB0
byBtb2RpZnkgaXQgZmlyc3QgdG8gZ2V0IGl0IHVzYWJsZS4KPgo+IFJpZ2h0LCBpdCB3b3VsZCBs
aWtlbHkgaGF2ZSB0byBiZSBtb2RpZmllZC4KPgo+ID4gSSBoYXZlIHNvbWUgcGxhbnMgdG8gcmVw
bGFjZSBpdCB3aXRoIHNvbWV0aGluZyBmYXIgbW9yZSB1c2FibGUsIGFzIHBhcnQKPiA+IG9mIHR5
aW5nIHRvZ2V0aGVyIHNvbWUgWFRGLWJhc2VkIFZNSSB0ZXN0aW5nLCBidXQgbm9uZSBvZiB0aGF0
IGlzCj4gPiByZW1vdGVseSByZWFkeSB5ZXQuCj4KPiBZZXMsIHRoYXQgd291bGQgYmUgZmFudGFz
dGljIHRvIGhhdmUuCj4KPiA+ID4gV2l0aG91dCBiZWluZyBhYmxlIHRvIGxpbWl0IHRoZSBzY29w
ZSBvZiB0aGUgYnVnIGFuZCBiZWluZwo+ID4gPiBhYmxlIHRvIHJlcHJvZHVjaWJsZSB0cmlnZ2Vy
IGl0IEkgc2VlIGxpdHRsZSBjaGFuY2Ugb2YgZmluZGluZyB0aGUKPiA+ID4gcm9vdCBjYXVzZS4g
VW5mb3J0dW5hdGVseSBJIGRvbid0IGhhdmUgdGhlIHRpbWUgdG8gZG8gdGhhdCBteXNlbGYuCj4g
Pgo+ID4gSSBjYW4gcHJvYmFibHkgaGVscCBvdXQgd2l0aCBzb21lIHN1Z2dlc3Rpb25zLCBidXQg
SSBhZ3JlZSB0aGF0IHdlIGFyZQo+ID4gZ29pbmcgdG8gaGF2ZSB0byBjdXQgb3V0IHNvbWUgb2Yg
dGhlIGNvbXBsZXhpdHkgaGVyZSB0byBmaWd1cmUgb3V0Cj4gPiBleGFjdGx5IHdoYXQgaXMgZ29p
bmcgb24uCj4gPiBBbHRlcm5hdGl2ZWx5LCBpZiB0aGVyZSBhcmUgc29tZSBzdWZmaWNpZW50bHkg
ZGV0YWlsZWQgaW5zdHJ1Y3Rpb25zIGZvcgo+ID4gaG93IHRvIHB1dCB0b2dldGhlciBhIHJlcHJv
IG9mIHRoZSBwcm9ibGVtIHVzaW5nIGxpYnZtaS9ldGMsIEkgbWlnaHQgYmUKPiA+IGFibGUgdG8g
c3RhcnQgZGVidWdnaW5nIGZyb20gdGhhdCwgYnV0IEkgZGVmaW5pdGVseSBkb24ndCBoYXZlIHRp
bWUgdG8KPiA+IGRvIHRoYXQgaW4gdGhlIG5leHQgd2Vlay4KPgo+IFRoZSBpbnN0cnVjdGlvbnMg
YXJlIG9uaHR0cHM6Ly9kcmFrdnVmLmNvbS4gQUZBSUNUIE1hdGhpZXUgaXMgcnVubmluZwo+IGlu
dG8gdGhlIGlzc3VlIHdpdGggc2ltcGx5IHJ1bm5pbmcgaXQgb24gYSB1cC10by1kYXRlIFdpbmRv
d3MgMTAgZ3Vlc3QKPiBidXQgbm90IGluIGFueSB3YXkgdGhhdCBJIHdvdWxkIGNhbGwgcmVwcm9k
dWNpYmxlLiBSdW5uaW5nIGl0ICJmb3IgYQo+IG1pbnV0ZSBvciB0d28iIGlzIHJlYWxseSBub3Qg
YSByZXByb2R1Y2libGUgYnVnIGRlc2NyaXB0aW9uLgoKSSB0aGluayB0aGVyZSBhcmUgMiBzZXBh
cmF0ZSBpc3N1ZXMsCm9uZSBpcyB0aGUgcmFjZS1jb25kaXRpb24gaSdtIGRlc2NyaWJpbmcsIGlt
cGFjdGluZyBib3RoIFdpbmRvd3MgNyBhbmQgV2luZG93cyAxMCAod2hpY2ggSSBoYXZlIHRlc3Rl
ZC4pLgpzZWNvbmQgaXMgYSBjcmFzaCBsaW5rZWQgdG8gS1BUSSAodGhlIGNyYXNoIGhhcHBlbnMg
cmVhbGx5IGZhc3QsIGFuZCBXaW5kb3dzIDEwIHdpdGhvdXQga3B0aSBpcyBxdWl0ZSBzdGFibGUg
dW5kZXIgRHJha3Z1ZiBtb25pdG9yaW5nLgoKUmVnYXJkaW5nIGhvdyByZXByb2R1Y3RpYmxlIGl0
IGlzLCB3aGF0IEkgaGF2ZSBmb3Igbm93IGlzIGEgUHlUZXN0IGJhc2VkIHRlc3Qgc3VpdGUsCnRo
YXQgd2lsbCBpbmplY3QgdGhlIHNhbXBsZSB1c2luZyBlaXRoZXIgRHJha3Z1ZidzIG1ldGhvZCAo
Y3JlYXRlcHJvYy9zaGVsbGV4ZWMpIG9yIEFuc2libGUvV2luUk0uCgpUaGUgZXhlY3V0aW9uIGlz
IG1vbml0b3JlZCBhbmQgd2hlbiBJIGRldGVjdCB0aGF0IHRoZSBwcm9jZXNzIHRlcm1pbmF0ZWQs
IEkgdmFsaWRhdGUgdGhlIHRlc3QuCgpPbiBXaW5kb3dzIDcgeDY0LCB3aXRoIDQgVkNQVXMsIGl0
IGNyYXNoZXMgYXJvdW5kIH4xMCB0ZXN0cy4KQEFuZHJldyB3b3VsZCB5b3UgbGlrZSB0byBnaXZl
IHRoaXMgYSB0cnksIGFuZCByZXBybyB0aGUgaXNzdWUgb24geW91ciBzaWRlIHdpdGggdGhlIHRl
c3Qgc3VpdGUgPwpUaGF0J3MgdGhlIGJlc3QgInJlcHJvZHVjaWJpbGl0eSIgSSBjYW4gb2ZmZXIg
eW91IGF0IHRoZSBtb21lbnQuCgpNeSBuZXh0IG9iamVjdGl2ZSB3aWxsIGJlIHRvIGxvb2sgYXQg
eGVuLWFjY2VzcyB0b29sLCBhbmQgbW9kaWZ5IGl0IHRvIGluamVjdCBzdGVhdGggYnJlYWtwb2lu
dHMsCnRoZSBzYW1lIHdheSBkcmFrdnVmIGRvZXMsIHRvIGJ1aWxkIGJ1ZyByZXBybyBhcyBzbWFs
bCBhcyBwb3NzaWJsZS4KCk1hdGhpZXUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
