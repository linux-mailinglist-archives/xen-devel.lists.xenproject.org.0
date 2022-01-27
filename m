Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7A849E571
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 16:07:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261548.452975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6MW-0003is-On; Thu, 27 Jan 2022 15:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261548.452975; Thu, 27 Jan 2022 15:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6MW-0003fs-Jl; Thu, 27 Jan 2022 15:07:00 +0000
Received: by outflank-mailman (input) for mailman id 261548;
 Thu, 27 Jan 2022 15:06:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD6MV-0003fm-08
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 15:06:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c57a4628-7f82-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 16:06:57 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-DY9EwIZUNZmVuwsM6ksnBA-1; Thu, 27 Jan 2022 16:06:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6759.eurprd04.prod.outlook.com (2603:10a6:20b:d8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 15:06:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 15:06:55 +0000
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
X-Inumbo-ID: c57a4628-7f82-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643296017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3ERwCWiy09e/X7t2Ph27wCKPGARBVC8AE1wNG+vQlrM=;
	b=BDdXwoFb398cjeNtoX3u2JvM5G9tldXzcp5oRklagzIkRc9X+rQUcPi6xox3683LbLMz3A
	qc9JX7SZ63B5EuQDAlNMdJ3gqWs7srhEEKXP1f/wZZ/49A60Q3RCkmvWPoz1pYeFy2V6tY
	TNWDplxzrpqz0LKryTJorMrErchVwv4=
X-MC-Unique: DY9EwIZUNZmVuwsM6ksnBA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYvvsp2As2D9tJ0nTTiS4u02ubzE1o/NpgxvXUmGuYn5Up6+/LCDsp6mEJd5yfAFEyCdESjgUOY2JAqWl4V0dCtVGj65KinkrYmsMLcPekSSUHbfds+/cDKpSqsRFifPtZKJiJYF9ctjcZdCyOl8+tzUh1kgLfjXyjye1FmtgwcAY8vnAJQ6DAcHP7QXXMZXC4c3VxIMymSRAwSSU+oJJi9XihV2zKH3bRxTwrn276EWH0s+Q5G7xIjnpUkJwPT3zAU9+tyiY/rg107nSlsXRhQ56W9n5XcBlYff8QpuB5QFxV3ILnOTVC+dXLqapFXPeih7k81HwZKb1q39Pg/otQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ERwCWiy09e/X7t2Ph27wCKPGARBVC8AE1wNG+vQlrM=;
 b=LxQJ0U/6jAa8WyW3kY55t3o5yob5H809/wuCFvJ1zRxM6xo18LXTtqBmNGQG7wwIkGz+D8papCXLrDavPxUifoLOOS2/6ntWPZyBte4ZDrBmPJokXyaOOq+AuCkQi0+BTdznvAznlbSwnjbM5Elc6nfzF5WACtDG1fl2jGtihtEeLSmD+nrxsxz4HrbBBJXnN4jV9Tg6rGoXGDcTXcfGbW38s60+9N8+8imBslMA9631LslCg/MVs+wzvjOn58vI2e7mhabHtlpU41sNf+BEQzU9Uw4TyfdoDehlBT1bLa3lMKKidZ7evYK/U6f/6a3uIYU8UzV1rRpICo79FLwoSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c421077-81c2-a45e-f7c3-9827d3cb1abf@suse.com>
Date: Thu, 27 Jan 2022 16:06:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/altp2m: p2m_altp2m_propagate_change() should honor
 present page order
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0018.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52177856-303c-40f9-a1f8-08d9e1a6a824
X-MS-TrafficTypeDiagnostic: AM6PR04MB6759:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB67598CE467ECCDCD4DEC3D6CB3219@AM6PR04MB6759.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3IahKMql4y2QdF6rTKMJomI/4LF7Zcfx8m09OD8u8oUD6kduHmlBobaHyepG9KAY0vunRy4NVRBQRxg2wNFphy0TkqofidTaX588wXnTSTSxBjSUppx9s/MTAabXyPZ2JPcO+IUXh8jWagVFcqCwW60pYEB0W2Hc8IHNcmvSeIxiG30Vf2w/kKfjFbDUKG1uMFytGVUXYJ1y1Aaz6u1j8dbaUkkdnsb4ZaavfcP5URMAlCeNtbvU8VTamlNaab5TeQhEsk6xKfr1dT8PZtWpSI6o/et+fzm2ieO313H6cxAIihN3BAwrC2CMXHrwJDZ5xTTqKdrxcbnOBy7MHqwTtAOAhkfTd9elx+RYBXjn1C2tmRb833rwzpoog2/o7NlFLnYhhX+gJVA9WHObqUUeGIazwxGfa6iPYo3Ay4GIOuayM8G7VUN0e7pQP60mV3B0dFlz3mUVTtjmDbmH0M5Pg3QlxG+/cMQ3/SYseUSQYp3RCGyeY8HeUcNYzNjvssrfUTYs6dSwgddCLWBtyiwf2m4Ca9IobKKq4ysDdRx1ZcFAy3VliHZZWq4ybZA/T3DYiOxGIO03IuvUSbPZPSb904r3yRl1vN9NF/sV5zNnFOGlDd0nm+vw3tY70/miU3s53QU17/1XaddNY+fHK/jUk1x1yFKRZwQyjikj70iusGnlFlPVFsC0TvnPuXzRd4PvffyBe6jg73E8PjNCfxdcq16ZSSRWYCuF/lg5FOsdi6xXcPopoqy/TkQFh0fqs5Qq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6486002)(86362001)(6916009)(31686004)(2616005)(36756003)(38100700002)(186003)(26005)(316002)(6512007)(31696002)(508600001)(4326008)(8676002)(5660300002)(66476007)(66556008)(66946007)(8936002)(2906002)(6506007)(83380400001)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG5hN2w5cGlqVlU4TzVucmJJWnovWlIvck0xTzl5SFAvZTFzRFBYVUxkNGF1?=
 =?utf-8?B?ekFYbG9YaE5zeGs2bnZHcmNIQ2p1S3dSVVFJLzQ3QlB5Q1hwQkpmYXo1L0p0?=
 =?utf-8?B?ckp3UXg5VkZ0TGhqQ0hHU2p2WENNTVY3eHp5U2UxV0JUbEkrYjA5cVE3VDlT?=
 =?utf-8?B?eWtIWjBKV3NKY0o4alA4akpLRWxOSUZyaVlhMm5PUjA1cjRHREJZT1UyYjZT?=
 =?utf-8?B?U3RWWkE5TWI1SGtpMEtUZmdIZ1BZV0w3S2QrUU9VRGJHdE9JUWl0WWh2NGwx?=
 =?utf-8?B?VmlVNDJxVG1sU3E3cTF3Tnh2LzF6R1pOeTZTaENEWnRqeHdZZFlJWjFFdWpB?=
 =?utf-8?B?cGxUR081NWhpcXh3bUo0Y21EM3JQa3RsVjZOaUk0d1VZdmZMWlUvdW90SFgx?=
 =?utf-8?B?MFlmLzIvcWtpS0FzdmVpUGFFWUNUN3FuWjRBaVJodUdZZ2VMblZ4NUxKK0Va?=
 =?utf-8?B?c3p6bGhENXNLbDlYbmdOSEJzZ3Z1SmhWMjh4NWw2K0Y3aGppVmxXYkJQUWt4?=
 =?utf-8?B?RnlycGx6cFdjRlFiamJVSWI3R1AzWEdTVTF5Vm9NWlVMRHIzYW9IUVA3a1FW?=
 =?utf-8?B?aXczWHA4UEZWVWRZTXI2V3h5aG52eHNPdW5wUzZUNXN2dTNYZzN0WE1HY1JK?=
 =?utf-8?B?M0dTWDdacWFKYzJLM2ZoM0Jzank0VDNreCtvR0xQNmJGRklNODlYT09OV0dt?=
 =?utf-8?B?V1BwZysrSUp5NjlZOHhBWWZQSFRKNUE3cldHRzRGamlsZGxOamFFSTRZQUNt?=
 =?utf-8?B?ZTN0Zm9qZktVRlEwTGpsU3BJSUtyS0NxQldTUGZlMXlOR1QrR3krWnNaQmhj?=
 =?utf-8?B?YmwzQlZxU3FTVHNaVTdwcG40SHhTaWlrTW5IUkZXeGNsOEdoeUVkMmZVcTFs?=
 =?utf-8?B?S3ducUhLdXprWEVwemVLYmcwRmhQQXhIL2MrNkNKWjczcGxUTnBxTmw1K0FI?=
 =?utf-8?B?ck5qYWIzdjlsNDBGR3JqOEVGNVR2THBPeUp1SHM4T1A2TFZaT2huWmdxM1Nl?=
 =?utf-8?B?K3VJUW53TGhkNDdkNDlJUmU2ajRyMnRvOXEwQTZyQ1owaVBzWmNkOXpSRmdL?=
 =?utf-8?B?WStKbS8vT3RzeitsV0tWUlJtRXRqZUpQT041cGl5c1dGWlJvenFLcWx4d2g4?=
 =?utf-8?B?eWs3TTdHaFpCcC9rbWNISThkZXlFbUJVT09TeERHaXBjZS9oRU5WQ1Y0dDVG?=
 =?utf-8?B?b1huSGR0aG42b0FNSFVyalhaK0xjMWc1c1AxUlFlTDZKa2taQytEenJ1WlE1?=
 =?utf-8?B?MWp4VjZRWWFONUxmR0tPR1hpUFdzOGwzb0w2bWh2YmVodHdReGRIYXdMbFQx?=
 =?utf-8?B?VDN1c0dWc3ZvMzVJR0wrL2xla2E4VHVJWnVxaGxoTUphYWk4UkpENWc5UnRl?=
 =?utf-8?B?Q0NMY2NlNXlGTjJONWFqSzg1L1l4bkRFaWUxOElROGRSU2kzemZFYkVHWXQx?=
 =?utf-8?B?b01QWGhHdGlsN2l1WGdKdEt5aytyTEk1Qi9IWHlrekNESjhVbkl5b2VXMmdN?=
 =?utf-8?B?WjA4ckMrSDVEYnUzSmJRNS9mZmZ0cDg4cVZrYzZIWXZnc1htanJSUUdNM1Bo?=
 =?utf-8?B?YUJRVFBESmlhMGFKRjJ0ZnppY3JzWmZGMG9uZENpcGRtK3N1Um1HWmNXRjVY?=
 =?utf-8?B?T2xXcDFoSUlDZjFtblQxUzBPRmJrVEU3K3VWR1hFL1BWbXZOeEpmUnJneDJX?=
 =?utf-8?B?Ymhxbk00WHRBNXBabWh0bzJtajdRQkhSNFVvZXBTVVhVckR5aVladFdjVUtD?=
 =?utf-8?B?Zi9NMVlXK01WZWx5MEFQejFQeU1ZVWo4V3dHYmppV2lHOGcyOWxqOSszVVJ1?=
 =?utf-8?B?U01UVEVDMk9MbVBBNkVKVjUxK3JyTGxoaHlwWWl1ZTQvYnFJNU1SdzJ5VHV3?=
 =?utf-8?B?L1FldmxFeXFickxJRUJYVm5hcUxwMjE3Q3VJVDFhQm9qbFBmU1A1M1RnRE1q?=
 =?utf-8?B?SmFtTkluU25rK25DOE9CY2w0S3E3cHlxN20wdlp6SHhKWTFBNEtsRkl2OTE4?=
 =?utf-8?B?cnVGNGZSREt4cHpZelA1bTZkM1ZDNzZ3REZBbVpqQTgyNHhqaGtHNy9VckNF?=
 =?utf-8?B?aDdteWx6OFhhZWV5bTl4U2hCVmxYV25XMjAwUmxEbG1QTWRkNlpzbVNQcUkv?=
 =?utf-8?B?dDN0RUxwaUQ3aVNyOEJIWFZRMk96NWRadHJDK09HcERqcGVZWFNmMU5sOTZ6?=
 =?utf-8?Q?KVnqvPnpX59YFVtaKQMa2Cs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52177856-303c-40f9-a1f8-08d9e1a6a824
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:06:55.2679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omJBGNclObLrthOD5uHBECBE/Iso0Nokstl8tSvbY0NvWAaI8UaCFU4owWi8Km7AeEd0j7rEDhCKAPvFIwBqYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6759

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
@@ -2549,15 +2546,16 @@ int p2m_altp2m_propagate_change(struct d
 
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
-        if ( mfn_eq(mfn, INVALID_MFN) &&
-             gfn_x(gfn) >= p2m->min_remapped_gfn &&
+        if ( gfn_x(gfn) + (1UL << page_order) > p2m->min_remapped_gfn &&
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


