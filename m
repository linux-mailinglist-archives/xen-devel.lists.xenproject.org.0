Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FCA7481ED
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 12:21:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559025.873678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzd3-0002O3-WA; Wed, 05 Jul 2023 10:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559025.873678; Wed, 05 Jul 2023 10:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzd3-0002LT-TC; Wed, 05 Jul 2023 10:20:57 +0000
Received: by outflank-mailman (input) for mailman id 559025;
 Wed, 05 Jul 2023 10:20:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TfY/=CX=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qGzd1-0002LL-VB
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 10:20:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f312ac9-1b1d-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 12:20:53 +0200 (CEST)
Received: from AM6PR0502CA0069.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::46) by AS1PR08MB7474.eurprd08.prod.outlook.com
 (2603:10a6:20b:4de::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 10:20:44 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::9) by AM6PR0502CA0069.outlook.office365.com
 (2603:10a6:20b:56::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 10:20:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.24 via Frontend Transport; Wed, 5 Jul 2023 10:20:44 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142");
 Wed, 05 Jul 2023 10:20:43 +0000
Received: from 0b1ad951777f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 15A9EEE9-FF19-4B60-B8DA-8ABC7D228B35.1; 
 Wed, 05 Jul 2023 10:20:38 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0b1ad951777f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 10:20:38 +0000
Received: from DBBPR09CA0030.eurprd09.prod.outlook.com (2603:10a6:10:d4::18)
 by AM9PR08MB5873.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 10:20:33 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::8) by DBBPR09CA0030.outlook.office365.com
 (2603:10a6:10:d4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Wed, 5 Jul 2023 10:20:33 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6565.22 via Frontend Transport; Wed, 5 Jul 2023 10:20:33 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 10:20:32 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 5 Jul
 2023 10:20:32 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 5 Jul 2023 10:20:29 +0000
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
X-Inumbo-ID: 9f312ac9-1b1d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sqve7jRIF2F2L+4fzmXf8o3N3GXZG2uKad+g8Ckc4AA=;
 b=iWepzbcVsO798Hoc3vrSfL7XteyFyh8QVngqFO/7hb8XznlzS2LPbYdAcU/n7jsDU4cD7CgUotIUBKaCHoB/YTX+ExLo63xrBSelVBEWIa8VuiWgykwGNLjT1L6BAua/uPyccNcHDo5f1n4n16yEPdH/pDveUZbBcplY4eV6PVQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2dcd6158c96eef2d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCkuLjakX4nDSMtaUMJ6LhFC7s1LJ7i9NHHHjNju0mNTJCvfxfktYqaSgc4j2/zokyqfbRZPrQGP9PYooWmR7j+LPPc4k4c2EsbqzB0GULQrEmmvTM6RHKTlR/eSNDkVJEHjz4Y01KyjlW6AZ3t566vEWnbYqtuxI8lKefaFuXua6opNxz0cNjRXFsEyhyxuGv3s9Pp3p/Qg84Fj3RdT88Aq3ewNMfXGxOJNvevu/tb4/+HDEf7wE4kf1QBOinO6248FnwhnaI5y0hplLkRv90ErVwy4pPEd6AIAkLK2vxdPgOwNFBowOkaEgU1L/mAfu4ZC+uIlQRUznB9HyXPkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sqve7jRIF2F2L+4fzmXf8o3N3GXZG2uKad+g8Ckc4AA=;
 b=b+JKO4pdWGQ80AOJF2SZihhjTOdpgmbTKZ0M978FxO5XdMjxPP9u4xadzXpsZtBMbD2KnWoaqu2gjcr9BxGXwjXbzxieU+ZxBFHBXRGRIxLdcvwBMg9fQ2Sx5hPLFBFLHKKAyvC9CN/YzlF1iqJCiUyVi4JDgq61k/Ax1twj16fbw55xvT4yz+8ZQUIVWaRiyv64RREayYzk0OnI9r7fIQwrlWCJ9vwZ8BQpObICk4/vGw+/2Zvm6YN1Gs6YPFp1eE8qQ8YUxz/0Gr8KTh5Lf+XzGhBvQD+2/s1yaD2htF7CpKRl//6pZvMq953xbTNNdEiR3CzJ/NtWkUUn6tS6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sqve7jRIF2F2L+4fzmXf8o3N3GXZG2uKad+g8Ckc4AA=;
 b=iWepzbcVsO798Hoc3vrSfL7XteyFyh8QVngqFO/7hb8XznlzS2LPbYdAcU/n7jsDU4cD7CgUotIUBKaCHoB/YTX+ExLo63xrBSelVBEWIa8VuiWgykwGNLjT1L6BAua/uPyccNcHDo5f1n4n16yEPdH/pDveUZbBcplY4eV6PVQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <73eade6e-94c6-ecc6-f369-5abc5a7dc86d@arm.com>
Date: Wed, 5 Jul 2023 18:20:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 42/52] xen/mpu: implement setup_virt_paging for MPU
 system
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-43-Penny.Zheng@arm.com>
 <516dc7aa-4487-cd7c-f9dc-42738314e3f4@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <516dc7aa-4487-cd7c-f9dc-42738314e3f4@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT055:EE_|AM9PR08MB5873:EE_|AM7EUR03FT015:EE_|AS1PR08MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 1402db50-14bd-4474-fa94-08db7d417ded
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 F98aMAKUcSiaiAygu6n8/J1m/U5W9F7ITzw4O/KMNn9kpnyyfJUfHHKUn1HQuzjDhXeWmPfq3hGPLPMswjOJrw9SwKvZSDdzLRCWgLW2XQ9kFtzYN3A1sRlFU+O1SGbhbab7hA1pfueUNJR2CD1HviMYM7awzd2dlw1fq/CgeBplBDRmDnXWBcD7cIdKFMJZXS2736evoc4yrSB4fpKqrCTpSXRv/66FZQltcFLsLVVdocfGsPLL9fjgg+HgW5qpYIpx+2xHgQrCS1rtBCFwyMtryiYHZ+KKm4LqJGWerO45lxW7DKSKKR2GbytY07M9sWfaGL8mqoe/HfHD56dw9dAAd4pmSJ19F3Ru9S7FzLiaQOjUSnNaaeSKBvYAOFYtmTN7D2OBm3GjNobT21k4qn+siwzlEMUpyJitsLlIfpTdg0tZnhl9xB2OBsNsz6i05tclxFx7W5TCNv4UrCR/ZvyX3OZwzzAfoOkdaH1oHwW92Ng1z6r1b5TtxfLnS54CTiq5ffXbAVBp4M6clQBpUwW18vszWrdD6Fr6HHxGInoB3GTs2j9rPY4hJZFCiotZ9J28COIyJrZhB1oRke85IPCo//OyoPbGoEFv04QLmF6m2QQVfzZkRNKQsMbkD2nUk/qwuRKdVQpwMrg1k8maQ1csTMOIIjaxELTI4YH/X3qrY+tgjkSOb5oh45jVW4XP2T0mMD3G9TReQ0eP+nt4YVC2cHrVM6bYl9U1s8uKSjti6UydNS5/NkmtSfzML+EgqUWC0ioPOdJ9b8F8AiAz+6vMBY3LTyGW9OoAba7/RoJ75uDQ6JQk0Gi24u46ZRM+JCRIMhAGULgFFZAZF0fONw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(478600001)(110136005)(54906003)(47076005)(53546011)(2906002)(426003)(316002)(336012)(26005)(186003)(82310400005)(16576012)(8936002)(70586007)(5660300002)(44832011)(4326008)(41300700001)(70206006)(8676002)(82740400003)(356005)(81166007)(86362001)(36756003)(31696002)(40480700001)(40460700003)(36860700001)(2616005)(83380400001)(31686004)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5873
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1e1f2c50-6aa4-4e0b-35f4-08db7d417746
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mLVrYPBPPat2xJ5wPFsSjfT5u7sDrP0PVjdbf84PEyyppFirClUZMOSD+Avo/yCvRDPj5nc1QmbyhGVVRHQmQ4FANa4OYC92tNEHQe6qLMy0SLcR3aoWYvjhTplnd2sC1iufIkl/2cYEEVbP5uamLlcOMdQX4FbObTuHhRCIJ46krP4Y8Z4vRFwa9b/cWpQn2rSg7o29+tfMNTVBWLqS+IUOMTlUByDW9slbp6KRRjS47FaJ1qUN3weEiDOE9Ix2cYuDer+mrAU/gVVyXUHGSxq1qq+k+p8d6Mr3bu2fWfglYTX+ycD5zcCKfqg16bEtoBoxytekpbMRf0PSdfZ4Ngm7z/uDare/I31MWEgbgOyr39AjjeECDT6dRGZzNrfB4wJ8t6hWn0cuMbH9AVp/4Hf//0AEuTckt+C9KgLzWERiWMhHQetSslwmH9vfaddry8ip3+pBjU1KfdyukWEEuviJmXxeXx8v9dCMPj0ZPcUjFmRFHU5v1avw78BsEZzsSlM+OfSpV5ammcW61+/vqWmjqk4SnbL08PquwsUgVufzJJ5WJOu6hkBirje6IYqx2PYFxJ2o8jhHaZm6kjaSr0gEUqvT0t9Az+pdVpw3PeBs6upT3XQYa/9eSsVmCHVei6NFfZV16y00pnTw8Q5j3zQa4+Ya3tr4CNjtrLzNkmF44f5QhTtf/FoUN7fSL3qRzt7rrLy4vTgfmCJf6th6LZuAs30uj1HWjZ2UMEs12DzZSq/sOMikSsjPXAGHFZpZBuLz9h1FA3hUAFSxvcK8n4GjNRPWMAtHrN2vSAi2jAE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(316002)(16576012)(70586007)(5660300002)(86362001)(70206006)(110136005)(41300700001)(4326008)(8936002)(82310400005)(8676002)(186003)(26005)(336012)(44832011)(53546011)(31696002)(31686004)(54906003)(478600001)(426003)(2906002)(2616005)(83380400001)(40460700003)(47076005)(36860700001)(40480700001)(36756003)(82740400003)(81166007)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 10:20:44.1526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1402db50-14bd-4474-fa94-08db7d417ded
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7474

Hi Ayan

On 2023/7/5 01:49, Ayan Kumar Halder wrote:
> Hi Penny,
> 
> Most of these are specific to ARM_64, thus we can add "#ifdef 
> CONFIG_ARM_64" as follows :-

Yes, you're right.

> 
> On 26/06/2023 04:34, Penny Zheng wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> For MMU system, setup_virt_paging is used to configure stage 2 address
>> translation regime, like IPA bits, VMID allocator set up, etc.
>> Some could be inherited in MPU system, like VMID allocator set up, etc.
>>
>> For MPU system, we could have the following memory translation regime:
>> - PMSAv8-64 at both EL1/EL0 and EL2
>> - VMSAv8-64 at EL1/EL0 and PMSAv8-64 at EL2
>> The default option will be the second, unless the platform could not 
>> support,
>> which could be checked against MSA_frac bit in Memory Model Feature 
>> Register 0(
>> ID_AA64MMFR0_EL1).
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v3:
>> - no change
>> ---
>>   xen/arch/arm/Makefile                 |  1 +
>>   xen/arch/arm/include/asm/cpufeature.h |  7 ++
>>   xen/arch/arm/include/asm/p2m.h        |  8 +++
>>   xen/arch/arm/include/asm/processor.h  | 13 ++++
>>   xen/arch/arm/mpu/p2m.c                | 92 +++++++++++++++++++++++++++
>>   5 files changed, 121 insertions(+)
>>   create mode 100644 xen/arch/arm/mpu/p2m.c
>>
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index feb49640a0..9f4b11b069 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -47,6 +47,7 @@ obj-y += mmu/p2m.o
>>   else
>>   obj-y += mpu/mm.o
>>   obj-y += mpu/setup.o
>> +obj-y += mpu/p2m.o
>>   endif
>>   obj-y += mm.o
>>   obj-y += monitor.o
>> diff --git a/xen/arch/arm/include/asm/cpufeature.h 
>> b/xen/arch/arm/include/asm/cpufeature.h
>> index 894f278a4a..cbaf41881b 100644
>> --- a/xen/arch/arm/include/asm/cpufeature.h
>> +++ b/xen/arch/arm/include/asm/cpufeature.h
>> @@ -250,6 +250,12 @@ struct cpuinfo_arm {
>>               unsigned long tgranule_16K:4;
>>               unsigned long tgranule_64K:4;
>>               unsigned long tgranule_4K:4;
>> +#ifdef CONFIG_HAS_MPU
>> +            unsigned long __res:16;
>> +            unsigned long msa:4;
>> +            unsigned long msa_frac:4;
>> +            unsigned long __res0:8;
>> +#else
>>               unsigned long tgranule_16k_2:4;
>>               unsigned long tgranule_64k_2:4;
>>               unsigned long tgranule_4k_2:4;
>> @@ -257,6 +263,7 @@ struct cpuinfo_arm {
>>               unsigned long __res0:8;
>>               unsigned long fgt:4;
>>               unsigned long ecv:4;
>> +#endif
>>
>>               /* MMFR1 */
>>               unsigned long hafdbs:4;
>> diff --git a/xen/arch/arm/include/asm/p2m.h 
>> b/xen/arch/arm/include/asm/p2m.h
>> index f62d632830..d9c91d4a98 100644
>> --- a/xen/arch/arm/include/asm/p2m.h
>> +++ b/xen/arch/arm/include/asm/p2m.h
>> @@ -16,8 +16,16 @@ extern unsigned int p2m_ipa_bits;
>>
>>   extern unsigned int p2m_root_order;
>>   extern unsigned int p2m_root_level;
>> +#ifdef CONFIG_HAS_MPU
>> +/*
>> + * A 4KB Page is enough for stage 2 translation in MPU system, which 
>> could
>> + * store at most 255 EL2 MPU memory regions.
>> + */
>> +#define P2M_ROOT_ORDER 0
>> +#else
>>   #define P2M_ROOT_ORDER    p2m_root_order
>>   #define P2M_ROOT_LEVEL p2m_root_level
>> +#endif
>>
>>   #define MAX_VMID_8_BIT  (1UL << 8)
>>   #define MAX_VMID_16_BIT (1UL << 16)
>> diff --git a/xen/arch/arm/include/asm/processor.h 
>> b/xen/arch/arm/include/asm/processor.h
>> index 685f9b18fd..fe761ce50f 100644
>> --- a/xen/arch/arm/include/asm/processor.h
>> +++ b/xen/arch/arm/include/asm/processor.h
>> @@ -389,6 +389,12 @@
>>
>>   #define VTCR_RES1       (_AC(1,UL)<<31)
>>
>> +#ifdef CONFIG_HAS_MPU
> && ARM_64 /* As these are specific to ID_AA64MMFR0EL1 */

Will do

>> +#define VTCR_MSA_VMSA   (_AC(0x1,UL)<<31)
>> +#define VTCR_MSA_PMSA   ~(_AC(0x1,UL)<<31)
>> +#define NSA_SEL2        ~(_AC(0x1,UL)<<30)
>> +#endif
>> +
>>   /* HCPTR Hyp. Coprocessor Trap Register */
>>   #define HCPTR_TAM       ((_AC(1,U)<<30))
>>   #define HCPTR_TTA       ((_AC(1,U)<<20))        /* Trap trace 
>> registers */
>> @@ -449,6 +455,13 @@
>>   #define MM64_VMID_16_BITS_SUPPORT   0x2
>>   #endif
>>
>> +#ifdef CONFIG_HAS_MPU
> && ARM_64 /* As these are specific to ID_AA64MMFR0EL1 */

Will do

>> +#define MM64_MSA_PMSA_SUPPORT       0xf
>> +#define MM64_MSA_FRAC_NONE_SUPPORT  0x0
>> +#define MM64_MSA_FRAC_PMSA_SUPPORT  0x1
>> +#define MM64_MSA_FRAC_VMSA_SUPPORT  0x2
>> +#endif
>> +
>>   #ifndef __ASSEMBLY__
>>
>>   extern register_t __cpu_logical_map[];
>> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
>> new file mode 100644
>> index 0000000000..04c44825cb
>> --- /dev/null
>> +++ b/xen/arch/arm/mpu/p2m.c
>> @@ -0,0 +1,92 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#include <xen/lib.h>
>> +#include <xen/mm-frame.h>
>> +#include <xen/sched.h>
>> +#include <xen/warning.h>
>> +
>> +#include <asm/p2m.h>
>> +#include <asm/processor.h>
>> +#include <asm/sysregs.h>
>> +
>> +void __init setup_virt_paging(void)
>> +{
>> +    uint64_t val = 0;
>> +    bool p2m_vmsa = true;
>> +
>> +    /* PA size */
>> +    const unsigned int pa_range_info[] = { 32, 36, 40, 42, 44, 48, 
>> 52, 0, /* Invalid */ };
> 
> As this file is common between ARM_32 and ARM_64 and the following is 
> specific to ARM_64, please add
> 
> #ifdef CONFIG_ARM_64

Will do

> 
>> +
>> +    /*
>> +     * Restrict "p2m_ipa_bits" if needed. As P2M table is always 
>> configured
>> +     * with IPA bits == PA bits, compare against "pabits".
>> +     */
>> +    if ( pa_range_info[system_cpuinfo.mm64.pa_range] < p2m_ipa_bits )
>> +        p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range];
>> +
>> +    /* In ARMV8R, hypervisor in secure EL2. */
>> +    val &= NSA_SEL2;
>> +
>> +    /*
>> +     * The MSA and MSA_frac fields in the ID_AA64MMFR0_EL1 register
>> +     * identify the memory system configurations supported at EL1.
>> +     * In Armv8-R AArch64, the only permitted value for 
>> ID_AA64MMFR0_EL1.MSA is
>> +     * 0b1111. When ID_AA64MMFR0_EL1.MSA_frac is 0b0010, the stage 1 
>> of the
>> +     * Secure EL1&0 translation regime can enable PMSAv8-64 or VMSAv8-64
>> +     * architecture.
>> +     */
>> +    if ( system_cpuinfo.mm64.msa == MM64_MSA_PMSA_SUPPORT )
>> +    {
>> +        if ( system_cpuinfo.mm64.msa_frac == 
>> MM64_MSA_FRAC_NONE_SUPPORT )
>> +            goto fault;
>> +
>> +        if ( system_cpuinfo.mm64.msa_frac != 
>> MM64_MSA_FRAC_VMSA_SUPPORT )
>> +        {
>> +            p2m_vmsa = false;
>> +            warning_add("Be aware of that there is no support for 
>> VMSAv8-64 at EL1 on this platform.\n");
>> +        }
>> +    }
>> +    else
>> +        goto fault;
>> +
>> +    /*
>> +     * If PE supports both PMSAv8-64 and VMSAv8-64 at EL1, then 
>> VTCR_EL2.MSA
>> +     * determines the memory system architecture enabled at stage 1 
>> of the
>> +     * Secure EL1&0 translation regime.
>> +     *
>> +     * Normally, we set the initial VTCR_EL2.MSA value VMSAv8-64 
>> support,
>> +     * unless this platform only supports PMSAv8-64.
>> +     */
>> +    if ( !p2m_vmsa )
>> +        val &= VTCR_MSA_PMSA;
>> +    else
>> +        val |= VTCR_MSA_VMSA;
>> +
>> +    /*
>> +     * cpuinfo sanitization makes sure we support 16bits VMID only if
>> +     * all cores are supporting it.
>> +     */
>> +    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
>> +        max_vmid = MAX_VMID_16_BIT;
>> +
>> +    /* Set the VS bit only if 16 bit VMID is supported. */
>> +    if ( MAX_VMID == MAX_VMID_16_BIT )
>> +        val |= VTCR_VS;
>> +
> 
> #endif
> 
> - Ayan
> 
>> +    p2m_vmid_allocator_init();
>> +
>> +    WRITE_SYSREG(val, VTCR_EL2);
>> +
>> +    return;
>> +
>> +fault:
>> +    panic("Hardware with no PMSAv8-64 support in any translation 
>> regime.\n");
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> -- 
>> 2.25.1
>>
>>

