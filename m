Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAA7AFD9C4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 23:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037290.1409949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFoz-0004Jg-90; Tue, 08 Jul 2025 21:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037290.1409949; Tue, 08 Jul 2025 21:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFoz-0004Ge-66; Tue, 08 Jul 2025 21:25:49 +0000
Received: by outflank-mailman (input) for mailman id 1037290;
 Tue, 08 Jul 2025 21:25:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd/v=ZV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uZFox-0003qV-Ir
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 21:25:47 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2405::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b98cf57-5c42-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 23:25:46 +0200 (CEST)
Received: from PH8P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::16)
 by MN2PR12MB4405.namprd12.prod.outlook.com (2603:10b6:208:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.33; Tue, 8 Jul
 2025 21:25:42 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::8e) by PH8P221CA0001.outlook.office365.com
 (2603:10b6:510:2d8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 21:25:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 21:25:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:25:39 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 16:25:39 -0500
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
X-Inumbo-ID: 1b98cf57-5c42-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJtdKRW5nnZnExRzmBoZ23TncvnHm0z+MWYwWQhkl0wn5XV5nSU+0RGu8TOEqy/kOba2vHIsfPxzEneuFYxklChy/4pGbS3+nEitI4eaO0BD1ZlmhSPGbHA0SX4dyXLZfFe8STUYkd1bVS+w2uWhkAugmr0vVexAWUXo4cGrGBY7u/wZyfSwjWCRIeC126gHlzEWO1Im84w9j99aK3jCRK+6gtAYnRyPhALyMCmRRBcPvlGj416eLJH3HC0z1UipRrNB2DgZCH9iqCtc16oMB4TaDejPxFWwz4HTW6M2/VzAdhVP6g2AdvROG/NC88TyNwPa5/Kf6WFbrP1NuwVyYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwGSqZutmjy2qhGUlGohAnImQVwRXeFkWU30d36YqEg=;
 b=hPYf2fRtPMAZ2g24MYLtR4Ca3W6h80/cZuEexZSis0ryVBvJgvfru1dZenJnB1IZLwYTsocU+kiY0bL1owHpjR1W+axl96TeDi2FcAqClHE8kSaSJ5QEAg0eG2I6CqYqvAkwP2sB6Xu0XrNtlfqJ0sPUJbEt3wyksVyHAvd/Hr92a2cosH93nBlOeEBxO77PrMnu5mLhTMFsFnhMrWHuWQDAL0rrVgubHbAdKBDFM/EC/55Hy3zIlEdelcmorX2vSvL9mUlfiXAR1IBVj3e+TnQkWkLlmWpYAFv+PCqbSAilWivF80mpU4HjUa4ZYd157vL/RUuIqQa2kV/3q+AaLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwGSqZutmjy2qhGUlGohAnImQVwRXeFkWU30d36YqEg=;
 b=US9NmvibASJi3ojuYNyDyROspJ2vmAMQpBCOWc4jDvBNJq1r/l09T2dNwczgDkXmmHhWZIvaI/+ZG6LbOkV+QXTnDAZnU0Q1KjGbFKOHQH33SIpV4R/JVGmlTKrtBGVfktr39q48pdDjWcxTOyRifLwdqK1yWbaIz0FrJ6miYMo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d92ebe6d-8bc0-42b4-9f09-c01199886d30@amd.com>
Date: Tue, 8 Jul 2025 17:08:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 02/19] mini-os: kexec: add O_CLOEXEC support
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-3-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081254.14383-3-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|MN2PR12MB4405:EE_
X-MS-Office365-Filtering-Correlation-Id: 0089f6fc-f7f9-40ed-e0c4-08ddbe65fdc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0RRZi9BZVNqcVFtOFc0YXJTTXVua2lkbk9IWktZME1sSllhUk51WkdFZW5V?=
 =?utf-8?B?eHpNZHRPWUlSS0NxWmRxemxuVm9JQjFOcWcrRGtoWU9yRHNZb0RSTnZ0eHlQ?=
 =?utf-8?B?T3RiU0tKVWhrMFlLV3ZUTzNkL1BQREwxeERrSjVRWmswN2MrWXpqZHFXT3Mv?=
 =?utf-8?B?TGVaRnpFSTc1VGdhU21JMXBnSVdJMWgzSzZwZlV4NTcwSVFXRCtBMGdwZTYv?=
 =?utf-8?B?cTNYRlZHTG5jUWNXcGZkRnpyb3dQb2ZpUkNDRVovNGxtZ3d4Wlo4d01mYkZ0?=
 =?utf-8?B?KzVXZW1SZjdSdXhydU15aEh6SjZzVlN6TlNXMFlQakswSmxDZHRLdTA5Vjlo?=
 =?utf-8?B?bWI5ZXV2ZHZLRmRlUHV4bVRFVEhQQVN4R0oyZHRZbmgzek1MQ21GRy96T1Az?=
 =?utf-8?B?Wnk1bGlybWpiM3dZbVUweHZqMFBIVWhHcUM0WmJZYzlhWDh6RTFLa211ZjNH?=
 =?utf-8?B?NnJOaTZEMFdoUDZ0b01sTS9lU2JIeVZIWWwydlk4OENzZTlEeWJSbzNFbkpN?=
 =?utf-8?B?SlltSXNQdVpLMzd6QjFQTE1qYmVjMEk1bGZHNWVVN2hPS0dPWXNVMXlWeWF2?=
 =?utf-8?B?MGVsem9XZ055SFdaL3FKaXQzQTFLSmVJSXo4bkZGcXN6RG02Y3dDakU4Nndw?=
 =?utf-8?B?TUNuTHVhakNMaHdrRHNLakhnN0dlUVNxbEtWN2xDNURvdHNDTFhwa3M4c3gz?=
 =?utf-8?B?VzRCcTZVVXFGNGxab1oxS3VRWW5tYW1vcGNqS0hmWnJCeVl3TnJlbkM0elhE?=
 =?utf-8?B?YkNjd0xZSldRREZHUm9XUXlSQUJYMWszYThxOEpzVUFjWVpnTzhQSzlZeHU0?=
 =?utf-8?B?cDBVTGdoUjNtVDlGUmF0cnVnKzROa0YvRGNiTmFaWHY3b2ZMTDZRcTdvVlpL?=
 =?utf-8?B?M0tyck9RNFh1WWxkemtWYmF0M2hUMWgvblpGb201aVVkd3BKbVJQZ09zaytr?=
 =?utf-8?B?YXBVdmREclZuTHplZGxISHpacXR3ZTVRWG1sclFiTUZER1gwZ0J1MVJkU1U5?=
 =?utf-8?B?UzRaNzRDZDhpcnovOWFtbC9tNXBXZkZpcFcwc25JM05NRUdNOHVoSWNMVG9U?=
 =?utf-8?B?OEU4ZTZQR0ZIQ2lXLzhyY09hRUFpd2ROemRTc0pGSnJKald2d3ZXNHBBTHc5?=
 =?utf-8?B?QTJkbHRJcGZiM0NxalZyaVVJTjVTVWR1bUZ3VU1MRCtXTENDdUxMYUcwem4v?=
 =?utf-8?B?LzZVbzZ6VGpqb0VKNlJyYUczNXN1b0thTm9yYXQvdTZCUHRaMG0wMVpBRkRB?=
 =?utf-8?B?bHdtamRJbC8xbHdWZ2haRCthMjZIZkI0ZVpack1Yc1Y4bCtZRG41Y0dRc25Z?=
 =?utf-8?B?ZXdsd2gxK1UrdStYdEUrUzVXUzZHOHQ2VVR5RUV0U0dIQkx5dGk3NUlFdW55?=
 =?utf-8?B?SExFMXZSempvTlR5ZFBQbEhxSWFDWFRES1hrdlNFMEtqb003U3A4QXBYSXFa?=
 =?utf-8?B?cHJlNEw1RGd2dzlqOXdRbjBsU0ZyNnEyRytZWnBxY1BzdGNQeVp4M2ljRTVt?=
 =?utf-8?B?aTdJNnlYOTdCQ2NrM2IyN3NMTW5FbnlQdFpBNWk0WGRVTW5rMjY3S0h0Y0FL?=
 =?utf-8?B?bnIzWndNV3ZDdVE4SklmTUFhNmJzV25OT1FrN052dktLMURuQ0wyWDRPSXBG?=
 =?utf-8?B?czd5RU5vdXRxRzZHTXRnbDRkUkF3Z0lLMGtCb08wU1RtR2ZzeDg5QzcrbXF2?=
 =?utf-8?B?SzM4M05tTzBJM3RaMWdzcDk1bEpzZVo4bnlLQ3l2bnQyR0dWM1NRRTkyM2VJ?=
 =?utf-8?B?WFlaaVJBaFlTUC9jMnZMSXZOTlRNL0JJNTh1WHFrVjlxcmdEOENRVi9pc2RT?=
 =?utf-8?B?cjNPNmVsY1NGLy9OUm9wd1l6Z08rMDZXTW0rOS9iNGU1ZVB5UG5scCtBUmdG?=
 =?utf-8?B?VkovVmZXL1BFTzJPbThJUDQxeWkxTFl5WkxBM0tNdWwvbFVjLzF3aEc1T3ZX?=
 =?utf-8?B?dzU4ZWw1ZjNVMVh5U0tZUlJXd25WZEVkVGtDSy9UQUgwSE9URlkxd1U4MFZS?=
 =?utf-8?B?MFNhT0xMVTcxQm02NkhuVDBSWFp0YmR1WnU5ZndxWUhFalNBZEw4aUdGQ0Q1?=
 =?utf-8?Q?owGrCC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:25:41.4175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0089f6fc-f7f9-40ed-e0c4-08ddbe65fdc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405

On 2025-07-02 04:12, Juergen Gross wrote:
> Define O_CLOEXEC as a non-zero value and add a kexec callback to cycle
> over all open files to close them in case O_CLOEXEC was specified when
> opening the file.
> 
> This requires the addition of a cloexec boolean in struct file.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

