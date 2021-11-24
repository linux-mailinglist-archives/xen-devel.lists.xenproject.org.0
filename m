Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E18F45BDA7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 13:36:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230404.398281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mprVz-0007G9-30; Wed, 24 Nov 2021 12:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230404.398281; Wed, 24 Nov 2021 12:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mprVy-0007DT-W0; Wed, 24 Nov 2021 12:36:42 +0000
Received: by outflank-mailman (input) for mailman id 230404;
 Wed, 24 Nov 2021 12:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qlkt=QL=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mprVx-0007DN-O8
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 12:36:41 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b57146e-4d23-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 13:36:40 +0100 (CET)
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
X-Inumbo-ID: 2b57146e-4d23-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637757400;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nxsN0VpeJ/BCfd5Ks2rDABil0yBIa/orBTA3/enSCaA=;
  b=deTjRNBb1lWxBs+geBB5mYYS9DSPhwcg3tG11xMU4mj8dQ6COzgj7UwF
   JOyeksZzrKkJxKHtn/jKrxbzybSG60AXcRpUD7njBDvYvgqicAFoTW77C
   m9RtfuqqJL10lotzmilN6cb5SqPW+CNJECVNmMJeW2GvtBGYMyBU4AkD0
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2NgqUyNLJo+XZEfDXcfyeJXhMCGW33RaDaIdhQ87lCnTuBoOO6rN8AVoxpofZjXsSAbhMu9KlG
 M4vMu9PjVZrA+kYYL8kjhzpFQd3Pim4IeDy3tqpH9D87y4IICSkdvq3HCPdOm5zL9iMRYJxBxV
 IMsNXKpMbpHEa4NWshtCW+sXUx2mDD6cX3T2Ld+trcFnragjfuYWoepLYE34YOeWjkaXfV3JlS
 sL4K3pTSpAwGVZEV3NK8RtBrVCIF1Ssh6Gmhr35Oamk7Z88L0z1S+X2a58LoYrBgDJWr63VH2a
 dXWhk08IbTN28lZwoS079jIc
X-SBRS: 5.1
X-MesageID: 60545279
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Z2MqqqChNc+ITxVW/wTlw5YqxClBgxIJ4kV8jS/XYbTApDsn0zAAz
 DFJXT+OO66OYmGmf95wOYixpktUu5+Dy4A3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540047wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/iAeHmo1ti
 /Z0qI2oEyERebTyuM4tekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf2XuYICg2ZYasZmGKb6Z
 9E2UydVYDffWTcUKkkpT41jg7L97pX4W2IB8w/EzUYt2EDLxRF1+KjgNpzSYNPibexPgkudk
 UfX8G34Dw8yOcSWzHyO9XfEruXChz/hUYQeUrix7Od3gUa7z3YWThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYGUtpNF6sh6QeCyoLd+QPfDW8BJhZ/b9ghuN4zVCYd/
 FaDlNP0BhRiqLSQD3ma89+8rzm/JCwUJm8qfjIfQE0O5NyLiKY3gxHUR9BvCpmciNHvBCrwy
 DCHqis5r7gLhMtN3KK+lXjFnjatq57hXgMzoALNUQqNyQd0Z5WsYYCy3mTK9vZLLIufTV6ps
 WANno6V6+VmJYqWiCWHTeEJHbeoz/WIKjvRhRhoBZZJyti20yf9J8YKumg4fRo3dJZfEdP0X
 KPNkQBj6poOIDiJVLJme9iXM4Mz84jKJf2wA5g4ceFySpR2cQaG+gRnakiRw33hnSAQrE0vB
 XuIWZ3yVChHUMyL2BLzHr5AiuFzmkjS0EuKHcijpylLx4Zyc5J8pV0tFFKVJt4046qfyOk+2
 4YObpDao/mzvQCXX8U2zWLxBQxbRZTYLcqvwyCySgJlClA6cI3GI6WMqY7Ng6Q/w8xoeh7gp
 xlRoHNwxlvlnmHgIg6XcH1lY76Hdc8h9i1lbHZ9ZAv5hydLjWOTAEE3LcdfkV4PrrIL8BKJZ
 6NdJ5Xo7gpnFFwrBAjxnbGi9dc/JXxHdCqFPja/YShXQnKTb1ehxzMQRSO2rHNmJnPu7aMW+
 uT8viuGEctrb1kzV67+NaPwp25dSFBAwYqeqWOTeYINEKgtmaA3QxHMYggff5tRdE6dn2TCj
 G57w34w/IHwnmP8y/GQ7YispIa1CepuWE1cGmjQ97GtMifGuGGkxOd9vCygJ1gxjUv4p/evY
 /t71fb5PKFVlVpGqdMkQb1q0bg/953koLoDllZoG3DCblKKDLJ8IybZgZkT5/MVnrIJ6xGrX
 k+v+8VBPenbMs3SD1NMdhEuaf6O1K9Il2CKv+g1Okjz+AR+4KGDDRdJJxCJhSEEdOl1PYopz
 P0PoskT7wDj2BMmPszf1nJf9niWL2xGWKIi78lIDIjugwst61dDfZ2DVXOmvMDRM41BaxB4L
 CWViazOg6Vn6nDDK3djR2LQ2ed9hIgVvEwYxlE1OFnUyMHOgeU63UMN/G1vHBhV1BhOz8l6J
 nNvax9uPayL8jpl2JpDUmSrF10TDRGV4BWsmV4AlWmfREi0TG3damY6PL/Vrkwe9mtdeBld/
 a2Zlzm5AWq7Ipmp03tgQ1NhptziUcd1p1/Ll82QFsiYG4U3PGj+iai0aGtU8xbqDKvdXqEcS
 TWGKAqoVZDGCA==
IronPort-HdrOrdr: A9a23:ZTT2i6Csuc3EMO3lHemo55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEKhSqafk3j38C2nf24dmpM
 JdmnFFeb7N5I5B/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.87,260,1631592000"; 
   d="scan'208";a="60545279"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQkSYG+ZJAMEPEFKCH8+6ZO4cdbH6HwWhCj0nFE6WMVGswTrqS9ptKcmGjC+2pGXy64k/r/jt3eZ685oiu/TJGj0aTBjnI0h4cymc9BbgYDYbZdJAvlUpckKPEZO5uOj35CNRQerYbqI5XzP47IiLOVHLLOcXY7sZDyq9irJL3r9gkgDkOG4Elb2vIImBd/WyTuFRBkh9h3A02TQqNci1YkqjxH+CzQL5bUbxDzt1lbJZjMVJ3qo2zmReQPviQpKcpFd+uoJRuL+D9O1mHbyGzCBAWsm3lRKHJr1eki4d0jGUyQJe7tN4MTUm/FoxPZ24s5TzMzB7jZ+8X/Uuz9wAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxsJR3dQtPz5jbsnTdvLVtmMwCnkxV+5wzoIKt4r9WM=;
 b=ILkB34KSGRTtq1YajFQTwaZ9XflpKspDIT2An05qaOhBkjn8Ag0I1Yii8hhsKoM889QLsdnfJ+FqE1peLcZUyfeaerUVe0RNd8k1cNPjxralzLCZvaHJl+vOSqPucTkybBK5u6SAMxEGaBqxs8Sy4loMEAYf19VvARZhrUJH79K/fa4RLgqH0TdHcMtQpzUFLpk1jzG3kLEQbl+y74JuldhzauPewS5EKZNtazEyRwDJTOPeXr+3AdPqUTz4PFqkOWdEcwXh5GcS9pPkGckIEAzZJnICJe745DCqqLjxoYDNk9YoMGnc+Z6lDC0oQV+jiM8h9k3AlJ/13KBDGwQ2Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxsJR3dQtPz5jbsnTdvLVtmMwCnkxV+5wzoIKt4r9WM=;
 b=NNLacflWO+NSmRZTE4qq5FmIuUEk0xy2kyIOVnHfv7crg+URMNs/IHRJCWvPB2eJ7ZMl4WfMfbTb2eYkO7jEeq8lApBfhhPnkds9uh6+jyzT7O/a1rBd+nLEyUejm9BgHx//HumYRb/e/nIMWs62EtXogooszm88M5gCLgv5h7I=
Date: Wed, 24 Nov 2021 13:36:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 10/11] vpci: add initial support for virtual PCI bus
 topology
Message-ID: <YZ4x0ANosX3hPfSh@Air-de-Roger>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-11-andr2000@gmail.com>
 <217a5684-34af-e08c-2d70-563857ec5595@suse.com>
 <6c6951dc-2abe-e180-1442-e68097e59d22@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6c6951dc-2abe-e180-1442-e68097e59d22@epam.com>
X-ClientProxiedBy: MR2P264CA0087.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dcf97b7-b08b-4209-61d6-08d9af470dc7
X-MS-TrafficTypeDiagnostic: DM5PR03MB3147:
X-Microsoft-Antispam-PRVS: <DM5PR03MB31471E09E2D6BC266E8332368F619@DM5PR03MB3147.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZGUP9ihpvyXaF1w8kltnAu9DZ9Rs0OJL68A6ZVy2E7pi5XJaraJfVkCSCDkbnsLoTVlObo+ji3pto3Oe5aeSg/MgLVGe4a7u+/hAWIWwfUDFqRrk760owDBKsnsNfSf4B6CF2rcr5xkNZMI+2EwdAVAXkLLuwcR4pcLjYfcsjpFsB9ePnkdCnCwON/cGNgTG6z3EInM3s997tQZt/EH/Vy+0TjS5GocL7ZinN+i1udQ3ZaVDy1ueXD5Q0aWhmY0KltUUSENuvgViBR1Rjj3WSICR7SjVfepDzcrpLN4XVQRHMc5SeiSKJwavkzmk8bpTF03vmLkPJafXKChqUDKMD0K+4mnCYeBS9I/0RadSdKzVQBsiQmZHa+AX7mfTL0KvWqddUoGicr74tTBorSbIBV2ON1T3QCduhBigcGMsIDQig+gRIFwHCqhz+uFGt65u6RYXbWvGrGWfsCKJvWgipPwhyyKFezkZj3htyS01gGYg/c0GU8gldR4hzssli7nwurSvGWj5DCrSG84k3KkTERtopr03N0XdbDop2D5mr8jGz+9VBsfcUxDOFv2fTOMSzixbzrSTGYkAzt0kUHy5n/67W/peRWaMQ9dnp51g/Pb7c5a0QAdHMSbDmoFn0Bi1AxKKFi8YVaCoGRvFF02iMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(508600001)(53546011)(5660300002)(86362001)(316002)(7416002)(4744005)(6486002)(54906003)(6496006)(83380400001)(9686003)(26005)(6666004)(8676002)(82960400001)(4326008)(186003)(8936002)(956004)(66946007)(85182001)(2906002)(38100700002)(66476007)(33716001)(66556008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzh6MlZabG1iK1RweGpZSjczdFVwdmo5RFE5Q3dzNTZDMlg4WG5vWXdWOW9O?=
 =?utf-8?B?RXZtUjF1RTRkRktWUk1sc2l2N2pGYXhqakJWMWVqMmNpenVUZmRZZXRySWw3?=
 =?utf-8?B?R3J4VG8wd1JvK1pSaThvYmtMcStObXFPU2J5NzlHMU53QS9GQWR0NmFnMVhP?=
 =?utf-8?B?Wm1RMDJnUkRJSEs5SiszdXVFVjh3S01BVnhFdUlIbUV3RWtWZ2gzS1E2M2Ns?=
 =?utf-8?B?WFNUbTdVajBsL05Cc1ZjdFBYVzE5eFRrNTVJRFZqYjFBUkRUb082UWphdUpD?=
 =?utf-8?B?QVdqaUZ6VGRwY2ZnWlFoSWRCOUUxaUtudXhkcThMYVVnQUFkZlRocjhQQWZI?=
 =?utf-8?B?RUdUVTlnYVJKZGIwYzhBVkZPbG14azVlK01PVDhWTmxxaFpSNERHaDJ0SklZ?=
 =?utf-8?B?N2xxS0ZWV1E0eVhNME4rZnpnZVZwU2JzTm42Ui9ORmhwQk11ckUvZTlrWERt?=
 =?utf-8?B?dEN3V1ZnSk94RG9qWGRabVNwS2dGR1Q5cjlWMlV5cjlsY1YzRnQxeFlyNWls?=
 =?utf-8?B?cEVZcThRNFZoQzgreEE1TjZXOFlEYlNsL1M5T3dDTU5VNmloVEJIRU0vRFZm?=
 =?utf-8?B?UEkrVFZoamg5WldBKzNhZWdObnV5cEVLaUg5YXJCSlVWanRkYVUrdDhXOUE3?=
 =?utf-8?B?U240enplcHRaa3pZM0tjVUZMbTNYTHpMNTIyTSt4SWhmZ0NuQXlCLzcxWTZH?=
 =?utf-8?B?bk5jby9udzRLTE9FNENacmdJc2dQaVNWZG4wTHVUZm9CNmRkZHFJVFZydE1u?=
 =?utf-8?B?SGZqcDJzcjZBSlZacDJUNVJrQnJBU1dVNHlVcFFFb0lSY3NOclV4NFJ5VjdT?=
 =?utf-8?B?a1RDbExjZUZwSk5Jc2lFd2VZRlg0VW5RY1p6R2RvcktrdHh6QTllM1hySWIv?=
 =?utf-8?B?OC84cFdaU21xZ1ZDR21HWTdxSVFTTm14L2YwdEdmemtwZVc2QlhYQkthejdC?=
 =?utf-8?B?c0ZmUmlvZkJHOC9LTlVyR2JMakhXQVVtbUF6L1l6UjZocVBUSmlEMTlUMi85?=
 =?utf-8?B?UmJjOC8vUjVXQkRBQU10ZlJ6QXJEYjJneWg4MDhUVGg3SlZGN0RSdHlabUtm?=
 =?utf-8?B?ZG90SkgxdmxIbkE2KzNHV0pCekZJblJhb3c2ekROcncvS21DUWgvRStqV1BK?=
 =?utf-8?B?UXY2dHVPZjJJVTQ1VUduL0s4MHpHUmRJb3cwNWJqY3dibzFYanAybzVKc0hj?=
 =?utf-8?B?Z2VPN2pzdUtJS1hDSkhnUjVNNHB1a2djRTI0RWJVSVEzc3RTRVdDRGlXZFh3?=
 =?utf-8?B?eGY4ay8xN2JXNSs5L1M2RnR6MDNLNlA5SWRoTEkwQzFTakdDaE9HUDJYWThj?=
 =?utf-8?B?UXhBRG1pZEJpUWJwZnlXcmhXdTVPTDhRc3lweEg3dytXOHkxcXZhbjQySDQ1?=
 =?utf-8?B?bWlvNFBaVXlmK0JqL1pXeVJrK21nVC82MUE4Q05JWjZrQmpoQWluSlA4ZndX?=
 =?utf-8?B?TW5SZ2NIRDMrTlFtOVUyZENFUHB5R0UyVGhsMmxYVUdobUtWYkRLVzRMb2g0?=
 =?utf-8?B?aE5DNUFrbE5WcnBURDVLL21jVkRpemc4L0wxSWFNSU52OVQyUkxaeWd5NkRl?=
 =?utf-8?B?b2JGTThaamRVSE9vMG9TRCtiblJMOVQ3VG1NVVhtYWhOTG5CRWlGOHdkOUtY?=
 =?utf-8?B?Wk5kYVZHTlZUTlFjTEdIcnphK3pmODZrQ2tWbitrNjlIN0pIRzlTM0dzenFn?=
 =?utf-8?B?Q2lCbStyUjFQWGVCUUpsampjc3RvQnBrTnQrWDVsVjlELzJSYWNFOFpFVUN1?=
 =?utf-8?B?YUJhdHREL3FtcXcwMW42cXFZdEd3U1Z3bnhXYm5Gakgxb0lOWnl2eUpJZFhY?=
 =?utf-8?B?TFhDaW5iUElNMDRPdHFCaHpvWm1yTjVwQzcrZkZORml5aDdKMlFETEMxU3l1?=
 =?utf-8?B?VlMzK1pRTHdnaVVZN2tkS1RQNkhtYzJ5amVGN3QrVmR3UHh5UmhHa0FmelBV?=
 =?utf-8?B?WldMbkNDUWpIc211M2RsS3hiYVNtWE9FYVFwelBxTU5icEg3aCtyWXR4N0NV?=
 =?utf-8?B?ZDJ5a2dETmJ6czRNQmxqRWJyVVBBZUUwc0Z2ZDV0MldHbjdJZ2FmaFhEUmVC?=
 =?utf-8?B?QStIMlAwZGh3NWcrU3k2ZkltWU5uMlpaS2Q4eC8yNk5TbEl4dUlidzJGMk5u?=
 =?utf-8?B?QnRWZzFna1M0Nk4yQXZQQ2x2eERoVjhvNnBSaGRqMmVWamo1RGwwcUp4Zlps?=
 =?utf-8?Q?RMuNtMJ83fyQpUUOafBczec=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcf97b7-b08b-4209-61d6-08d9af470dc7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 12:36:36.0615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LD9mqebhX8kVGd4RLzMJTrp0aQ+aJYb2JG5l/XKLci65PSRN5MiPbRIPhMuxaZ0Mx6OdhAjd3FPu+7C2GxZmkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3147
X-OriginatorOrg: citrix.com

On Wed, Nov 24, 2021 at 11:28:18AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Jan!
> 
> On 18.11.21 18:45, Jan Beulich wrote:
> > On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> >> --- a/xen/include/xen/vpci.h
> >> +++ b/xen/include/xen/vpci.h
> >> @@ -145,6 +145,10 @@ struct vpci {
> >>               struct vpci_arch_msix_entry arch;
> >>           } entries[];
> >>       } *msix;
> >> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> >> +    /* Virtual SBDF of the device. */
> >> +    pci_sbdf_t guest_sbdf;
> > Would vsbdf perhaps be better in line with things like vpci or vcpu
> > (as well as with the comment here)?
> This is the same as guest_addr...
> @Roger what is your preference here?

I'm fine with using guest_ here, but the comment should be slightly
adjusted to s/Virtual/Guest/ IMO. It's already inline with other
guest_ fields added in the series anyway.

Just to confirm, such guest_sbdf is strictly to be used by
unprivileged domains, dom0 will never get such a virtual PCI bus?

Thanks, Roger.

