Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47152A90A8
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 08:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20450.46382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kawSj-0006n9-I6; Fri, 06 Nov 2020 07:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20450.46382; Fri, 06 Nov 2020 07:47:09 +0000
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
	id 1kawSj-0006mk-F1; Fri, 06 Nov 2020 07:47:09 +0000
Received: by outflank-mailman (input) for mailman id 20450;
 Fri, 06 Nov 2020 07:47:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ANsg=EM=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kawSh-0006mf-3b
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 07:47:07 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd79651c-5cb4-46c9-818c-ff3699dce459;
 Fri, 06 Nov 2020 07:47:05 +0000 (UTC)
Received: from AM6P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::26)
 by AM9PR08MB5873.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 6 Nov
 2020 07:47:03 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::5c) by AM6P191CA0013.outlook.office365.com
 (2603:10a6:209:8b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Fri, 6 Nov 2020 07:47:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 07:47:03 +0000
Received: ("Tessian outbound 9487ba6994b4:v64");
 Fri, 06 Nov 2020 07:47:03 +0000
Received: from 0bf355236ae0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CA336F12-F449-4C8E-90A7-4320CCBDB646.1; 
 Fri, 06 Nov 2020 07:46:57 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0bf355236ae0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Nov 2020 07:46:57 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM9PR08MB6036.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 07:46:55 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 07:46:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ANsg=EM=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kawSh-0006mf-3b
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 07:47:07 +0000
X-Inumbo-ID: cd79651c-5cb4-46c9-818c-ff3699dce459
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown [40.107.13.41])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cd79651c-5cb4-46c9-818c-ff3699dce459;
	Fri, 06 Nov 2020 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9v4xcUP4HSrs+2100MskJbUpJznskU9U2tS902rJJE=;
 b=eNvQNzsopzde3woeYKLbOlHD37rDrwi2OCRuMzAbvqjMLR/NAra/I9ZYEzvNKLQngVcLTlC8GG0dqBS5xuG6UN2Ie7XuRCWOqU0cZSC7R+EGr5sVDzvPvLbqE2l31cJEHmaoMvSS37C7XbZwDRKXwakqmZ2F/P3/24gKcazBpMc=
Received: from AM6P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::26)
 by AM9PR08MB5873.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 6 Nov
 2020 07:47:03 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::5c) by AM6P191CA0013.outlook.office365.com
 (2603:10a6:209:8b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Fri, 6 Nov 2020 07:47:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 07:47:03 +0000
Received: ("Tessian outbound 9487ba6994b4:v64"); Fri, 06 Nov 2020 07:47:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8400681a9905736c
X-CR-MTA-TID: 64aa7808
Received: from 0bf355236ae0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CA336F12-F449-4C8E-90A7-4320CCBDB646.1;
	Fri, 06 Nov 2020 07:46:57 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0bf355236ae0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 Nov 2020 07:46:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJzlcR/Re7C1bl+N6aXw0uxmF14r/z1zn7rTGGxxa6e3e8ERBMuqDHDPA7cESn3+hdKehtzKDh9Q2Cx6J4pfu9pPaIQsyx1wdPsuweWMDMTPK7I735sUQcTRp83f0TQMqS2RZkviBaHvPD6QXOrSbapAUjOjGDKelOMt2ew5MTK2Aud1Hh7Z7H/OXUkKxTQr2XkrmEFC8bexDRLAlLy+s14FpunePAU3hml0tGbNhvdgasdqEFzgEP0Hch91MIsAInPkYJHIF/kYucR7a7B2hs8r4KFORlZ81Z0uir6mSd5cH54nW4E0aesdKaEJJ6rjKZY7xDQHNJZPOpmIsBlb/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9v4xcUP4HSrs+2100MskJbUpJznskU9U2tS902rJJE=;
 b=Ezz8FxJZUyuNPMODd0gf9Ei9nJx8x1SgwzmUGOA44MICkTCF8145TM9GPrsD+daM+ruUD5i1z1w5br2jua7/EhXSThdbjeKFNAVynrlJNJA//f7affZXKR0m1MiYCZHHE8j+XtlAdYu/V93OgNycAs6kcr3VHzbzDamHUDBqmBqTG/2JWWbi4Nk8b9tV+CdiIGO+LxBjDUf8YUYQRXDEgecS/J2dwg+8g/VP8gLBFG15OGyiY1O4ym8tNrNIcr247pESzWFO5qB6XCpHp1iIG+rXjZGtGP/+CQPL3h9E81h6ZUBnl5+toxC2pvs/Yw1U7ETKaflHl9Lkcn8ejZIOfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9v4xcUP4HSrs+2100MskJbUpJznskU9U2tS902rJJE=;
 b=eNvQNzsopzde3woeYKLbOlHD37rDrwi2OCRuMzAbvqjMLR/NAra/I9ZYEzvNKLQngVcLTlC8GG0dqBS5xuG6UN2Ie7XuRCWOqU0cZSC7R+EGr5sVDzvPvLbqE2l31cJEHmaoMvSS37C7XbZwDRKXwakqmZ2F/P3/24gKcazBpMc=
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 by AM9PR08MB6036.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 07:46:55 +0000
Received: from AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b]) by AM0PR08MB3682.eurprd08.prod.outlook.com
 ([fe80::1c4a:d913:232b:674b%7]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 07:46:55 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: traps: Don't panic when receiving an unknown
 debug trap
Thread-Topic: [PATCH] xen/arm: traps: Don't panic when receiving an unknown
 debug trap
Thread-Index: AQHWs8NxXvjxsnR7jEOaNZeAcAn8Ham6uneA
Date: Fri, 6 Nov 2020 07:46:55 +0000
Message-ID: <221590C9-15CA-4AFE-8038-6715F84B0971@arm.com>
References: <20201105223106.22517-1-julien@xen.org>
In-Reply-To: <20201105223106.22517-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ac8bf58b-293e-49ab-d3ad-08d8822826be
x-ms-traffictypediagnostic: AM9PR08MB6036:|AM9PR08MB5873:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB5873983109570E22C1CDABFF9DED0@AM9PR08MB5873.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0sbzWDDMB/Bn652FFq4XjBrxAxt91PiTdKkCmlP5c6Mkd3acwphLpijzZRTPjkLM+R+Ia+gUT7O6BVgAsh9AMRrawJbMXMp0jAUPlC+1qUErTmGOgUqcR8UzeqOznI6pcVxwHFJzUE53MsAi/6d6ZnKndoclyYb4KdsA2OvGocJnOlNBzlutye5hdWgtydOfpM596uRhkFofo1n7S1F5UrzGTPi6cyBO6H8wPJHlyBw3hSqIn4i8HsebMzQzxPk1zIKAJU+JPKZ8lDV0doU0TgSd6zmdhWcqjXRIlSaFPUed3sVgs49RtoZvPhF9/zQqtGxAqF2mg4f6/9XCwY7sUQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3682.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(4326008)(6916009)(54906003)(316002)(33656002)(6512007)(86362001)(8676002)(2616005)(478600001)(83380400001)(26005)(91956017)(76116006)(8936002)(6506007)(66946007)(66446008)(64756008)(66556008)(53546011)(66476007)(4744005)(6486002)(71200400001)(36756003)(186003)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 WcTLzmbrhGsA/2zGI4IWa/VIF9hfx6Z0mG4kZC7TR+6chnF3lPAUIc0c2/shVvMSfSftJZwsiPu49idcBd8e6zKh4KPQ07B2fexloOLui8Lo/oqiZcwl8PPqzKNDo8erpocTmURZFFz5k/pZt6/fjGslXOWAJmWpyVuYpR1wH04Yi9P5OrqxKbtxFlL+UQdAvk2jjgqe3MRUuC7BsMGnBmWBqWsozhlj7zphq73TSexHYYTs4lBqFCeasZ+V8l1Eo3/pJAiB3GiRYmCwyZ+jeshSpQr0Q/vVbWrvJ7Prim07JNPBELlQVf8Ad22WzRkCRldFLvvRKtXTZNOJNXHbW5LqIV35rrahsehrTj4LJYVbxx/6hk7pk7EF0gP4umtpcU8JzteKzo76AXWkYhTNjb6/qlrQP1ZHHVyhRyQYp/hwnHfVYNKWM6qY8E2sHQ0lsmolbrR5irY5tDgx9QItGABELDX7Jeiu0DoY9xgESXlVC21+0OxRbsB1j27KTXA5QOf0rjaAKoHIkx7ONfPNXAxQSPFpQmwIXWuEungPdB5EIPFnMRPYNESqdI8k4S+hYTv9zapwI6PIjOZ6v55F76r4rWDRFWc78y4UlUU9L5xGApQvllIFKaZorzBBbcb9Gz8J+4E4seB9GtJUR2R8LA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1C71A6EAAB0B5F4B98811D4656280B73@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6036
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0781e035-1829-48b3-1f19-08d88228221a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	336qZS2y+aA3lMmQrQJhTPcmZgA4KoI6HfuoYJB9w3vzZw1fqBHdet2cabVkWOMdU4sw1VNn26ZMoVgSqoYts7VIl3oMD5Kf0zogd1IOcOYSk2l1FmAobBTOuty+Oq36QncbHce3klekoz7KLNXHv6Z0FFw3RWJrV60mxa2Nop2O0YeIA9J1rpvYrXB8EJJvyZcU0jLYAKhqvFZaGDfovxEw5KJhINO65WKzRCETJG75ASEFloUYkEW7jfoz1IdNQLLF7KqUHFfFnRFREXGNCHhw1kW9euTGih2vpqoCQZZb335d8JA5mJZ9C+GxgbMCYN8OUWWA2m5t7PI+lyY9R7Pdsad8BUTvLrBI7+fcy5oClBjn5BNKAHpGKn2OAvwDAHEtdIjlDxUWCFqZMsrgqg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966005)(356005)(8936002)(316002)(82310400003)(83380400001)(36906005)(336012)(186003)(6862004)(8676002)(33656002)(53546011)(26005)(6486002)(47076004)(54906003)(82740400003)(6506007)(70586007)(5660300002)(2616005)(2906002)(81166007)(107886003)(36756003)(70206006)(4326008)(478600001)(6512007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 07:47:03.2599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8bf58b-293e-49ab-d3ad-08d8822826be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5873

Hi Julien,

> On 5 Nov 2020, at 22:31, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Even if debug trap are only meant for debugging purpose, it is quite
> harsh to crash Xen if one of the trap sent by the guest is not handled.
>=20
> So switch from a panic() to a printk().

Very smart idea :-)

>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/traps.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 8f40d0e0b6b1..a36f145e6739 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1410,7 +1410,7 @@ static void do_debug_trap(struct cpu_user_regs *reg=
s, unsigned int code)
>         show_execution_state(regs);
>         break;
>     default:
> -        panic("DOM%d: Unhandled debug trap %#x\n", domid, code);
> +        printk("DOM%d: Unhandled debug trap %#x\n", domid, code);
>         break;
>     }
> }
> --=20
> 2.17.1
>=20
>=20


