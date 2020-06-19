Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B350200482
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 11:01:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmCu2-0000oo-Rh; Fri, 19 Jun 2020 09:01:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bIi=AA=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jmCu1-0000oj-5t
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 09:01:37 +0000
X-Inumbo-ID: 7a7b9692-b20b-11ea-bb8b-bc764e2007e4
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.76]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a7b9692-b20b-11ea-bb8b-bc764e2007e4;
 Fri, 19 Jun 2020 09:01:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZuLuQvySxAps6jBA17Wfd1Own+D6o4F1PO/0tBpFpmw32CxNZZFGkJ8X55wrCMnx6hPtxP+PTnKSH/RvtiEB3nrBNm7AUH6kFEFPcAMVA2XcywIHe/EihAE5OuidCQ+9T54G1bDc912EF0gHsEH//HB5rjG1hByT6m/WlGpcj0SoB9btzWocLvxO+3a1FmIx7iRzEdWvjXlh0Hf7NZ8lvhgdFFdoBbH8qfH869Ncr3f1mHZPw5BNl1c8NigRwAMJUVWzOAmODW4UCHGmY2A2Ej2qVoS/0VzWxOmrUVOIo8loEtrsmG4ujUglEjv+ZYIp5e6A6cLks4/XgOk33kmew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cowXw8WTi53GmEDVmNewfn2D9Hr6EV/2QnhPcV8Mg2Y=;
 b=h/G/EQ1tLJjXOqKKAv/O13cBHTkhC0L4Fg/VtqDPyAJmrAGxysx16aqgvJGO7IgnpShNSZSrTlnHSvFMlgbXs5KaNyAsJqDejxDteDZ3oTyj2peAMxIGDEnDiFFBh7zHIQC2e/OtT1tJ/FcyUPVri4ix3BpBIR2zh3QS0RO1SoXqPy3FTalhz1nlr5QSx31lRsIXCkNsGF1EPvrt9beFHbih7dF87v7puitAqLJ1ER83+ptWhjOLEE4X4g3ssXrzGNExXLWBO+tpE6rfnpSnBke2rujFnC+PRLG2MRZiR9XlgN72XmDMrXHK2nSJTlhgQPXZ8lBVMOtZra/c6OxFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cowXw8WTi53GmEDVmNewfn2D9Hr6EV/2QnhPcV8Mg2Y=;
 b=CrReyM7fH6MBgC6yZLoqCufhpxMQAIM5EnMbKuTULmENFDjRhpKTe2Duee9tMQnYc/57CzM0UeA6Hu28LRwLf6DGMWdg21RBl+dZEzh/ZjK9tdXUiAw8AbpwizZFxedwAGiwmKLCrLubVhC8zJMoEL/grnPExA6mB6cbHZD0KG+We3l17M+DP5nXY0NvT3qF15dpAhAw1l/3EABhzy827/xofOP8Q39fTjh35NOJPMgzX/+T2FNhn9rvCZ2d08ijEasLzcFyI/kMwaQobDbLAJjOa5rPF3BiNBlMyoatXsMfbLm2ZU3b8901jdwWm8Z/y9lzaJj8yPFX4dEcPit24A==
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com (2603:10a6:802:35::28)
 by VI1PR03MB4670.eurprd03.prod.outlook.com (2603:10a6:803:5d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Fri, 19 Jun
 2020 09:01:33 +0000
Received: from VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37]) by VI1PR03MB2926.eurprd03.prod.outlook.com
 ([fe80::95fd:55d9:421b:1f37%7]) with mapi id 15.20.3109.023; Fri, 19 Jun 2020
 09:01:33 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] optee: immediately free buffers that are released by
 OP-TEE
Thread-Topic: [PATCH] optee: immediately free buffers that are released by
 OP-TEE
Thread-Index: AQHWI0fTRy+rlPvmsUKZMLlR49t2iaiiqEuAgAAKD4CAANCDAIA7s8+AgACw6QCAAAJPAA==
Date: Fri, 19 Jun 2020 09:01:33 +0000
Message-ID: <87sger1lar.fsf@epam.com>
References: <20200506014246.3397490-1-volodymyr_babchuk@epam.com>
 <51b8c855-5e94-2829-a703-d43c84948120@xen.org>
 <f4e1cc2b-97bf-d242-8f1b-e72083f378be@citrix.com>
 <alpine.DEB.2.21.2005111534160.26167@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2006181518470.14005@sstabellini-ThinkPad-T480s>
 <57e24ddd-5ba1-eea9-2961-d7dc9ce22688@xen.org>
In-Reply-To: <57e24ddd-5ba1-eea9-2961-d7dc9ce22688@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 26.3
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3474750-dc00-4a81-d959-08d8142f5d56
x-ms-traffictypediagnostic: VI1PR03MB4670:
x-microsoft-antispam-prvs: <VI1PR03MB46707A06AFBA4907835358D9E6980@VI1PR03MB4670.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9saxKQfWq7mSjQipbKWSIAJUD8os+JLqZmMxcx5jl06+ziZHF/I1y2bfaul5vIpUONlZVARWat9Ai2rza70QG51dkVl398UmmL+DplYaHJ7wMWkHmhF1TllwdvTGqST5HxHVjdXnvSklpTJZ1HBZ7tzsPL7UFd7gNhMGJjG7esm/H24pI1fZWKlMXqHto+y2/clP8li11RB3m5ZvYOjCWJoNdWA3R7ottZ3TR77TFzO304nu5o/NMEYWYwcmgiXcOGh9BFv66AapxYHZZsraXS1R/3f/ihxR5xjTfedbkrtPIhdmG+SrWVMpgeWP50GjV/CxBTqncydWGuE68BGwIJeGQs7/Z1xQTrgRQqaZ0xJ6WTks5EoLiPbbGzlULs/o
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB2926.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(6506007)(36756003)(55236004)(4326008)(53546011)(6486002)(316002)(91956017)(2616005)(186003)(66476007)(26005)(66946007)(54906003)(64756008)(66556008)(66446008)(76116006)(83380400001)(6916009)(6512007)(8936002)(71200400001)(478600001)(86362001)(4744005)(8676002)(2906002)(5660300002)(14773001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: xmm2xT8Ds9jS4/JDXZAlOuBgIAxtKntLFkKdTfaiRRreZOkiE9FbvERkyqamHM+pn7fk+S/0BMlnx31KNgY5izq9Y4RvvEPkc3TPM3q3NEmoEasSduUatHCW5MNlD0U0uBFRBfnTiKyof+dDviCVti6flZKwAqqkQYUpV877ucJqIcBlS9CidS0TBUoYekAWLE7N6PIuH5Ys/T0BV1VfDeCwSBRacq23q1IQx1MTeaWAQDr/P5HfiHsPF/BbjgMHe49X0Pe+ZXrmD0/XAdR/vlQujjEu/IoyKbIbb9hQpac7d3WKJUyKg7NOt5SrZUUDxzGZvEFBHP1tV9QY0XLMnEeNkVhtJUIpE+DjXW6+8uYtZ1CW/iDLXnQypSDlde40Z9JjEsjw2+VYbBn2WHM4Qlok31C0lr3iMt1JO2a+zvFm13cxJ1sI7k8oGLePdJvwVJqjBYbl/lgMskmSI7sbHNYUtrPL1nNMDb+b3q8vRao=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3474750-dc00-4a81-d959-08d8142f5d56
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 09:01:33.3657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FINU/zhGd7n+TIy1EGcwDaVD7rY2izZ7jJwTDyaaL9DDyBP7t6a72c5k8MPsUvnjqHAQrCYxEK76I/Ev4ldAS/Mua2lwsbhMGMA3aNHataU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4670
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


Julien, Paul,

Julien Grall writes:

> On 18/06/2020 23:20, Stefano Stabellini wrote:
>> Hi Paul, Julien,
>>
>> Volodymyr hasn't come back with an update to this patch, but I think it
>> is good enough as-is as a bug fix and I would rather have it in its
>> current form in 4.14 than not having it at all leaving the bug unfixed.
>>
>> I think Julien agrees.
>
> The approach is okayish but this is not ideal at least without any
> explanation why ignoring a potential bug is fine. I could settle with
> an expanded commit message for now.
>
> Therefore, I don't feel I should provide my Ack on this approach. That
> said, I am not the maintainers of this code. You are free to Ack and
> commit it.

Sorry for the delay. I'll provide v2 later today.

--=20
Volodymyr Babchuk at EPAM=

