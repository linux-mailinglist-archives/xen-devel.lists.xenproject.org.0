Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D475F0F6A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 17:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414301.658505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeIQ0-0005HM-JS; Fri, 30 Sep 2022 15:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414301.658505; Fri, 30 Sep 2022 15:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeIQ0-0005DU-GZ; Fri, 30 Sep 2022 15:59:16 +0000
Received: by outflank-mailman (input) for mailman id 414301;
 Fri, 30 Sep 2022 15:59:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi5f=2B=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1oeIPy-0005DO-WF
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 15:59:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3e68156-40d8-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 17:59:13 +0200 (CEST)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by AS8PR04MB7991.eurprd04.prod.outlook.com (2603:10a6:20b:289::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 15:59:10 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::90be:f320:716c:5bf8]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::90be:f320:716c:5bf8%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 15:59:10 +0000
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
X-Inumbo-ID: d3e68156-40d8-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXS5iPq5qlqtdXODDEJczn1rcgkZr0T3n29C2XfinOFA5exB3pdpEqxbJdIrwxxG/jDyPXRFU4cpBVbhtQxA0KBNiLJP/BnZBgVqWYUFnbIMltXiS0efz8r4XWpTL9iiXHQ+KWjpT8FjAoJlODWo/Ml9Zf+aDaYelwkKG1nIiGtuOrmDjpZ5R8Sy9CCoEDd57ykLg2gWgp258lneL/fw2cCGAGVV8Wyp7qXrk2y/7v9XVLkk/w8RJNodu2UvqtkterAOrv1NEWTvRI4GXfLppCnwLl+6y+lpj9b6lOakPGBTTmB0pIABnmLNYW/C26AqJAqKgdb5cLGmZMsokAuPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/3yUG1c11tvYKcCImeHGQqZxgmPU/OgLyrCkHuKjaE=;
 b=OUW8vDWYreFzdITxXex62lMsF1syrfT1j2a+l2aQ8hjw4ePC4581ETswCq02T3pwhPWRfHe70YGCSI59mguhhgsNdkISsTm37PboUbsflXcMoOq4cdelxvtJ44k6ytu4VKImwdL9n6dqUGwQ4vyCSuBVlwUlaxpZa8IkEFRecAS4vOPD8IrG2mdKNTieYUTF8qaId+AmuYe0ied59Z1+te0KLNV065yxCQfaNSLevlcoiwM4gtEffyuK+13D7jEudTJfUhYDrtEC1nAJFRUxGz17hUB98+9XkUGrhe52fylEgfBezyR8d3W+QPLKqXXUFlQ18V9qGRJmy0CMs6ULTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/3yUG1c11tvYKcCImeHGQqZxgmPU/OgLyrCkHuKjaE=;
 b=U/WupuXdpxUYAqNHh948CICCxbqP0k0frlxicswLWmCW0DMJZSQQufQKRKEGYQWGRAfq7yoiwTNeHHZTYBO6wwS/+O559Zw6RPHqRR5yNoR8LNfTHJVn8ZIPsSgKsdD82FpeCo7mvPNGQ4EvpbSBIQ9GsnHAYLiGUhnfrNnqnZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net,
	sstabellini@kernel.org,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [ImageBuilder][PATCH v4 0/1] Imagebuilder dynamic addresses and sizes
Date: Fri, 30 Sep 2022 18:58:48 +0300
Message-Id: <20220930155849.2210574-1-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::13) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|AS8PR04MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6e64fd-2af6-4eab-f40b-08daa2fcb66b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fc5E6Uz2SdaDk4ge2XpVOHYehI24NG8TiU13HhIPk9qiIjzmxBMJ2Rp3pxYnBRbTcVofZTHzucIbYlwWLCw/36fWoF7WuOv/IDhHq44umgVei5xWPk2sMIR+ZwiNgz8OOxf4Vchs6iv9z2ySGnT5/e3PGDwx94PwvFXtpv+gevlulnUonK0HpWFSXaGAz2D5guwaMLuTkCzgcWQelBF/ulciCwcMWjyUK3TUn39HHZgkhx5hgJ8/VqNN0838l/fpM/nVzsTtxktzmSTRcEIJmEq0DESAxidcI5EJjNUvkm2WfgZs8XWdnTAp1Fp/0wQXLFQy4qq/ncmq89sVN2b4G/8M/uiBjjPKG3N0/ZM/kYo35L5AdmI4+9fsuLnkOFvWxtk5wXYvvTCaGTfppkbIWJYo83fRkHFeEqb11v7VMyaeYHuxpDmeCtJm9qH/68OISnNDKZCnRtSUWZcisuoMQky66k6gj7qMNbOWoVY0w/C3z46A6GCWMDkd7pFVDzfejZNarxvxCpEdllVzdGb9zI0UpiwSRb2GT8W1EP43K9vmvs8E3nnsfD0o9g32sdmhSIFFAN9KDxTc3jbxfelaq7sibgMePGXPyf8N6hsBgecdp1RrULNN0h9TSVQaqz+jKBMOublVn5ffpChfbCMutCZyJR9dJMOo/kb0CakiM8H1jqEVWAM6Qu7zntC57R2K7ZAPkTgtJXSi4up3njg5eAGUD4CJaSmbe1u9/xSmKkE3ZzooMgXL4LnBqQt1r7bu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199015)(4326008)(8676002)(66946007)(66476007)(66556008)(38100700002)(6486002)(2616005)(186003)(478600001)(38350700002)(6506007)(1076003)(52116002)(6666004)(316002)(6916009)(86362001)(83380400001)(6512007)(26005)(8936002)(41300700001)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w2At8N316aica1rKTB93dEqnVoLajKraOX9qRSD9WnqYo+GkqojtqdqRjCZA?=
 =?us-ascii?Q?qlfPbN2iAQh1n8qpN9284UJI+MK3UIQGTgROrF5f+CiZSx/CAFzcmiJfCRyO?=
 =?us-ascii?Q?In+YlT3MlOTDZ3ascJ+f9VcMvTti3ywh5PDfwwEAYtXAi9adnJfK+8PsR/uQ?=
 =?us-ascii?Q?MxYGXMm3uUKlpADTBB1lKkUtgWt5jyFNuKEOsByKewHLFBDlyq0bVVcdiNwW?=
 =?us-ascii?Q?MDGXP6sbLLVkzEeSX/el4Rl0X+w7o20cIyfcXFoPMUMZLg4uRG+efF7pP4ch?=
 =?us-ascii?Q?PJK1NHLJcpWX62V/Az/UrVxS+5wBLtsPw9SRTi73Ux87V+9PDs4BNBYh0obb?=
 =?us-ascii?Q?qUj1BD9whBkPv5AAU6ygGWXANGlD++WqPFPOUUBt9Mi5CQ7IMBvIfJQfXvso?=
 =?us-ascii?Q?kiZHGBSO6kFsk0383SxExJ7mVD1EY8dC6UJ9/cz6Q83pKHcUkQ03HswW91p8?=
 =?us-ascii?Q?RRq3JQDo5v8pGaVxLAgn7GeO2ydY2NS53qSX2t2Dhua4eD6hj1SAu/h74fFe?=
 =?us-ascii?Q?90HoMoRabi+UUaX3CzvJYNeEArcIBKRcyoKg0XLkVSl49TbNWEbWrxV36W2Y?=
 =?us-ascii?Q?8tXzWukvc21k/T2UQj0CulXdCOkUGE+zHjjUMrXxeZLlVXnGue+W6Xru8SBr?=
 =?us-ascii?Q?i6SS352NGl5wWnagfQJde31esda4bchF5+dN24INx2/VjztHs7X/HHAdUIHJ?=
 =?us-ascii?Q?Ja5bEMM1bMRRXs0bjeUTknik8nBCjf2ukbpOcgb3o3++cpIlGsZKKT90wBOa?=
 =?us-ascii?Q?/RB2HT+dJppyX38Cy1p/+2CsNbXuTdw0v9l6QrcbfG9Gzy4yl3xau5yjsmyP?=
 =?us-ascii?Q?/tYi7qmk8JSnlex9eWxLk09RvLIFjJ2xGv0o2z5qP68AeTceFLUzWMia+pvA?=
 =?us-ascii?Q?OmyPNQCK+fvklFfT36jRtMvy2YXMpUnskfWOOKf1jA2lbTNA/t0JnffQfVko?=
 =?us-ascii?Q?Lh5WAf6vhl6MmtQ/S2E498wd25SI9eHvt1OgNKzdu6vn++UNec+NsrlHyoek?=
 =?us-ascii?Q?oMl81r0nq2tihRus4PZ2SpimEPWTcgJRKsmCjBVBQvzYkz3UmhHd8/uo1Vun?=
 =?us-ascii?Q?rWc3S0EtRDAvhnfYFygNSr8kLkEYy/7puVqH695GH7/LruOMTE9HbT0Xa28Y?=
 =?us-ascii?Q?DL3ZUyYLg3JlHbSnT6UAiXT2UyM1VDI4sB1FadktpaQWjF/1XP2qWSW0zzOc?=
 =?us-ascii?Q?NYYPqcE5edOU/KSfAGpqym8zqNmnzrM1w1JXKCAfPn15tWwsE19vpeEMQT7C?=
 =?us-ascii?Q?oK1+sAgsjSTbG6U1y4dEGomBlta+AIEkrv/DSU7gduCVgvjdVwHvn8szMEFi?=
 =?us-ascii?Q?yfQeFqex97bJKtVbVWjqvsVk6o+VsLjgVGUnHvJjsMIWqxRsZdqwDZem4PfF?=
 =?us-ascii?Q?ji/0rzJ8cTY5y//b64id4HIsA0Wb55+uB/jD2nLQUH8q3j/7l26Id/g0geT6?=
 =?us-ascii?Q?HXPcDqkNUWbSb6lFQsBNWuiO21pbOW3ndtpDRcWVQRLGU63OxhgzdCpr5ixn?=
 =?us-ascii?Q?kowmkfOdOWaPXNdwZgtQ4EbZIP0m9mA6o2KCj1A+2e1vtWDNaeU62MURedhY?=
 =?us-ascii?Q?gSJencpQCSPffqoXUoBvcBhAbIyvLIaaKk2CefIWV/5kCYKA71W4hGrjkYSL?=
 =?us-ascii?Q?1A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6e64fd-2af6-4eab-f40b-08daa2fcb66b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 15:59:10.5457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKVyyG/Lw7NZ7sWmaeHSAuhAevyo48N1dQ07Mce9XFtIq7BgKge+d/bqSX7+4B3EoZlgv3ksvKB/7cMTj6COSpTUEe/Jk5UcaO6nYsEfP5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7991

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

This sent patch adds support for dynamically computing the addresses
and sizes for loaded binaries via the boot script generated by
Imagebuilder.

Compared to the v3 version of the patch, this includes Stefano's
suggestions of not adding as many "if" statements on the
$dynamic_loading_opt parameter added by the patch, along with
keeping compatibility with the FDTEDIT case.

The sent patch extends Stefano's suggestion, by also keeping
the normal flow (without "-s" parameter) mostly unaltered: the addresses
inside the generated script are literals, and the $memaddr variable
is not re-computed after each binary loaded since it's unused. The
only difference in the normal flow is that the binaries' sizes and
addresses are stored after loading each binary. Also, removed the "0x"
prefix of $memaddr set on the first line in the generated script.

These mentioned changes, compared to Stefano's suggestion, need
an additional 2 "if" branches on $dynamic_loading_opt, which I
find a worthy tradeoff for keeping the normal flow mostly unaltered.
Otherwise, I'm also happy to go with Stefano's suggestion, but
the script generated on the normal flow would contain many
unnecessary steps.

Andrei Cherechesu (1):
  uboot-script-gen: Dynamically compute addr and size when loading
    binaries


 scripts/uboot-script-gen | 114 +++++++++++++++++++++++++++------------
 1 file changed, 80 insertions(+), 34 deletions(-)

-- 
2.35.1


