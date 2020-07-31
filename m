Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90FE234619
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:48:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1USL-0000Q1-BA; Fri, 31 Jul 2020 12:48:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wy6+=BK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k1USJ-0000Pv-Ts
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:48:11 +0000
X-Inumbo-ID: 1625fb01-d32c-11ea-8e30-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1625fb01-d32c-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 12:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63LxU5fX9gZp/NnEyliV3iSuEgzXGxcrXnHh99UrHXk=;
 b=NvLHOnQbhzSH6QGPGmpSxK0St2r4aMBidFxy0zU2vtoWXHxvgKhVDgdnIlZDrqPzjzpvVaAQ/2C1bbiSt/oWwqi7f/aiMozczJe323T8lOrXmRFL5dk5aEjznZib+z1d2ARDw8oOwRcSkNtnGQHmLGcpUVXVFLr5depsh1Ry6tc=
Received: from DB6PR07CA0062.eurprd07.prod.outlook.com (2603:10a6:6:2a::24) by
 HE1PR0801MB2107.eurprd08.prod.outlook.com (2603:10a6:3:4c::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.16; Fri, 31 Jul 2020 12:48:08 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::5f) by DB6PR07CA0062.outlook.office365.com
 (2603:10a6:6:2a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.9 via Frontend
 Transport; Fri, 31 Jul 2020 12:48:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 12:48:07 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62");
 Fri, 31 Jul 2020 12:48:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 57b6d5c869fd5c42
X-CR-MTA-TID: 64aa7808
Received: from e0f6eabaecf5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 67896373-3F65-4C53-BA77-52E665AA3336.1; 
 Fri, 31 Jul 2020 12:48:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0f6eabaecf5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 Jul 2020 12:48:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAlryCAnvhgNvgpNd+u0VS2zd625GQEVcnkDdBxH1i7S85ksM1gtdCREsc7vJaStnS2b3iLWk8uyrxDVcwro2kZpXe+pyCcg/lCGTIFseOP7H0eR/YW20Szot0FDXvtLzXtTlRYcWGhpIYlBm1HcSr8BFx+DfhJiiiTmnkIlgwhm2x2j9q/unLFs/upml0T2IWoCzW6e8meDxmyvVxk1DTaWNEqZllwFdLgpk/DXhKRNURHOMK1VY5WcfsdpWqYSt/x04F8sxfafzrsXotjs2iLFt/oKPxzdSkGibodjn7Fc5l4dPJLbVLKHfqgQ+E8byz4s/bZWmCgutlBZSkxagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63LxU5fX9gZp/NnEyliV3iSuEgzXGxcrXnHh99UrHXk=;
 b=SjihB9uB9Bq/59yT9QYBQIWW9lHNYs2ExEbVkAM9Amm7iSX2MKUSeFzHdqoagzSghrXp95EXNUjuRdjZjGTYoBqzZ7OYyrlcfRHCQkpjevRqJYjU6Xn35VeMObEoVyEAy0vdfsl2XjT6wqZU5YE8qu9RAMaa8Ie4EPaD7mScQ7Y43zgpzC/KnkpZRAM9shNXqS7ghIY2tr3VuGikgzeXvzkJsw5TVs24l2fv/tK4TFeUqW7OKogde8ycM9Nk3TavX+mVd71bfzFjkrj3xgnPzAgRD/zy6/KNiBiWaIp5JfVo35VX0JdU58FZbR+4j9ZixECxv9o7/OfwdcDlmltUig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63LxU5fX9gZp/NnEyliV3iSuEgzXGxcrXnHh99UrHXk=;
 b=NvLHOnQbhzSH6QGPGmpSxK0St2r4aMBidFxy0zU2vtoWXHxvgKhVDgdnIlZDrqPzjzpvVaAQ/2C1bbiSt/oWwqi7f/aiMozczJe323T8lOrXmRFL5dk5aEjznZib+z1d2ARDw8oOwRcSkNtnGQHmLGcpUVXVFLr5depsh1Ry6tc=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5323.eurprd08.prod.outlook.com (2603:10a6:10:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Fri, 31 Jul
 2020 12:48:01 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 12:48:01 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: kernel-doc and xen.git
Thread-Topic: kernel-doc and xen.git
Thread-Index: AQHWZhCqcVqKiEQuVU6MZpfTy49dJakhj62AgAAV1gA=
Date: Fri, 31 Jul 2020 12:48:01 +0000
Message-ID: <CB28175F-DCE6-426F-9F75-EBD4AE4B2BF6@arm.com>
References: <alpine.DEB.2.21.2007291644330.1767@sstabellini-ThinkPad-T480s>
 <9421ec73-1ec0-844f-0014-bd5a36a4036f@suse.com>
In-Reply-To: <9421ec73-1ec0-844f-0014-bd5a36a4036f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [90.126.203.125]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 32007122-0bac-43f2-384d-08d8354ff993
x-ms-traffictypediagnostic: DB8PR08MB5323:|HE1PR0801MB2107:
X-Microsoft-Antispam-PRVS: <HE1PR0801MB210781D158C499E3A0063D8C9D4E0@HE1PR0801MB2107.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DaCQy1uocmK6FH1pGQsTZG1nHMIP1FZxAz0zccikM6DmN9COVx4NFyGYtR1xPHkOd4skg1tTLjbce6pzTiDgNlnSxO+HGjauw/lq/rfXZHNl43Ob1ws+cbb1RqBWcrtHyHflyXVIhkTrZKjw3ivMqM6YHd+B8cpcTycKLZ6xD+0y03MXBv81jHUyCpi0Y6xgGeJxifKQtHvrr58+QyZvdi9ODNbHnBRTyhmXtGQ3oM7+VxD5hjDcaOp3ae6GACZSHRDViKaApXLWt4FSqZDqVDT9eG/22oNRVYBW+XybtgwgV6bsAi/UxK0Yn1j7wWnxhzWqxJICNBXIzSorJE83Ow==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(6486002)(478600001)(54906003)(71200400001)(76116006)(66946007)(8936002)(316002)(53546011)(6506007)(91956017)(36756003)(86362001)(8676002)(6512007)(5660300002)(3480700007)(2906002)(2616005)(33656002)(66476007)(66556008)(26005)(64756008)(66446008)(186003)(4326008)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: AxrqUiqhB1GI3cHFnuZWFIF3Lx2o1ZG7LMCGIW2hdKfwWqRIBdn4MIowyJBtBLWGJB3Im/7P11sptAW8xt7kLKZrWWBrrmCNz2aS6YXr9b2JpXTcV8DTkRhF0B/hJMFcFztFur/Fh93FhvVq5rhhgMP7gQEuWkGBdz7MKODV+fm6PIJBtUiB4R3HuOPS/1NpTAzEpR1pdU/PHbowod7R/tCoOla+Fqj4e9I6AjHjMMCSa5LRzjftEb4imsWn8I2PsGiYdfIa5P56sX2h1wHc7bpvQh8GOgvmb1zFI8i6rYEPCr6SG7ePqnMyg59LpxEGP+pN1MAjAAEZbIVQC7KB9jSUC3hr5drBt1e307sf+EDBSQAQP4V7MpLR0DiNsnVfmygG2loSrBNLurJCQXEM8IHJLGjmSzTxFY+RSxH3IF9ELxDwV947ATOL0AL4CCD/lcCXoeMQrCum+1wxfWso+IsPGThgcLN5EgrGYQIihlUtcdA/tpmEJ49vfQcloGqKmhckE1FomHc4VrqRB3NWoCdaA7dPPNXrBYG6diVqKCmnJdkVyS1ZgEU9/MuybRimkeWAcE/hZuksj81R239If6kX7KoWyTjJeZaQpKl/b+BhOI3LgjAfDMbHrTKD1N+M6jET+4iYDK24kVKb/2HRIQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3E2F6F798A0F5F43841836B28D6951AA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5323
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ad8aea1b-37c4-4400-7e88-08d8354ff5aa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ML4hzMZIRaS6xHeC3GECyoBLVrHx/77B5V1EJC43Rb+tNt4GCnUK+ZYqCnrPUwtBpVdKZS6JakUUjx0Y0p9VN/oeWN7m25TvIj9TpGVeIUeZVVl758Bm2oeFocT3s8YRR1K6kr99Azlk/AX58XyfMsI4CvyYrlDGwVJ3y6odHZTtkFFOpxQ2lR0mUTYqBSOjlyoM+Z/kE2xjYyC0DAVEEHOsQoKgfio5fnTTTGsErRba1crqUxSEZsxGK0Ly75OKPDqCipkjTvG8MGUhngCsjRliHEkKSCSPbWdIhpDpiogpXWxlJ4t7Be98H8dyMAN898z0z4/K0zFU5jYl8MGEO+P2twyT9AGFeR0y9ZccVEkWDTnQc4ywg35FeKo9A2Z9zRTTB374ffNIsLd8E8CoRQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(8936002)(82310400002)(336012)(86362001)(6862004)(33656002)(4326008)(5660300002)(478600001)(47076004)(356005)(2616005)(2906002)(81166007)(54906003)(8676002)(3480700007)(82740400003)(53546011)(6512007)(316002)(6506007)(6486002)(70206006)(186003)(36756003)(26005)(70586007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 12:48:07.8718 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32007122-0bac-43f2-384d-08d8354ff993
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2107
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "committers@xenproject.org" <committers@xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 31 Jul 2020, at 13:29, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 30.07.2020 03:27, Stefano Stabellini wrote:
>> Hi all,
>>=20
>> I would like to ask for your feedback on the adoption of the kernel-doc
>> format for in-code comments.
>>=20
>> In the FuSa SIG we have started looking into FuSa documents for Xen. One
>> of the things we are investigating are ways to link these documents to
>> in-code comments in xen.git and vice versa.
>>=20
>> In this context, Andrew Cooper suggested to have a look at "kernel-doc"
>> [1] during one of the virtual beer sessions at the last Xen Summit.
>>=20
>> I did give a look at kernel-doc and it is very promising. kernel-doc is
>> a script that can generate nice rst text documents from in-code
>> comments. (The generated rst files can then be used as input for sphinx
>> to generate html docs.) The comment syntax [2] is simple and similar to
>> Doxygen:
>>=20
>>    /**
>>     * function_name() - Brief description of function.
>>     * @arg1: Describe the first argument.
>>     * @arg2: Describe the second argument.
>>     *        One can provide multiple line descriptions
>>     *        for arguments.
>>     */
>>=20
>> kernel-doc is actually better than Doxygen because it is a much simpler
>> tool, one we could customize to our needs and with predictable output.
>> Specifically, we could add the tagging, numbering, and referencing
>> required by FuSa requirement documents.
>>=20
>> I would like your feedback on whether it would be good to start
>> converting xen.git in-code comments to the kernel-doc format so that
>> proper documents can be generated out of them. One day we could import
>> kernel-doc into xen.git/scripts and use it to generate a set of html
>> documents via sphinx.
>=20
> How far is this intended to go? The example is description of a
> function's parameters, which is definitely fine (albeit I wonder
> if there's a hidden implication then that _all_ functions
> whatsoever are supposed to gain such comments). But the text just
> says much more generally "in-code comments", which could mean all
> of them. I'd consider the latter as likely going too far.

The idea in the FuSa project is more to start with external interfaces like=
 hypercall definitions and public headers elements.

Bertrand

>=20
> Jan


