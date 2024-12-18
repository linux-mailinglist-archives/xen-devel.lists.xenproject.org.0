Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD85C9F6895
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 15:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860498.1272517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNv8U-0006Wr-MN; Wed, 18 Dec 2024 14:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860498.1272517; Wed, 18 Dec 2024 14:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNv8U-0006Tq-JH; Wed, 18 Dec 2024 14:34:50 +0000
Received: by outflank-mailman (input) for mailman id 860498;
 Wed, 18 Dec 2024 14:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bs8F=TL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tNv8S-0006I2-Ug
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 14:34:48 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2416::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b89213a-bd4d-11ef-a0d7-8be0dac302b0;
 Wed, 18 Dec 2024 15:34:48 +0100 (CET)
Received: from CH2PR18CA0040.namprd18.prod.outlook.com (2603:10b6:610:55::20)
 by MN0PR12MB6030.namprd12.prod.outlook.com (2603:10b6:208:3ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 14:34:44 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::af) by CH2PR18CA0040.outlook.office365.com
 (2603:10b6:610:55::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Wed,
 18 Dec 2024 14:34:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 14:34:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 08:34:43 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 18 Dec 2024 08:34:41 -0600
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
X-Inumbo-ID: 3b89213a-bd4d-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obs4VhEfsgovlc1+4PMXQoWaZIEcS4KlxNR45vRvDyaip3Fqw161O0gAE1BqcGfq4puU+TNRpY+QJPWpxQnPNCjprey7VHtcUQ2+Dts6iUzEemEh2lkCcxSDCO1RAsQ5z4RDoBzziDojIqbzbhteRRCH20BNdC8ZIzXmzqyUuUzyk1vFv46DlpRllHAQZ/Jjs5z+VMxf+m11wq+r4TM72JQ9Yqwfmr1bfnCBguNXFWSeTqoOt0X18CNDwczN9h0ECsXMXT8u6KNVV7+OWob81cOeTrdr/K5dEx+eC6uQAiI9xNXInFfPxrwRr+NtLoDkS4oEbqqaWnaXULBzCK5Qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuiXPf3UIvijiiKu4KZpVObm0FRznRijDnzj9F5gtfw=;
 b=jojnW89FrD1+DXEG5+lYA0H+tOukfXYfNcjSZ/qBHqd+ZxCFzdCVXjpqDOnYOeGpMuea0GTQntoWLdldpDN1k1MnpA58T4P087tGZxPtvRznEOc2Y0+c96ndNfu18PsQijHFPdytUeYHZfkWSIBTdNjf8Q1uu2weXxlmefYRuhWQrtN9fvvAYBWbyR20cDylZ06+bZZTarcKVDl8d68gfXM4kJiYNrM9fw71Y1T9FHR9RirobtgVtwYT0rDQ7De3EtNmU+bXod3ytws8dd2Q4pf3VDW0pR74FdG26iyq4NE61NVZe5dzuxsARiXU8PiwBhsf8M2qy6XfLuouiOp5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuiXPf3UIvijiiKu4KZpVObm0FRznRijDnzj9F5gtfw=;
 b=vVolaHj5Vsb+8IGsla/Jn4caXBPTbjeTjWZyYalBHKTbQ8vgI7EorQ7bEWddCIgnJnxFUjYGMVSHqiLEGvfZxH/7tG8Nh9GtjhSlxCXp9jnRf5+nMwQfbz2P06cDhWXkdfsxU38FDuLXAAIpnuyPw3AxmaMW+5yqz5NLV4AmyBE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c6d329b8-d88e-4f92-84fe-733dcd72855a@amd.com>
Date: Wed, 18 Dec 2024 15:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] MAINTAINERS: Add myself as maintainer for NXP
 S32G3
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, "Andrei Cherechesu (OSS)"
	<andrei.cherechesu@oss.nxp.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"S32@nxp.com" <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-7-andrei.cherechesu@oss.nxp.com>
 <B54A5591-EBAD-4CA6-BB2E-0DC7BE4987DE@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <B54A5591-EBAD-4CA6-BB2E-0DC7BE4987DE@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|MN0PR12MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e8c438-cf08-4301-6eb6-08dd1f711d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|7416014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUJLWUZKR1BSblZ5TUF3SjB6QnVhemFaSzhwVkFod3NsV3UxS2FxdVpZcGw1?=
 =?utf-8?B?SUloOWNrNUs0ZkFCVDVPN0p1NjB1RXNveDhMZ3FIUEJRRWI0WkI5WXZYZUI5?=
 =?utf-8?B?MEw1WXdONGpJYytQUWNrM3laYTRtNHVMUWp0cit2TGx5RVkvdFo4UXFyUWJK?=
 =?utf-8?B?eGNGVEc3aThxMkVIZUNXN0ZzOHBjaVo5SjFnQ3NNQ3MvZFNCSXJPeW9xdFVB?=
 =?utf-8?B?bjRwRWFPMEtsWGZjbS9TTzdjZHZUcmFvRExHMUNUZnIrOWE1NnYwM3V4U3pS?=
 =?utf-8?B?cnpId0xkb2FQWnMwU2NrODlscWhyc0tiL0VKY25DZlp1bkliWFExVFd0Y1Zo?=
 =?utf-8?B?OGV5eXRaRTllTzc0dmEySnA4dzVXZTB4SlZhUGVFdUtDVFo4QjVDVFRDSXVx?=
 =?utf-8?B?SkpoendTRWVEMXJKeGIxc3EybWM3R211WGNpTUVaV3ZCY0FocXVCdTM0OHU1?=
 =?utf-8?B?UUprOFhjK2tSM1U3eTN0VEVDbGJrTHVwNHkxdW1lZ1FadUFDSzhhSWY3MHhI?=
 =?utf-8?B?OENPbHRiaFhpb2lpOTBMd2xXbGZNQ0I4dkMvcFVlemFIQVM3TUpMR3dWU0Ur?=
 =?utf-8?B?cm9iSWxFYkM4TWpEY3F6WUpmNW5SMDVIdzR3cmFrcHhnR2tkaTlUNDFVbVA0?=
 =?utf-8?B?K2h3UVo4elpCVXYxVFhRUFU0MTBYcW1RWHlXTVROMnZMcEdnUFdGdTRXR0sw?=
 =?utf-8?B?djJyd2JsWCtqZ3lkTUFJZ20weEZXRGd6ZHFtMXVFaEh1R3pRc0pubXgwa08y?=
 =?utf-8?B?NlFIQXlJSy8vNlF5elZ6dk9GTGprL2U1TDQrUXNYR0tHSU0yY0dMUmZwL09l?=
 =?utf-8?B?cnBNVUlnTnlyZzJodXlKTEVsWEV2ZDJlYWlGL1hyVHQ3VGkzaDI5Vkl4ZklJ?=
 =?utf-8?B?Y0o1MHZOdUYwMy9LZXZtc2FPR1lXcC9Mekx1ak5GOU9oQjdGWW84ZEY3NXVL?=
 =?utf-8?B?eUlFbTVmc04ydERPb3l5cnhHVDUrVkJDRUVHTmQ0K3lLM1UwRHN3aVNjVXVr?=
 =?utf-8?B?ZS8vdWZ2S2thTFUzSUhxdlBlbk1FSTZSS1lwczhOZnVZa3MrS3MrTkU3OC9X?=
 =?utf-8?B?Zm02d1F0V3pZRXVDcE9peTVLeklzeHFqMXBjWlBKNktCRzFkY0MxSDZXNXd1?=
 =?utf-8?B?WXJ2TmM4OU92Q1RIZHVqZFBEdm9WV2VtUm14TlBaSENWc2xWemhOVFdwZkVT?=
 =?utf-8?B?S2ZBSGRGNHhOZTZlRU0yTzlGQWlhUlN5VGx4TVh4RWxCWThIQWxaRk0zaGhw?=
 =?utf-8?B?dlMvL2xwbDNoeHptUjJLVzY3Y1hvWnhSMlplM1JBMm50eWtpZnBKVUtTbHdh?=
 =?utf-8?B?cDRhSDh4bFBTdDVQaVdEMi9IUFF2Y1pzcFVzUFJUNGZhRXdIODUrOCtqT1Vm?=
 =?utf-8?B?VEh0eXdBb3lobExXTURIODlaRU40bTduRUFiM3hyOFZJc1cwekQ4MklvVWJn?=
 =?utf-8?B?bC9RZnRLVkUwQ01OMVY5dW5icGVmVXQ1SVdENU9GVTdGZ3JqTFhyTkNVSHlZ?=
 =?utf-8?B?d0VFME5xRDNWY0h0bnMranFiUjdhb2xtUmxRWlhTaDE3MVRoc2kvV25wbjhu?=
 =?utf-8?B?U0lNWTdVOUtPWFIwK2RnSk1Ua1hsYkpMOTllU0ZsL2ZBN3dveXhGQXJRd3U2?=
 =?utf-8?B?WHdnS2lsK1FIVTdJRmNmU3VWTEZMKzcwaXFHV2Q0UlBVd1BjUlJFcitEeExX?=
 =?utf-8?B?Ly9lSExQQ21GTndwVXVEL3BVcHdwTjlJMmV4cFFJNzN3TUtWVHZKOHd1a3Bu?=
 =?utf-8?B?cm1KN1RSNzltOFUyVUZlYTY5NzhzL1hSb0ZvemUrT3VUNStaamp0NldtNVFT?=
 =?utf-8?B?T2wyMFE1bXVIdytkeERRQWwvSDZKQkVTdU9RWXMwT2J6TU1TaUdCNUZoUFp4?=
 =?utf-8?B?Ujk5MWsyWHVXTU5KY1hCMWhuMGkwRWFGMHdsNTVPSjNWVlBuVDVJOWUvbHM0?=
 =?utf-8?B?aXo0V2NMa3c3cjhKLzhVVHpLL2wwdTFLL1JpdW05R3dJTzZ3bWdQV0ZSc0dG?=
 =?utf-8?Q?bbmr6X22PXP3YLOwB5v11YEMKDsHAQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 14:34:43.6429
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e8c438-cf08-4301-6eb6-08dd1f711d27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030



On 18/12/2024 11:31, Bertrand Marquis wrote:
> 
> 
> Hi Andrei,
> 
>> On 18 Dec 2024, at 11:11, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.nxp.com> wrote:
>>
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> Add myself as maintainer for NXP S32G3 SoCs Family,
>> and the S32 Linux Team as relevant reviewers list.
>>
>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


