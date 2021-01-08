Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2652EF414
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 15:42:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63503.112716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxsxO-0006cM-Ri; Fri, 08 Jan 2021 14:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63503.112716; Fri, 08 Jan 2021 14:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxsxO-0006bx-Nh; Fri, 08 Jan 2021 14:41:38 +0000
Received: by outflank-mailman (input) for mailman id 63503;
 Fri, 08 Jan 2021 14:41:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mh2R=GL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kxsxM-0006bs-Si
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 14:41:37 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d48a7dbc-72a0-4213-8f97-d9ce797bb4b7;
 Fri, 08 Jan 2021 14:41:35 +0000 (UTC)
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
X-Inumbo-ID: d48a7dbc-72a0-4213-8f97-d9ce797bb4b7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610116895;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=LRPKz0EhKDU211YCTAJiZTWsNn9A5mVLROdWHIC3f+Q=;
  b=eE3SHkuk+01W2q6BQ2GuigqWT8/7KE6q5/LNMvfYhvP8bP1tiHQKw2Nv
   i40eVR0ejhLPqIKcgq63jXyGsLwW7fEVtyPHKFo6DxdCPN9c69w/IwyVb
   K7X1suL45ae4CvpHSQZUX+RZdxydS9YI1rX1bnSw7TiV9WlztEG7O/1nV
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vTmW4qRBKwTPwiO8VW8oinn6e2FmiuD+OZC11lyPJyzdcnzUl5zwXDem7/wQ67rMUafz25h41H
 1keN2Hl3pD9CxWWWKr4+jq+BdU9Nc2t7A9gKq2vuLSWK4g3ufybvlce0vXUYE0w5Y3Iet9fUsI
 EdR9QOwtu7jceMsnJmvLib982yYDX9N+8wXuQOHz1gjPmW1uSalJaLthr6NmFklNf4ZKEOFnVW
 SlcehDq+a1L9CT+0WZUrnW2PsbgaXObK/wbxbIi+yt3+I/w1Z8S0MO/fZZerrHTWCt9NlA55DB
 +1c=
X-SBRS: 5.2
X-MesageID: 34705303
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,331,1602561600"; 
   d="scan'208";a="34705303"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvCN61PJiIqQhYTQM/l8wisuoW9FA1TZpYaqw/wHdVMFYqKjPVOjl7mvj55SwEdjZAnE00I0KXcsg8j2cGLAf7iknNow72BkVPqcVDsNEclikQR/GTP6qvzG/1cHUI6EmEWG/YVo9mamecayoyZrSzJg0Ighkjal1mP5dkd9Bdf78AWJJcYi1ZJRm1XwlnMkExtX8fVXjVnm7g2vC7x4fM2Vtm7Kjxc8lCJvlll8bSfIU7GWIdFB1ItI/CTTy1D9FZWkXM2zqecqtIqVjaqCkpXSXH3+fMoYsVh4c1Ke4h7GUiChNrXLl2fcm1vbh2UAwaaoADJ6NFsd9rWWUY0kuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=806LayRgPaUKFKSNW6DyLVyreKyzZoAOGUnSZxzoWe8=;
 b=RmcSZFF+BkdIxwBo7WChHGXMtUBPeE66lYSLNVteNuFPWtP8krbVwQAujuY2cPkFmjH27bDo/7X8Qcdq8iVIrSsxX3NL9Z7Xun2UzZs2oyxz0JcMehLUz/w9T+ANrLm/2tWawx7uKUDkKnHd2emAZLvBNLc9/XIL+uSDZN13iZEwRSPVlCdZ5JMsQpCZhshXdvDIkvKZyp6XaSNh8HMN4DIDTCQpngp2RscKEYOY6SOaIAll1c/OOjoFMXvjDppIYh0jbf0p0oVBncZOrKjaBPhzsXo576ljbKWQk508xHhF8TzIbGYu/Wx7cmTwcAWO7fqdiNNx5cDfYrwUWMP7cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=806LayRgPaUKFKSNW6DyLVyreKyzZoAOGUnSZxzoWe8=;
 b=AAX1u/VSIpWDKJixneigCP62m2miasQZRXkoJJ6EMwRSbOvkSjsm0Rbj4EzLefQ7YiwVDxJJxTsR1QLU6M6PuAip93+x3w/tqChnMUSsKC8cWGNrOFP3pAy1i3TFltuV8P7PgtdPxkIE0y2nag0Eru6HCS+ifZ6Ftjlq1DKonUY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hypercall: fix gnttab hypercall args conditional build on pvshim
Date: Fri,  8 Jan 2021 15:41:23 +0100
Message-ID: <20210108144123.58546-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0191.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::30)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fc50e2b-98bd-4056-68fb-08d8b3e37c72
X-MS-TrafficTypeDiagnostic: DM5PR03MB2491:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB24914F3F776BD3E5D13887908FAE0@DM5PR03MB2491.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: comP001V0OHfN54lL1eomxprxFVBpg6cz3y+RmPllMFYqPcPbdYTTW7kmqc8BvqQyrr7JAK5+WbU5n3zMOxDBAmtQnLRJS7rpI8TwBYG/T2AMT/UCZgMK0NC1cA7fdGX7NkkrhxhYZTAdGUxB8mdB8+LI3mU/YYp+bQOaAR1R1fKnVIjD/lQ+MvfHopTL/vsnsxUZIP8C1zKx1nDTxEIQN1DVZ1f+oJktQHFZMbE+5TeLkWwpRCmrSkENXbrAWmTyLbbYF73Ml3KmOMvHvXCWC088aWIpYrUxd2b6lSR1CIiOZ2Q2iKLZPssb0uRQJSRHotcCdqMXkEbAWE4orPtr6klHNf3yhEmaajsaRZGoglZ9s1hRmweyiH3Lf6WbDjdk29oKehThq7uCCzx63ZgVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(54906003)(1076003)(6666004)(2616005)(316002)(66476007)(66946007)(6496006)(6486002)(66556008)(8676002)(956004)(5660300002)(478600001)(2906002)(26005)(8936002)(4326008)(186003)(16526019)(6916009)(86362001)(36756003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZGt3bXpTRFBwVkJNZEkzZWxmQkt4VTVxV2cxazVsQ3FBWHBhVU83OWNQYzJJ?=
 =?utf-8?B?QUtpLzdFWUtPMUV3MkNtNnZyVU9oL2VkcUZrS0V3bDNkTVhLWDdQM3JZNytR?=
 =?utf-8?B?cjVyRHVlRnV3Slc2K1NMSjJHVitFOGg3Y3dLWkpEeGVBbzlFK1E0aU9zSVBz?=
 =?utf-8?B?a3RxYXJ0TVE3RVdiRlFTQ0pFVVVzQnZKUkRLYnlnT3BNY0RiOUFubWhBRnhp?=
 =?utf-8?B?Wk9vRk1HTVUxNVFZazZSRjdvT25KeTJ2K3FNaUZWRlkvbitHR3UrWnZYSEhH?=
 =?utf-8?B?WEtVcmp3QlZ1dGxoV2IvWXFlN0YzUVFiYWkranZTckFBVGVCb3M0R2VjYnVZ?=
 =?utf-8?B?N0JuRXlYdmlpTUN5U3UzU2RYNWNuTmNyQW1TRXNWaHNuT2diaXl1SldNRytY?=
 =?utf-8?B?MGpGZ3k3SGliaTNBZ2R0ZXFRMDB5NDdTWnNXYjVxMGNONHIrRzlOL2pYZUZU?=
 =?utf-8?B?ay9DbGNqTjgrYzUzY3hjNDFsT3ZVbDFMSzJzdlBZZFE5THdQNUhMb2xkaXY0?=
 =?utf-8?B?M3BsWUtCS3locjVGNExaQ0VDK3hXSFozb2Fvc0tRQUpHeVBsVlpkLzRteFp6?=
 =?utf-8?B?L0tmeEFLZ0c1bURTYVNrVWFIdVRaMy9LSDcyNk5ISTJFbi9WQml1RWNFYW1E?=
 =?utf-8?B?a05oRWtsankrNmhWMjREemZrSmkyZEE4RFkzRUZxczhpM2Foc2UrTUpjY3Fs?=
 =?utf-8?B?WTZZS3NONCtVdTdUem4vUzdaSnlMS05CbHYwbGFRRU03ektzTHUybDBZYUI0?=
 =?utf-8?B?MThMZGJXYjVpSXB0MWNBUk5VZGJYWFhaL3hvNEJyZ3ZHR0hBcGdicWRFelBh?=
 =?utf-8?B?MVF0MStQa3dlOXoxOXNkemIxcjRCTFVLVXozQitZUnRERE9QYUYwQk02amF1?=
 =?utf-8?B?Zm9lZlB1Q01RU3Z5Q0NPNXJkc3BnU2xQYTR1a2hqempIVkpnbFc1Vmw4eEZj?=
 =?utf-8?B?RXNDQ3VucWpIbzRqTjJxY3dIcm42cStLQmtZRnlaa1dtcTBkUmdNVUtGN1JT?=
 =?utf-8?B?cjZTbjNTMEo4R1NmZUdKbmpoRzIrTDFXSTZ6bDZSOWR2M05RM0NtNVE2eExZ?=
 =?utf-8?B?MEhLUlFkcDUrT1dLNi9LeVBwTVI2OWQwaEJ4NU1Ka05VcTcrdG85akpYdWdv?=
 =?utf-8?B?dTgwMG1BUEU5N0dFZUxCbGZlcmhTQWFqdFpjT1NtODlFTHV1WXhiNk9Va1Zm?=
 =?utf-8?B?SnA5SFppdnhEdXFaNXBoZEQ1MFhUYW5BOFd2R2hXZFIyRzBPTnZnQloxM1Bm?=
 =?utf-8?B?QUY5bXdYVC9VeXFwMlRCby9OOGxySVl5WHQ4Nm5xQXIxaWhlc25rbjh4ZzRq?=
 =?utf-8?Q?Qug3BqJhd6qE81UHaupt0PE5huai2+0L9K?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 14:41:29.9228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc50e2b-98bd-4056-68fb-08d8b3e37c72
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1Ca5PFyrXJlj5zkOCCzDhHNmfhrbhIDcoWglNxID9HEr8SBNyZLPqg6Q9sFpo9VeXGZFq3Tf2sCOE6m5/Kcjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2491
X-OriginatorOrg: citrix.com

A pvshim build doesn't require the grant table functionality built in,
but it does require knowing the number of arguments the hypercall has
so the hypercall parameter clobbering works properly.

Note this hasn't been detected by osstest because the tools pvshim
build is done without debug enabled, so the hypercall parameter
clobbering doesn't happen.

Fixes: d2151152dd2 ('xen: make grant table support configurable')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hypercall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index dd00983005..8d18ef80cc 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -47,7 +47,7 @@ const hypercall_args_t hypercall_args_table[NR_hypercalls] =
     ARGS(xen_version, 2),
     ARGS(console_io, 3),
     ARGS(physdev_op_compat, 1),
-#ifdef CONFIG_GRANT_TABLE
+#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
     ARGS(grant_table_op, 3),
 #endif
     ARGS(vm_assist, 2),
-- 
2.29.2


