Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E582A0040
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 09:44:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15475.38494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYQ1F-0008Hu-9V; Fri, 30 Oct 2020 08:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15475.38494; Fri, 30 Oct 2020 08:44:21 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYQ1F-0008HV-5W; Fri, 30 Oct 2020 08:44:21 +0000
Received: by outflank-mailman (input) for mailman id 15475;
 Fri, 30 Oct 2020 08:44:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CFCO=EF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kYQ1D-0008HQ-Qg
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 08:44:19 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.53]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c92260a-4cfa-4e30-9567-d10abbf531a1;
 Fri, 30 Oct 2020 08:44:18 +0000 (UTC)
Received: from DB6PR0801CA0054.eurprd08.prod.outlook.com (2603:10a6:4:2b::22)
 by AM0PR08MB3044.eurprd08.prod.outlook.com (2603:10a6:208:5a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 08:44:15 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::1) by DB6PR0801CA0054.outlook.office365.com
 (2603:10a6:4:2b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 08:44:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 08:44:12 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64");
 Fri, 30 Oct 2020 08:44:11 +0000
Received: from ed8889a32a9f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E08EB2E7-DC79-40A5-9944-3F32D11E163D.1; 
 Fri, 30 Oct 2020 08:44:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed8889a32a9f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Oct 2020 08:44:06 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1654.eurprd08.prod.outlook.com (2603:10a6:4:3a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 30 Oct
 2020 08:44:04 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 08:44:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CFCO=EF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kYQ1D-0008HQ-Qg
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 08:44:19 +0000
X-Inumbo-ID: 4c92260a-4cfa-4e30-9567-d10abbf531a1
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown [40.107.5.53])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4c92260a-4cfa-4e30-9567-d10abbf531a1;
	Fri, 30 Oct 2020 08:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPm3xJApa4DEiwPt3dqAlFlecCW5Av9u0DG5Xocvwf0=;
 b=8HeN+Ddnt6WbeOo6wqW1i9vhxsY46AV+ZFdKqYSQNEhdDAdFDWhnL6Hl7bR3W/yidQgsZPhkgdLUhYBuabCcgBg0vYh1gyUOE9EHLMQWM3j3NzdXRNazNa3Akb6SUMUhQiv6j44zgxAortClALC91gmPqf56mm/gfTgK7QDiESE=
Received: from DB6PR0801CA0054.eurprd08.prod.outlook.com (2603:10a6:4:2b::22)
 by AM0PR08MB3044.eurprd08.prod.outlook.com (2603:10a6:208:5a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 08:44:15 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::1) by DB6PR0801CA0054.outlook.office365.com
 (2603:10a6:4:2b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Fri, 30 Oct 2020 08:44:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 08:44:12 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64"); Fri, 30 Oct 2020 08:44:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4495b43c3a323f95
X-CR-MTA-TID: 64aa7808
Received: from ed8889a32a9f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E08EB2E7-DC79-40A5-9944-3F32D11E163D.1;
	Fri, 30 Oct 2020 08:44:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed8889a32a9f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Oct 2020 08:44:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzXMFATeJRP+heR7wHHFQUKS1V0mwDgrPcCXXZQMoU2y6yHuEv1FAAVvKdRHQ4B/+oFfHA9GkcN0aCWVoo+BELwuVobJNEvTV27sWvv7+ecfrbFepcVE6JKgOQ4faLbBUFiRGYPj+q14QJJfpq6xtD2Y77DDjlARsn2E+ujLYqn/XL5q4UjxqR+vFuWkz3a+y5LNwAVUuOH20qez8wOoteOEUb0/l+hVMhiLkb0lhV1vC+AmZhXxceACDof3Et0kqy5BwjCpAJJWicuA9/FPq7ZAJAnDk2cEH4ZKGmLDRvF8paG7CriCoKH45OjxfdbWUgMOkL3zMs0scxRsAHMu+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPm3xJApa4DEiwPt3dqAlFlecCW5Av9u0DG5Xocvwf0=;
 b=VgiyHzTHXr63QN8NLtg8BLvRmoKUacDglRFoDqcssJBzcZt6VqLjVR5/qR4Vh45meAZB2HqbGDIiRgv80O3GvyecXLbBzjGT1dpot+P2SWQWJotVcK+drxum7gLIJ6AehxuXS2KiBvBX6iNOlbyfYA9+MJCARs09sjVdomcn0o1Tlkhhs/YqCp9JtE6cVimpadWKyjLUpojg1m9ZMoW8XcPaTAXJc8O6GU5duVl4mdZP3f1InK4m0c4bOwpJbO+JGmBN5/r7rjPdvSntK1GOPbYjf6v31kqknjAxzHU/pf9BaVMlrmk5gMxAK7inVpQuSaoKLI4fDtdIJhGVpVvL7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPm3xJApa4DEiwPt3dqAlFlecCW5Av9u0DG5Xocvwf0=;
 b=8HeN+Ddnt6WbeOo6wqW1i9vhxsY46AV+ZFdKqYSQNEhdDAdFDWhnL6Hl7bR3W/yidQgsZPhkgdLUhYBuabCcgBg0vYh1gyUOE9EHLMQWM3j3NzdXRNazNa3Akb6SUMUhQiv6j44zgxAortClALC91gmPqf56mm/gfTgK7QDiESE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1654.eurprd08.prod.outlook.com (2603:10a6:4:3a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 30 Oct
 2020 08:44:04 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 08:44:04 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWoVvyGh0jWzCHpk6w/U7XN+08x6mgw0AAgAEzsQCAAWItgIABA+GAgADBXQCAABfAAIAAGI8AgAAORwCABG97AIADrU2AgAFBfQCAAGM1gIAA0IAA
Date: Fri, 30 Oct 2020 08:44:04 +0000
Message-ID: <5A60DDEA-5A39-4D50-8CCD-B41B14EE2AA0@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org>
 <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com>
 <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
 <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s>
 <D8EF4B06-B64D-4264-8C86-DA1B5A1146D2@arm.com>
 <7314936f-6c1e-5ca6-a33b-973c8e61ba3b@xen.org>
 <D9F93137-412F-47E5-A55C-85D1F3745618@arm.com>
 <2813ea2b-bfc4-0590-47ef-86089ad65a5d@xen.org>
 <0E2548E0-0504-43B6-8DD7-D5B7BACCEB6E@arm.com>
 <bc697327-2750-9a78-042d-d45690d27928@xen.org>
 <92A7B6FF-A2CE-4BB1-831A-8F12FB5290B8@arm.com>
 <alpine.DEB.2.21.2010291316290.12247@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2010291316290.12247@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 19a8063b-26ee-4a94-df69-08d87caffa61
x-ms-traffictypediagnostic: DB6PR0801MB1654:|AM0PR08MB3044:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB304430BF7BDAE3F472C260B39D150@AM0PR08MB3044.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7s+1FG5HE/rEqCOWDpEk9lEW2CAhpaI+WMGmOIDCXVQK1TlxjpudOjAxL7wCy3fBLYUU5TyqoktEnp+tqP2hNPDQUbeOVeM0Yzc1A4+xSYgD4MvWIAZ/SCmhZDiiqsyU6a8tVz76P9yaU85KrRm8rgeOCsO0DJ1rC0jnHf1pqASHBHUF0+jBGZOfR53t8WCdSJsyNEgpEbfetJXkwT6uK0aDBc9NUuFAeWuY1DaRcYqHU86M8HEVbV8TY7dacmnGLNF+jSuIiFwDlc4CHloGCHSVrXMqf2v4UvyxbxbFBf8Y8vC2E+wokVOH5BNsiBiYkdHl4EHMrGRQh+g6srCrjg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39840400004)(4326008)(54906003)(33656002)(316002)(66946007)(91956017)(76116006)(6506007)(53546011)(86362001)(8676002)(36756003)(5660300002)(6916009)(8936002)(6512007)(6486002)(478600001)(83380400001)(2616005)(66476007)(66556008)(64756008)(66446008)(71200400001)(186003)(26005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 bAZJs2STdzS/p9YQ+aNKj/zl2xDJG6lbO7jHt5dt06fMHeUC+gWFyrEl/jVGNe/g86/INHRvBtajdHD4I6CozF9EUMCsbJHnbIbHlBTKLVBk7vc9ouuB/cy+4TEDiVvKWcrRRCzAUw5jXm4EDh0FMCv4LdOHPC0OahL0+Ub18iOWzRlAhxzyWlGcD5AYTw/+nMzVwhuTiVhqStJg/opsphLlWP+s5vlL5lLjW4rXeZn2092X39h0D9tt3lf9vDZX/VDMnGrwI1qgDn9wG3rrsiKNdcyb+uPVboMaxraa5GbX7RYXZ41wRt578btmE6q4cw/z3fdJQMM8rbczOprEeEslYpGE5A4bEwt6ip3R6i9AHb10k5MWxVlZea6h0tbKzhOegMwD3HDL6+7GJxAJxVY42aawA3mCrnhXgrND+RxVv7fzn5qKrNjU8G2O5L5GAvXpGyNWA88y4+HSmqjPclPYNuAOuf/ZOM+OYnEJtxFPJDOnGTmBy6pB4kaHODisPvLxt0Ogu/VieawfSat6YwcDRh4+Wq8gpe+0qrHygVtQdtSNtXChF4TYReWG4WpcTDjfPRRzmwrbV4o7YAmY5UFOGGaL3Y5VS4t9xiYyGkjwOFLFm1MduMlybwzWIcig+zs5x6fPRvaXJWsdSRDdsQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <50CFE705E976E2428033914DB10DA091@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1654
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2208cd73-09b3-4398-b2e8-08d87caff516
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QaNczFuzr/1JVL+VpijJmVsbDPs3T0Q3btku/OuZ0sr2IsS7mQZenBGotUAz2lDZu1PlsSQRfGKNvewRaAFnB4L5/jS3IeS5gExJwP22KxAZlEf/nRf0MlcXSPMP0NNLqEk7Nrd3hIR5DOgYFmRYEJ2e3NVLuwf4yYqHFKdBNgkgZ6NmOKzqLClg7QL2crjy/mm6uDk+mxR0693urAiGWHk5tbh6fWL/87jkXn7cF4herYsGQf5S2+Tc9+pbxM6Bk7Y4tA5KvHZgOWwRtRkRPmcoGEd3FH/ODQj8dJDwLfEVmWqXsby2bGKrTG6gQnk1YzUqcINqP2AqvjvgkQlpAfArUQEa1yL7mcnqkLHjby/iTicPuZ1zJ3y7Euh61qjljqDXJyaFLG/9/7tITqRkAg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39840400004)(346002)(396003)(136003)(46966005)(70586007)(6512007)(5660300002)(81166007)(8676002)(36756003)(33656002)(6862004)(54906003)(356005)(70206006)(6506007)(8936002)(86362001)(186003)(316002)(26005)(53546011)(107886003)(6486002)(478600001)(2906002)(336012)(2616005)(82310400003)(83380400001)(4326008)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 08:44:12.2315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a8063b-26ee-4a94-df69-08d87caffa61
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3044

SEkgU3RlZmFubywNCg0KPiBPbiAyOSBPY3QgMjAyMCwgYXQgMjA6MTcsIFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIDI5IE9j
dCAyMDIwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+IE9uIDI4IE9jdCAyMDIwLCBhdCAx
OToxMiwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gT24gMjYvMTAv
MjAyMCAxMTowMywgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+IEhlbGxvIEp1bGllbiwNCj4+Pj4+
IE9uIDIzIE9jdCAyMDIwLCBhdCA0OjE5IHBtLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
PiB3cm90ZToNCj4+Pj4+IE9uIDIzLzEwLzIwMjAgMTU6MjcsIFJhaHVsIFNpbmdoIHdyb3RlOg0K
Pj4+Pj4+IEhlbGxvIEp1bGllbiwNCj4+Pj4+Pj4gT24gMjMgT2N0IDIwMjAsIGF0IDI6MDAgcG0s
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4+PiBPbiAyMy8xMC8y
MDIwIDEyOjM1LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4+IEhlbGxvLA0KPj4+Pj4+Pj4+
IE9uIDIzIE9jdCAyMDIwLCBhdCAxOjAyIGFtLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IE9uIFRodSwgMjIg
T2N0IDIwMjAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+Pj4+Pj4+PiBPbiAyMC8xMC8yMDIw
IDE2OjI1LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4+Pj4+Pj4gQWRkIHN1cHBvcnQgZm9y
IEFSTSBhcmNoaXRlY3RlZCBTTU1VdjMgaW1wbGVtZW50YXRpb25zLiBJdCBpcyBiYXNlZCBvbg0K
Pj4+Pj4+Pj4+Pj4+PiB0aGUgTGludXggU01NVXYzIGRyaXZlci4NCj4+Pj4+Pj4+Pj4+Pj4gTWFq
b3IgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgTGludXggZHJpdmVyIGFyZSBhcyBmb2xsb3dzOg0K
Pj4+Pj4+Pj4+Pj4+PiAxLiBPbmx5IFN0YWdlLTIgdHJhbnNsYXRpb24gaXMgc3VwcG9ydGVkIGFz
IGNvbXBhcmVkIHRvIHRoZSBMaW51eCBkcml2ZXINCj4+Pj4+Pj4+Pj4+Pj4gICB0aGF0IHN1cHBv
cnRzIGJvdGggU3RhZ2UtMSBhbmQgU3RhZ2UtMiB0cmFuc2xhdGlvbnMuDQo+Pj4+Pj4+Pj4+Pj4+
IDIuIFVzZSBQMk0gIHBhZ2UgdGFibGUgaW5zdGVhZCBvZiBjcmVhdGluZyBvbmUgYXMgU01NVXYz
IGhhcyB0aGUNCj4+Pj4+Pj4+Pj4+Pj4gICBjYXBhYmlsaXR5IHRvIHNoYXJlIHRoZSBwYWdlIHRh
YmxlcyB3aXRoIHRoZSBDUFUuDQo+Pj4+Pj4+Pj4+Pj4+IDMuIFRhc2tsZXRzIGlzIHVzZWQgaW4g
cGxhY2Ugb2YgdGhyZWFkZWQgSVJRJ3MgaW4gTGludXggZm9yIGV2ZW50IHF1ZXVlDQo+Pj4+Pj4+
Pj4+Pj4+ICAgYW5kIHByaW9yaXR5IHF1ZXVlIElSUSBoYW5kbGluZy4NCj4+Pj4+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4+Pj4+PiBUYXNrbGV0cyBhcmUgbm90IGEgcmVwbGFjZW1lbnQgZm9yIHRocmVhZGVk
IElSUS4gSW4gcGFydGljdWxhciwgdGhleSB3aWxsDQo+Pj4+Pj4+Pj4+Pj4gaGF2ZSBwcmlvcml0
eSBvdmVyIGFueXRoaW5nIGVsc2UgKElPVyBub3RoaW5nIHdpbGwgcnVuIG9uIHRoZSBwQ1BVIHVu
dGlsDQo+Pj4+Pj4+Pj4+Pj4gdGhleSBhcmUgZG9uZSkuDQo+Pj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+
Pj4+Pj4gRG8geW91IGtub3cgd2h5IExpbnV4IGlzIHVzaW5nIHRocmVhZC4gSXMgaXQgYmVjYXVz
ZSBvZiBsb25nIHJ1bm5pbmcNCj4+Pj4+Pj4+Pj4+PiBvcGVyYXRpb25zPw0KPj4+Pj4+Pj4+Pj4g
DQo+Pj4+Pj4+Pj4+PiBZZXMgeW91IGFyZSByaWdodCBiZWNhdXNlIG9mIGxvbmcgcnVubmluZyBv
cGVyYXRpb25zIExpbnV4IGlzIHVzaW5nIHRoZQ0KPj4+Pj4+Pj4+Pj4gdGhyZWFkZWQgSVJRcy4N
Cj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4gU01NVXYzIHJlcG9ydHMgZmF1bHQvZXZlbnRzIGJh
c2VzIG9uIG1lbW9yeS1iYXNlZCBjaXJjdWxhciBidWZmZXIgcXVldWVzIG5vdA0KPj4+Pj4+Pj4+
Pj4gYmFzZWQgb24gdGhlIHJlZ2lzdGVyLiBBcyBwZXIgbXkgdW5kZXJzdGFuZGluZywgaXQgaXMg
dGltZS1jb25zdW1pbmcgdG8NCj4+Pj4+Pj4+Pj4+IHByb2Nlc3MgdGhlIG1lbW9yeSBiYXNlZCBx
dWV1ZXMgaW4gaW50ZXJydXB0IGNvbnRleHQgYmVjYXVzZSBvZiB0aGF0IExpbnV4DQo+Pj4+Pj4+
Pj4+PiBpcyB1c2luZyB0aHJlYWRlZCBJUlEgdG8gcHJvY2VzcyB0aGUgZmF1bHRzL2V2ZW50cyBm
cm9tIFNNTVUuDQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+IEkgZGlkbuKAmXQgZmluZCBhbnkg
b3RoZXIgc29sdXRpb24gaW4gWEVOIGluIHBsYWNlIG9mIHRhc2tsZXQgdG8gZGVmZXIgdGhlDQo+
Pj4+Pj4+Pj4+PiB3b3JrLCB0aGF04oCZcyB3aHkgSSB1c2VkIHRhc2tsZXQgaW4gWEVOIGluIHJl
cGxhY2VtZW50IG9mIHRocmVhZGVkIElSUXMuIElmDQo+Pj4+Pj4+Pj4+PiB3ZSBkbyBhbGwgd29y
ayBpbiBpbnRlcnJ1cHQgY29udGV4dCB3ZSB3aWxsIG1ha2UgWEVOIGxlc3MgcmVzcG9uc2l2ZS4N
Cj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IFNvIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgWGVu
IGNvbnRpbnVlIHRvIHJlY2VpdmVzIGludGVycnVwdHMsIGJ1dCB3ZSBhbHNvDQo+Pj4+Pj4+Pj4+
IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgYSB2Q1BVIGJvdW5kIHRvIHRoZSBwQ1BVIGlzIGFsc28g
cmVzcG9uc2l2ZS4NCj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+IElmIHlv
dSBrbm93IGFub3RoZXIgc29sdXRpb24gaW4gWEVOIHRoYXQgd2lsbCBiZSB1c2VkIHRvIGRlZmVy
IHRoZSB3b3JrIGluDQo+Pj4+Pj4+Pj4+PiB0aGUgaW50ZXJydXB0IHBsZWFzZSBsZXQgbWUga25v
dyBJIHdpbGwgdHJ5IHRvIHVzZSB0aGF0Lg0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4gT25lIG9m
IG15IHdvcmsgY29sbGVhZ3VlIGVuY291bnRlcmVkIGEgc2ltaWxhciBwcm9ibGVtIHJlY2VudGx5
LiBIZSBoYWQgYSBsb25nDQo+Pj4+Pj4+Pj4+IHJ1bm5pbmcgdGFza2xldCBhbmQgd2FudGVkIHRv
IGJlIGJyb2tlbiBkb3duIGluIHNtYWxsZXIgY2h1bmsuDQo+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+
PiBXZSBkZWNpZGVkIHRvIHVzZSBhIHRpbWVyIHRvIHJlc2NoZWR1bGUgdGhlIHRhc2xrZXQgaW4g
dGhlIGZ1dHVyZS4gVGhpcyBhbGxvd3MNCj4+Pj4+Pj4+Pj4gdGhlIHNjaGVkdWxlciB0byBydW4g
b3RoZXIgbG9hZHMgKGUuZy4gdkNQVSkgZm9yIHNvbWUgdGltZS4NCj4+Pj4+Pj4+Pj4gDQo+Pj4+
Pj4+Pj4+IFRoaXMgaXMgcHJldHR5IGhhY2tpc2ggYnV0IEkgY291bGRuJ3QgZmluZCBhIGJldHRl
ciBzb2x1dGlvbiBhcyB0YXNrbGV0IGhhdmUNCj4+Pj4+Pj4+Pj4gaGlnaCBwcmlvcml0eS4NCj4+
Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IE1heWJlIHRoZSBvdGhlciB3aWxsIGhhdmUgYSBiZXR0ZXIg
aWRlYS4NCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBKdWxpZW4ncyBzdWdnZXN0aW9uIGlzIGEgZ29v
ZCBvbmUuDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gQnV0IEkgdGhpbmsgdGFza2xldHMgY2FuIGJl
IGNvbmZpZ3VyZWQgdG8gYmUgY2FsbGVkIGZyb20gdGhlIGlkbGVfbG9vcCwNCj4+Pj4+Pj4+PiBp
biB3aGljaCBjYXNlIHRoZXkgYXJlIG5vdCBydW4gaW4gaW50ZXJydXB0IGNvbnRleHQ/DQo+Pj4+
Pj4+Pj4gDQo+Pj4+Pj4+PiBZZXMgeW91IGFyZSByaWdodCB0YXNrbGV0IHdpbGwgYmUgc2NoZWR1
bGVkIGZyb20gdGhlIGlkbGVfbG9vcCB0aGF0IGlzIG5vdCBpbnRlcnJ1cHQgY29uZXh0Lg0KPj4+
Pj4+PiANCj4+Pj4+Pj4gVGhpcyBkZXBlbmRzIG9uIHlvdXIgdGFza2xldC4gU29tZSB3aWxsIHJ1
biBmcm9tIHRoZSBzb2Z0aXJxIGNvbnRleHQgd2hpY2ggaXMgdXN1YWxseSAoZm9yIEFybSkgb24g
dGhlIHJldHVybiBvZiBhbiBleGNlcHRpb24uDQo+Pj4+Pj4+IA0KPj4+Pj4+IFRoYW5rcyBmb3Ig
dGhlIGluZm8uIEkgd2lsbCBjaGVjayBhbmQgd2lsbCBnZXQgYmV0dGVyIHVuZGVyc3RhbmRpbmcg
b2YgdGhlIHRhc2tsZXQgaG93IGl0IHdpbGwgcnVuIGluIFhFTi4NCj4+Pj4+Pj4+PiANCj4+Pj4+
Pj4+Pj4+Pj4gNC4gTGF0ZXN0IHZlcnNpb24gb2YgdGhlIExpbnV4IFNNTVV2MyBjb2RlIGltcGxl
bWVudHMgdGhlIGNvbW1hbmRzIHF1ZXVlDQo+Pj4+Pj4+Pj4+Pj4+ICAgYWNjZXNzIGZ1bmN0aW9u
cyBiYXNlZCBvbiBhdG9taWMgb3BlcmF0aW9ucyBpbXBsZW1lbnRlZCBpbiBMaW51eC4NCj4+Pj4+
Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+PiBDYW4geW91IHByb3ZpZGUgbW9yZSBkZXRhaWxzPw0KPj4+
Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+PiBJIHRyaWVkIHRvIHBvcnQgdGhlIGxhdGVzdCB2ZXJzaW9u
IG9mIHRoZSBTTU1VdjMgY29kZSB0aGFuIEkgb2JzZXJ2ZWQgdGhhdA0KPj4+Pj4+Pj4+Pj4gaW4g
b3JkZXIgdG8gcG9ydCB0aGF0IGNvZGUgSSBoYXZlIHRvIGFsc28gcG9ydCBhdG9taWMgb3BlcmF0
aW9uIGltcGxlbWVudGVkDQo+Pj4+Pj4+Pj4+PiBpbiBMaW51eCB0byBYRU4uIEFzIGxhdGVzdCBM
aW51eCBjb2RlIHVzZXMgYXRvbWljIG9wZXJhdGlvbiB0byBwcm9jZXNzIHRoZQ0KPj4+Pj4+Pj4+
Pj4gY29tbWFuZCBxdWV1ZXMgKGF0b21pY19jb25kX3JlYWRfcmVsYXhlZCgpLGF0b21pY19sb25n
X2NvbmRfcmVhZF9yZWxheGVkKCkgLA0KPj4+Pj4+Pj4+Pj4gYXRvbWljX2ZldGNoX2FuZG5vdF9y
ZWxheGVkKCkpIC4NCj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IFRoYW5rIHlvdSBmb3IgdGhlIGV4
cGxhbmF0aW9uLiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJlc3QgdG8gaW1wb3J0IHRoZSBhdG9taWMN
Cj4+Pj4+Pj4+Pj4gaGVscGVycyBhbmQgdXNlIHRoZSBsYXRlc3QgY29kZS4NCj4+Pj4+Pj4+Pj4g
DQo+Pj4+Pj4+Pj4+IFRoaXMgd2lsbCBlbnN1cmUgdGhhdCB3ZSBkb24ndCByZS1pbnRyb2R1Y2Ug
YnVncyBhbmQgYWxzbyBidXkgdXMgc29tZSB0aW1lDQo+Pj4+Pj4+Pj4+IGJlZm9yZSB0aGUgTGlu
dXggYW5kIFhlbiBkcml2ZXIgZGl2ZXJnZSBhZ2FpbiB0b28gbXVjaC4NCj4+Pj4+Pj4+Pj4gDQo+
Pj4+Pj4+Pj4+IFN0ZWZhbm8sIHdoYXQgZG8geW91IHRoaW5rPw0KPj4+Pj4+Pj4+IA0KPj4+Pj4+
Pj4+IEkgdGhpbmsgeW91IGFyZSByaWdodC4NCj4+Pj4+Pj4+IFllcywgSSBhZ3JlZSB3aXRoIHlv
dSB0byBoYXZlIFhFTiBjb2RlIGluIHN5bmMgd2l0aCBMaW51eCBjb2RlIHRoYXQncyB3aHkgSSBz
dGFydGVkIHdpdGggdG8gcG9ydCB0aGUgTGludXggYXRvbWljIG9wZXJhdGlvbnMgdG8gWEVOICB0
aGVuIEkgcmVhbGlzZWQgdGhhdCBpdCBpcyBub3Qgc3RyYWlnaHRmb3J3YXJkIHRvIHBvcnQgYXRv
bWljIG9wZXJhdGlvbnMgYW5kIGl0IHJlcXVpcmVzIGxvdHMgb2YgZWZmb3J0IGFuZCB0ZXN0aW5n
LiBUaGVyZWZvcmUgSSBkZWNpZGVkIHRvIHBvcnQgdGhlIGNvZGUgYmVmb3JlIHRoZSBhdG9taWMg
b3BlcmF0aW9uIGlzIGludHJvZHVjZWQgaW4gTGludXguDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBIbW1t
Li4uIEkgd291bGQgbm90IGhhdmUgZXhwZWN0ZWQgYSBsb3Qgb2YgZWZmb3J0IHJlcXVpcmVkIHRv
IGFkZCB0aGUgMyBhdG9taWNzIG9wZXJhdGlvbnMgYWJvdmUuIEFyZSB5b3UgdHJ5aW5nIHRvIGFs
c28gcG9ydCB0aGUgTFNFIHN1cHBvcnQgYXQgdGhlIHNhbWUgdGltZT8NCj4+Pj4+PiBUaGVyZSBh
cmUgb3RoZXIgYXRvbWljIG9wZXJhdGlvbnMgdXNlZCBpbiB0aGUgU01NVXYzIGNvZGUgYXBhcnQg
ZnJvbSB0aGUgMyBhdG9taWMgb3BlcmF0aW9uIEkgbWVudGlvbi4gSSBqdXN0IG1lbnRpb24gMyBv
cGVyYXRpb24gYXMgYW4gZXhhbXBsZS4NCj4+Pj4+IA0KPj4+Pj4gT2suIERvIHlvdSBoYXZlIGEg
bGlzdCB5b3UgY291bGQgc2hhcmU/DQo+Pj4+PiANCj4+Pj4gWWVzLiBQbGVhc2UgZmluZCB0aGUg
bGlzdCB0aGF0IHdlIGhhdmUgdG8gcG9ydCB0byB0aGUgWEVOIGluIG9yZGVyIHRvIG1lcmdlIHRo
ZSBsYXRlc3QgU01NVXYzIGNvZGUuDQo+Pj4gDQo+Pj4gVGhhbmtzIQ0KPj4+IA0KPj4+PiBJZiB3
ZSBzdGFydCB0byBwb3J0IHRoZSBiZWxvdyBsaXN0IHdlIG1pZ2h0IGhhdmUgdG8gcG9ydCBhbm90
aGVyIGF0b21pYyBvcGVyYXRpb24gYmFzZWQgb24gd2hpY2ggYmVsb3cgYXRvbWljIG9wZXJhdGlv
bnMgYXJlIGltcGxlbWVudGVkLiBJIGhhdmUgbm90IHNwZW50IHRpbWUgb24gaG93IHRoZXNlIGF0
b21pYyBvcGVyYXRpb25zIGFyZSBpbXBsZW1lbnRlZCBpbiBkZXRhaWwgYnV0IGFzIHBlciBteSB1
bmRlcnN0YW5kaW5nLCBpdCByZXF1aXJlZCBhbiBlZmZvcnQgdG8gcG9ydCB0aGVtIHRvIFhFTiBh
bmQgcmVxdWlyZWQgYSBsb3Qgb2YgdGVzdGluZy4NCj4+PiANCj4+PiBGb3IgdGhlIGJlZ2lubmlu
ZywgSSB0aGluayBpdCBpcyBmaW5lIHRvIGltcGxlbWVudCB0aGVtIHdpdGggYSBzdHJvbmdlciBt
ZW1vcnkgYmFycmllciB0aGFuIG5lY2Vzc2FyeSBvciBpbiBhIGxlc3MgZWZmaWNpZW50LiBUaGlz
IGNhbiBiZSByZWZpbmVkIGFmdGVyd2FyZHMuDQo+Pj4gDQo+Pj4gVGhvc2UgaGVscGVycyBjYW4g
ZGlyZWN0bHkgYmUgZGVmaW5lZCBpbiB0aGUgU01NVXYzIGRyaXZlcnMgc28gd2Uga25vdyB0aGV5
IGFyZSBub3QgZm9yIGdlbmVyYWwgcHVycG9zZSA6KS4NCj4+PiANCj4+Pj4gMS4gYXRvbWljX3Nl
dF9yZWxlYXNlDQo+Pj4gDQo+Pj4gVGhpcyBjb3VsZCBiZSBpbXBsZW1lbnRlZCBhczoNCj4+PiAN
Cj4+PiBzbXBfbWIoKTsNCj4+PiBhdG9taWNfc2V0KCk7DQo+Pj4gDQo+Pj4+IDIuIGF0b21pY19m
ZXRjaF9hbmRub3RfcmVsYXhlZA0KPj4+IA0KPj4+IFRoaXMgd291bGQgbmVlZCB0byBiZSBpbXBv
cnRlZC4NCj4+PiANCj4+Pj4gMy4gYXRvbWljX2NvbmRfcmVhZF9yZWxheGVkDQo+Pj4gDQo+Pj4g
VGhpcyB3b3VsZCBuZWVkIHRvIGJlIGltcG9ydGVkLiBUaGUgc2ltcGxlc3QgdmVyc2lvbiBzZWVt
cyB0byBiZSB0aGUgZ2VuZXJpYyB2ZXJzaW9uIHByb3ZpZGVkIGJ5IGluY2x1ZGUvYXNtLWdlbmVy
aWMvYmFycmllci5oIChzZWUgc21wX2NvbmRfbG9hZF9yZWxheGVkKS4NCj4+PiANCj4+Pj4gNC4g
YXRvbWljX2xvbmdfY29uZF9yZWFkX3JlbGF4ZWQNCj4+Pj4gNS4gYXRvbWljX2xvbmdfeG9yDQo+
Pj4gDQo+Pj4gVGhlIHR3byB3b3VsZCByZXF1aXJlIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBhdG9t
aWM2NC4gVm9sb2R5bXlyIGFsc28gcmVxdWlyZWQgYSB2ZXJzaW9uLiBJIG9mZmVyZWQgbXkgaGVs
cCwgaG93ZXZlciBJIGRpZG4ndCBmaW5kIGVub3VnaCB0aW1lIHRvIGRvIGl0IHlldCA6KC4NCj4+
PiANCj4+PiBGb3IgQXJtNjQsIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIGRvIGEgY29weS9wYXN0
ZSBvZiB0aGUgZXhpc3RpbmcgaGVscGVycyBhbmQgcmVwbGFjZSBhbnl0aGluZyByZWxhdGVkIHRv
IGEgMzItYml0IHJlZ2lzdGVyIHdpdGggYSA2NC1iaXQgb25lLg0KPj4+IA0KPj4+IEZvciBBcm0z
MiwgdGhleSBhcmUgYSBiaXQgbW9yZSBjb21wbGV4IGJlY2F1c2UgeW91IG5vdyBuZWVkIHRvIHdv
cmsgd2l0aCAyIHJlZ2lzdGVycy4NCj4+PiANCj4+PiBIb3dldmVyLCBmb3IgeW91ciBwdXJwb3Nl
LCB5b3Ugd291bGQgYmUgdXNpbmcgYXRvbWljX2xvbmdfdC4gU28gdGhlIHRoZSBBcm02NCBpbXBs
ZW1lbnRhdGlvbiBzaG91bGQgYmUgc3VmZmljaWVudC4NCj4+PiANCj4+Pj4gNi4gYXRvbWljX3Nl
dF9yZWxlYXNlDQo+Pj4gDQo+Pj4gU2FtZSBhcyAxLg0KPj4+IA0KPj4+PiA3LiBhdG9taWNfY21w
eGNoZ19yZWxheGVkIG1pZ2h0IGJlIHdlIGNhbiB1c2UgYXRvbWljX2NtcHhjaGcgdGhhdCBpcyBp
bXBsZW1lbnRlZCBpbiBYRU4gbmVlZCB0byBjaGVjay4NCj4+PiBhdG9taWNfY21weGNoZygpIGlz
IHN0cm9uZ2x5IG9yZGVyZWQuIFNvIGl0IHdvdWxkIGJlIGZpbmUgdG8gdXNlIGl0IGZvciBpbXBs
ZW1lbnRpbmcgdGhlIGhlbHBlci4gQWx0aG91Z2gsIG1vcmUgaW5lZmZpY2llbnQgOikuDQo+Pj4g
DQo+Pj4+IDguIGF0b21pY19kZWNfcmV0dXJuX3JlbGVhc2UNCj4+PiANCj4+PiBYZW4gaW1wbGVt
ZW50cyBhIHN0cm9uZ2VyIHZlcnNpb24gYXRvbWljX2RlY19yZXR1cm4oKS4gWW91IGNhbiByZS11
c2UgaXQgaGVyZS4NCj4+PiANCj4+Pj4gOS4gYXRvbWljX2ZldGNoX2luY19yZWxheGVkDQo+Pj4g
DQo+Pj4gVGhpcyB3b3VsZCBuZWVkIHRvIGJlIGltcG9ydGVkLg0KPj4gDQo+PiBXZSBkbyBhZ3Jl
ZSB0aGF0IHRoaXMgd291bGQgYmUgdGhlIHdvcmsgcmVxdWlyZWQgYnV0IHNvbWUgb2YgdGhlIHRo
aW5ncyB0byBiZSBpbXBvcnRlZCBoYXZlIGRlcGVuZGVuY2llcyBhbmQgdGhpcyBpcyBub3QNCj4+
IGEgc2ltcGxlIGNoYW5nZSBvbiB0aGUgcGF0Y2ggZG9uZSBieSBSYWh1bCBhbmQgaXQgd291bGQg
cmVxdWlyZSB0byBhbG1vc3QgcmVzdGFydCB0aGUgaW1wbGVtZW50YXRpb24gYW5kIHRlc3Rpbmcg
ZnJvbSB0aGUNCj4+IHZlcnkgYmVnaW5uaW5nLg0KPj4gDQo+PiBJbiB0aGUgbWVhbnRpbWUgY291
bGQgd2UgcHJvY2VzcyB3aXRoIHRoZSByZXZpZXcgb2YgdGhpcyBTTU1VdjMgZHJpdmVyIGFuZCBp
bmNsdWRlIGl0IGluIFhlbiBhcyBpcyA/DQo+PiANCj4+IFdlIGNhbiBzZXQgbWUgYW5kIFJhaHVs
IGFzIG1haW50YWluZXJzIGFuZCBmbGFnIHRoZSBkcml2ZXIgYXMgZXhwZXJpbWVudGFsIGluIFN1
cHBvcnQubWQgKGl0IGlzIGFscmVhZHkNCj4+IHByb3RlY3RlZCBieSB0aGUgRVhQRVJUIGNvbmZp
Z3VyYXRpb24gaW4gS2NvbmZpZykuDQo+IA0KPiBJIHRoaW5rIHRoYXQgaXMgT0sgYXMgbG9uZyBh
cyB5b3UgbWFrZSBzdXJlIHRvIGdvIHRocm91Z2ggdGhlIGNoYW5nZWxvZw0KPiBvZiB0aGUgTGlu
dXggZHJpdmVyIHRvIG1ha2Ugc3VyZSB3ZSBhcmUgbm90IG1pc3NpbmcgYW55IGJ1ZyBmaXhlcyBh
bmQNCj4gZXJyYXRhIGZpeGVzLg0KDQpXZSB3aWxsIGNoZWNrIHRoZSBkcml2ZXIgaGlzdG9yeSBm
cm9tIHRoZSBwb2ludCB3ZSB1c2VkIHRvIHRoZSBjdXJyZW50IHN0YXR1cw0KdG8gY2hlY2sgZm9y
IHBvc3NpYmxlIGJ1ZyBvciBlcnJhdGEgZml4ZXMgbmVlZGVkIHRvIGJlIGJhY2twb3J0ZWQuDQoN
CldlIHdpbGwgYWxzbyBmbGFnIHRoZSBkcml2ZXIgYXMgdW5zdXBwb3J0ZWQgYW5kIHB1dCBSYWh1
bCBhbmQgbXlzZWxmIGFzDQptYWludGFpbmVycyBmb3IgaXQuDQoNCkNoZWVycw0KQmVydHJhbmQN
Cg0KDQoNCg==

