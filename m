Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB58517186
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 16:26:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318929.538931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlWzs-0001Eq-Ug; Mon, 02 May 2022 14:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318929.538931; Mon, 02 May 2022 14:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlWzs-0001C2-Qz; Mon, 02 May 2022 14:25:56 +0000
Received: by outflank-mailman (input) for mailman id 318929;
 Mon, 02 May 2022 14:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z+C6=VK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nlWzr-0001Bt-GY
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 14:25:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c648ee56-ca23-11ec-a405-831a346695d4;
 Mon, 02 May 2022 16:25:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB0AD1F38D;
 Mon,  2 May 2022 14:25:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFDFA13491;
 Mon,  2 May 2022 14:25:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2Xk0KfHpb2KvMgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 02 May 2022 14:25:53 +0000
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
X-Inumbo-ID: c648ee56-ca23-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651501553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aQdYlCVk9hey9yn1VVGHvbimoYpSS37P3C2jjdqpTX4=;
	b=bkGD6FBhxPOW8l5eQ5bF4/nVIdrLgubGcD36e15jC38VZjhlt5grWfiugHmQKGvP1jpFPM
	PTte/29KSSToc7bLLY9azaa9awHQz6GlgMeC30f0DYm2xl9FmUDJNxMNaNFFismjiHRN11
	s+WLTOoSSpnWx3/O3gZDdMSxH0yWSpQ=
Message-ID: <c4ce882d-dbbd-7633-22cc-1c014b328ca2@suse.com>
Date: Mon, 2 May 2022 16:25:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
 <YmubOeYPqW5mBNy4@Air-de-Roger>
 <2a229df5-c341-9ff0-ae5c-cc0d848d7cea@suse.com>
 <YmvDjI4hmmhZ90fi@Air-de-Roger>
From: Juergen Gross <jgross@suse.com>
Subject: Re: x86/PV: (lack of) MTRR exposure
In-Reply-To: <YmvDjI4hmmhZ90fi@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZXgyRopxIcxXIhiBQWsnZPH3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZXgyRopxIcxXIhiBQWsnZPH3
Content-Type: multipart/mixed; boundary="------------wPzf9BL28ykn4r3lvVOP0IYN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <c4ce882d-dbbd-7633-22cc-1c014b328ca2@suse.com>
Subject: Re: x86/PV: (lack of) MTRR exposure
References: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
 <YmubOeYPqW5mBNy4@Air-de-Roger>
 <2a229df5-c341-9ff0-ae5c-cc0d848d7cea@suse.com>
 <YmvDjI4hmmhZ90fi@Air-de-Roger>
In-Reply-To: <YmvDjI4hmmhZ90fi@Air-de-Roger>

--------------wPzf9BL28ykn4r3lvVOP0IYN
Content-Type: multipart/mixed; boundary="------------a260aBg0Ls09sFTk76G8FA3E"

--------------a260aBg0Ls09sFTk76G8FA3E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDQuMjIgMTI6NTMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIEZyaSwg
QXByIDI5LCAyMDIyIGF0IDEyOjAwOjIxUE0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0K
Pj4gT24gMjkuMDQuMjAyMiAxMDowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBP
biBUaHUsIEFwciAyOCwgMjAyMiBhdCAwNTo1MzoxN1BNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToNCj4+Pj4gSGVsbG8sDQo+Pj4+DQo+Pj4+IGluIHRoZSBjb3Vyc2Ugb2YgYW5hbHl6
aW5nIHRoZSBpOTE1IGRyaXZlciBjYXVzaW5nIGJvb3QgdG8gZmFpbCBpbg0KPj4+PiBMaW51
eCA1LjE4IEkgZm91bmQgdGhhdCBMaW51eCwgZm9yIGFsbCB0aGUgeWVhcnMsIGhhcyBiZWVu
IHJ1bm5pbmcNCj4+Pj4gaW4gUFYgbW9kZSBhcyBpZiBQQVQgd2FzIChtb3N0bHkpIGRpc2Fi
bGVkLiBUaGlzIGlzIGEgcmVzdWx0IG9mDQo+Pj4+IHRoZW0gdHlpbmcgUEFUIGluaXRpYWxp
emF0aW9uIHRvIE1UUlIgaW5pdGlhbGl6YXRpb24sIHdoaWxlIHdlDQo+Pj4+IG9mZmVyIFBB
VCBidXQgbm90IE1UUlIgaW4gQ1BVSUQgb3V0cHV0LiBUaGlzIHdhcyBkaWZmZXJlbnQgYmVm
b3JlDQo+Pj4+IG91ciBtb3ZpbmcgdG8gQ1BVIGZlYXR1cmVzZXRzLCBhbmQgYXMgc3VjaCBv
bmUgY291bGQgdmlldyB0aGlzDQo+Pj4+IGJlaGF2aW9yIGFzIGEgcmVncmVzc2lvbiBmcm9t
IHRoYXQgY2hhbmdlLg0KPj4+Pg0KPj4+PiBUaGUgZmlyc3QgcXVlc3Rpb24gaGVyZSBpcyB3
aGV0aGVyIG5vdCBleHBvc2luZyBNVFJSIGFzIGEgZmVhdHVyZQ0KPj4+PiB3YXMgcmVhbGx5
IGludGVuZGVkLCBpbiBwYXJ0aWN1bGFyIGFsc28gZm9yIFBWIERvbTAuIFRoZSBYZW5vTGlu
dXgNCj4+Pj4ga2VybmVsIGFuZCBpdHMgZm9yd2FyZCBwb3J0cyBkaWQgbWFrZSB1c2Ugb2Yg
WEVOUEZfKl9tZW10eXBlIHRvDQo+Pj4+IGRlYWwgd2l0aCBNVFJScy4gVGhhdCdzIGZ1bmN0
aW9uYWxpdHkgd2hpY2ggKG1heWJlIGZvciBhIGdvb2QNCj4+Pj4gcmVhc29uKSBuZXZlciBt
YWRlIGl0IGludG8gdGhlIHB2b3BzIGtlcm5lbC4gTm90ZSB0aGF0IFBWSCBEb20wDQo+Pj4+
IGRvZXMgaGF2ZSBhY2Nlc3MgdG8gdGhlIG9yaWdpbmFsIHNldHRpbmdzLCBhcyB0aGUgaG9z
dCB2YWx1ZXMgYXJlDQo+Pj4+IHVzZWQgYXMgaW5pdGlhbCBzdGF0ZSB0aGVyZS4NCj4+Pj4N
Cj4+Pj4gVGhlIG5leHQgcXVlc3Rpb24gd291bGQgYmUgaG93IHdlIGNvdWxkIGdvIGFib3V0
IGltcHJvdmluZyB0aGUNCj4+Pj4gc2l0dWF0aW9uLiBGb3IgdGhlIHBhcnRpY3VsYXIgaXNz
dWUgaW4gNS4xOCBJJ3ZlIGZvdW5kIGEgcmVsYXRpdmVseQ0KPj4+PiBzaW1wbGUgc29sdXRp
b24gWzFdICh3aGljaCBhbHNvIGxvb2tzIHRvIGhlbHAgZ3JhcGhpY3MgcGVyZm9ybWFuY2UN
Cj4+Pj4gb24gb3RoZXIgc3lzdGVtcywgYWNjb3JkaW5nIHRvIG15IGluaXRpYWwgb2JzZXJ2
YXRpb25zIHdpdGggdXNpbmcNCj4+Pj4gdGhlIGNoYW5nZSksIGFsYmVpdCBpdHMgc2ltcGxp
Y2l0eSBsaWtlbHkgbWVhbnMgaXQgZWl0aGVyIGlzIHdyb25nDQo+Pj4+IGluIHNvbWUgd2F5
LCBvciBtaWdodCBub3QgYmUgbGlrZWQgZm9yIGxvb2tpbmcgaGFja3kgYW5kL29yIGFidXNp
dmUuDQo+Pj4NCj4+PiBJIHdvbmRlciB3aGV0aGVyIHRoZSBwYXRjaCBuZWVkcyB0byBiZSBs
aW1pdGVkIHRvIHRoZSBDUFVJRCBIeXBlcnZpc29yDQo+Pj4gYml0IGJlaW5nIHByZXNlbnQu
ICBJZiB0aGUgUEFUIE1TUiBpcyByZWFkYWJsZSBhbmQgcmV0dXJucyBhIHZhbHVlICE9DQo+
Pj4gMCB0aGVuIFBBVCBzaG91bGQgYmUgYXZhaWxhYmxlPw0KPj4NCj4+IEkgc2ltcGx5IGRp
ZG4ndCB3YW50IHRvIGJlIHRvbyAiYWdncmVzc2l2ZSIuIFRoZXJlIG1heSBiZSByZWFzb25z
IHdoeQ0KPj4gdGhleSB3YW50IHRoaW5ncyB0byBiZSB0aGUgd2F5IHRoZXkgYXJlIG9uIG5h
dGl2ZS4gQWxsIEkgcmVhbGx5IGNhcmUNCj4+IGFib3V0IGlzIHRoYXQgdGhpbmdzIGFyZSBi
cm9rZW4gb24gUFYgWGVuOyBhcyBzdWNoIEkgd291bGRuJ3QgZXZlbg0KPj4gbWluZCB0aWdo
dGVuaW5nIHRoZSBjaGVjayB0byB4ZW5fcHZfZG9tYWluKCkuIEJ1dCBmaXJzdCBJIG5lZWQN
Cj4+IGZlZWRiYWNrIGZyb20gdGhlIG1haW50YWluZXJzIHRoZXJlIGFueXdheS4NCj4gDQo+
IFJpZ2h0LCBJIGRpZCBhbHNvIGNvbnNpZGVyIHN1Z2dlc3RpbmcgdG8gbGltaXQgdGhpcyB0
byBQViBhdCBmaXJzdCwNCj4gYnV0IEkgd2FzIHVuc3VyZSB3aHkgbmF0aXZlIHdvdWxkbid0
IGFsc28gd2FudCBzdWNoIGJlaGF2aW9yLiAgTWF5YmUNCj4gdGhlcmUncyBubyBoYXJkd2Fy
ZSB0aGF0IGhhcyBQQVQgYnV0IG5vdCBNVFJSLCBhbmQgaGVuY2UgdGhpcyB3YXMNCj4gbmV2
ZXIgY29uc2lkZXJlZC4NCj4gDQo+Pj4gSSBndWVzcyB3ZSBzaG91bGQgaW5zdGVhZCBjaGVj
ayB0aGF0IHRoZSBjdXJyZW50IFBBVCB2YWx1ZSBtYXRjaGVzDQo+Pj4gd2hhdCBMaW51eCBl
eHBlY3RzLCBiZWZvcmUgZGVjbGFyaW5nIFBBVCBlbmFibGVkPw0KPj4NCj4+IEkgZG9uJ3Qg
dGhpbmsgc3VjaCBhIGNoZWNrIGlzIG5lZWRlZCwgdGhlIGNvZGUgLi4uDQo+Pg0KPj4+IE5v
dGUgdGhlcmUncyBhbHJlYWR5IGEgY29tbWVudCBpbiBpbml0X2NhY2hlX21vZGVzIHRoYXQg
cmVmZXJzIHRvIFhlbg0KPj4+IGluIHRoZSBjaGVjayBmb3IgUEFUIENQVUlEIGJpdC4NCj4+
DQo+PiAuLi4gaW4gX19pbml0X2NhY2hlX21vZGVzKCkgYWxyZWFkeSBkb2VzIGl0IHRoZSBv
dGhlciB3YXkgYXJvdW5kOg0KPj4gQWRhcHQgYmVoYXZpb3IgdG8gd2hhdCBpcyBmb3VuZCBp
biBQQVQuDQo+Pg0KPj4+ICAgV2UgbWlnaHQgd2FudCB0byBleHBhbmQgdGhhdCBjb21tZW50
DQo+Pj4gKG9yIGFkZCBvbmUgdG8gdGhlIG5ldyBjaGVjayB5b3UgYXJlIGFkZGluZykuDQo+
Pg0KPj4gSSBkb24ndCBzZWUgd2hhdCBmdXJ0aGVyIGluZm9ybWF0aW9uIHlvdSB3b3VsZCB3
YW50IHRvIHB1dCB0aGVyZS4NCj4gDQo+IEl0IHdvdWxkIGRlcGVuZCBvbiBob3cgdGhlIGNo
ZWNrIGVuZHMgdXAgbG9va2luZyBJIHRoaW5rLiAgSWYgdGhlDQo+IGVuYWJsaW5nIGlzIGxp
bWl0ZWQgdG8gYWxzbyBoYXZpbmcgdGhlIEh5cGVydmlzb3IgQ1BVSUQgYml0IHNldCB0aGVu
DQo+IHRoZSBjb21tZW50IHNob3VsZCBsaWtlbHkgbWVudGlvbiB3aHkgc2V0dGluZyBpdCBv
biBuYXRpdmUgaXMgbm90DQo+IHNhZmUuDQo+IA0KPiBBbnl3YXksIGxldCdzIHNlZSB3aGF0
IG1haW50YWluZXJzIHRoaW5rLg0KPiANCj4gVGhlIG90aGVyIG9wdGlvbiB3b3VsZCBiZSB0
byBzZXQgc29tZSBraW5kIG9mIGhvb2tzIGZvciBYZW4gUFYgdG8gYmUNCj4gYWJsZSB0byBy
ZXBvcnQgUEFUIGFzIGVuYWJsZWQgKG1heWJlIGEgWGVuIFBWIGltcGxlbWVudGF0aW9uIG9m
DQo+IG10cnJfb3BzPyksIGJ1dCB0aGF0IHNlZW1zIGxpa2Ugb3Zlci1lbmdpbmVlcmluZyBp
dC4gIE15IG1haW4gY29uY2Vybg0KPiB3aXRoIHNldHRpbmcgcGF0X2JwX2VuYWJsZWQgdG8g
dHJ1ZSBpcyB3aGV0aGVyIGluIHRoZSBmdXR1cmUgc3VjaA0KPiBzZXR0aW5nIGNvdWxkIGJl
IHVzZWQgdG8gZ2F0ZSBQQVQgTVNSIHdyaXRlcy4gIEl0J3MgYWxyZWFkeSBsaWtlIHRoaXMN
Cj4gZm9yIEFQcyAoaW4gcGF0X2luaXQoKSAtPiBwYXRfYXBfaW5pdCgpKSwgYnV0IHdlIGF2
b2lkIHRoYXQgcGF0aA0KPiBiZWNhdXNlIHdlIGRvbid0IHJlcG9ydCBNVFJSIHN1cHBvcnQg
QUZBSUNULg0KDQpUaGUgY2xlYW4gd2F5IHRvIGhhbmRsZSB0aGlzIG1lc3Mgd291bGQgYmUg
dG8gc3VwcG9ydCBQQVQgaW4gdGhlIGtlcm5lbA0Kd2l0aG91dCByZXF1aXJpbmcgTVRSUi4N
Cg0KVGhlIG9ubHkgcmVhc29uIGZvciBQQVQgdG8gcmVxdWl0ZSBNVFJSIHNlZW1zIHRvIGJl
IHRoZSBjb21tb24gdXNhZ2Ugb2YNCm10cnJfcmVuZGV6dm91c19oYW5kbGVyKCkuIEkgbmVl
ZCB0byBsb29rIGludG8gdGhhdCBhIGxpdHRsZSBiaXQgZnVydGhlciwNCmJ1dCBJIHRoaW5r
IHRoaXMgc2hvdWxkIGJlIHJhdGhlciBlYXN5IHRvIHNvbHZlIGJ5IHVzaW5nIGEgZ2VuZXJp
Yw0KcmVuZGV6dm91cyBoYW5kbGVyIGFuZCBwcm9wZXIgY2FsbGJhY2tzLCB3aGljaCB3aWxs
IHVzZSBjb21tb24gYmFja2VuZA0KZnVuY3Rpb25zLg0KDQpQQVQgTVNSIHdyaXRlcyBjYW4g
YmUgaGFuZGxlZCBieSBzcGVjaWFsIGNhc2luZyBpbiB4ZW5fd3JpdGVfbXNyX3NhZmUoKS4N
Cg0KDQpKdWVyZ2VuDQoNCg==
--------------a260aBg0Ls09sFTk76G8FA3E
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------a260aBg0Ls09sFTk76G8FA3E--

--------------wPzf9BL28ykn4r3lvVOP0IYN--

--------------ZXgyRopxIcxXIhiBQWsnZPH3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJv6fEFAwAAAAAACgkQsN6d1ii/Ey8/
GwgAmV9SgkKFHohukPx14pxszBCCi9KXIDrCNyB7IQmdM1HZVkTdXX+8RnJql1PtS9MaMMNXh0A3
cTthm0PO8t2n06uEcY2+pQYEMIipNJ7FO2QWviJ/lC5XFXr31yyv3vqTsM8yjuWylFZh3kQyILC5
r+EKbaKTQSfBXicP//PU4Rmkr8n+sZZtnplqOrE1W7CQrzUPO++vnpVR1XRLSnzSGq8B+OgzW4wu
51zXsqGF/LbfF4igFNxq4u8hlfsE4SkvFEIs0YsHtAtGHFangT1ec9F0cahf/wN3YoxUIsTfBeE3
bOPhGfa83+VQTVtfXYwvXYPar1ZOzlXmHZtZSqoJXg==
=THs8
-----END PGP SIGNATURE-----

--------------ZXgyRopxIcxXIhiBQWsnZPH3--

