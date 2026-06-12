Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B/2zMynZK2pkGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8C678907
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:02:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=sKNhIuaT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336523.1598397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyiJ-00081v-Gk; Fri, 12 Jun 2026 10:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336523.1598397; Fri, 12 Jun 2026 10:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyiJ-0007zD-Da; Fri, 12 Jun 2026 10:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1336523;
 Fri, 12 Jun 2026 10:02:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb481d12000701b@swg.vates.tech>)
 id 1wXyiG-0007eS-R6
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:02:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyiG-009Pwl-7Q
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:02:08 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb481d12000701b@swg.vates.tech>)
 id 6a2bd91a-e002-0a2a0a5209dd-0a2a450792a6-30
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:02:08 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb481d12000701b@swg.vates.tech>)
 id 6a2bd91f-229c-0a2a45070019-b9ff1c128a33-4
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:02:08 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb481d12000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:02:05 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6CB5986509;
 Fri, 12 Jun 2026 12:02:05 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=/ila6Mpkc37xbjHmyzBdClnckyftmYk9p+r0lCQR5L8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=sKNhIuaTH1Du1eJLqAy67KZm5lH4kSuqVaD+1eroCHvRe0Xpl2MVDN3VCYoWZTnLzvEStdWKM
 pM3dRYYaHFNRJg6Auv1R2Uy5oxte1Omw49B2+CW+hU6JsSy4QBDbbI7pPTx21Vy291gHPjXUOGM
 nusN05YE69uhBnnhC6kM9jJrHrZyRWwV/XDmHxE9A6p2Dz/Omey9sN6uRIqZi6FQbDQGjSsfE2T
 0KDjVw51bEZu+09VFQn96vFUTUzQqmYS6UJOub0HvdUu3L9YgjtQ115Jp8dk6kQevG34+qdchh2
 /J+6utJ3psqm26qUIk3NCjgfPc5Whyup5NpSjzjHkItg==
X-Zone-Loop: a28fad3bb6c9da989ba9f5982a6f3e5ea6a6cd64a137
x-campaign-type: default
x-transaction-id: db2a5d12-7d4b-41d8-b119-904d9a5e70e8
x-swg-uid: 01-c3ae977d-1454-4430-901b-e41ed3fda3b6
X-Mailer: Sweego
Message-ID:
 <1781258526.8631fc262581453bbf619ec5b2062170.19ebb481d12000701b@vates.tech>
x-swg-bid: 1781258526.8631fc262581453bbf619ec5b2062170.19ebb481d12000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 15/17] hvmloader: Set MCFG in ACPI table
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-16-thierry.escande@vates.tech>
 <afH6hfPLzCVUoXbR@macbook.local>
Content-Language: en-US
In-Reply-To: <afH6hfPLzCVUoXbR@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a8.17fcdc806b3d97dd.19ebb481b97.973304fa3abd1317=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258525591
X-purgate-ID: tlsNG-ef75cf/1781258528-21D6FC48-7F94FD9E/0/0
X-purgate-type: clean
X-purgate-size: 2185
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_MUA_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	DKIM_TRACE(0.00)[vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97B8C678907

---=Part.a8.17fcdc806b3d97dd.19ebb481b97.973304fa3abd1317=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 4/29/26 14:33, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 13, 2026 at 04:35:05PM +0000, Thierry Escande wrote:
>> This patch extends hvmloader_acpi_build_tables() to detect if MMCONFIG
>> is available by obtaining its base address and size from the hypercall
>> HVMOP_get_ecam_space and sets the flag ACPI_HAS_MCFG in the ACPI config
>> if needed=2E
>>
>> This also sets the MMCONFIG area in E820 map using the same method=2E
>>
>> Signed-off-by: Thierry Escande <thierry=2Eescande@vates=2Etech>
>> ---
>>  tools/firmware/hvmloader/e820=2Ec | 11 +++++++++++
>>  tools/firmware/hvmloader/util=2Ec |  9 +++++++++
>>  2 files changed, 20 insertions(+)
>>
>> diff --git a/tools/firmware/hvmloader/e820=2Ec b/tools/firmware/hvmload=
er/e820=2Ec
>> index 86d39544e8=2E=2Eff5c270f57 100644
>> --- a/tools/firmware/hvmloader/e820=2Ec
>> +++ b/tools/firmware/hvmloader/e820=2Ec
>> @@ -158,6 +158,8 @@ int build_e820_table(struct e820entry *e820,
>>      unsigned long acpi_mem_end =3D acpi_enabled ?
>>          ACPI_MEMORY_DYNAMIC_START + (acpi_pages_allocated() << PAGE_SH=
IFT) :
>>          RESERVED_MEMBASE;
>> +    uint64_t mmconfig_addr;
>> +    uint32_t mmconfig_size;
>> =20
>>      if ( !lowmem_reserved_base )
>>              lowmem_reserved_base =3D 0xA0000;
>> @@ -260,6 +262,15 @@ int build_e820_table(struct e820entry *e820,
>>          nr++;
>>      }
>> =20
>> +    /* mark MMCONFIG area */
>> +    if ( ! hvm_get_ecam_space(&mmconfig_addr, &mmconfig_size) )
>              ^ extra space
>=20
> However, having to query the hypervisor for something that has been
> set by hvmloader itself seems very inefficient=2E  Just store the values
> in global variables so they can be consumed from here?

Indeed=2E And that would remove the need for the hvm_get_ecam_space() help=
er=2E

Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.a8.17fcdc806b3d97dd.19ebb481b97.973304fa3abd1317=---

