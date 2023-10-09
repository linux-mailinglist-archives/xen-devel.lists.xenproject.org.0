Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 814D57BEA61
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 21:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614436.955499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpvfl-0003Wl-6B; Mon, 09 Oct 2023 19:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614436.955499; Mon, 09 Oct 2023 19:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpvfl-0003Tz-2u; Mon, 09 Oct 2023 19:12:09 +0000
Received: by outflank-mailman (input) for mailman id 614436;
 Mon, 09 Oct 2023 19:12:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjZ2=FX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qpvfj-0003Tp-QF
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 19:12:07 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb7a879c-66d7-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 21:12:05 +0200 (CEST)
Received: from DM6PR06CA0008.namprd06.prod.outlook.com (2603:10b6:5:120::21)
 by BL1PR12MB5351.namprd12.prod.outlook.com (2603:10b6:208:317::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 19:12:02 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:120:cafe::20) by DM6PR06CA0008.outlook.office365.com
 (2603:10b6:5:120::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Mon, 9 Oct 2023 19:12:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 19:12:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 14:12:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 12:11:57 -0700
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 9 Oct 2023 14:11:55 -0500
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
X-Inumbo-ID: bb7a879c-66d7-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuM/2eVD6wkx3a4SE5RnhpMPrTktGZIhCBI5c5uWhLIMBTDurwb7aFHKUEut/rCcR2E2BNRCY4UEkuLOI+d4VdgRQ1SXNW+Fo01Okh3ukZHzAnye/6LbL/kPTy3zujK+9R6Zu5VT0xTwbja+EkC0jnpXsTBKst1I3og+eAdKjyo3jNPPzCwG8nS1+cRzDKMYLi2hbevyLzWFV5/OLUWfnZhJbugrK3sz1itxeSBV92DEzFwRTHhN1lPy+eTaVMvor2/SBe3RMrLUwnJVuJ7yWqi4Ost/z9AgYqGyh+Ef7I3sHbtnQnmYwDtNVznA0hY5h172peL95AkIAc964orDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXX3+enYEIy9Xuha+38PyOpC55xe1RxOCwUP88fO3t4=;
 b=DiWHxge58iSsVn01ypmI9d9K5UhAVmRJDNgzXG54tqd9A709Jx2+D2MkLcLaBsMsJDVyaEY31WTTy6jFr9ihQ+BUQMh8MJBfWxY58KLQQxORTvbko1S1RCC0x5dwb1PJdVgqQ2hOm3nf3rkrcrvZxhE94D1V4MwbMhaw3LzC6+84RnZkgl4PqquVYn1TmI2nLEkhYeng9d47DMdlGS/deX8FbW0+8byi0a9vu/aNPxViIFMNTmB0azamf1kl9BZSVHJlWNMX0iY5AM7jkhOm/YaS29CUxPF8WYNE6iu1ZTeLtukGqiWKeBNYbU3bMIdsvImifZ9NruEsukuGsCiRuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXX3+enYEIy9Xuha+38PyOpC55xe1RxOCwUP88fO3t4=;
 b=wmkmzG/7/vz5CX2Ot9VtwufwUwLd20zKNrFgoqY3JBTDiRl3EptaT2H3Wbbbg5GEtQNIfItfUPGjLsgr4CTneSQkS+UnggRIvNKy1sFw2jzDHLEmDMQFJH3gP2fJw8yAIM7579gEGuThRZSqaaW26MlknK9ldaeo5vmgHah2u4k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6523e5eb-e46c-49fd-b119-7026fbb686f6@amd.com>
Date: Mon, 9 Oct 2023 15:12:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-4-stewart.hildebrand@amd.com>
 <e5a0ed8a-d85b-fb60-609a-f46884433c60@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <e5a0ed8a-d85b-fb60-609a-f46884433c60@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|BL1PR12MB5351:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1c38ca-9664-4db9-c5a5-08dbc8fb9df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aubYSTN93ogbGFmj4uBe8xQWpDjR5a1G8izyXtP9gK+mFqtQvKMtn4Bqy97hkYCzG+zO+X2BGcvM2r0nf/gie6E6bYk66+rHhvGjI1k7fhml6+CPW7bprF4PBMB2vJ485GdllqFQLLmwaafAV9FARjnKkw8zgAtzPW0SBtKdMMv6qf7rWgNy5j6pbbDbOcRQsYvwtvEdORWrwihrHWzMACuGiuLuUgXxgXLKWc2Qv0T6Pc3VPc5N1xO+yDANWWcvmunE7g9dSQ0dAl06vUdnxy9P0B8alQr9HEYQ5kWkjvPHlvCwtcWWCZDOuABKmwZwrHRDR2rBBbsgoUAb2sCgZNOv/jmZoIFXOAcSKKW5EiAMryN/BAvWHQJjakBbfJ5Ud2XSwHNgRfJxNiSO2Tr1UZ70Dh4+cNUcAnBtA067x4gFTUXsJH/oIkViaAz/jA8UgUbdBW6as0FHtoWttAdrM8EZ5GyrVc2bOHPZex4/lYnX+wvJqVvPlOESN0iNLQa0WF2vXcGSpQ3rqqwdKdnR3g3gmsjk2cP+3FRAbYnXm2QhocZQMcO2KQ9sH0nNcm1nOCRagjTb3V7YEeuuxaAykQwZEW8wJF6dejolCit6djwpM+MNx0BDgNDTkYbsmOh4K9POpiivYnSO8zbyao54VGqrl4Pk0CM3tiHxqJnOk5C9DBXv61KDNg2tDHIxtLY8JWUrB8aat2jmxUBkg7RNSSJsJS7dSVW4fAZ9foIpXXJVmVQUeBnQLQ50NpEYSYGkM0ZTq4PAiLwmGWXncrUmE2x4mL58DYOd2beEryshUns=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(64100799003)(451199024)(82310400011)(1800799009)(186009)(40470700004)(36840700001)(46966006)(31696002)(356005)(86362001)(36756003)(81166007)(31686004)(82740400003)(40480700001)(2906002)(966005)(44832011)(4744005)(478600001)(41300700001)(53546011)(8936002)(5660300002)(4326008)(8676002)(6666004)(336012)(2616005)(426003)(40460700003)(70206006)(54906003)(110136005)(16576012)(70586007)(316002)(26005)(36860700001)(47076005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 19:12:01.4686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1c38ca-9664-4db9-c5a5-08dbc8fb9df4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5351

On 7/7/23 05:00, Julien Grall wrote:
> Hi,
> 
> On 07/07/2023 02:47, Stewart Hildebrand wrote:
>> Remove is_hardware_domain check in has_vpci, and select HAS_VPCI_GUEST_SUPPORT
>> in Kconfig.
>>
>> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00863.html
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> As the tag implies, this patch is not intended to be merged (yet).
> 
> Can this be included in the vPCI series or resent afterwards?

Yes, I'll coordinate with Volodymyr. Since this has a dependency on ("xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option") I'll continue to include it in this series until the prerequisites are committed.

>>
>> Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
>> code base. It will be used by the vPCI series [1]. This patch is intended to be
>> merged as part of the vPCI series.
>>
>> v1->v2:
>> * new patch

