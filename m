Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2427A6777E3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 10:55:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482705.748351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJtXS-00035l-IH; Mon, 23 Jan 2023 09:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482705.748351; Mon, 23 Jan 2023 09:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJtXS-00033P-FW; Mon, 23 Jan 2023 09:54:54 +0000
Received: by outflank-mailman (input) for mailman id 482705;
 Mon, 23 Jan 2023 09:54:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=StYb=5U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pJtXR-00033J-BP
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 09:54:53 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f91aef37-9b03-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 10:54:49 +0100 (CET)
Received: from BL0PR02CA0139.namprd02.prod.outlook.com (2603:10b6:208:35::44)
 by BY5PR12MB4147.namprd12.prod.outlook.com (2603:10b6:a03:205::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 09:54:44 +0000
Received: from BL02EPF0000EE3F.namprd05.prod.outlook.com
 (2603:10b6:208:35:cafe::a4) by BL0PR02CA0139.outlook.office365.com
 (2603:10b6:208:35::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Mon, 23 Jan 2023 09:54:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000EE3F.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.12 via Frontend Transport; Mon, 23 Jan 2023 09:54:44 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 03:54:44 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 01:54:43 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 23 Jan 2023 03:54:42 -0600
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
X-Inumbo-ID: f91aef37-9b03-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+Ix8zQCLQLg+3Jy/GU64tC+Ru0t1rOrbvdLCr1rMyfTo6zynRv8PBi76yNmoBfmMiNzavPIRHlnBrFSnlVGydJzPQ338u/ZzC9+4GHTkQcoYcgEGPmG5BI9RzigHdZS2Cv04VaBpyoqikJgp0YbWnQrFSB/VSQch8rupb5ffcvQfgKHKqu1XuJkhQn6Lgdf7OFbJmX1tKWwFY6DhMtiGvYyKiMme+7ujqudVi59Lr+iqqPPoYOggbBkbbXuLBS1LEc5QDzttmOiQGz1FPH1USaytsBIN9ufCxhO2HswpLXIC5fXwF7h7XrHFHjHuWaG5MbZhSGF5PDDdvJqu9+ieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+ChblAooxSW6QftgYEoMsg2d3B2eVain5PW+PHapxY=;
 b=T4Azov7srwkH3JnYzkBYz7OTSkrBDB8QJMcVttexiae8+8/0qaU6Or++0ioTfnia+FHF4d/W1Aunk9Jf8FMn3F382uTAzfn1DWg5IydLGG6BPmz39K7zcOs56F1sJ1r1zRebplucfogVR2647i/z549RlVaA8WBBdMKUVRylQZ58R82+/K2cH5ANKkj2LVUGPUKQwFUi8a6T0ulB1pMPUVzRhJylVLGtXIwUEqJOcmGC9OqsA4uZ/X06oik6GTz8jVESLU1E44kgTtnZaBRSrBwg/DmOkl1Fs2squP9LACnsPDEJ6F2iZfQLL4XXNKy6UDkOUpwz/X9DlH32PDflrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+ChblAooxSW6QftgYEoMsg2d3B2eVain5PW+PHapxY=;
 b=EH4LrsKgJecrvuYJa9YXqshbyIiCtoS8K8yJIt0ywfkBCwk5VOuG3oJKvNCVSGmeDVac975gDejb1FtJwLEbBKXKSD+vVLgpR+QYytyopvnOdX2++/Ib8EL3Ngh1qk8B0VByXR1QVbXxALBgHXto4lXenxE/iCG4Qzk9i6Ns9Rg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3949c194-114c-cd4f-3f7c-c57d423a7955@amd.com>
Date: Mon, 23 Jan 2023 10:54:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 07/16] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <Luca.Fancellu@arm.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221207061815.7404-1-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3F:EE_|BY5PR12MB4147:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf21649-dcf9-47ee-34bf-08dafd27dae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b9v5renwULcEJeoasmGHq4drFuEq1m9aiCl2YV6SoqP98p4qT1zMMv1VsnJ6uTX84ZnOY4qi0AS0idbAcF/d6aXyp1ETGvOG/08gAWXJqFeUNgLJkMEVC8RijhrFs4sNIFVD8LHv+xZlnr5oUdhqA9ccQjulwYLEL/pzgDeurI7KG5P9kMMGZRFPz8+oirSF5AxH99jWHitaeyBayOF5A20HyuSN+DiwG/yEB4ZWenWk/rTPuaDQVByPqcazVjgAOziI/0fZYrGikvuWt3bmU+9yAVLRYYMKjTVei5sCYN22q2WuBaZzOSPuLQJ1NBpJXCj8k53hx9e7aTfnR7ezEuy4wJOmMVi9YbF1om4qfIOzss4v8FW+/10P8oXKbWy58lfey45ZOgwC/HFI3xXFaLS5r3UwBQssKx5yEky8qznm1v2LjlFAGxghb67Kxdd9Y5bhMXzqEGiD9lS73KO3kbLdOERPnu7YNC4Gw49rSZ2vk/WfpOQbKRO0DX4ZPzcAwJMHN/yb2B1sULjXnWnLLh4LYfcxl+sATecc/R6dnvohj9HA0GziLKag7hjL3zNMttejhTRzWTgj+K8M/EE4YuhcswZvud6Cba+fcXwgrdebDVSuagVt7eqUTsWDlhBxBy4pEFNUzAMXlRRLG7T8sT/NxU+fV1zrK5OemGWGeT/nLNor/lkbIMY/7IvHhWRU82ESumFI/8noRaFjylshTlxyDkwKkkJ6pPRjuMI54tY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39850400004)(346002)(376002)(451199015)(36840700001)(46966006)(36860700001)(83380400001)(31696002)(5660300002)(82740400003)(86362001)(81166007)(41300700001)(356005)(2906002)(44832011)(8936002)(82310400005)(4326008)(40480700001)(8676002)(186003)(53546011)(26005)(47076005)(426003)(336012)(316002)(16576012)(70206006)(54906003)(2616005)(70586007)(110136005)(31686004)(478600001)(36756003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 09:54:44.3752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf21649-dcf9-47ee-34bf-08dafd27dae3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4147

Hi Vikram,

On 07/12/2022 07:18, Vikram Garhwal wrote:
> 
> 
> Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_lock().
s/lock/locked/

> 
> Moving spin_lock to caller was done to prevent the concurrent access to
> iommu_dt_device_is_assigned while doing add/remove/assign/deassign.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/drivers/passthrough/device_tree.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 1c32d7b50c..bb4cf7784d 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -83,16 +83,15 @@ fail:
>      return rc;
>  }
> 
> -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
> +static bool_t
> +    iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
This should not be indented
>  {
>      bool_t assigned = 0;
> 
>      if ( !dt_device_is_protected(dev) )
>          return 0;
> 
> -    spin_lock(&dtdevs_lock);
>      assigned = !list_empty(&dev->domain_list);
> -    spin_unlock(&dtdevs_lock);
> 
>      return assigned;
>  }
> @@ -213,27 +212,43 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>          if ( (d && d->is_dying) || domctl->u.assign_device.flags )
>              break;
> 
> +        spin_lock(&dtdevs_lock);
> +
>          ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
>                                      domctl->u.assign_device.u.dt.size,
>                                      &dev);
>          if ( ret )
> +        {
> +            spin_unlock(&dtdevs_lock);
> +
I think removing a blank line here and in other places would look better.

~Michal

