Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FB975B22
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 21:52:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796839.1206538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soTMw-00043V-5H; Wed, 11 Sep 2024 19:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796839.1206538; Wed, 11 Sep 2024 19:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soTMw-000412-1x; Wed, 11 Sep 2024 19:51:14 +0000
Received: by outflank-mailman (input) for mailman id 796839;
 Wed, 11 Sep 2024 19:51:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLDu=QJ=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1soTMu-00040w-DZ
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 19:51:12 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2606::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fc89ea0-7077-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 21:51:08 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by GVXPR04MB10023.eurprd04.prod.outlook.com (2603:10a6:150:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 19:51:03 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.7962.017; Wed, 11 Sep 2024
 19:51:03 +0000
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
X-Inumbo-ID: 2fc89ea0-7077-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6McvRtvYEhP+mqVR6jcGucGRc17w6SRtMCo4OT6KLt3hv2UdCQ2I4kl0g+/F0y0liOhPGPBRrosj72WFNoOu9bXKWir1yb+V8FQTI1VCxr01paL7h+ME2cxgQg9IMPg4EKwxsEzPpn8Qjih2cUiHNe+kJeRR6qw0ytwFmuDgtoeiNlO05cZCDuZGibaDD0a9pborJxIsw8xaxIyX5aSwPHMYW1nJ2Yd8maq/AX8k4jYSGPl2boKDOfJgaqARxn0HYOUmVLZSha+4Pkj4RLTTO4TmdVcauITBIdj/PpSbW/Zm3t/REatW/yR0Hl2/wc3tjbBOlN0pasAvpitmnhbow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQ5vWbPQvnLLfOo56KGrizWFvGJNidQ0J9CQK58QrfA=;
 b=v1TPBBYZS6oSCPlBgDvJxOZZLBDfdj95F0N0wastGRF28rJQF2L3+3taXG4XiTR5mg1TDieXwP49FEtrkRBuKJ5KEEJA/heoNzsr8TlNpdMkNRDFfpvrD6fQxyLpULYCYU5GddLynThIJUb3UbmMjrlJO2PQMI3Y4/0kotl2eP/+9B8WC+X6TPxdmrN6MTM8PEipw6j4G313Ma5vllSS3BRKah0evGmguYU83o179OxnC/pWdkEmhqAIGRfyj0+MM4TzytPOnHfIMQfYfr7nKljIJ8Wgo/yr/2zExzkZcWphnjXTUgFhFx03Stk/YD6C/DMQaFUbOxifv9o2tu0zpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ5vWbPQvnLLfOo56KGrizWFvGJNidQ0J9CQK58QrfA=;
 b=NJywmm5wf89n8ssAhyu1SvxXcUjqPeSjJKel67HmTH/ntzTDpD5n6vWQrDO4kqtJAs74i4eEkuDBb18o7xAHTupQVGIlHRe1IquRuMfJIiyk6tJ8SyHW2CO87/kv67X7oHKjYeeX1P37UXQ9hu59+0u/kkiOxpwlZZvEP53fdnM5Zb+vTTcENe2rvaFzlwrk+Qo84yRyrJm0Km9GdKOsoTvo1704wRB8lzpHl+r4WogPJ3/yELH/+8rxrV+2FrqCur5xQGkXY04w81yKopYwZe8NrB/DVSX7aWzQ8tGE1n3Ess7fTalWq1/sMiqfnLnjIvhFVaAMxNw6oNh65Atf0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <ca8e0029-fc4e-4d8f-9a76-4f4f9da6f82c@oss.nxp.com>
Date: Wed, 11 Sep 2024 22:50:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] xen/arm: Add NXP LINFlexD UART Driver
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
 <20240910143411.178704-2-andrei.cherechesu@oss.nxp.com>
 <bec9c46e-4b26-4b2a-a3e4-e27b8addd954@xen.org>
Content-Language: en-US
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <bec9c46e-4b26-4b2a-a3e4-e27b8addd954@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P193CA0016.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::21) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|GVXPR04MB10023:EE_
X-MS-Office365-Filtering-Correlation-Id: cf326922-e0ed-4d5c-2b3c-08dcd29b1172
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bXhMN2VqZkNmMnE5S2xlWkxZUEFSTGtrVU5xQlAvekU1ZkJESGZJUmwyajJ3?=
 =?utf-8?B?MmoyU0NQTTZVV2lKVUZER1QyY2s5SXNCT2ZDNXRyV2cyd3RXR0piYTByRWdG?=
 =?utf-8?B?MWFJRFgyVlJWb296QzM3Ykdta2QvQXdlZ2FwakFYc1pSWTRsSS9kbTVnOGtt?=
 =?utf-8?B?ZjNDYktlZno1WU1RQWtlTVk0VityWDJYUGNhckM0MERBRFFRZ0JZQ0VrQXlo?=
 =?utf-8?B?clRoWWFaUHdBL01xWFlWNlhHdFVjYWVxSkVWWmlPN2Jad1psOStkM1NzZTl4?=
 =?utf-8?B?TGZkZjl1ZStuM3BqeTlpUG9FbndJWlpVUG1yWmtjcFZwYjNKNGZhS1dxeEZa?=
 =?utf-8?B?K3dyd1Jra1dCaUhmaFh5ajlNaWFEbHljSkNZbXprZCtySUc1Z1NMYUtQWXUx?=
 =?utf-8?B?Q2x5dWZtYlh4M2VQdzB5b0I0YnFNdHJJcnVYSXJLbkFyZWo2MS94UC9UM09J?=
 =?utf-8?B?R1hEbVdmemcxYytDMmV5akhFNjY0YnEvNEdpVDFLZjNTUzd1MTV2SHpIb2pv?=
 =?utf-8?B?V2cyQ1B0dTFvaFU1T1c5RXdYUmQ4U01EWklMSk9HZkVyU3VNVmFFWnhKWEFI?=
 =?utf-8?B?Mzc0ZmVjS2RGTlRBalJuQTFSRFVGTThxOUtuTURSTjdHRUFWOHIwK3ovVEpH?=
 =?utf-8?B?SkRsMDNuRzgrVzZxUmpseW9BQys2V2pub2VRWXpLSU42ZUhPR0ZrQTFqTDgy?=
 =?utf-8?B?UUVPeDRvR0lGOXdqMVRRdmlHcUo2dUFleGxuNDJtR04xSU93OG0zazI5T0FZ?=
 =?utf-8?B?TDVPV1FjTXB5TFBYSGtxbWxhbk55SkpYK1o2cjNLTlY0VFU5Ry9RQ0R4WnFY?=
 =?utf-8?B?SDVBMVAxK3V1UDJGc3lGM2YrcVJLbjFCNXMvRTExQVNoTTl6QXFIWG5qVDg0?=
 =?utf-8?B?Zm43OVVYOTdtTGIrc25tQXFod04xWDl3QzlVRWdXQjBsd2c4VWtvem82YTY4?=
 =?utf-8?B?RzVxNmM4YlhRZTkyVHZNQzVOUzRYeEFOYTJMQWRLSUMwRCtPR1Y0bC91VEQz?=
 =?utf-8?B?Mk9mOE1TSjViRExybSsxWitPd29vRDIwK3EyQUZVMnZ3ZkhIRXVDV29YT0JR?=
 =?utf-8?B?ZlNtb0hFWW5zcE9LZFdEQy9ySjNROEU0VWRKQm8wT2tLMmxPdE92bElzdU5S?=
 =?utf-8?B?N1pLOG5VVXFiV1hlakN3SXpKTk5SY3UxdTdnZ1UxSHRPRkQ2cmIzQ0I4N3lu?=
 =?utf-8?B?ZUduM2ZDdm5zTU12N2dxY1dwZ1hweEZkUEd4L0hZcCtJZUozdWZZRUViUGI2?=
 =?utf-8?B?ZlpjL0ZaL2JucFhDTGdoWTQ0alJubTJoM1RJeTZMQXV0cHUvUDhhQmQ1SzhS?=
 =?utf-8?B?S1pKZXRTUHhXWkVIWGx6VVVZUmFCSjdNOXpXdllZazFyV0FRK3lCUjg0c2xp?=
 =?utf-8?B?TVBlUGU1RUMwWHBuRUM5K3VvL2hRWGJJM0NIVGhmdEgzNHp6bHdVT241b01y?=
 =?utf-8?B?WWV6MUhDcE00ZlVMcG5DODVScWV3ME4zWUEwbDM3R2EveldQTlhVNFlMMjNp?=
 =?utf-8?B?aXNGQTNuVk1MOU5FY25jREtYNk1Vcm5uU2dtMi81MHdlMnFpOE9xNUxSQW03?=
 =?utf-8?B?Ry9xTmwrNVRMY1NHY05tamU3S09kaDByRHZKSDc5Y21aS3pjb0VJNlQ3VWNw?=
 =?utf-8?B?czFFUldERkdnYm42ckZaNDU3SlpIbFFOczFnQ0VPdVJPTExYb1NQMnA2ZDho?=
 =?utf-8?B?Szk1eG8rTmpFaEtGem9UNkZCTzJ2RndhdG9qbnhKTVpsbys5SG9tei8remZO?=
 =?utf-8?B?WEwzWXlocFRiWGRnRWoya2R0dFU0T0FQMTM2NVVUZ3VvR1BKTVlUNUplWEVi?=
 =?utf-8?Q?K32ixyZsZOrBjx18MYK/vO76BDnvZTP7fosm0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUFSbnFJN05pWWc2SWlzVzN6UksyaVcxZVZmbEFyeDdFRGo5ZzR0REVJb2Fj?=
 =?utf-8?B?bS9YRWo0ZTJuUVBzUCtyL2Vuc1pFbDRJUDU3K0dUTk9JQUFzcHgvZUVibEwr?=
 =?utf-8?B?aEo0cTM4dXpXVU5lbldwQTFJd2hLOFRJOWVJWUgyQ3BiZDlqNmczQndib2pV?=
 =?utf-8?B?d2k2dll0L09JMkFkZGdBRXYxNWY2SSs4UkFsNWhSbzZ4RTlERGZpMG5nMU82?=
 =?utf-8?B?TWRtYXpaZmc1MnF2Mk1Nc3JXczdvbGtudWRvQVEyVDVZbVhDb3RqQ0JydWNo?=
 =?utf-8?B?S0JSSDMvOXNYeGRaRU9abHY3cXY2Z2FDcDZGSGRTVHJxcmphcU14TW5nNEkz?=
 =?utf-8?B?YWMxblpTbXY0UnpYU3gvVjRiZ2FSRVpXdnhXNEMzclhVS2xzQU93TUw5bVNl?=
 =?utf-8?B?eG5pQytidFltZXZ6L3ZIQXVjZ0tRYVhKMG1KQ0FRSzN1blFSMm15ZHpwaVFL?=
 =?utf-8?B?S09tN1M5MzZJVkhnUGl3UC9FcVcxcGdja2JMa05KQVVBZzR1NHAyYmFNbnI4?=
 =?utf-8?B?TnYyTXFYYzFtdHVkMHNVMDF5Wlh6N3h3QURKbjZtSFJMcml5dkxuMDVUMUdE?=
 =?utf-8?B?Um1KcGtSMTEzOEFNcmljVmhxNFAxNWs0VklyWmozNmh3cVJuM2JVRi81VU5i?=
 =?utf-8?B?SEhvV3FldGZvY2xwdXRzR3ZTUkZDc3ZEZjdzY0o3dlRoQWlaSU9obzNXQlFY?=
 =?utf-8?B?NUtSNDZhR1ZSY2RXc2xUVGpPZzRVVnJqUUtKQ3JZbHV4c09MUURleTdHQ3NJ?=
 =?utf-8?B?dG9qRXR3UFZjZEdRYVZ1OTNaeGliZkhLL1dpMTVjSEdGTGhzNWlqTWxOWXBE?=
 =?utf-8?B?OWFjcXZncHFDU3psSHBSV0krL0ZPOEFTV2hTRmJDN2trZHFiMEFVM1N0eTIr?=
 =?utf-8?B?T3hNMVAxVUp2UFJybXJERE9HeGRVRHBDSkdLVlhJbkpDMmNrcTFpVERmVi9t?=
 =?utf-8?B?MzRURzhFY1NXOWI3VXBOeHhJRXB2dUxvR3NMR25CQjdQMEhEMVkzN25PeDcr?=
 =?utf-8?B?ak4rSTI0ZE44NFRtdWRnLzJEY0EveDcrOWJrYlE4eXd3WHNLaWxjeTRaZlRY?=
 =?utf-8?B?NVdxa2xaRmFlOTIxbElyTEN4Z2diZGJtbmthMkJBdVFLTkNoenV6VExPQmZX?=
 =?utf-8?B?N1RkMVdqc0U1UERON1FQVXplVXFxSVVXQ2FtcXA3b3JJaFlXM1VrRzl5U2JD?=
 =?utf-8?B?TnRiZUVtVlY5VndYakV2SnQ4NDRqYzNFeXBMWmJIeXVGQXZvUFVUTG1BeUxE?=
 =?utf-8?B?dksyb3NGbkphcmdXdmtXUnBvSnlScDZZc0xYU2Ztdkd3SzhUaTBYeGoveTZQ?=
 =?utf-8?B?UGFZcHZ4eDBJL3d2ajBROUQ5WDhlOUM3WmxLK0NlK0RNN2VJeDdYOUc4UFJT?=
 =?utf-8?B?a1QzQUFvS29lZUw2RFdtUG9URmZFVklsd0NlWVBhTEV1b2U4MVh6TkptWnpm?=
 =?utf-8?B?aVhrOEJOZmsva01Fc1hIVFJGb1o4cUVNNnJ5WGY1N21jUHF5R2I1L3F3TXU4?=
 =?utf-8?B?azEzWjVESDZ6OXl5MWxBZzdJQVNSSEZ3VmRyRkJ4aGV4TUlxeHRRckNvTkhW?=
 =?utf-8?B?SmNubkRYU285RCt6a3c4UmdlTzVxT1ZSWVVJUHpyYkpJeUxYOFBRSkI5Rk1B?=
 =?utf-8?B?alJ5Zm1hZCs0TERrZlduZnl2a1lUVUNNUzd6NFk5ZEdPWHFxNVE0U3F1d1Z4?=
 =?utf-8?B?a0ZOTndGeFdzcDZaTEZSOVFDWHdJcEdrZ2hmM1FId21VUnRrQXVVNFBhRWhp?=
 =?utf-8?B?MDB4T2FqOXRNSmZPTzBIV1oyN3MyaWlha1oxc3k0Mkt1a0p1aU1CVUM2OG1J?=
 =?utf-8?B?ejdvYWZBY0dVKzd2enpGcFBBVW5lTDhiNFhzdlRSRC9xUUdHUnQ1Q3k4Ynp2?=
 =?utf-8?B?UnhLWUF6NkJyeUR1d2kvWG1jdVB1a0Nkb2NpTXJpQzFGRGtuWm5mVXBIZFN3?=
 =?utf-8?B?c2l2eXhUWE1va1RMSmJLK2NpbVkrL2lnU3hVeVJYeWFMYU5waFBKV3NpTUU1?=
 =?utf-8?B?bk9iNDBYMGRJdE4vL3ZjSy84RFJVMG9pbFRVbE1FRmk0SU9sWmZmUVNlRlhL?=
 =?utf-8?B?UXQwSXJpTWdIUWxKSlNTQnJad3dpUFkrOGdCTXN1VDNwZ21PblJBdHE4ek9W?=
 =?utf-8?B?Qk9zTHh2YXRxdVRIYWgxeCtoMmpRa1VJVXlBKzBZVlZNY1BIbzZrMjkrZ21Q?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf326922-e0ed-4d5c-2b3c-08dcd29b1172
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 19:51:03.8586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiJSjeDILzcxa7a86igLw0ITBGs5dHpMXWOUO1V9GukGZLv986raasszQ3FQQHQv+wX2MwRy3oA62UR1dm+2AtQfM2M/IzjGBWqU1eZWA2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10023

Hi, Julien, and thank you for the review!

On 11/09/2024 00:55, Julien Grall wrote:
> Hi,
>
> On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> The LINFlexD UART is an UART controller available on NXP S32
>> processors family targeting automotive (for example: S32G2, S32G3,
>> S32R).
>>
>> S32G3 Reference Manual:
>> https://www.nxp.com/webapp/Download?colCode=RMS32G3.
>
> It looks like you need to create an account. Is there any public version of the specification?
>
Unfortunately, the Reference Manual requires registration on NXP website, as per company policy.
The only public resource I can provide is the Data Sheet: https://www.nxp.com/docs/en/data-sheet/S32G3.pdf.
>>
>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> Signed-off-by: Peter van der Perk <peter.vander.perk@nxp.com>
>> ---
>>   xen/arch/arm/include/asm/linflex-uart.h |  62 ++++
>>   xen/drivers/char/Kconfig                |   8 +
>>   xen/drivers/char/Makefile               |   1 +
>>   xen/drivers/char/linflex-uart.c         | 365 ++++++++++++++++++++++++
>>   4 files changed, 436 insertions(+)
>>   create mode 100644 xen/arch/arm/include/asm/linflex-uart.h
>>   create mode 100644 xen/drivers/char/linflex-uart.c
>>
>> diff --git a/xen/arch/arm/include/asm/linflex-uart.h b/xen/arch/arm/include/asm/linflex-uart.h
>> new file mode 100644
>> index 0000000000..62dc54d155
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/linflex-uart.h
>> @@ -0,0 +1,62 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>
> The identifier GPL-2.0 was deprecated (see LICENSES/GPL-2.0). The new tag should be GPL-2.0-only. The resulting license is the same.
Will fix in v2.
>
>> +/*
>> + * xen/arch/arm/include/asm/linflex-uart.h
>> + *
>> + * Common constant definition between early printk and the UART driver
>> + * for NXP LINFlexD UART.
>> + *
>> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> + * Copyright 2018, 2021, 2024 NXP
>> + */
>> +
>> +#ifndef __ASM_ARM_LINFLEX_UART_H
>> +#define __ASM_ARM_LINFLEX_UART_H
>> +
>> +/* 32-bit register offsets */
>> +#define LINCR1          (0x0)
>> +#define LINIER          (0x4)
>> +#define LINSR           (0x8)
>> +#define UARTCR          (0x10)
>> +#define UARTSR          (0x14)
>> +#define LINFBRR         (0x24)
>> +#define LINIBRR         (0x28)
>> +#define BDRL            (0x38)
>> +#define BDRM            (0x3C)
>> +#define UARTPTO         (0x50)
>> +
>> +#define LINCR1_INIT     BIT(0, U)
>> +#define LINCR1_MME      BIT(4, U)
>> +#define LINCR1_BF       BIT(7, U)
>> +
>> +#define LINSR_LINS      GENMASK(15, 12)
>> +#define LINSR_LINS_INIT BIT(12, U)
>> +
>> +#define LINIER_DRIE     BIT(2, U)
>> +#define LINIER_DTIE     BIT(1, U)
>> +
>> +#define UARTCR_UART     BIT(0, U)
>> +#define UARTCR_WL0      BIT(1, U)
>> +#define UARTCR_PC0      BIT(3, U)
>> +#define UARTCR_TXEN     BIT(4, U)
>> +#define UARTCR_RXEN     BIT(5, U)
>> +#define UARTCR_PC1      BIT(6, U)
>> +#define UARTCR_TFBM     BIT(8, U)
>> +#define UARTCR_RFBM     BIT(9, U)
>> +#define UARTCR_RDFLRFC  GENMASK(12, 10)
>> +#define UARTCR_TDFLTFC  GENMASK(15, 13)
>> +#define UARTCR_ROSE     BIT(23, U)
>> +#define UARTCR_OSR      GENMASK(27, 24)
>> +
>> +#define UARTSR_DTFTFF   BIT(1, U)
>> +#define UARTSR_DRFRFE   BIT(2, U)
>> +
>> +#endif /* __ASM_ARM_LINFLEX_UART_H */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
>> index 3f836ab301..e175d07c02 100644
>> --- a/xen/drivers/char/Kconfig
>> +++ b/xen/drivers/char/Kconfig
>> @@ -13,6 +13,14 @@ config HAS_CADENCE_UART
>>         This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zynq
>>         based board, say Y.
>>   +config HAS_LINFLEX
>> +    bool "NXP LINFlexD UART driver"
>> +    default y
>> +    depends on ARM_64
>> +    help
>> +      This selects the NXP LINFlexD UART. If you have an NXP S32G or S32R
>> +      based board, say Y.
>> +
>>   config HAS_IMX_LPUART
>>       bool "i.MX LPUART driver"
>>       default y
>> diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
>> index e7e374775d..d3b987da1d 100644
>> --- a/xen/drivers/char/Makefile
>> +++ b/xen/drivers/char/Makefile
>> @@ -10,6 +10,7 @@ obj-$(CONFIG_HAS_SCIF) += scif-uart.o
>>   obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
>>   obj-$(CONFIG_XHCI) += xhci-dbc.o
>>   obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
>> +obj-$(CONFIG_HAS_LINFLEX) += linflex-uart.o
>>   obj-$(CONFIG_ARM) += arm-uart.o
>>   obj-y += serial.o
>>   obj-$(CONFIG_XEN_GUEST) += xen_pv_console.o
>> diff --git a/xen/drivers/char/linflex-uart.c b/xen/drivers/char/linflex-uart.c
>> new file mode 100644
>> index 0000000000..4ca8f732ae
>> --- /dev/null
>> +++ b/xen/drivers/char/linflex-uart.c
>> @@ -0,0 +1,365 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>
> Ditto.
Will fix in v2.
>
>
>> +/*
>> + * xen/drivers/char/linflex-uart.c
>> + *
>> + * Driver for NXP LINFlexD UART.
>> + *
>> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> + * Copyright 2018, 2021-2022, 2024 NXP
>> + */
>> +
>> +#include <xen/config.h>
>> +#include <xen/console.h>
>> +#include <xen/errno.h>
>> +#include <xen/serial.h>
>
> In Xen, we tend to order the include alphabetically within the same directory. So this wants to be after xen/mm.h.
Right, will address in v2.
>
>
>> +#include <xen/init.h>
>> +#include <xen/irq.h>
>> +#include <xen/mm.h>
>> +#include <asm/device.h>
>> +#include <asm/io.h>
>> +#include <asm/linflex-uart.h>
>> +
>> +#define LINFLEX_CLK_FREQ        (125000000)
>> +#define LINFLEX_BAUDRATE        (115200)
>> +#define LINFLEX_LDIV_MULTIPLIER (16)
>> +
>> +static struct linflex_uart {
>> +    uint32_t baud, clock_hz;
>> +    uint32_t irq;
>> +    char __iomem *regs;
>> +    struct irqaction irqaction;
>> +    struct vuart_info vuart;
>> +} linflex_com;
>> +
>> +static uint32_t linflex_uart_readl(struct linflex_uart *uart, uint32_t off)
>> +{
>> +    return readl(uart->regs + off);
>> +}
>> +
>> +static void linflex_uart_writel(struct linflex_uart *uart, uint32_t off,
>> +                                uint32_t val)
>> +{
>> +    writel(val, uart->regs + off);
>> +}
>> +
>> +static void linflex_uart_writeb(struct linflex_uart *uart, uint32_t off,
>> +                                uint8_t val)
>> +{
>> +    writeb(val, uart->regs + off);
>> +}
>> +
>> +static uint32_t linflex_uart_get_osr(uint32_t uartcr)
>> +{
>> +    return (uartcr & UARTCR_OSR) >> 24;
>
> Please provide a define for 24. This would also make easier to correlate with UARTCR_OSR.
Will address in v2.
>
>
>> +}
>> +
>> +static uint32_t linflex_uart_tx_fifo_mode(struct linflex_uart *uart)
>
> AFAICT, UARTCR_TFBM is one-bit. So should this return a bool?
Yes, it is one bit and I agree a bool would fit better. Will address in v2.
>
>
>> +{
>> +    return linflex_uart_readl(uart, UARTCR) & UARTCR_TFBM;
>> +}
>> +
>> +static uint32_t linflex_uart_rx_fifo_mode(struct linflex_uart *uart)
>
> Same here.
Will address in v2.
>
>> +{
>> +    return linflex_uart_readl(uart, UARTCR) & UARTCR_RFBM;
>> +}
>> +
>> +static uint32_t linflex_uart_ldiv_multiplier(struct linflex_uart *uart)
>> +{
>> +    uint32_t uartcr, mul = LINFLEX_LDIV_MULTIPLIER;
>> +
>> +    uartcr = linflex_uart_readl(uart, UARTCR);
>> +    if ( uartcr & UARTCR_ROSE )
>> +        mul = linflex_uart_get_osr(uartcr);
>> +
>> +    return mul;
>> +}
>> +
>> +static void linflex_uart_flush(struct serial_port *port)
>> +{
>> +    struct linflex_uart *uart = port->uart;
>
> Above, youa re using tab hard but above you use soft tab. Is the code intended to follow Xen coding style? If so, you want to use soft tab.
Will fix in v2.
>
>
>> +
>> +    if ( linflex_uart_tx_fifo_mode(uart) )
>> +        while ( linflex_uart_readl(uart, UARTCR) & UARTCR_TDFLTFC );
>> +            cpu_relax();
>
> The indentation is really confusing here. It leads to think that cpu_relax() should be part of while() but you are using ';'. I guess you really intended to have cpu_relax() within the while loop?
Indeed, the intention was to have cpu_relax() called within the while loop, but functionally, this variant works almost the same. Thank you for spotting the mistake!
>
>
>> +
>> +    if ( linflex_uart_rx_fifo_mode(uart) )
>> +        while ( linflex_uart_readl(uart, UARTCR) & UARTCR_RDFLRFC );
>> +            cpu_relax();
>
> Same here.
>
>> +}
>> +
>> +static void __init linflex_uart_init_preirq(struct serial_port *port)
>> +{
>> +    struct linflex_uart *uart = port->uart;
>> +    uint32_t ibr, fbr, divisr, dividr, ctrl;
>> +
>> +    /* Disable RX/TX before init mode */
>> +    ctrl = linflex_uart_readl(uart, UARTCR);
>> +    ctrl &= ~(UARTCR_RXEN | UARTCR_TXEN);
>> +    linflex_uart_writel(uart, UARTCR, ctrl);
>> +
>> +    /*
>> +    * Smoothen the transition from early_printk by waiting
>> +    * for all pending characters to transmit
>> +    */
>
> The indentation for comment in Xen is:
>
> /*
>  * Foor
>  * Bar
>  */
>
Will fix in v2.
>> +    linflex_uart_flush(port);
>> +
>> +    /* Init mode */
>> +    ctrl = LINCR1_INIT;
>> +    linflex_uart_writel(uart, LINCR1, ctrl);
>> +
>> +    /* Waiting for init mode entry */
>> +    while ( (linflex_uart_readl(uart, LINSR) & LINSR_LINS) != LINSR_LINS_INIT )
>> +        cpu_relax();
>> +
>> +    /* Set Master Mode */
>> +    ctrl |= LINCR1_MME;
>> +    linflex_uart_writel(uart, LINCR1, ctrl);
>> +
>> +    /* Provide data bits, parity, stop bit, etc */
>> +    divisr = uart->clock_hz;
>> +    dividr = (uint32_t)(uart->baud * linflex_uart_ldiv_multiplier(uart));
>> +
>> +    ibr = (uint32_t)(divisr / dividr);
>> +    fbr = (uint32_t)((divisr % dividr) * 16 / dividr) & 0xF;
>
> On the 3 lines above, why do you need to cast to 32-bit? Is this because the result is 64-bit? If so, why do you need to ignore the top bits?
>
Indeed, the casts are not needed. The maximum baud rate supported by LINFlexD is 2000000 bps, and the maximum value returned by linflex_uart_ldiv_multiplier() is 16.
Thus, "dividr" should never overflow (32000000 max value) and neither should the "fbr" computation. In v2, I will remove the casts and upper bound the baud rate to the maximum
supported value, if that's ok for you.
It would be also nice having a generic CONFIG_BAUDRATE (or similar) set by each platform, similar to U-Boot, to make this configurable.
>>
>> +    linflex_uart_writel(uart, LINIBRR, ibr);
>> +    linflex_uart_writel(uart, LINFBRR, fbr);
>> +
>> +    /* Set preset timeout register value */
>> +    linflex_uart_writel(uart, UARTPTO, 0xF);
>> +
>> +    /* Setting UARTCR[UART] bit is required for writing other bits in UARTCR */
>> +    linflex_uart_writel(uart, UARTCR, UARTCR_UART);
>> +
>> +    /* 8 bit data, no parity, UART mode, Buffer mode */
>> +    linflex_uart_writel(uart, UARTCR, UARTCR_PC1 | UARTCR_PC0 | UARTCR_WL0 |
>> +                        UARTCR_UART);
>> +
>> +    /* end init mode */
>> +    ctrl = linflex_uart_readl(uart, LINCR1);
>> +    ctrl &= ~LINCR1_INIT;
>> +    linflex_uart_writel(uart, LINCR1, ctrl);
>> +
>> +    /* Enable RX/TX after exiting init mode */
>> +    ctrl = linflex_uart_readl(uart, UARTCR);
>> +    ctrl |= UARTCR_RXEN | UARTCR_TXEN;
>> +    linflex_uart_writel(uart, UARTCR, ctrl);
>> +}
>> +
>> +static void linflex_uart_interrupt(int irq, void *data)
>> +{
>> +    struct serial_port *port = data;
>> +    struct linflex_uart *uart = port->uart;
>> +    uint32_t sts;
>> +
>> +    sts = linflex_uart_readl(uart, UARTSR);
>> +
>> +    if ( sts & UARTSR_DRFRFE )
>> +        serial_rx_interrupt(port);
>> +
>> +    if ( sts & UARTSR_DTFTFF )
>> +        serial_tx_interrupt(port);
>> +}
>> +
>> +static void __init linflex_uart_init_postirq(struct serial_port *port)
>> +{
>> +    struct linflex_uart *uart = port->uart;
>> +    uint32_t temp;
>> +
>> +    uart->irqaction.handler = linflex_uart_interrupt;
>> +    uart->irqaction.name = "linflex_uart";
>> +    uart->irqaction.dev_id = port;
>> +
>> +    if ( setup_irq(uart->irq, 0, &uart->irqaction) != 0 )
>> +    {
>> +        dprintk(XENLOG_ERR, "Failed to allocate linflex_uart IRQ %d\n",
>> +                uart->irq);
>
> NIT: This should only be called once during boot. So I would consider to use printk() so it can be printed in production.
Will fix in v2.
>
>> +        return;
>> +    }
>> +
>> +    /* Enable interrupts */
>> +    temp = linflex_uart_readl(uart, LINIER);
>> +    temp |= (LINIER_DRIE | LINIER_DTIE);
>> +    linflex_uart_writel(uart, LINIER, temp);
>> +    dprintk(XENLOG_DEBUG, "IRQ %d enabled\n", uart->irq);
>
> Same here.
Will fix in v2.
>
>> +}
>> +
>> +static int linflex_uart_tx_ready(struct serial_port *port)
>> +{
>> +    struct linflex_uart *uart = port->uart;
>> +
>> +    if ( linflex_uart_tx_fifo_mode(uart) )
>> +        return (linflex_uart_readl(uart, UARTSR) & UARTSR_DTFTFF) == 0 ? 1 : 0;
>> +
>> +    /*
>> +    * Buffer Mode => TX is waited to be ready after sending a char,
>> +    * so we can assume it is always ready before.
>> +    */
>
> Coding style. See above how it should be done for multi-line comments.
Will fix in v2.
>
>> +    return 1;
>> +}
>> +
>> +static void linflex_uart_putc(struct serial_port *port, char c)
>> +{
>> +    struct linflex_uart *uart = port->uart;
>> +    uint32_t uartsr;
>> +
>> +    if ( c == '\n' )
>> +        linflex_uart_putc(port, '\r');
>> +
>> +    linflex_uart_writeb(uart, BDRL, c);
>> +
>> +    /* Buffer Mode */
>> +    if ( !linflex_uart_tx_fifo_mode(uart) )
>> +    {
>> +        while ( (linflex_uart_readl(uart, UARTSR) & UARTSR_DTFTFF) == 0 )
>> +                cpu_relax();
>> +
>> +        uartsr = linflex_uart_readl(uart, UARTSR) | (UARTSR_DTFTFF);
>> +        linflex_uart_writel(uart, UARTSR, uartsr);
>> +    }
>> +}
>> +
>> +static int linflex_uart_getc(struct serial_port *port, char *pc)
>> +{
>> +    struct linflex_uart *uart = port->uart;
>> +    uint32_t ch, uartsr, rx_fifo_mode;
>> +
>> +    rx_fifo_mode = linflex_uart_rx_fifo_mode(uart);
>> +
>> +    if ( rx_fifo_mode )
>> +        while ( linflex_uart_readl(uart, UARTSR) & UARTSR_DRFRFE )
>> +            cpu_relax();
>> +    else
>> +        while ( !(linflex_uart_readl(uart, UARTSR) & UARTSR_DRFRFE) )
>> +            cpu_relax();
>> +
>> +    ch = linflex_uart_readl(uart, BDRM);
>> +    *pc = ch & 0xff;
>> +
>> +    if ( !rx_fifo_mode ) {
>> +        uartsr = linflex_uart_readl(uart, UARTSR) | UARTSR_DRFRFE;
>> +        linflex_uart_writel(uart, UARTSR, uartsr);
>> +    }
>> +
>> +    return 1;
>> +}
>> +
>> +static int __init linflex_uart_irq(struct serial_port *port)
>> +{
>> +    struct linflex_uart *uart = port->uart;
>> +
>> +    return ((uart->irq > 0) ? uart->irq : -1);
>> +}
>> +
>> +static const struct vuart_info *linflex_uart_vuart_info(
>> +                struct serial_port *port)
>> +{
>> +    struct linflex_uart *uart = port->uart;
>
> NIT: You are not modifying uart. So this coul be const.
Sure, but no other driver does this. Actually, this applies to most functions in this driver, right?
I can implement this in v2 if you agree to break the pattern.
>
>
>> +
>> +    return &uart->vuart;
>> +}
>> +
>> +static void linflex_uart_start_tx(struct serial_port *port)
>> +{
>> +    struct linflex_uart *uart = port->uart;
>> +    uint32_t temp;
>> +
>> +    temp = linflex_uart_readl(uart, LINIER);
>> +    linflex_uart_writel(uart, LINIER, temp | LINIER_DTIE);
>> +}
>> +
>> +static void linflex_uart_stop_tx(struct serial_port *port)
>> +{
>> +    struct linflex_uart *uart = port->uart;
>> +    uint32_t temp;
>> +
>> +    temp = linflex_uart_readl(uart, LINIER);
>> +    temp &= ~(LINIER_DTIE);
>> +    linflex_uart_writel(uart, LINIER, temp);
>> +}
>> +
>> +static struct uart_driver __read_mostly linflex_uart_driver = {
>> +    .init_preirq = linflex_uart_init_preirq,
>> +    .init_postirq = linflex_uart_init_postirq,
>> +    .tx_ready = linflex_uart_tx_ready,
>> +    .putc = linflex_uart_putc,
>> +    .flush = linflex_uart_flush,
>> +    .getc = linflex_uart_getc,
>> +    .irq = linflex_uart_irq,
>> +    .start_tx = linflex_uart_start_tx,
>> +    .stop_tx = linflex_uart_stop_tx,
>> +    .vuart_info = linflex_uart_vuart_info,
>> +};
>> +
>> +static int __init linflex_uart_init(struct dt_device_node *dev, const void *data)
>> +{
>> +    const char *config = data;
>> +    struct linflex_uart *uart;
>> +    paddr_t addr, size;
>> +    int res;
>> +
>> +    if ( strcmp(config, "") )
>> +        printk("WARNING: UART configuration is not supported\n");
>> +
>> +    uart = &linflex_com;
>> +
>> +    res = dt_device_get_paddr(dev, 0, &addr, &size);
>> +    if ( res )
>> +    {
>> +        printk("linflex-uart: Unable to retrieve the base address of the UART\n");
>> +        return res;
>> +    }
>> +
>> +    res = platform_get_irq(dev, 0);
>> +    if ( res < 0 )
>> +    {
>> +        printk("linflex-uart: Unable to retrieve the IRQ\n");
>> +        return -EINVAL;
>> +    }
>> +    uart->irq = res;
>> +
>> +    uart->regs = ioremap_nocache(addr, size);
>> +    if ( !uart->regs )
>> +    {
>> +        printk("linflex-uart: Unable to map the UART memory\n");
>> +        return -ENOMEM;
>> +    }
>> +
>> +    uart->clock_hz = LINFLEX_CLK_FREQ;
>> +    uart->baud = LINFLEX_BAUDRATE;
>> +
>> +    uart->vuart.base_addr = addr;
>> +    uart->vuart.size = size;
>> +    uart->vuart.data_off = BDRL;
>> +    uart->vuart.status_off = UARTSR;
>> +    uart->vuart.status = UARTSR_DTFTFF;
>> +
>> +    /* Register with generic serial driver */
>> +    serial_register_uart(SERHND_DTUART, &linflex_uart_driver, uart);
>> +
>> +    dt_device_set_used_by(dev, DOMID_XEN);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct dt_device_match linflex_uart_dt_compat[] __initconst =
>> +{
>> +    DT_MATCH_COMPATIBLE("nxp,s32g2-linflexuart"),
>> +    DT_MATCH_COMPATIBLE("nxp,s32g3-linflexuart"),
>> +    DT_MATCH_COMPATIBLE("fsl,s32v234-linflexuart"),
>> +    { /* sentinel */ },
>> +};
>> +
>> +DT_DEVICE_START(linflex_uart, "NXP LINFlexD UART", DEVICE_SERIAL)
>> +    .dt_match = linflex_uart_dt_compat,
>> +    .init = linflex_uart_init,
>> +DT_DEVICE_END
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>
> Cheers,
>
Regards,
Andrei Cherechesu



