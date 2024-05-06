Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE9A8BC712
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 07:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717200.1119199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3r5b-0001Ok-WB; Mon, 06 May 2024 05:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717200.1119199; Mon, 06 May 2024 05:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3r5b-0001My-TM; Mon, 06 May 2024 05:40:39 +0000
Received: by outflank-mailman (input) for mailman id 717200;
 Mon, 06 May 2024 05:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pn4q=MJ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s3r5a-0001Mo-Km
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 05:40:38 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28aba8bb-0b6b-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 07:40:35 +0200 (CEST)
Received: from CH2PR08CA0018.namprd08.prod.outlook.com (2603:10b6:610:5a::28)
 by MW5PR12MB5624.namprd12.prod.outlook.com (2603:10b6:303:19d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 05:40:33 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::14) by CH2PR08CA0018.outlook.office365.com
 (2603:10b6:610:5a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Mon, 6 May 2024 05:40:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 05:40:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 00:40:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 00:40:31 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 6 May 2024 00:40:30 -0500
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
X-Inumbo-ID: 28aba8bb-0b6b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gsnzpv6mISkJsjG+3p1PfzE9rZJZ7bcbVlEhIu86IR/4KmnECRMWyLIRxBH9pli9b3H2Wz/Wpe8jcGCLHNfjJXpr2oWj91MJLMqlD9TwZbXsARRfIlqI1KYcAToetZxT0mDYPSJ8MAy6XM57I7TSNFTN3l6nkPVo1tFice33nrhoXdnmSz3dLAt8VrJTxoLsxRwNHMXAxR5tqL1coKECbkuILGZkCLXXFIYYt8i/zycZjKUJfAmGIBHlPNxa10/ghvweN3c+Y3qVwdJW9vVA6HKfVCrYcD21PNd8BvlNJWWpEcMWVXcCRY+To53mpnD+pYAmariogvs0yTvfuo1FdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cuqj2S6r6M1ACM+fj5csnjKIRemFWACC7B5ROJ6ZRqs=;
 b=kDMQlwB58+buozohYfN+BzBiolBNs2f7r9+rucTHi+6JW8DBxpV0yk68320Rqy63c55UarZgdVTbg9LMAHB6PAwd4+DZQ4lQofxQ+9qH+vwQXQjyVdynh6fM1brLJU+Yum7cJnoeQwCr9Kwvw/OFHlyOCmcezVb2+GhogrNA/J4udh53j8xR/BFjOQ/eMHflxGrpipoQXua7CUJlvkMLBnbNIYkxx8LN0Wm/4/5vuxPo5VjunGWvu2ThTor+rAPMm0bcH7vL84G10FGvcQvBuoUCOWSOYIB+42dPRg9C42wfI3FggvWYlwProlEh10n0bpWqdiVeNWxd02BPfJRrxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cloud.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cuqj2S6r6M1ACM+fj5csnjKIRemFWACC7B5ROJ6ZRqs=;
 b=Zd6pGSpVqJD5pbZkikJ7dfBp6Ri7SaREvU5GRwPgWcNJxCSrILl4DbGZLNtWjUDBDAUgqMGuH+NQVk7D1KGu0IVY3C/cYmYOEvjERCrKhNVXXeGF4KSkXJBcsUP+xPB8xoJh6hHl1bcqIYM1dQdn2bTbCRMQW2O/ESLoevfqP0w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <fd98b8b8-70f5-43dd-8edd-a78b47b31431@amd.com>
Date: Mon, 6 May 2024 13:40:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] tools/libs/light: Modify dtbo to domU linux dtbo
 format
To: Anthony PERARD <anthony.perard@cloud.com>
CC: <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-10-xin.wang2@amd.com>
 <2c5baf13-7511-4035-91da-02754a2f28c0@perard>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <2c5baf13-7511-4035-91da-02754a2f28c0@perard>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|MW5PR12MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 26aba952-cd4c-4caa-2390-08dc6d8f0bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHNpc1dJdlFmTVk3dEVrbkRFSUNOVG5OZmFwOFlTU1JFWkRFRmlXbXQ0cmNk?=
 =?utf-8?B?V01rN0l6QzdDYmtxbHJsakN6ZW9OT2UyTEFRNTRQOWhqbEllZEpyY3FtYmlw?=
 =?utf-8?B?WWRZVnVvSWhTOUxLKzNuMXRqZVFmSlZRdlhPbHlRdWZqQU1ESG5QMENHcEtT?=
 =?utf-8?B?ZzgwZHBoQjd0MTdhemNZVytCTnVBeXB5ZTZkN3BmR01zdHJqMFlWamVvSWM1?=
 =?utf-8?B?NUJUTDN3SVovRGlrSGFpWFJsMzcxZGVYdFNhUmRHRldyOG0zb2pKSEdCQ3ND?=
 =?utf-8?B?YVVrQUZVSmUvMlNlUnBkNkQvRW9TKytZaElEQ3R3aE90ZmI4b1BnMUN0cTJS?=
 =?utf-8?B?TUdRK2tHMzcrd3dmN2lQOEVVMkhsYzRXaVlJZnN1cGp2QWVCczkvSFhJVXcy?=
 =?utf-8?B?M0xvd05GNHdMblowbzFhaU5FeVMrUmZiQzlJcmtxaFJOUzcxUkdxd1lLQnlu?=
 =?utf-8?B?cG53QXBBZytPT1BiWnZzM1hwMTd3NVZEanZPbmZnMWIrbkhKazBGUklFRFhY?=
 =?utf-8?B?N1NLbkpnL21yV25hMGVjUy9MS09tc2d4R29hY3VPLzdZdWlPdVhpdmpIN1Z1?=
 =?utf-8?B?dFJFNW5VZWtqZ2xEWG03dVgxRU56YlNoaCt0ZklvZlBBejF5OEpaT1FTdjB0?=
 =?utf-8?B?Si9zdVhTUGNiaDRkTk42YnEyMWN3S0ZoZFF0K0Evb0NvSGRKejdZanRMT00w?=
 =?utf-8?B?c3lVTzVRVEo4Z1lFZXN4eVEwem84ZGI3VHEwcDR1T0d3Vmt2TGdyLzgrVXV6?=
 =?utf-8?B?cjFvTDQyTGUyTmhPbWlUdllrU1hmYU1GYjVPMmRVMnJBWnNwNG95L0dpcmNq?=
 =?utf-8?B?T0h6TitpZmNSd2xyR1QzR0NRNVB5dnIrVFlEdDN3c2tNNG9LNEdHMndhcWRN?=
 =?utf-8?B?a0ZBcWZpZExhTVZ1WW9KVVV2NGxjRlN2djgwbmJQMUlrRUY3Q2p2RXZuQUR3?=
 =?utf-8?B?YnYzTFZBVnViOU9Fa2dqdHpvc1pVd2o5TEFoamFqeTJTTkJuRTdRK01qNWJE?=
 =?utf-8?B?ek9uM2pwTkFETVgxWTFSMjRyR0JEcnExSWZQUS9lSDRSSVRuNUNReUVqN0tG?=
 =?utf-8?B?bXphS1FDN1MyT0oxcTliUmhvSmNhMjFoSVgvMDZnMkRrdndvT2NlNHNLSVVX?=
 =?utf-8?B?Um1KNXBmWW13bWxwbE14QWpIMEJNck0wa2hPaFMwczZsMWl3b1pCTnh5WmFI?=
 =?utf-8?B?Z3JOQnprenBkSkNLbTdmbXd1ZVBvS252WllOSE9JSm5GdjBlQmgrN3hod1Vp?=
 =?utf-8?B?VCtMbVRXeGUvVTZJUUd4aVhadlFQa0lOZytQdC9CS2ZoMjdUL3hKUWd2TTZa?=
 =?utf-8?B?NklQdXNlVzF6Ni9wT1RsWEc1dGtkTU5KSnpoc0pDOEo5cWVkZWZzWUdWVUU3?=
 =?utf-8?B?MkRxZjEzSy9ad1JuTW5rQlRxV2hNQ3I0Mm1QdnVubDV6bHZEMG1lOVpUUyts?=
 =?utf-8?B?ZG85VU5JL1hCL0hwdHVhZDBFajlaVzQ2UzlpTEVtRkNFVFhpZU1xeGk3MlFm?=
 =?utf-8?B?dG5zR1FWT21RSTh5emZVbGJoRm1KUEo5RVFjWVlHWlFnUHJBR29KZkVVbDIz?=
 =?utf-8?B?czFENXNtNXNQbXZMZ3gvNnlrVGx3U3E5VW5kazFFMU4vdzNnNlN3U3J6ODBI?=
 =?utf-8?B?Wlp4enpMb2N2dHBrRE9mbjBIZEV0ZHpLOEF6aTNtdWk4RndHcmZjRWp0VXRE?=
 =?utf-8?B?eWJZUGcwUnVJa0poelQ4YnAxMi9wU0wvc0MxVWdDYmg0V1NldXZIUndiRUta?=
 =?utf-8?B?azQ2K25UUnFDTGNnakF5ZGYyNzZ3eUpqM0N2U3ZUMHVFbW1NQVNPSUFMeEJC?=
 =?utf-8?Q?j06p66vJAqEzckJtX0ZdfbnDRJZkjHBrtSON8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 05:40:32.0234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26aba952-cd4c-4caa-2390-08dc6d8f0bc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5624

Hi Anthony,

On 5/1/2024 11:09 PM, Anthony PERARD wrote:
> On Wed, Apr 24, 2024 at 11:34:43AM +0800, Henry Wang wrote:
>> diff --git a/tools/libs/light/libxl_dt_overlay.c b/tools/libs/light/libxl_dt_overlay.c
>> index cdb62b28cf..eaf11a0f9c 100644
>> --- a/tools/libs/light/libxl_dt_overlay.c
>> +++ b/tools/libs/light/libxl_dt_overlay.c
>> @@ -41,6 +42,69 @@ static int check_overlay_fdt(libxl__gc *gc, void *fdt, size_t size)
>>       return 0;
>>   }
>>   
>> +static int modify_overlay_for_domU(libxl__gc *gc, void *overlay_dt_domU,
>> +                                   size_t size)
>> +{
>> +    int rc = 0;
>> +    int virtual_interrupt_parent = GUEST_PHANDLE_GIC;
>> +    const struct fdt_property *fdt_prop_node = NULL;
>> +    int overlay;
>> +    int prop_len = 0;
>> +    int subnode = 0;
>> +    int fragment;
>> +    const char *prop_name;
>> +    const char *target_path = "/";
>> +
>> +    fdt_for_each_subnode(fragment, overlay_dt_domU, 0) {
>> +        prop_name = fdt_getprop(overlay_dt_domU, fragment, "target-path",
>> +                                &prop_len);
>> +        if (prop_name == NULL) {
>> +            LOG(ERROR, "target-path property not found\n");
> LOG* macros already takes care of adding \n, no need to add an extra
> one.

Sure, I will remove the "\n".

>
>> +            rc = ERROR_FAIL;
>> +            goto err;
>> +        }
>> +
>> +        /* Change target path for domU dtb. */
>> +        rc = fdt_setprop_string(overlay_dt_domU, fragment, "target-path",
> fdt_setprop_string() isn't a libxl function, store the return value in a
> variable named `r` instead.'

Thanks for spotting this. Will change it to `r`.

>> +                                target_path);
>> +        if (rc) {
>> +            LOG(ERROR, "Setting interrupt parent property failed for %s\n",
>> +                prop_name);
>> +            goto err;
>> +        }
>> +
>> +        overlay = fdt_subnode_offset(overlay_dt_domU, fragment, "__overlay__");
>> +
>> +        fdt_for_each_subnode(subnode, overlay_dt_domU, overlay)
>> +        {
>> +            const char *node_name = fdt_get_name(overlay_dt_domU, subnode,
>> +                                                 NULL);
>> +
>> +            fdt_prop_node = fdt_getprop(overlay_dt_domU, subnode,
>> +                                        "interrupt-parent", &prop_len);
>> +            if (fdt_prop_node == NULL) {
>> +                LOG(DETAIL, "%s property not found for %s. Skip to next node\n",
>> +                    "interrupt-parent", node_name);
> Why do you have "interrupt-parent" in a separate argument? Do you meant
> to do something like
>      const char *some_name = "interrupt-parent";
> and use that in the 4 different places that this string is used? (Using
> a variable mean that we (or the compiler) can make sure that they are
> all spelled correctly.

Great suggestion! I will do this way.

>> +                continue;
>> +            }
>> +
>> +            rc = fdt_setprop_inplace_u32(overlay_dt_domU, subnode,
>> +                                         "interrupt-parent",
>> +                                         virtual_interrupt_parent);
>> +            if (rc) {
>> +                LOG(ERROR, "Setting interrupt parent property failed for %s\n",
>> +                    "interrupt-parent");
>> +                goto err;
>> +            }
>> +        }
>> +    }
>> +
>> +return 0;
> Missed indentation.

Will correct it.

>> +
>> +err:
>> +    return rc;
> A few things, looks like `rc` is always going to be ERROR_FAIL here,
> unless you find an libxl_error code that better describe the error, so
> you could forgo the `rc` variable.
>
> Also, if you don't need to clean up anything in the function or have a
> generic error message, you could simply "return " instead of using the
> "goto" style.

Sure, I will simply use return because I don't really think there is 
anything to be cleaned up.

>> +}
>> +
>>   int libxl_dt_overlay(libxl_ctx *ctx, uint32_t domid, void *overlay_dt,
>>                        uint32_t overlay_dt_size, uint8_t overlay_op,
>>                        bool auto_mode, bool domain_mapping)
>> @@ -73,6 +137,15 @@ int libxl_dt_overlay(libxl_ctx *ctx, uint32_t domid, void *overlay_dt,
>>           rc = ERROR_FAIL;
>>       }
>>   
>> +    /*
>> +     * auto_mode doesn't apply to dom0 as dom0 can get the physical
>> +     * description of the hardware.
>> +     */
>> +    if (domid && auto_mode) {
>> +        if (overlay_op == LIBXL_DT_OVERLAY_ADD)
> Shouldn't libxl complain if the operation is different?

I will add corresponding error handling code here. Thanks!

Kind regards,
Henry

>> +            rc = modify_overlay_for_domU(gc, overlay_dt, overlay_dt_size);
>> +    }
>> +
>>   out:
>>       GC_FREE;
>>       return rc;
> Thanks,
>


