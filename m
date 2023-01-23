Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2782B677E81
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:57:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482985.748836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyGH-0008UG-0y; Mon, 23 Jan 2023 14:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482985.748836; Mon, 23 Jan 2023 14:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyGG-0008Ru-UA; Mon, 23 Jan 2023 14:57:28 +0000
Received: by outflank-mailman (input) for mailman id 482985;
 Mon, 23 Jan 2023 14:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJyGF-0007BS-4r
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:57:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f8fd8df-9b2e-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 15:57:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:57:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:57:23 +0000
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
X-Inumbo-ID: 3f8fd8df-9b2e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBL5oriJJl9QVmA217MpxakpE+Qh9lBxqdfPRykcVGBQ+kYV6ur31uGRg5vTuFE3oJ9AgKcRdwWMa3ONVbInZp4+KLB762IQ4wMQnnH2vqlFvNnoKFFbgU6UjfgcPIQAjPSAnivogA7rgstKujrpRh1lJzK9lo58PESuP+SdZWo61wF4wfF4YG5qVD5yhzub6wDCzwkhos+cQrGTofQSMHFK5d2mw4Hxfpe+cfuOJR1BHWXiMqgrEU++CyYN/FIOqRDCtOw8ykhMb4F4+3upfuFnRytGlJvwUcf1n8N0y9SlRtO20sZ3S+l9mZbCV9bhURHTTlery2EeSZmdqYM13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vRXvWQLyGKAmG7Bji/j/VfcIcDZDAV0kqzYj4NHDKM=;
 b=ibdqDd717LlSPHfSaxIXXgWfWJbHocf82gZgDEC1yaMy5UN7+JWVSsSSGsy/y+PPgqKsYk90DXY2LbwFXDRx+l4TXxCQ2woVaLtOxEiYNAtuw5ZhpMtQgvaueKjdTiqanVEF0URlYgpd5AVY2ERjP/0+YD0Vt//0W/RC8K3q3ak7hdffckr0nFkt9JQkosWEjuyehnMuAuwqumiMvKqg6w+YYC/4im522C7+Ldmi8I5K2M4qpjCyZy8YwOb2RXo0MJr3W5iWiV6X2xa2xDRFtmavkYCSSt0DHY0jrOtABmKiLD4lRzXCrGRdEIB9E1JxCA2GMxxb/hDsV3M9wc/Wcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vRXvWQLyGKAmG7Bji/j/VfcIcDZDAV0kqzYj4NHDKM=;
 b=sKDKCou3ewMLQIzmPETiGkeFOd0g9A28wL7IODL2G15LYJ0nBvbvo0pmp2OMmiWJZ4FxYRSM4AWjndjgKCFiP0h0K9x0xQa8Tatqxv4fj9Ho69BGCd6QSLJyc+RR2Xm1ZVoMLfJ3jLwzVuJk4dmMfPcMZ05aYL7UktVnDZ/VZRA5O3uYT2w+RHQGBucTaZic9FB2XzRSSNWtbB/voN5ei60BurTA2LiH7PXnrs1jbQ82T1CIfsSHzKUnURZLH5wGyka9T2pnc0TnX+afBcsdpJzLhl4oJIe4/xl+OldkK1YzPo95Q9LQovKMMFlrXmm9CyXPvS+ONj8AC1VpBLJVgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ef83f20-e1d0-83a5-168d-912f5be17ca2@suse.com>
Date: Mon, 23 Jan 2023 15:57:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 8/8] common: convert vCPU info area registration
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
In-Reply-To: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f951ea-9165-41a2-815d-08dafd522282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RpJ5HiMxbVQFEhWuC+/PFqPNz3jCxdcsjrQg3fKcoOPRbesZrkTdSr7B5mXgBvCUXNwR7miEHUxCTQa7emtrKqKPOrc1cnMyS70ekhmiRRYpIoo8RRiN4qaxojA3MmLxARWX1mkcDuDsXZ4nvIPIzGRdMPl8BYlPUwi+SJreRFXGGiHbE8W1I3cg0FOrJTMGJNo08j/TTyhQ155Wv0Dx3lPXFe6eN0iqFEIQEMIHtWrOODfsdogtt3eCMprANcENyjexV0MYnwEwL0ZMXxOpQY4o6w/91i/0ZLxyEnQ+7eDnxF54CMdKSsz3RN2Il8NoplZ1kTIXNIqnZzF2nt2+y0qxHW2x+Hjb1H6bskBeuE9FInwvpi0E2GCR1SNhY4+sXNErSKDOFpQ6TV1ygnrVgSoz/HpJdXmz4QVrq0tGs3iKk1PnElANriazG26eXwwYDDa09ljSbgj88Qwi0V4EP/VzVZxj/jgS2e/5l6kyqa7DsQ6Fxa04lyG7ocW7+vJ+rO+2HhJCJCUGuWuGBTddyV3+IktgsS/8/D0oIhJ3KAscMoDPXPZvz5HiSoOkZpqHj2cSP9Tv3bIsBP0supoG4yzgGKcIGFazEBJTXSNFM56+pAd2SZ4/Y20cs9y5Ijh2RFsGTpLSNtnSDWnkFu2TGB/SjA5+DbPAtP4HvUJZaqEp7mFFTqIVwJZx5fb+DWw24/rvPAcLlHrVwBqcV6U3/SB6PdFJwecqiNCd8IU/r1g+ahQowNPrmo/PuORBT0zUVDLQg6VVUMv4RuNVDym5bQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(6506007)(26005)(186003)(6486002)(478600001)(6512007)(8676002)(6916009)(4326008)(316002)(31696002)(66946007)(66476007)(66556008)(41300700001)(5660300002)(8936002)(83380400001)(30864003)(36756003)(2906002)(38100700002)(86362001)(54906003)(31686004)(2616005)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmJlbDFsK21tM3ZaMUJWZ21wWXdoeHVjU0JIRXhCUytFTnR4OTJ3OUxpZzIv?=
 =?utf-8?B?QzREdW1QSnpZQkJXY0I1MDNtbTBtMjlsdGV6dXl0NUhCSitJNTVZZ0hUN3Nw?=
 =?utf-8?B?citoMjB1WFRRZXFzQ244ZDlValFFMnBPbDVuMTVXWVZ6YjE0TDVnU2RjcXhY?=
 =?utf-8?B?MExpN0pSTXRTSkpjY05OVEJ2Nzhrd0hldCtvREFSMTZ5MVM5b1kvZFZtUGFD?=
 =?utf-8?B?eHZJU2tWRExWWlRicG5MRHVjMEY0R1lFeG5iWUVGajI2UVp6NWVoNFNVd082?=
 =?utf-8?B?Qi9QN3BCbDN3cUZFZGxGMnIzTnpYMGlYRkM1aDhsQnFPTEdOcS9CZDBVbGVa?=
 =?utf-8?B?VDNkQXlTeGRJMjh2aVArR3B0YU9KSzVtZEtlNWVnUFVYbGNNdE93dmk5eGlU?=
 =?utf-8?B?VWZtMDlBVC9mcXhJaHV6YXRuTUlJSU5MenN1UnpCd05DTkpvVG9ZL2trcVlx?=
 =?utf-8?B?OXhjdURJNzFlVWN0K0E3SlFReGs4cG1lbGJmOHN5a0c3V3pRMUlUSEZjMXNt?=
 =?utf-8?B?aTRhOWowQXBNMU9JYzFnR2VPYzI0TW4zMnl6ck1SaVkybnBTK3QrMFFzdHo5?=
 =?utf-8?B?WnhHUnp6SkI1V2R6RkdCaThEcmZ4K2VXMWhlTEpMUm80Mjg2ZXJaTDVEdjFB?=
 =?utf-8?B?Yjk3WkxxRThlUmJwMktFcmpDNi9aaDY5OUY2YWRJYm4vYzIyZVNQcjRPN21z?=
 =?utf-8?B?ck90a0dKZytvTkI0RkRxeERxZkVGdzFrZzVMK3pqOXFnR1hCL2lsQmpwZTcv?=
 =?utf-8?B?VVhzano3eXQyRVk5clFqbTc5QUtDYkhoSnd2dVZ4MkdPR2E5TzNUOGJwZGV1?=
 =?utf-8?B?Rkd6SlFMWHVLazNrTjNUZ0tBWXFzbjR1NWtxTzY0VGRiSGtUdFFQRGxLU0tl?=
 =?utf-8?B?djFFSWZqb0loZnNUT1hHSHRTei93dkFzNkZIajEvSmFIeCtKQlFRd2lzUVpn?=
 =?utf-8?B?OG9KSTRYRHlUR3V0ek52cUt6ajF3MU9nSHBweFN4UTU1d2tTTFlocUlDajNz?=
 =?utf-8?B?MHNTSi8yNGl0Vm1PQmJQUGdLYURzaE5ZSi8xamVZY0Q0YW9oZ2xTZVd3ekY3?=
 =?utf-8?B?UmpBd0hDaWxsSzF3Qkx3M1dLUzlRTnpZZ2E3VW5UQWF5NVprUDdqMVJ4Z1d1?=
 =?utf-8?B?Z2o2NFQ1T2EyR1JhdDRxLzJPNGxpbHRTQnhDc0RqNm9TdWgxZUlvQXU1b3B2?=
 =?utf-8?B?bytRcS9qb3FZUkErZHIrRmVEOGJ6Qk4xSDRxZ3djWG5Lay9PWGt4UTV5aGtO?=
 =?utf-8?B?TGY0UzZBc1VXTDFOcTNMOGszWGN5RlNvekFEWGN5VS9GRzRIYzRkWUdldTVa?=
 =?utf-8?B?UzVRUXIrV1RyaTZPMlVQZ0UxNG1sVEVhSEhaakp2TytJM1ZuRkRndFBoN2Za?=
 =?utf-8?B?NzhvTFAyT0FjazdDeUJCa3FKNHl6cG5OdVF1UElJb0dkNEdiZlJlU0Vob1JS?=
 =?utf-8?B?WXhGSk5KQjFabUluQm5VSVVMSkRxalhENkppRVAwNmRQN29pMnV0dngxZzNy?=
 =?utf-8?B?aUZHMExJL0REWUtsY201bm12UVAwTGpla1czTG1TQ0Z0Wm9qaU5qdkVRQkxv?=
 =?utf-8?B?OTJudlk4aC95UDM2bzRwcDVtYjB6aVNiVjlZZ2Z3YmVWQ2hlRGFKanBPZWlW?=
 =?utf-8?B?ZUZscUk4NkpQY1g3R2hUNTNMa1R2Ukw4Y04veHhKSEVHbncyZGhrVjJveFRR?=
 =?utf-8?B?QnRISm4rY21zSE04N2FmTXBoc0xQZ2lhRWdQRzhDZWZ1L1VWMHNFU1kvSWRy?=
 =?utf-8?B?MlVBWCtacUc0VnE3VTZKcDk0amU3N0FOb3JHMlh3Tm9yVG56RTVQaW1uTjZS?=
 =?utf-8?B?b00rRTdIV1g0SjJreUFXS1V4TldkTjBYSU0xUk1aaDgyVktpNXkwYklPWmV6?=
 =?utf-8?B?SXphRXh4MWNHU1JoMXJuc0VjWHpEd0Z6ZlgrSHBZc3RRcEtOb2xYSFg0SlJV?=
 =?utf-8?B?LzhsTGZmSTRKb0pRbzZLTUs2dUNQcUNaUHM4Z3Q0UFFIL3o5OEE0YlEwN0M1?=
 =?utf-8?B?cWhZNmY2eUpCL3ppN01BcktkSmh2UlVVdVhVZVZ4WmNod1hxNS9lSVZOSzVr?=
 =?utf-8?B?d0FsSUIyckduQWxocnpLT2pyN09tS1ZlY2hHQkRVaWM1bFY3UHhJNGxGbkxt?=
 =?utf-8?Q?1C8HhQiBs60ZYZuCkC6L2ayN4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f951ea-9165-41a2-815d-08dafd522282
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:57:23.6501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJbgybWiD9RHgFefRzkquLVXPmXLpooqZBZqAOuxTx6ljiU6ednIIC3C0DlPyD+r+8bD3AAWKBivpgmBvo43WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972

Switch to using map_guest_area(). Noteworthy differences from
map_vcpu_info():
- remote vCPU-s are paused rather than checked for being down (which in
  principle can change right after the check),
- the domain lock is taken for a much smaller region,
- the error code for an attempt to re-register the area is now -EBUSY,
- we could in principle permit de-registration when no area was
  previously registered (which would permit "probing", if necessary for
  anything).

Note that this eliminates a bug in copy_vcpu_settings(): The function
did allocate a new page regardless of the GFN already having a mapping,
thus in particular breaking the case of two vCPU-s having their info
areas on the same page.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: I'm not really certain whether the preliminary check (ahead of
     calling map_guest_area()) is worthwhile to have.
---
v2: Re-base over changes earlier in the series. Properly enforce no re-
    registration. Avoid several casts by introducing local variables.

--- a/xen/arch/x86/include/asm/shared.h
+++ b/xen/arch/x86/include/asm/shared.h
@@ -26,17 +26,20 @@ static inline void arch_set_##field(stru
 #define GET_SET_VCPU(type, field)                               \
 static inline type arch_get_##field(const struct vcpu *v)       \
 {                                                               \
+    const vcpu_info_t *vi = v->vcpu_info_area.map;              \
+                                                                \
     return !has_32bit_shinfo(v->domain) ?                       \
-           v->vcpu_info->native.arch.field :                    \
-           v->vcpu_info->compat.arch.field;                     \
+           vi->native.arch.field : vi->compat.arch.field;       \
 }                                                               \
 static inline void arch_set_##field(struct vcpu *v,             \
                                     type val)                   \
 {                                                               \
+    vcpu_info_t *vi = v->vcpu_info_area.map;                    \
+                                                                \
     if ( !has_32bit_shinfo(v->domain) )                         \
-        v->vcpu_info->native.arch.field = val;                  \
+        vi->native.arch.field = val;                            \
     else                                                        \
-        v->vcpu_info->compat.arch.field = val;                  \
+        vi->compat.arch.field = val;                            \
 }
 
 #else
@@ -57,12 +60,16 @@ static inline void arch_set_##field(stru
 #define GET_SET_VCPU(type, field)                           \
 static inline type arch_get_##field(const struct vcpu *v)   \
 {                                                           \
-    return v->vcpu_info->arch.field;                        \
+    const vcpu_info_t *vi = v->vcpu_info_area.map;          \
+                                                            \
+    return vi->arch.field;                                  \
 }                                                           \
 static inline void arch_set_##field(struct vcpu *v,         \
                                     type val)               \
 {                                                           \
-    v->vcpu_info->arch.field = val;                         \
+    vcpu_info_t *vi = v->vcpu_info_area.map;                \
+                                                            \
+    vi->arch.field = val;                                   \
 }
 
 #endif
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1758,53 +1758,24 @@ static int copy_vpmu(struct vcpu *d_vcpu
 static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 {
     unsigned int i;
-    struct p2m_domain *p2m = p2m_get_hostp2m(cd);
     int ret = -EINVAL;
 
     for ( i = 0; i < cd->max_vcpus; i++ )
     {
         struct vcpu *d_vcpu = d->vcpu[i];
         struct vcpu *cd_vcpu = cd->vcpu[i];
-        mfn_t vcpu_info_mfn;
 
         if ( !d_vcpu || !cd_vcpu )
             continue;
 
-        /* Copy & map in the vcpu_info page if the guest uses one */
-        vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
-        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
-        {
-            mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
-
-            /* Allocate & map the page for it if it hasn't been already */
-            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
-            {
-                gfn_t gfn = mfn_to_gfn(d, vcpu_info_mfn);
-                unsigned long gfn_l = gfn_x(gfn);
-                struct page_info *page;
-
-                if ( !(page = alloc_domheap_page(cd, 0)) )
-                    return -ENOMEM;
-
-                new_vcpu_info_mfn = page_to_mfn(page);
-                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
-
-                ret = p2m->set_entry(p2m, gfn, new_vcpu_info_mfn,
-                                     PAGE_ORDER_4K, p2m_ram_rw,
-                                     p2m->default_access, -1);
-                if ( ret )
-                    return ret;
-
-                ret = map_vcpu_info(cd_vcpu, gfn_l,
-                                    PAGE_OFFSET(d_vcpu->vcpu_info));
-                if ( ret )
-                    return ret;
-            }
-
-            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
-        }
-
-        /* Same for the (physically registered) runstate and time info areas. */
+        /*
+         * Copy and map the vcpu_info page and the (physically registered)
+         * runstate and time info areas.
+         */
+        ret = copy_guest_area(&cd_vcpu->vcpu_info_area,
+                              &d_vcpu->vcpu_info_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
         ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
                               &d_vcpu->runstate_guest_area, cd_vcpu, d);
         if ( ret )
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -395,7 +395,7 @@ int pv_shim_shutdown(uint8_t reason)
     for_each_vcpu ( d, v )
     {
         /* Unmap guest vcpu_info page and runstate/time areas. */
-        unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->vcpu_info_area);
         unmap_guest_area(v, &v->runstate_guest_area);
         unmap_guest_area(v, &v->arch.time_guest_area);
 
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1438,7 +1438,7 @@ static void __update_vcpu_system_time(st
     struct vcpu_time_info *u = &vcpu_info(v, time), _u;
     const struct domain *d = v->domain;
 
-    if ( v->vcpu_info == NULL )
+    if ( !v->vcpu_info_area.map )
         return;
 
     collect_time_info(v, &_u);
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -53,7 +53,7 @@ void __dummy__(void)
 
     OFFSET(VCPU_processor, struct vcpu, processor);
     OFFSET(VCPU_domain, struct vcpu, domain);
-    OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info);
+    OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info_area.map);
     OFFSET(VCPU_trap_bounce, struct vcpu, arch.pv.trap_bounce);
     OFFSET(VCPU_thread_flags, struct vcpu, arch.flags);
     OFFSET(VCPU_event_addr, struct vcpu, arch.pv.event_callback_eip);
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -97,7 +97,7 @@ static void _show_registers(
     if ( context == CTXT_hypervisor )
         printk(" %pS", _p(regs->rip));
     printk("\nRFLAGS: %016lx   ", regs->rflags);
-    if ( (context == CTXT_pv_guest) && v && v->vcpu_info )
+    if ( (context == CTXT_pv_guest) && v && v->vcpu_info_area.map )
         printk("EM: %d   ", !!vcpu_info(v, evtchn_upcall_mask));
     printk("CONTEXT: %s", context_names[context]);
     if ( v && !is_idle_vcpu(v) )
--- a/xen/common/compat/domain.c
+++ b/xen/common/compat/domain.c
@@ -49,7 +49,7 @@ int compat_common_vcpu_op(int cmd, struc
     {
     case VCPUOP_initialise:
     {
-        if ( v->vcpu_info == &dummy_vcpu_info )
+        if ( v->vcpu_info_area.map == &dummy_vcpu_info )
             return -EINVAL;
 
 #ifdef CONFIG_HVM
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -127,10 +127,10 @@ static void vcpu_info_reset(struct vcpu
 {
     struct domain *d = v->domain;
 
-    v->vcpu_info = ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
-                    ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
-                    : &dummy_vcpu_info);
-    v->vcpu_info_mfn = INVALID_MFN;
+    v->vcpu_info_area.map =
+        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
+         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
+         : &dummy_vcpu_info);
 }
 
 static void vmtrace_free_buffer(struct vcpu *v)
@@ -964,7 +964,7 @@ int domain_kill(struct domain *d)
             return -ERESTART;
         for_each_vcpu ( d, v )
         {
-            unmap_vcpu_info(v);
+            unmap_guest_area(v, &v->vcpu_info_area);
             unmap_guest_area(v, &v->runstate_guest_area);
         }
         d->is_dying = DOMDYING_dead;
@@ -1419,7 +1419,7 @@ int domain_soft_reset(struct domain *d,
     for_each_vcpu ( d, v )
     {
         set_xen_guest_handle(runstate_guest(v), NULL);
-        unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->vcpu_info_area);
         unmap_guest_area(v, &v->runstate_guest_area);
     }
 
@@ -1467,111 +1467,6 @@ int vcpu_reset(struct vcpu *v)
     return rc;
 }
 
-/*
- * Map a guest page in and point the vcpu_info pointer at it.  This
- * makes sure that the vcpu_info is always pointing at a valid piece
- * of memory, and it sets a pending event to make sure that a pending
- * event doesn't get missed.
- */
-int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset)
-{
-    struct domain *d = v->domain;
-    void *mapping;
-    vcpu_info_t *new_info;
-    struct page_info *page;
-    unsigned int align;
-
-    if ( offset > (PAGE_SIZE - sizeof(*new_info)) )
-        return -ENXIO;
-
-#ifdef CONFIG_COMPAT
-    BUILD_BUG_ON(sizeof(*new_info) != sizeof(new_info->compat));
-    if ( has_32bit_shinfo(d) )
-        align = alignof(new_info->compat);
-    else
-#endif
-        align = alignof(*new_info);
-    if ( offset & (align - 1) )
-        return -ENXIO;
-
-    if ( !mfn_eq(v->vcpu_info_mfn, INVALID_MFN) )
-        return -EINVAL;
-
-    /* Run this command on yourself or on other offline VCPUS. */
-    if ( (v != current) && !(v->pause_flags & VPF_down) )
-        return -EINVAL;
-
-    page = get_page_from_gfn(d, gfn, NULL, P2M_UNSHARE);
-    if ( !page )
-        return -EINVAL;
-
-    if ( !get_page_type(page, PGT_writable_page) )
-    {
-        put_page(page);
-        return -EINVAL;
-    }
-
-    mapping = __map_domain_page_global(page);
-    if ( mapping == NULL )
-    {
-        put_page_and_type(page);
-        return -ENOMEM;
-    }
-
-    new_info = (vcpu_info_t *)(mapping + offset);
-
-    if ( v->vcpu_info == &dummy_vcpu_info )
-    {
-        memset(new_info, 0, sizeof(*new_info));
-#ifdef XEN_HAVE_PV_UPCALL_MASK
-        __vcpu_info(v, new_info, evtchn_upcall_mask) = 1;
-#endif
-    }
-    else
-    {
-        memcpy(new_info, v->vcpu_info, sizeof(*new_info));
-    }
-
-    v->vcpu_info = new_info;
-    v->vcpu_info_mfn = page_to_mfn(page);
-
-    /* Set new vcpu_info pointer /before/ setting pending flags. */
-    smp_wmb();
-
-    /*
-     * Mark everything as being pending just to make sure nothing gets
-     * lost.  The domain will get a spurious event, but it can cope.
-     */
-#ifdef CONFIG_COMPAT
-    if ( !has_32bit_shinfo(d) )
-        write_atomic(&new_info->native.evtchn_pending_sel, ~0);
-    else
-#endif
-        write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);
-    vcpu_mark_events_pending(v);
-
-    return 0;
-}
-
-/*
- * Unmap the vcpu info page if the guest decided to place it somewhere
- * else. This is used from domain_kill() and domain_soft_reset().
- */
-void unmap_vcpu_info(struct vcpu *v)
-{
-    mfn_t mfn = v->vcpu_info_mfn;
-
-    if ( mfn_eq(mfn, INVALID_MFN) )
-        return;
-
-    unmap_domain_page_global((void *)
-                             ((unsigned long)v->vcpu_info & PAGE_MASK));
-
-    vcpu_info_reset(v); /* NB: Clobbers v->vcpu_info_mfn */
-
-    put_page_and_type(mfn_to_page(mfn));
-}
-
 int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v))
@@ -1633,14 +1528,44 @@ int map_guest_area(struct vcpu *v, paddr
 
     domain_lock(d);
 
-    if ( map )
-        populate(map, v);
+    /* No re-registration of the vCPU info area. */
+    if ( area != &v->vcpu_info_area || !area->pg )
+    {
+        if ( map )
+            populate(map, v);
 
-    SWAP(area->pg, pg);
-    SWAP(area->map, map);
+        SWAP(area->pg, pg);
+        SWAP(area->map, map);
+    }
+    else
+        rc = -EBUSY;
 
     domain_unlock(d);
 
+    /* Set pending flags /after/ new vcpu_info pointer was set. */
+    if ( area == &v->vcpu_info_area && !rc )
+    {
+        /*
+         * Mark everything as being pending just to make sure nothing gets
+         * lost.  The domain will get a spurious event, but it can cope.
+         */
+#ifdef CONFIG_COMPAT
+        if ( !has_32bit_shinfo(d) )
+        {
+            vcpu_info_t *info = area->map;
+
+            /* For VCPUOP_register_vcpu_info handling in common_vcpu_op(). */
+            BUILD_BUG_ON(sizeof(*info) != sizeof(info->compat));
+            write_atomic(&info->native.evtchn_pending_sel, ~0);
+        }
+        else
+#endif
+            write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);
+        vcpu_mark_events_pending(v);
+
+        force_update_vcpu_system_time(v);
+    }
+
     if ( v != current )
         vcpu_unpause(v);
 
@@ -1670,7 +1595,10 @@ void unmap_guest_area(struct vcpu *v, st
 
     domain_lock(d);
     map = area->map;
-    area->map = NULL;
+    if ( area == &v->vcpu_info_area )
+        vcpu_info_reset(v);
+    else
+        area->map = NULL;
     pg = area->pg;
     area->pg = NULL;
     domain_unlock(d);
@@ -1803,6 +1731,27 @@ bool update_runstate_area(struct vcpu *v
     return rc;
 }
 
+/*
+ * This makes sure that the vcpu_info is always pointing at a valid piece of
+ * memory, and it sets a pending event to make sure that a pending event
+ * doesn't get missed.
+ */
+static void cf_check
+vcpu_info_populate(void *map, struct vcpu *v)
+{
+    vcpu_info_t *info = map;
+
+    if ( v->vcpu_info_area.map == &dummy_vcpu_info )
+    {
+        memset(info, 0, sizeof(*info));
+#ifdef XEN_HAVE_PV_UPCALL_MASK
+        __vcpu_info(v, info, evtchn_upcall_mask) = 1;
+#endif
+    }
+    else
+        memcpy(info, v->vcpu_info_area.map, sizeof(*info));
+}
+
 static void cf_check
 runstate_area_populate(void *map, struct vcpu *v)
 {
@@ -1832,7 +1781,7 @@ long common_vcpu_op(int cmd, struct vcpu
     switch ( cmd )
     {
     case VCPUOP_initialise:
-        if ( v->vcpu_info == &dummy_vcpu_info )
+        if ( v->vcpu_info_area.map == &dummy_vcpu_info )
             return -EINVAL;
 
         rc = arch_initialise_vcpu(v, arg);
@@ -1956,16 +1905,29 @@ long common_vcpu_op(int cmd, struct vcpu
     case VCPUOP_register_vcpu_info:
     {
         struct vcpu_register_vcpu_info info;
+        paddr_t gaddr;
 
         rc = -EFAULT;
         if ( copy_from_guest(&info, arg, 1) )
             break;
 
-        domain_lock(d);
-        rc = map_vcpu_info(v, info.mfn, info.offset);
-        domain_unlock(d);
+        rc = -EINVAL;
+        gaddr = gfn_to_gaddr(_gfn(info.mfn)) + info.offset;
+        if ( !~gaddr ||
+             gfn_x(gaddr_to_gfn(gaddr)) != info.mfn )
+            break;
 
-        force_update_vcpu_system_time(v);
+        /* Preliminary check only; see map_guest_area(). */
+        rc = -EBUSY;
+        if ( v->vcpu_info_area.pg )
+            break;
+
+        /* See the BUILD_BUG_ON() in vcpu_info_populate(). */
+        rc = map_guest_area(v, gaddr, sizeof(vcpu_info_t),
+                            &v->vcpu_info_area, vcpu_info_populate);
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
+                                               cmd, vcpuid, arg);
 
         break;
     }
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -79,9 +79,6 @@ void cf_check free_pirq_struct(void *);
 int  arch_vcpu_create(struct vcpu *v);
 void arch_vcpu_destroy(struct vcpu *v);
 
-int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset);
-void unmap_vcpu_info(struct vcpu *v);
-
 int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v));
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -175,7 +175,7 @@ struct vcpu
 
     int              processor;
 
-    vcpu_info_t     *vcpu_info;
+    struct guest_area vcpu_info_area;
 
     struct domain   *domain;
 
@@ -288,9 +288,6 @@ struct vcpu
 
     struct waitqueue_vcpu *waitqueue_vcpu;
 
-    /* Guest-specified relocation of vcpu_info. */
-    mfn_t            vcpu_info_mfn;
-
     struct evtchn_fifo_vcpu *evtchn_fifo;
 
     /* vPCI per-vCPU area, used to store data for long running operations. */
--- a/xen/include/xen/shared.h
+++ b/xen/include/xen/shared.h
@@ -44,6 +44,7 @@ typedef struct vcpu_info vcpu_info_t;
 extern vcpu_info_t dummy_vcpu_info;
 
 #define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
-#define vcpu_info(v, field)        __vcpu_info(v, (v)->vcpu_info, field)
+#define vcpu_info(v, field)        \
+        __vcpu_info(v, (vcpu_info_t *)(v)->vcpu_info_area.map, field)
 
 #endif /* __XEN_SHARED_H__ */


