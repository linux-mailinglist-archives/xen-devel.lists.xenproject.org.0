Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5D4CAA345
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 10:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179814.1503234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRoJg-0005q3-HH; Sat, 06 Dec 2025 09:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179814.1503234; Sat, 06 Dec 2025 09:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRoJg-0005oC-E8; Sat, 06 Dec 2025 09:11:00 +0000
Received: by outflank-mailman (input) for mailman id 1179814;
 Sat, 06 Dec 2025 09:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKXd=6M=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vRoJf-0005o6-2S
 for xen-devel@lists.xenproject.org; Sat, 06 Dec 2025 09:10:59 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 775a8054-d283-11f0-980a-7dc792cee155;
 Sat, 06 Dec 2025 10:10:53 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by PA6PR03MB10548.eurprd03.prod.outlook.com (2603:10a6:102:3d9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Sat, 6 Dec
 2025 09:10:50 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9388.011; Sat, 6 Dec 2025
 09:10:50 +0000
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
X-Inumbo-ID: 775a8054-d283-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAIni1LTumLD49AhvXH+8ERxngRs9KbljAzRNz2pkdQoDTN3XtQL3u8Z9u+tcHI0ztmRyceNT+Urp2oEvZHOVZmn/eRK7Y2B9l8u15UVKKAVNFKS+n74eaahNhlEJG6AsWqDQzUnzkf7R1IeNLawO1Is36tYSiwVWSLc6Bp/H5LepsdFy21M7YeJ4eLFucxEEV9ZrM3GDACPBf2vM0ntw6zgWZol8S93Y+4URTUSHhc2gnfYAlQ1NT//FT44dbudLxkghNw6EXREv+a+yZJSiTfAbbB3n2Dcvq3qG1PxU2YPZ4T5Em/YSDj9okbWA+8q76X+SOCnp3gVnt8lneDfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqgLXmt3DXUKtquYLWrQjRySLllKUGthEDIRqk2xpnM=;
 b=NFIccQZ+1qC+zZk3mMykHEA/B75EOYedlsD5r55QsH0NyMaqdi9Ytby8tSScAKalyPHwnV7Vf3iRCyQ8O11jxIPTvJiRTzeqvvMC3qWQOc8cGiTzkcUz8EUrjFw9OV6CVeLAzw3TYKDJ5BTNOqtY8+yFDLPmnkUlPcu/LeVjZ0WTExQHCRLpHv9REasD6rOtFP+Lj9eZzflbjtUGrzfZRgbjR3b0zrh7V1FtS9XTOsTqDNreR2mIMp3IfqoQosjgMeguRDBpdJPL+UxOqre3dQFRly7w36M4ThmMXNjCne8hl9jKXEhbR6kN3aV118dWLQjeG9MviICvs3ld5IlFOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqgLXmt3DXUKtquYLWrQjRySLllKUGthEDIRqk2xpnM=;
 b=hrZxavWlPCxx/YDZwXS31BXR3iRha0X7Yi5XPzBExQpTWTCtbJ63wvyN44KOYmbkRT+qppkXEN88VoHT1nl2cokMWWJJrg9so9N5VU8leimdu01E5BgdlYVmbGcNzu2Ty+6OV3YTb5BEscryw7sRgyRd6uGfVdhMGdnJlW2vcpvwjMydldT9Gx73zE4WW7ktndCs5lZKiXbzLdAizk/JIpwduINUY9qqVIyOa4CYgNxCbiB9Z9VA3lxFnbrY7+WpQnaTBRM+8mnv47MthdTcejUJtwCbSxDbTdhDkDOFj51/DCHsvQSUHXY2eh7eRsZ+vR2PBcroZundXRGvUvHiew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4fc76270-98e6-46c4-a6a4-d73772e079c9@epam.com>
Date: Sat, 6 Dec 2025 11:10:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>
References: <20251205193411.1368659-1-grygorii_strashko@epam.com>
 <d9a632d1-8587-45bb-bc13-8dab8d346cb2@citrix.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <d9a632d1-8587-45bb-bc13-8dab8d346cb2@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|PA6PR03MB10548:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b80ef2-d12f-4026-f49b-08de34a759b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkVySHROa3RoRkJtQm53NzVvM01qQWZTMFRKTkdBeGQwM25JZks2cWFlQmFk?=
 =?utf-8?B?M0tCbFFoQzRBNThvY3A3d0duNzAxMmtVSTE0SWs2Z1k5VUFhaCtQNVl3dTNq?=
 =?utf-8?B?WWFla2FDYm4yMXRWaGI2OEhIN2ppdnY5Q2hlM21PNDk3ZklPalpIUFZwaEZX?=
 =?utf-8?B?WHNobXNjYjBQekNQMzJhZU14YmMzWXo0NlVNanFpdm9KMTkvOUFBUW5UOXJh?=
 =?utf-8?B?enRHREdWNHc0VXJoUXY2WWVGVTBhS3ZTVE5wZmpDNVJHanRrZkNCSkV6dS9a?=
 =?utf-8?B?ajhrZTRlQVVQTG9OeDFZL2t6eFVCczBwSDVqZlVJY0RXWjVFUlcrM1RvRWFB?=
 =?utf-8?B?S1IzOGV4ZiswQ1RhNUlMTDdUZDlERit6VEJ2bjk1OFA0TGdPM05zcWNMU1Vo?=
 =?utf-8?B?cENGWXd5ZVQ1eWFCVXZiQzk1aS94UThRZStNdjlaQXg3SDZCckJTdXpmcmNa?=
 =?utf-8?B?a09wY1RRQkxaYm13a3V0RFloQkhVbWZoYU42Q2F1MFQ5ck83enJNa1lRSHhs?=
 =?utf-8?B?OWdLbzY0b09wWUFaZ1FOVWZHWUhoZ0NTVDE0UTJUcXU0TVhTNlNqZFk4N01V?=
 =?utf-8?B?K2hKYkRjYjlrNU5WWU9QT3FkbDd1RTZTbUY5KzNvQ0l5K3g1UEZHMTdTK1NX?=
 =?utf-8?B?YjVLekozcVQ0eWx3L2ZMQkhyVFBIYWJrTHkvbHNPQnNlekxGNW90Z21za0ZF?=
 =?utf-8?B?Vjk2dWtUL0pud2x3RWxPY1JoL21vY2k2WklXeWRhMWxmNWJWV05RRWZiUHA3?=
 =?utf-8?B?cWdrU1cxOG1hS282M3hBeG94b0VCaklYNDExSXBLNkZzMjNHZUdnREpkL1Jn?=
 =?utf-8?B?eEtreWNyaHBvNkRKeWJtSWFISVB4TW1xdVoxRmh5QzlwK0ZnTzRSY29GSjZq?=
 =?utf-8?B?Q0tobHRxUkdjYU9zQTlzZ1l6NWdmdVF3Vm1uV1pHdTJwUmdkZXlLU1Q3V2N4?=
 =?utf-8?B?Z25EbElKZ3lsRXJaa2EzYTR4bFZDbytRdkMzbzhXZUd1MTZHcHZhQ0UzVVBO?=
 =?utf-8?B?ZnJSazJFZEZScWxiNnRZcG5mVDJRU09ScWxYdGVDUDZ1TEJrQ1pzQXVnWjRp?=
 =?utf-8?B?dTdxUnl0S2hjVHRKWktpbllsa2dac2xmbXZQMkdZYUE1TXQ3ZytqSkprRk4v?=
 =?utf-8?B?dGdhTUtoMWdUN256U2ZodWRaOEhTRCtZOGdvMVFPVjVVbGsreVk1VU93RDdm?=
 =?utf-8?B?aTFaQkorRjUrR01wRGNBd3RXWlY3QVRTcERvMmRZUFpOSlNKZ3BTN3FaanBC?=
 =?utf-8?B?ZFM0K096Q0hvb25seVI0eDZETTNEVm0zNHZTYktoYjZhSTdBQ29jbzErR1hq?=
 =?utf-8?B?NzVsR3VHdTVpdGNaZVMxZlkzTndPYUpFUVYxZFlIeVI4a1J5UGt1VHJmRERs?=
 =?utf-8?B?UzY4QmpIZElCdWY4TnFSbnlYUHhqTnB1dFZxM1lLSTYvYzZDNGI4UWsrMFY0?=
 =?utf-8?B?cHpUc0o3NzdlZzExcU5ISzRkOGV0cWFKM3dpaDU1c1dDUWxlcHA2NjVQUTNC?=
 =?utf-8?B?aFJYbzNvcjdYR0ltbDhhckc5ekViTXlLdTRhaW9DYjZzdTFUVFRsd0ZEZTF0?=
 =?utf-8?B?aVJaRUE4bHZBd3Y1VVE2Z0Z1bklGRVp2b3EvblVNeU5SQU11VGQxMGp2VE94?=
 =?utf-8?B?V3JJSDR5UjJnYU93eWJaYnkxNkdZMmI5ZFg3STVGczJBTXBkZnA4eEJvVWZq?=
 =?utf-8?B?dmlvSUF4Y1lXZ0N5dDNxZUhiYUtHQ0F3cUJzWUNRK2UvdEVXbkhLd3UvZE9Q?=
 =?utf-8?B?bmpyalJFM2lYVmg4YXZtZFRGbkpEeHBWTnJVZmVqV1ByRmRiT2ZMbmxDNWd2?=
 =?utf-8?B?YjdpZ0ZEeVhMZDd4bDhMK2dyaFI1blAyTVQ3Z3dIS1pIN2taS3JtRFJjVFMy?=
 =?utf-8?B?RitZTlpIT21HaHJtazVSemxtMWI4ZnlGbGQ0Um9qVnJmTDEweE5CbC9VdXcz?=
 =?utf-8?Q?+g9j4qvBk3nwh6WG/5xxZErGGIgfHQLj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVFjZjJBTmZNWHA3MGhPZUxTMkM5VEtSRktvbnFxektIOElCTHZFNGcvaldF?=
 =?utf-8?B?OG1OU3VEZnZqcHdqeElzd2hzamNvZkl4aGFGSkRadzBNYjl4REIzUGhRVGZF?=
 =?utf-8?B?T1l0ZC9PenBKc3JHOXd6SkVHL1piVmlsRWZzYzhLNllQNjNyZU10bmgrTDNi?=
 =?utf-8?B?a3lTREdaMGlIaTE4RGRzaEtCYnNDc0JzSFBjREpES3UzR1MwT0dSbGVWaHJr?=
 =?utf-8?B?K0JhZTVPbDBoRldvazZoV2ZnelBOZkx2T2xyekpCT2RHZjRJbldhZ3VrL1ZH?=
 =?utf-8?B?QjZ0TjNoV0VGeHJMMkNHOWQvNG9Wbmc2WHlYdWJBbzdNeW4zNElKYjBRMkIz?=
 =?utf-8?B?Q1d6cHVSb2NiK2RDTUVuVWF0aklPTFJIZ2t0RXF0SnRFZ3JtSlFhTFdJOXB1?=
 =?utf-8?B?dmljak1SRUM4Z3Nid0hHaVdXeGcxaDM1T0lJR2J4RkovWG1rMFhkVEwyUnNJ?=
 =?utf-8?B?WXpQZWF3NU1HbXZCVmdXdkJhdUIyZE9rNEpYQ04xYU1kN1IvRStxMFRUWUhF?=
 =?utf-8?B?YVZCRzU5ZU9vZTV5SkpMdVdYZ2l6QlJMOGpkZGRlcnRUc0cyUW1nL3laa3pm?=
 =?utf-8?B?Nm1IOVMwbkxCOEtGSmVOb0VUVXBYZ3RlajN0UDRROUx6d1lldE5VeGJ4S3NL?=
 =?utf-8?B?MWZCOXhIL1hqbHhsbjlVcG5hUnFaNFJVQ3pJYTRhb0tkODNZWStlUWFscXY0?=
 =?utf-8?B?ekRza3dYc3o3UklEbTU2Tk9OTXJNQkt1S2NxbG5JUVlDbXdnVEpKc3dOSFNO?=
 =?utf-8?B?ZTJlaVYwZVpHOHVYZzNUQmFsWjh6VlgwVE84aFpzbENsYVNiWFN5QzJSQUVL?=
 =?utf-8?B?MXAzT01vdm5Vd3RrQkZicUNBa1JNczVLUmV2RG5QNjlaN21ZOUZJZVQ2ajdG?=
 =?utf-8?B?MUxpQ2NsMU9SOUJRZk5jNFQrUDROaWhCZElMYXY2SmhmWUxkcGJYSHp4SVlx?=
 =?utf-8?B?Q0xJcUd2U0pPUE0rREFDSkhsSlB4WENObkFKV2VtMExNbDJUKzZrWWtTeXc1?=
 =?utf-8?B?dDVWeWdpeWhqYUVTcTZEK1p1MEtMdVI2YjdRMllxZ0VnVjhvajhES1pac2ox?=
 =?utf-8?B?RDgwN0NWVnhucXQzTnljSnlFcTNCcGhKN2k2b1Z5Tit2cG0rYTBrNEZqaGNy?=
 =?utf-8?B?ZkE1SkpjWFZUWmRiNGVFZllkaVhwbWFuRXpzaVM3cmlhMTNPOWJGMlg5dWpF?=
 =?utf-8?B?eFVZaG5RR3NjN0UxdWxROXR5LzBjektYMTA5UmNCODdjZmF3TlpXZFBVd3JK?=
 =?utf-8?B?OWtmUE13RFcwWktYK20rNjVITU5NYnB6QTlJaFRZRk9laUZtd2JyNDczdUkz?=
 =?utf-8?B?cnFRZWc0VDF6RVo5Sm8xZ21GVVlreHU2RXAyTW9KdnRkeGRWMVVsZUhkZTQ2?=
 =?utf-8?B?MS9vS0o2SCtUV0x2eHkxa0NORFFZZWpsQXcxcXNOcTBCM3pjRjQxaCtQR0lW?=
 =?utf-8?B?aTBVQlFaV042a3UrZS9CV1N2NnNnc3NYYXl5Z0tDOU5UT1dGOWNlN09weDFK?=
 =?utf-8?B?eE91KzJLeE40bWxneVZlUUl3alRNMEtyYzlDandNSHdsZmNnWmxMdkdZSm9C?=
 =?utf-8?B?TFlieWErZGhVYUduWi80U0RvRzRoT2d4Rm1PUWFkUDRHQlRnYzJQOEhaVUF4?=
 =?utf-8?B?SC9vU3hYc0xXTU9Mc0dSVlhzSmIwN3REaWtmYzd3akhVVHROR3V2K2c3SW4x?=
 =?utf-8?B?dERNTUVxYXd0cjZWNEdmL3p4MnNPRkhhNTFlR3ZZcmU3ZDUrRUxqOXRIOXY3?=
 =?utf-8?B?N2VXbVJQVDd5YXdvcW9Wa1gvS3dTVFoycExOazh2Y29NOXdET3B1QUVuNWJ5?=
 =?utf-8?B?VnNvaGFMcE90YXg1YmxQNlNYRjd6OXRKekZieDFqZzA1QndUMFUxMldWQ20v?=
 =?utf-8?B?TlZKVDRXd21nZ0JNZVdyRHA4a08vZEFBNS8wQjRmRzBrd0o3cVg2R1o4M3d5?=
 =?utf-8?B?a1NGRVFwdjhZR2R0Y0hHKzJUcW1VT2ZkUDduQ2g1cE9pTHpud1NqNEs4ZEVX?=
 =?utf-8?B?NlcyZHhoZHByMkZvWVBkUlF6T25LNmxBMnBDVUN1bENtNHU0RTNiRkp6REVa?=
 =?utf-8?B?T094Z0JvNDdTajJZS1NGVzIwbEluTThzTWJYNGFGQW92VmovcGw5c2d4ZW8y?=
 =?utf-8?B?ekh5WjNRMU84eDFCL1pDb1JweEVWbmswcGk5ellRNFFUbEh2WFRaTHpzbmhL?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b80ef2-d12f-4026-f49b-08de34a759b6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 09:10:50.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ED6jQ58QqRgBxqzGSpHZ6DGxd9ZLMzMT1gIq/ghu4pOdXHmwSuSWBbjzRLQTjT6mSjB68yDH7P+3EdtWFyO/ZY2ZnwlzqaPAu0JTdRhPMD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10548



On 05.12.25 22:00, Andrew Cooper wrote:
> On 05/12/2025 7:34 pm, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Extend coverage support on .init and lib code.
>> Add two hidden Kconfig options:
>> - RELAX_INIT_CHECK "Relax strict check for .init sections only in %.init.o
>> files"
>> - DO_NOT_FREE_INIT_MEMORY "Prevent freeing of .init sections at the end of
>> Xen boot."
>>
>> Both selected selected when COVERAGE=y, as getting coverage report for
>> ".init" code is required:
>> - to bypass strict check for .init sections only in %.init.o files;
>> - the .init code stay in memory after Xen boot.
>>
>> RELAX_INIT_CHECK/DO_NOT_FREE_INIT_MEMORY could be used by other debug
>> features in the future.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> changes in v2:
>>   - add RELAX_INIT_CHECK and DO_NOT_FREE_INIT_MEMORY, those are two different things,
>>     both potentially reusable
>>   - enable coverage for libfdt/libelf always
>>   - enable colverage for .init always
> 
> This is a lot nicer (i.e. more simple).
> 
> But, I still don't know why we need to avoid freeing init memory to make
> this work.  What explodes if we dont?
> 

It will just crash when coverage data is collected.

First I made changes in make file to get .init covered
then I hit a crash
then I checked %.init.o
conclusion was obvious.

For example:
objdump -x bzimage.init.o | grep gcov

0000000000000010 l     O .bss	0000000000000028 __gcov0.bzimage_check
0000000000000040 l     O .bss	0000000000000040 __gcov0.bzimage_headroom
0000000000000000 l     O .bss	0000000000000008 __gcov0.output_length
0000000000000080 l     O .bss	0000000000000060 __gcov0.bzimage_parse
0000000000000098 l     O .init.data.rel.local	0000000000000028 __gcov_.bzimage_parse
0000000000000070 l     O .init.data.rel.local	0000000000000028 __gcov_.bzimage_headroom
0000000000000048 l     O .init.data.rel.local	0000000000000028 __gcov_.bzimage_check
0000000000000020 l     O .init.data.rel.local	0000000000000028 __gcov_.output_length
0000000000000000         *UND*	0000000000000000 __gcov_init
0000000000000000         *UND*	0000000000000000 __gcov_exit
0000000000000000         *UND*	0000000000000000 __gcov_merge_add
0000000000000008 R_X86_64_PLT32    __gcov_init-0x0000000000000004
0000000000000012 R_X86_64_PLT32    __gcov_exit-0x0000000000000004
0000000000000020 R_X86_64_64       __gcov_merge_add


-- 
Best regards,
-grygorii


