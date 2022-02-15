Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615C94B60C6
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 03:06:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272742.467712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJnEe-00061E-Gz; Tue, 15 Feb 2022 02:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272742.467712; Tue, 15 Feb 2022 02:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJnEe-0005yM-CH; Tue, 15 Feb 2022 02:06:32 +0000
Received: by outflank-mailman (input) for mailman id 272742;
 Tue, 15 Feb 2022 02:06:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A2Di=S6=vivo.com=wangqing@srs-se1.protection.inumbo.net>)
 id 1nJn5Z-0006If-Cr
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 01:57:09 +0000
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2070a.outbound.protection.outlook.com
 [2a01:111:f400:feab::70a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94551c06-8e02-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 02:57:08 +0100 (CET)
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by HK0PR06MB2771.apcprd06.prod.outlook.com (2603:1096:203:58::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 01:57:03 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:57:03 +0000
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
X-Inumbo-ID: 94551c06-8e02-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqMzXTCvREqgvmRJE8BFHSMTClFr/mMKiTA396izTqlCirA3knCZgR0LSvqz4ncx5esm0uyXM9goC0lDhU3QNWhxAFFnFoAcEP/W97rOwMVrF8tINIqu9VMi4g4/laPYb2UQWSktkH89VA4IyTP2iHaafyKUWnG7kiqUL46A/XRnJurfd0YLDuE3XPksDFbOzdaoi18ip5tKIrTKWM8bZ7X9tXaatKWOQbbDRMO5nhkodi+9lk4NAr5UvXDtFqFxC0eiABDkcGSDiNS5bpM9letHPZ3ML9hr5Nmal3s8KWrlF5izgztSZaPcSKAUsje5tYooXuwD531itaHqjABoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cC6buop/OtXmLD1AULbZQIagQssITz/oNl9j3S0vE4I=;
 b=gWkBJc+pPWhDXM2BOpIMcljgkFKg6NqhNx2IT35NIHdKKqdYinssJ5UsQRMgLBNDuZgiuhUS0COceGSABKHH+njvy1tbnUtoxb95zqQC5tcVJ3otZ30cm+9OZmpCwWXbBCDfGMM3tW3cypjWGErBYwgUgVs+iN2JPtrQcFPcXDPULgfEYnAuVZBPOcQ6GT+2N94m9CntYE4C0UKJWYX4xi/bB5im+auD2iLvusqYK/iEcNBsI6ZFZfvoj7VtfU/YmUxkmxRoy7A1t+GF7oG0Cs7FocM7Lx6Sr3QtGkl//PjBbDrZDCPX6cl1U5idlTqX+fFpnKx4A9qy/mqxTRvw2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cC6buop/OtXmLD1AULbZQIagQssITz/oNl9j3S0vE4I=;
 b=CBZ9XKmimrLI5a5Bm4sVwboiickFbQ8A3dOB0fQPU3JPtPOG/Cm7ArTeJb7uJwf1Tsc/2rfkJ2IdIiCN8bwtuptnEogLe+9bzPoJ8IX2G/UnHhH2zZRGvGUA1VoO5C7wEAuFi65clE7+pDTOBPZVxq4ZDe05Ag2Ib3DHtVZ0hc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
From: Qing Wang <wangqing@vivo.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>
Subject: [PATCH V3 11/13] media: tda8083: use time_is_after_jiffies() instead of open coding it
Date: Mon, 14 Feb 2022 17:55:48 -0800
Message-Id: <1644890154-64915-12-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94ca7f55-53b8-4f22-77cf-08d9f0267652
X-MS-TrafficTypeDiagnostic: HK0PR06MB2771:EE_
X-Microsoft-Antispam-PRVS:
	<HK0PR06MB27712D4B9B1228657612CF57BD349@HK0PR06MB2771.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gV2oF/OyYcAeAm3Z/ywQFp3c16XzzbH9iWeVLunxe43SBoP/9cDeHIVvXGFrbl5hyT9qw6wb9GTJ6p5LeyeWYmqPnQ+zLWuflUnNBv/4424U5jg8T2xxqcp3mrhNcxfd5rSpzqaY5Rwscvfb7eRHwch0DpK4wozaZKYqm1tfbD1/cTBHKDs8NZc/gzC7jnJi5YZxQm7mKEt5RAJ2M10E3RvuIyL6lSM3Bwi63xsUUDEngg/cGCX1112Lwk7k5Vk+2lKkOvaciLuNfaJ57e7k+cODf4I5nNvNxiTmdkYhJdLAysmjrFWn4x+O8FBAROaqqp8fqBUejYXCCBnptKwCGAcZR388X3FAsnFHHe/cw2KEIpXslrwP8qh8CuZpTLHgUlciy34lsTQi2m0TnDsMk0jK2KIJBnQg3kDfSxCREokOLWlxOdIXiVAvutyCDogNTbIwdGt446x1kbCGnTcrogKXrfQViqpN5Ief7SdhqhqZBdhfbYbBYYSnTwxkxtJjclRfbzitHpDb0C2X0LDRAdj3A4txuQsihLT+6GNsoGo7MRWPYWL2HjeaBlvNZyEJZTs2hLtAk/eidy5JhCNzkY6bRXc9mncdXZvsEHGDveox7yFQsA6kYpufdfd+XjY4h1P4lnFV5NMwyheCnCR7MU0SpXaXedHQ/3mOCz1lAPLxWCJe3eemodj6x2LfWgBVE83pigXnP9rl7jw4RDj09gdbIliXFMdn78bn4cSQGQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR06MB3082.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(8936002)(83380400001)(26005)(186003)(6486002)(508600001)(107886003)(5660300002)(4744005)(2906002)(7416002)(7406005)(921005)(110136005)(316002)(66476007)(8676002)(36756003)(66946007)(4326008)(66556008)(6506007)(6512007)(52116002)(86362001)(2616005)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5MercmGQ9TFzLOeFladCcko3hYvfU5SNs9NOw2+9D7L7k6I0GqVFlOmmJrgq?=
 =?us-ascii?Q?OeLdEejvjAOM9iQNatT/3Ul4EuLFDAPSGEGNRCMPPrbEl4ZtSEEoHvJbGX5d?=
 =?us-ascii?Q?4dTVyLK8fWRpfESUPAtM58keC90j3x+tJ2ovvZIiKR5QcrYiY29J7XsB5V8E?=
 =?us-ascii?Q?ZYyWDoR6BSamZKMmp74V6WqjUm89eqmJN/MT8fqzl0VEay4ItxpbpKUYVgbB?=
 =?us-ascii?Q?2VaNG71bB7BXNzAYY0BhbOCLRcveSC/amCp6DN1Gbs+UQMFhkIpAXWMlLbgP?=
 =?us-ascii?Q?Nk9tgcELRWyuDHqkgy9+H87IqJEHslRUN2X+ykP5NCXvdiicVpNc0g1WzKr1?=
 =?us-ascii?Q?wb7aQa0wTxlgA7XXtLnUzXC/cvi5QObIx2NN81Lh4076pRBm27AQ36bCVJiV?=
 =?us-ascii?Q?EibGe3I+zx6XShezN9vLMRRmOo2XkI3MyNNEFaCQXsKI52aMDLDrttscU3W5?=
 =?us-ascii?Q?p3pquY0GGWfsV06wkhjI9vDvg/nvoQrwoOzmO5XwcUTdsYt/3E20HX58CZzz?=
 =?us-ascii?Q?rWuwk1uEEr5CXT9S5ZM/O8C8N5EQaHYbZM1IXB86S/bBsDYYXNZr0oiUrZAQ?=
 =?us-ascii?Q?5bebvLKa9VJZf1N4UwRQxuJjq5MPuFrmTrzLNEtJ8COwCAzQ93RearXg9xIg?=
 =?us-ascii?Q?j+Ksnmj3xxmMUHmyHg61nmPV7gKHTV+nHhDL+3Ge+BHgJZMUg8FURTmo6npM?=
 =?us-ascii?Q?6VOHlgLBAF2XX1bWMzYV4XUsPjduRipv2yauRp8ApM/4M17R4/YWTQCbs533?=
 =?us-ascii?Q?6caxhl3xrflEJOa1dDdmMIPjvbOuDSrG2DT5rHM9NoTFwsHOJKa4TQVTFtpj?=
 =?us-ascii?Q?nwqNZR3GomhjHPAMmZpj1gGjPUBwCTpuxnd8oeCQt+mhv3FEhsNQWfIPN8IU?=
 =?us-ascii?Q?FWYFIrMyd9FhJJ+c52wEBfgsoOT/HQH9txgCtUP/T4baq2+70aKIsGDyq2+9?=
 =?us-ascii?Q?TfjP/8yrkQAEVeBRoKBHJPIAxDlpeC/B6x6v1g0AMqqZrnxFDPGMNkHYhwMc?=
 =?us-ascii?Q?XeNCxwg4xaC0p3D5nwY8NxydR4y6kXO0EagMa8nVy4q2GYx+R/GzaKPmjaA7?=
 =?us-ascii?Q?xd7I1lSBfjWrizETDcezgnUZT55SgJ+ZSmBtmU50cjPtGaaDmZCfSpj9GFmW?=
 =?us-ascii?Q?ypBWARMZI2UK5YsR7rB6TA72Pu0ubN1pllG1W6A0dGIdCowHCfGiEDvTda2I?=
 =?us-ascii?Q?1WFBQ2eSLYPAvYIuQfV2cnb4ku6eSk2aKAOoXkfHjr88hr7V6Tvuzla1adIv?=
 =?us-ascii?Q?J46sXCKnmkHbKiRx4x14JcR/684RrDlQwWJeq1M9H6hBEOnKVyaFWmV/51fX?=
 =?us-ascii?Q?OZYD4yognVtd+e4sqC2zDpeEioWawPl2tmkIL5uWsTBovrH7tcKzBks8R48M?=
 =?us-ascii?Q?DLgqOBJcZyHCUEI+1LWR7tIOeI5OmmZBTJwVxZqeSZAB+tYnoE43YwlcTLiM?=
 =?us-ascii?Q?R7TDbKvO7nZGR/aj5Ejyx/8DwDADM26HxVjaFK9Wgfq426C9nVyLStuq5H4c?=
 =?us-ascii?Q?+fKQf0vzM9+tFxvxV+f4e7CDzWq5E/7qBCFRAZ7M2UPOC1BMH8mZ4s0rHAzw?=
 =?us-ascii?Q?gWw4undedslAcO+oTr172k07AGApDuAhaJO03dt4Ha8Je/C8zSuCZFWJvLw6?=
 =?us-ascii?Q?R1okkSX3eJUUoB7jqtLR7B4=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ca7f55-53b8-4f22-77cf-08d9f0267652
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:57:03.6675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFEuzil0urqptxkdME+hbidqRFKNvjpaAGKOrzHhgbeiM5Ro7os/lGC86t2nJ/h1Bal4xr+JCTkBo3sNx60XYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2771

From: Wang Qing <wangqing@vivo.com>

Use the helper function time_is_{before,after}_jiffies() to improve
code readability.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/media/dvb-frontends/tda8083.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/tda8083.c b/drivers/media/dvb-frontends/tda8083.c
index 5be11fd..49c4fe1
--- a/drivers/media/dvb-frontends/tda8083.c
+++ b/drivers/media/dvb-frontends/tda8083.c
@@ -162,7 +162,7 @@ static void tda8083_wait_diseqc_fifo (struct tda8083_state* state, int timeout)
 {
 	unsigned long start = jiffies;
 
-	while (jiffies - start < timeout &&
+	while (time_is_after_jiffies(start + timeout) &&
 	       !(tda8083_readreg(state, 0x02) & 0x80))
 	{
 		msleep(50);
-- 
2.7.4


