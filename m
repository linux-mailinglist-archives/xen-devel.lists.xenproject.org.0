Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B46765D251
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 13:19:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471165.730898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD2jd-0007IV-Ar; Wed, 04 Jan 2023 12:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471165.730898; Wed, 04 Jan 2023 12:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD2jd-0007Gk-7n; Wed, 04 Jan 2023 12:19:09 +0000
Received: by outflank-mailman (input) for mailman id 471165;
 Wed, 04 Jan 2023 12:19:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ETE0=5B=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pD2jc-0007Ge-AQ
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 12:19:08 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb0ff6d8-8c29-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 13:19:06 +0100 (CET)
Received: from DM5PR07CA0088.namprd07.prod.outlook.com (2603:10b6:4:ae::17) by
 BY5PR12MB4065.namprd12.prod.outlook.com (2603:10b6:a03:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 12:19:02 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::43) by DM5PR07CA0088.outlook.office365.com
 (2603:10b6:4:ae::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 12:19:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Wed, 4 Jan 2023 12:19:02 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 06:19:01 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 04:19:00 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 4 Jan 2023 06:18:59 -0600
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
X-Inumbo-ID: fb0ff6d8-8c29-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEmue9qvMhHZsyPXoDTayU+NimjKOXrhG+ZpRKQvxKm4rqeHPAu6N5ZKoHBTWYpthOM4nLncmGH+XqofpqRiwEJdSaoAm7OnMHcS2nZXyXNZvsmX+SswPQPpF4vlcxI3cpddJHqHEKSsqvBTEOiaaseQKi4nHrOk2N1sdfQYwl5SDKQO6Yu9N2Nft1fpagNdZwKMo6HPWzXN1IbSf5ReOAp9IKK3bnxF4hevGsu6arPO8PT0tiS8x4QSginkM1bwFCVs4zP0iaMalp5fW9gPlosQgmU2yjVdxpka/ZENVXj+M5HLuMFgoybdaYtDBUUcadMiBwVgMMrxoaH/LoWqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owsf/i7YRUA/xls2EfGwWANAD2PSYeWoOIm1GTKWhJs=;
 b=m3sicxencausxZSruM0KMq5xqkefUdOWIplYs50FDHeSSS4P4QxYfx9XlMVCsToBhumuGVGFrD1hBA0Qyd+y23s8ipMBCQCeiddKso9OKbjWzq9tMYPpmBMCBbfrchL0+7n9V1UEmeBv1v5v8PC3TViUfDhr76LmLgSYUI3DpSZ5rzMLMvuKmMIF9qL8WwSXYLaprPqacaudpaAnpPbrZqLAOLUpfkqGnKSV5jV90f7+GRaMlREdv/SOMxHBZmeHG4Ui7PqgNI+m+9LhfumzKC+xOmcXl9bGDcH3kvQ2FXN6fudhVJLGMrlrlB7xyn+5TBCrV2kOkvBUlPJPgyYBRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owsf/i7YRUA/xls2EfGwWANAD2PSYeWoOIm1GTKWhJs=;
 b=XtTj6DBAJ5zPxwKrcytbFkik7GXCDHgOukujzK9pLoS0P8iE5lVP3vcg/rdSd0KxkNcypqUNH7BGxNhrSJuYN/BvDNdBBtZ3aLjFboCG0TQ/cAFdmEGVDo6dNryzeG96F5rNgwteAWxpt4Eio9QnXiaBPqMYv0Spts8DTgIFThg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <dd3f16ac-98d5-356a-c55b-508f142c1b1e@amd.com>
Date: Wed, 4 Jan 2023 13:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/6] CI: Remove guesswork about which artefacts to
 preserve
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
 <20221230003848.3241-3-andrew.cooper3@citrix.com>
 <07b5cc36-e0ea-9b51-036a-9523920dd74a@amd.com>
 <c48536e5-37b4-4dbd-4715-cd8d776e496e@citrix.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <c48536e5-37b4-4dbd-4715-cd8d776e496e@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT038:EE_|BY5PR12MB4065:EE_
X-MS-Office365-Filtering-Correlation-Id: 190b7f70-2a3c-4127-f0d9-08daee4ddd8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tDmtTo64YLeyM4hvsK9hyH/48CI36WZQNZ2xcPF36btRe7dc/mA2YiSAXMubh13ZRmCQlSEDdnMJfBiKs4UFITZzGcsQvNd6x6s8xzAmnleINxWMspj7sv4IMZAxdQHx5kGdWcQ1lCwsfigmr38FK91cXS53+yPe3dMt7RXcC/2GOR8JGg9wyACRNf23ukNoAesoB+z3NqzPPtlvKdooweyn8Rz5KHiyEQU/ki1HTLMDbp2zWuEOQ11FHoNFh3RfPTEQ/FQdaa2sxhK1seA5OBdCbJmlkLLshXThcjCrKFmCnLFtFkGifbxXkNvFwjENEWn/1p99JZiHJ/lR7M3LR+JEo7BWx/zKgHYSa1oXCi3cOHVPOfijKUDR+K3uqIYn+TS/upQTQ7RRXz9yWS1finqFAYYhX2V3ft98C5TjN0XR7/EM4SCfwxzUxeJwUlzdIJjEy+XlFhlx/9NavhkfJEFVQSwkzTYu+y7LqnJIn1WMaKU66oQg/dUYU5uYVNv/oIpzYbQu9N1KlAsaYBkwksF9ESYRhEkNgAKmEc+zUxACWxRW7KZtlUrKJ+7MqCKT0+yQfbFO5LTeElRZR0CQ3HgIHvXovEbsXl+trbaToW4JFF5pT9FVYnUMvCqLNW85AdGzhaRl7VVqX5IR0w4bkVMvyI3IRGjTMyaACKloU++lpfY+1QgzXlwdjgOZ+8cgUv1og1fznXKO6siwJ+MvCz+aFAOig5ssULeirghrzTFT+ttFB4rw5gd7XbOTev+C+rsUon52pyPXuQTLUGmiog==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(2906002)(5660300002)(31686004)(8936002)(44832011)(4326008)(8676002)(41300700001)(54906003)(70206006)(70586007)(16576012)(110136005)(316002)(478600001)(53546011)(186003)(82310400005)(26005)(336012)(40480700001)(83380400001)(426003)(47076005)(2616005)(81166007)(82740400003)(356005)(31696002)(86362001)(40460700003)(36756003)(36860700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 12:19:02.2459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 190b7f70-2a3c-4127-f0d9-08daee4ddd8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4065


On 04/01/2023 13:12, Andrew Cooper wrote:
> 
> 
> On 02/01/2023 2:00 pm, Michal Orzel wrote:
>> Hi Andrew,
>>
>> On 30/12/2022 01:38, Andrew Cooper wrote:
>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> Preserve the artefacts based on the `make` rune we actually ran, rather than
>>> guesswork about which rune we would have run based on other settings.
>>>
>>> Note that the ARM qemu smoke tests depend on finding binaries/xen even from
>>> full builds.  Also that the Jessie-32 containers build tools but not Xen.
>>>
>>> This means the x86_32 builds now store relevant artefacts.  No change in other
>>> configurations.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> I'd prefer to keep using "artifacts" and not "artefacts" as the former is what GitLab uses
>> and what we use in build/test.yaml.
> 
> Xen is written in British English.  We're forced to compromise for
> external dependencies, but xen.git is mostly British not American.
True, but from the consistency perspective and easy grepping, it is beneficial to stick
to what a subsystem uses by default.

> 
> ~Andrew

~Michal

