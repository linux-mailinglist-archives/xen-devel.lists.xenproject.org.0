Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DCF36C6D9
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 15:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118487.224643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNYx-0005vp-DG; Tue, 27 Apr 2021 13:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118487.224643; Tue, 27 Apr 2021 13:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNYx-0005vP-9m; Tue, 27 Apr 2021 13:15:39 +0000
Received: by outflank-mailman (input) for mailman id 118487;
 Tue, 27 Apr 2021 13:15:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lK8l=JY=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lbNYv-0005v1-EI
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 13:15:37 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd13f9aa-6fa8-4618-980c-d8afa5865583;
 Tue, 27 Apr 2021 13:15:30 +0000 (UTC)
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
X-Inumbo-ID: fd13f9aa-6fa8-4618-980c-d8afa5865583
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619529330;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=gnW8G/vAb0VlOlI6ZVQZ7LbKL4kCnohKmz5KAXT8mCE=;
  b=JWROFhYiaVsjBGFG0elEMm6nhX9Q/yp/Y6z5vFcRVr50lN4JyASE7gHQ
   Q+aeCArw9fi8AdDck7eWZairMg84Mk03aR+MCsWXIbt1lRhlT3jBeoF8r
   j2c7LtAUXPHsBRrZO6u+h6qIoW+ExrsAAFvrN5EgbOZyKPSaM6UVVQn7X
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RXsDLrmN5FDQ9em2O4Jxb+LjLuXSi2gnfOa2dygCX7JomAkyvIL18RP+RDDoIVkGNKZWe7lELn
 tnFQqyvLDOiwmD475syZe860cGtV45GR+dsFuwOa6eqHBuBz9iMflq2VUj9dwPbsR2qLh2Bkre
 f810x2RjTHW0ZuYPhvzKIm5Rd3AvMoM5Wr2r6KIj8O0HyMHGLWPwb74/jbzjvZ1i6qbbAw9j8d
 E1dKaDBiTRwLYBOuVdz8cx1aUL9/40B2IUBsg8NtRflLRRq3enMAAasKD5EDkdxhtkzPyYF2FL
 u8o=
X-SBRS: 5.1
X-MesageID: 42889963
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0g1Aa6Gze+jcj9XBpLqFtJXXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7L0/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeOJwTXzcQY76
 tpdsFFZOHYJVJxgd/mpCyxFNg9yNeKmZrY/9v25V0Fd3APV4hL6QBlBgGHVm1aLTM2SqYRPp
 ya+8ZBun6EcXMYcsy0ChA+LpX+jvfMk4/rZgNDOgUu7xOAgSjtxLnxFRWZ2Rl2aUIA/Z4J92
 /Znwvlopiyqv3T8G6R60b/zbRz3OHgxNxKGdCWhqEuSwnEpw60aO1aKsW/lR8vpuXH0idJrP
 DpgzMNe/t+8GnQeGbdm2qt5yDF3Cw143HvjX+06EGT2vDRfz4xB8pfiY8xSHKwgCBM3KAe7I
 tx03+ErJ0SNBvcnU3GloP1fit3nUm5q2dKq591s1VjUJATYLIUjYsT8FI9KuZ4IAvG6ZsqGO
 QrMcfE5Pw+SyL9U1nluABUsbmRd0V2Oi3DblkJu8ST3TQTtmt+1VEkyMsWmWpF3I4hSrFfjt
 60cphApfVrdIs7fKh9DOAOTY+cEWrWWy/BN2qUPBDOCLwHAXTQsJT6iY9Fp92CSdgt9t8fiZ
 7BWFRXuSoZYET1E/CD25VN71TrTHiiWy/ujuVT/YJwtLG5ZLeDC1zAdHke1++b59kPCMzSXP
 i+fLhMBeX4EGfoEYFVmwLkXZ1fLmQfTd0Vtt43V0nmmLOOFqTa8sjgNNrDLrvkFjgpHknlBG
 EYYTT1LMJcqkCnM0WIxyT5ajfIQAjS7JhwGK/V86w4044WLLBBtQATlBC87sGPIjtSr7wucC
 JFUfXau5L+gVPz0XfD7m1vNBYYJF1S+q/cX3RDohJPNVj1f7YFs9CWYntTw3ODOx96Q6rtYU
 tijmUy3ZjyA42bxCgkBd7iGHmdlWEvqHWDSIpZhreO/t7/epQzDo8vXat4EQmjLW0tpS9a7E
 N4LCMUTE7WET3jzZi/hJsPHefFap1XmwGwO/NZrnrZqGSRrcwiXWEgQjarSMKb6DxeHwZ8tx
 lUyes/iKDFsSuzIWE/6d5ITGFkWSCyOvZ6KyirIK9TgavmfQlsS3ziv03ktzgDPkzw90sTgW
 T9KzazYv+jOCsGhllRzrvq/FRodm+UYkJ3bTRgvZdgEHnd00wDoNOjd+691XCcZUAFxfxYOD
 bZYSEKKgcr3Nyv0gWJ8QzyXkkO19ErNuzZAK9LScCs5lq9bImJn7oBBfla4dJsM83vqPYCVY
 ukCkaoBSK9D+MiwAqOoHk5fCFytXk/iPvtnBno9nKx0nJ6Af3cJj1dNvkmCsDZ62jvXPCT1p
 plydozoOurK230Lsec1ru/VU82FjrD5WqtC+04o5Fduqw/8LN1ApnASDPNkHVKxg83Isv4nF
 4XKZ4LqozpK8tqZYgfaihZ9l0mmJCUIEwnvhf/D+U+cVsu5kWrSe+h8v7Ns/4iE0eBrAz/NR
 2D6CVb5e7CRDbG2rgACa48SF4mJXQU+TBn5qeFeILRAgnxKL0G81q+L3OncLhSDKKCAq4dqx
 5m49eO2++bHhCIqjz4rH9+OOZJ9W3iXMa5RASLEuRM+8ahOVuNjrCxifTD+wvfWH++cQAAmY
 ZBdUYMdcxNhTkpkZ0v3kGJO9/Ki1Ngl0Eb/CpumVHs0JW3+WvXHUlJNgvCn5VdNAMjR0SgnI
 DC6uiX1HP0/ThD193CDS5rD6FzJ+Q=
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42889963"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOGeWoTm9M2ugQ3/PwguLkTYST4WjlRnMjuy8hZ+jGPFnpC8cojLdN8hIWRW2OoMqqe2SqDGRMp1M5pyipd6sfpG+P7E6tekhIFNYohf3otQrTlaf7g7Kwic1M0IeXpaRRoaTaIY+Mudla2qTIkLq7JWPS2vPiZpBjSVVrrtslZRldm8hc6awzb2fk5RFaSVsNNxjbBUo4LTD40xd7sNESHd+fziRz5HYzi+T0huUUTcZMAOzaRC+nHgXGQ45GaTvK78tghJix/T4bbu2mjisWdHCcWwSsTFW4i11qOTGqtRQAnJuEVPhcqtnlwgvUi/bC2mwMc72UuqOlqaCzX0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnW8G/vAb0VlOlI6ZVQZ7LbKL4kCnohKmz5KAXT8mCE=;
 b=apNwm4nn1na8cXr9+JZzFnqgHPVZYEbAvZB0tcjQoqm8Q3qOaGJks72nMfK4U9D2PLi1T731sYeAzh5E1nd00A/AH34XEztEDv1jgNVTNyAthzkF8aKwmlFYsT+NMypUyfx7wXrMIk+4UC1RF6leIcG9VfWQm2xOfFcXuN2ORi7LvIz8Pea9Wu7wzeQ2UvdzMYFeAjTl8HoacteX5Y6+6B+wlvpqasyzJtpV/E27iCVQi+Vfk43aT90laN0scB4uFm+55A6FGI85xr652nhcPyTs5W29FyrFCRgsj/JU4r/ONcOfVX27vFeY5TziytflWaBW/xcv+z/hTi0V6LnQ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnW8G/vAb0VlOlI6ZVQZ7LbKL4kCnohKmz5KAXT8mCE=;
 b=G/U9xWKy1vTTWCYuTpj0WzvRuDJXDnTFrhRNiU2ML5b2HoJWhuv3/8gQ4eGYh2ccP2aaYN2eCxC71eH1vf7rpoH8hkrcIkFv9FQKk4aIOHe+h7S4MPLVvVlk6E2vmZBzLHi0zz7e4ACNFDqJbCphErtBYd4s3tNrJt7k7IJJpas=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
	"xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>
CC: Deb Giles <dgiles@linuxfoundation.org>
Subject: XenSummit Design sessions website open for submissions
Thread-Topic: XenSummit Design sessions website open for submissions
Thread-Index: AQHXO2dccUzbfq2SvkKpmPaTgJNKlg==
Date: Tue, 27 Apr 2021 13:15:14 +0000
Message-ID: <E0F52712-59FD-40E9-9488-EB4F7871EA06@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f13abae-3bc8-4259-0ca0-08d9097e7eb7
x-ms-traffictypediagnostic: PH0PR03MB5768:
x-microsoft-antispam-prvs: <PH0PR03MB5768D6386932AEE665DCF98A99419@PH0PR03MB5768.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HSEah2fX61AqBIaqAQsiCu//M6eRpuMoVbWU78lDCHPOgv4Xag23KS+deJF8N1NhVBJX9wIH0ZNFX0QXktet9B7RktPfiFVi99CVTntknRLJMueMJCrMr2pTP0czpKZKv0qPJidV9LNTZqI2+gkYG2SC0fZmxivELvXkV1rChQbgNLKj96aqWvGZO5JnBmXOcLkIx0lR9zFZFQK/TnKI7GNTO8GYsFRrXmfivWl4BB+VozWICIGrt0Yzk+EwENpHQ5RzIqYXb2bNJNQQ7CphLjN6pZcAvipUsCGY511x8ypV+CPPLUEdksgeI6Aa0iEsjWDJ72B70fL3ZBspGOSCfiFSRpQEbd/XzIV/OLbxM1eqECrwT6rKTemk+M6tL//d8vajp1NevlqFjDrkJnfFFpeEZ6pUdBvknZWBTlV7/wo77JRO0aWcjnIucRZKRVcSKGQageBcBX3ht5byxY16aUZVGUyXOMvQA8T26I9GPFLhCIT4H/Jrdy2KGuaceuzyMNfrlme1aaWvfW8QBCjDovRWfMLJhqvkmKzswGjOecvQp6kz5tejZ4G6AttNIfXzfj0sVaCtd4ADalnmxcInHPhKs6P5GBawQzjLJiiEvNF1Kv9FWoUuUMXFNlm8G0GpruMQwXWqwAuwJAUMH6f5dmoxh4Ah5Ga95oCqVx43+x1QIZV1pBOn8qE0MiBedKVl+80v50Z9sozM/LUpEPZLuld++cMvkdlmuINFP8MpcyFtT3FNsIkDvkV/Ojv7pnvl7fPE/zq3M+8NJquUDBvYlA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(376002)(136003)(366004)(38100700002)(26005)(83380400001)(186003)(66446008)(71200400001)(66946007)(316002)(64756008)(478600001)(91956017)(2616005)(122000001)(110136005)(4744005)(36756003)(6512007)(66476007)(86362001)(6506007)(6486002)(66556008)(966005)(76116006)(8676002)(4326008)(8936002)(2906002)(5660300002)(33656002)(49320200005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MlpxY3ZNTGwyTnMxSDFhbk8rdmZzNXFUMUk1eVQ5VG91WGRYUGdKUUdYMmhK?=
 =?utf-8?B?NzNhMXQvNlN0ZG4zRG1sQXhnQlJ4NTMyRUJYWTZNTTdzdmNpR2kxQkJkMmdj?=
 =?utf-8?B?YWNhZTFFMnkxYitQVEYvbzVNUllVTHgreTRpNm0rUE5Cd0c4UkdkVjJqZmVo?=
 =?utf-8?B?OU1EYTZTUGc4VGJVZGhHTU9kV1RlUnJnUWhNaGJXdjE5emFUNFg3VGY4bmN5?=
 =?utf-8?B?dXo1UFBFR1BCRWg4bTVUendYVG9Wd0cva2pqN2JWWVozWFpSSWx4ZXU3eFJT?=
 =?utf-8?B?Wi85OHJZcG5hVjVwM3FldDkwT2c5QitOTytiSVZmai9iNlNncXd6dGRBRFZZ?=
 =?utf-8?B?OXBmM3JSRzRjMkI2Ni9sWmZEdHAzcEJhZW1laHU4OS9yU1pGMXFueC9Ta0lP?=
 =?utf-8?B?WEY1cFFlTTZRdWVrR0VzeU9sMU5qZE5nR3ZITzlPOU5oRXpiYURxeU1yQ0oz?=
 =?utf-8?B?RzdPeTBOSEtCZjhPYlZPNiszSm13TFBrVWhjdWMwYnBJajNWZWM4VjkxSjMw?=
 =?utf-8?B?UVhnd1lyVVl1VzFlSGVESStUUVFaZy8ybTl3VHRIZmloMm12a1pFZC9MK2dM?=
 =?utf-8?B?Ry9kUm1TcHYrU1JuVkxPVUl4S09vYWR1SGF5azQyYlJDMkNVaU9mUU9EQzRD?=
 =?utf-8?B?dGw4c011cUc5bWE2OTN0aEpDckdhdVNLN24vODEraXBnci92dW5SS21uQktT?=
 =?utf-8?B?UnM5Nlo2Qkx6QXJrMHVRcmxORTNyVm5wNVVGalRvOXR1aFF0SkJkWGtMU0xi?=
 =?utf-8?B?THNsVzJzaEZXYy9VTTZ5OVpBYzNlazdNUzlINk9UTHFIOXowS2w0cjlQU1o0?=
 =?utf-8?B?cDlSb2h2T2VoUFBiY0NFb004NTRpL09uckNRRG5abGhwRWNFb1dLNXlwVE1u?=
 =?utf-8?B?N0pYZUE0c25VRFp2dll6b01iWUc2MmJ2OGJvQklsODdkZUxxc2h2WE1FZk1R?=
 =?utf-8?B?NHNEdHJlSDBkTGh1Yk0yL21TbHlta0VVbEhRTjZEbE1ObFowSHlTTStmWG9l?=
 =?utf-8?B?aENaZGFobUVVWGUySFNNOGg2TmpDL1QrQWhGZ1E4UitLcmRGT3RNaS92V0lS?=
 =?utf-8?B?bkpMWXNwa3FJTkVYR3ZBd3J0YWVOWG9RNExVcFdoY3FCSlRvUnJLV21Fa21E?=
 =?utf-8?B?Z1NOZFBuM2lWTy9wTXFhc01vR3owVGtUOERSSkdwSEsvbkhSK2pQNjIxQlRJ?=
 =?utf-8?B?NUF6dUJvdGJhU0JqWUtpTEYvZDhqSEVzMVBrL010Yk5OMlBsWENNcmIyVDZB?=
 =?utf-8?B?UGVmK0RQc0lsS2thN1lGZWdmT01pcmpNNzhMKytNMElKVDFpdStWazZKaHpw?=
 =?utf-8?B?Z3B3NkszNzltTWNYY0tzblB3UjNEQ0YzekdHT1BEeVpLRGFvSnAzWXlVM2p3?=
 =?utf-8?B?UHkxN0hkeEhyVGd6Y1I0Q05RZWxUMlFONW11NU1PT1dCWEk0WXBwV3I3K0Nl?=
 =?utf-8?B?R3lwZFdNVHdZeGNvQ1kxZ0xkQVdqbUhJM1g5bHhYcERpM0IzKzB6TmtaL0ZW?=
 =?utf-8?B?dW56UFZGQWI4MWlSKzJZOElFVnIzZlpIQXhRMkFueDJKeE8rQmd6bVBNUExx?=
 =?utf-8?B?Mzk5c2lhdDYwaXNqMEQySkZHYmhlWk9qWU5NbWVKajhTelBYZGJaQ3FQaU9J?=
 =?utf-8?B?dldJSmJ0TVZZYzQzNnFSQTI2amcweFVMZ0tIcSs4S1VZamViVlNneURBY0tI?=
 =?utf-8?B?RGNUeVBocHRwM0p5RFJVdmd6c1hoSXBpeDF2VHBSNlJ1N2RTSlA0dGJYWmYv?=
 =?utf-8?B?WlQ5QzhJQnZId2p5djR6T05IRkNUL3lZU1JxLzF0cnhCV1p5L1VMckthOTZJ?=
 =?utf-8?B?bm9BanVaMEJ3MTdKNndwdz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <95D7067AA1E5454585F49357A309A262@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f13abae-3bc8-4259-0ca0-08d9097e7eb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 13:15:14.5373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u5WbEthwQOBSmpoL9h/0MpWNMwB7yP/LuAC50gmyq5/fFAko3Yda87bJv6qWQ7UdbCrDt07cvg0aB6k4mdQkh75xmtR6k7dD7lX/7ZqjvJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5768
X-OriginatorOrg: citrix.com

SGVsbG8gZXZlcnlvbmUsDQoNCmh0dHBzOi8vZGVzaWduLXNlc3Npb25zLnhlbnByb2plY3Qub3Jn
IGlzIG5vdyBvcGVuIGZvciByZWdpc3RyYXRpb24gYW5kIHRvcGljIHN1Ym1pc3Npb25zLg0KDQpB
bnlvbmUgY2FuIHJlZ2lzdGVyIGFuZCBzdWJtaXQgc2Vzc2lvbnMsIGJ1dCBuZXcgYWNjb3VudHMg
c3RhcnQgb3V0IGFzIOKAnHVudmVyaWZpZWTigJ0gdW50aWwgbWFudWFsbHkgdmVyaWZpZWQsIG9y
IGEgdmVyaWZpY2F0aW9uIGNvZGUgKHNlbnQgYmVmb3JlIHRoZSBzdW1taXQgdG8gcmVnaXN0ZXJl
ZCBhdHRlbmRlZXMpIGlzIGVudGVyZWQuICBBbnkgYWN0aXZpdHkgZnJvbSB1bnZlcmlmaWVkIHVz
ZXJzIG11c3QgYmUgbW9kZXJhdGVkIGJlZm9yZSBpdOKAmXMgdmlzaWJsZSB0byB0aGUgd29ybGQg
YXQgbGFyZ2UgKHRvIGRpc2NvdXJhZ2Ugc3BhbSkuDQoNCldlIGhhdmUgYSAqbG90KiBvZiByZWFs
bHkgZ29vZCB0YWxrcyB0aGlzIHllYXI7IGJ1dCBpZiB5b3UgaGF2ZSBhIHRhbGsgeW914oCZZCBs
aWtlIHRvIHN1Ym1pdCBsYXN0LW1pbnV0ZSwgeW914oCZcmUgd2VsY29tZSB0byBzdWJtaXQgaXQg
YXMgYSBzZXNzaW9uLCB3aXRoIOKAnFtUQUxLXeKAnSBpbiB0aGUgdGl0bGUuICBJdCB3aWxsIGJl
IHNjaGVkdWxlZCBhY2NvcmRpbmcgdG8gdGhlIGludGVyZXN0IGl0IHJlY2VpdmVzLg0KDQpUaGFu
a3MgZXZlcnlvbmUhDQoNCiAtR2Vvcmdl

