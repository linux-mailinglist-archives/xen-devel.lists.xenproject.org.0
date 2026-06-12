Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ur3pHC/ZK2pnGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595CD67890E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Zq4qqFMq;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336522.1598388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyiI-0007kg-2E; Fri, 12 Jun 2026 10:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336522.1598388; Fri, 12 Jun 2026 10:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyiH-0007ir-UN; Fri, 12 Jun 2026 10:02:09 +0000
Received: by outflank-mailman (input) for mailman id 1336522;
 Fri, 12 Jun 2026 10:02:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb480f1d000701b@swg.vates.tech>)
 id 1wXyiG-0007dn-HS
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:02:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyiF-009Pwl-UD
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:02:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb480f1d000701b@swg.vates.tech>)
 id 6a2bd91a-e002-0a2a0a5209dd-0a2a450792a6-24
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:02:07 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb480f1d000701b@swg.vates.tech>)
 id 6a2bd91f-229c-0a2a45070019-b9ff1c128a33-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:02:07 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb480f1d000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:02:02 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id C3AB886509;
 Fri, 12 Jun 2026 12:02:01 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=UOJ5/EDqTkqXgS4rusJ5hxyyLdfXSt883UpbBodOjm0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Zq4qqFMqQPg9Q0ssfkUfgk/OCpl7FHKs3itUhrmwvsfb+q9ps/JOvlhroOn59fe1dBT/2Rate
 CLcPQGf071nBxHT93aGOyC6IcdYHp6m1hXn0YjOlDN7KLCweaw6RNj0ALvy9qSGiwb8RDo77JJF
 Atq/nyFp5Tft6/ZlwoaVot8BtbfVKbPSLtpJxWc8FJcAYuEg98P/Vq5dhyj/scfHRciTj3q2fI4
 zw8z5e3g1fGhS8vTs3/ngAlKSgOeXF12zN6Fnz8CzC4C1hU6IElMkxEpK93XHYDWToFb3gkP5aW
 nBXjktEgTyBZ/ePSBnouAKg/OloVFPEYdst9cXViWy9g==
X-Zone-Loop: 3768a73e448c586237d9b944000fb38925436364373f
x-campaign-type: default
x-transaction-id: a1b6d9e0-95f8-46b3-9156-46df9b1173c0
x-swg-uid: 01-7e8129f8-05f5-4c68-9c5f-13afcc3e9065
X-Mailer: Sweego
Message-ID:
 <1781258522.8631fc262581453bbf619ec5b2062170.19ebb480f1d000701b@vates.tech>
x-swg-bid: 1781258522.8631fc262581453bbf619ec5b2062170.19ebb480f1d000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 14/17] libacpi: build ACPI MCFG table if requested
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-15-thierry.escande@vates.tech>
 <afHZutWoJGHoKemZ@macbook.local>
Content-Language: en-US
In-Reply-To: <afHZutWoJGHoKemZ@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a7.bcdefbb94d88eba0.19ebb480d91.62d8b4a1b9a8c27f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258522002
X-purgate-ID: tlsNG-ef75cf/1781258527-0BB78C48-C1763A98/0/0
X-purgate-type: clean
X-purgate-size: 2263
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,suse.com,vates.tech,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 595CD67890E

---=Part.a7.bcdefbb94d88eba0.19ebb480d91.62d8b4a1b9a8c27f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 4/29/26 12:13, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 13, 2026 at 04:35:04PM +0000, Thierry Escande wrote:
>> +static struct acpi_10_mcfg *construct_mcfg(struct acpi_ctxt *ctxt,
>> +                                        const struct acpi_config *conf=
ig)
>> +{
>> +    struct acpi_10_mcfg *mcfg;
>> +
>> +    /* Warning: this code expects that we have only one PCI segment */
>=20
> Not only one PCI segment, but just one ECAM region=2E  You could in
> theory have multiple ECAM regions within a single PCI segment=2E

Yes, right=2E AFAIU, Xen guests have only 1 bus within only 1 segment,
with no multiple buses support, hence no multiple segments support, right?

>=20
>> +    mcfg =3D ctxt->mem_ops=2Ealloc(ctxt, sizeof(*mcfg), 16);
>> +    if ( !mcfg )
>> +        return NULL;
>> +
>> +    memset(mcfg, 0, sizeof(*mcfg));
>> +    mcfg->header=2Esignature        =3D ACPI_MCFG_SIGNATURE;
>> +    mcfg->header=2Erevision         =3D ACPI_1_0_MCFG_REVISION;
>> +    mcfg->header=2Ecreator_id       =3D ACPI_CREATOR_ID;
>> +    mcfg->header=2Ecreator_revision =3D ACPI_CREATOR_REVISION;
>> +    mcfg->header=2Elength           =3D sizeof(*mcfg);
>> +    mcfg->header=2Eoem_revision     =3D ACPI_OEM_REVISION;
>> +    fixed_strcpy(mcfg->header=2Eoem_id, ACPI_OEM_ID);
>> +    fixed_strcpy(mcfg->header=2Eoem_table_id, ACPI_OEM_TABLE_ID);
>> +
>> +    mcfg->entries[0]=2Ebase_address      =3D config->mmconfig_addr;
>> +    mcfg->entries[0]=2Epci_segment       =3D 0;
>> +    mcfg->entries[0]=2Estart_pci_bus_num =3D 0;
>> +    mcfg->entries[0]=2Eend_pci_bus_num   =3D
>> +        MCFG_SIZE_TO_NUM_BUSES(config->mmconfig_size) - 1;
>=20
>=20
> You might want to check that mmconfig_addr and mmconfig_size are set
> ahead of using them?  Just in case some bogus toolstack/hvmloader sets
> ACPI_HAS_MCFG without correctly populating the fields?

Makes sense=2E

Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.a7.bcdefbb94d88eba0.19ebb480d91.62d8b4a1b9a8c27f=---

