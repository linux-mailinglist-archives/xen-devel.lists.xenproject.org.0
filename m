Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3691A7936DB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 10:07:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596323.930175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdnYl-0002fn-PR; Wed, 06 Sep 2023 08:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596323.930175; Wed, 06 Sep 2023 08:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdnYl-0002dh-Lu; Wed, 06 Sep 2023 08:06:47 +0000
Received: by outflank-mailman (input) for mailman id 596323;
 Wed, 06 Sep 2023 08:06:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7I91=EW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qdnYk-0002dZ-Hk
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 08:06:46 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51bdcf93-4c8c-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 10:06:45 +0200 (CEST)
Received: from DM6PR11CA0038.namprd11.prod.outlook.com (2603:10b6:5:14c::15)
 by IA0PR12MB8864.namprd12.prod.outlook.com (2603:10b6:208:485::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 08:06:39 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:5:14c:cafe::b9) by DM6PR11CA0038.outlook.office365.com
 (2603:10b6:5:14c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36 via Frontend
 Transport; Wed, 6 Sep 2023 08:06:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.205) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 08:06:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Sep
 2023 03:06:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Sep
 2023 03:06:37 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 6 Sep 2023 03:06:35 -0500
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
X-Inumbo-ID: 51bdcf93-4c8c-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1jTUNJu8IzGmLUj366TAJFXRgab29eaO/T2i4qgJG4CgLOB4qYqaH0vn9/LfBA9HqMLPFjHD2U+B5RMutln1QDdxLIle06L7YW+9gRjc++HZlEowudWj4ePlHp6yWYAQwN49lc6XlgrJUdB3BnnWalJyRjYA7WJnIA/oJy9oGO6SREPOBtBTbxQ1vmDqrMYWh55UzPPY2Ya8h3ijNuXDo1he/4dZIHC/YQ/pcsDk9Cz7p36/27UIi8y47uoLk4F4ze4GunmQZEp+MuvCZ/rt7687vOlZXnw+N7ai+EG8NxFW1HIacI6A8c/dYu2kJiMdyEJ5CNOFONBn9xi7bfDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6cr/Bd+Og4QIyLoDX0k2Rypo4kx5cz0WNC55Ldy40o=;
 b=YuDnS3izQedGPjoI4xCUGbb3htT4hU7DmCwQBF0fbcZLEencUrQBHViqQUZupkfNe+0jtkXwMvINccRHMjyalAib5s1kZlCSmlnPVk3cUXsR+zHFCvzqawC0g2GnjDuFKBBQ6dpaIZBkrdAEuf5ni5PpJ6Q3ZXKOonrcSmMj+XsrYlexPrFiAzxEGh+hOe1pSJAmuV0C+lf2XOyiMNXFutU3pq90qxjtyYRoEuiW9phmMNDwuzRpMhDIv3CL3heqnCwiMqfu4pRROl7Shc9kDlOMKEDd6PEmWpuOgwwODRXAssaiaxKhj0VLzMm4JD2xeVpIJgIu4igaQdaOAlkBsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6cr/Bd+Og4QIyLoDX0k2Rypo4kx5cz0WNC55Ldy40o=;
 b=kt8Gh7+0CxT2VTYN+BfxViJxZ4OAW0zbPjYHGsV3lpwLe4+rAN40QrytXq1ERxsTV3LidL0dg2XyxaOVFL2zcvLOeul7k2SB84HOVeGjqmSxe4asYohYWRZxWQdZdlAB0qffGelF2ltN37Q0y3nhDqYo3HVDSTGJG/GasSM7D/M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4ce7bcfe-0c32-70f0-7501-451a67ccd26b@amd.com>
Date: Wed, 6 Sep 2023 10:06:35 +0200
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
 <6a3bcb64-2416-225e-8a5e-5ea7823d3c29@amd.com>
 <dd1026ce-8c2b-2198-fc7f-91f7e671e62f@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <dd1026ce-8c2b-2198-fc7f-91f7e671e62f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|IA0PR12MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f153880-dee8-4bc8-2ab7-08dbaeb03270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TcxJ7dj/68TvQoO791wgW3/706n4wliBh2fQQEmNjKq85d/B08pwmv2RYvku3DnZIt5srUnbvmpjNwvFq8EALGkNyupKMs6olSc7wtb/MqjfXFrJaEnfExVNiyDGZzf9FDW5VF+pDobp/GWoMFJ2zqeTxlPE44sfTFF5ybBY8zVoHvfv/WmqQp4wwSGaEmw3bxCnkuP+TNdPBVSNJkBbwLz0A9pcameSbdIfW290cdi7tRqBNhlZflAtYEugAmAIzk8T0+9ozOFO8W+uUwESx9HjFvrWVniQwTtiI3py06aDef4ic4yoNxhsYCOzLM9dzIWpq74SoGcagU/QSIoQkYL/rskRXNw4FXhV1VoiVDyPm1nJSgV+PZDkoiVb3/WPMqZZV/rO0Jr2cjvZomhpxkJ8PRuLPW+mSULf4gmtII2+onP5qx/x8MY4K79LWIcbzaIfubLAVNjlTgaUBevJJ+enLiHv70/jy1gFm661EGCLNOanw6ClwUwSxIUscYTZ5LB07nLJKjh5xQoOcpyWfRRo5MpnBaLlm+BW9RJDSlIUF7Bv7zBggKK+R3rhv6o5cCOB0lsCyM03Bc7gJO646Ti7ke9GE9/5Kb904pJKGKy0B9VjetwGujvCwncD841BC7PK09F+Q8TkbH0vDdIlEdoZnPmVjley+jukxIuo3atnXzlgvq8fXlqmS+ftamre/2eCNiQyStkzyWOQGYTvX8TujvkcFAUiP66EatkOJahw9YHVJn8Sx254DcqrGggXYrN/0OQznxIn8euIi8WqIbFV9Oj2butmzFKyJMzkygMHAQA1Bv4DjCTOLVF3bdrt
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(186009)(451199024)(82310400011)(1800799009)(46966006)(36840700001)(40470700004)(40480700001)(478600001)(336012)(426003)(83380400001)(40460700003)(36756003)(53546011)(356005)(26005)(81166007)(2616005)(82740400003)(44832011)(36860700001)(31686004)(316002)(6636002)(16576012)(54906003)(47076005)(2906002)(4326008)(8676002)(8936002)(41300700001)(5660300002)(86362001)(70206006)(70586007)(110136005)(31696002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 08:06:38.5808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f153880-dee8-4bc8-2ab7-08dbaeb03270
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8864



On 06/09/2023 09:57, Jan Beulich wrote:
> 
> 
> On 06.09.2023 09:32, Michal Orzel wrote:
>>
>>
>> On 06/09/2023 08:55, Jan Beulich wrote:
>>>
>>>
>>> On 06.09.2023 03:16, Vikram Garhwal wrote:
>>>> --- a/tools/xl/xl_vmcontrol.c
>>>> +++ b/tools/xl/xl_vmcontrol.c
>>>> @@ -1265,6 +1265,58 @@ int main_create(int argc, char **argv)
>>>>      return 0;
>>>>  }
>>>>
>>>> +int main_dt_overlay(int argc, char **argv)
>>>> +{
>>>> +    const char *overlay_ops = NULL;
>>>> +    const char *overlay_config_file = NULL;
>>>> +    void *overlay_dtb = NULL;
>>>> +    int rc;
>>>> +    uint8_t op;
>>>> +    int overlay_dtb_size = 0;
>>>> +    const int overlay_add_op = 1;
>>>> +    const int overlay_remove_op = 2;
>>>> +
>>>> +    if (argc < 2) {
>>>> +        help("dt_overlay");
>>>> +        return EXIT_FAILURE;
>>>> +    }
>>>> +
>>>> +    overlay_ops = argv[1];
>>>> +    overlay_config_file = argv[2];
>>>> +
>>>> +    if (strcmp(overlay_ops, "add") == 0)
>>>> +        op = overlay_add_op;
>>>> +    else if (strcmp(overlay_ops, "remove") == 0)
>>>> +        op = overlay_remove_op;
>>>> +    else {
>>>> +        fprintf(stderr, "Invalid dt overlay operation\n");
>>>> +        return EXIT_FAILURE;
>>>> +    }
>>>> +
>>>> +    if (overlay_config_file) {
>>>> +        rc = libxl_read_file_contents(ctx, overlay_config_file,
>>>> +                                      &overlay_dtb, &overlay_dtb_size);
>>>> +
>>>> +        if (rc) {
>>>> +            fprintf(stderr, "failed to read the overlay device tree file %s\n",
>>>> +                    overlay_config_file);
>>>> +            free(overlay_dtb);
>>>> +            return ERROR_FAIL;
>>>> +        }
>>>> +    } else {
>>>> +        fprintf(stderr, "overlay dtbo file not provided\n");
>>>> +        return ERROR_FAIL;
>>>> +    }
>>>> +
>>>> +    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
>>>
>>> Because of this being Arm-only (as validly pointed out by osstest), I expect
>>> the entire function here as well as its entry in cmd_table[] want to be
>>> Arm-specific, too? Of course it would be nice to not key this to __arm__ /
>>> __aarch64__, but to something that would not need touching again if the
>>> underlying infrastructure was made available to, say, RISC-V as well. But of
>>> course - right now the goal needs to be to address the CI and osstest
>>> breakage.
>> I agree. I would suggest to guard it with LIBXL_HAVE_DT_OVERLAY which is for now
>> only defined for arm32/arm64. This way the code will not need to be modified if other
>> arch gain support for the feature.
> 
> Ah yes, that ought to work. While there perhaps also replace the conditional
> around the declaration of the function in libxl.h. (But of course Anthony
> may tell me/us that this isn't the way to go.)
Hmm, if we change guards for libxl_dt_overlay(), what about xc_dt_overlay()
for which we cannot use LIBXL guard? Is it ok in that case or better just focus
on the fix.

~Michal

