Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238436079A2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 16:33:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427707.677025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olt4J-0008Eh-Eo; Fri, 21 Oct 2022 14:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427707.677025; Fri, 21 Oct 2022 14:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olt4J-0008BI-BK; Fri, 21 Oct 2022 14:32:15 +0000
Received: by outflank-mailman (input) for mailman id 427707;
 Fri, 21 Oct 2022 14:32:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNjg=2W=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1olt4H-0008BC-Hn
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 14:32:13 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c784373-514d-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 16:31:56 +0200 (CEST)
Received: from BN9PR03CA0118.namprd03.prod.outlook.com (2603:10b6:408:fd::33)
 by SN7PR12MB7324.namprd12.prod.outlook.com (2603:10b6:806:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 14:32:07 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::86) by BN9PR03CA0118.outlook.office365.com
 (2603:10b6:408:fd::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 14:32:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 14:32:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 09:32:06 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Fri, 21 Oct 2022 09:32:05 -0500
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
X-Inumbo-ID: 1c784373-514d-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJ2KliLCJsANIGHW60bMto0YvJfm7Z/FDj6YLh8Xey0F1WKKQVjfeNBik07fM2FCszj9tbd2gakSCro9cbhqFl0GSAFIhWP+rKhhOpKHgoRzjQUEbMCRfAwOE6jmIJ+t/GTKhcmDR42I1Jae4Q1R/xY2h3eg5M+Tybx7jlsRgHZoCSXmPWbCIX0THFikCtnMMfpOXCoGcRYFAnHpV+Gk61bI7HDwAvX8QU9qq5IyYNwMvJKpEpFpd2jphL3P2/XCks+fDUKFduqT+RnNUOsWvFe6p+O4uanGR9aOLlwf0dS9eXzgZ4WDP9FE5/6/8GqJ+QxJpKmvkkvAIp/W1R1Iuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM3HIDm85n8qkkEkG7xtgzz+b/Am+ZT80vERxF7D4JI=;
 b=LYdKtfsCWL+9Y6GzGee7uos5cmXMk9nXCVnBVWNYGGPR7MLkzj8Fa/Ji1yRISeiCkZKGaDpFUxE5AkQGx5vhGwNx5kAwURwwvGiHjh0j80b6bDMMA9ZYBCouL7/E83hTgwg15N+0TK/5hEdSPhdRuxVqHaTowCmUUq6m2nz5S6tArFcrflOf0M0U1jvMdA0PIYstEuC6YnH+mQcDuQkyUrZfwevq/Ucaz68UlLokWU5EvNAh6eBFZlQKJ7aW95EvM6GJduDgGV6g4NDyCkFM9cFrK8dvumeZr1qK5/0tG7jJOh3MRYsCXS3IS279CKGwu8x1PGhCHASNlkDw55kItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM3HIDm85n8qkkEkG7xtgzz+b/Am+ZT80vERxF7D4JI=;
 b=Qhwo6K3tTqHTuaGpoKTu4IB48arjK/03xmR5nOYEPfu4d2h3//fWzlcvo+wwFuDQoKL9EsX+NpwVk70bhgy8SuRjSQkrlu8CsrIVsToEDlZZIj7LDF4e1ciH7lDsAVWRZu1Bh7XfwJZOs/2UPj1RQgGd+ojR2m4V34p4TRBOOJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <38c918ee-ee21-8887-f48f-f74e2e0a9862@amd.com>
Date: Fri, 21 Oct 2022 16:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [for-4.17] automation: Build Xen according to the type of the job
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Henry Wang <Henry.Wang@arm.com>
References: <20221021132238.16056-1-michal.orzel@amd.com>
 <9eb64ced-d04a-d406-e1da-86691ba79be6@citrix.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9eb64ced-d04a-d406-e1da-86691ba79be6@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT024:EE_|SN7PR12MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 87504479-1226-44b8-cce0-08dab37107eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FCpBoB9AOfDF+dQbAuL8dDpzrPKGa0RhvQtUY2MgAQJV07uiAqwzUV0xzplAGPKIgpVrQMybjoOXChNU57KWQMUS9HN0+q4WqUYPSVt16A+SjGyssDgUEGuPOFIR2fYzehSn4YoQJD9mIVS8uFXVfbh1IiYcU5RIwnQa+PuM72vWVhGXETDHC+drQcKClFmoQ/EW1Ldht8ciL8b6eEw3IZmPwr7vCRZcjtFG0cpD2CxM8Hmm+RMndeI0jziNW1iaQl1QCEESx+bNYh/jAz3vlaXHY0Lx/a6W+OS5A7A0ZVnk7upQJaDZKj4bVUjgYLqZw5Ee746RFj0oAPs9SD6ja3gL4JKS36FPMgxbGtYgU9Jkdc/O07pKnr8CFRnlzJEb4XonBLIjwySpS1JcbUOmEH3StFRaxULKL4cD8iYezCV5YZIIbeYeFCvV2RCLYQhZStnmIeVcUpWpBysblrKBjMh3zuPK/Alpuy7sCbdbE5WY3gGUAVApC5061QUO/hMGiSEjz9bcZ9MnZLBfo97UI+DsWV2LrTclOrpPbENP5jrpAK+Zsnf9FGOF7RoDbNtMAwctPWUCRTeT0aZ0yo3s7OS/Xag411/a+b+05q5hNUANhFQTIyVtLQa7l7mE+SeAy888qCIV4ftwXYrdFli/FLkfZd88n+qKg0df6MkSDkLjQ3aBmsLclgK6SJ3leUxgO/JpnTmSWGFRDS5yZn5MU3rZe2sLVpOogvScEBcjIQEQ6X4/d5iTLA4zrp4zZ7goiDNd0RR9YN1E/MymtzFqZ0xnRTNKLD+0oEy2s6A1FM9g+sCXHExrUSKKgu0YdDqDWFerIDq1u3N9jtKfWUiJKalBSHptNODcW37HlhFPfXA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(31696002)(40460700003)(356005)(36860700001)(83380400001)(336012)(47076005)(8936002)(86362001)(5660300002)(44832011)(82740400003)(81166007)(41300700001)(110136005)(4326008)(16576012)(53546011)(82310400005)(186003)(2906002)(54906003)(966005)(70586007)(70206006)(8676002)(316002)(26005)(40480700001)(2616005)(478600001)(426003)(36756003)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 14:32:07.1448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87504479-1226-44b8-cce0-08dab37107eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7324

Hi Andrew,

On 21/10/2022 15:31, Andrew Cooper wrote:
> 
> 
> On 21/10/2022 14:22, Michal Orzel wrote:
>> All the build jobs exist in two flavors: debug and non-debug, where the
>> former sets 'debug' variable to 'y' and the latter to 'n'. This variable
>> is only being recognized by the toolstack, because Xen requires
>> enabling/disabling debug build via e.g. menuconfig/config file.
>> As a corollary, we end up building/testing Xen with CONFIG_DEBUG always
>> set to a default value ('y' for unstable and 'n' for stable branches),
>> regardless of the type of the build job.
>>
>> Fix this behavior by setting CONFIG_DEBUG according to the 'debug' value.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Xen used debug variable to control the build type before switching to Kconfig.
>> Support for GitLab CI was added later, which means that this issue was always
>> present. This is a low risk for 4.17 with a benefit of being able to test Xen
>> in both debug and non-debug versions.
> 
> Both series were floating around for ages before being accepted.  It's
> quite possible that one bitrotted around the other.
> 
> This should be backported, and therefore should be considered for 4.17
> at this point.
> 
> Is there a Gitlab CI run which includes this patch?

I submitted the one here not long ago:
https://gitlab.com/xen-project/people/morzel/xen-orzelmichal/-/pipelines/673396949

and there is already one failure in Arm boot-cpupools test because the script sets null
scheduler for the domain which is not present in non-debug build...

> 
> ~Andrew

~Michal

