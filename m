Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016094F9A2A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 18:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301674.514896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncrDE-0000RK-89; Fri, 08 Apr 2022 16:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301674.514896; Fri, 08 Apr 2022 16:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncrDE-0000Oi-4v; Fri, 08 Apr 2022 16:11:52 +0000
Received: by outflank-mailman (input) for mailman id 301674;
 Fri, 08 Apr 2022 16:11:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHy9=US=citrix.com=prvs=090a3f169=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ncrDC-0000Oc-3H
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 16:11:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96ef65e0-b756-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 18:11:48 +0200 (CEST)
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
X-Inumbo-ID: 96ef65e0-b756-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649434308;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5OMeak4hfaNzOmfDzZPjGqMl6ofgNZCXLnCiqHXqFrg=;
  b=Rztd8Iwvw970WgJw4ScR46q7wDMXNfUuFzmS9qao2AIJynYhxVa+kzE7
   sUoDWRx8zJjqT/62Hpm4858vnLLskAn1nbtev5+P087q74hBQybT5x0ie
   NTcsRujbidloCD8eaq1tOQfbqx0uxg11IbixBDZGhEJatG02XJUcmu9BW
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68383440
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5diG5K6TwM5k5TMD1x9N8gxRtM3HchMFZxGqfqrLsTDasY5as4F+v
 jYfXGyCO6mCMTD8f9glb9jn8UxS7Z/cx4Q1HQI4/31jHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YThU1vX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurTrEFYQEKbml98hVj1fHRx7YpJi2efYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5RJMmo0MEiYC/FJElAqNZ8shuuXv2vEUzpHk0OY+K4y+WeGmWSd15CyaYGIK7RmX/59hV2Er
 2jL+2D4BBAyN9GFzzeBtHW2iYfngifTSI8UUrqi+ZZCjFOayWMSDxkXfUCmuvT/gUm7M/pYM
 FcI9zEy6KE+8U2tZsnwWQWip3yJtQJaXMBfe8U49QWMx6z88wufQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXryos1LSfDvyIevQHepn
 m7M/HNWa6gvYdAjjPzqxH7MqT2Xmp3tSQAI41roekP98VYsDGK6XLCA5V/e5PdGCY+WSFido
 XQJ8/SjAPAy4YKlz3LUHrhUdF29z7PcaWCH3wYzd3U03271k0NPa7y8992XyK1BFs8fMQHkb
 0bI0e+6zM8CZSD6BUObjm/YNijL8UQCPYm9Phw3RoAXCnSUSONh1HszDaJ39zqw+HXAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmlk0X9gefDNCHKEO5t3L6yggYRtv7sTOL9q
 Yg3Cid3408HDL2Wjtf/r+b/0mzm3VBkXMur+qS7h8aIIxZ8GXFJNhMi6ehJRmCRpIwMzr2g1
 ijkAidwkQOj7VWaeVTiQi0yM9vHAMcgxU/XyARxZD5ELVB4Ot3xhEreHrNqFYQaGBtLkaYvH
 6ZYIZ3ZahmNIxyekwkggVDGhNUKXDyghB6UPjrjZz46fpV6QBfO9MOidQzqnBTixALu3Sfii
 9VMDj/mfKc=
IronPort-HdrOrdr: A9a23:DA7kkKO52UPx/MBcT2H155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjzjSWE9Ar4WBkb6LS90DHpewKTyXcH2/hvAV7EZnimhILIFvAs0WKG+Vzd8kLFh5ZgPM
 tbAspD4ZjLfCVHZKXBkUmF+rQbsaK6GcmT7I+0pRoMPGJXguNbnn1E426gYxdLrWJ9dP0E/e
 +nl7N6Tk2bCBIqh6qAdxw4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1Ssl
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGYFq/QpF5d1H2mxa1+
 UkkC1QefibLEmhJ11dlCGdnzUIFgxes0MKh2Xo2kcL6vaJOg7SQ/Ax9L6xNCGptnbI9esMo5
 6ilQiixupqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MYiFW5uYd899RjBmcsa+S
 hVfbbhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zs93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkfgIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehT1Yd0s8LAp23FUgMyIeFOwC1zwdLkHqbrVn8ki
X-IronPort-AV: E=Sophos;i="5.90,245,1643691600"; 
   d="scan'208";a="68383440"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNYFKV9w6GL2ZrzHkrJwzbzUcQUZOpn+UBKECUgEN4W34qHBn8fkorfkRNMYM7cYjdeT7DATLZSObh1eh+2PXLi35n9jz+4opQ4k/EsDTAUiy1b/Nr5nOxeecj+52FCNoQCqyAkPx8sea8GVLFmqxu3m/FIUpm0JexuEJQ2FjKUo0BpZBIptoRF3gxWb/8N8DlBnow4l8no/mudZE1f9eCb3eSd83RgiYFjVgbKWKck8Y7uuhyCDhM9Occ69vhK76PWo1NM1RbTT2p3pMvSnBIQ1MfUC/i+yuJDEEl5DbAMN5451/By7YxNtJ6/4ijq56ZY1ZAYrRer0H1AUEFZHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OMeak4hfaNzOmfDzZPjGqMl6ofgNZCXLnCiqHXqFrg=;
 b=SlUJCZ+yn6mxtDk6NmxBNWXpgwlJFMQX1bwgED5GXtEp62gbzzPCrqPbPDMRP7GtoTkZ0QKJKANamwiq013Vn7mfcHDxuV0jO0VdLuKF7PrFJrz8e01OzDAiI+v0nTnTg6tYcU4qM51r53ACxzcfIEBPtoVAcSE+C5EKM0az8ZRK2Qn0F7L07jKMxJpC7CmpOL5dDCNUhb9iuwvLIR9r6VNyEl9WG8ANC0Qx9xRQLXoPHmQwMPGP9DdvHWPEJEsarDeY3o5wIKQZmhbGdeOzM7gIcR6MHNG4pgs11BYz75+/iELqrQKny2/7wpbWQuNbZTB0KerU7XXBXh3yd7xUxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OMeak4hfaNzOmfDzZPjGqMl6ofgNZCXLnCiqHXqFrg=;
 b=vfz5tDZ9ITO5fi8r5hZv43di9D4Ad3q9tkdlQBZSXfGibdXuhrzmb6/PEpYv8aBNXdsxfExE39QMTz13odhusDyFYLQHlCTPP0opdd3TWPG05w/yUA28vyn8F/YC5NxE4Vp3XyqaNFR4NRODPSMHhVxd/a3am14/97Idnvcj5Bg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, osstest service owner
	<osstest-admin@xenproject.org>, George Dunlap <George.Dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Dario
 Faggioli" <dfaggioli@suse.com>
Subject: Re: [xen-4.12-testing test] 169199: regressions - FAIL
Thread-Topic: [xen-4.12-testing test] 169199: regressions - FAIL
Thread-Index: AQHYSlvwuwuenWmolE2vvQwyk4J/36zlmCOAgAATLgCAABUiAIAAGtAAgAAB2ACAAAJTgIAAAkOAgABDj4CAAAyygA==
Date: Fri, 8 Apr 2022 16:11:41 +0000
Message-ID: <e12ad0f2-b37f-e5f9-33c8-e7a5898b1384@citrix.com>
References: <osstest-169199-mainreport@xen.org>
 <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com>
 <Yk/tzuKq4D3mFEQu@Air-de-Roger>
 <a6c6901d-0f6f-f4f6-eba9-c3d169c30433@suse.com>
 <YlAWBom8O8d1lCpQ@Air-de-Roger>
 <ab27a3c3-a85d-b9aa-de0c-ca96f3e2a3fc@xen.org>
 <YlAZhWVFziwoL0rb@Air-de-Roger>
 <41fe950e-cbc8-1da9-02d2-733c6fe4bb7a@xen.org>
 <YlBUF0j8HEpRX8Hs@Air-de-Roger>
In-Reply-To: <YlBUF0j8HEpRX8Hs@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b74d2820-0ded-4732-655e-08da197a7840
x-ms-traffictypediagnostic: DM5PR03MB2665:EE_
x-microsoft-antispam-prvs: <DM5PR03MB2665420D8B041128C8589706BAE99@DM5PR03MB2665.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E/bdO1HF3EkA2Kk5MMKzcaXiv368fSB30YfWVfecq78ogv9Inw0L+ZXAu2rrqZTJxkOwDbSiy6Mjw8uqUlypLZ+IV2EyF4KuAC1+a/VTPq9os70Yo+11+Gs83tRyag34A4DzI5mrRYEaDFSzMfF238Jl1QCZmuiUUsRVUL3uhkNbEGmlMD3kV4E2xa4qBQd0bPkQA1E9HmQ/D42jF0Y+7uyK64qmL1LaCWGYewebK9ctvjU2rzI6gBYaPDGOHU+fz6YzQpKyVykMr79eQtbxAxgqaHhv+XRTZf5ohVdBor5LH2RxXUcueDtBM2eS/1kItsyK1RWxF+s/dVvlFwtbekacjkVWVgWFEAqAWWLrVG8qPlBHgYhXLzz2ow8317QpMOKBaVW3ZjByTuelzewuTqOScoAdIn0bLlxF4K7EHy2iL9YgzA/MTmUiWLg4MFt4xujCRaLIaQgyV+ltzScelPQEKGLIOA1TrzWWFWBAdr/j2iuzehrDBaflLmd/6ilQmkolcrPDmC97AMAP1s4Wt0PucQn7uwhGNGXpgHOIkLv0hRuylz5W4JWIOdzTm9z//FAI/Wy/SgTPWIOVGj30cs+sp54iOsFmT62ZZJcB1bFMv3NZNLeVUGk3F1a2/cf2uN9I+wp3EWOEyprUxWer5DG8DKY3EaC5/SC0KBrcWmTTMv4kLXXwiOyz7j4hQBkh3BC/sOykGsmKgHvx7pFMEdjKjWPyLDfcd/cDUPJat4+08/GF9T/BVMWtLS1hRKhHv0DQoWSsKGxD+6UGZLkb9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(66446008)(66946007)(91956017)(76116006)(86362001)(38070700005)(66556008)(186003)(26005)(53546011)(6506007)(316002)(508600001)(6512007)(4326008)(66476007)(64756008)(2906002)(82960400001)(54906003)(38100700002)(36756003)(2616005)(31686004)(5660300002)(83380400001)(122000001)(31696002)(8936002)(110136005)(71200400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUxEcUpEaTB3R3VCVlN1Q3pNR3RsUlpEcUZOL3JuVytXd2RwRXM0bVlwcjkr?=
 =?utf-8?B?QjBrM29ZcjRFZ00wR08xSWdNSEpxQjFmNGE2NVhaalhHZ093TlRzalE2MURw?=
 =?utf-8?B?Q0pDei9QeG9JbmJHZnQ0UDFlRXBURmYzMTlMbVppQW83S1JtcGJMT2VLTXhm?=
 =?utf-8?B?QTFIZUV2QTU0aXFUb1lsTUhzTTErOGhlbXZOTUV1ZEVYTFJxREY3RzM2Vjlk?=
 =?utf-8?B?dlFoOHhkNWkxdk40a2FXWVBKaFhaZnFnZm4vSVlheDVRWnBSQjZPdUo5V01M?=
 =?utf-8?B?eUVrLzJiV3JkN040SE0vc01udGR5cFBESWE4U3VhdmxpL1dsbk5OWUFQWnRF?=
 =?utf-8?B?YzFPdjFUU2hvaDdFM2E4VVhlZGlNSXVLTFNUNzRpcStUTlluOXdTUjNZYjBs?=
 =?utf-8?B?eUcwWVp4dDFQV3gxU3VPVkhtNndzTFpheFFxMzdkUXFJb29hTFNWZDEwaThS?=
 =?utf-8?B?bEwxVXVQaGR3bzFKcGR3RU9TSWpUTXl5bk05azFoR2hqNGIwbUQvbzZGcWJa?=
 =?utf-8?B?WDhHM2wxcGorU3FuU096MlcrQzFxZGNneWFJdnNQOFdhcWZiUnRRL0oyTzFX?=
 =?utf-8?B?dkRUQjR4aHViN1dHQytXejdLQVhOL2lCUVpoZks0dTRzNG5WWkJ1U25VeE1L?=
 =?utf-8?B?ekltRnV6WlZGc0tpTStudlhWaFBQMVRIZ3dwcTN5eVVpMW1qcUdoVlVsUS9E?=
 =?utf-8?B?aEErYW1xcmVDd2U0czRaVlE0ZHpqOGNGTzRxVXpYRXpySTNwNkpUYlVsWnRS?=
 =?utf-8?B?ZjM3Y1prdFJwNUlPWVpXWFk2SG03T2g2Um44L3FDeUFaL21UaHJibXp2VkVO?=
 =?utf-8?B?YlVyaUQ2ZjRWaW9zYUtMUnZFTUMwcG4vbjJnajBzU0dmR0l5Nm14dXZrd3F5?=
 =?utf-8?B?bWxrRHdBTVB6cjFQNHhjM3FuSHBuZ0x4czRxNGhsRE9UM0U3cllKZTMwM284?=
 =?utf-8?B?dWxTMXNPUVNlZHdPV3lZZGFzZ2RJRmE5eTJqdzJPdU9uYUthUkt6YnFGNVly?=
 =?utf-8?B?UzY2WTFSb2w2OHF5ekwrWmRxOGljNFliRmRjMjAycE4rb05tQjFEN0FXQU9M?=
 =?utf-8?B?SEU3aCt6cTUvYTdoMnMySDlMQkNldGo2NHV0bnRXT01CVTVveEpNZUgrUUEy?=
 =?utf-8?B?cURWSHphTWJpSUVXVEpkaFRuMlFhVW5oZzd1L0ZuV29ZRjIrcEVUSmVBODR3?=
 =?utf-8?B?Z1cvNTFjQ2xtdmJMUGY5WnRpWVNWRXVtNmRscjd4d2I5b1locFF6UzN5RGVW?=
 =?utf-8?B?NWhBTWFmR0hNalFtVjVHbVdJQURoWGlwbnk5WCtqWVlSSEkwQi85MytNdm5p?=
 =?utf-8?B?VE5HcDE1QmFhbFU4VkFCdWhRMGllbXoxTjJnS0o5TGZzZy9kQW1qaDMwZXE3?=
 =?utf-8?B?emxEWFIzSlpOc1VCMEF2VjdwYk80aDU3OWJJMmtPZ1BSVDZPKzAvbDdPdDNC?=
 =?utf-8?B?OE9VVnhuUzU3RGh4djEzR0pGSWd4dG5PTHdwL1pqSlgra3FnZ0QvdEVlQUxW?=
 =?utf-8?B?RG8rb0RJRGxmM2JrSlIyNnNYNGhQcE9tOURzSG1Zcm9HMUcwN1ZXVmFkQ2s1?=
 =?utf-8?B?d1ZHMEg3ZzRLRHVWK0NDckcxWDlyNTB1VjdvWUpyV2QzV0JtaC9OcDNDK0wr?=
 =?utf-8?B?c3VBOHNLUGJGMjJ1TkdrWE93Q0FiNllMdy91YU05ODNielJGU21mdkk1dmZX?=
 =?utf-8?B?VWRLQnAvRTJ1T01Lam0zakhqSjQ2b2xEb2gzTjFjZko2R3JWNXZ5dlpUd2tT?=
 =?utf-8?B?NEQ4V1Z5ZnNIa1FWQU9iMDBPTndKblJ2OWxaYU4renVRS1IxcktMMUVxVm5W?=
 =?utf-8?B?ZTIwdTdLdkNmbVJPVGVZVHlzZUF3RlBUOHp0aEZMOFUwMlF4SC9kbWU0Mjho?=
 =?utf-8?B?YTBOUE9TV2IyK2dUMUp0Wll3OFQ0NkRRb3ZIc0swYnRnQzlNenVtUUo3MWZu?=
 =?utf-8?B?blRiQjl1eEFGMXpBZEpzbkV2Ym0yQVJqZUhCSno5ZHlNOFpaNnpLNlRXYkdS?=
 =?utf-8?B?bzdVNG5Ja08veld3NXJQdVB1OHlGdXpka3RGWG9uV3g0QVJxZUx2Tk0xZDZk?=
 =?utf-8?B?b1pKVVdPcVgvU25pWU5DN2dvRlliekNobm1IeHQraFJySEV1b0VMUitQcEEy?=
 =?utf-8?B?NE9mclRDMGVzR1dXZWE5YVFjR291Wng0TUNueXg2cWhrdWNEaERld3pNV1po?=
 =?utf-8?B?Lzdvd0R5TDczbXpVN0V2TEZDNHR4YmNna1hseExCYjhNdTNFVEpGc1E4TzRh?=
 =?utf-8?B?MndWSW9heUlPWHBtLyt3YTRaaDJyTnVUY2RzUDBGejNaandCVGs4VmtEZlZm?=
 =?utf-8?B?di91eVVFMkFkYkxJM0xtNWpwTGJGK0MxYVhKTFlIMTExKzk0SDRuZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82F9E3F884961D47B5E69C5A37BE5BE5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74d2820-0ded-4732-655e-08da197a7840
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 16:11:41.9599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2BahW6N8KkkjeEnR/G5UwZxXmN4zonTYNfgHz/EFlRiqeFXMfDPhFc3hWY3LuvQrRdTEPYvBREAmjVJa89m8l9103S4Z+WhBmnCZ+g1u1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2665
X-OriginatorOrg: citrix.com

T24gMDgvMDQvMjAyMiAxNjoyNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBPbiBGcmksIEFw
ciAwOCwgMjAyMiBhdCAxMjoyNDoyN1BNICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBI
aSBSb2dlciwNCj4+DQo+PiBPbiAwOC8wNC8yMDIyIDEyOjE2LCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOg0KPj4+IE9uIEZyaSwgQXByIDA4LCAyMDIyIGF0IDEyOjA4OjAyUE0gKzAxMDAsIEp1bGll
biBHcmFsbCB3cm90ZToNCj4+Pj4gSGksDQo+Pj4+DQo+Pj4+IE9uIDA4LzA0LzIwMjIgMTI6MDEs
IFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4+IEkgY291bGQgYWRkIGEgc3VpdGFibGUg
ZG9tMF9tYXhfdmNwdXMgcGFyYW1ldGVyIHRvIG9zc3Rlc3QuICBYZW5TZXJ2ZXINCj4+Pj4+Pj4g
dXNlcyAxNiBmb3IgZXhhbXBsZS4NCj4+Pj4+PiBJJ20gYWZyYWlkIGEgZml4ZWQgbnVtYmVyIHdv
bid0IGRvLCB0aGUgbW9yZSB0aGF0IGlpcmMgdGhlcmUgYXJlDQo+Pj4+Pj4gc3lzdGVtcyB3aXRo
IGp1c3QgYSBmZXcgY29yZXMgaW4gdGhlIHBvb2wgKGFuZCB5b3UgZG9uJ3Qgd2FudCB0bw0KPj4+
Pj4+IG92ZXItY29tbWl0IGJ5IGRlZmF1bHQpLg0KPj4+Pj4gQnV0IHRoaXMgd29uJ3Qgb3ZlciBj
b21taXQsIGl0IHdvdWxkIGp1c3QgYXNzaWduIGRvbTAgMTYgdkNQVXMgYXQNCj4+Pj4+IG1vc3Qs
IGlmIHRoZSBzeXN0ZW0gaGFzIGxlc3MgdGhhbiAxNiB2Q1BVcyB0aGF0J3Mgd2hhdCB3b3VsZCBi
ZQ0KPj4+Pj4gYXNzaWduZWQgdG8gZG9tMC4NCj4+Pj4gQUZBSUNULCB0aGlzIGlzIG5vdCB0aGUg
Y2FzZSBvbiBBcm0uIElmIHlvdSBhc2sgMTYgdkNQVXMsIHRoZW4geW91IHdpbGwgZ2V0DQo+Pj4+
IHRoYXQgbnVtYmVyIGV2ZW4gaWYgdGhlcmUgYXJlIDggcENQVXMuDQo+Pj4+DQo+Pj4+IEluIGZh
Y3QsIHRoZSBkb2N1bWVudGF0aW9uIG9mIGRvbTBfbWF4X3ZjcHVzIHN1Z2dlc3RzIHRoYXQgdGhl
IG51bWJlcnMgb2YNCj4+Pj4gdkNQVXMgY2FuIGJlIG1vcmUgdGhhbiB0aGUgbnVtYmVyIG9mIHBD
UFVzLg0KPj4+IEl0IHdhcyBteSB1bmRlcnN0YW5kaW5nIHRoYXQgeW91IGNvdWxkIG9ubHkgYWNo
aWV2ZSB0aGF0IGJ5IHVzaW5nIHRoZQ0KPj4+IG1pbi1tYXggbm9tZW5jbGF0dXJlLCBzbyBpbiBv
cmRlciB0byBmb3JjZSAxNiB2Q1BVcyBhbHdheXMgeW91IHdvdWxkDQo+Pj4gaGF2ZSB0byB1c2U6
DQo+Pj4NCj4+PiBkb20wX21heF92Y3B1cz0xNi0xNg0KPj4+DQo+Pj4gT3RoZXJ3aXNlIHRoZSB1
c2FnZSBvZiAnX21heF8nIGluIHRoZSBvcHRpb24gbmFtZSBpcyBwb2ludGxlc3MsIGFuZCBpdA0K
Pj4+IHNob3VsZCBpbnN0ZWFkIGJlIGRvbTBfdmNwdXMuDQo+Pj4NCj4+PiBBbnl3YXksIEkgY291
bGQgdXNlOg0KPj4+DQo+Pj4gZG9tMF9tYXhfdmNwdXM9MS0xNg0KPj4+DQo+Pj4gV2hpY2ggaXMg
dW5hbWJpZ3VvdXMgYW5kIHNob3VsZCBnZXQgdXMgMSB2Q1BVIGF0IGxlYXN0LCBvciAxNnZDUFVz
IGF0DQo+Pj4gbW9zdC4NCj4+IFVuZm9ydHVuYXRlbHksIEFybSBkb2Vzbid0IHN1cHBvcnQgdGhl
IG1pbi1tYXggbm9tZW5jbGF0dXJlLg0KPiBIbSwgY2FuIHdlIHVwZGF0ZSB0aGUgY29tbWFuZCBs
aW5lIGRvY3VtZW50IHRoZW4/DQo+DQo+IFRoZXJlJ3Mgbm8gbWVudGlvbiB0aGF0IHRoZSBtaW4t
bWF4IG5vbWVuY2xhdHVyZSBpcyBvbmx5IGF2YWlsYWJsZSB0bw0KPiB4ODYuIEkgYXNzdW1lIGl0
J3Mgbm90IHBvc3NpYmxlIHRvIHNoYXJlIHRoZSBsb2dpYyBoZXJlIHNvIHRoYXQgYm90aA0KPiBB
cm0gYW5kIHg4NiBwYXJzZSB0aGUgb3B0aW9uIGluIHRoZSBzYW1lIHdheT8NCg0KVEJILCB0aGlz
IGVzcGVjaWFsbHkgd2FudHMgbW92aW5nIHRvIGNvbW1vbiBjb2RlLsKgIEl0J3MgYXRyb2Npb3Vz
IFVYIHRvDQpoYXZlIHBlci1hcmNoIHZhcmlhdGlvbnMgb24gdGhlIHN5bnRheCBmb3IgImhvdyBt
YW55IHZjcHVzIi4NCg0KPj4+IEJ1dCBnaXZlbiBKYW5zIHN1Z2dlc3Rpb24gd2UgbWlnaHQgd2Fu
dCB0byBnbyBmb3Igc29tZXRoaW5nIG1vcmUNCj4+PiBjb21wbGV4Pw0KPj4gSSB0aGluayB3ZSBh
bHJlYWR5IGhhdmUgc29tZSBrbm93bGVkZ2UgYWJvdXQgZWFjaCBIVyAoaS5lLiBncnViIHZzIHVi
b290KSBpbg0KPj4gT3NzdGVzdC4gU28gSSB0aGluayBpdCB3b3VsZCBiZSBmaW5lIHRvIGV4dGVu
ZCB0aGUga25vd2xlZGdlIGFuZCBhZGQgdGhlDQo+PiBudW1iZXIgb2YgQ1BVcy4NCj4gV2UgZG9u
J3QgbmVlZCB0byBzdG9yZSB0aGlzIGluZm9ybWF0aW9uIGFueXdoZXJlIEkgdGhpbmsuIFNpbmNl
IHdlDQo+IGZpcnN0IGluc3RhbGwgcGxhaW4gRGViaWFuIGFuZCB0aGVuIGluc3RhbGwgWGVuIHdl
IGNhbiBhbHdheXMgZmV0Y2gNCj4gdGhlIG51bWJlciBvZiBwaHlzaWNhbCBDUFVzIHdoZW4gcnVu
bmluZyBwbGFpbiBMaW51eCBhbmQgdXNlIHRoYXQgdG8NCj4gY2FsY3VsYXRlIHRoZSBhbW91bnQg
dG8gZ2l2ZSB0byBkb20wPw0KPg0KPiBKYW4gc3VnZ2VzdGVkIHVzaW5nIGNlaWwoc3FydChucl9j
cHVzKSkuDQoNCkknbSBnb2luZyB0byBwbGF5IGRldmlscyBhZHZvY2F0ZSBoZXJlLg0KDQpPdXIg
Q0kgc3lzdGVtIGhhZCBkZW1vbnN0cmF0ZWQgdGhhdCB0aGUgZGVmYXVsdCBiZWhhdmlvdXIgaW4g
WGVuIGlzDQpicm9rZW4uwqAgQW5kIHdlJ3JlIHNheWluZyAibGV0cyBib2RnZSBhcm91bmQgaXQg
aW4gdGhlIENJIHN5c3RlbSB0byBub3QNCnVzZSB0aGUgZGVmYXVsdCBiZWhhdmlvdXIiLg0KDQoN
ClRoZSBvbmx5IHVzZXItZnJpZW5kbHkgd2F5IG9mIHJlc29sdmluZyB0aGlzIGlzIHRvIGZpeCB0
aGUgZGVmYXVsdCBhbmQNCmxlYXZlIHRoZSBDSSBhbG9uZS4NCg0KfkFuZHJldw0K

