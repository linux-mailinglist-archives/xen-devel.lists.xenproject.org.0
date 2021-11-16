Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8B64535CC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 16:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226375.391183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0OL-0005ae-71; Tue, 16 Nov 2021 15:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226375.391183; Tue, 16 Nov 2021 15:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0OL-0005YV-3Z; Tue, 16 Nov 2021 15:29:01 +0000
Received: by outflank-mailman (input) for mailman id 226375;
 Tue, 16 Nov 2021 15:27:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TA58=QD=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1mn0Mj-0005Wz-9N
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:27:21 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [2a01:111:f400:7eae::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af27f305-46f1-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 16:27:19 +0100 (CET)
Received: from BN9PR03CA0128.namprd03.prod.outlook.com (2603:10b6:408:fe::13)
 by BN8PR02MB6002.namprd02.prod.outlook.com (2603:10b6:408:be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 16 Nov
 2021 15:27:12 +0000
Received: from BN1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::86) by BN9PR03CA0128.outlook.office365.com
 (2603:10b6:408:fe::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend
 Transport; Tue, 16 Nov 2021 15:27:12 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT015.mail.protection.outlook.com (10.13.2.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 15:27:12 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 16 Nov 2021 15:27:11 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 16 Nov 2021 15:27:11 +0000
Received: from [10.71.118.222] (port=55749)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>) id 1mn0MY-0000NX-Mk
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:27:11 +0000
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
X-Inumbo-ID: af27f305-46f1-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMExD0YLdexr+7al4TL9MScA8iMjhaAgQp79I2Wq/eKTwm4lF2Qy469G6uei9fs3NHXvM/XdCW38CNig7cv5DJyINok4Y66uBrzEjJDwdukAGplVFgR1MumwirtQ2sdsZMc6xEsQnVgOqYm8q5c6rgdzATh3wnjl0WTRijd3YFZa9VXWVh5x0KHhbZCFviFaj/dTl74X6kFOF9ssiAkhZsInrdiKxNFffiRkhccqxuo1sU3S0rrafg/5LK2K6AE/QCUcsf9nx5GCdWe5XztGQ2XHvSfKgZwSHpOS2Et25j/U616EAYbd1FIhlEacdzysFnVT/MzX3rqDoiieojDmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axw6WAFNmhkvoC3udJ+IHjNnRrtN8h0mwO/xm2If9nI=;
 b=CPu9phRrEaNywKYiKqLD1XIExf8wYUdZ+aP3/YsEsSgZibeHYHpwjlce71qaoDlJT3vPtWlREAiY5TmnKVWMxgKOCvoFYwvefDvW4S9DM7sIYgveHv1upk5fsDJTasI9aSIsmMnK4RM0q3fTcexoNeW+m8DGZSAE04qyVeqhiysmAQLYp1vdgum05hlTPEdZfjeleE5k7GbrBAGtECfhk7T0ZM025hNw8xcozqVP5dbe99vF84lXOLL6xmrpUMuPav4EYLwbYB9os7TD6XYZdzHk//yxIesVkUGF6R2tebQSCFl3ZGA/E0eGe+nif0gE+3+I8DrX7x1M6ohPkjR54A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axw6WAFNmhkvoC3udJ+IHjNnRrtN8h0mwO/xm2If9nI=;
 b=SuhHyEPsznBeQ9QAOE2pCfEx7QWnipXgM55kCePxCmaQVjb0YctGdbsKp9X1wOFDcuXO2uSc2xo2AyrgPwdzigkxLa7HvcAqUF70P2JfBlrfu17VvmMTvhHia24xbBLNMN03PY1pkab3zQRrmI13nhZRYqmHcJRR/HKRebdfnfg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Message-ID: <1489a1b9-aefa-0ddf-8dba-4a566388cc6f@xilinx.com>
Date: Tue, 16 Nov 2021 15:27:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
To: <xen-devel@lists.xenproject.org>
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Subject: Xen/ARM - Query about a data abort seen while reading GICD registers
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73bfa362-6bff-49f8-0aa2-08d9a9158fec
X-MS-TrafficTypeDiagnostic: BN8PR02MB6002:
X-Microsoft-Antispam-PRVS:
	<BN8PR02MB600274C2AEB3A4B2AF310143B2999@BN8PR02MB6002.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	szcw7KTXI2T53jaoDHq9EJPAzCSWSUmr3Ixx0Pj2f5OYdhgrx9PXOoyFZIMwH06lBNsCSRCdGASqnRCYLVIxq6O0iWtnZSAupPQycHtISg2/ianZXi+VVSBVIAAWPB5QI25mViiNyXOsuhTD7QwgYsD9SgOAIC8uAWn1+Z2MpEXB7aQbNXD/Hba+DkwXW0yPjTqzCRiN3Jg1tTFheclpqsjkmRTQbxetYfX31RRvlcoPUhxHwUfOnP0JgNM1oGhi5hIRDVdG4MiiIhOsrzYlIBxbmLzh0ZRUqStleCfVbUy6GGEwbAGHUJR4LkMS6A2WxzVj/Z4FnHAw+dSZIJlv0+m0x00z1P4pb6Ppo02D2AsCMijxYBVO2SqX9PEA5Vn+ekkp8IK8ktMrByxu2K9dkNTW9eqvRzghkQsPxM7tEYBgIe3EV4OAtJ5PFR+kMDrPVrUQU81sK9WdIWA7eloZ8ymYUyPTUHoQAkGjH4QgN+SYSRGUAgy8s8bAo2g3qZCQ5Ws85FC4KoCJ7V+QhLH2zRqyQXkAF5O4oQ4+POyIny6x8n02fGMm1Eyi5eXgVid+fo/FJ0r6s/QhIrlICUgsq0Fr+HdP2u2JWwA0k+0yo3hR2B0oviXK5gPBUCRQ0oyRLPcDkZcYjKWIWilpgHs+AGO58A0f8xHkHKrCEdSJrnG+/vN0NEmQGRYvrcx4katUoUvCzBktgPBoDWTiV2oOaGW6tMYQnhoQVWufk78qugV/tplf2oBdoGaSXCgNILhXBTI12ilnCB+W8XZ/yN3rXA==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(508600001)(8676002)(336012)(8936002)(36906005)(47076005)(356005)(31696002)(2906002)(36756003)(31686004)(82310400003)(5660300002)(70206006)(6916009)(36860700001)(7636003)(9786002)(426003)(70586007)(26005)(316002)(186003)(2616005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:27:12.1975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bfa362-6bff-49f8-0aa2-08d9a9158fec
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB6002

Hi Xen/Arm experts,

I am facing a very strange issue while running a baremetal application 
as a DomU guest on arm64 platform.

The baremetal app tries to read the GICD register with post indexing as 
follows :-
ldr x1, =0x3001000
ldr w2, [x1], #4 <<<------ PC = 0x40000ca8

And then I get :-
HSR=0x92000005 pc=0x00000040000ca8 gva=0x3001000 gpa=0x00000003001000

This problem occurs only while reading the GICD registers with post 
indexing. If I read the register with pre-indexing, then I do not see 
any abort. Alternatively, if I read GICC register with post indexing, I 
don't see the abort either.

 From the HSR value, I interpret it as
EC = 100100b # Data abort from lower exception
IL = 1b # 32 bit instruction trapped
DFSC = 101 # Translation fault level 1

On debugging, I found that the abort is triggered from

try_handle_mmio()
{ ...
     /* All the instructions used on emulated MMIO region should be valid */
     if ( !dabt.valid ) {

         return IO_ABORT;
     }
...
}

 From the Arm V8 Arm specs, I understand that dabt.valid is ISV, bit[24] 
in "ISS encoding for an exception from a Data Abort".


I saw that the caller is

do_trap_guest_sync() "case HSR_EC_DATA_ABORT_LOWER_EL"
where dabt.valid is false.
In the success scenario, dabt.valid is true.

I could not find the caller for do_trap_guest_sync()

So, can anyone help me here
1. Who is the caller for do_trap_guest_sync() ?
2. Any idea on what the issue is and how I can debug it further ?

Kind regards,
Ayan

