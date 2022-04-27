Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4E45116CA
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 14:34:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314970.533276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njgrs-0003dA-O0; Wed, 27 Apr 2022 12:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314970.533276; Wed, 27 Apr 2022 12:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njgrs-0003Zg-Kp; Wed, 27 Apr 2022 12:34:04 +0000
Received: by outflank-mailman (input) for mailman id 314970;
 Wed, 27 Apr 2022 12:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8dk3=VF=citrix.com=prvs=109ad7ccf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1njgrq-0003S8-D4
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 12:34:02 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ec05ece-c626-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 14:33:59 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 08:33:56 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CY4PR03MB3111.namprd03.prod.outlook.com (2603:10b6:910:58::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 12:33:54 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 12:33:54 +0000
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
X-Inumbo-ID: 4ec05ece-c626-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651062839;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jcSWMsu+ye1FmhpUtNcMpYFV8lPJ0FX4pB78h56vxjE=;
  b=XYLIl39nFkF/f+vPba7QOUa9v+wON5HmuoYlnqECaYXDV3QKwlIkqIuP
   mwk5YQfcxz1cs48xX8z1RuUe5vk/HNTnHU3v1AssdNOwJCx+89klBbAMk
   VFb59d74P8q/CgxL+sjLiZI34cE6g9/ETR6/ZwKSoVCrVCzkHGLr1lkeF
   s=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 70441926
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DkWCkKwBDmmrsItlrkl6t+cBxyrEfRIJ4+MujC+fZmUNrF6WrkUHy
 zRLD2rVb62LMTGnc9snaI7loR5QvMWAzNEyGlRuqCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY024fhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl65uNE1kWOKP3huEWdAJmTHtBFK5X9+qSSZS/mZT7I0zuVVLJmq8rKX5seIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtadHeOWube03x9p7ixKNd/Ya
 9AUdnxEaxPYbgcUElwWFIg/jKGjgXyXnzhw9wrJ+fNmuTa7IApZ0Z7JbffeS8a2G8RZhEbHq
 mOa+VjyHURPXDCY4X/fmp62vcfKnCj7UYZUE6eq+/pCiUeWgGcUDXU+V1G2vP24gU6WQM9EJ
 gof/S9Ghaov8E2mSPHtUhv+p2SL1jYHQMZZGeA+7ACLy4LX7hyfC2xCSSROAPQ5sOcmSDps0
 UWG9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLnW0ophfGT9ImFbHviNTwQGv02
 2rS8HR4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CJsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:hYs+Uq4q+/bcUjwZxQPXwZGCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+843WBjB8bZYOCAghrmEGgC1/qu/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXerIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonis2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlaQkEyzzYJriJaYfy+Azdk9vfr2rCV+
 O85SvICv4Drk85uFvF+CcFlTOQiArGoEWStGNwyUGT3fARAghKSvapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jRiuKYlGclsRLYkjQpo+VY7bVDHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TpE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZeo6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z44HSKyGG4fIyQZ0Wc9igF3ekJhlTVfsuZDQSTDFYzjsCnv/ITRsXGRv
 fbAuMiP8Pe
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="70441926"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZlsvSl40YEISjVcVSJ5Ac3TzvVIznr89U89ZLZw1Sva8kRmysaV0QVfgrV7aoQCcE6l7U1jnrO6rsdjQq3ESyDSWudR47wC2F6j8JA8Otw7b+IZ7Ipc6IZlzVWLC1s1D6JFKGvRvoltlt4HupriagDOnocjqUr59BSzvANCiiCnUkGArXlJLwop3Q6HuFLgT4Q/BP8zhj9wlc1Zepaz1wi935K+1MVw8eOfwJtSS364/u29m3sBXH+zSaLyJj+hq6KaS2zmDh0aZc0TRNNR4Qu2xQFI8H3D7y7BXScr/M1lkF/WmpDB9hb8hNw/hdx8na7xtM1GiiWK233aGRdlrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcSWMsu+ye1FmhpUtNcMpYFV8lPJ0FX4pB78h56vxjE=;
 b=c1EvqSSrV+y8zJeufToGuYHgEH/vQXi3AzOI6Baa7hLQv4npN4IlwKosLjA8OJaOFTZ/n4pwnXPabT8D3Rm7pCRbshM9/FmzC8RW3ZGfB8mwiCHc9/8z9EBbXUalBQOKoJZCIXX/4FKQxQePeS5td4DtNi1fwvgflH7S/XAWU1j8Z9A0v7B9LU81UkZqN4IBskPXAbr7ulFnnHqlHNJz9woisPdQLI+3En0QMPrwbt8fHQvFkrrtRWgmnDSaMRmCX7NKPhBRrk4CuDEi1dHlno3EcLFzxC/ZtmrM987OXsGxPklD89syX26aIAtAN19hVKJ1HnY6SqLJwRLfGmI7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcSWMsu+ye1FmhpUtNcMpYFV8lPJ0FX4pB78h56vxjE=;
 b=EW+w6N7xLNCqd3w7YU2i3YOQlZuKhZjqz92WOfVZlgWA81e7+ROwE3WPrEM+/pS9ffCv9/IiTNboKL4Ag/L2DPXN/ANgRxIez93YehutUlQ4aBEBS01xwlX24/ll/WkNwdX8kzP7ZyTlSgw0LiCZnUSkPlGVmPPQed+42mgswNY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Michal Orzel <michal.orzel@arm.com>, Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/8] gnttab: Remove unused-but-set variable
Thread-Topic: [PATCH 3/8] gnttab: Remove unused-but-set variable
Thread-Index: AQHYWhwqFegaNlTxvU6FmW06six2Eq0DhsKAgAASwwCAABhegA==
Date: Wed, 27 Apr 2022 12:33:53 +0000
Message-ID: <0c067fff-32a9-0d21-2410-611ec9a2b91c@citrix.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
 <20220427094941.291554-4-michal.orzel@arm.com>
 <313fdb48-9164-3165-365b-5073b09e68da@suse.com>
 <590d34a8-744f-4170-74a6-1b02013488df@arm.com>
In-Reply-To: <590d34a8-744f-4170-74a6-1b02013488df@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54984854-34bb-4422-ca80-08da284a30f8
x-ms-traffictypediagnostic: CY4PR03MB3111:EE_
x-microsoft-antispam-prvs:
 <CY4PR03MB31112B4171897CC98DE11FFABAFA9@CY4PR03MB3111.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9Djc6ODlfPCRpfhFdvu7pwAeAsqDJz3L3EjxZj6sTAKneGHFohOl/ydAOElvhyJscQ+WkeWT+/StkUR+2e+7Nn2LpUnKcqOL7fbFZiIicyoLV4L69vgFOoaKGxtVOzsueK4Sw3DUnto1/uDbxBfCwe7Zc5m4xiwInhV9Gmu5TEZpkcdEkwhCn4abejWSOuzVas82kRxn+boPDLTWAxqUev7qahJQA+vES+J1olS/ai8ns/A/C+7F+C+lSlyxNR7vX2aI8GmdynZG9nJfvaVEhzc4BvFD8KT18EuRYSaz/apP/yVm9o+VopPkO2gtZ0ajyrkfDlIlbIjTBVNf79iKJdEbXZN9BjUV+l77Saoani53Pb/Kwp/xX7enc6vPSlgAyVe1n2y0zmnMD7JrLYwOhrKaP/K1/8uvb60duRrvs5EHLv2fLdMrhKTC0SDt7LII1PTPAYiGyGpjkyhZu3Gef2gVqoS4hO/gLqL1yTq9ocTRhhxaZyzqIpbNKnecMRr1CYYMmKpeepx4Qu1azQ7riK/X7sQBtxdcdrJcEXi5LbSoBllDBHHK6SEqEImzVAmpzjG55lrMcKrYm3+QWeuPNTRun8S2TVrEUvi8766xotmtWRpV2XL33Kh3UDKMifWqI70sFMPT7DkwX1jVZULeCvUwkXsimXMknNuLx2ynj4sVLSROPB+vnAwj/K62nijLy3Z73e48Jqplu9nDITj4I7Ir0OV1UwwxEACtwyY4HKcV7VaAh3imEVc6QrS1dmH+Bk/4sDwyRoFNzBeJsPobCg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(2906002)(66946007)(91956017)(66446008)(66476007)(66556008)(76116006)(6512007)(71200400001)(64756008)(186003)(8676002)(53546011)(508600001)(8936002)(5660300002)(26005)(31696002)(86362001)(110136005)(54906003)(6486002)(6506007)(31686004)(122000001)(36756003)(316002)(38100700002)(82960400001)(38070700005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UkVFTGdlaFM5d2JJUkkyVUduU1FpOHJJODZHRThGcFNUUlhVS0N0VXNDRUF1?=
 =?utf-8?B?a2xJaHZrcmNGZUs2eE5pVEhtSmJUenB0QitnK2M4ekNqNDNVTUhXS1lWYU9V?=
 =?utf-8?B?b2dkM0llME5wUUZhU2RhU1EwTHJUUjkrTmlvc1lsaloxZytGQnlUVVZCNkQv?=
 =?utf-8?B?VEVOWEppSHFpSjAwZDlJUzFOSFNJL2Z4QlFtZlNlWkd1cVBrOEtEb3VGMXJn?=
 =?utf-8?B?aDRJcVpNdCtmdkoyU2tiYXlvdDlkb3k1alFuWmIzVk04bGNHcERPZFFkaHps?=
 =?utf-8?B?amJjOFBNcWt3eVZYdmY0ZFVYL2hpUjFsSzM0Vk5VdWVtT1R1M2lYNWtZV1dK?=
 =?utf-8?B?b3ZTWFhOZ2VudjVMNjhVMlh3dXJXSGdBY0w2TEh4ajh6N2dBVnpUZGpSRkVn?=
 =?utf-8?B?eXFENjBaYnBCUTkyMjlFU2xLZ3ZHRHpYcXpsUWhzQVdPK3d2c0JkZHdBd0FV?=
 =?utf-8?B?b2VHaVY5dUlMUHZ3bDhVbHZoU3RxWXJrbnA5NzAwR2d6SUFUZE9oL1BSZDNo?=
 =?utf-8?B?OW5zOHVDTDRFdXJOc3ZpNXZCN1RPdWJwb1o0T3lMWnNCeVdVRXhkSEphaUQx?=
 =?utf-8?B?R3BZMUZnMkhNMEh5TkZnRzdzUXpPSTBjS3R3dUZEVU13UTdFWWNqTThlTTl0?=
 =?utf-8?B?aG9RZDQ0cWM1elJpNmlNaTBSbXA2ZXdoaXd3bUdqYUVEdzU0Z1c2NU1HWkJj?=
 =?utf-8?B?UFBDZXFqTEx6aVBrcGVCSlFhdzY5QTJQckJtTi9ob3hvZ01GeGhQcDB2cTds?=
 =?utf-8?B?d2hjQ29PNmNBaUQyRHo1bFRGUjBvUWt0ckpWNmRFcVFIcmJmdmZzVTJUM1Vi?=
 =?utf-8?B?VENDN25MYzBiZ0hoME9GRVRycXNkVktTMU1KZ3JvRWF6dWYxNkNmMkNGTXhU?=
 =?utf-8?B?NDBzRU1nd0g0d1g3TGd4cWR4M0pVUmZzdnFxcks3bUd2WUJTNjNNSzZTbEVa?=
 =?utf-8?B?L0MyaStRRC9zSDVjMlVmOElQL3F3YVRNVzhlWFBWM0FXZU5yZldLN1hCTE9K?=
 =?utf-8?B?cmJNNVJVVjNHbHlKM2dvVnNSYW9ka3BzMkU3NHVIays5WDdxTWhVdXVQVWIy?=
 =?utf-8?B?RkhuN2phOUt0ODU4VTQzM2RmaTBWWkRFTGVrdGtUOFhQdmcwSHUyYWl5MWNl?=
 =?utf-8?B?d0pUUTBrQTRBaFZTWXNPTmtFbU9SM3FYVERONTRuVmIxSGpNbzErdjFMa3ZY?=
 =?utf-8?B?UFFwaEpZYUcrZHBraFFHanlnZFpZQ3FDcHFXOHpEMS9RWUdqdXYwV0NQSGhx?=
 =?utf-8?B?SzI5bWtFVDNncFcwVkFvcEg4Y0lsaHh1cjZFcVpQdHg3dkNGNkxWdnVtZzlT?=
 =?utf-8?B?RUxRVjB0cVk1bkpleXdsYU9zV2lCR0xGWjg4S0craDJtaE1PUVpSQUV1emFO?=
 =?utf-8?B?MGE1V1BsdVo5Z245WnFWZDUzRHpEekxwL0VlUFkvRGxsSmdHZUtCZGRnZVNs?=
 =?utf-8?B?a0dFbWZCL1JWWnI5SGJGRFN1K0hRdjBPVjk3WWtSZHBLbTRkS00yaFVMWkJK?=
 =?utf-8?B?VFNwY1BKK1RjSWZWSEtVYjVHb0NrWm5jdkhTQnBCSytYQzB1aER2WThxeVdJ?=
 =?utf-8?B?STFyR2tlY0pkWFdnOGVYa0VMWUEzck5ycEtzL0F0WWR3WUdBdmU5RkNKdWE2?=
 =?utf-8?B?Q2lkeVRTOVcwUU15TFFEVHVMZnZkWHhZZGl6dktKU1h5cElQTGRibTlDQmZw?=
 =?utf-8?B?ZnB5eThzVHlzMlhkNFVjQlE4TG1LbGwxT0VtdGtzQ0tCTWRJUUhKcDRKV2x2?=
 =?utf-8?B?NXQrellib29ZdEcwVzhYR3daaFNRZWtuT2VmdlZERjhwbUQzNXkxbkxHM2Jm?=
 =?utf-8?B?dTFWMGFKUEp2dzZlRkhLblFyQWZMY01Jd3pSM2NaRHo5SGhMdi9vQjJjelhu?=
 =?utf-8?B?U1VwbVZpOHZDbEsyRmdENnBjQytUSjZGMFpzSGNpMmpGK2UxVXlSUjdXak1D?=
 =?utf-8?B?S2dRUjN2SnZCSXNyeUlNU2RCVzluZFgrWjV6V2dUcHVoR1lESk1VQnlLRlFk?=
 =?utf-8?B?Nm45Q3ZCb0hKbWQ2QmpkbjBFaldMM296bngwVDZFOTRTZ0xPWjlBdlBwOXBo?=
 =?utf-8?B?WkN0bVFCQ01ZV2pwMmZDcGt6NW9xQ3BzeEtKc05xa2VyWENYVlVZdlZvR1JN?=
 =?utf-8?B?bkZ4OXdtR2xFdm4wa29YaGRRRzRhZkNER0VkVFk2WHUzbVRSYUV3WElFNE1R?=
 =?utf-8?B?bERYWjkyMUdVMDkyb1U1WUpITFphclNIQ3NudHA5Z0NBYXJYV3pKMHdVQ3BF?=
 =?utf-8?B?SHN5V0R1R1doMURkUTlsQ3loVEwzblNEZlZiMUNsclZDZXFKbjd2TkxWQ1J1?=
 =?utf-8?B?MHFiZzFFMnhqQjJ1YTE4REg2UkRzajVzUHJPSlh3ZW9CQ2FOWFRpaXBYa2VP?=
 =?utf-8?Q?zqm5vnk6oplvaH4A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6783FD0F1CA364EA861243B1EB36640@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54984854-34bb-4422-ca80-08da284a30f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 12:33:54.0023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uc4UmA/DFY4qlQCoIUYrXct/kMYgEEnY/WHbARXkDVyYxPaK/y9QTWaRkkVyn44MF9A3cXDmluk8q8CHqpT/ezN+LOou5kgZoWHgELpxgoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3111

T24gMjcvMDQvMjAyMiAxMjowNiwgTWljaGFsIE9yemVsIHdyb3RlOg0KPiBIaSBKYW4sDQo+DQo+
IE9uIDI3LjA0LjIwMjIgMTE6NTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjcuMDQuMjAy
MiAxMTo0OSwgTWljaGFsIE9yemVsIHdyb3RlOg0KPj4+IEZ1bmN0aW9uIHVubWFwX2NvbW1vbl9j
b21wbGV0ZSBkZWZpbmVzIGFuZCBzZXRzIGEgdmFyaWFibGUgbGQgdGhhdCBpcw0KPj4+IGxhdGVy
IG9uIHBhc3NlZCB0byBhIG1hY3JvIGdudHRhYl9ob3N0X21hcHBpbmdfZ2V0X3BhZ2VfdHlwZS4g
T24gYXJtDQo+Pj4gdGhpcyBtYWNybyBkb2VzIG5vdCBtYWtlIHVzZSBvZiBhbnkgYXJndW1lbnRz
IGNhdXNpbmcgYSBjb21waWxlciB0bw0KPj4+IHdhcm4gYWJvdXQgdW51c2VkLWJ1dC1zZXQgdmFy
aWFibGUgKHdoZW4gLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZSBpcw0KPj4+IGVuYWJsZWQpLiBG
aXggdGhpcyBieSByZW1vdmluZyBsZCBhbmQgZGlyZWN0bHkgcGFzc2luZyBjdXJyZW50LT5kb21h
aW4NCj4+PiB0byBnbnR0YWJfaG9zdF9tYXBwaW5nX2dldF9wYWdlX3R5cGUuDQo+PiBJIHRoaW5r
IHdlIHdhbnQgdG8gcmV0YWluIHRoZSBsZCAvIHJkIG5vdGF0aW9uLiBUaGVyZWZvcmUgSSB0aGlu
ayBpdCdzDQo+PiByYXRoZXIgdGhlIEFybSBtYWNybyB3aGljaCB3YW50cyBhZGp1c3RpbmcgdG8g
bm90IGxlYXZlIHRoaXMgYXJndW1lbnQNCj4+IHVudXNlZC4NCj4+DQo+IEkgd291bGQgYWdyZWUg
cHJvdmlkZWQgdGhhdCB0aGUgbGQgdmFyaWFibGUgd2FzIHVzZWQgaW4gbW9yZSB0aGFuIG9uZSBw
bGFjZS4NCj4gQXMgaXQgaXMgbm90LCBpdCBkb2VzIG5vdCBzZWVtIHZlcnkgYmVuZWZpY2lhbCB0
byBrZWVwIGEgdmFyaWFibGUgdGhhdCBpcyB1c2VkDQo+IGp1c3QgaW4gb25lIHBsYWNlIGFuZCBz
dG9yZXMgdGhlIG1hY3JvIHZhbHVlLg0KPg0KPiBXaGVuIGl0IGNvbWVzIHRvIGdudHRhYl9ob3N0
X21hcHBpbmdfZ2V0X3BhZ2VfdHlwZSBtYWNybywgb24gQXJtIGl0IGlzIGRlZmluZWQgYXMgKDAp
DQo+IHNvIG1vZGlmeWluZyBpdCBzZWVtcyB0byBiZSBhIHF1aXRlIGJpZyBvdmVyaGVhZC4NCg0K
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9ncmFudF90YWJsZS5oDQpiL3hl
bi9hcmNoL2FybS9pbmNsdWRlL2FzbS9ncmFudF90YWJsZS5oDQppbmRleCBkMzFhNGQ2ODA1ZDYu
LjlmNjhjMmEzN2ViNiAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9ncmFu
dF90YWJsZS5oDQorKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ3JhbnRfdGFibGUuaA0K
QEAgLTMxLDEwICszMSwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ250dGFiX21hcmtfZGlydHko
c3RydWN0IGRvbWFpbg0KKmQsIG1mbl90IG1mbikNCsKgDQrCoGludCBjcmVhdGVfZ3JhbnRfaG9z
dF9tYXBwaW5nKHVuc2lnbmVkIGxvbmcgZ3BhZGRyLCBtZm5fdCBtZm4sDQrCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQg
aW50IGZsYWdzLCB1bnNpZ25lZCBpbnQNCmNhY2hlX2ZsYWdzKTsNCi0jZGVmaW5lIGdudHRhYl9o
b3N0X21hcHBpbmdfZ2V0X3BhZ2VfdHlwZShybywgbGQsIHJkKSAoMCkNCisjZGVmaW5lIGdudHRh
Yl9ob3N0X21hcHBpbmdfZ2V0X3BhZ2VfdHlwZShybywgbGQsIHJkKSAocm8sIGxkLCByZCwgMCkN
CsKgaW50IHJlcGxhY2VfZ3JhbnRfaG9zdF9tYXBwaW5nKHVuc2lnbmVkIGxvbmcgZ3BhZGRyLCBt
Zm5fdCBtZm4sDQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIG5ld19ncGFkZHIsIHVuc2lnbmVkIGludA0K
ZmxhZ3MpOw0KLSNkZWZpbmUgZ250dGFiX3JlbGVhc2VfaG9zdF9tYXBwaW5ncyhkb21haW4pIDEN
CisjZGVmaW5lIGdudHRhYl9yZWxlYXNlX2hvc3RfbWFwcGluZ3MoZG9tYWluKSAoZG9tYWluLCAx
KQ0KwqANCsKgLyoNCsKgICogVGhlIHJlZ2lvbiB1c2VkIGJ5IFhlbiBvbiB0aGUgbWVtb3J5IHdp
bGwgbmV2ZXIgYmUgbWFwcGVkIGluIERPTTANCg0KSXQncyBhYm91dCBwYXJhbWV0ZXIgZXZhbHVh
dGlvbiwgbm90IGFib3V0IGFkZGluZyBleHRyYSBjb2RlIHdoZW4gY29tcGlsZWQuDQoNCn5BbmRy
ZXcNCg==

