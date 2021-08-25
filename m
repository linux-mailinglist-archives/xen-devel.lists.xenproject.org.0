Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568913F76FE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 16:18:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172427.314660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mItix-0004d6-Or; Wed, 25 Aug 2021 14:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172427.314660; Wed, 25 Aug 2021 14:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mItix-0004bJ-L2; Wed, 25 Aug 2021 14:17:51 +0000
Received: by outflank-mailman (input) for mailman id 172427;
 Wed, 25 Aug 2021 14:17:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mItiw-0004bB-GJ
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 14:17:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34dd7fef-0bef-444b-83a8-4235aee24542;
 Wed, 25 Aug 2021 14:17:49 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-tHGfv3ebOv-3Ta2jsoKr3w-1; Wed, 25 Aug 2021 16:17:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Wed, 25 Aug
 2021 14:17:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 14:17:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0003.eurprd09.prod.outlook.com (2603:10a6:102:b7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 14:17:45 +0000
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
X-Inumbo-ID: 34dd7fef-0bef-444b-83a8-4235aee24542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629901068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OMQ7I42U8hswbQpPRboMSivSEatE2pSsX4dCZ+Ai7Fs=;
	b=T7bCp4YFVP/222bHolOJEwXDe8PKozWnq8ruEsi0L45cG7ANF1rpXKue9AQuA3wfVahXfx
	u3pSHVd+WHPy0g0F+/z0veXaXdoB4oN8cYjEKCzQbsaBBDp9TUtsg3eEUXvkfoM8IlaZg/
	zVmepn6psf9Yw2wp6xpQ5IZdf7PMh2k=
X-MC-Unique: tHGfv3ebOv-3Ta2jsoKr3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrEZCpZM1rdDjP5aNScI3NSAOqrm12gw12bWyr4GllP+hcJOnmdoy7dAT1PNkhtN7VHkxFIp0nMP0ZLrQh/BInJQYM6jiFEmxb8bWMqvT1hcTHugeOp8z9VdR2cHKHJ/qg3RrP6ZaURykO1WQ9yaECXgwZTnSn4O+LcCGnXHRIpwKm4CtBDTSFlXX7rgPt4oIN/1r6QzyIguSTN+NxlA179fY8ZfSpBhh9ePu1qCm0CEHHc7AGL06irdB6hKXXzR1ANL4CLRtXFcos0h5cRXmV7YS/7iBq0wtbc+UB7g8mHKOVhdoKNICemrvOv1DU7OWwvmraglPoLbQE6p2e5CaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMQ7I42U8hswbQpPRboMSivSEatE2pSsX4dCZ+Ai7Fs=;
 b=MEuYFAt/FD/C/rGXwQDDZt+2CJjxePsxXWg1ZXtwPd27FjXcsTAEo8JZb+9nu9EjwVO1Gb6jeVo7y63Ld3P/t6Bocm7BIxZ4h9PYvduEIDjbxnTrMZgOVvSaaUwKmJl0PPcqlBqHIbOHzO0NsqQDf4JdU8BIAvsTmNakiEc1JUydnZlttDiJ+hW7Dpz6rEtCy4emlTFS0ESgwOMWselI8O0t6Xsi8rssClcsHR15h1pMYOZGri8gpRGuf6n0TJi+pF/S90Sr6qng0/napPEm9hxF/xwbd4ijLNQZMYEdP4QSV5L4TwumZbSn+Lm8VefxejbaGbde5VVWaYVknMrWhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.14.3
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Message-ID: <243c9ada-6d2e-fba8-2eb5-3fddf53ae7c1@suse.com>
Date: Wed, 25 Aug 2021 16:17:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0003.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71d39911-d447-4711-ae4b-08d967d31c2d
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038B0B6C4CBE50831BFB892B3C69@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hc+YsEROR8uVJvu26mfCjDFjxBzenPAVcqY56GE2s3nhdBf89gIw4YV2nDiDF9aE+MlKy24l5Jc3oCiM/6w705jYy+fbSQ2aXc0t0xAXecKtRqr/poJvthwM4zedbV6X8FuLd54Haezy3Cf7St2h/qYZyp6A9BSz9WWS2oOtPIYOPIMd7cqeDfHLnsjohVWlgChObSOIszwGQ/w9bxsidVTfnlRX11BFe8JR7WBpR5PxVrpXxgPK3UIDglYkPsjMmVXhOK/58RAHQLAn8zYTWq5XXilM3n1oA7r5Ugprc3wjbtU+ibsHdweEHtCIFv+13CtGbqtgoopO5yeyr8KUkuDJ0edngd9CgK253hhVjIUXlJJh0J7k7wAZuqKBPgN4zJAUUao1f/PmARVU4gqDDkRU4zb7gf8Up1IhmHmaEIwK2Si28Ty3TvvIYBbgKM/0O5PpluCgACkdWFyLBv6s5WzXNmdjBweZPsN73fJ+ZHzInGw6j5L6Ky5A1xIs9+xLyG3m1v5cGK3HOHePAu6gkOMaob9u3LZ+99M6eInc7FfF91eyL1Rt91APHj5PpE3EEjXdkKerbt4zHArENPrGsKT7nxe/ScwH3jQgESPNaIi597RZxfnE5vjUth670KNEaCNQGn887jHecmRaUifq1nA/TTEk+FXFdrCHtyoTp3tIGxhJ89Viv1Z2MsUxeq5zKJ8RHjoUzbtRBopgAdzOkZmemHnX1qvFsxwAiu2iDY8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(136003)(346002)(396003)(39860400002)(2906002)(5660300002)(956004)(2616005)(26005)(186003)(36756003)(6486002)(54906003)(66946007)(66476007)(66556008)(86362001)(7116003)(8676002)(8936002)(4326008)(558084003)(38100700002)(316002)(31696002)(16576012)(478600001)(110136005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0EvRVd3Y0dwRUU3Z2xRU1QzcVVaQlpQZUt6Y1ZOYmxGand3RzZwUXoyOUN2?=
 =?utf-8?B?bWtaZFdHcklCdmNwMVc4WnBmTkhuTXRpVXo2c0dEdGpGVHcwRzNxTHg0YUJU?=
 =?utf-8?B?VzF6RFB3YVJuSGtxeW4zUXlMMldEUGpMT1hMK3dReVE0NW9QUHNIT09QQ2pR?=
 =?utf-8?B?UTJob3pmUEZmT0JZbGNjQ0N1VGsybzlkOXFFbHJMODRoakJGVHd3SW5ONm1h?=
 =?utf-8?B?RERmcWx2b1RZSWM5Yi9WZ1VkKzdKcldzT0pGd25BbUd2R1I3YnpiWkNyVWF2?=
 =?utf-8?B?cTBuQm5seXJ4RkZqTTVpbFJHNVJWK3FIRUZNdllvQi9GWjV1NUIrcjFFM2NH?=
 =?utf-8?B?Z0ltdFJRRE9UM3RzYi9YVTVtWUZTbUZjcCt2WkJKZk5ESEhRUThpQ0o4MkJD?=
 =?utf-8?B?ODkzY3ZKOWRSWGtSS1hwbzVITHluV2xUWHZ2cWljcjRSTHFBTzJWb0FBNVBD?=
 =?utf-8?B?amhNeWt2Nkdiakw3NzI3ZXUxNktaYW9MaGNPUmp5Y1ZycnkwK0l3cmRUYkVy?=
 =?utf-8?B?bnRNenNHSzZZVWhSSVNHemF4aTIrZ3Ywc05YS1cvN3JNWEE3VU1KRXFON0VJ?=
 =?utf-8?B?UkRONTNMcWFlNjBIL3AveXlRbkZSK2lvb3hsUjUyOFNWcXRCSzdnOEp5aThh?=
 =?utf-8?B?bGU1cmhBcFlBY1p1bjcyK0dFMWJkQmI0R2t6QUZZTVlUZks4MitiQUh5eDA4?=
 =?utf-8?B?MUE4RHlwOWZWK1BBNmdwTW9DQjBmanpnN2pzOUlyKzZnK3NldUpaeWpzVE1J?=
 =?utf-8?B?cEg4YUFaWmVpNlJoTTNYRXRhZlVQd3Y3cjgrVXkrVEFsV1MvK090RXlYa3g5?=
 =?utf-8?B?dkNQYnB1N0VQbW5uK3Q5SFZEcGc4OThUc3lqUTB5bE5BNSs3R0haZ3ZwWHFV?=
 =?utf-8?B?bzRvdHc3Ykx4WGt0K041Wmk2SWx4cmdCMGM0SHhkbmRMUjRTT0MrenB1WWtw?=
 =?utf-8?B?NGFsUTh1M295cUFzS0JyVzBTVVFoVElsUkpyZ3k3b2FWSDVLTU1WNVF6QXlB?=
 =?utf-8?B?TlJnVGNwQTAwMTJVMkdxSkRLQTRDSk9PTk03TmlOaVpUK3gxRW1PVnY5NFV0?=
 =?utf-8?B?NE5PRmM0cnNkd3F4d2NoYmYrZlJLWDdraFpvRmdOOGFtSHAveDJIWjhrN0Nl?=
 =?utf-8?B?Wkh3aTlwN1BHaXRlMnViVm9nenEybzZRUGJ3UDlWYjFaR2IxT2hYQ3JVV1hW?=
 =?utf-8?B?ZzVpcWt6MUxDNVdJTzVjYmhLdU5LbkFob2VFU2dsT2NYMnhuVEpsSTFQclk3?=
 =?utf-8?B?S2N4OE1rVGdyU0xteTRPRlZrVjlsT2ZnbG5HSjRjbDk3WVAxTkJVeHBTbmk0?=
 =?utf-8?B?OUFwd3p5akdyU292aGljcjArN0tpNTZQMFk3c1NTckdRTjVER1Z1ckorZFRk?=
 =?utf-8?B?a2N6aGJBbHZDZXBiQ2Q3Qk84MjlUNmpCVEp1aVhFem5GZXRJeTV3VlEzYW5l?=
 =?utf-8?B?RHNqaC91Q013dXF0YXUzSzJZb2JMRTJSYWtwWitISjdJaGNCbXpGTTE1dmFt?=
 =?utf-8?B?RTlndGw4cXFUWjl0Ukt6NUtKT2w4MFlHSmN4dXk1VGFSbTNaSnI3MUV2cWRp?=
 =?utf-8?B?cHhzRWxYYzJEWUJWSnczYUpXUEQ3djcyeE5IN0paV0ZSdG5pemtvWGQrYzZm?=
 =?utf-8?B?MnNtOGVtZVcwc2VsVGZ1Mlczdjl0RXlMcy9aMzd2dU11NXU0K3dGdnRORFlD?=
 =?utf-8?B?b254KzZKaDc0TWxhRWkxQXNYYVVFZkVIL3Zaam1qMWtKbWRzVi9nTjJxRlZq?=
 =?utf-8?Q?4iiJ1djMGYAnCvsWJ3N5SVXf/dhnTT78kBmnnJf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d39911-d447-4711-ae4b-08d967d31c2d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:17:45.9811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thNTL2KvaXcd7iLlJoYiQSAWK8NzKgmCntqIoXH2WbCYgsRSTyphKNQYQj0iS4xgRyYkgu2t8ZFILix3ESU9Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

All,

the release is about due; I intend to only wait for XSA-384 to go
public in two weeks time. Please point out backports you find missing
from the respective staging branch, but which you consider relevant.

Jan


