Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE3CCB78D9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 02:39:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184819.1507106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTs7r-0003Li-QE; Fri, 12 Dec 2025 01:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184819.1507106; Fri, 12 Dec 2025 01:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTs7r-0003Jj-NL; Fri, 12 Dec 2025 01:39:19 +0000
Received: by outflank-mailman (input) for mailman id 1184819;
 Fri, 12 Dec 2025 01:39:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRu3=6S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTs7q-0003Jd-Gu
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 01:39:18 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e9d4f30-d6fb-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 02:39:17 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7985.namprd03.prod.outlook.com (2603:10b6:303:273::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Fri, 12 Dec
 2025 01:39:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Fri, 12 Dec 2025
 01:39:13 +0000
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
X-Inumbo-ID: 5e9d4f30-d6fb-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpeNwRgksZkctc9y8FIeeSfss04i4IN5hrTZAGqG6IKJ5S0wzNgxnADIvgER9ibVZ0PTu8xJyzwJNbCvJSDDEQmFBvP9WJczu8d6fKtF2j53rEoGSLbv13G4TX4Az5ZrVPONEuTfIJiweTfevW3WJlrQ7nZ0OCiqfjYGbIe3tTjxwz7Axt6HnsnED0tCJNVDnEIfFDh8GzEvtHxPDpumL1Vw3vBCcVmdlqouTgatE+fCO+w86gIEYvoBsOTZcN597+83ozaorb8eZHvcXb9zppMXtMU+k4HMwrUEEeg3gDvEuFYBIb7VgAJw/qvwx9rGGZjFHtg0vCNJRXh1XnIuvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZALJNq0kxwBQQHPsocYIkfEBSpsgHPFBMF0u2aGVKQ=;
 b=cYMnJagWfOCKqxJi23PCGQshXy+oXfEeUnKDBU53uAFiYIBPB6ZyGkCURG1xFGJc141LyMCZ0p6OLoh6GdH8yYdqMJ9rxLd22oMoz7Gp+9jAdkl5bFs7vq2zQQER1/luatLkSX4b/tKQ8Ar69MK+LX0B2jAQojOC83jGDUuvHs6uFjw0NC1FyQJdiN+s8IFe2Jx1bGE8pHgPt4VOp++RkM7fHYA9+gJAX0R89xUSsiPPiafTlwAKP+ciXn2GUbDe9JxVJw0LYG0dvtt0Ev8tmlSjQikIepR7HusLKB9xfBQUDCYe2Rdu1eM9y35d8RUBL51FokU9lPTBPPPxPZeuSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZALJNq0kxwBQQHPsocYIkfEBSpsgHPFBMF0u2aGVKQ=;
 b=bFAFJr7ejK4SYFoxNi9ulczi5abe/6/wwCG5u1uOIxGZ6DyQWvo6nP/V5uhnMYUBz0FRAngc7HSO/MtzOtxKdw0AAV0Ap617WiYJE5sFSfY3+jWEsBBDim6lEaYr2CaP4XsUIWPoXTbU8brEzb3kFAahc8qBDK0S9FoeD7FfCy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <86bd8cf4-7c54-4e54-b923-86c7ea1c3dd5@citrix.com>
Date: Fri, 12 Dec 2025 01:39:09 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 2/5] x86: Name parameters in function declarations
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-3-andrew.cooper3@citrix.com>
 <d64b368566892cf39c90f25b1ac34692@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <d64b368566892cf39c90f25b1ac34692@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0673.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 5365442e-725e-4555-a358-08de391f410b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmpQMjFWRFRDS1RRaVJ4S25JNHdBV3V5VmhaSmR5OVlCWS9VVW1VMndwT1A1?=
 =?utf-8?B?bG1pbDZGeDBhSDNJbDJzYkZtZEFNem96ZTV1UzZNL0FObkw1aFE2a3FvMlRK?=
 =?utf-8?B?aW5XLzkzQmtZckZHMnM4cUUvblBSV3FNTmFUS2wyaXd0L01Vd015aUJIRUFU?=
 =?utf-8?B?VW4wTjJpeFh2NTNlTnViNW5QMGx5WjhtbllvZlIyVk5vcDhtUUp1ZUplQzdJ?=
 =?utf-8?B?T1c0M2d5YlhwamlUOHlWbVZkV0RSMHlIazE3YnlVaWlYdzk0ZHJOVmt5VmY5?=
 =?utf-8?B?QU1qRURGMUlySjRZdGdBb1hGbldCaHdwYkRVN0QvV0ZSSmxSZ09zMlhKV1B1?=
 =?utf-8?B?VU1tRzBWVkM0dkZNSWxObDJxb0ZsTWVnaUJKOGRJMHhEaWtJRXhycnVoaGRM?=
 =?utf-8?B?REIrVWlDY254N2FodUZmNEk4T2h6MTVVN2J4ZE5WREV2TUQ0cm5tN2ViYVZw?=
 =?utf-8?B?L0pWU2xnR2p5OXlrb0xPQkR0Lzl1aEs0RlBnTG5aaE1EellqdEtyTFJITmJH?=
 =?utf-8?B?NHR1djFZbUcycEJVSmdiZHVTQWM5R2xqVlhhTm8ybTVWZitoM2k4d3NOWGhD?=
 =?utf-8?B?RHpJYUZoTEJaUjVEVHZodEZmV3c1d1BoUHFMQkhwYTNkQkE4cVBlQnpFZUR2?=
 =?utf-8?B?ZUhTTmI0SmVPa1VKdnlVZlh4SXUyMWVXZ0ZQeFRqQ251UVcyUm9IY2xRdTlE?=
 =?utf-8?B?aWJmdEFPUFlXcGZBQVlLVldTN2lhSkpiaVB6ZiszdHh6Wm1jSFduampucFdr?=
 =?utf-8?B?VlIvdnl0SGhLRURadDZJaHAweUFMS2V5OE1NM3BLOXZzRmVLUmk2Y1JJRVhV?=
 =?utf-8?B?UVFSZDdKSXFZbDJKdmFxay9kSyt4V1ZFbHNyNW1kUGNlUzdXT016M1Zlb2ZJ?=
 =?utf-8?B?UlJkZlNwQkQ1SitsVjlwb0hUT1VBK0dFU0U1aUFhOU5vQU41eldsckxTRFR4?=
 =?utf-8?B?NUhIYWdDa3dzVWVpZnZwTDNhK1hnMC9XQ2J2a0prcGllL1lzbEFISElhNDcr?=
 =?utf-8?B?OVJ5ZEI5eFowQXNoNjV3M0xTeStVcUZ1SHJwMkJvVE5RckFOSWNvQ3E2cnhx?=
 =?utf-8?B?STVGOWRtR0lYSzh5SkFxd1lGYlowMkY3cVI5b1N4MVUrQVFWZjJsS2pUL1My?=
 =?utf-8?B?VEJGUVM4dktVNHR2eEF2eDFPYzN4RjFac0ZaeUtmYmYzZlhuRVVsSE5aMUc4?=
 =?utf-8?B?OVNUWElzN0Z2OFhYWlVGeW01NDYyS2txYUlXZzUrSEp3QkRUSkl2QVpDRE0y?=
 =?utf-8?B?V1k5TkplL3JINE9WdFYyM1NPdENLS2phWW55b2REZ3p0QzhQMUFHa1U0ZWps?=
 =?utf-8?B?K1FSbzdEaUhRRzYvYTQyOXFqT0FvNDFYOEl4b3lCWTArbmVDSDBWS2ZwdG1D?=
 =?utf-8?B?ZFBoU09ydW5lcEdGeTB2SGh5QXpMUk5rR0V0UmgyTnFQeE05KzBCZ1FMNVVa?=
 =?utf-8?B?SkRla0J5Qnc3Q3BUbjJ3MEUwdVZmZzRZc1E5N2RXdnZJaHk0M1RhTUxtR2Zy?=
 =?utf-8?B?NlFkMmQvck00eEQ0NVlzaXNrNUF2MzFGYTYvbzllOXUvcGNybDM0aWtYb2xL?=
 =?utf-8?B?SUlPMWVCRTRNQWFLZXhjdG0zQ2tRTlZYUVFDQkNISVBqeUZ6UWRmYU1iU3lN?=
 =?utf-8?B?Zm55MmpMK2k5VngyT3puc01qdGdyM2RqRDBEbEY1blhEN3ZoUmFFOUpaTXRj?=
 =?utf-8?B?R21DMVI1enNxZjdRR0RPTWFXOHlCSm9yQXozRXV0SG9CT3h3bXAvK1REZ1Rm?=
 =?utf-8?B?OFFRTmxjbEdrenVSZ29hcC90NWFBbHQ0R0NTd1ZwWXhaVU44bzgxbUpGR2Rm?=
 =?utf-8?B?d2RFUWxGaWl5MUhENldNNW1RUzZRb1RpcHd6a2Q3OXc5UjhoYUV6T3VZdWtz?=
 =?utf-8?B?M2lmWDU0SDJGYkhGdTYrL3RhZGQ1SUxGUzY4RCtXMHR4eVBpQzJFS2pMZWJv?=
 =?utf-8?Q?N8CmF1b1GSqiznOgUnV8fFakOy5T/W2E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2NNVmFLb0ZXTVJmREROR3YvdnpWd3JsZGNHT016VXBYU2hyeGRRbllsU3dS?=
 =?utf-8?B?emlpZEpjK2F4bWNXTVUyamdrRDQ0bndQUGlFWU41Y05Xc0Q2eGxxN0R4cXkv?=
 =?utf-8?B?K1NiYmcvUUFWZGd2RHFkZkI0WnlTYWdJM0R1a1lIbDJMVFdhNjVlMEhhL3Vu?=
 =?utf-8?B?K3R0UTZyTWlldS8xeCtxZEdXR0pBODJvem1raExMdUp0TzdJeW00MFJKaFdv?=
 =?utf-8?B?aHNBZzJFdWU0SGZSdHdwRTlaWENDTmRiQ0k1Z3A2MzhoQ09IWkpON3JVNHMv?=
 =?utf-8?B?MUJMemhoUlpGeTg0ODZYeHAyekROTzBmbVRLelpDdWg0V3VadGtibUpWTlhT?=
 =?utf-8?B?K3A2aDA3WFJYWkZLSUE1T2tKdUo3V3M4OWEzNWV3MGJFRElNcnNNajVjZzh1?=
 =?utf-8?B?MWVmTC91YkJsQTNBSEE3OXo1MVhFK3dpQlc1TGttS0NRWTI3TDB6WXlYVDFP?=
 =?utf-8?B?cUxNeHhLWU9UNFAwdTk0cnBIckZKTFQwbUFyUWJDb0FOWGNIODdGdUozY2Jl?=
 =?utf-8?B?MGRiNnFxblNzVmQ2MXU2bGpXS2F5bEdKeDl2bnpHQmxRTTQzZGtHVkhQYzY1?=
 =?utf-8?B?TU90NWJIdVVyVk41TEZlMmNEbzUwcEp5M2RrNFltTmhjREs4M2l1Q0Nkcnc0?=
 =?utf-8?B?YTR6aGtDZGV5RnJaWkRGU1A2N0gvUVNtWlllUFN4bVlza3l5V1ducmFMUjYv?=
 =?utf-8?B?OCs3T3pOMTNhMHI5NjZTSUR2eFJiMzZ5SWF2bjk0NzlzT0Y4S0Q4WFNlSU5v?=
 =?utf-8?B?T0RaVEh1cGNqN2ZmYlNHVFN4TXhNc0RBVnFCbXozZUdnMU9iVldSeHJ2K294?=
 =?utf-8?B?YVVXczhObUJmQXRkWVZDYkU0OVRyK2hwbm14QWZ2TldmejZCbnVKNmxWb1NF?=
 =?utf-8?B?eU5PTklQV1VCSnllREpDa2RnUk9QZW12VTFzdE9wclJvU0tFWldkZHBlL1Zq?=
 =?utf-8?B?WFBQY3ptT1BFdjJUVXcwbnNwSDErQWk4bVY4c1lLV01YMCt6bXdkZVJGSTkx?=
 =?utf-8?B?cE1WRjZoRzVabEpnaFRKTWVCcEx1cDJZam1iaG5pMW02VWlnWUJmMEJ3K0NZ?=
 =?utf-8?B?S1R2LzNHeGU0cmZUYm92YXlwa0xsSVhQQ0Z2SnAvT1Nzd3U2UHEvNG1HaTF0?=
 =?utf-8?B?UVNQbVpRalViNVVSODlHZTdBeGNLSGk3M3JLRnM2QjdWNUtpZzFlMjM4VzRG?=
 =?utf-8?B?SFNrUDcvU0JUR3FhblIvc1EzQ0IzZ1hqOHBoVUNheExxSW5JT3VjZGhSWERq?=
 =?utf-8?B?eDBFc3IyOTJmbXljd2t0c0FwQ0FjWUpIMUtSdmNwZTl3WFdtZWZYS3hTMVBl?=
 =?utf-8?B?WExpa2wxSWNwbVJYZ3VWWE1QUTdvWW5kcG1CZWlJMEY0QWp0ZC9KZnVtRm5p?=
 =?utf-8?B?U0FPby8wWG1GU3B1YWR2YkFUMVFmQitRYk5LKzhQcXhYKzBMcm9VeXpWQmVH?=
 =?utf-8?B?VVNWbWZhOVBKbS9FVGp3b0o1L3FEN0V5Q2ZoVTJiK016UGM2c3VwSW16cTZK?=
 =?utf-8?B?L2JRd1dka2Y4TE9jUklvd0hqbW9FeWJrOVlsQ3d6dW9YRGlhUEkrdWo0SDJZ?=
 =?utf-8?B?RzE2cUpMUmpRYi9MSEVYQllpazRWTEk3Sy9xekhpangvVmlFOG8yZVBpSU40?=
 =?utf-8?B?ZEFSNVI0a08wbk5OMk9xS0Y2WmdmSnh3UXI3UEtRdWtYQ21lQ0VFek5ZeVgr?=
 =?utf-8?B?TTg3WkE1VTVnNzlHelo0WENrTldsY2VhT0E3N0c4Z0YvZ3pncno2eFFWMjJ4?=
 =?utf-8?B?NEtVNjNtckFJZ1JiVExqdFlkS0ZxUWxEU0g4T0ZUMEM5cWZ5WSt2TVhzc3Vy?=
 =?utf-8?B?UDVhTWJVT1Q5Wk5kOHZLUzNrWEM2U1lTWFJSQ3VxVDZYZFFpQmZZdkl1Q2hL?=
 =?utf-8?B?anMxVlBsQVhRQnJQZ3E4aGhIV1BTOWZRTTczcjEwMDNPODhzYXkyenEyRUxu?=
 =?utf-8?B?K1ZHWTZtcW5MeUh0Um5yYkhvTkN6S2hpYWdGQ1hoVUE5MHhUNjVCS1doQUxk?=
 =?utf-8?B?N1hYc3Q4SnhtcDRZZWhoRmlaa0NTMFdJU0k2TjZnWVpWeDlCMmx6ek5WUXUz?=
 =?utf-8?B?R3RSMWdyam13QWJOTTJYOUZzYmVjcmtwNVdaSThRWlVybE9pVnpZN3RrdG9l?=
 =?utf-8?B?YTNYVkwya3dZZWs3L1JjeDJEQnB1R0FrYXRid3NVSGUvZk15QXBKOExVRWVU?=
 =?utf-8?B?ZUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5365442e-725e-4555-a358-08de391f410b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 01:39:13.3110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIEsIwSUUCNKjBfeqQ+mHuOF9z1fv5zlSupLRuXMAUgMZdhtDPb+PhYnAKufCSNHNGjWZqqi/XYyEUTXs/vWxTsPrrNGcikeNh39Vsv2yoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7985

On 10/12/2025 8:15 pm, Nicola Vetrini wrote:
> On 2025-12-10 19:30, Andrew Cooper wrote:
>> With the wider testing, some more violations have been spotted.  This
>> addresses violations of Rule 8.2 (parameters must be named).
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thanks.

>
> One nit below
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: consulting@bugseng.com <consulting@bugseng.com>
>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/arch/x86/mm/shadow/common.c | 8 ++++----
>>  xen/arch/x86/pv/emul-priv-op.c  | 2 +-
>>  xen/include/xen/livepatch.h     | 2 +-
>>  3 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm/shadow/common.c
>> b/xen/arch/x86/mm/shadow/common.c
>> index 423764a32653..f2aee5be46a7 100644
>> --- a/xen/arch/x86/mm/shadow/common.c
>> +++ b/xen/arch/x86/mm/shadow/common.c
>> @@ -69,11 +69,11 @@ const uint8_t sh_type_to_size[] = {
>>
>>  DEFINE_PER_CPU(uint32_t,trace_shadow_path_flags);
>>
>> -static int cf_check sh_enable_log_dirty(struct domain *);
>> -static int cf_check sh_disable_log_dirty(struct domain *);
>> -static void cf_check sh_clean_dirty_bitmap(struct domain *);
>> +static int cf_check sh_enable_log_dirty(struct domain *d);
>> +static int cf_check sh_disable_log_dirty(struct domain *d);
>> +static void cf_check sh_clean_dirty_bitmap(struct domain *d);
>>
>> -static void cf_check shadow_update_paging_modes(struct vcpu *);
>> +static void cf_check shadow_update_paging_modes(struct vcpu *v);
>>
>>  /* Set up the shadow-specific parts of a domain struct at start of day.
>>   * Called for every domain from arch_domain_create() */
>> diff --git a/xen/arch/x86/pv/emul-priv-op.c
>> b/xen/arch/x86/pv/emul-priv-op.c
>> index 225d4cff03c1..08dec9990e39 100644
>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -40,7 +40,7 @@ struct priv_op_ctxt {
>>  };
>>
>>  /* I/O emulation helpers.  Use non-standard calling conventions. */
>> -void nocall load_guest_gprs(struct cpu_user_regs *);
>> +void nocall load_guest_gprs(struct cpu_user_regs *regs);
>>  void nocall save_guest_gprs(void);
>>
>>  typedef void io_emul_stub_t(struct cpu_user_regs *);
>> diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
>> index d074a5bebecc..3f5ad01f1bdd 100644
>> --- a/xen/include/xen/livepatch.h
>> +++ b/xen/include/xen/livepatch.h
>> @@ -62,7 +62,7 @@ struct livepatch_fstate {
>>      uint8_t insn_buffer[LIVEPATCH_OPAQUE_SIZE];
>>  };
>>
>> -int livepatch_op(struct xen_sysctl_livepatch_op *);
>> +int livepatch_op(struct xen_sysctl_livepatch_op *op);
>
> xen/common/livepatch.c:int livepatch_op(struct xen_sysctl_livepatch_op
> *livepatch)
>
> Shouldn't this decl also use "*op" as well? Might not be triggered in
> this configuration due to the absence of CONFIG_LIVEPATCH I think.

Yes, I've converted the main function to use op too.  It makes the patch
a bit larger, but it's a much better name to use in this context.

~Andrew

