Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB4ACA4F68
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 19:40:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178197.1502131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vREFB-0008Sn-B9; Thu, 04 Dec 2025 18:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178197.1502131; Thu, 04 Dec 2025 18:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vREFB-0008QE-7N; Thu, 04 Dec 2025 18:39:57 +0000
Received: by outflank-mailman (input) for mailman id 1178197;
 Thu, 04 Dec 2025 18:39:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GYI0=6K=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vREF9-0008Q8-2B
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 18:39:55 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f1565e9-d140-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 19:39:52 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by AS2PR03MB8794.eurprd03.prod.outlook.com (2603:10a6:20b:551::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 18:39:49 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 18:39:49 +0000
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
X-Inumbo-ID: 9f1565e9-d140-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGSauk4CSgRHgzlo7LaFt/QfIGPRohQ5e3seguG/ACfTQjoLfiEEXxldQKliiqQB/MmyTmB0aMIaGHWCTE9hfqkIgNz8SJz82kamGgZ7WYKgHEum1Mnjwk0SllHUQ5qYEmGIOsW24SqAbMg9KTdKf4KyNxMsQbHDQXVyHZFlNvxydBjYexGJivl0HOYEGAOg92EBGNAvZcRpfIIlIq5PX0sLJR/cbQurW0c3iTt/U0WGifs9AXfRysazd1gZnPOO4tmfr08YZFunssbHXE2bAaXTPjzSbnornyPXkXM5v6ePT4NmU2eCpckiEu5Wv94I8JOCAZwiFwZusOICQ12fkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDMfcvz8fLnte1WsCYChgp9m2SH7DImUd7y12a5Nx1I=;
 b=q4LCGCUirxEY6HOc+2umSk6560WC0FkdwoxFltmpaoibEsKrIrX9PvvgyAgG1zr2EXQXl6C7DdA6QYmawPIhWwAU9/CHwH4XiUSodGZeVkmow4oZwSsjZolEUNhtIkOASi1ZAuTlu5497/x+kTUP/khTV+Qo54wVOd1iscbmOfUrOTC3191pG4tCsD06w1xusdyv40vtrEnwxMYAYNw8hmkFNOtKyfhnzcy0gDio5BX9t4L6sHT6XiRvKSDMRnH4xNTOhRDBfLCXcmNHCveLKzvWgb0lqM6jnbo7Bu3mHZBWOGGJYRHRgmyb3eIiGY+j6XFjEEh6WS93vQ5GlJPSIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDMfcvz8fLnte1WsCYChgp9m2SH7DImUd7y12a5Nx1I=;
 b=n21s7yjYayCSaIGWR9toWRbvQuV7a2NCcgix9nxIg4LYyJBuLuPAXI80VGE7piiYR5Emh50RNIoFgSLkFGz+Rv5bixTUHfvMDMKK6g6e3jJ0kUT6ISto8HjwAL85ZboTIkLjyqPPd0G89WXZ1GXCN4UV1FYWq8lSuo+Amgz6nRvamZy6EOOJ9lUMREu/7HlVLDSowJl+Su4jeQj1bL1MdAZOKoSftYjkgqKGYFw6fJwYEoKx/b3SuV8nXLrqV80Rm26P0P5aASA+SItP+IxZxLnAb/Kqpaz5PQJgIkqjOULngOLW9Vc2rtdrjUDLucusqHRD2OUtGtkyFEC7+dQ4+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <878080cf-933f-4e33-b059-ca6088fc3110@epam.com>
Date: Thu, 4 Dec 2025 20:39:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 3/4] x86: hvm: factor out COMPAT code under ifdefs
To: Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20251119192916.1009549-1-grygorii_strashko@epam.com>
 <20251119192916.1009549-4-grygorii_strashko@epam.com>
 <88f06355-b49d-4ac1-a7e2-5665d4901618@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <88f06355-b49d-4ac1-a7e2-5665d4901618@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::12) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|AS2PR03MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b076912-37c3-4f3d-3ceb-08de33648174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Skh5ZlEyTGgxTlJOZDYwMjZPN2IvbWRHS3FibVZpTlBkSC8vRXR5ZHBxTG9p?=
 =?utf-8?B?a05wNUUwOUdrMkNTZVhnT3h1TG95ekluVndGc1V4ekYyOS9wSDhjclNXcEZ2?=
 =?utf-8?B?K0EyWnY3bmlpOWkreGNsTlY0Z25oeXJoaytlTWhYU09tM3hLMDErbnp6Q1RC?=
 =?utf-8?B?UVVqR3gzbEdpQ24vS1REQ25pbVZQK1JWUjR6ZmxFL0luTGtSZzRhMDJBdE50?=
 =?utf-8?B?MytkS0tidW52aU9RQVNnY1FwcGZ2WWxwOHRqR0xXV2JjR1V3MWs2WDBLWUgy?=
 =?utf-8?B?ZFRXR09vUjh6THByaDN4dTFZVjV5Ykx4bWRPZnAxRDJyTlBqR0dXV2ZwbE9E?=
 =?utf-8?B?TFdjOFJFY2s3Sm55VHlwaTBHQU9ld1JYd1dOK2FLSk1KQ05QSHhUSG4xajNO?=
 =?utf-8?B?ZndTOXFyQ1dWbTJPVjZXemxXRWV6bHZSaVhhWHVBMUs2dmFHVElYM0RISDRh?=
 =?utf-8?B?NTE4MzNYTnZUdEZMN1c4SjFpbVJ0N0JhTkdkUXc5VVMxbkJwd1ZoQkFPT05n?=
 =?utf-8?B?YnJuclhTRk15WjJGL2VPa3MybXFnR1F5MW15TUNORURQUnpaQXJMQVVjbWgw?=
 =?utf-8?B?cFJVVG1hL0JXeFlzc3pnTmpqMzdUKzNHdjRJTCtCK2VQeGh6Mjk3TTd0U2pU?=
 =?utf-8?B?REtOYUtZQlpsOEhlRFpKUHNEZlhCMkpYckVJaitRV1Q1RFZQSDR0WDlMZVBj?=
 =?utf-8?B?UEpWYmszeTZJeTExbVVLLzhReWhHM3VxUXUyb2hRd1ljb3BxWHhZOU1LNGZI?=
 =?utf-8?B?cEt6djludVBhTjdhWm9OSFIwTnVIRGlpNmFSckQzY3poT0c5SjJZRDlObzR5?=
 =?utf-8?B?U3FjdE5TTGk1WktyTTBMbzErb0dkWm9lZ1RPMG1hYy9ZcFc3aVA3dVFzRkxk?=
 =?utf-8?B?MVozTjdPbFVDckliNHdmMVVlekk4Qjh6aHlPQUhIbWs0ZldXRk9rK2VydWdk?=
 =?utf-8?B?QWUzUUh6T1dSODZaS1BpaWRJZEkrWHgxRlo2UUlaaW5HdmlSNzlCc2VXcENk?=
 =?utf-8?B?TjkyNFczcENNQ3ZhTG90NTd5YTRKY2tpTzZrcFNhbXdWVFNSM2dxOS9nOWpM?=
 =?utf-8?B?MC9NbFR0RFc2ZXpITmZ3SUZpUVpjL21ocjVpdUI1VG9UOHVFQ2FIcFZkTy9W?=
 =?utf-8?B?RjRnRlJjMjhUcUg3cjNnQXd1cXJ4ZlVBcW80emdUR3k0elhtcVFMQ1Uyd1l2?=
 =?utf-8?B?VUxWcGNQN0VRWEhMcVJ1ZktsaXEyT055TVR4WGM4S3hDaDdqUS9qcW14L1d5?=
 =?utf-8?B?ODlJblc2UnhqUnBuMGxIM3NPWnJmL0VaNWZ1cDhadkV6S0hkdXNmQkhYN003?=
 =?utf-8?B?K1FpU1FrcittVVB1VzZhVGpBMTFMM3F2NGZWb096TUd2cE8raExnZldzcHFr?=
 =?utf-8?B?SFE0M3I2TlU1R1prZER5M1U3RHRQNG10VXpkRU5CMWgrSm16Y1lXRzdLaGVB?=
 =?utf-8?B?UEdGSGF4MTd4YWQ0KzdFZGx5VFdudU9Ja3l2Q3VUa2I1YmROVHo1ODh4WGhl?=
 =?utf-8?B?c0poRC8xbnh3VFVCYWxTVzVtbHdTUE11R3hKN2l6dWxKNG1uV1VrU2pXdW1j?=
 =?utf-8?B?ZG44SEpTbThWUkpXcWN1dTQ5MlJEaHFCcVA2bjhWNW5SVnlIQkNUT29MdHpG?=
 =?utf-8?B?QnV6SGJnZmw4K21UR0NRQ1dTRU5SK25KQ0tKV01ieDljaFlkRG1Pc0ZIUDlo?=
 =?utf-8?B?bjFZOHZyQ24vdFJsREFNaGg5aEFSN2lERUdhd3VydlF1NXBYc0NqS01nc1Jk?=
 =?utf-8?B?R3YrYXBFb25GSnFjVGVFU01NRWk4SjZWVTF2dG4vaWVkSkxlWEpMMU5qMHlO?=
 =?utf-8?B?REpVYkVkaDdScWtlM1Ztc1ZGQVBkWHl5OFkxTlJDTEdTc1RJc3hsU1NBcnQ3?=
 =?utf-8?B?Z01XWGp1OFdHU3lESEhTU0F4NTFKejdia1BQaW83YzVFc0g4M1FKTHl6dW1o?=
 =?utf-8?Q?SlN2j4cpmSEdrTZRTHizBtIQfIfG5Skq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjhsdGpJZitnSDVMTTZuelV6dGtUOVdPRFM1NVE4UU53aWNhOS9aWnVYNnB6?=
 =?utf-8?B?NmxYK0s1c1JGSVg3OUtUczE1cUJsck1uaXJub0wyeHFxSjBWNGVScEovaHc2?=
 =?utf-8?B?dnMrZ3k3bE5kcGpxMENyY3dZbEFDVDJtcjR3blFZWk9kcEhzVkd3UENsVkp4?=
 =?utf-8?B?dmpWMG1sWldCWDNsWWtDdTV0dHdWZ09PTitwYlJOa09DSllObDkrcnhaNzBa?=
 =?utf-8?B?Zmc4L2pYRFJCWGhGSFdFc2xzU2tvYkNncVM0UXZKczBLQ0ZUYVhheHZZQ2xx?=
 =?utf-8?B?VDdlSE1QTU8vaGdiZTROU0h3ZlNpYzRKQmhYTXIrMVlRVGhHVmlLMWp4dEdC?=
 =?utf-8?B?bzRBQmFFWGQ3L2FyS3p6SUoxRnhMQi80QU5sZENFMmdmSmp6QlUvOURIZ3JH?=
 =?utf-8?B?dFpQdlNzYzlIeWdHM25uZkVka1k3RjNZTmdSNGVoeUlrVU84ckpyMXlvenBs?=
 =?utf-8?B?Z0Q3MTdRTEg4MmFqUnBaTU51enZGYi9Ka0prZG5KOEpiVXNWRElhbzZoWDFR?=
 =?utf-8?B?UlBkczNlRURiVEs5MDM5U016Q3g2bmpPWjB1MDlsYVd4NXdMWk9JbWNtN1M0?=
 =?utf-8?B?R0N1Um5idkZ5REovNHdUMm9UWEFYMFhUdldyeVRIZDNraThTbUVRaVEzZHcz?=
 =?utf-8?B?Wk1HUzdCeHBHVXIwQXhrT3hEYTdXaEYycXlOdjI5eWV2SmhyUHNUTFU0Mng2?=
 =?utf-8?B?U2lJTXA1elNkREZrOVdvL0wxTC9RNTRXVTdIWWJKYWtidUdVNk9Rdnh2VE9l?=
 =?utf-8?B?WVZHcUdHcUJRRzdGUmpNaWdiYktIVTkyTUlmRmFoR2x5RTd2ZnFDRlNaMWJ3?=
 =?utf-8?B?d3plOFVQZjkvdVQrVG1lSzN5OG5lWVBhQmZiQjJCVVN1elhNMHdYdm5MT3BP?=
 =?utf-8?B?UDNibUdEd3N3WGg2Um5yaXo1a08xUDFOZ0JGd1FILy8wTDRyK01jMU9NMUxL?=
 =?utf-8?B?UjJwSzJaYTdRaFJjSS9jcjBPUVAxWFVud0FwUDBIMnJXUFp2NjAzZE5uc0xI?=
 =?utf-8?B?RFprNmlwcklyNDlXdXVRREFEaFU2ejY4U0dETVoreCtsU1kwaFJ3MHBwVDJn?=
 =?utf-8?B?eDhod01EQm55NnF6SXdTTkRBRU9CeTlZL0kveEUyZG1TQjJDZXB6RlVaVTBK?=
 =?utf-8?B?b001NVVPUmhvSTh3bWcyRHMrMVNRc2dZd1BZdnh1VTk4NEdMeE9YZ2EyalpX?=
 =?utf-8?B?akVuQTAzUWgwUjNsTmdZSFkwZGRjNXp0QUcvejdCdHJkaGI4ZkZXejVGd2ls?=
 =?utf-8?B?Z3BTeEpaNGIyZ091MkFMcHhxVUdrU3doa0g0SDluRnpabXQ4R0t1RkpwQWlD?=
 =?utf-8?B?RGdUQTQ5ejUvUXJxVGdYTHkyT1V4OGZwc05UT0tZZ0hqWklhVDRBOWFwRHRn?=
 =?utf-8?B?a05nVDlHdG8rRVVLQmhjYUpNdjl2SXNXNmNzV0VoZE5kd3ptVTBINW9hRkJt?=
 =?utf-8?B?NTh0MDM5RE9iRGJqSVovenh4bFRRTzdUNCtGcVJtb0d5Wk1ZNktMakdkaWRj?=
 =?utf-8?B?WVdhR0VDN1Y1SEhKRU8yazc1REg4V0p5aStXNThZeVExMklKNENwRVZ3WENS?=
 =?utf-8?B?Z3NOMTVueENuUzV0bDR2NTM5b0c0QWhyK0NiMkkvQmtJamE1cnBHbS8yYW9E?=
 =?utf-8?B?MGVjZktGTWRjWDd4N0xwemNraHlBSXV5clJzWXJoVCtWY0VyNkduWW1ncmI4?=
 =?utf-8?B?SzRGMjNXQmhoZEpkRWZ3Y1YzcWpDU2tEc2IycDdtdGF4UVpsZlhTZjFxaEZT?=
 =?utf-8?B?V2FDU1ViQ0Z5aGhGTHlEM05yc3ZLb1dsOGFLblBhZ2hxRHIxSFRiZ0J6TDN3?=
 =?utf-8?B?dVJydmdzNTFFekZnaFhldTZOa3BVWnAva1p5UHp1bWZGL0MraDZFM3BCR3pz?=
 =?utf-8?B?RDB6WjAzVlovOUM2ZWNGdGhXRmxUQ2pJOEdlTjF0eWFucmV0YlkxYy9wQmdF?=
 =?utf-8?B?dk05cnZialg1amlKYVRKckJjMWZrSmIza1Bsdll1cUk0cDhxWVhxVEFENlhs?=
 =?utf-8?B?NDYyeW5zeTJQZ1pkQ054V1Y0TEc5am1oTHJPRlV2L1hsV1ZxM2p3MTlTMW1t?=
 =?utf-8?B?TVlNdDFqUnB5R0VGOGpuTWNyN2hQdkllTFNlNUs5SDVldlZEZUMvWnowU0du?=
 =?utf-8?B?K1g2bnp6eENZWis3MHZkUHRGL2t6RlVmUTlzemllajNDYmxVdUcwOGczSjV4?=
 =?utf-8?B?MVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b076912-37c3-4f3d-3ceb-08de33648174
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 18:39:49.6242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTzzQuyUL7RLdSDukPX8zrfFFnQQVWIi8zaM0CR8JTA2RdTDUmukQF5vO2aECioc3OgBagqanX0y4XiF8BOoBUw8XjyQ14LvXqr/WVg1axs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8794



On 02.12.25 21:26, Jason Andryuk wrote:
> On 2025-11-19 14:30, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Factor out COMPAT HVM code under ifdefs in preparation for making HVM
>> COMPAT code optional.
>>
>> - hypercall-defs.c updated to always provide compat declaration for:
>> physdev_op, grant_table_op, grant_table_op. This reduces number of COMPAT
>> ifdefs in HVM code and lets compiler DCE do the job.
>>
>> - Only 64-bit shinfo is supported with COMPAT=n, so struct
>> arch_domain->has_32bit_shinfo field is moved under COMPAT ifdef and
>> has_32bit_shinfo() is updated to account for COMPAT=n.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
>> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
>> index 5df8c7825333..0005f4450931 100644
>> --- a/xen/arch/x86/include/asm/domain.h
>> +++ b/xen/arch/x86/include/asm/domain.h
>> @@ -12,8 +12,11 @@
>>   #include <public/vcpu.h>
>>   #include <public/hvm/hvm_info_table.h>
>> -#define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
>> -
>> +#ifdef CONFIG_COMPAT
>> +#define has_32bit_shinfo(d) ((d)->arch.has_32bit_shinfo)
>> +#else
>> +#define has_32bit_shinfo(d) ((void)(d), false)
> 
> (void)(d) is to avoid an any potential unreferenced 'd' messages?

It's a generic request to have macro arguments evaluated consistently.

> 
> Just using false builds for me, but your way is a little more robust.
> 
>> +#endif
>>   /*
>>    * Set to true if either the global vector-type callback or per-vCPU
>>    * LAPIC vectors are used. Assume all vCPUs will use
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Regards,
> Jason

-- 
Best regards,
-grygorii


