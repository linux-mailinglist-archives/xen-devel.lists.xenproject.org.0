Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lO0MF+PYK2onGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12895678889
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b="TKx/1isS";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336467.1598254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhA-0001GD-FJ; Fri, 12 Jun 2026 10:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336467.1598254; Fri, 12 Jun 2026 10:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhA-0001EH-BC; Fri, 12 Jun 2026 10:01:00 +0000
Received: by outflank-mailman (input) for mailman id 1336467;
 Fri, 12 Jun 2026 10:00:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb471013000701b@swg.vates.tech>)
 id 1wXyh9-0001DD-2L
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:00:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyh8-001Vrs-F9
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:00:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb471013000701b@swg.vates.tech>)
 id 6a2bd8d4-bab6-0a2a0a5309dd-0a2a450ad9fa-36
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:00:58 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb471013000701b@swg.vates.tech>)
 id 6a2bd8d1-56b3-0a2a450a0019-b9ff1c12992f-5
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:00:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb471013000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:00:57 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 645AE81A5D;
 Fri, 12 Jun 2026 12:00:56 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=nNoIB27OwXyDmxOhJFmt9rR7vWtFTvJTJU44Vm24r/k=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=TKx/1isSEmXCAtQ357Q+5EUAGQbuh26NqQz2o226LVv0nQMrWkWDI8DioIbF3INkT1cvix0XJ
 FF4ITab2ot1CoPb+GyHyNb3d9F2igGfK4+oGxaZTDiPBZu034zLY7bkQ2GZ3O80vFQXg5HQMa+O
 2GnbCLLB1e/cGa+ROUCjVL1bPJlzQJ1ebP037f2ZoV0D1+B8VOwkuotPvXWUoT4AQ6w4XkeYQ5A
 Zd45uP+8vXLvWYS3REZhj5km9vg2oqiwVuk2DXbVZtTXaDs8QEsggGYMTBneYr/c2HRDGgLu5S9
 CSwyLcGoMLUnJdCiKn8COdWPK4yEIY4qd9ZjyjdIjESQ==
X-Zone-Loop: ff2f3ab2887a1598d2253fc316b99278d89266570d1f
x-campaign-type: default
x-transaction-id: 8c197ce9-526f-4c5d-a799-37a1033de9f2
x-swg-uid: 01-ce86c688-cb0c-4fb8-acbf-3250d2914ecf
X-Mailer: Sweego
Message-ID:
 <1781258457.8631fc262581453bbf619ec5b2062170.19ebb471013000701b@vates.tech>
x-swg-bid: 1781258457.8631fc262581453bbf619ec5b2062170.19ebb471013000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 01/17] libacpi: Split dsdt.asl file and extract i440
 specific parts
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-2-thierry.escande@vates.tech>
 <58d73d7e-49e8-4bcb-ad6b-ba92dbf0ce0d@suse.com>
 <904df363-2f46-40fa-be05-7c1998b98c17@suse.com>
Content-Language: en-US
In-Reply-To: <904df363-2f46-40fa-be05-7c1998b98c17@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.93.c17785933ee4e986.19ebb470dbc.c0905764df607827=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258456508
X-purgate-ID: tlsNG-4011c0/1781258458-7E78F8B7-99FD6747/0/0
X-purgate-type: clean
X-purgate-size: 1179
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12895678889

---=Part.93.c17785933ee4e986.19ebb470dbc.c0905764df607827=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 5/4/26 16:35, Jan Beulich wrote:
> On 04=2E05=2E2026 16:34, Jan Beulich wrote:
>> On 13=2E03=2E2026 17:35, Thierry Escande wrote:
>>> --- a/tools/firmware/hvmloader/Makefile
>>> +++ b/tools/firmware/hvmloader/Makefile
>>> @@ -78,7 +78,7 @@ rombios=2Eo: roms=2Einc
>>>  smbios=2Eo: CFLAGS +=3D -D__SMBIOS_DATE__=3D"\"$(SMBIOS_REL_DATE)\""
>>> =20
>>>  ACPI_PATH =3D =2E=2E/=2E=2E/libacpi
>>> -DSDT_FILES +=3D dsdt_anycpu_qemu_xen=2Ec
>>> +DSDT_FILES +=3D dsdt_i440_anycpu_qemu_xen=2Ec
>>
>> Instead of merely adding the i440 infix, could we perhaps replace the a=
nycpu
>> one (which doesn't serve any purpose here anymore, afaics)?
>=20
> Thinking about it, qemu and xen perhaps fall into the same category, and=
 could
> perhaps also be dropped=2E

I'll do this in a separate patchset if that's ok=2E

Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.93.c17785933ee4e986.19ebb470dbc.c0905764df607827=---

