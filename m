Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC6B5BE183
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 11:13:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409246.652218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJC-0003eE-Rv; Tue, 20 Sep 2022 09:12:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409246.652218; Tue, 20 Sep 2022 09:12:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJC-0003bg-OO; Tue, 20 Sep 2022 09:12:50 +0000
Received: by outflank-mailman (input) for mailman id 409246;
 Tue, 20 Sep 2022 09:12:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UnT0=ZX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oaZJA-0003bZ-PR
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 09:12:48 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10043.outbound.protection.outlook.com [40.107.1.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63ecb0fb-38c4-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 11:12:46 +0200 (CEST)
Received: from FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::19)
 by DB9PR08MB8316.eurprd08.prod.outlook.com (2603:10a6:10:3dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.18; Tue, 20 Sep
 2022 09:12:44 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1d:cafe::a9) by FR3P281CA0005.outlook.office365.com
 (2603:10a6:d10:1d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:12:43 +0000
Received: ("Tessian outbound 0a0431bdcdb4:v124");
 Tue, 20 Sep 2022 09:12:43 +0000
Received: from c4d10218c58e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5EE85EC8-136C-48ED-8130-286F8D496A36.1; 
 Tue, 20 Sep 2022 09:12:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c4d10218c58e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Sep 2022 09:12:35 +0000
Received: from FR0P281CA0148.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::9) by
 DB3PR08MB9134.eurprd08.prod.outlook.com (2603:10a6:10:42b::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.21; Tue, 20 Sep 2022 09:12:32 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::a5) by FR0P281CA0148.outlook.office365.com
 (2603:10a6:d10:96::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:32 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 09:12:32 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 20 Sep
 2022 09:12:30 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Tue, 20 Sep 2022 09:12:27 +0000
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
X-Inumbo-ID: 63ecb0fb-38c4-11ed-9647-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cMKmnyOp7n6qP9Sc7Xe0ANptQKkTbxAEu4N2PV6uTvICA8PvTXq48He+wrIM3P8IiiWSXdiWvr2gegTlXQsVlFI7D3PP+oZEzeEHrElUB3wEeYFUz6SEAizocLZRWlrYVEO8R91G+4m+1nnBA4i+A5utGqzcLnIxi2dcKT0ixtmRNU6pFnlFdKgw143sbDYsjQR5X2V3WZM+UBly3+UpaTxZfVi8mSX/6usw599fckNdIzhr0uqO8j2mwtUl3J+sJwdc0QZ3ZW9hmPmukznOEGd2+n2hpHwdnUCuEHeXIcDm5YJFzjakav6RIJh3yuzRSSPkVQJwxM0Irman6H6/rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fz6gJyYDH2FKgfyLnRBJc6Pg7LGjMwC4R5POpxJ6VzY=;
 b=nhfF7var8lbBd8zupb34OIC7JAXC1EDdmdmLdJ0HeJ9veQlSd35Bn9fS9Ntc7yAPS/Cql+d2Qw6p/kDOYm46gyd/jkdAfhmsS93sCieLBuuVV8HLaJtLpcd7kHj/5eW3hkkQK7utg86+fCMLVP7OBtZD3bXApqkGhJUQ7d/pa08qrtm32wHVrHwF1rTzvkrvXaG0RFXE9dT0s9Xr4wbBsoRcXUzFKIJqydzFTbMtdhZuJlxixwNGyJrBBGzafRVR/TJISxtHXKAoRBah06oUeNYtbFPs2wCAqChP66dg3RYcyi3mpJbMhaXgYrTVdDT2VU861Kk4XWUDl/moHMIJoA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fz6gJyYDH2FKgfyLnRBJc6Pg7LGjMwC4R5POpxJ6VzY=;
 b=x+L+J7lCJ8WX6hRY6F3aJLTbIETWhtnLdza+RmaG9qKZr2Vtma4jHCW/qMnKavp7g+BOF6Oy0U+7wgevWnK/E1Z+yvcMAJT7VvvMWHlV2yGaow47PAXtUrBWAEMoptp37EZpn58PfdXI8gT1EBk11Q5Dp4Kp5t2aRLUV6eyjFtg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6994b95900535bbb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9WsJBKe3dS34qSRQEhrXls1hWIS8hgQUdCcgI1lS+IyVwcihsrzLDc/T3TVyQ0Ax94vUcOCcx668rHpQAyvZ1mI/2giBYlruZgS4h6Sti3vs/BFVwsO/tWNoGjgnv6iv8tshG4QuQaYs2+Zw+PzhBZDRqyU1GF8QcDA686hw7kdBbAgUfJPwrREQ/UwY74ioJWGwTmOx87Ai7F8z2R2sug8/CbA5Gyy8unCr4gKr0xmHjrkAn7e6jv2jPo77WhRx3Ls+5w3T6BEAtGi9t6hcCZ2knFnW9ozdDSvxI07bLIlbWFTYv0JbpHKNMPQo24w2JSrntUzShw/8B0pXbu//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fz6gJyYDH2FKgfyLnRBJc6Pg7LGjMwC4R5POpxJ6VzY=;
 b=S34BCn2Ho35juyp4Jja1zxEOjy22Jkk/XjuwZrZRSIML7X4Cf+K9gutFoQCUKjVXX4u9ddznAfZ7gQqTEBTMnp4hPXQwifcYqk/xuDOYhARg6spXCxS+HByoiMBqddZVBtZanY6R14BXQbdBLN65HCL5mmVfQ0gCwOHDRlQw1uLqdxkQr6YVNW43ynzOjkxVS1R0K/ZCXO/rWsuqEm4jQMD5DA4C/sPDrAkPv4MZRrbC61bEag1mfyCeWrhwX7eRLBm08LwMpKV/oTyKu0ZM5Hw7/jeYYQZzW8Esi30Mrfn2ArQ/intrS2zaKXPreY+jpF9DNUViZjsJHcRE5jCDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fz6gJyYDH2FKgfyLnRBJc6Pg7LGjMwC4R5POpxJ6VzY=;
 b=x+L+J7lCJ8WX6hRY6F3aJLTbIETWhtnLdza+RmaG9qKZr2Vtma4jHCW/qMnKavp7g+BOF6Oy0U+7wgevWnK/E1Z+yvcMAJT7VvvMWHlV2yGaow47PAXtUrBWAEMoptp37EZpn58PfdXI8gT1EBk11Q5Dp4Kp5t2aRLUV6eyjFtg=
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
Subject: [PATCH v5 0/6] Device tree based NUMA support for Arm - Part#2
Date: Tue, 20 Sep 2022 17:12:12 +0800
Message-ID: <20220920091218.1208658-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VE1EUR03FT049:EE_|DB3PR08MB9134:EE_|VE1EUR03FT064:EE_|DB9PR08MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 743e3f97-0cdf-45ef-fa9d-08da9ae846bc
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sTHxk/Ki2LQ11GdPnA8t5/Ujtrd/s6k68SlG7u3oiznw45ojeRLE5dRm/nSb4wU3Ys2xAkjPduW+2S21tzcqjEZMXSIMO61NVooX8q+7lpCaYBXr3E9dv7grKUhGPyilp8Dx82qDCJPIyZ5v/kzOIAk172DoQ8NtHNLzZi6yaPhHdqoSEzrQZJSY5+v62ZS9ZPtJdmLyYHS3wLciZ8egHIoAxgqAghSvLGKCw8PwP1kqDAWaMUiSbN6xdMZbnyXjFHz6Lo8nbEdVYEmemJAZfaDXUdtDLHgr6fr3f97uABFHg31k8K1vS42k4oYZa2EOTO5gSyorTDNKGtkoznzV9UuYS0kfQaCDBNlZas2bNkYCj5z3Im0OLpgpm1hyU80ohLO7BoN1tC4Gaz9q4a+wWQxmgtc1be8BBLxVYBruzmYWwy5lC+oOWOi6ZkoTS+rxNA2OLOMSWQoTaFd3gmEby7K18rGaBJhmq/caLWUc5sNurxZ+SRtGAkMCDypkhj2OIUfQ04bLN7L7I2FdgPQzxej20YchSuWW1I/j4/5nMnbkzB2G6ny3uIWL8BYVU0RzW3wiPldmu288+1adMI2gvSnNF8UprqR4jLKVHNL301/sFgXH7qQMoNTVeqJbgqmtiwy7vNK3hI6nAJWBbV3t6fFdxht7jHe6THFrRh4DSmP+rIXY0WLnScJfyYKuwUzuumhVsA7irWjVvT0XeNDUXncdHtNpXRhxvY8h2RalH3nOCcrWIODlsyvA59KfITMqjNA77dlJGSn5hvox4ckZdDP90ocYINoBSiiTTk4huUGtZLpu/2GAulcwhuoZb6PqLmgWJ+Ge1lFGg6WWKh6hvcK+MJFB5cvJUNFje/SFCHCFDgO4+7E08pQ1R27w5CPL
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(26005)(81166007)(82740400003)(70586007)(40480700001)(6666004)(36860700001)(8676002)(4326008)(966005)(44832011)(2906002)(2616005)(54906003)(41300700001)(356005)(7696005)(186003)(47076005)(70206006)(5660300002)(36756003)(478600001)(86362001)(8936002)(316002)(6916009)(83380400001)(1076003)(40460700003)(426003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9134
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	947da64e-3d16-4847-1955-08da9ae8400f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/W6u++J6ISSngSzsRhRXlFj2bpYQokBFeFZtJ9y1JGrOyfQ+tlr9CT5fmTKSVTEwt/pJ/2ZqBw/Sv4PG14Drw0dd+/8YoMTr5oLA3CLcXNKx/HmpJWHVwU5GgHjnW51hHlrXEG7cSOOTxSfjzzL+B6V5wuXJY80lTCNiwzyRc9TAvcENZP4vEI3zcx7NeQFGcCuTm7Ik/fwUwBvOq4DH376R5vcK3tab4MeMKlX4Eur+7ezq+/lm8gldmU3gJKdjaGpNpYtvg1yQDcKqZntTHKjhibxrSI/tU86HB5B9Mu8MSbx7zgby0YmXbTL9n2Zj2sN/vla/Wf2og6JdNJDoraAFuCeD1vo/cWYEexK5anttAk5v/HlP+Jt/4obzmyX0onbL2uZjQUmijDvxXT4k3kRE0qkGmIgGr0I/vyoFqage+tv62SAbw1l+RAlSKNbL1bxkiQ3J0ozGpONKxvUmQEVRKpIfrTH5KHUduO0KVv2/MYeZ6HuJYLUQhSHErKlucfzdKCyNaQpeotChidBuqEgXGvQmUbHfCvtpv9YOTlkVYxuYwYl/npcnFhYjjrQhJum8fcxtqaJqMx6cq5JVAknTkD/CEBimcyRfD6KR5jX/Z0rCZG0iGnDx4IcbIdsZLvOVElcRbQ8lPZ3UTWi/irdrFxJAMGoTDIoCs4od06AzeOARu4aLYUsAOO+LbIhyXVuAerJ5TC0Qg1nUxrO9Zml5A2T1IFicK42q1Xc0N79P7Nd5WqbkyQn3/xGiF2r9Er7t7Xb4PYsfek2rrdnJlzKWiJ8KvPE84uEd3QEn7yy53/eq3G05PX3OPBz5rJRfLQ1uBct4SLe6RXO+M2Fw8A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(46966006)(40470700004)(36840700001)(81166007)(70206006)(8676002)(8936002)(86362001)(44832011)(70586007)(2906002)(336012)(2616005)(426003)(186003)(83380400001)(47076005)(26005)(6666004)(41300700001)(40460700003)(966005)(107886003)(316002)(7696005)(4326008)(478600001)(6916009)(54906003)(82740400003)(36860700001)(1076003)(40480700001)(5660300002)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 09:12:43.4664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 743e3f97-0cdf-45ef-fa9d-08da9ae846bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8316

(The Arm device tree based NUMA support patch set contains 35
patches. In order to make stuff easier for reviewers, I split
them into 3 parts:
1. Preparation. I have re-sorted the patch series. And moved
   independent patches to the head of the series - merged in [1]
2. Move generically usable code from x86 to common - this series.
3. Add new code to support Arm.

This series only contains the second part patches. As the whole NUMA
series has been reviewed for 1 round in [2], so this series would
be v5)

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
  xen/x86: move NUMA scan nodes codes from x86 to common
  xen: introduce a Kconfig option to configure NUMA nodes number

 xen/arch/Kconfig                 |  11 +
 xen/arch/x86/include/asm/acpi.h  |   2 -
 xen/arch/x86/include/asm/mm.h    |   2 -
 xen/arch/x86/include/asm/numa.h  |  61 +--
 xen/arch/x86/include/asm/setup.h |   1 -
 xen/arch/x86/mm.c                |   2 -
 xen/arch/x86/numa.c              | 438 +----------------
 xen/arch/x86/smpboot.c           |   2 +-
 xen/arch/x86/srat.c              | 311 ++----------
 xen/common/Kconfig               |   3 +
 xen/common/Makefile              |   1 +
 xen/common/numa.c                | 780 +++++++++++++++++++++++++++++++
 xen/common/page_alloc.c          |   2 +
 xen/drivers/acpi/Kconfig         |   1 +
 xen/include/xen/mm.h             |   2 +
 xen/include/xen/numa.h           |  98 +++-
 16 files changed, 943 insertions(+), 774 deletions(-)
 create mode 100644 xen/common/numa.c

-- 
2.25.1


