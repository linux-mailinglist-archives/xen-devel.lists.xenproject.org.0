Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6115582731
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 14:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376187.608794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgb2-0002FE-RD; Wed, 27 Jul 2022 12:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376187.608794; Wed, 27 Jul 2022 12:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGgb2-0002DM-OE; Wed, 27 Jul 2022 12:57:04 +0000
Received: by outflank-mailman (input) for mailman id 376187;
 Wed, 27 Jul 2022 12:57:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEwU=YA=citrix.com=prvs=20023c9d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGgb1-0002DC-0G
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 12:57:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a4a869e-0dab-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 14:57:01 +0200 (CEST)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 08:56:58 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6987.namprd03.prod.outlook.com (2603:10b6:a03:43b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Wed, 27 Jul
 2022 12:56:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 12:56:55 +0000
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
X-Inumbo-ID: 9a4a869e-0dab-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658926621;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SaU3rbelZEF2pKEPulzwdR1rFELP7z1MoC08BG2xuck=;
  b=WtlgMnawmFiAisZPaj3/Zd7Y35wEbclqM4acTjznQu56XpnDQ9iJUmpu
   KEh4GwR44zj02rIPSin6qyEHF3pNWGBHlj8Q/5Ml9OxOuoZdoDoYOkPGs
   ZjuHrDb1kFw86xnS9cOrwcSPoJl0QU0pI7eRXeubdiyBPcZ8moIL/aTv5
   U=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 76530055
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:n4tsOaob7/Pfba1rBFFxD/736BReBmI0ZBIvgKrLsJaIsI4StFCzt
 garIBmPbK6JY2D3c4p+PN7k9EgOsMCHy9ZkSgI9pXsxHn5D8JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q52lH5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUc9vlNLD9ur
 sZbOSs8bFOb2MSzmrekH7wEasQLdKEHPas5k1Q5lXT8MqxjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/I4/NvuQA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE2bGSxnujBd96+LuQ8eUtiViSzXcvAiYraWm/mOmkpGqQVIcKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRwtJWFRHTb8a2bxRuuOC09PWIEIygeQmM4D8LLpYgyilfKUYxlGavs1tntQ2iom
 XaNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxFzFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:pjdvo63pFNG+sW9Fv03SOQqjBJokLtp133Aq2lEZdPUMSL3+qy
 iv9M516faGskd2ZJhAo6H6BEDuewK+yXcY2+Qs1PKZLW3bUQiTXftfBOnZsl/d8kTFn4Y3v5
 uIMZIObeEYZmIVsS+O2mmF+qEboeVvnprFuQ6U9QYVcegjUdAZ0ztE
X-IronPort-AV: E=Sophos;i="5.93,195,1654574400"; 
   d="scan'208";a="76530055"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmjEUcxBkI/AkMgtBSdwixIah+h1G5Hc5l9OmkbP9fdj7/rIYc16COyoF3DAT5hyDgrjEzJn92w055DP0cX8gZdRy39hXMeZD0t4sK7pr5u1O2YfG+j5xTlLUNCMFqwVYo541npiSUxsHjlFPrNqwjncz28bAZyX9Fb11tNKJTVsbZPviDSCbpSrPEXFNwIza+CpbNIRvazhf8/H8J6nyvRy2WWe5QhOaA0j/VGE5YGVnKnMjC/KXjWPS/fFQCpwAxemLJDf+ln6BsX4owg3Cahj7f628RHGzmdWbnvfeGbDaJJYtHrMJKctOwLk4+2J6Gn/U64y/hTUpWmT54qF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaU3rbelZEF2pKEPulzwdR1rFELP7z1MoC08BG2xuck=;
 b=Kt4nIh6LL2fUl7rhaMx/oOkAq3pwpL3bxaA3/bAWThGhFGaYFQyNsr5pbb6OuwqOslyvFvBOFoe2YHxF8i+EH6r/x8ZgSNutR79H+vVP3lcn168ze41Mk2PiO7Lf3P38q7YE50MMK6TEXwAT0cYGMeMsMqfF9NvE/FEmRQoo+jYndxa8hUx01SLGdnemdyLbA9Ck90388hhmLVC6xTtPmstwN4Hgv8tqOy7Fh0xGU0z5HziGnVuQxzmTiGiud8rpblU2nmfW8iYlY3C4fSxHiV5S8pcFfq5BPybLHxh8aGIFxICxo8yB1NaYuGoULph2q3km68ymiFEXveHpcB2H5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaU3rbelZEF2pKEPulzwdR1rFELP7z1MoC08BG2xuck=;
 b=O4a1RXOICdXCNKinsbGm13FR0lnK+W/hPYGnDx/pMWBbK06V3VuSBYsbOjkdVRST394tjP8JbMDQa1VfN1iYZ7mm9vvMt+Lq7p/u61NwtUkls2udzTF6IkwceFgd0SC6eDWpw2AmMQGpMatLroRAjieU2qL3/iwbXyw5h8+65lA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 5/8] x86/shadow: don't open-code
 shadow_remove_all_shadows()
Thread-Topic: [PATCH 5/8] x86/shadow: don't open-code
 shadow_remove_all_shadows()
Thread-Index: AQHYoQmWhrHij1z4oUm+1Z4MS61G4K2SLp4A
Date: Wed, 27 Jul 2022 12:56:55 +0000
Message-ID: <8c073201-cf91-bd14-5e1a-51f52e8aeb7e@citrix.com>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <9af0bb78-f419-b4f7-d20f-cd46a5073f01@suse.com>
In-Reply-To: <9af0bb78-f419-b4f7-d20f-cd46a5073f01@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfb42ac2-be0c-4482-6066-08da6fcf7bcc
x-ms-traffictypediagnostic: SJ0PR03MB6987:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 IKRNWzg6fHaiZKpCKu0jNjIOcaVU99wUtAxtroe2q9YCofOPvk1m7Y7kchnXRi9/1Z7VDbcK5UGnz9Dm3r23BmF8o/gTNeekWUFlr6IZ02ZOGMdhEWQzPl3DlsHdJe+P07yQKuKYuPbDot5v52J15vUgLftBbZqKf8e5bX+jCYluX3BymiKCXHvNB9KrQlP6cITzLQ6oljIp2qklPTNR62IpxAMZhrsxWkTkxowLUoUkmqfj4pAby7fAoCX66tUE+8RIRRm5V79ayPDWeBhmJ/6ns7jntY/fvi8VdYc5RcfejYG+Hpx+JNW8en8bFJZjUfV+HKNHM3+fpOkvo/81ugalUbyOXU1tdzUHBcP2xjE/KIPNs8a97VE+YXbmt7V59yDm7mpC9NIeCwsKZBx/XwPm+fVsOKgWJCTwsU+SFGKrg25CUw8K5y7NYzKcbxnwJ2Bb4/lY6V+JpgtTpyyNZMPugCBIT8duliLUcJKSk7drhL+HYWpOhTSEVUJ6kgSEttke1v8ZQ1+5LY71piNRj3IUTiw+wDE2FBKwbtPavQxcg0Ihw5hILZpA4BIZcmm2E0os95kUBRBGCEibjchGl9TsG7GS/5YiN3Eum2dEmr5ZP+C27zb+5lz3/Na2CFn/XivENnWglFQZCzCairXo7PnjDxm8WsOPACFgfJU1egdNjfW9a4JL1qwDVw7kbDdJZj/uJ50KYqMpCjoVsw/yVLk6C9rg1YxKajSlUUeqDUiDYJXUjpzNpOEAFpY4aL1XY1Mgq26pLtFtApsjmEFipCAo/6pUiqgq2f11poO51CV7XOhYaSDXbqSUnAk5TUKVNwl8kG0Teh8mVV7XHyrejWptjLJKMKE2SUWmp5ruSyfnyb8C/nQACSalDwmJ5sgX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(91956017)(186003)(66556008)(316002)(76116006)(66476007)(558084003)(66946007)(26005)(6512007)(41300700001)(4326008)(64756008)(38100700002)(122000001)(66446008)(8676002)(6506007)(82960400001)(53546011)(110136005)(38070700005)(2616005)(8936002)(5660300002)(71200400001)(2906002)(478600001)(31686004)(54906003)(86362001)(6486002)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NisycUFMd2VJUUZyNFNGOXYvMXJkUWVLMHk4WDl0WHFNZHNqQlA0eTZId1Fs?=
 =?utf-8?B?WngySkkrOWtpR3VYcWZKdmJVak5mUDBFUUZCN1ZRTUpOaVRLMlYzaUd4Yzc2?=
 =?utf-8?B?MkJwZmNlTGJiaEdGOTNhdE0rM2o3MEJON3NROUZjY3RDQ0hMV1liR0lZSjdl?=
 =?utf-8?B?b0tHSW1rM01QVlk0WGRCSzE3VkFUSzFqZW5pNyt5TTQ1VjlCVTdiakxadThO?=
 =?utf-8?B?V2pRVE1mTk4xNmdqL1dOWFViSGk4TDF3dE9ZTlQ1aXpXNmVRdzVSaXQraFdh?=
 =?utf-8?B?YWgramg3bFo0QmU4TXZ5aTZNanZBR3JETUwyRmhNb1piOWVPUEI4ZzlmKy9t?=
 =?utf-8?B?Q1JvNVhsMjZOa3Z2Yi9HdFhRWm4ya2J3eW81Q1NEU0xZcUY2ZitQM1ZGVG5i?=
 =?utf-8?B?Nys2T3Y2aFVMOWNYRkpuNGpXdlRnNmZMTE11UXI2YUlHL1haN3ljQ1RNdXVw?=
 =?utf-8?B?cENobndCWkhuSGo0SVpWUUgzTXZmUWtPME1sT1BVTlBaekdtdFROR1JPRzI4?=
 =?utf-8?B?QUVUMEZGLzh4UDVSc2dWNmJJMHpNWmhHRmhaMW5hdE9EWUNIakN5WlExeWxT?=
 =?utf-8?B?b3NFVG1nbWxYQy8vclBzMVhodDNvRndPRk1sR2J1RGxRdmJvNU5vazdyais2?=
 =?utf-8?B?Uy9RbmI2a1pmRzFvVmNtTlBIdk5rTGVwdU80NjVINUxmMzlvaldnd2tqcjhj?=
 =?utf-8?B?ZUN2RC9CV3VCTDBNejN3TVllV2gzOTlEcURDQmpKbndNeEM3c2pGNUZIdGR0?=
 =?utf-8?B?aWNxNFRLVkQ0Q21GVnpjZmVsRlF4SE5ZMG9rZ2gvUFNrY2FOTFh3UFdDb1Nl?=
 =?utf-8?B?RXBwQndFR21kRkRrLzNwemdVYVIrL2xPOWtjSG9UWWIvNExwK29mYTI0Z01s?=
 =?utf-8?B?VzhVUlM4dUpFZXdLY0dWN1ZoK2dOTTZ1UXc3WHcwdVJPK29tZzROdUV5cVlz?=
 =?utf-8?B?eVhENGdvSDI5SDViWlp2VkI2TlpCQzZNOU5QT3lyUGNSK3pKN0FCUzJaOWRJ?=
 =?utf-8?B?cWlnby9QNnBrWFFJRURzQy9pVlI2djA1SHpzZ29icDVkMjIvUHI4b2hLbkJ5?=
 =?utf-8?B?d28zMWE2N1RQZTBrSHc4SkI4NmI2eERYRVFMUktJTDVyV0ZzekMySTQ2UTVu?=
 =?utf-8?B?ZC9MZ0FINXhxRzJtVk9tUlI3U0U4L280dS9ENGxvMUdiODZpZ2lqaXlTYTRp?=
 =?utf-8?B?MlAwekJmUTIzOThndmZ2U0F0NUVsSVk0U1dGWm5OTmtlRWljbGxnSWREQ0J2?=
 =?utf-8?B?ODdibGQxUCtrQkFUc21IbmhpdW54SWNtMjQzWEs3WWZhVGJvZ3lHVFZicFE0?=
 =?utf-8?B?SUJnRDJFem0yb3laTHFlYk9kTHdGRzIvbDAyY1BuK2tiYzVsSkh5STN2N01i?=
 =?utf-8?B?WFE5QnBNOVk4bEJwbzZyL014Vm0xOExFcDhOQTlGN25sYnFKT2J2TWt3KzhP?=
 =?utf-8?B?ZmpzRGxGWmRIVHlBek9oc1hkT3RvWVJod0tYOUYraVRpMWdMWFVwV2IxY3pu?=
 =?utf-8?B?RUNvU0YycWtqNGJMWlJRL29Sb1ZhVm9GRVJKcGh1YlJkRlRacWZXZk9lZFdI?=
 =?utf-8?B?NlFtcVphNkJOU3BnVFR0RTJScUl2cktKTkE3akpoMjFRUW5Za2t3eC9QY0xV?=
 =?utf-8?B?STBxaENCOTc5RmlZSVpsRlVZZUdMM1ZsaGtVd3laTTI2TlJMTXJpM3d0dDFu?=
 =?utf-8?B?aUxTYzc4YkYrWGZYS1MyZUx6RkxnWXI0RTRhSytTWTJtSXcvOW1QTjltN0hI?=
 =?utf-8?B?dEJMNzlLdjZtNVR0UlhPNzl0UnZmbTJOVTJJZTZzT0hKK09ZTlJPaFlsd3V2?=
 =?utf-8?B?QjMxTVBBdW9zTWs4Ky8vckFNTU5IQU4wTEYwSVlaTENSYUdCZzNsRkE4bnlv?=
 =?utf-8?B?UG5EaFJqazBpU3RJZnhYMUJnd0RjQURreU56d0kzUEdkdERxRDlpdlF3S3Na?=
 =?utf-8?B?V1VtWTdMcGkwRzRlTVNNQXJob2FIcFBEc0tCY1FLa1pycVI1Tmt2bUdLcHEv?=
 =?utf-8?B?UHFFOXYrNmlKUWJFdlpPaTg1dWJyeVN4dk4rT09rUXF2aWNqVGZ4b1dsMUly?=
 =?utf-8?B?T0ZxaFAwdWZpcjRueW9oWDNvb2xGS1BVcm1KRVlhTUVXbkc0UGNhczl6MTNT?=
 =?utf-8?Q?6TxGE+/CBFhA9xFwXNLwM+Kai?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2AD7EB9C8A1EC4486C3068AE541F8D4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb42ac2-be0c-4482-6066-08da6fcf7bcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 12:56:55.1782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zgl76qFGRvLUgtL3ezT9iknCoFHunMOsPzvI8cP/+H8jw23NzLQ+sDysYx7YTlcQ8ZidZfCEh9mG7D3I/Lp6tHEaHe6mttBU7nCSOfmHo+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6987

T24gMjYvMDcvMjAyMiAxNzowNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IExldCdzIHVzZSB0aGUg
ZXhpc3RpbmcgaW5saW5lIHdyYXBwZXIgaW5zdGVhZCBvZiByZXBlYXRpbmcgcmVzcGVjdGl2ZQ0K
PiBjb21tZW50YXJ5IGF0IGV2ZXJ5IHNpdGUuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

