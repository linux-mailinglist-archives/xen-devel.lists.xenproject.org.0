Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 591D782A1B3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 21:10:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665723.1036004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNetE-0003n0-Qy; Wed, 10 Jan 2024 20:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665723.1036004; Wed, 10 Jan 2024 20:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNetE-0003kc-NH; Wed, 10 Jan 2024 20:09:28 +0000
Received: by outflank-mailman (input) for mailman id 665723;
 Wed, 10 Jan 2024 20:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3bl=IU=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNetC-0003kW-RD
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 20:09:27 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24b3ea75-aff4-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 21:09:22 +0100 (CET)
Received: from DM6PR11CA0032.namprd11.prod.outlook.com (2603:10b6:5:190::45)
 by DM6PR12MB4284.namprd12.prod.outlook.com (2603:10b6:5:21a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Wed, 10 Jan
 2024 20:09:17 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::aa) by DM6PR11CA0032.outlook.office365.com
 (2603:10b6:5:190::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Wed, 10 Jan 2024 20:09:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 20:09:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 10 Jan
 2024 14:09:15 -0600
Received: from [172.23.76.218] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 10 Jan 2024 14:09:13 -0600
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
X-Inumbo-ID: 24b3ea75-aff4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lmd5A7Q+X2kAI7Bp8cmaZ/nVFyinX6noX7iuh2OSwy79AztBTeVMAU1um00xUOhwrp4ONUWPFmt3KGHfiU9RcZccadjl2cGRbGo8ReyzP0stUjEi6QklWLeM5NVj1ehGYDkjqD6U3W9bdIgC7OyWIcB1ugnn1dOEBq9SwHLstM1n5sVIHK4W8rzq/LzADTzqYjeD+8sWV9IwxDT1z70bBhAMv+JsbzMotNIXsKQimAUDj6wp/QmPhfn+/c44ZRdcoTbCus6NqzyzIfP1GUfi2pOjfBoDrE1A+xFGnM76xATRoUN6Z2OtaIRQdVfRSlqnQphvstQnIFioBxO00ZluFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3pHfw4H89dtASITYqiGXbLY90yUJiRBtlD4JKK92Kg=;
 b=IExF+7EvoEPxVZ/c3M0h3ENnnbs2eN0KUsvh0e8A39OwqxDy/mtjK7dMGcu0WT4iXE/hLa8CRRV0rJzUuc3Xf8gQD/PIkcZTHL3yUFGYTv6PELbozVCYLdqUnbR8GcbaL1wVizT3nIJfE20vA/PxowwE9qk5v9lLvIaKOcmZrt/NfGqhSuWfyaVZx6HYl+6fariZfydgPI5UZr/ctl7MpadqQudcWk3vK1WTfjbCfO4yljhUvAfG1lEDS8A57Uq/yaZAfPVBKIdJ3lkMc99E3ST8piIyL8QbNNmTX1AFH3L5su29xywCMg90aU9y5qYUz3q8CCHJXvmHkAz1OCeIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3pHfw4H89dtASITYqiGXbLY90yUJiRBtlD4JKK92Kg=;
 b=iW97FYIaaszCqqulyejX1mpSAubrujd47f63CPzLj6RD0jmd/Zz3dQdYu6vj9llx76qAFo61Z9ZLepzSD4oPsHXYNaydU7j6+vgRjQ+OFsWypdnRohxM5cmndBd1NdnAjruWNEaj9u+H933asdDcmK2QJ57D46gbInZ2KaMg8hI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a9d7a073-7857-4567-9528-413d96a99d91@amd.com>
Date: Wed, 10 Jan 2024 15:09:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Content-Language: en-US
To: Jiqian Chen <Jiqian.Chen@amd.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>, Huang Rui <Ray.Huang@amd.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-5-Jiqian.Chen@amd.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20240105070920.350113-5-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|DM6PR12MB4284:EE_
X-MS-Office365-Filtering-Correlation-Id: 7498e417-4433-496d-e215-08dc121805f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g2C46JgQKauAq5a+whwPq0S63ZCnDxuWjVPbzX7ZLrwQWANsY6QawzpJSUwpdEViSbb/1VfTVqR/773ik3tKsB14L391/Gi1OYf/jiNVTIQYoDoPNJqfmRcj4DlZQviTNKzE0BOQKLUaxSX8Mb1j4VCLcsfcqy4KDjBq7U3FIKKwgguzFOYcpqGC7TIW61/vuFwau8rzBLu2KeUxOJMD2g4lFMtVzcvgimfCcJMKANW5xhuwXYWvyEWuxq2J7V7V8NgRWIB1MLta1TOQNbMONTUHHA2bhh04RyHM9vwgNQ8N2B30k88DrBhnr0AOmrjscrfPNWLKpKa1CMEh97ksrJXA3MgiOmpBejcR9rs39DkbBfAzZCRAMNDagIOd8I63zlC6faeoNUF0ryQN+sol2Lluoun8qx6cKW4DZII+7533cdQFI8c0sP8TCFQPdLfENgL4+AJxWQy+HKxEoqtMc3XUQVVRxN537Y5tJ9/KA4Uh9WlJ+lC3FSZsu/eTtVWMPmqzIRi1mI6hOEdfde8Ue52AasRmcl48gyyOWQJH9At/Pjzu+79QZsVxeULZh5v58vE8SVP8rqdKQxrZ6bB2inGc+TUqVPc5CdnmTIfYVV93JrSaGP+ZV8kyYyUVUOjad0XWzfQdp7/MU1rhSBVNhxDuDxRK1oJFH2FqTsOVeCX/VwW1Gz6UkRTixeEUzTSBoGESeIaaGRr+PcP9RVOSSSs3hKrLpwYPSS92611ens7LuU8ZcDSeWybDIXu8Uwy6MHEmgDJR5c1EHN/u3+Ow4Pu5DK/R6bY1yxIbvXTNRMw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(82310400011)(186009)(40470700004)(36840700001)(46966006)(426003)(2616005)(26005)(336012)(478600001)(53546011)(83380400001)(36860700001)(4744005)(5660300002)(47076005)(7416002)(2906002)(44832011)(41300700001)(70586007)(70206006)(110136005)(8676002)(8936002)(16576012)(54906003)(316002)(4326008)(31696002)(81166007)(356005)(86362001)(82740400003)(36756003)(40460700003)(31686004)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 20:09:16.7542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7498e417-4433-496d-e215-08dc121805f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4284

On 1/5/24 02:09, Jiqian Chen wrote:
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index f5a71ee5f78d..eeb975bd0194 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -653,12 +653,20 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>          unsigned int pirq = op->u.irq_permission.pirq, irq;
>          int allow = op->u.irq_permission.allow_access;
>  
> -        if ( pirq >= current->domain->nr_pirqs )
> +        if ( pirq >= nr_irqs_gsi )

This doesn't build on ARM, as nr_irqs_gsi is x86 only. This is a wild guess: we may want keep the existing current->domain->nr_pirqs check, then add the new nr_irqs_gsi check wrapped in #ifdef CONFIG_X86.

>          {
>              ret = -EINVAL;
>              break;
>          }
> -        irq = pirq_access_permitted(current->domain, pirq);
> +
> +        if ( irq_access_permitted(current->domain, pirq) )
> +            irq = pirq;
> +        else
> +        {
> +            ret = -EPERM;
> +            break;
> +        }
> +
>          if ( !irq || xsm_irq_permission(XSM_HOOK, d, irq, allow) )
>              ret = -EPERM;
>          else if ( allow )

