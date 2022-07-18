Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78907578552
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 16:27:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369859.601415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRht-00027y-RA; Mon, 18 Jul 2022 14:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369859.601415; Mon, 18 Jul 2022 14:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRht-000255-OM; Mon, 18 Jul 2022 14:26:45 +0000
Received: by outflank-mailman (input) for mailman id 369859;
 Mon, 18 Jul 2022 14:26:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDRhs-00024z-Af
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 14:26:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3860d5c-06a5-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 16:26:42 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 10:26:38 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5450.namprd03.prod.outlook.com (2603:10b6:806:be::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 14:26:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 14:26:35 +0000
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
X-Inumbo-ID: a3860d5c-06a5-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658154401;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=1QE++DKcBwCnHsMRSia20tXPlUS+rCZNxSodvgto4lg=;
  b=cgK3tC3eEYlRGNHg5H00vudR0HB5l01c7TJ7KYtqbg20GjIqrc1KrNAB
   EoLGQ8wXzDYdthB4ybk3WSEyfPrwctU5BGhrLLjLk6wPRq1J+x2RsLXbu
   tM7OVK63Lbq5C4vvtBwHY3wEyyQB+2XffRGGMHzjjSwhonSZvJloVb6+C
   g=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 76043816
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aHpdSqOvqmjAKSnvrR3dlsFynXyQoLVcMsEvi/4bfWQNrUol0jFWn
 WRJC2GEO/aOYDeme9gjOYS/pEhVvcDcy9MyTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyFULOZ82QsaDhMtPvT8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFO2mvdTD09oHrcDpPkvL1513
 /Ayd200O0Xra+KemNpXS8FKr+F6dYzHGd1avXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr3wCChI1W0q3rMzUYzy0HVwBZ8z/7GN93Nd8bRbc5UglyZt
 iTN+GGR7hQya4LHlWHVqyzEaunnrAb8QI00FJmC5KBJsmCTzWFQKDAwSg7uyRW+ogvkMz5FE
 GQE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l90bPywOQB2xBQjsfbtUj7ZYyXWZzi
 A/PmM71DztytrHTUWia6rqfsTK1P24SMHMGYigHCwAC5rEPvb0Os/4Gdf47eIbdszE/MWiYL
 +yixMTmu4gusA==
IronPort-HdrOrdr: A9a23:zS2CG6n+guyUK1yBZ++LmMxz9ejpDfOAimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdG9qeu1z+8+3WBjB8bYYOCAghrkEGgC1/qo/9SEIUHDH4FmpM
 NdmsRFaeEYSGIK9PoSgzPIX+rIouP3l5xA7N22pxgCcegpUdAH0+4TMHf5LqQCfngiOXNPLu
 v/2iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLokCs2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlawkEyzzYJLiJaYfy/gzdk9vfrWrCV+
 O85yvICv4DqE85uFvF5icFlTOQlgrGoEWSs2NwyUGT3PARAghKRPapzLgpDScwoSAbza1B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/gpiuKYlGctsRLYkjTRoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4So+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSuvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9GR6svM7z94HRmyGG9fIzmZ0WS9ih33ekIhpTsALz2LCaEVFci18O9vvR3OLypZ8
 qO
X-IronPort-AV: E=Sophos;i="5.92,281,1650945600"; 
   d="scan'208";a="76043816"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0Z1GZgWEZfdxZgxRW1CswMSJJxVrq8vTk3SYfD/PSnYYCxaE4myrMSNkqR/YBODSeHCU4969oGMN+HMLeqQQX7EzOg8X6GPvl14ruTGB3+hLcca+hJwcKR6B2Y7dfZORC6FkXAskbGBhs8gOqQN3uNa7MpquqNlVB7GyGr2qgo1vpnIPTUm4GUEc+PytA7gcsqnYEpCLv8O+g66SQrWszbQhtB64ilP3GDVYvdL+2+ouwWtyskB6zgzT+EKdMyY4Te6Qjhq0+fER12jMjABlDJW6ampA6Bandt8m1fjw0m49hWM2dKasKUY9/U1JINYre7pJSgsJDLJuF41kh435w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QE++DKcBwCnHsMRSia20tXPlUS+rCZNxSodvgto4lg=;
 b=CXxrjfIqoFONkMDxJ7EQDagJYAbKILFTQ/HrVmwHLccuuc1EWJwBbt345PA75K05JqSNeNtZjg6gjfgYKFYugX7aYrNTFUKH/U/bwtgdYgMYawvYzC2vIRAfPQRcG4p5yq6e1XMJKvham1hVaJLmZN3fehD5wSRUjxqAzQ2+FzPEHsTCHB5x2mvcjqTd1x4EGeQEvcMDU9BSgMA8E5IdkgfQiUCHSu8fbU/8F1phdslrFtKMBbK+jnQtKI9Q1ZV07YyLgAL39M97yiABZZvhv3ko9kUrkysZUBVW/OWtDSST0U8+Kkh4ZCo8eWyXOV0MNLWe8yRg4bEhEQU1663xHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QE++DKcBwCnHsMRSia20tXPlUS+rCZNxSodvgto4lg=;
 b=YD8UjJJvgXGcfUK5DklU2mkIEdp1WywnjaHQecKdfIGrnA3jMSpFZFBE1jYnEf7y6avkdoCrnvPNvZ4SnsJ20vNzOpQrcimKQ4otnL3piJEA1/Xm+oV1EB/z0VFFLVVow1UBfcRrdqI46fgpeB+JOeG9fXJWvK+l3KAiOQMZ5VM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Marc Bonnici <Marc.Bonnici@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Xen Memory Sharing Query
Thread-Topic: Xen Memory Sharing Query
Thread-Index: AdiXcIvKzj1u3ooYRvOwLKlCsLdCEAA/89UAAIdcHqAACSWogA==
Date: Mon, 18 Jul 2022 14:26:35 +0000
Message-ID: <c16fe888-3382-49a7-6bdd-1622b2d3dc0e@citrix.com>
References:
 <DB8PR08MB5452C2AEA96D0BB6AECD6618968B9@DB8PR08MB5452.eurprd08.prod.outlook.com>
 <e9e66c0c-147e-c2a7-b8ad-99a82dc89a61@citrix.com>
 <DB8PR08MB5452F79C2E13B0D7D9E58681968C9@DB8PR08MB5452.eurprd08.prod.outlook.com>
In-Reply-To:
 <DB8PR08MB5452F79C2E13B0D7D9E58681968C9@DB8PR08MB5452.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9144db0a-d5ce-4fe2-b946-08da68c9852f
x-ms-traffictypediagnostic: SA0PR03MB5450:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +W7BfACObs72DvuO5PgfJ6ukMUk0BhaJ3vjkEKDn+NakXggRrFkDTlVFHqHsabct8qhKKOV2jKO6SXd0rtfxX85j+U3GihHQGIw6qqJOIstMbeiw3lIhyJsZ9vD7ioNdOQ9IfLc6kQ6Hm+bgqu/zqpGxL9D81KDtt9nFksG4NpvRij1Pz/vWENzZsHXZcTsPVMRAc5JEiK1BVYaRy8sYZZk58e2JMz6uSEukvnq86e8y6WuPu7d0+AaKX/j08bCE7lausE9uWJ4e/TnIGY/yNm5MLUq5NS1gC8dCxMbNZKN3Q5d2uqvalCm5dXFZnQehXnuXsU2CZ1b3BgGYJFqRtaMXNZCfaVotJYSErcbniH8E6znMJ3dd5UNY0fM9a1arxoGG6krSoNZHluBhrueU1KOxNdbNfnHhtlmysYHTyoTTioJZuPYyIuLJ5hQowTIBmOTxUb6rWJsZ/q1Lq6HRduo8xP4CwlIhXghI+e3MF672GSo+x+xB3fpMxqg/iDYayyJJgMlGHjVoGji8M1lJcSd+V108JrUpFkV/Vb2oF4hVTxg6qmdVzKOK4i0CZxD2E63Ye23loVIcoQd51gXEfrEi5BtkG2VmulxHpTz3Itj2iz7U37T/IlJnn52SFKK0FfOHU1gmjHSd8x3sZEw/GFjlHCFHkXjZUlFzAH5PvswzPWoS9DLi0dHCe6JmHDK2X6gAW1p0FxAZdZDgXduSOHOXdGQjD72l6ZP5N6XDw8leVHZSjKO08F7Kr1a1mWyPQyanilV+BmQZwxvp10k7rVsEtfD3hxPyUrkmUjklzX9ufjzx6pZbLGDTz5hhgZgj8coUSyviZur2n+6Lo1kN7OXaFXcvz/Lz97wkZrI9sPq1RbJo0IOoAjcExYUb7kFb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(38070700005)(2616005)(316002)(83380400001)(31686004)(2906002)(82960400001)(6506007)(41300700001)(53546011)(5660300002)(76116006)(66946007)(186003)(91956017)(66556008)(110136005)(66446008)(64756008)(36756003)(8676002)(8936002)(478600001)(38100700002)(6486002)(3480700007)(6512007)(71200400001)(86362001)(66476007)(122000001)(26005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qk9tVmZnZTZWbnE0Z1lMb1QwSjQweEpMY3RBZzI0M2VyZ0FSSm5pajVTSkIx?=
 =?utf-8?B?NnBnKzZNcVE2R0Y4RjRqNFlyL3kxVXArM2g2TDB0ZFBQcXRha0hLMGlhTlYz?=
 =?utf-8?B?a3k2M3dPcHNaMTF0SEw1eS9CZEV2YTlUWGdxYTRtWEVmZDZwOVFFcy9vRDRw?=
 =?utf-8?B?VGJjM2xVWGU5REZxMmFXLzBkZFc1ZzFLaGE4Rm9nK3phWU5VejM3eWtWaGp5?=
 =?utf-8?B?KzVjVjM1a0RrOFQrMHd5WVNSRjdmWlQvS3JWUnBwUmlrTnlZc1NYQ3R0dTBz?=
 =?utf-8?B?eXZMMHppdE9tWE41aDVwYm1lOGFmNjVZK1hlUnRZY1dHY1lHT2oyWWRLdDJ1?=
 =?utf-8?B?YW1ieCtWQWFLcGVpTnZWVlJ2aHBPNmJPZUJraGFIOWRtd00zMzdkSkl5Z2wr?=
 =?utf-8?B?VmxtODZBQkN4NXB2ZjJiUWNjWkJGS2FaVzVlOUNOT3dSV2ZNUWVmVTZyaDRz?=
 =?utf-8?B?RVhlYzdzUVVkaWFleFpRM211Y29DWHV4ZDBkWVpyU2Q5TDU2QnQvQnpxRlBz?=
 =?utf-8?B?d0RyUXJWSElvcS8yTDkvL1ZoWmZYc2drc0I0T0MwaEVVR0VzT2tWenkvUzRa?=
 =?utf-8?B?QmJMQnpPTW11Q3JvS3p5OFh0VldKWWZqekk2aGtoQzlCeDRic3MzUktkSmRo?=
 =?utf-8?B?VThlNm9KQmtwbVFTUFVMZVVEaU5UZ1RzUzNrWjFMQmRWNURRQTd3bFg3aDRL?=
 =?utf-8?B?cTl6ZlJodXBORys4Q0xXRzJuOWY4SzYvNFh1VHNkWHg4dWlWS3RJcFVBUk1C?=
 =?utf-8?B?eEhHcXZOU2l5QWVXMUQxVW81MlMrQXY0QlFUaDluQVlUZFEzZjdIMERQTlc4?=
 =?utf-8?B?VXEreWp4MjFuZWdnNTRCT0FFczZzbzUyeDlFUmU0cGhKMHRLNDhaeGdjeVg2?=
 =?utf-8?B?eFMvV2kvM3J5czNLK2JVZURMbU80VjZVRXNCKzJLUjl0cDBFby9aNFpPMUla?=
 =?utf-8?B?Y0N2dVFlZlpkeUZ0UXRrV1FkQjcrQkJjZVRXbS9QLzFYRGROMnkwRFY5UnZv?=
 =?utf-8?B?aUJzRnpQWm84WTBDRFdsWktIYmdUb0FZK2poUU9OZjQ2NTFKRytLanFaZVh2?=
 =?utf-8?B?VXlTN0V6cU92ZXFyUGp3YVo0djgyMlI3SUpVOCt2S2ZTQ3Y2L0JQSGJrUTd6?=
 =?utf-8?B?bzlPcEt0STNiZ0w4a1R4Y09wbWV2bjVvZWJlcWtyNDllYjNrL1BZSnNnWW5a?=
 =?utf-8?B?YzNLSVRhNVNNRjBLZi8wK3JmKy9XWkVCV25ScDl6ZVQxcyt1RlBsUjNndGVO?=
 =?utf-8?B?YndlNUI3ZFdNaDBYeWRNZXAwc0MrMmF5b2E1YXdZWkRQQWd3MlFYRUNnakNS?=
 =?utf-8?B?VlRPNWlOQlA4NzQzTXZOUlZ1dm1QbHVpa0c4b1hZUDJVSStJUFhDYjJUODVN?=
 =?utf-8?B?VDM2c1A2bE5IWXNtenk0SlE1NnJqUWQ5a09qUUpiZmpBOHlzZ1pMTFdud0Zu?=
 =?utf-8?B?L0xSS05zZzM1ZjhpUVRvUEZkNDk2N3ZCUkxka2ZsVEJqdG5MRHdKeHpoeWhL?=
 =?utf-8?B?UWo4eFhEQ0RFQzNlTlRGK1ZGNU5Vc2toVXBTZlRvSFVnRkN1Qm9BbDQvdGRG?=
 =?utf-8?B?M2pSWEQ1czVXNGcxT0hnNzJGcy9MNU5hNUlycHBXY0FVZ0h1UHJ1MVJTRkw1?=
 =?utf-8?B?T2gwdlVOMEFscFdyanZsOXNxWVphVEJTSmFRZXU4a1U5dEdnUDVEVEt0YzFp?=
 =?utf-8?B?NllxNWMwZ0Y0M29MUXFHODllNnFvWURiZEp4VlVCUVQzQUlHUGlXUkcvUHov?=
 =?utf-8?B?T3kvUjhSK3ZSRTltK0hBTWtMbThBdDA4NTRFc2dPaEhJeG5WQzdrdmNwYmM4?=
 =?utf-8?B?WVE3Vm1McWYvcUhlRXBqbzJQbmdWUVN5OTFpcFJQVm9rL2tXcTdDYVlMc3BW?=
 =?utf-8?B?NEltNFhTQnZqMzk0ejc3cUFuaDUvdjNEcDloTDhoS3l3SHdmMUdDR1gxTGpY?=
 =?utf-8?B?LzVuUzIyUWU3bGovbnZvd1NEdTN4ZlkrbVZXTlhNRTYyeTVoTHh6eGR3aU5s?=
 =?utf-8?B?c3pwTUY1cnlQbDdadlduZFRSSEhXRFlRMlQ4Z0ptNDRsWExzK3NCVi9nWEJV?=
 =?utf-8?B?NmJJZ3lmS0F2RmRQWldBWDRZSTBuRG92alo3YzRtUVV3NUNJVW1RREdCQVpU?=
 =?utf-8?Q?RCups0Cjo8hfh3txttRY1tbHD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F01B129B915EDD49A7643521C24CB663@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9144db0a-d5ce-4fe2-b946-08da68c9852f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 14:26:35.8246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YhB2EwX5mptOK9vubs6Zr+isgg8KsS4bG6W33R2wGT5ZNfNw+1YmazyC9xGboQFcCuzjPl26GjmnlrxHP5LqleW1lIjAO6ONL1btzOxDNcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5450

T24gMTgvMDcvMjAyMiAxNDo0MCwgTWFyYyBCb25uaWNpIHdyb3RlOg0KPiBIaSBBbmRyZXcsDQo+
DQo+IFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgZGV0YWlsZWQgcmVwbHksIHRoYXQgbWFr
ZSB0aGluZ3MgDQo+IGEgbG90IGNsZWFyZXIuIEkgZGlkIGhhdmUgYSBmZXcgZm9sbG93IHVwIHF1
ZXN0aW9ucy4NCj4NCj4+IGdudHRhYiB2MiBpcyBob3JyaWJseSBtb3JlIGNvbXBsaWNhdGVkLiAg
DQo+IFdpdGggdjIsIGRvIHRoZSBoaWdoIGxldmVsIGJlaGF2aW91cnMgY2hhbmdlIG11Y2ggZnJv
bSANCj4gd2hhdCB5b3UgaGF2ZSBvdXRsaW5lZCBoZXJlPyBEbyB5b3UgZXhwZWN0IGluIHRoZSBs
b25nIHRlcm0gDQo+IGZvciB2MiB0byBiZSB0aGUgcHJlZmVycmVkIGltcGxlbWVudGF0aW9uIG9y
IGFyZSB0aGV5IG1vcmUgbGlrZSANCj4gYWx0ZXJuYXRpdmVzPw0KDQpUaGF0J3MgaGFyZGVyIHRv
IGFuc3dlci7CoCB2MiBjb21lcyB3aXRoIG5ldyBmZWF0dXJlcywgYnV0IHNvbWUgZmFyDQpzaGFy
cGVyIGNvcm5lcnMuDQoNCnYyIGluY3JlYXNlZCB0aGUgZnJhbWUgc2l6ZSBmcm9tIDMyIGJpdHMg
dG8gNjQsIHNvIHlvdSBjYW4gYWRkcmVzcyBhDQpmcmFtZSBhYm92ZSB0aGUgMTZUIGJvdW5kYXJ5
Lg0KDQp2MiBhbHNvIGludHJvZHVjZXMgc3ViLXBhZ2UgZ3JhbnRzLsKgIFRoZXNlIGFyZSBub3Qg
bWFwcGFibGUsIGJ1dCBjb3B5YWJsZS4NCg0KT24gdGhlIG90aGVyIGhhbmQsIHYyIGFsc28gaW50
cm9kdWNlcyB0cmFuc2l0aXZlIGdyYW50cywgYW5kIHRoZXNlIGFyZSBhDQpzZWN1cml0eSBkaXNh
c3Rlci7CoCBUaGV5J3JlIGxhcmdlbHkgZGlzYWJsZWQuDQoNCkZpbmFsbHksIGFuZCBtb3N0IGlt
cG9ydGFudGx5LCB2MiBzcGxpdCB0aGUgc3RhdHVzIGJpdHMgb3V0IG9mIGZsYWdzDQpmaWVsZCBh
cyBhIHBlcmZvcm1hbmNlIG9wdGltaXNhdGlvbiwgYnV0IGNyZWF0ZWQgYW4gQVBJIHdoZXJlIHRo
ZXJlIGlzDQpubyByYWNlLWZyZWUgd2F5IG9mIGludmFsaWRhdGluZyBhIGdyYW50Lg0KDQo+PiBX
aGlsZSBhIGdyZWYgaXMgbWFwcGVkLCBkb21BIGlzIG5vdCBwZXJtaXR0ZWQgdG8gZWRpdCB0aGUg
DQo+PiBhc3NvY2lhdGVkIGVudHJ5LiAgDQo+IFNvIElJVUMgb25jZSB0aGUgZ3JlZiBpcyBtYXBw
ZWQgdGhlbiBkb21BIGNhbid0IG1ha2UgYW55IGNoYW5nZXMgDQo+IHRvIHRoZSBlbnRyeSBhdCBh
bGwsIChvciBhdCBsZWFzdCB0aGV5IHdvbid0IGJlIHJlZmxlY3RlZCkuDQoNCkNvcnJlY3QuDQoN
Cj4gU28gaWYgDQo+IGRvbUEgd2FudHMgdG8gbWFrZSBhbnkgbW9kaWZpY2F0aW9ucyAoZXh0ZW5k
IHRoZSBzaGFyZWQgbWVtb3J5IA0KPiByZWdpb24sIGNoYW5nZSBwZXJtaXNzaW9ucyBldGMuKSwg
dGhlbiBpdCB3b3VsZCBqdXN0IGNyZWF0ZSBhbm90aGVyDQo+IGVudHJ5IGFuZCBzaGFyZSB0aGUg
bmV3IGdyZWY/IA0KDQpBIGdyYW50IGNvdmVycyBhIDRrIHBhZ2UgKHVudGlsIHlvdSBzdGFydCB1
c2luZyBzdWItcGFnZSBncmFudHMgaW4gdjIpLA0Kc28gdGhlcmUgaXNuJ3QgcmVhbGx5IGFueSAi
ZXh0ZW5kIHRoZSByZWdpb24iLg0KDQpGb3IgcGVybWlzc2lvbnMsIHRoZSBvbmx5IGludGVyZXN0
aW5nIGJpdCBpcyB0aGUgcmVhZC1vbmx5IGJpdCwgYW5kIHRoYXQNCmlzbid0IHNvbWV0aGluZyB5
b3Ugd2FudCB0byBiZSBjaGFuZ2luZyBtaWR3YXkgdGhyb3VnaCB0aGUgdXNlIG9mIHRoZSBncmFu
dC4NCg0KQnV0IHllcywgeW91IGNvdWxkIHdyaXRlIGEgbmV3IGdyYW50IG91dCB3aXRoIG5ldyBw
ZXJtaXNzaW9ucyBhbmQgdXNlIHRoYXQuDQoNCj4+IEZyb20gYSBncmFudCBwZXJzcGVjdGl2ZSwg
WGVuIGRvZXNuJ3QgZW5mb3JjZSBhbnkgcG9saWN5LiAgZG9tQSdzIGdyZWZzDQo+PiBjYW4gYmUg
bWFwcGVkIGluIHRoZSBtYW5uZXIgcGVybWl0dGVkIGJ5IHdoYXQgZG9tQSB3cm90ZSBpbnRvIHRo
ZSBncmFudA0KPj4gdGFibGUuDQo+IFNvIGRvZXMgdGhpcyBtZWFuIHRoYXQgaWYgZG9tQSBncmFu
dHMgYWNjZXNzIHRvIGRvbUIgZm9yIGEgZ2l2ZW4gZnJhbWUsIA0KPiBhbmQgdGhlbiBhZGRlZCBh
IG5ldyBlbnRyeSBpbiBpdHMgZ3JhbnQgdGFibGUgd2l0aCB0aGUgc2FtZSBmcmFtZSBkZXRhaWxz
IA0KPiBidXQgd2l0aCAiZG9taWQgPSBkb21DIiBpbnN0ZWFkLiBUaGlzIHdvdWxkIGJlIGFsbG93
ZWQ/IEFuZCBpZiBzbywgd291bGQgdGhpcyANCj4gcmVzdWx0IGluIGEgMy13YXkgc2hhcmVkIGJ1
ZmZlcj8NCg0KWWVzIGFuZCB5ZXMuDQoNCkkgc3VwcG9zZSBpdCdzIHdvcnRoIHNheWluZyB0aGF0
IHRoZXNlIGFyZSBmcm9tIHRoZSBwb2ludCBvZiB2aWV3IG9mIHRoZQ0KbWVjaGFuaWNzIG9mIHRo
ZSBncmFudCB0YWJsZSBpbnRlcmZhY2UuDQoNCkluIGFkZGl0aW9uLCBYU00gY2FuIGJlIHVzZWQg
dG8gcHJvdmlkZSBwb2xpY3kgYmFzZWQgcmVzdHJpY3Rpb25zLsKgIFhTTQ0KU2lsbyBpcyAiZG9t
MCBhbGwgcG93ZXJmdWwsIGRvbVUncyBjYW4gb25seSBjb21tdW5pY2F0ZSB3aXRoIGRvbTAiLCBh
bmQNClhTTSBGbGFzayBpcyByYXRoZXIgbW9yZSBsaWtlIFNFTGludXguDQoNCj4gQW5kIGZpbmFs
bHkgYSBzaW1pbGFyIHNjZW5hcmlvLCBpZiBhIGZyYW1lIHdhcyBzaGFyZWQgZnJvbSBkb21BIHRv
IGRvbUIsIA0KPiB3b3VsZCBkb21CIGJlIGFibGUgdG8gYWRkIGFuIGVudHJ5IGluIGl0cyBvd24g
Z3JhbnQgdGFibGUgdG8gc2hhcmUgdGhlIA0KPiBzYW1lIGZyYW1lIHdpdGggZG9tQyBhbmQgZW5k
IHVwIHdpdGggdGhlIHNhbWUgb3V0Y29tZT8NCg0KVGhhdCdzIG1vcmUgY29tcGxpY2F0ZWQuwqAg
UG90ZW50aWFsbHkgeWVzLCBidXQgaXQgZGVwZW5kcyBvbiB0aGUgcDJtDQpjaGVja3MgZG9uZSB3
aGVuIG1hcHBpbmcgYSBncmFudCwgYW5kIEkgaGF2ZSBhIHN1c3BpY2lvbiBpdCBtaWdodCBiZQ0K
ZGlmZmVyZW50IGJldHdlZW4geDg2IGFuZCBBUk0uDQoNCkJ1dCBsb2dpY2FsbHkgc3BlYWtpbmcs
IGlmIGRvbUEgaGFzIGdyYW50ZWQgYWNjZXNzIHRvIGRvbUIsIHRoZW4gZG9tQiBpcw0KcGVybWl0
dGVkIHRvIHdoYXRldmVyIGl0IHdhbnRzIHdpdGggdGhlIG1hcHBpbmcsIGluY2x1ZGluZyBzaGFy
aW5nIGl0DQpmdXJ0aGVyIG9ud2FyZHMuwqAgVGhpcyB3YXMgdGhlIGlkZWEgYmVoaW5kIHRyYW5z
aXRpdmUgZ3JhbnRzLCBidXQgdGhlDQppbXBsZW1lbnRhdGlvbiBsZWF2ZXMgYSBsb3QgdG8gYmUg
ZGVzaXJlZC4NCg0KfkFuZHJldw0K

