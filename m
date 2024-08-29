Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C709680FA
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 09:53:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785550.1196969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl1sC-0003Qs-Ca; Mon, 02 Sep 2024 07:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785550.1196969; Mon, 02 Sep 2024 07:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl1sC-0003Oj-9i; Mon, 02 Sep 2024 07:53:16 +0000
Received: by outflank-mailman (input) for mailman id 785550;
 Thu, 29 Aug 2024 08:47:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z4Tc=P4=vivo.com=shenlichuan@srs-se1.protection.inumbo.net>)
 id 1sjaoV-0007pE-Qq
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 08:47:32 +0000
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20600.outbound.protection.outlook.com
 [2a01:111:f400:feab::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53782ce5-65e3-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 10:47:30 +0200 (CEST)
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by KL1PR06MB5942.apcprd06.prod.outlook.com (2603:1096:820:de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 08:47:22 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 08:47:21 +0000
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
X-Inumbo-ID: 53782ce5-65e3-11ef-a0b0-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eo2rNVowKfOj8Ezv3VDhMtAjioyTNa5L6cS2sH3Hg2gXz7QHQqHWTmLApYiP0C/U+zOMlHunY6Scd5ssgAKxCVpsqdkoqjC9WBNT39+9NZeG6O/JaMAfuIJ681wLP8mvmmng/RPjI24LkA3mN1dPtdpj5i+uJYcT7bn5pxkme6ecxEuD8M5G9zaoWbV3hyFqgxS2AVR87VqW9CvB+iSBjwjKvtUyuocBH3haH8o3phwUAeaf6FWbdsfWHOR5kt9S/lfIeTsM9l3aU+nUueCYD+cSYgR054/FMG7QL8v7sr//ZIEMRQuFWgENXi+zW3kWmliINxn70TCT8tmygTX0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b500lignV8qxF1i6AiXm6NJohaiRaqtiMNSYa1YkGLE=;
 b=DNgmUu0oL/TVdRKmSYmvX5s7gueXuM7WxVnTSAnez30xeuKBnEKANlDU9FADtZhjYffrKnoEZKhqzOHyIuBmwe7ARM930S+3TUAi+d7pGa9B46K3V2PjVIEG1GSvlLgNGB3EDm5sHjIeS4D5F1OQ4iyd6J7nAKptGWMPxawtlUM95/zi8m0zPv9O7wmURFMlR5qmBfEr9taXJNPdmRIPRjA9GBmgfQ8craoTx1k6ZFQIDOLdiPZNl4GJMMuOSoBXx0F3vwF8urQ5tyhooPTJwyH9snAmLn/m6NQzvZCSE1YlMCFmgbsTpZbGDh4pKVnT6BhD5qqg2fRhTJ6DzCSAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b500lignV8qxF1i6AiXm6NJohaiRaqtiMNSYa1YkGLE=;
 b=I/zNwuxh51psqZwioXC8oCmpfXOoVtnEMoj8PbjfmqfVLoa0Vl5i+TElIEEubygqkT72W7Sc6WO40dRge4NGCZjUvtV2tfzEXA65N0bsAiJpZRiky2fs8cDo5YrlIJGRK/5TnTwkVqGQEsYRB0RmSDJdK/6kkdDTN4V+hIM3+psYrQqRaMFojf0vtzBacYDY4pYsVCh1928cL/opzZeO2FRfW59MBg5dv6CQrQDxSNM/fkG3YBmBSP5sblgQmUg8AJgzbP5xA4DTGcXyjDJ9xaebXxlsWYmv/rpZ/ub9eIf8BSxIVC3yxWKv9om+Hb9niJOn1QYiwx6CgI47WOc9VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
From: Shen Lichuan <shenlichuan@vivo.com>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] xen/xenbus: Convert to use ERR_CAST()
Date: Thu, 29 Aug 2024 16:47:10 +0800
Message-Id: <20240829084710.30312-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TYXPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:403:a::35) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|KL1PR06MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 63fe6e8c-0a55-4558-9ec8-08dcc807326e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UN2IgSzRleQMV/lTtKTy3h4lLJjcNNKEXVsMktMZs8RgRzLFHcKxJE90kWpH?=
 =?us-ascii?Q?wfiecmm1WFrEz6cfiG+oev5nExyNUmSSFu4U7ONUllBHTiJycKq4qIGdSciV?=
 =?us-ascii?Q?F/VZlcUNWzZtWZ0nhDRswXWOF54HNOTu6ota68ACvLucQYrqBNcbjRHR79BP?=
 =?us-ascii?Q?nUlArXeYfOomG2kQ+gfcgbCKnHWcNfLYHIIWrWBjW/mE/O/mBMqImYTbYhLK?=
 =?us-ascii?Q?b3VNNOoOWp8xPl8OTMbYhpgu4k1f8qIO5XF39J9dAkWH+bqtmdwyOashTQsu?=
 =?us-ascii?Q?RcEYURi98JpfsOnME9+83uNESUOKKwLhzL25TCI1X7g2vFSv780wp7pLP76x?=
 =?us-ascii?Q?kg1IUx9fedK2Mmj8OVar1Kmjm7GkeMXHX5V5880gDf+VeBf/JZmVieZKEUL+?=
 =?us-ascii?Q?05QgR783kT4ApMvPzjLIuL4o9UZqYgyrljFpdivmJgXlOsbOjc8Izi/CvcTo?=
 =?us-ascii?Q?dYkQXKztln797a+CN+wecvIVpBgseKEAd4EQxa/J3N8/0oxrkyZmD2E9N68I?=
 =?us-ascii?Q?TrD6sfxLRn3JVnJ/b8Glc5wx5/KqAcF0Ro1nOzQ3lSDuDiAudiSlHaCGMXIt?=
 =?us-ascii?Q?/wU7CRq5z9w6pNFBPxt4bNbXxneAN1vXxa4Kd5FPQZmhBuc99EeFju/pP6B9?=
 =?us-ascii?Q?LoVQX3zQGGv2k8mfogYF9/HI3A1HvwEfRTUZoTYyzePQDXQEZN6JWLqjaSSl?=
 =?us-ascii?Q?mok/xHi6rg0K4HQNzj5RMnnf5+PRYef0XAsgaEseNQuhHgY/zLDuO0LLVFz/?=
 =?us-ascii?Q?7l4sm02LevJ6Yo/wd65CSZFCQg1ictQGk8ZmyGwLJfPSFXAZJMjZPjb7ivVW?=
 =?us-ascii?Q?ZScwV9PbsghfJOHXPgqIjsdCl7gxAx2pzVk46S7Rk64qq+PRy+DNs8Nhoy2s?=
 =?us-ascii?Q?m32SJI8WQDkzoeCeQ5DrgT/lOe+snt4zX6a8rmJ8xv/HNC2Zm5Wqe7kEp1IH?=
 =?us-ascii?Q?NVL3XYCZkPkvmy8kIVHrqybtts9c7xnVnTfljmoirjVZ9UlE6q6wx0XX87TG?=
 =?us-ascii?Q?8Zml+uH18l/1PZSIa64AFs5Q3zuHSn5so7N17W502QrVLnvdImUxKMKI4+2L?=
 =?us-ascii?Q?9zD8w2W+76vDCnnDl6Nzyp0yiYHKhSkNhBaE3uAYuFwLtQ/et3L9i9qdmABd?=
 =?us-ascii?Q?TNscYJhGlNvTP5HL01GOAkXgJl9VMDEHPkJLz3TDhfX6Dj6oikDCXEKKZFKf?=
 =?us-ascii?Q?+wn5xs9QWV0FNrXopiowIDMZZEfi0oW//CNX22AX3alIgks4PiE6yt6yNAvb?=
 =?us-ascii?Q?xuoZhd50SaTRDvQrrDpX/zFUuwJZkE5KnzxS4qZzV48DB+WFB2eCaO4VtyGK?=
 =?us-ascii?Q?hs4cfpBq7FSs4g7FIx0F58UX2H0ye1YPNQTAHq0b2xc75Bgfnu61yIpCfjor?=
 =?us-ascii?Q?6MIDBjyp0kCR/5CBC/bnG02du/U0KjxsGwH5AfoPZgiExUVdsg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FiDEyz4/tF4XmV+wGadzZRYjXgJo1ij+XkYDx9eZqACUv0PwjwxxDK1cc5pz?=
 =?us-ascii?Q?lTaKGQvZffH4axVNXU/kxRrmtKRJ2+YBw5Ue+UslKLZYbsHGVdAPtvNr1AZF?=
 =?us-ascii?Q?S0EdvnIKhP+Nc4JSBkbAM/upgBzccc3079EmCsheNg6Npa3CSf84XwFLD/sx?=
 =?us-ascii?Q?S0qXXSG9wJsO0+XY4A22PLiqTrh0eO/a+iVVZEna/Zlt1zb/g8O0c4nsL5Vg?=
 =?us-ascii?Q?yP3WppxpgfIffN4sEnpFdqq89Y61O2U0FXZTFjH3T1qKn7JjkT5C3+DNvkC7?=
 =?us-ascii?Q?00cudv7pBE0yrYa1HOFqxK30mXUiDyoatIXqx0wXVxoCNAztbzmTROwbviB9?=
 =?us-ascii?Q?dBbGNl6XnY+Q7rQxmbQcgwTmRSHt2eROGe5TiX+opByqZY1V6jVGjFmXIp8+?=
 =?us-ascii?Q?DArKNw1AIBSRNxiMJcjtk1APr8H9myBeqhVnzb+4OU0KHSlOCr4kmka3Xe2P?=
 =?us-ascii?Q?TMcyGen/V2VQSjGW8Eu/cjt/9ECiMDuSjIAwfGD5rFmRfY0imgRVQP8waiz6?=
 =?us-ascii?Q?cnIbLnGx7zoLL6ZDa+6JjeDMHYBsxunzBqDSy19Jz6tJJClSF1yMOdNgpr/S?=
 =?us-ascii?Q?HvtMbwZGHjTy9Tg0ViJc6aZ+xcStohy4fYUdEi/ENTfVR4U3xgnPn5fwWsyQ?=
 =?us-ascii?Q?Mt1hZg7c/H3xUEraqOHeCUZiX4JafX4ewNN2ZDEx3awvlj9AQ5YiZaTjrr4B?=
 =?us-ascii?Q?3A2tzA6vgIjt0q79OM7a74vmXOHX/hkHuLOCjiEzYtx3nBbhwQTQuemy6DqH?=
 =?us-ascii?Q?72C4d6yCDUghYSY8jsydbvvxt4u2bQ/BuVovxvgCwAFNqPVuo5Elf9Wyye6G?=
 =?us-ascii?Q?LdJ/spPmbL+rdPkdxfJOAmNFAnW/1xNSUIC53XMg8lSxIA03lrIfShYwYYPO?=
 =?us-ascii?Q?ymypckXmNOykgwdr67o6VNOAMEXQMXBkQ3qSe9r4qibCOlWJkPv6dh44Qt+Y?=
 =?us-ascii?Q?c+TRtrPN/pKQ/uM8TyhtbHWOO6n6NTg9SFkg5iHzJw4GgbKI3XUKsdwAmqNJ?=
 =?us-ascii?Q?QglRXq8BA5BJYzV5/6jVWl9vuiz2VRR+Eycu8KCYuEHFwyw45pExc15N6yup?=
 =?us-ascii?Q?gdMc/muFxJKFQxwTf2xNSdE4jjc0kTR80/LSNDGSDXcM/DWvkve043iyf8pN?=
 =?us-ascii?Q?hyRxf5nYXnCzJ6mHbFTL1IBYoxb9PfbgS6EWorFCVF3zaLUi9em0jGVH7xkY?=
 =?us-ascii?Q?2DqROqCRajtcyq5vlsa1hdrtpRYemD0736sc53xV0hjjM7s/jpgONmSJx9pg?=
 =?us-ascii?Q?zaMoCybJ93L6T2PY1ZBgmd6p22xy2UZmfmpmGHgpMUFIOjdesbygvoN61oSL?=
 =?us-ascii?Q?7ulfMv1jht5LcOoUI8Z2TAHyrXYscgpDsfE7NIB4nD5wPOvrx0yL2INZFC32?=
 =?us-ascii?Q?uHVb3g5mAPCJ/RDbRrQaVgKaOQ/o3UROwu5EnA2RYkwlHN3RtGVXzoOtVl4W?=
 =?us-ascii?Q?kNPpGpGiIJU9aFa58taQqXZNC8ophbB8CFWYbYAVeJMY+JPh1qDiow39OsZo?=
 =?us-ascii?Q?U1kCP2g0g4nlLQPC8F46JMBlK9u/3zFIUBV2fbAqr7PBgArXeml/88skWyq/?=
 =?us-ascii?Q?TfaXGnravaTz1KZyoSxmU83U9mmVS25DQbyawJm2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63fe6e8c-0a55-4558-9ec8-08dcc807326e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 08:47:21.8505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pz1Kgi5kucEOMF5kVu7zr+srHI/G97KRb5Zpw6SAfCp2ox1vir7CBfvNsIhMUcVlWzTf7ltqFq6nigwLMvH2vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5942

Use ERR_CAST() as it is designed for casting an error pointer to 
another type.

This macro utilizes the __force and __must_check modifiers, which instruct 
the compiler to verify for errors at the locations where it is employed.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/xen/xenbus/xenbus_xs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
index 028a182bcc9e..d32c726f7a12 100644
--- a/drivers/xen/xenbus/xenbus_xs.c
+++ b/drivers/xen/xenbus/xenbus_xs.c
@@ -427,12 +427,12 @@ char **xenbus_directory(struct xenbus_transaction t,
 
 	path = join(dir, node);
 	if (IS_ERR(path))
-		return (char **)path;
+		return ERR_CAST(path);
 
 	strings = xs_single(t, XS_DIRECTORY, path, &len);
 	kfree(path);
 	if (IS_ERR(strings))
-		return (char **)strings;
+		return ERR_CAST(strings);
 
 	return split(strings, len, num);
 }
@@ -465,7 +465,7 @@ void *xenbus_read(struct xenbus_transaction t,
 
 	path = join(dir, node);
 	if (IS_ERR(path))
-		return (void *)path;
+		return ERR_CAST(path);
 
 	ret = xs_single(t, XS_READ, path, len);
 	kfree(path);
-- 
2.17.1


