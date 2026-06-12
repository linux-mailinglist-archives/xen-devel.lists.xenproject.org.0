Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7LabHA3ZK2pGGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DE06788DB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=NPUesJd2;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336498.1598339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhr-0004x4-KQ; Fri, 12 Jun 2026 10:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336498.1598339; Fri, 12 Jun 2026 10:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhr-0004qz-H6; Fri, 12 Jun 2026 10:01:43 +0000
Received: by outflank-mailman (input) for mailman id 1336498;
 Fri, 12 Jun 2026 10:01:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47b702000701b@swg.vates.tech>)
 id 1wXyhq-0004jM-2t
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:01:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyhp-00Fbg3-Fc
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:01:41 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47b702000701b@swg.vates.tech>)
 id 6a2bd8f8-2eae-0a2a0a5409dd-0a2a4506892e-42
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:41 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb47b702000701b@swg.vates.tech>)
 id 6a2bd905-7371-0a2a45060019-b9ff1c12b475-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:41 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb47b702000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:39 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4F6C48617A;
 Fri, 12 Jun 2026 12:01:39 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=iyqV7sqDR7LzSU36oOFn5veRc9F3+bilWuuOxQgljyE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=NPUesJd2ehYAmLRCSTMj7cpw6THk5bjX2tOPEGbPgkDee03q9wBNtcvwtvDDzBPN7UxXwqL9V
 6FmiFbhVP59f05mOEFVEWyIHLMQQE82LKHM5as7BSgZtCqnMwc9IJqjzBMsw39P0vK4Szt1+gu+
 5RQkgudLhNZi4spgOqcIeTpAUbD7+hzxhBBuYGmkuSWwKJNd/i5IuYxLnxWE3d51snYVfyldwL4
 1pT0ZI9y5EpwAxE+grcyHA4Z8vsYOI8+HQ+7VU7LqB2Te6pFQAazez17IGZqD6nH1Qegz3NlA1a
 5oQpg6IopXI4YVV8B0g03E8TsdgRHTxxHa8o85XMDaiw==
X-Zone-Loop: ca077d2b26e54d74b8defbf40bf9194927c336cfe1e7
x-campaign-type: default
x-transaction-id: 13779a89-ce63-494c-84ec-5cb15bdf036f
x-swg-uid: 01-54144457-b4f5-43cd-bb71-f6c771dbd3f5
X-Mailer: Sweego
Message-ID:
 <1781258499.8631fc262581453bbf619ec5b2062170.19ebb47b702000701b@vates.tech>
x-swg-bid: 1781258499.8631fc262581453bbf619ec5b2062170.19ebb47b702000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 08/17] hvmloader: Extend PCI BAR struct
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-9-thierry.escande@vates.tech>
 <9d2470a7-18a3-43da-838e-85b1981ebc79@suse.com>
Content-Language: en-US
In-Reply-To: <9d2470a7-18a3-43da-838e-85b1981ebc79@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a2.1944d3c4eb74ecad.19ebb47b586.9bf31e2ec0d5d2cf=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258499463
X-purgate-ID: tlsNG-16d1c6/1781258501-84F63D75-33453F2A/0/0
X-purgate-type: clean
X-purgate-size: 1839
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63DE06788DB

---=Part.a2.1944d3c4eb74ecad.19ebb47b586.9bf31e2ec0d5d2cf=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 5/4/26 17:01, Jan Beulich wrote:
> On 13=2E03=2E2026 17:35, Thierry Escande wrote:
>> @@ -176,10 +177,13 @@ void pci_setup(void)
>> =20
>>      /* Create a list of device BARs in descending order of size=2E */
>>      struct bars {
>> -        uint32_t is_64bar;
>>          uint32_t devfn;
>>          uint32_t bar_reg;
>>          uint64_t bar_sz;
>> +        uint64_t addr_mask; /* which bits of the base address can be w=
ritten */
>> +        uint32_t bar_data;  /* initial value - BAR flags here */
>=20
> Nit: Comment style again (also elsewhere)=2E
>=20
>> @@ -278,13 +282,21 @@ void pci_setup(void)
>>                  bar_reg =3D PCI_ROM_ADDRESS;
>> =20
>>              bar_data =3D pci_readl(devfn, bar_reg);
>> +
>> +            is_mem =3D !!(((bar_data & PCI_BASE_ADDRESS_SPACE) =3D=3D
>> +                       PCI_BASE_ADDRESS_SPACE_MEMORY) ||
>> +                       (bar_reg =3D=3D PCI_ROM_ADDRESS));
>=20
> Nit: Indentation (pending open parentheses want to be reflected by extra
> indenting blanks)=2E With, as requested by Roger, is_mem switched to boo=
l,
> the !! also can go away, and with it perhaps one pair of parentheses=2E
>=20
> (I realize pre-existing code further down has similar issues, yet when
> such code is touched - and even more so when new code is added - this
> wants getting right, to aid readability=2E)
>=20

I wanted to keep the changes as small as possible=2E But it's ok for me to
fix that=2E

Regards,



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.a2.1944d3c4eb74ecad.19ebb47b586.9bf31e2ec0d5d2cf=---

