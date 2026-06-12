Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qmt4EuLYK2olGQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C803678883
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 12:01:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=S4AfchkJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336465.1598236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyh2-0000nc-Ti; Fri, 12 Jun 2026 10:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336465.1598236; Fri, 12 Jun 2026 10:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyh2-0000lc-Qa; Fri, 12 Jun 2026 10:00:52 +0000
Received: by outflank-mailman (input) for mailman id 1336465;
 Fri, 12 Jun 2026 10:00:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb46e0b9000701b@swg.vates.tech>)
 id 1wXyh1-0000lW-Kq
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:00:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyh0-00FbNe-TX
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:00:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb46e0b9000701b@swg.vates.tech>)
 id 6a2bd8cd-2eae-0a2a0a5409dd-0a2a450ad9f4-38
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:00:50 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb46e0b9000701b@swg.vates.tech>)
 id 6a2bd8d1-56b3-0a2a450a0019-b9ff1c12992f-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:00:50 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb46e0b9000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:00:44 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1FF5786252;
 Fri, 12 Jun 2026 12:00:44 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=MzqbtulDxGhFht/QAO08vFAefKUWGXbGYF76ycrrhMM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=S4AfchkJ2oxWUgifWvTq7VzhbqcKPWlQEUablgIK6BochNUvp6jIy+/aJLeOk/ciOAz4vPWH2
 kLL1WxNBWkT1HaisPCPJL55Me5FVxY57aiTIQnz/VA9TwU1mNgJgkfbENYlmzhaVwVLlqpQNOH2
 SgZEzpObvpEKFaEaWLaefgYu+U9HuSIvS1So+VRf0eJ+DYTfo7sBPclzfeQYp2/DiwTZJlKA8bN
 omsM2r/aPNfgXgiUSEm7qMi0vjMCIVbsccJAEL8xyIR5UHgyj1eHc1OcjNJQ4gd2q7Tm1VB8ovo
 PzQvEyWK3QU23Fi1Sj1msDbSUCS73necQiJRqrlltSbA==
X-Zone-Loop: 95f17a6fbae412af84b4a1709b6a1d75e3f8ec9a72f1
x-campaign-type: default
x-transaction-id: f581064f-1cce-41de-84af-e1e0a57d490f
x-swg-uid: 01-777db663-d7cd-4049-8511-776a117c9e52
X-Mailer: Sweego
Message-ID:
 <1781258445.8631fc262581453bbf619ec5b2062170.19ebb46e0b9000701b@vates.tech>
x-swg-bid: 1781258445.8631fc262581453bbf619ec5b2062170.19ebb46e0b9000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 00/17] Q35 initial support for HVM guests
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <afBmWSFsyrwy_Ru1@macbook.local>
Content-Language: en-US
In-Reply-To: <afBmWSFsyrwy_Ru1@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.8f.5d01169edc465011.19ebb46ddf5.470525d403f36299=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258444282
X-purgate-ID: tlsNG-4011c0/1781258450-7FD788B7-8DA7A02C/0/0
X-purgate-type: clean
X-purgate-size: 3905
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C803678883

---=Part.8f.5d01169edc465011.19ebb46ddf5.470525d403f36299=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 4/28/26 09:48, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
>> This series introduces initial Q35 chipset support for HVM guests, base=
d on the
>> patchset at [1] by Alexey Gerasimenko=2E
>>
>> Basic support means that this patchset allows to start an HVM guest tha=
t
>> emulates a Q35 chipset via Qemu and implements access to PCIe extended
>> configuration space for such devices emulated by Qemu=2E
>>
>> Support for PCIe device passthrough is not implemented yet=2E This is p=
lanned but
>> implies modifications in the hypervisor and the firmwares, mainly for t=
he
>> support of multiple PCI buses=2E
>=20
> Why do you need multi bus support to expose PCIe capabilities?  I'm
> not seeing the relation between those two=2E  You could still expose a
> single bus on the MCFG table=2E

I should have explained further but the main reason is that Q35 doesn't
support device hot-plug on its main root bus, which is how toolstacks
are doing device pass-through=2E This needs another PCI root port to
connect pass-through'd devices to and here begin the problems=2E The new
root complex attached to Qemu is not seen as a secondary bus before the
devices are hot-plugged and are simply ignored by the toolstack=2E And
even by hacking around to get the devices plugged, Xen doesn't expose
them to the guest because it's not on PCI bus #0=2E
But instead of adding support for multiple PCIe buses, the solution
could be to not use Qemu hot-plug mechanism but rather attach
passthrough'd devices using Qemu command line option -device=2E A patchset
as been sent the the ML for that=2E See [1]=2E

>=20
>> In order to create a Q35 guest, a new domain config option has been add=
ed,
>> named 'device_model_machine'=2E Possible values are:
>> - "i440" - i440 emulation (default)
>> - "q35"  - emulate a Q35 machine
>>
>> If the option is omitted it defaults to "i440", not impacting existing =
domain
>> configuration files=2E
>>
>> DSDT files for Q35 and i440 are largely similar so the existing file ds=
dt=2Easl
>> has been split with i440 and q35 specific parts put in seperated files=
=2E
>>
>> The PCIe MMCONFIG area is configured by hvmloader and its base address =
and size
>> are set in Xen using a new pair of hypercalls HVMOP_get|set_ecam_space=
=2E
>=20
> I guess I will see how that looks like in the series, but the setting
> of the ECAM region would better be done by the toolstack=2E  Setting it
> in hvmloader is possibly not the best placement, because it doesn't
> run for PVH guests (and we will want ECAM support for PVH at some
> point), and there's also a vague plan/intention to get rid of
> hvmloader even for HVM guests eventually=2E

Since hvmloader is taking care of the bars array arrangements, that
sounds to be the most convenient place to configure the mmconfig entry=2E
All that logic would be moved to the toolstack with the hvmloader
removal plan=2E

I tried to have the toolstack to fix the base address of the ECAM region
but then that breaks the logic of hvmloader PCI setup for BARs
arrangement=2E As you suggested (or Jan), we could state that the ECAM
region must be placed first in the MMIO hole and the toolstack would
just have to indicate that we want an ECAM region, with hvmloader
placing it first and with the smallest possible size (as there's only 1
bus)=2E

Regards,
Thierry

[1]
https://lore=2Ekernel=2Eorg/xen-devel/1776955586=2E8631fc262581453bbf619ec=
5b2062170=2E19dbace7684000f373@vates=2Etech/

Regards,



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.8f.5d01169edc465011.19ebb46ddf5.470525d403f36299=---

