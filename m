Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1FDC8BE28
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 21:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173364.1498415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOMFJ-000781-2T; Wed, 26 Nov 2025 20:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173364.1498415; Wed, 26 Nov 2025 20:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOMFI-00075r-Vc; Wed, 26 Nov 2025 20:36:12 +0000
Received: by outflank-mailman (input) for mailman id 1173364;
 Wed, 26 Nov 2025 20:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GqHT=6C=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vOMFH-00075l-TK
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 20:36:12 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83428ca2-cb07-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 21:35:57 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by AS8PR03MB9365.eurprd03.prod.outlook.com (2603:10a6:20b:57d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 20:35:54 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 20:35:54 +0000
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
X-Inumbo-ID: 83428ca2-cb07-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXNAY5KumZvZVCdI5W6WCx3TsM7bWjq6++L2z56K4cyIFHF7nubJq+9F5jLKXONc4r3uf7qS3bZm6xz7B9Sd8WNS9RGDXuKE5jgnwMIg/NugW71grgJ6QImngbXGVTChmPkqPw1LbBJwLIPvVEJvBAMc3TvS+hB2uGJ7dEDm34XjJrLWfNxbtGbSLpO4VllFlCVbNValR5dm0LX23S+aIdaM0dETakUBmHf/OUmd8g1L0v7JK7BvhxBDR5QundhCQZL1RYlB1tmuc9oabbb94B7J06TYL4TIj3zgGWjcgBu1LW8Te9bpNSg5QlMfl9aY2GXo+sK2H3Ppz6L+mUGjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjNEa43S9YozlXIRJEM2jd23F4i/z7miVjUjfFe1MBg=;
 b=S6604kiK9sOihky+RIagk+W1g7IarLCVeJOwnQzBWW4SH6G4PNcDBT1A+MjX3CjWcxgJRayF6B0CB4FgF698AzVl/XDJ5Js2cnKGgOp7+vGPBDWOrZSDYC6mf1OnimO+7Jcz5YURJQ0HvZJGCM188GrS9uc4W+CLTaXndirjjIZCiaNQ4advKrYOeHvtt2EPPtqYMF+8IJRW9CyoJjlERkIVg+yGDGZSU0TTR4otSBSfwMxtm3ip0UmCUgo/Hy/qb603tLCrapX2qAcJ/7LiT8BDxOWEWdq+xQfTXN1yHO/5DnwueZtnZWrXyhWiRN7KF2PLq/J9E9vLQhGmwzygPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjNEa43S9YozlXIRJEM2jd23F4i/z7miVjUjfFe1MBg=;
 b=Gvqe++cHDxQcZUUoyMd62uAXesd2eNfBf1qNBOaQFk9hipJHBmKto1lxbvy9j0e6iP7i2AERrt4qxUk0BKTmG02OP7bItXalFeWC6YjVo4TyhDpA6uOqTq/zU4Gl3d5MBtm1NjQGaGfwE8cUpSVVJwyyY6eIM3zao53glNxpDmpBmRQZE20PFK9pgJ7qdZKX2xSYdqYHf1L9V/b8LqhGUU0RJT+nRo+9YfZpelDyVQq8+L9jaSjXG0CHkbzAEFTmRJpnsxkOq08LA4xOdPpkz0IPQSp88CMdzJklPY2rt3/AbITvgJQ9JR8p63w7Xor1XFVNcimkBWc0g/eHAJoupg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <dabea7a8-121a-4b10-ba86-2b33cbc3e3c8@epam.com>
Date: Wed, 26 Nov 2025 22:35:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/domain: introduce generic functions for domain
 struct allocation and freeing
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <b5c703a64c616d6321f8a98cd28f0659838d41df.1764167337.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <b5c703a64c616d6321f8a98cd28f0659838d41df.1764167337.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To AM6PR03MB4600.eurprd03.prod.outlook.com
 (2603:10a6:20b:6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR03MB4600:EE_|AS8PR03MB9365:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe0ba3f-4836-4b88-580d-08de2d2b653d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlNQOU1JcDBvWGxFaWMrOVdRd2pkWXdOZktqL2Q3cmU4dm1TME9aMC9qNDhD?=
 =?utf-8?B?M2ZBNDY2WDhQZ3gvOHRBckM0N2xjSWNmOTJFUGRQUjRIVW9DeUpmWHpOYmoy?=
 =?utf-8?B?Vm5UNUlKTFh5ZVEzOXZVYTB5KyswaDlaZjIwY1N2OUlNUkNIQUhYYVBncHlq?=
 =?utf-8?B?T3BBZjdsTUFNd1psblh2Slk0MVVMQ1ZXSWRtSHNMR3RPUXY1QUdqWmJvVDJ1?=
 =?utf-8?B?eWdEWEplbFpnaklKc2YrZ1haSHJtblV3SHdBeHRiNlU0a2xEcFlFdmNld0hP?=
 =?utf-8?B?NGVqcTdHWVRNQ2tmNUdncHUwNWZjZFVKdlg5dnJsMGVKRmtwZjNWVHY4R0Jk?=
 =?utf-8?B?UlBPZnNLc0xlQWJwRmRtY2pMUitQZXE2YWMvS1NvV1RVM3FMajVQOUlyeUhV?=
 =?utf-8?B?WnQ5dzByM3lSeFoweDNsdDhxVWNnRy9qWEY4OGVROUJ1c2poWUUwdFkxL0pY?=
 =?utf-8?B?UG8wVzhoenpBYllkdWpCMGp1dWI1MEdBdFJBbEVJMVpHWHNKQkI1aG9UbGc2?=
 =?utf-8?B?Y256REJoK0c5dW56N3gxT2RERnNOeVRtQk9RdVBBOXR2ei8vTmNmM0xZaFMr?=
 =?utf-8?B?c3h6Z3dXdXRjcWx4T2hOMVd5OTJMMHNOMkhmTzhEY3cwSDQ2UjdZVGFmMXBF?=
 =?utf-8?B?U3lJcDJFMy82ckwxSE5XVjJ3a0UyT3B3UlovQUxNUUdTTXVPSUs0bGIwNjhJ?=
 =?utf-8?B?clQ4WmNXOWNaUjBSbTBUWk5RTWh4clY0eVNiSEQ2ZGNrMW9uYU9md3ZpY0V6?=
 =?utf-8?B?L24zYk5TMGRFbUV3WktoZjdlWUNZUFE2anlHcjlDTlhwZUdWWW04NS93TWM0?=
 =?utf-8?B?bWJBSzJFd3g4TU0wN1p1b3RpYU1JeTVWaWExdHc3RVpETlJLOUpud0lmOVIr?=
 =?utf-8?B?eUZ2UXk0c3NFS3AvSGVic0xaQ3E3NkN4UVA0UTNCTkxlWWpzbkNZeEJTRnYw?=
 =?utf-8?B?akMrek9FTUFScjM1b1U2SE91Smw3OGxQOHRocmJtMlNMTUoyTWFxR3pkUUFP?=
 =?utf-8?B?VXl3Ty9GVUFzajlsU3VFcCsvejdYMnBxVUlHVGxudncxa2JkUU5meVJOSTZW?=
 =?utf-8?B?ZVpwaXRKK0k4SGlpSWRvUk1Ud21sNWdqSlFDOG1WZGF0VC8vYVBUWFZDeEdS?=
 =?utf-8?B?cWUyNU9JWnBvK3M3Ym9wSmZtOEQ3VnA4UUxuWFJJYjFNa1hZeTZCNlYwY0tB?=
 =?utf-8?B?VnVvSFhEOTFWQ1grdG56MWZJVTg4T3J3d2N3QWx4eWdTczZmRjRxSG5Md0lT?=
 =?utf-8?B?V0ZIeHRMUG1kdDZBeEJoeXFzZy8xRC92VE1vL3ZGd09NUjgzVmdrTTBFUVps?=
 =?utf-8?B?MmpkRjdpQ3NudXhaYVNrT2VPSG1ndzR1Mlk5ZVF2NXRIT0R0QWFUZU8rN0xp?=
 =?utf-8?B?cFRueElYYXoyTWVPNk03amhCQXc5akFqRXljMkZTcWE0RTBCUUprQmVNaXBM?=
 =?utf-8?B?TDJkTHFQOUhiVnJxYjNsNGd2cGxweElURGFSMUFpczVJNHVjYzRCdGxGN1ZP?=
 =?utf-8?B?WlRJa0Y0emt5SjdNMzE4RDJCWlNmODdYZFVjZzRkWXFxa3FsTVZ1MGRzbTlR?=
 =?utf-8?B?MFBuY3N2azZJUDBHNXcwVDBBc1NRNHNoU2swYWkvZ2lVQVFCRU0vTWFwV3gw?=
 =?utf-8?B?QjFLeUk2QzVmT1h4Rmo2ZklWdzNEZlhHdklzNllYbGJYbVNodjREMmpIaGsx?=
 =?utf-8?B?QXAzNHp1MEJGdEgrVERuc3BZd0pNNVVYRm5vOWd6d0x6VUFRWjhKdXVuSHBS?=
 =?utf-8?B?OVZ3Z2V2ZDlpcnFXRml0YXdCWG1FVDdnSTIrTWhNZXZkU3dVSnpiVFdkbDRE?=
 =?utf-8?B?QWZZakpMeVZhZEZtYzRIbno3UEtLRkF6dDZ3RnlHcnVTM21DelB1UkxXWERQ?=
 =?utf-8?B?SFBxWC9ydXAzTy8vdXJXajBwWndRUUN0MXpZSGRQWXc0enMxRGVWNS8zd1da?=
 =?utf-8?Q?4zeMO7lsoIYv2GAXChCQz3WTsptBoQmd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVBDamZWWi9IVnVuR0srb0x3cDBxT2ZMb2JOb1ljcy9WTmtyTXBXTkxNQ0VE?=
 =?utf-8?B?WUNGK3pabFVqREtvK3UrSzl4cUtkRlpLaTAzUWh6cFRlT1JnZlpJTmFWYmxD?=
 =?utf-8?B?THQ4SFpuR0pMeUVuVmdVS1FRbGt2MGRncVBIRnBEd1dGZ3RDZnMwRkkxcEw3?=
 =?utf-8?B?SXJuVWxVL0R4MjN6MTJKZUNncUtxSFJXaDdxWWY5Y2kxWkk0NzdSdGdUSG9J?=
 =?utf-8?B?d1lPRTkvK1dGQnlrbHlsczFReXkwK2RtS3ptVmd1RlNta083cmd2QUlXWHcr?=
 =?utf-8?B?b0p0dFJwSVJDVEQ2TGNmTXVqNEpqQjlkZUhQMSs4MTRVUm1UcU84aVdZZlhl?=
 =?utf-8?B?YVM2M212Rm9GUVRTQVBkYi8vZHZuTEJReU1rT0hubThtUWZ2ZDJvMzJkbFl2?=
 =?utf-8?B?Z0htVTVRZWYwdHVjY1lrSmswNEFwWVdWL3RyVWNIWXZPd1F4UE1qRDJrTk9F?=
 =?utf-8?B?dkVzOEFtWTJsdXhiT2p6SURlV1p0aTFHVmd1TGhVMG8waUVteHY2YW40K3F6?=
 =?utf-8?B?OEVsaXowSEsrMnk0Y0VNc2hCTnB2Z2R0NXJDRkI0ektGM05FOWxrNTIxQy9D?=
 =?utf-8?B?MVQ4emh0UTBHOWVOOU5tUXpNZUhlVE9rUFMrdVZscThkbDlJRjUrQ3B0UmdG?=
 =?utf-8?B?WEFDNEtsa3JzRjA2WlF1WHJhaHAxT3hjelJNdXBRcDdkbHhIOTYwUDR2Z1da?=
 =?utf-8?B?TkhmVG5OQlhLTDc2UG5xUFVvV2ZpSHQzemdMUGJISUh4WDAybHo0Y0NZUGNP?=
 =?utf-8?B?QUVUcjgvaEZEeXdZNGF5dnU5SElpZG5uOTJZT05XZFBPZDBxenJ5Y2d0UmhI?=
 =?utf-8?B?Uy9EbXJ1OEhhUzI4ajJYUjBEazY4LzFtTmU0ajNkcnFvRVNrVUlSZDBYNU42?=
 =?utf-8?B?ZjZtcDF0d0pndkg3ZjArSmRVbzQwL1hjTFhpYzNlaUNrQ3YycHp1REZsbGg4?=
 =?utf-8?B?ZHZSMGxTNFZwdzJMSkxZbmpocm5FV0NwNVFldjZoMFdvUzZBd0pWVlpYcnc2?=
 =?utf-8?B?d0srQk54QnQyK2R4UXprcno5Y2tRYkNtK0JVSlQ5VVQ5cjNOcFBMZG5GbVRV?=
 =?utf-8?B?dHBhK0pVRU02eEhqNWI1RGNHaFFhYy8xL1J2dmZnWVg4S1QyMzFiUGhiYyt4?=
 =?utf-8?B?YWlMNTY0M1JrWTZMZ0xnUXp3ZlpZVmt5SFBSS01meTlEMEtxNm1lVFUvZWMv?=
 =?utf-8?B?a0lobUNBeTR1ZjNEd3NIOU1IVUdaYTVSdVhtQUw2M05vSlRKczJvNjVWUjBL?=
 =?utf-8?B?djhVblgyOWRnWjBGK3FVRU1FL1BJQVdRMVBBenJpV21ZYXp1MXR6QXI1Q1cr?=
 =?utf-8?B?SnB0cTB1OWJLUXVhaVJPNlh4VEZjd2lCbUNYQmdQNTYyMjRPSVA3Z3dsRk1r?=
 =?utf-8?B?dzJGNEdZWjF6cHpiazd0aVh4dzR2Z3NFbkxUUitZc0pqZEVEV25hNEZYa1BF?=
 =?utf-8?B?NlZjNXp4cWVKWmE3TW1GbFdvUmorYmV4UmlRb25rQmk2Njlpc0d2ODFGUzRH?=
 =?utf-8?B?OHFvRE1OeEhsOUVLVEZSdjRsTHRNZW1jV2ZubmFpOXZudTNrTUw2dVdhOXd5?=
 =?utf-8?B?YlpWRGtSS1kvTE5YQlNmOWRwL3IrS0VCekRjaFR4ZGV4a2h2clVQYjgvQzJO?=
 =?utf-8?B?RjZkNTZBTmx1clNOWFB2ZXZGZ01VdjVTYUJMSnI1cVlHWnhnck5uZHVmVkpW?=
 =?utf-8?B?ZjhIWGpYeityZ1dNZytiWFU0MytWVU0wUWRkY21xNEVmT1ZxeStKcm92ZWtZ?=
 =?utf-8?B?NmozRkJuNzB4NE5BdFlZYWxHc1ZHNHZWa0VaNExTbFQwV0NVY2JXeUxuSkM2?=
 =?utf-8?B?VHlVL1N4OFN5ZGovU2NBVndaRmNwaTRlN0NHVWpMeGRxZytBMDFhNm5iU0Yr?=
 =?utf-8?B?NkhaeCsza0JFQXcvb1EzbjFxMk5DV0RuRWtqNkNSVGpDcXZVYjJ4emRTbXFp?=
 =?utf-8?B?cXgwNURWKzFWd0dGSU8wL0U1L2xYMlVKaEkwU1g1cGZaMUQvVVZycDJXZ1lN?=
 =?utf-8?B?ME5UWnhnYStNVjE1ZDg4WHhJK3JpVzh4Z21WcFppajVHU01oV2FCYlAzcy95?=
 =?utf-8?B?QVNPQXJ6cW9PY0xlbFgybjNPZk5tenNuUTdET0krV202NnF5c2ZiVkdjd3N5?=
 =?utf-8?B?NnB1alNwWDRTT1hSZDZ5aS9UVnQrckxoQmVIRHE4U0lraXV2Wkt2bmtYYy80?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe0ba3f-4836-4b88-580d-08de2d2b653d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 20:35:54.2137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8USnwK+9O5iVz2p4xUyfG1gQSSaSAyJ3P3KcGlsHEk2E2f8zaSM/SxSYgtjBXsv3EvMblmO5aQfD249+gnRDYi40uEMLmYQEOW54zYuP6CU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9365



On 26.11.25 16:32, Oleksii Kurochko wrote:
> From: Roger Pau Monne <roger.pau@citrix.com>
> 
> Move x86's free_domain_struct() to common code since it is shared between
> architectures.
> 
> Move the x86 version of alloc_domain_struct() to common code as most of the
> logic is architecture-independent. To handle the remaining architectural
> differences, introduce arch_alloc_domain_struct_bits() for x86-specific
> allocation requirements.
> 
> No functional change.
> 
> Suggested-By: Jan Beulich <jbeulich@suse.com>
> [Introduce an arch-specific function instead of using a weak function]
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
> - CI test results: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2180836457
> - Introduce an arch-specific function to handle differences between arch-es
>    in domain structure allocation requirements, instead of relying on a weak
>    function.
> - Add Suggested-by: Jan Beulich <jbeulich@suse.com>.
> - Move free_domain_struct() to common code.
> - Update the commit message.
> ---
>   xen/arch/arm/domain.c                | 17 -----------------
>   xen/arch/ppc/stubs.c                 | 10 ----------
>   xen/arch/riscv/stubs.c               | 10 ----------
>   xen/arch/x86/domain.c                | 15 ++-------------
>   xen/arch/x86/include/asm/pv/domain.h |  3 +++
>   xen/common/domain.c                  | 23 +++++++++++++++++++++++
>   6 files changed, 28 insertions(+), 50 deletions(-)
> 

[...]

> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 3a21e035f4..34a02f089e 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -463,10 +463,8 @@ void domain_cpu_policy_changed(struct domain *d)
>       }
>   }
>   
> -struct domain *alloc_domain_struct(void)
> +unsigned int arch_alloc_domain_struct_bits(void)
>   {
> -    struct domain *d;
> -
>       /*
>        * Without CONFIG_BIGMEM, we pack the PDX of the domain structure into
>        * a 32-bit field within the page_info structure. Hence the MEMF_bits()
> @@ -492,16 +490,7 @@ struct domain *alloc_domain_struct(void)
>                   - 1;
>   #endif
>   
> -    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
> -    d = alloc_xenheap_pages(0, MEMF_bits(bits));
> -    if ( d != NULL )
> -        clear_page(d);
> -    return d;
> -}
> -
> -void free_domain_struct(struct domain *d)
> -{
> -    free_xenheap_page(d);
> +    return bits;
>   }
>   
>   struct vcpu *alloc_vcpu_struct(const struct domain *d)
> diff --git a/xen/arch/x86/include/asm/pv/domain.h b/xen/arch/x86/include/asm/pv/domain.h
> index 582d004051..6e65bc22fc 100644
> --- a/xen/arch/x86/include/asm/pv/domain.h
> +++ b/xen/arch/x86/include/asm/pv/domain.h
> @@ -18,6 +18,9 @@ extern int8_t opt_pv32;
>   # define opt_pv32 false
>   #endif
>   
> +unsigned int arch_alloc_domain_struct_bits(void);
> +#define arch_alloc_domin_struct_bits arch_alloc_domain_struct_bits

Is it intentionally placed in PV header x86/include/asm/pv/domain.h?

-- 
Best regards,
-grygorii


