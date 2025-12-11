Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA08FCB65C2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 16:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184290.1506777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTilA-000234-AD; Thu, 11 Dec 2025 15:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184290.1506777; Thu, 11 Dec 2025 15:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTilA-00021I-7V; Thu, 11 Dec 2025 15:39:16 +0000
Received: by outflank-mailman (input) for mailman id 1184290;
 Thu, 11 Dec 2025 15:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cEbC=6R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTil7-00021C-Om
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 15:39:13 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87c0f35b-d6a7-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 16:39:08 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH3PR03MB7433.namprd03.prod.outlook.com (2603:10b6:610:19f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Thu, 11 Dec
 2025 15:39:00 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 15:39:00 +0000
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
X-Inumbo-ID: 87c0f35b-d6a7-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqDsP2c45MAwIkSfBEwckpRx+roO6YEBPj8+4P+ec1hrEHNx28bFLHerVcuM4uDq3fw+XRfQQpEIDBVZXM/FYAfXJVWonJKPPB0a0c0P0w3eRsjNZpoZJz2ugqiP7K1x95c//4zGKFEcgTvvJmmSaBBBKRa029BnIUhFvW03qlO4aOzcFqhDYw5Qinpuk2sajf16PoGm78xoEVA+MnTJjeDmm2QQmdgCzZnPRLPt0jVUeN9IXV2L7nxAAvfs1vxhyWb49nzc0kbdKF/i/2ttscQzJkf+S6fZanLtUmnc1TXdJivcaph27J889iavTekwb1PCr+46zY0rNMpwSax5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V51oZObenhNA+VK60UT4VaWQgdqmHpRYGC1FTnHwq/o=;
 b=si/pzNrIs6iUHx5PD+1c5VpFoODYNjN0hs27wpIZ5mBtPW9AraEy1a9VPA6wqkzF+i4sbRH6FEmkDUloMFnQJRzcqrHyGOekfhEX/bw7TUDju/mXGB2V6siok2nCu47y307GxRQdFoIebvSXfpssHwCpEQV7fs5JxdprlTAvLe1UbwyqUxZC9Bd7yr9AMZzPBTnPA2sBBkandxY9e4Dxcp3rFUfv4u/HYP34giMeeysDnQ5ZU44TS34xhyoI0sXfRakm9QrBzhGJPLTXrHQdeIlbB2KNz0FnCvyjBZ/hAX66b0yL9wpyZcoGfzkwkkXWx1dx4CLd/RdCZ0vkhJPCgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V51oZObenhNA+VK60UT4VaWQgdqmHpRYGC1FTnHwq/o=;
 b=LOrsVovEILsQfUNEW+oUunbQzfTaOgPoZypOQlDRi+t9782Blyc7nn7hpYuskCXLTBhR1+hP+JSPAsgbFUIaVV10Ve0apnUmsGChDjUvQjhWUXyytVny7BndENKq5zpyZEPTgXepxieC9yerY2kliQRb2+rJSn8EJ4F6CSqaomM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <15659af8-4604-455a-b7de-91c4df213ab5@citrix.com>
Date: Thu, 11 Dec 2025 15:38:56 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 09/11] x86: Migrate spec_ctrl vendor checks to
 x86_vendor_is()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-10-alejandro.garciavallejo@amd.com>
 <73146271-c849-4d16-8eb8-80e7d59f42f2@suse.com>
 <DEVBH18RU4WL.2GFVGYVC8SWAC@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <DEVBH18RU4WL.2GFVGYVC8SWAC@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0285.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH3PR03MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 83659308-ba41-4d6d-7c9c-08de38cb67ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3l4dEVWSC9qU1RzUmVWaUpJa05raE44ZERQNnY0S3E2ak44UjJWZDN2VUp5?=
 =?utf-8?B?OVdGelIwUzk2SGI2UmdmQUY5OERYcGVVMmxHb3FMUUJja3VXOWduOWpwRHhi?=
 =?utf-8?B?cmxRKzgxRVdPM3AzLzQ2bGhERk5heU9mVXIveHA5dXU0d0pFbWxlWnEySkov?=
 =?utf-8?B?UjN2UkhCVGdQVDBMcXd5ZVdDM0NoV3JDTVQwSFVXd0tpSjlOcVM1MG1XQjhn?=
 =?utf-8?B?TWMrZ0hoclN3cjhUOVRPK0d3MGw5RGd3MlJ2SXE5OStEcEVQMTRkdDF4M3NR?=
 =?utf-8?B?K0VaRlIvY09tcHkxQmpKUThMeks3dXYrSmRRZlpkdzNqQWNHd1BId0VXNFFF?=
 =?utf-8?B?d0c5VWFlSlk0czFlUi9JZG5wdVZUNWJaM2VET09MbWFmQlB6eTBWUk8vZDFq?=
 =?utf-8?B?WmJNV294TVp0TTdwRHNLMnZFT1poMXFrOVd5b1d2aEc2b2FhdFNxbXhuZzFi?=
 =?utf-8?B?S0xSZy9mRlJjTkdnV29YYkRCYStOT1Y4elRSL2NPdEtucUt5ZUhwSG5VSk9R?=
 =?utf-8?B?aEEyN1JIdkg3UjdSTTE5cDR3SlMyekY1b1ZNcmVKU1Nvbi8zZXh1b0VFVzJC?=
 =?utf-8?B?R3kzYnFRWTVQOGQ4Vi9jVG5QRThWWGF5QUY4NWdVVXJ1WksvSE5paUdOTXF5?=
 =?utf-8?B?Q0VDMnExT0ZtaTRqSjhYRGlycFF0ZHNkbjdwRVZ1L3Q0QXpES2xseEp4bDZC?=
 =?utf-8?B?Yk95aEVEMEJEQ0FrZVU0cms2U2dTRU4yQkM5TU1XcyticU1PQ3A1SDFxV0FK?=
 =?utf-8?B?bTFYajNHS1dHM1p0cTIzcHowa2xHZllMb00xS1BzNXBmdU82ZDNzRjFiVlJj?=
 =?utf-8?B?bDhwZ1p2WGZ5OEcxMTk2czQwQkQ3MXFxcm9Sa0pVUi9PaENGTGV1SzczOXNj?=
 =?utf-8?B?OHF3Q015MjVWb3BLS2RobExoNEduMVhoeWlwNzlCeHh6cVpIU01SQnlCWFRJ?=
 =?utf-8?B?dFlUbTV2S2g3ZVYwemFQQVNJRzdpV3Y3R0RPVXluUmN5ajJTSVhnamtSbFBF?=
 =?utf-8?B?VWZKQ1JOTUNFZWhDSWNMYnZYdXdmRFcrRkp2d0ZBSTdtWERNNVhlaThyRVdj?=
 =?utf-8?B?YXVHczNRdk16ZjZlZ3NieE5EZ1ZBdjd6QjBabEhublptYU5aM1J1bHcwWEpp?=
 =?utf-8?B?YVIrbDNYQWRUOWNFR0YrZHNGWHlXSmRrOHY2bFo0RGVCYmcweVNpMksvbitl?=
 =?utf-8?B?akRQNTZqc3Y2WkVKZGttdlpYeDJrcldmVUpyUHlUa1NMZ1hpUHA0eWJPYkxL?=
 =?utf-8?B?UGtQWW5UL1NHcmdZUThpT0Y3bEJyWjRuUE5zUHVjM081YmR5YnhuMFM4NkVI?=
 =?utf-8?B?amdpMFFEMHVVbkptaUVFR1pVSlZEeHU2TWwza1duRk9CdUtJMXBxV1VPQ05w?=
 =?utf-8?B?Z1AxR3QvZzI4eTU5V1VVOEpZR0V6WWpzcHNLV1JNZmdkQU1pZkJmU2VtQ20x?=
 =?utf-8?B?YVQ0K3pQM0R4OFB4c2Q3LzZuTEZ3SGoxWW1wNGFUUHgybGJvZmF0TDVzOThr?=
 =?utf-8?B?bUcyMnNadHpRVTh0NUlhbXZYRGVaYksrYVVQZGRVNzNqWnZpbEdQZ2VzaHRH?=
 =?utf-8?B?WDNoWnZoZmtZSjdJVi9EcWVDdnU5NlZQb0NwZ3lGUzZoUktJU1FQdDQ3cXVo?=
 =?utf-8?B?SkdYVkZ4TkFjNUlyZ1FkU1gxclB1d2N0bWdaUmV6bklURlFPN2xIbWhkUWdH?=
 =?utf-8?B?K2hEd2xNY2ZDMjhhRWkvZGNmRWRrTUNRYktJZG9ZU2dPZXp0bFRlaCtMdDVn?=
 =?utf-8?B?Z3JmSmFhcXVoOHdrMlNNQ2VQT0VaemdJUndRRmNrM093QWNwY1RZUVFuR1lI?=
 =?utf-8?B?MUsrSnB2WCtYYThRZ0dCcHZ4ei9SOCsxb3M3bFpPRG1Da2JEejhLUDhmUzBS?=
 =?utf-8?B?MzYvekx0VDhodGtnMi9RZFczQmxQSHVVbDZMVFQrNkVWM2FyNm0xKzBlRjVW?=
 =?utf-8?Q?X5z/Lp7V9sYKmARDlUW7+ViyKcID2yiY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekl5TmxESTh4amM1Q0RDZnNCWUY3RGN2cTFFeW9KMnFYTTFwNDc2VFMweWli?=
 =?utf-8?B?Vjk5M0xlV1JMNTZSdzVEZUs4a2tyM1V6V0ZqNlFzdTFXeVA0YUFwdGFGK0FY?=
 =?utf-8?B?SkpxaTRqTEpBQkxsQjNreDdFbXBvSk1zU1NxMVk3d01CNFRhMXJuc2l5dVpK?=
 =?utf-8?B?U3c2bHp4b1ZBUmJKNHhxN1MrQUZzSkhud0NSREJqWUZlTzRUQmhENlpvV0dW?=
 =?utf-8?B?VzhFMnI1OFlMdmdNRHU0ZGFxUUpTTFA4cVFqbFRqc1Q1VUsyZHRWcXh5M1li?=
 =?utf-8?B?bzBSS0g4NVZ1N2xxMy9tb2Q3QzdkVVZvRkRMeVRHS281NTZ5S1YwaGFEVDZY?=
 =?utf-8?B?aEFSeE9HS1MzT2hwSVdYOXJYbWV6Sy9tNUt6dldYNjl5QllUQWVyS09neTQ3?=
 =?utf-8?B?alBkZ3ZvQ05uRGxjQUhPQ2dteEJSSEJyWTNQTkJVT1F4U0NnYUp3bm1TQTZU?=
 =?utf-8?B?b05tN3BTdWw3RlhDT2tEcktqYVlSc3dkNDRlYkN6T0xIeWVBNDJ6OVJoNmZv?=
 =?utf-8?B?eUJrWWF1b3ljUlNZaWxJWDJvWUorWE1XQXhyK1VzVnpIdWNVY3E0d3hWZHFO?=
 =?utf-8?B?d0ZZSkZLZGZJZW1Wcit1RjFIa2Fua2d1eXN0U3JEUEM3YUNNY3RQSnRPWVVW?=
 =?utf-8?B?SHE1ZWZCVDRCaVFlNTMvQnRqKy9MNytSTlk1Mlh4NlNZOW45bHRkbW9qQ1VX?=
 =?utf-8?B?RVY0ZnJha3VSWUJ4c1JqTFpWODBXdUJHdlV6Z3pOdzBHQ2g0ejdlSWtvZHN4?=
 =?utf-8?B?VjNmYjVEOUFXZVUwbmRLNVMzUlZha0lsR1l1d09VOWVROHVRV3RSelNUeExj?=
 =?utf-8?B?VUZyTWgycUh0WGE5VGhycVBJaysrOHFybGFHVlFHakdIYmpGTkdkSGJmY1VK?=
 =?utf-8?B?TzZrNm9NQ0xOK2ZvMjgwSmhkTG9ib1VlVUNTMEFodnoyYmpnRXZ0WFNKYmhU?=
 =?utf-8?B?bXN5RDg4TjFkNUthd0J3K0pTVmZGUU8zQXBqYW4xU3R3Rm95ejAxcXpPMUpx?=
 =?utf-8?B?ZHhUM3JaQnRBT3VnYWt6MFRXdDdCNVRjUXptUGd6cS9CUHJVbWJvKzdoTUN6?=
 =?utf-8?B?dXdIejJBdmhFN29heUdTWmM2dXhSSC95TGkvUkR5dkkwSTRQMUhuMFNPMTEv?=
 =?utf-8?B?YllkSFY3bEpaKzlhd2JlZ29pc0NtMVV3Myt0YzlLYVZYbzc1OGFwRk9aaUZl?=
 =?utf-8?B?RjNyZHRUNzBtZ1BTY0tPcXljUHJDVzZNaGgxUUdaWGpZQVFRdVVQZzF1OUpp?=
 =?utf-8?B?NHo1MlZqN1lGZ05naDZjWXlYVEl1Z3dyNWs3SzY4STFla29ZVDJ3bTdIbzRz?=
 =?utf-8?B?dGRpZEVySkRFQXNvdEJDb3dHbEdVdFlWbUJNK1N5ZXRyZCtRcGlENzR1dXZV?=
 =?utf-8?B?dk0vUmlnRk5YZCtiMW9hSXlLV0o4a2VQMHZheCs5RUdHLzZ0cWhDWTZSVWxF?=
 =?utf-8?B?TlVVa29nSzA0WEplTC9LUzcrNGVxa2VHM1FBOWQ0ODI4VVE2eTBIVE5KRnl5?=
 =?utf-8?B?elhhSjZPRk5hVmR1cWxmbWlKdzY3TEYrRjlrN2hlR2xpcjV4UzJkQnJSOHBH?=
 =?utf-8?B?ZkJZWk9XekdWV2JaZ1VMV2xNeXNrMk9YUDBBVEEwbFBWeDdUTUlUYXV2b0Vm?=
 =?utf-8?B?NWFpU051TVBJR0tXVlh2aFFsL2FZOEZzdGlaamkwdUl1bm9JNzB1Q0hxcWNw?=
 =?utf-8?B?SzVoR29xZmNSR0pjYTBaUTRFUmFKYjNQTjdjU0pOZTFuVXkwN3Y3aEhRTnBn?=
 =?utf-8?B?Ty83a0VTK0Exd3hjR3JmcnpMQmZqd2ZJQkdud2ZkWkRMTFo2TUxxaEg2cExM?=
 =?utf-8?B?NllFWG5FOEtOY2hFdDgveDBtK05ReFZqOStaVFRheHJ2QnZObEU3SFZKZXJG?=
 =?utf-8?B?QzI4ak5XTGNacTlKT1V1bkhSRkVWbEhkYVF5amRGb0I0dVlUdnFXOHhqbVox?=
 =?utf-8?B?OEo0WmdjMUIxcm5JYW1BZTliQWpTWFJ3eWgrd1JGclZ2SVZZVnpudzUzQTV4?=
 =?utf-8?B?ajRoek9tZnoxSmxteEVNRzVWZkNVMmtWMTN4dTdBNjhNdUtJcFVNd2w0Z0x2?=
 =?utf-8?B?S1pGdlMwdVE0U3BQNEhVQWVVR09ka2Y5cUcwcnRjUDFZTzNkakMwR2ZubXow?=
 =?utf-8?B?WEsycE1jckUwRWdzZHdldmUyWkFCTzNCaytRZStaNWlRRm96aUJIeno4cFN3?=
 =?utf-8?B?OXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83659308-ba41-4d6d-7c9c-08de38cb67ca
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 15:39:00.5561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WK91mGF3QBvC9jgCqj+vtm2l1QKRoK/gmvO7vhQiPc2vnMdHCl6x7ka+HPhaPGg6L+bRKhvFnmY0KLmJ6ygPqy8v+MCRdCUb0P5McjbGiq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7433

On 11/12/2025 10:31 am, Alejandro Vallejo wrote:
> Seeing how both you and Andrew seem onboard with dropping cross-vendor support

I found another cross-vendor dropping which you'll want to look into.

struct svm_vcpu contains three guest_sysenter_* MSRs.

In AMD CPUs, these MSRs only have 32 bits of storage, with the upper
halfs write-discard.  They are switched via VMLOAD/VMSAVE.

However, in the cross-vendor case, the upper halves are needed for 64bit
kernels setting up SYSENTER support.  Therefore, they're unconditionally
intercepted so we can avoid losing the upper half.

By dropping cross-vendor support, we can get rid of these fields, allow
the guest unconditional access, and simply the MSR intercept logic a little.

~Andrew

