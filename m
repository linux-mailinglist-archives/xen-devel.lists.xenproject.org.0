Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C912B79E94F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 15:31:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601314.937317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgPxg-0007R7-As; Wed, 13 Sep 2023 13:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601314.937317; Wed, 13 Sep 2023 13:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgPxg-0007OI-72; Wed, 13 Sep 2023 13:31:20 +0000
Received: by outflank-mailman (input) for mailman id 601314;
 Wed, 13 Sep 2023 13:31:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUH4=E5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qgPxf-0007O9-Aw
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 13:31:19 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e89::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cebe9a5f-5239-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 15:31:14 +0200 (CEST)
Received: from SN6PR2101CA0015.namprd21.prod.outlook.com
 (2603:10b6:805:106::25) by MW4PR12MB7482.namprd12.prod.outlook.com
 (2603:10b6:303:212::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 13:31:10 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:805:106:cafe::6) by SN6PR2101CA0015.outlook.office365.com
 (2603:10b6:805:106::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.5 via Frontend
 Transport; Wed, 13 Sep 2023 13:31:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Wed, 13 Sep 2023 13:31:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 08:31:08 -0500
Received: from [172.22.247.28] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 13 Sep 2023 08:31:07 -0500
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
X-Inumbo-ID: cebe9a5f-5239-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWnVhJspG86GDz6ryQ1atlWLaUaCsjywyhwcOR+jxmWeO5FnXYzHeqpJzYKPaECJHjNgxFFzoAlIwFgjyEUcjlMqS5DE65NFePb5+q7y9gjL8hmZKRif4AwB9xiJ2YHPZxIAojfAyr+t5xQSUqwlpNssiZ5iq3mOmcGp773MnT+87oPQVU/fXJWqVqd4ohQATI+T0TVisdvzhy2iWS/q3GGlON8SLbByUGx3Gc4OoezA9iF1isiMn9beUfIYVPkt/uQHfnOOr/1xFemvqTrb/TsUFyw/00x8SwMRn5482rxSwVU4Vli3m7TAa5ntV+caXJobuKWQVB01VGHg4SldCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HS7Tx0a0EzzAaYBcPzCz5djOD/Bqilx8H5ofIMYXJ/4=;
 b=ZpBPlWgLu824JL/mI9UBmQH4chmoj6K2g89VDjWL6MfE0bjXP+TpXmJhojH3APXEpTWPcVPTDENP6BJJaw4UohsHZNJhQYgQBj1Cfb4xZy2dwvSlESm89+lkAGRcv2wQ4G3ES6wqa9wWFqHtffTofOPJkqeAuq8FwXuOlfM57VaQWt4d4rRP7T3+gtQWXnhv+0iYoRqe2OXFEOr8CFPSubBsVDu4/bYqc8IFwYjM8VeSPvCkRZ1pKWZ6nAcIGu7AGifrrBayy6F+yoasQLFJ90jIFmTAdrJakaIHV91WQGSIRpyqb1dwneNvcf12QfkBYP+7noX5W5YHyUhtK0K7gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HS7Tx0a0EzzAaYBcPzCz5djOD/Bqilx8H5ofIMYXJ/4=;
 b=rVd8OM1SaYiHfUVHKkh9ebwKZVNWbky60aFOoH3l+P5mfQCZKUEpzkhLRF7jNvBvLCDT86dr2Eq3eQuNqrAZqoOnPREUpfu5kUU3Hy06yiVh9bgXn9GpEiA7BSGZvgyCGcRinufpISj6a0q00Ovmt99QYDIEBl0BY8rY7QFuPgg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2d0f5df6-d5bb-a31d-94d3-33bb1fe8665d@amd.com>
Date: Wed, 13 Sep 2023 09:31:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [ImageBuilder PATCH v2] uboot-script-gen: use size from arm64
 Image header
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
References: <20230912204345.7271-1-stewart.hildebrand@amd.com>
 <98187155-3263-6197-ddb3-07cf9b883264@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <98187155-3263-6197-ddb3-07cf9b883264@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|MW4PR12MB7482:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ac7beaf-4593-4837-e006-08dbb45db145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YdMeZitJinKCSZchhrd7blLpnqU/BtTw+dxE/JMgp0j/Vp9gyYuPrSJ5jPhgNkK3EMZpImAWKaExJ6z7xbo5FV6eqFkhiRD/bXOn9SFIgrCXiwXadPbsC1gc4EsFILNaECwYWtvfV7y+Dh/tYLTEPZjTlkeaz67JGebtYi8fIWuRWnoHtlhbmE6OvOcXp/q011jpHJzgc6pJhmpjz43CWkQVWIUsGjm3M9Bhz7LbVP6tBIPQPklCliMi9ZaHYBTjVP4tKsUVyQOjK+85XtiN0Q0qaTpK7VcSdTRIuNfbBsl796tsUx5O51IAl7ZFzqHhjS9omI5oxxbgh70HEHCOdfIlin5UncUIzo9KQraytotjVzQAMqY7NB5HlAeNBCg4LIyI+y1rjN4skdRbGvPkTu0HMZXyb52z1zKvzc/N8q4Y1JTRna3sz8vaBnxrDAvdSjlLG3ZW0RmDCOmUNuSAu0S/6/5kyJbdNzwOToDbZ+1IMFVLbBahMpcjmn2e3F+YdIVNJhGjc4qTf0syKhJdu3jbZlW1oCuc6yNYqmok5UpO2P2V+bNbIadcRvFV/5PK87RzbA3S4qqrn+Yu8t3m8t/eKhnm1cXyopAotUtSUQXF28xxkTXanFinPM+AXtYusdmlOSdkn4/5pTZyPoIwM30E4B/OfhHeSGgk40DUH4dUtefE17XJEnbD4wq3J4DoqjbWRlcH1ny5WQse8YbEECpyTkWhsoyIU1zfMn/6l3X7EMZ56+DSvETEaNgUwG/Z7YIBdvXp7UcKQpKD91aQaalgmouJGI9mZbYRUsuoIKY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(186009)(451199024)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(53546011)(82740400003)(26005)(40480700001)(81166007)(356005)(110136005)(70586007)(478600001)(31696002)(36860700001)(70206006)(426003)(83380400001)(47076005)(86362001)(336012)(2616005)(40460700003)(44832011)(5660300002)(8936002)(8676002)(16576012)(316002)(41300700001)(36756003)(4326008)(2906002)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:31:10.1536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac7beaf-4593-4837-e006-08dbb45db145
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7482

On 9/13/23 03:27, Michal Orzel wrote:
> Hi Stewart,
> 
> On 12/09/2023 22:43, Stewart Hildebrand wrote:
>> There is a corner case where the filesizes of the xen and Linux kernel images
>> are not sufficient. These binaries likely contain NOLOAD sections (e.g. bss),
>> which are not accounted in the filesize.
>>
>> Check for the presence of an arm64 kernel image header, and get the effective
>> image size from the header. Use the effective image size for calculating the
>> next load address and for populating the size in the /chosen/dom*/reg property.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> The patch works, thanks!
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> with one little suggestion...
> 
>> ---
>> v1->v2:
>> * add in-code comments
>> * use variables more
>> ---
>>  scripts/uboot-script-gen | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index 9656a458ac00..f0972d983017 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -2,7 +2,7 @@
>>  
>>  offset=$((2*1024*1024))
>>  filesize=0
>> -prog_req=(mkimage file fdtput mktemp awk)
>> +prog_req=(mkimage file fdtput mktemp awk od)
>>  
>>  function cleanup_and_return_err()
>>  {
>> @@ -435,6 +435,21 @@ function add_size()
>>  {
>>      local filename=$1
>>      local size=`stat -L --printf="%s" $filename`
>> +    # Read arm64 header magic (https://www.kernel.org/doc/Documentation/arm64/booting.txt)
>> +    local arm64_header_magic=$(od -j 56 -N 4 -t x4 ${filename} | head -n 1 | awk -F' ' '{ print $2 }')
> can we simplify:
> head -n 1 | awk -F' ' '{ print $2 }'
> by just doing:
> awk 'NR==1 {print $2}'

Yes. I'll send v3.

Stew

