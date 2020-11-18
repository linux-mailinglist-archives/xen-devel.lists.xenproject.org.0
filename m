Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6672B8004
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 16:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29971.59675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfOz7-0000BN-0C; Wed, 18 Nov 2020 15:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29971.59675; Wed, 18 Nov 2020 15:03:00 +0000
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
	id 1kfOz6-0000Ax-TC; Wed, 18 Nov 2020 15:03:00 +0000
Received: by outflank-mailman (input) for mailman id 29971;
 Wed, 18 Nov 2020 15:03:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWLM=EY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kfOz6-0000An-0I
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:03:00 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e01cd62-5c49-4229-aca2-aa6d7fb45b49;
 Wed, 18 Nov 2020 15:02:58 +0000 (UTC)
Received: from DB6PR07CA0106.eurprd07.prod.outlook.com (2603:10a6:6:2c::20) by
 AM8PR08MB5650.eurprd08.prod.outlook.com (2603:10a6:20b:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 18 Nov
 2020 15:02:56 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::71) by DB6PR07CA0106.outlook.office365.com
 (2603:10a6:6:2c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend
 Transport; Wed, 18 Nov 2020 15:02:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 15:02:56 +0000
Received: ("Tessian outbound 13ed5f5344c0:v71");
 Wed, 18 Nov 2020 15:02:56 +0000
Received: from edfbfefa65e3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E941F589-03EF-4034-9C9C-6FAA9E33AA47.1; 
 Wed, 18 Nov 2020 15:02:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id edfbfefa65e3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Nov 2020 15:02:22 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6073.eurprd08.prod.outlook.com (2603:10a6:10:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 15:02:20 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 15:02:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=fWLM=EY=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kfOz6-0000An-0I
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:03:00 +0000
X-Inumbo-ID: 9e01cd62-5c49-4229-aca2-aa6d7fb45b49
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown [40.107.4.50])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9e01cd62-5c49-4229-aca2-aa6d7fb45b49;
	Wed, 18 Nov 2020 15:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hflZgAY4mwAQTVn16eHtaha3nLKmp0IAc9gq4XPv7Yo=;
 b=N5n3fZWXv2uOObt5vq2+da+QP3+fGXGMr1DnZX+yQHGbtdmFwMJbzF73wnVkPPPJvvffxxK99ndaZjWYalIgL3yqEXndxuiuv7esIYyGDdrzqNo+xzgotNsgw/sI3yb8wJ0kN8zur4KcRqpEkCGd0mJIXd9Ge5lphclEnlZVDCA=
Received: from DB6PR07CA0106.eurprd07.prod.outlook.com (2603:10a6:6:2c::20) by
 AM8PR08MB5650.eurprd08.prod.outlook.com (2603:10a6:20b:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 18 Nov
 2020 15:02:56 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::71) by DB6PR07CA0106.outlook.office365.com
 (2603:10a6:6:2c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend
 Transport; Wed, 18 Nov 2020 15:02:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 15:02:56 +0000
Received: ("Tessian outbound 13ed5f5344c0:v71"); Wed, 18 Nov 2020 15:02:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1f191f3cdc6f9ed6
X-CR-MTA-TID: 64aa7808
Received: from edfbfefa65e3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E941F589-03EF-4034-9C9C-6FAA9E33AA47.1;
	Wed, 18 Nov 2020 15:02:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id edfbfefa65e3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Nov 2020 15:02:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ry14ttndkwA0bGzTpqTHZ8Hs8/OYSj/Z37wX7ZcGVWIIyO/S5qZhrIj0PthpMi0HARIkNJofEjMCG6YLMXwfB2SQIL1k9WpuoQL5uWbquEPGcMBEUOZTiQFB6Ixw2Kh5Bj+MArT0808ZmZuxaEEb33bx6paNp8kpzFt9g0X0vS2XWbAEFacvM6QisXK57Gz8GALFhOS6iwMV6SKli4yh6L2rYjGjRtmRBCO9b0CMYgRCYnONbypHENopra/2xD+l6rEgIzQAeCW6H1KFQxFtk/UEHgHbdoQwfppuI01Lv64wPZHh3gxC71vY6KviIbi9l4fU8ERmJc54CNTEkbdr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hflZgAY4mwAQTVn16eHtaha3nLKmp0IAc9gq4XPv7Yo=;
 b=IxC42BiFMyPjtTpHwggCFN9qYV5AhuqI5nEccBaucxwT+qVoU3C/YV/tftZG/1TeoRql1+8fgLTQOMSM9BDLT/maC4bZiOGIxyJCaxmpsy04/Y5V9IVPiaGKzvHZ0PhAACx7hEK5xFbl2mmWj9fNvKiimfnSUI4vvWgZpib9Po2LV9ufvXtCex7MgpD5UXCfDGyOWAn+3J0HyqiiHm76yjZpM1YxP9GC1kl2AItXrvnZC1BJhiBpL3Y93HpJVgISy8tSB/kcFUyaHpQArGOI8gm96h5pc58vvHt7noe0YWjgiz01QCtlb4Wk5a4NqvtwNb7P6c7lqowLZxBubAbt0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hflZgAY4mwAQTVn16eHtaha3nLKmp0IAc9gq4XPv7Yo=;
 b=N5n3fZWXv2uOObt5vq2+da+QP3+fGXGMr1DnZX+yQHGbtdmFwMJbzF73wnVkPPPJvvffxxK99ndaZjWYalIgL3yqEXndxuiuv7esIYyGDdrzqNo+xzgotNsgw/sI3yb8wJ0kN8zur4KcRqpEkCGd0mJIXd9Ge5lphclEnlZVDCA=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6073.eurprd08.prod.outlook.com (2603:10a6:10:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 15:02:20 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 15:02:20 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
Thread-Topic: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
Thread-Index: AQHWvBOve/67EvsNk0ODGsWoVvEIcanMKDEAgAHXRoA=
Date: Wed, 18 Nov 2020 15:02:20 +0000
Message-ID: <CBBE4253-F244-418D-9EA6-BC39D1BC8DF8@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <bd5fa7bb-7c44-1ec0-fc57-3ecf01c7d651@suse.com>
In-Reply-To: <bd5fa7bb-7c44-1ec0-fc57-3ecf01c7d651@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8f0af591-8f03-4115-3d6a-08d88bd30820
x-ms-traffictypediagnostic: DBBPR08MB6073:|AM8PR08MB5650:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB565041599E1755C84C2E524AFCE10@AM8PR08MB5650.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VstU3ntHM6quieKs3t9yeLCIBJZXq0uM5LMAV8Mo1/dfyJNZ9584mDWpSVITHblqJulk5n/PYHU/J/tBbw3yLhG8If60WtWVvff9r4nElN9gin2a9aLOqEV2f39HXUm8Dn+Qpd7twQNmJgkj9ANd31T3Ziip3NmlVSW1xKaEqrm7Bw0imC5EFABu23hJj9yly5sXCtPFrnYkelKp89JdoUTimV68KtJ3t0jJAiNYvaHD4CAgWnn0uponknpO26Q9ci98Ybth0VURGmjH1TeJyjSo2ODhjyXukccNuX0ZBFym5XSLVSXbWM9G7zlrsKdi3LpHT6+9cCCWTai78yGZ9Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(2906002)(66446008)(316002)(66616009)(66556008)(5660300002)(478600001)(26005)(53546011)(6506007)(6916009)(33656002)(66946007)(76116006)(6486002)(99936003)(66476007)(186003)(71200400001)(2616005)(8676002)(64756008)(83380400001)(91956017)(54906003)(4326008)(86362001)(6512007)(8936002)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 Fq9eY0dlBYjJHWcNPE1YIbD0C5crIsMrHt0zwK2AEe8/aUQP+XaEaCpACys9WwPsY3NY1/ingeHLDGW1iWIG1dfk1DSlNSWb3z++KVWlWWZXLg139UJcc8nYcG6fhntWOoTyt4Etz9Ifh/NwAqrPsS5mv6qLcjVHXweJC4G7RFNsGGzQp31GIHYrNQy/IK60SditqqMZ65DPuQruaHJvbi3rWzmWHcDUq9fVc3uUkp8DG1891YKlmx39Ol6tC7G/93xxDVs9yjdTegpfBYJjBkaJMoKRxv6hJnan3lpnA+sJBLIonZr4+OvNm/Mc33oZTpEl48QkQybrBX5GI0ylBdq283THexnW1+WaS3Y/sOsnFCdlxqjgFPWD7oAxbi7j6rI/0zOjp0145FxxdcsPqumAE2shAd7W/OVSxs6t3RQg3suwNr6ICWddMxNA6c7U/itBeHLOrk4a4VAYTfdHe+Bv9gE7+7BsNHoWWd2GuEQbirySjBvWEftt2ne8icwMp7t5IqfoWcUlZz4mUeUGIYr1ia2P2dLr2i35h9a4r4re2xN4/pTeZhLS4F3dSBQzYonVjouGBI5i9vnAC4Jm1eM92MIdekTe7Zs4LoJF9qeXmlu6dx1uGOBYY5dgN0GAPw5qv8XEKrbBsTQvpwql9XOabWZbTuHTU9OiYyNiXYoyhhb+SmE/5qKjNDLuo0B54U9C2HkSii1HuXCIk+MXmHMs+RNt+QyXMDk36CqlNy8BznpGfEPl1cNvaRsbCQ+CqQ8cb4a1eJgxddFRZfj1SYS7xwQpaxC3RU370TMFFBGrZ7vMsSZXE+SweB9ZK/iB+AF/pLXSJwjV27Errsxn1TLVM0ryJ3oNVn7EdvyKxJYxDo57nsgeU9guNt51nBbrUIPMFNjSxi+LcLKteHQ4Xg==
Content-Type: multipart/mixed;
	boundary="_002_CBBE4253F244418D9EA6BC39D1BC8DF8armcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6073
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ab6d8a44-005c-47fa-083d-08d88bd2f2a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dbdcxFelKHf4ljwkrAZbSh8JMb6b0DyhMhreqEhEfT41wy2PnYUtUvrR1Tj1Tf7pKz7xT7OUpejsQrspozEqc1YgIIRPqFfNG9uGgP5Fwf4Z/y1X9Zff53muCxHaYoJ5pk1sdcRhh3Oe2RVd5WkVah81Uit5QPSpeM0MihE5XXmMVTzTapPqThO4/K8bdA9q+NsZDkWrKVSTN/XaBFW8cRYK5ZG3Z67Z4EzQYaqqsAdAXTUUi19mhjFRWK27IeXLIg1puYIOcsWTA+usRKrGdUR23ZEiTMyrac49aQ6+9PDVwiAuJNXryEPDC3ZyQeJ3GHvzMn8vC11UvYZz3S9Itc5z1mqnEPtDyctnZBDt9joOAUfzqxC94p4ZgKy7eVoQDvu4XHIdaM2OETJ/6gr6iA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966005)(82310400003)(36756003)(83380400001)(186003)(33656002)(8676002)(6512007)(6862004)(6506007)(235185007)(4326008)(26005)(5660300002)(45080400002)(478600001)(54906003)(53546011)(2616005)(8936002)(86362001)(2906002)(21480400003)(66616009)(70206006)(316002)(99936003)(82740400003)(47076004)(356005)(6486002)(336012)(81166007)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 15:02:56.3536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0af591-8f03-4115-3d6a-08d88bd30820
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5650

--_002_CBBE4253F244418D9EA6BC39D1BC8DF8armcom_
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A686D0754304BA40BB81A637B3456653@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hello Jan,

> On 17 Nov 2020, at 10:55 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 16.11.2020 13:25, Rahul Singh wrote:
>> NS16550 driver has PCI support that is under HAS_PCI flag. When HAS_PCI
>> is enabled for ARM, compilation error is observed for ARM architecture
>> because ARM platforms do not have full PCI support available.
>=20
> While you've extended the sentence, it remains unclear to me what
> compilation error it is that results here. I've requested such
> clarification for v2 already.

Compilation error is related to the code that refer to x86  functions (crea=
te_irq()..) and MSI implementation related error.=20
For more details please find the attached file for compilation error.

>=20
>> --- a/xen/drivers/char/Kconfig
>> +++ b/xen/drivers/char/Kconfig
>> @@ -4,6 +4,10 @@ config HAS_NS16550
>> 	help
>> 	  This selects the 16550-series UART support. For most systems, say Y.
>>=20
>> +config HAS_NS16550_PCI
>> +	def_bool y
>> +	depends on X86 && HAS_NS16550 && HAS_PCI
>=20
> Looking at this again (in particular at all the #ifdef changes in
> the actual source file), I wonder whether an approach with less
> code churn and without such an extra Kconfig setting (with, as
> said, a bogus dependency on x86) couldn't be found. For example,
> how about ...
>=20
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -16,7 +16,7 @@
>> #include <xen/timer.h>
>> #include <xen/serial.h>
>> #include <xen/iocap.h>
>> -#ifdef CONFIG_HAS_PCI
>> +#ifdef CONFIG_HAS_NS16550_PCI
>> #include <xen/pci.h>
>> #include <xen/pci_regs.h>
>> #include <xen/pci_ids.h>
>=20
> ... #undef-ining CONFIG_HAS_PCI at a suitable position in this
> file (e.g. after all #include-s, to make sure all structure
> layouts remain correct)? This would then be far easier to revert
> down the road, and would confine the oddity to a single file
> (and there a single place) in the code base.
>=20

As for ARM platforms, PCI implementation is in the development process and =
I am not sure if after completion of PCI work, ns16500 PCI part of code wil=
l work out of the box. I think there is some effort required to test the ns=
16550 PCI part of the code on ARM.
As this code is tested on X86 only so I make the options depends on X86 and=
 enable it by default for x86. =20

I feel that adding a new Kconfig options is ok to enable/disable the PCI NS=
16550 support as compared to #undef CONFIG_HAS_PCI in the particular file. =
If in future other architecture wants to implement the PCI they will face t=
he similar compilation error issues.

Please suggest how we can proceed on this.


> Jan

Regards,
Rahul

--_002_CBBE4253F244418D9EA6BC39D1BC8DF8armcom_
Content-Type: text/rtf; name="compilation error.rtf"
Content-Description: compilation error.rtf
Content-Disposition: attachment; filename="compilation error.rtf"; size=10164;
	creation-date="Wed, 18 Nov 2020 15:02:19 GMT";
	modification-date="Wed, 18 Nov 2020 15:02:19 GMT"
Content-ID: <0D62BC021FDFEC47AF113ECB3865B0DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

e1xydGYxXGFuc2lcYW5zaWNwZzEyNTJcY29jb2FydGYyNTEzDQpcY29jb2F0ZXh0c2NhbGluZzBc
Y29jb2FwbGF0Zm9ybTB7XGZvbnR0YmxcZjBcZm5pbFxmY2hhcnNldDAgTWVubG8tQm9sZDtcZjFc
Zm5pbFxmY2hhcnNldDAgTWVubG8tUmVndWxhcjt9DQp7XGNvbG9ydGJsO1xyZWQyNTVcZ3JlZW4y
NTVcYmx1ZTI1NTtccmVkMTgwXGdyZWVuMzZcYmx1ZTI1O1xyZWQwXGdyZWVuMFxibHVlMDtccmVk
NDdcZ3JlZW4xODBcYmx1ZTI5Ow0KXHJlZDQ2XGdyZWVuMTc0XGJsdWUxODc7fQ0Ke1wqXGV4cGFu
ZGVkY29sb3J0Ymw7O1xjc3NyZ2JcYzc2NDA5XGMyMTY5OFxjMTI1MjQ7XGNzZ3JheVxjMDtcY3Nz
cmdiXGMyMDIzOFxjNzM4OThcYzE0OTQ3Ow0KXGNzc3JnYlxjMjAxOTZcYzczMjQwXGM3ODI1MDt9
DQpccGFwZXJ3MTE5MDBccGFwZXJoMTY4NDBcbWFyZ2wxNDQwXG1hcmdyMTQ0MFx2aWV3dzI4NjAw
XHZpZXdoMTgwMDBcdmlld2tpbmQwDQpccGFyZFx0eDU2MFx0eDExMjBcdHgxNjgwXHR4MjI0MFx0
eDI4MDBcdHgzMzYwXHR4MzkyMFx0eDQ0ODBcdHg1MDQwXHR4NTYwMFx0eDYxNjBcdHg2NzIwXHBh
cmRpcm5hdHVyYWxccGFydGlnaHRlbmZhY3RvcjANCg0KXGYwXGJcZnMzNiBcY2YyIFxDb2NvYUxp
Z2F0dXJlMCAgXGNmMyBuczE2NTUwLmM6DQpcZjFcYjAgIEluIGZ1bmN0aW9uIFwnOTENClxmMFxi
IG5zMTY1NTBfaW5pdF9pcnENClxmMVxiMCBcJzkyOlwNClxwYXJkXHR4NTYwXHR4MTEyMFx0eDE2
ODBcdHgyMjQwXHR4MjgwMFx0eDMzNjBcdHgzOTIwXHR4NDQ4MFx0eDUwNDBcdHg1NjAwXHR4NjE2
MFx0eDY3MjBccGFyZGlybmF0dXJhbFxwYXJ0aWdodGVuZmFjdG9yMA0KDQpcZjBcYiBuczE2NTUw
LmM6NzI2OjIxOg0KXGYxXGIwICANClxmMFxiIFxjZjIgZXJyb3I6IA0KXGYxXGIwIFxjZjMgaW1w
bGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gXCc5MQ0KXGYwXGIgY3JlYXRlX2lycQ0KXGYx
XGIwIFwnOTI7IGRpZCB5b3UgbWVhbiBcJzkxDQpcZjBcYiByZWxlYXNlX2lycQ0KXGYxXGIwIFwn
OTI/IFsNClxmMFxiIFxjZjIgLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbg0K
XGYxXGIwIFxjZjMgXVwNCiAgICAgICAgIHVhcnQtPmlycSA9IA0KXGYwXGIgXGNmMiBjcmVhdGVf
aXJxDQpcZjFcYjAgXGNmMyAoMCwgZmFsc2UpO1wNCiAgICAgICAgICAgICAgICAgICAgIA0KXGYw
XGIgXGNmMiBefn5+fn5+fn5+DQpcZjFcYjAgXGNmMyBcDQogICAgICAgICAgICAgICAgICAgICBc
Y2Y0IHJlbGVhc2VfaXJxXGNmMyBcDQoNClxmMFxiIG5zMTY1NTAuYzo3MjY6MjE6DQpcZjFcYjAg
IA0KXGYwXGIgXGNmMiBlcnJvcjogDQpcZjFcYjAgXGNmMyBuZXN0ZWQgZXh0ZXJuIGRlY2xhcmF0
aW9uIG9mIFwnOTENClxmMFxiIGNyZWF0ZV9pcnENClxmMVxiMCBcJzkyIFsNClxmMFxiIFxjZjIg
LVdlcnJvcj1uZXN0ZWQtZXh0ZXJucw0KXGYxXGIwIFxjZjMgXVwNCg0KXGYwXGIgbnMxNjU1MC5j
Og0KXGYxXGIwICBJbiBmdW5jdGlvbiBcJzkxDQpcZjBcYiBuczE2NTUwX2luaXRfcG9zdGlycQ0K
XGYxXGIwIFwnOTI6XA0KDQpcZjBcYiBuczE2NTUwLmM6NzY4OjMzOg0KXGYxXGIwICANClxmMFxi
IFxjZjIgZXJyb3I6IA0KXGYxXGIwIFxjZjMgXCc5MQ0KXGYwXGIgbW1pb19yb19yYW5nZXMNClxm
MVxiMCBcJzkyIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlv
dSBtZWFuIFwnOTENClxmMFxiIG1taW9faGFuZGxlcg0KXGYxXGIwIFwnOTI/XA0KICAgICAgICAg
ICAgICByYW5nZXNldF9hZGRfcmFuZ2UoDQpcZjBcYiBcY2YyIG1taW9fcm9fcmFuZ2VzDQpcZjFc
YjAgXGNmMyAsIHVhcnQtPmlvX2Jhc2UsXA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgDQpcZjBcYiBcY2YyIF5+fn5+fn5+fn5+fn5+DQpcZjFcYjAgXGNmMyBcDQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcY2Y0IG1taW9faGFuZGxlclxjZjMgXA0KDQpcZjBcYiBu
czE2NTUwLmM6NzY4OjMzOg0KXGYxXGIwICANClxmMFxiIFxjZjUgbm90ZTogDQpcZjFcYjAgXGNm
MyBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVh
Y2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpblwNCg0KXGYwXGIgbnMxNjU1MC5jOjc4MDoyMDoNClxm
MVxiMCAgDQpcZjBcYiBcY2YyIGVycm9yOiANClxmMVxiMCBcY2YzIHZhcmlhYmxlIFwnOTENClxm
MFxiIG1zaQ0KXGYxXGIwIFwnOTIgaGFzIGluaXRpYWxpemVyIGJ1dCBpbmNvbXBsZXRlIHR5cGVc
DQogICAgICAgICAgICAgc3RydWN0IA0KXGYwXGIgXGNmMiBtc2lfaW5mbw0KXGYxXGIwIFxjZjMg
IG1zaSA9IFx7XA0KICAgICAgICAgICAgICAgICAgICANClxmMFxiIFxjZjIgXn5+fn5+fn4NClxm
MVxiMCBcY2YzIFwNCg0KXGYwXGIgbnMxNjU1MC5jOjc4MToxODoNClxmMVxiMCAgDQpcZjBcYiBc
Y2YyIGVycm9yOiANClxmMVxiMCBcY2YzIFwnOTENClxmMFxiIHN0cnVjdCBtc2lfaW5mbw0KXGYx
XGIwIFwnOTIgaGFzIG5vIG1lbWJlciBuYW1lZCBcJzkxDQpcZjBcYiBidXMNClxmMVxiMCBcJzky
XA0KICAgICAgICAgICAgICAgICAuDQpcZjBcYiBcY2YyIGJ1cw0KXGYxXGIwIFxjZjMgID0gdWFy
dC0+cHNfYmRmWzBdLFwNCiAgICAgICAgICAgICAgICAgIA0KXGYwXGIgXGNmMiBefn4NClxmMVxi
MCBcY2YzIFwNCg0KXGYwXGIgbnMxNjU1MC5jOjc4MToyNDoNClxmMVxiMCAgDQpcZjBcYiBcY2Yy
IGVycm9yOiANClxmMVxiMCBcY2YzIGV4Y2VzcyBlbGVtZW50cyBpbiBzdHJ1Y3QgaW5pdGlhbGl6
ZXIgWw0KXGYwXGIgXGNmMiAtV2Vycm9yDQpcZjFcYjAgXGNmMyBdXA0KICAgICAgICAgICAgICAg
ICAuYnVzID0gDQpcZjBcYiBcY2YyIHVhcnQNClxmMVxiMCBcY2YzIC0+cHNfYmRmWzBdLFwNCiAg
ICAgICAgICAgICAgICAgICAgICAgIA0KXGYwXGIgXGNmMiBefn5+DQpcZjFcYjAgXGNmMyBcDQoN
ClxmMFxiIG5zMTY1NTAuYzo3ODE6MjQ6DQpcZjFcYjAgIA0KXGYwXGIgXGNmNSBub3RlOiANClxm
MVxiMCBcY2YzIChuZWFyIGluaXRpYWxpemF0aW9uIGZvciBcJzkxDQpcZjBcYiBtc2kNClxmMVxi
MCBcJzkyKVwNCg0KXGYwXGIgbnMxNjU1MC5jOjc4MjoxODoNClxmMVxiMCAgDQpcZjBcYiBcY2Yy
IGVycm9yOiANClxmMVxiMCBcY2YzIFwnOTENClxmMFxiIHN0cnVjdCBtc2lfaW5mbw0KXGYxXGIw
IFwnOTIgaGFzIG5vIG1lbWJlciBuYW1lZCBcJzkxDQpcZjBcYiBkZXZmbg0KXGYxXGIwIFwnOTJc
DQogICAgICAgICAgICAgICAgIC4NClxmMFxiIFxjZjIgZGV2Zm4NClxmMVxiMCBcY2YzICA9IFBD
SV9ERVZGTih1YXJ0LT5wc19iZGZbMV0sIHVhcnQtPnBzX2JkZlsyXSksXA0KICAgICAgICAgICAg
ICAgICAgDQpcZjBcYiBcY2YyIF5+fn5+DQpcZjFcYjAgXGNmMyBcDQpJbiBmaWxlIGluY2x1ZGVk
IGZyb20gDQpcZjBcYiAvaG9tZS9yYWhzaW4wMS93b3JrL3hlbi1zY20tZ2l0LWNvZGUvZnJlc2gt
dGVzdC1jb2RlL3hlbi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaDoyNTowDQpcZjFcYjAgLFwNCiAg
ICAgICAgICAgICAgICAgZnJvbSANClxmMFxiIC9ob21lL3JhaHNpbjAxL3dvcmsveGVuLXNjbS1n
aXQtY29kZS9mcmVzaC10ZXN0LWNvZGUveGVuL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oOjEyDQpc
ZjFcYjAgLFwNCiAgICAgICAgICAgICAgICAgZnJvbSANClxmMFxiIG5zMTY1NTAuYzoxNQ0KXGYx
XGIwIDpcDQoNClxmMFxiIC9ob21lL3JhaHNpbjAxL3dvcmsveGVuLXNjbS1naXQtY29kZS9mcmVz
aC10ZXN0LWNvZGUveGVuL3hlbi9pbmNsdWRlL3hlbi9wY2kuaDozMzoyNToNClxmMVxiMCAgDQpc
ZjBcYiBcY2YyIGVycm9yOiANClxmMVxiMCBcY2YzIGV4Y2VzcyBlbGVtZW50cyBpbiBzdHJ1Y3Qg
aW5pdGlhbGl6ZXIgWw0KXGYwXGIgXGNmMiAtV2Vycm9yDQpcZjFcYjAgXGNmMyBdXA0KICNkZWZp
bmUgUENJX0RFVkZOKGQsZikgIA0KXGYwXGIgXGNmMiAoDQpcZjFcYjAgXGNmMyAoKChkKSAmIDB4
MWYpIDw8IDMpIHwgKChmKSAmIDB4MDcpKVwNCiAgICAgICAgICAgICAgICAgICAgICAgICANClxm
MFxiIFxjZjIgXg0KXGYxXGIwIFxjZjMgXA0KDQpcZjBcYiBuczE2NTUwLmM6NzgyOjI2Og0KXGYx
XGIwICANClxmMFxiIFxjZjUgbm90ZTogDQpcZjFcYjAgXGNmMyBpbiBleHBhbnNpb24gb2YgbWFj
cm8gXCc5MQ0KXGYwXGIgUENJX0RFVkZODQpcZjFcYjAgXCc5MlwNCiAgICAgICAgICAgICAgICAg
LmRldmZuID0gDQpcZjBcYiBcY2Y1IFBDSV9ERVZGTg0KXGYxXGIwIFxjZjMgKHVhcnQtPnBzX2Jk
ZlsxXSwgdWFydC0+cHNfYmRmWzJdKSxcDQogICAgICAgICAgICAgICAgICAgICAgICAgIA0KXGYw
XGIgXGNmNSBefn5+fn5+fn4NClxmMVxiMCBcY2YzIFwNCg0KXGYwXGIgL2hvbWUvcmFoc2luMDEv
d29yay94ZW4tc2NtLWdpdC1jb2RlL2ZyZXNoLXRlc3QtY29kZS94ZW4veGVuL2luY2x1ZGUveGVu
L3BjaS5oOjMzOjI1Og0KXGYxXGIwICANClxmMFxiIFxjZjUgbm90ZTogDQpcZjFcYjAgXGNmMyAo
bmVhciBpbml0aWFsaXphdGlvbiBmb3IgXCc5MQ0KXGYwXGIgbXNpDQpcZjFcYjAgXCc5MilcDQog
I2RlZmluZSBQQ0lfREVWRk4oZCxmKSAgDQpcZjBcYiBcY2Y1ICgNClxmMVxiMCBcY2YzICgoKGQp
ICYgMHgxZikgPDwgMykgfCAoKGYpICYgMHgwNykpXA0KICAgICAgICAgICAgICAgICAgICAgICAg
IA0KXGYwXGIgXGNmNSBeDQpcZjFcYjAgXGNmMyBcDQoNClxmMFxiIG5zMTY1NTAuYzo3ODI6MjY6
DQpcZjFcYjAgIA0KXGYwXGIgXGNmNSBub3RlOiANClxmMVxiMCBcY2YzIGluIGV4cGFuc2lvbiBv
ZiBtYWNybyBcJzkxDQpcZjBcYiBQQ0lfREVWRk4NClxmMVxiMCBcJzkyXA0KICAgICAgICAgICAg
ICAgICAuZGV2Zm4gPSANClxmMFxiIFxjZjUgUENJX0RFVkZODQpcZjFcYjAgXGNmMyAodWFydC0+
cHNfYmRmWzFdLCB1YXJ0LT5wc19iZGZbMl0pLFwNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
DQpcZjBcYiBcY2Y1IF5+fn5+fn5+fg0KXGYxXGIwIFxjZjMgXA0KDQpcZjBcYiBuczE2NTUwLmM6
NzgzOjE4Og0KXGYxXGIwICANClxmMFxiIFxjZjIgZXJyb3I6IA0KXGYxXGIwIFxjZjMgXCc5MQ0K
XGYwXGIgc3RydWN0IG1zaV9pbmZvDQpcZjFcYjAgXCc5MiBoYXMgbm8gbWVtYmVyIG5hbWVkIFwn
OTENClxmMFxiIGlycQ0KXGYxXGIwIFwnOTJcDQogICAgICAgICAgICAgICAgIC4NClxmMFxiIFxj
ZjIgaXJxDQpcZjFcYjAgXGNmMyAgPSByYyA9IHVhcnQtPmlycSxcDQogICAgICAgICAgICAgICAg
ICANClxmMFxiIFxjZjIgXn5+DQpcZjFcYjAgXGNmMyBcDQoNClxmMFxiIG5zMTY1NTAuYzo3ODM6
MjQ6DQpcZjFcYjAgIA0KXGYwXGIgXGNmMiBlcnJvcjogDQpcZjFcYjAgXGNmMyBleGNlc3MgZWxl
bWVudHMgaW4gc3RydWN0IGluaXRpYWxpemVyIFsNClxmMFxiIFxjZjIgLVdlcnJvcg0KXGYxXGIw
IFxjZjMgXVwNCiAgICAgICAgICAgICAgICAgLmlycSA9IA0KXGYwXGIgXGNmMiByYw0KXGYxXGIw
IFxjZjMgID0gdWFydC0+aXJxLFwNCiAgICAgICAgICAgICAgICAgICAgICAgIA0KXGYwXGIgXGNm
MiBefg0KXGYxXGIwIFxjZjMgXA0KDQpcZjBcYiBuczE2NTUwLmM6NzgzOjI0Og0KXGYxXGIwICAN
ClxmMFxiIFxjZjUgbm90ZTogDQpcZjFcYjAgXGNmMyAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig
XCc5MQ0KXGYwXGIgbXNpDQpcZjFcYjAgXCc5MilcDQoNClxmMFxiIG5zMTY1NTAuYzo3ODQ6MTg6
DQpcZjFcYjAgIA0KXGYwXGIgXGNmMiBlcnJvcjogDQpcZjFcYjAgXGNmMyBcJzkxDQpcZjBcYiBz
dHJ1Y3QgbXNpX2luZm8NClxmMVxiMCBcJzkyIGhhcyBubyBtZW1iZXIgbmFtZWQgXCc5MQ0KXGYw
XGIgZW50cnlfbnINClxmMVxiMCBcJzkyXA0KICAgICAgICAgICAgICAgICAuDQpcZjBcYiBcY2Yy
IGVudHJ5X25yDQpcZjFcYjAgXGNmMyAgPSAxXA0KICAgICAgICAgICAgICAgICAgDQpcZjBcYiBc
Y2YyIF5+fn5+fn5+DQpcZjFcYjAgXGNmMyBcDQoNClxmMFxiIG5zMTY1NTAuYzo3ODQ6Mjk6DQpc
ZjFcYjAgIA0KXGYwXGIgXGNmMiBlcnJvcjogDQpcZjFcYjAgXGNmMyBleGNlc3MgZWxlbWVudHMg
aW4gc3RydWN0IGluaXRpYWxpemVyIFsNClxmMFxiIFxjZjIgLVdlcnJvcg0KXGYxXGIwIFxjZjMg
XVwNCiAgICAgICAgICAgICAgICAgLmVudHJ5X25yID0gDQpcZjBcYiBcY2YyIDENClxmMVxiMCBc
Y2YzIFwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQpcZjBcYiBcY2YyIF4NClxmMVxi
MCBcY2YzIFwNCg0KXGYwXGIgbnMxNjU1MC5jOjc4NDoyOToNClxmMVxiMCAgDQpcZjBcYiBcY2Y1
IG5vdGU6IA0KXGYxXGIwIFxjZjMgKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9yIFwnOTENClxmMFxi
IG1zaQ0KXGYxXGIwIFwnOTIpXA0KDQpcZjBcYiBuczE2NTUwLmM6NzgwOjI5Og0KXGYxXGIwICAN
ClxmMFxiIFxjZjIgZXJyb3I6IA0KXGYxXGIwIFxjZjMgc3RvcmFnZSBzaXplIG9mIFwnOTENClxm
MFxiIG1zaQ0KXGYxXGIwIFwnOTIgaXNuXCc5MnQga25vd25cDQogICAgICAgICAgICAgc3RydWN0
IG1zaV9pbmZvIA0KXGYwXGIgXGNmMiBtc2kNClxmMVxiMCBcY2YzICA9IFx7XA0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICANClxmMFxiIFxjZjIgXn5+DQpcZjFcYjAgXGNmMyBcDQoNClxm
MFxiIG5zMTY1NTAuYzo3OTM6MjI6DQpcZjFcYjAgIA0KXGYwXGIgXGNmMiBlcnJvcjogDQpcZjFc
YjAgXGNmMyBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiBcJzkxDQpcZjBcYiBwY2lf
ZW5hYmxlX21zaQ0KXGYxXGIwIFwnOTI7IGRpZCB5b3UgbWVhbiBcJzkxDQpcZjBcYiBoYXBfZW5h
YmxlZA0KXGYxXGIwIFwnOTI/IFsNClxmMFxiIFxjZjIgLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlv
bi1kZWNsYXJhdGlvbg0KXGYxXGIwIFxjZjMgXVwNCiAgICAgICAgICAgICAgICAgcmMgPSANClxm
MFxiIFxjZjIgcGNpX2VuYWJsZV9tc2kNClxmMVxiMCBcY2YzICgmbXNpLCAmbXNpX2Rlc2MpO1wN
CiAgICAgICAgICAgICAgICAgICAgICANClxmMFxiIFxjZjIgXn5+fn5+fn5+fn5+fn4NClxmMVxi
MCBcY2YzIFwNCiAgICAgICAgICAgICAgICAgICAgICBcY2Y0IGhhcF9lbmFibGVkXGNmMyBcDQoN
ClxmMFxiIG5zMTY1NTAuYzo3OTM6MjI6DQpcZjFcYjAgIA0KXGYwXGIgXGNmMiBlcnJvcjogDQpc
ZjFcYjAgXGNmMyBuZXN0ZWQgZXh0ZXJuIGRlY2xhcmF0aW9uIG9mIFwnOTENClxmMFxiIHBjaV9l
bmFibGVfbXNpDQpcZjFcYjAgXCc5MiBbDQpcZjBcYiBcY2YyIC1XZXJyb3I9bmVzdGVkLWV4dGVy
bnMNClxmMVxiMCBcY2YzIF1cDQoNClxmMFxiIG5zMTY1NTAuYzo4MDA6MjY6DQpcZjFcYjAgIA0K
XGYwXGIgXGNmMiBlcnJvcjogDQpcZjFcYjAgXGNmMyBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBm
dW5jdGlvbiBcJzkxDQpcZjBcYiBzZXR1cF9tc2lfaXJxDQpcZjFcYjAgXCc5MjsgZGlkIHlvdSBt
ZWFuIFwnOTENClxmMFxiIHNldHVwX2lycQ0KXGYxXGIwIFwnOTI/IFsNClxmMFxiIFxjZjIgLVdl
cnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbg0KXGYxXGIwIFxjZjMgXVwNCiAgICAg
ICAgICAgICAgICAgICAgIHJjID0gDQpcZjBcYiBcY2YyIHNldHVwX21zaV9pcnENClxmMVxiMCBc
Y2YzIChkZXNjLCBtc2lfZGVzYyk7XA0KICAgICAgICAgICAgICAgICAgICAgICAgICANClxmMFxi
IFxjZjIgXn5+fn5+fn5+fn5+fg0KXGYxXGIwIFxjZjMgXA0KICAgICAgICAgICAgICAgICAgICAg
ICAgICBcY2Y0IHNldHVwX2lycVxjZjMgXA0KDQpcZjBcYiBuczE2NTUwLmM6ODAwOjI2Og0KXGYx
XGIwICANClxmMFxiIFxjZjIgZXJyb3I6IA0KXGYxXGIwIFxjZjMgbmVzdGVkIGV4dGVybiBkZWNs
YXJhdGlvbiBvZiBcJzkxDQpcZjBcYiBzZXR1cF9tc2lfaXJxDQpcZjFcYjAgXCc5MiBbDQpcZjBc
YiBcY2YyIC1XZXJyb3I9bmVzdGVkLWV4dGVybnMNClxmMVxiMCBcY2YzIF1cDQoNClxmMFxiIG5z
MTY1NTAuYzo4MDM6MjU6DQpcZjFcYjAgIA0KXGYwXGIgXGNmMiBlcnJvcjogDQpcZjFcYjAgXGNm
MyBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiBcJzkxDQpcZjBcYiBwY2lfZGlzYWJs
ZV9tc2kNClxmMVxiMCBcJzkyOyBkaWQgeW91IG1lYW4gXCc5MQ0KXGYwXGIgZ2ljX2Rpc2FibGVf
Y3B1DQpcZjFcYjAgXCc5Mj8gWw0KXGYwXGIgXGNmMiAtV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9u
LWRlY2xhcmF0aW9uDQpcZjFcYjAgXGNmMyBdXA0KICAgICAgICAgICAgICAgICAgICAgICAgIA0K
XGYwXGIgXGNmMiBwY2lfZGlzYWJsZV9tc2kNClxmMVxiMCBcY2YzIChtc2lfZGVzYyk7XA0KICAg
ICAgICAgICAgICAgICAgICAgICAgIA0KXGYwXGIgXGNmMiBefn5+fn5+fn5+fn5+fn4NClxmMVxi
MCBcY2YzIFwNCiAgICAgICAgICAgICAgICAgICAgICAgICBcY2Y0IGdpY19kaXNhYmxlX2NwdVxj
ZjMgXA0KDQpcZjBcYiBuczE2NTUwLmM6ODAzOjI1Og0KXGYxXGIwICANClxmMFxiIFxjZjIgZXJy
b3I6IA0KXGYxXGIwIFxjZjMgbmVzdGVkIGV4dGVybiBkZWNsYXJhdGlvbiBvZiBcJzkxDQpcZjBc
YiBwY2lfZGlzYWJsZV9tc2kNClxmMVxiMCBcJzkyIFsNClxmMFxiIFxjZjIgLVdlcnJvcj1uZXN0
ZWQtZXh0ZXJucw0KXGYxXGIwIFxjZjMgXVwNCg0KXGYwXGIgbnMxNjU1MC5jOjgxMjoyNToNClxm
MVxiMCAgDQpcZjBcYiBcY2YyIGVycm9yOiANClxmMVxiMCBcY2YzIGltcGxpY2l0IGRlY2xhcmF0
aW9uIG9mIGZ1bmN0aW9uIFwnOTENClxmMFxiIG1zaV9mcmVlX2lycQ0KXGYxXGIwIFwnOTI7IGRp
ZCB5b3UgbWVhbiBcJzkxDQpcZjBcYiB2Z2ljX2ZyZWVfdmlycQ0KXGYxXGIwIFwnOTI/IFsNClxm
MFxiIFxjZjIgLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbg0KXGYxXGIwIFxj
ZjMgXVwNCiAgICAgICAgICAgICAgICAgICAgICAgICANClxmMFxiIFxjZjIgbXNpX2ZyZWVfaXJx
DQpcZjFcYjAgXGNmMyAobXNpX2Rlc2MpO1wNCiAgICAgICAgICAgICAgICAgICAgICAgICANClxm
MFxiIFxjZjIgXn5+fn5+fn5+fn5+DQpcZjFcYjAgXGNmMyBcDQogICAgICAgICAgICAgICAgICAg
ICAgICAgXGNmNCB2Z2ljX2ZyZWVfdmlycVxjZjMgXA0KDQpcZjBcYiBuczE2NTUwLmM6ODEyOjI1
Og0KXGYxXGIwICANClxmMFxiIFxjZjIgZXJyb3I6IA0KXGYxXGIwIFxjZjMgbmVzdGVkIGV4dGVy
biBkZWNsYXJhdGlvbiBvZiBcJzkxDQpcZjBcYiBtc2lfZnJlZV9pcnENClxmMVxiMCBcJzkyIFsN
ClxmMFxiIFxjZjIgLVdlcnJvcj1uZXN0ZWQtZXh0ZXJucw0KXGYxXGIwIFxjZjMgXVwNCg0KXGYw
XGIgbnMxNjU1MC5jOjgxNDoyNToNClxmMVxiMCAgDQpcZjBcYiBcY2YyIGVycm9yOiANClxmMVxi
MCBcY2YzIGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIFwnOTENClxmMFxiIGRlc3Ry
b3lfaXJxDQpcZjFcYjAgXCc5MjsgZGlkIHlvdSBtZWFuIFwnOTENClxmMFxiIHNldHVwX2lycQ0K
XGYxXGIwIFwnOTI/IFsNClxmMFxiIFxjZjIgLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNs
YXJhdGlvbg0KXGYxXGIwIFxjZjMgXVwNCiAgICAgICAgICAgICAgICAgICAgICAgICANClxmMFxi
IFxjZjIgZGVzdHJveV9pcnENClxmMVxiMCBcY2YzIChtc2kuaXJxKTtcDQogICAgICAgICAgICAg
ICAgICAgICAgICAgDQpcZjBcYiBcY2YyIF5+fn5+fn5+fn5+DQpcZjFcYjAgXGNmMyBcDQogICAg
ICAgICAgICAgICAgICAgICAgICAgXGNmNCBzZXR1cF9pcnFcY2YzIFwNCg0KXGYwXGIgbnMxNjU1
MC5jOjgxNDoyNToNClxmMVxiMCAgDQpcZjBcYiBcY2YyIGVycm9yOiANClxmMVxiMCBcY2YzIG5l
c3RlZCBleHRlcm4gZGVjbGFyYXRpb24gb2YgXCc5MQ0KXGYwXGIgZGVzdHJveV9pcnENClxmMVxi
MCBcJzkyIFsNClxmMFxiIFxjZjIgLVdlcnJvcj1uZXN0ZWQtZXh0ZXJucw0KXGYxXGIwIFxjZjMg
XVwNCg0KXGYwXGIgbnMxNjU1MC5jOjc4MDoyOToNClxmMVxiMCAgDQpcZjBcYiBcY2YyIGVycm9y
OiANClxmMVxiMCBcY2YzIHVudXNlZCB2YXJpYWJsZSBcJzkxDQpcZjBcYiBtc2kNClxmMVxiMCBc
JzkyIFsNClxmMFxiIFxjZjIgLVdlcnJvcj11bnVzZWQtdmFyaWFibGUNClxmMVxiMCBcY2YzIF1c
DQogICAgICAgICAgICAgc3RydWN0IG1zaV9pbmZvIA0KXGYwXGIgXGNmMiBtc2kNClxmMVxiMCBc
Y2YzICA9IFx7XA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICANClxmMFxiIFxjZjIgXn5+
DQpcZjFcYjAgXGNmMyBcDQp9

--_002_CBBE4253F244418D9EA6BC39D1BC8DF8armcom_--

