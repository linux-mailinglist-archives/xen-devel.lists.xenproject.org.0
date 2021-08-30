Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5CB3FB6A6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 15:02:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175028.318959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKguV-0006sb-Fk; Mon, 30 Aug 2021 13:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175028.318959; Mon, 30 Aug 2021 13:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKguV-0006qG-CP; Mon, 30 Aug 2021 13:01:11 +0000
Received: by outflank-mailman (input) for mailman id 175028;
 Mon, 30 Aug 2021 13:01:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKguT-0006jK-UR
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 13:01:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46c18f47-63ce-4ef2-b6ce-d830c0f95668;
 Mon, 30 Aug 2021 13:01:08 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-h98BQfoUMyevgArNRJPOQQ-1; Mon, 30 Aug 2021 15:01:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 13:01:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:01:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0202.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 13:01:04 +0000
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
X-Inumbo-ID: 46c18f47-63ce-4ef2-b6ce-d830c0f95668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630328467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6nAHeOXVhAw1x0aCn+jCwwHDqpbUr6ism/gy/BnQVWQ=;
	b=b+gchlihtVJczIx0kLj/yGh2f8NbBf0wdcOsWp0QwFOsxXFcife/WFPt7YFGq1PNV+oIaw
	9kk2hRghUWjzQ9NciNV8HLHEi6bvWtS2824i7F67zu5BohhsFTpzAKsiw5vCD+n4/mZNJr
	Dy5eVqXxj0p8NZGvlXY1EpCQnPEFnHM=
X-MC-Unique: h98BQfoUMyevgArNRJPOQQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnyt0WsarHrHtLiNClirgLCRqp6EiaXeBnTP3uBr9oeYXJWvBS3AOaztoGj8fV42r/HAfqkZgd80ChZuI0G6D2nLZ4vABjTgoqrFU8UNffbPKs/YH5MiznFxu6vygNnUPCHUcRP4XgoID4HEItrVT02ieFhJ7WkfVcJ66L5PlVNoe0CriQVO7qasM+dooTfCtTIfHQ/RAyEMMtfI9iJZCVnAx6uRRKqUClYCbWV3T+xH55CPPXjESeIMY7SYn8/1G6RPFnA45rDq5lhDfLF/MXbGXpH4fqJLpRTp8hJ3MEb9IB3IXWCAPjRy+JYcNPNH4ZlB5EA5eBb4IYwAYvSSRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nAHeOXVhAw1x0aCn+jCwwHDqpbUr6ism/gy/BnQVWQ=;
 b=F5CFBo7tfxHZYo1urdPtHOapJm/LDnwLSOyDvO6xlXVVlCBa+F9KuO58Mcwus0CKgXkcbiggnxZPU4P0gVAvqVvEdbb0HHecQYnbMyP6UlXjvaA73QeA9CxdZgsurQXAhKiNAZF897Yd58tdgFyjjb6Aqfz1s+xxKFkhAiW9kydOudVfRoQoMXUCZoh+tKC6Rgyrj/P4cvd/iN2lM12ZwE4ZX4BDfI5rP0v7NpXWjzW0dPvfRcgGURoColJLdINadwAwkfAyUCfU5cdWyumzaW9iAsl0kpPllWvi+gB4wmRhR88IU3ZLn/fH+O4cIkwtbYMq/PgTll5GSlNSZzvtdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] x86/PVH: Dom0 building adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
Date: Mon, 30 Aug 2021 15:01:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0202.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39a7730b-defe-4a80-6de4-08d96bb639d4
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24487D6325F47C84902134CBB3CB9@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	70tnsi9LUpTSGWCnBlE1eyt3tR3cwa1BLz8t7ynXklQqaHtfCIyzav+eB9Hjrn3w76DdowQFP6Ycyl0WH5R+Brw4fnfcarbWiiJ02nOrmSRaYFkIg22klvF8mgGH/mb0CriauzH3+kQPR+wCmEtoWsNid84QlCGFVVq92mkVP7Sq5H4en4YpDE+PlnBToMJ5a++mZPbQfUWL1Ezrhq8dLK0KBM2btfnHaHiw14fSJ2kMxvcpLTYQtLqvLx9u2FPAKQF4UISFGoRwBhWAzH21dv7ihY6BDBOOIu2tAGSORXWEvZk/KvjugAZCVD1/rVBUAkotMZTAHqBBC0JGp3on/x8PZRt247g4U8y8NQ0jGwZ3gKwDGbE+L2t1S3yPzjaypl8Kmadf7KglPKZetyV1f/J+hxzJFd3KUW4X6eUBtuNS8ZkG++/KMPNyyqipels8H93Tw+HJjLr/QFH39jXlckYojpMwkC0qs/GgVGa8p+DA1dsG4gIldvu0tKjqPhNyfqCNrs7iWzAgTkeL3G4+LDmyGHqzLW8aVtCmLrAa2KEbz/d/yKtTdUtl0OTgpD7to4mIB7kXiIRqkPSgB3Fbpw/ubMeh+91dH/Yh4/bMeUSpQAYuSaK+Ardn5kToaqgB87sN3Ej+TyT0cJIt30ruMHlgmOchlM0+p4lIQekALoQkIheM6N7mE/9LF9t8pkGxjH04AMxMq+6Yerahl5oUAUZIpynVavd0XTcPT8GUFV8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39860400002)(366004)(396003)(346002)(6486002)(8676002)(8936002)(4326008)(54906003)(2906002)(38100700002)(5660300002)(31686004)(66476007)(66556008)(36756003)(31696002)(478600001)(2616005)(186003)(26005)(16576012)(956004)(83380400001)(66946007)(6916009)(86362001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlNTbThHR00wdVRMUlczMndRWFNsYm45SjZ1am9PbC9TYjJjRTQ3MHZKaERX?=
 =?utf-8?B?aWRiaERuVnhTaXlKVkN3N1hmRkFtVVZaeHRwbVEyMkRoT2NEQllSZnNGazBa?=
 =?utf-8?B?aFV6Mlc2N3hCSnUvWUk4UUhHeEFTcW14d2g0UmF2UjJBUWQ2Wlk2MEJNcXRj?=
 =?utf-8?B?RmNBODVQMkxUVyt6cFhjdzlyS2JSWXU3My9KTloyYUE5MDJyVnFSL0NSdXcw?=
 =?utf-8?B?UmdTMGRWWEx2ZTNaUTBuZmY5eWwwUmNqVFJmNVVTWThRQ2NTR0ttSTk3b3N5?=
 =?utf-8?B?TVFnUzNDN1QzL0Nxa2FEZ3hXQkZvMTRDejBVTysydlIwbm5YMGRKMy9sNCs5?=
 =?utf-8?B?RCszUzZxbExCazRhWEI1eHc4aXN5WkFHcVI1TmRHOVpoZjdSdEhFdzdPRG8y?=
 =?utf-8?B?TmZjSmpvTXBTK1p1VkdyZGhHa0wxcW5xZGJlcWZIa3QyU25kZzd4bVMzUHNW?=
 =?utf-8?B?TEIxbmwwQk16Nmo3d2Y1TkRPaUJ3N01EUkVsTDVuaUNyZEVndzJXTVV6NzBt?=
 =?utf-8?B?eFRaNWphZlpQUWs5M3ZTMEVyQXJJS3QzdzB0RGc0UnVxNUFuc2FhaWJhRlBr?=
 =?utf-8?B?c0krc2EyYTUvblhzS0FnOEtmMWxVREtDR2N5cVBKZmpHZWRjKzFZdkdsdGFy?=
 =?utf-8?B?VzExby9jSVVDL1hkcnVmQ2RVY2FzWUN5cWRKRGVZUHFtL3psQnJrR1hGdUo5?=
 =?utf-8?B?VitTNUo2SXp0MnB0ZXpRb09La1p1WmNkcGtOcXFwRHFsdmlobFNLUHdhK29G?=
 =?utf-8?B?R3A3N0hITXhkUHB3dVoyVzJnVjVOWElCRDUvTGRsRFFiU05JL2RjNTZxR0ZR?=
 =?utf-8?B?VW5xbWV5UnFBY3d6YzhYaFFmVHhsM3Zsc2V4U1F5ZDQrRFR6dThMMXFtL2dH?=
 =?utf-8?B?d0Rpb3F4Sm9ZMmVhTkZPZ1I2bFVLNDBHbE05Qkh1Z21FTG94YUJwTk5VcjMz?=
 =?utf-8?B?R212U3Y4K2Y2bktkaEVqdXBsSElHL3VqbEJzK0hXT3FZZGxVVWd0bHc4VDMy?=
 =?utf-8?B?WXlQaFIxSndqRDFVV2tzQ2FlV3h0dUpzRGdHQXI1eGxhbHV2MmEwVGtDMzEr?=
 =?utf-8?B?SW5nM3h1RGtXNUUyMDJOZHo1azlvWHo1N1cyOHo0SERFd1VpOUdSSWlBdUtC?=
 =?utf-8?B?cnhsTlRGSHk4M282YTV3bkZBYTJVNW55V3I1L0crVGsyMzJWMHBaYUEzL2lI?=
 =?utf-8?B?QS9PQ0Jaek90b2dVV05oRk0wTnAyYUJWOGkvZEVnSlpLRmFPam5oL0kxTlNM?=
 =?utf-8?B?ZjNSM2Z5elVlcEFaTG82R1RiajJ2RGNPeW9Xc0tTcG1ZYUtTSjdjYUc0MU9p?=
 =?utf-8?B?QWZQZmNqdE1HSzhMN0dPR1FMaG05RjZ2TlI3dTRkTERnNis3Q0JXU0lIS3Fv?=
 =?utf-8?B?ZWdjeWkvVGMxdW1Fbk41Ym84c25jQ2doejhEV0YvczlabElHUDlyc2YxYjdt?=
 =?utf-8?B?QkQ4MEU2QS96VlhWcngvV0FOYXdiME4yVzk0RDY5L3NhOTc0Wjd6Tm9rMEJF?=
 =?utf-8?B?RDZpMU1UM3NEN0xGZllMUzNERWlZeTZMalZBaVRFRTh2a2l4RWFzYVJNSk1Y?=
 =?utf-8?B?eEczUmdtaDVyelpmK2UvcHV3VlZWTE5wazNvZm5HZ2UzZ0puMFdhejdOdXM3?=
 =?utf-8?B?WDNJOTZMSEdPR2VUZllWWEQ2cll4ZGdidmczZ0JmdWdjanVMTmNoY2hWRHFB?=
 =?utf-8?B?cHhiaTBFN2wreCsvVlNST1Q3YU9kWU92UmprSHByejBVcERGUkEvanJlaGYv?=
 =?utf-8?Q?hHwCIJdHZyUGfxkVYWC0qWw20qPFtXEITTYO0JS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a7730b-defe-4a80-6de4-08d96bb639d4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:01:04.9288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNHnaDxLCn6aKh3xp3BtTgNrZZCVseTaccSqNiGvEI/DBoIUtC2yk46pHxktYUm4KpX03shX5UXcs4NK24Njfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

The code building PVH Dom0 made use of sequences of P2M changes
which are disallowed as of XSA-378. First of all population of the
first Mb of memory needs to be redone. Then, largely as a
workaround, checking introduced by XSA-378 needs to be slightly
relaxed.

Note that with these adjustments I get Dom0 to start booting on my
development system, but the Dom0 kernel then gets stuck. Since it
was the first time for me to try PVH Dom0 in this context (see
below for why I was hesitant), I cannot tell yet whether this is
due further fallout from the XSA, or some further unrelated
problem. Dom0's BSP is in VPF_blocked state while all APs are
still in VPF_down. The 'd' debug key, unhelpfully, doesn't produce
any output, so it's non-trivial to check whether (like PV likes to
do) Dom0 has panic()ed without leaving any (visible) output.

[And there was another rather basic issue to fight first (patch
 will be submitted separately): vPCI wasn't aware of hidden PCI
 devices, hitting an ASSERT(). Obviously I couldn't afford not
 having a functioning serial console.]

In the course I ran into an oom condition while populating Dom0's
RAM. Hence next some re-work of dom0_compute_nr_pages(). In turn
in the course of putting that together I did notice that PV Dom0,
when run in shadow mode, wouldn't have its shadow allocation
properly set.

1: PVH: de-duplicate mappings for first Mb of Dom0 memory
2: P2M: relax guarding of MMIO entries
3: PVH: improve Dom0 memory size calculation
4: PV: properly set shadow allocation for Dom0

Jan


