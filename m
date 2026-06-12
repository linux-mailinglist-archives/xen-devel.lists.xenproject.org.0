Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R6IVDTLZK2pqGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FAA678919
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=nH36V0PF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336527.1598407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyiN-0000Ah-St; Fri, 12 Jun 2026 10:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336527.1598407; Fri, 12 Jun 2026 10:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyiN-00005W-Os; Fri, 12 Jun 2026 10:02:15 +0000
Received: by outflank-mailman (input) for mailman id 1336527;
 Fri, 12 Jun 2026 10:02:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb4828f4000701b@swg.vates.tech>)
 id 1wXyiM-0008RO-It
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:02:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyiL-00FboO-Vj
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:02:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb4828f4000701b@swg.vates.tech>)
 id 6a2bd922-e002-0a2a0a5209dd-0a2a4502a06c-18
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:02:13 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb4828f4000701b@swg.vates.tech>)
 id 6a2bd925-af86-0a2a45020019-b9ff1c129c31-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:02:13 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb4828f4000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:02:09 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 57ECA8617A;
 Fri, 12 Jun 2026 12:02:08 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=/TQZPATJCB9Ma+jK5KCy18g45RoTZ80CZIYEKUyMJqM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=nH36V0PFcmM94iXFvyFeNHwUtV9qhJyVr+Kuwuh6ukoZ7UCBc+/x5bCK3aYaVTSy6W49aGZhA
 yk0FU6oGPEM3rfy2mbXfLPeXIufIjwOM3voJf5zLaan85TKWOs0bqi0Uqg0T/JnzW4pbKuxvqnw
 wdc+eIX57LGWMe1ElUGu1qiICArWZCJQjlEy4Jgx/AQThTsdPrFSC0w3G8YSTOxfVt/kZDd10Q2
 OcfPQOnqybEiCjP0n/PRaxVu/kUVt/eNZ18jTbspXWkzzX7oWzwUJvvZCd2gUbuUGvZHUE16wKr
 Xl4HkYL/ndRw0Bfy3EHrFsqWgKtP/un6e9Eo5mBaee7Q==
X-Zone-Loop: cdec807dd83b4d1d515292ac3a57243ff27dfa6a9add
x-campaign-type: default
x-transaction-id: 06aa0a67-7bfc-43ae-af20-caabcf78e132
x-swg-uid: 01-cdbe0e8b-b7f7-4171-8eac-f339f7cc38ec
X-Mailer: Sweego
Message-ID:
 <1781258529.8631fc262581453bbf619ec5b2062170.19ebb4828f4000701b@vates.tech>
x-swg-bid: 1781258529.8631fc262581453bbf619ec5b2062170.19ebb4828f4000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:02:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 16/17] Handle PCIe ECAM space access from guests
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-17-thierry.escande@vates.tech>
 <afH8qwKo1z236QbI@macbook.local>
Content-Language: en-US
In-Reply-To: <afH8qwKo1z236QbI@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a9.f0f32552c5396f53.19ebb482718.3bee6af9abf4df51=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258528536
X-purgate-ID: tlsNG-720697/1781258533-AA969161-ED089E53/0/0
X-purgate-type: clean
X-purgate-size: 3004
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8FAA678919

---=Part.a9.f0f32552c5396f53.19ebb482718.3bee6af9abf4df51=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 4/29/26 14:42, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 13, 2026 at 04:35:05PM +0000, Thierry Escande wrote:
>> This patch adds the logic to decode MMIO-based PCIe ECAM accesses=2E If
>> the IOREQ_TYPE_COPY request is within the ECAM address space configured
>> by hvmloader, the ioreq type is set to XEN_DMOP_IO_RANGE_PCI and the
>> sbdf decoded from the accessed address=2E
>>
>> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
>> ---
>>  xen/arch/x86/hvm/ioreq=2Ec | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/xen/arch/x86/hvm/ioreq=2Ec b/xen/arch/x86/hvm/ioreq=2Ec
>> index a5fa97e149=2E=2E022fe05222 100644
>> --- a/xen/arch/x86/hvm/ioreq=2Ec
>> +++ b/xen/arch/x86/hvm/ioreq=2Ec
>> @@ -268,6 +268,8 @@ bool arch_ioreq_server_get_type_addr(const struct d=
omain *d,
>>                                       uint64_t *addr)
>>  {
>>      unsigned int cf8 =3D d->arch=2Ehvm=2Epci_cf8;
>> +    unsigned long mmio_start =3D (p->type =3D=3D IOREQ_TYPE_COPY) ?
>> +                                ioreq_mmio_first_byte(p) : 0;
>> =20
>>      if ( p->type !=3D IOREQ_TYPE_COPY && p->type !=3D IOREQ_TYPE_PIO )
>>          return false;
>> @@ -298,6 +300,19 @@ bool arch_ioreq_server_get_type_addr(const struct =
domain *d,
>>                  *addr |=3D CF8_ADDR_HI(cf8);
>>          }
>>      }
>> +    else if ( p->type =3D=3D IOREQ_TYPE_COPY &&
>> +              (mmio_start >=3D d->arch=2Eecam_addr &&
>> +               mmio_start < (d->arch=2Eecam_addr + d->arch=2Eecam_size=
)) )
>> +    {
>> +        pci_sbdf_t sbdf;
>> +        unsigned int reg =3D mmio_start & ~PAGE_MASK;
>> +
>> +        sbdf=2Ebdf =3D  (((mmio_start - d->arch=2Eecam_addr) & 0x0ffff=
000) >> 12);
>> +        sbdf=2Eseg =3D 0;
>> +
>> +        *type =3D XEN_DMOP_IO_RANGE_PCI;
>> +        *addr =3D ((uint64_t)sbdf=2Esbdf << 32) | reg;
>=20
> The trapping & decoding here should better re-use the logic in the
> vpci_mmcfg* handlers in x86/hvm/io=2Ec=2E  You might want to gate the ca=
ll
> to register_mmio_handler() to the domain having vPCI, so that
> otherwise it will be handled by the IOREQ catch-all=2E  It's a bit
> hacky, but we already know that vPCI and IOREQs don't play well, and
> it needs solving properly=2E  Again I don't want to force you having to
> do that just to get q35 merged=2E  But we should at least aim to not
> duplicate the data in the domain structures=2E

I missed that part about vPCI and HVM=2E AFAIR it was not possible to use
vPCI for HVM domains=2E I'll take a deeper look and see if that mmcfg
handling could be reused=2E

Regards,



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.a9.f0f32552c5396f53.19ebb482718.3bee6af9abf4df51=---

