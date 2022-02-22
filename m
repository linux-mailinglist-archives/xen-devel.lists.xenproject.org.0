Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860904BF4C7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 10:33:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276591.472795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMRXQ-00065c-1M; Tue, 22 Feb 2022 09:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276591.472795; Tue, 22 Feb 2022 09:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMRXP-00062g-UK; Tue, 22 Feb 2022 09:32:51 +0000
Received: by outflank-mailman (input) for mailman id 276591;
 Tue, 22 Feb 2022 09:32:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+X7=TF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nMRXP-00062a-6h
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 09:32:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66818808-93c2-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 10:32:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 449471F399;
 Tue, 22 Feb 2022 09:32:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 08CB213BA7;
 Tue, 22 Feb 2022 09:32:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Xi3aAMGtFGKZXwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 22 Feb 2022 09:32:49 +0000
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
X-Inumbo-ID: 66818808-93c2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645522369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RA2JQbvipU8RtguBS6Fx6ajIPHPHvPNYRaPJxCaD5FI=;
	b=JI0P0y0aSt3qMRtTHZ8SoGMok0Bv2LEVE8T6rRmI/REPB89pR6HPIwNuqxuaGJTr8+MwHU
	z2oJv4IK3ZgqxJQsdfAoFNC7vb+dPJYz+ds2yvl/kGe8PUfZYE9YFpwSWGXMuIETaENaKY
	cynehuD+j10afRNPzbegPjEtHB1JN3E=
Message-ID: <732382d7-2578-1644-f730-4b7776d26f22@suse.com>
Date: Tue, 22 Feb 2022 10:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220221124221.10245-1-jgross@suse.com>
 <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>
 <7798d54a-0aa8-5c13-c8fe-50e3dca54b12@suse.com>
 <28f2b406-f36e-e115-d6ff-cdcdf22f68ec@suse.com>
 <aaef1839-96b6-0d6c-df3b-d31cc7fa697d@suse.com>
 <e8a17311-1a56-23d1-7414-0f9ae18cc0e1@suse.com>
 <06890331-8c75-ddb9-57e8-284c47d4d562@suse.com>
 <fbd980cf-71c2-aa8b-4d23-acbb457431fd@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/include/public: add macro for invalid grant reference
In-Reply-To: <fbd980cf-71c2-aa8b-4d23-acbb457431fd@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vfM5YkAeu56D4ktMkZ23gtlE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vfM5YkAeu56D4ktMkZ23gtlE
Content-Type: multipart/mixed; boundary="------------of0fjyPoNZ4Cgev6ZCRit6RR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <732382d7-2578-1644-f730-4b7776d26f22@suse.com>
Subject: Re: [PATCH] xen/include/public: add macro for invalid grant reference
References: <20220221124221.10245-1-jgross@suse.com>
 <5bf7424a-c295-7aa5-4bf8-13136065a06b@suse.com>
 <7798d54a-0aa8-5c13-c8fe-50e3dca54b12@suse.com>
 <28f2b406-f36e-e115-d6ff-cdcdf22f68ec@suse.com>
 <aaef1839-96b6-0d6c-df3b-d31cc7fa697d@suse.com>
 <e8a17311-1a56-23d1-7414-0f9ae18cc0e1@suse.com>
 <06890331-8c75-ddb9-57e8-284c47d4d562@suse.com>
 <fbd980cf-71c2-aa8b-4d23-acbb457431fd@suse.com>
In-Reply-To: <fbd980cf-71c2-aa8b-4d23-acbb457431fd@suse.com>

--------------of0fjyPoNZ4Cgev6ZCRit6RR
Content-Type: multipart/mixed; boundary="------------I2mG9Uk8L00DeHksLDpP2bU4"

--------------I2mG9Uk8L00DeHksLDpP2bU4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDIuMjIgMDk6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMS4wMi4yMDIy
IDE2OjU3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjEuMDIuMjIgMTY6MzEsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIxLjAyLjIwMjIgMTY6MDUsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDIxLjAyLjIyIDE1OjMxLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDIxLjAyLjIwMjIgMTU6MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gT24gMjEuMDIuMjIgMTU6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+PiBPbiAy
MS4wMi4yMDIyIDEzOjQyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4+Pj4gUHJvdmlk
aW5nIGEgbWFjcm8gZm9yIGFuIGludmFsaWQgZ3JhbnQgcmVmZXJlbmNlIHdvdWxkIGJlIGJl
bmVmaWNpYWwNCj4+Pj4+Pj4+IGZvciB1c2VycywgZXNwZWNpYWxseSBhcyBzb21lIGFyZSB1
c2luZyB0aGUgd3JvbmcgdmFsdWUgIjAiIGZvciB0aGF0DQo+Pj4+Pj4+PiBwdXJwb3NlLg0K
Pj4+Pj4+Pj4NCj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gT3ZlciB0aGUgeWVhcnMgSSd2ZSBiZWVu
IGNvbnNpZGVyaW5nIHRvIGFkZCBzdWNoIHRvIHRoZSBwdWJsaWMNCj4+Pj4+Pj4gaW50ZXJm
YWNlLCBwZXJoYXBzIGV2ZW4gbW9yZSB0aGFuIG9uY2UuIEJ1dCBJJ20gYWZyYWlkIGl0J3Mg
bm90IHRoYXQNCj4+Pj4+Pj4gZWFzeS4gSW4gcHJpbmNpcGxlIDB4ZmZmZmZmZmYgKHdoaWNo
IGJ0dyBpc24ndCBuZWNlc3NhcmlseSB+MHUpIGNvdWxkDQo+Pj4+Pj4NCj4+Pj4+PiBJIGNh
biBjaGFuZ2UgdGhhdCB0byB1c2UgMHhmZmZmZmZmZiBleHBsaWNpdGx5Lg0KPj4+Pj4+DQo+
Pj4+Pj4+IGJlIGEgdmFsaWQgcmVmLiBJdCBpcyByZWFsbHkgaW50ZXJuYWwgYWdyZWVtZW50
IGJ5IHVzZXJzIG9mIHRoZQ0KPj4+Pj4+PiBpbnRlcmZhY2UgdG8gc2V0IGZvciB0aGVtc2Vs
dmVzIHRoYXQgdGhleSdyZSBub3QgZXZlciBnb2luZyB0byBtYWtlDQo+Pj4+Pj4+IGEgdmFs
aWQgZ3JhbnQgYmVoaW5kIHRoYXQgcmVmZXJlbmNlLg0KPj4+Pj4+DQo+Pj4+Pj4gQXMgdGhl
IGdyYW50IHJlZmVyZW5jZSBpcyBhbiBpbmRleCBpbnRvIHRoZSBncmFudCB0YWJsZSB0aGlz
IHdvdWxkDQo+Pj4+Pj4gbGltaXQgdGhlIHNpemUgb2YgdGhlIGdyYW50IHRhYmxlIHRvICJv
bmx5IiBVSU5UX01BWCAtIDEuIEkgZG9uJ3QNCj4+Pj4+PiB0aGluayB0aGlzIHdpbGwgYmUg
ZXZlciBhIGNvbmNlcm4gKG90aGVyIHRoYW4gYW4gYWNhZGVtaWNhbCBvbmUpLg0KPj4+Pj4N
Cj4+Pj4+IFRoYXQgd2Fzbid0IG15IHBvaW50LiBMaW1pdGluZyB0aGUgdGFibGUgdG8gb25l
IGxlc3MgZW50cnkgaXMgbm90IGENCj4+Pj4+IGJpZyBkZWFsIGluZGVlZC4gQnV0IHdlIGhh
dmUgbm8gcmVhc29uIHRvIG1hbmRhdGUgd2hpY2ggZ3JlZihzKSB0bw0KPj4+Pj4gY29uc2lk
ZXIgaW52YWxpZC4gQSBndWVzdCBjb3VsZCBjb25zaWRlciBncmVmIDAgdGhlIGludmFsaWQg
b25lLg0KPj4+Pg0KPj4+PiBXaXRoIHRoZSBncmVmIGJlaW5nIGFuIGluZGV4IHN0YXJ0aW5n
IHdpdGggMCAoZ3JlZiAwIGlzIHZhbGlkLCBhcyBpdCBpcw0KPj4+PiB1c2VkIGZvciB0aGUg
Y29uc29sZSByaW5nIHBhZ2UpLCB0aGUgbmF0dXJhbCBjaG9pY2UgZm9yIGFuIGludmFsaWQN
Cj4+Pj4gdmFsdWUgaXMgdGhlIGhpZ2hlc3Qgb25lIGJlaW5nIHJlcHJlc2VudGFibGUuIEEg
Z3JlZiBpcyBvZiB0eXBlIHVpbnQzMl90DQo+Pj4+IHJlc3VsdGluZyBpbiB0aGlzIHZhbHVl
IGJlaW5nIDB4ZmZmZmZmZmYuDQo+Pj4+DQo+Pj4+IFdoaWxlIGluIHRoZW9yeSBhIGdyYW50
IHRhYmxlIGNvdWxkIGJlIHRoYXQgbGFyZ2UsIGluIHByYWN0aWNlIHRoaXMNCj4+Pj4gd2ls
bCBuZXZlciBoYXBwZW4uDQo+Pj4+DQo+Pj4+PiBUaGUgaHlwZXJ2aXNvciBkb2Vzbid0IGNh
cmUuIEltbyB0aGlzIHNpbXBseSBpcyBhbiBhc3BlY3Qgd2hpY2ggaXMNCj4+Pj4NCj4+Pj4g
VGhpcyBpc24ndCB0cnVlLiBUaGUgaHlwZXJ2aXNvciBuZWVkcyB0byBhbGxvY2F0ZSByZXNv
dXJjZXMgZm9yIGJlaW5nDQo+Pj4+IGFibGUgdG8gaGFuZGxlIHRoZSBoaWdoZXN0IHBvc3Np
YmxlIGdyZWYgdmFsdWUgZm9yIGEgZ3Vlc3QuIEZvciBhIHYxDQo+Pj4+IGdyYW50IHRhYmxl
IHRoaXMgd291bGQgbWVhbiAzMkdCIG9mIGdyYW50IHRhYmxlIHNpemUuIEFyZSB5b3UgcmVh
bGx5DQo+Pj4+IGNvbmNlcm5lZCB3ZSB3aWxsIGV2ZXIgaGl0IHRoaXMgbGltaXQ/IFRoaXMg
aXNuJ3QgYXQgdGhlIGd1ZXN0J3MNCj4+Pj4gY2hvaWNlLCBhZnRlciBhbGwsIGFzIHRoZSBt
YXggZ3JhbnQgdGFibGUgc2l6ZSBpcyBsaW1pdGVkIGJ5IFhlbi4NCj4+Pg0KPj4+IElmIHdl
J3JlIG5vdCBnb2luZyB0byBoaXQgdGhhdCBsaW1pdCwgd2hhdCdzIHdyb25nIHdpdGggZGVj
bGFyaW5nIHRoZQ0KPj4+IGVudGlyZSB1cHBlciBoYWxmIG9mIHVpbnQzMl90IHNwYWNlICJp
bnZhbGlkIiBmb3IgdXNlIGEgZ3JlZj8gSWYgd2UNCj4+PiB3b24ndCBldmVyIGdvIHVwIHRv
IDMyR2IsIHdlIHF1aXRlIGNlcnRhaW5seSBhbHNvIHdvbid0IGV2ZXIgcmVhY2gNCj4+PiAx
NkdiLiBZZXMsIHlvdSBwcm9iYWJseSBhbHJlYWR5IGd1ZXNzZWQgaXQsIHdlIGNhbiB0aGVu
IHJlcGVhdCB0aGlzDQo+Pj4gcHJvY2VzcyBpdGVyYXRpdmVseSB1bnRpbCB3ZSByZWFjaCA0
a2IuDQo+Pg0KPj4gVGhpcyByZWFzb25pbmcgaXMgbm9uc2Vuc2UsIGFuZCB5b3Uga25vdyBp
dC4NCj4gDQo+IEludGVyZXN0aW5nLiBUaGUgdW5kZXJseWluZyAid2hlcmUgdG8gZHJhdyBh
IGJvdW5kYXJ5IiBpcyBmYXIgZnJvbQ0KPiBub25zZW5zZSwgSSB0aGluay4gVGhlIG9ubHkg
d2F5IHRvIGVzY2FwZSB0aGlzIHF1ZXN0aW9uIGlzIHRvIGF2b2lkDQo+IGludHJvZHVjdGlv
biBvZiBhcnRpZmljaWFsIGJvdW5kYXJpZXMuIFdoaWxlIGl0IHdhcyBtZSB0byBzdWJtaXQN
Cg0KWW91ciByZWFzb25pbmcgdGhhdCB0YWtpbmcgYXdheSB0aGUgdXBwZXIgMC4wMDAwMDAw
MjUlIG9mIGdyYW50IHJlZg0Kc3BhY2UgaXMgc2ltaWxhciB0byB0YWtlIGF3YXkgNTAlIG9y
IGV2ZW4gOTkuOTk5OSUgaXMgbm9uc2Vuc2UuDQoNClRha2luZyBhd2F5IHRoZSBsYXN0IGVu
dHJ5IG9mIG1vcmUgdGhhbiA0IGJpbGxpb24gb25lcywgd2hpbGUgdG9kYXkNCm5vIHVzYWdl
IGV4Y2VlZGluZyAxIG1pbGxpb24gaXMga25vd24gKHRoZSBoaWdoZXN0IHZhbHVlIEkga25v
dyBvZg0KaXMgYWxsb3dpbmcgMjU2IGdyYW50IGZyYW1lcyBmb3IgYSBndWVzdCwgcmVzdWx0
aW5nIGluIDY1NTM2IGdyYW50DQpyZWZzKSwgaXMgaGFyZGx5IGEgcmVsZXZhbnQgbGltaXRh
dGlvbi4gVGhpcyBpcyBlc3BlY2lhbGx5IHRydWUsIGFzDQp0aGUgZ3JhbnQgcmVmIHNwYWNl
IGNhbid0IGJlIGV4dGVuZGVkIHRvIGhpZ2hlciB2YWx1ZXMgd2l0aG91dCBhDQpuZXcgaW50
ZXJmYWNlLg0KDQo+ICJTVVBQT1JULm1kOiBsaW1pdCBzZWN1cml0eSBzdXBwb3J0IGZvciBo
b3N0cyB3aXRoIHZlcnkgbXVjaCBtZW1vcnkiLA0KPiBJIGRpZG4ndCBkbyBzbyBiZWNhdXNl
IEkgdGhvdWdodCBpdCB3YXMgYSBnb29kIHRoaW5nIHRvIGVzdGFibGlzaA0KPiBzdWNoIGEg
Ym91bmRhcnkuIE5vciB3YXMgSSBjb252aW5jZWQgaW4gYW55IHdheSBvZiB0aGUgcHJlY2lz
ZQ0KPiB2YWx1ZSBjaG9zZW4uIEkgbWVyZWx5IHRvb2sgb24gY2Fycnlpbmcgb3V0IHdoYXQg
d2FzIGRpc2N1c3NlZA0KPiB3aXRoIHRoZSBzZWN1cml0eSB0ZWFtIGluIHRoZSBjb250ZXh0
IG9mIFhTQS0zODUsIHdoZW4gZXZlbiB0aGF0DQo+IGRpc2N1c3Npb24gbGVmdCBpdCB2ZXJ5
IG11Y2ggdG8gbWUgdG8gcGljayBhbiBhcmJpdHJhcnkgdmFsdWUuDQo+IA0KPj4+Pj4gbm90
IGluIG5lZWQgb2YgcGlubmluZyBkb3duIGluIHRoZSBBQkkuIFlldCBpZiBpdCB3YXMgcGlu
bmVkIGRvd24NCj4+Pj4+IGxpa2UgeW91IGRvLCB0aGVuIHRoZSBoeXBlcnZpc29yIHdvdWxk
IG5lZWQgdG8gbWFrZSBzdXJlIGl0IHJlZnVzZXMNCj4+Pj4+IHRvIGFjdCBvbiB0aGlzIG1h
bmRhdGVkIGludmFsaWQgZ3JlZi4NCj4+Pj4NCj4+Pj4gVGhpcyBpcyBhbiBlYXN5IG9uZS4g
V2UgY291bGQganVzdCByZWZ1c2UgdG8gaGF2ZSBhIGdyYW50IHRhYmxlIG9mDQo+Pj4+IHRo
YXQgc2l6ZS4gSSBjYW4gYWRkIHRoaXMgdG8gdGhlIHBhdGNoIGlmIHlvdSByZWFsbHkgdGhp
bmsgaXQgaXMNCj4+Pj4gbmVjZXNzYXJ5Lg0KPj4+DQo+Pj4gU2luY2UgZ3JhbnQgdGFibGUg
c2l6ZSBpcyBtZWFzdXJlZCBpbiBwYWdlcywgeW91J2QgdGhlbiBoYXZlIHRvDQo+Pj4gcmVm
dXNlIHVzZSBvZiBtb3JlIHRoYW4ganVzdCB0aGF0IHNpbmdsZSBncmVmLiBUaGlzIHdvdWxk
IHN0aWxsIG5vdA0KPj4+IGJlIGFuIGltbWVkaWF0ZSBwcm9ibGVtLCBidXQgZGVtb25zdHJh
dGVzIGFnYWluIHRoYXQgaXQncyB1bmNsZWFyDQo+Pj4gd2hlcmUgdG8gZHJhdyBzdWNoIGEg
Ym91bmRhcnksIGlmIG9uZSBpcyB0byBiZSBhcnRpZmljaWFsbHkgZHJhd24uDQo+Pg0KPj4g
SXQgc2hvdWxkIGJlIGFzIGhpZ2ggYXMgcG9zc2libGUuIEkgd291bGRuJ3QgbWluZCBqdXN0
IHJlZnVzaW5nIHRoZQ0KPj4gbGFzdCBwb3NzaWJsZSBncmVmLCBidXQgSSBkb24ndCB0aGlu
ayB0aGlzIGlzIG5lY2Vzc2FyeS4NCj4+DQo+Pj4+IFRCSCwgSSB0aGluayBzdWNoIGNvbXBs
ZXRlbHkgdGhlb3JldGljYWwgY29uY2VybnMgc2hvdWxkIG5vdCBzdGFuZA0KPj4+PiBpbiB0
aGUgd2F5IG9mIGFkZGl0aW9ucyB0byB0aGUgQUJJIG1ha2luZyBsaWZlIGVhc2llciBmb3Ig
Y29uc3VtZXJzLg0KPj4+DQo+Pj4gSW4gY2FzZSBpdCB3YXNuJ3QgY2xlYXIgLSBteSBjb25j
ZXJuIGlzbid0IHRoYXQgc2FjcmlmaWNpbmcgdGhpcyBvbmUNCj4+PiBlbnRyeSBtYXkgY2F1
c2UgYSBwcm9ibGVtLCBvciB0aGF0IHdlJ2QgZXZlciBzZWUgZ3JhbnQgdGFibGVzIGdyb3cN
Cj4+PiB0aGlzIGJpZyAoYWxiZWl0IGZvciB0aGUgbGF0dGVyOiB5b3UgbmV2ZXIgcmVhbGx5
IGtub3cpLiBJbnN0ZWFkIG15DQo+Pj4gY29uY2VybiBpcyB0aGF0IGl0IGlzIGNvbmNlcHR1
YWxseSB3cm9uZyBmb3IgdXMgdG8gKG5vdykgaW50cm9kdWNlDQo+Pj4gc3VjaCBhIHZhbHVl
Lg0KPj4NCj4+IEkgaGF2ZSB1bmRlcnN0b29kIHRoYXQgdGhpcyBpcyB5b3VyIGNvbmNlcm4u
DQo+Pg0KPj4gSSBjb250aW51ZSB0byB0aGluayB0aGF0IHRoaXMgY29uY2VybiBpcyBvZiBw
dXJlbHkgYWNhZGVtaWNhbCBuYXR1cmUuDQo+IA0KPiBXZWxsLCBJJ20gbm90IGdvaW5nIHRv
IE5BSyB0aGUgY2hhbmdlIGlmIG90aGVycyBhZ3JlZSB3aXRoIHlvdXIgdmlldy4NCj4gQnV0
IEknbSBub3QgZ29pbmcgdG8gcHV0IG15IG5hbWUgdW5kZXIgaXQgaW4gYW55IGZvcm0uIEFj
YWRlbWljYWwgb3INCj4gbm90LCBpdCBzZXRzIGEobm90aGVyKSB3cm9uZyBwcmVjZWRlbnQu
DQoNCkZhaXIgZW5vdWdoLg0KDQoNCkp1ZXJnZW4NCg==
--------------I2mG9Uk8L00DeHksLDpP2bU4
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------I2mG9Uk8L00DeHksLDpP2bU4--

--------------of0fjyPoNZ4Cgev6ZCRit6RR--

--------------vfM5YkAeu56D4ktMkZ23gtlE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIUrcAFAwAAAAAACgkQsN6d1ii/Ey+E
XAf/SEhQ4Dgh98GMCZEMvm7bW0YZzlQorCA4Co2zhJmThTY514B84AZ4I6A3OhZWdUU+ok7j3zyg
KyhNeMyWEsdaZBZHPMORaAA9YAZXGOWZEgrCP9CPvhXfv8xd82BN9QpVnVC2xWL/BDPjLjEfTPvG
JNOtGyxSWDphbVk82kK/0ivEtSmtnW2w5NM7zdWXtZNW2Op9luofMFiLOz8FFcbPOrf71VFVXh9j
pqbBNHvxGHWmsuNn8JcJiqQUjFVP2dm+y6bjNslDjoNMBGOlVi5C0eFhKMXOOa0fl2bfS2Uj6xYk
WmgWzmSEJQGGDsATgWgaZvhbgoQwCEqx4tmPnjDIWg==
=Nx38
-----END PGP SIGNATURE-----

--------------vfM5YkAeu56D4ktMkZ23gtlE--

