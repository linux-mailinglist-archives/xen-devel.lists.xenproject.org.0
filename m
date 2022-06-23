Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3703755791E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 13:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354869.582211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LQ6-0006pX-W5; Thu, 23 Jun 2022 11:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354869.582211; Thu, 23 Jun 2022 11:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LQ6-0006mr-Sl; Thu, 23 Jun 2022 11:54:46 +0000
Received: by outflank-mailman (input) for mailman id 354869;
 Thu, 23 Jun 2022 11:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4LQ4-0006eP-WD
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 11:54:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60070.outbound.protection.outlook.com [40.107.6.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43f2ea9e-f2eb-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 13:54:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5745.eurprd04.prod.outlook.com (2603:10a6:208:128::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 11:54:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 11:54:42 +0000
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
X-Inumbo-ID: 43f2ea9e-f2eb-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IP/gR4hYFxFpZHle6lqQhWL7J1F+sYNenPVcA6BxqVHDERLEVXjPcXV8lrYxD8UcQ8iKV8da/25UlSjI0D+dujpXcGGBbMfaMQ1ekUq0IRANDCr/6fgZGBFFCBnCsdM2x+IEuZ3i6Ug6xentHTFrwzbl/DfFS9A4cnotzF4HqpG355R073WqbYgtFrujCruKVX599XVHSleSeRHpgSKMSJxMRDwSqvOEN1owY6KeBE0g7jdvvd8yanNFeX4KCxk2KqpEUZV+ruZ/zG2sDimk1XXXC05tIokaeFk9JitVShU6QsmGb1VopEEBEVkoe07nM4udg+bfp+Mje8svjLNqGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeosBR+ZdmfwY/nfD62Mb7pRTRQW2IaAj5iLTpTX/vA=;
 b=l8npNh/iDGQw/zmKncpJPm0p4JkNvzqBrDMinlpK1n3zlWrDS8Hk5D5kmmNxoJRSUaoZglD4A532uDjbC0/Ab2bsKwmiaAoAQ6Pj9gxIQsy0O4cPRvsFEJs1w7yzAvroDUPYVE8Pqv2YkF3ZQaYbJvEjl7S6DG6fMwo1pzVLwA56IeEmJblhtAwOLijzGpfIKAqxsuCz6nv925sYva9qestPebxfAtxeGbdScpKctjNW/xQpZNwOTyzbea3jWVnvVeAnsu170ron2u2m8NMTh7tGBLvWOTvbcgbYUAz8sVrtxnbvTiPfwC+k425m6NzjIe+4AvpfDWtyrD3cByKpBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeosBR+ZdmfwY/nfD62Mb7pRTRQW2IaAj5iLTpTX/vA=;
 b=BOxkQ2RFthcC5eFJKkap7Uw9FDuHaLUEDi43SHc/Aecj52XySzM+MQb9V8rPsVknyMavZvBcuUdoWg2u5M6qzptpLxJdGuPNtXK1XglgZVVcCDTdz1+FMyoAL2ZCzBupON4ebvHPYjDpcciBuW62MdsV0nnA/A4c2ZZ0+DH3u4uoJyvbfireWPYhrR8+MuBJaHuTMoB1LlVzP1cLoWGYCyD3HW3v75X4CacSKSSUNVSXZy0jLVNFbkrT+AkWmlUOPGy1S5S3w57wGJlVMLnIiqx/LfG+2Rfscv29ypvD1O6meQhNUuHn+zW2IqZ6M0XU0NCBqZlEJjYRR1eW60pmJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7cce89f4-962e-bfbe-7d30-18fea7515bed@suse.com>
Date: Thu, 23 Jun 2022 13:54:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2 2/2] x86/p2m: aid the compiler in folding p2m_is_...()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com>
In-Reply-To: <5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0044.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 330e4c1d-2167-4b8d-b2fa-08da550f284c
X-MS-TrafficTypeDiagnostic: AM0PR04MB5745:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5745911531CF8D7A9662717EB3B59@AM0PR04MB5745.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3+siftVLU5orHUblw7shROGyX64oBpiMclCkuC9ni4h/A3b1j6M/PC15Uw3Pu2HNnZ5ntQr45/P+LKsdXu0uuw3awvHi2KFEzkve/FtovJhXpS9aDUUucNzH/aIMG7GF2otFIICs7RLdL2Olvp62VDPhuh9XqvrYPo45PuP32lERveQu7wiC9RPbTrkId8AvwNDwGGZiKnI99zn+xdknLwnFU8fX7eM2oVCOdAjKdCHcjeJpHTCCTp3RfypX0Lg8SF0OkDutTVIcpceVAs2VQfmqZgOCwT1X7QMX9NbTO+w2CVnt/Y3pMRcOvCwHidOtf/3GrBxFYcKxJCd54A5nmb0HeUWwlHMgVB3ejR7U+vkFSgqBvc2LafOhMZLYTFPEEoj4R0TQAp+VhfZIEqr+HAs7JMf7ObAAXN2Dg+KiVKNR0DINcOebgJ+/cCvVkn1F3HTTC+ztT/b3MtFHDLBDa5HzlbxTsUeQDay05d1+vXJKfiPvhzUXY/iqIMyn3yAxLcIh9gnPqw7+KqJwpDcXndTyvIWOb5H0YxLVbHDMxr4LzAfg+it1K1YoOGT9eSLXGGJIysdd5UIsOIwm4KD1/4hTF+/ghtYcBGGX1lzkg5HShcZFfJMH2MHElVZ0JFZMBswKSlj6MZ+NHvKpubguhhsIcpkBP0WN7O4Mp9fKHTtbmbdOrc8rMYj0Cwg9LoPW7Oz9aHIyKvQLfroVNCbIaplGldb+91GN5NjzQE1rKF3bHI8Nb8/hsGgOGcP7Zs8z1vBEETSkFO2N3JT2QMslTVuUNEZLRNGB2dUwM7qauOg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(366004)(396003)(376002)(39860400002)(41300700001)(2906002)(6506007)(478600001)(8676002)(66476007)(4326008)(66556008)(6916009)(316002)(31696002)(31686004)(36756003)(86362001)(26005)(66946007)(6512007)(6486002)(54906003)(186003)(2616005)(83380400001)(38100700002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0xHLzBoUHlxUXZqMVR4a1JHMmFOTXlOa1JHRzlsK09iQXJ2MTNKMm85bGxR?=
 =?utf-8?B?RFZkekVOQ1dvb2hzNjdRWUdUbTlwaFg0dVowWStNbElOQ1R4RE1ONVZUTDFY?=
 =?utf-8?B?aFNnL2gxd3BNTGQyVVAyNnFQbldPYW5DUGxaQ20raU9oblJWSHo1NkRaTzky?=
 =?utf-8?B?aVcxR1k4Y3FaajJJbG9HdzVEaFhQdU9taXRWc0VGUGoya0tjVnR2T3Z2UjFF?=
 =?utf-8?B?Y2VuczJVMjVYMk01bStHNzlIOVl2MnFkZmxNRUo0RnVBYVVJYlpLcksweUxO?=
 =?utf-8?B?TUFRMUJuY0U1ZlpLc256eTJEdkovN3hJYStYakZsUEFYcmlITkVtWGFaOUpm?=
 =?utf-8?B?d3g0ZFMwYi9UYzNNR1Fzdll2M0hyVXIxaHVKU0p0QjRXd0VMNzFETVBiM0Vs?=
 =?utf-8?B?L0ZJOEFRV3pTbjluak9SUGRxTFU2YzdkOW5DMVhvcUhaTW9RVjVRd0JSR0ls?=
 =?utf-8?B?WXIwRUhvVzk2SW5LbnROTlYybmxMakdWdHVZdU8xMk9NVFdFS21WREZYSDlq?=
 =?utf-8?B?RmdFNEJGR1dKN29JZnVvYzdDRW9yNWZvVElTOC82OUhDQWl6OWFhK2g1YllO?=
 =?utf-8?B?L3E3TndOZVBUSmY4aTNHVDlvWVJGRXdVa0VDdVJoUXhydHBiNkNHK05KNklK?=
 =?utf-8?B?ZmVnd2JGK3FSMGFuR2pPYWtmS0Vma25pbmVKcEJ5TzRMOFNMZS8zdmdZU0d6?=
 =?utf-8?B?NjJFbGxNNjlaM0d5REE4cGY3anFtQW5sTWlYbWt0akJxM0tZRkVJbDRQdlQy?=
 =?utf-8?B?dTF2cTFId2JFc29vVTdqcTI5NmlKcFpyU1o5N0FuemdjWk9ubzZQU3RXeDVJ?=
 =?utf-8?B?cjBBOFArMEVGYkdpZEw0STZlQldaSUZPU1grbXVocnhUbXFUeGx4RXd5Y3Nh?=
 =?utf-8?B?RTdVNXZta0pKbUJydkdWY3dQZk5IeEpMdkt3NHQzRXhqcktKQVVDOUQzdnRQ?=
 =?utf-8?B?MkpvdlRSWlh2VzlCY0RieC90dDNkaEh3NndhYk1DRW5WMjZzQ0NMVjVFL2s5?=
 =?utf-8?B?cjJzQy9UMDFualIxTDd5czZ3NTUwMVNwU2lUNS9UYlBtbCs0elgwd3RTNVFK?=
 =?utf-8?B?VG9Rano1aVRoSFI3WDB4cFJ5UldmWHhFaXVqMGxvQWVKbUpVbkh5cmZ1RVJK?=
 =?utf-8?B?d3QzcjMxbGNWbkxFVElTdDZFYjZxS2VhbHRiUVdENGpwa2NwZ0I1aWVqanAy?=
 =?utf-8?B?dFMweWxtSEM3UnpsU0EzRDE0OVowdEhEWGRHVVJ2Umt6QUtuMUxUdFJha1pO?=
 =?utf-8?B?UmlualV2QlEvWU0wN3V6dDVveDFjckI5enkvYWtSTVZmZTBRT2N1d0dpNTlX?=
 =?utf-8?B?c29COHJaYXpSbTdxb3dyTlpIL3Y2aHArSWQyVjhmU3F5dnRSMU9ucngxTzFo?=
 =?utf-8?B?bFV2V1F2Z2JhWmt3NUc0RXdZQlROTW93QlM4bXhDNkpsV3k1d1RXZytIRTRn?=
 =?utf-8?B?eS9LQlVwemQ3RzF3WmhwT3JKVSs5ME9iWi9xUlhQSXdZQ1ZiRVlyRGl3aGlk?=
 =?utf-8?B?eEtUOWdmUVdkMnZBZzlBVHRrMDBxTmlKaTFRQkVBQ2h2ek9WMEd2VGdDbVBs?=
 =?utf-8?B?UHFaN3dtZm90WmhUKzh6NytFVHcya08zY0ZLTDJSOTRBU0E3RGIyUzlTdU1p?=
 =?utf-8?B?ZEU2L05ld1lYdEFTU050Y1hLMEdRSEFQMDc2ckZrbzhWTW1saVI5dDY4eS95?=
 =?utf-8?B?cGxCaTRqTCtPb3R4V29oTWZmd0Mxa1JEMnBZUGhXSFM4UzlsMTc1bmZGcW9Y?=
 =?utf-8?B?VFh4QVE1Y0xZNDE1L3ViUklnbFNLM2lyUmVYZ2toaGhWTmJTOUtNWFo0d3px?=
 =?utf-8?B?L2gweGNtNHU5cUFLcllzTnJDbUp0b3NoV3VpK0ZtMjlLeGZwRGVCTy9HRDdR?=
 =?utf-8?B?SEJvQnAySHVmYzlBUHhXR0FMMkVxazAzZVFJZFdDa291YnZUMHpEMk55R09B?=
 =?utf-8?B?Z1FObytzZXNhVTNtakE2VWZRZjJ2L2xqdGgvTjJHWWtEblNMbU5NRGFVMFVQ?=
 =?utf-8?B?c2pxZ2dIMWtOd0ZFelcrUjlMUGJTRytSTCtWQlpneHBHN21NaWVpZE1NUE9w?=
 =?utf-8?B?bEY2WXZXUG5za00vd3FiZ0dZcmtsUHd1L3ZPWGFkdFM1ZEt3WDYwRU83L1dD?=
 =?utf-8?Q?DbzwfVAT2RQcBmTkXGd71livS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330e4c1d-2167-4b8d-b2fa-08da550f284c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 11:54:41.9550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkhouZqDa5AEn8I4fHdebKOFS6Tk6ikTXBmdXmZ9pr/YBLdHkO5647YVaQzvlZIC1SZC8JYXqOYOuj69KSyM8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5745

By using | instead of || or (in the negated form) && chances increase
for the compiler to recognize that both predicates can actually be
folded into an expression requiring just a single branch (via OR-ing
together the respective P2M_*_TYPES constants).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: The 3-way checks look to be a general problem for gcc, but even in
     some 2-way cases it doesn't manage to fold the expressions. Hence
     it's worth considering to go farther with this transformation, as
     long as the idea isn't disliked in general.
---
v2: Re-base over change to earlier patch.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -379,7 +379,7 @@ struct page_info *p2m_get_page_from_gfn(
             return page;
 
         /* Error path: not a suitable GFN at all */
-        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
+        if ( !(p2m_is_ram(*t) | p2m_is_paging(*t) | p2m_is_pod(*t)) &&
              !mem_sharing_is_fork(p2m->domain) )
             return NULL;
     }
@@ -568,7 +568,7 @@ p2m_remove_entry(struct p2m_domain *p2m,
     for ( i = 0; i < (1UL << page_order); ++i )
     {
         p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, NULL, NULL);
-        if ( !p2m_is_hole(t) && !p2m_is_special(t) && !p2m_is_shared(t) )
+        if ( !(p2m_is_hole(t) | p2m_is_special(t) | p2m_is_shared(t)) )
         {
             set_gpfn_from_mfn(mfn_x(mfn) + i, gfn_x(gfn) + i);
             paging_mark_pfn_dirty(p2m->domain, _pfn(gfn_x(gfn) + i));


