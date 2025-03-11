Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B82DA5CF0F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908908.1315941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts51k-0002B6-JB; Tue, 11 Mar 2025 19:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908908.1315941; Tue, 11 Mar 2025 19:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts51k-00028K-FU; Tue, 11 Mar 2025 19:12:32 +0000
Received: by outflank-mailman (input) for mailman id 908908;
 Tue, 11 Mar 2025 19:12:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K949=V6=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ts51i-00028E-I9
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:12:30 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [2a01:111:f403:2413::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5dbc595-feac-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 20:12:29 +0100 (CET)
Received: from BN0PR10CA0028.namprd10.prod.outlook.com (2603:10b6:408:143::34)
 by MW6PR12MB8758.namprd12.prod.outlook.com (2603:10b6:303:23d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 19:12:23 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:143:cafe::50) by BN0PR10CA0028.outlook.office365.com
 (2603:10b6:408:143::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Tue,
 11 Mar 2025 19:12:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8558.0 via Frontend Transport; Tue, 11 Mar 2025 19:12:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 14:12:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 14:12:22 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 11 Mar 2025 14:12:21 -0500
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
X-Inumbo-ID: c5dbc595-feac-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWdgP0GeDdodL25s3VNNe8tPsMm0+6w6Efw+7cvEgya1X21x92MFR73p8cEV0FFMxkoNLMsCLoG7hou+beEoCLDKULIlXpaIV7NMcJ9UF6w7Q0khG0lypvvujV6rDUx9E1UYbUdhihfCUf6N24ye6uWA5xpf2V+TkeGO1KEy4ylWA9s0AT01tK/8ccq2DIwPF+5/46/Wn1fX/RZHhrJgZO2JLGps4Kq9gzJxALnil4L7TObsQLFFG/N1A49FA46zH4Y9Js4IPX/JDYdFJL272qrMK0CZ7w6X2rO2Z4pFo90e1QrpPslpfj/Ig23x3rCZWsBUzJsgUt3cxHaJLOUCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAq9LAI09hmZ0pSI0FVb34PvYl3m6Ujrztbyo1DIHeU=;
 b=aN0QGsz4QKuYDSAymXAW9yPR/avDZZSGLCwhtmYqvXXlTTb931fQJVykCkgAQZVFMa/QuIOygh8Ke/UPnv/iRyP1wgj3jKgwbrKKqaPUUtBng+P6GyGoNMowA0u1fJbJSSAf3i/f5sFJXmOrQNut92C2sAb8GQj4B9nv0wjanGJ5J+5eiJ8eaadkjcUUnGzcETAaGpqmlXfWuyQ2e04GzWEVmeM4uLLXPL9QgruCe0qwZ8N4ITqAVYPJHYCOQhg0cheULh3cXMKu5lZtbxtbjrvDpAMkGOgFpf9TkVuhiNtAwfhHBYWCuvqD6HTBy7YoNtNLzzUcJ5U5xXvoSUCkOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAq9LAI09hmZ0pSI0FVb34PvYl3m6Ujrztbyo1DIHeU=;
 b=q4FRFGV14Y/OMizctqzf/CNTYpMqe1z+lmTij8XltTAr1byM71YNXdK2fnJQjPcKd/W01lh4HM8SEWoVe1UyFGZqDQL7jerJ2agJzjQMTopYOdbtetB/pdlXAOeXe+UuuxfROHGvEVwIirnQw8FtsJ2af3ofDqlT/BojsRYemsA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <55c35901-de99-46a2-891d-991925e9bf7b@amd.com>
Date: Tue, 11 Mar 2025 15:12:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: add explanation for 'Resolved:'
To: <dmkhn@proton.me>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, <dmukhin@ford.com>
References: <20250311072805.778362-1-dmkhn@proton.me>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250311072805.778362-1-dmkhn@proton.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|MW6PR12MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: f40ebe40-b11d-4fdd-2c86-08dd60d0a707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blJYd0tsTFQ2Z1Awc2pjeGlQMmJzTFJNN2RFbWJCSlMvRWtPektxSDV4cytC?=
 =?utf-8?B?dG50Qm42RWY2VWdzQ2tab1hlbGMxOG5CbDdTQVhyYm85blo5TllrODRRUUV0?=
 =?utf-8?B?UWZWVUtldmdUMHVNSDVNbWsrb2NZZWh6WUNZaDdpVXdtbCtpQlFPbSs3Uk1D?=
 =?utf-8?B?TkFOdm5ZTEdIc0ZOMUp3RnhHYVRaWHVrSmNreGJ4eTQvOVRPZGduVkNpeW05?=
 =?utf-8?B?NE5aK0dqMVVEUXVlODFXTDhoaWZzKytSWHNDN0tuMGlPdE5GOURvTThKYWJ5?=
 =?utf-8?B?NGpLOE8ybHora1NhZUNJUzgxSkQ4R090YWJ6TUlxN2cyQkZlSzdVaTZaM21C?=
 =?utf-8?B?YzlyWFROOUp3ZFhteXc3NnpRRG1MNmpPL1pMTjVGOUp0Yk9qbk1wdXhFRStl?=
 =?utf-8?B?YXVrL2FyandKRGFrSmpHdGNzbXN0UjVSejN1MTZGYnNXamNVMExLU2VXVmo3?=
 =?utf-8?B?VDMvbGVBZTdnWG9mcVR4RTFnNjdjLzBPRk1QSkFWWkJDS0FMdGRCdnMyY1Ni?=
 =?utf-8?B?cW12YjJqNlBNRk05YVJtN2lpTnFhNVhCUzJHR0VhYklQL3hBV09GVm45OUF5?=
 =?utf-8?B?SHFaWmdNVHhqczdBbGxLTGFNbU1SUjVtc3FIbmlyczEydTI3Z3Rrby92bHor?=
 =?utf-8?B?aFBUc3ZXUEhod0hFdTM0SUpLdEx6VXVKVGUra0dBNVExUUl6WVlLOFZzQ1l1?=
 =?utf-8?B?U2pwQU9CUitLMTFjNlRwS2xobGQxQys3OXl5ZU5VMEdmeVJsWVR6cWkya1NV?=
 =?utf-8?B?N0lhNjNzaloyNjNHRVQ4TWlES2hoTDg3ZkY5bXFvKzJER3NMK0ZIYXZYTE1k?=
 =?utf-8?B?OFEvSUp6dnIwYk5ZZ2NZY2xSdjQyV1IzLzVaVDFSbXU5T0tnSngxa3VzWHoz?=
 =?utf-8?B?cnU0S1FNaTFJWmh4QUFnVVcwanJKM2tQR0FacVhUTGNwY2JkRUxZZ0RXRVdq?=
 =?utf-8?B?K2VTRkxheEVtVkZqMlFMQ01TaHhWeUxYeUJ1QlNreUhVY2ZuU0FCNEdzZytS?=
 =?utf-8?B?YTFiRytqS1lnUm9zbGIvQW5yOURCdDBsNXdXcDhlSFFsMFZsSERMdDNQNEJJ?=
 =?utf-8?B?bkRPYWdsTVNxNER0VVZIUUN0SUtKelhjcnp3NmNjWEZqQ2FYZFphL1BuYlhJ?=
 =?utf-8?B?TFVxdHhGd3hVTUFYaTYxZk1yb3RyT1Z1R3J5SEdjZlpieFZDSnJyWThBQjk3?=
 =?utf-8?B?SjVDWU5HWFpiM3M3ZGRPTEpKdWRwcXRWalpGTW9VYnFGT21rNjlKTHBpQ205?=
 =?utf-8?B?S1FrcGlhY1BwZ1NUSWZVT1ZMazUrZnltRXpNcDZYN2NmS1FqOVdENzlLaVFB?=
 =?utf-8?B?TTBhZ1FhSzZ2V2lFQ0RCbDd2YkJJNjBYZHBNWEF0dGNtNk1lSW5xdStCQkJ4?=
 =?utf-8?B?WUhobWs3WStKaWhqd0N0VzJ1WE1xcmtXU0tjeGMwa1U3RldBN29MR3doak0v?=
 =?utf-8?B?cTJoY3NTSllyTFNLbkcxSVV1bGowVGF6K2d0cmlpeVIvYVBYU082Z1RTMGFy?=
 =?utf-8?B?MTNCRG9ZTDNGMU5VRW53Q1F4anRFRm1wWGcybFFqOFcxa1pZc1EyQnRQazVX?=
 =?utf-8?B?MFBPbGVxckdjVFFIR1FuRFljRG1KMnF4RTgvUitxL0cvUHlyZ0NyWDgyU3d3?=
 =?utf-8?B?ZUk4QXc1YjJnejJyRy85OVhGK01QbFlsK3RNcE5xRDhMSWRvcXRPdWJ1RVR5?=
 =?utf-8?B?UXFEeFVmSGo0MUhaSmJIWlZRSUwyTHJFTWVmdjg0SUEvZ0JDMjRXMlc4aWRo?=
 =?utf-8?B?eVU4M3FOQS84UGwxTmFQd2ovbDcyOWZldEdheG9sZ0M4SmIrUExEajhKc1R5?=
 =?utf-8?B?cGNXT2QxeWlDc3dGT1o2ZTY2YnY4RWRONnZnY3MrY0pCbjFFQmhBMlFHZUIr?=
 =?utf-8?B?RGZjbmE2aUwxR1k3dzR3WXVPcmRRaDdpalBwWllTUGRzQjlCNHBxdk9nSkdk?=
 =?utf-8?B?S3VaSGl0UnRscytOOE1oUTQxcUNBOVo5dmJ0MUlGZEFvVjB1OWFkYlFYWnNy?=
 =?utf-8?Q?uxAy7/ouOugoOQ9WFwqV0M+SdDM0WU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 19:12:22.7738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f40ebe40-b11d-4fdd-2c86-08dd60d0a707
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8758

On 2025-03-11 03:28, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> 'Resolves:' tag may be used if the patch addresses one of the tickets
> logged via Gitlab to auto-close such ticket when the patch got merged.
> 
> Add documentation for the tag.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

With the commit title change,

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

> ---
>   docs/process/sending-patches.pandoc | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/docs/process/sending-patches.pandoc b/docs/process/sending-patches.pandoc
> index 2e74c3b57e..9fc3b407ff 100644
> --- a/docs/process/sending-patches.pandoc
> +++ b/docs/process/sending-patches.pandoc
> @@ -106,6 +106,18 @@ If git was configured as explained earlier, this can be retrieved using
>   ``git log --pretty=fixes`` otherwise ``git log --abbrev=12 --oneline`` will
>   give the proper tag and commit-id.
>   
> +### Resolves:
> +
> +If your patch addresses an issue logged in a GitLab ticket, use the `Resolves:`
> +tag followed by the issue link to automatically close the ticket when the patch
> +is merged.
> +
> +    Resolves: <URL>
> +
> +E.g.:
> +
> +    Resolves: https://gitlab.com/xen-project/xen/-/issues/185

(I'd find it funny if you created a new issue about documenting 
"Resolved:" to place as the example.)

Regards,
Jason

