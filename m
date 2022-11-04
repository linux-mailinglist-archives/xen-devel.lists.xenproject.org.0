Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C0E619435
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 11:08:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437424.691833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtcs-0003Bd-IY; Fri, 04 Nov 2022 10:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437424.691833; Fri, 04 Nov 2022 10:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqtcs-00038J-F6; Fri, 04 Nov 2022 10:08:38 +0000
Received: by outflank-mailman (input) for mailman id 437424;
 Fri, 04 Nov 2022 10:08:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/tm=3E=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oqtcq-0001vd-Nv
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 10:08:36 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2069.outbound.protection.outlook.com [40.107.105.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a507b180-5c28-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 11:08:35 +0100 (CET)
Received: from AS9PR07CA0004.eurprd07.prod.outlook.com (2603:10a6:20b:46c::14)
 by VI1PR08MB5375.eurprd08.prod.outlook.com (2603:10a6:803:130::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 10:08:32 +0000
Received: from AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46c:cafe::44) by AS9PR07CA0004.outlook.office365.com
 (2603:10a6:20b:46c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT029.mail.protection.outlook.com (100.127.140.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:31 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Fri, 04 Nov 2022 10:08:31 +0000
Received: from 7924ad5a5fe0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5BD9A308-DE6C-44FA-B7FE-8633549C9490.1; 
 Fri, 04 Nov 2022 10:08:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7924ad5a5fe0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 10:08:24 +0000
Received: from DU2PR04CA0284.eurprd04.prod.outlook.com (2603:10a6:10:28c::19)
 by AM0PR08MB5522.eurprd08.prod.outlook.com (2603:10a6:208:18c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 10:08:21 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::88) by DU2PR04CA0284.outlook.office365.com
 (2603:10a6:10:28c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:21 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 10:08:21 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 4 Nov
 2022 10:08:19 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 4 Nov 2022 10:08:17 +0000
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
X-Inumbo-ID: a507b180-5c28-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TfByFkQGrSdhPJG24VveoaKZgpx0sU9JD+bARs8qaKgPBIY3qQZhIOmlldLqGoYI6+bQEvtob+o07JOs9n1mOBi5joSgPwt3Sarn5d8iFPUGXZxs1UnQ/DBMSzc7k+053tg6Il9l20hEbS1TfCZ4dnidbK9nnMegSC0JKyuD8GJLiFQqiNVbDzeSKQGPz4zEkPt3ac8nw3CvSr/Ne9MqEWj6E4bhtRA/RPGa/3vQsf6Jfs6izPJIpKn7HttlvtgbqxPIsFRPPOfTFe/FTkJRzalt7zIhAr2/QeOg2qfiC/p9f2m0quyUV/86HAtZ1M3+VI3LqqKCHgLGN3FLUfXw+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCd70HB+Ye/vhd/9W0lE5d6TeJM/wcz47Dx4Zx5CnmE=;
 b=AdOTaDZb0/rrzdMse5C1z5teK1mlWSvgHipDoGUrPd6QqPLO8PEr56hKi5J/BGNI2sHeQk9gFWpmAIlvMFb4o0SLUpE72GskLLNoZNICM5/idsymfJSiVwWQU+ZDib3HIJVIGbXPK1S/qVvitEYz8E8zZnL15bwljFo/ymXixZxDxmm/Dip2VKGnSpgCFmK6I+a2dzY5/byXMV3UNjpBmINSvy9b/UXLInsIa95oj8reVvhoRvp+ut+eyky/YZ5/DyWLbVjDSKART1VTW3XoUR9L52SPuwQCOvjE5gufMGXfSDq0TC54yqbAcMsDmOw9R6xDH3j67MOfWaTdBLocNw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCd70HB+Ye/vhd/9W0lE5d6TeJM/wcz47Dx4Zx5CnmE=;
 b=c7jCFSUVDNU02gs9JkeXhb6tBJmG/FGIz4IFQFpdzr+QCrgbvoR0trvFgn32JsUamtE5b/koZdTQRfJqLiTrFiXSEGv438ikiVP3mBJvRD7duUx70zOkq4+xTgF22Lk0nN5LkwwLclu7D/+gmQuA4C9d+WxMi6LF1klECt73aNk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dec930ebccc60966
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8Rztg9IsZ9E3yxJb884z+TenrY4rlNBpNuHeNHncZuF53UmgF3KqDqIeehbLMKmEN25yqfp2aO8P8qHFEGZObP3k+8OvigxGYfBgk+IOq+8nkngcgGXYm1DgfUk06p8O51778NSuf8Gh9TITqVoFL3Qhqc0QAB8kIdZADYPgTm2rA9761PciVSN1kyZMhN/XHJ0ENXFWBv3tuvvV9wLUh1glOFU5aYzeC4fKZpGsZSASYM+GNGbzfuw7ViNEcjgYhmB/oAJG319Xt69PKM08EFsT2HtYy5905hN459WxPYbXv/xPJUAlaCDzhk3dyAX/IgKttaLgr498T58qsKIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCd70HB+Ye/vhd/9W0lE5d6TeJM/wcz47Dx4Zx5CnmE=;
 b=ZIZ3Db7AGfWuzjcQq38Hpk1UYpCkJd/HJh/+HmZjZiQFF2qOWEmzkCCFwhzyo1Ok97M0ou4KmfHGTrAm1CflLicmSWbjl8vvXU6mx7t93RpcsqNRP1aH0viN3bldfusH27XKkJ4POA+GOGPh/fSZjn5czHuHYA40RUZvYlD59Hv4bhcFNdWGfXViUKTfoEBtyjkuntIz6odbp1wG6xgPgN+2z6zUE89COR9/JLFX7jXWUI4BcmQ5eaqQLc/B8eOEdtsH22eoVda4A0Swd7SK0lvmuHxc+1cSv/oqxE43F2m7RpbQFDJ8f6bmAWV1WGHKblEMDyYN4WnJfgNrl8JnPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCd70HB+Ye/vhd/9W0lE5d6TeJM/wcz47Dx4Zx5CnmE=;
 b=c7jCFSUVDNU02gs9JkeXhb6tBJmG/FGIz4IFQFpdzr+QCrgbvoR0trvFgn32JsUamtE5b/koZdTQRfJqLiTrFiXSEGv438ikiVP3mBJvRD7duUx70zOkq4+xTgF22Lk0nN5LkwwLclu7D/+gmQuA4C9d+WxMi6LF1klECt73aNk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 04/11] xen/arm: adjust Xen TLB helpers for Armv8-R64 PMSA
Date: Fri, 4 Nov 2022 18:07:34 +0800
Message-ID: <20221104100741.2176307-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104100741.2176307-1-wei.chen@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	DBAEUR03FT052:EE_|AM0PR08MB5522:EE_|AM7EUR03FT029:EE_|VI1PR08MB5375:EE_
X-MS-Office365-Filtering-Correlation-Id: fa237cae-570c-42c6-d5bb-08dabe4c8714
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 52V1vIbZmYLVBrv5egf7M+GbZZrGJrnIV33m03ena2tSfgVqqqHYcf43koFBeaBHBk6ch10RzRo40eUDYjVvCHYmbGLDzaZgVAz4WX4MNyIf+Yfg2whTa2OrMoII5JlMoqaoqiwR/LI0T+PD/NM2H3+qwL6Y9V1eqRRL7rC4Zr7Vzyxb3alxZt7D3OP7PLTJS6ZtUTuQSiOijs1kKVNCbZgZ7Ksqf9wjj5mmuFzs8ILG2ucumc1PuipHKHIX+ib2e9fQHOaH9Ot3lMJ5cuYK0j29wx89cnUcM11rbqlHEI+9eJevI7sGqFzmQdOGizSGBReoPVDeIFfoyGgZH2s0TZeH/PpBLu5DbooQDHX8KjnOlEJJNFhDG3LmETbc9M6nBPR+kizCmMbGqooQqFZ1EQVSIbzXvcRuUdcf/DkgpBqfdTX77h6uOz1dc4bVqOtQ9EyfUhcW5RLYbx2wSdIXYWEGKYWXuhCqY+n0cHJCSEfHuFGQAepzsRLmWxxauGDpeStJWXolxzgEvYYVEBYa3VL/XrxalaiX1LEqtUusHHgAgj1WlncXZaaXuy9c4ALx5KGg7q47qQrS82Y6A61vOj6FHkd5XV9/vfE0rn7dplkLNf7nbtD7azIYJqxU2/MJHbvWxklq5uShJmqHAtlgO+aUNQDMmdSW2BXjHbon+qcfCaHcMvNH1ywn0lWLMh7lXfQU6K8+7GvSdYLWiIZGktJCaZID1+ZRnlYkv5aTzDv76PExl0RG9hP9zQNmN9D+b8yl8P9t59CPOHh9qYDg48dk1oV2MkZSRV9aBPgG7Sp1+wITUYc0Yrm5y0gnL9aAoUMrXxBg8mTfsY09bdSGEg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(4326008)(8676002)(26005)(70206006)(70586007)(6916009)(316002)(54906003)(36756003)(6666004)(8936002)(41300700001)(966005)(478600001)(86362001)(7696005)(47076005)(44832011)(5660300002)(1076003)(356005)(81166007)(186003)(82740400003)(82310400005)(83380400001)(426003)(40480700001)(40460700003)(336012)(36860700001)(2616005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5522
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9e5de0fb-20be-46dc-a718-08dabe4c80e2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HKg+hDu5UZfwir/UWdIkkonTpDbs61aYS/ZtvJ9bpwC7vWYA6fOAhQuM8jK5f24W/RyjyYTq5HIPRBA2hUMbYUBAr8EklgUTQULEvgoZ2cgqQziE5y1xNeBxkOt71eOLSjiBe8WYSHaxQ9GcvIRddxGLY5p+Zd34rI+DqL7zKwEtR2ftzwKhJnrpJqUdVB/b1BaIY9wG7JsvOTTsBol+M2jrUyfeJ2dGTcy+/Td+P9zLMNiJri1Nr2cgU5gOUcTfC5Yo0/30E7VmBn9Qnp0ag9O2ujadyWn3wMKjjFRSMkPQMoVLnDtd3b71API6qPS+QOCDl5iY/46VNrfXLpxqmOMAaJLWxVgnFRqRberZ0QRvlrZdH3DYnNQHqXhsXFnrc0UwFmIJELbw9OxinJmGr7zmvaMIzSeBbnNbDjUYORM1DZTAJJlkICIpDRW9QkUUiY901ytxDZNQbpr3IX95oHGXxEfoppjf4sja455ARpZvutaxo6pfy8ylrEq9wMG3dwAPJeAogpQA/x3qQS1bUWMgNBj1IEcNMClmZKhnxYEvgCxRRUPgSJuDSOG04JXgUTOCJjNkIHZdmlzYpU79rjUB1uXy9Ys4WI31zB+OAsmOglcA5gNzFQl2TBmoybXEwCzyV9eJV2y5UHmg440Jsu+77hUf6TfgpkTmRAXwpGtizRjzrr4VtT0PZfa7Y23rSaKnMaKiWRfQa9DLffV+XO81j+BbwrLYFnwKLetNcbDEbLJi6LwMSvOzZY/Z5Hwy54n7axJBjROCdLrmhzYux8clW2GGLhkjCISPidkuMpUYe0/vTD7NoY8Fvza8R7sS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(81166007)(82310400005)(40460700003)(36756003)(40480700001)(86362001)(82740400003)(41300700001)(26005)(8676002)(70206006)(70586007)(4326008)(186003)(1076003)(2616005)(44832011)(336012)(8936002)(5660300002)(966005)(7696005)(6916009)(478600001)(107886003)(6666004)(316002)(36860700001)(54906003)(426003)(83380400001)(47076005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 10:08:31.7084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa237cae-570c-42c6-d5bb-08dabe4c8714
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5375

From Arm ARM Supplement of Armv8-R AArch64 (DDI 0600A) [1],
section D1.6.2 TLB maintenance instructions. We know that
Armv8-R AArch64 permits an implementation to cache stage 1
VMSAv8-64 and stage 2 PMSAv8-64 attributes as a common entry
for the Secure EL1&0 translation regime. But for Xen itself,
it's running with stage 1 PMSAv8-64 on Armv8-R AArch64. The
EL2 MPU updates for stage1 PMSAv8-64 will not be cached in
TLB entries. So we don't need any TLB invalidation for Xen
itself in EL2.

So in this patch, we use empty macros to stub Xen TLB helpers
for MPU system (PMSA), but still keep the Guest TLB helpers.
Because when a guest running in EL1 with VMSAv8-64 (MMU), guest
TLB invalidation is still needed. But we need some policy to
distinguish MPU and MMU guest, this will be done in guest
support of Armv8-R64 later.

[1] https://developer.arm.com/documentation/ddi0600/ac

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/include/asm/arm64/flushtlb.h | 25 +++++++++++++++++++++++
 xen/arch/arm/include/asm/flushtlb.h       | 22 ++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 7c54315187..fe445f6831 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -51,6 +51,8 @@ TLB_HELPER(flush_all_guests_tlb_local, alle1);
 /* Flush innershareable TLBs, all VMIDs, non-hypervisor mode */
 TLB_HELPER(flush_all_guests_tlb, alle1is);
 
+#ifndef CONFIG_HAS_MPU
+
 /* Flush all hypervisor mappings from the TLB of the local processor. */
 TLB_HELPER(flush_xen_tlb_local, alle2);
 
@@ -66,6 +68,29 @@ static inline void __flush_xen_tlb_one(vaddr_t va)
     asm volatile("tlbi vae2is, %0;" : : "r" (va>>PAGE_SHIFT) : "memory");
 }
 
+#else
+
+/*
+ * When Xen is running with stage 1 PMSAv8-64 on MPU systems. The EL2 MPU
+ * updates for stage1 PMSAv8-64 will not be cached in TLB entries. So we
+ * don't need any TLB invalidation for Xen itself in EL2. See Arm ARM
+ * Supplement of Armv8-R AArch64 (DDI 0600A), section D1.6.2 TLB maintenance
+ * instructions for more details.
+ */
+static inline void flush_xen_tlb_local(void)
+{
+}
+
+static inline void  __flush_xen_tlb_one_local(vaddr_t va)
+{
+}
+
+static inline void __flush_xen_tlb_one(vaddr_t va)
+{
+}
+
+#endif /* CONFIG_HAS_MPU */
+
 #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/flushtlb.h b/xen/arch/arm/include/asm/flushtlb.h
index 125a141975..4b8bf65281 100644
--- a/xen/arch/arm/include/asm/flushtlb.h
+++ b/xen/arch/arm/include/asm/flushtlb.h
@@ -28,6 +28,7 @@ static inline void page_set_tlbflush_timestamp(struct page_info *page)
 /* Flush specified CPUs' TLBs */
 void arch_flush_tlb_mask(const cpumask_t *mask);
 
+#ifndef CONFIG_HAS_MPU
 /*
  * Flush a range of VA's hypervisor mappings from the TLB of the local
  * processor.
@@ -66,6 +67,27 @@ static inline void flush_xen_tlb_range_va(vaddr_t va,
     isb();
 }
 
+#else
+
+/*
+ * When Xen is running with stage 1 PMSAv8-64 on MPU systems. The EL2 MPU
+ * updates for stage1 PMSAv8-64 will not be cached in TLB entries. So we
+ * don't need any TLB invalidation for Xen itself in EL2. See Arm ARM
+ * Supplement of Armv8-R AArch64 (DDI 0600A), section D1.6.2 TLB maintenance
+ * instructions for more details.
+ */
+static inline void flush_xen_tlb_range_va_local(vaddr_t va,
+                                                unsigned long size)
+{
+}
+
+static inline void flush_xen_tlb_range_va(vaddr_t va,
+                                          unsigned long size)
+{
+}
+
+#endif /* CONFIG_HAS_MPU */
+
 #endif /* __ASM_ARM_FLUSHTLB_H__ */
 /*
  * Local variables:
-- 
2.25.1


