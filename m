Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4DD34FE20
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:36:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103831.198034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCZ-0004eH-AA; Wed, 31 Mar 2021 10:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103831.198034; Wed, 31 Mar 2021 10:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCZ-0004dp-5g; Wed, 31 Mar 2021 10:35:55 +0000
Received: by outflank-mailman (input) for mailman id 103831;
 Wed, 31 Mar 2021 10:35:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRYCX-0004Zp-DH
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 10:35:53 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6b4c8f5-1a2a-4f3e-a398-b4d6f00ac697;
 Wed, 31 Mar 2021 10:35:51 +0000 (UTC)
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
X-Inumbo-ID: d6b4c8f5-1a2a-4f3e-a398-b4d6f00ac697
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617186951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=NV3KE9n/uXtSsphUpkD9HAmF5sKVQHJPIYSdLPj7tUc=;
  b=HiT10VfVApaBoPDjbJgswzgS4ajtN0BqccUSp+TcKjx84K3/aOrzKnfk
   +RrHOTvP/Udj9uxe9zQJIwyHMBfxVE+8KAuH4Jawisv29hycznS4d8RrS
   mKDZRWLOQMAJSRRjSzEVImKUfNDzGyiQdW43/F/sJ67bKvPeHeeUdRuLO
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: E0fE6gZR48Kl3l+ZKlFokDeQ/Dhy6Y6ECTvVb+aIMVahthzYLj57uzzfAod+RjFdelFVAjz4cY
 uRY3GxG4Y5+DHPG0JWIl3HFagWS6Eo34HPM3daCQdKcjjq6OR6MPOSLVuEx2xx/XMRwU6P1VLl
 o2h/vM7EkILwbXgFEeqWD6RlZ965cZgOGoW6Uda5O3aYkNKKP3+jALSfyvIOdXvNNL94TO/SNX
 n+dyzV3tgKAl4HgWwWhj7xQyzjRoTxenXx5EqujU0jcE25Uby3CvqyW2r0+vAK6k77DW15ZMCK
 m0E=
X-SBRS: 5.2
X-MesageID: 40415650
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:x0km/66VqbDf3ZJ5BAPXwRKBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3Xa6JJz/M0tLa6vNTOW3VeAAaNDyc/ZwzPmEzDj7eI178
 1dWoV3FdGYNzdHpOng5g3QKbgd6f2m1IztuuvE1XdqSmhRGsNdxiN0EBySHEEzZCQuP/oEPa
 GR7MZGuDasEE5/BqiGL0IIQvTZoJnznI/mCCRsOzcc9AKMgTm0gYSKcCSw4xF2aVJy6IZny0
 fpuUjT5qKvs/a0oyWsrVP73tBtt/bKjvdGDMyIoMAJJjvrkRbAXvUdZ5Sy+AobjcvqxFE2kM
 TdgxpIBbUO11rhOlubjDGo+w783C0g43XvoGXo/kfLkIjCax8RT+9i7LgpFifx2g4bk/xXlJ
 9v5Sa/saFaCBvR9R6Nn+TgZlVRuWef5UY5nfV7tQ05baIuLIV/gKY4501vHJIJDEvBmfsaOd
 grNs3a6fpMGGnqCUzxjy1qyNyoaHw5Ag2LdEgEotCUyDhbhhlCvjIl+PA=
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40415650"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blXoAwoYh/Az5AzBRXyKenEOFnoKKEVMUzSYfdj9vmdLFoPYoH6Qv932DqgB01I7nOripYKYVZKk2rQPkjDmxiYwBF8otMvFEaSK6F9IFwxmdxtk1w9f/Scte4LYIdP+bo+4PKB6ZM8jtmivABJJpyNTsC7Z44N1t8/mz1LA2SCYT5Omsa3mxBtdjS6nXHUxYI+X4O64oRNjMGXWVDDENMKfuwWKne5XV97Welc3XYGw2pg7tNVckttQKbeKy2O246AbqCQeaL28+IHLhEWgatsjvXQie+PSoPaEJvdLaYkZQGrkaFsFpyuFWBdfRqHFTD1ayP0qXC+PYaOymRd63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFsVREZZe9qZvUSg1UZfGO+DXUpYL2DZXPRk+PVsbKI=;
 b=VWCTeBrqvsgaaTFFTIn/mo0cJOOmrPBrGYm+6WHOUE+YckzKwdtzPVRYG0/aaAgf7XKQJzrcbj2kFrbyK9FEMoccjwxmCrHLt/hjtypOuLJwqhy/4sEJUegGIAlI2SB1slXgkaYrR1Cz5igLVHHbiWJMWNJ62zNrkbdOv3m3e5cKANFB3s8MxHFLSCQj8ayObIjGZF9Sk5YaEb2puOb8/dxv8wC24b9QAbWi/32Zsvdk1ds04A7aJts3DJwcILPCDU+4yfQDwYk2d9OMvYR9w7AqwjZBlMtPEDZfzfNqphMeaJKewwGzqTvfV0fQkyLlleJ4wmJNuMW87H6UT5yS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFsVREZZe9qZvUSg1UZfGO+DXUpYL2DZXPRk+PVsbKI=;
 b=rb/qDlgeB1JlyyPf+W07TzbWKlf/LU4mPPfafr41+f1XhBYiRL2O0STpJW4WfEZWGpq4MrQMAiPDXx6RkXOM/QjrBGQEUILSNzXSHTVvzdrs2ipg5Xz6ait9Uw1ycyexw20tKgJdDgXmjDYmXiT8/EfvzgQIBmBr/PZ6cBdVd5M=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: [PATCH v3 02/11] x86/hvm: drop domain parameter from vioapic/vpic EOI callbacks
Date: Wed, 31 Mar 2021 12:32:54 +0200
Message-ID: <20210331103303.79705-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210331103303.79705-1-roger.pau@citrix.com>
References: <20210331103303.79705-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0050.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2aa7e7b-5f5e-4d8e-407f-08d8f430bea5
X-MS-TrafficTypeDiagnostic: DM5PR03MB2777:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2777FB09BF3DC4057C7547D98F7C9@DM5PR03MB2777.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JzeYeKuF1xe5SUZvnjAKCGfLVRy/4rtcuqjVdtk0HZrXqxzfOS9C+LSJr3x/9ZSt9NhkZGMOfEv40Fgh9PeAbEilqJGbh0lp8Qmwj57SM/9ngs3j0AWSQQAXO8BB+HzDyP5CtcqPB7cmAf/1rspWAdMHjHoPZtTb4556JzpEzaDwHCefmecXcdERhuByVfcDRe5Ons1VfQmHMQ2rrmkBJMyQMkLGBfgZsGDm6LtXxkeG6+10Id1OJMCjTx7LHv+vC+CVc6Ds4mrndrE5Dce6NzhSMlavzyeaoLB+fxszV66nS5uEmxrZH9AfsSk6akXdF+R4G2X7YOtqywUpntYwytNmDcWK2O/wlqqotkGBKAkeS/uPKKuZ2Z+P14tDSLEOhGFij2xo9fFH/oMbV96ZMyAto7fhg4RLfmOojPAWQkxJzej1oUWWO+TwFSn8hyAluRBhs+8fT6L80jfvsQoeJa+OOe75e7xwNdyixefM847Uw8Wd1ALUS8H8hZwYNg0uD831Y0aLQkesgKlxhxoEoPDUuHtOlCBMTD9JYhnyQoNn3lFHjfkQp1nqsQ53XUjs0ldsJrmiKIvXux8LrWvwd7A6XZRVZ0PhMM8RcJ+6PPVjGasGV4cBZgHoffhsfMHb2PyBlzeF4MSQj9/aUFO+0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(5660300002)(186003)(66476007)(16526019)(26005)(6486002)(8676002)(36756003)(86362001)(83380400001)(38100700001)(8936002)(956004)(54906003)(1076003)(6916009)(2906002)(4326008)(316002)(2616005)(66946007)(6666004)(66556008)(478600001)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dWx5NWxqRy9HYTdQeU5vdlhTTXhlemZrQ0dUbmh5ZEIzTG9yaTBDYmIxSklp?=
 =?utf-8?B?anZudTJnbzNRam9lTERHMTdLbnMxWHBOejhLRE5TMkdvbWpldVlHYmRNUDRN?=
 =?utf-8?B?Vm45Zi9MYnBNQ0N1ZkcrMDB1TVd1VzNJeFZKTDlZMjZTWkJ6ZXFUTzFXK085?=
 =?utf-8?B?YU1oSlY4RkRtYkNyaE1vY0pXam5BWXNUakZVZUlmNDJpbGxDZDlmK0lFWm9l?=
 =?utf-8?B?ckI4cUtrWitaMU1RSVdJT0hVcjFUanBveEZUOG1yQzFoMTVDTElTdkhhY3ps?=
 =?utf-8?B?N0ZzU3VuQlJ3b0lYd2I5elI1L3Mvb1VHTTNKQnpCeUYwYkxDZnZRSzc2ZDkr?=
 =?utf-8?B?QjNTSTJJamZQMC9Zc2FtbytTMSsyREsrSXozTVhXSXg5Mjl4NUZaaGV2OCtq?=
 =?utf-8?B?M1NyZDNnbVIwb1NJQy9aN2lYU3hDcWJDMGhUOFFPNnBiK0FvbHJEdW1hZzRt?=
 =?utf-8?B?USs3S1BDNUFEMXMvM2Z5dFdMNHhEOTFMK1AyRmdiWEpOWkR6eDRTeGFIWXFS?=
 =?utf-8?B?c3RQMk1VVGdqbWR1U2xCVnc5TDNXOFYvNUhOeVh6ZmZmZnczYnNsZlhRT0g5?=
 =?utf-8?B?NzhGOFBLNkM1bExubGR6cmx4b0ZyUDI3S0NQZHF3a3BwWVZZSEhCaitBeXVr?=
 =?utf-8?B?SThVSC9OWmsvSm1RMy9BcWd5REFSUnJaeGxjdG0zQXQ4YmYwa1B4cHB4bUJq?=
 =?utf-8?B?SmhpOGJQTy93aWkrcVJYY2padUZNL2ozQkQrL0lsTVlYNGNScHRYd1ZzVTVM?=
 =?utf-8?B?RUEwWlN1bjR2WnpSVGNZUktxcWhaRGpvMmFIT3JsUU9JdjBUOXB2Ky9oa1d2?=
 =?utf-8?B?VTNRUWZFWEVFME16NzJHYi83MHhHbjB6UTdFL2dQbFRLY3pwMGlOSVloeVJp?=
 =?utf-8?B?ZGdDNWFjc3RjMm1PTllGVkJFMkE5UWlORUcxaFMzVmhPY2NZSHFrTkFXMUtp?=
 =?utf-8?B?czRvVlR5WExrNEY4SFIyU282dGxjVTRYeEsxcUdmUkVnZk9uNHgvMCsycGY1?=
 =?utf-8?B?cmY0dVVBdS84aFYvZGJEcXhuT0JLam5rQld3ZU9tajM3cWUrbFVpMUxxa0hC?=
 =?utf-8?B?OStxVHMvZGUreStzSDBzMjFFcDB1YTUvejRlTjdBTVpReUxzZ25nMURsZGJw?=
 =?utf-8?B?Z3R5aGNObEd5SlBtOHlMc2J2bCtITFkyZi9XS0ZTZmhUaXQ4M3M5cjZyTVNF?=
 =?utf-8?B?SjV2RUZSb3JjTkJ1RFFGWC9aYzNLSFI4WE1LTkY0L01tWi9samc1ZXNCTUNt?=
 =?utf-8?B?eG4yS2ljczVHLzZyTjBsNmwyOHcvUUk5VkMxUDFYZjVjY2xWdE13dHprVTAz?=
 =?utf-8?B?VVF3UWZqOGF1aVJoZmFoajdZNWUvK2kzbjNMdmg1SHBxcWwvSzM4VldSREVT?=
 =?utf-8?B?czFQMHJXUHk4YkQ1ek1HMFhKRXVyMFJXYXBOTnVjRXNmMjYrSUFaamNYbS9U?=
 =?utf-8?B?eFJzS3VQb3VTWHUrM3JjYWpwMkhGMm5hRHMwR3dDWTVXWlBERWxkc2drTkJ2?=
 =?utf-8?B?MStaVHZ1UjdIY3AxVVp4ZzZnN201bnJ2QlQwTWlmaDhZMlZNcnQ4OXY0MDVY?=
 =?utf-8?B?c1ZXcU1ISmhCMVN3Zy9QZ2FwMWRBWUJkQ1pPVzFIdFZVVmQyN2NHWk8vRHd6?=
 =?utf-8?B?TnRDZ2RFempzVC8zUDNNTFprcS9kVyt2SU14UTRGamJLeHFHZm8rSXFDYkVK?=
 =?utf-8?B?THJWWmg0bkxJNTNqZmtKRGh2ZkxvS1dyMFc2bXhZQmF4bGVrdE1NRzhkTXJR?=
 =?utf-8?Q?NJGxKa+RgdwieJXEQrEBhpTgEMXaPHcGS1o3IHO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2aa7e7b-5f5e-4d8e-407f-08d8f430bea5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 10:35:46.9015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nb25nqCrGbm9AFGTWtwpohMLth2F2FDioSTNaJq9OP/+XmmSmjP9KMDigNXvgYtuYXhUBqv2iRp3u0BhabsL/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2777
X-OriginatorOrg: citrix.com

EOIs are always executed in guest vCPU context, so there's no reason to
pass a domain parameter around as can be fetched from current->domain.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/vioapic.c        | 4 ++--
 xen/arch/x86/hvm/vpic.c           | 6 ++----
 xen/drivers/passthrough/x86/hvm.c | 3 ++-
 xen/include/asm-x86/hvm/io.h      | 2 +-
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 91e5f892787..dcc2de76489 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -284,7 +284,7 @@ static void vioapic_write_redirent(
              */
             ASSERT(prev_level);
             ASSERT(!top_word);
-            hvm_dpci_eoi(d, gsi);
+            hvm_dpci_eoi(gsi);
     }
 
     if ( is_hardware_domain(d) && unmasked )
@@ -541,7 +541,7 @@ void vioapic_update_EOI(unsigned int vector)
             if ( is_iommu_enabled(d) )
             {
                 spin_unlock(&d->arch.hvm.irq_lock);
-                hvm_dpci_eoi(d, vioapic->base_gsi + pin);
+                hvm_dpci_eoi(vioapic->base_gsi + pin);
                 spin_lock(&d->arch.hvm.irq_lock);
             }
 
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index f465b7f9979..a69aecad912 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -235,8 +235,7 @@ static void vpic_ioport_write(
                 unsigned int pin = __scanbit(pending, 8);
 
                 ASSERT(pin < 8);
-                hvm_dpci_eoi(current->domain,
-                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
+                hvm_dpci_eoi(hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 __clear_bit(pin, &pending);
             }
             return;
@@ -285,8 +284,7 @@ static void vpic_ioport_write(
                 /* Release lock and EOI the physical interrupt (if any). */
                 vpic_update_int_output(vpic);
                 vpic_unlock(vpic);
-                hvm_dpci_eoi(current->domain,
-                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
+                hvm_dpci_eoi(hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 return; /* bail immediately */
             case 6: /* Set Priority                */
                 vpic->priority_add = (val + 1) & 7;
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 2f6c81b1e2c..a9256e7ef51 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -911,8 +911,9 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
     hvm_pirq_eoi(pirq);
 }
 
-void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi)
+void hvm_dpci_eoi(unsigned int guest_gsi)
 {
+    struct domain *d = current->domain;
     const struct hvm_irq_dpci *hvm_irq_dpci;
     const struct hvm_girq_dpci_mapping *girq;
 
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 8b8392ec59e..4f294232fb7 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -101,7 +101,7 @@ bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
                                   struct npfec);
 bool handle_pio(uint16_t port, unsigned int size, int dir);
 void hvm_interrupt_post(struct vcpu *v, int vector, int type);
-void hvm_dpci_eoi(struct domain *d, unsigned int guest_irq);
+void hvm_dpci_eoi(unsigned int guest_irq);
 void msix_write_completion(struct vcpu *);
 
 #ifdef CONFIG_HVM
-- 
2.30.1


