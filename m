Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE314622CDF
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 14:53:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440965.695222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oslVf-0000D8-Vs; Wed, 09 Nov 2022 13:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440965.695222; Wed, 09 Nov 2022 13:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oslVf-0000BG-Sw; Wed, 09 Nov 2022 13:52:55 +0000
Received: by outflank-mailman (input) for mailman id 440965;
 Wed, 09 Nov 2022 13:52:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opqx=3J=citrix.com=prvs=305fc5d8a=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oslVe-0000B0-2Z
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 13:52:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccbdc9d6-6035-11ed-8fd2-01056ac49cbb;
 Wed, 09 Nov 2022 14:52:52 +0100 (CET)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Nov 2022 08:52:43 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by CH0PR03MB6194.namprd03.prod.outlook.com (2603:10b6:610:d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 13:52:41 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 13:52:41 +0000
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
X-Inumbo-ID: ccbdc9d6-6035-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668001972;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AshlGvsUEL8E+f1ma1eeySPM/TeTkUHP3JiBRTHltU0=;
  b=bpWJyX61rsgha3S0yfh1Gy3C9f+lqArULDq16rEuvBAdG4oOTMmElo42
   NfqVLSpA2I80qOd8vMLd9Ja0Rrld2UXmCOZwdUMHnW283yXPhWOtnvTuE
   k7e3HQ13hfFgxpWkb1hpuRj+PY3yUgpD72SOCFwu0QpBF5G+uzlMixxye
   Y=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 84069401
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Wk40cao4cvR9cH7aI3PXAkDcM/VeBmIrZBIvgKrLsJaIsI4StFCzt
 garIBmAa6mMYGGmco0jYIvioE4GvMSByd5lSwturik0En8R85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzyhNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGFcUk2xre6T+pWQU/ZsnZQmCM/UI6pK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKJEjCJbZw9ckKwq
 27Y/mK/HhYAM9+3wjuZ6HO8wOTImEsXXapCSOXmp6Iy2TV/wEQJDyIRaWmyqMWIh1eHQuwYL
 mY7uS0x+P1aGEuDC4OVsweDiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceZTEsz
 E7PoNrvChRmqrjTQnWYnp+YpC2/ETIYJmgDYWkDVwRty8bniJE+iFTIVNkLLUKuptj8GDW1y
 TbVqiE73u0XlZRSj/n9+k3biTWxoJSPVhQy+gjcQmOi6EV+eZKhYIurr1Pc6J6sMbqkc7VIh
 1Bc8+D20QzEJcvlePClKAnVIIyU2g==
IronPort-HdrOrdr: A9a23:CVO186Gz8hHJ8/q8pLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTjLJr0Unp91yy6
 RNwiaQsIdWFwrJmGDn68HPTAwCrDv8nZKz+dRj8EC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2PwqT+GLEXQI+llluhEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.96,150,1665460800"; 
   d="scan'208";a="84069401"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUo8lHUqKRmbMIXAUJA5fnNDhyTUh1ISxdhbcYaeeGQCBlmYbSMOs8lNKQ/m+CDZBI8a1/YlAJDfQsZdSr3fYDn8IBq2cxW51cCpx1NhU9OTw/+hLOVIWOj0DmdEyZxgc7ih38pfdSoq6cBCZb9/nSTHn6swYe6JwK7fCyqWR8l5vmYEGlUlV10mB3ci93NLQohFDDQH06F74q+deAjwJU3o4Kx4/4EEwriDeCDwfp6vNVy7qZwLeih/hFog112ag19sdTD6n9uzWueB89EtO0HgKEgFQUW2WHNRDEBbB5ZMY4rSOGdwqSevml204tLhujjp0zcLQZxw0R9/o8r7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AshlGvsUEL8E+f1ma1eeySPM/TeTkUHP3JiBRTHltU0=;
 b=h3WiiyS7F8+MskQIRgrV4E2Fq3IcZh3daUQW2Jvh3tEmCmByqk6q2+Vsg+l1RmWZOypO50ypqRZrJylFndpeY6AfR4Nh7spUq8MtpyNjbZRz5dE6Fk4BCXJ50rCo2tXfFrc6P9J0IMdZCFyghyjTNmP7BcETaoQO4/W+Zf0qjkCStt3iukdOAjTZvcY5uPqOHs2vTaC3GuhTYyG4HX2IgyYd1EHO4uJdTgDeGbxWuZiwZGnEo5GIX7j2lYHXWxbJrZaydDU0rZWpvXs/KncfWYhbvtchn+phycleX8WGBjPnxL4n0ZsU3qsxGFAew1zkXfCVBDdCrYkVQX+9qzLDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AshlGvsUEL8E+f1ma1eeySPM/TeTkUHP3JiBRTHltU0=;
 b=V5zT56OQsHr8BHYrwrnNxygtCsOwY8dQeUTxPsjIvseq6bcztpL3xXrO+77VgLZph4vSk2F01vavMpjpsnYCLF8o9XPleH9XIIZ7YpGxO+OFq49RtYLlb3/Gq11vvU1sh4oM5B1McN0XSeRzo3x7xfBRzB36npQCJ/2wMM6xlu8=
From: Edwin Torok <edvin.torok@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v3 15/15] tools/ocaml/libs/xc: fix use of
 uninitialized memory in shadow_allocation_get
Thread-Topic: [PATCH for-4.17 v3 15/15] tools/ocaml/libs/xc: fix use of
 uninitialized memory in shadow_allocation_get
Thread-Index: AQHY84hP/JHefKuHJEOBKR0Y52MvLq42nfQA
Date: Wed, 9 Nov 2022 13:52:41 +0000
Message-ID: <567AAD55-5FD3-42B9-88EB-661A808822EB@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <94f93ee61a4d0bd2fac3f5a753cb935962be20bb.1667920496.git.edvin.torok@citrix.com>
In-Reply-To:
 <94f93ee61a4d0bd2fac3f5a753cb935962be20bb.1667920496.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|CH0PR03MB6194:EE_
x-ms-office365-filtering-correlation-id: 3b0d35e0-8b4d-47b7-8cf8-08dac259abb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WhdWCZPlaIReYmHdo0X29j35WRc7wpic65tY1oN0lLSWR+12D5L3nhKq/J/gVcsP02xJENImRnHurd4tFklSLnlodXuF88GH9dA2XmS54r40x8oxs6oRDy2XKw4DzFc9p1yWPetBKMg1pfuu1bBnhCMeDmhMgQvYgDVLL+yCHlzbnmMEwlMcHCHDsItBTVb/2IF2HISRKyXgUoouDGkLiNgvJ3NVxLRFh7ITohVCpU5pY4oCppCBM4hXGzuyyllGN/6uwTfiaruTU0qClF9otzYjNFV1RO2msl1cThjSY+YzFUNs+LF/43bN7WPzFf6rgNnGvhWkA0YmFR3XJqTxocAn+bi9U2IIY0TBR6TnqCMzZzYytG6GhB4rYD4au99WzM7VynsDRcSJe/0TrJmvr/QHWE3wdxvrXOC+/wdA4f3LVBXlaKzocb0UmkZ1HKTEvlQd3QZmfW3s6ZkVcuE/lZKVdq3c0ESRFKXdQYCtZSHgv66zRW5dw4iOkIlLuCufU3dUF0HgR86tNIQN9nqPh/9Y1XSTMgquZ2wocbQ6a+2iCHHaRcnlfHBQwWElM+xa2LaA6UZ729O7Wxu2/pVhAcjyem4md6NMMRZLtMNeAuyHoCSV+cU4eEjOLbsLgspwT14OQm3DGXLNrzErVmkT4FH3SvHsXM+Ro5DVZQeX5JYAfIqI8kzn/M6HbgHfdzL+V/jY8uZloKoaPCq+s4+VOarY21ZhSAWVrjb9Vtfd/sbF+5O/tHPLV0R2EK/LnKNz5mYvFno3FLqjmu9vExmKZU12mDJAafEeqQhkP552RErKwDoTgkydv7tH/1dg5ydPwu73S5dL4cxw4EK/NEe4elDC0HyZ0tj5s+9w0mRGOLAK4wQ7Y6ZYfBXbC9bXGIR4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199015)(86362001)(76116006)(66446008)(66556008)(64756008)(66476007)(316002)(66946007)(91956017)(5660300002)(41300700001)(54906003)(6916009)(45080400002)(8936002)(33656002)(8676002)(71200400001)(2616005)(186003)(2906002)(478600001)(6486002)(6512007)(122000001)(26005)(6506007)(4326008)(36756003)(38070700005)(38100700002)(53546011)(66574015)(966005)(83380400001)(82960400001)(107886003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NUZZRFNNeTZ1MkpCViswbmNKMXV2bld2dWppN1R0VFlLLzQyMG93S0w3N1Na?=
 =?utf-8?B?cWx0cU9KTCtpUmFGSURtbFdaclhZc1k0UVpIV3dodm5wcWY3eHVnZ21wcnZr?=
 =?utf-8?B?a3BFY3lzajNra2ZHK2JoYTIvUDVHMCtUaWJsUHdqL2hVZlp3VEJPRDJwR3h1?=
 =?utf-8?B?VHZMbWh5Q3RBVCtVUDUzNUN0d0hyNHEzZTRFWUZmNzRreFJSMlhDN1lVbjZC?=
 =?utf-8?B?Y0NnaWRJZC9yT0M0dXQ3aUpJQyt3OXZteHA3RVQ5RFNLTFVJVlYrZmpzVERL?=
 =?utf-8?B?SHhUSUZ3WDBRcDN4YTlGM3Y3dG5vZGdxNFdDbzRXVG1XSWh3Ykk0UHNsZ1JI?=
 =?utf-8?B?OHh3ck9XMXhTZU8yYWk3ZWo1V0tzeGYrc3JMMFpUWGhJc1dYcDdUOStyUS92?=
 =?utf-8?B?Vm1TY1dqYWhrRnhhM0hjTllCOXpyeHZEbjdnVDdCV2dVMkdsSENRSDF5UmR5?=
 =?utf-8?B?TndMdTIyQ0dHc0dtcUoraG02RElJWWRhUTNEN1BWT3owT25oK0VTZW4ydmZ0?=
 =?utf-8?B?cmxzRW40V29SalhVTVp2cXYwUFB2YXAxZC9PQnJUTE5LT3I5QlNDV0pjR2dn?=
 =?utf-8?B?YWJMZkJkaHVpSzlEejJXcHpNeVdVRU5hL2FwbkM3SEJMZXpaVGoyZ2d3M2tK?=
 =?utf-8?B?eWFyU21UbXRGTmFXS1E2dTdDMXM4VG05UnJFbSswZFlSYmk1MzQvcjFpdWdG?=
 =?utf-8?B?ZUJxd0dFQ3Ficm1Xbkd0VUU3ck5QYTQxQXJXUU5CK0N3RTRyaEttWkgzYjVQ?=
 =?utf-8?B?N0ZMU3g5eFF4RDVoZ2JoT1VaOEVnOGR6V0x1TVhENitTRzVjUDVXazRkZXRZ?=
 =?utf-8?B?YXl2NERCcnpTSE5kKzFjbTh3RktWQ1ZVOEozWEVXamNRbkFzaStoWCs1dit6?=
 =?utf-8?B?WFhLOWNZUnVPLzl0RlY3WkdBVTZmZjdqS28vOXVja1BKZUdFT05zanpoMWxT?=
 =?utf-8?B?MlBCTXEvN1VLeGtWUDJmM3g3YzIyZVVMVkxXSEZiVlJtdDhJTFBlM21qMU1z?=
 =?utf-8?B?NTR3TnE3VWVjMnZ3VXBTWUtqL1VZWllzU0pkWTQrK2l0NEtTY0N6S0ZzcERO?=
 =?utf-8?B?UnhBSk51dFJpQjdHQThtNGJldDZDUmI4eHh0eWxxWWdBN3IvaW45eUZhVjJM?=
 =?utf-8?B?SXIwUVloRklFbUkydCtiQ3RHNkpqSjBDak9tdUhVOHR0TXF2eXNGRzhyTXRF?=
 =?utf-8?B?MzZ3TU50UzZBUGdYTzA4TkR1MGFHWjg4NUlkNWoxUmFrbGdFcE1LMDdZa0NU?=
 =?utf-8?B?cHIrblljVmN0VU5NWHkrUVZiSW1scmpBZlRZZzl0RjliRGk0b1piUXowbzE4?=
 =?utf-8?B?QlpmejJRSmxVdXZFbHA2VjZNalMxZXhqbGt0T3RRYjh3TFNUU05TTlUvRTZQ?=
 =?utf-8?B?eGpSQy9WcENPNFhJM0ltcFdPbHVoNHE4ZlozLzZFenRtWGd1V3JpdHU4cTJ5?=
 =?utf-8?B?cFJBOTZhMHp0QnExU3d1Q0xYRjFLc1IvRTBxbWVsZnRmZFpUNU1RWWZtWnBk?=
 =?utf-8?B?QWhQK0Y1SU1vZ2JpcGhNUGRNaTN6OVRVaUpKbVdidkgzZ1FoVisyU1crbjZI?=
 =?utf-8?B?blpwWUxGUzF6RnpVK3BCSVc5WituamZSTWZ1ZkpGaVAybWxadHd5ZlNvc3hw?=
 =?utf-8?B?aDRydmpkUnJ6ZUpkUllaejdMWFVoanZaVGtSUk1ReHdNNzhCdHFQbjRFNi9D?=
 =?utf-8?B?NW02L3VMbFM4MGdPeGwrWHk2U251Sms5VTVRM3AzZjNlTGR0b1lDOGNvQ0xY?=
 =?utf-8?B?VitRNWFJb2JpeC82ZllyemNpNFQ4NjVIcVRQbldvWi9ON1ZtZ3ZjYU1TaENm?=
 =?utf-8?B?YjFOTTlNTjZ3bUNXN09EekdvUDFab2F0RUxiRzBWRUJQNDErL3ZEZDBSU2ph?=
 =?utf-8?B?MHVXN251b21EeHcyclFUbEZwbmtjZmU0bUVDSXo3dnA0dXoyV0QvajVCNHhC?=
 =?utf-8?B?dE94WHJPaWpsaVY0RksxT1daTnhGOUZQL3FrdFRZYVBQNURPc0s3Q01KdzZu?=
 =?utf-8?B?U0RGQlY0bjhRcE1lK2Fqd2xBTmJ3bHdpNWZBUURhUEZ4djVYOEIrSTltZS90?=
 =?utf-8?B?ZWZLZXJEQUszMmJjdVhWS2Y1N2c5dFUzZCtDQ0U4Y1IrRW1GQjRub0JnSFVD?=
 =?utf-8?B?K0h5djA5cUlEZFlTejB2ZUF3YUVZRHRCbGVnYzJIekc0WmxEZ3NZemlHcHZS?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D3E6E3FD5AB27498A6DFF049018AA81@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0d35e0-8b4d-47b7-8cf8-08dac259abb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 13:52:41.5066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQ/83QQz1wduqsz3V/KGJwt/YdY1KOmjC5qYeWlyD1Kd9Bt4q4i58tNPhe8T3TBE52DQQ+yrd3m7m0mTFnOTMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6194

T24gOCBOb3YgMjAyMiwgYXQgMTU6MzQsIEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9rQGNpdHJp
eC5jb20+IHdyb3RlOg0KPiANCj4gSXQgaGFzIGJlZW4gbm90aWNlZCBpbiAyMDEzIHRoYXQgc2hh
ZG93IGFsbG9jYXRpb24gc29tZXRpbWVzIHJldHVybnMgdGhlDQo+IHdyb25nIHZhbHVlLCB3aGlj
aCBnb3Qgd29ya2VkIGFyb3VuZCBieSBhZGRpbmcgYSBsaW1pdCB0byB0aGUgc2hhZG93DQo+IG11
bHRpcGxpZXIgb2YgMTAwMCBhbmQgaWdub3JpbmcgdGhlIHZhbHVlIGZyb20gWGVuIGluIHRoYXQg
Y2FzZQ0KPiB0byBhdm9pZCBhIHNoYWRvdyBtdWx0aXBsaWVyIGNhdXNpbmcgYSBWTSB0byByZXF1
ZXN0IDZQQiBvZiBtZW1vcnkgZm9yDQo+IGV4YW1wbGU6DQo+IGh0dHBzOi8vbmFtMDQuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20l
MkZ4YXBpLXByb2plY3QlMkZ4ZW4tYXBpJTJGcHVsbCUyRjEyMTUlMkZjb21taXRzJTJGYmU1NWE4
YzMwYjQxZDFjZDc1OTZmYzEwMGFiMWNmZDM1MzlmNzRlYiZhbXA7ZGF0YT0wNSU3QzAxJTdDZWR2
aW4udG9yb2slNDBjaXRyaXguY29tJTdDNTRmYTE5OTA1NTY3NDczNzUzNmYwOGRhYzE5ZjcwMjYl
N0MzMzU4MzZkZTQyZWY0M2EyYjE0NTM0OGMyZWU5Y2E1YiU3QzAlN0MwJTdDNjM4MDM1MTg3Nzgx
ODcwMDY2JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlq
b2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0Mm
YW1wO3NkYXRhPWwzJTJCU0RRaW5vcVo5Q1p2V3NBY1hnRmw1dkViSmY3aGpWekJQTEtvVllwNCUz
RCZhbXA7cmVzZXJ2ZWQ9MA0KPiANCj4gSG93ZXZlciB0aGF0IGlzIGp1c3QgYSB3b3JrYXJvdW5k
LCBhbmQgSSd2ZSBqdXN0IHJlcHJvZHVjZWQgdGhpcyBieQ0KPiBraWxsaW5nIGEgVk0gbWlkIG1p
Z3JhdGlvbiwgd2hpY2ggcmVzdWx0ZWQgaW4gYSBzaGFkb3cgbXVsdGlwbGllciBvZg0KPiA2Mjku
NDIsIHJlbmRlcmluZyB0aGUgVk0gdW5ib290YWJsZSBldmVuIGFmdGVyIGEgaG9zdCByZWJvb3Qu
DQoNCg0KQWZ0ZXIgc29tZSBtb3JlIGRpc2N1c3Npb24gaXQgbG9va3MgbGlrZSB0aGlzIGlzIGdl
dHRpbmcgZml4ZWQgaW4gdGhlIGh5cGVydmlzb3IsIHNvIHRoaXMgd29ya2Fyb3VuZCB3b3VsZG4n
dCBiZSBuZWVkZWQsDQptaWdodCB3YW50IHRvIGhvbGQgb2ZmIG9uIHRoaXMgcGF0Y2ggdW50aWwg
dGhlIGRvbWN0bCBkaXNjdXNzaW9uIGlzIHNldHRsZWQgYXQ6DQpodHRwczovL2xvcmUua2VybmVs
Lm9yZy94ZW4tZGV2ZWwvMjAyMjExMDgxMTM4NTAuNjE2MTktMS1yb2dlci5wYXVAY2l0cml4LmNv
bS8NCg0KDQpCZXN0IHJlZ2FyZHMsDQotLUVkd2luDQoNCj4gDQo+IFRoZSByZWFsIGJ1ZyBpcyBp
biBYZW46IHdoZW4gYSBWTSBpcyBkeWluZyBpdCB3aWxsIHJldHVybiAnMCcgZm9yIHBhZ2luZw0K
PiBvcCBkb21jdGxzIGFuZCBsb2cgYSBtZXNzYWdlIGF0IGluZm8gbGV2ZWwNCj4gJ0lnbm9yaW5n
IHBhZ2luZyBvcCBvbiBkeWluZyBkb21haW4nLCB3aGljaCBsZWF2ZXMgdGhlICdtYicgcGFyYW1l
dGVyDQo+IHVuaW5pdGlhbGl6ZWQgdXBvbiByZXR1cm4gZnJvbSB0aGUgZG9tY3RsLg0KPiANCj4g
VGhlIGJpbmRpbmcgYWxzbyBkb2Vzbid0IGluaXRpYWxpemUgdGhlICdjLT5tYicgcGFyYW1ldGVy
IChpdCBpcyBtZWFudA0KPiB0byBiZSB1c2VkIG9ubHkgd2hlbiBzZXR0aW5nLCBub3Qgd2hlbiBx
dWVyeWluZyB0aGUgYWxsb2NhdGlvbiksDQo+IHdoaWNoIHJlc3VsdHMgaW4gdGhlIFZNIGdldHRp
bmcgYSBzaGFkb3cgYWxsb2NhdGlvbiAoYW5kIHRodXMgbXVsdGlwbGllcikNCj4gc2V0IGJhc2Vk
IG9uIHdoYXQgdmFsdWUgaGFwcGVuZWQgdG8gYmUgY3VycmVudGx5IG9uIHRoZSBzdGFjay4NCj4g
DQo+IEV4cGxpY2l0bHkgaW5pdGlhbGl6ZSB0aGUgdmFsdWUgcGFzc2VkIHRvIHRoZSBkb21jdGws
IGFuZCBkZXRlY3QgdGhlIHVuaW5pdGlhbGl6ZWQNCj4gY2FzZSAoc2hhZG93IGFsbG9jYXRpb24g
b2YgMCksIGFuZCByYWlzZSBhbiBleGNlcHRpb24gaW4gdGhhdCBjYXNlLg0KPiBUaGUgZXhjZXB0
aW9uIHdpbGwgY2F1c2UgeGVub3BzZCB0byBza2lwIHNldHRpbmcgdGhlIHNoYWRvdyBtdWx0aXBs
aWVyLg0KPiANCj4gTm90ZSB0aGF0IHRoZSBiZWhhdmlvdXIgb2YgWGVuIGhlcmUgaXMgaW5jb25z
aXN0ZW50IGJldHdlZW4geDg2IGFuZCBBUk06DQo+IEFSTSB3b3VsZCByZXR1cm4gRUlOVkFMIHdo
ZW4gaXQgZ2V0cyBhIHBhZ2luZyBvcCBvbiBhIGR5aW5nIGRvbWFpbiwNCj4gYW5kIFg4Ni02NCB3
b3VsZCByZXR1cm4gMCB3aXRoIHBvc3NpYmx5IHVuaW5pdGlhbGl6ZWQgZGF0YS4NCj4gDQo+IEl0
IG1pZ2h0IGJlIGRlc2lyYWJsZSB0byBjaGFuZ2UgdGhlIHg4NiBwYXRoIGluIHRoZSBoeXBlcnZp
c29yIHRvIHJldHVybg0KPiBFSU5WQUwsIGFsdGhvdWdoIHRoYXQgd291bGQgcmVxdWlyZSBtb3Jl
IHRlc3RpbmcgaW4gY2FzZSBpdCBicmVha3MNCj4gc29tZXRoaWcuDQo+IEJ1dCB0aGUgYmluZGlu
Z3Mgc2hvdWxkIGJlIGRlZmVuc2l2ZSBhbnl3YXkgYWdhaW5zdCBidWdzIGxpa2UgdGhpcy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+
DQo+IC0tLQ0KPiBSZWFzb24gZm9yIGluY2x1c2lvbiBpbiA0LjE3Og0KPiAtIGZpeGVzIGEgbG9u
Zy1zdGFuZGluZyAoPjl5IG9sZCkgYnVnIHRoYXQgaXMgc3RpbGwgaGFwcGVuaW5nIHRvZGF5DQo+
IA0KPiBDaGFuZ2VzIHNpbmNlIHYyOg0KPiAtIG5ldyBpbiB2Mw0KPiAtLS0NCj4gdG9vbHMvb2Nh
bWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgfCA1ICsrKystDQo+IDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9v
Y2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3Ry
bF9zdHVicy5jDQo+IGluZGV4IGUyZDg5NzU4MWYuLjk2ODFhNzRlNDAgMTAwNjQ0DQo+IC0tLSBh
L3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jDQo+ICsrKyBiL3Rvb2xzL29jYW1s
L2xpYnMveGMveGVuY3RybF9zdHVicy5jDQo+IEBAIC0xMDE5LDcgKzEwMTksNyBAQCBDQU1McHJp
bSB2YWx1ZSBzdHViX3NoYWRvd19hbGxvY2F0aW9uX2dldCh2YWx1ZSB4Y2gsIHZhbHVlIGRvbWlk
KQ0KPiB7DQo+ICAgICBDQU1McGFyYW0yKHhjaCwgZG9taWQpOw0KPiAgICAgQ0FNTGxvY2FsMSht
Yik7DQo+IC0gICAgdW5zaWduZWQgaW50IGNfbWI7DQo+ICsgICAgdW5zaWduZWQgaW50IGNfbWIg
PSAwOw0KPiAgICAgaW50IHJldDsNCj4gDQo+ICAgICBjYW1sX2VudGVyX2Jsb2NraW5nX3NlY3Rp
b24oKTsNCj4gQEAgLTEwMjksNiArMTAyOSw5IEBAIENBTUxwcmltIHZhbHVlIHN0dWJfc2hhZG93
X2FsbG9jYXRpb25fZ2V0KHZhbHVlIHhjaCwgdmFsdWUgZG9taWQpDQo+ICAgICBjYW1sX2xlYXZl
X2Jsb2NraW5nX3NlY3Rpb24oKTsNCj4gICAgIGlmIChyZXQgIT0gMCkNCj4gICAgICAgICBmYWls
d2l0aF94YyhfSCh4Y2gpKTsNCj4gKyAgICBpZiAoICFjX21iICkNCj4gKyAgICAgICAgY2FtbF9m
YWlsd2l0aCgiZG9tY3RsIHJldHVybmVkIHVuaW5pdGlhbGl6ZWQgZGF0YSBmb3Igc2hhZG93ICIN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAiYWxsb2NhdGlvbiwgZHlpbmcgZG9tYWluPyIpOw0K
PiANCj4gICAgIG1iID0gVmFsX2ludChjX21iKTsNCj4gICAgIENBTUxyZXR1cm4obWIpOw0KPiAt
LSANCj4gMi4zNC4xDQo+IA0KDQo=

