Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3B1648AB0
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 23:18:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458307.716212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3lhE-0002nC-PO; Fri, 09 Dec 2022 22:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458307.716212; Fri, 09 Dec 2022 22:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3lhE-0002jn-Lh; Fri, 09 Dec 2022 22:18:20 +0000
Received: by outflank-mailman (input) for mailman id 458307;
 Fri, 09 Dec 2022 22:18:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vX0=4H=citrix.com=prvs=3351f26b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p3lhD-0002jh-5N
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 22:18:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60abacaa-780f-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 23:18:17 +0100 (CET)
Received: from mail-sn1nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Dec 2022 17:18:15 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5122.namprd03.prod.outlook.com (2603:10b6:408:da::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 22:18:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 22:18:12 +0000
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
X-Inumbo-ID: 60abacaa-780f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670624297;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4VvoiurTIRcFDyaJT1J6saju4JtfCw1P/3KaeTaG2ZA=;
  b=Y9AR3FX948KwZkExSTrtvrvQ/i4/TN5W5HKRLoqWWA+bgZ7aFzKAA2IX
   mJ1GJIgtu9qmsz1X7kMugUmjAh0EkCB8jHPga9FwKZAAWNfYruvs8I7MB
   SsVCHUMid1zORTzKGMLnY9YaR8MeNATTi9xkX+zfpMsoDar+s3caVXuvj
   Q=;
X-IronPort-RemoteIP: 104.47.57.46
X-IronPort-MID: 90131168
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gSOdU6xLVlTzXCXCkNZ6t+e5xyrEfRIJ4+MujC+fZmUNrF6WrkUCy
 2IaCGmCPfyONGv1c9F1a4Ww/U8A6pfQm9RiQVA++CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkPaET5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUto9
 vYyKy4kVCignuLnnb7ie8Nuuv12eaEHPKtH0p1h5RfwKK58BKvlGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVkFIZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKjAdlLTePonhJsqH+onUc4NxxRb3iy+8fhgE6UR+xEa
 FNBr0LCqoB3riRHVOLVXQC8oXOClg4RXZxXCeJSwCGAzLDFpTmQAGcsRyRELtchsaceXic23
 1WEm9foAz1Hs7CPT3+ZsLCOoluaEyUPMXULYyNCaAIf+sTiu6k6lBeJRdFmeIaKg9yzMjH9x
 RiDti14jLIW5eY10KG88UHCkiibjJHDRQ4o5S3aRmugqAh+YeaNd4GurFTW8/tEBIKYVUWa+
 mgJndCE6+IDBo3LkzaCKNjhB5ms7veBdSba2FhmGsF78yz3oyL9O4dN/Dt5OUFldN4efiPka
 1PSvgUX44JPOHytbul8ZIfZ59kW8JUM3O/NDpj8BueiqLAoHONb1EmCvXKt4l0=
IronPort-HdrOrdr: A9a23:0BmBg6NdOrAk38BcTnqjsMiBIKoaSvp037Dk7SFMoHtuA6qlfq
 GV7ZMmPHrP4gr5N0tMpTntAsW9qDbnhP1ICWd4B8bfYOCkghrUEGlahbGSvAEIYheOiNK1t5
 0BT0EOMqyVMbEgt7eC3ODQKb9Jq+VvsprY59s2qU0DcegAUdAE0+4WMGim+2RNNXh7LKt8Op
 qAx9ZN4wGtcW4Qaa2AdwM4dtmGid3XtY7sJSULDR4/6AWIkFqTmcXHOind8BcCci9FhYwv+2
 jdkwD/++GKvvyhxgXHvlWjn6h+qZ/OysZjGMfJsMQTJzn24zzYHLhcZw==
X-IronPort-AV: E=Sophos;i="5.96,232,1665460800"; 
   d="scan'208";a="90131168"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgMfLqH1kKEGXvXCR/3mnAuCnaY3cfdVT+Ing3NpsQmKxrquqANWFH7XV+PAHqQzR4fNGDAGj5A2VNulQ1jQqAIp9TsfKLSQ0Lu+0Xyy2vOx9umOgB1iJ2foB7HidKJOo9pL7GL0wuoKvgxkWDxC7xAn2KfS9/+u7CHjowOBcwNiqZ3LH2bI58s1EJ6M1KKdxlTM504oefya70+XNPCwpQZjDPZrNUwbMuCLxsyZWiU6RFm4C4G2mkuLCMsNTw70ZJG01DPn6EKVTYKox0tTlaF/Ks9ZBZakNkRdaB3w8e0fwpzvMg2/47UOTJQCl6LWlp0uNdGl9OX4Wjka7dO64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VvoiurTIRcFDyaJT1J6saju4JtfCw1P/3KaeTaG2ZA=;
 b=DcMP5/L6hQ1c15ED5Pe1FqyQ9pM0LPvaOQFjMKlzywk5q1Kvl5nWJ5Wpc+Sgwsf7e26w1FXHu8YVqmAiaT6i3ABmeCI4gzXmFKB2uzi75e31GKQLDfG81kIVH8vBkp1zQBy6BtyXajqL84iLkvfrkTVYsgHuOW2Hxg5UWv7GIgL6eC70D8CX4a0tnIt3B1KEpsKG5qTKOzjX5YVqNUDJPjEpy8BLdZ9mBnHd2Q/U3fbwhxP9ssTbsA7WUH0K3Z7XJHBL1ZHcTzeZ4g2hU+ObnZNb0oSHUeS2omNvkjylaqIa/6SgvFJOYStWqlKPV44hoC65qLDFO/eDI7ELKTpvUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VvoiurTIRcFDyaJT1J6saju4JtfCw1P/3KaeTaG2ZA=;
 b=gVo1pupBK7qDwe81FXQerD24TXc2jgMY/Evl/IsFaPxasJwQwKbVgCoh/I/oqCXTIkxMJTjZnH1Jbe41e0Ht+qlNpJYtnIr80baEsnTItMnxwHAj+j7puKQHL9N4ik1NH3vQx6cEL5DlMvocEhZUHXRg/xNWL/WshxncCKuwd7E=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
CC: Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index:
 AQHY36RYpnqEmDBlDEOtMGFZEODQVK4NsO2AgAANc4CAAYyLAIBUWeeAgAKahgCAADmfAA==
Date: Fri, 9 Dec 2022 22:18:12 +0000
Message-ID: <b9a2d6c7-fb09-a89a-14ef-09bc197afa0f@citrix.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
 <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
 <AS8PR08MB799170627B34BD2627CE3092921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org>
In-Reply-To: <e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN8PR03MB5122:EE_
x-ms-office365-filtering-correlation-id: 66a60598-db48-4d0f-f0f3-08dada3342e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jttIbyGJCGAR2YbhuNdQjX9Sg+2aYkewaXMaDXD5PzTWekGIelROuovegkQC+uTO0WZJCnXcpSmrzHoyFK5aBFGXFJhmm8OSfQqa/kGGt/77gK08eCXV9Wue6wtJzPMPYsPGE4J4XAh9mnIFkosecPGrhWDRdeEqEY77chNT6a19ktMNhlaqs/NrQRdrPOedhIm0/+OBTki8CfLtJky2qnTtb/J0uP+kd66gW/G+F4BLdY3qUoGtqzvuSV26/9HRAVhggm1t3fEKMYjY+yyZUTzE1UxDfPrvKiaIqMrr9/fHezmX3A4zep3hNwdNFQxLMonnNTkRyw0NkzLZtHc7cU/hgQP2xdCXa+HGeltfcqeogntNZIKssJlezbXt6YufVkCuUYAL8BlwdlsBdlNQZ/iu77EJmcHk9AarVM/wsAiNHveo5odlGg8w9VMiqTCID4Cy2XZoJzakyivlndPy2MuiSMjZhT4p5eaaIXiZUKcM8F+8xpKFx3jNPrXyqjvEir+OYACr6wcJxN1g9/+K/oOMMEhkNjyocFLJdIgYydFFSEDuaMhALCxyPVcWNppdjNnY7grFfnZY2aCdeT0QLJWVEZAKoNPgmG6cBH0XfGDlAQcRQMVg0bywWZKLKAPUq+qWXdfhLAiigUloYvolpX5xdzL9gkLhpF7QB6A4DpZ8K1iAM7IqvAbzfdVNyFThxvtZh8FZdGM2wfAJ7/cdIesMgW1nkyTdjjJDKOaIaEpGO9SDn9KdSBNEsZsdwHrrzCmD3Z3URVUPUEOp/rkOBQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199015)(66899015)(38100700002)(31686004)(36756003)(66446008)(2906002)(83380400001)(82960400001)(8936002)(5660300002)(86362001)(38070700005)(41300700001)(122000001)(8676002)(6486002)(54906003)(110136005)(66556008)(2616005)(71200400001)(316002)(66476007)(478600001)(66946007)(91956017)(4326008)(31696002)(64756008)(76116006)(6512007)(186003)(53546011)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c0FwcS9MV1oxeFFUTTNNVFB3c0VOS01KekJGbGNUOHErekJVbng1U1ZGckMz?=
 =?utf-8?B?Z0VlN29ZUExEMUdyakVpOVVkckZld0dxVE5OdXMwN1FaZ29ETWdmRW1aU0Fr?=
 =?utf-8?B?Y0xzWTAxZlpGWndFbWFTSGIrTkoraitQT3VvdGc2ZlhPOGkzYkQwZmlpSWRH?=
 =?utf-8?B?NW9YTVRKR1BvVDlJOEJRTVZQY3BVMGlGN1VFU3Q5SkxPL1hwanEyQlBOL29Z?=
 =?utf-8?B?bkZaZDhqbnFXZldIeldMY1RWbkU5KzFqTDZQalRKN2lTQ0NKSkIwbzhZWHln?=
 =?utf-8?B?UVhjbUdIM0QvT0ZobnRJWXNid2M0K0hNd3FaUEUvYnVtSHNhRGpDM0x6T2x1?=
 =?utf-8?B?clNYMGhkSGhyZXlJMHRhWkhhZXI0UGYrTy9HT2xTVWJlL3dzSCsxNzRUMDZT?=
 =?utf-8?B?Ny9yNXBRRDdBNG9QS2RoSWZYNGp4VWF1RXZLWTNscExCa1M0bUpYcUR0UDNt?=
 =?utf-8?B?a0dTQ1NkdkJKMURobkgydGlFV2p6Y1U4QzUzKzlNN2xheVJpemNNcnhVUUgz?=
 =?utf-8?B?ZHZ3cFV5VzlqeE9JV21aa1l2MThDVkk1NmQwVHRFZVVLWlRhSW1wUm1TR1dG?=
 =?utf-8?B?T1RERVMzeUVmaUNuNFVGdSthejVFTi80MzhxSkpZRHlpVEJQTEFSVjBENTY4?=
 =?utf-8?B?czFha1Y3bjQvM2RoQ2oxRHpoU2FQaVRSL2RSQVB6TWFmTmFmTExtK1ZUMElj?=
 =?utf-8?B?Y1JmZFVPTldWeFYzc1pnZE13em1qZnVLdXVYU05lWm1rNEhyZ1pERkFUOElG?=
 =?utf-8?B?amFDbjdFUW90Y3hCNWtUenNjSWpxVHV2OC9NRHNQWkRZOUVEc3EwMHVXTWFC?=
 =?utf-8?B?VkNBSVRIeC9rZEtmcFdFSzg5WitzcldjSDl2QWF3V0pJSXB4YUE0anRqQ0I2?=
 =?utf-8?B?cm10MXZFbWsxZ01sWEdGbWZxcDhQbm5HaTBERlRINmwrbytDNTVTUWVQUmY1?=
 =?utf-8?B?THZlS2Nwbk8vTHRMdlFhNmU1cDZhYnF2SytKWWh5c0k4NDhIR1dpRlJ5YlVt?=
 =?utf-8?B?enlkbEhwK2dEcDFybFJyYkRuZ0JMVWlsSGswNGd0RXlBd3pQUUVGVTRXZVdj?=
 =?utf-8?B?NThyMTQ4bFNORXdibktpcXE2Myt5SkdSMTRPV3c0UnZzTlRuZGRLZ1d4cm9h?=
 =?utf-8?B?QjJFNlpCRGxvRkpHRzEzQUpONm9wcTE0S2V5ejB5MlVqREdmQVlZbEV0YURv?=
 =?utf-8?B?azA5d2pSbERwOFVEQVdmOTllbnd0eEk5Um5wZ2Z0bmNISzVVRlN5bHhERWRF?=
 =?utf-8?B?ajJaMTFZQTNmNDJFMjNIY2QrMWtyaGlrcnFRRXdNMUZaYldpNXFyRXFXS1pz?=
 =?utf-8?B?ckJhMDRraDk5T3l1cTd6dklNRVhqbXl1YWhPUEF2VzA1L3cvTXc0OVBrcFBG?=
 =?utf-8?B?dVhycmhCMk10dWFJSkZhTGJoYitQQkVvZ1JzNSsyU0krMUZsbGs0RFZMVlNO?=
 =?utf-8?B?L0RoZXVBRTgxdUZWbG1sVEtlUDVMOVdKSmVJYlZhU0grVkFMTW9VTzBtRzZI?=
 =?utf-8?B?TU1DM2lxSC9tYncyWktHNk94WGd0L1RuR1lWOE1QVzJvVDc5WmhQTVFFMzBL?=
 =?utf-8?B?czlOWGZyNGFWVUVVNVQ4ZnJJeWIwZ1MyaEQ5ajUxS3VKa2c2RjFoUm44a2lS?=
 =?utf-8?B?VGs1SVg2TDQzNGt3bjduekhGckNnTDBXZGtwRm1tQ1Nlc3ZDUHU3WHY3UWZ5?=
 =?utf-8?B?UGlIcjg3Unl2WTBpeDZkNE5XTW9aZGljWWcvTUVlbmtIZ0xQQ2R4QlNsSmQz?=
 =?utf-8?B?L3dzV2FqMlhQTFdzeEdrZ2YwWjUraGR3amovNjJmUmJHeTZPQnovTmNnRXpY?=
 =?utf-8?B?YTlsZkwyTnBmc2tLcTlNbEFrS2hMWlFnRXpzT2lpVjMybnJMeCtKaG9jZVFy?=
 =?utf-8?B?cUFIWWV2WXpTdlNIRURSVEV1OWl6M0N3ZEkxeXRXb2F2QjV3OE9UK1Q0TTJ5?=
 =?utf-8?B?bXB1ZEIvT1ZiWlh3TUZjSmp2SXQ0blJtM0l0T1k3UFRCa3Fpd0c0UVNMTG4w?=
 =?utf-8?B?THNYNWZiZkE4WWkvRVovQnJjdHprakp5Q3ZZK3A4UUZqT1ZEL0ZLS280TjMw?=
 =?utf-8?B?WE9aT09LWnFMTkFzMFRyUzQraWdkVzJkOXNlYWMyTkhDa0NYbFJxL3UwQU5h?=
 =?utf-8?Q?CPxfRkKKjpTg0Ud/MTgh/adRE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDBD4D862DA5CE458085181AD6B01853@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a60598-db48-4d0f-f0f3-08dada3342e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 22:18:12.6652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iXF1phZnkXE2MdZd3gOvpOY/5TUMNSxSN3DEUluqprzmAUUcH5fycGvqR18hs/0Fkr67hzUIqqrDVgkyxxQz3aIZrwSkMfdY4KCEkrRN7ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5122

T24gMDkvMTIvMjAyMiAxODo1MSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBIZW5yeSwNCj4N
Cj4gT24gMDgvMTIvMjAyMiAwMzowNiwgSGVucnkgV2FuZyB3cm90ZToNCj4+IEkgYW0gdHJ5aW5n
IHRvIHdvcmsgb24gdGhlIGZvbGxvdy11cCBpbXByb3ZlbWVudHMgYWJvdXQgdGhlIEFybSBQMk0N
Cj4+IGNvZGUsDQo+PiBhbmQgd2hpbGUgdHJ5aW5nIHRvIGFkZHJlc3MgdGhlIGNvbW1lbnQgYmVs
b3csIEkgbm90aWNlZCB0aGVyZSB3YXMgYW4NCj4+IHVuZmluaXNoZWQNCj4+IGRpc2N1c3Npb24g
YmV0d2VlbiBtZSBhbmQgSnVsaWVuIHdoaWNoIEkgd291bGQgbGlrZSB0byBjb250aW51ZSBhbmQg
aGVyZQ0KPj4gb3BpbmlvbnMgZnJvbSBhbGwgb2YgeW91IChpZiBwb3NzaWJsZSkuDQo+Pg0KPj4+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz4NCj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSB4ZW4vYXJtOiBwMm06IFBv
cHVsYXRlIHBhZ2VzIGZvciBHSUN2Mg0KPj4+IG1hcHBpbmcgaW4NCj4+PiBhcmNoX2RvbWFpbl9j
cmVhdGUoKQ0KPj4+Pj4gSSBhbHNvIG5vdGljZWQgdGhhdCByZWxpbnF1aXNoX3AybV9tYXBwaW5n
KCkgaXMgbm90IGNhbGxlZC4gVGhpcw0KPj4+Pj4gc2hvdWxkDQo+Pj4+PiBiZSBmaW5lIGZvciB1
cyBiZWNhdXNlIGFyY2hfZG9tYWluX2NyZWF0ZSgpIHNob3VsZCBuZXZlciBjcmVhdGUgYQ0KPj4+
Pj4gbWFwcGluZyB0aGF0IHJlcXVpcmVzIHAybV9wdXRfbDNfcGFnZSgpIHRvIGJlIGNhbGxlZC4N
Cj4+DQo+PiBGb3IgdGhlIGJhY2tncm91bmQgb2YgdGhlIGRpc2N1c3Npb24sIHRoaXMgd2FzIGFi
b3V0IHRoZSBmYWlsdXJlIHBhdGggb2YNCj4+IGFyY2hfZG9tYWluX2NyZWF0ZSgpLCB3aGVyZSB3
ZSBvbmx5IGNhbGwgcDJtX2ZpbmFsX3RlYXJkb3duKCkgd2hpY2ggZG9lcw0KPj4gbm90IGNhbGwg
cmVsaW5xdWlzaF9wMm1fbWFwcGluZygpLi4uDQo+IFNvIGFsbCB0aGlzIG1lc3Mgd2l0aCB0aGUg
UDJNIGlzIG5lY2Vzc2FyeSBiZWNhdXNlIHdlIGFyZSBtYXBwaW5nIHRoZQ0KPiBHSUN2MiBDUFUg
aW50ZXJmYWNlIGluIGFyY2hfZG9tYWluX2NyZWF0ZSgpLiBJIHRoaW5rIHdlIHNob3VsZA0KPiBj
b25zaWRlciB0byBkZWZlciB0aGUgbWFwcGluZyB0byBsYXRlci4NCj4NCj4gT3RoZXIgdGhhbiBp
dCBtYWtlcyB0aGUgY29kZSBzaW1wbGVyLCBpdCBhbHNvIG1lYW5zIHdlIGNvdWxkIGFsc28gdGhl
DQo+IFAyTSByb290IG9uIHRoZSBzYW1lIG51bWEgbm9kZSB0aGUgZG9tYWluIGlzIGdvaW5nIHRv
IHJ1biAodGhvc2UNCj4gaW5mb3JtYXRpb24gYXJlIHBhc3NlZCBsYXRlciBvbikuDQo+DQo+IFRo
ZXJlIGlzIGEgY291cGxlIG9mIG9wdGlvbnM6DQo+IMKgMS4gSW50cm9kdWNlIGEgbmV3IGh5cGVy
Y2FsbCB0byBmaW5pc2ggdGhlIGluaXRpYWxpemF0aW9uIG9mIGEgZG9tYWluDQo+IChlLmcuIGFs
bG9jYXRpbmcgdGhlIFAyTSBhbmQgbWFwIHRoZSBHSUN2MiBDUFUgaW50ZXJmYWNlKS4gVGhpcyBv
cHRpb24NCj4gd2FzIGJyaWVmbHkgZGlzY3Vzc2VkIHdpdGggSmFuIChzZWUgWzJdKS4vDQo+IMKg
Mi4gQWxsb2NhdGUgdGhlIFAyTSB3aGVuIHBvcHVsYXRlIHRoZSBQMk0gcG9vbCBhbmQgZGVmZXIg
dGhlIEdJQ3YyDQo+IENQVSBpbnRlcmZhY2UgbWFwcGluZyB1bnRpbCB0aGUgZmlyc3QgYWNjZXNz
IChzaW1pbGFyIHRvIGhvdyB3aXRoIGRlYWwNCj4gd2l0aCBNTUlPIGFjY2VzcyBmb3IgQUNQSSku
DQo+DQo+IEkgZmluZCB0aGUgc2Vjb25kIG9wdGlvbiBpcyBuZWF0ZXIgYnV0IGl0IGhhcyB0aGUg
ZHJhd2JhY2sgdGhhdCBpdA0KPiByZXF1aXJlcyBvbiBtb3JlIHRyYXAgdG8gdGhlIGh5cGVydmlz
b3IgYW5kIHdlIGNhbid0IHJlcG9ydCBhbnkNCj4gbWFwcGluZyBmYWlsdXJlICh3aGljaCBzaG91
bGQgbm90IGhhcHBlbiBpZiB0aGUgUDJNIHdhcyBjb3JyZWN0bHkNCj4gc2l6ZWQpLiBTbyBJIGFt
IGxlYW5pbmcgdG93YXJkcyBvcHRpb24gMi4NCj4NCj4gQW55IG9waW5pb25zPw0KDQpBIERPTUNU
TF9jcmVhdGlvbl9maW5pc2hlZCBoeXBlcmNhbGwgKG5hbWUgc3ViamVjdCB0byBpbXByb3ZlbWVu
dCkgaXMNCm1hbmRhdG9yeSBmb3IgZW5jcnlwdGVkIFZNIHN1cHBvcnQgaW4geDg2ICh0aGVyZSdz
IGNyeXB0byBuZWVkZWQgYXQgdGhpcw0KcG9pbnQgdG8gY29tcGxldGUgdGhlIG1lYXN1cmVtZW50
IG9mIHRoZSBndWVzdCBhbmQgY3JlYXRlIGFuIGF0dGVzdGF0aW9uDQpyZXBvcnQpLCBzbyB3ZSBh
cmUgZ29pbmcgdG8gZ2FpbiBzb21ldGhpbmcgdG8gdGhpcyBlZmZlY3Qgb25lIHdheSBvcg0KYW5v
dGhlci4NCg0KU3VjaCBhIGh5cGVyY2FsbCBhbHNvIHJlbW92ZXMgdGhlIGdpYW50IGJvZGdlIG9m
IHVzaW5nDQpkb21haW5fdW5wYXVzZV9ieV9zeXN0ZW1jb250cm9sbGVyKCkgZm9yIHRoaXMgcHVy
cG9zZS4NCg0KQnV0IGl0IHNlZW1zIGxpa2UgQVJNIGFscmVhZHkgaGFzIGFyY2hfZG9tYWluX2Ny
ZWF0aW9uX2ZpbmlzaGVkKCkgc28geW91DQpjYW4gZG8gMSkgaW5kZXBlbmRlbnRseSBvZiBhZGRp
bmcgYSBuZXcgaHlwZXJjYWxsLsKgIHg4NiB1c2VzIHRoYXQgaG9vaw0KZm9yIGhvb2tpbmcgdXAg
dGhlIG1hZ2ljIEFQSUN2IHNpbmMgcGFnZSBpbnRvIHRoZSBwMm0sIHNvIHlvdSdyZSBhbHJlYWR5
DQppbiBnb29kKD8pIGNvbXBhbnkgd2l0aCBhIEdJQyBib2RnZS4NCg0KDQpBcyB0byB3aGVyZSB0
aGUgbG9naWMgKnNob3VsZCogYmUsIGl0IHNob3VsZCBiZSBkb25lIGluIHRoZSBoeXBlcmNhbGwo
cykNCndoZXJlIHRoZSB0b29sc3RhY2sgaXMgZGVzY3JpYmluZyB0aGUgZ3Vlc3RzIHBoeW1hcCB0
byBYZW4uwqAgVGhlIGZhY3QNCnRoYXQgdGhlc2UgZG9uJ3QgZXhpc3QgaXMgeWV0IGFub3RoZXIg
cHJvYmxlbSBuZWVkaW5nIHRvIGJlIHdvcmtlZCBvbi4NCg0KDQpUaGF0IHNhaWQsIG1vdmluZyB0
aGUgY3JlYXRpb24gc2lkZSBvZiB0aGluZ3MgZG9lc24ndCBjaGFuZ2UgdGhlDQp0ZWFyZG93biBy
ZXF1aXJlbWVudHMuwqAgV2hlbiBJIGdldCB0aW1lIHRvIHJlc3BpbiB0aGUgZmF1bHRfdHRsIHNl
cmllcywNCkdpdGxhYiBDSSB3aWxsIGJlIGFibGUgdG8gZGVtb25zdHJhdGUgdGhlIGJ1ZyBJIGtl
ZXAgb24gdGVsbGluZyB5b3UgaXMNCnN0aWxsIHRoZXJlLCB0aGUgZml4IGZvciB3aGljaCBpcyB0
YWtpbmcgdGhlIHBhdGNoIEkgYWxyZWFkeSB3cm90ZSBmb3INCnlvdS7CoCBUaGVyZSBpcyBubyBj
b3JyZWN0IHdheSB0byBtb3ZlIHRoZSBmaW5hbCBsb29wIG91dCBvZg0KY29tcGxldGVfZG9tYWlu
X2Rlc3Ryb3koKSwgZXZlbiBpZiBpbiB0aGUgZ2VuZXJhbCBjYXNlIHlvdSBjYW4gbWFrZSBpdA0K
bW9yZSBwcmVlbXB0aWJsZSBieSBtb3ZpbmcgdGhlIGFsbG9jYXRpb24gbGF0ZXIuDQoNCn5BbmRy
ZXcNCg==

