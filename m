Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BCA2C2216
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 10:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35645.67288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khUyb-0003u7-Mp; Tue, 24 Nov 2020 09:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35645.67288; Tue, 24 Nov 2020 09:51:09 +0000
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
	id 1khUyb-0003ti-Iy; Tue, 24 Nov 2020 09:51:09 +0000
Received: by outflank-mailman (input) for mailman id 35645;
 Tue, 24 Nov 2020 09:51:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lBCh=E6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1khUya-0003tY-2Y
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 09:51:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b4334fb-e58e-4aea-be68-ab876c462f93;
 Tue, 24 Nov 2020 09:51:06 +0000 (UTC)
Received: from AM5PR0601CA0081.eurprd06.prod.outlook.com (2603:10a6:206::46)
 by VI1PR08MB3967.eurprd08.prod.outlook.com (2603:10a6:803:df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 09:51:04 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::31) by AM5PR0601CA0081.outlook.office365.com
 (2603:10a6:206::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 09:51:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 09:51:03 +0000
Received: ("Tessian outbound 39167997cde8:v71");
 Tue, 24 Nov 2020 09:51:02 +0000
Received: from 8599586636a8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81FA1A10-8465-4940-B127-D87B4CE47541.1; 
 Tue, 24 Nov 2020 09:50:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8599586636a8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Nov 2020 09:50:56 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2375.eurprd08.prod.outlook.com (2603:10a6:4:87::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 24 Nov
 2020 09:50:55 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 09:50:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lBCh=E6=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1khUya-0003tY-2Y
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 09:51:08 +0000
X-Inumbo-ID: 0b4334fb-e58e-4aea-be68-ab876c462f93
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [40.107.6.47])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0b4334fb-e58e-4aea-be68-ab876c462f93;
	Tue, 24 Nov 2020 09:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZFaB2/bXfxcggfsHvRMUSk/hZxdtuFFLn0thbD2pBk=;
 b=vvLKxIK0iNUCHBTdD4fWBxRz6XISTLFeW5obdDIBySQSbETaS2/jvbP5RxujV5QdcDe33T+bEEsb9QpkzC7v4vyLP1daZiksdhqDr8iXWLezJRW6Ec45RuCa2UdM0K1BSLEl9qWW+rzH3oCufayyr7FjT12j4GpmoMuqTGWgTQc=
Received: from AM5PR0601CA0081.eurprd06.prod.outlook.com (2603:10a6:206::46)
 by VI1PR08MB3967.eurprd08.prod.outlook.com (2603:10a6:803:df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 09:51:04 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::31) by AM5PR0601CA0081.outlook.office365.com
 (2603:10a6:206::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 09:51:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 09:51:03 +0000
Received: ("Tessian outbound 39167997cde8:v71"); Tue, 24 Nov 2020 09:51:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 935a50edbdcfc374
X-CR-MTA-TID: 64aa7808
Received: from 8599586636a8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 81FA1A10-8465-4940-B127-D87B4CE47541.1;
	Tue, 24 Nov 2020 09:50:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8599586636a8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 09:50:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYHx4qkIBnYHL76NY0JpGVqi0juEQ1kmsHyWcYZeuJG234fbe+dqZmaITRs9eKtOJIY8fBTxirBQgkX/+c3BvPL0GiDKMKwczJqPAXNn+DAOELarTR/pqBwEqzWC/6CHljLj/1N3sYrUXhgwvD9hRJ99TisGtM1JOVfi0aKhAWmcL4pMQ2vKgAeZz8DbcLQP1wfRjuQrnEhMP2o0+v8tr5k4uDpbs4oUE91nTyfTnPF9nNdujuIly2lJmWNeuRQT7eZ7vZIrJc5mHjDvFmLHGOSY+BaJRf3Q70LbVTFAzxRDtO0AB3c1VSfWC40PlwH2ZmFwEOKy/0kruSzV0lcxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZFaB2/bXfxcggfsHvRMUSk/hZxdtuFFLn0thbD2pBk=;
 b=nkL6l/5nnNzqo6nbGJu4lBlwXbadKWXCLDNpe2Bo2fGfDX0bQy4puQbFKMOraiqbMZ+r+OCT4xobfr1J6cDCkWywsQ5uVCyEk9yN4r9yRIAnM1XSc5DFxop9ZnwoyztT9wlTmFgT3uRaskC2oHYzInxUKNGwe+ALoZcwl1pzyQuIJ5l5YMAgnox9HLw92LAlzlpYrphPuQ6CCSyF/pi+2dECIpdhvWNPCjgiqlL6vObDDgEAomnxixrStwe67NDQMVTpfx0GkkJzat6oW7fDJ3qMfxsLsM4jEq13JgDmgYaqQTzRDcGTwYSdalv8ZDj7X7xIjVioSmRpt/NKVOhspA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZFaB2/bXfxcggfsHvRMUSk/hZxdtuFFLn0thbD2pBk=;
 b=vvLKxIK0iNUCHBTdD4fWBxRz6XISTLFeW5obdDIBySQSbETaS2/jvbP5RxujV5QdcDe33T+bEEsb9QpkzC7v4vyLP1daZiksdhqDr8iXWLezJRW6Ec45RuCa2UdM0K1BSLEl9qWW+rzH3oCufayyr7FjT12j4GpmoMuqTGWgTQc=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2375.eurprd08.prod.outlook.com (2603:10a6:4:87::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 24 Nov
 2020 09:50:55 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 09:50:55 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] ns16550: "com<N>=" command line options are
 x86-specific
Thread-Topic: [PATCH v2 2/3] ns16550: "com<N>=" command line options are
 x86-specific
Thread-Index: AQHWwZqpPJPxxO+xfkyOkLGUgNSyN6nWaXmAgACh7IA=
Date: Tue, 24 Nov 2020 09:50:55 +0000
Message-ID: <1709861D-749B-4FAE-8948-28F6C6904DBB@arm.com>
References: <96115b2b-c104-e566-2368-6a2439d2c988@suse.com>
 <bfa07fc2-9151-402f-3b73-dedf8280cb66@suse.com>
 <alpine.DEB.2.21.2011231608120.7979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2011231608120.7979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8aad7919-352c-43d7-b47a-08d8905e751a
x-ms-traffictypediagnostic: DB6PR0802MB2375:|VI1PR08MB3967:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB39675C70F26B812B7F949D12FCFB0@VI1PR08MB3967.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LMSKoj8hqN1ED7h3zTj0VaR+VuczigffeZKHIcUyelUEQ2Hdd7+K9abCQPB8Yajc6MobAox8lwUDyczcNUPkFCGH36ieZinSPNYBqYYtgw8Xr7iT0WkD7rQIA762hq6QTiyHst1w49WgEG0YTp+1zxabS43X7gAD1oGQ2WUxdpPcMpzBKUJ+uVPibhrhU8VNaVdWPl75uaaYvw0IqaYP5CjtBlH4fHSjQHKiE4HuyAwqLi838a6IXSn1ADpf7HrCGGdbdWGBrbT0Cf2Gozd+pqIvsHeFTnvrRA325qThKJVO3LtD+ZGcEf5QRrasscBqte0RSHVfK+RIW6eXlWpW4A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(71200400001)(83380400001)(4326008)(26005)(33656002)(6506007)(53546011)(186003)(6486002)(36756003)(5660300002)(2906002)(8676002)(6916009)(6512007)(8936002)(76116006)(2616005)(66446008)(66476007)(54906003)(316002)(86362001)(91956017)(66556008)(66946007)(478600001)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?gyF4I/Iji2ej5HnqcgCoFOdpQEwUDupj8KGBEYrXHgogqZZVufwGWImvS61D?=
 =?us-ascii?Q?gytFMSNJCtxpsKxdnCcHifVeT8VQvB7vibB4EmfGMvckhdLWf4YJgH3jmpFA?=
 =?us-ascii?Q?rc5yD/3Gr3sXftPSYlbbMjLC0qf96raPHaeDBj0bB7Fj1i4zZHl3BZagLSbg?=
 =?us-ascii?Q?HjLs2KFzgm4Wym8U/owDKKC0bd+oFjZfD3zgdwGMUr4PbA5VNRB/lmtV7eZp?=
 =?us-ascii?Q?Y+jKdgy1ivWFMncql2SNIrxv8b/ecSatp2XjsIF8CppCXKMZCoegAAHIqyai?=
 =?us-ascii?Q?7RQ5XX8u+HQ3L5sE91CvNbPM1W4NNdKpEmIO4ftpB6+jJ6ZAasXyqTR4+4Go?=
 =?us-ascii?Q?i6xze5FO8Eb8nt437I3B3DBm6BD56982fde8+DLhVVLVcIC8tXgrtaJGY3aT?=
 =?us-ascii?Q?VWjVdxHGW76mnlsPnk/Ewcp6Did9/kBNJjtQCSEP/jIv814LcdFwuohM6gUv?=
 =?us-ascii?Q?ghYltoZYxdUeWAwo6go0QTGZgQu7eFzuYUBRAuerRZqYhwADM2CF1/qLR0AV?=
 =?us-ascii?Q?/aE7e6Ig0FIdRmPJNrxkxl34XIJBSCjvtOEvxcl6XaE4O4vdFOLpLmUY9dAM?=
 =?us-ascii?Q?FEA/63FOg0zQZIMg5nMQwv73Nek01dL7MK+enYry2bgCvxrqvzzde+oY2chP?=
 =?us-ascii?Q?vEVJ6C9UX+qKDJ5M7BzomkK5ezg3KQTD2/AiLIh9lC2lpRS2Ez8bXT1O32b9?=
 =?us-ascii?Q?OsYa4sj+JBq9mqALAr9Hh/aU7c9Airx2CVv5YeYORt7PuN5NxlUsGDzaGoEj?=
 =?us-ascii?Q?OtwaXh226u6qn0AmT6G457CywcHkzqDCPWBPN7chNOXnB8WSoRxTdfr61/9X?=
 =?us-ascii?Q?ZrEmsPsbcMl2JD2VIzppIz6y0DN4noqmHyf1p2xVrzY8oUHx5CTE94uNyQh6?=
 =?us-ascii?Q?RXlBKIvmyaK5GIGZb7YuZ1aj5swKBkGUBfGpHJV9RYIocY/qVwWAog83+Sly?=
 =?us-ascii?Q?7aS1Bky8VRF3YAsqICseAD/RZPwZQQ8PdstS0i4QeIkdDd9of5jS8eg/PebB?=
 =?us-ascii?Q?MRuI?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8D8478678CCDA14FBB65E9FC69B5ADE5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2375
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4e1486b2-2be3-4879-a4fc-08d8905e7042
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ImoTfeLaQXykiIaA4cdRwfy86qsVOEHrQDJcSEWWyO/dQE0k41shxKGsPDOzBluPSZVZcN08DjV9kS10LAyKokBpvw9T7uN1eic9J7KZCQwWsz5Te1kDVoY+STpX0272zLYu7q8qYTI82KWaMyLIHVuue/xHRw0BBLlTyoJUAValkNq3L713aLrYwkPpP/R5Cs/aopUL+i9qmINIrAIOQIvTxey1LDB59LQ78uT8toSg128bmKAXpSo7Hz4Mb1ANWVHfUGwWxWkfeP2LLUPa6n8cF5Z0w5KWCzOl2Bv2dnt4TG6Zde/7JZXpfJBtLbYuKIo9SG1AmEV+4EUnLg7f7xJL3C8+xb21SqERGV00PfsoGE9CBz1j5wkMohdgT+AT/XKFRH8WWRAdf5UEE0X5lg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966005)(82310400003)(70206006)(83380400001)(186003)(70586007)(47076004)(82740400003)(356005)(54906003)(4326008)(316002)(81166007)(6862004)(36906005)(2906002)(33656002)(36756003)(86362001)(53546011)(6506007)(336012)(8676002)(6512007)(478600001)(8936002)(6486002)(26005)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 09:51:03.8305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aad7919-352c-43d7-b47a-08d8905e751a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3967

Hello Jan,

> On 24 Nov 2020, at 12:11 am, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> On Mon, 23 Nov 2020, Jan Beulich wrote:
>> Pure code motion (plus the addition of "#ifdef CONFIG_X86); no
>> functional change intended.
>>=20
>> Reported-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Great cleanup
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
>=20
>=20
>> ---
>> v2: Re-base over new earlier patch.
>>=20
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -318,8 +318,8 @@ Interrupts.  Specifying zero disables CM
>> Flag to indicate whether to probe for a CMOS Real Time Clock irrespectiv=
e of
>> ACPI indicating none to be there.
>>=20
>> -### com1
>> -### com2
>> +### com1 (x86)
>> +### com2 (x86)
>>> `=3D <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<p=
ort-bdf>][,[<bridge-bdf>]]]]]]`
>>=20
>> Both option `com1` and `com2` follow the same format.
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -31,38 +31,6 @@
>> #include <asm/fixmap.h>
>> #endif
>>=20
>> -/*
>> - * Configure serial port with a string:
>> - *   <baud>[/<base_baud>][,DPS[,<io-base>[,<irq>[,<port-bdf>[,<bridge-b=
df>]]]]].
>> - * The tail of the string can be omitted if platform defaults are suffi=
cient.
>> - * If the baud rate is pre-configured, perhaps by a bootloader, then 'a=
uto'
>> - * can be specified in place of a numeric baud rate. Polled mode is spe=
cified
>> - * by requesting irq 0.
>> - */
>> -static char __initdata opt_com1[128] =3D "";
>> -static char __initdata opt_com2[128] =3D "";
>> -string_param("com1", opt_com1);
>> -string_param("com2", opt_com2);
>> -
>> -enum serial_param_type {
>> -    baud,
>> -    clock_hz,
>> -    data_bits,
>> -    io_base,
>> -    irq,
>> -    parity,
>> -    reg_shift,
>> -    reg_width,
>> -    stop_bits,
>> -#ifdef CONFIG_HAS_PCI
>> -    bridge_bdf,
>> -    device,
>> -    port_bdf,
>> -#endif
>> -    /* List all parameters before this line. */
>> -    num_serial_params
>> -};
>> -
>> static struct ns16550 {
>>     int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
>>     u64 io_base;   /* I/O port or memory-mapped I/O address. */
>> @@ -98,32 +66,6 @@ static struct ns16550 {
>> #endif
>> } ns16550_com[2] =3D { { 0 } };
>>=20
>> -struct serial_param_var {
>> -    char name[12];
>> -    enum serial_param_type type;
>> -};
>> -
>> -/*
>> - * Enum struct keeping a table of all accepted parameter names for pars=
ing
>> - * com_console_options for serial port com1 and com2.
>> - */
>> -static const struct serial_param_var __initconst sp_vars[] =3D {
>> -    {"baud", baud},
>> -    {"clock-hz", clock_hz},
>> -    {"data-bits", data_bits},
>> -    {"io-base", io_base},
>> -    {"irq", irq},
>> -    {"parity", parity},
>> -    {"reg-shift", reg_shift},
>> -    {"reg-width", reg_width},
>> -    {"stop-bits", stop_bits},
>> -#ifdef CONFIG_HAS_PCI
>> -    {"bridge", bridge_bdf},
>> -    {"dev", device},
>> -    {"port", port_bdf},
>> -#endif
>> -};
>> -
>> #ifdef CONFIG_HAS_PCI
>> struct ns16550_config {
>>     u16 vendor_id;
>> @@ -674,6 +616,19 @@ static struct uart_driver __read_mostly
>> #endif
>> };
>>=20
>> +static void ns16550_init_common(struct ns16550 *uart)
>> +{
>> +    uart->clock_hz  =3D UART_CLOCK_HZ;
>> +
>> +    /* Default is no transmit FIFO. */
>> +    uart->fifo_size =3D 1;
>> +
>> +    /* Default lsr_mask =3D UART_LSR_THRE */
>> +    uart->lsr_mask  =3D UART_LSR_THRE;
>> +}
>> +
>> +#ifdef CONFIG_X86
>> +
>> static int __init parse_parity_char(int c)
>> {
>>     switch ( c )
>> @@ -1217,6 +1172,64 @@ pci_uart_config(struct ns16550 *uart, bo
>> #endif /* CONFIG_HAS_PCI */
>>=20
>> /*
>> + * Configure serial port with a string:
>> + *   <baud>[/<base_baud>][,DPS[,<io-base>[,<irq>[,<port-bdf>[,<bridge-b=
df>]]]]].
>> + * The tail of the string can be omitted if platform defaults are suffi=
cient.
>> + * If the baud rate is pre-configured, perhaps by a bootloader, then 'a=
uto'
>> + * can be specified in place of a numeric baud rate. Polled mode is spe=
cified
>> + * by requesting irq 0.
>> + */
>> +static char __initdata opt_com1[128] =3D "";
>> +static char __initdata opt_com2[128] =3D "";
>> +string_param("com1", opt_com1);
>> +string_param("com2", opt_com2);
>> +
>> +enum serial_param_type {
>> +    baud,
>> +    clock_hz,
>> +    data_bits,
>> +    io_base,
>> +    irq,
>> +    parity,
>> +    reg_shift,
>> +    reg_width,
>> +    stop_bits,
>> +#ifdef CONFIG_HAS_PCI
>> +    bridge_bdf,
>> +    device,
>> +    port_bdf,
>> +#endif
>> +    /* List all parameters before this line. */
>> +    num_serial_params
>> +};
>> +
>> +struct serial_param_var {
>> +    char name[12];
>> +    enum serial_param_type type;
>> +};
>> +
>> +/*
>> + * Enum struct keeping a table of all accepted parameter names for pars=
ing
>> + * com_console_options for serial port com1 and com2.
>> + */
>> +static const struct serial_param_var __initconst sp_vars[] =3D {
>> +    {"baud", baud},
>> +    {"clock-hz", clock_hz},
>> +    {"data-bits", data_bits},
>> +    {"io-base", io_base},
>> +    {"irq", irq},
>> +    {"parity", parity},
>> +    {"reg-shift", reg_shift},
>> +    {"reg-width", reg_width},
>> +    {"stop-bits", stop_bits},
>> +#ifdef CONFIG_HAS_PCI
>> +    {"bridge", bridge_bdf},
>> +    {"dev", device},
>> +    {"port", port_bdf},
>> +#endif
>> +};
>> +
>> +/*
>>  * Used to parse name value pairs and return which value it is along wit=
h
>>  * pointer for the extracted value.
>>  */
>> @@ -1504,17 +1517,6 @@ static void __init ns16550_parse_port_co
>>     serial_register_uart(uart - ns16550_com, &ns16550_driver, uart);
>> }
>>=20
>> -static void ns16550_init_common(struct ns16550 *uart)
>> -{
>> -    uart->clock_hz  =3D UART_CLOCK_HZ;
>> -
>> -    /* Default is no transmit FIFO. */
>> -    uart->fifo_size =3D 1;
>> -
>> -    /* Default lsr_mask =3D UART_LSR_THRE */
>> -    uart->lsr_mask  =3D UART_LSR_THRE;
>> -}
>> -
>> void __init ns16550_init(int index, struct ns16550_defaults *defaults)
>> {
>>     struct ns16550 *uart;
>> @@ -1541,6 +1543,8 @@ void __init ns16550_init(int index, stru
>>     ns16550_parse_port_config(uart, (index =3D=3D 0) ? opt_com1 : opt_co=
m2);
>> }
>>=20
>> +#endif /* CONFIG_X86 */
>> +
>> #ifdef CONFIG_HAS_DEVICE_TREE
>> static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
>>                                        const void *data)
>>=20
>=20


