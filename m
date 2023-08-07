Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389147728EB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 17:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578621.906209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT20e-00017k-K6; Mon, 07 Aug 2023 15:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578621.906209; Mon, 07 Aug 2023 15:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT20e-00015g-HP; Mon, 07 Aug 2023 15:19:04 +0000
Received: by outflank-mailman (input) for mailman id 578621;
 Mon, 07 Aug 2023 15:19:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT20d-00015a-Ab
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 15:19:03 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd0f0fe8-3535-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 17:19:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB8014.eurprd04.prod.outlook.com (2603:10a6:102:c7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 15:18:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 15:18:59 +0000
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
X-Inumbo-ID: bd0f0fe8-3535-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FH44mVrjxE8g1SyBAyUlOMQOvkc5prJmj7FSKLAIFa3ih609UA8VOWsuMsTMbaBiNDFeYALR3IlsgRjFqi5D+LtZF9aEZf+eGFs/UwkqNyJ4HOjNwhO7qBfQziyI0E+sr6pVZVgbiTgS+H9vD8rxG7tJ3fnl9thXBZeGUcoEHAiTs1y5xBXPoual9W/84Tg6q3FQmDZg0VAtrkUQDOdOVcQdgit8V8TR//VXnEbMPWm+UOFiNK0XX9grpGo1wRW96HhYikbB7hgmyykkZZgytT/QLLX4XXvOdYPJbtK7DDUIkHb9A9AzukYDTrgPGanD8N/hUeYAtgriA5fOjmVNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzdCfVim1ytrX1tr5NtU841AKoz9XTJNWGUYa7yphwc=;
 b=Sk4/P+CVpP4UN3MO25hGGSEvxpZ61ujYOSujffgtoLvwJq+gHhSAhwLGsSo36mYH746g47sDUIK/Agbmejjt2LWeOJHVFYEoKWU9Z3ZAWmhYIzXqyxOZlBfQ/AoZQ6L9zDf3+PG0H3LdCp6leYpVBBnzwUbzJ8cm3XDfJKDuWmduskkXWPTSnXrehtXPambQUWTWrmYkuxjVT1jkFVBnm4g4LPDYb9GKqnyc7A4HT3RJKPQ+9vzZUOj+6vlpl+TEOAksyP+F5KT6gMjtlbsAxPIkEQE5ZnE70+vxmMY5mRM/DlZKo+G/KAx43xo57VJiUY34rppkaro2/PsNi34xVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzdCfVim1ytrX1tr5NtU841AKoz9XTJNWGUYa7yphwc=;
 b=4VFzX9fnURz3JFVJq5281xXqMUHPVfHblc0Ijs0RkF5fBpUNJMhgOA5QLaAL2O2Bsxylq2yLH+pUuy9sYNWVOUCw5vrw7Mp8hAIQMGfFdGtLNsV9pbuDZ1AozwGsPLLBreha9z0mI3tYuR5Q54toVtQ9oip7EBY70OhbKpgV22HAsZoJMGDSFl0h2s4wSyv+1sU0RWqSWEkRiP1yiXwDR/nODnizZ/myVJYhUrOwDxe/Sf2yg0UFw0djkRZD3LriBWVSB3xExtnyjQIyg1qRyW1JfKcDuWau+e+BpG0JpzyDDFKgyR/qJCXUNCvt00g7bxz6pdwvpJtTMR6tupumEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <96f70f2f-8712-9f93-34e3-f56deae364a8@suse.com>
Date: Mon, 7 Aug 2023 17:18:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] x86emul: support further AVX extensions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 6999280f-4f4f-4054-dc5c-08db97599fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XTgcwK/TL64ntH3x5LH4IeMUysqk+3h1WIzP6BKwagpdhH446sr+URA5cQfXOMCUSg/c4bRsaiaPtX0FlhhUKSBAITvMxBBQG0lyjggvf1JfVCtNQoF6RQn1tEPUrg/foupfZ0zHMfqk2cl3Z3dMhfryEytS4KuD7OV1hSfdycV9HRbUgQhNEwvyTRGT7D+HjUFizwh01nUDNIEHO6+5obVH3X8VEGwjUTQB9pJLyzZYq9mlebYNzwcWPAC4I4pFkWjRxXxceq6ZF3NlkWlaPCkkPi+Mhkjq11ysBy6yaSrT9vjmcRbIY0lrqOxsbyUeAMuZ6k0xiaQJ0jo2ORQIU21lQH92Ns5YujV8fwyfFBsgGPxkEC63wX+2lsy++lt3EJZiCGCiBTErqBvM20rotPTBgXuPh8MHJomtErUf997v4FUuHjqxD9UzRqHZXsxmRZF69OJ+c9iPwJejO0O6QjkUt0doLLTVdx4f0LgPPDosgqT0nahyUz7TYZnmvSRfR2Vc8UqbJMoxMZokJc2NHc+8JG7jy0fy3qTlOnjfhpPoN9WsQ1O7j6puAcHBWWc1okQ5z9ynlTk44qU3M01cr8sEnFErA1pCt+Q21BAjcVE5JSJ8H5GRmLmBK5tl2Tv1BdCKK98GT6XK5Y1IPcPwjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199021)(186006)(1800799003)(86362001)(31696002)(41300700001)(558084003)(478600001)(6506007)(8936002)(8676002)(26005)(38100700002)(6486002)(2616005)(5660300002)(36756003)(2906002)(83380400001)(54906003)(31686004)(316002)(66476007)(66556008)(66946007)(6916009)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEdaSVkvRStFSGRmMnNYZXJCbmhxakNZb2RlODQ4c0RYcGRodWVpNmhuL1pV?=
 =?utf-8?B?d203UFc5WklkUXA2VGQxbGw3dVZkSER0akdiVTdibjdsZkdqR0FYMldDTXNv?=
 =?utf-8?B?alFBV0hlcDRCMDg1NGVJRnhrUmczVk4wNk1VWUwwbVREaXNzZjdCNzdRam1G?=
 =?utf-8?B?VWtTQU0yclFEZTR3dDhFanV6NEYzdlRUUEUxcFEwTGtHTGlvRXhLSG5DKzgz?=
 =?utf-8?B?S1VtRjAvcloyNDV3T1RkMFFQU3VyYXZkNnlTSWRhcEZkUEZvd2QvSjBFTWt0?=
 =?utf-8?B?UDU1Z2hLMjFibWVHRXlvV2FUcWZpNTJibERrQ3FBZzRnbkw0cWs4d0xucWpq?=
 =?utf-8?B?b2NvUlEyNFhGaTdwYkZRS3NtNVhJaGpuaVkvNngxeVl4Z1lMVzlJNUoxeFVQ?=
 =?utf-8?B?U05hVkZ0cDlIQ3piQUdsRW5ZdEl5dmJSQ0ZaZkl6TW84d2JMaXR1MG5CcWtm?=
 =?utf-8?B?bStCaTdyekg2azE1enQ1MVV3MUNrNFgyVzBsYThnb2FUZ001aSsrbVM2VzJG?=
 =?utf-8?B?a3lqSUdYcVNzR3ZFVFdRaXJNa2p0LzIrK1d3YjNMU0ZGc1ZoNVBrUGVHSnlS?=
 =?utf-8?B?dkdTV1AvTnFpUjNZcE1IZUV3M0JrRkU5dEFaT2RVcHJURENnQk1NYzhjTXcz?=
 =?utf-8?B?YW42cUZRUm0xdUxjaUZ3eVpPS1ExakpDSXVQbjIvNXJLRnVQekFMMVpGSWpB?=
 =?utf-8?B?S1FrL1dSWjVVRWI1Sy84aEZBLzJtSnluQ09PVlVsWnF2MVA0MWxnMHdJRENk?=
 =?utf-8?B?b1BCc3J5UFR0emJVSkgvdEI1ZWxtaXFoWSt0ejFmQkJIQTk0NU1NclZ5Z0lP?=
 =?utf-8?B?bjBia2pNS1ZOcWdlUVBleWRNV3ptUlgwbEV6dUNzYVdMRm41WnhyQnF5R3pU?=
 =?utf-8?B?UVpMblBQOTNINENvcWNFVGo3UFpPeXZvcDczT25kaWtPbTgwQW1Yb0pwOHRz?=
 =?utf-8?B?UWhxbjBQTW9IbjZnN1QyRzhwdytsSXpETlFOQVNqOHQ2SkZCejlkMmV1SHNm?=
 =?utf-8?B?Y3RjVkEzZ1B1WXpQM0UyWkNyVjdaTThUb0hrYVU5NHFZd2JpREZUeWxRbDRy?=
 =?utf-8?B?dGx6V2NIUlRNUndRU3RQMmtmVXlkaDdIa3JRN0pSZDVqRFhUd3puVzlZTFZT?=
 =?utf-8?B?a3hrNUJwWmNOajdiR3RHWkp5MHU0cHJqTVY3b3lzWDRwSGVWZGRsR042czhu?=
 =?utf-8?B?MDlEZUJnUm9ocnhSWUltK2RyT0dIR29XS3NTYXJydGNzSlFhd0ZvZW1rL2Ez?=
 =?utf-8?B?SFNsOGxHellieFRsa3Bnc21RbVhnMjNueXI1MC9ZR28xdkorZHcvRUQ3STlv?=
 =?utf-8?B?akY4WkJGT3VGQS9MWEJhZ2c3UlZjZmQ3eCsvaXpFakFVVVpzenZUT2tVZkYx?=
 =?utf-8?B?aDV3NXE2ZEFkMkgrVDdQaEd2MVZ2VEVBck5XaFY5MXlIaWtDcHl6TTYvZ0xr?=
 =?utf-8?B?emVYT1grTGp2dU5LWGw4d1B5R0JOSnNkQ2V2SmVoYmpLQTdRbTZEbE11Tlpt?=
 =?utf-8?B?M1dqalNhc1lBZXFNd21SR1doWlE5bDFJOUt1ODI2K21HTDBrcG9lek0xUzVI?=
 =?utf-8?B?V0xKc1plNmhkYmMyRzJPVXE2b2xqMjFtaU1jbHFXOXhFZVZpYVRvNUt0enRQ?=
 =?utf-8?B?a2k5M09UWGc5MGQ2STRDUWpSMjM2aml5Y0o1WUYyS0gyU0pDK1dZblZYL010?=
 =?utf-8?B?WFB0alZXQU41MVNFelB3SkZpSGdKaWJtMDIxSis4Y1lRMG9uNXRnYWplUWR1?=
 =?utf-8?B?bG55TzlqOFBrWm1QenJsL0R4b3lORHlPQndVeHUxejBVb1FTRXhoVXF3WG9C?=
 =?utf-8?B?VEt4Zms2L2ZjdmJpS1dOcWtneXVudnpBaTVVUVBGdnNHS005c3Y1UnJMa1U1?=
 =?utf-8?B?bDJKcGpmNm44MjBaVkhELzhoL2s4dllrKzYvcXdQVlI4SmRtdndSYWFBUDNC?=
 =?utf-8?B?OFdTNkJVZlZDTmtNaWllQ0Z3U2V1cnF2RTJlYUM3aURDUzBsMW9GNUdOTWQz?=
 =?utf-8?B?Vk45am5nbm5zb1BIV2RzTkg0SHJBRlRWNDFWRDlYaXlGMEJWaXpTREU4Ni9y?=
 =?utf-8?B?Wko3T05KYnpGME5IZWFOMnBZRkZqTE9sMEtSSWhiMHF4Ni83NGtabW9IK3Iz?=
 =?utf-8?Q?j0QsAAQ9BklLMFjFucUVtzxe+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6999280f-4f4f-4054-dc5c-08db97599fd1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 15:18:59.4114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ht1qF2wA84vONy2EU4VK5Czsd5ouZRo+C9QNmsV+TWkw+N5bCU2aGf1BoCRfSBTukDV4KE05l84k1IUEraVzaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8014

Covers the smaller recently announced extensions, but not AVX10 (and
even less so APX). Obviously CPUID aspects are taken care of alongside
the actual emulator additions.

1: support AVX-VNNI-INT16
2: support SHA512
3: support SM3
4: support SM4

Jan

