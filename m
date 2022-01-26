Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B78449D34B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 21:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261100.451729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCoiW-0006Yc-Ch; Wed, 26 Jan 2022 20:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261100.451729; Wed, 26 Jan 2022 20:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCoiW-0006Wk-9F; Wed, 26 Jan 2022 20:16:32 +0000
Received: by outflank-mailman (input) for mailman id 261100;
 Wed, 26 Jan 2022 20:16:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCoiU-0006We-0i
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 20:16:30 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4686599-7ee4-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 21:16:26 +0100 (CET)
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
X-Inumbo-ID: d4686599-7ee4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643228186;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TjbYf3qr0mB4cdZhoonTYB0XlIapDqxwV8LmDv+frN8=;
  b=VZ10fUTnckIwDeoBjCVrPja+K8ZMpSTMEipN1qxF2/SkGwk6+xfAtOHu
   J97WuUK9G0CViMzyLuMdmjlrFr2Du8hSMW1siNa0bvyjDhT/+8sMP7z6O
   bHFQpnAXzeTc2Cn+b/gWT+YiZYBAry546+MlQoWazZ4BP3pfd6ULBC23s
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JJYnYkD4kUzyEG5qn0egiiGJAx9a2rSGOudfEja5LuPCy5tUytR8jwVGw1Y4gZr3B3baS0YoMU
 CoyhOK32VIqqjCfPYLWX9JUVrcCJfXYbUFeXYuXb/pQwjRAgl5zMVg1R2YGTltWml/q3XpJzfK
 sKx2sfsbjgsC+a6E6AI0PqFKft2OuGsiYwkfIa0KV3QIuhRgPlugfjaf1qPZ4PE903wZmCozJn
 pzivMn0q/+0x8mC14MDRBUaUorMppviIjTsi2dkL9rmyU4lFIT19YPARA1fbhmdJb58l5frPaY
 EpXFGSKu9PYIQ/SDuWtC4/bQ
X-SBRS: 5.2
X-MesageID: 62835356
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ni4Nw6pRZVHvj6sdSYy6igfg1OFeBmL0YhIvgKrLsJaIsI4StFCzt
 garIBmCOqyKY2T3fYgjO4ix/BkA65TTmtBhQQc5qS8xQSITpZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILnW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaafZh80I7HRoeUMdyEGKhp5P45t6qCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZBJMmc0MUqojxtnGw5NF7A/lcGU22jFUhMBpny8o/YZyj2GpOB2+Oe0a4eEEjCQfu1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PKK83u5nhhuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUAxy6V17fI/j+YF0w8EAd6b94Fn90pEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSKhRqjBNzAJrVkg
 JTis5LPhAzpJcrV/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bp1dImK3P
 BOO6Vw5CHpv0J2CN/4fj2WZUJxC8EQdPY69CqC8giRmP/CdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimkUjP+efANRa9FOdUWHPTP7tRxP7V/23oH
 yN3apHiJ+N3CrOuO0E6MOc7cDg3EJTMLcmm8pMMLr/afFMO9aNII6a5/I7NsrdNxsx9vuzJ4
 mu8Sglfzl/+jmfAMgKEdjZob7aHYHq1hShnVcD1FVr3iXUlf6i166ITK8k+cbU9rbQxxv9oV
 fgVPc6HB60XGDjA/j0ca7j7rZBjK0v31V7fYXL9bWhtZYNkSizI5sTgIlnl+h4RA3flrsA5u
 bChiF/WGMJRWwR4Ac/KQ/uz1Fft72MFked/UhKQcNlecUnh6qZwLCn1gqNlKs0AM0yblDCby
 xyXEVETouyU+90599zAhKalqYa1ErQhQhoGTjeDtbvvbHvU5Guux4NEQd2kRzGFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu6ARlL9UvQy6B
 hCG9tVAYOjbPcrkFBgaJRY/b/TF3vYRw2GA4fMwKUT8xSl24LvYDhkCY0jS0HRQfOlvLYco4
 eY9o8pHuQWwhy0jPsuCki0JpX+HKWYNUvl/u5wXaGMxZtHHFr2WjUTgNxLL
IronPort-HdrOrdr: A9a23:cPogaaAmH6XcOZTlHenH55DYdb4zR+YMi2TDtnoQdfU4SKGlfq
 OV/cjztyWatN95YhhJ8rq90cK7L080m6QY3bUs
X-IronPort-AV: E=Sophos;i="5.88,319,1635220800"; 
   d="scan'208";a="62835356"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPfv3Ja/wBMP+hKf2Axcy49PqN17Z5upuzYVhu3/RGvxdgKvUga+dPOY9dDA/kmNiEMoUd+9vt2vWMtT+oSuZuZpJAn2iUJ53uh3IoCuJaWgdpkqli4iAAvgxJ5yTE864cdbIW77I9F3ohy1dlW0fRJizW7Bw1uYzBn1ms2qm3LC0NLfz2UjCrYE1nPwTQLvGa9EfQ9jxGb68Pn3+xPgxvO7IhoOREqjhwJgq+aVx2diDLFNVc1cmofHu+uyfqIKt+cuAx887B9egrcTgtdIp9BKntpOSJJy9qhV0XDYsrqLDpFx5cvJD2YVlDAd4cx4pvTxuaHSMhmtu5TgQLVe6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjbYf3qr0mB4cdZhoonTYB0XlIapDqxwV8LmDv+frN8=;
 b=RVMMhNLlrFqfDXkfpQ4T6wMg/JSb7vM3LfL/s4QmD813LkDsSlxnRV5zhIGdFSO7NRh/mfgLEdVPTG4udmBK2vHwNvazDzwrxZXGCnrLPyKf/BY6VbOoEoXkYLGRQOVNuwsoazbKadPgnDD0/dGLQHfwNOSYn2tay/lgW437w/p3aUAqOfhj+Di+zaXFOoI9/YNU1t1gptBnnZyrtDCCz4LGU/dBD4nIVXIDWCm7zJ2iLQSIBUgKAL8NEUYw1c7cPEKGz2XWv9aH2V8L0FpKn7IQUZ2jrp2/jzHuE7cqNQj53jMn9kXhsUHcPKXH0AwVTawvO0tE3Yghv7rI1s/QEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TjbYf3qr0mB4cdZhoonTYB0XlIapDqxwV8LmDv+frN8=;
 b=TT9x6fTsqeiiZ5+2PWK1BqI/afr+V3XwWCFdy50xImwiF9D2QKWktST4QGcQUsIGtxHuByh0KQ1scaC3YsCjwnTMlA5p1rwjjQ6YMkBXpWQaacSH/VOMPUn/r+BRgE878VSUYmRA8qLl2AUHV/WNoRJKuCnqwIBAmVMK95QI5Zg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/8] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Thread-Topic: [PATCH 3/8] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Thread-Index: AQHYEpEQO22I/y1Di0S4u/YrCMvx5qx1hJwAgAA5Y4A=
Date: Wed, 26 Jan 2022 20:16:13 +0000
Message-ID: <e987b428-d617-ec8f-16f1-7fd32005f9f3@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-4-andrew.cooper3@citrix.com>
 <f5c1134a-f446-7031-877e-6a3177120de9@suse.com>
In-Reply-To: <f5c1134a-f446-7031-877e-6a3177120de9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08fbcc62-09a7-48b9-640d-08d9e108b39f
x-ms-traffictypediagnostic: SA0PR03MB5386:EE_
x-microsoft-antispam-prvs: <SA0PR03MB53864B0BA5A3933C7E6959A6BA209@SA0PR03MB5386.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QfTqqhvswLRTOpgCYbgfJKU5yeLUjA4wBSew3aiHBFyNMEhOTdKaNH8qalUGufCMzVVf+IjJSeDQnjORln9QUHDPIiF7FVVLBmjTmAXb+ySAWfvnFPO405O0IUMJxNtDTbZGqCgF3Jz01JKRIaGxE9P8zNZQtUbtimpKozvpdwPN5RIiAfl6CcU99Vv03VEZDnPICKBbFsoTWyqmslC98FkhfDMauOevf964cHViqIYMX6HgBRmTq9sXC5eTNSp9ArqbKwgauuKgtRS1PiDan+Uuh9CbV724Et7jzRRHsw1l/r1zZWQ/yf97Cn1g/w7znofTRWQu8NG1g+FmcI/Bdothj2CPaWlhcxZlcoZNxRC28Z6PvgY8rn+zaGmL2Uok/hzLz8PUbmK9FadAlIbMYVGGdGB2CwNOM1HuL74bp7kgiC68lggN4668evRpCsm+PobUj7tLwHhFwlPv7WLtb/5zE9/VMInTZnb7D+n9jnpxiw4ZeCeu1udjZWQ+7auZERmyA51C/WmsnKpPSN4p0y2MWotM0u6YObetCS3A9VTHTOHYRSZz2aHlPz1ehHedDI2w8goOvhA7khhJb8pOvDwesTWU0Nz8wfq4FXdwFaK+k115gaz/bo13zflsl3r+51uxqt3XmeMTbfhwq9x+0bKbqbyAcRcrLph8PHHY7FnTLzYyaKLqSwQNzzwuNW9rNx8Ayff5etleDVxUl/77W3wxer5LVATK8xF26Zc+RjIXNJT+aHqKSLwVqXPSVw14vxjKeXn36JqjI6jAoIkFkg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(6486002)(64756008)(38100700002)(66476007)(26005)(71200400001)(82960400001)(91956017)(66946007)(186003)(76116006)(66556008)(5660300002)(83380400001)(122000001)(54906003)(6916009)(4326008)(8676002)(31686004)(6512007)(31696002)(6506007)(316002)(2616005)(2906002)(508600001)(36756003)(38070700005)(53546011)(8936002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWFPNzZ6N2JNKzMzdTRKamNkNWhHRjJ5bmduaW9TdXR0dWlBbEtNQ3Q3Y0t3?=
 =?utf-8?B?RjRYOGdsSlpscjg4c0VqZUZudXl3K3NVamtYZzk2dU1wd0ZKRnduKzFBNllI?=
 =?utf-8?B?WW45akh6NkVwSmZaY2xVdW5tMy9HK2RGQnhoWkVoRGVRTVRlODhxdVFXWXNa?=
 =?utf-8?B?N2hJVzh3dUZUS1RpT3VKZGM2ellXMUZaSHRCVStlU3FON1RjQWJoN1U0OUo4?=
 =?utf-8?B?czFIUWJvTHR3dE1kYkRlL29oc1E3MGE4RmJReVh5ZGFPeTlxV2ZadldCSURS?=
 =?utf-8?B?Y09XT2pqaDBEZUhZNmpPdlo0cllsRytXWnoyazNTcHpURFc4THp6RVI0UUht?=
 =?utf-8?B?cDNLZ1VNOHZGQmJvdVJZRTQ3N0pOOGh6cUN6N2xkUG9oQ3FnK1ZzN041SkFZ?=
 =?utf-8?B?OUl4MHdlcFM5MXdWeUNnanloUFBHdm1SUTFPVHc4RE5rMkRrc2grampseE9N?=
 =?utf-8?B?eW9BZVI1NE43aytNT1FiVHE3cEpkcU1xRms5cTRnQm5SNWttTGZOSHZJMS9O?=
 =?utf-8?B?M3pZUlo4RzUxNitLRlpwZnRTcWt1RjZqanJpT1E5MjlreUR0eUdDZ0hRVENa?=
 =?utf-8?B?THZ3UE9WMFFjM1krS1JNWHFXN0dOVCtxcDdhUG5HeU9GZHVYQjhqVEUzTnEz?=
 =?utf-8?B?NjU0bjlTYzRjZVNaeXNIZGNZZDdnMks0WmVKZVh4WjdwR29ZMSt0elNsUmtj?=
 =?utf-8?B?dmJ6b1ZIeHdjWjFXUnRjbTQ4ZE9XK1hHMzN4aVBqcnA1ZEdLWi9Nd0RBYkJ2?=
 =?utf-8?B?Tm5DZ0YwTWJVcWM2STBsVDhPS3BJbjBLTjRZeWlaZ2hjTFo2dnpZWm0xT0ZB?=
 =?utf-8?B?Wk9DV1phdlZlU2dJZGVvbHhCaERPdlU1RTRPbzduczZwWXF3UW8rQnpkMzhD?=
 =?utf-8?B?NWtaa1piVmt4Q3Z5SVhPSWsxZFkweTdPb3ZCYnN4Njc0cFNuYzNwd3dnemt6?=
 =?utf-8?B?UFVKRFZPb3lTbzM0cmV5K2V5dmRCb01ibWxnTG5memw3cElCQjhnUEtvdnhj?=
 =?utf-8?B?ZHh3SkJmeWZWWk5DR1ZRelV2R2FqZEZsSUdPQXJuc2pUOFl3Z3N0L0pxdy8v?=
 =?utf-8?B?aHA4WG9lZWNNMGlmdTZZeTcwYWlSVFJZd2crMlFYb1RCNHFhV0RGR0tmNm8v?=
 =?utf-8?B?T1V0Z1NDQ0NibG04N05CNy9TbURhUDQzRVFIWTFRZVlNQ1A2ZWl5azZtMFc3?=
 =?utf-8?B?NHdMNENLRExsTWtQcHdZd3pMN1kxUGprRGxqR2d3WXJqM0NuUjc2Q0xaa0F0?=
 =?utf-8?B?ZVA2ODdNYlJZUW1XcmRzb28zOUFUVFRuS1RzeHRLQWRWZkRhTUl0dXpwTXlP?=
 =?utf-8?B?T01UNTdRT3pkb1RtdmtQVEJnUU5BaU5ObkYxZm1qQ2tPUDRwMjMvWHBZSy9k?=
 =?utf-8?B?RW00QzRxR2tibFhpYWkwR0E1NU5WUlVCM3JoTkNnelZCaEVMN0NjNDFPK3dr?=
 =?utf-8?B?dDVHTTFJUDl6c0tEbUkrSXFlbVZmVXA4MCs1aXZiTUJhczFlK2xhUU1mYXEr?=
 =?utf-8?B?WUZCMksrTG45SExWRkZxMEM5RFp1bzdEY0svbkthWnBxZVo2U29iQTRZWlp3?=
 =?utf-8?B?VHFPTmJiQlNpTzRKaGxzdGxNNzViUDhyVHFLVkJxMHhGOU44ZmxTZTRCTDBF?=
 =?utf-8?B?SDZhZFBpaEVFVWJVVEpCdlpwZE9nS2VhdVdsV2gzdnQ5aC9HRTJFUzY0cENN?=
 =?utf-8?B?TXF5TmcxelIxb01XK29sS1FkWDI4V2pZcmpmNjVwc2ZnTTZONmU4RHNSR3hs?=
 =?utf-8?B?ZVRaQ1Q0OEptNlFVazc0UE80WlVOYkZRVW1HOXQ4MW1ueGE3cTBlWGtaSUNP?=
 =?utf-8?B?UjdLcndHdnBUWHJsSjk1WTNvZWh0OXN2a3BnNis4Wjl6WFVmVmZVTVkwL0hy?=
 =?utf-8?B?aWcvSGNMUEZ5QXExcHZDWElLQVFIL09zK1hKRlZob2loZTV3TFl1eFVuNk5w?=
 =?utf-8?B?N1FHOFVja3Q1azBqQU5hL0tRS0p4clhwMEw0NzUwRUU5V3VPSzZUNHdvcUho?=
 =?utf-8?B?b2p3UFE3dTVENTRvUzBGSEpqcUhhZkJQbWc5anpSWFFGOUttMG15aTFiellr?=
 =?utf-8?B?NnZIdms5bnY3bktzTmlZUTk4MFhLWTVpWk1WZ2VhWmpteXNPOWpQY0Q2MitK?=
 =?utf-8?B?MzNTOE9LLzRna3hkOE8rYkFrUFhJWTFhbnNtNTdLQ0RPbTRna2JxS2dRaDBx?=
 =?utf-8?B?eHdyLytiVWxOL3JianliS3VBa3hCWWJQcW9VS1FLakwvWW16ejhlREkwSmlZ?=
 =?utf-8?B?TmNtZGpGMXprbjhxUlEyVGlCUTlRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6412A0432DD53949A1919228D2C11AD8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fbcc62-09a7-48b9-640d-08d9e108b39f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 20:16:13.7785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rbkQTBr1OKWXYu7dWBgY78kJDsG0oUqUTN6QBiCGypCrkW9NHOXHLvQcwVJDisRXHP06hZfTzWp88JKJ9yO+gFnvfWka61D9pKyX2Qdtcoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5386
X-OriginatorOrg: citrix.com

T24gMjYvMDEvMjAyMiAxNjo1MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI2LjAxLjIwMjIg
MDk6NDQsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiAxKSBJdCB3b3VsZCBiZSBzbGlnaHRseSBt
b3JlIGVmZmljaWVudCB0byBwYXNzIGN1cnIgYW5kIGNwdV9pbmZvIGludG8NCj4+ICAgIHZte2Vu
dHJ5LGV4aXR9X3NwZWNfY3RybCgpLCBidXQgc2V0dXAgb2Ygc3VjaCBzdGF0ZSBjYW4ndCBiZSBp
biB0aGUNCj4+ICAgIEFMVEVSTkFUSVZFIGJsb2NrIGJlY2F1c2UgdGhlbiB0aGUgY2FsbCBkaXNw
bGFjZW1lbnQgd29uJ3QgZ2V0IGZpeGVkIHVwLg0KPj4gICAgQWxsIHRoZSBhZGRpdGlvbmFsIGFj
Y2Vzc2VzIGFyZSBob3Qgb2ZmIHRoZSBzdGFjaywgc28gYWxtb3N0IGNlcnRhaW5seQ0KPj4gICAg
bmVnbGlnaWJsZSBjb21wYXJlZCB0byB0aGUgV1JNU1IuDQo+IFdoYXQncyB3cm9uZyB3aXRoIHVz
aW5nIHR3byBpbnN0YW5jZXMgb2YgQUxURVJOQVRJVkUsIG9uZSB0byBzZXR1cCB0aGUNCj4gY2Fs
bCBhcmd1bWVudHMgYW5kIHRoZSAybmQgZm9yIGp1c3QgdGhlIENBTEw/DQoNCkhtbQ0KDQpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vZW50cnkuUyBiL3hlbi9hcmNoL3g4Ni9odm0v
c3ZtL2VudHJ5LlMNCmluZGV4IGM3MTgzMjhhYzRjZi4uMWQ0YmU3ZTk3YWUyIDEwMDY0NA0KLS0t
IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vZW50cnkuUw0KKysrIGIveGVuL2FyY2gveDg2L2h2bS9z
dm0vZW50cnkuUw0KQEAgLTU5LDYgKzU5LDcgQEAgX19VTkxJS0VMWV9FTkQobnN2bV9oYXApDQrC
oA0KwqDCoMKgwqDCoMKgwqDCoCAvKiBXQVJOSU5HISBgcmV0YCwgYGNhbGwgKmAsIGBqbXAgKmAg
bm90IHNhZmUgYmV5b25kIHRoaXMgcG9pbnQuICovDQrCoMKgwqDCoMKgwqDCoMKgIC8qIFNQRUNf
Q1RSTF9FWElUX1RPX1NWTcKgwqDCoMKgwqDCoCBSZXE6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoA0KQ2xvYjogQ8KgwqAgKi8NCivCoMKgwqDCoMKg
wqDCoCBBTFRFUk5BVElWRSAiIiwgX19zdHJpbmdpZnkobW92ICVyYngsICVyZGk7IG1vdiAlcnNw
LCAlcnNpKSwNClg4Nl9GRUFUVVJFX1NDX01TUl9IVk0NCsKgwqDCoMKgwqDCoMKgwqAgQUxURVJO
QVRJVkUgIiIsIF9fc3RyaW5naWZ5KGNhbGwgdm1lbnRyeV9zcGVjX2N0cmwpLA0KWDg2X0ZFQVRV
UkVfU0NfTVNSX0hWTQ0KwqANCsKgwqDCoMKgwqDCoMKgwqAgcG9wwqAgJXIxNQ0KDQppcyBzb21l
d2hhdCBvZiBhIGxvbmcgbGluZSwgYnV0IGlzbid0IHRvbyB0ZXJyaWJsZS4NCg0KSSdtIHRlbXB0
ZWQgdG8gc3dpdGNoIGJhY2sgdG8gdXNpbmcgU1RSKCkgc2VlaW5nIGFzIHdlIGhhdmUgYm90aCBh
bmQgaXQNCmlzIG11Y2ggbW9yZSBjb25jaXNlLg0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9z
dm0vZW50cnkuUw0KPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vZW50cnkuUw0KPj4gQEAg
LTU1LDExICs1NSwxMSBAQCBfX1VOTElLRUxZX0VORChuc3ZtX2hhcCkNCj4+ICAgICAgICAgIG1v
diAgJXJzcCwgJXJkaQ0KPj4gICAgICAgICAgY2FsbCBzdm1fdm1lbnRlcl9oZWxwZXINCj4+ICAN
Cj4+IC0gICAgICAgIG1vdiBWQ1BVX2FyY2hfbXNycyglcmJ4KSwgJXJheA0KPj4gLSAgICAgICAg
bW92IFZDUFVNU1Jfc3BlY19jdHJsX3JhdyglcmF4KSwgJWVheA0KPj4gKyAgICAgICAgY2xnaQ0K
Pj4gIA0KPj4gICAgICAgICAgLyogV0FSTklORyEgYHJldGAsIGBjYWxsICpgLCBgam1wICpgIG5v
dCBzYWZlIGJleW9uZCB0aGlzIHBvaW50LiAqLw0KPj4gLSAgICAgICAgLyogU1BFQ19DVFJMX0VY
SVRfVE9fU1ZNICAgKG5vdGhpbmcgY3VycmVudGx5KSAqLw0KPj4gKyAgICAgICAgLyogU1BFQ19D
VFJMX0VYSVRfVE9fU1ZNICAgICAgIFJlcTogICAgICAgICAgICAgICAgICAgICAgICAgICBDbG9i
OiBDICAgKi8NCj4+ICsgICAgICAgIEFMVEVSTkFUSVZFICIiLCBfX3N0cmluZ2lmeShjYWxsIHZt
ZW50cnlfc3BlY19jdHJsKSwgWDg2X0ZFQVRVUkVfU0NfTVNSX0hWTQ0KPiBJIGd1ZXNzIHRoZSBu
ZXcgdXBwZXIgY2FzZSBDIGFmdGVyIENsb2I6IHN0YW5kcyBmb3IgImFsbCBjYWxsLWNsb2JiZXJl
ZA0KPiByZWdpc3RlcnMiPw0KDQpUaGF0IHdhcyB0aGUgaW50ZW50aW9uLCB5ZXMuDQoNCj4gIElu
IHdoaWNoIGNhc2UgLi4uDQo+DQo+PiBAQCAtODYsOCArODUsOSBAQCBfX1VOTElLRUxZX0VORChu
c3ZtX2hhcCkNCj4+ICANCj4+ICAgICAgICAgIEdFVF9DVVJSRU5UKGJ4KQ0KPj4gIA0KPj4gLSAg
ICAgICAgLyogU1BFQ19DVFJMX0VOVFJZX0ZST01fU1ZNICAgIFJlcTogYj1jdXJyICVyc3A9cmVn
cy9jcHVpbmZvLCBDbG9iOiBhYyAgKi8NCj4+ICsgICAgICAgIC8qIFNQRUNfQ1RSTF9FTlRSWV9G
Uk9NX1NWTSAgICBSZXE6ICAgICAgICAgICAgICAgICAgICAgICAgICAgQ2xvYjogYWMsQyAqLw0K
Pj4gICAgICAgICAgQUxURVJOQVRJVkUgIiIsIERPX09WRVJXUklURV9SU0IsIFg4Nl9GRUFUVVJF
X1NDX1JTQl9IVk0NCj4+ICsgICAgICAgIEFMVEVSTkFUSVZFICIiLCBfX3N0cmluZ2lmeShjYWxs
IHZtZXhpdF9zcGVjX2N0cmwpLCBYODZfRkVBVFVSRV9TQ19NU1JfSFZNDQo+IC4uLiB3aHkgdGhl
IGV4cGxpY2l0IGZ1cnRoZXIgImFjIiBoZXJlPyBJcyB0aGUgaW50ZW50aW9uIHRvIGFubm90YXRl
DQo+IGV2ZXJ5IGluZGl2aWR1YWwgQUxURVJOQVRJVkUgdGhpcyB3YXk/DQoNCkZhaXIgcG9pbnQu
wqAgSSdsbCBzd2l0Y2ggdG8ganVzdCBDLg0KDQpUaGUgY2xvYmJlcnMgYXJlIHJhdGhlciBtb3Jl
IGltcG9ydGFudCBmb3IgdGhlIFBWIHNpZGUgd2hlcmUgdGhlIGxvZ2ljDQpoYXMgbXVsdGlwbGUg
bGl2ZSB2YXJpYWJsZXMgYW5kIGl0J3Mgbm90IHRvdGFsbHkgb2J2aW91cyB0aGF0IGFsbCBHUFJz
DQphcmUgYXZhaWxhYmxlLg0KDQo+DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0u
Yw0KPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCj4+IEBAIC0zMDg2LDYgKzMw
ODYsMzYgQEAgdm9pZCBzdm1fdm1leGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJl
Z3MpDQo+PiAgICAgIHZtY2Jfc2V0X3ZpbnRyKHZtY2IsIGludHIpOw0KPj4gIH0NCj4+ICANCj4+
ICsvKiBDYWxsZWQgd2l0aCBHSUY9MC4gKi8NCj4+ICt2b2lkIHZtZXhpdF9zcGVjX2N0cmwodm9p
ZCkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBjcHVfaW5mbyAqaW5mbyA9IGdldF9jcHVfaW5mbygp
Ow0KPj4gKyAgICB1bnNpZ25lZCBpbnQgdmFsID0gaW5mby0+eGVuX3NwZWNfY3RybDsNCj4+ICsN
Cj4+ICsgICAgLyoNCj4+ICsgICAgICogV3JpdGUgdG8gTVNSX1NQRUNfQ1RSTCB1bmNvbmRpdGlv
bmFsbHksIGZvciB0aGUgUkFTWzozMl0gZmx1c2hpbmcgc2lkZQ0KPj4gKyAgICAgKiBlZmZlY3Qu
DQo+PiArICAgICAqLw0KPj4gKyAgICB3cm1zcihNU1JfU1BFQ19DVFJMLCB2YWwsIDApOw0KPj4g
KyAgICBpbmZvLT5sYXN0X3NwZWNfY3RybCA9IHZhbDsNCj4+ICt9DQo+PiArDQo+PiArLyogQ2Fs
bGVkIHdpdGggR0lGPTAuICovDQo+PiArdm9pZCB2bWVudHJ5X3NwZWNfY3RybCh2b2lkKQ0KPj4g
K3sNCj4+ICsgICAgc3RydWN0IGNwdV9pbmZvICppbmZvID0gZ2V0X2NwdV9pbmZvKCk7DQo+PiAr
ICAgIGNvbnN0IHN0cnVjdCB2Y3B1ICpjdXJyID0gY3VycmVudDsNCj4+ICsgICAgdW5zaWduZWQg
aW50IHZhbCA9IGN1cnItPmFyY2gubXNycy0+c3BlY19jdHJsLnJhdzsNCj4+ICsNCj4+ICsgICAg
aWYgKCB2YWwgIT0gaW5mby0+bGFzdF9zcGVjX2N0cmwgKQ0KPj4gKyAgICB7DQo+PiArICAgICAg
ICB3cm1zcihNU1JfU1BFQ19DVFJMLCB2YWwsIDApOw0KPj4gKyAgICAgICAgaW5mby0+bGFzdF9z
cGVjX2N0cmwgPSB2YWw7DQo+PiArICAgIH0NCj4gSXMgdGhpcyBjb3JyZWN0IGZvciB0aGUgdmVy
eSBmaXJzdCB1c2Ugb24gYSBDUFU/IGxhc3Rfc3BlY19jdHJsDQo+IHN0YXJ0cyBvdXQgYXMgemVy
byBhZmFpY3QsIGFuZCBoZW5jZSB0aGlzIHZlcnkgZmlyc3Qgd3JpdGUgd291bGQgYmUNCj4gc2tp
cHBlZCBpZiB0aGUgZ3Vlc3QgdmFsdWUgaXMgYWxzbyB6ZXJvICh3aGljaCBpdCB3aWxsIGJlIGZv
ciBhDQo+IHZDUFUgZmlyc3QgbGF1bmNoZWQpLCBldmVuIGlmIHdlIGhhdmUgYSBub24temVybyB2
YWx1ZSBpbiB0aGUgTVNSDQo+IGF0IHRoYXQgcG9pbnQuDQoNCklzaC4NCg0KV2UgaW50ZW50aW9u
YWxseSB3cml0ZSBNU1JfU1BFQ19DVFJMIG9uY2Ugb24gZWFjaCBDUFUgdG8gY2xlYXIgb3V0IGFu
eQ0KcHJldmlvdXMtZW52aXJvbm1lbnQgc2V0dGluZ3MsIGJ1dCB0aG9zZSBib290IHBhdGhzIG5l
ZWQgdG8gbGF0Y2gNCmxhc3Rfc3BlY19jdHJsIHRvbyBmb3IgdGhpcyB0byB3b3JrIGNvcnJlY3Rs
eS4NCg0KTWFraW5nIHRoaXMgc2FmZSBpcyBzbGlnaHRseSBuYXN0eS7CoCBJIHRoaW5rIHRoZSBi
ZXN0IG9wdGlvbiB3b3VsZCBiZSB0bw0KcmVvcmRlciB0aGlzIHBhdGNoIHRvIGJlIGFmdGVyIHRo
ZSBwYXRjaCA2LCBhbmQgdHdlYWsgdGhlIHdvcmRpbmcgaW4NCnBhdGNoIDYncyBjb21taXQgbWVz
c2FnZS7CoCBUaGF0IHdheSwgd2UncmUgbm90IGFkZGluZyBsYXRjaGluZyB0bw0KbGF0ZXItZHJv
cHBlZCBjb2RlcGF0aHMuDQoNCn5BbmRyZXcNCg==

