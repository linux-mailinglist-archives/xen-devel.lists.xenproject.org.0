Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E5E49CA01
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 13:47:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260879.451069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChi3-0007C4-D7; Wed, 26 Jan 2022 12:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260879.451069; Wed, 26 Jan 2022 12:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChi3-0007AB-9P; Wed, 26 Jan 2022 12:47:35 +0000
Received: by outflank-mailman (input) for mailman id 260879;
 Wed, 26 Jan 2022 12:47:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nChi2-0007A3-C7
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 12:47:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21593a33-7ea6-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 13:47:33 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-kLI6EtzkPruzF1uq3nJTdA-1; Wed, 26 Jan 2022 13:47:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Wed, 26 Jan
 2022 12:47:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 12:47:29 +0000
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
X-Inumbo-ID: 21593a33-7ea6-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643201253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgKP2MXJi4QMpbil/c/UUJiX1hvglDfrKYe7y4xe/so=;
	b=J2+09lLk+F7fT1S+ktTHqQUljsUjVF0BUpR0Kfn4wJ4k4aFg9sFY9eNWhzsSa7oDDjqxHE
	C0k/3V26dDSzviG+WOuY9Ke+nd0RGzy9XageO/IYoJIvNH7kDQhubreYk8wb/3GHa5esHl
	Jz/o0KUAKyns33CMfdmGaJ0aU0lLaw8=
X-MC-Unique: kLI6EtzkPruzF1uq3nJTdA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XincRZDkLWXLLgwr6HTBVlKVBNkcDCkpqG/MqJGCiBPLHw9NVRG1zRtyu3v9SYhoBJqhGOTMmmcU6qszQE/bmLwyXIeO/tjcM+wwjh95ATzx+auF/C5lIJT113uI1cKJV0sBOTkjsGB5QbUdU0gxgxBy5DuhUdWxwo7D4q+GzetfmQAOuZlXmLfAVsZ5sUehrbvu35C+8jS4HP09zmkQokcCOKpDL1XcDtdqk0gOtJOmhyJ4NecILq3lxaIEKdMJY6qt5lYZUwl7zLgCxYkK8Ytmw1dmoWRxbSbxv9g3xn3KA/IMAJjXug6Hp73Yr11v1hCdL3kLhoHxfVXpu4cx1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIDdExZSfPadiR0MHp0V5XApoC4433ImlzGhuNUc2a4=;
 b=BBUu3/5o+yfSK9sy/hkmmmmziP93Rqwyh8oB6GumjZ9Hx5k7vmvREzl+VNs8wCCi58MW5oobsGQTh8B1xsczD+yiJti6eugxRKxGAlltwuy/nlakijBWco//z1YfRQOy4PBIEQtHZkaWAAihXdVWeaU+QFoR3xTfe+sPjPvfMOBcKyP9pgWuuaOiJiOu5sKz/6ym6Ps/RiYMtPHxohZXj59GUR7q6+vP8aodYV1Dzd35TqRfu7doH7mdlDRBR3VCbkxRH32vw5h82GCDXBiEMX5L9HbF+SkBsQmPr8B3/+iAKgv6vLLIJXtw8t3FYvGlWQlOFXJS41uVdLJ0CHW74Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72f35326-0ae1-458c-6490-37d14524bf33@suse.com>
Date: Wed, 26 Jan 2022 13:47:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] xen/vioapic: add support for the extended destination
 ID field
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw2@infradead.org>
References: <20220120152319.7448-1-roger.pau@citrix.com>
 <20220120152319.7448-2-roger.pau@citrix.com>
 <5f8d332d-1bc3-af71-27ba-a4ff7b6e9514@suse.com>
 <YfATkz+nse45Vg3C@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfATkz+nse45Vg3C@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f998453-957b-414d-9c7e-08d9e0ca0364
X-MS-TrafficTypeDiagnostic: DB8PR04MB6555:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB655567F4DEA639F8141E3D50B3209@DB8PR04MB6555.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pgkhs59JGNbyJG9NjR0mpPAsdhQQert0hdOqnK/3H027Z8puWHUT92qTWInWReHMJcDpBsY5IpNWSsMS8cAQtYTsBB/MGD/F2IH0/9AawGdRI83tqpDBy0fO4B42fS+Q4cmjEuLq/aZ1dIVgZaNBdV9V6bj45Xv25dTR1hwODXnM6U4Gf/qoFRL3UcCFvQlEGlPyWKavOVK/wNgCqq+HOBAdSi0oSmnMXcgXanEOLa0blEAerRQMHMg4MlNxTISS5HigAUOlYU9XbS4d1e4kEArdAdr471rEByk3d12TCCaFsxhLrg21y3WCIbAV89CJwjDjbmppjlPKJo5YDOE8n7egTolckYcx/NzFCfKy23UES/2rwKyei5+URVO6tlA83+ImIVwGRV+6wGV6ibfhl03ZqJapA4mfK2IWtPWM55uTFvowuZHQAf6TS5jQXtqH76OTIm5kYhyXrgPxy5GeFAYt6C02BCvJk2Gk1nRd0bJjA7C04z/F0G4IuJSUrvZP4gcVyG+x6Ejfi1muQI+DhjyIkwXTzQwufQk8OT7h0LBoddCaG+o4+dtxU7WHDsAVU2HWAbi0H88K2nnBpbEQMwgOKXtmn53Q+me2kCvY2q+Eu/2pUTiqaiyO6+o50oyGpJft90z8KEbHyZjK98Dp2ZiRF/LeN5Mj+9fWM2LqhjcVRCoyB8eUtZYKdWMcdlCQANlSircTEiiDIDU76/Bq4AK690oLUK5QQsgQp0l5LOMBEQHV1pgJqFO6byVp59d4iM4XaZ58sseATknyrVS/PHayB6w9MHwKCcYbcjKacqINK6IXuuXjR9TTlf1eNzYM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(66556008)(66476007)(66946007)(53546011)(6486002)(86362001)(5660300002)(2616005)(4326008)(186003)(38100700002)(31686004)(31696002)(6512007)(36756003)(2906002)(6916009)(26005)(6506007)(8936002)(8676002)(508600001)(966005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EtPN8YjFR6IPRTxWp82kvY531ZsDpMstYFxQNPPSTHdKrI+26KVgvEmyuhI8?=
 =?us-ascii?Q?W+SSdDDGy8UvWNtwkk52BE1TM5i6fPqzrk8i7fTqDWxZdQ/MRrSjtVbOv/oR?=
 =?us-ascii?Q?JziCcbibv1MmCX6Kd8NPJkAuFoX+89lE7mWGzgunfdM+j6qkmRAI6ATAWreW?=
 =?us-ascii?Q?XCP2xKOsTujucHIhQSe+iP1fBWccCIxqnQX5Ti+ILQqZwoKSD5kNydCdXbvk?=
 =?us-ascii?Q?jdgWANNU+EmSnls88yNXEfeHdksZJlx7WbBRFhvRUiro9HmUvOw8qG3XVhTk?=
 =?us-ascii?Q?fLHF5iphdJ3iusqckk/k+5oHiyUUgXBR9L5g0MqA1Kac5lSVveoKDUylApvZ?=
 =?us-ascii?Q?9t7rSrYCsXydmBz+ZXP578NvVd5zbHd72nr8q+QbCd3UFDkvzS/BNjJe1PBx?=
 =?us-ascii?Q?9cxvoqjym9P+jQHAKIeCAD7Db/Ix8foPuyn4b/pJfSr77FeBvByxYZ9+sL2F?=
 =?us-ascii?Q?vcj9LmtU79AoNyDYbEQjd4XyBtJRds/tNlmzn4BU/RhgwS1V3sLByA2dtG4N?=
 =?us-ascii?Q?KOdxVMWflKWj7IYxnhhq1WBHQIeP2UTl0+RtXcCZk82rBjARs1QCR6ZLiJGK?=
 =?us-ascii?Q?3Wv8VqTcAf8e0G5RdBK4iNABjiN83ZvVAvH62t1w9baYort9HuqNTFSKacx/?=
 =?us-ascii?Q?utsjotjcIb/Rz7HgA/BriuoUjgaQtZoSUO+wfqJkqJ/jP1s30zGZDZzh8zNU?=
 =?us-ascii?Q?Y3SidjtfCRe8RtQot4Qwg19Yp72HprsO+0AaJcWptzIPPVHqLSXgt96Q7i3H?=
 =?us-ascii?Q?l5nEyTF15gnytOCBTFKsFtzBrd+X6dFFgXMLo4+ZxyGd+YBWokPUho3pvLTK?=
 =?us-ascii?Q?94ckbxxH//vn6PAsLNc3X7B5HE9tTljZM0I8SSKfZ1zW54dZyBQNg+JcZmb4?=
 =?us-ascii?Q?3v+iAUBLWJWhC2+0sX1AhzJ4fP/VJF6LpYFEovvuCehURgFuwdkYPqq7Z2oI?=
 =?us-ascii?Q?GzYvNrHMBA1IHMkfpGyV5kSDS5RbvPfc58kAgZEpjJ5pzPuZ7Ca3tERO+hJj?=
 =?us-ascii?Q?bjIRQP+o5in5S7xGmsTzYY+bfZ4vIwfeI0HwAiQOn313Yt2NyflsKXI4GFCn?=
 =?us-ascii?Q?Jjli1EFGClPwsNrCX4NDh/9Iv/DgdiwGM+AVUjHSCqkPww+vpmFeNJrXd7n0?=
 =?us-ascii?Q?tGLwP7CBxJzu9ztJWb6xQ2TGGsled/o+91FEtLxvcEv7CmLdxYb4hylTlmW4?=
 =?us-ascii?Q?ymCj1EyjSy5oERjeCsR0//MbPXxqLglHU4iw0KP66uJOkVDYQtu2/4EHjnvo?=
 =?us-ascii?Q?VaK7L6i+UreNW0fIvqm0MQOvkZLnVma9+ZvwmlYM4XCexT8/pLWBHr96K8Ra?=
 =?us-ascii?Q?yNJo5DzRdtuI+x54dU4vzyGeFyaPHzTWNkzopATnKeP71bDLUP5IhUW9H385?=
 =?us-ascii?Q?YT5vI76e/qu1P0w5OeTGYlzE0C/cC++ZM3kIScsVa3YUdMY6xJKw9ncbAq1X?=
 =?us-ascii?Q?hrglx4witZP4e57cAQw8P2sIHnQIuxh1hiX4Egl05wEqe/cLVCtyXQ1fjK88?=
 =?us-ascii?Q?y40BE6QaUp5PT/3Co0WGGch3+NYUviaRHOldod+wRibJ/KGE8KQnleTwH+aI?=
 =?us-ascii?Q?cF8rDeNzm76zfykGuaZrrw6AR8m+/LbrjF+elCA6wY8ofbS+ZR5MCflPtw1+?=
 =?us-ascii?Q?4bB2wFcsudkj41ZymaRIMK8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f998453-957b-414d-9c7e-08d9e0ca0364
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 12:47:29.5826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 768Y73ZXi3jmbMCd05IfiwrkF2zOEFc1zo1VC5RqYKtuvAjDukcXzmK4AzPIlHV9FfiKVvZaSkuYnSwrIrHz8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6555

On 25.01.2022 16:13, Roger Pau Monn=C3=A9 wrote:
> On Mon, Jan 24, 2022 at 02:20:47PM +0100, Jan Beulich wrote:
>> On 20.01.2022 16:23, Roger Pau Monne wrote:
>>> Such field uses bits 55:48, but for the purposes the register will be
>>> used use bits 55:49 instead. Bit 48 is used to signal an RTE entry is
>>> in remappable format which is not supported by the vIO-APIC.
>>
>> Neither here nor in the cover letter you point at a formal specification
>> of this mode of operation.
>=20
> I'm not aware of any formal specification of this mode, apart from the
> work done to introduce support in Linux and QEMU:
>=20
> https://lore.kernel.org/all/20201009104616.1314746-1-dwmw2@infradead.org/
> https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dc1bb5418e
>=20
> Adding David in case there's some kind of specification somewhere I'm
> not aware of.
>=20
>> What I'm aware of are vague indications of
>> this mode's existence in some of Intel's chipset data sheets. Yet that
>> leaves open, for example, whether indeed bit 48 cannot be used here.
>=20
> Bit 48 cannot be used because it's already used to signal an RTE is in
> remappable format. We still want to differentiate an RTE entry in
> remappable format, as it should be possible to expose both the
> extended ID support and an emulated IOMMU.

I think I did say so on irc already: There's not really a problem like
this. For one I wouldn't expect an OS to use this extended ID at the
same time as having an IOMMU to deal with the width restriction. And
then, even if they wanted to use both at the same time, they'd simply
need to care about the specific meaning of this bit themselves: When
the bit is set, it would be unavoidable to have it (perhaps identity-)
remapped by the IOMMU.

>>> --- a/xen/arch/x86/hvm/vioapic.c
>>> +++ b/xen/arch/x86/hvm/vioapic.c
>>> @@ -412,7 +412,8 @@ static void ioapic_inj_irq(
>>> =20
>>>  static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int =
pin)
>>>  {
>>> -    uint16_t dest =3D vioapic->redirtbl[pin].fields.dest_id;
>>> +    uint16_t dest =3D vioapic->redirtbl[pin].fields.dest_id |
>>> +                    (vioapic->redirtbl[pin].fields.ext_dest_id << 8);
>>
>> What if an existing guest has been writing non-zero in these bits? Can
>> you really use them here without any further indication by the guest?
>=20
> Those bits where reserved previously, so no OS should have used them.
> There are hypervisors already in the field (QEMU/KVM and HyperV) using
> this mode.
>=20
> We could add a per-domain option to disable extended ID mode if we are
> really worried about OSes having used those bits for some reason.

Generally I think previously ignored bits need to be handled with care.
If there was a specification, what is being said there might serve as
a guideline for us. Even if there was just a proper description of the
EDID field found in recent Intel chipset spec, this might already help
determining whether we want/need an enable (or disable). But there's
not even a bit announcing the functionality in, say, the version
register.

Jan


