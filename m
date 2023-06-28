Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF8740948
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 07:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556317.868750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qENvR-0005sg-VD; Wed, 28 Jun 2023 05:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556317.868750; Wed, 28 Jun 2023 05:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qENvR-0005pm-RO; Wed, 28 Jun 2023 05:41:09 +0000
Received: by outflank-mailman (input) for mailman id 556317;
 Wed, 28 Jun 2023 05:41:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zt8O=CQ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qENvP-0005pg-S9
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 05:41:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 607dbe2b-1576-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 07:41:06 +0200 (CEST)
Received: from AM6P195CA0054.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::31)
 by DU2PR08MB7359.eurprd08.prod.outlook.com (2603:10a6:10:2f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 05:40:57 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::d4) by AM6P195CA0054.outlook.office365.com
 (2603:10a6:209:87::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.34 via Frontend
 Transport; Wed, 28 Jun 2023 05:40:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.18 via Frontend Transport; Wed, 28 Jun 2023 05:40:56 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Wed, 28 Jun 2023 05:40:56 +0000
Received: from c6c37f26f608.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F6E626B3-F5A4-4D0E-AE95-1A45265E1D86.1; 
 Wed, 28 Jun 2023 05:40:49 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c6c37f26f608.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jun 2023 05:40:49 +0000
Received: from DB8PR06CA0045.eurprd06.prod.outlook.com (2603:10a6:10:120::19)
 by DU0PR08MB9463.eurprd08.prod.outlook.com (2603:10a6:10:42d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 05:40:43 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::73) by DB8PR06CA0045.outlook.office365.com
 (2603:10a6:10:120::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19 via Frontend
 Transport; Wed, 28 Jun 2023 05:40:43 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6544.20 via Frontend Transport; Wed, 28 Jun 2023 05:40:43 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 28 Jun
 2023 05:40:43 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 28 Jun 2023 05:40:40 +0000
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
X-Inumbo-ID: 607dbe2b-1576-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGQuW9+dkHZh6Tpwky9V38WCBfRDJO4wWC7XlFezq/E=;
 b=CGHc4FaueZKdRUXSb/zGHng5IX+IJeKcSErQ3NBW9pNAVbSw0rTsCqXcAdE0LRCRy1XQQicEIVLFbUsQCh/UPcpF0u4JlBL8YSpy/LAO9v0OAk7Ip4s4I5bMmzmDN6/7i6zF1gezy154w4YFGWNxF5y3WBciAmetyuYuRrZUrrI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6b01043b66fbcc7f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0dxj1yRqib3tnIooZqeDhQ9d1QQzH3fGa1Aq8XJKW+Un1gG8IxKNGalEzDY8QiEzeIN/UihxUvQxTZ55qV9V98UV7OEawvE1lpcc2Ukt6K30kVnQMyKXdHIK68Pvad9ls64ayZA79LVmlntpRgEJnxbBbs0lr2zE9tjjJsRidrVTmfOQ56GmPPassDJO4zPAjh1y7sekZENq84l1WgWjQxCXIaclpr5C9MN9Dvbqp9p/bYNmPnpNohZt76aT/gxHp9kzPhGOlbp8Kpv2d4+h/gQr6hPdsvuFaVLw/GOgr0zdZE3HOaNLM8gAWweW2wdRbeKOMY1Y6LmOgNbxIn1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGQuW9+dkHZh6Tpwky9V38WCBfRDJO4wWC7XlFezq/E=;
 b=odptxlw1f+zx/uwIKDniW0DtTgB7l3kyVQPNHsJggxPz6opXjH0S2TuiQzBRSVWFUlATdnAV+8F7MrjtYQrRMI4MDs9CAX530QvdQwAIRUvR/DzXu7hkAP+6poGkhkNB01XTfVuzFEReVFuCmPOjW7wDavqp9kG6lxP/MfmKPfOqNG9oupnBgPqdk58cZaydjUxTlPTwI1amBRxwQy9vapNEYDKHhlYqkIwQ6r16OInC0Fafc5+/CCBbq1ZXg6a2Lwb3XQLCaTBuzAu16smzeqW0RFXh4pTv93SSTpX8Z41neUiXN2RUPt6xX8K4V7TucU9NGgxWSv8BKTjZ2Xh66w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGQuW9+dkHZh6Tpwky9V38WCBfRDJO4wWC7XlFezq/E=;
 b=CGHc4FaueZKdRUXSb/zGHng5IX+IJeKcSErQ3NBW9pNAVbSw0rTsCqXcAdE0LRCRy1XQQicEIVLFbUsQCh/UPcpF0u4JlBL8YSpy/LAO9v0OAk7Ip4s4I5bMmzmDN6/7i6zF1gezy154w4YFGWNxF5y3WBciAmetyuYuRrZUrrI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <f8d901a7-5d10-45c4-2b87-6ca4e0dba07e@arm.com>
Date: Wed, 28 Jun 2023 13:40:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v3 21/52] xen: introduce CONFIG_HAS_PAGING_MEMPOOL
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Chen <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-22-Penny.Zheng@arm.com>
 <3115e211-7ed6-32ea-892c-a133b101dd31@suse.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <3115e211-7ed6-32ea-892c-a133b101dd31@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT051:EE_|DU0PR08MB9463:EE_|AM7EUR03FT004:EE_|DU2PR08MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c958cca-cc91-48ce-166d-08db779a3f14
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 u0g6n1PzlEMW43qG6Lq211MCwyJSaZ1RkW1Qdn++8f4gYLjJzw3VTUzelL8//V0yFQDxOLQTRjN+G4wTd8cLn3zaDGfmpV+pd/gbcr5iE3xRh5na3J0SNx3SAa7J+wHafwmokcXHxTQ75MezKREvPDhL0Uja0MzmrJWbNjKc9wwLtcVc/w87e45dXM0BCL3Ta2pmgQ+VOX/m4las7qqU2MX02ha5IL1cxf4n3ZlZMbJXc/m6zMnSnj6H2qNT8y3rRXe3xJ0N2o2yjMgjrrPZNclqdIx9e9wh07lhZFmVEM1gm+w66avatY43UziVlOqVxWSQ0a3yJeVnmKLcC5XzDE1ILb34PuwPuW3AyCw7j+W7wbUoljkhWutEIYREy7w3pILetyPb8M3R984lydxH5qOQNGyOCFrzV8Q7wBw3I9Y8GGtjQOa/nHWoc+to9AwnOnLNV+5GRiiXzISI7sf4OeR4cwgym+fFsCWTt9uLokPDp5zgrBvU3h+0evdeWTVQ586Pn3RuDzDv48rqCgDVwpt4cAjNBiYZLJnnRLmW/Zj7oI92xi+mA/3PwHlHiiTS0VnibUnnsaT05+QR3XN+QFHgk+/mfY3tcPx+mSiOmzS9cra/fa7WXtoT5REUjuY4P1PzNlWmQoYgLdkKr20u77Fh7FjrMBJ1AayKwJh7Cinj0D0E1MPXYmN86ahu+fa9GOmYY6i0kKoFQn7HFNX/TYO/3+m84eEQisfbmAfIMIZw26KTAqVRHB/U7sJTTtVsMq6KToxBcU3QEHAHJJ607qPFLr3dklVIPJgDfRK0Ut0awxA/ZSzj9oowOQOehZk3TJum0sHtntiQfFtnyjQxIQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(82310400005)(41300700001)(36860700001)(70206006)(47076005)(26005)(54906003)(426003)(2616005)(336012)(478600001)(16576012)(186003)(53546011)(2906002)(356005)(44832011)(36756003)(40460700003)(5660300002)(31696002)(81166007)(70586007)(82740400003)(8936002)(40480700001)(4326008)(316002)(6916009)(86362001)(8676002)(31686004)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9463
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5cf1719e-9c5f-49b2-9a6d-08db779a3741
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zjExZX5bp8ZFhm2wMRvm4I6pvWV6GxFliRfCzSoTXC2BxQY2KH8e0tuWxQv4l6Yez6b1TVDQcSbGyrCIVew5urIu9FEeOSY0YK53Znf+me0PaJha64CZjgFD96wB7aBg3i1YEyR+d5hjw4M22FVpUbdrIccJHmO00vvp/eC40Ntp8cQLf2cU/pA/VT1iHYnLYHjsNroYHVKuhgQGYeWNlSQrstudWHCl8BCOL6uKMDabipRJU8W9ClEzEAiQDSCemtH7UlqRz1fBWltsjIjI8NMsKY2LizX8Mq4jqpOHg/Ks47wkUW8CIi/D1s3KOztVcODUI+a9KLJeVC6P1o5/rXsWgi1qFZDawa3GJIiZzqyQyGiGGvY9OybjwKd0tVN24SbkMPKOnnpOPkbuRiusuePNELMlUa9Q2XnvIDtcBF0QTtAkhsJA5/6gicSMDtHgFeH1YPwK96JGrE5/dlG8QJA5OuqReMqKhwrIWrN+SO3NMJnJL2klDVVycWfpngJShnnsZ6OdBLvTpFAnlmiw/9pCo8dT+0gPGWg5Nl/Ui2nWaOd7hrz4V+aY6eBdZuAvB/q3ixdePU7AdzYvtqo1dcR0QCCAVsmAAAKUfBNSW9T/4KNAmgm49UNFtPOKIvJVtKepw9akaU9nKIq0Oke5l2K2ihh1F0Cl8CjzfG5Bp+vl4WipswVcunlV+sNKOw87L5Gj7ZkCSaBvHl5YeJimbZA4e3JFDazRA0tJiUTBnn0uJUlg3AryQ3LWbvDcvYLn9NpYPuIocRxpW5WiPAh53Iv2cJgNYR2Qc5UaEO/CK7bGA8pt30zAAXEep4zxI55j
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199021)(36840700001)(40470700004)(46966006)(31686004)(82310400005)(36860700001)(26005)(36756003)(6862004)(44832011)(70206006)(86362001)(41300700001)(40460700003)(40480700001)(4326008)(81166007)(82740400003)(31696002)(316002)(70586007)(8936002)(8676002)(5660300002)(47076005)(53546011)(186003)(54906003)(2906002)(16576012)(426003)(336012)(2616005)(478600001)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 05:40:56.9382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c958cca-cc91-48ce-166d-08db779a3f14
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7359

Hi Jan

On 2023/6/26 15:01, Jan Beulich wrote:
> On 26.06.2023 05:34, Penny Zheng wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -54,6 +54,9 @@ config HAS_IOPORTS
>>   config HAS_KEXEC
>>   	bool
>>   
>> +config HAS_PAGING_MEMPOOL
>> +	bool
>> +
>>   config HAS_PDX
>>   	bool
>>   
>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -844,6 +844,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>           ret = iommu_do_domctl(op, d, u_domctl);
>>           break;
>>   
>> +#ifdef CONFIG_HAS_PAGING_MEMPOOL
>>       case XEN_DOMCTL_get_paging_mempool_size:
>>           ret = arch_get_paging_mempool_size(d, &op->u.paging_mempool.size);
>>           if ( !ret )
>> @@ -857,6 +858,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>               ret = hypercall_create_continuation(
>>                   __HYPERVISOR_domctl, "h", u_domctl);
>>           break;
>> +#endif
> 
> While I'm not outright opposed to doing it this way, I wonder
> whether it wouldn't be better to leave common code untouched by
> making arch_get_paging_mempool_size() do what you want done.
> That's part of what arch hooks are for, after all.
> 

Sure, I'll try.

> Jan

