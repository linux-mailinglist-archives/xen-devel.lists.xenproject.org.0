Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6951F78D3A9
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 09:37:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592713.925514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbFlW-0006ms-0T; Wed, 30 Aug 2023 07:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592713.925514; Wed, 30 Aug 2023 07:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbFlV-0006l9-Tg; Wed, 30 Aug 2023 07:37:25 +0000
Received: by outflank-mailman (input) for mailman id 592713;
 Wed, 30 Aug 2023 07:37:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbFlU-0006l3-VT
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 07:37:24 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe12::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e85fa8d-4708-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 09:37:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9428.eurprd04.prod.outlook.com (2603:10a6:10:368::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 07:37:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 07:37:20 +0000
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
X-Inumbo-ID: 0e85fa8d-4708-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEznzkjmM8Cpz8B5jF5NYPKuBjtxUhVhB2AmXp+BvQa8iug9lQK0iQAmXxcbAnC21LLpsRWiCpXNF/L8TWjpv+/EaqPML6+Go5ysuA24NRPJecWuYY1MFj5TF1E8IWrDl4sqVhX7ZnqX/ryenDWruQH1isY7CLc1VyfmY3li7FX2CNPDemhBERN+jeld5oWCYZ9BxVmwlTOPXf40TT+3vIzTDJb8T8rZGC5l4OpFlK8EgHINLj6KF2VTFd7QFsBR+RgcJUbJmzw4lVq3ZKJYyuIwTw4gw1k5q4QZxs1vrmu8FUaP8V9cUSMeCZ5zLujPWseAs9UZ5hT9icFpSC8qSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJ+ajP0TByhxOX4gV10H0SSopJelEDOlRu5uByDlTtI=;
 b=k5dKl7t8VywhXbtF9eAHQXTRmC7z9z7FvWrmWh0J6tMGsD46Rb7URRULhAGaaRYnD7d8eJCOQH0cFQqJa/tEwAFdeAFUoGUDoVCzq9uxQ4fEkLYeSAiSDC7OTiUcN1vbKgRplbSyV6T1YzlhtIrp2sRTobNaA/3OLxST5592e88q1v5bM1YICyD9P1apcZtTRuspDD4wfDU35Cootjugg9fz99FTHtTpyUBt9IkrkZ000Hgzi2VNggdjNw0fQaGcq5pOhqz5JNW9r2sN8Nn/yDtbFyGJiem2NDaw8046r1/nGuhwwIeuoljbFBcZxK4l68sDomwvHhWtbaKvZxCZPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJ+ajP0TByhxOX4gV10H0SSopJelEDOlRu5uByDlTtI=;
 b=AdbZvsJLItArwphPzh+smDQaLZYZlDoFI5xurUaJzvDrV6AXKZkzxkUj8uvCHW6LtfD6Bfq25GN9RpmTq3InC18V89s3CyVoDlR0r/GCx67VNrmD5x58uFxQtefbvqc1czZZD/q1IOjG9e9agoSU6AqprKoUlYhTY8LbyLTVMzP57ZF7nJfP2pZDknNCKq7a6/E1GVVZQxvKVuQm0ntHljSMJYPkHDz2xfzRAezSkR5E7wx0hnvDI3CpgWtQ4nEnb+cTa0EsYWvD4YdFZ4OdOfvWA2NVsjZAaFg9+KunXIhT2BYLlEpbOtWfgrcuXs9kMiLBjCwjL9oZUPev214adA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <19e8ce58-67dd-ec2c-1877-fc5b524983b4@suse.com>
Date: Wed, 30 Aug 2023 09:37:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v9 12/16] vpci: add initial support for virtual PCI bus
 topology
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-13-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230829231912.4091958-13-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: 668c8918-719a-4453-6c3c-08dba92bf156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S5NL3qnxhtNAFtXAszRBySH1j4HxZWNOTn16G2kcc0wWVbQbgF37ocUxVU9XVQWmfGqWNHx2iAW/PvJbWy6+w+H+ht/uwEZraJVhOAIAp/HS2NuY48XaKPt72/HKcI836k9br1mq0hY4iEYMixoMCEBSySvIdkEezJDtA2tFSXiO1RHjFMMjeBKX++bs0wrm1DMS8R4LulJKt2e70OB4jWlgRp52HleHnGOok0o4yxi41tr0uAR4GOOyG92mC4QeWntnAR4OFBkhJYCjlYNI55a4uEhyPVa4GTqfil5TMu4oUCim0fYl3WCyIwKwulz4HBMc0Hzq4uys9ty1ZJUultb2eMhUL+d1aOZk5OHREyuoxXiDEGhyoYtkc9Jc3VEYDIUwlkpnEP89NE/IMLyAbDRGSQRzBSJrRTzgz/g9eAwrtT/z12f/wHJgyqdUG7yX2laNSS6isJNGL6ygWH7xEX9EnocsfhaVJX5FKjrBUakcu/IJlEMq3m2v2Mk3wsJJF1vQMeX6I8BqqTGnVjTuEB7KeVl7UoFhhaJma6/wA65dFFKMBOFX9T4BGAwFEJVnUHqdBgAgQFaNmBX46D+K8GUhTKXyyx2utgGqv6kPJTEjZHFXEgUinJdx/xYZCIawLl6nMTG7VgcISa55OYVJNw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(366004)(39860400002)(1800799009)(186009)(451199024)(8936002)(6666004)(66946007)(31686004)(478600001)(53546011)(6506007)(66556008)(66476007)(54906003)(6486002)(316002)(38100700002)(41300700001)(6512007)(5660300002)(8676002)(26005)(36756003)(31696002)(83380400001)(2906002)(2616005)(6916009)(4744005)(86362001)(7416002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tys5SFBIa3h2RDlVSXBrNFVjcDgrQ3hZVVRiN3NkeHpOeXNLSTNobTlWbXVC?=
 =?utf-8?B?OW02VkkzVlIwZGt3RlBDaEthZGdHQVhlbUgxcm9PM05VVXpXLzRhcjU2RmJk?=
 =?utf-8?B?QmQvMklXb1lSaEZ0L2c1L3IvR0NZenFJVVlEemFOdngvNnlNNXY5THNJeGZk?=
 =?utf-8?B?WDMzaTVzR1NodGVTeC9JY2xDeC9zMllBYjFreWhPeVoydXVlRE1QYUViQkpI?=
 =?utf-8?B?cTFpaG1ERXQzZm45dE5VZWg1cTRqdE1KVWk4dFpoRGhua2ZhaEdiQW9tKy95?=
 =?utf-8?B?eWd5ZHMyb3JONnVRbzI5MGhKa0ZVYVQwcjRuTDZVVVpBVm1Pek5HdGdIYUIx?=
 =?utf-8?B?TFI0dkJoRWRvUHJhMUlHVlNoQlBJV2FOOUI1bWpNNHhtcXpEU1RHdWJ3Zk1Z?=
 =?utf-8?B?amJIQzdqWWZpbDZveGVjUUJKQWtpRFlKODhUZWFHZlNIQm9nSzFTZThkdEEy?=
 =?utf-8?B?QllJeWZjZGhVVWJxSTEwTTdoc1FlQ2oxK0VGVVdieUtFSHNlN2EyRTNua2dD?=
 =?utf-8?B?R1FqTkM2TTAzUjc1d2VCcGcxV1FZK2pRYUg5THdkRUdXSVV5Qmdpb3hDM05H?=
 =?utf-8?B?OUZWZVV2eld1YkFoM3JkemxmYnpUKzNOVDVWb3hRLzZCNE0yOFJsY2JaUkZq?=
 =?utf-8?B?T0l3NFdZSzk0cHNobWM4ajU1eUNWZVB3VDZhTExLV2VFeDNKcE9TYU5sZkRk?=
 =?utf-8?B?ZzY5aFBQb0ZrZGNaNGVsUGJtZlNIYzVaa2l2NkJKdnUvWi9HbkUrNmRkZVp1?=
 =?utf-8?B?ekVqT3JBbS9jU2dtRUU4OFNrUlB3K3EyMStiejZOQnM2NzlPUnpQNUY0cGtF?=
 =?utf-8?B?bUtTWHFwdFJPSENWYXJNQkpVUEI5S1FVcUJrTlZ2OWRzTzlISC9WMGNlRmpF?=
 =?utf-8?B?SGdteWJmWlZMekJIVTF3ODYwMGFGcHorOVBXbnV4SHlROG9STTg1bmo0cUFI?=
 =?utf-8?B?eTNRYzUwY2E1TVlCYXk3VHRMeE1hbkx2eE1teERlYktDbGoyb25DTGFsZGtz?=
 =?utf-8?B?SlFPdUh0cFlDZVlzdjZxQ3pKVnN3SE05WGxQR0pDMzFkbW5jUGFXNXUra3dC?=
 =?utf-8?B?Ym9DYWJVNHlBQWdkVU8rMm1EYWJ1UGNWVnJxVWZkNHliTnpienJSZzJId202?=
 =?utf-8?B?UXR1UUlCeU51TUlJa1FwNHl2ZTZ0TWQvcjdEWGdKeHNCQ1I5NHJ0NkJYb0lR?=
 =?utf-8?B?d0NBeitqUlRuT3BEdXV2TlJIN1p4UXRQUVNkTFJmcHdrZkVOMlBaRHlvVk00?=
 =?utf-8?B?aFBnWkhwTTdsMmhhUHlUeDVxbU1zVEhGY1BNVTAyT2lWbWFoNVVSRUhlTG9W?=
 =?utf-8?B?SVgzNHZjZGhlUzNEdWk4ckVZTkx6SjdwSmIwRit3UlhJd3R5bjUxdk11dmhs?=
 =?utf-8?B?dnBxc0x0TExZeXJKUHQzWlU3eStoNENyVkVpaDd0cUJnNThEMDhPUFpCelFV?=
 =?utf-8?B?MXV6aGdTVjh4bmlqRDBjcXd2dFNzazFvVXFlOHJQNCtwU0pmbnpqcStnY2NS?=
 =?utf-8?B?bk5PQUpzREtER3VYcVlENGpNUElkOTJwMGk5WVE5SnByaU4yempQODVubkJ5?=
 =?utf-8?B?MHBpdytxcysrbTdSakVzbjdEK1MzM3FOV2xoU3h1WVRyZFZkSytpTnloY2h1?=
 =?utf-8?B?aDRVZkczQ0hjN1JPa2wxZ3ltVEtJNlpBeXBaQjE3U01tNmV3bWU2K25LOUkx?=
 =?utf-8?B?Z01xTU1vQlF2WFlvYzloTmJJR2ZEaWo5VDBJc0ZUQ0RweWhsKy9pcUdEZk52?=
 =?utf-8?B?dnNhQlpqaGdLd0VkSnlxb0pXRjZja2pnZGduNDdFZEVTU1ZpbnlnWDFNU3g2?=
 =?utf-8?B?VXJVZGU4UURpT05xQXFIZFBTbjU5aUVuRkp2Z0lFZXJuRjkwTjJxSlF0OFZW?=
 =?utf-8?B?TUZLc0hyZmNwR2ljRlc2cGlkVmlxRytoZDRzL010KzIrZHZUSXZnWmdnd0Qx?=
 =?utf-8?B?WUxMdzV0N1JXTlNkSHU2d3hIWGZZQjJiWFNyV0JRMWtsMlQwV2EzQ2pOOUNL?=
 =?utf-8?B?eVZETHJYZGNOT3dTRjVLMmNFZXIyYmJtNjdwbXhuSzhmSFVtK2krdXM3Wlgv?=
 =?utf-8?B?Tmx6TldnYkkrbGVyQm5kWmpvdmpDSlhkSU5PUFEyMkNwL2o5Rlk0MnM5VE1x?=
 =?utf-8?Q?0Bv8reH4Ei8z6EVoJnQ9O9kdR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668c8918-719a-4453-6c3c-08dba92bf156
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 07:37:20.2278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQzytV4wbhGAhnxiMT+5A7fN62Tp/fHLzihLhfxCZ0b3OYXO07QEm0izhlC4o9HbO3KqcbWPh1kLxBsfM+NDiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9428

On 30.08.2023 01:19, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Assign SBDF to the PCI devices being passed through with bus 0.
> The resulting topology is where PCIe devices reside on the bus 0 of the
> root complex itself (embedded endpoints).
> This implementation is limited to 32 devices which are allowed on
> a single PCI bus.
> 
> Please note, that at the moment only function 0 of a multifunction
> device can be passed through.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v9:
> - Lock in add_virtual_device() replaced with ASSERT (thanks, Stewart)

Also peeking at a few other patches where similar change remarks exist,
I'm slightly confused by them: Is this submission v9 or v10?

Jan

