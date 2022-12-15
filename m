Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1928064D7A7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 09:21:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463122.721259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jTg-0007iC-Cu; Thu, 15 Dec 2022 08:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463122.721259; Thu, 15 Dec 2022 08:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5jTg-0007fF-A1; Thu, 15 Dec 2022 08:20:28 +0000
Received: by outflank-mailman (input) for mailman id 463122;
 Thu, 15 Dec 2022 08:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g8Eh=4N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5jTe-0007f9-J1
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 08:20:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5328166d-7c51-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 09:20:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8163.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Thu, 15 Dec
 2022 08:20:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 08:20:23 +0000
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
X-Inumbo-ID: 5328166d-7c51-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIsjrOkCdIzdMBKpgkUyeahcsl04XTWsYLUGKzyQ8RUBgTTnLSNccNu2OBKIXCb0PHMqlnkJ8sAWys0ruI7rDcOmY0Ax7NbTYbTvJ9h+lYNTF/f2pUrNLvBw/x5xKhJNWql37oWnKhpNRN+hQhI4qesLI3qOZ41MKT0da9Kxo+JMclivafJrlyT4B3EynFqJjBNDzLp5PXEEjopXtbNQGYij4PWzFX8xtnALkBG/ou4BZs1+l92rtLz9af7tmcywUIKE4Gd5gp9nn5CyWDekgyD3u8ltcnXntDd7xib3Lprz2r6MgJ++uOWPIBf7Z2faYXAP44Aq8DIRtKS1x5Ng7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wb5l1KXUiBOGjR+uZCpnTrAK3ThRH8BMlU5i4PVgkJA=;
 b=c/DyhXv8bI/xNlSdmDT6dVps0mwzxtQ6Lo5ljDAJcZCUlRrWpp7yNfUL6XQmigKHwH1HasjH+URq1/K7HKI3WcnjMsolIhog5poOJkj0/cEKxeHVL+J91J+axUXSjpPkET+71tPMd2/PX/AzCIjFGzqtqsnBNCoAqPa0v3mtCVY99NGhNO+V7hjdsJjjWYLlCvcMNs9TMFipl385kaywMUaTT9ABfNh8xG2oWuNP8xUMd5739j/49EWod+l54inFEdT1pHNX/3pTcfCP7bcGVEOUGz3caacoNF6o+u8S8Bc6lQFk9B4giHQDscWc/Hi0niMZ9rp6LMGpv72jNV67Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb5l1KXUiBOGjR+uZCpnTrAK3ThRH8BMlU5i4PVgkJA=;
 b=VvOkDwAt754Ysnss7DgwxuobRBG38y67jt8L9v3ZSNTZSUAPo0l4alojsrL9dlr/KoIYXcjcGYz9Rhg3anEGghzCP1FmxW2WGN0ww1UPzJ+R7yPBFbQeab0oDwRuqTxoiqwK/e9qEzvHQSnWpcrysyze0ONyV9UJtjzJ+awP/nJutXTzJkm8kMexv+EYoSkbNfjNkdr4PirK/Cs4Nc/Q6kz2p5GwdcYOVq4xwnQVYr8KVYfigJ3rOBb0laAcBHVsY163skISug4sii2KeM0OwxafWUDW7nO16WKGxntkGu1H4LfgpkbYHeac5K6nN1Xc08qQGRhaCNN7ZbJCDAYnow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30a79d1e-c638-9e74-52fa-4cce53cd12dd@suse.com>
Date: Thu, 15 Dec 2022 09:20:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/SVM: restrict hardware SSBD update upon guest
 VIRT_SPEC_CTRL write
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bcb94d7-9df0-4de8-ce66-08dade753674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	42ujwb0BhCLwUf9JLPqX93edqEm2PYf+8hXJnUmtE3G4D7GX8XQvdVjelC/6agFgilKZZg1OFsZdwKAoqwJ8CcEIodVJ0FpBBneq5D0D98xF97DTzjWeZQoqy0zX5GbLiG9s5QZJvxfw4bEDlrlGco5Lal2QSrvjIUnkVVxFha6u5PRdmImeAv6TRyuP0Df7Mt6ZNCUUThTRSnwqAq0jMwONQ4oeAKtbwAngO1OLQHmjVWnhvEirTjSM3e8RxXjeb1fXC2m4Qv/PUeFsHJKIlcD7M8nd9k/vr5mky2CSyxfIwVx0cV77IGE160rSJTs/uG/FDlj9YeN8BJ0RaBrZocKGTA1FMN/2DjiTPS72h3g28CsjGI9lgwnFdmUJu0pxkDhRIP7wztmK8tyglZs0vUNmZH39O9Zpa9gemLNLTCFgdfGUXdVBZtd4pyIrciPSNgbn7ErgqT76tkJ4vYxuSsSm0Ai2Fp3JAN9WqBer3vemuuAe+PJORwEor85x9nQn2ox9bsfwS9wcMAidXTJ7NnQa9s1HKL7ZkLdfXe86FhlaKY1Xq1tLyGNJG2GhA0W8Smv8iaOphucnMzYUYlxYBkDTCLbUfDGUoQXeUs7j5BzuEKCJCGUGf5aMzJs9Sen4WnkafI1sILl31rIaB7FCazWl/aMvFJoTJN1LdaJSo3+dnJeyd6MNLBgNjBg42JGO54WFYvPa+Ly009O04CAtO/Sx1u3DMyzXtSC+XRPwOWs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199015)(31686004)(54906003)(26005)(66946007)(66556008)(8936002)(36756003)(31696002)(6506007)(6512007)(86362001)(316002)(38100700002)(83380400001)(6916009)(41300700001)(4326008)(8676002)(5660300002)(478600001)(6486002)(66476007)(186003)(2616005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K25zOWhNWTNmeFNWaENjeFpSZFdsN2JUV0R0MHlKNlUzQW93RWpnRmtsVlE0?=
 =?utf-8?B?ZitEbTlFVDZSUlY3NHV5Z1B1ZWhzbmFFUmJKMWxTRkQwdk50QjZ3SUQ1Y0hY?=
 =?utf-8?B?NzZGQjFDZ2lJM3lUdWUyZ0ZrZDl0RStndWI3Wnp1ZWVJRjBLUlhrTlFMUVpr?=
 =?utf-8?B?VVhKdzlYaTJjZlBReDVsajFDWEJIaFNzQ1dZT2FnWUlGVXdjTHNBVi9ZVnZm?=
 =?utf-8?B?MzdvRE8wL29KZU9kbWlVOHpDUzNtSzBicElUeXlReTNwODY1VWM0V2NCN0dR?=
 =?utf-8?B?Uk42TGVIVHk4bEpadmtzcjZ1N1RWUVpYZlZsVEdaYTRUbEVpZzh4M3BCR3JU?=
 =?utf-8?B?QUE4TEN6elpTTkJKdStQUGFDV0dEVUNMc1F3ajlJSnRxV1dSbG9wVG5TOFEw?=
 =?utf-8?B?MXpKMzVyTWpnOTA4d29zeE16UURqUUV0R0lGb2wveEljamdEcHR2YVZpSThr?=
 =?utf-8?B?THMwVmZPMnZSMytxWUlPRWdFVFhnZTg2aEVhOVN2NXUrc0tla2VUcmZjZElk?=
 =?utf-8?B?eWlveEl0WVJoYWtIMk1xMy9RbU41YVhTRmpCMnpNeVRtV1FDME1CRXpZWUlB?=
 =?utf-8?B?VUMvQ3pOeGJveUdFMU0rRWJWQUhPMHAyR2UwYlo4N3lpUVdDS25hV0doS0FH?=
 =?utf-8?B?UFhlRUdzNm5LWmJ4RGp4elBkZTdPd0hGN0dVOGR3TXYrRkZDMGwwclFDLzZI?=
 =?utf-8?B?OTc5WmlaMTVMbitZZ0JMMmY1eHRlaDV5K3pGR2x5TFlnVUVNbXJHcjUrR2Mw?=
 =?utf-8?B?QWUxeUlFaDBDc085aDhCVHVhOEJJd2MySW5LUFpWcDcyR1I2ajJVYVhCZ2Vm?=
 =?utf-8?B?b2lZRjVZd0R5QzhJdExBcGlvc0hWenAxYjNRYjBhbGhHN3VDM0l3OHRmV01T?=
 =?utf-8?B?ZjdDc3djNWd1TDBsZjBXZmZ3WWVZOEhBU3grMHV4OXoyTk5LazVPY1RKdjhn?=
 =?utf-8?B?OXRWNmZGQ28zcXdtKzEweXVwUGJLMDJDM2kzNUJTOG5yV0NrdHp6a3FsUFgv?=
 =?utf-8?B?Z01vWDNmRmk5TlhTTkh2elFWbWo5SUFEcWNxNkN0bmNPNE4xNmVDSVVpbVlm?=
 =?utf-8?B?K2lNeWVEMHV6amtYYjFVandpNU5zODQ0T0Vtc2VLUjJCT2ZFRHdmeFN2QmJS?=
 =?utf-8?B?YXVja1JiSmI5cGo1UGFBUU5NdE41RWptTVljS2xLRDhKSWtWczQ3NG9SMnQz?=
 =?utf-8?B?VldpRmtBVHdOTEJpckZWUVJuV3diajFBN3Fjb0thUk1raXNrdm5tb2dlVU1v?=
 =?utf-8?B?Wjh4VENPaTZiQmt0WDB4ZlpaRXc5QWJFdDVPTXlnU0dzTTNYUWV5SjR5aUdN?=
 =?utf-8?B?SjRsN0ZCOExJRWhEOEIwcHVSbzJIMW5kRmpYTkx2aGxBWHlUeENmeFpndUp3?=
 =?utf-8?B?WGw1dk13WHpZaXFQZDgzQVZ4OENQL0NlaHNyTGkzaWx4dk9Fc2lJSWxpT0l6?=
 =?utf-8?B?UkFpNHovanEvWkFJWERmenJHT2IycG9ybmJFQWpRcll6ZE01bzhWTklWZE5H?=
 =?utf-8?B?MEVPRkpUTUwzTWlsVzJTQUJUUTZnUHhmaGU5aVdtVHYrbEVPSzJVbEJDTG1a?=
 =?utf-8?B?QzlqaER4aENtZjNIVWVjSHQvZ21TdWJId1h4T0Z4Z3R3Tk1MR096bjc3c0s4?=
 =?utf-8?B?Sm1HR0lobnE0c2p5YStyYWNNbGxJNmhvYi9PU3V5VUd6TGZDUFVYM2VsOHNL?=
 =?utf-8?B?ZTBQM3lxbTNmclRYTGJsUkpsd3c2am5UYXRzZnNqZGFkQnNzcGVxdDFYamJw?=
 =?utf-8?B?cFZhYUNkUGVVenlJSTFqV2JwUWNZUVJZR2dHUEVDWkoxWHJkaG52UUFjVTU4?=
 =?utf-8?B?UDFUUnRrdlN0L3Y1YlY2RlFNNjVDbXE1SisyQWRPTHExV0ZWcjFVbDdsaHl6?=
 =?utf-8?B?T1lIeVE2eXkwbEc3UFk5TytwOXdaZFhPdW0ySXhkMEhPbVc4NHZ5dHRRaEZX?=
 =?utf-8?B?b3ZJZExqMVB4TmN1eDFXUFJDMVNMZmhoa1NJOThEM05ZR3BDd3k5bDlXZzV5?=
 =?utf-8?B?ekJGekxiTkRBRG5NN1ZQaTZ4OWpOalEwSmw5LzYzU25yeHIybTN3TTc4VVRT?=
 =?utf-8?B?dWJmbTgvU1JmTkVJc3N3MklsTTRPWHZJN3dET2cwWGRzMVA2NitDMjZTQThJ?=
 =?utf-8?Q?letudo9F8Iz+m46syLklylewv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcb94d7-9df0-4de8-ce66-08dade753674
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 08:20:23.4854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIVA6SKXE7iAfj71yoDMNCgVegp+syCyJvjlgZ1Frricalihv3D1k5ZDhilqjensLs26OD+duw2UCyCWeZZpCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8163

core_set_legacy_ssbd() counts the number of times SSBD is being enabled
via LS_CFG on a core. This assumes that calls there only occur if the
state actually changes. While svm_ctxt_switch_{to,from}() conform to
this, guest_wrmsr() doesn't: It also calls the function when the bit
doesn't actually change. Make core_set_legacy_ssbd() track per-thread
enabled state by converting the "count" field to a bitmap, thus allowing
to skip redundant enable/disable requests, constraining
amd_setup_legacy_ssbd() accordingly.

Fixes: b2030e6730a2 ("amd/virt_ssbd: set SSBD at vCPU context switch")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This wants properly testing on affected hardware. From Andrew's
description it's also not clear whether this really is addressing that
problem, or yet another one in this same area.
---
v2: Change core_set_legacy_ssbd() itself rather than the problematic
    caller.

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -744,7 +744,7 @@ void amd_init_ssbd(const struct cpuinfo_
 
 static struct ssbd_ls_cfg {
     spinlock_t lock;
-    unsigned int count;
+    unsigned long enabled;
 } __cacheline_aligned *ssbd_ls_cfg;
 static unsigned int __ro_after_init ssbd_max_cores;
 #define AMD_FAM17H_MAX_SOCKETS 2
@@ -757,6 +757,11 @@ bool __init amd_setup_legacy_ssbd(void)
 	    boot_cpu_data.x86_num_siblings <= 1 || opt_ssbd)
 		return true;
 
+	if (boot_cpu_data.x86_num_siblings > BITS_PER_LONG ||
+	    (boot_cpu_data.x86_num_siblings &
+	     (boot_cpu_data.x86_num_siblings - 1)))
+		return false;
+
 	/*
 	 * One could be forgiven for thinking that c->x86_max_cores is the
 	 * correct value to use here.
@@ -800,10 +805,12 @@ static void core_set_legacy_ssbd(bool en
 	                      c->cpu_core_id];
 
 	spin_lock_irqsave(&status->lock, flags);
-	status->count += enable ? 1 : -1;
-	ASSERT(status->count <= c->x86_num_siblings);
-	if (enable ? status->count == 1 : !status->count)
+	if (!enable)
+		__clear_bit(c->apicid & (c->x86_num_siblings - 1), &status->enabled);
+	if (!status->enabled)
 		BUG_ON(!set_legacy_ssbd(c, enable));
+	if (enable)
+		__set_bit(c->apicid & (c->x86_num_siblings - 1), &status->enabled);
 	spin_unlock_irqrestore(&status->lock, flags);
 }
 

