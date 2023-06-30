Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5780C743556
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 08:52:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557270.870469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF7xp-0004X0-GM; Fri, 30 Jun 2023 06:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557270.870469; Fri, 30 Jun 2023 06:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF7xp-0004UJ-DB; Fri, 30 Jun 2023 06:50:41 +0000
Received: by outflank-mailman (input) for mailman id 557270;
 Fri, 30 Jun 2023 06:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+UV=CS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qF7xn-0004UC-Mo
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 06:50:40 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b0f4b11-1712-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 08:50:37 +0200 (CEST)
Received: from MW2PR16CA0058.namprd16.prod.outlook.com (2603:10b6:907:1::35)
 by DS0PR12MB7581.namprd12.prod.outlook.com (2603:10b6:8:13d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Fri, 30 Jun
 2023 06:50:32 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::4c) by MW2PR16CA0058.outlook.office365.com
 (2603:10b6:907:1::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 06:50:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.49 via Frontend Transport; Fri, 30 Jun 2023 06:50:31 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 01:50:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 29 Jun
 2023 23:50:24 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Fri, 30 Jun 2023 01:50:23 -0500
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
X-Inumbo-ID: 6b0f4b11-1712-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASBzq26sYXw+PzyLRzIgP+7wLlPFXmeqqXKPnoU4vizSUqefh35qGacHtK9YVhFSlZZcMWkLgeRfqhf8U81qNgSFZ7S9D/kkRP5afvXkGQjO6RIPRM7e0eeVvnhV5RPWeV6CxieulRwu3s3B1wIKMXlULmMCcMTbCeTrHCD5M69v7FvfzwiiqNNC1qfJ3M+dy4yp+4RUBEcCUkI5fLpLDyEFyj7HGyCaYxm/HHx4mzG6DdoY065kBgrVSqOKC67iTQaVdWPOkA7OnrO5YhBGEjO0yqHIipJmo7KH0WrkuwSSGonez7UAxlRM2AtJ94gsatgbJkJ9coV0nd2Pk1aoDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwEK+o9IwmrNuGgAXKPWmNm4XtTe/QRaK1RAAUpapcg=;
 b=lm6SyktPEJ+bJ1Cn8if1FT+kicjl5T1oXj5Rt/kJjHXGAd37he0jlavFPgrVovbie7h7XjofLgO2KyufAKa3IGJKpjV1mmGP9Ke6t6YS0NRLCKkJpbExDjGbzCZldwAkTKpgVaCRWxc3DuXcVThVXBvWDN7bEFvedhw3w7E/Dx2XuZMOqW9dEtraiDaAuAhpl/vYEbCdaW/5ydjXe46KPXkbliqounuoarphYX3JzWDpWnk9HSiJbeKlm8AGCe4Bjka0ZdH3Ws9e0F3TqnURGjj8TER9TtyRzUmRdwTf+UryJ03FQMe1l88kjhXEvC3x7+rFvh1/bmvQK3hFn+F7og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwEK+o9IwmrNuGgAXKPWmNm4XtTe/QRaK1RAAUpapcg=;
 b=Y6efE18GnrYupcyMUQ8WYprcQaOk5EFGzrcuVQXY6raDRYTb0oL/Yw1qDUIf9RGad1uh5rdq+p5JcVlwpcfnxEY+WJ7EbkJ+hxt4XH0rrmT+9+JMtLOZHH9oHtXEODHeC2wjQ296TvZwLPqfdkJgPxn5qvi4EUflOjVT0UQkVTU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ad88adc9-5b05-65f9-2071-c746748ec3df@amd.com>
Date: Fri, 30 Jun 2023 08:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [v2 1/4] xen/arm64: head: Don't map too much in boot_third
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-2-julien@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230629201129.12934-2-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT046:EE_|DS0PR12MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: b19219bb-12c2-4fbc-adf8-08db79364c77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4E3i8RSfSG4iBeP2mBr8XWgtRF7eJlEIphfwoWgvtlRH2+JlbmRNq/elzfWYcSLO4VvN9g3N8H+NVz98H4hRr9K6Bz8gizzdz7Vg0BYnwhRhWXasesv2OfRN4V28l6ie7m+XcDDVnnKsDA1VS9uIvzMaE0B+VZgykwWPNh3lQx+pmIo8O0mzGnEb3v95FtbH3O6toivYP8sSUdlgNykPkmNV1d0DcPKqIX0FBIrmmbS2JGvzCczViEE3QtTUheGWzXRKJC9qCLllY4rqajEX1sLz7bF7721vDPLE6Ac2bQ3XHfXTW7W6fMlIgkIiuaf6WODpSj2PKq7teW/LJYDVCIRCe/sDaw6igSpeVkZQLJ6cXrzsUaDtcAYlkj3d2uH3LWoVuAVS319glEBvqwGbEo1Ix8cWGoHj7g12qZwficG5viHH+24tQqHNrdtUIpdA75ROXK+vceaz1JsFDsZrsczJwH/9zFZ480V5/jXUcay7Q0OM4PNKHwbFpGkxWpqixOItEZxcS0aK2vUZWnQmd8efwO6t8PflkgElEJszlCIfigAbHf/hm0wIcxDsiOgbjebV5HXpqL8CpbjqzPFW8gyXsD6NXg7cfUpeo/mBy45c0q8u3FEGWBNRXgQ3qrMllLcR/4tr48I6zPxjMSGlVF5UEYXH3UCVuC/5BBD/tV87cDviS54PjFzb8logfrZrP+oGYEnDFBrlUgCS2iwhVHfPejiwX7eSnqt6XcdeHolKBlg4h8C6OmoI+6cZt513fKVmxhhlQ3r8oKRxONnh1pCLyE/maYxA73Hfa/o76YNog5GAIcWPUEhOIYIYFyiz
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199021)(46966006)(40470700004)(36840700001)(70586007)(70206006)(40480700001)(40460700003)(4326008)(426003)(2906002)(336012)(47076005)(2616005)(186003)(83380400001)(316002)(36860700001)(54906003)(16576012)(110136005)(44832011)(5660300002)(478600001)(26005)(53546011)(8936002)(8676002)(41300700001)(356005)(82740400003)(82310400005)(31696002)(36756003)(86362001)(81166007)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 06:50:31.9445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19219bb-12c2-4fbc-adf8-08db79364c77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7581



On 29/06/2023 22:11, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, we are mapping the size of the reserved area for Xen
> (i.e. 2MB) even if the binary is smaller. We don't exactly know what's
> after Xen, so it is not a good idea to map more than necessary for a
> couple of reasons:
>     * We would need to use break-before-make if the extra PTE needs to
>       be updated to point to another region
>     * The extra area mapped may be mapped again by Xen with different
>       memory attribute. This would result to attribute mismatch.
> 
> Therefore, rework the logic in create_page_tables() to map only what's
> necessary. To simplify the logic, we also want to make sure _end
> is page-aligned. So align the symbol in the linker and add an assert
> to catch any change.
> 
> Lastly, take the opportunity to confirm that _start is equal to
> XEN_VIRT_START as the assembly is using both interchangeably.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
NIT: it looks like other maintainers are not CCed on this series.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

