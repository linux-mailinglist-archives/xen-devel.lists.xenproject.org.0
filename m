Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DF167E4BC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 13:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485544.752843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLNYq-0002c7-2n; Fri, 27 Jan 2023 12:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485544.752843; Fri, 27 Jan 2023 12:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLNYp-0002Zs-W4; Fri, 27 Jan 2023 12:10:27 +0000
Received: by outflank-mailman (input) for mailman id 485544;
 Fri, 27 Jan 2023 12:10:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xsEI=5Y=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pLNYp-0002Zk-AR
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 12:10:27 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93c2aa5b-9e3b-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 13:10:25 +0100 (CET)
Received: from BN9PR03CA0692.namprd03.prod.outlook.com (2603:10b6:408:ef::7)
 by CY8PR12MB8241.namprd12.prod.outlook.com (2603:10b6:930:76::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 12:10:20 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::3c) by BN9PR03CA0692.outlook.office365.com
 (2603:10b6:408:ef::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 12:10:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.25 via Frontend Transport; Fri, 27 Jan 2023 12:10:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 06:10:19 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 06:10:19 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 27 Jan 2023 06:10:18 -0600
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
X-Inumbo-ID: 93c2aa5b-9e3b-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzW9EMgzFxb3pNW3kZsYN/ooI4HwaldkAfbKAscEQqja6OrbAQBNYh+2M7y2vVusMakH0Kc0dqRePkvBxkJ0Olj2++4ddAb8LSPcNq1fw+2q3XYkkeNMAn0jYoB+2VJ0ZKgTIBNExs+sEMQn6Y+XzhkY7gooXfUJkwOnbre8xbi5DK45C8v3dQ58SAINfUOwzt8r4M1rfMDWz2VA76zTf1X6+bHPyxqj+itppXlzFdN9TyUjdeNRYxZ/Q/XseCP/eZ91LAyMbNCo7h/Ocnp22i2yohPjRgZxx1zB3O4qtUfwwwCjOony2jQLqWadrxWCHqCmy3kNx/CngqcUGomD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwET6Q0cQdmE55vZ5Tz3o/6vpgzks292IFq2syxY+R8=;
 b=d9tDrizP/ONrlfzyLFKSkuGdvP7RD7R/yBhh/rw/elMYZCHmU5ds9fS918V6VCKVsJz/RW7+YLewoq+oaim+B3GHSFaUU85sqiJ3Ymz8pQzAYJn+PSu/2ONuPxeX2UaLB4vitzDMfaVJD2IpjqiiPeux2VxQx16Q5/VCZ52GU7UQnaZdZOpKcopKXyeg0VQPdSXRMz/17rmN09BeubY0RA095VdkgNFd9KVd4/0gmT6w2B+Cch7HDhzMRIIC64948TdUBxHOF+fwZvebffyu3U2A1zfJdOXh6gA/h7grguQeOlIFM4jhSAW3BnJz4a8cqlbgj+d5/P3dXDMoMChU/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwET6Q0cQdmE55vZ5Tz3o/6vpgzks292IFq2syxY+R8=;
 b=NNC6KNdV+pxUemFyrHxuJx9EH3AJCJWqT9RnAA3qFYr1RuhrAfE0lUDBamknwfqmIO+TCycKkuorMapOwpX83txCNLLUOxWjETH/6Je+bsRNdGroNpVz5jWuWEF2m8OSzAYDecIQCAuuyOr17cbdqS4c293AU9fTIQztz/MUWlY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b1e2c76f-4d93-647e-ae3e-f83724cbd1e0@amd.com>
Date: Fri, 27 Jan 2023 13:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <julien@xen.org>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-4-Henry.Wang@arm.com>
 <d9861060-22ba-5fce-eef6-a7f2ef01526a@amd.com>
 <25264dca-acf6-7ad1-e8a5-a1b893eab30d@xen.org>
 <AS8PR08MB7991A2641FCF28C39F0D2FD692CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB7991A2641FCF28C39F0D2FD692CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT028:EE_|CY8PR12MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e243913-bdb4-456e-7ab1-08db005f75d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vpG3MECHY0bX4VGysz3pwgraj4RpNWEunNeejwBHHLRTre22+jqEr22D8EdC56K7vuI717m9EGnBujXSZaJW1zUmQR1LyyaloitQfM6Khx8dqDldh3uggdkwMb3wZZVfN52IZjaswMQe9dQziDLUfxOHJd+dL88tge7NOfptwoLlrITLf5j3RjUD8vrULljVVFF9ibd+FhQ/vT4h+Qs5uv+l4dh+/HlCUg8tRyNAS5P0Zqi56hutPsOB6xmi8nS7LSPaeP+CaE7lE9FcZAUTBsXNYHpbVbc5Iz0RoRwSG3NfvtIM2XCAgcHgqIX1pEyzzd97Ly+dDNcrO3p1XMfOfgX/7GL2GLUAsTwomwpZ/6lW7FoQ9xSEyEKNEhkxJ90ugtd6xLrztTFiyN+g644+EVJ8v7kSwpc2M/FBV6zrDn9ap3RYo3yb2ZstP7Tmdwniq732CvBVvWZff/4OQbXHBhTizbMLHQJoHNI6sGAJodsnFknGF8FUva0nDYuHR/+FAlqYKHCV5A2xk66/M7FA8pDubNJrrsMMjkMPxWVQE7Q1/vxyAJhswrpV0GP/l+BnRkMB2bDSn9WRB4hhBiY8zhT05CZXxAGYcqFjCQkTF7BGj1JhUgZMl5nh3Gw2ZbfnMOVgAATJRIjG4nqHikWXrRwMmBwbLqQ82PlmqRz07UJMdi+MaHgDBiXMYNn7xIAFP01nQEmi0CI25hNnc+C3eoQTTa1liLv428MLHwn6vigfU7byd6s75uCBY5npCTtPLhGfbObcPvye0a77MxGQRQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199018)(46966006)(40470700004)(36840700001)(31686004)(47076005)(8676002)(40460700003)(31696002)(36756003)(81166007)(86362001)(26005)(36860700001)(82310400005)(426003)(186003)(83380400001)(2616005)(356005)(336012)(40480700001)(54906003)(5660300002)(44832011)(478600001)(4744005)(110136005)(16576012)(53546011)(316002)(82740400003)(70206006)(70586007)(8936002)(41300700001)(2906002)(4326008)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 12:10:20.1603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e243913-bdb4-456e-7ab1-08db005f75d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8241

Hi Henry,

On 27/01/2023 12:15, Henry Wang wrote:
> 
> 
> Hi Michal,
> 
>> -----Original Message-----
>>>>
>>>> -    BUG_ON(p2m_teardown(d, false));
>>> Because you remove this,
>>>>       ASSERT(page_list_empty(&p2m->pages));
>>> you no longer need this assert, right?
>> I think the ASSERT() is still useful as it at least show that the pages
>> should have been freed before the call to p2m_final_teardown().
> 
> I think I also prefer to have this ASSERT(), because of the exactly same
> reason as Julien's answer. I think having this ASSERT() will help us to
> avoid potential mistakes in the future.
> 
> May I please ask if you are happy with keeping this ASSERT() and I can
> carry your reviewed-by tag? Thanks!
Yes, you can :)

~Michal

