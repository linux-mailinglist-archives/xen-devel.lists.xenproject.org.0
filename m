Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B95665948
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 11:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475198.736780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFYb5-0000qS-SZ; Wed, 11 Jan 2023 10:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475198.736780; Wed, 11 Jan 2023 10:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFYb5-0000oH-Pd; Wed, 11 Jan 2023 10:44:43 +0000
Received: by outflank-mailman (input) for mailman id 475198;
 Wed, 11 Jan 2023 10:44:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHza=5I=citrix.com=prvs=3687a0f96=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFYb4-0000oB-84
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 10:44:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f20eab4e-919c-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 11:44:39 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jan 2023 05:44:32 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5705.namprd03.prod.outlook.com (2603:10b6:806:11a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 10:44:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 10:44:30 +0000
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
X-Inumbo-ID: f20eab4e-919c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673433879;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cUc1rSn5E96ZQjUiXm6XDYkzlgy88aybRcj54b94sWo=;
  b=TE/SEc0LL2OlItUbGekHcBrbPG/d7vmsn+fx4kGfvUOv0aPHb0zk6bwl
   YMLIiCEi0a/AbEgZswD9F5F0jMamtw4Sp6iZO66xv3ZV9EoMP1xJ0pmlz
   /6fR7k3QNkF0J7ch0Wq6l26uXjW3NvmNPV+T++YD8N++CXpLR6ThZl6Yp
   8=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 91036434
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ljqed6x6Wp1lm61TJ9V6t+fUxyrEfRIJ4+MujC+fZmUNrF6WrkUFz
 DcYCD+FaKyNZ2Chfd8jaYu2oBgFsJ7dz9NkS1ZsqSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5QRnPKkT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTFw9
 6c+DDU8VRC8usCw+PGXEeIyrNt2eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIguFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqAdpJSuHjqpaGhnWYwDciFQNJZWeX+6GU1GOwCs5zD
 Esbr39GQa8asRbDosPGdxq8rX2fvx9aWMdKFOY66walxa/d4gLfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaETMOMWYIaCsATA0Ey9ruuoc+ilTIVNkLOKG0h9vxBDr56
 yqLsi8lhrMYy8UM0s2T9lndjzWhjpPAVAIy60PcWWfN0+9iTIusZojt416L6/9Fdd+dVgPY4
 ilCnNWC5ucTC53LjDaKXOgGALCu4bCCLSHYhllsWZIm8lxB5kKeQGyZ2xkmTG8BDyrOUWaBj
 JP70e+J2KJuAQ==
IronPort-HdrOrdr: A9a23:LnaWaato7eFw7yIeZB3cLit47skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="91036434"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ly0DOinDCJRhiUEwZsIN+5hzjrn0ZM50W3A545q90BSo+xuu6nf2gxzRgeeJUK4E9GaiBa2706rVI3KKhaq/BGq5oE/54mUEDKklfS3ii5vWDnBykpybfCo0K6z641xyL+eZLvEDhmoepSdMKFSnkGgdLCropp/Al0q7s1YQiLwKFTf66G8/eL1Wc25fPcz2Lsu6fGrurAku7x/ntOXRql9YaNPFMZoJplX76kK94jCuNAFdLTIhT6oyNNgOhodx6v+Wjb5YdwSCJYrrXgSiw8D2RVAoP9lQaN2PK0JtUwBK120/p3noTkL9b8lqotqMXVWXPwG20FXyUQC3AnN7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUc1rSn5E96ZQjUiXm6XDYkzlgy88aybRcj54b94sWo=;
 b=Ic2FEesQC5tn7tPuSyrqexrYcYTYfZiu2JHWBr5rhIxWTZDuFIZoqg51ava0zN5DlxsazR09+3WmxvU0RiqTFb3/WX0KDjbOpYtZSfYjxazIK1JSIURiB7hXRD/n7h4fSQeIsAx0pK6q3C2G7hqDmQyDMV4THLozv+dSXbpolSZ/GMb77ku4ADGlHWJoEwb0PK3neJYchmYlxWvVFC5yasi0rR/06glMd3eXlyWtWFyP1vYp04FKfVkp2J6xHkLwjOC5Xz7c/AuMAMpolc3BZYiNr2aivVRp92hQEb12sdJdWxJOh/PDuAH/lKmDS0BlIa2l6xt4KFSfEjxdYHpApw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUc1rSn5E96ZQjUiXm6XDYkzlgy88aybRcj54b94sWo=;
 b=hXD2XI6/mSCGheEwrKJ7KP02xL7tHTTEf1WtDi84NcN5KBqKUZxtHCgTBKPHzzM+3YMqsCxyYKtK9wy/oLx4cwy0NZ0AHTtF9taKVpWWwnFcS+RoHV0nG1EiwAA6xG51oP3rITFzbW6BE3qW7ymOCkJFKJfpoiSliefU3Bf/jSU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Doug
 Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation: rename RISCV_64 container and jobs
Thread-Topic: [PATCH] automation: rename RISCV_64 container and jobs
Thread-Index: AQHZJRAt1qKQYAWJX02qzojGezRz/a6ZCT0A
Date: Wed, 11 Jan 2023 10:44:30 +0000
Message-ID: <4f15fe80-9a60-76ce-9cf8-2143ea2d86eb@citrix.com>
References:
 <cea2d287fd65033d8631bf9905ad00652bf11035.1673367923.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <cea2d287fd65033d8631bf9905ad00652bf11035.1673367923.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA2PR03MB5705:EE_
x-ms-office365-filtering-correlation-id: 9e8c6818-9c28-4420-43f5-08daf3c0d1e0
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8aqcETFqg2puyXjMekJLe+wDZgnxwK0lfUIcrnQaojG0jS8gWTp+5cuvfThQyT0tXQmGxlZiGpRxisrBnJe7uVeI3jViBOuSSia92xDm2UrYmPcnywj2HSm0k4SgHxX6BAku59uLo+WSOVNMYVmKK+7xpMVbKQCdvjdyVNPc6L0OTOq1Eido/eaGbADcfO38bK4uQyO8Fq1Ic7yAyQt7FoEFqo/450VOvgCUYn9egLcpDugUAX+LTD7EjSb8qPeI2c0/Wjq0CHh2YbzZ4HHUVPhTV7zrfwRiLALlsQrpA9S6YeTXw06u8WNr0vlpHpqYil3YZfzp69s3ABEeNEZSknGtJnQG0YETrhAaRrZQn/oGJXcwz5l92hgAt8XSToc/iaRh7eL4z4hkZYpepGCWrRTjrenIHh46ImmwJXZa3fXjE/U5y9iYaZqFkFyZkL8q479DS1mYjiw1eOHdomj1/D7Z55xL9Oehnzo5xtBlUHGLEJOlQTxfFWEwPSVjukQ2WFH+DxpGWZNfVls0XAxTzJ3eI6eEFnCeRxVHY+dT7AnplsAxzMokWfsIRtEG+mBlGxy/xo0igsfibt2aog9PDotwchBzgvRDl0whitZjHNKTo4p4fhDn6zQVQ5+BnacYytootpb1rvO/g445sX/qP2e4E9G4dolspwIHrQvLji8WBYpgFgKyAm29rWawHrNsVP3KXwwpRRNaljqXzaSmnfy06q/DGxKvsCtD6s5Ivl5Q1PSLS8CImn7arEldUBGtaghFMrRREyo6kuSa7eWrAg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199015)(6506007)(82960400001)(38100700002)(122000001)(31686004)(53546011)(2906002)(478600001)(6486002)(86362001)(2616005)(4744005)(8676002)(186003)(6512007)(316002)(26005)(5660300002)(71200400001)(8936002)(36756003)(38070700005)(31696002)(41300700001)(66446008)(66946007)(91956017)(110136005)(54906003)(76116006)(64756008)(4326008)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NklaeEF0NEI5K3lGTStmYkJCTS9FdXpvNE10b3FhNFY1MHduZnFUd2cyY29O?=
 =?utf-8?B?TVBTNGJhY3oyMExoQ3BnelpVbmRqU2I2cWVHcU1VOUZsWUVlSWVjWHo4dmZD?=
 =?utf-8?B?dXN2emU0cHpFL3g1c0tCeklmQmx3N2tnclk3Z0ovblRjL1VyR0RNWkVuRUdu?=
 =?utf-8?B?Ym9XY0FrRzk5cUlQUm9XdnF3TGxxOThOT0tZZW5QU1l1eEJsS0RVV2xkUnJX?=
 =?utf-8?B?V1gyZHoxYzB2VEYzS3VMK1g4UTBTRFRPbitnMC9JR1JvQ1YxZ2IxZHVUUm9l?=
 =?utf-8?B?MXBId2xmODh3QkRld2lwbDlhalNlT1FmV0RMemlnUEJuNmNxdDdjRzkzZE4v?=
 =?utf-8?B?UFVqcE01U2FkeDdicHcxUkdHOG5GRjZRbGFxY0duKytpdEdFRHNLQWhILyts?=
 =?utf-8?B?MTk4clJFQWxUKzZhdzkvKzJGdkViVWswVWhXbWV4LzRlYU1PTTAxenhkNG9u?=
 =?utf-8?B?REtIVlBIbzc5cWdIVU5TamNZanRCcDQybmZlUnFDRThsRGhmdmErVklHTno5?=
 =?utf-8?B?NEZmRWtSOVlOamdTcllzR3NXVHdOZzU3YjdCaVN3dzJQc1Axd1U3ZWc5L090?=
 =?utf-8?B?VVhzaEl0ZHdWamJYSSs2eURIUVBXbzNSZWhQcnYyb05SKys2SitNbDl1NUF2?=
 =?utf-8?B?SDFKazNOdVhWVmcrRFNISHdDZkRIbDlGemVzT2x2UTJ0VzZNSzZ6Wi9Vby9z?=
 =?utf-8?B?OTFxOFFFSnBFZXBqby95ZWRhdnc4ZW1FamFlU3RwcE95RWt2Q0hvWGYra2hE?=
 =?utf-8?B?dk5NeEZWcjZrdGQ2dHhEdHVTK1F0azQ2TnlwR2wxRU1VeVR5MTgyK2F6VUpV?=
 =?utf-8?B?b1pPSDZaVmJVdUxnc2hGNUtMMVlQeG1hejI2djU3ZUlhSklUNmtWWmwycko5?=
 =?utf-8?B?ZzB6cU5jOTQvYVFHaGdTOHdHZ0tlekNBd1k2dmFXOTJyN0hQU0lDQ1lBaFdi?=
 =?utf-8?B?dHNsb1NlZ3RxTlZTUFlrTGY5OThMUkx0VE9xd1NkRmUzUmhtdWtocHk5bmsy?=
 =?utf-8?B?RzVqYXJVL29TZlVZKzFlWDRHeDhZWnhNQ1VCTE5XK1dhdFl0Z3N3bGlzNURw?=
 =?utf-8?B?cjd1WGZOVUF4UlFzZyswV1M0aWdLb29nelIwM05uM0pTNU1QVFRibHNZclJp?=
 =?utf-8?B?SGIyNkZUSEk0VGRiQ1ZWSkQyaWpJck9jdGs5M3JseEk4Y052SE50VUFOMjlh?=
 =?utf-8?B?QjZOdDJGeG4wcUc1blp4NUs2TVlNbmVlVW5PRmFpaTVWYTdXWTNQMGM4RXls?=
 =?utf-8?B?Nk5zcHM3cG12bGdrcUh4UkV1UXNxb0lQaXpLL0tjMEtWZGtUWGhlVktsbmw5?=
 =?utf-8?B?TElRRU5YcGF5V0JjZnNIQTk4NnZLQW1BQzlBS2g2SXI2ZFdLNmF1T1VwelB2?=
 =?utf-8?B?YUhaTUNwcld0RkUraWQ3dGhYMHY5ZkNCd05DUGZOam83cXZoajdOZUplWTdP?=
 =?utf-8?B?U1NDVjY1aXZTb1c3ZUY3WmRxK0hocElOdlRhUWxacitGN25qNDJtcW45NkJP?=
 =?utf-8?B?MlBaZ1IybDJEOUljVEgvUDZ1bVd2VFpvNTFUUlFkaFpoTlNpWFVqZElicHp6?=
 =?utf-8?B?OUgwa1VnMit3cmMzUk42UGFYZkRTOWJOWXBQY0MxcGFQaTByNVhLWm9HQm1T?=
 =?utf-8?B?S01CU0FSazZCTGQ3YU9OVWdqOHpZcXpKOEM5bGJ4eWYvZ21jaDlkRmlYalRV?=
 =?utf-8?B?TjI5SmdVL2l4UjZJOW1oS25YdHFYQ21nM2tTVkVQTXExUVY3RWRFWGFRd0xn?=
 =?utf-8?B?S0RIRVVtNU9td3ptdkFha1VZYWlZRXZad25mNjNjeGVmNXY1Wm5XUFNTOXVD?=
 =?utf-8?B?SmpCNW1FRFhwSG9wUVo4dU84RXdCMGZkWTg5dldobGZHaDVOUmplWXpKZTJV?=
 =?utf-8?B?SzEyUUdCck9NWmx3WU9aNk52QXVYeW1mcmVSc2psVVJIK0lBV2RJaXU0aEpR?=
 =?utf-8?B?aVl6aW1XZ0ZoTHdJQStidi9zZnpwWHZSa3dSK3BWUnFnbHU4Yjltd3RuWXNB?=
 =?utf-8?B?eEtpWUJibEpSMmh3cnNCTDFOdTZTUCtaWkRSMjg3NVoyN3d3RmxVeC83c1kr?=
 =?utf-8?B?Vi8rRFBVT1lRNjRMREsyVUwraUEydnowZGhsVkpjRjQ5Y1VpbzNaV1B4cm9V?=
 =?utf-8?Q?VEvbLrJUJ4ZQfVXZARY9zsDrk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F509C742F10CBA41AA61294CB57F072E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Sx7J0+f4Oc/Ow5QLPWYyKHciRRIdyxTKwZM1lay79O9vnwknoE8VBkaSPiduaPx+eFuTad3pCkfNkf6y6TOiCy372Xu0rjFVDGaVlfG6o6T/U/piC7nSgsEt6pVcTos/ZKcxmX4EcAJErKrrCQ3oa9LqqzFl/Q3QFiqCfs1r3cQOyN4VERLEbrq2iC33YN9csO2YvGXMDcjjORqUcN4W0Rs2ZZN+ugIdsqujj29dUJnPqaXS8M0Er3J4PYSbK9iApBD7r2Q2zxVqEV8+syOTQ6E4I8M6D8lA++6rW8BUDu3EK7eSQhnb649IY7te6AccVdbGwgfJWT1qi2bRwVMDWvgZVenSgrjFbo4Ll85stbNg/WqOX8zxTt2ChpXyVou1xTAeb858c0ZgC4dyLoMRSroRfG3DtwCHfdtqW0APQY3iXLDURhW+Sc/3kxBl7y2+UbWBnO9tZh6nAmqomVEdWhCk6nStkg2fD/IQAZXYBKaWQ2S/Y+rfuRLP5rnxHDgBxnoLS6sxnkM6z5TTUH6ALvl/WJNmgqkXxYHuc1gQnjVAMWn+olSFgZBtMnU0VosNjmQkxZz/C1Sk1gJQ9lU+y9bhJ38By+KCs8omdKbwruGMSnWmYPfpWlEc5fnkkPzOZ8nz3HWb0LFye0MUXZqlVZcSTPDgcPgK9ni3dXWiDCwGJ7NGr88X3U/l3YnzWEFim6ozNSDPUBWvA2MWvJ1PSSUwTNTS1d55rxQIvNWDCFYGUiA+dXgzjW5CHQurkugwZ3VyewEeMAEcH+9uss3F+WvG8n2feKs9sIZBzeH+kCXzEHFKJfa0SFy+hgH08kTT+Yhu3tHhcJ5n8ppo98tWT4YEDC8Gne2OuoDRNYOmnW1hMLZO1qkc5hZmTk9vBDAkGgSapc+P6ZnXQ38pY5rZpA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8c6818-9c28-4420-43f5-08daf3c0d1e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 10:44:30.6596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: elDQ/uevrmYXhPYqA2rsgJw/8LY2jZWjXiv1E00HiIdZhuzVhZ55nEzJHVk4vtjaepkNpVFwRWGQoI+EQdyHTFoE9ZRAS3nriC0fnV8A5Dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5705

T24gMTAvMDEvMjAyMyA0OjI1IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBBbGwgUklT
Q1ZfNjQtcmVsYXRlZCBzdHVmZiB3YXMgcmVuYW1lZCB0byBiZSBjb25zaXN0ZW50IHdpdGgNCj4g
QVJNIChhcm0zMiBpcyBjcm9zcyBidWlsZCBhcyBSSVNDVl82NCkuDQo+DQo+IFRoZSBwYXRjaCBp
cyBiYXNlZCBvbiB0aGUgZm9sbG93aW5nIHBhdGNoIHNlcmllczoNCj4gW1BBVENIICpdIEJhc2lj
IGVhcmx5X3ByaW50ayBhbmQgc21va2UgdGVzdCBpbXBsZW1lbnRhdGlvbg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBPbGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4NCj4g
LS0tDQo+ICAuLi52NjQuZG9ja2VyZmlsZSA9PiBjdXJyZW50LXJpc2N2NjQuZG9ja2VyZmlsZX0g
fCAgMA0KDQpUaGlzIHJlbmFtZSB3aWxsIGJyZWFrIFhlbiA0LjE3DQoNCk5vdywgYXMgNC4xNydz
IFJJU0MtViBzdXBwb3J0IHdhcyBzbyB0b2tlbiB0aGF0IGl0IHdhc24ndCBldmVuIHByb3Blcmx5
DQp3aXJlZCBpbnRvIENJLCB0aGVuIHRoaXMgaXMgcHJvYmFibHkgZmluZS4NCg0KQnV0IHdlIGFi
c29sdXRlbHkgZG8gbmVlZCB0byBiZSBhd2FyZSBvZiB0aGUgY29uc2VxdWVuY2UgYmVmb3JlIHRh
a2luZw0KdGhlIHBhdGNoLg0KDQp+QW5kcmV3DQo=

