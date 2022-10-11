Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 208EB5FB152
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 13:18:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419578.664373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDGZ-0004q4-Rz; Tue, 11 Oct 2022 11:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419578.664373; Tue, 11 Oct 2022 11:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDGZ-0004mp-OS; Tue, 11 Oct 2022 11:17:43 +0000
Received: by outflank-mailman (input) for mailman id 419578;
 Tue, 11 Oct 2022 11:17:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s0xJ=2M=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oiDGY-0004mj-CW
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 11:17:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 517f2c44-4956-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 13:17:40 +0200 (CEST)
Received: from FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::10)
 by AS2PR08MB8672.eurprd08.prod.outlook.com (2603:10a6:20b:55f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 11:17:37 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::bf) by FR3P281CA0060.outlook.office365.com
 (2603:10a6:d10:4b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 11:17:36 +0000
Received: ("Tessian outbound 86cf7f935b1b:v128");
 Tue, 11 Oct 2022 11:17:36 +0000
Received: from 3d56859cccad.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 98E9BC8D-BB58-43C4-81D0-43894675FEB3.1; 
 Tue, 11 Oct 2022 11:17:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d56859cccad.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Oct 2022 11:17:29 +0000
Received: from FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::14)
 by DU0PR08MB8686.eurprd08.prod.outlook.com (2603:10a6:10:402::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Tue, 11 Oct
 2022 11:17:27 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1e:cafe::89) by FR0P281CA0080.outlook.office365.com
 (2603:10a6:d10:1e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.20 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:27 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Tue, 11 Oct 2022 11:17:27 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 11 Oct
 2022 11:17:26 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 11 Oct
 2022 11:17:25 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 11 Oct 2022 11:17:22 +0000
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
X-Inumbo-ID: 517f2c44-4956-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ftn3sGz+YvNcpBwNjBcF79AFOCwkrOsURiu+3WeLqrBGpO+MjC5TiFbfe2qOr+HTOtubdCKeiE7/XZGH10Y0FGs5LBT4u0/0DV0W5ZvaDO/X09cuhEjndpNKLpLjwdlxph71sNgZXv7AmuryRvjAKXwWHVgIS1xb5nT92OA1V+7sHKIfn1vnXAzHhmUsD/6iaY6Ym2R6U+rOeJgPN3wA/XDn92ErDG227fQXb+BQuVSq0RY6tbN8pqdNnKqQ8I/6maAWVMAnD1YhshRZN9qNO/G+O1/JOBpfrHFwTJtOxUlR28sEStqm3N2D15qv2VVzNoNzDLWhOdsWczW6oifllw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcgLla+HZ240syv8yfnm4s6c61WXbrfIb18OF9+do9c=;
 b=cy5SlO0858Vcn+i4AOVx+DVYGr8nRMRsydZvL1B/kqdzhzhAdCndoG1azQrPqVEOP66rVaa/nlOa2Y67SlUvrDMcNH5cW5gZi3a42I4ojsa23G++/p3X8PKXwOE0JZjOPD5ySvMZsQ624ntT+K8ImGeH5Q8YiGm7AdOSotWT5lL9hgthVk1f1DbrAplpMa3YeHhOGHXRlWLBME/EOIjR9vOlMG28p6/o5DoNzNuwGQ6fbkySmN0AFuTOXiscGdxbwZwx6OF3pm8iaSyGmkJq9T5MuIqUuPhuZArR3FpAL9CN1iLLQIpApro4jXIS8L9EuodlyX/DXS+ak7HoPi9M7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcgLla+HZ240syv8yfnm4s6c61WXbrfIb18OF9+do9c=;
 b=ULko2i5VUUMwMk1WvZgmS7AQwXe9QRmIfOVhZScVRGPmHmtnzrIhQkIG11jao2Oi1O1o+m7QAi0nm0hO0zHwNy7NVJC1+dwN1KFoPOSe/vGAlV3ZblF4Lxzv3y5AwM1fl28fl0yIUQE/1iTFV/pLyWtiIt/2b6Fb6UjXggjHxsM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 285fc00237352b6c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYaViO5cnB5fv3iJqAtbt0p5sjKxdZy5CjTTJBhZo0GCiDDEWisS3N7eNQs9Omj9IGtQuAByRWbCkO4zdzkf0QzyNHWlFQ2mjAjSHZ3diKohbSsLf7vwhTzngUsWWOONrEDKvziR4c2ze63HxIgZi7AHyvbfGhnCkEfSGgJrAKjyfBaqlrDraLz2ej+9dOaiYYOkUDUTK3vV6rPOkhAj80xUsRstRpJ8DwVIspOmbVdC+PDKgSNwrqtfb52YKFkHYwORq4O6BDL14aHfuIqeaWhKaSLptwMBKEeWZMD6DNXU31VfT+C34gx41y2Uq68kzuMWPXFwTRd8sghcxXxHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcgLla+HZ240syv8yfnm4s6c61WXbrfIb18OF9+do9c=;
 b=PwWbxEq6zw2lrC2y0jxI8cu6EkUt2R8L6yLHwf0wz0az+opG67UlVb3q3TWQ86Brx9NasMm9QgEYpDv6K79k8oQ+/UipzeAwvr+CyIe4hTughCYYPcQ7lp5Zhv7GEiutgRbPJ4BK9CiCYWOZnyhLD28FJt9dFDK1Ka/yi79ONN58UwMozvdyr4rSd+eSkKgRMPbEofIFTQUj7Q2kpWcOLdaTLKZGfo1MYsOmFbYCm0G4+gfJqplreOmHG9iC/+8vjviQ8v9Tt2Th2cKTDVrK4H3mTnJZ3vVGQaFVoAH6HKRDjjtAgaklge1sqp0rE3FtPsxFxG8C1qJZ748UGhVQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcgLla+HZ240syv8yfnm4s6c61WXbrfIb18OF9+do9c=;
 b=ULko2i5VUUMwMk1WvZgmS7AQwXe9QRmIfOVhZScVRGPmHmtnzrIhQkIG11jao2Oi1O1o+m7QAi0nm0hO0zHwNy7NVJC1+dwN1KFoPOSe/vGAlV3ZblF4Lxzv3y5AwM1fl28fl0yIUQE/1iTFV/pLyWtiIt/2b6Fb6UjXggjHxsM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 0/6] Device tree based NUMA support for Arm - Part#2
Date: Tue, 11 Oct 2022 19:17:02 +0800
Message-ID: <20221011111708.1272985-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VE1EUR03FT040:EE_|DU0PR08MB8686:EE_|VE1EUR03FT003:EE_|AS2PR08MB8672:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a7414f-fa4b-44a4-c7cb-08daab7a33bb
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BTStB5u0z1eJ5nlzYSKfp5KfptKxnyE6xNyNzR52O/4AWqzAzajWOBNCqhFd1aKrlCsE/TB/3xnEEq6FygxYQ0D2XCFHxG4CbT5lJe7PVt1Vo3sessTb+N584gz/LDlOJC0X086Grb3or1hcqycBLYecvRXj7xNyDPT8n/SWmxJA1M1tQGekisMGC6e2ofSCWQEsepy3EHRQbNcCNifmHpDWygNsUdfUdjgo/XPwSAKZJHv6Wgr9jZp8c5GdtpPfsve3u4gsDikpD/kiqKrq9ffnODaE0clFvr3xxZMCgSmNxnnL1v7k1VtAz8k8Oo1UFK6nIFi1CwrinTWZTD5OO3FSIFJptjw45pLPTc3anLBDv5vSQIka0SsswbeysxCtBCyVEEPlMAKcaCJctY98o1jitW0FB4E1dVFRpAr7OswEKYnQ+z4LNIcAE6gvfXKNK2da2hqn1L5vtcJ5GJQT1e9xwU4PzoyQ5gFY25XQ+py+HFl/OlVUAJFkSLo5F4bro3ElXFCj5i06RZ2IvgzAlOvAhYdCZOm47lbBkL+SxGBy3h3S8cAvJBRBsncnG7oDU8KfFRbdFLtldfbJociEi5HsvVT9JjlQoc5vdn0kt20bas6QqzWS7FcdcaorkPFatIzsBcyb8tkGTrmiHTSjqZqdhUS3uE973ApldS0ePChSFlaUns0bv5hFfpWZbb86SMPEXXdVcoe7bsINh0OtxjCI2vhtgc8N4zY3VhA7dBAtKeu01jwnQrjuha6NbeIBKnFfNOnUoJubo9jVMlvul4CA9ot6B2RvN+icVcasmrI35lC/J7yLh6V0PmGo/7rlPRUIg5TY8244JTjIUvpJznak8kVeFM5SW+tWZU9m04YYpWo1D1Zr7N6qAf5fuT2Y
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(70586007)(478600001)(966005)(8936002)(6916009)(4326008)(316002)(54906003)(8676002)(70206006)(6666004)(26005)(5660300002)(41300700001)(82740400003)(336012)(1076003)(40460700003)(2616005)(7696005)(186003)(44832011)(82310400005)(36860700001)(2906002)(83380400001)(426003)(356005)(36756003)(86362001)(81166007)(40480700001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8686
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d6a1e9f5-ec10-4941-40cb-08daab7a2e06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AfVZ83Bvw0WVvs2bRYqetktFauC/btL1N28qc+4t1YCQxviuGvqkFw+PpZrfaBfSESvD/5MZVRlE3nGzfdr2i4aJE0kjjWBLcKCShxbht/bOe2A9LVwSOyul4OHkVOIwOBdxF/4L8amrJC+6aR4i4ba6il5MVXc9YybY6SKPibma+apiezkenHEUomr+Y9+CiLPG2XEevhw8mwgb5JNBzCuFuy6jEHqCXCndffAHha67o3EriPxXJL/abefahaStWfDwMmq5BX4Em1re3a/09MfzSNTvHIrwuwlvqSMbdFQdhukWqhRgikRYrlNRoPeisEPzNcrnSgj5Ib7tK0CpATL2CTblPiDcmNiGET1uXGTqX0W+JWYDpOnKp7nHsnsZ4NhW/uK7qkerxcd6QZlWpKXxqYH3hAbXhDEyDYEoV4xp6odGhcAiujxLrnvyBKQgPaiIC3G5tq7C0HmhdkPORQmkDyisE9RiF6BZDRxtYdBvy7Pk1hPktSYWxOd6uDEldbY8GPL7Tl1YTBomRE2yZ1lz4Kez61hhPDxra4/yWQTIRwBILIawIyf2agOTwGWuy7n8vQ4HltSqMMrL1R9LUnZC6qvD35wGbs2oexe7kB+SJ6aS547mIaTPS/5eD+Tk9iUiNS2vFPSeq0tggREopsPAOw/r+0KxyYcRtn/g8/7XA9YHPI/jeBy5PHimng/7BEG4pT8/E7OiiGcq0grl4Xp5XiTXYFAXrkpCW3Gn50ti/UGXgw2GxD/30hBPyJgyeiFhqy8jG03mg+Tqj45pZKkPZRH2VR/ba+o5qqXZx7K8bbP45CcGONtoc2mS/oPuqgi0hM1bScPq1zyom0uGUw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199015)(40470700004)(46966006)(36840700001)(70586007)(8676002)(70206006)(26005)(7696005)(4326008)(1076003)(186003)(316002)(107886003)(478600001)(54906003)(6666004)(41300700001)(47076005)(36756003)(2616005)(336012)(426003)(83380400001)(6916009)(8936002)(44832011)(82310400005)(36860700001)(86362001)(5660300002)(40480700001)(966005)(2906002)(81166007)(40460700003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 11:17:36.7244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a7414f-fa4b-44a4-c7cb-08daab7a33bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8672

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series - merged in [1]
2. Move generically usable code from x86 to common - this series.
3. Add new code to support Arm.

This series only contains the second part patches. As the whole NUMA
series has been reviewed for 1 round in [2], so this series would
be v6)

Xen memory allocation and scheduler modules are NUMA aware.
But actually, on x86 has implemented the architecture APIs
to support NUMA. Arm was providing a set of fake architecture
APIs to make it compatible with NUMA awared memory allocation
and scheduler.

Arm system was working well as a single node NUMA system with
these fake APIs, because we didn't have multiple nodes NUMA
system on Arm. But in recent years, more and more Arm devices
support multiple nodes NUMA system.

So now we have a new problem. When Xen is running on these Arm
devices, Xen still treat them as single node SMP systems. The
NUMA affinity capability of Xen memory allocation and scheduler
becomes meaningless. Because they rely on input data that does
not reflect real NUMA layout.

Xen still think the access time for all of the memory is the
same for all CPUs. However, Xen may allocate memory to a VM
from different NUMA nodes with different access speeds. This
difference can be amplified in workloads inside VM, causing
performance instability and timeouts.

So in this patch series, we implement a set of NUMA API to use
device tree to describe the NUMA layout. We reuse most of the
code of x86 NUMA to create and maintain the mapping between
memory and CPU, create the matrix between any two NUMA nodes.
Except ACPI and some x86 specified code, we have moved other
code to common. In next stage, when we implement ACPI based
NUMA for Arm64, we may move the ACPI NUMA code to common too,
but in current stage, we keep it as x86 only.

This patch serires has been tested and booted well on one
Arm64 NUMA machine and one HPE x86 NUMA machine.

[1] https://lists.xenproject.org/archives/html/xen-devel/2022-06/msg00499.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg01903.html

---
v5 -> v6:
 1. Revert arch_numa_broken to arch_numa_disabled, as acpi_numa
    can be set to -1 by users. So acpi_numa < 0 does not mean
    a broken firmware.
 2. Replace numa_scan_node to numa_process_nodes in commit log.
 3. Limit the scope of page_num_node, vnuma and page of numa_setup
    function.
 4. Use memset to init page_num_node instead of for_each_online_node.
 5. Use %u instead of %d for nodeid_t and j in numa_setup print
    messages.
 6. Use min(PADDR_BITS, BITS_PER_LONG - 1) to calculate the shift
    when only one node is in the system.
 7. Drop the marco: node_to_first_cpu(node)
 8. Use arch_numa_unavailable to replace arch_numa_disabled for
    acpi_numa <= 0.
 9. Remove Kconfig for HAS_NUMA_NODE_FWID.
10. Use numa_fw_nid_name for NUMA implementation to set their fw
    NUMA node name for print messages.

v4 -> v5:
 1. Use arch_numa_broken instead of arch_numa_disabled for
    acpi_numa < 0 check. Because arch_numa_disabled might
    include acpi_numa < 0 (init failed) and acpi_numa == 0
    (no data or data no init) cases.
 2. Use nodeid_t instead of uint8_t for memnodemap.
 3. Restore to use typeof(*memnodemap) for _memnodemap, this will avoid the
    further adjustments for _memnodemap's type.
 4. Use __ro_after_init for numa_off.
 5. Use pointer-to-const for proper function parameters.
 6. Use unsigned int for variables that are not realy used for node ID.
 7. Fix code comments code-style and adjust the length.
 8. Fix code-styles.
 9. Rename numa_scan_nodes to numa_process_nodes.
10. Defer introduce arch_numa_disabled for acpi_numa <= 0. And remove
    the paramter init_as_disable of arch_numa_disabled.
11. Fix typo "expandsion".
12. Fix Indentation for l1tf_safe_maddr.
13. Remove double blank lines.
14. Add a space between for_each_node_mask and '('.
    Add a space page_list_for_each and '('.
15. Use bool for nodes_cover_memory return value.
16. Use a plain "int ret" to record compute_hash_shift return value.
17. Add a blank line before the function's main "return".
18. Add new Kconfig option HAS_NUMA_NODE_FWID to common/Kconfig.

v3 -> v4:
 1. Add init_as_disable as arch_numa_disabled parameter in the patche
    where use it.
 2. Drop unnecessary "else" from arch_numa_setup, and fix its
   indentation.
 3. Restore compute_hash_shift's return value to int.
 4. Remove unnecessary parentheses for macros.
 5. Use unsigned int for proper variables.
 6. Fix some code-style.
 7. Move arch_get_ram_range function comment to header file.
 8. Use bool for found, and add a new "err" for the return
    value of arch_get_ram_range.
 9. Use -ENODATA instead of -EINVAL for non-RAM type ranges.
10. Use bool as return value for functions that only return
    0/1 or 0/-EINVAL.
11. Move mem_hotplug to a proper place in mm.h
12. Remove useless "size" in numa_scan_nodes.
13. Add CONFIG_HAS_NUMA_NODE_FWID to gate print the mapping
    between node id and architectural node id (fw node id).

v2 -> v3:
 1. Drop enumeration of numa status.
 2. Use helpers to get/update acpi_numa.
 3. Insert spaces among parameters of strncmp in numa_setup.
 4. Drop helpers to access mem_hotplug. Export mem_hotplug for all arch.
 5. Remove acpi.h from common/numa.c.
 6. Rename acpi_scan_nodes to numa_scan_nodes.
 7. Replace u8 by uint8_t for memnodemap.
 8. Use unsigned int for memnode_shift and adjust related functions
    (compute_hash_shift, populate_memnodemap) to use correct types for
    return values or parameters.
 9. Use nodeid_t for nodeid and node numbers.
10. Use __read_mostly and __ro_after_init for appropriate variables.
11. Adjust the __read_mostly and __initdata location for some variables.
12. Convert from plain int to unsigned for cpuid and other proper 
13. Remove unnecessary change items in history.
14. Rename arch_get_memory_map to arch_get_ram_range.
15. Use -ENOENT instead of -ENODEV to indicate end of memory map.
16. Add description to code comment that arch_get_ram_range returns
    RAM range in [start, end) format.
17. Rename bad_srat to numa_fw_bad.
18. Rename node_to_pxm to numa_node_to_arch_nid.
19. Merge patch#7 and #8 into patch#6.
20. Move NR_NODE_MEMBLKS from x86/acpi.h to common/numa.h
22. Use 2-64 for node range.

v1 -> v2:
 1. Refine the commit messages of several patches.
 2. Merge v1 patch#9,10 into one patch. Introduce the new functions
    in the same patch that this patch will be used first time.
 3. Fold if ( end > mem_hotplug ) to mem_hotplug_update_boundary,
    in this case, we can drop mem_hotplug_boundary.
 4. Remove fw_numa, use enumeration to replace numa_off and acpi_numa.
 5. Correct return value of srat_disabled.
 6. Introduce numa_enabled_with_firmware.
 7. Refine the justification of using !node_data[nid].node_spanned_pages.
 8. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
 9. Adjust the conditional express for ASSERT.
10. Move MAX_NUMNODES from xen/numa.h to asm/numa.h for x86.
11. Use conditional macro to gate MAX_NUMNODES for other architectures.
12. Use arch_get_memory_map to replace arch_get_memory_bank_range
    and arch_get_memory_bank_number.
13. Remove the !start || !end check, because caller guarantee
    these two pointers will not be NULL.
14. Add code comment for numa_update_node_memblks to explain:
    Assumes all memory regions belonging to a single node
    are in one chunk. Holes between them will be included
    in the node.
15. Merge this single patch instead of serval patches to move
    x86 SRAT code to common.
16. Export node_to_pxm to keep pxm information in NUMA scan
    nodes error messages.
17. Change the code style to target file's Xen code-style.
18. Adjust some __init and __initdata for some functions and
    variables.
19. Replace CONFIG_ACPI_NUMA by CONFIG_NUMA. Replace "SRAT" texts.
20. Turn numa_scan_nodes to static.
21. Change NR_NUMA_NODES upper bound from 4095 to 255.

Wei Chen (6):
  xen/x86: Provide helpers for common code to access acpi_numa
  xen/x86: move generically usable NUMA code from x86 to common
  xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
  xen/x86: use arch_get_ram_range to get information from E820 map
  xen/x86: move NUMA process nodes nodes code from x86 to common
  xen: introduce a Kconfig option to configure NUMA nodes number

 xen/arch/Kconfig                 |  11 +
 xen/arch/x86/include/asm/acpi.h  |   2 -
 xen/arch/x86/include/asm/mm.h    |   2 -
 xen/arch/x86/include/asm/numa.h  |  61 +--
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/mm.c                |   2 -
 xen/arch/x86/numa.c              | 441 +----------------
 xen/arch/x86/smpboot.c           |   2 +-
 xen/arch/x86/srat.c              | 335 +------------
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 802 +++++++++++++++++++++++++++++++
 xen/common/page_alloc.c          |   2 +
 xen/include/xen/mm.h             |   2 +
 xen/include/xen/numa.h           |  96 +++-
 14 files changed, 959 insertions(+), 801 deletions(-)
 create mode 100644 xen/common/numa.c

-- 
2.25.1


