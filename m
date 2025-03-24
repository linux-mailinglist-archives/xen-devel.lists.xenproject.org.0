Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20205A6DF3C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 17:05:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925874.1328755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twkIv-0003rx-4A; Mon, 24 Mar 2025 16:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925874.1328755; Mon, 24 Mar 2025 16:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twkIv-0003pT-0r; Mon, 24 Mar 2025 16:05:33 +0000
Received: by outflank-mailman (input) for mailman id 925874;
 Mon, 24 Mar 2025 16:05:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2bg=WL=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1twkIs-0003pN-TR
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 16:05:31 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c201::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c73c940e-08c9-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 17:05:17 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GV1PR03MB8864.eurprd03.prod.outlook.com (2603:10a6:150:87::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 16:05:14 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 16:05:14 +0000
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
X-Inumbo-ID: c73c940e-08c9-11f0-9ea2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PR5X9gPwtTYAH0W+94LzjChiaicxwqBntLNjsAS+Qsrv1hpPVINj56xaCXd8JgR6woWB4QU8SGBcF7ze9jw8ShgELPBH3B+BpKvUxIOGhxh5tzWmZlhdSGhzYPmBNou2fwO1hSAzlkJ/4CFoRFDbMZJt0nB/RjlrK78OQYfuABbfUfHWzISNJK6uoKoJjKba0WU24SgrKw68/8VPRddm5mZiv3bAIZDJICoTf3BgGg3fztQGS8de7kHRJ7kyABh0ijm3Al9+VrmXt/Ktp8QoMJaRWVq/oGm+f0xcSZkB6QEYiaDIXA+QYCrb781rB5k3oot1lrBsCLzPlrMN5pLChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4xkN+n1Jno3kXD96GB+KtduDNHlbGOhZ4JqcSRHlCo=;
 b=mLfB0gqbMUOfF8JgVn9t/lk94HufhN5uy9aEPvQUXVIwH57b5WP/CpKpmMk0D7MWRreUKTzfGnPGBeOiSUT4zVFzPosYKUzcKnNoRnlpF+L2+lKDHZNVgISkMes9zalKfLqW5sMUkigYLad/Zl7mfz7fKru1lvUW+z4BpwGKam1SqKWRdye8CFiPegBIZbwg9EhU897Xw1hOfIYAnoFqDmDpvKex1mzl4eZtU4irD7ls18z5qna7i4jSvBXVdfJiHq2TUYoxyqvzw4or6J3iaI7ED4X+/EzILlMdrYQHeAJbWcO54SmlVTXCkXH99XCyc5Rf1mGMTKblfAc0HxJtSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4xkN+n1Jno3kXD96GB+KtduDNHlbGOhZ4JqcSRHlCo=;
 b=KbjCJJXNjCCsN1nKphAWabK2tOgo1E6YYa28gV5td0XtW0EGAaxOMs3qAS8fNrs7q4ZIjZjc0VJCisSOWUPeE2TwlwLzTmXSWP3OTueRnvgSEEE26i/v/FuzhqahhDcvMk4jU7hZkJw7s0VkAY4cHN446b6FPxAR7n7/NWCwrVyi8q3YwI1VSW9muUlyYl1v+EIjvWHWYr6TdPd1GEGLhMeKUxnrTjQpVSuuv4NEFP14clEwMiZme+KRL1rwomqQC1ZX+nK3TA27f3BBImDl0dUFyVHl0vPUUk2AGM+CM59eA0+yTALboUJGcuiBLXHfViDjkiW80CL+cGmjWSiwMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <e1917eb2-fd64-4d24-81e7-08d8ee111095@epam.com>
Date: Mon, 24 Mar 2025 18:05:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 3/7] xen/arm: scmi-smc: passthrough SCMI SMC to
 guest domain
To: Stefano Stabellini <sstabellini@kernel.org>,
 Grygorii Strashko <gragst.linux@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross <jgross@suse.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
 <20250311111618.1850927-4-grygorii_strashko@epam.com>
 <alpine.DEB.2.22.394.2503131553490.3477110@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <alpine.DEB.2.22.394.2503131553490.3477110@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|GV1PR03MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: eb189d7a-4bad-45fb-5d64-08dd6aeda9a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHdDMzVHTjliWnlFOFBuZnpoWCtBc2tDcTFUSms1Uk4xNlRJVlB5WnlWdUhy?=
 =?utf-8?B?UXg3dHBOcXNRamRXcXY4cDZXUVprZTNRcEo2aE1LVjc3WVU4RFQzZWx2YmJo?=
 =?utf-8?B?ejZnM3pVdlMwRlhUK1VTYWNxWnNCVHFTQ0NlUU5yRmtIN0lUSWhyMldFZG1N?=
 =?utf-8?B?SkxSRjBiQXNxallhMEtJRVh6OWlRbld6cFR1VWhDakFLR3ltbHh4V3B4TWVq?=
 =?utf-8?B?RndtZEdQODRNbW50eS94M3J2T1dUQmJkUDBRVjBPbVZNem9RZjdSKzFTWVZo?=
 =?utf-8?B?VmlyY0ZkNlNiTy9IdE1IN0NNK2p4ZHhBVUZOREdWcmtnaTIzN2Iwand1T1py?=
 =?utf-8?B?R2NHaGZETTB3T0RDWk5TZ0ZYN0owNXlkK01IUEFJRUJNNmIvTjBWMGlWdCtN?=
 =?utf-8?B?NTZ0dzRPdUFnWDBBcmNmdnBxTHhVeWZwcUdjdkNVOWlZajJVanJ4NEZwcisy?=
 =?utf-8?B?VkI1Ujg3cHJTZ0tHeUVZN1RWZERSNk02ZzVRdEdhc3c4ZDJ5S1JZandQNlp4?=
 =?utf-8?B?NGtKVlhGdEorMHA0VHd6djNCOGRkMFpmbDlXYnVtR0lkMFp1aHpkOHIrMGpu?=
 =?utf-8?B?bitrN216US9PVVIrZVdueFRQQVM2K21qN0JSWFZpcjV4L3ZtL1FMUTRld0Mw?=
 =?utf-8?B?NDkrOGFaSXNvOURpRmxKdWgyYnpyUWlibTFwWjVKUTBFRk94d1lxQWhqaURB?=
 =?utf-8?B?ZHBwcW5iQkViNlpUNVpPTlp5R1hnTmNybHJDK3FoYUpXUElRVWVwSTN2SlRP?=
 =?utf-8?B?M3NFbUZ2Sml2YWorQzlScE5lMnF0OFUvMUU0VHBRRU9qdkpuRVRMNkVaUmlO?=
 =?utf-8?B?Vkl6dmxibVhIYmhTZUZTbEwrbVpZTDZUNmdLWXlpNngwRUMvRi9ubllDRjZt?=
 =?utf-8?B?QU1jTjB4LzBjaERBNUpJay9FY29mUlJIemozOHAzNjJxNWRJbDVoQmxDMGVL?=
 =?utf-8?B?WDdVcS9yQ2hUM29jdUVUdnBVbWlDUUJqRExib0lIUjdqM1docExaTFdtTFha?=
 =?utf-8?B?bFlFckdlWGFTd2R2M1gyU0VmZXZZZVJvQVJEQlg4UVcxc2svMExleGh2cFlI?=
 =?utf-8?B?WHJIQzU5dTVkcFRiK2V2U3l0SnF2SE1DZW1Yc0g1b1M0a0hNdGN6T2NIL0NK?=
 =?utf-8?B?YmZIWUo5OC9PLzFCZ2Q0UlhRTWVBdGxZM0JwSThTQVE5cGcvQSt3R0F2NEhi?=
 =?utf-8?B?M3Z0eXFBMDNwUlRDOWZWSitLczRTVFlXeWtKSTlud1BWOEJpU3RVcDBlbEZq?=
 =?utf-8?B?aFN6ZFV0dmw3MUVMUnVxZjhiOEZ0RlBpK0hjbXJoNWNVYjhMZUhTVlFJWnV5?=
 =?utf-8?B?WjQ5UlVackNXTE83YUp4OVhnSE16VzBkYVZtdTYzNWxQRjU0YnJSTXJ3MU5w?=
 =?utf-8?B?ZktnOEJCQWcxc1BEaUwyTi9ZczFyOWUra3NBYzJaU3F4TU1tRm9wVTd2ejdw?=
 =?utf-8?B?cjJ4OEJPK2ExTGNiVWhTTXJDTkVwekZDWkJaRlBBaG55a1E5UkpRdGVEVGJ6?=
 =?utf-8?B?Wmh4dlhScVpmMnMrb0dDS1pvY2tHdnJWMyt0ZzFPZTF3YzZCN2lkYjhLTnN0?=
 =?utf-8?B?K0haVjRlRG9KaldqOWhsT3VDaERpaCtVRys0QnA3Y2tjMGNtOTR4WlprOXJm?=
 =?utf-8?B?dWgwRWhrVVFKQWYzSnd0RE5iYWFLY3J5LzgxaFR0ejNlQ3huakdFOTE2cS91?=
 =?utf-8?B?cm05YnhWZFRVQy9tbjR3dmlnWWM4OHd4UjFuejc0VjAzZG5EQS9USzErcjAx?=
 =?utf-8?B?a2ZjV1R6SHc3OG1NK01CTmRJN2JNYjJrd0kybWlSelp1dGw5MXZCMjVyZ3ZP?=
 =?utf-8?B?c1RrMCtXMDBwdm1hMnZrS0YzRmdlK3dpbXdjNXI3UGhBT2l2K21PMzlVeWU2?=
 =?utf-8?Q?jR7XGdbZ64bRs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3lETGVSa0FxTVVXbkFQRXMrWWZYZWhiK2tHNWRHdHBmdmlJQWM1Y2ROcjhP?=
 =?utf-8?B?YVhNRUhOU3VweXBaRktpZXByeWNOZ1NuNXM5QnpKUG9IVk1LN29zTEpoZkxZ?=
 =?utf-8?B?UkJwQTB5c1l2MEFDeUZYWTQ2cjJiRmRlZUNXVWUwM2RwZHZkQUoyVWkwRGlB?=
 =?utf-8?B?N3JUZ21laXZ4cVkzNEVMWEYzYXJIMVA2OXgyVWR2czBGNHh1V1F5ZTJaVXAv?=
 =?utf-8?B?WVRRTW5RbzYrdVp0WUlIdW5sdXhPWlo1M1JoMUUxR3h3bEhXQ2ZvYVFySHVF?=
 =?utf-8?B?U1RkMGRMMElWbVpleTk0S0NxaklxTVZuZEVvd1duTE9XcEtOZ0VwNDhjbkVp?=
 =?utf-8?B?d01zUW13eEdVRW9mbTZraXZWbG5pN2NMbWZvclRDNFhMQ1VaY0dWWldhdHZh?=
 =?utf-8?B?Mksza1BXK0dadDR6b0lSZTlpcDFTSzV2NHh4ZkMvaE96U0hnOG8wMzRNcEY2?=
 =?utf-8?B?MkRHUWZ4Sm43bFpiaVZReklQUkk2MUsvWHZSVzJuTUk0UHhmN3FndUphd1hS?=
 =?utf-8?B?SEdKd3dUaWQ3WjVtaVNRWEVjb1dnUmNHRWppa2owazBBOEU2azdvd1dmQlBQ?=
 =?utf-8?B?UHVMd3FqeU0wTWFCYWJ1TEhqczluNlkzY01XZW9PTFFac2NvaHlubWRGd2pi?=
 =?utf-8?B?dkNVbllHRE1UcEIwRFNRT0lXOUVTeVQwNkZnMmxjRDRhUlpXdnBPdWZ3a0or?=
 =?utf-8?B?QmxPRkxaZnl4S25CNndTVnloTVZqOGtjTTVNdXRndm5MbWdLK0paYzdHYndF?=
 =?utf-8?B?U0czNEJZem9hZGg1RVJRdGZCWXFhL3RhZkloNmQ5UlBuUkVHSWR3L2hHUkZh?=
 =?utf-8?B?ejZIZFZTSDc2QUxHMUpHblZEWGhNejVSZnVVbUNyb1hWRG84N08zZ3FYQ3Ra?=
 =?utf-8?B?K3U3TmNvc2FMRFNVOEl2K1gwWCtqenh0R3dyS3FvZ0s0aldqWVZMckRpSGlO?=
 =?utf-8?B?TE83QXpyK0JlQ3dRSjNyckEyNWE0Snd3YW5OQU11NWtpS1VIWXlKSGlCZDRH?=
 =?utf-8?B?SG9rVDVxcFdwNDBPSDdZSGlxVUt2NnpWanJ6RzVYYkFVQkRwbGRTVnVYWWtw?=
 =?utf-8?B?YU0rMi9kRUcvV1Qvb0V5ZFJKbllnSGxGa0FJT2NSU01YY29xdFM5ek56WnMz?=
 =?utf-8?B?RjBpR1JMZ2xhSEh2VjlaNmNmRzJrZXJ5bVhWanZ5amJSZnZVZGNuNWVDUFpS?=
 =?utf-8?B?Y0gvRFR1eDZxRnBoTnYwVlZhZENmaHVVVXBBWjJlY2poUUpJcE9USnVpWW5K?=
 =?utf-8?B?MHhIckJNUFl3QVRiaW5RZExKRndlRjBIa1UxY04reWdoRGRTcDhGeGMzdGdR?=
 =?utf-8?B?TUFLb3hRRndkdjhTWjR6VC90UkQ4WWh1RFVXUGlaYVo2OXpLWktKbThCbW5T?=
 =?utf-8?B?b2lCK1NyTGNBaDd0RTJFeTc1alRPeUFpNllNejUrUGptWUs1ODVHZFNiUGJk?=
 =?utf-8?B?SUhKaHZaWmU5SWR5ek9zUm0xY0REb0IyeDRrTkVpdThMbm9jbjN6dElnMDRQ?=
 =?utf-8?B?ZGY2QXBEcEgyLysyVmY2WnJnNjNNUGR5MjVWK0VrVkh4Q00zRURzdTdVTG55?=
 =?utf-8?B?b1A3SnpYalJLaUgzLzNOQVdjUS80czlPcE1wZFBYU3dBeloxalUwdG1TUEho?=
 =?utf-8?B?S094ZHRleFNFUGs1Y1o1MzE0dmdJWTNwUG40clIxa2ZKbXhSNDJQZ2p1dVFu?=
 =?utf-8?B?b09IS01tclZOUVV5dzJ4ajN3dzFQWEZtQkMxYStuQ0hDcDdJclc2NmJiUXFZ?=
 =?utf-8?B?L2VIMkYwd016U1BQSkQ0Nzl3b3c1NW5hVVliajl2MUtNeXpxRHJ5V0Y0V1FN?=
 =?utf-8?B?bC9nV0xyb3d2N3ZPSVN6Vmx1VnlhL1pyM21NcVl1SVRsOTBrNjI5U1B1K3Y4?=
 =?utf-8?B?dElaa1NwczRuM2prNzFadDg0a3Q4NnhveTZ1TU5aVHJtNm9TdWh1T29iMzBR?=
 =?utf-8?B?Z1QwQXNsdzNlSi90ZXZZWUNJRDR3bmorWHNNOXE3OWVQT0N1MkJHTEVGSlpF?=
 =?utf-8?B?dk5jWDBVZmdZVFVUVVVZTXV6aFkvckEvUVNBSUtPa01MSEJyK1VnRy9XMmVk?=
 =?utf-8?B?dktPakljNzh4RG5lL21aVzA2bnoya3ZYZFFoOWRSK3QzdmRpQ1hDTks0Mzhi?=
 =?utf-8?B?dkVUTzRMSE1iTTlZSFZTTXNXZFoyV28zY0JjRHVubzFHc2twUnE1L1pORG5K?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb189d7a-4bad-45fb-5d64-08dd6aeda9a7
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 16:05:14.3870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqe1pabHEeMlSPn7RIJcUyJJWGCfay8UBmGu1GXpu4KqG71XwHjvjWriCfJAne3JKA2ynRvghVcRUWNsTG/eP10GWBsiaElcFFXShjpJ31w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8864



On 14.03.25 01:48, Stefano Stabellini wrote:
> On Tue, 11 Mar 2025, Grygorii Strashko wrote:
>> The commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls
>> handling layer") introduces simple driver which forwards SCMI over SMC
>> calls from hwdom/dom0 to EL3 firmware (TF-A) with a single SCMI OSPM agent
>> support. While it working gracefully for hwdom/dom0 use case it doesn't
>> cover "thin Dom0 with guest domain, which serves as Driver domain"
>> use-case. In this case HW need to be enable in Driver domain and dom0 is
>> performing only control functions.
>>
>> The EL3 SCMI firmware (TF-A) with a single SCMI OSPM agent support is
>> pretty generic case for the default vendors SDK and new platforms.
>>
>> This patch enables passthrough of SCMI SMC single agent interface to the
>> Driver domain which can be enabled in the following way:
>>
>>   - dom0: add dom0_scmi_smc_passthrough to the Xen Command Line
>>   - domD: xl.cfg add "arm_sci" option as below
>>
>>     arm_sci = "type=scmi_smc"
>>
>>   - domD: xl.cfg enable access to the "arm,scmi-shmem"
>>
>> iomem = [
>>      "47ff0,1@22001",
>> ]
>>
>>   - domD: add scmi nodes to the Driver domain partial device tree as in the
>>   below example:
>>
>> passthrough {
>>     scmi_shm_0: sram@22001000 {
>>         compatible = "arm,scmi-shmem";
>>         reg = <0x0 0x22001000 0x0 0x1000>;
>>     };
>>
>>     firmware {
>>          compatible = "simple-bus";
>>              scmi: scmi {
>>                  compatible = "arm,scmi-smc";
>>                  shmem = <&scmi_shm_0>;
>>                  ...
>>              }
>>      }
>> }
>>
>> The SCMI SMC single agent interface can be enabled for one and only one
>> domain. In general, the configuration is similar to any other HW
>> passthrough, except explicitly enabling SCMI with "arm_sci" xl.cfg option.
>>
>> Note that SCMI and "arm,scmi-shmem" nodes will be removed from
>> dom0 DT.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>>   docs/man/xl.cfg.5.pod.in          | 36 ++++++++++++++
>>   docs/misc/xen-command-line.pandoc |  9 ++++
>>   tools/include/libxl.h             |  5 ++
>>   tools/libs/light/libxl_arm.c      | 13 ++++++
>>   tools/libs/light/libxl_types.idl  | 10 ++++
>>   tools/xl/xl_parse.c               | 66 ++++++++++++++++++++++++++
>>   xen/arch/arm/firmware/Kconfig     |  4 +-
>>   xen/arch/arm/firmware/scmi-smc.c  | 78 +++++++++++++++++++++++++++++--
>>   8 files changed, 217 insertions(+), 4 deletions(-)
>>

[...]

> 
>>   /*
>>    * Check if provided SMC Function Identifier matches the one known by the SCMI
>> @@ -50,7 +56,7 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
>>           return false;
>>   
>>       /* Only the hardware domain should use SCMI calls */
>> -    if ( !is_hardware_domain(current->domain) )
>> +    if ( scmi_dom != current->domain )
>>       {
>>           gdprintk(XENLOG_WARNING, "SCMI: Unprivileged access attempt\n");
>>           return false;
>> @@ -78,9 +84,18 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
>>   static int scmi_smc_domain_init(struct domain *d,
>>                                   struct xen_domctl_createdomain *config)
>>   {
>> -    if ( !is_hardware_domain(d) )
>> +    if ( !opt_dom0_scmi_smc_passthrough && !is_hardware_domain(d) )
>> +        return 0;
>> +
>> +    if ( opt_dom0_scmi_smc_passthrough &&
>> +         (config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC ||
> 
> I am confused by the check "config->arch.arm_sci_type !=
> XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC". If the check was true, this
> function should not be called?

I'll tried to hide all SCI specifics inside SCI code, so outside SCi only API calls
are present (Patch 1).

> 
> 
>> +          is_hardware_domain(d)) )
>>           return 0;
>>   
>> +    if ( scmi_dom )
>> +        return -EEXIST;
>> +
>> +    scmi_dom = d;
>>       d->arch.sci_enabled = true;
>>       printk(XENLOG_DEBUG "SCMI: %pd init\n", d);
>>       return 0;
>> @@ -88,12 +103,68 @@ static int scmi_smc_domain_init(struct domain *d,
>>   
>>   static void scmi_smc_domain_destroy(struct domain *d)
>>   {
>> -    if ( !is_hardware_domain(d) )
>> +    if ( scmi_dom && scmi_dom != d )
>>           return;
>>   
>> +    scmi_dom = NULL;
>> +    d->arch.sci_enabled = false;
>>       printk(XENLOG_DEBUG "SCMI: %pd destroy\n", d);
>>   }
>>   
>> +/*
>> + * Handle Dom0 SCMI SMC specific DT nodes
>> + *
>> + * Copy SCMI nodes into Dom0 device tree if dom0_scmi_smc_passthrough=false.
> 
> I am confused by this: shouldn't scmi_smc_dt_handle_node be part of the
> previous patch? Otherwise, how can it work for dom0?

Previous patch doesn't change functionality introduced by original
commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls handling
layer"). Previous patch just makes it part of SCI subsystem without changing
major functionality.

The original functionality:
- if there is SCMI node in the Host DT then enable it for dom0/hwdom
- SCMI DT node will be copied to Dom0/hwdom in generic way as any other DT devices.


This patch enables coping of SCMI nodes in dom0/hwdom DT only if dom0_scmi_smc_passthrough=false,
otherwise scmi and scmi_shmem modes are removed.

> 
>> + */
>> +static bool scmi_smc_dt_handle_node(struct domain *d,
>> +                                    struct dt_device_node *node)
>> +{
>> +    static const struct dt_device_match shmem_matches[] __initconst = {
>> +        DT_MATCH_COMPATIBLE("arm,scmi-shmem"),
>> +        { /* sentinel */ },
>> +    };
>> +    static const struct dt_device_match scmi_matches[] __initconst = {
>> +        DT_MATCH_PATH("/firmware/scmi"),
>> +        { /* sentinel */ },
>> +    };
>> +
>> +    if ( dt_match_node(shmem_matches, node) && !sci_domain_is_enabled(d) )
>> +    {
>> +        dt_dprintk("  Skip scmi shmem node\n");
>> +        return true;
>> +    }
>> +
>> +    if ( dt_match_node(scmi_matches, node) && !sci_domain_is_enabled(d) )
> 

It is correct...

> This seems wrong: we are allowing access to the shmem region if
> !sci_domain_is_enabled(d). Shouldn't it be:
> 
>    if ( dt_match_node(scmi_matches, node) && sci_domain_is_enabled(d) )
> 
> 
>> +    {
>> +        struct dt_device_node *shmem_node;
>> +        const __be32 *prop;
>> +        u64 paddr, size;
>> +        int ret;
>> +
>> +        dt_dprintk("  Skip scmi node\n");

(this is confusing left over, sorry)

>> +
>> +        prop = dt_get_property(node, "shmem", NULL);
>> +        if ( !prop )
>> +            return true;
>> +
>> +        shmem_node = dt_find_node_by_phandle(be32_to_cpup(prop));
>> +        if ( !shmem_node )
>> +            return true;
>> +
>> +        ret = dt_device_get_address(shmem_node, 0, &paddr, &size);
>> +        if ( ret )
>> +            return true;
>> +
>> +        ret = iomem_permit_access(d, paddr_to_pfn(paddr),
>> +                                  paddr_to_pfn(paddr + size - 1));
>> +

... even if SCMI node removed from dom0/hwdom DT - it's required to add
scmi_shmem IO range to dom0/hwdom to allow scmi_shmem configuration from
xl.cfg for other domain.

>> +        return true;

... and here node removed

>> +    }
>> +
>> +    return false;
>> +}
>> +
>>   static int __init scmi_check_smccc_ver(void)
>>   {
>>       if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
>> @@ -110,6 +181,7 @@ static const struct sci_mediator_ops scmi_smc_ops = {
>>       .handle_call = scmi_handle_smc,
>>       .domain_init = scmi_smc_domain_init,
>>       .domain_destroy = scmi_smc_domain_destroy,
>> +    .dom0_dt_handle_node = scmi_smc_dt_handle_node,
>>   };
>>   
>>   /* Initialize the SCMI layer based on SMCs and Device-tree */
>> -- 
>> 2.34.1
>>

-- 
Best regards,
-grygorii

