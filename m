Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E53B673463
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 10:28:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480893.745504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIRDI-0001f4-Qp; Thu, 19 Jan 2023 09:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480893.745504; Thu, 19 Jan 2023 09:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIRDI-0001dH-NE; Thu, 19 Jan 2023 09:28:04 +0000
Received: by outflank-mailman (input) for mailman id 480893;
 Thu, 19 Jan 2023 09:28:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txcP=5Q=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pIRDH-0001d9-FP
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 09:28:03 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 904c3e3e-97db-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 10:28:00 +0100 (CET)
Received: from DM6PR03CA0063.namprd03.prod.outlook.com (2603:10b6:5:100::40)
 by CH2PR12MB4119.namprd12.prod.outlook.com (2603:10b6:610:aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 09:27:57 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::f8) by DM6PR03CA0063.outlook.office365.com
 (2603:10b6:5:100::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25 via Frontend
 Transport; Thu, 19 Jan 2023 09:27:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Thu, 19 Jan 2023 09:27:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 19 Jan
 2023 03:27:56 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 19 Jan
 2023 03:27:55 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 19 Jan 2023 03:27:54 -0600
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
X-Inumbo-ID: 904c3e3e-97db-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVBoMkrZlz/3MZKQqJRgUwUGhsoqcc70/KMhVCSNUfdVMY+4Wlue+NDs76RVF/sIxp6NQlDNrEQ7FCh+uc2MPjcOylesx8upTW42nN5jlB7NMGjYOB/ZpvkVjQmgwbU9c7wPGfCar6h/hE5t86GjQTfD4Qqn+Z59+1muOuxo5tZnhS8R5ymsWwtaiFCpVofucr0GMEYFMWd8pzVzRyJcWx6qIUoCFe3G1vSsYFcJM6lTzJ3rjKdHaJQQzVB6PNmv6f+udmbd6CsDd+swc0YlB3d3U6Z6zj3YDBACO9OX8/hlbmxeAbeWDy4jkmRYohcn+gLvMmfmNP3zJpky/7g2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRiEJW+Q33zIMSjk/w1ZwflVlBlqkiDI6uJKdOQlZ+M=;
 b=QmLYAzccf+AnSsSMZBKrPuBQovkvzANIIhJXcz/wRhSIKLszKu7NmoHP1FrkfTv1NVBGrAF11HTt1D73SQirvCveTZt5UB71OGbEIFTEGs0NCknvfsbu+XxOTPXzFiGjbkGY2cmhaDbIZrfo7OQehCscRWSFP0yWLAl4NnHnBVb1Rh5cXESfm5tnUKfrcEjwYE798PbHk8pCOTil10uY/JSUbXusYCAbmz/3vHOrn2BAZjGAjW+oGXQjyuyZNY0Axfd36wIxnwB7oR+QzHJymAU5nsLYi1LHkBBIlkOLp+fNtuyKc2VzO3nv9M/mrtOQhyrZYCVd64Rc3jV7JEmZ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRiEJW+Q33zIMSjk/w1ZwflVlBlqkiDI6uJKdOQlZ+M=;
 b=UcXBOGBGKtTCC64xuWhxepXS3TGBKkycb8CZ1BAjZRbIKvAmKCMSwbyTv2Cllz3jE19zS62fN/yulnKZX8Xrk+lru5e8liFjBedVTUFiOGuOhE65J+PQrvo+wTUXgU6d/5E1YHxn+W4sKpxwsUIm4V1rJeTgwgQIBoR1Qzm7JAI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bb7ca965-c9f4-445f-dfe9-d96d0b3d8707@amd.com>
Date: Thu, 19 Jan 2023 10:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN v5] xen/arm: Probe the load/entry point address of an uImage
 correctly
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
References: <20230113122423.22902-1-ayan.kumar.halder@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230113122423.22902-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT058:EE_|CH2PR12MB4119:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c36781-51bd-41bf-04e1-08daf9ff72fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N6GahyZApYjk2EWApdFLq5dMGPVcstU/4cqPFCUItYUz49rd4xf99Q75GyjTbjPxKpMO2WeEGL0FCV+JC1y4Tq5X+IVpWuGv/x/f5ONOTERAn4ueS9BvB0y8TR0CSWEodtZQEXeeKK/vMbcWCjOq1ZXQ5h9Nac0JimLP4eCYd0RGLwQxeh4ZehzyfuoqBgJQanPjsQJ45am+XKN6VBlTXsdb5s4sBJe5WGyMTO3bUZbHTXH/xDTlvxND5IC5YIncwIVW+2/nNuWmSNSSzGDI2V7q4TDmu76AuC09zu6CCRfPx5OuqBQ/TKNpDdohf5bOqpdXqHeyNfW9mB4jWaKYygxuWbtcitUqRUZx5pYHnRxT/1LTQg4x3UrkCiwcoKRIk/chHjGYGAhh/kgKKEOzz1DaNkdBbUI+fw9pcJEneBMoWC87gCDBDHD1MDIVs+KdEhnVVQ7uj8eIjJl/LI7EIoxjLvMfKzdJmxkowUeDyVycXOPuJJkF8EArp7jdbdm9RsPh3tJwXLdtaCEvtlF13mC30ls8/FkZw90cfhIz4fvxD9ed20IlyfjxJOaEwtvTyvge5Iq5Uvjlu7ZMRNwdock96pwh/3ZtuDcKtqkXVmDpYk2l24hJSUhWdvgW+PFDR8LvXtm1SQVRMbIb+3meiXLoHvaNSkS5/gAoSvkvYnGO4Xw2NLV0G+be7BtGrnIexH8C3JFNZqcoLmHcVUn/Y7/KQIAG7NO4mEDCwS0HtGIULCxrd4H5j88aBg0ZsM9ccEE5I61/LBKCUnH2ORhvBsSgGKNolaH6yrGYqHQMo/c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(36756003)(31686004)(356005)(86362001)(82740400003)(44832011)(2906002)(70206006)(8936002)(5660300002)(70586007)(36860700001)(81166007)(31696002)(16576012)(316002)(426003)(54906003)(110136005)(47076005)(53546011)(478600001)(82310400005)(40480700001)(8676002)(4326008)(41300700001)(186003)(26005)(40460700003)(336012)(2616005)(21314003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 09:27:56.6660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c36781-51bd-41bf-04e1-08daf9ff72fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4119

Hello all,

On 13/01/2023 13:24, Ayan Kumar Halder wrote:
> Currently, kernel_uimage_probe() does not read the load/entry point address
> set in the uImge header. Thus, info->zimage.start is 0 (default value). This
> causes, kernel_zimage_place() to treat the binary (contained within uImage)
> as position independent executable. Thus, it loads it at an incorrect
> address.
> 
> The correct approach would be to read "uimage.load" and set
> info->zimage.start. This will ensure that the binary is loaded at the
> correct address. Also, read "uimage.ep" and set info->entry (ie kernel entry
> address).
> 
> If user provides load address (ie "uimage.load") as 0x0, then the image is
> treated as position independent executable. Xen can load such an image at
> any address it considers appropriate. A position independent executable
> cannot have a fixed entry point address.
> 
> This behavior is applicable for both arm32 and arm64 platforms.
> 
> Earlier for arm32 and arm64 platforms, Xen was ignoring the load and entry
> point address set in the uImage header. With this commit, Xen will use them.
> This makes the behavior of Xen consistent with uboot for uimage headers.
> 
> Users who want to use Xen with statically partitioned domains, can provide
> non zero load address and entry address for the dom0/domU kernel. It is
> required that the load and entry address provided must be within the memory
> region allocated by Xen.
> 
> A deviation from uboot behaviour is that we consider load address == 0x0,
> to denote that the image supports position independent execution. This
> is to make the behavior consistent across uImage and zImage.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

When looking at this patch, I spotted one incorrect Xen behavior related to supporting uImage kernels.
And if we want to document that we support such kernels, we should take a look at it.

Xen supports gzip compressed kernels and it tries to decompress them before kernel_XXX_probe.
For zImage and Image, their respective headers are built into the kernel itself and then such image is compressed.
This results in a gzip header appearing right at the top of the image and the workflow works smoothly.

However, uImage header is something that is always added as a last step in the image preparation using mkimage utility
and always appears right at the top of the image. That is why uImage header has a field "ih_comp" used to inform about the compression type.
So the uImage gzip compressed image will have the uImage header before gzip header. Because Xen tries to decompress the image
before probing its header, this will not work for uImage.

~Michal



