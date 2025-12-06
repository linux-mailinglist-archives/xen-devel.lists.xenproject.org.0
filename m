Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165CCAA868
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 15:21:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179867.1503256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRtAU-00081F-C9; Sat, 06 Dec 2025 14:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179867.1503256; Sat, 06 Dec 2025 14:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRtAU-0007y8-96; Sat, 06 Dec 2025 14:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1179867;
 Sat, 06 Dec 2025 14:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/WZp=6M=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRtAS-0007y2-A1
 for xen-devel@lists.xenproject.org; Sat, 06 Dec 2025 14:21:48 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4f70cc9-d2ae-11f0-9d1b-b5c5bf9af7f9;
 Sat, 06 Dec 2025 15:21:47 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5714.namprd03.prod.outlook.com (2603:10b6:303:98::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Sat, 6 Dec
 2025 14:21:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.012; Sat, 6 Dec 2025
 14:21:41 +0000
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
X-Inumbo-ID: e4f70cc9-d2ae-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NE1Coh0NcybyPyhPPm+8KfChtP1Mgk4KKz1I2VKwO9rX9hqK/QGaca1zxRSdOAWjFeSMSw82ZmoP1vDCqJ+qp75jvQ0CEisA77kSEI2uYKBnHiCw8m4ql/kN/cJMZyCNcKmjCq3x1xQe+zyf+Yw9KoWsvi9gumP57Sh33zodXTZaJnmUCc5kJIDFapgNyNIkaPcbVU9uZvbTWpAjY0shIB5raVvXFY0HDor+2VhpahqdKxLAbXuyAUeeFKtkEAwMHYLy/wBnv5R32/eB8NgnQdcBncrMc64As/goONBBNMrrf8L4QcSLiBKKMVKUnNF7m15A+0YOr4k63JohNc40Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZGVFGrWWegqp3s/TG4ovmtopViFN6UspfIzqxc4R/0=;
 b=b0/DYVSPCepxBDDYuhU6s5B/+8biZds21etCPMErelc7ySxk/aowf93VHB4ENi1fJxsz0OfmGHyvUwAKj9727oNFWIGcoWOdiU6lw7unX7AJxHM4n1w55Ce9jloa7Faq+ghAVvfBf3hgw+lA8aY8ogrLEifZ6dQJihgjN4j0B6PVeE9L9KXmQpBjrUA7T9eV17FpzDyt8ICw92MtYTxfA6kd6NfGmumZfJKpOeE3c4UUIH/mjFtMsxQwma0Lu/7ZBFOQTG8Q5hHI5nMakL4bDFbDHrkzXDxOb/umyw4EQVaQmcpofEr8O4B4JKDH8SQ8qOa7oPjFfDYjKhbN9+Shog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZGVFGrWWegqp3s/TG4ovmtopViFN6UspfIzqxc4R/0=;
 b=fsaxeKOP0gM3J8aX7tnOamoEr9eIj1LML23XeLWTKl3wOwADieITK3a+4VNxTsVdiMrjU0LIwdeWGGAuVunYSymUZFHEf5OWeirrHFMOna16uLcqm00Cwm7rMwa7qpHCXgX6uouAC2yTj5uypQJXc7OUTmLvkJ0Zn2h1c64NSzg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f6cccd82-3112-4696-850a-119843fca5ec@citrix.com>
Date: Sat, 6 Dec 2025 14:21:37 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>
Subject: Re: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251205193411.1368659-1-grygorii_strashko@epam.com>
 <d9a632d1-8587-45bb-bc13-8dab8d346cb2@citrix.com>
 <4fc76270-98e6-46c4-a6a4-d73772e079c9@epam.com>
 <483d50d9-a076-4698-bd14-28afabd5d369@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <483d50d9-a076-4698-bd14-28afabd5d369@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0108.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::23) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c3d972c-974c-426c-8af6-08de34d2c6c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnFsVTdmSXFld3M0dmZsbTNSR0NaMHY2T3QzN2R1WURRS0NNR1ZLNkZuRDY0?=
 =?utf-8?B?THJnRlk3WTB6eEE5S29VbUtZc0pHZEhOTkJpTndGRUs1YSs1S1FQYXVSbXgv?=
 =?utf-8?B?SWNCWVFGQUhlak5FTDlYY2wvNGtuNkRJaWZoRG5FOGkrcmdFWnQwYkJ5RXZi?=
 =?utf-8?B?WEVFYUJHSWIvMTB5WmhiSHhueEw4RHI3aXlDOXFkK1dHMkp3NnZMUFA1Q0tQ?=
 =?utf-8?B?RklMTmZUbVlwUGpha21nbElQMGtDcHNadFdzU3hUalpDZ2xoUW9yaDZZTEVK?=
 =?utf-8?B?Y0ZDU2tVVXBjbUU1SmVsSmI4R1huYkorYmdxS1R4NUhrWkQ2QWtpVlRsRUY4?=
 =?utf-8?B?aFhWc2wrZU0zdjlXdzl6R3Z4ZzYzc2QwNXJRbFB6cjhhT1docENTbWlFRHE3?=
 =?utf-8?B?R3RHWnh3c3RTb29jbHFyM3ZxODE1ZUtsN1N1RWNGUHJXbzBJT0FJL1RlYkE0?=
 =?utf-8?B?eHJMUEVML21pb1J5WlpuVTI1R1E3cHI0SklsTTdiY0ZZSUh4ckpWa3VYYjZH?=
 =?utf-8?B?TTY0YXNjbGh5VnJvVjYwdG9CZFJvOUxsYmVKd3dENXp6TVZzYTAwRlZMVyt0?=
 =?utf-8?B?bVIyektQbXg3MlJHQUlPbllYMTFPN3c4Z3JQOEtRVTFuK3hOTUZVTENOcmho?=
 =?utf-8?B?OWo2ZERCa0d4OEppWk1LdncybFowbnVERnhvQUE0aWtmcXBGa0g1d1N1eUJI?=
 =?utf-8?B?em5GUmFVTStHTkJ2TkZQOUVMNzRaeTdmZWllMEZCaUdaT1FTeC9CTndaZVRG?=
 =?utf-8?B?ZllHWmE1K05Tdy93ZTZGa043OFlCOHIrMjE0aElIdzhhN0N2SzZZTmlVcjBV?=
 =?utf-8?B?MzNubzdlUkJoZUtKUDVMNTd0Q25nOCtJd0FxbEFpT1hDZnl5TERqb0kybjZy?=
 =?utf-8?B?N21OQ3lha3ZjSTVUU0Z2L0tyUEJMbXFtMHhmdWZvZ01FQitRNHJSYVNHakNk?=
 =?utf-8?B?UEhTWXhpQkZ5UTh4bFFvMk02eFVoMEg1M3lSd0R1MEFEbkcvOVduSEhrSkZB?=
 =?utf-8?B?clpUQWRlaTdteVJrKytpTzZ6SVVVKzVXMW9YNmpkbWc4c0FmUElyMWoyL1dK?=
 =?utf-8?B?bTdJbm5JWkNHajZMeEV4SnRLc3o3Y2ZsRko2M3hyLzZsR21JSXpIZHRHejhT?=
 =?utf-8?B?d3AwQVdkU25HMlp2SHJpQjk0TXR6NVV3VU5VMjVodFFVTUVzaXUzcHZ0WmxJ?=
 =?utf-8?B?dG14Y04vakxNdVRXSmlDZHhZdDN0ZVpseEJLY0NrOVdLYSthS1JVeXFYV0Nv?=
 =?utf-8?B?RFNRWEtmSFNXZG5wRUhyOWhCNGpTekFhbk5raE9CN1dEVjg1d0lNYkx4OWx5?=
 =?utf-8?B?cFdTTEU0SzdkUzJqTGMyUCtMMFVMRWZ6bGViMVkrRGtNb3JINzF4NnJMTUth?=
 =?utf-8?B?eE9uTFVGUjJhU3IvRjVIYUh1YTFUN2VabEd5UWp0aS9TWXIvQWc1eGFEdm5u?=
 =?utf-8?B?Rm16R2srakFOdHRJL2k0K25uS3J6RENjT0tRYU1hMFEwQlVrM1BpU3lCQ3o2?=
 =?utf-8?B?eEdxYU53TEdoWmk4VHJhM05sNFY5WkZGc2xVcklNTThyYm9uaVEzQnFZcXJa?=
 =?utf-8?B?RllTYWhpWnNiZFJWVlJpV0prbkJqdDNQYVIxb0ZINi92QXExa2NLZnRiRjFH?=
 =?utf-8?B?T05GM1VoNTdLTFhXa1JibFc4dlVSQzI1VjVacjdFWHN4eG03dEZWdEZFQ3pn?=
 =?utf-8?B?S2dUQVlJdGs2TUt5SDVTNWY3TE5rZXVodXpJUlJQNjNIUS9QNjAzSFM2Wkpa?=
 =?utf-8?B?TUFGemoyQktXa1VmQ1JqNThmUS9UN05Ua1NMeTdnM0hGMkpCR2hFaGU2ZWhk?=
 =?utf-8?B?REkybHhlZndRcmNLOG1xOTVRUUlRRjBQd3Fxd2RQV3dXSUwyM2k4ZUlDY08z?=
 =?utf-8?B?Yks3b2hsZXlaNWlUT2JtMGVzVEdvQTBsd2cyTU1xN1l2Z3pGTzlvTFY5YXFY?=
 =?utf-8?Q?x8Tal0suemhq/ZBf0TvR+5WUx5eSu+0d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0pucGVjT0VhWEtVclA5bzY3TnNnT0ZHOGpUdWFqUFYwNDVpejBDQkRVMGRv?=
 =?utf-8?B?ejRjRmJPRzFzSWMzclB2Z0MxejB0eTkzaEwzRHZZdWZySm4xa25Ja3BmQ3ha?=
 =?utf-8?B?ME5QQUhES3BhRVRkZlMxeDhEL2VQRnRCUGMvYlFPWS9wYkcxeC9QaHNsR2hu?=
 =?utf-8?B?elFmd0Q1TlhWb0NVRUxkd2pqQkRFN1IzQUFXbFdsRFNEMXNMMFRaUUJRMGo5?=
 =?utf-8?B?S0VyY29TeGIwaWoyQkYyNTFDTlZyMXNUSlhGdFBwZmp5bGdiT0FPQ3AwTlpa?=
 =?utf-8?B?MW5qc2t5OGRkYWFhcmRPeWpsWjFHdGVDNmttMEJ3bHp1RUs3UVFLZmN4Qm9L?=
 =?utf-8?B?WU5YQ0N6bjV3bk9qWUxZNVlsTExrb1Z6aXBwSWU4OG5GVkpaZGpVNm9yWk9i?=
 =?utf-8?B?YitwUGF6NGozRUxXMlRTVEJpS2RDdzhoc2s5L1dVT1Y3MXdFbjY2eTdFMEhp?=
 =?utf-8?B?eWhNTElJWjlWR1NDZzNaYkZvRFN6cjYrOVpDbjZwQTk4T0xPeWZYK1psU2hW?=
 =?utf-8?B?eW5mNW55WWRkNkZmOFFvdW95TEJaa3dvZ2VRdDNvaTJSWnlmaEIxejRnM0lT?=
 =?utf-8?B?R3JSZlkzODZiM2gxY1k0Z3JiNC92YlZTNURiV3B0bFRCVm51bjJhWExXOEY0?=
 =?utf-8?B?WmFnMml1WldCenJEbUh1TkdjU0N3c0hvaTNRRlRrSkV5NDNmbmdIWGFiVEJ1?=
 =?utf-8?B?QlhpQ3VJVHgxeUJnZFI5WDY2dDBnUTFDWm5xYTF6RTJqKzJXSjVic2NmNkN4?=
 =?utf-8?B?S1pXL0JXNTlvdU5sZU1oNXdOUmQrQnF1NWd0TTdxR0w0UlBFcUJaaTVFd3Np?=
 =?utf-8?B?WE0wOXBhMFFXKzVMZlNMM3U2b2lzQk10TENwNU5kTDRQQ1FkSUp2LytTN2ZD?=
 =?utf-8?B?RThKbk9ic3N1eVJzRVBsQVlCZ1IzSHpUaElWazNsVkVqaEZIMDNUaTN2M3V6?=
 =?utf-8?B?Z3NUaFF1V0IzMEdaMDdKdHFSeWlIYkNKOVJJNkJkbFAxMmNkQlIwZGNyaVNv?=
 =?utf-8?B?UjF4ZkZtZjNYKzl2ZzdBU0phemJqcnNCdVhrak0rRGFFaU5OckZtb2J2T2hV?=
 =?utf-8?B?eGRnc1pVRnFrRDM4YjlHbTZ0QVJ2Y0s5TlFnNUlZVE5IanBHUi9MTThiclc2?=
 =?utf-8?B?MnpuTUJqVDFMZlZqVEdZa3ZkWmRrSisrUkZUWUVyM01JclBDaGVFbjhGYzRD?=
 =?utf-8?B?bnEwM01TKytUTDJ6V1hVc1F1dXI1RnJ1Q2szSzZXZUtUMTNKTzNQOHNVQnY3?=
 =?utf-8?B?YWtPR3hHd2xrOXhEK0JaZVNjVnVlc0JsVE85R3AwelE0Q252aUxZVEUwR0Fj?=
 =?utf-8?B?YW00cjBOVk9CU25GQXovN0FIQjlVd1pqQW1wdHpOSjg2WlNxcFN4anFKc1Fw?=
 =?utf-8?B?TXJSb2NvQnZINjcvcExlc29oL1BZVlRSUDNDUEtFR0FDUVJoWHE3dmtYdURp?=
 =?utf-8?B?YmpxcWF6MjFtcUFtejRIVi9lSzVFYS9zeDFmUEpaWklrRlZyNytjS3lXSTFp?=
 =?utf-8?B?K1ZCZXl4MkJmMDl5aG1MdHdESEN2QVFTT1YzZ1VDc1puZmE0WTBjSHBCelJ0?=
 =?utf-8?B?bHRrRXpmZjlQd1h6NmFzQzBQVFd2bzJQWklwbnFlTWgrRy9idTZ5SWdyRWtY?=
 =?utf-8?B?V2ptOUNNdytEcXUrd3JabWttekJMWVArNHNQaXFjam5taHM4QTJaQlVTWnpm?=
 =?utf-8?B?REkrRUNoVWpSWEE0U1ZvL0NNR2ZmMzJlSzF4RlBsdzV2aG5zS0dIWHFNUGVv?=
 =?utf-8?B?SDhUQk9MTEhBZmptY2RXWUtyK2hucGpnaG5vVzJpUXhra3U4dEdRdlU3VldB?=
 =?utf-8?B?b0JZZFZnUUR4QWtHUjVHRGpMVHhNZ3hickErZ0I0aUdPRlNHUm9HR1pTeHNN?=
 =?utf-8?B?TGdvQk1XT3ArU1NxZlpJYjdGNEVSOVhPQ2JTSzVSYk5kSzV6UUhKTUpIY0Ez?=
 =?utf-8?B?ZWlRMmV0VU01SjBiZmZ5WU9BZXVpSEs4c3hJVjQwZGVOR1lqOHZpVzkxajIv?=
 =?utf-8?B?UHMwc2FUaExVdlpZMW0xZ3R2Z3ZmaVdOV1J2UGpUbHlVTDVMMG1Rd2RHNG5W?=
 =?utf-8?B?YmFWdnFsa0IzNWE2cG9CdEFWbVIrVk5FOEVaWkt5Tkk2RUU0eTF1aFZBbWk5?=
 =?utf-8?B?RXNFR3c4UFdYNDRDS0xROWxrS29JR3FqMTJhMDRyblZqU24wM3BXWDY0TDlH?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3d972c-974c-426c-8af6-08de34d2c6c6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 14:21:41.8920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0G/k4UICYx4qRArbdQv4r65fQkN8uWvw95mCnCmJeejLJjuP1jxpIacad3byoUnY22/zA0Fs3wEP8Ew6RceRDIChAarOXgToPUgO3+bXbeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5714

On 06/12/2025 2:15 pm, Andrew Cooper wrote:
> On 06/12/2025 9:10 am, Grygorii Strashko wrote:
>>
>> On 05.12.25 22:00, Andrew Cooper wrote:
>>> On 05/12/2025 7:34 pm, Grygorii Strashko wrote:
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> Extend coverage support on .init and lib code.
>>>> Add two hidden Kconfig options:
>>>> - RELAX_INIT_CHECK "Relax strict check for .init sections only in
>>>> %.init.o
>>>> files"
>>>> - DO_NOT_FREE_INIT_MEMORY "Prevent freeing of .init sections at the
>>>> end of
>>>> Xen boot."
>>>>
>>>> Both selected selected when COVERAGE=y, as getting coverage report for
>>>> ".init" code is required:
>>>> - to bypass strict check for .init sections only in %.init.o files;
>>>> - the .init code stay in memory after Xen boot.
>>>>
>>>> RELAX_INIT_CHECK/DO_NOT_FREE_INIT_MEMORY could be used by other debug
>>>> features in the future.
>>>>
>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>> ---
>>>> changes in v2:
>>>>   - add RELAX_INIT_CHECK and DO_NOT_FREE_INIT_MEMORY, those are two
>>>> different things,
>>>>     both potentially reusable
>>>>   - enable coverage for libfdt/libelf always
>>>>   - enable colverage for .init always
>>> This is a lot nicer (i.e. more simple).
>>>
>>> But, I still don't know why we need to avoid freeing init memory to make
>>> this work.  What explodes if we dont?
>>>
>> It will just crash when coverage data is collected.
>>
>> First I made changes in make file to get .init covered
>> then I hit a crash
>> then I checked %.init.o
>> conclusion was obvious.
>>
>> For example:
>> objdump -x bzimage.init.o | grep gcov
>>
>> 0000000000000010 l     O .bss    0000000000000028 __gcov0.bzimage_check
>> 0000000000000040 l     O .bss    0000000000000040
>> __gcov0.bzimage_headroom
>> 0000000000000000 l     O .bss    0000000000000008 __gcov0.output_length
>> 0000000000000080 l     O .bss    0000000000000060 __gcov0.bzimage_parse
>> 0000000000000098 l     O .init.data.rel.local    0000000000000028
>> __gcov_.bzimage_parse
>> 0000000000000070 l     O .init.data.rel.local    0000000000000028
>> __gcov_.bzimage_headroom
>> 0000000000000048 l     O .init.data.rel.local    0000000000000028
>> __gcov_.bzimage_check
>> 0000000000000020 l     O .init.data.rel.local    0000000000000028
>> __gcov_.output_length
>> 0000000000000000         *UND*    0000000000000000 __gcov_init
>> 0000000000000000         *UND*    0000000000000000 __gcov_exit
>> 0000000000000000         *UND*    0000000000000000 __gcov_merge_add
>> 0000000000000008 R_X86_64_PLT32    __gcov_init-0x0000000000000004
>> 0000000000000012 R_X86_64_PLT32    __gcov_exit-0x0000000000000004
>> 0000000000000020 R_X86_64_64       __gcov_merge_add
>>
> Aah, we should exclude the OJBCOPY too.  That's what's moving
> .data.rel.local amongst other sections we target with attributes directly.

we can't target.

~Andrew

