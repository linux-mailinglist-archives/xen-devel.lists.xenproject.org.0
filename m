Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF2D40879F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 10:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185540.334229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPhii-00067D-Rx; Mon, 13 Sep 2021 08:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185540.334229; Mon, 13 Sep 2021 08:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPhii-00065E-O0; Mon, 13 Sep 2021 08:53:44 +0000
Received: by outflank-mailman (input) for mailman id 185540;
 Mon, 13 Sep 2021 08:53:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mPhih-000658-Lm
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 08:53:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 180af408-1470-11ec-b3a5-12813bfff9fa;
 Mon, 13 Sep 2021 08:53:42 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-mbO470eZMXeromEphKVvYw-1; Mon, 13 Sep 2021 10:53:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 08:53:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 08:53:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0010.eurprd02.prod.outlook.com (2603:10a6:208:3e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 08:53:38 +0000
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
X-Inumbo-ID: 180af408-1470-11ec-b3a5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631523221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sYOUrvaKtGeeItpUNzW1+k88uDSJIbM/Tw/CJJL8xag=;
	b=d5y+dZNmJZjTXDxEwD7Hcrh2kBo+HQXfpMiQCNe8riCAfJvzvyQwEUJAUnEgzNBW7xqEHj
	enNDEzTlc6zFptAY8unJyXgtca6jlkKfNHjKNQv0kEPOgsxfN7QEwvkNLtLbpasRoVMk3o
	u7qXGU3GRq32z/dmckcpCSgZVIFx4Gw=
X-MC-Unique: mbO470eZMXeromEphKVvYw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Niw2RSE6fBd/Nsltk64sTexOokLjCJX4y7cvUwWgncjXhXzyDhA5iLOPBiqkvtgKIyCcHrSjlxHN4OBvjD+8GObLrB2kdZnKkpiPResvPZhQjJ1+UOAB3trj6lG5kUlWFatcAVafze3jkaK+ttEbvFhhJpI96ae5r8jOFNXOyO3JhP4db6lX9LOGVpUkMima88r9XYfesg7UH/j2abwD5pXbCl7C9nrjNKdtkpcwtIfmBFUELuiLPoLxyzlH3mi6HsJ6saPa+0Q/O1hD1X4gC/teyye0N+dfQxzCkEwwTsHpHC66RNdrYMAN2OH6TvD3iRRFIWe6hLMQuhwmI62LCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=sYOUrvaKtGeeItpUNzW1+k88uDSJIbM/Tw/CJJL8xag=;
 b=bW9MzRmDwza7a3KY++L3+VhAx7Q7+PjT1Mvneoc4IO6OtqHeBTJnIHCQ+dIA5+CO+XNv1/GPfvf/fV2pxY24audF5ajDO1L8TRJFX9cq7IKMM77WBNrXB01uFedIN1TgCZXCaV+J5l09nTiQcZGf0mVNVbIPAduXOozjEflNkLpW/rsLaEtKm3JlVaDSMUV5rT8sD8Z+w0pk8HtgI2C+HcxQRR5e7IyYxFiT81nhmNIjiiRI7ySlWZ05zoqyS6bYgWbEKXLpf5p3DCzTE+6EHyiDBrkFC69mX+I94Fw+EdHdVc4M8bK4R8aNFDfocJRHi7rwt9wSOGKyI7YxU0NJZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/mm: XENMEM_{get,set}_pod_target handling adjustments
Message-ID: <ff324215-ccad-bb05-e36e-d711ff7c960f@suse.com>
Date: Mon, 13 Sep 2021 10:53:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0010.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d223862b-47b7-4a91-a9e3-08d97693fa8d
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038263569A8BF4834A941F7B3D99@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LzEqn5jnSWEWuS1Q8jVjRk6k4CFpDGGDpEYNHJQ66bXZ6Mq7KNusPHXR/vN0zBWHbrCrSaWXi8sPslvgptdG6xMpMrHEMxgFhlsxK/94RjNKnkJ3jOPXTH4ei41k7dLIFp+U6+7EG01vGL0DSHdt/B372xqdVt+ZShi9FxTetUueOy1z6pV3e6zXJGxj4LduH3UmDjC2WYjqkfjEq8ug34USmKmnzcrgC/6X+PboIzKLPM/+V+BzmHmrelV6na6DneyX2uLQNqCYanR8cvMrqGDoohMqmQMzKjTc/iG+Q93RP40+mHRYmIZoxnHM+UGLZ+yj8fkhTyKzLojhyJsX4IJRHEt6Bkv4MhMwUf4Cw6uw35nTpXqDFPobRzUp1w1Qs5U5KLQYPZYw0xIevSmr2WHrj2wRWduCEsh8ybKU0SOLSg79X189hvaQcBrf+e44/BCOaJHs7Qfx+wDg9hpDo5gzrTWIE+SYvmKLgMB0tH/OQyjsqPE51VB0i3OT+J2OzdjbBL3QrsfAUV/LS/8KshYqmTXgwm4dzUjXuhjYQb3xO2glflpQUDK/LWUVnUgxn6pg1Hp68qEm39T72ZS/vsmCVzKube8t9hXysSp1/vbwQaSniGiYB/DHhdr6LdJHtuK8KU4zJqerqK8ylhFFiPD7WDBxCWuJvibdGcSR6MgmssrcDRyGIflxzEcBZ99yehtwqBcBgopsiqtRp+nJZO/ubtwRYR0w7B362+rkA/Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39860400002)(396003)(136003)(376002)(86362001)(956004)(31696002)(316002)(5660300002)(31686004)(186003)(558084003)(2906002)(54906003)(6666004)(4326008)(478600001)(2616005)(26005)(66556008)(66476007)(8676002)(6486002)(38100700002)(36756003)(66946007)(8936002)(6916009)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXo2Z3lxd1B1KzN6b3BtVGE5RFlmTzBmL3FRaktEem5ya2s2ZWliOThwTkJX?=
 =?utf-8?B?TGIyN1FWY1ptR2pnRWJDUmhTMlQyY25CSHhFeUhkeHlFcVBWQUlNZm1rSW1X?=
 =?utf-8?B?UlJVcWhzcmtNU04zUFh1cEJCQ1RERXJCaHFSdSttSW9sZnYxbDI4Zklsd3hi?=
 =?utf-8?B?T1lWaDZCT1gxcFRsL1JUZlYwSGhjS29KcVl6WGM3ZkNxR1dKYnA1M1hvSWc3?=
 =?utf-8?B?V0JBYjU2SXlZNHFiLzhYNnNXT3lzd2M3QjBYdEExQXMxWVp2cllhVmVabGp4?=
 =?utf-8?B?eWlZM1gzZmlZcHZhSGY0cHkzdDZSNmxaZTRTSmhYUzR4NDBwMHFXRWhFYjlj?=
 =?utf-8?B?Z3dVdGZpKzFHdURMSWxuc0ZMOHRscXdURWlnVkF2VUV6dWdRTnpwMzNlRS83?=
 =?utf-8?B?aFc2UTdkQkR2YnhhYW9ocU9YaFdPbjFSZ29SaDRGNnlYMExrZi9wRndseWp1?=
 =?utf-8?B?RWNralFiVjYvUFVlOWdmeWYrMkNCUGxlYjBXQWZnZ2daTFd2NklVSWRSZmdP?=
 =?utf-8?B?eENhNjAzb1FJc1ozWm5xdUMzWjFSZ01ZbUUzcWRkNFQ3M09HdnMzMzBMM3ZO?=
 =?utf-8?B?a2U4NlNiVTVPRllzK0ZwRTZ3ajlhMEpkaTdlUUNuK2FreHROWG5RMjl1M2Fw?=
 =?utf-8?B?SGROZmhFTHAyK0F6WW5VcnVZaXUzeVBYT1ZpbEVsVnhUZWNiZFlYRVBaOGo1?=
 =?utf-8?B?YzZzM2VRT0hFOGpaVXpPTysybUdWQVB0aDdiMHUrWlp0TGxzRXRSbmU5U2lm?=
 =?utf-8?B?TU5adFpMdTVTY2QrK1FHc085VXNuaW5XSWFhcmlpVDBsSWpTamg5UkNsZFlk?=
 =?utf-8?B?SjFsWlhML3g4ZnpaV3JXWDNLNW9mVzBSNWs5RElETGlOaGZvR1JUSW1BYUUw?=
 =?utf-8?B?Y2UweXFQd0ZIZW12VG5YR0ZQaHg1QnZ6Y1pFbDVZeEVBMlk5cXhwNEJ1ejNL?=
 =?utf-8?B?SG9ieHlXaXppSXVXdE9UVzVjMFhuazhZS2MzalZxRzhPenllSEMwZ1kvZGdT?=
 =?utf-8?B?RGNSRWRJN09Eck1FTWRwaG4vbmhHaWhlTUphM2wxbTMwV25HTHExTllXTkVI?=
 =?utf-8?B?NGhEOVBKaWlYV1JRQitQekdydXFuajdkMWpMZXZKUDJ6bTJGUExLY2tFb3pM?=
 =?utf-8?B?RlA0bm9Yc3FaSTRlV01VMWU4SDdoNlltRnZnOGVlamFqaVJYVzNOZmVuYVor?=
 =?utf-8?B?SitadTJpQlVuRzFKcE90SVRwZUtDQkpuTjFqZ3lYaHEwb1h3NFU5ZHFLSGNj?=
 =?utf-8?B?WXhLUC9vZzNKd1o2TWZ5cDhPais5UkZJUTNyQ3Z6OS9VQVo5WG1XVFY3bVNr?=
 =?utf-8?B?bDZTZFpadDYzQmppYm9YWEVJQjBSendVUlU5a0xGdStqVHlFczFyWHNna200?=
 =?utf-8?B?Wmh6MzdZMUt4QkpEdGRhYTdQQWQwQUhoQy9vUyttWU1ENVVhaUtsQm0vdTRk?=
 =?utf-8?B?eTBqQXRqeTZyVUZUOEEyQ2dmSkhCdk5YRldiaFdlZUNPTWhZM0JFZ2RrcC83?=
 =?utf-8?B?ckdmMnNkbDZsb0JjM1JPYm83Z2l4cUswcDc3TmpZSUxUUW5naldSd3NFMnhP?=
 =?utf-8?B?WU5Za29NQUNtQVlTMUFQc09GL1MrbGZER3V4bEhHTXpxVktwZzlrL01ZZTdY?=
 =?utf-8?B?TGxaWlZDUm5YQ3l0MjNaUmJPQzc0ZVNGSzE0NlJRYU5pQVVNbEUxc3A0a0ht?=
 =?utf-8?B?TElobzlEdTllZUt2M3dYbGg4RmplTkptVkJTMTJqYnNCMHRPRTlqeVBtQTho?=
 =?utf-8?Q?dkgmbfcuql9YIC4u4G6xGA63x+Cs3gwL9f+Njtj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d223862b-47b7-4a91-a9e3-08d97693fa8d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 08:53:38.6413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okKeK1fJK4qhSWntu26FzDpG1j082XOkHIu0Hfcyg7ZzRrjmcU/KmsEPAlnss1oau5jBm+ESxufS7xErr73IGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

In the context of PCI pass-through I came to look at this code again,
while considering whether it might be usable for an issue there (which
I'll send separate mail about).

1: XENMEM_{get,set}_pod_target are restricted to HVM domains
2: tidy XENMEM_{get,set}_pod_target handling

Jan


