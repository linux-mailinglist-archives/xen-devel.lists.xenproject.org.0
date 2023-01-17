Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C5C66E665
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 19:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479749.743790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHr0p-0005kc-LB; Tue, 17 Jan 2023 18:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479749.743790; Tue, 17 Jan 2023 18:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHr0p-0005hv-HP; Tue, 17 Jan 2023 18:48:47 +0000
Received: by outflank-mailman (input) for mailman id 479749;
 Tue, 17 Jan 2023 18:48:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHr0n-0005hp-Ox
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 18:48:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fa728d8-9697-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 19:48:43 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2023 13:48:39 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5156.namprd03.prod.outlook.com (2603:10b6:a03:224::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 18:48:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 18:48:36 +0000
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
X-Inumbo-ID: 8fa728d8-9697-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673981323;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=i6nnM96Wcje001If7Kq8Ot3jIAsr9a3RJkD8G3Wj0uM=;
  b=EOcW3PQwwTCqlyvlyX53l+VIUOX8EwXRxnVz2zadSbIDlg7/3b2nsdh0
   TI8dWnfLk1hecNftqwIiUwXY8RaaD+f/XQn4rBw5FEOrUHlf582/20BXO
   dYXCZZTQo9qO8EtptBPJllcbuaQfN6TaP9Dj/XW60TxtZEPSSnTxeweGl
   c=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 93017569
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:t6pI+6tkYA6vNJHrzHyy5UUH++fnVGdfMUV32f8akzHdYApBsoF/q
 tZmKWmOPveJa2b1ed9zYI++80oCsZfcyddnTgFt/39nQSNG+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AaHyCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwNAIHUiLT2aWMx7egRPhF28t7Fdn5M9ZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60bou9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzjrqc13QPCroAVICEbZ36WurqAsXf9V9lRI
 Ewz8wp/p6dnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakcsUQoAy8nupsc0lB2nczp4OKu8j9mwEzegx
 TmP9XE6n+9K059N0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLpm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:XPv9CaucWk8Vq2bdIYNcZ90t7skC+IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6HnBEDyewKkyXcV2/hmAV7GZmXbUQSTXeVfBOfZogEIeBeOv9K1t5
 0QFJSWYeeYZTcVsS+Q2njaLz9U+qjjzEnev5a9854Cd2FXQpAlyz08JheQE0VwSgUDL4E+Do
 Cg6s1OoCflUWgLb+ygb0N1FNTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P+7E/6m
 LI+jaJrJlL8svLhyM05VWjoKi+q+GRhOerw/b8y/T9Hw+cxjpAor4RG4Fq8gpF491Ho2xa6O
 Uk6y1QRPibrUmhNl1d6CGdoTXIwXIg7WTvxkSfhmamqcvlRCgiA84Eno5BdADFgnBQye1Uwe
 ZKxnzcuYFQEQrFkCD368OgbWAVqqOYmwtQrQcotQ0sbaIOLLtK6YAP9kJcF5kNWCr89YA8Ce
 FrSMXR/uxff1+WZ23Q+jAH+q3aYl0jWhOdBkQSsM2c1DZb2Hh/0ksD3cQa2nMN7og0RZVI7/
 nNdq5oiLZNRMkLar8VPpZ0feKnTmjWBR7cOmObJlrqUKkBJnLWspbypK444em7EaZ4vKfaWK
 6xIW+wmVRCBH4GU/f+oaGj2iq9PFmAYQ==
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="93017569"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ssit10oVSFIGqXVojDuHcDpQjRWZUa8k0+V4nTo9iOn3R2ZjMaot83/ano4cgGblxbIocPewrjceupdfTxRzoaaKUmg7mr/7l5RFeuBikeqIoSofSD5Oyfo+u4TvsKxZ8LxKssBqJy3b0sHFSMVseR21q6F2EApjYO/Upr1csPjlYzrf9EZb9OWivdqujgQ39sErQuBFt+xS6zuuHG6uQyub434VyEYfAfqBav1aJ7ZdGteHCDIH458KHpLlJU+la4jZhnHhkW2BsOfOBQywR6n/SAXtIeolvdPQM5iVhpQvd7d9Edxht0/gXDy8w12bGkfGMkhbN3nePgSWiElY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6nnM96Wcje001If7Kq8Ot3jIAsr9a3RJkD8G3Wj0uM=;
 b=BDPU9/byCc+ci43NiqEf3FJc4Y4kWRgFJteZZ2ufGJk9DTOLyhn9I4zFn9kOMprc0Dckrw2hBWkwJVlV3ztzTjElZ2AqqAU5yoR5YYutNascBjswsmNcRtYq+ymRdL2bjmt0lnihcQBstoMhXHqdtcouoUEY130IsE7FVEuG6/yeOPDCCzbWThFpoATEChR3nePG9KBwt/R+PyZDKnTqjwcY17F8eVi75XvfITk4AVDV4njpfCNrQcGukL6NljR6yZ0jmp0fvTI2uGCjwFjXKH8mlDoQRBWLo1R35yVE0TPEitSe+f0+2MB5BWMZn4mnVJvSxarMk8LBawUsS0yIOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6nnM96Wcje001If7Kq8Ot3jIAsr9a3RJkD8G3Wj0uM=;
 b=YHbHHdlJYH3aNecxCDwK49MoDQe4RroL1dh47+yAu31yfswWF8JACsgXLqgg9GYQt2tHW2Eksv+SmkX5UAi1YwAB8DXwyau3mqG24HHzQqUfhBKzFQ46Cf24mTAt0uOHmoEX89tSdeb3WIPVjxwt0hOYoQqeQEvF4BVProFtCQw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2 6/9] x86/shadow: re-work 4-level SHADOW_FOREACH_L2E()
Thread-Topic: [PATCH v2 6/9] x86/shadow: re-work 4-level SHADOW_FOREACH_L2E()
Thread-Index: AQHZJcRNSLEE6oa1r0qKWqqRMiTKGK6i/RMA
Date: Tue, 17 Jan 2023 18:48:36 +0000
Message-ID: <ed382d91-d4fc-4778-d1e2-9f55b147e33a@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <27a7245c-f933-5b2b-5685-d9ba2dbd4a8c@suse.com>
In-Reply-To: <27a7245c-f933-5b2b-5685-d9ba2dbd4a8c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB5156:EE_
x-ms-office365-filtering-correlation-id: 2a7e86ca-3d90-4566-5c43-08daf8bb712e
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ma+6sb6m7j01X7JzzgOEOMJSPHYvj3kSSa7NHOqIALxy6o50XHUpHVcl5CNETZwoK1tLkTJrUFi8qqGGADA8ZCo2Ko0jpx1de3tLachpRLrh6CADuG2RZ08ebTlBt9fBNdQXdI3+YIEBmOVhA5uI4dRVXsUo6UVAC8o0yUDmX+iWcpje+y6e2YIUOlgghWhThhVSqLN/N4p3KFYOBEqOYnpoFmJDz1ZWrqMSLNifzaAUEkVCEG7Qn+8p6L2tHNMw44fwDrnfrnds6ZQk++HFkuiekoShmKe/95vFPrZndyMV8pbcUANjulGf/zCXLL5JepufQbaSXbPynFFZLfX6O/0PhGjY7dd8kd3x0UQvnAeKrBI06yY+YWyrQCEebQK1DIoNm/ZfEd1Brf37WegH38J6dtOTjnU+G7SaQqLYBb5p6XczFQl96J8ppbLQxtN/JJay4GADzkZDBhroj07uO1OC8sRSpCULfVCugcP7XhPpuq/fOfm0Pthjdfa3h6pEQehorxu9Phuhgr4DvADeEdkwYYsmEzNTeDTPixY3lYDDpctoal0WHE+QWhetF4IW5OXrBQsrjBLDbr07+JipugW4itjlJiPHhN3jLZKIOsmWuUOBoF4v506xpL+VadQ8gSgsnjqhJw66nCtaEVyTqxTwQn4ESwIqvDziSEcV+poloHL3XpEn2JqTVjseeJ5ue5CJvaZzhKhLbYvO70Vw3sC6+QdKDf/BsGbpWgV4hBwly13kA8GYuS92GLdPlUW4ZSqvfjZlqtp6DtgKn1dzQg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199015)(2906002)(4326008)(26005)(8676002)(76116006)(66446008)(36756003)(64756008)(91956017)(66476007)(41300700001)(66556008)(53546011)(66946007)(6506007)(107886003)(6512007)(2616005)(83380400001)(86362001)(110136005)(38070700005)(186003)(71200400001)(54906003)(316002)(31696002)(38100700002)(122000001)(6486002)(8936002)(31686004)(5660300002)(82960400001)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVJUNFdsYms3bWxDL1JzN3o2ODRIZ2tSc1F6QXNtM0F6VDhOc0h3SkwzUENX?=
 =?utf-8?B?V3Q1MC90U0lSMHA5QUlNcjRiMXpqWkk4aTl4NzRadU4wRXpZVmR4UDFpa2xJ?=
 =?utf-8?B?b1NRakU3bzdCamU0b2J1Y3NsM3FOdFpRdFhIbUhiQkJQL1RPMUFIRnJzL0RG?=
 =?utf-8?B?KzRVQlhkZm1va1hsV0s5RldpWENXaTh4RnBCaVRINFdxcm9VYjQySHpNUnJw?=
 =?utf-8?B?NTNJaGc1S1NScEZNb3hCWVUreTJFTnRiRkVOckRSc0NuM2Vua2tkT0g0U1VG?=
 =?utf-8?B?THNuNy95ckVBL2ZLTTlLQitaS3VBamNYdXhiTFFLZVNPcnJNb1o2OUxGM0ow?=
 =?utf-8?B?QWxHVkFBZTI5K0E5d3FPT2FDZmphWUpGSlo5Y1RHT0x6ZkVwV3V0ZEh4b1dx?=
 =?utf-8?B?SjJLY1cwVEtWdXJCQjRzVEVyTEFnZGdvTzY4Q1NrVisxdXE1WVd6U0R4Vkto?=
 =?utf-8?B?Wkwwanh3eWtrd2p0cXpzaHlJdWw3cEF6SDN4aGJNd29mdEhnUXhOREhFYVY3?=
 =?utf-8?B?dmZtZS8rQk5zbVV4SWRyS3RrZXZWeEZxcE5KZlA1NVlMN0FIMUk3cmRIWEor?=
 =?utf-8?B?VTVVM1lhYnJ4Z1QvaUFZK1VtZndDMzBvc1ZHekRjcFA2NFQ5ZFJHS280U25W?=
 =?utf-8?B?NW5RWmM4ZFIxTjA3Z2lPRkExSW1UTFZzWGJ4UW8rZVRWVGNyMlhpdHloZzdp?=
 =?utf-8?B?RnhNRUF1N3kvZFlBUjlvRFBQZ0tPVERneUZnNnRqZlVaT1RPOHVialMvZE80?=
 =?utf-8?B?d0lHcjZZQzZ2UlJIdTRUR3ZnSDAveW5ESFg3SlU5bEVXTkZOSmN5N3hDWHFQ?=
 =?utf-8?B?N0FWZFlYMVkzQ1pzeVZzVkdKSDNieHZiVGVYKzRYR1BjOGZaNDN5U2cxTjlL?=
 =?utf-8?B?N3EwMSs2RXJPVHEvT2YxTExENXBKdTI4R0IvNUIxT0pRZnF3RGxjTEFYMmZk?=
 =?utf-8?B?VUxhQ3dRZTZlRFBuT2tJdmRGRkN6YzFBbU4rRUFXb3JxQURJWVE1VWR0Smth?=
 =?utf-8?B?aTFZbndrdFNiZTUzMHVhdGpDbE9EMlBaRmp1VVIyTEROdHhoa3RweG00UVNJ?=
 =?utf-8?B?bWxXTm5HbTJSTmh5NWZGMkZsdENicFZZNDNEUjljYnIremNsbTl3ZjhrSjNH?=
 =?utf-8?B?UysrZEI3WkhDQ3JUbmhhNlNYbDdHNHhRVE1VTys2aUxPdDRTUE80cit6UXJF?=
 =?utf-8?B?N1gvNFlEZkd2REJkNjlIRGNVTGVNMmkvUE9vU29rYURvUmhuc0dZYmN2WlpQ?=
 =?utf-8?B?TGUrbVQyZ3BKYklGNForZzB1NjF1YzFZbmpzSHlqUzJuc0NXa3BKTlZsZ2l4?=
 =?utf-8?B?dVEzQ3BHUFNQZWlBWHRGeGJnZi9CQWQ3dTdwdjJtZ0NSL293bjkxRFU3UEFl?=
 =?utf-8?B?RmNwVEY5WUFZVnhkRUI0bWxyZGx5WDBOVDdESHFyUnRxRGpoRUtpYVZWQmR2?=
 =?utf-8?B?a2E3NHo1Y0twSkI1bFlLMDlXeHphNTMzL0lCcExNanhVMTBtSlhPQ0tneVFP?=
 =?utf-8?B?dHNXU0ovenpESHo1VHJOS1hPYTNOQjJqMU1yNEp1eXgzQU40OUtxdVpBdGhm?=
 =?utf-8?B?cWc5bG83bFJvbzBIY1ZwWUNEVjJRS0JIWmdhcGxYQUt3dGtSb0VmTDJPOWUy?=
 =?utf-8?B?TjVkR2Jpc0xnSlU1SVllcm1rTGJZNHdjajEybTFxZXMxYnBHc0k3dklrQW5Y?=
 =?utf-8?B?bTZaeWZZNUJldUtiUWZpMFQ5MjUrSVpEWHl5MkticDdXSXhmMm4wUGNLR3BI?=
 =?utf-8?B?ZnNZOUJDUVAxUkxrMy9pQ0FTeUpFeTNGbGVaT3oyS2hoOUsrcHhtZ0tKdmlv?=
 =?utf-8?B?Umk4UXNnY05PcDJPU1crTEZ4cjU0VzBqZ1JVU0duc3ZPOE5JZEs5ZVJyRGdX?=
 =?utf-8?B?MWxMR1VYSlJzMzdicmVrdEZIcXNTeDRoYmFva1hPdCtvRFp0WFc0N0ZqOW1r?=
 =?utf-8?B?N2ZSZHlVbzdhR0Rma1RrVDVpOENHR3BZM1FnM1FqbEQxNWpBM29BOFpTckZV?=
 =?utf-8?B?dC9tcWU4clNRM2VqYWpPYlNYaXZCRHZlNHkrRDhFNmU0OGV0K21SeHh4ei8x?=
 =?utf-8?B?T3VZaHF1emdsYkR5Mit0VmF2UWt4RVI4UHRpRHo3UlNLQy8rU0Jka3MxSDlH?=
 =?utf-8?Q?FfGvxQkvJK6fkEofE2099xit4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <682B96306D01E34C80C28AE956DD38B1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AUccvMSzcZzxDCuXoKpjpAIp+ThDn58vHM6uYOIqURtu8yy2+wD/TZcGEe6F8eH/jouvvuNkFnf8Q+Z64k/ZB4Cxy4tZKA7T/UqnlZHgTWIxfXWZDDPy29SYNImg/w0c8YkeZaiuXEth7w8GXah6fJh3AXnYrVl/gM4ROdaL2MjOMPvOPD6Yq2RXybg80NKyeZQbkkkoFKTOWAyfi5/R4rQ5D6hZca7jWR3LUD+iaEqfUs6hHO3+qYJiW3QwoVo+oEA3RE49l95VgDgwWQuwMuQ4sKE0ayMEeMLdjRwXo3DCkUYBIS2WqZQYIz7qFmcx+wVmt9ofXgYYaJ+3VHyEhFp2Wkh3ryJxr53eEL58BhbLV0AkAIgXCWHZOoLAY+UQpc3aqdEg21hcdqzGqaoRWOfoGCk/QuQ41isa0HZ9InW9Q5PzOtpqx0Ut+qgxxMgtkvsTGnz1gxa2VRH8o3bf7H3mONxLgdMXVMc6ueECiui48cNCEqA05LBY89eIuiNWOzhEg1wUkaxEed/v4RUhXaDcd9sjEPxMOgOZDZ5TEelXXVlwwHwDI7MNbh17Rg7EH6Kd/zzMm8Lpla5lSnYByJMJ42ePVEBn7iRmkoDpMu+TTxt49toyHIvuAcJiIpeVjLmp1De1B3FxWxsgVUyidfgvt2olf5QqKgOcQYvB8yTwp8B2t/wgefhIQ94i0N/2jHWcwTa1vuWukFHW8GBkYRbsKKy7F2IJ0SJ8UQqz4XwiHbsXUacVk8bIlgvRLOcjbrIdQ3qiXMCm7+5JKbPlQG0t/ZgdIuRvmyshuLdBjH9Lk3QggRlAxZ9gOsKWVKCS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7e86ca-3d90-4566-5c43-08daf8bb712e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 18:48:36.7626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQ94i9LqRbMXr/BBohm12WTMmvYbt8W/UYPKXZYqx7kFgIQhK78NPVgfxIpsog5hH0giDj3+jSZFvmU2y4pLzIcqHeln2Y8rP0F/ri050hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5156

T24gMTEvMDEvMjAyMyAxOjU0IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gRmlyc3Qgb2YgYWxs
IG1vdmUgdGhlIGFsbW9zdCBsb29wLWludmFyaWFudCBjb25kaXRpb24gb3V0IG9mIHRoZSBsb29w
Ow0KPiB0cmFuc2Zvcm0gaXQgaW50byBhbiBhbHRlcmVkIGxvb3AgYm91bmRhcnkuIFNpbmNlIHRo
ZSBuZXcgbG9jYWwgdmFyaWFibGUNCj4gd2FudHMgdG8gYmUgInVuc2lnbmVkIGludCIgYW5kIG5h
bWVkIHdpdGhvdXQgdmlvbGF0aW5nIG5hbWUgc3BhY2UgcnVsZXMsDQo+IGNvbnZlcnQgdGhlIGxv
b3AgaW5kdWN0aW9uIHZhcmlhYmxlIGFjY29yZGluZ2x5Lg0KDQpJJ20gZmlybWx5IC0xIGFnYWlu
c3QgdXNpbmcgdHJhaWxpbmcgdW5kZXJzY29yZXMuDQoNCk1haW5seSwgSSBvYmplY3QgdG8gdGhl
IGF0dGVtcHQgdG8ganVzdGlmeSBkb2luZyBzbyBiYXNlZCBvbiBhIHJ1bGUgd2UNCmV4cGxpY2l0
bHkgY2hvb3NlIHRvIHZpb2xhdGUgZm9yIGNvZGUgY29uc2lzdGVuY3kgYW5kIGxlZ2liaWxpdHkg
cmVhc29ucy4NCg0KQnV0IGluIHRoaXMgY2FzZSwgeW91J3JlIHRha2luZyBhIGJsb2NrIG9mIGxv
Z2ljIHdoaWNoIHdhcyBjbGVhbmx5IGluDQpvbmUgc3R5bGUsIGFuZCBtYWtpbmcgaXQgbWl4ZWQs
IGV2ZW4gYW1vbmdzdCBvbmx5IHRoZSBsb2NhbCB2YXJpYWJsZXMuDQoNCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L21tL3NoYWRvdy9tdWx0aS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cv
bXVsdGkuYw0KPiBAQCAtODYzLDIzICs4NjMsMjAgQEAgZG8gew0KPiAgLyogNjQtYml0IGwyOiB0
b3VjaCBhbGwgZW50cmllcyBleGNlcHQgZm9yIFBBRSBjb21wYXQgZ3Vlc3RzLiAqLw0KPiAgI2Rl
ZmluZSBTSEFET1dfRk9SRUFDSF9MMkUoX3NsMm1mbiwgX3NsMmUsIF9nbDJwLCBfZG9uZSwgX2Rv
bSwgX2NvZGUpICAgICAgIFwNCj4gIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+IC0gICAgaW50IF9p
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXA0KPiAtICAgIGludCBfeGVuID0gIXNoYWRvd19tb2RlX2V4dGVybmFsKF9kb20p
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gKyAgICB1bnNpZ25lZCBpbnQg
aV8sIGVuZF8gPSBTSEFET1dfTDJfUEFHRVRBQkxFX0VOVFJJRVM7ICAgICAgICAgICAgICAgICAg
ICBcDQo+ICAgICAgc2hhZG93X2wyZV90ICpfc3AgPSBtYXBfZG9tYWluX3BhZ2UoKF9zbDJtZm4p
KTsgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAgICAgIEFTU0VSVF9WQUxJRF9MMihtZm5f
dG9fcGFnZShfc2wybWZuKS0+dS5zaC50eXBlKTsgICAgICAgICAgICAgICAgICAgICAgIFwNCj4g
LSAgICBmb3IgKCBfaSA9IDA7IF9pIDwgU0hBRE9XX0wyX1BBR0VUQUJMRV9FTlRSSUVTOyBfaSsr
ICkgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgaWYgKCAhc2hhZG93X21vZGVfZXh0ZXJuYWwo
X2RvbSkgJiYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArICAgICAg
ICAgaXNfcHZfMzJiaXRfZG9tYWluKF9kb20pICYmICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCg0KVGhlIHNlY29uZCBjbGF1c2UgaGVyZSBpbXBsaWVzIHRoZSBmaXJz
dC7CoCBHaXZlbiB0aGF0IGFsbCB3ZSdyZSB0cnlpbmcNCnRvIHNheSBoZXJlIGlzICJhcmUgdGhl
cmUgWGVuIGVudHJpZXMgdG8gc2tpcCIsIEkgdGhpbmsgd2UnZCBiZSBmaW5lDQpkcm9wcGluZyB0
aGUgZXh0ZXJuYWwoKSBjaGVjayBlbnRpcmVseS4NCg0KPiArICAgICAgICAgbWZuX3RvX3BhZ2Uo
X3NsMm1mbiktPnUuc2gudHlwZSAhPSBTSF90eXBlX2wyXzY0X3NoYWRvdyApICAgICAgICAgIFwN
Cj4gKyAgICAgICAgZW5kXyA9IENPTVBBVF9MMl9QQUdFVEFCTEVfRklSU1RfWEVOX1NMT1QoX2Rv
bSk7ICAgICAgICAgICAgICAgICAgICBcDQo+ICsgICAgZm9yICggaV8gPSAwOyBpXyA8IGVuZF87
ICsraV8gKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAgICAg
IHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwNCj4gLSAgICAgICAgaWYgKCAoIShfeGVuKSkgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+IC0gICAgICAgICAg
ICAgfHwgIWlzX3B2XzMyYml0X2RvbWFpbihfZG9tKSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXA0KPiAtICAgICAgICAgICAgIHx8IG1mbl90b19wYWdlKF9zbDJtZm4pLT51LnNo
LnR5cGUgPT0gU0hfdHlwZV9sMl82NF9zaGFkb3cgICAgIFwNCj4gLSAgICAgICAgICAgICB8fCAo
X2kgPCBDT01QQVRfTDJfUEFHRVRBQkxFX0ZJUlNUX1hFTl9TTE9UKF9kb20pKSApICAgICAgICAg
ICBcDQo+IC0gICAgICAgIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAtICAgICAgICAgICAgKF9zbDJlKSA9IF9z
cCArIF9pOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4g
LSAgICAgICAgICAgIGlmICggc2hhZG93X2wyZV9nZXRfZmxhZ3MoKihfc2wyZSkpICYgX1BBR0Vf
UFJFU0VOVCApICAgICAgICAgICBcDQo+IC0gICAgICAgICAgICAgICAge19jb2RlfSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAtICAgICAg
ICAgICAgaWYgKCBfZG9uZSApIGJyZWFrOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4gLSAgICAgICAgICAgIGluY3JlbWVudF9wdHJfdG9fZ3Vlc3RfZW50
cnkoX2dsMnApOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+IC0gICAgICAgIH0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXA0KPiArICAgICAgICAoX3NsMmUpID0gX3NwICsgaV87ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gKyAgICAgICAgaWYgKCBzaGFkb3df
bDJlX2dldF9mbGFncygqKF9zbDJlKSkgJiBfUEFHRV9QUkVTRU5UICkgICAgICAgICAgICAgICBc
DQo+ICsgICAgICAgICAgICB7IF9jb2RlIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXA0KDQpUaGlzIGRvZXNuJ3QgbWF0Y2ggZWl0aGVyIG9m
IG91ciB0d28gc3R5bGVzLsKgDQoNCmlmICggLi4uICkNCnsgX2NvZGUgfQ0KDQp3b3VsZCBiZSBj
bG9zZXIgdG8gWGVuJ3Mgbm9ybWFsIHN0eWxlLCBidXTCoCAuLi4NCg0KPiArICAgICAgICBpZiAo
IF9kb25lICkgYnJlYWs7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwNCg0KLi4uIHdpdGggdGhpcyB0b28sIEkgdGhpbmsgaXQgd291bGQgc3RpbGwgYmUg
YmV0dGVyIHRvIHdyaXRlIGl0IG91dA0KZnVsbHksIHNvOg0KDQppZiAoIC4uLiApDQp7DQrCoMKg
wqAgX2NvZGUNCn0NCmlmICggX2RvbmUgKQ0KwqDCoMKgIGJyZWFrOw0KDQpUaGVzZSBtYWNyb3Mg
YXJlIGFscmVhZHkgYmlnIGVub3VnaCB0aGF0IHRyeWluZyB0byBzYXZlIDMgbGluZXMgc2VlbXMN
CmZ1dGlsZS4NCg0KfkFuZHJldw0KDQo+ICsgICAgICAgIGluY3JlbWVudF9wdHJfdG9fZ3Vlc3Rf
ZW50cnkoX2dsMnApOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KDQpQLlMuIEkn
bSBwcmV0dHkgc3VyZSBJIGhhZCBlbmNvdW50ZXJlZCB0aGlzIGJlZm9yZSwgYnV0IEknbSByZS1y
ZW1pbmRlZA0Kb2YgaG93IG11Y2ggdGhpcyBmdW5jdGlvbiBzZWVtcyBsaWtlIGEgYmFkIGlkZWEs
IGV2ZW4gaW4gdGhlIGNvbnRleHQgb2YNCnRoaXMgbWFjcm9zZXQgdGFraW5nIGFyYml0cmFyeSBf
ZG9uZSBhbmQgX2NvZGUgYmxvYnMuLi4NCg==

