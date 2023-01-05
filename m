Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF53A65F0A8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 16:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471987.732066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSec-0000MI-77; Thu, 05 Jan 2023 15:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471987.732066; Thu, 05 Jan 2023 15:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSec-0000K3-2z; Thu, 05 Jan 2023 15:59:42 +0000
Received: by outflank-mailman (input) for mailman id 471987;
 Thu, 05 Jan 2023 15:59:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDSea-0000Ja-9G
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 15:59:40 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061.outbound.protection.outlook.com [40.107.247.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4cccead-8d11-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 16:59:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8498.eurprd04.prod.outlook.com (2603:10a6:20b:341::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 15:59:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 15:59:36 +0000
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
X-Inumbo-ID: f4cccead-8d11-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKo9nrP3Em0BVszABkaGrsSeWIlHIN9fKTE80L45UsjljkAUV7OPHNltFpikUE4zE0JxybWBtjOn+wwRPRmw0tBTTY5SDgH8kEw42RMAIt5mtH2FbErvtCxtb7SIGS2G7Qaj/RhkxL4pskKXE3TvNjbtlo0XVYQUAhR1LNCZhcDD8vzQ6pX+TYuh5CcGcvtmKG5YD6MlklZwrZcXP/flDi83PpjdKtibdqLYkGnkNmVXmv5G+MLIJ6xQ2Eq8V3IyBwe1TazEjuTHI4sLJOcJOEEU7cw7QDCFqt5sjJeBaciD4kssI2Fy01bRKBYJGOpOa0RmiPYzZqhxFzMAJpelmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssTI6at9j+dmm0UVb4iktGaytHsP2Cy0qsceqf5wJgQ=;
 b=hn0DDszc2nBSsRuDm3v5cAL6I62a+2xk0rdW8rcNpdW4lUCKT/u62rNbHeWSLQKyKwga4pPk36HbkDTIHjhqUL+uQFW3o14rkxJj+TMKNUFrwRNbeSX2/lEx0W2Zc6LXe5b3z6/EwM0Hcaefm5uh3wWg26udhARbqN9nA58RsYKV9P7jA7xtExrVv+oPuCyGAqBVpODXPBsM4qv4LT8WTteGx7/18tosmtqMMVDlbYftKcZOzbWiggpDNS/lNdcSdsWmBhc5NBF9Xp3FGmZc+CvrdsUPh5Iq5TNohc48wS6tv6lJBDO41JvnhpXyDtMEkaI5YOB2hpYBW0KF+j292Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssTI6at9j+dmm0UVb4iktGaytHsP2Cy0qsceqf5wJgQ=;
 b=2RBAg+xx8kgkN831po1jqJcIGZOcFlOsr5Ngz2uR5KO1Hz0ccHP46lMwbo2lzVk9W7BpzlDGfcbCSvbOgTEYUyXOoeeELal3nh1rCRhFhXno6m0eSUKesiGGV0t62mA1jh7ZRFKiu4AiGug1JIdfRqJ9gSh2356tCA6uvD/2PaKTuhD6JKHvXGmtlK5x0RgplTCpz/UzEuDJy/8tgxu7bLBnfQs0ZCMpx2WaPowhWqaO2+SQIxVc9kpGycx62kN1YY4XIi/iEkZ7ld6/BLJ4e9I92MvdF5GnBtMSTpKl9fY9sSwM2x7HDI+lrvyl53btvtWG5BLD6G0m6Mxt5iROLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab2a5149-4d5b-7edd-916b-b5a6b69e486b@suse.com>
Date: Thu, 5 Jan 2023 16:59:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 02/11] x86/shadow: convert sh_audit_flags()'es 1st parameter
 to domain
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
In-Reply-To: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: 1beecf0d-43f8-45ed-1238-08daef35d7ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TCLgu6YBl5RO5kw9pDjgt7TEbbZx1slc1MN/kYGf4ExPPho0prgIVK8xGtOP012TIJqjJTpHZ54IuP/aTZf/21uZhFQc9uKI/qeYOiojFW2/JWCl4eD6Zf5N81iPHLf9f+h7Fv1XWv6G3qeg8e9SphlwaD84QFnKbAHv6ZgDkxiqjN7hWuOqL6EwAOjpqsDxxYBdVRk6pQbdv8RizYUmD1mvOWdmlkl+ogSTSN3Gd8ZHbayx21D965abWYNSFQ6o72vp0Witw7kOpvY5TjYKbye6qjnzsqPTpv7InVZ4n866JojRxmjCCjfOX/S8K+r0bXV8uR5/CWhcVQuKrCK290cgoZMVVYGdGm8jEaffdSftqQ/pVKY7MNaJYEKmo9Frf4fnesl44MG0g5ALijeAY7a0f3m+Xk44CldKLAxZDToYAUVRnyuxgjirY/1ACtamsMovVP3f1eFmaU5UCs+JmJX+j3HATt7THd5QKeYHHf86KVeIQX+jkuP9DtVPMnKk+d4QyC+cOxKLOnjbwqxVMkR50NOfz/XJTOriqxzpvSB0OBLeMko/Dii9a+on3g3sLzulqpmaqlIh18KCU5Ro4B4mXc/24PwcTFN3B0Q3f8LKcB1eWkF2IghSiHFvpEOL4fjohMSFyhYLCengpap9JkBVPqKtUe3jOkfzoR5pdFAO2IiOctPKNeRLtDpjE62WmLLb5EhYoFAeer8IJ7/xiCkJ5bej4317kGcXyJXRzdJL6UBV/5+eQHUOk7a8z1QRat0yMqBXGXnVpVOrS0mO2yA/i/cmiXw/y/A/D+RQGEacthmhrKnaE3pQvqblt/Ke
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199015)(38100700002)(41300700001)(36756003)(2906002)(8936002)(5660300002)(83380400001)(186003)(6512007)(26005)(478600001)(6486002)(31686004)(6506007)(316002)(66556008)(6916009)(66476007)(31696002)(86362001)(8676002)(54906003)(4326008)(66946007)(2616005)(45980500001)(43740500002)(414714003)(473944003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnpCYXp6R2dIaUQzU2l4aHRhUjhkNStyTUZIQlc0RXE2TUJhZUtHeE44Qmdx?=
 =?utf-8?B?SFZhYXpVVlBobHIrYjdUN3A1cENKa2ROS1c4SkU2cE4yQ2Z5Mng2bEgxSFNw?=
 =?utf-8?B?a2NDVzNCUjdHQi8yVVhUSHZUdnN5WUNRTW8rWlV5N3k4VWtmaEpIaFlmMHVY?=
 =?utf-8?B?TWZJZjFQK0M4OENXZFNudTBSS0x6U290MHkwSndWZ3c2OThHZk16c0Rrc1U2?=
 =?utf-8?B?VlhwWUNoWVU0WjZrQU9Vc0NDbmUyU2ZBdUZQaVlLRUZpMEkrem53amU5dHZ6?=
 =?utf-8?B?VzkyNTg1WTRDWFdTemNZUUwwYWw2NEs4cG8wSE8xcjJhVUJaWGRBZjZvcU1k?=
 =?utf-8?B?dEh2b0FqRk15K0U5TU54ZkU2bzYyaE8yTm5IYWZRMTJENkZBWE1rVWF6OEFU?=
 =?utf-8?B?RTNuNTQ0V21tcGdGaUdpR2FmUy9KcVVpRkpxS0RzRVVPajNOaVJwSzg2STNR?=
 =?utf-8?B?OG5qdDNYQjlIeFVTU2Zvb3RuSGl0MW00alNlUXhLNFowZVQ5dzBEeDFzdmls?=
 =?utf-8?B?L05TSnVZTWU1QmZJa3orUFdIUVdTTUYxNzBRRGMzV005cVl0RndwMHFVUSth?=
 =?utf-8?B?QmRPeldGLzQwcVMzb0lHY29JNVpNOHVXendCamVEVWJZMnJVVTA0cHFSK3JZ?=
 =?utf-8?B?bEhieFVuV0RrdWc2aWhCeU9TeHdVczQxaC96UndyRTlCOVJQYWhlRDZxRjBa?=
 =?utf-8?B?My9DYWJNMDMxNElBbFQxQXU5aU9GWDk2SjJvQ0lWZVdpWHFOWmxMYzd5Q0l3?=
 =?utf-8?B?T3RrTTRIS0NRemhOZkFZbWk5Zm5XZkdXYnhESE9DeXNFR0loVWRBNTZtRndL?=
 =?utf-8?B?YUJZTjRGZUVBZG9IRGZ1Vm1sdys5ZXNSMFRlb2J4MEVIbUk2Vm1RSGZFOUFw?=
 =?utf-8?B?TkNjWVQ5M0ZJbHdHWDE2TkZxNXU4NmVKcHgyU0tETUhuY21zMStTY1BXeGtz?=
 =?utf-8?B?WDJCNWdYZWl6Rmx0b2dnUzQ4VG9sRXpKQ0RsQU5XRDg5aUY5emQ1SnBWbU42?=
 =?utf-8?B?S29keUlFNVZtaExpSkh0K1FkdGZCelVOMEFjSUNaSnR4ek1SaUF5ZEw0OXhB?=
 =?utf-8?B?Z2dFamtZYjBXaW5iK3h6NmhNT1VXWFFuemRWeTdmMWVCTTdyMHROMXhFSW1Y?=
 =?utf-8?B?VWwrWVo3ZzNKVGY2c3QrRkZHWVpNdWY3Qkc5dFlCMHlSdWZ5MlArdktTeTcr?=
 =?utf-8?B?ZklsaUdHc2JtSkhLc1p4bEhYZnRPRkJJcUJOeGFuazBZUU9IYzY2UUh2WTJj?=
 =?utf-8?B?QmZoN1YzMWhxRUlZTXloODcybytlV044MFM2bnQ0Q0crbTBOZ1lOTVhXa2pZ?=
 =?utf-8?B?L1RrRVI3RVdlMWlyeFhicGRNMGN1eERtbG5OUktvYmpPZ2NBWlU3TmRBNHRO?=
 =?utf-8?B?S0grSE5lUnVPOVJnVGtIUk9abGQ2NzQydkgrV2NnR0VRZFdZM0FUQ3IrNG9w?=
 =?utf-8?B?djQ4NkVSaC9yemJOMXBrVVhFQ1lDdHUvZ1o5cEZSODgrd3p6cHV0NlZrNFA4?=
 =?utf-8?B?YUVBbGdlS0NaZ0R5NEhMc0djVUNqeDVwU0tlMHJDVnpad1BRMXU3S2FEWWdR?=
 =?utf-8?B?RmF1UytQTjFOMFQ4OXAvcjQ1T05tWjkvNnd5QUFCdjBNYzFmQndRY1hCVlhm?=
 =?utf-8?B?WlFRK1VBdkkzc0YyRmFycndpaU5XQXZsbE5YY2QwVVhjY2JvbTA5N0ZmbGlW?=
 =?utf-8?B?SzFISXp4SmYxT3h3ZlJEeHl2emtUZGUzL2F5R1VGalc3R2NxcEliLzBVQkVM?=
 =?utf-8?B?d3lMMmZGbDhadHhaRDBXQndiZ0lML3VITUxiaWxRSGNtN1dCNzlUSXlGZUFO?=
 =?utf-8?B?MndFS2JxblF1RnFNU2x1SE40MEtDYW43YllZRGZ6NDd2bHp1UDBiN25UQWdm?=
 =?utf-8?B?ZHlkemtHcFdhVFdneFZGblQ5M0hKNEQvYTVBdGZFbTZTSkFMYm1JNUtCeDZu?=
 =?utf-8?B?TncrQmtCTGVzcXRpb21zcmVWWEJZdlVwZUN5a1hCSk41NWk0b0ZWTFVPZ3RO?=
 =?utf-8?B?V3pzd1p1T2VkTVpJeXEwcEhEc1VJbTlvK0w2dWZ6Nk85WlJidGlscTcrakdu?=
 =?utf-8?B?WnkxSGwvdUxobk1MYmN6YzVna2FZOC9LZWZTQ0s5dEZxREZ1SHowRk5WdThT?=
 =?utf-8?Q?r9/FykCNYn3h+Mm2AEXmsQHZN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beecf0d-43f8-45ed-1238-08daef35d7ce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 15:59:36.0508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4metWACwmbaaQeyvmJyFj/QJ02e4TS3mtJkR00Uzs+7WPuBxm9GNKFMW+4vEjTVAzi8HKTSsw74kcczGaFmWYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8498

Nothing in there is vCPU-specific.

With the introduction of the local variable in sh_audit_l1_table(),
convert other uses of v->domain as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3919,13 +3919,13 @@ static void cf_check sh_pagetable_dying(
     done = 1;                                                           \
 } while (0)
 
-static const char *sh_audit_flags(struct vcpu *v, int level,
+static const char *sh_audit_flags(const struct domain *d, int level,
                                   int gflags, int sflags)
 /* Common code for auditing flag bits */
 {
     if ( (sflags & _PAGE_PRESENT) && !(gflags & _PAGE_PRESENT) )
         return "shadow is present but guest is not present";
-    if ( (sflags & _PAGE_GLOBAL) && !is_hvm_vcpu(v) )
+    if ( (sflags & _PAGE_GLOBAL) && !is_hvm_domain(d) )
         return "global bit set in PV shadow";
     if ( level == 2 && (sflags & _PAGE_PSE) )
         return "PS bit set in shadow";
@@ -3948,6 +3948,7 @@ static const char *sh_audit_flags(struct
 
 int cf_check sh_audit_l1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
 {
+    struct domain *d = v->domain;
     guest_l1e_t *gl1e, *gp;
     shadow_l1e_t *sl1e;
     mfn_t mfn, gmfn, gl1mfn;
@@ -3964,7 +3965,7 @@ int cf_check sh_audit_l1_table(struct vc
     /* Out-of-sync l1 shadows can contain anything: just check the OOS hash */
     if ( page_is_out_of_sync(mfn_to_page(gl1mfn)) )
     {
-        oos_audit_hash_is_present(v->domain, gl1mfn);
+        oos_audit_hash_is_present(d, gl1mfn);
         return 0;
     }
 #endif
@@ -3994,7 +3995,7 @@ int cf_check sh_audit_l1_table(struct vc
         }
         else
         {
-            s = sh_audit_flags(v, 1, guest_l1e_get_flags(*gl1e),
+            s = sh_audit_flags(d, 1, guest_l1e_get_flags(*gl1e),
                                shadow_l1e_get_flags(*sl1e));
             if ( s ) AUDIT_FAIL(1, "%s", s);
 
@@ -4002,7 +4003,7 @@ int cf_check sh_audit_l1_table(struct vc
             {
                 gfn = guest_l1e_get_gfn(*gl1e);
                 mfn = shadow_l1e_get_mfn(*sl1e);
-                gmfn = get_gfn_query_unlocked(v->domain, gfn_x(gfn), &p2mt);
+                gmfn = get_gfn_query_unlocked(d, gfn_x(gfn), &p2mt);
                 if ( !p2m_is_grant(p2mt) && !mfn_eq(gmfn, mfn) )
                     AUDIT_FAIL(1, "bad translation: gfn %" SH_PRI_gfn
                                " --> %" PRI_mfn " != mfn %" PRI_mfn,
@@ -4064,8 +4065,8 @@ int cf_check sh_audit_l2_table(struct vc
     gl2e = gp = map_domain_page(gl2mfn);
     SHADOW_FOREACH_L2E(sl2mfn, sl2e, &gl2e, done, d, {
 
-        s = sh_audit_flags(v, 2, guest_l2e_get_flags(*gl2e),
-                            shadow_l2e_get_flags(*sl2e));
+        s = sh_audit_flags(d, 2, guest_l2e_get_flags(*gl2e),
+                           shadow_l2e_get_flags(*sl2e));
         if ( s ) AUDIT_FAIL(2, "%s", s);
 
         if ( SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_MFNS )
@@ -4116,8 +4117,8 @@ int cf_check sh_audit_l3_table(struct vc
     gl3e = gp = map_domain_page(gl3mfn);
     SHADOW_FOREACH_L3E(sl3mfn, sl3e, &gl3e, done, {
 
-        s = sh_audit_flags(v, 3, guest_l3e_get_flags(*gl3e),
-                            shadow_l3e_get_flags(*sl3e));
+        s = sh_audit_flags(d, 3, guest_l3e_get_flags(*gl3e),
+                           shadow_l3e_get_flags(*sl3e));
         if ( s ) AUDIT_FAIL(3, "%s", s);
 
         if ( SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_MFNS )
@@ -4164,8 +4165,8 @@ int cf_check sh_audit_l4_table(struct vc
     gl4e = gp = map_domain_page(gl4mfn);
     SHADOW_FOREACH_L4E(sl4mfn, sl4e, &gl4e, done, d,
     {
-        s = sh_audit_flags(v, 4, guest_l4e_get_flags(*gl4e),
-                            shadow_l4e_get_flags(*sl4e));
+        s = sh_audit_flags(d, 4, guest_l4e_get_flags(*gl4e),
+                           shadow_l4e_get_flags(*sl4e));
         if ( s ) AUDIT_FAIL(4, "%s", s);
 
         if ( SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_MFNS )


