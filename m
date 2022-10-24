Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF04E609C4B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 10:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428766.679240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omsdD-0007IN-Gl; Mon, 24 Oct 2022 08:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428766.679240; Mon, 24 Oct 2022 08:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omsdD-0007Fb-Dy; Mon, 24 Oct 2022 08:16:23 +0000
Received: by outflank-mailman (input) for mailman id 428766;
 Mon, 24 Oct 2022 08:16:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdD1=2Z=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1omsdB-0007FU-80
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 08:16:21 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2086.outbound.protection.outlook.com [40.107.101.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2224fe3f-5374-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 10:16:18 +0200 (CEST)
Received: from MW2PR16CA0054.namprd16.prod.outlook.com (2603:10b6:907:1::31)
 by DM6PR12MB4878.namprd12.prod.outlook.com (2603:10b6:5:1b8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 08:16:13 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::53) by MW2PR16CA0054.outlook.office365.com
 (2603:10b6:907:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Mon, 24 Oct 2022 08:16:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 08:16:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 03:16:12 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Mon, 24 Oct 2022 03:16:11 -0500
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
X-Inumbo-ID: 2224fe3f-5374-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G80o2hPu6niqGTGO3njO6IHsIZWdMZ32XaqvtB1KFYSxCSTC0rFcbEFln5jmncc/I1MkI6dB7hujnwGIfcJTX7KA+gorwe+KG233/C84C7eklcRnPancYASXT7v/13Q+EVmSRFZL1gAeEwv+aDZWXgdaIljuVUSD1Yr1eqQZSuXAGKc8uWg8glAqNPpzEgvVRWPo+tUC6c0xZpEFuw3VWyP5evCgrjBOQBx1ao5BGD5p81mnLqVtEDB9TP6o6FmAKCdqMVI2uWr9qBXD24uZrCqQdbgTgrBfYX+bG9ICWp/cQeR84QQj8mW75HXFFZQ5Axx8+W8RGghVeEbJDDGGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk2Y9yK7WBt7KWOq90CCS2QxqN/YLUqoukI6Pqkb+Zw=;
 b=PMrrbix5ebyat1ICJGF9HdcdmmEVhVhzVkw1yxZXzgvUjYEL1fFOmQFFKiYxpOmbeYyURzQxSqDMPL8tbAKRturvc7fWSBWmht2//gHJUw5JI6jBn/iSR7m/OKOJX8g5CPcNdxUQKs/01q8AqIE+Fe+V6qg+r5Nmahluz/rsqN5FqzKnYNISZdj9X5j4p1JXy4bMJGuIyT10GUkVHlxkyPODvbeGCt7XSn+qCpDd0I9ZnIl380m40+WJo2X2Z52zHbtMm7aYcvZPtfHJIsNtud2dCd1lya2pzjbV8zgiwO4uXJd6pgEbZA93rfd5n0WODwy1VTXBXldgOyvvCb1EYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wk2Y9yK7WBt7KWOq90CCS2QxqN/YLUqoukI6Pqkb+Zw=;
 b=uA5VdeKT4h+AGFperhKtn4hQ8uqOGimrRSVkNxYGxWZuhta9HpWHiT27xxiP4HwdWkLCGIPnWjNiR2tTguIY/pSJ6bifD4Lv2TTb14KKEQ/RxaSqSyOnn3RZQyc6GzMMJ0h7ovNqr5yxjEORn5tJ/vGsNR7WLQr8eaFpFuApuVA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b9da39df-8ec0-9255-1345-445f2a5b56e6@amd.com>
Date: Mon, 24 Oct 2022 10:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] automation: test.yaml: Introduce templates to reduce the
 overhead
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20221019164246.5487-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2210211423560.3873@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2210211423560.3873@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT034:EE_|DM6PR12MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: d394ad75-6832-467b-ee06-08dab598041d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gye52XFDyajG8Ja21MMnjCKtwIPyDvmzExP2ZmCNttY6pbF5NF1E87l3VeMbWQR9hJIg7hwXACez71sZ4hT5Ru90a5aJmfQclajShJdw4VSIOM1TdCOLXnUqO8HuYS7DGaxtrkLB0UmkTk66i6DzRi8d+Jms5/U0giC1GHy+Jz7U4QzSSJqQ/UGoYbdz9NglV9ZOmMqeW/xVjpSRkRxjoTdEI2LM9sx2zBKN5pe2Mge1bSGZm4Rc5Yc4u4v3IrChKzP2XmNsC6IXm7QRotd8+BLvFLkRarqAeTqDE87fk38qDRgaH7QOrj1Ea0Gv1KGMiZYREMSWZjC4O2xhQ1l/ZZOQpHkS3OKbwqM3NFj6oFQ8SXfaVCPTnIm3U0zW8WhMslK6VaT9pG9Om8BMMXrDxp/z/N4FIVnEcP0pXVP0UIF2wiSuF+wTAlMezsFgio0LsciAJJ3Z+zGEtIm7fiasObcsxh+C55UO4k+IsQh+DFl381KZbc59KiAsTIDTo15OodlaYtPHN+wvXUYvD98CcN9vh68KCENdfScsKvk7Av9hq50KxhnIbsjSOaZG11KN6LRJTjjnKajbt5HJi3B2FQUi+hMDz2K29uDz74sKF+qbhZEpSNYm6fpcVfe4oxeQReVY+BRkQYdbjflkoKmSQ0pjlJHfnceAqqbt3rozGuRBji96OhIlsJcCFYYyDg99lbbFfvHV8Ckyh4fOEEOusejrwDfik4Tv2qPLrDDmNHo1v3NR6W/CCYWJeGpPCLpGMW4sl8hse3K4D8y6F6etREL5NQ35Ctx3y6IW0PtKnLVTBoOhJvDly3hYU7BipBkNVS6JYHd9JWyVYRzqz46ITuAY2MTjxiAUa28vPndRDLY8sPfQB2h8Kb22LfFgmK1sKse6iyi6Dcw32cKbFSDtVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(966005)(86362001)(31696002)(45080400002)(83380400001)(31686004)(478600001)(426003)(70586007)(16576012)(70206006)(53546011)(54906003)(5660300002)(4326008)(36756003)(26005)(41300700001)(8936002)(6916009)(8676002)(336012)(47076005)(82310400005)(40460700003)(186003)(2616005)(2906002)(44832011)(36860700001)(316002)(356005)(81166007)(40480700001)(82740400003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 08:16:13.3354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d394ad75-6832-467b-ee06-08dab598041d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4878

Hi Stefano,

On 21/10/2022 23:42, Stefano Stabellini wrote:
> 
> 
> On Wed, 19 Oct 2022, Michal Orzel wrote:
>> At the moment, we define lots of test jobs in test.yaml, that make use
>> of the same configuration sections like variables, tags, artifacts.
>> Introduce templates (hidden jobs whose names start with a dot) to
>> reduce the overhead and simplify the file (more than 100 lines saved).
>> This way, the actual jobs can only specify sections that are unique
>> to them.
>>
>> Most of the test jobs specify the same set of prerequisite jobs under needs
>> property with just one additional being unique to the job itself. Introduce
>> YAML anchors for that purpose, because when using extends, the needs property
>> is not being merged (the parent property overwrites the child one).
> 
> I like the patch. Replying here on top because the diff below is not
> very helpful.
> 
> When you say that "extends" overwrites the properties, do you mean that
> "needs" in qemu-smoke-dom0-arm64-gcc overwrites "needs" in .qemu-arm64,
> when qemu-smoke-dom0-arm64-gcc includes .qemu-arm64?
Yes, exactly. The behavior depends on the property. For example, the variables
section is merged but needs end up being overwritten. This is because the extends
does not merge the keys (variables uses key: value, whereas needs does not).

> 
> 
> If there is no way to solve the overwrite problem then it is OK to use
> YAML achors but is it possible to define the anchors outside of
> .qemu-arm64/.qemu-arm32 ? It would make things a lot clearer in the
> code. Maybe under a top level "definitions" key? The point is that
> .qemu-arm64 and .qemu-arm32 should use the anchor rather than define the
> anchor.
It is possible to define anchors outside qemu-arm64/arm32. I decided to
define them in these jobs because for me it looked cleaner (less lines of code).
But I'm ok to carve them out if that is what you prefer. This would
require dropping the needs property from the extend jobs, as they cannot make use
of the anchors (overwrite issue), and using the anchors from real jobs (just like I did in this patch).
So we would have:

.arm64-test-needs: &arm64-test-needs
  - alpine-3.12-arm64-rootfs-export
  - kernel-5.19-arm64-export
  - qemu-system-aarch64-6.0.0-arm64-export

.qemu-arm64:
  extends: .test-jobs-common
  variables:
    CONTAINER: debian:unstable-arm64v8
    LOGFILE: qemu-smoke-arm64.log
  artifacts:
    paths:
      - smoke.serial
      - '*.log'
    when: always
  tags:
    - arm64

qemu-smoke-dom0-arm64-gcc:
  extends: .qemu-arm64
  script:
    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
  needs:
    - *arm64-test-needs
    - alpine-3.12-gcc-arm64


> 
> I wouldn't call it qemu-arm64-needs because it has things
> like alpine-3.12-arm64-rootfs-export and kernel-5.19-arm64-export that
> are not required by qemu-system-aarch64-6.0.0-arm64-export. If anything
> qemu-system-aarch64-6.0.0-arm64-export needs CONTAINER:
> debian:unstable-arm64v8.
> 
> So I would call the anchor something like "arm64-test-needs". Same
> comment for the arm32 anchor.
Ok, this naming sounds good to me.

> 
> 
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> This patch is based on the CI next branch where we already have several
>> patches (already acked) to be merged into staging after the release:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fsstabellini%2Fxen%2F-%2Ftree%2Fnext&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Ca83af11b062b431b4f0908dab3ad2162%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019853419768862%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=TZxie442G%2Bm6SP%2FemyPuv8dwCDXAv1Wxwe22yGQZaB4%3D&amp;reserved=0
>>
>> Tested pipeline:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fxen-project%2Fpeople%2Fmorzel%2Fxen-orzelmichal%2F-%2Fpipelines%2F671114820&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7Ca83af11b062b431b4f0908dab3ad2162%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019853419768862%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=tMwGAZUKyvDp%2BxmVdxUD1kg3uMagWdO2P1DjF5O3b2M%3D&amp;reserved=0
>> ---
>>  automation/gitlab-ci/test.yaml | 266 ++++++++++-----------------------
>>  1 file changed, 80 insertions(+), 186 deletions(-)
>>
>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
>> index 92e0a1f7c510..fc0884b12082 100644
>> --- a/automation/gitlab-ci/test.yaml
>> +++ b/automation/gitlab-ci/test.yaml
>> @@ -7,32 +7,12 @@
>>      - /^coverity-tested\/.*/
>>      - /^stable-.*/
>>
>> -# Test jobs
>> -build-each-commit-gcc:
>> -  extends: .test-jobs-common
>> -  variables:
>> -    CONTAINER: debian:stretch
>> -    XEN_TARGET_ARCH: x86_64
>> -    CC: gcc
>> -  script:
>> -    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
>> -    - mv ../build-each-commit-gcc.log .
>> -  artifacts:
>> -    paths:
>> -      - '*.log'
>> -    when: always
>> -  needs: []
>> -  tags:
>> -    - x86_64
>> -
>> -qemu-smoke-dom0-arm64-gcc:
>> +.qemu-arm64:
>>    extends: .test-jobs-common
>>    variables:
>>      CONTAINER: debian:unstable-arm64v8
>> -  script:
>> -    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
>> -  needs:
>> -    - alpine-3.12-gcc-arm64
>> +    LOGFILE: qemu-smoke-arm64.log
>> +  needs: &qemu-arm64-needs
>>      - alpine-3.12-arm64-rootfs-export
>>      - kernel-5.19-arm64-export
>>      - qemu-system-aarch64-6.0.0-arm64-export
> 
> LOGFILE should be listed among the artifacts (and maybe we can remove
> *.log if it has become redundant?)
*.log is not redundant because we have 4 logs to be stored, e.g.:
- smoke.serial
- config.log
- build.log
- qemu-smoke-arm64.log aka LOGFILE

So we can either have this:
artifacts:
  paths:
    - smoke.serial
    - '*.log'

or this:
artifacts:
  paths:
    - smoke.serial
    - ${LOGFILE}
    - '*.log'

I would prefer the former (just as it is now) but if you prefer the latter, it is ok.

~Michal

