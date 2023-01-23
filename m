Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B12677DF0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:27:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482907.748696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxmq-00068S-2u; Mon, 23 Jan 2023 14:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482907.748696; Mon, 23 Jan 2023 14:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxmq-00065r-03; Mon, 23 Jan 2023 14:27:04 +0000
Received: by outflank-mailman (input) for mailman id 482907;
 Mon, 23 Jan 2023 14:27:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJxmo-00065j-3o
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:27:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fffa1792-9b29-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 15:27:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8418.eurprd04.prod.outlook.com (2603:10a6:20b:3fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:26:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:26:59 +0000
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
X-Inumbo-ID: fffa1792-9b29-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZuB4NEpDfHAm9UqxKgqAyAE40yjC8WRRHZ4ZCaOGkVRIuHE37I47FcloqtMQk0Rk+Qy8zRQeYYVmEJ7jZx1db5WClxnHvAjC7AYXGgF+uaywgdeUpejiSEh2+4+vfx2UcPOBKxZOpvLXlLg4Oz3YcQts6iOhCWhiXyKFGKCVY9OxoZPXgJvCgBNxe2ni6HITpoMsHZMn0CaJdK/oW1t2LuiFFbCP0+3f5c8OEtdmero88oiYh2k7Gtu3Ib1mixnULhqzH7ggr/v4fsMMP+oJOdSbMER/AKaYM5H9T8c/sP60KLwQD+hFchIJg4SUIkMlGA/IMmE+1fYTnVOVbOWXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/gm2cl/X9TcLNxL3ej+ogFLZ1GGnpcQ/Jniu05nakk=;
 b=l+3DiY9qlcbAKAyy5IWRdpH/qlLBL7uY4fe0CKECDhXrp7taIzOgdGU6PTV/+qz64vUQyNE9bQQRqmvAtdN3usW/uqyO1FjhBkxSPRIO6hkC0YFRD3NGmppojvwamlFqw4cM2LFZ9HEJHeqZaS9BTeG5VnUy9anLqMOL7tjjZtzN4XQJ6wsBXeoj8+vsp/P4Xm4peVaX0sbOEZjpiloQ/sn+ugJOhOTA/aV3O5zMxTnBLMB5uMTEAL+LQam6i7QSCgh13zjrxxQhjvPOYbiISqfYPqBuwEBI63n0zTc3FAqsKVFF5++gw7buY0EDXJLQ9Z3gW/5lWqQhex6r0LCycQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/gm2cl/X9TcLNxL3ej+ogFLZ1GGnpcQ/Jniu05nakk=;
 b=SFKeol+dT6CLMvfBkZgyAsVtlI89hqB1gJxAvzLRPoQ8DXY+oeG60zflT0mdFGbASnsR7Jl1yj1hbir+Sagj4EyrKOG/GIK6/VgFd0pjnhlyEg/G2AhhDTI/L7Bezsp0Gxp1Dfyotxtcx3ERpwI7+KqVx5gXNtGP+B6vPBN54EqZDESTXeMiZOUmRDRETlQoLRlK4xWGmHHyeOXtf2qJkwY0cfdpfVLwktANC5q3AlVgsXhn8wNn+dkbLwRatFb5o9BxYqpWD0MaZLpgbNddFb5K3NSLI12+h0veY+KSgJBhe1qtB2eGBORHSgXNwyzXSXqhBw1O73RyX9poyQNOBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d8a938e-cb4a-a989-1849-d702cd25d890@suse.com>
Date: Mon, 23 Jan 2023 15:26:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 1/3] x86/shadow: move dm-mmio handling code in
 sh_page_fault()
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
X-ClientProxiedBy: FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: c001ad8d-46e1-401c-07ba-08dafd4de302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7SlaED7EiEKyii893uyehhNUSkjG1v3J0TpJTBs39z9Lh1M/dgLDFEKgptIcj1xlG8NtzBOWKpKWsl0lEw78YBVqhX70DB2y+Fx8w4Ts/LWEOJHGam5qipqvyRodOPILHJAQhdALFDsaoKx3p20vAhu0cNDv+0Oce5ygw8ebASyG9tzV3sj2A4wOk/lAC2Y7ytUfqqaLJa/4JSATvcf28aCfvn8Y/fpyX2+GgmNp2K3t3NeJCZDWcunAUZhlV/Hq3SNKGXti6WLbqC8Q/Vf5WwG5Tdc0SIoS2pH+CfE8T2L6JeTWwFKFBnp1/paQwpkgkcLKIeNtk7/RgmHmjvAwQeIqlLgcuKBkCW/F0Z0ue8kWfD1PhSyXVul4MZiFzJINSnK0Ow34wKyfleyQlx8+jYS5roGTfZESI3MiOnzgvJ7m/Ibsl+aF2M9EOaPOE8LCPwTYXJbx73L9ljq5OBoVofU0EPCJLVpNfbpCYxcCBmk7ms//MAAg6iA07rWEnHdhyjj4/NDnw7VyFtyHo8AedABy7f07A3xShTvaskFXO0y+WlAiM9tW+1WW1ChllLBYQY96DzaFyi0KPyrCeUK22kfvxwBuEBir4P1ILsC/VFGlyLQ7VadoGoiF67PpbTYuydr+gM/osXkmxO6JkRjrLdaxfGnHut200UydeulTcfWmdk8MbMxoZ/Np36PnhGXlyNA5w/7keZ/Q5XLqHVnDE2nvTjUgnhj0WNNZUalYKzw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39850400004)(376002)(136003)(346002)(451199015)(38100700002)(83380400001)(31696002)(41300700001)(86362001)(2906002)(8936002)(5660300002)(4326008)(6916009)(8676002)(26005)(186003)(6512007)(6506007)(66476007)(316002)(54906003)(66946007)(2616005)(66556008)(478600001)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0ZWeG5tRWt0dnVNdCs4UjU0Z3JGaWlaOW1RMmIrRHo3eHc5YnVFcEdxUFM3?=
 =?utf-8?B?SDVmU2ZEcDVIK0xSS0tPZkxtcFpuVmNsZVp2VmhoRm1NdzcwSUkrTnUza1NY?=
 =?utf-8?B?Q1hjNlVLN2NXNXFqaEJ1TUc0VDQ5TVlMUnppS1NCWUMvNjQvRWdSWFZXRTgw?=
 =?utf-8?B?alpQb1V3dll2SDVMSnBwTCtNb2VYc21qaVFybEZ6VmhSWHRHMDU4ZzZ5cEpw?=
 =?utf-8?B?Y3dEZzRmWVVhWThnTDREOUtrMHFIbnNydGF2ZGhBUklCdlRsbVF0Qm1XTVNB?=
 =?utf-8?B?WDVhRGFDeEpYdGZuMkhYYlV4ditJU1R5ZXdpTXVUL2hnWU9IUmpjWjFoMXI1?=
 =?utf-8?B?WE43cEg3VDhYS2ZTVDgzM0ZVbVI5Rm4yOUw0QThpaXN3TlgzSHVoS0RmN0hQ?=
 =?utf-8?B?aloyUmJsenJmZ2IxOW1sc1FzSzdaa3o0dkh0OG4xZzBHck52YmxUMUI1Q2dE?=
 =?utf-8?B?bFJQdTFLU1F5VWNyRjZ2N1o5MExFTlRmT3NKbjRaendCZzZ2OWZtTWprbEFC?=
 =?utf-8?B?aGNTZUtOZkpnRWMzSS9rV0xQZEpjZkI4aU9XeldjUGZLdXVqUFFhWWRRcDVX?=
 =?utf-8?B?NlpvbGJWeDFqT1JnUmNTM0VZazBSWnVtdHpTbDBuMG1PUjVQenhvMnQvOUJR?=
 =?utf-8?B?U2FGeXp5Y0VGUnVBcTJBb0ZHdFdpYVNiaDdHTEZFbHFpMmgvTnpRbWtUM1U1?=
 =?utf-8?B?eGtrM2Y5RmwxaDhGbUlxUFFIeEhhdEpJMlJ1Y21jZDdMbHBWMTEvY0cwK1lY?=
 =?utf-8?B?RWtBT0ZQUzcvbms0cU9XTGlWbjZjVHBUTFZ4Wm1qaEtaRTFuMkNEREt6U1pm?=
 =?utf-8?B?cm5xdXREbUJ1dUw5UkJhUzkzd3JPYkFRUVNOWW1VanRHNkpEVXEvQzdaT3JG?=
 =?utf-8?B?N0dXeG96c095T2NsdXkyN3N3S2VqTEltSnRhT25Mc3FuVGo1VGNIVzhjVVVn?=
 =?utf-8?B?UGVxV3ROVDBMTU05ZHpuY1ZkNWExWEhiSWJ3Nnd4OGpad2ZBUHd4aGF5STR6?=
 =?utf-8?B?UmFuNU5tenVHT1FPdytWYndQT1NIN1c5WWJhRW52bkNidnBjTXMzNnBpZUpo?=
 =?utf-8?B?MFpma3ZQdTZ6K3JvcTdnSVBYUjMxelhDKzFMdnN5T1hQSzJudk5nVlVaaWdt?=
 =?utf-8?B?NFh5cjIrc1VPdmt3U1dpVm45cGZDUmNzdit0TGZneHBLQWFjRnVaVFZvYXNK?=
 =?utf-8?B?b21MaDB5SFJWY0haYVFTVlZqN3B5OW1mZ0RhbWgxZzRSV0Vpdm4ybjRHd256?=
 =?utf-8?B?eVlMd04rWnFGcEVyTHVoWTVUcklMZlZISEg1QlZuV01ubmNSaTJEb2QwSEVa?=
 =?utf-8?B?RXl0ZjJLY01JT0dkUjZjcGdKamdSQVdsODY2TndKK0RocmZCN2U4Q1hKc1Uy?=
 =?utf-8?B?bzR2clNzV3lObGxkM01vRzN1c0RRbjRKN0NjVFN3TkxtV2dPSFpPVkxDa2pK?=
 =?utf-8?B?QnhMSkRkRmZMSEhxTS9DMVNXY2NJTXNTWHRoREd0K0VBZkh3V3JnZytZcVlR?=
 =?utf-8?B?Z2VibzNCdXo5WStxQzNRMWU5QnRWckdabXlqbGdISlhaZXo1cEtMQVZYNGJE?=
 =?utf-8?B?MW5iZ25XNnR4REEzWDBDY3lVUG1YUEVRS1BBemVPbGkvTkY1bnpzV1Rkb1JY?=
 =?utf-8?B?eDdrZWdBaWJsamZicTlZbldHTEoxSEtrckhsdWE4a3czN05MMTEwUlQ2ZmZR?=
 =?utf-8?B?d0lRNjUxLzBRb1M2THNtYlAvc0dQTk5DaVdjTjVBbG41NjdYbTg1UzluTDY2?=
 =?utf-8?B?dE1LS2RRTnFYSVQxTGEzV0NqQ3g3bUxpQkxQUzNac0ZqdnN3QWkvd2N2NWFa?=
 =?utf-8?B?Vm9ybk4rUGJtMXR2cWVJMnFmRXduMTNOT0FCa1VDaGtPczliYllrQjFPbldW?=
 =?utf-8?B?TmZ2NmE5V2FIQUhXMVU1R1B6YmZhTE9Cc1N1SHlLVk4zTkJtUUtoM1krODBa?=
 =?utf-8?B?Qkd5dHRNTDJva1ZmYVkxRllrSSt0UGFzeCtYTDN4U1hiRVI2MUJ3SC9PbEVm?=
 =?utf-8?B?VHlIRmVWcjc3YlpHblBCMzVYNjhHTkpwS085eDZIWFAvL0FFZkxTQlp5eXF2?=
 =?utf-8?B?ZHVtR29IbkRETnFZclJ5SWY1T3hPZTR4NEFzaFIrT2VpY3NvWFdmRkdrQUJE?=
 =?utf-8?Q?LMi2RlNvlarGR4B/pn7gjyFD7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c001ad8d-46e1-401c-07ba-08dafd4de302
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:26:59.1091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyXXUYNvArHdFMH/GuKTS42saqi+hZS1MBn8DF+VpdCFHPU+0iPmE4WmmxnID/RjGdz9FifQvMcEJYEPOvkLQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8418

Do away with the partly mis-named "mmio" label there, which really is
only about emulated MMIO. Move the code to the place where the sole
"goto" was. Re-order steps slightly: Assertion first, perfc increment
outside of the locked region, and "gpa" calculation closer to the first
use of the variable. Also make the HVM conditional cover the entire
if(), as p2m_mmio_dm isn't applicable to PV; specifically get_gfn()
won't ever return this type for PV domains.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2588,13 +2588,33 @@ static int cf_check sh_page_fault(
         goto emulate;
     }
 
+#ifdef CONFIG_HVM
+
     /* Need to hand off device-model MMIO to the device model */
     if ( p2mt == p2m_mmio_dm )
     {
+        ASSERT(is_hvm_vcpu(v));
+        if ( !guest_mode(regs) )
+            goto not_a_shadow_fault;
+
+        sh_audit_gw(v, &gw);
         gpa = guest_walk_to_gpa(&gw);
-        goto mmio;
+        SHADOW_PRINTK("mmio %#"PRIpaddr"\n", gpa);
+        shadow_audit_tables(v);
+        sh_reset_early_unshadow(v);
+
+        paging_unlock(d);
+        put_gfn(d, gfn_x(gfn));
+
+        perfc_incr(shadow_fault_mmio);
+        trace_shadow_gen(TRC_SHADOW_MMIO, va);
+
+        return handle_mmio_with_translation(va, gpa >> PAGE_SHIFT, access)
+               ? EXCRET_fault_fixed : 0;
     }
 
+#endif /* CONFIG_HVM */
+
     /* Ignore attempts to write to read-only memory. */
     if ( p2m_is_readonly(p2mt) && (ft == ft_demand_write) )
         goto emulate_readonly; /* skip over the instruction */
@@ -2867,25 +2887,6 @@ static int cf_check sh_page_fault(
     return EXCRET_fault_fixed;
 #endif /* CONFIG_HVM */
 
- mmio:
-    if ( !guest_mode(regs) )
-        goto not_a_shadow_fault;
-#ifdef CONFIG_HVM
-    ASSERT(is_hvm_vcpu(v));
-    perfc_incr(shadow_fault_mmio);
-    sh_audit_gw(v, &gw);
-    SHADOW_PRINTK("mmio %#"PRIpaddr"\n", gpa);
-    shadow_audit_tables(v);
-    sh_reset_early_unshadow(v);
-    paging_unlock(d);
-    put_gfn(d, gfn_x(gfn));
-    trace_shadow_gen(TRC_SHADOW_MMIO, va);
-    return (handle_mmio_with_translation(va, gpa >> PAGE_SHIFT, access)
-            ? EXCRET_fault_fixed : 0);
-#else
-    BUG();
-#endif
-
  not_a_shadow_fault:
     sh_audit_gw(v, &gw);
     SHADOW_PRINTK("not a shadow fault\n");


