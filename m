Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD4257B58A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 13:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371507.603466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE7va-0000pQ-9n; Wed, 20 Jul 2022 11:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371507.603466; Wed, 20 Jul 2022 11:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE7va-0000na-5t; Wed, 20 Jul 2022 11:31:42 +0000
Received: by outflank-mailman (input) for mailman id 371507;
 Wed, 20 Jul 2022 11:31:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1QO=XZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oE7vY-0000nU-MY
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 11:31:40 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150051.outbound.protection.outlook.com [40.107.15.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8572589a-081f-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 13:31:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8088.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 11:31:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 11:31:36 +0000
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
X-Inumbo-ID: 8572589a-081f-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y70bw6x+bWC44I+VuhNZNvicchCmxHlxFmHJ0/q/XaIwhYZGsOFatHkpSL4Y2fOa07HWVBFyoI6iAkSIGfA+M6K9iIOtbx6dUIXXSD3P04nFTnCKWKHfsCsXsPuFrzj5IGrYTYJ4MxDGFK1Fnne12lrKT32YSkH7hziS6hy1jP3sbIB38SzcQpCRtg+TeI4RThG5oJ5Z/XHR21utIzO+czGyYNJqLG5ZyRZ9vRxG7xwyEJFpM3GM6PyJ/DiyBIRT7EQ5k7qU/KTxfVzAALKe2p8otKexhnQObiGwKh9SIYFvlu/rYAMhYR+9gKoxDUqogCu+mhK0Sq5H90Rm5ol7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SI8L4bIQyrB2moWBqY3UYxaMkj6LMuV+tsjZDuMJGu0=;
 b=LQZfh6bIfEvKLSH+QrcqxcZErSrGMs1vzDVBq0bXp9F8vAbc61LOyhin/W+/bZZgGvwKJ8S9ifxgpIumlXEsLl5kVPcgBQE3U/VliJJQgFhAv566ugZ48rRraIxdZk82QJr75nVB13Nf3Mnc+6mK9qhBPbx0DIv5srqD+jrwGgkvff82XpcCq4288e3znWuFIJr+dEnFZZZAkF72eHDRmWxh/VwB6vci/rhgJkZ2A6TUPrAnf6RwFOaPwFS5G8IjLBIF5MZsYo3pHyGmHrBVnbGePcAM+FvnY0nFiJaKN3+S2Fx+i+OWGLLL5uTc8UA3i0okW+NkJCPNoQ3NQZwG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SI8L4bIQyrB2moWBqY3UYxaMkj6LMuV+tsjZDuMJGu0=;
 b=eNpWe2JCRWLHBuem3pSXqWICGgUa7qFbePlahxHKaHlDmuGQlyJcb1Wny7xHgpQpI8RxCdcmfWHZvcdgXvR8+4T4S+9EAQZf8yBPUSqLvHAVWUIWSmC7pWIoAWP+cG3Sn9FEUBoUlf+cIEvY71hR5z/CLPN3C9/qYmPx7Ck73edhjfo3E4n1GrVcTpvVCoVNtP+JO1F4gvDDe8cWHmoWya/ZWdJ5I9+Wrv1tlwmZQXzx1HWoBCaGgfjPZliGyyRlGuf9hQf304p4UnFbrEBrWqYRIKxVByhTYHmVMpkpDiKY9a5eUrXb6s7uXJ61Vc69QlObQm0gtVpBe6GkgLC6Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a1bf74a-b291-076e-1eb5-102facef6fab@suse.com>
Date: Wed, 20 Jul 2022 13:31:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Panic on CPU 0: FATAL TRAP: vec 7, #NM[0000]
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Michael Young <m.a.young@durham.ac.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 ChrisD <chris@dalessio.org>
References: <202207200448.26K4muXc067471@mail116c40.carrierzone.com>
 <49352a0e-89ef-4f73-1c4b-ecfe6e0e49f0@suse.com>
 <d0eeabd2-2158-bfdb-c0fa-634d585c48ac@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d0eeabd2-2158-bfdb-c0fa-634d585c48ac@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84f903cb-a2c3-4aaa-ee13-08da6a4367fc
X-MS-TrafficTypeDiagnostic: AS8PR04MB8088:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YBRW7ZEAk1g4myfi702eEr9rcBhWXNHUxHaKL+7OovYimooNF9ECg3Vwny6EyhLf8yg8/TnmdqnR8sbvPpDCoHipV7UOKiw4R8YfOUBgvCdHN2PIIMVSbQRyYppyoZ85TjIFOJ1TSHmX+x7AKwBk7FGrb5seL1rJhpuIRrfgQgXc3Jknb40sd0UjJNuvycYpIFFGvpM62eexDwSDnZSE9wKaM2/kagW61yjqFvs94aDXhbnWyZs9hXu5kzLjmKddvRYsX1I3XTGwta+OSLhCJXeHl95+70YuUnyZh7sCHPa9XGmCozVYoJa/IgWKAT/jHybLeEfp29mSTaTQTcaoQhSfqadXTVRTo3C8uh5YwW7eouNY3QxueAXBLtvC/F5LYLmAIKHS+NQxPpkUTHStfdvxyl+wMPQMFOwxCAm3rxK7x05BZZ2L8pu6UnL7VP6aiE/HxsuY3xsB6lqcB+x+edc8chIP5EvcZymDJlXwvF6tpWGoS0kLG+0+175JQA0D4/L3apwa1FAavmBY5yKt5319u0LFceJEaaGyAh/fQe+GiMGkdwewl97SzD1pywquYjmWKcZETVwFM/k2BMLgI3UoXRGXHdvP+gQFizAC3iL6KeH4eXJPBGrjO4bj8/EwRyK/ivVJibVkXlGKz+i6rlI0Tls5XNSC7HepPqg/FVds4yYQB56UKFy+GJQdJ0PpbMlilmRIrizKf297dAKIoNNRbc86VGEb2EpFntKhFANtvs6c57bxXK7bSlX/5xwTrjqSBhmkI0xTmTgBWTxM6hcf/BiW8u1T6BhLPLP80WHu15Oam85SgUG8jeC2FvcwAekd42T8HqW1bgXbwOYcRbN3BRT1RBJcSfZEQcBz7bQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(366004)(396003)(346002)(2616005)(316002)(6916009)(186003)(54906003)(31686004)(83380400001)(66946007)(4326008)(8676002)(6506007)(66476007)(66556008)(6512007)(53546011)(26005)(86362001)(31696002)(36756003)(478600001)(2906002)(41300700001)(6486002)(4744005)(38100700002)(8936002)(966005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bi9sZnorV2pKMVJUNTFZYzRsQ3JIWDA3T2VFa0w4NU91WWtOaHFMajBWcVBr?=
 =?utf-8?B?MzEwWXNPYTFieXJESVJvRzY2SFdPS2RXUHhGd21zMFVMbDZxOTNLN1RUNXVU?=
 =?utf-8?B?bXFmbk5vbVNXYVBadW51cDk0cXdoS0p2QkhrbmllUUx3S3JldXo2YUFPMG1a?=
 =?utf-8?B?bDBWZk9hM0d5b3BrZnVFbkZYcU5LT0Fkd3RHMFZKQjhVWnpHNWZISlpsK1lF?=
 =?utf-8?B?OUEvUnFmV0hHdkJsWjFNdlpQOGptMUtaNnRXeURKSW5WQTdRZ0xjaC9LMjhN?=
 =?utf-8?B?a3NkeWorNWg5ZmpBYWxJNTBobUpuUzhUVmczdW01UTlrcDU2U05uSk9wTWNM?=
 =?utf-8?B?NnBWQ1hKL0NjNjhlRVBwOW94MkFudUpLUlJpNmNGRS9namRGUzNjQWZqMkgy?=
 =?utf-8?B?ekRoOXM3VUNsODBUbk84MUVpNmxPYVRMTENGOS8yZWpnZG1xcDNnOXVmWXM1?=
 =?utf-8?B?a2hsQmRNRUoxd3N1Uk5LSFVtWFYzVlBnTmJ5VWFPMFAzVHp1Znp1eHZmWG1n?=
 =?utf-8?B?b2Uyb1Z6U21NVkpNa3E2QXB1NGdTMHMwQ2NNRVEvMXdXVTlFbHJaNjhXdktz?=
 =?utf-8?B?ckNRWk9NNjJMTFlpNGhWNUpJemZLYVJIMXRtem5nQ0tUZ0dDb2pUVXZDNE1U?=
 =?utf-8?B?Rnd4em9XWWhtUVkxZjFPa1Y3TlRkeE1MS0R4VE0zQ2Q0UTFOeVVPU3E0ekFJ?=
 =?utf-8?B?SWtXeGlaajVFK0kxQy9FVFd3dklQMnQ3OGwzVE1GcUlqbm9CaUxxYTBkUmtX?=
 =?utf-8?B?VWVOUEJISGh3bWJQNlFEUjNJN1dVZ2k1NFNxRjNFZC9Zd1BUcFdKYXRMdnJP?=
 =?utf-8?B?cjFYcDBBZFgzaUhkaGpYaEgwN0dZbmZ5KzlqN1lic3h0a0RKWFo0WmpRMnRv?=
 =?utf-8?B?bHYzc3hEV0d5YlFkMXIyeldjMnJvZCthM1E5N1dyV2RtbzlkQVY3bmQwUzBZ?=
 =?utf-8?B?UnZTMEtFc3B1QWZSTHd6NDdRZENmTjJGWHI5RFFHQW1ncTFLYk5uVm9YYXFY?=
 =?utf-8?B?NzJpSWsyQzFyWGRiUEFwZ2pUQ0VRMEJNRzBWNkRTS0J1QzEzN0t4Yml0b1hU?=
 =?utf-8?B?Ti85N1I4alRxendVR1Q3WGtxLzF1ajRtYlZaWHpkQlpjZlh5VDNxL01QNS9l?=
 =?utf-8?B?cVQvNkxRV0FmYWZCMnloMmhNeFZlclcrcHdmWEhEa2FDdnJGdVJJYktmYkVB?=
 =?utf-8?B?TzZzLzg2bEVpQ0lNRWcyNVVvbmVkbk1JQlE1YlNSTjIxOStpMkZNTUdnUExu?=
 =?utf-8?B?eHdQc3MwS3lrSlA0dUxPS3l6Wi9JTXBaQ3N6eVZjRURqbzRYcDk0b2FDTnlN?=
 =?utf-8?B?NGIvcnIwNlZvNEk0cFYybEpSQnFCWkFmMHBwNktDYUFWRURkVHNNS2szbFpl?=
 =?utf-8?B?Zll4ZzNScTFleU5GZTVQNFZvTlRWWDZlSEl2QzdIODRmdTFxdUpWdm56Wm9P?=
 =?utf-8?B?YmVVREJmQWxWY2lHaUlNYkRkbzJyQ24xUEhodHRFUnZNempVeTZnTEtHWFZD?=
 =?utf-8?B?VGtENlJDOVNjZVNzWDlWazZGdTlNM05ITTRBTlRGRTgvSzM1Yjg2ZCtod0tG?=
 =?utf-8?B?YWJpRlZTeVU5VVJXWnUzaHhWWlB0VGJIZDBVSWQ5Um05dWpoV2VCNStQZkFV?=
 =?utf-8?B?N0xpSG5RVmRsSGRJUGE1SkMwZGErM3ZVTjB6NWtHMDRFeURSb2RMeGltbFBq?=
 =?utf-8?B?SStRMVVhWnNvVlhWZmZPYXdnajc5S0x6Z2grQTg4T3RscVJMOUsrZXJUaHlG?=
 =?utf-8?B?RzdtMWM3dUFVTy9UZHVUYjArRjBKWlc1RlZTbkFLaHZBT0NZaThuZ1pXODNV?=
 =?utf-8?B?VjZLK2h1K29NQ2s5Y3N5S2hiQzFqSUoxN2UxMzJpVS9NTTJ5cWQ5QW91NkVq?=
 =?utf-8?B?Qld0RXk3OWgwaGtxUTVRdVo4TVM2Ukg1UWYxQ3J1UmFhLzRsNFhSRWg2cGtz?=
 =?utf-8?B?YzJCSmROQUN1NS9qZC9ERzVXbUZPT0xxVjdvZVhrbWVGV05QTXU5L3Rza0Ny?=
 =?utf-8?B?T3VTWm9NT3Zvb21ZREt5L1VWNUZSbEtxNkUrdllDNnBmNlNocUxxcWt5c284?=
 =?utf-8?B?VFdTdkx6UUloWk9mK2N2bHdMSmZjZFdLeERYbXBvRWlKV1QyTUlzd2R5cU9K?=
 =?utf-8?Q?r3gVlqC1I5SerXbMysAGV41es?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f903cb-a2c3-4aaa-ee13-08da6a4367fc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 11:31:36.7110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhxtgmuxA7AP8kRqqA4mkzCuQG3sCrdtXVs4NiBULwVxDBYDeRCKb95c+3L4tb213NkkBFzz+19/DeU6O+9qIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8088

On 20.07.2022 12:02, Andrew Cooper wrote:
> On 20/07/2022 09:19, Jan Beulich wrote:
>> On 20.07.2022 06:48, ChrisD wrote:
>>> So, you think it's a problem with fc36?
>> Well, if that's where the binary came from, then yes.
> 
> So
> https://kojipkgs.fedoraproject.org//packages/xen/4.16.1/4.fc36/data/logs/x86_64/build.log
> is the build log.
> 
> For iommu_init.c I don't see anything overly concerning, although the
> quantity of nonsense on the gcc cmdline is speaks volumes.

Hmm, I wouldn't call two uses of -specs= entirely unconcerning. About
anything can be enabled/disabled there.

Jan

