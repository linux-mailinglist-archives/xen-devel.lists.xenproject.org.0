Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B415B07F0D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045758.1415948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8tu-0007yf-95; Wed, 16 Jul 2025 20:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045758.1415948; Wed, 16 Jul 2025 20:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8tu-0007wR-64; Wed, 16 Jul 2025 20:38:50 +0000
Received: by outflank-mailman (input) for mailman id 1045758;
 Wed, 16 Jul 2025 20:38:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc8ts-0007wF-JE
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:38:48 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2409::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dedfe9f5-6284-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 22:38:47 +0200 (CEST)
Received: from MW4PR04CA0267.namprd04.prod.outlook.com (2603:10b6:303:88::32)
 by BY5PR12MB4289.namprd12.prod.outlook.com (2603:10b6:a03:204::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Wed, 16 Jul
 2025 20:38:39 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::62) by MW4PR04CA0267.outlook.office365.com
 (2603:10b6:303:88::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.19 via Frontend Transport; Wed,
 16 Jul 2025 20:38:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 20:38:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:38:37 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 15:38:37 -0500
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
X-Inumbo-ID: dedfe9f5-6284-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwozloLo8V7oc+5Qw49K6iohLmfGMkhQ2VSQaMEENupIh20WdvwicXwaE17tGZPXl5Ih13C8RQx+GpshmzekwyFxB0MVnNk2S4jeusR/YmLmi5aFTDLi/vjrGcRwji4pXRRcrlPUpBncwsD1jZQv3Kdj7Dw/Rnf55sp+cNUesEJ5/SKSn7HHuiXrrcrKBzK6lUcyyjLBl3Z3nx1GO+KEc6yWC8lRghXsuXJsWs01rajDDdHmEbjUsPgRBrSM8KN71Ahp02waQf0hDSQC+q/HHH+L0TW4aDTzTW390Qr2zuUOaFRrl8fVqRY5eW3IQFY3CDPp+7gUZgBYiy7fw3/o/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ko7zgJdWNA1zLUs3Gl8+PvZP3X6FgKlEnZzi3OWXv1g=;
 b=yRXdA3jYZmG2sm/kUOTIM+6eFASHMlrjJEMeVzHXirQ7PyYoATkWq5Lc320VDtlNyxsuVDTlvsMdFEyO3OwMRdrNk6LPNRTTnaJce4Nr1+6vx79ynidQ8Yfc8KDiyjuMLUgL6fVcl3teEoCj7wX7a2m7v3qmQLuH3onfv0fYmzfby85guzMXoPNJsvl32V7T3YJ/xvuSPuwFrDM6OA5wZI0O+Tt7VwZ7p8KQNqrNQn0FEiJjV2zPKCB5+hjBpgHh8IkrtKvpXzLXBlSyHGwtsdhzLHoMQgk0eEja+yU3/vj54L+ZxcZdqA39Iiy/20i23C/4C3aHGci900txV0ylEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko7zgJdWNA1zLUs3Gl8+PvZP3X6FgKlEnZzi3OWXv1g=;
 b=ZVMBY5sl8C7NFwgRr/j28jHuX8ZfSJGLl8yjRgGfZF4DwaKNrpIIpCLwGlf7p1O5KWc6qHGNEbgOpTggCEV3T5dRMukftgQO97JUO8tkkt91pOxU3BJ7GmraEwhWhxHXSuSvix2dxfB3JADIh68FYeGz1J3pAALrsLu4fP3qDu8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7915cc4a-c867-4c90-9617-5d00e3479637@amd.com>
Date: Wed, 16 Jul 2025 16:31:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] xenstored: rebind event channels after live update in
 stubdom
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250702081305.14440-1-jgross@suse.com>
 <20250702081305.14440-9-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081305.14440-9-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|BY5PR12MB4289:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ffbd09-8bb5-4f91-5a26-08ddc4a8bea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlNHNU1SaG85U1dqSVZNWmZiVGFUVmducGFsMk1OQmpDa3dMVVB4YVhnR0cx?=
 =?utf-8?B?WFVkcEZOYlVCOGZSM3o1L21Rd3BhM1RTU1g2WnF0dXFSaTNYS3k2Qm9XcWpJ?=
 =?utf-8?B?dStzSFU2NUVXU3lYR201azJpejBOM2RZeDhMa1B2eWxDRzduZVF6Zkk2bjY5?=
 =?utf-8?B?WEhjNm1UNXFGbmtRYlJ6NFlxYnk1dWxGemJIaUJ1UmFNMUQrbFpHTGpmS2cz?=
 =?utf-8?B?NVdPVGpIeEJxSkExOTZlaDZxTU5Id3ZWL21EUEw1TG1hUUFmbXNNYlJZK1Jk?=
 =?utf-8?B?U1dSdHZuVmpHc1N1OEQ1a21xS1hhWloxTzFldkNjQjRlV1R5V25pNlFkSVNI?=
 =?utf-8?B?SnVhb1RWK2t1dFVCYUFXcmFSc0Q0SkRWaHAwV25XVHltdm1sVFRVN3ozMk5N?=
 =?utf-8?B?V3FLVlFLdnRyd3dWbEcyYUpyaFZqWHE5eHhibHBxZXVZUmpGNTkxbSthczhM?=
 =?utf-8?B?cmVQN1R1cUx6UG93RnIvSVkydGl3NFR5anRkZ0hSeEhXZUZCTUt3dDAvVVRP?=
 =?utf-8?B?TnUxT2pSb1o5ZWMySTM5cXA3cjFtWVRTTXJ2VmEwOTRUY0dkU1NQT0lmeHZL?=
 =?utf-8?B?OW9RZDZBc0V2bEwrWkI5YVJvQkJZcEZkcEtUWjgxb0czWVMrQWQ3TkFTa1Bz?=
 =?utf-8?B?V2Z3SHBhS214RkJBcHNoRy80TThla0h4ZU52ZVBZalViNDBmeElqOVJPanJW?=
 =?utf-8?B?Vm5yWjcxTmlrRVRNUU8zb1h6WUJqcWJnYTNBRWJ6Uk9SRWp6NXFWUW0wRmRu?=
 =?utf-8?B?WWNZdEZCcUpHeGVHZ2l2TjNrTzRNdEZSYVprZzNPYVMvaUZ0cWlUQ2ZxMzha?=
 =?utf-8?B?cTNNYXNUQysyRXpTdjh6VDhrOTh0dDA1UnN5VlhaamtwSFVwTzloUXdVZ0Z3?=
 =?utf-8?B?UzJoMmtjK0hhTU1qTk1NZ0FWY3BDblpSQ2RobURUTE9NSDNEMmtNc1RSakZn?=
 =?utf-8?B?Rnc4NlRtamlqZkRIUTV3UW1QVnlRZDNPeDBoSWJ5elJkYnN3elU2eTFWTkdx?=
 =?utf-8?B?cTVEL3FzblN1RTlPU21zajNnRHZLenRRQWhOTWF2c0NmWjNBNGM4UlJWSUIv?=
 =?utf-8?B?VlphN1d1MDcwV1dnSGROTUI3SDhHZEZScFVXZW5CYlZ1cDFpZmV2dWFrZTdD?=
 =?utf-8?B?UkRWNG5wVHFneUJpRUU1cnpMTCt6b1ByNldidVltUW5FeDRTQ051SXJESmdY?=
 =?utf-8?B?MWNQL2NWUEk5WE8rQVRLTDNMb1JMTWo0MFkyT2g4MVdnSGt1Z042VnlOei9i?=
 =?utf-8?B?aUpUZEYvVHJobi9HblpGZW1xZ2J3R05ZZ2VIYTNxY3Y2Sll2VWtIamsxTWkw?=
 =?utf-8?B?REVmeHNvMEhDTlloTjMrR3NkdGErdDl2djZNbzdaY2pGTURlbWNtemdnOU16?=
 =?utf-8?B?N3o1ZWNmSENCamc0QkpHZjFxNGEwd2d3RkI4MlphQno2VjBPamRoaHZlY0FU?=
 =?utf-8?B?M25LK2pOWktFMHJFZjJxYXZZbnlvc0F0aDk1N3JlL3N1RU52ZU11YnRLWWJW?=
 =?utf-8?B?T3FkaWNtc095OTFtOGNidlVFM1lsekwwTTlUK1VFajFPUXh1emkxTHBKQURx?=
 =?utf-8?B?WGJ3QkpCZWJMWHV0aVJ1Umx5QjlUNXYvUlpyUlE0alVrUVlmdXZ1dGZvNkMv?=
 =?utf-8?B?MmlsZVdTeXNFajNlYVdxL1A3QVQ5cDZVaG1hMHljQUp5T2tBeWFaRFBhUlpm?=
 =?utf-8?B?VC9xdWk3eVVKZnRxaENyZGxFUXVJa3RaMXQxVmpLVGt0b2RLZFowbXVxNVVX?=
 =?utf-8?B?bzR3SzBDa2t5TVQ5MHE4SDBybSt5aFlQQ21rZW1zem15TFFkUEJKdlBzL0xr?=
 =?utf-8?B?S3hUeGFXd3phb3FySldzMlF1L3hnbDB2bXZLRHUySGpxN2grK0htNXJ1dzN6?=
 =?utf-8?B?cDNJcGxSVndSZ2Q1ajlIQ29ETDI5REhtdDRYNDIrWnY5RWVMREwrRkJ5Z2pZ?=
 =?utf-8?B?ZnI0VXRDaGowZG5zV3g5KzA0WUxpdEtmSkEvY0JnK2lEN0R1cHZVSTlKUzlL?=
 =?utf-8?B?YzBVYmZCVUV0K00rUk54WGEvSDJyb1ZSNkh0Qm1VWHo0VkttT0xMU05TQXBy?=
 =?utf-8?Q?3md+CT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 20:38:38.6914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ffbd09-8bb5-4f91-5a26-08ddc4a8bea1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4289

On 2025-07-02 04:13, Juergen Gross wrote:
> After performing a live update in stubdom environment some information
> about inter-domain event channels is lost. In order to set this
> information again, call xenevtchn_bind() from new_domain() in the
> restore case.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

