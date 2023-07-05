Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08596748180
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:54:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558992.873609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzCt-0004nu-HW; Wed, 05 Jul 2023 09:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558992.873609; Wed, 05 Jul 2023 09:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzCt-0004kY-Dh; Wed, 05 Jul 2023 09:53:55 +0000
Received: by outflank-mailman (input) for mailman id 558992;
 Wed, 05 Jul 2023 09:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfY/=CX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qGzCr-0004kR-BT
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:53:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7fbb26f-1b19-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 11:53:51 +0200 (CEST)
Received: from DUZPR01CA0342.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::26) by DB9PR08MB6522.eurprd08.prod.outlook.com
 (2603:10a6:10:250::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 09:53:48 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b8:cafe::99) by DUZPR01CA0342.outlook.office365.com
 (2603:10a6:10:4b8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 09:53:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.22 via Frontend Transport; Wed, 5 Jul 2023 09:53:48 +0000
Received: ("Tessian outbound c63645f235c1:v142");
 Wed, 05 Jul 2023 09:53:48 +0000
Received: from f5e93bac19ff.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 105A9751-9A5D-46F8-91EF-3AC2DF07EA86.1; 
 Wed, 05 Jul 2023 09:53:42 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5e93bac19ff.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 09:53:42 +0000
Received: from AS9PR05CA0309.eurprd05.prod.outlook.com (2603:10a6:20b:491::12)
 by AS2PR08MB9389.eurprd08.prod.outlook.com (2603:10a6:20b:597::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 09:53:37 +0000
Received: from AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:491:cafe::73) by AS9PR05CA0309.outlook.office365.com
 (2603:10a6:20b:491::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 09:53:37 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT029.mail.protection.outlook.com (100.127.140.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.24 via Frontend Transport; Wed, 5 Jul 2023 09:53:37 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 09:53:34 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 5 Jul 2023 09:53:32 +0000
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
X-Inumbo-ID: d7fbb26f-1b19-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NBN7ve4Cg99N+iX5JvrwNX2ZLUWx1ZwjzaCq0w36aM=;
 b=3kFxN2kRQWTk6Yy1twZuSO8dzAyOlsxlHAybB1ImQQSMzrThCyP6nayu/sPyG/RqE8lMNSnCZx+pXW0F2WC5xwUTtxuG8QeYQz08/4np8lJ2Z6pL3lBEo5YJz1b9b13hsjnItQFRKik3B1ABW6XCsm1a1Pk5uTFnxr+t1pLWE3M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f382e8da34336c4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJ6Zu4DdRcNG7ag/bSqwpH1FKPEndPCZywAVlkNVIzstzlDi2i62koWjO0j5lKiLtf4wBUH0/N51KPf6S5w2/G3MXdCB1crSFUq8FzZb8Tp+rw/xxEYD2KSPy26dVAUC7gFhZ9Lakw9Eyc+55HFocAa5p7IUdLNXKHETTQnTAv9gkGO+CfXN2PYrEjgS307h188bGRkbNr/OjUpti6RH1JNzExOOItD3Nu0pvZzEev1zKhTKDLFVzhPtJjOEGSNbwYOwT35hdCQ69GCdB1MlIGNGgwtVy4ciWGHSvskb9pjq+ojhJXbzGcLG/mtVYQ+5mm1KtlEB1Bt7F7GGlie1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NBN7ve4Cg99N+iX5JvrwNX2ZLUWx1ZwjzaCq0w36aM=;
 b=amSEuAoJyxEjLlTfba6jbjdzAtL7sXUUuWDxHn5k0U8Kki7WYEvS0vM7A4VSZ87siih1tFAfVaC0nXOcspzKGcZLtYEcpWy6fhMKaJXEjA/S4b4Wfq1TnNNyKu3Lci/bBVXzzLxYSDooByATQ/pQad0GRtT8BPSG6OaRApX4JTflhGTmpNUMbb0Ukxv6VXxww1bPitd4k4/myNOJkEWFp02tVi1oldDI9HwajubaT9hpNXCsIsnfIJCd6XxPdqZRL6Z7pXDLCkmzkVuR9vhKRoZJBxRcDTQM1FN0S4oepEfIOlWj7Nrz45uMo2YqoELu78VGuoKjr8IG2kbb4BxOnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NBN7ve4Cg99N+iX5JvrwNX2ZLUWx1ZwjzaCq0w36aM=;
 b=3kFxN2kRQWTk6Yy1twZuSO8dzAyOlsxlHAybB1ImQQSMzrThCyP6nayu/sPyG/RqE8lMNSnCZx+pXW0F2WC5xwUTtxuG8QeYQz08/4np8lJ2Z6pL3lBEo5YJz1b9b13hsjnItQFRKik3B1ABW6XCsm1a1Pk5uTFnxr+t1pLWE3M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <63c58ce7-08c0-e86c-acec-9273f48cdc12@arm.com>
Date: Wed, 5 Jul 2023 17:53:30 +0800
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
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <15791f2e-b4cf-aa60-3f67-d9e74877e54b@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT029:EE_|AS2PR08MB9389:EE_|DBAEUR03FT036:EE_|DB9PR08MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: 4237196c-5465-46d6-703b-08db7d3dbac2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cP8DjhzdoUANJaBiHmz7i/f1LckYjcQ8o9yUST6Y1BH+K3nJBydfGLteeDQ3s1+raXgD7ZNT3GrKHUfHFPni64tr06lUfuOhbGy9riH1AFzzFDDbbJ7PtGPurL484WP9lPRl4mbuxj3EsE4G88VD8BCWDnOIs7Q/h4+k907Fjvww69yF5BbTVQ6XMvbufmgPAXNUl1UjTapPrqrFxcqON3dZIOwGakZMfvN2ZoIapU1ubm4GklygJuueFxct4YkMe8WY+SaxXoTT8QszezI5veN9L8xuPXkVHx+XlSkamgaQwvHIA4UbaykwhM0l0lnvyqjr1Ph1ExOVhEpenMTwtxJ0sNSnUBV1uZwpM1tI54CtqPaOlD01nsO5Oc6KCRsP774529iz1fZ3Hfglk6RjcIfVHcK1owVxQB6/DrX2cFYRJSTVvvZnHKYyTo2+koIVuZifNUveHxp65tHlqOCWs2YTJEzjrDL1DZSjBPqlEfLCiWZDZ7DBpXblO9lb4Wiim33AYEOxS+mv5o+EFgpfJGSo/1vswnRDWYLxB1Y4VIDmZ9danSb8iFeGOneyEC8x2EtJ4z15gd2W6BnD+QxaVlPGgAV9/ICfZ2EMLXxADgu6j+h1YT2aJSNxnx/UyNkb37aQ4b7Qkw8Mx4oSb3aH7artM35ldTwbf7fL99xajc4ZZTSZy4+xdu09mLDGitRsBYaiBpmBWkBumZu/kf/DhGJkgETPUJWPHYlKOn7zdBo+7n8ytAeUa4/vLcESgBfS74CDLVTktAXSEsBXlsF5TwZVYJS1LN8VFnVlJd2qeX+/xVCYhlKQPy35F2JLDDL2zlPT6tHFAS6JzBRimuZelw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(31686004)(2906002)(82310400005)(44832011)(8676002)(86362001)(2616005)(36860700001)(31696002)(40480700001)(8936002)(5660300002)(54906003)(53546011)(110136005)(478600001)(26005)(186003)(336012)(81166007)(356005)(82740400003)(47076005)(426003)(40460700003)(83380400001)(316002)(4326008)(70206006)(70586007)(36756003)(16576012)(41300700001)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9389
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	efd54b26-6e4c-4f87-e3c6-08db7d3db426
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	riqTz0cbspTAPylX7RvmlGCd7EUR7wCipC1lP3TBNrjelNvywBEjvv2ekmGFOZ5B7o6JYnuVVd085AxTgKna93be4Vj+LmjypyCet1y0zDF9Nv1nBrfrxpLBSWQM/X5B+/HRldfP+ph2ze6Vm4Kpqv7Cf6THCyu/7Qvsw5dj6niCIJas9LsPJoRxbNQoSIHmw6JGBDPXhzobZdF8rl8Ku/TUY9c9UL5s7j3Y2Tz9DhCMg8KHLwOJpfgO6Ny6Wxs4UDTS8NscqrjNRz3T81/s2TgcF9cDqBTKtXr6m2wF9katUZL5gEOf24eo1D6/JvOvgfqwKNOBG05bJcWm9aya9zm0Uvw+c2YcoYkO+5a4HeF08pDAiz5Vk2Dstd3vhMONqbjwY7wqVO3uzouaIFzB78bpYdidbykIR6X1B4OI5v07TbM2ec6Vo5bDaV3cuuwPb1/NBtqYUsx3/9342mqaOtvXG9LZeLcASrjSs9SxaAuRRl4Y90b5mQfyAWbGnJ8Mvwtr/Suf7oPlwlyWbijFdkIhe4nDqPZgjjGrgL8+ZByIXSi5ZfvAlPb7iVaO16PnzgZ+6n9PCqKUmk+kBE/XQRVBFAxe2XLqm8FKrZf3xe2raDV4MChZJx78Lo7ztfB5PqE8H6SSeKK0qd1QrgIgHY9iSt17CvqYDqPpWDQrq4jl4JCEc2tbpLLgF9awlWeKs6cColRskFdSKGFMhpqmFkcaObE4jP2+xYc0RZcQSp8q1Ex3CnMEzHvqtkGfVWrtHFc1lnoPOQdQzQK9GS226dGu51ZEzKWS9yGj1/wrlZUZVDMjcvVB2pnl6PYqubHV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199021)(36840700001)(46966006)(40470700004)(8936002)(8676002)(2906002)(2616005)(70586007)(40480700001)(5660300002)(53546011)(44832011)(26005)(31686004)(336012)(186003)(70206006)(41300700001)(40460700003)(82740400003)(81166007)(16576012)(426003)(4326008)(36756003)(316002)(83380400001)(47076005)(54906003)(110136005)(36860700001)(478600001)(82310400005)(86362001)(31696002)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 09:53:48.2682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4237196c-5465-46d6-703b-08db7d3dbac2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6522

Hi，

On 2023/7/3 17:31, Julien Grall wrote:
> Hi,
> 
> On 03/07/2023 07:10, Penny Zheng wrote:
>> On 2023/6/30 23:19, Ayan Kumar Halder wrote:
>>> Hi Penny,
>>>
>>> On 26/06/2023 04:34, Penny Zheng wrote:
>>>> CAUTION: This message has originated from an External Source. Please 
>>>> use proper judgment and caution when opening attachments, clicking 
>>>> links, or responding to this email.
>>>>
>>>>
>>>> Xen is using page as the smallest granularity for memory managment.
>>>> And we want to follow the same concept in MPU system.
>>>> That is, structure page_info and the frametable which is used for 
>>>> storing
>>>> and managing the smallest memory managment unit is also required in 
>>>> MPU system.
>>>>
>>>> In MPU system, since we can not use a fixed VA 
>>>> address(FRAMETABLE_VIRT_START)
>>>> to map frametable like MMU system does and everything is 1:1 
>>>> mapping, we
>>>> instead define a variable "struct page_info *frame_table" as frametable
>>>> pointer, and ask boot allocator to allocate appropriate memory for 
>>>> frametable.
>>>>
>>>> As frametable is successfully initialized, the convertion between 
>>>> machine frame
>>>> number/machine address/"virtual address" and page-info structure is
>>>> ready too, like mfn_to_page/maddr_to_page/virt_to_page, etc
>>>>
>>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>>> ---
>>>> v3:
>>>> - add ASSERT() to confirm the MFN you pass is covered by the 
>>>> frametable.
>>>> ---
>>>>   xen/arch/arm/include/asm/mm.h     | 14 ++++++++++++++
>>>>   xen/arch/arm/include/asm/mpu/mm.h |  3 +++
>>>>   xen/arch/arm/mpu/mm.c             | 27 +++++++++++++++++++++++++++
>>>>   3 files changed, 44 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/mm.h 
>>>> b/xen/arch/arm/include/asm/mm.h
>>>> index daa6329505..66d98b9a29 100644
>>>> --- a/xen/arch/arm/include/asm/mm.h
>>>> +++ b/xen/arch/arm/include/asm/mm.h
>>>> @@ -341,6 +341,19 @@ static inline uint64_t gvirt_to_maddr(vaddr_t 
>>>> va, paddr_t *pa,
>>>>   #define virt_to_mfn(va)     __virt_to_mfn(va)
>>>>   #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>>>>
>>>> +#ifdef CONFIG_HAS_MPU
>>>> +/* Convert between virtual address to page-info structure. */
>>>> +static inline struct page_info *virt_to_page(const void *v)
>>>> +{
>>>> +    unsigned long pdx;
>>>> +
>>>> +    pdx = paddr_to_pdx(virt_to_maddr(v));
>>>> +    ASSERT(pdx >= frametable_base_pdx);
>>>> +    ASSERT(pdx < frametable_pdx_end);
>>>> +
>>>> +    return frame_table + pdx - frametable_base_pdx;
>>>> +}
>>> This should go in xen/arch/arm/include/asm/mpu/mm.h. Then you don't 
>>> need ifdef
>>>> +#else
>>>>   /* Convert between Xen-heap virtual addresses and page-info 
>>>> structures. */
>>>>   static inline struct page_info *virt_to_page(const void *v)
>>>>   {
>>>> @@ -354,6 +367,7 @@ static inline struct page_info 
>>>> *virt_to_page(const void *v)
>>>>       pdx += mfn_to_pdx(directmap_mfn_start);
>>>>       return frame_table + pdx - frametable_base_pdx;
>>>>   }
>>> Consequently, this should be in xen/arch/arm/include/asm/mmu/mm.h
>>
>> The reason why I don't put virt_to_page()/page_to_virt() in specific 
>> header is that we are using some helpers, which are defined just
>> a few lines before, like mfn_to_virt(), etc.
>> If you are moving mfn_to_virt() to specific header too, that will
>> result in a lot dulplication.
>>
>>>> +#endif
>>>>
>>>>   static inline void *page_to_virt(const struct page_info *pg)
>>>>   {
>>>> diff --git a/xen/arch/arm/include/asm/mpu/mm.h 
>>>> b/xen/arch/arm/include/asm/mpu/mm.h
>>>> index e26bd4f975..98f6df65b8 100644
>>>> --- a/xen/arch/arm/include/asm/mpu/mm.h
>>>> +++ b/xen/arch/arm/include/asm/mpu/mm.h
>>>> @@ -2,6 +2,9 @@
>>>>   #ifndef __ARCH_ARM_MM_MPU__
>>>>   #define __ARCH_ARM_MM_MPU__
>>>>
>>>> +extern struct page_info *frame_table;
>>> If you define frame_table in xen/arch/arm/include/asm/mm.h , then you 
>>> don't need the above declaration.
>>
>> It is a variable only in MPU. In MMU, it is a fixed value.
>> "#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)"
>>
>>>> +extern unsigned long frametable_pdx_end;
>>> Also you don't need extern as this is only used by 
>>> xen/arch/arm/mpu/mm.c.
>>
>> sure.
>>
>>>> +
>>>>   extern int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned 
>>>> int flags);
>>>
>>> You don't need extern here as it should be used only in 
>>> xen/arch/arm/mpu/mm.c
>>>
>>> Currently, I see the following in xen/arch/arm/mm.c,
>>>
>>> int map_pages_to_xen(unsigned long virt,
>>>                       mfn_t mfn,
>>>                       unsigned long nr_mfns,
>>>                       unsigned int flags)
>>> {
>>> #ifndef CONFIG_HAS_MPU
>>>      return xen_pt_update(virt, mfn, nr_mfns, flags);
>>> #else
>>>      return xen_mpumap_update(mfn_to_maddr(mfn),
>>>                               mfn_to_maddr(mfn_add(mfn, nr_mfns)), 
> You are ignoring 'virt' here. Shouldn't you at least check that 'virt == 
> mfn_to_maddr(mfn)'?
> 

Sure, I'll do the check.

>>> flags);
>>> #endif
>>> }
>>>
>>> int destroy_xen_mappings(unsigned long s, unsigned long e)
>>> {
>>>      ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>>>      ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>>>      ASSERT(s <= e);
>>> #ifndef CONFIG_HAS_MPU
>>>      return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
>>> #else
>>>      return xen_mpumap_update(virt_to_maddr((void *)s),
>>>                               virt_to_maddr((void *)e), 0);
>>> #endif
>>> }
>>>
>>> int modify_xen_mappings(unsigned long s, unsigned long e, unsigned 
>>> int flags)
>>> {
>>>      ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>>>      ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>>>      ASSERT(s <= e);
>>> #ifndef CONFIG_HAS_MPU
>>>      return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, flags);
>>> #else
>>>      return xen_mpumap_update(virt_to_maddr((void *)s),
>>>                               virt_to_maddr((void *)e), flags);
>>> #endif
>>> }
>>>
>>> It would be better to have 2 implementations for map_pages_to_xen(), 
>>> destroy_xen_mappings() and modify_xen_mappings() in 
>>> xen/arch/arm/mpu/mm.c and xen/arch/arm/mmu/mm.c.
>>>
>>
>> I prefer them staying in the common file, using #ifdef to go to the
>> different path.
> I don't like the #ifdef solution in this situation. You are only doing 
> it for the benefits of the ASSERT(). But they don't seem to have any 
> value for xen_mpumap_update() (you are still passing an address rather 
> than a frame).
> 

Okay， I will pass a page or a valid mfn next version.

>> Since if not and when anyone wants to update map_pages_to_xen(), 
>> destroy_xen_mappings() and modify_xen_mappings() in the future, it is 
>> possible for them to leave changes in only one file.
> 
> The helpers are just wrappers. I doubt they will change in the future. 
> So I think it would be OK to duplicate.
> 
> The alternative would to have a common prototype for xen_pt_update() and 
> xen_mpumap_update() and avoid any #ifdery. That said, this is not my 
> preference at least if they are not static inline.
> 

Correct me if I'm wrong, you are suggesting something like this:
A more-generic wrapper like xen_mm_update, and we introduce static 
inline implementation in mmu/mm.h with xen_pt_update(), and static
inline implementation in mpu/mm.h with xen_mpumap_update().

> Cheers,
> 

