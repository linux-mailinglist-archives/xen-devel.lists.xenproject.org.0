Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM1hGRay2Gk8hAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 10:17:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4593D3E39
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 10:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278451.1563278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB72Q-0002oV-QY; Fri, 10 Apr 2026 08:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278451.1563278; Fri, 10 Apr 2026 08:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB72Q-0002mn-Np; Fri, 10 Apr 2026 08:16:26 +0000
Received: by outflank-mailman (input) for mailman id 1278451;
 Fri, 10 Apr 2026 08:16:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d8b1d6.v1-5a7d847fa67b46e4afbeb5fbdefc1df7@bounce.vates.tech>)
 id 1wB72P-0002mR-8q
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 08:16:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB72O-00EoTW-Ky
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:16:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d8b1d6.v1-5a7d847fa67b46e4afbeb5fbdefc1df7@bounce.vates.tech>)
 id 69d8b1cc-e002-0a2a0a5209dd-0a2a4502d3be-44
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 10:16:24 +0200
Received: from [198.2.187.14] (helo=mail187-14.suw11.mandrillapp.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d8b1d6.v1-5a7d847fa67b46e4afbeb5fbdefc1df7@bounce.vates.tech>)
 id 69d8b1d7-42fa-0a2a45020019-c602bb0e96fa-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 10:16:24 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fsV4l0BDGz8XS3yB
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:16:23 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5a7d847fa67b46e4afbeb5fbdefc1df7; Fri, 10 Apr 2026 08:16:22 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="thierry.escande@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775808983; x=1776078983;
	bh=ONfxNDiXYC98hlXu/atW+mLoY8BTnDa/ULY8H6DvHW0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VOv7EPHi8MaWZkoFyDFlMhlUABQGxvolujowi0c2XmN+BcZjr+kdj83+vyYhW2J8/
	 A0jg8JceNyvTDrhtuOlz/LG4scLt/uk6eJO/MjoKWIeeyyp86tSbAaCzUsI2K2lzNw
	 XEiu7Gf/4HUGRlj+w6pFK1ImapK5n3w6N2kRN//0Kz/1DmlKfK0dRPbSbJkiUyRwXG
	 4gAXb4p+HUKz8Ih8a+IrWoIpXZ2OYsS4DW/prnas6+VgmAnyOdV4XCypefGxArwff1
	 7SdYUI+pNrC87FYV5Iufkbuhmx3ZXXJ9TuZ5K3h1pLJ3t8Rrd3d0KISBSwsPXG6Ihl
	 k1dQLshfpM56g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775808983; x=1776069483; i=thierry.escande@vates.tech;
	bh=ONfxNDiXYC98hlXu/atW+mLoY8BTnDa/ULY8H6DvHW0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OTErO7Cv8b/R/QK1XJPs3PPPX4Rnl6L+1ngLhVZWNuVDFm7nBsnEjSYrqtT57A84W
	 mPvQBcYVcEh1EvGHRmussML2YQCTdbmsVA5hlW2y8EvTdhvbIJSzToXJdUNFJcH7Ak
	 a/ZYjwXGeJhJR+FNcQkGlzTgpdJwahP92IDjHssCFmjOomzXrREmotz3Es5HAtK5Y6
	 vvxyv9KGmsZChRIDRd5TpA7irxIqSApengCu3fQLQqPpzyQDKtcVSdCXWsejOO7d4I
	 /MV1ONsBkR8oy/k9tmpI+y4D5HWRHYSFM2FIWza3/Tu482VMjIKREBnuCUmP4wPwQx
	 bKDn9plJEzWKg==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20v2=200/3]=20xl:=20Allow=20PCI=20devices=20to=20be=20passthrough'd=20via=20Qemu=20command=20line?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775808981974
Message-Id: <a0625b73-f5f2-4526-891a-60efad726cd2@vates.tech>
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P.=20Berrang=C3=A9?=" <berrange@redhat.com>
References: <20260409162000.1102680-1-thierry.escande@vates.tech> <adhKlLvMB6PCRhwQ@mail-itl>
In-Reply-To: <adhKlLvMB6PCRhwQ@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5a7d847fa67b46e4afbeb5fbdefc1df7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260410:md
Date: Fri, 10 Apr 2026 08:16:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1775808984-AE33BCD1-C5EB6E18/0/0
X-purgate-type: clean
X-purgate-size: 2310
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.979];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CA4593D3E39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/10/26 02:55, Marek Marczykowski-G=C3=B3recki wrote:
> On Thu, Apr 09, 2026 at 04:20:57PM +0000, Thierry Escande wrote:
>> This series adds support for a new 'hotplug' option for PCI devices to b=
e
>> passthrough'd to guests.
>>
>> The current mechanism for device passthrough uses QMP device_add command
>> to hot-plug PCI devices to the guest Qemu instance. This is an issue for
>> guests running on Q35 chipset (preliminary support posted at [1]) since =
the
>> Q35 PCI root bus does not support hotplug. Devices could be hotplugged t=
o
>> a secondary PCI bus but Xen only support 1 PCI bus for now.
>>
>> The 'hotplug' option allows to control how devices are attached to the
>> guest, either by using the legacy QMP mechanism (this is the default) or=
 by
>> passing it directly to the Qemu command line using xen-pci-passthrough
>> device.
>>
>> Example usage in cfg file:
>>  pci =3D [ "00:03.0,seize=3D1,hotplug=3D0" ]
>>
>> Since Qemu -device option accepts parameters in json format, this
>> patchset adds a new internal function libxl__device_pci_get_qmp_json() t=
hat
>> generates the device json object used for both QMP hotplug and command l=
ine
>> passing.
>> Also, the function libxl_pci_assignable() is made available from libxl.h
>> for access in libxl_dm.c. I don't know if it's ok to make it public or i=
f
>> it should stay private. Maybe it should be renamed as
>> libxl_device_pci_assignable() to match the other PCI device APIs.
>>
>> This has been successfully tested on Xen 4.22-dev and Qemu 10.0 running
>> Debian VMs in both Bios and UEFI mode with a passthrough'd nvme disk.
>> Disabling the hotplug mechanism might be made mandatory for Q35 machines
>> later, once Q35 support is merged upstream.
>>
>> [1] https://lore.kernel.org/xen-devel/20260313163455.790692-1-thierry.es=
cande@vates.tech/
> 
> I don't see relevant device option added to the QEMU cmdline:
> https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/13860278916
> 
My bad. The code that adds the -device option is not in the correct code
block. (bad copy/paste at some point I guess...). v3 on its way.

Regards,
Thierry


--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



