Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D1729B073
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 15:20:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12912.33400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXPpW-0006Hu-Ak; Tue, 27 Oct 2020 14:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12912.33400; Tue, 27 Oct 2020 14:20:06 +0000
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
	id 1kXPpW-0006HZ-5Q; Tue, 27 Oct 2020 14:20:06 +0000
Received: by outflank-mailman (input) for mailman id 12912;
 Tue, 27 Oct 2020 14:20:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x4TT=EC=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kXPpU-0005wa-Fn
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:20:04 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b6f493e-1bdd-48e9-9f5b-724c84097515;
 Tue, 27 Oct 2020 14:20:02 +0000 (UTC)
Received: from AM6P193CA0138.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::43)
 by AM8PR08MB5650.eurprd08.prod.outlook.com (2603:10a6:20b:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 27 Oct
 2020 14:20:00 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::db) by AM6P193CA0138.outlook.office365.com
 (2603:10a6:209:85::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend
 Transport; Tue, 27 Oct 2020 14:20:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Tue, 27 Oct 2020 14:20:00 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64");
 Tue, 27 Oct 2020 14:19:59 +0000
Received: from 1f14f6613bd2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3862FDE7-600E-4667-BB80-097084A9868D.1; 
 Tue, 27 Oct 2020 14:19:54 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f14f6613bd2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Oct 2020 14:19:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5321.eurprd08.prod.outlook.com (2603:10a6:10:11c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Tue, 27 Oct
 2020 14:19:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 14:19:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=x4TT=EC=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kXPpU-0005wa-Fn
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 14:20:04 +0000
X-Inumbo-ID: 0b6f493e-1bdd-48e9-9f5b-724c84097515
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown [40.107.3.43])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0b6f493e-1bdd-48e9-9f5b-724c84097515;
	Tue, 27 Oct 2020 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kI554YTTYiUUDfRBH9gI3S5wDzOkzAMhqDe2vEedAbE=;
 b=1YxomQOdkxUdiikPBKBF8VFwQeUnbEAFqDp8vK18bQA76ZETu+kgkX97fg6LqEwBUzDKOiuROSIYLolg4ZF+jSz9YiGf0czTbnlLtPDl5JajLGxBRM27k7KzCccHvUH6lKr7+/doKziJRFsPpfxTg9pm2eLW3J9GH/xZYB2Sri4=
Received: from AM6P193CA0138.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::43)
 by AM8PR08MB5650.eurprd08.prod.outlook.com (2603:10a6:20b:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 27 Oct
 2020 14:20:00 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::db) by AM6P193CA0138.outlook.office365.com
 (2603:10a6:209:85::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend
 Transport; Tue, 27 Oct 2020 14:20:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Tue, 27 Oct 2020 14:20:00 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64"); Tue, 27 Oct 2020 14:19:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f5ead35d8ad106e
X-CR-MTA-TID: 64aa7808
Received: from 1f14f6613bd2.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3862FDE7-600E-4667-BB80-097084A9868D.1;
	Tue, 27 Oct 2020 14:19:54 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f14f6613bd2.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Oct 2020 14:19:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrQIn0PNxSLRGAM0PyLD2VQfLjmprijJnEzcoCPXJ9mmRI12yhynz4kGjkGx4q/GwT/QbjeBBORUF9o9mjpW8hG5JeFxriaqsVFB+ipOqCPOJ7q+xLQ9uJCwQOkTla6TIOMbYocUnwTeanQNqWG5suNr1lTfL4PX0EDYQZOSipircxCNCEKkvvv3mYY8r+qEVXydifvuUntWW0krc065wE3Xg8PUbHlK507cSyAMB0BvjAWTpPpaMA5gJQTqjuwadZvg8UCTtI/Jk6i46bH5jFR5pkTx9WPseunVrXA3+h5FXSstOd6m05ojs9CCqx/ucouUxLdFBobYT1Jv/btNVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kI554YTTYiUUDfRBH9gI3S5wDzOkzAMhqDe2vEedAbE=;
 b=XzcVp/KHwp5UmL2IjiNkqaJWOeM0Um0bcCQ9izIXi53sj8+uBwQlreSpaGr+OqcxqfONXwe+GnsUxjOIDSoN1/l261S0r+nmhMqE1Vdx5MLLsTMwbutmSmVcELVVEsGZKjlZnj6jfsioI8Aq5IC12s1X8ztYkZifOdSRM0bF+PtTTJSqeJkxH0bLDVPwZGTqhVao9n4s1MiDMZrvMd8oHOOyfgo/uqPEj6tW5EqSojKc1uCSZZ+Xs5yxVoIuaVokGWbaZ3d9PTxQ2rOrV5ufqHM8DkY2xELM2cg1Bc1m67In331uwBoCJpLIggUZ/jQQyYzxPUB3f+WDtEyhept3nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kI554YTTYiUUDfRBH9gI3S5wDzOkzAMhqDe2vEedAbE=;
 b=1YxomQOdkxUdiikPBKBF8VFwQeUnbEAFqDp8vK18bQA76ZETu+kgkX97fg6LqEwBUzDKOiuROSIYLolg4ZF+jSz9YiGf0czTbnlLtPDl5JajLGxBRM27k7KzCccHvUH6lKr7+/doKziJRFsPpfxTg9pm2eLW3J9GH/xZYB2Sri4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5321.eurprd08.prod.outlook.com (2603:10a6:10:11c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Tue, 27 Oct
 2020 14:19:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 14:19:52 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ash Wilding <Ash.Wilding@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Paul
 Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWoVvyGh0jWzCHpk6w/U7XN+08x6mgw0AAgAEzsQCAAWItgIABA+GAgADBXQCAABfAAIAAGI8AgAAORwCABG97AIAAEvKAgABzxQCAAUKcAA==
Date: Tue, 27 Oct 2020 14:19:52 +0000
Message-ID: <F573C8D3-3473-43CD-BA98-8D59E0188AF8@arm.com>
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
 <BF2E5EF7-575B-4A8F-BC00-3F2B73754886@arm.com>
 <9cf9f8d3-b699-de3c-781f-f7ad1b498899@xen.org>
In-Reply-To: <9cf9f8d3-b699-de3c-781f-f7ad1b498899@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 432d17f4-1977-4ce9-ddc8-08d87a836398
x-ms-traffictypediagnostic: DB8PR08MB5321:|AM8PR08MB5650:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5650780A91B170D48F8B44AC9D160@AM8PR08MB5650.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gNCLqO/9/DRmt8hiKNMDqhzI8KDxqGmKGsNb1h2C/8mwjRMqhbdg5MOlZzrByx608H8ydn9uumYzixNW8ZaQFRYTJQPopNyvXv5eePeExp15v8gU97e/l+bol25FyuitkL9qf8wo/s8b96dYvigNQQ7IB72njppDROC8VFcAXoHyjKxHD2tIKUKVCJicjwR2SUSSoEFg+QFA6ZB/Ran6DKTTDVmgW6DYJTg5aASAJxiQ2L76VsAa0FV24yA5jQGPV57kJZKk3L0xZwj/EwvKGogSxeAkwMVxJM5YWZie0n2P6HscMTEXpV0Q649HqhAWGklH6t+nstcunNJQBLG0b3t2i1RKsSRdQ/KUeXc3xOeo7txJqjwgLcqSVnqZCHgwhqKz0iNcxwTXRKN5qi1LCg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(64756008)(2616005)(6486002)(2906002)(33656002)(966005)(66446008)(66556008)(36756003)(86362001)(186003)(26005)(5660300002)(478600001)(54906003)(66476007)(6512007)(66946007)(8936002)(4326008)(83380400001)(71200400001)(76116006)(91956017)(316002)(6506007)(8676002)(6916009)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 5hW6DsC3u38UIY94Lm6J0mVrTQOZUAvxwrK3NF+bFQfzykXK3heJiHst1oYBagXzi3lFrI0A0jyT6zbWAJQGJPt/nWuDpoD+R3QmQ9xNQctyfYtrpfiJBM4XB7cKnRgiE18a4UdxnswyR9TgLQ0vEix4GBGk0iPiE+c95d2Bje0Sn/w9b7jQUhRCGniUCqE3fF8LZztjD8XwWzh6W0YMh6yw+ZLN0ytD1sRvSu86F8JVIbOudZTSowjMdXQ9rVANu5JF3dYE4GC0/ELMlRfWSbjSLFa332W2ATSmKYCd38RvLbLXFy0nZzNWI6M4+IR0/J7zB7djOndZv6dCw13lyKKbSKmUP5hV0qFua31DeJJ9UbJl9oA1kn43Qo2EocbY9Mkuuj8NakaLmOjoXW+zdn2GwHC8H2K6ZvzZ23Hu2tBLk+Y6QrGT8m5EE5GA0omngmlfSEpIqZGNiORRvTQAzYmnZ8PpPSisVtWIUioSuqQNUhc7i98jwi13I0eSgAhYlrj2b+lb4Lv4L9G6KSA4ghrG/I+N73UHlMpU9V+kV7FvT4tuCP5IIJX12yCrnqkNWArNoZ0hJF556zQUdwmQ2QWU9h0reI+P7BnWjekAM07H2OlJg+aj1D/BxD3WOQlseV2M80UlGlnhx6BDpp0GGQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <293DEC749F29B64F8837A31010A48212@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5321
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c488c4de-5d01-4256-8e25-08d87a835f15
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JKs6GzYtmjNCqpzN0D8M3aXmG7XhGz+ym6Fnb2TfqmdvgZGZ+hxu+P1VP8rnw7AebIHiHgIZT+p0zjKWfUgDL+JA3ZYRMju5oWlI99xDQS50bfMO2SZ+d+IWzUyGbNHMh8BG2a6bMZUtcCCdFtw8QZaEQGHCj6UFBpZvnjh3XalDVKN0SJJ6hNy3/x1ijXHcJsh/ypwYtuD9lPi/u++6wQ7PVy8vSzR5H2FwAIKEd1wK1+K1yK2eXssln06gMRXKmoWP8bSFkZv01jq5KQXcHIQxc98z2FucGfw5OEq1R6a38FaYmDWcnPXAJJ8sXoqhf9AFOOIpQsk0EVoXJn6KgL6caFGdmthmB3vocP5yl0zD79ELi5G50mNdvQESACJWqVjMMvV1l+7G08/RTMjgdiOvM82nMPpyEWkOeQ5BBAIejmWvb/CaWXcz7pSleq03F1j4IoLB+7bPksy+MNG/Co0wLYRL3W9fuKkyXMczxDw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966005)(53546011)(6862004)(82310400003)(36756003)(4326008)(26005)(186003)(36906005)(2906002)(70586007)(966005)(81166007)(336012)(70206006)(6486002)(83380400001)(33656002)(8676002)(8936002)(316002)(6512007)(2616005)(47076004)(478600001)(356005)(82740400003)(5660300002)(54906003)(6506007)(107886003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2020 14:20:00.2653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 432d17f4-1977-4ce9-ddc8-08d87a836398
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5650

Hi Julien,

> On 26 Oct 2020, at 19:05, Julien Grall <julien@xen.org> wrote:
>=20
> On 26/10/2020 12:10, Ash Wilding wrote:
>> Hi,
>=20
> Hi Ash,
>=20
>>> 1. atomic_set_release
>>> 2. atomic_fetch_andnot_relaxed
>>> 3. atomic_cond_read_relaxed
>>> 4. atomic_long_cond_read_relaxed
>>> 5. atomic_long_xor
>>> 6. atomic_set_release
>>> 7. atomic_cmpxchg_relaxed might be we can use atomic_cmpxchg that is
>>>    implemented in XEN need to check.
>>> 8. atomic_dec_return_release
>>> 9. atomic_fetch_inc_relaxed
>> If we're going to pull in Linux's implementations of the above atomics
>> helpers for SMMUv3, and given the majority of SMMUv3 systems are v8.1+
>> with LSE, perhaps this would be a good time to drop the current
>> atomic.h in Xen completely and pull in both Linux's LL/SC and LSE
>> helpers,
>=20
> When I originally answered to the thread, I thought about suggesting impo=
rting LSE. But I felt it was too much to ask in order to merge the SMMUv3 c=
ode.
>=20
> However, I would love to have support for LSE in Xen as this would solve =
other not yet fully closed security issue with LL/SC (see XSA-295 [2]).
>=20
> Would Arm be willing to add support for LSE before merging the SMMUv3?

We are willing to work on LSE but I cannot commit on me and my team to star=
t working on this subject before the end of the year.

So I think it would be good to integrate this version of SMMUv3 and we can =
then update it to the latest Linux one once LSE has been added.

I think it make sense in the meantime to discuss how this should be designe=
d but it might be a good idea to make a specific discussion thread for that=
.

Cheers
Bertrand

>=20
> As an alternative, it might also be possible to provide "dumb" implementa=
tion for all the helpers even if they are stricter than necessary for the m=
emory ordering requirements.
>=20
> then use a new Kconfig to toggle between them?
>=20
> I would prefer to follow the same approach as Linux and allow Xen to sele=
ct at boot time which implementations to use. This would enable distro to p=
rovide a single binary that boot on all Armv8 and still allow Xen to select=
 the best set of instructions.
>=20
> Xen already provides a framework to switch between two sets of instructio=
ns at boot. This was borrowed from Linux, so I don't expect a big hurdle to=
 get this supported.
>=20
>> Back in 5d45ecabe3 [1] Jan mentioned we probably want to avoid relying
>> on gcc atomics helpers as we can't switch between LL/SC and LSE
>> atomics.=20
>=20
> I asked Jan to add this line in the commit message :). My concern was tha=
t even if we provided a runtime switch (or sanity check for XSA-295), the G=
CC helpers would not be able to take advantage (the code is not written by =
Xen community).
>=20
> Cheers,
>=20
>> [1] https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D5d45ecabe=
3
>=20
> [2] https://xenbits.xen.org/xsa/advisory-295.html
>=20
>=20
> --=20
> Julien Grall


