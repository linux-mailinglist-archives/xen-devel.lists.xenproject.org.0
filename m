Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF28B0E77D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 02:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053144.1421914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueN9P-0005Ev-CB; Wed, 23 Jul 2025 00:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053144.1421914; Wed, 23 Jul 2025 00:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueN9P-0005D8-8u; Wed, 23 Jul 2025 00:16:03 +0000
Received: by outflank-mailman (input) for mailman id 1053144;
 Wed, 23 Jul 2025 00:16:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YbeQ=2E=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ueN9O-0005D0-0S
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 00:16:02 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20612.outbound.protection.outlook.com
 [2a01:111:f403:2416::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f5e7799-675a-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 02:15:49 +0200 (CEST)
Received: from MN2PR18CA0020.namprd18.prod.outlook.com (2603:10b6:208:23c::25)
 by MN6PR12MB8590.namprd12.prod.outlook.com (2603:10b6:208:47c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 00:15:43 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::31) by MN2PR18CA0020.outlook.office365.com
 (2603:10b6:208:23c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 00:15:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 00:15:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 19:15:42 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Jul 2025 19:15:42 -0500
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
X-Inumbo-ID: 2f5e7799-675a-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyTzC1rrRVZC4hvY8TndTh1DsHQ3Fl6WZl88qyELSj0Xi82J20VmlIrsnKKmEfXLnZF8KXcpWnDsZcfOIJWyQVAyeF1iX3tbWQy56zF6w/NQuZ88ZCijwDor4ZxZ4Re3t/mCPNob9KqAoPg7qC3vxcwGsfd9YHmrA9EfbASw7aP0qD4tkepNcHT+01YLlkm4NYrJ5zu/XYWUdOmCKerAdswu2nCge19VaOIUvjQNOAp0S+feXZnZuGEICEqedesNg/hHjOjrfhZe/OemGnQPwvUBVEP9ZGE8loAwpIPx+M68MakkGRwMe/yFmEJaep5fCNxCYWSNnY90Uq+uH2PpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCwhL43ttMXFmNeshai5CwY67mFOSGMquCfBdQ6uo2c=;
 b=ATbscpYZy4SvhgIYvZDAyfZxO39cnyGPXEe67vGjCTAPQoXWpM00gl9c9mboxO1JpE+atL4aKEoL5w3QSwRrWmXHip/k8Jk1BXOC0pz42y44yYXOyQ3t+wFLM3HwLgNANGfg172wpWGVvdAVjUrXd04649x/YNgWbFQqy9OhihFD5a6p+ewdGOD2kMAi4h8WHRyNEUQ5a1GmMvyz5XcaHj1NgcwMKlSCjZBs8SxMEL+OChQU9E/Aw/75dxGosk+Wba+6xgU+fxohPfqVbr0B2PZ2mD1VEoZlGL66YG5Zu63/HSrdOh3p4Oc1qpRNlNLSXfodrHfbYwNIEilOtNTPiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCwhL43ttMXFmNeshai5CwY67mFOSGMquCfBdQ6uo2c=;
 b=mSSoTJfe0wJ0lCds7+k9ymbCTzglXy6DplR4YJANUbXL2GyJPL5LXD6vMyWAQv8xFzw531AkNfdvSnrDbBubXDVo0u8wSobnECQSH1bO0CdkBXH1Hj+OFGVm0oBS0xaNGlVqX3wjru/nIzUE26joaA0m8aeYk8ybyN2gqDjKWOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1e820d53-e440-4939-b6da-8203157d4e68@amd.com>
Date: Tue, 22 Jul 2025 08:05:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Replace do_sched_op calls with their underlying
 logic
To: Teddy Astie <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <94a424a73476c3f2b044d61685a5fa5cbc541be0.1753207469.git.teddy.astie@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <94a424a73476c3f2b044d61685a5fa5cbc541be0.1753207469.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|MN6PR12MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b4ef41-51bb-4a16-d35b-08ddc97e1027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0RCUjE1eVZrbE5GRjZjTGd0NkMrRXRMdHlSMU5CNjc2MVM2TzVWQjBQVlhv?=
 =?utf-8?B?YTZCcVM5OCtyRmloUXJ0RFM2SVFOMWl6bkl1OFp4OXpmRkVmMVBtNmxCNE5i?=
 =?utf-8?B?bXpNN2MvcVVhMmlRd2I1UUVDRjBOdTJTbXdqTFR4bTB2ZlJSeVI5QlpVOS84?=
 =?utf-8?B?dGx3YlpoR0U5OVZ1VFowSWFqdzRFSDUrQlpjWDJMb3pHY1BEYUlDY2dldW5h?=
 =?utf-8?B?cXNWRW44NmFKMWhrbzFxeW84RVFKbFhHdVVlNGR5cXNWTm1MLzcrdkhQejVo?=
 =?utf-8?B?djlhSDd0R2duZCtkV3c5UkszQ1p4dktLZHo5djlvWERHRWp6aUZtMHMrWjgr?=
 =?utf-8?B?VWMzSkorQTJpSzRKRDZYQVFTSVluK0ZjUCtHRi85aGdVMk4rYTF1bjkwbWFt?=
 =?utf-8?B?eGkvMFF3aU5ick85Z1ZOTVd6aFlxSEp2WEMzenhTYk5yZ2JmZm5sd2VXRkVt?=
 =?utf-8?B?V0FqQ3dQN3VWVjE4QnJhTnplc08wWWVJQ2ZHa0M1REVLTEhnVS9vV1RQWWQ0?=
 =?utf-8?B?MGJhNXdYdCtIRWFvdHV5SGNZZlNxQzgzSjA2Zi91U09rdFk1TVFRUnFkWm9X?=
 =?utf-8?B?elZiSTUvU3NHV3E4QkhSMHIrWStxdTh3VElOc0d6Mlc4UzRnUXRUTytiOTFD?=
 =?utf-8?B?MUxVaDM1K1hyN1krNFB1WnlreFB6WGxNTHNRQXRyaXc1a1ZyRm43cTkrZ2pC?=
 =?utf-8?B?R2dLZ2dYV1ZiRHhwMlpaaFhydFI0Mkw5MWRTY2hrU2h1TXB6aXI1Lzl2dXJk?=
 =?utf-8?B?SWF3ajhENFBRUThrb082UnhZVEp6RFFiemd2MENUcHpoQm5XOFJWQXRCNEE5?=
 =?utf-8?B?akZ1YUpGT3NiQ0JhKzhhS3RSanFVOEFLUmYyc2R6aEY0MjgwVnFOV1pDL0FT?=
 =?utf-8?B?aWpzS0R3QmFqMmU5dTBwdDFhVWJhZU0wSnE1Qjk5U2laSzlnMUQxZ1J0eDRK?=
 =?utf-8?B?RTNFZ1pXcGJTVmFpSjkzektSaDIwUUVWNTJ3ZU1tL0kwMFFmUk1vbUVNMEZ3?=
 =?utf-8?B?ZEE2MDU3OG5LUzVtdS9kdmFFTkd1MnlQcWN3SWtIa2NQODNHUmw3SjNGVStW?=
 =?utf-8?B?UzNLMmx0TzJVREZxV081SEozL25JZ0NvNGthcVl6RzVCQVgyODdGMHhxckJP?=
 =?utf-8?B?SHlHejFhYnRnWFpGcEl5dEh3amdheG1Lc1dDS3NpU0tGYVdSTVZRWmpndEZx?=
 =?utf-8?B?UWRYUXZaR0tqbVFUclk0VlhwQmNGL2R6NjVoZ2h1UUZBUmtURTM1T2RUNlNl?=
 =?utf-8?B?eUY1cEFGck83VWdoN1hBNFBLM3F2eWsvdTR4US9ySXhaOWJoRW9PQnMzSnV2?=
 =?utf-8?B?KzI4ekJrU3NaU0pMbnNqYlVxcEY1Z3JkdFJjeXNIYjlSL05DczhycUVjVWZo?=
 =?utf-8?B?U0poQS9PcXFzdGpqaExEVm12SENOUnlFQThDd1lVUkpmMjN3aXdrVWxRdTdC?=
 =?utf-8?B?MzU1WGZ6aWYvM2FnYncxa3Zudlg3TjFXdWM4TXN6TVkzbldIRWt1eVdkSm5O?=
 =?utf-8?B?cGNHbWVQRENvZmdLS1g2TDRjRG4yRXVKNnBLa3hDU2JCanRUbzZWdktRTzlW?=
 =?utf-8?B?TlNVWTVXUnNsMXJDZDVhS2N1LzJLdXhud1ZGN0Z4UTIreDQzMVpNTnRVWUZt?=
 =?utf-8?B?am1nZDRZUFFQMjVtRGNuY1EzNVg5WEJFcXZkZHppM0FQamptVFZwMVZONGl0?=
 =?utf-8?B?aTRjckV0cnQwVlRoYTQrYXhiK0ppMDdWVWRZd25FVDNSQXFtR2JGTTJHM0Mx?=
 =?utf-8?B?M0lkUGhWb2NqRThTVWlaUDJIYUhmVzdWSjVPOHRuT0xJUDF3VktubStjd1ph?=
 =?utf-8?B?TjA0UlFLdUZ0eU1yL3VZd1N3dFpYaTJNMjN3YUZ5WmkxZ283T0thRGNlQUJJ?=
 =?utf-8?B?NVg0MlFBRHdBdWN5cUVDdjFnUEpVZmtDYUJHUGhIWmpoKzhmRlkzd1BSemU1?=
 =?utf-8?B?QXV5QUk1VjMzeUNlSnRVeHpQN1EwSk16aTU2U1ZUVFJCVVRyOXdFVXJuNE43?=
 =?utf-8?B?bXlyeWs2MnZSYzBua2xZWDFtZ0pFZE9SbXRpT3o4bllCRERJWUtaWlZtcU1q?=
 =?utf-8?Q?l2pYWS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 00:15:43.0019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b4ef41-51bb-4a16-d35b-08ddc97e1027
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8590

On 2025-07-22 14:07, Teddy Astie wrote:
> do_sched_op(SCHEDOP_yield) just calls vcpu_yield(). Remove the indirection
> through the hypercall handler and use the function directly.
> 
> Perform the same for SCHEDOP_block.
> 
> Not a functional change.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>   xen/arch/x86/hvm/hvm.c               | 3 ++-
>   xen/arch/x86/hvm/svm/svm.c           | 2 +-
>   xen/arch/x86/hvm/viridian/viridian.c | 2 +-
>   xen/arch/x86/hvm/vmx/vmx.c           | 2 +-
>   4 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 4cb2e13046..5c3e9ad72e 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1736,7 +1736,8 @@ void hvm_hlt(unsigned int eflags)
>       if ( unlikely(!(eflags & X86_EFLAGS_IF)) )
>           return hvm_vcpu_down(curr);
>   
> -    do_sched_op(SCHEDOP_block, guest_handle_from_ptr(NULL, void));
> +    local_event_delivery_enable();
> +    vcpu_block();

I think it would be better to export and call 
vcpu_block_enable_events().  This ensures they stay in-sync.

The vcpu_vield() conversion looks good to me.

Regards,
Jason

>   
>       TRACE(TRC_HVM_HLT, /* pending = */ vcpu_runnable(curr));
>   }

