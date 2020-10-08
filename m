Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF9428705E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 09:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4267.11515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQQoh-00016Y-0p; Thu, 08 Oct 2020 07:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4267.11515; Thu, 08 Oct 2020 07:58:22 +0000
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
	id 1kQQog-000169-TL; Thu, 08 Oct 2020 07:58:22 +0000
Received: by outflank-mailman (input) for mailman id 4267;
 Thu, 08 Oct 2020 07:58:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KIyQ=DP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kQQoe-000160-Kh
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 07:58:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.86]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f23411a2-beaf-4321-a7a3-c7f523e38c88;
 Thu, 08 Oct 2020 07:58:19 +0000 (UTC)
Received: from AM3PR07CA0060.eurprd07.prod.outlook.com (2603:10a6:207:4::18)
 by VI1PR08MB3855.eurprd08.prod.outlook.com (2603:10a6:803:bb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Thu, 8 Oct
 2020 07:58:14 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:4:cafe::f5) by AM3PR07CA0060.outlook.office365.com
 (2603:10a6:207:4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11 via Frontend
 Transport; Thu, 8 Oct 2020 07:58:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Thu, 8 Oct 2020 07:58:14 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Thu, 08 Oct 2020 07:58:14 +0000
Received: from 9f2014325a99.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 485C651D-D151-4279-B33D-744A119EFBC2.1; 
 Thu, 08 Oct 2020 07:58:08 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f2014325a99.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Oct 2020 07:58:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5371.eurprd08.prod.outlook.com (2603:10a6:10:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Thu, 8 Oct
 2020 07:58:06 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.023; Thu, 8 Oct 2020
 07:58:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KIyQ=DP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kQQoe-000160-Kh
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 07:58:20 +0000
X-Inumbo-ID: f23411a2-beaf-4321-a7a3-c7f523e38c88
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [40.107.6.86])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f23411a2-beaf-4321-a7a3-c7f523e38c88;
	Thu, 08 Oct 2020 07:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7nTMjrQoVtqeugW7ZobCJYhA6M53QYDjDuRHtwZfPI=;
 b=lMdDsIp5f6daYd7Ygg0lFP1eYpLcmy6TG+lxAn2My7xCl0ShrE39Lzn0aXfnRSTgHMPb0J2RJshBNk+BsPHB9hL58Qs+IyfFOQqDai3cEEeI1k/EJOIaWewHNIhmYXWoyawEw4rw5cqRl7ih/Oqp4xY+ROzM0EUdPpCZRxYSsUk=
Received: from AM3PR07CA0060.eurprd07.prod.outlook.com (2603:10a6:207:4::18)
 by VI1PR08MB3855.eurprd08.prod.outlook.com (2603:10a6:803:bb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Thu, 8 Oct
 2020 07:58:14 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:4:cafe::f5) by AM3PR07CA0060.outlook.office365.com
 (2603:10a6:207:4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11 via Frontend
 Transport; Thu, 8 Oct 2020 07:58:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Thu, 8 Oct 2020 07:58:14 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Thu, 08 Oct 2020 07:58:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09d607fd8e780236
X-CR-MTA-TID: 64aa7808
Received: from 9f2014325a99.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 485C651D-D151-4279-B33D-744A119EFBC2.1;
	Thu, 08 Oct 2020 07:58:08 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f2014325a99.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 08 Oct 2020 07:58:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlAqV7qgXaAY8n1RyA5vN4CLfaH1b0ZpJVxhwh65+wia6l5Zdi530AvIRKbkcM9gp582UOTvYFW6LL5xDZC3UEq+KzN/nfROHVKLVw7M5D9cxSDi3j7FuY6db3C19fVF5LRbrnOj3ecMc7yXPwIOT+xtv9KoiphL8EbBqK8eMb5kPBMI+raW3JW3VIphi7/r85Ys3dLF2QKoR6vLNdqT3InVKpTJxgazTnxK/Qoek/CEn4wIGd8sWXrNfLBzdgRVBEjHE3b2vYOpOf1KZUbNB6fBHPcJmaDG9qSp7/9QJ9Q29fWkoKnURl6F5mVM8p5H8ITpW7IxqZYPeb/jxUeNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7nTMjrQoVtqeugW7ZobCJYhA6M53QYDjDuRHtwZfPI=;
 b=DoVUVyE6GDlEnOuKh8KZ/ZtrmEw9BLv61o/+WKG538FTsMFYhhC7FWzCxI7P24zUpKak6jajUPcXuuE82gGr4pa7Z/7k6aGDuVpNlv/rzp1tgBDBdBZEhaXbAImghiAgwx7GgOgPWuq9CUdNWsUz1X8wIw0UMh6n/OK2cKo0lg3Bv79o6Xws3jeZuVxF8RIi5CnTl8+rMW9fq1hEKJgoetNuMSyEEsXMCHOmDYPFmXn0wdbUs05oyHbyCBi+zem732+n7iULBsmlwNYqIvq4hNB8XuMHpHFWADZEGSAh+XwekbQGjcarDVuP9amZ0DJ4haFYd+IDmaLNp8s5PjD+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7nTMjrQoVtqeugW7ZobCJYhA6M53QYDjDuRHtwZfPI=;
 b=lMdDsIp5f6daYd7Ygg0lFP1eYpLcmy6TG+lxAn2My7xCl0ShrE39Lzn0aXfnRSTgHMPb0J2RJshBNk+BsPHB9hL58Qs+IyfFOQqDai3cEEeI1k/EJOIaWewHNIhmYXWoyawEw4rw5cqRl7ih/Oqp4xY+ROzM0EUdPpCZRxYSsUk=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5371.eurprd08.prod.outlook.com (2603:10a6:10:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Thu, 8 Oct
 2020 07:58:06 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.023; Thu, 8 Oct 2020
 07:58:06 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, "julien@xen.org"
	<julien@xen.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	"roman@zededa.com" <roman@zededa.com>
Subject: Re: [PATCH v3] xen/rpi4: implement watchdog-based reset
Thread-Topic: [PATCH v3] xen/rpi4: implement watchdog-based reset
Thread-Index: AQHWnPqc7v70BAMN4EaAQA/1huLhsamNV4yA
Date: Thu, 8 Oct 2020 07:58:06 +0000
Message-ID: <1A694341-33AC-41E1-B216-2D3E1A6C45B4@arm.com>
References: <20201007223813.1638-1-sstabellini@kernel.org>
In-Reply-To: <20201007223813.1638-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 11a0d7da-0bdf-4971-9ae9-08d86b5fe8c2
x-ms-traffictypediagnostic: DB8PR08MB5371:|VI1PR08MB3855:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB38551617B25094C5200CD4F99D0B0@VI1PR08MB3855.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2276;OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VGPN2COUEvoV9gmIPD0CUPrdzEm7zTtGOi+Y6sis0vYBu0JWiAJOo7nqAuS6GwZDKoo+dM0E9ZsaPqpb5fgX89XG11gHVaYex7P4qDUIoxCNlfwBRDpFSxpTbfCnXlybr/XuB9WgOFXKo7K8zg7p33t7FWXAwY690SI2yhzgBSgrtJBVfFluin/7QWxxFH/cHHTMlvii9HIoqp7P5XtZ8r5CuZfxxLYYoNyOKhAkWtIdtG3Ff9VUB9f9Ro53PAV3mizFR41CZrrImcDMshofF6NH8uuROAvEG1GJyluqIaS/Ru0lP+lM3JGnQkzPABgGvUvCnwFCM/MwpUrF0uxlxQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39850400004)(316002)(86362001)(6512007)(54906003)(8936002)(83380400001)(6916009)(33656002)(4326008)(5660300002)(66446008)(8676002)(66946007)(66556008)(64756008)(36756003)(66476007)(91956017)(2906002)(6486002)(76116006)(53546011)(71200400001)(2616005)(478600001)(6506007)(186003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 jteXyPQCgcSh53DigzNKCGTJwKm+gA1t+vIemc2AlI8o0XItDFZ0MZyfeAXuNPRkfHQZm+iU61h1vgXpSGQc93yU7d4rUhftXkdozhP4egnYx1/zfh8CYsV3cRNGD036/sFccK6+/CcCh7vRn9izDjtL4x8da9FZ4Zf1PD7GHqB0RC6HX+J9DkfdaSwbwiHJc1KL99Irmi/DcMeoqaCASaNfKL6RI7CapAs/5EzIgMNcuBNr0p94wAirXmdJjLOIHpJ9ghH+2ZkTjHcASwluBc25DLh47z+NpXxKXeBiH8xnybmIrJCzWF5q0Jo2QKDEVB+C2kW4RuyTKjdHue2fUlkRHGOTdHfhhcwcPdyNJnBMjjqfIvUT60IGF0m5xW+fwRjRN6nQgHJLTanOeHCDEB1yvdFLTUOf5uNdK8JdxYghFdhB5h8p8h3XuDj7GEaQst8ErFypqph5khN2k2vgRqWvChUBHdtXzb7iuxj/6BnQYLO+zzg/tV/U77peqB6tsFudjjgsp+DyL+m6n9lAZLfMdg5ywkF5R075SMP9617FWkjhx5XMqlrEOjEZeoDLMpKeLIuKxFqd/zZF2KqdrWODkU6oMpJroSCjNMYheaBlL1OoHJhyUSKaB2XIdua5dPyLwoJA0Ccx1QyiEN19cw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <842F47F688C5DA4E96EC8B062E928851@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5371
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47c2ba04-88c9-41d5-d2d1-08d86b5fe3f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CTk3HFO52C68t1gKOVwLr4gA6t0xPgwJ7jF9pVMwgi4yNPR0N5rHUv6Pz0Ojs8SWMI59toLmcx1ZH/pe0wswLiaLfFK5HJym1aVhhHo7NBDQ+0w4VYFd60IPhQees/UPxsxMJBkjVpKQxtenkfREaDNJx0ohI7c0QiRjgW8U9OnsSQhbuT82ptx36bpp624aiExk3Q70/MduKvUSclpQnwQl9Kwd2dFg5R7mcT1dx4uEVCAE/py1bGQd2+g/NbtetWu1xOlK5EIpuIo0NLUbNMszJuRaUxJ2D077eul5nHF8bQJgNvMhSB7TxEsfUMu5EdlWP5mPuYgaPd1qTtxgfM+UOg4Q18/H3KMPksI69Hm7M4c3KMWKW3tU0M1OCaaQaHZWqRfcfGTZWtucqFZpiQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39850400004)(396003)(46966005)(86362001)(83380400001)(47076004)(478600001)(82740400003)(6486002)(54906003)(4326008)(107886003)(6862004)(6512007)(82310400003)(33656002)(8936002)(5660300002)(186003)(36906005)(81166007)(316002)(53546011)(2906002)(2616005)(36756003)(6506007)(336012)(70206006)(70586007)(26005)(356005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2020 07:58:14.3458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a0d7da-0bdf-4971-9ae9-08d86b5fe8c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3855



> On 7 Oct 2020, at 23:38, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> The preferred method to reboot RPi4 is PSCI. If it is not available,
> touching the watchdog is required to be able to reboot the board.
>=20
> The implementation is based on
> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux v5.9-rc7.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Maybe a printk if reset was not successful ?

Cheers
Bertrand

> CC: roman@zededa.com
> ---
> Changes in v3:
> - fix typo in commit message
> - dprintk -> printk
> ---
> xen/arch/arm/platforms/brcm-raspberry-pi.c | 61 ++++++++++++++++++++++
> 1 file changed, 61 insertions(+)
>=20
> diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/pl=
atforms/brcm-raspberry-pi.c
> index f5ae58a7d5..811b40b1a6 100644
> --- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
> +++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> @@ -17,6 +17,10 @@
>  * GNU General Public License for more details.
>  */
>=20
> +#include <xen/delay.h>
> +#include <xen/mm.h>
> +#include <xen/vmap.h>
> +#include <asm/io.h>
> #include <asm/platform.h>
>=20
> static const char *const rpi4_dt_compat[] __initconst =3D
> @@ -37,12 +41,69 @@ static const struct dt_device_match rpi4_blacklist_de=
v[] __initconst =3D
>      * The aux peripheral also shares a page with the aux UART.
>      */
>     DT_MATCH_COMPATIBLE("brcm,bcm2835-aux"),
> +    /* Special device used for rebooting */
> +    DT_MATCH_COMPATIBLE("brcm,bcm2835-pm"),
>     { /* sentinel */ },
> };
>=20
> +
> +#define PM_PASSWORD                 0x5a000000
> +#define PM_RSTC                     0x1c
> +#define PM_WDOG                     0x24
> +#define PM_RSTC_WRCFG_FULL_RESET    0x00000020
> +#define PM_RSTC_WRCFG_CLR           0xffffffcf
> +
> +static void __iomem *rpi4_map_watchdog(void)
> +{
> +    void __iomem *base;
> +    struct dt_device_node *node;
> +    paddr_t start, len;
> +    int ret;
> +
> +    node =3D dt_find_compatible_node(NULL, NULL, "brcm,bcm2835-pm");
> +    if ( !node )
> +        return NULL;
> +
> +    ret =3D dt_device_get_address(node, 0, &start, &len);
> +    if ( ret )
> +    {
> +        printk("Cannot read watchdog register address\n");
> +        return NULL;
> +    }
> +
> +    base =3D ioremap_nocache(start & PAGE_MASK, PAGE_SIZE);
> +    if ( !base )
> +    {
> +        printk("Unable to map watchdog register!\n");
> +        return NULL;
> +    }
> +
> +    return base;
> +}
> +
> +static void rpi4_reset(void)
> +{
> +    uint32_t val;
> +    void __iomem *base =3D rpi4_map_watchdog();
> +
> +    if ( !base )
> +        return;
> +
> +    /* use a timeout of 10 ticks (~150us) */
> +    writel(10 | PM_PASSWORD, base + PM_WDOG);
> +    val =3D readl(base + PM_RSTC);
> +    val &=3D PM_RSTC_WRCFG_CLR;
> +    val |=3D PM_PASSWORD | PM_RSTC_WRCFG_FULL_RESET;
> +    writel(val, base + PM_RSTC);
> +
> +    /* No sleeping, possibly atomic. */
> +    mdelay(1);
> +}
> +
> PLATFORM_START(rpi4, "Raspberry Pi 4")
>     .compatible     =3D rpi4_dt_compat,
>     .blacklist_dev  =3D rpi4_blacklist_dev,
> +    .reset =3D rpi4_reset,
>     .dma_bitsize    =3D 30,
> PLATFORM_END
>=20
> --=20
> 2.17.1
>=20
>=20


