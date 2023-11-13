Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D08D7EA182
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 17:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631841.985545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2a8e-000068-C3; Mon, 13 Nov 2023 16:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631841.985545; Mon, 13 Nov 2023 16:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2a8e-0008V5-8O; Mon, 13 Nov 2023 16:50:16 +0000
Received: by outflank-mailman (input) for mailman id 631841;
 Mon, 13 Nov 2023 16:50:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2a8d-0008Uz-9q
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 16:50:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b60c5c7c-8244-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 17:50:14 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7041.eurprd04.prod.outlook.com (2603:10a6:208:19a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.16; Mon, 13 Nov
 2023 16:50:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 16:50:09 +0000
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
X-Inumbo-ID: b60c5c7c-8244-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWkeg1zBlThcuBhgXLfaZGxFzQwbfHO2ckEKyZB6dYGoVOjC4XHpkQQU4Bv3o6x31Zj7Ljj3g5Hfhey4VDDfOctwX9ZTd91l4GK+IEeAE5FDdFVIumVPcJGDIjH03O40FKXsQPSOtWdH0oyWly6qACklyuiLbqBogTEcsB9PL0W4894ml7I0FpPll85HStSr8t0kIquh6bkHJQWLWyo4pJd5KyPussDfXy0KyB3U4b0xI0tm1jSWMK+tomKq0/4ntJGQ0XAK66BFyuiio42MPG7DOQwHvVmMIe/uP3KuOSzPW6FCQ3tv5p9SGNwlwVpa4tZIsLosrXi5N8zUzHrOfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHjmLObWLGFwaZdMAQ9/KVKzbnJ/JHXH6OO8GhFJAYM=;
 b=Ig7tmz4CN8pragA3MPhzBI4iOUDYqaDGfry5x1lmbRllB90rI8Xfe3i2aUC6JcaW3iLN+67ra9fQ9fQFy9kW7pBFtFsBnzQ6vWhM78Kq5396Xhq8Vb+/cb95jMNDfR+NyQ7Lk61H02n195ERoxxLJltTB4FFrqCTqD3//HlvGtmE21lw89w/Z2et0ifB27UwlPZkrP7ME5ozQf8qNkaINPdBlorcEdDUp9vDh0jAvHp7LPgVEW1SjApilTelrrMntWBPZ3BT8xK00BGfbM5Ez/uxb18sXR5U4GogxGSeXuXfjBfn/OqgOz/V529sLYRjkpA9bTQJcsydbsONA3ROnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHjmLObWLGFwaZdMAQ9/KVKzbnJ/JHXH6OO8GhFJAYM=;
 b=Nr1FJ6hgE5eOcLjkxyC0b9G1wbmslF4qYFLCv3Qczgtr0vxl8b3dxGDIUmEbeC8F2FKbQDhdQ6ybRApyG/njv+D96j3W3LNP9biFhQe5IBXp9rssUdU2wQEtpVICd8L+NXUTQxVqtVk+0RKzKABkeYVg+LZo+WQwx9dqjOFtn9Phfpqi0wNjFZCFXxei1Obn7q4IxHnUbbz5f8x6XppJBkXcK1Wb0SIHankqhTtjUbeJ+pbsc8LcF1Uz4BdSWQyEywD7K1ilGc3X3/x+Sxw2Y1wZwaovoY1nKvWMl+cm9ZoUMLqiU+GELaNbhxVFUh2csTNzVcNYQEleh4yvPbM55w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08f5852a-5888-e82f-ca64-fe268f60c949@suse.com>
Date: Mon, 13 Nov 2023 17:50:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 04/15] xen/asm-generic: introduce generic hypercall.h
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
 <87a6f7a2135361ad231bfc0cfc2d73ca78c357a3.1699633310.git.oleksii.kurochko@gmail.com>
 <e7cd2613-7af9-bfae-fb75-85d3bc2f3caf@suse.com>
In-Reply-To: <e7cd2613-7af9-bfae-fb75-85d3bc2f3caf@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0445.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7041:EE_
X-MS-Office365-Filtering-Correlation-Id: 084c3545-f42a-4f30-b51f-08dbe468988b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CdVloutkHGq3VURxJdgUHkQv5+SjkDWygq5bz57ZBEdIYuNjQHljSKgNj4llWUadZJn91rGwRAXiks+7D9vNiK2LDg4NSK7R4k3fGtIaIG+cgXsC5AbjEeu413DeaJUmjlWSXPDHU+IeE/Tbv/mqj7gH/ESJP7Ebo+jfVgesVeozQaoBD9YwCLNNVl8o7ejsCRsGlA81aUN1oMjxN64u68+3BAwzKKzDkfpWmADa77BRWmPUZVl5J90PZ62UvqghLj/CGdE6XJIbmB4Dxk0wLYAM39q79HbTbitjlkYv1m5kKqvpBieM594m4ZuPUapO5k40foL8AJV6EUhCeXWl3T3dGjXGmaiiqqL8+qFiiBpgzN84wgE9NdIgo6NdQunXZ6sffhv/l91gJKw0VGeuuQAo24dJ0P7QriUFjJTLVsP6GQhgrggaXNYouQy9iWd1lPRxKxPF04p/HAKG4pE7sKUGeu5OjU80+iaXophSdlz9JC13Rvvj8i6xJKJlUtT3dLo5p9keJGx2e3HuZDS4RbTUHGl/7qvXM8FMdOjprXu3tQMTAmZIleRM9bQP/InkvLjBwQ80SIxwT+gykQ3QGnRgn+fHcdjNCufNv0PWtBah1l0HIcDx/Q77Zvet5JeGJHR4nTdmcs0wbihl52l218ehonNnZJ2T4IKTeyOSxSU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(31686004)(66899024)(54906003)(66556008)(66476007)(66946007)(6916009)(38100700002)(86362001)(36756003)(31696002)(6512007)(26005)(2616005)(6506007)(53546011)(41300700001)(4744005)(2906002)(478600001)(316002)(6486002)(5660300002)(8936002)(4326008)(8676002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aC9OTGtQU29WYXd3MHRBZkZDRkJYc1k2ejVra0U0VzVkUFBLR0FWUmFDR1lh?=
 =?utf-8?B?amFkQmlRb1VncktpNy9SSzRYS0tHVnV3Q0NDZzIraGsrRHR3OUUwYVJlRHlZ?=
 =?utf-8?B?NEpkL3pTU0szS3ZYL3JFN0M1U0xNK3NmNEQrcGpYSkJraGFEcmNwaUtXaFNX?=
 =?utf-8?B?Q1RaclVSL2R1dkd2MGl4MmtKTzdoREduTlIycFlmdnhaZ3B1TS94ZUp0M0g4?=
 =?utf-8?B?cTEwczhKNG8rMEh3eHlvZkllZUxmNnlScU9TUllLVlBBa3dORkFORFFpY2JJ?=
 =?utf-8?B?Vmo5bzVEbVFqaUNPR1JFVndGY3hERGdjSVhWbS9kMThHL2RMMjVkdTQ1aEhU?=
 =?utf-8?B?bEtBcWNRbmhLd0VQaUkyd0NZcG82dzI3eVZvNy9wT3VBNEF0OXMxbGxCWEN5?=
 =?utf-8?B?dUFtKytPVmI4b3lJd0kyZnV5aTlvOEh3V2hTS2JEbWxrSnVmTjYrYUY2eWdL?=
 =?utf-8?B?Njc3bmcwNlBsL1VoNGl3ZlNBb2R2WW9PYnBMMmFWcUkvcmNreE5QTEpzd3d1?=
 =?utf-8?B?OENDc24rVmFESWd4VmNtNkVOdmwrQlRmZFNXcXRhbEQraWMwTHluTXdkT2VE?=
 =?utf-8?B?TjNUZlZkVC9ZWW5OVU9LYjJzT3VUSGY4UDBhU1E5ZUJvUHlsUk52dWtJYW9T?=
 =?utf-8?B?QWN5dkQyUUtUV3R1MThCK0MvK1FUalNwLzY3MnVBbjBLL2s3b3lPemU5RUdV?=
 =?utf-8?B?Q1Bra2hOZ00rMzhhRVIyWGRGemxRRTJ1aENTTjBxYklwcmpXbmN5VTRQNkVJ?=
 =?utf-8?B?cW1WWHF5ZDRDMmVPaFY1a0EvUHBhdGdaVHRqdkc2WXlLU3M3YzlvWDRKMFNu?=
 =?utf-8?B?cEVKcnBmK29kY0w2NC9BajBZOWRwVlBvb0Q1R0lxUjJQd3RqbXREaHBUYXps?=
 =?utf-8?B?NXpDanJVQ1FtdjF6QU5uK2tzRkc0cUJrdFlWd2JjQWVxbU4yUEthNkxwb0ZS?=
 =?utf-8?B?LzRUY05JUkhxOW0rVmp4VUFxcERnL1JsQ3c0R0hjUXZreGVoU2IybFBHMUJH?=
 =?utf-8?B?YmJCblFGNFdEb1ZlanlzWEtuME9WaTZRTWVNTFFvYmlkSGJjVXNGZGdwQ1RO?=
 =?utf-8?B?OUx3OTJzMFZLSTcvWDB0UnhDQW9lSWcwS0M4Q3h3UTNNNVJrM0ZKSzVLWkd0?=
 =?utf-8?B?UzJ1RS96bmNHeUE5RERFdC9idUJLaUtxODk0QmVsQ2xJSUpXVXVLUytPejF2?=
 =?utf-8?B?T2s0a1R1S3dJTFROUVhJUVc5Wk9LOWFtU3BXZGcxMXd5dFhCekcxK25OUDY1?=
 =?utf-8?B?S2ZzSW1Vc1JiTjM5RUFaYTlidm41MGxTZ1h0VTdlWWo0VGZ3OFU5TFZxbDRR?=
 =?utf-8?B?ckZ4RXJRN3lWRGUxK3dQeUF0Uzh0WlRONGZtVFkvVjdHYVV0Wm1Qb3B3bWNs?=
 =?utf-8?B?cUJMOXJZdFUxelBhbzgxaFFsRTNrMWFQSmk3SllxUWZZSmtHeklIWGN3dXlx?=
 =?utf-8?B?em0wcWFNL3NPMWVSejRKUk84L1lTMEFQOEhmMWN2WC9wUlV6em1nUHNhNHY5?=
 =?utf-8?B?QU1Ed0VNRitia2NaUGMybm9FemFHRUx3WlhiSVF6c0NwSnNwbjFhN1R0OGhM?=
 =?utf-8?B?dGlwVmxmSElReFppRUpzTWhtZFhBWWVvQVdNODBIZ1JGV004RWJKVGI0Mm5G?=
 =?utf-8?B?aWpqUHRwcWFtMjFoeDE5UUV6Q0p1Tkd6Yk1rVndWa3BPamJhbk1ZY0t3WEdV?=
 =?utf-8?B?bGJmMFRpRjNMZ09nU3ZJcS90d0Z0T3hsYkxqRGpkbzd1UlZYbC9aZitiRi9a?=
 =?utf-8?B?azYwUFpSc3VjRFJxUU1udGR3RVhyUVNoUUtheUREQ2dveEl4bVRZYXpyREhW?=
 =?utf-8?B?NXRvQmZiQ1RFajRvc2gwS1hGZ0k2aUY1RktnTUFsYVRwQjJRYm1nS1lib0cr?=
 =?utf-8?B?RDM2WldRZkZqYXhKRUdncGhaekh1ZUJCTDF3TVdRT3cyL1JvcXVnNWw3bE51?=
 =?utf-8?B?eHpaV1I2cWJQNll6c1V3S3U5a0Zzak90UDZxRFRVT2FVMWF2UnpXQy82ZGkw?=
 =?utf-8?B?UnJaZ0Y5ejNwK3luUHg5eVphMVllcG5lMGYzdEdxbWNKTHlhRGowdW0zRmk4?=
 =?utf-8?B?VHBtWm92MlhxaTVTR21RL3U0NnlXNzQwaWJjOHR5LzhjZDFCbkxPcEt3WkZh?=
 =?utf-8?Q?7Q3OpueqxCekJ9nVvWzfXXcGV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 084c3545-f42a-4f30-b51f-08dbe468988b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 16:50:09.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WF1k5w4TZ1Pqp/SqCPrOeE63Lgc0D8a76wCm+xA7218qR1s7HuEZwIQcpV6EFcUhbAP0lSMJdupKsU6CFoHwHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7041

On 13.11.2023 17:45, Jan Beulich wrote:
> On 10.11.2023 17:30, Oleksii Kurochko wrote:
>> Introduce an empty generic hypercall.h for archs which don't
>> implement it.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Since - judging from Arm's present header - it looks technically possible
> for an arch to get away with this:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Actually - why does this patch not drop PPC's now redundant header right
away, along the lines of what you do in patch 1? This is also why I
refrained from offering A-b on patch 5.

Jan

