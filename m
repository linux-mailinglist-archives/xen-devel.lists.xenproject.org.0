Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12150561CB6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 16:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358509.587763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6umr-0004UJ-39; Thu, 30 Jun 2022 14:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358509.587763; Thu, 30 Jun 2022 14:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6umr-0004RE-0F; Thu, 30 Jun 2022 14:04:53 +0000
Received: by outflank-mailman (input) for mailman id 358509;
 Thu, 30 Jun 2022 14:04:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2IH8=XF=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1o6umA-0004NQ-Ar
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 14:04:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81abc6d4-f87d-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 16:04:07 +0200 (CEST)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by DU0PR04MB9322.eurprd04.prod.outlook.com (2603:10a6:10:355::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 14:04:05 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::1549:6f15:1949:f1a5]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::1549:6f15:1949:f1a5%6]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 14:04:05 +0000
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
X-Inumbo-ID: 81abc6d4-f87d-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRAelFvjHNKE+Dq/9+xFLA/w33IuElA/wwrSruQuB+NC2bEvlXeB8pAasrcVaiHbbqq1pbjAFWyK3KglBj6SfZ0S87LIQ+h4z6Dh70vmsCq/OZsZy5vr/RlHkj++H9BwLVJgffs5nbk9bXkv6/l6zktWnm81VKkUTTvzz3inFPBQJfZVyxK55tfQ9a/X0i7zk4v0GEoQgOFBjuhjrKr28/G+K+2slVUNBqlOQObeXK1PsAEt3rrXdjpdVinSI5fAeLdVdu/XxEzXZpwNyKq6TXu6xzXvQMnHcOOZ+br3dWFr7Ji80NwMExIn8G278AQ9SAQiY9G1JEV1uUaQkPvaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/bE8m0mHq4cfkvTjD0XHvH5DmfTH/t1/sIVm5i0T/A=;
 b=J7nJzoOtEgKlVTbgsjBdUkskWKYXebzCbVuQf8mWPiwIfzB6gJy1nThiGg2YNKeGqFcc/zmAhOVIPH2M1LzEGeF4XNWFqyQsjS2mjmqlnVB6vNlwN+Wbo6eILW7ZFrlK9My1dcr/CoPBaS1sNScc+npcnVv1VZ9YPTIwn1i5YEDZDzUQZugZhBPW/vD9rd07QT8vtpRcteKyn/kIWCtt00CLbO9WxM6k7xSDj+32dnxKlw8Wj50ONp2BE5KDxf62XBv076m97vdKooPF1qvvBRcW/7SAr9c/5Wr2zMW0bn5vWmVN1Bay+BIA5VfeDB3H9iAxY8Gs7CX6PIwMQQLMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/bE8m0mHq4cfkvTjD0XHvH5DmfTH/t1/sIVm5i0T/A=;
 b=L8o38CU6Ojtwbrh4aUP/T6UtlHojkCO7YuZhOjL3O29q95rdhe1MMmRUILAuBFOhV2iup32Q9K58r8G71Md+DZ9QaZkadOaaOEPyq00MDZ/EUe30AoQJ+rH2n7VHPJofpyAV081XS/TD/yR3sQRoiMjAJZiylnri+lb2ske/jX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net,
	sstabellini@kernel.org,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [ImageBuilder][PATCH v2 0/4] Add extra ImageBuilder features
Date: Thu, 30 Jun 2022 17:00:25 +0300
Message-Id: <20220630140028.3227385-1-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0089.eurprd03.prod.outlook.com
 (2603:10a6:208:69::30) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06357625-9ac4-4090-90c2-08da5aa164a1
X-MS-TrafficTypeDiagnostic: DU0PR04MB9322:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qVyhMH4WtsTGzk3tdkuYNebwdW3fXhShhlDRKEtD8ndpk4d0FsASFK0uM/XSKqeuLacgkxrHh0mEoUP0i3laZ9ELqZUVmmynsm5EIoRKJMHVRTjq4V/NmGRf39nSjPupKPA8a1Vud/5MKJs2VZI/A6dfB5GrZmeej+acRarUJSslldXtj5y+diC4SQ0DDW+4maqN0vdFr0c3UlqB/krVu2C8WlNCzSfLyoz43i2TWwYhjOpda10fvR0p5QIkd6gmwmzLaGUPNDL2CPc+fCKYDic9q0Lfq5MpYjdG/5W9kXv4j4Ek24M9pthqT41lyKR3oKF5AG+//broF+VT76GPHHTFvi1LYQ9QTVtyfJFIpizzsm/q5C10Kt8r89l2zuW9tYjJ1b9Tm2EyTDjyXf5ywjHY0FTfkkpMSayTpjCrdXfJYynXfMp8LHurJ/dgxip/7HyeGOZHZ0alblzNnbSm27htRevPx+ciC9oY5Y8iJ3Z9S2LVPFS6jKCPoyU3/YSNiJm/UKRGe7utO6+OaDawBNLHR9LmYvPXPuFl0ZJNcHyE4xQ3L26TaMLaP/Xao81EufydG09uu1cx8qHJDRFgpPaJkZ18ZAlU1kMBL64D/p3lDzJ57JFY1Uy46hpx6ybTRlPfkGtdUZTy63Ux2aIRejjNNi07g8wcd2i4+JZBJJGbmIUstO6+XjAYwzTkonBg7e1mw8HO2SA4tNK2wlr3opMwQBziKr1fVFw0uhWqeeN1qCBlShc5ZqAY36cD2TYo/s91d7Nfe5W2sIjOp04G71IOe8nyG99AW0DjVgzJjEKalBZPnNbmGZqJHbkHJW5o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(478600001)(41300700001)(5660300002)(6666004)(186003)(6486002)(6512007)(52116002)(1076003)(86362001)(26005)(8936002)(2906002)(2616005)(66946007)(4326008)(38100700002)(8676002)(6506007)(316002)(66476007)(66556008)(38350700002)(83380400001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xv78Uj5U5WJ69DoC+HEJw9az0+KAHnYQ+4DczsB+ihaB71B6g3MbYymUOTkr?=
 =?us-ascii?Q?Yxemc4u1i3NzOlIDk3FeudQx/7C/hMW6GkkYYnku3OY7Ohai8kjJ9vGguZHP?=
 =?us-ascii?Q?A/rMDya9emrGGnHRCoExvLsbDg/urqwJJlpYKFPEUGj/pLkArpHIeUQM9z4Q?=
 =?us-ascii?Q?dPWtquqfH4xGIG9LxXcmC3oZjgAcQhVfnmGNHY6dgjQJEnifCa1SUIETjX9M?=
 =?us-ascii?Q?gCVhA59g67rw7+mxp7in8hIC9KEnU6XmEMdFaXdBRrKQpjGkzPt/IUyIxkG9?=
 =?us-ascii?Q?sWtpYiI9VV/trtPKBKbW/A1JvQ11YRPhJKkYFd/2RJw76US+fuvy1WLGh7/J?=
 =?us-ascii?Q?Fkk7z0vSAGOqV7Gx41e353lUIrvDfuKZJrXBQvzMoJPrGziwHILbPs8p4xzU?=
 =?us-ascii?Q?fuTZgRQddxB3kYLS/T5VZonoq6hXmrKoz1KUoFkS9qyygU3NeKOdwaoT9VCs?=
 =?us-ascii?Q?8uHDQrmh3geBnSgB+VS181eiR6CuERg33v0j1OEAwD53dUO3KWVhfN0ynbFf?=
 =?us-ascii?Q?FxkDdtP4H9jcwYjxh9qIIZ/KwPTYZsNvUc2jMzDIHr1R/dLscwC4pac4V9VI?=
 =?us-ascii?Q?lGX3pUrcLROcljeOc/kw/2aE8uqUZyxWsfKXsOTIaIbWSDBnYN/J6Y7DrAv9?=
 =?us-ascii?Q?QGYRPs4JQrFgARhhoRLiROtPkrsA8OqUvheM7UZgATVDNRyw/GpNdKBK9C4/?=
 =?us-ascii?Q?+QGCZHMaJ+Bc3OiLsiBvNRgWGbEBYK84D8/YrpxMCaq15xpy+FRjaRgT/Gtj?=
 =?us-ascii?Q?VoiCyN9CVIH5js0N5M/jWv5MPz0JD2G5tuehYHTgFrmA7/aeeY7utVpALX0P?=
 =?us-ascii?Q?8mDQQbi8rH4HxJJn/D4zd2DhvT+HaTnMWVN8mLWWlbfqaDiYleu18yXpey+U?=
 =?us-ascii?Q?ZAoruSKBHwfuWk+4OVbdam+NEHNwy0jJ7b4unrc6VexPrwf9rzYy03cP7KUh?=
 =?us-ascii?Q?eMN8+HvmJN1WpLI1PGhyiTqdIfYqRWXdMgiBvPiimL0wn36/mynIFLwr76sZ?=
 =?us-ascii?Q?xCkIa5KDfpgThUx+kW34zPYKBHuv1+oC/oqh325ILbXKzFfv5qig3gkKGs0e?=
 =?us-ascii?Q?RNZ4LHT0lDsWL3bm42NsFLJF9CnZIA2GDHAfd3+6lj2tDl1JJWXvQAHUHbiU?=
 =?us-ascii?Q?szNTgithLeOErBpObHZotgJNhIT/qm1MBl/ZhEdLXtlQ8ii21UZWFIBVdCEA?=
 =?us-ascii?Q?y44CTVnVs2TD7WoyDdgRH695/lGL6Pw/7boVcnEvmC0NeDnYg5gMfDg9u1Xv?=
 =?us-ascii?Q?6c9p+EDDsFqrqNvo4zW8O4+QuWgMFuutOAKWK0lNHaX+YZ59Fe8H5jN1G3Pj?=
 =?us-ascii?Q?lZRhYmNlNxuivBzPMtZARTkOEEnpmzt2hblFYq5lkf/Tp6iR0xchG6FzXXBL?=
 =?us-ascii?Q?Zjz+Gq5PeIuYo8qZyNkC4pOQvh99GedPQgHN7Xrfcaj55B9gM4fkczZEU9vw?=
 =?us-ascii?Q?6+WnzD6p0n58Sql0tFRy6ps9B69+BEWm5dGAuTUjaODc4N1aXdGVpNdMYYAc?=
 =?us-ascii?Q?+TcLo3xEfJx+dMOhW3y+ufZkZ/qdXmQYQLqHM8Bq6rC9Vk+StlwvMmp1pHvw?=
 =?us-ascii?Q?cr0oDvj9J7jKH8+m0Ti3mqlDcwwz0Ec47zulLjN64pVGoi6MdPylPUt1pV71?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06357625-9ac4-4090-90c2-08da5aa164a1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 14:04:05.2765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnusoL/p/6ppnQEww/rqQrvdbjsyehoxHsNo9OjWWtqlllzZoTgQ3KFION/49IPHwPqqWPgMl3PE/aV/eWtN5QGElzR2+uy8TiGkElK+LX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9322

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Hello,

Sorry for the late re-submission of patches, but I had some
company internal work to take care of. I managed to include the
changes mentioned by Stefano S. and Ayan K. H. in the discussions
for the first version of patches.

Changes in v2:
 - Dropped the patch which added support for DOMU_DIRECT_MAP and
DOMU_STATIC_MEM from the set, since it was already submitted by
someone else
 - For PATCH 1/4: Added the PREPEND_PATH option in disk_image script
as well
 - For PATCH 2/4: Added support for dynamically computing load
addresses and storing them in variables for each loaded binary,
along with the size of each loaded binary. Now, there is no
hardcoded address inside the generated script.
 - For PATCH 3/4: Rebased
 - For PATCH 4/4: Skip adding boot command to script if BOOT_CMD
is set to "none", instead of via passing parameter to script.


Andrei Cherechesu (4):
  scripts: Add support for prepending path to file names
  uboot-script-gen: Dynamically compute addr and size when loading
    binaries
  uboot-script-gen: Enable appending extra commands to boot script
  uboot-script-gen: Enable not adding boot command to script

 README.md                |   5 +-
 scripts/disk_image       |  37 +++++----
 scripts/uboot-script-gen | 169 +++++++++++++++++++++++++++++++++------
 3 files changed, 172 insertions(+), 39 deletions(-)

-- 
2.35.1


