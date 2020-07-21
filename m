Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61CD227C2B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 11:55:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxozG-0001Ev-Sy; Tue, 21 Jul 2020 09:55:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLXd=BA=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1jxozE-0001Eo-8O
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 09:55:00 +0000
X-Inumbo-ID: 3ae22e10-cb38-11ea-a09c-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ae22e10-cb38-11ea-a09c-12813bfff9fa;
 Tue, 21 Jul 2020 09:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeo4narOoP4gCUzDyeyuRzuZ+8SpPZLGTzSvlzCpGmo=;
 b=XdHb0lR0s7truYm3I75ShqzE0O7xSXscK820GEaZk5ZRVYtnDoCRrdb652w611R/+GKAa1rvNbMWYg5GZ79hAb5g5HTyoC/3njMqaqJAaiUXLTRioVzZDe4UAa6FvgSXdNvtVrZe0fv4ArAZX9Q8nzMB5ANaKKRBVvLn2FODrbA=
Received: from AM6P192CA0101.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::42)
 by DBBPR08MB4712.eurprd08.prod.outlook.com (2603:10a6:10:f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Tue, 21 Jul
 2020 09:54:54 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::d2) by AM6P192CA0101.outlook.office365.com
 (2603:10a6:209:8d::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Tue, 21 Jul 2020 09:54:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Tue, 21 Jul 2020 09:54:53 +0000
Received: ("Tessian outbound 73b502bf693a:v62");
 Tue, 21 Jul 2020 09:54:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 05fc36d0b3cbec33
X-CR-MTA-TID: 64aa7808
Received: from 20554f2f5632.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 18601C7B-55A2-4228-BFA9-348C7F463016.1; 
 Tue, 21 Jul 2020 09:54:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 20554f2f5632.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Jul 2020 09:54:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPraVo+dC7ih9zMWdZTwmC/xpzQ++0w7DHtVpoLWwXqFHmxQoLGpFG+Ws8gBUpUVSIVyvhz4Degtrk0w96aosY4nreMkICZVDO7pUk12Ya3CsP3ITf/oiiabuNqCkpgmfYuNKNdgm/JszhsMBXROiYFD/UU/mWVGMkBZ7MP5+NRyYspOKj64+cTyrBupUEW2r1g5opuCj7ITOaB98P/htX8So65yG/nLDQpGSmcO2I4uHkUrsB7Tcq4Dxw2nL/xfzGD1Ql3ssCsPwLfguwEsk3RB/SKS3SxPjUr8Gz9NAoQE4Uv91Heequ3BIB4w9naRNSQGq2l5HFO6YV/2xN23Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeo4narOoP4gCUzDyeyuRzuZ+8SpPZLGTzSvlzCpGmo=;
 b=WJSy+N7GDj4f753iOpYT7CherJlNN+5pH2trzSUb7AuyYPDvNIJjSR5g3lnA5hglWwt/kSAlUb/KuAvkD7Jh5cPtusHiK3aVIxGyJOcAMK6OL49zyMH+BOeTnMciwSAvJIcywjvhHyOK1wpBjtnuyK3BMyYQB+K94LMLh63RbukKFxO4LVUD640ufkXv/qpzRPC83EjS8wObqEdjACzzhmivICe4ZJiGzyUX+YOM9U2PnTFP28C/4z0X4CkqMzOlKcuvpKLAGcfeP9m8rsJA+PcLByg6Fbo2mcSyqTfq93Zx2BaLtlGGC6mz7PyJ53tEfik26AEFGHCYedFC45HCpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeo4narOoP4gCUzDyeyuRzuZ+8SpPZLGTzSvlzCpGmo=;
 b=XdHb0lR0s7truYm3I75ShqzE0O7xSXscK820GEaZk5ZRVYtnDoCRrdb652w611R/+GKAa1rvNbMWYg5GZ79hAb5g5HTyoC/3njMqaqJAaiUXLTRioVzZDe4UAa6FvgSXdNvtVrZe0fv4ArAZX9Q8nzMB5ANaKKRBVvLn2FODrbA=
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com (2603:10a6:20b:4c::19)
 by AM6PR08MB3654.eurprd08.prod.outlook.com (2603:10a6:20b:4d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Tue, 21 Jul
 2020 09:54:47 +0000
Received: from AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5]) by AM6PR08MB3560.eurprd08.prod.outlook.com
 ([fe80::e891:3b33:766:cad5%6]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 09:54:47 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAOrEgIAAVPWAgAABeYCAAAssAIAAAcuAgAAIDQCABUqtgIAAsGEA
Date: Tue, 21 Jul 2020 09:54:47 +0000
Message-ID: <DDBD069B-CB7A-4050-A726-FBB622875B9A@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
 <28899FEF-9DA7-4513-8283-1AC5EFFC6E92@arm.com>
 <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
 <F09F9354-EC9B-4D76-809B-A25AF4F7D863@arm.com>
 <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
 <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
 <alpine.DEB.2.21.2007201509350.32544@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007201509350.32544@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.38.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 57a8d093-dfb8-40b9-7a4e-08d82d5c1e0b
x-ms-traffictypediagnostic: AM6PR08MB3654:|DBBPR08MB4712:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB47120ECB03B30004BDB68F55FC780@DBBPR08MB4712.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: cn3uVMsATaEMGU3TACejRSfKUkS7fWoWPWZR2dE2AhcDufdM5tFBQZoJHOTX1GrJq5szWR1geSdBOhi91SNJJGQ8dbK81HpKin6+xFfwK+c/3+9YZabbboB28TDuCMNx3dcnjtvck8L/uZpyK/6tXghujOefPTw+G/6l0akFJrQ2gJC+COcC3c++8Gh00fno2IdoRBybcxa85pi+NkDl92KEmiMCPv5n92yBqo8LmZfXcUkVGBGiKqd0ZaBJb3K5CCmJZzAAh5ncKkY9VkDsNCxg1QMJh6ZOcB8XQxkR2a62RJz5lZLsZYOzhzrBDPCJ8Gq2PzFjsiUFQgcbDtfapw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(83380400001)(2616005)(2906002)(54906003)(5660300002)(71200400001)(86362001)(6512007)(4326008)(6486002)(8936002)(478600001)(8676002)(91956017)(76116006)(26005)(66556008)(64756008)(66446008)(66476007)(33656002)(66946007)(186003)(6506007)(36756003)(6916009)(53546011)(316002)(55236004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: VqEBbloCNLP6RPZGjzqbxNI/MPmih03XLbZfxmrFcF7eKlQaTTYiK/rWaKVQDZL2Ijq1P2Hg0DqwUVCsvD/z4D+EKiriNWfIaH13zCkXKEB1fTHjMixTQK/vvI75noQbBtx4Q4Fqntb21ZLFLZLt5P4TAmGhcOJ8Y+n8yYhx4XGRaMc7xHWn3vbfBaM45ntdYjnZHQ1p3zLrHWXW5T9nW4dbKI7OgBnAgcf7qrReA9l1WUOoy+ShJwiy8nzCICW0QndDFlAiGMBQZDhuZMgfxsEv9JWPw9tVdvmI/XPatKiij2odx3jgft4Kq63ZboWPVznS82xAdpl0sv821z5XLpGhNreu4XAprD1A9pBJsO2672dYsAGvltrJTmYpXWDvNfRrVl4yi0BJeJwqT6Z/hdZH87jWisQeR0l6Nx/QJUL7ygZySTr4y/JbPU92DckAZ9TJZVTaWx/Gm5SwwNVujXigxWlur7qD5sJ0vmGuK7E=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6BDC42D8EB17A64EBF7713A55966300F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3654
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966005)(82740400003)(8676002)(70586007)(36906005)(70206006)(6512007)(47076004)(33656002)(316002)(54906003)(2906002)(6486002)(107886003)(26005)(186003)(356005)(36756003)(2616005)(83380400001)(336012)(82310400002)(8936002)(6862004)(81166007)(478600001)(5660300002)(4326008)(6506007)(86362001)(53546011);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e57ed6e6-85c8-4c64-1c0c-08d82d5c1a3b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 67P+vSGI3EPpjBJvHJTH03MGs51SF+iSfAHQ6AhcAess9Z+obOQIn9ZKlkN8n+NXqjZX9L62MR/XeGD6j9aiua7Nh73sDxG8xCTFDLMXWs6+R7PRh5M4OmkXyaKDMgAiTx+a1eM7R4YJQ+SeffzSbdMQL5RCG+8Pe5oV2XLYL3saPtr8EUPVnCEtnVUaOG9VPRrzX1zqOoFg/wd+TQ0cYY74SpU/kkMsxNVjLbcjdnIg3sOK+821sk8xiGgtVOkOqyB+QeK63JBH7j4FZeW1DwFzYET1liqLdkWO0/TQnNz2iwUNU8rPBr0mts6iNKBOGwVCEki4wNZiFcBpkcTMT+gS2cl3NQCm80CCNl94egakOphMTnZqXgHtUNPZi3afv8d0V3F5kGd/JXUtXMukew==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 09:54:53.6165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a8d093-dfb8-40b9-7a4e-08d82d5c1e0b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4712
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
Cc: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 21 Jul 2020, at 12:23 am, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> On Fri, 17 Jul 2020, Bertrand Marquis wrote:
>>> On 17 Jul 2020, at 16:06, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 17.07.2020 15:59, Bertrand Marquis wrote:
>>>>=20
>>>>=20
>>>>> On 17 Jul 2020, at 15:19, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>=20
>>>>> On 17.07.2020 15:14, Bertrand Marquis wrote:
>>>>>>> On 17 Jul 2020, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>> On 16.07.2020 19:10, Rahul Singh wrote:
>>>>>>>> # Emulated PCI device tree node in libxl:
>>>>>>>>=20
>>>>>>>> Libxl is creating a virtual PCI device tree node in the device tre=
e to enable the guest OS to discover the virtual PCI during guest boot. We =
introduced the new config option [vpci=3D"pci_ecam"] for guests. When this =
config option is enabled in a guest configuration, a PCI device tree node w=
ill be created in the guest device tree.
>>>>>>>=20
>>>>>>> I support Stefano's suggestion for this to be an optional thing, i.=
e.
>>>>>>> there to be no need for it when there are PCI devices assigned to t=
he
>>>>>>> guest anyway. I also wonder about the pci_ prefix here - isn't
>>>>>>> vpci=3D"ecam" as unambiguous?
>>>>>>=20
>>>>>> This could be a problem as we need to know that this is required for=
 a guest upfront so that PCI devices can be assigned after using xl.> >>>=20
>>>>> I'm afraid I don't understand: When there are no PCI device that get
>>>>> handed to a guest when it gets created, but it is supposed to be able
>>>>> to have some assigned while already running, then we agree the option
>>>>> is needed (afaict). When PCI devices get handed to the guest while it
>>>>> gets constructed, where's the problem to infer this option from the
>>>>> presence of PCI devices in the guest configuration?
>>>>=20
>>>> If the user wants to use xl pci-attach to attach in runtime a device t=
o a guest, this guest must have a VPCI bus (even with no devices).
>>>> If we do not have the vpci parameter in the configuration this use cas=
e will not work anymore.
>>>=20
>>> That's what everyone looks to agree with. Yet why is the parameter need=
ed
>>> when there _are_ PCI devices anyway? That's the "optional" that Stefano
>>> was suggesting, aiui.
>>=20
>> I agree in this case the parameter could be optional and only required i=
f not PCI device is assigned directly in the guest configuration.
>=20
> Great!
>=20
> Moreover, we might also be able to get rid of the vpci parameter in
> cases where are no devices assigned at boot time but still we want to
> create a vpci host bridge in domU anyway. In those cases we could use
> the following:
>=20
>  pci =3D [];
>=20
> otherwise, worse but it might be easier to implement in xl:
>=20
>  pci =3D [""];

pci =3D[] ; is a great idea to avoid new config option to create a device t=
ree node when there is no device assigned. We will check this and will upda=
te the design spec accodringly.=20


