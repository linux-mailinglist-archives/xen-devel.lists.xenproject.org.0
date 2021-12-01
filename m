Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D7464C31
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 11:56:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235865.409121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNHF-0002rb-NR; Wed, 01 Dec 2021 10:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235865.409121; Wed, 01 Dec 2021 10:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNHF-0002ot-JC; Wed, 01 Dec 2021 10:55:53 +0000
Received: by outflank-mailman (input) for mailman id 235865;
 Wed, 01 Dec 2021 10:55:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msNHE-0002ol-4e
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 10:55:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b33b6bf5-5293-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 11:44:46 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-VSVIWibIOeSt9CkaisyGAw-1; Wed, 01 Dec 2021 11:55:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4383.eurprd04.prod.outlook.com (2603:10a6:803:6b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 10:55:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 10:55:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0051.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Wed, 1 Dec 2021 10:55:45 +0000
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
X-Inumbo-ID: b33b6bf5-5293-11ec-b945-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638356150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EubbiLSoJ7gBkAT814XkFnEd7VOT3g+5pVKJpSG0l1c=;
	b=iX9J4B76o6sp2RAgzhXzerJIYLRl2W2kHIKHw1LtwBy6NbC/5waOiSHhGUp3N44cwepuao
	RFTea1W4303fUUkiY8KGWjTYEIg1cBrHcPX8T4Ahbv65yyecl9AWlkQVHME+0d6gIZlG6d
	x8J+aGGu87RN9iWC2SRhQX/9G1Ov5Xo=
X-MC-Unique: VSVIWibIOeSt9CkaisyGAw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpGOdPH53N8SypL5PcJCQLZg7FFjVb8YdgJjtqsyL4ByymsPcCz51drN3Ep0QRnTVtrWFcimIwbl7+aFOov26OBkR+44eQcu+8FgU9rlATRU5VXFSjSG7QrzVD7mAvZ7FtK8VGGjgRMRou/kLtSW8ClgUvvg4DzQZIz/NirAz+Jfpj/bEv66VeABhhzVPdaDdslSmI6ebl6yB8hjtkhjpTHe9fCdydlYrIiDfhCDqsnV9bdpuutpAiyYxxLiytsGVWdABtk8o9DcU4CXd3naErSQmvHfSH3qrk/xmAelzUDphztKoJErqF9wfjQF1VRz2PKMuRVBfjaaX0DUWDEBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EubbiLSoJ7gBkAT814XkFnEd7VOT3g+5pVKJpSG0l1c=;
 b=gXCcAbERJqCRQuOg+CNEEQ1BCheq0y5yLlQJlfrAVQvRNag9LcRItK0swqggorQc4a/8XI1G++BczOXBmThpk65tBw/lAEaphyDhSs26snccEq45aXAWwhsWo/HEVh9wW9l6/C4pSeFSW0kOg2qrZRvKIUBdRDaHYFaswPOQWe2Xxz4BKpCVghPzZQVaCRDn++PxUd2ElOdud0x1rwA2i6gcfQbmKuHhYwhMBCOn/+YrbNtnalpVGP0XQ4VeVXicOI7zzNy/z56/eAaf6hd/vtNwl6/1NMCeJh7EJ/gdv9GtwZL847MSTTkfyivuUrHcRdHbtG5FD9UX9Nqend/cAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58a47cd2-1ba7-730e-efd4-7ade1f415924@suse.com>
Date: Wed, 1 Dec 2021 11:55:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH RFC 4/4] x86/altp2m: p2m_altp2m_propagate_change() should
 honor present page order
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
In-Reply-To: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0051.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00b870af-3c49-4fd3-4d6f-08d9b4b920e2
X-MS-TrafficTypeDiagnostic: VI1PR04MB4383:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4383438B123ABBBFCB4015BAB3689@VI1PR04MB4383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CrGgslRV3CdEcWuRxSFRDUheEqFLzrSTULfmiOit9lW1BV5+uYlv6uDi5IAClaAR7CkdvCM3tXYPG5Kiy0IxVrvSKxjIo21E8CFNqsZm11M4jLftiGYQuVDKn+MneVm33noRUGrrEHgWFK85VcfsRM+dYrHRN9mcwqeH7UlvI+/BPcwugSvqkDP/JQ2sW8HSBMMDRAwz6Tk41QhEuTavyHyHUeOqI/zJqrS4/TAFdiyN6/C8FBTU5riHGF4qLTgLE/KDpfuRvk95TTO6QwCU4VIoQwerPFLW5IXcdkOAho51fw2NQvijJNJeq2HD1O4Kd9XnU/vhyvpT9t4JA4gExYGfb7+Q3bONkRGYBhHJc+HTDN6nx/01N2otDMTop3ANQ0hBX+apEo4hXv4Om5WowK4kDaUj0pK+PRdavuqSORP0UbQtzknchfMnGBlxll9QiotqTpqtyAmJgc9xl7Oo84KLpAz9hnajVrnOxmGCt4JSptPq7MF7p20QBiY4iaTEHHeAgD09r0IZMFcAzhX7mkY0LwRYl9lygafTeS2GH62dYVgY3gzYFNS1G2dA9fU0MnJpfo8SUCObTcbu4nhFwuhlIh8SCB9yCROOWsFLA7eZFX71JVgLZFo6iNTl9SnQvO49CII/6W6B+h0Z6CKvaKpjNCyAZq0A9vSwxGnWfkhc7WG36aDHZQKOLkW45wwlPRYT++kEiQsEby4J3EWkjfDbSfvfQS+FVTvf1xbstIqMrgjeTOmHJPfX3swC4MdUeQgMuGjwgigcmxAKN5lUlQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(8676002)(83380400001)(2616005)(66946007)(31686004)(8936002)(186003)(86362001)(5660300002)(956004)(66476007)(6486002)(4326008)(54906003)(508600001)(6916009)(26005)(38100700002)(316002)(2906002)(16576012)(36756003)(66556008)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzU1M1ZITW5DMU1CaEZkQ2lvNUhFVkh2UW04RWp3UENSTTgvZmNZOUszSThT?=
 =?utf-8?B?NkVxSUF3blNNL0xMbGJ2WURHWlkyclA5SmkxUUdKVEhpSEx4eGxiYkRJWU5J?=
 =?utf-8?B?SmxkNHhGNWhMRGFLK0dkNllOMktXTWJCNit4TlNvc2FkOUlvUkozOVdMaHJz?=
 =?utf-8?B?KzEzdmV2cVhXckZIUSsvQ2M3MzdoTElBOTdxeExZSkM4UEFWQnE1YjRQdWNW?=
 =?utf-8?B?a0JEVUFid1RNWEx0Zktja3RLSnBCWEZQd2E4UlI4aENycng1VHBRVUJTK2o2?=
 =?utf-8?B?QVFja0NBKysyTFVMNDJ6MFdSUnNaVlJBd29MWVRMS3ByWnNsT0lIdVJTVzdE?=
 =?utf-8?B?MWhzNU1uNmpCS2xNbjFmUmgzVkZtaVdEUGxHN0pvU2NHWUdEUWZPQUt2VUxB?=
 =?utf-8?B?d2F6d1BOUWFTMG5VeGh6a2hlN3RjVVRVSUZRNEZFM2tZNTNLY1V0bXkwMnMx?=
 =?utf-8?B?Mk9EVEp0YllSOEJRa1BXdFloU250aVM2MlJ6YmwxUytYRkoyR3pBNmhpRUkv?=
 =?utf-8?B?T0l4QlVIT2VTRWxmZmdaTU9jQXpYV0pzUStiVXFveXFpTE9JUU5pWk1CTVNo?=
 =?utf-8?B?WmVLU21yY1NHZGpWSFovQ0l0TlVGMzRMTDhONEJMQnliTUhLQWhKV2xYd05i?=
 =?utf-8?B?TFJDTENSc3hqUURZL0FEcWF6OXJqckY4WjZNQ3JzbFkxUzdwMEdCWnZ0RDVV?=
 =?utf-8?B?NnNrbjhOcVF3aFQ4WDRJU1l1c1J4Q2tSTmdmOWlWSmZFR2M3M1VaeFN3WGhz?=
 =?utf-8?B?c1RwbjBieFdvSmNXN3pqT3FaUjM5bmhHSUwyMGVRNUJnMkxUVG4wT2cyZ3cx?=
 =?utf-8?B?NjlVVzVIc3NnVWdRZXlKMklZeURudmhxY2liV3hhQXExREo0VkNEZ2QwQmdr?=
 =?utf-8?B?U1ZJaXNxaC9nZ3lIcGkxSnlWWmZUWlRKRWlQeEM4VVdwMHBObjlIN2hoUXRM?=
 =?utf-8?B?a3Irb0h1NndqVGYyVmVkaUFCbTdPMlpJSXNxN2Fxa1BNTUR3dk9OT1dyakxt?=
 =?utf-8?B?RXh6ZTJkb3VyK3gvRDF5S3ZvcWtCRXJ3Z0tLM29WZFh2S0IwZGVrZXF2Z2NJ?=
 =?utf-8?B?dTFMTTF4Mjg1Q2xhQ2xyR3VZU2kvdk4zYUN4aGlIbWNUV2ZHZEMvaGw2bWtv?=
 =?utf-8?B?UmNFQ29lLzdFM0I2V0kyNjdGczZtcEJqRWJIa2RYcUhwOUdIbVI5NGpxZXBw?=
 =?utf-8?B?UlZnNEQ0YXFMU0lKUEkxcU0ySENkNGRyOUF0dmM2VDVPQ015U2h4REdia2NT?=
 =?utf-8?B?bVdBTVlFb2JmdVIreDYrQTA1Y1l0b3RSMmFCbW1ubkNCdTRJVHEyZGYxTVRV?=
 =?utf-8?B?c1NJVlNsSytEVWU5VTA4WjJXbWpTTDZIemwvZlpHTG5mNStZbHVGK3R5S0xH?=
 =?utf-8?B?OUQrWEdJVmNjZTZiUkovL0MvRlRSVWNKenJYS21QVjNIeEJERDFDSTh2czBo?=
 =?utf-8?B?eERud1JxV3BSN2Y5SlliaXoxTTNqR2RVTTNPVllCZk5KbDBCMytIMnY2dzVD?=
 =?utf-8?B?TmlIbEpmUm1JbGZZRGVtYUt6dUhaRjA1UHE3SWdwc05LbXZyazlTSVV1ZWFY?=
 =?utf-8?B?bjA5QUdYaThDUjh4cWhLV21RVkFRRHp1NEtIWnFEOTNOQ1Fobk1wZE1GTEJL?=
 =?utf-8?B?QU00YURibE5seitKVHN0TFVnVStxdGx5cHJNTTc4cmNoOHFOZXNFMFdpMVM2?=
 =?utf-8?B?SUppV1RqTXZya0FvMXMvSWNCT1ZKTVMyajhIWGcveDhrblRNUDduZnU5aHpE?=
 =?utf-8?B?aCtURzZrbWgwb255TjhDNmM2bS9BMzhXOVJVTmpKbVBrYVBnemI2M3FDNGFk?=
 =?utf-8?B?VHNrUng0OTJDU1BPZ1ROUVVYWkFVaEFYaGZJeTVGRW9jUDZ4cVNIRWJFZjJ3?=
 =?utf-8?B?bGFxemxiQ1hjbmVvdHI2eVhObEhKc3BuSHJKMUhhQ283dklwanR6RmdQN2V6?=
 =?utf-8?B?cjhxZEZUUU9ES0s5T0gxRmRrS2tBUEJuTjBoSW5RaTdNUmtFSE1Gc0lxcDdu?=
 =?utf-8?B?clNHRzFISGEyc3U5QXNaZ3BSL2JHcCt4NStHdko1bjUyaTlvTFBiaDMwZWtU?=
 =?utf-8?B?SStzekNKR2p6VVdqWWtZUHdpY2R3VlpiNmUxRzV1bmtEd0NhUFd2OUFsNWc5?=
 =?utf-8?B?SnpYblN3STBzdGdVa0xTbUw5dFVMSm43TzEyejRIY0luS2VleU5rSjNSc0JM?=
 =?utf-8?Q?x8FlhCIT/ZSK9o8STyABZ58=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b870af-3c49-4fd3-4d6f-08d9b4b920e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 10:55:46.4376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyggMt3dIO6YL3yhqmaHi+DaZrO8aLIMf3GasfdYUVXVE/gvJnkjGWwsn6+rAc0MCHl8UUM1iQw06Ll+EwcTkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4383

For higher order mappings the comparison against p2m->min_remapped_gfn
needs to take the upper bound of the covered GFN range into account, not
just the base GFN.

Otherwise, i.e. when dropping a mapping and not overlapping the remapped
range, XXX.

Note that there's no need to call get_gfn_type_access() ahead of the
check against the remapped range boundaries: None of its outputs are
needed earlier. Local variables get moved into the more narrow scope to
demonstrate this.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I may be entirely wrong and hence that part of the change may also be
wrong, but I'm having trouble seeing why the original
"!mfn_eq(m, INVALID_MFN)" wasn't "mfn_eq(m, INVALID_MFN)". Isn't the
goal there to pre-fill entries that were previously invalid, instead of
undoing prior intentional divergence from the host P2M? (I have
intentionally not reflected this aspect in the description yet; I can't
really write a description of this without understanding what's going on
in case the original code was correct.)

When cur_order is below the passed in page_order, the p2m_set_entry() is
of course not covering the full range. This could be put in a loop, but
locking looks to be a little problematic: If a set of lower order pages
gets re-combined to a large one while already having progressed into the
range, we'd need to carefully back off. Alternatively the full incoming
GFN range could be held locked for the entire loop; this would likely
mean relying on gfn_lock() actually resolving to p2m_lock(). But perhaps
that's not a big problem, considering that core functions like
p2m_get_gfn_type_access() or __put_gfn() assume so, too (because of
not taking the order into account at all)?

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2532,9 +2532,6 @@ int p2m_altp2m_propagate_change(struct d
                                 p2m_type_t p2mt, p2m_access_t p2ma)
 {
     struct p2m_domain *p2m;
-    p2m_access_t a;
-    p2m_type_t t;
-    mfn_t m;
     unsigned int i;
     unsigned int reset_count = 0;
     unsigned int last_reset_idx = ~0;
@@ -2551,12 +2548,30 @@ int p2m_altp2m_propagate_change(struct d
             continue;
 
         p2m = d->arch.altp2m_p2m[i];
-        m = get_gfn_type_access(p2m, gfn_x(gfn), &t, &a, 0, NULL);
 
+        if ( !mfn_eq(mfn, INVALID_MFN) )
+        {
+            p2m_access_t a;
+            p2m_type_t t;
+            unsigned int cur_order;
+
+            if ( mfn_eq(get_gfn_type_access(p2m, gfn_x(gfn), &t, &a, 0,
+                                            &cur_order),
+                        INVALID_MFN) )
+            {
+                int rc = p2m_set_entry(p2m, gfn, mfn, min(cur_order, page_order),
+                                       p2mt, p2ma);
+
+                /* Best effort: Don't bail on error. */
+                if ( !ret )
+                    ret = rc;
+            }
+
+            __put_gfn(p2m, gfn_x(gfn));
+        }
         /* Check for a dropped page that may impact this altp2m */
-        if ( mfn_eq(mfn, INVALID_MFN) &&
-             gfn_x(gfn) >= p2m->min_remapped_gfn &&
-             gfn_x(gfn) <= p2m->max_remapped_gfn )
+        else if ( gfn_x(gfn) + (1UL << page_order) > p2m->min_remapped_gfn &&
+                  gfn_x(gfn) <= p2m->max_remapped_gfn )
         {
             if ( !reset_count++ )
             {
@@ -2566,8 +2581,6 @@ int p2m_altp2m_propagate_change(struct d
             else
             {
                 /* At least 2 altp2m's impacted, so reset everything */
-                __put_gfn(p2m, gfn_x(gfn));
-
                 for ( i = 0; i < MAX_ALTP2M; i++ )
                 {
                     if ( i == last_reset_idx ||
@@ -2581,16 +2594,6 @@ int p2m_altp2m_propagate_change(struct d
                 break;
             }
         }
-        else if ( !mfn_eq(m, INVALID_MFN) )
-        {
-            int rc = p2m_set_entry(p2m, gfn, mfn, page_order, p2mt, p2ma);
-
-            /* Best effort: Don't bail on error. */
-            if ( !ret )
-                ret = rc;
-        }
-
-        __put_gfn(p2m, gfn_x(gfn));
     }
 
     altp2m_list_unlock(d);


