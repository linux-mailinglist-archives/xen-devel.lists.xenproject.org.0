Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB88636F67F
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 09:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120348.227619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcNoy-0005K8-RW; Fri, 30 Apr 2021 07:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120348.227619; Fri, 30 Apr 2021 07:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcNoy-0005Jg-LV; Fri, 30 Apr 2021 07:44:20 +0000
Received: by outflank-mailman (input) for mailman id 120348;
 Fri, 30 Apr 2021 07:44:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BfJ=J3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lcNow-0005JZ-Sc
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 07:44:19 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 023b2c80-5b0b-4afc-96cd-0cb0e8e19a80;
 Fri, 30 Apr 2021 07:44:17 +0000 (UTC)
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
X-Inumbo-ID: 023b2c80-5b0b-4afc-96cd-0cb0e8e19a80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619768657;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=Dq6GKUzU4g5H7mhTPxPPMezut9ETd44wAVunIYCqOk0=;
  b=Ir6rC+L+YSut90gORrvZcz9uapFCzgMzHbDjVAIURVEp7LKECfV6NmwL
   m6z+9QST314rZ6xv+sAvyANmn/wz2llGM+ZdjxWe4boMz15vA8RW9Two2
   2Q9qoKombEmlKq1SEThkSmnl5EwB1AMu2WJl1OTkEFOU7HeRr0lLQ5J0/
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CmmtWVDhNrgpOCuGTPYd3jtXyRp8nYaxKw5S618JswR3G9OSDvwW0UbgzJTyheXi7IjAYSSQAp
 cdZ+4kDXeRN0sYp2Xdcy29F/QVVPc0/rakNN69FyhStGHL4RT4+zDvyeecjkR4rpuRM7gS7Uye
 8oYpUi7WAvj4ikYHOyc33wOQ+IImSrySBPb4bvh5tMfTD9OcHnrmdWQFfglZHYks62fUqRmVrU
 Od31YHP++ymJnhmQ3g9ocwYirvXS/20k3pIZrR+zb/yOsQ2LNJawF6Fjs7S7icaAuxvIfrAAKn
 CT8=
X-SBRS: 5.1
X-MesageID: 42774803
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BbfsgKOtIfEpi8BcT4Hx55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAse9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrAHIMxbVstRQ3a
 IIScRDIfX7B1RikILe6A63D94vzLC8gdqVrM31pk0dKT1CQadm8gt/F0K6PyRNNUd7LLA+E4
 eR4dcCgjKmd2geYMjTPAh5Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uEg9n67Ek7G
 TDjkjF9ryu2svLhSP0+k3yy9BtmNXnwsZeH8DksKkoAxjllwrAXvUYZ5SspzYwydvfimoCtP
 npj1MeM99o63XXF1vF4SfF/wX7yj4h5zvD5Daj8ADeiPf0Tj47FMZN7LgxGnCyhipQ3+1U66
 5Xw3mf86NeEBKoplWm2/HzSxpomkCoyEBS9tI7sn1FXYMSLJ9XoIAPlXklaasoISPg5IgrVN
 RpFcHXjcwmF2+yUnaxhBgL/PWcGlAIWjuWSEkLvcKYlxJMmmpi8kcezMsD2l8d6ZMUUfB/lq
 f5G5UtsIsLYt4dbKp7CutEa9CwEHbxTRXFN3/XCUj7FZsAJ2nGp/fMkfcIzdDvXKZN4Io5mZ
 zHXl8dn3U1YVjSBcqH24AO1RzRXmOnX3DIxttF75Z0/p3wLYCbdBGreRQLqY+Nsv8fCsrUV7
 KYI5RNGcLuKmPoBMJHxAv7V55OKWQPUcEct9ohMmj+5f7jG8nPjKj2YfzTLL3iHXIPQWXkGE
 YOWzD1OYFB4ymQKznFqSmUf0moVl30/Jp2HqSf1fMU0pIxOopFtRVQjVy448qMOCBTq6BeRj
 omHJrX1oeA4UWm92fB6GtkfjBHCFxO3bnmW3RW4QkQM031dr4Hs86FeX9b2WaGIhMXdbKTLC
 dv43BMvY6nJZ2Zwi4vT/i9NHiBsncVrHWWC4sHlrab/sfjcJMgBpMgUKh8fD+7TyBdqEJPki
 NueQUETkjQGnfSkq2jloUTH/yaXcJ7mh2XLcldrm//uU2Qqdo0fGYSWyejXKes8F0TbgsRom
 c00qcExJKchD6kKAIE8ZgFGWwJTF7SPZVrI0CuYp5OlrXiZQdqJF36+gCyulUUYWrl90Ibm2
 r7CzabEMu7X2Z1smxE06rs7VN/fniceUU1cXxhrYhhDw39ywdO+P7Oaayp32SLbFwehukbLT
 HeeDMXZhhj3tatyXeu6Xu/PGRjw5hrJ/faBrg4ab3fs0ndXLGghOUDF/9Q8I0NDqGRjsYbFe
 aecRSSNjX2Fqcg3BGUvG8sPEBP2TIZuOKt3B3u926j2nEjRfLUPVR9XrkeZ9WR9XLtSfrN0J
 J3i7sOzKGNG3S0bt6N0qfMaTFfbhvVvG6tVukt7YlOorhajsoEI7DLFT/TkH1X1hQ3K8n50E
 sYXaRg+bjEfotiZdYbdS5V9kcg/e7/YHcDo0jzGKszbFsth3jUM5eS773EpaEmD0eBqAHzUG
 PvuxF17rPARW+OxLQaA6U/LSBKc0A68m1l5/7HeIvKCgmmHtszi2aSIzu4avtaR6eEE7lL8U
 o/7NGMguONdy33nArXpiB2J6pS82ChBcO+aTj8a9Jg4pi/IxCLhKDv/cu4yDHwQjG/Y14DhY
 JEeVcLB/4zwwUKnckyyGyqVqfzokg5iFNQ7jFsi0711uGdkRTmNFADNRecn45fUjZSOGWZlM
 jJ8eCX03Lm/ThOsKOzYXt4b5VJANgfTo/+MidoJ4wRpdeTjtoSvhg=
X-IronPort-AV: E=Sophos;i="5.82,260,1613451600"; 
   d="scan'208";a="42774803"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2ubLyBmeZwKvsd7I0EEvEuAxgonvrvcliYvDnvsv3eOlf8SzPz253hz/u1Bou5LJ25BC5d42ubFsP5/r1l3kHtVX6k/4gpx2KGaQAyXj1TV+GrVddjcYDltMjihkBdDjYYD2TL4ztg4ZRFkhvdyoLPujzR17XpGWbqX5y1/S4a7WZ7fVG1QbrG0NFp3mIfkEmyZeBNShHBwvxF0TGgQiFORuT/O0S8/+feY9M0iv81h3hzz7ZVgRbDVvyCoX//KOc5Nh+XJAdJXib1g7UgLyCPlUBLpw9ufX1Hdl4BrOkxuKpxk5Q89CJgJEbqACBUjMCrnTtAolmRMQ+IuOMEmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dq6GKUzU4g5H7mhTPxPPMezut9ETd44wAVunIYCqOk0=;
 b=Fs8Wr/RFFOVUkL4YQi+QoID6L5F/+JHRXmHAUI2dOJqE/TDgiWkycoXbwSauAiux51yq2cEWKw6faSaUBYgO3RkyCTnOZxBgePLl7cV342QnJAKGBO7RMOJcXHmqUJfhEcKPAxjyRz9JD0EtDXZA8WcIDz6yEKbov5BW7T1ESNeKND0sTQPmsOGjOxpdbPRt1AJsuhErYiHiBhThHMhtw52e1QDITZYEDIJvFxM45CfksgR4xKSpQbAoyb9yto/wTe8x2mSjVJvPJkFjrbKNL0K/K6+VSxt9tDxTh+vVUUzl8tyueL9piVn93IsLEV6yRIpil0CSpx5aMKh5TOoj9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dq6GKUzU4g5H7mhTPxPPMezut9ETd44wAVunIYCqOk0=;
 b=GbJlhuXGU291qllFI7vAv3xShe9CyD6d2oySQ/H3xrRSzHJDbDaDHi5zDKGK+0szlEYjqUNS62KnLVqWYDXBYgjoTGbhhgfJbjI1Y1Ff2FqFVmXAndMMtivDS39KBNwE+aelHL+iDTEW5nJTarIHryZ/GIIgRmD5LhB1w/Q9qyk=
From: George Dunlap <George.Dunlap@citrix.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "intel-xen@intel.com"
	<intel-xen@intel.com>, "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Sergey Dyasli
	<sergey.dyasli@citrix.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, "Kevin
 Pearson" <kevin.pearson@ortmanconsulting.com>, Juergen Gross
	<jgross@suse.com>, =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
	"Ji, John" <john.ji@intel.com>, "edgar.iglesias@xilinx.com"
	<edgar.iglesias@xilinx.com>, "robin.randhawa@arm.com"
	<robin.randhawa@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, "Matt
 Spencer" <Matt.Spencer@arm.com>, Stewart Hildebrand
	<Stewart.Hildebrand@dornerworks.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, "mirela.simonovic@aggios.com"
	<mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>,
	Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Ian Jackson
	<Ian.Jackson@citrix.com>, Rian Quinn <rianquinn@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
	<cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, "David
 Woodhouse" <dwmw@amazon.co.uk>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
	<varadgautam@gmail.com>, Brian Woods <brian.woods@xilinx.com>, Robert Townley
	<rob.townley@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
	=?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQ29yZXkgTWlueWFyZA==?=
	<cminyard@mvista.com>, Olivier Lambert <olivier.lambert@vates.fr>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ash Wilding
	<ash.j.wilding@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>,
	=?utf-8?B?UGlvdHIgS3LDs2w=?= <piotr.krol@3mdeb.com>, Brendan Kerrigan
	<brendank310@gmail.com>, "Thierry Laurion (Insurgo)" <insurgo@riseup.net>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Deepthi <deepthi.m@ltts.com>,
	Scott Davis <scottwd@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>
Subject: [ANNOUNCE] Call for agenda items for 6 May Community Call @ 1500 UTC
Thread-Topic: [ANNOUNCE] Call for agenda items for 6 May Community Call @ 1500
 UTC
Thread-Index: AQHXPZSbGGAEuewkVEi+5q2zqjkjfw==
Date: Fri, 30 Apr 2021 07:44:09 +0000
Message-ID: <216A1A5A-159E-4B1A-AEE3-77C0036EBE62@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b78713bf-6f2d-4c2a-55f8-08d90babbdcf
x-ms-traffictypediagnostic: MWHPR03MB2542:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR03MB2542B762E6D0CC6575DFEBCC995E9@MWHPR03MB2542.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 492SGh/xhdPXeTH9ZQd3JT5hZoxTz8QnsuuoXQIRTXe0UFox6Bm49UtxCtXbk3hRFHXkwkFihTK8sP0scHcqCoifnCOE+WGOZFNFVcrf0RVn6SjQWrOYvIiR8xDp5P0fzQXwFGURPma5Vec3Wa4TRYXbQMxTiSCL6gypE/StXWUZFCdVgPL2ZO2mUqgio5l3Q6zp7T2VRkEFoy3Gz3XN7/xWLjZ6kSAwMUqfC/tSwxvy+WszjRfjaRkTKdNX9c3iltoKAcmss/B6eGpEH/nS2QDZFgOEmmcU3MNc6SanlTLbBbMLvZccn0xevqobc6NWzKPc8GgscrcEUAcwneI8XgdTyeuxsUEKJJJrQ1L/xVe/eWI2B3yDxk3/EXDjq6tP65XiCKvAtBO7QMqURF/MMntMmUBqfsAEv8y3TctgaISlktEdET95yy42YlPZRCI4Gz3z3Zo1FLcsd6KWvviX5B+x9ziTGGosgfIFVUvQRASHwv26xxwBRSFsMiALlXvv96jdqd6KkP480nAeZOQq28hIh1Mu0TXPxIreP+3+ThkVgeVhP5QorJYWmltmF4eUTelQVpR5Lc98kA9n59vz38O6VCgiQPZ9wSTkn1EfPIB45FYAWCe/9WgN4kUK7Vr67YCZhDJV+r3bE4L3QOr1P6j7DnsM2Z7G2On0qN0pPGFMzOUNASONYUInbt0wBMYMe6Ap8jTS1njp01KTBI8pGXKwqO2i2ZNlBG7nGxDaDF1iD/5Ta1cCzqH/8Pzsj3tetQkFslxuOA9+vUzc6NiiWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5665.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(5660300002)(122000001)(36756003)(86362001)(7416002)(478600001)(38100700002)(71200400001)(8936002)(7406005)(316002)(110136005)(76116006)(4326008)(6512007)(966005)(8676002)(2616005)(921005)(2906002)(186003)(66446008)(83380400001)(91956017)(6506007)(66476007)(6486002)(26005)(64756008)(66556008)(33656002)(66946007)(221023002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?d3hUTDkyaHA3NXkwSjg2dWEwTjMvN2J4MzVwaFhiVDhMd3gyMkdXOGN0cVNE?=
 =?utf-8?B?RDZwT1RNVjFYcFF4eXlWK3F4d0N1T1haVEEyL2R4SHVEbVRwb3lWcEZqVG5D?=
 =?utf-8?B?akYwZFV5bmRVRFdULzBQVjFmTjZYdm1TTUtHNi9PV1A0aFU4Z0JlcVJGbjVB?=
 =?utf-8?B?blVmVUlpcHhxaHptMVQ0NEIvN2M3aXo1Zk1sajhoL2dVNCsxakdkaTJ3b1lE?=
 =?utf-8?B?WXFqYlV6R2w4Myt3ajBrMDlZYkg1a0xqZmFPbU9XVUJpOEdoTG9kSysxMFJ3?=
 =?utf-8?B?QnRDSEVuWTQ4VlYvN0x0RmNYMlhmeHpaZ1lxa1pSQjRTc3IrbkpHNzJyVU9Q?=
 =?utf-8?B?eS82U05uL2VwNHpQRWIvSUc3dmdKZzZ1THI5cnBCemRueXVQZm1DMWlaZEVZ?=
 =?utf-8?B?MXlPdnRjcjJJaGxyVzRobExjeGp3RDBkVWJrb2kzMm9wOEtYaXVOTmpwZ1J0?=
 =?utf-8?B?SDBMaGY2bHh0Qk04R0ZBcUhvdDJNK2lMalhiMjV2V29aZ2FtbGRZSzlZL1ds?=
 =?utf-8?B?MzU5enFLMU5zV3I2YmloUGJQcWNMVUtFQVh5S2R1Wm9RYVEzNlJPM2oxR2l1?=
 =?utf-8?B?NEM1bFM0LzlFV0dRV0pxZWlLOW5zZmhZaVRqMTRpcWNXN25sMGpiVm1wT1BY?=
 =?utf-8?B?U1pHUGtQS25JM2w4TlRXb0s2MDRWeFpSMDg0c0RSbGx3Uk9wb0d5RWNNc3BE?=
 =?utf-8?B?b0tvRTlJOEFqS29qWjA1ZlJ1TjdrYWR2ZCszaytRMDRHRkNIWFE3VWdqcElK?=
 =?utf-8?B?MW9YMVpqYytJTUtLSlQ2Vy9iNktSeVZBR1NtRU8xdFQyUlJWSXFoRXBqTE9B?=
 =?utf-8?B?MjRhOXVWZ09jNVVRY1JRRlFnWjRiNjdrVVgwQTA2c3locHdqT21lb3VZQk5N?=
 =?utf-8?B?MGNkcDNIM3RMaHlhWXhwSytMK1JIcHhBV1pTRHRRRFAxUHJDdGU0anVnSXkz?=
 =?utf-8?B?OXNPZ0Y3VHhveHlZZXhyZDF0L3RSUkNKL2tmRDVqOFZUUWJhZnA1Tk1CODlz?=
 =?utf-8?B?NDc2UFdhRnpQMXUvV2MzOUlvVkl0ck5WNmVjWTNnOTRsd2owa3kzT3czZkJE?=
 =?utf-8?B?WlRZam1kenNZVHVKazl0eUV2cEs4RFhoSUhqZ210S0ZJUFB3TkZrcVYxZXBZ?=
 =?utf-8?B?ZWFwbmU3V3lkMmgrN1BHVVFWc3NMYkxxZFczZEd6YnFGNVVlZXloME1HT3BB?=
 =?utf-8?B?SVBLRmlmNzBnbkp5OGZXT04raVFVSXpna1BNNXZLSm9kV3J6Qlo1dzkwMUpQ?=
 =?utf-8?B?dWV6T21iVXdYSW5yZVVpc1ljWTAvY2pkUHNtZXVUYW85NHlicGhBcjZZMmxJ?=
 =?utf-8?B?WTJJbzZqVWNuL2hIN0VISTRWcDhOVUhYVXgzajh4N205b0xZRXVWc2Y1cnhP?=
 =?utf-8?B?SDQ2Qm5PMmJVVGRPakJJdmlrSmxFNVhESmRrTTZ1REJkNFN6QjFyVkpVMlBx?=
 =?utf-8?B?U0R2c2QzVk9Gd1Z2MllqZWdWR05xRTFYdWtvUDc3by9QY0t3WWs2VmtCR1NP?=
 =?utf-8?B?M0R6WHAxTjI4N0piVXVWYkQxVE5yMUdwcjBKZys5NjkyQTJIUXlKZ0VyNGlW?=
 =?utf-8?B?QkhyNFJIQ3ZDaThVdFMreXFVUitUQU9zcDJqZE8rV2NMeUVEWWJ4czhHMVEz?=
 =?utf-8?B?YWJlZHlqMmpYWlgzeHJkc3dyaVdsWG9EdnVNLzZWTHJTVnF0TXc2OVZiMTV5?=
 =?utf-8?B?OWc2ajRWb09uT0hRL01TUDQzRjhTOG5zbUJSc0VzZW5GZEpDcnkxTHpablJ5?=
 =?utf-8?B?QmpvRkpEUnU2VTVQeTNmRDBURi9rQ1RKaEdtTWFoZGJFUkg4WGIrdGxiTlpl?=
 =?utf-8?B?U2JYREQ4YnhuaWtiVm5lUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <281A7AF64E57A442B67631C76B77DB7E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5665.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78713bf-6f2d-4c2a-55f8-08d90babbdcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 07:44:09.7488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PHUGBaP7QT+4C+Tz0egfclw9gVEQ+fje6TT4N4o0yiyHkaRUSABUvA/YpN9LDrzScb8GpiH9fh3kRDzgO/aC6lOjrNDscoyQwv80sCdSQWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2542
X-OriginatorOrg: citrix.com

SGkgYWxsLA0KDQpUaGUgcHJvcG9zZWQgYWdlbmRhIGlzIGluIGh0dHBzOi8vY3J5cHRwYWQuZnIv
cGFkLyMvMi9wYWQvZWRpdC9vLXBHZGZMR2pYRzhCdWktQ3UraUpMc0MvIGFuZCB5b3UgY2FuIGVk
aXQgdG8gYWRkIGl0ZW1zLiAgQWx0ZXJuYXRpdmVseSwgeW91IGNhbiByZXBseSB0byB0aGlzIG1h
aWwgZGlyZWN0bHkuDQoNCkFnZW5kYSBpdGVtcyBhcHByZWNpYXRlZCBhIGZldyBkYXlzIGJlZm9y
ZSB0aGUgY2FsbDogcGxlYXNlIHB1dCB5b3VyIG5hbWUgYmVzaWRlcyBpdGVtcyBpZiB5b3UgZWRp
dCB0aGUgZG9jdW1lbnQuDQoNCk5vdGUgdGhlIGZvbGxvd2luZyBhZG1pbmlzdHJhdGl2ZSBjb252
ZW50aW9ucyBmb3IgdGhlIGNhbGw6DQoqIFVubGVzcywgYWdyZWVkIGluIHRoZSBwZXJ2aW91cyBt
ZWV0aW5nIG90aGVyd2lzZSwgdGhlIGNhbGwgaXMgb24gdGhlIDFzdCBUaHVyc2RheSBvZiBlYWNo
IG1vbnRoIGF0IDE2MDAgQnJpdGlzaCBUaW1lIChlaXRoZXIgR01UIG9yIEJTVCkNCiogSSB1c3Vh
bGx5IHNlbmQgb3V0IGEgbWVldGluZyByZW1pbmRlciBhIGZldyBkYXlzIGJlZm9yZSB3aXRoIGEg
cHJvdmlzaW9uYWwgYWdlbmRhDQoNCiogVG8gYWxsb3cgdGltZSB0byBzd2l0Y2ggYmV0d2VlbiBt
ZWV0aW5ncywgd2UnbGwgcGxhbiBvbiBzdGFydGluZyB0aGUgYWdlbmRhIGF0IDE2OjA1IHNoYXJw
LiAgQWltIHRvIGpvaW4gYnkgMTY6MDMgaWYgcG9zc2libGUgdG8gYWxsb2NhdGUgdGltZSB0byBz
b3J0IG91dCB0ZWNobmljYWwgZGlmZmljdWx0aWVzICZjDQoNCiogSWYgeW91IHdhbnQgdG8gYmUg
Q0MnZWQgcGxlYXNlIGFkZCBvciByZW1vdmUgeW91cnNlbGYgZnJvbSB0aGUgc2lnbi11cC1zaGVl
dCBhdCBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL2VkaXQvRDl2R3ppaFB4eEFPZTZS
RlB6MHNSQ2YrLw0KDQpCZXN0IFJlZ2FyZHMNCkdlb3JnZQ0KDQoNCg0KPT0gRGlhbC1pbiBJbmZv
cm1hdGlvbiA9PQ0KIyMgTWVldGluZyB0aW1lDQoxNTowMCAtIDE2OjAwIFVUQw0KRnVydGhlciBJ
bnRlcm5hdGlvbmFsIG1lZXRpbmcgdGltZXM6IGh0dHBzOi8vd3d3LnRpbWVhbmRkYXRlLmNvbS93
b3JsZGNsb2NrL21lZXRpbmdkZXRhaWxzLmh0bWw/eWVhcj0yMDIxJm1vbnRoPTA1JmRheT02Jmhv
dXI9MTUmbWluPTAmc2VjPTAmcDE9MTIzNCZwMj0zNyZwMz0yMjQmcDQ9MTc5DQoNCg0KIyMgRGlh
bCBpbiBkZXRhaWxzDQpXZWI6IGh0dHBzOi8vbWVldC5qaXQuc2kvWGVuUHJvamVjdENvbW11bml0
eUNhbGwNCg0KRGlhbC1pbiBpbmZvIGFuZCBwaW4gY2FuIGJlIGZvdW5kIGhlcmU6DQoNCmh0dHBz
Oi8vbWVldC5qaXQuc2kvc3RhdGljL2RpYWxJbkluZm8uaHRtbD9yb29tPVhlblByb2plY3RDb21t
dW5pdHlDYWxs

