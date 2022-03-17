Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255BF4DCB7E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 17:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291680.495246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUt3G-0003uL-PW; Thu, 17 Mar 2022 16:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291680.495246; Thu, 17 Mar 2022 16:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUt3G-0003r9-Lq; Thu, 17 Mar 2022 16:32:38 +0000
Received: by outflank-mailman (input) for mailman id 291680;
 Thu, 17 Mar 2022 16:32:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hAZZ=T4=citrix.com=prvs=068f51ced=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUt3F-0003qz-M2
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 16:32:37 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5bc89a6-a60f-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 17:32:29 +0100 (CET)
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
X-Inumbo-ID: d5bc89a6-a60f-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647534755;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SGXdJ1Chgk6Q4jFtlmKlAGEb7fNnZXg7s9I74lR5Li0=;
  b=gwCPc2Rc2XuCvjtUS0Lbh7mpfFCGwFshQq513z0W0/BMrsWpTqkbNkE2
   dO+3evg+FbLFv1AzpVehrSk5ZFcs7y6E+UVN6L0BUPsk+c/lM1JOG7Coj
   mBAwPYmbhswOwCgk0bvpFxUumfdJERMygIaV2IdhYU5a2TfMbOy6iFgm8
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68892782
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GJfa2Kq30r7K85KmrkesoI+XBgVeBmIlZRIvgKrLsJaIsI4StFCzt
 garIBmFOfiPNGGjethxPYWz9UoBu5WEyYQwGlBpryhhQn5B+ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 Iyq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBD43PiudeQgtjAQZyGbwX2LT4JXmuvpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIxPESROUIfYD/7DroUguu3iCS8UQFXl1SyubQr3kHtx1V+he2F3N39JYXRGJQ9clyjj
 mfP5WHwGBwZHN2Z1zue83ioi/PPnCX0Q4YbHvuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYUO99aWX7iKgAjoyIUsTNA8Pcg8E8ta29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWB2TaD/LF7rlxBHkJPm6gKvFmSw28zbq45lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIYRPsUuLVXZpH4zDaJ144wLuBJw+U3YE
 c3HGftA8F5AUfg3pNZIb7p1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3mGmaZOfAtiBSVqWvjLRzl/K7frzvxOQzp6VZc8ANoJJuRYokiivryRr
 y/nBRMAlgaXaL+uAVziV02PoYjHBP5XhXk6ITYtLRCv3X0iapyo96ARa908erxPyQCp5aMco
 yUtEylYPslydw==
IronPort-HdrOrdr: A9a23:TNxw9qtTOWcdPo1ZsDUCMNFj7skDotV00zEX/kB9WHVpm5Sj5q
 eTdPRy73DJYUUqKRcdcLG7SdS9qBznhP1ICOUqUItKGTOW3FdAT7sSkbcKoQeQeREWn9Q1vc
 wLT0E9MqyUMbEQt6jHCXyDc+rIt+PnzEnHv4vjJjxWPHhXgulbnn9EIxfeGBZuXw9NCYAiGJ
 eb/cQvnUvbRZ04VLXBOkU4
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="68892782"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJK/YTrUEAw9UxBwPK7illeYYwZbj/VavazdNbrxBsPlDs/jEsMm7QMYS5ga7kKpFwB6bhYabDGj5jVkQTx7ptYzsZm9jCXfeUKYJFkUbt8VcqNByFOlYCizB6x/E8gSwW34lXGwTob/SztL9TzQRlOrcfMa4WQlvRG05Cx7ZLoAzO1fJ4zNbsqIQL0iLqVwt816nAsm95FUEspaMFO3wfP2HnXhfIrZDBZYwwaLQJioL+dOV5tc4nZta7MCYvLdLu9L0h+JD/LE4G0Yc/IA4oxfhykGPlZWbA/YJBJJrM1uQ3fPvqkSerPl22YSqn+R+FxqHoaxrKkOvm7IpMoxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGXdJ1Chgk6Q4jFtlmKlAGEb7fNnZXg7s9I74lR5Li0=;
 b=VdQGYJn5NKHz1cOEwGZK0k4XXkfcQZNrF9DTYhh5jCsDVtHAD6MqDum7q+msUhFn2Yp9kq9ZsUijz1wcmMknEtMAp5MxFfU9ROBF8kAugD6O3BVG5ODDYpBLp7ZRFP6Ki5laXa1wHmuj+dTN1whehq7nMdru/aHZwc65qbATnOE19p5UQ/pDagmH8ZSJ0TiuMu7RJQ/LwlRXwDxmkYpxYfGE+YU9sU87FJApIwaYyFrRRvFa8EVqFg/ixX7tom0+hDOcPbrwnNqEcVjhqcdVvP5p8F9oupjbTUX3qV+39H3O6Gt9oeFovQABQTKiVuRrIiiFhxHW8IQxq+wknC8ikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGXdJ1Chgk6Q4jFtlmKlAGEb7fNnZXg7s9I74lR5Li0=;
 b=Tj7gRpVrk7GGeoUlO1dhAtOrYeKOr8NrDSZqjEQtK6wcsZKT0iUTaNDqBevtHuy7XGcI9k75Y0qfC4oACM1v7rEojDDI4P7XdEZSZ1++LhAD6hVzHhy+rFp4XCN6+iNOELaSbD9g6jPp+thtL4dCykv5JWvKWMY68tpbgiKsaPw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cet: Remove writeable mapping of the BSPs shadow
 stack
Thread-Topic: [PATCH] x86/cet: Remove writeable mapping of the BSPs shadow
 stack
Thread-Index: AQHYOI1bRL6jiuzp4UWoineooRKJ46zBsAOAgAC1YICAAOkogIAAdcwAgAACp4CAAAEXgA==
Date: Thu, 17 Mar 2022 16:32:30 +0000
Message-ID: <fb5930fe-b6c4-f3da-5e97-ca180ed1fa38@citrix.com>
References: <20220315165340.32144-1-andrew.cooper3@citrix.com>
 <345b2f17-5fba-5dba-f7f5-c1634fc69a6e@suse.com>
 <101d1e70-51c7-036d-c5e2-fd382a2be7a8@citrix.com>
 <2adbd1dc-38f9-21b2-b38a-06835aa164d0@suse.com>
 <f6d2ce09-5a02-5e73-7232-5f0f79e8b39f@citrix.com>
 <34d1acf6-5d37-6be9-cf1d-33b1fcd504bc@suse.com>
In-Reply-To: <34d1acf6-5d37-6be9-cf1d-33b1fcd504bc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3afe1ecb-2dcb-4a5b-9ebe-08da0833bb3e
x-ms-traffictypediagnostic: DM6PR03MB5241:EE_
x-microsoft-antispam-prvs: <DM6PR03MB5241A55BB621C1E61B9F8F95BA129@DM6PR03MB5241.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j6sX6v9E17Fz6+hFhhjAMpQ3Obl9QzM9lsf7ze3zN38D3VwmkxFvfJJX02ad3EvLgOrv0SJjNMgDju3X+jSoQEj08Z5z86uAyk+onaWgKgjYXg5SJtdpVEW732R9I9+Jhify17KtkX8HFrLDGV6Ar4bTkcpnWg9+iZ24iWweSN1iMKXCw2kEmuM3b3tJ3MYd83MVUza2jWSLAFB/vyTWTZEctF00ywlBHRGz4Y+NGDXdGrhK54PNS6MfMPKRl+KWPeEjLjaIV1pVF6WYR5w5SddjvmlzKvAW7H5ab1R70+VYyEDU1v6nVzInev/H+u8tV7lU7SQwjqpZbgqN3TXeUUab1sQbPSjK6f540EWXLMCSjBr/t5fNVbFjjVSb/3mkWCpYEnt3toUJUBK7a8VFpE73AJSgNFaWC77Kr0ud8tpZ1fXlanWzTAV7itIWtG2zwbZKjhNEa+yEoTgNGwY+dBDM7Dw3EhBNHH9+Ha51ljimB8U2uyyfcZcu8quDKqxN4ABTFi+H3/wZhtwT3wTueHA9dq1nMnMFpecLQbtVV+jtEpY8SfRcEJRmILLpeOZYdHt905qmxng8pML7aghS5rahuyKKKMwHGMB1rsiJEVUZ2z8Q76B7zIs2QiApG77Bc76M4KNvD7uQdYURTd54SUFP4Muo7k4bADLv/x1Z/lqqwBFC2nqthgS6CSGG5ipCQdyYKKdG2C1tisJMncAQ78Saxwas6cvB62DXLzPWfhZo/bXOsPiA9SWFQ3+6lg50zZ91bOY5+ikK1gCgTCqTyg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(83380400001)(508600001)(82960400001)(122000001)(38100700002)(71200400001)(6512007)(5660300002)(6506007)(6486002)(53546011)(8936002)(316002)(2906002)(2616005)(38070700005)(26005)(54906003)(6916009)(186003)(91956017)(31696002)(31686004)(86362001)(76116006)(8676002)(66476007)(64756008)(66946007)(66556008)(66446008)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVhvcXdJdFhWV0hFYzd0YVpkbW13Y3JuUXNYcjZQOCsxb0Vac0NxQWhtblUz?=
 =?utf-8?B?TTFiNlhMeUVjTEowNU5RWUJRY0xidXRCaU1DU3pGYVhQaFUwazZUT3dTLzVy?=
 =?utf-8?B?NklDTW5xRzNZSyt3ZUsvbUlMc3I5V1ZFKzJSdXFMZjZNNDZVa3pTTHllM0Na?=
 =?utf-8?B?VDhvMUlVcVdHK1E2OXZqSGpuQ2hya1k3NEdRQ1ZiK1E2bUpsYXVTRkZmUHht?=
 =?utf-8?B?SEN1dWpZeDJIa29xQTAzSjR6SnZmQzl3L0wxaTU1VE1JcjF4ZE1iOTFmZEhH?=
 =?utf-8?B?WVVtQmZnZlFicHA2cFF3U2NuRHF0eFc2MjRYL0Z5TXNJSlkrVFcyRlhZOGxu?=
 =?utf-8?B?NmFZZ0hVamJYdkhwUzhqR1k2c3dyOERDd1l0andqWWpDK0NRanNwZC9tMHhO?=
 =?utf-8?B?U1Z6R1ZBTHpvZW51MGt6aGxUb3VqWWRkS2tpcVdZcmVRc3JLWWVWMFNFTVAz?=
 =?utf-8?B?dlZ0WCttc3VuOTBCQkFsTGhSZTZ5MmtobjdkeGxNWnZVRlBrRm03Z1BiZUUz?=
 =?utf-8?B?bmtaRi8xcjg3Q01UYXRlRWI1RFRCaVV4eWlLZkVnZWNDdzdvaGt6VElPeGFQ?=
 =?utf-8?B?aEJBL3ZodjR4azJhRXpEZTFpM0VpUjZaTVZOMzZtTXFodEwxRWk5WWF5M3N1?=
 =?utf-8?B?UGx0eGdpcXl1NjUxWlQ3cTlSd3FMREgwY3pFY0I0UDIybWlvb0Y3dWFKZ3dp?=
 =?utf-8?B?ckljSmpIdGRLK3RMMUNWYUVPSjBrSi9tUjRhZktIT1J6Z25GMTNkVzdpUDcx?=
 =?utf-8?B?U2RMYzUzcENUZGFYKzB4T001NGFzU0F2ay9kMysyMVNyN1d0ckR4bU5CdTJB?=
 =?utf-8?B?Z1pHdU5pRFU2am43T1BpeDF5czlQMlVXcTFvTWdQZGZ6bTByU2pvN1hWakww?=
 =?utf-8?B?K0ttWjNXVytOMlJ2WTJyR09ocHlaV1hZV1NTS25mZm5UMGNVM3pRNzVqWSt2?=
 =?utf-8?B?OE02RVRzYUdVdW5PYVlvQTEwVmlVR3kxckE2Z0w0NkEyMGFvT3lpcDNDM2NY?=
 =?utf-8?B?VXA4R2tJckViRmdjUWVxM3FsU284VnhnTmVqUGFoSXNKSzUyTGh5Q0xZVE1C?=
 =?utf-8?B?U2dQSlE1bVgwSnFmNUx6RTUrOTkxMmsyOG5xRy8yQ0JUY3hIeGR0YkRaN3NJ?=
 =?utf-8?B?S2xJeHlzTytzcFA0TjhyREliMEdDUk40UktqZEhjeFdJMCs1MUxaWmhhNm01?=
 =?utf-8?B?WXZkQXJ5akFnd2VmUWVKQmlxKzBWSFJ6alFVc2ZkazlnanQ3MUVQNXdGa2Zz?=
 =?utf-8?B?UmlST2NSSktreWUvR0p6YW1ZVWRoSVF4aCtidkRaeWZDVXYyTlNTWEVmUHhW?=
 =?utf-8?B?eHdkMTN1a050c1dtbzFlTWRUL2ZvUVZ2dzJSL3RJYmh6MDNyU1pMS0JDR1Bm?=
 =?utf-8?B?S0lMRjdEWmN5dHJLNWFETmIzbjJraVhWdUxwUm93NU9CQjg3SFNZNlZYOEpJ?=
 =?utf-8?B?QlB2VElnMnJXL05MUHFtNkFrODB4MzVqNDNkR3d3dS9ya1NGcDIvZXVWb2tV?=
 =?utf-8?B?eFhSRHExNno0cmNkaUljYWd1YStWVW9uSGI4OEg0QUNRWlF4OTZUc3Y2cE52?=
 =?utf-8?B?ZG5ZYXo3SU9zSnBLd1VKSkd2ajlKbEhsRm85MCtNaEw4ZFlhY284NWtaOEhn?=
 =?utf-8?B?K3lLOTdaajJrWlRiVWs5Rk92Wlk1Q3Bram5ySjFyNm94eE5DZGNlYXlLYnVu?=
 =?utf-8?B?SWE3cVdrSlE0OEZIZGtyK0pjMk9jYnhpdk1sU0xZVmtLdTZWYmVtVHlyQWhl?=
 =?utf-8?B?TXZodnZNTkUrZDVMRGJiQnlsdWMzVkZJWlVHWml6TDRMejR0SXV5SU00cG5L?=
 =?utf-8?B?bDBRTXV4VHEwSmhNV2trOEVSS0RTR2RKLzZzRWs4MDdLeC85MGZtNWFpUE91?=
 =?utf-8?B?djArK0F4d01KWnRsRGhtWnpDSlJST0NFUGpSWUNJcjdYTHlvVU55Ymd4SVR4?=
 =?utf-8?Q?C1E/zw4gtrAC+zNehYKsaB6/9Oxg08TC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <889E6C3189D5994387E91F841F5E81C0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afe1ecb-2dcb-4a5b-9ebe-08da0833bb3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 16:32:30.3362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h5K5GVj2LNV+Z059ttVfDgLlClV1iHMbJQPzGJTZyNNoirC+0k+Kxw8S7eDCto9ToXfRacPhkDyJOVB/6wRZxVAbA0DP3Lx0/Te3H5EBzuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5241
X-OriginatorOrg: citrix.com

T24gMTcvMDMvMjAyMiAxNjoyOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE3LjAzLjIwMjIg
MTc6MTksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxNy8wMy8yMDIyIDA5OjE3LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNi4wMy4yMDIyIDIwOjIzLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBPbiAxNi8wMy8yMDIyIDA4OjMzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+
IE9uIDE1LjAzLjIwMjIgMTc6NTMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4+Pj4gLS0tIGEv
eGVuL2FyY2gveDg2L3hlbi5sZHMuUw0KPj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRz
LlMNCj4+Pj4+PiBAQCAtMjE1LDggKzIxNSw5IEBAIFNFQ1RJT05TDQo+Pj4+Pj4gICAgfSBQSERS
KHRleHQpDQo+Pj4+Pj4gICAgREVDTF9TRUNUSU9OKC5pbml0LmRhdGEpIHsNCj4+Pj4+PiAgI2Vu
ZGlmDQo+Pj4+Pj4gKyAgICAgICAuID0gQUxJR04oU1RBQ0tfU0laRSk7DQo+Pj4+Pj4gKyAgICAg
ICAqKC5pbml0LmJzcy5zdGFja19hbGlnbmVkKQ0KPj4+Pj4gTm8gcmVhbCBuZWVkIGZvciB0aGUg
QUxJR04oKSBoZXJlIC0gaXQncyB0aGUgY29udHJpYnV0aW9ucyB0byB0aGUNCj4+Pj4+IHNlY3Rp
b24gd2hpY2ggb3VnaHQgdG8gY29tZSB3aXRoIHByb3BlciBhbGlnbm1lbnQuIEltbyBBTElHTigp
DQo+Pj4+PiBzaG91bGQgb25seSBldmVyIGJlIHRoZXJlIGFoZWFkIG9mIGEgc3ltYm9sIGRlZmlu
aXRpb24sIGFzIG90aGVyd2lzZQ0KPj4+Pj4gdGhlIHN5bWJvbCBtaWdodCBub3QgbWFyayB3aGF0
IGl0IGlzIGludGVuZGVkIHRvIG1hcmsgZHVlIHRvIHBhZGRpbmcNCj4+Pj4+IHdoaWNoIG1pZ2h0
IGJlIGluc2VydGVkLiBTZWUgYWxzbyAwMWZlNGRhNjI0M2IgKCJ4ODY6IGZvcmNlIHN1aXRhYmxl
DQo+Pj4+PiBhbGlnbm1lbnQgaW4gc291cmNlcyByYXRoZXIgdGhhbiBpbiBsaW5rZXIgc2NyaXB0
IikuDQo+Pj4+Pg0KPj4+Pj4gUmVhbGx5IHdlIHNob3VsZCBjb25zaWRlciB1c2luZw0KPj4+Pj4N
Cj4+Pj4+ICAgICAqKFNPUlRfQllfQUxJR05NRU5UKC5pbml0LmRhdGEgLmluaXQuZGF0YS4qIC5p
bml0LmJzcy4qKSkNCj4+Pj4+DQo+Pj4+PiBXaGlsZSBJIGNhbiBzZWUgeW91ciBwb2ludCBhZ2Fp
bnN0IGZvcmNpbmcgc29ydGluZyBieSBhbGlnbm1lbnQNCj4+Pj4+IGdsb2JhbGx5LCB0aGlzIHZl
cnkgYXJndW1lbnQgZG9lc24ndCBhcHBseSBoZXJlIChhdCBsZWFzdCB1bnRpbA0KPj4+Pj4gdGhl
cmUgYXBwZWFyZWQgYSB3YXkgZm9yIHRoZSBzZWN0aW9uIGF0dHJpYnV0ZSBhbmQgLWZkYXRhLXNl
Y3Rpb25zDQo+Pj4+PiB0byBhY3R1YWxseSBpbnRlcmFjdCwgc3VjaCB0aGF0IC5pbml0LiogY291
bGQgYWxzbyBiZWNvbWUgcGVyLQ0KPj4+Pj4gZnVuY3Rpb24vb2JqZWN0KS4NCj4+Pj4+DQo+Pj4+
PiBUaGVuIGFnYWluIC0gdGhpcyBibG9jayBvZiB6ZXJvZXMgZG9lc24ndCBuZWVkIHRvIG9jY3Vw
eSBzcGFjZSBpbg0KPj4+Pj4gdGhlIGJpbmFyeS4NCj4+Pj4gSXQgYWxyZWFkeSBvY2N1cGllcyBz
cGFjZSwgYmVjYXVzZSBvZiBta2VsZjMyLg0KPj4+IEhtbSwgeWVzLCBhbmQgbm90IGp1c3QgYmVj
YXVzZSBvZiBta2VsZjMyOiBTaW5jZSB3ZSBtdW5nZSBldmVyeXRoaW5nDQo+Pj4gaW4gYSBzaW5n
bGUgUFRfTE9BRCBzZWdtZW50IGluIHRoZSBsaW5rZXIgc2NyaXB0LCBhbGwgb2YgLmluaXQuKg0K
Pj4+IG5lY2Vzc2FyaWx5IGhhcyBzcGFjZSBhbGxvY2F0ZWQuDQo+Pj4NCj4+Pj4+ICBJdCBjb3Vs
ZCB2ZXJ5IHdlbGwgbGl2ZSBpbiBhIEBub2JpdHMgLmluaXQuYnNzIGluIHRoZQ0KPj4+Pj4gZmlu
YWwgRUxGIGJpbmFyeS4gQnV0IHNhZGx5IHRoZSBzZWN0aW9uIGlzbid0IEBub2JpdHMgaW4gdGhl
IG9iamVjdA0KPj4+Pj4gZmlsZSwgYW5kIHdpdGggdGhhdCB0aGVyZSB3b3VsZCBuZWVkIHRvIGJl
IGEgd2F5IHRvIG1ha2UgdGhlIGxpbmtlcg0KPj4+Pj4gY29udmVydCBpdCB0byBAbm9iaXRzIChh
bmQgSSdtIHVuYXdhcmUgb2Ygc3VjaCkuIFdoYXQgd291bGQgd29yayBpcw0KPj4+Pj4gbmFtaW5n
IHRoZSBzZWN0aW9uIC5ic3MuaW5pdC5zdGFja19hbGlnbmVkIChvciBlLmcuDQo+Pj4+PiAuYnNz
Li5pbml0LnN0YWNrX2FsaWduZWQgdG8gbWFrZSBpdCBlYXNpZXIgdG8gc2VwYXJhdGUgaXQgZnJv
bQ0KPj4+Pj4gLmJzcy4qIGluIHRoZSBsaW5rZXIgc2NyaXB0KSAtIHRoYXQnbGwgbWFrZSBnY2Mg
bWFyayBpdCBAbm9iaXRzLg0KPj4+PiBMaXZpbmcgaW4gLmJzcyB3b3VsZCBwcmV2ZW50IGl0IGZy
b20gYmVpbmcgcmVjbGFpbWVkLsKgIFdlJ3ZlIGdvdCBzZXZlcmFsDQo+Pj4+IG5hc3R5IGJ1Z3Mg
ZnJvbSBzaG9vdGluZyBob2xlcyBpbiB0aGUgWGVuIGltYWdlLCBhbmQgdG9vIG1hbnkgc3BlY2lh
bA0KPj4+PiBjYXNlcyBhbHJlYWR5Lg0KPj4+IEkgZGlkbid0IHN1Z2dlc3QgdG8gcHV0IGl0IGlu
IC5ic3M7IHRoZSBzdWdnZXN0ZWQgbmFtZSB3YXMgbWVyZWx5IHNvDQo+Pj4gdGhhdCBnY2Mgd291
bGQgbWFyayB0aGUgc2VjdGlvbiBAbm9iaXRzIGFuZCB3ZSBjb3VsZCBleGNsdWRlIHRoZQ0KPj4+
IHNlY3Rpb24gZnJvbSB3aGF0IG1ha2VzIGluIGludG8gLmJzcyBpbiB0aGUgZmluYWwgaW1hZ2Ug
aW5kZXBlbmRlbnQNCj4+PiBvZiAuaW5pdC4qIHZzIC5ic3MuKiBvcmRlcmluZyBpbiB0aGUgbGlu
a2VyIHNjcmlwdC4gQnV0IGFueXdheSAtIHdpdGgNCj4+PiB0aGUgYWJvdmUgdGhpcyBhc3BlY3Qg
aXMgbm93IG1vb3QgYW55d2F5Lg0KPj4gU28gY2FuIEkgdGFrZSB0aGlzIGFzIGFuIGFjayB3aXRo
IHRoZSAuaW5pdCB0eXBvIGZpeGVkPw0KPiBSLWIsIHllcywgYXMgbG9uZyBhcyB0aGUgQUxJR04o
U1RBQ0tfU0laRSkgaXMgYWxzbyBkcm9wcGVkIGFuZCB0aGUNCj4gb3RoZXIgQUxJR04oKSBpcyBy
ZXRhaW5lZCAodGhlIGxhdHRlciB5b3UgZGlkIGFscmVhZHkgaW5kaWNhdGUgeW91DQo+IHdvdWxk
IGRvKS4NCg0KQWggeWVzLsKgIFRoYW5rcy4NCg0KfkFuZHJldw0K

