Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E675449CE27
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 16:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260978.451371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCkCX-0001eK-I4; Wed, 26 Jan 2022 15:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260978.451371; Wed, 26 Jan 2022 15:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCkCX-0001bQ-EP; Wed, 26 Jan 2022 15:27:13 +0000
Received: by outflank-mailman (input) for mailman id 260978;
 Wed, 26 Jan 2022 15:27:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCkCV-0001bK-Lm
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 15:27:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d648363-7ebc-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 16:27:10 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-PL3VsjxJNEGrVp2Bl0xNfQ-1; Wed, 26 Jan 2022 16:27:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM7PR04MB7144.eurprd04.prod.outlook.com (2603:10a6:20b:11b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 15:27:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 15:27:05 +0000
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
X-Inumbo-ID: 6d648363-7ebc-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643210829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rqhXcV662ncrOecHWEqA7g8TXTshpAcfxdN3hyGCZOY=;
	b=kXqAI1l1f0+peMe94BoJqNYfnHCSFV+YLOeh6MKM2NLPfxtLa0+6PeXCOY2i/k7MqpDwpY
	gny2BcXzlxJkHvNOAl56WOykYEnDyA0OecvaudC6JNc4RXhOCXQ1Fp3ErsO3E+7Fa9QRsk
	x7MJy5N05hQu5/EH/yW4kM4Xx4ct/Gs=
X-MC-Unique: PL3VsjxJNEGrVp2Bl0xNfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/QpUQHR70OXuyUial8qQ2kvPnCUc872KMCbYwP2gIonNbt00d2pFn/63N2b/fWmuW8fwBrnkxc+Q7nykXDA7rQXZwlP0B1U+zvCfZ/kiZsbfxvlfGkKO7SRco2WfgciBMOEL3kJVowZ1bE6nic/D9YKdIpSUOn+JAtH/5RW2iqN8q+V9dO0pXCsqEMSeWqCh2HzhyocnDeT/SnZ6laKy/iApEUKtkf00gpnTqtV0QmMXR9VM3dC3B4f35qwHTnrkSMuKCXqE6pO9XyiwnD43oBnT4yz6OBEvwiUdfjJ2zx51aZtyJ/gxQqTr3ogLZ/YDJKydZorWhSmbSCi+RXTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5xD2fRPim1/eMKCb+ZA3iZGUHUsL8Ir6HXuk36GdRY=;
 b=Fo66I+Ihy/N6rbQ521UEcXr0l7g+HEsYors75mA7iN6VgqbMqJtAU18nOwv1WqBiEsDBzQTg6fd/20u0kDhGxqpdFYNf2JEZ8BZ+kiFenrJ5TRzX63CdOGq1SdRzIwSZlDObioqSYEpVx+xTiMES3y23uKD4FTYTcUrItJzu1KMlwprj6qNnaBQUcSKjZiq87Q90a0JBf6DddOtyDeyRbKTT9lKA3dHBOt9NZj1DVrpdTp+tcIwBrk2NO2OOqwiZOaOSJp+WniI9TPy/psdhgWy/aiCOhQQtswNy+Yx3UGMavnrpW14n0yvW8vUidhhPqYUV1Hauy+1WGVYf3MTQ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4ce94feb-4a0e-67ad-611a-e56ce43c1a61@suse.com>
Date: Wed, 26 Jan 2022 16:27:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC] xen/pci: detect when BARs overlap RAM
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220126122648.52275-1-roger.pau@citrix.com>
 <a46cb04b-2e83-a4d3-039f-61bdbd381c38@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a46cb04b-2e83-a4d3-039f-61bdbd381c38@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0083.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15096e04-21f4-4528-e1df-08d9e0e04f43
X-MS-TrafficTypeDiagnostic: AM7PR04MB7144:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB7144C77F8A1C4D9478A23ECDB3209@AM7PR04MB7144.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kn4fjGqbP6a0CquMqqMjitKGwrAh1vNhrjmflYv35ecNRzWKWzwuvZ0YhF/bBj43IKU81krR7aPBS/ZZ4WTSMixLmabQWzjaQc1znoYhg0uWXGANTZiHJdyAYALfSHbO1HpBvUSgOgPSwXar3Z+N2i2avUt1dhchq+Q1p5tj2Ez5cDPcp5qh0oF+losv3FRu8UTw1q/FdkjLNTWOSCFpstC+BB2EflcMDjkX2J4ZZUly4KdU6ESBfMniG6a1sdzMW+J0EvsQCzRGy5wAvfI3Djdl6luf2odg00VIFeh0pbjd/+xJ3WoQin4uHVxkkgneF1bP8F6LVBKrtv5A0EMZWG2QdG5nWg3ULEnbPyoaXnSV9xuvqmyz/kk3/1j/d7JFv/+F/5r9UVuOQI2tse/LVuG0ahUV1dd4cEmbK8Cch3tNrDzs/aRnug8MAsjCHwN4tJ4hXd3RqDlYpGIvZoQ5KEarpYaKOIGes1BM3+J8It4UNarQ76GU3sSs20ftibxCWSClXkWGQQwaswrvHFu//FLQRvWgU50yKVwvDhFQfiwGyj3JUbjw9SXyg8V9rnPXGZqVGm8pGCaX6rpxs0SDRSv5H7Z20d4hKHZ/oFgqSXWs56d1sW/H2xZV5IxOq3Z1ZFzTNyYAUVIyB9RHLIzkWwS/0Vzo6yc2/2rLBPrPAZ07oT+n5y7IF5IfvwKUB0W/8BjMvWbf+0tHi+1aPFrqc+QuHE2TNGv+aUl/QBCkfeU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(5660300002)(8936002)(7416002)(6486002)(4326008)(8676002)(86362001)(66476007)(31696002)(38100700002)(66556008)(36756003)(2906002)(54906003)(508600001)(83380400001)(186003)(316002)(6916009)(66946007)(2616005)(53546011)(26005)(6506007)(6512007)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ngoiTAa/+Lnnyon0WHAODn3gsNFrJoud5i+uqeFk8c0KfvceOOS34d5XvDxr?=
 =?us-ascii?Q?qCAv1EZvrNi4ExwFIq6XJw54ThRdGcpNSKDQ79ATADjr3Pc0xooLHTqY++pq?=
 =?us-ascii?Q?E2gj+nxQ+2BF865hFf3d8KBDt7X8Fj+Hzaz2/skfnHby99E9bGpcRumVHE+j?=
 =?us-ascii?Q?DKew3RjXHPzM7fD2t5sDwFNnFtiBinFnJFf4fagycxv5i2d9fgO0f2qtn3Kp?=
 =?us-ascii?Q?/OBhz+fwyQlWwFeUg1/E36ZCgPuaPrc2Dm23uxaPRQ5EFd0C54HqStUy8bzN?=
 =?us-ascii?Q?WYkdz4nSgSbde9631RoqebIV6wjedrx/aK8enoq4dl/+yHR3oaR6iARsaN+L?=
 =?us-ascii?Q?tEltUXe7TJZGGtiez/SZ8YqAdNUmpvkz8rwpFQVB7+zhhrz+s00X84Af7AGa?=
 =?us-ascii?Q?Mo2jNrS22YlWx8v8T5dCoafM3GaEdjvZc7uSTveB8oAkhWQCG3pfDk+zkmer?=
 =?us-ascii?Q?UtsIi1gk3KXUWv2NGQtVKj31CeXSBihtApcY3gtC4zxBnS/NMi3Bh0LpKBUC?=
 =?us-ascii?Q?pfDb99SX13rGnK9j7cSzwRxUUhUP6IOXt97qOGTmboBoUVW5pjIZ9w1lsIqu?=
 =?us-ascii?Q?Y2R9LDmibC41bVB9xc5dAPHVZea6VQcaEeC7Pp0k8x+e9t1VByOBuXp3wfdP?=
 =?us-ascii?Q?JoMzYvPy4vdXIFW+K1lZujQrOR0wjbizVXWdgnr56m5JHkjsAg+VNIgRtg4D?=
 =?us-ascii?Q?ebLg321b81D4AeJVpgo2Ld9XHbw6MovpREYla8nmKcsF6d/fxlVjZ6PYJuFz?=
 =?us-ascii?Q?1irPaqT2zicI1CvXH2sdqgDnr7DiWHPeUANVkjKQeh9w86NkGQr4VsF7bonP?=
 =?us-ascii?Q?oi9Y9HnqKVMjeO5OsjFLnt3FBhPCIyZIG5snwb090MFAs0OVoVWt8NprulYQ?=
 =?us-ascii?Q?QS9q9d0LlEuz7u+q2TK0q99fqZFQ1gZi8gxgL8XGkxyGAaUlIr00XU2rp7x/?=
 =?us-ascii?Q?0FnUYk76fKYhy18dyTcu4m2SqTwv5nC8PWYA54LenSN8AZxakO1QKa2DPDm6?=
 =?us-ascii?Q?HrFalcir8frD5QBmu0PNdhorYeP8acRFizzC6Db1MKwWgpSy0e31gRNiVE+V?=
 =?us-ascii?Q?3NTL58HwolXKYW97FS5a2T4yQWSbMz8FvkoL+3nIyRi+RQKxsPK7Sm9ammGB?=
 =?us-ascii?Q?G6SRzvs8Zz6fHzhQN6zw43A+Ko0AhpnEAzPXtYNmQ4QDO+QJrgi7yQWrUoxm?=
 =?us-ascii?Q?0SB4FlChslle/uxV3Axrz1IdrZ0rUhlE/SZvykvIePiNxFvlSQHYHaE2nqmv?=
 =?us-ascii?Q?YVk6YeoyfDavBJyqL4VY0vbMggJeAr3PX075I/ujL2mjbno332tPMiepHIEE?=
 =?us-ascii?Q?LILG79GznYSrx7Il6olx4axsHllILX+TkmaAstPZGnoTJStSWuvdc8pdK6tj?=
 =?us-ascii?Q?OwZYuMGwd0YNHZBCnRAldRSDY7b1ZY216xyFurvXbMBlhRwuBnyDioa6Uve5?=
 =?us-ascii?Q?xO9zWaM1hslYxFeM6Ywx3SKrHs3NDgUobCqG9+hVKjgjW/D284Qy3pHl13iO?=
 =?us-ascii?Q?S2O/NKdvUeQP59+uYXsY3HPJk7V2b4vTJ0eyxYBaluC1kXMvSkDjWBcUelG3?=
 =?us-ascii?Q?/TXrabNwjj8/AMMugbWCc9ELoM4oeOfeBXnRl9KVjx2gTTerNjm62PL1J0e2?=
 =?us-ascii?Q?332Wb9EzFeqXkp6s0O0wc0E=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15096e04-21f4-4528-e1df-08d9e0e04f43
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 15:27:05.8186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekMOLdzFqt8GNkf7U8ooV+8uw0CWl/IrOpTONuJ3sDaaV1LnJxTo7n0AlSXbofT//4tGOJ4eBnsHaZLR6UXZXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7144

On 26.01.2022 15:45, Andrew Cooper wrote:
> On 26/01/2022 12:26, Roger Pau Monne wrote:
>> One of the boxes where I was attempting to boot Xen in PVH dom0 mode
>> has quirky firmware, as it will handover with a device with memory
>> decoding enabled and a BAR of size 4K at address 0. Such BAR overlaps
>> with a RAM range on the e820.
>>
>> This interacts badly with the dom0 PVH build, as BARs will be setup on
>> the p2m before RAM, so if there's a BAR positioned over a RAM region
>> it will trigger a domain crash when the dom0 builder attempts to
>> populate that region with a regular RAM page.
>>
>> It's in general a very bad idea to have a BAR overlapping with a RAM
>> region, so add some sanity checks for devices that are added with
>> memory decoding enabled in order to assure that BARs are not placed on
>> top of memory regions. If overlaps are detected just disable the
>> memory decoding bit for the device and expect the hardware domain to
>> properly position the BAR.
>>
>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> I'm not sure this is a sensible approach.
>=20
> A bar at 0 is utterly unusable, because it is outside of the host bridge
> window.
>=20
> The absence of any coherent GPA map for guests (needs fixing for oh so
> many reasons) is a primary contributor to the problem, because Xen
> *should* know where the guest's low and high MMIO windows are before
> attempting to map BARs into the guest.

But this is all about Dom0, ...

> The proper fix is to teach Xen about GPA maps, and reject BAR insertion
> outside of the respective bridge windows.

... and hence this isn't about "insertion", but about what we find
upon booting.

> An fix in the short term would be to disable the problematic BAR when
> scanning the PCI bus to being with.

You can't disable an individual BAR (except for the ROM one), you need
to disable all memory ones collectively (by disabling memory decode).
Which is what Roger does.

Jan


