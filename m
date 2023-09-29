Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2AC7B2D90
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610319.949690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8cs-0004cc-GH; Fri, 29 Sep 2023 08:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610319.949690; Fri, 29 Sep 2023 08:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8cs-0004ZY-D5; Fri, 29 Sep 2023 08:13:30 +0000
Received: by outflank-mailman (input) for mailman id 610319;
 Fri, 29 Sep 2023 08:13:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VcG0=FN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qm8cq-0004Y7-Vt
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:13:28 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f400:7eab::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fab7e7e-5ea0-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 10:13:26 +0200 (CEST)
Received: from SA1P222CA0137.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::6)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 08:13:21 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:3c2:cafe::37) by SA1P222CA0137.outlook.office365.com
 (2603:10b6:806:3c2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25 via Frontend
 Transport; Fri, 29 Sep 2023 08:13:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 08:13:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Sep
 2023 03:13:20 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 29 Sep 2023 03:13:19 -0500
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
X-Inumbo-ID: 0fab7e7e-5ea0-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuTpErqs6a9UvxjGFSbFE9sjzXMr7tb8DDsARYK1fQpO3Kvvp9Ku+GFMor/HjUPF2SWcjif3JeONWuEujSNsJTwEgKezR0EJUxfVndJKF8Kvk43KigmJbvPSU3vxXE06b4tRc/LaSEhf6TbvGVUJsOsecNCuk+TQINLVVsSz5+AsgJaapY7IoORq7qNaOscM0hOL3Fqv+QeISd/CJaxar3QfceG1QUZ1CGHeh4WMYMJ+dDEucInJDKk5g2KpmddNj1ycBaODGbgvSaBnkzIwLbcg9C+1FVGBK0o/+z5qWVNZX+zg8XBgxH3iZzS7hYTn7jn539NCrBuevWJVxnqgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zK8PYbqMgWjTT7+BWgIy5Ap5w/Tr855imzXimnjSfs=;
 b=U4zN9S+jogwulR4AwCFKYhe3ebVXd27Cr5QXzaSESG1x3evyo3TBP8FHfOYorPKjOKYXDGvQbTwntm+F6JxGsBh8jtl+CSOmFiZn8hiuTzcWMF81f9zED3YboUSitj4wMv+UcgLCzjd+803N99xDgC5qhnXEvCS8tyPcotUf4DeYcNqRRh7kD7JXk20wMMyzilN7wXfzYkCEGKt5c7byM1CrPNIXW1Gv1nvrd2E1r2/3dQzKO6ro3YGLnjM3VUCOvHIjihgh9ol3NyhjF40UREaHRdLX0yUl3FMhrDcnOJCj5BGqXNw07QRg97PlcnVjqLKzkFqM9K9JNzWWq1ChPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zK8PYbqMgWjTT7+BWgIy5Ap5w/Tr855imzXimnjSfs=;
 b=BRHfHSqOqRYMGaY/fq80OZb3bjDHY6YsVXm0ivaH/1jB7mcl595wJ0Mj2iu69j1d9Wc+HpDKXwUBU7l8FYeFvcwcDOoP+Q8gtJ7t22BnTR3mQTQRgQMeUzFOMohGlx+hBAHEhwayJPHTJ40/7+POw9K+dtTJd8mYYH+vm76BFT8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f6493f08-f19c-51a0-c0e2-2ba9938e3d3a@amd.com>
Date: Fri, 29 Sep 2023 10:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] xen/arm: Skip memory nodes if not enabled
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>
CC: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230926053333.180811-1-leo.yan@linaro.org>
 <b0d2494a-8223-a101-5d10-f3803629f2f3@amd.com>
 <36d8f5ce-ef87-40cc-9515-12a2007bfa6d@xen.org>
 <3964a12c-b808-2ee4-9651-68c21ead817b@amd.com>
 <20230928143719.GA58021@leoy-huanghe.lan>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230928143719.GA58021@leoy-huanghe.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8c3e0c-017a-4657-ae66-08dbc0c3f1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KFbPWs2gUF5rZHEwHTGU9WbAg4kipPk7lgW6r+XdPtUKhdafm9ww1P0ac0iay6cKKjllrntaYaH98Z79ywfgHrCtJPC/ozCpUvOSFBMwZCouNd0o+KLufVZe6WC+pwQUpOV3DYAsi8co5J7jPUUztHH7LTlBTTNsQV0p2kHCvAIQb/xEgbf4evLk9cmLIIiM4GXM+J6inYMXMxEF/ILKShjArBAgvD/BTZDGnt0LeiTCnTlFE++kSiHxRTmV8bUOffLHEB0AYb8esgKJtEwtzJbTulDzEXBy0YmDF6Pa3KVKrmFGRSJiZOK1lMqd/JEbwwxEPRoeMW5Zxn+5MfjddwhT8VAjglYkRU6ptxBcqwj1IOUvwR1+Ni/rcPCVst03YVhX1Yfo731hYjDJ0U4+wMvlt80BfFGtrhHMdtG8CZUv/z2JwbFv85ax/EtNQOwPfL5ca/xgxRbDVicEV5zg7dHq2w8FsPmteuYlXuV09yuDyHbduMtEC0c6QGBL9ZzNtXDCSQWkXCKtcdacQMiuQ+r03ztZDK2PCz+h5B2mArnHe51xTtlp1N3kDrb9jOYZa+zuSErnfVmCqK+uoAyb+VxhbWuXXqU6Ccg2FI23cgnsHtdNdYAeGGL6nNZk9ENHtJS3x80Go2ZOjmk9O2b3GOoNknAOzP6AMUjIG2tvOsYzNiA8VLiUzr5AK0GAsjK1Igx3QlQu6ZS0bBk5dHXc8jjleBFz3VPXZh1HkKUnzvshkD7akR6qDI2MuaPAtzbR0PF3t9VSQkFQuZeVFDnVGaTEdiNzJhraM9TOQxebxew=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(31686004)(66899024)(2616005)(53546011)(40460700003)(86362001)(36756003)(31696002)(40480700001)(356005)(81166007)(82740400003)(36860700001)(336012)(426003)(26005)(4744005)(2906002)(6666004)(478600001)(83380400001)(47076005)(4326008)(316002)(8676002)(8936002)(41300700001)(44832011)(5660300002)(70586007)(70206006)(54906003)(16576012)(6916009)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 08:13:20.9065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8c3e0c-017a-4657-ae66-08dbc0c3f1b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186

Hi Leo,

On 28/09/2023 16:37, Leo Yan wrote:
> 
> 
> Hi Michal, Julien,
> 
> On Wed, Sep 27, 2023 at 02:49:23PM +0200, Michal Orzel wrote:
> 
> [...]
> 
>> Either way is fine. The advantage of placing the check in boot_fdt_info() is
>> that we can have a single check instead of duplicated and we do the check before
>> the "first" use which happens to be the banks sorting. The advantage of setup_mm()
>> is that it is the one dealing with memory banks and is called after early_print_info()
>> so user can see some additional info.
>>
>> @Leo, will you send a patch for that? Don't feel obliged as it is not strictly related
>> to your patch in which case I can handle it.
> 
> @Michal, since you have much better sense than me for adding check for
> memory banks, I'd like to leave it to you.
Ok, no problem.

~Michal

