Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C78769385
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 12:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572906.897030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQU6-000703-KR; Mon, 31 Jul 2023 10:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572906.897030; Mon, 31 Jul 2023 10:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQU6-0006xi-HT; Mon, 31 Jul 2023 10:50:42 +0000
Received: by outflank-mailman (input) for mailman id 572906;
 Mon, 31 Jul 2023 10:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQQU4-0005HZ-Kp
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 10:50:40 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 169d9b93-2f90-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 12:50:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7695.eurprd04.prod.outlook.com (2603:10a6:102:e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 10:50:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 10:50:38 +0000
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
X-Inumbo-ID: 169d9b93-2f90-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYOpml+k5iwTh8gAvJsBsODirSS3Fziz2CSusGhRqp8FJvkZM89mHl68PoDjvMWwHV5mLVipt3mgz9JgtNDc6TDNqqZiaDOBVyOaoODtz4/d0FfhIja66dhhl6/vTGoVcJ8TMF1Lxj5lpw6vSx7xpI0NAb08iwb0YqRIzNX9DCi9IMBxOXZN4e0BK3JL3b/y2AJQLeX9eC3a8FB6OWZEf3RaG9D32yDJix7Om7CcWg+BKrpcvYVH/vmWPfa3GB/9p8ripc88fR4ZStVHE6p+CeHBX+7O3d5Iv93Ml+Mc+WOXqNGsVo7aXu0vWT920bo90rPTuWaz06g2J/dREti+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m0vc8Do0ZZBQ+Lw+lGAAEdyMmUOKX1UmXo6O310PfM=;
 b=oBPZseVPNPeo+2OPcrvBQqA7uUIe+v5k/F1jWg5X9pbjPbcDxiVyCP81gGIUizGP+CD1ZxyzUp7NGY1s/OP7i+rSSrEg6vRM6vgpzZtHOo5ybCLSCK0d6/pTtyvMlCE9XZpwMuI/5+EkOnij1MVPjFOXm51Z58PcUsCxGpaYnVvWTCh2U/XuJwoMZX6S8Et1qGUiQRq/eWHMz9Q9enIXGb/fzTrLOMoPwhIbvz3V3h+Zo/vBQtY00XkSWgf/o6MQ8Kwl648V0jy2VPaZyfLb9+mkPT0m/qY2Be8SOKcEWtCfobr1gCvNZYjvwa2nShHjSomulIR0eUgls3eCKEZ3Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2m0vc8Do0ZZBQ+Lw+lGAAEdyMmUOKX1UmXo6O310PfM=;
 b=GsInKP0Jfmx+XR7TE/LHshb7mZFMpX3Bd9e4t928YECJoSu1d/AyQRO6EZ9moZCrvXBp/RyhKTxjo80+uWyBwtl4DoqD5zPIvf1+l8FiRoFQ37nMLawDCPZToyRD+QhI/sLkH0cO+1VuqOnzLBgfmEfriFZ9eWGfZCF0xz+qoWqVokRTN0+msHA1KAeUMvNP4wdY4rChbi9VwKJB72LNAur2RrJEEoi5F8WOAobad0Hx8EnJQKaOqvQU5XG+GXsOEP6wNpkFpmH3YRqruvcXa8wHEpZD5kb6r2nYhTsJAmzWiEUpLTzlLBacebHPCstp2/PulUJSysMG1YlMQ7bc7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c91310a2-105e-f908-31c3-b39f61d9053c@suse.com>
Date: Mon, 31 Jul 2023 12:50:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v3 2/2] Config.mk: evaluate XEN_COMPILE_ARCH and
 XEN_OS immediately
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230727145447.2701-1-anthony.perard@citrix.com>
 <20230727145447.2701-3-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230727145447.2701-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d95757-6781-4661-7443-08db91b3fa12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YtOExRaeTvD8DVEP8KP2gawT1+KFd2yCwFIzKfGYDFeoAc0G3/K6CShMo8Y6xb7H3ZLm1TqOn7YlCQWWo/bG+BEaFXR5lEu0dFpC9bp5usAgEVpxi7t/MGT6s+7PNRstAVC7lPoq+L/Dlj+9WxQXaj2eDZlheDoES2/e3s2DcRmOLrkdwVPwlR6FEwQpW1U4XxOFrAJFrI6M/NvCbxNX91I+yv2w9tlVS8WSEZC8D8y3lndnz0VTZpqEpntqhWEpC1cG95DqfAIkmQje3gnzLs8qvoD0VchjNWvgb+kcnTucOwiymiUCRWDHh2ydy5+JSPMvo0NMlNKdCe8gaaocSnSRTUHUefKgXbzdugBE3UwfD2rQYQebnZpoGMeeipgwO7CxRl6fLbndY0rhh369cgFice9qC5qtTFc2rx7UUuJm7uFD2mjjcKDFnbGXF5Qr89dfROq9fmW5dOD6pN2dsSXu/ATFTe3DivVwarQnx0CH3pL7x/qcd5SM9iLGUwQSRIZet58/Nruu13+0EUF4dfO+VGpJ4djH+SpFmv/RLHKJrjI3FyclZxB4NNS2LcsiJUXixLtB8XrEytjBZozQISowposJGox8qXBnETkYAaOucBf323+6iek7fvnUluCRKmA41C8lZRfS/t0bPv8MECbfzxIGDAg5+MK2p/CM7qc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(31686004)(2616005)(5660300002)(4744005)(38100700002)(36756003)(2906002)(26005)(478600001)(316002)(8676002)(186003)(6506007)(53546011)(8936002)(6512007)(41300700001)(6486002)(86362001)(31696002)(4326008)(6916009)(66476007)(66946007)(54906003)(66556008)(14773001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHJLZUw3K2lBcEZpWnF3UExoVVVvL3V5U3pLL25PckxQcnRZdmw2TzJmYVhD?=
 =?utf-8?B?SnJTMjBzQU0xZW9ldkJHRkxQY1JFWXB2OU9vbnFDNlZGUytmcENFLzJ0WTNJ?=
 =?utf-8?B?ZSszaWt5WVNIb1RxRnZwWjVpQUVUQ0FIV3Y2bmsybEJOWHhaUDEzRHg0Q1Vx?=
 =?utf-8?B?K2IwUjFOYUp0VTIwUGhyT1VvYmgraVZBbC9WYk1Gd2QyTFl6YW0zelFqTkRr?=
 =?utf-8?B?K2pmZGsybURwTkViRk51MUsrVjc5RGFpL3o5TWhzREErcWZiYXFjblBFa3lw?=
 =?utf-8?B?dUx5bkpZcmtYVythYS9ON29jSzEzUXIwR1NDb3VyMExNSGpPYXpweFlDbjJn?=
 =?utf-8?B?dlRGUVdKRTZsQ2J0MDFoRFZFbFl3ek5nbmxtZkZCNTM0UkIyQmlWWWZNZ3I0?=
 =?utf-8?B?amJ3OVNvMm5CVnQ1TzVjUisrdmY5OEhPSVNvQnQwWHFWV3YySXcyV1pDZVha?=
 =?utf-8?B?bkVHUVZXd3dsNm5FdzBKVkFZVno5OHErTHpGN1RRU2RQWnFiVFhBUkdLdFpB?=
 =?utf-8?B?QllRWk12Z3RLcDE2cjdMNVR1TDM4N1BlaGU2aFFOSnJPUzF0ak9DbzFDeHBm?=
 =?utf-8?B?OVd5NDc2TnlFdlpUSU5LU1B3WnJ4ekVpSmVPcHBtNWJYM1kxK2hoeW9SQlNQ?=
 =?utf-8?B?eHUxU0ttNHJVVGw2bmQyTFNwMWtkYnhrQUVpcnNuV09WeVZkK3BkSzlkOWx4?=
 =?utf-8?B?N2M3RTRHTnhlenlJZmhodHZpVVlZbE5sOEI3MmlubUZoRXp2VlIyRVp0R09z?=
 =?utf-8?B?TC90ZVc2MVFSaHU0cXI2bjBrOWNQcGxRenZtbWxUdHo1YXdmTFBueFc2dkpX?=
 =?utf-8?B?VUE3ZVlnSmx2UWtNNHIvZjdhOTgzbXJDWUZ3Sk45ajF2M2ZnUmlDSk9raVlU?=
 =?utf-8?B?WVhQS0t0ZHlTUWFtcUJ4MlhVT29JdTRqTHhBVkRXT3VhN2QyYTQ0OXZ0NVho?=
 =?utf-8?B?MTJnd3EyajEySzdJVDJzcTRXOHRYTDB0dWIwaXBIR2xVZGJ4aDFpeUdtZkY0?=
 =?utf-8?B?dkZLQklGNU1iK1ZoZXh2cWYxQll0bnNqRDhZTFJBbDhQNGVibDl1Rnd2bHJz?=
 =?utf-8?B?b0VXSkdDOTlTbFNEWXg4Q2tjZkJ0RUNXVDF4VGVoY1htNHdVanVQaWVxK2or?=
 =?utf-8?B?dEY3azJtTXh5MzE1dEpvUGdlSnRySTArTVZWMitkR0JvYnprM2hlRG9zL2Rz?=
 =?utf-8?B?cGpvTS9rWFVhblZGaVBpUm5RQWx4WGlsanZaQTdCeU5adno0TnNCQ1VNYitK?=
 =?utf-8?B?VmtWcGVDaWswZTZPMENnVElodHNndGl6ZTN1Z2JQcFN5Wmt0dE9yMWJzdGlQ?=
 =?utf-8?B?RjgrZ243Q2JkenJZQXlRWFhkSThOOGhkUFR5TkppSUVFcWQ2TUdMMDUzRE9M?=
 =?utf-8?B?L0Rma0RKMFNKVDlTclhWM1Z0anVKWVNyRm90UnVCOHFXZUJnYTFtOEdZdmgr?=
 =?utf-8?B?T2FsRmxsUVkxV1FLNVBJZ0M5T0I2dWRDV3AwYWFDc2pMRWhHU1h3S0tIbXlO?=
 =?utf-8?B?RGJCb3F3cFAvaTUwRllWRHE5alBndEkwR0RaU2N1NUxzMkFhLzJ1TEl0c05p?=
 =?utf-8?B?RHQwUFhBaUQzRGMvL1BOV1duQTJSUXAzUE9ZQUFEZ3lOSklLeTdtVXNSTVUv?=
 =?utf-8?B?OFlnQWczQWdtS3o0dXhnOUdUWXc5bVRlc0M4SDRaeHZ6d1UwNGlwQlNKUlpm?=
 =?utf-8?B?R2tBR1dHendzcG1UbXpKZ2VCZ0JQSjh0b3VhaU5tWlRqckFHWHExQ2h3NVFx?=
 =?utf-8?B?RDFBNnowS0tnd3drUC9lQTBZWlVkdmpVSW81cXgzZkluRCs5MmYzY1dZOCtD?=
 =?utf-8?B?NUw4bDF1ZE9Vdnp6Q2Q4UzAzZTR6Z2oybkF2blJaMTU1WmxHQXFleFdFZDhk?=
 =?utf-8?B?S1FTWkdsYzYydG1pSUFkR3pmMjFrU0x3Umh2N1duK1U1SDlFdnFiTXNNa0lQ?=
 =?utf-8?B?R3JTYk5lL0JoYWVSRkZjcEJHMmM0OGFLc1RaOHZhNmd1ajEwazJYQ0VSREtB?=
 =?utf-8?B?WDNtTkJuYTEwU3RqaU5SRm53VlRUQ2w0RlFaKzJvWUhMNVlQdmxpZk9JaDZn?=
 =?utf-8?B?UXArNkdNZGovMThhTDM3RVBFRjJ4cW1RMTFtTkEyVWFpMEJUeW45WlM4R1pH?=
 =?utf-8?Q?4lmq6wNnE8aAP5eJBszFf3Iza?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d95757-6781-4661-7443-08db91b3fa12
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 10:50:38.5364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHKxQT/F7oFgHPtD8xM7QIGkdwMEPu7NhhlQFv0cXSE9CErEbhUuprbFmCm5xR6esS7pJ7iujia+PU8PCBl4ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7695

On 27.07.2023 16:54, Anthony PERARD wrote:
> With GNU make 4.4, the number of execution of the command present in
> these $(shell ) increased greatly. This is probably because as of make
> 4.4, exported variable are also added to the environment of $(shell )
> construct.
> 
> So to avoid having these command been run more than necessary, we
> will replace ?= by an equivalent but with immediate expansion.
> 
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



