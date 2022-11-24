Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D26374B1
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 10:04:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447882.704486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy896-0006pM-Ha; Thu, 24 Nov 2022 09:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447882.704486; Thu, 24 Nov 2022 09:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy896-0006ms-EM; Thu, 24 Nov 2022 09:03:48 +0000
Received: by outflank-mailman (input) for mailman id 447882;
 Thu, 24 Nov 2022 09:03:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgHz=3Y=citrix.com=prvs=320318b1d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oy894-0006mm-GJ
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 09:03:46 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e506ce48-6bd6-11ed-8fd2-01056ac49cbb;
 Thu, 24 Nov 2022 10:03:44 +0100 (CET)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2022 04:03:41 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by CH0PR03MB6018.namprd03.prod.outlook.com (2603:10b6:610:bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Thu, 24 Nov
 2022 09:03:39 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%4]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 09:03:39 +0000
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
X-Inumbo-ID: e506ce48-6bd6-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669280624;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zcCG5udjDTd60vGA0XtZJWIEXrmsY7jYl7XnL4B9Kus=;
  b=eVQPCwV6hI+BwoSE+Iq0m+4AKlkv22saBZNwRozUatoxt8rIpSDqp072
   Ucz835HppMP87wgnFdgZd+M5FEbp28/wwc0Tp/0UHFr8Y52jtX+MZc5lS
   GVSpT2UVVVq4IZThY2kYVKd4gO+44nD3KsVm7NWp9rtsffyitwm8LhjRS
   k=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 85902243
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3g7W7aA8Gkn6vBVW/zriw5YqxClBgxIJ4kV8jS/XYbTApD4k0TFVz
 GcYXGCCMv+DMTCmeowjadvn/BhXsJbTm9VqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpC4gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwy7x8GGFD6
 sQkJS1RbwKPociP3birc7w57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDK7IA9ZidABNPLYdsKLQ4NJmVyfp
 UrN/njjAwFcP9uaodaA2iLx17eVx3+gMG4UPJ6H6NBHiVSi/WhJAhATe1CQo9e/0HfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAIRyBMQMYrv8g3QXotz
 FDhoj/yLTlmsbnQRXfD8L6R9Gq2IXJMcjVEYjIYRwwY5dWluJs0kh/EUtdkFuiyk8HxHjbzh
 TuNqUDSmokusCLC7I3jlXivvt5mjsGhotIdjukPYl+Y0w==
IronPort-HdrOrdr: A9a23:uzhcPqPmmh4IB8BcT+n255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4k3Ez5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDy+IiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ/+1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh77D3vXklVavoLhiKr7zPI9
 MeSv00I8wmKG9yWkqp+lWHBubcBkjbUC32GXTq8fblrgS+1EoJs3fwgvZv3kvovahNNaVs9q
 DKNL9lm6pJSdJTZaVhBP0ZSc/yEWDVRwnQWVjiaGgOhMk8Sg3wQrPMkcIIDduRCeo15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIRGmmRzzixsxX+pA849THNfHWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umKWf1A45G0wD3RpEXI3gDV88evMo9Rju104r2A5yvsvaefOfYJbLrHzphUmTjAm
 EbVDy2P8lE5lDDYA6NvPEQYQKZRqXSx+MCLEGBxZlj9GEkDPw9jiEFzVKk+8qMNTpO9qQrYU
 oWGsKUrp+G
X-IronPort-AV: E=Sophos;i="5.96,190,1665460800"; 
   d="scan'208";a="85902243"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVAjJ3SOKDILnR2kZUZpV2iDijU5K+EBQftX1nDXEJQ6iMLVJA1SdZL1iWHR+ohpQTc6+gTB6BOgYuhPtDtMkODNA+QuVmCpyIxfNHVl4a8gws8BxwXGRH+ewPsJ7F4YRQahm6260EKKmwPqjAb4T4S9k94uB2JaQYOjwasOViXrJPPqUOj2l4l6CZnFcDdUHH7Jzz5lkhJMe/tLJ8ZFmFiEdO/Uw95UVTxplin0oviBFh76YdlVWf05el0FXUzeZ/vkXZCTZqdkSk1SwJRbhQ3wyggDRYH/nW3cKe9wIatzMnZQResuForz1L1Pt9PQWBEjJTq9KbS4rbR7r6w/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4txyeginBu/kOfSvafDgkOYRjGPI7REkWR5lx6EyLY=;
 b=jCeY8Gsa6Hwg3cObmXB9QwYnw6a7sgmmgFaaqNRsbh1cdcFYEHnb7wkOp0TaipAYaLMlLYYt/TuzTe8aYZ3zjMp0U0QR2iUB3qdLi7CbVwy5CDj4ozRIXRgmazBF6uTE1uYXvsHCmBh0Ca08uQj2m+iPt3tE8nXSE/NDbn87FZ85SVNjUOtMOSAk1DcgdZkMp4fqHvs4O5hgkrPEzZJTKiSVod90Ebbhiv5h3AHwXhEOexhP3bXh1EkwGwB2J5wy14VtwpU+cAxPRcYDZ/H72HNnj4WDikNoLnrx2D/gABn8lwF1jNy/0FWQnhkZVWNRow2QYNcHeA0bDQcmV05eRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4txyeginBu/kOfSvafDgkOYRjGPI7REkWR5lx6EyLY=;
 b=B07PIK9PiGPpGp7yuw+17MBSbSpP6qbGKYzrHDm9TINXFSXGZh2eAKkEEqvaong1bsNvrFgRUPyggRacZwPniJKxf/gJi6qYov7ZIQze96744YtWtGtvXllZ9towGVyp55BVvdWxzhXXtf6CQvyZjxdTSbKiX1WhWrIyh1PAVOQ=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH] tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free
Thread-Topic: [PATCH] tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free
Thread-Index: AQHY/4p9nL2l64sg4kKJKi/wcWyqlK5NyCiA
Date: Thu, 24 Nov 2022 09:03:39 +0000
Message-ID: <D28C9584-F900-479E-AD23-64B8CEB879B2@citrix.com>
References: <20221123222517.12140-1-andrew.cooper3@citrix.com>
In-Reply-To: <20221123222517.12140-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|CH0PR03MB6018:EE_
x-ms-office365-filtering-correlation-id: e74c76ae-ca74-4578-3bcc-08dacdfac743
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PWnE6VQlHHW+gtT8yTVdawX4uxYbhUOYbunVsD09fY/puITDIvMenJvPUT2O3osvjebJshoS9XzBtljiDRtsP+btdc/55P9Aw3cKEwBkmEsIZUiSkuJaxnlSuDeCBiiu40ss3k7Jpeqa3zg/aEXo98laxMfptPoJ/GIWZE/mgwNeEWSpWaqyxCDq0rSnXAswaPvETeK8aZ0NAXelFUjUCtO+qOVqonTl/uBLC/Ay5mRVi4/SdP6MllyyRgd+WfkwHw7wnMRoYplPCnnA8Gi7bB/WKozUeSJfIjS494ct5abcItJbAYAYybsjxANdJXg0wDIDXWrNll97im19lT9GHBmWBZgPmfgpKZ3DRtahKwrrH322yo3SZ+I44lge34ww+bm+tK0Tn9jC/q+cPRknYx7Uv6nSZ/Mtk+GkpBVdMCphvyAZ3nrPSt/clOubFyaGLSlEmNU8dZCkUpl3IzcZIMAaIJJkN+m5BvhK2OqazvQEYxPEgdm5TjOKbEIYcpoDaE+urbKjXm7mf6BCMTHIIrys8WYWlvI/sjEAQJWgLurdN4RRoVQxa8Q/sshmHMeJrI7nQ8sgK1ZAC43+L4TwAFIxk/nDjai2lx/guatKPUA6chEoGnHvAFqS776Go0Os3S6FhhAOJZwlSoO7luBrDlVkaowoqa+3X7mhju+EaThNpxBs0sof190yEvHzlRIZluMFuHmzfFjwGxyS+PAk8UZzYfKaPJcKfrs9GgYF+SfHYhpDZilQ2YfWX1v1mCI+hvpDSr6kni5JrF68VGwKww==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199015)(186003)(6512007)(2616005)(5660300002)(53546011)(64756008)(83380400001)(38100700002)(82960400001)(2906002)(26005)(316002)(122000001)(8676002)(54906003)(41300700001)(966005)(37006003)(107886003)(6486002)(66476007)(4326008)(66446008)(6862004)(6636002)(71200400001)(66556008)(478600001)(8936002)(6506007)(91956017)(66946007)(76116006)(36756003)(33656002)(38070700005)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?av56NDAER26UcPYdPKzYKEw+wWPRQNKMTcIKdRNmoZccKLqzxgReNrNYEFyp?=
 =?us-ascii?Q?svi23R18r0bi2w9UrRZjPFaqMdhM6FFeSX2TNyIKa0l6b7qyXOb5UlvuuDk2?=
 =?us-ascii?Q?iD6RB36NUV4YyQsjwCtTliFwyEBvejBAiybNZTJvFV8ooQklhPRbtrAFQ+OU?=
 =?us-ascii?Q?oFK0uqztRb9BckQSkMWJ/+f1kUksw8QfcFNeZn+H1/6eAk8fZ/lYs/V27Bhr?=
 =?us-ascii?Q?vfKbyRv2yCSltozvvGQ3hZIatTMEzNL5qzEupCnHRABxrDmTY9K5uW47l2i9?=
 =?us-ascii?Q?4YMul4cSOubdEf6QvyOjiFLVj87XuMZ3W+LdeURgONWyuaTn0EJypk31Yfmh?=
 =?us-ascii?Q?MQ0xqDRRwSI1GRoJyrCpiQPam+FYv9qqWUkFPxLkn2SBZ4jklITZs318EXTh?=
 =?us-ascii?Q?BTW52GhemtKcE+AOha74bPlatUJEQ/9FVlq2RrBaI7eB8nMkNO8h3wdKWui+?=
 =?us-ascii?Q?8bw3pGpwkG+BdJDKdWdfHp+MyTlBerEEChidYzH1/KiALw9RV0mS3yAKPC+2?=
 =?us-ascii?Q?T5GokANhFumtMKyHSoOs6cRh2RrPbYCYYJY86NNj+j4w2ksNNSEFF/vXurxa?=
 =?us-ascii?Q?vBFC9fGcFNiqjsV8llo49WROKTeXLtEPfhK0eEO85K2Q82B1SLunpDjM0e/f?=
 =?us-ascii?Q?lYrUTOg6BdxqXB1lbVmhwsa5PUs0I1tp3QCjn0heIZI7L6K8HpGOT04j8NMZ?=
 =?us-ascii?Q?4Oso2Vxh5nwtQjZAtn4y0y819f9NCbt4Mlc7YocX+L1UD/f7dh+7OkR8nUc8?=
 =?us-ascii?Q?ZXWu6FS/EC04rtruf4llhT+WZLdUYWHHM8B0LzOH0/txr47g9S+RZqVj4Uuy?=
 =?us-ascii?Q?qG1Fw83BUWJJdr8gLh81RUNTRpSEq9qfCJVadfVD5ZWrupqzXCL7ZvCLqyUm?=
 =?us-ascii?Q?2Lia4KZbcXD5+KYjjdkkbmUo4n1RfY8FO+XUsuAm0kDUJVhwCsepzf6+0sa3?=
 =?us-ascii?Q?ExrrsOVZaEocpq8KUWZ37f2IOI5vA3hsgkgu2GrJh5ZfKqGTneCEvk3Rj/LI?=
 =?us-ascii?Q?VawPa5iyNUZm+n5MZQnj7K2d8F0279u6e4E07n7lbvOMRTHSpKS74tW2HErY?=
 =?us-ascii?Q?YTTHGM7sm+ovkGzoXiDe46PyxkAiOuz7aN0BmWf7iEHDNp7dNTC05vy+h0zZ?=
 =?us-ascii?Q?qDYhZAM7r3MTuTEGSc2zznBwuULjHXjB0s67NxxCmiEozccF22EUxqyK3fle?=
 =?us-ascii?Q?5Wkc1agAiUW8mFupqueH4iuDPZWfX1ZDLqeDlzZlO6fNvrnoZj0vrQmdGlK+?=
 =?us-ascii?Q?uc0unJapnD7J9juQko+60PWKRFLajHUqL/8x6kPIxJLPmLbzo8MFUZtOUsXH?=
 =?us-ascii?Q?iCDz2I0zbNjfkDmcnpVmvwVNswfMX0WhxfL+0A9iCrXSBA9vnE4REutu9hV8?=
 =?us-ascii?Q?jQ1mpl2crX6KyXZjzKX7mf6vVeWIlP7ZcwVkNLf5y1CcRIQe43kIGLp6AnDE?=
 =?us-ascii?Q?MTlt43Ox0xBH/mrZLExDSnsAgz2nxiOoc4F7AYC/F8xRnhh6tVypFH2TPmkZ?=
 =?us-ascii?Q?A7NLotnVpfQn72zC+qa5vgVLJ5YOKExkLbvApYE5IdCBnYn7KUZhRrpD+kYM?=
 =?us-ascii?Q?gABxZx+7asWwsuNrrAeWtD8LOsNfoecHH4mxO2+qmDG/De1GxyDvUpRAwLdl?=
 =?us-ascii?Q?VA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FD238443DDE4A44C97E390CE0148EAA8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CaAbx8SSCukWWn85CRy+2pVcCv8aqQ+QdNBovsmfVO6A13Ly8evsosLaKG1xjgLz+X8b3XrI9qbKAMUldrQSC3Y5g8/QSH7SHMW+22TTv0sNQuOkhRMKKmPrCW9xz3CDJxyoOYvZhougYQP+AwaqY8CWM3ThNGIN0SE0UJAjuCodwFpB16BcHuI1GyJ/FKyn1QId0b8v0AWpIS2OB5C4R26D6SrCCoeLo+W147Sy6BOFhT2tyF3huCudxDWvnUsIQoFFjVZwYxYFyMmpQmadHNr7hKRDAgb+41xQHd7phZLmyc1j/8zRlQVgqpI/oi85/lQyWmwg4gCqVqADs2SMvIw26Lx7w71lFrxWstqdP9DssksyCh0vfNImfNpJbptNMft+BPco0npUMAqEMgw8siWCtQFCDypSZRtnm97H8TdIy/ycHwgV2JJreVwNCwBWs0ZpbWWDa1g3eS5Od4gHkzb3nj76lbNfHIMPqSQlkqq1QCTSz2mjMB2fSbUiHC6LzHL4PJyhfTUWzetVoAqMLvG9zGvMCpI6LoWmapdwcBcnnk8zyUXVGavJR1rcr/G29+wbdhHQpdotph5dTKil2oJSxVirDO6QzslkJUy5/48Z8XWmepK5n3n2DD/MQOoesOUmw1OAk8ergLh7ZQNj6oujGYhgcHNqUJgxQYpnh/bwsVayh4d73kohlTic/zQoOYPalx4QJclyFFz0CR5CYjDjJKD1LIvwtlIVNH4nU8Bnp+myEeCn5Tf+s5PqLFAEv/eMsTDnOi39mQYtO6r+DtIdRNjLrln02NR4kBwJNJrwowfq1C2w3btehxRfo/2v
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74c76ae-ca74-4578-3bcc-08dacdfac743
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 09:03:39.4468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BYl11Y60mN53IANArStQkaVuln6/KK0acFJ8fRRRzYPVYzWDmYn948h+BN1miVc4bW7F0j8Un3VVeFNLhPrpew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6018



> On 23 Nov 2022, at 22:25, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> The binding for xc_interface_close() free the underlying handle while lea=
ving
> the Ocaml object still in scope and usable.  This would make it easy to s=
uffer
> a use-after-free, if it weren't for the fact that the typical usage is as=
 a
> singleton that lives for the lifetime of the program.
>=20
> Ocaml 5 no longer permits storing a naked C pointer in an Ocaml value.
>=20
> Therefore, use a Custom block.  This allows us to use the finaliser callb=
ack
> to call xc_interface_close(), if the Ocaml object goes out of scope.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin Torok <edvin.torok@citrix.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
>=20
> I've confirmed that Xenctrl.close_handle does cause the finaliser to be
> called, simply by dropping the handle reference.


Thanks, a good way to test this is with OCAMLRUNPARAM=3Dc, possible under v=
algrind, which causes all finalisers to be called on exit
(normally they are not because the program is exiting anyway)

> ---
> tools/ocaml/libs/xc/xenctrl.ml      |  3 +--
> tools/ocaml/libs/xc/xenctrl.mli     |  1 -
> tools/ocaml/libs/xc/xenctrl_stubs.c | 43 ++++++++++++++++++++++----------=
-----
> 3 files changed, 27 insertions(+), 20 deletions(-)
>=20
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl=
.ml
> index aa650533f718..4b74e31c75cb 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -175,7 +175,6 @@ exception Error of string
> type handle
>=20
> external interface_open: unit -> handle =3D "stub_xc_interface_open"
> -external interface_close: handle -> unit =3D "stub_xc_interface_close"
>=20
> let handle =3D ref None
>=20
> @@ -183,7 +182,7 @@ let get_handle () =3D !handle
>=20
> let close_handle () =3D
> match !handle with
> - | Some h -> handle :=3D None; interface_close h
> + | Some h -> handle :=3D None
> | None -> ()
>=20
> let with_intf f =3D
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctr=
l.mli
> index 5bf5f5dfea36..ddfe84dc22a9 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -146,7 +146,6 @@ type shutdown_reason =3D Poweroff | Reboot | Suspend =
| Crash | Watchdog | Soft_res
> exception Error of string
> type handle
> external interface_open : unit -> handle =3D "stub_xc_interface_open"
> -external interface_close : handle -> unit =3D "stub_xc_interface_close"
>=20
> (** [with_intf f] runs [f] with a global handle that is opened on demand
>  * and kept open. Conceptually, a client should use either
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xe=
nctrl_stubs.c
> index f37848ae0bb3..4e1204085422 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -37,13 +37,28 @@
>=20
> #include "mmap_stubs.h"
>=20
> -#define _H(__h) ((xc_interface *)(__h))
> +#define _H(__h) (*((xc_interface **)Data_custom_val(__h)))
> #define _D(__d) ((uint32_t)Int_val(__d))


I think this requires an update in xenopsd too to match, otherwise it'll cr=
ash:
https://github.com/xapi-project/xenopsd/blob/master/c_stubs/xenctrlext_stub=
s.c#L32

This wasn't an issue with the original patch which used Data_abstract_val h=
ere, because
that (currently) happens to boil down to just a cast (with some GC metadata=
 *before* it),
so the old way of just casting OCaml value to C pointer still worked.

However Data_custom_val boils down to accessing a value at +sizeof(value) o=
ffset,
so xenopsd would now read the wrong pointer.
Perhaps it would've been better to have this _H defined in some header, oth=
erwise extending Xenctrl the way xenopsd does it is quite brittle.

Best regards,
--Edwin


>=20
> #ifndef Val_none
> #define Val_none (Val_int(0))
> #endif
>=20
> +static void stub_xenctrl_finalize(value v)
> +{
> + xc_interface_close(_H(v));
> +}
> +
> +static struct custom_operations xenctrl_ops =3D {
> + .identifier  =3D "xenctrl",
> + .finalize    =3D stub_xenctrl_finalize,
> + .compare     =3D custom_compare_default,     /* Can't compare     */
> + .hash        =3D custom_hash_default,        /* Can't hash        */
> + .serialize   =3D custom_serialize_default,   /* Can't serialize   */
> + .deserialize =3D custom_deserialize_default, /* Can't deserialize */
> + .compare_ext =3D custom_compare_ext_default, /* Can't compare     */
> +};
> +
> #define string_of_option_array(array, index) \
> ((Field(array, index) =3D=3D Val_none) ? NULL : String_val(Field(Field(ar=
ray, index), 0)))
>=20
> @@ -70,26 +85,20 @@ static void Noreturn failwith_xc(xc_interface *xch)
> CAMLprim value stub_xc_interface_open(void)
> {
> CAMLparam0();
> -        xc_interface *xch;
> -
> - /* Don't assert XC_OPENFLAG_NON_REENTRANT because these bindings
> - * do not prevent re-entrancy to libxc */
> -        xch =3D xc_interface_open(NULL, NULL, 0);
> -        if (xch =3D=3D NULL)
> - failwith_xc(NULL);
> -        CAMLreturn((value)xch);
> -}
> -
> -
> -CAMLprim value stub_xc_interface_close(value xch)
> -{
> - CAMLparam1(xch);
> + CAMLlocal1(result);
> + xc_interface *xch;
>=20
> caml_enter_blocking_section();
> - xc_interface_close(_H(xch));
> + xch =3D xc_interface_open(NULL, NULL, 0);
> caml_leave_blocking_section();
>=20
> - CAMLreturn(Val_unit);
> + if ( !xch )
> + failwith_xc(xch);
> +
> + result =3D caml_alloc_custom(&xenctrl_ops, sizeof(xch), 0, 1);
> + _H(result) =3D xch;
> +
> + CAMLreturn(result);
> }
>=20
> static void domain_handle_of_uuid_string(xen_domain_handle_t h,
> --=20
> 2.11.0
>=20


