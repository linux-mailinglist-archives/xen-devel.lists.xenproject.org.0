Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5258B994C1F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 14:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813090.1225901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy9fm-0005wd-8I; Tue, 08 Oct 2024 12:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813090.1225901; Tue, 08 Oct 2024 12:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy9fm-0005to-3l; Tue, 08 Oct 2024 12:50:42 +0000
Received: by outflank-mailman (input) for mailman id 813090;
 Tue, 08 Oct 2024 12:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1UB=RE=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sy9fk-0005rB-E7
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 12:50:40 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060f.outbound.protection.outlook.com
 [2a01:111:f403:240a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eafc7c13-8573-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 14:50:39 +0200 (CEST)
Received: from SJ0PR05CA0195.namprd05.prod.outlook.com (2603:10b6:a03:330::20)
 by PH7PR12MB7890.namprd12.prod.outlook.com (2603:10b6:510:268::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 12:50:32 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::db) by SJ0PR05CA0195.outlook.office365.com
 (2603:10b6:a03:330::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.12 via Frontend
 Transport; Tue, 8 Oct 2024 12:50:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 12:50:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 07:50:31 -0500
Received: from [172.21.103.178] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 07:50:31 -0500
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
X-Inumbo-ID: eafc7c13-8573-11ef-a0bc-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vq8ofC4XG01l7MgYJ90ongGsNdaGcCkqPnRzmWgTAJGHiaW4rozRSUk0ga6Qc22wMRh8xh2f1bDvDgIL+Hv9qpmK1Fc2Gd8Qi60Vj4cGwMSsm+pRGG4GcZPhQq/q0vOvS7IcekaJWPvcn6l9DIY42ll6oicWp7wX5wl2vnevTswk3FnbJq34w1OSVuoilYG2PYg2o118l/t3seeJnauJ5B0yywtrpGsEmGgbmWwbDAatOiJtISOunpsZKYofXTpBhmSNlOEOwpNfG6TxX1T1tv4k2aPcV6dmWDisPfFGgeoxaQQk/4prkpuUsfswYzxKxFZ5LOExkmdeCCsU/2zxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Att16ngqradHmcNqIGn7ZQ/14WMy3qBbbxrwzUT/qzI=;
 b=f2pqWyhVOMtAihFhzf6z2nweGcQnNE5HTa05rJwxkamWrv0F4O2bBcAww0JQdzHc35z5c/jH+RacVvBtLtfQzwW+9kj0Od/p+DOy4vW9ZCU26WRxVD/2u7UwU9TJ/WT3iFZtzoYInW0sTWKBpNavY7bISg4rfJcVGKpRgncPmRvJVMmOysSKagxgHIstAyRshxuHh5fBVD0O6T/8rvbJ+XBp8Y0VlBcGsDcTkWJzbM89g7mR27XiMnQr2PEt1WNimyg6p+zPI1Tzq3CitWlRaTT9LN2Hvej7B1TISFi3ePgldgG+189OzbcK09ckoan1uyN5DYieWk6uEiOK+YzDZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Att16ngqradHmcNqIGn7ZQ/14WMy3qBbbxrwzUT/qzI=;
 b=fGQz7GcQUN/zC8Owul+VBpge01Hkj7X7y0Cp/xeyTuxlqP4+UmVbCSDJU9aUXklbbKF3226ca9O7wmQZ0jfEd9zUo1qD1L/yJk3vZfihBS6i41bGrfF08wGk+ix/VqAl2oXbJeeuH+MLH0OXfeXhKuuQTvNjp+3VxPh3h/p2Jc8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f27aa052-9f6c-4684-8a94-98123576d8cc@amd.com>
Date: Tue, 8 Oct 2024 08:50:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/44] x86/boot: convert late microcode loading to
 struct boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-19-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241006214956.24339-19-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|PH7PR12MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: a5f34e7f-63ad-41df-5c62-08dce797cbed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXBLdDRod1dsZFdRcnhGWUFYRlhuWFdZMkxOT3d3VGFDV2xlUVlERmFJMXNY?=
 =?utf-8?B?REdxV2ZlS3VzT1FQQzFuYTgwQXVwYnVIdVNMeDduV3VreEhyTnE0SFgzZkxH?=
 =?utf-8?B?TTJUZWxQWjQrR0lmaEN5cVE0WW9VVWNMYk9WQ2wvcTlxdmF6Y1J6QVkrM2ox?=
 =?utf-8?B?MS8xMmd1ZEZ1Nis1aGYzNE9ra1I4ODErdjRlOW1Gb2pwL2NiZUxLZlNEN25v?=
 =?utf-8?B?MkRrVjdndFZucXgvOTdEclRwQ2NkSXBQY1ZZODh3Ym5GcVRmUjI3L3lPRTlx?=
 =?utf-8?B?NFlqNjZkWHhmbko3Y2dpc0YrNWd3dXFsZVpuaXJnaG5uUkpSem01aHpscTdy?=
 =?utf-8?B?UXR0Z3NLZTkwSVFCUDJnZGVQY0VQYXphRjJNaTlaS1Y5SmRZUnR1cWplanNO?=
 =?utf-8?B?bUZmbzV6TlJtRjQyQlQ5a3ZaVXMvdUZuVVdtNytsVitxa280WDhIL1Fpbnk4?=
 =?utf-8?B?a1FQTkRqY1VweTA1REdUbFpBM3hmTGF2alB5RHB0T3E1QmJOcThTQkt1RTJY?=
 =?utf-8?B?Rmt4dmZXNC9wbDhLMG1IZnA5aSt4R2dEVVdYSldoc2R0b01Qa3VtUGVKZjBW?=
 =?utf-8?B?eHdRSnoweE92cnpxeXhBdDExVndYR2Yxa0JkVDVKZ1lxcW1ZbXcxcUZDNGM0?=
 =?utf-8?B?R1k5TXdYc2c0eTZSY0YxdzBBcmJ4K3N4U1ZLNjZoVmVEUGtZNTN2MGxyL2RZ?=
 =?utf-8?B?OHpWNVdkQjNHVEl3YlFhbVBuNWJCZVY3T08yYm15ZTJXL01QWStlMC9tdCtO?=
 =?utf-8?B?Z1pwUjdadVJIR21ISmZpM3o0eUptWlNPUzlTZzdTK0hWcW4zMnJIUXExU0cz?=
 =?utf-8?B?dzVVd1dJRVJlWVpyaTFCS01xbGtLOEJoWkIzcnMyV2JmSDZqQUM1RjJmSW9N?=
 =?utf-8?B?Z3EwY1dDNUk4djR6djdUaG1pQ0tiT1VZS1VsazdSbXpNdmZLNXVWSkc1dFlL?=
 =?utf-8?B?Tk1jOFhLdzUxYkIyamY0QW5pc3ZmL1ExUy9Ud3lveU9UUWpHQ3hIT0ZWUHIw?=
 =?utf-8?B?SExRVEZVUjdJaHlhS1VoUVluNmZBNEVYeDByRkQvYUVWTExkR0c0c0dQOXdH?=
 =?utf-8?B?alh2SzBPUFFJTTJReURsbnUwRERnMjMzM0VzWGZ6ZXQ5aHJ2b0VXa3N1cDFy?=
 =?utf-8?B?MlRpVVBkYmpsY3UwWVpWS0U3di9kL3dRbzZyNjJ4azlLa2Z6Qm90eGVXR3Yr?=
 =?utf-8?B?RHZFWUVIakdXOGVST1NBRVZYRUNqVWp5VzRvUDhuaWpJWldVdHk4cCtxeDhj?=
 =?utf-8?B?dG9vS21zVEJMTGV4M1VWWlNzL0NNQnVHRm91MHRaSjBGUzNUbjF6L1lmUHd4?=
 =?utf-8?B?MTROWXVUZjM0U2RWcVNjR1RZZ1JwYUxHaEluR0RWdnFqcDVjSURjZTdDYW9u?=
 =?utf-8?B?WG9VczQ0bHN3Tmo5dmllRHl6eVhJTE9lN2NQN1pRZ0N4di9GV1Vac05wMzQv?=
 =?utf-8?B?K1ZWWlBtWWczS3hLamxLNEpBUkI0VTN4Sm5NSHZIa1NtVTRvSEl3Yi9RVlFr?=
 =?utf-8?B?MklucEpGZjlMVUNOQ1F2TW5NVkFmTmJlWmd4cHV3aEtNWWE0UE53QkpibjJp?=
 =?utf-8?B?a0EzdWxsbmd0MGFwZFl6Wmp3VXdXRUlmSjRCY0JZczBRUHJtZ1BFdWZSRTZK?=
 =?utf-8?B?aUtUZGtUQ3ZyR05XdXRsZ1VpWDV0Ri95WTRKOG1XVWpYOGl0SktaenZyOXV1?=
 =?utf-8?B?VGlUT3NqbUNzd1dUQTdlWUszLzcvSnFveE1CMWZCSDlNdUR0VC9EM052UWQv?=
 =?utf-8?B?RnlpNDhSSTRGYUs3R2Z0dTNualNSQU14UEVvemJUdStWZHZZVTJsQkt5SDlL?=
 =?utf-8?B?ckwvU0hlSCtQY2RXTkVGeWd2Y09HMGgrTkdVOUFLTi90OHBjYUlDM3N2SUlj?=
 =?utf-8?Q?LwmX1HgO2Dzka?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 12:50:32.4988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f34e7f-63ad-41df-5c62-08dce797cbed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7890

On 2024-10-06 17:49, Daniel P. Smith wrote:
> Remove the use of struct mod to hold the reference for the microcode,
> converting the code to work with a struct boot_module.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

