Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9335889C25B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 15:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701977.1096670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtp3S-0001F0-0O; Mon, 08 Apr 2024 13:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701977.1096670; Mon, 08 Apr 2024 13:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtp3R-0001Ci-Tq; Mon, 08 Apr 2024 13:28:57 +0000
Received: by outflank-mailman (input) for mailman id 701977;
 Mon, 08 Apr 2024 13:28:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oSlD=LN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rtp3Q-0001Cc-Kd
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 13:28:56 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:240a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1c4f647-f5ab-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 15:28:55 +0200 (CEST)
Received: from DM5PR07CA0111.namprd07.prod.outlook.com (2603:10b6:4:ae::40) by
 SJ1PR12MB6220.namprd12.prod.outlook.com (2603:10b6:a03:455::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 13:28:49 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:4:ae:cafe::39) by DM5PR07CA0111.outlook.office365.com
 (2603:10b6:4:ae::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Mon, 8 Apr 2024 13:28:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 8 Apr 2024 13:28:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 08:28:44 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 08:28:42 -0500
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
X-Inumbo-ID: f1c4f647-f5ab-11ee-afe6-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQtKS6YAAcQI0A6U7rcu1IbpCQU5Z7wz8f9wXATdi6o5jEwphqvMQ09S5YCRUJxX/Fa81CLqsvrO6AtEQRXVgv6JuUFpi+c3PO7wJCnd/gb2iImDAgtn1NfQIKutPpZ74uWqjtkJaaoqtRbs3CuKlf6FX05T2GeL4QOR19oSRs7pAlBFQOlx95xAl0H6CgL8emCPHhChjNun+0UpJSxx4+8sRKUz7S9TXAq3luVCH38O2YC1EE4HOD2+kR9K7m/0eD7vFkpmpjB0ezooz1OT5LPXom546wR8SWyfAeInhqQcoq1tuy6yBrzzmOjie4lSqHB5MTF/eE/uhlS29k0GWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCzvFpzlkGtIgOmFHimXoV6gWa3+7YlqTrsgomPvHqg=;
 b=UXnG6T994Y8T0G/hS+VEwpIPP1ol2DZPjZl7D9hAeuIiFutnZ+Ldy+F6ZAETi2E1y/vJ6HZCzP/tubQrB5iOOxyIj3wqQdDqvWgADz+QVpVhYNFq2NhDT8f3iB76pxJpqq7lD1WCPkkbknL7q4926LYN0mJwLCJljfA1mjypwl6u4eMHO/Ag4/n+PFMoBX/eYLVHufyJMmQCnSPbN3fFR9EPG6P8bD0GJSfxw69nLb3R8JapOQW3BKAuTptaQPxl2k8z9fU1tG8spoLrYolBt9CHD2L5VmpYV4C7XHOXhU/+nAAUqVBoaFf3GyCsvuIgXtLkOiIcyH7DxNZUpbHN+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCzvFpzlkGtIgOmFHimXoV6gWa3+7YlqTrsgomPvHqg=;
 b=3d8uFTQmKLtyO9CfS0JHmy0Qj4tr3r7UT6vpsO/zOm4mIWOVdJD2baj0zIsGrK52fO3/zj+ioOa8W/7L9M3BaSSeOj9pBQHVqYz/E/TspG/xNHw64EgwR9XXrrfLq4vcidXujDc31DmOTYsbjttIb0ERWQmqb3LOp5og2ap97Ho=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e96c902f-1faa-4b45-91ea-6e47759a9647@amd.com>
Date: Mon, 8 Apr 2024 15:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] Add requirements for Device Passthrough
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>, <amd-xen-safety@groups.io>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>, Ayan Kumar Halder <ayankuma@amd.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, Mykola Kvach
	<mykola_kvach@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20240408131945.476581-1-olekstysh@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240408131945.476581-1-olekstysh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|SJ1PR12MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: ea69c064-5052-4841-1a06-08dc57cfd0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oZ6vC5Fvz43XIdHYLLZlxBBfUM7FNSH5EPbYWJYBfquoyQzTt6aICDbLZH3XXwn/bUNhieN7ZFxhRGrfgWFJarJRaxqwFiSB/dDampsQSWeNd1dQxCOFY+yD4yUpxgRvVbHKlHvveC0JlWkR0wEy5FvPe8DfEKavgI8npstfKp2T2IswzmiJfoc/OSzT0qIQ8lSrkPGpare4fw5UroBF90XgMGh6MccG3wI0qgmE5DahA9YzadHSjPELDcB14sYPIvt7ePWkAOzdYqnTYE94WGNDozrzGBNHjP9gQnqR1FaXu4GFE6PqWZTVC7wl1DGR8z5N3uUeckiZLYY0uD+VRsqqENo0Kfdjy0/ZQAYFJAOOJWEuYWyWyitikGfbKoq9L0USel4N/8MKwNqrws4TiP0wdcUqbi3RpJLraeiUhg8Smug9lcIBav+EfeAa7oUxaAeIPzPIe7qJsqYpP/7FA6t5gK56lskuLhVbiMMbGJjYOWTx0PBz1AdtWOI2hLK0Fp/PrSZCgsvwrVnni/O4DWgK+LVeXBJSWw4Wo6DMF+z/nHIap+6y+hzcF8IWNVGZsVpP7zQKychqyGnxKb2RLDBB+Y9gMrj0+dHdNubjJEpK/Np8vVG/e4nv4N1pUchkXbfOgUzuIfVzQEAP7MmAKpheKT5QA/gAy7EpGx2koGQbZL1SRABKD01QUMCNf1Wx36rW6Ro118sC6c00heK4hw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 13:28:44.8765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea69c064-5052-4841-1a06-08dc57cfd0be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6220

Hi Oleksandr,

On 08/04/2024 15:19, Oleksandr Tyshchenko wrote:
> 
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Please refer to chapter "Device Passthrough":
> https://groups.io/g/amd-xen-safety/message/1300
> 
> Create corresponding directory and README file.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Now, it LGTM. I will wait for Stewart to check PCI requirements
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

