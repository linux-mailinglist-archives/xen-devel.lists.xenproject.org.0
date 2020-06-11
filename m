Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 697C11F6C6C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 18:52:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjQQ1-0002pM-QX; Thu, 11 Jun 2020 16:51:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muN5=7Y=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jjQQ0-0002pH-LG
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 16:51:08 +0000
X-Inumbo-ID: be5cf595-ac03-11ea-b54b-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.51]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be5cf595-ac03-11ea-b54b-12813bfff9fa;
 Thu, 11 Jun 2020 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=az1n7mvnDXCinM24Yx3x0/8T7adMMETwnUXKvJX82MM=;
 b=iOf5o/CiSnL7g3dnWCd6ekxDKeOBJZQ9w26eKfOp6BfZi8+5Zfy6KvfcHmoKsSYVjK9yw70LkWKPkIYycSAAtf3YE0o4h5f9msECout8caQoEeWp4ikBXBvPy/8NDGGzPTjE5//QlsQn1Jp7sohVR/n4oU7iecAsvZbdM+gla0Q=
Received: from AM6P195CA0041.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::18)
 by AM5PR0801MB1714.eurprd08.prod.outlook.com (2603:10a6:203:3a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 16:51:04 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::e) by AM6P195CA0041.outlook.office365.com
 (2603:10a6:209:87::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Thu, 11 Jun 2020 16:51:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 16:51:04 +0000
Received: ("Tessian outbound 39cdd740f5cb:v59");
 Thu, 11 Jun 2020 16:51:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2122cdd2f3920ca3
X-CR-MTA-TID: 64aa7808
Received: from b07708474948.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 07BE943F-F829-4F1B-9E94-39857731CCEC.1; 
 Thu, 11 Jun 2020 16:50:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b07708474948.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Jun 2020 16:50:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oe5eY4DO9y7hqa7SkkVX2M4mC0qYQ+LbeL9XphH9Rly3Rha2rc3Z2POP8Rz2/Ei1sT1xpber5y/PAI8g+p574NavEen46iYLZDW3fejcFgOThokOVGmZjiybSbahmxoBrDWP3SyXrq86CVkzt80UHwbZ23XNRIDsP53ZOE3EDfplznGhTs+0fesd9CeommKyR2U5BxDZ9SkkpZYRMMsYfu1a0LXH5nPGFGR0I1OEbQa7D8D+v4yNPeLCWdxdUuVYmLYtNRobMjnal5NQhSfl46ZrhSajaBOzzmZkMumGQSd2f4TxJ0MokcJ9yFQD6hljsd1l7+Gr5Qx1uFYcMfXd/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=az1n7mvnDXCinM24Yx3x0/8T7adMMETwnUXKvJX82MM=;
 b=fCzLYMyPpo7xKX0Aawca+N15ywBiIKeYsrQtghCY7FDw0buPKfmRdiwbMv4bT+xyXzWLyIE9P8yv8uMg/O884b2aH5hYfvMQQY+hA0Sv9QrrU+zmPeMhfXZJ/ff8EhaoDBISFMPvgS/+GqWpICIsB3Hv3q3qg62kV8SadgkSWUeydTD5UXVGUqYlOZY4WcPQ18ecFXY07eumCErHKgnMJHP8K209S3jeuCTADCSFHhiY/zmEWVQ3TUH9qfaFsfTicRvjsjETobPcEo+cms3gN2S575Mg8ZWYpwtH+Xpn0pRj56CAp7nNm2nop7pDu37vASLoR/CoEDSmVKnKj68MdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=az1n7mvnDXCinM24Yx3x0/8T7adMMETwnUXKvJX82MM=;
 b=iOf5o/CiSnL7g3dnWCd6ekxDKeOBJZQ9w26eKfOp6BfZi8+5Zfy6KvfcHmoKsSYVjK9yw70LkWKPkIYycSAAtf3YE0o4h5f9msECout8caQoEeWp4ikBXBvPy/8NDGGzPTjE5//QlsQn1Jp7sohVR/n4oU7iecAsvZbdM+gla0Q=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB4586.eurprd08.prod.outlook.com (2603:10a6:10:34::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 11 Jun
 2020 16:50:56 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 16:50:56 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/boot: use BASEDIR for include path
Thread-Topic: [PATCH] x86/boot: use BASEDIR for include path
Thread-Index: AQHWP+cTsx4T9bxcEUCqkorIalLVuajTmc4AgAAHVoA=
Date: Thu, 11 Jun 2020 16:50:56 +0000
Message-ID: <7DA75B75-725F-40CC-9DDE-5727452309A0@arm.com>
References: <c945e231995ac708bf7b7e3d6ec82e08d4a42bf6.1591806680.git.bertrand.marquis@arm.com>
 <5cf46b52-6a57-3e11-67a0-28f841865c1e@citrix.com>
In-Reply-To: <5cf46b52-6a57-3e11-67a0-28f841865c1e@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c4cb0ff4-783a-49ae-c692-08d80e27a134
x-ms-traffictypediagnostic: DB7PR08MB4586:|AM5PR0801MB1714:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1714A191959E71DFC3C7B3899D800@AM5PR0801MB1714.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: OJXV2un/kFD3RMyOo9H7WaIk68IrLSKnllvcPQCPBQgUgHDOAp0v3Gz0UNz0q1nYVS9nH85rjLsOjxK2ao/1D0/2tL9Zmys4GOErm0SUXESZ/wpyAtWCmlFRTEVb7SEQpqbyFrnT8+3gZ5l+k9b5a+t2w2H+2L8f6YpO+9xXa48gBbRbmyT+BkgomsW08HZSc1DMBzz+gfeacLKbVpCSPYPgqjpxXQe1LrJnbUt5BU68J3nWjC+VJM/TTqvtMqg4XLvfyLxHFd71Do4dNRgJNNGOIGkzJAPAjXpmPoW5kr4784DGuSzcD8M2Pj8X2WQxv0HFBLmmTs2lYvIzYn74fA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(54906003)(6506007)(6916009)(86362001)(66446008)(66946007)(76116006)(66476007)(2616005)(26005)(186003)(91956017)(66556008)(71200400001)(53546011)(64756008)(33656002)(478600001)(8936002)(6512007)(4326008)(83380400001)(316002)(36756003)(2906002)(6486002)(8676002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: I5feY7RpKFu6GQ+Lv3cmjqjpbtWKmTkljlDNJVptSYZvNlaJ0ejOAhZfsYf7uCVosduFKRQrzC9luLAJdKFknfe3pLs+ZLJAAE7mdDpkkJJx+2A6GjhiTd8QZjxCau/wxHCkkYnQf3sJ2QUK9eKoiBvYvOY81NCMqs8ieesKMtyyIM0Bxd26Ccb4Et+tUJs3X9Kfh328/oJU6OLEzK9w9STjRioxt691LoP773xrZTWeZ6BPq+iO0wdNV38bU/3pneQumqddV36mUosHE3qxvLPfGqkm2/YIOadiO2UZGylVtWbAwoelKecJ/GrJRytKdpYMU+Th574556MIscmguXSBdeyqkV2Yl215lkJV6zg9eB9F/caGwrzwE60SZz04TfcmVlT+gOEvwqJGjMhdxf1Ibptz76vFjBI8P4c1O+5vq687hSkjsguH/188k1LD3Tf87IxjEutw3ucoKGxmSKmZ1Tyo7wF1y0G55YV/iI66IF2ELMwol6ss+rLSl8Nt
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B6AFFFD043A5E940A728DAE378ED9BA7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4586
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966005)(356005)(2616005)(86362001)(82310400002)(81166007)(6512007)(83380400001)(8936002)(4326008)(336012)(6486002)(26005)(478600001)(33656002)(82740400003)(186003)(36906005)(36756003)(107886003)(316002)(70586007)(70206006)(8676002)(47076004)(6862004)(6506007)(53546011)(2906002)(5660300002)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6496b91c-467d-4a72-79a7-08d80e279cad
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3X115Ox7aUTem2j9kZJKUVRBGtUI0VzdXtAR0X3V39kPpmQO1OsoBz06cPWDxNLCbIBcpODFUr0VDPrzEWwlpE9JFiVwJfX0dM1vBvho06IvsREBcg2ABN30D9sze5PdN66QfHSmfWe8oor7sBpmF8ucGREKl3qzMdA9JGosmWn9Jvt9EspQZYMRpRrWaKIcvZ4kYLloFjU1L31HBHgKRiuBH3HyoV4b/1jhEcJdnb28chp1teyTeHhXl9RMuS1i9fPJ/Rz4M8WNNBIDgsL04kPJYn8FP96gvGz8UMG8BwrKv5TanOsJuYMBK1mUBwwtb785OJRLdHYFEJZDHQiIlf5uVgZXux+lq6zJrAoCtcCzavLPRy0kcizXZkvyZQEoJwSi7XX1RrjtocVkuMgSyA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 16:51:04.2919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4cb0ff4-783a-49ae-c692-08d80e27a134
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1714
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Andrew,

> On 11 Jun 2020, at 17:24, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> On 11/06/2020 12:54, Bertrand Marquis wrote:
>> Use $(BASEDIR)/include instead of $(XEN_ROOT)/xen/include for the
>> include path to be coherent with the rest of the Makefiles.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Does something subtle break before this change?

Without changing anything no.
But if xen sub-directory is renamed yes.

As there is no easy way to build xen hypervisor out of tree (I might be wro=
ng here !) I found a solution using cp -rs from xen subdir in a xen-build1 =
xen-build2 etc this way I can check build for x86 and arm without cleaning.

Without the patch, the sources are actually compiles with an include path c=
ontaining xen/../xen as a result of using XEN_ROOT which does not allow to =
rename xen subdirectory.
As it was the only place in which XEN_ROOT was used for include paths, this=
 is normalising the paths.

Bertrand

>=20
> ~Andrew
>=20
>> ---
>> xen/arch/x86/boot/build32.mk | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/xen/arch/x86/boot/build32.mk b/xen/arch/x86/boot/build32.mk
>> index 5851ebff5f..8cd5403926 100644
>> --- a/xen/arch/x86/boot/build32.mk
>> +++ b/xen/arch/x86/boot/build32.mk
>> @@ -5,7 +5,7 @@ include $(XEN_ROOT)/Config.mk
>> $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>=20
>> CFLAGS +=3D -Werror -fno-builtin -g0 -msoft-float
>> -CFLAGS +=3D -I$(XEN_ROOT)/xen/include
>> +CFLAGS +=3D -I$(BASEDIR)/include
>> CFLAGS :=3D $(filter-out -flto,$(CFLAGS))=20
>>=20
>> # NB. awk invocation is a portable alternative to 'head -n -1'
>=20


