Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD08C72BCF
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 09:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166549.1493057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLznt-0000OT-GM; Thu, 20 Nov 2025 08:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166549.1493057; Thu, 20 Nov 2025 08:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLznt-0000N2-Dh; Thu, 20 Nov 2025 08:14:09 +0000
Received: by outflank-mailman (input) for mailman id 1166549;
 Thu, 20 Nov 2025 08:11:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K14s=54=amd.com=Luc.Michel@srs-se1.protection.inumbo.net>)
 id 1vLzl3-0008Ed-CO
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 08:11:13 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78a2cdde-c5e8-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 09:11:10 +0100 (CET)
Received: from BLAPR03CA0077.namprd03.prod.outlook.com (2603:10b6:208:329::22)
 by DS7PR12MB5742.namprd12.prod.outlook.com (2603:10b6:8:71::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:11:03 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::1) by BLAPR03CA0077.outlook.office365.com
 (2603:10b6:208:329::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 08:11:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 08:11:03 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 00:11:03 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 00:11:03 -0800
Received: from XFR-LUMICHEL-L2.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17 via Frontend
 Transport; Thu, 20 Nov 2025 00:10:58 -0800
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
X-Inumbo-ID: 78a2cdde-c5e8-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0ernmHbpR0++IS1oDj3A8sXKmbhoFT687NP/vujCdre/DT233TceIZare4UTrNq6W4do+OZB6ILMjf3PZ17vhXSJMS4RBBN3cmsotZapSxMWG0lheV+UhkzRMESJ9XT68lJMTc9nfTTMgsryYXbygvPeRZknU3kiq2UPdCbNi1D5MIWpzTz7nrV3k7iRCLudfpnk6hNUhVMT/Xhmpm+AeK78Iw5BwyMdWQvHJ/m6EWk3X1vgqspz8jGI+KtbKWWWJkMdyYx1m4JSbkAaKp/mh4M6/wil5QgwQIZtE07ONgy44ujABe4OGnNdAj+vLaFSbvuBW/rN3bhziBJ3XDsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARoXeX8gsb6s7/rH9G4XD4nZ+xh3tI27WjqRUo6FL0Q=;
 b=qyh8h454a2sY3sbTiD4B/Wh2TOiXO9LVMVNq7LGegQ9qitCmut8M4twkHcr7vXrbF2vYYpGwi6bWwGPolnI7UZrxz9rqLY758dz4CExk4cligJElPU4t02j1Yogm+rQBBj6Gux0wuKNXE6bK2iaqWB4TL/H38DAWePVtJtGFG9VvEqf2ikwzbRMCsLILMtxfeSgb7Sqfqb9s2IW3+MdxjhOLNDB/UIZfnqsJQig0f/iag223sa261cIFHmJROtMYDrOYhUe6PAAarKpCo2qDtcSoKeaQkYvebJMYHybzOfPbQ26CPrwMPr2LSq+7XH4hPKPncKZZWJDORDlzvG53VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARoXeX8gsb6s7/rH9G4XD4nZ+xh3tI27WjqRUo6FL0Q=;
 b=cDeoe6b7MZeJ2vlIEw469sl5erO6LS8D5RtfdEPjh/ZtqK3q3382EhECuxNKbmRGMpDpy+kSIG3/pW6vg3AMX6475oqynixuZgx7xXxWZ4pq8PF51PApih/nUe9TMTVQZ0tPdZjy9Ywd8x2qxMo2iYANSko3om83oGgWyemLYk8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Date: Thu, 20 Nov 2025 09:10:56 +0100
From: Luc Michel <luc.michel@amd.com>
To: Markus Armbruster <armbru@redhat.com>
CC: <qemu-devel@nongnu.org>, <kwolf@redhat.com>, <hreitz@redhat.com>,
	<mst@redhat.com>, <imammedo@redhat.com>, <anisinha@redhat.com>,
	<gengdongjiu1@gmail.com>, <peter.maydell@linaro.org>,
	<alistair@alistair23.me>, <edgar.iglesias@gmail.com>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <palmer@dabbelt.com>, <liwei1518@gmail.com>,
	<dbarboza@ventanamicro.com>, <zhiwei_liu@linux.alibaba.com>,
	<sstabellini@kernel.org>, <anthony@xenproject.org>, <paul@xen.org>,
	<berrange@redhat.com>, <peterx@redhat.com>, <farosas@suse.de>,
	<eblake@redhat.com>, <vsementsov@yandex-team.ru>, <eduardo@habkost.net>,
	<marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
	<zhao1.liu@intel.com>, <qemu-block@nongnu.org>, <qemu-arm@nongnu.org>,
	<qemu-ppc@nongnu.org>, <qemu-riscv@nongnu.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/5] hw/nvram/xlnx-bbram: More idiomatic and simpler
 error reporting
Message-ID: <aR7NEB_hRiBRZ6vN@XFR-LUMICHEL-L2.amd.com>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-3-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251119130855.105479-3-armbru@redhat.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|DS7PR12MB5742:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c54ceaa-b355-4920-6d02-08de280c596e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3QT2PaI+IpKNrBbRATmK3YqKY9wivNn/d2S4hqUF99ymRxJnK7+IUSxHlBzW?=
 =?us-ascii?Q?sbJgw/huJd8xMOu7a0XaMKFG0s9022cqNOOekI31YOBByVLdTEPUKhLjXC3M?=
 =?us-ascii?Q?as1q7oQIKVewohpOL1uHAgz/tB/W34D6a0ZOSjIM96NPlLWaSNeIfiAW833N?=
 =?us-ascii?Q?PUhKNsbwTWJNleppvC8tJuFC/mFnaxuKJvd/q2TS7HItmhqy3gqg2YSyxuNh?=
 =?us-ascii?Q?3zkrPdMKikeo3iJezB5a2Tz5RL85OIHVOMNYYg7ougQOq8WbJsq2s7lgaPeB?=
 =?us-ascii?Q?zcfLy9U/Nlg4ylwcqaxVYjJrAnZ/mbrswFg2iC1J5ad6ig1BkU7vthtAh/aj?=
 =?us-ascii?Q?OZoVRXwQ2XBPd3l43LweUz6LFH/p+cvkfGKjZYGvYvJIL/Ees0ZDrGa6VkW3?=
 =?us-ascii?Q?0DYjXe9Pm3foeV7lXylC70HdQuskl/AhYMPPfRWxdi94ViBbEZ4XLkHunPVt?=
 =?us-ascii?Q?BlLzdjAvbsxoZFyZ4hRrniCYVvJS4EI9Al8dnxtUDBihF0VsOMkSsS9hTF2e?=
 =?us-ascii?Q?BcVjXfRerO4IrA2xwwPTs7JfVKoKRa1OVFRCTR/Kkqv0wrKchX4VNSkoyGhU?=
 =?us-ascii?Q?DekIataSv7mweZSeLQ7AefEu/8FYEHJ7cevsF/WRZ/oPLF+cSG2fkVngirpi?=
 =?us-ascii?Q?MR30aoVVPEnv/6HYlVaYUPcgMZMZ1oI9HkpjM3cN+Qo21O/oTD4+1ApVO3rA?=
 =?us-ascii?Q?O4xyk4ZDOlZ/a/3OvbvFq1xGH2HB0bic4hIHaJ/KnjF0hYTudJmP/Zn7co0L?=
 =?us-ascii?Q?M0TNg3yZhuPcmoSx+5Pi3UqTKsVME2EAWzAOjDaWSH/IXRnqa8kB7Ei+mjHn?=
 =?us-ascii?Q?3hK4fvhm6moxvGGAqZvtKK6HGQ6MukrnqX4vK/XXVYnrCbBJSXRehK1zWCZp?=
 =?us-ascii?Q?D1A4/IaGEbG16l0aow3k4pCnk+hyuCIdrdjmWcpJihLpjGXaY606anehC6cv?=
 =?us-ascii?Q?Dq8Zhzqwq3CA9b8ooZoC29shIJpJJkEvCL5o6y50CS29E0T89SjcaRqaLXue?=
 =?us-ascii?Q?I4LVNMEFMBpnkcDmTM4c37KselgIjtfZhvKNQpuVd9RO5+3+G6777JePGsjW?=
 =?us-ascii?Q?L6fRa0XZGfOV2OwCz0ry5nZu2aTv8xMPQZEHVK/LZXLJgJSqdiHNcHEi9u3y?=
 =?us-ascii?Q?jh2E6ag8IGkIsVtIcMmwTfxCcEce7lFphgMdUHDiR119z71/QBax2x2xLgss?=
 =?us-ascii?Q?SV+KjX2gdtFlYChfPxFNVy2QxjDli4z54xC9MWwBMBYmKQclquVr+xpZ2RBk?=
 =?us-ascii?Q?JCvQJ4uRdAVs7ctwZr6384Hze/ZLZpEUAeAicpJD13yVP4l8RY1+7k+SIw3O?=
 =?us-ascii?Q?0skRv4W2nY8JrRbdIy5pbm12nfArOpTw9LQXawz3fEJd3l5+dedy9ckYW5S1?=
 =?us-ascii?Q?QurSDiGQYI+vedyO+Rku9g+pGzId/C9yflAN28AQZL7s9qz6UA3yAlGxXU+W?=
 =?us-ascii?Q?SjBxIEP0Tt5Ei4Nx5NDO2D0y0xCiOv9s5tJsrL9ikwPeLv9PlBR2MRRamUj5?=
 =?us-ascii?Q?5LsB2HyR9hLJb4XKoet9+asEysAust3i7CJG1TwWWHAZA/xX2sZHug2HuWoL?=
 =?us-ascii?Q?lBSjY06FsUBx6dsdVyo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:11:03.7875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c54ceaa-b355-4920-6d02-08de280c596e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5742

On 14:08 Wed 19 Nov     , Markus Armbruster wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> bbram_bdrv_error() interpolates a "detail" string into a template with
> error_setg_errno(), then reports the result with error_report().
> Produces error messages with an unwanted '.':
> 
>     BLK-NAME: BBRAM backstore DETAIL failed.: STERROR
> 
> Replace both calls of bbram_bdrv_error() by straightforward
> error_report(), and drop the function.  This is less code, easier to
> read, and the error message is more greppable.
> 
> Also delete the unwanted '.'.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Luc Michel <luc.michel@amd.com>

> ---
>  hw/nvram/xlnx-bbram.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/nvram/xlnx-bbram.c b/hw/nvram/xlnx-bbram.c
> index 22aefbc240..fe289bad9d 100644
> --- a/hw/nvram/xlnx-bbram.c
> +++ b/hw/nvram/xlnx-bbram.c
> @@ -88,18 +88,6 @@ static bool bbram_pgm_enabled(XlnxBBRam *s)
>      return ARRAY_FIELD_EX32(s->regs, BBRAM_STATUS, PGM_MODE) != 0;
>  }
> 
> -static void bbram_bdrv_error(XlnxBBRam *s, int rc, gchar *detail)
> -{
> -    Error *errp = NULL;
> -
> -    error_setg_errno(&errp, -rc, "%s: BBRAM backstore %s failed.",
> -                     blk_name(s->blk), detail);
> -    error_report("%s", error_get_pretty(errp));
> -    error_free(errp);
> -
> -    g_free(detail);
> -}
> -
>  static void bbram_bdrv_read(XlnxBBRam *s, Error **errp)
>  {
>      uint32_t *ram = &s->regs[R_BBRAM_0];
> @@ -162,7 +150,8 @@ static void bbram_bdrv_sync(XlnxBBRam *s, uint64_t hwaddr)
>      offset = hwaddr - A_BBRAM_0;
>      rc = blk_pwrite(s->blk, offset, 4, &le32, 0);
>      if (rc < 0) {
> -        bbram_bdrv_error(s, rc, g_strdup_printf("write to offset %u", offset));
> +        error_report("%s: BBRAM backstore write to offset %u failed: %s",
> +                     blk_name(s->blk), offset, strerror(-rc));
>      }
>  }
> 
> @@ -178,7 +167,8 @@ static void bbram_bdrv_zero(XlnxBBRam *s)
> 
>      rc = blk_make_zero(s->blk, 0);
>      if (rc < 0) {
> -        bbram_bdrv_error(s, rc, g_strdup("zeroizing"));
> +        error_report("%s: BBRAM backstore zeroizing failed: %s",
> +                     blk_name(s->blk), strerror(-rc));
>      }
> 
>      /* Restore bbram8 if it is non-zero */
> --
> 2.49.0
> 
> 

-- 

