Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21102766C86
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 14:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571452.895328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPMFC-0001Gg-TV; Fri, 28 Jul 2023 12:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571452.895328; Fri, 28 Jul 2023 12:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPMFC-0001DP-QX; Fri, 28 Jul 2023 12:06:54 +0000
Received: by outflank-mailman (input) for mailman id 571452;
 Fri, 28 Jul 2023 12:06:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qPMFB-0001DJ-Eg
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 12:06:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cca7ae8-2d3f-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 14:06:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6A111F891;
 Fri, 28 Jul 2023 12:06:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FFBA13276;
 Fri, 28 Jul 2023 12:06:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DMezIVuvw2RmXAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Jul 2023 12:06:51 +0000
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
X-Inumbo-ID: 3cca7ae8-2d3f-11ee-b24d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690546011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ftMJfa+moxQlGN6VRaaEBcF7IVwypL/T6yrrALOjroA=;
	b=LGgi+9yxHOiZP/kg7JmJcVmKozETTwKWnlDicM5GqW5DPu64kZBz8loL4lev1VsqwiQaxs
	C0VdradZEtI0cAt/xvorMfDHvlEEdFPdWieM+YGV9cm+qgwBh4CcX0BpY8GOSQHe2ovp4/
	aHB1HrUeIPoAo+lGpqOPzCIv+DEBKgs=
Message-ID: <8a5854d1-2594-ed4f-ace8-e21db4fe4c7b@suse.com>
Date: Fri, 28 Jul 2023 14:06:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
 <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
 <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
 <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
 <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
 <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>
 <68acbf84-218b-f2f7-9526-d9e07f845f6e@suse.com>
 <8cea1316-db0b-f29d-c467-6fd5c4a6321c@xen.org>
 <6a376365-a731-2413-16c7-14ede5224eea@suse.com>
 <b8b8e733-6be0-a4d9-33b7-d93366ec0091@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
In-Reply-To: <b8b8e733-6be0-a4d9-33b7-d93366ec0091@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oD1jXEY0AsaaeMfv6kXB9SbF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oD1jXEY0AsaaeMfv6kXB9SbF
Content-Type: multipart/mixed; boundary="------------UYzIy6S1CgJNuVRKQTo40j3v";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <8a5854d1-2594-ed4f-ace8-e21db4fe4c7b@suse.com>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
 <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
 <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
 <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
 <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
 <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>
 <68acbf84-218b-f2f7-9526-d9e07f845f6e@suse.com>
 <8cea1316-db0b-f29d-c467-6fd5c4a6321c@xen.org>
 <6a376365-a731-2413-16c7-14ede5224eea@suse.com>
 <b8b8e733-6be0-a4d9-33b7-d93366ec0091@xen.org>
In-Reply-To: <b8b8e733-6be0-a4d9-33b7-d93366ec0091@xen.org>

--------------UYzIy6S1CgJNuVRKQTo40j3v
Content-Type: multipart/mixed; boundary="------------TbcfaCD87pO6dc0jhHIRE0dz"

--------------TbcfaCD87pO6dc0jhHIRE0dz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDcuMjMgMTM6MTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAy
OC8wNy8yMDIzIDExOjQ3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjguMDcuMjMg
MTI6MzQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBCZWNhdXNlIG9uZSBtYXkgd2FudCBk
b20wIHRvIHNlbmQgcGF5bG9hZCBiaWdnZXIgdGhhbiBYRU5TVE9SRV9QQVlMT0FEX01BWC4g
DQo+Pj4gU29tZXRoaW5nIGxpa2U6DQo+Pj4NCj4+PiBpZiAoIGNvbm4tPmlkICE9IDAgJiYg
bGVuIDwgWEVOU1RPUkVfUEFZTE9BRF9NQVggKQ0KPj4+DQo+Pj4gU3VjaCBjaGFuZ2Ugd291
bGQgbm90IGJlIGNhdWdodCBkdXJpbmcgY29tcGlsYXRpb24uIEFXUyBoYXMgYSBzaW1pbGFy
IGNoZWNrIA0KPj4+IGluIHRoZSBkb3duc3RyZWFtIHRyZWUgYmVjYXVzZSB0aGUgaW1wbGVt
ZW50YXRpb24gb2Ygbm9uLWNvb3BlcmF0aXZlIA0KPj4+IG1pZ3JhdGlvbiBpcyB1c2luZyBY
ZW5zdG9yZSBjb21tYW5kIGFuZCB3ZSB3YW50IHRvIGJlIGFibGUgdG8gdHJhbnNmZXIgdGhl
IA0KPj4+IHN0YXRlIGluIGEgc2luZ2xlIGNvbW1hbmQuDQo+Pg0KPj4gQW5kIGhvdyBkaXJl
Y3RseSBpcyB0aGlzIHJlbGF0ZWQgdG8gdGhlIG1heCBkYXRhIHNpemUgb2Ygbm9kZSBjb250
ZW50cz8NCj4gDQo+IEkgdGhpbmsgeW91IG1pc3NlZCBteSBwb2ludC4gVW50aWwgdGhpcyBw
YXRjaCwgdGhlIGV4aXN0aW5nIGZpZWxkIHdvdWxkIGJlIGFibGUgDQo+IHRvIGFjY29tb2Rh
dGUgdmVyeSBsYXJnZSBwYXlsb2FkLiBUaGlzIGRvZXNuJ3QgaG9sZCBhbnltb3JlLg0KDQpZ
ZXMuIEFuZCB0aGUgZmllbGQgaXMgcmVsYXRlZCB0byBub2RlIGRhdGEgb25seSwgc28gaXQg
c2hvdWxkIGJlIGNoZWNrZWQgdG8NCmJlIGxhcmdlIGVub3VnaCB3aGVyZSBpdCBpcyB3cml0
dGVuLCBhcyB0aGlzIGlzIHRoZSBjcml0aWNhbCBvcGVyYXRpb24gd2hlcmUNCnRydW5jYXRp
b24gd291bGQgaGFwcGVuLg0KDQo+IFdoYXQgSSB3YXMgdHJ5aW5nIHRvIGNvbnZleSBpcyB0
aGF0IGFueW9uZSBsb29raW5nIGF0IHJlbGF4aW5nIHRoZSBjaGVjayBpbiANCj4gaGFuZGxl
X2lucHV0KCkgbmVlZHMgdG8gYmUgYWJsZSB0byBmaW5kICJlYXNpbHkiIHRoYXQgb3RoZXIg
cGFydCBvZiBYZW5zdG9yZWQgDQo+IGFyZSBtYWtpbmcgc29tZSBhc3N1bXB0aW9uIGJhc2Vk
IG9uIHRoZSBtYXhpbXVtIGxlbmd0aC4NCg0KQXMgdGhlIEFXUyBleGFtcGxlIGlzIHNob3dp
bmcsIHRoZSBsaW1pdGF0aW9uIGlzbid0IGluIGhhbmRsZV9pbnB1dCgpLg0KDQpBbmQgVEJI
OiBhbGxvd2luZyBzb21ldGltZXMgYSBwYXlsb2FkIGxhcmdlciB0aGFuIFhFTlNUT1JFX1BB
WUxPQURfTUFYIGlzbid0DQpzb21ldGhpbmcgd2Ugc2hvdWxkIGVuY291cmFnZS4gVGhpcyBp
cyByYXRoZXIgYSB2ZXJ5IGJhZCBkZXNpZ24gZGVjaXNpb24uDQoNCj4gDQo+Pg0KPj4gQXMg
c29vbiBhcyB5b3UgYXJlIGFsbG93aW5nIGRvbTAgdG8gd3JpdGUgbGFyZ2VyIG5vZGVzLCB5
b3UgYXJlIHJpc2tpbmcgdG8NCj4+IGtpbGwgY2xpZW50IGNvbm5lY3Rpb25zIHRyeWluZyB0
byByZWFkIHN1Y2ggYSBub2RlLiBTbyB0aGUgbm9kZSBzaXplIHNob3VsZA0KPj4gc3RpbGwg
YmUgbGltaXRlZCB0byBYRU5TVE9SRV9QQVlMT0FEX01BWC4NCj4+DQo+PiBJTU8gYW5vdGhl
ciByZWFzb24gdG8gdXNlIHRoZSBwbGFjZW1lbnQgSSd2ZSBzdWdnZXN0ZWQuDQo+IA0KPiBJ
IGFncmVlIHRoYXQgQlVJTERfQlVHX09OKCkgbWFrZXMgc2Vuc2Ugd2hlcmUgeW91IHN1Z2dl
c3QgaWYgeW91IHRoaW5rIGFib3V0IA0KPiB3aGVyZSB0aGUgcnVudGltZSBjaGVjayB3b3Vs
ZCBoYXBwZW4uDQoNCkNvcnJlY3QuDQoNCj4gSXQgc2VlbXMgbGlrZSB3ZSBoYXZlIHR3byBk
aWZmZXJlbnQgYWltcyBoZXJlLiBNaW5lIGlzIHRvIG1ha2Ugc3VyZSB3ZSBtYWtlIGl0IA0K
PiBtb3JlIGRpZmZpY3VsdCB0byBpbnRyb2R1Y2UgYSBzZWN1cml0eSBob2xlIGlmIHRoZSBs
ZW5naHQgY2hlY2sgaXMgcmVsYXhlZC4NCg0KV2hpY2ggKGFzIHdyaXR0ZW4gYWJvdmUpIHdv
dWxkIHNldCBhIHZlcnkgYmFkIHByZWNlZGVuY2UuDQoNClhFTlNUT1JFX1BBWUxPQURfTUFY
IHNob3VsZCBiZSBhIGhhcmQgbGltaXQuDQoNCj4gSSBoYXZlIG1hZGUgYSBwcm9wb3NhbCBi
ZWxvdyB0aGF0IG1heSBzdWl0IGJvdGggb3VyIGFpbS4NCj4gDQo+PiBBV1Mgc2hvdWxkIGV2
ZW4gYWRkDQo+PiBhIHNpemUgY2hlY2sgd2hlbiB3cml0aW5nIG5vZGVzIHRvIG1ha2Ugc3Vy
ZSBkb20wIGRvZXNuJ3QgZG8gZXZpbCB0aGluZ3MuDQo+IA0KPiBXaGF0IG1ha2UgeW91IHRo
aW5rIHdlIGRvbid0IGFscmVhZHkgaGF2ZSBzdWNoIGNoZWNrZWQ/IDspDQoNCkp1c3QgYSB3
aWxkIGd1ZXNzLiA6LSkNCg0KPiBBbHNvLCBJIG5vdGljZWQgeW91IG1lbnRpb24gYWJvdXQg
ZGF0YWxlbi4gV2hhdCBhYm91dCB0aGUgbnVtYmVyIG9mIHBlcm1pc3Npb25zPw0KDQpNb3Jl
IHRoYW4gbWF4IG51bWJlciBvZiBkb21haW5zPyBOb3cgdGhpcyB3b3VsZCByZWFsbHkgYmUg
Y3JhenkuIEFuZCBpdCB3b3VsZA0KbmVlZCBvcGVyYXRpb25zIHVzaW5nIG1vcmUgZGF0YSB0
aGFuIFhFTlNUT1JFX1BBWUxPQURfTUFYIGFsbG93cy4gOi0pDQoNCj4+Pj4gSW4gY2FzZSBv
ZiBhIHJ1bnRpbWUgY2hlY2sgSQ0KPj4+PiBhZ3JlZSB0aGF0IGEgbW9yZSBjZW50cmFsIHBs
YWNlIHdvdWxkIGJlIHByZWZlcnJlZC4NCj4+Pj4NCj4+Pj4gSW4gdGhlIGVuZCBJIGRvbid0
IG1pbmQgdGhhdCBtdWNoLCBidXQNCj4+Pj4NCj4+Pj4gwqDCoMKgwqDCoEJVSUxEX0JVR19P
TihYRU5TVE9SRV9QQVlMT0FEX01BWCA+PQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAodHlwZW9mKChzdHJ1Y3Qgbm9kZV9oZHIgKilOVUxMLT5kYXRhbGVuKSkoLTEpKTsN
Cj4+Pj4NCj4+Pj4gaXMgYSBsaXR0bGUgYml0IGNsdW1zeSBJTUhPLg0KPj4+DQo+Pj4gQWdy
ZWUuIFdlIGNvdWxkIGludHJvZHVjZSBGSUVMRF9TSVpFT0YoKSAoYXMgTGludXggZGlkKSB0
byBoaWRlIHRoZSANCj4+PiBjb21wbGV4aXR5LiBUaGUgY29kZSB3b3VsZCB0aGVuIGxvb2sg
bGlrZToNCj4+Pg0KPj4+IMKgPj0gKDggKiBGSUVMRF9TSVpFT0Yoc3RydWN0IG5vZGVfaGRy
LCBkYXRhbGVuKSkNCj4+DQo+PiBPaCwgSSBndWVzcyB5b3UgbWVhbiBzaXplb2ZfZmllbGQo
KS4NCj4+DQo+PiBBbmQgZXZlbiB3aXRoIHRoYXQgaXQgd291bGQgbG9vayBxdWl0ZSBjbHVt
c3k6DQo+Pg0KPj4gwqDCoMKgwqDCoEJVSUxEX0JVR19PTihYRU5TVE9SRV9QQVlMT0FEX01B
WCA+PQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKDFVTCA8PCAoOCAqIHNpemVv
Zl9maWVsZChzdHJ1Y3Qgbm9kZV9oZHIsIGRhdGFsZW4pKSkpOw0KPiANCj4gSG93IGFib3V0
IGtlZXBpbmcgdGhlIEJVSUxEX0JVR19PTigpIGluIHdyaXRlX25vZGVfcmF3KCkgYW5kIGFk
ZCB0aGUgZm9sbG93aW5nIA0KPiBjb21tZW50IG9uIHRvcCBvZiBoYW5kbGVfaW5wdXQoKToN
Cj4gDQo+IFNvbWUgZmllbGRzIGluIFhlbnN0b3JlZCBhcmUgc2l6ZWQgYmFzZWQgb24gdGhl
IG1heCBwYXlsb2FkIChzZWUgdmFyaW91cyANCj4gQlVJTERfQlVHX09OKCkpLiBUaGlzIHdv
dWxkIG5lZWQgZXh0cmEgcnVudGltZSBjaGVjayBpZiB3ZSBldmVyIGRlY2lkZSB0byBoYXZl
IGEgDQo+IGR5bmFtaWMgcGF5bG9hZCBzaXplLg0KDQpJIF9jb3VsZF8gZG8gdGhhdCwgYnV0
IHdoZXJlIHRvIHN0b3AgYWRkaW5nIHN1Y2ggY29tbWVudHM/DQoNClRCSCwgSSByZWFsbHkg
ZG9uJ3Qgc2VlIHRoZSBwb2ludCBkb2luZyB0aGF0Lg0KDQpJbiBjYXNlIGEgcGF0Y2ggY2Ft
ZSB1cCB1cHN0cmVhbSB0cnlpbmcgdG8gdmlvbGF0ZSBYRU5TVE9SRV9QQVlMT0FEX01BWCBJ
IHdvdWxkDQpzdXJlbHkgTkFDSyBpdC4NCg0KSW4gY2FzZSB3ZSBuZWVkIHBheWxvYWRzIGxh
cmdlciB0aGFuIFhFTlNUT1JFX1BBWUxPQURfTUFYIHdlIHNob3VsZCBzcGxpdCB0aGUNCnJl
bGF0ZWQgb3BlcmF0aW9uIGluIG11bHRpcGxlIHBhcnRzIChzZWUgZS5nLiBYU19ESVJFQ1RP
UllfUEFSVCBvciBYU19DT05UUk9MDQpmb3IgdXBsb2FkaW5nIGEgbmV3IGtlcm5lbCB0byBY
ZW5zdG9yZS1zdHViZG9tIGZvciBsaXZlIHVwZGF0ZSkuIFdoaWNoIGlzLCBCVFcsDQp0aGUg
d2F5IEFXUyBzaG91bGQgaGF2ZSBoYW5kbGVkIHRoZSBtaWdyYXRpb24gcHJvYmxlbSAodHJh
bnNhY3Rpb25zIGNvbWUgdG8gbXkNCm1pbmQgaW4gdGhpcyBjb250ZXh0KS4NCg0KDQpKdWVy
Z2VuDQo=
--------------TbcfaCD87pO6dc0jhHIRE0dz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------TbcfaCD87pO6dc0jhHIRE0dz--

--------------UYzIy6S1CgJNuVRKQTo40j3v--

--------------oD1jXEY0AsaaeMfv6kXB9SbF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTDr1oFAwAAAAAACgkQsN6d1ii/Ey95
QQf/aEeHBv9Rrbbog/OSiMDw5pLUTcHoDQ5wJpx7e4vV+wwBa+5c9dgYvnZ/itDspDxwJKYFfEj3
CW4HAQrF9fR1Gvx8hJVH9sHdYebAyNpYOyuNbB5VbOO5akUkUFpzwKtr/Gre+soG/ZOK7FMJZiA6
tvEZP69tRcavNqP2DaBg6uQijZrFGBkNT+nDaTswTa01VjjOXPafnN5GW78mhBgR9CfND5PbqboI
OjSni8WY9ihjs0NT+CUHZvPkHzpCnq0LNkWqPiswI1EkBnDJbGUa1ccPtuM+HvqtaGe5ZHpVlECB
LROALQBimuxXo6vk2MPhuf6GnKjTLYBHWujSzIUByA==
=HoMR
-----END PGP SIGNATURE-----

--------------oD1jXEY0AsaaeMfv6kXB9SbF--

