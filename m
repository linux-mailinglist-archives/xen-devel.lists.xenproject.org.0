Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FE64026E3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 12:11:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180771.327580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY4I-0006EL-Q4; Tue, 07 Sep 2021 10:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180771.327580; Tue, 07 Sep 2021 10:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY4I-0006CU-Mv; Tue, 07 Sep 2021 10:11:06 +0000
Received: by outflank-mailman (input) for mailman id 180771;
 Tue, 07 Sep 2021 10:11:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNY4H-0006CF-4x
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 10:11:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23d633f6-5023-4ef5-bcfe-4b00c1f66bfe;
 Tue, 07 Sep 2021 10:11:04 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-5mPymMrOOya9GGoIeBAUAg-1; Tue, 07 Sep 2021 12:11:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 10:10:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 10:10:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0138.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 10:10:59 +0000
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
X-Inumbo-ID: 23d633f6-5023-4ef5-bcfe-4b00c1f66bfe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631009463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q6KEqQas+q/MIa0vYj9SJ6GpdI6JFmUKlBBr4SWA71o=;
	b=jaDsxA+kuuK1t5rROA2Q70Us8jenURt3WdCuUsBTHSIJFb5Q8Ee66w2oVvHXuG92ipdet5
	ALPMWr3as8dL4IoA2uCAlHvAqfyfR1tCyMqJSICdv609QO0eFFNArEevHJPck4oqeEANwe
	lcsvFYsqQ5IopjqCY8KW7CKRBzh13cg=
X-MC-Unique: 5mPymMrOOya9GGoIeBAUAg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPRdsThc5Qow2i5RZl4qOO4M71ZtFK4yWRRzW+MlM9bDjsJ5KczruIAcS5Bd9d3hF93I7wIr1xeRDmHUwNFkYQBKML7CGCSdyMUMG5M3Z902VbQy3POgqT8iFbTtVBCCR9EmvHkwkM5R+jmg+M4QrVK4I8GbS+sFrw5pYPiYvCvP83jqw9wYT8XXaB6LBW7x1+ahl+2bLBrg06/M/ne6J3zoEQTTN4b1Bk4zG/kNdIH1XqECazIcnwHoaPyvX9NLI30pIt/0HqHm8QUKuAbCljTN62T83hkSwiIXoZha2fwiTB+inLVydbK8c3M6JoD6n5ZAcPql1YqwbvoeSFa9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Q6KEqQas+q/MIa0vYj9SJ6GpdI6JFmUKlBBr4SWA71o=;
 b=b7ryPUFJJDQTcdvn6o7WTcjmQtJz1NSR/wjHbiGhEnpnmgWKY2mWx6gD/EM2xH9tgLQpZVlpAhgUQPP+x2N+KW9r/MBD0UyMg0YD7KBNHIG2AT6cOyiNIKz6khIzV8uPYvL6TJc9OTzEPTVLJU+F4QCB9zXK5UiNZ90EVEu04I1mmSx+egtABP3bsqKu3X6H+ZKh9yLveeuie/LCAsrbUKb5gtVNCoJPFcUzZOkbUOaWv2Alqaujr+F+sbapBZ9DqZP5KrXOEWmF8Qh2/EcZPNr2uYF35rgi+EPN9uBcnlQhitgAjCgU8zBNNhLiwVMOHq88mN9tp38DM9q23Tv8aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 6/9] xen/x86: generalize preferred console model from PV to
 PVH Dom0
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Message-ID: <0b7afef6-1c46-ed74-ca83-f1e29f763f4a@suse.com>
Date: Tue, 7 Sep 2021 12:10:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0138.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72b07e47-2f27-44bf-f601-08d971e7ca3a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24470E5CD42110F66B031A1AB3D39@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C8aD99HGtdAYtLQp4+lfDc7M7B/T49DmW5VZ8Cd88iSkflaJxmNmXU/3R4dXHQwD7mIp/74b3dzv79QkyjzNL5ragb4RGJgn6aiWLmfbL2iw5hYiPhZJtbs1+Jk1QtZ7bWuBDllXU+uFo7ySGbimuVGS1XpcIxv6a2BB2I/OGElmwA/6Uu+J97Mt9jIMEzYjx1c8TMSNOeS5sPIlNir7QIG+L5y6k/fUcBaKPFeZJ6Y4KRiWcyUQIIvYyUkrg780gV/Z1XpqWmfoHUCTyIvHqbM8bIofTf8Um/RvvGrxlE3PFDXhp1eUstwXhS+YageytzDfDLfXtBvuVFdJcJCt9wez/e/aMPfTE1UInnhel5JOtf/1J8aQgmvzMMI5BEkKR1r2axdLEW4iQIvlo1SeRN6+kdJfjH21CV6kpBl2jwWR4ekZLu0PSSdt1ZvZr56CyMYe/DW9p4NYWp/y38cNwGrybI5GQssATqEolCWX1Ip4HEL1aN+khtgvSxM5SJFKxlaSDXugLqzxiamVIhvaGdgYFPWtqSLHLDKXhg30CYwtf868EgYHKmAbnQv97knLyWjcC6akuYDpkRleDMLE8k6FOf4hL6CdJ6+2bCZbxUblQ0Uv9sYkgNYDMZV4o/TraJGP9/wMCMY/WQQDqFCHRMPFQXI6IpujCXPCSqqOkQEc/sZ+XrJ7/svKUbOwCqpLipxkCmjVr6r0rG0rf+sh0kGFR+vlfVmhixl1z4dpFDQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(136003)(396003)(39860400002)(26005)(31686004)(5660300002)(186003)(2616005)(2906002)(31696002)(83380400001)(54906003)(956004)(4326008)(8676002)(86362001)(316002)(38100700002)(110136005)(6486002)(16576012)(478600001)(66476007)(66556008)(8936002)(66946007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emgxVUg0RWtEaE8zWWJ5NlBCdFhQVGRndlBGc1g1VHh4Q0laMllBQ2gxRnJ3?=
 =?utf-8?B?ZCsxK3d5SXZhQ2htWGVHbnJyRjZDQWl2NlRKcUsrMW9vTjlneno2Y2xOV204?=
 =?utf-8?B?dnF2M3JuZGRtSWcweXBmYTFhR0V4cHc5M2xRQThrTG9oMjc1d1Z3Nm8wczdD?=
 =?utf-8?B?dXNqSXNTNEp3YXJoMWt5M1VXa3JDd05ZNEtHREpheTlMZGhVT1ZpekhHakc2?=
 =?utf-8?B?MUltQWExUEtMSWg5TTJrdVVsdGFXU0FpL1lOYk9ZVXZWWjZQaTF0bjE4Ly8r?=
 =?utf-8?B?end4Y1lia2wzOEQrUUdQYnM0SHdEbktLWkZSV05QMWc0TGJ1NnpHZEhRbll0?=
 =?utf-8?B?Y3VwYmlUcEhWc1hPSDVJQkhvQzJqZzNjckZWMjNrNjM3emRYRWFmcjMzbitq?=
 =?utf-8?B?QTF3eWxOMDFqc2k1QTh4NjV1NlgzWW9jT2tpSkZpbjZldUs1dkUrbTVuRmNq?=
 =?utf-8?B?Q2V5U3U2aDBxNUVNVFdydWtRVm9RUHc2UHIvSEVHSUY4THNhNlVBZ3hYWHZN?=
 =?utf-8?B?RUFxNks5SnF5eWw0RmtYOFMxTkluZjFXTE5COWJMZFB3MFViRTJqVHQ0dmdy?=
 =?utf-8?B?NnRLY3d5c3dmRUg5UWV3bWRZcGlSdDMwb3lReHZoWFF4Smk5L1ROUnkxT0Qz?=
 =?utf-8?B?WVpRajRtaDM2UXBZQmdHTktFcXh3TDFaUW4rWCtoK3NGR0RYYndZWFovQ2hS?=
 =?utf-8?B?bWZ0c3M1ZnZjcDE0dHR1emUvRG1pRWlVZnp4SGdQRDZRM1hzR2xBOEQ5S3Y4?=
 =?utf-8?B?ME9TeElvK1UrU002QVQ1YTVuM21OOEtDMzBoTFdacS9jQUhEbkhaSHZrN3hY?=
 =?utf-8?B?c2Y5bXBuYU55VEprWWV2Q2ZlWjlvQWp5Tm9XMDlWdFF3VjhQKy8zRzBPbnhN?=
 =?utf-8?B?ZUV5enhlWlEycGV1cy9TU0dEbTBRTE55OHQrS3NyQ2hPbjRJYlJOQzN0bW1H?=
 =?utf-8?B?VE9YL2doYVZPYjVaYlhYc1VLN1hxdGRrclZoL0RZcThKL3JtK0xMdHczcStY?=
 =?utf-8?B?R2p1TnR3VmpxeUVzaFhTcEpJYkZYTW9EMnpIUWU1Tkt4ZFlwZ2lBRStxeDRr?=
 =?utf-8?B?bWFLdUFvVzFFOW11dHdMakQ1QWZLWDRGd2loQmdCbGZCQXFuMlE0eXJJcmFF?=
 =?utf-8?B?SVlCWElQakRpWXRmMXdzdFlPV3REZlhUQzcyMFlLY2VHNC9vWGxYVi92YUQr?=
 =?utf-8?B?NnF0Q2o3QlVid01OYXFEazRpMlArQzJzb21ON1F2UlVUNUZLZWJ4b2Z6LzV0?=
 =?utf-8?B?UkZ5NjMzUlh2L25iejVDdXRDbUtvNkU0NHRYalRUVG05VERsa0NLNHQ5YVBP?=
 =?utf-8?B?WEFCTUVnNFVhVCtZN1pDbTVKSmVwaXFFaVJPcjZ6VVhaWlhBbExvczNQZ1Ns?=
 =?utf-8?B?MWw0a1VFRVZyMTBadlE1bUxzakdJdUY5aWg3WC92emFqM3g5eEw2OUc5ckJ1?=
 =?utf-8?B?SFp1eHpyVWpLTzZFcEVlZ24vdGJQa0JWQW1wRDIvOTVhMzQzNEd0MkkxMkNI?=
 =?utf-8?B?NE81UGtrWkpSVkNQSVJRTlJWeWR6VThqK2ppWFpIVUgyVmJBQW8wZnZEREFV?=
 =?utf-8?B?NVpoK2s3NTlMS25VdWc2MzNUa215bFA5QnJJYXZ1c3NrUVdMTXR2WDJRT09T?=
 =?utf-8?B?UThlYmhaSWhiNkFtZHRBYXRXbTdjcmdSd1RuNytMZE9CaE15Nk5lbjZvb1o5?=
 =?utf-8?B?YmtqOTdDRDQ1Q0tmVzFFQkl3WUFEOEo0bm5aNmFEODhQTEY3dVQrUHFCVUIz?=
 =?utf-8?Q?NXZn1M9Ok0eRAwdR85VGn2MYRU7N4ZWoznLKxK4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b07e47-2f27-44bf-f601-08d971e7ca3a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 10:10:59.5000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzzuSfosyxO1v6cFLml8rZJvZXedtnyd/D0ny8EzQ1y2oUw78132/aj9kLoXedE8XVjo5YwQKiV0h8dr2NoXRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

Without announcing hvc0 as preferred it won't get used as long as tty0
gets registered earlier. This is particularly problematic with there not
being any screen output for PVH Dom0 when the screen is in graphics
mode, as the necessary information doesn't get conveyed yet from the
hypervisor.

Follow PV's model, but be conservative and do this for Dom0 only for
now.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Prior to 418492ba40b2 ("x86/virt/xen: Use guest_late_init to detect Xen
PVH guest") x86_init.oem.arch_setup was already used by PVH, so I assume
the use of this hook is acceptable here.

Seeing that change, I wonder in how far setting xen_pvh to true only in
xen_hvm_guest_late_init() can really work: This hook, as its name says,
gets called pretty late; any decision taken earlier might have been
wrong. One such wrong decision is what gets added here - preferred
consoles won't be registered when taking that path. While adding a 2nd
call there might work, aiui they would better be registered prior to
parse_early_param(), i.e. before "earlyprintk=" gets evaluated.

I also consider tying "detecting" PVH mode to the no-VGA and no-CMOS-RTC
FADT flags as problematic looking forward: There may conceivably be
"legacy free" HVM guests down the road, yet they shouldn't be mistaken
for being PVH. Most of the XEN_X86_EMU_* controlled functionality would
seem unsuitable for the same reason; presence/absence of
XENFEAT_hvm_pirqs (tied to XEN_X86_EMU_USE_PIRQ) might be sufficiently
reliable an indicator. Question there is whether the separation
introduced by Xen commit b96b50004804 ("x86: remove XENFEAT_hvm_pirqs
for PVHv2 guests") came early enough in the process of enabling PVHv2.
Plus I'm not sure a HVM guest without pass-through enabled couldn't be
run with this off (i.e. by relaxing emulation_flags_ok() and having the
tool stack not request this emulation in such cases).

I think the approach here might be equally applicable for DomU, albeit
potentially pointless (i.e. dropping the conditional might make sense
even if simply benign there): A PVH DomU ought to never come with a VGA
console. Yet even then a dummy one may still get registered and would
take precedence over hvc?

--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -3,6 +3,7 @@
 #ifdef CONFIG_XEN_BALLOON_MEMORY_HOTPLUG
 #include <linux/memblock.h>
 #endif
+#include <linux/console.h>
 #include <linux/cpu.h>
 #include <linux/kexec.h>
 #include <linux/slab.h>
@@ -18,6 +19,7 @@
 #include <asm/xen/hypervisor.h>
 #include <asm/cpu.h>
 #include <asm/e820/api.h> 
+#include <asm/setup.h>
 
 #include "xen-ops.h"
 #include "smp.h"
@@ -274,6 +276,16 @@ bool xen_running_on_version_or_later(uns
 	return false;
 }
 
+void __init xen_add_preferred_consoles(void)
+{
+	add_preferred_console("xenboot", 0, NULL);
+	if (!boot_params.screen_info.orig_video_isVGA)
+		add_preferred_console("tty", 0, NULL);
+	add_preferred_console("hvc", 0, NULL);
+	if (boot_params.screen_info.orig_video_isVGA)
+		add_preferred_console("tty", 0, NULL);
+}
+
 void xen_reboot(int reason)
 {
 	struct sched_shutdown r = { .reason = reason };
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -28,7 +28,6 @@
 #include <linux/mm.h>
 #include <linux/page-flags.h>
 #include <linux/highmem.h>
-#include <linux/console.h>
 #include <linux/pci.h>
 #include <linux/gfp.h>
 #include <linux/edd.h>
@@ -1382,12 +1381,7 @@ asmlinkage __visible void __init xen_sta
 #endif
 	}
 
-	add_preferred_console("xenboot", 0, NULL);
-	if (!boot_params.screen_info.orig_video_isVGA)
-		add_preferred_console("tty", 0, NULL);
-	add_preferred_console("hvc", 0, NULL);
-	if (boot_params.screen_info.orig_video_isVGA)
-		add_preferred_console("tty", 0, NULL);
+	xen_add_preferred_consoles();
 
 #ifdef CONFIG_PCI
 	/* PCI BIOS service won't work from a PV guest. */
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -36,6 +36,9 @@ void __init xen_pvh_init(struct boot_par
 	pfn = __pa(hypercall_page);
 	wrmsr_safe(msr, (u32)pfn, (u32)(pfn >> 32));
 
+	if (xen_initial_domain())
+		x86_init.oem.arch_setup = xen_add_preferred_consoles;
+
 	xen_efi_init(boot_params);
 }
 
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -118,6 +118,8 @@ static inline void __init xen_init_vga(c
 }
 #endif
 
+void xen_add_preferred_consoles(void);
+
 void __init xen_init_apic(void);
 
 #ifdef CONFIG_XEN_EFI


