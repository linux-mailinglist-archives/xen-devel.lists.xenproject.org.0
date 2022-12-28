Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A91E6587DE
	for <lists+xen-devel@lfdr.de>; Thu, 29 Dec 2022 00:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469582.728964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAfmd-0003LC-9A; Wed, 28 Dec 2022 23:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469582.728964; Wed, 28 Dec 2022 23:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAfmd-0003IA-5i; Wed, 28 Dec 2022 23:24:27 +0000
Received: by outflank-mailman (input) for mailman id 469582;
 Wed, 28 Dec 2022 23:24:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xfAD=42=citrix.com=prvs=354503da8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pAfmb-0003I4-Ru
 for xen-devel@lists.xenproject.org; Wed, 28 Dec 2022 23:24:26 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c226275d-8706-11ed-91b6-6bf2151ebd3b;
 Thu, 29 Dec 2022 00:24:23 +0100 (CET)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Dec 2022 18:24:18 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB5972.namprd03.prod.outlook.com (2603:10b6:610:e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.17; Wed, 28 Dec
 2022 23:24:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.016; Wed, 28 Dec 2022
 23:24:13 +0000
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
X-Inumbo-ID: c226275d-8706-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672269863;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Lxy5aIf+V6oxW/7pQpxkJRh0iDWgDWC4OgwyQSpsaUI=;
  b=dIn1iiMQZRVQdYXe0VZWWiESMeHji7QEsjhugzOl2hD71ePlYOXnA4XI
   b8WXpJWgTC236bBvQ8O2q8Lxm4U9z+ljSG556y24HgYLbAJPg4B3Mytr0
   WAgWFIho46POiSoOcX7JhRiLWhIDy1GDKAOb+GDx1WgjBKxaX4RlnKSJ0
   A=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 92880165
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:07apo6ualgid2tvjxUJFQbzxwOfnVLVfMUV32f8akzHdYApBsoF/q
 tZmKWmCbP2OYTPzLotwao3kpEhT68TQmNU2HQNupXo8RCgX+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWExyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwJnMsTwyZlaGK76/4eLlXpZgnL/S6M9ZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIC9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzipq4y2QPOroAVIB0qDQKxo/adsE+RWfNCA
 UEzwSs0joFnoSRHSfG4BXVUukWsuRoRWMFREqs59RuKwarX5C6WA2EFSnhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdFjD5x
 TSXpyEWnbQNitUK0a799lfC6xqnr4LFSQMd7QzNUmWoqAh+YeaYi5eA7FHa6bNKKtmfR1zY5
 HwcwZHGtqYJEI2HkzGLTKMVBra16v2ZMTrax1lyA50m8Dfr8HmmFWxN3AxDyI5SGp5sUVfUj
 IX742u9OLc70KOWUJJK
IronPort-HdrOrdr: A9a23:PCTAOagE79RetO5pp/FZODurd3BQXssji2hC6mlwRA09TyX4ra
 2TdZEgvnXJYVkqKRIdcK+7Scu9qB/nm6KdgrN8AV7BZmnbUQKTRelfBODZrAEIdReeygdV79
 YET5RD
X-IronPort-AV: E=Sophos;i="5.96,282,1665460800"; 
   d="scan'208";a="92880165"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLtLpasxifUF7N1EH7rXTjahe23BIuC4p4g2KM9zwmWqnrhTa/+2h12FG/J/mJS+Irges7SWyixnHDZbUqcCNPqfL11NERQPzIkQ73zqI65uZGQsoGgaqtQce60+75gmhfI+A8UM/7SNknz5aY0OWF12QgtqQh8Uqf+dLJ1qmNgc8ignK/0TrRdU3ifEREiB1YDKXJw4C8kInwnd/4ISeo5RwT8w5H0FvGi4s8pxpndzR2na1zIThjy3ru89xRe49VmFPTSRjwmEovD0LmuaX0fpSEKK8F90i4B2J6VxPZ9y2TTUA/3/gwNie49zim/gDcTCmIeCQppPF19WKYhtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lxy5aIf+V6oxW/7pQpxkJRh0iDWgDWC4OgwyQSpsaUI=;
 b=d+7Jzjnwc1vCeBnIXu0Qr8LSXe2xjxc30oq48sLIJlQVbKz3nm6AAtj5V6JshPbH0eOEgunnGmvlv4gbcIyxPe6feFLIylx0zJLiILk3byJi6ZSR+U0Hf6z0y1yIOZB4jfZ+JBMvxYx+g7HqKMZkHEtD3BJXHRrvc8yB1vXDTWCxODe/zOIigKr+mLfEDw1K5xAoIKnVAZUAoVIrFkTbBrhpqEdSTXa9TF8zeafoGyn0w5qtcFP9jGAFMALB5lt/hYQFlx8VPwVzw9Bz8wcj7XaLdcOviA200LYJg8X7MLkCu/fJ54rODWfAIzsn7WZXZ19Ln886vcH1dAE0pPExsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lxy5aIf+V6oxW/7pQpxkJRh0iDWgDWC4OgwyQSpsaUI=;
 b=YKAdsX508XTCINJAOS4jj74r7H2v9UkKnq7aAKNew1VHvhEnYVoljKkkiFvdTi+MEju0pMSSqorUto8KUfxZnksN168KHslHokAgD1Bg7pm/bpLOPkIqRSTKjEMpwEWoMdIY37SUo3PwjNmXTMcorF+5Xy7rTnjpP9aHg4F/RpQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v1 2/4] automation: add cross-compiler support for the
 build script
Thread-Topic: [XEN PATCH v1 2/4] automation: add cross-compiler support for
 the build script
Thread-Index: AQHZFsAK4cT7u1aq80+VSFJtEw0nw66D+XwA
Date: Wed, 28 Dec 2022 23:24:12 +0000
Message-ID: <8f8c26d5-934d-0dd1-1d51-b04e134fcf6e@citrix.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
 <3c926f637c4738bd14db10e8fe8f72a6eae2dfd4.1671789736.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <3c926f637c4738bd14db10e8fe8f72a6eae2dfd4.1671789736.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH0PR03MB5972:EE_
x-ms-office365-filtering-correlation-id: eec5afb3-e4d3-4716-4be6-08dae92aa126
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4AmYwjQpfqaHSjZ9INVryGcfwRH2K1FpGgRsYycCfLIA+LJiLlI7K4h611L9fVIAjmc5PbvjzTihbQtbW4Y3CTXLCZoS46FKwB/7WioBaDYDbKOgNKKklb1OMdjX8ujImXB6dtIULbuyptkTBRwegZ2NIlUYyNpcBRsz/XWxAGPMPRfHbe8PxjOAtt6G6MIaAbXXJ4rN6RuNezn81VuqEnvUaOPGhhaR7SHGwwAeSGVpKv7QlCWj7l+jHoZpbBaMMexEHThE8tYCn5IWXNk/XW9a3mo7+8bqu7HbBo8bxKUKaWnI3aybBFL8vO/DGV1P7XdZ1Xu+zNukCsjoN2TSon6xbYhnEh8knHc3go1cHydrvpgORLuo0adpRg6yvnxS7n7Ya8B5zjSYHRWP0PCnojkwpLxxWot5EG29l/UkJv3cQvPdFNFLn29YIqXX1BBcnML2cKweUzXLOpi6Jp9GM4lyhALSEKte+HoBuXOeZqIG/j6YLyydRnodgBpwS2kv6LUn95BvJclaeHK/sEvvFrYVP3OmWbzdOMGE/JH3R2zHC7lU3Ydc1HWBuwi6v8bYQN57cWDigcWD/fBVyczfd46VSEXhP3iOe3bk8vv3NfiRqkKH0xpXBEsfliDyg0x9lQFOy2f8ROrGf+929yuEmgDoh9HFhMzSZ/tJcLYI+sp2hf2WkBEDtcgsHyiVyylH6itVXCTl3JfBHCPvxDZIecmhk372YUfSzJA6QvOkQtNCXf5UVvxWup5ZlYLTXJDs7vIQNLhk6IPiC6+57h+l3g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199015)(31696002)(86362001)(76116006)(91956017)(66446008)(4326008)(8676002)(66946007)(66556008)(66476007)(64756008)(2906002)(5660300002)(8936002)(41300700001)(26005)(83380400001)(6486002)(478600001)(2616005)(6512007)(53546011)(186003)(6506007)(316002)(38070700005)(110136005)(82960400001)(54906003)(71200400001)(38100700002)(122000001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SzhVMVFhcElVQ09HQnp2bTFwQkQ2Vm5WL0dmVFYxYVEyQVI2S0tEOGErTzV4?=
 =?utf-8?B?Z01UbVFrek9FS0tmcVVjM0h5cHNiMzVCM2h6THRDeVN1K1lTeVRwT2FFL3JH?=
 =?utf-8?B?MGRqNFhIM3VPQzBFcm05bU5LdGV0OWxhSWlGWVVVeVhJUGdlcVNwa2FFVEUx?=
 =?utf-8?B?OXNMTzJ5TVpobk16OGhZeFdHUXR1MHN5NFhqVzloMzFvbFJFK1NHeWpsVjJL?=
 =?utf-8?B?eGR5dFQrc1JPcVAzcGthdTczRElxQnc4cEIwM202aHhzR1hKV1VxVEo2WEVi?=
 =?utf-8?B?aEh6OGNHUlRrQ3NYZFhLWmQwMWpYTm9ud0dsNVI0VUV1SGVETm83cCtaV212?=
 =?utf-8?B?cXZPZVVxcnFTc2N6TUMxZVBmVkRqb1p5WVVRWmE3Q3U5WEFFcytvdXVoS04v?=
 =?utf-8?B?bFdaZlBaR29kdlJYSXdRdk5FMjhEZ1doY1Uxb3hhRS9RSDl5blpBVEQyNUR6?=
 =?utf-8?B?Z0llV2VKVVZtanVTTnp0dDNmbWo1VENVaHRBd0U5ME1XdmNLVUVqQVlWV3ox?=
 =?utf-8?B?VHZuN1AxcjA3c21mditDR1NndTc2dmZzbG1BeE4xdXhNK01GSHJ3RG9YN21z?=
 =?utf-8?B?dDVxMEVudTBYNnJHQWxmL1c1R0hNUHUwWVo4Q0orNGtmSHErLzBZNDg0QndS?=
 =?utf-8?B?T2hLc1oxejlYZlJTSE1oL2hvVlp1K2J2RzJuYzNwVThxMHFDazdjb3RLbWgr?=
 =?utf-8?B?cUpvSThNSzNWeWVNVTlkYmtGcVg0ZXk1YlhKcW1uK0MvSThkOGxHTnlRV0xw?=
 =?utf-8?B?QTFGanFkdXdBRDU1aHAyY1pEZWM3MWQ0YVdlcnYrOG0xamttdTEvY1lvU3Nj?=
 =?utf-8?B?Rm16NXRTeWZoZkdHMGhycFJKVjdpRnhkVi9iRWNvQXlBa01RZFFGUlRxN29V?=
 =?utf-8?B?RUJHbi91ajlmL0luTDU0YkFKbEFuY0lSN2UyZzc1R2J3Sk96SWFhblN4eXh3?=
 =?utf-8?B?UXY1NUpkTWlBVFNFR1hDTDdZMmVNNy9CNG10WHJOYW0zQjRsaXF0cjhHYWtP?=
 =?utf-8?B?ZEF1QlY2blN3MzV3SVlvRkQwa0pUaEFaRlpZTVBRVCtWa2RvWmdCUHJ2Z1o5?=
 =?utf-8?B?a0dNbllOQnZxY2pkSkdaOC96TmdHeWl6YWxYa3YzUGVCRmQ3b3VVY0UvRFJr?=
 =?utf-8?B?QUlBQUxObkpwMm5qY2JtdjR3bnU1b2ovMi9SYnBVWTVBNzFKdUdyUWtXNERH?=
 =?utf-8?B?REZCdlkveWJvbEhOMkR3a0swWlFnZlIvZ1F2b1BjVmgzYjlKczFpUi9LV05O?=
 =?utf-8?B?YmFXTW9hblljVkJwOEtVVEIxWWFGMWZQM0VWclpCdzVPMGdXRGl5T0ZmOU9F?=
 =?utf-8?B?WldjSnI2NHBZU3M0cmMwRzZvQmJRWEprMkZoZmdCTVpjTnRUMWRLYXJKbEZN?=
 =?utf-8?B?dDZiMURjQlU5OFFzdEMveitJamV2RGJ2cCtpbENYSFRaYW9TdCt6OFZzRFFS?=
 =?utf-8?B?V1NSQnY2VDUrWDlPVDVqaGZtWmFPWFZPZ0VTam44eS9OWm1aME9aM3paYVMx?=
 =?utf-8?B?a0JXamhPa2Q3Nzl1c2lIR2Vmd3FrUjA3V2R6M21DTUlhY0pnWGpINUs4a0No?=
 =?utf-8?B?TGtXUUlqRHdDeldnandCbXlEMmV3SWVCelRhM2FHckk0TEp4STUwNGw4bFUx?=
 =?utf-8?B?cStHdTBRSU1US3FLK2poYWtPbmF1RVlQbmNQSVNHNE5qdUR3YkVSNEl2MlVR?=
 =?utf-8?B?VEZhVmF3cGRGM2YyM2JNYmhqcjVZOFY3dDU5RUhDbnhxMW90SW1yWXdVb0s3?=
 =?utf-8?B?UzNYc0ZDTlRrdTFnQk9oSzFadzYrTkRzc1lyQllsZHBNRXZ0bVM5Wm50WUZY?=
 =?utf-8?B?dHhkMGhEaFN6NU9SZTFTVWFVbFdzWEFyZWtmSzhPYUZRdittbVpZS3ZnNkV5?=
 =?utf-8?B?dmZ0UmZZcWpGcmIxWjJsaDlYNDl2MGM0U2xyT2FrQWcwTktpQ3JvZVJIVUxw?=
 =?utf-8?B?d2hMZ1pabGM4dE5QUzVRK2NRYjBOR1NNSnltdEFwU3VrTWFPN1JERncwZVVh?=
 =?utf-8?B?TTVBUmhIU2ZTbW9jWmx3ZEZBZktwTitkYU1ERnNLZmtvS0hyUDR1V21qYWZr?=
 =?utf-8?B?U212K2dZRmxtUTBSVmxGUVhVUXhsOC9hNC9Ma0p2dGxuZkROdHJCMnp6amVT?=
 =?utf-8?Q?AHNy9n5AE+LM0lsVMHyTUr7Rf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2A27D485E75084C8488229BB14DE27A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec5afb3-e4d3-4716-4be6-08dae92aa126
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2022 23:24:12.7573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ekQg5zapt8I+X6nUU53vdTGaa+Bg7MuE8ZPg07te6y2RQS+10VPp6gR4Fcd1hkdW+qhBsjmcCu7vcszQ6dBhwD3BdONWP6nIht/RIYcdT0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5972

T24gMjMvMTIvMjAyMiAxMToxNiBhbSwgT2xla3NpaSBLdXJvY2hrbyB3cm90ZToNCj4gZGlmZiAt
LWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZCBiL2F1dG9tYXRpb24vc2NyaXB0cy9idWls
ZA0KPiBpbmRleCBhNTkzNDE5MDYzLi4wMjZmNDgwZTc2IDEwMDc1NQ0KPiAtLS0gYS9hdXRvbWF0
aW9uL3NjcmlwdHMvYnVpbGQNCj4gKysrIGIvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkDQo+IEBA
IC0yLDEyICsyLDEyIEBADQo+ICANCj4gIHRlc3QgLWYgL2V0Yy9vcy1yZWxlYXNlICYmIGNhdCAi
JF8iDQo+ICANCj4gLSRDQyAtLXZlcnNpb24NCj4gKyR7Q1JPU1NfQ09NUElMRX0ke0NDfSAtLXZl
cnNpb24NCj4gIA0KPiAgIyBFeHByZXNzIHRoZSBjb21waWxlciB2ZXJzaW9uIGFzIGFuIGludGVn
ZXIuICBlLmcuIEdDQyA0LjkuMiA9PiAweDA0MDkwMg0KPiAgY2MtdmVyKCkNCj4gIHsNCj4gLSAg
ICAkQ0MgLWR1bXB2ZXJzaW9uIHwgYXdrIC1GLiAneyBwcmludGYgIjB4JTAyeCUwMnglMDJ4Iiwg
JDEsICQyLCAkMyB9Jw0KPiArICAgICR7Q1JPU1NfQ09NUElMRX0ke0NDfSAtZHVtcHZlcnNpb24g
fCBhd2sgLUYuICd7IHByaW50ZiAiMHglMDJ4JTAyeCUwMngiLCAkMSwgJDIsICQzIH0nDQo+ICB9
DQo+ICANCj4gICMgcmFuZG9tIGNvbmZpZyBvciBkZWZhdWx0IGNvbmZpZw0KPiBAQCAtNjYsNyAr
NjYsNyBAQCBpZiAhIHR5cGUgcHl0aG9uMyB8fCBweXRob24zIC1jICJpbXBvcnQgc3lzOyByZXMg
PSBzeXMudmVyc2lvbl9pbmZvIDwgKDMsIDUpOyBleA0KPiAgZmkNCj4gIA0KPiAgIyBTZWFCSU9T
IHJlcXVpcmVzIEdDQyA0LjYgb3IgbGF0ZXINCj4gLWlmIFtbICIke0NDfSIgPT0gImdjYyIgJiYg
YGNjLXZlcmAgLWx0IDB4MDQwNjAwIF1dOyB0aGVuDQo+ICtpZiBbWyAiJHtDUk9TU19DT01QSUxF
fSR7Q0N9IiA9PSAiZ2NjIiAmJiBgY2MtdmVyYCAtbHQgMHgwNDA2MDAgXV07IHRoZW4NCg0KVGhp
cyBjaGFuZ2Ugd29uJ3Qgd29yaywgYmVjYXVzZSBpdCdzIG5vIGxvbmdlciBhIHBsYWluICJnY2Mi
Lg0KDQpBbHNvLCBwcmVwcmVkaW5nIENST1NTX0NPTVBJTEUgaXNuJ3QgY29tcGF0aWJsZSB3aXRo
IExMVk0gdG9vbGNoYWlucywNCmJ1dCB0aGF0J3Mgbm90IHNvbWV0aGluZyB5b3UndmUgbWFkZSBh
bnkgd29yc2Ugd2l0aCB5b3VyIGNoYW5nZSAoanVzdA0KbW9yZSBvYnZpb3VzKS4NCg0KV2UgcHJv
YmFibHkgd2FudCBhIHN0YW56YSBuZWFyIHRoZSB0b3Agd2hpY2ggc2V0cw0KQ0M9IiR7Q1JPU1Nf
Q09NUElMRX0ke0NDfSIgd2hpY2ggY2FuIGJlIGFkanVzdGVkIHRvIHN1cHBvcnQgTExWTSBpbiBk
dWUNCmNvdXJzZSwgYW5kIHdlJ2xsIG5lZWQgdG8gZGV0ZWN0IEdDQyB1c2luZyAtLXZlcnNpb24g
fCBncmVwIGFzIGl0cyBkb25lDQplbHNld2hlcmUuDQoNCkJ1dCB0aGUgb3RoZXIgbG9naWMgd2Fu
dHMgcmV3b3JraW5nIHRvbyBzbyB3ZSBkb24ndCBwbGF5IGFyb3VuZCB3aXRoDQpiaXRzIG9mIHRo
ZSB0b29scyBidWlsZCB3aGVuIHdlJ3JlIGRvaW5nIGEgaHlwZXJ2aXNvci1vbmx5IGJ1aWxkIGFu
eXdheS4uLg0KDQp+QW5kcmV3DQo=

