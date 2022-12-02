Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68717640781
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 14:10:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451968.709770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p15nz-0002tc-2Z; Fri, 02 Dec 2022 13:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451968.709770; Fri, 02 Dec 2022 13:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p15ny-0002qY-VS; Fri, 02 Dec 2022 13:10:14 +0000
Received: by outflank-mailman (input) for mailman id 451968;
 Fri, 02 Dec 2022 13:10:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pbEw=4A=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1p15nx-0002pd-PF
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 13:10:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6e6a6ed-7242-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 14:10:11 +0100 (CET)
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB5966.eurprd08.prod.outlook.com (2603:10a6:102:ee::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 13:09:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5880.008; Fri, 2 Dec 2022
 13:09:42 +0000
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
X-Inumbo-ID: a6e6a6ed-7242-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRHC+NlTZjUkbk0Nzp8Yjbg8dQd6vbMdfLFHYyFhmF/d7D+BTOFaEfPavSSEM4ZP6VfkaHTCnxyFn9Dh7grWZFjg4Iq1NFtGimqgBep7CRqGF+k/4inovixBk7kkoHyIJKaBbvisiudYBto/4I5Z/22QWqayhfUo7kdrUUC47muSL0lcOWjICsf8tu4LZ0YBhTPdF1YkOyrs669lownFn48l9vASnS/+OcgIKPc/CzrcE5yvpLubQfssVBSsGxjgykpY1ZaSUvzXj9GTdfh3EuXXYJNI4MC1etLaU26oGaVw2IT/SLQHSoVPKvWVFpCOLrCOdghimnLu42u8iC8dDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSPYDTL9Z7qKEwIBGGIqNGW++lPeTNR8PmK7I4zYk3E=;
 b=B08tKjSQkR9OOs+qweQ8zg6Cw0giywNsSl4L4CEcrLPydk2S5PqeEAeVIkbX51bxK7dalyxytpPjykUeMf7b/l0QNPjhLyT59Faw8VK+1euE90/brzQ5FTR7hZZ7m7gNtG58bMLBksgWjVMePgVvAt2lPNz85SNh9ptSCdTHZyy2hC9+UQqM8nvLT1Lc26Qh3kao34tfOAKeONznXxrXeriKVNGxf0c32TK9y1Dca9MAOl3h8rHHXZtTD0/dYPaNMgHvJ2DptOtlk77xqfAI21ysH4TFt0IIJnQKhfdvWXZPEVP+4O6ES7cWW6FEZFUeOXiV7NE/phui1b9z59kpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSPYDTL9Z7qKEwIBGGIqNGW++lPeTNR8PmK7I4zYk3E=;
 b=INxYyhmB1P/cqEGE5IXOWHpMyStS4fmcYj0vq89U95c3w+ELjCCGeolsWKOHD/7bTYMPJrGZ+0sGVFkAP09iutQuoSbMiFIrPqrBAoQUNricNC9I8rdZXsStcgrMkmGvQ9Qw9PfqKtnliTQDgg5IMXwcfRNFTlePBBcJG9hc5J0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 2/4] xen/scripts: add cppcheck tool to the xen-analysis.py
 script
Thread-Topic: [PATCH 2/4] xen/scripts: add cppcheck tool to the
 xen-analysis.py script
Thread-Index:
 AQHZAzNLrQ+cdSzeJ02hq/RTLwHjha5WqVKAgAC2sICAAI2ugIABQKAAgABQ4YCAARkTgA==
Date: Fri, 2 Dec 2022 13:09:42 +0000
Message-ID: <3C1C5FC8-8AFB-4E21-B47F-1BE4EDBD0670@arm.com>
References: <20221128141006.8719-1-luca.fancellu@arm.com>
 <20221128141006.8719-3-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2211291607280.4039@ubuntu-linux-20-04-desktop>
 <CD8C2F1A-B321-4E3D-907C-E6DBB1A5E2CD@arm.com>
 <alpine.DEB.2.22.394.2211301145132.4039@ubuntu-linux-20-04-desktop>
 <A3204E48-FF22-4275-961C-690F57A8AAEE@arm.com>
 <alpine.DEB.2.22.394.2212011210120.4039@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2212011210120.4039@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB3749:EE_|PA4PR08MB5966:EE_
x-ms-office365-filtering-correlation-id: 68bc5f7c-921c-4897-de3f-08dad46679ca
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LGH9QBczzByMPQNTiK0pJLOHGnzHucs5fG/1mhw5YukNu+t0nTpe2TjGBWYsdKZ41JSBr1hy5Cd5kqbnNyw3VIn/tTt/0qSEanZBvBOkFcsIli+72aB4jkocU89LZbVAvcVYAuqupnNeiDvAjPt1X7YmBlwAWDvwXRs8nDwrrvY+o3pd350+oocbpO9vF8dmZOhkFI3PRuBTq//rzVr0JvI5IYuzUt4jpuJx3lx12QMNNnbY+BiDcOaM8u+FP7VgIrBQZnX1hzMkvKXKlCOokMSWmkdRN51dn2FrWzJ8BX7MQNjFKV2MnUVMEWOmxlCT2SlLXPT5dtpjUIc+JO/Ma4I64K/sMEMubb9nK4Jz5tI+oy1YpQPxtx0Qine/vhRlOydn1wgCfl0wYatOpXm3nJnZ+kSOWR148fXC5Mh4FcnVp4D9eBaTwguK6kjBS3w3GZ3g6gxCue4dNmjckpLDrNUgoZ9h53wHZ3WcgBFn+pcakstCakUeEzkHlTJQZOgLBAcx+rjPAMUf/gr/wBr3PkKJgYyKQEQcF7ebKmkf1jLKso2MRdKDe07u/bX3TkIvT2WLFkx2WGhBsLlnfkuzU6EgcwZbwyyyVpwmtXff6UfRSJ1kSSycmDb9gkLWSBLFjFgM+hZaKKFruP1q+XD4Wzt6cCjJsxVowVD1kPB5pE7BYpvYqp6c5T1bdQ6SB9SPurAcLjpilBo5oNVft2PDw7rHANCqOEhg6dqkD0xfGWQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199015)(186003)(2616005)(2906002)(33656002)(66946007)(91956017)(38100700002)(66446008)(66476007)(8676002)(64756008)(41300700001)(76116006)(6506007)(36756003)(53546011)(66556008)(71200400001)(478600001)(26005)(122000001)(6486002)(5660300002)(6512007)(316002)(86362001)(6916009)(38070700005)(8936002)(54906003)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NzllL0dPbWxTY2RaeGpDcXU1RDM3cGNKbm9vWURySmhLdUN4dGVGdDIzWlZB?=
 =?utf-8?B?TWpJZnRubEt6eG9kUWVtc3ZqT2w3dFQ2dFpVbWpQVFBHdzZ4aVR0N0xENXlw?=
 =?utf-8?B?c3JGdGZzazhrdmdiajR3aXhaL0lNVXJNVmZ6ZHZZaktWR1RxS1I1a3Nwc1RW?=
 =?utf-8?B?SjZzcXZOV04rb0htVzFBNFRYMTlYREdCb3dhWTVFWHhhQllUQXZ3V1doRjZB?=
 =?utf-8?B?ckEwT3hQUFFPMGtQc0JpcXkwU1dMd0psR2RyM0p3L204TEVJOUNhUDZqaGtS?=
 =?utf-8?B?ckxXTys2a29TNk1XNldoRURqaThleFVqSGJZSnJycFdqWnlwUE5vSkx2V1Nm?=
 =?utf-8?B?SmhXVEt4bHdCNlVrMERTNlpBMTEwNHVQT05RdEZETzBKWnpxYXo0b1NpVGll?=
 =?utf-8?B?ckRXMjJMU2RVeS9IMUZXR2JhY1YwdHc1R3phV0pJUjRZYm1yNFd1VzMwcXRu?=
 =?utf-8?B?UDVWL3QyRTdTWnRkQndHa3cyT0lMQ2Ivamk2cWJ4S2ZFZmdNaDBXSkltR25F?=
 =?utf-8?B?MkJDVFBnRnN6MUg1K0VtWWh2VldpR2wvU2xYSmI4eDA3YnU4UjhyeGxwekgy?=
 =?utf-8?B?WHVub3B0WDBTVm1VL0xIQS9PYU5adGYrMklrR0YwUjRyNk5mRDFyQzZYVVBi?=
 =?utf-8?B?blNQN3JXU21ibk4veDB6dS9aRUtLcENKbGxQdFBRUDFkSDlEdXBWbGNtYTBo?=
 =?utf-8?B?Q1h3dWc1bGhTL2VRNDYzYjRPTmZGR1VBRkhYeFppMUxiWStCNit6TEl6NHp4?=
 =?utf-8?B?QzVBajMvdWFPamE4R0QvUlBFS1pzS2Q5bFpmNkpWVldiNFF4dklTT1FRU1lo?=
 =?utf-8?B?SjRPRWUxQnZTdnlnM1lkTHUwQ1QwYnhuend3bGtPazdOd2hkQjUweEZiNWd6?=
 =?utf-8?B?R2JZOWJZRkhGclFCdmlFNHB4NVY4Nit2R0RFZE4rQm9JbWM1REUwUzc2NTdz?=
 =?utf-8?B?Z0YxRnhjZXFPTllRM1RLdFZKTFF0ZWN6WCtmVlIyZnVtSGdubmJET3pxSVZt?=
 =?utf-8?B?SnhiWlZRdHBlR0FTakM4VXcvcVJQMmlIMW1ZT2VaSk9RbmVSMzBwTnNPbmoz?=
 =?utf-8?B?SlNVeG5uV2sxeHV1MUNCL08yMEdXVmx0aWFaTEkrWnYwMTl4ZklEQjNLSEVD?=
 =?utf-8?B?MTlRZmVtVk9zK0JkWEVWdVFoelVSMFlzRzZtUHZHRTJNdmp3VEtXazBYUGNH?=
 =?utf-8?B?LzU1aVc3UjZLSi9DaWszaUdTQmU5UVZhK3hpWjlXbTBYNlRKY0xtZFdDMWEr?=
 =?utf-8?B?cHIvZGV4dEhrKzJiOEpBeGgxNmV1MkNsdGxac2llVlYxczREVWJ6eWlwYjJO?=
 =?utf-8?B?OE1Fd3ZxUjMyVHFEYi9rekw0NzJDb1F0MGpIMWIrYm4vVktReWdENXJWRi90?=
 =?utf-8?B?S09xRFhacVF1am90UU5kNHQrREltYTAzODltSkhkSXBMOXlzUW81SUxXSmpX?=
 =?utf-8?B?UlNMeTl6V3lnbENKTmZKS2RORGhWODlYUHRUR1V3L1doRGRWeVV3MTNFMk5t?=
 =?utf-8?B?Tk5GZldTZE14Sk03ZXpkSkFnTFpQWWJkMHJLQlBOaFZ5a1lTTU1ZcmxKMXly?=
 =?utf-8?B?d0VheG5NMXYybytKL2o1R2lFU2cxN0xPZjl3d25ZeURNTDNNK1dZNUJwejNt?=
 =?utf-8?B?VkE0U2JnTnBTUHNaU1dWNG9QbDNkZ0w5R1hiZ05Dd3ZBTlkwTDZCbzN1bzdl?=
 =?utf-8?B?U2VLN0Mrd0xyWkpCYWxraGdPZUJSWWtaSmZkK1FWTG1YV0Nua2dyclBDbVN5?=
 =?utf-8?B?S09CaHE1V25tNWhnK2xMWTJuZnVoYUIzaEdLcktnQm1BSWduSS9mbUMvOXgv?=
 =?utf-8?B?SlI0OGlLNUsyT21uMm04Y0JXUXZSMGVRZlp6RGZ0YmptOGRnTGFlTkU2RG1X?=
 =?utf-8?B?anN6OHJSOVNNU1hoYm5WMHdHc0VmUzV3aE9JcU96RTRZSXVQSFJKQjBzckpl?=
 =?utf-8?B?K0N2aXNFN0piK3BaZE5FTnQ3RjJxN2pLSUY1VW1EMVp3VnNzbmZyMVIxUEpu?=
 =?utf-8?B?YTBHVTlaUDZZVDZmN0lnTytUdW5WZjdCV1BLNTFzUytINzl6LzNPbFZsZHl6?=
 =?utf-8?B?NlJpVnlsYVoxKzFTQ3BmWENxKzlQOE9PSzk1aXVsaEdETzhlMDllWi8vVzZU?=
 =?utf-8?B?cEN2YVdkT3pGN2poeHNtVVUrZWwxNEhTYi9kMFAxTEllYktjRjFmenF3S2NU?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1573D707B970AF479EB0E47027EC4248@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3749.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68bc5f7c-921c-4897-de3f-08dad46679ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 13:09:42.0812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3J3ZxYKcnYD5os1w9rTRNzdt46g7XwsVGTAVD6MldKeVMvyQYhD4lGWEXwR1OA9W34YPELdDug8rvz3zvxUdfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5966

DQoNCj4gT24gMSBEZWMgMjAyMiwgYXQgMjA6MjMsIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIDEgRGVjIDIwMjIsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+PiBIaSBTdGVmYW5vLA0KPj4gDQo+Pj4+PiANCj4+Pj4+IA0KPj4+
Pj4+ICsgICAgICAgICAgICBzbV90b29sX2FyZ3M9Im4iDQo+Pj4+Pj4gKyAgICAgICAgICAgIDs7
DQo+Pj4+Pj4gKyAgICAgICAgLS1jcHBjaGVjay1jbWQ9KikNCj4+Pj4+PiArICAgICAgICAgICAg
Q1BQQ0hFQ0tfVE9PTD0iJChldmFsIGVjaG8gIiR7T1BUSU9OIyo9fSIpIg0KPj4+Pj4+ICsgICAg
ICAgICAgICBzbV90b29sX2FyZ3M9InkiDQo+Pj4+Pj4gKyAgICAgICAgICAgIDs7DQo+Pj4+Pj4g
KyAgICAgICAgLS1jcHBjaGVjay1odG1sKQ0KPj4+Pj4+ICsgICAgICAgICAgICBDUFBDSEVDS19I
VE1MPSJ5Ig0KPj4+Pj4+ICsgICAgICAgICAgICBzbV90b29sX2FyZ3M9Im4iDQo+Pj4+Pj4gKyAg
ICAgICAgICAgIDs7DQo+Pj4+Pj4gKyAgICAgICAgLS1jcHBjaGVjay1wbGF0PSopDQo+Pj4+Pj4g
KyAgICAgICAgICAgIENQUENIRUNLX1BMQVRfUEFUSD0iJChldmFsIGVjaG8gIiR7T1BUSU9OIyo9
fSIpIg0KPj4+Pj4+ICsgICAgICAgICAgICBzbV90b29sX2FyZ3M9Im4iDQo+Pj4+Pj4gKyAgICAg
ICAgICAgIDs7DQo+Pj4+Pj4gKyAgICAgICAgLS1pZ25vcmUtcGF0aD0qKQ0KPj4+Pj4+ICsgICAg
ICAgICAgICBJR05PUkVfUEFUSF9MSVNUPSIke0lHTk9SRV9QQVRIX0xJU1R9ICQoZXZhbCBlY2hv
ICIke09QVElPTiMqPX0iKSINCj4+Pj4+PiArICAgICAgICAgICAgc21fdG9vbF9hcmdzPSJuIg0K
Pj4+Pj4+ICsgICAgICAgICAgICA7Ow0KPj4+Pj4+ICsgICAgICAgIC0tKQ0KPj4+Pj4+ICsgICAg
ICAgICAgICBmb3J3YXJkX3RvX2NjPSJ5Ig0KPj4+Pj4+ICsgICAgICAgICAgICBzbV90b29sX2Fy
Z3M9Im4iDQo+Pj4+Pj4gKyAgICAgICAgICAgIDs7DQo+Pj4+Pj4gKyAgICAgICAgKikNCj4+Pj4+
PiArICAgICAgICAgICAgaWYgWyAiJHtzbV90b29sX2FyZ3N9IiA9ICJ5IiBdOyB0aGVuDQo+Pj4+
Pj4gKyAgICAgICAgICAgICAgICBDUFBDSEVDS19UT09MX0FSR1M9IiR7Q1BQQ0hFQ0tfVE9PTF9B
UkdTfSAke09QVElPTn0iDQo+Pj4+Pj4gKyAgICAgICAgICAgIGVsc2UNCj4+Pj4+PiArICAgICAg
ICAgICAgICAgIGVjaG8gIkludmFsaWQgb3B0aW9uICR7T1BUSU9OfSINCj4+Pj4+PiArICAgICAg
ICAgICAgICAgIGV4aXQgMQ0KPj4+Pj4gDQo+Pj4+PiBJdCBkb2Vzbid0IGxvb2sgbGlrZSBzbV90
b29sX2FyZ3MgaXMgcmVhbGx5IG5lZWRlZD8gSXQgaXMgb25seSBzZXQgdG8NCj4+Pj4+ICd5JyBp
biB0aGUgY2FzZSBvZiAtLWNwcGNoZWNrLWNtZCwgYW5kIGluIHRoYXQgY2FzZSB3ZSBhbHNvIHNl
dA0KPj4+Pj4gQ1BQQ0hFQ0tfVE9PTC4gQ1BQQ0hFQ0tfVE9PTCBpcyB0aGUgdmFyaWFibGUgdXNl
ZCBiZWxvdy4gQW0gSSBtaXNzaW5nDQo+Pj4+PiBzb21ldGhpbmc/DQo+Pj4+IA0KPj4+PiBXZSB1
c2Ugc21fdG9vbF9hcmdzIHRvIGZpbGwgQ1BQQ0hFQ0tfVE9PTF9BUkdTLCBiYXNpY2FsbHkgaXTi
gJlzIGEgc3RhdGUgbWFjaGluZSB3aGVyZQ0KPj4+PiB3aGVuIHdlIGZpbmQgLS1jcHBjaGVjay1j
bWQ9PHh4eD4gd2UgZXhwZWN0IHRoYXQgZXZlcnkgb3RoZXIgc3BhY2Ugc2VwYXJhdGVkIGFyZ3Vt
ZW50cw0KPj4+PiBwYXNzZWQgYWZ0ZXJ3YXJkcyBhcmUgdGhlIGFyZ3MgZm9yIGNwcGNoZWNrLCBz
byB3ZSBhcHBlbmQgdG8gQ1BQQ0hFQ0tfVE9PTF9BUkdTDQo+Pj4+IHVudGlsIHdlIGZpbmQgYW4g
YXJndW1lbnQgdGhhdCBpcyBzdXBwb3NlZCB0byBiZSBvbmx5IGZvciB0aGlzIHNjcmlwdC4NCj4+
PiANCj4+PiBUaGF0IHNlZW1zIGEgYml0IHVubmVjZXNzYXJ5OiBpZiB0aGUgdXNlciB3YW50cyB0
byBwYXNzIGFyZ3VtZW50cyB0bw0KPj4+IGNwcGNoZWNrLCB0aGUgdXNlciB3b3VsZCBkbyAtLWNw
cGNoZWNrLWNtZD0iY3BwY2hlY2sgYXJnMSBhcmcyIiB3aXRoICIiDQo+Pj4gcXVvdGVzLiBEb2lu
ZyB0aGF0IHNob3VsZCBtYWtlIC0tY3BwY2hlY2stY21kPSJjcHBjaGVjayBhcmcxIGFyZzIiIGJl
DQo+Pj4gc2VlbiBhcyBhIHNpbmdsZSBhcmd1bWVudCBmcm9tIHRoaXMgc2NyaXB0IHBvaW50IG9m
IHZpZXcuIENQUENIRUNLX1RPT0wNCj4+PiB3b3VsZCBlbmQgdXAgYmVpbmcgc2V0IHRvICJjcHBj
aGVjayBhcmcxIGFyZzIiIHdoaWNoIGlzIHdoYXQgd2Ugd2FudA0KPj4+IGFueXdheT8gQW5kIGlm
IHdlIG5lZWQgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiB0aGUgY3BwY2hlY2sgYmluYXJ5IGFuZA0K
Pj4+IGl0cyBhcmd1bWVudCB3ZSBjb3VsZCB1c2UgImN1dCIgdG8gZXh0cmFjdCAiY3BwY2hlY2si
LCAiYXJnMSIsIGFuZA0KPj4+ICJhcmcyIiBmcm9tIENQUENIRUNLX1RPT0wuICBXb3VsZCB0aGF0
IHdvcms/DQo+Pj4gDQo+PiANCj4+IEkgZ2F2ZSBhIHRyeSBmb3IgdGhlIHF1b3RlcywgdGhlIHBy
b2JsZW0gaXMgdGhhdCB3ZSBuZWVkIHRvIGhhdmUgcXVvdGVzIGluIENDPeKAnC4uLuKAnSwgc28g
YWRkaW5nDQo+PiBxdW90ZXMgYWxzbyB0byAtLWNwcGNoZWNrLWNtZD0gd2hpY2ggaXMgaW5zaWRl
IENDPeKAnC4uLuKAnSBpcyBwcmV2ZW50aW5nIHRoZSBNYWtlZmlsZSB0byB3b3JrLA0KPj4gSSB0
cmllZCBlc2NhcGluZyBldGMgYnV0IEkgZGlkbuKAmXQgbWFuYWdlIHRvIGhhdmUgaXQgd29ya2lu
Zywgc28gd291bGQgeW91IGFncmVlIG9uIGtlZXBpbmcgaXQNCj4+IGxpa2UgdGhhdD8NCj4gDQo+
IElzIHRoZSBwcm9ibGVtIGNvbWluZyBmcm9tIHRoZSBmb2xsb3dpbmc/DQo+IA0KPiAgICBjcHBj
aGVja19jY19mbGFncyA9ICIiIi0tY29tcGlsZXI9e30gLS1jcHBjaGVjay1jbWQ9e30ge30NCj4g
LS1jcHBjaGVjay1wbGF0PXt9L2NwcGNoZWNrLXBsYXQgLS1pZ25vcmUtcGF0aD10b29scy8NCj4g
IiIiLmZvcm1hdCh4ZW5fY2MsIHNldHRpbmdzLmNwcGNoZWNrX2JpbnBhdGgsIGNwcGNoZWNrX2Zs
YWdzLA0KPiAgICAgICAgICAgc2V0dGluZ3MudG9vbHNfZGlyKQ0KPiANCj4gICAgaWYgc2V0dGlu
Z3MuY3BwY2hlY2tfaHRtbDoNCj4gICAgICAgIGNwcGNoZWNrX2NjX2ZsYWdzID0gY3BwY2hlY2tf
Y2NfZmxhZ3MgKyAiIC0tY3BwY2hlY2staHRtbCINCj4gDQo+ICAgICMgR2VuZXJhdGUgdGhlIGV4
dHJhIG1ha2UgYXJndW1lbnQgdG8gcGFzcyB0aGUgY3BwY2hlY2stY2Muc2ggd3JhcHBlciBhcyBD
Qw0KPiAgICBjcHBjaGVja19leHRyYV9tYWtlX2FyZ3MgPSAiQ0M9XCJ7fS9jcHBjaGVjay1jYy5z
aCB7fSAtLVwiIi5mb3JtYXQoDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNldHRpbmdzLnRvb2xzX2RpciwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY3BwY2hlY2tfY2NfZmxhZ3MNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICApLnJlcGxhY2UoIlxuIiwgIiIpDQo+IA0KPiANCj4gV291bGRuJ3Qgc29tZXRoaW5n
IGxpa2UgdGhlIGZvbGxvd2luZyBzb2x2ZSB0aGUgaXNzdWU/DQo+IA0KPiAgICBzZXR0aW5ncy5j
cHBjaGVja19iaW5wYXRoID0gc2V0dGluZ3MuY3BwY2hlY2tfYmlucGF0aCArICIgIiArIGNwcGNo
ZWNrX2NjX2ZsYWdzDQo+IA0KPiAgICBjcHBjaGVja19jY19mbGFncyA9ICIiIi0tY29tcGlsZXI9
e30gLS1jcHBjaGVjay1jbWQ9XCJ7fVwiDQo+IC0tY3BwY2hlY2stcGxhdD17fS9jcHBjaGVjay1w
bGF0IC0taWdub3JlLXBhdGg9dG9vbHMvDQo+ICIiIi5mb3JtYXQoeGVuX2NjLCBzZXR0aW5ncy5j
cHBjaGVja19iaW5wYXRoLCBzZXR0aW5ncy50b29sc19kaXIpDQo+IA0KPiAgICBpZiBzZXR0aW5n
cy5jcHBjaGVja19odG1sOg0KPiAgICAgICAgY3BwY2hlY2tfY2NfZmxhZ3MgPSBjcHBjaGVja19j
Y19mbGFncyArICIgLS1jcHBjaGVjay1odG1sIg0KPiANCj4gICAgIyBHZW5lcmF0ZSB0aGUgZXh0
cmEgbWFrZSBhcmd1bWVudCB0byBwYXNzIHRoZSBjcHBjaGVjay1jYy5zaCB3cmFwcGVyIGFzIEND
DQo+ICAgIGNwcGNoZWNrX2V4dHJhX21ha2VfYXJncyA9ICJDQz1cInt9L2NwcGNoZWNrLWNjLnNo
IHt9IC0tXCIiLmZvcm1hdCgNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2V0dGluZ3MudG9vbHNfZGlyLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjcHBjaGVja19jY19mbGFncw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICkucmVwbGFjZSgiXG4iLCAiIikNCg0KTm8gdW5mb3J0dW5hdGVseSBub3QsIE1ha2Vm
aWxlIGlzIHZlcnkgc2Vuc2l0aXZlIHRvIHF1b3RlcywgSeKAmXZlIHRyaWVkIHdpdGggbWFueSBj
b21iaW5hdGlvbiBvZiBzaW5nbGUvZG91YmxlIHF1b3RlcyBidXQgbm90aGluZyB3b3JrZWQNCg0K
DQoNCg==

