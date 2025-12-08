Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6BCCAD752
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 15:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180734.1503875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScJo-0007NZ-BZ; Mon, 08 Dec 2025 14:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180734.1503875; Mon, 08 Dec 2025 14:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vScJo-0007LL-77; Mon, 08 Dec 2025 14:34:28 +0000
Received: by outflank-mailman (input) for mailman id 1180734;
 Mon, 08 Dec 2025 14:34:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TwXn=6O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vScJm-0007Ix-FI
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 14:34:26 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fda48f04-d442-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 15:34:24 +0100 (CET)
Received: from BN1PR13CA0028.namprd13.prod.outlook.com (2603:10b6:408:e2::33)
 by DS0PR12MB8197.namprd12.prod.outlook.com (2603:10b6:8:f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 14:34:18 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:e2:cafe::3f) by BN1PR13CA0028.outlook.office365.com
 (2603:10b6:408:e2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Mon, 8
 Dec 2025 14:34:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 8 Dec 2025 14:34:18 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 08:34:16 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 8 Dec 2025 06:34:14 -0800
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
X-Inumbo-ID: fda48f04-d442-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLQPelKSpmY/LX9B6i8c8besO2waD2Af3wteHR/NF5EzNqEnNVVffhmhRcmhjpObGf/nrGtvYmh/ztzzkPDl+/seS+rbDyHb2/zYWbYlQV/xIq2UWr/tqf30gR6gYGtkVw0yjlx6oj4b5X06weL47iiHBmhUbTrge2wYCHnQiY4/oRvrZagt6p0VgiIrzsHyT96PXxCd5N7scAUQW85VEIPL8/eicws+EmplgjyRf9G3k9x/Lbrjh5OD5paGViycBjc+u2NlTL29+D9k0tDYIGsQIg/a1IC9OdRy54sHgVl6BV5h8cYkQLF+ompdsQgyBlwJOqJFtRk+yRY+Lc55FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwFwfBE7NcfWWpNKeYKhxzeFcj4uwOTpn62uFucJW9A=;
 b=hfA9+9436b0Qo2LcTlvu8zhX+T7w3KikJiX96guCSFGDmzaFfyvdYgC0aynFHdrBtTMd220i2b5dhDQ6BeRUvQqaV0XWFMBwj3S3WUZbAepOHEpX/exGQ8oL5hWWb14TCCfKVQzPfDSjvSxGqesB9n/0uV21B5zyUBGc1sI2DRv4cxuU6jJi3fhRJYEttog52ruv+1wUciGXkzjH3miJBR3SAWrfUhwQFhGBoB6Yo50xOSUAGJ4wt/UJAoZm0rhsC2Q40rO18qXynCsqd7BdP3vnvpFWfU/iXbujZFNQBF/BbQ1uohV3c55XDnw/iM66bAoAsUBZVdrnbah6/ATtTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwFwfBE7NcfWWpNKeYKhxzeFcj4uwOTpn62uFucJW9A=;
 b=n5KmiAXdPMHADp0T70BddVPbcTGkxbHLuyftOqNG0FIF2pPcjQ39VX5/YLcs68P22lkXzz78AJKt2PsZysu85KDLJk6F88pv9i/q6w9Q6FN8xigFSC++WCFH4T31+kbe4jAou6C3PXvRCnEJnntnqUKy/mlp+HYUOfvNTfkkRIU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <993b079a-c8f6-4e39-81e3-7430ba2f774b@amd.com>
Date: Mon, 8 Dec 2025 15:34:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen/mm: add generic domain_clamp_alloc_bitsize()
 macro
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
 <20251128152218.3886583-3-grygorii_strashko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251128152218.3886583-3-grygorii_strashko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|DS0PR12MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 4af56a5a-ce33-405a-23ae-08de3666de7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkVhSHpiVGI1WDdJenhSbE1tVnpDWENIS3BRUExQTFR5YjVDMXNGRXl1Q0lv?=
 =?utf-8?B?elkzMzNSSG9qaURtcjVqM2ozblFwTWNlTGJtMTkzVGdQUEd0d3pnbit5UFpY?=
 =?utf-8?B?OGlCSFhjTkEydjh3azJEazEvYVY5bU9pT3RoNWd3bDE1cSsvUFQxUDNNRDRy?=
 =?utf-8?B?ZE9xWHJuZ1RSNjFYbENqR0NuQ21lSFRCaFp5eUVNNFlYVm1ZOWxTdkNmeTFp?=
 =?utf-8?B?QllHbkc0NS95ZU54VGlYZFVTNCsrQUMweG9KN2xrYkRrbndsUGxjMUhDM1RZ?=
 =?utf-8?B?RUpNKzBKTkRBaXBaWXBEY2ZRTWx2cGthdXlVdk5VME0zUVkvaW5NdXNmVmI5?=
 =?utf-8?B?YnRQUjZ6TGNEeFI4S3pDYVJIa1d4Wm9mZHdaUnhsSUJ4RzAvY05zZFMyZ3ho?=
 =?utf-8?B?cnpGNHpLVGV5MXFwWk1uUWk4MUhCb1lNQ3VOaExDWENnR0krdktyVExiRUsv?=
 =?utf-8?B?aHZaeVlpMzMvQVZtMG9EaGVLOU9WdWNsS0tDWUsxQzBxTFVwWUwvWkRESkdh?=
 =?utf-8?B?VDkvZVluNnRZSkJtakQzRWJUcXlUVnc1RjFUS1kvUzRLYStQREhwVXRCN1dj?=
 =?utf-8?B?TG9WR3dTR1Y0OTdHL3htYWNpSlBadHptaldnbml5TTUwMVFSUHZ1bGUvQmNK?=
 =?utf-8?B?bnY2UGMyai9TcFhDYjM2b2hZc29GQVJkWnBkZ0FpRmYrTVZHaWl0UFZrRlox?=
 =?utf-8?B?ZFJzN01XZGhJREhYbTlFNnlYM1o2ekhvQXpDdnBobjIrVHB1YUU3dkJnVEk3?=
 =?utf-8?B?R0Y1WWtNbFdPVnh6clNsVWJSamJ4M1dCNFdyaTdpK0lUU0pBbVdJZUphayti?=
 =?utf-8?B?Tm1ycjdRdyt4dGdZVnczUnBMZno1VXlhZWZmUGMycDJYcU4wcWdaRmFVMkdn?=
 =?utf-8?B?NEladktsQlg2cU5qTVc3QjhEUXV2MTVWWjIwY1gxcitUeVRFR3lEWStNQTdG?=
 =?utf-8?B?UENwbG5GUlZOUGxwTVZqOHQxVVFORWIzUWN2MDJTanliL2JmYzU1ZEhiVHBt?=
 =?utf-8?B?UEdxSTNtSUNWL3JjTWlCdHpLQ2hkSy8yNjJKSUxtUHRmNkN6dHJ4Nlk4S1Zh?=
 =?utf-8?B?bXRzZTQyZEZHYVFnWHZsUUJSNEovYjhDcXJKVVVyZW5DaytQWVIxNzJCN2l4?=
 =?utf-8?B?TFhqSitPUjVMQVZKMGVBK1k3dWRXcXJsQnNGN2xRek1tSGh1bHRHR2g5SXZT?=
 =?utf-8?B?NW1kbnZZOVlPMWZBVGp4NlZPNnZYOXlZNWxrMTROVi8xODZHc05MN24zRkhx?=
 =?utf-8?B?TDRMN3FMaEZwaFFpckdUS1Q5UG9VMmgwdEIrZmZWTVUwVzJWNVZLdU95aE04?=
 =?utf-8?B?aFdBMURpeWdGN0lFeUxEbm9KZGpPUGFVak8ydlRYczkySXpPZVJadzB3Qjdu?=
 =?utf-8?B?N05NQjNXdlJybzYrM0VvQ3RhVFJCYVM5QmlNWE5RMjZEN2RBZlVBUFBNTVRi?=
 =?utf-8?B?bGhLZ0VwSGNqOWpRT3QxeHN0UE4yeEh0Qm1aRDdVMmRRZmpXU2hRMWNHN0l4?=
 =?utf-8?B?eHRBY1cydHNvNkR1cHpIM2sxUW9UUkg0eFZtYldsRDVmWEh4cXpsSjZHQlBh?=
 =?utf-8?B?ZmIrVUR0VFVGNVZvK3ZKVDdDVi9IUTFGUXhkQlN6dEVBVjlSaW9QS093ZVQw?=
 =?utf-8?B?cWlpNi9pS0pRU3FqaVJuQjB3SWVUNDRReThnRXl3VGU5WmVQekRGNHdTK3Y1?=
 =?utf-8?B?ZGR5L3d5ajNrdEp1NnNyUnh0MGJYcGhmaDF6YUVBcEtyTi9pSGhITHhiVWRu?=
 =?utf-8?B?TFo0RytUTFAxNzhPKzNnRmR4U2FBamVXVkFaMkNVZCtTZGMxUDQ5NHV4RlVk?=
 =?utf-8?B?bFUzbmJjZGcrUVFwYmVxYkVROThpUTY3WGFubU9XQTRTS1BPNDZrNjk2Zm10?=
 =?utf-8?B?RWNFODBzWjhpdzk2WFVMazV1YksvVE5IdUpVaUd1eVdRYXU2NGQzUjQwbGZM?=
 =?utf-8?B?OTZhVFBsei94MW9GR0lhK3d4c3F5d05heUlHTlU3OWlXeHFVRVJDckFTaDBo?=
 =?utf-8?B?WThMM1ZDb2psWkRCU0FjSGJGc3VMU3BUQ0pCSUNoT1g3dXppaDdXOTlzUWtL?=
 =?utf-8?B?OURxVUlCSUtqVkF1ZXlWZ0hyRXhndktOdnF0UXJSQjlQdnFjZUVLRUd6Y2hj?=
 =?utf-8?Q?MOzc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 14:34:18.0116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af56a5a-ce33-405a-23ae-08de3666de7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8197



On 28/11/2025 16:22, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Add generic domain_clamp_alloc_bitsize() macro and clean up arch specific
> defines.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


