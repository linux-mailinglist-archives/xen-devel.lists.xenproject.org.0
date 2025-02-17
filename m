Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101D6A388A0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:03:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890587.1299733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3ZK-0007el-2A; Mon, 17 Feb 2025 16:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890587.1299733; Mon, 17 Feb 2025 16:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3ZJ-0007bd-Ve; Mon, 17 Feb 2025 16:02:01 +0000
Received: by outflank-mailman (input) for mailman id 890587;
 Mon, 17 Feb 2025 16:02:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBk9=VI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tk3ZI-0007bX-OE
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:02:00 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20621.outbound.protection.outlook.com
 [2a01:111:f403:2406::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82b58186-ed48-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 17:01:57 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 16:01:51 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8445.015; Mon, 17 Feb 2025
 16:01:51 +0000
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
X-Inumbo-ID: 82b58186-ed48-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlnxTiGRkB2t58bVVI+FMSWGtXrpQ4e3rWHlmCzCR8PSJ19Kahxgr+hBwQrBPoDr9cFgr4pd6tlzLCTlfsQeDsjkMRwwBQkWCimJBPqOeooQM8CBmxE736UK7J4MUkThBhKDux7lbgHe/CszZJHO5S2jp8srIeBvrn3QFI9v8C27dcCHv1lGwMe43kivbbZCQ/IutJgXhWkv8X/UPOv5OKO/GLZ9Wnfvzg1EqQ45V2unLGPFRxps1WnoKuKXG5mEqYdnz4qYAhaxbaRbJG5j2UrC+HO6gxgkXn1waif/nBGE4/VxVxo1fGgztxUQ8cOH0glX00XrKMuHtMTGYtC4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4F8b0B2aKFeviPSdK6bxWSXmNHptkzwOEtkI+ytPSE=;
 b=nsyz+cg+mv9gVC3eFLY3EHS1sUSkFMcxWp9ND5hzN9rlWwbqREKsdAeXvA0EnyZe+8lrlvU0+9c9I0hMb6vxPCygahLkFH5BoYK8u6COTBQlyO46kgLJeDqYzNtgQdG0E01zMMxequbN1CKsCjLx591z08zFuE300nMHrEM1xEZMKfD0MTeGQP4zqqnc66phaCSWZhTymz+w7i5KtYF9X+DG92bF1jKPT9ddOo5wo1gTC5rTEDsyl9n5fzXB+rL6khmiUF0BhBlR1wLiHqORI1hZhVKQOrQrmVK3nnHsQKO0tTYn7NGV4IybzID4qMDHvzynmOctCxknVj/7ct0yrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4F8b0B2aKFeviPSdK6bxWSXmNHptkzwOEtkI+ytPSE=;
 b=l3H+xYLhHIxglozTpF8RO2g8Yq75VAyQW7dVt4pNWTjKNAOk1Fp7OGfet5vu0fk+BF/Vf+O/zLhOagQSLYTF1FslIfYsUSsR5X1ONULbFLxMxArs55AeJmBvhqeZ3MIS0s9W0v0zCC1MNWktQ6ZcLJz465fIYHreee/r6yt8lLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <228e6784-f7c5-4b39-8f10-fde3e83976de@amd.com>
Date: Mon, 17 Feb 2025 16:01:46 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
 <20250114195010.3409094-2-ayan.kumar.halder@amd.com>
 <ACD22224-C61D-40F1-8235-67F18E633019@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ACD22224-C61D-40F1-8235-67F18E633019@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0069.eurprd02.prod.outlook.com
 (2603:10a6:802:14::40) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MN2PR12MB4109:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a286fe-21ee-4f7b-91ce-08dd4f6c6442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDVEVjNUUXpGMDVPSmFpOTJVSnZHYXRoN3NQRXNwSkVUOXU2VjFMczV1bnNP?=
 =?utf-8?B?c1dHeERFb0RDaDkrMzgza1F5Zk44UEJscUZlMEpaVG94QzFDeVl3SHp6VEU5?=
 =?utf-8?B?MHI4V2pmZjhKc0xIaFFzV2o2dGhqdU5rYnlCRWU5N1MzTjAzekY2VmhUdGxn?=
 =?utf-8?B?a21UelJzczJQMVZmZEJFSk9CUXlKeUk1VGliU0N1emtJcXNEWENKYS9pSm5D?=
 =?utf-8?B?WDhCVFJ5UXk0OEtMLzRUczJFNXZBTGJLek5BVUdUeFVqQkhSWjlDZ2hhb05a?=
 =?utf-8?B?cWxWNlViSzdLdEJHTFVZbVBJQXVOam5jbVdORVRCbTlEWFQ2UFBGUFRRRFc0?=
 =?utf-8?B?STg1ejdqNTZKRlZKaGZpWEpZbWNabUlUUk8xNHlyREFEMGtwNDFMQ2s0UHZm?=
 =?utf-8?B?OVMzS0RML1JmRDFZK1ZzaTRCZkM5MGpMK3FHaFJqdTFzUmVhbmdDdFpWTUZw?=
 =?utf-8?B?eHhDMHNuc0N4cDN5ZU5PZW9SWXJwZ3REeW5Ma29NSFUzajVFVm1LVG9kVzA2?=
 =?utf-8?B?dnRLQ2F2M0VyMmRCSlBSWGdGcGkrQ0pYRlB3bDdWTkx2Ujc1ZXVWbndTYk5L?=
 =?utf-8?B?djEvM2tpUEpHSnpCamFLOHNLTjVXbHRML1VnY2tId1N0ZkZUZmZ2TG5iLzVl?=
 =?utf-8?B?VjJWRUlncVJxUmxwUkJJR2dQRFVubTlIbkhNV2Z6RXQ3WmRNRlVjelJxNTJU?=
 =?utf-8?B?Q25GWDVza2JKc2FSUlUyS2Fxd0grWnQzYmpJZTJBMWVhNER3Mk9kNm1lQUNL?=
 =?utf-8?B?TE1HczR1emRwVGtrTkNkaEdYcW9PRG1IOWxOV2xHbitNZVBXRjFkK2VnZHhJ?=
 =?utf-8?B?VDVKWld6dEVHR0lydGwrK0FGNXhLOXVLbEROaHM1SzZzNG9MU0tWUVZmUXBq?=
 =?utf-8?B?dVR4amcyQmZBa21TRnJVMWZPWXU3NGQ5U1Z2ZldKWXhDMFdqNVoraFRScHp0?=
 =?utf-8?B?M25EU0Z3czhtUWJTTEZDVUNHclRWZ3NvcXJMam4yMXJUc2NaR2ZtNUhJN0pk?=
 =?utf-8?B?Wi9HVFlkc2ZLNy9ES0dmTFM5bENOZlNNdWpYSkE4NWUzR0JnTWp1UHVyRnVR?=
 =?utf-8?B?Z0czd3kzVnlFZkZaVEFlakowMnVQOHlYTnJENkF4UVY0azV0OGRqRFZiK1dK?=
 =?utf-8?B?ZWVOOGs1R21rM3hseUdzOE04bUIxdDdUMXNWR1JTK3JKVS81UkZPcVYwYjNZ?=
 =?utf-8?B?UGhmSy9TS3VZSFprNnkyNThNa25HY2w0ejBSMytZU3Jvc1o0UitYMkpRS3FD?=
 =?utf-8?B?a29PZ2g2YmtnSWRMZld4dFo2S2o1NXVSeVhORWNnMzcvckFpV3UzT3BpazBT?=
 =?utf-8?B?Slo2UEJSeXZGOE5CMkdaenhpR05rdzRSd0VldC82aUlOOXlNYlYyUC9vdFdt?=
 =?utf-8?B?RWVteFh3ZGlnQTN2RjFybGlLbHNSeU9Wd1dmSll1Q01Ec1g5UVIwU3lTclJE?=
 =?utf-8?B?bitQbDh2ZjJQUFBkemYwS1pNRlZhd0hZT2hLUWlGMkpRYzVjSnFZMzUwcXcz?=
 =?utf-8?B?a1pZcTAvejM2RUdpR21FSVEyT0dPaVozU3hXL2Z6SWlJWVlqODIycGgyQ3Vr?=
 =?utf-8?B?cGluWjNHVE5uaFhZY3MxZkN2TTRwbnBqZWZPN0k5S0xRTzQ0dFl3KzJUREdh?=
 =?utf-8?B?WEdBaWhycHNvbnJPT3FjUTgzZG95WldMNFMxdGN4VGxneWJxL3FGVW9WOWVp?=
 =?utf-8?B?OSt6MmZ5ZmVXRktKZW5ZVnJUNWRuQitPRWFhRVduMG5TREY1eS9VQ0tmWEEv?=
 =?utf-8?B?Y1c5ekVETGhQcy83aHJEVmxFK09PcDV1SFdwTzA2R3pGd0VGb0ZOZXFDdDdp?=
 =?utf-8?B?NXNsaWRtTlJjVXRGRHZ6MkcvclBRS3pIaGNKNndVYTVxSkJoT2VMUytxbG1V?=
 =?utf-8?Q?5ggeKns1dQZXm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEFlbTRLZytmdmxyZVM1R2doWEpHNzF4UGU5UE5KNysyY042cEliMVl1L2dr?=
 =?utf-8?B?a2NOR0JvY002aFdrY0l2ZVBoTG9jeTBuc3Y3Wi8yTlRYczRqdWI0eTI1ekpy?=
 =?utf-8?B?RzF0WHdMOHI1N0plR0pmdVh2ZGczNytJTFN2VU9LeVcrU1VwaDlGOEVUMVlr?=
 =?utf-8?B?SVdRMTgvUmd1UElrdTdoM3VQZFdpTWZsWnpFM0V2NnR1d1BpbkVMdzlRSTFV?=
 =?utf-8?B?Z3ZqTGxMR0NNOUxxbVFGdWlabDZMbllZbmVNSnhaTWs2czV6M0JacXVza0Za?=
 =?utf-8?B?ZGdOUXdNdWQ0MXI5MXFGV2lPS3hJREVrdm9YM1BZU2tIb0pYTXdBQ2xtbEZu?=
 =?utf-8?B?SWNJYWoxUkFWb0d4cXd6N2tnTjNWTzZhd2t3dGx3OXIyclpjWG9RQnBwWmVo?=
 =?utf-8?B?U2ZBUW1nRi9uMEJZZXVYS2gxaDNNY0FKU1o2WXZxTHJFN21IZEd3bXNHYTdm?=
 =?utf-8?B?c1FRVHdXLzdTYTZPRXFpZ1hXNVhtaHYvTUErZXhIV0RpUU5Sd2krd0YxdnNn?=
 =?utf-8?B?OW9uSGRTcTQvWXNiY2xNOHZUb0lvUHcxZjlxSzlhdTZiaFpucm1jbW03WHJB?=
 =?utf-8?B?eEhhZzFMMjFhdGU4Nm1lSXYwbTN2eE5oNTJHNGphaXBwMDBENnk3MUMyZUdH?=
 =?utf-8?B?b1pxMnNHd2xsc3pXR2Fwb0liN09HMW1NR0lwRkhkZ2JuT1krSzUwZ1pqWHFO?=
 =?utf-8?B?Ni9YcEFIMnZ2L1RQMWtaTGYzZG00NHRCSnJ2NmxtK2V6NzRUY0s1Q0Q5ZWVv?=
 =?utf-8?B?ZmVicXRuZDJCRWpVMnRpYVdFMWIyZ0FqcU00dUJnOGZ6WkxHUisrNDcvK3dP?=
 =?utf-8?B?VFpZd1AzS3JlRkVEam5OVnBMb3ZJYXFlL1BtbkhUZDJyOWRnTk1URUNqNWFM?=
 =?utf-8?B?OG9ORVVINWRla2xQeEY3aTBXRGJHMm8rcnhqdHRicUhFb1NIckpLdUpabEwz?=
 =?utf-8?B?Vk1vRU95ekdJTjdOTjJ4eUFUVkhKL1pUQllkSDZ2Q28rUHo0aHpEQW5pcHp4?=
 =?utf-8?B?VmJpRldTMzhEQXBEeFJGWmJzb1p4cUROZjJTN1BBazJPZE0rb242cm8yVm5v?=
 =?utf-8?B?ZGozSHdZZFl1dGFlOHhvNHJmSk5KaWFreUhQK2xPMThiZnl0WmUrSnlobzFO?=
 =?utf-8?B?SDRMTGtJcVVPekgwNHg0WWlEMUtJTkNCZ0J5N0ZuWHcrMTRpUDN6OXRwTnpR?=
 =?utf-8?B?MnZQSVA1dzdGNG45SkwzV0gwV3p4WHQ1c21OTE80aGNPWEJuakZodDdiUWZt?=
 =?utf-8?B?Y1c2MmphaGQwVE93ZXV2NGVXdld2a2EvSFc2YlJvSG8wRkZvckg1QWNjdFRl?=
 =?utf-8?B?T28zSWxobjE2SGlmSXVrVUZsNlVRMjIyVXZhQ0ZkKzU3ZVUvRVVNWnFBTFFz?=
 =?utf-8?B?Zkh5Wk83NnJvUWN6Q3FIQjBVWDBoZlI0WVkvSGV1RXZ6UHZMdU0vZ1A0djFv?=
 =?utf-8?B?K2ZYcHVBL3BwOTk0U2w5MHE2bDVpZWR5Z3FwR0lDTytyaTBjWXo2SVZQaCs1?=
 =?utf-8?B?REgySGlDVENLeVpaazhUNlQxb2w5WDNHR0o3cWVxTlVqMlBKSHI3VGpvdXBY?=
 =?utf-8?B?TGJHYU1VTU02aDY2ZDZncFZoT3FaY0pxZkJoV2p4aEhFMDRPYXl0bFA4Yy9F?=
 =?utf-8?B?RThwSHZwUXNFL0tCbjVRVWR1VnhSRzAyVUd6TFpTWDRaTHRRRS80cWpsQWtH?=
 =?utf-8?B?M1N6ZWJzMTg4TTkzZ0tENjVHaUo5ZE9LYnNpeU5sZ1lyanNWOEVob2hLMnlR?=
 =?utf-8?B?MCtMMDloR2twOWo2WGpVMEV6MzA4UXRsWDN6Q1laaUR6MzFQK2VVbXBLMnVB?=
 =?utf-8?B?N3lTWXFxd2dtcktlWVJqV3JoaUNMOTQ4cWRYUVFiU3ZBcFloQmZXSHZYOXQv?=
 =?utf-8?B?aWdmL3ZmU0w0V0MrblRhQW92bHY4anNqazRDU0pZUHBINTBnWDJ6MXJ2K1Ev?=
 =?utf-8?B?aFQ0c2JTcG5PaGZORlRUZkluUC9kMTJaV3BobHdOWWUvNDBhVG5qRTNhTEdC?=
 =?utf-8?B?WmNmTzI5RC9JV2dKd0JJMXNGdzBMakVkbWljcFBISXI1MlV1M2hka1R1djVh?=
 =?utf-8?B?bXlRd3U5eTVBSmQ0WWZiY01aWStIN05zVTg5alViVmlvYXhoTFlsMzV4N3ZW?=
 =?utf-8?Q?i0gMl/hz5ReubBqfeZGEMappy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a286fe-21ee-4f7b-91ce-08dd4f6c6442
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 16:01:51.6713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkQv45ttT0eDn9XHRsm6Tf8Z/hKhuHOF7jFeQiSttEFPoja3uhmTUImDz4/io+Q1Hsl5bby64zZyEa4KdR9hzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109


On 29/01/2025 08:33, Bertrand Marquis wrote:
> Hi Ayan,

Hi Bertrand,

Apologies for the delay in response. I am working on v2 , but need some 
clarifications.

>
>> On 14 Jan 2025, at 20:50, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> We have written the requirements for some of the commands of the XEN_VERSION
>> hypercall.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> .../design-reqs/arm64/version_hypercall.rst   | 33 ++++++++
>> .../reqs/design-reqs/version_hypercall.rst    | 65 +++++++++++++++
>> docs/fusa/reqs/index.rst                      |  2 +
>> .../reqs/product-reqs/version_hypercall.rst   | 82 +++++++++++++++++++
>> 4 files changed, 182 insertions(+)
>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
>> create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst
>>
>> diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
>> new file mode 100644
>> index 0000000000..1dad2b84c2
>> --- /dev/null
>> +++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
>> @@ -0,0 +1,33 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Capabilities
>> +------------
>> +
>> +`XenSwdgn~arm64_capabilities~1`
>> +
>> +Description:
>> +Xen shall have a internal constant string storing "xen-3.0-aarch64".
> I would rather not have a requirement that will need changing every time.
> Could we turn this into a description and link this to where we store the version ?

I tried the follow the discussion between Julien and you. We do not get 
the version from the Makefile ie 3.0 is hardcoded.

So, does the following look ok

Xen shall have an internal constant string to denote that the cpu is 
running
in arm64 mode.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_capabilities_cmd~1`
>> +
>> +Capabilities AArch32
>> +--------------------
>> +
>> +`XenSwdgn~arm64_capabilities_aarch32~1`
>> +
>> +Description:
>> +Xen shall have a internal constant string storing "xen-3.0-armv7l" when it
>> +detects that the cpu is running in AArch32 mode.
>> +
> Same here and also you have a "when" here and not in previous one.
Xen shall have a internal constant string to denote that the cpu is 
running in
arm32 mode.
>
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_capabilities_cmd~1`
>> +
>> diff --git a/docs/fusa/reqs/design-reqs/version_hypercall.rst b/docs/fusa/reqs/design-reqs/version_hypercall.rst
>> new file mode 100644
>> index 0000000000..8bb7a66576
>> --- /dev/null
>> +++ b/docs/fusa/reqs/design-reqs/version_hypercall.rst
>> @@ -0,0 +1,65 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Version
>> +-------
>> +
>> +`XenSwdgn~version~1`
>> +
>> +Description:
>> +Xen shall have a internal constant storing the version number coming from the
>> +Makefile.
> If you go this far i think you should give the name of the constant.
Xen shall have a internal constant (XEN_VERSION) the version number 
coming from
the Makefile.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_version_cmd~1`
>> +
>> +Subversion
>> +----------
>> +
>> +`XenSwdgn~subversion~1`
>> +
>> +Description:
>> +Xen shall have a internal constant storing the sub version number coming from
>> +the Makefile.
> Same here, please name it.
Xen shall have a internal constant (XEN_SUBVERSION) storing the sub version
number coming from the Makefile.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_version_cmd~1`
>> +
>> +Extraversion
>> +------------
>> +
>> +`XenSwdgn~extraversion~1`
>> +
>> +Description:
>> +Xen shall have a internal constant string storing the extraversion coming from
>> +the build environment.
> Same here.
Xen shall have a internal constant (XEN_EXTRAVERSION) storing the 
extraversion
coming from the build environment.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_extraversion_cmd~1`
>> +
>> +Changeset
>> +---------
>> +
>> +`XenSwdgn~changeset~1`
>> +
>> +Description:
>> +Xen shall have a internal constant string storing the date, time and git hash
>> +of the last change made to Xen's codebase.
> Same here.
> Also i would use the comment here and in previous reqs to give an example.
Xen shall have a internal constant string (XEN_CHANGESET) storing the date,
time and git hash of the last change made to Xen's codebase.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~version_hyp_changeset_cmd~1`
>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>> index d8683edce7..b85af19d19 100644
>> --- a/docs/fusa/reqs/index.rst
>> +++ b/docs/fusa/reqs/index.rst
>> @@ -14,3 +14,5 @@ Requirements documentation
>>     design-reqs/arm64/generic-timer
>>     design-reqs/arm64/sbsa-uart
>>     design-reqs/arm64/hypercall
>> +   design-reqs/arm64/version_hypercall
>> +   design-reqs/version_hypercall
>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> index fdb8da04e1..10bc7b6e87 100644
>> --- a/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>> @@ -59,3 +59,85 @@ Covers:
>> Needs:
>>   - XenSwdgn
>>
>> +Version command
>> +---------------
>> +
>> +`XenProd~version_hyp_version_cmd~1`
>> +
>> +Description:
>> +Xen shall provide a command (num 0) for  hypercall (num 17) to retrieve Xen's
>> +version in the domain's x0 register.
> Somehow you will need a req saying that how and hypercall is specified in general
> and then one req per hypercall:

We have a market requirement, if this looks fine

Xen shall provide an interface for the domains to retrieve Xen's 
version, type
and compilation information.

> Xen hypercall number 0  shall return the Xen version in register 0.
> I would also prevent saying x0 which would make this aarch64 specific.
Xen shall provide a command (num 0) for hypercall (num 17) to retrieve Xen's
version in the domain's register 0.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Xen version is composed of major and minor number.
> Can't we link to the requirement defining where the version is stored ?

Yes, this is linked to the design requirement

`XenSwdgn~version~1` and `XenSwdgn~subversion~1`
- Ayan

>
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Extraversion command
>> +--------------------
>> +
>> +`XenProd~version_hyp_extraversion_cmd~1`
>> +
>> +Description:
>> +Xen shall provide a command (num 1) for hypercall (num 17) to copy its
>> +extraversion in the domain's buffer.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Xen's extra version consists of a string passed with 'XEN_VENDORVERSION' command
>> +line parameter while building Xen.
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Capabilities command
>> +--------------------
>> +
>> +`XenProd~version_hyp_capabilities_cmd~1`
>> +
>> +Description:
>> +Xen shall provide a command (num 3) for hypercall (num 17) to copy its
>> +capabilities to the domain's buffer.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Capabilities related information is represented by char[1024].
>> +For Arm64, the capabilities should contain "xen-3.0-aarch64" string.
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Changeset command
>> +-----------------
>> +
>> +`XenProd~version_hyp_changeset_cmd~1`
>> +
>> +Description:
>> +Xen shall provide a command (num 4) for hypercall (num 17) to copy changeset
>> +to the domain's buffer.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Changeset is string denoting the date, time and git hash of the last change
>> +made to Xen's codebase.
>> +
>> +Covers:
>> + - `XenMkt~version_hypercall~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> -- 
>> 2.25.1
>>
> Cheers
> Bertrand
>
>

