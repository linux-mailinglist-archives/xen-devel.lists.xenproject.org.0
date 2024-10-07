Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3C89937EC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 22:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812409.1225143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxu0G-0007LU-94; Mon, 07 Oct 2024 20:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812409.1225143; Mon, 07 Oct 2024 20:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxu0G-0007JP-6N; Mon, 07 Oct 2024 20:06:48 +0000
Received: by outflank-mailman (input) for mailman id 812409;
 Mon, 07 Oct 2024 20:06:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EMKW=RD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sxu0E-0006Z9-V2
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 20:06:46 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:200a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac699f9b-84e7-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 22:06:45 +0200 (CEST)
Received: from BN9PR03CA0863.namprd03.prod.outlook.com (2603:10b6:408:13d::28)
 by IA0PR12MB9009.namprd12.prod.outlook.com (2603:10b6:208:48f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 20:06:39 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:13d:cafe::41) by BN9PR03CA0863.outlook.office365.com
 (2603:10b6:408:13d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.21 via Frontend
 Transport; Mon, 7 Oct 2024 20:06:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.0 via Frontend Transport; Mon, 7 Oct 2024 20:06:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Oct
 2024 15:06:38 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Oct 2024 15:06:37 -0500
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
X-Inumbo-ID: ac699f9b-84e7-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aR7XlkQyUc03fpI1OHMfTyTFkCfdshBIzntYIvfrXtekTbZ0waOo/8D5Tvdh7VLqWgwvyQbSG4LUf3dEv+EHJAuE54IEhAPDIYwSLpfVpusXEwmpZ1NiNB4Cb14ZkRV6S73sBcXUTk2IjG0p16drv9FZ7NKQYDEj4HXklknqzH6XAud0xep4VoqUMkdGQ056vIiZZigbBXDZw6PlS73CuB+k23X48Js4Uh7tJ5qUCfK1cEaBz5HcAy9AgRNyzBPRzioLhLPxiGhNH9i0lWAg2DeStdMcr23y72IwM1GL4aNjCJ38+4j8U5umlJTiqXlwSKIGi8ThPT8DVnAiM5ieTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrLGksyjXFFJ5wvDTkbI352fbo+xtAqIlEhAL1dPVqc=;
 b=LTuP0k3wESB9xbDYAatIo8LDrHrinyOkaYTv1PueoDU1o/XVAr59heSxI3QndxyHwCiUM78Bhsi91vUBHyaGbFp0GNsA39OgKEIA2kahSIS6qPtp8StWKWXcedf8eTgEesKj1X8EOeJCY9UXfACTCIoW5JVhkje3LfJ2ocqndy8dlNOa+LRIUCNbLupxjgp6eObaJJyLzlnCpKHqu46gdmipNSeshWZRgAaHDY7aOoDBY+011for+P93oF4URs8waKvAIKTRA4Ag3eYIK+/N1PxfD0aUeH83k1iNmAaidmgRfcYusoD1+ZjA0hMmZ/ZxAapFJ2+DudfXcIWFM7YrJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrLGksyjXFFJ5wvDTkbI352fbo+xtAqIlEhAL1dPVqc=;
 b=C5NAwfVVYmY1Tpxfayr/hxDYnvPvUL2NU4XDZKrqeAHwIRTE9nE8W20ZF6tsTirSN4ce96Ykz/Ty4/bwTzJrAloep32r6WgUeLY6wm1k+5VD8KcSpi+8o2fzfdf3F8V/zoiMn3IlZN9aOTbiwVEkxoI/bqnaOdOImVaorrgLTDc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <63bb9a83-7f54-43b9-99b6-e1dd40361763@amd.com>
Date: Mon, 7 Oct 2024 16:06:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/44] x86/boot: add start and size fields to struct
 boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-13-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-13-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|IA0PR12MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: d165b028-5b68-470e-fa55-08dce70b8df2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MW5idU5FQkhhaUJFQzd4emF5WGZFaWtmUG1BMmErRG54dTRrMThKckV4bCtK?=
 =?utf-8?B?RU4yS3dEamtrWHkzWEswbFhJVGQxT214c3oyQXMyaGI3M1dpMGxLZEZtSGJH?=
 =?utf-8?B?Q1dWWjZ0b29XQW82UnJrN29jeUdSOFlaZ1JvdmpHM2dxWGNCVTJsdzVsUjBC?=
 =?utf-8?B?RDFNSWVnZVVkY1laS3pWYnNTMDJKN3gySS8zVGZaQ1FVcHhwV0QwSDZHK0N3?=
 =?utf-8?B?K1ZHMVlESlkrWmQ0bU9mTmJVWXFLNmtPMDFZTXFRYzNGMG5iVHk4eHBZbTg0?=
 =?utf-8?B?Si9QQktubkZyQ0dyanlGV1RzMy9rU1BBaUhoQVhuNkdLRGxUYW9hVWlmNTVv?=
 =?utf-8?B?Z1YwcTF0alc4dWdkaHFUMkk5eXk0RUtVRlRSNkJHbTJTSmRsZDFNblp4dDZZ?=
 =?utf-8?B?cytVQWdyR3piSGtKZ3VoMEJNdTR1YXNhd0tzeWw2elJYWEFsQVliUnRJdmhF?=
 =?utf-8?B?LzF1REtIZnA5dEQxbXZYblZFcVA3dnE1WW42NUhGVmtMMlZaT25EclZHY0J1?=
 =?utf-8?B?aWFDNzZhd2pwZkNndzdYYmovTU1aczlnQWRVMXJsblp0cWdsK2RQTlFHWG1C?=
 =?utf-8?B?MWxCMG04T0pVRE5qTkhIdWtiK1JCL0pnc3hGZVpGNXh5bEtrYUdCdEkxa1BM?=
 =?utf-8?B?L2ZWRG83THRvYW5TaDZua2pWSWZqOWtQV2hlUVlIRUZSWjhoU3VEa29KcG50?=
 =?utf-8?B?bytLbGR5c20vY0lHcWRoRm9sWHl2bWFPeDh1VjhIUHZJeE5HTG9ZQ3pBVGtQ?=
 =?utf-8?B?OTZzOWFzQUdESEtqdExYNnNBMVhjZnQ3eUxUVjNROHd0alJ5NE1BMWdkdGNo?=
 =?utf-8?B?OE5LcEdLbUJmZWhYbldpK04wSXdNNmdDeE5senpYNmlpaFVBNnpFU2dpZTFH?=
 =?utf-8?B?NzBodCt2Mzl6MXhqN1FRZzdhTjFhaUJicVN2bnphYmFZTzdVWUNiOWFBcnlP?=
 =?utf-8?B?c0lPNDc5UGNNTG9DYk1VQU5ReVovd2RXb0xyYVNkUWtCM0NQbnBqcGYzTmtT?=
 =?utf-8?B?UTRlMWxOaXNDOXNDaVNnRlBGSnJTRGJ2MXJreHQzV3MrbTZkTWg0QXllY2NL?=
 =?utf-8?B?TUM3SG1jZStMVWU2RFFyL01TRHV4TDhoamZqaWhoc3R3UDdHK1NIdTRHVy84?=
 =?utf-8?B?ZjZmV1U3MEZ3VHd5NmlCV1QwY0h1T0dDaWNLd2dUMXNkYmFGaVBXU0JZUU9H?=
 =?utf-8?B?YnZNRThMYkFOWmJJWlZZM0FhYWh5OGpXTmVzeEVnbzBwVzJMeDU3VjBDUFRj?=
 =?utf-8?B?RzFTYVhrcU5aNnUxTy9BZFlwOWhzbU50TWVyaEhpVVFkaEd6NEgwTi9tbnQw?=
 =?utf-8?B?cCtVRHFqS2t1TU5HaHN6bVlrOWRZT2pmTkpQWWZ1RjZwZU12VWtOc2Q1OWU2?=
 =?utf-8?B?V2J2TWovVVhpei8zQUdaY3FJZk5uVkV3MFEyd0xRTTZXcFBkVU5yVEp1NVpI?=
 =?utf-8?B?QnFOZUt4N3J0SXhqZTVLcW9iZHRVcDBqS0FzbUtKNjFiRGJqL05Xc3NHZXUr?=
 =?utf-8?B?UGNDWE8yU0JFUWdZUW8vL0Z6Ulg1NzExSnMxWm9jbnl5QVBibjlUOG1Pakpy?=
 =?utf-8?B?MGZTMngwTDZZdXBpNkVrMlhteGw3Tk1FVXFSNUtvZjc1TTBxQmptWXgxOWJ0?=
 =?utf-8?B?b2xHOHgwcGZRMTJMYmpZdGdUZmRRN3M5UXlHcW96c1RCcTdvNkQ0WXpOUXhL?=
 =?utf-8?B?VjExSUN2dUZqTGN1Um9jdUxPQ3REaVFYRVNldys4UXRLY0pzUzJSOG9sbkFN?=
 =?utf-8?B?MDBHSWloVjRmcjM5c2RNRnhPTE9MSGhKZmRNV3Y0dEcxQ3RLL0hWb2pwUllr?=
 =?utf-8?B?MDhoUWhKS1JucTVmdC9EZ1JEZVdzdkdkR0I4ZlV6MXdaL1pBMnV2RFZ4MXhz?=
 =?utf-8?Q?5T66GP7KlxSIe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 20:06:39.1154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d165b028-5b68-470e-fa55-08dce70b8df2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9009

On 2024-10-06 17:49, Daniel P. Smith wrote:
> This commit introduces the start and size fields to struct boot_module and adds
> a corresponding bootstrap mapping function, bootstrap_map_bm.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

