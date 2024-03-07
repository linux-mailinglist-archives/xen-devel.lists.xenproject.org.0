Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A838752C9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 16:11:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689944.1075477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riFP4-00028u-6m; Thu, 07 Mar 2024 15:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689944.1075477; Thu, 07 Mar 2024 15:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riFP4-00025k-3B; Thu, 07 Mar 2024 15:11:26 +0000
Received: by outflank-mailman (input) for mailman id 689944;
 Thu, 07 Mar 2024 15:11:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=inme=KN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1riFP2-00025e-Jm
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 15:11:24 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f497e1a0-dc94-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 16:11:22 +0100 (CET)
Received: from BL1PR13CA0352.namprd13.prod.outlook.com (2603:10b6:208:2c6::27)
 by SN7PR12MB6767.namprd12.prod.outlook.com (2603:10b6:806:269::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 15:11:17 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::9e) by BL1PR13CA0352.outlook.office365.com
 (2603:10b6:208:2c6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9 via Frontend
 Transport; Thu, 7 Mar 2024 15:11:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 15:11:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 09:11:16 -0600
Received: from [172.17.205.23] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 09:11:15 -0600
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
X-Inumbo-ID: f497e1a0-dc94-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ng+1ycah4IcZbdHOPuQ+4lOH71CN4jm2TuN7oaqnV96gQ86kmvZnUGFGsRuCy1BvLN4dhzAZUfi7PIzx77QqFIUOOPGb4B5NwOtNPD37YBL6ns1zsp6l80+XIsSTjkdM0s9HGHyRbW5sJSAyZd7W/d6so9i8S2f5FdVhp0Zxo1W5NpUC0+0TpKEbO3LtSP7UweJIF2ZVxrCyBMcXoikmVUHC/t/3jNYND3z6Zdel/3a0pQZaBbGXtO0E2JEPaajF3UmId4TEsly2cHAq6QSQdY3ISQ0tIPu9rOx0eeZ74gpduezeZ+/WlBahj3z1Q8y7FiGPEyqLO+KLqynwWESFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyz5ZBTCWm9VEOHTTlST/3STwxadr7r9q9oasJWdGoE=;
 b=Jy84SKO+QLj5qnN1a/53rD06rlRB53UM6hw5Fe6gateMglbz+h4+GPPiDmTkaeB/4QQUSxT6dNE4U3Vv1G+RH9vzWmS4sUhxrVUNXNdEfjZwmJTVz6Uw9XROsWV2TMfQ9tNWQEgMNsUCNL0cpePj7FzP+zBhy4YZK/qsTePjQI3vREm4licIzxaGTNs1HaRo/Na5pWOQudEyFyrSFTv5izZstmTHttFqIt79iqamNZ1FR8l1uhwUZ7USoWe2BBrWkg1FHDcZL6Jg36GaAh8xY0DOJwPLj7COqIIn7g9QmDIfL7J/2X3rmsVxuni+Q7CwfiuQhhwA5TZ0gFSOBGtddQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyz5ZBTCWm9VEOHTTlST/3STwxadr7r9q9oasJWdGoE=;
 b=y+s1phGgZX3LYZbB2CKix9Jb4Bm+dj1GXc8d/b03IPYWQKhwj0eQfelmmzwnLWsYTcJXPXJaElphBLiaN0YSOIUGkS1xPhVWiag5b/RJSTamwvQx/AQOz7TDeejIwPReYrrtoeQ7XoDw+mpwjvWVyICBQzxNJN+MpouHagDzMMU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <264c495a-de34-458b-b1f2-80fc58829c06@amd.com>
Date: Thu, 7 Mar 2024 10:06:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/x86: bzImage parse kernel_alignment
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
 <20240306185032.103216-3-jason.andryuk@amd.com>
 <alpine.DEB.2.22.394.2403061809170.853156@ubuntu-linux-20-04-desktop>
 <8b02fb20-2e4d-4a68-b633-417c964e38be@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <8b02fb20-2e4d-4a68-b633-417c964e38be@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|SN7PR12MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: 4445ac16-815e-4fad-1ee7-08dc3eb8d6d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z1KgQMhL/TGeUgFQrlON4obJrRhYz8P3lVwh9qoqEKXEjJwISMe4EoBYstqcuXU3dJn0FAdZ+BQOw//GbyMYiql9NNhsxAO7C+xpqihzC56mIrO10TTF2iuAVURMBKh7wHXIosOANhqgGGi7H3v9OTcN5nd54VUckPnlyY3mkFjdhmbn8Wzh3OJQiEd0y1/oc5CgbWUlRJvkLgYVRXxJhH6uqtjL3sHLRXCQ1xWMUiESVWgXXTxJPGbX3yvntbZDlIQY1xy3QCooggC8EnRKfI+0yjYGsfcSWgLV3rHQGaxXUYEGlPByYRLAOtF/CrdVhL7DXY1WX4Am7+d+205f2cTDSyzwyeMWy9PE9oMkO3K3u1bhTtKMMQ71kwVJ6f9sezEEwTdLo3qctSBIN3Z/Blz3R9zaKvhQeZp2ObsiacVimsDrJ8+iDGKl0RG//w6fw112IEWypmBTV5FymYaFPdTWsnZa5d+zgB0OWZ2JZgJThM9x8ciIWnogNK8jRkj+AxaVBaxLPDGWvxK/XlyKD/8GAO/150PCKjlp+Mn1zz7XXnH2TcHJssqbKM9uQnicBm5bifkwgQaMBl6uj3fnY48KKMaOBzxHE8AHqWrR4OiFcWMXoXk9xYx7alByIkbAJoN707SwNvRr/+88PXuw0D+UgPVc2FC0f4dFRZcPYEOaPxr+K7PgqaicW7IWPopxeTLjHtKof8cf9VRsqjf9ztuk7AHgWwbAEK0BZmhPss6Vgn59JL8VX0luNga2J/rw
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 15:11:17.8232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4445ac16-815e-4fad-1ee7-08dc3eb8d6d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6767

On 2024-03-07 03:26, Jan Beulich wrote:
> On 07.03.2024 03:09, Stefano Stabellini wrote:
>> On Wed, 6 Mar 2024, Jason Andryuk wrote:
>>> Expand bzimage_parse() to return kernel_alignment from the setup_header.
>>> This will be needed if loading a PVH kernel at a physical offset to
>>> compensate for a reserved E820 region.
>>>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with two remarks:
> 
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>> @@ -548,12 +548,14 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
>>>       struct elf_binary elf;
>>>       struct elf_dom_parms parms;
>>>       paddr_t last_addr;
>>> +    unsigned int align = 0;
> 
> Strictly speaking this isn't needed here, yet, and would suffice when added
> in the next patch. But I'm okay with keeping it.
> 
>>> --- a/xen/arch/x86/include/asm/bzimage.h
>>> +++ b/xen/arch/x86/include/asm/bzimage.h
>>> @@ -4,8 +4,7 @@
>>>   #include <xen/init.h>
>>>   
>>>   unsigned long bzimage_headroom(void *image_start, unsigned long image_length);
>>> -
>>>   int bzimage_parse(void *image_base, void **image_start,
>>> -                  unsigned long *image_len);
>>> +                  unsigned long *image_len, unsigned int *align);
> 
> Any particular reason for dropping the blank line? I'd prefer if it was kept,
> and I may take the liberty to respectively adjust the patch while committing.

No, no particular reason.  The blank line can be retained.

Thanks,
Jason

