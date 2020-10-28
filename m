Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4110029D0A2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 16:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13680.34428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXnGg-0005TF-Tv; Wed, 28 Oct 2020 15:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13680.34428; Wed, 28 Oct 2020 15:21:42 +0000
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
	id 1kXnGg-0005Sq-QJ; Wed, 28 Oct 2020 15:21:42 +0000
Received: by outflank-mailman (input) for mailman id 13680;
 Wed, 28 Oct 2020 15:21:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zZT=ED=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kXnGf-0005Sl-Ff
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:21:41 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.51]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6674565-d246-4722-97ab-ca85d6711646;
 Wed, 28 Oct 2020 15:21:38 +0000 (UTC)
Received: from MR2P264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::32) by
 HE1PR0802MB2617.eurprd08.prod.outlook.com (2603:10a6:3:e0::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.25; Wed, 28 Oct 2020 15:21:35 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::f9) by MR2P264CA0020.outlook.office365.com
 (2603:10a6:500:1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 28 Oct 2020 15:21:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 15:21:35 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64");
 Wed, 28 Oct 2020 15:21:34 +0000
Received: from 731b9158dda2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E02E6678-96F1-4A3F-A684-E544125856F4.1; 
 Wed, 28 Oct 2020 15:21:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 731b9158dda2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Oct 2020 15:21:01 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM0PR08MB5027.eurprd08.prod.outlook.com (2603:10a6:208:15c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:20:59 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:20:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7zZT=ED=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kXnGf-0005Sl-Ff
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:21:41 +0000
X-Inumbo-ID: f6674565-d246-4722-97ab-ca85d6711646
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown [40.107.13.51])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f6674565-d246-4722-97ab-ca85d6711646;
	Wed, 28 Oct 2020 15:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EziYhGqbg+zTATj1oJDLW1nY9c62Yt5ufgVzeSdXRKE=;
 b=a3qE9G3eUGzfte3LxjH01vtjFPKEy0S+Cp9CwDVeHgm8pmBgHrOQ7Hg+CtI2wxnVw+yQ6Ul6c/tQoMqhl4SpNhaawDpKB8z8Oa86bQMFqfEko9fqtIYrTzlM/GImGbWnmsRxMe7Y8iZf67s4STZ/vLAr8wfckLwkhHxgjL9+NF4=
Received: from MR2P264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::32) by
 HE1PR0802MB2617.eurprd08.prod.outlook.com (2603:10a6:3:e0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.25; Wed, 28 Oct 2020 15:21:35 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::f9) by MR2P264CA0020.outlook.office365.com
 (2603:10a6:500:1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 28 Oct 2020 15:21:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 15:21:35 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64"); Wed, 28 Oct 2020 15:21:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b3202e61668085bc
X-CR-MTA-TID: 64aa7808
Received: from 731b9158dda2.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E02E6678-96F1-4A3F-A684-E544125856F4.1;
	Wed, 28 Oct 2020 15:21:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 731b9158dda2.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Oct 2020 15:21:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAncU0MiK5u3dHViUWKF+U3c1caZapZK0OAZfpG61zTVnQdGvmfJ0W2ez21nf/4jIWxo5FlsUiW0VivbnNsl37HL7KcyfWyG/ex/EYOMY851C5ZCWyhVRDRJYSlsidBQnbj9qHHGBmKXX099p6iFcmVERN8E1MQaPYpEEP2+zD5fdAiYx5G1s9kPKo6p6RoFwUgDXJHNYFAekAhNpPvB3lcRb09dAaMRHcxwOA+R62WsaWh5WTKWTmsH6e45YOXTSOfc5OfEXM8X9zBsrnEm/SbXl/uNlh4Ed8LqqSfoeQvyKHOkXR3GIQbbUVGn88RT1d0ND3lI3zZ3sm604eK+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EziYhGqbg+zTATj1oJDLW1nY9c62Yt5ufgVzeSdXRKE=;
 b=VZ1xc80edmzoEKBNOaX43EOIZRDwSKIDijVX4u6Sga8dwD21JlQa2WUQRbZevhDeh2rkP66UXYhpTrBjkOCkkczESOUbJHue9FKuPA1KovaDwKrSRD+ZT1iDLJax56pv7Q7Q7GeJZ9lJ2V6xRewMW7KBC/KRS5PPNN+WGM77rrfvjipwNL9Eg5tLjZy8X/hwKzXVkVUirz8eDnkkDR4wvQ8sonIJRq/p0DaQEoip885kZ4OybTbyZ6MvLzQjStiQX8SI6rS8lC9xLGgZXAdVrileGx09oc0LXkCVwOP2yVlWiLQZker2d0otcU9xUnh92XRArLTMh8K+6E2ko5MW1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EziYhGqbg+zTATj1oJDLW1nY9c62Yt5ufgVzeSdXRKE=;
 b=a3qE9G3eUGzfte3LxjH01vtjFPKEy0S+Cp9CwDVeHgm8pmBgHrOQ7Hg+CtI2wxnVw+yQ6Ul6c/tQoMqhl4SpNhaawDpKB8z8Oa86bQMFqfEko9fqtIYrTzlM/GImGbWnmsRxMe7Y8iZf67s4STZ/vLAr8wfckLwkhHxgjL9+NF4=
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM0PR08MB5027.eurprd08.prod.outlook.com (2603:10a6:208:15c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:20:59 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:20:58 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 3/4] xen/pci: Move x86 specific code to x86 directory.
Thread-Topic: [PATCH v1 3/4] xen/pci: Move x86 specific code to x86 directory.
Thread-Index: AQHWq7x5RAJ4utEmJEq01xijjJpnmqms6fuAgAA6aoA=
Date: Wed, 28 Oct 2020 15:20:58 +0000
Message-ID: <4F4C34EE-7035-4931-9C65-13CCFEF52D18@arm.com>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <70029e8904170c4f19d9f521847050cd00c6e39d.1603731279.git.rahul.singh@arm.com>
 <301405a2-9ec1-847d-6f61-1067a225a3a9@suse.com>
In-Reply-To: <301405a2-9ec1-847d-6f61-1067a225a3a9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fb2a2dfb-a0a4-4d8a-318c-08d87b552861
x-ms-traffictypediagnostic: AM0PR08MB5027:|HE1PR0802MB2617:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2617D28CD5081926070F2D25FC170@HE1PR0802MB2617.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KIq4aA2LZWxMgz6fkxuCV8gQBJM41MuLa90kAjmvos+PNqxSOPAz6P2uC/zkbAB+UMjzwz+9Fkx92jBFlnTROgMy4gMJNqndenhrBGBSNtJcIvC95mzLzf0Cqn/FvLg/k1ZgjyJEuwUbZE88RWgeGPIgXU6SPs1IkkbucjmUlDotq1kuKnuK2/RYTYgavbE2VR9CmR7L39sCizi23fnx2bIqPSIDPFaW28ddLkopoFHrMx3VNwRAc8K7h1WpZHa8OSsyedhndNnUeBllnbl1gPvGPvmJThptlUH0fkF+n82wZMCXOIVhIKVOZYd4+JHiVyUXAVxgGqM0yOhCAgK2LekETsh4FCWqhjsNWt49hYQXEE9t0/GNsAVObtrJquC0sMPxF66nsCD3X9ZSwsGIhM516PjsRuZtuX0gtX0dmClBbSNT+IOA1XDWEW5GOmQ7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3490.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(66476007)(91956017)(8676002)(76116006)(86362001)(66446008)(478600001)(6916009)(66946007)(64756008)(6506007)(186003)(53546011)(55236004)(66556008)(26005)(33656002)(2616005)(71200400001)(83380400001)(6512007)(4326008)(54906003)(36756003)(6486002)(8936002)(316002)(5660300002)(2906002)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 o+74WlQ3siLfLpCqMr8VuRomk5BiYpCTXKOAUfqWdRl7qINXl6STRhN0gwwHq3QA+bu8ZYxRc7+qQocS1+SHodr7UuFI/OgjTntaeJoOSl+Zzb0u/7UhjPwZANf7GHfMfWxriRn6A/KjaLL8HkHvifPvTfNBptUe8PVsoXSh4WgZ2KM/BU1hlryDxOWdn8EiFtSzzbjOPckh+BlG8r5wDuJF87LYCCAriWLlL7qkJLz1oKGB3Cf0dBUg+0rOnqrb6fP6nS9wDSPru5MbTSYHvyeV+nL2vLg1PqpE/Mk+fbf7SNGIY8RqNUS9kFlSM8epD38ZWN3FNYLFj3O+IBTnQsSeBMS+7ueXt/PlBKNYl6KwFi1G+UDXoBPAz9F62XOTkT9HB3RX7Udc2kcYkNz8QOiO+uekfSJ1Cpjaz5PWgvD/oYbOGaTkp08MCFcVN2uJvERYVcbeMRX5LBwH8xXsqco03XVoh9etjV+v4HoQU4q6rTU9ra/v9fZuuR99TfSjtPQZ5HP86DBeVHMKyMRwNqJc4iD0D5DNTNS+/c++WIksvaP4ef9ohbLGZShbaOTo1Vz46Zsp4D8+Vp1e0wyEi2zlhOIvoSoQDvGPJSuhKmUMTuntm63PffdvVZ9+9vgB/kxptx729MhnTEVdlr/mNA==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EAA674ECFE45A84CA1066B2603ECD0C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5027
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	21e454a0-9a51-44dc-4577-08d87b5512be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SOgou1CTJqALojQ/VeVc2DM0J8MtxQgcLxzg9J5qd96hA7yTP/0JY+PU6B8TJLYx1y02uZqjcJPwwqKOzjegmaxYthRT/B9bUtU8TYvlI7qba5cL4zbtDe3PdKljqF1A5F3wux8zwk4m1rLLJKitoJY+67mHH7ElbvxOSuspXOdaWzje2CMxFQVQW4eL5AWKZTpPKOCd7GreQ1F3bbiX/NxAw1QxZDfPaaXKtTE+bAQwJ3acW80Iz9KR65YSCiobGzQBA5EHw9DZXOB5HElmGAL0N0DLjo4zFZ0RlOIrZDjUNnhy/PlHdD1ONRV5OfsKkff6PPa6Rnpa0OV5J0jNSxPcnd/mRdAajWJuRgUZaYtKPi2q9FogOVaP0b6O7fBMFdZ6ZfI3TDxYzDSXYS+YQAIpyCK0DxIjeNmwZUihzHuCAoSeEfpixUw5vbIv6MOfhDD8TKR0MaEOyErcnupstJyZfBa2A0r7+ogivRlkdVkx/HBE0/6erlDz4BsSzUMR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(46966005)(6862004)(2616005)(82310400003)(33656002)(2906002)(54906003)(4326008)(70206006)(70586007)(86362001)(5660300002)(6486002)(336012)(6512007)(82740400003)(186003)(26005)(47076004)(316002)(83380400001)(8936002)(8676002)(81166007)(55236004)(53546011)(6506007)(356005)(478600001)(36906005)(36756003)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:21:35.1780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2a2dfb-a0a4-4d8a-318c-08d87b552861
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2617

Hello Jan,

> On 28 Oct 2020, at 11:51 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 26.10.2020 18:17, Rahul Singh wrote:
>> passthrough/pci.c file is common for all architecture, but there is x86
>> sepcific code in this file.
>=20
> The code you move doesn't look to be x86 specific in the sense that
> it makes no sense on other architectures, but just because certain
> pieces are missing on Arm. With this I question whether is it really
> appropriate to move this code. I do realize that in similar earlier
> cases my questioning was mostly ignored ...
>=20
>> --- /dev/null
>> +++ b/xen/drivers/passthrough/x86/pci.c
>> @@ -0,0 +1,97 @@
>> +/*
>> + * This program is free software; you can redistribute it and/or modify=
 it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHO=
UT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY o=
r
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licens=
e for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License al=
ong with
>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <xen/param.h>
>> +#include <xen/sched.h>
>> +#include <xen/pci.h>
>> +#include <xen/pci_regs.h>
>> +
>> +static int pci_clean_dpci_irq(struct domain *d,
>> +                              struct hvm_pirq_dpci *pirq_dpci, void *ar=
g)
>> +{
>> +    struct dev_intx_gsi_link *digl, *tmp;
>> +
>> +    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
>> +
>> +    if ( pt_irq_need_timer(pirq_dpci->flags) )
>> +        kill_timer(&pirq_dpci->timer);
>> +
>> +    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
>> +    {
>> +        list_del(&digl->list);
>> +        xfree(digl);
>> +    }
>> +
>> +    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
>> +
>> +    if ( !pt_pirq_softirq_active(pirq_dpci) )
>> +        return 0;
>> +
>> +    domain_get_irq_dpci(d)->pending_pirq_dpci =3D pirq_dpci;
>> +
>> +    return -ERESTART;
>> +}
>> +
>> +static int pci_clean_dpci_irqs(struct domain *d)
>> +{
>> +    struct hvm_irq_dpci *hvm_irq_dpci =3D NULL;
>> +
>> +    if ( !is_iommu_enabled(d) )
>> +        return 0;
>> +
>> +    if ( !is_hvm_domain(d) )
>> +        return 0;
>> +
>> +    spin_lock(&d->event_lock);
>> +    hvm_irq_dpci =3D domain_get_irq_dpci(d);
>> +    if ( hvm_irq_dpci !=3D NULL )
>> +    {
>> +        int ret =3D 0;
>> +
>> +        if ( hvm_irq_dpci->pending_pirq_dpci )
>> +        {
>> +            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci=
) )
>> +                 ret =3D -ERESTART;
>> +            else
>> +                 hvm_irq_dpci->pending_pirq_dpci =3D NULL;
>> +        }
>> +
>> +        if ( !ret )
>> +            ret =3D pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
>> +        if ( ret )
>> +        {
>> +            spin_unlock(&d->event_lock);
>> +            return ret;
>> +        }
>> +
>> +        hvm_domain_irq(d)->dpci =3D NULL;
>> +        free_hvm_irq_dpci(hvm_irq_dpci);
>> +    }
>> +    spin_unlock(&d->event_lock);
>> +    return 0;
>=20
> While moving please add the missing blank line before the main
> return statement of the function.

Ok I will fix that in next version.
>=20
>> +}
>> +
>> +int arch_pci_release_devices(struct domain *d)
>> +{
>> +    return pci_clean_dpci_irqs(d);
>> +}
>=20
> Why the extra function layer?

Is that ok if I rename the function pci_clean_dpci_irqs() to arch_pci_clean=
_pirqs() ?

>=20
> Jan
>=20

Regards,
Rahul


