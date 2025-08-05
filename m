Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB1B1BB64
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 22:25:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070949.1434545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujODN-000375-BU; Tue, 05 Aug 2025 20:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070949.1434545; Tue, 05 Aug 2025 20:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujODN-00034p-7O; Tue, 05 Aug 2025 20:24:53 +0000
Received: by outflank-mailman (input) for mailman id 1070949;
 Tue, 05 Aug 2025 20:24:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l6JF=2R=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ujODL-00034j-0G
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 20:24:51 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35f268d8-723a-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 22:24:39 +0200 (CEST)
Received: from DU6P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::17)
 by GV2PR08MB8512.eurprd08.prod.outlook.com (2603:10a6:150:c2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Tue, 5 Aug
 2025 20:24:33 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::49) by DU6P191CA0023.outlook.office365.com
 (2603:10a6:10:540::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.22 via Frontend Transport; Tue,
 5 Aug 2025 20:24:33 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Tue, 5 Aug 2025 20:24:33 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DB9PR08MB6617.eurprd08.prod.outlook.com (2603:10a6:10:261::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 20:24:00 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%3]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 20:23:59 +0000
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
X-Inumbo-ID: 35f268d8-723a-11f0-b898-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZPS3eeCZ3OSQPQfyS6zIuPWAu/4kr6tEgcttaPJxAHmeiG7KWIjo7XG5TPllWD8yXiev8TYuAozsfBoyTKTbiu9G8LDEkVw02tkZDTMeLXOf/KryE4HDJLOcEY8PfFolf9Lnq4ZmE15vF5Aa6k2KM3cMuOLIDa3vHyAtPJZP9bwFtcG91TteaO4qT96esLuKNYB/T0om+ENdEIdwIBGcPs7OKrCp7yfcY88sxT3SaORdBQ9rvy3WTP93rWn5+0gIEOuL0VASXXyP2ddebSvV4Kta4znR6vspMKB+NsToJgNucFhKplfqcsd/DSP774F4+508cgkw5qmvdMvCg8uk5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qvfoWXfW84CTiaWGB474mUlXWQtnJhPnvgdPsC/PWE=;
 b=wpg5lbpaekjdi1tyPrU5Za9mCeO3fiuinWeABY59CbC/nEckreID8rY8skKRiDPuaDXDG8Cte9+dgiXgC6JjQoXwzPp9qVY2r3lsYnYbJz52Uj4hD0ZZeu9Sx2CqSqNPBgKJRDRGd+3RMlD+5nWOrbbROqGuZDkPc03PBHjBVxFY9rI9+2Kz9zOwm2AIgeTrbtveSZSTbyomMWAa631cJFgWCPf06zg53meh8Yc+1WpJdllsGc2RI56v78sg4ar28fSaMa9H76uCfKRZJ0/vB0Fzm1x5OIuXsV4L/YUaKDFwmrJ61VKxGOVYwdixd59PDfjh//wZwQJ6VsLWSOlbMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qvfoWXfW84CTiaWGB474mUlXWQtnJhPnvgdPsC/PWE=;
 b=pNPStPfa1DRBVCbAOKyTsfO0d9kweUNhwExx0SwRCT7pAC7wJMcTalXjIRJOw9LsL5qAHg0nwz5cUwM0lko2AfdI4jKnwQOMKVUlMwxMz4x7Vc68Gbe7e2KI1wNSWHD8B5hQkffUTXq3QjgckOfGPqt9X25TI6AtFws0c9tqN4E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMfnYU6hNvaoFfqQ7VNfERVEMmtabtaltTeyqZD3o8EBxDsW4I2chgjYk7eQO+4A1JHMBrojJe6XmE717NydrZlk6F15i+6l7NQ61eBQuWlIotEyKcXZM+bbYBg0hiHmnHcrzc6aGXRynOUGFXIvGeT7O3iqxVOfFFo/OzxtVWlbe7xooBxYqW9G1e5e/S30alhLyxairwURvEB6E9VRf2XFOcbcAAjSOat6C4BJH869aXSX++XbfzxLr2ZlOrLBYu4F9zOPLIBql3oI7gNpgqD6ewJuOQBO8+eWz/oYTOCVw8tfAw8e2YOgEgJuJf2eweczG6wYpCi5O/fJrvv5Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qvfoWXfW84CTiaWGB474mUlXWQtnJhPnvgdPsC/PWE=;
 b=tfMQIyyPDuPT+0+/gvG41jAd3G3tS+sizLOJS9qSKf5H6bfGd5sW+KOTMLLQDIIV4o4QUoF+rEWaUQ7LLODk1BwhsrrCpcHOCh6GYIv+oikA22fF0kb0SrqGcCxKZ/lEsUUv53TS6y3qerx1fweaUZ4E++DNrkiNKTZGx4BZjK7P2uqE7E45yeveABLLqV14qk15MDJ+MCR00IkcTwdkVwN9PwiqrxEvbc1BUVuyplIJ1ydbQxhA7L4wKr2gjNA8TPckMH3RjmZQbdoen455Yx0l1G2ILxtmhbbjOi21brsJXs/d8Vy5i9kJoG3Q4Dd0m3/Ug0RgP6KbtCUny6Hb3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qvfoWXfW84CTiaWGB474mUlXWQtnJhPnvgdPsC/PWE=;
 b=pNPStPfa1DRBVCbAOKyTsfO0d9kweUNhwExx0SwRCT7pAC7wJMcTalXjIRJOw9LsL5qAHg0nwz5cUwM0lko2AfdI4jKnwQOMKVUlMwxMz4x7Vc68Gbe7e2KI1wNSWHD8B5hQkffUTXq3QjgckOfGPqt9X25TI6AtFws0c9tqN4E=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Edward Pickup
	<Edward.Pickup@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 1/3] arm/pci: Add pci-scan boot argument
Thread-Topic: [PATCH v1 1/3] arm/pci: Add pci-scan boot argument
Thread-Index: AQHcAsXViqFNiGIadUqVpLIjHx6cn7RSKQoAgAJfBQA=
Date: Tue, 5 Aug 2025 20:23:59 +0000
Message-ID: <76A89B38-5EBB-4A6C-8991-FA618F537197@arm.com>
References: <cover.1753968306.git.mykyta_poturai@epam.com>
 <98c8889e07d6c82067309d8458e15dd52145b467.1753968306.git.mykyta_poturai@epam.com>
 <2464e97d-e950-4645-9aa9-5c2cddab72b2@suse.com>
In-Reply-To: <2464e97d-e950-4645-9aa9-5c2cddab72b2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DB9PR08MB6617:EE_|DB1PEPF000509F6:EE_|GV2PR08MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: b499327e-939b-422c-51bf-08ddd45e16fa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?d2trRG5tMVVLRXBNU2QrSzh5UHlvYjNFR3lTZGFxdFlYRlJxNm9hblEzWUZq?=
 =?utf-8?B?UG53czRIRzl2d0daUEl1dmhwR1REbG9Sd0JueUliMGNKbHNFZGFVREgrUzND?=
 =?utf-8?B?YUxRMkpQVVZrV2prQTR4c3dMYVJLWjF0OXNzUit0Tkt5QWtkUjRTSC80Q1pZ?=
 =?utf-8?B?RGdjK2VzK0FiSGtPWEtVUDhES29tMnpFdjFRU3F6Rm9IRzNlS0dHTEpBZTNa?=
 =?utf-8?B?M1FDOVZWcDM1SVpBMEtRMFpiS3lrRjRGV1VVZFlBZnZSS2N6TkpnZzFQNUdH?=
 =?utf-8?B?MFJLUlhPYU9PbDFlNGxCL3hLbGJ4RGkyZ2hSWlRya053OXpWQWZkM0V3UDJp?=
 =?utf-8?B?RlRZcDRNbW5LYlphSm50aVNpdnZnNkFNRTUzdDF3TmpWanFob0dUZ2VWTnVz?=
 =?utf-8?B?NEJMVEh3cDB4QTBlV2ZOUGZrR0k5emg0N0hKZTQyblZ5RHR2SjlKS0J6UUNn?=
 =?utf-8?B?a3Z5MEZuamtYdzMrRWN3V2pSWWNSd3Z4NlI4dXZZY0tnTFBPNVp1ODJqVjdX?=
 =?utf-8?B?WXZaYmtsL1JLdDBWYlNEYnZidVVtdFQ5dXBneU5KOFBQdXowN1lGM0ZQY1Vk?=
 =?utf-8?B?ZlIwNG9JTWRYdXVGYUZhQTUzS0E3NHpHRWhDKzR0M0JEWHJzZU5ZRmUvdUFP?=
 =?utf-8?B?NS93amJkMmU5Nm5BM2ZjNXdCcVhkZjVyMHViaDVHZUhtVmZWanBWazJqT0F3?=
 =?utf-8?B?VmdSRkJXcCtwVG1Pbm8rK29Cc0dwaElueUVrOFlJRW9RK29GYXlFZ1JhY2JE?=
 =?utf-8?B?SnJxdnhid1dtREMzajdyZlFOZFFZY25kK1NPOUlkYlppS0ZjNFpSRFd4Rlo1?=
 =?utf-8?B?cEgvTmhvMG5NT3h6YXpvV2tsaklETk4vRmNyOUZyZ2cxazNWVTdtSVdBWHRJ?=
 =?utf-8?B?cGNxQnJtT09wdGtEQkJRY1JWNlFpZHR2ckFyVnBJcXZjUWQzVmxGeXFmdUJL?=
 =?utf-8?B?VVM0blc0Tnh5RS9uK0oxSEFSNVMva2trMEErS3hyR3hwWHFuWldyK1pyRVdE?=
 =?utf-8?B?ZkV0SFJ2RVpJZ3BtV0FpaUhyVnJLa0d0UkE3UmRnNXhRRHlTcVYwRmZPOGVt?=
 =?utf-8?B?VTJUNm80TVd1R2dKS0Q4RFBtYTE0NFUrTDNPMlFqeGtpT293aDBaOHFBZ2tx?=
 =?utf-8?B?dU9TNDRBV3ZUdnIvK0hRTUlDRXdVSnBFQ1RRekkyUjltem10TkpINmxsMTFE?=
 =?utf-8?B?ZjZvWTg2em5zSFp0c2tqRjFkVENwOUkrNDhtMHY0TVRybFE3OVEyWE9FMkp3?=
 =?utf-8?B?NGpuNWl6eldUNzc0ZWtwZmsrbk5ySEE0WGRIa3czb0g0eDNNMlgreitKOEkx?=
 =?utf-8?B?a2VWek1lNUtLUjEyUENVejBCb1NOQ0lBY2tBdFBIY3pZUTIwdGV5My9McUYy?=
 =?utf-8?B?ZEM0UVQ0bUVGNjJJa0lNVi8xK0NkTmg2YW14UlZmYnNiRUJDeGRtdnNITzFn?=
 =?utf-8?B?eGxNbUM1TTkxS1ozaFU3ZmdLcXBMbUg3MkhMbUN2aFU3ZmcvQWMvK003QjRB?=
 =?utf-8?B?VmpQYkMza3dYdy9KMTVWNW1idzEyRHUzRVhjNlJZRkZMY3FZeEwxcExCdzMx?=
 =?utf-8?B?K0tYa3VqblJJSkMvR1FhNXI0ZVp6RzAycFhBRHZvUXpGa011RHM2VWRXenlY?=
 =?utf-8?B?VER5WHZ3L2RNR1NnRUxiUEFtWW95V0J3SUVYUWY0VmpzdTJJWmxHNFVmZ2lj?=
 =?utf-8?B?Uk9ldGt5ZTZvOXV6UkRFbWhvbC9WZjVUc0RYRFA4QWI5eVZic0pmeGUrRGJD?=
 =?utf-8?B?UUZXVHorSkRTcTJnRUlWKzMzeEhoMGN3ZXJ5Tkc4dGlHL0lTM20xdlNxL1V1?=
 =?utf-8?B?RmRhWTdGMFo5YkVvdXZnQVFJRzFzb0Q1cVJhMlJhZXJSWWFUaTRNWlRMV1Za?=
 =?utf-8?B?YkE3NkgvY0t3cUlSQUNhZU1jR2czdzBDNFdxaDhBTjN6dGRkYmJKZU9CckQw?=
 =?utf-8?B?bkJxREljMzNyUXFRbkNYRytoWVVCaW5wQXovMkNKMFJXN0VhVkN6dGM4RXoz?=
 =?utf-8?B?M29iZFFRVVJnPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BE9EA95EBF0364BB0BF4821E91D6625@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6617
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a67fb108-b4b1-41f9-b369-08ddd45e02e2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|14060799003|7416014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dU9FVEhPRENqZnljNHBRbzlwOFp6YTNOcGNoc0ttaFc1ZXRMbE9iR2pGb2dm?=
 =?utf-8?B?dTgzQUFwZ2tQQlVLV3E2bHM2Nm5Uc0NBTmdldGlCbThUYXkydjFoQkdxblRN?=
 =?utf-8?B?ZEttWjk5N0MyeHV3NmdLRVdxOFYwNy82d1BBREdsZVVTcFBZQnlqVk1WZnVo?=
 =?utf-8?B?VjFRb1p5QUhjaENYd3JSZWFGdkFnU1l1VVZ5ejIvSVA2UUZ1YTZhcHUwaS9k?=
 =?utf-8?B?RkczWVpXdnlqeEpVdGhjNmdTSHp5a2F0N2Y4ckR0N0xkZ245bW5kMHlvb3pW?=
 =?utf-8?B?OFdabENUemhBVFMwZlN3d2h3aXBxN2tMbnZLRHFzbnlSUHprYk1zQ21tMkd1?=
 =?utf-8?B?cjBqcVdScFdmTUJCTkdpVzJ1UVIyRTluN3RqT1NpQlM1SGxMUnRCKzRGUS9J?=
 =?utf-8?B?ayszMGp3ODQ5cFI2eWNkZ25CQ3JyWTNPQ2RvbWtwb0p5ZkNSZk9leHJrZkZx?=
 =?utf-8?B?UU11dnc4di84bHltRWgwU0VaS1NWSHNYZDVSeTArYkNPSlliQTdPYVIySG90?=
 =?utf-8?B?MVhnYTAyWmJDMmpzRDN3dW5Cd0NRUGtBaHRkeklKK2pCcWZDOFlvNE9iWDlH?=
 =?utf-8?B?ZjliVCt3aU5abjZacVlsWkNXYWVOb0hmd1dKK2RlUkJrQlZrN1MxbkFVUGZE?=
 =?utf-8?B?T1pMLzk5bDc0a1c5OUVxc2RiS1c1d1EwNnkya0FvSVBiTGdvRkpLN1pxYlhP?=
 =?utf-8?B?alQ1RTZiUC9nT2xpeFFaQ3RkMWxNK3VydlFybFNJZE9aODQzSTFtc29MWWRz?=
 =?utf-8?B?dm5VOUFLV05RR1AzOWEvUWtpVGtOem5zVE8zbzFvZ09JdkxtS1JYNVFmakRR?=
 =?utf-8?B?OGpZQnNkTDlwOVJoR2JSZTZzaXdVQWU1R0cxbnlUNXRURzY4OHpDeEdMTVFw?=
 =?utf-8?B?c1dWYmJuVXdsaUN5dnJPMVIvVlpGRVdWYnpxQkxDUlBvWUVxVnJSMi9GUVRK?=
 =?utf-8?B?a2tRcWxVdkJ1elFSS3NRTm9SUFh5QlpCdWhvd1ljOHdXV0pOMHZwallndkM0?=
 =?utf-8?B?UThGQ0tLd2thV2ZyTmROcmgxcWNRQTBxT0wzWXRlYys5dTJEU1FOSkJDMVJC?=
 =?utf-8?B?VnJlK3l2WTVYdUFRMTgxR2NodGFVSkVUMnVwQWF1UHFSNDdmeVVjQXZzNUp5?=
 =?utf-8?B?dzBVU3FVQ3FTRnV2OHIzZmEybHJ2M0pabGRPei9ZWHFmTXFGcWsvNFl4T0gx?=
 =?utf-8?B?eWV4elV0RmdGZ0l3TlRFc0RMNnk4bHVPNXRpWllNUDYweEl6cld3Wk00OEN1?=
 =?utf-8?B?UG5nWnA1dGE2TGNCL3Vkazh1OHpTZUsvVmttYmYxRVBRTWQxTWowSzlXdjBI?=
 =?utf-8?B?TzlIMXl2T2hhS09xL1FhVFF6Yi9SaEovelBiUWhSTTh5cTdkY0l5VElUNnEw?=
 =?utf-8?B?cVh4WEhvOGxTZktIVitDdll1elFjRWh1Yk44MUJzV2pjTDN1dmd3V2t1QzBK?=
 =?utf-8?B?T2o5aW1GUWdJVWlDWUw3Q3o2OXVzTlNhOWtnU2FGRUxFVzhqZ3Z3ajRSL3pl?=
 =?utf-8?B?aXpndGNhMHRIVjk1ekZMcnkybU1rdjlGMGthb2sxdVZJdWFTU0wwRENzTGtL?=
 =?utf-8?B?QnVJOWN0RitBZ2ZzMExXK01yMTV6cmJaNnVqejY4Z2ZwSG5CZXhvZjd6Qk1m?=
 =?utf-8?B?TlY2VG95VkZpWDEvMlQ3TlNGNzdUVVNHVzJyVXJiRzRjdDZIZ0ptVW9xd3JS?=
 =?utf-8?B?d0JWL2dTRE5tRmliZW4rUm52Q3Rmb0VORU04WEpITEUwUHpnQ1drN3RPbDR3?=
 =?utf-8?B?eEdnWndNM21QSDJRZ202aU51KzBjRWFibXVLQ3M5aTNOMTNydUxyaEhPQ3V5?=
 =?utf-8?B?YWpab1RPb1hXamFZeTgvdnFhWHA0Tk9LZXhCQzhtZkxzTXYrblpVakRYQWQv?=
 =?utf-8?B?QjhxSHAxQ0NXWHN5U0IwUmROK0V2aEV0T0h0SUVvRkhZbk5qYnlVc1hqSmU1?=
 =?utf-8?B?ME43QzBKRFBQMG54SUtrQXRtMFVnWUlDc2JRSERwV2RrK25qWTh5UDlnNDFD?=
 =?utf-8?B?Zk9aYjFwY1d1QVV6NWd5UEF2MTdIWEJSL24vME15QXVYMkRFQXIwMlJYK3pw?=
 =?utf-8?Q?2Zfl7A?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(14060799003)(7416014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 20:24:33.3006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b499327e-939b-422c-51bf-08ddd45e16fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8512

SGkgSmFuLA0KDQo+IE9uIDQgQXVnIDIwMjUsIGF0IDA5OjEwLCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDEuMDguMjAyNSAxMToyMiwgTXlreXRhIFBv
dHVyYWkgd3JvdGU6DQo+PiBGcm9tOiBFZHdhcmQgUGlja3VwIDxFZHdhcmQuUGlja3VwQGFybS5j
b20+DQo+PiANCj4+IFRoaXMgcGF0Y2ggYWRkcyBhIFhlbiBib290IGFyZ3VtZW50cyB0aGF0LCBp
ZiBlbmFibGVkLCBjYXVzZXMgYSBjYWxsIHRvDQo+PiBleGlzdGluZyBjb2RlIHRvIHNjYW4gcGNp
IGRldmljZXMgZW51bWVyYXRlZCBieSB0aGUgZmlybXdhcmUuDQo+PiANCj4+IFRoaXMgcGF0Y2gg
YWxzbyBtYWtlcyBhbiBleGlzdGluZyBkZWJ1ZyBmdW5jdGlvbiB2aWV3YWJsZSBvdXRzaWRlIGl0
cw0KPj4gdHJhbnNsYXRpb24gdW5pdCwgYW5kIHVzZXMgdGhpcyB0byBkdW1wIHRoZSBQQ0kgZGV2
aWNlcyBmb3VuZC4NCj4+IFRoZSBkZWJ1ZyBtZXNzYWdlIGlzIGNvbnRyb2xsZWQgYnkgY29uZmln
IERFQlVHLg0KPj4gDQo+PiBBZGRpdGlvbmFsbHksIHRoaXMgcGF0Y2ggbW9kaWZpZXMgc2VnbWVu
dCBsb2FkaW5nIHRvIGVuc3VyZSB0aGF0IFBDSQ0KPj4gZGV2aWNlcyBvbiBvdGhlciBzZWdtZW50
cyBhcmUgcHJvcGVybHkgZm91bmQuDQo+PiANCj4+IFRoaXMgd2lsbCBiZSBuZWVkZWQgYWhlYWQg
b2YgZG9tMGxlc3Mgc3VwcG9ydCBmb3IgcGNpIHBhc3N0aHJvdWdoIG9uDQo+PiBhcm0uDQo+PiAN
Cj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEVkd2FyZCBQaWNrdXAgPEVkd2FyZC5QaWNrdXBAYXJtLmNvbT4N
Cj4gDQo+IENvbnNpZGVyaW5nIHRoZSBGcm9tOiBhYm92ZSBhbmQgdGhpcyBvcmRlciBvZiBTLW8t
YjogV2hvIGlzIGl0IHJlYWxseSB0aGF0DQo+IHdhcyB0aGUgb3JpZ2luYWwgYXV0aG9yIGhlcmU/
DQoNCkkgdGhpbmsgdGhpcyBwYXRjaCB3YXMgbWluZSwgcHJvYmFibHkgc29tZSBpc3N1ZXMgZnJv
bSBFZHdhcmQsIGFueXdheSBoZSBkb2VzbuKAmXQgd29yayBhdCBhcm0gYW55bW9yZS4NCg0KQ2hl
ZXJzLA0KTHVjYQ==

