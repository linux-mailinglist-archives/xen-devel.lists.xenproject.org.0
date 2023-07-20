Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED775B391
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 17:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566681.885834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVyU-0005Vk-3r; Thu, 20 Jul 2023 15:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566681.885834; Thu, 20 Jul 2023 15:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVyU-0005TG-0P; Thu, 20 Jul 2023 15:53:54 +0000
Received: by outflank-mailman (input) for mailman id 566681;
 Thu, 20 Jul 2023 15:53:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMVyS-0005TA-GU
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 15:53:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9edc2d9e-2715-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 17:53:51 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8202.eurprd04.prod.outlook.com (2603:10a6:10:24f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 15:53:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 15:53:48 +0000
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
X-Inumbo-ID: 9edc2d9e-2715-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKghWQShmhqpq+6B9514u/yyueJCD4kRrPdRtLXKmm5KPjHz/dAXrYMcoWE8VV23081kvoAUlZF5UF3+Zma9WMCEB/eLybcgH5Z31kEtQekKmGfHFwwdQepovGy8C3ts1uwiTAbBu/1faTL2/tL1BJxi03AB8jQb0O40zyCJ6SebE0DMYKgYgp5GPpTt97PdkI17OIvwTBEEAeOUY8ZzeAWgZk7rRRrDX32JNLRb55gak/231eXyxCLR9V3jgvA06txFLCbjoxlKpaX5TBJd/i1mRwY2jeBkt9RrKDRrYxM5pMyVUpwEJLpMY6xe6NECCmKUBNDgqnuGo1z16oaCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7kGzGcFIqLmLK/uDdDsCu01j/IB8V3sWF3dtRJ328s=;
 b=jf8bteC7aONJhYdslw8V0EwQqzZ/leg5ydq6hX7OyWJvfh0tE1Wy2C59WBHx/QwHH4Y+H11tZ5bhFz78AeScepPAcp+T7l0DJAVCUu9xrBwGfqrA3A7t6ZN3LTCwIfevX72QZL3SInwI4+UczhpoTcrwWAmhEDKJP9HwtGBamH9M04kTz3wwRegucWZktXCrZ3cz/glHI5oUAw8NvKVzYJuufcGE77BMf+d2SQ6TEq6bV0DQ3wHl/Ox89pF/MqgLAFCix0jCNww4Pdf1NdVGZIpQADwJ+ymg1RjVS/i8v+wMqqwR6TZDcWhiGU1Folp8984zvef6iOtcw1mKGE5YCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7kGzGcFIqLmLK/uDdDsCu01j/IB8V3sWF3dtRJ328s=;
 b=0j7rUlpamI1g03oOLBJqD8gFmAZ0r0dm93dnSOia+Qp317Yak4hi1G6xS9pSmKM55xxolD8WqS9G+PuLm+EOfM0mi7hCZd3phN0Nqs1kkksD0Rq9zkt9ngybQPzVjgp6RvuFiViO/oeDX6wKMLW3C75HdouSmm4fnYTqPuTie09py4j5ZJnTG0G6Tk1pxWyhTy1J5jOAzbrKBzRkWgKSuTwDiA7LElmzrxg36FZGJyscC2rWeV88YdMqsWWFjAWIiZS8bi7ELNMdJynu860hOmbRo40z2NtD0ilKMGEJk4CaQKfyHlnTvtFU0CC5llYl6ShZglKvLGq29Lv2Mdtahg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <13883bae-232a-549d-289f-ccaf25b4c81c@suse.com>
Date: Thu, 20 Jul 2023 17:53:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e09779-3fe4-4a46-fa57-08db893981bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lm3yplD5dTUlraGubcepkYSr/X4zDaUG2N+1NPHZ7S45I0sKXBM5v8jyk8ljZgm96a8bh2M28dfSFndG+55ZNOYN464GU3wvt+sv2YTxGyb7y5OVeJFwY0RrYkImUK275JzTdca0T8rxMiy8Rp/+Q3ZXGfBlLN8uWXFXr+WL6oII7iE6gXcqIZW2GCCanhIjg7zLdnxdGHAwh3BsQWsueVduLW1Dkp4KKDTJeVU6k9hg/0RW1IFGqD8eF1du50BKwAvFvaNlElnf/padCREMk8DRdJmY/PnC8p840X6lxHi7iyBeMuTW8vfW7agreLqS70zr07vT+saUhk6IiG0iX0Hb1lZufO3/IKAqUjEIZ3GrPGV/Iph5JfIpcZsh6r3D5IzP31Uh3vFr3ow8JdP6TNXfg9VmcxSlAdy+03HoQ7FkGsGGnI1NXx/IUtSKk5XvbBn7kDKjO5PxC0E+PpDZ4vTvMv/shvHFuUQi4pGy2Fl9KiBPk5BVESLIRNDjBy98WGby7mcvRvPaPemhVSQslnGOJdbzNj7CHA00NTzEniKjH7EiAbYzZ4D+y4P8TFUiei2FNJ799SeMuw2PaEe+x4PIB/lNTvyAuJkQ8D7lumqNrKqBERDJd8PZv0JdpYko1afnT/MCMzkcpeyA4csaIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199021)(31686004)(186003)(316002)(2616005)(36756003)(5660300002)(8676002)(8936002)(110136005)(54906003)(6486002)(4326008)(26005)(6506007)(53546011)(41300700001)(83380400001)(66946007)(478600001)(38100700002)(31696002)(2906002)(86362001)(4744005)(66556008)(66476007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEhhTHlaMm1OOGtPR3FNREZOVFhVeEk0Uk5EYm5OZ1N5UG5SOWUrUHcwSm05?=
 =?utf-8?B?QkVUenVWdm45N2R5SWFRNUVjNWVFVVF2SGdyQlErTjE5MElGcjd2RjhNRkkz?=
 =?utf-8?B?dnB6OVhXNkluVGZXbldPUjFRWEx0VTRKb2xHcnZOekl3azVpVk4wcjVIODBG?=
 =?utf-8?B?WHRnSS9NR2VlVnNTTkdsWjE0RXB1eGp2clVoMkdzL1FYdUpSR2FmSzN2UFVO?=
 =?utf-8?B?aUVHUUZ2d3FmZGMrTGZySTBFUFlPUnY0Znc1MkY1cThSZk5uR0N3VmRwYnlC?=
 =?utf-8?B?SEFicXVQQ2hPUUs1cGJ0aUZobC9nVHJQcCtDM2h3MTdRTTFYK0JVYkhiNVFT?=
 =?utf-8?B?L3BEMXZsVkpOd05WamZ2dGo0NEJCR0t4eUVqVmhPZzNQelZXMDZLV0VrRTBJ?=
 =?utf-8?B?YWhQaWdaU1oyUS9wN296VFNNSkRUNitCclZvd2J2Vk1KdXpheGtibEx0bGlN?=
 =?utf-8?B?S1krNG16VWdpdnNJa05TaVlyM2JXREp3NFA3TmhyTmdUcEtSTmxXc0NWMXdQ?=
 =?utf-8?B?dXlwZGdMQWhOWjdiTTdpNTcrUnI3TkNsNUJpQkR4Mmk5Yy9hTTRzTktXaDVY?=
 =?utf-8?B?UGw4L0RnbGJPTXBMTmxwOTlNVFh6ZW9xWlR0NWR2YW9XUzBGVHhZaUd3K2or?=
 =?utf-8?B?UmwxUCtqVUZJQ1lYSEpZanJ1eW1FRHduNWtpVWtIRXFyeVRJOElaWGd3UGl2?=
 =?utf-8?B?ck1TRHlxeHhrUXEwemFBNlZwL3dIWWc5Y3UwOG5ub2dGSlkwOU1nNStZWlRQ?=
 =?utf-8?B?cTQ5U0hhT01BTFB4OGdaVlVzd1I3YXJ6UGdaOVJjSTNUYzJ0UWF2TkdkeXRy?=
 =?utf-8?B?L2N5aUZKVDBiUWZUOE9PSkdiNVFaYkdydUxlbC9UankrcnBpT2lhQjVobzRZ?=
 =?utf-8?B?ckdURGdvd1JuL25OS0pWdGNmdjc0ZVhYUXkxWVE3dkVpc28raEhrdUJpSGhq?=
 =?utf-8?B?cWJ4RGtvb3hNVDBNdWZVY1RPQWxWVmRISXdOb05TVnF5YlNYY01TMFFnTk9C?=
 =?utf-8?B?bXR5RDdEeTY3VnVPQ1gyKzNsOHI3RjBIYi93NncyMUhucHBYaVRWODl5Rno1?=
 =?utf-8?B?ejFXbUdrL3FJcXF6OXdaWmlnVU9SYXNqcEl5SGtZVlcwY0dXQi9VcGNYQ0w2?=
 =?utf-8?B?a1l5NE9EUVlCM2NmL3N1aUtUbVdXQXdOVUhtVHBOQytxR0hFejJzNlV2M2Jh?=
 =?utf-8?B?Zkx2MDYrR0dyc0wvU1lVbDZSOE9EaWFIaTRqSG5ObDBCMnVVYzAyYVo5WVhw?=
 =?utf-8?B?UEdhVkx1UC9RR1o0ZXJOTVhUc0NTSUF0eWltaXArZlU5K1BFSVIvTWVZby81?=
 =?utf-8?B?THRrSXNlUGNtK0pHendacFBTVE5HMitIMlpmK0NxbnNudlRaaTY2MXM3bkdP?=
 =?utf-8?B?emNhWndlSTZPV2MwRXAyMGpvZWJFMjZOc3ZyRWhaa3lhQmZ3eElad0h6REtY?=
 =?utf-8?B?dEt0TU9jZHVIZnRibVc0dHlySG9lQ25TUlkxcDlCYzFINXlYcndFYTltbTJM?=
 =?utf-8?B?dk1GOWFxbk5TdytUOVNvOTc1OThJRmt1WVRGVFFDWnpHSU9ObXJ2RUw0NjMx?=
 =?utf-8?B?SnZYbG9zQSs2WFZDRXRMd2l1ckJVV2lickRvVmxmeU9NWUtONzhDdUFHNnZq?=
 =?utf-8?B?NFdKR0R4TDd1MkY4ZFplTzNrbCs4TnUrdFJ5V1UzWEJDR1NTR09sbS9lcTNK?=
 =?utf-8?B?NWo0ZVVKRjJBd1EwQ3NKSG1KRUFJUU9GcEl0MXJtbDRydWNNbldNaDN4WDZl?=
 =?utf-8?B?eVJFTHZieXBINkM5elpLSjFId2hpTWo4TW1ScmhtMUI3bExiKzZmUVdFbnNv?=
 =?utf-8?B?MitHS1g2NXFuUjFVOWpzQmZMVWFYSTZRemRRbVkxWkJhRmZEQ2x0Q1NMSmNH?=
 =?utf-8?B?SC84MkxlM1JDQ3NtTkxNakZFMmtrdFVYaExiNDVaY2Q1SmIxKzA3dWlyMlBi?=
 =?utf-8?B?Q09ESHVhY3AyamRXemZHelBFUHhxMnFDa2kveE9vTlpuQk92eUlBODA3YXR1?=
 =?utf-8?B?aWFMTjQvVm9hWVZRaEltaStQTlEvZ3c4UTh1dHVENWVscFFtR3pIQlFCZUFm?=
 =?utf-8?B?RUFhWlEzbDMvdTYvVXE3MGtRcDRoVmMwZUJ4NHdjMnRNVHU0QUU5dzRpS3NC?=
 =?utf-8?Q?XN49szeZXrA/GrGjtitNgi8+i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e09779-3fe4-4a46-fa57-08db893981bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 15:53:48.6880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5t3kN2g5EVNps3iYszgyW3LqJx9uX+yGExAMtOgM0EUm17Je5W9Du0tNJspEyBiJUeXj9lW/iRjt77jV9m1pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8202

On 20.07.2023 13:20, Roger Pau Monné wrote:
> On Thu, Jul 20, 2023 at 12:32:31AM +0000, Volodymyr Babchuk wrote:
>> @@ -318,14 +323,17 @@ void vpci_dump_msi(void)
>>                       * holding the lock.
>>                       */

Note the comment here.

>>                      printk("unable to print all MSI-X entries: %d\n", rc);
>> -                    process_pending_softirqs();
>> -                    continue;
>> +                    goto pdev_done;
>>                  }
>>              }
>>  
>>              spin_unlock(&pdev->vpci->lock);
>> + pdev_done:
>> +            read_unlock(&d->pci_lock);
>>              process_pending_softirqs();
>> +            read_lock(&d->pci_lock);
> 
> read_trylock().

Plus the same scheme as with the spin lock wants following imo:
vpci_msix_arch_print() returns an error only with (now) both locks
dropped. This then wants reflecting in the comment pointed out
above.

Jan

