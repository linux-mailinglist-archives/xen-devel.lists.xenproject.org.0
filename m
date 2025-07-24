Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB797B11554
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 02:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056747.1424758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6TF-00082H-0G; Fri, 25 Jul 2025 00:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056747.1424758; Fri, 25 Jul 2025 00:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6TE-00080p-TK; Fri, 25 Jul 2025 00:39:32 +0000
Received: by outflank-mailman (input) for mailman id 1056747;
 Fri, 25 Jul 2025 00:39:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf6TD-00080h-Eo
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 00:39:31 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2416::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d223cd6a-68ef-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 02:39:29 +0200 (CEST)
Received: from BL0PR05CA0001.namprd05.prod.outlook.com (2603:10b6:208:91::11)
 by CH3PR12MB8849.namprd12.prod.outlook.com (2603:10b6:610:178::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 00:39:24 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::62) by BL0PR05CA0001.outlook.office365.com
 (2603:10b6:208:91::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.5 via Frontend Transport; Fri,
 25 Jul 2025 00:39:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 00:39:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 19:39:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 19:38:52 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 19:38:51 -0500
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
X-Inumbo-ID: d223cd6a-68ef-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3YsSE2L8B0a8nQ6GSJXLwoyraEP2KyrMu2HyhL9EpNc4H5SzrlUjONHK1jPtCL1tO/cCnTpiYecTlJTUKp8UCR0NEs3RoauG4P+YY1YkCknXsFZtzHAqm4OCXBQPnnufHsIyUR/6ZH9WCejIxo+/Yuyyh/Vwdi+JmVNokFM90YqXBiNuGzdpHO8lwfkEknIx7Z6bFknaz+5KOFrkBV+oA5GxBCwmQtH5mHyuHeCsCXoJRsL6pKev21Wk8Sry1HsApNJjL80ZM1Rv4hPQV872+97GK+VmmXvj8+2PIlWyqJHAwAC9GfJO6lPyehm4BhllGMSsbSgQ/odLlwQpkGq8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jy1d+d3XcpM/RcKgrO/is7QG0W1Ejwr3cb+mcXpu1Zw=;
 b=pNY2sxOK8z0a546VhQrQSi7VLCwo/NOcyL6FAIbsbuaERSHyrn+hawxpBTMJOg8oa7DiQRm7jiRgp0uWriDb+tFSBN1tHSkLcVfmoJQ73nWzVbZVdoP6IeX4tJrod0i5gPxMtuGl8AZc5Mt6NKTAlBX7xCgKdtYyHGLrFkt5LeliTjf+cmpmw3NdVTcAjuEViRrpJoIWQ+wc0jnIcc7HAIDBRdPxrKSBN8gZnrphrMtfwwHwNtx3/BO5vaaYh4e6EcT4JxMW/EZ/nSKMPkXC8LiVgx/JBSThRRMrq9kIQaoecjfnYyUCxqYukhQvcFoq/dkFEMSS0/iuQVDw7kZHZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jy1d+d3XcpM/RcKgrO/is7QG0W1Ejwr3cb+mcXpu1Zw=;
 b=nfJ13WQAtaZwWhbb7vmFjeWunbUS/TyIhNzTmv0/KgzvWLp30h+1Zickl8F8RhZ05tvQUKGAKGTlFkh9jw8L2HXUA4khO9e1AEjBLkJRdIUxgHKNMzZZ2rA6iVV+Sb0WYzHcI3lsW2670n0N80ZhA/efswq5qwtF6sHSSyl/HFo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0e2e2c74-cf09-4fff-a047-d0307d8b09cf@amd.com>
Date: Thu, 24 Jul 2025 18:55:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] tools: allow to limit xenstore features via guest
 config
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Nick Rosbrook
	<enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>
References: <20250722140628.28947-1-jgross@suse.com>
 <20250722140628.28947-8-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250722140628.28947-8-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|CH3PR12MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f8caec4-9e1d-450b-ccb8-08ddcb13b406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHRnN2lRcmlnbExKNFUxenJLYjZWSlNRd1BPdmM1RXlWbi82NGVML05ackhZ?=
 =?utf-8?B?UmZEUkZ1UEhaZjMzMGdkT3J3ZWh0RzBhS05CQk5xR3dWeUpZSEs3QjRmVVJZ?=
 =?utf-8?B?Y3ZTVk93R2U4djFZSUVkcUJqaVE0bXltQ3RRQ2pNeDBvM25OYTZMTnpwTVI0?=
 =?utf-8?B?dXFqcVVybXhDUlB3bmdjRUNkV255SnI4c2FaTkFvSHplWVNEQUFtWUZrbUdX?=
 =?utf-8?B?K1N4UmRxa1hEdG40UHkvUzhxWDdTTi9VUjRtTkRidmhlTGFncTY2UncyTE5Z?=
 =?utf-8?B?a0RtZHgzWlMydUNjY2VXemlpMkxPbmhVaTk0WWE2MVp6TUE3UVBiTWZvOTkr?=
 =?utf-8?B?dzVyUC9kS05adlZlMmF3YWNvRitFNy9KaGFiOFpJMjNyajJQbkJwRUk4cWNo?=
 =?utf-8?B?NkJKdXV1aHpRRm1QMmZhU1NzS0swS2YzK1BvQlBxREIvaGFpNFp0SDMrTVVT?=
 =?utf-8?B?c0xxdGQyUnRzbzdGR2JQNFNnNS8zZkYzcHlxWWorOHQ3TkFoNFVKY20wRFV0?=
 =?utf-8?B?NHZONUpvTUJ3NkxQVk1IWUdlNlhJMlVjNmU4eXJGWVBvTjJFRWl6eGxKeUFx?=
 =?utf-8?B?ZXloak15N2xOcHRoVDdvYWVqSU5hdTNvREZSdG80Rk1MaHJWaEhUODlIR3Fy?=
 =?utf-8?B?bmp6cVduRTBCVVhxTng3YXlqSVJiUDB3a3luUFRCNkZURmZGb25JY1ZSZUU1?=
 =?utf-8?B?TGJLV01uNG51eXpmdFR2NE1WTi9NMVRsQTJzTDBJN2NmUFhZWEJnL2R1MlY1?=
 =?utf-8?B?RzkyUm9vZFFvNzVpdXdHd1hxcDJnNHhZdUowM1dsb3VVN0YxdWtFNnNoYVhN?=
 =?utf-8?B?Z0l3WVcwZkNYWmpTMWJIRXgwSmVzWG5uemcxM1RISnV1WVVHajQzWFRHK3lk?=
 =?utf-8?B?YnVDb0NpcVhVWkFDRlNzNnBNV2RDZUN1cGQ2WlhLeC8zclRmaTFkWUw5MzRX?=
 =?utf-8?B?UmxNMnVQdHcrMDA5NkFqTzdYcmEzRUlvZldaWnFqa0QxM244bE9tRXBackJu?=
 =?utf-8?B?ZGo3TFBDVERHeEpWNHpXYmZoMkJBQmk2VG5ZaElHc2ZMd3RUbFYyZ01hUk9N?=
 =?utf-8?B?RU01bEI3Ny9ReDZtQmxZWXRLNHFKZytlQ3R0dXd6S2svd29SZFZCaHBzUERL?=
 =?utf-8?B?eGJjeUovTzRuUEZpaU90Vi95Mi9yOUtTdGJvRm0wRmNTcTV1MUNPbWlySGx5?=
 =?utf-8?B?TW40Mjl2WXA4QWE2U3lucjRqS1hBSm1zNlV6ZlpHVUxDamFoRVNtQVM5eElW?=
 =?utf-8?B?YVlLL0dveitldFFyWU5kNmlGMDBSZlpVREZMMEJySEFpYlZlbTI4WmxQMCs2?=
 =?utf-8?B?T2MxZDBjY3cwOUJzcW5hbjFjUjVQbkxla3pWeXZaOWFqa2htdFZzcUp0QW4w?=
 =?utf-8?B?bFcvUWhyVGt1RWVKam1CYmVTMHFqL2VLb2ZIN0NnZ2kzSnUzL1VraGFXbzhD?=
 =?utf-8?B?dEhKQlVQMDArUzFLTlYzeEF0a3d5ODJ3VTJ4b2xzdmc0VmdGYTdLMnRQdmtK?=
 =?utf-8?B?R2RzZ28wUTJ4R0I3NmRsdGR5azVWS3cyaHN4SU83UW9aeU5FSm1BTmJKdVE5?=
 =?utf-8?B?akhyNXhybUNFL2JDSUV6b25nclFoVVZVdzBwTmlOcXN4NHY4KzdqZ1AxdXAx?=
 =?utf-8?B?WnExTENqakJHZEd3bTRlb0dNckZnNVpZczJCQndBTVZvZkY2SFJNKy82OERZ?=
 =?utf-8?B?Ri83TVBpRzlhVTcxdU5pNGJSdkl4RWJ2ZHBxMUowV1dCUWJVWFp1TERETEl5?=
 =?utf-8?B?S0RKMVV2TlBFdlRxVlBMK0pIMDJBMXpYOUNQTzZueDljczlQZkVUMVpaMndE?=
 =?utf-8?B?WWx5Z3N2ckFLUDZsZlBkR3lsaTJsdExjZks1WGpleXpkUnFVYng3dklrTFpF?=
 =?utf-8?B?UFhlUzIrTEZMQ0RmRzRSODdHSVN6K3o0aE1KYzRKK1czSlk2K1RMWmphdkRP?=
 =?utf-8?B?SEtoT2xjN0ViVkxFd1NsOEJ2ZVRQWUIyem9wcEU0T1dZVjhSeEVTaUNNOURN?=
 =?utf-8?B?SEVzZlpxWmRRdjRteWNDUkxmYU5IVWtJT1g3YTM2SURCcmdNQm5PZWFORHM2?=
 =?utf-8?Q?h+RDLj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 00:39:24.1188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8caec4-9e1d-450b-ccb8-08ddcb13b406
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8849

On 2025-07-22 10:06, Juergen Gross wrote:
> Add a guest config parameter "xenstore_feature_mask" allowing to limit
> the Xenstore features the guest can see and use. This can be needed in
> order to allow migrating a guest to a host running a Xenstore version
> providing less features than the source host.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

> +Xenstore is capable to reconnect to a guest.
> +
> +=item B<0x00000002>
> +
> +Xenstore will present an error value in case it disconnects due to an error
> +condition.
> +
> +=back
> +
> +The features supported by the running Xenstore instance can be retireved

"retrieved"

With that:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

