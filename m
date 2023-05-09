Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F086FC454
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 12:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532099.828114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwKzR-0001Ho-E4; Tue, 09 May 2023 10:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532099.828114; Tue, 09 May 2023 10:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwKzR-0001FB-BG; Tue, 09 May 2023 10:54:41 +0000
Received: by outflank-mailman (input) for mailman id 532099;
 Tue, 09 May 2023 10:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PO4B=A6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pwKzP-0001F5-RP
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 10:54:40 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e20dfcbe-ee57-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 12:54:37 +0200 (CEST)
Received: from DM6PR02CA0160.namprd02.prod.outlook.com (2603:10b6:5:332::27)
 by SA1PR12MB8597.namprd12.prod.outlook.com (2603:10b6:806:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Tue, 9 May
 2023 10:54:31 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::52) by DM6PR02CA0160.outlook.office365.com
 (2603:10b6:5:332::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18 via Frontend
 Transport; Tue, 9 May 2023 10:54:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.33 via Frontend Transport; Tue, 9 May 2023 10:54:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 05:54:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 05:54:30 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 9 May 2023 05:54:28 -0500
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
X-Inumbo-ID: e20dfcbe-ee57-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcFZK9uExUejsgeeBoGCqyKir+KhLgVi1YFVlEYnnaW1xBu6GgjS+6AsBzzBdgnaPu3UpF/QP5pdEZydTksGLVcJPWh2RYXL//nyNcb3d5hbCwNho7kefll4+pTQ1GFTa+9L/6iAxbLhQEXi9CmhbPXXIc8/gFBPOkAHRZ7Ut0iS5iH92ECy32DcN84Qq6f+hgUqiaLztr7eacR64xLjTx2+DsJy4ESrY2prO2irw44p2QXoiWgbL4Xzxxr8/BR48B7vAO6Sts2Ds7tEi7yxGtPzB8xKAAmmjM55oYy5Qp3j0eJwa5taLGbdPTHARiwOpwpJIlFJ23m2XiKAOXHmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pExdquudE4JcTAfm19Hr5GI1d+g1k/9tY22rsnGMN9Q=;
 b=R43Et2GP4gvP8L4MCZAj87mqsv+xk83K9a1jmvj0anrGdetJhJjI7kEZt42QQdXXcSpYN3mujamTi7hBMgT4sthn+0TAc6957gikZ4jEjFdSVpvz8VL+gvlqwVlktvdV63ww39uAbdlRtR4MzBI5/S90NMN/cPN8cmhyZeIISOc+RvDEVzOTSqQ7+6u3z9kPNAlfjHa0VGwC3eCmbEywK8T0WNnGNuoqDN22NDbZ69Zant/4A9dWA26GOl3zcpr+OWFqH4D1O/U8C2fvRjsm0Wo7RZQ0fKOoWCFtwJ67BgIj0pI8PwxTYMTceVKv8eSr3ozL3H0KrCdHDhNYRLuYNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pExdquudE4JcTAfm19Hr5GI1d+g1k/9tY22rsnGMN9Q=;
 b=NSB7FRG3ENDsIUETiReXfLThITK2tt90e253IlWn0d+7rKXr4a9nUILbxchfQjJQ34MTuyXjsSwJuLC8Mm6GK98emJINacUV69vMZ5buY0WdRcOwvHVasJSfN7VpXhDHhEET9NgMubWLngQ67Yvyil7CilBFuaQ9F3ZXYH2Axgg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3f2bb14e-34fd-6a74-5644-1c6470c7cc37@amd.com>
Date: Tue, 9 May 2023 12:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN][PATCH v6 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
To: Henry Wang <Henry.Wang@arm.com>, Vikram Garhwal <vikram.garhwal@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-6-vikram.garhwal@amd.com>
 <AS8PR08MB799123AE54B0ABE907F2FBB8926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB799123AE54B0ABE907F2FBB8926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|SA1PR12MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f017b4-32b0-4327-c4d8-08db507bc4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	THyLfO3G/HzN04RvnhbcgKhavUfmK127gOuo3qQ3g276YFZn2VLboHOfGM38YTbjzVlvMXkF7gFo9nO1A6nYrc+Dcineb/vLPB6OcdASy+IbzQUPHyqQPIwrEwRtOGZvj0VTbqNKo9G/WNPxdtgMg6vJZoqPJAZW7mXSfKnnMl9ExgSqrFPwjB1r33FdK3zUAAN1jM5fOWu5pJ4QB2/q4br0Qeh0eA0CdSBjJsNruQQHprU94nH/mbU48KclUqqLD0qgTfyi/rXzrCr5jO0ctvd+H43jiPRztFSa+iXoJYwzY+BDtQf/jlN/cgVeRkIkKCLu4UlNSjg4vqWKdG/Bq+vy4eQJSfIVIY6kplf+tcsdLaSjt9YSmumckZUCyMGomJruQ+50HcPYpuAtYPTQn6TvryXXwhveFNbuojixvUuAs6favpvz3b6kX1BT6ea3cdLkQmyi2gPaEGaEarziKngd7tTgBmgm2+voh11uXQcCZldwcvWf4GTG6Z5tKnPc17W/+lrcfYH+bBZZ+jkVjGu+SHMBoaeneMyjMYI91nRJozux30PXe+sC25pVRx6SEv+ee7hp/EJ82wcgGdj7xRjezHy4EDw4ecNCpCLAidqyOvBmypqQn6TWeyE6HFk+bh6o7xVP547xMI4i4Mv6Uy0TAf4UycT2nQAvffGrODKNpMKT8ws4YL+6FkGVjEiJqYvJD+GFutmSH2x8A7jGHbEtfe1eYqI+Ml3LoEC0c7mHrgHTgNyJcuDrYKxLKvzqX0OfwcPtMO5UJzsyda8Oor0IE3eBL8XUBrAm+J2ZGGLW9AMCLvwQHDYlEes5Fg/e
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(478600001)(2616005)(47076005)(83380400001)(36860700001)(336012)(426003)(86362001)(31696002)(40480700001)(26005)(356005)(316002)(81166007)(82740400003)(110136005)(16576012)(54906003)(70586007)(70206006)(4326008)(53546011)(186003)(31686004)(7416002)(41300700001)(8676002)(8936002)(5660300002)(44832011)(40460700003)(4744005)(2906002)(82310400005)(36756003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 10:54:31.6212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f017b4-32b0-4327-c4d8-08db507bc4db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8597



On 04/05/2023 06:11, Henry Wang wrote:
> 
> 
> Hi Vikram,
> 
>> -----Original Message-----
>> Subject: [XEN][PATCH v6 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
>>
>> Introduce a config option where the user can enable support for
>> adding/removing
>> device tree nodes using a device tree binary overlay.
> 
> May I please also suggest adding a CHANGELOG entry in the "### Added"
> section? I personally think this series deserves a CHANGELOG entry but I
> am open to others' opinion though. Thanks!
Yes, this definitely deserves an entry.
+
please mention the SUPPORT (and CHANGELOG) changes in a commit msg (for now
it only covers the Kconfig option).

~Michal

