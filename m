Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52764D3985
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 20:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288037.488444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS1dy-0003d8-Kk; Wed, 09 Mar 2022 19:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288037.488444; Wed, 09 Mar 2022 19:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS1dy-0003aO-Gk; Wed, 09 Mar 2022 19:06:42 +0000
Received: by outflank-mailman (input) for mailman id 288037;
 Wed, 09 Mar 2022 19:06:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d6dl=TU=citrix.com=prvs=060aafcb7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nS1dx-0003aI-OL
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 19:06:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b650140-9fdc-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 20:06:39 +0100 (CET)
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
X-Inumbo-ID: 0b650140-9fdc-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646852799;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3ko7aNu7ldzqTgsm0KgJdKRF90vvCA4Ha2JKLEi48ZE=;
  b=U4xcGNyllq2w07P1UG70F3x5NJ5iNsWIRhkH3X/dmnMiiUuZOSeJ0LIq
   caDKkAqnP8OM59x7lwvsFEk1c5+9mfe9NnwvzCdwgHxQDUDE3eQUYLX4n
   JuR1YrXZOOXfgGHcX+BFo6pmqz1prA7SgST/hnYNO7PS1Mq9WwY+kr6Jd
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65849160
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/PBd5q3Q4BEDl+oDC/bD5SBxkn2cJEfYwER7XKvMYLTBsI5bpzYPz
 mBLXD+OOa7fZ2TxfIh1a4mxpkwC65OHnYU1S1Q+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw0IDia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1SrbqIezUwMJbwidsRdwYJDRlEMfZJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiDN
 5ZIMGQ3BPjGSx1SE3AxLY4Hp96L22XZeBlEl16Z/INitgA/yyQuieOwYbI5YOeiT8hPglyRo
 G6A+m3jGwwbL/SW0z/D+XWp7sfxmif8VJMXBaeP3Pdgi12OxUQeEBQTE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JPF8Uq5QfLzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 zehnc7tBDFpmK2YTzSa7Lj8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nczp4OPfr1JuvQ2i2m
 m3U6nhl71kOsSIV/7qj22j1sSuinaTYcQIR+VTJZliptQwsMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hzwoybLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNC6i8gjlmOMEZmOq7EMdGPxD4M4fFyhRErE3HE
 c3HGftA9F5DYUid8BK4Rv0GzZggzT0kyGXYSPjTlkr7j+XAOCTFFetZbjNii9zVCove8G05F
 P4Fa6O3J+h3CrWiMkE7D6ZIRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIORYc1Buvr6Qp
 BmVAxYAoHKm3CGvAVjaOxhLNeK0Nb4i/C1TAMDZFQvxs5TVSd30t/l3mlpeVeRPydGPOtYvF
 qhbIZrcWqoTItkFkhxEBaTAQEVZXE3DrSqFPja/YSh5eJhlRgfT/cTjcBep/y4LZhdbf+Nly
 1F8/ms3maY+ejk=
IronPort-HdrOrdr: A9a23:vUc6zqjvS8kC4MCXvKvrhW8aX3BQX/p13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+Orwc5VoLkmsk6KdjbNhXotKPzOW8ldATrsSlLcKqgeIc0aVm4886U
 4JSdk9NDSaNykesS+O2njeLz9W+qjizEnHv5a9855Fd3AQV4hQqyNCTiqLGEx/QwdLQbAjEo
 CH28ZBrz28PVwKc8WSHBA+LqX+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwI0l7X
 POn2XCl+meWrCAu1DhPl3ontVrcejau5t+7fm3+4Yowm+FsHfTWG0uYczAgNl/mpDW1L9jqq
 iwn/5nBbU315qZRBDInfO5szOQrgoG+jvsz0SVjmDkptG8TDUmC9BZjYYcaRfB7VE81esMmJ
 6j8ljpwaa/Nymw1RgVJuK4Ii1Chw6xuz4vgOQTh3tQXc8Xb6JQt5UW+AdPHJIJDEvBmfca+M
 EHNrCs2B5+GWnqEEwxflMftOBEck5DbStuGHJyyvB9+wIm7kxE8w==
X-IronPort-AV: E=Sophos;i="5.90,168,1643691600"; 
   d="scan'208";a="65849160"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLz1yH1M9QwkzrcxDTXDzNJLrB7pxODPdKWchjmYieCbNh3UVfffMEBh9p+aVGh2UU0p+8L2XCiExsbKaEIkL6BzT/HzeFbn4/jEZydSZUsnC4x9hfRRHpLnGb0B97AbtyXoe94x9D9HvpWieKZCNCqxV3ifSL/pC82f7gV8CemEI/WOw+86fAWhITEDFjctW1udIyE7C8kMURHLcFMSqY+pudmNj6z1QHVEDqrgC/1L+Az6JTCJsp3x7wFues2XFTkb/vkvxKKIviVctH/IZmDRphGstkN7C24vSNq4GNQot3jEmYJEpV0vJbTvxMxgxhbEKd1LCiQmkWWU3NQeKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ko7aNu7ldzqTgsm0KgJdKRF90vvCA4Ha2JKLEi48ZE=;
 b=Yp3f9ISL6JZUSHRdncHh6e4J78bPs4FfO3YfM504Jx3lErQn+RWG82jWv7X8ymHzIkDnRwIxg8x7c6X0e6PrQ5cnRxMzSGRLOPCCFY6U6gwLPW3fS4Asl5VFBKqgK88N6pywOoAlON1kyE/FyENANSNGTHI0ptbt3ey0RpQZQ66L8kQFFWV4jusw02HQ+6zv+Wo5k2SZLVJ7I5TlkHhC6W0n5PO694H2O8pNx/05WsYSPFOfC2XxjNgjVj1tRxYmAbqiwAjMFu942lsFWqcYc1dFyauJqJZ65DHMPkh4kSAxsb3ybhf5riDlktgwbUjpMKWZ4RBmQfP08fmoaPwXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ko7aNu7ldzqTgsm0KgJdKRF90vvCA4Ha2JKLEi48ZE=;
 b=YIMeUSvnWJ/SSmTs/EEIY7C7QO+y6cNQjkvy5w2ImT2NfRqu17oJO43bGkvT9l7dP7il8xloWX0lbkkUfeu5mvCrBBakHFRiSZUuCYdOW/YJtKx/kaybwQs/rHuGakhCWADhVeNus1uErQRIeZvUsCIuc9UcwuvQEsR32J4ctW0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] livepatch: set -f{function,data}-sections compiler
 option
Thread-Topic: [PATCH v3 2/2] livepatch: set -f{function,data}-sections
 compiler option
Thread-Index: AQHYMvNxmieyqH8SX0SDccReVIf6jKy1hkuAgAAKagCAAAelgIAAGJiAgAAEt4CAARULAIAADp6AgACSWgA=
Date: Wed, 9 Mar 2022 19:06:33 +0000
Message-ID: <b8dd5bfd-53b0-bed3-719f-d53e126a0e89@citrix.com>
References: <20220308134924.83616-1-roger.pau@citrix.com>
 <20220308134924.83616-3-roger.pau@citrix.com>
 <c35415ef-b3c1-cc1c-2fb2-aa2de2602cd5@suse.com>
 <YidsSmPV1Pqulp+h@Air-de-Roger>
 <9cce44ca-3e31-bc13-3c56-2811efc36d5b@suse.com>
 <YieHVbKjtXY8vpOn@Air-de-Roger>
 <d400722d-d5a2-5bc6-8c16-be1d8e8ee046@suse.com>
 <YihzsHCgjVd0g4b5@Air-de-Roger>
 <b0f67b74-3443-2b10-ae94-80a284269265@suse.com>
In-Reply-To: <b0f67b74-3443-2b10-ae94-80a284269265@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f7bd46b-13cb-44d8-a7b6-08da01ffed2b
x-ms-traffictypediagnostic: BYAPR03MB4247:EE_
x-microsoft-antispam-prvs: <BYAPR03MB424718AF335375DBD34C43FFBA0A9@BYAPR03MB4247.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W/5QCVKdWbUfKB6L8eGNHIHmFz5JZGTjp1Sahp16/izJU7JOQH7Tga3AU6kHFVQcx6yCDbHz+x11MvTAiJkLDAXtBWACqk86KMzpUYvP1f545f2OR8Zew3p0oLH7+8inj6XdFQ3joAKsdHR5rB3YCxrT40QedFjRszR0r1RP57cwLdUGtrfhbdT4X59swOdxVpqCPEOEo/4tT164bGeSEx2/oSYS8AoMQQ1TA/uxwhF2Uov/ErpiGarWy6NRlidVkA31YAMTrR/oDu/jwAcxWDjnuit90kdun6SSVpbKYdHhWTMOYY/p11l6uX3UmeO/92KWsI4WDW0/JaHVM67r7pR0YwZwRpBoKJR25mSiJAxh3yUCfb/dZuDFwGUyOJkPRGGW/MUCfAGtgLoSaeHtblQ+4YXANcc4WAxTY8BeDu0bMRREcfhM8YFFolp02TE7+1dcHDi1/b1AQwqUNGc3AUcyd3VVhfl/4wouU+1n7AYMvZMW8t8UHMiCqol8aDXk5X9OHMLIqW6yXTBiQGhZ/0D5zgO1affZ/2hjAGENn80I9thevcV2zlnbigdeWUAA5ahiOs+xwVmMuRshEFTpF/Wu697X5VjPlFA/A4TwXsjIEdS71RH2FPym3mquzL6ok7e5sxgl5cSRKSQCtZX8DnIZ82D02MN9NaozLCvD0gYnvOobgJXdiBCvasHBKdU/vBi4CqSJernY5top1vXrlCxh0Egfqf9/+yTrMMNqMja8EPXERidL2OxDQr36b1l35J2qDqeYnmNnDbg5tw1N2A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(66946007)(6506007)(6512007)(6486002)(26005)(38100700002)(186003)(122000001)(2616005)(53546011)(5660300002)(2906002)(71200400001)(8936002)(508600001)(66556008)(66446008)(66476007)(316002)(8676002)(76116006)(31686004)(64756008)(91956017)(38070700005)(82960400001)(54906003)(4326008)(6636002)(36756003)(110136005)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkZReXBIM20rYlRpckVuTlJtQ0Q3ZmFEQWlSb0V1QitzaHdvTlJWdWc0bnF1?=
 =?utf-8?B?Tmp1YU5aeXI1MTgxQm9HNy9wSGxXOGU2Y3YwbTdQVWJuOUYyYjZmN0pjcDRj?=
 =?utf-8?B?TTVKZFd3QnVBZDAwVHc2Q05JL2gxS1BwU0x0VmJoZklhK0hZODdaa21xWER3?=
 =?utf-8?B?Q2Q0Tm9RSENKaTFEcis2bnFsKzA4VU1NTWVGVzhQZjdyNitHQXZrWGVVVHFI?=
 =?utf-8?B?NXh1UUs4VmJVM2tuVTlxbEFvM3FHUFdnS0ROTU9JOVZpSzFQVHIrcjVrM3FM?=
 =?utf-8?B?ZG9mVW5KS1VsaWxoQm1aYkxpZEFWR1pzUjlEbU5qeDZibzlwdndNYisrMURk?=
 =?utf-8?B?bEllRVlnVzM1K1EwSkRUeGpLQkhaUTZ0WWVJeGthTDRmeHhUMjhxQm96NE9l?=
 =?utf-8?B?MXB0MlNYaU8xSkZ6RlVQbjZDbDNLU0dJY3VISDhBblVkMUJPamdHZXlqaFVr?=
 =?utf-8?B?MXZuazJoRHhtNDFyS0w1RkpGaEdNU3V1Y0dqd2l3T3Y0M3NTZmFkRjlqUmNm?=
 =?utf-8?B?WXdpTEZjYWVBUUprSFNBVXgwbXhJSEk0M0VYODRKd2REWVgrcDhUSHhCZzk1?=
 =?utf-8?B?YnlnMk1oQjJwWXBMT3M3eEpUSjdUZmVnNERzeFhnWDVZK25wWkZlMWVjQTg2?=
 =?utf-8?B?QlVHWHQ5NldRdXVxZFEyNmhUOHZEa3VrRWZQZndkQnNqNVcxU2ZIQUM3dXFN?=
 =?utf-8?B?T2Q0cG5Nbzd0V1RvTUNZTXFYdnBzMlFMN3BnaVgxNklSQThPelRNUlBjcUtx?=
 =?utf-8?B?dThhRkhYNFBwUHlrSUlEQ1JxUGVoN25TSTU2cGZQQkphN1hKWk5leFMvTjlJ?=
 =?utf-8?B?RHlySDVCM2pPVUhuT3pDdU9EL1RRRkN6N1NsbkQ4ZmFRRCsxOXRhOWN4b3Ez?=
 =?utf-8?B?T0Qza1ZTMksyOWgwSE00bHN5bm9XZ240V0JDaFhSZjNxYUVyVlBWNllidnQ4?=
 =?utf-8?B?SVZtQ0c3ZEZERER4eXZNdTdjZitJdERxT2ZjZmREbHE5ci9ZOHhNMzhEV0pP?=
 =?utf-8?B?cE1FdjJlV2NtWkM2RjZWUUQ1dTNhMTVwcmVndUlselY1WUNaVnZ3WGhoK01j?=
 =?utf-8?B?bDF3OXlMeDkxdzgwaUlCRnE0STBmd3ljWTJOL2hWTU9IeWlMMGVsYWFCV1do?=
 =?utf-8?B?Mmg3am1YWHE4a3FIS3pJN2VmblVSOEJuMyt3K1UrYjJsSmIxYmhua05kQlAw?=
 =?utf-8?B?UGs4Z1ExT1ljV004KzNtZmc4Q3FjWWdRYnJibUZIYUpZQ04yc212VDN0akZQ?=
 =?utf-8?B?T2xxRnRtcldaWloyTTdhQW0xeTc3ekhxL0lJSitybDBqN0hUUko2RWdhZWw1?=
 =?utf-8?B?NC82ZncvRThzUGs5R2JrWE02cmxiWC9RcjJZcDlWakZlN245ZUZvQmpYUGh1?=
 =?utf-8?B?U3VwaTJhOXJzT2ZCSS9mZHZHOWkyTGdBS2NFMW5GNG8vNFBkZXZaa2ZoN25D?=
 =?utf-8?B?Mk5BTnE3QllISkJyZnZteFpYQmdqKzd2RjRmNFdCTnJvdEFPbUZDeGZncXZV?=
 =?utf-8?B?TFkvSSs5NUpydWQ1UmNpd2FxZDF5NnBDUDZES2NNWjkxM1c5djBvMEp5Umlh?=
 =?utf-8?B?dC9kS05MUmVKbTEyNE5kcyszL1czRFZScmxmNHB6aHdoeGZkV1ZadE10dkVv?=
 =?utf-8?B?WlJaa2JTKzNoYWcyaUVzYmt4Q0F6eHFsR3F6VjZ0dWd3R2FaalhGK1NKWFlt?=
 =?utf-8?B?OFFEbzJqOUxjcWVMYjc0dHNDQzB3b2MzaU1qYWh5aGZ2LzFQMUhFTUxwL0hz?=
 =?utf-8?B?Mk15RVdBem1HZ25uc3EvRW1pc0w5Wmx2dEtuMzRnQ2VnY2hEbk1mUFFuQ1Zq?=
 =?utf-8?B?R3did2RQcFB5emZoZnJ1Z3Z1cTRjTU9yenhIM0FwV2ljdTI4VXdyLzNsYnhH?=
 =?utf-8?B?ZU4yT25pUjZoMFQvWk0vcGxjcEo2NmZselpiVm4xVG8xRlRYeFF6c2tvS3h4?=
 =?utf-8?B?Q2NjeElERWVuSjJLMUk3NUdKQTk4Ym15ZmdPVzVqaGlMTTRDeHNmcFptVWdj?=
 =?utf-8?B?Q3dnZFMzNDBnMmVWK0FuQ3FIUEVKaWtncm4zNDVYU1BSTTlTUzQwV2pBZ3Fx?=
 =?utf-8?B?dlh1M0IzcG5vbEVlOHQzNWlhTWhuc1dCNVQ3WVp5V2RKbWNuVGp0Z2VDdjAx?=
 =?utf-8?B?UCtlQ2VOcndrSC9KQmtnbGUwM2lscGVsTGpOUjVEd05WSHcyOXYzamxrNWs1?=
 =?utf-8?B?RVl0TnpVbDVQSEFTTnRNaGpXeVIxazc1c3JvdEJwdm9ZSGlNMVFzUm9SZXNV?=
 =?utf-8?B?ZXRyT3dGa3dZOWFGK0FKZy9xaDlRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D70A5FB313AC1748A3268DF68EA23BAE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7bd46b-13cb-44d8-a7b6-08da01ffed2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 19:06:33.2758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6QResOBQvXo5wkSJ5By+GYtw5EgYZRD/v2nzlOgVvvT0i6gjBGl5CgyyaD8thr3/nO7BWFzNLf5k5u1vPpmArm/FtLl+yAEicAljmjQUl58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4247
X-OriginatorOrg: citrix.com

T24gMDkvMDMvMjAyMiAxMDoyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjAzLjIwMjIg
MTA6MzAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+PiBPbiBUdWUsIE1hciAwOCwgMjAyMiBh
dCAwNTo1ODo0OVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAwOC4wMy4yMDIy
IDE3OjQxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+PiBPbiBUdWUsIE1hciAwOCwgMjAy
MiBhdCAwNDoxMzo1NVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDA4LjAz
LjIwMjIgMTU6NDYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4gT24gVHVlLCBNYXIg
MDgsIDIwMjIgYXQgMDM6MDk6MTdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+
IE9uIDA4LjAzLjIwMjIgMTQ6NDksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4+Pj4+Pj4+IElm
IGxpdmVwYXRjaGluZyBzdXBwb3J0IGlzIGVuYWJsZWQgYnVpbGQgdGhlIGh5cGVydmlzb3Igd2l0
aA0KPj4+Pj4+Pj4gLWZ7ZnVuY3Rpb24sZGF0YX0tc2VjdGlvbnMgY29tcGlsZXIgb3B0aW9ucywg
d2hpY2ggaXMgcmVxdWlyZWQgYnkgdGhlDQo+Pj4+Pj4+PiBsaXZlcGF0Y2hpbmcgdG9vbHMgdG8g
ZGV0ZWN0IGNoYW5nZXMgYW5kIGNyZWF0ZSBsaXZlcGF0Y2hlcy4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+
PiBUaGlzIHNob3VsZG4ndCByZXN1bHQgaW4gYW55IGZ1bmN0aW9uYWwgY2hhbmdlIG9uIHRoZSBo
eXBlcnZpc29yDQo+Pj4+Pj4+PiBiaW5hcnkgaW1hZ2UsIGJ1dCBkb2VzIGhvd2V2ZXIgcmVxdWly
ZSBzb21lIGNoYW5nZXMgaW4gdGhlIGxpbmtlcg0KPj4+Pj4+Pj4gc2NyaXB0IGluIG9yZGVyIHRv
IGhhbmRsZSB0aGF0IGVhY2ggZnVuY3Rpb24gYW5kIGRhdGEgaXRlbSB3aWxsIG5vdyBiZQ0KPj4+
Pj4+Pj4gcGxhY2VkIGludG8gaXRzIG93biBzZWN0aW9uIGluIG9iamVjdCBmaWxlcy4gQXMgYSBy
ZXN1bHQgYWRkIGNhdGNoLWFsbA0KPj4+Pj4+Pj4gZm9yIC50ZXh0LCAuZGF0YSBhbmQgLmJzcyBp
biBvcmRlciB0byBtZXJnZSBlYWNoIGluZGl2aWR1YWwgaXRlbQ0KPj4+Pj4+Pj4gc2VjdGlvbiBp
bnRvIHRoZSBmaW5hbCBpbWFnZS4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBUaGUgbWFpbiBkaWZmZXJl
bmNlIHdpbGwgYmUgdGhhdCAudGV4dC5zdGFydHVwIHdpbGwgZW5kIHVwIGJlaW5nIHBhcnQNCj4+
Pj4+Pj4+IG9mIC50ZXh0IHJhdGhlciB0aGFuIC5pbml0LCBhbmQgdGh1cyB3b24ndCBiZSBmcmVl
ZC4gLnRleHQuZXhpdCB3aWxsDQo+Pj4+Pj4+PiBhbHNvIGJlIHBhcnQgb2YgLnRleHQgcmF0aGVy
IHRoYW4gZHJvcHBlZC4gT3ZlcmFsbCB0aGlzIGNvdWxkIG1ha2UgdGhlDQo+Pj4+Pj4+PiBpbWFn
ZSBiaWdnZXIsIGFuZCBwYWNrYWdlIHNvbWUgLnRleHQgY29kZSBpbiBhIHN1Yi1vcHRpbWFsIHdh
eS4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBPbiBBcm0gdGhlIC5kYXRhLnJlYWRfbW9zdGx5IG5lZWRz
IHRvIGJlIG1vdmVkIGFoZWFkIG9mIHRoZSAuZGF0YQ0KPj4+Pj4+Pj4gc2VjdGlvbiBsaWtlIGl0
J3MgYWxyZWFkeSBkb25lIG9uIHg4Niwgc28gdGhlIC5kYXRhLiogY2F0Y2gtYWxsDQo+Pj4+Pj4+
PiBkb2Vzbid0IGFsc28gaW5jbHVkZSAuZGF0YS5yZWFkX21vc3RseS4gVGhlIGFsaWdubWVudCBv
Zg0KPj4+Pj4+Pj4gLmRhdGEucmVhZF9tb3N0bHkgYWxzbyBuZWVkcyB0byBiZSBzZXQgdG8gUEFH
RV9TSVpFIHNvIGl0IGRvZXNuJ3QgZW5kDQo+Pj4+Pj4+PiB1cCBiZWluZyBwbGFjZWQgYXQgdGhl
IHRhaWwgb2YgYSByZWFkLW9ubHkgcGFnZSBmcm9tIHRoZSBwcmV2aW91cw0KPj4+Pj4+Pj4gc2Vj
dGlvbi4gV2hpbGUgdGhlcmUgbW92ZSB0aGUgYWxpZ25tZW50IG9mIHRoZSAuZGF0YSBzZWN0aW9u
IGFoZWFkIG9mDQo+Pj4+Pj4+PiB0aGUgc2VjdGlvbiBkZWNsYXJhdGlvbiwgbGlrZSBpdCdzIGRv
bmUgZm9yIG90aGVyIHNlY3Rpb25zLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFRoZSBiZW5lZml0IG9m
IGhhdmluZyBDT05GSUdfTElWRVBBVENIIGVuYWJsZSB0aG9zZSBjb21waWxlciBvcHRpb24NCj4+
Pj4+Pj4+IGlzIHRoYXQgdGhlIGxpdmVwYXRjaCBidWlsZCB0b29scyBubyBsb25nZXIgbmVlZCB0
byBmaWRkbGUgd2l0aCB0aGUNCj4+Pj4+Pj4+IGJ1aWxkIHN5c3RlbSBpbiBvcmRlciB0byBlbmFi
bGUgdGhlbS4gTm90ZSB0aGUgY3VycmVudCBsaXZlcGF0Y2ggdG9vbHMNCj4+Pj4+Pj4+IGFyZSBi
cm9rZW4gYWZ0ZXIgdGhlIHJlY2VudCBidWlsZCBjaGFuZ2VzIGR1ZSB0byB0aGUgd2F5IHRoZXkN
Cj4+Pj4+Pj4+IGF0dGVtcHQgdG8gc2V0ICAtZntmdW5jdGlvbixkYXRhfS1zZWN0aW9ucy4NCj4+
Pj4+Pj4+DQo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4NCj4+Pj4+Pj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCj4+Pj4+Pj4NCj4+Pj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRz
LlMNCj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMNCj4+Pj4+Pj4+IEBAIC04
OCw2ICs4OCw5IEBAIFNFQ1RJT05TDQo+Pj4+Pj4+PiAgICAgICAgICooLnRleHQudW5saWtlbHkg
LnRleHQuKl91bmxpa2VseSAudGV4dC51bmxpa2VseS4qKQ0KPj4+Pj4+Pj4gIA0KPj4+Pj4+Pj4g
ICAgICAgICAqKC50ZXh0KQ0KPj4+Pj4+Pj4gKyNpZmRlZiBDT05GSUdfQ0NfU1BMSVRfU0VDVElP
TlMNCj4+Pj4+Pj4+ICsgICAgICAgKigudGV4dC4qKQ0KPj4+Pj4+Pj4gKyNlbmRpZg0KPj4+Pj4+
Pj4gICAgICAgICAqKC50ZXh0Ll9feDg2X2luZGlyZWN0X3RodW5rXyopDQo+Pj4+Pj4+PiAgICAg
ICAgICooLnRleHQucGFnZV9hbGlnbmVkKQ0KPj4+Pj4+PiBUaGVzZSBsYXN0IHR3byBub3cgd2ls
bCBub3QgaGF2ZSBhbnkgZWZmZWN0IGFueW1vcmUgd2hlbg0KPj4+Pj4+PiBDQ19TUExJVF9TRUNU
SU9OUz15LiBUaGlzIG1heSBoYXZlIHVuZGVzaXJhYmxlIGVmZmVjdHMgb24gdGhlDQo+Pj4+Pj4+
IG92ZXJhbGwgc2l6ZSB3aGVuIHRoZXJlIGlzIG1vcmUgdGhhbiBvbmUgb2JqZWN0IHdpdGggYQ0K
Pj4+Pj4+PiAudGV4dC5wYWdlX2FsaWduZWQgY29udHJpYnV0aW9uLiBJbiAuZGF0YSAuLi4NCj4+
Pj4+PiBBZ3JlZWQuIEkgd29uZGVyZWQgd2hldGhlciB0byBtb3ZlIHRob3NlIGFoZWFkIG9mIHRo
ZSBtYWluIHRleHQNCj4+Pj4+PiBzZWN0aW9uLCBzbyBsaWtlbHk6DQo+Pj4+Pj4NCj4+Pj4+PiAg
ICAgICAgKigudGV4dC51bmxpa2VseSAudGV4dC4qX3VubGlrZWx5IC50ZXh0LnVubGlrZWx5Liop
DQo+Pj4+Pj4NCj4+Pj4+PiAgICAgICAgKigudGV4dC5wYWdlX2FsaWduZWQpDQo+Pj4+Pj4gICAg
ICAgICooLnRleHQuX194ODZfaW5kaXJlY3RfdGh1bmtfKikNCj4+Pj4+PiAgICAgICAgKigudGV4
dCkNCj4+Pj4+PiAjaWZkZWYgQ09ORklHX0NDX1NQTElUX1NFQ1RJT05TDQo+Pj4+Pj4gICAgICAg
ICooLnRleHQuKikNCj4+Pj4+PiAjZW5kaWYNCj4+Pj4+IFBlcmhhcHM7IEknbSBub3QgcmVhbGx5
IHdvcnJpZWQgb2YgLnRleHQuX194ODZfaW5kaXJlY3RfdGh1bmtfKiwNCj4+Pj4+IHRob3VnaC4g
V2hlbiBhZGRpbmcgLnRleHQuKiB0aGF0IG9uZSBjYW4gbGlrZWx5IGdvIGF3YXkuDQo+Pj4+Pg0K
Pj4+Pj4+IEZXSVcsIExpbnV4IHNlZW1zIGZpbmUgdG8gcGFja2FnZSAudGV4dC5wYWdlX2FsaWdu
ZWQgdG9nZXRoZXIgd2l0aCB0aGUNCj4+Pj4+PiByZXN0IG9mIC50ZXh0IHVzaW5nIHRoZSAudGV4
dC5bMC05YS16QS1aX10qIGNhdGNoLWFsbC4NCj4+Pj4+IFRoZXJlJ3Mgbm8gcXVlc3Rpb24gdGhp
cyBpcyBmdW5jdGlvbmFsbHkgZmluZS4gVGhlIHF1ZXN0aW9uIGlzIGhvdw0KPj4+Pj4gbWFueSBl
eHRyYSBwYWRkaW5nIGFyZWFzIGFyZSBpbnNlcnRlZCBiZWNhdXNlIG9mIHRoaXMuDQo+Pj4+Pg0K
Pj4+Pj4+Pj4gQEAgLTI5Miw5ICsyOTUsNyBAQCBTRUNUSU9OUw0KPj4+Pj4+Pj4gIA0KPj4+Pj4+
Pj4gICAgREVDTF9TRUNUSU9OKC5kYXRhKSB7DQo+Pj4+Pj4+PiAgICAgICAgICooLmRhdGEucGFn
ZV9hbGlnbmVkKQ0KPj4+Pj4+Pj4gLSAgICAgICAqKC5kYXRhKQ0KPj4+Pj4+Pj4gLSAgICAgICAq
KC5kYXRhLnJlbCkNCj4+Pj4+Pj4+IC0gICAgICAgKiguZGF0YS5yZWwuKikNCj4+Pj4+Pj4+ICsg
ICAgICAgKiguZGF0YSAuZGF0YS4qKQ0KPj4+Pj4+Pj4gICAgfSBQSERSKHRleHQpDQo+Pj4+Pj4+
IC4uLiB0aGlzIGNvbnRpbnVlcyB0byBiZSBuYW1lZCBmaXJzdC4gSSB3b25kZXIgd2hldGhlciB3
ZSB3b3VsZG4ndA0KPj4+Pj4+PiB3YW50IHRvIHVzZSBTT1JUX0JZX0FMSUdOTUVOVCAoaWYgYXZh
aWxhYmxlKSBpbnN0ZWFkIGluIGJvdGggcGxhY2VzLg0KPj4+Pj4+IFdlIGNvdWxkIHVzZSB0aGUg
Y29tbWFuZCBsaW5lIG9wdGlvbiBpZiBhdmFpbGFibGUNCj4+Pj4+PiAoLS1zb3J0LXNlY3Rpb249
YWxpZ25tZW50KSB0byBzb3J0IGFsbCB3aWxkY2FyZCBzZWN0aW9ucz8NCj4+Pj4+IERlcGVuZHMg
b24gdGhlIHNjb3BlIG9mIHRoZSBzb3J0aW5nIHRoYXQgd291bGQgcmVzdWx0IHdoZW4gZW5hYmxl
ZA0KPj4+Pj4gZ2xvYmFsbHkgbGlrZSB0aGlzLg0KPj4+PiBJJ20gbm90IHN1cmUgSSdtIGZvbGxv
d2luZy4gRG9uJ3Qgd2UgZ2VuZXJhbGx5IHdhbnQgdG8gc29ydCBieQ0KPj4+PiBhbGlnbm1lbnQg
aW4gb3JkZXIgdG8gYXZvaWQgYWRkaW5nIHVubmVjZXNzYXJ5IHBhZGRpbmcgYXMgbXVjaCBhcw0K
Pj4+PiBwb3NzaWJsZT8NCj4+Pj4NCj4+Pj4gRm9yIGFueSB3aWxkY2FyZCBzZWN0aW9ucyB3ZSBy
ZWFsbHkgZG9uJ3QgY2FyZSBhbnltb3JlIGhvdyB0aGV5IGFyZQ0KPj4+PiBzb3J0ZWQ/DQo+Pj4g
U3VyZS4gUXVlc3Rpb24gaXMgd2hldGhlciBzb3J0aW5nIGlzIGxpbWl0ZWQgdG8gd2l0aGluIGFu
eSBzaW5nbGUNCj4+PiAqKC4uLikgY29uc3RydWN0LCBvciB3aGV0aGVyIGl0IGNvdWxkIGV4dGVu
ZCB0byBhZGphY2VudCBvbmVzLiBJT1cNCj4+PiB3aGV0aGVyIHRoZSBjb21tYW5kIGxpbmUgb3B0
aW9uIHN0cmljdGx5IGlzIGEgcmVwbGFjZW1lbnQgb2YgYWRkaW5nDQo+Pj4gU09SVF9CWV9BTElH
Tk1FTlQgdG8gZXZlcnkgb25lIG9mIHRoZXNlIGNvbnN0cnVjdHMuDQo+PiBBRkFJQ1QgdGhlIGNv
bW1hbmQgbGluZSBvcHRpb24gd2lsbCBoYXZlIHRoZSBlZmZlY3Qgb2Ygc2V0dGluZyB0aGUNCj4+
IHNvcnRpbmcgb2YgYW55IHdpbGRjYXJkIGNvbnRhaW5pbmcgc2VjdGlvbnMgdG8gdXNlIFNPUlRf
QllfQUxJR05NRU5ULg0KPj4gSWU6IC5kYXRhLiogd291bGQgYmVjb21lIFNPUlRfQllfQUxJR05N
RU5UKC5kYXRhLiopOg0KPj4NCj4+ICooLmRhdGEgU09SVF9CWV9BTElHTk1FTlQoLmRhdGEuKikp
DQo+Pg0KPj4gSSd2ZSB0YWtlbiBhIGxvb2sgYXQgdGhlIGJpbnV0aWxzIGxkIHNvdXJjZSBhbmQg
dGhhdCBzZWVtcyB0byBiZSB0aGUNCj4+IGNhc2UsIGFueSB3aWxkY2FyZCBjb250YWluaW5nIGVu
dW0gd2lsbCBnZXQgaXQncyBzb3J0aW5nIHNldCB0byBieQ0KPj4gYWxpZ25tZW50IChidXQgSSdt
IG5vdCBmYW1pbGlhciB3aXRoIGxkIGNvZGUgc28gSSBtaWdodCBiZSBtaXNzaW5nDQo+PiBwaWVj
ZXMpLg0KPiBPa2F5IC0gd2h5IGRvbid0IHdlIHRyeSB0aGF0IHRoZW4gKGluIGEgc2VwYXJhdGUg
cGF0Y2gsIHNvIGl0J3MgZ29pbmcNCj4gdG8gYmUgZWFzeSB0byByZXZlcnQpPyBGb3IgdGhlIHBh
dGNoIGhlcmUgYWxsIEknZCBsaWtlIHRvIGFzayBmb3IgaXMNCj4gdG8ga2VlcCAudGV4dC5wYWdl
X2FsaWduZWQgZW51bWVyYXRlZCBleHBsaWNpdGx5IChhbmQgdGhlIHdpbGRjYXJkDQo+IHBsYWNl
ZCBhZnRlciBpdCwgb2J2aW91c2x5KS4NCg0KSSdtIG5vdCBjb252aW5jZWQgdGhpcyB3aWxsIGJl
IGFuIGltcHJvdmVtZW50LsKgIEl0IHdpbGwgbWFrZSBhIG1hcmdpbmFsDQpzcGFjZSBzYXZpbmcs
IGJ1dCBjb3N0IHJ1bnRpbWUgcGVyZm9ybWFuY2UgYnkgYnJlYWtpbmcNCmxvY2FsaXR5LW9mLXJl
ZmVyZW5jZSBpbnNpZGUgYSBUVS4NCg0KV2hhdCB3b3VsZCBtYWtlIGFuIGltcHJvdmVtZW50IChp
ZiB0aGlzIGlzbid0IGhvdyBpdCBhbHJlYWR5IHdvcmtzKSBpcw0KaGF2aW5nIGVhY2ggVFUgc29y
dCBieSBhbGlnbm1lbnQgb24gaXRzIG93biwgdGhlbiBsaW5rIGluIG9yZGVyLg0KDQp+QW5kcmV3
DQo=

