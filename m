Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A3B72F9BC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 11:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548643.856670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9N8K-0006U9-1v; Wed, 14 Jun 2023 09:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548643.856670; Wed, 14 Jun 2023 09:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9N8J-0006SL-VK; Wed, 14 Jun 2023 09:49:43 +0000
Received: by outflank-mailman (input) for mailman id 548643;
 Wed, 14 Jun 2023 09:49:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9N8I-0006S7-5r
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 09:49:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7a7e70a-0a98-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 11:49:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7884.eurprd04.prod.outlook.com (2603:10a6:10:1f2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 09:49:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 09:49:37 +0000
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
X-Inumbo-ID: c7a7e70a-0a98-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4V/G4KXpp5RPkmwL58q03Gk9Au51XyqvmB4+TDltT1AD6YUnsGAxlt7uiKvL2mkPMv9EQ/Wk0ln6SLAGRcJIOlOlkwr++JyBqsgdejWDZgc5L8OKF1L4e0T+YaLFaElvLQcG/Cp31+lr5jKHSA60ZAq11JrpfrC/ZsjL6V02X8act3WIEp6wXeL6mri+LxxmLXsjKapUI0iuGhsB28NqFtVxQIxhdPGdULHplhkwJ/ME6A/sjH7QZaod6VdrdrMk+gD/Y0qwG3/YFzZrAv3fmBBAqH50yjdaQRiwrCcAiTc27o4oguUrKpAfq9PqtktojBE8LAp+QRqrXyg5locCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UG3CN7y5ALcWwbVCs5KJLsIk+zG5RVr6nb0qeMVpp/I=;
 b=M75qOXIgMsxxuc4owk/3RHB3WsAqwI43plRS+Vpxd1RmmmW89e1Pn0kVbOSeupcCHsN9X7sMZTPQoUdb69CO4G79riBMO41RHr1pOY5CfDNwZOdcA4jd9RpY93z+jgwzYFvmYpnTICtGBw2zPrfJRfeBVzwWLxhvegu81NIla1zdiPawqIz0Qs73EOgNKL/cocwt8zhv0XXCO0EON7xeHR09lC5jl8HA910+7thnJsmeXEKjUxEqpbIkdK+j1PNdM3vAANlPhMLsmqO4adhuxhBEQc5Jfdbv1dqk1y/rD8lWmf5KBHo8OSSr96dnNvYLKdvgieLTxOeo6ZM8izHc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UG3CN7y5ALcWwbVCs5KJLsIk+zG5RVr6nb0qeMVpp/I=;
 b=0YUsnIESQVLteG+J3ZRnwTA4R5DPk5r8vKZN+UVYlCnZSYibvMNGxjGoKL+IrXyVRXyJ5nrYBHWF+K2+eChRj056UpIGH7dLOG2ABGCmzF0jTVuEOIlJIvMOvogmhJzpU4o1ynOlOdNhwiravQcoldfnWYADfDYU6vlc3Qkt6Wrmv1gEEO/er4wTz2K4mub9kRbwu9ARzg9sA0D4wEhgdVwNx72fzXJzt3oBbvVrjpnfpDfNdpLFsjaI/AAgT4l7fPaVFGQidNJzsmRNX0G/uJHaPQpNg81vKTrjHPXdbJ9BrPdE/iqg/GlKXXtqyvfH57YrsZjattgxXotFj3s8Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea515188-732e-50b2-7e0b-39721e859e11@suse.com>
Date: Wed, 14 Jun 2023 11:49:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: compat code lacks support for __attribute__
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
References: <20230614104234.56835aa9.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <20230614104234.56835aa9.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac3be3e-421d-4bb3-2766-08db6cbcaa5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WdEzamDbRFezHhibAqHS4d0AsCi7XbJsO0KRkrTqZZKEKzb/zJMa6WJA5HgzGBDXCIZTC/pIkTyZCDBu1lJIsl91VZe2FJ+2K93jPvMGJlx3/RA5uiVJ2iD6DAj4DgRLW2kQw/ruMaRWdQ3lqmNvkfO2N0PrAenvPnpcbzBvd5ggse5LpQTkIiDWXIMnHTL6AfNEles9gK3Ru9Ofod3WYbQVw4iPk7Yv32hiFZIvQEzbtEeSNt82TR53GNuaJaf6lnFCwjd3NRS7y1Qj+HrudfkXUR1suoSdgZcAR3fIdyhRR5d1YI+G1Bv1r49PfuZohgmcf0/UH3LpYObSObZLoBXGzZRNh3BvKx9ucEQ5KKFyzfkZa3xxC5nyi6lbfQWfPS4B1yC3ZbpQSjrMdrHbMxf0dqemWiFIIf+45aPWqC5FASZTKAqF8BL67nF+2xG6fcZ9c21HJzYM7wuPEtk52kcxdLRlVL9IHmX41KGS4Unz6C8tLkwZc66DKdvdVWFDx0KPj5yh+cDTB7foo8LI8T/Jw7Ui7Y/xBI3ko5zz+BAvt5XCVMBj29AhuunI0u4YWcw65Nqb/Cq6ouoPmpHLbIO4pRLjfM3+wotP71KmrXolV9D2cnn1oZ4raHSoZHCwq1K7uWEvBkJ214T7niy6RA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199021)(26005)(36756003)(6512007)(6506007)(478600001)(186003)(53546011)(6486002)(2906002)(316002)(41300700001)(8936002)(86362001)(31696002)(31686004)(5660300002)(8676002)(38100700002)(83380400001)(2616005)(6916009)(66556008)(66946007)(66476007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0MxS2t5TWNNM2tEY1BtY09TckVaOGZBTC9PNWFGTDllb2pVSjNpRmQ5Q0s5?=
 =?utf-8?B?QnNWWUh5VlZqcnJHWExpUHQxcGM1dG5nUXVPVnN3MDZNTGRvQWJRZElNTVF5?=
 =?utf-8?B?czB3WVFpTnZ4TWZQL3lSWEJFb0t6d1JNWlZxb3NpVFNDQmJaUTZsMW1GTUlo?=
 =?utf-8?B?NFdBSUp1bEt5YzdvdU5BWGNFejA2ZFB6KzRYL3ROcUVnRlZ5WHZlVDdFSWhm?=
 =?utf-8?B?UnNySjVaRGNDZUJBWjNncUhiYXhwQTd4NDVVRVBkNGtGL1hLRlVLYitNeVpa?=
 =?utf-8?B?OFdQakFzSERtTTVqRXZJT1VRZHVueGRrSmw2TlRrNVY4QnRUZngzVnljcXpH?=
 =?utf-8?B?S0NtUHZQY0xpRG1FeUdjaDNDa2xHakE5YnFNNjBsc0VWZWRDbVl3UkxFbTdK?=
 =?utf-8?B?d1pNR2ExcXB6cDREWTZGMXdKbCtUVm9aTjZpL3ZUcXpiQ0NLK1ZDT293V0tU?=
 =?utf-8?B?RlhDRTZJMzhyYVVoZDQzWEpaUjdpcmtJNi9wL1hlV3oxVy9HTFVTWXkrZWRI?=
 =?utf-8?B?WkI4cSt2SzlqYmRWbXV3OFN4Z2JnWUhaOTFaWDJRQ1pqdDhXN3kwZ1pYRXhX?=
 =?utf-8?B?WHNMRGs5UEVab2pEeDQvRjRhQjV0eUtvNEt4WnkrTUJwVnA1YlhoWndhY3VB?=
 =?utf-8?B?V2RWRVdqUE1vQThDVGo2UEpzdG1IZTBtVFozK2p4MEVWN1BwZU4xNzVVRWE2?=
 =?utf-8?B?dlUwaWlMTzVoTVhDd2VzenFoY2dnb1ZMaTBRT2dLTmRxVjg3UUhlU1BPV2pj?=
 =?utf-8?B?ekhkWFFiZ2MrZ2hsNlplQ2YzWDNuWFpQOW9xTjEzcWJnUDdFSmV6REI0bUIx?=
 =?utf-8?B?YUN4S1orSVNxbGFGUjhoTllRLzlrMFFPQWF5dEROYit5UytocnRicERna05i?=
 =?utf-8?B?L1RYNXJKNW8xRmYvMjR1dXc0YkdrRy9uOGZlTGthWklNNmVpM3BDS0dpZWJK?=
 =?utf-8?B?VXF6N2JUQjZwNmRDTk5IUEIwdm16cVhmTHU0UytIM3hSVk9KalkrWlZBYWhW?=
 =?utf-8?B?T2thelJVa3RBOEJjNmw3M0t5WE5vS2VVV09vWGU2cGlldGdseU1IbGJCc05r?=
 =?utf-8?B?YUhxQXpYdVV4Y2MwMENSSXFyeGQ4TlFMOFhuZ3RzZjFuWWlhTTd3Vy9KTzBy?=
 =?utf-8?B?N3Uxc0FZOUpHY0Z2WUdSVU1JUHcwcXhqZjlHR3lRR3ZCVmhXS2FpVmxyM0N0?=
 =?utf-8?B?Y2dnbU1LVFpqOUx4ejVKNlphQkpSZjFEdnZpNDZKN2k3TmtnTjYxQ1VXWnNX?=
 =?utf-8?B?NkxyRVA2YkZyTXVCcXNJMHYyckNtMlliZFR5eDExczdPRnVmZkFpaTBvSHpJ?=
 =?utf-8?B?aGdlT0EyRCtxSnFIWjM4TnY5WDJzaFAvbWYySnVtOWdCSURMYk5qUlFKSlM4?=
 =?utf-8?B?T08wTkJ1cm8ySEUySHY0VG9US2JWM21kdlRZcTJ6cXVDYWtpUnZEZnU3aUk2?=
 =?utf-8?B?YllZdGJWRXBXcmxzNVdjMmh6M1BOSWxzSk0yT0FKRllmMEhkZUJEWTZLNmd0?=
 =?utf-8?B?RkVGL2Mrd1BPK2hMZzR5T2htbFdiSklJbmsrQ1hxMnNFSit2bE1Bb0JhcXFp?=
 =?utf-8?B?WVVMU09hL2svRjIzTllmeGtNNmljVEYydUpDeUVSSnlRSFU2SWtqcXc4S0Rh?=
 =?utf-8?B?ajF4eVplQUJFL0ZpSVhjaldZcjhIbjhMelhmRDNHRVd2WHhzWjNWK1JNanlR?=
 =?utf-8?B?L2NJYlpiaG1RQ3hGc01wSUJVOWx3dGszenNYVzRhVUhNVy9saVF1RXRxaUwz?=
 =?utf-8?B?UWVJZGxteFVyUG5GS1hrMUgxUjJEY0wreXJqT3BVejBMYWVCUjRYUGZJSTk0?=
 =?utf-8?B?SGxzQ04xQmQ1Vms3Q0syRG5NbjNKK1d6Wm9hN3dPTW0yLzdIcXBkSmxFdkJr?=
 =?utf-8?B?UGUzVFJXblcvTzdnZG1JdEhyOVE1R01lcHVLenFVTExwVC8zejBlK0o1aGwz?=
 =?utf-8?B?OVRVbWZKL0lZcG56Zi9xTUcxYVJUQTBLcnlLbUdaU05NVks2d1ZGeWl0L0ZG?=
 =?utf-8?B?R09TdDNkeWMxWlFHTWdJOFpZUjdKSy9LandlTHZVSTI3aXI5UHpEakt0MS9p?=
 =?utf-8?B?YjNLT1RXT3IrenRCQXdJcGZJV3o4ZnpjOFR0WnkxN0ZSU0M3RmZNMGZZaEtJ?=
 =?utf-8?Q?QiWs9N8VO7q111RFZw2VOWTDS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac3be3e-421d-4bb3-2766-08db6cbcaa5b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 09:49:37.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BugASBaqDVjC5Nvt52JUbs1LJ3Zxmral9HZyaLQyooH1/M4jitMaIha314IMqpPbahGQeBLYH4S4qMTmC47Rkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7884

On 14.06.2023 10:43, Olaf Hering wrote:
> I would like to share code between the hypervisor and xenalyze, so that
> every definition comes from a single place and is not duplicated in xen
> and xenalyze. This works as long as simple constructs like struct x {};
> are used. Depending on the data to be stored into the trace buffer, having
> support for __packed may reduce the amount of data that need to be copied.
> 
> The tooling currently converts ___attribute__ into compat___attribute__.
> Was support for __attribute__ intentionally left out, or was there just
> no usecase for it?

It was intentionally left out, as the public headers that are subject
to compat translation are supposed to not use any compiler extensions.
See also our checking that these headers build in plain ANSI C mode
(which of course doesn't catch all possible cases, as macros would
need actually using in order to spot issues).

However, if you're after adding packed attributes, and if you're
meaning to only communicate between Xen and the tool stack, then
the requirement above doesn't exist. Yet then I would also wonder
whether you need any compat translation in the first place. Those
packed structures would better be arch-/bitness-agnostic, wouldn't
they? So perhaps we could arrange for your additions to be excluded
from the compat translation machinery?

Another option to consider might be to use #pragma pack instead of
packed attributes. (I can't say off the top of my head whether such
#pragma-s would survive the translation.)

Jan

