Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24233B0CA23
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 19:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051692.1420087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ududW-0007jQ-9M; Mon, 21 Jul 2025 17:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051692.1420087; Mon, 21 Jul 2025 17:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ududW-0007hz-5v; Mon, 21 Jul 2025 17:49:14 +0000
Received: by outflank-mailman (input) for mailman id 1051692;
 Mon, 21 Jul 2025 17:49:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uy7P=2C=boeing.com=matthew.l.weber3@srs-se1.protection.inumbo.net>)
 id 1ududU-0007ht-Qr
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 17:49:13 +0000
Received: from clt-mbsout-01.mbs.boeing.net (clt-mbsout-01.mbs.boeing.net
 [130.76.144.162]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe659496-665a-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 19:49:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56LHn2VO008596; Mon, 21 Jul 2025 13:49:04 -0400
Received: from XCH16-06-10.nos.boeing.com (xch16-06-10.nos.boeing.com
 [144.115.66.106])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56LHmsLp008460
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 21 Jul 2025 13:48:54 -0400
Received: from XCH16-08-12.nos.boeing.com (144.115.66.127) by
 XCH16-06-10.nos.boeing.com (144.115.66.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Mon, 21 Jul 2025 10:48:53 -0700
Received: from XCH19-EDGE-C02.nos.boeing.com (130.76.144.198) by
 XCH16-08-12.nos.boeing.com (144.115.66.127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57 via Frontend Transport; Mon, 21 Jul 2025 10:48:53 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.178)
 by boeing.com (130.76.144.198) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 21 Jul
 2025 10:48:32 -0700
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::7)
 by PH1P110MB1299.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 17:48:31 +0000
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519]) by BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::34e0:4442:7be9:6519%6]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 17:48:31 +0000
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
X-Inumbo-ID: fe659496-665a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1753120144;
	bh=vKcVSf0bmSSUExt2oF1R1kQS35ddR0sXLcquoEAfhXw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Up1B4y52AK6/9C3f7MekEP/wRth5wyo7mLkV+Dy5Og2OSUTmMhAXBgW9FETzW/8eq
	 1vI1X1wf63y/Yj3QaYVwF0pwPY9ZvMJIQh+uq2SmnVA++FLxOz5jbxP9TVN1oj899p
	 cCRBNvs0kNxyDiuTm3oPIQuRZ8P+mOiCnUqp8RkLmH2zg0qQA4QIQIeOcLtijfUR2z
	 cNXztjBvDXGzWatHu51W4lRpb6R3i6+bpQFSIBvXUjSf34E5HFcNVUrlVSdpkIlsOv
	 IvDDoynuqJIbhdQeMvE5/YRyUncvaB1kwhUECv0FCadWIiBXhqTpnfK/eK4Ck/DCyL
	 yA7WTAZdCC5Fw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=IBvf13hDuY93UE6JOBQs2db+H0UaMhllEYwcoI97At71mruJTTcyv5Ec6Wk/APKuZ9ShX+1Sp1O8q02G0jOCtUFKZH6RhoEtVi9m0O/4nZXfisfGhK5hsIbums9KxFd6E93j0xwW+VvvFS64HgQtFe4NnvNosWMA4WtF6IsjGz7LDGHne2c7PsOSGvXEjpXTKuSKOdtGmWNBVAqx6lyylw0LnXAUUQAOtah/ZgJLpQ+z3+Ay+O2Nltch3gmiQCn1uQ8EyuayB/ekLHwrCuCITVnI4JcS5LxVaJZVEesVfOsgHxdWS9TWKYxGVcAxboJWFiyfQH4lEuvskvB+oAkJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKcVSf0bmSSUExt2oF1R1kQS35ddR0sXLcquoEAfhXw=;
 b=XRDRd4ZPZHzqhAO8OwzfVqlaPLn8mcC/8pqXNcRGE3C8jn7doK8rP8spf0dNp9xHO4pVu4l3HZE2DCV+NhB2bXFI0fsrkPJdGAgiZAVkrJ8IJiHiWNC/c1AEbQ6OlxEIahBvRTaHZdebR0LO4wvGMIpDvw4P6isdwAewMhFRptvZLozKZ+IE6Q5yRSvHAnYzbIMonNr1DhLIS2AAPBL7AVKnJLRfRM6g9DkR9d9vpCLM3CSrKJNfLLWLC0gGlbL+k7oybWxSfzpYW0EVEgxmsiq5nXxJLuJa21/1ejdZpRytaPQRo6ms+HPlPUzNOmVtmxPvPm2Mf4axi2fh3rRCQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKcVSf0bmSSUExt2oF1R1kQS35ddR0sXLcquoEAfhXw=;
 b=oLhwGy6PvPjeeO3prnwwGrhIZ7Ok2JkBLdoZOVmcXpQ7TBq+n1Eoq48HpbpbMY7uAEiLFKl9S/4xaH/g9WUpMKaqZi4R06t5K0fySGI1OvsuiikxITRjR2xAgXqeKb1pkhw3yvgJgMEbO2DYfyk0OSNXlYP5KW9Bxc34qtEx4mU=
From: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>
To: Nathan Studer <Nathan.Studer@dornerworks.com>,
        "Choi, Anderson"
	<Anderson.Choi@boeing.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "stewart@stew.dk" <stewart@stew.dk>,
        "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>,
        Jeff Kubascik
	<Jeff.Kubascik@dornerworks.com>
Subject: RE: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Topic: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Index: AdvmTXSjjVtbwyT/QSCLI/dKN0kF9QKhMe9AACLJK7AAqtXngAAyJJ5gAJscMRAAym67AA==
Date: Mon, 21 Jul 2025 17:48:31 +0000
Message-ID: <BN0P110MB2067DB4A6C62DDBB410C58C9F35DA@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
References: <BN0P110MB21482D2B6DA8145F2F9EC923907AA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB16295017CE94610DA021ACA6F449A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB214873ADE19EEB94F6B6055F9048A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB1629FBC51EF4E46B99958A83F455A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB2067D084B32D3F4601C288D6F354A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB1629932C551E92F6A515F9FBF451A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <SA1P110MB1629932C551E92F6A515F9FBF451A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2067:EE_|PH1P110MB1299:EE_
x-ms-office365-filtering-correlation-id: 081782ba-4674-4b05-ab7a-08ddc87ece6f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4EhXMImth2rU+0t845qLiNHqDtZT84vX5ygI/AswsRoS71abJ9N4rsTMAsc1?=
 =?us-ascii?Q?xSYmL3U2yxQeA7eBj7U+k3Y+TdDyZdII0bd8eSrLHb1jBIs70JpWDdK6IhUH?=
 =?us-ascii?Q?1LE/tRyYeCFuPjBVlF68Q5VglfTvBj6bAJmQj4oGKFZNglg8tuE0AfEbDh54?=
 =?us-ascii?Q?k0Bb760MscLuOIuAghhhLBuomoO7GcpcrNm8MVK6WqSotH6hT1LiBdJXv3gA?=
 =?us-ascii?Q?GewY75HJpW2G8vImfJP8vrXLoepYw6VO34sWvonTE8u6UTX3psusu8K492gd?=
 =?us-ascii?Q?TU8aEsoWUk3PO7cpSLWe8RrkWDKxZ4wzdWMjDGXTp2zu1euVnfIHpqrmQ12N?=
 =?us-ascii?Q?pLz5t32aumCtOt/RPkhiDkAFJFqCfORl1sLqYBUDW9ezC1qAbo1DE6rdfS9k?=
 =?us-ascii?Q?k4xc780ZH9XQdAWHbLjhPt4IXhAMt2dt+vUJq/Fp4d6+Nkn1DbPWC1IihZkg?=
 =?us-ascii?Q?EPztn+c5SxPY0aoRwFNG6SICik0SxkISxUMPwib3l20Nsqy3DdrTqe+IG4Ha?=
 =?us-ascii?Q?Tbf7Mjl1fiYeXlGyiTpGZqLUNFo05HpUcBQsYqpidzLDovoQba1vxllvAVTO?=
 =?us-ascii?Q?QRdHKYYpgyDMbl0bt9ypGz1n0LkpYTf8Dmzj/78jTXHnSo2A23nADKxarf7P?=
 =?us-ascii?Q?ePFQ7fQRf8LnAwcq4YKGoDfDI1lRt8YDVugKbLERiKEZYVZtMOBL+BWSic1l?=
 =?us-ascii?Q?Wa9Q/gCZ6WKyiQtBS38+cMCj1Dj61gdJYbdfXSlxB7mIKRZVnGUVIfyt+EAW?=
 =?us-ascii?Q?P7gzqix7r+gHPFd3jUK4o+kBu/wA3j4TVN5eEyXn10H1pM2fUY2OB8fja4BD?=
 =?us-ascii?Q?RzVQyCNDJCZckc/8lhL6fyYKPHrYk1gHdcxv2LQygUKAwvD03X3wRQqsgLeY?=
 =?us-ascii?Q?vUf+8wFw9X1XqHb86D9EVMnY1EC2yxf4a2fXhxFD4uiFrXgxWR9Dsgmdxtgq?=
 =?us-ascii?Q?7ig5ai7zKqM/aiXQkj2zPVukyEp6DtB1LOdzL4ZFUKRfzwww8rf4/cvTHMo+?=
 =?us-ascii?Q?BHfMHsBCJMLjeQQKFqX9kE+N7KQvRJqRwZ68xgkjgyjDBx7444NdZ805CW8h?=
 =?us-ascii?Q?GkEyPdoZwwpmqoFaVEnVjNLHCFkUac+xY2NcQePz5BUNkJJRADGdXz4BQYqx?=
 =?us-ascii?Q?TJbi5exAjPTzgZ8pdrIiBy/TaU8c54aK0vmvntfWnWAh/20FPn832Py7dUyF?=
 =?us-ascii?Q?v/cGd7cESr700jiQ4yNqsuc3rGWsvkygLSntYmzlR7OXNYjTxYUXlnHKip1i?=
 =?us-ascii?Q?7xEufzVh6nr2HIMGm08t7aSGZn/5ky1NRKW+XYETtQy8dUUVQxA/xXu/Q3fT?=
 =?us-ascii?Q?FNqRlTHcwa+gQZQlv43cxK5Z7/KInxgljRxSPphzDQ5G0doKwSf700gVro2u?=
 =?us-ascii?Q?pkh816Azin75Bj1Rb8jByKq14F/Z9UCPJ1lmuo59KFNeuzUJ5rdgIi0PwiF+?=
 =?us-ascii?Q?/WiB6ce9evSrKW3kFrEfjqWqC9pJrFUy56UwfNj7j7QNTDAp31kiN9MuzfPP?=
 =?us-ascii?Q?a6t1NJexiV1F2Vg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3j4E1KNt9Jgm51FQNCiWAsVE4CigSCWp4jrVPF+BhNgRLDEO3iRMAmEalqj8?=
 =?us-ascii?Q?oJ27Ja1Dyh59RQaOCmWKr09t4FEx9pSFT8gJ7wrqtz0WipnkAUovE7o52IDW?=
 =?us-ascii?Q?46WfS4uUEn7jc++UhQybDuagMk/PlfKEbUlTXWNNLqLGCDvlRfqIIEok7fH6?=
 =?us-ascii?Q?psa02viX9g0YSXkiYAHh3vjQcH4RhyYMDVm8Hul49bqUQe/Mb1tkgzgL1+tz?=
 =?us-ascii?Q?85qxpnw2noUOgamRHl1z7tm+dpDheek3QHorvPFoiqav2jyWzZlZ2EPVb3Ve?=
 =?us-ascii?Q?ZIyFSp8W2dwGzDPPcHuY83wTeYBicjK/+1Ck0623WhFJ7sfpPO7GBjiRhZlF?=
 =?us-ascii?Q?WzWOUYqOcj1JElRdJ5coJtmGWJ6dj/YaBoR9CGKfoUiQvY4OBvU9ASYO7uzS?=
 =?us-ascii?Q?A/uQ9DVwXkcQtAOMtHvdsK3e2YW/6Os0JMCg/zOYmur+R0//n1kGdrMV3lax?=
 =?us-ascii?Q?4oout0yvn+h4VQxGcSZ2UthlaahGrODat2zBcDMH4G3Hgb9yFX+4CcaxWAcM?=
 =?us-ascii?Q?2OlLrPbcQ6OnzYhrA8/TXh+jsQbOmmWknBK62P25TqEC6g3FycPg0JlzOdZ9?=
 =?us-ascii?Q?U/XZ33Gh/W81xmaWp4mhjM1cXn+Fyb4SZXgCU2mQjmG233/Lr2qk3oI0ltkF?=
 =?us-ascii?Q?dYd4njVhimqdtGjGCxr9zDp4ISibavC/HLct303mtqrVsc31yokftrNs7Vl3?=
 =?us-ascii?Q?/PJlEwF2w0dMzjZWKkMOsEhNvZjLmLEmQ9brQfh8demt6skB/8SUkaAsCVVg?=
 =?us-ascii?Q?4LN92hjbh07lBt8iexanilOc98iOGhKLZi52Ia+sTVaV5zuZjElYqjkoAhK0?=
 =?us-ascii?Q?I5us2BbSoKzZjL9VCTk2MeVdI+jd6aXrSW9LPeA9ODasdWLIYpe4uZ2n3cUx?=
 =?us-ascii?Q?GZWbS+cxe8Y+VckO2OmThhRCc1Kx4EpvJakr+pLrPWI8i7aMUCuPhXUpM3Uh?=
 =?us-ascii?Q?Nww5BVikKKDWGuv+0eL4dXu0tubQAAhZrg3oBCJ2mcquHGcpYYeewqQHjCAL?=
 =?us-ascii?Q?4UnGDZ+c3GFaz/NklaV0iqtjM3bjjEa7qkgwBYtlhY3N7RDMWs2c3+K8JM41?=
 =?us-ascii?Q?/QBbahEslD20J5blA1tNM85s4igkMXusaSzyuhXMiksdi4wCBKxHikTzD1CF?=
 =?us-ascii?Q?C7iqCJoYf2atVaaZuQCpwCcqjjffE97zuKuOQlib4tnnx0eYx+p9AcWzczcA?=
 =?us-ascii?Q?JGyxvvaEsOF5mV9miWEgTeElyFkunhyw5+IvgnbXzFCE83GbBnRJtZDZh0QB?=
 =?us-ascii?Q?iEaGPwtABm78zMxzaqj4TB3bbM5SuQC1+a3jatM8pfqNXn6nz9TjdNrH6kEu?=
 =?us-ascii?Q?gMGzPWEvc1ZUUXiNiOTVTx6Q8CF6fG6Z2g+bW9eVCxYuUQZzE8+4Hrr5FkQM?=
 =?us-ascii?Q?36EfEX5NbBA09KcSF59uJtoeRhT4biQGO5a/cwVH8AkuvJvM0K2KSUYm/5W2?=
 =?us-ascii?Q?PtPIfFw/pHoOil27PtMRrmMqQJEc3OJD7y2Y6SsNUKkOesm7Ldj9IdmPYtL+?=
 =?us-ascii?Q?Qlf7zX+trYSAQNAvBl/DZaitWEMNzW9rrll2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 081782ba-4674-4b05-ab7a-08ddc87ece6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 17:48:31.0908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1299
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00


> -----Original Message-----
> From: Nathan Studer <Nathan.Studer@dornerworks.com>=20
> Sent: Thursday, July 17, 2025 12:25 PM
> To: Weber (US), Matthew L <matthew.l.weber3@boeing.com>; Choi, Anderson <=
Anderson.Choi@boeing.com>; xen-devel@lists.xenproject.org
> Cc: stewart@stew.dk; Whitehead (US), Joshua C <joshua.c.whitehead@boeing.=
com>; Jeff Kubascik <Jeff.Kubascik@dornerworks.com>
> Subject: [EXTERNAL] RE: Discussion on the delayed start of major frame wi=
th ARINC653 scheduler
>
> On 7/14/25 11:11, Weber, Matthew wrote:
> >=20
> > > As a heads up, since this is a bit of a bigger change then some of=20
> > > the recent
> > patches, I am working on running a stress test on it, which may take so=
me time.
> >=20
> > Out of curiosity, is that something we could plan to run on our end as=
=20
> > well before proposing changes?
>
> Possibly.  There is some additional hardware/system setup the tests are d=
ependent on, but we might be able to provide something close without those =
dependencies.

We do have ZCU102 available that we manually test against and have started =
to look at what the Xen CI can do in QEMU.

Matt

