Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A134793654
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 09:34:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596282.930118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdn1p-0002XF-QI; Wed, 06 Sep 2023 07:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596282.930118; Wed, 06 Sep 2023 07:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdn1p-0002VU-N5; Wed, 06 Sep 2023 07:32:45 +0000
Received: by outflank-mailman (input) for mailman id 596282;
 Wed, 06 Sep 2023 07:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7I91=EW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qdn1n-0002VO-M6
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 07:32:43 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ee34407-4c87-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 09:32:39 +0200 (CEST)
Received: from DM6PR03CA0079.namprd03.prod.outlook.com (2603:10b6:5:333::12)
 by IA0PR12MB8982.namprd12.prod.outlook.com (2603:10b6:208:481::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 07:32:35 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:5:333:cafe::89) by DM6PR03CA0079.outlook.office365.com
 (2603:10b6:5:333::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 07:32:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 07:32:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Sep
 2023 02:32:34 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 6 Sep 2023 02:32:32 -0500
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
X-Inumbo-ID: 8ee34407-4c87-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0MsFkdhrbSYcJWdAA7rxlZZS+O2BjZ64Rzhp54GrKK3410m4ByvRq5xYX6IwJeCdIUyhaK6wBgkSdqTaShaaLGfaBab6LvCH1laVdGdkOYkODFD7j/uUx+gnUzcuu2spJtYuItiYUI3V58N8xy/kyPXhEB0mGu6eC9sZ7w/d+Zk1SVqK0lbyBETnzB8TFuTBShmSIi2lczypfcrl3Urkeqn3JOxQzFIz2K4IyDPOQJu7WElxrI6fb1Qre5VBxDT+HrZBhOZCZWfAVdUI3mJvWo4oBpfE8T4J7VCBE/uttAXOAuvzfoHIrm3PDEBj/6rCn7QMQ4Ipw0YXet74PbDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whwNS31ciyyyIKDdM7G6dzN//dXtNumdFdEUk0tQB70=;
 b=RgQXa4gVB6nJP5393Y+/ewpeuF6yywlYD0Ez34LQ9OEx24Ej1T0jfttkB3Ek+6vSDsbYcv3opeUKGS7gksPIkh1/tUa7rmBGpbvK+DAG09wBF49HpazRL3m1YzO9ZuMIGjB3xbJiPjF55+pIVsxdMbQSqab54sCzNwv/hhJ5bmxcsrYz17he2/ke6ZuYbyBFwgOkn7SaJ1iR2ch/i5LMyboNOsQJDv499uJYo5f7NEzEobTcV5OMz5QSsI5INHdBA6MDWPsBdSKeuhZBVkHr6kUpJUEF3LYF2xzwUxil8z+xKKfM3gQaCav3QLIlsNmdCpTZyoQ0FHzo9DQyiJHt2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whwNS31ciyyyIKDdM7G6dzN//dXtNumdFdEUk0tQB70=;
 b=RcPI63T0JMP9nckdqS6pjBhqShesxTLiMMerfaoz+rFjpFSppqmNpttufrp/0b40sVlVAbmNcvpZdqYTZ7dbZ1rEfxOfXfUEg66ADHImPugeTtzLpElCWtI01jT5UqDOXLepncnBlzTTKczKxnWWxD5XRNrPjp2djRavCTsxTMg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6a3bcb64-2416-225e-8a5e-5ea7823d3c29@amd.com>
Date: Wed, 6 Sep 2023 09:32:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN][PATCH v12 20/20] tools/xl: Add new xl command overlay for
 device tree overlay support
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Vikram Garhwal <vikram.garhwal@amd.com>
CC: <julien@xen.org>, <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
 <20230906011631.30310-21-vikram.garhwal@amd.com>
 <3ee81557-50d2-1ae0-e700-9f20672ef15e@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <3ee81557-50d2-1ae0-e700-9f20672ef15e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|IA0PR12MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f1ec7e-93c6-426c-b0f9-08dbaeab703d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xscjzJBhStU+6maWvBxBJQg/qwhQ7VBooZE8dDmc57/ho3jLB1YoYVzFirixaRkNPBKCOcV0vCf61imqPytMU2OF4jbYppV6FG5cT5BHsGDYggNcw6q6wHuPgt13ElsVk5GIgTmlyQeIRpPnvOXXUrzYZxrbxSrz7dpKuMqr2oozYsA71KXUl5Rpzh5a0vjp0DDf6Q/mkwoXSgsMw5jo7oPjbC6YHj6fTuVzHv3O1Erms1p970Jd6cCcvp0EeyxY5a2M6RKhWKw0b/SlGHJdidiGZVy7oPu7yIdACY3NbAT6gxQnpvRpgxQgPHv/jdoXd5Bi3Ik0jb+GeRj2g1LqwjDl+XSdtfWgEQanB1MeG1pLnY/bjM3F6Eek3aM9Nv5qW4kvTkACHIgiDeIdPXm3ALzl6FN0N2t2E/Lg3x2u7xKkthIdGYt8M5DQ1IrCq9r9ESBPqk2kegx7C1onIPAXd6s0J7IwlM2gcdxIpxgF0CNa7cRR7PwqUOFqy5bZmEuO4XpMxwXMCP9q/IJjVLLLZA15gVeA8cKpufvAEJmXi9GRuSCtfbzSvNRHxWLbC9fR43gzYqn9ZZ+gFG0uAJAGfpWjk75CrT89/GVqmhaRmlnoVIWFXeHgoVIngY+7s3D9qiIlqUoJo6Q2f+5c8x+sA6KrOhJPhO5acYpJsaBVMHUOMt4Dn/I7Vjez57SXpG7Xft0x7FJhEWifm0TflNAMASmX7annGONfF3LW8+acTcGLSQp7+Eri9PDWUt6Fo9YwyQ285m83oFRRrIKsF9DUgPyFA28d6ujfxVj+bTb/fmYk2neWWAbKaOTECOjJ6MUi
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(186009)(82310400011)(451199024)(1800799009)(40470700004)(46966006)(36840700001)(47076005)(36860700001)(40460700003)(2906002)(36756003)(31696002)(86362001)(81166007)(356005)(82740400003)(40480700001)(41300700001)(53546011)(16576012)(54906003)(316002)(110136005)(70586007)(4326008)(70206006)(8676002)(2616005)(8936002)(31686004)(6636002)(336012)(426003)(478600001)(44832011)(26005)(5660300002)(83380400001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 07:32:34.8007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f1ec7e-93c6-426c-b0f9-08dbaeab703d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8982



On 06/09/2023 08:55, Jan Beulich wrote:
> 
> 
> On 06.09.2023 03:16, Vikram Garhwal wrote:
>> --- a/tools/xl/xl_vmcontrol.c
>> +++ b/tools/xl/xl_vmcontrol.c
>> @@ -1265,6 +1265,58 @@ int main_create(int argc, char **argv)
>>      return 0;
>>  }
>>
>> +int main_dt_overlay(int argc, char **argv)
>> +{
>> +    const char *overlay_ops = NULL;
>> +    const char *overlay_config_file = NULL;
>> +    void *overlay_dtb = NULL;
>> +    int rc;
>> +    uint8_t op;
>> +    int overlay_dtb_size = 0;
>> +    const int overlay_add_op = 1;
>> +    const int overlay_remove_op = 2;
>> +
>> +    if (argc < 2) {
>> +        help("dt_overlay");
>> +        return EXIT_FAILURE;
>> +    }
>> +
>> +    overlay_ops = argv[1];
>> +    overlay_config_file = argv[2];
>> +
>> +    if (strcmp(overlay_ops, "add") == 0)
>> +        op = overlay_add_op;
>> +    else if (strcmp(overlay_ops, "remove") == 0)
>> +        op = overlay_remove_op;
>> +    else {
>> +        fprintf(stderr, "Invalid dt overlay operation\n");
>> +        return EXIT_FAILURE;
>> +    }
>> +
>> +    if (overlay_config_file) {
>> +        rc = libxl_read_file_contents(ctx, overlay_config_file,
>> +                                      &overlay_dtb, &overlay_dtb_size);
>> +
>> +        if (rc) {
>> +            fprintf(stderr, "failed to read the overlay device tree file %s\n",
>> +                    overlay_config_file);
>> +            free(overlay_dtb);
>> +            return ERROR_FAIL;
>> +        }
>> +    } else {
>> +        fprintf(stderr, "overlay dtbo file not provided\n");
>> +        return ERROR_FAIL;
>> +    }
>> +
>> +    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
> 
> Because of this being Arm-only (as validly pointed out by osstest), I expect
> the entire function here as well as its entry in cmd_table[] want to be
> Arm-specific, too? Of course it would be nice to not key this to __arm__ /
> __aarch64__, but to something that would not need touching again if the
> underlying infrastructure was made available to, say, RISC-V as well. But of
> course - right now the goal needs to be to address the CI and osstest
> breakage.
I agree. I would suggest to guard it with LIBXL_HAVE_DT_OVERLAY which is for now
only defined for arm32/arm64. This way the code will not need to be modified if other
arch gain support for the feature.
If you agree, I can send a patch to unbreak CI unless you want to do this.

~Michal

