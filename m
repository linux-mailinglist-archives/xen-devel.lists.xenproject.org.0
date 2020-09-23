Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386D7275930
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 15:56:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL5Fk-0003Y8-Nc; Wed, 23 Sep 2020 13:56:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6iF=DA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kL5Fj-0003Y2-1d
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 13:56:11 +0000
X-Inumbo-ID: cc9c33c9-4a13-402e-b2b1-a362e184093f
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.51]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc9c33c9-4a13-402e-b2b1-a362e184093f;
 Wed, 23 Sep 2020 13:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNYDT1+qeBDDlQ+N9TC1PonMZsKJg42hfY+QkigqyA4=;
 b=AI7Qr/AJhq/EiecffMtAgrHic3z1UPovfxXIkRl/PD7e8qPU5cYFeD2WiIEBiLcQMpKl6VNgBx0/FE/1pl6hiw89gkuriqelb0KzmTzvIUG00JtNtDGOdYRBljyMqPszIGHq1WN+XuUgc+AbPS7no5mUvPwNB2TqF9iy0Aa9zMo=
Received: from AM6PR08CA0026.eurprd08.prod.outlook.com (2603:10a6:20b:c0::14)
 by AM0PR08MB3156.eurprd08.prod.outlook.com (2603:10a6:208:64::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 23 Sep
 2020 13:56:06 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::c5) by AM6PR08CA0026.outlook.office365.com
 (2603:10a6:20b:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Wed, 23 Sep 2020 13:56:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Wed, 23 Sep 2020 13:56:06 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Wed, 23 Sep 2020 13:56:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 61b0b35db05267fc
X-CR-MTA-TID: 64aa7808
Received: from 819583ae1b73.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 76FCDA58-31E7-4485-A392-0E51E7D67BC0.1; 
 Wed, 23 Sep 2020 13:55:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 819583ae1b73.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Sep 2020 13:55:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E00Lv3yX/fMSqwjqiQEyvbGccmLE3MatyVJZ51o6714+ZXlBeRA+j7Uxc04uwZnJB09JYwtsWGdKSTJFR/vHXkLfiP59hCW+ElhQps2nGeJwbjNLDhDg+Hs80s9zXWJXhiw6mGIg3njUIyUN3FKc4ifVGhU1f5J41QPnBi/xO7jFifUmaXdjTXn9ApHxg4VWiPZCgtsRAnD1KdDToXozxsECPum3Y4LjuiK7Nlk4QNrzdYwC1iOFfU1qAtsm1FDHbr7W92Z/30D0lhCMGH74Aa0rbXueWG5X0ZlTy6LgbvtQ+ed+4g46wyo2o6u9iWFZuYU7JWdcQyjBIdMFdnmlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNYDT1+qeBDDlQ+N9TC1PonMZsKJg42hfY+QkigqyA4=;
 b=DH7TDrCsXFV16W5CW26i8aff6eYdtITXnXmNhRQ8xP0DANG3ZhwqeNm+ZshyBtANGrAIgODba0Dt8SjsW6Hk1UOHE4RIDNTn/BcTdcZx1Dq49Lvk//hD2d2kiCPHlAkLmhRIiRg8YmIZo0RdcnclfO09uYpYpS/ZfBezTuuBBffJMdmJ6BYg0T5nmNidiCnWyVg7+rEiIIqSsKPkagv+9epH9mzKPjHPJvBxSTv3yKWs8PatTtJwTRIM27wOzbwVZ8Bvpa4QNc9ta7HBeXZZqlgWieA3vsHVjQ/h+F90v/Lih1EeB7EvFKQCpteZfKuz9x0rVp6QIXFeFgdND0cjQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNYDT1+qeBDDlQ+N9TC1PonMZsKJg42hfY+QkigqyA4=;
 b=AI7Qr/AJhq/EiecffMtAgrHic3z1UPovfxXIkRl/PD7e8qPU5cYFeD2WiIEBiLcQMpKl6VNgBx0/FE/1pl6hiw89gkuriqelb0KzmTzvIUG00JtNtDGOdYRBljyMqPszIGHq1WN+XuUgc+AbPS7no5mUvPwNB2TqF9iy0Aa9zMo=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3162.eurprd08.prod.outlook.com (2603:10a6:5:23::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Wed, 23 Sep
 2020 13:55:27 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cccc:2933:d4d3:1a9e%6]) with mapi id 15.20.3412.020; Wed, 23 Sep 2020
 13:55:27 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH] SUPPORT.MD: Clarify the support state for the Arm
 SMMUv{1, 2} drivers
Thread-Topic: [PATCH] SUPPORT.MD: Clarify the support state for the Arm
 SMMUv{1, 2} drivers
Thread-Index: AQHWkYOU18uuLvRXIEaUzkgFl/gQ5Kl2C72AgAAHeICAACwkAA==
Date: Wed, 23 Sep 2020 13:55:26 +0000
Message-ID: <C14129BD-09F3-4297-BBD6-9F3C5AA82FA7@arm.com>
References: <20200923082832.20038-1-julien@xen.org>
 <1D6392F2-F4EC-4025-A793-22EABF85AA0E@arm.com>
 <3c64f36f-6b43-6f73-e344-70b084f1f505@xen.org>
In-Reply-To: <3c64f36f-6b43-6f73-e344-70b084f1f505@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 697d63fb-d619-4de1-aa94-08d85fc86ab0
x-ms-traffictypediagnostic: DB7PR08MB3162:|AM0PR08MB3156:
X-Microsoft-Antispam-PRVS: <AM0PR08MB315627FA1F77A993E54341CC9D380@AM0PR08MB3156.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +K8lV83tPR9P304L+AxWpi5mrks8n7bwOc7UG3g/Aidr48LHkikT0YD9CwtJJWc2+6MGCis8CdQEftdHWazfjC9SMaFXc68a2KC/5NysoEmUOPZOh0KDM21hLR27dRZ/fjvUA/BqIT7Ll47rYArEeh4Xk96UPGNP6ewXJCDW3AGOB+EsNPUy9BZfI+Cq6j0Y70SE39OCM7SaNs+yGpIK6lIYMSBy/290ZTalSrbMhsu+MUr9pEGOXHv9PUiQgeoHCVT3/72p7koacP3LI7wK8zTu0S/eBi6k978bU5QhUdhUGM7z5NzsmSSeJkYOALGC2JSkDbAbQirjQie2wwnZpicMRxhB2Vhu1JsEMrFjISkwfW+x5C0X9jihU22d/0Pf
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(6486002)(8936002)(91956017)(186003)(4326008)(53546011)(26005)(6506007)(54906003)(36756003)(2616005)(66946007)(66476007)(6512007)(66556008)(64756008)(316002)(5660300002)(6916009)(8676002)(2906002)(86362001)(66446008)(478600001)(76116006)(33656002)(71200400001)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: OHyvd20Yt9XXqyxDFf5qsQxmgpC5nXwrqfqjDzoYmzFgQ17PJNVCTSIRINq90QJ+Eg0z/60ma0684kWMC2ss1+kDTbcPMdT7gJReG+fZS8mZbXbqYtR1cUBn/od9d6cGSDnvgXeZbgPNPBC9WVHFoa9N4QpG4exPRogYL54fXzx1r3fGzKCblp7xLzXN5NTWCACT1I4HQAP/BJMKJGhOdgyvNwxMTPyzv9j0qwtmJUxqKh3EJWkLxbY8WfpvQjurlbHRBTL9lJYV4nBW++IkYTQHBwGa0IaRPJxdfhkk1FyaoXY7iySJBazGYf/4F550gnhEjm8SYWE2gKHP5H0/QdyDqiazbBI/61LVueCEelzoYNl+rQsKSC8lFZeruM6x89OMqVy3oi8ugNXeZJh8eP7Am9CgoKSzeMel1HEsFxjPUF9HcdyOufnbRkbqgz+ZV+1cYtAmb4q3z2o7y8JkpiWsTv3EkCDLPdqZBlJXfKs1PUpT9ewy/oeztDvMPY4CCP94UBt+3se780McyCTu5MnpSbgIIMM5o+V4gsbRJ2tcgSzl9nXOomRxBHxGZp1v5S7EZpO3nwtr95CnTPDoP4+me0lrUwPy5FcyEaKRKg0whOChJukJMd37DxjlW8s+XrqDbe17lZg089iY1CvJXw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3700A42A1AD5E842BB00CDCD06685B4F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3162
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4772972d-dcbf-49fd-e536-08d85fc85368
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u2HSdJzG06po/soCrrRLqzBCqc29cYyDMsWLsDhEFQQaQLQiZWRNGRDQ4an0RQAw8f4QeL+Xsg2aoORxISY8zoBAGnKQWl4x0jpjRBnY0b1nS0iBZv5j/SpPXNmsnFH9ZuPVaXwScJSWrH2ENHKnOsodFXiDYlYyL4jxUsR3J3hkwyy7b7iDD08meH1xupwL3hcVjklb5LQbKAvLJqwl/BIyC29CfhRlBF58tJqvOuK/MO81aLN9vtWwUs9ib2QYl38LpLLE+c5gqRgaWJnb90haDB98v/YvfD4P0ZRC5/KP1pBgKntnrv5C3eT+RqnRiiIUvUTF9VSuxmClXTupllzYMa/6cYOcTs/mpFQ3NrdMsLaa0vls4ORG8FF3KFEGD5QNk3ZQ+YLAIVDo0OfPsQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966005)(82310400003)(53546011)(8936002)(4326008)(36906005)(316002)(6862004)(2616005)(6506007)(8676002)(54906003)(83380400001)(82740400003)(47076004)(81166007)(86362001)(6512007)(356005)(478600001)(186003)(2906002)(70586007)(36756003)(336012)(5660300002)(26005)(33656002)(70206006)(6486002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 13:56:06.0376 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 697d63fb-d619-4de1-aa94-08d85fc86ab0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3156
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



> On 23 Sep 2020, at 12:17, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 23/09/2020 11:50, Bertrand Marquis wrote:
>> Hi,
>>> On 23 Sep 2020, at 09:28, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> From: Julien Grall <jgrall@amazon.com>
>>>=20
>>> SMMUv{1, 2} are both marked as security supported, so we would
>>> technically have to issue an XSA for any IOMMU security bug.
>>>=20
>>> However, at the moment, device passthrough is not security supported
>>> on Arm and there is no plan to change that in the next few months.
>>>=20
>>> Therefore, mark Arm SMMUv{1, 2} as supported but not security supported=
.
>>>=20
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Thanks!
>=20
>> We will publish in the next week a first implementation of SMMUv3 suppor=
t which might make sense to have fully Supported.
>=20
> I am not sure whether you include security supported in your "fully suppo=
rted"

If we something is missing we will be happy to fix it to reach this goal.

>=20
> However, I would consider to follow the same model as we did with the IPM=
MU. The driver would first be marked as a technical preview to allow more t=
esting in the community.

I was not meaning to have this at the very beginning.
More that it make more sense in general to have SMMUv3 with 2 level of page=
 table supporting this then old SMMU versions.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


