Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824959D8D5D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 21:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843128.1258777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfcN-0000qr-Bz; Mon, 25 Nov 2024 20:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843128.1258777; Mon, 25 Nov 2024 20:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFfcN-0000oZ-9H; Mon, 25 Nov 2024 20:23:35 +0000
Received: by outflank-mailman (input) for mailman id 843128;
 Mon, 25 Nov 2024 20:23:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=caTh=SU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFfcM-0000oT-1U
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 20:23:34 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20628.outbound.protection.outlook.com
 [2a01:111:f403:2412::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f01b113-ab6b-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 21:23:26 +0100 (CET)
Received: from BN8PR04CA0049.namprd04.prod.outlook.com (2603:10b6:408:d4::23)
 by IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 20:23:17 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:408:d4:cafe::c3) by BN8PR04CA0049.outlook.office365.com
 (2603:10b6:408:d4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Mon,
 25 Nov 2024 20:23:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Mon, 25 Nov 2024 20:23:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 14:23:16 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 14:23:16 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 14:23:15 -0600
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
X-Inumbo-ID: 1f01b113-ab6b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjI4IiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjFmMDFiMTEzLWFiNmItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTY2MjA2LjAyMzkyMSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ui3BaD3lADjIh1VQHtw6YraMhdLf1nGFuT1Cy70vEeL0IyzSRs3mVL545kbrvBAVZPGSCLFuYu2j8b0EIWpsgl54MVtt/ORtgW8SPu7iNVGQE6ZAV3ufumNXT+gi2yYbnbKMwsd+YKGksX4eqR4o08BDBbOwNdBJ1mAZrH2iwqhWZQUhOtIky7fg7/xraohNH7E/zCfIIJQk1lmI57W1h/JZSjps7ObxnDmlsHDMWR+lampRqb2l2R/ne3ZartgMiujXuW4UbWGhPFOGuKMUMrtklusJSXLwmNoQiiNj8nbOUX3NChhMRzgHao6Y7jeHoIq/xfNACjnylHicikS8mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2IBpHKf/FfD+ytFu+hb1KXEoec18VgnUzjoAPbkAns=;
 b=VUlACeoFqCTECbLNctJlUvpkGOAM8LjBfo9h06k6nstlpYrVEmKd9aN9i7DSwAvpjms4xst0IxaA6cPXvgVTRexgoS4dMHQR+J7eVeMjnJ1ih+jFZvtT/XOhQmsWOUTbVFjWjlzHiFKx5vfIeiMsUO39MNyv3NLM0xPbgMi0VosA4Og45THmTzRZ89zIv6vgiZo47d7N1/nXxvLfUhk1CtjNYnFTKq7wjYvtFdLGuLXu+kTijlxcEJ4Jzows06mBOG20he73ZEH4huOgakddOQzFqI9scw0tC61uS2sRUR/F2We4k9nrQifmo2tIv/heFxtD8oCH18P6LzgRgS/4eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2IBpHKf/FfD+ytFu+hb1KXEoec18VgnUzjoAPbkAns=;
 b=gCZicZoVlVBQRpHQR5e/4DwfUyxzI/oyTfIMLp0pSa2iFtB4DdslG7LspvT8QkAcrHSpboRZLjhDxdIzXppLrv/8Jg0TjVfBXZqftrGnQ5PDoTuzkUQq7uHSrU68BTYSVHa0vZHJPKARPJ/UX8icQCExih7ziJ3olAfoxtvBLxo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <acce4c7c-f9da-4b89-bfb6-1967f4eae41c@amd.com>
Date: Mon, 25 Nov 2024 15:23:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] x86/hyperlaunch: introduce the domain builder
From: Jason Andryuk <jason.andryuk@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-7-dpsmith@apertussolutions.com>
 <f8f375d6-2b77-4d76-ac69-89d850ac4733@amd.com>
Content-Language: en-US
In-Reply-To: <f8f375d6-2b77-4d76-ac69-89d850ac4733@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b70e16-6fbf-4ea3-4456-08dd0d8eff15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnlQekFkRis2UTF4UUFrNmVETklmWURaNngyY0RnZzFSMEI0OHp6a1ZCNzdt?=
 =?utf-8?B?SzI3dk1RM1pLcllMMW5zV2NaWXl4RDNvaDQ4dGxjWVlCd3NtY3IwdGN5SWJk?=
 =?utf-8?B?MXhVWFpTZHB4bU9EK01Wd3M3UkZucWxYbWYydGlVYmpGa0VjREU0QnNWYnBi?=
 =?utf-8?B?Q3VZQmVHYUErLzFpMVdwVW9NN21YV2Z3MkF2SG5OcHdvN2puWVhTZ3R1VTUv?=
 =?utf-8?B?SW5tSmx5QjdhL3kyclRVUWw3c2JMSHFsVUVSOVcyMUVwVGVVVXRvTkk2aW5Y?=
 =?utf-8?B?K1hRWno0Yk5vWWpCc0NVN3IyZWN3RWlFS2gvaDdocmpaQmIwZWhOVGFsK0dL?=
 =?utf-8?B?d3IvMGl6QWJBMi8wencvS004QkxRU3g5ZXZJaXNPbnNNZVFuM2pRZVRlL2tx?=
 =?utf-8?B?dzBSRmdnZTFBUHFJM0loSDEzNmhEZkRCdVhaMzUvRkFzd1NaT1JGUVdHV1Zj?=
 =?utf-8?B?S29XZkJmZkZBOUVGSjBuMmJlaEp5OVh5cE5qbFZobTNoYVpWUEkyQWY3Y2xk?=
 =?utf-8?B?UU45bHYrQVBONzBNK0daTDFVU3VOZ0tScUd1UUlEa3ZxOGI1eXh5SDhoOXdY?=
 =?utf-8?B?eEZFV1dKTyt5TlByejJpVWxPWkRyV3ZKdElJQnNuZ3RVSzU4YmZpQjVnSnVV?=
 =?utf-8?B?S1NrOXpEOERHMFJGRzNuODR0QTkybSs5WThBYWxZUlZEbkdsYzFSeEVyYm10?=
 =?utf-8?B?UEdQdHp4WUEzS3M2WTlGcU9LNHJsWmM0ZS9SY2p3MFlGenRTR2JJYW40TUhi?=
 =?utf-8?B?Y3FXTkRLK2xuckhQZWM3eEMzRUExMUQ3UU9sM3VkczlidVNlUUJpQ0g3Uml4?=
 =?utf-8?B?MkJqRTVaamNzRXloNkpZWFkwMkt6VDFsejExdG9ZR3M5RTdxS09mbnlWOE1O?=
 =?utf-8?B?RHBlQ2JFUEkxU21oWnJBeGpkbkJVcXRWOW1ublhxRlNrWEVFMzVhcHNVM2M5?=
 =?utf-8?B?VU5nWjNCS1VHZjduOUlqUDFXVThyT2pCZ1FCdVJpOUkzYW42S1o2Qkc0L0RO?=
 =?utf-8?B?dlg3blkwb3hLeWpTQUQ1eWFmU0I2MHgwbXluSlBwdWxLN09VeXorQ1RqOGlE?=
 =?utf-8?B?WlcrL0I1NmZIcy9yR3RTU2oza2FXL0tQa2tCamlFMlg2UGFHWE1XTWpPdUNU?=
 =?utf-8?B?RE1VVDI4azlja3hnN3pjS292MXVmVlVyclgvT2p4U1hjbVJvVS96Y3RYZVBs?=
 =?utf-8?B?amxHQks1Qk9xRnVRaGRDQU1BN3FVbWI4MXhURmpBd29yUGI1NlFRRXpFTXR6?=
 =?utf-8?B?RXdNTjJoQjgzWnBnU3N4Q3Q1ZmxpYVcrSm9YUjZvcGRDcWVlL2xLVGU1RE8w?=
 =?utf-8?B?R1RtREhEOU8xa2lZazZXZXBNMy9YNFJpejZjbndsTEQyMHFpV3dVZXlQR1Zp?=
 =?utf-8?B?MjdidGFxd21jdmllNGNQaUEyOGNYUkdRN0R0Szk4MU0xNG1sVTFiNFVPaXpi?=
 =?utf-8?B?MUpCdmJuMzZhZk5qaFBGUjVka29mNU11QW1RZElRWTdjUHFrRytKb1FCQXZx?=
 =?utf-8?B?ZEEwYkFER3ZLeGVadEYxdTBzd2l3OS94NEE3RFNTZHBjRk9aOTN2YUNLNkV2?=
 =?utf-8?B?VkI4NXgzd2hCSFIwRHE4MlhBMEd5K0E1ZWJXU203aVdWRFI0aXNIYkUyLzY5?=
 =?utf-8?B?dEFCYXZSUldiQVV1TFNueE9GbnNSMktpYi9OTHltaFRMQ0dldUhNMU9lK0Ux?=
 =?utf-8?B?RFNvNzYreUR0UFpFKzZRa0xUdDZFbEw0akdDZHRXcTNXcTd0Z1Q0YVpyaDUy?=
 =?utf-8?B?ZnIxZkVrbThUNDdXK3B4aGpFSk5YcmI2TE1lcHNKRk4wWkp4OXFGeXZOQjhN?=
 =?utf-8?B?R2MyK1J4Tmo1NDQ4MW9UTk16YUVuWFdBdGJQVWU1RUQ5SC9SR0RPU0FYR1Yz?=
 =?utf-8?B?dVhaZFlET2s4VkpITGk2OWNwd3lEbXE5RWtzNEdGWWJSOUtKbkNVd2hyMmFm?=
 =?utf-8?Q?xnN8RvtTEJ3Ux0Q7El5xLWVjCk3F72pl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 20:23:17.1954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b70e16-6fbf-4ea3-4456-08dd0d8eff15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579

On 2024-11-25 12:52, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> +void __init builder_init(struct boot_info *bi)
>> +{
>> +    if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
> 
> ... then this extra level of indent isn't necessary (with an empty 
> static inline builder_init()).
> 
> I guess this way, this small part is compiled even when 
> CONFIG_DOMAIN_BUILDER is disabled.  But it's only a piece, so I'm not 
> sure if it's worth it.

Later in the series, I see more code is added here for non-Hyperlaunch. 
Disregard this comment.

Thanks,
Jason

