Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AB0C9D268
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 23:08:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176389.1500884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQYXl-0008AK-KW; Tue, 02 Dec 2025 22:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176389.1500884; Tue, 02 Dec 2025 22:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQYXl-00088l-Hi; Tue, 02 Dec 2025 22:08:21 +0000
Received: by outflank-mailman (input) for mailman id 1176389;
 Tue, 02 Dec 2025 22:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiuh=6I=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vQYXk-00088f-06
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 22:08:20 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6764768d-cfcb-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 23:08:17 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by AS2PR03MB9419.eurprd03.prod.outlook.com (2603:10a6:20b:59d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 22:08:13 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 22:08:13 +0000
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
X-Inumbo-ID: 6764768d-cfcb-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeYpum/DZNzUasnCOajtw76zEOO7PUfjU0oBokzWjRYzQCquwI8PlNZqV3GKB1GvZWvy2ZYmsJDPuQi2eSRhSwZ8GYsb8/KndLteGK9tCM9R87CSuVDnbX03viPveA6Ux9RJX4zQss/Hz1ZZdhhVw+6TsONDD/WE9sI4uZqmTvqy0KRifru/Jd/qbKq9plg+lvAMdE73gRvYuGFYm7WniPEAycLX9/mJ2AXN2w4ff4muJ80dp6aYtEdZlEc+eQ3zLa4P6ekMPo1kJG7oem7g17nrO4z6xkf5l1arFlsuShKlB3/kQhHHLjHo0ikBkPxmW7HsEjwkKwULkxcstRQN5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIXK5Wkamt1SBWwVFDU42iIXdHitqwWjwSybZiNCCmE=;
 b=YDRQYHLDfgbs/s6G5LLr0ISYXq5EA4nZBmvOu9uXpeOTEaX4tOgaa3o4m205Nijip9WqqcNaL4V4HnkCWRBwA4voFjO9GmQmc2nQcaYglNyHDboVusBYSH2fsujaIpjqxjszvBfWminzXFls/8AHcfkccku3L9pbcr6RbAsOjEjLNMOJN1OLpjuWIHUCYU+Wo8IbXjKkZZ+XB5hjwaiUjlOKxZb23ZLzrXzaAip0SdUVnlZf9ZrwVFgdPeCnSt3y2bYKlBE3ggtQhGGMbIkJCW0jXf2pXuVhhOaF5jlK7RUtSbJIIV4Z+gCrbG6Ox1HQybkEItl8fLahFehhG7fBcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIXK5Wkamt1SBWwVFDU42iIXdHitqwWjwSybZiNCCmE=;
 b=QoU3anWYGyOZawgBTFtuWIMeBAt38ukTSHwy2zg2FMEw0qr/IcnmqgnSOc1x7ZBYBEU50qujWegPYRvKHHNROQx8GP3Kl5YiJ0bVRHIOBq8djJCmBoQ4+KMB104lB1ctQOxEAsmqsh4mR+/NxrK656jssCB3fuYqZmLfIr2aJeGeHGvxI15pMRxz3myaefaasNNEgV9Tr3sucpUKT97o0LcZZwL84U0tA2pkzsCqVJhRDfAPX7Eh/ZpCUEM40+FZ1y/ugfQxpUkIOOETaj7yt63IEQQL6CgBppW6KnDYuTzwsTtPuire0q1EEmFuzujnLhhfAhXfj6onmbzq8HsNXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <c776c308-cda6-412f-b03c-a4b691b69d33@epam.com>
Date: Tue, 2 Dec 2025 23:08:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
To: Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Nick Rosbrook
 <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
 <CAJ=z9a1eM6M+Gagond9TiFtF7c7EEQKOKHANcvDWDhW_3JzqOA@mail.gmail.com>
 <12ba4388-ee23-4e17-910f-9702271865ad@epam.com>
 <b1f79b84-d0c4-4807-87a7-1cf94e58ecee@xen.org>
 <a5943713-85fa-48ad-86fe-5698604ed8c9@epam.com> <87v7m93bo0.fsf@epam.com>
 <6c80a929-8139-4461-b11c-e6ac67c3d2e4@epam.com> <875xe6ytyk.fsf@epam.com>
 <65727710-0a88-4fff-bb5b-9cf34106833c@epam.com>
 <5df30dbf-17a2-446f-83f9-0e4468622917@epam.com>
 <485a8166-5079-4c0e-a6bf-f6aee8af991d@xen.org>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <485a8166-5079-4c0e-a6bf-f6aee8af991d@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0266.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::39) To AS8PR03MB8322.eurprd03.prod.outlook.com
 (2603:10a6:20b:509::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB8322:EE_|AS2PR03MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4c195e-7d2d-44bf-e82a-08de31ef494c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|3122999012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SENHZjBxWUIwblYvUlVZaFpDR3VGNnI4UU5jTjA5NjhoOGVMTjBlTksrbkxH?=
 =?utf-8?B?a3U1YnRjbnJSQ3loc0p6ZHE0L25mNEt6dEZLUndaRDVna3o3QTArb1M3ZXdy?=
 =?utf-8?B?dmpQdkUyc3liVlN2R2JIOWp0N3FrSllWY1dkSTJub2NIb3FRbTJaeW4zc2tI?=
 =?utf-8?B?NnpOc1J3ditGWDJ3eGlsdUQ1QjN2UGRJS3lFOFdCMm0rcEJrSXlpK0NXZWp1?=
 =?utf-8?B?TEpiOUJzVG5yZ1JKYm54RWI0WEVOVUg1Z015ZkxzQW9PVTM1bVlrTDhyS0VD?=
 =?utf-8?B?WHFkbHk5RzVxRGhDaTU1cWRYMjBmWmlPVG1uK2l3N0VVR0d1Z241WU8weE1X?=
 =?utf-8?B?UEVkNHFxZ1FBay9paGZpWnBkMFk5ajdjdXpSUkZTYXdVWmZ3MDg5SjhxUHdR?=
 =?utf-8?B?KzFJOVNjenlrWFIxN3FiRXhHUEVFdVVsUTNGM3VIY1JLUU5VRlU1bEFtQ05a?=
 =?utf-8?B?djdyZEZBb0lMY1RDSUUwWWlvOGN4b1R4a1ljVFFEK0ZYRkdxUk1YUVVMRTNR?=
 =?utf-8?B?UEt6YU1ueWNYblhsWGZ3VSttTlFHd00xNmgzcE0vZmVTbFBCcWR6Qjh1bEFO?=
 =?utf-8?B?N3hEZVRienZjVDJXN1hlOW5qZ2tLcWIyQTlaNlJBV1ZMK2NFNS91VzQxYnM2?=
 =?utf-8?B?OXhLN3lCR2RqSlBEalZ2SkJkK2diZEpQWVFhMXl5UDZjV09pMEVGQXZlQlA3?=
 =?utf-8?B?SHExODRUT0E1MFhVdXFjSDNJeDhaem14L2dhZ2Q5ZEFnODdjQUVIby9POERI?=
 =?utf-8?B?YUZ5YjdYRmZkZjU1V0RVTDJJTkR4cXBCVERvM3VkMEg1NlRrRWVVdmc3TzNX?=
 =?utf-8?B?QmVxSzJocDZPQnFTV1NJN1JkajludlBIVHpTMkc0SG52RDJQS1NNS2pTSlJM?=
 =?utf-8?B?OUtlMC80M3JEUE82cURzc3BvamVwdHJZQWpLYm1nTnNIWksxQ3JuK3JyN0pM?=
 =?utf-8?B?ODZ1QWJVMWZvamFxZmhJNmt6NnloMGw4QysySXk2T2F1WElxazJZRUgzRDRx?=
 =?utf-8?B?cWltaXAycVY1NkpjR1BSakplUzJCbitoaE1kZ0lHR0RpUm5GTm5idnI2MEI0?=
 =?utf-8?B?SXR3bEZVaG5HczhGMWJxR05WMldPS0tLUndoYnB1eHV0TVh3MG5WY0VZaXc1?=
 =?utf-8?B?QWFmcWd1WitXOEN2RlhpRTcwcGNIUGxWM0F4NVVCUXlxc3FoNktNdERwWGMr?=
 =?utf-8?B?eDZwZ2U2WG5VU1dBTzMxUVR1NEsvaUhjNGd6NEdRbk9BcDRvZ051RlFKcXha?=
 =?utf-8?B?Vndpb2MrcVg2a0hxeGZxcmJpRWgrSnI3MHVDNHBrK3o5MlVMNTRvM2FwOUtG?=
 =?utf-8?B?dWVhY0FhQUE5L0ZVaVBWQnNqaE50VVplRzM2NUdiZVJPc21qVElJSXd2a3Uz?=
 =?utf-8?B?WkFiSnRWdTdYVmtCNXZwUmI0dFVMbXRYZWFhNk5wblpWQlFpZW9WdVJWY3E5?=
 =?utf-8?B?MDE4YmJ2L0hJVlR1VFZqMWlVaXgxOGRlRGw3S0xSZnVrTGNyWFJJdm55ZXpo?=
 =?utf-8?B?SlBwQ2dGZGNVcEk0NW0yVlo5SXdoSkFxZkp0NVFkVGRKWHZMcEFMRWFMUmFB?=
 =?utf-8?B?V0NmYnBqVlN0RjcvT01FWHphdlNzY29zMm91YXlGYXRCcVAzWWJ2b2YzTUt1?=
 =?utf-8?B?Y21jK1cxazMzb3lsN3JKcEdZRmNBSjhJcnZwejRUSjBkNFJwclJlWVZnQ0V6?=
 =?utf-8?B?ZmMyTnVSRnRwUzJ3bHpJYWwrQlJ6Ym9tZXhhM3hrR0xUSWJqUkFqZnpZclll?=
 =?utf-8?B?c0ZyRmFUWHU2N09PcWpaa2g3SzRSTzQrbXM3WERqOVZ4ZldLcTZJa0ZjS2pN?=
 =?utf-8?B?TmhmTFVVcXhFanpDanFMRitsSkQvYTdlVjhNWm5Mbmc1dmZXcCs4ZStqUW10?=
 =?utf-8?B?NG9VeFB6b1h5SUcyZ1gyMCtiOU9iT0N4WEV6UUNlcWlFakpUZVRkQzlTY3hQ?=
 =?utf-8?B?Q2dMOFU2aVZwRXRoWE9TYjloSUVoRi9vT1M2S0ZRNlhKQzhGT0xUOHZtWFMw?=
 =?utf-8?B?VFFjaEg4U0ZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(3122999012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2RkVGNqQWxJUkc0amdRdnBQZ1l2ZWNXdzgrYVRNU0xiRmRXeDV1TGNUZjZ5?=
 =?utf-8?B?ZmtMZE05N2xzWU5TRnY1endsbVA0U3c2cnpNOXhOZGppcjNCZEUwbWRDV09N?=
 =?utf-8?B?QS84NUM5aWpXOWRrd0d1TVZnVU9nVXFpeElxRjVFb3B3aXEvZGJ0aUR6cEdj?=
 =?utf-8?B?NFpRL0RqN0toenEybThLRHUrcEhSRzNEL29CblFldlJUS1d6NjArRVdsQlVp?=
 =?utf-8?B?a1JkZDBkNnBNa3NWdW8xdDRRSHdrT1AvWHBiYlhia0VISWZiTGJTYVBpQ2hB?=
 =?utf-8?B?VEtRa1N1S0RwMFkvUzZhY3VUd0hLcXBiVmx3blkxZWlLaHM0eUlGc1BJZU1B?=
 =?utf-8?B?cGY1bkEzMDZSOWx5cEp5NVk5dHdKeFZDakFzSnJFMWZNa1FlcTUvRTNHTDdG?=
 =?utf-8?B?dWtUeFlhdy91UzZnUHlib2djWi9DS0JoRG0wMVg1K3FoTDZmTzhxNkxjWTlB?=
 =?utf-8?B?WTE2dkd6dWtBQVcwK3Jjejh6TlVRWmJhN3NuWmZsOE9qYnlMb3BiWjhwSWNM?=
 =?utf-8?B?NkNZYWZGbHhmRlVJTUY4d0daV29HRlRDNE13UDUvY1l3TmtkZkRvQWhxZ01H?=
 =?utf-8?B?b2U1bEw0OHhJdlFEUzRId3lSWVFuLzh1clhydWRmbTNWMkdiVEtmdmhkY3JG?=
 =?utf-8?B?VUovOUFPNDczMlo2QllGaDBZVDZyUGwrOXFUSTRRK2VZQk1WeXpPZ3hpWWZP?=
 =?utf-8?B?MXo5cFVFUUIvc0lhRkFVUm5aM0t2UlVsMDJVbFp3VlZwdldwcU4wbmRCNXVi?=
 =?utf-8?B?SmpIb0xDU2dxaHhiNlljbU85TG00TjA5Ymo3eUY2RUhKQ0dNV0RhZzBPMTEr?=
 =?utf-8?B?QWRQK254cElwdVFkNVIxSmQ2ZWJPRUdTaEZVWVhkUXRYWEVEU2hPQW1Ick0w?=
 =?utf-8?B?aEFYalkxZ0JVSS9jNDFNK1hJcWRmb1c0VWM2ZnlUalBTTGQ0ZE8xdnovbllR?=
 =?utf-8?B?bVNnSUdSYWdXb25tMmQ4SnZQQldHZzl6WTVCWHZUUERuUzNTc2ZvNzlKYzFG?=
 =?utf-8?B?VU9HR3FwSFBjWmNTQXduWi96RGxrclFHS3NGYklpRlY0enM2Tkh4amFiZzJP?=
 =?utf-8?B?eHRZSUVXbGZWdlNMZldRMHZLSTRJODZCbEMwQ3VFa3RlZzlndmp0T0ZDMm1Q?=
 =?utf-8?B?ZGljbFU4RythM2VKVUhqQjI3bldYTEZKWThIeEk2eHFVZkRlZ1JRanZyZGpV?=
 =?utf-8?B?dmxCR3FJYm9JYUFVQ2RNeXA2Z2dlMlo1Z2IzU0xjRHlxT3FrZUc4RWhiZ0Ir?=
 =?utf-8?B?cmtZL0QzYUl3NGIva2h6ckJZZVpOVDNCbFpDckxZQ1VWcnhqRVlUVnBwMlll?=
 =?utf-8?B?RDUyNFVOd3pUTGJJcnZqRDJIUmsxbitmc0Q0bnBrSHErM002V3phRzNCVUNT?=
 =?utf-8?B?TTFYWEpaUFNaSXpoOThobW54eEZya0F4TnpwTTZVc3lxQkNjaWJmTjNuWkUv?=
 =?utf-8?B?S0VDakMwOGdQSjlFUVI4ZXJtQWJvK2VPb1REbkVaOWJYekxKWnFkSlB0S3d2?=
 =?utf-8?B?MnByOWFiVG9ILzJiSERLUktQZkVYVkJTNUdWOHorYW9EQWhNek90Z2x1eXp4?=
 =?utf-8?B?ck9Edi9hZzQrbFhTZXZLZ0NENzRqLzJKTzliYmhnVEordDNDbjZodjNZbHNW?=
 =?utf-8?B?RERFOWs4elhCR2xQd0VmUHl5eXhwbDJPbHJFUng2ZTk1TldaeHRvQ3hRUjho?=
 =?utf-8?B?QVlORWdaNGpYRU9MaWlmendnd2hLNjNXRlorY3lseHhXVWRhMkd3R0FkZkxB?=
 =?utf-8?B?bEZyYTVOSTNCcEtqMzJCWHVUWjVNYVY0K0JSaC9IbUFZYXg4NC83bFN5ZWZY?=
 =?utf-8?B?U0FRVFV2UDZRS1QwK0tpNysrbUtFUWpOQ3BYSUUwME1CNFlOS285OWRFUHA2?=
 =?utf-8?B?Y1BrNnpOdDRCTllpZWx6dzAzRWR1Q1hnb09iT0FHWjFmeUMwS3ZKaUcxZ0R0?=
 =?utf-8?B?TzRnbWk1MjdBaVlvRWJVajJKejN6cUtjamdTQjZCOXhMeDdFSzVNekVndUds?=
 =?utf-8?B?RzdLRHZLOFFVb0pEOWJ3VXVWZFJyckhQblU0MUxTcWQ2dGVsUzZqNUhXWWdu?=
 =?utf-8?B?Rm41anBXVGxiRnluY3BOQXk3aXFRYkNlVGJZYzd6SWpPOVdaYnNFTXpiUzZE?=
 =?utf-8?Q?+1ZatjfHHO5HaXoidfGGAn4iO?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4c195e-7d2d-44bf-e82a-08de31ef494c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:08:13.2901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKbvYEaqB8SyYJWq+dg6QRSe9QavpqkbJYf7ysWbpN3ftgoYVDvULzbIHsypgWi7lPZ8w9rABBMZ9DMUXuF4SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9419

Hi Julien,

On 11/27/25 11:22, Julien Grall wrote:
>> We have changed vIOMMU design from 1-N to N-N mapping between vIOMMU and
>> pIOMMU. Considering single vIOMMU model limitation pointed out by
>> Volodymyr (SID overlaps), vIOMMU-per-pIOMMU model turned out to be the
>> only proper solution.
> 
> I am not sure to fully understand. My assumption with the single vIOMMU
> is you have a virtual SID that would be mapped to a (pIOMMU, physical
> SID). 

In the original single vIOMMU implementation, vSID was also equal to 
pSID, we didn't have SW mapping layer between them. Once SID overlap 
issue was discovered with this model, I have switched to 
vIOMMU-per-pIOMMU model. Alternative was to introduce a SW mapping layer 
and stick with a single vIOMMU model. Imo, vSID->pSID mapping layer 
would overcomplicate the design, especially for PCI RC streamIDs handling.
On the other hand, if even a multi-vIOMMU model introduces problems that 
I am not aware of yet, adding a complex mapping layer would be the only 
viable solution.

 > Does this means in your solution you will end up with multiple
 > vPCI as well and then map pBDF == vBDF? (this because the SID have to be
 > fixed at boot)
 >

The important thing which I haven't mentioned here is that our focus is 
on non-PCI devices for this feature atm. If I'm not mistaken, arm PCI 
passthrough is still work in progress, so our plan was to implement full 
vIOMMU PCI support in the future, once PCI passthrough support is 
complete for arm. Of course, we need to make sure that vIOMMU design 
provides a suitable infrastructure for PCI.
To answer your question, yes we will have multiple vPCI nodes with this 
model, establishing 1-1 vSID-pSID mapping (same iommu-map range between 
pPCI-vPCI).
For pBDF to vBDF 1-1 mapping, I'm not sure if this is necessary. My 
understanding is that vBDF->pBDF mapping does not affect vSID->pSID 
mapping. Am I wrong here?


>> ==========================================================
>> Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
>> ==========================================================
>>
>> :Author:     Milan Djokic <milan_djokic@epam.com>
>> :Date:       2025-11-03
>> :Status:     Draft
>>
>> Introduction
>> ============
>>
>> The SMMUv3 supports two stages of translation. Each stage of translation
>> can be
>> independently enabled. An incoming address is logically translated from
>> VA to
>> IPA in stage 1, then the IPA is input to stage 2 which translates the
>> IPA to
>> the output PA. Stage 1 translation support is required to provide
>> isolation between different
>> devices within OS. XEN already supports Stage 2 translation but there is no
>> support for Stage 1 translation.
>> This design proposal outlines the introduction of Stage-1 SMMUv3 support
>> in Xen for ARM guests.
>>
>> Motivation
>> ==========
>>
>> ARM systems utilizing SMMUv3 require stage-1 address translation to
>> ensure secure DMA and
>> guest managed I/O memory mappings.
>> With stage-1 enabed, guest manages IOVA to IPA mappings through its own
>> IOMMU driver.
>>
>> This feature enables:
>>
>> - Stage-1 translation in guest domain
>> - Safe device passthrough with per-device address translation table
> 
> I find this misleading. Even without this feature, device passthrough is
> still safe in the sense a device will be isolated (assuming all the DMA
> goes through the IOMMU) and will not be able to DMA outside of the guest
> memory. What the stage-1 is doing is providing an extra layer to control
> what each device can see. This is useful if you don't trust your devices
> or you want to assign a device to userspace (e.g. for DPDK).
> 

I'll rephrase this.

>>
>> Design Overview
>> ===============
>>
>> These changes provide emulated SMMUv3 support:
> 
> If my understanding is correct, there are all some implications in how
> we create the PCI topology. It would be good to spell them out.
> 

Sure, I will outline them.

>>
>> - **SMMUv3 Stage-1 Translation**: stage-1 and nested translation support
>> in SMMUv3 driver.
>> - **vIOMMU Abstraction**: Virtual IOMMU framework for guest stage-1
>> handling.
>> - **Register/Command Emulation**: SMMUv3 register emulation and command
>> queue handling.
>> - **Device Tree Extensions**: Adds `iommus` and virtual SMMUv3 nodes to
>> device trees for dom0 and dom0less scenarios.
> 
> What about ACPI?
> 

ACPI support is not part of this feature atm. This will be a topic for 
future updates.

>> - **Runtime Configuration**: Introduces a `viommu` boot parameter for
>> dynamic enablement.
>>
>> Separate vIOMMU device is exposed to guest for every physical IOMMU in
>> the system.
>> vIOMMU feature is designed in a way to provide a generic vIOMMU
>> framework and a backend implementation
>> for target IOMMU as separate components.
>> Backend implementation contains specific IOMMU structure and commands
>> handling (only SMMUv3 currently supported).
>> This structure allows potential reuse of stage-1 feature for other IOMMU
>> types.
>>
>> Security Considerations
>> =======================
>>
>> **viommu security benefits:**
>>
>> - Stage-1 translation ensures guest devices cannot perform unauthorized
>> DMA (device I/O address mapping managed by guest).
>> - Emulated IOMMU removes guest direct dependency on IOMMU hardware,
>> while maintaining domains isolation.
> 
> Sorry, I don't follow this argument. Are you saying that it would be
> possible to emulate a SMMUv3 vIOMMU on top of the IPMMU?
> 

No, this would not work. Emulated IOMMU has to match with the pIOMMU type.
The argument only points out that we are emulating IOMMU, so the guest 
does not need direct HW interface for IOMMU functions.

>> 1. Observation:
>> ---------------
>> Support for Stage-1 translation in SMMUv3 introduces new data structures
>> (`s1_cfg` alongside `s2_cfg`)
>> and logic to write both Stage-1 and Stage-2 entries in the Stream Table
>> Entry (STE), including an `abort`
>> field to handle partial configuration states.
>>
>> **Risk:**
>> Without proper handling, a partially applied Stage-1 configuration might
>> leave guest DMA mappings in an
>> inconsistent state, potentially enabling unauthorized access or causing
>> cross-domain interference.
> 
> How so? Even if you misconfigure the S1, the S2 would still be properly
> configured (you just mention partially applied stage-1).
> 

This could be the case when we have only stage-1. But yes, this is 
improbable case for xen, stage-2 should be mentioned also, will fix this.

>>
>> **Mitigation:** *(Handled by design)*
>> This feature introduces logic that writes both `s1_cfg` and `s2_cfg` to
>> STE and manages the `abort` field-only
>> considering Stage-1 configuration if fully attached. This ensures
>> incomplete or invalid guest configurations
>> are safely ignored by the hypervisor.
> 
> Can you clarify what you mean by invalid guest configurations?
> 

s1 and s2 config will be considered only if configured for the guest 
device. E.g. if only stage-2 is attached for the guest device, stage-1 
configuration will be invalid, but safely ignored. I'll change this to 
"device configuration" instead of ambiguous "guest configuration".

>>
>> 2. Observation:
>> ---------------
>> Guests can now invalidate Stage-1 caches; invalidation needs forwarding
>> to SMMUv3 hardware to maintain coherence.
>>
>> **Risk:**
>> Failing to propagate cache invalidation could allow stale mappings,
>> enabling access to old mappings and possibly
>> data leakage or misrouting.
> 
> You are referring to data leakage/misrouting between two devices own by
> the same guest, right? Xen would still be in charge of flush when the
> stage-2 is updated.
> 

Yes, this risk could affect only guests, not xen.

>>
>> **Mitigation:** *(Handled by design)*
>> This feature ensures that guest-initiated invalidations are correctly
>> forwarded to the hardware,
>> preserving IOMMU coherency.
> 
> How is this a mitigation? You have to properly handle commands. If you
> don't properly handle them, then yes it will break.
> 

Not really a mitigation, will remove it. Guest is responsible for the 
regular initiation of invalidation requests to mitigate this risk.

>>
>> 4. Observation:
>> ---------------
>> The code includes transformations to handle nested translation versus
>> standard modes and uses guest-configured
>> command queues (e.g., `CMD_CFGI_STE`) and event notifications.
>>
>> **Risk:**
>> Malicious or malformed queue commands from guests could bypass
>> validation, manipulate SMMUv3 state,
>> or cause system instability.
>>
>> **Mitigation:** *(Handled by design)*
>> Built-in validation of command queue entries and sanitization mechanisms
>> ensure only permitted configurations
>> are applied.
> 
> This is true as long as we didn't make an mistake in the configurations ;).
> 

Yes, but I don’t see anything we can do to prevent configuration mistakes.

> 
>> This is supported via additions in `vsmmuv3` and `cmdqueue`
>> handling code.
>>
>> 5. Observation:
>> ---------------
>> Device Tree modifications enable device assignment and configuration
>> through guest DT fragments (e.g., `iommus`)
>> are added via `libxl`.
>>
>> **Risk:**
>> Erroneous or malicious Device Tree injection could result in device
>> misbinding or guest access to unauthorized
>> hardware.
> 
> The DT fragment are not security support and will never be at least
> until you have can a libfdt that is able to detect malformed Device-Tree
> (I haven't checked if this has changed recently).
> 

But this should still be considered a risk? Similar to the previous 
observation, system integrator should ensure that DT fragments are correct.

>>
>> **Mitigation:**
>>
>> - `libxl` perform checks of guest configuration and parse only
>> predefined dt fragments and nodes, reducing risk.
>> - The system integrator must ensure correct resource mapping in the
>> guest Device Tree (DT) fragments.
>   > > 6. Observation:
>> ---------------
>> Introducing optional per-guest enabled features (`viommu` argument in xl
>> guest config) means some guests
>> may opt-out.
>>
>> **Risk:**
>> Differences between guests with and without `viommu` may cause
>> unexpected behavior or privilege drift.
> 
> I don't understand this risk. Can you clarify?
> 

This risk is similar to the topics discussed in Observations 8 and 9, 
but in the context of vIOMMU-disabled guests potentially hogging the 
command and event queues due to faster processing of iommu requests. I 
will expand this.

>>
>> **Mitigation:**
>> Verify that downgrade paths are safe and well-isolated; ensure missing
>> support doesn't cause security issues.
>> Additional audits on emulation paths and domains interference need to be
>> performed in a multi-guest environment.
>>
>> 7. Observation:
>> ---------------
> 
> This observation with 7, 8 and 9 are the most important observations but
> it seems to be missing some details on how this will be implemented. I
> will try to provide some questions that should help filling the gaps.
> 

Thanks, I will expand these observations according to comments.

>> Guests have the ability to issue Stage-1 IOMMU commands like cache
>> invalidation, stream table entries
>> configuration, etc. An adversarial guest may issue a high volume of
>> commands in rapid succession.
>>
>> **Risk:**
>> Excessive commands requests can cause high hypervisor CPU consumption
>> and disrupt scheduling,
>> leading to degraded system responsiveness and potential denial-of-
>> service scenarios.
>>
>> **Mitigation:**
>>
>> - Xen scheduler limits guest vCPU execution time, securing basic guest
>> rate-limiting.
> 
> This really depends on your scheduler. Some scheduler (e.g. NULL) will
> not do any scheduling at all. Furthermore, the scheduler only preempt
> EL1/EL0. It doesn't preempt EL2, so any long running operation need
> manual preemption. Therefore, I wouldn't consider this as a mitigation.
> 
>> - Batch multiple commands of same type to reduce overhead on the virtual
>> SMMUv3 hardware emulation.
> 
> The guest can send commands in any order. So can you expand how this
> would work? Maybe with some example.
> 
>> - Implement vIOMMU commands execution restart and continuation support
> 
> This needs a bit more details. How will you decide whether to restart
> and what would be the action? (I guess it will be re-executing the
> instruction to write to the CWRITER).
> 
>>
>> 8. Observation:
>> ---------------
>> Some guest commands issued towards vIOMMU are propagated to pIOMMU
>> command queue (e.g. TLB invalidate).
>>
>> **Risk:**
>> Excessive commands requests from abusive guest can cause flooding of
>> physical IOMMU command queue,
>> leading to degraded pIOMMU responsivness on commands issued from other
>> guests.
>>
>> **Mitigation:**
>>
>> - Xen credit scheduler limits guest vCPU execution time, securing basic
>> guest rate-limiting.
> 
> Same as above. This mitigation cannot be used.
> 
> 
>> - Batch commands which should be propagated towards pIOMMU cmd queue and
>> enable support for batch
>>     execution pause/continuation
> 
> Can this be expanded?
> 
>> - If possible, implement domain penalization by adding a per-domain cost
>> counter for vIOMMU/pIOMMU usage.
> 
> Can this be expanded?
> 
>>
>> 9. Observation:
>> ---------------
>> vIOMMU feature includes event queue used for forwarding IOMMU events to
>> guest
>> (e.g. translation faults, invalid stream IDs, permission errors).
>> A malicious guest can misconfigure its SMMU state or intentionally
>> trigger faults with high frequency.
>>
>> **Risk:**
>> Occurance of IOMMU events with high frequency can cause Xen to flood the
> 
> s/occurance/occurrence/
> 
>> event queue and disrupt scheduling with
>> high hypervisor CPU load for events handling.
>>
>> **Mitigation:**
>>
>> - Implement fail-safe state by disabling events forwarding when faults
>> are occured with high frequency and
>>     not processed by guest.
> 
> I am not sure to understand how this would work. Can you expand?
> 
>> - Batch multiple events of same type to reduce overhead on the virtual
>> SMMUv3 hardware emulation.
> 
> Ditto.
> 
>> - Consider disabling event queue for untrusted guests
> 
> My understanding is there is only a single physical event queue. Xen
> would be responsible to handle the events in the queue and forward to
> the respective guests. If so, it is not clear what you mean by "disable
> event queue".
> 

I was referring to emulated IOMMU event queue. The idea is to make it 
optional for guests. When disabled, events won't be propagated to the guest.

>>
>> Performance Impact
>> ==================
>>
>> With iommu stage-1 and nested translation inclusion, performance
>> overhead is introduced comparing to existing,
>> stage-2 only usage in Xen. Once mappings are established, translations
>> should not introduce significant overhead.
>> Emulated paths may introduce moderate overhead, primarily affecting
>> device initialization and event handling.
>> Performance impact highly depends on target CPU capabilities.
>> Testing is performed on QEMU virt and Renesas R-Car (QEMU emulated)
>> platforms.
> 
> I am afraid QEMU is not a reliable platform to do performance testing.
> Don't you have a real HW with vIOMMU support?
> 

Yes, I will provide performance measurement for Renesas HW also.

> [...]
> 
>> References
>> ==========
>>
>> - Original feature implemented by Rahul Singh:
>>
>> https://patchwork.kernel.org/project/xen-devel/cover/
>> cover.1669888522.git.rahul.singh@arm.com/
>> - SMMUv3 architecture documentation
>> - Existing vIOMMU code patterns
> 
> I am not sure what this is referring to?
> 

QEMU and KVM IOMMU emulation patterns were used as a reference.

BR,
Milan


