Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uuNQFAnZK2o9GQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371E66788D3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=EH3mGGo7;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336491.1598322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhm-0004Ey-1l; Fri, 12 Jun 2026 10:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336491.1598322; Fri, 12 Jun 2026 10:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhl-00046R-ST; Fri, 12 Jun 2026 10:01:37 +0000
Received: by outflank-mailman (input) for mailman id 1336491;
 Fri, 12 Jun 2026 10:01:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb479bcc000701b@swg.vates.tech>)
 id 1wXyhk-0003wZ-1M
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:01:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyhj-009Pmd-EL
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:01:35 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb479bcc000701b@swg.vates.tech>)
 id 6a2bd8fc-e002-0a2a0a5209dd-0a2a45029048-12
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:35 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb479bcc000701b@swg.vates.tech>)
 id 6a2bd8fe-af86-0a2a45020019-b9ff1c129983-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb479bcc000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:32 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3E4B486445;
 Fri, 12 Jun 2026 12:01:32 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=7kn4izYLM5TPI406y1etZXXdjeRMXR1lvnRPOBi8rt8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=EH3mGGo7TKAJzL52iLMAuL2sr9n1oic/4PnjkYNB2weR6QZOi1sLgVK0uwt7FcmRJsEIsJBQh
 RA/dllpEfvHbhTPre23C2kXILFjL3gCn97HVINsGezWaKwjxrzJWYIibJzgsB8ekHALvZe7uTqk
 cuAm3Hp8m4s1XycyAuFNqFFz63sXZBTVTmHx7DmICh3m+flV/SBGeSmClsQCYGD0qtE+0ksuYwN
 +3fCEV43Jmo5z9s5Zt2/eiWcQ3TyWr5kv7vndVAPQ2vtoTT9RRZfoMa2CCkFsbHygFscDUi4DFA
 mbG6LxJ1cWIn7xIdxezcIl61nDtEq4VFRh9cXDmb4iaQ==
X-Zone-Loop: 5a7abf72ed825c83a92ddeb7ebc03c5ae74242f366ce
x-campaign-type: default
x-transaction-id: 60ce2aa9-5b5e-4ca5-8908-23a86b8e2dd8
x-swg-uid: 01-d11fd5b7-7f01-4816-8d44-9f6573c6c748
X-Mailer: Sweego
Message-ID:
 <1781258492.8631fc262581453bbf619ec5b2062170.19ebb479bcc000701b@vates.tech>
x-swg-bid: 1781258492.8631fc262581453bbf619ec5b2062170.19ebb479bcc000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 07/17] hvmloader: add basic Q35 support
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-8-thierry.escande@vates.tech>
 <06f93b9e-e70e-4c92-92c8-e7835103356d@suse.com>
Content-Language: en-US
In-Reply-To: <06f93b9e-e70e-4c92-92c8-e7835103356d@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a0.7a645b1dcb44a629.19ebb479a49.9a0e7e05a3717bba=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258492489
X-purgate-ID: tlsNG-720697/1781258495-8336C161-7F235561/0/0
X-purgate-type: clean
X-purgate-size: 1060
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 371E66788D3

---=Part.a0.7a645b1dcb44a629.19ebb479a49.9a0e7e05a3717bba=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 5/4/26 16:54, Jan Beulich wrote:
> On 13=2E03=2E2026 17:35, Thierry Escande wrote:
>> @@ -209,7 +225,16 @@ void pci_setup(void)
>>      {
>>          do { isa_irq =3D (isa_irq + 1) & 15;
>>          } while ( !(PCI_ISA_IRQ_MASK & (1U << isa_irq)) );
>> -        pci_writeb(PCI_ISA_DEVFN, 0x60 + link, isa_irq);
>> +
>> +        if ( is_running_on_q35 )
>> +        {
>> +            pci_writeb(PCI_ICH9_LPC_DEVFN, 0x60 + link, isa_irq);
>> +        }
>> +        else
>> +        {
>> +            pci_writeb(PCI_ISA_DEVFN, 0x60 + link, isa_irq);
>> +        }
>=20
> Nit: Easier to read imo without the figure braces=2E

I'll rework that part and use a isa_devfn variable instead=2E

Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.a0.7a645b1dcb44a629.19ebb479a49.9a0e7e05a3717bba=---

