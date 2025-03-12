Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A663A5D9A5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 10:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910130.1316899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsIUo-000787-1F; Wed, 12 Mar 2025 09:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910130.1316899; Wed, 12 Mar 2025 09:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsIUn-000765-UT; Wed, 12 Mar 2025 09:35:25 +0000
Received: by outflank-mailman (input) for mailman id 910130;
 Wed, 12 Mar 2025 09:35:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JNjR=V7=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1tsIUm-00075z-FS
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 09:35:24 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 518271ad-ff25-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 10:35:21 +0100 (CET)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by GVXPR03MB10826.eurprd03.prod.outlook.com (2603:10a6:150:21f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 09:35:17 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 09:35:17 +0000
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
X-Inumbo-ID: 518271ad-ff25-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONxkCfV4NBNVJDrMFPrbELFTpaAislVRWfi5jF+yTA6nb/0v2bpegp0gJADLKGHBQLJLetxjf/myY06pjqWQ1zPs7gvV41BfVp6dNF5maCxJVmA8FL4859/U4QcHgTHZzEEd/a34zpZogeMiOh5EQyRI4N9gKiyDD1uutbNNofIrzWA/166D+JWUxQ1yoBLLYbon9FAh9Gm/VBdiv8Iucd05txD5DpTKManudfikLUIVAt5aGImIkPAsOrK4EavJ5BT9+wqVRA/C5TSfNyYpjDs/OPHqTriFPSiDVYyJctFV/zfWIHJximQPiJFy87pElnk0HIwgIyoFVaEsNOImlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7c+qSwfT/v0DQQKww8Qsx0ETY5tHj8E991ksUvFL25w=;
 b=rMxTUXGPzFEo//9pCUpGSgaGq4zf7iKafFJhSLFvatuu35SGoCMW9INhkT1Y/iiRxJYZYV4B9c1QDK6SiM2xPf+vC93o7ZKhvfLJxigFsh2YZvfPSwRLufV3dnkgNAFpYK0QvL7jY9ABOWzdeM2zsu/0f9eMp5yIf607+DSVxkXzgvCq3S4NlPe4HlwAFK2N73AnfG+v840HPBxTqpzF2Xs+tDh3LxTjvfMVDfvXibfiXfC/pl+oWCcRA8hW28lWGQ6nMD9EUiimjUNavht4ANSqrlA8kF5Sd9KpH0o6eUTPMCdGrzhu88NowWtP8YlAfPTIwoAxLM8wG2lmHwYVzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7c+qSwfT/v0DQQKww8Qsx0ETY5tHj8E991ksUvFL25w=;
 b=dhaqSqcNIaTgMlq78lRJQpGZfbF5j5XGyrMLMPd8J8oqib37p34+zdvVlMNFKcu7AV55JWDoTeiWhIlH7pelE2B25oa1pn4fI6rduFP/pJOoLXO4m2L/iTF43yjJ+8JiQsgSHGrUbEDGCts7LtVbmdl8ZNUbaiOSiBZ98j3M2AuyE8Sh/cBW4SFwP8wGDRuDO2X4qACK+z1VKXLJiGTDk6M0yTelygbSdy39ELt6vRAHHp9WCcq70GqA9Uyye3tiim6W/wMT0cVhA2kPHbtKv7hHhSnO6m7F284uVDKx2b6HvbLhPwb2olcXpefej7+bGE58Mm5CfnRK4vml3SWiHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <6d746409-1591-4d44-97e0-0fa904d3186d@epam.com>
Date: Wed, 12 Mar 2025 11:35:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1741687645.git.Sergiy_Kibrik@epam.com>
 <e37da57b94fd3bd4f314e6fbd7b6b94aee4b4607.1741687645.git.Sergiy_Kibrik@epam.com>
 <ebef450c-280e-43a4-9a48-e4d1f754ba03@suse.com>
 <CABfawhn2+CpxZx50oYXbi1NPkqJqT7=tMrhYbPZCGsCoQjkfAA@mail.gmail.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <CABfawhn2+CpxZx50oYXbi1NPkqJqT7=tMrhYbPZCGsCoQjkfAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|GVXPR03MB10826:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b7b87a-cb3d-4d12-a5a9-08dd614932d4
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnhYZTFwT2EvRjVTbndsY1RvT0NOYjFZL1MrckFlNURZejNOUEhZQUU2amxv?=
 =?utf-8?B?dFdOYTNBcFhKSEtybVNSRGdTWDQrSm1SMytTdzFCZ3NZS29yb1BuMG1XTjJt?=
 =?utf-8?B?NXN3WUxDN2tUampIWmpJRnE2cTNBOGpoYXhpcm1Jc3hFYVZoTDVBVDloeFIw?=
 =?utf-8?B?cmdXbWE3R2UvNXN2VlA0S3BHMk5tUGJkdExhWDBSdGp5OS9VK0orcWp3aDZh?=
 =?utf-8?B?SkVmVUdwYmhjMHRwRTFiR1ZnWG5abDJtbWRWemQzWkRzaXM3WVQ0ZVdUQnhy?=
 =?utf-8?B?ZDR0RHBoVCtlVzBIWmliSUFSRGpTbS94ZnlEWnlwMVViZ0IrVU1rZ1dsZEZm?=
 =?utf-8?B?OG9mamRoakNMNnJQcHFJVWpQSUJWM285VTlDdnJBSUx6RWhZanlyd0FETDJS?=
 =?utf-8?B?dHdVTzF4QndwSHRsSXZXamtCRVdmemxWNGJqSkJ2ZFFqa1ZGR082c2I3TmtW?=
 =?utf-8?B?cDFjSWVHeDBJZ21aY2M3SGtRSm9Yc1M3c0JhQlpkZnZPVzQ2bUxNcWxIR1NY?=
 =?utf-8?B?ZFR0SUtRZEovcnlpQ0Z2QXlLTE4xYzN5YlpQZlB0cjUzcnFQSWpQQkZTd3g2?=
 =?utf-8?B?QnBJVlBsRGpoV2d6dlhPdXp1MlpDeFJUSHlKMURMSFlPUzlYdEVDU00zMyta?=
 =?utf-8?B?VVlrZW9xZ1U0K3NEblNZTUtRcU0wdVVGVXJuZVRUNm1pMHZJZ09oZzhkSWhC?=
 =?utf-8?B?SlFqRnJaUDdYdlYrekNXT2t0SEJDZjA3bTRlL0NSZlh0TTdMRU1SN2lJVkFT?=
 =?utf-8?B?MVdaenlkSVpvUGI0Q2hzcGc3Y0c4bkVNZ1VHWlFBaFJjeVRBcWQ4Ry9BZVhn?=
 =?utf-8?B?c2k1UTZ2cjlOZDVHTi9UMW9nUmFDbUtONXN2Q0F6Rlc5VzlHWjJWSVgyWHJ3?=
 =?utf-8?B?VFo1VCtJQm81UUk2U2RvengreUJCeGluNmVobmd4d2hkYnVBY3RSakUrRldl?=
 =?utf-8?B?bmJFd1kxR0pTcmVmM29wbkZmREk3VmI1VTM0MnBqN2VUcnlKRE5HSDZqZ2g4?=
 =?utf-8?B?ejJ0Z2Q1a0lIM3JockdyZndNQ3NCNmprYmIyb0hja2E2ajdpZkZTOWUzNFl2?=
 =?utf-8?B?SUNKdmhBdDMrT2xkS1lrU0N5TFhHYUtKMDE0aHNlUWJLOE91TDI1MWNWY05B?=
 =?utf-8?B?bkFiZjNOeCtFbjYvQitSRmJJVlBHaDhvZHZrOHJnSWhZQzF6Yld5YnhuTi9K?=
 =?utf-8?B?YXhVeHR2bXRqeHdibGZ4TVVkWHR3dkFUVkNYWVE4aSt4TFhiLzkyT1RMUmFn?=
 =?utf-8?B?MjdGZzZON01wcldyRjVCT01UNUhoWUlsNU05RERZUXZJbUo2MHRxeHkwc2lj?=
 =?utf-8?B?clZxYWpxeXV2TXhRRWQ3WGg4cFdXc2FDU1BKcmVvWS91ZDZkblRpNDY3VWUx?=
 =?utf-8?B?aGNiQldkSHh3M0YwYkZTcXB0M0liQU5EMWtWU0dpSDRTcTVKU3dtYU9KNzdl?=
 =?utf-8?B?QjJQNENQYzY3Uk9qd3RwZ3lHQkNnU2x1RmhvZm5MSzJZQmorejNkaytJMzVQ?=
 =?utf-8?B?bGxKaEFreTlINXUyT3pUK09YTEFPSEYxRE96aFBZODd5THJBZ2VXZlJLOWI5?=
 =?utf-8?B?Y1JXUUlOZmU4ODZSbjBGcS9ZaUtrWVRDbDBtYXlkQ0JuWWVET1Bxd1ExQnZk?=
 =?utf-8?B?Qms3NHYvWkhhY3RsWmQ1TnpkU0sweDUra091cmRpaklDdnd4dWtXbVBRSWND?=
 =?utf-8?B?b01JTE5iUzRaUWUrcGNXVy9LOFRCN1FsSnpEa3JnUVlLUVlZbE1Gdlhnb2Ra?=
 =?utf-8?B?VlJmVzh3ZGNUeDkwc2EwVmlzMHhiQWVnUXVHNndGZ0ZvRUxTMVI4NzBYRnJP?=
 =?utf-8?B?ekZCZk9XaUFDNkNFWHF5V2UwZkdNL2pIUEZ4YVljQ1grQk4xTTBVTnZIbDN1?=
 =?utf-8?Q?jJO0Ysi5eeC8h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3JjODVYN2J3aW52V1lmM1R4Vm9tM1RCQnBkd1hhMG85UHhVQ3lNaE15SGpK?=
 =?utf-8?B?Y3dKTkNQdDkwQzgzQnlvVGRhNlA2MnNheTVGbGIvb2F6d1FYQ053QUsyc3Vt?=
 =?utf-8?B?MG0zeUtXOXVXQ3ZSZ0JzUXN0NE9yY3VaRU04K1o5SG5FMjdleG8rRk9uRkNm?=
 =?utf-8?B?bis2TzNjYmk1dDVmejVmdHVSQ3BOcUp3THkrRS9vSGhrL0pwUG5uK2FiNmJt?=
 =?utf-8?B?V2M2UHhGMyt5SnNWUTY0OEszRFNVUThyOWNoc2phRlNQbTFvWXJIYzJYekk1?=
 =?utf-8?B?ZG9hTzZvbkVMRzl4VnhPVm9wSmNBU0JoYnpSd2RMOE8rSU9qbGJIc21RRSs1?=
 =?utf-8?B?b3gwbU8vRUtUSVlCM3FIUjd4K0VBdWNCNDA3c0ZSUWdpMzRaMS9XOEZVTFIy?=
 =?utf-8?B?VElJMUVyaXc1NlNvb3FSYXZDZnplVVhvRWVYRG5qQUNvVXh6OWZKZ1IvNXAx?=
 =?utf-8?B?QWFwKytnTTVES09qUGN1cExFSVlPcDVnOEpNeDNnQzg5eWVtNWFNODJBTU5J?=
 =?utf-8?B?ZFE2c3NUSlh3ZUJmU1BVTmhid01WTjQ4cndORklPS3JYTXp1dk5nMm4vN2NX?=
 =?utf-8?B?NGwwV0pyYXgrTnBDUFdMUXk1ODJXOE0rOUVycEY2cC9CdEpPTTUxWkNvZ1JM?=
 =?utf-8?B?NEdzc1lzM2cxTW55YTFaSmdTcWpDQnhxWVg1YlY3U0Fid3FhUEJ6d2xmenI5?=
 =?utf-8?B?MUlQazhkejNlMDU4ZGI4VkpUTDZyNmVuYm4yRW9wRmxub0J6ZmFkS2RkMDdr?=
 =?utf-8?B?T1pKMHUxd3UzOGxyOWcrcHdZVDdpQS9oMDhSODF3Zk1HTWFlRkd3NXY2cFBn?=
 =?utf-8?B?ZDFrTVNpTnY0SnFpZWpmL1lsYTBoaVhwZ3puTEZZS2RDNFc3MmpNdmhFQ3pU?=
 =?utf-8?B?NFdDZERma1plVEltbFo0SXZHTUdraStnbk13dDVIRXFkZ2NrZW5uRnNqb0FP?=
 =?utf-8?B?YjdrblljSlQzYXRQN0xzR1B2ZXVUcyt3ek1aWFJRZ3h0L0ZVUHJDMU1EMlZq?=
 =?utf-8?B?NTFyUGFtTklmMkZOMWZhOXd3QkVHdzVvRFl0STY0aFh4N1RkVk9KbE82RjJO?=
 =?utf-8?B?Mkd4cDdGN3R4TU5tZ2lEem1mOHllWkxYWjRtazRlY0NGTnppaXVHSHFyRVlX?=
 =?utf-8?B?SUNxWk1HRWJ0ck1GQVdIdnl0M2ZJQjJWQkpFRFZKY0l4L25wV3RkdktxQjA4?=
 =?utf-8?B?REROeUtJYVVZRjA2MkVsQWhRY1RvMG9CZUNEMHR1cXJzRHdNbHBQd0VaeWc0?=
 =?utf-8?B?RnZIanVNQUxQY1o3WVVoZklNWWlLbDBQclkzMks3bXRTc1k1dzVzY2tDbEdZ?=
 =?utf-8?B?NTRWOUcvSmVqZk1NYmtiSnhhQXdQcGJUbTNCM3UzZmJ4WlpreThDazlPVmVa?=
 =?utf-8?B?M2xXU1U0Q2Y5cGpISVpqVGZKZGhVbHVob2FqbjNoQUNHbEtZTTlNUFl4SlMy?=
 =?utf-8?B?bEo5MjFwYzB4ZjJPRDhvTStXK1d2ODJSTEh6aGpDcjBUK2VCS3lYaUpFdjFj?=
 =?utf-8?B?M0hRMTlBTm5rQmprbkFodnBKNGtoVDN1QmpDU2NVa3Qxc09qYmc1MHZDWVVL?=
 =?utf-8?B?M1lCWEsxSzArMElaczdlMFlBSGFCdzVyLzVWUGxMc3Rqek03blJKd3g3RlBz?=
 =?utf-8?B?YVZhQmFocHpDY3dod1ZhVEtydVhzOFZDbGpZbSswS3NaZWNrank3N0lwcjky?=
 =?utf-8?B?UDFoenV0UUxRK3E2d3JZZ0lVYXQ3UHZuU3Fmcy80ZGdTaVZKQklWakl5MnJI?=
 =?utf-8?B?K2NjN0MwN2cwbUhLdms1cW5YZklieis3R282a1ZnNUtPWkY5NUdpVVRuVkw3?=
 =?utf-8?B?c3JaVlFES3grK1R1bE1VTmRhdWM1c3JmZHE5UTZ2UEoyNng5NXZ2YTZqVVVE?=
 =?utf-8?B?UmcrTnJLUVVpclBHdTNzekRoSXRHNTVTeElHdmlZMUpsOWJjUlJ0d3dMdXMw?=
 =?utf-8?B?SW9KZ205WUxMRDFlSHNpZHFFRlNiZkV3Nmc1YTloZ2tVRTM2UzE4Z3lZTHFV?=
 =?utf-8?B?dHNRak5rT2Z3ZkM1VUhXemFVZDBPUU1ZcU5XZHBETHRaSmV0ODkrZ1IrSjV6?=
 =?utf-8?B?aVFyY093Q2U2QVg0ZmJETmlvUzBWeng5UFZmUEYrZktXV0JubUdhcnRlY1ly?=
 =?utf-8?Q?8GPdKlNf6HUBfpazptluvquX0?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b7b87a-cb3d-4d12-a5a9-08dd614932d4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 09:35:17.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/wPImy8Qwnz1NfMIILHQzM4Wi2kxwnD7WVjVEIh8tLH3tfteYW6T1r6L/CWT8wrFsh3XJZO3BveOSH/UeGRug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10826

11.03.25 15:39, Tamas K Lengyel:
> On Tue, Mar 11, 2025 at 7:59 AM Jan Beulich<jbeulich@suse.com>  wrote:
>> On 11.03.2025 11:27, Sergiy Kibrik wrote:
>>> From: Stefano Stabellini<stefano.stabellini@amd.com>
>>>
>>> Extend coverage of CONFIG_VM_EVENT option and make the build of VM events
>>> and monitoring support optional. Also make MEM_PAGING option depend on VM_EVENT
>>> to document that mem_paging is relying on vm_event.
>>> This is to reduce code size on Arm when this option isn't enabled.
>>>
>>> CC: Jan Beulich<jbeulich@suse.com>
>>> CC: Tamas K Lengyel<tamas@tklengyel.com>
>>> Reviewed-by: Ayan Kumar Halder<ayan.kumar.halder@amd.com>
>>> Signed-off-by: Stefano Stabellini<stefano.stabellini@amd.com>
>>> Signed-off-by: Sergiy Kibrik<Sergiy_Kibrik@epam.com>
>> Please can tags be kept in chronological order? It's impossible to review
>> a patch that wasn't first signed-off on by the author(s).
>>
>>> ---
>>> changes in v3:
>>>   - add dependency MEM_PAGING -> VM_EVENT
> This seems to be largely unnecessary since on x86 selecting HVM
> already selects it but I guess it also doesn't hurt to explicitly mark
> it like this either.

It's done just to highlight this dependency, more like a documentation 
hint (as Jan suggested in previous discussion).

   -Sergiy

