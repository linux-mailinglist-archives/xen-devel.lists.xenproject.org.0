Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C779B04991
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 23:33:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043083.1413210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQnz-0006lX-D1; Mon, 14 Jul 2025 21:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043083.1413210; Mon, 14 Jul 2025 21:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubQnz-0006iC-9S; Mon, 14 Jul 2025 21:33:47 +0000
Received: by outflank-mailman (input) for mailman id 1043083;
 Mon, 14 Jul 2025 21:33:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbYV=Z3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ubQny-0005Nd-Eh
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 21:33:46 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:200a::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36803724-60fa-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 23:33:44 +0200 (CEST)
Received: from CH0P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::22)
 by LV8PR12MB9269.namprd12.prod.outlook.com (2603:10b6:408:1fe::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 21:33:39 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::66) by CH0P223CA0023.outlook.office365.com
 (2603:10b6:610:116::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.33 via Frontend Transport; Mon,
 14 Jul 2025 21:33:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 21:33:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 16:33:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 16:33:38 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Jul 2025 16:33:37 -0500
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
X-Inumbo-ID: 36803724-60fa-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VI92eU+SGkDS/YyxhbCybbxSqM4RZZ9pXgs1IXbLYCQr3HIiKtbGlaQEn8V0wfV7WljtXPB9Scezh30b+uzbSoBsa80olz5rMMCx5meq3LMfYvu4qX2Nr/2spx0QiNhRSu3Sg4++2KpYNWPjdA2hVCyola5zEnLSMc8Rmy2dR4aSBlWgixc+WDFD6e0HUjddF7LKKtFwP5MlnqaYz2Cri/aOWbngzCkKcNnn9YcsyiPNLUTlwXPScUIj5o3Qg9OzDC2b7fB42EtZPLGV2IhYCboaye6PYgUK3JHL9xdkKYbAc7kC7oQH4CmBJt/ZldRAeeE/PqaDAXX0Xgfg46wXeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W955Ck3xYowQDrCmixEU2D1RaMtBk5CPTRQB8CiVo2c=;
 b=qM+a3X474S8ALcpPu9GkXeRz2cuGfNgvAdJo+Bd54H1OZ5GgrISHXG4XDwQ1ChFBx1cyAtrBYGPZxALMVu1R8xF4b1wNfr0i06pAouLaXaS8ZF3hall2v/W/9y6reHNVITB2LXMoKtGoPR3T/QIcdI2e4+qHmeA7r/op40j3VLEF5ahGKwdUxgmOmtAxD4V2gJ6ds94A98JuSTwBJnlrBc+3/ckwylB/++AbkbXxGLwanBnsrGhCArhXAzA8gQvM8E4n7RMKBMuxpPdBRyHj+z6gbU349NxlWw/t/EnvQylEiGW9p7mNub8izboHkKbUv+WgvM/OanTEyx1NjDbJEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W955Ck3xYowQDrCmixEU2D1RaMtBk5CPTRQB8CiVo2c=;
 b=HXn0KqrpdjA5No8Z4dWwAhaIshxtp7OgKCsrVT8GjBVxgrd34pfa2i/3BQtW0Lrum5bEQ1yZ2fYGi2f1UtheFopo8lLrrGYQRoGu8ocaIZ9HXUjHhLGQXNpjCknqPxZtCb5W53l5fUjtF2Mo98xCJhwDfEVHTyfiGrSu76HYcGg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d8f6cb65-b97c-476e-9894-f8028e675a14@amd.com>
Date: Mon, 14 Jul 2025 17:22:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [MINI-OS PATCH 16/19] gnttab: remove gnttab_alloc_and_grant()
 function
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-17-jgross@suse.com>
Content-Language: en-US
In-Reply-To: <20250702081254.14383-17-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|LV8PR12MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aedd5af-62e4-4124-aa3f-08ddc31e1936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3Q4KzZaaDVNZldiRUR0VnBXZm1HSVV3L3VIdncxd1VlZm5vdnMwS1AzOVdC?=
 =?utf-8?B?NkEwM2NZaUZsR1hhME43YlBDY1RkcXQ4NEN2QTVLUWNGTGVOVXRiRVM2SWIr?=
 =?utf-8?B?dlplSmRDWnpCNm9nSkYvQm15RDREeTZybFRqekdTMXh5NDEvL0FFZ0FWVUFV?=
 =?utf-8?B?T0NzSzJNWUQ0bm9la3I2UERZL0FWVzQvcDBGbXZhek9nR05jcXNVTmtzbDZp?=
 =?utf-8?B?RXltcmIxRHF3QjdscnFVZndMc2pSSDlSb3ZuNEhsOE1YNU42QndvS1RZbXYv?=
 =?utf-8?B?dmtjQ0p5U3RaNm9FNTNtUnZad0gyMVA2SjVsZHZRejNPa3gxYjdrTzFyTmVK?=
 =?utf-8?B?KzRZcmtKeUpIQzVKRjMrcldTN3Q0emNyZ1c2Nmprb1BzU2JqR0JReDM5RDlS?=
 =?utf-8?B?aVlxbHhzQ240bVEyeHFRdFUyR3VKQmFnWXVXOVlFTDZ6aHRjV0JjRDZNNzIz?=
 =?utf-8?B?Q0xkQ1VTWjhwa1BCUCtsQUJlWGJKYzhCWnFMNkdKdWo5T2Jmelc0Mmx5OVVZ?=
 =?utf-8?B?Kzlpcm93VnZwK0VFbS9KZTJoRmNjSTJDUk1DZDFVREZlSG9RdVUxZVZQUENl?=
 =?utf-8?B?OFF6T3VvU01iUTI3SnNORzBjN0V1YlpYdnRvcTlxb01XUXRHRW56cmo2dFA4?=
 =?utf-8?B?VElaVGpDQncwMUtIcWxGTGtTZlpFR0J4Mk5lRFc2cWxEK25hYXJNM2lNaEh1?=
 =?utf-8?B?cENBclFKM0xJc3BBTjRmSzYxYTNsQWQ4eVQ3T1ZBK0ZST3ZZd1E0RnFOYjBX?=
 =?utf-8?B?dWJ4QkZVUk4zS3NEaWpMVmtUSGV5MHJtNnVKNmtUdSt0RGNST3NzQlJ0OW0y?=
 =?utf-8?B?T094bUgvaE4zUloxNEV0aEhVVkRSc2hNaDZNWjFhcFlicWJSVTlMU1lWNEN2?=
 =?utf-8?B?TDE3MldWazRaQU5UMUhRUnluQkV5Wm1oeVBpbGxiNmFDaVEwUHFtdDFrZ0FM?=
 =?utf-8?B?VFlCSlJFOHk5blpJYWFsN09Od056Y2pXQzVhT2Z5UHFVT0t4bzJUcnJ3MHY1?=
 =?utf-8?B?dTBTUndCZE9CZlFFOU1WQWtDOWJNbHJnOURKZWhaREF5SysrekJVZURvZitU?=
 =?utf-8?B?OFdUVEJEeWU0Z1J4cnBYYU9LM2VUZk5qVHNnVmpHL21RM2xXNG9Hd0YrODNz?=
 =?utf-8?B?d0NsQmYzOS9RYW9oeCtUSE5CZkFSZ3ZsWnZZUTk2ZDdHeGEzWUVRZjVwc254?=
 =?utf-8?B?NkJyZTF4Rkk2bVhBZ0ZRSEdkQjlvZEpNek1naVRlWHViQlZFY0FtVys3MlVk?=
 =?utf-8?B?c1hHcTRSdXFNWDBsY041OVFaNmQ1OG5lODR6bnJ4c3NPeENSVEUyWmFDZlZX?=
 =?utf-8?B?MTM1dkxlRitUamQ4NkhsZWl2eW92M0d4M1h0TS91WGZwWUFFUnFESWRuMlBI?=
 =?utf-8?B?RW51NC9FcGRtYjBMb01Yc0k2RitEcER4cVdTcUMva0xtM25DU0JNbW4yU1RK?=
 =?utf-8?B?SklNYk1Cbk9OcjlUdUlnalFtTDdZaUw1dnJuM3VoOTE4WnhhaW9vbmlYWkgw?=
 =?utf-8?B?M1BqRjVLZk10QldFQW4zM1RjeGN0QTJjSHUyWlZnaE5La29YU1VWaTRRNS9n?=
 =?utf-8?B?VHFlbmFiWVBEdjI4bDZESkNBaDlHNC8xQ3lPYjBab1hUY2YyUGpBc2ZnUnNi?=
 =?utf-8?B?SVZHNlNFdjFHaUVCYWZJa3RwWWMvM3JCam9Oc1pGZk43bUdqbFFwTTRmZDdI?=
 =?utf-8?B?cXcrbVdFd2RFQ3h2dVVjWGNCNUdiQ0c3QTBXelN1RnkxTEtDT0hHRTZ0VWlO?=
 =?utf-8?B?d3ZlcUZnZnVKOWhEZUtjUGRubXFseUpKbWJybjgrUUxpSTVDMndaUUIvVngz?=
 =?utf-8?B?c3lvVW9iU0FRVnE2cTdxeVVHSEZZNHExREhqRllSUDM4NFVRU3pkczdrZE9Y?=
 =?utf-8?B?VHpEUVhUdG1ibTZvaUgxU0ZuY01JT1dkY1NBOEtTT3I3V3YwRlo2TmtrbmlW?=
 =?utf-8?B?Z3VZbmpZTSt2MnBIMUl0UFAvN0ZiRmFpM2hhd05PRFQ0TS9sYjBNV0kvM2do?=
 =?utf-8?B?c1h1dnpSUUdKREtrRG5hRWRYUloyZGpXZ3F3RU9QbVdzVmF0Z3lXZXl1QldM?=
 =?utf-8?Q?mWdv3H?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 21:33:39.5168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aedd5af-62e4-4124-aa3f-08ddc31e1936
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9269

On 2025-07-02 04:12, Juergen Gross wrote:
> The last user of gnttab_alloc_and_grant() is gone.
> 
> Remove gnttab_alloc_and_grant() as it is doing more harm than good.
> It is hard coded to only grant access for dom0, which is not really
> clear from looking at the function name. It would be possible to add
> a domid parameter, but given its now 0 users, there doesn't seem to be
> a real demand for that function.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

