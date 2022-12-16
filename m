Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62B64E8AA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 10:33:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464273.722620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6766-0006go-KM; Fri, 16 Dec 2022 09:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464273.722620; Fri, 16 Dec 2022 09:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6766-0006f3-GM; Fri, 16 Dec 2022 09:33:42 +0000
Received: by outflank-mailman (input) for mailman id 464273;
 Fri, 16 Dec 2022 09:33:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PP9E=4O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p6765-0006ev-Sv
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 09:33:41 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2048.outbound.protection.outlook.com [40.107.95.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8febd58-7d24-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 10:33:40 +0100 (CET)
Received: from BN6PR17CA0036.namprd17.prod.outlook.com (2603:10b6:405:75::25)
 by PH7PR12MB7234.namprd12.prod.outlook.com (2603:10b6:510:205::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 09:33:35 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::45) by BN6PR17CA0036.outlook.office365.com
 (2603:10b6:405:75::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15 via Frontend
 Transport; Fri, 16 Dec 2022 09:33:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.15 via Frontend Transport; Fri, 16 Dec 2022 09:33:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 03:33:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Dec
 2022 03:33:33 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Dec 2022 03:33:32 -0600
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
X-Inumbo-ID: b8febd58-7d24-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fs1uqjQDbUzV7eCY8NOyA0OslDMSlkizf+z4WoJh6FxxITe54wQ6YbZOmiKMkoEvmG7A+9uFoDZEFZ9TZRs73VvNeR7m113v0EBrHJPzBattUcV9r9NkaSCvKLHaPqrh+Vtm3dVRdr7cFEEdN1954p2Qm8NkSN1Y5qYavNVro6dkEAHJyJShVuiQyoMkDqdq/vbfyd/f28jhA0OoYF3j0aLNBGT73bhAPtb3LBUbsbx8G8bD07lfmtDaC1MLT99EsA+goP5VsEAatlq9zItquhaiOljgWycTWapD4D//XsX5Wv/goqK1DrPuFvfcbBuR/efWx9ReNogPih2r8SLFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTnP5pOG15RUSzIGyG9vd1SLE1DqHhEhST2uhA4/t/A=;
 b=JX+ghG8G9guCmmFa/7XsZVK01ZLp659kcoxppzyw6RwTfSqumBkExMK5ZGYH6/IgYVVKNY7sS6VTmuc0lSJOIpROBkOIj04Yft431/ufdUsWKgMdz+q3QUeZm3/b9bW40JzeODyt2cxd+pG0mla2hNH/qKKST5DbVqt/n5TA1/LkjdDRu+m/TfFXUjxj8x87iSrv5t/9LDiwR1JkMhUD1A6bMgyPg2v56u9J9J5jFCgNVBUrkAhs8JmLcHC5aJdwbcE+Km+qeTNsvOMuHw/MKYkWT975fE8IYdGLLuIqGxyWkZKeldkYcKgwTBFu2rgw1YEqWlZQunhdV/d75nBOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTnP5pOG15RUSzIGyG9vd1SLE1DqHhEhST2uhA4/t/A=;
 b=zCFyfsJxbxYQ+H5/qoBEbCZzuAjakWC+53W5voMrNrA2VJ//f8g8LrdDGtsHowrdM69Z7aOq/PgN9hX62GpZO8n9xrswTMnJkcFDTLnVQwOKuIwdzMRHVmFjLAmlgAYVyYQR0JTo9A5Jnmd4c2X/ZKevYPe789RV/SDIWcfIoJs=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Message-ID: <73d3dd85-2801-c0a4-7314-84738542eeeb@amd.com>
Date: Fri, 16 Dec 2022 10:33:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] automation: Add test jobs to run XTF hypercall
 xen_version test
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20221215152538.10266-1-michal.orzel@amd.com>
 <20221215152538.10266-3-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2212151307390.315094@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2212151307390.315094@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT019:EE_|PH7PR12MB7234:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9e3a43-bdb4-4940-3df6-08dadf4899ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t3zto0JDBToQ3Wh/+ii7nGG6RQ58eQWhyy0cwXzRb45dY8CcmFQGeFE7EOcNo+zIz6o/P9At5jRE9k4t/uyF1IBm/ebbyqpICI4QHpYJcRisW4F6r0+ttte/V4dMZhRlFtsTgwxv1enzNoLf6gUxq9f7z/bcitCmFSodsDfHS5cXtVGn6KUHTL59PO1a1slG8xNsMq3yY6GW4sWx+CHLhppU0GIJTyNA18KFMjTCS6QX+Kr5AsjjTlWZOfdnJ1OUKK1OhEOEdYDIjuKyZsPhOfoDI5wwAVpVvq1OkJJQlkzaoUWMdFBFnbqxnOdzbtCno9mlfikcDIkPPj3FTYmQg/SRI18HHNepiy0HCZNgjVEF1akPg7e00CMucSxxOkdyhDfFsSOgjG5YK+MCn9VaR0aAlLYZGPL7n2rnwGkEnNCL9rrAJJdou/s5LlZ6jvKtRnUT1BxCCrB2fQizJBkX7eDzFV2CBe4XDZvGNtj8drh8Dlkn1Y1faN5RD2W/w2Pnd9S96Dk7hCmC19sdHw4FRG+lAYOpL6JHBOLeLUp/M3J46KaCUe4BLUz8/lM2D9qxwPWoYX+a8VdaiyG0BrUhdERn1897/lQNWWPY2FGBP0WHsTWO/2lAGvPejCJ3MRssCCTUX+MNa3U1bljCR0Z+6aZVuYmoTAPtLGkiQ/CjMjOgpUKCyLsrl7rNm8XsDUsVujwe1nmBCTHDY9jjg+5MhwrKJTTMKHA+44MmAHy0oiRydbrSjw9IYuVXHweoOFRuv1F7ngAW3k7XhbSCFzjIVw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(53546011)(2906002)(478600001)(31686004)(316002)(36756003)(6916009)(16576012)(2616005)(70206006)(70586007)(4326008)(63350400001)(54906003)(186003)(40460700003)(41300700001)(26005)(426003)(47076005)(8936002)(336012)(63370400001)(83380400001)(82740400003)(40480700001)(5660300002)(8676002)(36860700001)(86362001)(82310400005)(44832011)(81166007)(356005)(31696002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 09:33:34.0158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9e3a43-bdb4-4940-3df6-08dadf4899ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7234

Hi Stefano,

On 15/12/2022 22:08, Stefano Stabellini wrote:
> 
> 
> On Thu, 15 Dec 2022, Michal Orzel wrote:
>> Add test jobs in both debug and non-debug versions to run hyp-xen-version
>> XTF test as a dom0less domU on arm64. The purpose of this test is to
>> validate the functional behavior of xen_version hypercall.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  automation/gitlab-ci/test.yaml | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>> index 2d57f4feb74a..9d4b5315e710 100644
>> --- a/automation/gitlab-ci/test.yaml
>> +++ b/automation/gitlab-ci/test.yaml
>> @@ -165,6 +165,22 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
>>      - *arm64-test-needs
>>      - alpine-3.12-gcc-debug-arm64-boot-cpupools
>>
>> +qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
>> +    extends: .qemu-arm64
>> +    script:
>> +      - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
>> +    needs:
>> +      - *arm64-test-needs
>> +      - alpine-3.12-gcc-arm64
> 
> I think this test only needs qemu-system-aarch64-6.0.0-arm64-export
In case of pure dom0less configuration - yes.

~Michal

