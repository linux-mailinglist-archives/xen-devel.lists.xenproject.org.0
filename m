Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A3A677DF9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:28:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482915.748716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxni-00079F-MG; Mon, 23 Jan 2023 14:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482915.748716; Mon, 23 Jan 2023 14:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxni-00076H-Ii; Mon, 23 Jan 2023 14:27:58 +0000
Received: by outflank-mailman (input) for mailman id 482915;
 Mon, 23 Jan 2023 14:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJxnh-0006sB-4x
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:27:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 204467d1-9b2a-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 15:27:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8418.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:27:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:27:53 +0000
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
X-Inumbo-ID: 204467d1-9b2a-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsecHomFVzxaFf3PXbHir0jtjtkILKpmoJwrJpkk0vhagcAg0Y3BqC/VZ6G56T9dg3FN//Ac61BiWKQFVmTsa9rhXf2vJjj4EZa8c3uJhFCMG+e6V7D3uUquAxZaCdJEuFbJTidzJ4mHoQY3cG1NToe0qdinlEBcR4LCy+i7B23Wr9aycamnVqVsfiYSPy3g9EwOyAKyfzsggOaomHwM/UuUO6XcZH7MU72Lyq0p1RmEW8pPFGJwpeT32LjisNi2gfrN/oVXUF6NOHjh+xFJYpDOW3H2YpEAex71UJF9fLkH/jZMTrzBHtVvozSRck68BYEcdZeQPCYcbP6wO6hTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McZZ2tlCGU0FnMGSjQr1T5hsn4TnYmgsmEZY2V3Kj+A=;
 b=CkkdDGnH9NWjPF59RfvXw/TmW/xdd5O0cDuNj2It3DAHGy233oCIdJHAbw7KhWJ0OlVkCt/X4kWUuHKEs8poc+ABqBBk7ELCMQEp66kSalVsknm0+WNO6ieDMzwhQmV7pSviVHVfh4EMXe16/A26telT14Iym5PSerr5kk8KXwZhQILQEHsYe/N4KgK7jMK9J49PTOUwkJ9MpNTeRICanZUVxxpa5WQ83AB3PlonInoornB1tnCr0D3q2oPbdrqhOe2w/Bt3MQeJsbgQryPEapeL3e4VEw7wgTueEPKZFcZHW5wdnb+/SAFUCbFOwgbeZnPlP2LXpsBu+j1wp9azSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McZZ2tlCGU0FnMGSjQr1T5hsn4TnYmgsmEZY2V3Kj+A=;
 b=agbQAo8tCPEPCRAZSOE5q6zYs4AD9uDn0cR4znqFPVqJ5ott7yuh3YamSCxR7uh76htjgxzT9bJ8eZbCdwP0Uh2fZs61y1BR01PYDDDOEC4L83ykZBvJ792GhO8cnPDRk/cKXfhDlHLhf/hS22D5ULjSOj9siDpN04cZhT72MNiK8CWuwyPmHrRkDgzWb9exvMaY4FGovBqhcnz9ZrB+dyFnsrKv8gho+cu5W4hhBuHd9jgEptMDLMbKYBH8BVIjSHSWOQ49cGrYsptjsgF1OE5wKJSbQlm9El4/gYsA0tUgK8tCLHz8q8nhFJbVZIbOzRYLlvnu8ewtaWvi512i1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d8b5e168-2977-bd16-6345-7aecd778419b@suse.com>
Date: Mon, 23 Jan 2023 15:27:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 3/3] x86/shadow: drop dead code from HVM-only
 sh_page_fault() pieces
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <0e682cd4-3cc0-461d-ee53-13a894797f17@suse.com>
In-Reply-To: <0e682cd4-3cc0-461d-ee53-13a894797f17@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 046625c0-5bb1-473a-ae0c-08dafd4e0384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bJwdo7v+a75JMGmuWUTtPQEHjfVr6yGpYClHz9Seoa0uMqSFbR8LAMLGdiCxGKsoC2msotg7pzWZxVj0ViU7K0tUCbhjnjMpqMoLS0yVnjzbmpsXf0SnX8eK5jGpQyEYaGEgcDv4+KRDxhsqUtqZnv68HJmqo1LK4U09ajc2K8mWCZXMh0Yfkb993HMR2obPStWWQRkaeq8+WPHY9elQ4rp/LcTdL4CGw/btCByGHiXvZEEMo26aSViySN6mbYwHfW5MrGKmn6TCiheswYfyjz6S7zzSJ8Kabi21bVhkGevis2LkzzM5jxGztBdbV+xlEioqgXI8e0PnbUnl4cilKn6ZWsqVSI5lfCmaDVewZGHWFmNo6ppzdnlwQ0y2iYYaV7tl7W7I3BuVqONMMXVnTLFkuanm/2h35cewFw8pi5+JVOxfLaa2g0OAazUHGTMEKe8arLpbiI+2PJRASz2+rpLXciD0aNE8/J7gO5ROG8ybwKCZNopt7p+tMubzcaEtXB5VVaQ7ZsrjmAcm9RrCn+t02bMinXeJRtR4oX7in6CmI2dmAcQieiWDEhUAQCKyAUuuQf2x5uOEdOffINIhopmt1V9gh6gjeyspW2U4PKYS9CzYod/88sPeACzKL5lawvqnUVc1n2LJce1KtgdQwy7U18IVGLiE28CTxCdSH5M5vz7bm5DIDPdjoapULavblQf2ongQz87Xp0uzkILWUktFXn/Gh+jIoie23nw+X5A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39850400004)(376002)(136003)(346002)(451199015)(38100700002)(83380400001)(31696002)(41300700001)(86362001)(2906002)(8936002)(5660300002)(4326008)(6916009)(8676002)(26005)(186003)(6512007)(6506007)(66476007)(316002)(54906003)(66946007)(2616005)(66556008)(478600001)(6486002)(31686004)(66899015)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVdrbG9OVkJlNDhYdVpqM3Jod3hHZ1lQN1ZBMkV6UDJwNGgrWkF3cnJXWWZJ?=
 =?utf-8?B?UFU0U04vVHc3eTJxcHlQTlJiTVJ0T3N2dUdhM25RNW00UDRuVHlxWEc0aVo1?=
 =?utf-8?B?M0NkYWpMV1VBOUNVYjA0Z0dlcXRtQnJBTW8ybjhmOFJIeGM3aEJ4L1JJSkR5?=
 =?utf-8?B?VGdUVHdrTjM1Mkg0Um11SWFHWGk5dHpmTFVDTFdaS1U5b09NYXB5cWF2dWFJ?=
 =?utf-8?B?L0N6Q01kdnYwazBURTFaRVdmZS9lOGhjWEZPNSt5aVhpZVAyYmczVEo3dlUv?=
 =?utf-8?B?Zm05Y2dFSG9MOGdRbW9DdXRXc3owUFdFZzF0SkFZMUVoTjljc0hwZWZKV251?=
 =?utf-8?B?elZVY3ZkOTUvMXpBRjdZNTVqUzlJcDdQTHY3c1BNbmVUQWNTeDE2U0k4eGtW?=
 =?utf-8?B?QWNvR0RCeUlVcXRCRW1xT2tLZHh0akVOcVIwaW9KczhwK25UeGtYRmpyMGor?=
 =?utf-8?B?dUNPQzNoVnNUYjB6QmJsUDBFTmljNUlrSlg3dzU5UEx1bkhJdjM0bUdtOXdO?=
 =?utf-8?B?RVR6a3h5d25OWFFhWkZVd3h3WmcrSnMyT1FMdGp1UURLZXVhbm5CUGJoTCtz?=
 =?utf-8?B?U2pmMGFUR2FueXJzb1BmbjZudFVpRUFRdmxJaG10M0JSRlhkT2VmOG5KVzkv?=
 =?utf-8?B?OFpHYkY5RlV1RGJYSlFvSkFNWk9idXRFa21iLzNNWEU0K2xhNGZ4OVl6ZXdZ?=
 =?utf-8?B?RWZkMTFpamM4c0M4cmdwaG5rV0xGZzlvcDFuMHB4Y3pqNlczUmxQeWh5alpB?=
 =?utf-8?B?WldFVW1mOU9nVXZwR1pjOEZMd3d0R2lpQkZ5R3NKSEo1SnZGdklOODM3cUpU?=
 =?utf-8?B?R2NXZGFmcDJtTHJUZHU4OG94ME9PUUxnMGNYQU1RSTVma1QxQURYeFp5bjc4?=
 =?utf-8?B?a0grS1kzWWU1RlpuNE8rVkZLUHc0OU41K2h4VHI0WjNXdkxkLzBVdHpjZG42?=
 =?utf-8?B?UVd4YUpuOU0ybzJxV2FsVFh1L3hZSDhWb01rZWkxbWRPVHAyT1psSTVvdzFh?=
 =?utf-8?B?dFE3QURaTzh5OXA3akRvNFB5dmhBd3M1NW04Y3hVSWd1WCtGdVNOMlZwVUpC?=
 =?utf-8?B?aWJlN2JBcmx0eHZRTTc1K1BNMVlBbkFFM2RtL3ArT2FGS1Zwam5sNjl6Qngz?=
 =?utf-8?B?MXlGMW5mYXp6QlJOZHkzWDBoekpYQ1VxZ1JOa2ZFV2NPWHlYQnJTcWtoZm5m?=
 =?utf-8?B?STlhNkd6TVpValdudzhSS01lN0JvUXI3T005U05lZnJBakFsT1o1TmQwM0tU?=
 =?utf-8?B?Q3V3c2p5VW11Ym9BZjU3eEhLYiswK0dlZHBCL0ZVcnRZZHorc0RCNlRTRFRo?=
 =?utf-8?B?NEREN3RJUDU0YXVBWWVnRTdaSmlZL0xKSW9ydUlXcDhna0hxcWpEYVpSdG9t?=
 =?utf-8?B?Y1dSaVF2NG9oS0RpZVh0T1U0akJpNzVCVWhwbytRSWdZR1N6S2N5TGlPMitp?=
 =?utf-8?B?cmhVZmpUUHRaNVdXSEw5Q2tSUEJIK0xnY285ZytCSmlGRDJUdnowc0doT2ZZ?=
 =?utf-8?B?RGxncDdsWW9takU1ajJHbHlqV0VBamlsYW4vT1RiOG00WnBLend5Z1hZV08r?=
 =?utf-8?B?TFk4anovK2hCQmNLS1lyTnpBRDYxelRDRFFQQkNIME1FVWphekNscUpEWVY4?=
 =?utf-8?B?aUlJY1VjNCtIdDhaL25BTGwzb0d0TDNLc2RVRWVqN2VNRTM3VC90OXk1VWF0?=
 =?utf-8?B?c3Fwc0hmUW8xbnFNNkl3ay9PR1NXbnk0eEt3TnRuQVQzbmp6NzdVMzIvMW5C?=
 =?utf-8?B?dWZJemU4UXJTdnU4QUNZTWZXRW9YU0hTeS90ZW9UM1BxVENEbXNsRWpsMEE3?=
 =?utf-8?B?bi9GdWREaFVlTFJySkpkRENWdUQ0M2lEeVNySnQzZGlGU3czY2YvTGJKQ1Fj?=
 =?utf-8?B?SjBHTE0xRm5HYVhyL2RsNE01T0ZVS3RGb0pYNVlHZkJCay9CRGxHaGNqQnJh?=
 =?utf-8?B?Tk4ySjVBRXNhQ3IzOHRiT2I3RkhmMEtoM05BcTNudmNEU25OOGcwaVlmcmF6?=
 =?utf-8?B?dTRFZDNJL1F3ZFNrTkIvRzJVM3A1bWhONGRBbVFUaEtKVFZPNEhjRE10WkdB?=
 =?utf-8?B?cERsTUJkMEcyZWJxUWVQbGFpWk5iWFlhMk84ajZnd3cweWJFQVc0UjdZR294?=
 =?utf-8?Q?dZF9XLFF0S+DjeSF7QnsVPwLg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046625c0-5bb1-473a-ae0c-08dafd4e0384
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:27:53.6368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gNnm3071tpyzeWkgoAZJ1i6/Lsbe3KdSRjCDSIWg12LlILeD3BdFFRk/Ebu6Sk3HUgIyFavUSMNE7wsAToxcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8418

The shadow_mode_refcounts() check immediately ahead of the "emulate"
label renders redundant two subsequent is_hvm_domain() checks (the
latter of which was already redundant with the former).

Also guest_mode() checks are pointless when we already know we're
dealing with a HVM domain.

Finally style-adjust a comment which otherwise would be fully visible as
patch context anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New, split off from earlier patch.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2594,8 +2594,6 @@ static int cf_check sh_page_fault(
     if ( p2mt == p2m_mmio_dm )
     {
         ASSERT(is_hvm_vcpu(v));
-        if ( !guest_mode(regs) )
-            goto not_a_shadow_fault;
 
         sh_audit_gw(v, &gw);
         gpa = guest_walk_to_gpa(&gw);
@@ -2647,7 +2645,7 @@ static int cf_check sh_page_fault(
     return EXCRET_fault_fixed;
 
  emulate:
-    if ( !shadow_mode_refcounts(d) || !guest_mode(regs) )
+    if ( !shadow_mode_refcounts(d) )
         goto not_a_shadow_fault;
 
 #ifdef CONFIG_HVM
@@ -2672,16 +2670,11 @@ static int cf_check sh_page_fault(
      * caught by user-mode page-table check above.
      */
  emulate_readonly:
-    if ( !is_hvm_domain(d) )
-    {
-        ASSERT_UNREACHABLE();
-        goto not_a_shadow_fault;
-    }
-
-    /* Unshadow if we are writing to a toplevel pagetable that is
-     * flagged as a dying process, and that is not currently used. */
-    if ( sh_mfn_is_a_page_table(gmfn) && is_hvm_domain(d) &&
-         mfn_to_page(gmfn)->pagetable_dying )
+    /*
+     * Unshadow if we are writing to a toplevel pagetable that is
+     * flagged as a dying process, and that is not currently used.
+     */
+    if ( sh_mfn_is_a_page_table(gmfn) && mfn_to_page(gmfn)->pagetable_dying )
     {
         int used = 0;
         struct vcpu *tmp;


