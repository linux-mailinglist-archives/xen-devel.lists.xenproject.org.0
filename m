Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F139522921
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 03:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326065.548901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRZ-0004qE-EP; Wed, 11 May 2022 01:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326065.548901; Wed, 11 May 2022 01:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nobRZ-0004lX-Ao; Wed, 11 May 2022 01:47:13 +0000
Received: by outflank-mailman (input) for mailman id 326065;
 Wed, 11 May 2022 01:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VMk+=VT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nobRX-0004GU-Dg
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 01:47:11 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe02::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 455f0c6e-d0cc-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 03:47:10 +0200 (CEST)
Received: from AS9P194CA0003.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::12)
 by VI1PR0802MB2174.eurprd08.prod.outlook.com (2603:10a6:800:9c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 01:47:07 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::d3) by AS9P194CA0003.outlook.office365.com
 (2603:10a6:20b:46d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21 via Frontend
 Transport; Wed, 11 May 2022 01:47:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 11 May 2022 01:47:06 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Wed, 11 May 2022 01:47:06 +0000
Received: from 6988c89139aa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 66EB7FA4-648F-4F6B-BB99-DC48BFFFF6D7.1; 
 Wed, 11 May 2022 01:47:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6988c89139aa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 01:47:00 +0000
Received: from DU2PR04CA0318.eurprd04.prod.outlook.com (2603:10a6:10:2b5::23)
 by AM6PR08MB4088.eurprd08.prod.outlook.com (2603:10a6:20b:a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 01:46:58 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::9a) by DU2PR04CA0318.outlook.office365.com
 (2603:10a6:10:2b5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Wed, 11 May 2022 01:46:58 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 01:46:58 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 11 May
 2022 01:47:02 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 11 May 2022 01:47:00 +0000
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
X-Inumbo-ID: 455f0c6e-d0cc-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ok5CyOeuc5iCr5/Ow2NlN/JVQfNgqbQI6AwdgHqgiNcm0ozSB7SGcptm7qZiH4UKvDLQCES9l0ZVkLkoD8oTJ779M8x7HRomRwXQZgLmPGZsjcq0diEoTVbdQQhPCn5fcINaSUw05+qczmjG215os32+E16CfzjctO+xX1UnizRIJVVsH243JaHED3k3859/NKzamrqe15B0fJIuU6pjeUGIXLj1elijAtqycZJ5qu1KHigWLEk3po/mCyYEyAv8K/umr1gYehNwrbQfXbIrwioPvlBoQRvluqHXSnC1CG/BVAXj/ivLEhufavxPAiQpVLywvPRPCo0zSk0ow74FxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/jj6swJvwW7oaPWf61xuXLCqACdkaqKcZ14A1cc0Po=;
 b=gftvtevopxys/ClG/riOg7vQ6b3XCo0eE/HmoyB/M6WyqPfoNVQHO0FHk/ipNcHOZW2iscUONold1RYRG/nIwcTEXcWA7sBN5H2dC/Fd/8aVZ8nFj08YVftSr3+m4gMolLJrg8/IAl6uQDrTcl/46ThknWBEv9mEKkUBX9UyFwQG/L6dC1fR53s0thQ+6mhH6cQUZLEutk0Hai/3AhXxIwTA/rlnHRz5OGt4HJzJ2jexI6azIKLidom7DmtO7bX1tPC+RmMkXovxLkcR0pouDWEU/6lh82T1z8s3S4FPpTel0NjejJvoNQB+0lEZVChoqReJ+CdqWzjcMQ3ITqlv0Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/jj6swJvwW7oaPWf61xuXLCqACdkaqKcZ14A1cc0Po=;
 b=shvxiBzG8eWn8Rlrg5mTx93hUNwufAReCg+4Q8M9Tk5fpCcf4/HNhS1wAKgma6d/AH0YeLHbtz0KLzpbbcSO2/6+9QAIlBl+tPGTUpF43n06kXr9wx6UpNm8tfugnHoMxSqs/i/l+akivCFKNhWKKZpUrbPjQM/1iAloVVE5rOs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e6acb762ac9f9092
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cn6wZhv2NdrvO5W8IQE45hNexTnPLrBll7smfmwTI8UACcaVmUlQ7H5OCVDfeIWFLNIH5+fM+GjiT+CW0IjqVGp/y+6oRPUO1m5y1TG8T2lpgxKTC3wNBEVH/BmPnS3QVD1UMUkd8f/Ywqg5WNAgauKXp2Pjwg8A94D8H5V2DXBbTWiK/e9uWibDoBOtdxAlVaSdcz16hsTovt6pP7JRoc/xCWvQPUAVbajh9nhCQD6NyjcGgIx7Y8bSsgcBsbxdmNKRcIPjAYqtbOOPZpRxVLSCeDITlzXhYaQEurpktqDJ+Eh0/DJ5LOp7vfWda+EXdoyPI+p9Gi7L5hYBIaR1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/jj6swJvwW7oaPWf61xuXLCqACdkaqKcZ14A1cc0Po=;
 b=Z76qAbTvrGOEFiq0FBAdlzL2WuyJ2mh7bmClMPdXjsXnjSZBnDQ0gTNYBEdr9hJzIy+2ZaU2LOSv0l9DqrHkh+LbmnKolMl7FVa+0BeQifXDfDTixRuAdxZPO2CI2CDO8cTbwjIFuERZ/KXO2l+jW2WVSBmz70qrAuO2Qi41/5i/y/v08K59p28g6kpO51BTbZiH0VhjqxNWLxVEyvgMCw+/0M7Vrr9guboy2LyYpaD6n3mWdmOkvi464rL51svO93QRVwqlARtWM46kECUW2LPNrtgojZlSQlGvFYp3yQvguB5q3aXOIig/608n96jenpDP1KrpiHZbiXA9yuAQpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/jj6swJvwW7oaPWf61xuXLCqACdkaqKcZ14A1cc0Po=;
 b=shvxiBzG8eWn8Rlrg5mTx93hUNwufAReCg+4Q8M9Tk5fpCcf4/HNhS1wAKgma6d/AH0YeLHbtz0KLzpbbcSO2/6+9QAIlBl+tPGTUpF43n06kXr9wx6UpNm8tfugnHoMxSqs/i/l+akivCFKNhWKKZpUrbPjQM/1iAloVVE5rOs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiamei Xie <jiamei.xie@arm.com>
Subject: [PATCH v3 3/9] xen/arm: Keep memory nodes in device tree when Xen boots from EFI
Date: Wed, 11 May 2022 09:46:33 +0800
Message-ID: <20220511014639.197825-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511014639.197825-1-wei.chen@arm.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: bf6d0f12-d0ce-494e-3e73-08da32f027f5
X-MS-TrafficTypeDiagnostic:
	AM6PR08MB4088:EE_|AM5EUR03FT064:EE_|VI1PR0802MB2174:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB21740BE306E986B50A85F0069EC89@VI1PR0802MB2174.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 A7jl5UZcJw9a32kcKiKE7ieB0QeUfVmpFy8dLw7AT9bz98JkWrqln0UVPJP/81OvyOYWyTDYaeqgvNPzorjLsp0i4QCEelFtqm4i8X94gjBTAG11lkidQ6Bq0ac+s/8dLf9VSMpWsDEIIUNG23Y6Ug4s+pO4xLLDs2jw+dha3ptw54ZIzpImke0sIcf5sJ6AwcyeRFSkM5CzEP9TCbmmvuXZ/fJ+j5E6ARF9XR5AvqYZl4OwNc1U7O+C1FuAVeg6nGBIbvfqrOgUWxn2roPkdXn/yO2L8F6TAE0ZZJAZ/SD2OusL+qYuDnpcNS7Jpi5G9fZnsLhWtOIuSGw4MmY+1tSCnIaNYkEVlNsCY6jDh/xkRT9m46WUSjnSWW98qJLxDhjcMGEpC1oL+NRmvO5k83eWcJ1BKC1wd1wK+/b0mL6DPE2C+OTiH41bCbRUzRxwPAsWdt6pMTEvvInrGPoOUaOVbH8myEKpMWAVaNNP5Zu1k7ThsxeLXvkOQ+btxPB+HUrx/gDNXwnH5sw8tYDDv29SD/FbbPvs3B5+JjDsfKXpPtzVHyvVfJ4OvvcF8lMISoXrio8HpOSXyvmTtu0VCgXGgS4lqqLbGUYuEgkNhA7T3pNomMPFtzjEQp+u7UzX0PRNS0k3ilmKJXs5v7wl7v2oJPLJuPzF6xRfDAgrXt/AF99X+eTSQqXxNinSVqgd0ejVBkYeq2JgbnSgDQTQVg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(1076003)(426003)(47076005)(336012)(36756003)(82310400005)(7696005)(186003)(54906003)(316002)(70206006)(6916009)(508600001)(81166007)(4326008)(70586007)(2616005)(356005)(8676002)(40460700003)(6666004)(44832011)(5660300002)(8936002)(86362001)(83380400001)(36860700001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4088
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f67028f7-0756-4475-7423-08da32f022c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aR6x9aD0H+KPNXee7VaQr9AFdjIbGMz7YNDYsHF558JjSJsuzz23Eeki/W53Ums4vE9j0KeRA717iVN29owXXcwSor0i0xrmJzDdHwk8lgI4O5lNff4IUjOYEjm/vCQPdkdt0dCo3zF+YHgAEHn7nCD/h8nImQlDy5vYvU0F5Y6gWfCq7vPUXOXVI8jh5Wywu1VXPRaO8uOwtMrV3C8zbnzoPU4spKoA4HxHT7zDPlZhw/jM++rQ47PFcjNl6B947cjUQWyKtMKkjVEOhovG9qpBbyAXjLVkd6Qg0eYl8W1X8spqGCQIxOLF51dPLz0WEVLGJN+DTbq4bl5slQEZAxSck5Qk8f3gcpxQKEeeWH9/k16M1iFfRaFe6q3FQeKIDCmr3NaIDCmpWY7rZW7KDOB0gwEFZ9FGVwcXJzfci8v5TR4pWB3gANQ8YAQu+njdMfltTVo2mGb4xK1VI1OVyd9bmJ2eFqxZQugPLXSNUvb2Ttl2hmOf92idHZPceN/McplBDSlfsedvu/G+AqxuiRAKEH2UaKtIl+PCeFh/9TUHLmS799HpDee9mw08J8qyDr5s+NeEq0BFBDbrgNApTsUTzIGbzrtIFQ5/SWkgZJiQgpQ1o6kT092zBPiHd+Cl6SnxyEwWSh3dHsCLeHuFqKwlrhRxWiuogiwUY5RNm7g1G/U2UBCUxsiEouzrsF0n
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(81166007)(83380400001)(336012)(426003)(47076005)(82310400005)(2616005)(1076003)(6666004)(7696005)(6916009)(54906003)(186003)(40460700003)(8936002)(5660300002)(26005)(36860700001)(70206006)(70586007)(2906002)(316002)(8676002)(4326008)(44832011)(36756003)(508600001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 01:47:06.9801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6d0f12-d0ce-494e-3e73-08da32f027f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2174

In current code, when Xen is booting from EFI, it will delete
all memory nodes in device tree. This would work well in current
stage, because Xen can get memory map from EFI system table.
However, EFI system table cannot completely replace memory nodes
of device tree. EFI system table doesn't contain memory NUMA
information. Xen depends on ACPI SRAT or device tree memory nodes
to parse memory blocks' NUMA mapping. So in EFI + DTB boot, Xen
doesn't have any method to get numa-node-id for memory blocks any
more. This makes device tree based NUMA support become impossible
for Xen in EFI + DTB boot.

So in this patch, we will keep memory nodes in device tree for
NUMA code to parse memory numa-node-id later.

As a side effect, if we still parse boot memory information in
early_scan_node, bootmem.info will calculate memory ranges in
memory nodes twice. So we have to prevent early_scan_node to
parse memory nodes in EFI boot.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
1. Add Rb.
v1 -> v2:
1. Move this patch from later to early of this series.
2. Refine commit message.
---
 xen/arch/arm/bootfdt.c      |  8 +++++++-
 xen/arch/arm/efi/efi-boot.h | 25 -------------------------
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 29671c8df0..ec81a45de9 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -11,6 +11,7 @@
 #include <xen/lib.h>
 #include <xen/kernel.h>
 #include <xen/init.h>
+#include <xen/efi.h>
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sort.h>
@@ -367,7 +368,12 @@ static int __init early_scan_node(const void *fdt,
 {
     int rc = 0;
 
-    if ( device_tree_node_matches(fdt, node, "memory") )
+    /*
+     * If Xen has been booted via UEFI, the memory banks are
+     * populated. So we should skip the parsing.
+     */
+    if ( !efi_enabled(EFI_BOOT) &&
+         device_tree_node_matches(fdt, node, "memory") )
         rc = process_memory_node(fdt, node, name, depth,
                                  address_cells, size_cells, &bootinfo.mem);
     else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index e452b687d8..59d93c24a1 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -231,33 +231,8 @@ EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
     int status;
     u32 fdt_val32;
     u64 fdt_val64;
-    int prev;
     int num_rsv;
 
-    /*
-     * Delete any memory nodes present.  The EFI memory map is the only
-     * memory description provided to Xen.
-     */
-    prev = 0;
-    for (;;)
-    {
-        const char *type;
-        int len;
-
-        node = fdt_next_node(fdt, prev, NULL);
-        if ( node < 0 )
-            break;
-
-        type = fdt_getprop(fdt, node, "device_type", &len);
-        if ( type && strncmp(type, "memory", len) == 0 )
-        {
-            fdt_del_node(fdt, node);
-            continue;
-        }
-
-        prev = node;
-    }
-
    /*
     * Delete all memory reserve map entries. When booting via UEFI,
     * kernel will use the UEFI memory map to find reserved regions.
-- 
2.25.1


