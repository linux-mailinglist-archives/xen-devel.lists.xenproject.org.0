Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49028747C2D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 06:50:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558789.873188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGuT2-0000UF-Rj; Wed, 05 Jul 2023 04:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558789.873188; Wed, 05 Jul 2023 04:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGuT2-0000Qt-Nx; Wed, 05 Jul 2023 04:50:16 +0000
Received: by outflank-mailman (input) for mailman id 558789;
 Wed, 05 Jul 2023 04:50:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfY/=CX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qGuT0-0000Qn-NX
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 04:50:14 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c0fca64-1aef-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 06:50:11 +0200 (CEST)
Received: from AM6P192CA0046.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::23)
 by AM0PR08MB5474.eurprd08.prod.outlook.com (2603:10a6:208:187::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 04:50:08 +0000
Received: from AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::1b) by AM6P192CA0046.outlook.office365.com
 (2603:10a6:209:82::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 04:50:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT054.mail.protection.outlook.com (100.127.140.133) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Wed, 5 Jul 2023 04:50:07 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Wed, 05 Jul 2023 04:50:07 +0000
Received: from 5a05a42f66ca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 36360701-CEC2-428C-8901-A80CB4591DB6.1; 
 Wed, 05 Jul 2023 04:50:00 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a05a42f66ca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 04:50:00 +0000
Received: from DBBPR09CA0040.eurprd09.prod.outlook.com (2603:10a6:10:d4::28)
 by PAXPR08MB7598.eurprd08.prod.outlook.com (2603:10a6:102:23d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 04:49:57 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::e) by DBBPR09CA0040.outlook.office365.com
 (2603:10a6:10:d4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 04:49:57 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.23 via Frontend Transport; Wed, 5 Jul 2023 04:49:57 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 04:49:55 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 5 Jul 2023 04:49:53 +0000
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
X-Inumbo-ID: 6c0fca64-1aef-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swdTSp1OHz6pRb3lKWx8zNqhL4V6IYQGaNzcIZ1z1Kk=;
 b=Yms5JAln4EmeMW/1eSXcT88lg4DN/eQonHbH5f0ELhSbv6ZV4C+AwpHjd4qe5FkoC//24mat494gcAZbjqrEiuUQ4hV58x2sxh0OhwLGnJkk9HvuaKiEQ25gEZ8meXmh43JwkK4VWkfjElhstGfC3yu6c7YuTmFJOorRCMP4zGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 46063df358373e5b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQ3r7h9Ec9+J6k8O+nwdN7wDYOP3Ce5AW2jz2px7eFpbPzrM6CgHCh6vA+oyig/D3eXfY2p65srrzlctucAsn4uUNg2RnWLL+li+amqXMeI5FPY98KppbIkh0uNUO1LzetQrU0DwrJ0j1mRNwBhJeplqmU5lZxfccBHGgcI5Cx9UAZewwwNORVQhQTIjDv9k1a6GzuJHIC1dSIR3iDkVNS1m0zieQY/Y6XfaFntTSdAgalzukYDSO0ebG4bYsc7OZSD1YtW3eJf92HI+mZ4OXjphNy/78dCmYFCAPAIViItZgw7AC0Bh0wfNE6L9QTmP31ge9pBoS5TGv+UDzTsB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swdTSp1OHz6pRb3lKWx8zNqhL4V6IYQGaNzcIZ1z1Kk=;
 b=K1c/fXB+dKTlbrn0xTim7qg8p3hrt3Y0aXn0EpigZNa8owxSfYyARHe3ku+0tGWl/jYJHYb3Mwx9YxK2Fxjd/LZ1EvKS54Vj2iKwfF4ayjmidXvAs21w5PEfH7BWmZ4cIg79p45zL/uu7AuTBruuYKwOOKCbtLdUB1eF5+GVzZIRfxFzEEKHa6LuzudxlKcYW42ntQpqIXt7ugG3SqHaJmNa/cxCMGkBo61qkTNltlaUkDgGg7ZDxi/yXQpf7kZGuZn+L+1jLDUVNhvXHgqVIhv9uw4WEbQsRxYGo33C3jZcNh02lftm8sJWS5bRJkiKRQ5P4ObEsFWupiyKmtB/Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swdTSp1OHz6pRb3lKWx8zNqhL4V6IYQGaNzcIZ1z1Kk=;
 b=Yms5JAln4EmeMW/1eSXcT88lg4DN/eQonHbH5f0ELhSbv6ZV4C+AwpHjd4qe5FkoC//24mat494gcAZbjqrEiuUQ4hV58x2sxh0OhwLGnJkk9HvuaKiEQ25gEZ8meXmh43JwkK4VWkfjElhstGfC3yu6c7YuTmFJOorRCMP4zGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <7e73b11b-ae4b-a4fb-f9bd-9a95be41d664@arm.com>
Date: Wed, 5 Jul 2023 12:49:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 08/52] xen/arm64: move MMU related code from head.S to
 mmu/head.S
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-9-Penny.Zheng@arm.com>
 <39187006-6220-4b76-ada4-9e5be72b60fe@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <39187006-6220-4b76-ada4-9e5be72b60fe@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT057:EE_|PAXPR08MB7598:EE_|AM7EUR03FT054:EE_|AM0PR08MB5474:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c76ac5-939d-4c66-9fca-08db7d134e5e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 R9a9x4rfXeuBekK8D128efJR4uUKMQFrcoEdEh9ZNekKOko6k1bO/DnJO/zdkjqW85/Jzuin89K6lmRLl5pm9PY+eqAzsHv5bEoJB+MDn/yGg+69CAJTGrzf5a8AKEjYvylymAU8AXERJanqWACcWU71sdDFhIQM56U1+R6nsn/jXK3Sizma2o+yH0wVJZdX+/8EbIZcrEGay5AvpfhxnsmD2eXUfaKYwJKYq5G/xRHVUBJ4fY5KB4KEajJaVUxUyxGjqOcEgvlPCn5+p+pMQTNr7Qk//CTwmDt5hJmY2d7/EtjqztPLzQpcgv/2/PmLmmnthTzhO/QPOfQjkb1Pch+lnEy/LdavobigQpr2vzxhQUXEhsE7xOPFPZyTAGxlnWaXpgsZObZiS2an4m2x5XMkDV3ISplvsv2NFkwaErxX3dLE8QrXekxDWs8Dqf6YCryKYCcZzPyuoLBy/awlLw9XjCiDN6jkSM+roREHOqrcbsmsT0CnGhoJMwBhbGmNTDRRyJK3iTS4bVJ/fYA4VOPdBVa+sz1D+3Ia8tLafuuuKDVPLS0wRZ35s3fuC/7O3yiDb/ppEaDGg/EMJhi3yy+fVZtC9cDH5B5+xTa4s6v8IR9lFxqt6EYXzTd3lJHhzs/BRoRPbZJ0LcI1C98t/KczbpnVmxxJvx/cSKJWhBrM/Jo8Rc6eXL9kNup5YLiUB0w3qBS5IgPmwQB5ijG73cRD7xZ2BblpTS2oAttwZhfC89TgBz8i+YzTUtOXedPq5NUQMVgI/KLtE6+1tqTw81xbl5N5cpZee9J4vc/+Iarf8kL16GEjS6YXiQN1DTgVvAo9uLQY0YA2KTUR9J9vNxvFw4LuS8BomaCV4VFrqx0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(54906003)(16576012)(44832011)(26005)(53546011)(186003)(86362001)(31696002)(8676002)(36756003)(2906002)(110136005)(31686004)(8936002)(5660300002)(41300700001)(40460700003)(478600001)(81166007)(40480700001)(4326008)(70586007)(356005)(82740400003)(70206006)(47076005)(2616005)(82310400005)(83380400001)(336012)(316002)(36860700001)(426003)(2004002)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7598
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f613f3e7-d000-4c80-9070-08db7d13482c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hDyAPrPREbBVKAZJvEFBQq9qDZM82JvqJxhpIjX1ngmD0aL7MkYE8c7y+unR5RMM0Bg9JtUqU3A/q2WiXRVtgiv6JnomoETnAi0qLEOLzsYlY7baGHA94O2SUwTWy0lSgvhmbAIONUX0KvGk1vp8BsRevRc2DZuKY68lFjnF4Injfe04ThV9FuEnbdCSu/K1ffR9UlU5JYsb/d9A1ov8dp0n1XGQ9+1+obUWUYAKtHHc0gUdUmCfxBEXaND0MPHOIU2RzS1SkuuoTnt8mSZJqqU+NPj6PlNbCSInLi6wHU17tfnrSW9Ky5TL0RJfn9RdAx5pmXvoGLOcDcCJ7JppAwIGDLzGSKM4I2OKiZtIyTKnt5Ab/pZbGGguBSbRDG2Et9QG87eqiLz6e0DsrtpiwniKBUypRwVWpHk5CyRPvHo5eyp4AvjJBwz8LgtuDJ5YddSwUOgHuzxTw69gWprYLC3ObmJRVSQtGmrh4iZStI4XnHtnHrDqYIfFGEMHw4do4jqB6pOQx/YbkPWWAH7fUNGSAATb0YaXZYSxf/UmiMYYVWhEwikAwwIZMwwSBf5J97ixWntCwzV/bjaZHIuZN8C4adAigspiejCZUxw05sXYbw7SGZOJtR8FFM3/KkBN8Nhk59qBMQPsaKq/NhovgTgvU72OSRGHPqkE/m5GF8QfjoVqlQNsz7DsC0jn5jbT10OYy3uqcBTzzgb3FC2+NKQ9Lh2y4KD/0ygl37m3TY83bxAulhp7bMatVcfL5csUD5Tq3S5uRWYFh8Sw8/qiTx/NxHwumR8vkPIODmtU3C6ICKOg+XCBz/NzzvXpaeJFzlDmkQBLEWbBsmnX6MRtzA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199021)(36840700001)(40470700004)(46966006)(110136005)(54906003)(478600001)(26005)(107886003)(53546011)(336012)(186003)(82310400005)(16576012)(2906002)(4326008)(44832011)(70586007)(41300700001)(8676002)(316002)(5660300002)(82740400003)(8936002)(70206006)(81166007)(86362001)(40460700003)(36756003)(31696002)(36860700001)(40480700001)(83380400001)(47076005)(2616005)(426003)(31686004)(3940600001)(2004002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 04:50:07.5106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c76ac5-939d-4c66-9fca-08db7d134e5e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5474

Hi Julien

On 2023/7/5 05:46, Julien Grall wrote:
> Hi Penny,
> 
> On 26/06/2023 04:33, Penny Zheng wrote:
>> From: Wei Chen <wei.chen@arm.com>
>>
>> There are lots of MMU specific code in head.S. This code will not
>> be used in MPU systems. If we use #ifdef to gate them, the code
>> will become messy and hard to maintain. So we move MMU related
>> code to mmu/head.S, and keep common code still in head.S. We also
>> add .text.idmap in mmu/head.S to make all code in this new file
>> are still in identity map page but will be linked after head.S.
>>
>> As "fail" in head.S is very simple and this name is too easy to
>> be conflicted, so duplicate it in mmu/head.S instead of exporting
>> it.
>>
>> And some assembly macros that will be shared by MMU and MPU later,
>> we move them to macros.h.
> 
> Aren't those macros already shared between head.S and mmu/head.S?
> 

Correct me if I understand wrongly, so you want to remove the mention of 
MPU, and rephrase it to
"
As some assembly macros need to be shared by head.S and mmu/head.S,
we will move them to macros.h.
"

>>
>> Rename enable_boot_mmu()/enable_runtime_mmu() to a more generic name
>> enable_boot_mm()/enable_runtime_mm(), in order to make them common 
>> interfaces
>> to be used for both MMU and later MPU system.
> 
> As mentionned in an earlier patch, I would prefer if the name was 
> correct from the beginning. So this patch will be merely code movement.
> 

Sure. will fix.


>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> 
> I think this will need a rebase on top of the recent changes in head.S.
> 

Will do in the next version.

>> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
>> index 54ad55c75c..0c4b177be9 100644
>> --- a/xen/arch/arm/arm64/Makefile
>> +++ b/xen/arch/arm/arm64/Makefile
>> @@ -8,6 +8,9 @@ obj-y += domctl.o
> 
> [...]
> 
>> -/*
>> - * Macro to print the value of register \xb
>> - *
>> - * Clobbers x0 - x4
>> - */
>> -.macro print_reg xb
>> -        mov   x0, \xb
>> -        mov   x4, lr
>> -        bl    putn
>> -        mov   lr, x4
>> -.endm
> 
> I can't find any use of print_reg() in mmu/head.S. So is it necessary to 
> move right now?
> 

True, it is only used in head.S. I'll leave it here.

> [...]
> 
>> diff --git a/xen/arch/arm/arm64/mmu/head.S 
>> b/xen/arch/arm/arm64/mmu/head.S
>> new file mode 100644
>> index 0000000000..2b209fc3ce
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/mmu/head.S
>> @@ -0,0 +1,453 @@
>> +/*
>> + * xen/arch/arm/mmu/head.S
>> + *
>> + * Start-of-day code for an ARMv8.
>> + *
>> + * Ian Campbell <ian.campbell@citrix.com>
>> + * Copyright (c) 2012 Citrix Systems.
>> + *
>> + * Based on ARMv7-A head.S by
>> + * Tim Deegan <tim@xen.org>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
> 
> For new file (even split code), please use the SPDX tag. In this case, 
> the following line should be added at the top of the file:
> 
> /* SPDX-License-Identifier: GPL-2.0-or-later */
> 

Sure.

> Cheers,
> 

