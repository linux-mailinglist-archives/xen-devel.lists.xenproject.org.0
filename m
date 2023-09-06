Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 811247935BF
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 08:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596271.930097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdmSG-0003k4-7Y; Wed, 06 Sep 2023 06:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596271.930097; Wed, 06 Sep 2023 06:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdmSG-0003h1-49; Wed, 06 Sep 2023 06:56:00 +0000
Received: by outflank-mailman (input) for mailman id 596271;
 Wed, 06 Sep 2023 06:55:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdmSE-0003gv-1H
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 06:55:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2082.outbound.protection.outlook.com [40.107.7.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6df10cbd-4c82-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 08:55:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9261.eurprd04.prod.outlook.com (2603:10a6:20b:4c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Wed, 6 Sep
 2023 06:55:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 06:55:27 +0000
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
X-Inumbo-ID: 6df10cbd-4c82-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGncuk2HDdVjCqO5qcns1oADj/xPjClo+4QI28z/x8QVdbeY07u7onsjDACi1GJjvwX2ZN5DvZtorGKJTAJP5/P7rc3P6tVz/hICPzdHpGw0Ua9WaiWjAIe9XoLHUAgj/Z225xmcYAmsx0kx9RBNBdBoqByBGgTCC++3Ghd/2w+C3NafGcQhozAgwJO0uQVo6EKA1s9sj8u7LBzytEZOLFk3xcs6rA/+0J7In7y3zXhkuJL1q00qIRklJLHF6lx8Igtq3Ya/uBD6vxIoqomEIGl2ky/Bm4VRVKXVhpYGFnN8T/eHiDpRaqxnt6ptWXJafRXy0WwVRYAhevFy/M9LhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tvcL8mpPLLrth8lvdsblRl4OrilGZemtnhMNQYPW0c=;
 b=L9WrfzTAgMiRkdfxb86bwt0VCnBa1e1FBuKmcBQsiKw9x9b6BFvhDgNixMZAJpi0STN+BHrf86A2Z0xg6CWqhRbxN5hnBSHfvIlUQBbqkytF7Hh1bsehjzY3XELRlcnzf+estrWc+8npkYqIawmeM+qZ2kpEW+TK/xPJu6gFrmc00dWZL0np+78YTME81v5kdMdQS5R6T28B1HH/i1WfLIeMsL6Ee7RybaRM37AXpJCXzWGqn9tLSV3TeuizeDxhaopPhxJ0YeYG4Slc5iSzQShg7noK/3PpCY+ixOH/76NivcLdKXb+8DPkPND7+7Pu0gD4o8+qE9WjIB9nLcsscw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tvcL8mpPLLrth8lvdsblRl4OrilGZemtnhMNQYPW0c=;
 b=iMKnm1Au+nOYZmGe2NatwrfnZ51Sn0WBHCeSYu9WmsqO71pjiYJK5ND3uNJu6roakYqWFvbE9TFwSSYGhfohz8p+NrcS8+D3SAvvSj+NA+40eFQ+BZ6Hf/aKI7qw7tJz6FBLp+hZXCbCMrQJbbC5K5iY8Xdk3m/gU3LewEQkHQRHGWqly2hOy5EU6MOJR7WJP4HAuuBJd1zI9v4SLgMLvwbGAtm+HUPL70aypoha5Iej/cE2BjE56VT5vST2HKMXnAcB0eNcWToneJg47AqKk6l7jSkwOZvqk37587kMT7NHSr3NnBLEolYhxA8ADVrOfU4ppgz//87OtiNYCMiKIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ee81557-50d2-1ae0-e700-9f20672ef15e@suse.com>
Date: Wed, 6 Sep 2023 08:55:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN][PATCH v12 20/20] tools/xl: Add new xl command overlay for
 device tree overlay support
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
 <20230906011631.30310-21-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230906011631.30310-21-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb58c61-c324-4f46-14ef-08dbaea64081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CfUXJ0v41h9ccAEwU3gVoXFRyohbjKONuM7Hnz0BVaouHiO4PV1tTPOlvCG45cTl+itBP/8W/nRpi/89gyXGPOTFUldEhB307JEoL3JVfkR/Aqxcz1EwsvQ5Org7m9wsUpxwWn3bMMxhXe6GgWCICb2WnGySxl+1nHSHdykk6ir8rdvDiijN5KqMeN+Un1NSgDAAI10C1rOnf9ic6UedOFaf/for4gndOEC4KUU71qawWMr9KneR5HO7TUePI/naDyUgu2ZZ7GrRGttWDIiorRJ+EYliLE3IlDmHq3kEQARJTcc28zGVnbVHUkxnh4Oa7vVXzX5AhOSXsHFyXy32az+CUtpvAbWx/H5hTLAj/eubd74M1x1+rd8j7Rdeuzqwo1DZoiEcNMr18ZC1NkLJN4zhMzhFH0eBPBWazi2wEkvbRf2mWAGWNLwIvSs6/gPpjtSIVzHTgALI5ImARxCmbGrgRHBEFh6cY1AJHGhe1tWojPU+4+UgsDv3kD1jpLTNqLIe7zJsmI3IFDfZKU3nTZRl52RND5uR2i+5GMeihhbDFfBtWM2rMmSGDlg8VriLsQjYBdX5Yw6kkwHeyBNq794jIQuasOtxvJ881AsANEP3FJ4P9tPiFR4BHQMSNh+OvJjB16WTUaxPFDDFlE+vcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(1800799009)(186009)(451199024)(41300700001)(478600001)(6666004)(31696002)(86362001)(83380400001)(38100700002)(2616005)(53546011)(6486002)(6506007)(6512007)(26005)(66946007)(2906002)(6916009)(36756003)(66476007)(316002)(54906003)(66556008)(31686004)(5660300002)(8676002)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emVGYUdwRnRTOWlYcGZHU3dzM2JsR2NRczVPUlJqSmEzemRYWjN1OHFDNDln?=
 =?utf-8?B?cStPMWpYakRXR1QwSEJpWXdwRzh4RXZSOUhWdllWNUtuNlpOa3AwaHl4WWVK?=
 =?utf-8?B?NUhib1JLei9iTGsvVzR1TXduUHFoOERQWFNYMkprQk96STM5RW0xN3E5elM2?=
 =?utf-8?B?RndZNWR0YjVZUG1VOGs0cWM0RkZoK1FHa3FGMFR2ZGtlYmNnTFJ6T01XMGlU?=
 =?utf-8?B?UCtEY2tIR2FpRHI3YUFZSXZ2WTBUZ2hRVnRadVpzcy9HMW4xRThZbHZkWVFF?=
 =?utf-8?B?b01VeW8yWXdlejAyR2xwQlZ1b1VoSEJsc3NnZFZGdXFNTzE3ejE0WWl0Yzh1?=
 =?utf-8?B?Y2krdkZGaWtYSG9LUThRMFhiMXNMMFBydUhjVXlHblVwek12elFtdVpCRnVT?=
 =?utf-8?B?a2xUVE5vTWxUa3FGd0l2cWtSYnlvNkFBUndjT0ZZN3E5RkwwQnpiVDViZ2xq?=
 =?utf-8?B?VldCckdYM3FjSXd5RGNaUW1YQmFaaFNhRmNNVk82VDI0cC9vazFjamVZcGta?=
 =?utf-8?B?dXVveXZ0VEh3Nm9xbHMyeWw1MmQ1WkFZMGVZQW1PUE82RHo2THAxVjVWeEpl?=
 =?utf-8?B?M1lFVDBnK3puQXd0QnBvTmRHZEJUYm5EQ1VPOGdldDhMczJkaVlETy96dXhi?=
 =?utf-8?B?T3N2M1VHSWt6VlpXaFJ6dnBFaEc4QmV5blpwVHJyUGQ4SHpHZ05zbjE2b3Jp?=
 =?utf-8?B?Mm9vWjg2SVdjUm9wYlN1WTFVSUFDOGJWRmpSMG9kRlFLL2FGQ1dDVXlJbjV3?=
 =?utf-8?B?TzMrc2JaMGkwRXVMREI5ZUlsbklWVklUNU00VWY0TlVnQmlPSUtONDAybVQz?=
 =?utf-8?B?MTdha00zT25FNElLQkJmdy9ZRDJVdWhpSHlnMmJnOWdXTEt5dUovaUdNSHpQ?=
 =?utf-8?B?VmpEb2U2dVlocUtzcTFRZFkxTGVIaXdIanc3L2hUZCtPZG0vdk9mWk5Jczk4?=
 =?utf-8?B?Q3JsOFVFS2gyVjBSVGwyb2d0TjZDQVlDRTh4bG1RV2sxY3AxN0hkUUowQzk5?=
 =?utf-8?B?RDJSVVNsaFVWRk1LOEtsR2N3L3hBZVhib2hiUXRoMU9VbTQ5bWs5Yy9Bdk1R?=
 =?utf-8?B?ZFFPWEtHTDRvS2ZsQXlFUlhBOW40ZVZwRlFTdHRzOFkrL1V2TEVVcEFYclNH?=
 =?utf-8?B?YXcrZ0E1djROMUpYcXFIMmdZZE80M0Y5Y0NJaGhNaGpMcWdFbmJNOXJrZ2xE?=
 =?utf-8?B?NEdDYUZJL3Fyd3A5ODZLdjJ2UjRIOWI4R3pOdXZlekZwNUJiZWs1cXhpa3dE?=
 =?utf-8?B?OUJxNTcvVXdlMEsvTXVhMnZySVJISTRSMUNQcE0xRk4zTzJ6VkJ2a1pENXFB?=
 =?utf-8?B?dnlGQzJBOXo0NWo2TlM1dUQ3YUNNSVBrVXZIRk1pbUR4NVJTYmFxWjg0cE9t?=
 =?utf-8?B?dER3Nng2ZzVFazN5WnhOWmZtTW50ZldUSk9KZVlKSUluZVV3SHFJNmtEMDBi?=
 =?utf-8?B?L3ZIOXY0NTFVcHhvNGhHaG1oSG5WUms1WkZmOXE0VStPSGVDRFZlMGhRN1FN?=
 =?utf-8?B?b0xvR1NxSkIwak50N3p2M2hYdi9DWXZNczFPYUliVXRDNGZtNXlnUzFhd21G?=
 =?utf-8?B?QWxBZUJoa1NWSCtMODQwR091Q3JWTVFaaFVBOXdDeDMvZ25HVTFibzU3QXd6?=
 =?utf-8?B?V0djYmxQSWJHalJjWXZTMWxIYTlkMUtLTkdXLzU3K0NMYk05WWVxaC9RN1h4?=
 =?utf-8?B?ZXlBNExwRkE5emYrYThMamtoajN2OFhIbGJiN2lqdkZnMGtwdlZadGV1bXVV?=
 =?utf-8?B?ZkZIRXI4dG83akJaanVmTjg0ckpRZmhrVldYRVhtZE5vTWRPbEFVaEZ4akZh?=
 =?utf-8?B?UzZqclZvZlpZT04vREpVbG1aK0xqZVQ3enlLOTFyQ3c4eEpqdWJ6SXR3eWxG?=
 =?utf-8?B?b0p1UFZXeExVMVZjOW1qYkszUC8vSEtFa3pIbm5qSGtKOVZZemNtTWQza2Mx?=
 =?utf-8?B?em05dGtFUGViODJTQVZNVXkrQkpaTWVJa3crTUVlVC9ncHp4ckk4Y0prOUVk?=
 =?utf-8?B?MXAyTEV0OE5DcXZvQzlTRWxsY20rN2F0S3BmZ2JibHA3M0FyN3ZYRkEraDhY?=
 =?utf-8?B?bWk3dXJIRWQyZjgwZ212Y0l4WVZKOWRnZ0NUc2RKbmlMdGNEVU5MUUhXMDhr?=
 =?utf-8?Q?Kufaa89IT4kWAXoDjshwzB5AC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb58c61-c324-4f46-14ef-08dbaea64081
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 06:55:27.4318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJvpnI5BGz//JW9+pfIASMpVStRTfmmUhDiuQFcoD5SRcg9SMN5bS+kEczTpW0GPQQJzZnQQbKo2CYyOVMt0xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9261

On 06.09.2023 03:16, Vikram Garhwal wrote:
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -1265,6 +1265,58 @@ int main_create(int argc, char **argv)
>      return 0;
>  }
>  
> +int main_dt_overlay(int argc, char **argv)
> +{
> +    const char *overlay_ops = NULL;
> +    const char *overlay_config_file = NULL;
> +    void *overlay_dtb = NULL;
> +    int rc;
> +    uint8_t op;
> +    int overlay_dtb_size = 0;
> +    const int overlay_add_op = 1;
> +    const int overlay_remove_op = 2;
> +
> +    if (argc < 2) {
> +        help("dt_overlay");
> +        return EXIT_FAILURE;
> +    }
> +
> +    overlay_ops = argv[1];
> +    overlay_config_file = argv[2];
> +
> +    if (strcmp(overlay_ops, "add") == 0)
> +        op = overlay_add_op;
> +    else if (strcmp(overlay_ops, "remove") == 0)
> +        op = overlay_remove_op;
> +    else {
> +        fprintf(stderr, "Invalid dt overlay operation\n");
> +        return EXIT_FAILURE;
> +    }
> +
> +    if (overlay_config_file) {
> +        rc = libxl_read_file_contents(ctx, overlay_config_file,
> +                                      &overlay_dtb, &overlay_dtb_size);
> +
> +        if (rc) {
> +            fprintf(stderr, "failed to read the overlay device tree file %s\n",
> +                    overlay_config_file);
> +            free(overlay_dtb);
> +            return ERROR_FAIL;
> +        }
> +    } else {
> +        fprintf(stderr, "overlay dtbo file not provided\n");
> +        return ERROR_FAIL;
> +    }
> +
> +    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);

Because of this being Arm-only (as validly pointed out by osstest), I expect
the entire function here as well as its entry in cmd_table[] want to be
Arm-specific, too? Of course it would be nice to not key this to __arm__ /
__aarch64__, but to something that would not need touching again if the
underlying infrastructure was made available to, say, RISC-V as well. But of
course - right now the goal needs to be to address the CI and osstest
breakage.

Jan

