Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257C029D097
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 16:14:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13664.34417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXn9b-0004Zk-39; Wed, 28 Oct 2020 15:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13664.34417; Wed, 28 Oct 2020 15:14:23 +0000
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
	id 1kXn9a-0004ZK-Vl; Wed, 28 Oct 2020 15:14:22 +0000
Received: by outflank-mailman (input) for mailman id 13664;
 Wed, 28 Oct 2020 15:14:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zZT=ED=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kXn9Y-0004ZE-KV
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:14:20 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.70]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75a59c8f-594e-4bc2-924b-1234a60bcaad;
 Wed, 28 Oct 2020 15:14:18 +0000 (UTC)
Received: from AM5PR0601CA0030.eurprd06.prod.outlook.com
 (2603:10a6:203:68::16) by VI1PR08MB4320.eurprd08.prod.outlook.com
 (2603:10a6:803:100::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 28 Oct
 2020 15:14:16 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::14) by AM5PR0601CA0030.outlook.office365.com
 (2603:10a6:203:68::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Wed, 28 Oct 2020 15:14:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 15:14:16 +0000
Received: ("Tessian outbound ba2270a55485:v64");
 Wed, 28 Oct 2020 15:14:16 +0000
Received: from f5d719fceabe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 80E4BB33-84B8-45E2-AC2D-F88B89FA43EB.1; 
 Wed, 28 Oct 2020 15:13:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5d719fceabe.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Oct 2020 15:13:47 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM9PR08MB6178.eurprd08.prod.outlook.com (2603:10a6:20b:2db::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:13:46 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:13:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7zZT=ED=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kXn9Y-0004ZE-KV
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:14:20 +0000
X-Inumbo-ID: 75a59c8f-594e-4bc2-924b-1234a60bcaad
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown [40.107.4.70])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 75a59c8f-594e-4bc2-924b-1234a60bcaad;
	Wed, 28 Oct 2020 15:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JN7GV8+obqNoRFpwaosnR0yQ0WMiGYzgwL+NGN0JVCE=;
 b=jfpQFrlTsd6eQU1C1UH6N+vIwnx9b/KeQGav6BNmxMt9YtKA40b/aWlxBeSUchReWvNIiJdMwnNO9YU4+6RDmg/3bYD7FLZ8EQrXbqqiXPKXgb+C0Z6g5MdQ1S5hDj+dU2cOlnKltsjGSciVsSpePgUi+7RtBm9WLa0bRyLCNxY=
Received: from AM5PR0601CA0030.eurprd06.prod.outlook.com
 (2603:10a6:203:68::16) by VI1PR08MB4320.eurprd08.prod.outlook.com
 (2603:10a6:803:100::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 28 Oct
 2020 15:14:16 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::14) by AM5PR0601CA0030.outlook.office365.com
 (2603:10a6:203:68::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Wed, 28 Oct 2020 15:14:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 15:14:16 +0000
Received: ("Tessian outbound ba2270a55485:v64"); Wed, 28 Oct 2020 15:14:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95b49ef55c60175e
X-CR-MTA-TID: 64aa7808
Received: from f5d719fceabe.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 80E4BB33-84B8-45E2-AC2D-F88B89FA43EB.1;
	Wed, 28 Oct 2020 15:13:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5d719fceabe.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Oct 2020 15:13:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMS5/WWg6swfl0pzkmRA4F6qBFIDiopfBZEDXM0bkKg7aNLqJcd+oD5KalFIl9lqCidXJzXXnHJdYGfQ89FGyr0zQsBJ+QLPYkqCGztixp/cXZBy3o/Jmmcl42XykEDy74Ku93YD5Q/F0hZHwMsK3jdHEB4pP6MoQwL3Qs003gFdTDb8vcU6tC+RJ3hJVI+tNsZLsss+AQurm1K20McB5jDj8zTT+SKXyXPF8usH2fHKniq0Y5AsRyoy7Kh99s6GABhQO0ADi4qpdFc25DdEpSb6HX8h/mbBJncEGrJ9DIv3tPdmjcxpVeTr8WCxEEC7/OHRLTiH1xM37mq/s0YGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JN7GV8+obqNoRFpwaosnR0yQ0WMiGYzgwL+NGN0JVCE=;
 b=YC2leGcRVcGeBL20RN29xRaqHCXSASgqUzWbPvhRT1fc7QEXNPSz07VYMmhdi+eR1INtW96SExvREg5Do7yuxWDSSiG4vuELLiclC37B+v6Du4rWRWoOKhc+0ijl7ASbFjoz0yEYyXOZcfcnC42B0bNLxk8kKHgp4r2GAuxjoeOI1ZXf44lHc7+en3+lmC8OaTvveRd3l244Gn7hpXDKyeck48635xc21Vv9lRbFiVnGFpjB9MqD6GlZOFxN6uI0M87IHm5J3Fp960Srhzl92jFnfWIw5NeYsDOvNUcR5fWSUIjYy5Lf12wrZCnjnIMBs1Yw839YoUCk+S/ip/4y8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JN7GV8+obqNoRFpwaosnR0yQ0WMiGYzgwL+NGN0JVCE=;
 b=jfpQFrlTsd6eQU1C1UH6N+vIwnx9b/KeQGav6BNmxMt9YtKA40b/aWlxBeSUchReWvNIiJdMwnNO9YU4+6RDmg/3bYD7FLZ8EQrXbqqiXPKXgb+C0Z6g5MdQ1S5hDj+dU2cOlnKltsjGSciVsSpePgUi+7RtBm9WLa0bRyLCNxY=
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com (2603:10a6:208:e4::28)
 by AM9PR08MB6178.eurprd08.prod.outlook.com (2603:10a6:20b:2db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:13:46 +0000
Received: from AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5]) by AM0PR08MB3490.eurprd08.prod.outlook.com
 ([fe80::49fa:5525:9ab4:edd5%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:13:46 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 4/4] xen/pci: solve compilation error when memory
 paging is not enabled.
Thread-Topic: [PATCH v1 4/4] xen/pci: solve compilation error when memory
 paging is not enabled.
Thread-Index: AQHWq7wn1E1TPrUt3EyifJVqFrVmIams60gAgAA3GIA=
Date: Wed, 28 Oct 2020 15:13:46 +0000
Message-ID: <14328157-D9C5-428E-BD1C-F4A841359185@arm.com>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <dc85bb73ca4b6ab8b4a2370f2db7700445fbc5f8.1603731279.git.rahul.singh@arm.com>
 <b345b0d4-8045-1d5d-b3c9-498311cfb1ac@suse.com>
In-Reply-To: <b345b0d4-8045-1d5d-b3c9-498311cfb1ac@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c1b9d8c-ecf3-46b7-3236-08d87b5422d2
x-ms-traffictypediagnostic: AM9PR08MB6178:|VI1PR08MB4320:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4320847F2546320F0224DC68FC170@VI1PR08MB4320.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HD5EYNo6TvH4kZXLrQjIsF3lcpr3wi3Fkqp+I7HRvjZqzaXdrhb/T5piSHKlxXBnFlHaT0knS1BuHi89dtk04A7cnVs8dJgWbaDv7bqP/YlSBU9dvYOq9/9udioerP1llY+83Z6vUzTAyj6O9z6WLS71R/6mLbGk6VdNrCYR+dCOnPIFmK1DAAUrESWBXiijJSAoJwjluuyAk8pqUWUKOHiUVp3CNudF5UzaWRSoNRIjKnL4zgzDTIhk06DFIy5Xx41r3fykaNnnatZI/m0Gkb+Pq7Ds1WE9TFLKTHWX4yPgYdKkF8xpchMVLcyfe0iONX7P5Wopo+xZVdu37CzGRQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3490.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(71200400001)(36756003)(4326008)(2616005)(86362001)(26005)(6486002)(316002)(6512007)(54906003)(186003)(478600001)(55236004)(33656002)(53546011)(66556008)(8676002)(6506007)(8936002)(66446008)(66476007)(5660300002)(6916009)(2906002)(64756008)(91956017)(66946007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 a8rMqPLB/XS3R7j6HiT9LNRvYNKtTheEiNo/38s1klGErGeZIU2CxDvpdCeDAFku8kqskSGvQJ+LDO5HW/3T7JymK4blFfYWOQX+Ylq7EMsvPn2A/T+/YnSOt6rummaaQ1e+xI9KrZSRDn+xt6zv7/A5bgDKwWddq7mcOfNsd+yP+knM12UdJ7lXwsXNJMYoZ9+qDUB7bmqjo3MpWZLxzNvmFncnyeBBd9ybptuwPMxROoryhozcF6Ur/a0nK1mrgxfKQp8SEo3hrNKPpgbY0v094eT8qMI57K9yY0zRCNr4b+NGBdY7DjyX2hqlESMoEwBObYQYR+46+7rzkRsJ21yqmE0UvNiivjEQ+9UTpFwF0aS3KHYDeVlCIXJA58Wb2eBqe4WIrz3yBHQt4hS7iRPZlvxqX/GpqlrEfBqDv1LI+Q8JTcidKFXYCcAxhTy37/1MAXU7y0WBcnqSPzbGH4cQ+vLP3goqmSF9O3PkZvtxttMVN7PFpDiH6MEGrbHWNfBHJ+IDsV+8MDVWFfnRGB8Ar2E2RpsHn4nS4DnBCQ2wh/EBgJA72NCditn4W+iCGlJpI+RrEXdGGgn1hR4wR7t/0fnlWD0oY8WC7W2inMwJ5NP/txthPYvWg68UQIyCGMjjU7ySvSbhGXpmuZrpNg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <32115F39AB08614CB9FE1176B0C912C2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6178
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	235d86f0-6542-48f4-e050-08d87b541111
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/j9fAzUN5rzbjo1CqNpFqj566ed8kyCEArZ9XxT7kSBdyGQRszhiRJVAs+Ut4m0Mitgntjc95T50GZUJdhuapfeH+DB716hzEwROxAbR8N9VcPQYYQpivzPEQIBIsrytpMlq3bgNr6RijdlGJnG8IXRVy7IpL+g3ks0iEBTuh8Ye8uLmMkEEgNdAbfDlPxNp7NSgmKK8KkeXCipWC7hKl029RpvwOJ1MNISZ7J+/aAb8ndeA2JiAxENijKawgmwxEpHsoP/jkdVZWUfbiKKPioWhKe5JhECPhCM4phwgDfkJR63BkZTJjVxklekVdQ4SkJ2dKQTD2RZTVXK3A9kBkFZnAoYSVCCMW/m6x1X02PwGKtlUg0RVpbGYsue+ZJlJ0pEBk5jiGtZbSYeg5J51gw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(46966005)(53546011)(36756003)(356005)(2906002)(478600001)(47076004)(81166007)(55236004)(86362001)(5660300002)(82740400003)(54906003)(6506007)(33656002)(8676002)(70206006)(26005)(36906005)(82310400003)(186003)(6486002)(2616005)(336012)(8936002)(6512007)(316002)(6862004)(70586007)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:14:16.4075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1b9d8c-ecf3-46b7-3236-08d87b5422d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4320

Hello Jan,

> On 28 Oct 2020, at 11:56 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 26.10.2020 18:17, Rahul Singh wrote:
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -1419,13 +1419,15 @@ static int assign_device(struct domain *d, u16 s=
eg, u8 bus, u8 devfn, u32 flag)
>>     if ( !is_iommu_enabled(d) )
>>         return 0;
>>=20
>> -    /* Prevent device assign if mem paging or mem sharing have been=20
>> +#if defined(CONFIG_HAS_MEM_PAGING) || defined(CONFIG_MEM_SHARING)
>> +    /* Prevent device assign if mem paging or mem sharing have been
>>      * enabled for this domain */
>>     if ( d !=3D dom_io &&
>>          unlikely(mem_sharing_enabled(d) ||
>>                   vm_event_check_ring(d->vm_event_paging) ||
>>                   p2m_get_hostp2m(d)->global_logdirty) )
>>         return -EXDEV;
>> +#endif
>=20
> Besides this also disabling mem-sharing and log-dirty related
> logic, I don't think the change is correct: Each item being
> checked needs individually disabling depending on its associated
> CONFIG_*. For this, perhaps you want to introduce something
> like mem_paging_enabled(d), to avoid the need for #ifdef here?
>=20

Ok I will fix that in next version.=20

> Jan

Regards,
Rahul


