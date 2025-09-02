Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B92B3FC0D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 12:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106018.1456819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utO6R-0008HK-7P; Tue, 02 Sep 2025 10:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106018.1456819; Tue, 02 Sep 2025 10:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utO6R-0008Fp-4F; Tue, 02 Sep 2025 10:19:03 +0000
Received: by outflank-mailman (input) for mailman id 1106018;
 Tue, 02 Sep 2025 10:19:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvP2=3N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1utO6P-0008Fh-TN
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 10:19:02 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20613.outbound.protection.outlook.com
 [2a01:111:f403:2414::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d60269a-87e6-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 12:19:00 +0200 (CEST)
Received: from DS7PR03CA0236.namprd03.prod.outlook.com (2603:10b6:5:3ba::31)
 by SN7PR12MB8604.namprd12.prod.outlook.com (2603:10b6:806:273::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 10:18:54 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::36) by DS7PR03CA0236.outlook.office365.com
 (2603:10b6:5:3ba::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 10:18:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 10:18:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 05:18:53 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 05:18:52 -0500
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
X-Inumbo-ID: 3d60269a-87e6-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXOSzFPb2FGWL5b7LTjIVYIqtP4efcbp2FoN4Ubo+Y245FNbHufoH6OUG/BNpIqh4D2SKaSDeuFdmWX7GTkZgOmqsBqG/cX7cwkqZL2u211rYXBAFEILv0sZry3pxWTT9zXzs/DkMMYmkOsE9NR0nbre/oKs/nZKp/VuW4a+Fn7vJuz7vzi0gkwZ/vTREvEy2rlPy0lWc+Y8Apd7cgUtPd4zrHFRbLEYaX3iWDbsIhcnfln/AChdfW45ljL5WDHH7/YqgBx6ksMwW3cDzKmYuDCPy3GNDe7/hpmmqOhGo4uQq55gvSVoS7nR6FdA4f/cSmLCnhsTNEekQa3EEBXPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgTOqle6Otd2aLtwdCqdFpw9U+fbJotdJG/ecMLIEuA=;
 b=n0nTzmkdUUu2E8OcZSlOv+6MqXZgv9gwuAunu+jmITmL12OiYbFjSSJg6u1xug89GY3m4p9P9AJGkNCYxNPumVO07IVxN2SbAxU088F6OHRsLz6KH/xvCLjFEP/VSFgfJyAxF9LZ3hv4YTPk7Lo2ETb/eeQcxDTqKBkhXYV+zHRCNCVeZKmGh1nWiv11YiABUH8P1z2lzej9wxTGRUea0TrmHRFlsNsaHkq4krEwYAMBTgkHzefwis1cXnHN7VfgYSVc7gVMR5LegSUAnJqE6t2OVc0oOnoWkqkUHegoAYjiO4QxmnbOGx8vBA4GlMBp02zEIZLVLy2zFxljtA5/fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgTOqle6Otd2aLtwdCqdFpw9U+fbJotdJG/ecMLIEuA=;
 b=q9KeMXYn/MCGHd01+Rpp5Ek1doj8sw0Xw1FxYkVTcYexokXnYYlJSNsILXGqPIayS2OiJhWTOYYIlMOY8kIN3dAv894UhfZ2r23W5HgEU4mDaoeJf9IQC3xArehPgIrwUHy08tx6a/kqLW21Zddh7pR0MtLitHgrTwbBMYA/XcA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <319c280a-535d-498a-b0ab-93882663e23b@amd.com>
Date: Tue, 2 Sep 2025 12:18:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: dm: Drop XEN_DMOP_get_ioreq_server_info from
 supported
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250902094931.1733774-1-oleksandr_tyshchenko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250902094931.1733774-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|SN7PR12MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: f7978943-362c-4ea4-a331-08ddea0a1eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NW14NHpDTysyNkJaSXJDUVpRNkJySy9qRXRPRGNSbmN0YXRPUTlQV3NCQ3JN?=
 =?utf-8?B?a05MZnoxWFM1TGVPbmRNUEF2NCt6dkJUKzBSR0pHVDZORnFGQlNMdXE4NzQ3?=
 =?utf-8?B?VzkxTlB4dDd4SWsvRENBb2dQL29pOE53b1JYanViVWZlbVAvR0xyaFVwUjEy?=
 =?utf-8?B?K2NvZmFXYXRDNlpHWDRrcXpRMG1yaWpoU2Z4ci9nR2t3ZHNOeWVlZ05BMEty?=
 =?utf-8?B?MFBTT1NJNUgwdW5IV2RBVFBPbFhNbUF5Sk93V1lJelRrVVBIb21pMmR2MjdG?=
 =?utf-8?B?ZlBLQ1Y2dXNyOENkbVNoeWplaHRjc3ZKbWlmTENqQnJvaGRaWTRwcFY3MTFi?=
 =?utf-8?B?dDdBZGkxUWhHRXAzM29WeE4xNTRuZzVqSC9zcXl5eWIwMkd5b1Z0Y1RlVlhM?=
 =?utf-8?B?SGUzaW1YY29HUGtFZThyOGdZd3o2SjZpNnk4TDcrUGlxdGN1bXpiMFpqa3Yz?=
 =?utf-8?B?RDV3c21Bc1ZWTDEyVXdBMnFRdFRwbWR0cmhGQ1QvblRQQnQzbVBSbTZCaC9w?=
 =?utf-8?B?N3A5cS9aWDFSb2cyMlhkMU5GY3gvKytDREJlL0d4YWhvVGtnUVVKMy9GMGRu?=
 =?utf-8?B?Z1N0QTZQenZWUWRkb0lrQmE2OWxlb2VQMXlvMVBHYVNlV3pxMXlzYWR2RHpq?=
 =?utf-8?B?dnJTS3NHMnpKL3ZFMklYcGNCODFQWlVURjdxcHM5OGRBU0NzRzdNa3QzWGR2?=
 =?utf-8?B?Z29nVTNHZ2pUcXcyRTJjR21vVWhQZWNzd3BUbThQT0N1L1VTMmpSTFhtRHdu?=
 =?utf-8?B?dklnZmdhL2lRbUNmSUpBTzBIYjFZL095bkpESGtsMlVFZHJOaEFNVTBibzFO?=
 =?utf-8?B?ZVpKNUJzSkpxbW5hMm52YU9PQUVlejlVVDBHVnlUWkpkTlQyTFcyZGRlclkx?=
 =?utf-8?B?eW5MeTcxVjFVdlZXZVVOZ01la0JnYmxhaFZIMmwrZGFDQWQzWGp0RktSRi9D?=
 =?utf-8?B?NG45WEswcUE3MTY3QzRXazZ3djFQQk92aisxSVRqNitlWUp6K1BFR3hNQS9O?=
 =?utf-8?B?OWpiTHlsUmUvL3JWRlhibHhveWw3TDR5SDBkcFkwaFJQQ3gxOUVNZFBwRGhn?=
 =?utf-8?B?ZGFmSmEvZlFVdWptYWtFNzZzek81dUY2TnpJY3BjcFNrenRFL2o5QWx5ekRL?=
 =?utf-8?B?bm1BUUhxb3liVVVkUmI1dHp0aXMrU05BcmpLVEV3RUcyc09EWWZ2YUgrMXUr?=
 =?utf-8?B?ZWJiaGtBNjBBeGtvS2hPMFhTK1h3YW9CR3FwZUhxcnVSaHpTSXdyY2ozRjRQ?=
 =?utf-8?B?anFUa1d3RWd0Qm55czNiZXhpeW4xYSs2VkJXYnV5VlBndnFacmc0cDROdlIw?=
 =?utf-8?B?MGlTdDhpOSsycmQwMmQxd1NnbmxwMVRQcmR1KzV2aW00cEgzQ3FOTnJIakxv?=
 =?utf-8?B?YjZtcUkzMlllSDVyZi83WGN4a0NTZTlRNUp0Wm5GNGtSZXlFU2VuajNWeUZz?=
 =?utf-8?B?c004ZHl2NVYxQUhsWmVIRzdkY3dPK0tTeUdqRTVzaTVDSUF2UmhOWk50d3pr?=
 =?utf-8?B?NVVyTzI1RnFOOG92dGpEK0pVeTBXMks1N2NjR3JxYkh2MnRackd5b3dLSER2?=
 =?utf-8?B?SDZMVVdBV3lnMnczV2Jwa250OTZpUHhnNm1kL2V4SWVwcGE5Tk5TWnhidkQv?=
 =?utf-8?B?cEVhczBldDlBZ010N0orb1VpSk5sMWxRNHM1TmM2S2QvNXE0SkVYK2Z1TzJF?=
 =?utf-8?B?d2EzZzc3Vk9xR1k2M20xTFJQQnJHdXNhQ0Q5SkN6Mmo0dHZoQ1lYVTRxREY4?=
 =?utf-8?B?dk9Udm1Ialg2U1FmVVFCYjVyZ2ZwVUZhTUxDNlM2T1hROStmVWdWbmtlU25s?=
 =?utf-8?B?VklsTytsYTJpaktmZlptRnpoRy9kVlBmU3E3dkVyVTVhYWd6L0xJRGtmRkVC?=
 =?utf-8?B?M2VpSnUzb0dhY1Bta0swWCtsRGlJUHlIK0NSbmdGRUdDemlUVFRucldiaHNZ?=
 =?utf-8?B?Ukg2emxsRlkrSDMrQlViV2lScXRZSFlETkNUZnBUTGlmNXdVaW1zL1FzNlkz?=
 =?utf-8?B?eGtKWGVGOWVvV0JUdUE2RG90U1BsRWhFM1ZGOWZUWStYMVVFajlUR0JoSEJ5?=
 =?utf-8?Q?G2dJrt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 10:18:54.5258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7978943-362c-4ea4-a331-08ddea0a1eef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8604



On 02/09/2025 11:49, Oleksandr Tyshchenko wrote:
> The said sub-op is not supported on Arm, since it:
>  - does not support the buffered emulation (so bufioreq_port/bufioreq_gfn
>    cannot be returned), please refer to ioreq_server_create()
>  - does not support "legacy" mechanism of mapping IOREQ Server
>    magic pages (so ioreq_gfn/bufioreq_gfn cannot be returned), please
>    refer to arch_ioreq_server_map_pages(). On Arm, only the Acquire
>    Resource infrastructure is used to query and map the IOREQ Server pages.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Could we perhaps add a Fixes tag here pointing to the commit introducing these
DM ops and thus add this patch for this release? Not sure what others think.

~Michal


