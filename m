Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFDA7A6B2E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 21:08:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604978.942561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qig47-0006RY-3e; Tue, 19 Sep 2023 19:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604978.942561; Tue, 19 Sep 2023 19:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qig47-0006Pu-12; Tue, 19 Sep 2023 19:07:19 +0000
Received: by outflank-mailman (input) for mailman id 604978;
 Tue, 19 Sep 2023 19:07:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iEDo=FD=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qig44-0006Po-TK
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 19:07:17 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdd59c25-571f-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 21:07:15 +0200 (CEST)
Received: from MW4P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::22)
 by DS0PR12MB7993.namprd12.prod.outlook.com (2603:10b6:8:14b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 19:07:09 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:303:80:cafe::aa) by MW4P223CA0017.outlook.office365.com
 (2603:10b6:303:80::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.29 via Frontend
 Transport; Tue, 19 Sep 2023 19:07:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Tue, 19 Sep 2023 19:07:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 14:07:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 19 Sep
 2023 14:07:07 -0500
Received: from [172.20.57.36] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 19 Sep 2023 14:07:06 -0500
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
X-Inumbo-ID: bdd59c25-571f-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ic9WcLezYNiJB9CIKjtvo/zn9UZsnZo2gKR4K3Pki9D9V9ohmPhjePvdWfM/y4u/P2VLTKX3RYRWCY0BGNV6F1XNz4g66csFb7wx7dVpShf2MBfHmKwjeQo0n1Ip3YQY98HIGz4BRgHiymL5v8dPYG5q8sxieo2f6cl10pG+Osz6F9ED2ov/IRudwkrDqjL7QIaTPFfMWT2wF9ywc5A3BGbFck/OQHQIEkHCC5sUPsWG4+nYGUsnPeRk4AivwHU4GYRA/jmaZG/o2KpxNmIlq0s/qryAUEz/cueX6eC+7kHLS8xCwDxycww8Z9ms2fxKSX9PABgORiSW8qyOXIgFYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cei34lTLgJxE2ujWYeUw9/Bk1Q2jBkN7uBm8FIeCSDk=;
 b=kLY5MI4SkGvP47w2Av5LTuJWUoySnQbGWRkhPY8PKe5uV08vqvq1L4FckaB2a3T0YaCOCqnuMRX0yoQt/MHWIc6g2/x+a8nriSWtUiIKutLLh4oTMB0l3M00eDSOI1gZCi8RT1gVOHDToIu8dUHvgIXLyt613U7rTRCt4zWP/wNwBtQfYwFbATXxk8bBCXF9cnCFO9aGSTYaNADLkgihKWS0US3TVFFZE85IkPJiu/RQS36mkJNZ5IXzTLyNm20vmncT2rnAQOaBmHSDiRlcLC8vRF8NrgnnA5AHlxcFHgW5bi3qWxCvVqJADGQJccLDxXvM+0FydAvVJTURJavrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cei34lTLgJxE2ujWYeUw9/Bk1Q2jBkN7uBm8FIeCSDk=;
 b=x8fBFnkp9vauCS4PiCT/kcj9MVfOxG/7rAmMAHwxUMWOckFd1qNgvT8nZlorqXNPeWKeciI5pc/ARs8rb59E7ll9sFq/vw7SfIzIB5lhVLFqoge7jvsk4O8ysHyxMJJvJfdOxl6bsFQGo2NtgvQVM6E4I4zRpvESlnGgJAkX3Sk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <22c69940-8eb1-81bf-0c6a-0987712564eb@amd.com>
Date: Tue, 19 Sep 2023 15:07:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 0/3] ARM: ITS: implement TODO and fix issues with cache
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|DS0PR12MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b49d53-074b-4123-8bfd-08dbb9439fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l59idxqvzsQ40zEow48Q5Glc8EB7N5uacyVpHEKkU0TcO3WErjXnQgr07dfGTsrZ/ymhq/Jgk6CZJ2o61el5pJb5TesJlPuXEKb2uzgZCVN6eTcS7Qq1wIUdkO/qpIQQaHRPOtFMdkf6+iiYYY/VfeGDa9nhQsJIkNCUXGBRAFudy0o5pIYf7OPtyDVVNzzXG97OvKjwcge5xA0/XPD49o1lKptHp1uzcnTt8GOThI1G3BLHjD8RqvSyUMHTuHV+NFlKACr6m0cOXGfEcD09MgGor3hw/T0v7wnX5DK2zUGEGA6IX7UQ01iyOWrfXHAiZYZFV1KEdk6Pr9if4lA93XVQELwcyFDIoZPRMNuV3trbIpDrj3+5yxxEozZ2EeYvWwBAjUMWS7mHhHPS7d0cUrRLL74NnQu6gtEFuAu89750P08c3BsISJ7D6majvs4GYx+2a+O6mnVvT7CKO/XkUGoB+0f/8Y8vzXi/jE4/D2fTmUYDLzNuP7AT8moXT995n+TyVwhOS5RpIqjo+L+JhXI8uF9sjomkzCO2fZvQqI/iU7VOLCZratbthieV5JkF3HJfSEyEi6u4Xqai7Ci/ZKEpJ70sADmbHo4VTIWrppvNEaottXQb7QV8kdpWYshKhM7eq+Sh41/bETRZq415B8HDtP9N4ZeaSW9O44io7lxf+6R5e3pfJC4uArj/cpzISkSwTkul5+AOtztk923ZKJw9G0iBE3ZWPEyqn7F8sh7oz/o3hlHgUSlOF2x0TvTLxE3d9Td5R/45mXoEkA1sc5pnWswXRaUOZFrN+INBBWQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(82310400011)(186009)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(53546011)(83380400001)(26005)(336012)(47076005)(426003)(8676002)(2906002)(44832011)(70586007)(54906003)(16576012)(316002)(70206006)(110136005)(5660300002)(8936002)(41300700001)(966005)(4326008)(2616005)(40460700003)(86362001)(31696002)(36860700001)(36756003)(40480700001)(82740400003)(356005)(81166007)(478600001)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 19:07:09.4549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b49d53-074b-4123-8bfd-08dbb9439fad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7993

On 9/19/23 07:28, Volodymyr Babchuk wrote:
> Hello,
> 
> There were a couple of issues with GICv3 ITS implementation in
> Xen. From user perspective it looks like no interrupts are
> delivered. I observed those issues when experimented with SR-IOV on
> Renesas S4 board. In my case it wasn't a 100% reproducible issue, so
> it took some time and couple of tries to fix it. I wasn't sure if my
> fix addressed some hardware quirks of S4 board or it was a generic
> solution, so I postponed publishing of it.
> 
> Later, Stewart Hildebrand had very simmilar issues with his setup. I
> shared those 3 patches with him and they fixed his issue as well. So,
> I believe we need those changes in Xen mainline.
> 
> Second patch ("ARM: GICv3 ITS: do not invalidate memory while sending
> a command") is not strictly required, as it just provides a small
> optimization, but I believe it would be nice to have it in the code
> base.

I did a bit more experimentation, and the first patch ("ARM: GICv3 ITS: issue INVALL command after mapping host events") is not strictly required either for my particular test case. But the third one ("ARM: GICv3 ITS: flush all buffers, not just command queue") indeed appears to fix a real bug.

> 
> Volodymyr Babchuk (3):
>   ARM: GICv3 ITS: issue INVALL command after mapping host events
>   ARM: GICv3 ITS: do not invalidate memory while sending a command
>   ARM: GICv3 ITS: flush all buffers, not just command queue
> 

For the curious, here are a few more details about my test case. While testing the ("SMMU handling for PCIe Passthrough on ARM") [1] series on an AMD Versal VCK190 board, I discovered an issue with MSIs in dom0. The driver for the PCIe device has multiple IRQs, but only one of them was being raised in dom0: nvme0q0 was working, but not nvme0q1/2:

xilinx-vck190-20231:~$ cat /proc/interrupts
           CPU0       CPU1
  0:          0         92   xen-dyn     Edge    -event     xenbus
 11:      18084      11575     GICv3  27 Level     arch_timer
 12:         61         90     GICv3  16 Level     events
 13:          0          0     GICv3  62 Level     zynqmp_ipi
 15:          0          0  RC-Event   0 Level     LINK_DOWN
 16:          0          0  RC-Event   3 Level     HOT_RESET
 17:          0          0  RC-Event   4 Level     CFG_PCIE_TIMEOUT
 18:          0          0  RC-Event   8 Level     CFG_TIMEOUT
 19:          0          0  RC-Event   9 Level     CORRECTABLE
 20:          0          0  RC-Event  10 Level     NONFATAL
 21:          0          0  RC-Event  11 Level     FATAL
 22:          0          0  RC-Event  12 Level     CFG_ERR_POISON
 23:          0          0  RC-Event  15 Level     PME_TO_ACK_RCVD
 24:          0          0  RC-Event  17 Level     PM_PME_RCVD
 25:          0          0  RC-Event  20 Level     SLV_UNSUPP
 26:          0          0  RC-Event  21 Level     SLV_UNEXP
 27:          0          0  RC-Event  22 Level     SLV_COMPL
 28:          0          0  RC-Event  23 Level     SLV_ERRP
 29:          0          0  RC-Event  24 Level     SLV_CMPABT
 30:          0          0  RC-Event  25 Level     SLV_ILLBUR
 31:          0          0  RC-Event  26 Level     MST_DECERR
 32:          0          0  RC-Event  27 Level     MST_SLVERR
 33:          0          0  RC-Event  28 Level     SLV_PCIE_TIMEOUT
 35:         41          0   xen-dyn     Edge    -virq      hvc_console
 37:         17          0   ITS-MSI 524288 Edge      nvme0q0
 38:          0          0     GICv3 176 Level     sysmon-irq
 40:          0          0   ITS-MSI 524289 Edge      nvme0q1
 41:          0          0   ITS-MSI 524290 Edge      nvme0q2
 42:          0          0  xen-dyn-lateeoi     Edge    -event     evtchn:xenstored
 43:         19          0  xen-dyn-lateeoi     Edge    -event     evtchn:xenstored
IPI0:        30        101       Rescheduling interrupts
IPI1:      1888       1458       Function call interrupts
IPI2:         0          0       CPU stop interrupts
IPI3:         0          0       CPU stop (for crash dump) interrupts
IPI4:         0          0       Timer broadcast interrupts
IPI5:         0          0       IRQ work interrupts
IPI6:         0          0       CPU wake-up interrupts
Err:          0

After applying the patch ("ARM: GICv3 ITS: flush all buffers, not just command queue") all the ITS-MSI irqs work:

xilinx-vck190-20231:~$ cat /proc/interrupts
           CPU0       CPU1
  0:          0         94   xen-dyn     Edge    -event     xenbus
 11:       4928       3938     GICv3  27 Level     arch_timer
 12:         56         95     GICv3  16 Level     events
 13:          0          0     GICv3  62 Level     zynqmp_ipi
 15:          0          0  RC-Event   0 Level     LINK_DOWN
 16:          0          0  RC-Event   3 Level     HOT_RESET
 17:          0          0  RC-Event   4 Level     CFG_PCIE_TIMEOUT
 18:          0          0  RC-Event   8 Level     CFG_TIMEOUT
 19:          0          0  RC-Event   9 Level     CORRECTABLE
 20:          0          0  RC-Event  10 Level     NONFATAL
 21:          0          0  RC-Event  11 Level     FATAL
 22:          0          0  RC-Event  12 Level     CFG_ERR_POISON
 23:          0          0  RC-Event  15 Level     PME_TO_ACK_RCVD
 24:          0          0  RC-Event  17 Level     PM_PME_RCVD
 25:          0          0  RC-Event  20 Level     SLV_UNSUPP
 26:          0          0  RC-Event  21 Level     SLV_UNEXP
 27:          0          0  RC-Event  22 Level     SLV_COMPL
 28:          0          0  RC-Event  23 Level     SLV_ERRP
 29:          0          0  RC-Event  24 Level     SLV_CMPABT
 30:          0          0  RC-Event  25 Level     SLV_ILLBUR
 31:          0          0  RC-Event  26 Level     MST_DECERR
 32:          0          0  RC-Event  27 Level     MST_SLVERR
 33:          0          0  RC-Event  28 Level     SLV_PCIE_TIMEOUT
 35:         42          0   xen-dyn     Edge    -virq      hvc_console
 37:         10          0   ITS-MSI 524288 Edge      nvme0q0
 38:         48          0   ITS-MSI 524289 Edge      nvme0q1
 39:          0         66   ITS-MSI 524290 Edge      nvme0q2
 40:          0          0     GICv3 176 Level     sysmon-irq
 42:          0          0  xen-dyn-lateeoi     Edge    -event     evtchn:xenstored
 43:         13          0  xen-dyn-lateeoi     Edge    -event     evtchn:xenstored
IPI0:        78         77       Rescheduling interrupts
IPI1:      2513       2512       Function call interrupts
IPI2:         0          0       CPU stop interrupts
IPI3:         0          0       CPU stop (for crash dump) interrupts
IPI4:         0          0       Timer broadcast interrupts
IPI5:         0          0       IRQ work interrupts
IPI6:         0          0       CPU wake-up interrupts
Err:          0

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg00353.html

