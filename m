Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C89AFF9EA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 08:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039078.1411076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZktd-0002Kf-Gm; Thu, 10 Jul 2025 06:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039078.1411076; Thu, 10 Jul 2025 06:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZktd-0002J4-Cw; Thu, 10 Jul 2025 06:36:41 +0000
Received: by outflank-mailman (input) for mailman id 1039078;
 Thu, 10 Jul 2025 06:36:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFVo=ZX=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1uZktc-0002Iy-7i
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 06:36:40 +0000
Received: from ewa-mbsout-02.mbs.boeing.net (ewa-mbsout-02.mbs.boeing.net
 [130.76.20.195]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 390604b3-5d58-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 08:36:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56A6aW0a025377; Wed, 9 Jul 2025 23:36:32 -0700
Received: from XCH16-08-05.nos.boeing.com (xch16-08-05.nos.boeing.com
 [137.137.111.44])
 by ewa-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56A6aPiP025316
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 9 Jul 2025 23:36:26 -0700
Received: from XCH16-06-01.nos.boeing.com (137.137.111.28) by
 XCH16-08-05.nos.boeing.com (137.137.111.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Jul 2025 23:36:25 -0700
Received: from XCH19-EDGE-Q01.nos.boeing.com (130.76.23.13) by
 XCH16-06-01.nos.boeing.com (137.137.111.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57 via Frontend Transport; Wed, 9 Jul 2025 23:36:24 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.146)
 by boeing.com (130.76.23.13) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 9 Jul
 2025 23:36:22 -0700
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::17)
 by BN0P110MB2017.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 06:36:21 +0000
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d]) by BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d%5]) with mapi id 15.20.8901.021; Thu, 10 Jul 2025
 06:36:21 +0000
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
X-Inumbo-ID: 390604b3-5d58-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1752129392;
	bh=tBbHhToESV9OiIflD+M4e3ldgnd63HrEvU0Eum6au88=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=FUXPZ0H+U3XpHk+H8n1OTk4wGQa373sO03HJ1E22uoYyNlNZq0TN95sSh4HdTejyT
	 Y6+Kq+tp3a1NMAeyEQzkterqYFlCAyt8IZc+92LoYEdswLumIr4aQzqzTgzXdzZhuH
	 KeNA2uAw/W8pG2xH8jAdas1r2JsIRE3ENfWxl1oO5N4j4GzQKSQrgEnV5r60ta66Ll
	 TiG8+CEqeCqhUmwZZW+wcHs8PbM+YjlYdJ7zPNhlgeMeJ1x1YsaPk95txBW4HevxU5
	 LHm2djSS6zuFUsnm9KNs49dERffjfUZZbuzhrMa0etKu+cmgulGO5SatM687qmyc00
	 VsB5pmZgVHZQA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Eamz6ajo8iPzEue1Gic8Fyfsy2szny8RWy/UfT2jQRQTBnkxyLxaHtl2tEg6A55Q4rFFstqhlSrIV4eGr+3WYrCe1npV77BLOlwRErV2z3Pe4iTTJ78hcnvBcWBQXYIY2Kqyz+9gH/jIx3S3IMsChVT6L37Wi4uVDBkvJVJtj/Xy2sbEwb4QDB430UYtcNd7ZRqV6cLRFvZ36JwHa4kjPtnPbxFFpNl1qnJ5j/GLhVQ0/VFhMP9vHXV1kLwIslGqu1yR3eOt9aA32hnhEn9KlsC/cv9tyoEMKwspGN+HjgpNUZNwN4O1pI9ErpnzN/Mt55En5eGJCKc2nzCesgK8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBbHhToESV9OiIflD+M4e3ldgnd63HrEvU0Eum6au88=;
 b=sB4A+B4Lb+3iValxKW1Vr67KNEjUsH+5iBpKUldA3BgHEV3yLOqrDuGoTXUBKd0HzneHB+ROPA7V15FVw+DzEDBtmaEH7yISgd8yTzK5zdV6QXoHTpvjYHlk06NVM6KPLAP+uB6IF4MuxKlxTCdPRzNmTffYp6sn2YzfueeJCGGX6YYa+plqnI1xq19hf5vnsqL4syzGIg82QNgy6CQ/su3qHLf3bh+94Phrgo+jihQfcYjq5y8kQpSXAm71X+RZW9n9f8Q/kzBuc6b9v9WT65hFRE+L+445b/3bbSNEZ71SWrFKAjhW0KHRxIraHKihiBZK3NKlfUPtHSdt1FBmGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBbHhToESV9OiIflD+M4e3ldgnd63HrEvU0Eum6au88=;
 b=g9zWeXYRBo//JdOo7PuVjjO0GX+oBFFuJ8m25HykoS62kL5TFKok2/U4CWOXsvGYuoS53fNX8Ljp9XnCw5jifmSDloKpT/QkBSiqia7pzjGwIRXwRrEABPqIO2vxE7Qt4mXdwdLWucmDkI2JGo+Kh2as+dvn1/Aaveka08lMm30=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: Nathan Studer <Nathan.Studer@dornerworks.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "stewart@stew.dk" <stewart@stew.dk>,
        "Weber (US), Matthew L"
	<matthew.l.weber3@boeing.com>,
        "Whitehead (US), Joshua C"
	<joshua.c.whitehead@boeing.com>,
        Jeff Kubascik
	<Jeff.Kubascik@dornerworks.com>
Subject: RE: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Topic: Discussion on the delayed start of major frame with ARINC653
 scheduler
Thread-Index: AdvmTXSjjVtbwyT/QSCLI/dKN0kF9QKhMe9AACLJK7A=
Date: Thu, 10 Jul 2025 06:36:21 +0000
Message-ID: <BN0P110MB214873ADE19EEB94F6B6055F9048A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
References: <BN0P110MB21482D2B6DA8145F2F9EC923907AA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB16295017CE94610DA021ACA6F449A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <SA1P110MB16295017CE94610DA021ACA6F449A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2148:EE_|BN0P110MB2017:EE_
x-ms-office365-filtering-correlation-id: 09f5cbab-a104-4989-4cdb-08ddbf7c159d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?MbSCN5S8HFZea8JGSQLhG5pwxOF1RlcSxQCCXveNDOZool2HhMVUhwOZDNXc?=
 =?us-ascii?Q?stGXUWfht6A83rgzZcwUgSCbM5kLkdw0Pf7gY9TlJ/RkfegVJe4mhv5lztBL?=
 =?us-ascii?Q?MmNmeuMbMnJuRDORSZtBfOa0urqzT7gGL+l9ng2ws11+kddfzl9L6fPKII5H?=
 =?us-ascii?Q?NTMlTWZ8CHpEDa1ctKFg6KNtl0IGyowgpTUy2f7nD3VLd7zt3zp2L+JnOxYI?=
 =?us-ascii?Q?mP3iSxk7YoLD6hi7lUp9hHAuT86VzgfMpPw/zRe2vw1+29WRdnqOJSBUlAxx?=
 =?us-ascii?Q?6Y6z3x0meGrPmidfJxgFAUt/qO6kwM7HDvM+kpeDTvzPHH4BP1KvUQQ3eiRc?=
 =?us-ascii?Q?FOjScGvyvVmOL5yABaTObiJ3nuntNQJNBzniEbmxJOH6InEi3UcSqg3nRLdP?=
 =?us-ascii?Q?g+Qas/D6MAD5x+xdt1/zziyb3t+EZlRPJhHfcirIQu+bMneTFcdZZAdpf302?=
 =?us-ascii?Q?Jw4oWK6XlK/sUfW8WbXhE0vJF5ceO//3ZZSjCaMk/aN0LFaMqqQrmZ/T41y/?=
 =?us-ascii?Q?R20FkqXCb8ADHPtcNCtjvqVFDAPXxbG3ne7iWwiuuPScGdVFANLvSgStHlvP?=
 =?us-ascii?Q?CbiorC0BAJzNHco2xBpzA6/jOr2i8RK3WGoDvkUMfC8exxb453Aiz0HCDVAC?=
 =?us-ascii?Q?w33PL40i1tOYu0dDXm5YEXulHE8c/Y079aJKIth9a3Wij2wIIO/Tu+0YazK4?=
 =?us-ascii?Q?SS6AUCZMw3vH1Kd8xD9D8vjKOSnkvD1dTEVQWr76t2h7fb8LQJ5SqN7M3UgY?=
 =?us-ascii?Q?w33m0C+fa0pyz6MnPHFRPNdEHhj8ttlIWRuOHHBIF9fo/ltzlOt3g3Vpncbz?=
 =?us-ascii?Q?8tZqaqMZm5eDJcSRPVPdo5k31URpth2XXwYbS+A/Z1q1JbOzHnj7lXEFL7QG?=
 =?us-ascii?Q?sj3KnzHc7375+CWyt9KaGsSDSRlapiqbPBWOkJaI/1WgRSDj6ud4MgQMa93m?=
 =?us-ascii?Q?MCCscoNJe8gPcsAZrlJc9cyvOteUpUpe+iPYOi7Psp18rzCWhE/ExFaFIFTY?=
 =?us-ascii?Q?g+j9TkVIF7eGIvDhS3OOaTqme1y5O3IUb+qE2eqcSFaqX/qX6yv1AI+BHpGo?=
 =?us-ascii?Q?OmG17Vin2k+e/LhshXFLWhYWoNIrw8Od4P4Dz2vAZG54Uby2YTMnjza5Vz6O?=
 =?us-ascii?Q?SVtxQOS3NXMWnLCHVY1HQBIPZ7MuoQHp/SiGpqyOfglhWVfjUPpqRe0TvSjm?=
 =?us-ascii?Q?H2Ytykv0S974mMIabaLVORj2GmExp1jMy9EBMfqg8rGpjVYgWYL5jpyg31GX?=
 =?us-ascii?Q?a+PheXOvgqX0QzQTu/B97jCvGeFFfUhHvNwyIz2omxkYZdw8L33XeW6+Sxeq?=
 =?us-ascii?Q?K1DFvtvSDCSZ3/0Ze4Fc4RH3ITeypssjcbv5eqzZ7bk8EjccoAE8eK7mP04q?=
 =?us-ascii?Q?Flk+9YMYeIIaTTMooopprXpXI6KtXdCRWH+6JA3YeWyR7I3cjRaTK9h2UcnN?=
 =?us-ascii?Q?3yrEPjqn6wbRciceIq2rWb73UEOLfY9XkQPd5XoBGamfm5G7pzVMUVzUH9Q+?=
 =?us-ascii?Q?2wqchdMmRRAuqgg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RbNB+uq4As4lUqbiTD070rqJ7ZKrjI0OSJ2XEVjG8gkIi0eHLEOQkGZoD0gN?=
 =?us-ascii?Q?NQ9L4q0faNnX6WfqxDqDpTKDfsLM6NeYN0Wo13hozOsk6bHiSIGR8KVviI7p?=
 =?us-ascii?Q?p3gBV5lVx/KHGlLLOe0RKfYq04kB/bjBJmG/So68SBy7VqP/QtyuVPI1JliB?=
 =?us-ascii?Q?PbaGP812/4fg9YCtu5a9nqSoAj0ol5s8nMusTrczpJFzPnlWlNm8H73J86H0?=
 =?us-ascii?Q?EMS4SuoyG9Wv1TdSobzTUz8NRKGv69vyQUVSOjDuncAoM2bLFIXHyz8HgkPd?=
 =?us-ascii?Q?IkQM4vcx8xb9Q6Eh22uSnYgGfayXwKHGKwtaagTXcPhMGUjgJQZUL9PYZ2+r?=
 =?us-ascii?Q?+PqAzgKF/Bmoa+J8IpX9veC2PiacXZgdMd3V4IHAV5+zAmrWixl5DBIsspuQ?=
 =?us-ascii?Q?B6YSj5r48ezbpSjgVWeW87yg0GK1W2XEMMOYnCOTH3d4dMJ3e6Gu5IvjQx+F?=
 =?us-ascii?Q?mQN+NLA1sJG5VAzLt4GjqF/Hk4Pas8+bj7N9op38i68aF79RMWLJAbjfb/TG?=
 =?us-ascii?Q?zCqJAQGszcqsMRsr6T/z4I+nKb74WemGbFCxt2KVdaKUAP0omlgrJO/SbIQ0?=
 =?us-ascii?Q?vEdWQb/duWUWwb24LCAPiNjBKJhtC1XCR6PfEyXJNXRyQP+15KzgTMt4I4H9?=
 =?us-ascii?Q?JA3w3YxKWyushlDOPsFTft7TWvpcDU+P9yN6HZ9QlH3vPvXdvi6huvTPIzzy?=
 =?us-ascii?Q?dweq2B4sQoM3+50KtTfuykLkUO7yyMslu6GM7q5ofDnGqWes7xPg+RswjNr4?=
 =?us-ascii?Q?eRR9kJeK35aXTcLmJ1zqicdJqgTlCl3JSdAk9zzJ1wVnTpaMcX0kiiXSm+uR?=
 =?us-ascii?Q?Jjg9Ad1md6XeV8ZBNYrxm0tkEVLyfaR6EM5a+CeZQmv9hugbGlTiWxEOe1qC?=
 =?us-ascii?Q?nQfp8dwZEWWnoADYQLzjgKoPAMqp5cxywE/cxFEbSe/z9oMVdddNoS1LCnoM?=
 =?us-ascii?Q?XWNpSYTVEbGBx90b014qKebB4hoCtfJOIPGzGChbXP3KTcnd82zJv9/ThO/G?=
 =?us-ascii?Q?A8dzsD+WkzN0RVDGqnHNtAipBYbRDf5Mg7yat02Tk7Hc2D3uXO3K6G8fTzc3?=
 =?us-ascii?Q?l+N0WZPT/Pjgt/N+8tKaNp9zOKGpKspL609tjQINiJEpe+4qIAJN6Fpclxlc?=
 =?us-ascii?Q?+w/3i0hXxvb0MdInhEPCYvMIiJ1H5ctFx9LhF+mrG1VxHo3LW8AasVV/4qP6?=
 =?us-ascii?Q?oRsHh2FUMZM34bplHfFQft8odxScl5Qfg4sD48JhgPbQFuMhLWmEiDD+m3gA?=
 =?us-ascii?Q?EDWUjMB6FgE2Mwk5lALdtzBkpKTR/W7Jeg0rYVeP9gHUkSigbiCCOyqDga96?=
 =?us-ascii?Q?UKonReN6Ais/ntwkVINdjDRtp8bB6oT8w/WqFbGI29tMkQaXN1gTi9ueQUWf?=
 =?us-ascii?Q?0u+q5HPg1pEed6L0HKb3TKn37b48mnGWDr3XWXqKoB+E4b7m8j7AlxtlmLjk?=
 =?us-ascii?Q?pbUitCIBYc5nPn6Nzu8KFNL36tKeaSfW41FfPTZ1d+xx1dsAXm5z1NCgZeB/?=
 =?us-ascii?Q?W9pkPE6qQEg3HwU8LLBaenuAkH2MwpO/OdFL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f5cbab-a104-4989-4cdb-08ddbf7c159d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 06:36:21.5534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB2017
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

Nathan,

> I'm not sure this will work if the first minor frame is also missed (whic=
h can
> happen in some odd cases).  In that scenario, you need to iterate through=
 the
> schedule after resyncing the expected next major frame.
>=20
> Building off your changes, this should work:
>=20
> -    if ( sched_priv->num_schedule_entries < 1 )
> -        sched_priv->next_major_frame =3D now + DEFAULT_TIMESLICE;
> -    else if ( now >=3D sched_priv->next_major_frame )
> +    /* Switch to next major frame while handling potentially missed fram=
es */
> +    while ( now >=3D sched_priv->next_major_frame )
>      {
> -        /* time to enter a new major frame
> -         * the first time this function is called, this will be true */
> -        /* start with the first domain in the schedule */
>          sched_priv->sched_index =3D 0;
> -        sched_priv->next_major_frame =3D now + sched_priv->major_frame; =
-
>        sched_priv->next_switch_time =3D now +
> sched_priv->schedule[0].runtime; -    } -    else -    { -        while
> ( (now >=3D sched_priv->next_switch_time) && -              =20
> (sched_priv->sched_index < sched_priv->num_schedule_entries) ) + +     =20
>  if ( sched_priv->num_schedule_entries < 1 ) +        { +          =20
> sched_priv->next_major_frame +=3D DEFAULT_TIMESLICE; +          =20
> sched_priv->next_switch_time =3D sched_priv->next_major_frame; +        }
> +        else
>          {
> -            /* time to switch to the next domain in this major frame */
> -            sched_priv->sched_index++;
> -            sched_priv->next_switch_time +=3D
> -                sched_priv->schedule[sched_priv->sched_index].runtime;
> +            sched_priv->next_switch_time =3D sched_priv->next_major_fram=
e +
> +                sched_priv->schedule[0].runtime;
> +            sched_priv->next_major_frame +=3D sched_priv->major_frame;
>          }
>      }
> +    /* Switch minor frame or find correct minor frame after a miss */
> +    while ( (now >=3D sched_priv->next_switch_time) &&
> +            (sched_priv->sched_index < sched_priv->num_schedule_entries)=
 )
> +    {
> +        sched_priv->sched_index++;
> +        sched_priv->next_switch_time +=3D
> +            sched_priv->schedule[sched_priv->sched_index].runtime;
> +    }
> +
>=20
> Any chance you could give that a test and see if it fixes your issue?
>=20
>>=20
>> Can I get your advice on this subject?
>>=20
>> Should you have any questions about the description, please let me know.
>>=20
>> Here are the details to reproduce the issue on QEMUARM64.
>=20
> I assume you are also running on hardware, but just a warning that testin=
g real
> time scheduling on qemu can be a frustrating experience.
>=20
>      Nate
>>=20

I appreciate your suggestion on this subject.
I'm also running xen on real hardware but qemu seems to provide worse cases=
 to debug such as delayed timer interrupt and its effect.
The change you suggested works perfect and solves the issue I have observed=
.
As you have pointed out, my change will let the first domain run too long i=
n case the first minor frame is missed, giving no chances for other domains=
 in the major frame to get scheduled.

What would be the next step? Will you submit the patch or should I revise t=
he patch I have already submitted with the change you suggested?

https://patchwork.kernel.org/project/xen-devel/patch/26f4fb409f03cb221a9869=
2c4f291756d9cc26ae.1751948342.git.anderson.choi@boeing.com/

Thanks,
Anderson



