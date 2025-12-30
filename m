Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE20CEA43C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 18:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194389.1512786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vadAN-0004hX-KC; Tue, 30 Dec 2025 17:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194389.1512786; Tue, 30 Dec 2025 17:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vadAN-0004ef-GC; Tue, 30 Dec 2025 17:05:51 +0000
Received: by outflank-mailman (input) for mailman id 1194389;
 Tue, 30 Dec 2025 17:05:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jMxH=7E=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vadAM-0004eX-I0
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 17:05:50 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7ac46f8-e5a1-11f0-9ccf-f158ae23cfc8;
 Tue, 30 Dec 2025 18:05:46 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6392.namprd03.prod.outlook.com (2603:10b6:a03:397::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 17:05:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 17:05:42 +0000
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
X-Inumbo-ID: c7ac46f8-e5a1-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlPqDOZddeqUw7ktnlbv8gMLWK7VprypJvQe7ngFx4JPRoOF1CnybKjcONQsLdworEAwCDErBD37Rz/3d+LZKxboswJ7fnpCYDltlsZMC/+s9a4E57jUidh9WI2x84aWk2GzoKqW4iIpk+xvbtNR4ZqzRmg8gD4gZHUyztLuNgUuURlDxErySNg8Qwv3jXeOZBLOxzEwVTTC6Uqlnu+tgBX5lSslrDIrgraC4epBAAZGFn1q8ZPuXZQ6RTJA/5maDqKCaHMI4IFMENJJq5Pv0jmW69WH/39S1pilZ/alyi6nWMGVQhoNBrmbYbbtaYjYj2RXNcRdDZhIDh/d1ZPqCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q63IqMXSNUUEhyRsssGKpy01kGGBkJUz6SDQk1wca1k=;
 b=wZg0TKWKdrC5JIuqtdVKqmOkiJgnrbKvWCxLMAJMbNCVHBwhCYG/555OTjD/2hlCGmrBj+B9FQYMTlFawArPA8KNIp7Wagzr/o8JiwwsD2ERVnV0NEBVzjqFUdOnDQmSqzmwcioyW51fp37FU2om/jr2Kn4k9c7SLlamtTbfucfo9Btku8Dx06cg5bZB6QrFqtGAGdXZGlXezUrwu2mkeVLoxmJ8JVAWNe7rz3aVD3Rync9eluwwPkrrBqpfSAM0vvNw5uGJydmlyWLqoEG/nnqCcjX2w6mFEDmyUJjP4i13eWx1T1KHoVz52sehw6SCjqfSI3MnNkjHVTCZDk8XiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q63IqMXSNUUEhyRsssGKpy01kGGBkJUz6SDQk1wca1k=;
 b=FD/fzwSreB+5ZAvft418+7JkL+ICSqUreKc7xdjYNtULTtiD6emnio5U5u7m/sDjfZRzvbprmuhV31xm0o01Y8Sx1E+tL+ve9k/9pSofZ30snOvv6NOq3ssGkB1XOUNCIYqtuWuWN1qH28Wgg61ReZcH/fw5X6XuyM3sJBBfdP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <191589a4-cb8c-4e92-866e-03d9a194db5f@citrix.com>
Date: Tue, 30 Dec 2025 17:05:38 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Misra R17.1 in Xen
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6392:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d24537-ea19-44c7-4b0c-08de47c5a9e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2hnTHlhVDdtTkZvV205SkhNNmRMNS9SK1dodDk3WnNrSjB1c2lUOFF5bTRw?=
 =?utf-8?B?L0dFSHJOV0x1TGFKaWdOeTdMVHE1d3I5T1JyZXNmaElLNEJROXlFLzBFRXlT?=
 =?utf-8?B?N0djL2dOWDBsSDEwNTJTZHpqQzFyRlNFaW5OMzlBVGNJbEJ4dWRWS1Z3TGNH?=
 =?utf-8?B?M3BMN0hLOUoybzFSNWJ5a0RvazFiMk4rSjhacC9Uck9ON091WEpkZzFjUEdr?=
 =?utf-8?B?VjJmQXVtMGhXODVQRXVvMm5QME5nMnMwWFpXWWxGc3d6Q2hrdDZhckRyWFEv?=
 =?utf-8?B?dXhvbmRidTgxcUc2SEQ4b2JZNUt2UnN3RjBUd2IrU1hxVXZ1Yno3OVRXeHh2?=
 =?utf-8?B?NHZBM2xSU3V4eFAwQ0ZuN1VDb0VGNmRKNzdwMWZxcTJPTHloVkNReWgrTGsw?=
 =?utf-8?B?TExUbVNjTC9GaE80T2hpYWRIcVdxaVRIa0ZhNlA0eUdHbTR5K25BUzIvdFdv?=
 =?utf-8?B?MnF2N1UrRml3aFJrRjl6WGxCa0UwYkZIbEpsczhmV09YNjloVnJBVTRGaTdh?=
 =?utf-8?B?SDdCOTlEaEZnT21iaFBFMEFuT2NhdllWMmhsM2djRC8vT0plb1V5U0RTOVZq?=
 =?utf-8?B?UVZyQ1pOMEFQTjF1NmxGcmVuY3pHMDlYT2ZvdWJ6RWt1MGh2U1VUUllseWpB?=
 =?utf-8?B?bzg1NVFlWXJUSnF0bVpHaGJqSzkwYUNqcGw3ZEVIb29sVkJZUE5UMENkNEw0?=
 =?utf-8?B?aDlYMTNsS0Vrbkl2dmttNmpnV1pENmpneExJQnUvdHNiYktPSlZrTW8yTWxB?=
 =?utf-8?B?cS9DbHdrT25oVDJvT1U1M3ZySmRVRTgyVC9kNEZVc3pRTlVGN1BnWnhDdXBl?=
 =?utf-8?B?RE1ONXRRRnRNTm5tdWgwTnpqMUJBZ21JcThDNzZ0OTBKUXM4NnFkYXUyUGJt?=
 =?utf-8?B?dHc5SThuY3hOaS9XM1hyMFZ4SlYxVFBEZC9QOC93UmZWSk1USnN6ekV3MjUz?=
 =?utf-8?B?L0N1cTNQVGVsUE5hYnN3L2lrWGlYTXRwRHRvaGR3M0ErczkrcEZjdzlnM1hZ?=
 =?utf-8?B?NXBvNk1zSyt0QnhUR2g4T216ZzRpQ3NFMjBzRDhKVzdSa2ZmOXdXRXpGYTlx?=
 =?utf-8?B?cWdWamNoa3FzRGp3TFB0SGJwc2l3WFQwb1dPMjRlUm4rczRsaW0zbzllaEhD?=
 =?utf-8?B?eFZPTWlsZHlNd0lHdG9jYzllZW9RZjlmTGZ2aEx5QjdYMFE3L0tjd3RTZXlS?=
 =?utf-8?B?V2wxcHRUeEJKdVdHRjRUK2Q2bCs0MWZVWjhBNUE4M3hDRktzTlFiOGRJNGhz?=
 =?utf-8?B?R3VNZ2c3WDRvd1VBNTNsNGNOM0ZjRlpWVTczbTd5cGxFVEI1WE5WYmlwekFT?=
 =?utf-8?B?M0s2STR2Nmp6YXF5b09pOEU5czFRWVdEQU40a1JlTE0xTitSd2hIU0I4cVNz?=
 =?utf-8?B?d2RyYUpKNW1LR1JTQVBVRlA2U3dxNXpGTkV1R3FvWERPUmtmNlVWTXBVVS9H?=
 =?utf-8?B?YjkycHFsOTY5QWh3cFRDQ3VjNWxwTEFNNnFwbjdWczZ0ZzBOTFFKQzRRYUd3?=
 =?utf-8?B?bVFlSFlYd0t4NDFyd3hOZEFWU1pEejBSeTk5bC9jUnRZYUQ4Qkg0cFRVbmRn?=
 =?utf-8?B?RFdRTlRlWHE5bXJzNXNLV0ozSlVXQUFZSWQ5bHllTmhRR0N4dzg0bGRZOXY0?=
 =?utf-8?B?MytLOEtIemhJZTU2SXdPSGlHTm5KcWp1djNWTXF1dXJESlVIUXVqaE1wT29J?=
 =?utf-8?B?THo3YmhudjlrWHhCNWlnTERaTmlzTC81d3BWRXU5VXFBdzN2Q1B5dzRHTzhn?=
 =?utf-8?B?bEQ2ZkxRNDBSRlZkVWdwQm1rck9udFJvdVdtYlgzZHF3Qy9xeDNUREd2SU9R?=
 =?utf-8?B?N2RTQUVod3dlaGlsZnorZXFsaEcyc0dqK3U5MCtSSFcrZHBxcDF4NDhZWHVX?=
 =?utf-8?B?a1IyNVdmVndqZjl3MnNsZkEvbVQzNnhabDI2RzZyT2lOVEc3dHRweUNBeVdx?=
 =?utf-8?Q?5zdSevAiEWPswmEeCGP4jWhMx/L9OtUC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHJaRVIyOGRCTTVxbldPY1NJK2twTWttUU5lQUFtaGc3Mm5rWkN3ZVVUV1Vq?=
 =?utf-8?B?NHlpcTd4dVpqdDZ5dUxUZTYraTNaakVSVnhDMjF5Mm50UUJrWmpGeVhZTFNR?=
 =?utf-8?B?NUJILytGR1lzbzJhOGxIbGhPN0VQR2JwNWQxRnc0aG5RQkNXeVV4WGl0MG9w?=
 =?utf-8?B?WnJJMGdGNzVNWDlnRUg3Vnp3SUsxbGZrTTNmSXd1WFFkNXdJTGdKMkU5ZmJH?=
 =?utf-8?B?NE5INmhPVVVKN1RITUVYRjFjc0tNKzB1TitpbS9CLzhNK0hSQnVkeGd0Z1Z3?=
 =?utf-8?B?MEtyZHh6R0JHMFpUc1ZCY21oMFV6U1pzQllqTkN5MS9GTy9ZdXNlUmx1RSsz?=
 =?utf-8?B?VklzdzZFekEwMDBya3hHS1NpYWlqcWZaYUVMWkNBZnEwZ3l2cGRMcXhPQnYv?=
 =?utf-8?B?UnNPbnFOdEdERk53NFhRcGRQc2xCUk5sd3pnUlhBUjA1UCs2RkVkUEpkZkpQ?=
 =?utf-8?B?YVFRUXJHUzRUUUE0NWNWUlUrVjU1UmlJWENvTFhxOVpvMFNJbzZyMjFDSEhh?=
 =?utf-8?B?Ujg2Q0w2dmk0Rmd1MXBaQUlrMVJ3OGhITS84VEZuU0lPbjNDQS8za1JabGhX?=
 =?utf-8?B?dG1IdUIxSndTTCt2RldWUlZEb0lMWHZVMlAvZnpncVdTNkdjdk9pNzA1RlFG?=
 =?utf-8?B?R3pJWFJXdVkrK2xOSzBJeHBpOVFwZm1wb0VGV214dnhpdXRaTzlNNUFSak12?=
 =?utf-8?B?YWZrL255Z2tFbmJHT1VYS1dnZ2tsTnZad2xPaDlwRTFwRzlsVFBXZFBONmRp?=
 =?utf-8?B?ZXhJOW1QVzhhamtFZGRaSU9ZWXg0d1VkQmdyOWpzYnkyLzF3SkZTRFVSVXNs?=
 =?utf-8?B?T3FjTkFOYWFrQVdKZzFoWlVrSitFcEd1VDBSeWI3WFkyYmlWRWliK0Q2dHB3?=
 =?utf-8?B?MUNSMG8zeGMzL2o5TGNkTU5OK3RSdmdNRjVEclBlcG5pbGpDK1E4RU9wVEhQ?=
 =?utf-8?B?c2M1cnFVbG5TS0xkeGVCaWowK3c2Y0RLbE1QZDd1ZW5jeVhQS1lJdHhOSVZC?=
 =?utf-8?B?a0NJUSsvWE9CeG00RFNMMzFyQjIvdWVxVTBpcmVMRjIzUTloUFpKOE53UXU5?=
 =?utf-8?B?MHo3bDZpOXZqb3hIb096UjN2VFEzSVI0bTl1UUU5bzJVWVIrNUxNdjMzbGxT?=
 =?utf-8?B?MjhsTkY1Q1NiNCtMcTEwRGN1MVZVM2F4aHBTT0JsV2EyQVRhTEV1V1J1MWdB?=
 =?utf-8?B?cWg1Q2dSSnpQekJMbkVoYzI0U0ZJd09UUlRMdnh1cGRhMGNGNUVuY2dXL1VM?=
 =?utf-8?B?MnZid0JNQXdOUVdWWVNqRG9VQlRyenQzenIwVC9iV1htV3lvZWFUU25MbUhN?=
 =?utf-8?B?OVFJODh4ZUhYWXI1QjJKK2RQM1JLKzB5STdDQjI4cWg1VmV4VHV5K3B6NE1s?=
 =?utf-8?B?b0IwdjF2UkFVSzJxOXdWNXB1ZEZnRnhyTWpZanFCT0pXcUhuTlZ1cERZMWhB?=
 =?utf-8?B?MGRzYWRVY2dnWG1UdnFZVDBGTTIxOHpORnJ5Z3gxNTJlQy85SGNhRmEvWkh3?=
 =?utf-8?B?eWxQM3hRT3hRbUlIRUgrNGt2VS9RT2ZNQU44TGgya3RsNEVmbm9UbDdsNnEy?=
 =?utf-8?B?blVoem9UaWRoOG9VNjRIeGtybTI1b080aHJmakdzUUI3bzBQKzU2RFR5d3RM?=
 =?utf-8?B?RWlGMGxlMkF0Y2dTVGRCeFR3bjBlZjdWWU1wbkFMb09kYmo2dUMwTFJ4elVN?=
 =?utf-8?B?T1RiZVRubW4vN1M4c2xaeU9LYzBneUJxTUN0cGR6OHVqemJpWDY1T3BrdGF0?=
 =?utf-8?B?aHlvRVZuaEVSVFVFNFh2Rnk3WndwRFBoUjd5V2FKM0RDdWF2N3dVUlo3YVlm?=
 =?utf-8?B?aHZWMW9OZ3hoOTZPY0orNmVUMTc5SjJuQUxBdm1YM3lPK0h3ZUlEdzVKNUJD?=
 =?utf-8?B?L01ReEZhOWNzaEliSmN1c2drTGwrdTRINFVOZXNoU3JzTjREQmVMaVN2K09L?=
 =?utf-8?B?dzZmZURFSzNOajRSRFBJb0FUWkVCZ2NBRzVNd3BzKzZUNUlPQ0EvU3A1Qnh4?=
 =?utf-8?B?azEzTnBsMHppNkgwN0ZGb2pSK2hQRHkrL0s2dUE4azBFaHhiQXZ4ZGxNLzlr?=
 =?utf-8?B?YnRBSHhuQVN1a2xlMmxyczdubm1TM0dsTGV0Vjg5MlErL2Vsa1ZRa01YT0lF?=
 =?utf-8?B?N1BtMkJxbEptRXpDVXRjdmZHbnlkdDFZb0hlNjhCelZCdmZuSkF5aWgxZEEx?=
 =?utf-8?B?aGQxNElUOW9QWHlVZjZzZFlmVUJ2QVlZMys4OG1NRWVoemw1dCtOdnRQWGFq?=
 =?utf-8?B?WHI4OXVacEZVMks4LzAxRSszcFZkejRDc1l2NVZoa2JXTTI1dURzdUYzRElR?=
 =?utf-8?B?ckJNbjR2NzZ5VTBYT09jQUJqeVI5RGl4OTFzNy9LMUJFekt1VkJmME56SFJU?=
 =?utf-8?Q?gUi0aj6t+SiixsMk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d24537-ea19-44c7-4b0c-08de47c5a9e3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 17:05:41.9222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vj9MV647u53w4CW8okGBtiRbrEDtmkkTTxWgy0Pp5XZJ9yNUyMTe1nfD/qGswSSIdJoumDnrVMmdvt0Fj1ypQOeqFHhf09nagL6vrrH8YDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6392

Hello,

The x86_64-allcode run highlights one new violation of R17.1,
vmcoreinfo_append_str().  In writing this email, I've found another in
debugtrace_printk() meaning that we're missing some options in the
-allcode configuration.

In deviations.ecl we have:

-doc_begin="printf()-like functions are allowed to use the variadic features provided by stdarg.h."
-config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\\(.*\\)$)))"}
-config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
-config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
-config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
-config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
-config=MC3A2.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
-doc_end


First, we have no printf() so that row should be removed.

But, more importantly this is safe if and only if the function
declaration uses __attribute__((__format__(printf, ...))) to cause the
compiler to perform format typechecking.

Is it possible to encode this attribute requirement in the Eclair
expression, so that e.g. accidentally dropping the attribute causes a
violation to be reported?  This would also be rather safer than assuming
that any prefix on printk() is safe.

Thanks,

~Andrew

