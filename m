Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F75771CCC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577863.904944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSw7d-0008NH-OC; Mon, 07 Aug 2023 09:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577863.904944; Mon, 07 Aug 2023 09:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSw7d-0008K6-L3; Mon, 07 Aug 2023 09:01:53 +0000
Received: by outflank-mailman (input) for mailman id 577863;
 Mon, 07 Aug 2023 09:01:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSw7b-0008Jm-DI
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:01:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b98743d-3501-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 11:01:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9381.eurprd04.prod.outlook.com (2603:10a6:20b:4db::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 09:01:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 09:01:48 +0000
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
X-Inumbo-ID: 0b98743d-3501-11ee-b27d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBfzJIgihq0s3nG7bvywxziL/6NYrRTVESamOp87u6g97u5wsRUgRefmY4i6iq7s0mK0hWKUm3HkvXT6OWbfobfJ0mqsyrW77PuiNeqlSWtuvKWg2he0iwflw38fdnI2c5LHbNin5OQi7dI3VaGzxKNUtsWkNWC01QvUYJ9PVIZ1fhYCihthISpzNUrOsixFCreiYY2FkIg7e20ByzBV26pwYC829DMZCNNDUawhCHJmnrSRpsXOlxX5KjPy/3Gv419j0YwfRldQ/i7w+zWF9qozYHCHkIrScjy4Bds38A1EO+b8fFGbntfCLI/gIeMhf16IisGzLTeGoyFZRRV4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Oscl5ZzZsMm0gGBcy8VQGN//tUTIYOVL1oLK6kQsqc=;
 b=l5Mnyb/Ep+6+1dJMvzNQb5mPo+9Mil7BlvwpVmLY7+0TwAn8M3+Wh7IFzxwrmZdnu9WKtT/963gB2UxPJoZNypYOFSOhlR9ABsNxGoHZw57UDBoR6KO6HGj+TNVwmqVpu8UDJYc+4TxZfcQgoUgNR6GDDNv/moyINZSqegMGdFeyuEc2wMChOB2wUpI3RxBZsV9HTwSG7cKqweaBT9TrZ6rUTbmKxfhjlD0N2t0YyjNe00DxQGawpZ4Afzanjfq9+/MApTw6E8S0TWJDrjUdNFFjFAfkUhIs23LPaSaEsIVIoxK8c1MMbJdNUX3DkRRnzqeD5/hmTsaMWVJJathKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Oscl5ZzZsMm0gGBcy8VQGN//tUTIYOVL1oLK6kQsqc=;
 b=hFGN3/5pozk5fdOYPd66WoP29l4yPaATItBooZZ2xke2vFLhcDynS4Q52NaQWa1dwb4V1d2haFOPJC3AwjmjEWvhk2kM485N7cKc98e5oJDq95a5c5dqiQ5nqEvYWKSiwZaevKUOeMgHaw6sw99StxT1XSQ9CqPvSDESWFOTQZx6766WlBodH+XbBuB52qhIAVJfa7MOWO3BDyCyQ0NG1QmfQ3D9cJuS5qQgcCP9I5chtRcbViaPKFPiSmtTLUv8cW0gQG9mSll01RAz7xNjTb89WA6Yw+5T1v2dL9G7gYIAYWy1If7/fO5Y1+4oybTm+sfGPRxAxV/c/Rq8eIaiMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2d4db80-6719-1e8b-94ef-d839e4d6486e@suse.com>
Date: Mon, 7 Aug 2023 11:01:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v7 2/6] xen/riscv: introduce dummy <asm/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1691063432.git.oleksii.kurochko@gmail.com>
 <dfb1c50881a7bb21a1b32083f447e31995004f35.1691063432.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dfb1c50881a7bb21a1b32083f447e31995004f35.1691063432.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: 710a6136-ef37-42e2-05ab-08db9724eeec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Bm9AMimLSJg4PTYGXRH0kehVRc/317DmLjcdTfs0ZIBllQV0TVpqmh66SXfEyWAwF8RljHBj7wW2vSVbyzS2JlYoAuaUwRgjBAMbLL32xx5rls0sTZyOVadyjku07mIw+edvIUySw7KEFifLijXehLBN/LR5FewBsr44TIIF4nJFDvjAQAOAvMlnsZM4DoU3bWaEDv8jlngZJSXaCAr5uLCCn5uFyEaEs1NhD7GEid3HrGisaKvA56q/iYeqc6eo9t47RaleJ0aQzjdknZM0cP5tdaTJpvQbo3vSqDcdIvz5de6QSOtIIFzCScIaSNP8jDwRI2mBe/gV3kHtrPtehxXV6GBc4JTmmbQZWnHK7qAKZinegsJ9QnSVajZvEeGzPzQUAvoQERF8mpO4aKxfFciIbtMA3ipu6mFTqL7BIwHAgo9CjQqstFu1hevdfSy5PYBbjZe3SYKGTgBc46c1HZRJLaj210xwlGyh0MabI2J+07KZnTaMD2NqSVtqcnnaEoQ6IglE/KHxGlSos1dfVvPPyeKIwSJDuB6XFyZS2J2ljvu+lr8Irtttw7AACZbVer83iOa2OwcL2BSG+jjcQ6CTemm3Fdx5VY8qrdGSzZbG7dABixqLwKJ2ov4tdzrVOc9Xiv4HKC8gVux705rYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199021)(1800799003)(186006)(6512007)(26005)(6506007)(53546011)(36756003)(54906003)(38100700002)(5660300002)(86362001)(4744005)(31696002)(4326008)(6916009)(2906002)(66946007)(66556008)(66476007)(41300700001)(8936002)(8676002)(316002)(478600001)(2616005)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGc0ck8xcVFieG5Qdzd0VTdwME8rYis2Ni91WUx3TDRzTXRNcVV2V2pycGlD?=
 =?utf-8?B?dXBnUkR1ZHN3S0lVdjN0Uis2TGRjRUsrY2hvZWg4L0pDcTl1aE5qOHRWMlNu?=
 =?utf-8?B?bXBxbWFiMDlkeTVVeEFTMXRvOFdFblRQcE4rY2Z6WVRrSXppV1dMOXRFRnBJ?=
 =?utf-8?B?dEx1NGc1L082NlFWQWdOS0UyUTZ1VDVtUVIycmpsNVVTVHBiNkNZWEFKZ1RN?=
 =?utf-8?B?MUhiT3RoQ3RydlNxOXNSazZ4THlqMUxzWFNDd3laS1k3SUluM2tmclZBVUdp?=
 =?utf-8?B?NG1vQUcvazNPYkg3QkM3M21qMDNDU1plQVo4SERGaytUVi9mQU5pYW5TRFF5?=
 =?utf-8?B?Zlh1MFVYYjlma1I1dmJVbVg4MnQ2MVhMaHdCbmpjTlhzTUZDRHdjdGlnSU5o?=
 =?utf-8?B?ZVl3eFRJejBqTVZ0VzcxRkt3ZTBiLzJLZlVoamt4Qmh5Z2dPMHh3TlZzQUd3?=
 =?utf-8?B?NE9RQnhFaEZNbVJveVhJTnBENnQvS1pwaUI5YmNwTTluYit6amx5Ykl3Qms3?=
 =?utf-8?B?Zmc4Uk9WenVia25Ca3pXSXV6eGM3YVpUMlZSVHdROWVvWm9uZTd1WExUTC9r?=
 =?utf-8?B?VlpGVUs0RkNvWSt1ZVhValU3OTl1NzdWMlVUZUZJVGFvSGVrRm10VlhPTjRO?=
 =?utf-8?B?UmRnbjdIa1FQb0V6dzdzOGFwc3dqUzNDczQyQ1N2V01GSlpxZUZsKzc2b1dF?=
 =?utf-8?B?c3ZONkdYeldDVDdqOFB5N1BDa0dyQ0pFMmtXTE8reitXcWtWbFE3RGJCYjF6?=
 =?utf-8?B?VGJDMGc3a2tzSytvS1NXQmV4RUhobU5TQjh0NG50dmxGa3lob0JFRWdFV05v?=
 =?utf-8?B?QWNsNHI0Y0hWM1hzcFIzZTJTWUxzWjk2LzB5RnM1SVptR05YNUpVeTZoMXNn?=
 =?utf-8?B?clBqbGdMb2VKTEdLVkJYT28vQ2RZaElJZUR5d2l0ZHJaRUFWdlc5U1hvWHlj?=
 =?utf-8?B?SVVFY3diVU5NQ1p1T0Y3ZDVkOGswekhNakk1RjE5TDBnNVp3T3lMVm04c01i?=
 =?utf-8?B?RlE2Y3FRQmcvVUdVNTYzVFNvbmxZT1B6NFZ5V1NuY1lSU3FrSkMxVythL1hp?=
 =?utf-8?B?MEdsK2NYQjVTb0JnVml1M2Y3dVR3Qm1ZUTN3alR0cXhzL3BZVW5MZVpoRzNl?=
 =?utf-8?B?M3luUDJmd1o3NGlQQUZVdVlXVkZIdW40b3pKb0dKYkNvMS9oc05vZEJYRXNr?=
 =?utf-8?B?c0Y0ZzY2Y2h6ZzRhTnFuTkJFMkVUdmhlWnJrcXhhRFZmTFk0eWk0aUQ4MkRF?=
 =?utf-8?B?V3NsVE90THNTNUp1aEVlL3JWWGpvYTRuNUJsU3liY2ptM0ZQME9DQSs1ck9j?=
 =?utf-8?B?eXJQa0EwRUsrNUk5ZExPSENCYndvQkROb3g3dlFOUmxxcm45T0ZJazZqUEdJ?=
 =?utf-8?B?MU5HWWkzaENZR2pqZjJFNm9rbTZuT1EyWGtSM1dQODhqeFlhZG96VWVDUUpk?=
 =?utf-8?B?RkF6eEZURWhFQnlwcks2a2NBeUlyYWNQK1ZhTnFPZ3F4T3NxVFlKUDl4QTVu?=
 =?utf-8?B?cHd2VVFyOUFvNitQNGxGSW9pWEhYZnJRRmRkS0dtTGtGNHd0MTYzb0hpRkZw?=
 =?utf-8?B?OHp3bzZoRkxQbm9kZXRyRVNjNjdEVEFwU1BkOGFVN1ByQ3ZObnBBcVh2QTdO?=
 =?utf-8?B?RzNBWllZY1dmWFhQVERqT3orVUxzcXkxd25lWklrckVpbWM1VThOS3A2WFU3?=
 =?utf-8?B?R3gxTENPazF4VTVLVm9hK1B4VXpOQlN0SXZGdGFadUtBeEJhamN3d1V6aUp1?=
 =?utf-8?B?QVRIbGJKTnQ0dktnUHByZlF3R1NEVFg4emQ2NDVLQkZKTkk1NUpxakdtalNy?=
 =?utf-8?B?YVQrNTBaT3p1SlRjUlFmdElVd2p1Nzhyd1JuRHg5ZGltbjdRMjdUOFl3Uk9J?=
 =?utf-8?B?QlUrcDY4YWNodzhJLzI2dy9UVlE2d3hXNjJyaVJsbWNaYTgzcnV4MXVjZDRH?=
 =?utf-8?B?SFd4UGhEaVdzTUhTV2paY25zTFV0TEZiYjlGVUxQeStzcDVmcFhUQlhWaTgv?=
 =?utf-8?B?dnpuUlAxWVNoVStveC9QSkkxVi9RZjRZOHBzek5jOENKcjB1eG5xWEVtWnpq?=
 =?utf-8?B?WjRIWXVuTW1NeFF4SFJuUTJmUHZsNmoySjZnb3N6d0tVTjRDYTFiTGhNSEN2?=
 =?utf-8?Q?UZWVBR9LWlpmzCp8dWk6Ovzyn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710a6136-ef37-42e2-05ab-08db9724eeec
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 09:01:48.7158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ippd7hd9JY5DOE2dQ3T1uqCVMfdhAgdpfQFAYb7lx/w1N/+8S/FhSfNwdWQFlT3AQUW7b6cqYr0V4+ZmUm9UaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9381

On 03.08.2023 14:05, Oleksii Kurochko wrote:
> <xen/lib.h> will be used in the patch "xen/riscv: introduce
> decode_cause() stuff" and requires <asm/bug.h>

While as it stands the description is accurate, I don't think that later
patch has a need to include xen/lib.h anymore. xen/macros.h will do, I
think.

Also please don't write descriptions in terms of "patches" or more
generally future "commits". Their titles may change, they may disappear
altogether, etc. Finding such a description later will end up confusing.

Jan

