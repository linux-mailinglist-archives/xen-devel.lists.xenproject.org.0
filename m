Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBABB3D3F1
	for <lists+xen-devel@lfdr.de>; Sun, 31 Aug 2025 16:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1103822.1455191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usjPb-0002sh-TH; Sun, 31 Aug 2025 14:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1103822.1455191; Sun, 31 Aug 2025 14:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usjPb-0002pi-Q9; Sun, 31 Aug 2025 14:52:07 +0000
Received: by outflank-mailman (input) for mailman id 1103822;
 Sun, 31 Aug 2025 14:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8wL=3L=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1usjPb-0002pc-7i
 for xen-devel@lists.xenproject.org; Sun, 31 Aug 2025 14:52:07 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2416::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d616fb9-867a-11f0-8adc-4578a1afcccb;
 Sun, 31 Aug 2025 16:52:03 +0200 (CEST)
Received: from BY5PR17CA0007.namprd17.prod.outlook.com (2603:10b6:a03:1b8::20)
 by BY5PR12MB4273.namprd12.prod.outlook.com (2603:10b6:a03:212::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Sun, 31 Aug
 2025 14:51:59 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::6a) by BY5PR17CA0007.outlook.office365.com
 (2603:10b6:a03:1b8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Sun,
 31 Aug 2025 14:51:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Sun, 31 Aug 2025 14:51:58 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 31 Aug
 2025 09:51:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Sun, 31 Aug
 2025 07:51:57 -0700
Received: from [172.17.238.12] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 31 Aug 2025 09:51:56 -0500
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
X-Inumbo-ID: 0d616fb9-867a-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r67MPouCFqACB2mGX7qHyAJWgpemF26rfMHg2IY4I5ngBgIYfDDGdF7omwUPN3m8QknheAAIShE4u6v1pxyQbuaS4Dc8pV14j9ZBIDzItENawKdugFnYAQr6XH6qLcWgHGKsQpjCJHM4E5ew5C9EpTIEEWSWbMGEpgOAraF786VlCov/YAFeyRWt6cLBD+vn5A4eMtYcZdFHrogPNi3F8/B+mPP5nFMM+/cU9/b5SxqIBJP4kdeZU1uwSiJsm7etMEL4LTZiGRKXWrdEXx/EHPaLyGJaiNKNz8AV8PyWQu2C/HTl1ofmpRNKvmwJxCi5HJQIieqyNYHNZtK9Y1CjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bcot+OGzhe/4MxCl8iHfzF46vlYzg6Lns7JEnquZrA=;
 b=p8lgc0PzhuQof+G2qzOtBu0UvroQ3nuyzubLtVapdX54tYkOzSk8RL3nI4M6gjzNNQ21IUpTbfOpuGTvyRhDhr0a0ok1ammWqZv+/f/P6wYy5CCWh6GV7geEPYtoi7TktyXaTrO3NB0lpf/eDBIjM+dyTiPV4CeGCz9tFnBg/PsxXdqY0Y6HQn3KRT1L2HMcFRmOicr4Qec4ooXuCZjEpMSCvN04qbwDZLWrptFyYkhkbgRWxI6MTZwp6EEY9+QY0S1Jc5N3jrSMcoCZut2oKBfnJFUuIdKiCzJjxKWo/hO00189cu8VZe5kO349gdRFjoxXtQ6TfK7BWZ+qYu1luQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bcot+OGzhe/4MxCl8iHfzF46vlYzg6Lns7JEnquZrA=;
 b=iC1wWsXFPwDKq/8VujoPdxBqiTURGx40+gTQajtgmX9HfTh0VUKDcumZ2CcrQgv7mJ1ZBNs+Np/rAtDzJ6wBu0ZCGMLHP2oUJdM8WX54XAex4p7G1duyODero1ezXfkxjdmE+emkmO+h1zxXd/qe0sMAdF6OtXynHO3soj6zGvU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <16e4818f-685c-4c5c-81a8-2dbac86ba0e2@amd.com>
Date: Sun, 31 Aug 2025 10:51:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 06/11] libxl: convert libxl__json_object_to_yajl_gen
 to libxl__json_object_to_libjsonc_object
To: Anthony PERARD <anthony@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-7-anthony@xenproject.org>
 <10a60455-a4d2-4c58-8a80-d8b264d27efd@amd.com> <aLGxc2d5rZspn9wj@l14>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <aLGxc2d5rZspn9wj@l14>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|BY5PR12MB4273:EE_
X-MS-Office365-Filtering-Correlation-Id: edf615f1-2336-44d1-4669-08dde89defa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVM5VjY4OVFMMnBpUUR3ZVBxR3c1UkhPeTBUS2FEekEreEFhc08zUXdjT2w4?=
 =?utf-8?B?b01DSGVZWGx1eTVja2toQnBMWlZic2w4b2dBVjk0QWFLQUUyZ2hUbmErRjg5?=
 =?utf-8?B?QWJlbjVzK283Nm5VREFDZzkzNmhiUWdLazdBQ3cxL0FSWmhENFpFZFU3bVBD?=
 =?utf-8?B?RXFFTUttZ2o5QVB6Y1pvOHlrMWJZWXR6OURSaTkrZENFaTA0eU5CMHFRa0Y5?=
 =?utf-8?B?RVkvdjJFdE0rY1YzREdzQWpRV0IyNWRlNXNZUGlNS1JXOFdMR0FPcnJYWXhT?=
 =?utf-8?B?ejFEYzZzdXlGeWozaSsybnAvZEtRcTl4cExDb2hGUm1FbHR6dUtpTzN1VDRI?=
 =?utf-8?B?enlZNW82Zmt5NUtIM3hQS1c1OFZ2Y1hhMzA4V0thcmdqemJ1U2xDZ0tRZUpv?=
 =?utf-8?B?SkxZSmNRTDFjRlgxZmNLMW5RWDhoWk0wYWhyN1lUUVNQVktMeWh6Z2FpMTRo?=
 =?utf-8?B?czd3V2orek9hMFRvSmZZOG53a21qL0Zia1RGcmJrNXFOT0diQmhYNmxkMzIz?=
 =?utf-8?B?M2s3bmdrZndjTG5ybUZLbkVXbXVESEtYbE9nUENRQ2VRV0VmZzZrTSt2ZFNh?=
 =?utf-8?B?dGhiMU5vbmFaV0drQ25nT3h0Z0RpNzV6UGRlTnFxU0dyb2dTTVJrMzM0Y2ZB?=
 =?utf-8?B?UXRlMExqL25RVjg1ZWdudXNadE0vMFpBSXR2VHQ0V2R0Nnd3R3hiMHBiNkRO?=
 =?utf-8?B?ZERhT21ReUlrTks0dXA4UFMwU0NIMlJ6TDA3QktkNEhGbCtxR216d2MxK1JQ?=
 =?utf-8?B?bmpGMzlsek9lamVHYnN5VmFaZE5teExkeXZ0SUIySktqSWZTbmdVQStOWlhF?=
 =?utf-8?B?ekxVdGNXSVoyeUhKT2ErK0ZhSGZ0NGRONlN1UW1hM3pXOUlEU3BCOE45RUZU?=
 =?utf-8?B?bUYvS25qVXVmV0FUWThOd1ZXMVhXN0xWalR1czdkQmxHSHJMVTJxLzJnbzYx?=
 =?utf-8?B?TisrSjI1NE11dWl3SGpoNDBLa2VEVUV5Wjl3cHNqbjJXNWE3aHlxQmtINVFw?=
 =?utf-8?B?ZWlzNTIrNGthOWRhV2drMDdhL25VcS80V250U3dGSGFET3ZGZmtZRnE4RWpO?=
 =?utf-8?B?K3hmYW13UVRrRHR0WjhPNjRuL3MzTmNZanNUSVh5b3pCeVUyYjlPQnJLTmM3?=
 =?utf-8?B?OE5zeWZxUEZxRU1MZG1VNEh4UVhmU1BSSWxjcUxaLzJhQ2VXMnQ2d25DR1dB?=
 =?utf-8?B?WU5uNnBNZFpZRDVRb0kwZmxxNzZyQXNxYjM3NW9XdXpkRGtJdTBqdkJNSmdJ?=
 =?utf-8?B?RlZuUElCNElDUEc2cTF2S0haWXBLZy9jRU0yZGJ3aXg4SEdXNUtLSjZHUU5J?=
 =?utf-8?B?bFJoM0lRaE1xU1ZuMkQzWXo2VFdVSTR1NWdwWEFkeFBCcWZFRy9KUDZYbjNr?=
 =?utf-8?B?eUZPNFczaHFuQTM1Z2xJUGtuUTc1L1VsQ2Y1TlJBNUlycWhEVlo0WFFxYzRr?=
 =?utf-8?B?MnBmOTZVMGhHYW4rTXNvMVh3OGdWR1p4NTJVcFVvamJxVFRCazZaaHpQY0Qz?=
 =?utf-8?B?VTNXNWtFaEFtZ1F6bnlWdEJpSnF3ZE9UaDN4SnFrUDJWUEFISEpBdmxueVUw?=
 =?utf-8?B?aDlpVUdEc2xiMUJVekI0SzdiZ1FZR3dIUUMxZHkweUVyaytsM3ZrWC9RTVJB?=
 =?utf-8?B?WW5hM2hycHRPK21oaUlqT2szZDNDY1NXZ01ZbnJqL21zWS9uN3BJNGcxbXZr?=
 =?utf-8?B?eUNiNUV1ZVA4UTBpaDJUNzU1b1V0WmVpTGZzU0JqUUxDb1FCeFVuaFRmaHp6?=
 =?utf-8?B?ajIwZ202M2ZucURKQmpwTCt1TTVudlRrSEcrQmRGUjhXNUsvaW13QTlNUU5M?=
 =?utf-8?B?UnNEMUhOdzVwdnowN1RpUnMvU2Q3VVk5Z1o1L20veklNRmtUUXI2MTlmeW9a?=
 =?utf-8?B?aGszRHdwdURJZTVYOGlKOFFDYTZ6WXEyRnZMWllvVDhtMlJndGJOM1pnZXFV?=
 =?utf-8?B?dnRneS8rY2cyK1prQzBGWHkrdE5qNTJwN3drY3BCaXg1MmZ2TUVGeHdBVkV2?=
 =?utf-8?B?VVE5ay84bUowZUd3MUlDR2l0NHc0NWJPOEIrUnEvK2Rud20rTURSZm4vcVhI?=
 =?utf-8?Q?645Ghu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 14:51:58.2905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edf615f1-2336-44d1-4669-08dde89defa0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4273

On 2025-08-29 09:56, Anthony PERARD wrote:
> On Wed, Aug 27, 2025 at 11:37:07AM -0400, Jason Andryuk wrote:
>> On 2025-08-08 10:55, Anthony PERARD wrote:
>>> +    case JSON_NUMBER:
>>> +        *jso_out = json_object_new_string(obj->u.string);
>>
>> Is JSON_NUMBER calling json_object_new_string() correct?  It looks like the
>> yajl code falls back to a string, so that is okay but surprising.
> 
> Yeah, I think that's correct.
> :-( maybe not. Even if we have these too comments:
> 
>      In libxl_internal.h, enum libxl__json_node_type:
>          /* number is store in string, it's too big to be a long long or a double */
>          JSON_NUMBER  = (1 << 4),
> 
>      In json_callback_number():
>          /* If the conversion fail, we just store the original string. */
> 
> With yajl, we call yajl_gen_number(), which probably write 2^128 as:
> 
>      340282366920938463463374607431768211456
> 
> but this new json-c generator would write instead:
> 
>      "340282366920938463463374607431768211456"
> 
> I guess we might be able to replicate the same behavior by using
> json_object_set_serializer() or json_object_new_double_s() (which use
> the former). But I don't know if it is worth the effort. I hope we won't
> have int bigger than 64 bits.

I didn't check, but I thought uint64_t is the biggest size libxl uses.

Regards,
Jason

