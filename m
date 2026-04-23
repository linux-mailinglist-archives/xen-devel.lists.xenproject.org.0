Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aN5oFIjL6WkKkgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 09:34:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660F044E02C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 09:34:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291653.1570512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFoZf-0004xd-Mu; Thu, 23 Apr 2026 07:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291653.1570512; Thu, 23 Apr 2026 07:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFoZf-0004uk-K8; Thu, 23 Apr 2026 07:34:11 +0000
Received: by outflank-mailman (input) for mailman id 1291653;
 Thu, 23 Apr 2026 07:34:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db942a614000f373@swg.vates.tech>)
 id 1wFoZd-0004ua-3H
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 07:34:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFoZa-0006ZV-Fy
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 09:34:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db942a614000f373@swg.vates.tech>)
 id 69e9cb67-5cb7-0a2a0a5109dd-0a2a450282e6-46
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:34:07 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db942a614000f373@swg.vates.tech>)
 id 69e9cb6f-af86-0a2a45020019-b9ff1c22836d-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 09:34:07 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19db942a614000f373.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Apr 2026 07:34:06 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5449980C28;
 Thu, 23 Apr 2026 09:34:05 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=iqKyDE4yAoANFonETay2qpP2yXOlRoZkJJFp7OjGNc8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=nrTgpaL7eztkdlCFbQIkY+TPMXTK8uAOekP5rWhRLNasQigDy0USblpXhBZJRRWBSLyKgcR+c
 ff87A9wlcgNGHmL1pv/O40m9siU+aIWxOq1j+ZJH3W+h0Qy9DaqUGY3iwfIZlyfgHy44hCslYru
 IICH7J7CgAY/vGYemcZ8oy0nlDcz5zXXF+hmScMSWIKeG7Z12VqszxCCwENB0qg7GLHKMJO1Xeu
 uJjRWC9TDTrqogbsiqF42w2HRZPSLLB/r1mxe1LauGMU9Rl6hKKJhf19Z5PdiX00uEXwM+93mTr
 lmcqjx8653W+5vzwJ8X83y2TJoP4WJD/CZflwzNGT9pA==
X-Zone-Loop: d3851645cb241673af1114c93b68980cf4cb5268568b
x-campaign-type: default
x-transaction-id: 0bd0b6ba-738f-4205-b0b9-758db9041adf
x-swg-uid: 01-fcc5ed98-0882-498a-90a8-e7fca6a33735
X-Mailer: Sweego
Message-ID:
 <1776929646.8631fc262581453bbf619ec5b2062170.19db942a614000f373@vates.tech>
x-swg-bid: 1776929646.8631fc262581453bbf619ec5b2062170.19db942a614000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 23 Apr 2026 09:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] vtd: Replace macros with bitfield
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <815edfd0db90859a4ce270d833d9d721ff66e31c.1775814143.git.teddy.astie@vates.tech>
 <3182da144d0cb998c9ae897b55285b7e408cd972.1775814143.git.teddy.astie@vates.tech>
 <ec24d32d-9378-4a07-b84d-aaebfd46f517@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <ec24d32d-9378-4a07-b84d-aaebfd46f517@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2641.95305ad117c55529.19db942a372.78ef5b47f81d8135=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776929645426
X-purgate-ID: tlsNG-720697/1776929647-8137C161-C1214151/0/0
X-purgate-type: clean
X-purgate-size: 3044
X-Spamd-Result: default: False [0.81 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 660F044E02C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.2641.95305ad117c55529.19db942a372.78ef5b47f81d8135=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 20/04/2026 =C3=A0 15:54, Jan Beulich a =C3=A9crit=C2=A0:
> On 10=2E04=2E2026 12:09, Teddy Astie wrote:
>> Replace macros with bitfield to allow simplyfing the code and be
>> less error prone when manipulating PTEs=2E
>>
>> It also has the effect of directly exposing the mfn in the pte struct
>> instead of derivating it from the raw pte value using dma_pte_addr()=2E
>>
>> Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
>> ---
>> It allows nicer constructs like
>>
>>    new=2Esnp =3D iommu_snoop;
>>
>> instead of
>>
>>    if ( iommu_snoop )
>>      dma_set_pte_snp(new);
>>
>> A lot of simplifications could be done afterward when switching the
>> logic from maddrs to mfns i=2Ee remove many maddr-mfn conversions=2E
>=20
> There's no real open question here, so it's not quite clear why this is
> marked RFC=2E We did do the same on the AMD side a while back, at least
> partly (I don't think we got all of it converted yet), so doing the
> conversion here surely is a good thing=2E The slightly larger =2E=2E=2E
>=20
>> bloat-o-meter (along with the previous change)
>>
>> add/remove: 0/0 grow/shrink: 7/3 up/down: 227/-45 (182)
>> Function                                     old     new   delta
>> addr_to_dma_page_maddr                       949    1058    +109
>> vtd_dump_page_table_level                    197     233     +36
>> fill_qpt                                    1151    1178     +27
>> print_vtd_entries                            486     504     +18
>> domain_context_mapping_one                  2098    2114     +16
>> intel_iommu_map_page                         909     921     +12
>> intel_iommu_unmap_page                       731     740      +9
>> intel_iommu_lookup_page                      185     176      -9
>> queue_free_pt                                442     425     -17
>> vtd_dump_page_table_level=2Ecold                86      67     -19
>> Total: Before=3D18446744073715636162, After=3D18446744073715636344, chg=
 +0=2E00%
>=20
> =2E=2E=2E code size shouldn't be much of a concern, albeit you may want =
to at
> least mention the (presumed) reason for some of the bigger increases,
> after comparing the generated code=2E
>=20
> (As an aside, the two values after Total: look entirely bogus=2E)
>=20
>> I guess using mfns 'everywhere' would improve the bloat-o-meter picture=
=2E
>=20
> It's not quite clear to me what you mean here=2E
>=20

There are many mfn<->maddr conversions done at various places which can=20
be eliminated=2E I guess some of the "bloat" is coming from there=2E

I may try in another patch to adjust some of the types to make that better=
=2E

> Jan
>=20



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2641.95305ad117c55529.19db942a372.78ef5b47f81d8135=---

