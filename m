Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E069441C557
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199098.352952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZRE-0003HJ-8K; Wed, 29 Sep 2021 13:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199098.352952; Wed, 29 Sep 2021 13:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZRE-0003FP-4n; Wed, 29 Sep 2021 13:15:56 +0000
Received: by outflank-mailman (input) for mailman id 199098;
 Wed, 29 Sep 2021 13:15:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVZRC-0003F3-Np
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:15:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f78e1a6-2127-11ec-bcfe-12813bfff9fa;
 Wed, 29 Sep 2021 13:15:53 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-uBEukRGdPEi98zdElX4-CQ-1;
 Wed, 29 Sep 2021 15:15:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 13:15:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 13:15:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0060.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Wed, 29 Sep 2021 13:15:50 +0000
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
X-Inumbo-ID: 5f78e1a6-2127-11ec-bcfe-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632921352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=289UvYu1z6hhybJctb/uHf8lFebZQ7uBwKVUfRIW7tA=;
	b=Y2/9WnbZflcsVK3/RcugaVUFAe+t95Az81fMM+8rCvFDQ+GjNPWcLgJbT3QU7zJAb6W+nD
	ZjMZBVeepWoukFyfud8vxSDIJt/Vmjpwz2pCJXCugGonOLjL8uP2bJF4A1uF+qfYyAn5eP
	j6AUnAKyg9yBMfWv/0J3m1/UTkTkU/w=
X-MC-Unique: uBEukRGdPEi98zdElX4-CQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZTQ2Qo/kf5nIVak7nvHSIiGkONhIf6lO7Vfr/kFAPJ3sZL3H+wRrupGfpfuXQCHpeEK96ULyFMbaCtxcmoSRd7Q4dBUacBprvqiegLaGY9GRhM9ivNk2Of5qcgJHMlktJKgan41WprcINwANoqJ0We2xCNu7g1D1+Io0sW8Zuc0Ej6vIpl/688A3/ynQBbiI1r3OxMPk+Ref3t0XXHgzSAmFNXSYhDEla/Gx1dmQrPYaavCTNJ1iGPFmEvr5inx/XHw444JDE6CDEYLw7CmS5fD5yX19xkTWqkJ8vPpgVUr/Y067YCrJjtLcyhP4YRDHDc9Y0Qa0Stlx2vuiZ4RNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=289UvYu1z6hhybJctb/uHf8lFebZQ7uBwKVUfRIW7tA=;
 b=UpuLwH+Px761mS2wamIljFLDTjk6ivaXUPQUcEyEOmv0gq7qc3pQf4EqofHho/yTQf5k/5guaQunxloNhPBe3Usl0C5W1jnlLRanMGpmRIBquPfWuxsnTgqBCFo3uZS8zFKcUEg57sGJUYcL5+1MVQLVaEv+KS3qfVDvUGszO44nrziYRLwTdLqIs51ICajnmEp83zQb/vLxzrwe3HVxZ6LpmUSflx7WXYqTPxMzLAzhIxxkWtuUaCFl/blWsSvS9GQAVxTCzhRcZzf4GgBRad2on2zHwwKNEc78Df9tj4iF01K62fWfY1v7ohHVIQODwvtEPJYGgnkfZo1eM7dMdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v4 6/6] x86/P2M: relax permissions of PVH Dom0's MMIO entries
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
Message-ID: <4b8c48ba-a563-d036-d4bf-f4f8bdf0efb1@suse.com>
Date: Wed, 29 Sep 2021 15:15:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <cbdc93a6-e675-420c-f7e8-53aa407766ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0060.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80f1b0d1-d613-4907-1926-08d9834b4264
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150A3160589C7DF992C7DADB3A99@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TPRDrz6BCE3Jc+Eeoa8oNpdKL8tqpPF6k/XQFGBrsFDBk4qC6hsk53E18kYRqP0aH8vDMvTl4ejbAXJ5JhBxU+ef+AVTzSIIXfgY+6ZnKbctC9tiWuzuCsDRGWL1abdXFqTOTtX7zMT8oxVnA1eEVZbmHlrBhBXzihx/zivFlS7IoxNpH6uMFEQNHCQ4XP1ukrytH6rZtiDZHomabruV2H8VqWazqg4og+qiCBkLb3voCI2HBdDr5Zyrl1dpZENwdw6RU0/rh55wFSqgKNSeRPXuUChhy5vYJSekpH6RrVUiyhXygLcvV8dfGGaDFj32R3Y5eQ4Rne08rQA24rUeFMRiP0HJLx5bSOZrQEyQUe7x6zaajDdbVzFTjqYfVoa67GWWRevFmtKMDhdINRMPjQQldtV7sO/04vZXXfCd7cUUWmFFrxnOub5NIy/OGEgFC4uryPCvx6KLt/gDnb95BTt28JGZP3x0gQm+qblXBU9fl52EDtpLI7R1KbIiZgTQoIG9wsrKouRj17FAev5G6g4XczCkCcGbIdVBE7Eqnxbggq6S0ss7qHvoo1FIb3IV4pzfhyIAAj17JgrqSptN4rIFWyRGWQPViYCAiPPxLMXEHFgXtqMXV60dlgkm5087bGwoiZ1zbYlT942QaSdF6MzR1BiNb1EFyBErTgFpgMpjVCnweJDK5LUzNeJA9bEt16w5e01Vit5oGZE15QFAL2163oFyafShI11RVi1iBbw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(66556008)(186003)(2906002)(16576012)(316002)(5660300002)(26005)(66946007)(8936002)(31686004)(83380400001)(8676002)(54906003)(66476007)(6486002)(86362001)(508600001)(36756003)(6916009)(956004)(4326008)(31696002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTArcWh5WWJvUktxalhWeFNwcVM3eTdpNlFDaXY5U3AwVXIwR24zWnVGME9O?=
 =?utf-8?B?dVF1NlkwM2RrVy8xM1p6N3FOOWZrZUJJZGptQmNZcXZxZEM1bkNuczVCWmkx?=
 =?utf-8?B?L3FCckdQeFhmbHBaL0RWNmNjQ0RyRUdObjl5ajBSTmREUFNncGl1Um0yNVRh?=
 =?utf-8?B?TmY4bmZmYklmYURxYjhPbmp4eFROTzNNbXkvY2FYOXhUSi9xMHNxQjVVcTdS?=
 =?utf-8?B?dWUyQ2FZZ2o2b2oybEIxSDdVYm5rRTFTcExyTXQySCtnaWxqTW9RckVaNGE0?=
 =?utf-8?B?WVJEL2JQSitXMTNMdzNwY2xMSm80eVJrV24wd3UrWTYvV2xPNW1qbTdiYm1j?=
 =?utf-8?B?WmVTcXhlRVdneHNvUHVLMm8rZlJ2NHNWTHg0VlRjRStxT0d0SGFTL2huZ1FP?=
 =?utf-8?B?VEhrbklJNTR4RU51YWFqT0EvNTIrZEZiclZhN2pFQlhaaE9yTEZVSStqbG9Q?=
 =?utf-8?B?ZFRzY1IxcTJtZ2FRM0NLSTRHYTRqNk5lQzFvYWVjdW9KMU54QmxhcElzdkRU?=
 =?utf-8?B?ZS96d2I5cGlPK1BDL29MOUNDWEJVaXBuaG9jbkNjS25VTEJhSEZLNDBTTlhq?=
 =?utf-8?B?U1lSMmN6M09TRG9hWjBNUXZsMW9OOUZJTVQyUkJyZjNkdmdxQTZYcUtiYmhk?=
 =?utf-8?B?QUJFTk5yVjJpUlZPNGxoOS9idVovZUJaLytYVjcvM0FlZWRQWTNxQ05TdkJB?=
 =?utf-8?B?R1Q1c0dRV050RnVYbWtrd1B1eVFEcEdzTE0wZS93aEk1MzI1NzRKQnlaN09a?=
 =?utf-8?B?TmJlVkJGMWlLdFVXRm0zR1ZJcng1cjNJVzBwOXNodXFzaGU2b0ZYZENuWXRM?=
 =?utf-8?B?OSs0WkpTZlpVNmJ3RVBmTXFYR1AvOTJKZVhrMzNRWkZ3R3IyNm5mMlQ3Rjkr?=
 =?utf-8?B?d1RJZXZONk9Pb3Bab3ZQTG1ySFBZLzZPRzZkSGF0Z3Q2YS9mMVY1T2NxZFVs?=
 =?utf-8?B?R0Y5azhiMjZjV2lxNlp1QU5pOUJiNzNwTU1kS2pCUEFOZGhmaXJwMUtmTEVo?=
 =?utf-8?B?YXhEaCtUY0hoZFErVEd6R3c3Tk50SXdNUXFmTW9wMFhUOW03VG1BTERBTTNC?=
 =?utf-8?B?cHZYek9JMDBPNEUrRWszTXluMjV3L3FZaUNJZFpmWmQzWkxoR29mREo2ZFdv?=
 =?utf-8?B?OEZMRXJ2MGo0YTdmWi9ZMlJ0OVVqYjlpTUJyRFgzRkNhZ1FsM3IrL2twY3p6?=
 =?utf-8?B?bmJGMy9IV0lKNHQ5THZJby96TnhQaEVXOGNpWU0yei9CbkNqaU1Pb1RBSUNj?=
 =?utf-8?B?NlBQRCtWTDZuNHVRYlBnYTMxdWYwZUIyNHRuT1ZUc3dhZ0FDUkxqTkRsdldZ?=
 =?utf-8?B?amlLWkdtUzVGSSttNHRicjM3bDFpTWRwL2pHaVUvbmlLbVJhblVVUFo0Q1ls?=
 =?utf-8?B?VzNkK1EyNTIrMWMzZGdVN0djM2lMUi9xdW8vNkdiK2pSZm9QbndFaTZ6N0FU?=
 =?utf-8?B?UStDVVk1cDVvU2VOQkVNem02NHR5MC94Nlk4KzdvYUZ5dmZtZDRWVHc1d3k0?=
 =?utf-8?B?dE1ZcTdHWXdkNlNaa0ZoRlBCbyszb2FiWEJkWXZOV1h3bGExallBcVRWeXVM?=
 =?utf-8?B?WjZ1emR3ck5YNFovejBtaVltMmFiRGhHM3lYclp0WmdEZnBXeU5YdXcza0ps?=
 =?utf-8?B?TVRIMkxwbnlNYWpLbjFsUXZWemxIUEljWFdoUDEwTWIxMStpTDdkZ0p1ZVNx?=
 =?utf-8?B?K04vVktBZ0J6QmwyZVJuYWc4bnlpTGhuVU5EaXhtODRIVTR3UCs4TW5wOWww?=
 =?utf-8?Q?fNq6leKW4YGiCCSuAPUgfYyOBPHbaotNynNAX75?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f1b0d1-d613-4907-1926-08d9834b4264
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:15:50.9967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HJ4sRWrMZc2S6To2MvFLOtPaXfT5CH6tecAqvOr/mZF7RBc4ieRZ9IE3Fwd7xY/gPkYcMnE8frKGws3GoLcEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

To become independent of the sequence of mapping operations, permit
"access" to accumulate for Dom0, noting that there's not going to be an
introspection agent for it which this might interfere with. While e.g.
ideally only ROM regions would get mapped with X set, getting there is
quite a bit of work. Plus the use of p2m_access_* here is abusive in the
first place.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Move last in series, for being controversial.
v2: Split off from original patch. Accumulate all of R, W, and X.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1319,6 +1319,18 @@ static int set_typed_p2m_entry(struct do
             return -EPERM;
         }
 
+        /*
+         * Gross bodge, to go away again rather sooner than later:
+         *
+         * For MMIO allow access permissions to accumulate, but only for Dom0.
+         * Since set_identity_p2m_entry() and set_mmio_p2m_entry() differ in
+         * the way they specify "access", this will allow the ultimate result
+         * to be independent of the sequence of operations.
+         */
+        if ( is_hardware_domain(d) && gfn_p2mt == p2m_mmio_direct &&
+             access <= p2m_access_rwx && a <= p2m_access_rwx )
+            access |= a;
+
         if ( access == a )
         {
             gfn_unlock(p2m, gfn, order);


