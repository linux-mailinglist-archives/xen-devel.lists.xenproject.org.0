Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOeUJxe+cGkRZgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 12:52:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DC5564DB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 12:52:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209653.1521591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viWlP-0006ra-KU; Wed, 21 Jan 2026 11:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209653.1521591; Wed, 21 Jan 2026 11:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viWlP-0006oV-Hn; Wed, 21 Jan 2026 11:52:43 +0000
Received: by outflank-mailman (input) for mailman id 1209653;
 Wed, 21 Jan 2026 11:52:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GdGN=72=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viWlP-0006oP-1O
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 11:52:43 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afbca963-f6bf-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 12:52:40 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5536.namprd03.prod.outlook.com (2603:10b6:a03:28a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 11:52:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 11:52:37 +0000
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
X-Inumbo-ID: afbca963-f6bf-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8OrcXjSgx3gwc+ZC+CY3T+yN5vfI3edTLlG73bmtVWPGsXNX9EC7paNJ34ZYwW8TkY1DBz4Eu36qIH0LxoaO5esslToPCearJMvNLwaHk1Xn2/ROTY1VmF6T3IFDJnmteGNxETePkMdVFdPcEW7FGloP0NzlJ0wYZwq/+AypYjqX7vp6/Y4X9lqFeUiNWjo1M947k0gVZOVhc0xjZNmko0UJ4ILRN0cbK8Pu969gL1x6st9Ew8KZ0VsYaOMp+iexZ9gnCWFRpcBDbdIZqze3C7eB+TPu2NYDxo6tOoT1UNssDxDIUi9gf8hBJS0lewrjgSTCPfGhoHZWfz+JC/D9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RJSalKceLaiqmm9kVfC+nw7lO8PCaF+4fKwp08Acf4=;
 b=IeVMFy7p8IwFbFOQvm2pdJZf2m4lUKuKYQK35SQ5iSHqFvh1Su7bDoZ+mEOfuGVOROla8NimikgLhW4ucuveFU+vbWCO3IRDI/UH+/Jdj0nzfOlROhewrZ13/3MPqAA/OLE2Rk5ZfDXfviHo5IGrJMTTQ6VyyAxPej6ywCMk2qCSo+7swhWG52T1TvKXPhDLVnca0VlJ/+7T5H6FMAmQ8w40+swB0k/ilBe4bZWkVz3nZ3kqqj9twTvObCIaUStNRBhsyvaCuQSDQJxlg0d3WR46dbMKcriyOasq+ZpYQc0NbQMgXF4F970YALu3udFrzNPVqopPc6hbWasQpH61Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RJSalKceLaiqmm9kVfC+nw7lO8PCaF+4fKwp08Acf4=;
 b=KwmijWF+jI2+eQgAR2VKOI5aDnTa6NYShEXG1L+M19yia87c1p0eTV4sjra895/TqTtXU1TnZs6z8bRG0sbSdNPC9ecu6CgeC0EKbQUW1pP/NXthBDtjudoIJ0wwF+NV7gFKN0IrR8gB8JMnnaH7fi+MeeNye92c4EKjZfvIaNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4762dc23-cf30-43b0-ae19-fceabea5d8c3@citrix.com>
Date: Wed, 21 Jan 2026 11:52:34 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/amd: Exclude K8 RevD and earlier from levelling
To: Jan Beulich <jbeulich@suse.com>
References: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
 <20251202105710.1472927-3-andrew.cooper3@citrix.com>
 <7d019929-24df-4523-9817-6c17017c2320@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7d019929-24df-4523-9817-6c17017c2320@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0378.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::30) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f9eb51-342d-4ccf-d949-08de58e392bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjNOZUVOOFRwRFVmK1dZSmhwWGVOMGRRZURWYkFRV1JPcWlUK3htSUx4WFMr?=
 =?utf-8?B?djlPd0NhSU1Ic3dFZDlHSlBtVlVnT2NuOGx0QjRLZXFxL01zeHZjQUNET0FY?=
 =?utf-8?B?YUo3Z2hrS0w4a2Iveko1U2JFclJGQkpIdytoN3drYXZlV0NkUUdFVHI2Z2Mr?=
 =?utf-8?B?Vm1kZVV1cE1jSnZBakl3aEp2L2ZwczlkNXZ6V2x2VHEwa3UrengzZEpvVXFo?=
 =?utf-8?B?YUwxSWJQVGtFVUJUNGRvU2FLdVFDUU1DbE1rMXpqOGgxK054bVl4enp2ZEE1?=
 =?utf-8?B?K0oyU2NvUWxJanZoazVJQk9XOWR3UXdvQ0JYVnMrT3RIalRlaHFXMFBySU5F?=
 =?utf-8?B?L1BvWFQwUFkwQ25sQWpkUklUaEY1dXMvMFkrV3dpa1hwZDl4M3dvS3RKZnM1?=
 =?utf-8?B?VGc4dElqSDVNTjY2aEdxNmt6anZSdjRmRlZkc005czJOODRKdURqUXFuNUNH?=
 =?utf-8?B?MGlzR0dGN2FMdzRhUEJ6NGdOQWNlbmVKMG9CaUF1UGZrSmRVdmFkT0g5M21I?=
 =?utf-8?B?VC9oV1ZkbjNQVlF6ci9tSENVUVVFZ24rMlRWUjZXNEwrWGZsdXJOYVRYM1NV?=
 =?utf-8?B?Y0dVVHFFU0pjQ3Z5dHB5TzFpVEN5TG8zMCtCYWpKcG1RbXRqMEZrK0dIZ1N5?=
 =?utf-8?B?dE9KbGlPaE9wOStMbEJZeFlvRGZkTnBKSXMreHpyT3Raa0I3WWp0dSs1aU9U?=
 =?utf-8?B?dS9CMmIwY1BTc2VndGZKNHIrZm9jemlBREJ5NXF0Z24vdkp0UStRclkxZXhz?=
 =?utf-8?B?eVJVSTZEb1UzV3EyLzJYVDFveUR2Y1VUakp1cWVqQ2hodDd3ZzZEUjUvcmZW?=
 =?utf-8?B?dVN2Y3FBbmpoQVFQMm43ZlZCT2w3b3VLMUJ4SDhUejFUMEx3KzVLRG1MZVVH?=
 =?utf-8?B?aXB3Wm1kU0xRK2pIMWdwaGpWcWZGQmpncTFzaUVSN0RpWWx4S1Rva0FUUk9n?=
 =?utf-8?B?UmVvajJyYWhIdmRLQXBEbzA3TFYvWnl0RzhYU2FSMGlXaUNqNXE5YWtjeFcz?=
 =?utf-8?B?TCtDR0ZxdnhQQVpXaXc5NUF3MUpmZ3JNcHdKdFVDUlpMZU15d2tDSHltVGE0?=
 =?utf-8?B?cWtEWW0vWklpQWdNby81Nm1GSkgvdkMzeUNDVE9rd2lDNjlsMVA0V24xRjZS?=
 =?utf-8?B?Y0ljbTlKSStEcG5BNHNYWXI0K3Z5ZXMyOVo0R1dxSnc1bnJhWUFySG0vbmNx?=
 =?utf-8?B?blQ2WkNMeHV6UEV0eU15d2VVMDcyenRBVVdTK01lNDVFSk1RbWNjM2RMWmlk?=
 =?utf-8?B?K1ZSWitjL0I3eXpyMXFKY25vTVBjNi9lZzF5ZlQvcmRpak5ReTluSVg2U0g3?=
 =?utf-8?B?SXBoVWg1aEdSNnMzMStPYmRza2J1N2RSRkd6a3NlQkJlcHlzRCsvUlV6TkQ3?=
 =?utf-8?B?cmdONjVTWXRUcE8rL05QQ2MxMm9iK3ZTYWZBL25zTW80eGtQVWpOV0tqMWV1?=
 =?utf-8?B?THFrMnE4Q0ZYTG1RWTU2ZTQvTHV3RVArUDBqcjlKU1RQMFkwNmF1cmJmcWVP?=
 =?utf-8?B?eG9VdkNmdmROTkd5RCtyNGNmVWxYdnJWcUhjZDdqZjBsS0RwS0J6Q1Q5c3ph?=
 =?utf-8?B?ZkRvc1VPb3BMV0ZkWFplNHN0R2FpcTBtMExqWGtyNlExRndHSlA5dXhtYVlZ?=
 =?utf-8?B?QUpTWlpLM2ZuejhLSjRFVmlIeHVvaitOYkJHWk5pNENSOVF2NXphdDNaWHZn?=
 =?utf-8?B?OHVyN0p6WWtiMVZvZDBaamFMdkI0RDRIdzJGcEVTeWxTZHIzM2dHcERwZnMy?=
 =?utf-8?B?c0djOVBkNVB5dXpGcDlERHpXVVFsM3lyUSttT2VZNngzejVJZUVMMVZ6MHo0?=
 =?utf-8?B?amJLanQ4K2djblBwejNORHBNbGRGSCszc0s3dk5IM3FMNTVHaGM0TzJIUlAy?=
 =?utf-8?B?Wk9sUlpwVENHMEtFVGlaZzRQOEFjYkFqZGpyTmMyWjR6NnA3MTI1TkVmM2Jw?=
 =?utf-8?B?NDlEK1pBNERFYXhCcmkrRC9aSldXWDhJRHZKMXBqTTgwdDExbVhKbVN4ZDRT?=
 =?utf-8?B?Rlk1V0lKOEhDSzMwZkVkZHVVVjJPSHVCbG84eU1PbjZaSmxtbmNRTzAwNnJm?=
 =?utf-8?B?UXdDWnVFL1pMNytvM051dmtCaExmNkpOTnA3bFpISVB0M3JqTXpPVFBRR1d2?=
 =?utf-8?Q?aies=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnhlQThFUXpidDVyb0QxNUdxbnhTNXVEZ0dGRTZaM0kxb3J4elJPcll1eEZy?=
 =?utf-8?B?Z1psZFNxcHhSVUtRUURjU3I5dWFrZFgrYStWT3dZVVlKcmp2b3BjaUVMUWIz?=
 =?utf-8?B?VWU2cHV2SDVwM2JhZVcreG9mV3EyR3JsUStTNkpMNTlUM3JlNlBLM0pnWHpj?=
 =?utf-8?B?QXhDcElHaWJ5TGs1MUtUNUYraXFyREdGbUxaNGtQL1ozVVh4VXEyYnhGU3NU?=
 =?utf-8?B?RmdVTlZ6cU5DY1dhOXJKcDVxRGUrck5qcGgzWjJ0NWRzYkZXL0o4UmY3d0JL?=
 =?utf-8?B?TUNRYWpxTThRL1lvaUl1aGliZWUzVTFVd0ZZQzBvcWxTYW8yZ0taNExMZjZS?=
 =?utf-8?B?cTZMSHdQMjZFcW1NOUZ1WFJZS3lnUHFjblBYSTJZRFB6OTYxL1FqM2tYb0F3?=
 =?utf-8?B?UkN4dXh4WkswS3ltZlJsM1RJWHMyb3JZWExZWVpvNWY4RnV2QnRSTk4rdHo3?=
 =?utf-8?B?bkZzdzIrWEo2bDRMZE95OTg3Q252ZnhuQ2Nrd21nZlZKNTNKZ2hTSWY0NElj?=
 =?utf-8?B?YkF3U3VLZFFWcDFmeDF4RTMyOHZMNHVpOGd6WWtWOWp3NWgzWDBpT1RMM3E4?=
 =?utf-8?B?WXRDeWRKSi9QVS9EMjBrMzdTekJndnhwckE3UW13b1pMN29iQjA2Sm5ZdURh?=
 =?utf-8?B?Zk41dERCUUdIVGdhN2ROd1hJVXp2TVRrWkVwZVY1ZGFGUi9mZXlBZlE1eTQx?=
 =?utf-8?B?aWM0V3hmb01haTAzeUQ0c1diUVhMQW5VeHdVMjVtQmRaa0tNNkxKUllvTlgx?=
 =?utf-8?B?eDZMdmtkR3M0NGg4ekVSdVBBNGM3OWpqVENTM1JoZ014aDhKQnhYZENFd3V3?=
 =?utf-8?B?MmFPRHFCU3hZWmhaSVBCZFVYRjQzWWhxckcrenIyQm55QVY0TG9UeUJRcDJM?=
 =?utf-8?B?RkxNRW9reFBta0VIOHhMQitRSnpCUkdCWVhIcEFUU3BNQ21PbStndWxZYVc5?=
 =?utf-8?B?OVN1RktVZi9KUFNQYllJQUpTWnZzeWhsbk1pYk90ZWdYekFUbHI3cXNFNDZS?=
 =?utf-8?B?NWVXSTdiUVJtQ1dWWUpMU1BubU41ZFExSXBsdkNJMkZwcElOSGJ5eHQ4eFdX?=
 =?utf-8?B?MFJ5b1p0VzJvcG1lQnd1czJCODZyQUkzaithblJRYkxwdGxONFd2RVgwWERY?=
 =?utf-8?B?blRycTVSakNkaTdqYkNDUTQ4NmtveGhnYXZlOFFkYm5WeDdMYUs0aFljdTFX?=
 =?utf-8?B?WkZQUFVpZzVydG5WWDVsKzc4Q1RaOVB4bWZwM2E2YVVPdDVRVDVGRjFkR0x2?=
 =?utf-8?B?RnZFZFpLemEvcXIzaXVVZTczRHZqTkZCbzIxcDh0MFpISkMxbzdnbWlabGV5?=
 =?utf-8?B?cUJ3Kzd5STNYSTJzeWMrYlBiVjlnSWhzRGdRdE1sNXJZdGh2OFc2RnNCclQ3?=
 =?utf-8?B?aWdVMVdZV2Zhd2YyMWh5RitTN0x6eU9CdTBma25lRm1XOFk5bC9oNDJKZklw?=
 =?utf-8?B?dmVKUzFGWDZNRjJHZ012SnM1MThoZGFxb2pHemZRTlQreENqcmEwVTltUTUz?=
 =?utf-8?B?T0QvYlluMGRqMjRDUmMvdk5admdzR1hMMFhHYXdwRlA1c0VVa3RURVVsOVdW?=
 =?utf-8?B?ZmZ0dWwxWStFUzgzUi9tcDJ1TmJUOGI5T3dLNVhvaGg1NzZEQnRFaldncUFx?=
 =?utf-8?B?TmwxRzVWTFQ5ZzU4M0cvL01nQXVpT1RRUThMWjJ3SjZLNzZTMVpVU3BMZURu?=
 =?utf-8?B?VWhZbDJmR0daZXFza0FIalVUV2E3UFhhQUNEQTVMcVZpUW9nWjdWZ292blli?=
 =?utf-8?B?MlVCTkFQbHovWjFFU1NXMjIxdzRmclhkZi91a1lkUWQ0ZEpndjBIcHN6YWwy?=
 =?utf-8?B?dkl5UWJCZ1BESVBVQWdRZ3cvaDRnUURKKy9UcjJIU1VGbnlEc2drc1hMbDlo?=
 =?utf-8?B?ZjV1VWRpMitGcnYrNzBDNndrcHJRbGY3STFCOXczQU4xT295UXk0d0pzaTY2?=
 =?utf-8?B?OWswaDM4dWVWazRxZXprdHNIckZZdTkxenE4YW0wV3hXcGNHZHA3SnpMV2lR?=
 =?utf-8?B?dmpEaHJQOEt5TGk1aHdvdVFPQ1cwUHl6WG4zWXlsNlhPeTByWlNiSGlhVFFW?=
 =?utf-8?B?UkNnczZCQ3A5UllVT3QxRlZvUjRPa0pzUnRRUkV1VG10ditwRXVRdW5wMkFI?=
 =?utf-8?B?ZnVvSnhTVmttUWUzcjNncS9ZNytTaUJlU3hoUnowQUw0Q1c3dzNPRG83QmNN?=
 =?utf-8?B?NThqVzlPbHFhRU5hTjM2aWFCTWxYQWJ1Q09hZlU3ZSs1T1d2cUhaZWw5dEVZ?=
 =?utf-8?B?S1ozS2tsdjdkY2ovRnFBZHFHNStJZndVYzhqNkpBWTRQQ21COHdTZ2tuWCsz?=
 =?utf-8?B?T0U5d05yWUpHSnlqYjlRaEFMeXk2NDE3VTdkZ0JXaXB1Y09iWE5EaVRoMWZt?=
 =?utf-8?Q?62eM3I/W51EHu+rk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f9eb51-342d-4ccf-d949-08de58e392bf
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 11:52:37.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXZTuEWQOfVK0Yvf07nVI+O53CusYKpDFGvSslqIm4LPxacSLqcMeJhO2j8Vn46ihcOkWZdYCVbm89SViSX/RoFugGmrhjmfvfba5XEG5P8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5536
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 10DC5564DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/12/2025 9:25 am, Jan Beulich wrote:
> On 02.12.2025 11:57, Andrew Cooper wrote:
>> Between RevD and RevE silicon, the feature MSRs moved location.  This property
>> is highlighted by the suggested workaround for Erratum #110 which gives the
>> two different MSRs for the extended feature leaf.
>>
>> The other feature MSRs are not given and while they're easy enough to figure
>> out I don't have any K8's to test the result with.
> I can see where you're coming from, but shouldn't we then first document those
> extremely old models as unsupported in SUPPORT.md?

Not especially, no.

There are Intel CPUs with no levelling capabilities at all, that have no
(non)support statement.  The levelling on most AMD CPUs is incomplete too.

PV Guest Kernels are required to use FEP to get the Xen-approved
version; it's only userspace which ends up adversely affected.

~Andrew

