Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C560B42C1D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 23:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109120.1458954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utvKk-0005E3-6N; Wed, 03 Sep 2025 21:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109120.1458954; Wed, 03 Sep 2025 21:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utvKk-0005Br-2f; Wed, 03 Sep 2025 21:48:02 +0000
Received: by outflank-mailman (input) for mailman id 1109120;
 Wed, 03 Sep 2025 21:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rz8A=3O=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1utvKi-0005Bl-L2
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 21:48:00 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8894618-890f-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 23:47:59 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB9557.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 21:47:53 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 21:47:53 +0000
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
X-Inumbo-ID: a8894618-890f-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWPaI+7DwS2DHOyK1ytQvtVNDFXfWNsVecMEVSeLNX6j1VbAbDvSm/xGLhUK/GDI5AjAtKuw7oCCR4jZg/lrEWToAAh2DU8mvVi2UBA5T8OwiTP8MLIY/yu3Imv4h1dsN0qBuhrSG0raN3FhsJweqX8lBNrGOPWPPhWXphg5pwpGcOJvf8V5r4V73MmnBh7yg78oJnnJzxL4YPJasw7ZcHHdDLNyOjMRru95MBM4yxQe9KijmsmgzLJRY3lKd0pjDt2Ao6t6Qlt1JsmtqSjNkgaWCIiLwTqpldI9txtP9VLUFpS4YC14E7CEMDtQT8ZHh1cIerRZIYfhFfIZxVeQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajs9ITteRXrA1RVDIBcifvlcji10nUoiHA9jN4yIv8Q=;
 b=pUmDercO6vKfbXZ9OKmI8dyiMRzzX3+Sp8xWzt2Xp4kqcCjAZmOCNh0wt2yRtBtfklutWsET0jFbCu2a4SZJI7NPOAwZKaim8U9cesTzX6ux+KtcfxxX+VUPWS0XMVq7L96vZ9SLZW84U2jOe1Pb0jNxKC9VBQPw0DF5+pgjH2PQ1mSziapwGIRuh6XSoxWl5g1GenCSG++6I0Lh19LsMITGIiJ0agWxvgpz1E293r0fp6nHFvgg0SjeLMjP6+qff3CB7Jemziie6efabBsi6cLoCfphSnt2ZMRD7GLqBXHkzgFVs7D99E6zcCHUPuhtUH3jOtjU7icFbVsmYj7xZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajs9ITteRXrA1RVDIBcifvlcji10nUoiHA9jN4yIv8Q=;
 b=c4gyqnOX4UQc/TpolN/zDeI6sQ4rfHeRpF9/UJYzHPWWjemEDgHtt1e/MYbpCeAq5LL0EW8hj5O6BbIludHq6neM46O3tDGLlHS2a6lZ/IIZGYZFHmgJ8XfAeuZ/jb/dr0BzNuFdEohGjTywgruUgAmPgR3MRoZncFlayPlSoo4H+UEHZIyBByRCBGvJa4+uRuC6FaT/nzRZhyl9iG5OmfhfjGb394CIgGI9QOQooBSoOzdMhFDMhZCh3p6OV51h2KsXyPOPAi2Bf04runhy0u3cat8IsH6jJ2AVNRJhvS29K2qs2syydjrNjQlCcqJ91Q0i5d7YiBHfyGaRjLTSEQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: Re: [PATCH v8 0/4] xen/arm: scmi: introduce SCI SCMI SMC single-agent
 support
Thread-Topic: [PATCH v8 0/4] xen/arm: scmi: introduce SCI SCMI SMC
 single-agent support
Thread-Index: AQHcHNVLdhHlv1cXk0a1m6gBYsABvg==
Date: Wed, 3 Sep 2025 21:47:53 +0000
Message-ID: <87bjnrtdh3.fsf@epam.com>
References: <cover.1756905487.git.oleksii_moisieiev@epam.com>
	<alpine.DEB.2.22.394.2509031421210.1405870@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2509031421210.1405870@ubuntu-linux-20-04-desktop>
	(Stefano Stabellini's message of "Wed, 3 Sep 2025 14:24:10 -0700	(PDT)")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB9557:EE_
x-ms-office365-filtering-correlation-id: 46695fa4-f333-4ef8-20ed-08ddeb338938
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?E0IUqQRrXUIgmGxaVAzKYGeoONqT+LBCHZ7D7jfb+zRZfE9VAMAk3uv7N7?=
 =?iso-8859-1?Q?uatwaBfHefRCIOE2KmrFAX4YjK293OZOo3zMgXJFi4CF3UkXO9Y+qn/8mS?=
 =?iso-8859-1?Q?9mrzqj3W9wLR+7rBDOL7CIPLWKA6pfyXIC5siFPpUpRNQqBhrdq99h9xgR?=
 =?iso-8859-1?Q?eIaV6H7pCEhHcWJcDGhzdl9ZeYl7lZXkDW8r8g72zXechegXWfhFo1cV1k?=
 =?iso-8859-1?Q?Xt2MRNB5JNzpUEUkjsJNFje15oL1aetxa5a424CC1jANDNSrxSfq+eY2ZL?=
 =?iso-8859-1?Q?Jvk3X5D/BI1bbImayka1Z9GPGvNg3CuuR8KQUMvFLq/pcTpHuE1gxL0r4V?=
 =?iso-8859-1?Q?P4+joGZHXjQFMWxFDStb2MuUNVlOfsU+TMaVbUammiAgDsMKjTVAefBbht?=
 =?iso-8859-1?Q?/NbYo4++rdvM2HSzvKAJfjBxCSVmUxt4l3N45s31QFG5H24SZ3dzgZSK4F?=
 =?iso-8859-1?Q?sN0XncEEvXGaM3X4IPcIx2WZeqxhEI3IFnptCIlF1ojO98GPX4PDxf063+?=
 =?iso-8859-1?Q?XTRTWfUidvfmoSbkcsemxtnHjXUqg6ZCw3qL9RZARUnkcai5lymuAm1aPd?=
 =?iso-8859-1?Q?PW6C1aM1FPstRsEjO2CoebbsS22z9t81ieYvksjbuwwbzzPZ+BDL72CtdD?=
 =?iso-8859-1?Q?CvpCes5oUblCM+Q+6oWzNPkW+/BqeyRYtbJx8MKQpSz35wAVMHCtmpCPLE?=
 =?iso-8859-1?Q?h/n7oV+4IWNkic3SvzZgqHRWIkA6Kb3hz+96hRSrqsoggXOsEHysd+O2bL?=
 =?iso-8859-1?Q?u2aiqkaTe+Zb5+6YRxdLQfx2CvYDwg0/MKh/8ngv0vfrwKmSTS49Lhcx2P?=
 =?iso-8859-1?Q?wGmjboB/lLkjEVVSYZxGm9bdqY9illoA6ppUfk9KVTdMs75UgMWhjKg36Z?=
 =?iso-8859-1?Q?qvZi98Kz2Sg4Xapp5u/GR1Wh+oUazt/bf2CY9Z1cSb1hFVE56k/4mxJK3d?=
 =?iso-8859-1?Q?OUnJs/y6MujV/geCaSqLWt0OTHBpzOUWLcIO5NFBbc+4tLRO7nMNAPWhMX?=
 =?iso-8859-1?Q?9Ji/SoSPvFxBVJpUmQ/oQF2nDc/0c2lCQHnXH3F5xHIKGo3yI8fC75yITy?=
 =?iso-8859-1?Q?BN+g4AOMk4U/xSS0ThOWYIG3EFk/GYFfup3m4NRZXx6+hIXcMSQnNs1+tJ?=
 =?iso-8859-1?Q?6FpViefr2p2AXH3YvftPB+bk5IrGEWC+wpXEUaMVfoGY6Yui62xea6Nr1R?=
 =?iso-8859-1?Q?8NhwCbbQU4JuzU+MCr59xc3VMdLJrYH2vXCQVOsASiCkqhDW9t4tlTTNjQ?=
 =?iso-8859-1?Q?8RNiDf1JnEwBxINESsYWxeEcnRIgX1NS9eWorzP8az4xbpqAF0MNJxmaX/?=
 =?iso-8859-1?Q?VBQqqBH/2ipozcL9KphD97gzLSqkUmAusJguJspVDEkwEJdfbHQogAWKJ4?=
 =?iso-8859-1?Q?wsv7Prc6TlCNDGfIDzV4Z02qReSjzDpjPEMkVBdIsyUr4kdG57TIEd5Y4B?=
 =?iso-8859-1?Q?49Z4So8XmL5kXeVXIFJliuyyfePYacEAcMfUodx58f+aXd7Hr8rMt1X1f/?=
 =?iso-8859-1?Q?QYT46vjcXje1xIFi1SJ1THd0Zkbr2J6r0Aw8m9PHfk/A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xx+acViUl37eBjz5av8feW5o9hF1mrAcx7mEz0Y/aKLsA5AC7sf0htH9+3?=
 =?iso-8859-1?Q?Lk6g+24ppO/IOj2bCO5CGz2xdCtBHwTI62Iwuz5mk6q0wA82mfzzW//qcU?=
 =?iso-8859-1?Q?w/rsPqZl/qJ0/pMs6yPRRh4WMJHWhp/YdbcrEShgjTOI2ORI16rRACr6XV?=
 =?iso-8859-1?Q?nSKxlz1ux2PYJr/NdU/ZfMqWL6WdIHAfmAzeM8F0RWWTkDcUZImpmHqM6K?=
 =?iso-8859-1?Q?wT0sMDYcel7ypfy/3gRTxUroHONuhKWk2x2RoN4zciYVcD+XPRYzEux5OS?=
 =?iso-8859-1?Q?D8sQaO5iN8vgIiBf6SJ2sPCiMQnG2ROWnaoKp6cX9XKZbG8/E0TuE3EPvT?=
 =?iso-8859-1?Q?gEXjS1Xha1AJey1Psvi/cX+jAGaeMZprjThbEtglq6ShEO+DGXrX8pGbuc?=
 =?iso-8859-1?Q?ttJLP4B8rzJU79xYCtsgHqYkdeRFKk/Ovi9AhLfCSpvYBq5LFNJDJ2J4E0?=
 =?iso-8859-1?Q?vs58fzJZZ0X8u8c3q+aOpZ2Zt7SJKGDlj8uzpRkv7zG11YEfFTV8b1FE/J?=
 =?iso-8859-1?Q?ll1eer/Wy/cM7mmDodePjRnYn05vKETbxf1sEiTGG4FgPHZEF2V18tHOx0?=
 =?iso-8859-1?Q?diqcvBIio49MGW+zBr2ks+MYG3ClompEUMa41b5KYg3PxCVBnqVON8PsUQ?=
 =?iso-8859-1?Q?zRYuztf31GkC925OVyOi/U4mHg9TbJjgtEEw2mXikma2ZMnzgjLBYfr6UI?=
 =?iso-8859-1?Q?CIMh8rNgA92Z+SVNHINcu1bkXND7UxdXThJ8hkeKYWm0fcCdWdFblLt2r8?=
 =?iso-8859-1?Q?7fak2b4piyGTzsjpeDi4adS7El8QNY6MdlEOhAyuMyxwjSfSkD8sW5NPJF?=
 =?iso-8859-1?Q?KJ4AyVtB0/SnTZpon0PoGg3hHxkRbBxQQgoqRelSwphKo0MPALCxxS4x/f?=
 =?iso-8859-1?Q?ifpd7RBoElTkZVt0uVnYznRp0QHnNwQ49Q08HYTIMjAdqXJhARssiECNmv?=
 =?iso-8859-1?Q?DCQ7ZAJdW0xpVNVC7zDbwtTOFHK7qnLymY2sCEN/B01tSNwkhQsK3OfDlp?=
 =?iso-8859-1?Q?QdYhM01r8psYIZaBEgxZw03kn+wAdpNNYANyTjqbHxGxY6Aty5TqVWFaxx?=
 =?iso-8859-1?Q?srSNVLdyyUNjHCjv1AbHWFQfWJB7MRsV2yHmfgLk8cRM84B0EXce8giaP7?=
 =?iso-8859-1?Q?Fu6vyHKYl/AMJYPQ7KMkf/xC6gEEg+zAZld8fNPIAqBeYK+/MFtEGNvd/6?=
 =?iso-8859-1?Q?qhhPboQFEdw9GiP7f2/GzwHDa7FfJmNvW1+CuN4ZewU5LDT4O/bF0u7zFx?=
 =?iso-8859-1?Q?fTeJD4i9H71OtJD0O0S4x4QW2U/yzI7EC+AkgZQEE3XrX0VDK67L4d2jt7?=
 =?iso-8859-1?Q?We6ee2pUPsnDmnt3MA+LveM+RUyWy1rRCfOLY/U4jPcyt9rjkZF14DPEYQ?=
 =?iso-8859-1?Q?nIj1Xr/VrNTtMIgX5swZ7CB2fOFqMlg5dXsBy4XlxF+ykdGSV9vwBHpSG8?=
 =?iso-8859-1?Q?xQPPdVcH5RhFEUD6LokswEvOgDmI1KKtpnIn8yIUUyf+qQW4G2twQXPFo6?=
 =?iso-8859-1?Q?Sq9mJ6BsNjF5cF0o5WlsGZ6qlMuvRfLDUjomD0zB5I+fo8/WiJQCEok5Gk?=
 =?iso-8859-1?Q?UrAQZWKfOiwcQ8YFOK5IiUx2K6xPkL++Z8CvNsVTyDdmz2R06y67Hcbi8Q?=
 =?iso-8859-1?Q?8sciu4iGOCNAjv3Gis+6SugauE29RaPyTTSxjcugYtv/1PrJbRSAupWA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46695fa4-f333-4ef8-20ed-08ddeb338938
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 21:47:53.4389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iMUAq0W6p+bI3ZhSf6XfLzfoe1whSf9grgnMERZ5fB5DS8GJSTR3LBCydD9tHuNr33vsuKbdFRDTTJRNcx4HefFGF0Z27ZxRffPIX2NHnt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9557

Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> Hi Oleksii,
>
> It is still not passing the ci-loop, this time due to MISRA. See the two
> new 8.3 and 8.4 violations (previously zero) and also new additional
> 12.2, 13.1 violations:
>

Is there any way to run this kind of tests locally? (I suppose that
answer is "no")

Or at least maybe it is possible to use gitlab CI without sending
patches to the ML? Maybe via opening MRs at gitlab?

--=20
WBR, Volodymyr=

