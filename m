Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOf/GGaa5mk1ywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F146F434093
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287539.1568018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9t-0005HS-GP; Mon, 20 Apr 2026 21:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287539.1568018; Mon, 20 Apr 2026 21:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEw9s-0005B2-Ma; Mon, 20 Apr 2026 21:27:56 +0000
Received: by outflank-mailman (input) for mailman id 1287539;
 Mon, 20 Apr 2026 21:27:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@elektrobit.com>) id 1wEw9p-0004hB-Tn
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:27:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEw9p-00CBiW-AK
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:27:53 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a14-e002-0a2a0a5209dd-0a2a4507df78-38
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:53 +0200
Received: from [40.93.195.123]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@elektrobit.com>)
 id 69e69a57-229c-0a2a45070019-285dc37b68cc-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:27:52 +0200
Received: from PH8PR02CA0051.namprd02.prod.outlook.com (2603:10b6:510:2da::21)
 by DS4PR08MB11019.namprd08.prod.outlook.com (2603:10b6:8:2e6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:45 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:510:2da:cafe::b9) by PH8PR02CA0051.outlook.office365.com
 (2603:10b6:510:2da::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:45 +0000
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 21:27:44 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4fzz9D0F7Yz1wdV; 
 Mon, 20 Apr 2026 14:27:44 -0700 (PDT)
Received: from CO1PR08CU001.outbound.protection.outlook.com
 (mail-co1pr08cu00101.outbound.protection.outlook.com [40.93.10.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2026 14:27:43 -0700 (PDT)
Received: from CH0PR03CA0397.namprd03.prod.outlook.com (2603:10b6:610:11b::30)
 by SA1PR08MB7245.namprd08.prod.outlook.com (2603:10b6:806:1a0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 21:27:38 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::72) by CH0PR03CA0397.outlook.office365.com
 (2603:10b6:610:11b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:27:38 +0000
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:27:38 +0000
Received: from ubuntu.localdomain (10.10.178.50) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 20 Apr 2026 23:27:34 +0200
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
 b=siMT05Uwv09Sb0ufILysQ31SYkrAOTh3ponchDEMhoxnz7ugCbtG1+6rn6GMAQA+tgYE6t8A3qDKQQ4COLqPChV9rUjtn+l1wKt7oy+lsZGRpL7nrjxOJyShTlILsJEo1tu5q+3NhhF0CpT0EI2FAVxAbV6JQ4YrRjYLpGW5tysqE2EpL/PTAq6rRB9pB2FJYHId06NCOBXOaW8faPcVhsz8qLIiQZXwU+HjqJrkqFyVQ/SMe4D1y1NhBv0zYV3GQMXZkzQCKcgxegMlYxmtrK+mg8yHeWGew8B3Syidr57VIqp/OxoExVP9MxuDxGQI5ic5TQtzJIVIvz1n3Etx9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xFPvcddJmAh/7k7Gzv3o+d1z1DGyz3l1lzwxv3F8MY=;
 b=ugvhVGj4Ay4WnvnOUMisvebbStQd50kjCywwjV29bKGyBZrVRfXi0hPuuIzVc5bW109kkBZLpVaHIpdGw4Vo9Xx9gttH+yJwSMFhW2vzlVV2HeI36Lr7o78vzBhkincICBG4HrxYbCEl7GaXsdwGr/BHrcZXz4YuF9mwVSQ8Q1qNbfzLWeHOiYLk5Q4VMgKYY24dCj3kZ9MAA+Bmrrn0WBm4dzzQ1rIqrIsmb1W9dgeLpYqW0y36cEFm22Kd719pm7zRiWt04ITVWECk3VJ32Fyf+7JoGVtFyFjGu+LAmdUp17wx/b5yOhUaiP3THp+mbI3CM1CfO8y4yG4ya4sokg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.10.97) smtp.rcpttodomain=amd.com smtp.mailfrom=elektrobit.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xFPvcddJmAh/7k7Gzv3o+d1z1DGyz3l1lzwxv3F8MY=;
 b=iLAIWGyjqNeVtdzRMI3oACsUTGllgi46p32FqZIdA44UnXxoj+ssw4ZlTC6pUuQ73bZawXrkLWsLUiMEqOqxbDNs6aQDdOlFwCvkJX/ttxUxqFj3nEFCTKxqum7Zz4DoyH+/KpYqR1mUKBdxIc6MbHlzH1XCavG+C3oRB732o4I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.10.97)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.10.97 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.10.97; helo=CO1PR08CU001.outbound.protection.outlook.com;
 pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDXIgFtlRMMybhj/J02J+6dvwFHFVu47kAvjAJEZh1AdO2edBKhxXLFBs9VoJZgQcKy7hGfv06fsdGSslQ6+dqBr9aJNSZ6ZrmghgCOJ+594XtVTZ7kxdMhIguylrDVHhuHyA5IE/57dIopMQJgfHbgPYsko2GpAyDTsmf2xxAbZ4KfHZxEAVmXnamEoNMMheZWZPdctphnG/v+uBRUTR1BG1FQw4/rqQ1d4uSweUw+aUrOB5pWGnRcSL1ikVSnJ1HAfSg8JBPQ/R5O0DYCvgFDea2p65b5QNqZUqQOgG5IBcu89tCABLcDjdRgBSMV1ScQs5e3aFDxPiNAZAOcppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xFPvcddJmAh/7k7Gzv3o+d1z1DGyz3l1lzwxv3F8MY=;
 b=rQNReQNPmnmeHrubVSsD2RDYqNzoM1HDybeuSWvcEP21n+/l/zEajzpVtf1z5tk6r2ggikQr5eyKE5zjECn9cGTbfs6fnCX0MRdXyYxSWptI/YdG0JM9fCp2O9zlKtUUs2YXpJQo1QAq2zglvwLHGPWEjhOqA1l3Ern3jRK09wotllT11z0YpgZIxbMjefWpdVIbTXpFOvXBLy1rb6JDKN+Ekm0MU0D1VaTszyX4+iXSL8S4hWZoh8oRGATBkKLpUZO7d3cOB9bptR7PjBkJF4POwOJs7X61TOydXQCicIwHkzc1UFKv6bTjuWAzWuuK//IZhK1LV2EZ6NV21KJiFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xFPvcddJmAh/7k7Gzv3o+d1z1DGyz3l1lzwxv3F8MY=;
 b=iLAIWGyjqNeVtdzRMI3oACsUTGllgi46p32FqZIdA44UnXxoj+ssw4ZlTC6pUuQ73bZawXrkLWsLUiMEqOqxbDNs6aQDdOlFwCvkJX/ttxUxqFj3nEFCTKxqum7Zz4DoyH+/KpYqR1mUKBdxIc6MbHlzH1XCavG+C3oRB732o4I=
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
Subject: [RFC PATCH v6 24/43] altp2m: Move altp2m_{get,set}_altp2m to common code
Date: Mon, 20 Apr 2026 17:26:29 -0400
Message-ID: <20260420212648.208640-17-Rose.Spangler@elektrobit.com>
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
	CH2PEPF0000009E:EE_|SA1PR08MB7245:EE_|SA2PEPF00003F64:EE_|DS4PR08MB11019:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a17df29-cfd9-4436-7a52-08de9f23a998
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|704162011799003|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?V/t8OlqgU5UgLVl3ygrlXo1RJD7RaqDhlWshvtr04/fND0YliTWfyeKk+dBy?=
 =?us-ascii?Q?CjcF6cQ2atHLP06F8YEKxbKvvjiJYCDstfzRT38H7PTLd6G8Hga20EyqeDJ3?=
 =?us-ascii?Q?6DsH5q4DsnTo7tRznWaUtswU5g8jI+pYYCKTw0E/F89FoM0QBIsqUrYiT4qt?=
 =?us-ascii?Q?g59aLM6JGwKmMXXBF8+B1ihnoTQXyIlzjgOUzLnkgBu8aDksANWZnkZmNumN?=
 =?us-ascii?Q?r02LIfpws/ZIWtA3v0MAhZi0KVHL2bAWEY886sCuqJR172W9BwsDt5GzkmSN?=
 =?us-ascii?Q?644N3jCkpTCgYFSEzdMAGnGwVIYhe8hY+rvxoyDpzJpS7Duvw9Inf+9LzxA2?=
 =?us-ascii?Q?qUHwuOo9/ETjDMbGa1MEuhVQQyXITGT36+qmjWyKBEdUPUqFua3PO8jij2p/?=
 =?us-ascii?Q?KXRvPfJz+zxa8+QdbXE8v2C86OzT2ay6ravbopMnyWlA2Fjo2IoIAP6Pj2Uy?=
 =?us-ascii?Q?RWKXP4nzwXDR3D5scoTGW0elV+oVyTwTDml6ZrwL2UR1DmYUD38cGSSQLM6+?=
 =?us-ascii?Q?rMIxpkaLgGRsPuodweRpyGvDMVGO9Vk771ssweKh6NWRSv3o81ARRppyzngX?=
 =?us-ascii?Q?8aBHVmaPm/ImH87YnXAgzAYMhg+rJNxvNrlsj2n4nT6Uu50KEt29EHV4j/hr?=
 =?us-ascii?Q?SSdpvq5VvDToz3cF/ajtQdstO3YeMRAB4lUVz7goW/kzOaHNL5KETNt1FD04?=
 =?us-ascii?Q?wQxnSAHqjN+EUyWoQUdmlT5oo6Ktoheq5AuJxyOo5ZqjyWBcBvtUbqqnjOMu?=
 =?us-ascii?Q?KuIaD4nmcSttig++TIbpElHrvVuC1/HjmwOVP1+HKyD+BBeKZt2TIrId1/+7?=
 =?us-ascii?Q?s5LnT5PWUnSLV2xRP1UXwlbYOPjp6n8uMk2aL//OLLRLEXMNXHjvLsrspXqX?=
 =?us-ascii?Q?8fCRb+uwLSgtqKw1YBxTXfkfr1X9LUHgiYvlMDxt6GK2+UYA7NuA02veRZdC?=
 =?us-ascii?Q?N2PL8XKTTvaqh8hcRCJuRel/zvb/IB19QQMEyw2AV+8g3YKZulAjsd/NqkLX?=
 =?us-ascii?Q?TYXF2YHMIVyvFuvjDLD7oqMQ+71poQX5ayW8/JP3EaP1QiD5b0o2TcekySH+?=
 =?us-ascii?Q?1basVZykWM7k3rNtMudy0jeszYXmMi/sqMgQijTAwWaUy1SNRBQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(704162011799003)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 G9JKct85kmNJ7lKB/CE0Di3Ty4TIH4YJ6m04MNWUbs1eJktKZLP2jnGmQ6Adrpk+5iJA5U2y84/pMT4ASN84w+zqhXUDHjFKbix2flti0FQzVbfxdIvx4tCkDeMjOrnZZYzQp+Vo5svgAmAD/rsZEbiQvBwCWUraDAmuW8tJXrIbPKukmI6ouWd9woYwFcujReoI/q8Gc0jgOwCmbabQpIdbajCrfs0gmncK+HmPqXKBjhxOvBLErN5eX2h/aXUOBw1uHi4OwtTbiY0xMfSGibGWh3iDa7WWnyhPZLQlDy97A/P0z29SMKYZpMGkdGXB4ZON86XDcY73S0r1Ccbrhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB7245
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.10.97];domain=CO1PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.10.97];domain=CO1PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54dda91a-6ba8-4cd8-1232-08de9f23a59e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|704162011799003|376014|14060799003|36860700016|35042699022|156008|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?98LBm2rCc354eHij1TwR0Aw7vJkJFINu24fIJSK5R4pkzRbUl/rs2ujxRdXB?=
 =?us-ascii?Q?n/7XWCsb1fIos2iomZvWsLxCBvxGoHW+47DVxRizpp6zEW6Opms5087Q6xN1?=
 =?us-ascii?Q?rXOJFUcK+fMW9Cr0+y6wrB6gZXDnL1EpC1focekQzXPwsBQ0SEhE/ubaJybI?=
 =?us-ascii?Q?9aPlduYwGN0ige2Wf/TAz8PiQb0JNbE4qB1vaoYPxXgG9+PHy+S4WER3QQQK?=
 =?us-ascii?Q?+WhOVEs5X1OWTkxVFH8W2x2sc4knxjlL836npm8Wn5GFM1Q3wd/QVgTJbIG5?=
 =?us-ascii?Q?DPeo1BDwONHTHZSonPTZbOyVt9iIPyFPxiIXoTVXJvW69CVsGLfl/s+P3+KU?=
 =?us-ascii?Q?Mg+hAoM3eaC38xWZ608WcPx1fIoK87G/awustxyIDdREK/AjfNVHhWpD7nCB?=
 =?us-ascii?Q?CScYahV+ig45mwIK/zglvmfstUirpVhXAjG0PrxoO5C3AiX3LJKdcSc0YEo9?=
 =?us-ascii?Q?7vTsMG469TtpUIAFxPLgiDT9UA6RxmnjsvrspPwGpvDSlfyQTtPmV3GzZWq2?=
 =?us-ascii?Q?nofFeRBZfy45xg7tWHOXDGh4IV8lNihPqvE6FVlghsPDEmGKlIdKuNFUpU0p?=
 =?us-ascii?Q?GiuF8LKQmHa4fOqv/76nJ2VJuYKDsgr3uNYEtDzmzJhkuGbyMJhsnZtviGRa?=
 =?us-ascii?Q?2Sf3nF5eXHy1u08XPmZv0KZ35U0V4zmS9FAA8UFVvKMTULml7jUrAp/JxvVz?=
 =?us-ascii?Q?t1U5aRO7CFssq4HLMXW9H/iRIK+u6mudpeWTMKiiRGupcxLx3NyKYYXwnViG?=
 =?us-ascii?Q?CvZazj/mX+SqqW44jqvJbm8jppUZ8wf1sC83DwPEh7ky12Yhe2TbxI3jn91Q?=
 =?us-ascii?Q?OXhGU3yqWWxzVmjQ4PvPni+boLxot2yt8ZtJrJwUf3rvbYop2Nht3Dew32wk?=
 =?us-ascii?Q?E31XYMT9BPe/0wGE2XdA/vEORFbQYuCUljmXgrdbiFnncUk7X3I61veIEQAi?=
 =?us-ascii?Q?CeXso//SiZhjer6Ac3E5TdD0eJNktW1halUlaKeLPUNThZnGHX6lktpGxcc9?=
 =?us-ascii?Q?7lCqPJf82zI7RsHvlvQV0cppC16DRJy29nB/TBi4Ll2g6wk1eIb02uyHD9Ht?=
 =?us-ascii?Q?Vkwsk46mrlZm/WYr9ULWgE8IT6PO/rQIaO452501D+RL6KuCR7g=3D?=
X-Forefront-Antispam-Report:
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR08CU001.outbound.protection.outlook.com;PTR:mail-co1pr08cu00101.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(704162011799003)(376014)(14060799003)(36860700016)(35042699022)(156008)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9/qlWrLr+YlyYXpcgwHtXfMyZE0eH5PfszK7EonwPvd4LKJ7lDWEuHJ9PRiYLXXBDeGQW2gqo4+IheGMsVoun3qz1gp7MCoqJgBLGNP5autS+N81oCB/P+xHOMuXGYoyvo8ICzLMlBUv4KObYmLH9NwgkCsOaQJY6nN45nggaYqN3lWBrnYPNa8vvhZRR2uA00FjjJ90Vue/lPZK8MKcD+qOF880zzo1YeqGiBJU/lSaQBuh96MC9jP7HYmMkrT9+2szF8f+9UD0APFV+QSHuT7Xa+pl1GUliKg5gECbplWL0CHxsxLwYRaiBZ/6Zn2osmDglMWy9MS6LSVGcA4xa4MljG/kOYu847SnaLzR250zsH7A8iRPI0OlT5g3ymPEqsQBdGJFqxlJNssCQ/05BhIedHLN81x9Qe1QR4bz3NPVsbmQ3BRxxcADkYl5BAbM
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:27:44.7741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a17df29-cfd9-4436-7a52-08de9f23a998
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR08MB11019
X-purgate-ID: tlsNG-ef75cf/1776720473-ADD6FC48-891058A1/0/0
X-purgate-type: clean
X-purgate-size: 5044
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
	NEURAL_HAM(-0.00)[-0.300];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: F146F434093
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This commit moves the altp2m_get_altp2m and altp2m_set_altp2m functions to
the common code. This make sit possible to use them in other common
routines (namely, altp2m_vcpu_{initialise,destroy}).

This commit contains only code movement, and no change in functionality is
intended.

This is commit 1/4 of the altp2m_{get,set}_altp2m phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/include/asm/altp2m.h | 35 -------------------------
 xen/arch/x86/include/asm/domain.h |  2 --
 xen/common/altp2m.c               |  1 -
 xen/include/xen/altp2m.h          | 43 +++++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 13017525a62f..a1b078783b3e 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -64,39 +64,6 @@ static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
  * Alternate p2m: shadow p2m tables used for alternate memory views
  */
 
-/* get current alternate p2m table */
-static inline struct p2m_domain *altp2m_get_altp2m(struct vcpu *v)
-{
-    unsigned int index = vcpu_altp2m(v).p2midx;
-
-    if ( index == INVALID_ALTP2M )
-        return NULL;
-
-    BUG_ON(index >= v->domain->nr_altp2m);
-
-    return v->domain->altp2m_p2m[index];
-}
-
-/* set current alternate p2m table */
-static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
-{
-    struct p2m_domain *orig;
-
-    BUG_ON(idx >= v->domain->nr_altp2m);
-
-    if ( idx == vcpu_altp2m(v).p2midx )
-        return false;
-
-    orig = altp2m_get_altp2m(v);
-    BUG_ON(!orig);
-    atomic_dec(&orig->active_vcpus);
-
-    vcpu_altp2m(v).p2midx = idx;
-    atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
-
-    return true;
-}
-
 /* Switch alternate p2m for a single vcpu */
 bool altp2m_switch_vcpu_by_id(struct vcpu *v, unsigned int idx);
 
@@ -178,8 +145,6 @@ static inline int _altp2m_get_effective_entry(struct p2m_domain *ap2m,
         _altp2m_get_effective_entry(ap2m, gfn, mfn, t, a)
 
 /* Only declaration is needed. DCE will optimise it out when linking. */
-struct p2m_domain *altp2m_get_altp2m(struct vcpu *v);
-bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx);
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_vcpu_initialise(struct vcpu *v);
 void altp2m_vcpu_destroy(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index f8038087e612..72460e38f581 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -277,8 +277,6 @@ struct paging_vcpu {
 #define MAX_NR_ALTP2M   MAX_EPTP
 #define MAX_NESTEDP2M   10
 
-#define INVALID_ALTP2M  0xffff
-
 struct p2m_domain;
 struct time_scale {
     int shift;
diff --git a/xen/common/altp2m.c b/xen/common/altp2m.c
index 989d8bdcb923..a731ad7cdab8 100644
--- a/xen/common/altp2m.c
+++ b/xen/common/altp2m.c
@@ -5,7 +5,6 @@
 #include <xen/xvmalloc.h>
 
 #include <asm/altp2m.h>
-#include <asm/p2m.h>
 
 #include <public/hvm/params.h>
 
diff --git a/xen/include/xen/altp2m.h b/xen/include/xen/altp2m.h
index 238c7a935586..58e74be6deb0 100644
--- a/xen/include/xen/altp2m.h
+++ b/xen/include/xen/altp2m.h
@@ -8,6 +8,10 @@
 
 #include <public/hvm/hvm_op.h>
 
+#include <asm/p2m.h>
+
+#define INVALID_ALTP2M  0xffff
+
 /*
  * Common alternate p2m declarations that need to be visible
  * regardless of CONFIG_ALTP2M
@@ -27,6 +31,41 @@ static inline bool altp2m_active(const struct domain *d)
     return d->altp2m_active;
 }
 
+#ifdef CONFIG_X86
+/* get current alternate p2m table */
+static inline struct p2m_domain *altp2m_get_altp2m(struct vcpu *v)
+{
+    unsigned int index = vcpu_altp2m(v).p2midx;
+
+    if ( index == INVALID_ALTP2M )
+        return NULL;
+
+    BUG_ON(index >= v->domain->nr_altp2m);
+
+    return v->domain->altp2m_p2m[index];
+}
+
+/* set current alternate p2m table */
+static inline bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx)
+{
+    struct p2m_domain *orig;
+
+    BUG_ON(idx >= v->domain->nr_altp2m);
+
+    if ( idx == vcpu_altp2m(v).p2midx )
+        return false;
+
+    orig = altp2m_get_altp2m(v);
+    BUG_ON(!orig);
+    atomic_dec(&orig->active_vcpus);
+
+    vcpu_altp2m(v).p2midx = idx;
+    atomic_inc(&v->domain->altp2m_p2m[idx]->active_vcpus);
+
+    return true;
+}
+#endif
+
 int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg);
 
 #else /* CONFIG_ALTP2M */
@@ -41,6 +80,10 @@ static inline int do_altp2m_op(XEN_GUEST_HANDLE_PARAM(void) arg)
     return -EOPNOTSUPP;
 }
 
+/* Only declaration is needed. DCE will optimise it out when linking. */
+struct p2m_domain *altp2m_get_altp2m(struct vcpu *v);
+bool altp2m_set_altp2m(struct vcpu *v, unsigned int idx);
+
 #endif /* CONFIG_ALTP2M */
 
 #endif /* __XEN_ALTP2M_H__ */
-- 
2.34.1


