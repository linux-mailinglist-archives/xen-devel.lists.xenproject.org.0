Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0705B5BE1B6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 11:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409299.652294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZNB-00080g-Jk; Tue, 20 Sep 2022 09:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409299.652294; Tue, 20 Sep 2022 09:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZNB-0007y6-Gw; Tue, 20 Sep 2022 09:16:57 +0000
Received: by outflank-mailman (input) for mailman id 409299;
 Tue, 20 Sep 2022 09:16:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UnT0=ZX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oaZNA-0007y0-8j
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 09:16:56 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2069.outbound.protection.outlook.com [40.107.105.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f83c3283-38c4-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 11:16:55 +0200 (CEST)
Received: from AM6P195CA0017.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::30)
 by DBAPR08MB5624.eurprd08.prod.outlook.com (2603:10a6:10:1a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 09:16:53 +0000
Received: from AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::a4) by AM6P195CA0017.outlook.office365.com
 (2603:10a6:209:81::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.12 via Frontend
 Transport; Tue, 20 Sep 2022 09:16:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT064.mail.protection.outlook.com (100.127.140.127) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:16:52 +0000
Received: ("Tessian outbound fc2405f9ecaf:v124");
 Tue, 20 Sep 2022 09:16:52 +0000
Received: from 3d823101a763.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 795B08DD-2084-45BB-BA64-C40C6B644DC0.1; 
 Tue, 20 Sep 2022 09:12:52 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d823101a763.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Sep 2022 09:12:52 +0000
Received: from AS9PR06CA0707.eurprd06.prod.outlook.com (2603:10a6:20b:49f::27)
 by AM9PR08MB6690.eurprd08.prod.outlook.com (2603:10a6:20b:301::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Tue, 20 Sep
 2022 09:12:42 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49f:cafe::90) by AS9PR06CA0707.outlook.office365.com
 (2603:10a6:20b:49f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:42 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:12:42 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 20 Sep
 2022 09:12:40 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:37 +0000
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
X-Inumbo-ID: f83c3283-38c4-11ed-9647-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BWDAU5TPAaLR9ckzUs8/2uEfcEVyzKNColu2wBP12zM5WsQ1PyeVCnG2hap671iAttrDlLnjlT8Uo2gN74M6pfpni+pn/Mg79G9xzfJkbHbGhD5tMz1C1VIbqixL7VWAHQE3pQ1/WOa3AMWdGjO4C1L43BEK+fWGlNe5pDFzkl4Gg9zrXRhHfUsWWTvV9iARSnJT3VrhSA76ueL05DvL4G2wL6dyrl128G/xuSGTOVgN3Gg64n3359X6IrQUliCnr7Z/tLZ1318ErfPUa0+b6PyV5x9MnOfWqoq3JV5NoOjus1pH8ubPSuGpBFuv6lkxVFkzvjyiyA9FiB/te0xccg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DaMcTmBvEOAxWIqm3dcdE2xbuzXaoqO5YyicuQ8bxo=;
 b=lVhhatIQ1pS/vlGAiqGqjXwc0W2LuR21yV6T1VuEyAaAcOd9UKx57x7NPiwM5w2rHYe+IsC17EsZzDf0877SIFwlzj2xIHvobFZP5u3MNkaa6uqusPhG0Sw0fNYfURHzCBpg8rYynCLqRxm7ZjPaQeVSaMmE1LkCaMddOk53Sn3uUD4OHuY34TfdKA/vwb1WGA8MDVjHHSmNS2kGhOGCZmKHNcDs1UrKzSaSkg2XmJ8ChbCVPm56ZVVKcxT4/TyNCLmCFq8la8tJLPnnx0uFas3y+rrTMlgrf6u7Lj3yze3o/vDV7af3g14P8mP35eD2woUpn77cvh9oKH9/Pi5gYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DaMcTmBvEOAxWIqm3dcdE2xbuzXaoqO5YyicuQ8bxo=;
 b=RgM9cX+dC++EhRTik8CCsp8kT5sR6iFlOPjuHz7b5htyA8YGV0ejelljonRflGqwk5g8cXQXk34zV35Ps4F89ZP6pt5N4lX/UX6Bf4aHWDfnk8VzSsRGHcqnjaaPd5VY4x033PP6uLUL55Vc64DygZxhP0o0Qj3rj5fOnxRCY60=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 43dca8f344d9e2cc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+PXDO/VoelDCejfWvdYh4TLXYHsd499FQPMA5h/kJ/blJQVRgEOxw4vyzM+mSyFLc0cYKUFXwoiIKx1Yd2VTpM/Pf8LdtnAkFTSKCo2GYm2dbqswCr5nHZVi66zYLLU1ZQMnjNeBHPiHgpb4J0WGSPBCcce/O0DVUiB1J3iUM7jOmk6H26neCNGkERZHjOmLJpgRKw42ms6vqUz8vsjUqMcuQibgbCPuB6zgBacy5++SWR7VUKr6hjDmWZWxglqcuBTTPITHwal8KscV3Ds6oekcj69kFr9TN0Pe48ZDrRKAIUtwQeE4shovT6gw+uS4fCJv87vIPGwd9SaKhhJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DaMcTmBvEOAxWIqm3dcdE2xbuzXaoqO5YyicuQ8bxo=;
 b=mcC8ZpByX19NgcnV/wUJjo/QbODtUleRpVdAvJX12RjQeO912gxB0takxSER9K3AlCuPFevdIK3anKnszsxgvHNm1aQ4gGEusyf0iwFplEB0W+9xmovxfyiBH6RGOdJfGBBmg+GPkzjNz9aT9u4x57UhQIkl/rg3uQkTbvmfHQErWCL78LVvx7WlRh4ncnF06QmDo3dACYYwP2b8R3zI825Dceqh67fHfJv+68giTDtiSuoMs9YPVBHCUoTyj0G+hEDHE0GzlCNATayzhHC2ah5NNvqjMNxcIRZs7X1hfrF1gsyaA/cQdizdaYse/ii2cGr+n/F3Qklzs8p8uWZb2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DaMcTmBvEOAxWIqm3dcdE2xbuzXaoqO5YyicuQ8bxo=;
 b=RgM9cX+dC++EhRTik8CCsp8kT5sR6iFlOPjuHz7b5htyA8YGV0ejelljonRflGqwk5g8cXQXk34zV35Ps4F89ZP6pt5N4lX/UX6Bf4aHWDfnk8VzSsRGHcqnjaaPd5VY4x033PP6uLUL55Vc64DygZxhP0o0Qj3rj5fOnxRCY60=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Jiamei Xie
	<jiamei.xie@arm.com>
Subject: [PATCH v5 3/6] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
Date: Tue, 20 Sep 2022 17:12:15 +0800
Message-ID: <20220920091218.1208658-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920091218.1208658-1-wei.chen@arm.com>
References: <20220920091218.1208658-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VE1EUR03FT042:EE_|AM9PR08MB6690:EE_|AM7EUR03FT064:EE_|DBAPR08MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 0250bd80-b067-4514-5b25-08da9ae8db34
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Y9EZAEsKIQfzJUOjncMeIrXgQbWXVU/pUEYrOGF/xUk1qQxG6HaxbAPdcvu77xtfLIwP/iuLBK/zomtmTQfmkaBHlwCn/LBDI6eGgiFBDO890cxvzryTA/Ora0Mfu5RzEUKwaL1wzTHw46P2Jk/nj+doLnfr2XXcwrPoKKeZ/Si/gyrt+fjnnOwsVgRmnZfG1QBKKQOL1opUlAz9lCrjJvs1mfC0pmlIquV1k2xmn13qmTQoD+9TvjnCKtfwcCixE8pxKLBd1dgGqE5jYPHqgVMZ/zsqjL2L9dzW73xXSeVdR/O0KJWskwTjzrghu6ClS8eW380+fAQRQseLzKdsl7iWrrp0Helb2G318pX62RrRyz6oZGJubJFPPZE+bSLUXm6tjq7cIZIa/YGpH6T7iuoT/x8K2vnEaAqQ6MZTuLeaxZkjzUy2RpbumWwPDl6RRpuzMkxEpQx901wu/eYOyoZrccBA8hc8xoygE2Sdx/HcEFhxfpnm+a5iERjqwRcg6KtsEsiqO9mOHmRsSPmrDposQXUEyi1A+4laDtugwIicPV9ow0R/grfK7yOedJPBzVaCI6kpGIzL57JEtg8n3gnxnuv+S3mp4aMpj9zeZP0JAynKQoR+IQ2x+0bgSFxXAvtSPVj8742zh/nvTKtQpdlaLxT8Us10q9RlSmyyq7I3y2eZ2ziDen0HyEAbZBTmyBdUgNUUeAMBHriIcqfAOvQL+OW4FKcdlJuNEiK4+Wf0qM4MvsNG9PatCkPga6PFsUViejOULD0ik06Cqq8e1Mo51qL6rap+7wJdbDFRFnrU3qk/j2+wXD4smTAuLwBV
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(40480700001)(36860700001)(82740400003)(8676002)(86362001)(81166007)(356005)(70586007)(4326008)(70206006)(41300700001)(54906003)(40460700003)(6916009)(82310400005)(316002)(5660300002)(8936002)(44832011)(336012)(2906002)(1076003)(186003)(426003)(47076005)(2616005)(83380400001)(478600001)(26005)(6666004)(36756003)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6690
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0d087843-b9d5-4b1d-2290-08da9ae845ff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fjCpt7xoU3gBwfrQzJodfd/aFl1yx5Qy7rIDIOg4aG94UvKU2MIzUr6mptYxZlpVmbSpWjQsYLh0H/1cjFXUV0Qk8FFBC/hQJSgM1SZqSpHM+zs9dNRdLXcOltrITvUhVlJGYZy5RoNzdN8xo3He6XrLXa2jGQl4BFcHiyJJf68CHIzqRnnLdpGIsTCmSMP2sUnagZx7+GlA9bXTskgHZbWahDI0fcEb8ULZeDmEy4rmGD+5b+vnvPPkmdtwEhoVclTJs+AqFmrbbHncegGGUoOSE89GmF5FxVGbQkkQW9UbFKesigaJKtORhpOUf78RE7b4dyi8XiO9VGyIUB+2xKo/0uBdxghRWtcmF6fEOQd5vncVtfTENMTTdBJySXoQ2Ou38/5WlIu7xtELRipRGq1FwGDq9buFvIjHAR0G0HI4P/E0rU5V5PiFKsze9Uh4MVKzUEqbayN5RbNefkVuNOMVhJRfCCMEao/6gMXRqMfVzVEVBtBgKCVwc7KztxszYuXpslT5YlPHuSmzggLk+jyI3QfGo8YbibmwnbYW9d5FWld2Wxu1dlpx4QxZgwHk4958sq8c7l9TAB4zaXEwbclkJXif8s5SsBxgaiuddsN//ItwpaDOn/h7zNwZU4xZmGqWXBMI79ufymrgg78nqqqJe/obFWNftkRm9X+1kD8EYrmHOZy5FlAhQSRbPWn5UFv3keaK9oGDS9gTUanZqjMuy0u4petx9xvImdLA9NbKfLiB1ojkYk9Hfx0IFr3RCsr9wUJlcg982WePoR9T5w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(26005)(82740400003)(81166007)(40480700001)(6666004)(36860700001)(8676002)(4326008)(44832011)(54906003)(2906002)(2616005)(41300700001)(82310400005)(7696005)(186003)(47076005)(5660300002)(36756003)(478600001)(86362001)(8936002)(426003)(336012)(70206006)(70586007)(6916009)(83380400001)(1076003)(40460700003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 09:16:52.6453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0250bd80-b067-4514-5b25-08da9ae8db34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5624

VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
results in two lines of error-checking code in phys_to_nid
that is not actually working and causing two compilation
errors:
1. error: "MAX_NUMNODES" undeclared (first use in this function).
   This is because in the common header file, "MAX_NUMNODES" is
   defined after the common header file includes the ARCH header
   file, where phys_to_nid has attempted to use "MAX_NUMNODES".
   This error was resolved after we moved the phys_to_nid from
   x86 ARCH header file to common header file.
2. error: wrong type argument to unary exclamation mark.
   This is because, the error-checking code contains !node_data[nid].
   But node_data is a data structure variable, it's not a pointer.

So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
enable the two lines of error-checking code. And fix the left
compilation errors by replacing !node_data[nid] to
!node_data[nid].node_spanned_pages. Although NUMA allows one node
can only have CPUs but without any memory. And node with 0 bytes
of memory might have an entry in memnodemap[] theoretically. But
that doesn't mean phys_to_nid can find any valid address from a
node with 0 bytes memory.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Tested-by: Jiamei Xie <jiamei.xie@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v4 -> v5:
1. No change.
v3 -> v4:
1. No change.
v2 -> v3:
1. Remove unnecessary change items in history.
2. Add Acked-by.
v1 -> v2:
1. Use ASSERT to replace VIRTUAL_BUG_ON in phys_to_nid.
2. Adjust the conditional express for ASSERT.
3. Refine the justification of using !node_data[nid].node_spanned_pages.
---
 xen/include/xen/numa.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index d799078a7a..538b283d95 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -36,8 +36,6 @@ struct node {
 extern int compute_hash_shift(const struct node *nodes,
                               unsigned int numnodes, const nodeid_t *nodeids);
 
-#define VIRTUAL_BUG_ON(x)
-
 extern bool numa_off;
 
 extern void numa_add_cpu(unsigned int cpu);
@@ -70,9 +68,9 @@ extern struct node_data node_data[];
 static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
 {
     nodeid_t nid;
-    VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
+    ASSERT((paddr_to_pdx(addr) >> memnode_shift) < memnodemapsize);
     nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
-    VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
+    ASSERT(nid < MAX_NUMNODES && node_data[nid].node_spanned_pages);
     return nid;
 }
 
-- 
2.25.1


