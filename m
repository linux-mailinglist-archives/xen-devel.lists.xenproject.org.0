Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D75C5C2E6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 10:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162334.1490017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJppY-0002qE-JD; Fri, 14 Nov 2025 09:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162334.1490017; Fri, 14 Nov 2025 09:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJppY-0002oj-G1; Fri, 14 Nov 2025 09:10:56 +0000
Received: by outflank-mailman (input) for mailman id 1162334;
 Fri, 14 Nov 2025 09:10:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lhp/=5W=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vJppW-0002oZ-U8
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 09:10:55 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d112d474-c139-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 10:10:52 +0100 (CET)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS7PR03MB5494.namprd03.prod.outlook.com (2603:10b6:5:2ce::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 09:10:49 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 09:10:49 +0000
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
X-Inumbo-ID: d112d474-c139-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnEWTS8U6vkarGGwFzdu2rmCqxEvvISIfqC07oEA5ye0/+fMQ6EtCmipXKMrC4srCvFUFpLz/ZIbbwTXsxkBD4CCoBk2vOT0wIaSXeSJJH5XIhGWERVJrqYsWMCm85iIoqTVcNljSfQasZK4f6FvZQAtfAx9xR3XyuZD+G27aqhM+a7dXpi0d4/CyDt0gKaupkB2I34qDxWAVCBSGzF8kfDGihzlYMxnyahFWORfPGD36cczOL7cdFl4IfoiTSN5GrIxnfRutJDro1g1h8DA91adN4bK4ZPPbcQzwLEGLI7hZiTmYRFJlLGvpUjyt2GkIeP5g/p/YdEOj+29AaFtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hr7DTJIufm0p25oj4sCrlf1nLSZaUAmrYro1EM9XGcY=;
 b=kXhpKH4t+M8V4a41ucJDVJVK+Pv7dw3DcHcQCXZ5a8CPAKACZSLJm/1V2jtv85cSVDF+xjUEYoeXx0nANKtwh+3Qs7sqS3BjEWopVPOcbTG63NKuIT+XsfkdQevUQtQasRccNZeza8JIj7zVMBZWWUzB8ylUshpH2A3ux9x1odfAusbIps2rUQbDQ2V07SEUohF4DKNeuf5L8g7pRFRFME8pEPt2S9GV66APAr+LswW0YqUbgXFIU6iaABqCE9M+Ba+fCUfwLxHtaJY93a3jCjBzAT3cYdLHBncZb5MZ8iXlmo4KqeTgeIN4yTzwkFmOPqlR1K7/37TOORL7Nlszsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hr7DTJIufm0p25oj4sCrlf1nLSZaUAmrYro1EM9XGcY=;
 b=HLtLHAZbY/zirQLNRY5bbo/YEhADWmYwIqQE/Y0HsePmlOgdj9UWZO7lpboMAE/fad/mHXSAG3lpkqDMeyVtteLCRMqvSkLKbO02pS7kIebwbur+TIrUyFRQH7a0j3t2BEXvob+KvZBK9aizF2MC9AU/+IosW3Pa4qqtKb3Hnk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 14 Nov 2025 10:10:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/viridian: use hv_timer_message_payload struct
Message-ID: <aRbyFugnEJojSH01@Mac.lan>
References: <20251113172413.87938-1-roger.pau@citrix.com>
 <353236f2-2864-48c2-ae9c-e3d4a2aa5537@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <353236f2-2864-48c2-ae9c-e3d4a2aa5537@citrix.com>
X-ClientProxiedBy: MA3P292CA0017.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::8) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS7PR03MB5494:EE_
X-MS-Office365-Filtering-Correlation-Id: b8201af9-63cb-4bc2-5d21-08de235db3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UW9SSXRiV285M2VBNXFPWEVWVHBqVXdOcWZ6WDc2SHN4OWpjenJqSERGZ09T?=
 =?utf-8?B?eVJJVFZqcDh2THRmT0VMK1Npb1pHTHdIOU9RM2F5T3BQTmxIZU0yYUxkb0Va?=
 =?utf-8?B?eFRBd1g5QXpYcHo1OHc4T2tLbWpUeFFZZ0tYQWRBQ3dFSzhJWi94VTZFcU53?=
 =?utf-8?B?ZU9UWFRIZG82U1Y3SHdmWW54UjRaVXFWRXhlMDB4c2hSYUE2SEVxc3JhazZx?=
 =?utf-8?B?THRLYUpSSlF3K2hOdXZoYndVbWlpRVA3alRhbUV1aVFBSTMvZTU1aTdlL2NF?=
 =?utf-8?B?UnVKZEJkR3l2T29GNjdsdWZmNjZRS3lnSWlTK1g1eHZCQ3l1RGJiQlk5OUhh?=
 =?utf-8?B?U0hxNHdZd2tkNHA4N2l4dWMzT0huRkJta1ZKdkp0TCtmVGU1b3d4NVBheG9V?=
 =?utf-8?B?UUtFWGZha3hNamRHaXk4cXBON3lITmVJNlVLZWhEbkNuNnVaQkUvdVV5QXRC?=
 =?utf-8?B?K0V3WklxalJSL1p3V0VWSmFSNHNvUXYyeFc5bWRuN0xwb0lvVE5Pd20rOFVG?=
 =?utf-8?B?V2RjYW8vYmt4aHM4anMxRXVEZUhhTUtwbmtjSG9LWWZVQ0Q3R0tFRlMwamE0?=
 =?utf-8?B?SmZmWkxtalB3UmFmOTNlUlprMklMd3ovSU5ZYlIySVM0dHAwN3NjQTFSZTU4?=
 =?utf-8?B?YWYwcXdhb3JmdlVibTFmL0gwdUdBZTEzekp2bHU5SWVXZTF6VEJaSjg1MFhU?=
 =?utf-8?B?U25CVll4Mlg5Tjd3S3JodmNoeHowT202MXd2bG1wSjE1UTNaUDNiUXgwWk93?=
 =?utf-8?B?c3BzV2J1QkFyamZMRzludW9GZUs0TGVCQzlGME1nUmNuaHlTTStGcWd6ZlRR?=
 =?utf-8?B?YXNsRjgwTGFxWjVxOUFNQXJ5b3pLRWZ1UTVkeDdiTjBQRXFYdXNTWG13N3E1?=
 =?utf-8?B?ZnBBTU8vNDZyMVpBaC9VRUw2QmVHODdobm5Eb2hYTHFXY1dJWlZBZU5xQ09M?=
 =?utf-8?B?b21IeExyV01XNHlDem04YVdKbzRxeVZaM1IxOGlHbXVIZnRQWWtQUHVNT2Zq?=
 =?utf-8?B?RXN6SThHbWhDOGs5SEtwbXg4UDY4RHdkUFhvdDA4SVpmTWpKMU8wVEM2RjNa?=
 =?utf-8?B?S3BJZ09McjlVZTlLNHdYYVVqTjFSZmxlbDV0ZEo5dTFjRlcvR2tzay9EbzJq?=
 =?utf-8?B?cnJXOFpxeFBHOWs0eFZvcGM5a3VEamYzSzdTVUhQSUtndTM2azYvYk1CbzBC?=
 =?utf-8?B?amI0bko4c2xtM3o3cWE5aW9RV3E5ZHZ1RnRva0FSK0VSODZsaXRGTzc3ZE1L?=
 =?utf-8?B?c3gzWGE5S0tReVh0MVFha1BKSDNjK3hYdmorZWY1OXM5dE1Xc0p6Z0xhQjNB?=
 =?utf-8?B?dysyTVdadnJBeGtaN2loc1pjOFFadFgvRGpBTzVUMEtOeDJwUWw3TGtGWmpn?=
 =?utf-8?B?TU1TRjhad0pDL0xBdW5SNTdtdE1Ea0JEemVEb052N3FURUpmditEcFJCUmR0?=
 =?utf-8?B?TzZuQVNRWXV3ZTVkelViZ1N4eURaaWZFV0JTdUUxVFdUbmFpZi9yWFZmQlVF?=
 =?utf-8?B?dUZxL2MrQ0NkczJQU2pEVzBkSk5jU25DOWZlUDNCQUxTM25tSDlzQTBpdVRJ?=
 =?utf-8?B?RGR5NzloZUxBdDlkUFhCSlNhZVdJUXMvRmY5MitJY002VlAycjlrMUo3cDJN?=
 =?utf-8?B?TUY5MGVJbDlwTk04dlVnMUVrbm5HQ0Q2eHhWMW9QOTd5dThsMi9FZWZzZG0r?=
 =?utf-8?B?a1RYTWFSMC9Qc3o1QWpyeElUZ2NkYWYwUTN6OGZQMFdvaGNkeHRJV0FXaXg2?=
 =?utf-8?B?S1RYakpEVTBkVXlqSGw5U3pycEk1aDdHQm1VMHhjNXZYdjdLSmpLcmNUVXU1?=
 =?utf-8?B?bGttY3gvMVo1SjJPMzlsS0orSDlRY1B5UXlDclRkY1dCalZsSk16NnN1Y3BM?=
 =?utf-8?B?eDdJdjJUMmZCc0JyczdvVDBFY2NEbENTV1FPZ3VvVGRIZUpSNCtBS3Foc1do?=
 =?utf-8?Q?N1LRTsKU1SpziO7dDeC4+PnW/5Ap+iVs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWhRb0dLQUpBOHZmNlNreXY3L04zY3B3S3c4bkx2SHd5ODQvVld6SUkrTFEy?=
 =?utf-8?B?eVVqd0ZNckxGSHlCUFBXZzJrSUZacUkvdzVzY21rVTV4c1dOc1hxQVczVm43?=
 =?utf-8?B?c0ZZTFJwL1RBRlhZUkRkZjRmUlpoV2hCWTd5QnpaSzlPNU5BYklKS2wzV3A0?=
 =?utf-8?B?bTJPZjROTzJvbmhTKzBROGdjK0paRWtZcVUwQjM0ZkZ3KzBMSThjSGpQa21C?=
 =?utf-8?B?dldxTjNyQ01WZU91akhXcHZ4ZzN2ZHAyTGE1ZXpSVnFNRWlRUlVheWZoVXl3?=
 =?utf-8?B?azJGaHlVYkRHeUl3cTNUcGc5WDlId3Ntc0x1UGFnMkFRTUtjb3l2dnlnaGM5?=
 =?utf-8?B?UmdkdXErL1pFamdiUTVCVlFVM1V5UlJuQ04zUm9TNmQvWUpLZ05PYXhzaWRR?=
 =?utf-8?B?NUJ6RklLQ2xEZ1dEajIvWUZod0NuNWhoYzNUSnNTMlp5TGFHNEY3eEI4Z3pD?=
 =?utf-8?B?TmJPMXg0aVV6RTdnRFBzTDc0NitRbTN1Z0IybmJWTnZaRVhkVXBCRTMzODFB?=
 =?utf-8?B?dVV4ZmRNajk3Y0xiaE9WL2I0TkJjRStZSklkVWNlakdXcXc3ODV6WUFkN0Zi?=
 =?utf-8?B?b1RTd0ZzQ25HcUVpcjZEVENIdHdYdmV4V0VpallCYVVxa29TeGFQYkw3V2h2?=
 =?utf-8?B?WjlmMnloQmhHRkcweUNwQVFHdWlsMFdLYklTNFN0eU5wRXZSQjFvWWhlOFR3?=
 =?utf-8?B?VjgvN1FhZG83S0h0djZDMWczWTh1NU5QQ3VXZWQ0ZnJ0YUZtb1dFVWx4bHdp?=
 =?utf-8?B?endObktFeW5EdDkwWEVvTGFhQ21WYSsxY1ZpeVR3Qjc0ZEFkMzBzcmE3eHlG?=
 =?utf-8?B?eDJHa0x4SGEyQ1RSSkRKTm13WjRSaGF4QjNEYTVvYndWWlFUTHBhc3NPTnQw?=
 =?utf-8?B?dGFEZDdLMnJDaDVkSncraW9tKy93TWdxVys5b3RkREtHK2NQdWlFUXpjS0Yr?=
 =?utf-8?B?cWhPb2VvNGY3aG05TEUxTWdIQ2dtNFptbStJTXJQZjJKZjhPMmdHQUJSSHhq?=
 =?utf-8?B?RHduS2IxK2krQWl0TWN4alJwcGRPbEFPdVFSOHY0RWZFNlZzNS9sR2xGYSs0?=
 =?utf-8?B?ZkVLWUovRjUrRXEwRDkzV0RoazdQdzJzUTg5UVJFTmE0NFhRQUtwTmhEVDFE?=
 =?utf-8?B?dUlQbTRHbUdVTFBKeG1WSHEwamxyVnZPNzRKUktWSWlLMWpBK3ZtdzdpSldo?=
 =?utf-8?B?RXVLMloyVVRvUTA3VGlQTXgvc3NMTkdRMXhWTDRmWlQxYzlsc1dOMzJrdHR4?=
 =?utf-8?B?NmF2Y3d6RWlPVXFEczdsdGdUSXFuMmJiSXgrcjhidHlNaXd2V2VuSHFyRDJy?=
 =?utf-8?B?dDhKc2hJdCtkTmlrL3c2WTN3Mm1XUEtiSFZUVERQYm5kL2VnSTdIUnFMMEtX?=
 =?utf-8?B?U0lPb2ZsTXNpSUF0U09TNkFhWENCS2ljU1hxclozYnJhRkIvVmJ5b1BuSXIx?=
 =?utf-8?B?NVJ1eTJNeE83dFBxQUsrQnZZajFTd0NiSEppVWprTVB3V1NpTGNOM3RSYWxk?=
 =?utf-8?B?Z0tPR01KbUtScFR2c0NwMUp3UjhxaG92MzNOTGZFTEFScXMyWTJWVzd6dWNi?=
 =?utf-8?B?Y1BydFpMay80dFd5RFhZZUtDNTY4OVJEVSs5aWRvZmZhMENUQWduS1N1Tlpa?=
 =?utf-8?B?SlBBUkxlTlFlSDRqUWVSU0VTMDE2UFk4MWpQbEdDemFXck1zQjhoSXF4eXdp?=
 =?utf-8?B?K1ZIdUw4bms3dXNKU2pselo1OW5DYmR6bmNvSnQzTmpPUk0zeUtZaHUwUHdE?=
 =?utf-8?B?MnJDQncvaVhkd0FnaS9tdUJmb0p5MHp1TXp1K0hpZTNmb2R6M0I0MDhYRnpo?=
 =?utf-8?B?eldKbml4RThtcERsd2hYZ1JaMno4RzNFMU9MRjc0RFVyMlBLSStKaGZWLzJT?=
 =?utf-8?B?WjIrdlNNb1B6ZzhCNnVFeTY1bE02K0lScHczQ0d6K3dVcTcvZllJTUt3dVFT?=
 =?utf-8?B?czNxNmdVU25yOWV4d3lGdzNueUE0SnVJT08vZzROQ2xZSE1MVncrRlQyc0ky?=
 =?utf-8?B?VWZWcnVoS21YcE5oVXRCeG5Oa3dreFNkeUNIMCs1MHBiaDlEek50U1h1bkxn?=
 =?utf-8?B?clF1THNLd0tlZmExeWs4MlQ2bVQyQUFTNnlUU3lBK3NZZGV4c3VHUUlhaTVv?=
 =?utf-8?Q?jO+7vdyAk26ZPqs9BOqcHShZw?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8201af9-63cb-4bc2-5d21-08de235db3ba
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 09:10:49.4891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sn3WR65WSGihZIusUnUQgF4Bj2VSvtc4sp6sxJoSYHEXft9RpIcAh93dNTMxnWyFbUbWTF5oEPgFiq0MoN9FUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5494

On Thu, Nov 13, 2025 at 05:52:47PM +0000, Andrew Cooper wrote:
> On 13/11/2025 5:24 pm, Roger Pau Monne wrote:
> > diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
> > index e6cba7548f1b..6d7b6bd0eda2 100644
> > --- a/xen/arch/x86/hvm/viridian/synic.c
> > +++ b/xen/arch/x86/hvm/viridian/synic.c
> > @@ -327,15 +327,10 @@ bool viridian_synic_deliver_timer_msg(struct vcpu *v, unsigned int sintx,
> >      struct viridian_vcpu *vv = v->arch.hvm.viridian;
> >      const union hv_synic_sint *vs = &vv->sint[sintx];
> >      struct hv_message *msg = vv->simp.ptr;
> > -    struct {
> > -        uint32_t TimerIndex;
> > -        uint32_t Reserved;
> > -        uint64_t ExpirationTime;
> > -        uint64_t DeliveryTime;
> > -    } payload = {
> > -        .TimerIndex = index,
> > -        .ExpirationTime = expiration,
> > -        .DeliveryTime = delivery,
> > +    const struct hv_timer_message_payload payload = {
> > +        .timer_index = index,
> > +        .expiration_time = expiration,
> > +        .delivery_time = delivery,
> 
> Align these = for readability?

Sure, can do.

> >      };
> >  
> >      /* Don't assume SIM page to be mapped. */
> > @@ -359,8 +354,8 @@ bool viridian_synic_deliver_timer_msg(struct vcpu *v, unsigned int sintx,
> >      msg->header.message_flags.msg_pending = 0;
> >      msg->header.payload_size = sizeof(payload);
> >  
> > -    BUILD_BUG_ON(sizeof(payload) > sizeof(msg->u.payload));
> > -    memcpy(msg->u.payload, &payload, sizeof(payload));
> > +    BUILD_BUG_ON(sizeof(msg->payload.timer) > sizeof(msg->payload.raw));
> 
> This BUILD_BUG_ON() was only needed because of the memcpy() between
> different types.  With structure assignment, the compiler will tell you
> if the type mismatches.

I've keep it to ensure the size of the hv_timer_message_payload
doesn't exceed the maximum payload size (240 bytes), as
msg->payload.raw is the maximum payload size defined by the standard.

> Therefore, it's safe to drop.
> 
> Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Let me know if you are fine with keeping the BUILD_BUG_ON() given the
justification above, as that would be my preference.

Thanks, Roger.

