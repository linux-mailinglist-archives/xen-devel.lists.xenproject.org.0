Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF918784F72
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 05:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588888.920514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYer4-0001JB-2N; Wed, 23 Aug 2023 03:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588888.920514; Wed, 23 Aug 2023 03:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYer3-0001Gm-VN; Wed, 23 Aug 2023 03:48:25 +0000
Received: by outflank-mailman (input) for mailman id 588888;
 Wed, 23 Aug 2023 03:48:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=863I=EI=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qYer2-0001Gg-Bl
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 03:48:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6fac688-4167-11ee-8782-cb3800f73035;
 Wed, 23 Aug 2023 05:48:21 +0200 (CEST)
Received: from AM5PR1001CA0020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::33)
 by AS2PR08MB8997.eurprd08.prod.outlook.com (2603:10a6:20b:5f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 03:48:17 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::b8) by AM5PR1001CA0020.outlook.office365.com
 (2603:10a6:206:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26 via Frontend
 Transport; Wed, 23 Aug 2023 03:48:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.15 via Frontend Transport; Wed, 23 Aug 2023 03:48:16 +0000
Received: ("Tessian outbound 30c9f5e988c5:v175");
 Wed, 23 Aug 2023 03:48:16 +0000
Received: from 7afd324abde3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8804DC05-03E5-437E-A934-F18A878C4CB4.1; 
 Wed, 23 Aug 2023 03:47:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7afd324abde3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Aug 2023 03:47:21 +0000
Received: from DUZPR01CA0350.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::22) by DBBPR08MB5964.eurprd08.prod.outlook.com
 (2603:10a6:10:20c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 03:47:20 +0000
Received: from DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b8:cafe::b4) by DUZPR01CA0350.outlook.office365.com
 (2603:10a6:10:4b8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25 via Frontend
 Transport; Wed, 23 Aug 2023 03:47:20 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT011.mail.protection.outlook.com (100.127.142.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6723.15 via Frontend Transport; Wed, 23 Aug 2023 03:47:19 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 23 Aug
 2023 03:47:18 +0000
Received: from [10.169.172.116] (10.169.172.116) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 23 Aug 2023 03:47:16 +0000
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
X-Inumbo-ID: e6fac688-4167-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQS5/ImYKfplwvZsmm9beds8WlJAzZqBVmgBkcTY0IA=;
 b=DyWGq7FfIPEgbTYs1qqqpRYFms3G/SxMYAk1vSNOSuSxK6LXPtBmF+UNv+WYB6uHHpMdhm5MJi8H5JU3aufNFboSOqOwKwm1sLN74Kf5Imwj+70JwS8TkW2Sg6lrZhgpyRif/p+08U0rDkxpRXZ6GK3cLUgHXfQUron+WhwzJiQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa56542680004969
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcmZoqxjbdpxHimxGKmEu9D9YOjd6cPLtg2iL2dxJtb/1Dczwo4FM3vWF7pGRwoT1qoc1luAGxdkfGtqWDuXRKdW6cbOXvwaGKMWdiMKjPC/4d/cRQeffo0+S3yMLP+sXu9AGi8d2i/0NkORlX3YfNWMNXvhOzdtDPNLeFcyZz4yb+0YEQRk0pKe2LwNn3YyMHeXoc/yV1WWxlCjcBKYdI3IljUEewXU6vXVjhDcQLWxOKqGPn8J9SPw/dTPl04rTPUFSsXsbbctDvtEmTcAcKACk/L4DoDULuS3llZmRdFcxvCnNMaXXRIdR9PmliewNepiR/RQ5WVyFzkfxbGp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQS5/ImYKfplwvZsmm9beds8WlJAzZqBVmgBkcTY0IA=;
 b=cQIIz+Fe8CwYKDCiqeOqaa+O44pcV/5X5YErmzjHOGI0uc+HY2oGxzN2SPbQGV4Bh8GkUM1P8tvN5beLjW5pKf3mJGqMx+60XnZ0e7+HQODNgDyrvCpzw2kS+z2cTaGyLsfOXKTbydR0hx9ysVLSethZiYjpoDcSx1X6kHfYYhOl7z5IaHTj+zKpOIjVVOXxw3fWRP6Q0NoH7LwcphOFCoPl6a5JXMKrChF15FbaY7PW4mSCtotHxytwNlWclx00CHTCmzSJTkcyn8PB3lo8uIo0E0qHh2XvvN5oOHPOB1GBMBMFgoOH2lXA59DXCryCeRz5OrZl94sXcoLk09r98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=xen.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQS5/ImYKfplwvZsmm9beds8WlJAzZqBVmgBkcTY0IA=;
 b=DyWGq7FfIPEgbTYs1qqqpRYFms3G/SxMYAk1vSNOSuSxK6LXPtBmF+UNv+WYB6uHHpMdhm5MJi8H5JU3aufNFboSOqOwKwm1sLN74Kf5Imwj+70JwS8TkW2Sg6lrZhgpyRif/p+08U0rDkxpRXZ6GK3cLUgHXfQUron+WhwzJiQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <b23d8afb-281b-6de8-3046-674a45ff6494@arm.com>
Date: Wed, 23 Aug 2023 11:47:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v5 11/13] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-12-Henry.Wang@arm.com>
 <5356f905-4b14-46b4-b5b4-c236989e1ec8@xen.org>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <5356f905-4b14-46b4-b5b4-c236989e1ec8@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT011:EE_|DBBPR08MB5964:EE_|AM7EUR03FT020:EE_|AS2PR08MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: fc264b5a-6f4f-4b19-cbe0-08dba38bc8c0
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nyWHx5+O8mcQeiT3HXfzU8GdtuOfKSU5eJeeHcWseI+PZUwrku6NfCph1NuzyQZN9xi96E1MINglAnpFEOkff42wbAEQ6oOico94cR6dW3D5BNQHFIn+BTnSTr7RKaTWF6pIVhJa4xcLRh1B/j77NEedhPFpT7UUNzusE3MbQ9c3qbgJpYqFmr8mh7lJS3wmADFw+qtjy4Xsg9Y5uYGbkIXBHePKjweS6Y4mlQ3aN8kquL8vk066NcOJC1G/2isOW8JE3hrXRRrQUKsZTrf/QZcopDsmI0o1KkFBHMmXBLhh1EYSjhnTAocf4xmWPTom5ZI5FmwFOpDqJkid9EZCqHXy8W43Cz+Ug8DwpfkdsjaySG6Qv++UW+Q7q7Ig/Tu4pAaTdIkU8h5DPn46FhU+wu5YG/VzF/JMWRwZvMnqHWuNR4+a6OBLRI+tUz4IxmeoemqFPknBn1Qvy9Vfu47pgNukNvSIiOMSpGhMJetmgyWxDJtkYEni3CGCzGuQf5DQL+uxHFjPc/i3riqmQ4osbcs7yKTb9G6TyL/UT4isJayXb19hQ/sG48e49TaxrulFTfrK2YA7k93wHlz0P+GSH3TN2bvdGZrPFWszH88c6OyorNkkxNlh/vVlkooScx2hxHXURcXjieD1ExefZq0SStpS9iphmKz4X9aDCGqWX4soziLSDjeNoyg0NnrS0KEdw9LYvPmgJsX5e5NS898loMbzkpjjSSwKlcbC789agTBp6bCGj3YsnmiYpyorVBwOr9v8rsS77eWyGQ78vRhl6vr4osL1fs4jMhcsBHh2KvbNFf3hD/IinMh4nYx+9VYZ
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(53546011)(83380400001)(5660300002)(44832011)(426003)(336012)(26005)(31686004)(36860700001)(31696002)(86362001)(47076005)(8676002)(2616005)(8936002)(4326008)(966005)(70586007)(316002)(54906003)(16576012)(110136005)(70206006)(478600001)(356005)(81166007)(82740400003)(40460700003)(36756003)(41300700001)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5964
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c242ee78-c38a-420b-c357-08dba38ba6aa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I+NCLnFgSE0jLVyTAzanhOoDHvJMhTmh7IUUpEwc55ElIGemIHOm2xH8XBFlVR5yONWh/AP9FVTp083CdgGSa4DmvZOHtHek/S5pjms5HPiddeqRfsnrNLn8x37dTUKAZI9KyDvJk3CcINwS1k5zoQk/TbHUDFbiDU3w/7PZae8tP+IoG2NsIcSPXYhvZJDn8odJNR0LgCFpVP9AjuNJqBHIlM+h/ILMvpb13CDTP1zY+ed4T83zLXxc8BWSJPCvB2EvZow8ULjNfcZbSN08w7vjsOkytmM2aDhQiD6bHZym7WlCe3DZsJXdhUqopq2kYwAKtcsykzBOLHAfHM3y1WvyxaUwEsV8+UYuqCouPh1ZuXzpgPpGqpg1d1OloQE3dS3Aupzv3Bf430ByaprlwpCaut46DezkwuvtxzWBAZh2UDr2VTpQykQOimMYUp8+5XTUy5I0VruylX/grWe9e63vnp7/TPMsD5n4gAPbtK7sZAwu7sBFwhpO/YR4Y4KPjWMBtjl1LsXKP8PV4gwl22vR6IfJ1OKfXgDwKyKY7c+x1Zl9jOmC5/QjuF3s19jTgk7C/RmBHHNtO0twXTgDkbtJWa3EWZRwRlg6rxed8rhMYfe15g0oXg2VzdKvSYrTzneZlZtS4HyumRDckfRObFw9mTvyQ74Xl23AO0MwPhVN21/ogDgMIssEUQ15SgK7vg6/Gcc/wyEEbtancaVN48kfGznleUmL7LRmXbFgWMtscNQgdMZSGW3Pl4n3GueRGxWr1WBrqVoQh6Sw5OTv/88mO6YRG25hsjzvjOVyz04=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(53546011)(83380400001)(5660300002)(44832011)(426003)(336012)(26005)(31686004)(36860700001)(31696002)(86362001)(47076005)(8676002)(2616005)(8936002)(4326008)(966005)(70586007)(316002)(54906003)(16576012)(110136005)(70206006)(478600001)(81166007)(82740400003)(40460700003)(36756003)(41300700001)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 03:48:16.6292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc264b5a-6f4f-4b19-cbe0-08dba38bc8c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8997

Hi Julien

On 2023/8/23 02:01, Julien Grall wrote:
> Hi Henry,
> 
> On 14/08/2023 05:25, Henry Wang wrote:
>> From: Penny Zheng <penny.zheng@arm.com>
>>
>> Current P2M implementation is designed for MMU system only.
>> We move the MMU-specific codes into mmu/p2m.c, and only keep generic
>> codes in p2m.c, like VMID allocator, etc. We also move MMU-specific
>> definitions and declarations to mmu/p2m.h, such as p2m_tlb_flush_sync().
>> Also expose previously static functions p2m_vmid_allocator_init(),
>> p2m_alloc_vmid(), __p2m_set_entry() and setup_virt_paging_one()
> 
> Looking at the code, it seemsm that you need to keep expose 
> __p2m_set_entry() because of p2m_relinquish_mapping(). However, it is 
> not clear how this code is supposed to work for the MPU. So should we 
> instead from p2m_relinquish_mapping() to mmu/p2m.c?
> 

p2m->root stores per-domain P2M table, which is actually an array of MPU
region(pr_t). So maybe we should relinquish mapping region by region,
instead of page by page. Nevertheless, p2m_relinquish_mapping() shall be
moved to mmu/p2m.c and we need MPU version of it.

> Other functions which doesn't seem to make sense in p2m.c are:
>    * p2m_clear_root_pages(): AFAIU there is no concept of root in the 
> MPU. This also means that we possibly want to move out anything specific 
> to the MMU from 'struct p2m'. This could be done separately.

Current MPU implementation is re-using p2m->root to store P2M table.
Do you agree on this, or should we create a new variable, like 
p2m->mpu_table, for MPU P2M table only?
How we treat p2m_clear_root_pages also decides how we destroy P2M at 
domain destruction stage, current MPU flow is as follows:
```
     PROGRESS(mapping):
         ret = relinquish_p2m_mapping(d);
         if ( ret )
             return ret;

     PROGRESS(p2m_root):
         /*
          * We are about to free the intermediate page-tables, so clear the
          * root to prevent any walk to use them.
          */
         p2m_clear_root_pages(&d->arch.p2m);

#ifdef CONFIG_HAS_PAGING_MEMPOOL
     PROGRESS(p2m):
         ret = p2m_teardown(d);
         if ( ret )
             return ret;

     PROGRESS(p2m_pool):
         ret = p2m_teardown_allocation(d);
         if( ret )
             return ret;
#endif
```
We guard MMU-specific intermediate page-tables destroy with the new 
Kconfig CONFIG_HAS_PAGING_MEMPOOL, check 
https://gitlab.com/xen-project/people/henryw/xen/-/commit/7ff6d351e65f43fc34ea694adea0e030a51b1576
for more details.

If we destroy MPU P2M table in relinquish_p2m_mapping, region by region,
we could provide empty stub for p2m_clear_root_pages, and move it to 
mmu/p2m.c

>    * p2m_flush_vm(): This is built with MMU in mind as we can use the 
> page-table to track access pages. You don't have that fine granularity 
> in the MPU.
> 

Understood

>> for futher MPU usage.
> 
> typo: futher/further/
> 
>>
>> With the code movement, global variable max_vmid is used in multiple
>> files instead of a single file (and will be used in MPU P2M
>> implementation), declare it in the header and remove the "static" of
>> this variable.
>>
>> Add #ifdef CONFIG_HAS_MMU to p2m_write_unlock() since future MPU
>> work does not need p2m_tlb_flush_sync().
> 
> And there are no specific barrier required? Overall, I am not sure I 
> like the #ifdef rather than providing a stub helper.
> 
> If the other like the idea of the #ifdef. I think a comment on top would 
> be necessary to explain why there is nothing to do in the context of the 
> MPU.
> 
> Cheers,
> 

