Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFfRB9HC12mdSQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:16:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833183CC7DC
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 17:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277846.1562953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAr7I-0008Eb-5N; Thu, 09 Apr 2026 15:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277846.1562953; Thu, 09 Apr 2026 15:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAr7I-0008By-2Z; Thu, 09 Apr 2026 15:16:24 +0000
Received: by outflank-mailman (input) for mailman id 1277846;
 Thu, 09 Apr 2026 15:16:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d7c2c4.v1-ae2112f9b0334547b0aa29321297f94e@bounce.vates.tech>)
 id 1wAr7G-0008Bh-RV
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 15:16:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAr7G-001ojt-6y
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 17:16:22 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d7c2c4.v1-ae2112f9b0334547b0aa29321297f94e@bounce.vates.tech>)
 id 69d7c2bd-5cb7-0a2a0a5109dd-0a2a4505ee44-20
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:16:22 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d7c2c4.v1-ae2112f9b0334547b0aa29321297f94e@bounce.vates.tech>)
 id 69d7c2c4-3760-0a2a45050019-c602bb01e5ee-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 17:16:21 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fs3Rm4L3SzBsTqR0
 for <xen-devel@lists.xenproject.org>; Thu,  9 Apr 2026 15:16:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ae2112f9b0334547b0aa29321297f94e; Thu, 09 Apr 2026 15:16:20 +0000
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
	s=mte1; t=1775747780; x=1776017780;
	bh=u4G5b8BzRpgdq0ECTOrqeR4d4eU9e202pjwonFRVo98=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Zhj/jjrJ6jaroSQ1ldY2+DACqhPTEUXwDmT561M9UQgYCMBX8EWDUmR30oTHLRVmb
	 poM3Ezyi+J1FPqNqQDmsiD5DmQazO5VZ0FeFdY9mkv13lLTX88DEc8IrAxG/PIV74A
	 Kjx2WJUtXNbRtxVQK257ZDhQ8XQNikc0hk25GLpSTb2wkq+nfrU9NgnunNYbBmIjaj
	 pNEFFCDlo913Ap7Qb9afIVkj23OWnY07b8FW0hIKr2FFpsTkU5N37t/sgngaQETg83
	 6JWBvMUBvzGtrILTOL0kIgG5GvojKwLBN/SPNVORZ/zw+6QaT0NByewUnfGZX02ygm
	 ieh77KfzLE1sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775747780; x=1776008280; i=thierry.escande@vates.tech;
	bh=u4G5b8BzRpgdq0ECTOrqeR4d4eU9e202pjwonFRVo98=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wgKkesW0hJ9UoVGORaBS7fiNZwgsq7yyUxbnaIJGtcM6y8uE6z6dfKgHzyLiYE6e6
	 X/LLB9NeF0pSz2FFpqazGOM7TgVgPz53auTWSkcV6FNCpGpt/9W1B9ExQglfDVQl0v
	 psKCfII148dzkuMKtGubfB+7IbROfOGj0D26eYrsC9a29KyJR1bCKqXdXYc5ALoQKt
	 3IpEhOiEUzTxE2u0+LRD16PakGiFCrsUPxpf0lFfSoL638fcs7AKZL0VkpavB0WeEQ
	 XSIZDNPJKF6GzXZNknwiqUsVD8K2KF8eORmWkw7NtDVeaRXlBIgwiihbYkuWjQ8qqP
	 7eDQIDCz7Np3w==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=200/3]=20xl:=20Allow=20PCI=20devices=20to=20be=20passthrough'd=20via=20Qemu=20command=20line?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775747779696
Message-Id: <25920654-0423-49de-8245-ac6212a405cd@vates.tech>
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P.=20Berrang=C3=A9?=" <berrange@redhat.com>
References: <20260408172320.539750-1-thierry.escande@vates.tech> <add8iXLvyWlYkrpM@mail-itl>
In-Reply-To: <add8iXLvyWlYkrpM@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ae2112f9b0334547b0aa29321297f94e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260409:md
Date: Thu, 09 Apr 2026 15:16:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1775747782-32B2096F-E28E017E/0/0
X-purgate-type: clean
X-purgate-size: 2192
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,gitlab.com:url,vates.tech:dkim,vates.tech:mid,vates.tech:url];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 833183CC7DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/9/26 12:16, Marek Marczykowski-G=C3=B3recki wrote:
> On Wed, Apr 08, 2026 at 05:23:39PM +0000, Thierry Escande wrote:
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
> 
> Generally I like the approach, and it looks sensible on the first look.
> But CI says it fails to build:
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2439831766
> 

I completely skipped YAJL support. My bad. I'll send a v2 pretty soon.

Regards,
Thierry



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



