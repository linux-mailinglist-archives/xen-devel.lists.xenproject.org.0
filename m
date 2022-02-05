Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 339BB4AACB8
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 22:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266152.459843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGSf8-0008AF-UQ; Sat, 05 Feb 2022 21:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266152.459843; Sat, 05 Feb 2022 21:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGSf8-000885-RW; Sat, 05 Feb 2022 21:32:06 +0000
Received: by outflank-mailman (input) for mailman id 266152;
 Sat, 05 Feb 2022 21:32:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vIk1=SU=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nGSf7-00087z-1U
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 21:32:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02fb71f8-86cb-11ec-8f75-fffcc8bd4f1a;
 Sat, 05 Feb 2022 22:32:03 +0100 (CET)
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
X-Inumbo-ID: 02fb71f8-86cb-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644096723;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4EloWy78GVyeOCzWi6VlHtbP+brzLx9/WSU0ZrbQUHo=;
  b=U4EW07I2RqvKcZtdHNkBYBd6+DQ0BlS3OPqqNmPH2sTX8CQB2dFtGwPz
   QjbWr1sWkcp4/XzcfYehM413MST1v6tOC95S8LPmTwDz5p/QZNmtHe0iy
   3kxKYXGvzFvcLaXFTryPYSiUh/icIKG2xcqyKGexNyC4eqN7mEuJ8TG+Y
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fEznHv0NA13M42ubL0inE5u9jFO9O5oU/A0C9zhcX30sJEkzGy2FRrJ4tiFRlTZwIB0CfEtWJ7
 iBq0fT4vYLIYBU5s+xAd7sWrdDM/MCLiYAiUES3BvEgW18qIv7jxfT2rYphGwLKTtO9mx9sbCv
 gSPJ3c2ETbRp148sU9PAgjTt5DrpVvhCcAHjyUYae92vKjNlKJn8+slpQUUJ842kIorDgb70Wp
 5ygJo/j6h0zfDG/dtcAUVetTkz5W3VAyp7gwIMpklIYBDWMX8zKROieY3UcVtyZFIwQYhDDSv3
 KdtO56NzEg0H2OkA1KlRT1Cs
X-SBRS: 5.1
X-MesageID: 63574984
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jwpydK+Nm5CgrNh0shGYDrUDYnmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 DQZUTzUOvyINjfxcotxaYu+9RxUsJ/RmNU2SwBspXo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rh39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhs+
 Ytv7oW+RD0JHYLX28tMbjVREg1xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwMIc7xM45ZlmxmyTjBJf0nXYrCU+PB4towMDIY2JsTQqqPN
 5ZxhTxHUEqZf0RhAG4tEblgjO721lnHUxllkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqH+5y3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYBaoRySPQ05Tut6YXPoCnIO0QNTxJOPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPc1
 JTjs5PGhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvG0mfB82bZhcJW+Bj
 KrvVeV5vsI70JyCNvcfXm5MI55ykfiI+SrNCpg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDFbLEu1tGAXVMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQpWdChgW8Gq9JA/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOmHsU9XoS1pMCoyE0yv3nR/M4+j4L1GL8k8fKU99fwlxvlxF
 qFXd8KFC/VJazLG5zVCMsWt8N08LEym1VCUIi6oQDkjZJo8FQbHzcDpI1n0/y4UAyvp6cZn+
 ++81hnWSIYoThh5CJqEc+qmyl685CBPmO97U0bSDMNUfUHgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExMDTWfB7LuwOS3LxUaZwNdNALSSYDTQdGLo46H+N
 +9b+O7xba8cl1FQvosiT7sylfAi58HirqNxxxh/GCmZdEyiD75tLyXU3cRLsaERlLZVtRHvB
 xCK89hef76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgCbQORjCF9LaduNNJ3y
 Ogsj8ca9gijh0d4Kd2BlC1VqzyBI3Fov3/LbX3G7FsHUjYW92w=
IronPort-HdrOrdr: A9a23:Hc9uN62D40dI3vmiMMCgKwqjBRZyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/heAV7QZnibhILOFvAi0WKC+UyuJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZm6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngdOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k/Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXIISaCUmRMXee
 v30lAd1vdImjXsl6aO0ELQMjzboXITArnZuAelaDXY0JfErXkBerV8bMpiA2XkAgwbzYxBOe
 twrhKknosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfVsRRx2xjIlLH4sJlOz1GkcKp
 gkMCgc3ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNwd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDmRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dg/22J6IJzIEUaICbQxFreWpe5PdI+c9vcfEzc8
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.88,346,1635220800"; 
   d="scan'208";a="63574984"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2gWORwSj6lwkUl9IT6OD8KglYuzU9X/cCoJ6HWjh81ny6nCF97ZMPXxBj7L4jfctMXYmT6n9Eok51sV91vVPr015/LKTDjfzaNJ/OkXFl88N1dQDTCDg4hkGhvAhRwGvtwZiRfQgvvVQi30Yj/jrgqWEKUOjx9y8x08NN0UYGcIf6Jiv6s8tVPA1jIfM6RUZT1zUJ4OQNd1BA0zSCs6ZPS+KqwLBYH52zFwCypot+iQpszvKBnj4UHY6ArvQ1sIPNq976f3jG0kVC5b6HGex4m4Axzw52bK20PV5v9b+HaUPeRNQfTAmAjtggnVRYuBzog1h+FsIobLGf30eSeAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EloWy78GVyeOCzWi6VlHtbP+brzLx9/WSU0ZrbQUHo=;
 b=NbMbB2Gjvhf0xiIIXBFLMnAnhjtPEgPL+7AlWJdcM6SMnkJXKER2FUJZa/qECNDbms2CKNc14vJEJ93m6AzujRdr9jC4u0fMENrAK3p1ckAak6WK03I2njiiti67YGNOsKwTe7Vv3os3bOGVqjOPHbqfiqN7f4raR8TbuBc46yCEk0xw5HvPLfBSmRsPDii3sRh0vJTglCscM/R/mheQJlFL9Ln8NjWNNMKbTT+Y06LtxIS4j0Q1J20TELu07zOJ1/Fe/w2DZj+042MrIQZFJ4c9/Y1lJneaLIOZkGJO9t3VVbY2ax2PcwX8ZX49CE61h8uK7ji8oLnVJ5OFWkn2jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EloWy78GVyeOCzWi6VlHtbP+brzLx9/WSU0ZrbQUHo=;
 b=FSplxvzZkFriVbR4Tq/ETd2yOaqFUa7Rn1bV7C6L1zm+Fv5op5aOu+DY25L4neUPsz61B6KGhvq6lD8/v4m6SQlHaSKT742zM9Cao84mE90WpmnWVUC0ltq1DtkHiterz5U7s5lpBjnq5ESC46AJKXZum9CVte/mMz9H6XfOzsM=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH 09/16] x86/P2M: split out init/teardown functions
Thread-Topic: [PATCH 09/16] x86/P2M: split out init/teardown functions
Thread-Index: AQHXcbhcry3GWuRhgUGQXT1+yvRBDayGzBSA
Date: Sat, 5 Feb 2022 21:31:39 +0000
Message-ID: <DF086923-0C6D-4F8B-9D19-6714F24E9456@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <01024f3c-22e9-cdf5-46b7-c9479c8937b1@suse.com>
In-Reply-To: <01024f3c-22e9-cdf5-46b7-c9479c8937b1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 386cb861-8cb0-43dd-ff0a-08d9e8eee56a
x-ms-traffictypediagnostic: CY1PR03MB2170:EE_
x-microsoft-antispam-prvs: <CY1PR03MB21709F520AF96790E358EB88992A9@CY1PR03MB2170.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J3FNri9mN79jv6mfBcsRnMSSG4HsMRg5lZvlcJ15eZZY2InEgWbNKmvduJvXLLKzXLMQkDh/kRDLlMdNy2Obv0T+6eDVfMkcwfh6RAMF/a6raH2bGaLglso97SWivY9HUyd7iBkMBl+oLl9lRSTzUPleAE1Hw926huxB4z5baAkwTBn9GBsiWyzvlaDheAlcbQtEAxz5uhdlEeeB0WyfsoFA1w784yMU1kaK9jjBsB0tB4Nd/z2msyGoHV9aXARR2wnjuJtx202S5oN04sFpWYpcphem8hIEcoZCGDs5XJcEgUV4TixDhkRmALV9Q+8XgolQqFU3fgou5mud4MC9OvA9BrDkeFPVLKjq7ENS43m2cMyETZAP9IIVxA9sM3XBHAb9XmcuS2Lpz+4WpGI4P6Kyuek3QcKxOgK2FecfGke5ifOs9B72I4sVCiEJYP7wM1x2CHykfEue4V375RSz5OeH8b+1FrEyrm2JeLyZ8mPnT4IqTb3UoVwDGFgRwalVhcCs2XtTY6Wo9HgtqDNcgBm8lJyRlsTkVmw011helEZ4oKlev3TDkGsw6HTStvhAcatsWzNbFz/xDpyOB5yeTTK/+59UlXa7GORJ54E9ug2kGCW3nkfbjqd90BB6F0SvQFcPLasZ0ZaxgbWoArVQj9E1TZ3uYe1tuLyPLFHwYQqMcHGmBi1HBD08Ui8HJGoCqJQKAKY3AjqSpLwtL8jrJaYKoavcUiUUQx/duuzr42tZaoWusKTjcuQO6tlnMP5O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(66946007)(76116006)(91956017)(26005)(54906003)(316002)(6486002)(64756008)(4326008)(8936002)(66476007)(66446008)(66556008)(8676002)(6506007)(6916009)(508600001)(186003)(82960400001)(33656002)(38070700005)(6512007)(4744005)(2906002)(107886003)(36756003)(2616005)(38100700002)(5660300002)(53546011)(122000001)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gwQfv9tB3MfEcfd9oOTC3o5YPiz3u0y77WPzQliCtylJzhmWZdo2/TdBFQiT?=
 =?us-ascii?Q?bv7VesCxmIWaQEL/wurqlyI3LQIz31vR4dhzaGNMfVMh/mOPO+ArYMzphety?=
 =?us-ascii?Q?hu4DP26IxvexQxs3P0EOcgMK0Zq0nJ/ISscFRAGrWi+DYCDJ0cRot4Ft81Uj?=
 =?us-ascii?Q?cBMgtAswnkyeGfzNVbMZHnKvoM4n2oVbsMImm42uRHIr5Xv1kEUrZiOcR95R?=
 =?us-ascii?Q?90c4zFTYhza4XOs/3cwcZSUp9nif+7/jTAsruBokU2nHdegd/lTmZd+lOYOb?=
 =?us-ascii?Q?w4ZxSbSKA58rw1igUwuwCQ8jEIlJzVG0nH2ClUuoqyCeRVDsbqBQAz9oJvo4?=
 =?us-ascii?Q?KMBQR8DA4nDfkvXsxKjQHX+d9Tvb/WtiAAMctO6/l6/KQr/g6fOK//vGS6zA?=
 =?us-ascii?Q?FjIDGyu4ewQ9MFS5w/k8SRIC454Juc5Gn56gbjmV9C53QIopmnUGWkVig07Y?=
 =?us-ascii?Q?+FsF3CkMXEypHGAjlfRtvMlwof9MYTFHdQz/ZDUrD5S0PMMdEy6sADOgdzuI?=
 =?us-ascii?Q?4nWGKayoDtRCkUp7JQGqK0MavQ8pZ0ctRkO8amGzg2itb6Q1BtGoZVBCGnwv?=
 =?us-ascii?Q?yhMWelnKnA3ucBQii2KRfmCw8vLjVOFP9fAUxSlDy6g8L9758rDUOHugULMR?=
 =?us-ascii?Q?+VAdTAex1UAvRy9ibFxBe1V8v3PbEXZShxXGqg4RDcdgiXelfUF/7p6epdbl?=
 =?us-ascii?Q?K/UvMglgNY7ZeWN0Apu+ZmVKyh69XJPGrN824xk6I4tFiMR5o7QYRuFGUmRk?=
 =?us-ascii?Q?Uvst0y2h+vBC/Byvqlk8HjxBF64gvQH4+8Eixh5KNNhhUwpPHoAqnLmmJNBi?=
 =?us-ascii?Q?bdaYIWaUxoktxIPqmy+Wol6byt8GZvlVFequ/IgnXcCiN5TXRhNbby/MtPEH?=
 =?us-ascii?Q?YURXC+4FJSfq/nW6j0pUW5Jdh9Y1NQ52GiT0cxJ6I0E4xV0NHQt5xpWZJEOL?=
 =?us-ascii?Q?aYsg87gNbRDkcDje/cmdF5XGAChW8jHMMLyohow4s2uORVtbxu/q3oRbeYSn?=
 =?us-ascii?Q?ISmr5i1ASG6/usNVt8J7XJsbwixqgCvH85yd9rXu/J6kD3CSDv1lyydGGIB1?=
 =?us-ascii?Q?H4lgGlC6vCpNSROIL83Ev/p/Gw6ZKArZ9nBWxT8+C+CnI3oqdTJkPORxqQUC?=
 =?us-ascii?Q?3JYa0s00SWmyRVVJ/sbhOZ6xjKB+tMGlzV1Z6aOdzVT1osZJiamk+GxUcdjj?=
 =?us-ascii?Q?xk5ncawMZPOS/zaKM2O29onpXxcNguWvw8n8uR1oHddqsPypN0pIPHwy2rkD?=
 =?us-ascii?Q?nFRND1vyS/N0ARYRxv4h8DWxpbWIacDIrXDG+seO0VcUEtf5migAUIoC9p9J?=
 =?us-ascii?Q?Mby7nunpeaOma5UrX5inNDCyLJMiDkvX0r3aHZ74Cq6Y6bpTmDSonJm47PLY?=
 =?us-ascii?Q?G9DKIMBN1ipjjWYxDqJzItlvLQ2etqCYgiDfrRn6Uv38Mlh5fU1Qeo0cDAmf?=
 =?us-ascii?Q?Pxzh8XAH2w73l/ZbIvAc9Q/cF1HLw2geOEl/KhTnPQE+7b+d5zzD+tcHLgSt?=
 =?us-ascii?Q?wAvRJ+HMU+JjYL2svYM8YXE6L2GlOO0EGJl7hNxJs6uGyPHOVZO1y/HQTI1D?=
 =?us-ascii?Q?QiK+ys8ei7oJgcUMA+pVuQq+6d7J35szs7JG/0BeBU5BUscwKKosEZg7gDoe?=
 =?us-ascii?Q?Micb0amV2zB/4H1TWBHwDMzULJZiJBvQVwVB8Xx/IYUOfCCX09G2XqP30i6d?=
 =?us-ascii?Q?CLCfKoWu0uk5Hl+EPF+Ng01d2BE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5DE10B24C88D5540B4A99F876D62C4AD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386cb861-8cb0-43dd-ff0a-08d9e8eee56a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2022 21:31:39.7397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pZGvY+QhDDiEbpD+2oBdwRn0TccTHw906ub8uQnxQP35a+CgDF5Oy/A6ZSo8lb6+oARVkIq8sBIZuw9MpTlETHXZov7i0LXoUVD0ZwG2xi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2170
X-OriginatorOrg: citrix.com



> On Jul 5, 2021, at 5:10 PM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> Mostly just code movement, and certainly no functional change intended.
> In p2m_final_teardown() the calls to p2m_teardown_{alt,nested}p2m() need
> to be guarded by an is_hvm_domain() check now, though. This matches
> p2m_init(). And p2m_is_logdirty_range() also gets moved inside the (so
> far) adjacent #ifdef.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>


