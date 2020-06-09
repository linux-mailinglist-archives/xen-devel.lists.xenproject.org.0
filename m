Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DBA1F41B0
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 19:04:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jihfE-0005ep-R7; Tue, 09 Jun 2020 17:03:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmWh=7W=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jihfC-0005ed-UG
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 17:03:51 +0000
X-Inumbo-ID: 2fd32ea6-aa73-11ea-8496-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::607])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fd32ea6-aa73-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 17:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXFHzux9Awfg8hGSv9+j78Q4hPhDdAfRz9cmsvB78sw=;
 b=W6pQfS26H2Xwn+kgb1+GFjHnzg6w4hx38U7pnBNxtx77DkR1X22i8VrmQzzTGygZZpHDA7A4XHpdFDbQwhMatzMU2JWG9pb3u5aF2Zbrn9Mj7TKipSeXOFDfrzgwXudrCxzHXJsgHuvCCqy6WAGevmDKDgXII+aDVcR9DXWY03g=
Received: from DB6PR1001CA0003.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::13)
 by DB6PR08MB2904.eurprd08.prod.outlook.com (2603:10a6:6:1e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 17:03:47 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::72) by DB6PR1001CA0003.outlook.office365.com
 (2603:10a6:4:b7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Tue, 9 Jun 2020 17:03:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 17:03:47 +0000
Received: ("Tessian outbound fb809da9b456:v59");
 Tue, 09 Jun 2020 17:03:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2486b1c76cfea7e3
X-CR-MTA-TID: 64aa7808
Received: from 9b1ca0b6f4d0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A1A40352-AC7A-4E17-AAAA-721B081F421D.1; 
 Tue, 09 Jun 2020 17:03:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b1ca0b6f4d0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Jun 2020 17:03:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF9yxkNVObhmCiwG+uWxL5q17TtT6n17GDZf1Vl36+fwygJvO3fay/q/fjV3jJRbM8YunvmD1TSvoxcs71O0VCUJjeOTIaDmehaLfF5aSK4flkbbAugOnk9OxNCEGvd+ZqpDJCi1NvZkWZsoTeY7UC4lY3CTPrMf4E/sUeAIse/GKREkTqAXDOFx6RB3W5cm6m9MYDgu8Dx9hMdAZAP8EuSueBYqmsfZ8KhcYsbOWJfIohUh3gsa39LppMvIRRhljEsYQHdCFMx4nnsSrKTHJyoYACX3IKUGz5f1GgRRHdNweu64haS3VrzVccmCPaFeweDa0MnnjFeMfjxiUMHqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXFHzux9Awfg8hGSv9+j78Q4hPhDdAfRz9cmsvB78sw=;
 b=LZsuWVQ03MRvqlr7zrdT71emkJJ7i0hDhC5SFXMOud4yp/xMtB9Dba3CHAI/iikNLpl9pm2wee0G+F7YIH2VLS9qxN7oksmRNPbGMhtA+NKfggxIX4N/UR1b4AUFHzzNr50i1i9gBCpc3HQn2pkvZrtZvO08b07pnG7ZjgKCtdcvSUMOXzFuqdXoEOteUoi5Psv/GFZVvqoHHP1kP5J2kinL+tS8wKPwHtGiP8a7j5nPv0GSKuk1kE25g6odXLeI58LZhBvLP13IO0Ak3DS+6JG/RQuW+zNQRcS8lx2KkiB1Ko/6D5XD/nAsGdCSRMPWpUf0p0991tV5NX0kKcOGuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXFHzux9Awfg8hGSv9+j78Q4hPhDdAfRz9cmsvB78sw=;
 b=W6pQfS26H2Xwn+kgb1+GFjHnzg6w4hx38U7pnBNxtx77DkR1X22i8VrmQzzTGygZZpHDA7A4XHpdFDbQwhMatzMU2JWG9pb3u5aF2Zbrn9Mj7TKipSeXOFDfrzgwXudrCxzHXJsgHuvCCqy6WAGevmDKDgXII+aDVcR9DXWY03g=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3594.eurprd08.prod.outlook.com (2603:10a6:10:4e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.23; Tue, 9 Jun
 2020 17:03:40 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 17:03:39 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: Keystone Issue
Thread-Topic: Keystone Issue
Thread-Index: AQHWOBaIAfEL/lLkK0WiNSn4kZcZc6jDwRQAgAAfVYCAACZwgIACvmKAgABfPYCAAA+JgIAA6NEAgAAP9wCAAAJxgIAAEuGAgAAfEwCAAGmFAIAAh2UAgABV34CAAFCtAIAAAUSAgAADZQCAAAGKgIAAJpOAgABE7QCABAZcAIAAQRIAgAA9oACAAXYtAIAAD3sAgAAFaoCAABUzgA==
Date: Tue, 9 Jun 2020 17:03:39 +0000
Message-ID: <03607739-A4FF-486A-899A-F5F36870225A@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <CALYbLDjNptWfVMGjw801y6f0zu40b2pzBnLS+w2Zx5eVStCUYQ@mail.gmail.com>
 <da23ecc8-60f0-8a26-58d5-ea692dcf0102@xen.org>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
 <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
 <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
 <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
 <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
 <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
 <CALYbLDh8F0JuGmRY0C1Nhp_b4FP041KMa14pOmyoSBtHcz=A2A@mail.gmail.com>
 <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
 <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
In-Reply-To: <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9da956f3-d651-4860-6b0e-08d80c971301
x-ms-traffictypediagnostic: DB7PR08MB3594:|DB6PR08MB2904:
X-Microsoft-Antispam-PRVS: <DB6PR08MB29043EE40DA346949CBCB5EA9D820@DB6PR08MB2904.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4mS57uuErEPkt8CM13w99NPbHixJjbEdJgaEriAVO2Kr2cUBwrYw5HKPRkHCErpUm3gKzV2x6hUg8flesBrBfDV7KqKbqLNLWOLqK2asqUxB6ymxM9YaHdmFOWnTCBUlnBKtIQN/pXe7TDyDMKnPghs3GEYC3UyMLQA7qo7j3MQS/Jp/My6zP42vNW0O0TLpTt9Rahi6p8Zzf0RpJIHl9AxCp6BQPk4MVvkVX9hyDNY5XnJoj45SojUu8YitQaDykR4Y/T8/50oybJ7AAfamVYBfIU9a5ioOQwkESxhCIfgkI0BJ3BBFfgQs4/yPY58z+OS7as+U9sb/wUgzex7TVQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39850400004)(316002)(91956017)(76116006)(66556008)(71200400001)(53546011)(66946007)(66476007)(5660300002)(54906003)(66446008)(6506007)(3480700007)(4326008)(83380400001)(33656002)(2616005)(186003)(26005)(64756008)(8936002)(2906002)(36756003)(8676002)(6512007)(7116003)(6916009)(478600001)(6486002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: p2PxH3B2U4M+cbusz+U/I3h/kohlY8RaHP6xKxKL5mgy/IjkH4RIzaE77cXytsRpalmx8Z3Apv+UfLEftipBF2qgzdoD4NJF4BQd9yCxNyo56qEQtGVytA//nr9yVyaUTfNmKLBZcL0PRnYVm6u5fjbZ9KNSPwnyC+ZtsDFy0EH67OLjQKGY96+X4sFtv74Zhi/sKkqjh8p9cfnW32v1K7JXELmI3NkvYHbAchh9VLplucGkbel0p3+Pbj18pIwjs3zY2S4beUYaY3E3cBxiQI0d294upPsYcJlx16fm0wAq8h+R81XR8REgrmCjIu1tTgdg4REp+acn1OAytWCPn7HnOE8A0VrT158INjrybVq7GZNEhklj58PN31bnV8YXWcu0o9vK0fYGhLUcBYFUmCA19aHSZNIxYwXAYA04nTgT3H4WXuc5eUgRVAAr16ReOEC4fgnTbPejCxhz7Wv1Pypx08+32G7OHJItfaDJC7w=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6154957B7A54454FA686953AE76779FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3594
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(396003)(39850400004)(376002)(346002)(46966005)(7116003)(8936002)(356005)(47076004)(8676002)(70206006)(33656002)(83380400001)(4326008)(6862004)(316002)(6512007)(82310400002)(70586007)(82740400003)(54906003)(186003)(36756003)(81166007)(86362001)(336012)(6486002)(2616005)(2906002)(26005)(6506007)(3480700007)(53546011)(478600001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f00d81f3-88cb-48b8-4824-08d80c970ebf
X-Forefront-PRVS: 042957ACD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oXTi/LJF9EaGZwGbu1jP5ce/AODVOejxc2Kp7FIx5/7QZmhGnJuFrqj+2XrpqVmOer+CbYwXZlyCqFYwexKzScQGeW/qCX7Wz6pvg3W1qwJHVJmORigP4tJC29m83+f4C6w5962k0iacqDQNCvz0KI4FL+v3iB/tbS54zS8vTfGP5U6bPa/HGWfe1GHeUKaSrXC6INlOYl39eI/vF0oO8Tk7CenDFAbCsUMrRXZmIJxXrQSggs88ON97tetuuvLYzw1XixmN5bZTSbakY+WwmZDS2sEetqIEHoGh1iUnMCMcWqVcJ3ExdWCou+JAKijnaSqJEqKSR0lEGoV4o44iFtl9sZbI9kdK0mtyw9/4F0Buj93y53siGG3ajPB3TpdkFGVzfNXGBYH2cWP/jfAINg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 17:03:47.1310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da956f3-d651-4860-6b0e-08d80c971301
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2904
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
 Stefano Stabellini <sstabellini@kernel.org>,
 CodeWiz2280 <codewiz2280@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi

> On 9 Jun 2020, at 16:47, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 09/06/2020 16:28, Bertrand Marquis wrote:
>> Hi,
>>> On 9 Jun 2020, at 15:33, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>>>=20
>>> There does appear to be a secondary (CIC) controller that can forward
>>> events to the GIC-400 and EDMA controllers for the keystone 2 family.
>>> Admittedly, i'm not sure how it is being used with regards to the
>>> peripherals.  I only see mention of the GIC-400 parent for the devices
>>> in the device tree.  Maybe Bertrand has a better idea on whether any
>>> peripherals go through the CIC first?  I see that gic_interrupt ()
>>> fires once in Xen, which calls doIRQ to push out the virtual interrupt
>>> to the dom0 kernel.  The dom0 kernel then handles the interrupt and
>>> returns, but gic_interrupt() never fires again in Xen.
>> I do not remember of any CIC but the behaviour definitely look like an i=
nterrupt acknowledge problem.
>> Could you try the following:
>> --- a/xen/arch/arm/gic-v2.c
>> +++ b/xen/arch/arm/gic-v2.c
>> @@ -667,6 +667,9 @@ static void gicv2_guest_irq_end(struct irq_desc *des=
c)
>>      /* Lower the priority of the IRQ */
>>      gicv2_eoi_irq(desc);
>>      /* Deactivation happens in maintenance interrupt / via GICV */
>> +
>> +    /* Test for Keystone2 */
>> +    gicv2_dir_irq(desc);
>>  }
>> I think the problem I had was related to the vgic not deactivating prope=
rly the interrupt.
>=20
> Are you suggesting the guest EOI is not properly forwarded to the hardwar=
e when LR.HW is set? If so, this could possibly be workaround in Xen by rai=
sing a maintenance interrupt every time a guest EOI an interrupt.

Agree the maintenance interrupt would definitely be the right solution.
This was an easy ack to check if that was the source of the problem.

>=20
>> This might make the interrupt fire indefinitely !!
>=20
> Most likely with level interrupt ;).

Yes but this is just to confirm ;-)

>=20
> Cheers,
>=20
> --=20
> Julien Grall


