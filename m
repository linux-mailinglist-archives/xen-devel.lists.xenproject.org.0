Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D296E4353
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 11:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521865.810827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKuQ-0006xF-R5; Mon, 17 Apr 2023 09:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521865.810827; Mon, 17 Apr 2023 09:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKuQ-0006uZ-OS; Mon, 17 Apr 2023 09:12:26 +0000
Received: by outflank-mailman (input) for mailman id 521865;
 Mon, 17 Apr 2023 09:12:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poKuP-0006uT-Ik
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 09:12:25 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6b6fbcf-dcff-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 11:12:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9577.eurprd04.prod.outlook.com (2603:10a6:10:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 09:12:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 09:12:21 +0000
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
X-Inumbo-ID: f6b6fbcf-dcff-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwuqF5aaJYtXuAdRnk432zZv1jgADAnnOF0DNCRUMk01SNsaSQPzFYnBMKXLDle/y+qpiXdAmLseWZ/Td6zp2cZYSqtCy5relrrytVqJcZI2ie1OM73QdQY9tzl9abd4EjGfjyv3vskcY1o5IsIBdp4Bj8QsRszAPjHuc53rbWtZ/TB6T+m+f2C9UxSNi3c0llUaMfdHx+4M2f0igRYZOXdDzxe4j3PYqpTzxtkOYDXuh5TpBM1+LZ8fliXGtooHMYTsvYkCD95Rfjuq74l/RzaI7yi6+54c3P1XsMUuHmk1cSJdp5aW6xMSgwUVAkY+BXNSKqYiN65SwGAiWEsSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wTXk1GgmTkArThWSjmbq+v/0yhBUgVd8EeCozB7vq8=;
 b=E/Vo1G/lVpWYpxEdNVpeAcnLMxhGj74JavZOIgquBQeuNf6Ciyjv7aAWegaiVv6h3p9XfGZbol09in3fT5a1Mzu1UY5PbO50El6TCU0L77fVnfmKqt3ET2spbob7plO16wOWO1cLKgyJRYn0ig0u+trgDuPso6G+VI6xEq4x4xvcChWHkV2GDTytgYdnABO1CLxwr+PdM9rfrHGTBRpf1hUQafiEt2UUEhZ6aUq/1CX7UNYw9AV4q7uJCfuDOdkbklS6cLQnNS7Ag65Av/FfO8Z0ZiHf05QHtk9bf2n/WAVdMIO7TTHzqEyM6oyNOfhB63IxTJJhorLY4+Le7astJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wTXk1GgmTkArThWSjmbq+v/0yhBUgVd8EeCozB7vq8=;
 b=1APlCu3B+H7yyVdgiV4qaP251GbaCdD5gLOHKXMjh6gA+KQNzlXD4JJOsvcgqX8RZkaL5hlD2YcxKlxMEI6cO3r7OC6VvLNIIqUQD97AQqDRXoNU92swQpxE71KFArJRZIUKlopAIey5QlAUz8sFXD5hvCw0MIWgQhTrFyywXGvdx5LwTonSR+WwxXCTGdI7KKcoCiPi5Tg3CgNdarbFyGGZdTRVoXrUj4GRBlQva1xMlNmUTHqQchfahz1Mjh5YqjOsmfRwbdfj0zfmbGYmB/kyCfqKhkVim2TK2UEIOnNnVHg5+D4BYsw6MWIxtd3n/vZlFM7vt7MFzH91yJlkUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ecfe786e-0623-f965-bdda-57ae46ef5646@suse.com>
Date: Mon, 17 Apr 2023 11:12:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [XEN v5 00/10] Add support for 32-bit physical address
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6548d4-4ff3-4d2d-028d-08db3f23d9e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kl6T+LU0q+L1bXxyOF2FL85hxdo12VXjy3sbpaRvdwBvDpB1P8UkoWElT1E2cHTuWXRYN2X7FqpVAR/OgrcIE75Wv5YFfBHhbM9VgI4PYEZPq3cEhKSsdyJf/5fU+Uu9HxyQb57MaJi8vB2XdPIahsCxCzWr/z0sN/0UTzFuToP9CyewHY9LY0bsaEBPPiTG1HrdClsTphBLxtS6mqFoan2QfJmzP08SIX2K1WrQhbanZ1n4CQqVbL2Vxq7rbcVtdq123O2TTQMyh0pIl7L4+omEhojr2W4lPy1LkLWmQDqReU/rnQA6Wkq5GcR6XK7P4UxPFUeKoMdti2hkJ3NsjLoG4oF/DVU6dS9LkkOEGhQNfvArrz/+/eZEPLvT78iP5n75k68g7JvJBquqPkPen39mN6Tox5uTKs5XR0PnDp1CrqYqX4lbi7HbSyzKkb0D6aJM8yioh3jU/Z7s0/Tg94aDs1fEIlKwf5sSH6QdSs7SswkEK/cAqnPSGrFZJ4TUs+y6W5i4u29w53c10uLulq7MnVRqjtJtXMlA9+UA9jhDGgc94/35wo52AJxuhIX0ROcZ7k94e396OJ9bb4XmlMhMFMdCThjRf35CpVh/V1zjrzFyaSAv/zzogDC1pco4itUzjFVHiYsdiyZ79oHsLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(6916009)(4326008)(316002)(66946007)(66476007)(966005)(66556008)(478600001)(6486002)(8936002)(41300700001)(5660300002)(8676002)(4744005)(7416002)(2906002)(31696002)(86362001)(36756003)(38100700002)(2616005)(26005)(6512007)(186003)(53546011)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEM5V0xBTDRMUEdGa0drMm1BZDdDWGhTMmdRSVJFLzFaVEhUQUk1YkYxakhi?=
 =?utf-8?B?TjZtQXRXKzEzelBrOFVPZlZPY2ZmU044QWdQWUtJdVloMVhFeTB1UjVFaWhw?=
 =?utf-8?B?QS9zMTlVbHM5L28wdmNMZHpUTXE0K0VFeFhoUmd5ZmwrNThaY1IzL0JsWk5E?=
 =?utf-8?B?Si82TjR5eUMzZmlHN0dER2dqUm1KS0RnVDVCR2VMVzdwcXhSMVdqR0pvcUE1?=
 =?utf-8?B?RVYwdTFHaDJHam90TnRqUW5sNHRhQWxBNDFRRnRkcWNWUDYwdnpqd2Zqb0hs?=
 =?utf-8?B?b0FWY1U2Kzl5eExhTFhVcVZVL1pJZTl6RVkrMnJ4ZEFac1hGb1czQ1UySVN5?=
 =?utf-8?B?K0VJbE0rVWpWcmtjSHpVeko4MlU5Z0VDNy80T2xjcW5NbU5lUVhpYUt6U0wr?=
 =?utf-8?B?dXVJQTVkTElHV0dOQzZHL3gwVi9MNWpPaW5IcXhJcW12RWc4UEZUZzJSaHJU?=
 =?utf-8?B?a1NxQjB3WVZXakxTZ1lrbEppeXV4b3ZEVC9DS0ZnZE9PWmhqdWlhZUVjRldG?=
 =?utf-8?B?NG9YYTcwaWc0TEdIdVJ2eUZIMDdNRHUwaUxMR1YzSGNrL2Jock1JZVJMWjlY?=
 =?utf-8?B?TkVpbGtDOW1PeExFUTdZZ0UwRnJKTjQ2bEhxbXBjdSt4bDFVcjhSb3ZCaFk0?=
 =?utf-8?B?UWdzSldoRGhrdEducmpBcFNUVGl3NFZETjFGdU5OS2hxVjdyOGRWa0RKQ0Va?=
 =?utf-8?B?ZVpob2x2OXFRdGJUY3hGVkZKZHgrQmIyRzBGN3hldmNPRWZpdk4yQ2p3OUR5?=
 =?utf-8?B?b0c5aG5xZWpyMW5Bb0R2NmZvSytSRldOR1N5elFjUVZ5RUJDaUNHb24rM2hq?=
 =?utf-8?B?c2dsNU9JenNIbEZxSUJXRmttaDhWZ0lETERIWmhnMm1RUVJmd3FEWDl6U1dJ?=
 =?utf-8?B?TU55aWhsa2tPSkwrVzVwb254SzcraFdlSVNtRDAxc1RuRjBHMTRBR0dQNzVa?=
 =?utf-8?B?NnlVRERDcnNqM3YwNll3U1k2UjE3d1JCWnhrVE9Cczh2RXlIY3NSczRVUy9S?=
 =?utf-8?B?SzlQUUVHc3NhaVpiSWRFaGlJeFlLK2R6ajBiYlVZci83UVpHeXlvckw2SzVO?=
 =?utf-8?B?M2YzQ3F1K3M1YnA2b0RMZ3R3aVk3cmpVVDllY0JveGNsaXV2Vk5XdzQwK3c0?=
 =?utf-8?B?M1E3SzF3QU8yK1BzSW50T2JsOTU4S2hCdSt3Mys1NjFQTm9uNllKMVFFcHhn?=
 =?utf-8?B?WHlaSlRCVlBmUSs3V0FzcndZT1ExQ3N4OGFtLy9MWVhDaUI1Qi9PZ1NiMS9Q?=
 =?utf-8?B?cmVDaVZGMmJPRGkzVEJyQXJIN3hHcGU4K3dyakN5TWJIeEdxbzBzMEhIdTFk?=
 =?utf-8?B?MHJtL25PMW54MXVtNFhFY0pHNDZOOGxMckR5N1VacVVFNGcweWh1ZEtERVFp?=
 =?utf-8?B?KzVNNXRReHpxd2p5Si9IUmM2aCtsS05sUlBjREpQQW0rcGlTSnE1RUNNNnVB?=
 =?utf-8?B?QlVNSjYzbWJRQ2d5VFI2WjYxSVJQeGhqd1lJRG0yc2ZiSmpZS3c3L3VsTGc2?=
 =?utf-8?B?UVhMY2VPVStOSXZ1Qk82L3dzK2VCalRyOENFRW5DZkpWL2ZQeXV4U2o1Zk1n?=
 =?utf-8?B?Sm9pY0YzTDRBMkwzVUlvbTNud3RzSm9POVFJanhGVzhJUi83Uld6TURxVEVY?=
 =?utf-8?B?N3R1UlI3ZCt4dk9aaHNTNHhyeUhaWXF2aUtXRWpTTHNjalNZcGo5QUswUUtB?=
 =?utf-8?B?c3I4M2VZU3c5VURzN1RIYjBYdUloelVDSERHaWdaUU1ScXo1dkhkN0FHVmRX?=
 =?utf-8?B?M0JFb241Vi9BMzIzTEVoTWVKd2xjeURDcUV3RnJLM0VBUHhVRko4TStpNkIx?=
 =?utf-8?B?eFBaWmR3aml5bnVlZ2lFTTVwWERuUkFzMW1JNEgzdzV1R3ZhbU1nVk9Selpz?=
 =?utf-8?B?emQwbnM0VjYrc2hWY0RYRlAzNmV6Z25PUFpQQUtHQ296OUt0cGUxMkUzSGR2?=
 =?utf-8?B?SHFqdklpY0FmWUdOOVFYUjFocEdXN2YvUUxPOWprL1JZc2FPcHZ6YWdZTG4x?=
 =?utf-8?B?Y2ZQb0l4SnkwTGxCdm1lNVNYVUVqWWx1RUFhbUJnTzRoUmJNL1NYeFRteHRQ?=
 =?utf-8?B?aERnSms5dnFRWWZueVByUFhYUEJPL0piYUF6SzdiaTl1TWFmL21ma0FYUk1E?=
 =?utf-8?Q?F6P55sdcXlp5rWWqSzpytnMit?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6548d4-4ff3-4d2d-028d-08db3f23d9e6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 09:12:21.6618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKbRSOWOsEq7F/Soot2nDsgaqCAODMg5iljZRJIbkHeKmxwqsVX+l4VWsk4t78t9tpeH2j5saYXD0HyQU01TYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9577

On 13.04.2023 19:37, Ayan Kumar Halder wrote:
> v4 - 1. Dropped "xen/drivers: ns16550: Use paddr_t for io_base/io_size" from the patch series.
> 
> As Jan (jbeulich@suse.com) had pointed out in https://lore.kernel.org/xen-devel/20230321140357.24094-5-ayan.kumar.halder@amd.com/,
> ns16550 driver requires some prior cleanup. Also, ns16550 can be ignored for now
> for the 32-bit paddr support (which is mainly targeted for Arm). I will send out
> separate patches to fix this once the current serie is committed (or in ready to
> commit state). I hope that is fine with Jan ?

Sure - if you don't really need the change right here, I'm happy to see
it come separately later on.

Jan

