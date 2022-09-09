Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474C35B2BF3
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 04:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403756.645969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWTTG-0000wa-MR; Fri, 09 Sep 2022 02:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403756.645969; Fri, 09 Sep 2022 02:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWTTG-0000ua-Ir; Fri, 09 Sep 2022 02:10:18 +0000
Received: by outflank-mailman (input) for mailman id 403756;
 Fri, 09 Sep 2022 02:10:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mxBE=ZM=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1oWTTE-0000uU-Pr
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 02:10:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a0d1198-2fe4-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 04:10:14 +0200 (CEST)
Received: from BN8PR04CA0053.namprd04.prod.outlook.com (2603:10b6:408:d4::27)
 by DM4PR12MB5746.namprd12.prod.outlook.com (2603:10b6:8:5d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Fri, 9 Sep
 2022 02:10:11 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::4f) by BN8PR04CA0053.outlook.office365.com
 (2603:10b6:408:d4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18 via Frontend
 Transport; Fri, 9 Sep 2022 02:10:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 02:10:11 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 21:10:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 19:10:10 -0700
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 8 Sep 2022 21:10:10 -0500
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
X-Inumbo-ID: 8a0d1198-2fe4-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzlhSPmwp5B/enJjd1aWAXtZF6E5LSOhvAQSMZeCgbxoR4LftdWZb3TkpFknSVVIVseebkgLsA7Pv6I6OdTzz3QMgdIdXs4eCpS6gVU50nbEzUf1rh6A17urN1cgULFPg/F2W09P/qzm0C2+YWJ/YJSXurs1qA0t0JHB+11vEh91fElGOgyOhU3+SPF26YPK6oTBc0ni7m01HWZ0NczznTBltkPVlCyeSu1rnVXbcJO/PB61MFhu7wY+32F5NI3ZXr2L9BTT6p3IAFAe4q37uBPr+tOf6wB85C/H4UMKaTyuUj/SqXu7h+ju2c+6kkfWNq8IVdg+Ds/8l0jW0VKeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RUWAM2TQ4oErXw3rVjXjU7ECP332ZKAJjKbAk3f5Q0=;
 b=FssLPhgzbuMWKspIAw5HDjMHLG+r/hUkXIbxs0k7A0oPIU+haOADL1+pdTYH2whUhpYtwh+zNEukcuofNMIRr2KfX3ADQPUdEeeVv0pIE1y17mVuXZQYSrPuEYV08ilDzdWZ2SV3LK63iY5I6yJNyPOlAtJWqJ+QuOI7x7aiPaqYXdTcwFgGFdsW/yBjoHqnuCBlWJ39cEHsw2bPe2AvRKLlWjf3FJldYkg3oL6LTXRCvrIl8cQwYAlluk0eJPxx+yxfBowRmFg8C/NfyURHPO5QyY1GJmLwOZrE8/f+FmvEx8pynDaBKiMDmads5ONnJVTEoRnNKRQutclNjdRZDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RUWAM2TQ4oErXw3rVjXjU7ECP332ZKAJjKbAk3f5Q0=;
 b=K5vUwuEGFXlO1ZFmALNv0pWnm8yyYM3SS/EmK4e/K9agBi1tkoa3VNadcX66VhHiZ5zmr7uyt6HuVP1c268NnajMbOosxOXhAc6N45KnGDqsPGgwkLAUh1Ew1w6gMMnYxEFqlE68cZJ02sJP3qeWuBOMLtNrcKwKAF4Bjip4xLo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Thu, 8 Sep 2022 19:10:10 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <jgross@suse.com>, <boris.ostrovsky@oracle.com>
CC: <stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Linux pin_user_pages_fast fails on Xen
Message-ID: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT095:EE_|DM4PR12MB5746:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ffe648-e1b0-4e9f-f7a1-08da92086d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T2AP0AQPoV/zvufuNvINQyYxnUltT2Dc7Pq+AT54OOHmMf8prlhQW//2vYB13YT+8SMckqPSbn9gTvmYzvRjcv8A0vmqQVe6Fubtcjt3jpQUTmbSRe51rmPzKFRVrz2aNLPXSgP1Kxqw85PjBo798+6WPBILDlpdlR4Rff8O1wu9Pb5NP/RbyY97FZM8NjmC0IrJpEjPSIGffam4FICqNTmsWm8NljXFpzV/h/VXM4ebIslX9J8fLNJ3zEKg2ABNxWPcbfPi6Eav5gcfEFEzaykLWQm5Vl6FX4eGFr0dr9nQvEhfStHJIT0A2RG/t2phLKcVKla8s8T2lPylLvCPgUGEWGVQ5CfBVbH8bZldq5zAWcVR6/J5rEHC/pb5jLVGgZcsSPECoNbpMx4GnU9R/dHm/X4PFG6ZQZpJkrjU7uOQxKqtD8MwbVaU5TLDkajW3VmPXPWntpoF5GwzcbYMu9vk+c1agk1LjL7Ti6CZH2PO9SiN2uBWlKrGPkmPOKIT2EQHIU2hCOMLrkrYwGLXlXpUyaa0GvPJ4I2MZHiyuVMu6ezTtb3ei0ANBqiLJaOWYi/QC6rkGAAk/GCJCH/c7XVVsjXy3MprrS2sHhAVffzQf0E6SRTQkuKwasuH7RSz3xDJTQF2sGvAOVFsfdeVfUt4+4A++3D4h33N/m2CBOTtjxZxHvNtQfSLL9HLydHbq5zJARaCtbWxJnq5428QVlA2hnRxU/bXkt9k/8tHtoHYHf/ybuZFg0EvFtvA0oTtIpi+oHXAh55nd5cYsl0D9m1FkPXfVruWjXmfUT8bM3DSaaCWyiQR9PXDLQZBXGeh
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(7916004)(4636009)(376002)(39860400002)(136003)(396003)(346002)(40470700004)(36840700001)(46966006)(82310400005)(9686003)(41300700001)(26005)(186003)(47076005)(8676002)(40480700001)(5660300002)(83380400001)(4744005)(40460700003)(8936002)(44832011)(336012)(4326008)(36860700001)(33716001)(110136005)(70586007)(478600001)(2906002)(426003)(70206006)(82740400003)(54906003)(86362001)(316002)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 02:10:11.3271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ffe648-e1b0-4e9f-f7a1-08da92086d15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5746

Hi Juergen,

A colleague is seeing a failure on x86 in Linux Dom0. The failure is
pin_user_pages_fast with addresses that correspond to foreign memory
pages:

- QEMU maps a domU address using dma_memory_map (xen_map_cache)
- QEMU calls an IOCTL to the TEE subsystem with the Virtual Address
  returned by dma_memory_map
- Linux tee_shm_register->pin_user_pages_fast Returns -14 - drivers/tee/tee_shm.c

Once upon a time it used to be the case that get_user_pages_fast would
fail on Xen because we didn't have a struct page corresponding to
foreign memory mappings. But that hasn't been the case for years now.

Any other ideas why it would fail?

Cheers,

Stefano

