Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 116334D1827
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 13:45:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286809.486464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZD3-0001z9-Kv; Tue, 08 Mar 2022 12:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286809.486464; Tue, 08 Mar 2022 12:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZD3-0001vE-Gx; Tue, 08 Mar 2022 12:45:01 +0000
Received: by outflank-mailman (input) for mailman id 286809;
 Tue, 08 Mar 2022 12:45:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LykH=TT=citrix.com=prvs=059d7c239=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRZD2-0001v8-EY
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 12:45:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f2ceee1-9edd-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 13:44:58 +0100 (CET)
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
X-Inumbo-ID: 8f2ceee1-9edd-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646743498;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=z2H5/oE2TqMy9eFvJfN3TcZaowjw1O9wy1bgwYJdpws=;
  b=YN3goADjc5jJyI3XZiOtTugwMEHbSQNXhPyxrivyLbT/JRpGDmiMBRV+
   yjCWojy/WeWv4EvVcsJO0AE+e7RfJI+Kp7u1KxqiUJ5DTZJWpBsVkfq8f
   kqsyzHgbEZUfAvkvrXmYsFG5GfEhYq6tZC8b5MqNCH+0dN3zGlQzBYC9V
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65176978
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:akRZ7qP9StX9T0vvrR1ml8FynXyQoLVcMsEvi/4bfWQNrUp01zwDy
 jQfX26Hb6mPZGbyc99/YI618B4Ov8KHxtJjGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2t4w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 NhittuqQBYTBYbFpspaDQFBHwZTFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQK+BO
 ZtGOVKDajztXCARZE42I6smjaSZoljhSAVepHiK8P9fD2/7k1UqjemF3MDuUtmSQsVRl02bj
 mvD9nb+BFcWObS3yj2D6HugwPDOmSDTX5gbH7m1sPVthTW7w28OIBQTXEm8p7+1hyaWV9VSI
 UEQ0iMrpLo18gqnQ7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+ooByxfjIcPFU5TiY6Y0xb+8Dvh6wa20enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNOtTwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8R5n9hO0yT6FWy13N2YDB0xWirjUWW1C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKFHZo3EzPhfAgjuFfK0QfUcXY
 8zznSGEVypyNEia5GDuG7d1PUEDnEjSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOfQFiBSVqXvje9p0IHtNv1yI7QQnN/deKmuh/E2Gk9owI/tr1E
 oaVBhcImACh1CecdW1nqBlLMdvSYHq2llpiVQQENle0wXkzJ4Gp6aYUbZwserc7sudkyJZJo
 zMtIK1s3twnpuz7xgkg
IronPort-HdrOrdr: A9a23:5D/90ag2DgeUBVcNwQEjDglMGXBQX3R13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwRZVpQRvnhPtICRF4B8bsYOCUghrVEGgE1/qt/9SAIVyzygc578
 ldmsdFeaTN5DRB/KXHCUyDYqwdKbq8geGVbIXlvg9QpGhRAskKhWYYNu/YKDwMeOAvP+tjKH
 P23Lsim9PUQwVwUi3NPAhjYwGsnayoqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+WemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aKSARcR4Z
 vxSiUbToBOAkDqDyaISNzWqk/dOQMVmjrfIJmj8CLeSILCNWoH4oF69P1km1PimjQdVZdHof
 h2Niuixupq5VmrplWN2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZKIMvW0vFvLA
 BVNrCV2B+WSyLvU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegI28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1D8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/sukaSReoeMM4YDHRfzOmzGyfHQ0Mn3KverLs
 qOBA==
X-IronPort-AV: E=Sophos;i="5.90,164,1643691600"; 
   d="scan'208";a="65176978"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+lRp/KanVtXP+y48wGdm2s5wIvJ//VwcGGpeYhF/EuubCJB98JMx0DahsJ9j3A/ZyZxDA/0qRlSGadWXgI4ad/9D+6TNPXl5OkAzphz01Frp4D2KODaDaZBbE0oqg3bNJA/PEsmzN7LpQkY+9gGaFWjJwy1IzJ0px8JPkftBLUHlIexOQl+FVKd1//fCeeRP1UHpR706CoBGgh1PNE7VX+l8QpHdak+q0TaiZPcvByk6xk+S5Seq7aW4d+QbmeMn+3T1y6My9rqPJlK04lGEwnXtbZRyjTWV2/G55nilLNJ+oMffueWHQIQxFqeq5jA27CANXFpIwWAcedTibDleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2H5/oE2TqMy9eFvJfN3TcZaowjw1O9wy1bgwYJdpws=;
 b=Re1J/56BtPCmVwqJOubCxX1VnTWCsUZYyib0iz2lp0WvxkzRbW2BN7C4PrQhJ2CjtTmDs0VeBA4QbSUHIwoa8ujBxyUSXYWv5O9/+sdmogHHVLCVUytCGJOBTrv2SjiodK20KFdhNBSnivtCGuftnU8blXC3DdWO4QtfD+4gj4AK11D9WubbdWTTLDrPMDB9hBv1bwfqn8y+WXPBqvjeo5frVwxbctFWmtC4BLjtUa76O4ZIYYXrsWqZcwJ5SmjS2UcZtd3mO5/ItCiy0Q6K82oYodB54KHeANsHb0DqWcXtSgj4U5jsBqRKddeBIj0n1OuZy7ovhkT0u+oeYRbmmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2H5/oE2TqMy9eFvJfN3TcZaowjw1O9wy1bgwYJdpws=;
 b=nQP6v82nw4t2nADx89uztuiGfcAudFO0ZiLJt/IJgrxdS3k+dO/a3cf+oBz869k3GegkA9NwjptqeV02O0jZOqPXy1/ybrGI6NGk8O9iYJb7aWwOzMM6miJ+gwt5JKog8i86n7vDlOSKQlB0tTzY44nYh9MMzK6pTDz6WHptikg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Bjoern Doebel <doebel@amazon.de>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, "Roger
 Pau Monne" <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Thread-Topic: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Thread-Index: AQHYMteGcC582OJoEkS5PAkljujCDqy1bu8A
Date: Tue, 8 Mar 2022 12:44:54 +0000
Message-ID: <cf0be28d-090c-1881-5831-1d58696a9272@citrix.com>
References: <453c6e5decb315109a4fbf0065cc364129dca195.1646735357.git.doebel@amazon.de>
 <b91fc474832dd0ce07d223542316fba74afc35ee.1646735357.git.doebel@amazon.de>
In-Reply-To: <b91fc474832dd0ce07d223542316fba74afc35ee.1646735357.git.doebel@amazon.de>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ad8936b-9853-4898-4fc2-08da010171ea
x-ms-traffictypediagnostic: BN9PR03MB6107:EE_
x-microsoft-antispam-prvs: <BN9PR03MB6107280B0C51A2ACD3A9A1D9BA099@BN9PR03MB6107.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Obu4/Y3dQbPKP3UT+j+AxcBei1iikOOM3D7ENd3659CcpjgwWTSLcoaSEI1BS7nySfcbx4RjPQCiJdsGEo+yMfcR8ZUj4+ap2VX68qrKqo79q6BKTGMt7+znQO7KKn2D5xxgtplDu1ucI0cIMBG/KPD3n3KiJRaJUyo4PCkZ/cZQ62DmWQbT37QHgYTJMuZ7snK9hYY9m6V4jJt4OEKJ7bUnG3lEcBxm/08VhUTKoypFlrNLJTuqdlipjM2GoAINAUjufcf6WrNeULy7sUyGGAj0J/NQP4kOpAnBOF6j/20GVLjP6ljtN3DtQvg4BOseDw8/cTU6sYAUf5xsa9hjkRaoMLSHN0+koI0Eg3QV+0MLVKsbJgak1Tspj40Y5zwo9jiC/KksF9ZgZjiSyjrKNFKlcMe/8r8PVJ+YETr0gOMLSEqK9jbnIZDyj9aDH8VWrrgKjdO/vdLTrSRqbnO+TPVCnwU7sUR49RTHCVqWHAMVhmwW+phFfbMXlRHkEK1nHpSYl09pAcL2SHhyISRAle6j/pKSluVvljEalTmlnH6DUGeEwsXhg0MeucR6iCrAUDCyxCjElRyQ80LuRqSlY+E1ddSOlxl0LBwdLIDvz05hWCHIi6a4tzIDRF44Z7RD5G7sJqISbMuhQEw7HXvy3Ezqmgwxf5vbx9JVlHi4Isizz9+QvUci67ROenYl9AVbQVu4NFrytFfGxUX5/KJq68qDmidsTWED+kJI5X9KPltfdbJjawZJmhOjDiM+XZUUFLVxNrql8UDi2I+zkBPZGQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(66476007)(316002)(8676002)(54906003)(66946007)(64756008)(36756003)(66556008)(66446008)(38100700002)(2616005)(31696002)(38070700005)(91956017)(86362001)(8936002)(82960400001)(122000001)(5660300002)(2906002)(110136005)(6506007)(6512007)(26005)(186003)(107886003)(76116006)(53546011)(508600001)(6486002)(71200400001)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGtvWE5TUUZEWGZ6dW13aHlJK0NQWVhyMGFmb2dSdFFHWm9jcnFhd0hFMSs5?=
 =?utf-8?B?cTFFeDd1cHFzSXpTZlYxcTFzZ3ZNRjRoYTJ5N3lsSXlEWUplZ1hnRlZsa1d4?=
 =?utf-8?B?ak5vRE9Ldi9qcnJxYTVOMDFXRTZMVGRMK1pyNE5pWHZWcktkdjVHNmFUNXVT?=
 =?utf-8?B?QWkzNTVYUkpWR2xjSkxhK3l0VmM4OW4rY2FxUTlVaEsvYzNMaCtXV08ra21U?=
 =?utf-8?B?UGZlUnNmRCtpNTZkNlcvYTRTZk5uemF3WGdJZTlZSlZlcmlmcFA1UkxQWG40?=
 =?utf-8?B?b2lwUS9DWTZYallLNGkwZVBIMTR5TUhJTHVwTGltN3F3eW9MOHdqenNnbFlG?=
 =?utf-8?B?Y3RLRW04Q1IxSjg2MHNjOXNwMmxnVEd5cy94bFhxUG5sREY2V0trVjdudjcv?=
 =?utf-8?B?Y0g2dHRZYmpXbDIyR0haTXgxM3B2a29DTzV2cmNRQUNWbWVzQk10R1h1dWtT?=
 =?utf-8?B?bFovaE5PRnF3KzZMMU1oY0JXU0hTZDF4U2grelBxSXVDZVlrbXBKZCtvOE1z?=
 =?utf-8?B?cGYwYk12ejhmSFJkZEx3NnAxVCtROUFJL0hQNmgwTG9aYzJtbTArUDB6RDFJ?=
 =?utf-8?B?UFJCQjFhTWlNTzFsNSs2MEJsaTJoVWdjL1ExNURqME5WeUZEOGVaZWhLWHdJ?=
 =?utf-8?B?UDdTVzVjM3pERFljL3UyZzZrZ05IYlNEcFBzV2FiRENXM3RlSnM1M01Edkpn?=
 =?utf-8?B?cVhYT2ZMQ2pEQkk5SCtZN1hHYmlIWHZMVUtjVWVQMGdGc0lTNWZkcDB2dG56?=
 =?utf-8?B?THZucmRaZFV0Mm1ucWY3U0JuZ1JMUFRTbnpDaHU5dUFtbDRLeHgycy9qd05B?=
 =?utf-8?B?ZURwcmdzVVhtbjgrZzBZblN4QlBPanVodTRJZlk4VVNMWEFKN0lQS3c5dGxn?=
 =?utf-8?B?UE5FM0VwWS8vTHcvTjZYeThTYjIzYnc4Uis1OWRTcTB6c0dwM1Y5VTA0dmtD?=
 =?utf-8?B?VlV2MWlGQ2NCZHBLSXc2Y0V2NkEzSEtBLytxSWYxUWs1VVNxcDNPbTlub3dL?=
 =?utf-8?B?UWRvY2p5UnhIWkF6ZzJKK0tRUjJ0a0ZpeVJqbUR0LzI0ZVFEK3RwZ2xHZVhQ?=
 =?utf-8?B?M1pEZnZJenpPdGlwSm5tTkpNYk5JOUlJSEh0eW5OcEZiZ2YyMmpMUlg2clNs?=
 =?utf-8?B?Wnp4TXVRTWpKMXp2TldFU1ZPT3RpR01VcnhtOTV1Z0JLQUx1NkV0b1ZQT01Y?=
 =?utf-8?B?S0VyOExEZ2N0em05S3NzK0tzTWpiUE1rYXhuenMvUlRpOVl6cXJzUWR6V2l6?=
 =?utf-8?B?QTFmcDFwOTVtYjhMcXJ6aUhEdDZzaXljWmVJMFZjZmdFQXVIZmNrVVVGL0tK?=
 =?utf-8?B?N0JNbWx6ZDFBV0FrN0liK0o1aCtUVlp6dkNva1RhK1VtTkRXRHdtcFhYeHFN?=
 =?utf-8?B?YXZYZS9KSGlwdlZ2OWFrK2YrRk5lY1QzZDFYM1ozSGgzcjJteWg3ZFFFaUtC?=
 =?utf-8?B?bGRDNURQSDU1VzZEZDAxa2xHNzN4TUd3NWFZTUVOYU12Z2tweXNublBCY2tL?=
 =?utf-8?B?ZzdaRzhMYThGdnpTKy9uQ0VFcnN6b1pzWFRTTmFySUR0cDIwWnJWWXhQSjYx?=
 =?utf-8?B?T2RmdHFxQ0o1a2RacDRSV2diOWhyMm5WS0lWeDhsd0NqdzBmdXh2WUlYVGpK?=
 =?utf-8?B?TlRkdGd6TUkzNEVVMG9PVkZzNTBCV2orSU95cTZGOTUrNXhpc2pWQ2JaNWFF?=
 =?utf-8?B?UzFldkkvYUlHVTNIa0JIOUdKUXVGUjhzUW9abXV2MG1qMTdNQzRDZE9EZkxK?=
 =?utf-8?B?NjhGYjkrWmEvQjhGSE9oQ0NFS3p2bGFUUUlrenZTMkpGUzV0TlNhK3pEVUVi?=
 =?utf-8?B?RGU5OXkzbU1JUzlQcTh2VGRWRjI5VExvZnZsWTJvS0FOOUFNbTR2M0lONmhU?=
 =?utf-8?B?RXV4bGlMUEZuMW9XSFNMY3RCQTBKRThzRkpDb1phbVd5aGFFRk1SQ2k1TmJL?=
 =?utf-8?B?b2JuTmlaR2ZJVWxkbkI3SVhxa1o2SWVQcyt0VU1sd3YyckwzdHJNbmx6dVJE?=
 =?utf-8?B?dTBEMmZUNVFhMWJIeEV3bEFua1hycTRqSjlxTG90T0VwREh3eUh0QzM0Y1Q5?=
 =?utf-8?B?ZzNhV2V0RmZDTWZXWlRFNXNFM2hnM09EN0pIU05DbmNDS0dwTE0wb1hDSUFi?=
 =?utf-8?B?TkUyeU05ZjJGUkp0SS90TE1kdktPT1dBRy9BVUNyWHVwTHRjZDdQdTR0K2ZO?=
 =?utf-8?B?eS80WDhkenhveDlidVlvMkljaDJxSlA3b2N2M282b0VsM0ZyWldxeGZmRzE4?=
 =?utf-8?B?NUtBUnpPRGtFK01aUDI4SnRtalFBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B640A6BDB3F8FF418933CF3E7D99A40A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad8936b-9853-4898-4fc2-08da010171ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 12:44:54.3497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W29ShQxMGE9yBvTDSe57PIs5IfGL6nOWWInQ5iNdDpvw4LkAacj8HC7fmdR4hcZT1751SsRQzNo/ozNf3cYbP4ikjtFa+/mQdSWJ/QuhOKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6107
X-OriginatorOrg: citrix.com

T24gMDgvMDMvMjAyMiAxMDoyOSwgQmpvZXJuIERvZWJlbCB3cm90ZToNCj4gQEAgLTEwNCwxOCAr
MTIyLDM0IEBAIHZvaWQgbm9pbmxpbmUgYXJjaF9saXZlcGF0Y2hfcmV2aXZlKHZvaWQpDQo+ICAN
Cj4gIGludCBhcmNoX2xpdmVwYXRjaF92ZXJpZnlfZnVuYyhjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNo
X2Z1bmMgKmZ1bmMpDQo+ICB7DQo+ICsgICAgQlVJTERfQlVHX09OKHNpemVvZihzdHJ1Y3QgeDg2
X2xpdmVwYXRjaF9tZXRhKSAhPSBMSVZFUEFUQ0hfT1BBUVVFX1NJWkUpOw0KPiArDQo+ICAgICAg
LyogSWYgTk9QaW5nLi4gKi8NCj4gICAgICBpZiAoICFmdW5jLT5uZXdfYWRkciApDQo+ICAgICAg
ew0KPiAgICAgICAgICAvKiBPbmx5IGRvIHVwIHRvIG1heGltdW0gYW1vdW50IHdlIGNhbiBwdXQg
aW4gdGhlIC0+b3BhcXVlLiAqLw0KPiAtICAgICAgICBpZiAoIGZ1bmMtPm5ld19zaXplID4gc2l6
ZW9mKGZ1bmMtPm9wYXF1ZSkgKQ0KPiArICAgICAgICBpZiAoIGZ1bmMtPm5ld19zaXplID4gc2l6
ZW9mX2ZpZWxkKHN0cnVjdCB4ODZfbGl2ZXBhdGNoX21ldGEsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5zdHJ1Y3Rpb24pICkNCj4gICAgICAgICAgICAg
IHJldHVybiAtRU9QTk9UU1VQUDsNCj4gIA0KPiAgICAgICAgICBpZiAoIGZ1bmMtPm9sZF9zaXpl
IDwgZnVuYy0+bmV3X3NpemUgKQ0KPiAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAg
ICAgfQ0KPiAtICAgIGVsc2UgaWYgKCBmdW5jLT5vbGRfc2l6ZSA8IEFSQ0hfUEFUQ0hfSU5TTl9T
SVpFICkNCj4gLSAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsgICAgZWxzZQ0KPiArICAgIHsN
Cj4gKyAgICAgICAgLyoNCj4gKyAgICAgICAgICogU3BhY2UgbmVlZGVkIG5vdyBkZXBlbmRzIG9u
IHdoZXRoZXIgdGhlIHRhcmdldCBmdW5jdGlvbg0KPiArICAgICAgICAgKiBzdGFydHMgd2l0aCBh
biBFTkRCUjY0IGluc3RydWN0aW9uLg0KPiArICAgICAgICAgKi8NCj4gKyAgICAgICAgdWludDhf
dCBuZWVkZWQ7DQo+ICsNCj4gKyAgICAgICAgbmVlZGVkID0gQVJDSF9QQVRDSF9JTlNOX1NJWkU7
DQo+ICsgICAgICAgIGlmICggaXNfZW5kYnI2NChmdW5jLT5vbGRfYWRkcikgKQ0KPiArICAgICAg
ICAgICAgbmVlZGVkICs9IEVOREJSNjRfTEVOOw0KDQpUaGlzIHdvbid0IHdvcmsgZm9yIGNmX2Ns
b2JiZXIgdGFyZ2V0cywgSSBkb24ndCB0aGluay7CoCBUaGUgRU5EQlIgZ2V0cw0KY29udmVydGVk
IHRvIE5PUDQgYW5kIGZhaWxzIHRoaXMgY2hlY2ssIGJ1dCB0aGUgYWx0Y2FsbHMgY2FsbGluZw0K
b2xkX2Z1bmMgaGFkIHRoZWlyIGRpc3BsYWNlbWVudHMgYWRqdXN0ZWQgYnkgKzQuDQoNClRoZSBp
c19lbmRicjY0KCkgY2hlY2sgd2lsbCBmYWlsLCBhbmQgdGhlIDUtYnl0ZSBqbXAgd2lsbCBiZSB3
cml0dGVuIGF0DQp0aGUgc3RhcnQgb2YgdGhlIGZ1bmN0aW9uLCBhbmQgY29ycnVwdCB0aGUgaW5z
dHJ1Y3Rpb24gc3RyZWFtIGZvciB0aGUNCmFsdGNhbGwoKSdkIGNhbGxlcnMuDQoNCkxldCBtZSB3
cml0ZSBhbiBpbmNyZW1lbnRhbCBwYXRjaCB0byBoZWxwLg0KDQp+QW5kcmV3DQo=

