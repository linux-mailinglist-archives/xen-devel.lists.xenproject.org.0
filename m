Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F0B78CD3A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 22:00:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592455.925166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb4rR-0007d1-0N; Tue, 29 Aug 2023 19:58:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592455.925166; Tue, 29 Aug 2023 19:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb4rQ-0007a4-Tf; Tue, 29 Aug 2023 19:58:48 +0000
Received: by outflank-mailman (input) for mailman id 592455;
 Tue, 29 Aug 2023 19:58:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Epr=EO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qb4rP-0007Zy-AR
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 19:58:47 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7353bd44-46a6-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 21:58:42 +0200 (CEST)
Received: from CY5P221CA0051.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:4::26) by
 CH0PR12MB5153.namprd12.prod.outlook.com (2603:10b6:610:b8::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.35; Tue, 29 Aug 2023 19:58:36 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:930:4:cafe::36) by CY5P221CA0051.outlook.office365.com
 (2603:10b6:930:4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18 via Frontend
 Transport; Tue, 29 Aug 2023 19:58:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.79) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Tue, 29 Aug 2023 19:58:35 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 14:58:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 12:58:35 -0700
Received: from [192.168.139.126] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 29 Aug 2023 14:58:34 -0500
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
X-Inumbo-ID: 7353bd44-46a6-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJcW+05uAOzzppJLgUw5hIChgf+Bcc8jMHtupBNYZNEwoErxuiwLE5wCS/lb6v/nFEaYO52fKspHzqAyWxtZd5kyzU9D64m0KdaXK6RViIgnsJKlI013rhYlXBkX9PrJFiQuRetIIAU4kLTmdEn5JtBWCNNJAlahdvCvZnzg/H/0XGhJsIPavJ+QPuspKpa/9CaeXR32w2GJ9UZ6kU24wJPQWSn2NDgITg7n8md4fc9CIjswmo/KZOrn+DgfAyi+riVGN2YSsYss+pnJjylAIhrxPt+52kIkEv4u/8RCjzpEFanm68BPV45IvW32Bi4R5pScl0IYlGm4hCTo4kMzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwMxruHWYc2va5Z9r+cMPxsJwA/nd+0XhTUuzNFCIK4=;
 b=Vz0ZSuVAXsKbcmZiwrk9BVVERLapqtpuRbDjGuii1Z7eCoixKETUl2Mn1rkjQi37a2JIcV6Ogqj1ufyQbn1kT1uqe0EvpT/ObNpYib5D2gIeh4JY6PLH8TNc1QS650wKZonyCLdZKmHVUoWOXOwneukeFwW/u6ez8UUOjSSKdFPJDTmFmzkmxMDSp1oFiQsloCj6Tlwr4h3NHNqNtj7iPZUCgG5LxIgbx7vsN9hlgyAkNz5L3bMacZP0iSYjeyq7hlN6k3oac2wIOuEjJQQVSf5Y3y31A+dAkIvnTP2tSL8GQ6rLPpIqHe8/x1sD3bzspFjEsmIqbvp7YasAvuXJrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwMxruHWYc2va5Z9r+cMPxsJwA/nd+0XhTUuzNFCIK4=;
 b=voVAoAi7COkBH1/DeuGU9neQHoUy+8+NORrZMrzlgb+qJVJ9T3xFFqvsfcyO03Tg6PSFYMcO/Y4OSHl8HcCYY8/aRwvXZ9eQzvClLszLurdDkYKXF5/+LHezQFJEX6LqffLJhdkfWu/uXys2BL0lwH/1PvwNQcJlJO3HWFbVay8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f52813ef-dd5c-2cdc-22dc-05365c48263e@amd.com>
Date: Tue, 29 Aug 2023 15:58:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [ImageBuilder PATCH] uboot-script-gen: use size from arm64 Image
 header
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Michal Orzel <michal.orzel@amd.com>
References: <20230824182233.50760-1-stewart.hildebrand@amd.com>
 <alpine.DEB.2.22.394.2308241613060.6458@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2308241613060.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|CH0PR12MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a4c8c4-088a-4b2a-fbf1-08dba8ca5490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QmNXuqZ1kjxRhpuWOH3whjkUCYCnYTil5Urv5F6xjQRrkbL4EPI22eibGpgRogN/2URXhOysjeDNblCQrfHeSwZ0CdSlZpQosNrUbCeEJEGqWzzaokjuowhBRSCZfpCBVXxLaEkh/jSnUo2c5WV0fN8L0SHE54KAoEF3YqXYumWsEbZkfXTuaf+5VrWR4UveGboJ+QNBXkdOxLq63vWXBRx3QswT1LBaXaTNgi4VglYqir0nM3UXGeuk5SLDb6vWQWP4kDdyECky+e+PLrGJxudIJ77csh6YA1r6y2jSFS9MYIQPFs39/FAZR2oc6OQk+LLWxI7GMOJi7HhykZUc68hvlIMTZ6539G/L+xnZK+BzKw5/K64bUKccw/26DuDWg031hv+u7Ao7oWWfPdnFe8WXAcpecI5vzQ0g+iyLabG7tra7lIOE6vHJn7In+F777EJ1Wc+gCcJB2XO5RrE07ly2xrpC7bV3K2bkeb+vgbmrpHnBI2cZDAE+va6meLIhGeMjEZAHvoWbnm0qf58Qt4wgDNSvp16zfmIJcy5RTFqHDJV9YUdw1TpBnhSdUuGp3SRECeFvg8vbyPUcBwWEwD6BcnOqR8CZUJo+94rnPHC7LeislKSmgpfJY4iLn5gLdRYAA2sXJj1B1W5fRGpIQODP6hx99XvLQtLHTleMZGgKPcwd8DRJ+NIuEx/ShrwWg1Hdph7R2CUYJ01wVTYL4uTC2nXkCwe2CszTIeMK7PAypnOv0qE0hDKJdj/42Ayx93SxouXxmKbEUdPcsfmbC7LnUDhB88TlVuarzEWhDBPVxblwlMennxzt0toawpbABL0f9rT19DRYY6XhaujtVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(1800799009)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(81166007)(356005)(82740400003)(8936002)(70206006)(53546011)(478600001)(70586007)(31686004)(54906003)(6916009)(16576012)(316002)(41300700001)(40460700003)(36756003)(26005)(44832011)(8676002)(5660300002)(2906002)(31696002)(83380400001)(2616005)(47076005)(86362001)(36860700001)(40480700001)(426003)(336012)(4326008)(21314003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 19:58:35.7767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a4c8c4-088a-4b2a-fbf1-08dba8ca5490
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5153

On 8/24/23 19:19, Stefano Stabellini wrote:
> On Thu, 24 Aug 2023, Stewart Hildebrand wrote:
>> There is a corner case where the filesizes of the xen and Linux kernel images
>> are not sufficient. These binaries likely contain .NOLOAD sections, which are
>> not accounted in the filesize.
>>
>> Check for the presence of an arm64 kernel image header, and get the effective
>> image size from the header. Use the effective image size for calculating the
>> next load address and for populating the size in the /chosen/dom*/reg property.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>>  scripts/uboot-script-gen | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index 9656a458ac00..50fe525e7145 100755
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
>> @@ -435,6 +435,17 @@ function add_size()
>>  {
>>      local filename=$1
>>      local size=`stat -L --printf="%s" $filename`
>> +
>> +    if [ "$(od -j 56 -N 4 -t x4 ${filename} | head -n 1 | awk -F' ' '{ print $2 }')" = "644d5241" ]
>> +    then
>> +        local size_header=$(od -j 16 -N 8 -t u8 ${filename} | head -n 1 | awk -F' ' '{ print $2 }')
>> +
>> +        if [ "${size_header}" -gt "${size}" ]
>> +        then
>> +            size=${size_header}
>> +        fi
>> +    fi
> 
> 
> Thanks Stewart this is great! Can you please add a good in-code comment
> to explain what field you are reading of the header exactly and what is
> the value 644d5241 you are comparing against?

Yes

> Also I think it would be easier to read if you used "cut" instead of
> awk and split the line a bit more like this:
> 
> 
>     # read header field XXX
>     local field_xxx =$(od -j 56 -N 4 -t x4 ${filename} | head -n 1 | cut -d " " -f2)
>     # comparing against XXX
>     if [ $field_xxx = "644d5241" ]
>     then
>         # read header field "size" which indicates ....
>         local size_header=$(od -j 16 -N 8 -t u8 ${filename} | head -n 1 | cut -d " " -f2)

od seems to output a varying amount of whitespace between the address and value. In this case, the cut command would seem to want to become cut -d" " -f14 to account for the whitespace. awk is more predictable here, so I will keep awk.

