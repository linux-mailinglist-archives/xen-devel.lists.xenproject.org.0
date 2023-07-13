Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A69751991
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 09:12:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562948.879756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqUx-0005fX-Mr; Thu, 13 Jul 2023 07:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562948.879756; Thu, 13 Jul 2023 07:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJqUx-0005d6-Js; Thu, 13 Jul 2023 07:12:23 +0000
Received: by outflank-mailman (input) for mailman id 562948;
 Thu, 13 Jul 2023 07:12:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMFS=C7=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qJqUv-0005cv-Nh
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 07:12:21 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ace6f27-214c-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 09:12:19 +0200 (CEST)
Received: from AM6P191CA0050.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::27)
 by DBBPR08MB6202.eurprd08.prod.outlook.com (2603:10a6:10:209::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 07:12:17 +0000
Received: from AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::f8) by AM6P191CA0050.outlook.office365.com
 (2603:10a6:209:7f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24 via Frontend
 Transport; Thu, 13 Jul 2023 07:12:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT018.mail.protection.outlook.com (100.127.140.97) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24 via Frontend Transport; Thu, 13 Jul 2023 07:12:17 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Thu, 13 Jul 2023 07:12:16 +0000
Received: from 2fb59f65bb23.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0B61F6C-D9D7-46A1-94F1-22B362CEA5D1.1; 
 Thu, 13 Jul 2023 07:12:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2fb59f65bb23.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Jul 2023 07:12:10 +0000
Received: from DUZPR01CA0190.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::8) by DU2PR08MB9992.eurprd08.prod.outlook.com
 (2603:10a6:10:490::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Thu, 13 Jul
 2023 07:12:08 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::f3) by DUZPR01CA0190.outlook.office365.com
 (2603:10a6:10:4b6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24 via Frontend
 Transport; Thu, 13 Jul 2023 07:12:08 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.24 via Frontend Transport; Thu, 13 Jul 2023 07:12:08 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 13 Jul
 2023 07:12:07 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 13 Jul
 2023 07:12:07 +0000
Received: from [10.169.188.57] (10.169.188.57) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Thu, 13 Jul 2023 07:12:05 +0000
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
X-Inumbo-ID: 9ace6f27-214c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkHhjTevpnhLye27oEukpTeduPg1rrsSkUOQlq7+S0g=;
 b=B7/zN1zSwNFxb/Zgr929AxuZ/rw+PjdiYmN5+FVLiGu12XItWq9CZXFstLbHA4mHej3p/1SRli0NXGYyMAK8cjGogTyBNBEA7ET7v3DnM86K3tqnkFuF6VZJb4B4Qx29K9fHsGoxl05UYOAJwK5Japej1QHo5PnFcAdwjFS5Y2U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5c3c62947ecf76e7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IP96VE1nKTgfyDp13JEfyONOYo1oLVRLs+BeYmVtO7FaB/gjR/32MTAhlNpY6vtk/C7dlLQMiJe1O4BBV8RiiAaZTuNcQld/RNzK5vnmHP6gEH/hRjBNN3ZZdsBwGQFDv3ON9J40e0MrS6oTsHOqQdbb/7TRnYWPHRwFvkkAm+I9SOr7bjNOX9+xPgJsLndvKKFm8eCLn8SQA2sfm/cYtqaJmfHcSOc/xspXUmNL7np29KkDBMZfP2gIpfbMElRywNJsxFwZ4zIwqkpX/TVCo7zPdcoW4/g7Syx1+WUQSZDuR35AGDmlnIgSsJvHoQqV6sUDOtkY9eojpk3xysP8FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkHhjTevpnhLye27oEukpTeduPg1rrsSkUOQlq7+S0g=;
 b=BuFzmfDkbjLF1oMvGcL9G5aAEyWnagsUK+tVimCMcNQC78o9oFghGaEKYIlugy8azMtNtC+s0Uo09Ta5uywuPMbXG5AL3H8Z3OzHjJvJQauIouK1KqlHQPTow2jZfCLgZCALlXTEVElyAc2DTJT3gDseK7UZu8rYFm97BLatnxJMpmX5Z53eZ79g/OgOZc0/0TDcPah2vvYlrN0jX4zrZC4XuvxIH1CZw4xQVMfa4QU9YODbvZXSFyAk43lQ4PrvDSvmrMPxbNGcarv1klAbJmrTlkOJtVjFxOdU+E/dRpGomhapY3TfAmjNNIG+5BfTe6uqCiIS/GoQbaRWYkOmCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkHhjTevpnhLye27oEukpTeduPg1rrsSkUOQlq7+S0g=;
 b=B7/zN1zSwNFxb/Zgr929AxuZ/rw+PjdiYmN5+FVLiGu12XItWq9CZXFstLbHA4mHej3p/1SRli0NXGYyMAK8cjGogTyBNBEA7ET7v3DnM86K3tqnkFuF6VZJb4B4Qx29K9fHsGoxl05UYOAJwK5Japej1QHo5PnFcAdwjFS5Y2U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <231ccdf4-df8a-6946-9a31-a7ee0795cc41@arm.com>
Date: Thu, 13 Jul 2023 15:12:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 43/52] xen/mpu: configure VSTCR_EL2 in MPU system
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-44-Penny.Zheng@arm.com>
 <040d7ea3-aeaf-62ea-5561-81e283f2185c@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <040d7ea3-aeaf-62ea-5561-81e283f2185c@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT008:EE_|DU2PR08MB9992:EE_|AM7EUR03FT018:EE_|DBBPR08MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: fbfdf6c4-a023-499f-549d-08db83707dab
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ER14wydO7pUyKtlk1tIILJ8/N9+n8tXHb4DGin0SI3GfrFClvJgR2O8j/LTTA7qE4tvObxE3Vy9NrFzocHuiV4churvr7ppWpzp2ERQjT9Y4S9HpjktfgtSSLVf+R8mkTyB1cNO+yqTPii2QH55zrUtgzg1TYDdP4vQdNwmhZe+5VEswOrxDa8hhjAvqIz6g+26+tL+e//4NzbuqyDYv+7xQvRmFQyR1GNaQnEIfk9kQ0Ov1rc7KbB2ee09E6xQchzREy0JJcWCZN8yF0ou8/RbCHQul9xTtMLqaF1JJGaWBPY/UkyCfw2eppB5jiki5Db8QtroJRR1jM6cVWNsIwL+VbzWuXxsOjSftF6rVui5E8Jexla9xLXudUASqwZiospOu0ew5lmyCc7qCXqQzC50/wWxgSV/uDvx+Sf0UTgnIFOCtmQU4oA+ubRQpwFnEGLrFqOBjvsjd6JQ0wA32ogum5mpYtoNS5tgvuV/kyau5ZpZGx2TTICnt36zLu1j3oq2Qb8/+wbsvaJ67hmbPjZBZGIIQFg7WVWDgzJ6Ps8cV9A7DgA5WK+x/TAS8v4fKwt+6HmNWtbdsJcMptDQw88vzouzk51nVkg+Glp+Wztn3kvJFJU7lkFu/B35NpuM0DsRNR5h9F4HFKH5Nph94LG5fOKVv4fQCUZp53uvGM8x40aO00jdKn4RHGMxoyug/kzp3z+SXoGxzHgOEa9Hjkg/ft0w6mRe+3WT/lQYm3h7FE7rnls82rWbSNmXlK5o1sdRmXFzMaDJ0jL5qoIsdl+qo3Qc64qbKig+IfAGm3Ve8Q4b0iX3PwwwY3PorfE96ii8QJWXFMkAvwtuNBw7ljg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199021)(46966006)(40470700004)(36840700001)(186003)(26005)(53546011)(41300700001)(336012)(36860700001)(426003)(47076005)(83380400001)(2616005)(31686004)(82740400003)(40460700003)(478600001)(356005)(54906003)(81166007)(110136005)(4326008)(70586007)(44832011)(70206006)(40480700001)(16576012)(316002)(82310400005)(31696002)(8676002)(86362001)(8936002)(5660300002)(36756003)(2906002)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB9992
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2f0bf4ab-0960-4bb7-8376-08db8370787e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	41x82RZCQXat5o9tvZWjjHULqTWuo39MCuTL/9UVZI+JQqsYF1rHyfLgqE4eB2ZRgDbHICslqVw0k98cwd73w983lX+R+f7nUMJ2Tcu7vtnx6gCUFa15v9JalVtKERgGdE3GqqFWvHsR6A03bLymOCPfX0JZ0CBSroNRQtWTaniHkFKGaqJpXzpIlYOz3OaZcKdb2hTUl1KSAPgzmKvPrUf5sA/02SloUSI2VUCHfqvqB+g99FMnJeVJi+aZwqEcreEOnKbuvVYP7zKsK9lqMkozWB9IfQUeMztJKACvk8ZIPmUTuyTR5z9gYgfSVengQ4IeIp/5Tps8VVqEFfWMHxX+HWnNTXDib0xw48wlFuLlsgaX9a524xediVz8PVEC00rt+6BNPSDUg/Pfpu9B1AIGCzuEgx6Nxed2D/4zamaZtlyROaYFp5B/bKLSiL0781JQr8qQ9yiu8Dd1H9YDJQt6Nv/trn7IO6Jty4uge3UGeMTOWo8L5DB2N7pwWtp/0Hq7ON+35uPAzie1ioi6PNPEPZg4IOz+OW8Z1FxfcVOnD2OaJarE2ZU1LA+f0Aubf+fSVXojZvGwJRChopKaweZkAS30pPgtwAZuypwX5mWrxb9CJKBdPNnXh921aRguj5WdoQMVnyPjWmz0srVpg/DLlwVAcIeZidJZHTowtBeeE7W1YMvSHsgG/IwIEzRi5d8vXZJsoSpyzXkB8AXQOi6PIyMznW0fI6VaUbt8tcLyXfZLoz0c7M9aEOl3Y3beuRGKtwpsfVapEEtYNGeSKnumVk+UOqelhHjMBVfOyow=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(44832011)(70206006)(4326008)(70586007)(316002)(2906002)(41300700001)(31686004)(478600001)(8936002)(5660300002)(8676002)(16576012)(110136005)(54906003)(36860700001)(40460700003)(40480700001)(426003)(186003)(36756003)(336012)(83380400001)(47076005)(53546011)(26005)(86362001)(31696002)(82310400005)(81166007)(2616005)(82740400003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 07:12:17.0388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfdf6c4-a023-499f-549d-08db83707dab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6202

Hi Ayan

On 2023/7/5 22:21, Ayan Kumar Halder wrote:
> 
> On 26/06/2023 04:34, Penny Zheng wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> VSTCR_EL2, Virtualization Secure Translation Control Register，is
>> the control register for stage 2 of the Secure EL1&0 translation regime.
>>
>> VSTCR_EL2.SA defines secure stage 2 translation output address space.
>> To make sure that all stage 2 translations for the Secure PA space
>> access the Secure PA space, we keep SA bit as 0.
>> VSTCR_EL2.SC is NS check enable bit.
>> To make sure that Stage 2 NS configuration is checked against stage 1
>> NS configuration in EL1&0 translation regime for the given address, and
>> generates a fault if they are different, we set SC bit 1.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v3:
>> - new commit
>> ---
>>   xen/arch/arm/include/asm/arm64/sysregs.h |  6 ++++++
>>   xen/arch/arm/mpu/p2m.c                   | 17 ++++++++++++++++-
>>   2 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h 
>> b/xen/arch/arm/include/asm/arm64/sysregs.h
>> index ab0e6a97d3..35d7da411d 100644
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -512,6 +512,12 @@
>>   /* MPU Protection Region Enable Register encode */
>>   #define PRENR_EL2   S3_4_C6_C1_1
>>
>> +/* Virtualization Secure Translation Control Register */
>> +#define VSTCR_EL2            S3_4_C2_C6_2
>> +#define VSTCR_EL2_RES1_SHIFT 31
>> +#define VSTCR_EL2_SA         ~(_AC(0x1,UL)<<30)
>> +#define VSTCR_EL2_SC         (_AC(0x1,UL)<<20)
>> +
>>   #endif
>>
>>   #ifdef CONFIG_ARM_SECURE_STATE
>> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
>> index 04c44825cb..a7a3912a9a 100644
>> --- a/xen/arch/arm/mpu/p2m.c
>> +++ b/xen/arch/arm/mpu/p2m.c
>> @@ -10,7 +10,7 @@
>>
>>   void __init setup_virt_paging(void)
>>   {
>> -    uint64_t val = 0;
>> +    uint64_t val = 0, val2 = 0;
>>       bool p2m_vmsa = true;
>>
>>       /* PA size */
>> @@ -76,6 +76,21 @@ void __init setup_virt_paging(void)
>>
>>       WRITE_SYSREG(val, VTCR_EL2);
> #ifdef CONFIG_ARM_64
>>
>> +    /*
>> +     * VSTCR_EL2.SA defines secure stage 2 translation output address 
>> space.
>> +     * To make sure that all stage 2 translations for the Secure PA 
>> space
>> +     * access the Secure PA space, we keep SA bit as 0.
>> +     *
>> +     * VSTCR_EL2.SC is NS check enable bit.
>> +     * To make sure that Stage 2 NS configuration is checked against 
>> stage 1
>> +     * NS configuration in EL1&0 translation regime for the given 
>> address, and
>> +     * generates a fault if they are different, we set SC bit 1.
>> +     */
>> +    val2 = 1 << VSTCR_EL2_RES1_SHIFT;
>> +    val2 &= VSTCR_EL2_SA;
>> +    val2 |= VSTCR_EL2_SC;
>> +    WRITE_SYSREG(val2, VSTCR_EL2);
> #endif

Understood, will fix.

>> +
>>       return;
>>
>>   fault:
>> -- 
>> 2.25.1
>>
>>

