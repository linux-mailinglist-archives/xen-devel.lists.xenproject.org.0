Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CECB0AF59D8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 15:45:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031166.1404904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxla-0000of-AF; Wed, 02 Jul 2025 13:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031166.1404904; Wed, 02 Jul 2025 13:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxla-0000mx-6B; Wed, 02 Jul 2025 13:44:50 +0000
Received: by outflank-mailman (input) for mailman id 1031166;
 Wed, 02 Jul 2025 13:44:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eYgc=ZP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uWxlY-0000mr-UY
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 13:44:49 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7153356-574a-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 15:44:46 +0200 (CEST)
Received: from DU7P250CA0004.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::19)
 by AS2PR08MB9524.eurprd08.prod.outlook.com (2603:10a6:20b:60c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 13:44:41 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::ce) by DU7P250CA0004.outlook.office365.com
 (2603:10a6:10:54f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 13:44:40 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15 via
 Frontend Transport; Wed, 2 Jul 2025 13:44:40 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 13:44:08 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%7]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 13:44:08 +0000
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
X-Inumbo-ID: b7153356-574a-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XWlKyca4mFtvhjSshxANpUqgKFhKtoPfN8fswSWPjaJgrprBmDEaArUlLH059fGinjAGlAn4SObK7dbMZ4SuinQ7SbW2CTvFyCdR5jrHx8IAnvBu7SpTU7fjiyUlLvbWYpSXRMeMouLHdkniBjC3dg1ryPmyDnc7DTNEyOVUq4s8p7C9d2KWZm8meWim6/2OD1cd7J10NpjA5cW9s2CLxd/d1Ad/flJA+qTuAiInYIoSE44tR+KPWySmJBtX+H5vFLWOqH1TfZdLgniSAuZguhLfYWrCf63Q4C7PmwziZmyO0BmrrJlSy6ePDISLIvrGGxjXJo2MnptvAqK3EbJ4dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfT7havhKbX3u7kqEH0BZzDIjt0L6wZmTMTYtyK9qp4=;
 b=KRSqCInwyK+i32kjshhDqVE3qzb+BIREeuj0SN3RreB0HIvhP+0FEqeSUS45FGnc4jYN5RaKmhu+ZjRvQGNCPHJ5GVK7wsOyApckOhVHJzxkVUA77bV1yhLwLf3hJrh8stDNc+x8q2KB6eJdi3Z+lKn+4LATY/w38O9kBxDK/GKpjPMYbnJBvqWIPBYz+CzX7Z3uL6welSEtd2tHjI1KRshf/GCgRXsO+8otX4uhn3MqwsJC5ZcyXo/LAAHqofnIdbY9oAqsUyZHH53yPgbnUnQ2+tOjxCWvxNmDyE95TloOuPDL4+ZPLkt9ZZscxW1z35XzKszLSHH1hSqZZZFU5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfT7havhKbX3u7kqEH0BZzDIjt0L6wZmTMTYtyK9qp4=;
 b=ZdlPVjbnEoFz74//sldWf1PZ7TOfcvjhkpmzqpx4on5nJS5lZR0gY7MoCii63xVGCKtJvgRYW661yGXQR1qJdyJEsFINmxJRwMK1grtVGRLwycqO18su9i/fAVR0UgmS+6stLlico7LIx6VGLBKW66BjfXQOiMN5zNyzCKM7yEU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/4hnPqlL3ghDB4FB7/AdKfsbKuDUPkRP3fHd7yB3ZUTHqZdDxKPz/j7Oar4HelK15nEDGhfQmkpwgZF6/Vn7UJ+YgArVWfnsCekacl6Pc/RC0C39Ygfyy1XlXtWQrhmegtloUDEb5ym+qTd7YBS4mAa0kY0FzQ1G5yS8Kofr3udcr5hqZLp0rrrNRotKd84gsYoZrsfFCmGFY9hKi2WI9Y/bAukRFLHGimINYFwW302zf5efAVhPvrlSHrec6WXoVpYRycsXciQbtwIq0SGBM5py4dLHNxt6Ywm7uIRe2+0c76H+KuKNJaJriKLMkbZ3q2PZPj21uei9DOOctz89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfT7havhKbX3u7kqEH0BZzDIjt0L6wZmTMTYtyK9qp4=;
 b=NTLvvUZ3UL/KeJuQA6JIXOQl09qzzKp+HuopvBs/yhrOhaFidVFT07KZpW58GTFxpOHWSxqCXR/eZfxZtHCnVrC9kCLHE+UCrJUd/n4a78wF7sLfD+PC2pkjwBOqIp2DqeDLTRQT1Gq1dJSDbxOh0NEQdyMRFdS05fHpA9E/reQNcSov33gGeKAIL4WRye+DzKBdZEtGsCoP9EnZxmQfKFdbatCoR6GyRfZnzIfMs61UQhHYSLDO7f+EiUM5U79vKn1Fwz5ofX6oKQwaYui5sOEYPUZN4obULDcCMLYZR4FHWhmXGxSJDPaWRbA2ZVGXQpNGgKbqdwXfYnL+DvukNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfT7havhKbX3u7kqEH0BZzDIjt0L6wZmTMTYtyK9qp4=;
 b=ZdlPVjbnEoFz74//sldWf1PZ7TOfcvjhkpmzqpx4on5nJS5lZR0gY7MoCii63xVGCKtJvgRYW661yGXQR1qJdyJEsFINmxJRwMK1grtVGRLwycqO18su9i/fAVR0UgmS+6stLlico7LIx6VGLBKW66BjfXQOiMN5zNyzCKM7yEU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Hari Limaye <Hari.Limaye@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH 4/6] arm/mpu: Destroy an existing entry in Xen MPU memory
 mapping table
Thread-Topic: [PATCH 4/6] arm/mpu: Destroy an existing entry in Xen MPU memory
 mapping table
Thread-Index: AQHb4cpciV/6CvSAB0CHD6KSA8R6qrQUHtAAgAlF/ZmAAX0kgIAACRmA
Date: Wed, 2 Jul 2025 13:44:08 +0000
Message-ID: <5CA72490-EDED-4D7E-B875-F7E8096AD1EC@arm.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <95cc28af74339ea617081f3935123e38a53cc657.1750411205.git.hari.limaye@arm.com>
 <e3d28537-b531-4cc5-b875-4afa0437ece5@amd.com>
 <AS2PR08MB874501E9A5853A529FE6BA11E241A@AS2PR08MB8745.eurprd08.prod.outlook.com>
 <e0b7e7ad-f7bd-48fc-81a8-739d49ae806e@amd.com>
In-Reply-To: <e0b7e7ad-f7bd-48fc-81a8-739d49ae806e@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM9PR08MB6148:EE_|DU6PEPF00009527:EE_|AS2PR08MB9524:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f94ce9-9c82-46e7-ef50-08ddb96e9803
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VXlFd05aeHdaN1NlbzlWZUs0Y1VwVjFGSlIzejMwSTdBU0hEazJSbU54WUY4?=
 =?utf-8?B?dkhqVGxEVEJCcnJuZHBYdGVoTE5vRjZ1bXpqZGhaNUZIenpKTVVWdnR2QUZ0?=
 =?utf-8?B?dld1ZVlxblg3ZWtTOWlCV2dVaStacVV0STFJL0NJTnlYV2dkUTZpK0N1N2RE?=
 =?utf-8?B?QisyTHFmbk5hWDlJZGZEanRNTEVUNjhqTjNpR2JYWHRubElsaUY1dGxYcTBJ?=
 =?utf-8?B?Z3FubStic3BPeUljUVpjelM1TEluSXdRbzVKNVZlSmxWWkdraHRTZXZkejBI?=
 =?utf-8?B?bFptZjZHSUpXRHhNODliWGVxb1VSLzh5T2k1MGVrclloT25hekMrZS9NbjRm?=
 =?utf-8?B?RUFvRHhkb2tzRUdacGthSHF2N0liNDdhWWgrdXJWTVN1L3VlbHhjbjFtdDFC?=
 =?utf-8?B?TG9qMEFZYWFJeTE5a1NLNDhDRENaSkVKRnB1Q0R5dWdhbDgzbXZCVThVWXd1?=
 =?utf-8?B?Tmt2VG5xdkp0OVhaaG03WjM4ZDE5SkFwSVFHWHhIdnN3cHNHWU43aVFxL1Bl?=
 =?utf-8?B?S3lkU2RsSUNqcTU5UUt3K2s5RHVkRnF4aWV5MGF0KzJWckpWeXlQTmRmVmcz?=
 =?utf-8?B?b2dwNjF4blllcDBJQThNNGhORHFwRkZVcE9GVDM0V2dqTUlNYXkzUWZFRWdt?=
 =?utf-8?B?R3gwRzJFanp4WXIreUpYTXBHVGdYL2paR2ZPcG9hYUh4YnJNS2U2UGlHVldX?=
 =?utf-8?B?anQvNDdjSGVWNWdzTVJ2b01TVm53S00xQ3h4L0FyZVdWak0rVXBtUjhtQys3?=
 =?utf-8?B?d3MwOHgxbG0yMG02dk55MFhEcTFWWkh1THp0WUh0MzFQU3JiekNkYWF3ZkNT?=
 =?utf-8?B?TVowUGt5TEk0SVFRZmdBM2xiZUhpcXVYYUZUNWZBREdqVGJxdnhud1czcU8v?=
 =?utf-8?B?aFNmaVBYeUc3VGFXcEVhUjgzQ3UwcVJKb2x1dTZvaVU1a0FWZzgzT1ROMWhP?=
 =?utf-8?B?RDZXT3RQS1A3VC8xQXhMaGhlNzZ3TGZ4YXV5MXZvaWhnYVhpeEhFR1JtZGps?=
 =?utf-8?B?a0JpYWE1ZGtjR2dVeVU4QmhTSDlHci9kRWpxUmRuazFzZnFwVEQ5WExpVXBW?=
 =?utf-8?B?dE1CVlJFU096Um1XeGpRb3V3bXJhZ1B0WWxFTUVpVkJPeWRQbnh5eXAwV3hW?=
 =?utf-8?B?MVpsRkVybjNGMUI3OEYxWHFSNE1MN3pRL20rQ2pxdUliS3FZM2hZYzVZRUlX?=
 =?utf-8?B?Mmd2TkJWRFg0eEprL0JOZU0yZm9lU28xYzJ0OTBXVFdCTHhSWGJLRTdPTE9u?=
 =?utf-8?B?dFAxME5PcnhBQmRCNXh2T29nODdXQkpRVS9EUnJDSlBoUzNod3daR29XWFp6?=
 =?utf-8?B?cHVPVXkwc2JMREhVZ09HVTRoVldVMU9GWXdTV25ldDBYV1RsNkFYei9weEpO?=
 =?utf-8?B?ZHZFUWIrcHhUcUVDWGVuVWkxVHlXd3QrMU1JWVQ0WndRMERQUkxmeXlXVmtt?=
 =?utf-8?B?S2UxV1JkTEc2anNSL0ZMa2xZNzh0M1dVZ0FyRkpCQmQ5WTFKVmxZMVpZc0dq?=
 =?utf-8?B?WFlJL1JicHp4VWNzL2NzOHdpcHlCMmxtTVJRUnA2TGcyejRYRktFTk1IUnY3?=
 =?utf-8?B?MDloVzhQaE5USWgreCs3YTB3SzE2YWhkTjNndm5LR296NjhJZDJDeFZ0UjlH?=
 =?utf-8?B?ZkRXdWo5NXRSTTJYNE1UbDhiNitUS1cwRWlvTXFXT1Rua2lSQzlTYUZWRUti?=
 =?utf-8?B?bTl3eFdBRFd6OExZcm5sVzljUFZRTlR2aVIzL3UwcFNMK3pKK3g1SzRoRGtO?=
 =?utf-8?B?ZGJ6RHljeE43T3FLTVFuV1VRSnkwbVNlY0dHR1lZT05yWHN3TzJ3ZmV1QStM?=
 =?utf-8?B?OEQwZzE0WmNzS2lBWkJqcEFlRUM2ZTM4U2RmNFNScHZXVWorYTNIOENuWmZy?=
 =?utf-8?B?bE81bFJrTkhHOEFTZWI4Vzcxc1c2eHZtTG9EWDNpOERBeW5KL0UvVTZzcmtM?=
 =?utf-8?B?QWRPWVhybHVndkJsWlhMR2RZQmRTZ1MzbjRSQmh0ZWZ6T1BJcXl3Wm43d0Zh?=
 =?utf-8?B?NlFBVEcwMElRPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEBAB8F6C215D741A2B4422DC582CB2B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22f5646d-514b-4505-9830-08ddb96e84d6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|35042699022|14060799003|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2dVNFVrT0VFS25oUWkvR1kwZXdwdjFRbi9xdklYUEdYbk5QZU9xMFd5eXpq?=
 =?utf-8?B?US9FNWpjTTZCRVYxcHV2aFRCQmtrRjRxVnFHSTNZVXVOUUdYdUZ6RW1yTmpj?=
 =?utf-8?B?SjdmVlJnakNoQmZTTTRGRzZwb3I5OUs2bW9DRUQrYVBaNVowVVpyUjFVUUVM?=
 =?utf-8?B?YWdHd3dxSzVudm5VUGZQckJNdHJYVEFVTWpXV0tORHIxbG1zd2dtd2dtaml5?=
 =?utf-8?B?SzlwWGlxU3ZmMldlWFNDQm96c0VmNDNXZWxRdU5DWDZYdzFlZ1BUaEJjT2xp?=
 =?utf-8?B?NWxTZFBaNHArNzFrRi9WbXBaeGVtWDJhSnp5MkFjZnh2dWRxWWp4aXNEQXVP?=
 =?utf-8?B?QkkyUjhacVd5TFVsWElVNW1PdmVydUVieUFGeEpCS1FiMFlNcXpPRVlEcEdu?=
 =?utf-8?B?K1F2SG1LcmhqZ3VtQjlCNEdTbUtlYVg5NXFvKy9FdEErOStnR2Z1MVRha1Jw?=
 =?utf-8?B?T2VsWlhZNjVXeloyUlJPa0l6WVhMRWNqVnRTODh1SGViamJ6NFJ3dzAvUDVS?=
 =?utf-8?B?c2xEcGQ0RWpmSGpCbUtDT2VnNGk0UDFVTWRqT2dXVHFXbnpYM3JSOWVGYkFV?=
 =?utf-8?B?V0JTQVJoSWM4cXczbGxVZzhpVGl2KzNTUW80UmNxODlFaE9lalhzdU43M3gy?=
 =?utf-8?B?MjFkNkdNUTd5SmFNdGxJZDlmYTF4QW5xWEpkUGJHNzZ2dUNFVzczYXM0N25z?=
 =?utf-8?B?VXl2QjNNSmtYZzJxbDFnZGx5UCtsK0tJY0t4cTc4UmxTZmk4aCtueHVaRkYz?=
 =?utf-8?B?OHc0Z1QzdkdXRHBjekR4UlFpSzBhNUxJN2NWRWxUcjhmQlozYXNOR1MvU24r?=
 =?utf-8?B?VHd3UlZwQnVFSm9YemM2N0dydStsM1RlODZ2U1FtRDdzbFhrOGJXZUxuM3dq?=
 =?utf-8?B?d3d4VDJxbmpCckFIbWc5M1c4RzM5elBWdDFyUlFzWmRJUm5SUG9ZZ1J6eXY3?=
 =?utf-8?B?MjlQR2h3UG9MSCtMdHU4Zis0YzZpUDYvSHZtQ1JjMGVEVFVCSWIwMnQwWk43?=
 =?utf-8?B?U3gyZ24vMS81N3V4QlNhZTFOd1Vud1FtSzJQWUFiM1JhSWZFRUpjZklpQ3Nz?=
 =?utf-8?B?ejFYUTZQTFFxS2xZTmhYQ01mcWpjV3h2WXIzb3pvb3NiMnJIWVNweVVodmNx?=
 =?utf-8?B?a0gyRGY1YkZpWmRxczdMTFBOUVM1OWhLSHlsWm9ma0dwME01S3BLY1REaVlF?=
 =?utf-8?B?S1luZWQrTVpXQVl2dlNyQWlnbUUxeEw1RlVHWHlaTERSOWZMQmpmRDlsUmxu?=
 =?utf-8?B?cHRUQ21yT2dlU0dqYU8xWS9zbWVrcWF0c1RKZ2RKNzUybTl5VStTVVhqYXlG?=
 =?utf-8?B?Q2FyalMrcTdqdFFsL1RNN28wQ01oWW9PRlZIVHd5UHpyOVEranpGdmpmZ0xB?=
 =?utf-8?B?RHZXZkRwVm9GdCtYZzh1eHhQZnBLcEd3U3JxcUxMeW1ickRoOEpST2dXQThr?=
 =?utf-8?B?MjRFK01OY1Y5OXh5NDBLOEVSY245T2RxdEQrelRoUHVrR1BlSEVjL3ZTQ3VF?=
 =?utf-8?B?ZTUrcm52QklRc1FnbEVmbGRmZTlxam1mdFVDd2w4MmkxSnJjeWFhdnBHN2E5?=
 =?utf-8?B?OGVsL1haNnpNVXlTU041cTA2eGRwTWJ6Y2RvLzdoNVhvdGViY3dYTkNqMFBu?=
 =?utf-8?B?eWp1amZXMUpXajM1a0JQY1hvRGFTTTQ5MFBtRmFiWm1zQ1l5VUNlYmNJcmUw?=
 =?utf-8?B?KzlyUjMyRVRua3kzTGM3SThqeXVWdHJYNVJFQ21ZTkI5d2NTK2JiWjd3UzdK?=
 =?utf-8?B?MjgxbkN5OWlXdjJPUkkzWU5wVzk1VXhxenR0YzFlV3lMcFliMGo3RG8zRDQw?=
 =?utf-8?B?QkkzcTJyak9IZzJ1Y3JjdzdMNVVaZTFJSy9oTm1GdmJhWk43a0F3UGV0dlo1?=
 =?utf-8?B?d0dKQmlxbm5MMGJMRDJyQ0lUdmtPbktHSitQQjgvNVJYV2xSRldhN1dkM1BJ?=
 =?utf-8?B?RGkzRXZmU2paL00zY3hpR01neVFtSUdkY1p1cU5ibThQbGFLUitiOWd6V2xw?=
 =?utf-8?B?MXdUN0dUQThPNmV6NFppZXY4SDN6TTNSeVZrZ1B3L2dhOGY4dzV0R0pNaW1z?=
 =?utf-8?Q?IAhqkE?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(35042699022)(14060799003)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 13:44:40.3451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f94ce9-9c82-46e7-ef50-08ddb96e9803
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9524

SGkgQXlhbiwNCg0KPiBPbiAyIEp1bCAyMDI1LCBhdCAxNDoxMSwgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW5rdW1hQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IE9uIDAxLzA3LzIwMjUgMTU6NTYs
IEhhcmkgTGltYXllIHdyb3RlOg0KPj4gDQo+PiBIaSBBeWFuLA0KPj4gDQo+IEhpIEhhcmksDQo+
PiANCj4+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4gSSBoYXZlIGp1c3QgYSBjb3VwbGUgb2Yg
Y2xhcmlmaWNhdGlvbnMgYmVmb3JlIEkNCj4+IA0KPj4gcmUtc3BpbiB0aGUgc2VyaWVzIHRvIGFk
ZHJlc3MgYWxsIHRoZSBjb21tZW50czoNCj4+IA0KPj4gPiA+IC0gICAgaWYgKCBmbGFncyAmIF9Q
QUdFX1BSRVNFTlQgKQ0KPj4gDQo+PiA+ID4gKyAgICBpZiAoIChmbGFncyAmIF9QQUdFX1BSRVNF
TlQpICYmIChNUFVNQVBfUkVHSU9OX05PVEZPVU5EID09IHJjKSApDQo+PiANCj4+ID4NCj4+IA0K
Pj4gPiBTYW1lIHF1ZXN0aW9uIGluIHRoaXMgcGF0Y2ggLCB3aHkgZG8gd2UgbmVlZCB0byBjaGVj
ayBmb3IgX1BBR0VfUFJFU0VOVC4NCj4+IA0KPj4gPiBDYW4ndCB3ZSBqdXN0IHJlbHkgb24gTVBV
TUFQX1JFR0lPTl9YWFggPw0KPj4gDQo+PiBUaGUgX1BBR0VfUFJFU0VOVGZsYWcgaW5kaWNhdGVz
IGludGVudCAtIHdoZXRoZXIgdGhlIGNhbGxlciBpbnRlbmRzIHRvIGNyZWF0ZQ0KPj4gDQo+PiBv
ciByZW1vdmUgYSByZWdpb24uDQo+PiANCj4gSWYgc28sIHRoZW4gSSBtaXN1bmRlcnN0b29kIHRo
ZSBjb2RlLiBIb3dldmVyLCBsb29raW5nIGF0IHhlbl9wdF9jaGVja19lbnRyeSgpLCBpdCBzZWVt
cyBfUEFHRV9QUkVTRU5UaW5kaWNhdGVzIGlmIHRoZSBwYWdlIHRhYmxlIGVudHJ5IGV4aXN0cy4g
SWYgc28sIHVzaW5nIF9QQUdFX1BSRVNFTlRpcyBub3QgbWFraW5nIHNlbnNlICB0byBtZSBhdGxl
YXN0LiBNYXkgYmUgb3RoZXJzIGNhbiBjaGltZSBpbi4NCg0KQnV0IGl0IHNlZW1zIHRvIG1lIHRo
YXQgX1BBR0VfUFJFU0VOVCBpcyB1c2VkIGluIHRoZSBNUFUgY29kZSBpbiB0aGUgc2FtZSB3YXkg
YXMgdGhlIE1NVSBjb2RlLCB0byBjaGVjaw0KaWYgdGhlIGNhbGxlciBoYXMgaW50ZW50aW9uIHRv
IGFkZC9tb2RpZnkgYSByZWdpb24gaWYgaXTigJlzIHNldCwgb3RoZXJ3aXNlIHRvIGRlbGV0ZSBp
dC4NCg0KSeKAmW0gbm90IHN1cmUgd2h5IHlvdSBzYXkgaXTigJlzIGRpZmZlcmVudCwgY2FuIHlv
dSBwb2ludCBvdXQgd2hpY2ggbGluZSBpbiBjYXNlLCBiZWNhdXNlIEnigJl2ZSBoYWQgYSBsb29r
IG9uIHhlbl9wdF9jaGVja19lbnRyeQ0KYnV0IEkgZGlkbuKAmXQgZ2V0IHlvdXIgcG9pbnQuDQoN
CkNoZWVycywNCkx1Y2ENCg0KDQo=

