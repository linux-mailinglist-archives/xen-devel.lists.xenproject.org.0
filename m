Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0126402FA
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 10:12:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451615.709408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p125Q-0004pK-HC; Fri, 02 Dec 2022 09:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451615.709408; Fri, 02 Dec 2022 09:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p125Q-0004la-DX; Fri, 02 Dec 2022 09:12:00 +0000
Received: by outflank-mailman (input) for mailman id 451615;
 Fri, 02 Dec 2022 09:11:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Iy3=4A=citrix.com=prvs=3285f5271=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p125O-0004Th-Pz
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 09:11:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ad60cb9-7221-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 10:11:50 +0100 (CET)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Dec 2022 04:11:56 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by SA0PR03MB5596.namprd03.prod.outlook.com (2603:10b6:806:b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 09:11:54 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 09:11:54 +0000
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
X-Inumbo-ID: 5ad60cb9-7221-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669972317;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qGqfYDKqBnE+JA+A0un9mFh/4btTpntvJo/ky9FMhPc=;
  b=aCnE6ztxgrNJ+VxTbyEg9c+Wu+Ckpui0UpJSb1Qg9Go6KDyHxwrVOQ4x
   K6LLFRZV3Xl518tp8060ti5uMyIFwXevY4xZ+pPmFZE3s1/kWYgF+0GaC
   mVgv2p2FUlfz/SxmQ0FgRH+uyD3ZkZHt6S4TUiUTDkPSKcBqcrOp11P0d
   s=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 88751302
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:z0cvr6KQuWeR2sAVFE+RwpQlxSXFcZb7ZxGr2PjKsXjdYENS3mYHz
 WBLCjvSaK2OYTPwL4wjbYqx90pUsMXcyNBjSwdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5ARkPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5tJW5V2
 d02GgpXZyufjf+Y25Xqe+9j05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGNnGSd05C0WDbRUtGGW8RT2Fqfv
 GXF12/4HgsbJJqUzj/tHneE1r+QwHqgANh6+LuQ671F2VeuwUcqViIGdlSAqOa7qnylRIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjJIdtEOrsI9Qj0uk
 FiTkLvU6SdHtbSUTTeW8e6SpDbrYCwNdzZcNWkDUBcP5MTlrMcrlBXTQ91/EamzyNroBTX3x
 DPMpy8771kOsfM2O2yA1Qivq1qRSlLhF2bZOi2/srqZ0z5E
IronPort-HdrOrdr: A9a23:qGU2Ta+eKAZ6X7taLRluk+DOI+orL9Y04lQ7vn2ZKCYlEPBw8v
 rEoB1173/JYVoqOU3I4OrvBEDiewK+yXcW2+Qs1N6ZNWHbUQ2TQL2KhrGJ/9SPIULDHso379
 YET5RD
X-IronPort-AV: E=Sophos;i="5.96,210,1665460800"; 
   d="scan'208";a="88751302"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4RAXTsrCTtQDC65/S1FiR5xKGS36GehG6DR37FzKAZUc8cz+HGzulPddtrcqxWFvHDm3AlDeHzT+u05ueTzRwYXOBpe5hNwJE0zz3NqIWquycFWVc1PaMDpK4KnQYCuFKagJR4muj+RhPyDTlP0RBGUgMn1gWtXLwhY722RIX6f5vsV7DxBF4rV82Jl0DRjRENpCrPHB0oZGko2a5/4tCFIcGbXU+kTV7A51Ivk/vQaTSxgRC4+w4Rkf5KqZxJHgv/LWfj8kFrwRwPfjRZOz50tKNrHGZv2YrqIsRTBNhBUeL5RiXJSb1PqimrlPIwWtLWt+6ornU8j2GatcOBvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCxPQN/XSAifik1PuiUAu/19rYYjB+/g0bspy4fBNT8=;
 b=JDHddEg+otbqNNmhESoQoqy9kPPavPI5+6Wr6VgHjW01QsF/bIUybihWUHQNI0zQSnB6cOY1P3olQZoFHkdLYUkybw9soGKsGzLrLmN5c6kYj2NT1mTmKdOueFBMJ05q2IB+FtpqzcSadxkUAnioa6MX022xSpKkyof7o8+y/wji+Siq96yNLrPkmUCl2iODMJh8Y4vET2AgbgshVvH8MoW0V2msO7V3wwn9sxBOfQZtZuxqmQNGD4il9MlXeIphAosKBq75TbeZMmIZ7NbCxgPyV7mtc172BRQyF0PYco5r8K/iUzUNjG++Xh7yp9fadg9s91tD2V9QSurhG/T3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCxPQN/XSAifik1PuiUAu/19rYYjB+/g0bspy4fBNT8=;
 b=ChmOTKySmzQwlfqf265dXk+dn8SxWfHNk9jlPJ4qZGZLWuN3/fsAkPooaEAup0+inxcWxypvTl3Ae+UI2TIVft0364ZqqLSTLLXKVNMS2PfU9XNUYVipCexeE4UMXh3CmwxqmSoL7RyAT4vGvxxSPtLK4rGQty3S12VewgaRA/M=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Christian Lindig <christian.lindig@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 4/6] tools/oxenstored: Implement Domain.rebind_evtchn
Thread-Topic: [PATCH v2 4/6] tools/oxenstored: Implement Domain.rebind_evtchn
Thread-Index: AQHZBNyC07UMyecyUU6qY7XFpbA+Qq5Y5D8AgAAN2oCAAWBegA==
Date: Fri, 2 Dec 2022 09:11:53 +0000
Message-ID: <178073B7-40FB-4C49-9738-6CBC53EA8ED8@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-5-andrew.cooper3@citrix.com>
 <27ED9DA5-D63E-4F49-824A-74AD7149DA5C@citrix.com>
 <6c667e15-8a6c-753b-923d-fb5ea7839cc3@citrix.com>
In-Reply-To: <6c667e15-8a6c-753b-923d-fb5ea7839cc3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|SA0PR03MB5596:EE_
x-ms-office365-filtering-correlation-id: cec874a3-6978-4cdf-5c33-08dad4454156
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 l8njyPoIonQmyIcg5AhNA1nBkO9EW26EhsbAimaqxu4UbOwJSFe5L9L7hVsJMAEMozL6Zld/qn5pT+yg2RdmM3CW6lnxnZ9twyHLzE/CRb85/V2t1qhCGDupfbX3kIGdylYsL2vHQ0nHu5ckBzbRmpxh39CtHk2eduCIRkj6cnSXc1nnOkjKtPRUezu75SXUR3S1LLhxEPm9Qhv0gUDHWAf6+F98M8EKEQ6qJyDv/KlSwOXpmg/l0t7pz7fDPmYZ2OkGLgmv95GcFCceA5xnssStnnj4sL962s4bUBrN3/1yYbku3gllucwkmJsQQRwq+LAyqIn5YaW4jfJR8zcQ8wfO3DZdKOzNIHU8LYDY6afxoAUZ9z00DvC3+qsGwXvRMCe6ZnDMqjXMXU2dGSRmuIlKr5Hbsu/AceanF7fI91LL7n3QNcRqAL4v6RA4kFkzs7D8Z/oykmwlEwYJLZEIG+Y0d5zGbiYFSWaJrZ5hehRwXxezXNltwP40KDEAh9dznv0fEuSVvM33Odnhz8f9yxk4GrangRe1rNEZGdLqgvLRfKhOi2qSdYfUNVB9OvCvuquAbWeyckOdUO5a0k7fHThEeWQuaflSV/2o6W1shE16mxkVe2bmKUBN2l2cwHBJOPk6XuMEblCDhYXTIBth1341ulFbM8KPsNKwCq26OzTL1B5vHvQ89NwGwkljPVzNtS0hN+R20o3ENGW5YUvtYVITdVjFbspi3AO/M6gl0Xg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199015)(6512007)(26005)(53546011)(71200400001)(6506007)(66476007)(66446008)(8676002)(76116006)(66946007)(4326008)(64756008)(107886003)(6486002)(478600001)(91956017)(186003)(2616005)(41300700001)(8936002)(6862004)(5660300002)(83380400001)(2906002)(33656002)(36756003)(122000001)(38100700002)(82960400001)(86362001)(316002)(37006003)(54906003)(66556008)(6636002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5fwNvx9ZotFlIRbB0M3CYhBeEkgjRSkFhlkl3mhm2IaGp5/1oKnA0RAeOSPG?=
 =?us-ascii?Q?QPpfALELsHdU9nIp6P4tIXiDg4EQ6CRJL9ym/1v93LZuaEsDrrSHS1gmNeV5?=
 =?us-ascii?Q?w3wOrSFwm+RJDNFre0w2iA/6Uw7ecBCxaB9x54hVc1Z3FEBSnoPYerfpvIv3?=
 =?us-ascii?Q?FqoeRgZ5ngVn2EmhsHb1u+a7Qo3CWO79/MphBR3ge82Csb94Dfo8JTNvpIKA?=
 =?us-ascii?Q?sllSASjEIBXCXpQUqs/CvQJCkAMrWCyL+2PB284gDzkVnGoNms4voDq/nrvE?=
 =?us-ascii?Q?hIMzWI34MU0E+5+L9ZS0EGPmFuq11/sanXVcX3CQmqOJV9IXWwe2bdVLUXvJ?=
 =?us-ascii?Q?sqUNumWlu8THBMLYHef2Mu4Ar/6krguxWkIGbghRdcZxBcmr8kzbOvwedVzJ?=
 =?us-ascii?Q?QRuAJN1e9ky4Bo/mcqG+7Ld0AA5g6kZW6CrXA3v4NdHBsgulW4B2xALqRAl6?=
 =?us-ascii?Q?Mi91OojFaQApAw6Ux9DnPXQd9iXOglRn5Fhvpf4/oR5EieolZ5sHJhbkoA4G?=
 =?us-ascii?Q?UIPtn97NCxXVyjhWBYsv9gkpq5ObVq33u5gQJ0J2/mygArtV+CCgYwOGBC8M?=
 =?us-ascii?Q?D5r3c22TM+vY9VY+crIz+ec4DNQKzoWw8SAFeXaZq9GHkkXZ9k5sKvjnrQZG?=
 =?us-ascii?Q?XJPWYYB5fLe8OxhQSooWyvt9WuY/Tqsbb+AzD+s06OU3FHuH1HzwZhojE7Tc?=
 =?us-ascii?Q?Rc2EbToeVOqFqFK6Ukj5FBZjwA4HPTwUqbP1/2ghkoOQgmihaDMFajQD92bJ?=
 =?us-ascii?Q?DD6g0y7l6aUYWJja4Sq17ZtyUzk9etLaOg8qA4AsXwt7VaCKGph7LFJKK1Lw?=
 =?us-ascii?Q?QSMg0Gq2UDeIdoB84/G7q0azW2C4703dP/qO+z2sm9ad/xKOj0/31RQcoyEY?=
 =?us-ascii?Q?xE3Kab3IbJDm7QYL1fmOAIuaXQr7y8FJj33qKzBWTG8lBx0L+x4AXGaBfFx+?=
 =?us-ascii?Q?0FEitmHHxz7vctPr06q7AgNSmjRIeeEQO8fQ7t/0lSjka9QHxw0wd+Fu3vbD?=
 =?us-ascii?Q?049lM3tj0Yu9zQ/WyaB32lgyzSSi3azIuct+iDcqg+fR/h+vmuxzXF+hfu+M?=
 =?us-ascii?Q?Am3c3Y7TnFiKYGMzi2Qa2n1h45HyKKjfQwwlOfwKLeUopZ9rlybo97+5Q2Hf?=
 =?us-ascii?Q?AH3ulnJH/HeMPqBEr4QSMBnnPcT581TRmU5wJsXf2XJM4ZZXHVAFU4d1D7dW?=
 =?us-ascii?Q?P/fY8rG/tcHh8FwEFxaNLTGa/r26jLJyb5Ow7wuSNhKTBrumpa2J+F9cvx6t?=
 =?us-ascii?Q?q2sj49FrnvzvWlKH/x6pPwaOKtT8ZhlTAgf4PUjhDJI1CPj5P6z9kV+6QXjd?=
 =?us-ascii?Q?Cwk1xbXkbpkLXR6FI/itERVu8g6SNGCkjYqILbPTU8q8KNGZB5e0EvVdy1Ze?=
 =?us-ascii?Q?9/WRlAgjFuExxQloxKkVdSJTNIz0Togmd7ZMNSVPal606CDw4j962WSVGjM/?=
 =?us-ascii?Q?LnEZpm/ORgaPGxlh3Kc1ieqxAqnvD+0i8rjph6p6yI8aYJ/Ie5zQ9NF/yQEH?=
 =?us-ascii?Q?oPVOCMc+2CzVnu93SqZX9Wn9cd4DVyT3JsVhJXpgSIysck9Y5c5Qd3014e9g?=
 =?us-ascii?Q?TdBIqieyNqdaS+Y7ZCyeEUrmjG9/SRNoS7KKqotVz/qgoAij2p4fNhslsCuf?=
 =?us-ascii?Q?Xg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CAB272ECA751044DB7177D000F77693C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RpCFHsPVzjUc9apY5ydA9o3qgrvDF2gHKf7GME2YYLGplRkgjUGvxvRpx6u5vDpKprWl2esmKabkiUakeZJI+NG5D1+XHGJwX43+aLEkv8lEkpweLLMsnd66X44WWu3sLaRgPQoq2wq6FwJ8C8VNi7R6Ii9v/OaOKT/jiJy9oBRuiXO2sv2eNgUmzo7wRmzRsWj3WVQmY/rulYZbGM5ucSUZ1t2+LBoRfHa3MoD38X8BlkAM+2F+0pgc2mqQAvUZGpUvCKiffRJGt3pCAlj5usEtVqeziv3hkd1+zbSZn9G/XOYKSunKXLquPNZp/iB44IqD0maB+eeFxoe1NECsw/623/mHxabhyZX1HrbRrj01f/2lp4aM3zmGGVcrPtKQL4VhE6rC3i/gHhJ1I0wA9Lja2QESF7JXsO0h4FQ1NlyTV7AWsmFUK8BxgHIXb4X83RNUoqyurtQYreEansTU4ULgnQy9W18ZQi51ODToyJHk/jlWysHt6rtKXjKR/3cULgYMhP1i+rJqzDaItRYTDEh0qcaZZWy8i/bjjhsW4GWPbryvzse8gaHvVqMXcruTpzIz464LLosDIf+4ds8oaIyzjlgJLeZpkyXxV+6BnfIKEHil6aLCLTlEpwsDlHC7/ouPLkdvQtasDbAXnoiTFu+gI+I4m/cbsBBtfBpn4J72IZ99p8xiPTwr0zETk8l0TwIpZ+EkwActH4NGZQR287OP1pTaqdUAK+L/prrQqobP/twIChPM2/bDIe+MZj/ixDq1qghnZZGANTlbE8gGE35qhSeIpeFFDwTvrp6armU4wxGYzL4RZsh1hZK+ytfY
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec874a3-6978-4cdf-5c33-08dad4454156
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 09:11:54.0044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uX3HoJlmQkXnO96hoQHsHGIBbAU211s+diqJrI68qucS77q1Oqc05iTe8K5a7G2yMsLoEcPKzPATKaS003S7ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5596



> On 1 Dec 2022, at 12:10, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>=20
> On 01/12/2022 11:20, Christian Lindig wrote:
>>=20
>>> On 30 Nov 2022, at 16:54, Andrew Cooper <Andrew.Cooper3@citrix.com> wro=
te:
>>>=20
>>> Generally speaking, the event channel local/remote port is fixed for th=
e
>>> lifetime of the associated domain object.  The exception to this is a
>>> secondary XS_INTRODUCE (defined to re-bind to a new event channel) whic=
h pokes
>>> around at the domain object's internal state.
>>>=20
>>> We need to refactor the evtchn handling to support live update, so star=
t by
>>> moving the relevant manipulation into Domain.
>>>=20
>>> No practical change.
>>>=20
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Christian Lindig <christian.lindig@citrix.com>
>>> CC: David Scott <dave@recoil.org>
>>> CC: Edwin Torok <edvin.torok@citrix.com>
>>> CC: Rob Hoes <Rob.Hoes@citrix.com>
>> Acked-by: Christian Lindig <christian.lindig@citrix.com>
>=20
> Thanks.
>=20
>> The code makes changes around if-expressions and it is easy to get misle=
ad by indentation which parts are covered by an if and which are not in the=
 presence of sequential code. I would be more confident about this with aut=
omatic formatting (but also believe this is correct).
>=20
> I can keep the being/end if you'd prefer.
>=20
> Looking at the end result, it would actually shrink the patch, so is
> probably worth doing anyway for clarity.  The net result is:
>=20
> diff --git a/tools/ocaml/xenstored/process.ml
> b/tools/ocaml/xenstored/process.ml
> index b2973aca2a82..1c80e7198dbe 100644
> --- a/tools/ocaml/xenstored/process.ml
> +++ b/tools/ocaml/xenstored/process.ml
> @@ -569,8 +569,7 @@ let do_introduce con t domains cons data =3D
>                         let edom =3D Domains.find domains domid in
>                         if (Domain.get_mfn edom) =3D mfn &&
> (Connections.find_domain cons domid) !=3D con then begin
>                                 (* Use XS_INTRODUCE for recreating the
> xenbus event-channel. *)
> -                               edom.remote_port <- remote_port;
> -                               Domain.bind_interdomain edom;
> +                               Domain.rebind_evtchn edom remote_port;
>                         end;
>                         edom
>                 else try
>=20
> I'm happy to adjust on commit.
>=20
> When I started this, I tried rearranging things to avoid the "if exists
> then find" pattern, but quickly got into a mess, then realised that this
> is (almost) a dead logic path... I've got no idea why this is supported;
> looking through history, I can't find a case where a redundant
> XS_INTRODUCE was ever used, but its a common behaviour between C and O
> so there was clearly some reason...


Currently the soft reset code in xenopsd uses it, but as you say there must=
've been another reason too (the soft reset code is a lot more recent than =
this).

Best regards,
--Edwin=

