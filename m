Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9DFCF5316
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 19:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195707.1513630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcp6d-0004Ss-Tb; Mon, 05 Jan 2026 18:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195707.1513630; Mon, 05 Jan 2026 18:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcp6d-0004Qc-QA; Mon, 05 Jan 2026 18:15:03 +0000
Received: by outflank-mailman (input) for mailman id 1195707;
 Mon, 05 Jan 2026 18:15:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtAc=7K=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vcp6c-0004QW-Nd
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 18:15:02 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71b3c477-ea62-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 19:14:58 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7302.namprd03.prod.outlook.com (2603:10b6:806:2f1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Mon, 5 Jan
 2026 18:14:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 18:14:55 +0000
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
X-Inumbo-ID: 71b3c477-ea62-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piqd3azGVnnWNPJajq4IiLA44M9e3Rh6JxXbnOC7OMKkcWhZdxVQkWsMs6AB7qvnIyAbp03hwJY7b00np2sSpG2DKj3MqtqbxxUW/Vbr8gD/BuuE/Cncl1tv+M1vcVYClBiL4gPWoKTKaWbqzuz2DAxD2yBKn6NFythCom8k2pMJWYigRiXZhe6KYb9yX4iPbbEXNbpPnEhoIahDDBOmMB+MDKwbL0n+Z5InOHMDwWklzQQX/wuyOEh6nnuVGnviZOn3Ix51hdNpBxDS2qrEv8aJgSEVOKCt4hh92nPbmjUci4dkonvaR8FIUrYVifYF+2KJ05aKnhUeBf52cOu99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJ/sLfZkrTC7T8SMjX+AYaQOVhpKR/Q+mNtj9nFx+1I=;
 b=I5lQrKGfGQdha1oSLqm6S4Wxfy2pkT7Tyjv3bKovtoQ3LI4vzQm/1a0axNnrzljTerXDXV9oBY4xX3/D/3r2RdSrQjXO5OJ8/nnhG4JzQfQilvdsSM4h1DLpZ72sqZmJtOYQ7ZAfh3EJ2K5JScLInPc7V6RaSHXPzRP4ofPdt0rV0KxTxl2jVLDO+ukOArb+gcamii5MsMwYqLc8ADJEwt7nNKe6x/CQjgCdxeT8yYbYnYDszkMg/XtdbPRGTipYpTYL2NFwGLKNQWSQSM8ok9zFQ1/2JfJels+jYvvWT1qbmcBo8TzJMaaol5hu0SHrAo4zldFjqxhKuAbJTMJ7fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJ/sLfZkrTC7T8SMjX+AYaQOVhpKR/Q+mNtj9nFx+1I=;
 b=mZV9gF2J6IZQNmpx84vdrd+H+Ahn8WT1slUJ78v+NQBhuZjYL+mfoZxRGcbnDogyhC6OOhpMkY47bQNWs/bnNSTHGgrvGXJZtOd9NPLHXezX4UqwgzFhaOMMi5ErQ3nBlDPcu2880uJkgoYZvYwEjsQDmx64dH9UQ4cMxyRTPFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <82d99c52-c39b-4fbb-bbb2-0e952df91673@citrix.com>
Date: Mon, 5 Jan 2026 18:14:51 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Subject: ARM64 notes: Re: [PATCH] CI: Extend eclair-*-allcode to enable as
 much as possible
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20260105122436.555444-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260105122436.555444-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0244.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e72f7c-a501-4fe9-de10-08de4c8653e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXVlK2txMjUvN05KaHJjZXJKOGl6dkxGdGJzdFZmeFVLQ3p3T3pPS2tsU2VW?=
 =?utf-8?B?Z3NPbmhOeGc5enZ1Zjlvdmw2eXRMSXk3Qis0NGE1OE9STGdpVGg1bHB1djlR?=
 =?utf-8?B?SWRTSUxGb3k4SXVqTWM1b29MZTVSblhIaXlWRUoyT1g5VjlTcXZQUHZIU0FR?=
 =?utf-8?B?YS9FSml0clJpRnNSNmVDUStUYzlPRXp1NFhWM3Jhci9zWGRzQUE5QTNGQkx5?=
 =?utf-8?B?S0dBRlhJQjFrcUxPejZBR3NDaFhuWTNGUVNoMmtHVWlDNGJac0Z2TWROMDgw?=
 =?utf-8?B?d3FwWFhWM3FnRmdjWGNDUnUybHhrLzYyb0NPQnBZUk1pcmFvZ1lnRUh4YWFa?=
 =?utf-8?B?RzI4ZlBxaGxkUEMyUUNLQjYxNzBnOHlrVUpiMGRNSVQ0ZDJVTURlRyt6c0Nk?=
 =?utf-8?B?WEJJL3NRdFpFcExnaFd3eG1QWVo3QllQTjZtK2htcVp6djlpSENFeTN2bUxm?=
 =?utf-8?B?QjUxUGJ1RXc3VVR2Ti8wNi9YaExpRlhBQloxclRLVGo3eFZzb05SNWdtSFhj?=
 =?utf-8?B?WGk0OXp0TU00eWVQTGVDM3VYbjd4dGRIdTV3dU5Kbjc0RGhwNi9zUENaTk5n?=
 =?utf-8?B?QndJU01SYXNHLzBhTU9yU3U4MkpxRDA3eFRPcFlBRk5BVm54SUx2T3RteVFl?=
 =?utf-8?B?TThkd0drT2krUDBlNzJWaVNiMXJUZktwVWJGcllaeVcxaHZ0T0haUzluU3Za?=
 =?utf-8?B?NlZsOTh6QU5McW9VZ0ttTTRteDkwTHZmQUJLM0FGWm1xYTd1L0RxWVJ1NUJG?=
 =?utf-8?B?UEpkcU55Rjg2RzRvWjN0VHo0NXVXZ2VhOUdTQkpvUG9aOExSMDQzSWMwWEpm?=
 =?utf-8?B?clZPcFlMcnFHb1dBbU5sczNENXZyVUljTkh4eDlmdjFIOTJWbnpKaDJralNj?=
 =?utf-8?B?cCt1d3VEZHNWTy9uUVRqalhjM1dUcVZqODdkbTlkV0pSMVkvWHdTalFTU244?=
 =?utf-8?B?aWdRUTcvTEJlRjIrOXVEcFlMU3hOK3FuNXNOYVJlL2xEaHRnYmVRNlBocjJt?=
 =?utf-8?B?Wk84YkpBYzgzZWFJSnVnS0JudnFSY0xhSHgvMEY5dkVOVTVYejlpd0FtVXZU?=
 =?utf-8?B?MDJUQTNTcEdVcXJ3Sm05WTY5TmQ3UjhHU1BKRTZoZm12WnhBd2RwL25QcHVQ?=
 =?utf-8?B?YnB1R2lGVFdoQ0JrSm9qdjhTQmQ0d3g3dThKT0V5RHVQb1BnTnR6WUthZjZx?=
 =?utf-8?B?M3ZZS0dsWmFVQnBCU2dySlphZGNrcE14MUJteStRYmJvRzNxZEpPdFF6czdS?=
 =?utf-8?B?dks5QXlKRDBMTlJvbVRaQ0VaeFhiQjhLNXNIMGRjb2crTEF0eXVkQWxMdDRW?=
 =?utf-8?B?cVZPUTBtQzdTVWRGZHNSV1c4cTB2b2poak1LdTFhamJGOUI4dHR4Zms4dXJr?=
 =?utf-8?B?SGVzV3lRUDdSbnBaL2RvcTRhUjJMeE93ajFVVVkyZkFQY21MU2FuMy9ieHZm?=
 =?utf-8?B?UEJHS0lFMGpNSG9uQithR1dOVEFwMCtCWmFNbHl3L3BpTXI1b1E4N2JzY05C?=
 =?utf-8?B?UDRhK1FTbTlnUUZXZkwzTDR6Nm9TT2x0RENnK2E5ZitWQ29GOHpmb0Z2YjlL?=
 =?utf-8?B?dGlzWExCQ0JENER4bC95d2NoREJNQW9TWGVkNGtBSGJOL0YzTWhXRnR3RW10?=
 =?utf-8?B?TmlVbVo5RGpJVHVlK2NnRlRLQm8yaU1MKzlpSHlVZVpyTlFTaWlDakVsalQ0?=
 =?utf-8?B?OHV1YkVBeldLZkJDUnNIa0NHa1BkSEpwV3FzakpYSFduR0VRcDFValIyNnN6?=
 =?utf-8?B?UCtuNW9laHU4RFdtOHowUjNNVDJ1SjZRS2MzbXNFRWEycGlTeEp4Y3cwNzhF?=
 =?utf-8?B?d0lGYlFYYUZmVW9mOVNpdUNyN3lxN2RkTWpKZVZZYWo2b1VNSEVEYmhBTTdD?=
 =?utf-8?B?UDYzVk1CNnVwN1VjWXZUQWZZekhSem1aVXFMaXlZeFg2U290ZDBXZ1hEeG1L?=
 =?utf-8?B?dXg2d09HMEE4Umw4dU9vZitYZEJjQTBUekZVVjZqSnQvY0NDbGdzT3pQOFEr?=
 =?utf-8?B?YkhtcDVvczF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0RHd2NsRjVCZHAxZVZMZ21NYVo5R1JJSUFJaDBBVForcStneGI0UDNjMjlD?=
 =?utf-8?B?V3RFZkVNb2tVbU50cG1XeDNVNGpoRlBVUVM5UnNibHF2dUZHcVdWZzhIaVM4?=
 =?utf-8?B?bmFxUzRVU3FnSHQwSjhKa3g3c2RoS3Vaa3d3d21iYTMyRFg1czk2SDBNODRl?=
 =?utf-8?B?QzZnNWhWQkZJaTYzVHZjY0RyZkUwSXNVVWhXemZ6YkhmWFNRVXJqUHZvNkkv?=
 =?utf-8?B?NEZ6c3lmWjlsZjM4TU01bHY3S2J5VzNQMGxSdVFqS2s0d0d0WEo3bWhkWjZj?=
 =?utf-8?B?MnhjRDZwWjIxc25rU0Z6RmJzMm9DdHBhcUxsRTQ2RnlwZmR4ejVsNFBBZEMw?=
 =?utf-8?B?enJ5aE5mREthNmNvaDVYa3JDblRjZlNoeWhLeFMzN0liWEhHMnA4V3p0TENY?=
 =?utf-8?B?aEhwN2hTdUxkT1FtOXFzZEk3WUhldkNGa1RFWHo2ZUNZTTFFSHNzZWt3UFpo?=
 =?utf-8?B?RnBiY3BVWVhDS2NGaUtKUFBTODdFdUV1UzAzOWRlOWRGd0dBMUhjYXZNTStw?=
 =?utf-8?B?amgrdEsxSll1Wm44Z1BLam5vMzdpN0pXQkV2cEk2OGJzNGErclhJM05vcy95?=
 =?utf-8?B?ZWdKRVU2Q2UyOVhsSXVwb3dBUC93KzExdDU4ZUVXMWNNaEdXTDlDYVdtN2JT?=
 =?utf-8?B?S2J2U0ZJU1hzMTg0ZFY1RlBCN0FhQXZNazdOYkZtakVSdU4wRWdualk4SzBr?=
 =?utf-8?B?UE93MWJXNFhFRjJ1NVNNQnJLaHVtT2pOWmV2emdDMWJPTFlhbDJWNjJwRjlW?=
 =?utf-8?B?UDBOMlEwKzUrWnFidzVmZjJGVnZicWJraVZzK2YwbU5BWTVaWUpicmlLZlE4?=
 =?utf-8?B?VjdsVmVabUJNa0VsOTVqaUIrRWtDeGlrbUR6eWFYWS9pNGVJZ2ErVTMrcjZ0?=
 =?utf-8?B?QzlkYUxEeXNYSnpYcHhIVEFsb2FzVXh2TkZ0QXVKbnViVFRiTnlrTUN5Rm5h?=
 =?utf-8?B?R0h3MUJpNHBLeVRsTEpMY3pqbU1JKytDQ2VldWVybUVDZ2xnVHJiTktMUnR6?=
 =?utf-8?B?WVZ4cHZGVlNheVc2b2wra2xqa0Fxd3ozRHhmWkZpY1k5ajlJSEh4UGRYcTNq?=
 =?utf-8?B?NVM3eVRDRUNiSTNxU0l4NUlmOFUvamZEWUNibnpQUk0rVkZMVDIwRlZhaGRY?=
 =?utf-8?B?clBXWnFoa1JWT1VvcjRramdaTEdMNERHYnVoU1JFeVFKa29kTDBTcyswdzlo?=
 =?utf-8?B?ekhWZTYyQ3E0b1AwRW5vU1NMR2g1UFpsMW1LSDRZS3IvbVlCakxqVGVOSVFK?=
 =?utf-8?B?Ym54YmVIYVdmRGJwbjJyTlR5cWdZcDdMY3dhaG1CWldtUGhxS0RIVWZIVkNS?=
 =?utf-8?B?aXhSeWFGVWU4Sk1tVDM5d25jYm1EQkZvYzZKWCtLaVNrR05UK3NoMTRiQmJn?=
 =?utf-8?B?bTFETlFzaEVDU3JuWHgrQmdsMUJIakw3TWcyS0lDY1JwdW5tbTVYQlpiNUVp?=
 =?utf-8?B?YjNkOERzSHY3dnJzRWl5Z0dNbm5JNExzNmFuSi9mY2NZbjYyWjQ5Mzc3Z0Rt?=
 =?utf-8?B?MVA1WkVNcnIrdFc1SFdSN1dic3lLYS9hbmZ0dHgydTlDUmR5RnA3TjBSeUpu?=
 =?utf-8?B?eDF6RWJjQkxQeVhKY09MaWNTQlVWRFV5VDhZdHZXb2x4K0YzaHdDNEhjSTZv?=
 =?utf-8?B?cVc2KzhVTVUrbmJNdk5ZTE1vQ241UC8vMVk2b29na3NIY2kxWEtMVnRzWjRU?=
 =?utf-8?B?NVZOdGN5VEVuQTVjYzAzVDI2SXlLYWlDSU1oT1RWRi9YcWFSNkpwYVViS2Ju?=
 =?utf-8?B?WUk2N1RNdVBQT0NZb3ZrN2o0NWFDU3RYODVRVk9XN3JSeFpaeUt1SFIwcjkv?=
 =?utf-8?B?d2w4ODBmaUNhVXNKanJyY2RKNmpyaVF6cTNsNmJIbVZCZk5YS3hiMEFxb1Az?=
 =?utf-8?B?bTdmQWNpYmlsSllZQVJwY3pBUERRRnBvVjA5VXpqQ251TGdKQ3NTdjU2QWxq?=
 =?utf-8?B?bVVISWE4YmNVZmk1K1FRek9ERU1OODB0dS80bjRqYldJTTVnKyt5S0VNRjA5?=
 =?utf-8?B?aGd2UEFVSnE5MGtRZFFIMklUVHZOSk1WUTZPQlczcjR2YmtpZlN3T2lqRlFt?=
 =?utf-8?B?d1l1OGh1OXRmWmJCZ1BsYTdBWThXRWdDODdiMlFCM2NSMVNSbnBTeVpUKzcw?=
 =?utf-8?B?bE9VZ0lvL3BXeHk4ck5tS2hsd1dCdTcrQWxvRm9aTjkxSlVmdVJJVjEzYnJo?=
 =?utf-8?B?TVdMTlRIVmk0c01vYSsvTnBPWlo3RUtSM1RZdk02T2N6c3hHS0VkZUtsUW9i?=
 =?utf-8?B?cjkveWVCWENrN0JDdndOU1YxbWo2VjI1Y2FNNGIrcmFBRHpieTEzajNsL2JJ?=
 =?utf-8?B?ZklwVHkyTDV3Ukg5UFh1SWVjNGo1QWJMYjlpUldrbUxHQy9MQTNmQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e72f7c-a501-4fe9-de10-08de4c8653e1
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 18:14:55.1341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qza4XP0VLpIM2n+Ge9BKhKsr4Qhk4/uBFAMnAJh5BKqY94FBW9haZgBUrlNI/GMwluH3J9v3mhYmC7IznRPID9y1Z3qNAb4Zgg+v0zkcxxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7302

On 05/01/2026 12:24 pm, Andrew Cooper wrote:
>  eclair-x86_64-testing:
> @@ -104,6 +122,33 @@ eclair-ARM64-allcode:
>      LOGFILE: "eclair-ARM64.log"
>      VARIANT: "ARM64"
>      RULESET: "monitored"
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_ACPI=y
> +      CONFIG_ARGO=y
> +      CONFIG_ARM64_SVE=y
> +      CONFIG_ARM_SMMU_V3=y
> +      CONFIG_BOOT_TIME_CPUPOOLS=y
> +      CONFIG_DEBUG_LOCK_PROFILE=y
> +      CONFIG_DEBUG_TRACE=y
> +      CONFIG_DEVICE_TREE_DEBUG=y
> +      CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=y
> +      CONFIG_EXPERT=y
> +      CONFIG_FFA=y
> +      CONFIG_FFA_VM_TO_VM=y
> +      CONFIG_GICV3_ESPI=y
> +      CONFIG_HAS_ITS=y
> +      CONFIG_IOREQ_SERVER=y
> +      CONFIG_IPMMU_VMSA=y
> +      CONFIG_LIVEPATCH=y
> +      CONFIG_LLC_COLORING=y
> +      CONFIG_OPTEE=y
> +      CONFIG_OVERLAY_DTB=y
> +      CONFIG_PCI_PASSTHROUGH=y
> +      CONFIG_PERF_ARRAYS=y
> +      CONFIG_PERF_COUNTERS=y
> +      CONFIG_STACK_PROTECTOR=y
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_VM_EVENT=y
>    allow_failure: true

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/12604499722
shows 122 failures in otherwise-clean guidelines.  Some observations:

llc-colouring.c uses binary literals.  These are safe to use now since
4.21 with the updated toolchain baseline, but the Eclair config wants
updating to allow this language extension.

ipmmu-vmsa.c has a git:// url inside a block comment, which is
considered to be a Rule 3.1 violation.  In principle this ought to fix it:

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 7dee4a488d45..8f5fc6c93bc5 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -60,7 +60,7 @@ removed by the compiler, the resulting slowdown is negligible."
 
 -doc_begin="Comments starting with '/*' and containing hyperlinks are safe as
 they are not instances of commented-out code."
--config=MC3A2.R3.1,reports+={safe, "first_area(text(^.*https?://.*$))"}
+-config=MC3A2.R3.1,reports+={safe, "first_area(text(^.*(https?|git)://.*$))"}
 -doc_end
 
 #


but I've not tried it yet.

There's a R8.4 violation against __stack_chk_guard.  I think this wants
deviating locally, because it's a fairly magic construct.

Other than that, there's a smattering of violations.  Some will be fixed
by some work I've got pending for the x86 side of things, but most are
specific to arch/arm/.

~Andrew

