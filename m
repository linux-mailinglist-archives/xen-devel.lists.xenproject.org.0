Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E2762C73A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 19:06:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444376.699513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovMn5-0004DX-S2; Wed, 16 Nov 2022 18:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444376.699513; Wed, 16 Nov 2022 18:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovMn5-0004Ax-Og; Wed, 16 Nov 2022 18:05:39 +0000
Received: by outflank-mailman (input) for mailman id 444376;
 Wed, 16 Nov 2022 18:05:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ql+j=3Q=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovMn3-0004Ao-DK
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 18:05:37 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20614.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43886eca-65d9-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 19:05:35 +0100 (CET)
Received: from BL1PR13CA0223.namprd13.prod.outlook.com (2603:10b6:208:2bf::18)
 by BY5PR12MB4998.namprd12.prod.outlook.com (2603:10b6:a03:1d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 18:05:30 +0000
Received: from BL02EPF0000EE3C.namprd05.prod.outlook.com
 (2603:10b6:208:2bf:cafe::8) by BL1PR13CA0223.outlook.office365.com
 (2603:10b6:208:2bf::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.8 via Frontend
 Transport; Wed, 16 Nov 2022 18:05:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000EE3C.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.11 via Frontend Transport; Wed, 16 Nov 2022 18:05:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 16 Nov
 2022 12:05:29 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 16 Nov 2022 12:05:28 -0600
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
X-Inumbo-ID: 43886eca-65d9-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fl5IrFFJTRxzoyjkoMtZjHt3+wDmXnY1aP+fuOM62RwlUYHIQ4hZN/aPFRkDBgYWLnJ8quP88uOCynAQNLo3usU7eC1UhvKkf+ZzMN7JipeBedJWxYvwMzZDN/Ws1NyRZNB1NgXhc9jNjTKSlrASJuFe+Iql6VcfoMayJtg4xopclCslfwt89uwt7WTVWPWL2TC9s4MKakiWE64RGXGdMvmINbVhqkqvzK3NA6BFI+ZRlnvFc7RkKKfNUFQzffRrsu1G1y1jNjaoXZv79fFv1YerzhOSHGdJCzeB7cGmqOQ8e1yKJRYa+bO1jKabiC3yMXfF1rY5Fxc9HPRfT59/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVPexwz1Mws6BNPqUDPpquCfnmsJJUMECnX7rTydxYs=;
 b=eH9ePeUxolmOQ0rjedG82mYWOZlCbLAybAT8tYSwMVKakTwnPFrOcF/jdd26bm0HcJYPzjWg8+UyVollB+16jZT0ppSOZcN5U+bzKg7LQ77xrmpbkWGMH9057+kVDlOHABuwAs3Flt/H495pwfTeQgoDc9M2Hm7icawTnzqBOmo6ySyaUekj692nhvyRVmqXbUK9hATx4oQpelpJ2MCPU+7M9YlAl0VznZJW0/7RY8wQG5/yFftRDJMBT4k712A/ak0+BjjBI3Rq6oom6Ts4na6tDFwduQR6jyC8y+k6mR3bjbIUrotrapfJOz6Br9/AI9wxxrnCgA2uTOo16GOIAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVPexwz1Mws6BNPqUDPpquCfnmsJJUMECnX7rTydxYs=;
 b=iDOHbU3RJ5KDo0ISQJBtEPdJQIJjYHhNSMkhOv3PBgFy+t+qKNAthvyWaMM7R3IK8ItcIJJfNQ2HC8WXrnUh5PLY5wznAQ2O3rXuOdsjnUfaBeHSR8HWzRmWQgApxlzQa3QzGyYd7tfBId+EqLPw0Bna66lfd6l3mpotTPBPUmQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <350afafd-821c-1a05-13cb-1704d3a61bfc@amd.com>
Date: Wed, 16 Nov 2022 19:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of hardcoded
 values
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221024100536.12874-1-michal.orzel@amd.com>
 <fd7bd57d-b7a2-8be6-cead-2903a6115f40@xen.org>
 <d472516a-6ba4-167d-6eed-e9a4a43f65b2@amd.com>
 <653bdfb0-2926-531b-bb56-d0797fbf3877@xen.org>
 <60cf8d8e-e4d6-2c8b-50ba-ab6c3fe7d84c@amd.com>
 <0400b2d8-6f2c-6406-d966-64ed5720688c@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <0400b2d8-6f2c-6406-d966-64ed5720688c@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3C:EE_|BY5PR12MB4998:EE_
X-MS-Office365-Filtering-Correlation-Id: d08b678f-ad85-4826-fabe-08dac7fd25b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BiG4sRpqIdPvX+efSJYOtLTYRPP/2JIk6mh2eHNMKgysPHkGY+fnpKke/hofDnJcUpuyJlgj7nV22kJmIWGYA4MYOjcERS4I0hck09HtXc7UJ/Y1u3uCuNs49q9wK5Shgh2EL+RPveRTZ0ixKxyk5781KZaKs+U7Ke/zhnZgOGt390/KZm2q/1cljLywpRzFKgdAQLIvUU3n3l7gBisG+WekdNOKG0ng5YsaVwmKRoJbn1iBBFwWbiOQlietS82QEeYLvCTWxsVeHrAidLiHSHNXcY+R4LNXfSapzCpjvqbNdZPHSFx4WwJaNnoE1mGFbnOevSc4KKmzTblxNveSTxt7xOtGgM1Fa7OOnYzZHZA8pWdP4F3AB3NKp19LTAxfsbPOTWjwzdBrZdeBVCkALjdCaXrP1EusR09wv08ZiEpbxG2zR7EcOMqhVum6r+Ui6usXBdr34WnCJpKLA0DXodrYMFv7EyEuChTFMD8rYVShks85DWFTAs+Qbcxcfl6ob8DMxvaPxB16kVfaS5nCYn5IEKA4v/b7lxUhcKUtqieJVpD4r7KRtAfy0NVTSpRA24uu7m5z93cJzEvuSs/iUtiwniaevTT+npR5Dqq62FV/kq+0RaGwkP9C1yu2QTmm57scHvhLshdh3hlQy+H9qilp6PIStFkPw20FLDMEKDWSpIGZWhqGfEsg8mFeiA7y3GfHQFKbK6hWnsLwJ2Rkv0KX4NY0dpSTUr1R11w/ID/mBLRZb1OApJTdIzk9Gk/vP/bpSQlnMytkh2VQ0etArU3jVV7KTA380nfhhQq0knZw6cnFs6lFtA8vILXFLvyEMV0T6H1DHZJlgBQDRMHMnA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(31686004)(86362001)(31696002)(83380400001)(36860700001)(40480700001)(40460700003)(5660300002)(2906002)(44832011)(426003)(356005)(2616005)(186003)(53546011)(110136005)(81166007)(47076005)(82740400003)(336012)(26005)(82310400005)(41300700001)(70586007)(316002)(16576012)(70206006)(478600001)(4326008)(54906003)(8676002)(8936002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 18:05:29.9436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d08b678f-ad85-4826-fabe-08dac7fd25b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4998

Hi Julien,

On 16/11/2022 16:56, Julien Grall wrote:
> 
> 
> On 16/11/2022 14:45, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>>>
>>>> and use it in the pl011-debug files (+ there is a question whether we should define WLEN_7-5 for completeness).
>>>
>>> I would not define WLEN_7-5. That said, I wonder if we really need to
>>> set the baud rate & co here?
>>>
>>> AFAICT the runtime driver never touch them. The reasoning is the
>>> firmware is responsible to configure the serial. Therefore, I would
>>> consider to drop the code (setting UARTCR might still be necessary).
>> I do not really agree because the current behavior was done on purpose.
> 
> EARLY_UART_PL011_BAUD_RATE is only used for very early debugging (this
> is protected by CONFIG_DEBUG and CONFIG_EXPERT). This is not a
> production ready code.
I am fully aware of it. I just found it useful but I understand the global reasoning.

> 
>> At the moment early_uart_init is called only if EARLY_UART_PL011_BAUD_RATE is set to a value != 0.
>> This is done in order to have flexibility to either stick to what firmware/bootloader configured or to change this
>> configuration by specifying the EARLY_UART_PL011_BAUD_RATE (useful when you do not know what
>> the firmware configured).
> The chances are that you want to use the baud rate that was configured
> by the firmware. Otherwise, you would need to change the configuration
> of minicom (or whatever you used) to get proper output for the firmware
> and then Xen.
> 
> Furthermore, as I wrote before, the runtime driver doesn't configure the
> baud rate. This was removed in Xen 4.7 (see commit 2048e17ca9df
> "drivers/pl011: Don't configure baudrate") because it was buggy and this
> code is not simple.
> 
> So it makes no sense to configure the baud rate when using early printk
> but not the runtime driver.
Ok, so we will get rid of EARLY_UART_PL011_BAUD_RATE config and setting the bd
in the early uart code. Now, what about setting "8n1"? The runtime driver sets them
as well as the early code. It can also be set to a different value from the firmware
(unlikely but it can happen I think). In any case, if we decide to do what the runtime driver
does, I reckon setting LCR_H should be kept in early code.

> 
> So we have two choices:
>   1) Remove the baud rate setting in the early uart code
>   2) Support the baud rate in the runtime driver
> 
> I strongly prefer 1 so far because there are not any practical use to
> have a different baud rate for Xen and the firmware.
> 
> Cheers,
> 
> --
> Julien Grall

~Michal

