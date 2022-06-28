Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9FD55C105
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 14:40:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357076.585482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6AVW-0003J9-Kc; Tue, 28 Jun 2022 12:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357076.585482; Tue, 28 Jun 2022 12:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6AVW-0003GX-G4; Tue, 28 Jun 2022 12:39:54 +0000
Received: by outflank-mailman (input) for mailman id 357076;
 Tue, 28 Jun 2022 12:39:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XT0n=XD=citrix.com=prvs=171720f04=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6AVV-0003GR-Hb
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 12:39:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66060c7a-f6df-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 14:39:51 +0200 (CEST)
Received: from mail-bn1nam07lp2046.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2022 08:39:47 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA1PR03MB6671.namprd03.prod.outlook.com (2603:10b6:806:1c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 12:39:43 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 12:39:43 +0000
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
X-Inumbo-ID: 66060c7a-f6df-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656419991;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NlMLok0wipjO3IonR+i06xV2i8xJwVifXM00T3PBIZQ=;
  b=Z5VUxocFYt9L33oruN10qU/TyjY+65BOTYx2wKNhPPCnIFjkuAa6sZcb
   VhEdMpTYxRBvyoF58lk2GnX8M7xC0qdUrcU9AjWeUzMA3tWhve5xxXcC7
   EKOsolVlA8+qvhwMywboLp4qle+IogRkkodfobcpOpM6T1ZU9bSwOoJRb
   Q=;
X-IronPort-RemoteIP: 104.47.51.46
X-IronPort-MID: 74581219
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WM5BRaIm+K+gmGaqFE+RqpQlxSXFcZb7ZxGr2PjKsXjdYENShjYFx
 2EYDTuEM63ca2Kke9t2YNix8h4CupPSnIdgG1ZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3NQ42YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 N4Sk7GvQhgJBabnm/hBaAhgUBl6N6ITrdcrIVDn2SCS52vvViO2ht9IVQQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHMmFH/uiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/32iSvKmcB+Tp5o4Iw/2nN11JfiIHpH9zeS9mGGMcMp3ah8
 zeuE2PRR0ty2Mak4TiP/2+oh+TPtTjmQ49UH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6da3FSiU93VTxC+5nmesXY0RN54A+A8rgaXxcLpDx2xA2EFSntLboUgvcpuGjgyj
 AfVwZXuGCBlt6CTRTSF7LCIoDiuOC8Ta2gfeSsDSghD6N7myG0usi/yoh9YOPbdprXI9fvYm
 VhmcABWa20vsPM2
IronPort-HdrOrdr: A9a23:rcKnL64ROAnerHZFrwPXwVOBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VJN1xNfdfWVa9Ni7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.92,227,1650945600"; 
   d="scan'208";a="74581219"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nblIJFPbOQsCah21azVicaKR2Xw1dg4HpkOZ6kHQsb5IVcBiqdj7oHdX0luzCFA+hZKNyK5dv4jJrDtDTdAstFZiYrjPh9PgYte0GVT8igvU4Qf3IOxFQG9myTYeDXTanwFLOOFcr2pluiiyHnJdtu4UOUeHPGAtrjw3+kSDRoYU31m321VNYnUFa3SuOoQifv3Oc9h/v2WyApv29v3AYFpDfzPWyNdhnudDQBYioU4MX9CJmzPFYRoBdVKckuHaQF2QjzkJ0gFzqU3NRuZm6KqmFSglkYcQagDbezV9VHcjVmn1A123UFaF9GDy9szV5x1CGsky2N6ZOjpCiSIamw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVjt8sfCuWYXB10hVUR/u+9zhHGwIjybEpB3AGvesAM=;
 b=EOhi/yqf+JA0vc6IB1Rj+PvFPwbpNr3hBrf00v2+kTaqFuFfww+qDflUOFDNK/6govJ1NAO2KYnQMWKRAwbSfh6pH6DKI5L47ACc4ARTauPqnzQkOTNjG2eginHYmgnbFI3KxORZX15j5LgTPKGVzcSk/tYx9qrgaIemVkyhD/5jGRpAgVd3weyozwqQZc5UlGBYazyaIlTzlaOvPPPZDzVQ8jr5m7SUCShaEo8FjlP5e44mc+fT4Twt8bdx4JS884pCB2F7qWdbKsKDgrqV739pJPKPlDYuKKZBemV8vaC2a8V7muxtexpjtGEN4OyTwlvO6XpWp3MtViFPGrK/8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVjt8sfCuWYXB10hVUR/u+9zhHGwIjybEpB3AGvesAM=;
 b=QAnsG4j2f/xVD0EoCiyoDi85LWiiFQ2B1lHlRu1fOCLQG0zDNLFJ8FiEjn5sR0KPgt473rJtoL/e7gmVtLG5uMISz2h2KpHtWIQU6rMhlBM5bmNiPyWIlSu8/mbROI07ZC+CuFo98R49JCZkvjEF2GZmeKDkTz6jZQJJk3KR1XU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 28 Jun 2022 14:39:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 01/12] IOMMU/x86: support freeing of pagetables
Message-ID: <Yrr2iUlG43xIsOpD@Air-de-Roger>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
 <24eb0b99-c2c4-08aa-740d-df94d2505599@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24eb0b99-c2c4-08aa-740d-df94d2505599@suse.com>
X-ClientProxiedBy: LO2P265CA0198.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b795c8b4-d189-4993-4130-08da59034678
X-MS-TrafficTypeDiagnostic: SA1PR03MB6671:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	17sF0ySRruEAxDs1MBsnSjQDHev/mlw4K13VqctSpoP2gBZSvLp5IY26w81tK4hCJD9Ng/JcRkVtLzWOz4czQjFu2sVOq8TaJmAhvGUE+x8AI+iQFgy27cTr+tzcIZWqYByUgoM2X/K0WG8A7lU2gFfmt/mYHhlWhRM5KC0M80ks43TPKThLfUcsGlgwRLXIphcTylvqBP9NbeNGWuwx2hx7Sgx9Y1UegiO/ceEhC+cIrB108zus20FjI1YjBY2K2v7++tHhrNtMdpNPn0JvPERanq+tWmoe0wLz900eGa41MBUsWoTVIGzLswwH0irl8LkfTrRc7+05+nOq3x4GPB7R7wuoWPww6se+VlXA7V+6O0NX67RwU6yycqWttdl8hDZq5C3nXuOdzBm60QIS8Zls85g9RHu1Vpybmid9ZwJJ2l4AGAbY6n1gyj+ECV2JICvOnidRXg1KfMVqaxX3eeUidbEGY3v/+9K+8Y0ABD1u4fSjOp3POvTRhL39F3LS83e1VK7zhasjf3mgeJX5Ed/213TkZ83IlRRz9VUKdp0Wdm8cCM+hlO6qhRbAgKY/zeanYq+gMSjWdZ5p1LJMPzsR3C2mg19R2ZdzsJ+LlCGTha+SYrf94pG09bJ0kAdO6AlMKGN+5ONVNj31rvsTymoZKeQOC1b/7WoFL/SUvB/G/AW8UlQuHtwujA7CZXXR1L9WyOlSSonNXMPjWvb5Zxoie1DgkL6LThim4VFo8IuRI4g5yRL1xhw8ZETUPPFnaWatfmuHDKLEnGrDpxg/Kw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(4326008)(8676002)(316002)(82960400001)(66946007)(66556008)(54906003)(6666004)(66476007)(85182001)(83380400001)(186003)(6506007)(33716001)(41300700001)(6512007)(9686003)(2906002)(26005)(86362001)(8936002)(6486002)(38100700002)(478600001)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THV2a0xjZlJqZ2o3aWlzR2svWHZrMWZkcGEyOFFQQkJ3aW04MzhPVkNNVnNh?=
 =?utf-8?B?VEplK3BmbVJ2NitDbytSYk5NOVM2b0d5TUlLN3FRV0w0aTVISjFoK3o2a1NK?=
 =?utf-8?B?ZDcwQUQzYm9PNU42cU9qM1YvWXAvQ2sreWU2eHRnbzl4NHF1OUJmSzRKZ2dQ?=
 =?utf-8?B?My9ib0tzemdPVEtLbHovdi8wQ2I4NDVnR0tacVloMDV2RzZlTjNUSTdNYWhz?=
 =?utf-8?B?YjdXM1I1QllxOWs3Q3paVHdQZWR6MVVWVko2OTdoRmVEM044OEs3NjFRVmNt?=
 =?utf-8?B?d01VYVFoSll1VjJaREx6a1lkOXI1Zmh0K3MxU21sNmJZM05CUW5uZ05FMTlu?=
 =?utf-8?B?NWNqY1pqbG5JenNVK1hDUkdJTU1WZ3BGa0tvRzk0cy83bUxEYlgxNGdtbURS?=
 =?utf-8?B?b2piUGZTTmw3UUQxa0ZHc2JvT3ZXeUZCVWhDYXkrdGdieExYZXZGamV5dVFy?=
 =?utf-8?B?V0ZVQlJWbVdGR1B6S1RCdFhZK0FkUjViL0N2N0tlUTVTanJscGkvYTZ5d2hV?=
 =?utf-8?B?RHErWGVBcGlqekZGUmRWS2xlR2VMYXp0U3F4azZ4OVhMZi9JOE0rWVU3VFJS?=
 =?utf-8?B?TDVGaUJYcStpOElQekxIQ0FETkdWUEpJeHVCT0ZXSVg3NitveUwzTWNyRVdk?=
 =?utf-8?B?YnVOanBiQVdWMmJ6Wi94Vm51SWlrN2RhTnVCOGUyaE1xemFhcTNsajU1Y1Qv?=
 =?utf-8?B?emZRUURRbFhqVlgzVXNlTHI4WkRWejdZVDFnOVNlZ28zRGV0N2Z5STFOY3lR?=
 =?utf-8?B?dTA2YjU2Q3VhZmxnK1NzUkJHSHFwWjVhbmlQdk5hZlU2NG1RNGR6eFZERldz?=
 =?utf-8?B?YWRCNE0vZWptMHpWYURhSDAydzRtWGhxOW13YlRWN29EWHZ5dGhMWDlEQ1VY?=
 =?utf-8?B?VjhNaWE1K25FVDhpeHEzbXhXSjJtRFZnUHlFMXVOZnhXckxEWXBmdzk4OElZ?=
 =?utf-8?B?MXFMNS9uUVVQWitkVytKa2F5WTdSWGtIZjY0N0g4bDVuUnRYQWhSenZQSFBm?=
 =?utf-8?B?NEVtQ3ZFNnhSR1BSTTBSclhyMXpPN05qejd2dW9uUERwT1M1RklUUmVpc0xj?=
 =?utf-8?B?Ui8rOHNrOGI2VE1pLzBteUwzWk9SWm5Ya3dXdndEVVl0Mi9qb1BGa3F1K2do?=
 =?utf-8?B?QVRyYzBOZFlodzh5cXJiOXNuWnJvQ1lOeUJESVpsTXZBSG5BTVNHQ080cWkx?=
 =?utf-8?B?Y1Qva3hXSGpqZUhuYmpTaUpMcnFGWjJ5a0dLVFM1eHpkbXEyelpMODZuZXhJ?=
 =?utf-8?B?aWNralhyTDRTMzRwSXR3VFE1N2JDbU4xYTNJMndyR09mVlBRb1lQeVQ2akJz?=
 =?utf-8?B?ODhuZytlYWhZdVF6T29KRWYyekV4REN4M2xvRHRWSzZzUGdsazVsc1d0b2xw?=
 =?utf-8?B?OVdqdG1icHNPM2JRY0Rra1BEdGdyQTR4RUsvU0htMkk2WVhNUXVsd3pmUEtr?=
 =?utf-8?B?Q01aVlhUc2ZmZTBBOTh6L3RJaDVnSVd2cWpTWWhTbzliSHkxZStRdWNkRWNH?=
 =?utf-8?B?b0xWb1B2ejcrUTYxRHpodVhYMDdNQUc3WTZTYWNGTFJrQ3lGdFVZNmpxOWlQ?=
 =?utf-8?B?cDJHRDNZZFNWTGlSeUsxQkZpRnVzd0M0Z1dXR1NHZURrcUo4b1M1OFZsU2Vz?=
 =?utf-8?B?aTJXKzdxTDBYVG5WZlY4QUhMS0xpeFNJSE1LUDVlQTlWOUtVN0plVDNxUGV1?=
 =?utf-8?B?S3BpcG56UFhib0ZWek5DWGFZWXExWHJVemJQd2plalJZL2dzaWthUkFPOWxT?=
 =?utf-8?B?NVBtMFpQeFJOdzZ2QkkyUitOc0FsbzRYTi9PSUdSZkh6ZzVGOXdGVGtaeEtN?=
 =?utf-8?B?OC95SXJCSG1DbHlGYy9nKzhZVTZRdzFBVjVVUDNCQ2FQK2pqNURLMm9qUDFj?=
 =?utf-8?B?T25aSGgzRDRPcU9FTW1yczRQMENYUWFJeC9yWHV0MzhSWHljdEhGSGFIclF1?=
 =?utf-8?B?di9XWkREaDAzc2xibWhWQ2RTcFFya24vMW43bkJwbHc0T1pzdTlHMndDUUdm?=
 =?utf-8?B?RGtqaUh3Q3FXK2llN0VJR0RwL0V6K1VPVHM4bk00aFFGL04rM2NCdHJscS9T?=
 =?utf-8?B?czBGVEdrSVhVV3BSdWUzNWhBQ25OdURtUXl5Tjd3ZDVhUUsvcE5mNTZlVXhI?=
 =?utf-8?Q?shvxtq5ZJHp3VQ+c6QGJSz2Xl?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b795c8b4-d189-4993-4130-08da59034678
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 12:39:43.0281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63SQauZOW8dImxk1z/P/TiNrWUrUT/zR1ozAiPY2mt+xkS/w3qohTgcwfuuyvq/OyIhv28lFDYb6NnG3vBVxOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6671

On Thu, Jun 09, 2022 at 12:16:38PM +0200, Jan Beulich wrote:
> For vendor specific code to support superpages we need to be able to
> deal with a superpage mapping replacing an intermediate page table (or
> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
> needed to free individual page tables while a domain is still alive.
> Since the freeing needs to be deferred until after a suitable IOTLB
> flush was performed, released page tables get queued for processing by a
> tasklet.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I was considering whether to use a softirq-tasklet instead. This would
> have the benefit of avoiding extra scheduling operations, but come with
> the risk of the freeing happening prematurely because of a
> process_pending_softirqs() somewhere.
> ---
> v6: Extend comment on the use of process_pending_softirqs().
> v5: Fix CPU_UP_PREPARE for BIGMEM. Schedule tasklet in CPU_DOWN_FAILED
>     when list is not empty. Skip all processing in CPU_DEAD when list is
>     empty.
> v4: Change type of iommu_queue_free_pgtable()'s 1st parameter. Re-base.
> v3: Call process_pending_softirqs() from free_queued_pgtables().
> 
> --- a/xen/arch/x86/include/asm/iommu.h
> +++ b/xen/arch/x86/include/asm/iommu.h
> @@ -147,6 +147,7 @@ void iommu_free_domid(domid_t domid, uns
>  int __must_check iommu_free_pgtables(struct domain *d);
>  struct domain_iommu;
>  struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd);
> +void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
>  
>  #endif /* !__ARCH_X86_IOMMU_H__ */
>  /*
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -12,6 +12,7 @@
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <xen/cpu.h>
>  #include <xen/sched.h>
>  #include <xen/iocap.h>
>  #include <xen/iommu.h>
> @@ -551,6 +552,103 @@ struct page_info *iommu_alloc_pgtable(st
>      return pg;
>  }
>  
> +/*
> + * Intermediate page tables which get replaced by large pages may only be
> + * freed after a suitable IOTLB flush. Hence such pages get queued on a
> + * per-CPU list, with a per-CPU tasklet processing the list on the assumption
> + * that the necessary IOTLB flush will have occurred by the time tasklets get
> + * to run. (List and tasklet being per-CPU has the benefit of accesses not
> + * requiring any locking.)
> + */
> +static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
> +static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
> +
> +static void free_queued_pgtables(void *arg)

I think this is missing a cf_check attribute?



> +{
> +    struct page_list_head *list = arg;
> +    struct page_info *pg;
> +    unsigned int done = 0;

Might be worth adding an:

ASSERT(list == &this_cpu(free_pgt_list));

To make sure tasklets are never executed on the wrong CPU.

Apart form that:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

