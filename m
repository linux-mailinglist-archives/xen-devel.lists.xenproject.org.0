Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B99265F9F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:37:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGiI3-0005lt-Kf; Fri, 11 Sep 2020 12:36:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G+bd=CU=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kGiI1-0005lo-5W
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:36:29 +0000
X-Inumbo-ID: 876d9b3d-05a3-451b-875d-fa2fe14720b1
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 876d9b3d-05a3-451b-875d-fa2fe14720b1;
 Fri, 11 Sep 2020 12:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUeoKTYDr98M/XLivlT+wMguXe6b4IRc+9EmhNoYR+A=;
 b=Iu1467c2mpwONt6IRj1kDDp+p/SC+zh7OQo3AAMgZ8iZl3Isz4/YkbqA7IT7hi6hIZ57yfbNskyO9esT3WY1kAbSf5Omw0VAF7DqrTO4oMAmK3dKboOWWCaVElEjoEMh6NNPJjOwrn9IHekY+yFTTDyt2voMNPV5bC9DufFgBm4=
Received: from AM5PR0502CA0005.eurprd05.prod.outlook.com
 (2603:10a6:203:91::15) by VI1PR08MB3807.eurprd08.prod.outlook.com
 (2603:10a6:803:bb::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 12:36:24 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::8a) by AM5PR0502CA0005.outlook.office365.com
 (2603:10a6:203:91::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Fri, 11 Sep 2020 12:36:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 12:36:24 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64");
 Fri, 11 Sep 2020 12:36:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ed4f0017d5af4dd
X-CR-MTA-TID: 64aa7808
Received: from ef1da9cb941e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4871C639-F7EF-42C2-8B70-21025D7FDDA4.1; 
 Fri, 11 Sep 2020 12:36:17 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef1da9cb941e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Sep 2020 12:36:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1lYgrXijIzIkLulma+sAN0NjaE5n1yOTw1dsWYic0dEivLO1C8J/2mX7pkgfnIZ7Q6fowLVSkllJIMFix6LhfOPCvOBXBcAL4OFGW3ZEEkvzU3QV+uWHDK9E13Kcg+HSRvwA8EkQtloa8amZb4VSPhBXF8ntlWQA1v9Sy0a4dZDUTr/b6mblaTHOwns7mDfEi5XupHmPN8lyKTTk6/nTRkT0yI/VTKCONZ7jKbO+Dw/AWzjcFrn7thxtolLH/YmEvNK7p71e7ukkyqgDSn57Qxzg12m4+o+mUUIH4FyntH1gOK6UVrNjV4i887vZC8i/OUeHmmGtgmadVVlakKv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUeoKTYDr98M/XLivlT+wMguXe6b4IRc+9EmhNoYR+A=;
 b=D2oCyxYoetnLiwqk/YW7FTxaVUBfw+qFovMni7NAbP259HPwVF5O/zEKardUU+nr3+dVMq7BI/ijTKXny5XJ8Z85CB0RpE7sD8FwHhmEXAQqqmuVbbIc1JLxurrYcjJ5nkUGtbgHW3EIkMd0QeQVSan+fGE+oSbVXmyiRfzOYXRmPHdeYXZ2khc856ITTrUWwp2CiEvHeB6TcsrneqswRR/WaQSJlfMwgF6R3fGL6LCkMuehTPOGoeTPH62CTcdTZUH9ytTdpwB0rrnw9Of86LWnB91Qa/+h2xAVM0Be5prfwqDuCQSrSW+I1FbnlLd+sQyIeu/K7a7ZwbEe3t4XYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUeoKTYDr98M/XLivlT+wMguXe6b4IRc+9EmhNoYR+A=;
 b=Iu1467c2mpwONt6IRj1kDDp+p/SC+zh7OQo3AAMgZ8iZl3Isz4/YkbqA7IT7hi6hIZ57yfbNskyO9esT3WY1kAbSf5Omw0VAF7DqrTO4oMAmK3dKboOWWCaVElEjoEMh6NNPJjOwrn9IHekY+yFTTDyt2voMNPV5bC9DufFgBm4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2870.eurprd08.prod.outlook.com (2603:10a6:6:20::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Fri, 11 Sep
 2020 12:36:16 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 12:36:16 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] Arm64: force gcc 10+ to always inline generic atomics
 helpers
Thread-Topic: [PATCH v2] Arm64: force gcc 10+ to always inline generic atomics
 helpers
Thread-Index: AQHWiCjnFExSwOkCzUa85TKo+Ex39KljX/WA
Date: Fri, 11 Sep 2020 12:36:16 +0000
Message-ID: <342D87BE-A309-46A2-9896-5D579496590C@arm.com>
References: <0ad3619d-8be9-99bc-552f-675156c47dfe@suse.com>
In-Reply-To: <0ad3619d-8be9-99bc-552f-675156c47dfe@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7897f58d-e338-433c-3318-08d8564f4b8b
x-ms-traffictypediagnostic: DB6PR08MB2870:|VI1PR08MB3807:
X-Microsoft-Antispam-PRVS: <VI1PR08MB38070B388C8CDF2E75FA32109D240@VI1PR08MB3807.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zCgeF4Gv7cirwtRkb/kbiAddyyCC/8TtM3lQxf8rJoyEdsEJLv5r7uOLOhlLS1+XxAnyBIRZJ+gnlB/RIGWxLAAbR9qaUPP9OznMuigD3EB4EZm1MTK0XEEOnVqTW6TQOttXspl2EUjp/XDqK7QXXBOVl02zzeJK2HL68qugrQxnrasE+/3XgeX+otYR3Ydi8PS7VpQaEADYuDokVFglkr8MhcjEI/7Or0dP7JF/V1L5q4JMp4Npj+CrJ8FbyWkbh6PpIdu+AVDGyZUM3gCzl47FXWuoCJz9TKkHw333YWjIVMRx48WDqa9iisF/shnXBK7P99drBCP4W8A+Tpz+NJ/vXjUNmUCeEBHPBvXa+KMaTAbSOxHgr1XH8SFFpTcJ
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(36756003)(6916009)(478600001)(33656002)(5660300002)(4326008)(71200400001)(8936002)(66446008)(66476007)(64756008)(2906002)(2616005)(86362001)(6506007)(6512007)(91956017)(316002)(76116006)(53546011)(186003)(26005)(6486002)(54906003)(66556008)(8676002)(66946007)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: xF+Kwk3bxvYsEkdwNai/FoYq2XdPKh/x3G59pe4w1Y1Je3aczCbJJhLUpIFLsR8d/cWuxOHb8bg9X8ntMZFPYl4+2DLsHBXizm48Pl0S8hviFJvXWInxKm2JWMIAmWVRtEy038aKV5HzcSdIakVLj24ihC8LR9l06CxHRo0JV+QGoTD8Z+/xl2jbzqgIUUYXj9d6PM0nFtZFra2lPhIJVMPETZqs+38tBXjZ1h9HxMWhzF5Qzc1G06IeFY3o1Lb9ZQzYmOX2DVM5enSjF3H6qxcdURLUDsr5aO1BpX1SNsMMxPWpj8MVoBLsADfD1oVc5ZI032siXcJhWjc2v+zZC4l6QGAJiayL6r+4BZeo2kbTh9kb/X+YIAyHV6DuKKF4QgJ639D7w9TfZVcVkD4l7O60gfs54Rgk9mvTpKrLSGjswNfc6XjrEXXbSe8ttew55DLz7B6Tfo1n7Bh47SpbYIbIpp6RzncvL1rUPKIYPxLyuSW9XZOz+bpX1rB+0e1bdiGUGm9VXP8yw2dMhcxoIUFFitvC7uDGj/e47U3aZFbPkt9fQ5ZOQHeNf2xXBCeNsIeFV/DI81AVWrlmMkkleWmOUaX+cYfnHEUetLK3EogGvwwvbntbifj8XzIiiz/d63SP7Hw0eYNStuXt3e+CHg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D3260195B63184489AB895E0CC6214AC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2870
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7cb919c4-3849-4c33-094d-08d8564f46ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mI5CuHJF4X4qHUJJlIxYQDkaN1iDpuxt85lmFgb1srkWm+3HlRjJoMhnkoQs1a85o3aV8811LtGR4BtI1DW4voEy+dEa0libOuW2oiX36LV6A6qSSoRnvRtrs58rlpmCsCBSAhh78Y99HDkn+KV+uak2v8hmwaNxbxt0Kv0AvGC/0l2MAOjE8nhcXiytn+5YqflAZpw4SmCX4QcyytuT+uKocAxrrRjGG/LRGO8909pxSKneM/+95VT2CEqPTXwSGVeuELHfOY+5z3Et1R5Vce8Y/xsGAlY80WAZi8r0MLJEY0OQ8cRf5gHyjbxC3hE4TjG9J7L/3fTsdahUQF96cW8aFPBzEQPWokXboIQ8p1sXzrngD4aNF455bq1MzGJq6o5Z55WRhCfXipxH6VvT8z+cxxopwGCvl+UiIZ4XbQA=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966005)(5660300002)(82740400003)(54906003)(8936002)(478600001)(47076004)(33656002)(4326008)(356005)(53546011)(6506007)(26005)(36756003)(81166007)(36906005)(186003)(316002)(82310400003)(2616005)(6862004)(107886003)(86362001)(6486002)(2906002)(8676002)(6512007)(70586007)(336012)(70206006)(41533002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 12:36:24.1624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7897f58d-e338-433c-3318-08d8564f4b8b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3807
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



> On 11 Sep 2020, at 11:45, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Recent versions of gcc (at least 10.x) will not inline generic atomics=20
> helpers by default. Instead they will expect the software to either link
> with libatomic.so or implement the helpers, which would result in
>=20
> undefined reference to `__aarch64_ldadd4_acq_rel'
>=20
> for us (not having any local implementation).
>=20
> To keep the previous behavior, force gcc to always inline the generic
> atomics helpers.
>=20
> Long term we probably want to avoid relying on gcc atomics helpers as
> this doesn't allow us to switch between LSE and LL/SC atomics.
>=20
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> v2: Title and description redone.
>=20
> --- a/xen/arch/arm/arch.mk
> +++ b/xen/arch/arm/arch.mk
> @@ -12,6 +12,7 @@ CFLAGS-$(CONFIG_ARM_32) +=3D -mcpu=3Dcortex-
>=20
> CFLAGS-$(CONFIG_ARM_64) +=3D -mcpu=3Dgeneric
> CFLAGS-$(CONFIG_ARM_64) +=3D -mgeneral-regs-only # No fp registers etc
> +$(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
>=20
> ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
>     $(error You must use 'make menuconfig' to enable/disable early printk=
 now)
>=20


