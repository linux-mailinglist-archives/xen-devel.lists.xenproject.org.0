Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F5B71FACD
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 09:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542961.847450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4yzb-00013v-GH; Fri, 02 Jun 2023 07:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542961.847450; Fri, 02 Jun 2023 07:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4yzb-000120-BL; Fri, 02 Jun 2023 07:14:35 +0000
Received: by outflank-mailman (input) for mailman id 542961;
 Fri, 02 Jun 2023 07:14:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3i=BW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q4yza-00011s-Or
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 07:14:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f52294b-0115-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 09:14:33 +0200 (CEST)
Received: from BN0PR10CA0006.namprd10.prod.outlook.com (2603:10b6:408:143::32)
 by DM4PR12MB5312.namprd12.prod.outlook.com (2603:10b6:5:39d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 07:14:30 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:143:cafe::25) by BN0PR10CA0006.outlook.office365.com
 (2603:10b6:408:143::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24 via Frontend
 Transport; Fri, 2 Jun 2023 07:14:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.23 via Frontend Transport; Fri, 2 Jun 2023 07:14:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 02:14:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 02:14:29 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 2 Jun 2023 02:14:28 -0500
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
X-Inumbo-ID: 1f52294b-0115-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YD7SRBTlCfUB7LicxWST+Z0tHtmZzsHxq7id8nzLrcPMk8kqel0N43dKlIaBU6WF8weL+NfBAyHK5Sb6NcbjqmUDnGlVBnrv+ZYXWKgpwXxlFvcF0ArGJpFqjtKZc98MHLmfx6/33f1nKX37Ym2MbNr4FK2u78T161xtV/ijqIGDo3JBcImnQ6BD2cDY5HmshFDr0HikTfsVes+MdwDEli/1n3Lgdep1PnM+V5SNpDBDXnkBVmy9PWniPi7pX2idwiocxnta5nIeKdyyFdso/40DQqwLUjlQNL0BYtM27N0L9IQxAu4XmUL10XXEpV402TQMuswtecxmyaCDvluA9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6jZ7rt2j6wcQAhRh4qz8ScSit6naE6QBba7jRqA9Ks=;
 b=KubQn5SsTGmK0JuP3PVuSclRRJoHyix6DZU9xgY6PbvdMaIavlyiMvzs2XEjyowUUmwjiPdEY5SnbTKpVDaUVdSMUynV8clRFjvq9xE/Ht0O5Wza57L/8VcZC3oUrxH6ZsYGE4KFUF0hyfAT9zEpYq5BKRUHMD8qs+wUmQTUX/4R6G85Vo39qW1e91nClcTDFqzUW6h5CBgkWAYTrpguvCr0Fj1RGqFPAAeLFPrHaw+NgxnJcYEysUd5iXG9qGnZ+UV5SM+mXw9Fzlg73q4iNZ5h8SMo+xnveD9whHsISmu1pfjql2MEx3/O8ttAUh6yKeknd+yILRZAz66q1byuvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6jZ7rt2j6wcQAhRh4qz8ScSit6naE6QBba7jRqA9Ks=;
 b=qdiTT+DZy4m9N3yzedqW6xTR23ZD9ZR9cb1TNsZ6jGlWgiopGPBoSVHycxTaIHiMGIl6H7GQzeVAOyR7clJxyPyU/MrDPrvplZDgDU3QzVTFN6Z5Kpq0t/yyywD/tCy63fFKNlzh1cGj186YD7cDCso6Fa5ibYq6GelRPazHmZw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <4a24e070-18d8-8f48-465a-10a0108a7cc2@amd.com>
Date: Fri, 2 Jun 2023 09:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v7 02/19] common/device_tree.c:
 unflatten_device_tree() propagate errors
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-3-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230602004824.20731-3-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|DM4PR12MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 914aaa51-5406-4380-be4c-08db633901d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qudIHFkJCQ2iV5pSrGdEHru14N4pUHVkzCMP6spBWqu6fO/iy/BFY7gpvdrSVo3q3JebbDIU+YpO5s+iXIlcAHQNMwT8//x3tiK2MUIrLicmWrOZh/jSIOcBrjcHiyY/epxSLlVfLOSTpqdMKNzSbEUs+B7WNxYaLZeTGs+IIqY5CVtcIVjajrzt2wvl6aiRPaYATlPwgHv7H8eq6JImukeyI8JnM0bJeZJUGgDSTbb7Tv6YskUA5eSplZw23sSwB0W02OQKVIYAb8rO+f/Xa9tGNd/YFfpJ7oFjybjUf4d3k23f3guSm68iyrOQg2Fj7MZ9AER0SpAlUlloPIpboYg5qxLBHpCuMGIk0F++z04IdhwnESIBopMmHZPnAHoOQUqd7LgYh5MpODxUIHd+CPEcxUSbH+PzoAztApj4NMXl5o61llMVtamaWG+f+KZuMC0L+nsnok+cA6CMvFDvOoorVaRbJ3rbb9rRhevOv0c0gvJSk194bw7Xfl6+NWOkxXsxbW4zL/OiXMpG2FcZ5KFljPLmN/td1NoOCYeZyvzR7VUUvIkPASuQpt1CZNinEv+cJs9iT76mtnla5MqfGaBONCjB+RRRWAHHIpUuq/o2fujhC9WVu0N6ausGBkABUX+ylJDgzsDuCn3UHvC3ZHa3WR+oWCfPQkTUuTJ4rgjJCofPBqiw07xuBabQVXuqHE0pxyIJGbhFRO6zBgCwAkq6gDq3Bmg57YDtfq3NtbqF98+PLRsM0hh9e51OEVbi/T6QstYfYipAl9aSWscukSuxjGkYShxm4c1NVU8z/aubJHzCRz/CJ3xL5aez/5JE
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(36860700001)(44832011)(26005)(41300700001)(40480700001)(36756003)(316002)(81166007)(82740400003)(356005)(110136005)(40460700003)(54906003)(16576012)(4326008)(426003)(336012)(2616005)(5660300002)(53546011)(86362001)(70206006)(31686004)(186003)(31696002)(70586007)(2906002)(83380400001)(8676002)(8936002)(47076005)(478600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 07:14:29.7921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 914aaa51-5406-4380-be4c-08db633901d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5312

Title: s/unflatten_device_tree/__unflatten_device_tree/ or you mean to propagate
errors from unflatten_dt_node?

On 02/06/2023 02:48, Vikram Garhwal wrote:
> This will be useful in dynamic node programming when new dt nodes are unflattend
> during runtime. Invalid device tree node related errors should be propagated
> back to the caller.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> ---
>  xen/common/device_tree.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index dfdb10e488..117ccccb09 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2108,6 +2108,9 @@ static int __init __unflatten_device_tree(const void *fdt,
>      /* First pass, scan for size */
>      start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
>      size = unflatten_dt_node(fdt, 0, &start, NULL, NULL, 0);
> +    if ( !size )
> +        return -EINVAL;
> +
>      size = (size | 3) + 1;
>  
>      dt_dprintk("  size is %#lx allocating...\n", size);
> @@ -2125,11 +2128,19 @@ static int __init __unflatten_device_tree(const void *fdt,
>      start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
>      unflatten_dt_node(fdt, mem, &start, NULL, &allnextp, 0);
>      if ( be32_to_cpup((__be32 *)start) != FDT_END )
> -        printk(XENLOG_WARNING "Weird tag at end of tree: %08x\n",
> +    {
> +        printk(XENLOG_ERR "Weird tag at end of tree: %08x\n",
>                    *((u32 *)start));
> +        return -EINVAL;
What about memory that we allocated? Shouldn't it be freed in case of these two errors?
For now it is called from boot so we do panic but later in this series this could result
in a memory leak. Am I correct?

> +    }
> +
>      if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeef )
> -        printk(XENLOG_WARNING "End of tree marker overwritten: %08x\n",
> +    {
> +        printk(XENLOG_ERR "End of tree marker overwritten: %08x\n",
>                    be32_to_cpu(((__be32 *)mem)[size / 4]));
> +        return -EINVAL;
> +    }
> +
>      *allnextp = NULL;
>  
>      dt_dprintk(" <- unflatten_device_tree()\n");

~Michal

