Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0109B2FA4CE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69764.125033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WXG-0003Uv-I8; Mon, 18 Jan 2021 15:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69764.125033; Mon, 18 Jan 2021 15:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WXG-0003US-EI; Mon, 18 Jan 2021 15:33:42 +0000
Received: by outflank-mailman (input) for mailman id 69764;
 Mon, 18 Jan 2021 15:33:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1WXF-0003UD-Cb
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:33:41 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 749061fe-4f66-406b-9672-9c998485afde;
 Mon, 18 Jan 2021 15:33:40 +0000 (UTC)
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
X-Inumbo-ID: 749061fe-4f66-406b-9672-9c998485afde
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610984020;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=5IgWQMiytAxeLeEdXsmof0S9L2LFsUa5TMj2P3zL12k=;
  b=AEganqievqfNadpxF53Qd+9Akfu0kDA4STGspRwCkQ1AhQFZw4RugwSI
   JBYbFti9mEs4vMk4E0LlR/2Ysktpke+5QDgrUhcpdC6jLcMy49cPqBP68
   sPfgwrzByqruuk5/tdLbkFYJd//gTA9LAWU5KYVmyDXI4SIPkE1G+jRQN
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VGue1MCqGxbMfd6Neo4leRV//MEVur/8VqgbzCLedVS3x5ugx/22Jwv/scH/7MGUZVgdSDlZdR
 OhuQ38U4/1pUiyGW3KbPvfXJHAXmx/SD18Dg3loMfR3/OzghWKrnLLLhuwEsZ/JdEQ8YGc9xrr
 O/PF1NLaFDzmQusCWrJTvdlAVaSUmJuP4oRujJvKewDNFtggzWUHjUKX8zRD+Nt4u6YuRIl/Qu
 z2FqZh6PsRCl5PAmhnXpUVMyG1lYW5AabGoiUv7hqNmgUZxVfbKPtMzJWBThdMMXoUs/8RhT/o
 zQ0=
X-SBRS: 5.2
X-MesageID: 36604199
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="36604199"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFK6eCmH6+D8WPgct5aBDEebF0wYe11xD+9uVv0hFopyviKeHFk0Pgx1ChSWMwElbHC19RkGxqd+DFXo3pCqTlzVId1L9AO61J0aAN9n+rqeaRtSybFj8YV3Y+qdRRLsfxJOqLVet0ltkP/XOKWD7xB5TOClQkog/CwooTLARNXQo2uBEpDsgKqHVGdFJOWWTD6NC4tJvI3mfD1zq08bRDynHJKbOwe5jFki6Dd1T3DwgJ40k7mJLIa5hk1Cz4hxuKWFTIVVr3LOwqRjpHMYDuCBfITpd2LorTst9euqzYEZvPqLw+zmqtq+J95lkeBofD4Ol66IvYIp/FoHgAZYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=414HAnI51gzZNcMd8XEwXwGUTwqdX0TMfXgV5vrF0kQ=;
 b=jYkCA2+GhmvKAOD/X17EvmllYFsnj0Evgjgk0OBaELlrl51teyQh7cU/I4kqYyEuZv9bfCLWx+ZxzfzlwttCjWQtSS/WhAmxUX8xPJx740rclxbkptNEg9fbD1z+ajSH29SGzwM/G8VFriT1LHVcubKOlCR3USQFAWfJUtP1vpeZ6LweU9B7poW/Wo6cPsz//KbmQUahj6I4t9cXssHHV8fPmwzsObfzAZBNIlqizUTf8O/F5gNWGJSwNN1PQFIz41zcjrCKtmt/P5POMtloyH0uX3sxb7a94+IQRpjKRjs6/w2u+MDuUcBOT38IeR6iLLqVFBdrSTXQX3eW6TRqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=414HAnI51gzZNcMd8XEwXwGUTwqdX0TMfXgV5vrF0kQ=;
 b=ShQh2PU/7T2/saAemMr1dhYCp5fE1gU1VkXDftxyDaWrxIZcgOsOSmBARW/Opw2bGIdXIcHD6gVtHNK7PtSaA5R+KMj9UDxNV3ViKlZ745uKfXmGmrqd+Ic520ok55yZ3lZ6Q8/4y9Imf7waDMK9IOMrbYaB2X+F/SheVMDB/WQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <qemu-devel@nongnu.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Arthur Borsboom
	<arthurborsboom@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	<xen-devel@lists.xenproject.org>, <qemu-block@nongnu.org>
Subject: [PATCH] xen-block: fix reporting of discard feature
Date: Mon, 18 Jan 2021 16:33:30 +0100
Message-ID: <20210118153330.82324-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0073.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ef8352a-9fd1-4db0-ce06-08d8bbc66bf5
X-MS-TrafficTypeDiagnostic: DM6PR03MB4219:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4219BFD4FF770C2436CBC67B8FA40@DM6PR03MB4219.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +BMT44CkRZPYVXWRPAN2hQn+Vd/lyny2bHlgcy3pAPiAD5irsSxLw3wjAMXWFqYTb1+HOIWkvSo5py+V7CykYy9mdwah3L6dtw0ARtcwDnA4Fpht8J3FmON7txRqthdhm/ibiR/cmj0NN792iFrA8ObdyukFFF5ZUEPgYRimimH7ooz6MVXqaVlsu/EmdT9WWLJc5lhqjTfyeKH+6Q92/JC55OygCaei07eK2/vGnKta1uka835DENSSDq9KBEpLufYpCk15axWUepV66RJ0a8MDAUHqvGmTsIQAD9oHYRmqPPqRhkBEKjf8itO9z3nXO3w3QcozQUKpc3HKPfmMrU2teCJG9EK2uyVrWTl1x4wbycNwahwPNFtyGjo229JLVf1BUl15sSf5eeICxBGSaIENI3ecGcp3xBZgQFhy4Rj7KpOlRwcud4OUjaIO8ksgTEcnlWfsFe0ujt40ujqQAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(186003)(54906003)(2616005)(26005)(6916009)(1076003)(956004)(966005)(16526019)(83380400001)(8676002)(478600001)(316002)(86362001)(66556008)(8936002)(66476007)(5660300002)(4326008)(66946007)(36756003)(2906002)(6496006)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V01QMUw0RXVKdE4zV01xNXVxTlNRaldHTndTVEVrMHlZMnpMRXFyeGhLUU5O?=
 =?utf-8?B?Nm9DeG1LT3dycExIQTRiMytnRU5HaWZ2eEV3aTlDeUFpYXVIYVVkbkVncFJT?=
 =?utf-8?B?VUhPNnh3QzJEa3JkL3FNZkx1cWJHRHpTV0s4VDJUK1hXdUFadVllVDRKM21L?=
 =?utf-8?B?ZjQwMXlONnNOYTF2QUdYNWFjckVtOEswUllycG5jMmlrOHVpRDNPcnVNc2Jz?=
 =?utf-8?B?c1VwUkxieFJEYlgyZDM5andXVWZYa3ZQdVcyU01WUnNWSS9BSjNGOVgzck0r?=
 =?utf-8?B?WUo5dnBZcEsrRG95SitYWjFqS0dMLzh4WC9QU2J6cWlmQ1ZJWkY5dEN3WXlW?=
 =?utf-8?B?aDZmVkZqR0NIWFpGMlBhcVVKbi91SjlnTmRNTFkxYWRoY2dLbnRQNHFWMkdt?=
 =?utf-8?B?RFQyZDRZeTJWclRwS09sS0VpQmNjL3gvN3k5UGFoMVhmSmZvamY3UFo4S2J5?=
 =?utf-8?B?SHhycEhzNFUwaDNNc1JDbWxzUDZCUEdOeGI4UkNRUWFDUU9rNEI4dHNOYWZX?=
 =?utf-8?B?aEZOUWlxTEtCVVJTY3RINHJZeDZLaGdsc2lpZEJ2RVpxdDBOUmRKa09nZGRm?=
 =?utf-8?B?dEIzeWYxKzc2aml3a05BTHc4LzlpS1lVTmxZS1lBTVNIY1dCQlB4cXoxT0NN?=
 =?utf-8?B?M2FaUlRBR0FodGhsdlRwcGZZMGJDQkZvYTM0M0JTUG5XMXozUzNleWtsQUND?=
 =?utf-8?B?YkNZNVBzM0ROZlJicy9wbWlDTUVDK2xISEdUWFZLeklDRVpDa1VwZ3ZHTkUz?=
 =?utf-8?B?Nnh0bGxPa28wUnQ1a0ZuSUJxUkNTZVpwamxsNTZPdDAzdW4rUThFaC9Jc3FE?=
 =?utf-8?B?eDRsenhEM3d0VHU0TXp2QXlNMnEzendzYzZtcW9ROGR2Wk11QjdWYzZ0WVpT?=
 =?utf-8?B?My9qd1NROEtSYXE0aUhyd1IwcXJQaDVHd3QyTW52LzZ4c1R2REw3dVE4SDFa?=
 =?utf-8?B?NGh3NGh5M1hmZHpLaGxaNUhhUnpSZlpES2g1UG9rUDl3M01ZSGdZTDdKdk1a?=
 =?utf-8?B?em1uRzEvN3hxREZhcll6NkxBSUZnUTBmMW8wZk04ZFBjdmgyc0plTmtURU1M?=
 =?utf-8?B?NVRZNU1OMm1mRm14dHY4REdUODVMMDJ5clFKb09pTnJUV2hWRUt5NyszTFJY?=
 =?utf-8?B?WlVvY1pINFZBbDVhTEJRdnkzQTVPcUdKaHczOGUwcWtUdk4yYzZEMWpTZ3lV?=
 =?utf-8?B?c1RtWThRVFkvb24yNUg3OEc4N0NXcjM0bXNJbk1YZkpIN0tpQUNJcDBNSnJu?=
 =?utf-8?B?YmRELy94MEdBdnBiWStLWGU2NFVzMDQzd3RBRkkrWkFLc0F0Wk5lcGhqT2NN?=
 =?utf-8?Q?sw2ZsN90ZFYSjeeRIrOrwQcDXHbqhdJIdB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef8352a-9fd1-4db0-ce06-08d8bbc66bf5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 15:33:36.3976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3aXhdyBLrtGMthpneCxYJ12F5+mBUVlQrZziJGefV3ia56Z5ELRIXNyuiR+XmHd2l9QWOT/VeE3waVHY1oZXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4219
X-OriginatorOrg: citrix.com

Linux blkfront expects both "discard-granularity" and
"discard-alignment" present on xenbus in order to properly enable the
feature, not exposing "discard-alignment" left some Linux blkfront
versions with a broken discard setup. This has also been addressed in
Linux with:

https://lore.kernel.org/lkml/20210118151528.81668-1-roger.pau@citrix.com/T/#u

Fix QEMU to report a "discard-alignment" of 0, in order for it to work
with older Linux frontends.

Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: xen-devel@lists.xenproject.org
Cc: qemu-block@nongnu.org
---
 hw/block/xen-block.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 718d886e5c..246d9c23a2 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -253,6 +253,7 @@ static void xen_block_realize(XenDevice *xendev, Error **errp)
         xen_device_backend_printf(xendev, "feature-discard", "%u", 1);
         xen_device_backend_printf(xendev, "discard-granularity", "%u",
                                   conf->discard_granularity);
+        xen_device_backend_printf(xendev, "discard-alignment", "%u", 0);
     }
 
     xen_device_backend_printf(xendev, "feature-flush-cache", "%u", 1);
-- 
2.29.2


