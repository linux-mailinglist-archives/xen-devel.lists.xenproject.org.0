Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E550604A43
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 17:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425868.673959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olAZZ-00034V-3z; Wed, 19 Oct 2022 15:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425868.673959; Wed, 19 Oct 2022 15:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olAZZ-00031m-0U; Wed, 19 Oct 2022 15:01:33 +0000
Received: by outflank-mailman (input) for mailman id 425868;
 Wed, 19 Oct 2022 15:01:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rFyQ=2U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1olAZX-00031e-Mh
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 15:01:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e920334a-4fbe-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 17:01:30 +0200 (CEST)
Received: from MW4P222CA0019.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::24)
 by BN9PR12MB5307.namprd12.prod.outlook.com (2603:10b6:408:104::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 15:01:26 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::6d) by MW4P222CA0019.outlook.office365.com
 (2603:10b6:303:114::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 15:01:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 15:01:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 19 Oct
 2022 10:01:24 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Wed, 19 Oct 2022 10:01:23 -0500
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
X-Inumbo-ID: e920334a-4fbe-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ka/0xb7fu6oX6Xj5cvYg8kD1+EmTA2cB50YCEdexM8CNKf8oV5jnHH5OZrFhbMxp7i2DO5LPSpZBemGW9/yAGR2ybERP4cCQLOUDfwX0E1cZMbEXyijktEu9NLVks1iD02rm+HcBcqdCQRvij+kcgVtDDE0pIuXV8UvtukYf0JLE3YaYAeARiAx8cn7PIWHeqhIeaeIHcYau0i7ABHKTAacukZztbQyqNhxkmpQLC6Gv2bSW90UdGT/VhmYNC1YDcdECzpkKazFzymAJ+i6aacFBY+WA854HvwW2TrrP/9MWHxDKx6Z40hFlrLrWZ3Nbo27KQP5zhmkIvsIrhweUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLXR1ru8/yNLeV/Q5w+0zVenBH3nC9OpKEyhUqLgW2o=;
 b=ezs839riop1lPlVRpTi3o3YthLKLKs3lc45obxdybmDYv2igSqB2HqGC5NY3sivRA3mYsLgbd58lCOgjHXBb/gtKqfN0fNLFIGADgRml6KeUtSUVO6n37Gz9Kl4LuvluUp9J8hZly75E36t6JjliBCSWZr8MDyfvftv4lMS1sEt12abi6gfzm2btEpK39JIBCXw8Ou+Tlopc3jsxYwtt3wFaUNL+lGly8R+zhC6jNLtU8udVXgMFKcv251TYHI4QOdkk20VwSEpaf7exGkZ1Zis3i9Zy4R+M5fs2/v/cMm+EkOmcMbYH6KAzzOi15LmOnq8iH4upgTs2ZwZvkJwAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLXR1ru8/yNLeV/Q5w+0zVenBH3nC9OpKEyhUqLgW2o=;
 b=AriBnTy5MYo0bTki8GVsfYYWMW8mQFnhQnAy8TeP7nYDeFvk1dsZGPAfIE6+DK8kFi88eQwT5KECPFIvr0Vz/wscnlTyv7h3Tt1JpY7lVKkKyh0+vq+gdU2WgXhEOiglDZFSNseCiZRgte3jCO3Om2K6/1DdiInQanOyP/JXqYI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4b63c1b9-8d0c-81ae-f401-5cf615ff77bc@amd.com>
Date: Wed, 19 Oct 2022 17:01:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] xen/arm: p2m: fix pa_range_info for 52-bit pa range
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221019144913.291677-1-burzalodowa@gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221019144913.291677-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT012:EE_|BN9PR12MB5307:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a058307-9f73-4fde-8b99-08dab1e2cb6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v174aBvkVngtr44PhUaJ2A/DL4QeZ4r0J5mI3ZSIY9LJR4BXZ57tx5x6jHKR6CHo8Eipmf+gJV5vjHxGGW8Xz5eHi/G08UYsby0L6q6vvfMgKfic0Vpry8nuXKuobNWJ2K6ri6b5rKVoVBnH03YQzNgFhrUeiO3aNYRzrI5JNqiReCbJ9JUvmLBk5kC2XE7wn6QGfVzQZ6i43V3vJfcLO6AYNXhNwLHKSQj5xeTZQdVoHh1vMUR5vWDvXEYXYrDDXPD7ryhaiGA+eahSB0ses4bLD8E6BDTnAA4NIXWaFlSnDIKnOUY2pQcOoUcnJUFlToUEzzTs/R+lrQqZXXaDit1pWhtoj1Onv16fZFSg5YQkap0xb2CPhTOORNP/GG9g3w/a33nocmd5tIAbyMHbRxHYGxT5cQPdSg+T0NCjHCgcTs4JVSSwFiH+AtItEv2LZkBQOzmKita6keZf0UrbYE7gpfndMeJcMmnT8vP5J/CIzPzzBaQgOdMBAZvhh7XnKAPgM3oM+FiYYhP3OECcJYlQKguOvRL2WV2j+sJgEivIgUuBsR0KojcCBMJjaWJeeDx7QzfuNOTIwt9lIm08VQ7JFxXbK+bkV7sHDLMfukd4rfmXv0i30XIZ0SH15GlgBI8m2OWYkL7pKNiU5BbcLYLgjMqE/PvO3h+w4ydkxsN8o/rv+igj7qMIvqV8t6xB3ZehZ8XA1ZWvkcQtn0f+BI84NIzR6QyVsPLcE/QvAnTWarFRRlrrbItV8CW+jHIq3LOvTvJoxjQ1zNiH8bDbQy4oJHQRZ6GhcfTIpdoM89KAsH2TgrFo/psCFz2QJR6pye9ryZFvTktvWmvPndPXkQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(426003)(47076005)(83380400001)(86362001)(31696002)(82310400005)(81166007)(356005)(82740400003)(41300700001)(8676002)(4326008)(44832011)(8936002)(5660300002)(70206006)(316002)(16576012)(54906003)(70586007)(110136005)(40480700001)(26005)(53546011)(336012)(186003)(40460700003)(2616005)(2906002)(478600001)(31686004)(36756003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 15:01:25.8241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a058307-9f73-4fde-8b99-08dab1e2cb6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5307

Hi Xenia,

On 19/10/2022 16:49, Xenia Ragiadakou wrote:
> 
> 
> Currently, the fields 'root_order' and 'sl0' of the pa_range_info for
> the 52-bit pa range have the values 3 and 3, respectively.
> This configuration does not match any of the valid root table configurations
> for 4KB granule and t0sz 12, described in ARM DDI 0487I.a D8.2.7.
> 
> More specifically, according to ARM DDI 0487I.a D8.2.7, in order to support
> the 52-bit pa size with 4KB granule, the p2m root table needs to be configured
> either as a single table at level -1 or as 16 concatenated tables at level 0.
> Since, currently there is not support for level -1, set the 'root_order' and
> 'sl0' fields of the 52-bit pa_range_info according to the second approach.
> 
> Note that the values of those fields are not used so far. This patch updates
> their values only for the sake of correctness.
> 
> Fixes: 407b13a71e32 ("xen/arm: p2m don't fall over on FEAT_LPA enabled hw")
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

