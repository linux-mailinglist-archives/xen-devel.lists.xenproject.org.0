Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039423ED9E0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 17:30:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167390.305543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFeY4-00028r-IE; Mon, 16 Aug 2021 15:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167390.305543; Mon, 16 Aug 2021 15:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFeY4-00025v-Ef; Mon, 16 Aug 2021 15:29:12 +0000
Received: by outflank-mailman (input) for mailman id 167390;
 Mon, 16 Aug 2021 15:29:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFeY3-00025p-10
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 15:29:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b33b23ce-fea6-11eb-a45f-12813bfff9fa;
 Mon, 16 Aug 2021 15:29:09 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-sWugtaLUP2qGSfRUoq0SWA-1; Mon, 16 Aug 2021 17:29:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 15:29:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 15:29:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.9 via Frontend Transport; Mon, 16 Aug 2021 15:29:05 +0000
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
X-Inumbo-ID: b33b23ce-fea6-11eb-a45f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629127748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e34TaObqebYYNOnrJ2Uk48Z9gMDnN/4F0FjiG6Xfpcg=;
	b=bbtKGXbGbsEeijk9Yw8h2dfobYGJfiHwG1OkiY/7z+kyNMAN87sEHHoYYQJutz3BkjMtgm
	cC9H9NJ2nM8Ee2wd3SbXqhkYlh+ndjwWmc8h7fGt9wCPcBDmdHtYM+gmQd8zmNQZHzn6m1
	IufPnkV8lXf2WXUfvxNyNKP++knsLRE=
X-MC-Unique: sWugtaLUP2qGSfRUoq0SWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwMFSrzDTGFhXUfzUzSuibDdNxsGgL41PpShrzq99+Ii6i+FMTVpONIAb5E5zUwJRAUbQo2USN0qlVZkhr3SohBdQUwZF7ehphjmNnXC+bzfFDtfOLbZIrZd3un21jOd9CtlkphOXt2WxvQXlkBZ2mvPuNlSER/mPjphW/BFR1qCmYH2gtSBcmrAnFaK+Qiw13ABIkAD0aFaXav0LpclqIoQ/H7/jom1C9fRhAmJESnxngrFEBhvDO9xEdGTou65ilrSJ5oxkKezm5VNZb23JesslfRbpn0yif1ZAgqaymL4Gy6vdzO9vcbcvmzxy7Xy+WTFnegOq+H943UDbAM1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e34TaObqebYYNOnrJ2Uk48Z9gMDnN/4F0FjiG6Xfpcg=;
 b=SuZok7sKL2bSre1nR/T4lyghXK7hOrH3ox2W8FYUNaSuYMZcmylqeSfhEJjcV5VR+fSEEh1wn1Tzk6lO9dxUnEi6NSNqqSgBhUyKdnPheMuM4gvW67Dja9k9T2xWrOlB/KMXbO6BQs0/ymuVXo4WC+q86ZmuoJjophUoSEealm/oIXysbsE0dDXPx7G1ZtOpn7sAJkHT+/OTBv952SQWVGiAr/MJi9yiPSJYXm8ZyQLhxHLU2ySd7pR1QvI2NXKm/mSm3AMMP1QrGqhPQ1I2a+qAxOrEEjGrxNXqvbk8UVl/nlMZHaOqr+DwkvWknEkF5xMtFVYq/7DBDMtJv1985w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: assert page state in mark_pv_pt_pages_rdonly()
Message-ID: <cbe46564-74ab-af38-7e31-2f0a3f46ab41@suse.com>
Date: Mon, 16 Aug 2021 17:29:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b9b1f1b-ce14-4789-d72f-08d960ca95bd
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4445237A1DCC6227B6099774B3FD9@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C+1h6iK6pLwT4Fvss86QYG/p1Fh+dgwnLOKMQG8H36BqfJSjmEt7Jr2gLbvaCzmEyBZpAzoQFt4Cl9CyAw9xLhZAKf0eUZ+mYMZJRKuvX/XYPM2vBG3S3K2Z8Nxx1ofM0+ZAOdqc7mfXgatr3HITEtH8HhjaGOvGiYJYEwaoQ0ZME+CyIui+jgoOzRzZATH1nggJmzZ6EXqe+uoM26byjf3MutKeGpupltaDRKH0N//rLWfLRccaSb/UQJHK6dRhsO8bGZsifOQkCsKrv5Ei8c1fs7t0RdFJ3SqYU4SStwc/rCaDlfa8e6unbl2pqVKUOtIa509tLpGqjYtCgS4XtssEoeGfK7mKANfziLLUVqHjRCvalt7mG905fcw2uvVr5QpnZ2Lawsmm473yBN2DNdho0GjmgzPi/UUV+tviQG7CMdYMgYMEQcO6q60b7A5fkXaKjUo91cUOUtgZCBxKGmpCa6UP3QKubbxMKRFHT+Ndd216l6xBtKQaBj2dx9IHvlHD1h2DGj8mUYCpk8VAm3KmBGOl+uJ3l8BZB6ij/PV8andE66h1gRby4QLF1ewg2VOxjdHpuvG6CTLA8vcYRQZJRUcocJ1/ySpdtAUgQF1nR5G0F9YWg5FgusNmb+TDH7HU1x//oxn6VNn4NL5wWKzFKuFcPdm6zmTNtEngrR6Cr0amKsZ9ewOR6dHSB9s8lGz+c8wxNiSb4h7YYsFmeVZcc7B4D+aNxrj49JIWkHzMjWHzFOuYI7Q1n4c6cQ1n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(54906003)(26005)(31686004)(2906002)(508600001)(956004)(5660300002)(6486002)(6916009)(66556008)(66476007)(2616005)(66946007)(31696002)(316002)(16576012)(36756003)(4326008)(38100700002)(186003)(83380400001)(8936002)(8676002)(45980500001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEFsL1BRREZlai9xaXh2S3YycEVlUzQ0Mi9ka1NoSGYreTRWT3loTGFHYlp4?=
 =?utf-8?B?NUxUc0JaWUhUWjhJYnkxWlBFSm5SQURTaTFQemFKc2hkTTNpM1JMejVDaVMv?=
 =?utf-8?B?cWpMakxJN2ZZR0RHRzBGSWk2dEE5Y0VxRUpDZ2xVRHpSNHBEZWRhb0pZamp1?=
 =?utf-8?B?ZHZyYytnbjdiWTFuUUs5TDdLY2xpc1NqNkc1OVJUaVplK3BVcDhQZDQ1UHJF?=
 =?utf-8?B?WmJ6VUQ4STZTdWVSR2Fjdk00TXF4TEsrbDY0ajVuU240T2pTenZJR3VNQlF6?=
 =?utf-8?B?Ri9ONGFSc2ZCRlBUY083SGFIWlc3UytBWUUrWEMwMC9UczJlakxvZGRPMjEv?=
 =?utf-8?B?Nkw0cVovbUdsNFQ4VEp6SUhsSHl2RXEvcVZCZFB3WUpHaWZMQWxNYkdxMS9u?=
 =?utf-8?B?dkliUTZmRDRhL0hxV1F3QkZQTG1xU3A2a000NHpDcnZ0amtxeGxsc29ObTRF?=
 =?utf-8?B?SWtuUmZ5RUhXWnJRemxxKzc4TVhPRWpwTEppRUdmN3pJTm04TnNNZ01wenlr?=
 =?utf-8?B?ZHlGOU1udmV0b0YyY29iYWF1Rmo0YWV6T3VqWDV1VUJSTkZSdlllQWRQL29C?=
 =?utf-8?B?YXFHZVhmbGlMSlJnRGtjWmlvRU5PNTMrNDU4YVNpeHd0dFFSbUY0VTVjL1NL?=
 =?utf-8?B?NzJoeWJvMjhVNHQ3S2Fhb0lnOUFJRVV6anVxbW12YjZZcFZVenZaV2Fsb1lP?=
 =?utf-8?B?cVEwcUxWbHFFQVJrYVhtNTZ1cmZMM0hHWDIwNGJDMjRpcWhick9BempXV2dp?=
 =?utf-8?B?cm1zazNQSHR2a1V5KytYSUtWWjUxOFJPY2lQMDhZL0JmUnZIV3hQcjhQM25M?=
 =?utf-8?B?ekhXamlTTzFHenI0a1FKY1FQMk9VZ0tkNU4zTmp1eUlZTFFFU2ZSWjRBeEpj?=
 =?utf-8?B?YkpIMlN6b3U0dGJUcERMbStZbktISGV5R2Vyb2xBM0dkSkxRT3BpS1lCRFVY?=
 =?utf-8?B?S2R0U1ZTenlFWXdPSDhLVzlwYzJGZnR4UlBsS2hTRjA3Z1VuWVpybDNvL0xM?=
 =?utf-8?B?S2pYdmxvT3lGYkRYdi9DU3drckJZQXk4TXFwbnJsOUQydDdxUThQaXV2cFBK?=
 =?utf-8?B?SjZnLzdPQU5pZnI2Y2I4NnJ2b1JBWmxYeDAzVEFhWTQ4SEhDNTlzQUMxMUh4?=
 =?utf-8?B?S0ZVdmNXNGozZUhOcnFkZ2xQNFFUZUZ1RWVscjdvQXZEOWRxM1czdmZUVWhh?=
 =?utf-8?B?NkxpeXdtcGREREJTajBQb1lYUjBTa0NrbjNoL1Yxb3JOWVNQOHl4L1NKaXcv?=
 =?utf-8?B?Ym92SEhaUXBvMDhOK0pzMnBYMFFzb3F4eXVwd3NCZGx4OWk2QWNoTzVLQ3lr?=
 =?utf-8?B?Qk4ycDVJQTJoaGtLdER1OEgvdUFWMUZpZWp3dURmeVczVXdzSytpaU5DbzYv?=
 =?utf-8?B?dlVLNnpBVElUSXRLb0FpVVdXSlJLbXhpL1RJeklaTDNSR0lPOE1ySi9DSXk4?=
 =?utf-8?B?T3Jycjc4cnl0RDJubjY1c003ZEF1dlNQcVAxTEVXMU8zSmJEU2JZMFcvM25O?=
 =?utf-8?B?VE56a2k2SU5XOFZiTUxSSjZvNi9vcGhvSXJseUJsUDdaVGF1TExsSGRWZUVP?=
 =?utf-8?B?eWN2Q0s4VlBNUHV5ZWVuQ0NkZ2pLUTkvSGdzZFBHMFJDdkpMNWc5U2l6L01v?=
 =?utf-8?B?Y0trUDY0MnBmWTZwZjZpRkFsUWQ3K08rUWtUamp6QlBjWVEyckJ4dlNkb1ZI?=
 =?utf-8?B?V1FwSU04T3N4SWhvelRJTGlvTUloTnQ5cmFnY2R6YTc3ZzdodmNaU09ZdDRs?=
 =?utf-8?Q?Y7y1ALgMapYUOFGTevDmVXILLhsEYMktjPNMWu8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9b1f1b-ce14-4789-d72f-08d960ca95bd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 15:29:06.4161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzydXOzZ8VcHzWC4Qr8hIzLvv5KKccA6xfz+6pP6z/w90ChZ1ByOd1wAWnJ7ySjMKV2BN4t4MJOe/9H1psHAPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

About every time I look at dom0_construct_pv()'s "calculation" of
nr_pt_pages I question (myself) whether the result is precise or merely
an upper bound. I think it is meant to be precise, but I think we would
be better off having some checking in place. Hence add ASSERT()s to
verify that
- all pages have a valid L1...Ln (currently L4) page table type and
- no other bits are set, in particular the type refcount is still zero.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There are (at least) two factors supporting my uncertainty about the
"calculation" being precise: The loop starting from 2 (which clearly is
too small for a possible result) and an apparently wrong comment stating
that not only v_end but also v_start would be superpage aligned (in fact
v_end is 4MiB aligned, which is the superpage size only on long
abandoned [by us] non-PAE x86-32).

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -59,6 +59,10 @@ static __init void mark_pv_pt_pages_rdon
         l1e_remove_flags(*pl1e, _PAGE_RW);
         page = mfn_to_page(l1e_get_mfn(*pl1e));
 
+        ASSERT(page->u.inuse.type_info & PGT_type_mask);
+        ASSERT((page->u.inuse.type_info & PGT_type_mask) <= PGT_root_page_table);
+        ASSERT(!(page->u.inuse.type_info & ~PGT_type_mask));
+
         /* Read-only mapping + PGC_allocated + page-table page. */
         page->count_info         = PGC_allocated | 3;
         page->u.inuse.type_info |= PGT_validated | 1;


