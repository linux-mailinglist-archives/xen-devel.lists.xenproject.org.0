Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42164629327
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 09:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443801.698550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1our9B-00086n-OB; Tue, 15 Nov 2022 08:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443801.698550; Tue, 15 Nov 2022 08:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1our9B-00084H-Ko; Tue, 15 Nov 2022 08:18:21 +0000
Received: by outflank-mailman (input) for mailman id 443801;
 Tue, 15 Nov 2022 08:18:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1our99-000847-Q7
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 08:18:19 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe12::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e3c9640-64be-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 09:18:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Tue, 15 Nov
 2022 08:18:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 08:18:16 +0000
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
X-Inumbo-ID: 0e3c9640-64be-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3VGKP3/qvSHQ7PGlzUoT8LFU+CDpyI+noDJe++8fJCeBGdkGSRjIFiPdtd11g3g8yswJMwDtiv9ZKT9Jv9US0DmFFx1TDaOxc4c1m0GT1Q2zXcbjpQ5pRz4ihNH+MTC98r+ufXwvpYAL8UvFVGpekwJXhdULuPzmBznNgryQ2CCS68bvODnp7Qke577P8HAINuzDXmw5D2vQU80V9hJo8j7PzPoZpPgbPStGpZgT5TNRGSc7OnNJ2hID/a7wLrug1HWUR4AXg4OmPP0BxyoxA7pocOFa5gWfDnVkkWLXxhGuYJD6Xev6xGk+TmKPGU+qeToM4x0aGoPjGfZHMZK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKe7cY5YBNTMfZzpP/m4oJkvkK8RzF4ZUEE1kAjnFPk=;
 b=BZd6bphX6OpTlO+hj37uwRowujVQtIyZi8TqWG9Xr4kfyFkb7J2V3DhUkbyTzO5BvoTgpSaetmz5vbpHB2HBx8bxjGfOqRORP/uxwH87f0u4gTEmBvUNXia2pxCvpADbEozBNdEjvyMkAq3wjlF3fJPIQGDyX0OK2Oi4uNFHkwbwHU2+Kge1rx/h0PTUPeSGnvM3HOCIV8K4ddYTiucVAvNHIiRRn7td9M27ji36h9LVeWjsaUT96JhyYozDUTe2+TC3O3vZ2xvM2uKMYAUXrT6OZYgrT51gueoYEhvyJwFxyTnoQJAczhIfd+ZSTOCSZnnIRaa1kAophBIYmoMPxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKe7cY5YBNTMfZzpP/m4oJkvkK8RzF4ZUEE1kAjnFPk=;
 b=Kck/3HzqZNVDB2L58K+X/HjoSaruAP4+j0dOyhMaUk8KFPUzur2T/FP1/sO7U9hrppqdFcQOVg+eLLR/22CAQ9h8oVeLt3dV8Rpfp8UkvHjuv3S4Xyf7livXPJmqc/FGIir45mNQI6ARINC1VPX9SfoA6e8C+yQMGNez1jw1JzNhxxzfOkkEIgKqFT+/4kE6E7N1QwNqPzYw0UFYmo/hawnYBkQX+GNwLohbG7bvDKX3dgdJffhBK/UZR09jj/GTJUTfR8uAtL4oPiBih5aQSQzUXIAEoERxTCDuVIBuedl3B6dFzeqqz9xwMyLV8B4O9g+LPiTdEwYLu9vr8Y5s0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <780da682-806e-6ada-eadb-018579d0e808@suse.com>
Date: Tue, 15 Nov 2022 09:18:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-4.17] x86/spec-ctrl: Fill in whitepaper URL
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221114214358.17611-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221114214358.17611-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0469.eurprd06.prod.outlook.com
 (2603:10a6:20b:49a::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b072397-b2c2-42b4-af2f-08dac6e1f27d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1wH0HqJKhNfGVqhgUmSrNKOfEfmkv86ByR8pOi+cVS3ZWh778a64ePwZyl2t4xNnMbwEUq3PnGUFvLwF/3Q+Wzqtz+tjTD8V/ZhlpTqydEVjkykc6Pb7t8Zl/L5j2u39HgvbOjnQv2XiMpa0bGR22wzQpffTzOTKKCVoVcNtYNIpcZ4J9LrLogiR3X728+ZNwBkdeY0ihZudZZS8KNxYU83IE3bZy/8fWvOujnBU2gJDTib65k+JZgtx6jlBs3OolI5YbFg2XkG3LDHTqj0Q5QZ+PLfQhMOztJY+2gBi+py8+Ec1ggPiPMJ4ccx2JsdJjPGvEnRVFa8K2rmfC7YxOnutwhdgoNSBN/Gj/6jejSg7ychFpjfIIFNdW9y1J6w/l70Ykt4D7shG30PywG1zLeDviIErr8jKtlXkUGxkWZ7pQoxwpjX1yqYPAQIOWHdO63ouUmerZpc/bmbIGF3uUfbOE5+3umjThgYlSNVwK8OwXJe16pMV9lVIjyPN7VJtZPdDzq7cj2/cboqlvNozIXV7vWvsA8yvQaEJDpAoXOhYIIoNQmqL594Ws9aQ7Bu+pYFVfS/xOztnmSON9RRd+TzL/D58ebys0TC9TBDW13jBOqBKW/uVafoMww+wbDpVJPXv5e1HC5nPiuJ7kIYwHG2CJzLpJPQ+PNjBah38ZqS9D5SfCZygdz+Vx3A4BVdoRTRqamPf1cQ11TKYXj12CMGgzgauqjmRugOk7QwE3Nq+AoJ19nAGZISnClx/65zWDAYp/E2/EA3W6cV/cE28A27/N/W96/Sbhnie9n8O+rU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199015)(478600001)(31686004)(6506007)(6486002)(6916009)(54906003)(31696002)(53546011)(316002)(66476007)(66556008)(41300700001)(26005)(4326008)(66946007)(2616005)(5660300002)(186003)(2906002)(8936002)(36756003)(38100700002)(86362001)(8676002)(6512007)(558084003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmZkSGd2bjVKeE1VVTJidmtWMkk1RVNJUSs2YUZlZlVhQkVkMUJWK25pdFNF?=
 =?utf-8?B?L0ZVR2pTcmFuWnZTditpSWhyQzBWOFBKZDk5V1ZCTCtjRXdJRWlJNVYwQ2Jl?=
 =?utf-8?B?eDlxd243Zi9VYVlUSU53RE1keVNOVnBnRXN3QS9PUzFQWTV5MlRTVUtsQUp1?=
 =?utf-8?B?R3FtaHJMOHZEV3MwcHBrcFQzWkE0UlZqSGxzNnkybG4vUzJkZFFqdkJsdG9q?=
 =?utf-8?B?NFFQdnU3OWNaRHdSNGlUb1FKWGRpWTBrVm5Sc1BpcWtWWTRaRDBtTlBkMi9p?=
 =?utf-8?B?enIxQVcrSENGa0J5VDRqTEZiR2VvZFNoYUYyaGtua0IrUXprbkwzR0NZKzcw?=
 =?utf-8?B?RjdzSEpCZmc4WlNoZ3Y0c0hnRmxia0ZQRDlkaDNmVFYzRGR4NVhmY0Q5dTBx?=
 =?utf-8?B?YmdRdnhhOVZlN1R1cEFwdDlMTU9yZ0Q1VGlCVERLc0VqSmtHeEhOMEdFZTY3?=
 =?utf-8?B?S1R4Uy9nY215NVYya3lDdldmaFZYTHRYVkt2V0JQaElBVkVsZ2NuQWdoaHhF?=
 =?utf-8?B?VzUyLzdmK0JxUmxtb3ZlWkpUQjZheUUydUMrdDNQTVY3MmFRcWR4NDBySVlH?=
 =?utf-8?B?MFhzdS9IS3JLMEIzRjBSUVlaSk9jUEZCam9aTE4rMEtMNjFyZ2pzSzI5eXBQ?=
 =?utf-8?B?TElFM0R6L0VZdTFmc3l1eWRrL3NURWJ5QXNDZFVmQ1dWSjJjSVM3RS90a1Rs?=
 =?utf-8?B?Rkhtb2p1QzZWQTl2RzI5ZUg0L2R5MXA2K2pxOWZnZWUzdGpCc1E5YTc1WlhM?=
 =?utf-8?B?T1MwcURDUXA3S1VLZHJxc3pJVzJnMW5yaU5KTVJNeU5QbURpQXFBSW14ZklX?=
 =?utf-8?B?YmkzR1ZwdTVyVHJWOEVpNlJsNHFReFczUDRSTUpNbnhLcHNTWUZ0WlB1ODE1?=
 =?utf-8?B?c0p5YnZtMUxsLzg4dWlWSTg1SGJhcnRuck1ENFBUVk5YQ0xsdE5HTEtjbkJC?=
 =?utf-8?B?OUplckVTU1IzR2lQMXl0WUZscU16TnB0TUNaMm9KU0l1ZGhXM2RFL3hpeTdG?=
 =?utf-8?B?dUhwbUUrQTBmT1Y4MXJzc0lhaTFpR0h4QlR5TkJxZWdQaUUyVUwrZFFkY2Zq?=
 =?utf-8?B?K3FGbWFzTjVWNU0yK0xTTlQ5bDdkU0UzQllaL1U4QTVqTlc1bUhPTUk1QmhV?=
 =?utf-8?B?V0xGc09VTkVPQUJwRVEvQkRiYlNrQldEVWlvb1E5TVNQVzVka1lwaGJSWTN0?=
 =?utf-8?B?WUFySy9FQTRFbHZXOXlvbWYrR0UvRDQyd2xiTTJ0bEFsVDBzVlg5QnJuT1Vp?=
 =?utf-8?B?NG9QUXNNUXZYRWN1dWdtZHIrNm9UdFp4TWpmUllvSFZwQWVBeEVmdDVHd0Fr?=
 =?utf-8?B?TXJYd0tqYXJTWWZWcTRjemRHQVp1WVBMaUlCMVlqMEpqZFh3b0xGWU02dDhU?=
 =?utf-8?B?NjBmNFpFc2JtRit1YUE5N0JMVjFTSFRmMit1cThRYUNjenFjcUVUejJjMzJj?=
 =?utf-8?B?QmRuNnZiRGNyK2FQbXVtK1JBRlV3N0NzUnRFUTUxQ1BlQVczM2llcFphckx5?=
 =?utf-8?B?dHZMVm9pem5yUHF3UmZkVmtNN3NWQ3BHL2xRTnFSZHlFbVFoanB1UGpoZjBw?=
 =?utf-8?B?QUc2NlFBYUxPb2NEaUw0d1pOT0k5Rll5MkF3UGtWTzBRU2k4NEdoL0RBd2Jh?=
 =?utf-8?B?YmZWQkxaTUlBSFd4akFQNUhyYnBNYW1xb1JBSlREejNvYy9zTS9WVjZBVnFP?=
 =?utf-8?B?WGFUOUw1b1ljL2RjdEp1YzVEWkZZRGxWQmpUSy9zaFpwdFdpbFJ3OHZrUnhu?=
 =?utf-8?B?S3BZaWd3eFFRVENpSTVhWEdHTjRpdzZCbUVwMW54YzhyeTVNS3pmeVNsSHQx?=
 =?utf-8?B?SVNzUXVOMmI0dmdqU09ZMzNqdGViSTVSVmVFdmt2TGFaT2x6MDJSYm5KaWZD?=
 =?utf-8?B?RE42MUV1cDBVczlNcmZJVitCRXJyNkNteXcyaDJ4TGlBVkJFU3dYZ0tvaUlk?=
 =?utf-8?B?YzNmNFFrWHZsODdrc0RhZ2NnZ1lxY0pwK2wrR0VrNjMyZ2x4QjFFbkFQOGpm?=
 =?utf-8?B?cHVFUE1ZU1pBa1pBcUlLa00xVHFEcXp1WWpVLzB1eE1wcGNIRkV1bUVyb0g0?=
 =?utf-8?B?WVpBemo5RHhYNEtrcEtTdUVVS2xkSXcrZ1lqZ2hFRWFyNS9MNFJZTDFFOVln?=
 =?utf-8?Q?y9o39UquZPQ6U1rcdcB0uNkT5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b072397-b2c2-42b4-af2f-08dac6e1f27d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 08:18:16.6017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cXWpwWriYsvpHKim2pemEBXEJB0ByNqCi/dkS2UUlxNcZ2nBdenwLcq+LIYk7/eo6RH/Kzrr7SsSaGZTfD0qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7065

On 14.11.2022 22:43, Andrew Cooper wrote:
> ... now that we a link available.
> 
> Fixes: 9deaf2d932f0 ("x86/spec-ctrl: Enable Zen2 chickenbit")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



