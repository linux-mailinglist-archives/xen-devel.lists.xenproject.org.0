Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA9B64C4F6
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 09:21:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461812.719958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5N0z-0006uz-CR; Wed, 14 Dec 2022 08:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461812.719958; Wed, 14 Dec 2022 08:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5N0z-0006sM-8s; Wed, 14 Dec 2022 08:21:21 +0000
Received: by outflank-mailman (input) for mailman id 461812;
 Wed, 14 Dec 2022 08:21:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5N0x-0006sG-V1
 for xen-devel@lists.xen.org; Wed, 14 Dec 2022 08:21:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2059.outbound.protection.outlook.com [40.107.6.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48ab3f3f-7b88-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 09:21:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8038.eurprd04.prod.outlook.com (2603:10a6:20b:2aa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 08:21:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 08:21:15 +0000
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
X-Inumbo-ID: 48ab3f3f-7b88-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IA6hGzlWyVaga4UPmlHYaM2o8eMY3Fyahti+lIqcWkRpHL2dIoBtPq7ghMRzoM6+DY1qJ2mtf/rhnWYo7Y0PTW8rGGesbwIhVbJklxRXFPJsR8ijePWhsXHoPOFOx0rBXnOu7flc8R7Ac7zVFgQGAZM5y6VGLUtFQub0L6qGbR5P/y30PKu6l2YaRacjtTIdGgAOeVICbubvtQ5+g93KeHrVXYPyCM1WISYZ9N+/AgLbqOtsCRjfKLfcMUIMcdQ44CJkbYSpFbmNFRhYoXmbOmv6dLv72tKeaGN2lsMXzo/057Oj2mmXP7w83XGRZx6gKDfFqihcFyqLXJutpxvUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtrOIpBPAbPhSYUexI4OcRm1sUQ6R8q7F2TdUya+S7s=;
 b=ktJQmpPG27w3KmfEmMnngDI/T7m5f033222lStiCZzpGtaoYAqz8AO1gjnucAOyJwtCROdikinCtYH8i7LMcFe9fepiKMmezm24ejsxJMkz0SofzSJM+LgNLwXMd3ZFoHM/ghO09ljADzAbe7OAu+xQLet+CahapjbutmG9iqDxEpquM8Hdmu9cRwY7FjI9NW+6uGoWo87M8QIzCN+qEoCxZ0c2nYRoTxvMfS5XdUCTWn/bR26E4YA+AO1HuN5W6uLOSbIhswOS2YdH8pLZXtqAZK0SUNQkNN+oW+e4rf2a14JfaxMYuwKBytWodxDl5bUZ6EqlERH/7jDCjdHCQhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtrOIpBPAbPhSYUexI4OcRm1sUQ6R8q7F2TdUya+S7s=;
 b=k/bg4rpl52LC9UTMcCr5S7I9Wo3qz/1W3ljNGcyqBo8MgkcFu7Bdk0orTLqgfHVkXoN3LEWW0uh1aty86Z0HZj453Kt0d/ik3OiUAGt3hVSEFXJkTNqyNDQAU5Oug6BCsxgd58bHYIbfUIK8llHHv1fv/O/yUUmcDIAEPKCnfWDsx+J3JNba7qM3wf33jv9yggCigdqw/ksUHGWZr+hnK22bjW+qyu/uM7+zSZWu39zxJz0Zkkj0SWzrJOAPrxlqpwhmd5vGE5bdq8bKqt88Rt8u5U9wcQhq88ZvziRIiZ+VZhIVTFoJQRJHtNy0MP1/wdmweKPVL05XW8NRbku4Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47096c1c-4b03-2e3d-c28b-c8920b7d31f9@suse.com>
Date: Wed, 14 Dec 2022 09:21:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V10 0/3] toolstack support for generic virtio devices on
 Arm
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1670994930.git.viresh.kumar@linaro.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1670994930.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: 68116aba-9876-4507-7ff3-08daddac2b2c
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rM9IikOSoPe5qCsSu5f3+m6iOn4GuCoPRQqhVDLPIWo2TM580tU1oBmTyQi1eYdM4XT9C0/1idULMsc62utOtFfL94PCw+tAmq/GrHbFCQLCTvKzHHbk/TeCvLdmsP8H15NSofWTS0HnbcW42sMacWWSq9HsMX5dNaCtHFSLP+tHlQg+/vOznUk/vqEe4vL2MIOP44iXWQxSoDc6+blcpVkGINp7aWlAfdVn5ptAiKb/BGCOtcUOg1C47nIv2CAflcKLFmE+cbd6KpYd52aBHl1e5yHEQDlKGi6RQBSO5UEFyKLZJrSihF0u9Bq7yBf9hiI06IUrnjHhQMtR+Id+XiHTar62ky+VVpdTIB0m4Pf1YbpBSQeEY3fYNsmFAPySiOZhoRKParVGWi28aAbyAZEhMolUbw+p99fDMlFYmuj+h54Fgk5BPdd3zKRIWf+erf7uArsRageZclAcZVvB4Cy7OZjJVaFbIf6Od/fD6Fur4ra09iQnUHgsml0bAQOuIBVCXfgA92q98aToWpn8p9oIiKIxXFndfnXsdHOwagkYRxTjSzwG3bLzVMrk2eTLGe6IPGsAiEyRe+LBZcW6WpUQEDHtQUXpodWUIhYqkrd64/5npUmA7BTK5CkelwPBzuLSKadRalGhN2Lux8wO0hGn4uE+O3UaV92DOwlta4D3q5f9bQEB9lVJ/gDrwyzVwrPGIA9f61NI10eHs5BoanA1DsXls3VWTSJzkddip20/mK10PpzQaGYLv4jzlH2d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199015)(83380400001)(2616005)(31686004)(316002)(86362001)(31696002)(478600001)(54906003)(6916009)(36756003)(38100700002)(6506007)(53546011)(186003)(26005)(6512007)(7416002)(2906002)(4744005)(6486002)(8936002)(66946007)(5660300002)(41300700001)(8676002)(66556008)(66476007)(4326008)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3NQbDJwdUFwMWRpM1VhZDlYMVBqN1FYeHZwWDh4amIyaUlWNmhzaE1ud2Vx?=
 =?utf-8?B?UENoR01IRmx4dlFKMkIvQ2VNL0lMMGZLWk80dExIa01xcFFKKzBOVFBjM0pF?=
 =?utf-8?B?aTN3MHhwQ1FrZzY5UmxQajEyUTlhWTBjb0d5RFJJdUtXM0RLbHpKcUl2WjRG?=
 =?utf-8?B?WndTNHJoL1UvOGlwYkFxMDlZNFA2Y2pna2J5bmNuSnI5aVpuQUpEVG4vQ3RK?=
 =?utf-8?B?dlAwc2Ztb3NXUzBGUDhXcXNBa0xpSmJ0TnNJOUdmbW82SllERFdYUXU4NndY?=
 =?utf-8?B?UFMyL1dFRXQvYmlBQ1NFcXg5SUpLbXVMWkpvREFPbk1ITUlOanA3N0ZJU2p3?=
 =?utf-8?B?Sk1SN2NTcWxkcHdWdk1zM0d0QVJJcjdxZGNieWh2RXZTTGhHajJqeTh6U3JG?=
 =?utf-8?B?Tkp1cllmYkJTKzhXd3Fsb2swYUhIMTlJS3paYlY0Z0ZNZnUzZFhmL3VqcjhL?=
 =?utf-8?B?YTkwNDl4NktrQjd2MnJrV0YvTUo0MkVoZjZWUkNrNHQ5MmEzL0VsN0VlY25l?=
 =?utf-8?B?Rk1ML1RSRHp3TmhKYy84TzdwbHlpTnp2U3hQTHdvQ1N4N0hwdk92OEV1R01O?=
 =?utf-8?B?UGlnRDNmUFBDMW5USDhsUWZrVCtoYTEvcitIWXBxRnNxRVlQSjcxTnVmbFlI?=
 =?utf-8?B?Rkw5cWNQMjlXaDYxdC90RGtaNlYzQnAxTERKZ1JLNG52R0d0RFFaekt3TVMw?=
 =?utf-8?B?cTA3L016TWgxTWVkNmxpa2JjL3pORjhhc2ppS2dxU3FTQXEwWllIa0NWZTZN?=
 =?utf-8?B?b2lWOE4rSkxya1p5dWhFeERMcGlmdHhUZVJpaldxb2hjSXZ3ejBNRXBCblZz?=
 =?utf-8?B?NmJSWGduR1FLSk5hcGJGRTFTcitleGpPcEZWWFlTbGs5dzQ3S3pabG42N3NR?=
 =?utf-8?B?Y3N1cHFwbW11TUxybEtsOVV0SU9QNHY5UEp4U2hJTVlwVTNpWndzS05aNGk3?=
 =?utf-8?B?eFNNY2QxMkg0SkxpNmd5eVI4V2hraVAySWlBWk8yTDBtblRobFFTK3Z3bVha?=
 =?utf-8?B?WFBZdWlwTm9wY2xiSllkQXArZVpuTUR5VVRIcW9GMzFTNlAvQmJtL2d2SVND?=
 =?utf-8?B?NGRweHdEaUtaM3FaL3J4bVdORVVSTm43MW80bUlIWHhjbERYN2FQTndvV09V?=
 =?utf-8?B?THAvMFplb204ZjBxYjBSTDlXcGg5QzBNNFl1MEZOZjd3cEtrTjFPcVdLZEtH?=
 =?utf-8?B?elV1SVVUWnpuV0VTKzZmWW05OUxPSmRtMVp0Zko3QXhFWnJMSWFuQ0NpODNQ?=
 =?utf-8?B?MmozS2NKaWYzOGZrbEF0UEI4dXZCSmpDb1dheGM3M1k5ZnFNUDIySndkRlhv?=
 =?utf-8?B?cGlkU1VGdDZPK3h5RW5vamN6TU52Wk1ZVi82aHo0aTJVZFpRd0JNR0RZbFVO?=
 =?utf-8?B?T0tVT0VsblNCTjdaWGNkMjdKdUxOVVdqVXF4cXo3cnZqV09pb1dMYzlFbWFB?=
 =?utf-8?B?ZStlNUxwNTM1Tk9PTFZzOWFGM2dqbDNHRkRqSytnQXZWSlRIalpnZ2ZHYmIy?=
 =?utf-8?B?Y2hyMGN4VThnYzBHVElrNll5d01qWFBhNU5zRThTWnY5NHR2em1wTWx3Snhp?=
 =?utf-8?B?cDB3WUloMEs0TFd5ZjJsRFAzbFYza1poNXYwUzhldlpMWENoT0w2VXZLMzVw?=
 =?utf-8?B?a0lpOHp6Y1RXZEUxVk9iQzBRVkVDUE5WWG82SDlzNEV4dm9zemhDcWtjTmZs?=
 =?utf-8?B?TW96amgwQTRjOWxKWnVHWDJXaFJEbnRRNkowRFZhL3FMK1ZpaVhOQmVoaHVI?=
 =?utf-8?B?UTFBeDJGSEc5UUpzSlpoYmRuaEhvdGtoZjZBN3IrYURmTHNmTlFBSDRUeU1z?=
 =?utf-8?B?Yy9hMVJUVW9sZmI2Q0U0bUdFbHgyUzRPLzFYa3ZxVm90c0VIQTdwdlE1dXdH?=
 =?utf-8?B?UHhwT0VPaHlPWXliWHhKZGJ0SG9VT1Vwajk5ZTEvcmV5SFZEQTI5OXA3OVgv?=
 =?utf-8?B?ME01WUJsb0s3SExyY0w0dmM0WmI5T2NuN3pMQ1A3QmwwbUlCS25HaU5SNDJZ?=
 =?utf-8?B?cnArWjc2a2VOWENsK2dSbVZnQUFJcmtiZ3l6cUxNOVI3RWZSL0lLVXE0SWxE?=
 =?utf-8?B?MW5nRUhBemxRM1RHK2pISU9UTllsOWkxcDdzdW44VmMzQmEwOEh6NUtKZGV3?=
 =?utf-8?Q?taSzYh54HTaP5jx3qapatoGoS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68116aba-9876-4507-7ff3-08daddac2b2c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 08:21:15.5890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZH5TE2NbyPStTpfAmZegYnNrQMlKPkZQ+QZjwDa2BqiewKGuGygI40g8CSoT+1TCc2QKfD7eDhqR+/Q+t9lGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8038

On 14.12.2022 06:19, Viresh Kumar wrote:
> This patchset adds toolstack support for I2C, GPIO and generic virtio devices.
> This is inspired from the work done by Oleksandr for the Disk device.
> 
> This is developed as part of Linaro's Project Stratos, where we are working
> towards Hypervisor agnostic Rust based backends [1].
> 
> This is based of Xen's master branch.
> 
> V9->V10:
> - Swap I2C/GPIO compatible strings, they were wrongly added earlier.
> - Arrange tags in timely order and add new ones.

The affected patch surely needed all tags to be dropped which weren't
explicitly indicated to remain valid across the bug fix.

Jan

