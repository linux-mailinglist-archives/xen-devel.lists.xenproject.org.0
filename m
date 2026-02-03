Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPzKKvHLgWl1JwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 11:20:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21121D782D
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 11:20:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219192.1528124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnDW2-0007rn-SB; Tue, 03 Feb 2026 10:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219192.1528124; Tue, 03 Feb 2026 10:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnDW2-0007pt-PR; Tue, 03 Feb 2026 10:20:14 +0000
Received: by outflank-mailman (input) for mailman id 1219192;
 Tue, 03 Feb 2026 10:20:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Q51=AH=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vnDW1-0007pn-6h
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 10:20:13 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e91797a4-00e9-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 11:20:07 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY1PR03MB7873.namprd03.prod.outlook.com (2603:10b6:a03:5af::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 10:20:04 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 10:20:04 +0000
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
X-Inumbo-ID: e91797a4-00e9-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMTs3eujFQGYEh67J2W4onqAPoHbf2fX+LeneIJdShHirS7jhS4pxOCvi4VrFQxB94c+yZWFkvFhzXV0QlS7lycgJy+SHHEdtxNoNnIJ6WljX4JGLaJz09mrjA3j59QXc/79d2nMQ/WlSbBGVHO/Lq3t20gIZLYbbVhsdWELAZPsmHIGjGtSbeiMRmK5n8cFfFrrC/RkAL5HxKd8dJw6E1t8waj4Ge9e+h2ZbZnwM1q++0XQXwgegdz35kRkEZviWHBQ2C4aW+Dc8yOrTH7PMiAxHNUSsJ+NvJ9mNuyUehWgmGh0D8e4S9bTMMvmTSsJ3gLeRrU3l1SRA9JWEQH3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8t4lTy+HnryL6HZIgCoaTVCisKyPk1JgemeOHDe9gGA=;
 b=S6vsrfgt00QhOTKEAIYGjaNm/fBayKqXaiT3E/3l1/MWtVdXyo6yyqlMKAfxotYstrLhhJf2R4NIDkLJTfU7clAhcNgObsxhZWFYNsvsY0PJUTzyiaRWxXeEkR/JQKcoEc1QFxE8f6hMMgN13d7XeiAj73WwvZNYKtTDb8T6/ChwVJgh9Bi9UjzDkzFlC+d/BaZJJZuw2L9jWdFChsHSNUxKRHvB5sOslfRDR9x93yY3mweQpmmzTGdRN/1AJP9gUTg07cfbo8evmyQZ2Mg8okEjrzvcP83jKjmOrlvfgmsIxKaEwcFy1SvAfkmWQNroE037CsA/2KuLX0WLamC1OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8t4lTy+HnryL6HZIgCoaTVCisKyPk1JgemeOHDe9gGA=;
 b=RjH+vQq87XWn1P47eBDjX/iXA++rL6AWrH/BgBQM3S1ALVK55vpon1L7wKVvJWz7BRlshzxeDHuDCR8Ksag24T0s6vvo8q8nDofNRme9t3fSOX5RA6WGWGhFEzgSVoaM8/V02MaRMYEeewaIyRRQN81VIaiGJ17i+kN5l0q6c88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 Feb 2026 11:20:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/domain: adjust limitation on shared_info allocation
 below 4G
Message-ID: <aYHL0CChPShMUtHw@Mac.lan>
References: <20260203101017.56962-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260203101017.56962-1-roger.pau@citrix.com>
X-ClientProxiedBy: MA2P292CA0018.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::8)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY1PR03MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 706a1915-6f7e-4c84-e551-08de630dcbb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZW03cndOOTNoa1Jtb2hlQk9OTm1sNUxYS0dqamQ1UWVZaXZINUZFKzZOK0ox?=
 =?utf-8?B?ekFEUDk3cFFQaFFrcG5jS1lmUWdZSUlEZmpvQW9RY2tYWXlzQncwYnFFbVRU?=
 =?utf-8?B?SGlGVS9TRER3SEZueHRNZEpua1JCRHQvSWtpbnBRUWJIZXJjbWVUbHR4ME1M?=
 =?utf-8?B?Z3BQdjJxNE9BQm9OMUVBRmVXTTFGN2xzRWE5K01pTWNLKzlsMmZ4R1FmZm1X?=
 =?utf-8?B?YlVkM0VLTVo2Z0kxSnA0L0RSZWEzbUliQ09BLzh5RDk3ZGs3dW9BUEN1d0k5?=
 =?utf-8?B?Qml1ZW1IYS80Y3NwNGorSjFZSUlGK0kra0pqTC9zRkVqaWRnYlI3Qi9iY1ln?=
 =?utf-8?B?eFp6Tk1JaGthK3VLcTZ4RmdDblhiaE1RMUsxZmdERndrZUpReWNiN3BhYU04?=
 =?utf-8?B?d1pFKytYclNFZTFsSU51QVB6ZnQ2eEZGWlZLSkZZMzc5Q1Q2akdOUUw1Y2Vo?=
 =?utf-8?B?bks2R2ljL1I1YmVJS1NVZDQzT0FYS1ZYc3lzMC8rUDVGUnFBbm5yUVBzRjlJ?=
 =?utf-8?B?Q1U2a0RzTndJaGxhMzcxMlhOeFV4WTh2dXRKSGhUczBXblI0azFzdTU5di9l?=
 =?utf-8?B?SE9NWEU0UHlNTzRMamJKa0F3MWFUWXJKRlhPelFaWDlVM1pGMUhBTVl0N0I0?=
 =?utf-8?B?NUdOMkFpcDJ4elpwenovaUtPN2JFUCs1Sk5vd2pFNUtsbEpOV1Y5MzMvTk9G?=
 =?utf-8?B?Y1huNUZtdFFIVFloWnB6NW1RN3A5WlRib2NXWlMvTGpyK0prcW9LWUhjY2o1?=
 =?utf-8?B?QWw4VXhJQkFKRmtiSjJFSmJGZkVFUUQ2UzMwa053di9Pd3lhdmFDZ1dsTHJQ?=
 =?utf-8?B?YTZveE9PbU4yWitGWHQyL2NHU29QSGczREpoSG1JenQ3YXAyQ1U4UzFCOTNz?=
 =?utf-8?B?UDZrTUI2T01qUnRhV2EzOFhnRHprQVM3bytKdFJYMXdyNzgzVzBYbEQ2cTJK?=
 =?utf-8?B?U0tneGg2aWFTMGtnNHVLZExiSm95Y2UwLzFnMmFhN0ZMN3I1cFpHQmRBbFZS?=
 =?utf-8?B?TElvckh1dWlSb0xnRlJjd21uaTBnOEtIU2o1ZUJJZEJFSmVtNHhKK1pNL1BQ?=
 =?utf-8?B?Y2xtLzU3N09UTWxhNGVCL0JKKzRCd1lNTUhuNHFrTk9ER1dtc25IbnQ5SEpN?=
 =?utf-8?B?VkFtUGRaakVvUnRpd3hON2xJRE42Qnl3aFBBbHBUSVdRKzhkRWV0bTl1MVhU?=
 =?utf-8?B?V1J0bFhuSDlVSWZ6QWtvUHM4Wi90TEc1aFdsME1WRHNobWVWK2tBU0FJN1hm?=
 =?utf-8?B?TVpDQVlYQkRnUUtiRGt0amZmdGdFUHp1ZVpHRC9QWFpWY0ZqNk8yNXF3YUVM?=
 =?utf-8?B?NHFQZ3h5VkRGV2d6bWN3L2lCbDRyVGErVUMyZkt5NWRveDRxSW9UbmdUaDhj?=
 =?utf-8?B?RG92a0dLeVEwcXNpMXo3UVV2NmxWUlQxeW9ZSDdXZjQwTzFFOGtRRTJqOFVq?=
 =?utf-8?B?aW9LUDNncVIyMEpSS2xzakFaSS9YN2k4Vkw1ZktnTFBPSWgwQ2YrRUk3NHBv?=
 =?utf-8?B?SUI4OFFTYU9tekh1aEhOQ1gxeDN5TnVyM3Z3Q2hOVnhxYjc3andsY3NQREx0?=
 =?utf-8?B?R3grM0dzTXc5SlVQbjVZdUJGMVdzNUtnZkd4U21BYjNQOHNWS3ZKNzl6WFRU?=
 =?utf-8?B?Vi9VWVVQKzE3NEU5SWVHaC9MU2pYVWJ2NHRaUURpQ1BuOWMvbXB1OHdtcVFk?=
 =?utf-8?B?Y0t6WFllVHBIREgrMndLWkhveEFDRGxPNEdBTDl3VFpaS01PUC9xVXFmR3lC?=
 =?utf-8?B?V0x1M2ZzdkNTMC94Nlc1Q1hjZklzTlQ2WXIxVjRSVGE5U0FTZ3FqMi9URGIy?=
 =?utf-8?B?WmNOaVBWUWN1VHpRMGtzcndjQkdVenVPTmpHZ2ZiK09SQURWVEwzYWJRT1BN?=
 =?utf-8?B?aGhiV3grSkVwTTZEdytDODFBcVdyL3NxYnhPVHBFRkUwUVVCWWtGT2NNYmI5?=
 =?utf-8?B?WG1JQzZZV3diRG1DdkNyeWJSaTFEcjFCUkhPcE44V1lXdUx1UFIvSEY4U0tX?=
 =?utf-8?B?dHp1QUFPRUtYUkw2VHlWMkNNNDI1bmpLSml5UldQY1lYWFB3Y295U3hSTG5I?=
 =?utf-8?B?dWFWOHlMWDZnSXRrS1lXU240dnhxaW1MVUdGbzI3dGFYSUpDQ0g3eUJpajZF?=
 =?utf-8?Q?52VI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFJLaG1SKzJ0eGE5dk94TTlqSUZ0VmhQMDk4QU4rcEtmWTF2d3JLYnpPZFVF?=
 =?utf-8?B?ZURYMkRDN3F0OC9rYjZINlJZS1JrTG5idjAzbEVyd3VkUm95ekZUbHBwL0My?=
 =?utf-8?B?alkydHZrVVZ4SVJFdHdrcElJOU5iazIzU0czeFZ0RTg4bWx5RXQ0UitZU2lY?=
 =?utf-8?B?QU5jMXlvbitCUVpVdTE1aDNzR0w2K201dUVxRUR3YkhIeXp2djVFZ0pieDE5?=
 =?utf-8?B?bUZ2T2ZxQWZHbEZmVWZtRWllV05NaEJ5KzlkMy9nanREOGdYK09IL0pydkx0?=
 =?utf-8?B?dkttUlQrTzBhd1RleW81SXFsMEYrZEJRNTFMeStsYzBkRERsakxmbjdkUEhT?=
 =?utf-8?B?NjFXQWJDbDZ5dXVvS3Y0RWN5aDBJZHdHeGFBQUFqdGlrZVpvdzA3SUZManJS?=
 =?utf-8?B?YTVBNzM2dnV3d1h5MFNCenBMOWpmRVRUMzdTcmE2TS91QndGeTdFYzg3NVhI?=
 =?utf-8?B?YXpXaG4xTWMwRXJWWkNIMU83ZVRaeXUyK2U1bDNFclplRGF1UmN4bjF1bEdY?=
 =?utf-8?B?MklRTVRJdy83Vk5ZaVQ1K0IvVEhCQUpVTUVRQVltR1BRRFV4bEpKbDF4OU00?=
 =?utf-8?B?UmRyNW1aYXJldzFiMG1TYXNMbkVVQUdmbW5UeC81clpyNmQwRFFNN1NzNGdL?=
 =?utf-8?B?cVo5S1ZWTlRCaXZWMEtVTEFWRjQyUUhEU2oyNGVKSWJIQ2dQZSt0ZFlSOUhC?=
 =?utf-8?B?TFhXU2NVZWtIbXp4dDhWM0h6aGNxbjZRKzMvRzVnZGRtMTh0SjcwVXFxR1M2?=
 =?utf-8?B?L0ZGb1gzN0d5ZVRMYlcwZHQ1T0tBcDdwNEM0bVlNcDdmVjUySGQ1MXdMMHJk?=
 =?utf-8?B?L29Sd2pyRkR4VzlqWWVwUGluM2JydG8ySVlqd01UeVdDMDh6S1dOUXppODUv?=
 =?utf-8?B?QTI4bFdhWUFIaHVaaU1HaHFXSzlPWkYxNUdwYmRxcE5kc09PVjJPcWJFN3NT?=
 =?utf-8?B?YUhMQk8vTHkxOVZGN2JEM1BwSXlrN2wrZFkwTktBd2IxaGRteUt0TlhHcjlt?=
 =?utf-8?B?dVhRajR1dHZMMEpJTi9NcHUzb3VhYkM1c2hHZ3pFTnU0RDlyN1VwWWJJcmd5?=
 =?utf-8?B?Um5YMTBHUEVOWW43Q1JTTWVlZWtpaFc3RTdHdjdLTkdBd0lrUVlLeU5DU2lG?=
 =?utf-8?B?OXRKdTN1eWFscE5KOXN4R3ExQWttRDhqSEFTajArcFZTTGtDRmg0dys5d2ps?=
 =?utf-8?B?Q1dCVzE3dDl3THFmU0hZeGF0Zm02WlZNT3FCUk92Sm8reE5QMlBLOURYRkxv?=
 =?utf-8?B?ZmMxekNQNXRyM2FBM05EOEZjSWNXT1BWWUZBemlycDh2bmFlWjIveFVDV29v?=
 =?utf-8?B?dFlnZitqQ0FHa0pEblhHZTlHR1lPdU9nWWZTS0RSWUZKdHg3OUkwRmpaOTFE?=
 =?utf-8?B?dWVMcW03VUlWOW5pUkg5WHRrbHV5cmlYWnBydHkwM1JieHpqei84UEZnKzRz?=
 =?utf-8?B?QnRsbDZxVWVTR3p2NW1GUnI5ZWY4VWwzT0FlR2JySFJEcHRTaWlNL2tYdVRJ?=
 =?utf-8?B?bG5keUZEbjN0V1E0NlQ1Z0h5aFFmRFd0eE83Rk4xWXd3YllhaU1ZbHN4OUZY?=
 =?utf-8?B?NFpDZWRSRHBXNnNpMDlqZ3pGK2JlYVFpSVlPeDJLUEFUREhtZ1FPQ0tWZjVW?=
 =?utf-8?B?ZDkyUW1mNGxzS0dIMEVVSFZMbCtCazFXNHdYdXBYQVFScDl2S3orWGsvM0x5?=
 =?utf-8?B?QXZETHJ0eXRkRGZmUlJ6UTNSUDBzWmxwL3RzT0xVMlJhcXEvdUJ4WDIxVkFU?=
 =?utf-8?B?SDJJUzhFZkZOR0gzdHNaMHFvRUt1Z3loTEZYNFBiZlRGenlvTXUwOHZENzBj?=
 =?utf-8?B?U1FvS2FFYkhWc0EvcEt2dkpXbGw5L1ZKZ3p6ZXRaYkxHaTVScGxtSVYrN1dW?=
 =?utf-8?B?WTVEbWVIRnUyd3ZCTHJyUDZLMWQ5azg5Q3JBUHl4VXdZc05idldzLzBLdlRX?=
 =?utf-8?B?UXdjR2JZQXJQbE8vQkttYlNWWnJGQThYdG4wZzZVV2hnWHBlSklCUHF3N3VG?=
 =?utf-8?B?YjNBQ2ZpSjJxMkl1ZkxZcXIvWDFiWDNwUk5NU0NFYXRPZkhlNUswdnZXV003?=
 =?utf-8?B?eDNWeENyZVFRcmZ3dDFhZ3c2VzRESjJZbzlpQnJ4US9JaGtRTnBocTVXckFM?=
 =?utf-8?B?Tko1UHJQZ0wxaWtHRURjSlcra0wzZHZZTWlkNjNQNW5MVGM3OG5qYTJicWpE?=
 =?utf-8?B?TkFLZnpMTHMzMmJ5a1B4amFkWVVFaHMwWHNxMjRhZjB4bFNtU0dvdjlHb2Ew?=
 =?utf-8?B?ZjBVMVE5YkU2L3JjVUFVeVJKRnBkUkl2WkpVeXJZQkRJQisrdXhEamljZ3Fo?=
 =?utf-8?B?RmhJQUh1TFRkbmM2dGY1dFVTQXBETmdLV1R4ZjZ3NndMc3FSdlc2QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706a1915-6f7e-4c84-e551-08de630dcbb7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 10:20:03.9321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jxm8Db4Mysyoj0pob0izOxW+kTHcewVbZ5JeBcJc2Wqr6FBT1HCuSort0mzjIYkY36J6tLU3b3bUuI7zhR1eow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7873
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,Mac.lan:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 21121D782D
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 11:10:17AM +0100, Roger Pau Monne wrote:
> The limitation of shared_info being allocated below 4G to fit in the
> start_info field only applies to 32bit PV guests.  On 64bit PV guests the
> start_info field is 64bits wide.  HVM guests don't use start_info at all.
> 
> Limit the allocation address restriction to 32bit PV guests only.
> 
> Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/domain.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index edb76366b596..4163568043b1 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -882,10 +882,13 @@ int arch_domain_create(struct domain *d,
>          goto fail;
>  
>      /*
> -     * The shared_info machine address must fit in a 32-bit field within a
> -     * 32-bit guest's start_info structure. Hence we specify MEMF_bits(32).
> +     * For 32bit PV guests the shared_info machine address must fit in a 32-bit
> +     * field within the guest's start_info structure. Hence we specify
> +     * MEMF_bits(32).
>       */
> -    if ( (d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32))) == NULL )
> +    if ( (d->shared_info =
> +          alloc_xenheap_pages(0, is_pv_32bit_domain(d) ? MEMF_bits(32)
> +                                                       : 0)) == NULL )

Sorry, this is wrong, it's too early to know whether the domain is 32
or 64bit.

Roger.

