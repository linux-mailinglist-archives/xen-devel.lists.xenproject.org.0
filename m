Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEE22A6634
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 15:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19194.44422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaJaX-0002pi-U9; Wed, 04 Nov 2020 14:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19194.44422; Wed, 04 Nov 2020 14:16:37 +0000
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
	id 1kaJaX-0002pI-Pz; Wed, 04 Nov 2020 14:16:37 +0000
Received: by outflank-mailman (input) for mailman id 19194;
 Wed, 04 Nov 2020 14:16:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osUd=EK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kaJaX-0002p8-1G
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:16:37 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.72]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 105c36b8-8725-4a9e-9caa-c7c2790daf74;
 Wed, 04 Nov 2020 14:16:35 +0000 (UTC)
Received: from DB6P18901CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::31)
 by DB6PR08MB2936.eurprd08.prod.outlook.com (2603:10a6:6:25::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.30; Wed, 4 Nov
 2020 14:16:32 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::59) by DB6P18901CA0021.outlook.office365.com
 (2603:10a6:4:16::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Wed, 4 Nov 2020 14:16:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 14:16:31 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64");
 Wed, 04 Nov 2020 14:16:31 +0000
Received: from 739ac3104fd4.6
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1830FDAB-F871-4DCB-8191-9C63795F173B.1; 
 Wed, 04 Nov 2020 14:16:16 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 739ac3104fd4.6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Nov 2020 14:16:16 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB2963.eurprd08.prod.outlook.com (2603:10a6:208:56::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:16:13 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:16:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=osUd=EK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kaJaX-0002p8-1G
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 14:16:37 +0000
X-Inumbo-ID: 105c36b8-8725-4a9e-9caa-c7c2790daf74
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown [40.107.15.72])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 105c36b8-8725-4a9e-9caa-c7c2790daf74;
	Wed, 04 Nov 2020 14:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBNwGwCJaPBXkdBiV8OA7G4XjO552wM4S80DXQFPtKo=;
 b=79moceiJm0nRxS1pA7oeJcXhPrNHW14Enu77vAAiw1Z0iyfl3F9QXVg+nBIkAnzrDOyOhS6dtzFuzavXNDsT7+YfeJNQkswz3nrO63xPNRYeMd8nAe2weJYlIyJBnfKC1jptQTuoYivv4GWRn/4AHebDjqn0oxFwKLTgqzn6VsM=
Received: from DB6P18901CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::31)
 by DB6PR08MB2936.eurprd08.prod.outlook.com (2603:10a6:6:25::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.30; Wed, 4 Nov
 2020 14:16:32 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::59) by DB6P18901CA0021.outlook.office365.com
 (2603:10a6:4:16::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Wed, 4 Nov 2020 14:16:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 4 Nov 2020 14:16:31 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64"); Wed, 04 Nov 2020 14:16:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35ac0487e9cc3236
X-CR-MTA-TID: 64aa7808
Received: from 739ac3104fd4.6
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1830FDAB-F871-4DCB-8191-9C63795F173B.1;
	Wed, 04 Nov 2020 14:16:16 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 739ac3104fd4.6
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 04 Nov 2020 14:16:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKJweYYtRxRQvJPR+Ajh5IMWZFi22+YsQK5QyNvXzXOKpYuLi19w7YCMQAwL7T2NH6h3/ciOUHmImnHfo7bjfxna9c1ALsNs6CJUrKtSSl8qpYbG6dn+JYkB5JDLwv381PTJaf3OR7Aw/5MMQjRLPCm/B85VB+euXodhPaaQcxBTB1EGACiXv0OQhYsTH4i8wqipkUnEm7sru0/MlM4c1bN6N6qxUQZij6kbGXxK6NRVEHd+1kRQS2fC6eteE76ptow8ZDbHeVenZu643knUZQKQ89+oIbYIoHDiQm+DwuZ4Rfh2i4nrJzUKo4OhVLR7sfdHtlriIn6PHNrCQH75gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBNwGwCJaPBXkdBiV8OA7G4XjO552wM4S80DXQFPtKo=;
 b=VDzMk1sT4U9HkhYYockstl2Dc5WjT1q0pbOvwF03b0nVfMtSwPy2ytKzF3OBQJUe+cOVcPmuyNYy8x7X8bzeCb3ukxJArCAKEttqCUQp35mjj2rmru/2xk+Gat7j3euJLjD0vu/g+fMDrkMGJOj/pKX0RdrbJY9AJ0XvQvkrCE4N5IzbonyRPqA5QOXcoD9aTgUue6PJh65W+/ghHu/wXKnpAlLcAN3K74lJkjJWjHwagz7SejfLph785nlkqdUNoT1lzADXBGCR/TLsIWwkCnbQ/zFDhgv0CjrgHlACEe1hn9ULPnVa3fbA4FBzrUZ0XK3XVrSP4e5f//z6e+LjbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBNwGwCJaPBXkdBiV8OA7G4XjO552wM4S80DXQFPtKo=;
 b=79moceiJm0nRxS1pA7oeJcXhPrNHW14Enu77vAAiw1Z0iyfl3F9QXVg+nBIkAnzrDOyOhS6dtzFuzavXNDsT7+YfeJNQkswz3nrO63xPNRYeMd8nAe2weJYlIyJBnfKC1jptQTuoYivv4GWRn/4AHebDjqn0oxFwKLTgqzn6VsM=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM0PR08MB2963.eurprd08.prod.outlook.com (2603:10a6:208:56::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:16:13 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:16:13 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/4] xen/pci: Move x86 specific code to x86 directory.
Thread-Topic: [PATCH v2 3/4] xen/pci: Move x86 specific code to x86 directory.
Thread-Index: AQHWsfp3Q4MXt0Ip3ECqFjMEjNXJ/qm4BiSA
Date: Wed, 4 Nov 2020 14:16:13 +0000
Message-ID: <EAD68E48-36A4-49EA-A6B7-F6CA7D334A85@arm.com>
References: <cover.1604417224.git.rahul.singh@arm.com>
 <687101e7e0e6feb64dd8ea63c8cf1aacf1684049.1604417224.git.rahul.singh@arm.com>
In-Reply-To:
 <687101e7e0e6feb64dd8ea63c8cf1aacf1684049.1604417224.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c9d5dbab-0de4-4b07-6438-08d880cc3ab3
x-ms-traffictypediagnostic: AM0PR08MB2963:|DB6PR08MB2936:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB2936F349CFA379E9C1BDB6E79DEF0@DB6PR08MB2936.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xL55LDyIFveu1vbd0UG0uKDBftvWnpZBHX/EjRUIZ+lef8ciZevEHRcC+cFKsASzToLWB0JDApgTrtYZ3rC2ykDf+Io0EBIRRZ5sY5twTZnt+64Dd01Su0FwiINWNJCzQkQWCaR/d96v0/qR9ho7jbanLk4NfVMPL7OayK7aCsTAT2inYjyFlSe07RV72NtMRkM1MfF1GFT0ytWKbQZT9qI0q2P+toMvFhVHc0U60/EY52P6F6eWPH3DXbhb1Ihtl9UbyVGp8V+SDR5mwl91Vy82a4yHRw4bC+gGfdxPLET5Wfc3KmjSreUCLmmRyr39VqN/c5MnFbuAzMoesuUCfBi0WjtERUOt9aobu2TtESZhVy4+NbzXQmBtwcnobXdrBKl/EGwmQ82zLeir3BVRbh8ZHy+bMSO83QzEnwjnNFLLFzAyR1x3HqNdmpxBkPxMPVi0bS0cLKcJHSzDUloXlg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3682.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(4326008)(36756003)(76116006)(66476007)(66556008)(26005)(2906002)(66946007)(6862004)(83380400001)(71200400001)(66446008)(91956017)(64756008)(5660300002)(6486002)(33656002)(86362001)(53546011)(186003)(6636002)(37006003)(6506007)(8676002)(54906003)(6512007)(2616005)(478600001)(316002)(8936002)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 UVVTHxMqNHBjQfOUdRPXXPjq/EDAhubcF9WzccewgWFXnmpKM034fP1T04jcu7T4VbhjM5X4alFniCn2J7r7TC4PgGgR4WWmJIZYjzCNsKIe1X10LtWfoUAn1mltga//xWnbs5f1gVIALvVy3QQNHwfn+sofRp4UXH0VPVJ9JQAhqnpREifXid0wvM6fTpv56/VtjTwS1jMcR7YcPodZyGU5bc3cG9b64R/9lPkD0PdzarwYGmZLlORf9kKscZwYShjKqfpQaOeymGSUlE+n7OJ9ecILmn77Zi5yw+OU3vtDsBMS1PH9Upgf1NI9WW4SdAxdghYYdcXscr2vlYh3iqG7KLRIq+Bu2HZsj/58PdGehSgjQIOdZZbaRSbe1e3nehqrmkwkKoApsYdte+XVd7m1QyfNet0M2fCh0cOFdzwt36RfmWVkQnDT87DYZev6jO8W4zUCXHDkbW70kDPNP3di8dMYCWbD9crrYzZL8DGvfzU485LtQwrSBxA/xHIn+/V9qcIoe5fRzLpOcZl1Rl/KFOFZTRGflR5Yx04qNAL1SngrAn6miOSwfsxMVjV/Zbc9q+dCezf/Ne/VNPxlFEeb3iXiayHFdaJddABPCsHDGFJjU5SxEOSwaaNpNmv1JbaXt1bJdD9Rw3r2FbzEwA==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D75432950B3EEE4E855472B412CC15A1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2963
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0e394a2e-9f6e-486a-9f28-08d880cc2fb0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zUfNqaxFqOTACTZBtpJ8qdEQku1xep+5o+jlaAJCZGmdmR17xFkqI+mdxpBuZD4sj5AY/rXUy+pixT3C82RNYSpWlVQ9VfVtR1lN4ZbgV3Y1yVWCpS3yg0U18DuAk2SW5vURvJg9cHxZzSB5n1AKVht4w7WRHX6dpZ+GHBgV9Qb0xgXvH1OnOj9Fan5nEUZ4qxse5Uia2X4R5t56oDCCqwcDrhM33WmicsvDiiBFQollprbh/+Tj7jUk3D0x9SV2Oc+jJc2ZBoMHR6OeKxU+GyOJ4W4ZsRdNfH/1z+co2Yfvrcl+KZ2O7+ilymD+yxU2Jrn2LrqrEGNGghckUGHCH/3A7AN3WUt41Yc0MvRk0UMJElbn0TELzm79Vytqjg9ni7emRrysK07ooc9Qmot0mOJwfokOtWFpSzwfqYg1Q+YWXFamyWVMDyJGvk3r/LBwHl3dQty8idUB84bEym12bR5MYhy/8T3ZIyjptqjJCaANshsUPbH086lS3zEctq4I
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(82740400003)(2616005)(86362001)(4326008)(8676002)(8936002)(47076004)(70206006)(6512007)(26005)(33656002)(83380400001)(478600001)(70586007)(53546011)(356005)(81166007)(36756003)(2906002)(6486002)(6862004)(186003)(82310400003)(6636002)(336012)(54906003)(37006003)(316002)(6506007)(5660300002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:16:31.9334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d5dbab-0de4-4b07-6438-08d880cc3ab3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2936



> On 3 Nov 2020, at 15:59, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> passthrough/pci.c file is common for all architecture, but there is x86
> sepcific code in this file.
>=20
> Move x86 specific code to the x86 directory to avoid compilation error
> for other architecture.
>=20
> No functional change.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
>=20
> Changes is v2:
> - fixed comments.
> - rename pci_clean_dpci_irqs() to arch_pci_clean_pirqs().
>=20
> ---
> xen/drivers/passthrough/pci.c        | 76 +----------------------
> xen/drivers/passthrough/x86/Makefile |  1 +
> xen/drivers/passthrough/x86/iommu.c  |  7 +++
> xen/drivers/passthrough/x86/pci.c    | 91 ++++++++++++++++++++++++++++
> xen/include/xen/pci.h                |  2 +
> 5 files changed, 102 insertions(+), 75 deletions(-)
> create mode 100644 xen/drivers/passthrough/x86/pci.c
>=20
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.=
c
> index 2a3bce1462..04d3e2c0f9 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -14,7 +14,6 @@
>  * this program; If not, see <http://www.gnu.org/licenses/>.
>  */
>=20
> -#include <xen/sched.h>
> #include <xen/pci.h>
> #include <xen/pci_regs.h>
> #include <xen/pci_ids.h>
> @@ -24,7 +23,6 @@
> #include <xen/irq.h>
> #include <xen/param.h>
> #include <xen/vm_event.h>
> -#include <asm/hvm/irq.h>
> #include <xen/delay.h>
> #include <xen/keyhandler.h>
> #include <xen/event.h>
> @@ -847,71 +845,6 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>     return ret;
> }
>=20
> -static int pci_clean_dpci_irq(struct domain *d,
> -                              struct hvm_pirq_dpci *pirq_dpci, void *arg=
)
> -{
> -    struct dev_intx_gsi_link *digl, *tmp;
> -
> -    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
> -
> -    if ( pt_irq_need_timer(pirq_dpci->flags) )
> -        kill_timer(&pirq_dpci->timer);
> -
> -    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
> -    {
> -        list_del(&digl->list);
> -        xfree(digl);
> -    }
> -
> -    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
> -
> -    if ( !pt_pirq_softirq_active(pirq_dpci) )
> -        return 0;
> -
> -    domain_get_irq_dpci(d)->pending_pirq_dpci =3D pirq_dpci;
> -
> -    return -ERESTART;
> -}
> -
> -static int pci_clean_dpci_irqs(struct domain *d)
> -{
> -    struct hvm_irq_dpci *hvm_irq_dpci =3D NULL;
> -
> -    if ( !is_iommu_enabled(d) )
> -        return 0;
> -
> -    if ( !is_hvm_domain(d) )
> -        return 0;
> -
> -    spin_lock(&d->event_lock);
> -    hvm_irq_dpci =3D domain_get_irq_dpci(d);
> -    if ( hvm_irq_dpci !=3D NULL )
> -    {
> -        int ret =3D 0;
> -
> -        if ( hvm_irq_dpci->pending_pirq_dpci )
> -        {
> -            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci)=
 )
> -                 ret =3D -ERESTART;
> -            else
> -                 hvm_irq_dpci->pending_pirq_dpci =3D NULL;
> -        }
> -
> -        if ( !ret )
> -            ret =3D pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
> -        if ( ret )
> -        {
> -            spin_unlock(&d->event_lock);
> -            return ret;
> -        }
> -
> -        hvm_domain_irq(d)->dpci =3D NULL;
> -        free_hvm_irq_dpci(hvm_irq_dpci);
> -    }
> -    spin_unlock(&d->event_lock);
> -    return 0;
> -}
> -
> /* Caller should hold the pcidevs_lock */
> static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>                            uint8_t devfn)
> @@ -971,7 +904,7 @@ int pci_release_devices(struct domain *d)
>     int ret;
>=20
>     pcidevs_lock();
> -    ret =3D pci_clean_dpci_irqs(d);
> +    ret =3D arch_pci_clean_pirqs(d);
>     if ( ret )
>     {
>         pcidevs_unlock();
> @@ -1375,13 +1308,6 @@ static int __init setup_dump_pcidevs(void)
> }
> __initcall(setup_dump_pcidevs);
>=20
> -int iommu_update_ire_from_msi(
> -    struct msi_desc *msi_desc, struct msi_msg *msg)
> -{
> -    return iommu_intremap
> -           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) =
: 0;
> -}
> -
> static int iommu_add_device(struct pci_dev *pdev)
> {
>     const struct domain_iommu *hd;
> diff --git a/xen/drivers/passthrough/x86/Makefile b/xen/drivers/passthrou=
gh/x86/Makefile
> index aa515c680d..d02ff75de5 100644
> --- a/xen/drivers/passthrough/x86/Makefile
> +++ b/xen/drivers/passthrough/x86/Makefile
> @@ -1,2 +1,3 @@
> obj-$(CONFIG_PCI_ATS) +=3D ats.o
> obj-y +=3D iommu.o
> +obj-y +=3D pci.o
> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthroug=
h/x86/iommu.c
> index f17b1820f4..875e67b53b 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -308,6 +308,13 @@ struct page_info *iommu_alloc_pgtable(struct domain =
*d)
>     return pg;
> }
>=20
> +int iommu_update_ire_from_msi(
> +    struct msi_desc *msi_desc, struct msi_msg *msg)
> +{
> +    return iommu_intremap
> +           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) =
: 0;
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> diff --git a/xen/drivers/passthrough/x86/pci.c b/xen/drivers/passthrough/=
x86/pci.c
> new file mode 100644
> index 0000000000..59588aa8d4
> --- /dev/null
> +++ b/xen/drivers/passthrough/x86/pci.c
> @@ -0,0 +1,91 @@
> +/*
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/sched.h>
> +#include <xen/pci.h>
> +
> +static int pci_clean_dpci_irq(struct domain *d,
> +                              struct hvm_pirq_dpci *pirq_dpci, void *arg=
)
> +{
> +    struct dev_intx_gsi_link *digl, *tmp;
> +
> +    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
> +
> +    if ( pt_irq_need_timer(pirq_dpci->flags) )
> +        kill_timer(&pirq_dpci->timer);
> +
> +    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
> +    {
> +        list_del(&digl->list);
> +        xfree(digl);
> +    }
> +
> +    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
> +
> +    if ( !pt_pirq_softirq_active(pirq_dpci) )
> +        return 0;
> +
> +    domain_get_irq_dpci(d)->pending_pirq_dpci =3D pirq_dpci;
> +
> +    return -ERESTART;
> +}
> +
> +int arch_pci_clean_pirqs(struct domain *d)
> +{
> +    struct hvm_irq_dpci *hvm_irq_dpci =3D NULL;
> +
> +    if ( !is_iommu_enabled(d) )
> +        return 0;
> +
> +    if ( !is_hvm_domain(d) )
> +        return 0;
> +
> +    spin_lock(&d->event_lock);
> +    hvm_irq_dpci =3D domain_get_irq_dpci(d);
> +    if ( hvm_irq_dpci !=3D NULL )
> +    {
> +        int ret =3D 0;
> +
> +        if ( hvm_irq_dpci->pending_pirq_dpci )
> +        {
> +            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci)=
 )
> +                 ret =3D -ERESTART;
> +            else
> +                 hvm_irq_dpci->pending_pirq_dpci =3D NULL;
> +        }
> +
> +        if ( !ret )
> +            ret =3D pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
> +        if ( ret )
> +        {
> +            spin_unlock(&d->event_lock);
> +            return ret;
> +        }
> +
> +        hvm_domain_irq(d)->dpci =3D NULL;
> +        free_hvm_irq_dpci(hvm_irq_dpci);
> +    }
> +    spin_unlock(&d->event_lock);
> +
> +    return 0;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index c4d3879761..fd28d11f6e 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -209,4 +209,6 @@ int msixtbl_pt_register(struct domain *, struct pirq =
*, uint64_t gtable);
> void msixtbl_pt_unregister(struct domain *, struct pirq *);
> void msixtbl_pt_cleanup(struct domain *d);
>=20
> +int arch_pci_clean_pirqs(struct domain *d);
> +
> #endif /* __XEN_PCI_H__ */
> --=20
> 2.17.1
>=20


