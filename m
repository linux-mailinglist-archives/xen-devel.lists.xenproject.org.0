Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0695E2A0049
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 09:47:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15490.38506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYQ3r-0008S6-R3; Fri, 30 Oct 2020 08:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15490.38506; Fri, 30 Oct 2020 08:47:03 +0000
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
	id 1kYQ3r-0008Rh-Nk; Fri, 30 Oct 2020 08:47:03 +0000
Received: by outflank-mailman (input) for mailman id 15490;
 Fri, 30 Oct 2020 08:47:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2dz=EF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kYQ3p-0008Rc-MG
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 08:47:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88047914-df7a-4b5f-9669-e92f07e5f778;
 Fri, 30 Oct 2020 08:46:58 +0000 (UTC)
Received: from AM5PR1001CA0024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::37)
 by AM9PR08MB6147.eurprd08.prod.outlook.com (2603:10a6:20b:2da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 08:46:57 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::8d) by AM5PR1001CA0024.outlook.office365.com
 (2603:10a6:206:2::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Fri, 30 Oct 2020 08:46:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 08:46:55 +0000
Received: ("Tessian outbound c189680f801b:v64");
 Fri, 30 Oct 2020 08:46:52 +0000
Received: from d37468c9f843.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3694CE0F-DD8B-4DDA-8D3D-775410EED42F.1; 
 Fri, 30 Oct 2020 08:46:15 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d37468c9f843.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Oct 2020 08:46:15 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31)
 by AM6PR08MB4772.eurprd08.prod.outlook.com (2603:10a6:20b:cf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 08:46:11 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a]) by AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a%4]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 08:46:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=g2dz=EF=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kYQ3p-0008Rc-MG
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 08:47:01 +0000
X-Inumbo-ID: 88047914-df7a-4b5f-9669-e92f07e5f778
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [40.107.6.81])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 88047914-df7a-4b5f-9669-e92f07e5f778;
	Fri, 30 Oct 2020 08:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDV+57uX0TZe2aFVIlALMBZ/xjsan6sdHjyjibqPVQE=;
 b=5xbW/jUHkQS2ZtAbYMjckdwZV4kTPVODtnNEZKa6m19npbT3FIfBzDCqqS0pDfJMt+CbMmsXrq21Jgjvy3lYNY5Szemea1p0bOu3HSyBHnfOOpPcAkYLyzIMitmyFy5lM+tK1kVKhqgtizIqEdWXxem21kgW0VmtIf8TIly7tTE=
Received: from AM5PR1001CA0024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::37)
 by AM9PR08MB6147.eurprd08.prod.outlook.com (2603:10a6:20b:2da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 08:46:57 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::8d) by AM5PR1001CA0024.outlook.office365.com
 (2603:10a6:206:2::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Fri, 30 Oct 2020 08:46:57 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass
 (signature was verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=temperror action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 08:46:55 +0000
Received: ("Tessian outbound c189680f801b:v64"); Fri, 30 Oct 2020 08:46:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a78b3e467c7fac17
X-CR-MTA-TID: 64aa7808
Received: from d37468c9f843.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3694CE0F-DD8B-4DDA-8D3D-775410EED42F.1;
	Fri, 30 Oct 2020 08:46:15 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d37468c9f843.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 30 Oct 2020 08:46:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ex5gMdECafIVmcYAvDpWp1pL11gBlOAsDWpGObhHLiuDGXfRcsx1cm1X1CcJh7iUgbvN8tRr2nYckQHcuORLOKWbPl4tNU5t+hvO6Wm/4Xs5725Q86JBsCjCudqPkX6K+BOfjXejABpXTIqxIa9guTIDI73EWg7mtIyy5ix1Znnj58TIyyTDw40g+SoqLQuEpSbOo+/b/rpc7JyUZVMSMxSO9FRBMMPSlpIEfyp/V1UbqLzN2fFDXf7KMenP6qfScs1YTIBE26I90sdQwYR9wbad6tk92mclHOdpYW1y5jHUXRISbPoHZ/WfjXvKLDUpPVqZYHMsV6awgNXUj5vO0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDV+57uX0TZe2aFVIlALMBZ/xjsan6sdHjyjibqPVQE=;
 b=KFId2AoQTI5Sq6VlltSu9LfofQPjHkOLSI+wV1z/1pYrwW2LcYNek0qzTOtTvdJMT/Kr/44/GkLoOYPXEuZSZ/R3GmkV/+7+xp2crpsc3C181OqhghCHmSLKFjqYNqBvZxskhzWwx6IEuPyupt8Lw3/q1+u/EbHj7kG86+6BjiDzuHyo7+6BqvxpXF97o4FXqfDppYicWysNddTrjmXRu+S52/ntnpHepJuzlaPu4XocXToOP/zIYwmgJU8IpaAYmZGNxodO1Sr7vKI2jJgmKaa9n6HAJFVjwWOSdFgLYAyOd1kjrVuHnOBl/4Vj7BjYVv0ylaZII67LiW1xewNBqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDV+57uX0TZe2aFVIlALMBZ/xjsan6sdHjyjibqPVQE=;
 b=5xbW/jUHkQS2ZtAbYMjckdwZV4kTPVODtnNEZKa6m19npbT3FIfBzDCqqS0pDfJMt+CbMmsXrq21Jgjvy3lYNY5Szemea1p0bOu3HSyBHnfOOpPcAkYLyzIMitmyFy5lM+tK1kVKhqgtizIqEdWXxem21kgW0VmtIf8TIly7tTE=
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31)
 by AM6PR08MB4772.eurprd08.prod.outlook.com (2603:10a6:20b:cf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 08:46:11 +0000
Received: from AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a]) by AM6PR08MB3496.eurprd08.prod.outlook.com
 ([fe80::dc5:9a53:a6b1:6a5a%4]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 08:46:11 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
	<julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWoVvrkmJwOYERdUOadvid1OghFamgw0AAgAEzsQCAAWIugIABA+CAgADBXICAABfBAIAAGI6AgAAOSACABG94AIADrVCAgAFBfQCAAGM1gIAA0RiA
Date: Fri, 30 Oct 2020 08:46:11 +0000
Message-ID: <1BE06E0F-26CF-453A-BB06-808CC0F3E09B@arm.com>
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
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d9d69c16-dcca-429e-1812-08d87cb05b31
x-ms-traffictypediagnostic: AM6PR08MB4772:|AM9PR08MB6147:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB61473B14CF89184DDB65D9FCFC150@AM9PR08MB6147.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Oh6kbzjo3wennyP3Yfjbp/8aXfgeR6f1CEvMuRZAvjxisJ0PpUoC9TSkRSpDhMznrRaOcHuCWodHypTRgTFAEW+22Ol3rh/D4RGOFpERrxrcki04aKuZo864P+UBfe8foOCSigbCdQ/n3rdM4HD2x5nb4iXk9DBI4Xfs5NK9Eoko2vkUKrzAZo06fD1BKsc1W7bFRBx1ecmP6gSR5MGL6fDGBRJbmGtHaMwDCIKKNBd0JXz76oSk7dQW3iYM4LMd2TrHu4ldRoL1LOkLR+X2lftHkWJLTXhMdP10qD45gPjVvd4ZD7gFFFHjq/GKTq5P06t8Xee57LnFw4IQIqCBLw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3496.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(396003)(39840400004)(2906002)(6916009)(5660300002)(86362001)(33656002)(36756003)(66476007)(91956017)(76116006)(6512007)(64756008)(66446008)(66946007)(66556008)(2616005)(6506007)(26005)(478600001)(53546011)(4326008)(83380400001)(8936002)(55236004)(316002)(6486002)(8676002)(186003)(71200400001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 bIiDH4mD4wyJipZn1mavgOEHfR3htbfoMZXXe2lCrdQNQQ/+LkHsCRmjuo44gdCL3gSMrUTnmpn2jw1herw/NOKzQo1lE0r9xixbG/9sMZk4nNOdujDAvW+c03ChomuY6hkvASOkj7MMC6rsuEBv29RbOkdMkZCraCYJwNl42oepCtWSZhedRhTEB4OWnhJhlLPMWwEFWrKhy1WpfeYoDxJr598fHnyCnOVzl9Ym5KGhFl8trULFhkjn3RW2XRW3woyE6CdPpbnP3DFGCgYJXcJMzMRU7mzU/LkKJjIKLy5ov6EHhL8qp1H7AHe5xKJR6XOaJEqGfECKuG56tAS5cb0+nqFiIIAjYeT8d1f3yi9BhddrSml9AuCUPS0d9ykkVH6t27hElN9jOys9mXwLdzjFPNtVTYoU0NU1FZs1ETkFKaZqxehEWXZo76f2ZfORJ/hpAuCKyQz0W2jmHd0N5d6TxXWNjaC6j3zbG9Dlua/8VkVwevfMBlAt9l2ld5SzQ57E70BBUSmpxzfYKaQus2MzjGfPco8E7DV4yW6XOSu5Fc+h9koyI18nfhdwORcpHNjkMaDzDzRSqIUQ+xBU9BOzZV+GuXGqzmcfiE7wmgrE98TH+2nyuq8DdL8IpPsnAAF5XbZv3ZmfCoZicsgkYQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <624795650C63604D822C950C2BF2C547@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4772
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	116366eb-c935-4789-4446-08d87cb040cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9lPj7r7B357mWjWLYIZdcG1dZH0EkmR6rjnE0bQU3KFpgAyKypJmrqHZIaYEp9ENJZuZaS682o0QkqE73vwy0BTeIMAdvHOdsekrEEkFsj//CTns30JsYTKydmXbROe9cWo0o5Uf5krdwR2Tcf/un1InP++9JVUNDjH7zhPnJ+Wv19XXHG4SK6br9i5K3TcncUOA7UNlNbu4TLiXc2u2qPCVtNr9zM7kArQoqLcWVhvLfrNslYTUYV7iumZm/q1nghlw9tsQCLPdsExno3Ozt1cb+RkYotS61xg9EYXmsbBWNAfm0YOH1iGVlBkp38IEeOaixm29VWGemk0jG6JW7i87segDQBrZ/jCjBOK8ZVEIlfzYl8gZB2o6+kikT4y2la5XjS0FCEYPY+UP9evhLw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39840400004)(346002)(46966005)(336012)(5660300002)(70206006)(83380400001)(47076004)(70586007)(81166007)(36756003)(86362001)(2906002)(356005)(186003)(478600001)(8676002)(26005)(6862004)(2616005)(6486002)(107886003)(55236004)(63370400001)(6512007)(63350400001)(8936002)(54906003)(36906005)(316002)(82310400003)(53546011)(4326008)(33656002)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 08:46:55.6968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d69c16-dcca-429e-1812-08d87cb05b31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6147

SGVsbG8gU3RlZmFubywNCg0KPiBPbiAyOSBPY3QgMjAyMCwgYXQgODoxNyBwbSwgU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFRodSwg
MjkgT2N0IDIwMjAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMjggT2N0IDIwMjAs
IGF0IDE5OjEyLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiBPbiAy
Ni8xMC8yMDIwIDExOjAzLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4gSGVsbG8gSnVsaWVuLA0K
Pj4+Pj4gT24gMjMgT2N0IDIwMjAsIGF0IDQ6MTkgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPj4+Pj4gT24gMjMvMTAvMjAyMCAxNToyNywgUmFodWwgU2luZ2ggd3Jv
dGU6DQo+Pj4+Pj4gSGVsbG8gSnVsaWVuLA0KPj4+Pj4+PiBPbiAyMyBPY3QgMjAyMCwgYXQgMjow
MCBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+Pj4+IE9uIDIz
LzEwLzIwMjAgMTI6MzUsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+Pj4gSGVsbG8sDQo+Pj4+
Pj4+Pj4gT24gMjMgT2N0IDIwMjAsIGF0IDE6MDIgYW0sIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gT24gVGh1
LCAyMiBPY3QgMjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+IE9uIDIwLzEw
LzIwMjAgMTY6MjUsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+PiBBZGQgc3VwcG9y
dCBmb3IgQVJNIGFyY2hpdGVjdGVkIFNNTVV2MyBpbXBsZW1lbnRhdGlvbnMuIEl0IGlzIGJhc2Vk
IG9uDQo+Pj4+Pj4+Pj4+Pj4+IHRoZSBMaW51eCBTTU1VdjMgZHJpdmVyLg0KPj4+Pj4+Pj4+Pj4+
PiBNYWpvciBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSBMaW51eCBkcml2ZXIgYXJlIGFzIGZvbGxv
d3M6DQo+Pj4+Pj4+Pj4+Pj4+IDEuIE9ubHkgU3RhZ2UtMiB0cmFuc2xhdGlvbiBpcyBzdXBwb3J0
ZWQgYXMgY29tcGFyZWQgdG8gdGhlIExpbnV4IGRyaXZlcg0KPj4+Pj4+Pj4+Pj4+PiAgIHRoYXQg
c3VwcG9ydHMgYm90aCBTdGFnZS0xIGFuZCBTdGFnZS0yIHRyYW5zbGF0aW9ucy4NCj4+Pj4+Pj4+
Pj4+Pj4gMi4gVXNlIFAyTSAgcGFnZSB0YWJsZSBpbnN0ZWFkIG9mIGNyZWF0aW5nIG9uZSBhcyBT
TU1VdjMgaGFzIHRoZQ0KPj4+Pj4+Pj4+Pj4+PiAgIGNhcGFiaWxpdHkgdG8gc2hhcmUgdGhlIHBh
Z2UgdGFibGVzIHdpdGggdGhlIENQVS4NCj4+Pj4+Pj4+Pj4+Pj4gMy4gVGFza2xldHMgaXMgdXNl
ZCBpbiBwbGFjZSBvZiB0aHJlYWRlZCBJUlEncyBpbiBMaW51eCBmb3IgZXZlbnQgcXVldWUNCj4+
Pj4+Pj4+Pj4+Pj4gICBhbmQgcHJpb3JpdHkgcXVldWUgSVJRIGhhbmRsaW5nLg0KPj4+Pj4+Pj4+
Pj4+IA0KPj4+Pj4+Pj4+Pj4+IFRhc2tsZXRzIGFyZSBub3QgYSByZXBsYWNlbWVudCBmb3IgdGhy
ZWFkZWQgSVJRLiBJbiBwYXJ0aWN1bGFyLCB0aGV5IHdpbGwNCj4+Pj4+Pj4+Pj4+PiBoYXZlIHBy
aW9yaXR5IG92ZXIgYW55dGhpbmcgZWxzZSAoSU9XIG5vdGhpbmcgd2lsbCBydW4gb24gdGhlIHBD
UFUgdW50aWwNCj4+Pj4+Pj4+Pj4+PiB0aGV5IGFyZSBkb25lKS4NCj4+Pj4+Pj4+Pj4+PiANCj4+
Pj4+Pj4+Pj4+PiBEbyB5b3Uga25vdyB3aHkgTGludXggaXMgdXNpbmcgdGhyZWFkLiBJcyBpdCBi
ZWNhdXNlIG9mIGxvbmcgcnVubmluZw0KPj4+Pj4+Pj4+Pj4+IG9wZXJhdGlvbnM/DQo+Pj4+Pj4+
Pj4+PiANCj4+Pj4+Pj4+Pj4+IFllcyB5b3UgYXJlIHJpZ2h0IGJlY2F1c2Ugb2YgbG9uZyBydW5u
aW5nIG9wZXJhdGlvbnMgTGludXggaXMgdXNpbmcgdGhlDQo+Pj4+Pj4+Pj4+PiB0aHJlYWRlZCBJ
UlFzLg0KPj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+PiBTTU1VdjMgcmVwb3J0cyBmYXVsdC9ldmVu
dHMgYmFzZXMgb24gbWVtb3J5LWJhc2VkIGNpcmN1bGFyIGJ1ZmZlciBxdWV1ZXMgbm90DQo+Pj4+
Pj4+Pj4+PiBiYXNlZCBvbiB0aGUgcmVnaXN0ZXIuIEFzIHBlciBteSB1bmRlcnN0YW5kaW5nLCBp
dCBpcyB0aW1lLWNvbnN1bWluZyB0bw0KPj4+Pj4+Pj4+Pj4gcHJvY2VzcyB0aGUgbWVtb3J5IGJh
c2VkIHF1ZXVlcyBpbiBpbnRlcnJ1cHQgY29udGV4dCBiZWNhdXNlIG9mIHRoYXQgTGludXgNCj4+
Pj4+Pj4+Pj4+IGlzIHVzaW5nIHRocmVhZGVkIElSUSB0byBwcm9jZXNzIHRoZSBmYXVsdHMvZXZl
bnRzIGZyb20gU01NVS4NCj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4gSSBkaWRu4oCZdCBmaW5k
IGFueSBvdGhlciBzb2x1dGlvbiBpbiBYRU4gaW4gcGxhY2Ugb2YgdGFza2xldCB0byBkZWZlciB0
aGUNCj4+Pj4+Pj4+Pj4+IHdvcmssIHRoYXTigJlzIHdoeSBJIHVzZWQgdGFza2xldCBpbiBYRU4g
aW4gcmVwbGFjZW1lbnQgb2YgdGhyZWFkZWQgSVJRcy4gSWYNCj4+Pj4+Pj4+Pj4+IHdlIGRvIGFs
bCB3b3JrIGluIGludGVycnVwdCBjb250ZXh0IHdlIHdpbGwgbWFrZSBYRU4gbGVzcyByZXNwb25z
aXZlLg0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4gU28gd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhh
dCBYZW4gY29udGludWUgdG8gcmVjZWl2ZXMgaW50ZXJydXB0cywgYnV0IHdlIGFsc28NCj4+Pj4+
Pj4+Pj4gbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBhIHZDUFUgYm91bmQgdG8gdGhlIHBDUFUgaXMg
YWxzbyByZXNwb25zaXZlLg0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4g
SWYgeW91IGtub3cgYW5vdGhlciBzb2x1dGlvbiBpbiBYRU4gdGhhdCB3aWxsIGJlIHVzZWQgdG8g
ZGVmZXIgdGhlIHdvcmsgaW4NCj4+Pj4+Pj4+Pj4+IHRoZSBpbnRlcnJ1cHQgcGxlYXNlIGxldCBt
ZSBrbm93IEkgd2lsbCB0cnkgdG8gdXNlIHRoYXQuDQo+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+PiBP
bmUgb2YgbXkgd29yayBjb2xsZWFndWUgZW5jb3VudGVyZWQgYSBzaW1pbGFyIHByb2JsZW0gcmVj
ZW50bHkuIEhlIGhhZCBhIGxvbmcNCj4+Pj4+Pj4+Pj4gcnVubmluZyB0YXNrbGV0IGFuZCB3YW50
ZWQgdG8gYmUgYnJva2VuIGRvd24gaW4gc21hbGxlciBjaHVuay4NCj4+Pj4+Pj4+Pj4gDQo+Pj4+
Pj4+Pj4+IFdlIGRlY2lkZWQgdG8gdXNlIGEgdGltZXIgdG8gcmVzY2hlZHVsZSB0aGUgdGFzbGtl
dCBpbiB0aGUgZnV0dXJlLiBUaGlzIGFsbG93cw0KPj4+Pj4+Pj4+PiB0aGUgc2NoZWR1bGVyIHRv
IHJ1biBvdGhlciBsb2FkcyAoZS5nLiB2Q1BVKSBmb3Igc29tZSB0aW1lLg0KPj4+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4+Pj4gVGhpcyBpcyBwcmV0dHkgaGFja2lzaCBidXQgSSBjb3VsZG4ndCBmaW5kIGEg
YmV0dGVyIHNvbHV0aW9uIGFzIHRhc2tsZXQgaGF2ZQ0KPj4+Pj4+Pj4+PiBoaWdoIHByaW9yaXR5
Lg0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4gTWF5YmUgdGhlIG90aGVyIHdpbGwgaGF2ZSBhIGJl
dHRlciBpZGVhLg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IEp1bGllbidzIHN1Z2dlc3Rpb24gaXMg
YSBnb29kIG9uZS4NCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBCdXQgSSB0aGluayB0YXNrbGV0cyBj
YW4gYmUgY29uZmlndXJlZCB0byBiZSBjYWxsZWQgZnJvbSB0aGUgaWRsZV9sb29wLA0KPj4+Pj4+
Pj4+IGluIHdoaWNoIGNhc2UgdGhleSBhcmUgbm90IHJ1biBpbiBpbnRlcnJ1cHQgY29udGV4dD8N
Cj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+IFllcyB5b3UgYXJlIHJpZ2h0IHRhc2tsZXQgd2lsbCBiZSBz
Y2hlZHVsZWQgZnJvbSB0aGUgaWRsZV9sb29wIHRoYXQgaXMgbm90IGludGVycnVwdCBjb25leHQu
DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBUaGlzIGRlcGVuZHMgb24geW91ciB0YXNrbGV0LiBTb21lIHdp
bGwgcnVuIGZyb20gdGhlIHNvZnRpcnEgY29udGV4dCB3aGljaCBpcyB1c3VhbGx5IChmb3IgQXJt
KSBvbiB0aGUgcmV0dXJuIG9mIGFuIGV4Y2VwdGlvbi4NCj4+Pj4+Pj4gDQo+Pj4+Pj4gVGhhbmtz
IGZvciB0aGUgaW5mby4gSSB3aWxsIGNoZWNrIGFuZCB3aWxsIGdldCBiZXR0ZXIgdW5kZXJzdGFu
ZGluZyBvZiB0aGUgdGFza2xldCBob3cgaXQgd2lsbCBydW4gaW4gWEVOLg0KPj4+Pj4+Pj4+IA0K
Pj4+Pj4+Pj4+Pj4+PiA0LiBMYXRlc3QgdmVyc2lvbiBvZiB0aGUgTGludXggU01NVXYzIGNvZGUg
aW1wbGVtZW50cyB0aGUgY29tbWFuZHMgcXVldWUNCj4+Pj4+Pj4+Pj4+Pj4gICBhY2Nlc3MgZnVu
Y3Rpb25zIGJhc2VkIG9uIGF0b21pYyBvcGVyYXRpb25zIGltcGxlbWVudGVkIGluIExpbnV4Lg0K
Pj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4+IENhbiB5b3UgcHJvdmlkZSBtb3JlIGRldGFpbHM/
DQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+IEkgdHJpZWQgdG8gcG9ydCB0aGUgbGF0ZXN0IHZl
cnNpb24gb2YgdGhlIFNNTVV2MyBjb2RlIHRoYW4gSSBvYnNlcnZlZCB0aGF0DQo+Pj4+Pj4+Pj4+
PiBpbiBvcmRlciB0byBwb3J0IHRoYXQgY29kZSBJIGhhdmUgdG8gYWxzbyBwb3J0IGF0b21pYyBv
cGVyYXRpb24gaW1wbGVtZW50ZWQNCj4+Pj4+Pj4+Pj4+IGluIExpbnV4IHRvIFhFTi4gQXMgbGF0
ZXN0IExpbnV4IGNvZGUgdXNlcyBhdG9taWMgb3BlcmF0aW9uIHRvIHByb2Nlc3MgdGhlDQo+Pj4+
Pj4+Pj4+PiBjb21tYW5kIHF1ZXVlcyAoYXRvbWljX2NvbmRfcmVhZF9yZWxheGVkKCksYXRvbWlj
X2xvbmdfY29uZF9yZWFkX3JlbGF4ZWQoKSAsDQo+Pj4+Pj4+Pj4+PiBhdG9taWNfZmV0Y2hfYW5k
bm90X3JlbGF4ZWQoKSkgLg0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4gVGhhbmsgeW91IGZvciB0
aGUgZXhwbGFuYXRpb24uIEkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCB0byBpbXBvcnQgdGhlIGF0
b21pYw0KPj4+Pj4+Pj4+PiBoZWxwZXJzIGFuZCB1c2UgdGhlIGxhdGVzdCBjb2RlLg0KPj4+Pj4+
Pj4+PiANCj4+Pj4+Pj4+Pj4gVGhpcyB3aWxsIGVuc3VyZSB0aGF0IHdlIGRvbid0IHJlLWludHJv
ZHVjZSBidWdzIGFuZCBhbHNvIGJ1eSB1cyBzb21lIHRpbWUNCj4+Pj4+Pj4+Pj4gYmVmb3JlIHRo
ZSBMaW51eCBhbmQgWGVuIGRyaXZlciBkaXZlcmdlIGFnYWluIHRvbyBtdWNoLg0KPj4+Pj4+Pj4+
PiANCj4+Pj4+Pj4+Pj4gU3RlZmFubywgd2hhdCBkbyB5b3UgdGhpbms/DQo+Pj4+Pj4+Pj4gDQo+
Pj4+Pj4+Pj4gSSB0aGluayB5b3UgYXJlIHJpZ2h0Lg0KPj4+Pj4+Pj4gWWVzLCBJIGFncmVlIHdp
dGggeW91IHRvIGhhdmUgWEVOIGNvZGUgaW4gc3luYyB3aXRoIExpbnV4IGNvZGUgdGhhdCdzIHdo
eSBJIHN0YXJ0ZWQgd2l0aCB0byBwb3J0IHRoZSBMaW51eCBhdG9taWMgb3BlcmF0aW9ucyB0byBY
RU4gIHRoZW4gSSByZWFsaXNlZCB0aGF0IGl0IGlzIG5vdCBzdHJhaWdodGZvcndhcmQgdG8gcG9y
dCBhdG9taWMgb3BlcmF0aW9ucyBhbmQgaXQgcmVxdWlyZXMgbG90cyBvZiBlZmZvcnQgYW5kIHRl
c3RpbmcuIFRoZXJlZm9yZSBJIGRlY2lkZWQgdG8gcG9ydCB0aGUgY29kZSBiZWZvcmUgdGhlIGF0
b21pYyBvcGVyYXRpb24gaXMgaW50cm9kdWNlZCBpbiBMaW51eC4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+
IEhtbW0uLi4gSSB3b3VsZCBub3QgaGF2ZSBleHBlY3RlZCBhIGxvdCBvZiBlZmZvcnQgcmVxdWly
ZWQgdG8gYWRkIHRoZSAzIGF0b21pY3Mgb3BlcmF0aW9ucyBhYm92ZS4gQXJlIHlvdSB0cnlpbmcg
dG8gYWxzbyBwb3J0IHRoZSBMU0Ugc3VwcG9ydCBhdCB0aGUgc2FtZSB0aW1lPw0KPj4+Pj4+IFRo
ZXJlIGFyZSBvdGhlciBhdG9taWMgb3BlcmF0aW9ucyB1c2VkIGluIHRoZSBTTU1VdjMgY29kZSBh
cGFydCBmcm9tIHRoZSAzIGF0b21pYyBvcGVyYXRpb24gSSBtZW50aW9uLiBJIGp1c3QgbWVudGlv
biAzIG9wZXJhdGlvbiBhcyBhbiBleGFtcGxlLg0KPj4+Pj4gDQo+Pj4+PiBPay4gRG8geW91IGhh
dmUgYSBsaXN0IHlvdSBjb3VsZCBzaGFyZT8NCj4+Pj4+IA0KPj4+PiBZZXMuIFBsZWFzZSBmaW5k
IHRoZSBsaXN0IHRoYXQgd2UgaGF2ZSB0byBwb3J0IHRvIHRoZSBYRU4gaW4gb3JkZXIgdG8gbWVy
Z2UgdGhlIGxhdGVzdCBTTU1VdjMgY29kZS4NCj4+PiANCj4+PiBUaGFua3MhDQo+Pj4gDQo+Pj4+
IElmIHdlIHN0YXJ0IHRvIHBvcnQgdGhlIGJlbG93IGxpc3Qgd2UgbWlnaHQgaGF2ZSB0byBwb3J0
IGFub3RoZXIgYXRvbWljIG9wZXJhdGlvbiBiYXNlZCBvbiB3aGljaCBiZWxvdyBhdG9taWMgb3Bl
cmF0aW9ucyBhcmUgaW1wbGVtZW50ZWQuIEkgaGF2ZSBub3Qgc3BlbnQgdGltZSBvbiBob3cgdGhl
c2UgYXRvbWljIG9wZXJhdGlvbnMgYXJlIGltcGxlbWVudGVkIGluIGRldGFpbCBidXQgYXMgcGVy
IG15IHVuZGVyc3RhbmRpbmcsIGl0IHJlcXVpcmVkIGFuIGVmZm9ydCB0byBwb3J0IHRoZW0gdG8g
WEVOIGFuZCByZXF1aXJlZCBhIGxvdCBvZiB0ZXN0aW5nLg0KPj4+IA0KPj4+IEZvciB0aGUgYmVn
aW5uaW5nLCBJIHRoaW5rIGl0IGlzIGZpbmUgdG8gaW1wbGVtZW50IHRoZW0gd2l0aCBhIHN0cm9u
Z2VyIG1lbW9yeSBiYXJyaWVyIHRoYW4gbmVjZXNzYXJ5IG9yIGluIGEgbGVzcyBlZmZpY2llbnQu
IFRoaXMgY2FuIGJlIHJlZmluZWQgYWZ0ZXJ3YXJkcy4NCj4+PiANCj4+PiBUaG9zZSBoZWxwZXJz
IGNhbiBkaXJlY3RseSBiZSBkZWZpbmVkIGluIHRoZSBTTU1VdjMgZHJpdmVycyBzbyB3ZSBrbm93
IHRoZXkgYXJlIG5vdCBmb3IgZ2VuZXJhbCBwdXJwb3NlIDopLg0KPj4+IA0KPj4+PiAxLiBhdG9t
aWNfc2V0X3JlbGVhc2UNCj4+PiANCj4+PiBUaGlzIGNvdWxkIGJlIGltcGxlbWVudGVkIGFzOg0K
Pj4+IA0KPj4+IHNtcF9tYigpOw0KPj4+IGF0b21pY19zZXQoKTsNCj4+PiANCj4+Pj4gMi4gYXRv
bWljX2ZldGNoX2FuZG5vdF9yZWxheGVkDQo+Pj4gDQo+Pj4gVGhpcyB3b3VsZCBuZWVkIHRvIGJl
IGltcG9ydGVkLg0KPj4+IA0KPj4+PiAzLiBhdG9taWNfY29uZF9yZWFkX3JlbGF4ZWQNCj4+PiAN
Cj4+PiBUaGlzIHdvdWxkIG5lZWQgdG8gYmUgaW1wb3J0ZWQuIFRoZSBzaW1wbGVzdCB2ZXJzaW9u
IHNlZW1zIHRvIGJlIHRoZSBnZW5lcmljIHZlcnNpb24gcHJvdmlkZWQgYnkgaW5jbHVkZS9hc20t
Z2VuZXJpYy9iYXJyaWVyLmggKHNlZSBzbXBfY29uZF9sb2FkX3JlbGF4ZWQpLg0KPj4+IA0KPj4+
PiA0LiBhdG9taWNfbG9uZ19jb25kX3JlYWRfcmVsYXhlZA0KPj4+PiA1LiBhdG9taWNfbG9uZ194
b3INCj4+PiANCj4+PiBUaGUgdHdvIHdvdWxkIHJlcXVpcmUgdGhlIGltcGxlbWVudGF0aW9uIG9m
IGF0b21pYzY0LiBWb2xvZHlteXIgYWxzbyByZXF1aXJlZCBhIHZlcnNpb24uIEkgb2ZmZXJlZCBt
eSBoZWxwLCBob3dldmVyIEkgZGlkbid0IGZpbmQgZW5vdWdoIHRpbWUgdG8gZG8gaXQgeWV0IDoo
Lg0KPj4+IA0KPj4+IEZvciBBcm02NCwgaXQgd291bGQgYmUgcG9zc2libGUgdG8gZG8gYSBjb3B5
L3Bhc3RlIG9mIHRoZSBleGlzdGluZyBoZWxwZXJzIGFuZCByZXBsYWNlIGFueXRoaW5nIHJlbGF0
ZWQgdG8gYSAzMi1iaXQgcmVnaXN0ZXIgd2l0aCBhIDY0LWJpdCBvbmUuDQo+Pj4gDQo+Pj4gRm9y
IEFybTMyLCB0aGV5IGFyZSBhIGJpdCBtb3JlIGNvbXBsZXggYmVjYXVzZSB5b3Ugbm93IG5lZWQg
dG8gd29yayB3aXRoIDIgcmVnaXN0ZXJzLg0KPj4+IA0KPj4+IEhvd2V2ZXIsIGZvciB5b3VyIHB1
cnBvc2UsIHlvdSB3b3VsZCBiZSB1c2luZyBhdG9taWNfbG9uZ190LiBTbyB0aGUgdGhlIEFybTY0
IGltcGxlbWVudGF0aW9uIHNob3VsZCBiZSBzdWZmaWNpZW50Lg0KPj4+IA0KPj4+PiA2LiBhdG9t
aWNfc2V0X3JlbGVhc2UNCj4+PiANCj4+PiBTYW1lIGFzIDEuDQo+Pj4gDQo+Pj4+IDcuIGF0b21p
Y19jbXB4Y2hnX3JlbGF4ZWQgbWlnaHQgYmUgd2UgY2FuIHVzZSBhdG9taWNfY21weGNoZyB0aGF0
IGlzIGltcGxlbWVudGVkIGluIFhFTiBuZWVkIHRvIGNoZWNrLg0KPj4+IGF0b21pY19jbXB4Y2hn
KCkgaXMgc3Ryb25nbHkgb3JkZXJlZC4gU28gaXQgd291bGQgYmUgZmluZSB0byB1c2UgaXQgZm9y
IGltcGxlbWVudGluZyB0aGUgaGVscGVyLiBBbHRob3VnaCwgbW9yZSBpbmVmZmljaWVudCA6KS4N
Cj4+PiANCj4+Pj4gOC4gYXRvbWljX2RlY19yZXR1cm5fcmVsZWFzZQ0KPj4+IA0KPj4+IFhlbiBp
bXBsZW1lbnRzIGEgc3Ryb25nZXIgdmVyc2lvbiBhdG9taWNfZGVjX3JldHVybigpLiBZb3UgY2Fu
IHJlLXVzZSBpdCBoZXJlLg0KPj4+IA0KPj4+PiA5LiBhdG9taWNfZmV0Y2hfaW5jX3JlbGF4ZWQN
Cj4+PiANCj4+PiBUaGlzIHdvdWxkIG5lZWQgdG8gYmUgaW1wb3J0ZWQuDQo+PiANCj4+IFdlIGRv
IGFncmVlIHRoYXQgdGhpcyB3b3VsZCBiZSB0aGUgd29yayByZXF1aXJlZCBidXQgc29tZSBvZiB0
aGUgdGhpbmdzIHRvIGJlIGltcG9ydGVkIGhhdmUgZGVwZW5kZW5jaWVzIGFuZCB0aGlzIGlzIG5v
dA0KPj4gYSBzaW1wbGUgY2hhbmdlIG9uIHRoZSBwYXRjaCBkb25lIGJ5IFJhaHVsIGFuZCBpdCB3
b3VsZCByZXF1aXJlIHRvIGFsbW9zdCByZXN0YXJ0IHRoZSBpbXBsZW1lbnRhdGlvbiBhbmQgdGVz
dGluZyBmcm9tIHRoZQ0KPj4gdmVyeSBiZWdpbm5pbmcuDQo+PiANCj4+IEluIHRoZSBtZWFudGlt
ZSBjb3VsZCB3ZSBwcm9jZXNzIHdpdGggdGhlIHJldmlldyBvZiB0aGlzIFNNTVV2MyBkcml2ZXIg
YW5kIGluY2x1ZGUgaXQgaW4gWGVuIGFzIGlzID8NCj4+IA0KPj4gV2UgY2FuIHNldCBtZSBhbmQg
UmFodWwgYXMgbWFpbnRhaW5lcnMgYW5kIGZsYWcgdGhlIGRyaXZlciBhcyBleHBlcmltZW50YWwg
aW4gU3VwcG9ydC5tZCAoaXQgaXMgYWxyZWFkeQ0KPj4gcHJvdGVjdGVkIGJ5IHRoZSBFWFBFUlQg
Y29uZmlndXJhdGlvbiBpbiBLY29uZmlnKS4NCj4gDQo+IEkgdGhpbmsgdGhhdCBpcyBPSyBhcyBs
b25nIGFzIHlvdSBtYWtlIHN1cmUgdG8gZ28gdGhyb3VnaCB0aGUgY2hhbmdlbG9nDQo+IG9mIHRo
ZSBMaW51eCBkcml2ZXIgdG8gbWFrZSBzdXJlIHdlIGFyZSBub3QgbWlzc2luZyBhbnkgYnVnIGZp
eGVzIGFuZA0KPiBlcnJhdGEgZml4ZXMuDQoNCk9rIFllcyB3aGVuIEkgcG9ydGVkIHRoZSBkcml2
ZXIgSSBwb3J0IHRoZSBjb21tYW5kIHF1ZXVlIG9wZXJhdGlvbiBmcm9tIHRoZSBwcmV2aW91cyBj
b21taXQgd2hlcmUgYXRvbWljIG9wZXJhdGlvbnMgaXMgbm90IHVzZWQgYW5kIHJlc3QgYWxsIHRo
ZSBjb2RlIGlzIGZyb20gdGhlIGxhdGVzdCBjb2RlLiBJIHdpbGwgYWdhaW4gbWFrZSBzdXJlIHRo
YXQgYW55IGJ1ZyB0aGF0IGlzIGZpeGVkIGluIExpbnV4IHNob3VsZCBiZSBmaXhlZCBpbiBYRU4g
YWxzby4NCg0KDQpSZWdhcmRzLA0KUmFodWwNCg0K

