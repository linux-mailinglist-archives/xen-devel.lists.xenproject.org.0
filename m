Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08196C4687
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:35:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513240.793975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peurs-0001pp-N0; Wed, 22 Mar 2023 09:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513240.793975; Wed, 22 Mar 2023 09:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peurs-0001nR-Jh; Wed, 22 Mar 2023 09:34:52 +0000
Received: by outflank-mailman (input) for mailman id 513240;
 Wed, 22 Mar 2023 09:34:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peurr-0001jq-9y
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:34:51 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe12::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb2f0d87-c894-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 10:34:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7641.eurprd04.prod.outlook.com (2603:10a6:10:1f7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:34:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:34:49 +0000
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
X-Inumbo-ID: cb2f0d87-c894-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzYn7u7jE7n29tL43bAzrSBpEsPirlfXIsPl4jqTOVoHcvieP55CPq1X2yy19Gigpc7lBRN00S4pZudf9aE3C0IWSrViO9byQTMn9YAYlyYEblVMvHy5TVytJoBxp6ABEvsiCIze4hnnY464kyWGN2/ESejlxAiHartlammnyJyVpZ4JpO3Mjk2a0pwLcETDmrV3FJ4jP3Zz9MN2pZlp/QG4elLffpYIdpkxR0rHFMtaYEqyMWBKupVLKbkY7nZPpMNOeb5zuiRtAmxdVfvgM0dUPMIVpRw+DpRqD4dmj1QCXUWh/qQLF7b0zmG9oLkNaSQTDIg0ZJ9PMgz1fVf1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkGMlC/+N8HGbxMcyzYdjQkp7gUnDHpUJFPBpXV55Gk=;
 b=ev/XQKsgQ0RJgOfW1E5t/wCT9Cn5sdo5NGdd2fwGvcFzhlipJiaaInUaIgR5cQVXWV/4UmQbR8tH4/tnPwPSvSBuEwP5HHeCF6VqlqK2pbl/W/uneKlrjPym1HnoA323JGDEslyufcOd1xPgdmcx1q+zB+TPjfTqj7PVkHFl95witN2ZBkQTkoCKhYeKJtKxHdVH1wqYVQMzd8ahl5lVr4jtQ0uONTzPnZMGOGssIWKxETRq0BO3AcTN0ECbV06FhGAC9n+StVLWmHZYp/gAXSkAX+sw0RIwrn7IhcllAweLJHUy3FiGb0jgoScjNM6cR8OkDeQWExPpr39McsqLlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkGMlC/+N8HGbxMcyzYdjQkp7gUnDHpUJFPBpXV55Gk=;
 b=gIBQ13784HMj5UFWpzjPpRay5PEqYh/TfCYvXfvCOZUhnLZ7NhgTG7weQW5JuntVP3skzHWhA7pkQFNla2NeDapVrCdEHAnqyZ3Wvx8KP/g/1ZwxmZrxD6uQdZfmw6UMfUpIZNImjXtAhDIE7nWHX+1VNGGiopaw2Cd0eHVSWfmdJCOVicZykAOav2Sfk5/c+CUL1DJudNoaPWB9th2RknrDhtB2gRWCE8njYQi/Ei3aOjMshzvphqV5eQOOMxXtnghKgv+Nl+M6uHAmloKrPHunW20YIwJ9QwTKQBl8SFXmxfWFNGLgp7K03pWuQTAD5/SAAW5dEwyFjMnyxln9kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49ba3172-3b8a-4c0e-5413-bf58b66c82b1@suse.com>
Date: Wed, 22 Mar 2023 10:34:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 09/16] x86/shadow: OOS mode is HVM-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
In-Reply-To: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a8eb48b-542f-465f-a8f9-08db2ab8ae40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	siIH2bjWrjk6ZBxTo93vS/vqwOz5NUsaX/pUhkRdXmYX2Qa10W3ZZSLgQXlyJ6zbSsAb8ZEGxz3McA0BdWW8LQ1435kwf/4QXIuMbtPx4aOIQ/zdr4+lii4K5y43iPSJ2jgJovcdqUMW25ZL39QhLZcyHkzYS9oiREfhKMoRzAF/MuhoDgIkmKs5xt2g4JhJA8v8YrGudV0EbQMDm9OpkdXKeQ+gP51uujNOTTKoaKrjHx2889pHpBx2e5NiQmu7XSwwGxaGmIR1PYbRK6D3tePgGCsWxX2b6KOWssQoBf2PHUJC3xXUNX4SgEKCWPwaezUrghDfsNUz0h71AM0z+AgWMjyni+WMAJo0GW65DDaN7x5+niHRyzTtW74sQA35PvKYby+Wrp/lf3nO5TlNDcX4h35TngxA4JCRZXYZzcsuD6aLLrkyg286dEnHmHRe7RIwxfgcGezeWExHMkZlxiwyaLJeDxogHGHjSSG4818/I6zU+H7eczHvTOlZUsIH9HiAx2VhqmybxD82pR/bOE6V4mJkV0hQ7cZ2p9TYrbD56ryEz31usXAodAZabt9gYsaeUQZqv3YlpLEN5pgRG123mfLS0wV0/rO2tXCBd6NYmEf+RFUJtwWg9YvhY6pTcFWCks1A0vw10Ms4cdeayUjLL3+lVUXxS4CxL+SopedpdGO/ojfYitD+YI/Ynk6WER97g1h8CQ0T96EHW78NujBQZYVFLKmkRV1nAO86Jac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199018)(86362001)(31696002)(36756003)(38100700002)(83380400001)(8676002)(4326008)(316002)(478600001)(54906003)(66946007)(66476007)(6916009)(2616005)(6512007)(6506007)(66556008)(6486002)(31686004)(26005)(186003)(5660300002)(8936002)(41300700001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjA3Vkt2L2FZSzViVkNNMnFuRE91RXA5YkJSVWpGSXBnTVN6ZDJWSDd2T0hE?=
 =?utf-8?B?a2xtcjFWYkhGRTAzcVpmYnJSL2ZjMWpxazR4N3ZSaUFKdDJzQnozMmlld3oy?=
 =?utf-8?B?dXpDczdINHpBMmpvZEMxZ0VJREJrTXpNdFpGNlU5TGFIUFE3Q2dUMUM4STVY?=
 =?utf-8?B?K0UzRURDbk83d2NRN3NVaWMrdDN0VkI2T1FmMkoxNG10ajBMSWxSd0M5bWxD?=
 =?utf-8?B?QkNBVHd2d0dTYWNObmtjUWhSZHlLZTV6ZlFHcUhaNXcrZGhZVTcxV29FQlBr?=
 =?utf-8?B?cUtFNWh1QWJxS0NhR0RsUUx2UHhwNHc2WElRSmZ2VWF0OUovNHFpNTkwcHFl?=
 =?utf-8?B?VW9jbzZVZytKWGVxUWMzRyt2TmxVajN0bXRLRXJHZ3dsUE1SMjVCYW5LOEk5?=
 =?utf-8?B?V0VhNFRuTVBSempzeVNFSUt4UFBpUHFzM3hUa2M2dVZxc2NlLytweE52M3VL?=
 =?utf-8?B?QkxzYVM4WEdPeC9JcWl5YUlnWEdFTmgxV3BSNjdNRVovZUNtMWM1VHAvM0U3?=
 =?utf-8?B?bnVxdFFiMndyOFVHblF0T2V4azBXRFU1NUFsT3FYdUMycjVZcTkxR0lOdU1p?=
 =?utf-8?B?cThpYkM0dzRDMFRiMG5HMUExTXovcGVMU1BCbDdXdHlKR090QUVBYVhtOThX?=
 =?utf-8?B?QzBnK0ZuMUdxWm5ZanUvWmxrZUYwM0NLUWd6djRHVm45WERnNUJONjdyTEdP?=
 =?utf-8?B?WHRoNm5pRGRKNm0xQUdMU0ZkQVV5TU9VOVJ1UFpyRVYrREhmSEl1Ly96R296?=
 =?utf-8?B?UEV3OXRoTW9VVkRZM1ZqeGM4c3cxblJDUzJudWhJaC9ZWm41anRGU01vOXJD?=
 =?utf-8?B?Tkc1M0x3NVN6K0ErWHRYRGdDTm5XMTlRcVJHSlYwN0NqVFVSTGRHUlNGZ2hB?=
 =?utf-8?B?akdhM0VIWTVYS3llNGRUUXF1eTlwdi96UlA3dFBrMVpuWXJVb05mRW9idDZL?=
 =?utf-8?B?TmlXcG9BcXIvU21taGFweG1RZnFXaWlYUDRLZFBuRzhWNWMyT1B2a3ZiZGVQ?=
 =?utf-8?B?NTBUTGwzMjk1QVhDY2tocWtqVkhNQy90aXQ3WklOeWZ2ZVBVcysrdklmWWVh?=
 =?utf-8?B?bGxkV1hzaWY2NnJXOVVxeFlEamJBSTQ1dHFWdlExR1hIY1JITksvbnB6OUxq?=
 =?utf-8?B?dFM2TFlzSFVvbnBpVENFajZ3R1NqUkZZTHlXMHMwZTFzdmZ5S1I4RlN1SWhj?=
 =?utf-8?B?L1BjZ3E5T09mWEkvUTBJaGRGTXhIakhnRmpwNjFHeTNwb00veDRnb2ZsaXoy?=
 =?utf-8?B?bU9SaituSnFJMjhPZEREekoxU2FMZEl3UUoxK1g4bk9ESDg4d3h3UE9jWml2?=
 =?utf-8?B?U2paazB0NHdTN1VyMzJXNHl1VVFXeTIvbm9GZEp5ejVRWGZ2aWw0dlkvdDJa?=
 =?utf-8?B?bGVPVjRpblRDU01tdk5rVDI2NnowdGt1Z3ZBQUR2eFN1WjViNy9tdzlkQ2tK?=
 =?utf-8?B?Y2F6bWVNU0ZnK1AwaXBtZ2lRNDd0NHkzZmN3RWhtS3RuOGVVV3FtVXA2SUpt?=
 =?utf-8?B?aFk2MklLaVNUVk92THBMcUVCbVFuOWRuc2tUcnljZmlpb0NsbWllTlkvMUt3?=
 =?utf-8?B?MHkrVHZzYk85cW1uVkFVMy9rUGh5ZWorWHlhNTJOUWhJaitKRGY2UmRGU2Zl?=
 =?utf-8?B?S294UW44c3BBZ25NSWVFdVZxQ0lDWXg5ejY5UzdGanFnWVYzczFmR1MzVHpG?=
 =?utf-8?B?U0dpbWlJOTJYVFNqd0NXaGcvZDRXVjZ0N2djTm5aNERKNUlPWHhjdkZFTDdT?=
 =?utf-8?B?cG1LYzMzM0NrZ3hEVXFObllZbXc1ZDBHMUdkeE96dGxtSURzdklsbDY5YS9D?=
 =?utf-8?B?Wlo1ZFM5ek5QSHR6akV1amk1RzlzMExZSU4rYnNzb21PMTV2TERneElzbUhw?=
 =?utf-8?B?aEZ5Z29ySHlKT0hVcENHcFdwTy94bG1NcVI3RWxUdzQ2d01ubjVUeFVRSW5m?=
 =?utf-8?B?dVRXRysyV3dxUXBxRCt0YlFKNlZNQlRCSlNCR2NEMnVtTzczcVpHYk9Fbmxj?=
 =?utf-8?B?cjdDNkdHU3JwN2RZZEl6OTNQdXpBeThXTlREUGxxL3Q3aDQ0bUZwbmlNclZm?=
 =?utf-8?B?UjhOQXFweEh1c3VnWkNPZXlKV3ZyTnV5VWRtRDJZV0hJdjU2d2dGU21obVVJ?=
 =?utf-8?Q?ffSXQdWnBrUlfHFLOHtXZL9UW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8eb48b-542f-465f-a8f9-08db2ab8ae40
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:34:48.9973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTy7+Nu3BCivV5ZB/4YzHjDh/Gz8DgbHDEZdboPmFw6slZ/vvk87dlkXaGU3CAWQbFw74BY6f+MpLFarkIPKkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7641

XEN_DOMCTL_CDF_oos_off is forced set for PV domains, so the logic can't
ever be engaged for them. Conditionalize respective fields and remove
the respective bit from SHADOW_OPTIMIZATIONS when !HVM. As a result the
SH_type_oos_snapshot constant can disappear altogether in that case, and
a couple of #ifdef-s can also be dropped/combined.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -113,10 +113,10 @@ struct shadow_domain {
     /* Fast MMIO path heuristic */
     bool has_fast_mmio_entries;
 
+#ifdef CONFIG_HVM
     /* OOS */
     bool_t oos_active;
 
-#ifdef CONFIG_HVM
     /* Has this domain ever used HVMOP_pagetable_dying? */
     bool_t pagetable_dying_op;
 #endif
@@ -152,7 +152,6 @@ struct shadow_vcpu {
     unsigned long last_emulated_frame;
     /* Last MFN that we emulated a write successfully */
     unsigned long last_emulated_mfn;
-#endif
 
     /* Shadow out-of-sync: pages that this vcpu has let go out of sync */
     mfn_t oos[SHADOW_OOS_PAGES];
@@ -163,7 +162,6 @@ struct shadow_vcpu {
         unsigned long off[SHADOW_OOS_FIXUPS];
     } oos_fixup[SHADOW_OOS_PAGES];
 
-#ifdef CONFIG_HVM
     bool_t pagetable_dying;
 #endif
 #endif
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -296,7 +296,6 @@ static int sh_remove_write_access_from_s
 
     switch ( mfn_to_page(smfn)->u.sh.type )
     {
-#ifdef CONFIG_HVM
     case SH_type_l1_32_shadow:
     case SH_type_fl1_32_shadow:
         return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 2)
@@ -306,7 +305,6 @@ static int sh_remove_write_access_from_s
     case SH_type_fl1_pae_shadow:
         return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 3)
             (d, gmfn, smfn, off);
-#endif
 
     case SH_type_l1_64_shadow:
     case SH_type_fl1_64_shadow:
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -69,7 +69,8 @@ extern int shadow_audit_enable;
 #ifdef CONFIG_HVM
 #define SHADOW_OPTIMIZATIONS     0x1ff
 #else
-#define SHADOW_OPTIMIZATIONS     (0x1ff & ~SHOPT_FAST_EMULATION)
+#define SHADOW_OPTIMIZATIONS     (0x1ff & ~(SHOPT_OUT_OF_SYNC | \
+                                            SHOPT_FAST_EMULATION))
 #endif
 
 
@@ -205,8 +206,7 @@ extern void shadow_audit_tables(struct v
 #define SH_type_max_shadow     6U
 #define SH_type_p2m_table      7U /* in use as the p2m table */
 #define SH_type_monitor_table  8U /* in use as a monitor table */
-#define SH_type_oos_snapshot   9U /* in use as OOS snapshot */
-#define SH_type_unused        10U
+#define SH_type_unused         9U
 #endif
 
 #ifndef CONFIG_PV32 /* Unused (but uglier to #ifdef above): */
@@ -323,8 +323,6 @@ static inline void sh_terminate_list(str
 #define SHF_out_of_sync (1u << (SH_type_max_shadow + 1))
 #define SHF_oos_may_write (1u << (SH_type_max_shadow + 2))
 
-#endif /* (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC) */
-
 static inline int sh_page_has_multiple_shadows(struct page_info *pg)
 {
     u32 shadows;
@@ -335,7 +333,6 @@ static inline int sh_page_has_multiple_s
     return shadows && (shadows & (shadows - 1));
 }
 
-#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
 /* The caller must verify this is reasonable to call; i.e., valid mfn,
  * domain is translated, &c */
 static inline int page_is_out_of_sync(struct page_info *p)


