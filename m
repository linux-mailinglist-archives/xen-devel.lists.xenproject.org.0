Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7289BC6028
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 18:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140003.1475168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Wwc-00017w-7z; Wed, 08 Oct 2025 16:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140003.1475168; Wed, 08 Oct 2025 16:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Wwc-00016V-5J; Wed, 08 Oct 2025 16:23:14 +0000
Received: by outflank-mailman (input) for mailman id 1140003;
 Wed, 08 Oct 2025 16:23:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tb2B=4R=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v6WwZ-00016P-Uc
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 16:23:12 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 140a0668-a463-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 18:23:10 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BLAPR03MB5412.namprd03.prod.outlook.com (2603:10b6:208:291::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 16:23:07 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 16:23:07 +0000
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
X-Inumbo-ID: 140a0668-a463-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMePLhKzS8/m2z+RLbt9DrLYBf+ENO3klH/Kb7QglO5l3dekByl2FBSBgOhgtYdIQYwk9jeqFG1Y703CVDLbD/MYqtIIj6nXM+H7v8Awl4kmThyz2aMkIXD5b21iyOPiRwxoCozRuVxHyv+wg9qNriT/7RMauuCGnquQTPxyh/HAcfniS+YuDEy/rIrua5tDqVnbLv7Jo+wih3NOha27HJujO/vVaNDelUjwVsJNrsBHd4xItzhMRBtKidD0iGoTemTFt9g2rY+X4i96qDoWOtDILW8z9IB1AnkUiBOUNqT5f5jcQ1bUeI2EOi5opD08mDXHGwCJ8jZMz2wKRY6h0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlPKlSN0Fj/ppB78sd5/kxjKKC0lLI+T8NZZLmiIVwg=;
 b=U0gbUMbGVYO+kmCkDkKViwV0bKzUs+f/s6OPpySnAFzqTjjzJTPbbiMj+CxK3fVwE7n1zIgllGl5rcHJzpVmzXo00ahrieDQQgwUbNB+oSmjRmAZRgAwFJnjQuiHGz8HCHG9/pxEIjA6tXTUua5nFmkrTCJjHitzA4FNMoDBcvCKCIT+m7hisOhCaDBD42+8EGpAKicH3F3NHMnT6BlxKiR0zz6C5tpRy1C5JkKonSg13jrQ0lOl5myyhPdGTwKHYgyyFVnzYSE7e1LVQ9K6F0bMZ59XgL/mCR4c6igwlLoluB80ES8am7rX3JUOGYS0JfV/iT/44EtXsMgp2LZ+Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlPKlSN0Fj/ppB78sd5/kxjKKC0lLI+T8NZZLmiIVwg=;
 b=jyOIJDc9C/Swgyxzb3655RsdIiffDVxwto2lTOd9wZh1w747QxJldzPvAPGrXdgM8kldhbOg3QZwdsJHP31kIJTVnLsKFveoGTf0yT/jWYmFyjYM7fLVqDtt4cSKHljmII6K8qLQn4zyGkouDks3r/8rnt1HN8X/Qdi9Fn0xdeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 8 Oct 2025 18:23:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrew Cooper <amc96@srcf.net>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH for-4.21??? 2/3] x86/vLAPIC: drop VLAPIC_VERSION
Message-ID: <aOaP54CZw8lgLLUv@Mac.lan>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <feb47fa6-27a0-4cf7-8fc6-bf5f29f467c1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <feb47fa6-27a0-4cf7-8fc6-bf5f29f467c1@suse.com>
X-ClientProxiedBy: BN9PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:408:fe::10) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BLAPR03MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: d0bca6c3-e5fd-460d-3b17-08de0686f675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFY3anA0WGxzZU5sR29MaURIRnRMc2p4dnY1dXlZKzJpM2Irb0ppSzM0dlk1?=
 =?utf-8?B?NXJzZnZSeVRwNzJYQUI0WG5vS0M3ODR3MytQampMRGcwL21Jcmo2SGd6UHB4?=
 =?utf-8?B?VjFyNWdTRXVLQUR2Nkh4SG9EN015VFk0VEdvczMya3l0dCt1N0F5QUE1cmlI?=
 =?utf-8?B?UjQvY2VYZ0pwdEp2NVRha2xSZ2FHci9GTWxaajhiWHFRaThoUXpXTnZ0S01I?=
 =?utf-8?B?STBLR1J6dGtXMXk2NjRyRElWdmVJSVZBUUFLTTZRZHpyUGNTdTQwcTFRcURF?=
 =?utf-8?B?aG1vV0ZoR3F1aTRSRDZObEZnYW5tM3hpYzkvbEZBN0JhdlppVjFlUEpBRWR4?=
 =?utf-8?B?UjZPU0NLOTFaOUtDRmloUEVDSUhzTXJvL2cyNERvT0lUZ1FPWE1Cckgxakc3?=
 =?utf-8?B?bnlmZ2dOeUFrd2pmZVNvdjB0QmkxV2hLZElFRjM2S3l3UVV0SndzTXE1aTk4?=
 =?utf-8?B?OENodmpHd2hNR3hzQlJTS2U3R0I1TnR4T1lqeUhhY3ZVKzViQiswcHdINmZu?=
 =?utf-8?B?VmFLbFlsb3N2cWhwQXdUK2RZejlDY3VlYldGcUNVanFEV2JwZTRZVWhZbUpI?=
 =?utf-8?B?dGh0YVFVOHFyR1djbTV5RFdnbFJ4TFBiRHRudFdXU1I5Vm1KVlRaRU1ibUIw?=
 =?utf-8?B?UEZMUjdKdzlSTm14NS85c0ZJQjJVb05seCtValk5YUZ5R1ZjalJBeDJRbmll?=
 =?utf-8?B?UW54UFlLTzRhRTFPL0R2MzZWNFd2UW41Um1RaGttRlBrdVdQYUJQc2FFSWZQ?=
 =?utf-8?B?SHFIV1licFc1NFRBenhHUldaMVYvclRaK2xGaUtLTzM5YmJMcktSblBWeW1Z?=
 =?utf-8?B?NDVvMmF4S0lhc21NUnFyVVdvSkZRb2NnY01Gdmszc21IK1c3VlJKZXlpS1Yr?=
 =?utf-8?B?Y2UwQWluMHNycTd3bnNBRFRYMXpXOTgzSXlPWGxWT204UWRUeTVpZGl4Umhh?=
 =?utf-8?B?VWtBSTMrYzVVRnlUbmZ2cnRLUXNubVJlM0x1Zkp3VW90b0dCcE4vV21BenFF?=
 =?utf-8?B?YldhdXY3UHpaM01ZWkJ6RzZMbFJvZDFsVHpBdjA5M1QrTFhqMFFYM1Y4SWpn?=
 =?utf-8?B?eURHMXgvVFgwMis5RDV6bmJUZTNzZUJYYk1OMk0zcSt3SHp2WEdWdlBhSzJF?=
 =?utf-8?B?bXlYQXRmZE1aaFA3UlJKSzZBUUtHZFJUQmQwY0ZrMWIxT2plOUc0Q093NjhX?=
 =?utf-8?B?djdvc3p0bzJIRFBHYUNRYjR5ZHNiYjJ1cW1iWFhjUzBKM3RuR01ibHF0S2FV?=
 =?utf-8?B?UGdjM21PZ1V6MTdibGVORVgrV3d3VFEwNmhvb1l4elBOaDhzS1NrUG4yRWdT?=
 =?utf-8?B?cjI0Z2NtdkRYZWxMaHB5RDhpNVcwb0xpR0RHUTlrMjRvUXRlUWtGR2poaWNz?=
 =?utf-8?B?K2dXMlc4MjY4akRkUlR4UjlpWXhXa3h6cEljZmlWbFEwVkhKWE0xSmpHK1hB?=
 =?utf-8?B?bU91K0RUU2NYdFhjdHdMM1V3Z3NWSjh2ZVh4dXNVUVlqUGd6cC9rT214NG1h?=
 =?utf-8?B?cnFQN29CeG83dUJOWUR4QWVCN1NyTkc1VzhHeWlRNlgybkRnKzdzRmdjM1Uz?=
 =?utf-8?B?S3NWRVdTNDd1U3Q0TGtkZzZ1dWZaWFI3dDNmQ05NdWY3dGhya0xobDA4RkdG?=
 =?utf-8?B?dkxxSVF6T1BqWXQySDNlaDI0TTBzYU1EaWZWKy9DaEtQeHR6RzFPTHhUMksx?=
 =?utf-8?B?a0s4amdKNlAxcTVkQXcrWkhiYUE2ZzZZR1VSNWQyZ2JsTVk1enZzVjBrOXZY?=
 =?utf-8?B?b1UxSDhlYUxWTklVd1pFblVkbmc1dWlRTy94Y1NHVDh6b2lOTHhnWFhIaFYv?=
 =?utf-8?B?b2M5SE5YeXJHRnJBVlR6c1dsODlXNWRTMkJQMk5McTRMUXVnczlYQlNsd2hh?=
 =?utf-8?B?dkp1RHg2NUJOcThUVEZQbGEyOFA2bEhURVQ1cE0yeDc3UnBZcUJUNGxRMVhC?=
 =?utf-8?Q?Vi260b5bU9FNsQCBM9fJLShsRerI6sTr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEFkQkZrdm9wRXNxR2JLa09XV0ZaeUl6L1RDV202OFA0K3JpR3lJNXVLSWhm?=
 =?utf-8?B?MWdFMG04MDJUSDI0QjFIMHp1Q3lqSVYyanV4MDlzNERCUXRnNjI1TVZVUjE3?=
 =?utf-8?B?ekRDUWdJZkdRcHEvUk9rMHZEUG53NEpDb3BYUmJlUlVDRmdDSnN1dVl3SDhw?=
 =?utf-8?B?N0ZSak5LSnRmbkJJNUJTdU1tQmpEaGVhM013T3Rxb2VGSUVsZlNtMWFJUE9D?=
 =?utf-8?B?bEZjcnZDSUN1YSs4Z2liOGtUOEl5SG1wRVI1WFJwWlVWNHVvOEZXTTMxVjF4?=
 =?utf-8?B?Y1NNTjdpazZhbUplZDIyNjZaYlc5Q2Z6L0VpaDRmcHAxRDhMZmRFOGpYWUVW?=
 =?utf-8?B?bTJwakZNUmRPWW9QVnJZTkpuL1ZEZXppVEZsR3lrb1VVeG00SXJIUHlKeTJN?=
 =?utf-8?B?ZEx4V0pPMVcrd3VuMjhTbTd3TG8rMlA0Tkd6YlBuSlFGN0xtbXJOOS9CYTE5?=
 =?utf-8?B?ZGhuY2YyenkrZ2hPK3ZHbWYyZCtDMXRMS2NBNkJaQ0ZVdENjN05RdXhHUmUw?=
 =?utf-8?B?ck5pelBXWkV4Skx4S1loZXQ0SnNJTCtKN2d0eU5udzhWQXFxOUFaZnZlSzl5?=
 =?utf-8?B?ejNOcHJMU2NOakpvNjM1ZkpjaHFVWCs1b0lMMEF4TTZvLzZZaFhDdHJmV25S?=
 =?utf-8?B?K1hHTFI1VjVaSnhwbWU2NzdnZ1hiUHV4czdacXhlVG9QZjlXVng1ZTE1RGdI?=
 =?utf-8?B?SkVhZkhPR0hONWVzZEdlN0tlekcvZndhdHFNWEExTTRZNENHWUc3b1p2Vjdt?=
 =?utf-8?B?bFZ1SUhvS1NxQ3FzVFNyVU1hRU5vcm1pRDNCZUtVSTNFdUNPMU12eUpBNlJx?=
 =?utf-8?B?ZlFraitQaWVZRWduU2N6d1l5dWNIcDBzaXh5NzU4VittWURMTUxxcTZ6Q2dj?=
 =?utf-8?B?Nk5tamFKR0ltK0FiUTltbnV1cWxpU2drN2dXNHVJMDYwWXduYVNCUGFJeTNp?=
 =?utf-8?B?aVdSbktSQW5XZVpWTzhPTjdsY1AvMjdtWllWZVFmTWQ4enowSkJvUlFCZ2RM?=
 =?utf-8?B?dnFOcVBBVkFIMk44c2VlaTN6eXQxZC85ZjhGS2phOEIvSFlWajZIc0tpenI5?=
 =?utf-8?B?Zml3NjNaSkRwT2FHQ1hLS25CTGRRMStENVAxVzFZQ2d1a3JLaUQxVXdCUlYr?=
 =?utf-8?B?bnpQVnRjMHFCd2Y5Y2tsclR2WTA1bjM0STFsU2FFMXNFRGE0NGtDU3VodnQv?=
 =?utf-8?B?RnRGQUVtd3ZTcWZDMUQ4bmRXSmx5bkNnZTFpdGxBNFpuRU92dURhTE03Q2hE?=
 =?utf-8?B?cmt5L2VpOGNsNkY0YmlOeXJNeU1JQlJ2ekZaL2FFb0FHYSszcWJSa3RORVFZ?=
 =?utf-8?B?YjRJYTRGbkJBcnI2WUxJUTNMTFB2Nnl5M2YvRGdUczdMR0xxTEYzamZFdWRp?=
 =?utf-8?B?aWphSzgrd2Q4NHl5d1dscytrMDd1RG15WEZiR1NWS3RVVzRxbmRGZGhxSzUz?=
 =?utf-8?B?WUxpczgwc0dLRGE0NXp3bzdDTHBKTHQ4OU8vaUpXZG1VOEZoRi81Mm9tR1JD?=
 =?utf-8?B?b3FqMnVwRHZscXV1bFRWMU1wdm53djdCT0pnTjNEOU1qdjJNZUNCL0dZVjd2?=
 =?utf-8?B?ZVlOYVh6NzVzc1oram8vaVJxMENtNHI2QXMrUHVGOU50cy83bG5acGczK05q?=
 =?utf-8?B?dXpScUkzU1hWNlpSekpNWkVBNVNGVGZEaVA1VE5DQ1BRakh6TTk1ZjA0RXBw?=
 =?utf-8?B?aXR4K055WDlzRXoyNHNJVENKSy83OC90UXYrSGZkRlQ4SDl1b2dtWWZ5aEJj?=
 =?utf-8?B?NExEY3FxVnJTNmV1Q3FWN2d3bll6Z1BmYkdtdWRxQmliVFVDR25PYTZxMjBz?=
 =?utf-8?B?Z0tLbFNONW00WkJodXBFYkpUUkdXZE0yaklYL3g3K2dnaUtqR2NvTVhyYVV5?=
 =?utf-8?B?L2VYbm1oOUVuRzBWcC9aVzMyNjRlRVRZaEs3anVXNUpyRVp5MGVsRHF4dzZu?=
 =?utf-8?B?OFphNDlxRGxVNFNRT1FUOTlSS1BKWU9PSTh6czV5UDlXSXJCN3ROWXJLMzhV?=
 =?utf-8?B?eFdKQnZJSWtnOEcrWG4vQkxMZ3hrT0ViUlhhd2JXbExiMFlVb2h1S0NDcUcr?=
 =?utf-8?B?U21nWDg3WUdjdmljTk1MZWtPa2s5Tkp2YWtEbEp1NkFOVThzbnVEMFoyMDlS?=
 =?utf-8?Q?yss6UyiFvbyFqDUqVyewY6qty?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bca6c3-e5fd-460d-3b17-08de0686f675
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 16:23:07.0066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BQaY97KEHwcZbZkosMTA0WWze4WmPEuLHR6HH9nMbJmTjaNbPqDvtsWWaWTmM0FUAH9IGDxMck6Wj9LdmkkeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5412

On Wed, Oct 08, 2025 at 02:08:48PM +0200, Jan Beulich wrote:
> In preparation of making the value somewhat dynamic drop the constant.
> Replace its use in guest_wrmsr_x2apic() by actually fetching the LVR
> value.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -31,7 +31,6 @@
>  #include <public/hvm/ioreq.h>
>  #include <public/hvm/params.h>
>  
> -#define VLAPIC_VERSION                  0x00050014
>  #define LVT_BIAS(reg)                   (((reg) - APIC_LVTT) >> 4)
>  
>  #define LVTS \
> @@ -1015,7 +1014,7 @@ int guest_wrmsr_x2apic(struct vcpu *v, u
>      case APIC_SPIV:
>          if ( val & ~(APIC_VECTOR_MASK | APIC_SPIV_APIC_ENABLED |
>                       APIC_SPIV_FOCUS_DISABLED |
> -                     (VLAPIC_VERSION & APIC_LVR_DIRECTED_EOI
> +                     (vlapic_get_reg(vlapic, APIC_LVR) & APIC_LVR_DIRECTED_EOI
>                        ? APIC_SPIV_DIRECTED_EOI : 0)) )
>              return X86EMUL_EXCEPTION;
>          break;
> @@ -1439,7 +1438,7 @@ static void vlapic_do_init(struct vlapic
>      if ( !has_vlapic(vlapic_vcpu(vlapic)->domain) )
>          return;
>  
> -    vlapic_set_reg(vlapic, APIC_LVR, VLAPIC_VERSION);
> +    vlapic_set_reg(vlapic, APIC_LVR, 0x00050014);

(Maybe I'm getting ahead of patch 3, as I haven't looked yet)

Don't we want to use some kind of macros to build this in a more
friendly way?

We could have a pair of SET_APIC_{VERSION,MAXLVT}()?

Thanks, Roger.

