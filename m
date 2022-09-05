Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12F05ACA8B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 08:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398472.639310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV5aO-0000BK-Ia; Mon, 05 Sep 2022 06:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398472.639310; Mon, 05 Sep 2022 06:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV5aO-00008M-Eq; Mon, 05 Sep 2022 06:27:56 +0000
Received: by outflank-mailman (input) for mailman id 398472;
 Mon, 05 Sep 2022 06:27:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxbR=ZI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oV5aM-00008F-Up
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 06:27:55 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2052.outbound.protection.outlook.com [40.107.96.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddad6605-2ce3-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 08:27:51 +0200 (CEST)
Received: from BN9P223CA0028.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::33)
 by BL1PR12MB5319.namprd12.prod.outlook.com (2603:10b6:208:317::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 06:27:44 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::9c) by BN9P223CA0028.outlook.office365.com
 (2603:10b6:408:10b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 06:27:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 06:27:44 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 01:27:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sun, 4 Sep
 2022 23:27:43 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 5 Sep 2022 01:27:40 -0500
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
X-Inumbo-ID: ddad6605-2ce3-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfotplqbU/vz7M1OXGvINP9k8VIxTe6trI7/gU6uWdpBqouCXkkqyuA5SD7cxFJGGfND+sboz+XDT843wBt0wg8Np1IrXcScp+DhOTYLvUx2YdURK3wAz22lbHkdxbD8RbMDS87o5RUy/DgJrAqx33vFfJX2LpuNTa/ogj2mn5/CxNek6cfDwuYmLyIy0imsRq376m/Es+k6Wgtxq8b3ODaX+grQltMwqmPk1L+ZnJBxS0c0n8sbJ92iLCaSDvvT0DgsC3MFi5TMGjiHn1TSiJpC0fY2+rKxkKesQ025TjptTT+eIJjx/EQeu7w6Ft4ELYUSNajdfrqrsE0MVcSXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEXN8yK+NOi0eG2LmzvXUlKfjKJlPX22L+PLn+EGk40=;
 b=E2PUrfgx3wJ1sXYBTgeX1mIrL9cMsCSCSMIOE+JO2uXVHPFiGUkZOpA6uItioP3oPgbrpq0NDzKTcMXnp5jZdoL1sBugIXVy7sGsFXujnCb8vJbFfEzIEHhfBQSekeH8kAhDAy0zgg7Qa6pFA5cCwJetVa8kWRF10ZELcuVnh5wi0FMIf0pUIzi9wmSqafnpA2DR68QZqXRtmX6dqEO9rvN6GHTtPv0zpjPppV3i8qIfFaaxxzvuejln7jnzKLOa7OVSXObApvSSoo38LeDHG+Wl4g0sc3nFB3C3lR0jOPwS25nbwSJKd/Sb+zkZrkmG7OtCTxrlZYLWgp3z/U+qKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEXN8yK+NOi0eG2LmzvXUlKfjKJlPX22L+PLn+EGk40=;
 b=cefO86k9EKZHzMK/uRPzDpbCSoQkn+JcnT8AEdxtm5eKOykLhf69w7Mbs0C4PAcmmgx25t9tfWdJTbOjVLksBR/qU82yBgn9UHJExIaVKB0zvr70wmbEhVhkhMVvhTKNB0xbxjfUT0HSjAxM0YRFX195GM+ZFSFlOS7egzETk/E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c13fcce8-461a-5ff2-c668-738fa167b385@amd.com>
Date: Mon, 5 Sep 2022 08:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Xen 4.17 release: Current status before the feature freeze
To: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, "Bertrand
 Marquis" <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, "Julien
 Grall" <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei
 Liu (LSG)" <liuwe@microsoft.com>
References: <AS8PR08MB799103D2B44302893AE39A97927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB799103D2B44302893AE39A97927F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 599efcef-e026-4c25-22fb-08da8f07bdf9
X-MS-TrafficTypeDiagnostic: BL1PR12MB5319:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fwXaEqUdLn8odlCDJA/TAzR1UwDBQLIPqVDIwShjQsHqBea2PCLfm1hBLaBrBt0RDzQZ3vs9r6wJhcJzmn/jZ/rZUs93n+UnzUoarnQdgu4AXvGhJPgxv+XsTvSiDV7uTrR/m1EeeTVoL00TwvmmW+f/le5LQGZT1Z3QNcjlBBJIL/iRJudpI9E7dFIL1BSKlJ/hcFCemrMXCFfWr0jwYl7TaUR4OR57kVXUchA0hXytd4qgN4in5aoP82ImFnn4nguDsB2T+4o3aI3aZARogJOPOdsABOen3AzpZeXwPRXEp/HSrAfVS6rx4tzKx6gHKjZ/eW4MGtWfrT0rGLbT17xBn+3r0WU+CVoMInS/a88FBtsvOLiHxBzRcpHfGmnAURxWbWAMXrv1T20Z1y0iikS/Aa5VNqZTWAsSe1WpHobIhcGGy+1XbCuc/+3lg3ZAeNwIco9RW16+mpwAn2GAeqI7efPESwy4Gg6L7gpCcy3M9vyKDWm0u4bo1JqgNRFDLNLjXR5ZpODBGljXCYNa7VPHf28HzdmORun5Z3W665RQ7BE60pX0LkZIkDBksJZf/FAPYnmOYIxJRv8y21VHT855D8o+MhILe2tJmGpNh3dVo9UC+PqjctkBeizNpDV6QH6LjoCBBPsx+KBQNnmTOUxs94k/XKvlLXgvgXZ3EhgypgCFUkM9lw85dhISm0wAa4wzvGKnOyJmuZPp/924g1NVZOD+VGBW+TAXo5/UQzwIRVClbUeXUmW2tckpCoNpvaV2sycIuR7Q1pM4AtFq3WPxVLnDqpH6CWP4T0f6YEQ7hZm+6tgRwlXF6M42HkySZQgJOTOnEauTaoE/i/7J+b0q9rsNfQ7jtNetzQ+lqxiuwbQzKoN4FsFR/6m+Yp3CBnfxkkSAKS4X6lVocYH5uw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966006)(36840700001)(40470700004)(30864003)(41300700001)(36860700001)(45080400002)(5660300002)(7416002)(53546011)(86362001)(26005)(54906003)(110136005)(31696002)(2906002)(16576012)(316002)(47076005)(426003)(40480700001)(44832011)(70586007)(336012)(81166007)(186003)(2616005)(82310400005)(8676002)(4326008)(356005)(40460700003)(82740400003)(966005)(478600001)(83380400001)(31686004)(36756003)(8936002)(70206006)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 06:27:44.0485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 599efcef-e026-4c25-22fb-08da8f07bdf9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5319

Hi Henry,

On 05/09/2022 05:44, Henry Wang wrote:
> 
> Hi all,
> 
> As the feature freeze date is around the corner (Sep. 9, 2022) and we are
> currently summarizing the series for the release, here are the list of series
> pending in the mailing list. Please add the ones that I probably missed.
> Thank you very much!
> 
> Note that the blocker, automation, Arm lists should be accurate for tracking
> the 4.17 release IMHO. More inputs and clarifications might needed to clarify
> if all series in x86, tools and common lists are going to the Xen 4.17 release.
> 
> Also, as agreed from the September community call, the tracking of Xen 4.17
> release will happen both in the mailing list and the Gitlab. I will send the Gitlab
> link once the work is done. Thanks!
> 
> ** Blocker List **:
> 1. Patch: x86: enable interrupts around dump_execstate()
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Fpatch%2Fe717897f-980d-ad44-31d9-39f5e7e1c45e%40suse.com%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197623536%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=vnthB7ax%2FUotcyFVzDr4KY0upw%2FMaVcohohNhkX8FSA%3D&amp;reserved=0
> Status: Waiting for review.
> 
> 2. The fix of libvirt after the virtio support in toolstack
> Status: The OSSTEST seems to work properly, apart from what Jan
> asked in IRC - the qemu and omvf OSSTEST might need a force push.
> (I am not sure if this has been fixed so I just carried this)
> 
> 3. [v2] x86/PV: issue branch prediction barrier when switching 64-bit guest to kernel mode
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D661061&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Uht4bWolBsJ9mBOBlS%2BGAu54aF31KM%2B1KoYX1L2qIWA%3D&amp;reserved=0
> Status: Need review.
> 
> 4. Licensing issues and details
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fxen-devel%2Fb58f5340-d4fa-df9d-89de-6137005add77%40citrix.com%2FT%2F%23u&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=fwpKnLKCXDNxAtBYVRmqZVsLWB%2BEB45V0GNU2vN2RVw%3D&amp;reserved=0
> According to Andrew, relicensing device_tree_defs.h is a release blocker
> 
> ** Arm **:
> 1. static shared memory on dom0less system
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D661838&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=28lcf7Dz5%2FeHSmBV3zzvCaxtUVqq8IC30S75r3%2B66Cw%3D&amp;reserved=0
> Status: Need v7 from author.
> 
> 2. populate/unpopulate memory when domain on static allocation
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D672665&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=jZGE6%2BOGqJSqX%2FZOCLTg45zPOvD0PFzqD6%2FPNBTGWIE%3D&amp;reserved=0
> Status: Patch #6 needs review.
> 
> 3. xen/pci: implement is_memory_hole for ARM
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D673155&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=NtnIPQdAFfymoMgIhbMMQkmF1M7Cxa4CTYxdYTJZZKA%3D&amp;reserved=0
> Status: Patch #2 has comments and probably need a v3.
> 
> 4. Introduce reserved heap
> Status: Need a v2.
> 
> 5. xen/arm: smmuv3: Merge Linux fixes to Xen
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D673634&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=XP1tf8AFAtTpz6p3xlKC4Owk1KBcFQPKuOgEoVxGF%2BE%3D&amp;reserved=0
> Status: Need a v3.
> 
> ** Automation **
> 1. GitLab CI cleanup and boot time cpupools test
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D673488&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=JjOXozG5%2BjcqJLBgeK7Q2j8DdLF164hgVIC0ji2fI90%3D&amp;reserved=0
> Status: Need CI maintainer's review on Patch #1 #2, need author's
> action for Patch #3.
> 
> 2. automation: Test a pv network interface under dom0less enhanced
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D666128&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=2B4hsXs170gzyFfIHushsp5RtSRR0OHiQ02oJYRxeh8%3D&amp;reserved=0
> Status: Need reviews.
This one is already committed so no further actions are necessary.

> 
> ** x86 **:
> 1. [v2] x86: show_hvm_stack() requires enabled interrupts
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D667114&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=2GMogdfRBaU9m3iCbG1inTo9kFdhQr8GnhNP%2FtVU5LI%3D&amp;reserved=0
> Status: Need reviews.
> 
> 2. [v2] x86: help inlining of functions involving alternative_call()
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D667117&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=9KdAzRjVbKphM25fivLDYFEhsncF9CDsbOLUEuaO8AM%3D&amp;reserved=0
> Status: Need reviews.
> 
> 3. x86/spec-ctrl: Reduce HVM RAS overhead
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D666983&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=dsiSOtY%2FzguMjrenaDfXIQwBtRlYk4nFROr%2FwBZgb1A%3D&amp;reserved=0
> Status: Patch #1 reviewed. Patch #2 discussion going on.
> 
> 4. Intel Hardware P-States (HWP) support
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D666690&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=wOTtNaEBTGKEzD%2FVFh2QuYhjhnHts288fgKY4zcIVEs%3D&amp;reserved=0
> Status: Need reviews.
> 
> 5. x86/hvm: Improve hvm_set_guest_pat() code generation again
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D666603&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=N0WQ223ZJe9%2BpkrNc6tiwbbM68Q%2FVf5yqXVtzK0FOU0%3D&amp;reserved=0
> Status: Waiting actions from author.
> 
> 6. x86/AMD: check microcode size against CPUID-supplied limit
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D666515&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=BvmkDXDbRNmKJ7jnO2PreisO%2FKzIrjVyZHUKmzczmAM%3D&amp;reserved=0
> Status: Need review.
> 
> 7. xen/x86: import linkage.h and clean up x86/kexec.S and x86/entry.S
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D665401&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=sL8CWy4YKZvvCNqFXf4FtlbWB6zc5LZocXCqeC1P664%3D&amp;reserved=0
> Status: Patch #1 #3 merged. Patch #2 #4 need actions from author.
> 
> 8. x86: limit issuing of IBPB during context switch
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D662741&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=wXpCCywBSgU1tVagEhBkI9pIOl6tAFqwCorSffcOhTI%3D&amp;reserved=0
> Status: Need replies from maintainer
> 
> 9. XSA-407 followon fixes
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D660818&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Ri34I7PPXm%2BR3GJtrADNK5eiwenNFqqFjCo9SsYIWzo%3D&amp;reserved=0
> Status: Patch #3 reviewed with further actions from author. Patch
> #1 #2 merged.
> 
> 10. x86/irq: switch x2APIC default destination mode
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D655330&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=vFEDwnmV%2FshbnDHkIA4nwyXh%2B%2FnvgmpSow5oRXYfqVM%3D&amp;reserved=0
> Status: Patch #1 merged. Others need review.
> 
> 11. [PATCH v2 00/12] x86: memcpy() / memset() (non-)ERMS flavors plus fallout
> Status: Some parts committed, some parts entirely uncommented on.
> 
> 12. [PATCH 0/2] x86/vMCE: address handling related adjustments
> Status: No comments at all so far.
> 
> 13. [PATCH v3 0/5] x86/mwait-idle: (remaining) SPR + (new) ADL support
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D668735&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=wahuXQHzNyi5Yt2CI4kKmhfzmzN%2BS%2FJEO0OSYx%2FTwSo%3D&amp;reserved=0
> Status: Patch #1 #3 #5 need reviews.
> 
> 14. [PATCH v2 0/8] x86emul: a few small steps towards disintegration
> Status: Entirely ignored for about a year (since v1 submission).
> 
> 15. [PATCH 00/11] x86: support AVX512-FP16
> Status: v1 was reviewed, but some of the review comments need further
> clarifying before Jan can sensibly make/submit v2. Note that this depends
> on item 22 (albeit if absolutely necessary it could be re-based ahead).
> 
> 16. Device tree based NUMA support for Arm - Part#2
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D673455&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=TusNBDBsW7AnSGpR6yEImKNxkEGLgZIgjEEcev4ryEw%3D&amp;reserved=0
> Status: Need reviews for Patch #1 #2 #4 #5.
> 
> 17. [v2] x86/public: move XEN_ACPI_ in a new header
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D670995&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197779758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=majajhLfE62Up3M9KAa6ksgslTGKvsGBoGxhGHhNuL4%3D&amp;reserved=0
> Status: Ready to be merged.
> 
> 18. x86/PVH: restore VMX APIC assist for Dom0
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D670123&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Ip4xHGg0TxIuKVlRaWCrbNAsdHGH6%2FgCXfzEHOoHWk%3D&amp;reserved=0
> Status: Need review
> 
> ** toolstack **:
> 1. Toolstack build system improvement, toward non-recursive makefiles
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D666960&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Xl6A9Maf1F%2FEMvPFqW3NZJ7JGx5T07NFcoME5xLGGqc%3D&amp;reserved=0
> Status: Partially committed. Patch #1, #8 #17 needs an ack from related
> maintainers. More reviews needed for Patch from #20
> 
> 2. libxl smbios support
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D666694&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=D4FOu0dHNWQ7nO89P2k6rH2nT70Jn%2BaIIYnGKilksIk%3D&amp;reserved=0
> Status: Need reviews.
> 
> 3. Virtio toolstack support for I2C and GPIO on Arm
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D669685&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=4z16JuysU54mjtqnuDfUvS8LdtOJ0nFWBKO6BtLTlWY%3D&amp;reserved=0
> Status: Need reviews.
> 
> 4. tools/ocaml code and build cleanups
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D664150&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=kTkbw7CwcqAxFqyq2aSiVAReJkcCpvOHEcYJln2DAQE%3D&amp;reserved=0
> Status: Patch #2 #5 #6 merged. Others need actions from author.
> 
> 5. [v2,1/4] tools: remove xenstore entries on vchan server closure
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D659375&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=iw0ZOpdDn1Q1KadIX4rFSabGrv%2FKwCegv%2BrRNFkVm2o%3D&amp;reserved=0
> Status: Need reviews for patch #3 #4.
> 
> 6. [PATCH v7 00/11] libs/guest: new CPUID/MSR interface
> Status: Largely reviewed, but there was something Andrew's input
> was needed on, or he wasn't happy with.
> 
> 7. tools/xenstore: add some new features to the documentation
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D665064&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=%2Ffi7oTkO%2Bog2bzwrRhJ52mDkVs3RJcvUf8bkYSN8lQY%3D&amp;reserved=0
> Status: Patch #2 merged. Only patch #5 is not properly reviewed/acked.
> Discussion seems going on and (probably?) needs a respin.
> 
> 8. acpi: Add TPM2 interface definition and make the TPM version configurable.
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D672588&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=eFtefrytIF%2F%2BLYsKCDyyjObhjfJwnLpn%2BgPdaWf8Wu0%3D&amp;reserved=0
> Status: Need action from author.
> 
> 9. Use direct I/O for loop devices
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D668537&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=%2BtxexTF2VJBhEX%2BKLE%2FlB2dtUkNY6EsG3Ef0Q2g%2FBno%3D&amp;reserved=0
> Status: Need inputs from reviewer/maintainer.
> 
> 10. x86/hvmloader: Fixes/improvements
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D670606&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=LJHMEa2HKYgCTbBxcVLA2eSTyJrCXeOUtuAKXzAivU0%3D&amp;reserved=0
> Status: Need actions from author.
> 
> ** XSM **:
> 1. [v12] xsm: refactor flask sid alloc and domain check
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D666302&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=ugxiYYLWSSOYxtPkEWDeOIQL8z%2BTi5gEb7EEZPxQAeo%3D&amp;reserved=0
> Status: Need review.
> 
> ** drivers **:
> 1. Add Xue - console over USB 3 Debug Capability
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D673630&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=9zvdfqJJIWpX6MT%2B%2FYHQ6uutsMRMJF9Auw%2FiQmqjeHw%3D&amp;reserved=0
> Status: Need reviews for #1 #2 #4 #9 #10
> 
> 2. PCI: avoid bogus calls to get_pseg()
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D666322&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=%2BU10KM16NKzBltZNKV9YbSTjVJ%2BuwWiXZBgEE8CAzK0%3D&amp;reserved=0
> Status: I am not sure if this is superseded by
> PCI: re-work pci_get_pdev() and friends, if so please ignore this.
> 
> ** Common **:
> 1. xen: add late init call in start_xen
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D664963&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=uE2i0zvCY5GXYX6d1xOnogzVIiFZqZTVHqb%2FSNIM4Go%3D&amp;reserved=0
> Status: Need actions from author.
> 
> 2. xen/wait: Improvements
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D660565&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=41hE63L7h18TQSjfbLoz63lIWKAMaeOBtQdHDUWSx28%3D&amp;reserved=0
> Status: Need reviews for patch #4 #5.
> 
> 3. xen/sched: fix cpu hotplug
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D667963&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=%2FH63FIDiaE0dw4HFjk6y6l1AmAW%2Bagx0jVND6vlC9ZM%3D&amp;reserved=0
> Status: Need actions from author for Patch #2, need confirmation
> from maintainer for Patch #3.
> 
> 4. Hyperlaunch
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D657187&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=L%2BbTDhvf4VEFLCFm9j14s8%2B4nBb39QO3ykeshD9hCNE%3D&amp;reserved=0
> Status: Need actions from author.
> 
> 5. [PATCH 0/9] gnttab: further work from XSA-380 / -382 context
> Status: Some parts are controversial, but this shouldn't prevent the
> reviewing / progressing of non-controversial ones there (7-9).
> 
> 6. [XEN PATCH v2 0/4] xen: rework compat headers generation
> Status: The 3rd patch needs reviewing by someone speaking enough Perl.
> 
> 7. MISRA fixes.
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D672591&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=VNurmeZaHbnKVm3qySTUeJ%2Fsnz8hVYH%2B6yj%2F%2Bi9m1O8%3D&amp;reserved=0
> Status: Need review.
> 
> 8. Config.mk: correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D670926&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=WtYYtGWNUPdIk0qbgndnq9dJiAoEztZj%2F6DGTx9J2Do%3D&amp;reserved=0
> Status: Need review.
> 
> 9. Make XEN_FW_EFI_MEM_INFO easier to use
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D670812&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=z4pu6ezw2gg8aBKQW4RK8VJZqkYiqB16G2x%2FQI7NOMw%3D&amp;reserved=0
> Status: Need confirmation from maintainer
> 
> 10. [XEN,v2] build: Fix x86 out-of-tree build without EFI
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D668331&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=DpWn9TxA%2B9lVbgAB8ruV3lxPNFdRmJuA5QaoTnW%2FRIc%3D&amp;reserved=0
> Status: Reviewed but not merged.
> 
> 11. [XEN] MAINTAINERS: CC Anthony on Xen's build system changes
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fxen-devel%2Flist%2F%3Fseries%3D667992&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C3f83f8ea3b134211740a08da8ef10c82%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637979463197936037%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=ivWh1KaJPkJKL6CNnte9KPJm5g%2FcKd2hhQjJ%2F99z9eE%3D&amp;reserved=0
> Status: I guess this need a v2?
> 
> Kind regards,
> Henry
> 

