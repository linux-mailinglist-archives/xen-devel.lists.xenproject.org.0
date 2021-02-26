Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9623D325F92
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 10:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90142.170565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYza-0007Vq-H5; Fri, 26 Feb 2021 09:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90142.170565; Fri, 26 Feb 2021 09:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYza-0007VB-DS; Fri, 26 Feb 2021 09:00:58 +0000
Received: by outflank-mailman (input) for mailman id 90142;
 Fri, 26 Feb 2021 09:00:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zK4+=H4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lFYzY-0007UE-FO
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 09:00:56 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d14fef2c-b6de-4b7c-b17b-f11b32700cfc;
 Fri, 26 Feb 2021 09:00:55 +0000 (UTC)
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
X-Inumbo-ID: d14fef2c-b6de-4b7c-b17b-f11b32700cfc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614330055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=hcHZxn/yloaKbz4HuwpCWh+4xZp5v7qk/JNM42WjKUM=;
  b=XDhsBgQ7pKWMmfxld8eBDabMT1BJUNIpiLLFuSddW0EqvL97+ckfAc/h
   W+T6+bpBHJpaj7H3sh1pfNsTcykfFYGJuEzwJRQSd8i5lkZd86z/LfsSM
   +Imogjyi+DlOMh7n8vSJUpQZzMgSw2wRVOXY484/iJnxwPju3KjBAJKy2
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wSgAA5y5wVVo/oQ/CS6btyjOt1uTCrvFlD1Y/BVby9vwUiD5yoqxrN4/xpIO046Unqvoz8XC3y
 TizCFOUbkfvhgU48eGEqymCZsjOm3J79j2kgZMWFf8UbRe1K/WokNBFV1YALuzxbfzjBQccNk3
 546ApWeMUynWsMbIuwkR4v1B0MdRqRBy6uLdHaqFcyAsWuszb0xdmi0qqfLI6Qmgl3aK7MgFxO
 buzu+N1R0mUtPKD4Q7Am3fcME6Ficss3sy9h4yxcFmlCpirFuXTiJXR35pJH4gM8GNFrOExxgM
 0f8=
X-SBRS: 5.2
X-MesageID: 38281509
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,208,1610427600"; 
   d="scan'208";a="38281509"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVcL7XXSzfeBk0HpU77cZvw+pdpXU9InFkf29LogVwHbUX/7uRa2LcM9DlmYrTsPWoHRewF2liSs/tLPp+xH5VIUfdHvhjW+6IGcVN120OeWqeiPZxVfNEO4475IbYv3gy/94E68n4QyuK0GlKI0V5+RxktZrsz0WHBjMiqUe5EbxmUsV/PASFasUv2qafPyyApiks4Pkust1c0rYs3M19zzgtNPwhXtkrHFdzr3a9v/pWvqxsKzf3emd7GbHASFlE0KKu2T9WHpkKttOdJG3ZOuyRtdFouLoOxO2+NthvKuRvcLs8mQh8XNmRJjuDdUtQt9rvyQuYH3c4JumktC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cydJsAIez600M/vb94JozzdggeHZXjVoZDJiSVI8vdk=;
 b=V/sOIyIo1iWY2O4urxGerAoGPB/zjdgBmAcMJzjrm4m8aSw1dpSO1KdJPUraYRKe+R6t7qYe1DHUNt5HG3+iGOKGDs0+kCsQiBPgVW4AW68gw6vir77aVnmZqHf0BtXiW1dygdrvqej/g84mTZesRXVqb/3/Lfl+PN1DzL+CleNiTekwcZHzCtnsjq4MwIBU+wJ0plwkEkDItQxVxaFOoT6dhfByPZ4ISJ8ox2wSMslCGdskPlF8WDd2TWn3vEzJJhxylHtg+LPWSLVp/6P+XXHXaAuT/waBbJTmQZhrvnRVZj4QvW8Vv8wR8j0HMActwkDH1sCpc6joXVcmsaf/yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cydJsAIez600M/vb94JozzdggeHZXjVoZDJiSVI8vdk=;
 b=Qb3bkvoReEXHl1cTB3Wvl5VMr+wFUZFsIRA8+WGYwKrKQoU9qpmcnnVMP8kSwYpQDfErBYB7KVpjvsKA5XzwVQaQqnEnwsFov2RFgEm//7U7XgJDJUVZAe3v7JmW0aUNXNc26X4wocIZmaJhDpg+EekiDmKind9GD6z2V5Xdq28=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH for-4.15 3/3] automation: enable rombios build on Alpine
Date: Fri, 26 Feb 2021 09:59:08 +0100
Message-ID: <20210226085908.21254-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210226085908.21254-1-roger.pau@citrix.com>
References: <20210226085908.21254-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P195CA0080.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24fd7f05-1b4b-450a-fd15-08d8da3504ec
X-MS-TrafficTypeDiagnostic: DM6PR03MB4394:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4394659081E56D81C4CCC7058F9D9@DM6PR03MB4394.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AiZ5MAl9dU+k5KTCQeFt+JOOMNCSoIkBdrpbYrFSgkMQ6mNr/euqacEaAA5nSSpD6Nsi6yFOJHkUf9sbc4qxBE4NsDGRtVANWD5xFEgA769As8tiLHfQRfHxTy10e4ubuM6VZ5w2oCA24PYrCywQdEFavvlv8wJGnumR4JdEmHEgFPG82det3M/ZmuXNXPdVztv6jMLIt4bKOt5/xJmHU85zZ16LmJWShmg7HMK2sGEV3hQTCur+qiMEmy8UkCLixuoCCeWtFYPTU6tp9ixckOk9YKeKDTBo3eNhI6IXFv+jQJ7+naGpufd8wbEClAk7EeQIVqZKKongGKkkp4pNBj9UfBtHW1ntOJLaqcM6PX5K1DU4C73HwnaLg+389KXjJsS6iCKZowe8qyHji2sEfpAoG7ep/NjCmdXiF4DtLfyUQpNOGmnOEGAVGw8l6+tGpdIkIrex4Mwl36sXmIGPqnmliYI/sipoHBpOCG1CCsyZgMbnnav4SC4QhH6yRKa7PoHp1GVKFo0WyZC4qqnU2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(6916009)(66556008)(66946007)(36756003)(316002)(478600001)(6496006)(6666004)(66476007)(86362001)(2616005)(26005)(4326008)(54906003)(186003)(1076003)(5660300002)(16526019)(2906002)(4744005)(8936002)(956004)(83380400001)(8676002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WGtHZWJGWnJhWmR1YVg1R2NFdk54eEZMbWlyOTJqWHVQSk9kNmVZTXB4MUtz?=
 =?utf-8?B?WnVXVDdjV0d5RzVqcFV4WmFiVVI3UjF2YWovSjdIbldyOHI4bWw0TllmZzFj?=
 =?utf-8?B?aFh4UDJZc285TFdnNzgrNVQ4VzRQU3ErUmV5cGhaK0lBZlBWOE1rcVVMa1o3?=
 =?utf-8?B?d29XMyttalA5eExWRERxYk4vNmRZMDZXZG5rV1RJVytob1BtUVhDVmNNUlBR?=
 =?utf-8?B?N1NXazF0VVZtdFdIZzR6U1p3LytSVlZ3UWo1V056YS94Yndvc0lYeCtsaS9W?=
 =?utf-8?B?aGJSdkhPNHdacGUzWlQvQ0NKK2FRRndvVXkzY0hrVzhNbFpoaldOQmQrYlZD?=
 =?utf-8?B?V2dhY3pKUW5DTGIwUE0wZWE1Q3NqQS9HYzF3N0JxZzE5UW5tZ0dkY3oyWitY?=
 =?utf-8?B?NVJKM1ZLSEQ1aDQ1bzdBVDRjR3pOM2NQOG04bnZCTDdSeEpmbEFMYzhVSXYw?=
 =?utf-8?B?ZDBvR3pOajhXOEQ1K0FUSGpIbVVjcE1kY1ZGSHpoOG5GVnNBSlZNWnBLOTIx?=
 =?utf-8?B?LzJ0b0gybmtDZC81cFhQRWtNZUdxNExNM3NsM0FVbFpnUkhLYXJxL3NRdG5O?=
 =?utf-8?B?YVpHTElqa0FweTJLd1Q1WnNFakhvTERsNHY1cldjRmlMMFlsSDNYVnR4VWVX?=
 =?utf-8?B?NmoyN3A1blZKNVlacWplUnB2MHh5TWE5U1RTMXIzTWp1ZkZqNEFRZTRzcFVE?=
 =?utf-8?B?QTJ2UDJVWTI2Qi9TRkhuRXNsb2s5UVUyRG9Vc1FTVDJ1K0Z0Vkx0QjlJeDYw?=
 =?utf-8?B?NVdLY3NSakMyMFJYM1M5Vmt2QlpMQTJkK3BuMm9SY2dqWnBHcmdELzh4VkMw?=
 =?utf-8?B?S0N5MEt4bHdWNFB3d3hZSm9mT3BzRzRHaVEvL3FMQVhWSjNwZGlVNk02QXBo?=
 =?utf-8?B?YVlDalRDbWpVdktYNDRMNVlyK1BPTzdOWitVNU1sMS80SlFIZEhmTGRCWGQz?=
 =?utf-8?B?OFBZQlBGTXVpcVlqdUNZRjZvVWFoU0hVVG9NNkpZb0JvNXBsM2I5L2hSQnFD?=
 =?utf-8?B?czRKRnEvQUdvR0IrWnBvNzBNei8vZkl6OCtxM2hXOC9jOGtJMGdUOVIzWHA1?=
 =?utf-8?B?Q1c0SmZ4cEczQWdsK2R6M1h4bHVCcjRpSnpWMml2MEJjU2pVV2VlTlJqb1Iz?=
 =?utf-8?B?b1VSdldDaUpUSnN3cHdVbk5paVRQcjVhR0p1V1plZnhNTUhRdEJkVzVFQ0tH?=
 =?utf-8?B?cTVUL1Z6M040WjJlWStRVFZQaDdIQzhsdzFMZ295WVZwMnlBTGJBb2ZkNERt?=
 =?utf-8?B?SWhiSDVlTUtieUQ4VXVIS1REMkhIZnk0S1hNZ2pmVDdXMXlxMXZqVGdYTm1M?=
 =?utf-8?B?S1hiaU5sVnZsRGtLV21tRjRHWlVTVnRLazdGSWljWVFtRjhYSWRBV0luYUNK?=
 =?utf-8?B?UUV6T3lqUVRJbGhBaVdDT0xGb1BuTzNvcWpXWjl2L1g1dlFMUnh0Y0hyQ3lu?=
 =?utf-8?B?U3lRTHZFZzcyMlVYOEVsTnhFbzRSUXJXUmRIUHhBMGkxbVhwYjFmazJkekxL?=
 =?utf-8?B?V1E3SUJFUXVGSnFXbDU1UndSZXRUV21udTlsZGVaRHQxeXNsbzlPeFM5M3h3?=
 =?utf-8?B?ZXJtUnM4N2hoU2wzU0R3dkd4dUV6Vm9mcTU5STVWVU9lQTI5NGc1VjJIdjI0?=
 =?utf-8?B?b0xPeHZVeTUrek9RUzdudFhPa3ZaOVVjaksvdUZMVUtHbHJHOE85c1NjRGVs?=
 =?utf-8?B?L0hIRklwa2IrMWl1NnlBdVM3N01qUEVmR05xQllKRHlWWktwQ0syc08xekJw?=
 =?utf-8?Q?I74RJad7DdawzbhBOF6g0nI4dans6CyGox7pRPx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fd7f05-1b4b-450a-fd15-08d8da3504ec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 09:00:52.4802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaxM2rmnO+DLUV5YP63C9oIIsO4PN46OQgTV2zz25vShUTPEahZL9pIOGpy3dnjg0Trj0TZZsq5LQLYydIRZFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4394
X-OriginatorOrg: citrix.com

It's now safe to enable the build of rombios on Alpine systems, as
hvmloader already builds fine there.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 automation/scripts/build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index d8990c3bf4..87e44bb940 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -31,9 +31,8 @@ fi
 if ! test -z "$(ldd /bin/ls|grep musl|head -1)"; then
     # disable --disable-werror for QEMUU when building with MUSL
     cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
-    # hvmloader doesn't build on MUSL systems
-    cfgargs+=("--disable-seabios")
-    cfgargs+=("--disable-rombios")
+    # SeaBIOS doesn't build on MUSL systems
+    cfgargs+=("--with-system-seabios=/bin/false")
 fi
 
 # Qemu requires Python 3.5 or later
-- 
2.30.1


