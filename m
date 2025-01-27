Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C59DA201BF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 00:34:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878215.1288384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcYbg-00037w-PL; Mon, 27 Jan 2025 23:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878215.1288384; Mon, 27 Jan 2025 23:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcYbg-000361-MH; Mon, 27 Jan 2025 23:33:28 +0000
Received: by outflank-mailman (input) for mailman id 878215;
 Mon, 27 Jan 2025 23:33:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=naHB=UT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tcYbf-00034M-Er
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 23:33:27 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2417::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19d078d7-dd07-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 00:33:25 +0100 (CET)
Received: from BN9PR03CA0851.namprd03.prod.outlook.com (2603:10b6:408:13d::16)
 by IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 23:33:19 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:13d:cafe::8a) by BN9PR03CA0851.outlook.office365.com
 (2603:10b6:408:13d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Mon,
 27 Jan 2025 23:33:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 27 Jan 2025 23:33:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 17:33:19 -0600
Received: from [172.25.15.116] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 27 Jan 2025 17:33:18 -0600
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
X-Inumbo-ID: 19d078d7-dd07-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUuDqzaB0Zi2V6w0DABju2xfmlmuidoLoWkB8w7kqmKSRF2xUkdMe3zdl7KMmqORYFELORdeBhnHMvwtwuzGpt9QwYuxANWIbLJqt0R+QSq4A43ipAfIUtB3eXzHvixaf8LNwoRx9U6hUa2ZccuW+zJp6WsXO3nSv1eyzAJNfJv5X34lSHEsOJPJkiT0wAQ1/1VMSsMRchl9j1vd9R+1F+c6b6vWvaELyeWao+5ws7X5lDXQgUmOEQnaO2O2OFh15m8q+fzCwjpcIOcd4TI8ZixqT7ljm+MLUrNulMe9D3PpZE7oz0yPXY/Me18Vzf6+ednzd/TU3uk6RLSht7UIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6k4DeMismfzkqkCW0o6yQxdPhpIslPeKiYHO5MWffsI=;
 b=h9Jmfy1DoEpBe2/t+MwYHc0cpl0oMs1x2daGxGz7eSRwUjOYS1wQgU6Q2DGkZ8b/UioXQLvaCoY54YduSEb9g/9jKbyEyhVPiIKe1icRE+yI8Tt7LytFOK2GbxTueGwx76YjqKyPbQBlLtJZ5PDmEKcrLe+zm91qPnAruclP+m0i4qyKkPXbnYNizHLes2Shhe7w6tgTYlPSQrLjyQaPXTRHgYSU0MTMM+mRn0TTsyc6ihS0jpVawM6SVmWarHilwhPFXvxdTINvZh3cDhrQUdspL5g5+bKBxmF6Nw1nCB97ip9mG8um8E2WjJXx13TzGVlKqUenV/diN1e1LXlGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k4DeMismfzkqkCW0o6yQxdPhpIslPeKiYHO5MWffsI=;
 b=MFnfslIvw9IC/OrLgaqa/Uh6DJkjmySbwSd37Q0y3ERYtxK9DU1nbBEH+i64bANBtdbInnXhH9tVwUxaR5OnmwaESaPvBuIfnZQEzsPH7idRGOXXLsouGiMy8m4AkoQPW5ZjapCNeB/sfVqDPCQ9cn3eyS8x4FnzY/7x5jARAFA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <228a7d42-682d-4898-be1b-03fdd257ad70@amd.com>
Date: Mon, 27 Jan 2025 17:58:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/24] arm/vuart: add hwdom prefix to UART emulator
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-3-c5d36b31d66c@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-3-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|IA0PR12MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: 500ef756-189f-4a3f-a717-08dd3f2afb9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDFuWUpzWVJ4d0pDd2o1OWlGWVFwUUhqeWtVZTkwa0U3elpMZk9kWkFLTDRo?=
 =?utf-8?B?R3AwbjZpQWl3Q1hOREZUNm9XRXhYVCsyME9KZnpZZHJUc040VEsySlJYM2RD?=
 =?utf-8?B?ZTBvVHZnSHFURG1XU0hlcVhDa0NoUDBYQ3hKWWErRVc5MjhaUmE0SkJ0dGYy?=
 =?utf-8?B?VE10SEFDK2loays2SVRhUjcrcGJTRk9SaUxNOC96TTJDL0M1Z2ZoWXdvWnh5?=
 =?utf-8?B?N2RRUjlFY3RYY05OSndHd1VYVncyLzdSb1FKYjFHRW1sOXhwL2Y3cVdlWjJT?=
 =?utf-8?B?TGtMWE0xSFZOcTFadHpRVm4wTTQyQyt6ckl5VUtzNlhNRTF1TkR6MXRTQStF?=
 =?utf-8?B?Q0lCbE1pUVlDSDNSNlhPazFTbnR2SFlNRVJ1Y09MREw4V01PaEg1eG5tTTFt?=
 =?utf-8?B?NVNnRGRHS3I2WHVVdlJvdkYxNElHRVVkT2ZRY2Q2WjZNNUoraGt3M3EvMWZh?=
 =?utf-8?B?QjdRMnlaY0ZZdGNsVzRuVGVzcUtqbVNiU2lORjhEOXhpM0VGMXhaTktuMVM4?=
 =?utf-8?B?UFlRMndCVXdXVkNjb0hjZ3lrZG9wdXFJVWc3RzB6M2tERzJzUndUdFBjcElr?=
 =?utf-8?B?V0MvWEV0K0xZWVRnZXdTdjRUay9QeWRrcUt6Q0ltbTJyc294aG5ZL2djV0F2?=
 =?utf-8?B?RFh2RkdSRis2ZThYS0dTa0lLc0lCMFg0MUVNazNtWCtoM0E0WEQ2UE9pak1p?=
 =?utf-8?B?ZmF3cEtUNHpMQzROQUFJUW4xbDZUUElzMWFxd2JCNkJ0V0N3a2hsdStrcmJN?=
 =?utf-8?B?WUViU28zOHpkTW9xcGFmaHdIV2tkY3dvNytsWGE4cUtVUHA2UVVKM0JQbkFa?=
 =?utf-8?B?WHN6a0NzSTMydUJsYnYweWRDYVFodGp0dEhwSzhLTGlpY3pyc2NWVnpjenZk?=
 =?utf-8?B?c1NvMzdEZ01DQTluS1Z5TDZzMkZiT0FXVVNSb0ZyaVlyaldmRG1FZnRUU3FN?=
 =?utf-8?B?Y3dGdGdVbXdHUm02TmZONXV2azdUbURaRUluaEp4TlpiL29xeGtRR1VhMTJO?=
 =?utf-8?B?NlcxNEdUcGdvdWgwUXJaS0VrQmRRb1h5K2k4azRxTENyUXM4cEd5VFZQUjdx?=
 =?utf-8?B?ZnZyd3NUVW1IOEZ1M0taOGt1ZnB3TC9IYmU4bmZ6bXJGL0F3Z2VjbEx5WE8w?=
 =?utf-8?B?VVYzaCtpWGFCY3N1N251L29ON0ZTaFJwTmdOaWtMTk9MdDJ3UG0zR2Y5eUxW?=
 =?utf-8?B?b1pRRDhTT0w1UlBHRmR0eDVDY3JVUkRCQkp1UEc0MTlxblJCcE5HVktCOWlC?=
 =?utf-8?B?M3hsM1Y4Q08yNzU5elpFdXZKQ0pFV2E4ZG5Cc1V6Ynd5MzFXMEpUZVFDM0RL?=
 =?utf-8?B?UGZyZlVpRHdEYmtLaEZ5clh0MzdCK3BkeWJsQ1gvUHE3cy9TSXU4NTN5eEtY?=
 =?utf-8?B?dS9TN3lTTmh5Y1N2Y2xVU3BoenBQc1VFcisxTmVQbmNsRW1lWG95YnpEOVlN?=
 =?utf-8?B?T21zQVpkbDhrQnhkQlBWYktobkE3SFJVdTZMRURJWVlPOFdzd2NPdVBYUysr?=
 =?utf-8?B?OXBwdEZKeU5BSlk1RXM4WFZOSUtFU1NKSzRHdkovOEpQSDdCQWxBTjlkbnRj?=
 =?utf-8?B?bG52MVdTUkdaVlVUSjBpeVhRMFY2QWxzaWt6OUtEdnpuZXVjQ0FtSmQrKzkw?=
 =?utf-8?B?eHhWeXdYYjNmaWtqclhXSkRTeGxZYWFVVjg1eVpOWlhHTXlrR0pxMFo1R0Vy?=
 =?utf-8?B?RTJhcmliRXlEbDdHL1NDMUpXUDlCa2ZDS1ViMTd1bVRWZnBITWZWYllyR2F4?=
 =?utf-8?B?eXdaRit4M0lCMnAwL2htMTNNdTQrM2M3bzVMYTZDVC9iMkM4Y282VUtDcTlJ?=
 =?utf-8?B?bjdnQjdwTFBCYkNjV0Z4RHJzVzIxZTNsajVpakRuWHgxc0lxcXpFdXRsdXQv?=
 =?utf-8?B?Mkp2S1ovQTJTWWNoR3hiQlEzQW9VUVY2QmJtU2hOYzE3YlYyb1I1V1pJNWlY?=
 =?utf-8?B?MWhrQ1hFZXhCaUQwUjBTVCtZYktYNXlCc0tuRC9ETGc0byt6eVVqVE1OTHFK?=
 =?utf-8?Q?KA4gdC74wgGId5Sxffv4lU2YX+pkEQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 23:33:19.8155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 500ef756-189f-4a3f-a717-08dd3f2afb9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8422

On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Using "vuart" in UART emulator designed for hardware domain debugging
> is confusing in generic Arm code (e.g. vpl011 is also "vuart").
> Fix that by adding hwdom prefix to all symbols in arm/vuart.c.
> 
> Also, remove domain_has_vuart() from arm/vuart.c since it is not needed.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

> diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
> index 98a65b99385a2a119725bab8634ed7cf9d926d68..23e05dba3a5617863f6c08f085c358f2cf32a292 100644
> --- a/xen/arch/arm/vuart.c
> +++ b/xen/arch/arm/vuart.c

> @@ -66,15 +64,12 @@ int domain_vuart_init(struct domain *d)
>       return 0;
>   }
>   
> -void domain_vuart_free(struct domain *d)
> +void hwdom_vuart_free(struct domain *d)
>   {
> -    if ( !domain_has_vuart(d) )
> -        return;
> -
> -    xfree(d->arch.vuart.buf);
> +    XFREE(d->arch.vuart.buf);

I guess the code before and now both relied on struct domain being 
zero-initialized.  You've made the free depend on the actual buffer 
instead of info as a proxy.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason


