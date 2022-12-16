Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D9F64EB54
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:21:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464619.723135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69hv-0007FM-CB; Fri, 16 Dec 2022 12:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464619.723135; Fri, 16 Dec 2022 12:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69hv-0007D6-9T; Fri, 16 Dec 2022 12:20:55 +0000
Received: by outflank-mailman (input) for mailman id 464619;
 Fri, 16 Dec 2022 12:20:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PP9E=4O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p69ht-0007Cc-TT
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:20:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 141c5ed4-7d3c-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 13:20:52 +0100 (CET)
Received: from MW4PR03CA0339.namprd03.prod.outlook.com (2603:10b6:303:dc::14)
 by CH3PR12MB7668.namprd12.prod.outlook.com (2603:10b6:610:14d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 16 Dec
 2022 12:20:48 +0000
Received: from CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::39) by MW4PR03CA0339.outlook.office365.com
 (2603:10b6:303:dc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Fri, 16 Dec 2022 12:20:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT033.mail.protection.outlook.com (10.13.174.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.15 via Frontend Transport; Fri, 16 Dec 2022 12:20:48 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 06:20:47 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 04:20:47 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Dec 2022 06:20:46 -0600
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
X-Inumbo-ID: 141c5ed4-7d3c-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PX9OiHWhYPXAegAogcfioGxteoXPH+Gv7Pwt3f7AfI9YEQN2bvL8iG82mjEhHvkekQmdVK3BjBXewGZ5EXWmTISbqJnU1LcNeeetmVsnpm3qpdXV1eSKJKLuqK0kx3Uc+S3rXfgI3e/dfCSAl/7/2YVnyRd3ARWASQm7erAYLXC80kkKLKeQuY+sfkzE5lgg2RDF+oi/9XaYh0362OGzrDuPkymjH7wLT27lRbUtJDQs+0Ykl8k8VeP/RqIgqaA1OyVY575rvERPpQU/XWpridK5DqZzeiumXhcntG8BhbLF34heJ6iUsXFzfTROMhFsQYHR9Yj2PwqHN8x/cd46HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQiDSFj7omp6bhjE/8x7XebSk9Oz6RiFXDJuXKJCTB0=;
 b=ELWvJjmUSzxyTad+3NQBZOyYWi1SG3/f7YhUJMHgMfXExC4/7tzVy/gm0nOjBXQpu6kzyEqEOgDaBUziJxy2QfWzcRPLOimbrVwOnv2C4LS9g8+bca2UQCvQI4CbrOeSInMWDPR7Gc5S2/QRBuziosJuL9Ua1X2wX0Oa+YkpR/mllRuJwi8gOIJ8AAjAwYsyDV/rbfxeJbmq3oW/Ev4Pc2Fp6X40OiQ+V86PvIKzVqtLwvBvb8y4x1rIxvdKsDWam5C0PgrqKC57hHVaHWXD/kNlv+xLmKpaTjBB6CbAIDsg47AOVakijbjhQrMscIghQQJCJokWDORTl7BleF2AAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQiDSFj7omp6bhjE/8x7XebSk9Oz6RiFXDJuXKJCTB0=;
 b=uNxfcdN469L0KRGv+klrf5tZ+NpITa97lssXsdh1S6FGGSL0TqCT84ZnVOHL0pLkxbXsAAdDEtEbIjK24pr8nGThJUptjOx4T/X8wPwIRWlojrm8pQ3P7pJFPG8qpKVbhbf+3Mr1u1HVnGRiWVnT043OB5oIn2vQkLQY/m8UyAA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <95d7eed5-e528-b83e-9129-d36de4cc863f@amd.com>
Date: Fri, 16 Dec 2022 13:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] automation: Add test jobs to run XTF hypercall
 xen_version test
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20221215152538.10266-1-michal.orzel@amd.com>
 <20221215152538.10266-3-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2212151307390.315094@ubuntu-linux-20-04-desktop>
 <73d3dd85-2801-c0a4-7314-84738542eeeb@amd.com>
In-Reply-To: <73d3dd85-2801-c0a4-7314-84738542eeeb@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT033:EE_|CH3PR12MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1021e2-f584-42ba-2fc1-08dadf5ff6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	27XFrERiZahzadMX6c8PgzGt0jcBjDwUpoU7r16cu8tB4wPigtxiOgpIhIgTHdSNz7RFW5Lhdv+knTfR1eaW7trhada0Dw7ys/0f6VHAmij+jx5OU09TvIjzDqoCjQYFTwMC5P1vcfhF63hWA1vI1yseE9NCtQtkjLhaWj7BcBMO3vby168embBY4c9kEdYZKy4e72SNblue2F4NjdXBU8lamHjKhPNtX3aczGzLNP/UaHhAa/ukH5pvgHU6eq04ko7UdU/zOdW9mwSfkArXJzYaSgqHtzkQXSdE7W8q+Ddw+G82a/6S1Te+ggHLB27rYmHI5POKuTmJzbmd9q6KU1bTPdP8EdvvunTTXxRuZzQnvEOYCy7l76tiJqzhjD4So17DHLznBJSQK9loa5ntKQIiJU+5GlY6gXJ7PbHxfhJVCsVfGrcJKjIM3mRtz8c3fvpgnoGxzTVpqq3awofFkW9irawGWHZWkgTnzSbS1EiFJOS4Zv8XnbKP29iO9ZPgt8u8VHk52Pm9az2Q0y8Wru/5J2Pt5V5oWM12TKSbUZrZD5pavbETrNaOWNXygyNr47xNVfG9elGH+FoES9kog5F6CYweBHRvTFIbNmOVJg0DdJqyLjjaB1vlxaxs1Hqc9rV+n+VzK5mQPAo+EK1VO0zg1qTKdDvdQThB9QGCSqMTHS5ij9vymtsYMp+Vagko1s6s4LrA7UMwJMinYQHDgv6/qP+wwOfertSevKPJdbPozfUSZgM0Wxul1BDIY2xoogDubh/vQKJpUTUrf/4TDA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(316002)(36756003)(40480700001)(356005)(81166007)(82310400005)(26005)(31696002)(40460700003)(86362001)(82740400003)(16576012)(54906003)(8936002)(478600001)(6916009)(47076005)(426003)(83380400001)(53546011)(5660300002)(2906002)(31686004)(336012)(4326008)(70206006)(70586007)(8676002)(186003)(41300700001)(2616005)(44832011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 12:20:48.0994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1021e2-f584-42ba-2fc1-08dadf5ff6d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7668



On 16/12/2022 10:33, Michal Orzel wrote:
> 
> 
> Hi Stefano,
> 
> On 15/12/2022 22:08, Stefano Stabellini wrote:
>>
>>
>> On Thu, 15 Dec 2022, Michal Orzel wrote:
>>> Add test jobs in both debug and non-debug versions to run hyp-xen-version
>>> XTF test as a dom0less domU on arm64. The purpose of this test is to
>>> validate the functional behavior of xen_version hypercall.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>>  automation/gitlab-ci/test.yaml | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>>> index 2d57f4feb74a..9d4b5315e710 100644
>>> --- a/automation/gitlab-ci/test.yaml
>>> +++ b/automation/gitlab-ci/test.yaml
>>> @@ -165,6 +165,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
>>>      - *arm64-test-needs
>>>      - alpine-3.12-gcc-debug-arm64-boot-cpupools
>>>
>>> +qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
>>> +    extends: .qemu-arm64
>>> +    script:
>>> +      - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
>>> +    needs:
>>> +      - *arm64-test-needs
>>> +      - alpine-3.12-gcc-arm64
>>
>> I think this test only needs qemu-system-aarch64-6.0.0-arm64-export
> In case of pure dom0less configuration - yes.
I take back my words. We obviously need Xen binary as well so apart from qemu
we also need alpine-3.12-gcc-arm64 (debug/non-debug). For the pure dom0less, we do not
need toolstack, but these jobs are already being built for other test jobs so we will
not benefit from e.g. adding new build jobs and variable to specify the hypervisor only build.

~Michal


