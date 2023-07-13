Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B56D275199D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 09:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562957.879776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqZS-0006si-Jz; Thu, 13 Jul 2023 07:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562957.879776; Thu, 13 Jul 2023 07:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqZS-0006qi-H1; Thu, 13 Jul 2023 07:17:02 +0000
Received: by outflank-mailman (input) for mailman id 562957;
 Thu, 13 Jul 2023 07:17:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMFS=C7=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qJqZR-0006qM-9u
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 07:17:01 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2089.outbound.protection.outlook.com [40.107.13.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4178a50e-214d-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 09:16:59 +0200 (CEST)
Received: from DUZPR01CA0199.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::28) by DB8PR08MB5340.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 07:16:29 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::a0) by DUZPR01CA0199.outlook.office365.com
 (2603:10a6:10:4b6::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24 via Frontend
 Transport; Thu, 13 Jul 2023 07:16:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24 via Frontend Transport; Thu, 13 Jul 2023 07:16:29 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145");
 Thu, 13 Jul 2023 07:16:29 +0000
Received: from ff7fe6a1eec3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BC09B89D-1B83-4D68-836C-AFB1724E987E.1; 
 Thu, 13 Jul 2023 07:16:22 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff7fe6a1eec3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Jul 2023 07:16:22 +0000
Received: from AM0PR10CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::26)
 by VI1PR08MB10102.eurprd08.prod.outlook.com (2603:10a6:800:1cf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.36; Thu, 13 Jul
 2023 07:16:15 +0000
Received: from AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:150:cafe::85) by AM0PR10CA0046.outlook.office365.com
 (2603:10a6:20b:150::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24 via Frontend
 Transport; Thu, 13 Jul 2023 07:16:15 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT042.mail.protection.outlook.com (100.127.140.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.24 via Frontend Transport; Thu, 13 Jul 2023 07:16:14 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 13 Jul
 2023 07:16:13 +0000
Received: from [10.169.188.57] (10.169.188.57) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 13 Jul 2023 07:16:11 +0000
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
X-Inumbo-ID: 4178a50e-214d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oymRyCwfeCV/d39Of32f4qMPRSzv2CrD7IDJ53f++YA=;
 b=W+rQvUq7UGzrNqxzVmD5O1zjLFRADmcmPrwmcoIk5efFHIqH59mJyrCwBLOJAsHz1CUVKkmW9uGceqoo5XoF10eewszPUP0CMtdVchmNDjJes07YPthjfl0WLUtwP3HWH5MyMMVsxJnbyRRiyzR1kBK1Zy71Z0N+i0FSzWjBdLg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2912640809e4b62c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxP6mrVm3d4NQfzBTpNu7bUsgL3e37bPDOCfoau6TIiWGV4ebsfIwwtFz+N68pkwyz74ZXJvDLC/WIkv22kK0UF1P6ua4NgFKl4RFVvT5ORw0VaGC+xCae6fGtPL66AhGHUrKlu5NfXc7l4/EHc50CpN6VjAnwjEo5tUWkCgPrcCU4NuDT3FzU9vgVxTYa9YvO9N0XcTNiH94qxMdXpwxnq+NGoU51YQShJp3lxv5eL51s/V7PBfsmZ1124DTp8FQrR1tvVE8vRzfwil0/LEsaRdRxUZFAyT+ipKzWkX6V1ocjFh2njIOgJrbkJbCLMgs1KHBt3fMgKIYsYgloYs8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oymRyCwfeCV/d39Of32f4qMPRSzv2CrD7IDJ53f++YA=;
 b=lPP5dqd+WFuA98d61ELGSbQiesHLBswzX3KotRYFg2NOAIeL5ohbrlhU6bPLq03YiZMy2zpiqxRKLQ/4VfxxHVMTBoTIKIp6el5uY8BrUeZBrGvX86iYSvLrbZsKhJpJ1h/XROBDoMOKHlkKpw+phb4KhcEt2D87L9uvjx1w8xzVJ6pt9WFgO3aNTgcdcXArmx8rWKFZk62ph+ta/Ia+y+HDxLTc5l5xO7PiIACwIR9iJwLx1VnZa0XwI9joDZDOyHtZnoJfDm7HogNe7jbnPK6TCPIZuQ6u3g9Kq/fPViYHP6Ecr9CMdymC4ZJOZ6qrB3wHXTpOG20TgzhxXjqwIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oymRyCwfeCV/d39Of32f4qMPRSzv2CrD7IDJ53f++YA=;
 b=W+rQvUq7UGzrNqxzVmD5O1zjLFRADmcmPrwmcoIk5efFHIqH59mJyrCwBLOJAsHz1CUVKkmW9uGceqoo5XoF10eewszPUP0CMtdVchmNDjJes07YPthjfl0WLUtwP3HWH5MyMMVsxJnbyRRiyzR1kBK1Zy71Z0N+i0FSzWjBdLg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <532695f6-639c-5993-d0d0-95b3305f9c62@arm.com>
Date: Thu, 13 Jul 2023 15:16:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 33/52] xen/mpu: initialize frametable in MPU system
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-34-Penny.Zheng@arm.com>
 <ee709651-a6fc-2485-ae2b-edf0306fbc13@amd.com>
 <db707ef1-cc91-bc7d-33d2-bf804ece2226@arm.com>
 <15791f2e-b4cf-aa60-3f67-d9e74877e54b@xen.org>
 <63c58ce7-08c0-e86c-acec-9273f48cdc12@arm.com>
 <3114b76e-1cf9-12ef-d83c-76c566009e71@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <3114b76e-1cf9-12ef-d83c-76c566009e71@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT042:EE_|VI1PR08MB10102:EE_|DBAEUR03FT048:EE_|DB8PR08MB5340:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a3ad3e-e4c5-453a-b211-08db837113ea
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nkbznO+gqvea50iOzN5nr2Zgc7ly06xqEolNirlIqv4nU94locH7x7+2/5lSbSBiwXSakg/YbQR6kMhOeLQGqeH8jHYD7oqkN/HoBycEhxAKhstZqpHIc3ABk4hjkp2gttNPmwmi1DmJz5cHwiuT7BjzsYCazbRRIF1pq156trdEzF2g1qclxlaSyRsVI2LZI7lyhPceqiRnIP/hc/zB83F0jwU/z5MHpLiUtNTGVRD8EYV4kW3CdNbCWtaRDmH6KObSIwwkS5f4m8vnzeNWnX4/TrLr398B00PXp0u/vwgbNu9HT2ZDJh7OAj/CPUEf1l9h349p4YMC73yBb0nukUnknhLHxPwc3Qp+K0Oip2+vY3SRzrw+7FWRfCOh0fDbu1eNqM04tuLKJ7/PRtjzyG5qlkchkp7LaLkNt3uLbxoDij7buQ4JGRVPceUteuR6n8UAClKtSa4IHjn8Zf/jKN4JQ7nePu1bxcZ9tGMs1RCJH8r5EIEWui7DMBGmMnBPR6Ta1iLU4CN6wNGI6eU6eMFwSOEQZINFAQRsyAXKQ/qhQtLTSHEvt+gFFpo+zk5R80Pqm/DGZ6rS7pugJLbRFp9QJEwgidxnuAyaZ2W4BtmGMQ71KR0JHpJG0iBTeUa2w9FjJN/w6bf6+j9ou0Kk4ouGQEwb6djqdsIIjM67OKkNa0Kt2Qg8UQdD71qi4zLYxO4WJMBlt0VZdMPppEUhwP89xLMzsGhm/Yeg2WQoBTbsU1+YDAVqIOjCYaNSVFVv8I8Wlsrep+s++kW7sEkdbqCE5v7gNoxynY2aO5nsjwHe2wQY+4Dj7p9UhvmLbffGuyST+4ONXHqMPe7j4TDfGg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(46966006)(40470700004)(36840700001)(83380400001)(2616005)(82740400003)(478600001)(47076005)(336012)(31686004)(186003)(426003)(36860700001)(53546011)(26005)(40460700003)(4326008)(40480700001)(70586007)(2906002)(86362001)(16576012)(316002)(70206006)(82310400005)(41300700001)(31696002)(36756003)(54906003)(110136005)(44832011)(8936002)(5660300002)(8676002)(81166007)(356005)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10102
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	058daa77-1c2e-4197-be21-08db83710b59
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b+dAD0/7n775jHT+BUN+OywdzNerLR3LhYP0+pOt0AZaWhPJMxJpHMoROCHjDsNfXFAzV3sGda6Mtu7w4L5nG5CzyRDI9dF4qKYliaWWP/lIrQZOXPLX2MayAsb0jYcFxw9qYmt5Yf/86fVNjezMRMne5enxBNgPe4NGNq8x0b0kODtA+wjLk4tqr++qFx9Ty6Pr+jjxEGBTJhHMUx4Tl3AbsjaP+TxKzn6BREXrsOD9eN5yuxNQ5aDAEWSbPjc20Y0ryuVcI/FDoMGF1yKms0jGhzSiY+DUaAn0BfpnYWx0SCsz8JuX1L/kUTuwKCeu8Z8N3xoYgfRi4/1apeU2xONSwkIJTq4tNxD+ioHQE0eAxKe+ucETk9FYP/Iw2sU8wa4yrro6lT46CuDAwFst64BhY1g+c+y7pP7ZNwuL2MIe3B2sTeujHtmglhwg4S5B44rh+U+cFRb59mk4djqlo1k8i/tp/cQJ32Us9OqhWZgHy7XEZ/v4PC2omu+sogddH2KKKUxW6yWqI3JGYOF5Y1ZKUXhuz4RLajv3/b49Q5sknCt6uxjashj2MDcl5BsOSG1ZXJMxPvLOmY8rvwWfTqoMnBel4XK3bUQRgHvdiJMIQ6azxPfaxTfMFgBguMdKnRXd9ct0dbLxXN22h4yq8+bsYMUM3UXGEl/EurccqbSYLfx4VgLEzDHJ+DmP83gjOMqEEEoCzqzu/rme1U0IQ4CD9wpw57413xyj6OuIuY/FyEw7MY0uxz3eyEL/chazj1YpuQxXx/agJIEyzhx3JhjQ47mmheZfHIWsSzKZggo6IaJG8iPmgkZ/U6kJm5Tb
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(36840700001)(40470700004)(46966006)(44832011)(70206006)(70586007)(4326008)(316002)(2906002)(41300700001)(478600001)(31686004)(8936002)(5660300002)(8676002)(110136005)(16576012)(54906003)(36860700001)(40460700003)(40480700001)(26005)(53546011)(426003)(186003)(36756003)(83380400001)(336012)(47076005)(81166007)(82740400003)(86362001)(2616005)(82310400005)(31696002)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 07:16:29.1592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a3ad3e-e4c5-453a-b211-08db837113ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5340

Hi,

On 2023/7/5 21:52, Julien Grall wrote:
> Hi,
> 
> On 05/07/2023 10:53, Penny Zheng wrote:
>>>> Since if not and when anyone wants to update map_pages_to_xen(), 
>>>> destroy_xen_mappings() and modify_xen_mappings() in the future, it 
>>>> is possible for them to leave changes in only one file.
>>>
>>> The helpers are just wrappers. I doubt they will change in the 
>>> future. So I think it would be OK to duplicate.
>>>
>>> The alternative would to have a common prototype for xen_pt_update() 
>>> and xen_mpumap_update() and avoid any #ifdery. That said, this is not 
>>> my preference at least if they are not static inline.
>>>
>>
>> Correct me if I'm wrong, you are suggesting something like this:
>> A more-generic wrapper like xen_mm_update, and we introduce static 
>> inline implementation in mmu/mm.h with xen_pt_update(), and static
>> inline implementation in mpu/mm.h with xen_mpumap_update().
> 
> Yes as an alternative proposal. But my preference here is to duplicate 
> the helpers in mm-mmu.c and mm-mpu.c.
> 

Understood, I'll do the duplication.

> Cheers,
> 

