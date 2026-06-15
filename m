Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LUpLDnwoMGrNPAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 18:29:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0EF688613
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 18:29:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=DjM38lJW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338447.1599481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZABb-0005Su-K1; Mon, 15 Jun 2026 16:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338447.1599481; Mon, 15 Jun 2026 16:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZABb-0005QM-H9; Mon, 15 Jun 2026 16:29:19 +0000
Received: by outflank-mailman (input) for mailman id 1338447;
 Mon, 15 Jun 2026 16:29:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZABa-0005QE-88
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:29:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZABZ-000cwg-1x
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 18:29:17 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a302842-e002-0a2a0a5209dd-0a2a450ca3f0-40
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 18:29:16 +0200
Received: from [52.101.46.46]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a30285b-62f1-0a2a450c0019-34652e2e2d58-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 18:29:16 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5336.namprd03.prod.outlook.com (2603:10b6:610:94::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Mon, 15 Jun
 2026 16:29:11 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 16:29:11 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYxznrTiOFICXH0m21/Dwfzmktv9n1xXZbegYyz04dJ/H2TgyGdVXAKuG34qIVlaVzdzr64+WOUOFvzLyTa7SyT8gnGAm+jJ4pS52S8ZyuPVXLQL1JkYQ43AbbjRcUQHFxBSmOJXaUKNOlaE523IcZL16jSwqs1JFKM6IgBWEVo9F+3dxSKjGyzt6FBrGq9ycPuaaXe8MrjvGHgUVYCSBUkGNOEud8D0SctQHsm+vntK+/gLO+qFdp9aQFYGeNUkv7K0aaqKkkJgN/N3ZTuSizUfQCIOqF3zanN+hvREaGsfGsawpbMkk76Yq6dBd6JHAq4IPHG+IxiqYuPoGrJWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naZk8zrx/K0GHJaF9yJ3UU+t1ZhkV/BkblcUf0h8Wys=;
 b=QU80X7cVj41DSXQa4voBK41SfbkDrstZKgBKhIcEF6nIo2/FaxNouscbiX8UMIck5Wd2kfWY+wOtCD0Zi/fqnvq5smbLHRl3usi6MdZz1Bs3vhI7dfMt0NJo8kgR/6fD6rw+9tqNgFoj8x2Fp/5FlhshHq1CLQt+Oe0jrGKaTqySe/lOJMRW2LLoDgKXd0/MnbPbGNBHAE15ErlM4t+arV+ILbRVkl2q38JfQnvLDzCbfqpLS2PEp8vPCNfH/INBr/DDBzy+ov7NNuwJqcCskU7a4icbEENqDdZAbq9vk6EB6jppElm1TPLaezx1jRauTvcWJeTUkt9CPRAAlysX/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naZk8zrx/K0GHJaF9yJ3UU+t1ZhkV/BkblcUf0h8Wys=;
 b=DjM38lJW84YPbdkwHKGsrzNXzwmoY+mOWMM9DNwX1pRWvTwwn7mU6BBcgxQOthQ3/9PB0kide918hwGDCC/PBeyyPS2EpsHcXaNqyuDY+j432TcLJ8vAwS7h92ehLrQooILWfg7aEEVa77R5+ZGt0kjk8ClKRRc+mGCUA8oqygA=
Message-ID: <07a48547-9229-4b49-81fd-18de45ce37c1@citrix.com>
Date: Mon, 15 Jun 2026 17:29:08 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/7] tools/xenalyze: Work around GCC-15 -Werror=nonnull
 false positive
To: Anthony PERARD <anthony.perard@vates.tech>
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
 <20260612230924.3181154-2-andrew.cooper3@citrix.com>
 <1781540109.8631fc262581453bbf619ec5b2062170.19ecc10bc48000701b@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1781540109.8631fc262581453bbf619ec5b2062170.19ecc10bc48000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5336:EE_
X-MS-Office365-Filtering-Correlation-Id: 972ae17f-062e-4481-7706-08decafb3b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	GFNfmODDBiN+ijHK3dezXdN0E/dHQ+781EHMIQMsZT5/CyzfjU7lK61hPq4um17g2sZmgUZ/fnUKizMdzqGnjqi5A4Z+ghrUA5jNn2tbgk82GLzdZRJbooWaBsrZWdrzHoTQhh7w8aetiUcwpAgldC9S3bZfWIj/dv4M90NohGB/LZG/T/j68v8fH7ZhDwdXYIZd2o4nxQ1AQtG+Oa9WdQoSs7NZn0Wc/yxT16/kzRmqGlSlEb7c0lcpQmRb/5mdMbLvS9pQLFJ85mm+47sOpWLkol+UgFlkRxjAj3Hf7OK3OjsWFZLFVRDS+bo9tqMyswdmUQMr7EKGzJnVKewlNU7M1tQkqM62xryDpSLLpLzUiIbMlaOSm60XsmH72nlfyt8ucEh14ZOUqd03eUuNYhMcWKxSFoIEMs399n8ehjfj7G+RCh6oXzW+AGchH0GP5s9QYfFPDPSAsJ2I+ypVD7FKUBBwST3MScpGnd7FPUxqVi4/F7IMyKQHvjChEUbMWJewTCze22vg+Nxt7sgonPWW1bCQFyZTZcmTYD9q1EDaJ1YgKnSEoobzNyeh7XNZaE2vomwCrkv2g39iiKirbRLni9+1ucWN2BD6gyZBT+wifAAFAA2k+q5sKmR4w4eGisGrP2eSUBAaZqOeG2ASZTFi4i1JegV8BJO/2bQS+nyK8HNI8epnUADhTF35Xa6m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nm5uRWZUb2FYNXVsaE9lUVF0bXdKcVQ2ckpoSDluTDltTnpEWjhUWkttaHpY?=
 =?utf-8?B?Zmh3eVJrUUJnZjBJSDlCZFhMSWNBc0xkZFp2amZEeEQ3NVBEYUZVa2swYmhz?=
 =?utf-8?B?bGk2TXVJSVhBZHpCUjBXa1FYL1dXeEJVMElEK1ErMEx6RmJpcVhiZ1cwRTla?=
 =?utf-8?B?bUpCN05IWHBPeDd5cXJKTjdSbGNzaDNpZnE2NDZWQmdsUmYrbXJIQlhZc1d4?=
 =?utf-8?B?UmFVcEhLRFV6UnVxd1FObS9SeGRnSGtWMDlGOWJBRm1XNzBUejN2N2FZTjdD?=
 =?utf-8?B?R0hhOUhIRUVXZmlHZGJseHdyY0lIOHBZMk5VNGM0MXFnWTFFWENEL01ycmJW?=
 =?utf-8?B?NVI0T3hVa0ZTU0tLK2RZalY1Y2NlcXdJQ1VuQ3VsMDNjY3RXWkNLamVSVkda?=
 =?utf-8?B?OXNmeU9YSTc5RVFaYit3QXdMZnhsOG96NWl6VGJjdEd6ZWNuY3pLWjgvcGsy?=
 =?utf-8?B?aE54endFc0lTT1J5amhEbjdkcWJIVmxFRkQ2ZWY2ZzFnM3lOQTRLeXp2amM4?=
 =?utf-8?B?RWNiZHNXZmR6TVZMMVlLOW84bjdjTnpQQUxoWDhIUTlCWFpjUmV2Szc1blNu?=
 =?utf-8?B?RUF1NE5MLzlyMHBwT20rVElYRm5Md2FiKytValNmbGh5ajVwRTB1SU40NUU4?=
 =?utf-8?B?dTZVN3oyeU5oU3NiVk5xK3V4K29scnVxc0ZPVWwyb3JLZG1wbldWTlNpL00z?=
 =?utf-8?B?VWVUQkRubkJFT1dvcXNnNlZhaGhlMlVRMlZCTGJHUXVhVWtDMGxRbUJzWlQ5?=
 =?utf-8?B?MFhLdmIxUlRraUthUDRYbjdrR3ZhcWk4QzA3d205dXhWeEU5MVJ6cGdJTTVO?=
 =?utf-8?B?cUNMR05XWmpLYmNhWVBZZ2k5Y3NzN3FJSHl0Ylc2c29vVm4zc3FkQUlBaUlO?=
 =?utf-8?B?N2VreXlQMEIwNVBRMzhaQm55UW9UNmtRRzNpQUV0MEhvaFFtL0NqaEM1eHFw?=
 =?utf-8?B?bmNIUWdhQkhYS09RS2h0UFRVbEkwQ1E5RUNCVjhvbnlBN3NSLzdSV1VxaXlT?=
 =?utf-8?B?MDN0aW55RDROZ2NPRUV0bE1OOFhJdktVU3IwME1HVjlPc2ViWGhySFYxQlBE?=
 =?utf-8?B?UnprWHBVS1FoRm9qd2IzZUo1c3p3M1Jacmp4YW9RdnY0WjZNYWkxMm5idjRp?=
 =?utf-8?B?NXZJejIxMU1QcVpiQnR2VFlRRTJOS1JvMmFacFlkei9WR2o3NlVOWEJPWWpH?=
 =?utf-8?B?dlFDVU0wRndNMC8wckNNOXpJNGhuWnVqeG04c05QSWRMeXVHcjcwaTFrazVp?=
 =?utf-8?B?WGpkVzUxR25pUElJTm1ZeHp4UFVjUE95bktxcEFHckI2ZFhxWFduQk84aVZ2?=
 =?utf-8?B?SmtWZUg3VkZKMFdDRnVhMndldkkxdmVrdU9jRmpGbmlPamI4Yk8vQXJpRWIw?=
 =?utf-8?B?MDBVS0FEZmcxaTlXYUJ0QnhhSVVla3lob2V2Q1ZSR01BZ1RmMTRlVmRwK2Zu?=
 =?utf-8?B?dWlEemhHTVFzaWc1c2lldFdwYlVIZFJTUEV6cmM1S0piWW8zVDBnZjNEa0pE?=
 =?utf-8?B?Y2NRWkZtV0x4RUx6TGZpZ3lhSC9UWjNubXNBcUVERnRmRjNFajh4SGE4bmxL?=
 =?utf-8?B?NlIxZEF0S3kzZG5YcWwxcTdZRzd6SVFmalVOVnZma3JVV0x2aExHTGMwa0N3?=
 =?utf-8?B?eW9nR0FINFRNVHFtL2hvU2NWd2ZLdHBISWJtdG5hSkZyeHJydFlVS2orL3k5?=
 =?utf-8?B?eE1pcVNWdlNiUC9RYWR2d3RyVlBVSmFCdUY3SU1adnIzRGJCMkp2REpmK0xX?=
 =?utf-8?B?VjVWZmg3VDZTRHBUUWVaYXFxL2lsT1VlMmtEKzZDSEpDZVNCZThWUHQ5QkND?=
 =?utf-8?B?aW1CbEdMaFR4S3NRRDNpMk5WdkVCMzBOWDZ2VHUvQ3JRVGk3UUdvdVIvWGty?=
 =?utf-8?B?TVVnWHI0Q1ZpRHY2L2Vja2RTSERUTVlHdUFRdHJ3VVlVL3JJTWFyTWJHWEVG?=
 =?utf-8?B?NjBuaTlXSGdrbEpIZVBJQ1FoRTZiTS8vY1Q5QzhMTmR4ak4yT2J0ZFdiMmxz?=
 =?utf-8?B?M3krNGpyUmgvU25yemJKeGlvclVWR0Q1bElMQnJKakpncldNUnhjaVBUZHI2?=
 =?utf-8?B?YSszOVFLWXZSRmR5OE1wQ21wQ1BKWTB3Qlk5cnVSZDlKZ2VaamZlalhMNkJo?=
 =?utf-8?B?blFFb0J0cHBvbm5TNDJ2c0g2SVQyaE5NVmtpaFpYQWFMN0hLQlZLRzlhZzdG?=
 =?utf-8?B?SjVWNUtiVm1zTEVnLzZJWnY3eWRKSkN0UkgzTVI3aCtnZS9aTjBTenNMT2dj?=
 =?utf-8?B?WjFHNFlmeVk4RWNyaDdwNU5kV3pPaElzbVYxZkNrWnVLRFlHTkt6NllIdjBH?=
 =?utf-8?B?Y1UvcDRhQ0ZxcjlVS0dJWk9Rb1R4MUc4amRYelF2OXZ3TnA1WTBad1NPVXZP?=
 =?utf-8?Q?zwCuRIhrurGgR9YU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972ae17f-062e-4481-7706-08decafb3b94
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 16:29:11.9230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJWp/LYmadwFm66SrHw+x479NLSE5MRqjAm+bcVarTv3dWjwvSGsXDmcj3h0D5L4KNFuqbYTfafr0fFHpTvg1v7pos16cyBWYORLyD/4P7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5336
X-purgate-ID: tlsNG-d25034/1781540956-F5585CF5-4D458BB0/10/73395122804
X-purgate-type: spam
X-purgate-size: 1929
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cardoe.com:email,invisiblethingslab.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C0EF688613

On 15/06/2026 5:15 pm, Anthony PERARD wrote:
> On Sat, Jun 13, 2026 at 12:09:18AM +0100, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Doug Goldstein <cardoe@cardoe.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> I don't particularly like this, but I see no better option.  It's clearly some
>> kind of VRA failure, yet we don't see it with GCC 15 in other distros.  I
>> suspect that Musl (as opposed to glibc) might be relevant, and perhaps even as
>> simple as not realising that error() is terminal for a non-zero input.
> While it's true in this case, maybe it's a bit too complicated for gcc
> to find out? error() is terminal only if the first argument is greater
> than opt.tolerance, but there's a check that it can't be too high (when
> parsing options) and ERR_SYSTEM is above that.
>
> If I do that:
>
>      void error(enum error_level l, struct record_info *ri)
>      {
>     -    if ( l > opt.tolerance )
>     +    if ( l > opt.tolerance || l > ERR_MAX_TOLERABLE)
>
> gcc seems happy enough.
>
> And I've notice the compilation error only happens with `debug=n`.
>
> What do you thing of changing the error() function instead of hidding
> NULL-less of the pointer?

:-/

I'd not even spotted that this was a local function called error(),
shadowing the standard library function of the same name.

In which case it isn't a false positive; it's a correct diagnostic,
because the local function _can_ return without exiting.

I'll take your approach, but flipping the checks around so the
opt.tolerance check can be optimised out.

~Andrew


