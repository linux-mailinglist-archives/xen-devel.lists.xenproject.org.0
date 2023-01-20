Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18560674EAB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 08:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481470.746355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIm9Z-00058T-9B; Fri, 20 Jan 2023 07:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481470.746355; Fri, 20 Jan 2023 07:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIm9Z-00055p-6B; Fri, 20 Jan 2023 07:49:37 +0000
Received: by outflank-mailman (input) for mailman id 481470;
 Fri, 20 Jan 2023 07:49:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1qDs=5R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pIm9Y-00055j-B9
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 07:49:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fae00071-9896-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 08:49:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8539.eurprd04.prod.outlook.com (2603:10a6:20b:436::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Fri, 20 Jan
 2023 07:49:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 07:49:31 +0000
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
X-Inumbo-ID: fae00071-9896-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glAdSV3zasUryrrhg/wO0j2bk1ND626SnqRgPN0gDIVE20cM5Jd8N922AscTo6O5MUAXHSdp6HU3oktAGK9nzqEEBrBs2N0pDzAVe4M7k+PjJqQmaC0b7EyVCKRHS6hXL+CypJ1K8TIYnKPHVM0Ae/dEcuQpU/M7gx8ON399GzIK4kgNmO3MYwZufTHwhtn4QsyaUJJlyzOHffJ876cGHOVmnZM1k72vhcOmhGjeGt9BEcnzRKYsdcuqTahKcpPxMJ54Q4Rwed97ltwi/GRBeX7maaGs5UYdxxWXUuzhnn1Gf2Nb6sMvoQSbbuCCmkxj5dhev2tGSKZSgXS8LC+FEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Io31DtRKRvzeaJ7vM0rAHgdD9I+lvUU4R06xLWV21w=;
 b=lYB5VGVedwlvv0ZUqH9xzUlfpnpoLSlG6vSzMoDzNpWlBhhOqWzRAsllLjiUIhOVBqJxzXkzNqFvDB7z0yaen7C6bAtYDp5b0HlAxcozw1DPT9NWtzd58vWhzJQ7BiSES26OQgQcHDx/wDi8Uc2c7YWLMdUd0P+SlIT0KeIRy5ScdTwfV7EJBWdlGW87JBs+MOTnwJoRvZpfGAM/m8HzMQ7ku8LAdCgkmA9dl+mlWM95FP40qf29NSdrkkgM+OWLOoNtWj/nPy+2vS4FyysHs4D+RvftXjV0Lu+GWQSCXMyKhtSTCXqbYhJAISRNUcKxqfmwSdTlzN4fzYt8VuletA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Io31DtRKRvzeaJ7vM0rAHgdD9I+lvUU4R06xLWV21w=;
 b=wiAXZBBEZT0JIc2nlSYG4nZ0UMvAUBtcZLpJwf2rFu7X7naH3fz6MjOGXUR8P63/qoHnS9lyKCfd9W2+drb4iy4hYEUiqbST9kCSpE1uzmE2+W5Up2l/cK1uUkpqMV6/qfY/a1UJ4oq60WzfQ6t/sNjim8eaxLP5HsFctPN4KtxFAK9UHcotFNPqfcFSjvOBvG84oAdgVfuzINc7AELRbCgkjHKjQbFy0ec36m8PgNZFknsrS1rkwCYlOmynEzVP4D4xOBNMZw/3J/mXfjZavi1Vq/7SbcKYupWKpDjCmeFDYuVb0ngR6LZTgGhZtEnOweLWqvQM+tN3BrfMtMUONw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <839c8f02-a3d7-fa1b-f7de-6a0521ba6b76@suse.com>
Date: Fri, 20 Jan 2023 08:49:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] x86/shadow: fix PAE check for top-level table
 unshadowing
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9e79449a-fd12-f497-695b-79a50cc913c7@suse.com>
 <bf03f851-2fb4-3de1-7d72-b0ac15b2d488@suse.com>
 <266eb5cf-b2ad-051b-0474-96bf6e2ca7e0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <266eb5cf-b2ad-051b-0474-96bf6e2ca7e0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f30b6b8-18fa-47de-c3e1-08dafabadcd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	50j+Tq3FLwbrM0fJaf6gkes0ruw1jpfkUo3WSwFBcyMBsVhhRDAsHWdCKOCUc0Ju2bMf30NBG1rljuMRPzC6y28CKUD9Xy7gydV2j4LgYG9Td43VVdSZ1nbbnL6lMz4GkiNKT1jPjM+WZsMsPiFMgaWnngFZpDa7zrHMdrYTAdwYEPs6FbFXKZjRNZ3lDvD6pQAZrVA+utVKPk2qwBKLAj1jd/PRkpWunaEi/hdKOoB0p5wzM24efJn3JA3Ey+Vm+K1EpRKeJ7JVyFtLN4Qr0znkRS3VXVsc1m/UB8M1WAcEYMP8QNmhonBhJIVHWbx3Wn2p7Fgb08fepNrBFdni7GRY/l3KUOOY2GkYgF5rLklYjrGXbyzO2KyEda+lsrk+qf697PGpwmZM9UlfY3pX83x7pNS3tVQiDp2frgFS/AR9HKAioBvv8AyTsGrpifl2jGs6JCIDOLgDgazM8jdhTgtlF+ozNm1u5OT3KC++2F266c77tq0pnmj6gC+OCKpPamy2p6F6fOJ1olADjlQj0EmPV5RBXPetWCS1YGOn2gBxYUHeAuk+UKBemdvJuT7Xy15b8lUgYiDPNDU91uNmoIhadLZrBbvjQGVeKWMp1f4VrpbADFUD1+WiVG3BL+uNQ6u2zWkB217mOZV6qe74qglrKTh9F4HEAMu7OVGTWGILC2nGHYMYOXRuj4NlvqBZyYQu73/EFf0kEzeWBJA9DAVACtZxXjHNcCNtCm7uoLU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199015)(31686004)(36756003)(31696002)(66556008)(186003)(66476007)(4326008)(53546011)(6916009)(86362001)(6512007)(8676002)(41300700001)(2616005)(66946007)(6506007)(54906003)(316002)(2906002)(6666004)(6486002)(478600001)(4744005)(5660300002)(8936002)(38100700002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFQ4TjFUNVhmQ3dkZnJaWE5LSXR0aEcxb0xQV2lSTmx2TnB6RzBmM1V6N2JR?=
 =?utf-8?B?dUdVWll6TVk5dE5YUUpDbTFiY1loV1NKSW5rbnJjbCtQTTZBZmlIWFNNZnIx?=
 =?utf-8?B?QTNmK3JsRXQ3eG1LeXVIWjlMdWZRckZQZk15ODBad2RaSmZWR1E4Ry8yUFJW?=
 =?utf-8?B?enJCc2pVT3hvNGM1akk4MXZ4Qm9Ob2h6WHNnUy9abHBLUTI4emZzQXNoSXo2?=
 =?utf-8?B?dWRmRW8rbzZ4cGdUUTVRZHpQdko1UFdCc2IzTVlRak44clU4Y2JISTQwWFNO?=
 =?utf-8?B?NjBXSDg0aS9UME52ZVJZeGhiVkluZjBxZWo3OUxmZmN2WXBCUzNZUGlsN05M?=
 =?utf-8?B?RjJvNjdIdVFBTmhXdVhOTHRYWXVlYi92Znp3anJsQWNNUTZPaGxMODFNOEdl?=
 =?utf-8?B?SFRvcW5OM1RqSEFJOFJJOGptK0lEMHVUZzNsOG9tVVc3STNMZkRkZDFJVEVo?=
 =?utf-8?B?am5XcjhMcGxoSGFQcHB0U2dWQzFxSGhwOTRoVGxMWFN0d0NGa21rblB2Vk5n?=
 =?utf-8?B?TFZHS2RkMGZSTnNqaEh3RVRvNHN5UUdydS9WU2FJR1FVZ0pUMTljak53QW9n?=
 =?utf-8?B?WkRNdklhaWhVTUJHSVFmSkp1aGsrd254bFIvTTBJL05OV2NoWjJwQzYyd1BK?=
 =?utf-8?B?M3c1QkdicjlFSFBqUndrcG1QQU5ac3M0bXdPendiRnN3enJDWVk2Tmo1UWQ4?=
 =?utf-8?B?N2FxR0lib0oxRUJiS1YydmpnWm1odCtuSmoySkNIRkZteGcyZ0dOaC9jZWZT?=
 =?utf-8?B?SE8rTDV1K29SNTlQTkRwT09QMjRKTVNRMTZiYkkrMHNyMEd6MkVibUZieGxy?=
 =?utf-8?B?ZG5vdFNyajFFQStHZ3ZjN2k3d1cvTy83eDFkU0J3NWVPZWljTXdZeEZkZW0y?=
 =?utf-8?B?VkNCek1qZWVMeStuTGdPWmE5KytZSXdraUM3UXowV3FoaXVqTjhIY2FYaWND?=
 =?utf-8?B?cURRV0JsNmhVLzFuTHBUdXprMjZTZlBsSDNxVEJBdk9UcVpLZDcxOHd2Y2lB?=
 =?utf-8?B?VkdHTnBBN29Md25HQk52aGk0V3FhZzZaWjVxWlJmcWJ1Z3FQRDZmdWtjNVUr?=
 =?utf-8?B?WDBYQWt5eHJZSmovNUk4dzlUTFRxeHdwVnRUNnp6a0thSFJRb3FqcGFOdmxv?=
 =?utf-8?B?c3lJRWFYUldHem95VDhScE1rUGVMR3ZGbzlpZGoxVStWYXZwYmpGU05wRmt4?=
 =?utf-8?B?WllmWEFkdEpwRDRsNWRlUk8yVW9kM1BlV0taK2hpUGFlVjM5c1hsOVN2M3g0?=
 =?utf-8?B?dWRqMHVwdUpIVExKNWR2ZFVzMlgwNFlORmUvVnRUYjV5TSthRHlzbjVIaEVj?=
 =?utf-8?B?SnRhdCtuVklRV2xWaHUydkwwcWx1WkRBaGRySDF2ek4xZHZ4Y2FWRmk5TVpY?=
 =?utf-8?B?Vlh5TWZzT2NzMVdwdG5lVjlxQU85d1hDdyszd1ZvN3dLUkJXOW1Vdi9aZ0J6?=
 =?utf-8?B?WTdjWGhpSGJxUG5IUVZrQlZKNUV4L2VZRFYwemN1OU03Qk81UHByZmNiN2dt?=
 =?utf-8?B?dHh5VXlwVmwyM1IrYW9tNnJndysrUC9yZllPM2pHa0dmSEJuN0tOMExRSTcw?=
 =?utf-8?B?emNJcCtUaTVVUnpVcnRDMmtlZ0J0QzhPNGMrT3RPYlZQREVMV1VLNmF4Qk5W?=
 =?utf-8?B?OEk0V0ZNT3VZMnJwRTlRV21ONE95b205eFJLMzlTL284UUR1ellDNUJpMVp1?=
 =?utf-8?B?TFFkOEgyTHFvWUV5SmtIMURjb0czS1UzSngvbWhGL3VtaXRqbERmcGYvVTlR?=
 =?utf-8?B?RG9GbFVCUUN0dHN0enhCYkJNZjVKd3lJRjA0QUJNU2xZY1V5ZFRaYmpKbDBZ?=
 =?utf-8?B?R1l5U3NacjVxcnY3cDlUcktkZUpYREllN3RlaXNSVVNNYlZtajgxMWtFSnk2?=
 =?utf-8?B?eWZlREVPTHlJaUNlcWU0eEI5KzFydWZUWHFiZldadG5GUGNaQ3hXalFsSzQ5?=
 =?utf-8?B?OXY3Njd5MjNQcG9xZ3ZtMFJ1NHVxd3N4ZldRaFQwUFFlTmtYUkdjR3AxODB4?=
 =?utf-8?B?OGZubFkxV3F5QzVKdGxZbUlXYThCR3FMZXA1QXRjaXNWQjhOa1dTZzFVVmtr?=
 =?utf-8?B?bE1CNncvcjFySFJPaUJUdnp4dEFBaTk1ZlpuUkxCMUxjbnIyMTcxRUkxUGNp?=
 =?utf-8?Q?V/8NVXp/sw3d1uue+B2yRisM9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f30b6b8-18fa-47de-c3e1-08dafabadcd4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:49:30.7138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZWn50aYPrlAStgceIpIhaw5pwDoceeG+qXta51NV12jeEWZo8/oTkcHcMnQ3LxvhmuKrlrDYoGdruPs/1qBYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8539

On 19.01.2023 19:19, Andrew Cooper wrote:
> On 19/01/2023 1:19 pm, Jan Beulich wrote:
>> Clearly within the for_each_vcpu() the vCPU of this loop is meant, not
>> the (loop invariant) one the fault occurred on.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Wow that's been broken for the entire lifetime of the pagetable_dying op
> 0 3d5e6a3ff38 from 2010, but it still deserves a fixes tag.

Oh, yes, of course. But then it'll really need two, as ef3b0d8d2c39
("x86/shadow: shadow_table[] needs only one entry for PV-only configs")
was also flawed, and I guess I really should have spotted the issue
back then already.

> Preferably with that, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

