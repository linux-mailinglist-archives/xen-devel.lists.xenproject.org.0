Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCC842C4ED
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 17:38:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208676.364898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magL5-0006bV-Q2; Wed, 13 Oct 2021 15:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208676.364898; Wed, 13 Oct 2021 15:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magL5-0006YA-M3; Wed, 13 Oct 2021 15:38:43 +0000
Received: by outflank-mailman (input) for mailman id 208676;
 Wed, 13 Oct 2021 15:38:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1magL4-0006Xw-7e
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 15:38:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3b9f566-2c3b-11ec-8181-12813bfff9fa;
 Wed, 13 Oct 2021 15:38:41 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-7T0q3v30OQCzmBEYKn62Lw-1; Wed, 13 Oct 2021 17:38:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6381.eurprd04.prod.outlook.com (2603:10a6:803:119::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 15:38:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 15:38:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0102.eurprd04.prod.outlook.com (2603:10a6:20b:31e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Wed, 13 Oct 2021 15:38:37 +0000
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
X-Inumbo-ID: a3b9f566-2c3b-11ec-8181-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634139520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ukLUF7Im/PJ2Z8SrCJMh3Wvu3vUEqtNNwX8+b+BQm0A=;
	b=Yl0pOEqGeBlnq4zfp+va1W8bNOdEJUQozYdURXu+djwKCVAEEfwgPL+PaXJ+aMlJ43MXBj
	+K77DNgZHC7XuxjKkGPTrIDdmQYyHB2uY9WLWpOFSfiEpKWDuitLotQHBCIyxx2GFricBL
	xk0ngIaldVbg3PY0nue8+DIJS15sq10=
X-MC-Unique: 7T0q3v30OQCzmBEYKn62Lw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ha/w4ryFwYX8WRBRSyWxVH2PsFE8/Chr6ilYGYBn0xGun/M/pvmhaUnYX9JqEryrg2aNN8sZ2owEMpWEFTm00hF/sVB9V7n6Rp6Jw1WisZibqLQsyWq9IE84Bmi5CUGip4iJ8yatEtVrMoWhYFyzPy527DTRIE7q7nNbuotoqIKwud7L9F84E2PJLPVtO1ERrs8Og+yaO29eWaV25wERiGzj3VPbV1DHJ/zliPdAzgBdMIzq+xRBk0gZyd0EITNkIEsDHpXTL0VaZ0r5ZIn8oaVVH1oCvySHdkkluZIvJtJ8F08xv0vH8mF1zBoapXw9+umoL3fPbtN+PTnHjagpCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukLUF7Im/PJ2Z8SrCJMh3Wvu3vUEqtNNwX8+b+BQm0A=;
 b=gbchrw8qOtYgi5z8sgjNgo9T21aMoVC4pdJBkVpRZRBMdmDeeBRbCfEx3UoAiOSKshPhAECRqdSMp4ODAgNO3bogrEYj8DxIT6NoWb0TAXrgElwQ3++/vZkejVlwcVVccylPh5IRyAH1Eek16O5NwmQdT4yJohsfltFLFQqvxoe/bSqtLZKu3T2NUw1uHVaw57c8Cns8Fkuz9q3NZXRaD/a4IrYtkQ2ZpjWdkI7eR+zP0iTm/RJcOrqMhL8dumSSbZrH0Ne9H/C5K4YxEviqNO5h1HCoHSMzuiHMrRts33IQ1q/83g0xKoV2RyLq5hOghV3/nZSg6GBLjIdl8h9PUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/2] x86/shadow: adjust 2-level case of SHADOW_FOREACH_L2E()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <24329000-06d7-2047-b0a1-51b149d19189@suse.com>
Message-ID: <b2f750c4-3aa3-e560-626a-c7fa921cf4df@suse.com>
Date: Wed, 13 Oct 2021 17:38:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24329000-06d7-2047-b0a1-51b149d19189@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0102.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97c07bbc-f418-4007-8c3f-08d98e5f8653
X-MS-TrafficTypeDiagnostic: VE1PR04MB6381:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB638174D21CB028FD9AF25CDAB3B79@VE1PR04MB6381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nQSZ3NaqL0K43AsbQYzkGL+uI3hXhSD9yL6iqE4SA2Ee9pa6DaGCYTYsWYCgXtc1w4L30DSinGg7U9F5Q5veBYtcvHj6xQD/biNpyY60sJwLTGw3A/4DdbCwYRkDnpr9QEYtk6FQ0CUqhN08Y97YtDC5T0ZGNaNC+nDykGyouKecEiQPuH5GgCasSw7tfK4RH50ESivglzkcTPKymrGppqoZu+YTVwY30aoyxhMlJBETzXruR0naGELQE6ZIf5dGBUmZXemhx3Tbu9TvxR9k6zHqd9KdF8m/WZoV6R4uItbaFIXkx5oHoMh9pzQZDWOuvgNzvTtAHeEod1GMYT+rt+T7G6/8jPBTDBG6WAurNl7i1QTWpm8et+Bsy4jRqT8PC+LNh4v1byrtS3bOYm55SyJjwCV+/OM7+YFMeGItx3UcvYnRbTDYj/+Y7gOt698R4SLzunp/+mQiWmO4Zv8oYtnipE/zYDo9ZXGqYRaUL4y92xYJiyB34liFshCKKu3tlz2YExR14Of2s5WWekodbRxEE8j01yf8vvomO9QA80q2I0CS+QG94+0n5AxgBu7tiUExm2x/VA7Ejr5YaHltoriiEfsYq+VXhxW+dTjdNTX5OTqK+TejF7uFiz4qjzxA9dfpMjIDxyARE6KiWHSAOfmML7+DGu16q5WmSuy+Vr0walYVMrtZxHM+NmbI3tE1X9a/+YPlLQbLyhmHHJs0UP7z787dYWZJjmFU8ccPxWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(38100700002)(6916009)(8676002)(36756003)(16576012)(2616005)(6486002)(54906003)(2906002)(26005)(316002)(31686004)(66556008)(508600001)(8936002)(66946007)(4326008)(66476007)(86362001)(5660300002)(186003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2F3ZGRJaDJ4ZVFnQ2pkZVpMM1Zydys5TlI0L0loOU83UzdzZmJMcUZsQm9O?=
 =?utf-8?B?M3d3N1VGQzdUckhTa3EvYjNMSU02YyszZ3EwM2ZYRkI5dU9OVXVhZVk0QkFC?=
 =?utf-8?B?b2ZqU0gxNlJVaDk3OVQ4U2Q4SUNNOVJFYmFtRFlpTzduTzBQdnZKUzNMNGls?=
 =?utf-8?B?VGJ1UTkweStIN2VlM21PVU1yMWNCRmtKdWR5QmhGeE8vWDlIMklTZ21Cdllp?=
 =?utf-8?B?Q1dXZ1dLMFZkK2ZKNVNJcGNWcERJT2JYbllkMFpuODlDeVhybXlWajZ2KzV4?=
 =?utf-8?B?YnFjaEM4bmY5ZWw3TFQ4YitBQnh0Qk5aZWNJdGtBZEVoc1NlYit5V1VweW1R?=
 =?utf-8?B?ZUhWb2VJU1ovb1V1eHF0dk02OG5aMTVwVWNqdktVTGhSSWRIdm96TDArTWxX?=
 =?utf-8?B?QkJ6VUo2VUdPV3h2Rk9FK0JBRkZydkhuVTZmVElkWFk0QzhycC8zUkppWXE3?=
 =?utf-8?B?R2ZwQ3lwZEZZRFAvbnk2YUdyK1hhcFBBemwxNGNtSU1OUWR3QVp6b21URmI2?=
 =?utf-8?B?NFJKQzhicFZlQ2VsaVVVZVdDblpUNXRiVEpOc1FzL1RqTkVSN1JwV0lxcjJR?=
 =?utf-8?B?OEZKRXlsMWk0UUpUS2F3bFhZNjFLR3hJOTgrcVdvNUh6NWJLRzg1Sjg3ZGhW?=
 =?utf-8?B?VmVyWVcrT0taMEVYUnQ3dDJlMWpmZCsvb1ptOGVYVEFvYVpaM210VlNock82?=
 =?utf-8?B?Q0VRKzhFYlIzVGtKM2gxa0FpcDl6S0UzaHp6U2xaZ1owNllmeXZ4ajQ0TUpH?=
 =?utf-8?B?a1FqRDVIMTVaUmNMTURUVGhlSzl2UEJGSnFBTnVGaitrNEk1cFl1UTJvK1po?=
 =?utf-8?B?L3UzdW9weVA0b1ZpR2dpdlZSMHdwWlRkcTJia0VKemk1SG9WdlAvV0dxY0Zm?=
 =?utf-8?B?ek1nZW9TR0tkd0JWUExKYnlBYTJCazlxTjhQZ0xtejdpNE9tQWVQRjhCV2lo?=
 =?utf-8?B?QjZLVmhtRStuSW5GZ3FtVG9HcUEyOEM3RitTTlQ3dlliRnVMa2F3SGRKRjdv?=
 =?utf-8?B?K0p4K0NRdVVtcW5LRE54R1UwYWZLVitYNGtvSlQ4R2NwVE91RHliVEswZDBE?=
 =?utf-8?B?ajM0ZUNJSzhqN3lQYWxhWnpzVEpITG0xMk1oUFo3N1cxRWwxb2pHeWd5NExW?=
 =?utf-8?B?cmtvWmpGeWpLeWlnWTA3TjQ4NGxyRi81Tk9PNk1TTHppTE15a2t1OEJWNjdI?=
 =?utf-8?B?RXlaM2IrZTZSU2M4TXFWSmpIK0RZNVNYSU5zT0JwWGpFaXpYdzNPMGxvZmkr?=
 =?utf-8?B?OE1SQ3FQaUFrZ2gwTFN2V1c4WU9wOHdVRmlpR2VmWjdrRjRxekg4Q2xJTThk?=
 =?utf-8?B?NW02VVhFcFJJUWhWc21wY0hNdTRRd3RuVitUOVllZm1Sbjg4R1NEU0hmSGFa?=
 =?utf-8?B?bFd5aDFlS1ZPT0lVU1BpTGVvQzhlSW9iUkpFK1VGa2hYaEprRU5BNjNXU0Jn?=
 =?utf-8?B?RWRLakUxT3R6MUlDcXdrdm9vTWF2ZmFEczFVNkxVZkJMUFRjT3FBbGNxdU1v?=
 =?utf-8?B?d0tDYXdIMXNzbWJPRWE3c2FBT2tFQWthR2xHTk5vUGg5L2UyR3UzNlFYOVZt?=
 =?utf-8?B?bFloaldBbkptQkNIa1YvWU1kR3FUUTJodG16cEhaU3VDbVQ1RFRTekZ5M1ZV?=
 =?utf-8?B?V0ZYV0dwS1grcnZEUzNFNmlxUWoyMHhFVjduMUh1cU9NVENvOG1CV2ErbnRw?=
 =?utf-8?B?Y2VvYXY0ZWhtb2FiUFp0aTBiK0lDbzZxQk5sVTNoMWRWcXNyMTBrbzJ0MnBF?=
 =?utf-8?Q?XYNOENZdVy1J3SQREw7CghK5QZwczwf1MpMysuy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c07bbc-f418-4007-8c3f-08d98e5f8653
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 15:38:37.7085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tI6VZJry/Y+7Iz2shnDJ+/Py+V74tgSKpq7koLBTzd6sqUmNwa3iN2phe2YjKSTcFfu0t7khbHxs7N5S1HgUVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6381

Coverity apparently takes issue with the assignment inside an if(), but
then only in two of the cases (sh_destroy_l2_shadow() and
sh_unhook_32b_mappings()). As it's pretty simple to break out of the
outer loop without the need for a local helper variable, adjust the code
that way.

While there, with the other "unused value" reports also in mind, further
drop a dead assignment from SHADOW_FOREACH_L1E().

Coverity-ID: 1492857
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Looking over other SHADOW_FOREACH_L<N>E() invocations wrt their uses of
"done", I find the audit ones particularly odd: The respective variables
get set only from AUDIT_FAIL() and AUDIT_FAIL_MIN(), but in both cases
after invoking BUG(), i.e. in an unreachable position.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -794,8 +794,7 @@ do {
                          ({ (__done = _done); }), _code);               \
     _sl1mfn = sh_next_page(_sl1mfn);                                    \
     if ( !__done )                                                      \
-        _SHADOW_FOREACH_L1E(_sl1mfn, _sl1e, _gl1p,                      \
-                             ({ (__done = _done); }), _code);           \
+        _SHADOW_FOREACH_L1E(_sl1mfn, _sl1e, _gl1p, _done, _code);       \
 } while (0)
 #else /* Everything else; l1 shadows are only one page */
 #define SHADOW_FOREACH_L1E(_sl1mfn, _sl1e, _gl1p, _done, _code)         \
@@ -808,10 +807,10 @@ do {
 /* 32-bit l2 on PAE/64: four pages, touch every second entry */
 #define SHADOW_FOREACH_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)     \
 do {                                                                      \
-    int _i, _j, __done = 0;                                               \
+    int _i, _j;                                                           \
     ASSERT(shadow_mode_external(_dom));                                   \
     ASSERT(mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_32_shadow);      \
-    for ( _j = 0; _j < 4 && !__done; _j++ )                               \
+    for ( _j = 0; _j < 4; _j++ )                                          \
     {                                                                     \
         shadow_l2e_t *_sp = map_domain_page(_sl2mfn);                     \
         for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i += 2 )         \
@@ -819,11 +818,12 @@ do {
             (_sl2e) = _sp + _i;                                           \
             if ( shadow_l2e_get_flags(*(_sl2e)) & _PAGE_PRESENT )         \
                 {_code}                                                   \
-            if ( (__done = (_done)) ) break;                              \
+            if ( _done ) break;                                           \
             increment_ptr_to_guest_entry(_gl2p);                          \
         }                                                                 \
         unmap_domain_page(_sp);                                           \
         if ( _j < 3 ) _sl2mfn = sh_next_page(_sl2mfn);                    \
+        if ( _i < SHADOW_L2_PAGETABLE_ENTRIES ) break;                    \
     }                                                                     \
 } while (0)
 


