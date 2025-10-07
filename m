Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C74BC06CE
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 08:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138509.1474186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61cY-0002Q2-RB; Tue, 07 Oct 2025 06:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138509.1474186; Tue, 07 Oct 2025 06:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v61cY-0002NK-OD; Tue, 07 Oct 2025 06:56:26 +0000
Received: by outflank-mailman (input) for mailman id 1138509;
 Tue, 07 Oct 2025 06:56:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v61cW-0002GM-Vx
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 06:56:24 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc9f2517-a34a-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 08:56:24 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS0PR03MB7289.namprd03.prod.outlook.com (2603:10b6:8:120::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 06:56:17 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 06:56:17 +0000
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
X-Inumbo-ID: bc9f2517-a34a-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQxleXvQEOtNDRlxZNUMfqE3qLJ7bEvQGeh5RfmMsDxAhmLZvNrpCBM0q/CMQtKFUi/l+uFz5BX3pahu905nNHEj2qGNiuyGgQLZDsQfJXjhxtiAGSRMcONJrJ6NqggTidxKq6Zi8ar1yMakDx0cQkVo/Y2iwCZvjzRMdYPzYIYoLdCItL58dA2DKNnrgo9r5rBUq7gZTYWKaE3cfvPRiNYT0ZwQBZg5IqNBwVrgwJqtffIZtmz3pNbcR8Eg0mRXblBttTBYtZixLBDgN2gV9fwUjKNXv8KnAPZHO1vnOVBv7wM061pyo+2YigS0XckAnG+U1esmryzIDbvwqyKLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g38lOrSsynXdt5VV1ic1sfZxsGVVdagKyB2WirZRrdc=;
 b=JIZ+8j25zGZOSLvcy/alwJy7uuFFOO1N5RJQU+zEhYgB4FPgyTgFRB1ayJfvHco26JiR+eDzZZSw5fTvFfuW7/cUudyVeu2qHfmX3DmkR37bvgd1/gTdjbMy31LhllIBtP0GJH/b5Yu2KHyVrBNywwOtLYit8NBvg3W+7a1MIPDZz398wvOimzqVlVBXnSmKvo/FV8ZB5o0RVK+t7JAlFVvF2enJqpAx6GVabSRGqYVYa1ZgAKzd/4klP7g85UovxUxxwUf6SC0Z/pqsJnciXDygk0a1RCfv1YLH7NM6pX51Qenm2WfWNoxnpPUIHj30t9OqvSaxrk8XI+idgeeCNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g38lOrSsynXdt5VV1ic1sfZxsGVVdagKyB2WirZRrdc=;
 b=g4QtlprinlzqndWlqeSz/SurnurkTINcOR2p5kUT9Ap5MMP9sMAs1EADvv5oDfxY5gFjZtn9CmBPYU6gyhyf3YRUcXYgTrPk1WKAbRkhB5C5hdstvX1GTiNvW8T1L/JBoBvdZ3mnJpeEIc0UDLPW6/GNuPZy+jdsjbhqfU27/bk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 7 Oct 2025 08:56:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.21 0/2] Prepare RC1
Message-ID: <aOS5jqRK34eDKs2f@Mac.lan>
References: <20251006200840.2171113-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251006200840.2171113-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MA4P292CA0010.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::13) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS0PR03MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e238e0-2349-4082-5561-08de056e9d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnBlOFErRmx6M09BdTRBUTFzUjExUTY3U0l4eGtXWUFUakRiQlFZNksrbmJu?=
 =?utf-8?B?NVd3cElEQlZPRWo0andic1prU2t3b0xqTzJxSWp4MExiVER5WGdZbit0Lzdj?=
 =?utf-8?B?RktRWGRNMmQ3ZUE4dHlRTWtDaU0va1hObVJJL1c4YU1pY29IcDRibzBrMEZk?=
 =?utf-8?B?eUVYVFplNFJyR1crUnpSeTVHSWk3TWpZVGRMVHRMV0tsYlF6bk0rTjRxaGVm?=
 =?utf-8?B?Z0duOE9DVW5BcjVOTno1MTFNUmcrUkd2MnRVZG1qRXBuU3FTTWpQMWpDUjFP?=
 =?utf-8?B?Ym9ZOVJsOTl5blVNRERwL21BV3FVZ0k0MVd4WnR4RUhJcXlsSVNNYmtGRGNT?=
 =?utf-8?B?c0R1dXFsaHhjLzhBMWpJdlBLMW1YZDJzL1VxQWxRdWh1cFVxQU0xeUdVKytG?=
 =?utf-8?B?MEFzblhDZHdwbTU0cHhIUkpCTFFSQWJzKzVwdjdUUHU3NjJGdmhRd1NLKzFW?=
 =?utf-8?B?SjJkcHNBdlh6VGJkZThPUU1VUlJjR0tEVEx1eFVsNDd5VXdIeGhNenpqc1FF?=
 =?utf-8?B?dWVubUt2OEg2SDJGT3l0THp3TlJIVUV0ZWpqZlUrd1F3UzZBb3llcWJtV2F0?=
 =?utf-8?B?NTM2aEp1Q1VJcmkzcUdaeGVCZ00renhXUkRLZHNqYzArbEZEQU5zNFdLOWwx?=
 =?utf-8?B?VDBPTGQ5bjA1M1pESG5HVTRDTk5aNnk3TG8xUU1zY2QxQks0U0U4a0xES2lY?=
 =?utf-8?B?cGQ1NUJRS0NDY09KeWp2eCtQNmtMZXRwWUlLazhHNlBOcFNHRnBQZFh3VUtE?=
 =?utf-8?B?Z2hFVzV1SzJzRUF3NmVzT0RBcTNkNmd2ZXlQU0FWV3IrekZkNzFyOGs4cC9x?=
 =?utf-8?B?OEZEQkN5OTYzUlhWbnFmUHQxWmU0bWQwNHRaMnNWeGpWMU5ncFpDQlJ5N2pH?=
 =?utf-8?B?WHRjRHAzLzFZeSt4WFhDQnowR3hTYzkyOWtWS2RNZ1FqeVVhY2V4SUR6VmNB?=
 =?utf-8?B?Q09oVndBcXQ3ZVN3SUJpU3pvOGFXNVNxRUo1dGRlNENoODFWR09XV2FLR21R?=
 =?utf-8?B?OGpUK1NWbmdpQ2hDcStCdTJESXBiclpnRGRhb2k3TzNMeHpqR0NtUFRGNTdM?=
 =?utf-8?B?RU05YTU3L084d0g1cVFNMXQwd1pKbUFPc2J4QlVnM1lEZHk4T3VNWG15azBR?=
 =?utf-8?B?NWRzcXFHSVFMcFRQL1dmaVpQbVJXSkZ4UERkWjVmS0dVdWYzRWZnUkJLQ3Ur?=
 =?utf-8?B?N21LYXZCN01Sa1FYWURvd3JCc3F0SFJNejdpUlN3ZHVPd0wzSG5BR1lKaVJz?=
 =?utf-8?B?ejNqOWpqejVCY1V2RlhuelFYMU5KMzNhK1NPTjhMaE83RG8vRjdNaWllL2Zj?=
 =?utf-8?B?MytJQ3dXUlE5bHU2M1MwWmRuZlkzU2FZNHYveW1ZV3U5WnRaeWJZY2RxNzJI?=
 =?utf-8?B?SkQ1Tzl2MlowbW16NzlyZkU5SmY4MWNVUHlYbWl2bncxbDhTZWNWUDc5Mmov?=
 =?utf-8?B?bC9Kb3ByNGNLUzM5MTNvOS8xUGZlNHRkcVlBTzhIclk1ZlJDVVBhWERIaTJu?=
 =?utf-8?B?WFc0ZEp2cFVwVUwrQkQ2RWR0dGNkeGhTM2pyL3JaUVo3QlVWTlRad2l6WWE2?=
 =?utf-8?B?ZzJFdEJmTmw4NFBRKzZxbFFTSU5XQjAzM1JDelhnSFRyQVk1alFkNnd4alNy?=
 =?utf-8?B?aGpiWVBmd3BVblkxMWpzNFYwZHVCK0JpQktjTFVTbklRejRvdmNpUzFFU1Mw?=
 =?utf-8?B?eUhiUGdLZ0tkWGo1WktNak5ZK2VXKzdQcHQzbGdxTzhpSmZ5L3VZeFB6SFlr?=
 =?utf-8?B?VnloRy9zOCt0L21FM2tJY3JGOGg5YmZVWTB0VGdBN2V4Zy9FYW9lYlYwUFRa?=
 =?utf-8?B?bmhzQk94U2NLeXJjc1RHcHFTOGplQWpsdGJjNXVBKzNvUk1PQk80MmxiL3Jh?=
 =?utf-8?B?ckRVQ3BDN2pmb1V3YnBsRmRlRm5ldG5aSjBBaVVRTHJuTkhzZC80SkJGSTVp?=
 =?utf-8?Q?BaNK9fI3PKRkkYrUg2hwpXaJl2XITfE2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEo1UTdYNTNQUC84SnJ0NmhqTi9qU0Njc2hPUlhyMHQ3Qml2cTJvaHVBSVM4?=
 =?utf-8?B?VHg3QW1jemw1SUtYWnhPMUpCRkJTd0RWb1lDTWtBTFVDTE1Da0U5WjdtQ0tj?=
 =?utf-8?B?RHpDbzRJanUxVHJXWWtpUlNiVlVWb0dxNFJudXlTNGY4bEVqVUt4TGNtQ2VE?=
 =?utf-8?B?d3FiRVRWei96TXlpTFo0blNWakEvZ0JrZEUzTXFOUXg1c0ExR2hOS2lkblF4?=
 =?utf-8?B?K1hrUlpGRFd3aU5zd3NjZ0ZaRi9OcGlweUM1bzhDUU95QVNYbXR6eEdmUWg3?=
 =?utf-8?B?SDdwYkJsV3dvdm9DY0tMOUZFUU9nWkdzZjVabzk3WHlFYzhIZFZsU0xmS2kv?=
 =?utf-8?B?MmdCczJ6aGtyMGF2cDNGdmJrQkkwUmhyd05IeTNmQjM2MkNhZ3RUVFFaZ2kv?=
 =?utf-8?B?NUh5c3JZUVc4UDZnZ1E2UUROZW8vdm5NQVFlbFRwY3JHYjA4Umw1b0xISUNX?=
 =?utf-8?B?aHZRekM4YytqbHA5Z0VLL1RWSEdqVnNVSVBJdGpGZHFsc2RkNmtUZjJPRW11?=
 =?utf-8?B?RVNQVC84UGxTNHM5LzJndy9pWEZwSE40NkJsbThPVWU4ZDcwT21qSkVLL043?=
 =?utf-8?B?R1FjWXFObHZkOEV3cHVEVGNIbFB5Q09leGFWb01BNGtPdFpoUWdKRG1BRDY5?=
 =?utf-8?B?eXk2aDloYnVtdWl0eXUxbmZrUHYzZWpjK3dRcTJpeDVPMmNqQzVtTFRHL1BR?=
 =?utf-8?B?RnlGYzZ0dmJNWE8rN1Y3R3UxZEdSU0M3MjRERHFSSnVGOU14ZWx2Z3djZG9U?=
 =?utf-8?B?ZitsMHZjdUJUUTZ4T29DTk9BVzUxVHJXT1luTERaV00vZ3FRLzRieWxLRTJo?=
 =?utf-8?B?NlVXWklacm14cXN1ZTkyNThPL2lRWWF0dHlRTjI0VkE1d3BaZEZlQWEwcnor?=
 =?utf-8?B?TGE2WDFsc3M4SHNWb3k0dmVIUnU2L3VwNXhPQVFkbFcxcnAyTnNjWGhKbEk4?=
 =?utf-8?B?WW9FOGZWNllVaVluY2VWTTlZMUxnYldGRzcrV1o0WnV2WVUvOU83OCtnVTN2?=
 =?utf-8?B?bG8zRTJJQzU5akxXMWtpN3dEQ3RGY2prYlI5YnhheEY0UDhNQzNyNHVndkQ3?=
 =?utf-8?B?aXdmZ2QySmJmUWRDdEJ1M3ZuUmdONGdKTEQyT3YzVENPMllTbjVBS1ZGZ3F4?=
 =?utf-8?B?Zkx3YXpCVjM5dGliRmMrTTFaUFVqSHVpRHFCbUtKdG5oNzQyelp2UUsxcUFF?=
 =?utf-8?B?S2plMktmU0hBQVBkbm1KTFBFcTl2Vmc1OVdkUDQ5cWdYaG9WK2lLNU1xV2hk?=
 =?utf-8?B?N2VkTmEwcmdoTW9PNEkvYUx4T1RlYkpyQU15MER5OUhKQTQ1MjdNeG9YQVVJ?=
 =?utf-8?B?QzYxVnlGTmxJcElSNUJyTGN3L04ydFEvTDIxbnlXek9aYXBjWGUxSUtXQWV3?=
 =?utf-8?B?THRmNGhQWDBsWC8vRlhsTnBiaXBOaGNzZVZSamh5ekNYZEJ2MVJmT3YyWXJt?=
 =?utf-8?B?M0FtY3NGVHczTWZXMGdSaUlGbXc3ZXh2eWhGTkVMWVd4UjZoUHJvb0s2UEpr?=
 =?utf-8?B?M0VZSDJlN2VaMDIreFVadDAzZ0RPK2VWUy9RUFZIV0NxWmJKUXV6WjNWaXJF?=
 =?utf-8?B?T1I1WGt1MFZLVy9TanFkMWJXcVpnUnNQNmFJU1Q1aytXUEFzOTU1cWU1MkZY?=
 =?utf-8?B?OGszYklQbU5iS3VyK3pGUlU3Y1hsRUQyK1lxdVZ5SWorRENmc3RCYU5mdlZF?=
 =?utf-8?B?bUQ4QUo1WFg1Z3FGSm1NZ2dmTVFrSGdndUhvMTZkWEQ1QitzTlNkYnNlc0lv?=
 =?utf-8?B?MEs2b0Z4bGtic0pQdEM5aUJwT2tFcHVqUm04ZHRzczNFNGorakIvT3J2L21X?=
 =?utf-8?B?VU0zaHJrbURUZ0Q3OFV4NXNoOUw2THIrTG5wMmczL1MyMlFUK0NyR2lXS3JP?=
 =?utf-8?B?ZWc3TURSNmtnVDFQckN2ZlZTdGZSR1VtMnh4REZkVE5wRldBZHFhOXJGZ1hi?=
 =?utf-8?B?dGJlYzIybkdsNHNaeE5ya0VwMWdpWG1IelVWd0ZNRkxTMWZKSHV0ZjlpZ1RN?=
 =?utf-8?B?TmdRTUxybExtOVI5YmRDdnp3VGc1Y0V5VXRoWkVoRzZtYTZvWWJqdDY4aUVl?=
 =?utf-8?B?MkFSS2FtblBtWnYwM2p4RSt6eG5DamxkcHVkSnlHWWtSSmV3N3hqRGRSYkJ2?=
 =?utf-8?Q?Dwz0NEK0yIZpGDTQceOPl2J7Z?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e238e0-2349-4082-5561-08de056e9d46
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 06:56:17.7629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsigdA2quD3uZUKYjS8PXKpoUFLI/sju9dtdkxpljKQYNxSRAqSghCYgvBjL1Yh2n6/rNZs9o52xUmnjyVNBow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7289

On Mon, Oct 06, 2025 at 09:08:38PM +0100, Andrew Cooper wrote:
> Andrew Cooper (2):
>   Config.mk: Pin QEMU_UPSTREAM_REVISION
>   Update Xen version to 4.21.0-rc1

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I've got one comment in patch 2, as it has a slight difference from
the previous switch to RC versioning.

Thanks, Roger.

