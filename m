Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C655C78BE72
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 08:30:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591943.924530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasEa-00049S-Hc; Tue, 29 Aug 2023 06:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591943.924530; Tue, 29 Aug 2023 06:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qasEa-00046B-EZ; Tue, 29 Aug 2023 06:29:52 +0000
Received: by outflank-mailman (input) for mailman id 591943;
 Tue, 29 Aug 2023 06:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qasEY-00042L-Il
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 06:29:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 745f11c5-4635-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 08:29:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7697.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 06:29:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 06:29:47 +0000
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
X-Inumbo-ID: 745f11c5-4635-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQh0AjqzR64mI68fpSefjqUyzMzZlbz4PeMU6x0VXgIvEr/gFV+7KwNi6dU0fJLbCEphoRooyZ8Z/UTq4YHpt5KmcIAH8Kh8lL98ywtS9qAWVA/3HEX/wThpvOwFQY/D5M+dCS4y8RdCH/wh57EAFDDGqy1JQJsy3lBo4KZR8OC1Mev5wVFg3tUgIQ2SxkTLMHO/FRvHGer9F2cBk7sfWR3yhJHhBlG3bGCn62SHt4ewKXvq/WLnB/tY6j++cfqBwbpAhFtuK3rmCeXa8YXPSqFCMHj7VgvNsNT4QVPvZkthG1pFH66RohX4Zo6RQ/BrYHp2CWIxx9hoV70KlHeibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDMUHLIZi7LA70SBB1bu7p2HfGxcljjTpJlz+eKfVgE=;
 b=mD0U1MbQ+tUDNZ6kMbc94iQWfSZwEYAJWAeWZ5j9xBXCxBOMbhhSxUHXD4vZwEgGZlznu7jd+QyJYPmWl/XUYqnCHmRkSi4P/zNfqeaF7LWs4PplqBBfLExYAfvuYSZJ6I/wEi6TdXaM8a1b3XHmTGnLE5RoIBgACqs29GZevm4OOs9gBwagALs/+dBwIWlDqkPmlU/qxsBMs11O8WJWw+Secr7LWjjvkpnvI/lbduin21WFpQYAuTZPt06n1KApyWdu2If61FMnsNQ6xkDW8asKZZEZxPL9eyWbKVWvk9N11otB7TX8eayxwyvOrtFy6hTSYOBsV+GY4qSZdzEgfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDMUHLIZi7LA70SBB1bu7p2HfGxcljjTpJlz+eKfVgE=;
 b=1iWe6OTUk/GjfpZMCZBBlI5x36qQOelIyKHV1uyxhndJWTidAk1as+i/nTGxmDMy+JeO21Hhq1sZ5LRh9paL3GkhuGmXKwq6eHCqfg5cueNZaLVtbEsPY7Qsasm+IDi07AMTSQGXu4dNwID0Tn3/wAwAMvnfhbu2jSETEiSqpQZLC6gMtWL4uHqILrUXbAQSQU/FR+iUmwIwKt3xSSe5qbzHF32olSQYqWm5wl6/iDrgsUElY125+uHXp1y1c2wdWymJ38naoidD3IG9F60fWuHuf46pLpsmYuMRLgMFXTj7MgDUPagkJNzM3gpmFKIqX8YnDhQFCqVlzLxbiXQVYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <023829a9-28e1-0b85-b4ba-b1cd32964d28@suse.com>
Date: Tue, 29 Aug 2023 08:29:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2] xen/hypercalls: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, roger.pau@citrix.com
References: <7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com>
 <694049ad-e259-6cdd-19a1-dc4b3c4a57d7@citrix.com>
 <95703b82-4e3d-9be4-63c0-adf16efa03d2@suse.com>
 <alpine.DEB.2.22.394.2308251502430.6458@ubuntu-linux-20-04-desktop>
 <a7c68b27-4ad7-175d-2c62-85a0f1246357@suse.com>
 <alpine.DEB.2.22.394.2308281440480.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308281440480.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e36e79-8040-4d2b-25a4-08dba859573c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CRFCE53/FJ/Pl+3Rr92oQovfuAKRetYaLbq5EMu6o6mKbTCV3azD3hBW1OAfM5abH4fKoe9xTLCPz64ID/8XmqF6UsSpNr5+V/kqj79pLQTgOsGFC1FqWASlxo4L6rV++H9d6mZb+uToo2BT23+4DhC7L9A5trmwkFwkUl6VkpwlPoSpDU5GXMtL5ayfkgLNvZiawxfrjKOTe+hfFi44wntTkhCIj6vd3n3yWqcrBN2jikt3R7eyEQ8NZkNC6DhZ5Ykc+rsP1jLb3sjhmKlny2rhhFfwy5YFrvnIzny3K5BX7A9FqhMCNByZANlOtJ4WndHubv7IslwCoVIERBE5eMf8hIC12bP/veQk2Ng6Ek9avVhfexl7WbNaY8qGrM9wtB9Cmo++farlTYAFC4Kla5l1gMymqNetJGz8oZr3GV4D2drKnBpuBHUvxzD64lV2tnOZwc0A/7EfrGxDfvin2ANRa2rzs0737Ro3u4isAUlod3vOfF5+ulzi8ULEKQTe4VpVmFiNLw+tuLBDOQVNCF05h2S5bQHTEtfXQ0/KS1kNpy9G/a4LZPecI8IHwRbJddheppnatb7CPLM/+wZpj1nlVw0b/Swu+2s3WYgaSlvXIeWPoPNxedmPqHheJpaH8PDZ/8OwNIfgSeJYVxL9Bg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(1800799009)(451199024)(186009)(6512007)(38100700002)(316002)(6916009)(41300700001)(4326008)(2906002)(31696002)(86362001)(4744005)(2616005)(36756003)(26005)(5660300002)(8676002)(8936002)(6506007)(6486002)(66556008)(66476007)(54906003)(53546011)(66946007)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnBqTHBDY0ZZeUc1U3VhbWFnL3VpOXI4YXpYWUIzcUNJM3lWNWpobGJ6OW9X?=
 =?utf-8?B?WTdGKzh4N2ZnZVZJbWVYRStzVGxTSDNqS25ZWjVFNVJTTUxpNnFPYUFxZHdl?=
 =?utf-8?B?ZC9OS2ZXWDh4SHNHUlNKVlJYdDhPN09MWksrckZlM2VyOEhuZVpPU3lpbW5D?=
 =?utf-8?B?Ni9IbHB4RGxwMVdVVHVpQVZUV05wYURkRXViZ1FYNXgzYkJLTklNRlVaQ0ZQ?=
 =?utf-8?B?bHZacDlIUjg1RnpENndDcS9maThTTHA2ckVoYnRXankxdTNkM1ZHVUlUTTJV?=
 =?utf-8?B?c3kyVUJrSHVxeXJld3hVRzdXL2ZwT3hFNFRWanA1cCs1eVZ3TkdpTGErTjFx?=
 =?utf-8?B?SmNZMmNlYXR2YUUxYmZGd0Nwd3puQlVCSlI5VGFjMFVjTlpia0VzRnovY2Rt?=
 =?utf-8?B?UGNGcGN3ZVo0OXpuMHF5Sk5GaStnQmhZb1hpRVFuYUQ5VXh2dlViUWdZUHh3?=
 =?utf-8?B?OThQY2p6ckZCUjhqSTVtWlRLck05WWZuYlIrVDRRSmc2WVJMa0c5WjQvbmZC?=
 =?utf-8?B?UTdZYVFPeXVwVXpMRitNVHk3azN1ZFpRRVZ4ZWtqKytyM2ZJRitUckxNU3NN?=
 =?utf-8?B?d1JXakZ4TGoxZ2NJSHhGeVBDS0xJYWo3UzI5ckxPOWI0VWdwRXhPdjVjT0JF?=
 =?utf-8?B?N1luWVlkblltT053SEZUN1NFUDNJZXdMTUpHRnRPbTZ3MWRJMndRQnhiRkwy?=
 =?utf-8?B?TTB0ZjI2a0ZpVm1RNlBkL0wzMVY0RU95WXdYbEZrZ3pGQThPcFRzYTkzNCth?=
 =?utf-8?B?TlVtRUNpWmIvWXFBTnhWVWdpMXBrR2pLejBSN3llc2piR0hFU3VkYjN4eVRp?=
 =?utf-8?B?dE1MVWJ0NnFjNk5hc2swcUoveFpla00ySzhjQVZpUG1DUVpWanI5azNHYTJM?=
 =?utf-8?B?TXVUa2hOaDdHRnJpcTV2WVRJajJNQmZjWmtTbHNVVjVrT1RpVE53QWU1K2J1?=
 =?utf-8?B?SzIwUWI3T09nSjJEQ1dDSzRoZktUK3pLeXd4dHBDcUMzVkFKNnNwakNjUXZw?=
 =?utf-8?B?RTEzOHNWN2Q2RjR5blg5TEljZU1GMUpIYjNSTFdBejJ4Tjdwall1V2pJSDhD?=
 =?utf-8?B?dndJRVIxVEh4R3N4dlR3Yjd6UU9MV0NNL3BKMnl3Vk1zQjFVSVI0Ylg2SHd1?=
 =?utf-8?B?eTlqMEoyclY0Q096S0lDa3JWZU5JMExqU1FJS1lVK1A0bVVES1RZeEZBb3lZ?=
 =?utf-8?B?bC9EczZiYmJoeWtxWmYwTXg1WDBsK1RkVmR1cjdwU0Qvdjg1dmxnVkdrMTFT?=
 =?utf-8?B?dDBLTDNVb1F1VkN6aW50aE1qWW9JajR4TmhKMlVlZUNUZjFyZXFMQ0lKZmhs?=
 =?utf-8?B?SDgwYzNuZHZKVHBnTmI2RkordzZDSXMyQU5Mb3NBMUhRWnk3K0RudEtKaHdJ?=
 =?utf-8?B?c0p3MzdKQ0JKNlR6S2N0UElQWW5zUS82UTJqKzFkUkxWakNpRzFTYklBRnRM?=
 =?utf-8?B?ZFBrYVcxY2pXWlZLSTJvZWdzdzVGd0tGcC9DOWJKRWtiOUtIankvZjRZbE1v?=
 =?utf-8?B?WjVlZk50RmMrWEtaMU1DRnhMRVNnUXJLNVFOK3pjNWN5QzZYOHJIKzN2cUFw?=
 =?utf-8?B?S290c1hBaG1YcFp6MXBJOHNud3lsSlFjMlVUNlJsMVlSVllBdnV3NUdOSExy?=
 =?utf-8?B?VmpTcitlZGRCMUxFUTBPV0daK3hJRURyMHM0elVRUnQrSUsxdXNlaFNwU1Uv?=
 =?utf-8?B?MUxlYUdaODF1WXlhczI4d0hrNE5mNDJEa2tyUTBTT0NVbGpZbTdJYU1nRldq?=
 =?utf-8?B?RVB6a1YxWkVaNU8xY1lWZDdEWVNSOFJvVFFDRHNBRmZKMi96SkdCRGh5ZlRQ?=
 =?utf-8?B?RDNwdERnZ3BiMmFLcS9oZEdQWjNDVjZCaWEza2lmaytrNFVtMVdnMG00TWl2?=
 =?utf-8?B?dGxFaVQ3M1FvbWZBTXYrdzd4QWszWU94MjBvOUJrNEFKSnZuOGhJMWNxcTY0?=
 =?utf-8?B?UktJZDlpWVEwOTA5TFZrbm9vQkRUVU9BeDJxWlFpbVZVZjdjYlQ0ZDByQWFs?=
 =?utf-8?B?dWxpUjIwaTBSMkNXMXRpdXNYWVFvMGkyVlluTjAxbWlydGNwMGxma0oxWllV?=
 =?utf-8?B?ZTJKclgrT2Yvc1EvZklZT3RJaWNqUldVNi9yYW5WMzFXNWRVd2ZUZi8zK1Bo?=
 =?utf-8?Q?nWUXEMFk3oS+t8IScDn6Kh6kz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e36e79-8040-4d2b-25a4-08dba859573c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 06:29:47.4567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkGorCjTAPDXw1vybr6wURWTpSyNI3XqxMYLZ0ASH9lPLNQ5Md/f0SBCyyQXuW8ekoFcTGVT/u8gV4BiNgW97w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7697

On 28.08.2023 23:52, Stefano Stabellini wrote:
> On Mon, 28 Aug 2023, Jan Beulich wrote:
>> On 26.08.2023 00:21, Stefano Stabellini wrote:
>>> Coming to unsigned int, it should be 32-bit on all supported arches,
>>
>> But this isn't a requirement, even if we're using "unsigned int" in the
>> C declarations / definitions: If "unsigned int" was wider, all we'd
>> demand is that hypercall entry code (likely written in assembly anyway)
>> zero-extend incoming values suitably to fit whatever "unsigned int" is.
>> Which is no different to Andrew (aiui) suggesting to use "unsigned
>> long" instead: That'll too require suitable zero-extension up front.
> 
> What you wrote assumes that "unsigned int" can only be 32-bit or wider,
> such as 64-bit. However, I think that by the C standard there is no
> guarantee. For instance, it could be smaller, e.g. 16-bit.

Of course, but in Xen (just like e.g. Linux does) we inherently assume
sizeof(int) >= 4.

Jan

