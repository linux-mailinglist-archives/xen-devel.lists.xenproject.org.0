Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAC62814AB
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 16:08:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2166.6432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLj5-0005ee-VT; Fri, 02 Oct 2020 14:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2166.6432; Fri, 02 Oct 2020 14:07:59 +0000
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
	id 1kOLj5-0005eF-S3; Fri, 02 Oct 2020 14:07:59 +0000
Received: by outflank-mailman (input) for mailman id 2166;
 Fri, 02 Oct 2020 14:07:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kOLj4-0005eA-JN
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 14:07:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::602])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fb5181d-317d-45a6-abc7-ae94184ac23d;
 Fri, 02 Oct 2020 14:07:57 +0000 (UTC)
Received: from AM0PR10CA0032.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::12)
 by AM6PR08MB4231.eurprd08.prod.outlook.com (2603:10a6:20b:73::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 14:07:54 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:150:cafe::b2) by AM0PR10CA0032.outlook.office365.com
 (2603:10a6:20b:150::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend
 Transport; Fri, 2 Oct 2020 14:07:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 14:07:54 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Fri, 02 Oct 2020 14:07:53 +0000
Received: from 9cfead6c9a6f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D0787F39-83C2-4CAC-9B58-129735500F6B.1; 
 Fri, 02 Oct 2020 14:07:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9cfead6c9a6f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Oct 2020 14:07:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3385.eurprd08.prod.outlook.com (2603:10a6:10:4b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Fri, 2 Oct
 2020 14:07:46 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 14:07:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3+am=DJ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kOLj4-0005eA-JN
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 14:07:58 +0000
X-Inumbo-ID: 6fb5181d-317d-45a6-abc7-ae94184ac23d
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [2a01:111:f400:7e1a::602])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6fb5181d-317d-45a6-abc7-ae94184ac23d;
	Fri, 02 Oct 2020 14:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2v1Px/xqa6tlO61N6zSUpvVyb9yNcQ6ljMu/IvTiRa8=;
 b=Zbd9bO/kRUTCX8j+IF9bDCBhSM/AQv1kLDkpp9EoMSWCcms0FEl/T7/oazxkB1c8EN4gowpyAoPJwQxbnMseAFu2cxwZyFq2gTVu4/ORMc1eP8Hc+NZ7exdWBQOX11uLt9PTzpjQVbpy3YOx2VumV2AQSL9N/p5mDrA18bEqtio=
Received: from AM0PR10CA0032.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::12)
 by AM6PR08MB4231.eurprd08.prod.outlook.com (2603:10a6:20b:73::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 14:07:54 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:150:cafe::b2) by AM0PR10CA0032.outlook.office365.com
 (2603:10a6:20b:150::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend
 Transport; Fri, 2 Oct 2020 14:07:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 14:07:54 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Fri, 02 Oct 2020 14:07:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7f2a98bb643b2f3c
X-CR-MTA-TID: 64aa7808
Received: from 9cfead6c9a6f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D0787F39-83C2-4CAC-9B58-129735500F6B.1;
	Fri, 02 Oct 2020 14:07:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9cfead6c9a6f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 14:07:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXEHUMR0bDiup6celqdkGbX/U0UvHRdxj4iE3AbYxRFvaYszGbLnEiw9d0aqWYPkufcfnGbbERBzC3DuQVm1T+IJLtF6IImiKmQliFykhRuaFFXX0yVnQeTNEcalXXAv6t2Rzadm0iK2nswwf4xjdSxSdajkJ+58FSWJpZ8SgwkQ+IaA1z81AM7Cbt0DP0mVO/+7dw0grt7MNxrT0HrUiWcEDJSxCHUcknaxVEPLV6Z93lp8iR6qAiZXsy3SboAV43ccMxWmLqD3nWrQS92QmVNroQ2WQg9vD/7ioak3P5pfWMQS/bfqDGk3AD/+1PKdvZgQX9k6Itv2wfz2DNpZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2v1Px/xqa6tlO61N6zSUpvVyb9yNcQ6ljMu/IvTiRa8=;
 b=lAcCL6tNiqXcxRD99IAGYlqChkWBR31Ttfs8cOhLqS+ZXg4e4FQIuuX60/jUSE6CSrUOV+MU2dXsc8IBefKmoVm5wpH3KQrITc/whWEhs95i8t7oD/n3Xu4wXwLwJP1Ntc3pta8dqyEMLYg7fV0QOdBb0UKaEelNDM/DqmB0/J3JoibM4UC55K8XcMMxfIu6xZmbXQa0bxRjaCEBTHox2xLu4IlXr2FsQC0Yk/nuCcwOSDNrotWC1zRdQ+VtcOkdk7hkQeJ9keHYYC4cSbCCvUl1k4qsdSHlNA5m1PCN9VpMMopzco0uHLoxbd6Ohll1YDvnMk3t0zr6NFwAaLg4bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2v1Px/xqa6tlO61N6zSUpvVyb9yNcQ6ljMu/IvTiRa8=;
 b=Zbd9bO/kRUTCX8j+IF9bDCBhSM/AQv1kLDkpp9EoMSWCcms0FEl/T7/oazxkB1c8EN4gowpyAoPJwQxbnMseAFu2cxwZyFq2gTVu4/ORMc1eP8Hc+NZ7exdWBQOX11uLt9PTzpjQVbpy3YOx2VumV2AQSL9N/p5mDrA18bEqtio=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3385.eurprd08.prod.outlook.com (2603:10a6:10:4b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Fri, 2 Oct
 2020 14:07:46 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 14:07:46 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, "open list:X86"
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3] tools/libs/stat: fix broken build
Thread-Topic: [PATCH v3] tools/libs/stat: fix broken build
Thread-Index:
 AQHWiQYtlvZlYAgRJ0WaZGJ4HThwo6ln+foAgBsWa4CAAMywgIAAGQiAgAAIpgCAAAJuAIAABycAgAAuo4CAAAj+AIAABWkAgAAzXoA=
Date: Fri, 2 Oct 2020 14:07:45 +0000
Message-ID: <270E5CCF-6331-4C0A-848D-9F7305DFFA44@arm.com>
References: <20200912130836.11024-1-jgross@suse.com>
 <5232FD74-9636-4EF4-81F8-2EF7EE21D326@arm.com>
 <87CA2B55-B372-458C-82CC-2423B8AC3EEE@arm.com>
 <f12092a1-119f-ce68-8804-1a8772f1a923@suse.com>
 <f6853e47-27bd-efcd-71ae-b28e7ea1dd4d@suse.com>
 <8ddad01e-cf1a-7752-1371-a505fb26dc47@suse.com>
 <90a39759-63c1-28b9-f112-d8b3cc083565@suse.com>
 <558774ab-92cb-90ae-3936-4f9cc9d56fd0@suse.com>
 <5B52FDF2-18DA-4342-9280-0D497FAB6532@arm.com>
 <75346ac2-20f3-c868-4ac9-0d5a2e65d436@suse.com>
 <4F380E40-9AEB-4579-ADF7-833CCB5C5D54@arm.com>
In-Reply-To: <4F380E40-9AEB-4579-ADF7-833CCB5C5D54@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dcafab15-9df0-4e53-4ab6-08d866dc8e9f
x-ms-traffictypediagnostic: DB7PR08MB3385:|AM6PR08MB4231:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4231B9DD2EF237EF7B6D99A59D310@AM6PR08MB4231.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vkPd/I6yY1ZL6cqd3s09o8Q/nHdNwkJm2YvBXVkD0gOlyGo1mHu1cVsOryh681jWCbuhAT/Koo6VZmzORvrKJ6V5acZSibE0YVWahkanCR9JyYA0pBDp0WJnOsOhZV4LC47SW9jK7cPR9r4/chCOWbh93SxnNglA9i5a7T4YpxJ0WUFlaPWN+67+kZO7kbA+TxEuMwtmM+EFspjG0RAhbDEnbcPFPT4evELVdOZfq61AsNR5yjqgmRzB6rkrhbhM/XVkvS5ygPqOBo0RqoSI//ZlYY7Lli7/iju2uWRFLwVrsHYL+atyevAfRHopqI2WL5PGdtc3apPxLuWY5+P2AA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(8936002)(66574015)(83380400001)(2616005)(6486002)(6916009)(2906002)(478600001)(8676002)(6512007)(86362001)(33656002)(66946007)(66556008)(36756003)(4326008)(66476007)(66446008)(64756008)(5660300002)(26005)(76116006)(91956017)(186003)(71200400001)(54906003)(6506007)(53546011)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 9q+EVNEGjTvJUFeoGWKZCGtWD3HWQJNMbihhSh94qH38zLqby2fP1z8wU8z7lZilgqkNLZX2dMAx8NqVu818hxAETcyb0mXw2l8S9WYo0/u7sQj9pEKkOexIu+SUqRNRgzIip7DFQherCtAk4P+cRKG3AQHXlwWZt2vPHmHRqGtJJtJU8+y1eYwWYJ+Tsa7Q3d4f3z6UTxQPTpxzqV3ELvs3alHVEZJxpJE883QaeTqbH8RmrYgDmnbmSGlVXFuEz7YGIv3st/ZKfFjDOv7RmfPHu1SyiymLCfrfBs0590NoyHJ73U+IyIjLkkP3phFvkbyC7OdvRU9sA+BK64ql2RCn1nWbcoluC1VIfmsbmC5qDnwlPtzBYusvDGZ1nrsrtncBAbkiCB97u8OXSAZrU8aCcuWph21J9lyMbmzbH6ivpjiEBOAq20tpyFt3TsClPhiTOiY4GvPseLh/+X85COSCOMx9zuXUdAhNnFrSCX8NqPco2kfom6vNHnh3yaAm04LJga0Q2nVD6lwYw6LWulN9zGhEXbHwvLGKnKG63yZ4/kfHmVNQS87g2qbY+dlIg1EqtIwjI8qavDcH/mkngZ2zz2coX2sptglzOzXVlkgFjUqjBjfj6ZopZtjuKnOfy2RJ3Dg3LWHlHRoIb8ZZFQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A0515FE9AE4624381B61152792B5A25@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3385
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8d39e78f-83cb-4549-78f6-08d866dc89b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1jMpzhustVDv/JVvLj2gS4SpLXnbL0+XUGRdXdIQrvabtiOjQaRjgdxtO0st/YnFXXMofdMJZjmG8GqcE0hbWL99PUO6OvjhgmvpQNABIwjXySqTX1G9mD73xhEhLreZh6HIK1lYa1EZiWHB8UPFa2J5kVtvD5BoVRLWWTmY0dgxxWzBhIHDS+NCuCXw/4XFUZuPwFFhbi56r3fzKTe8vI0ENnYI89GN3h6aKR+/wdhPAaMiChN4VDcAw7fasJz+ljC8sQ4/qJaERtMeL+mRpySM46Rpg2/WL+a5PZSQj6K/CCWJl8N2ss/WBLSjCyy2y1Fn0lbZo7VjSgLJI/g9JHwetoQOzy20JTXTMObArdvDxR5v7NDXaHnTvKCg11rXy6adGqeKjtLjy6jDzK8ZMg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966005)(53546011)(6506007)(2616005)(4326008)(6512007)(83380400001)(336012)(82310400003)(5660300002)(8676002)(8936002)(86362001)(36756003)(70206006)(478600001)(26005)(36906005)(70586007)(356005)(47076004)(66574015)(186003)(6486002)(82740400003)(316002)(6862004)(54906003)(33656002)(81166007)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 14:07:54.3389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcafab15-9df0-4e53-4ab6-08d866dc8e9f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4231

DQoNCj4gT24gMiBPY3QgMjAyMCwgYXQgMTI6MDMsIEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5k
Lm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiAyIE9jdCAyMDIwLCBh
dCAxMTo0NCwgSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4+IA0KPj4g
T24gMDIuMTAuMjAgMTI6MTIsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gSGksDQo+Pj4+
IE9uIDIgT2N0IDIwMjAsIGF0IDA4OjI1LCBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPj4+PiANCj4+Pj4gT24gMDIuMTAuMjAgMDg6NTksIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4gT24gMDIuMTAuMjAyMCAwODo1MSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+Pj4+
PiBPbiAwMi4xMC4yMCAwODoyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+IE9uIDAyLjEw
LjIwMjAgMDY6NTAsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4+Pj4+PiBPbiAwMS4xMC4yMCAx
ODozOCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4+PiBIaSBKdWVyZ2VuLA0KPj4+
Pj4+Pj4+IA0KPj4+Pj4+Pj4+PiBPbiAxNCBTZXAgMjAyMCwgYXQgMTE6NTgsIEJlcnRyYW5kIE1h
cnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+Pj4+IA0KPj4+
Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+PiBPbiAxMiBTZXAgMjAyMCwgYXQgMTQ6
MDgsIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4+Pj4+IE1ha2luZyBnZXRCcmlkZ2UoKSBzdGF0aWMgdHJpZ2dlcmVkIGEgYnVpbGQg
ZXJyb3Igd2l0aCBzb21lIGdjYyB2ZXJzaW9uczoNCj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4g
ZXJyb3I6ICdzdHJuY3B5JyBvdXRwdXQgbWF5IGJlIHRydW5jYXRlZCBjb3B5aW5nIDE1IGJ5dGVz
IGZyb20gYSBzdHJpbmcgb2YNCj4+Pj4+Pj4+Pj4+IGxlbmd0aCAyNTUgWy1XZXJyb3I9c3RyaW5n
b3AtdHJ1bmNhdGlvbl0NCj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4gRml4IHRoYXQgYnkgdXNp
bmcgYSBidWZmZXIgd2l0aCAyNTYgYnl0ZXMgaW5zdGVhZC4NCj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+
Pj4+Pj4gRml4ZXM6IDZkMGVjMDUzOTA3Nzk0ICgidG9vbHM6IHNwbGl0IGxpYnhlbnN0YXQgaW50
byBuZXcgdG9vbHMvbGlicy9zdGF0IGRpcmVjdG9yeSIpDQo+Pj4+Pj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4+Pj4+Pj4+IFJldmlld2Vk
LWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+Pj4+Pj4+
Pj4gDQo+Pj4+Pj4+Pj4gU29ycnkgaSBoYXZlIHRvIGNvbWUgYmFjayBvbiB0aGlzIG9uZS4NCj4+
Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBJIHN0aWxsIHNlZSBhbiBlcnJvciBjb21waWxpbmcgd2l0aCBZ
b2N0byBvbiB0aGlzIG9uZToNCj4+Pj4+Pj4+PiB8ICAgICBpbmxpbmVkIGZyb20gJ3hlbnN0YXRf
Y29sbGVjdF9uZXR3b3JrcycgYXQgeGVuc3RhdF9saW51eC5jOjMwNjoyOg0KPj4+Pj4+Pj4+IHwg
eGVuc3RhdF9saW51eC5jOjgxOjY6IGVycm9yOiAnc3RybmNweScgb3V0cHV0IG1heSBiZSB0cnVu
Y2F0ZWQgY29weWluZyAyNTUgYnl0ZXMgZnJvbSBhIHN0cmluZyBvZiBsZW5ndGggMjU1IFstV2Vy
cm9yPXN0cmluZ29wLXRydW5jYXRpb25dDQo+Pj4+Pj4+Pj4gfCAgICA4MSB8ICAgICAgc3RybmNw
eShyZXN1bHQsIGRlLT5kX25hbWUsIHJlc3VsdExlbik7DQo+Pj4+Pj4+Pj4gfCAgICAgICB8ICAg
ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+Pj4+Pj4+PiANCj4+
Pj4+Pj4+PiBUbyBzb2x2ZSBpdCwgSSBuZWVkIHRvIGRlZmluZSBkZXZCcmlkZ2VbMjU3XSBhcyBk
ZXZOb0JyaWRlZy4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gSU1ITyB0aGlzIGlzIGEgcmVhbCBjb21w
aWxlciBlcnJvci4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gZGUtPmRfbmFtZSBpcyBhbiBhcnJheSBv
ZiAyNTYgYnl0ZXMsIHNvIGRvaW5nIHN0cm5jcHkoKSBmcm9tIHRoYXQgdG8NCj4+Pj4+Pj4+IGFu
b3RoZXIgYXJyYXkgb2YgMjU2IGJ5dGVzIHdpdGggYSBsZW5ndGggb2YgMjU2IHdvbid0IHRydW5j
YXRlIGFueXRoaW5nLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gVGhhdCdzIGEgbWF0dGVyIG9mIGhvdyB5
b3UgbG9vayBhdCBpdCwgSSB0aGluazogSWYgdGhlIG9yaWdpbmFsIGFycmF5DQo+Pj4+Pj4+IGRv
ZXNuJ3QgaG9sZCBhIG51bC10ZXJtaW5hdGVkIHN0cmluZywgdGhlIGRlc3RpbmF0aW9uIGFycmF5
IHdvbid0DQo+Pj4+Pj4+IGVpdGhlciwgeWV0IHRoZSBjb21tb24gZ29hbCBvZiBzdHJuY3B5KCkg
aXMgdG8geWllbGQgYSBwcm9wZXJseSBudWwtDQo+Pj4+Pj4+IHRlcm1pbmF0ZWQgc3RyaW5nLiBJ
T1cgdGhlIHdhcm5pbmcgbWF5IGJlIHNpbmNlIHRoZSBzdGFuZGFyZCBldmVuIGhhcw0KPj4+Pj4+
PiBhIHNwZWNpZmljIGZvb3Qgbm90ZSB0byBwb2ludCBvdXQgdGhpcyBwb3NzaWJsZSBwaXRmYWxs
Lg0KPj4+Pj4+IA0KPj4+Pj4+IElmIHRoZSBzb3VyY2UgZG9lc24ndCBob2xkIGEgbnVsLXRlcm1p
bmF0ZWQgc3RyaW5nIHRoZXJlIHdpbGwgc3RpbGwgYmUNCj4+Pj4+PiAyNTYgYnl0ZXMgY29waWVk
LCBzbyB0aGVyZSBpcyBubyB0cnVuY2F0aW9uIGRvbmUgZHVyaW5nIHN0cm5jcHkoKS4NCj4+Pj4+
PiANCj4+Pj4+PiBJbiBmYWN0IHRoZXJlIGlzIG5vIHdheSB0byB1c2Ugc3RybmNweSgpIGluIGEg
c2FmZSB3YXkgb24gYSBmaXhlZCBzaXplZA0KPj4+Pj4+IHNvdXJjZSBhcnJheSB3aXRoIHRoZSBh
Ym92ZSBzZW1hbnRpY3M6IGVpdGhlciB0aGUgdGFyZ2V0IGlzIGxhcmdlciB0aGFuDQo+Pj4+Pj4g
dGhlIHNvdXJjZSBhbmQgbGVuZ3RoIGlzIGF0IGxlYXN0IHNpemVvZihzb3VyY2UpICsgMSwgcmVz
dWx0aW5nIGluIGENCj4+Pj4+PiBwb3NzaWJsZSByZWFkIGJleW9uZCB0aGUgZW5kIG9mIHNvdXJj
ZSwgb3IgdGhlIHRhcmdldCBpcyB0aGUgc2FtZSBsZW5ndGgNCj4+Pj4+PiBsZWFkaW5nIHRvIHRo
ZSBlcnJvci4NCj4+Pj4+IEkgYWdyZWUgd2l0aCBhbGwgb2Ygd2hhdCB5b3Ugc2F5LCBidXQgSSBj
YW4gYWxzbyBzZWUgd2h5IHNhaWQgZm9vdCBub3RlDQo+Pj4+PiBhbG9uZSBtYXkgaGF2ZSBtb3Rp
dmF0ZWQgdGhlIGVtaXNzaW9uIG9mIHRoZSB3YXJuaW5nLg0KPj4+PiANCj4+Pj4gVGhlIG1vdGl2
YXRpb24gY2FuIGJlIGV4cGxhaW5lZCwgeWVzLCBidXQgaXQgaXMgd3JvbmcuIHN0cm5jcHkoKSBp
cyBub3QNCj4+Pj4gbGltaXRlZCB0byBzb3VyY2UgYXJyYXlzIG9mIHVua25vd24gbGVuZ3RoLiBT
byB0aGlzIHdhcm5pbmcgaXMgbWFraW5nDQo+Pj4+IHN0cm5jcHkoKSB1bnVzYWJsZSBmb3IgZml4
ZWQgc2l6ZWQgc291cmNlIHN0cmluZ3MgYW5kIC1XZXJyb3IuIEFuZCB0aGF0DQo+Pj4+IGlzIG5v
dGhpbmcgYSBjb21waWxlciBzaG91bGQgYmUgYWxsb3dlZCB0byBkbywgaGVuY2UgYSBjb21waWxl
ciBidWcuDQo+Pj4gSSBkbyBhZ3JlZSB0aGF0IGluIHRoaXMgY2FzZSB0aGUgY29tcGlsZXIgaXMg
ZG9pbmcgdG8gbXVjaC4NCj4+IA0KPj4gSXQgaXMgcGxhaW4gd3JvbmcgaGVyZS4gUmVuZGVyaW5n
IGEgUG9zaXggZGVmaW5lZCBmdW5jdGlvbiB1bnVzYWJsZSBmb3INCj4+IGEgY29tcGxldGVseSBs
ZWdhbCB1c2UgY2FzZSBpcyBpbiBubyB3YXkgYSBtYXR0ZXIgb2YgdGFzdGUgb3Igb2YgImRvaW5n
DQo+PiB0byBtdWNoIi4gSXQgaXMgYSBidWcuDQo+IA0KPiBBZ3JlZS4NCj4gDQo+PiANCj4+PiBX
ZSBjb3VsZCBhbHNvIGNob29zZSB0byB0dXJuIG9mZiB0aGUgd2FybmluZyBlaXRoZXIgdXNpbmcg
cHJhZ21hICh3aGljaA0KPj4+IGkgcmVhbGx5IGRvIG5vdCBsaWtlKSBvciBieSBhZGRpbmcgYSBj
ZmxhZyBmb3IgdGhpcyBzcGVjaWZpYyBmaWxlIChidXQgdGhpcyBtaWdodA0KPj4+IGhpdCB1cyBs
YXRlciBpbiBvdGhlciBwbGFjZXMpLg0KPj4+IEFsbCBpbiBhbGwgdGhpcyBjdXJyZW50bHkgbWFr
ZXMgWGVuIG1hc3RlciBhbmQgc3RhZ2luZyBub3QgcG9zc2libGUgdG8NCj4+PiBjb21waWxlIHdp
dGggWW9jdG8gc28gd2UgbmVlZCB0byBmaW5kIGEgc29sdXRpb24gYXMgdGhpcyB3aWxsIGFsc28N
Cj4+PiBjb21lIGluIGFueSBkaXN0cmlidXRpb24gdXNpbmcgYSBuZXcgY29tcGlsZXIsDQo+PiAN
Cj4+IEEgdmFyaWFudCB5b3UgZGlkbid0IG1lbnRpb24gd291bGQgYmUgb3BlbiBjb2Rpbmcgb2Yg
c3RybmNweSgpIChvcg0KPj4gaGF2aW5nIGEgcmVsYXRlZCBpbmxpbmUgZnVuY3Rpb24gaW4gYSBj
b21tb24gaGVhZGVyKS4gVGhpcyByb3V0ZSB3b3VsZA0KPj4gYmUgdGhlIG9uZSBJJ2QgcHJlZmVy
IGluIGNhc2UgdGhlIGNvbXBpbGVyIGd1eXMgaW5zaXN0IG9uIHRoZSBiZWhhdmlvcg0KPj4gYmVp
bmcgZmluZS4NCj4gDQo+IFRydWUgdGhpcyBwb3NzaWJsZSwgZXZlbiB0aG91Z2ggSSBkbyBub3Qg
bGlrZSB0byBtb2RpZnkgdGhlIGNvZGUgdGhhdCBkZWVwbHkNCj4gZm9yIG9uZSBzcGVjaWZpYyBj
b21waWxlci4NCj4gDQo+PiANCj4+IFlvdSBkaWRuJ3QgdGVsbCB1cyB3aGljaCBjb21waWxlciBp
cyBiZWluZyB1c2VkIGFuZCB3aGV0aGVyIGl0IHJlYWxseSBpcw0KPj4gdXAgdG8gZGF0ZS4gQSB3
b3JrYXJvdW5kIG1pZ2h0IGJlIHRvIHNldCBFWFRSQV9DRkxBR1NfWEVOX1RPT0xTIHRvDQo+PiAi
LVduby1zdHJpbmdvcC10cnVuY2F0aW9uIiBmb3IgdGhlIGJ1aWxkLg0KPiANCj4gVGhhdOKAmXMg
d2hhdCBpIG1lYW50IGJ5IOKAnGFkZGluZyBhIGNmbGFn4oCdLCBhcyB5b3Ugc3VnZ2VzdCB3ZSBj
b3VsZCBhbHNvDQo+IG1ha2UgaXQgZ2xvYmFsIChhbmQgbm90IGxpbWl0IGl0IHRvIHRoaXMgZmls
ZSkuDQo+IA0KPiBUaGUgY29tcGlsZXIgSSBhbSB1c2luZyBpcyB0aGUgb25lIGZyb20gWW9jdG8g
R2F0ZXNnYXJ0aCAocmVsZWFzZSBjb21pbmcgaW4NCj4gb2N0b2Jlcik6IGdjYyB2ZXJzaW9uIDEw
LjIuMCAocmVsZWFzZWQgaW4ganVseSAyMDIwKS4NCg0KQWZ0ZXIgc29tZSBkaXNjdXNzaW9uLCBJ
IHdpbGwgcHJvcG9zZSBhIHBhdGNoIHRvIHNvbHZlIHRoZSBpc3N1ZSB1c2luZyBtZW1jcHkNCmlu
c3RlYWQgb2Ygc3RybmNweSBhcyBpbiB0aGlzIHNwZWNpZmljIGNhc2Ugd2Uga25vdyB0aGF0IHdl
IGNhbiB0cnVuY2F0ZSB0aGUNCnN0cmluZy4NClRoaXMgd2lsbCBhbHNvIGFsbG93IHRvIHJldmVy
dCB0aGUgYmlnIGJ1ZmZlcnMgaW4gc3RhY2suDQoNCkNoZWVycw0KQmVydHJhbmQNCg0K

