Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCAZFGaa5mk+ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE712434092
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287494.1567916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9Y-0001Rj-UK; Mon, 20 Apr 2026 21:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287494.1567916; Mon, 20 Apr 2026 21:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9Y-0001Mx-QY; Mon, 20 Apr 2026 21:27:36 +0000
Received: by outflank-mailman (input) for mailman id 1287494;
 Mon, 20 Apr 2026 21:27:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9X-0001Gd-NI
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9X-001Myj-3f
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a18-bab6-0a2a0a5309dd-0a2a4508a9bc-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:35 +0200
Received: from [52.101.193.95]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a45-63b5-0a2a45080019-3465c15f9d5b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:34 +0200
Received: from BN8PR04CA0061.namprd04.prod.outlook.com (2603:10b6:408:d4::35)
 by CYXPR08MB9429.namprd08.prod.outlook.com (2603:10b6:930:e1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:29 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:d4:cafe::22) by BN8PR04CA0061.outlook.office365.com
 (2603:10b6:408:d4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:29 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:28 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz8w0DD5z1wdR; 
 Mon, 20 Apr 2026 14:27:28 -0700 (PDT)
Received: from BYAPR08CU003.outbound.protection.outlook.com
 (mail-byapr08cu00301.outbound.protection.outlook.com [40.93.1.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:27 -0700 (PDT)
Received: from CH5PR05CA0002.namprd05.prod.outlook.com (2603:10b6:610:1f0::8)
 by BN8PR08MB6305.namprd08.prod.outlook.com (2603:10b6:408:7d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Mon, 20 Apr
 2026 21:27:24 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::94) by CH5PR05CA0002.outlook.office365.com
 (2603:10b6:610:1f0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:22 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:22 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:18 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=elektrobit.com header.i="@elektrobit.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CDNulQrxNsjxFy9qlfTSXHPMaBkGhQPEflycUpWxCCFvXHWQJvS0YszlxMJIwQrWJVjVl2dmhY7Kdl/l/yXn2UN/a387gCs0gV5MNset0XGflk5wNYY7aGpaSW4tGzhAc/P9nZ+Tn3qEiVvSRihpUDI7guznrskJ6YfUjYbwKeX1Y7ewmUWKvKqq6qw3f2IbZ1xVF9jajqm3JlcBQb7wolWQ3rjYPbt6Z84a5CcEBXOa9dWObCQB9ePS7tLk8a0sf8FeX4zftJSn7KDQhI2reFR3F96/X37EINKid/UI4d7WD9NAWIPUIiZm+c1aEvuqE+A4YUgI+fP1ms97HEhrBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P99iOPiPAd4fedD5w4a0EUrWRqEzpWZn2WgFGdQXXEw=;
 b=FDk8juPvExD1MTFRpWf0FkhMU2/fFvE4ebupIHHLoXg++HaNoGKZW2ELBC3gJ0nAuyVwJt4R5oHo7COmb6iiYN64HCv82Qmlcd8rPlohx/yeZF0BHANjqwPSDkU+GpmnBHB8p3T61jGc3MkIsjnaje3JoQ+gq7crdr3MG810bBQJOJZCOUBzS8l8stu50z1ZcnbTfhWaGCXwhtMuia38Rr8uwfaho+P/q6YGhJXTlo+NO8jHxHSB4wqIAxHMIBLx8D5Zo44XA3SchmLPL78S3fhTF5Lrkr3HGYsFwBye5Rgzz6jJudp7v+SG/03VLTm0VTxfU1vDFJmkULai+5w5hQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.1.105) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P99iOPiPAd4fedD5w4a0EUrWRqEzpWZn2WgFGdQXXEw=;
 b=IMf5xiJxu0WvtcqPyokpu/SEzr0IkBf0hOwVyjR/x+OPUQbLUevSqpux3djXhwllKJ2UEo0+9/bCmZEcyb4Xmk/4T20jhs+OTXN9i6ZdhUKG9zk10xIqUa8OOfviBgJc8EKW/ihJ4/rfQVRc4i7NBVkLUPyMHJQYwkQf9g8eO3s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.1.105)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.1.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.1.105; helo=BYAPR08CU003.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQmTHsz3h4lrisQzCeNzDcyA6Kf3OWwW+cMV7vNi9A2Co1aoqNV+UfWWJe3sqk9Bg+mz4nh2TGy7xQUhkP6512h+Cw9ln2Jc495ol/2WeuOeNplbMK9YZyE493QCkZl49dVOsI5a1t8hwDgiiSE6RW3lWcOm/L8RnFc2ZZVkLTTC34JJvW2DOuOttMGMYfhmeaKLLM9ygdZp02PwNtI0+4FG4+o7U4R7r9w1fP04aRf+PlAAbCibDL1pCptwjYpHRueKF5Ivhrs0dhvCWwZKeXCQdn6bb5JnB3j77UkfAdhSc+huDc5APr0FYnax6inTJTFXmSQEFRZeSzYUXVQrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P99iOPiPAd4fedD5w4a0EUrWRqEzpWZn2WgFGdQXXEw=;
 b=J5SqJPAkkAxH8ravMjM/vKnmJgbImhpmyydBnwnwRb+OA1hf5sDMz2c2lUU4iLyOze7MiDeZ/Tb3d/Jq0VVM8UTFq4RC84MDWWCENYKYUNpkfNqxS6YG14153jTEwpitFgZqspigLkQhBPDONKEKYMJlop5dpR5bvcl6BUmu0tVujNcm4lKVc0o/9F5xWF0Wf/mCs96LlAsjLaHz1aKSSuVIHNw5gDqqUuxirBcEYJ6X4nBGddIvFdO9WB4ahp+7/8EiZ3gb1g5qecFAtNClweanX4RV8Eq75kfGHgD3SRoSlaJPfuM/9mbgIwupbOOx7UMMeakJ+1/cw2IjUMYodg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P99iOPiPAd4fedD5w4a0EUrWRqEzpWZn2WgFGdQXXEw=;
 b=IMf5xiJxu0WvtcqPyokpu/SEzr0IkBf0hOwVyjR/x+OPUQbLUevSqpux3djXhwllKJ2UEo0+9/bCmZEcyb4Xmk/4T20jhs+OTXN9i6ZdhUKG9zk10xIqUa8OOfviBgJc8EKW/ihJ4/rfQVRc4i7NBVkLUPyMHJQYwkQf9g8eO3s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
From: Rose Spangler <Rose.Spangler@elektrobit.com>
To: <xen-devel@lists.xenproject.org>
CC: Rose Spangler <Rose.Spangler@elektrobit.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [RFC PATCH v6 14/43] altp2m: Move altp2m_{init,teardown} to common code
Date: Mon, 20 Apr 2026 17:26:19 -0400
Message-ID: <20260420212648.208640-7-Rose.Spangler@elektrobit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
References: <20260420212648.208640-1-Rose.Spangler@elektrobit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.10.178.50]
X-ClientProxiedBy: denue6es013.ebgroup.elektrobit.com (10.243.160.141) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender:
 ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic:
	CH2PEPF00000099:EE_|BN8PR08MB6305:EE_|BN1PEPF00005FFD:EE_|CYXPR08MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: 7411b43f-2eb3-48e4-bde1-08de9f23a023
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704160111799003|376014|36860700016|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?WubXBLzmLrJej7fanINaxxcWfgqqS1OY8JElSpD7csk1q8uLhcXIVvPe6Qmj?=
 =?us-ascii?Q?CDNNZ1sJz6z6sofCkBjuGkvrr9KUgq/qx9v81ISpr1z7WSDdPynJPaovSiso?=
 =?us-ascii?Q?z7/bB8/fDxIqxAjPxx3oJ0TD4VFcg6YRnHK3ylVI3W2BzKLwNfyVx7JkJUbx?=
 =?us-ascii?Q?QkMKY5OYWl8bIaWUd7XxBBv5MsLHG3m0vNi3yYxgAdug9PqC7nepGV6jy8XU?=
 =?us-ascii?Q?VNGytKQmZoFpE4n143XvqjfX6x+jkI5FpBf3+J5DMZIbWUQCyenMVowbOT/3?=
 =?us-ascii?Q?bFc0tU3yPAqW4pjNV/dSTVW2MyTV48lGL+QGxnnWJrXnsL1Vavnt9IQ/fYwZ?=
 =?us-ascii?Q?D6CU6rS6cf18xrJxCAIobw+j1/p0t/IaOjNZP15hX07LG2j+rS4iwM1kzb+P?=
 =?us-ascii?Q?khsidFFLcqE6AEJ6f1RrQB12uWBUPzXnsAJkb0neoN276n0AFmjNDpYbjs9W?=
 =?us-ascii?Q?1VWvHP5jngpwdcTl6LEjXpOk0g2vyZT7l0ONSNISbfumIm4b7QKxZNeXltPX?=
 =?us-ascii?Q?pdolQsI2i48IOnQNqN4AkvB65hHqZ5er4+BOlPOE5/mnHQxJIVeVskto9abD?=
 =?us-ascii?Q?DUgeJeK77IvNuLWMlSvx02N9d/o1JTXP49zM4facbLuN96sv5jQf+tAEgZF3?=
 =?us-ascii?Q?/qJk1SlslHXZ/9V+CwtBQPrWX/qV10KMRRFZBZOegbEGx9w8uDP334z8MlDr?=
 =?us-ascii?Q?L3L0ojmPUoWo+0KHkWLS10PXKP+D2+mpMipCqtG1wPM7GRZYTmsNk+UwFAJc?=
 =?us-ascii?Q?gjjhK9LWXIbRQIq3XCW+Gh6/Yo9G2NzCtIuDxGSFa0msFvYNlVlXn+f3LT+n?=
 =?us-ascii?Q?WdvJsN4b/Oywu6+ryBT3sZdxU1LUUgkTLs8FMF9JtPcX8bhE4NgxUS16DE3+?=
 =?us-ascii?Q?Hc6oSNdKphpTCpjPiuVlob7hInzV7Sr8/DfTVDS8+cgne96uUD7pfBUSboGJ?=
 =?us-ascii?Q?0YXrHTDFepzq9ZPAY7VNVVTiXU1IYSRWRYQU2Jk/pK1C7AFJCleaK2Gw6Uv9?=
 =?us-ascii?Q?353Cmnv/9OYN5bqeFmQNu8tuLGlWV3EuZzDFCsHXt5XIEVr12u5C3v6SsAr6?=
 =?us-ascii?Q?eOPe7JC1nr6GmOe7pAdHF91vic6r4NOOh7keE+RiFSKc464ELpOHjlSVibLk?=
 =?us-ascii?Q?XKlPksGKsI7xp1bfRbOpyYBYjrdbKAXxRXGXgmJcSWtsnor5xO8OX/2mHmop?=
 =?us-ascii?Q?/exiVW63YkkIvMFWZ2Bw/cCMHpYaXhugTeb+FQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704160111799003)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 NK5IrE/ewp4VvGisBR4/g3rY40GehPVgQi5BZJr8TRSDzZDrzqx2LfDXOeda+8wd39qhjwvsq8JSySq3S4hDNABllnTLfOM33K3Vbg265lz6Lc18y/H6HN25/wlNqMLpJvaH3XHhXGZTmbZE/CrK3pHUFcerLmMwb7GeFgDw/BrN6apARIEPPmh2AvsD7Ss5Yt1VPIw4tY7heIasM2wnhtRB7z/4h5Ob+shI5kxzrPk88EbCjrHKeKwN/m43hNptRTpk+lrrxktOtJN9c6Sv4ImJPQeHbF4iy+CHGOVqp/MoZtdHHghW+7KtTLLKNJ72Lfi+2UqUMJEM6vIYnbTQNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR08MB6305
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.1.105];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.1.105];domain=BYAPR08CU003.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ff69729-e99c-4283-754a-08de9f239c39
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704160111799003|82310400026|14060799003|35042699022|156008|36860700016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QgGTwHjA4GN2kne2JQzfEDzzOeCKr1x4+VF2kPJaCKdobaIe5Fn3X5g5FAR3?=
 =?us-ascii?Q?rTAegqzHWBBxGimbLgaunoxM0drvflkLV5whi8qwXbMgwgdRmSIs4I0gShAx?=
 =?us-ascii?Q?oScqlLeixQE4eWHn4WcBHEfQUIhjLNljxxvHSGoFhZywGjea3m+NU+i8KM04?=
 =?us-ascii?Q?xj8045uEy010cD/xPPTTOLWQNNnZ+9yXgkTBdmjxs4OEMGDcyML8xrdQinVB?=
 =?us-ascii?Q?I4ob+0yzMzKD7h7JmVb7psHM7g3u14r8ZhItV5NrmPX/Qw+K3RFJ52XCTBcU?=
 =?us-ascii?Q?FQfC7neSv+oOfcN8sHbnXE41/dG9YjfhNPTrWBFQFpwvoSZix1oasq6Gtgr3?=
 =?us-ascii?Q?CVdevAFPbqoEP4WX952cCzj+vG8xUP4rLJrdFCXVZ9HcjOD1fF3JP+w1OI6r?=
 =?us-ascii?Q?u8uLA+YFHOTZjJ6ArE+FAvutRdCVFWtiMM4JpVTKBy+W3nx0cPfQdp4jLDfs?=
 =?us-ascii?Q?uUdshVWC5QpmK7iWWlCXh7R0DkXmwjLjq14dIHWlPVMQ4ULZgr6ENvpl/tDn?=
 =?us-ascii?Q?3yHS090ROPmloCnoR0U9sJXkRA03aRvp4kcMAgYN4wC5TfT4DA4A8pDe3PkU?=
 =?us-ascii?Q?YboZG5fZoidPtvFbO7HydoteUaDkh2WKbkihWRz71ZReHJXBFxmjloddwqwr?=
 =?us-ascii?Q?5OKPAjR7Hef3sO92DVRTOIJmywlBt+pnDPvs0eyPVjNvWuwAG+HEEz8SDZTc?=
 =?us-ascii?Q?PpBCpqRA9SJffJ/Ti/jBwBBx/uvaw2ru9ke2B6aPlPK4yj94Q9OqL/kVMusD?=
 =?us-ascii?Q?29Y1U7pz7J46M7XoepaPhqB+8Hp+G4cGMgAsCFPsBWGcp4ge8vIw4bK/PYn+?=
 =?us-ascii?Q?smhE5rvesAZSwGznEkLPoF4gTqd0oX/B9aHT2KTVW26wZvhAnfz5cVBdsuyd?=
 =?us-ascii?Q?elB2/hbJMxZ4KDzH0tIr2USE3pnlDc9ZsBTWTKUsLWrtLMHoz/oId/skmVoE?=
 =?us-ascii?Q?EXJ5hwHpE1p0nlHR1jSeL/1TSxh2H2Yx8w5eNQ2/LOygsgtBEVxl1J1cHy31?=
 =?us-ascii?Q?4yFUenQFidnb9FhXp3Z4oneZxElTI2IP3t3P1Y0OBNzQfeP6wJoTW0ae9Y36?=
 =?us-ascii?Q?AzKPtXaKXbkwvGrlLO7bt4xZIkqtIE2QtH1r8nbev6o3X7vB7RRIx6jp6da9?=
 =?us-ascii?Q?TkXHol100rnp8o4qR02VydThXK+/2RDlnpaW6vdYitynjO639mxjCEGr1EMl?=
 =?us-ascii?Q?6Kv6S3yAxvQqKxJsuXaH5A9A4xexWLHG8GRgqw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR08CU003.outbound.protection.outlook.com;PTR:mail-byapr08cu00301.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704160111799003)(82310400026)(14060799003)(35042699022)(156008)(36860700016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Cb/QQt77F9iwD9oyXSC53u8uI4GQxV6gJYaUZwkJ1mG4uYEoZ8g4o86RjykDitVp3U0FNoqOZ3rjeasun7Ulzygj56xoKVrubbXSGzVrxQOk2U1+LPdeIxDlD58JwTfDQdGL98MU2Ma2FYwy5J2ScTc7YHVzePQsTcRA5+8/dKRhHpUrvnAMLWQ0t1yPnYtMmpoJL6lXT4RaFS09R9UM7SWXstVyTjiC5v3m+ljlrSXuv8FaqhLTET5uQzExaj3i8Emvlvl1ocyZhJncSCTpiXrQWDS0aRD7FL1ZQrHxRwUNzHeDj6KrZ7TIokKd0ieTyAYzReMl00JdTohW82CVYq1z9N+f9EyJGynWfJGZPhdCQoWVQQQbPbx8Gd5kiEryQ8Ig9UO9QPUs7MoYNj0n6kpgGd+B4BmEqK1FxYRb0JpJDbBvuAk/2azOaJJgDRpG
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:28.9071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7411b43f-2eb3-48e4-bde1-08de9f23a023
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR08MB9429
X-purgate-ID: tlsNG-c1860d/1776720455-38159DB1-79DDF673/0/0
X-purgate-type: clean
X-purgate-size: 5997
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[elektrobit.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[elektrobit.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[17];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@elektrobit.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[elektrobit.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.201];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: DE712434092
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit moves the init and teardown routines into common code. The
functions are gated by CONFIG_X86, so there is effectively no difference
despite common code normally being compiled for ARM.

This commit contains only renames/code movement, and no functional change is intended.

This is commit 3/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h |  8 -----
 xen/arch/x86/mm/altp2m.c          | 45 ----------------------------
 xen/arch/x86/mm/p2m-basic.c       |  1 +
 xen/common/altp2m.c               | 49 +++++++++++++++++++++++++++++++
 xen/include/xen/altp2m.h          | 13 ++++++++
 5 files changed, 63 insertions(+), 53 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 7cff40beb7c6..13017525a62f 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -97,12 +97,6 @@ static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
     return true;
 }
 
-/* Initialize altp2m views */
-int altp2m_init(struct domain *d);
-
-/* Free altp2m views */
-void altp2m_teardown(struct domain *d);
-
 /* Switch alternate p2m for a single vcpu */
 bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx);
 
@@ -184,8 +178,6 @@ static inline int _altp2m_get_effective_entry(struct p2m_domain *ap2m,
         _altp2m_get_effective_entry(ap2m, gfn, mfn, t, a)
 
 /* Only declaration is needed. DCE will optimise it out when linking. */
-int altp2m_init(struct domain *d);
-void altp2m_teardown(struct domain *d);
 struct p2m_domain *altp2m_get_altp2m(struct vcpu *v);
 bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx);
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
diff --git a/xen/arch/x86/mm/altp2m.c b/xen/arch/x86/mm/altp2m.c
index 371bf3f0b8d4..46374373848d 100644
--- a/xen/arch/x86/mm/altp2m.c
+++ b/xen/arch/x86/mm/altp2m.c
@@ -123,51 +123,6 @@ void altp2m_vcpu_disable_ve(struct vcpu *v)
     }
 }
 
-int altp2m_init(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
-
-    altp2m_lock_init(d);
-    d->altp2m_p2m = xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
-
-    if ( !d->altp2m_p2m )
-        return -ENOMEM;
-
-    for ( i = 0; i < d->nr_altp2m; i++ )
-    {
-        d->altp2m_p2m[i] = p2m = p2m_init_one(d);
-        if ( p2m == NULL )
-        {
-            altp2m_teardown(d);
-            return -ENOMEM;
-        }
-        p2m->p2m_class = p2m_alternate;
-        p2m->access_required = hostp2m->access_required;
-        _atomic_set(&p2m->active_vcpus, 0);
-    }
-
-    return 0;
-}
-
-void altp2m_teardown(struct domain *d)
-{
-    unsigned int i;
-    struct p2m_domain *p2m;
-
-    for ( i = 0; i < d->nr_altp2m; i++ )
-    {
-        if ( !d->altp2m_p2m[i] )
-            continue;
-        p2m = d->altp2m_p2m[i];
-        d->altp2m_p2m[i] = NULL;
-        p2m_free_one(p2m);
-    }
-
-    XVFREE(d->altp2m_p2m);
-}
-
 int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
                                p2m_type_t *t, p2m_access_t *a,
                                bool prepopulate)
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index 433e7d08b78f..67cef5d2b6ef 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -11,6 +11,7 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
+#include <xen/altp2m.h>
 #include <xen/event.h>
 #include <xen/types.h>
 #include <asm/altp2m.h>
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 3a3283f0860a..cda653b713f0 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -2,8 +2,10 @@
 #include <xen/altp2m.h>
 #include <xen/guest_access.h>
 #include <xen/vm_event.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/altp2m.h>
+#include <asm/p2m.h>
 
 #include <public/hvm/params.h>
 
@@ -13,6 +15,53 @@
 #include <asm/hvm/nestedhvm.h>
 #endif
 
+#if CONFIG_X86
+int altp2m_init(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+    struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
+
+    altp2m_lock_init(d);
+    d->altp2m_p2m = xvzalloc_array(struct p2m_domain *, d->nr_altp2m);
+
+    if ( !d->altp2m_p2m )
+        return -ENOMEM;
+
+    for ( i = 0; i < d->nr_altp2m; i++ )
+    {
+        d->altp2m_p2m[i] = p2m = p2m_init_one(d);
+        if ( p2m == NULL )
+        {
+            altp2m_teardown(d);
+            return -ENOMEM;
+        }
+        p2m->p2m_class = p2m_alternate;
+        p2m->access_required = hostp2m->access_required;
+        _atomic_set(&p2m->active_vcpus, 0);
+    }
+
+    return 0;
+}
+
+void altp2m_teardown(struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m;
+
+    for ( i = 0; i < d->nr_altp2m; i++ )
+    {
+        if ( !d->altp2m_p2m[i] )
+            continue;
+        p2m = d->altp2m_p2m[i];
+        d->altp2m_p2m[i] = NULL;
+        p2m_free_one(p2m);
+    }
+
+    XVFREE(d->altp2m_p2m);
+}
+#endif /* CONFIG_X86 */
+
 /*
  * altp2m operations are envisioned as being used in several different
  * modes:
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index be627152668a..85ef22c2b29e 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -8,6 +8,19 @@
 
 #include <public/hvm/hvm_op.h>
 
+/*
+ * Common alternate p2m declarations that need to be visible
+ * regardless of CONFIG_ALTP2M
+ */
+
+#ifdef CONFIG_X86
+/* Initialize altp2m views */
+int altp2m_init(struct domain *d);
+
+/* Free altp2m views */
+void altp2m_teardown(struct domain *d);
+#endif
+
 #ifdef CONFIG_ALTP2M
 
 /* Alternate p2m HVM on/off per domain */
-- 
2.34.1


