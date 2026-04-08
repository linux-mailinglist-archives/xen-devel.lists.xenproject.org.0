Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO1XNvsE1mkbAwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 09:34:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3209E3B8583
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 09:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275464.1561277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wANQ8-0006ER-Vx; Wed, 08 Apr 2026 07:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275464.1561277; Wed, 08 Apr 2026 07:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wANQ8-0006Cz-TK; Wed, 08 Apr 2026 07:33:52 +0000
Received: by outflank-mailman (input) for mailman id 1275464;
 Wed, 08 Apr 2026 07:33:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d604dc.v1-f394fed23b2e4ce4865f10734d71a531@bounce.vates.tech>)
 id 1wANQ7-0006Ct-HU
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 07:33:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wANQ6-000yRK-F1
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 09:33:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d604dc.v1-f394fed23b2e4ce4865f10734d71a531@bounce.vates.tech>)
 id 69d604d6-2eae-0a2a0a5409dd-0a2a450a9eae-28
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 09:33:50 +0200
Received: from [198.2.180.46] (helo=mail180-46.suw31.mandrillapp.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d604dc.v1-f394fed23b2e4ce4865f10734d71a531@bounce.vates.tech>)
 id 69d604dc-ee98-0a2a450a0019-c602b42ed8a3-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 09:33:49 +0200
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-46.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4frFDX3KFpz8XS3d2
 for <xen-devel@lists.xenproject.org>; Wed,  8 Apr 2026 07:33:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f394fed23b2e4ce4865f10734d71a531; Wed, 08 Apr 2026 07:33:48 +0000
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
	s=mte1; t=1775633628; x=1775903628;
	bh=lf/7x995PIuMmZC7YZDG2jKn3t9Oc495yOkrRXw8d4M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cAfLHoz+9gelA+wWjlBpE5/+7ZLnszfyOQEwdGb41ArKa/AhC+x4g6dfKobJRrjKJ
	 YrUZ4ylR6PSokkdrxPlOR2xD1NrsqelHwBLyYsrv4GFmL460KJH8wxTMCQQo0Sqjs7
	 0WaxpO7ogofHR1UVmSFucR2N5Cgaix7PQJOprr7wNNRrzS7aanYtzFnw2w1MV0wvyq
	 YCuIn6vPln3WVZFO81jxk4gZuOMBQg3IEDJPT73jC7QXPWERgH/sd32yNNUzBBgL6Y
	 UPvKfLxbN+iM1hv8G6K6A0hzHehDMqxuYwrCmv9EAi7U09UJ09sx5LuE3AiB79MsIX
	 4BtPF+u2htLEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775633628; x=1775894128; i=thierry.escande@vates.tech;
	bh=lf/7x995PIuMmZC7YZDG2jKn3t9Oc495yOkrRXw8d4M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=kgD+GOfVL4hQRh+lUUqs1M6Grgfznzt40ooRn5aKRJRPf+yHks52SAVp6XPUsSR0r
	 ODnWINq2XR8hRcrmC7s0ALaVBwGt3TRawjZIvQTaMzBWwIrxYJUqok+a3rFtXfWF0s
	 qCUM+rU5X6KR0fWow9I6nGcknD1ZtRN2qXv8e3KgxQtPTfyPkpy9xxXTyPXLdrw6vx
	 i1SKDWzFBEznwUJrCQbljhs8A/ziY5wtc5JaYjHyjPkqzrT2TuIOJrd+HQl3E6hn4H
	 rJN9HSEG7G12QqBokWoaDLAekqI8AemO4neWsbfzV/q3rCBWaIiEBzQGopfcTZxcPt
	 W3Drd1rjmk9lQ==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=200/4]=20Xen:=20Add=20Q35=20initial=20support=20for=20HVM=20guests?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775633627298
Message-Id: <7db25729-b4ab-41d4-8790-097b5338fe17@vates.tech>
To: "=?utf-8?Q?Daniel=20P.=20Berrang=C3=A9?=" <berrange@redhat.com>, "Anthony PERARD" <anthony.perard@vates.tech>
Cc: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, qemu-devel@nongnu.org, "Paolo Bonzini" <pbonzini@redhat.com>, "Richard Henderson" <richard.henderson@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Eduardo Habkost" <eduardo@habkost.net>, xen-devel@lists.xenproject.org
References: <20260313164649.794591-1-thierry.escande@vates.tech> <abVtsK31t9tWgsaY@mail-itl> <acJZHpw8tcTMPpCn@l14> <acJgclxJ4_0YbBqT@redhat.com>
In-Reply-To: <acJgclxJ4_0YbBqT@redhat.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f394fed23b2e4ce4865f10734d71a531?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260408:md
Date: Wed, 08 Apr 2026 07:33:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1775633630-BE54E0B1-4237DA9F/0/0
X-purgate-type: clean
X-purgate-size: 2595
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:berrange@redhat.com,m:anthony.perard@vates.tech,m:marmarek@invisiblethingslab.com,m:qemu-devel@nongnu.org,m:pbonzini@redhat.com,m:richard.henderson@linaro.org,m:mst@redhat.com,m:eduardo@habkost.net,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	NEURAL_SPAM(0.00)[0.855];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3209E3B8583
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/24/26 10:59, Daniel P. Berrang=C3=A9 wrote:
> On Tue, Mar 24, 2026 at 09:28:00AM +0000, Anthony PERARD wrote:
>> On Sat, Mar 14, 2026 at 03:16:15PM +0100, Marek Marczykowski-G=C3=B3reck=
i wrote:
>>> On Fri, Mar 13, 2026 at 04:46:56PM +0000, Thierry Escande wrote:
>>>> This patch series introduces Q35 chipset support for Xen HVM guests. T=
his is
>>>> based on the work from Alexey Gerasimenko (See patchset [1] for refere=
nce).
>>>>
>>>> This series does not implement device passthrough as this will need mo=
re work
>>>> on the Xen side to support multiple PCI buses. Since Q35 chipset does =
not
>>>> support device hotplugging and with current Xen mechanism for device
>>>> passthrough, they have to be plugged to a new PCIe root port, i.e. not=
 the PCI
>>>> bus 0.
>>>
>>> I always found it weird that Xen does hot-plugging of PCI passthrough
>>> devices... Wouldn't it be easier to change this (connect them from the
>>> very start, via QEMU cmdline) and declare hotplug as unsupported (at
>>> least at this time)? I realize it's more complex change at the toolstac=
k
>>> side, but overall may simplify things and maybe even improve
>>> reliability.
>>
>> Skipping hot-plug on Q35 sounds good to me.
>>
>> I though we could keep using QMP to do cold plug, with the experimental
>> "--preconfig", but "device_add" isn't allowed :-(. So yes, doing this
>> via command line sounds fine.
>>
>> In libxl, we might be able to transform the json for `device_add` into
>> the command line counterpart for `-device` fairly easily so the argument
>> are only generated in a single place. Then we could skip the QMP
>> "device_add" in libxl when it's already done via command line.
> 
> -device accepts JSON directly, so there's no transformation you
> need to do from the QMP JSON. For example:
> 
>   -device '{"driver":"pcie-root-port","port":8,"chassis":1,"id":"pci.1","=
bus":"pcie.0","multifunction":true,"addr":"0x1"}'
> 
> Likewise  -object, -audiodev and -netdev accept QMP JSON too

Thanks for your help and directions.

I have a few patches that I will send soon as RFC to gather your feedback.

They add a 'hotplug' option for pci devices, enabled by default, to
control if the device should be hot-plugged using QMP 'device_add'
command or through Qemu command line with `-device
xen-pci-passthrough,...'. The 'device_add' command is skipped but the
'pci-query' check remains.

Regards,


--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



