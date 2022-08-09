Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B99F158DAE1
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 17:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383001.618087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLQwk-0004PF-Kf; Tue, 09 Aug 2022 15:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383001.618087; Tue, 09 Aug 2022 15:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLQwk-0004Mn-Hs; Tue, 09 Aug 2022 15:15:06 +0000
Received: by outflank-mailman (input) for mailman id 383001;
 Tue, 09 Aug 2022 15:15:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/TE=YN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLQwi-0004Mh-Sp
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 15:15:04 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20055.outbound.protection.outlook.com [40.107.2.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05491e19-17f6-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 17:14:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8662.eurprd04.prod.outlook.com (2603:10a6:10:2dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 9 Aug
 2022 15:15:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f%6]) with mapi id 15.20.5504.019; Tue, 9 Aug 2022
 15:15:02 +0000
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
X-Inumbo-ID: 05491e19-17f6-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJRd89r6X6RMxhEDbipIPEorq6cEaa7X7aJA4C67z/Wm0zc/RDUC4OTHCPwtMJwcM+BW6So6/u0cGwqNI7QvP8oGM4f63ZP5PLLNBT+z4VeqypB9uvfc1gYtlgodalw4Fgg2Fy/Xe1eArGIpHDgzp85+/mroT58spVF7lnmkBpLa+paRFCixvlCURcGCLHacyPtmVGWL+kFZD6JXKMOthqQlnVjPx32DTtytjACzwyxWA759YrAAw/hMxDKvNPMS2FTihBveo6cpgraQN6/zS848sU2vNQnY4Kwfwk70ynWv+Xu20Gsh1ZYS2A2rbcF0qwGsdjSNxM8brTJsTCGEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEjsAV+hPmvUmvQeU8zd98n8DEcdmdh6CIw4GL+C9RA=;
 b=lqqjtlC30X89bGrnyl20vABcN9Kn08tpft6xX7uToem6PgYPwQ4tiUTTqZ4brv8uufrdBpFRXvmFRZd1im6vfg34vUj3BJ7mwoxvkfPp0a9oorAHurdldwX1EXMnO22nFuXpAKOqE7jAXkIGRd6J5Tj68ncVSlKCmYndlzaPd1tngW+J5VtQKvZKzg11zgSJGeTuLAY1KNyD09cvTTwYkIJPz7XM2owcBeV5ji7PYyktgvw0AjUR10rmC2ubz1BSgiZbbRYuaGjLtuN8qjX2DZ2JPIIoupGUG6u6W397LT7gQlXt1DHseHCB7s3KY99p3IS1yIxoppQtnykPulTl1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEjsAV+hPmvUmvQeU8zd98n8DEcdmdh6CIw4GL+C9RA=;
 b=vQmGkRATBeNCGyHl4BEFLAvqMNUJS/azs3CZ0oCVwcXFQETj8r3frQWruFHI351DiFpBRj95rQvMKhq8R0nMnH645QfJ7w07A86RK69BPUjhP1qdI1o2OelUktysbgzjC5zYrDWLPrv69H/vAgDqTx3pvpyURwbNW0Jz88/W088MmUJ20xj0rn63ltkHUxhW6tcFWYHXVHPWknv26XHL0BPQfva5+AWbP8gMnPzlK97+qEw7SJIHNAxFl5+dGwiQp3shxYapaLnl8sAb6fz4bP5sDri8xL7UotDPg9BMn2pVU+rD7APeLJSEZTIO4DEwodif87nOwwTGpEKvYhGmZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6c8defc0-3197-14cc-64ba-1ef140d6930f@suse.com>
Date: Tue, 9 Aug 2022 17:15:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] [RFC] xen/vpci: modify pci_get_pdev_by_domain() &
 pci_get_pdev()
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 675cdf72-211e-49af-b28f-08da7a19ee89
X-MS-TrafficTypeDiagnostic: DU2PR04MB8662:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UvGSd1ORo/DbC7zPev9cQzIxG4SuiVH0xLLtV+CrtCvOwe3++F/bG1eMz6lFukIGh50XNJsF/F1+hOVQePx/LTK/ZJIdFCthC+roQJSg81IeE5p/jZSYYERYSgnmFZDTSQ2EvyxvhHqNy4aLRQ3N8WyzaRPC+Q5svdq0elXt61LgFDjElhX3NUp8XFuTc4GxrzbsgBfeYeQUkURfC9jKMl9ah4sQEvlcP10p5PCFGqrMt0XnzYmgmR3T59bpZNmCC8lcAPn1eMyOVCWCLS7fNIloOntNWPnbmOGVQ5KKMG5HSNr435oO9D3o3WnKHt8/aHGnZL953KAVe0L3xj8ECylepEHXS0Wg0hGuyjtwMJyyvoPyk0sHeXDqX0z41OAltlZnRve7vUqwf3Y82ociF13t16FbAsScOZ2Cou3FmN0T17jFu3KX+qahEjvhCEryw0UIaQM4qwuVbLOwbUyPkfBcZuLtXKcUIlOfOwTjfRxyWkRkuB/gy0MUNe7Ls+EKUyS3j1dXRGnTDFdBzpp0CvCAO7grFGUnUoCK8etAYHKqCgIFt09i1PqOO+mRMTXfwgegnk7oPIQ+1MT7baYW2LziB2ykfVz/9aZSPp0qjkIqWWxtJUdQhb4HqTLXh47Smr62hDQcRCXAvePjlnMQaCwxq1HiD33/4fmps4B/R2Fyy4QiT+qtwQFJP72Vdh0Lho/D1bR63i8rg0sXu2PzXAjRYkTM4rJpqQya87FmZjZnjjuNpRXEaBRlpVE/V47jcCcIKnKuhCT4Jra6xwc3TcuhlRE78QfhoKgJSJitvDH17LANvDb2tM2JcFsTjxdhXJqGD4vU3m4Of+JUiT0pDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(376002)(39860400002)(26005)(31696002)(6512007)(53546011)(86362001)(41300700001)(6506007)(186003)(2616005)(36756003)(4326008)(8676002)(38100700002)(66556008)(66476007)(2906002)(8936002)(5660300002)(31686004)(6486002)(54906003)(6916009)(316002)(66946007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUlZaFhRdldXMHRqVmEvOXBzUUlURGN1ZnloWGpiM21UMWlBUlNIM3k5SjVL?=
 =?utf-8?B?ZXJDUzUwNWVoYkVIa3AwTmdJZk9YQS9Ec0h5Q0xOcHBVVDA1Z1NpSm96WTln?=
 =?utf-8?B?L2RoRnFCMnFKNzBqcFEvcDhFdUI1SzIzTmtvVkErWHhpMjJIN0NYK3hzWmFv?=
 =?utf-8?B?cmZ0cmFURHQ3TVpMZStha3kzTlFxT1JBR1RtUzJTUldBU1J1MTdyYStNdU9h?=
 =?utf-8?B?aEk0WjZzZTdjVGNnakR0U2xFOEt2SzBSd3VsZzlkWUVVbC9rMGVQU1FoT2Ex?=
 =?utf-8?B?KzJIWkdCL2lnWmpHMXNRNHJvMG1OVkwvbkVvV0tONks5MFZaRS9GRkpmdFZV?=
 =?utf-8?B?anorbTZYN1FLQW1vVlRwc2FrT3lIR1NjM0lMSTNzQThBWFBXWlh4aUc3UUls?=
 =?utf-8?B?ZWlCZy9heTFGMDcrRGZibUdvRHllQmoyWStNYUN2N05LVm1GenQyS29jVmtu?=
 =?utf-8?B?ck84NzIzU3NkL3pRTU4zV2J5SmZzbmJLWHhVQ1E1WmQwSmhzUXNDZmxUTTlr?=
 =?utf-8?B?UlVkRjdtUmR6WkRzNXVHNHhyelpRQ0N5N1ZKL0NVQk9pN1FZV0Q0ajZRS3c1?=
 =?utf-8?B?ajJjMHBhNENicnJTVkY1djdJbERBVHVtb3lhSS9kSjM1YmpYdEd5QXl2UDJj?=
 =?utf-8?B?RHA0R3V3L3N6eENnRnBtZUh0ZGdEM2ZHVUlURjRzb3BVbEMyQU5RQnE3Znh5?=
 =?utf-8?B?S1VKQjB6SjQ5K2Fvbi9zNmRpUUNleXRzMXhOanRmKzh6c1kyMStlaUw1aC8z?=
 =?utf-8?B?ZVJSblFxM2UxVzhEd1Y5eXdmQ1UzU2g5enpENDNNYXNrd3dzK2ZFQjhYdzlH?=
 =?utf-8?B?S1QrVm10SDVFWkVISEhXamJBVHVoWmFrelN4NVd6N3BTcng1SFJzZkVxNG5u?=
 =?utf-8?B?NVoxclVMcm5meDFHbVdYUDdQMTY5aC8yQTJoZFBBR2JuSXZQVG5hU0tlaVU4?=
 =?utf-8?B?QmU0c0VOdE4zcldESWZRNEQ4cnhLQSs4THVxcnBXdXFWTHNSR2hBOHJmQUVl?=
 =?utf-8?B?bThsa09EWnZlOW5JV3FORk1mdFNySks5K3Q4c201WDJxOGZnay9Rb0I2SjJh?=
 =?utf-8?B?aGlyK0FOS1V6UFlPZWNqUjhRZlU5TGFXWEtpdHlSNzhMWURidytxVTBQNGFk?=
 =?utf-8?B?dDUxY3NTTERaUzRjUDJXMjlOczEwTFpxbmg0eWx0NzloeEhWZUNaeFBYQ09J?=
 =?utf-8?B?cjhqRHRwUzArZzc5Y2U2aEtEYTRIQlRKV1ordTU4L1NUalJLdlJnUGdnWlFa?=
 =?utf-8?B?a3p6SE9MUk5yWlA2MmFCSGZsdSs0Nmp4RHUwWGRKYTBDOHhPSzdBRVJZRjli?=
 =?utf-8?B?bkVNRUpDVzVZb3pvSnZkMng2SlZzM1ExdlYvblZkTGVnRkJtNi9DaW5pZFRH?=
 =?utf-8?B?TE5YandpWDZpemViMFhSeTY0R0R1ZFJzYmZSSDErYnZzVHZpMGFPYkt1bHdR?=
 =?utf-8?B?cDlDZDlyN2NOeXgwNjFyR2RPR3RaZjdhbGFNYkRVTXpka2U5RmJiK1NEeVpV?=
 =?utf-8?B?R05kcXoxeHVqVVFpSlJ0OVF2MDdQcGNwbGN0bWNZazhMemlUUWM0RUgvMTlM?=
 =?utf-8?B?S3BjK3l2T0pwcjVRMno3TXBKakNQMjRhNnFYTlJNMFFSMElrcDlGV3NaREl4?=
 =?utf-8?B?USswZEJZZUVuRlE2ZFVBYkNZNU53MWtLRFBJQnNUV3B4TW1vNGdvekNnYU1u?=
 =?utf-8?B?eE0xOXBmekszc1grczRzUG83eEVxMkJEMmlPWS9VS09TVkQ5QW9QK1g4cktJ?=
 =?utf-8?B?NGw5MWZQditqOXZzZGs3bU9MUmxJekY4aEZHNHNEK1dUZE5WejZKMFh4dW9t?=
 =?utf-8?B?Yndxb0JsWTYyUmtZN2hORTVKV3FCemFnd0tyK2loV3E2eFNVcHlGR3hSM3g0?=
 =?utf-8?B?SlRQcnNGVm55MVVXTmtpS2lIZnRRMU52a2hpQTExdnV5RGRLWTZrd1kyRjRp?=
 =?utf-8?B?L2hmS3l6dWF5cjZjR0M5dmxxQUdVTlVQbEN6RjhMekNxNmhXODVhdy9uYjc0?=
 =?utf-8?B?NFZ4NVpwOTJ1N0ZxSFB1a2N3bTRlNnZlN0Iva04rWVFIbVdlbDZNMW5QNDAy?=
 =?utf-8?B?Vk5lTHU1K3BrVUp1S0pPZXQrM0pVaC83RVZOajFOTkxJWTRVRHl4NE5tSURs?=
 =?utf-8?Q?vxn/FRRs2tIgOoyDjeqVNvoc6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 675cdf72-211e-49af-b28f-08da7a19ee89
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 15:15:02.2525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GttoMjs8SkD9xEIh5YAYyXllJv6gcmrEM4EZzP79278Wny/VdFP2ZmsTJimSgTFQ468+C1A2l1C4GwJx8y+S6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8662

On 05.08.2022 17:43, Rahul Singh wrote:
> pci_get_pdev_by_domain() and pci_get_pdev() functions find the pdev in
> the pseg list. If pdev is not in the pseg list, the functions will try
> to find the pdev in the next segment. It is not right to find the pdev
> in the next segment as this will result in the corruption of another
> device in a different segment with the same BDF.
> 
> An issue that was observed when implementing the PCI passthrough on ARM.
> When we deassign the device from domU guest, the device is assigned
> to dom_io and not to dom0, but the tool stack that runs in dom0 will try
> to configure the device from dom0. vpci will find the device based on
> conversion of GPA to SBDF and will try to find the device in dom0, but
> because device is assigned to dom_io, pci_get_pdev_by_domain() will
> return pdev with same BDF from next segment.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Actually one more thing: While you're working on vPCI as I understand,
the subject prefix here really wants to mention PCI, not vPCI.

Jan

