Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32141743362
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 06:09:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557256.870440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF5Qb-0001np-Rk; Fri, 30 Jun 2023 04:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557256.870440; Fri, 30 Jun 2023 04:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF5Qb-0001kn-Ou; Fri, 30 Jun 2023 04:08:13 +0000
Received: by outflank-mailman (input) for mailman id 557256;
 Fri, 30 Jun 2023 04:08:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ekiN=CS=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qF5Qa-0001kf-AY
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 04:08:12 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b84bfdbd-16fb-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 06:08:08 +0200 (CEST)
Received: from AM0PR04CA0103.eurprd04.prod.outlook.com (2603:10a6:208:be::44)
 by AS8PR08MB10361.eurprd08.prod.outlook.com (2603:10a6:20b:56d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 30 Jun
 2023 04:08:05 +0000
Received: from AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:be:cafe::ea) by AM0PR04CA0103.outlook.office365.com
 (2603:10a6:208:be::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 04:08:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT064.mail.protection.outlook.com (100.127.140.127) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.22 via Frontend Transport; Fri, 30 Jun 2023 04:08:04 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Fri, 30 Jun 2023 04:08:04 +0000
Received: from 160c291652e0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 23A9A78E-FF89-407F-ABA5-1FD3F9B379F0.1; 
 Fri, 30 Jun 2023 04:07:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 160c291652e0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Jun 2023 04:07:58 +0000
Received: from AS9PR05CA0067.eurprd05.prod.outlook.com (2603:10a6:20b:499::23)
 by GV1PR08MB8306.eurprd08.prod.outlook.com (2603:10a6:150:a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 04:07:54 +0000
Received: from AM7EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:499:cafe::85) by AS9PR05CA0067.outlook.office365.com
 (2603:10a6:20b:499::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 04:07:54 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT039.mail.protection.outlook.com (100.127.140.224) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6544.22 via Frontend Transport; Fri, 30 Jun 2023 04:07:54 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 30 Jun
 2023 04:07:52 +0000
Received: from [10.169.188.49] (10.169.188.49) by mail.arm.com (10.251.24.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 30 Jun 2023 04:07:50 +0000
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
X-Inumbo-ID: b84bfdbd-16fb-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDI9o7V19HxsA4+l25QCa7afQWHFFQ8GWEyymb/4jtU=;
 b=jq093Y51hjJuHayLAmLPzrP7V5Qgi+PgRcvpzjFmxj7FKEHHRz2rrX2jBHfScvm9Zqbun7qcKYF+QlzxF1avwmgu1YjqjAhPDtv5R9kM34QK57j6br0/Y7a9ZoDvE1xgISAcE2JUHFLeQzgTetXYW9gPV9bUyLF/xgm2OyO6Nj8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e29a8de0a6842c68
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUtcl6eDuwB0+oFHOze0BKl18E50PoA2RnyoAJSumfekXSxvCPahEhcoz/brmMJ85sVIFS+MO5n67ZUNuYWVCOF5/okdO0SOzyPVMjrL2SwZiMyo+XtpKiTcR0kRL5ENMyqwPJaH6VQqgI95phBdzU+NGBH3VcQkRQqdXY/QXGDVbiTDH8Mpqz2TmPM7UtKofPNIbM/PWPupTumlCADbwKNEawmGEijpwZmfGIeRVBNHWHP0Wj5nlISWOlcdSJQ8OmyehRV/153mfVnI9EZChYNAL3GI9tGBQgkpK6e0AilpSwxswLglA+4jK0yg/aY6SPqxaFZKy4w9Q2SLZmwhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDI9o7V19HxsA4+l25QCa7afQWHFFQ8GWEyymb/4jtU=;
 b=XJy03NBUSw6vBN3z7pWXum9UYEPoHwdnTLrD12Su/Q40X9LpfSXph21R4cDXjaZyOY8MmUzz+8mlsB92al/UDNKzb+egiUfgQgXFw8ZXbIIHkS7dBdPhbm0OBjWMJyCtW9bxB+JJRZ+puvbERZCDanY1zDFqIq/tnLUvchMFSwERD7yGRssFIZ5PB9uj8dUmidTVJ5Eus+V4KInADWJDkSuFdXluk/nRdzCPIsRB+xhQSScBr3R3lu/YqHH7Jv+w8H6zwCX70YZ8myQpHGr2K4JUi1uFPmd5wia0kTG3sEtneYBs/+ldCqS7c4fiWf/yizAkAtRwbkPHTLL3otm/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDI9o7V19HxsA4+l25QCa7afQWHFFQ8GWEyymb/4jtU=;
 b=jq093Y51hjJuHayLAmLPzrP7V5Qgi+PgRcvpzjFmxj7FKEHHRz2rrX2jBHfScvm9Zqbun7qcKYF+QlzxF1avwmgu1YjqjAhPDtv5R9kM34QK57j6br0/Y7a9ZoDvE1xgISAcE2JUHFLeQzgTetXYW9gPV9bUyLF/xgm2OyO6Nj8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Message-ID: <a381b1b0-d18a-8fea-56a4-d88c65bd3cea@arm.com>
Date: Fri, 30 Jun 2023 12:07:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 31/52] xen/mpu: make early_fdt_map support in MPU
 systems
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<wei.chen@arm.com>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-32-Penny.Zheng@arm.com>
 <c2a779e5-51a9-f0c8-4c00-a568ff4bde83@amd.com>
From: Penny Zheng <penny.zheng@arm.com>
In-Reply-To: <c2a779e5-51a9-f0c8-4c00-a568ff4bde83@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT039:EE_|GV1PR08MB8306:EE_|AM7EUR03FT064:EE_|AS8PR08MB10361:EE_
X-MS-Office365-Filtering-Correlation-Id: 2772704a-90f7-4071-09e3-08db791f9abc
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GQ5PVzmDyQZ+TS4Nf1W2uYCaTzttqqPnba/4ci1ODkOGMImSGbf0nSsL3zdDxgtuzZuItz8KjE2N7PmZiaMrJL5WZWYHa8dKIfF5ElNr/2AH3D0Ibrip5qHK9aVNBv9izUVRBicHFAJSqYHl8zgv/CuBf7ceUNZo93F75Z2oS6bLaz+YB566xzTHVS/pCpYoT9NTXI3TbMZOhM9b/7vo2tAxzcqUg/zxafx+UuFg1CUVcNX8uyCVUgNtpd6ullgFCJqst+3hYhFTZdGNlV9Zh1nZ5EB2uo5MVBLODSYcNWU+53FYDLlHAkB8jFIOoeUMp1bb6PqrST1RuYBi7qET5OooB7DGlw4zKR81jDQDhKYI/DbWjt/wx3JGhfcKNFT4WaLhq1KmYqcMJTZ5neJ/lWBdQq9NIeee188qr28jdoX6QqMftsA23FEsKhK18d/0eMBlHfLxtY4n7Ip0Ruqy+nsTaCSJDzCzHw1CJ52S8NHbmtGejGeGzk29ffZQD3KckhRE19sj+mnrGyXax4K03/GeoDmBsvenG8sUQgbM0adqr4kD8qmgXhNtXgaEe9RbJuRaDiNooSBikW7UxhHamjlyUIPSIWXL4B64i5adqEhoF/+2i0bNTIDzKB0jcwGEIWi7WIT6BH+Nol7Teu6BgS7XTvcIEkcqz1jvMIrtv7uNKlKofaApHZhx8ax5obKUP3zxNKQ3JpxpoEEUKcKolgkYRwa1GEeU8lVeT7M87dMK0Rd7R1xRBMzplI9HKv4QdTF5lN38rS304gE6QvDnQ17kenXff7UwqyLJnMetce3BMfa/SWgZoCXoe2QeNvkcF+jJorFjIm9C2/RcDFS3LyZ2p5DWqJhn6hmEavpVZO0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(41300700001)(316002)(83380400001)(82310400005)(426003)(336012)(31696002)(53546011)(36860700001)(86362001)(186003)(44832011)(26005)(2616005)(2906002)(82740400003)(356005)(81166007)(40480700001)(47076005)(5660300002)(36756003)(8676002)(8936002)(478600001)(110136005)(54906003)(16576012)(31686004)(70206006)(70586007)(4326008)(21314003)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8306
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7a60422-d6be-4b3c-b65d-08db791f9470
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aYtzJ+rLWjUpz+Bhc/h4ChIbR64nRWobtJA8+DjVTKJPhnzLlqwlbKocbUdbqedRHo9mY2kQIIG+22UA1RTNsQXK0DV3mX0XJr+1XsiSsc7/8jg+FjDwZXHHrDGH+338bUIjgGhP5tTack/eXMK2wdArMSuNyZ8P4xtgIQEDGWlmav86mwOowusNv1yAKBCTScN+SAWmLQG5nmTn/HdjpbEn84NJdd//jec/sz6JBW+fWY6gRAoFz0qcTCZ8nxEJvjWGOsN6WeJ69s3HoKSN9EwxcRDoDUAgpvqnkI3vSt6yeioW129nbkseJeSrp6PT+Rn1AHr4BKefHGIY5jBE+5231RC2sO2zXhpXy1X1NTBcAKb6aH9dwgIXvUxwpnwIyxNnkCJ2rR/YOL7OMNFcBMRhIxghqQM91Ci8k5t03LvPZMo/h35VaswPyn/myx603dI2uUa+oO5EvQnzpeu0ZOfrZIQugHK3yf6rxSFTUeQsDPd5V89oQnW7ES3i+pV+sysNX+SqlRvsN19L0T4TQz4mmYi+1YINn6HMP7Zjt/Wu+hCQpr4N7cPlbSTyi4xMT54PWlz/JwIevzevPdRJHj2CJ1wxKKrnl9L0LAfiXNwd5X4hTRqovGjQdbMg7dgQnyT8JXwTazihZwEfLXzusjKm0c2EoX3a6mNs/SSgcng66MWKp4u0nlBG+tEieiUWRO1QfWkvdixgiQHx9Zrk98qukNolmvyCzxhtkVJF0sDjw40kPO+ddpBvTn36If3pwUYemH5+twal1+WjhW8xa2gQwiIgC2c3szEGtviiW/L5Hlhsb7TA5jw+aX6iZ8G/hMRjXEOaFwoQ99L8q72Trg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(186003)(82310400005)(40480700001)(86362001)(107886003)(82740400003)(81166007)(83380400001)(2616005)(426003)(336012)(53546011)(47076005)(36860700001)(110136005)(41300700001)(31696002)(54906003)(16576012)(26005)(478600001)(70206006)(316002)(36756003)(4326008)(31686004)(70586007)(44832011)(5660300002)(8676002)(8936002)(21314003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 04:08:04.9237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2772704a-90f7-4071-09e3-08db791f9abc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10361

Hi,


On 2023/6/30 01:22, Ayan Kumar Halder wrote:
> 
> On 26/06/2023 04:34, Penny Zheng wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> In MPU system, MPU memory region is always mapped PAGE_ALIGN, so in 
>> order to
>> not access unexpected memory area, dtb section in xen.lds.S should be 
>> made
>> page-aligned too.
>> We add . = ALIGN(PAGE_SIZE); in the head of dtb section to make it 
>> happen.
>>
>> In this commit, we map early FDT with a transient MPU memory region, as
>> it will be relocated into heap and unmapped at the end of boot.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>> v3:
>> - map the first 2MB. Check the size and then re-map with an extra 2MB 
>> if needed
>> ---
>>   xen/arch/arm/include/asm/arm64/mpu.h |  3 ++-
>>   xen/arch/arm/include/asm/page.h      |  5 +++++
>>   xen/arch/arm/mm.c                    | 26 ++++++++++++++++++++------
>>   xen/arch/arm/mpu/mm.c                |  1 +
>>   xen/arch/arm/xen.lds.S               |  5 ++++-
>>   5 files changed, 32 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h 
>> b/xen/arch/arm/include/asm/arm64/mpu.h
>> index a6b07bab02..715ea69884 100644
>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>> @@ -72,7 +72,8 @@ typedef union {
>>           unsigned long ns:1;     /* Not-Secure */
>>           unsigned long res:1;    /* Reserved 0 by hardware */
>>           unsigned long limit:42; /* Limit Address */
>> -        unsigned long pad:16;
>> +        unsigned long pad:15;
>> +        unsigned long tran:1;   /* Transient region */
>>       } reg;
>>       uint64_t bits;
>>   } prlar_t;
>> diff --git a/xen/arch/arm/include/asm/page.h 
>> b/xen/arch/arm/include/asm/page.h
>> index 85ecd5e4de..a434e2205a 100644
>> --- a/xen/arch/arm/include/asm/page.h
>> +++ b/xen/arch/arm/include/asm/page.h
>> @@ -97,19 +97,24 @@
>>    * [3:4] Execute Never
>>    * [5:6] Access Permission
>>    * [7]   Region Present
>> + * [8]   Transient Region, e.g. MPU memory region is temproraily
>> + *                              mapped for a short time
>>    */
>>   #define _PAGE_AI_BIT            0
>>   #define _PAGE_XN_BIT            3
>>   #define _PAGE_AP_BIT            5
>>   #define _PAGE_PRESENT_BIT       7
>> +#define _PAGE_TRANSIENT_BIT     8
> I don't think this is related to MPU. At least when I look at the bit 
> representation of PRBAR_EL1/2,

This set of _PAGE_xxx flags aren't compliant with PRBAR_EL1/2 register map.
It is a flag passed to function map_pages_to_xen() to indicate memory
attributes and permission.
This bit _PAGE_TRANSIENT is to tell whether the new adding MPU region is 
a fixed one, or a temporary one.
The MPU region created for early FDT is a temporary one, as it will be
unmapped at the end of boot.

> 
> bits [47:6] are for the base address.
> 
> If my understanding is correct, then please take it out of this patch 
> and put it in a separate MMU related patch.
> 
>>   #define _PAGE_AI                (7U << _PAGE_AI_BIT)
>>   #define _PAGE_XN                (2U << _PAGE_XN_BIT)
>>   #define _PAGE_RO                (2U << _PAGE_AP_BIT)
>>   #define _PAGE_PRESENT           (1U << _PAGE_PRESENT_BIT)
>> +#define _PAGE_TRANSIENT         (1U << _PAGE_TRANSIENT_BIT)
>>   #define PAGE_AI_MASK(x)         (((x) >> _PAGE_AI_BIT) & 0x7U)
>>   #define PAGE_XN_MASK(x)         (((x) >> _PAGE_XN_BIT) & 0x3U)
>>   #define PAGE_AP_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x3U)
>>   #define PAGE_RO_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x2U)
>> +#define PAGE_TRANSIENT_MASK(x)  (((x) >> _PAGE_TRANSIENT_BIT) & 0x1U)
>>   #endif /* CONFIG_HAS_MPU */
>>
>>   /*
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index d35e7e280f..8625066256 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -61,8 +61,17 @@ void flush_page_to_ram(unsigned long mfn, bool 
>> sync_icache)
>>
>>   void * __init early_fdt_map(paddr_t fdt_paddr)
>>   {
>> +#ifndef CONFIG_HAS_MPU
>>       /* We are using 2MB superpage for mapping the FDT */
>>       paddr_t base_paddr = fdt_paddr & SECOND_MASK;
>> +    unsigned int flags = PAGE_HYPERVISOR_RO | _PAGE_BLOCK;
>> +    unsigned long base_virt = BOOT_FDT_VIRT_START;
>> +#else
>> +    /* MPU region must be PAGE aligned */
>> +    paddr_t base_paddr = fdt_paddr & PAGE_MASK;
>> +    unsigned int flags = PAGE_HYPERVISOR_RO | _PAGE_TRANSIENT;
>> +    unsigned long base_virt = ~0UL;
>> +#endif
>>       paddr_t offset;
>>       void *fdt_virt;
>>       uint32_t size;
>> @@ -79,18 +88,24 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>>       if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
>>           return NULL;
>>
>> +#ifndef CONFIG_HAS_MPU
>>       /* The FDT is mapped using 2MB superpage */
>>       BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
>> +#endif
>>
>> -    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
>> -                          SZ_2M >> PAGE_SHIFT,
>> -                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
>> +    rc = map_pages_to_xen(base_virt, maddr_to_mfn(base_paddr),
>> +                          SZ_2M >> PAGE_SHIFT, flags);
>>       if ( rc )
>>           panic("Unable to map the device-tree.\n");
>>
>>
>> +#ifndef CONFIG_HAS_MPU
>>       offset = fdt_paddr % SECOND_SIZE;
>>       fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
>> +#else
>> +    offset = fdt_paddr % PAGE_SIZE;
>> +    fdt_virt = (void *)fdt_paddr;
>> +#endif
>>
>>       if ( fdt_magic(fdt_virt) != FDT_MAGIC )
>>           return NULL;
>> @@ -101,10 +116,9 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>>
>>       if ( (offset + size) > SZ_2M )
>>       {
>> -        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
>> +        rc = map_pages_to_xen(base_virt + SZ_2M,
>>                                 maddr_to_mfn(base_paddr + SZ_2M),
>> -                              SZ_2M >> PAGE_SHIFT,
>> -                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
>> +                              SZ_2M >> PAGE_SHIFT, flags);
>>           if ( rc )
>>               panic("Unable to map the device-tree\n");
>>       }
>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index 14a1309ca1..f4ce19d36a 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -448,6 +448,7 @@ static int xen_mpumap_update_entry(paddr_t base, 
>> paddr_t limit,
>>           /* Set permission */
>>           xen_mpumap[idx].prbar.reg.ap = PAGE_AP_MASK(flags);
>>           xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
>> +        xen_mpumap[idx].prlar.reg.tran = PAGE_TRANSIENT_MASK(flags);
> 
> ReferARM DDI 0600A.dID120821 , G1.3.23, PRLAR_EL2, Protection Region 
> Limit Address Register (EL2), I don't seethis bit described anywhere. Do 
> we really need this bit for MPU ?
> 

Yes, It is introduced for software implementation.
You could see commit [PATCH v3 36/52] xen/mpu: implememt ioremap_xxx in 
MPU and commit [PATCH v3 38/52] xen/mpu: map domain page in MPU system 
for better understanding.

> 
> - Ayan
> 
>>
>>           write_protection_region((const pr_t*)(&xen_mpumap[idx]), idx);
>>       }
>> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
>> index 4f7daa7dca..f2715d7cb7 100644
>> --- a/xen/arch/arm/xen.lds.S
>> +++ b/xen/arch/arm/xen.lds.S
>> @@ -216,7 +216,10 @@ SECTIONS
>>     _end = . ;
>>
>>     /* Section for the device tree blob (if any). */
>> -  .dtb : { *(.dtb) } :text
>> +  .dtb : {
>> +      . = ALIGN(PAGE_SIZE);
>> +      *(.dtb)
>> +  } :text
>>
>>     DWARF2_DEBUG_SECTIONS
>>
>> -- 
>> 2.25.1
>>
>>

