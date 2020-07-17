Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F69223E1B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 16:35:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwRS7-00085Q-A0; Fri, 17 Jul 2020 14:35:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdYj=A4=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jwRS6-00085K-Lp
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 14:35:06 +0000
X-Inumbo-ID: b4a4332a-c83a-11ea-961c-12813bfff9fa
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4a4332a-c83a-11ea-961c-12813bfff9fa;
 Fri, 17 Jul 2020 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBDTnrluCCrEQf6lD+PDWOCUyfKdG5W2XqttRnnF118=;
 b=Q/IXRFAy3+IKzJmB72xHFK1W16zDo0tv7Z+c55V+Ye2oQtDySOwqdZPhwW7tryM5Ac9bdMhgeyUwpcN8bamt7x2qz0/amwMPKIM21t51kfQhxAEJ4jOWECTKe3GslBWITTnfPLBo3m0rIHK3mJGmFWzpUCfc7vJbpuf4DJpjrD8=
Received: from AM5PR0701CA0063.eurprd07.prod.outlook.com (2603:10a6:203:2::25)
 by VE1PR08MB5261.eurprd08.prod.outlook.com (2603:10a6:803:10d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Fri, 17 Jul
 2020 14:35:03 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::1c) by AM5PR0701CA0063.outlook.office365.com
 (2603:10a6:203:2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.14 via Frontend
 Transport; Fri, 17 Jul 2020 14:35:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 14:35:03 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62");
 Fri, 17 Jul 2020 14:35:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a978b50238f9ab2
X-CR-MTA-TID: 64aa7808
Received: from 4865c13c09e1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B382135B-05C0-4C86-B3E2-365803D5F467.1; 
 Fri, 17 Jul 2020 14:34:57 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4865c13c09e1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jul 2020 14:34:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OskMHEMTZLSirYd5wAknr0GwNMTcM8zKYH75n3M60hlChDoAwrPdGcntnb/pWONDmIj4kH3brsyxgPK9EbnhEqBdMTENK6LMuYe7d0r4ieeI+6junVR4Z1GT7PlaNW/1+pfWr/bSTmOH/zVJGHZg6wNKm6KlMRGlzyui9M+cOu2xPQrW/1iK/GV/jTtGwW9p3hqMlsXRWnTUtN5/iyOEfrv2uzMVbjtrOhP3ZGajXwFMm8j7kSvtKXzHs5ysLeU7S5o43iH4KZtAsCRmoeheNqESC5VBXFOotxiSDp0KBMn063ZOdN0e2vBwnf/37gaZ33XG0lO8NrLx1MNRahsm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBDTnrluCCrEQf6lD+PDWOCUyfKdG5W2XqttRnnF118=;
 b=CF1Bs+d9J7VZfpSfaBr5RgtHcvypk52c8XByFcR5Znv7lkYAyKCOAzeoGr8hXOO+ZxdUsowzV8SAlLZ1s9v1WsikNYm+Z5rEPz1fXb4zrptFtyCorMZxc5o/aDeUWyuIz7dqkHWhnCb2CZipUPPwXqVaawKVCA/KfuYhr/K54ue//0xnUA/KnbEYfGzXB4toP5x9hzPJmQb6gl8QvGUonngp1m0RPstux50y8obxF6YbCR4PCvk/SLbrWz6AEjwA7PS8J7e2SO8NUJK7Azy5bwFwe0GpIlsuJNQMeU8w3YQ/YmiJIRF2nBAbrYrki/Mbp3+E2tH08WgXlLKjmiDKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBDTnrluCCrEQf6lD+PDWOCUyfKdG5W2XqttRnnF118=;
 b=Q/IXRFAy3+IKzJmB72xHFK1W16zDo0tv7Z+c55V+Ye2oQtDySOwqdZPhwW7tryM5Ac9bdMhgeyUwpcN8bamt7x2qz0/amwMPKIM21t51kfQhxAEJ4jOWECTKe3GslBWITTnfPLBo3m0rIHK3mJGmFWzpUCfc7vJbpuf4DJpjrD8=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1800.eurprd08.prod.outlook.com (2603:10a6:4:38::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Fri, 17 Jul
 2020 14:34:55 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.028; Fri, 17 Jul 2020
 14:34:55 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
Thread-Topic: RFC: PCI devices passthrough on Arm design proposal
Thread-Index: AQHWW4kYTVU0hTDyYEitKlUuU5vZlKkKf2uAgAACLICAAOrEgIAAVPWAgAABeYCAAAssAIAAAcuAgAAIDQA=
Date: Fri, 17 Jul 2020 14:34:55 +0000
Message-ID: <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
 <28899FEF-9DA7-4513-8283-1AC5EFFC6E92@arm.com>
 <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
 <F09F9354-EC9B-4D76-809B-A25AF4F7D863@arm.com>
 <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
In-Reply-To: <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [91.160.77.188]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 15eed075-daba-48a4-3a6b-08d82a5e97ab
x-ms-traffictypediagnostic: DB6PR0801MB1800:|VE1PR08MB5261:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB52611DF1F7AE9B648FE83B339D7C0@VE1PR08MB5261.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +Q2XoaJ1HG6pgS4ge6fV6Lm5G2ewU5XqtW5yuFyuTN+i5yzTkI9U1KHvZ2nQHucv1fyQAhAYLVBa57xjFqN8N6R4YaM3A/9buqfe1ch2GBn/158VIPW/2n2ACtoifWej8afUs3+INgCoeuWLJooNG9qE4qux4W5+rp7n/rw6qlgHBACHs9cMruCH/8aTl5X2XL7S4S07sKXE/XGw4lHlNFq3uSF7IFuM5K2gIHZe5pDJjgQWCglOOCXdMwyDI9K74m8hzzm6fFNAdWRua9zRhOWBwsD0rhbL+XW2N+KvBMOvZDB0ZquACrnCtvANu//nvHLAtFi+CTF+FoE4kKoxfA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(53546011)(2906002)(33656002)(186003)(6506007)(66446008)(66556008)(66946007)(8936002)(64756008)(66476007)(26005)(6486002)(76116006)(91956017)(54906003)(86362001)(6916009)(8676002)(6512007)(316002)(71200400001)(36756003)(5660300002)(2616005)(4326008)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: SOM1da0Ny8gLrCOmziavbTnBhDfoGkyaqAkP37p9PwKuTWT7SYE6pAp1c3/rXk84Ng8eUXfMe3XJxHmcQzXcAee4deSLpNjd/RikkVwHbFlGJYJYtongiB9y8FoswcRhUPxs1Pf/pWqYYBx4suNraZ2bjylmsMs6bQnLBUrMxPnx5L+E/lTRhO77SEfARI/1dhaWUf5u4gsyqHaLMgXgd5of6QVqBBnefwsYLk0FmKf+Xsh6krtr//63jLMVxaCbnG4MpYpwRxusPKJVH7IYIlt0XGI1KXpC4OlRlQklXnmJZyrJGwOPgCls2j15mNspJRE0+wtfdX+CfpPnG8h/yDy4CpQvuQnGw2eG18uXr3LejuRm0mxUbA+BcgGuC/E5nitK1/OKFKyqY6BcoLNSJnoJKGAfnLWrCe3mRmKb63qPD+tfQS53t8NeCoN0uFR4U40Xh3Vy3IRJsxamSNqh6cEytLD8absVIinqQgfRqZb1BDrKPVMbJhUzM4pX07Ni
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <560D8F1DA805B147BCE425B236527E19@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1800
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(336012)(356005)(36906005)(81166007)(82310400002)(26005)(70586007)(186003)(54906003)(86362001)(2616005)(53546011)(316002)(70206006)(8676002)(6506007)(36756003)(5660300002)(6512007)(33656002)(4326008)(82740400003)(47076004)(478600001)(6486002)(8936002)(6862004)(2906002)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c7b49d09-3458-418f-9e6d-08d82a5e9311
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3qV+u36O3pfUYRLE9BTgIEPf43j3UD4Lw16VF/3YoxUm40H8lo0558KlNIH8KyNFpbZbUmWUIerphUXhQ+F6CPsPJTJvXrDIieYvSuko+9YeyOQYe0ZZSQauBewDe4ToJCHu5oUzQDY6zIWnyPX6t4PGc+/tZ9lMM25tsiVJGrdyiKK7GjIkXfgdiAOGBjjNVSKUnSOhWnyZygyKdiaSuAcER376y9sv1s9NeUUvM/6vtMDUz+EJEDEm5H5//4j2sglLv3wXYc2hHuoepCh1w3KOJmfqZ1PZrsoB286dKuLy5Sv/hg3ccjZFGKaoMMyFDKCp5fzkWl9/yBWOYwE8Znsny/0u5u3W60dXXKYDLOnn3RUIv5/eMDSt6dLush5SuK+e5WU3GXxOjVqVPylB0Q==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 14:35:03.2209 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15eed075-daba-48a4-3a6b-08d82a5e97ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5261
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 17 Jul 2020, at 16:06, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 17.07.2020 15:59, Bertrand Marquis wrote:
>>=20
>>=20
>>> On 17 Jul 2020, at 15:19, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 17.07.2020 15:14, Bertrand Marquis wrote:
>>>>> On 17 Jul 2020, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 16.07.2020 19:10, Rahul Singh wrote:
>>>>>> # Emulated PCI device tree node in libxl:
>>>>>>=20
>>>>>> Libxl is creating a virtual PCI device tree node in the device tree =
to enable the guest OS to discover the virtual PCI during guest boot. We in=
troduced the new config option [vpci=3D"pci_ecam"] for guests. When this co=
nfig option is enabled in a guest configuration, a PCI device tree node wil=
l be created in the guest device tree.
>>>>>=20
>>>>> I support Stefano's suggestion for this to be an optional thing, i.e.
>>>>> there to be no need for it when there are PCI devices assigned to the
>>>>> guest anyway. I also wonder about the pci_ prefix here - isn't
>>>>> vpci=3D"ecam" as unambiguous?
>>>>=20
>>>> This could be a problem as we need to know that this is required for a=
 guest upfront so that PCI devices can be assigned after using xl.=20
>>>=20
>>> I'm afraid I don't understand: When there are no PCI device that get
>>> handed to a guest when it gets created, but it is supposed to be able
>>> to have some assigned while already running, then we agree the option
>>> is needed (afaict). When PCI devices get handed to the guest while it
>>> gets constructed, where's the problem to infer this option from the
>>> presence of PCI devices in the guest configuration?
>>=20
>> If the user wants to use xl pci-attach to attach in runtime a device to =
a guest, this guest must have a VPCI bus (even with no devices).
>> If we do not have the vpci parameter in the configuration this use case =
will not work anymore.
>=20
> That's what everyone looks to agree with. Yet why is the parameter needed
> when there _are_ PCI devices anyway? That's the "optional" that Stefano
> was suggesting, aiui.

I agree in this case the parameter could be optional and only required if n=
ot PCI device is assigned directly in the guest configuration.

Bertrand

>=20
> Jan


