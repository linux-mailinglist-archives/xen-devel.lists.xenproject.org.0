Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61109740BC0
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 10:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556364.868831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEQjt-00037Q-E6; Wed, 28 Jun 2023 08:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556364.868831; Wed, 28 Jun 2023 08:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEQjt-000345-Ai; Wed, 28 Jun 2023 08:41:25 +0000
Received: by outflank-mailman (input) for mailman id 556364;
 Wed, 28 Jun 2023 08:41:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zt8O=CQ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qEQjs-00033x-1f
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 08:41:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7d00::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dd1ab58-158f-11ee-8611-37d641c3527e;
 Wed, 28 Jun 2023 10:41:20 +0200 (CEST)
Received: from AM9P250CA0026.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::31)
 by AM9PR08MB6036.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 08:41:18 +0000
Received: from AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21c:cafe::b8) by AM9P250CA0026.outlook.office365.com
 (2603:10a6:20b:21c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.34 via Frontend
 Transport; Wed, 28 Jun 2023 08:41:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT013.mail.protection.outlook.com (100.127.140.191) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.16 via Frontend Transport; Wed, 28 Jun 2023 08:41:17 +0000
Received: ("Tessian outbound c08fa2e31830:v142");
 Wed, 28 Jun 2023 08:41:17 +0000
Received: from e64ec6806c7a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5867DB8B-9FAD-4342-A2B3-D161D1DDB0B1.1; 
 Wed, 28 Jun 2023 08:41:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e64ec6806c7a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jun 2023 08:41:10 +0000
Received: from AM6P191CA0075.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::16)
 by GV2PR08MB8049.eurprd08.prod.outlook.com (2603:10a6:150:ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 08:41:07 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::b7) by AM6P191CA0075.outlook.office365.com
 (2603:10a6:209:8a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19 via Frontend
 Transport; Wed, 28 Jun 2023 08:41:07 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6544.16 via Frontend Transport; Wed, 28 Jun 2023 08:41:06 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 28 Jun
 2023 08:41:06 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 28 Jun 2023 08:41:02 +0000
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
X-Inumbo-ID: 8dd1ab58-158f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kec2iNBqSnaFv2sP0scr0R1i3SyFtLZVqLlXqhqnukg=;
 b=A6fJDDGeNrtFKbrTnzj+nfSE2qAu8ad1OS+SknppopUu/eU5rWdkC8p6Lj1/erDjQSjgb3Beu4k647oltmPlMFFMt80SitcctDLmOINOeOsXLx27Y/3vdKmtdq6XzZy7L2tGpGWvjUskj2OxYB1qC2faWPu8HE+Nz+Gj3ieLa1Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3576ed5d19b7ecd3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aImCt8MNa2qoS7ss/oVkMlSgMUemBGHOOhGNrK//DGNvgSz3LJCrljaT7ApS1Dbxb2xc/B4DBiPyMJ9iqB2k7gGLCndSRPjJpgO9SYFr8TAnwpUd39RiZEW+bFFnguMOseZwWMY/OVQEKBh77NSqXQIizrxFLkJuIYKzgmjwjcE87XTkrZT5FItqyMkxJXfTP/3n4bU1+42qQQpl4rgdlnAJVUSWByznhwq1AHx873UvhGRyF6mTl/9L424vWr9Bsb2q73QZ1q13gzV2EvyoAeuu2/0rYYb/AcG0Grarl5bQMNqRXkbCHkfDZVWvbnGH5OgG9YZ2I63VfDgiuQ7gxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kec2iNBqSnaFv2sP0scr0R1i3SyFtLZVqLlXqhqnukg=;
 b=LkcSO9T9B/aYJRBamjNypXKP9qy9+n+AntncHnjhvSwhYF3GOkD/MDQlYlJbebVr2ZS3IDSiyzfxmXyCL/wUc46pn643ashyLr1q6cedR9ZMT4fjYqEmzTSNlk/PVQlotJUIbSEU4BGuEen3ezPUdKXlC5SAVW1ATkEHRULGNZ6GgFLLXOmYIAXgpVVVzlCjlxy0D+mnTwK/GZn31/SgykGaK04RjO8sH3rN3F6Ct8NlVns5Oow9mo1G2CtZNY68bytuHZ3LbEq1/aqkSP1PElKe6eb+PAfAH9oPL1VaHyw8MW9AwIXddQRp08MoB89/zzVexu0YjZlszU21peFHzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kec2iNBqSnaFv2sP0scr0R1i3SyFtLZVqLlXqhqnukg=;
 b=A6fJDDGeNrtFKbrTnzj+nfSE2qAu8ad1OS+SknppopUu/eU5rWdkC8p6Lj1/erDjQSjgb3Beu4k647oltmPlMFFMt80SitcctDLmOINOeOsXLx27Y/3vdKmtdq6XzZy7L2tGpGWvjUskj2OxYB1qC2faWPu8HE+Nz+Gj3ieLa1Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <37124ccc-3cf6-6632-4b2e-d23072de9128@arm.com>
Date: Wed, 28 Jun 2023 16:41:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v3 15/52] xen: make VMAP only support in MMU system
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Chen
	<wei.chen@arm.com>, <xen-devel@lists.xenproject.org>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-16-Penny.Zheng@arm.com>
 <654c9925-565a-80d4-5e93-129f6f0f691a@suse.com>
 <7d3ff868-60a4-1eab-0b9b-f6ca649cfdeb@arm.com>
 <c8ad27d1-a14d-b897-7557-a4770344734d@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <c8ad27d1-a14d-b897-7557-a4770344734d@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT040:EE_|GV2PR08MB8049:EE_|AM7EUR03FT013:EE_|AM9PR08MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 63142483-fbe4-4630-d868-08db77b370b0
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 q63NeYjAmShoQHrsoGleUfCLlj2UfhM+Nu0yVPTeR8bFlfRpyTnms88ZzTRDwRKbUZ5kMlxyoPB6ZrEuuj1aRWzFMtYT/L6aXK3xKs8oWCel5tJgba2Ze+KKQygShJX6mm8zA0ObjcWwtd+dxmOQmOmIB42EB/hvmNdpiD8TmBZNzVnuP06nXdY2DkES6i9LW6GJArNePLoT+SQ2Ay5VlOXeqgur3+7PnTGAyoNG+BlE7FZN8/hHZFPWB+9Z9xQIPNOucz+S5g2l9eDXcDBzGbz9UE7kYKVfFRKj9n3w7fZLYoDlngLogYgCfwJR2ZqVhzuk0IrUtUYRzh0Viz6GdSCxSZ/8h4BEKm713nwMqi2WsW2x1kQgduC2SmEC30d+glRS65n8VBuO3153zjE/mQl2UV3dtCrMl06KDFH+i4KrhZBdF+Mt0PrlcHkYXtPDjxPkF/W8xQuhBHwz4AR+C2IN9J+rbP/9OFWcAr830tVNqEf77SnMyaL+YX7DdaomCFFOgfP706bMvmmN0NjyUrJQoDmHdr7rR2nmA+uN28JYymtUH3q7w3SzpN8XjaEDMo5+1yqyA+u1yOLKP7nzPLTR0mg/yPw+ZcfNpAa/J+5vYx+oK4O1JkIr/CZ2YDbSag5Z/ictMWf+wwkmO0BoaiNRkQDjItmFZ4JoLhGh9lbO+azDdQr0M9wQJmrY7UcBbJe+N3GSg5Ao1l+0ZzWCzDncBLuJhDP4ReXIHqpmbDujoJGN/tFuawAtYUFgIQ9qKsuL2UNq2/jALIlutQPAJuExNfdHbx8IAx9qZX+sjfPBuvEU3gcxP3JOazVvFrDFuJQB7NN5yZ3uH+qM7cgYILgoZUQMiY4mEBinwr6Y0Rk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(44832011)(31686004)(5660300002)(316002)(478600001)(36756003)(70586007)(4326008)(70206006)(8936002)(8676002)(2906002)(186003)(40460700003)(16576012)(36860700001)(54906003)(110136005)(86362001)(82310400005)(31696002)(40480700001)(41300700001)(53546011)(26005)(47076005)(426003)(336012)(81166007)(356005)(82740400003)(2616005)(21314003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8049
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9e31b32a-eab0-4551-a2b6-08db77b36a40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c6npeWF+tcX2nGEbvvNHelYzo9SHCnjqRdV/1saMHIKs5Kxs2enbOcScHmyS5lBW+1f5Cg7U/FUhqLybnGrFZJNhdu1+7hMyJdk311Ce1pVy4EcdBtALLQ0T2mzvtzyUC5jKaPb9okejlQ6V7iPYQcMBMrPSIX8QF6fQy/QV0j8pe1QMH8OXBHwcPdWXvlp1sUktK7HEvya1cpcYXjPvYMWuZ3RCSi5otwq1Il0Yw0cCUq6NsCHBoOm4NoWmO2OTlmMK2mtAbkO74LqBsU5ezcy5tYt6fsdxELNJyO99H96IMW0BQLLQTglAexuW0LiHRUa/9p9hJr7fYq6kDH6Kw1zgQPkHYJ6i7Ko//5Kde1asRj2G2Z3DXTfUUiPwYzJUHP5naxMuBtjvSqZqH/QGAcRO4b2fwvNBFCv1dzHhU/lN4YzCZNSBmux++c3PYeJpCbJv+cgb3LTAOUVzOXQSJ65cUPz3l6NztgZ3HlTVFd0IHF5ZRZb1a0qqvL4cciXMQtnco4rLc7i6WS/mhecHddM1XRjvh7ol+V9AYzuc+CcFZBSHLcX+4urNQWhWHSCzow3nWG3YKlIyjHUr8HvcRzE0KRwuAF9gwILxhfRkhcW3dMpNtG3tb2nuT4VBDIZgJpWREfaWW4hMVrTeSUVHS769tH+8ws3PjVEiKasR8yO5s3BtTyQzUBY61YSfE0sVg9VwcYtCBfvUnMX/4kFcRMg3ydAOJnv13/jHgMZBGSTcvh428FIAVZSkIcELqXFzz14ZB1k/7enkNvHz1r3Ej8D8pxFIaoNEJ3hM0skcb6YZuz8kjJuBJZenxmzigu4LODFAqPejqogN/PGQPZCtEQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(5660300002)(31686004)(4326008)(316002)(70586007)(478600001)(70206006)(36756003)(44832011)(8936002)(8676002)(40460700003)(110136005)(54906003)(86362001)(36860700001)(31696002)(40480700001)(16576012)(41300700001)(82310400005)(2906002)(186003)(426003)(26005)(47076005)(53546011)(336012)(82740400003)(81166007)(2616005)(21314003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 08:41:17.5921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63142483-fbe4-4630-d868-08db77b370b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6036

Hi Julien

On 2023/6/28 15:59, Julien Grall wrote:
> Hi,
> 
> On 28/06/2023 06:38, Penny Zheng wrote:
>> On 2023/6/26 14:00, Jan Beulich wrote:
>>> On 26.06.2023 05:34, Penny Zheng wrote:
>>>> --- a/xen/common/vmap.c
>>>> +++ b/xen/common/vmap.c
>>>> @@ -331,4 +331,11 @@ void vfree(void *va)
>>>>       while ( (pg = page_list_remove_head(&pg_list)) != NULL )
>>>>           free_domheap_page(pg);
>>>>   }
>>>> +
>>>> +void iounmap(void __iomem *va)
>>>> +{
>>>> +    unsigned long addr = (unsigned long)(void __force *)va;
>>>> +
>>>> +    vunmap((void *)(addr & PAGE_MASK));
>>>> +}
>>>
>>> Why does this move here?
>>
>> ioremap/iounmap is using vmap, at least in ARM. So for this more
>> generic interface, I was intending to implement it on MPU system.
>> In commit "[PATCH v3 19/52] xen/arm: switch to use ioremap_xxx in 
>> common file", I'm trying to replace all direct vmap interface with 
>> ioremap_xxx in common files.
> 
> While the implementation of ioremap() is based on vmap(), the intended 
> usage is not the same. ioremap() is for MMIO regions while vmap() is for 
> RAM.
> 
> So I don't think this is correct to replace vmap() with ioremap().
> 

Sure, understood now.
So then the current usage of ioremap_xxx in xen/arch/arm/kernel.c, like
```
kernel_zimage_load()
...
kernel = ioremap_wc(paddr, len);
...
```
ioremap_wc() is used for remapping and then copying guest kernel image 
to guest memory. Since ioremap_xxx is for MMIO regions, maybe we shall 
provide a new pair of interfaces for RAM, like ramremap_xxx, to replace 
the ioremap_xxx here?

> Cheers,

