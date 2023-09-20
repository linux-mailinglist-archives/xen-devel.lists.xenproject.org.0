Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A54B7A8659
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 16:18:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605772.943356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiy20-00081I-BT; Wed, 20 Sep 2023 14:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605772.943356; Wed, 20 Sep 2023 14:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiy20-0007yc-84; Wed, 20 Sep 2023 14:18:20 +0000
Received: by outflank-mailman (input) for mailman id 605772;
 Wed, 20 Sep 2023 14:18:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7wrp=FE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qiy1y-0007yU-EN
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 14:18:18 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20613.outbound.protection.outlook.com
 [2a01:111:f400:7eab::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8964f27f-57c0-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 16:18:16 +0200 (CEST)
Received: from MW4PR04CA0077.namprd04.prod.outlook.com (2603:10b6:303:6b::22)
 by BL0PR12MB4964.namprd12.prod.outlook.com (2603:10b6:208:1c7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 14:18:11 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::ef) by MW4PR04CA0077.outlook.office365.com
 (2603:10b6:303:6b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30 via Frontend
 Transport; Wed, 20 Sep 2023 14:18:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Wed, 20 Sep 2023 14:18:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Sep
 2023 09:18:10 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 20 Sep 2023 09:18:09 -0500
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
X-Inumbo-ID: 8964f27f-57c0-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpCRpooaEAXaAqFDt2gUtgeGcCTUYpNtbfDwAOweUM7+PXd47FDOCW5sZhHvr+Glb8/ThZfPkTbfGKvndCrlL6y0hVCqR/XCYn0AifABlEubp5dT7qwO+SO7QotNs4D8zIfm1CvxJBZO5o1itEAUr2INf7ES2qBGxMDBQyfViQ+O9qt1BFhPXSTZwCRnithcBrCzJuIa7JCrUbf3NGybi4o3BySBugaj96DrKMYdiVEs6WvBnXGkiilwzWhBVc6TB5TOmXf0/0eD6lucglMOm5SUFubaTNnes5phNeSL4OuCHyqpKTQOyi57NlEs9AU2UUaZkGNJidUTUtZ80kw/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOkWYrKVa4rWt3ZBaP3oVAkeSEsIxBth2zVbNviXskI=;
 b=jcJ22Ng7qJahYZo4Qa6SSzZX548QT6GXN9nf2BFulFrO3xMs3rktdC2s4Qt/P0xgiqGzoI7bvOEEaAispfSujQ3+5hRNpCo2S0uAycEQXkZTUFihx9Ir27a5PUSTaznkXFFN/YtvHzk39r8hTFquJjjug075AOwqCxZ1QIB4XvMbMIKk8W+ye+cIbXE9ohdbjS7XaKYYbQQfKzWzvxjAJIulKnH2VTT8A9w7YSYnv4M5l76fT8uA55oeAS7+r7Dn7gflwX5YkWakKwvCSTG7Pcfj55qOashAtN9aqhHssXWYfG0ULGMK3N9m5h3It3Nj8IZh3DHFG4umFWJtQ2fsxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOkWYrKVa4rWt3ZBaP3oVAkeSEsIxBth2zVbNviXskI=;
 b=ZWkNiscrkW2ka5v0Vo4HaWqxjTZEOE92gktQlCnFf77QR0QPqqo8rdv1JCz6lh0IWMNuKLzfO8DvhF++L3YJJS7ZAtURr1jDaqY5ZQcwe9YbgZ3nPhGVBl/I1zhxlUh++hE0rP7KruQHDUWYHBCtBZExsq6xo3mMgyJzE3/Am04=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <dfe31cee-8cc5-0ae1-dd23-f96bd6f00427@amd.com>
Date: Wed, 20 Sep 2023 10:18:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 06/16] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-7-volodymyr_babchuk@epam.com>
 <ZQrAK-XgKQwEPVED@MacBookPdeRoger>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ZQrAK-XgKQwEPVED@MacBookPdeRoger>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|BL0PR12MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: 720acdeb-b10e-47e5-359e-08dbb9e46baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/FgtsQkplXbrwBMLdKEmLdJxb71Dir4m7hOeXq/jrmdzo8/6wALtBU5QD2k3V/E+Iv6clNGbDYaRaK0YPi9dOpKbusjZiVBING7q4GCjJavCti2jCo6wx01LnGXaAO7aZbIYp3WO/j/5f0d5DZP4AE5mHeuk4lwhgqhynRxOAerE0kmr8wYUMFzEKwEV/OJr/E9sRZYxwqxh18mv21X4RY5uvDetwWK1GVIV5zAMcrD/6POqvZwzfj6HAO/iJcEDgRA9lqKuafT3uOimit6B9InuLQABz7E4+nkTD0Bs0RverFUNw2BMpFAovkj3OIkHcLd3pFeVORgnBQi8KmBU8YsWuIKeA2yb2CQFykTZqPb/zlUrvBk8Fno39iQX6bRajdtNbuSpdsVMVE9ovfCdIS6hQpSpU7hm8OWIf9l5VfHNKLYqH091pPCqR35Hi5cuQOGhGgue6WJAMEyi7t3X7MPzZEloUBsVTYYHOpK9FPkLgnLAGqNuTQnp79qeztUuQteMRhAE1Nu0fEYhSk4djUUagga4KklVov38XWOcmPMOoJLeSokksWjRVa40g4jAiH71+FtAxL7/EQZ0j2rbcXT+T1w3qtsXgjHFaM/BwgtFtPYNGp6UBWcU2nc/nA6A4rLDmYZxfWoY5nT/aDYr+OTQD1debL/PLQJ7xL0qIn3s3rGYlOQja3x5mbyqYUJeB89j7gO9YgWGewdFAFI/LXzlofBoqBMLiK+V7PEUp3CxqzXf+ppsa38pw59YafyemAS0tMlzmQ41sxSwPo6q73VDGEkapteTngfjzKU3ml4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(136003)(376002)(82310400011)(1800799009)(186009)(451199024)(46966006)(40470700004)(36840700001)(53546011)(478600001)(8936002)(8676002)(44832011)(70586007)(31686004)(70206006)(966005)(16576012)(110136005)(316002)(54906003)(5660300002)(40460700003)(2616005)(36860700001)(36756003)(82740400003)(31696002)(86362001)(40480700001)(4326008)(47076005)(2906002)(4744005)(336012)(26005)(41300700001)(426003)(81166007)(356005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 14:18:11.1977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 720acdeb-b10e-47e5-359e-08dbb9e46baf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4964

On 9/20/23 05:49, Roger Pau Monné wrote:
> On Tue, Aug 29, 2023 at 11:19:43PM +0000, Volodymyr Babchuk wrote:
>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>> index e58bbdf68d..e96d7b2b37 100644
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> +static uint32_t cf_check empty_bar_read(const struct pci_dev *pdev,
>> +                                        unsigned int reg, void *data)
>> +{
>> +    return 0;
>> +}
> 
> If we are going to gain a lot of helpers that return a fixed value it
> might be worthwhile to introduce a helper that returns what gets
> passed as 'data'.  Let's leave it as you propose for now.

For future reference, I introduce such a helper in the vPCI capabilities filtering series [1]. If that series happens gets committed before this one, it could be worthwhile making the switch. But since the helper is not upstream yet, +1 for leaving as is for now.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-09/msg00796.html

