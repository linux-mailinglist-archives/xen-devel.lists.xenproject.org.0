Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932374A8599
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 14:57:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264792.458027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFccB-0004yX-FZ; Thu, 03 Feb 2022 13:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264792.458027; Thu, 03 Feb 2022 13:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFccB-0004wZ-Bp; Thu, 03 Feb 2022 13:57:35 +0000
Received: by outflank-mailman (input) for mailman id 264792;
 Thu, 03 Feb 2022 13:57:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFccA-0004wT-Eq
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 13:57:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c24f490-84f9-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 14:57:33 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-nGaGM6nbO-Sj-DfWc9fsHg-1; Thu, 03 Feb 2022 14:57:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0402MB2886.eurprd04.prod.outlook.com (2603:10a6:4:97::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 13:57:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 13:57:29 +0000
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
X-Inumbo-ID: 3c24f490-84f9-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643896653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HJa4rCjZpzGIpqqFbd5+yMzWnrzq2hc8hkN/C3WC/JU=;
	b=M2fmy6iuDlJoZ919BaMMebGErQNx07KGZ6YBtZ5eWt4UV7Wi4fGrMK0BXXe8CbUNauKzlS
	FVm2y64+HBdlaeh8+V3j0QVSHMeAsdbxCn9/e7ONh62Hb/7Qki/tjQ3mhqbQCia5bLwC1o
	6fPha0NHgh0dHDeTlg4aC2R73G0O79o=
X-MC-Unique: nGaGM6nbO-Sj-DfWc9fsHg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcveZPoDEpplu4hdfKFVh3QqKiVLRWqp9l9Eeg1UDMko7j7Nz0CllMlLrh0OdfkuKadLzIXcPzOfe3pS7JJDpcDedWvW5b1L8yRTRBQNIvq4hpnXztRH1r+afGJS6DWYrHNMOrwR9EhwMoDkNyqZORPk0K6Gn42COormqIBLNYIekeRoih693KHuo45usucUL59hVS/SbIFeeLxM9PK2uIGg3cs69+VLCeSqG+L2mUBHp0yNw4L+uVUp6ccez4856p0OhuD9dJlSGTHSfZ7FIrVkp/90m6td0FD8/Dti2JgQH5SoZESmf0PKHDNl/sNeIPNLpqqnx/aBZxvUq+MjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJa4rCjZpzGIpqqFbd5+yMzWnrzq2hc8hkN/C3WC/JU=;
 b=I3Ol7i/EcRYvJb1vxxFr/ktptdW//OKnuVuRn556cpI/ANgpiBOJtg0m7vp3iiES6sL1XPH3RjLdXgqJzPUTMJJpUF4bK35n/UTPKI0fTQOXWeUgH9Of1RVZvu9lMnRvRIALFh9mNm4REVC4wVcsas2vF6MVRvPfML78yjRt3ehf4ce+CZcRLbAiG++SlRw+VPZ1VMT4UaWGhh/lZngd8nHcTyxlOeVVuK2ekcOb4NRYBbthlzg7a8LTxmAfrMAWMM09/ToOKE+JVA/kcGZUJceuBcDBKzi7E2KTW5fN3rAFO/2othBevpBxb5KpyUAGhp2ByHy9o+TNgOSeV8NFOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3564fe0-e375-b386-df0d-a5c2b54d1299@suse.com>
Date: Thu, 3 Feb 2022 14:57:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] x86/altp2m: p2m_altp2m_propagate_change() should honor
 present page order
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0090.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24167c68-0ce9-4118-65fe-08d9e71d1dd5
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2886:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0402MB2886F434933016DA10EF7532B3289@DB6PR0402MB2886.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W1V5lKgyCfUNLMlIM2U7jrI3mgxUQLxgjnApNTvmoi264tw/i1ZAlIyjAkYIF2ZKY+W7cjnRl4EWNUPmyaPFhlteImBXygDfsUnGVlv2CJ0eJF1ZmYA7HHQOVmgLV3gRuJAqXF+6SBZ8WwwLoZl8eTidR2jVhLhTUoYnSxT56dvcQOKh9UdA7V//8TYpEzeNDErb6yrNw7LTEDPhVK3KZZRc87lwGeBN5TsBFqrKDalwdSJeNZt/YrI3nd1Pdd+CaFq59bcUUB7yrxwtQEwHsUyFjAO79YhIpg0QlGOOvP6b+spAxC3INLT6ecPwKyivDMAfplv5asHYEk+j7YFS0kbJ4zbGtIXaP43urOzoBPREEgIr4wVOtKOI4y1t2O3WZaGxDqIepRAB0dqbBYNLgiCIGv2YXV+LTEDA/wdD8PYqtS4S2WIvmw+YTj58+5j++Swzmbs9T2XxkzgcJG9NGVgtEOPCiI+3FXEXpYpnaYKryIuIBQ0to1LpOXjJy9RkNJlU9T6yiUsU7xBGos28tr7/0dlrNk13CTfCyzkN0AbQ0Cy9ssHWDoNIqkuJ15LnQV0ueloqqcdUkiUvEudrR9U0SC9ycbeDdZh5ipz33DHYGWgY9dZif5TGKyO4JCYbG/CcV7w7r5BGb80u65HapHYjbw54rSqV65F5B4OAnwtoS7DPol38aIbxabeWhjegrdDLQfhkrEeyOd69l1IkrgNM0mdCWk0blSorxv1eQ0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(316002)(83380400001)(508600001)(2616005)(86362001)(54906003)(6916009)(31696002)(6506007)(8936002)(26005)(186003)(6486002)(66476007)(66556008)(66946007)(36756003)(38100700002)(8676002)(31686004)(2906002)(4326008)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW0vZDdOL0pjc1ltUkQvMXRYZXZNTnorZ1puZ0lIazBWYVpQUE5jTmV3Mitt?=
 =?utf-8?B?SmNkOW5XTlQzSS96TnBmbk0xeHJSUndKdyt4S1BpYlZqUEx4UVJIekh4YzR5?=
 =?utf-8?B?UEs0SkZYK2R2ZGROMWNGWS9WNkYwN0pnVzIvQTA1WHJqMXUvdnBqWTI1dE5E?=
 =?utf-8?B?VmN0WlhWWTkxT3g5SU5DWGhYVi96WG1PT2VlVmpTNVY1enJmc20wcjd2eHFF?=
 =?utf-8?B?R3U3eVFNMmVvS2IvSjQzSDhkQ2ZnT0FlTUppSitOOCtWM2FRWnI3dmFiRlpL?=
 =?utf-8?B?UFc0SHFwcStPUDA3U1JPTmVMSW83SHhBTkEvV3NmWVgySVpTNDByU3Y2Nmcz?=
 =?utf-8?B?V2pGRFdoMlZHRVFQMTNUdXN5eHNVcXhsTlNVSXFtVGloamhQbFE0QUpiVTFy?=
 =?utf-8?B?U1dVTUdmUTByK0JxTkQxNTRzcEt4Y2hvcWNaRUx3S0pKTy9CSzM0QldHMjdI?=
 =?utf-8?B?SnBGeWFwejlPbDRKRERSZHVkVk1HdkRsVEMyUTV3SmxUeVpKdEMrZjFYOGkr?=
 =?utf-8?B?bnlxZTZrLzJXLzZUcE5MNnQ3UmNuS3RSc2ZhMHpYTlJIaExTK3EwdGkwWGhm?=
 =?utf-8?B?dGhGRUltcmt2bXU0Z2xoQjFBV3FuL1NQM2lCaFdWL0g2eFVJbWhXUFZDa0tJ?=
 =?utf-8?B?Sm5wYmFHd3BEVEVIdDRoQW5lQUUvQTE5K1dhcGFCbXB1dll0N0s0WmhzNTBy?=
 =?utf-8?B?aXpTYkpwQmtjcE83eVZ6M1NnanFVODM5R2pxRGNaOVZyMTJ0L3BmcE02S1JV?=
 =?utf-8?B?V2RQcDJ2ZjA0ODIxSjgxNW1qQVJ5Q0xRVVVWZFdaR0djSFFHTllEcHdVN1Bs?=
 =?utf-8?B?RVJVSkdRaE90OHlmdnVoUllVYktrSkJKUUVKQjV4TGMyQ2VGRnBkeW1sdWdC?=
 =?utf-8?B?Z2VYd2xXeXZ6bWsrdVpQNVBRcFR1NitTZ2MySGtBNTdETmk1NzcwSWtzNHZO?=
 =?utf-8?B?QUJtVmIrbHEwNndsbHB1V1dxb2JEcDJjSUhiaXRZd05WT1ZucWM2TmhzZS9J?=
 =?utf-8?B?UVozM09QMmdDd2FqR0VVRFVEWFdvYzNrbGtROXB6Y2dhT0RaWjVROTVTQmhR?=
 =?utf-8?B?bW5pOWtWOHpJeWY3NVRMR1dnWC8yTDR0SUo5VGVMR21mSi9wV1NYZzY1dCsr?=
 =?utf-8?B?dHpQdWpyZHdZTktVTVZVMDQvajNZVjVpMDUwK3dCOEdXY3NJWUs3azFIWkZl?=
 =?utf-8?B?QkltK3JtOVRaYktYMGUyWS9BbFhSSUJNbTNvNi9POFFhVGtNTWM5NlJlWTZC?=
 =?utf-8?B?T25CS1hGY25rekphVHZWV0JOUTZlZ0lmaVFnTVdiTVVuaSt3S3BJZEluWUts?=
 =?utf-8?B?dmxTSUIvSkQ5NCtiai9LRmpsYjBQdWI1QXNQMXpTZnFidzNQR3pYWHg1M1Nj?=
 =?utf-8?B?bGRTK1NjTjd0NGJWd1VxdUx5T05yU0ZaZTBKOVRRV1VsZEwrM2lpMlJZbFNz?=
 =?utf-8?B?VEgzSklkSzYwUk81MElVQlRqM0JkNU5uOGpHTjdkQXVQYXRTQTJyWDVTcXVX?=
 =?utf-8?B?ZTd6S211WURDQmJiUmRxZUNPa3JoNUl6RGo2V0hONGRmTGJVMkE5d3hKeVA5?=
 =?utf-8?B?eXRFNnBYdkFFUENuVW4xL0E2eVJoQzJISHN4ZiszQndUSjNWTFppNVdpZkNr?=
 =?utf-8?B?UVhqc2swNVYzc1hpS3N4UDBjcXpqMUo4bENRb3I3U3Z1eEdkM3YrSEozd1pF?=
 =?utf-8?B?aFZtNHE2enQ5bjQxb3lpR2NKZ25PRDBMdk53blJqYXpwcm1oYlR2N1ZNM2U3?=
 =?utf-8?B?ODI0M3A1Ti9NRUkrU2VQWGhQa1RSb2kvd2lCMnVvZFRydDhMN3BudjgzL2pi?=
 =?utf-8?B?Sml3RVJCdHU2NzFxZzZ6bVZYcThNWEhUZGZjR05OZ1BJTE4zMmlqcUVocS9h?=
 =?utf-8?B?bEFscEx1MHNsbHRJMVlEMmpGWUJaVkp6NWZLZnMzR3ljeHNQVUwrMFhRWDdr?=
 =?utf-8?B?WVNsY2RRc1FuU0orMWc4dytOTG5pR2g4MzRxTkZqbG10UlB3dUIzTmdWWjJr?=
 =?utf-8?B?NitYUHFvTzZOZ25SdXhpK1FYZ0hNeDR5bXZtaGlaUFFaVVErc21ncE9aWE9X?=
 =?utf-8?B?QUtXSDFkMjJZZGRQbU0xSEJzTlBTQ0V1Y2ZHK3JBdjljMEFSQ2wvSGZId3VW?=
 =?utf-8?B?NWtHOWJwVmtOZC9jZVR6ZklKaG1SOE9OdWpjUXVZOWNIQmlRNHJWK3hMTm4v?=
 =?utf-8?Q?kQpJuv71JMsWRl9aXtpQQT4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24167c68-0ce9-4118-65fe-08d9e71d1dd5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 13:57:29.2415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ualy5lrZIBZBjrYlC8LSzLA1Qc1EFKGyYBUXBvuFLIyvQjt0QwkGKn4/ctzSOBbB2/2yG4Fs6R8mfHtYsUR0hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2886

For higher order mappings the comparison against p2m->min_remapped_gfn
needs to take the upper bound of the covered GFN range into account, not
just the base GFN. Otherwise, i.e. when dropping a mapping overlapping
the remapped range but the base GFN outside of that range, an altp2m may
wrongly not get reset.

Note that there's no need to call get_gfn_type_access() ahead of the
check against the remapped range boundaries: None of its outputs are
needed earlier, and p2m_reset_altp2m() doesn't require the lock to be
held. In fact this avoids a latent lock order violation: With per-GFN
locking p2m_reset_altp2m() not only doesn't require the GFN lock to be
held, but holding such a lock would actually not be allowed, as the
function acquires a P2M lock.

Local variables are moved into the more narrow scope (one is deleted
altogether) to help see their actual life ranges.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that this addresses only half of the problem: get_gfn_type_access()
would also need invoking for all of the involved GFNs, not just the 1st
one.
---
v4: Restore mistakenly dropped mfn_eq(mfn, INVALID_MFN).
v3: Don't pass the minimum of both orders to p2m_set_entry() (as was the
    case in the original code). Restore get_gfn_type_access() return
    value checking.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2534,9 +2534,6 @@ int p2m_altp2m_propagate_change(struct d
                                 p2m_type_t p2mt, p2m_access_t p2ma)
 {
     struct p2m_domain *p2m;
-    p2m_access_t a;
-    p2m_type_t t;
-    mfn_t m;
     unsigned int i;
     unsigned int reset_count = 0;
     unsigned int last_reset_idx = ~0;
@@ -2549,15 +2546,17 @@ int p2m_altp2m_propagate_change(struct d
 
     for ( i = 0; i < MAX_ALTP2M; i++ )
     {
+        p2m_type_t t;
+        p2m_access_t a;
+
         if ( d->arch.altp2m_eptp[i] == mfn_x(INVALID_MFN) )
             continue;
 
         p2m = d->arch.altp2m_p2m[i];
-        m = get_gfn_type_access(p2m, gfn_x(gfn), &t, &a, 0, NULL);
 
         /* Check for a dropped page that may impact this altp2m */
         if ( mfn_eq(mfn, INVALID_MFN) &&
-             gfn_x(gfn) >= p2m->min_remapped_gfn &&
+             gfn_x(gfn) + (1UL << page_order) > p2m->min_remapped_gfn &&
              gfn_x(gfn) <= p2m->max_remapped_gfn )
         {
             if ( !reset_count++ )
@@ -2568,8 +2566,6 @@ int p2m_altp2m_propagate_change(struct d
             else
             {
                 /* At least 2 altp2m's impacted, so reset everything */
-                __put_gfn(p2m, gfn_x(gfn));
-
                 for ( i = 0; i < MAX_ALTP2M; i++ )
                 {
                     if ( i == last_reset_idx ||
@@ -2583,16 +2579,19 @@ int p2m_altp2m_propagate_change(struct d
                 break;
             }
         }
-        else if ( !mfn_eq(m, INVALID_MFN) )
+        else if ( !mfn_eq(get_gfn_type_access(p2m, gfn_x(gfn), &t, &a, 0,
+                                              NULL), INVALID_MFN) )
         {
             int rc = p2m_set_entry(p2m, gfn, mfn, page_order, p2mt, p2ma);
 
             /* Best effort: Don't bail on error. */
             if ( !ret )
                 ret = rc;
-        }
 
-        __put_gfn(p2m, gfn_x(gfn));
+            __put_gfn(p2m, gfn_x(gfn));
+        }
+        else
+            __put_gfn(p2m, gfn_x(gfn));
     }
 
     altp2m_list_unlock(d);


