Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPU3A7kj1mklBQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 11:45:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8C13BA114
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 11:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275547.1561331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPTH-0000ch-FK; Wed, 08 Apr 2026 09:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275547.1561331; Wed, 08 Apr 2026 09:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPTH-0000ao-CM; Wed, 08 Apr 2026 09:45:15 +0000
Received: by outflank-mailman (input) for mailman id 1275547;
 Wed, 08 Apr 2026 09:45:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAPTF-0000ai-Q6
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 09:45:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAPTF-004gL9-0w
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 11:45:13 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d623a1-5cb7-0a2a0a5109dd-0a2a4508e99a-44
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 11:45:12 +0200
Received: from [52.101.62.24]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d623a7-fab6-0a2a45080019-34653e18c82b-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 11:45:12 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5400.namprd03.prod.outlook.com (2603:10b6:5:2cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 09:45:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 09:45:09 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=belj4vrmHV/oJBbrddtD/ZqwL5sEXuVTQEpaFKclygHxDWCthcfVDkyms/dXjAuY+/YnzgvSZvvryrIvnsfsDvbQpJpLphKiptE4UJYFovk2tCJ7L4emJkI5pIo7X1na/s8fmNyVRvQ37e8jcLOlcnek0DRGZ2tNS+GMdeN7KCxz/GqhZfs6ctPTn+gruPv+oaUzkoeyIe1bPaO4ObsY5OKpo0aCNzwQiiqGqH2bzf9fNfpM8Yt/cTkwdI12g9iYlUH3ibQOrpSlVUsAORrn5ed2w/bePO6ujK4f0tJZePzftJUBeVYxrrstxu0POs1O0bXPYOmW4qDvHVLwy/bx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88syfBqlfNyzWnKeT6tZhpZjD64F/wZ/ihzykZrB3fI=;
 b=caejmzAzOIG7geKI+nn+fat1acXtz86faURz1k99JAk8S3rIxGJMBMS3nauqo0lvuVYMRT6pMT+Ayvt5iu4Wo8xEW18h52qbckjTUgVfkcfEPpZTS2L+yMfVVLuzT/2hbfgO/aY1zP3jkE0ChQ6G+sGWQJftYVH/UWxSDqua6m8UnKGDDVqs7QR3npPm+tldyrz/WhdRepXFvt+GrNCM7dZhxiQVjtjw9xjig7a40xtp0fU9RTa1TtmCMTDpfVAryziiHy3mOWpybg1u8qTpyh8MdOZuHApevIPM/aqKPjhcgQ+os4WykXdow1Nmx5AkvA6AXyBGUJ+ox6IMRAIjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88syfBqlfNyzWnKeT6tZhpZjD64F/wZ/ihzykZrB3fI=;
 b=vS/cGaK4RopdSmdHH4ygWD4zFgUcoucmf4/XGNDD07/+5UBAUzeFYXk5k3RbYTr6XQi2P+BtVe1s5mnnvCvApa9Xal3/G7em7rMTlkIVvHBGvBNqFvke5F2EVqf0IqzmB0/YvP1GeRmB5gKy8liWvAmiN7kUXGsAViXL4/OcQ4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <50892f52-34e3-4967-927b-0a3108623cdc@citrix.com>
Date: Wed, 8 Apr 2026 10:45:05 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/4] xen/riscv: add exception table support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
 <dcf5786b4ec99edcec6554a338904c52f0c3b03f.1774863161.git.oleksii.kurochko@gmail.com>
 <a6c95e44-e324-493d-8e55-532223e56b17@suse.com>
 <4ebcb77b-7666-4087-b7c4-07e64260e5de@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <4ebcb77b-7666-4087-b7c4-07e64260e5de@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a70a15-00b7-4708-aacc-08de955385d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	I/Qd+EpRz3PVTxT0kGKQTRje3otzwXulfU2heQYAmeiF6PMUl7UFtjcXIsX1GWYQM+LjuplebWE2z211xEk7o4kvn3aE1NJdRMDdvMmNQAokrMrbn21wL5k3JmBdNVeO69JE+nEu9PMJ7Nu62ypmV4sSGt/cl8SYMiF9A0isT27ykFfNq1++heN2bH5XASmS9MmGOMYgtmJmTfpLIaJ0MbeeJ1klePZEvu5M42iXW43BNlp1pSOr6rrUMLOzrgUSnbWulZIhrZfroAlzhy7MqrtJMt4ZhEGb9b9eCYpPVUeaxBIHfZN79V7Ixl4l2wLNoSYyOYIS+DXWGeBDgc28evRuvvlrPOLQ/0xGR5+J4rBj/mRfocYqnod+TuZbfHyawovxIZTnJ0MkUDjKA9LkexXqz2tEE4vSqQ8/GJCqdCAiCZy8PETv+W9wodEngnWxW8QW/8/u7lAPTZ2BXJArVsNZblMuYJPObIp3O5dubBw683V9zd2bTHCyKB0PUBA0IjfxlCZEaTlmIl6GFk+lsHkQgUdUmun9gFLfgjqncRj+zJqIHlPMHvIQ16gVjxQhd1U0Y0Phw6QHuUPtFlEbK1otXRwTs41g11OcLGyyAklBW99jE/I3ksaXkUklMcnawCwC+u82CBCTLHx+NtT6TAKEr0kzyDOOSk8dSSEMtK4MWYr4fOmUIN8XLxXiLeBLiN5USxjd3lQavhKGJook84Nd2gFLivJSUF/40PUheWg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHpuVlBJTGx2WGZYV1dxbjJ6ZUh4UUQ0QzZNZ3BNUjRoUGExMWlPVUpJcW8z?=
 =?utf-8?B?L0d2U0lDRjArMXludmFYVDQ3Kzllcyt2aGNLL1lLOC9ldlVTL0Z6eS9GS0x2?=
 =?utf-8?B?dXRndmpxQXJTRm4zOVJEQ3RzN0VCZlE3RWxxdjY0T3VpV1lqTnlBU0JmOHkv?=
 =?utf-8?B?czU0eDgvWEJlMHNBN0ZnY0o5Y1d4RDI4eStxT21XSmlPTCtRb1k5Q0w3QjJX?=
 =?utf-8?B?dVpPUDJzT0ZTUHhmeVZxSFJoSVFqUHM0bnJJVlFMRWFza1BGcy9hMnNySSty?=
 =?utf-8?B?Yll6djJHT2lnVVJTclBBMGtIbkQ5ZUtsQ3VJcHZrUGpZbU91ZU10T1hYek9M?=
 =?utf-8?B?S1FzSmYyd3RhVWxSMkNrRzd3dnBHYlNzaDRDZW1zZFcyTDBkRjYvZ3k0ZCtp?=
 =?utf-8?B?THdFcTVwUm94eE96NWl3anBQZnFJUGlPcjh5R0VhSVpLcWFKaitrQjh1cHBh?=
 =?utf-8?B?a1VmZEg1akN4OGhXSThVb3BMdnMzT20wQy92UC84NmFhMVBQUVo0ejNjSHV4?=
 =?utf-8?B?VkNVQTZ4b3dvam9OalM4SmRmQWhDVm15YWlqei9EUGRQU1YvYWdXNE4wMlky?=
 =?utf-8?B?dkpPWEl0d1BnQjZEN3lCK0xieC9oSDRtdjRKWTJRVURjaDZ6Ui9qdGVURC8w?=
 =?utf-8?B?bjdWMlI2eFRUQy9uWUpPVkhrWnByRGZVOVZlREVvRStpNjg1YXZ1T0krcy9w?=
 =?utf-8?B?QmhnaHFIUnNpc0FiQlpybURYU01ML1RzaHlLSDFoVnFrMU04Tjd3b1lCWE1P?=
 =?utf-8?B?WkVnU1RONjJJUVdTcGtRdnZURW1OTmZ4RkRoT3VFKy9udUVkTXpjVCtqN0My?=
 =?utf-8?B?azdZbTk0QzBZY3ltTXVvRTFITURvV0puY3lpRE11ZXYzL3kxVXJjeGx1RkVS?=
 =?utf-8?B?NHNNeVd6YkRydUtWcnkrZXl2SFhubEtlZzRoVEpzOS9XNHYzdUhFa3NUWFBz?=
 =?utf-8?B?aEJZWGsyS1pUU0RRNWhyUk9aSWdoQVBGMGs2TjlCNXdaYTVPbE1xUGU5SUNU?=
 =?utf-8?B?dkZ2TXNNSE9uVURKa282Y29TMUQyMi9yNFpzYVc4NC92NXhFRldwTVBRN3VZ?=
 =?utf-8?B?Mm1aYTVSUGZvZ2gxcVlPZzd5K1owYVhlRExnbEJmT2J1L0JWUTVKTXh3b21j?=
 =?utf-8?B?c0tSbjlyVjJFNkNzN01NR1RORlJGeHdKNHdscHg3WlJSb1RuNGlkS2Q2RjUy?=
 =?utf-8?B?RGpxUkppVXRJTU9HcUJQRlhKcmZDZStJampoSW9sZ3ljOWtacmdYcUJzN25S?=
 =?utf-8?B?K09GUmRjMVd5UnJWaGVZalc0NEtCdHg0T1NuR1M5Yjd3eXFVb2UwbHdVWEc3?=
 =?utf-8?B?NmJyN3Rva3p3azZUVXpZYksvc0xmZ2FDRnBaRHV3WHpYako4L0s0Mm1xSmRS?=
 =?utf-8?B?cGhQYjd4dmNsT0g2YkN3WkdFa0YzOUtLRUtVdEUrS2ZmSDZJS0g0VGRza2sx?=
 =?utf-8?B?T1RONThHSTYra2RtTmIyU013YXhSbEFtRkE5eTFxV2hHeEI4NTVYVjN0blBw?=
 =?utf-8?B?TUVNc0x5bE03dnRjay9iZFRNbmJ1YVJKd3o0bjg1YVFUdmlRajRZZ3FPM2kr?=
 =?utf-8?B?eWlyYmc0ZWo1cDMyWWt3L3pIaVBOZFZTK3hkUGxXYTVXbzhUcXVpRHA4SjhI?=
 =?utf-8?B?R0RYZ0xjTnM4NENLMFJWS2h1WWE3YXNSSGpENWZldnIwaWNBa25KR2RqUTMv?=
 =?utf-8?B?bW5LdU5rWVZTWUl6QWRYNkV4TWFINkQwZFBNZ25hQ2Q0MkNEbUFBRnlnU2lL?=
 =?utf-8?B?Ykd5b3ArUGJFandzaks0SmRjdDYvNjZDS2xlTzRBeGc3RkJoTWVKSXpSQnhs?=
 =?utf-8?B?Z3ZObXkyOVdkSlZtczBUMmhQSUw4OStCekZNTnlMdGFvOG9RZitHRmhadGkr?=
 =?utf-8?B?S2NnVEtlOGJuMkZyUVp6Z09zN1U0YlBUSWtoS3Zia3ZvTEpOZEYvVHgxL04v?=
 =?utf-8?B?MTRZMTU2d0lIUUlCYWdtSjFPMTVGdGIrc3NlZTIzdWZTODZjMU42KytwK2w0?=
 =?utf-8?B?RVllT1BWZWJ6NmVvZ1BRKytWM2N1ZFIwa2lFZHpsNHRqdWRKVENaUXUyd215?=
 =?utf-8?B?NVB6UkFlaHJvVldFcGNhamJha1BHUDZmZ3d4ZFNnWTZrZGY2dk8vM1c1Q0tm?=
 =?utf-8?B?N0p5aFBwQURvZVRKeXBuTnB5UzlFYSt3OWwrVVJhNi9FMzRtbDZoaEdKT1hV?=
 =?utf-8?B?dVR6RGNDNmZoTmZiWkRPNEVrVlplTjNqQ2RBOEZZdllLUzl0NGxKWk9OeFRz?=
 =?utf-8?B?RGJEbVNzRGZrRmdpQlVIcXlZZFNJZjB3VzhmUWdZaTdzZ1prdjhzaVBhVjha?=
 =?utf-8?B?RU5waEdEY3gxZWd3d2Z6U3hLd2dZVzQxdGNsSjFZaS9YTjhzRkhUYjNqSTUy?=
 =?utf-8?Q?z4lSzCtVolNFrUkQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a70a15-00b7-4708-aacc-08de955385d9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:45:09.4346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyFZTtkAYTGv8a3HeoU8iE8I0eB2dwhiuGFRyjQcuPKuPZRwaukyM/f93sJE10A9kUgL4raL0Nx9RJCYaOSIaZ4D2v9RN0W8gXYGTu4EZSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5400
X-purgate-ID: tlsNG-c1860d/1775641512-74F5A497-1BD71AED/0/0
X-purgate-type: clean
X-purgate-size: 2233
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,microchip.com,wdc.com,gmail.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6C8C13BA114
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 10:29 am, Oleksii Kurochko wrote:
>
>
> On 4/2/26 8:24 AM, Jan Beulich wrote:
>> On 31.03.2026 21:04, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/extable.c
>>> @@ -0,0 +1,85 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include <xen/init.h>
>>> +#include <xen/bsearch.h>
>>> +#include <xen/lib.h>
>>> +#include <xen/livepatch.h>
>>> +#include <xen/sort.h>
>>> +#include <xen/virtual_region.h>
>>> +
>>> +#include <asm/extable.h>
>>> +#include <asm/processor.h>
>>> +
>>> +#define EX_FIELD(ptr, field) ((unsigned long)&(ptr)->field +
>>> (ptr)->field)
>>> +
>>> +static inline unsigned long ex_insn(const struct
>>> exception_table_entry *ex)
>>> +{
>>> +    return EX_FIELD(ex, insn);
>>> +}
>>> +
>>> +static inline unsigned long ex_fixup(const struct
>>> exception_table_entry *ex)
>>> +{
>>> +    return EX_FIELD(ex, fixup);
>>> +}
>>> +
>>> +static void __init cf_check swap_ex(void *a, void *b)
>>> +{
>>> +    struct exception_table_entry *x = a, *y = b, tmp;
>>> +    long delta = b - a;
>>> +
>>> +    tmp = *x;
>>> +    x->insn = y->insn + delta;
>>> +    y->insn = tmp.insn - delta;
>>> +
>>> +    x->fixup = y->fixup + delta;
>>> +    y->fixup = tmp.fixup - delta;
>>> +}
>>> +
>>> +static int cf_check cmp_ex(const void *a, const void *b)
>>> +{
>>> +    const unsigned long insn_a = ex_insn(a);
>>> +    const unsigned long insn_b = ex_insn(b);
>>> +
>>> +    /* avoid overflow */
>>> +    return (insn_a > insn_b) - (insn_a < insn_b);
>>
>> What is the (slightly malformed) comment about? I don't see anything
>> close
>> to possibly causing overflow here.
>
> Originally, I thought to imeplement this function something like:
>   return insn_a - insn_b;
>
> It'd get integer overflow when insn_a is a very small number and
> insn_b is very large.
>
> It could drop the comment to avoid confusion.

"insn_a - insn_b" is a very common bug in cmp() functions.  It does
cause the sort/search to malfunction when the subtraction overflows.

However, the form you've got (a > b) - (b > a) is a very common correct
form.  I'd drop the comment.

~Andrew

