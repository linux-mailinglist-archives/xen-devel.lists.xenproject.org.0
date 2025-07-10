Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD812AFFE66
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 11:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039287.1411177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZnsk-0007Uo-JP; Thu, 10 Jul 2025 09:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039287.1411177; Thu, 10 Jul 2025 09:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZnsk-0007RJ-Gl; Thu, 10 Jul 2025 09:47:58 +0000
Received: by outflank-mailman (input) for mailman id 1039287;
 Thu, 10 Jul 2025 09:47:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=63eF=ZX=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uZnsj-0007RB-Fl
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 09:47:57 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4574dd6-5d72-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 11:47:55 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PAXPR03MB8081.eurprd03.prod.outlook.com (2603:10a6:102:230::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 09:47:51 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 09:47:50 +0000
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
X-Inumbo-ID: f4574dd6-5d72-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMoOLF0Nc2pti//SeSOaqwlamb41jH9eapvai3ExOCRnBjOLvDkUG54WboveetENEHTBkfX3XOrGMUe8iGrJdlHRxeTxkxfo2vKnOoU8adV2rcT1OI+reOwUyLMbMXrni6XNynQT3grYbwCCBOKB90Co2cRISz34k8I+D3HFvqlqJc9i5LTdxAYlhqUj9J+Oo1YoFsqFj9n9hDs7d1xosmWczI458PQ3YGyTHDd6tJXeJgBauB1axgTXK1I0OO+xJRpbfFsVucEq9taRiMHmdNUh8PfqRd/q+k/a3j1+hyE+0j7bEAvB773vgUoXlRqtgIshSuIPS4IDHePccYI7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThUFovPB56FkSfslnPvJ173MNG+V8jeZ/6O7eP9x42A=;
 b=kBpCxP6CEpB90GY+nJf71b7aaFqdLEbDyB070F7qtwL+m8CpYoMO59bo7KRBThj32SgFpVPdC6BHhFzrt5qpc31bYMCOrNC/+fVoqyutf2DtMG/rpckw7MGEW7HSF3uycqTCvVkKviyNkq0J41xRTcbj5Bd/+IncvpkIa8Y2jJ3gbjd+6bLtbTQSjLrDIe3xf9nWrrPby8JQmHX85zCHfJ6isIZCVRLziwfY0JF47TdGQM9I02wnsMn3qMYxGnYUNHJoZ2RVM0sFKdWOcLGsqNd2Y7yGJGnQvD+n6gRzMHC5jtccgTOumRjaDFq33WoCtEvgcLW120PkGqk8z+NCgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThUFovPB56FkSfslnPvJ173MNG+V8jeZ/6O7eP9x42A=;
 b=AtuTAq76sCKDmIC9Xjl3TsN9QX3Vg9q/rEA51/y/JczlQobbw1FyB33udYTN9o2kXo3T2fJDCBD9UvzoHjSpYTsPhLUlQFvWy8HgtY8zi+PO77FXeHi65UbJ5ILfRN4/K4qHPlCurHDdoAOLD0xkguCn0wHn0whWJ3op1ZL5WZJ8eqtj/stEmxEM/HDXm4WO2tNfMx32BlHZM8vG5N5C0AGbgI4K4CFtHpwDX/I0OjAheS0PODUJSDcdz5idxwB+E44Wq0Ys/+Sr/kOvZfK5IGqnuFzSCH0mK0UxvuGSb2Xi+w4fHHKVtcfhWcMWchut48qV1TL0wkanO56gBZpk5Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v2 1/3] iommu: address violation of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH v2 1/3] iommu: address violation of MISRA C Rule 5.5
Thread-Index: AQHb8RnHknh9PmNpckO7ne8U6W29yLQrBRIAgAAXOYCAAADmAA==
Date: Thu, 10 Jul 2025 09:47:50 +0000
Message-ID: <cc73832c-7499-4416-9f40-a86a3dd7d29c@epam.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <0a7a954cdf899845f51427fa6b44915f28b2cb90.1752096263.git.dmytro_prokopchuk1@epam.com>
 <7fde4d6c-eadc-4c17-a88a-80714362bdca@suse.com>
 <a8d7baae-3b72-4905-bf41-1db79b3202f1@epam.com>
In-Reply-To: <a8d7baae-3b72-4905-bf41-1db79b3202f1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PAXPR03MB8081:EE_
x-ms-office365-filtering-correlation-id: d0963a99-c2cd-41cf-f39d-08ddbf96d5cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TmZnbEgvTTNjVHllTWg2UmY5VWY0OWVOQlpNMkxJUHZUcHUvWHp4SmhDMVVW?=
 =?utf-8?B?dncvbE1rblVPOWZaU0luT3dIWTZIZm50SFRjVUJDMGF3RGI0bWhyYUpqMzEv?=
 =?utf-8?B?MGpPVVRrUVJKK3hjb3l6MVVoRmRYWnZCbHJtR0VsQ2NVcmtoS3l4V1hGTUJD?=
 =?utf-8?B?MlEvdXdQSVBVNkU3R0xUckF4dmdtN0x3NTlORVA3dmR4MjhvYzJxNHNsV3Uy?=
 =?utf-8?B?OEcxaVdSbiszU0xlUTFWdXFNOC9PWnB2K21uNzFnY0ZOMENKb2ZveHN0cGFJ?=
 =?utf-8?B?ZmthZ25vQWZPZTRLTmw1Q1lGZlMvOTNVV3c5d3JMRjZUSVpvNUdFT2xwZTdq?=
 =?utf-8?B?SDRMQkxEUFV4TDdhamJEK2F0cWhGeTJtL05zZFo1Z1lDMDEybTZlQW5RamRT?=
 =?utf-8?B?V0ltaTcwbS80QXo4NVVERHVTK0lUSlNmcDl2d2dyamJ6SFluaUE4elBMOThL?=
 =?utf-8?B?VkIvK2lOVytqcUxqKzNYRldIR3RhejQ4Rmh2UC9MMWhtN0UvYURTdFpUOEM3?=
 =?utf-8?B?NjJ6UTVVUWM3YTZSRWV4WXBnSGdMSllFQzhKUXBUVDUrL2s2dGJQVmw2U2Nm?=
 =?utf-8?B?Y2ZCUVdTSW1wUDM2Q3Q0ZmN6ZkxMY1RIM1NualJwVFVZWXJBT3lBeUFGK0dS?=
 =?utf-8?B?STRwNERDWllXZFUwdEpoNkxXNlNzRHU0RCt2azN5NCtscy9TWkFzQjd1VHRZ?=
 =?utf-8?B?YjZnZngrK3JCcHlMUVZQVGExa1pZVEdBODBYbTRjNmFvMUsxRGRFTytQa1Ru?=
 =?utf-8?B?blUwSmErQUVnWVkvcE8rOVVNZ2o4cFRQYmF2NjhodHpucC9KaS80SExwcE9p?=
 =?utf-8?B?QkFvMjFJUDg1VUlPRDVpeWpPNHdSMjV2L2hqeW1rNStvM29IeDFQQ1BXQzlh?=
 =?utf-8?B?U2tLZytyV09pT0loWWNBRUZNclllM2JUZDAwVVNZbU5UT2pSb1o1Yi90UFhX?=
 =?utf-8?B?R0tUb2FLQ214RCtsSGFucFpTeEpnZjM5aHQ3TThsTG9MaWFpR21HQmNGRGs3?=
 =?utf-8?B?Nzk1dkxqdk43YjhqVUNjY2ZvRzlwS3ZNQ3JOR1NwdHd2eEsxWGR2MlZISjRa?=
 =?utf-8?B?V2U5Nkc3Sk9sYXdsMXQ3VUEwSlA1cU5STTBVQnQzSlJic20xVDkzSDd2NFhN?=
 =?utf-8?B?akFqNTFZdVZCR0VxQzFpd2VnSlJKQ0xHTnpNNHJBWEF2SEJ4eUtCZFZ6c296?=
 =?utf-8?B?aVVWWFNzWXdHa3NweWszeEg0M1NwTncvcFhDQzVMSWV6MGtFdkorM0dHRWFh?=
 =?utf-8?B?eDVxS0FvdGtxVCtucFlMYVBNNngxa200djAxSkJ1cEFQR21semFWdFFwSGh4?=
 =?utf-8?B?dVUyRUVRK0F5ajkzcE1Ra0J4Yyt5bHBDc3R0Ym9HbjQvSnlzZDV5UnVNMUZq?=
 =?utf-8?B?YVI5aVlMVWxCSno3TFZ6RDY3MlZuNzBrMThxZW1RT3IybzhBcU1peVZudzkr?=
 =?utf-8?B?VXZmVzRwT1J2VWhNcnBxOWxVS3Z3SFoxUjhtMXhpOTFNbS9PcVpqbjcyTmsw?=
 =?utf-8?B?WXNqcTByaTFsdjlvbDhvaTNvRGo0TkFCbTdNS2xLMUVIL2ppTjFQbkNuZk8v?=
 =?utf-8?B?eDZyQmFHNEs0bUJCTlNQKzA1ME82MjVYeWcxalVkUkY1cW5IWDJQcjh3N3RI?=
 =?utf-8?B?N2F5cjc0OUw2Nm16ek9XcHVLa0hNdysxOTFCR2xIdnNGYklZbE82K2VXN2xO?=
 =?utf-8?B?KzdueDFJOXphbFNFUFpwOVJQNFR0Qjc5YzNuWkV0Yjg0bWtPZEdqZytFNWYx?=
 =?utf-8?B?dUVSU2RJRXBwRndEWkEzajJaUlZpV3Ywb0Q4Q2paZXM2VDFZeUFadHAvTnBW?=
 =?utf-8?B?ajlvSXo5VUNsYmhmQm9wSURIYk9VMEJSTkNLbEhiQUphTmpLTy9OeWdrSG9h?=
 =?utf-8?B?OC9vQVVLOXplZVlBME85bERReE1McDhjT2tpdmwyU3NBR3J3bGlaa2Y3MkFr?=
 =?utf-8?B?WTZSM1BjeEdUMGt4bVpKSldIQ050TG9FNzRIOW9TYzhQV2hoRTRvL3ptamM5?=
 =?utf-8?B?UERHRmlDRE9RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUpYaDIyWERLR2pRWUtZQ3VMTjFFOHFLRjFDS0ZEN1RuQVZBcHJhUys4RytN?=
 =?utf-8?B?M1lrWkR6czJpQ252bE5JU2RwNEsvOEU3YlBvaFZmaGhzOTdlb2RKUis4UnNB?=
 =?utf-8?B?WE1XWGR2L2k0dmswRDdhVGExdWZXbFZuRkNSR0VmVGdSMEpzUEtrbFNIMU53?=
 =?utf-8?B?MFNrNFpYTzlFNzJGdlQ0cnE0Q1VES3cvSnZhWWhEc2E4ZTlkM0pTdnFCTzcw?=
 =?utf-8?B?NkJpTU94c1lST1c3V1JZRm5iS1UyZ3FheGx6YzlMa0tXV3kwOHJIaEYrcEdw?=
 =?utf-8?B?RHNXblBvRU52OHo3cHBZdTRzTmlFQldJZmtteWFwVXN4ZDdPMHFoWVo2RmJK?=
 =?utf-8?B?Q3FMVGU0UkVoaldSaDBWakMrdDdjS1ZQMXE0NTZ0QzJEaUQxNjYxK3FOWHVt?=
 =?utf-8?B?Z09rNnV0MVd5WkNCenNaTEZpaGErblBPVkM3WUJMcm9HSEl4ekRlOFJhTTN4?=
 =?utf-8?B?U05rVnZHR1NRSWs5d1ZsalJNamN3R2pUakFqMUJRU3B1MVZ6U2ZEbHFDRGZq?=
 =?utf-8?B?NHpEYjVOU1hxNDZQVnpnUTMxRG1wdXZZUGFjNVhIWU55NkNQWDU3QXJVSkZU?=
 =?utf-8?B?TmlyeDFHcU9iZEUrd015cWJ4UG93cGpobDBjKzNLUnV3dFFSL3kybUtleldp?=
 =?utf-8?B?aUdaL2RPandDTWxCVEJEbC9UL0VON2tzYlFwcnZGZGljZnRBc0NJdXRSQzBZ?=
 =?utf-8?B?bEpDekxBc1JLenBBNWdndyt5Rk95Ly81bEpPdTRYT01uT2NkUUVla1JBYU9R?=
 =?utf-8?B?L2dkSlZyb1NFb1NQSVFuZ3pRTEJKY0lBNGZaRHEvNFRYRE5ST3RqbUVBakxR?=
 =?utf-8?B?dExwTjJTaE4rOWlCT2xTMmQrUTJZcE15VEhZRTZtYmg1eTkyY2cwazU4eURh?=
 =?utf-8?B?eFNCTHhGK2d3RVpSMkV4OWdBOGt5RVVUVExlVTdmUmJIb2dYRER3UUhHYXlz?=
 =?utf-8?B?M0Rnam42SkxMRjhhb21SOVlLTkpCekJrc2RwekRnUTFXSWlEVTVlS2ZPdlh4?=
 =?utf-8?B?RG1yL0k1STNrTEdIZVdpMEU0Q0JLUmtkcjJSSjZpS3JyakR0SjhGenZGQ3lq?=
 =?utf-8?B?bGx2emNtazdTNnpKL2dwTlpYa1plWk53OXB0NlluVnl3cG9qRkdqOVlKN0Rw?=
 =?utf-8?B?UmxqUnZqTlRJV09EbE02NHdXbGw0c1dORXdockRkeWZJUHZUQm5wbWViVFRk?=
 =?utf-8?B?WUlaUDRrbUtGbnVCd21HZzhpMjhLTnFIVGY5MnhMNGViZlNJeFdDN3lxRWxs?=
 =?utf-8?B?NGx4VVh6TDB3Nm5RRDIvMVZRWUVIYTQ5b20yZExSUFRoc0dsdGN5b3dkalFu?=
 =?utf-8?B?dXdORk5YTy9KSTdwQkxXZFJkRzRhYjJheDg0YnFIZlVzOC81U09YdUk5bTNm?=
 =?utf-8?B?WTI3N0VIVXludUZaNzkvQ3h1eEd5TEdCNUtubnJqaUNDZysyOFF4c1FJYndT?=
 =?utf-8?B?ZXNvRjdTZlRVUGxOUFczWUxyUkljSjBvZHh2QWxKL2QxU29IU0pMNTdGVUN0?=
 =?utf-8?B?TVJhbUQwdkJiWUVKTFBONStUZ2t5aUpYLzhIdFcrbjh5RlFrVEo0NThKSEJI?=
 =?utf-8?B?YWZDUXF5ZDJ4UW5CN0FoY1dIZ2N4ak9lbEJPVytrd2lKaWQyYmlPcVQxKzZv?=
 =?utf-8?B?anJNV0ZOaFRuTXA2M013ZmpTZllQa1dwK010M0s0bHczM0hBakxNSnF2WEoz?=
 =?utf-8?B?YVkzNTNjTDJTY1dvUlVza2VkRUdZbFZLNWc1ZTV6TzYyNmdUeDZXOXFOaHYv?=
 =?utf-8?B?aVQ1a2NTTmVuUzh2L2MzWk90NElwWFhiUXFsTlRjL215NW9NcFUzR2xKVWds?=
 =?utf-8?B?anh5WWRVUUtRNFM2Rk1Ha1k3ZzFjbGwxVXpyU3hSeU9xRWQ0bEVENjhoMFFi?=
 =?utf-8?B?a0p4K2R2WW1KTnd5L3FYOHNLSWFIOWdja0ZERmtvdVA2OFUzb3ByRVNzRHdr?=
 =?utf-8?B?bnY3N2hMT3ZyZlg0NVlYR1V0U3JVVzZ6M0dIQW00bWV0aUVYSGYzZWFscHhx?=
 =?utf-8?B?Rndib0xFa1hLMXR1VlRDZkdNcXZWRDV4dXRLODhVdTRySnVLYk9ITzl1Mzd0?=
 =?utf-8?B?dGdNcFRaOEV0MzN0NTJyb2NpMzByejNGKzBNN2tJWnM1SllaWVJQSHZ1S2tZ?=
 =?utf-8?B?R3VGbHdZREVTRTQ2dzF2Kzd2Y3B0UTlnblFGMmhsRUdnZ3czUTZnK3hsdVhO?=
 =?utf-8?B?Snc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A98C69A4BB7124CB04EE77680BFEEB4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0963a99-c2cd-41cf-f39d-08ddbf96d5cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 09:47:50.8919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pawc8aDWcv2AAEXGxk9z8tqMz60GRsMSSNrUP6Pe62S98ybReM4DgMcgubbsP8X2gUvt8d5kKlMAa/kZs5YiB1TZHSB9lTg5sqsAtk0OguI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8081

SmFuLCBJIGRvbid0IG1pbmQsIHlvdSBjYW4gYWRqdXN0IGl0Lg0KUGxlYXNlLCBnbyBhaGVhZC4N
Cg0KT24gNy8xMC8yNSAxMjo0NCwgRG15dHJvIFByb2tvcGNodWsgd3JvdGU6DQo+IFllcywgc3Vy
ZS4gSSdsbCB1cGRhdGUgY29tbWl0IG1lc3NhZ2UuDQo+IFRoYW5rcyENCj4gDQo+IE9uIDcvMTAv
MjUgMTE6MjEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMDkuMDcuMjAyNSAyMzozOCwgRG15
dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4+IEFkZHJlc3MgYSB2aW9sYXRpb24gb2YgTUlTUkEg
QzoyMDEyIFJ1bGUgNS41Og0KPj4+ICJJZGVudGlmaWVycyBzaGFsbCBiZSBkaXN0aW5jdCBmcm9t
IG1hY3JvIG5hbWVzIi4NCj4+Pg0KPj4+IFJlcG9ydHMgZm9yIHNlcnZpY2UgTUMzQTIuUjUuNToN
Cj4+PiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jOiBub24tY29tcGxpYW50IG1hY3Jv
ICdpb21tdV9xdWFyYW50aW5lJw0KPj4+IHhlbi9pbmNsdWRlL3hlbi9pb21tdS5oOiBub24tY29t
cGxpYW50IHZhcmlhYmxlICdpb21tdV9xdWFyYW50aW5lJw0KPj4+DQo+Pj4gVGhlcmUgaXMgYSBj
bGFzaCBiZXR3ZWVuIGZ1bmN0aW9uIG5hbWUgYW5kIG1hY3JvLg0KPj4+IEFkZCBhbiAnZXh0ZXJu
JyBkZWNsYXJhdGlvbiBmb3IgJ2lvbW11X3F1YXJhbnRpbmUnDQo+Pj4gdW5kZXIgdGhlIHNhbWUg
cHJlcHJvY2Vzc29yIGNvbmRpdGlvbiAoI2lmZGVmIENPTkZJR19IQVNfUENJKS4NCj4+DQo+PiBQ
ZXJoYXBzIHMvQWRkIGFuL1B1dCB0aGUvIG9yIHNvbWUgc3VjaD8gWW91IGRvbid0IGFkZCBhbnkg
ZGVjbGFyYXRpb24sDQo+PiBhZnRlciBhbGwuDQo+Pg0KPj4+IFRoaXMgZW5zdXJlcyB0aGF0IHRo
ZSBkZWNsYXJhdGlvbiBpcyBjb25zaXN0ZW50DQo+Pj4gYW5kIG9ubHkgZXhwb3NlZCB3aGVuIENP
TkZJR19IQVNfUENJIGlzIGRlZmluZWQuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBEbXl0cm8g
UHJva29wY2h1ayA8ZG15dHJvX3Byb2tvcGNodWsxQGVwYW0uY29tPg0KPj4NCj4+IFdpdGggc29t
ZSBzdWl0YWJsZSBhZGp1c3RtZW50IChoYXBweSB0byBtYWtlIHdoaWxlIGNvbW1pdHRpbmcgYXMg
bG9uZyBhcw0KPj4geW91IGFncmVlKToNCj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+Pg0KPj4gSmFuDQo+IA0K

