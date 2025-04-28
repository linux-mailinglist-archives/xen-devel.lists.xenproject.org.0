Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0193EA9EF0D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 13:27:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970552.1359213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9MdG-0004I3-Kf; Mon, 28 Apr 2025 11:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970552.1359213; Mon, 28 Apr 2025 11:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9MdG-0004Fh-Gu; Mon, 28 Apr 2025 11:26:42 +0000
Received: by outflank-mailman (input) for mailman id 970552;
 Mon, 28 Apr 2025 11:26:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVu+=XO=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u9MdE-0004Fb-H7
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 11:26:40 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a63ac8ee-2423-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 13:26:38 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB7040.eurprd03.prod.outlook.com
 (2603:10a6:102:ee::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:26:36 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8678.027; Mon, 28 Apr 2025
 11:26:36 +0000
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
X-Inumbo-ID: a63ac8ee-2423-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTzdWJg+X4OmxfAyAhHyLFmjZqwNP8Y2QDdLMHgteQuua+vNEttX8WBYvfrO5YcZWRCpSZRSh1D4/M1ZJg2F2SUBxVmEcDS0Su+S+woLrgR2vWj6VHDAR04rE3vi+YwmRlkjalvt856fEG3uiL1vzOjeq8W9rLkTzATxudiJj/SInyNMUFEPfItD2NWJ5m6SHd9qVXMGV5NN7eFslH4ETHx28Oe8lrcP/tLmtqzxzDeokx3IEPM9KvJmKLZQyABMjH9lyGOCK1zl9NWwcDb9bvd6tIAHHDz3lvdW5Qwd4t+A4nCO4d5v+SpA+VT9hppVfDAQRB6PId/Bl/ZIqbjrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWTZUHTUNSksE3Mi3uAag9yO7rRK5QRgVVSak58N4lE=;
 b=IWF7aRJCokG60oroNN5g9HrBQGxQ/bRFzW43OZs95tXQZubnB/BZbutXSEoGN1fyt4MKH/mnOdGAHImmFs3ms1vFeWWh2qzYGIpOnCMO4gQH+GIwA8hygOtXR24UWbTSDKEqfkFlkKRWMAh8jCV0woplgiy5o578XvpgDeAUaG1XsAPgHASFc76I9vF9s9hf821RIib/o2VcMqsUyYk0GfV2zC3gIgqVSyjeXOx9y/dd1SemIBM5LJm2RXmrBCQGXzBjOjRBPeqraUj3y/xCUiu7D0wFIDX8U+Db4g+eNlO3MM6tfbPDWHzk+iNfOpKOjlGy7YDeKH8ikZz/taxERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWTZUHTUNSksE3Mi3uAag9yO7rRK5QRgVVSak58N4lE=;
 b=hSFcGNsut+crjbPKyDugVYr9nd3xyB+3dr5CRSwypIJKn+WETaLJysxAwlmpclDgBP9Sph1LSTZw5sNzad/zFri/l/qQL2Evrq0Mk40YVyAEfTO9ZfM75IQDSfgf7GxkAmV667aq7kzh1l870s36gbwE5Tfv8174rXr1R6UzyHs5j5QH0om6Uj3OEa8Bv53LJMiQJyuqeQBKx3Wl6M6WrXf7/Gkgj3ykp9XqbkRjmzMFU8ZdqPiWghVeU05loT7I2nYnCzm9durJ+1hen+IfFhmEdDtT3/2ZKzPPSCAsgrdD3Z3SAIKheUfLYQgspgu1gg7nXS5qaiFLknaeYAiwKA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHblOXdxbIbbkNtn0WSg/9tW2OJ47N3cuWAgEGQWoCAAAswgIAAKJGA
Date: Mon, 28 Apr 2025 11:26:36 +0000
Message-ID: <4b5c5c57-2d7a-41ef-8ab8-caf9f2593b2c@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
 <7fa0bde7-3aa9-48f4-a0ed-d03216edcc4e@suse.com>
 <c33b906f-f9cb-45e5-ac84-28dc687a6f7a@epam.com>
 <b4baad49-f751-42e6-9785-6d71aac3ebc3@suse.com>
In-Reply-To: <b4baad49-f751-42e6-9785-6d71aac3ebc3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB7040:EE_
x-ms-office365-filtering-correlation-id: be8cbbc4-82a1-4da7-f4a2-08dd86478974
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cXVKVGRpRXlCT3Y2dTlSamNQK0RKcWsvWk5IUHArUXVILzlwbWxxcmw2MHdX?=
 =?utf-8?B?T1R6NkdLakN1cyttTmdxTWhLQTZyYjBBNHFZUVdaZEVFeFZ3NDBFdTJuNGZP?=
 =?utf-8?B?SlVhTEJBYmZ0V3c3UTQ2RmEzWEswTVJzTUZBV1Fta0ZZdXFVQUlwK2VCdHlu?=
 =?utf-8?B?R3VRZFRxSG1yRjZ6QUNIL0MwcUNaUm5QampxTFZGRW1yNDhBK2VMcFNZQ2Zu?=
 =?utf-8?B?MnBjRUJXc1VPQlo5TTI2WU5wM0RSNUhoRnFMbkVwZERPNkk1bWZEME5lOGRw?=
 =?utf-8?B?RkNsNDlXakNqVUY4V3pKMlRIV2RaSU0zd1drUVl4d1ZtTUVwQ0Vxb0Z6eE9Z?=
 =?utf-8?B?YTVISmgweGtVU0o3eHB1RkQ1VkM4V1dnRXg3MFdmRHR2NVdkbTAraXVRZis5?=
 =?utf-8?B?RysxelpjSU1Za1duak53MFJZbFcyL2RxNGpCVXp5OEczakg0VjdKb3VVUWRh?=
 =?utf-8?B?VXlGNHo5RFFJT3lMNy8vVnNJSW1oZHZOOTBwQzhxeno4YTI4SVNhWWFUZzMv?=
 =?utf-8?B?NjVsWVpiWVBjOWl3c2hFRHNvYTRJSTVoSzdCUTRlRlc0ZDJGSmhGbnpMaVZZ?=
 =?utf-8?B?c3NFMzVHR3djRjRkT0ZpRk1vNmNjSWM2UFNDeW9wZlQ3TXhLUzBSTENFSXlm?=
 =?utf-8?B?T0tqell5L2dYTWxCcXZQUVpGY0xhZCtJbElrUnNNakE2aU1rR3ZOQmpUYmpp?=
 =?utf-8?B?bTZLeHF6M0hqVDFyanR3cktUckVOMmJmTkp4S1N5TWNIOHlSL3RmV29rL2g2?=
 =?utf-8?B?VmpxcGxvZFdSa0Y3b1ZMYXNnc1F3QXZlclNrbTFoZU1HY3J4ektuc0NwZkVH?=
 =?utf-8?B?VFJzMnZxVWN1RFVENDF4WmR4NkpFOGR6bWZZL3dVdFBFZmxCL0FBa3lxS2Fp?=
 =?utf-8?B?cnRSMGdjYWUwczhQU0o0ZzNhNDBsSWNpUjhueGp1V2k5T2k2VC8xVzFIdnN4?=
 =?utf-8?B?a2dYSm13S1dlZmhwNHpWcmJ2WHRxQkg3cFhEMHlSOENUeGlNdExJVDg2SGlk?=
 =?utf-8?B?aTdBZlY4Tnl0YWVWNitaZitrbldYMmNIVWpzdHBkcnQ3UzEvVllkWlVEcUVw?=
 =?utf-8?B?WnNrSW9mbytKVmF2VkwwVGg2ZzE0aUtxbFdaU2xBMmovVUVhd3YvVFN6MjF2?=
 =?utf-8?B?WTdpc05GZXhsWEZDMSt1NFpTTXBlYkpYdE40WlBxUDE3bWl2Uy9sdXFJNlhM?=
 =?utf-8?B?YnN2VjJTeW84amU1MmdlMWhxZEw5YXdkVmhHQ28xSngxSjNrbEhBb2JZNzFG?=
 =?utf-8?B?R0JpbWtnZisvVVAzVWlGRDZHY0ZITFozRVVPRWM5UUhjd2t0U0NDVk9lMDl2?=
 =?utf-8?B?Y3lIekFicUFFVzdTOGJUdzg3aHpNdHhDN3pBY1c0L3Zld3dHWU9FeTlocDFW?=
 =?utf-8?B?RUpLUWEyenlqTTUwWmZMNjY2SDdxNFlpd3hXa3J3c2JkTFBQamRhUlNIaTRk?=
 =?utf-8?B?WDZNWTNsUThDQ0pPMzF5RFNsVENFRE51aFIwcXoxSm9JMnlZUFdTSVhMRXJQ?=
 =?utf-8?B?ZEN4dVR6NlVtUDBBT2x2alh0SkJ2SXF5a0tHZjNERnpvUHVZK1JnZW14UWMx?=
 =?utf-8?B?b0U0Smw2ak4rOXNuNXJzUWJ4MlFFOWJGaWUrd3ZMOVg3cXlxb1VwSEl4TnZG?=
 =?utf-8?B?My81N1IzODlzWDZOeHVDZURpTHBSdU9PYUdlckRhTC83ZGNGenQ1dlVYVW1n?=
 =?utf-8?B?UFFDbXVqQWFseTZTT2xVK1lQcVkyaU96bE4rNUIyb1RyakpTSWFqcjJCWjRB?=
 =?utf-8?B?d1NYeklVbDUzamxTeG9vYnMxWVZ0NE5kbHN4ZUFoQ0oyZ2VBN1BkOFNZbDVX?=
 =?utf-8?B?ajZGQUZTUnJ4WHpEK2lVRUY5aG16a0krZmloYnhyNmlMOGNLM1hoOXBMeUh5?=
 =?utf-8?B?aVR4MnM1SFdjY1pZeDhxY0RkQWxUMXRucXJSdzNnTUVac0hxTDVCVm9SMmhE?=
 =?utf-8?B?ZW9reUhYZjN6Q1o4V1JBM2xzeFBVWWcraTU3OTFOa0NWVTdIUUE3czVLVEFn?=
 =?utf-8?B?cWYyWDNNYi9BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGlNKy9kUzdsRy9mUWpxaTdqbTZDRlc0QkxiUlprVHdCbkUvUDBsRlk4OUxk?=
 =?utf-8?B?V1VHYVlFT1BZWlVPL3EvVzVMWEQyM2ticGpVdlM4cEcyYjVFU1JoTlJQSFBQ?=
 =?utf-8?B?c0Zsam9yOEZZdmlBenRVcEgzWjg3cEZnZTJJWjBwcEZPck0xdU5uTjVvczVl?=
 =?utf-8?B?OVlpZ0hUY1pCT090SUhXKzZhNnJrZnliZGY4NW9TaTlhNjFBcklOWWFQOEpV?=
 =?utf-8?B?TTRBcFYxZTNsTmR1RCs1R25WSFZaenRjUUZmTEduYW9zektxTDRzUXlyWVJh?=
 =?utf-8?B?NE5HRWlSZzhPcFZNQWsyWVUrOTVMUlphdGN3RkVVQWwvMGdWc2JpL2FZN2kw?=
 =?utf-8?B?a2ZMeWJ1T1R1UnVuV2pJcTUwbm5uQ3VXb3dZcDM4eUFuSGYwTGZPVUNEZ0lC?=
 =?utf-8?B?MFJQemNpeEdIcnhsRmFSbVVVT2ZHMXJTZlFUU1VCOGd0OUdCcVBUZllqQ0dD?=
 =?utf-8?B?aFBzVGdienB6QjZXYVpPeHVkRGU5N21hclA5R0lWVHFFUm02R0F2ZTVRSlU5?=
 =?utf-8?B?T3gwamRVUnpIWERadlJaVXRPU2doS0dYanBTVlJzNjJjS1ovTjJMUDVUWjd0?=
 =?utf-8?B?bEo4eGViTDRBMWt6TkJDdFAzdHNTSUkzMjFnOVEveDZzSE5sWlJIWFdJeHRK?=
 =?utf-8?B?UzlQNHNrK0drVWoyKzY3YUFGY0xUdVlnbGpjNWdvQmlrMVcwMnVKcFdnY0FC?=
 =?utf-8?B?MWdYZ2hocmFmczdSd09sNzczTHh0ekdiUW5OMjN2RjNscWhIMW9sZVV0WVFY?=
 =?utf-8?B?cisxR0ZOMkNIT2dKQ0R3Wkk0eWY2SEdta3FNbGdCMGJaTzBsYTIvNWp6OTE4?=
 =?utf-8?B?RXJ1d0tZQ01nVHFrUjBKMnE2dHo4aUlpMlBxdTN2VUVmR05yclJBL3J1WVBO?=
 =?utf-8?B?cnRCaGVjU1NENVMxZ3RVYzE2anp4YUx6eTV0L1EwTzdUUmUreGJYei8yc2VN?=
 =?utf-8?B?STJoT0ZPZGNhb1kvbkw5OVJodUhRMndFVGxVc1Z5U2hFQ1FHWXpTNHk4UUJR?=
 =?utf-8?B?enpKMDVRQWwyaW02dkRrVkdEVnpNMHl1QjJOMk9GWHdvZTR2T2E2NEJONTBD?=
 =?utf-8?B?Rlh6Z1c5RVpBK1lxM2JucVpkR3VjUFBKc2gxY2lXZDVxUHlxUk54NEcySHQr?=
 =?utf-8?B?WHdveFZuMExLZDNwaXQwcnYvQUROOUtKSkxkcUQ5UytnT3FOdjNRVExYNjYv?=
 =?utf-8?B?cmxnelYzQnB6SHBVNUJyeFN1aDlFVDl0SEhIN2U5VmhzUHZQUm9RQ2loSU91?=
 =?utf-8?B?SHFwVHRqYThNQUhRb1NjNGsybHJMTVY1WU5oMndORENGNDF3RnZSV3hhSVdY?=
 =?utf-8?B?cG81ek13dUFkUFJPSGdLMG5jWjJidzNwNUFwN2llSW9LN0tUTGJUMThINlRt?=
 =?utf-8?B?Z1ZDMXRZeEhYdjJ2cFM0bmQxOFh5NHVBY1J5UFA4K2hNQlRjcm1rQW1KNUZY?=
 =?utf-8?B?SVJWdnZDK0tma2NPZjlKZUNGbUd2Ujl1ZWhPZkwyZC9HV2cxcWdORHd6Qm1t?=
 =?utf-8?B?cDAzMFNhN01DQURrQmFKU1gwV1lTeWlWd1RMbjFrdzdvc3dqT0JnVFd2Y2hH?=
 =?utf-8?B?cU9KN0VsSjFnNVF0aGdwSVJjeXQzT05KblVza0xWWmdFejJSNnhHVVBSK0Ey?=
 =?utf-8?B?Si80VC9mZ0tUbTN3MnBBUlMrYW9vMzNMOC9IT2s5UUJHS29Takt5aWNYNUwx?=
 =?utf-8?B?MjVJUzRaL0doZHFmdUdFMXczTFBqV29VVFlBZytMa05tV05sM1RYVU9tUzBL?=
 =?utf-8?B?NmVPK245eXlIVmVTbmRDNUwrQkNYcGZSQXJIY3RzcmNPNWJQSWNQUWlJaXIx?=
 =?utf-8?B?dFZmYmtqdmtWUDI5SmVEd1lvMWhWT0JKbDBEWHVVWDNjQ05rQnVzL2g5RWVq?=
 =?utf-8?B?bi9yTFhaYklFdUF2bURqSDdWL2U3ZWd0WWUrSVQzVklQK1dlMytTY3V5eDRC?=
 =?utf-8?B?cEsyV1dzT3JaQzVNeGdVLzY0SWFoZkJzM1BxTUh2cnZCeUhjeEFWOU0yeFlP?=
 =?utf-8?B?V3JGeVBpSXpDaXdiY1A5TTVCVXdEeHNPY09XQ09JZXBzbmg4TTdUYVlndkRS?=
 =?utf-8?B?Wm5TMWhWNFFUWHA3SXF5SzhqUWpYTXVkZ0xkbmoyR2p1Z2tSNkpkOHdiRU95?=
 =?utf-8?B?Y1NRUGVPKzc3ek90b1VCWldvbytxbDRVRUR6MWh2TXRQd3pVeTdicm1oMUFj?=
 =?utf-8?B?R0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A5E1E8380321E4CA9F3D082A36103FF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be8cbbc4-82a1-4da7-f4a2-08dd86478974
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 11:26:36.3264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GxyCdFE4oFs8WwAXVbRgXEyfiQD1VTAWRf1XntT/KzkoIIeJXVDMNIL8A02nWnybaj1jPcNI+lOavMG/kqu20Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7040

T24gMjguMDQuMjUgMTI6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOC4wNC4yMDI1IDEw
OjIxLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IE9uIDE3LjAzLjI1IDE3OjA3LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNC4wMy4yMDI1IDE0OjM0LCBNeWt5dGEgUG90dXJhaSB3cm90
ZToNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3BjaS9wY2kuYw0KPj4+PiArKysgYi94ZW4vYXJj
aC9hcm0vcGNpL3BjaS5jDQo+Pj4+IEBAIC0xNiw5ICsxNiwxOCBAQA0KPj4+PiAgICAjaW5jbHVk
ZSA8eGVuL2RldmljZV90cmVlLmg+DQo+Pj4+ICAgICNpbmNsdWRlIDx4ZW4vZXJybm8uaD4NCj4+
Pj4gICAgI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+Pj4+ICsjaW5jbHVkZSA8eGVuL2lvbW11Lmg+
DQo+Pj4+ICAgICNpbmNsdWRlIDx4ZW4vcGFyYW0uaD4NCj4+Pj4gICAgI2luY2x1ZGUgPHhlbi9w
Y2kuaD4NCj4+Pj4gICAgDQo+Pj4+ICtib29sIGlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKGJv
b2wgZG9tMCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBpZiAoIGRvbTAgKQ0KPj4+PiArICAgICAgICBy
ZXR1cm4gcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQgfHwgaW9tbXVfZW5hYmxlZDsNCj4+Pg0KPj4+
IEFzIEkgdGhpbmsgSSBzYWlkIGJlZm9yZSAtIHRoZSBmdW5jdGlvbidzIG5hbWUgbm93IG5vIGxv
bmdlciBleHByZXNzZXMNCj4+PiB3aGF0IGl0IHJlYWxseSBjaGVja3MuIFRoYXQgKGltbyBoZWF2
aWx5KSBtaXNsZWFkaW5nIGF0IHRoZSB1c2Ugc2l0ZXMNCj4+PiBvZiB0aGlzIGZ1bmN0aW9uLg0K
Pj4NCj4+IEkndmUgc3BlbnQgc29tZSBtb3JlIHRpbWUgdGhpbmtpbmcgYWJvdXQgaG93IHRvIGJl
dHRlciBkZWFsIHdpdGggdGhpcy4NCj4+IEluIHRoZSBlbmQsIEkgdGhpbmsgeW91ciBlYXJsaWVy
IHN1Z2dlc3Rpb24gYWJvdXQgaW50cm9kdWNpbmcgYSBuZXcgYXJjaA0KPj4gc3BlY2lmaWMgZnVu
Y3Rpb24gaXMgdGhlIGJlc3QgYXBwcm9hY2gsIGJ1dCBJIHdhbnQgdG8gYWdyZWUgb24gdGhlDQo+
PiBuYW1pbmcgYmVmb3JlIHNlbmRpbmcgbmV3IHBhdGNoZXMuIFdvdWxkICJhcmNoX3JlcXVpcmVz
X3BjaV9waHlzZGV2IiBiZQ0KPj4gYW4gYXBwcm9wcmlhdGUgbmFtZSBpbiB5b3VyIG9waW5pb24/
DQo+Pg0KPj4gQXQgdGhlIGNhbGwgc2l0ZXMgaXQgd2lsbCBsb29rIGxpa2UgdGhpczoNCj4+ICAg
ICAgIGNhc2UgUEhZU0RFVk9QX3BjaV9kZXZpY2VfcmVtb3ZlOiB7DQo+PiAgICAgICAgICAgc3Ry
dWN0IHBoeXNkZXZfcGNpX2RldmljZSBkZXY7DQo+Pg0KPj4gICAgICAgICAgIGlmICggIWlzX3Bj
aV9wYXNzdGhyb3VnaF9lbmFibGVkKCkgJiYgIWFyY2hfcmVxdWlyZXNfcGNpX3BoeXNkZXYoKSkN
Cj4+ICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiANCj4gVGhlcmUgYXJlIHNl
dmVyYWwgcXVlc3Rpb25zIHRoYXQgYWZmZWN0IG5hbWluZzogSXMgaXQgcmVhbGx5ICJyZXF1aXJl
cyI/IElzDQo+IGl0IHJlYWxseSBhbGwgUENJLXJlbGF0ZWQgcGh5c2Rldm9wcz8gSXMgdGhlIG9y
ZGVyaW5nIG9mIG5hbWluZyBlbGVtZW50cyBpbg0KPiBsaW5lIHdpdGggd2hhdCB3ZSB1c2UgZWxz
ZXdoZXJlIChhcmNoXyBmaXJzdCBpcywgYnV0IHBlcmhhcHMgZWl0aGVyIHBjaSBvcg0KPiBwaHlz
ZGV2b3Agd2FudHMgdG8gbW92ZSBlYXJsaWVyKT8NCj4gDQo+IEphbg0KDQpJIHVuZGVyc3RhbmQg
dGhlIGlzc3VlIHdpdGggdGhlIG9yZGVyaW5nLCB3aWxsIA0KImFyY2hfcGNpX3JlcXVpcmVzX3Bo
eXNkZXZfb3BzIiBvciAiYXJjaF9waHlzZGV2X3BjaV91cGRhdGVfcmVxdWlyZWQiIGJlIA0KYmV0
dGVyPyBSZWdhcmRpbmcgdGhlIHNwZWNpZmljIG9wcywgb25seSBhZGQvcmVtb3ZlIGFyZSBuZWVk
ZWQsIGJ1dCBJIGFtIA0Kbm90IHN1cmUgaG93IHRvIGVsZWdhbnRseSBlbmNvZGUgdGhpcyBpbiB0
aGUgbmFtZS4gTWF5YmUgeW91IGNhbiBzdWdnZXN0IA0Kc29tZXRoaW5nIGJldHRlciBpZiB5b3Ug
aGF2ZSBzb21ldGhpbmcgc3BlY2lmaWMgaW4gbWluZD8NCg0KLS0gDQpNeWt5dGE=

