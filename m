Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E764CA9B4AF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966706.1356846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zqc-00080v-BV; Thu, 24 Apr 2025 16:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966706.1356846; Thu, 24 Apr 2025 16:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zqc-0007xm-88; Thu, 24 Apr 2025 16:54:50 +0000
Received: by outflank-mailman (input) for mailman id 966706;
 Thu, 24 Apr 2025 16:54:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s25R=XK=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u7zqb-0007xd-Dx
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:54:49 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:200a::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf49c8a6-212c-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 18:54:40 +0200 (CEST)
Received: from SJ0PR13CA0150.namprd13.prod.outlook.com (2603:10b6:a03:2c6::35)
 by DS7PR12MB6189.namprd12.prod.outlook.com (2603:10b6:8:9a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 16:54:36 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::c2) by SJ0PR13CA0150.outlook.office365.com
 (2603:10b6:a03:2c6::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.32 via Frontend Transport; Thu,
 24 Apr 2025 16:54:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:54:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:54:35 -0500
Received: from [172.21.185.2] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Apr 2025 11:54:34 -0500
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
X-Inumbo-ID: cf49c8a6-212c-11f0-9eb2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWXEgf6QUh6myIFWfDP06apA9bT9mkX5nKpsJ78KQQRVep6Vsk5S8CUX0IKBeWg91lfMiSPUWoWoPeYfgxPBFBBMjIjZwedi/lrM3q+UQv/nipL1+8iRHlr1D4qTGS0G2m6Uci7IPKD8PzHfZRypMPc+B9sJ0IaXeMi9DFY02E7aU7ZAv/NCdzQtyCAD7HO+KFhHM07tNAhC7W95xbdc1VESbsMaVEl42nluCh7DLI7yPnsil9bGojZ5pRHpjNXiEaVtiI90oJY26Ou2okq4vKIduqVocR/epRiltoaDgvA/69LlqRBn2ABBbme/pptMwDErVqYKhflJ0SDDNXKkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZyj+BsMd4NoIFxN13beaPvBCaoIPB0HJfw2DI6UftU=;
 b=nQqehV8Wf7ZGmlXm4Xt4gY92OvjJ+c0nbhISISiriC/wg2qzYLcr8BW20tFmlkptMkjbzzgUYn1VZEQ2ccYApy/HNCWcOcFhbsCGDh3vr5HnNcS4awpIsgktt5h5hPT7TxnOZlEayzDI961xLIqMFIWwVAayVuHdTQzY6e/+Ln5DmanW2YEoXRr4jcj92Xr1jBlMa5Orhy5stFhCc9tjIA4xrNqGXIiX2voxnqIc2rbE6OLS6Bzc9WsecgrDqMrla8Pao4mMCpyvtjRmwjPHxS6J1p8CUEOxBuV3iKHW7DwWSOa0D/plTp2WZYgkF1GnwTjdS+ME9ThOOkWcuG92WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZyj+BsMd4NoIFxN13beaPvBCaoIPB0HJfw2DI6UftU=;
 b=svs0hsW5QvW8JhmT7x6RpA544GjYNLrvch1PmHYCMBG/wPj757GKpIhN9txtrz6AEX+fnRoliV+qHxqurUPAOPkS6SIcwKox36fnfNcCfN0+QeWaF217tc5zK2kPLXlzscWUwtyt06ShFnakI4Jvp9MzIR2YIckzNr6Itrwa0OQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4f634f22-3947-40f6-ac2e-5670376a7980@amd.com>
Date: Thu, 24 Apr 2025 12:54:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] kconfig: introduce domain builder config options
To: Alejandro Vallejo <agarciav@amd.com>, <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250424161027.92942-1-agarciav@amd.com>
 <20250424161027.92942-2-agarciav@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250424161027.92942-2-agarciav@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|DS7PR12MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: aeab9f3e-bb81-4df4-9834-08dd8350b1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGRvSm9nOVNmdG1tS2psdkN3V3YwMVlpc0ZBeEdQSjE4bDNUUFlpUzNKa1Qv?=
 =?utf-8?B?ZCtZQ1V2ZzVRVjZicGpGelM1NlcvQVNSYzZZdUYrZTFicVRpZUF1TE05OHA1?=
 =?utf-8?B?VEFsNExBa3NmcU9Vay9zK0tZMno1MHNwR3NGeEErUC9VQVJVSzUxcUttczdC?=
 =?utf-8?B?SU45cExKWU9UcnNoUktvY0VIM1U1ZHlja0M1cVJmUjduR3Z4dDlCaS9UOVlI?=
 =?utf-8?B?N2FGNnpENzh0RGIyVzB3cW5PNS9zeS9pWDAyb3ZMTWZNTmxKNDNrVk9oRDZi?=
 =?utf-8?B?SEZqOUdjeDBZcTdEcDlYR21mc3FnWDJLdVN4ZTI2VHljZnF6dVVMMUJyOHNI?=
 =?utf-8?B?WmJybGZyb29IdjVUYkpvNjB2aG90anYrazNjTHJielo1NE1YbFljcmNaTTlB?=
 =?utf-8?B?cFUzbHNlRjNSZXlFVE13Y0RKUGk4MU5UYjlhc0NjcWFEc09KQjVRODUvRkJV?=
 =?utf-8?B?WEpJWGZKVDJZTCtwRGRoTTgyKy9IMlFMUlhEc3ZQWUFxeERHcmFnblF3Rk40?=
 =?utf-8?B?WUVkSFFiaENsUFRIbCtINXFwVWRYVTIvK3QxY3ZXZldjdUdGOExxRW1xb0J2?=
 =?utf-8?B?dkRnVGcxcktmbDE2Vy9Yb21CTXErd3ZITTNLOFc5RnV0ZFZJS3pvZFRTM1A0?=
 =?utf-8?B?WExaSnRIUGpVdkIrVHNIUmlVdFZGUnEwWTV3NWdTYktLRm5HS3ZPL1V2c1F0?=
 =?utf-8?B?UmNWNCs1TWlMbi9wbkZPa29EamYzQ1lUOFZaLzBWdFY0Ykt2dDVDcFFqZFAz?=
 =?utf-8?B?NGlyb28zazJMampTWWZ6SURtL2ZxSUx0c3NLZ3NRallhNTVkT2hzdVdoQVBM?=
 =?utf-8?B?aGIrbkVDa09ZTU9FeWdmSXJyNmFlM1JyUVNHYncza2JvdUxoV3p1M2sxQ3dm?=
 =?utf-8?B?ejAvc1JrVTg4UktvZlcwaCtiRlZaeW1zbUQvM3VJZUtqY3dITjVpN0VFaCtE?=
 =?utf-8?B?ZVh5bHByRzZKUERqSzU1VXp5c1l6SEJJSURmaUQxL1pNYXpZSjFqeWJzNXd5?=
 =?utf-8?B?TkE0R0lHNjA1ZEREWW8xMVIwMElDdWNwOUt3ajMwc0R2UDhLV2oxTzNmL1Vz?=
 =?utf-8?B?eG1XcTFycVdCYkxVZ1VSYlE1TUhmellGQkZkM2MvcjlTRk44VmIwTXdueGN4?=
 =?utf-8?B?ZFBhaXorR0tESG0vSEpHbGhRQlpHS2xUM0ZjN0NkejYxVU9vN0cxbmZWTU5L?=
 =?utf-8?B?a1lXZ2duK245bWNzWE5TOVpERE5MNGlrUW15VERaa01iS21QclpQRUFHNkpR?=
 =?utf-8?B?RVdHZmRIWkgyc3NraDJZa0FRUTNYNWo3dElsOWpIcDlhM0NhSTNRZWpZNVhT?=
 =?utf-8?B?ZjAyekJCak5sVk4vcnFpTWNyTEthcENBNlgzV214bVFubCtVZGZyaWwzMzBZ?=
 =?utf-8?B?eVRIYzZ6azIzbm1VdS9lbDlNREVGSUtvWU90VGMweGVlNXY5c3RGM0xRLzNw?=
 =?utf-8?B?WTcreEh4K2lpMWRrMUVUa2RoS21DYnBXYXRMcm5zWFpMYjAzZE5Vdk5xNHJs?=
 =?utf-8?B?eG5KZlJiNFAxVXBBdTkwWUpzZUxBQlhVMkNyTWRoMzNWZ2dMbDF1YzU3WE9l?=
 =?utf-8?B?c2pEZXBySVdxazRMcVNrVkFhMGpEM1M4NlRmUUFOSlhGM1k1cVg3WGNOMWZN?=
 =?utf-8?B?UkdzajRXZXJJN2E4aTJSU3plVEgwekZ2ZW9sVm9yN3VnRXZyR1lvdHUwWHhX?=
 =?utf-8?B?QzYvSjByYUlHMEY5N3dWWWNwR0grRS9iWVhxeFdlOWVoLzBXd21GQy9rdFpk?=
 =?utf-8?B?SWdLc05STGZFS0lyL3IwNEExa3dGQkNjdEJIeWorWUk2RVVuMW15ZDlwUTFm?=
 =?utf-8?B?V2s3Yk5NSm1BejNIakcybFArMG4wT0s1eUNLV0kyQWIvemNtdW4vY1dqamla?=
 =?utf-8?B?T3BmKzl5MnUyRnlGQlErbHNHTWo0WU5yQ1gwRXJETFpOODViSU5TMzJyR3Z4?=
 =?utf-8?B?Z21KM3JpeWMyV21TeVRLaEt5RHEyc1pETmk5Q0Fkb283MHhkeGRjOEVxUzFC?=
 =?utf-8?B?eDl5ZStGbVpHaHhUM2pPeXZDUUlWMnhpY0QzcGZyVlg2MjhtNklEQS8xVytN?=
 =?utf-8?Q?m/4Brm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:54:35.8540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeab9f3e-bb81-4df4-9834-08dd8350b1cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6189

On 2025-04-24 12:10, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Hyperlaunch domain builder will be the consolidated boot time domain
> building logic framework. Introduces the config option to enable this

"Introduce the"

> domain builder to eventually turn on the ability to load the domain
> configuration via a flattened device tree.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Maybe the title should be "kconfig: introduce CONFIG_DOMAIN_BUILDER" to 
more directly state what is happening.

At least with the typo fixed:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

