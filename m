Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA7163F20A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 14:51:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450738.708157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0jxD-0002N0-6D; Thu, 01 Dec 2022 13:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450738.708157; Thu, 01 Dec 2022 13:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0jxD-0002LE-3H; Thu, 01 Dec 2022 13:50:19 +0000
Received: by outflank-mailman (input) for mailman id 450738;
 Thu, 01 Dec 2022 13:50:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pMaK=37=citrix.com=prvs=3274cb7b8=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0jxB-0002L8-Tt
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 13:50:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14e064bd-717f-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 14:50:16 +0100 (CET)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 08:50:12 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by SJ0PR03MB5470.namprd03.prod.outlook.com (2603:10b6:a03:287::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 13:50:08 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 13:50:08 +0000
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
X-Inumbo-ID: 14e064bd-717f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669902616;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4sZ+c0NUaSMC2b5RgynT3sK3YTgGP7L9tJam7jwJR5Q=;
  b=PJG6EANk6mcp5pEpd93iy8pm815qcKtnR1tyHIVMv4bq43cZFiktY3ZW
   FtVI3yO6UPwT3etllDBb68V2cWdW6x41HhWakg8w83pp+PVPiHwQEkgBo
   DmoFmL7p+dbZQ8ag9LFVVMmpyPantj6G4EwnrdqkLwURA57Ebl0kwV++X
   A=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 86475071
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+edU66kQmFYzGYqaPf9Jwsvo5gymJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcDGCPbv/eY2b0ct1/b4y/9EIDup7dzoNqGVFlqylkRCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kR5AaGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 d80OQEDNlPdvMmdwJDnQLV8u8Y4Ata+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC8WDbWUoXiqcF9k0qGp
 2SA42PjBRIyP92D0zuVtHmrg4cjmAurBt5NSeXnr5aGhnWumUgsNBstdmKgmvumu27mUMp/B
 xQ9r39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOuMYoSBQw2
 1SOntevAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACAEDvN/qpdhrigqVF44yVqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraT1gbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:cWuURKjHcjyM3FUJ4If+7bkZknBQXukji2hC6mlwRA09TyXPrb
 HWoB17726QtN5yMEtLpTnkAsS9qBznmaKdjbN/AV7AZniFhILLFuFfBNDZslvd8kTFn4Y36U
 4HScZD4bbLfDtHZKjBgTVRvLwbsaG6GAzDv5a785/NJzsaDJ1d0w==
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="86475071"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMmN+Ok0RWQdU/v9atjDN9dzvlyvI7pxtt2RqS/R+0BzKANDVV3wBQMLMnEblGvp5fbgDzAcojKggQ37rCtbjuZNkavqQS5kh2PUVzofmFX5FGlsOw64/0xwqKAQznVQsveoRAifQJLzOu69DqveZYhT7tKHlsgdshi548Q2MHVfQiGKKgamLluefCXTj/aDMDLbqWCREbNXCYItXEEho51N5O6QKNl2r7WFwjDqT88IBhxmc4ldsOqZPMgcICF3z7ryZQgXVbdKlN1rcO03C4hDnMy7cudxq0c+L7wexXylyXu6apNXQolVsQXEl9dK1Xnp1LCRokjF35oO0DNnEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sZ+c0NUaSMC2b5RgynT3sK3YTgGP7L9tJam7jwJR5Q=;
 b=apeM9WAJsmWz3Wxg9tYcsDyM5c/5QKjOnGDt3IzR4/mDGg0dXxmhUvnzq/vpwLOzzB/y50hHcHkWtC5qAeXpu4pUiiCQhOpyXWLuuXOEo0ZgtnLTGxCSbLE1aaqe8aGTRI+ZtZ91U+4IL6Mk3CdocTFs8ydNJcxPJNUlAFMSrQzg3wnrhxKaMPTwLfxp1l4A7wZxkGm+WyjrljZm0hBR9kn8Gg3YjBEIEPEVvU9y8exQ+8qNzaKhjbS5r+tH9Qhy4knUSgn2KfkGDyBlEe7mRZ7T3XxzI1l9wnFXkWA2222N98ul8MNWbDmNzPZrimvULgLwFFAw8WmciZQgqbJ/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4sZ+c0NUaSMC2b5RgynT3sK3YTgGP7L9tJam7jwJR5Q=;
 b=Dfa7NT72bpaLvf5WweetVf9EOUzb8CRPh+fZmDxzuKWR6WK4TvL8HAbVN6DkQ1aHNBsibvIfGbqkHBFrSgpgWT83ZgXAVxVX8KABMEMTbJCh4B5W43KcpzdVDyxt3PgEI4WtYkqOsT56pfGYwqTrk4ncgIc0VTF2IFmoGinqBG4=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 3/5] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Topic: [PATCH v1 3/5] tools/ocaml/libs/xc: add hvm_param_get binding
Thread-Index: AQHZBOHXDfX2gYxBg0iCW8c7bxa9Ka5Y7MWAgAAhD4A=
Date: Thu, 1 Dec 2022 13:50:08 +0000
Message-ID: <A1F15A81-492C-42AF-B11E-43EFE3FF8BB3@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <63240681327af995df64b773945406b097a31d4b.1669829264.git.edvin.torok@citrix.com>
 <4ba26b93-a7b0-ee6d-f71f-6e0d78314697@citrix.com>
In-Reply-To: <4ba26b93-a7b0-ee6d-f71f-6e0d78314697@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|SJ0PR03MB5470:EE_
x-ms-office365-filtering-correlation-id: 1a2b54de-47a9-46ea-52c6-08dad3a2f58b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 z3VrRnvmzfWSVZch3E68E0c6lWvtJtlByKXFC7KI6PhVLdiwPUC+AYM5xUcVPJjSeWt75FkBzuyvT48AGE2dsAP3SADt72XwqOLOXne5zF29bVM9QNXu8ceGwuiLN93+Ca3MxAOqqJY5OifM/hx8M5lMJDtSIwV3AZgeVxCbAg15JyhMhL/817133YB5oAJKwp1kiPun2AgqXd/yWj3Z1DUgITzpqoGYh+/WucSRHnFfcPHTE2uvDhnT2weAd6DvvQTP6MJI2CGGgHCBBh4XcnRa1CgSPjVhoV5RjeMyoYyuwNKvyY7+ENy2Hw9dLOc7k9wL9ZKZG8YZ+3BqVmDiBPYriVr5oLaPaNOOenNw59YlIzoc+eJ5F1AcozhydSUx0HDNuClyjDlZFF17rP8+2XOGVppd1Z2syRUqJf/ejYBDzaXDJMjPtj2mTGxeeObDtLWISQJbWu4+m88acqY+uVtP+kIxpQr2tNhwA6fZNznhE3daPbTU5lVWUbO93xh6YQ9f9Qd5+nOPLxjHsCLBcYSPpr5fuza112sAtv1MgzN/BhXawypAI8KOUFn1n0xoTnv6PMYtM6F2zXRKIucbz2zbc45/FT1vz3elI6tk/aukEsNiFt3p46Z/Nws9sARfnfos9JE+TqfNLigOBm0432vhQn9uRxM1bhsQI8tuKiguOLyImZ6uSicA6fczjhXjN5B7+Ez0NQOlwSo+1DTN1U7JhnKh0jOTIGSnjN37TKM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199015)(316002)(6636002)(66946007)(36756003)(91956017)(76116006)(478600001)(2906002)(71200400001)(86362001)(82960400001)(38100700002)(83380400001)(107886003)(122000001)(33656002)(26005)(38070700005)(186003)(6512007)(6506007)(53546011)(2616005)(54906003)(6486002)(5660300002)(37006003)(8936002)(6862004)(41300700001)(66556008)(4326008)(66446008)(8676002)(64756008)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmxpWnhBUU1QdkJnRlNoeUJnMWlYSDRFS0NxcllRZUEzamdkTGVkbkl6cjlT?=
 =?utf-8?B?dDdqM3BjdWdHWEVhNlpKK1BIOHBIRFNyNXl5WEZVaEVHeEdwYUphT3RjcUNs?=
 =?utf-8?B?SE9weDg5R0g4VzNvcnB6OGpjdzNMVWliYlJVZWs5dW9qWFpJT0JTRWo2aXdI?=
 =?utf-8?B?clR3d0Fwa0dVcGtVdlhSeHUzUzRpQXdIYXRyaklud3lMOEhhY0VRWnFrUkhm?=
 =?utf-8?B?aU1DdUQ0Z0ljczIzYnNSd0dRbWlmVGpKM1RoNDFOMm84RlR0ZURjU25aeTcz?=
 =?utf-8?B?KzZUekNwTk00ZDVZVFBiTjlRZmVSWGpLK3I1enJQUHZsL3NZRlZlRHRIa3B0?=
 =?utf-8?B?UWRJTjd2UUJBL3VISHVObnpMWUNlUEpUOGpiUXVrVzAwaFU4VGh1T0pnZjZz?=
 =?utf-8?B?ZWk5YmwvTnNHdDJhcm4zRDNjVHR6S24xTjg2WFJ5OWdZdnhNV2FvN2pxMXdo?=
 =?utf-8?B?dDNpUXFaTGZkc3JYOWltblBjM3RtbUVmZ3VxU0pYaHJseTQ3UzdqWDFUTWdy?=
 =?utf-8?B?aXZjZWlIVzQvQXZjaElId2hZNXU3Qm8rLzJ0a2JMVHAwZEZ5Nm9iZ1B4bFFL?=
 =?utf-8?B?Y3AvbWJTUklibkJNVmJGY01KU3UyVkwzbk9xRGljUlpDbDYzSUlZUzhKVFpF?=
 =?utf-8?B?UnBOVk1VSy85L0ZocDJPZWcyemtNMG9nZDRtdkVjd3ZURHI4dXgvNUZYcjBt?=
 =?utf-8?B?RkVXaHB3eWFmeFUyZXBIQ1FhUG81dEZQV2tSbUxDby9uWTg5ZVQwNDc3bHRl?=
 =?utf-8?B?T0lVdXEvNHVDSUNsZ2dwK2lxYW5SYVA0alIwTkhyUU9qRGV5cTZuZlRENXEw?=
 =?utf-8?B?REgyVVRaQ2lsU0pVZlI1UWpDNEFySTJHVlRRUTZJN295M2E3aUJKWU8vaUVY?=
 =?utf-8?B?cjNlQTB6cURxM2ZSWEorNWpDeVVEcWlpamRORkNSaXZZV2VyemxaQ1BtTEc2?=
 =?utf-8?B?V3Z3LzdpY1RLeHNDMzhXTnR6KzJmZHZlWmV5RWcydTRYQitkb1BLWkl1ZkxT?=
 =?utf-8?B?TmZNSnpDVjFxU0JPOTRidFFBdXhrMmxzeFZ4cWxzUkJMYU5tSFREVzRlWW5Z?=
 =?utf-8?B?VkRVYjd6bGltM1Job3hVYTJneFhabXZEVkpzcUpkS1JuS09uOFJlYzFnNWRC?=
 =?utf-8?B?cGN0RnhHR3dIQ0hZb0JZaXRtcXMwZFRnTjh4SEphdmpqNnFheUxndkswYmg4?=
 =?utf-8?B?eUtBRUN4RktvVWtZT25RWWYrbVZnNzdseitQSmh0YmdpdjBmRjQ2QnMwbWpW?=
 =?utf-8?B?dlNVTUEzZFpSWC9ITDc3SWR1c1A3MHZHN0xvNU5FK1BxNWQva3ZBQ1pIWDF4?=
 =?utf-8?B?eHZkZ0ZreEd2RWpWcG1tY3lnMjVpemttR1pOVDBQMWdEdTJEMGZWVWdJd3RK?=
 =?utf-8?B?enh6R1orSEN3Y21EL2tkbGsxMlBFQkovaGgvRVdLS29CaGpYa2UvR3hHS1hq?=
 =?utf-8?B?UFpjZ29lVjN4NXN4SmZWSHBhRWZJQzNqeEd6QUdNWFlBZE00a1c5SHpyNyt1?=
 =?utf-8?B?RUJoc3pMaVVrQ0dlZG1hdDJIcmh2Q2lCQkswNGJrN0ZCcUFFTThXREVGN3Y5?=
 =?utf-8?B?UjQybkRNRVcvL1BFMVcxSFhHNERXQUFVUkpnOGtORVFIMVVoNkszYkUvQkxY?=
 =?utf-8?B?YmRMcFZWNmRZS1JYWkhkZlRnS2ZOZ2NUbURIUzZTNUNtbFpUTU5zNDMxbFph?=
 =?utf-8?B?TTQ2TmRKSlZ3YUpoVHcvaGJ3TXBKUlhBMERuN3RleThuV2dpRE1EbW5jREIz?=
 =?utf-8?B?ZHF4cjVqRlAwTUJ0WWtvL0g2R1Z1SEhKa2RoMnMva2pHUkpLcEVwNyt1c2xX?=
 =?utf-8?B?ME92SVcrb29RV0doQm81YTg3OURJUS8wSFhYeCt5ajVJZ0txTjJFNXlNVFcz?=
 =?utf-8?B?aEU0MTFZWjN0VndxWjRLazRhRkpYS0dtYUx4eWsrWkxCclROSmJtWFVVZm1m?=
 =?utf-8?B?SE0rUm1sNWJYYVRodEtZbElKSXNzRGo0NG1HL2NJTXhEYml4cG9CUEhqamxR?=
 =?utf-8?B?YkdaeDFabVdGZ2ZsYVZhVFZXK2lDZjluNWJPT09yNWxGcGs2SEsycnNKNzNm?=
 =?utf-8?B?N3FQbFlXRmJSZnhTRjVhMTA2YzVtcGl2M0svVmVtcW15KzNRb2hnNnJYa01t?=
 =?utf-8?B?OTRxL2hMRGI5aXlzRUo2TjVpWUZEYnlOeG5JMnpWWHZ2dEMrZWhHbGJCbGhS?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04B0FA1D8A987B4BB0022B934F78EF83@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i5uCzbph6N2tC2Acjw05/y1Qq6zQ2u01gG+6tQP6lo66yglNKTPGiHCz1/uG8WK/GytMwLDJ3+PZfDslRk7nKoiXeVL6yNMOOpqSOVQIxA8lr0KsK3QmqwN4qzHhMhbcRgxnErwRpu9sxqvcfmGlub5+nc4mxn+Vq/6h8ZABsdZuHD4A+ZqDpVNb77/+V3U79QnOjrgO257QvVL5rRDetdqYhC2g+ctDjZ/uLU1N8p/gVgoBTgpSfevcZHCFDiyn7aDMaoM4Z34CJw8ny0PIeO7kbPTLT7MDoHEJ05zIwpyHuzyYaky4eRVG/ieQ/aUD6+pOe/apSiOME4YEM8eAfPyR9WHX6ojvytouqlOZ6BCegX0DGtxqw9WfAaxBqc5PGMHYk8ojbYQPNyxBMc6CPejh8DCMChHk2WNvJSNJv7zrQhHz9ziwyByBKz7JaAIjBb6cgPzNp2fXsGJnqlh0pmCvpIwBWP+egZZIZ7WxE6JSdv58+blMxgu2jji/fOlYf65zV020GS22z6Ou0+9gmG36MLvXJ7VfSDbFoAk5NHYer/22jn0+q3wWzUKi9nU9mM4emfP9DRslwIeC3QOCVcEpnz3O7soA496/M/NzaTHTltnVBC0q8gNNvo73RkecRSwN1yhYV4o8v6yhIf4euSGARfQZhL9w6ToLSmlxLeKOQ83ijUpyHGvYKkkXWfBTbN+7yg/xwXRJnOSWmh2PkTznztLB04l2J+UGMY7UsNMWNcwHWF/rWyzU8zyai+78Z965vTIi4483A/vLncaSMko+wejFyJYabAIN4tt7nPQUqn8bfbLqiEXWztQMcRL3myx8H7KDIULFLQy8GVy7AA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2b54de-47a9-46ea-52c6-08dad3a2f58b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 13:50:08.3589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGGfZzSC9mAJZ32mKHY4m3NaEV/qnoXMN6KO3D0WGrBKWd4vxHDpEnPPNKC/wabVklUcwiy8ClsccKc7ZqRNYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5470

DQoNCj4gT24gMSBEZWMgMjAyMiwgYXQgMTE6NTEsIEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gMzAvMTEvMjAyMiAxNzozMiwgRWR3aW4g
VMO2csO2ayB3cm90ZToNCj4+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0
cmwubWxpIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saQ0KPj4gaW5kZXggNjBlNzkw
MmU2Ni4uZjZjN2U1YjU1MyAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVu
Y3RybC5tbGkNCj4+ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkNCj4+IEBA
IC0yMzYsNiArMjM2LDUxIEBAIGV4dGVybmFsIG1hcF9mb3JlaWduX3JhbmdlIDoNCj4+ICAgaGFu
ZGxlIC0+IGRvbWlkIC0+IGludCAtPiBuYXRpdmVpbnQgLT4gWGVubW1hcC5tbWFwX2ludGVyZmFj
ZQ0KPj4gICA9ICJzdHViX21hcF9mb3JlaWduX3JhbmdlIg0KPj4gDQo+PiArKCogbmVlZHMgdG8g
YmUgc29ydGVkIGFjY29yZGluZyB0byBpdHMgbnVtZXJpYyB2YWx1ZSwgd2F0Y2ggb3V0IGZvciBn
YXBzISAqKQ0KPj4gK3R5cGUgaHZtX3BhcmFtID0NCj4+ICsgIHwgSFZNX1BBUkFNX0NBTExCQUNL
X0lSUQ0KPj4gKyAgfCBIVk1fUEFSQU1fU1RPUkVfUEZODQo+PiArICB8IEhWTV9QQVJBTV9TVE9S
RV9FVlRDSE4NCj4+ICsgIHwgSFZNX1BBUkFNX1VOREVGSU5FRF8zDQo+IA0KPiBDYW4gd2UgcGVy
aGFwcyB1c2UNCj4gDQo+IHwgX0hWTV9QQVJBTV9VTkRFRl8zDQo+IA0KPiB3aXRoIGEgbGVhZGlu
ZyB1bmRlcnNjb3JlIHRvIGhpZ2hsaWdodCB0aGF0IGl0cyBqdXN0IGEgcGxhY2Vob2xkZXIgZm9y
IGENCj4gaG9sZSA/DQoNCkkgdHJpZWQgdGhpcywgYnV0IEkgZ2V0IGEgY29tcGlsZSBlcnJvciBp
ZiBJIGF0dGVtcHQgdG8gc3RhcnQgYSB2YXJpYW50IG5hbWUgd2l0aCBhbmQgdW5kZXJzY29yZS4N
Cg0KPiANCj4+ICsgIHwgSFZNX1BBUkFNX1BBRV9FTkFCTEVEDQo+PiArICB8IEhWTV9QQVJBTV9J
T1JFUV9QRk4NCj4+ICsgIHwgSFZNX1BBUkFNX0JVRklPUkVRX1BGTg0KPj4gKyAgfCBIVk1fUEFS
QU1fVU5ERUZJTkVEXzcNCj4+ICsgIHwgSFZNX1BBUkFNX1VOREVGSU5FRF84DQo+PiArICB8IEhW
TV9QQVJBTV9WSVJJRElBTg0KPj4gKyAgfCBIVk1fUEFSQU1fVElNRVJfTU9ERTANCj4gDQo+IEZy
b20gVElNRVJfTU9ERSBvbndhcmRzLCB5b3UgYXBwZWFyIHRvIGhhdmUgYSB0cmFpbGluZyBkaWdp
dCBvbiBlYWNoDQo+IGNvbnN0YW50IG5hbWUuICBJdCBhcHBlYXJzIHRvIGJlIHRoZSBmaW5hbCBk
aWdpdCBvZiB0aGUgcGFyYW1zIG51bWVyaWMNCj4gdmFsdWUuDQo+IA0KDQpJIHRoaW5rIEkgc2Vl
IGhvdyB0aGF0IGhhcHBlbmVkIChJIGhhZCB0aGUgbnVtYmVycyBzaWRlIGJ5IHNpZGUgdG8gY2hl
Y2sgdGhhdCBJIGZpbGxlZCBpbiBhbGwgdGhlIHdob2xlcywgYW5kIHRoZW4gdXNlZCB0aGUgd3Jv
bmcgcmVnZXggdG8gcmVtb3ZlIHRoZW0sDQp3aGljaCB3b3JrZWQgb24gc2luZ2xlIGRpZ2l0IG51
bWJlcnMsIGJ1dCBub3QgZG91YmxlKS4NCkknbSBmaXhpbmcgdGhpcyB1cCBpbiBteSB0cmVlIG5v
dy4NCg0KPj4gKyAgfCBIVk1fUEFSQU1fSFBFVF9FTkFCTEVEMQ0KPj4gKyAgfCBIVk1fUEFSQU1f
SURFTlRfUFQyDQo+PiArICB8IEhWTV9QQVJBTV9VTkRFRklORURfMTMNCj4+ICsgIHwgSFZNX1BB
UkFNX0FDUElfU19TVEFURTQNCj4+ICsgIHwgSFZNX1BBUkFNX1ZNODZfVFNTNQ0KPj4gKyAgfCBI
Vk1fUEFSQU1fVlBUX0FMSUdONg0KPj4gKyAgfCBIVk1fUEFSQU1fQ09OU09MRV9QRk43DQo+PiAr
ICB8IEhWTV9QQVJBTV9DT05TT0xFX0VWVENITjgNCj4+ICsgIHwgSFZNX1BBUkFNX0FDUElfSU9Q
T1JUU19MT0NBVElPTjkNCj4+ICsgIHwgSFZNX1BBUkFNX01FTU9SWV9FVkVOVF9DUjAwDQo+PiAr
ICB8IEhWTV9QQVJBTV9NRU1PUllfRVZFTlRfQ1IzMQ0KPj4gKyAgfCBIVk1fUEFSQU1fTUVNT1JZ
X0VWRU5UX0NSNDINCj4+ICsgIHwgSFZNX1BBUkFNX01FTU9SWV9FVkVOVF9JTlQzMw0KPj4gKyAg
fCBIVk1fUEFSQU1fTkVTVEVESFZNNA0KPj4gKyAgfCBIVk1fUEFSQU1fTUVNT1JZX0VWRU5UX1NJ
TkdMRV9TVEVQNQ0KPj4gKyAgfCBIVk1fUEFSQU1fVU5ERUZJTkVEXzI2DQo+PiArICB8IEhWTV9Q
QVJBTV9QQUdJTkdfUklOR19QRk43DQo+PiArICB8IEhWTV9QQVJBTV9NT05JVE9SX1JJTkdfUEZO
OA0KPj4gKyAgfCBIVk1fUEFSQU1fU0hBUklOR19SSU5HX1BGTjkNCj4+ICsgIHwgSFZNX1BBUkFN
X01FTU9SWV9FVkVOVF9NU1IwDQo+PiArICB8IEhWTV9QQVJBTV9UUklQTEVfRkFVTFRfUkVBU09O
MQ0KPj4gKyAgfCBIVk1fUEFSQU1fSU9SRVFfU0VSVkVSX1BGTjINCj4+ICsgIHwgSFZNX1BBUkFN
X05SX0lPUkVRX1NFUlZFUl9QQUdFUzMNCj4+ICsgIHwgSFZNX1BBUkFNX1ZNX0dFTkVSQVRJT05f
SURfQUREUjQNCj4+ICsgIHwgSFZNX1BBUkFNX0FMVFAyTTUNCj4+ICsgIHwgSFZNX1BBUkFNX1g4
N19GSVBfV0lEVEg2DQo+PiArICB8IEhWTV9QQVJBTV9WTTg2X1RTU19TSVpFRDcNCj4+ICsgIHwg
SFZNX1BBUkFNX01DQV9DQVA4DQo+IA0KPiBTaW1pbGFybHkgd2l0aCBFVkVOVFNUQVRfKiwgd2Ug
b3VnaHQgdG8gZW5nYWdlIHRoZSBidWlsZCB0aW1lIEFCSSBjaGVjay4NCg0KDQpJdCBsb29rcyBs
aWtlIHdlJ2QgbmVlZCB0byB3cml0ZSBhIG5ldyBBQkkgY2hlY2ssIGJ1dCBJJ20gbm90IGZhbWls
aWFyIHdpdGggdGhlIEFCSSBjaGVja2VyIHNjcmlwdCBoZXJlLA0KYW5kIHJlbHlpbmcgb24gYSBz
Y3JpcHQgdG8gcGFyc2UgdGhlIE9DYW1sIHNvdXJjZSBjb2RlIGFuZCBjaGVjayB0aGUgQUJJIHNl
ZW1zIGJyaXR0bGUgKGJ1dCBubyBsZXNzIGJyaXR0bGUgdGhhbiBub3QgaGF2aW5nIGEgY2hlY2sg
YXQgYWxsKS4NCg0KU2hvdWxkIHdlIGluc3RlYWQgc3dpdGNoIHRvIHVzaW5nIGN0eXBlcyB0byBn
ZW5lcmF0ZSB0aGVzZSBjb25zdGFudHM/IEl0IGNhbiBydW4gYXQgYnVpbGQgdGltZSBhbmQgcHJv
ZHVjZSBhIC5tbCBmaWxlIGJhc2VkIG9uIGEgYnVpbGQgdGltZSB0ZXN0DQpieSBpbmNsdWRpbmcg
dGhlIGFjdHVhbCBDIGhlYWRlciBhbmQgZ2V0dGluZyB0aGUgY29ycmVjdCBjb25zdGFudCB2YWx1
ZS4gQnV0IGl0J2QgbWFrZSBjcm9zcy1jb21waWxhdGlvbiAoaWYgWGVuIHN1cHBvcnRzIHRoYXQ/
KSBtb3JlIGRpZmZpY3VsdC4NCk9yIHdlIGNvdWxkIHJ1biBpdCBvdXJzZWx2ZXMgYnkgaGFuZCwg
YW5kIGNvbW1pdCB0aGUgcmVzdWx0IHNvIHRoYXQgZW5kLXVzZXJzIGRvIG5vdCBuZWVkIHRvIGhh
dmUgb3IgcnVuIGN0eXBlcywganVzdCBkZXZlbG9wZXJzIHdobyBjaGFuZ2UgdGhlc2UgYmluZGlu
Z3MNCihzaW1pbGFyIHRvIGhvdyBpdCBpcyB1c3VhbCB0byBjb21taXQgdGhlIG91dHB1dCBmcm9t
IGF1dG9jb25mIGFuZCBhdXRvbWFrZSBpbnRvIGdpdCB0byBub3QgcmVxdWlyZSBlbmQtdXNlcnMg
dG8gcmVydW4gdGhlc2UpLg0KDQpIb3dldmVyIGEgbW92ZSB0byBjdHlwZXMgd291bGQgcmVxdWly
ZSBxdWl0ZSBhIGxvdCBvZiBidWlsZCB0aW1lIGNoYW5nZXMgdGhhdCBJJ2QgcmF0aGVyIHN0YXJ0
IG9ubHkgb25jZSB3ZSBzd2l0Y2hlZCB0byBEdW5lLCBpdCBpcyBub3Qgd29ydGh3aGlsZSBkb2lu
ZyBpbiB0aGUgY3VycmVudCBNYWtlZmlsZSBiYXNlZA0KYnVpbGQgc3lzdGVtLg0KDQo+IA0KPiBC
dXQgdGhlcmUgaXNuJ3QgYSBzdWl0YWJsZSBlbmQgZGVsaW1pdGVyLCBhbmQgdGhlc2UgYXJlIG9u
bHkgZXZlciBhbg0KPiBpbnB1dCBpbnRvIGEgYmluZGluZyAobmV2ZXIgYSByZXR1cm4pLCBzbyBp
dCdzIG5vdCB0aGUgZW5kIG9mIHRoZSB3b3JsZA0KPiBpZiBuZXcgY29uc3RhbnRzIGdldCBtaXNz
ZWQuICAoTm90IHRoYXQgbmV3IGNvbnN0YW50cyBhcmUgbGlrZWx5LiANCj4gSFZNX1BBUkFNcyBh
cmUgYSBncm9zcyBib2RnZSB3aGljaCBJJ20gdHJ5aW5nIHRvIHBoYXNlIG91dC4pDQo+IA0KPj4g
Kw0KPj4gK2V4dGVybmFsIGh2bV9wYXJhbV9nZXQ6IGhhbmRsZSAtPiBkb21pZCAtPiBodm1fcGFy
YW0gLT4gaW50NjQNCj4+ICsgID0gInN0dWJfeGNfaHZtX3BhcmFtX2dldCINCj4gDQo+IElNTyB3
ZSBzaG91bGQgYmluZCBzZXQgYXQgdGhlIHNhbWUgdGltZS4gIEl0J3MgdHJpdmlhbCB0byBkbywg
YW5kIGZhcg0KPiBlYXNpZXIgdG8gZG8gbm93IHRoYW4gYXQgc29tZSBwb2ludCBpbiB0aGUgZnV0
dXJlIHdoZW4gd2UgZmlyc3QgbmVlZCBpdC4NCj4gDQo+PiArDQo+PiBleHRlcm5hbCBkb21haW5f
YXNzaWduX2RldmljZTogaGFuZGxlIC0+IGRvbWlkIC0+IChpbnQgKiBpbnQgKiBpbnQgKiBpbnQp
IC0+IHVuaXQNCj4+ICAgPSAic3R1Yl94Y19kb21haW5fYXNzaWduX2RldmljZSINCj4+IGV4dGVy
bmFsIGRvbWFpbl9kZWFzc2lnbl9kZXZpY2U6IGhhbmRsZSAtPiBkb21pZCAtPiAoaW50ICogaW50
ICogaW50ICogaW50KSAtPiB1bml0DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94
Yy94ZW5jdHJsX3N0dWJzLmMgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0K
Pj4gaW5kZXggNjdmMzY0ODM5MS4uYjJkZjkzZDRmOCAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL29j
YW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jDQo+PiArKysgYi90b29scy9vY2FtbC9saWJzL3hj
L3hlbmN0cmxfc3R1YnMuYw0KPj4gQEAgLTExNzYsNiArMTE3NiwyMiBAQCBDQU1McHJpbSB2YWx1
ZSBzdHViX3hjX2RvbWFpbl9pcnFfcGVybWlzc2lvbih2YWx1ZSB4Y2gsIHZhbHVlIGRvbWlkLA0K
Pj4gICAgIENBTUxyZXR1cm4oVmFsX3VuaXQpOw0KPj4gfQ0KPj4gDQo+PiArQ0FNTHByaW0gdmFs
dWUgc3R1Yl94Y19odm1fcGFyYW1fZ2V0KHZhbHVlIHhjaCwgdmFsdWUgZG9taWQsIHZhbHVlIHBh
cmFtKQ0KPj4gK3sNCj4+ICsgICAgQ0FNTHBhcmFtMyh4Y2gsIGRvbWlkLCBwYXJhbSk7DQo+PiAr
ICAgIHVpbnQ2NF90IHJlc3VsdDsNCj4gDQo+IHJlc3VsdCBpcyBjb21tb25seSBhIHZhbHVlIGlu
IHRoZXNlIGJpbmRpbmdzLiAgJ3ZhbCcgd291bGQgYmUgdGhlIG1vcmUNCj4gY29tbW9uIG5hbWUg
dG8gdXNlIGhlcmUuDQo+IA0KPiB+QW5kcmV3DQoNCg==

