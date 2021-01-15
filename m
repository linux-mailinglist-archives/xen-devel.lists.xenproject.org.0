Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D734F2F7E2A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:29:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68154.121954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q6C-0001BQ-Js; Fri, 15 Jan 2021 14:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68154.121954; Fri, 15 Jan 2021 14:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q6C-0001Ao-Fv; Fri, 15 Jan 2021 14:29:12 +0000
Received: by outflank-mailman (input) for mailman id 68154;
 Fri, 15 Jan 2021 14:29:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0Q6A-00017u-KX
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:29:10 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 851bdde1-2be3-41b1-9e9d-ed154ca23bfa;
 Fri, 15 Jan 2021 14:29:06 +0000 (UTC)
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
X-Inumbo-ID: 851bdde1-2be3-41b1-9e9d-ed154ca23bfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610720946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=VRe/VA0U80O1SvmCH9sR2wjYzHJJcm7SzGJsWfxIFb0=;
  b=HFJe6UuYcInl+Ay88GM8sEIkhhhPHq4givKb9zrJRaPSVG6HNxHNu5WZ
   NBJMPhuEIu5fRdt0NgABiGlso/aVDeVQ3pq5iTX+S6Mv7ErwOgRabeUaq
   LwP0z5ATPCvFIN87zq1Sasjhr+X0tJ/kk5QfJId7ag+fde0qJYDAv2cTx
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5hEWHygDBfgTQmbeNIYq3wHO7uxyFEwhybhCJM1/sqQl3tY442ir4I1XmXODTa7JcatzZ95nCR
 t5rfifUtDtGCTxFgnehvWspHxpjOMpFfnyokwXkKJqgzB2Mm7wFL5q/MHJNS+zeV5F9+lczFwD
 ZfZYGPelCqJDWA3gKSeKcfFDmcLHTxn+jlLhcM8M36kLg4ybuCU8qX5J0Jtf8YK5crtTdsWAUB
 DmApZoTb6btXiDV6AwSrw7oow3aMxTly0W6VJNAekIitfcxGXmfylTLgVw3RjtUsHTQDH6refu
 FJk=
X-SBRS: 5.2
X-MesageID: 35164647
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35164647"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPcOXW0qfL6K/d5shopyIJhcooUcBrczgEbENmywb86FvOgw/sk0ydN/VyKH6YbR+4xK1dFUNa/S4pNg6GC5XmlJgQlecvU/TmhGtY9gTY09S7s2UnvhHqopdmwA4A6PzJnZPOtX5k0f+1TZyVOPr1njFT43AIUVI267Ly5UMOFHN7o5mn7TpPak+2lU9RmLUQ9w1bbz0kj3ht9HNmoWBt7vrwQ1LF9k4AX2khKIFzeejMfSpR3KU8MoP6FRbjFbs+6VBGaMpE0kbGUkzl4iUY5GGIV2qX9767nnggk6ozcMBNdsccgrjOztbiIunLkwwYkuOaO4M1swcraYPW7KTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFvWd/zDJt973ue1xatUuG3pwJ3lvWSkD+oWWiLPwAQ=;
 b=k4mveOk/9K9Nznu3Xd3dMPRKSSCIP/HQp19H5Kp5yylO5jjqF+klSC69paRL1xsszOs37BkFwx+YF6uDqeWuEQssxtCYgrXc3mGkGaN6AekojmlBVGCmgdmyqmHrybHLu96+pSgC5UGjfi1E0r48I1sRc7mkEERGAq03FpFBeKeWlKcaRk3fW+m7s9NjsAxiGAj1nKkNrcVgv09jQsP1kdiZtyeuAuJpWCBJ9AbpD/W7LDrkRqr4ckOh9/aDVXkcLbIKwV5y1VxfrUQjITtJFb98d/TluZRonfUHjc+dDCLDG+EpneOAZIcKChrdUCmlyUoBl9PkPstWSBp8q14Jlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFvWd/zDJt973ue1xatUuG3pwJ3lvWSkD+oWWiLPwAQ=;
 b=q7ERQVKOwaa8XgY0QkQ2xC0U66QkswyyBheubJgWdeXoIbAQczB5w/jwkFoeRukmxcn+WhAhC1CaJl3hmxvFWjZ/Z3ng4pMZ/oQO/6+dlEu+TBeC/g8W1qhgrzXKPZepEq9rctsCYTPpwcsbEXjk4KWLVugQAsPfF8iODZABOBg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/4] x86/vioapic: issue EOI to dpci when switching pin to edge trigger mode
Date: Fri, 15 Jan 2021 15:28:18 +0100
Message-ID: <20210115142820.35224-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115142820.35224-1-roger.pau@citrix.com>
References: <20210115142820.35224-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6747a5f3-f25f-4563-b807-08d8b961e83b
X-MS-TrafficTypeDiagnostic: DM5PR03MB3147:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3147E3AE6197D28B1CAC50CC8FA70@DM5PR03MB3147.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IDrrtQSIo+qi7YZpljI//bOYj1ddrpAahFLMnw1V6Uf7AYw2VRtj+I7XOP2fQml5Sigs28T/pBDG5Q4qkNPaSABXp+FEllwUbTlgsGMlrdiEiQgE5wd5xUTaj6t+XXl/Want8WZFFK75ey65q+AKJ0t5XjKyGfJ7PLeBiIpDZw2vdQMDPi6ZDfTX/ljgo1LQmNGjrPeCUa0loYNBrofJtYa8dGM+1wqOBjqrjnE/G82lY7kSmGq2yh3YvjIZpJhiXAXShWZL/29O67720VTsAyoEzexBjmfYHD7iYyWwrpuPV6Xuzd1XwAQFpiYrUJVFDxhvQ2KxApuIs0xGx/WkX19/cQ9jFfdj6lb27J4nh5LksENiMLzcTNv7+hdUUSJ50709CeklHNM/u2Y7yPOdSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(6486002)(316002)(86362001)(83380400001)(4326008)(66946007)(6916009)(54906003)(1076003)(36756003)(6496006)(66476007)(66556008)(186003)(5660300002)(8936002)(2616005)(16526019)(478600001)(8676002)(956004)(2906002)(26005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFpMVWxoVVdDYktCWmlCSjkyWTZSQUI2bmRMTmdPQXVueTJlQ25ZZ1NROUlp?=
 =?utf-8?B?bFRteU9ZQVFrVnJJTHMvMEdkWW55ZHVpOENxOVZhc0pXbmNvUUZ2SDhxaFNs?=
 =?utf-8?B?QXFjWTFybXpvU1ZBVUpHQUdhS3hFV1JaUXVRaFNVWGMwVUNiSURENFBXbXIw?=
 =?utf-8?B?REpFN1dPZmpHWEp3b0ZHL21yc0dVNnFCQ1pRdm8ycnlOUGxQbEZySGxJdHBj?=
 =?utf-8?B?dnNjaXhyNEI4VW1xdk40T0Jqek5EMHl5ZjhyT3lGbEQ5TlRsb0tUTkhjSUdC?=
 =?utf-8?B?MWsrZlR1OHZaSVVTSkZzbTZsKzl2MzJvM28rdEM1RXFraWpMWm54Z09vNDhO?=
 =?utf-8?B?ZGtQWXRKc0U0aVBEZXVMRFhhMkgzaEtjbzJseU9HNVBhWmprNkFWV2tTNWg3?=
 =?utf-8?B?ZWxLSzZRVDJ0bXloTnR0N0pQVWc2R3JkOGFvZFhXVkxiSHlhSCtqeVEwQ09N?=
 =?utf-8?B?eFFVd2xMOTFSQ3VKZEhsd20vZDZ6KytHNmFueHRCRDlhazhHeGdKeEZkK0hN?=
 =?utf-8?B?YmJKTmVScXl6TEhBeURMZHF2VTE5YVQ5b0dCWk9uZElYTTdsWWxTMDBTU2xx?=
 =?utf-8?B?RE1UaXJiQzRpSEN6b1pOb1pVQkkrbDhUU21iNFZKQmg0NTJBV2pxVGxJZ2l6?=
 =?utf-8?B?UmRTcFRZOVhzSG5jSEVFL21peDdIbGJ2QlZCS0I4c3RZNjhvUHUvT0FFblRJ?=
 =?utf-8?B?Z2ZkSkdHbUNpWU5qVm1HOU5jVTVYQ3JPbU1LU25IRFlQY3ZBZm1NN29PcE0z?=
 =?utf-8?B?VDliaFkzVjJwakw5VDZoTlBjVW9mREpKSjVVY1FOdnhiTzVGYUNIazhJWFNT?=
 =?utf-8?B?bFd6d28yUXVPalF2WXdKZkJtVHJLaVVMdkxXRndiSzVGTEcwTkpaRHJINkFN?=
 =?utf-8?B?VXdMUEVzV0NpaDZLVEgvWEYwd0VTY1B4UG5XclJlQ3FlZUQyeDNLL1BmbHcv?=
 =?utf-8?B?a3E5RnZtaWtFelJkcExhcTBCTGkrSmp1d2ZwUlE2WWZFbW41UndobHZKdFIw?=
 =?utf-8?B?MXNuVDd3aGQxbFpObTVwSW4vOWh6WFRHNkFTcG5WcjR5QXJDcllSSVRtN0hP?=
 =?utf-8?B?b2Q1UmRMZW1tNVBtclV4eW5BZXRtNFNWUUVhb0h0VWZHcGtMMlRrbW96NFRT?=
 =?utf-8?B?OHArTURvR0xsOXNGRTdRREs5VFVRTUdFMlRIVnp6RGEzLzVpWW52T2pzOXky?=
 =?utf-8?B?Mnptang4ekRtM0dYVURQbWpyenA2Y3NZb1FnTnA2b0hNV0N3YlJzT09uOEVW?=
 =?utf-8?B?QlQxMzRaV1J3QlNXRXBQRnZPNldqanN4VFg4czBGMThQWWQwVHhZbENjSWh4?=
 =?utf-8?Q?FRCVRwSQmHxX6mfnJiHGxgGxjURnJEa1SF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6747a5f3-f25f-4563-b807-08d8b961e83b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 14:29:03.4040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxBO/wUCP374mae3Dge/e/+PEc8Ww5T0O5Z6xeLB0yjXR5hORO4/cRZJr/s0PtYC9SppdmjX98byeLeXcjRD7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3147
X-OriginatorOrg: citrix.com

When an IO-APIC pin is switched from level to edge trigger mode the
IRR bit is cleared, so it can be used as a way to EOI an interrupt at
the IO-APIC level.

Such EOI however does not get forwarded to the dpci code like it's
done for the local APIC initiated EOI. This change adds the code in
order to notify dpci of such EOI, so that dpci and the interrupt
controller are in sync.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vioapic.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 804bc77279..dc35347afa 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -268,6 +268,17 @@ static void vioapic_write_redirent(
 
     spin_unlock(&d->arch.hvm.irq_lock);
 
+    if ( ent.fields.trig_mode == VIOAPIC_EDGE_TRIG &&
+         ent.fields.remote_irr && is_iommu_enabled(d) )
+            /*
+             * Since IRR has been cleared and further interrupts can be
+             * injected also attempt to deassert any virtual line of passed
+             * through devices using this pin. Switching a pin from level to
+             * trigger mode can be used as a way to EOI an interrupt at the
+             * IO-APIC level.
+             */
+            hvm_dpci_eoi(d, gsi);
+
     if ( is_hardware_domain(d) && unmasked )
     {
         /*
-- 
2.29.2


