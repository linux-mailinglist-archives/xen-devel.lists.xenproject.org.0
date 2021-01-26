Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B74D4303F2E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:46:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75064.135090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Og8-0002rD-Hp; Tue, 26 Jan 2021 13:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75064.135090; Tue, 26 Jan 2021 13:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Og8-0002qK-DB; Tue, 26 Jan 2021 13:46:44 +0000
Received: by outflank-mailman (input) for mailman id 75064;
 Tue, 26 Jan 2021 13:46:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4Og6-0002mo-6o
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:46:42 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6507a2c4-5708-4e66-880d-101cd07fab76;
 Tue, 26 Jan 2021 13:46:41 +0000 (UTC)
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
X-Inumbo-ID: 6507a2c4-5708-4e66-880d-101cd07fab76
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611668801;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=mlwpY/hD2zW1tD7WWdbJGtUgNMLZb4enrRVXr8oz4wg=;
  b=NALiwz8EvddxqH+yRr36grIRXuLKLvulAx/qwbnbqe7sd4Ylpf47/+Ki
   RSyBXpZmzoHB3rrciVbIioqGvOnqaRkKgpkq+FZ9tM5bpPlOLQmqeQKS8
   ECiC7/Hi07TmHxsewYgmutcQ0CxoWIeguIV4TeSD7rABFkOe3RnTsQhSa
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AUV6PQw5FuQcSYh6wUuQzGLp4pqaQH++62YaT8Bn1pn+ffeLhOw8TzuNUNGjfInMV6denFAcde
 trDGoJaGvquRfSC9Dp8jvynriDn+v35NGn1hYbxWrIZjO8nvf92Q0KCDiCMeW9XSQ36/v5Jjzg
 S9nCouRKueMl4ucx5ErvWVEPnKlqUeDaEZItLkd6CU3YcGYPbkBuUakqTcS73/gUZyP2XLP5M6
 wMiRbEy8WO/njovXDJB3kdrm5tZoiqzCsaYZ+qbGkoWawAwr6kwyz4JSoDiUyzm6h/l7IQyaBz
 Qxw=
X-SBRS: 5.2
X-MesageID: 35863423
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="35863423"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMoJcsqoW1/mvojvG54F9OjG1uuBdJ0mOwE1XTWMv42/mkmLaShXAfSbjKkAjX/5X2s3BrgFhNqdqGzzY01QfuLNY0bydFZ2uFfGOwWIjju8q9x5g5Fu6o2SOCvVoSJoxDJJ8Kuvo1bXhBCdAQk76r0CNlPvxzFspWI98byWaHPr4SgX9bUkPoP5C1p/c2djCgt02mURvYIu0tq79z470c+jg1hD4pjfzwC0LNZW6etbWQw5YXNwLK9rQgnOO8BZz/Kf2jKMmyEa3qTSunOZVwZmJhy488WpqAiLadRbThNAqsZPP+H4MMfP+FdHYcvJB+jX8BJNXwFyD6qJ3sj82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lofouQ1GmU+o4c970v6OlV6XbO/TLQaARJUEc3j0n3k=;
 b=BXzpCHLEJryuCFja8jv62rgGIgvYTo/ISDWyZpdmsZwyWJf3qbGCVdy0XerWaFXCHGqHI5OcBWf0lIIJYp+iWsWGFly/4zdjM5/8ePjezF2jFmGS8JgMP2JDs1JNPFbkOsElvAjY8sNKT2Gr1Fq8EJqDU1K9b0wECuVO+0fQII7WoHkK+OznVHFrNQrs20F44wIbD1VzGsfv5bNlMTxn8zPUq76DRfgMNxwWlhO+IQlv6gjralITqG5uJUc/HC1xpbeJihoWd7rhqnVsi+rzJTosi+lyQfTFKgsxDv5VyiaqOZkqg3RZFG8mINkl3Lu8KvrCei+1klkwRHM/TFmYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lofouQ1GmU+o4c970v6OlV6XbO/TLQaARJUEc3j0n3k=;
 b=Qe6pP1k/uCz2RzL1Cb7XToGsE5w836QsHHuy4qi630a53Z/JT9iZ/ZbkysVV41zun5mG4plMyOSESsKcOJona/SSbRWDbYsuhyCaG1xgbFwiCo/PMy30Keey+WtRQyiQ/9mWfQFKIUnYRWxvZDUv0tQz7NzAAB53EBwLZG+td+U=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 4/6] x86/vpic: don't trigger unmask event until end of init
Date: Tue, 26 Jan 2021 14:45:19 +0100
Message-ID: <20210126134521.25784-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126134521.25784-1-roger.pau@citrix.com>
References: <20210126134521.25784-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0052.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dca1c2ba-2a23-45b9-15fe-08d8c200c4de
X-MS-TrafficTypeDiagnostic: DM5PR03MB3209:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3209571CA7EA700948B5B9BE8FBC9@DM5PR03MB3209.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJ+8bwS94N2tkJfYZveOm/nWbt/oC/QSnDZk2YxTPj9YFmDOBPLch0DXN7zFaRf2Y+WwvRJUJSFy+IqgK54FWxQZzmGkajTmqqQpG1ogpic27Sq9/OQ4EXdW7++dAw9+Q5Ti+EOKMxmhd+m0cV88OMjNAIf4VN+5BoOT58UNXqVOAOVfHKRku2oMKieoHOv9QPKMQcGkmD5rkwH7K+7zBt0vOqxL6wlwdb5ghr9idxF4kWbwvKf/Vc5bKpQTWEatAb3z7KP5nQu9yrQgCWIzuBNf+GakqI97AXyumEoZtdAs6dwX3M2jiZckFjkGXjYIjGlV++G0VSa6Y+czOpEOpDtHlrvOJ/s1Nw1vfyPLn5+3PpGX4SvJsbzVxF0DVwDPOaOElOZhKNkUkH6aIQ+0rfizXNQg9tZG7YkqEPBp1dLa/6HhU3efLxNH1qlC2KhUSdl7PfPYN/J7RMUyxAf8r7BEP0eBKMZZbIi1ohGsXYnfywMGwhhcZLeehsEG5RjwU1QnQlX51NiC4ykj6jkTTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(6666004)(6916009)(66946007)(8936002)(956004)(86362001)(36756003)(478600001)(2616005)(8676002)(83380400001)(4326008)(6486002)(186003)(6496006)(54906003)(16526019)(2906002)(1076003)(5660300002)(66476007)(316002)(26005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVM3Mm9sRExTSjBzSmduM2ErVUROZWI5bUZybG9MQjRxa2dzdHFZUjVmTlRs?=
 =?utf-8?B?SENNanRnUWFMS25VeXN6Mm9OZHBjWUhxZmZORUlNUWFCN09nbjlTSlZ1bFhm?=
 =?utf-8?B?dDVRTlcvcTBkLzBleWl5NHcyenZIWnNGd0JnYThVdUlZYWg4K1Jod29ObzBz?=
 =?utf-8?B?VWhTOGExWXZ4UU9oc1FNaFBvMW1CM0FmRUFJc0pKa29jeStaVE44Q2FjSDBq?=
 =?utf-8?B?TXpmWW5Ua09NMVM4dzVwWk1EOXRRWTROdlBBUTVCWjAzTERzUjYvY1ltWlcv?=
 =?utf-8?B?YnZMbEZwK1dMYm9VbkdWQzZtRllOMCtPdHVyQ1BnWTFYcVUxQkE1SVFxWWc3?=
 =?utf-8?B?WnJwckx2cTF1K0E5b1hPcW1rRU9iR2h1VXhvazZ0ZDFqaXRIUFJZR0pmVm40?=
 =?utf-8?B?cTY3TmlJZmpiRXVaeENHTDYwaTgwTmFaT3VuZVdjQUdscC9CWGVXN2R4N1dY?=
 =?utf-8?B?cjdreEtrTXRLZ1ByckcwN29DNW55NWZobnYwZWRyZXA1Vyt6VU9PVWFGeGFC?=
 =?utf-8?B?NUF5Yk1zQURGd0xPYjdZYnN2d3NqS3pjZnBYTVYrWEtuTGFjQWJ5Q3BONWlR?=
 =?utf-8?B?b2FaTjFMWHM2WjNJUnZLdnlCNkd0a1dDY1Zwc0xNU1h3anlUcTlod2cxQjlU?=
 =?utf-8?B?clhzR2s5c09mei8zUWNJVGloemFGbGd1cWJUcmlaM3BGcDZlVTBlOXNxZ3Iw?=
 =?utf-8?B?a3RFQkZaZjlXTVZpVDR4bXBwSHFPTVp4Q1hWN21CRlRWQ3hBbmxrU2ovcnlJ?=
 =?utf-8?B?NThaS1pVNUhsd3hWOXlRSTN3K3VEN1puZXMxdS9PSzlzZ0FPOHBpZXVjUEFN?=
 =?utf-8?B?bmNVSXNnUDI0Z0lHYkdWZjVUM1JYcEJrSXRTQUM0TGNraVRleDAvZ2luMkdS?=
 =?utf-8?B?MmFhaUc1dGFKa2YzcHN6OFpmTnkyRXZCZkpMMXNMT2RtMXIvMWphNTdvdWdk?=
 =?utf-8?B?VUFJU1EwazEyRU50NW1oRkNPNDVUQjgyRkEyYUc3aVExQ3VvZ3dHVkFJT1hq?=
 =?utf-8?B?VVBaVkRWaThzQkZZMWxuNm14L1VlSGpWVktOWnJFdHJqNTBmOTJkK210Qk1L?=
 =?utf-8?B?NEo5YTB5L0ZxT2RwWTBPUXNMd2FCcEt6Zk53TDJKcGdSVzFGTC9YRGtsR2U4?=
 =?utf-8?B?Vzltb2k1S243T0hFV0ZiZXp6d3ZySGozVTFYRWJZcUp3dlhIYm5BTjRpN0tu?=
 =?utf-8?B?cXJXYlZISWwrdzlKTVgxVDYrQng5Ync3MTZUeU9UZXpjaitvMVo1RnlVYUJq?=
 =?utf-8?B?dEJhY3ExazZIeE1ZQmtwVkFsMURhME5SSTdUOWpteHYyKytFbmFZbk1BOE1x?=
 =?utf-8?B?ZUVTNWJvZEdlZmFheHVxcnE5Ly9oT0R1YkF6TnRJcFltcEVSUWtxRyswZDNB?=
 =?utf-8?B?ZG5zaFI1N0RhQWF2cG14ZlhXRmpPelFkRzRxYXhBeWEyTDkwZlFEbitFNW40?=
 =?utf-8?B?b05ZUFpwN2RpVitSaWNKNFFrS0o0aVFkd2hxYUlRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dca1c2ba-2a23-45b9-15fe-08d8c200c4de
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 13:46:23.4002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38lZDNybw2vhVQOTmSIPIYp2BIAjyV3ht241r3kK7meL3IM+M/fD2hfHIMMU5oj+23miH86l3LogfgVJbv3Jlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3209
X-OriginatorOrg: citrix.com

Wait until the end of the init sequence to trigger the unmask event.
Note that it will be unconditionally triggered, but that's harmless if
not unmask actually happened.

While there change the variable type to bool.

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/arch/x86/hvm/vpic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 9195155ff0..795a76768d 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -188,7 +188,8 @@ static void vpic_ioport_write(
     struct hvm_hw_vpic *vpic, uint32_t addr, uint32_t val)
 {
     int priority, cmd;
-    uint8_t mask, unmasked = 0;
+    uint8_t mask;
+    bool unmasked = false;
 
     vpic_lock(vpic);
 
@@ -200,7 +201,6 @@ static void vpic_ioport_write(
             /* Clear edge-sensing logic. */
             vpic->irr &= vpic->elcr;
 
-            unmasked = vpic->imr;
             /* No interrupts masked or in service. */
             vpic->imr = vpic->isr = 0;
 
@@ -294,13 +294,17 @@ static void vpic_ioport_write(
             /* ICW3 */
             vpic->init_state++;
             if ( !(vpic->init_state & 4) )
+            {
                 vpic->init_state = 0; /* No ICW4: init done */
+                unmasked = true;
+            }
             break;
         case 3:
             /* ICW4 */
             vpic->special_fully_nested_mode = (val >> 4) & 1;
             vpic->auto_eoi = (val >> 1) & 1;
             vpic->init_state = 0;
+            unmasked = true;
             break;
         }
     }
-- 
2.29.2


