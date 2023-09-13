Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A8B79E0D6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 09:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600988.936867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKHy-0007LR-OJ; Wed, 13 Sep 2023 07:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600988.936867; Wed, 13 Sep 2023 07:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKHy-0007J8-LF; Wed, 13 Sep 2023 07:27:54 +0000
Received: by outflank-mailman (input) for mailman id 600988;
 Wed, 13 Sep 2023 07:27:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PyFF=E5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qgKHw-0007J1-JZ
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 07:27:52 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7eab::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b4d5047-5207-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 09:27:50 +0200 (CEST)
Received: from SN7PR04CA0036.namprd04.prod.outlook.com (2603:10b6:806:120::11)
 by BL3PR12MB9052.namprd12.prod.outlook.com (2603:10b6:208:3bb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Wed, 13 Sep
 2023 07:27:45 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:120:cafe::61) by SN7PR04CA0036.outlook.office365.com
 (2603:10b6:806:120::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19 via Frontend
 Transport; Wed, 13 Sep 2023 07:27:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Wed, 13 Sep 2023 07:27:44 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 02:27:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 00:27:35 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 13 Sep 2023 02:27:34 -0500
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
X-Inumbo-ID: 0b4d5047-5207-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIX6iKc6Qj4kzpziFzcsE8RDaOAmv7ZKAAb6pgaTtCLSzP/LyZvs+F3eygFST6kIPVnvb0QqdH1qVn35zvYgrVzb9G1CwjzCF3f9rRRq9ObwOzLZVYw0nsxYvCAO6eZ4uyZtSsN9Ky38zq+K/ioQJwqSIzSY9m+mmSPezDzccwzzZ7BBVNdkLkwFrkWPKE62Ok1Oje6k5rFysu363TYh+pKC30Lr5bSCXj5MCJMeQ3Odq9NoZaWZGHk+BYHdpCMJYd+kVG6KmObZ1LrlJupLwxasw+B5lCONc9L/Zt/KZggOuy/U7jydaHypMGLjg1g4JJXFnC4g9n9LRyHFoj4JGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5uJOSoVS/xon+Tz/yEuR9AFjMT+k3rKxF/c2hyQWPo=;
 b=aXZ9DOYN1JOJX98FzCIdErhrf17H16/xbu64/Te1VTipFOTLLRcM1HOx2zanQUfMOTlGevMt1zEEvyGvNmUjbXYTd5qVa+MQWu0PEjdSd77zVarYsQLFyrsW3Xw9Kou3plO5BM6KwrTu01nKBviMSAfWYJ9JmWS0nJrJBh/gf+j0XrD+tD7a8Ug5O+4+BrmZd3SRFa7aIXgfzgWgDFM4GPKNfJqd6heyYTtnBSb3La35SGJoAhQlR9OGCAjzqw3lGY2eNqIB4bv4FTKudLQ+JS4kd/yrCRTACsF1B23evoxXyCRm40FmImagJLQkUtvVEzKH973pPU2B8Q5A3YC/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5uJOSoVS/xon+Tz/yEuR9AFjMT+k3rKxF/c2hyQWPo=;
 b=aoJMXDQke5a501V7lQnHf7zLzaKxjadaFis0WN+7u5Fj9LlMIwcVx8K3CuIhcBrpItuawC3Dw/GpTYXrsuV224rGdKdkvVIneX+V12m7im3Rlz8vxSacYJVbDn2FgIQfdwnaIt24tofxVe9QUhgYXitnf2utY+bWievANeB7X5k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <98187155-3263-6197-ddb3-07cf9b883264@amd.com>
Date: Wed, 13 Sep 2023 09:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [ImageBuilder PATCH v2] uboot-script-gen: use size from arm64
 Image header
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
References: <20230912204345.7271-1-stewart.hildebrand@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230912204345.7271-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|BL3PR12MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b2ac93-126d-45bf-e4f9-08dbb42aec53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PtKeke3gi/C0r/Sq6JHGcfJ6r5iMeniv1oBnVpO4Ug2ISfTBhWpp194ushlPN21+vefyvddJac91Ee1NAJEW2DI9VsCviLeW9l2wkF/FX7aQ/XBRZQs27Uj3WItgxQCF0eZymqTUDOKYjZe3jma2itf7KaSmQbI7HPI0oCSx87hBj3fpoe8i4qQsy3Gx8t1qmEQy9P/Kstvx6VwXPHdtUodo++Ox/xYgMBTFFQguUT/pIrv6r6ygOI9cGPZX5Cj+mNls7tnBoUDpy62sRwvaG4yZMOdikuPhQA/raFsXODh3o7d5z6q63wKDkWmO86umYbUqmPZUKzfiFCfE5Nv+vpfhPj/fBKWAwNVCWa/xoTuLqgxAyTXG1vLp4bOaf6KtKZwMSc2QICrB3ikW9roScKN69o/aecgAhL7H28pwkO4NSFtc2vrdmYXToG4UaftYQB8aiS+PYETyiu8J9Yhp7cixOahSQXm0p7G9SEMc4mszLmCkSd+bRuLVrp0A0drM3TOSxzGLt1DLD+vekF3r+y2iu6rowUocJimq8lVlkb+HRKyq+fB+A8RIItc04fRm8F2Yjm5Jfcsv/7FUL9aY7T6TWfLo0tN0HxzGTYoLYekEWcY3HeRO8CC6qx3lr5w9fHpPZ0j4TRYPx0wk1tB/8T8unFosoEoOVYmfflvRrwcw+1PGPOcfflv2CLHtgYCJJaT5yYPx3Gm0hiATiwcrnobJ1MLvAZ9e86Mj31M6WExI4Zf1Nsp08dnyDx3wzESViVCYRklWV8unTXRO3o4FNQeVNETqnN5KN7fY8+B3rfE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(376002)(39860400002)(82310400011)(1800799009)(186009)(451199024)(40470700004)(36840700001)(46966006)(53546011)(83380400001)(478600001)(26005)(2906002)(426003)(336012)(16576012)(70206006)(44832011)(70586007)(4326008)(110136005)(41300700001)(2616005)(8936002)(8676002)(316002)(5660300002)(40460700003)(40480700001)(47076005)(36860700001)(86362001)(36756003)(81166007)(82740400003)(356005)(31696002)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 07:27:44.8979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b2ac93-126d-45bf-e4f9-08dbb42aec53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9052

Hi Stewart,

On 12/09/2023 22:43, Stewart Hildebrand wrote:
> There is a corner case where the filesizes of the xen and Linux kernel images
> are not sufficient. These binaries likely contain NOLOAD sections (e.g. bss),
> which are not accounted in the filesize.
> 
> Check for the presence of an arm64 kernel image header, and get the effective
> image size from the header. Use the effective image size for calculating the
> next load address and for populating the size in the /chosen/dom*/reg property.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
The patch works, thanks!
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

with one little suggestion...

> ---
> v1->v2:
> * add in-code comments
> * use variables more
> ---
>  scripts/uboot-script-gen | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 9656a458ac00..f0972d983017 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -2,7 +2,7 @@
>  
>  offset=$((2*1024*1024))
>  filesize=0
> -prog_req=(mkimage file fdtput mktemp awk)
> +prog_req=(mkimage file fdtput mktemp awk od)
>  
>  function cleanup_and_return_err()
>  {
> @@ -435,6 +435,21 @@ function add_size()
>  {
>      local filename=$1
>      local size=`stat -L --printf="%s" $filename`
> +    # Read arm64 header magic (https://www.kernel.org/doc/Documentation/arm64/booting.txt)
> +    local arm64_header_magic=$(od -j 56 -N 4 -t x4 ${filename} | head -n 1 | awk -F' ' '{ print $2 }')
can we simplify:
head -n 1 | awk -F' ' '{ print $2 }'
by just doing:
awk 'NR==1 {print $2}'

~Michal

