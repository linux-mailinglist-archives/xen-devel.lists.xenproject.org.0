Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBBFB3702A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 18:25:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094864.1450077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqwTu-0006g5-2c; Tue, 26 Aug 2025 16:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094864.1450077; Tue, 26 Aug 2025 16:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqwTt-0006ed-W3; Tue, 26 Aug 2025 16:25:09 +0000
Received: by outflank-mailman (input) for mailman id 1094864;
 Tue, 26 Aug 2025 16:25:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etY1=3G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uqwTs-0006eX-26
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 16:25:08 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20607.outbound.protection.outlook.com
 [2a01:111:f403:2405::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37178964-8299-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 18:25:02 +0200 (CEST)
Received: from SJ0PR03CA0114.namprd03.prod.outlook.com (2603:10b6:a03:333::29)
 by CH2PR12MB4327.namprd12.prod.outlook.com (2603:10b6:610:7d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 16:24:58 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::6b) by SJ0PR03CA0114.outlook.office365.com
 (2603:10b6:a03:333::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 16:24:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 16:24:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 11:24:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 09:24:57 -0700
Received: from [172.31.63.243] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 11:24:54 -0500
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
X-Inumbo-ID: 37178964-8299-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nI1hH+3lm+73J++2c2H3WOW13dTeqf3WVaZHib0IBwr674/1ciuumti16pLprAwXL96PIxNLSskSk7nmOLCdhFqt89qC4SAiU+eDyGNinYu+ktk1JKD4+djYjcH7bc5FNA5ab8z08imhyqg76lRCKmOj7M9RAF0DBJcpgJcYSvxAwOQcgupSrojSqQiN0aMspxp3DWVq/+Sm+FszPbpvV3ohP4EQS24COEmv3xMktrAa+BOxZwZUFh9MwWH1Ft7iFLkIVKTL+ZxxJfnKjWscHSswI+lu5yNNvXTYXffvWp2aQlVyA4vKve5bL2f/oYKs8v77cr6gQKdsbn4WpbyBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLXeinFT1xaw5pFlXUQRWDhjTbuSk6PW/GX7bc1L+2M=;
 b=KbkWcFHGuBrEaZ6ycS1MjAbA6iVS5glj7edE1uKGGntxJ8/X9YfhM5w2rxwXMm5zLebdSFLaQ66b4QT69lrwZySGi12HST3zqgZs252U8Vglj1Ex3OCetqFZ1GzRAdbL/bQlaiCmcoQox8lhLeWvUzl5V4ZoYcfxXOBeWM8zZLAMY7vxdJWridiHDarvNZztasSsGfgFK8sR7iYTArOcSifBCdImojNKDota3sJ2oxsKMIFP+nAxDYrTrF0vxD3WQbZRnj0ZTnYiTthlvGr9TzncSS/LTfnxbHeE9D6b8qWqkxdlVABP3yh1qjZ3arnIRfkC21P84NjjjZWF9TKSKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLXeinFT1xaw5pFlXUQRWDhjTbuSk6PW/GX7bc1L+2M=;
 b=CgZ0L3gRcKxLYmgEwpt9lJ7S8BZ+x4dMZXJecOdRadVWo7jOm3b9D9Gx/iDoQx1vQsOhaKwau3L9kwm69lUtzGHOxO1/4x5J5gI8FQvrTzYsKStFYmrhmSklqReGmZn1aGAB4Io4dz/9+SXSEdUgYQ5lFSJzqATU+J3pie/XA6E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <74dced99-e48c-4b74-8383-afc353d58dae@amd.com>
Date: Tue, 26 Aug 2025 12:24:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/11] xenstored patches from split hardware control
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Juergen
 Gross" <jgross@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <698b0944-0be3-4c04-ba97-a8ef55ebd826@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <698b0944-0be3-4c04-ba97-a8ef55ebd826@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|CH2PR12MB4327:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d236b5-2f89-487c-25c7-08dde4bd19ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ek9CZXl4U2swY3VLVGgxYW9mZnEzYjlQWnpJNFM0eXY3WkNRMUYyd3lWTHF2?=
 =?utf-8?B?eU1JTUVmNWdqdWU2Vkh3WEZNbzBma04wT3hIbUg3NFNKMkk4d0FuSklJKytX?=
 =?utf-8?B?b2FzWnEyYzd4a1ZaeEFSNmFiRDRBRUxZS1gvYjllSHNCMWp5c2xPZEZFMzVv?=
 =?utf-8?B?S05ZdUhXUDFtNXpwM1pLODV1OHErMzVMNnppMTc4NmJUTDkvUXVzMEJlQVdo?=
 =?utf-8?B?VWZDTm9GT0ZKQ1hnVEplN0FmbEFlSU5SeHZFdTNEaWxodXh2VHpwa2NETkdR?=
 =?utf-8?B?TU9aK3E5OGx4cXZtR2hRMi9MQXVycUhwOFJaV0tRb0cyV1dsZ2wwYnVhNEM0?=
 =?utf-8?B?TkFvODZqMkNIbjBCTzNlaFNzUDJ1OTFJaE93ZkI5TkFseFRYZFNScXJKWXhQ?=
 =?utf-8?B?ZDJRR29tREZ3dHlmMW1zT1B4RTd3Rm45UHF5VGF6OXR4RUtGak1pMVB1Y2RH?=
 =?utf-8?B?U0Job3cwc0o3eUpKSjJuUm8vV1VUMDNQUWhkZktOaE1kZzR0NGR4bVVZejIy?=
 =?utf-8?B?QlhrM3RjSzQzTmZNMEorK1RPM3pjODZFb0pNV0Y0Wmp3S2Q1UWZwTDUyRFc5?=
 =?utf-8?B?L1I2bElXa2l5eHVLcGllM0lKNGxuTkJoOURlQld0UnM4NFhROUM5WHplVVA4?=
 =?utf-8?B?YVZuUTJuS29zZW5Uem8wblcyVTdCY0pVS2lWNmo4RUJqbG9hcGlERi90bE9r?=
 =?utf-8?B?VjBkTDZoNzFkZW52Ym5lQmlHOFFUN2Eza3hqNEFKT05GN2hoeFBtMEdYSlpT?=
 =?utf-8?B?RjhYd21GT0V0Y1d0RHg4TW5MalB1ZFVxN3lsenlLdGIwQTVMY292OTJlQVcr?=
 =?utf-8?B?ekJnQm5sTUJpOEkrMlFaRGhMYUI1OXFZMWVwRjN4ci92ZVdXM2dLQ3ZUNFFV?=
 =?utf-8?B?RFgzYUtkTGUydmFwUVJqZWlvUU1ub2tyQUJXaHgvRHNGR0RKRktLNjREaENI?=
 =?utf-8?B?NzhmVnpkYVhYc3FQcDhCZm5KYy9iYlhCTjFDanZVQW5jcnJ0Und6Z3JmYVh3?=
 =?utf-8?B?L25RZSttTUxTSlVSVE9SN1E3RnZlSUV2eEFqemtUU0dlK0NMaXJ2M2hnNnFC?=
 =?utf-8?B?NmpReXFRSnc2QUpnaTJEYm5TVnJmK3E3a2FYckFFSEhaODRDaTQzS0JndHNt?=
 =?utf-8?B?QUU2ZktJRlM0NUcwcFpHQ3Y0eWlCdVVBQ0c5ako3M2xGc0hzS1lJTWhDUWRB?=
 =?utf-8?B?YUQzOWN1TysybFI3VmQ2aWFuSDE3S2paUzRnQU8zMFMzY3Y3d2Jrakt4VG9s?=
 =?utf-8?B?a0hycEZja0NLeDBiWWNBNjJaUVQ5NlJ0dW5kOE5TUEFpa3UxOHE1Yk14Q3c4?=
 =?utf-8?B?WmN0Yzg4dmpTdDNhbWNNc01iN1dEN1FrVjRpc1JPVnVvTU5VQ3BRTGdoaWFQ?=
 =?utf-8?B?UVlGY3VwbzR4RHNpYm9USFdPblVtZDdrazZDbnk3QzBLT1JBK2ZnWGdJSkUx?=
 =?utf-8?B?eTUvY05HWmptQk85Y01kcGtFNEFrTCt2TjNZR2IrWWcyZEcxVlJHSFZGTmJ1?=
 =?utf-8?B?TnhJK28wa3VCNWpDVHpjY0t0cUQ4d3crT2tQTGZjNzdOVTk2VHdHaUIzSkdW?=
 =?utf-8?B?VXhVR0pOYjE4bC82OS9JdDZiaEIvRWxVRE1ZL3NJa1pSOUtaOWVHWERHUUUy?=
 =?utf-8?B?M0laSDMyM0hSZTRkbTBiSGNEUU9vamEwNUMwK2w5eGtFN2Y3c2xOTzZmSUJq?=
 =?utf-8?B?Wm1XLzVWaVhpUU1BeHdVSXJUcWlEVks4VExtdjhZTjdFK2xLb3BPMmdXa2RZ?=
 =?utf-8?B?cG1zMDJMVFRNMUxyTUNQdVF4dGpiWlRROC83ai9mUVVnc1hteGxBczVWNDJJ?=
 =?utf-8?B?LzcwY0xZNnlSdzVicUhXbG9YU1NGdDF6dGJmT01XNTdxSjJDT052WTJTQkYr?=
 =?utf-8?B?UnNiV2JCYlpNd05XanQ2Wnd3TU5QQUdpaHVwUGtNeTlhc0ZsaUJoVGQ5Nncy?=
 =?utf-8?B?SkZNWVY3M0tzUHJIVlY3aTV5SG5icnNBNG81VFlnb0g4ZXp0My9WWmE3YVdl?=
 =?utf-8?B?KzhnR1R2VmxiRG5zc2dXZE1tVm5FeUpFektlOE5RaWJTOWd5a21wVlBIeXBi?=
 =?utf-8?Q?Fyj5vM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 16:24:58.5832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d236b5-2f89-487c-25c7-08dde4bd19ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327

On 2025-08-26 11:53, Jan Beulich wrote:
> On 26.07.2025 01:58, Jason Andryuk wrote:
>> This is a subset of patches focusing on xenstored changes from my split
>> hardware control domain series.
>>
>> It should address the stubdom breakage from the previous series.
>> stubdom was tested in gitlab-ci - xl list shows Domain-0 and Xenstore.
>>
>> "tools/xenstored: Use priv_domid for manual nodes and permission" is an
>> interesting result of looking to rename some internal variables to
>> better align their purpose.
>>
>> Any review or guidance on the approach is appreciated.
>>
>> Jason Andryuk (11):
>>    xen: Add capabilities to get_domain_state
>>    tools/manage: Expose domain capabilities
>>    public/io: xs_wire: Include event channel in interface page
>>    xen/dom0less: store xenstore event channel in page
>>    tools/xenstored: Read event channel from xenstored page
>>    tools/xenstored: Add get_domain_evtchn() to find evtchn
>>    tools/xenstored: Auto-introduce domains
>>    tools/xenstored: Use priv_domid for manual nodes and permission
>>    tools/xenstored: Rename dom0_domid to store_domid
>>    tools/xenstored: Remove stubdom special casing
>>    tools/xenstored: Remove hardcoded implicit path
> 
> To allow more of this to go in, you'll need to chase an ack for patch 4.
> Of course you could also indicate if committing any later changes ahead
> of patch 4 would be possible / sensible.

I re-posted the xenstored changes separately and they have gone in, 
thanks.  Yes, I need to follow up on patch 4.

Thanks,
Jason

