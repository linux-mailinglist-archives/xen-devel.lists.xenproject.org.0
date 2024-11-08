Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AAC9C221F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 17:31:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832732.1248014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Rt9-0008Az-FH; Fri, 08 Nov 2024 16:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832732.1248014; Fri, 08 Nov 2024 16:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9Rt9-00089E-CD; Fri, 08 Nov 2024 16:31:11 +0000
Received: by outflank-mailman (input) for mailman id 832732;
 Fri, 08 Nov 2024 16:31:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8BGf=SD=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t9Rt7-00086y-UB
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 16:31:09 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2412::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d93f8711-9dee-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 17:31:06 +0100 (CET)
Received: from DS7PR03CA0258.namprd03.prod.outlook.com (2603:10b6:5:3b3::23)
 by SA1PR12MB8697.namprd12.prod.outlook.com (2603:10b6:806:385::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 16:30:57 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::bb) by DS7PR03CA0258.outlook.office365.com
 (2603:10b6:5:3b3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 16:30:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 16:30:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 10:30:56 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 10:30:56 -0600
Received: from [172.31.40.161] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 8 Nov 2024 10:30:55 -0600
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
X-Inumbo-ID: d93f8711-9dee-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjI0IiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImQ5M2Y4NzExLTlkZWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDgzNDY2LjM3MTA0Nywic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQgx12xz21/R+XVFwqw38ugiImW2ck7Pf4hCaDEk8Z8+4wdFj9s3F4kCp0AYcmxEjBCSB4f2kZ+ZWagm5h0MGMeiG5kradx7hmKuNOYT9vLjvQNo2Hac+e9nSABpqshKYOgrDUry2T/Q4eGM9NGpEM6ws71VVf5Yay94FuFmdGqQtwswfft9vCwTgMJmCMtU6JUghiM2ut1ik8GIVRz224Met1+JsWTNeSqQ21H+cxx1mQ0zjTBM0OzeY36IOyX6b9zqEpwK9bDNLCKK6eAHXr3pZpkZnDEoZQ8QsWkG1AWAzSA0tIZHEd7c1p8aifnfXay5KNgl+xY5RcNzK1h22g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGTvyv61mwP7cHt5/X2xMHtqhRxVIDUbnyqPIu0C7z4=;
 b=SOFPk/wrIBB+BB6fcHf0bpyq+/uoIQKLo5ikfT3WiT/aoezJYy63YEc+M23ZYtAK3KAl40r/FxwI3ZCpmaeay/dI1aq36gu2sE7n3qM69qG8eFIzo9bFpmVvVqgC62W300msyKlpZjGcYqk1QdY3ALY9LlMQU5HYD4jyx1ekcgRK/3pX9IjiwXv101bS1WLgMgYzeOSxRNk4CVW8+FFU1huEeS/hO0nJGr+UIGWaBnBz9mAFx5iB67mnL5s7R96z4ozwXK2A4+TS8WquJJZdGcFpAxNdghVgPi1Tkk7XiFQaOela7u94xIVDP/OM6jg1Zlgk1nMhEoB0DWZjwW0j0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGTvyv61mwP7cHt5/X2xMHtqhRxVIDUbnyqPIu0C7z4=;
 b=cXgOZ7nCgH50bY1FvP3qDLaVV/9njls5XaTCg9q0bT7jzC19c53sTqUVSAQFaHUUGHxIJsrDPHcWaUzuL9mnXFZCN5RV7DcYDbLKqusKlfsJctkqltQzyhXtlHXZcc906eJBCJUf1kA1iWLGQaG1BTyu9uGfjEF6ePQhuThmDEc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a08a2653-097e-4cb9-bc17-6b3e4ca57114@amd.com>
Date: Fri, 8 Nov 2024 11:30:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix bootinfo.h to be standalone
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Krystian Hebel <krystian.hebel@3mdeb.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20241108141210.298063-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241108141210.298063-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|SA1PR12MB8697:EE_
X-MS-Office365-Filtering-Correlation-Id: 298d0a4b-5287-4908-64cb-08dd0012b900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1VCZit0OVh2N05zaEtPOWJCY0VJRkExaTR0NS9XaStvV3VvTDNoRkRMSXhH?=
 =?utf-8?B?TUxQdTlOYW9YbHBIRjNjcEM4VVpzMFZLUFZQNGVjZEFMQy9xVURVRkl5VUd1?=
 =?utf-8?B?TzNHSEhNYXdCQ2FmRUpiL2VKRk5JTjQ4MlN6Q1E5aWs4YzkycndJNEZwZUJ6?=
 =?utf-8?B?TXplc2NveUJ1QUFSQjZvTW9TT2VnVzZBUG5JbTJ4SndOakZ1Sm1jMm9ydGtX?=
 =?utf-8?B?VGI1cXFOdjRxOU5ZMzMrbXRnN29JOVlzbEZWaHhSVEd0WDRQM1I5SWRNaGdn?=
 =?utf-8?B?R1M3VVlQQXl0ZW02eW1KaThQblg1aldBQ0pFekxObDdpdXdwV2JZM1N1RGFl?=
 =?utf-8?B?SHRmQmI1d3B3RmhSQkR3RmcweFZjQlVhL3ZyYVYvbElBU1FLOU1Zeks1VGFk?=
 =?utf-8?B?OW5MaE4reXBJaEhHR3pPM2lnTXBtREQybDRCZkd1RG85M1BXc3FMZ2dOVmxV?=
 =?utf-8?B?U0pxOC96RCtzTWhpdml3bVRRRzZ4WnA5NlVOZlAzWnc1MGo1UEVTNWJGejN2?=
 =?utf-8?B?UHJTYjZvSVM1ZW9tN2VNelFPVlZNZFN4SWNiS2cvbTNQZUZHTGlLcithT1Vk?=
 =?utf-8?B?RHhwb2NSRksvQWpER1pVbmx6amdiK1g4SVVVNDFuV0lBcm0xWG4xNUVpMlEx?=
 =?utf-8?B?TzVHQ3J4WWswc1Q5SVBVNkVnMEpSVVd3anZQeU9ONkdmUTNZRmlYbTRlVVQ0?=
 =?utf-8?B?SFpscklWaThTaGRlbDNyeXQxc2d1a0JudEVIdC9hcjZVVDREMm5XRkNNZUoy?=
 =?utf-8?B?emhjNC90Z2NyM0ZHQm9HV083a2tSOUVqODFaUGRWUVphN2dXVTlEbGVTVEVq?=
 =?utf-8?B?NEFOVldhUjdnaWtkZFc3bkwzV2NOYXNOSWdmcW85UUorYTVCZmxOMlVmaHhL?=
 =?utf-8?B?d3E4dHI3RWhTK0k3anNoY0JncEMxMzNmZkQ3THBxWm9uMzk5UWZaZFpsbTYx?=
 =?utf-8?B?QW1vMGFjVDY3ZlFYSC90aHNGenVjWkRFeWRsSDdBMk9LRzZZbW8yUVgvTVdL?=
 =?utf-8?B?QWRsS0gvZzBweUV4c0ZLKzhYUm9CU0RZb3B4NG91MzZWNEc4Y0NJSDY0TG4r?=
 =?utf-8?B?aWNYcmtiZHdvalhGdUV3RjhkTVNVQWJ6K3FOOGc4OXhvdXNGNW1jRkFOdWRD?=
 =?utf-8?B?bEVZR1JOWlI1RTZTZXd5Wmd5YjJBMWJ0OHZxZHRERFFhU3Y1RlcwaTgxa3pi?=
 =?utf-8?B?VGVoNlFDYXBocXUwMHV6WmwrYjh4OUxoZFZ5VCtkTlZHNUJwT0Fjb3Fra1Zx?=
 =?utf-8?B?c0RObGtJdnc3OXpndm5rdFgvZ1ZjczR6d083NE5UL3dZYTA3UjlEc3daU2Er?=
 =?utf-8?B?MUp0SzQ1cDIwQ01UR2lKN3VGVTJzU2Q1amlybEp1QVBETGplL2FUbTUyU3ll?=
 =?utf-8?B?cnY2ZUZnYlBzNkNKUzhZWmJaQm9zOW5GQlZoc251VmdNYTdvVitaTjkwSjZT?=
 =?utf-8?B?RS9mWlNQUnpleXlOb0UvVW1NdjVFam5aTjZodWl1UXRyNmxkY2ZnUENqME9N?=
 =?utf-8?B?b2xaSzhZRkM1ZlJKK2J2SHJCSngxWVhydlRwN3NrTEFqVjR5azNsTGhXY09q?=
 =?utf-8?B?Q3cvOFhZUTlWTWlGbnJjaG55aURCRU04WFF1TGRBdHJDNzY3cVNBU1FBZFc5?=
 =?utf-8?B?S21leTJ4V3o1TlJxbjdVYitvK1pFK0tjSWlPK2NubE1LUkkzYVlRekxPTFlr?=
 =?utf-8?B?NlN3K2xMOWo0WkV5SVM1TG9IN1hpcTVPTDlmZTlHdXpENHFKMk9YTmJpakhP?=
 =?utf-8?B?Mzc5UExRYXdjVU03NDBZQXFtanNKdDY0dlF0dzV3NkZ3ZmxISGNSbTFJd3Yw?=
 =?utf-8?B?N21JUDhaeWZoRXkybXQ5d0l2ZHg2bG1JZEhMZGJ3bTJ6bnBCOTUySG5hM0tO?=
 =?utf-8?B?VXVsUmtvVEwwNUQ1U3FDUStSWFZkU1pDT2ZZbDI3NTN2eUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 16:30:56.8919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 298d0a4b-5287-4908-64cb-08dd0012b900
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8697

On 2024-11-08 09:12, Andrew Cooper wrote:
> Work to rebase the Trenchboot patch series has encountered:
> 
>    In file included from ./arch/x86/include/asm/tpm.h:4,
>                     from arch/x86/boot/../tpm.c:23:
>    ./arch/x86/include/asm/bootinfo.h:88:35: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'next_boot_module_index'
>       88 | static inline unsigned int __init next_boot_module_index(
>          |
> 
> Fix this by including the necessary header.
> 
> Fixes: 74af2d98276d ("x86/boot: eliminate module_map")
> Reported-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

