Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28D35AA66A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 05:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397242.637765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxPZ-00053e-E3; Fri, 02 Sep 2022 03:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397242.637765; Fri, 02 Sep 2022 03:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTxPZ-0004y0-7L; Fri, 02 Sep 2022 03:32:05 +0000
Received: by outflank-mailman (input) for mailman id 397242;
 Fri, 02 Sep 2022 03:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UH2R=ZF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oTxPX-0004Wz-BY
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 03:32:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf29d2fd-2a6f-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 05:32:02 +0200 (CEST)
Received: from DB6PR0201CA0026.eurprd02.prod.outlook.com (2603:10a6:4:3f::36)
 by AM9PR08MB6642.eurprd08.prod.outlook.com (2603:10a6:20b:2ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 03:31:59 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::b0) by DB6PR0201CA0026.outlook.office365.com
 (2603:10a6:4:3f::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:31:59 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Fri, 02 Sep 2022 03:31:59 +0000
Received: from 02871d7c7b46.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 205AAEA6-0047-483B-B2A4-59D5C8FBA078.1; 
 Fri, 02 Sep 2022 03:31:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02871d7c7b46.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 03:31:53 +0000
Received: from DB6PR07CA0052.eurprd07.prod.outlook.com (2603:10a6:6:2a::14) by
 AS8PR08MB8490.eurprd08.prod.outlook.com (2603:10a6:20b:567::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 03:31:50 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::d2) by DB6PR07CA0052.outlook.office365.com
 (2603:10a6:6:2a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.5 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:50 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 03:31:50 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.9; Fri, 2 Sep 2022
 03:31:50 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.9; Fri, 2 Sep
 2022 03:31:49 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.9 via Frontend
 Transport; Fri, 2 Sep 2022 03:31:45 +0000
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
X-Inumbo-ID: cf29d2fd-2a6f-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ShlnwG+b8zbpZNncZipqcLCfRgqI5XneJ5iEtA5TLwtZhXMMyJipbAPaMZy10JG+JKyFywBqq66cx1/rrHw0GhP5MJQ+1Q3R6AF0Fl3Yto/GtCMeiNrhT4mtCz/+z3r2Y9UR2N4JUsOzYLIjtUh3fgtNMxKTIAG0bL06bu+RX0RD0oMDiIHuuUU7q339YJ4g9aFfDEGGdJ79TLWYa1CK2ryIRzsmYC8vU4peq337XGBAKovOXIT64ErR4qRQRaVRuz5JrLgZWAoByxueOHhArL74Y1DbTAnf4qyzg8EYpKSkthvz6e/UVOvtJxMhNUPqOQgWevU4VgcVKwm7jcl3Tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8Uwp6+nNlC0JAJBM8aB8Lyt4DmvZi8C88afoGTR6cA=;
 b=Nm8RkcidI6bOg5wy+UIdGvM5kyKStFNXPFVZBjYb4NJlmyVvEmN00YOIiKmxTmEwvPquJDsF8nIv+4iCqUbDFNuESNQivCQHt4H+oiOAsPBG1RJQe4QASIJ7Xviaew1LSXb2U5gsdk0oPa1jmMKmQzFyPFSXw2YfcPk5x4qBZSgdVXPMalkEz9DrhAsWCK/JIS0rbYwSE4mn9hrIq0jVph5+nr+0YaCvwqGgrSHi3hHzChNqqrHEYsiWoffqUwiee5Q3XN+3jRRQwj92wcQgblb1z3pk5hXvbj4vVUvEM0bUmYxXwXVsBm3SYvU/jHYBeELVYZwfOMA1oI1nTF2kVw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8Uwp6+nNlC0JAJBM8aB8Lyt4DmvZi8C88afoGTR6cA=;
 b=a5X29prkA/1jpbKfEoe/jDTxx4tq4pdxInUzmpjU/HdQVzvzEjKxb2xy5R1BDNXKxlUs++HJhyw67f4kOFMsAKR0QtmU8XNLCsvqW1lxIrrsQc8pypWAPKMvuUiRksNe3EPakcufZi7hEH523F0WH7b/wioaF0C59pLG6AicZtk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1890f22cd6330db
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJEylBXXaGPmRlgU+fDnPbI5sGLGlqiY66gCfMAbxQxtZa/E/0pgpqm0vnOuT5G+JYnZeYDcREvrYB2wvIdEftbaUuZMbv3DcCilVqPQEqALS1bQXxHGqjnPj/XdWtEgLc9FamDEzj4bjdDuPyDQRv9AJ1Mpqvsh/uxEejkPqCp441I3Q0+9+PIAbpSwf/YGV7lkSnwlQRNYaIrnvXJMVsVC/cGJRBh8THeghEUcQqBNFYB0TCozlnK121XlXXisJiNkQb5MQcnAYxHDyOSXjW9uzXMzIyIeKodCfOD0tJK/VCsWLJdo7rAtMI3n7Of4aAqzzzgp7pOdfaZjW77+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8Uwp6+nNlC0JAJBM8aB8Lyt4DmvZi8C88afoGTR6cA=;
 b=J86Tu2GnjgXH2HWIQj5B6Bq4D8n5hwFxYayq6DdqxeyHAyYijn3o4BqSkNEOriaPmiUu6+0G1HlcGRNR4cGvm0/+Y/8VQ5x/FHdsBa041vXaNju86DmzbmDU/oDRZKQNReQ092JLZYJJ+S6iZnzTfMPk01Bf6ak7evfezpJ3VWeggo6rmInNmVxu2470SDE+oZqNVgCgl2y7WZ6sqLODavC6guUxrosWXLn8QM9BNbXc+8n7+a8Rz9AXPWHomExEajq/W/zzWLGlJc+/olrh24sn2zJeV6V5b6Zj/RPtkJtYWwSPhwF0Jhw+3QlhvICdtdJhXj6HdlUv5G/U/ZpS2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8Uwp6+nNlC0JAJBM8aB8Lyt4DmvZi8C88afoGTR6cA=;
 b=a5X29prkA/1jpbKfEoe/jDTxx4tq4pdxInUzmpjU/HdQVzvzEjKxb2xy5R1BDNXKxlUs++HJhyw67f4kOFMsAKR0QtmU8XNLCsvqW1lxIrrsQc8pypWAPKMvuUiRksNe3EPakcufZi7hEH523F0WH7b/wioaF0C59pLG6AicZtk=
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
Subject: [PATCH v4 3/6] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid
Date: Fri, 2 Sep 2022 11:31:18 +0800
Message-ID: <20220902033121.540328-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902033121.540328-1-wei.chen@arm.com>
References: <20220902033121.540328-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 2ab30867-705c-4176-f435-08da8c93b1b6
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB8490:EE_|DBAEUR03FT025:EE_|AM9PR08MB6642:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 T3PBpuTx8nk8FTkjrCL5aA8JMO5gHizsOhGLk0weIMimA8O1/hBKxAYDVtug+HfRa2+1p9JEIYXnKQcbdXjofLSVFivqVK3eJpxACgX+fz5STyfww9/QbIJyYE4eEIqH71/UlTQwcwsnMmE68BFzdLpsmK+9x1qzZFdcqGCDwUYo5iOuqo50fA1T+bdmTVf4hmi/JpnFhqZ2dgPjmnlCWWBbKAdeEmRtT/UOASHi4ERG95wf9vTQY3TyURR4A7GNllzgyM5caZB9XAYi4QO3CeydLMAc2mQIiEn+d/ugjUxZ+1IfU6FQK1zCcJwZGY129YUiCpvN4hNxYd8KmG9aG9WD8wh1L9W9GWSxR87xnGo7r0kM6qxK+4xMfz1MWbMB2EiNobv6OSoRGlnT1nLuqqRzsqTj+0qztTHdcbDBEYF+rgku+Yi0z7N7lGI/Ub52ymbPUA0B2G5r0CcD6voJwg8gtevHEcHRSePZNO3uiPR7LnI9wCBkk5R5UHEvkBPWcuZttSMPDWRgHHVJ+RFxDoKjzLDlrtjPQAV/5sdbRWvYOGerpYZMe8rFamNq9/uVxzzWlH17jF+oCPlApO7okxSRiCOpyLPKzE775svq2zx/LWVQJTZDTr0jAs6OvkzIn4zglVN4GcOBIKMenuTbJRx/6zHhO7tCxiuPOrbufJNOzM/o8Z5tUEfNinR+4/i/h+3FSj+1ZsgUd7FznbPHT5dHPmBheEuFIaiAYFxW7mMbu/ZEmCg4wjwp3OlKE9VJYm1g9lONsUYwgU4ZNourarGvsZtQRpiYWQ2JOU0bhp19ApydEt+HtmKXbkPp7RoI
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(40470700004)(36840700001)(46966006)(86362001)(26005)(426003)(8936002)(1076003)(40480700001)(7696005)(2906002)(44832011)(5660300002)(47076005)(186003)(36756003)(41300700001)(6666004)(2616005)(478600001)(336012)(356005)(8676002)(81166007)(83380400001)(82310400005)(36860700001)(54906003)(4326008)(70586007)(6916009)(40460700003)(70206006)(82740400003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8490
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2ef1b529-e9bd-4c8f-a242-08da8c93ac47
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+YlNvsYQ3cIlGUPp/braoFVDdcuWvSrGfQZp4EJLml8psDOPmXtBTm1tEUlyj6Gf8aV0WUF+D1J8hW82Hcj0eTEUjIh7tR2rL7joHkNnAlEPi73lmc+vK+6q6FmGkxmLpRXLGUF0nd6vR9rHZIE2LNwZd6bzMS0oI6AEOPjEwOLUwFv3fNmAOIYw15o5uFlAvV4ULcgXHc6UeXDoFRGzMZ7M2D7HuT1ZtpVtGgb6mKgPqeDkb8fhR4PTxupZ8nfNk5LcNHzAgzW6XMYwv561KqxsL+r4XeCJIxjYQybR3cjv8EFFByRsBn0tmCjF6r4nKVeuWuaFmNl7aRvH2HPflv14Nfvc81yxG19qXlCrNppY5bDA0m5JB5Em9lqRT7CA9q2JxvXPHK1VBX23rCMsedsmontHfrf44iR3dg9p4EPmrb81n2+CA4AS74vvUZ0JPBimP4OcVX5K/+MnmvqQr4/oHV9jrxADXfBJYb9UWbGvssGhil9ZsUe2NCEzjtXAIglwjd15BUK+ocioOc+tJVIgurgomkgiiRMgHYZd8qihc+km2ym7G/+QNBf+WoixturODuVRU9BvPGj1IVo9GsFWr5RkoY/PadCQXQD/gzmIdsjH6LLTOwVo7e8HfpKspQeEhBW1/kpFtu4H1G6MU/P3DSsDxPQJeSeEBfbwe1RsJEFRcjnsNsMdRQUxAM/3FpJtt3OVlQ0VP1XHt2IG+QDfX8epd10Y4/PFn7qktGwTKq+DD3fyZm7JSlPxZ38pPFFEW57iPtbb+1Z/CSJ2zA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966006)(36840700001)(40470700004)(54906003)(6916009)(26005)(2906002)(44832011)(40460700003)(36860700001)(82310400005)(36756003)(316002)(478600001)(70206006)(70586007)(5660300002)(82740400003)(81166007)(41300700001)(40480700001)(86362001)(1076003)(426003)(336012)(47076005)(7696005)(2616005)(83380400001)(4326008)(186003)(8936002)(6666004)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 03:31:59.5828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab30867-705c-4176-f435-08da8c93b1b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6642

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
v3 -> v4:
no change.
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
index baef4cd553..af0abfc8cf 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -36,8 +36,6 @@ struct node {
 extern int compute_hash_shift(const struct node *nodes,
                               nodeid_t numnodes, nodeid_t *nodeids);
 
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


