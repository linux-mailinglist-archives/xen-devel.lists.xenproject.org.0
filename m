Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611ACCAFF6D
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 13:45:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181600.1504625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSx5P-0002au-NN; Tue, 09 Dec 2025 12:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181600.1504625; Tue, 09 Dec 2025 12:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSx5P-0002YD-Jt; Tue, 09 Dec 2025 12:44:59 +0000
Received: by outflank-mailman (input) for mailman id 1181600;
 Tue, 09 Dec 2025 12:44:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nu2q=6P=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vSx5N-0002Y7-Lt
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 12:44:57 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd491253-d4fc-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 13:44:56 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CY3PR03MB8151.namprd03.prod.outlook.com (2603:10b6:930:101::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 12:44:52 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 12:44:52 +0000
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
X-Inumbo-ID: dd491253-d4fc-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOg91Sk7VxX0IiXHvSJlA9iOJ+IsbtnSC1abftlkkc8cILN43yeFE7Wcvw4xeIMAlfL4X4297Ms4w56GppYYV8IUdrmYbYD9VFN8Q71ldkezwjTc3JGaVji6YCXrox0QeiSfELfjyTLNbJbfkwTdFubgYyAQN/axEL9yOHh92HdA9bLaPwIC0FVt0bKjOfbVM59KUVHGESnfJEf4BVNfzp/7Zw6HZb81s5Qc3c1CnxeSkQsCwg6F8wywk3qt4DyqMvtMWO7dQCypazOhMqxlWVW7vWQWjU2vCA7to5DCQCR/tt+ML5qsdYMKH8XGFzNdP1m8jvStcpnLTF+B5ZwoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFqfRDhuOc0G/Ww81q8L6L4R0aCrGmaU+cna8kpDqyA=;
 b=sLISzynRMqKl1D8srLNXzz9IMfjjUQF7I3+kEC1y+cQpH7+GmvNMKKDqbA2W5vLAgL6K34YYeX1NrfDirNl3zOILIT/n3C1NZkFny3bbPov+Kh4JW2ZIndzqTwHQUoN2IowjPyk+4xNZMpi3zEOD4Wxa+HJAUl8u9zn/xXUCAuBAZM0GFqyaT/uFuY6TH/Uoon/0kRHpIEOZtwcx5/+U7gccB1w8Uo8nIEcVKeTav0U7CqJw7Aafj4QxNGLapUNOomj4V8SlRRFb8Y09ZHcJwi8o6JY7jrmbIv+9/E4dam23qaE95G9cTFhKuEvb6TMttmbzjU9b6dsFjE92CvTh/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFqfRDhuOc0G/Ww81q8L6L4R0aCrGmaU+cna8kpDqyA=;
 b=PWEEj7SBlupQF1fnMnfjO85jWpFw+50T+lRjI6vZNAzlX+lxjuHEboD5KSYYRAgJ35CAFMVSQs0i1E+kjbZ4Qh71UR0qpGyRoBibk3VCdvpopBfRHdpd3LkbvTDgpeyK5Rtmkb8wb6IzSKslz/Fa4UnQnjN9O5FnnhF6f7xCXCk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <85cdb866-0be2-4204-b106-f66e2b15f841@citrix.com>
Date: Tue, 9 Dec 2025 12:44:49 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 3/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
 <20251128152218.3886583-4-grygorii_strashko@epam.com>
 <c9ee4fc8-44c6-43e8-88eb-9041c51aed16@suse.com>
 <d025e3dd-ba2a-4a9d-af37-37570e690aee@epam.com>
 <a3dcfce1-4695-4064-a1e3-af09bfa04199@suse.com>
 <f0da7ce3-1846-4865-8e66-bc3e50f78390@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <f0da7ce3-1846-4865-8e66-bc3e50f78390@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0359.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CY3PR03MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: b741c25e-4535-4222-d900-08de3720bf9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dCtETlJvcVQvRDV3Y21zVkhEN1dlK3pOQWJudVhSUjdjQVJQYVkvc3EvOUIx?=
 =?utf-8?B?dWlnVXhsdksvVUI1Ym5vNzJZZHZsc2F0UUpQUXMvRzNzSGZLWjB0aEJPT3Ru?=
 =?utf-8?B?UTlXMW96R0xCemFSTEJHLzkyd2s4cmNlVG5XMWtxc2JRa0Y4cWZENTd3eEJP?=
 =?utf-8?B?R0JYREVHaytQNytoZHEzUllnWFZyMkdrNkwyU1piVzNpekptQmZvbTkxcE45?=
 =?utf-8?B?QjZqZjJtejcyYmh6U0tYN0l2V20wVk5Gb0k2eDQzU2E2K2pWemFKVFVNaVc2?=
 =?utf-8?B?VzJBUlc2K1BqWlNyYkIxSVRkdXVSVEYxdHh6dkdXNWlJK0o3dWIvajZ1NGgr?=
 =?utf-8?B?bnpLUEp2QUE3eDNWVXIrV3pmTmh6NE1uMzlzWStqWnN0R2QvVXV1eW1DZndI?=
 =?utf-8?B?RnNyNTBnOHIzM2dMUXFCR3h0ZmUvU2RQQjZ0bi9OUHREK3Vxc1hkVmdxT2tx?=
 =?utf-8?B?Z3JHTlhidmJuaEV1enpwVE16YjgvbU5seitQVlEyMjlEOWhDOTdUTmRDWE84?=
 =?utf-8?B?NTE0RlNCSHIxbmh1dWpaVGsyWDZlQ29QdHdLOXBPWDh4MjVUZWNRVDg1RnlS?=
 =?utf-8?B?UWNPRFdWZEVYRXJzVTRQOVB0NDdJbno4OEFxK2ZBU3o1MmFSVnBEM0h3aGh5?=
 =?utf-8?B?eGFXRmMva0tCNWFiaGtyWERQTDMyV29BZnFRM2tXdWRlTXF5d3dOY3phMGM1?=
 =?utf-8?B?aEpnNG5MdjhHR0RYRFNKQyt6d3ZPaEkxQW1lajZzbUlvNnlDaUNzQnhCY25m?=
 =?utf-8?B?d2dVNzVBMVNsL2U2MEtpTmUrQmNGOWJWczh2OHEvR2FrSTlFdXBTblcyeEZJ?=
 =?utf-8?B?Q2tISkd1ZGdmSGhDcy8waFAyMW5RRk9YbGU2RnZJN0FoNUJoU1piVkl5Y1Bn?=
 =?utf-8?B?S012bkNIaUNzTmV4YlBTOTVwenlGdFl6NUVHWE9DNnpDYnVwVEkzTHBya1hs?=
 =?utf-8?B?RFVCcWRza2JOcHVrL08yQmN1TWl6TVo2WHpsYVZWY3gyMzZJd3FrRnZyamZR?=
 =?utf-8?B?T3R5czJpS0hJSFFGZEhFbWVEb2pyZVZuZHpvc2dpRU4vUVVnWCtZQzJUOG5K?=
 =?utf-8?B?Q2d2RERxL1A3dFNDV0QyN3M3WFg0MmhjSWIyV0VPYmljODY3bVVYQTZrV21t?=
 =?utf-8?B?eDMxR09wTXRPQjlTeHN0dkJRblhnaFp1a0Y3VGoycUl4TTBEc3pCaGlzUkJC?=
 =?utf-8?B?Qml5MnNsZ01SdVZ5aHF1ZTZ1Ky9RMXBPenVoYUJSOEViUE1pdld5UzBmZEJ5?=
 =?utf-8?B?d3U2c0t1U0pCUVc5dGwyaHZLQTdZWWlJTGVSUVBlVDNuZHN3TFFBRm81RThi?=
 =?utf-8?B?c2dwL0cvdmhaSTZpbWx4d09rYVNkNm1taTlJRzFIUkh6THNtNkJKWUZsVW5v?=
 =?utf-8?B?cXhYTkJWaUQzY3JjVTlvdktNcVdJSm1WWmJoVW5mNUtRaE9BOVRmTms3RzJk?=
 =?utf-8?B?K3IwcmVCLysvai9wR3Z5MGlNbkVyNjVod3NETjd3Uk1hZjl3TXExQ0FvNkdH?=
 =?utf-8?B?a3Y3MFpLQW0xL2dsT2dPRy9rTHNKaXFJVVp6SUYxdk1QZXhQWnBLbktLMFF0?=
 =?utf-8?B?SUZGOHpOTFlSYlVrK25lOXZQaWdUZ29PeHE1SXg0UnhGOWlwYWdmbnFjV09G?=
 =?utf-8?B?SFE4d3g2elZxM2R0Z3krUHVvVDBtbzRSbFVMRU1qbktUSytJSHJQa1FSMldY?=
 =?utf-8?B?TjQ2SzN5R0NjeWNFb2ZiTmR1NDVkd0plbGlvaHV5MUJncFd6ZG5xYWpCN1N2?=
 =?utf-8?B?UWpCMWpqd1VqTVNwajJ4bGJoeFRFd3psS3BYOVBtc1RjdUF2Q3dKWGhveWtp?=
 =?utf-8?B?REI1VlJXV1dGYTg0MzA0eGR5d2pTNzl5RjhkTXhLZGlkdlhNbk5CSWhBV3Bv?=
 =?utf-8?B?ZjZrd2lMYkxJckFJN3NiaU5GRmVsY0V0WlNlOEhXN2o0aTl3am9ZTzdSa0ZL?=
 =?utf-8?Q?aztcpakyhF3AZ3rr5mO4HIjtzUvtm/a4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTJkUExKUE5hZExjSGc0dHNRcGZJOWlQc3NpQ3RHQTh0dHkwYlVIWm5HVEw1?=
 =?utf-8?B?dHRFQytVTEN5WGlieHRBQ0lxZmxlc01ZTHdRai9nVmt5Q3FyMTBhNUF3MlVN?=
 =?utf-8?B?MUdJczhDMXUrd1NLeWFuNlg0Q0kxaTM5dEt0Ymsya2FPOE1SSXRoZUFwYmNj?=
 =?utf-8?B?ZWs0Z0FCcHlHajFDZUF1T0tKK3NXOHk3c3RiRHlxNFlETFNEb1FwL1F4T2JJ?=
 =?utf-8?B?ZU55cFBMejNlVFJTWUJ0SDhTdHpwU1FJb2I1SXBLVmVoWDNNdFQyV2dKUVFk?=
 =?utf-8?B?L2dGd1RPSGVnKzZnbnUzNktNU2ZkVW1ROEtHWFdrelhHU0I0cXIzMlI2OERh?=
 =?utf-8?B?R2xIZ2tJRnFJMjdZcjJicld0UjRPK25kOGRVdzk4dWViQUxLeS9CNlhNRzl4?=
 =?utf-8?B?RVhyMlh4eVp6VlVTY1NJc3o1NC9MVmRIb3NZTTdOTHQ3ZXNUY05YTjVoakhk?=
 =?utf-8?B?SWZCbzlqY1ZabDlMVmhpOGdUcVJIWlkzU01iYVJURFc3YkE3TFF6RE5NQ2gx?=
 =?utf-8?B?dStkdDVKeU51clp3bEM4emNUazNOZGlFRXRpdldnY2dDZk5xR24rMWppV0li?=
 =?utf-8?B?ZmRWejljRzJYQW1LREQrR1BzMlBBYzR0Qit6UFhobDAybEl0UlA3d3ZqbmRw?=
 =?utf-8?B?dC9kcHN2dFhJZDhzYkVvdmpLN2xYKzZ0b1lVMkhIL01iSlRjZzZIUWNuWFBy?=
 =?utf-8?B?aUR6aDN6eXFtaEtubysxcDJ1OUgwd2dWSXROUm8xWDhHU1RBNkxOL01ibnhT?=
 =?utf-8?B?RWVQK1NDYlhEcWpGeTE5aUlsYWVaQmFNMG9PbnJES2x4WHNXTDdNa2JiQ2VR?=
 =?utf-8?B?T2J0b3RmbHBNWEpHZ0NHQTkrUmhQalJ3SlJ5cWdubjU0UGsvbkc5VTBsV0d1?=
 =?utf-8?B?b2FkT2plYXl5WXVWU0xkUHA4T0UwZmlYOFhtSUFsTDFyc1JHRkNrWWlMQXpu?=
 =?utf-8?B?NHowbGhJdUZHQktwSU9GSkRLbDhxYmZOOFdmZVZJWkZlbERLZWJMV3VwR2FH?=
 =?utf-8?B?T0hoQlpTby96VjFnamZSbG5EUkltWGlTRUZET2V5M2d3RzBLV28xME1KTnBE?=
 =?utf-8?B?eW5UZTFLaTdiWTc3emVobVRGRzFEU1BIMEFEL1ZWZ0lseWE5S1l5bDhpcGp6?=
 =?utf-8?B?dDFkRVBMWVFXb1F3WjNoYUtCV2VKWm50SUFVTXZmWDRpQ3FiMzA4bi83clBm?=
 =?utf-8?B?ZXI0MzdWVEdJYUI5dEo3dmZkWW9vVTVVS3ExdnFwdi9IWkgxM2tJSVFGdHRn?=
 =?utf-8?B?c3B1NThvR2ZRWmdJRTR2eks3UFhCc2l6WUdnZWR5bFB0ZGtkQzlsYyt5Ukti?=
 =?utf-8?B?RzhOT0ZsMXlDclBDcG1BOFZyc0pINUNWQVVYdG8zcGgzOVVWVmN4clJ4bkFx?=
 =?utf-8?B?TWw1TGY4SVFFNytla25mdi83eXYvbng3MCtiTk1EaVJvUmxzSVlsOWdHT2g5?=
 =?utf-8?B?TEJBSThCUGNhV1NkckxxQVoxMThwYXE5OU4reHY3czdKOFlsaGoxMTIxWWg2?=
 =?utf-8?B?a21MZ0c1T3ZTWldxcURlcGpXdndkRFZoRnkwKyt5ZXM1dzdZWXVvR3l0S3RB?=
 =?utf-8?B?NmcxRjZBd2Nxek1KaExVTUE4THJoVUhaOU01WmRSeDFjdVEzSFJYRWZ4ZXVQ?=
 =?utf-8?B?RTN5WEc4QSt3ME85RVhYTjlMVkhzb1BrVXM1ckMwLzNHNkM2elZRMkNwSGVr?=
 =?utf-8?B?Y0ZaK2RjMTJMdW92dkVyR1c4R1M3aU5LbWxQNXovK1Z4OUNnN1gyU0cxUm5N?=
 =?utf-8?B?NFNQSjVoU0lYMkYvSDFrR295Nk5wNFJJNWQ3SlpqWFVVQVIrVjFTc094NXNO?=
 =?utf-8?B?S2tvWFlRc21taHhKaDd5YkVzQVBHQWVyV0xnNHk4Ujl1OE9rZ29UUW1pd1Vi?=
 =?utf-8?B?bDhJK2Y0MjFiL1V3OHlCblJINEE3OXZPc0liS1NmUHlmRGVlY21Od3BER1Bn?=
 =?utf-8?B?U3cvV1BNL0dHNWt6OG9sekdJdk1lalhqbFlieU13VEgzcnZUYzJFNWo2ak9B?=
 =?utf-8?B?REl0U3IzTnVuNnhSQTdQQW5lcTVvby85ckJ0L3RJUE9Rc3loQkhubTZCRVVs?=
 =?utf-8?B?QzVJalgxVEZFZzBML2lVTXlNZUo4WDRVMnRxUzN6VzZYL3NoekYxdjJlMGdX?=
 =?utf-8?B?ZlZ4M01LV083aUVFbzBydUMzZHMrRy9jVFNob0M3dEFFSHo5MnJMbGJLZE5n?=
 =?utf-8?B?ckE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b741c25e-4535-4222-d900-08de3720bf9d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:44:52.7949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWo3ZMBK+wFgksbUwe0kLonxEsJJQKNe6z1BJGoIdhwtZx2qafp4dsnc46fZCEIOFnkZuQzdKLeUIO1WIwvAiyEg4fQLGg/9AlBK4OJxUq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR03MB8151

On 09/12/2025 12:24 pm, Grygorii Strashko wrote:
>
>
> On 09.12.25 10:59, Jan Beulich wrote:
>> On 08.12.2025 20:21, Grygorii Strashko wrote:
>>> On 08.12.25 14:44, Jan Beulich wrote:
>>>> On 28.11.2025 16:22, Grygorii Strashko wrote:
>>>>> --- a/xen/arch/x86/pv/domain.c
>>>>> +++ b/xen/arch/x86/pv/domain.c
>>>>> @@ -254,7 +254,11 @@ int switch_compat(struct domain *d)
>>>>>                goto undo_and_fail;
>>>>>        }
>>>>>    -    domain_set_alloc_bitsize(d);
>>>>> +    if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page )
>>>>
>>>> You mention the change in condition in the revlog (but not in the
>>>> description),
>>>
>>> The updated chunk was based on snippet from Andrew [1], which
>>> used incorrect condition - I've changed it and noted in change log
>>>
>>> [1] https://patchwork.kernel.org/comment/26680551/
>>>
>>>> and I'm having trouble to follow why ...
>>>>
>>>>> --- a/xen/arch/x86/x86_64/mm.c
>>>>> +++ b/xen/arch/x86/x86_64/mm.c
>>>>> @@ -1119,26 +1119,6 @@ unmap:
>>>>>        return ret;
>>>>>    }
>>>>>    -void domain_set_alloc_bitsize(struct domain *d)
>>>>> -{
>>>
>>> The domain_set_alloc_bitsize() inlined in  switch_compat() and x86
>>> PV domain
>>> always created as 64bit domain.
>>>
>>> At the beginning of switch_compat() there is:
>>>
>>>    ( is_pv_32bit_domain(d) )
>>>           return 0;
>>> [2]
>>> above ensures that switch_compat() can be actually called only once
>>> (at least it can reach
>>> point [2] only once, because there is no way to reset PV domain
>>> state 32bit->64bit
>>>
>>> this is original condition which says:
>>>>> -    if ( !is_pv_32bit_domain(d) ||
>>>
>>> do nothing if !is_pv_32bit_domain(d)
>>>    - for inlined code is_pv_32bit_domain(d) == true, so
>>> is_pv_32bit_domain(d) can be ignored
>>>
>>>>> -         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page) ||
>>>
>>> do nothing if (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page)
>>>     - inlinded code should proceed if this condition is opposite
>>>       (MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page)
>>>
>>>>> -         d->arch.physaddr_bitsize > 0 )
>>>
>>> do nothing if d->arch.physaddr_bitsize > 0 (already set)
>>>     - inlined code will be executed only once, so
>>> (d->arch.physaddr_bitsize ==/!= 0)
>>>       can be ignored
>>
>> This is the crucial point: It being executed only once isn't spelled out
>> anywhere in the description, and it's not entirely obvious why that
>> would
>> be. Yes, nowadays it is. Originally (iirc) one could switch the guest
>> back
>> to 64-bit mode, then again to 32-bit.

I changed it in 02e78311cdc6

>
> I'll update description.
>
> Or can add it back as !d->arch.physaddr_bitsize to be safe and avoid
> confusions?

Please update the description.  The function really is singleshot now.

I'd expect MC/DC coverage to complain at leaving the conditional in
place, not that this particular codepath is going to be on the top of
the list for coverage.

>
>>
>>>> ... this 3rd part is going away.
>>>
>>> Another observation: MACH2PHYS_COMPAT_NR_ENTRIES(d) is looks like a
>>> const, as
>>> (d)->arch.hv_compat_vstart is always 0.
>>>
>>> grep -rw hv_compat_vstart ./*
>>> ./arch/x86/include/asm/config.h:#define
>>> HYPERVISOR_COMPAT_VIRT_START(d) ((d)->arch.hv_compat_vstart)
>>> ./arch/x86/include/asm/domain.h:    unsigned int hv_compat_vstart;
>>
>> This observation isn't directly related here, is it?
>
> Yep. Just found it while investigated.
>

Don't be deceived by that.  pv's dom0_construct() has

    HYPERVISOR_COMPAT_VIRT_START(d) =
        max_t(unsigned int, m2p_compat_vstart, value);

which hides the write.  I've been meaning to fix this for ages.

In fact, I could also submit the inlining of domain_set_alloc_bitsize()
too with relevant history if you'd prefer.

~Andrew

