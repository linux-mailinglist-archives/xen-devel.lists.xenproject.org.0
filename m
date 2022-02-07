Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E8B4AC4BA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 17:01:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267186.460905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6SC-00067I-J8; Mon, 07 Feb 2022 16:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267186.460905; Mon, 07 Feb 2022 16:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6SC-00064Y-Fd; Mon, 07 Feb 2022 16:01:24 +0000
Received: by outflank-mailman (input) for mailman id 267186;
 Mon, 07 Feb 2022 16:01:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kaUt=SW=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nH6SA-00064S-P0
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 16:01:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f7ee4b3-882f-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 17:01:20 +0100 (CET)
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
X-Inumbo-ID: 2f7ee4b3-882f-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644249680;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RVMMGcshLYbP+PZLZfceTFwbCv1XB7f4eHmsO1KU/SM=;
  b=XxFO5HZ18QXOt/+wrhUnzRbReX+vfE4+BvNBZi2NtvgSq6uDqS4PRBsU
   Eq68pB2SQxgjytEOuQ8NHgH7Vvf/uBiF/1jo+C506+l242clXih1z3PrZ
   2rhTXX3fCjr3rpl7gRLNztytKRn1mGVTftIddhnLB3u7OBiVhDGmzCrcd
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GWof63ljdIl+8znsHOqtglYI4iHAiA1fFtyr6ofjbA3s52/+Zf2L/O3Ie0i/W0BcrQRO6NiIxS
 yI/uBJrrfrxs8llhF133NRQK7idhwomzIh4UbjxXDLfP0pB2IzJAu6lParFzd/NpxL7HXxhRyv
 AUyFrPFTDhF2ccZC2Wz67xLjROQTRGCf1SnQxw9WT4+fdERN7pifGRs2epzpZISEIuw+4Jn+LK
 s5aRevaShRCr7ltScS5Y7WP6S3EKBJEG/46mmZHR2s8RMo3wfRcO5uiRnuEWF7qDU9u3dE1J3F
 +3RVrj2PPtC4n3PqjCfcFFrB
X-SBRS: 5.1
X-MesageID: 63657343
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gck4m69DbNEJX3Ned3hGDrUDWHmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 DMYXzjUPfyMZWGgeYx/b9vk8ExSsJ7Xm4AwQFFupSE8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rh3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgux
 Mtik6W1az4GFZLToKMnchsGTQZHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4VQ6uBP
 JZCAdZpRDH+QDgfGnwcMa4jh+fvt0vgWmJX9F3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0BNZOPMsD7SO05YHr/D7ePEkGEGBmUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4PeRECnCBtJ6sybp1qXHb7
 RA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL/JNEJuW8vfh4yWirhRdMOS
 BWC0T69GbcJZCf6BUOJS97Z5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWrnL89AgORD7n1vmgv7G8uhpzz5iuX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0FDLSuOXeGrdFPRb3IRFBiba3LRwVsXrfrCiJtGX07Cu+XxrUkeod/mL9SmPuO9
 Xa4MnK0AnKm1RUr8C2GNSJubq3BR5F6oS5pNCAgJw/wiXMifZyu/OEUcJ5uJesr8+lqzPhVS
 fgZeprfXqQTG2qfozlNP4PgqIFCdQiwgV7cNSSSfzViLYVrQBbE+4G4c1K3pjUOFCe+qeA3v
 6akilHAWZMGSgk7VJTWZfujwkmfp38YnO4uDULELsMKIBfn8ZRwKjy3hfgyepleJRLGzzqc9
 gCXHRZH+rWd/95rqIHE3PnWoZ2oHu1yGlthM1PatbvmZzPH+meDwJNbVLradz7qS26pqr6pY
 v9Yzq+gPaRfzkpKqYd1D51i0bk6u4n0v7ZfwwlpQCfLYlCsBu8yK3WKx5AS5KhEx7sfsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRWo/jJz8ZqGTV5WbkuFhyFqJbdoNJ8on
 LU6s8kM5g3j0hcnP75qVMyPG7hg+pDYb5gaiw==
IronPort-HdrOrdr: A9a23:oDmk3aFL9BDOfHjVpLqFTJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVp2RvnhNBICPoqTMuftW7dySqVxeBZnMTfKljbdREWmdQtrJ
 uIH5IOa+EYSGIK9/oSgzPIU+rIouP3iJxA7N22pxwGLGFXguNbnnxE426gYxdLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxs4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1Ssl
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGYFq/QpF5d1H2mxa1+
 UkkC1QefibLEmhJ11dlCGdnzUIFgxes0MKh2Xo2kcL6vaJOw7SQ/Ax+76xNCGptnbI9esMoJ
 6ilQiixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MYiFW5uYd899RjBmcsa+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zs93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkfgIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehT1Yd0s8LAp23FUgMyPeFPbC1z1dLl1qbrSnxw2OLyvZ8
 qO
X-IronPort-AV: E=Sophos;i="5.88,350,1635220800"; 
   d="scan'208";a="63657343"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIqLeKMUEFuvoW8lmRe6UydowfFU3yhktN7v6GDM6tfBX6TAdjvW25Cv/fCxMkzw7KGVlw3LXyx1lgOYQmRQdEF22pL9/romvdPLX/MlUG61/rMQiiOJlz33f2onI5nDLtfulQfeu4pu28Ar0vVk/N/IKFeohvZ2ED8a1D0lTeShR6KAet1FiOQSl2w8DCBU/1pgnLe60t62bwyiUAfRi8nGg20e3cJZibmmrHljUQYu91aQtFNaXl6YZ3tF5nuG29jYJeziC7jC+bgScjROwv+6mOoSum92z/9FhnnAJejYyumd5VEB+kF1KjVW0AzhP32icZwYQqC00AGj4b4JmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVMMGcshLYbP+PZLZfceTFwbCv1XB7f4eHmsO1KU/SM=;
 b=eZXiTZCLeDwxinSYKx8MbNonTAowprmsMIjbXwHc5UoXUmc+mKHY5Xo0gkobtgG0k348TsmdOadUSgb6D2LM9Vg4khBtpOztZijFJcNu451rWriOztTpGv9ULPSDr6CWzxta7eSk/tmb/xShquDjW5fUDlO4dDVEB3w4Nv9ZZLh6RH5ISfzE/jvzKYtdXujpxOSGHNdVGmMNJkwnRWnTNIa0KT1pDV+kK/cWf9GMhFTlaqzfBIkrBKX4x40vuD79iffqrUpBYpABOMbkix7cyBIL+kTSVChZNNKq3QWqSxpXD/mS8P3L0zOBTgEqMAxhPLHIA6u4tx9j85DtvbI4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVMMGcshLYbP+PZLZfceTFwbCv1XB7f4eHmsO1KU/SM=;
 b=ZI6uSKTvhbM69NaIbc031wNi2jMF+syK/7cREf0YBVWv0JUUxdkZmRR1Se8SCm0/OuLHJB4Ke+oqQsno6/+qSiJnx1quzFqlrqp2Y/l8yazlwKUWqk+RAweAOsy72/QpQLs+qUq9f7yn7lsMfdVwmJjoMaDxOYNkffAyfz6oLsQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Roger
 Pau Monne" <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/hvm: Fix boot on systems where HVM isn't available
Thread-Topic: [PATCH] x86/hvm: Fix boot on systems where HVM isn't available
Thread-Index: AQHYGe2Id8FyB0tJFkegbPCVP/nSPKyEtt+AgAMO4ACAAH4rAA==
Date: Mon, 7 Feb 2022 16:00:55 +0000
Message-ID: <0a39be87-0c0b-5ac4-8c89-6a4844034bd6@citrix.com>
References: <20220204173405.22759-1-andrew.cooper3@citrix.com>
 <Yf5HpzveBK+Ho3Nt@Air-de-Roger>
 <4555a325-96c5-4fc8-5d6f-a5fe0f47146d@suse.com>
In-Reply-To: <4555a325-96c5-4fc8-5d6f-a5fe0f47146d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91b69103-4538-4a13-dc5c-08d9ea530618
x-ms-traffictypediagnostic: CO1PR03MB5937:EE_
x-microsoft-antispam-prvs: <CO1PR03MB59377D2B7178ABD30165F0CCBA2C9@CO1PR03MB5937.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kpzwp94BXAnfAN4Txri2ppSaPQePrHBuapUS3raGkDNAGbn/Pf+rezRUGQHrXc7yC7if46PAlUTvO/CEwBvEWtHno2sO6i5SL1uT5cD0ygdcn/IBvJue940B0fTnbh23pJgSL96jv+SIDa7fe1PMFYW608CEJCJrvun/8hW1TwEhLTK/ow8crtoNzaDG6rH5230R/mYoGYwayqhLNJ5xdyqOKjDmnzf/JDY4roK/mtGqfpCKBmG/7IM/rFrlQ2sQY385ezjtVR574ImTLZP+K/ZNkKV9QUMxD+5wruv9W+DuQ2btUfieoxmFJioyhIlQj79PeAR6ILuFF0EF0n9ssTPG0hcUi/Eg4D29dF3q5py9BFHYVHJ9RsU24uCmcjevwAdwCPrSUvxDEeD5hWrko00YD0icRZ94z0cdW5GfZK1QplOf1K4UXEAQH5Zs3COvyG33n4aBM0ccp8T8zqL4cNdiNrHCBGcc3Ww/E4S8q82dWhLqarqlx5uhAFT/uWylnE7K1zRqo1xi5tTxwJ8i7+3cPessE/47CVB9DxLWYG42EVYQP8X4KJ5Rwyo2lJioL37sMm0YldK4OJwQQTthUIuMSeNKUkGA7Fw72gzlPbmzpGbX1gG8j/3gWoicjaYJSw8/x1cjMevma6IpUUpH62IR+cEOP7NS5BiWRxlbdwA9958A5zOPksjsNVOKjVe5rnhxpKteOeRtJc2o8b67VELdpFyRXs7NCXwO51cJHFi1olJSHPmDTitL7cTzmsiB2lZh9DvSPyBC++flRsz9BQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(316002)(6916009)(8936002)(38100700002)(122000001)(107886003)(64756008)(31686004)(66476007)(66556008)(66446008)(66946007)(54906003)(2906002)(4326008)(91956017)(76116006)(5660300002)(36756003)(8676002)(38070700005)(71200400001)(82960400001)(508600001)(2616005)(6512007)(6506007)(53546011)(26005)(186003)(31696002)(6486002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THN0UVpCcjBNZ2wxbXdPSm55ZHU2Z014aFBxaTc4amRReWJxUzFtUWVMa0NI?=
 =?utf-8?B?aDkrS2RCcUNJWGFZM1Q1cmFHVFdNMU1YYVJBVjFHNDZVWUJFUVV4WlB5SmlZ?=
 =?utf-8?B?WUNzQXViY2tNWW10M25QTGhFTGFoM2lVNUt4cHpMUmR2cUlCNVpUK200cFRL?=
 =?utf-8?B?cEk0RzZ4Y3V4RjI0QkFka0U1cjFzN2hWMWJCK1czNUJxaGJBeTQ5UEhwL1Rj?=
 =?utf-8?B?dWNFbEcwNU5DQXg0ZllqY0QzRUltQWx5Z0Q1SVgwcVZNSjdKZGY4dFp3ZHVy?=
 =?utf-8?B?Rk9rK2RxanRhbGdadGhRWGtuMFRnVGU0ME5jWWUxSGg4c3RUSnFyWDJsU1Fr?=
 =?utf-8?B?bE9KUEFwaStnMjlnYzl1cUF0WTVWdW4zWjRtT0VSMytDVnBkNVMzenFIU20r?=
 =?utf-8?B?NjliMTlFTlVoMDdLVi9RT2lCSE1WOGpHK3JMYVdEaVpnR1pqdXJONkJtY3lI?=
 =?utf-8?B?b21LWVNIUTFHQ1dLWnA5Q1NCTytlRHJTUm9BL29LUFh6NlNJb1ZKeGhnZkhK?=
 =?utf-8?B?MThGOFhwYVd3TU5IdFE2bW9hbU9sTWJaRFVUUk1leFVuL3JONHhSdlIxd1g2?=
 =?utf-8?B?SWhTV0tvUElGb0U1b00zY0laSm1GN0ZpYlJBS2hUK3VPcnNKaHR1UXVPK3Vp?=
 =?utf-8?B?Ni9Lc2VpaFY5bEFvaGFLYzE3T0VWV2RBaHFMMVB4ZTd2VUMxZUlSUHFhZks3?=
 =?utf-8?B?WVZWZWFKUFU2YWVLRitiVk83eXJyaUd1K09adlUrVWFYMTNVNU14eWRWWVBD?=
 =?utf-8?B?SElPUWZpQVJCa3dMTmVPOHlacnQrTHJiUVpDWlpxSlZHTnpSSVZ5TTBGT1dL?=
 =?utf-8?B?UURIVDE4RnhxYmNORHloMG9CbXBoYVdSM0E2ck9YTFhaU29RYzVjRk82M3JI?=
 =?utf-8?B?T25mRWZ6QkE0by85MUlNa1N6WjN4MzNlYWg4UzU5cGdRcXRvdHJTUUhodXZZ?=
 =?utf-8?B?cmo2dWtXMlo1UVdUbkZGMUJqS1FrV3BvUjlrajB5V0RBUGh2WGVTZ25DNzFr?=
 =?utf-8?B?TU4rOUdQbklBaCt1YXdWbEgxb2VVbkhWc1cyZFJJRXhaV1FmRHNvdEVVQmJn?=
 =?utf-8?B?MzFJRVNyMnQzdFVmanhoOTNvVUxXN0N5OVVvYmhwRHBaS0p4ak9MODVBdFdG?=
 =?utf-8?B?ckFjTWxWdUw3dnRQVmN2SkRydWxQZ3NLbU4vYzl1RnN6bUV2NkZsRVBZMDd6?=
 =?utf-8?B?YTlMV3o4VGwrYVJSR0tUSk1DaXhoM1dkRWZqc2Z0WG9KSlNhTzBDRldpWVdJ?=
 =?utf-8?B?SmNJWW55YlhrUGFmVDdHMkxmRzlMUSsvT1p1aHZHTlYyVU9zZWY3R2RoSndm?=
 =?utf-8?B?Z3dRWTR5WkZFaHh1bzZDR3plaUdWZU8rVVVvYSt6Rk1naTVkbmt3eEo4L0xr?=
 =?utf-8?B?QWM2RHhnazliaUMrbXVKYncra3oxOFg1NzB3eDFLTDlCTkhYNFBvOU9JY1o0?=
 =?utf-8?B?b3hnMWhDKzQzdzU1Unc4dDEwR2l5Z0NnVVdLRHNYaE52ajVDbCtQT2hhdEdC?=
 =?utf-8?B?djlycEJydXh3MkRkUXRaUStQeTBKdTl0N1NMUGUzTmJiQW5UTkUvV3owSnRo?=
 =?utf-8?B?MzJVWkZnQkQ5QXF4K2YzZm9VRUFwRVQ5WnFQQnRhY0tYcVkyWE9IZkU3YTI1?=
 =?utf-8?B?akR5WUpJRGJOanZYSGNTcHNjLzc1dnd4dEZ6b0RVMklZcSs0WFp2TUR0R0N1?=
 =?utf-8?B?UFNtUG1HODV5Qkw3TXBjY0xoeDB1aE1yRXhlaFdBRTFBNHIvMUtSYUpNcjhU?=
 =?utf-8?B?dE1MZFQzKzZUNmVJcWZaSXJWQTkvdXp2ZzRoRGM1cGJ5M01Dd3hHZ0FGSy9B?=
 =?utf-8?B?WDZ1cVIrc096WlQwYmI5THlyMnlyL1ZuREcvRmE0eXdWQ04yWGtxRG9kdFpi?=
 =?utf-8?B?T3VGS2JPQlFCRUVldmlMSDBEY05kendBNm9MdkdEVVp1WHBOR3F6YlVkc0M4?=
 =?utf-8?B?ZmVnOGtqbTg4VTVBMGpad0thYTdVMW9tcHhqa0U5T3Q5Z0xQQ3RiUDM2R3pC?=
 =?utf-8?B?WVBHdmpwZWxHdTE5UnRIdTUreGhTM2dNVzB5UWd2Tk9SOWU2Wk94cDU3cHd3?=
 =?utf-8?B?ZlZoTHUwLyt5NEdZN01sRGUrUzNxWld4Z2VWOW9UYndUeWtyQU5Ed1NkWGFz?=
 =?utf-8?B?d3RiU3NoOUc2SDZ1U29mZkxBcndlWld5Q3dOZUJadTQwcElHeGsraHRtNFJZ?=
 =?utf-8?B?RTdDVjZxOVRoemlCWHlhK1lZMUc0VHN0a0tzdW1ObzQxTlFEYWNTcGI2T3gz?=
 =?utf-8?B?ZjAwK0hleTRta2djcXZWVU5jYmtRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <55C25F31FD20C74DA0EBBB7A67BE156E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b69103-4538-4a13-dc5c-08d9ea530618
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 16:00:55.3394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g0QO8fUVNlRKRohMyvhgOESYjcxI8VPejrVM6GwLZOc0dx4hgTnr3aE4fWcGTLgsXJHVZ6mkH2Lw0zkZRQhIHKqAPG0tj9C0llf53UmBVWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5937
X-OriginatorOrg: citrix.com

T24gMDcvMDIvMjAyMiAwODoyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA1LjAyLjIwMjIg
MTA6NDcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+PiBPbiBGcmksIEZlYiAwNCwgMjAyMiBh
dCAwNTozNDowNVBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+IGMvcyAyN2E2M2Nk
YWMzODggKCJ4ODYvSFZNOiBjb252ZXJ0IHJlbWFpbmluZyBodm1fZnVuY3MgaG9vayBpbnZvY2F0
aW9ucyB0bw0KPj4+IGFsdC1jYWxsIikgd2VudCB0b28gZmFyIHdpdGggZHJvcHBpbmcgTlVMTCBm
dW5jdGlvbiBwb2ludGVyIGNoZWNrcy4NCj4gT2gsIEknbSBzb3JyeSwgSSBzaG91bGQgaGF2ZSBu
b3RpY2VkIHRoaXMuDQo+DQo+Pj4gc21wX2NhbGxpbigpIGNhbGxzIGh2bV9jcHVfdXAoKSB1bmNv
bmRpdGlvbmFsbHkuICBXaGVuIHRoZSBwbGF0Zm9ybSBkb2Vzbid0DQo+Pj4gc3VwcG9ydCBIVk0s
IGh2bV9lbmFibGUoKSBleGl0cyB3aXRob3V0IGZpbGxpbmcgaW4gaHZtX2Z1bmNzLCBhZnRlciB3
aGljaCB0aGUNCj4+PiBhbHRjYWxsIHBhc3MgbnVrZXMgdGhlIChub3cgdW5jb25kaXRpb25hbCkg
aW5kaXJlY3QgY2FsbCwgY2F1c2luZzoNCj4+Pg0KPj4+ICAgKFhFTikgLS0tLVsgWGVuLTQuMTcu
MC0xMC4xOC1kICB4ODZfNjQgIGRlYnVnPXkgIE5vdCB0YWludGVkIF0tLS0tDQo+Pj4gICAoWEVO
KSBDUFU6ICAgIDENCj4+PiAgIChYRU4pIFJJUDogICAgZTAwODpbPGZmZmY4MmQwNDAzNGJlZjU+
XSBzdGFydF9zZWNvbmRhcnkrMHgzOTMvMHgzYjcNCj4+PiAgIChYRU4pIFJGTEFHUzogMDAwMDAw
MDAwMDAxMDA4NiAgIENPTlRFWFQ6IGh5cGVydmlzb3INCj4+PiAgIC4uLg0KPj4+ICAgKFhFTikg
WGVuIGNvZGUgYXJvdW5kIDxmZmZmODJkMDQwMzRiZWY1PiAoc3RhcnRfc2Vjb25kYXJ5KzB4Mzkz
LzB4M2I3KToNCj4+PiAgIChYRU4pICBmZiBmZiA4YiAwNSAxYiA4NCAxNyAwMCA8MGY+IDBiIDBm
IGZmIGZmIDkwIDg5IGMzIDg1IGMwIDBmIDg0IGRiIGZlIGZmIGZmDQo+Pj4gICAuLi4NCj4+PiAg
IChYRU4pIFhlbiBjYWxsIHRyYWNlOg0KPj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDQwMzRiZWY1
Pl0gUiBzdGFydF9zZWNvbmRhcnkrMHgzOTMvMHgzYjcNCj4+PiAgIChYRU4pICAgIFs8ZmZmZjgy
ZDA0MDIwMDBlMj5dIEYgX19oaWdoX3N0YXJ0KzB4NDIvMHg2MA0KPj4+DQo+Pj4gVG8gbWFrZSBt
YXR0ZXJzIHdvcnNlLCBfX3N0b3BfdGhpc19jcHUoKSBjYWxscyBodm1fY3B1X2Rvd24oKSB1bmNv
bmRpdGlvbmFsbHkNCj4+PiB0b28sIHNvIHdoYXQgaGFwcGVuIG5leHQgaXM6DQo+Pj4NCj4+PiAg
IChYRU4pIC0tLS1bIFhlbi00LjE3LjAtMTAuMTgtZCAgeDg2XzY0ICBkZWJ1Zz15ICBOb3QgdGFp
bnRlZCBdLS0tLQ0KPj4+ICAgKFhFTikgQ1BVOiAgICAwDQo+Pj4gICAoWEVOKSBSSVA6ICAgIGUw
MDg6WzxmZmZmODJkMDQwMzRhYjAyPl0gX19zdG9wX3RoaXNfY3B1KzB4MTIvMHgzYw0KPj4+ICAg
KFhFTikgUkZMQUdTOiAwMDAwMDAwMDAwMDEwMDQ2ICAgQ09OVEVYVDogaHlwZXJ2aXNvcg0KPj4+
ICAgLi4uDQo+Pj4gICAoWEVOKSBYZW4gY29kZSBhcm91bmQgPGZmZmY4MmQwNDAzNGFiMDI+IChf
X3N0b3BfdGhpc19jcHUrMHgxMi8weDNjKToNCj4+PiAgIChYRU4pICA0OCA4OSBlNSBlOCA4YSAx
ZCBmZCBmZiA8MGY+IDBiIDBmIGZmIGZmIDkwIDBmIDA2IGRiIGUzIDQ4IDg5IGUwIDQ4IDBkIGZm
DQo+Pj4gICAuLi4NCj4+PiAgIChYRU4pIFhlbiBjYWxsIHRyYWNlOg0KPj4+ICAgKFhFTikgICAg
WzxmZmZmODJkMDQwMzRhYjAyPl0gUiBfX3N0b3BfdGhpc19jcHUrMHgxMi8weDNjDQo+Pj4gICAo
WEVOKSAgICBbPGZmZmY4MmQwNDAzNGFjMTU+XSBGIHNtcF9zZW5kX3N0b3ArMHhkZC8weGY4DQo+
Pj4gICAoWEVOKSAgICBbPGZmZmY4MmQwNDAzNGEyMjk+XSBGIG1hY2hpbmVfcmVzdGFydCsweGEy
LzB4Mjk4DQo+Pj4gICAoWEVOKSAgICBbPGZmZmY4MmQwNDAzNGE0MmE+XSBGIGFyY2gveDg2L3No
dXRkb3duLmMjX19tYWNoaW5lX3Jlc3RhcnQrMHhiLzB4MTENCj4+PiAgIChYRU4pICAgIFs8ZmZm
ZjgyZDA0MDIyZmQxNT5dIEYgc21wX2NhbGxfZnVuY3Rpb25faW50ZXJydXB0KzB4YmYvMHhlYQ0K
Pj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDQwMzRhY2M2Pl0gRiBjYWxsX2Z1bmN0aW9uX2ludGVy
cnVwdCsweDM1LzB4MzcNCj4+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA0MDMzMWE3MD5dIEYgZG9f
SVJRKzB4YTMvMHg2YjUNCj4+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA0MDM5NDgyYT5dIEYgY29t
bW9uX2ludGVycnVwdCsweDEwYS8weDEyMA0KPj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDQwMzFm
NjQ5Pl0gRiBfX3VkZWxheSsweDNhLzB4NTENCj4+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA0MDM0
ZDVmYj5dIEYgX19jcHVfdXArMHg0OGYvMHg3MzQNCj4+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA0
MDIwM2MyYj5dIEYgY3B1X3VwKzB4N2QvMHhkZQ0KPj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDQw
NDU0M2QzPl0gRiBfX3N0YXJ0X3hlbisweDIwMGIvMHgyNjE4DQo+Pj4gICAoWEVOKSAgICBbPGZm
ZmY4MmQwNDAyMDAwZWY+XSBGIF9faGlnaF9zdGFydCsweDRmLzB4NjANCj4+Pg0KPj4+IHdoaWNo
IHJlY3Vyc2VzIHVudGlsIGhpdHRpbmcgYSBzdGFjayBvdmVyZmxvdy4gIFRoZSAjREYgaGFuZGxl
ciwgd2hpY2ggcmVzZXRzDQo+Pj4gaXRzIHN0YWNrIG9uIGVhY2ggaW52b2NhdGlvbiwgbG9vcHMg
aW5kZWZpbml0ZWx5Lg0KPj4+DQo+Pj4gUmVpbnN0YXRlIHRoZSBOVUxMIGZ1bmN0aW9uIHBvaW50
ZXIgY2hlY2tzIGZvciBodm1fY3B1X3t1cCxkb3dufSgpLg0KPj4+DQo+Pj4gRml4ZXM6IDI3YTYz
Y2RhYzM4OCAoIng4Ni9IVk06IGNvbnZlcnQgcmVtYWluaW5nIGh2bV9mdW5jcyBob29rIGludm9j
YXRpb25zIHRvIGFsdC1jYWxsIikNCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFua3MuDQoNCj4NCj4+PiAtLS0NCj4+PiBDQzogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPj4+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4+PiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4+Pg0KPj4+
IFJGQy4gIE5vdCB0ZXN0ZWQgeWV0IG9uIHRoZSBpbWFjdGVkIGhhcmR3YXJlLiAgSXQncyBhIFhl
b24gUEhJIHdpdGggYW5vdGhlcg0KPj4+IHdlcmlkIHRoaW5nIGluIG5lZWQgb2YgZGVidWdnaW5n
LiAgRmlyc3QgYm9vdCBpcyBmaW5lLCB3aGlsZSBzZWNvbmQNCj4+PiBib290IChsb2FkaW5nIG1p
Y3JvY29kZSB0aGlzIHRpbWUpIGhhcyBhIHByb2JsZW0gd2l0aCB2bXguDQo+IFNvdW5kcyBub3Qg
dW5mYW1pbGlhcjogTXkgbWVhbndoaWxlIG9sZGlzaCBSb21sZXkgbmVlZHMgdG8gYmUgY29sZC0N
Cj4gYm9vdGVkIGZvciBWTVggdG8gYWN0dWFsbHkgYmUgdXNhYmxlIChub3QgbG9ja2VkKSBvbiBB
UHMuDQoNClRoaXMgaXMgc29tZXRoaW5nIHdoaWNoIGdvZXMgd3JvbmcgYXMgYSBjb25zZXF1ZW5j
ZSBvZiBsb2FkaW5nIG1pY3JvY29kZS4NCg0KPj4+IEkgd29uZGVyIGlmIHdlIHdhbnQgdG8gbW9k
aWZ5IHRoZSBjYWxsZXJzIHRvIGNoZWNrIGZvciBIVk0gYmVpbmcgZW5hYmxlZCwNCj4+PiByYXRo
ZXIgdGhhbiBsZWF2aW5nIHRoZSBOVUxMIHBvaW50ZXIgY2hlY2tzIGluIGEgcG9zaXRpb24gd2hl
cmUgdGhleSdyZSBsaWFibGUNCj4+PiB0byBiZSByZWFwZWQgYWdhaW4uDQo+PiBXaGF0IGFib3V0
IGFkZGluZyBhIGNvdXBsZSBvZiBjb21tZW50cyB0byBodm1fY3B1X3t1cCxkb3dufSB0byBub3Rl
DQo+PiB0aGV5IGFyZSBjYWxsZWQgdW5jb25kaXRpb25hbGx5IHJlZ2FyZGxlc3Mgb2Ygd2hldGhl
ciBIVk0gaXMgcHJlc2VudA0KPj4gb3Igbm90Pw0KPiBJIHNlY29uZCB0aGlzIGFzIHRoZSBwZXJo
YXBzIGJldHRlciBhbHRlcm5hdGl2ZTogVGhlIFMzIHBhdGggaXMNCj4gc2ltaWxhcmx5IGFmZmVj
dGVkIChhbmQgeW91IG1heSB3YW50IHRvIG1lbnRpb24gdGhpcyBpbiB0aGUNCj4gZGVzY3JpcHRp
b24pLCBzbyB0aGlzIHdvdWxkIG1lYW4gdXAgdG8gNSBjb25kaXRpb25hbHMgKGF0IHRoZQ0KPiBz
b3VyY2UgbGV2ZWwpIGluc3RlYWQgb2YgdGhlIGp1c3QgdHdvIHlvdSBnZXQgYXdheSB3aXRoIGhl
cmUuDQoNCk9rLsKgIEkndmUgYWRkZWQ6DQoNCi8qIENhbGxlZCBpbiBib290L3Jlc3VtZSBwYXRo
cy7CoCBNdXN0IGNvcGUgd2l0aCBubyBIVk0gc3VwcG9ydC4gKi8NCg0KYW5kOg0KDQovKiBDYWxs
ZWQgaW4gc2h1dGRvd24gcGF0aHMuwqAgTXVzdCBjb3BlIHdpdGggbm8gSFZNIHN1cHBvcnQuICov
DQoNCn5BbmRyZXcNCg==

