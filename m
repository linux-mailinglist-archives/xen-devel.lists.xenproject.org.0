Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB79E497A50
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 09:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259740.448248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBuhA-000236-63; Mon, 24 Jan 2022 08:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259740.448248; Mon, 24 Jan 2022 08:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBuhA-00020j-1z; Mon, 24 Jan 2022 08:27:24 +0000
Received: by outflank-mailman (input) for mailman id 259740;
 Mon, 24 Jan 2022 08:27:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nBuh7-0001ma-RO
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 08:27:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72f826c3-7cef-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 09:27:21 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2056.outbound.protection.outlook.com [104.47.8.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-MlpCDL89PwaveK-ItzmYGA-1; Mon, 24 Jan 2022 09:27:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 08:27:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 08:27:19 +0000
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
X-Inumbo-ID: 72f826c3-7cef-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643012840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+QV9f4zvS046E/T2Qkac91dJy0u0hz2Q9q4aDSre0U=;
	b=SSvWxix2sqHQ+3V0n8akPVEOeNbNO9aS9+7jkirrDXZ9c76Zeu4LgdiRDv1ia2upE1tzkW
	TPePX0ububpok2pJrN/cC4LsRDpLb39t8gEqwCZYx0XGgGdZeb2ZWroHbqZSCzgm/BgRo5
	3WI/2z9LKmqBl8DM8ryUheHrx2ycJHY=
X-MC-Unique: MlpCDL89PwaveK-ItzmYGA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPF3fsv677gRFuI+4lcPe0QcHd1jGlmbuSV0l8k7Xhk6kPAxoswPpzK3btFfUJmfi+J9yzmjJs0qmTSfswnD0ohXE2dAv2zREWOkuIs7TEsi65EtW1eRefC1NsH9JBfw0UFbnlWBLGv7KJpbf5+7Jtb3LoipQUU9dsMM2Cyo+dwROZXBYKXLLBr/a9Q4pIQYmPOO6mHIlD1U/2FztA0xyJxKm0lTU1DdnuZ9lsG04HURlzN0afiMFGRnaYuebb34bBd7Iugnz7VPADyUzfow4rWw6nk+YQwWZAlcfw05coYM5PU7bcdIOs0uhAK7EUHONiORluRvxADFhYqGkrndqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+QV9f4zvS046E/T2Qkac91dJy0u0hz2Q9q4aDSre0U=;
 b=V9d9w6t7xoQ+ElksITgGs/TMhq6hGDXGB2i/t+3P86OfJEz/CeW1cj+YBZ+segw2X3vsMZI7PthV46/dGjTJREawEjH5w9f/gFKpTe40Iih43ltRPAiNP4o5wnBdf7CnqbvQFJz61gE8yf1cNYy3jw372dd5UrLs8OfnzdRtZJmcLyu+R5zqME3sJG7FDcGnNY1LM9OKpbc4I2Tu8UuWKL/kOK4qKrj2/6qFOsILFbZxFU+uUaEwHuU8ho1uGeuppBclOSo8xv20dQ+ilSabnDF93pc1+rg6pLwdtKBmk8jkAWhfoN1bq/0GTCKbxMJDadZVyVOmBsDrhd+BNLTUaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f91b8c8d-dcad-29e6-6d63-881a16505d75@suse.com>
Date: Mon, 24 Jan 2022 09:27:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: [PATCH v2 3/4] x86/APIC: skip unnecessary parts of
 __setup_APIC_LVTT()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <879e5b70-bffd-b240-b2c8-c755b09d41a9@suse.com>
In-Reply-To: <879e5b70-bffd-b240-b2c8-c755b09d41a9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0094.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dec3f041-acac-4aae-75d9-08d9df1355e8
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB7883DDE82F496517031B5EF9B35E9@DBBPR04MB7883.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kW74TiHBbTl44YAsDTfMXiV3lDwzJGrEsCQ32HFjqJc75uZD5/pwmCdCYuxk2SUqhOSBXOqqzp6AZDK37dSDcFf1DfUt5cS5rH5CDSOxyPdYtYnpZAPu4DQDTOdoNJVwI2bZTcH9BD59aOMHF4CXU+nsHWCNOOxgavNBpxfdqdvgES2sPfaq+9TC9GyvmaR/4BQeOOH0TSfctvPGXrYnYVhVFOxUvFea1FTJAdB+aWQxeiLEc5ThE5NIihXhPG/EbjrpsDbdH3zl3G18F9n0ST7g7hRaWT4xKYaMJFJLh9j/c1pd0+/tq1bNRSUR2JYzNBIFSWdlRaN/MHYQxnOAb5fegSuJkcKqpsJX5GEyo4b3dqqKsEDuobb3o3G5iN29SIIYkIwd1mbtz6xrP9ZTJUDr/f3+8yqDpdb3d4PqivgHBAs+dZ/u5lxtV6T/OZvs0IQcGts/UJijNe28OFf8ruROsAOul+qo5/AdDXWz72vrG6amCWJEDydb0Qdn99IqAIux7MduNlgsmyGz7BNOp1odUALgqSBh74PNw2rzG5dthBwX7nJB5IsrPGVc6RQx3hmetjU8hCqyio7AzLkOygqgjC4hpYkXM5OsyG1v/mBH0533tMPsAFmK6nswh41UycWU7xEcbrujPF0LjUC25uymU5Aq/C0Vf7+hw4caf0YH37P4UwrLbZ0YI1sK7Lsk0KLNRi3yPZvTp31K0lU0iKV5VMWjeq4drQS4/C4csMIYZ+p2k3+nUerY3XDlGAvd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(36756003)(38100700002)(6666004)(54906003)(4326008)(86362001)(66946007)(6916009)(8676002)(31686004)(316002)(31696002)(5660300002)(6512007)(26005)(508600001)(66476007)(2906002)(66556008)(6486002)(186003)(6506007)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b000cTNhN0JPQTQyeEJRczQ2VWhJdHdwdHhDQnNnR3VPbE9xcXFDdVRlSnpi?=
 =?utf-8?B?T3RUMjR5TkZUODRFNEpVa0s4ZUtmNW1rZC9qUlZHUVdDQVJxQ0JEdFBQTG1n?=
 =?utf-8?B?TzVuL0hHVmZoTVQ2ZXpPaDl5dUtrbGxIQU9jMTFNRExHOHYyc1UrR3hoM05C?=
 =?utf-8?B?ZklSSURnRDNCb01SZEI4aTl0dUVnaVJkUXZIMU4wU0I4RytRdzc3MzhOZlFj?=
 =?utf-8?B?M2grMWllRFRLcWNScHhIbWI2L0VpRC9WbGVoOFN5NFFvMkg1K01PSkhBd3lP?=
 =?utf-8?B?OUxSZ0UyMlhRTWR1NFl1ZG5OeTF4NXgzKys1MitrK0JnQ3pPK0hIOTF0WERZ?=
 =?utf-8?B?ZGRCMnB1RUhpN2FZaHdwRUFCc3NVcGRCd3U0OE1EN0oyMkcwbzA0Yk9SbDVj?=
 =?utf-8?B?Nm1vSUEyYlVkT0dvVVhvRnFuZ2JyaGlYbmw0cjU1c0g1eGJTb0psVHRJWG9R?=
 =?utf-8?B?L2puVkdRemxBNXM0Q3FUTER6dlRMU3pNbXA0RnZycEsrYjEzbjNFV3ZJYnZz?=
 =?utf-8?B?N0Y4WVVMZXBGRzd6b1RRSG5QM2VDWnZaQUpKNjBJTVpoT1lNVnJCenc0SGk1?=
 =?utf-8?B?aXlINVRMNGo0STN3ajhqZ2lVNitJUkJ6YXVmK0xqTmR5RXhOSG83NWhrNnZx?=
 =?utf-8?B?VEQ2a2o1dWgvSXpWdFUvandtay9keVZ5NmxsamVkK2M5T3FxdTloRTZyUWdU?=
 =?utf-8?B?VGFGbEVXMGxkeDd3RjR3MUJaVFIrNU1MalFFVm0zVFNqMER2M0dSNi9VV25x?=
 =?utf-8?B?d2xTT1o2VmVCTmFBRzU3TElsc2oyZEFpcFBFbGFBaXZuWHhBVkxrZDIzK1Zt?=
 =?utf-8?B?dzJtTlcreHhMRk9PWmF3QjJvWWFiMGRlT3hwenh3K3loa0pPbTVBbGRIeWtV?=
 =?utf-8?B?SThFRE81c3Zad2E4Tk04and2dTVFOVNJK3BXNU5VcEdmVWUyWFoxSlAxR1E4?=
 =?utf-8?B?Z0IyMkYzVUVkOTVCT3hLdEZDOWpVRkhldGg2Rko5cG01RW01QzVxRnp2eE1S?=
 =?utf-8?B?S1Q1Z0hVZk1MdVV6R3MwVWFLdysydE5DWnhjdXpLdnRMTWZ1cFI1V0xFS2tv?=
 =?utf-8?B?dlZTQWJwTTIzZFZVdzYxamdrZU9uOGhwbUlnYVFjcmhGNlFldFFQOC84di9F?=
 =?utf-8?B?bmlUOTlramlZQ0dVR0xWcWwxTUtDTFdGbitlRVVFOVAwZFE5MkoycW9scEIz?=
 =?utf-8?B?R0x6cXY5WTNvK3hMb1hFUGtHUWg4RTQ1MzFaRStkdWlWN1Jjcm55TEFGdjVJ?=
 =?utf-8?B?MVVBZjRHOE5mdnJHeHJ5K3ZHTVpXNEpzS2VreVlXc3VnTjBVZ0ROem1uOXJo?=
 =?utf-8?B?VGQwNGtEWGpadU80ZDlRZGZoZjVwZHprZS9Ra0l4L2tYWXhORERLUjZHSEM2?=
 =?utf-8?B?NDBPMmp1UG54M0xMVjlxUnFkcHVIb2JJK3hEcnlET0R4VjhnclY0eTRTMTQy?=
 =?utf-8?B?VVNxRkk5THN6akNRYmFYMmt4MXFmNG9SSTBzc25BZW9mdWhObXJBZ2NEeGEx?=
 =?utf-8?B?NFhUaStqTUFpRlp5VEZNNzVUc3hzR0UrMDlSM20yZ0NsNEhMSmo3bmJlSGND?=
 =?utf-8?B?ZGFlaXV4dTAwbUo3d3Y0NTMyMWN6R3ZGdklQSDgxU0JmVGFHdkZ1aTZXWlFx?=
 =?utf-8?B?MUYxQzVOaU50WGZQdE9KdEJOb2hTTVBrTWpMWXhoVTdnSFhJWHZKbGpXK0hv?=
 =?utf-8?B?YkFxcVJBRUNOR2JZVTFUOFQ5QVFhcnBqblAvZnpYd2VjdS9KaXd6OUdMRzJM?=
 =?utf-8?B?YndkUW1OQjQ1WUdWV1g4WndxVEhZL0RqUVFCeEhDeWV5VEJxY3cyQTJWUWha?=
 =?utf-8?B?U3pOdkg3eTlKVEEvaSsyMVcrd1BpZGMwUVpjRFFZZm5wZnNHMk55Q1J0eGhp?=
 =?utf-8?B?RUp5SGZqNnp0eElJR2l6NElFUE5sRWlwVTlhZkl6Z0Yyc3R1Wit1cHN3aHVC?=
 =?utf-8?B?SDdIT05GZTJwdTE1RjhmNm5BcnVIQ1pmV0I1VS9sY3dIcjA2WndTTE56d2xY?=
 =?utf-8?B?M1FGRC80eGgwTkRZUXpKOUE3ZjlsU3pDZnE0VFNqT2dDb2Njemk4NGxjdThW?=
 =?utf-8?B?L3BkZUQyd3lZaTJ1c1EwZmZoeFF1U1piQUhweGl4Y0V5MVluM2J6Z3JZK255?=
 =?utf-8?B?U3poWlo2WFBVdUJXd2VaaDUwQVk3UjQ0L2xZRU0wZG5INTVDcnZMLzBRT3NX?=
 =?utf-8?Q?Vh1Mf4TJ5Xhy4SZH3FqKLTA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec3f041-acac-4aae-75d9-08d9df1355e8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 08:27:18.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tNHaldZRTsmwLmum13HagpSllmxajMicpmk5S//yG7XnCg2a3XFGisu8SIXzbQn24Z1ZcgEzbBB9ZTt6mQNXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7883

In TDT mode there's no point writing TDCR or TMICT, while outside of
that mode there's no need for the MFENCE.

No change intended to overall functioning.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1059,24 +1059,25 @@ static void __setup_APIC_LVTT(unsigned i
 {
     unsigned int lvtt_value, tmp_value;
 
-    /* NB. Xen uses local APIC timer in one-shot mode. */
-    lvtt_value = /*APIC_TIMER_MODE_PERIODIC |*/ LOCAL_TIMER_VECTOR;
-
     if ( tdt_enabled )
     {
-        lvtt_value &= (~APIC_TIMER_MODE_MASK);
-        lvtt_value |= APIC_TIMER_MODE_TSC_DEADLINE;
+        lvtt_value = APIC_TIMER_MODE_TSC_DEADLINE | LOCAL_TIMER_VECTOR;
+        apic_write(APIC_LVTT, lvtt_value);
+
+        /*
+         * See Intel SDM: TSC-Deadline Mode chapter. In xAPIC mode,
+         * writing to the APIC LVTT and TSC_DEADLINE MSR isn't serialized.
+         * According to Intel, MFENCE can do the serialization here.
+         */
+        asm volatile( "mfence" : : : "memory" );
+
+        return;
     }
 
+    /* NB. Xen uses local APIC timer in one-shot mode. */
+    lvtt_value = /*APIC_TIMER_MODE_PERIODIC |*/ LOCAL_TIMER_VECTOR;
     apic_write(APIC_LVTT, lvtt_value);
 
-    /*
-     * See Intel SDM: TSC-Deadline Mode chapter. In xAPIC mode,
-     * writing to the APIC LVTT and TSC_DEADLINE MSR isn't serialized.
-     * According to Intel, MFENCE can do the serialization here.
-     */
-    asm volatile( "mfence" : : : "memory" );
-
     tmp_value = apic_read(APIC_TDCR);
     apic_write(APIC_TDCR, tmp_value | APIC_TDR_DIV_1);
 


