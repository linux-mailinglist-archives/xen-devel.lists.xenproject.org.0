Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C3721B080
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 09:47:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtnjK-0004KP-Pk; Fri, 10 Jul 2020 07:45:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cC6S=AV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jtnjI-0004KK-QG
 for xen-devel@lists.xen.org; Fri, 10 Jul 2020 07:45:56 +0000
X-Inumbo-ID: 62af5928-c281-11ea-8f66-12813bfff9fa
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.62]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62af5928-c281-11ea-8f66-12813bfff9fa;
 Fri, 10 Jul 2020 07:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GTjuT4swsgCP3tPUeQWgUvpQsvHzcwQ4D+FLsHBsIs=;
 b=9Unu1IlN0jWjbMb/5VjdEDBYEtr3Lv07Ew9uGSqUOpweteGaxD+VOS5WrRBtKIW3w9DJNityt7MGc1wncOjcwKcW2TAHGsZDgFluLSGC+hkIssdk2MT91aBpEzyJjo+x2yv3KAyk9Vm9589MsV+/o7wy4dfyJ1ggxdYk5XvYSEY=
Received: from AM5PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:206:1::30)
 by VI1PR08MB2653.eurprd08.prod.outlook.com (2603:10a6:802:1b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Fri, 10 Jul
 2020 07:45:53 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::96) by AM5PR04CA0017.outlook.office365.com
 (2603:10a6:206:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend
 Transport; Fri, 10 Jul 2020 07:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Fri, 10 Jul 2020 07:45:51 +0000
Received: ("Tessian outbound 7de93d801f24:v62");
 Fri, 10 Jul 2020 07:45:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5ad13238e87b4258
X-CR-MTA-TID: 64aa7808
Received: from a48785051686.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 358338DD-5F2F-4EBC-9597-0E09E8B9E826.1; 
 Fri, 10 Jul 2020 07:45:45 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a48785051686.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Jul 2020 07:45:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0n5klfOZ+nJNxedrMlY1POY35Y5qvZBu2RL8m975jrpCpZYMlj1U648UptXsKB9ZptBV+wUr8d+WcipaTXSUBvv698lX1YK3wvThRa74x2GqL9MEMLF41AiytKm+dlRXHI6wchx00N4c6x3Xq9sbLQ347dlw/+B12ii7qxlOnsd8x2xpxITWiMfqU/TNKfbTkRGAAmyvmZDL9WRb5HRpot+G9KILWWIc5IDNr6ZYjlkiQNHpOfr8zzvKPPyJ618xLdypuRqw0VAEKzktNFjqjvERw4kduM5t9UjfMyoLZRfxj4YKciCNWIQf2MojM3evLOqM8m+rTAv2h/ErV5p0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GTjuT4swsgCP3tPUeQWgUvpQsvHzcwQ4D+FLsHBsIs=;
 b=O+Ita1lfonhOKwkylUro/D7Sw33WPjdxSisbXQAwQSugE4JrkIqOi7BAazY+9XLGOH7+upnC/ujbqoy8BEIvWCPLVgpnUGXng1DNSSDQaB8zrBmLXOaebJzqTDUAGu5LlGGA9+fHN/dNPKIW0thS9bacSv8Rsu5Qp6v7jFrTOC7CdoH2tyYu0W6Q2bTXie+pgBqJZBOZNjg7Sp6etLJm8DAyT8KFSBD84Oo9wq2IIX4LRmh6awFtlZpkTJu4rGigmJhczXKbpbvn3zuH2XOyNnHLbETvTYc6QJBzj+RJjd+KQXlE3GkE7incve0nfXAgtRa8PyeN/14PLb1gRgJYkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GTjuT4swsgCP3tPUeQWgUvpQsvHzcwQ4D+FLsHBsIs=;
 b=9Unu1IlN0jWjbMb/5VjdEDBYEtr3Lv07Ew9uGSqUOpweteGaxD+VOS5WrRBtKIW3w9DJNityt7MGc1wncOjcwKcW2TAHGsZDgFluLSGC+hkIssdk2MT91aBpEzyJjo+x2yv3KAyk9Vm9589MsV+/o7wy4dfyJ1ggxdYk5XvYSEY=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB3993.eurprd08.prod.outlook.com (2603:10a6:10:ad::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Fri, 10 Jul
 2020 07:45:44 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.022; Fri, 10 Jul 2020
 07:45:44 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>
Subject: Re: [BUG] Xen build for RCAR failing
Thread-Topic: [BUG] Xen build for RCAR failing
Thread-Index: AdZUKc5JeR7gPpESR52uLkZK1kYwOwAEsnEAAAD8OlAAAEBtgAABZtcgAANXdAAAh1iJgAAHDdGA
Date: Fri, 10 Jul 2020 07:45:44 +0000
Message-ID: <7285E20B-C902-4C3E-ADBA-4AD94EA9D59C@arm.com>
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
 <1D0E7281-95D7-482E-BF6D-EE5B1FEE4876@arm.com>
 <ab84437081a346d6bf0f73581382c74e@in.bosch.com>
 <D84A5DA7-683C-480B-8837-C51D560FC2E1@arm.com>
 <139024a891324455a13a3d468908798d@in.bosch.com>
 <C3BCAA62-51EF-49DD-B978-6657BC6D5A21@arm.com>
 <427f99fc7de04946957c2896e39fdb78@in.bosch.com>
In-Reply-To: <427f99fc7de04946957c2896e39fdb78@in.bosch.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: in.bosch.com; dkim=none (message not signed)
 header.d=none; in.bosch.com;
 dmarc=none action=none header.from=arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 712e76c9-9b03-49c1-719d-08d824a544a0
x-ms-traffictypediagnostic: DB8PR08MB3993:|VI1PR08MB2653:
X-Microsoft-Antispam-PRVS: <VI1PR08MB2653E6D84087B47731A715B69D650@VI1PR08MB2653.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: syXDB3tSG6o8gVrIhA+mUfISaIagZKl7+9280es/CXxnGLdleaO0Jhteapk+Bi5iZbT5tUDDYjsxsfL+GJF2rO4mAcT4BCy7FCgo71xAgp8PLMg+N9iwtosJf/nd6aAd7glIPzRgztqvxU2ktixW34WvDyoHDV8+nwymljpW78F6gPL31nEfv0WY7YIW/JXp8q38eET9EsSD8MTBdz/TGe1HZnYZ9JssxS+SEXq/0id1pJuipyraPK3cxguBA0q9vWDPTycO4C5x5MTbCioNDRzkU81xapik16gNHugIGtWMff8g5TXlTnEacYvxK3Cg
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(8676002)(71200400001)(86362001)(36756003)(5660300002)(2616005)(6916009)(33656002)(66446008)(64756008)(66556008)(66476007)(478600001)(6512007)(2906002)(4326008)(186003)(54906003)(316002)(6486002)(76116006)(91956017)(26005)(6506007)(53546011)(4744005)(66946007)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: wkoU1ghornnjXK2psDE54/gSHCWRuzvqbq6kfZFvD0Uq0RxJW76d86KNp81TcrBPhb/hqNO5SJbzcmHpPS2KU64a+3EvXXWReRgU+gDd5SY6pGXVzrw6UwMcu3n5JE+l6P5Rd8GLYVqsJZd3+92LuqichUewv2Ki35r2I7qpTiE6C9LuGJ4LDmq+4rNN7wPZXmK+C6PCIlZpJ2df9Rh0COwXiMqoAY9TbYAjjS1Rjzs6wpNft2VLbYI+wtYHcxNzG7XlVQBvesIUb63ZDXZo+YpJ2/OQbg8QVEMyGhT0nzmxNqeRg5YTFTJyVCX2H0hf28pfi92FbibuJYyoQUA275bEgbEYhogJVSSOgR8Nv2Lkjpzg913Om1wjjE48bhKy8vl3YDlm0hN5mxpxtSSj1gxTaZfi4wQVx8cGbqjsRue+J3z8dM7izU9/So3ZAiUIeSv4MkBX7Q4DZs4YzkxUlqcuLJ05nAjayrAlziujIWQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A540B1C5776F834AA558BB5745382EE9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3993
Original-Authentication-Results: in.bosch.com; dkim=none (message not signed)
 header.d=none; in.bosch.com;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966005)(26005)(4744005)(336012)(8676002)(8936002)(2616005)(186003)(2906002)(6512007)(70586007)(53546011)(82310400002)(6506007)(33656002)(70206006)(5660300002)(478600001)(86362001)(81166007)(47076004)(36906005)(54906003)(356005)(6862004)(82740400003)(4326008)(6486002)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4f7559f2-3074-4e2c-7a47-08d824a54096
X-Forefront-PRVS: 046060344D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ka5oLWAXpF8sOBxroMxfybdzU9RCz6dW4vep83XTHTqNRnNN2SO01ApExvdhI95T5kgbbH2aaeNKJr8kGzoAqjiMwijW2TjVFMlM3cfHQEqpvaN69BuDYzPi97Br5x8oX4gmFrIKxebgkUaBg5O1nxIHIom3fznhK7Wu1LOUGOuQSdQ1SaEk1KBKGRAS6AXnibJBR67xWUu4siaz4duIKgYAxj20c4aDR60/Rbbc7GJWeeqrwOz6KxUfv5f+JBoch/+oDsXgj+vZetBsJ7Cq9Ie458JPKo6Js5fuJkSDjdUPwdVRSwaIFF5bOh07g0aLPH58jnBs/htal7i0lYR4s0Tbp5Otmu7kyA8ZjY1KCqonQUMOat0ol7b0rlCHBXXUwAM8Ucr6by6Fqw4bPeLAQA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 07:45:51.1930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 712e76c9-9b03-49c1-719d-08d824a544a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2653
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: nd <nd@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


> On 10 Jul 2020, at 05:26, Manikandan Chockalingam (RBEI/ECF3) <Manikandan=
.Chockalingam@in.bosch.com> wrote:
>=20
> Hello Bertrand,
>=20
> I couldn't find dunfell branch in the following repos
> 1. meta-selinux
> 2. xen-troops
> 3. meta-renesas [I took dunfell-dev]

Those are not layers i am using.
Not having a dunfell branch could mean that master of those layers is compa=
tible with Dunfell or that those layers are not maintained.

I would advise you to try to contact the maintainers of those layers.

Regards
Bertrand


