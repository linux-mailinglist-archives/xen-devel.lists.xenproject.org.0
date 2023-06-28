Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E3740E74
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 12:14:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556415.868929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qESBf-0000hz-D2; Wed, 28 Jun 2023 10:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556415.868929; Wed, 28 Jun 2023 10:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qESBf-0000g0-AK; Wed, 28 Jun 2023 10:14:11 +0000
Received: by outflank-mailman (input) for mailman id 556415;
 Wed, 28 Jun 2023 10:14:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zt8O=CQ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qESBd-0000fk-Cf
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 10:14:09 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84826991-159c-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 12:14:08 +0200 (CEST)
Received: from AM0P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::17)
 by GV1PR08MB8130.eurprd08.prod.outlook.com (2603:10a6:150:92::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 10:14:04 +0000
Received: from AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:190:cafe::cb) by AM0P190CA0007.outlook.office365.com
 (2603:10a6:208:190::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.18 via Frontend
 Transport; Wed, 28 Jun 2023 10:14:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT052.mail.protection.outlook.com (100.127.140.214) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.16 via Frontend Transport; Wed, 28 Jun 2023 10:14:04 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142");
 Wed, 28 Jun 2023 10:14:04 +0000
Received: from 95d6c6da6128.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7097331F-2E8B-48FC-A293-FA96F832BB29.1; 
 Wed, 28 Jun 2023 10:13:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95d6c6da6128.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jun 2023 10:13:57 +0000
Received: from DUZPR01CA0282.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::17) by PAWPR08MB10210.eurprd08.prod.outlook.com
 (2603:10a6:102:367::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 10:13:56 +0000
Received: from DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b9:cafe::df) by DUZPR01CA0282.outlook.office365.com
 (2603:10a6:10:4b9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.18 via Frontend
 Transport; Wed, 28 Jun 2023 10:13:56 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT017.mail.protection.outlook.com (100.127.142.243) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6544.18 via Frontend Transport; Wed, 28 Jun 2023 10:13:55 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 28 Jun
 2023 10:13:55 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 28 Jun 2023 10:13:52 +0000
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
X-Inumbo-ID: 84826991-159c-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvGt607iE7681TxKu57G/P6q4W8FTDdZzeJJM8xPZJQ=;
 b=XryED17fnEidZIX+NzdOF6DX16svsBessiWXYBYybEetzOCkwc9QrQdWfhY3sawU0kTNK68hi4HzaqTN4edAgfMD99Vd5S9yjV60SaHtEuzE5Y55cHb81oBLM3rCSNrPBcGfmG4q1i3S40zLa8rmJ7RbRJXqYudlrJhdIqD5rMk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 71cb83595572bdf1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLb8HN3AQZVqZ7ktFxmYJbnXGpB7TZZEAynhQ27fZoAI9/mzFzHy5aR38efchq3efxPIm8SgBVTVDKWgBPLHCcEMH1FdJh4gRLP533XsnqdrIjm+F7EQhM5MNoG0Z03txsavuNgNmlDykOVsf169ewLE09JlJMjGXpMOkIJQEdzIuPGj4yjWvGmL4FT1JEPaIPnXLuS1gF2XnVF8ABT3knXYs+r7M41oTYx2NMkAJGRyUP8sjFq4bK/Pjt5VeoZ+ijKzYibcT3HXys99R6EGk+WlMRTaWD1H6aJo55I2fyzTNH0pOkyNuwVT4ToVqdGl0pDUQbA1N12eGvqdGE85FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvGt607iE7681TxKu57G/P6q4W8FTDdZzeJJM8xPZJQ=;
 b=gjgctThTpLulzeCbnWAPnrErspHOjWmzhT5oh1+rwtXpNXzTx+vuw2ahqkMxr3VggglzxAOk35GYmeLkM1+sVyOcGq5vr5zrfQputUDKAO0lkRRfCfPqVv6Af4vSuwfbu3ldqJ/D/x48XWgdKwBcodSPK9cJ9I0D4n7jwR2//jux81H84jCVDmGsLG7mEKipt6eFXke+RBPAc3Asrmax0OyzR3qLdc0TP/k3cW2lNHYkqaosHlv6N9BDjUK1Mq67uOW5nb7PbV76BLarnqY+W+MGns4PYUqq17tbJbs3IJBuQiheT8qsFYEAUbkItpa45R8wRj/PSCNSKupJj+rEww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvGt607iE7681TxKu57G/P6q4W8FTDdZzeJJM8xPZJQ=;
 b=XryED17fnEidZIX+NzdOF6DX16svsBessiWXYBYybEetzOCkwc9QrQdWfhY3sawU0kTNK68hi4HzaqTN4edAgfMD99Vd5S9yjV60SaHtEuzE5Y55cHb81oBLM3rCSNrPBcGfmG4q1i3S40zLa8rmJ7RbRJXqYudlrJhdIqD5rMk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <3f30dbd3-5530-e9d3-eae9-3cb6c3072bbb@arm.com>
Date: Wed, 28 Jun 2023 18:13:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v3 30/52] xen/mpu: populate a new region in Xen MPU
 mapping table
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-31-Penny.Zheng@arm.com>
 <864e467d-2ad8-7210-ca59-a9e34b95bc81@amd.com>
 <e6f8d79c-ab1e-565d-f87f-843af0cfbf48@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <e6f8d79c-ab1e-565d-f87f-843af0cfbf48@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT017:EE_|PAWPR08MB10210:EE_|AM7EUR03FT052:EE_|GV1PR08MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 309143be-d003-418c-f133-08db77c066c5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 i0xEzwj5i/26hZK6h1SoDKvTBk7bvRZQRvTx8VHg8moP2T1p+uNuXNepUfny+krJfN6sYaB5M0Hm9peBwitafseUVTN/8xqdviBSTzU6ozVsJzm4dnOXBHxuCw9CGvRvqXG21oIcymBA/JKPpbLUcOkRHsId+g4mfsg3yO1xQY2dpKz5WXDmvWmge3rY0asfM7gBGuZkF2bL6bARKbqk0DAeqY6tPDYJxPamJajsBKtqOHvYr/sG8rDTMZLQ4mEn+W6zeWTGNnOjyA9XwCpNPKH+dxBa8UtlVpHEgqz6Wbqi5+vlVkkr6rNqRdHyDo+AWAC48aZHA1P/bju9MdETcXSNKhpTV0dJVawPASnWl8sYO91V92gxf6fkCM27cRAM5tC8odmDum6YdP5L4t4c6Q/M+cidqQPBDAwhMwSixR0EAmCV5EW5EN9Jz2wN21j8bqZmtdM6Gj9A1qninDYLj2Taxr678DI5Ldf3ZkaaFKfkrKlrbWq3wslMWpZvDnTYVGHLUxc28fXeeBsF3l0M6J3tJzHnUgCeeDrJ0NQZygpGQ2Qxvd5cjpZj62NECyuPyEUm/exwBxqEplRiKva1Bo7kQVbQCxLDb+agNssjUribCsfQ5+Mlo9mHhHnD4fDi7PCgtA9nQrfsZUTe0QjbNE7lxZGqAMIK1JQMAbAw2Pvyd1C5NE2Z59tWCDyjkdLMU3Vf+os/tNH0HZYHOQ15j/LATo8oMg3IChXL1qVrpem1c3vfqZPMjkoll63RhhQhbgIgZ1g3n4vLXWZMn986p5wPObS2mnRPIEEvtopmeDum76KYM7Nc8VwzNXJ4+E4Pe0YiFj/DCmL0ce/Zspyi9BzGFgu5RMS0k51JIeOOWFE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(8676002)(8936002)(41300700001)(70206006)(70586007)(4326008)(316002)(186003)(26005)(53546011)(336012)(2616005)(110136005)(478600001)(54906003)(16576012)(40460700003)(966005)(82310400005)(2906002)(40480700001)(44832011)(5660300002)(82740400003)(81166007)(356005)(36756003)(31696002)(86362001)(31686004)(47076005)(36860700001)(83380400001)(426003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10210
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	568bb33d-b7bb-4e62-7605-08db77c061b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RnEFKNw8seG4TMCt1L45XZzyGX4kxMI1aHX6dxe+GOFnZjUs0laf9xzebEUIWo2Byl6qUGh2VAFBYqles984BhZ8A2c4CfncZ1hfTEv9dpWo/J69DtdXamQLaklbrB9TglhbBQ2uz018SMM6GGYhvNDxHpzbNaGpOhZrwvEabE81WVc26MQFFi9bvgCXtXZN/vmZpaubP58GY8XMhZ2JyZjPWh4+IMvOnJlb4EwbyMaNdxipI0KtEZ9ISgc3IiOnm2I45BD/sLI7INKNlL3jDuVsJ8ck53ezHUz4KM9GLb91Hw3d84f1L5pMBEGXpvdPXkX72bDNKEm3G7yZYr6SBPidcrxTgUB4eUDtOfhM4bMAib2159szityczOQVpbqWVaVCxBaguSgE9nr1867PaajrrMMimfbFGQ0H16P+wwhu/n5UuPudkfF0IZfECc/Z/6hkOoGTmFAXCiiItzQcFgcoFNVOmg0ZDS2y3gju4W+c+kt14S5VoLAUQqnrp3rNQ8ppyA58KJX0ykPYofg4gCxvoD7HFIbxzZNPgfMTiCdsXQeB7usQcTTqez4qQAMAj0UWE6ey5Qki2vwxQSPMkgOyUVgz0nb/TXntEGzU7VA0EKq7HwVkydFNjnWf2CqzpgD9QCI+Z39Bm5hm/PeKpwGHMsCocaZq08kpIxM4OoNZuKuqFAprUFq44Ji4ZKFXbE40MYJLWKxUkVVbB6Q6mbbto/KvXZrxlF6uwhAbGdu4zEVypnkdjjTzlP8K+mrjJ4/RVoIsjySTAmajfbdwb0ibmwD9NC+ZAElVqfUV5Rx+X/biGa3ZvgZB57KY6/x9MdaazGsL5iZLNxU7Qv+g7w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(44832011)(5660300002)(31686004)(4326008)(70206006)(478600001)(36756003)(316002)(70586007)(8936002)(8676002)(2906002)(40460700003)(966005)(110136005)(36860700001)(54906003)(16576012)(31696002)(41300700001)(82310400005)(186003)(40480700001)(336012)(86362001)(26005)(53546011)(47076005)(426003)(107886003)(81166007)(2616005)(82740400003)(83380400001)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 10:14:04.4262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 309143be-d003-418c-f133-08db77c066c5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8130

Hi Ayan

On 2023/6/28 18:08, Ayan Kumar Halder wrote:
> (Forgot to cc)
> 
> On 28/06/2023 11:05, Ayan Kumar Halder wrote:
>> Hi Penny,
>>
>> On 26/06/2023 04:34, Penny Zheng wrote:
>>> CAUTION: This message has originated from an External Source. Please 
>>> use proper judgment and caution when opening attachments, clicking 
>>> links, or responding to this email.
>>>
>>>
>>> The new helper xen_mpumap_update() is responsible for updating Xen 
>>> MPU memory
>>> mapping table(xen_mpumap), including creating a new entry, updating
>>> or destroying an existing one. It is equivalent to xen_pt_update in MMU.
>>> This commit only talks about populating a new entry in Xen MPU memory 
>>> mapping
>>> table(xen_mpumap). Others will be introduced in the following commits.
>>>
>>> When populating a new entry in Xen MPU memory mapping table(xen_mpumap),
>>> firstly, we shall check if requested address range [base, limit) is 
>>> mapped.
>>> If not, we shall find a free slot in xen_mpumap to insert, based on 
>>> bitmap
>>> xen_mpumap_mask, and use standard entry pr_of_xenaddr() to build up 
>>> MPU memory
>>> region structure(pr_t)
>>> In the last, we set memory attribute and permission based on variable 
>>> @flags.
>>>
>>> To summarize all region attributes in one variable @flags, layout of the
>>> flags is elaborated as follows:
>>> [0:2] Memory attribute Index
>>> [3:4] Execute Never
>>> [5:6] Access Permission
>>> [7]   Region Present
>>> Also, we provide a set of definitions(REGION_HYPERVISOR_RW, etc) that 
>>> combine
>>> the memory attribute and permission for common combinations.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>> v3:
>>> - implement pr_set_base/pr_set_limit/region_is_valid using static
>>> inline.
>>> - define index uint8_t to limit its size
>>> - stay the same major entry map_pages_to_xen, then go different path
>>> in different context(xen_pt_update in MMU, and xen_mpumap_update in MPU)
>>> ---
>>>   xen/arch/arm/include/asm/arm64/mpu.h |  64 +++++++
>>>   xen/arch/arm/include/asm/mm.h        |   3 +
>>>   xen/arch/arm/include/asm/mpu/mm.h    |  16 ++
>>>   xen/arch/arm/include/asm/page.h      |  22 +++
>>>   xen/arch/arm/mm.c                    |  20 +++
>>>   xen/arch/arm/mmu/mm.c                |   9 +-
>>>   xen/arch/arm/mpu/mm.c                | 255 +++++++++++++++++++++++++++
>>>   7 files changed, 381 insertions(+), 8 deletions(-)
>>>   create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>>> b/xen/arch/arm/include/asm/arm64/mpu.h
>>> index 407fec66c9..a6b07bab02 100644
>>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>>> @@ -6,6 +6,10 @@
>>>   #ifndef __ARM64_MPU_H__
>>>   #define __ARM64_MPU_H__
>>>
>>> +#define MPU_REGION_SHIFT  6
>>
>> You are using this macro in patch 24/52 and you are defining it here.
>>
>> Please consider moving the definition to patch 24/52.
>>

Thanks for pointing out. I'll move.

>>> +#define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>>> +#define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
>>> +
>>>   /*
>>>    * MPUIR_EL2.Region identifies the number of regions supported by 
>>> the EL2 MPU.
>>>    * It is a 8-bit field, so 255 MPU memory regions at most.
>>> @@ -21,8 +25,33 @@
>>>   #define REGION_UART_SEL            0x07
>>>   #define MPUIR_REGION_MASK          ((_AC(1, UL) << 8) - 1)
>>>
...
>>> +static inline bool region_is_valid(pr_t *pr)
>>> +{
>>> +    return pr->prlar.reg.en;
>>> +}
>>
>> A lot of these macros and inlines can be reused on arm32 as well. I 
>> have split them as follows :-
>>
>> Refer 
>> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/xen/arch/arm_mpu/include/asm/armv8r/mpu.h for the common definitions.
>>
>> Refer 
>> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/xen/arch/arm_mpu/include/asm/armv8r/arm64/mpu.h for the 64 bit specific definitions
>>
>> Refer 
>> https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/xen/arch/arm_mpu/include/asm/armv8r/arm32/mpu.h for the 32 bit specific definitions (This I can add later as part of R52 port).
>>
>> Please consider splitting the definitions so that R52 can reuse the 
>> common ones.
>>

Sure. I'll try to split.

>> - Ayan
>>
>>

