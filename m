Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5296B96C2E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 18:09:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128555.1468876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v15Zu-0003iH-Vj; Tue, 23 Sep 2025 16:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128555.1468876; Tue, 23 Sep 2025 16:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v15Zu-0003gQ-SG; Tue, 23 Sep 2025 16:09:18 +0000
Received: by outflank-mailman (input) for mailman id 1128555;
 Tue, 23 Sep 2025 16:09:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2YNN=4C=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v15Zt-0003gK-Mx
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 16:09:17 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7610cf5-9897-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 18:09:16 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA4PR03MB6912.eurprd03.prod.outlook.com (2603:10a6:102:ed::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 16:09:13 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 16:09:13 +0000
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
X-Inumbo-ID: a7610cf5-9897-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erCHRTdJo9SV9hmG+pMBzAHKLO/9qdYHa0F9L+xx6KgcklUPLPQEdwIHhkVCHbHbWHEIK9yB0B/8bBIg/yuaoU2PT0bykuQAYOwVDH8z7puKkwwBsYlA8kes4+upc/4xf1rddg6u7KOzLA+msJwAMJJDMD2pyt+EoYhkyatHg7Tewy0volnmHsvknBF5GA3ygzdu+8+Igdsg0Tpn8z5kaI9ByWQg1e7gxP/h6p7KYn9GF0DCqq13/vhoCPgyc1vIzy8OIboNbhIJB38K6FMYD5RALyxx/82Ix/BP/0DaMPEDLWajfBK21iGL4NrCLgz/fBigQv14M5FJnJAOqPjDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgYbIqmPzaadCHsG1AUdsgMu2bZQyrWqSA+X/MCcE44=;
 b=S6qJ+0Pgv8OI0TX9NTaH7/0/NT+hiEX+9ITxm2TVvi1PHDQrjXuyx4Wf39njhagnEeYJyCwCVV4PWunUgN1vAG7jPwQVXLKr5WutIiYeKQ1T7sMuNB8AcyNbWK/aMpM3ieoJYlo8TuiS15PzJwJd4t5pg2nFP9Ncbpf3sW9UkLPp181pcwHPL9Z99EyS8zyzU9LZEIDyzWTv9F1RDugM2pzv7tIZvt+JbJTvQ8M3NVGc60Xy9Cfyx9cMOvwqt1UeszqPlSm3eKZ3+eHYyj+qHssqsm4FHMpTgDtu6zsYWlhswphnr7k6n89LbAh0Re6Jq3W62KR/mjlZZWE3nVmkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RgYbIqmPzaadCHsG1AUdsgMu2bZQyrWqSA+X/MCcE44=;
 b=Z2XZMyvWcVdn50rPho5LjW+8be3zFVa5CWJiiLbb3MgBuTc/V/QVW4Bevo4fP7BBmoi0FBxusOp+PDjJbLtiyipg4xIc9xmdJodvf9ajotsTRgQSbRIZEzhY3mkRWABJjlxxRmmNLVobY5mbhDfnO8tyzH1lNJZc/fqwAeP6862fzF5BfYonNFRmNBfBknpRlfU8yXNPX3myogIUy9Tu7ywl/WLXOyzrI/y1dzhyLN3f3c8Lr9uopegQ1T64NQ8CJdle+WPgKovDM2UQ88tBQzLY7Zc3Y9UAVBSJ9QzWdRAKPz2AqSdCvd0Un2PTSaQam3qLzrv4pLzc0N2lTD0blQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <0e69a741-b6e1-4315-91f0-581f72092c68@epam.com>
Date: Tue, 23 Sep 2025 19:09:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Implement CPU hotplug on Arm
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <cover.1758197507.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0405.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::11) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA4PR03MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: d1406d52-630c-44db-5cfe-08ddfabb8970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHRrYndtbzFzaTNOUW9RSGpqeG1oekNVREZMZkN2Ym1VbjFoRnFWMlZ3M0Rh?=
 =?utf-8?B?NC9MWXFldVdOUURnN1piWFo2Rm9VbVpzRXpvbW5uWjliWHhoamZFZDRub1lN?=
 =?utf-8?B?b2NSVUpDYlhOMTI5a0xzRzF3K0lqV21iWEpQWHFES1Y5M05DSjdDTm1sWlVE?=
 =?utf-8?B?N2pHaGU3RFo1S1RoaXpBelhjMkxxbU9aNENZYm5GVDltYzhidkc3S3g3YUpO?=
 =?utf-8?B?ZnBmdm1JV1ZxcmhLTEk0ZzdjQmtuazNuY05YejZKazVmdDlaR2JQZC8yeHVh?=
 =?utf-8?B?SGJzczFhaCtvTllvdEU0NjU4T2d2SUtoQkZjWFRFQVZwZDNhQ3hqWVlFdzJL?=
 =?utf-8?B?cVg3cDl0WnZlNEl1Yk50WUQ1V056U1dxTGR4bHBkT1lJcUx1TkpZQ0xqNjVq?=
 =?utf-8?B?dURYOGluQmhiaDdibFF4UU1rUm5QZkpRSWpXYzNrOW9mSXc2aUR2cjFCcUV0?=
 =?utf-8?B?L0Y5V0tqMWplR1BiTGFScldwRFBObTlhaGs5SzhGeTBYR3R4anB4QzVDYUtv?=
 =?utf-8?B?UUt1c0UzQitEejN5MGxFOWo2TjVsNkEzUlFsY3BYaWJwUm14QUk0NThUSGdy?=
 =?utf-8?B?Sks0b05qRmNUU2dWNEVENlgyOEg5LzdqcjR0RUNhK1JWdWNIUnBiZ3JFenVx?=
 =?utf-8?B?L2hxTXlVU0lYTlFhcGE4dXhtOG95T0hsUjFWdEhOTmQyQzRENktHeTJua1Vj?=
 =?utf-8?B?dy9ydk9UMXdWL2ovS0o4dEZuYWZhTElBdEZRQTR4NW4zZEw1OEY5T29INXM2?=
 =?utf-8?B?N05kMi9RWjVUbXg3b2lmYWxPWnhJOTVXcmI4NENzWlk0b095eDRRbkFnMnF4?=
 =?utf-8?B?QVI4OFFaaE9KUHNQMWczNUZtWHVYY2ZDVFFTV0tTTmdaY2JJK1dzVmxOYlVK?=
 =?utf-8?B?aWhsa0hCWkQySE5Bd1UxVTB2cmcwNnlMY1IxTkxabHVWM3p3MFEyUkFBWDFJ?=
 =?utf-8?B?V3c4OHF3alM5dXZrN3FSeld5b0JBdWxySjN3Z3JqZlNENE5ZT29CN3J5eDdB?=
 =?utf-8?B?WWNBakpUdTd5c3V3aEtZbjNOMU4xVHVCUHBoNHUrcjZNNVZBWURxNURSMjBG?=
 =?utf-8?B?Wi9uZlAzNWM4RHo5YThyQ1VhQWlnejVqU2FpQ3cwUjBCbjRmN0lXckdzT09J?=
 =?utf-8?B?RzYzMFoyR25FQ1Nha0V3Q2JLOHhMK2FBNFo2Y1dibGZPNGIzZnVlOURxYmhm?=
 =?utf-8?B?WUxMYVk1VHpNK2RvMkVCUnBiZUZueHUxcmVCbW1LOXRZaXVPaGhPRzVib0FK?=
 =?utf-8?B?elFITnpEeXpaNnZ4ZXIvUk96a2M5clg1d3dLVUdHQzVaa1JBRmNWVDJLbW55?=
 =?utf-8?B?S2EzOXM4RzZmekQ2K0lBU2FGb2YxbGFnclZyeVFoTHkxaGs2ZlJrNkYvV0F4?=
 =?utf-8?B?bExRVnYwbVRsMVdWZUZkR1FTRWhqZkFHUWlvdlhzUmwzZWhteWVHeklDVVFF?=
 =?utf-8?B?VjBzZlZNcml0a1pLTHlnT0NOS2ZncGVXSWh3a1EvUElYTXhRei8xcWxXYTBK?=
 =?utf-8?B?Y3M2ZHVCbGJoN0pKZHJmMU01bjB0S2k3NXdtNlZBbHVtYTljRjMzNEtoclhh?=
 =?utf-8?B?WXpBcVMyUGY3RDVYU1ppVnp5UEhUZmNnWHMrL3NWWmt6L2NaU3VaMVc1eTl2?=
 =?utf-8?B?SG9YWTJoM2tIT2hOWVdXY1BMcjd4UmdMejMraW1kb2I3RUtqSzIyQ3ZKVDhZ?=
 =?utf-8?B?d1ptK1NmNXRJY3cyZ3FHZmdjK2orNGhXUHQwUHR2dG5DaEhFS1BiTEZBaURU?=
 =?utf-8?B?czZjcWJTcXRvTU1hb2ttKzFValkyUk42T296dTZjQjR4OGc1V081UVczN1NT?=
 =?utf-8?B?OXVuQWxKTVNwQ29BWTIzSDFxcWxSYTVpWWN5RlJzSXd1VERRZXQrSWtnVk1k?=
 =?utf-8?B?Z050S2Y0M0xzdVh0Z0ZiT2JIM2FJZXczcnQ5VExQV0VxaHlIYjdLT1cxUUty?=
 =?utf-8?Q?EZbiu05cbM4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVlYakJ3QjFnZmVmVzRSTE5ob3h0WkZReTQxdWFSb2tJaHdqbEZhdUFPeGxU?=
 =?utf-8?B?amtZZDlGSFlnZjdsVkFZcHNnaDhHc01uQlE5VkxyZEpuVE05SlRxdzFYUEVB?=
 =?utf-8?B?U3d0TmJVMExDcWV6bzBaWXNTcW5GUHZwaWRkbnpGMEM3cEJxTzAzYVJabDE3?=
 =?utf-8?B?bmhmd2VjMEk3Q1hpREtRZWRSTzBoc0pkWDN6NHc3a1NuTXo2ZGM3bEdQZ3lt?=
 =?utf-8?B?SFJnc3N5UnN1blBiSldIUWtDOUcvSXY3YjhaNGNCNnM0QVdXa1o3ZUhDUEhq?=
 =?utf-8?B?cFlURTRFN3BBUVg0a1FTeFYxeWk2Wnp6eHB5Q1orRmlHWDB4N2U1RXV5K0xB?=
 =?utf-8?B?ZXVUYXJxUVA3Vm5FSUdQbDl3T0UycUlXd3ltN0NUT0F4Qy9rdzlOR0sxZlhy?=
 =?utf-8?B?MTVoNHUrU004K21HNUx2NFRTd2ROMHJ2dFhyR3BGU1daTVJ3R2pwYlhhTWR3?=
 =?utf-8?B?OVdaMDBtRzMrYW0wdG9KME0rRXBSYXRDd2E1VUVBU1hYU0R1MFFaa1NGQjlu?=
 =?utf-8?B?REU3QWdxVGo4b0NmOU1kZDBEVWx1Q1U1TEZ4UGcyK2htY2RCMXVWZm13UXgz?=
 =?utf-8?B?TWtFOWlodnIwYTVCV1ZhT2FzU213aHUxcTlJTFpFQ1JuUDN3T0pTdFcwU0xs?=
 =?utf-8?B?UlU3RFhxSEovK1Y0RDgwT0MxdmVGS1hqNzE0THV4YVB6eWxRM3AwcUUxcmQ1?=
 =?utf-8?B?UG5XeitUMHVaWnpsV21GRDdCY0dnWlhKRWxWZHJHNWNOWXlPdVBKYzhkaXdQ?=
 =?utf-8?B?TEJDRHF4bkhIWXovMkZtUnpDaDZuRFBXTkZDMFB0b2dIb2hLN3hQdXg2N011?=
 =?utf-8?B?cjkrN3M4WkZGS1IrRHlUdXBGMjFaT3RzZktDbjZQMC9GMkZXSDlUTDJrZXVP?=
 =?utf-8?B?ek84Y01XeS9hdytWYkRiNTlpTTRzZXBDM0hpMEJtS2dmMkhqUGViV3ZhZGpC?=
 =?utf-8?B?TjJ3b0ZCM2M0VzJid0tFR3ZDL0xPY3RiRWE3UW5VNmxSNHZCdkF1WHFOdEVC?=
 =?utf-8?B?U1pUNFVBd2lLVHkvSUV0V1lWMzQ1ZjB6STY0b3puWUozQjBWdkRTR2xOKytt?=
 =?utf-8?B?UFpxUTE3eGZVaWNOZUJOU3hETVI3UU82KzM5MFNoWDNjazhCRmRHN25ndXZ3?=
 =?utf-8?B?d1RkbHZ0RmRVMm93WVRYSk1PaEJ0dUozekhiU3Q1RmhBRklDTnphekRqRWVs?=
 =?utf-8?B?M3k2bEg3VlIyU0lDZWlCb05nYUs2TWdmVU9vV0oxODRLNGlUK25HVGxWT3N1?=
 =?utf-8?B?aGR2L0Rsd045THBzSnE5RHV2OHhoQWVGc2dlRHM1WXI5SktjOUp2TUtNL3Jn?=
 =?utf-8?B?MXZud3RaUXJrWkIzeGZFY3Z6VkV4Qm9qRzBpaS9MT3l1OXRkUk5BQ241NlhH?=
 =?utf-8?B?b210aXR4MTBBNFhHaEhLaWp4QnQvYWxldjZRM21HTFVESUxkVG5JNmVENjBU?=
 =?utf-8?B?TFk1bnkwMkZsVU5BeDNoQW1DaGJLNlJEdVB1TUtISDA4NEROZ0xTQkZvTU51?=
 =?utf-8?B?RFA5ZzhzODRnTTc5VHU5L0t5TGppME1tTzBQbXVaVklUanlFdFJwemRCcEcv?=
 =?utf-8?B?YVFpTEF4OFpFc0JzbHduUUVGZnAwdjZqRjBRTUt3MnlDWVlqT3RMZ3NZVWts?=
 =?utf-8?B?dlUxT2lmR2F3RFVXMEcrbTBsYjRUVkRKdHBaWUh6MXJveElHR2lVTzRUZ3lN?=
 =?utf-8?B?Yzhib2V6YkxTUkxuS1pRRFpiaFVZeWp4c3c5c1pVUVM5bGh0R0gzTFA3M21B?=
 =?utf-8?B?UC9KNEJta3NKNjhiaVBtS3FhYnJGOXMyZnFwR1ZPTlE4cFBqSjB2aWQ1Y2E1?=
 =?utf-8?B?aHpFZHVvK3RrK2hwVkxvYlhLbllFRkFXdnhXK2NWNWREV3pFZGN2N0x3QmhJ?=
 =?utf-8?B?cFNVNEhTMitFZWRXRlpGY1NIL2ExeUpIdzkvZS85MFhCSkxJNVdabnJzcGVo?=
 =?utf-8?B?dTYxaHNUL3JBYVY2bXpycmVsbzdyK01ka0ZwWDJ6Y3BIMzlCZ3BsM2ZsNTNl?=
 =?utf-8?B?Zm5ZTGkrelloMVorRE5Uc0N1SzN0aERjTUE2VDZHOWtsd0lRMFVqZE5mU3Z5?=
 =?utf-8?B?SWVUMDhrYVdUbW1wR0w0UVNiM3lwaG9oejNmeGlZYW50VUw5Z29qbWZpaXZn?=
 =?utf-8?B?Yk5ZUkxkRVc5am9jRGs5ZzYzSmNGNlVnM1VBY2RGU3VoQXErVGFRQmtJZDlT?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1406d52-630c-44db-5cfe-08ddfabb8970
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 16:09:12.9590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffuNNXAy9/jvfOkBucHK5oBO/yZYwhsjDb9FzBYEAHR+i6lBw04zhK3AbK56Tf1MhwcG8pkD69O4usSGDwG+22VVRK+RAITN5VyJ5TrDdcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6912

Hi Mykyta,

Thank a lot for your patches.

On 18.09.25 15:16, Mykyta Poturai wrote:
> This series implements support for CPU hotplug/unplug on Arm. To achieve this,
> several things need to be done:
> 
> 1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented.
> 2. timer and GIC maintenance interrupts switched to static irqactions to remove
> the need for freeing them during release_irq.
> 3. Enabled the build of xen-hptool on Arm.
> 
> Tested on QEMU.
> 
> Mykyta Poturai (4):
>    arm/time: Use static irqaction
>    arm/gic: Use static irqaction
>    arm/sysctl: Implement cpu hotplug ops
>    tools: Allow building xen-hptool without CONFIG_MIGRATE
> 
>   config/arm64.mk                  |  1 +
>   config/x86_32.mk                 |  1 +
>   config/x86_64.mk                 |  1 +
>   tools/libs/guest/Makefile.common |  4 +-
>   tools/misc/Makefile              |  2 +-
>   xen/arch/arm/gic.c               | 10 ++++-
>   xen/arch/arm/sysctl.c            | 67 ++++++++++++++++++++++++++++++++
>   xen/arch/arm/time.c              | 20 ++++++++--
>   8 files changed, 98 insertions(+), 8 deletions(-)
> 

Hence you introducing new feature for ARM I'd very much appreciated if you
add corresponding documentation under docs/hypervisor-guide/arm/.

-- 
Best regards,
-grygorii


