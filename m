Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5096E26475A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 15:48:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGMvM-0007tp-Vm; Thu, 10 Sep 2020 13:47:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBJY=CT=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kGMvL-0007tk-6M
 for xen-devel@lists.xen.org; Thu, 10 Sep 2020 13:47:39 +0000
X-Inumbo-ID: e22e6235-3c48-4f66-9f37-72781de017e2
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e22e6235-3c48-4f66-9f37-72781de017e2;
 Thu, 10 Sep 2020 13:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TaRkeL385GQKXqvkobwH9/HNA0e53bJ/nFdmByq2es=;
 b=AXJAQlTkLafqJEpFjtUEIBC9uXkWa+ojGy8uk9dX7A2yw4R/5YHJte5Y05gV44U6qxLXsY0mLtLz/8AZfgs3ej+CREbEOfKraEwub/T2lIUAzGfSF3b6sVe8rosFgSR/yQCgppDotGHZFZEp+ixmzGuup+yx4KgtW3l4bUrAr5M=
Received: from DB6P193CA0008.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::18) by
 AM6PR08MB5126.eurprd08.prod.outlook.com (2603:10a6:20b:ef::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16; Thu, 10 Sep 2020 13:47:36 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::b) by DB6P193CA0008.outlook.office365.com
 (2603:10a6:6:29::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Thu, 10 Sep 2020 13:47:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 13:47:35 +0000
Received: ("Tessian outbound 195a290eb161:v64");
 Thu, 10 Sep 2020 13:47:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d87f90387a0273a5
X-CR-MTA-TID: 64aa7808
Received: from 15d5e22d4779.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F34A341-9916-4137-839A-54915D342EAB.1; 
 Thu, 10 Sep 2020 13:46:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15d5e22d4779.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Sep 2020 13:46:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgK+szlkEdGC7RnX5P/PTKl/GS69CUhwD7UBVw4wqC/HnY7Abb420YuY0fbaJk+qLwFO/IF0YBqxVGxKiN2Y8FPDo+Vle0wyclPG62Pc7cZ4YmY75QHTE239L/aqMc7PHywPc0oO4+lVdsN0P4yj6NE1D7mrXrFkcGcMgcrHtb5iWJxK8OoirptmvBkSQ/oJkdR3X5khH6teOGo+jvEaUqAMCjzB+Ylyx3wasLb9E6Qr4/u/YyqzB5W4yJ3XrTUy5lVzjQxdrkEIZVCyzKk2thdvN//lk+an9T5Fd4V/fmXIQ9bVnxWuYe930UfcEt113uef2hD8tk2tvHY9eDpThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TaRkeL385GQKXqvkobwH9/HNA0e53bJ/nFdmByq2es=;
 b=jVOnNszcmAiJuVfZn/qqef3QWUDvy1Ybd4McSXR8kaPw8mziNG/5g3jBQl2ydCet4zuPkRuTVMUUAjyoJSi+J1Lnc9szY4SG+aIG2jAKpU7xHJSbnNMbq5mRThJrjGdSKQJGl9SiAPROxrmq7KKiN4fYd9zoWkgSqpUKhsuepnpyMcJ7AjnrHWfOvRVNbS+/Tnoi5cU+IDZgmYo4Xi9idYwuGnlK/q1Ulj8Zx6ajlOoU6wZ8rqpHm898GSAUWsPWEh5T/QYkWK6pZNbh0fEg63oyrt8ch58UCnK/VLkm/a8K0fGhwJ6CXbAmYlD5hG2AjRmhjEqTYSh6k9EdOKqsKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TaRkeL385GQKXqvkobwH9/HNA0e53bJ/nFdmByq2es=;
 b=AXJAQlTkLafqJEpFjtUEIBC9uXkWa+ojGy8uk9dX7A2yw4R/5YHJte5Y05gV44U6qxLXsY0mLtLz/8AZfgs3ej+CREbEOfKraEwub/T2lIUAzGfSF3b6sVe8rosFgSR/yQCgppDotGHZFZEp+ixmzGuup+yx4KgtW3l4bUrAr5M=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3260.eurprd08.prod.outlook.com (2603:10a6:5:21::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 13:46:34 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 13:46:34 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini <stefanos@xilinx.com>,
 Jan Beulich <jbeulich@suse.com>, George Dunlap <George.Dunlap@citrix.com>
Subject: Runstate hypercall and Linux KPTI issues
Thread-Topic: Runstate hypercall and Linux KPTI issues
Thread-Index: AQHWh3jMDykyAruLG0O1Nd1I9v/9CQ==
Date: Thu, 10 Sep 2020 13:46:34 +0000
Message-ID: <1844689F-814F-48AE-8179-95B0EE4E734C@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.xen.org; dkim=none (message not signed)
 header.d=none; lists.xen.org;
 dmarc=none action=none header.from=arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b53398cd-b5fd-4b38-45c7-08d85590131f
x-ms-traffictypediagnostic: DB7PR08MB3260:|AM6PR08MB5126:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5126CD9B1D2DBEF501A45D189D270@AM6PR08MB5126.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: NTE/29fRFFvVcbRyy/Bpv5gicMGOF0kOhgbpseCd28f7bNMaJ8Jp+rhjluMmBopixER5RS7RaaLPvXZ9HiTxwku12TUiEuw/pXX8ngdCcQl7V543RQyz1+BXoEZCn2/x5A441LHNUxUuyvhDfkw2gc4POp6igqrFprUKspLVDivaRiMVJf5A1KMN1EOw9IQKbSa7mmIWHVb9Iarpggrt9q7CH7hr7jg4NIuSIZalTYGPwQKPhwHZSG1+h0mtrHYb4PIJNZlPEyRhYdyfGu//Dcg2m3ioNaPeRDTLJAFx+6g0FU17teLDCxN9KQ4NeeiCXYBM18hhMcPNK3KJLzQN1+R0kDImCqv9qPdcxDNOw5ZtA9yHM+Zp4k1VKf9ABmhxfMVOnPMzB1TmfJNcJU/BhQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(5660300002)(6512007)(71200400001)(54906003)(33656002)(2616005)(6506007)(966005)(8676002)(8936002)(4326008)(6916009)(36756003)(66946007)(91956017)(64756008)(316002)(66476007)(83380400001)(478600001)(66446008)(66556008)(86362001)(186003)(2906002)(6486002)(26005)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Mir/mGs/98dkcMAX+qWybTiWuqMY546anD9hDIg8ho0pLdmW0Hshdnja2dNYYP6qU+LgftClDeXF4gqJYaBM41/HGoSe10YQHAg70qZbBJgvgqRiUWFkKo56AFgmoeT9q95ZvOLiVqXa/zMBtRhqa0xsSwTHujOY+HFL9+3RMOGWuPNSOGNQCEbNTDfoZ8p3iabKoMT7aeevuojjXriuqxKaLQrQlmma3KifzokmmKNciVfUbv7oHD7uK36PNzUDwlK3bzgPdU7aHnMpwmAmOwMt0OoKjfxAaQWN0yIY+KGbnXCa+fMVqphk2yR/arG/FyTwmgyzafjuCfN51uuInlyX9ZiKmuDRoz1UPryzJv4YJ22an4EtIanmWPvETh3T2F2Hg+jVxikb3rZyXuMQUCGIxOxQgoODvOURYs9PcZxee5bTc2j01od4yrb1NURs7ULZ5NA81Y7hmjKZ2ywJlpcm5QAkYt4ONdqP/m04oVCTkpH8yTrN9Rd5YW4Pu3r8XWVbtzO8Mgnlhg8bnq7h9VKdaU7GDdXa0IEjCTGlfn5/xBjQ0YltD7TL5wRCed607LQmEjscaNp6RdxG37GzB66pFbx09n5j0CbmccKtAXif9i6LTWPKj2f8f4ovF8QgrPvbpenMsWNNj7dY20A8tw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F0ABF2786C65EB4D8D42CECFE63EADEE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3260
Original-Authentication-Results: lists.xen.org; dkim=none (message not signed)
 header.d=none; lists.xen.org;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 912d8c3d-1af6-46a3-2c86-08d8558feeb7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WQqgJrgB8JIH13QSIMWEsWw4WzEYtqBXIHs0CFir9SvYl4wpgiu6T24kOzpBjGSj81dJxoN3USWKjhuNJaF5WmCh/MKCWvK3BUUNhAMfxzCVY9oJQtqKmpFr0eB/46Fj7zlKsR9m/x+UBGwIP35ID3njIeZ/9C6E9R/RRrtdgw4iDXVLUcz1LOwWH9+sFRuUjnvc/8PwEDvaznf15yQsixSaGRCBde+vAD0WjlUXE+xsjou0ZhD5Gsoj5/nsWQCoL6OpF8DO8fRXoY3X4q41xlprFJiIdSJXC/mT7RBRhuU7S5LFq9JiiNXLj0t2iHCYCIKacY5NmsgZHJbgPv6LmpqQVVdwOMU/MJSJCF4SC21HA1eAVXpsEJYY9jZgCdJTzzufB8JYFQMNeU3PrXdftGZMas2QRDf7ouCGP7baeomiv9nOqyBSXHjBrN20TZ093rSQRLJmWFEEqYIzS22uZTjjp1n3H5Nkk6ofs4AkjlI=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966005)(47076004)(82310400003)(8936002)(83380400001)(54906003)(81166007)(6486002)(356005)(966005)(2906002)(8676002)(33656002)(6506007)(36756003)(2616005)(186003)(478600001)(336012)(6512007)(5660300002)(26005)(82740400003)(86362001)(316002)(70586007)(107886003)(70206006)(4326008)(6916009);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 13:47:35.7323 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b53398cd-b5fd-4b38-45c7-08d85590131f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5126
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

Following my patch[1] to map the guest runstate in Xen during the hypercall=
 directly
instead of doing the conversion from virtual to physical when updating the =
runstate
content during a context switch a global discussion started[2][3].

To resume the discussion the problem is the following: A guest registers a =
memory
area for xen to put on and maintain the runstate information. This is done =
currently
using a guest virtual address which is converted by Xen during context swit=
ches.
When KPTI is used and a context switch occurs while linux is running in use=
r space
the area is not mapped and the information is not updated. This results in =
invalid
runstate information but also in some annoying warning coming up in Xen con=
sole
on arm.

After the discussion by mail and the last community call it was proposed to=
 change
the way to go and instead of trying to fix the problem in the existing hype=
rcall, to
introduce a new hypercall taking as parameter a guest physical address for =
the
runstate area instead of a virtual address in the current hypercall.

This means:
- add a new hypercall to Xen
- add support for this new hypercall in Linux and use it if Xen supports it
- keep existing hypercall with its limitation (for older guests)
- keep support for both behaviour during the context switch

Some open questions:
- should we allow to register an area using both hypercalls or should it be=
 exclusive ?
- should we backport the support for this hypercall in older kernel release=
s ?
- other ?

Please tell me if you agree or not before I start to plan how this can be i=
mplemented :-)

Regards
Bertrand

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01541.h=
tml
[2] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01461.h=
tml
[3] https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00810.h=
tml





IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

