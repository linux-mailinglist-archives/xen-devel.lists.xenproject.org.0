Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D7766422E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 14:46:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474716.736016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFEwt-0003Q4-G3; Tue, 10 Jan 2023 13:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474716.736016; Tue, 10 Jan 2023 13:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFEwt-0003Nx-Cu; Tue, 10 Jan 2023 13:45:55 +0000
Received: by outflank-mailman (input) for mailman id 474716;
 Tue, 10 Jan 2023 13:45:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQxz=5H=citrix.com=prvs=367c7493a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFEwr-0003Nr-Ug
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 13:45:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 173c59d0-90ed-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 14:45:50 +0100 (CET)
Received: from mail-sn1nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jan 2023 08:45:48 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5250.namprd03.prod.outlook.com (2603:10b6:a03:220::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 13:45:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 13:45:43 +0000
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
X-Inumbo-ID: 173c59d0-90ed-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673358351;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XWb0VbvPm8jSmoBaGDxroV2OdrW4JuVkM0w5nXMnJO4=;
  b=X53CPFZKZmZMUsjzt1LZAHaN85Ric6YQ7NLLDg7U5uWowZslwbmc+ZiY
   PZKK0hcUavpVliurE0Qmcwc7hrMtpJNVZd31jibRDy5gwXWQZnkjZJZPT
   0nFFzt/klyGlKHox/DaXcgeU2rZpnsO9njAWfoy1Gqcy+MSeF7ie+sxdV
   Y=;
X-IronPort-RemoteIP: 104.47.57.43
X-IronPort-MID: 92348887
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gUcC2Kvp9FjimHzRsW9w23dvfOfnVGdfMUV32f8akzHdYApBsoF/q
 tZmKWvUbKuMYTH8fo91ao6zpExTuMLQzd43TlBq+Cw3FXtH+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoQ5AaHzyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBCFQSjWl2/2N4J2rSOByiNQDdpioM9ZK0p1g5Wmx4fcOZ7nmG/+P3vkBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/6xa7I5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6Refjqq460AL7Kmo7GFood0OcntKAkFO+UtdxF
 EBP5Q8Usv1nnKCsZpynN/Gim1aYowUcUsAWHOo37EeBw7T87AOQB2xCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BXQPbjIeTBcUy8nupsc0lB2nczp4OKu8j9mwAjepx
 TmP9HI6n+9L0ZVN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLlm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:rAjPc6iW7iWs32AbL5WfZVr7FXBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="92348887"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArmuJbaWL5dF4AtiXAj/CyftoyrRfkeV9iVcuT1d9GFryF4AdBLyUxypgoUxmQbSJtdaTjhZQT2y029kZWSKirksNfaN95BQ2C7YOrWpWLPvBtaeI+tL6RnU5O9Blxy6fyEUXSmTa4Ootq5kD4g074t4cEv0EEIrOzMLWe0LRRf4NbEg0dOKtZZ7lmZ5TiGkwTTCU7iHbOWI3UjnQOyYJwLaaAAMHxTbl9S+bIaZMOybRv+avYU00fZvz6x6p2ULPke61FVA/42E3kfpnVzflag5Vg+ZaC7OwBmd0ox3rIdPuUhD7dppYu8qVBZ4ySlA4nB9ygxbW/C2n+cff1XloQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWb0VbvPm8jSmoBaGDxroV2OdrW4JuVkM0w5nXMnJO4=;
 b=PfA4Cwqb50p7UHGZFL+DntnEHZ1jdbRqhgKgjK7SwFpcXalwp8eYlQxr0FfagFeEC+Zo2Tn+p26+ayxgzuYyWzlXGG25iL/AL6Kr2MLmtnngh8FkIBwrAMdOxspzr8BNKoHFw7yMb9NXaCLDVu1xfJf8ggx+qDxkVlOSpwHYeBOh0jTXq7+KPFUrVt4JIG+lOkiDbun23FbiBqujQbPV+oPLoZXTA2WuauLyIervS6+FC4M8eAsNWMekAXNPpcLw81vlgL9y8MgT3+yz+l5rJHJMCQmIAY02JepUy2DgeOL5jN6ELjQ0QKrgxi2W+7b+ucdeYxZykwkw517EPgKVnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWb0VbvPm8jSmoBaGDxroV2OdrW4JuVkM0w5nXMnJO4=;
 b=na61Dt86T2gfMO6VMx+5eOLCOkaeEj+gNN0HgNjPvqqxqtxwBq7shZ0yu0CdmTfKMnOHUn+hABCohX1rGZwWmDw3/wSZykndxqt0UTuYc3u+TwMypqHw+M5l1AUpQFH9gKKrreE8Nn+RtRXL9aZuF+8Z7hQpRourRtjFCM3WCiA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Tushar Goel <tushar.goel.dav@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Xen Security <security@xen.org>
Subject: Re: Usage of Xen Security Data in VulnerableCode
Thread-Topic: Usage of Xen Security Data in VulnerableCode
Thread-Index: AQHZJPgyisjAiCiXW0uW9I6mR5F/Cq6XqbkA
Date: Tue, 10 Jan 2023 13:45:42 +0000
Message-ID: <7ddac120-29c5-d4fa-2bc7-9da6b1cf2dd9@citrix.com>
References:
 <CAFD1rPdT5Tod+qdit50EWBN6WyRuK2ybb2G2HmOAayAV7uyBuA@mail.gmail.com>
In-Reply-To:
 <CAFD1rPdT5Tod+qdit50EWBN6WyRuK2ybb2G2HmOAayAV7uyBuA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB5250:EE_
x-ms-office365-filtering-correlation-id: febf5bd6-f66d-4a11-89bc-08daf310f7d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VsjqMAxcq2gMIfzzUCHg+451kfqN8lWUsm1BOFkODv4zYLI95k4v7cGcV+AJnYMnDPjYqiyWuMN0B0+bYzRQXqMJlI6AqNeGP0pa2TgWuzRT0wwtRJrm5ZfDL3l/+6wwDDoLCGwnMYEMs2gClwpufQWyT7Ot+wgztM5Pywryb1lcOGfUscoy+lVfu5m0g2mN/sWlac/MLTDB5B7/tH5nWBmGv6i0FEogoIHklET0DhJN6wdUUXu862l0O3ALIF4Xm0nOy073dMdUlY+x7aq86nv9caCgMn2DghDxeo1htsDPm5q/XykxezUseV4CLrHfSS1av/ERufsxtI66ehMG32CrPidurVuqg5+nbUzI3pVybPQu6/TVbqnTxhBJoRMNaZZ/UHOA0bQQpzJ85eR7BK1JeM8Oq0ekhc8qOQs/5tXsD3wFBk2OHwlAsGv7D9zuu0EfS/1u1mMAYhS2KFs5IH8Pgo6NkweQ5+l7aJ4D4ZBKXPHAxzzgCpD6nAQAwBqhFMaDn5zHX4gGZyJY7nraozCOfFatkWLuuDHQPp1AOQ6ZA8h0wZWYOG3HDT6cDdetxx4J4EZXD+mH3agPIkr46XWj1f+uu4lVEoji0ffBps61F3vM/mM8SHGBDCK8y0bu6iEfa47vR4LY0X5toDNkTIhWaFIP7H2mSincRdMpc17bsydZzCoJNzP+U1GcsfZyBCX9jJ8rbt0w2G7ovjQr9PtPiRhWVTmjteh7y9bSo0YihlzOnhMDpW9MR9Ioda2suL+YZ18LJ6tOzYv0Kmj3C0ZegsXGjRXF3tMtCyHNGt1LLGucs+sTYe3HCz4VSMFXGRBqjZ5OqezUf+n5mUj1nw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(8936002)(2906002)(5660300002)(41300700001)(71200400001)(4744005)(66446008)(4326008)(91956017)(316002)(8676002)(64756008)(76116006)(66556008)(66476007)(66946007)(15650500001)(110136005)(38070700005)(26005)(6512007)(2616005)(122000001)(38100700002)(31686004)(186003)(86362001)(83380400001)(31696002)(966005)(36756003)(82960400001)(478600001)(6486002)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlNuRHI2TUFrUkRFK04xQkVoNm1vYy9CVkl0T2d2SE54Y2FtWTN2b2lQUXV6?=
 =?utf-8?B?VjA1blo2UWFzYU5FZ0VDcWFqQTFPaEJzU01vSVhGK0piRnB5b2NBZGk5b1FP?=
 =?utf-8?B?eVRUd3RZYmZReXVROG5OdW1iV1IrWmlXZ0dpN2czRUtYOGhqNi9acWZpUUFL?=
 =?utf-8?B?SVozbkhESkYyT0JmUE5sVG9yUFlNRUhQNmc1eEQ5Snd1dXY1TGdSS3E5QTZ2?=
 =?utf-8?B?a21ObmNxZGZaa2NmM0hucXlVYkJwQmFrRTlSTUFzZUdKbWRWaEdaWU5zZUEx?=
 =?utf-8?B?dThuMFJ0OUd4UmZYTlQreUZmZnZGZmpYS0NmU3N0d1BoK3Z4N2JVWUFRVVE4?=
 =?utf-8?B?Y0V3dEFzUHBZc29VTXRMQVE0cnZVT1VRd3F1Qk1BWXpPbTU2NCt5WEhHazFx?=
 =?utf-8?B?U3hXRDRBMGMrZmx5bmFFY3hiK1ZWSzVWdGc5YjRCaVVlVGpudm05WVo3czRB?=
 =?utf-8?B?MWNOSlJDYkFxUlpNN0VSaHVTZ0VsdjN0dklTYU04Z1N0T0tsRStwOFZFQmRV?=
 =?utf-8?B?eFI0dzJGQ1N0S09PV1BUTHM3enRMcFF0NkR5RGUwZm4rR2psVmRXTjJiK2xk?=
 =?utf-8?B?TnZhSW5OWVNmNDh1dzFvaExJR0YrTHNCdzFGbHhXeFZIMml3ME9CZHU1c1po?=
 =?utf-8?B?MDVRZ1U2WWNGbk02RE03YTFJeitEeityQjVadTF0R1JBL2tidHY1OHp5YlR5?=
 =?utf-8?B?eVltY2VHWU9LVk42Tk9oTGhRYUYvbXE2djRUaVlNM1NReWpwTEMyOVdLbENi?=
 =?utf-8?B?WTB6WHlSMitoWG1BYTBPajl3VEdJdkZqZlZ2YjZpeTA2eVhnT1FtTTFEaEJL?=
 =?utf-8?B?M1VRNmxRRnlaaEk0L1Y1bXphZFRUZTVVUUZLaFhOeFJzVkUvU2ZGS1dvREZF?=
 =?utf-8?B?VzJWTHdrSkhTb1RMVFBib3lJQXUrNmhqZlhJN2drUjQvaHBtLy9jeHc4czVz?=
 =?utf-8?B?R2JJak9JMlNHaW9qcFFuU3RKdEZHUzVRZzlSVExpZXhpSGE1VVRJbVRMaXo5?=
 =?utf-8?B?MlkzOHhjdG8xUXgwdFhkdHNSdzVsdnpGN21ySFNJdEU4RkZNRUFYbXR4WTZH?=
 =?utf-8?B?dzdWaEx4RTl2RmR3MXE2eWx4YWsyeTRxTXlGa0xpYTlJRnNvc0V4WFlzeWtx?=
 =?utf-8?B?b3MvcW1ZT0V4MW5PTGRFSDhOWkw5K1pHUTFZR05SZ29PUFl5dVovZFhzOEZN?=
 =?utf-8?B?KzY5QXE5M0RaaXNmSHd5WFZrT2svK2cvTFB2dEUrWlJMaFlVYzlPNmZHMEN0?=
 =?utf-8?B?UDZkaGdvYUM0WSs1Um1tWldRR1hsZnVCKytJb1QzbVVIaHkvVE9yZEhZRGhD?=
 =?utf-8?B?UWovUHFzaDR0YmNwZnh6eHgvRnBuL1VrNTk4elJlSk0yY3VCdEd1WWErZVVV?=
 =?utf-8?B?bUJDY1JsSEdMckxwS04vbis2WkFpMTB5bHowOU1YdGw0bHFTbHB3Q0wxdnlj?=
 =?utf-8?B?Vm16N3R0dGNUNWU5ZzVWNG0xS3M4c3ZZVzVPMmc0amtaQ3hUVGNDMVBoei9o?=
 =?utf-8?B?UzROdWNSTFlOUzhsNkErMTkzV0hQL3FDSGhMcGdYREIwdlhTVFU3UXdiREp5?=
 =?utf-8?B?bVB4UjBhNW1YZWZTZHhHZTNBZkJVeS9hdktHMHE5bmJleTR4ZWt0TjZuQWw4?=
 =?utf-8?B?QzY0eE9jRGgzanlGcnNsUmx6SDg2TzdEZVVuUEd3cHptQmFWT09UNVR0Y0tC?=
 =?utf-8?B?QUJ6ZFZ4bXl4N2dTOFQ2NEx3SGZ6YWp5RmVIMUdVNFdpcWUzWGtDTjJrSlVq?=
 =?utf-8?B?TWNqcUxjbWg1RGVvOXlOdkpiSlo1N1p4UkFkWnlQWS9ueGZnQUlFR2RBZkZ2?=
 =?utf-8?B?VlFhRWcrZnYvM1FxYTJzeG5ic001eW91MnBhVVNTZTk0aFZONndKdUNsM0dX?=
 =?utf-8?B?aGdYb2RURXJjYmtPWGFzK3RseVppcittWm5OeGNBZ2NNVXhPQnVYcTZCQzU5?=
 =?utf-8?B?NjdrUGhtMEpJVnNLS0U4ZW16S2NER3VPU1ZZNC9QSUcwQ2dOR0RJSGtwNTBD?=
 =?utf-8?B?WkZsVlVpcE5ZaThNSHJvN0ViMmJXMWNuZTBGK1hsRHBDakZQL3V5dUlRTEto?=
 =?utf-8?B?R2JjVHRGTmFJbW5TY2dEVjZZV2Zmdm04R0RtMGVzd0w3ckM0STBROHZReEwz?=
 =?utf-8?Q?oPjgy92QpDvj2HG6lX/qHciqM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F47F6EBD01EA6479DC2ED3CDBCEC819@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x9IYZizMc2cg96k2SiyzVYkVef9BdagCdfwPuqpYjp1gpOiV0b08QN/0/IjGqQVzFvkct+8cViPv3WdmN6H8TW390bWq0Y2Qr1+jFfVRV7w15mk8I+B4SkQm6M9TXzq/ih4BCMV1GMeFCoWyoTuP5Uh69a0+bJlJ/adRknJeObply9r9lOr/+VAzIJMUCbyghxPMrGOtQ98PhF4kBsYVsotkzGAi6rNKPfJW7XCki/6HMzfB8Ft80YrAnMwlGE2edPexmOWDeRTMEaGeoOXAT7adbSqB+QfaWvnVsbVXK60I5RMhOX54Iy1GLAxemQib90ysfD9IRZWSxI7DLMGaunKGTrv8+f9Vh+epowh8YpRfKVCwhQ8AiXv02nJYvzsIqKiBnpIELGSjAbA43sf35C3CouUn06aQ4OJqEHvTM2R6R2e0qOKoa1gj7gZoBQ5ykVAQIdRztrspOZgBJXOWaYyv8fH5irarT7HNS/soNdZ5R94NKPwVDx0vQUEbQaFvY9SwpqXCF7zJULGPPw2dyVLXH3cgy530yG9jmO/VDCGmmTs50XGx6FZNARFUZjwCEckhhIW0grcmztNOMejsKyzxZEhr6lvh7/sJH3+JNfIoXfKKYKost2PTAI5d1LS6j1IatIQddQby3DjV2jP4XrNR9iwpMlOQzRnOaOrab8Mkly5Ua6ACecknaCI7R6lN9+pl+gBGBRFBRU8zBdlht0eH/N1o93oBpycfJR6zheUfTrhHpPn/+e9XGtD55Ko7dru9uyUIeFhUtvQtD0N4OTcK0RXhqIg0t06NE4+Haq+V5TzuZmwxybp2efGxTZNdBPyBJUOmEHOMKY+p227vgA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: febf5bd6-f66d-4a11-89bc-08daf310f7d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 13:45:42.8976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b5UC8YmDpikbovroZxI/ADB9skZOJ36wzPpRz4vwzIFmSLXSzhB3Z7JcriYD05aY1OCaDDLZHkEJYSVtERjgaOl5DeYFPuMegmCsUcebXu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5250

T24gMTAvMDEvMjAyMyAxOjMzIHBtLCBUdXNoYXIgR29lbCB3cm90ZToNCj4gSGV5LA0KPg0KPiBX
ZSB3b3VsZCBsaWtlIHRvIGludGVncmF0ZSB0aGUgeGVuIHNlY3VyaXR5IGRhdGFbMV1bMl0gZGF0
YQ0KPiBpbiB2dWxuZXJhYmxlY29kZVszXSB3aGljaCBpcyBhIEZPU1MgZGIgb2YgRk9TUyB2dWxu
ZXJhYmlsaXR5IGRhdGEuDQo+IFdlIHdlcmUgbm90IGFibGUgdG8ga25vdyB1bmRlciB3aGljaCBs
aWNlbnNlIHRoaXMgc2VjdXJpdHkgZGF0YSBjb21lcy4NCj4gV2Ugd291bGQgYmUgZ3JhdGVmdWwg
dG8gaGF2ZSB5b3VyIGFja25vd2xlZGdlbWVudCBvdmVyDQo+IHVzYWdlIG9mIHRoZSB4ZW4gc2Vj
dXJpdHkgZGF0YSBpbiB2dWxuZXJhYmxlY29kZSBhbmQNCj4gaGF2ZSBzb21lIGtpbmQgb2YgbGlj
ZW5zaW5nIGRlY2xhcmF0aW9uIGZyb20geW91ciBzaWRlLg0KPg0KPiBbMV0gLSBodHRwczovL3hl
bmJpdHMueGVuLm9yZy94c2EveHNhLmpzb24NCj4gWzJdIC0gaHR0cHM6Ly9naXRodWIuY29tL25l
eEIvdnVsbmVyYWJsZWNvZGUvcHVsbC8xMDQ0DQo+IFszXSAtIGh0dHBzOi8vZ2l0aHViLmNvbS9u
ZXhCL3Z1bG5lcmFibGVjb2RlDQoNCkhtbSwgZ29vZCBxdWVzdGlvbi4uLg0KDQpJbiBwcmFjdGlj
ZSwgaXQgaXMgcHVibGljIGRvbWFpbiwgbm90IGxlYXN0IGJlY2F1c2Ugd2UgcHVibGlzaCBpdCB0
bw0KTWl0cmUgYW5kIHZhcmlvdXMgcHVibGljIG1haWxpbmcgbGlzdHMsIGJ1dCBJJ20gbm90IGF3
YXJlIG9mIGhhdmluZw0KZXhwbGljaXRseSB0cmllZCB0byBjaG9vc2UgYSBsaWNlbnNlLg0KDQpN
YXliZSB3ZSB3YW50IHRvIG1ha2UgaXQgQ0MtQlktNCB0byByZXF1aXJlIHBlb3BsZSB0byByZWZl
cmVuY2UgYmFjayB0bw0KdGhlIGNhbm9uaWNhbCB1cHN0cmVhbSA/DQoNCn5BbmRyZXcNCg==

