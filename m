Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0002A6A3E95
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 10:49:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502302.774041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWa7h-0005kg-DA; Mon, 27 Feb 2023 09:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502302.774041; Mon, 27 Feb 2023 09:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWa7h-0005hx-9b; Mon, 27 Feb 2023 09:48:45 +0000
Received: by outflank-mailman (input) for mailman id 502302;
 Mon, 27 Feb 2023 09:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWa7f-0005hr-Ok
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 09:48:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea3a6d7c-b683-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 10:48:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7670.eurprd04.prod.outlook.com (2603:10a6:20b:297::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Mon, 27 Feb
 2023 09:48:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 09:48:38 +0000
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
X-Inumbo-ID: ea3a6d7c-b683-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P505AlOBxAB57DU9dHrS9aNWBKS0Lgwy/S/bj9/X9SvNDk8rfn397IfrCALXYWU6Ytl181iZQRl0g1IdxsBMGecetoCJ6FS4Ck0PrnUAiQ5fn7F1DN5GR1mwuVlFUskM3GhEl5suRiVnTyajWb0o5LZpbLznL9Tl6E97x70+pPRZjWv3qfVayL2lkKjOffycQdyoZQGseik64oyBVYIbkKKusE5o0oSGC9zsz1IdE39w5TCKQFuWxClWVoPBj0m0+EOAoZhk7IltC9dbfTAfIu7UOtCQkSXIWvG5t7JWy3PNfobnMP0p9xPpb6UkHmJeYSR99GDWM66HssrGB1uLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANIU0mCSskEWJqWB9z93SEg/ilIHCOVGSXM2jh3Gsxs=;
 b=BaNGoO12sTbCD/Mvb+XG6AMgphQuArAbQyeJPrYhmHofNiK42187rL+3gFMuriK+X3U2T4EDapmJh/xFmQdYvoqOVSMJLab+IZFHbCNIvstMQcV7eM2imUdBjGwvzevAEwvD2UoWtTOy2J8a5SOZ6xFlrOS0id966IoViCJ3PSC4q0u3ES6zVGSGPBMNLhQHHFfKD1dBqgJnAm5g6vUM/IPIvzLY1DhQYz5BsrnUabzl+lfMleyWkKL3/TReC/HO8QFCILXc64wIiICuYUEte1wnLNKjwIaHoSw16HzFJKiXhlfwMrOkczEkD6AKyGl/IZfnI40vqJPji1+/i52E1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANIU0mCSskEWJqWB9z93SEg/ilIHCOVGSXM2jh3Gsxs=;
 b=gdILGTIobmOTHtNqe1Zd169ZiJBPJ85WZKhks4GlZwsyuX+8KFKhuFr6jniZx2vECGoOT5BlwISS5DwRvfFollyqKxVjoHNxICp0hr3GNeXVHwukHk8j5c79v8DkR6hdCgF6+lpKqbAD3GaOBpnTauXhicwQdVze96Q4TvSSMk80PHyCT2FGBVd95UfGyj1oAMnwQd+Fn6a+qpJz4CFlBQP2jyYKgDA5AjbkVJCPgSjRlKggOrkNYd6nmcdNO7uHt3Id2p8k1JD7/LD+Po/TgwKYEyUJYYCdz3vDkvoFW+gZYq8dfDn9PWd1vIpTruLEIgPbTYsCQBVWhtix06biQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55f05814-76cb-3dce-309a-6b734edba280@suse.com>
Date: Mon, 27 Feb 2023 10:48:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <932b0fd2a211d2d837d00e1bda87a84ad680fe7b.1677233393.git.oleksii.kurochko@gmail.com>
 <8734edd9-70eb-b2bd-8763-b7468d7caba3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8734edd9-70eb-b2bd-8763-b7468d7caba3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 48997c41-107e-4655-873a-08db18a7cd5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oH8Hjbrl8Dv1B2gbEeSdmQVr7weohNarTbDC73ahGB59/8653RO3kzuqCSvMH4XKkopSN+Ry/pkX4IG70wuAP17rxx92/L1AfWZ47ByRNsHPTqBroS5mH+OQkf2AhSO+36XizZ0rpBKwU9+75pwWFmnRO8VEZSxqlOveG966Gwbz5mU4FXZYDM+1or8VBekJX1VXVJKNz5j2eO+CDs92z81zlC2Oag5urlSYBMPBwNCM2VDq9kplJza60sYtxYbzXS/IkCpN26WVrIkg881gY8tFgmkX4egoibbvFQT8RcGlHDpW0l1ZZhL1Fzb6/xF4DDKtVuqx4MobLBW150PkxA33nsnq3p3ZNRA3xP3oFUpptIGnPOr8CUumAHUdNf3GWwoH1lN8SUCwf/KPmBgdxcrFNWxSK7SWZxdC2jCwcz2EnArNtmMC5YzPqKuVoTt9p9l6y0Xd5IuVeLvuSz1llcoxwkVj3z8WoTgSw2vZ0CP+TWFSAu1FYQlIWwA0RXODbMMd9xg2cjzAuXlXbnN63n8Wprmfz6oPLYPNisEW7H6bA8nMQba2himojb6xI9Fb/vH0saVjH/WOZkC4wWPPz4mpDz5SQg+mL7wYrE2AtweOkkV0gzgQoS4GF3Tb4f18G4DESLNBmg367WDFdHiGewYG+2veeFMHmHOT/DLNHq5PgrBF6CqoLSWYWiTTLYte0z+gmqdpt62TO34ycLoG/2N3RFELM75ImwZT/irYqR/3v4DF2CJPnHVeY4uuobSP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199018)(54906003)(110136005)(8936002)(316002)(8676002)(36756003)(186003)(26005)(4744005)(478600001)(53546011)(6486002)(86362001)(966005)(6512007)(6506007)(2906002)(31696002)(2616005)(38100700002)(5660300002)(66946007)(4326008)(66556008)(66476007)(31686004)(41300700001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVl1N2owU2ZBdFBUSk94SG1LMndNR3JvaHhLQTVvaUIrN2YwSXp0Z1B6RVQz?=
 =?utf-8?B?TUNuRU9XVkx3dmthVWtXQUxMYlVSeExHVnhDelFrNHAyQTJZbWNBNkNhNFhx?=
 =?utf-8?B?OXZ2NkdSNUlHL3gyNjNLK0t5N2tmQlFpT0tDRTRZVDQ5RmZWWE4yOGFOT2tq?=
 =?utf-8?B?bUJsSVNDTjR3UzQ5ZDVCRnQ0amgvUDZxeGpTWGxKYS84ZlF2dis2N2o0NzN6?=
 =?utf-8?B?a3lxLzF3TmZzdE5XYkZaUnl0MDE1WVFjTmduMElhOWgzZXFQKzg5aWQwSURn?=
 =?utf-8?B?OFFGczNsSHJQR3pOT2F4SGFUMksvbEx3UVd2QWJaNXhlWEsyUGgrSVY0VGp6?=
 =?utf-8?B?Zm5EVmZiaVc3L1Q2dXBTUDJLcUNSVXE5c1BHMUw4Z1pmc0tmNzFBYVZHeDVB?=
 =?utf-8?B?RGhzM2JTWVBPNm5KaVNIeWtxbWR6UnNRTXFEc0ZjaDh2ZmFCTzdETXI3QlRW?=
 =?utf-8?B?L3ZRVnJUVnRhWE9MdjB2OWhsSTVWbDBsTzN6a2lCYnpQUzRjeHgwUU55bHht?=
 =?utf-8?B?VzZYQkJBRHd3OU9Bbnd3VUFzL21xRlkvajViMDRtRDB3MHdNdk5rQWVHQ283?=
 =?utf-8?B?SENUd041NDZvaTBKdXVmN2dDRU5tTnFjVHo0cW00SDhXdDc2SlRUN1Rpdzcv?=
 =?utf-8?B?QSs5eUxkYXY2VnMvLzZYQytlZHM5dDdiMDF3OUlncnVyUkE0Q0VmT0cvcHhv?=
 =?utf-8?B?SkVneVJCQzIxZ3R6cmpoYmFuR1ovYUhML1AyK2NaNjZ3bGRUNGYvK3p6bS94?=
 =?utf-8?B?SnlBSHVsVFhEb1JyVnlFM3JSaXhTdEZKaTBCN0grbGY0dUpsclJPTmNKaGRW?=
 =?utf-8?B?cTBpU245dnovanNPTThkYTJVOFVob0lvRTYwS0crQmFIT0h0NXFGSHJDYkNK?=
 =?utf-8?B?bkJ1OEYrMlJsa1I0b3RhZERnQ3ViSnhlNExRRzREc1lIWGUyU01idFVKRlJM?=
 =?utf-8?B?SUJrOGY5TTRUREoyaUJSY3Q2Q2JON1FrYVFQVzMzOHRVVjNnUWlHSmJLbTZP?=
 =?utf-8?B?aTQ3cnI1ckNXTEVQb3JNRlpBaEF3aUw2T3NDc25UVXJtblkzU3VPN24vZ1da?=
 =?utf-8?B?ZVJpSjJhWWUzaytvOUpWVytpNUFDOHFuMW5ENXpzSlVlYlVleVNPenIyWklV?=
 =?utf-8?B?VEVuQ2s5dHc2ZDkrd2NOb2FsSXdWbDUzSlloODNQdm8xWjlUTS9tSXE2YnZh?=
 =?utf-8?B?NnpQNHgrSjBhQ2d6TDI2UzR3VEEzZktpdDN0UTNRZXA1ay96MzYwd2Qrcjlq?=
 =?utf-8?B?OVZTakkwSzZsZU9naEhUK1JSTDBQUlRNWjkzSGV3MmJtMXRIWGgwd2FISS92?=
 =?utf-8?B?TGxNaXB1eFNNQVExQTJpdzk0YzMrRXcxdkFsK2NxMThhL2tlTEN1b3REWmFW?=
 =?utf-8?B?WCtwU1FlRURCTVhqUjhuZ09KajExQlVQcnJhVG5qRDBTeHJpWjlaYk95M2Ew?=
 =?utf-8?B?UXNIdkFwU1JacEl6cnJaQzZSWTlsN1U5bTkzRTNvTTJaRkFWL0pBUnBiT2o5?=
 =?utf-8?B?ZFlhZUlhWDhYa2x2ODRoUmRmM1F3b0JEWHNHblN5VlV6Tk83U1ExMEZkcWpC?=
 =?utf-8?B?VGMyTjBSWkJIRWJlRm5HQllYVjZxMjJGSEE3UzlPVTZnMDB6TFhkTHRXVyth?=
 =?utf-8?B?YzgwOWw5TG5MV2w1NWFqYVVOR1ZUZ0Frek51d2VYdkVqN3NmcHAzZUxkL090?=
 =?utf-8?B?M2R0Mjl6YU5DbkRHWTNHYnpvbnNaODkrMHN1QWR4UFdPMGxjQmlSZXVmdEJz?=
 =?utf-8?B?aDFvMDNVdEpYR1RqOGhGdDMyNzk4YnlZNTVtRzFraVVWd2xPZDhZdGM3RkNt?=
 =?utf-8?B?SjB3eHQyUjFUa1JNc1VNdDBxbTgrd2pRM0dQK2QrVlUwb1ZrYldnd0FHQTFr?=
 =?utf-8?B?WENVN1pUTmZKUkJlTkZEY2x5bWxsaWY4L3p5MndnSVlFdEkvdmFzRG5NS3lk?=
 =?utf-8?B?U3dDbW15QWh3am10dzJaRUQ0RHh0cDlWcUV4UWtGRXdlb1ZlMkl4MWZUa2xZ?=
 =?utf-8?B?U2hYbnNtK09jZkUwcDg5Q01oeWlBS3RYak5lK3ZueUkwRXRSenh0Ym02M1ZH?=
 =?utf-8?B?SVpYcmVENk5PY01aQ1lPM3hiazdkZ0R6cmZFODZoS2I0d2VVaUVaNklDcG1q?=
 =?utf-8?Q?Qe/+kW/8pFkA8CJhKs67dPB+z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48997c41-107e-4655-873a-08db18a7cd5a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 09:48:38.8486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fp0eySW8jorXtvLRWOu0SLIxobjP+1hWx1c8UFxl5EumFh4gKObovPW7SM91PvRnm8RzgZTZCTV4lrgWxZRnTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7670

On 25.02.2023 17:42, Julien Grall wrote:
> On 24/02/2023 11:31, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/common/bug.c
>> @@ -0,0 +1,109 @@
>> +#include <xen/bug.h>
>> +#include <xen/debugger.h>
>> +#include <xen/errno.h>
>> +#include <xen/kernel.h>
>> +#include <xen/livepatch.h> > +#include <xen/string.h>
>> +#include <xen/types.h>
>> +#include <xen/virtual_region.h>
>> +
>> +#include <asm/processor.h>
>> +
>> +/* Set default value for TRAP_invalid_op as it is defined only for X86 now */
>> +#ifndef TRAP_invalid_op
>> +#define TRAP_invalid_op 0
>> +#endif
> 
> It feels to me that this value should be defined in the else part in 
> xen/debugger.h.

I guess with [1] it won't be as straightforward anymore ...

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-02/msg01026.html


