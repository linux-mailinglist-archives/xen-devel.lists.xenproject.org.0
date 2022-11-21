Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5996321AC
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 13:13:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446573.702201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox5ft-00013g-FX; Mon, 21 Nov 2022 12:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446573.702201; Mon, 21 Nov 2022 12:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox5ft-00010q-Cg; Mon, 21 Nov 2022 12:13:21 +0000
Received: by outflank-mailman (input) for mailman id 446573;
 Mon, 21 Nov 2022 12:13:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox5fs-00010k-5h
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 12:13:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e23a611d-6995-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 13:13:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8509.eurprd04.prod.outlook.com (2603:10a6:102:210::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 12:13:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 12:13:17 +0000
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
X-Inumbo-ID: e23a611d-6995-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xkwosi6Z0eMXEUxYAT1HVXXVZ0I3/rXDfj8mmShesKfESpeEbhQ8JhrCILpFB2piVNwKyVSLeZtzuJHHL3Wt/PyyJ0dTLYCQ/gq0NcDkTlLzQW/W62LLA/TF2eB6ETCMKXjbc/sk/rjHqI4U4dzIro3f8DcC/7p+Bd6yrxIOfiR/sZ1yzRVGKx+xkV5B9WG7IUEpBqGwgvDAJe74ifb88BPAJ0JPYVa58V0wVuT3ocXc4PuM9XLB7F4tiyyr7VisGgu7m4KZc7z+K8ud/kKzBpRc501KL0EgfwRLhED967eLXv+JdIArn/HxVK1LRa3HZzuKaqQYabFEjhM/bkAxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUu6rnRXe9YkDTkyf1SAxdBVIm8j6LjCfjDtHIypVgQ=;
 b=QEdiMSilbMDD144iactQY8VIQQcSL5o9iJ13U2/uy8yuI7qhf43Hg04A0NUUvbK0yHyg/+c6BRxBt7+Vbonv1Y/+HIu/KDweVtAlt1UQD0uyXHxf8fNQfU8BMraTW6TBIP8Maz6EMPkXTxGUMHt+G5gXbDtDTiTPS/sHhhaeYBQ6k2mkC7SqBEq5jisN2j+TuGeNpV05zxh+xx96hjLfgOWwxBYn6BMYSGbZAwNaIjGPI5T4O1dMnNTYARnyMgMHrBCGakjX3/v9VAFG/idG6WCvA+wknZs/hDKmOc9WU7i6mQDQhbzmfXI1T3ONT1E57Fd02+IzCaFoTBK4mfxD1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUu6rnRXe9YkDTkyf1SAxdBVIm8j6LjCfjDtHIypVgQ=;
 b=btVXMtDAcO3mVmqm0L6u8ezUFKgJEn3TS+1vAbsN55Y5fEmRR9S2TUzmD09LdAfPkAslDNY+R1MZz6v3QXpaDOWb70ph555SkQ214VyngyvR16Tz6OfY2x5SyYCVL2aPqeIfaXwvf4V+A2SXOuFiT8p8J0nyAxZ5B6vng2tEAa2MD1eNEw06M0EK8cA8CR0Y9Ad+uzUylevcuD+fGFA+rOFLYv0v1IqH49HIirzmXyKBadSqJt9i6v4xxyPHlGUvCI5wwBVboen0/v6A9+PLV5KFjl1AuEe88EDre7IVyF2h4mXCi+ZEqRgnbm4Ga4bYMkAZMzNlKvgXlQjgI+4W5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69b79ab2-0acc-5980-9a79-8c477aa33868@suse.com>
Date: Mon, 21 Nov 2022 13:13:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: don't mark external IRQs as pending when vLAPIC is
 disabled
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 7278d11e-aebe-44f7-1ad9-08dacbb9c574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CxkocuabUKDFb4G+y2hzmK+X4DnD+k0nZMQstC66YuB16+UtBScCq68zQk3fTIoEZLZtP/oiy7HTRcJwbK2vA+E35yWMpOdKhjsfffNmUICQzpYXNlWI2esHR9deo3Q/aq4wS4seyqmG8HNORApQs7n+FSCOkmc0CbI/mKDzksl4+vxBdE3nhoWToadB+iiF1b4K+Dz0RcQXOQ9rH89XWS+4vxb98QMPOIrFl/3bnWQ+LKPCKI9YpHHLikltssvDCw8MEWcp7qQOgC3iZuxSl/dsMRKPgxei0ArWVTHndYAwvozSFMB48UOuLMGxtSyrmK3L9ZucYOSt7r76cMICjhdT2k9PFyAs9rmlST0CbIrLeA3dO83aMqFwdY4z3RlLLb/k9qnwEvuv3t28pnXYuwlPIJDniOxbRwDQkjpGqu3w7I94aSS19n9ciIoyXFU4tcdI6XghNqy8MXZ2NrvoZ2a30GFGRcRr4a7bEf55PToWoos8oZSQ8FTlTyTogiAGi+M/LvSDG3LxuA55fRwpXxi5gXQfJRGQ3GfCZChlwoG/vgDbWPvtOFkGTv79S0NTwx9kyOleSCIOS3pnp5Ahf/u6jsxxM2EYgacmHQ1vmAxt2TJ6OgnO7ks+s2zsTV6uCy2kPyOn7K2M2dYSkjs+n/RJMAh8XpWEOtzbw30mv275vtOwVLUcJ6oxYy8pnEk6qg/CJ/m5OjmKl0AFDJmc6NAOHjaRu9wDs/snbQ9vrvY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(31686004)(2906002)(2616005)(186003)(38100700002)(31696002)(26005)(478600001)(6506007)(66946007)(66556008)(6512007)(5660300002)(316002)(4326008)(8676002)(6916009)(66476007)(36756003)(8936002)(6486002)(83380400001)(86362001)(41300700001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG1DOGpuN2dHS3p6NFZWcjVUNGcxVkFuaDArMUVzZnZiVFEzaHJuUm9BYVRt?=
 =?utf-8?B?NmNQQ3UxQUJzMWhKelV1M0E0RmFob2ROT1ZXU1dlWkV6ejYwVzM2eHR1WFpn?=
 =?utf-8?B?bnpxYVl0RDMyVGthNEV5eWZqVnB4bWZUVnJOaVBjYXFLRVhBV1R6S1ZaY1lx?=
 =?utf-8?B?VXZvWmxkeUFlQnJBTFZycVl1ZVdvK1ZoWFc1bFhCMFJKTVhBNnMyZXFENm9C?=
 =?utf-8?B?L3h6aXlnOWNROXV1RVNtdUJ0YUxhaWNuSEdmTXlCNUd5UWpKRjltVUMvODZV?=
 =?utf-8?B?d2pPcnNaenJncktPSVpldzhiTGRqbnJCOEpCL2liU29GNGc3SmtZSW5OaXZI?=
 =?utf-8?B?S091eXdhVDFNcEtWQzJaOUdoOVg5QXdSQ2Q4K3NtT0xXK01hRU9EVExhNHhQ?=
 =?utf-8?B?QzRwZUhEbU5uVXBwa3BtcXdOYXN4OHpVckxZNGRCUXQvRFVIKzJPQ0NTSzN2?=
 =?utf-8?B?MzVpbmsxZSsrUSt2TllEWFFzTitodDg5T2UraEN6OHg2Tmkrd0RxOFppYk5i?=
 =?utf-8?B?NDBDcDg4SFppUXNIakdjZ0FVcGdiMmk2bEdIUk9URnFvODZ4dnprWndTajlq?=
 =?utf-8?B?WmtzNkNSU1FWdkVmMjFyYlN6MCtsR01Vd25XTzZ6dDBveHhQRHI0UDlHR2lU?=
 =?utf-8?B?SjFBSVZ3SWdUdjVHUzlJU05lMkg5akpmME1UaGROall6ZHpEeWJqbGpBdyts?=
 =?utf-8?B?eXdobW81TGJ4WXc4Njc3UjdHNEFCbVhTZzJ1eEZQanZCNDJaa1VwS2l4aXFr?=
 =?utf-8?B?eUhJVUpEM295Q1FteTdvNXIxdjQ5ZlpFKzZURmxpYzhTQmlWUU5rczRWN0h0?=
 =?utf-8?B?UmcvQkI1a3hhcDNzd3cvem5CdnB1dnJDa2kremNTN2dTTW5lYnlrZ2JtMEw5?=
 =?utf-8?B?b05HM3ZaakQvRzhicHdKM2FYSHl0azlsc1BWK3RxQjlkd0h3am9XK09vNHFn?=
 =?utf-8?B?NjYxY25PMm5ROGRNcDU4NFBlNHZpc1pBVlBkN3pic213bXAwZ3p3elhuQit1?=
 =?utf-8?B?WXNQNVpNYnFGQUlmdlFOUnVrcmZCQkhrejBIWW5sWG1Bclg1eVFXQzZQdlFP?=
 =?utf-8?B?K1V6NktsZEpDMDI1b3dkcko3bTVraFVTNE9KY0JXaGZFelpiajhuaXZTZFJq?=
 =?utf-8?B?bHFrRXZwdDRtcXZYdC9maVdrV3oxc3JUb3ZLTFZCZmRpYnVmamVoUERiSVpa?=
 =?utf-8?B?WjdXUFJHZjNEbURtV0wxdUZEcjM0OXZEZEZRTnhkRDZib0x6VzdvT043cjNG?=
 =?utf-8?B?aUxaK3JjUEVGZ0JqWUZaOFhKN2RDMmE5bXhraGRTQ2NwVkFNZ3JFRS9uZnh2?=
 =?utf-8?B?cGQrQk85emxBY21YL0h6UXRBd2hWVmtoT1pOejJMZ3p0aWJDWkN6b1R6bTNB?=
 =?utf-8?B?amF3eGRFUit6WkJTdUxTSUhWSGdTelBLcWUwc0hxUkQzSEZmS3NGYzcyK2o4?=
 =?utf-8?B?SWhWRWFYa0FVeWt1OUFJcVVZRDQ0czBmcU5pNU1jS25vUEQ3cUpQT0E2RTdx?=
 =?utf-8?B?RGJhR0orRVh0YUc0NmxEOUc5Y2NsWUc0K0cxYi9rOUo1SWVRYVp3cWMvelZN?=
 =?utf-8?B?VVVadUdVeVgrQkVKNnJNbTBKeUV6M2w4OFRpTzhxU0FDZWVRT2k5VjY3RitF?=
 =?utf-8?B?MU85MmN1M2k4b0FZMUl3bmp2MVJZRmE4TWorMVNuS1RXRXJBZEc1dEtTN3li?=
 =?utf-8?B?WURYbzlZcHBmS2pnZFd0NDNJR3NNdU83UDNESGM0L0lXNVVuaXhaR0ZudlpY?=
 =?utf-8?B?UmpscG9oaHNSTW9CalRBbHZRbzRldHl5M2hCNCtGOW9qV2UzSDdPM25IaHV2?=
 =?utf-8?B?MXhYcWVxcnhTdTIxK3BOMFNZZ2ZyeVRXWVk4eWRKcFdpeXk2S1V6bDNnMUp5?=
 =?utf-8?B?M3VvM0N5VXVOeEJQWWJ3MlFrcUlzZG1aTnFlWVVsL1pZWGRoUnUxVjJSZUZm?=
 =?utf-8?B?V09kS1kwajA2OFY4UmNnSWh5Q0g4eEZUS1R6L2d0d0Via3BGdGZWZ1ZEOXBP?=
 =?utf-8?B?N2VOU3djWUxMdjZldGpUYjlnUlpxNldoUDRiNkdFMFhNcWlWVXN6UHQ0VUlG?=
 =?utf-8?B?Qjc0TlluUmY3TjZTRTU2djQrOGU1d1NpUktUZmlXSTcwNTBkdFpmcWdMdExF?=
 =?utf-8?Q?ZMPKnwQhztvsvl/hdNE+74xRR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7278d11e-aebe-44f7-1ad9-08dacbb9c574
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 12:13:16.9392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iM118i3WCxkcnXfuS6MJ4WxAylFkV6OSRtu41JJ5fjBEh5IrZTpE4Slu9B61S7RpD/0eM/bcTlxy32hwTFNWiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8509

In software-disabled state an LAPIC does not accept any interrupt
requests and hence no IRR bit would newly become set while in this
state. As a result it is also wrong for us to mark IO-APIC or MSI
originating vectors as having a pending request when the vLAPIC is in
this state. Such interrupts are simply lost.

Introduce (IO-APIC) or re-use (MSI) a local variable to help
readability.

Fixes: 4fe21ad3712e ("This patch add virtual IOAPIC support for VMX guest")
Fixes: 85715f4bc7c9 ("MSI 5/6: add MSI support to passthrough HVM domain")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -460,9 +460,14 @@ static void vioapic_deliver(struct hvm_v
 
     case dest_Fixed:
         for_each_vcpu ( d, v )
-            if ( vlapic_match_dest(vcpu_vlapic(v), NULL, 0, dest, dest_mode) )
-                ioapic_inj_irq(vioapic, vcpu_vlapic(v), vector, trig_mode,
+        {
+            struct vlapic *vlapic = vcpu_vlapic(v);
+
+            if ( vlapic_enabled(vlapic) &&
+                 vlapic_match_dest(vlapic, NULL, 0, dest, dest_mode) )
+                ioapic_inj_irq(vioapic, vlapic, vector, trig_mode,
                                delivery_mode);
+        }
         break;
 
     case dest_NMI:
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -87,10 +87,12 @@ int vmsi_deliver(
 
     case dest_Fixed:
         for_each_vcpu ( d, v )
-            if ( vlapic_match_dest(vcpu_vlapic(v), NULL,
-                                   0, dest, dest_mode) )
-                vmsi_inj_irq(vcpu_vlapic(v), vector,
-                             trig_mode, delivery_mode);
+        {
+            target = vcpu_vlapic(v);
+            if ( vlapic_enabled(target) &&
+                 vlapic_match_dest(target, NULL, 0, dest, dest_mode) )
+                vmsi_inj_irq(target, vector, trig_mode, delivery_mode);
+        }
         break;
 
     default:

