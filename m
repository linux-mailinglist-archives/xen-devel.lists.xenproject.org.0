Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DAA586BBE
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 15:17:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378752.612129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIVH3-00025i-Od; Mon, 01 Aug 2022 13:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378752.612129; Mon, 01 Aug 2022 13:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIVH3-00022W-Li; Mon, 01 Aug 2022 13:15:57 +0000
Received: by outflank-mailman (input) for mailman id 378752;
 Mon, 01 Aug 2022 13:15:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bsKS=YF=citrix.com=prvs=2051f115c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oIVH1-000227-Jy
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 13:15:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11775e35-119c-11ed-bd2d-47488cf2e6aa;
 Mon, 01 Aug 2022 15:15:54 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Aug 2022 09:15:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5811.namprd03.prod.outlook.com (2603:10b6:303:91::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Mon, 1 Aug
 2022 13:15:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 13:15:40 +0000
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
X-Inumbo-ID: 11775e35-119c-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659359753;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Zk6AQqhWd2uOMQ1KSQVJsYyak0O3zp/F52M8UOMXjZ4=;
  b=fvlYoalTet/cude3XE1Qc2bmpbUEPbcS1XZ2lAhTWgxugBgEMxsWexUt
   sLWaMAEX61eRUnEmSDplxi6HavfMmNCCVbZp38M1erif8M6zevebUt5oC
   PrngG4oopV5T+GOquWRSPJ0n7bIvzWHa0qEg0Rx01GX0NgGgyDBRAoGLr
   o=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 76863592
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9MkIxqkEfhWOQcU6Dnx1FCvo5gx8J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWGqGaa7fM2v8co91Pom1o0gB6pTSnYcxQAJlqSlhHyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37Kyr4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kGGNE89chOGV0W0
 u5CcwwWTy6E2ti5lefTpulE3qzPLeHNFaZG4jRK626cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWIA7gvN/cLb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+trSz82LSSzHmTtIQ6K4K/565MgVqv3m0YDjkNTGS9pfyboxvrMz5YA
 wlOksY0loAw6UiqQ9/VTxC+5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sZjlac8Arr9NzTDAv1
 1mhj97vHSZosrCeVTSa7Lj8hSO/P20ZIHEPYQcATBAZ+J/zrYcrlBXNQ91/VqmvgbXdHjX9w
 CuDqiQksKkCls4A16i9/lfvjiqlo97CSQtdzg7QW2ek8h90fpWNd4Gu8ULc7/tLMMCeVFbpg
 ZQfs82X7eRLB5fSkiWIGb0JBOvwv67DNyDAi1lyGZVn7y6q53OoYYFX5nd5OVttNcEHPzTuZ
 Sc/pD9s2XOaB1PyBYcfXm57I55CIXTIfTg9as3pUw==
IronPort-HdrOrdr: A9a23:iq17a65CBP66FxWWhgPXwWuBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWStGNwyUGT3fARAghKRfapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jViuKYlGchsRLYkjTVoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6svM7z64HRmyGG8fIzmZ0Wd9ih33ekLhpTsALz2LCaEVFci18O9vvR3OLyoZ8
 qO
X-IronPort-AV: E=Sophos;i="5.93,208,1654574400"; 
   d="scan'208";a="76863592"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsDTcBemaX3NfSOfHoCrjzQ60EAzQI0NUUhgQ0zIx88CRIA34AyYYk1DnOleV5mBtVlcxFyyNo2uaOg9YOPM7xlGog8i6rCZcNrqUtNYsZW0Dm5+ZqZWedxD+/dcUBloKCiMawF/lfbIA6o0BaUd+GK1sEHDm75K0Dhug6Z+JfdVyy3uooaP8EEA4caqP4Jq8Vns5MFmTJSKiZ4VAQmP8vbsc8Mjn/jI9zuhPMJ17o14miDl6tmWYAlo2uqnDwi96wNSQVg+JQrCEoU7627x2Q9rk9vHTIU5mYxLVp8ELzYx5/HOOTj5RRqvz9rTbbyz0F/oX/DCrRN0JPRZ2+VFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zk6AQqhWd2uOMQ1KSQVJsYyak0O3zp/F52M8UOMXjZ4=;
 b=AnNob/QkQfVTeHsYlDeTu0KevQ1DOlPwNUth7lAaX70nuHJqnjdGheopSNnD6+/zQ3TUc9iSvXunSWQOF0//INQr6Kf9G8puUS1+XKSHvF+wGEUBcbONGNSgWJS+fN7ILJwxnJG4K1pcMUTZLSUsbHNXPwtRsOO5i1B9OrHivP+3Tz832Hi7vLYJ5DCH9hNSrFpUvg98fiNfkWh5W4OpqD8y5elwHtDH5NlvyMLRfod+bhy9H6tIv6h6AEgy3XePyBax+WIpt36FXCty4MCd003Y75v48pZG+2SxxX4Ge1CMC3NfPt5rJEn7dlrD1mlNnOsXzM+KwA324G+rJPCFcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zk6AQqhWd2uOMQ1KSQVJsYyak0O3zp/F52M8UOMXjZ4=;
 b=VMHeAcOyr8hGD0DD41BJvjQRQyYTWL98/a16NLI73vuamBq+TlOxxWQSBxOFgRym88Ndc4dxYpwtKCjVhpv6e3lywadQj6zk1Xs45eo/+polmzyfvVtRYl3gm4N1ZRsTkaHfCSBHy6S21boBriU7jN+noCd15NmOJWjNAfgVjCI=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: osstest service owner <osstest-admin@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Anthony Perard
	<anthony.perard@citrix.com>, "committers@xenproject.org"
	<committers@xenproject.org>
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Thread-Topic: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Thread-Index: AQHYoucqKBVQjzDSEEqelmNJqFa/7a2U4XaAgAC8VYCABB/vgIAAAhuAgABL84A=
Date: Mon, 1 Aug 2022 13:15:39 +0000
Message-ID: <ff565bad-c2be-5128-aeae-28f614f0230c@citrix.com>
References: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
 <08606914-f5f4-8415-51a2-f6a5e1c54d20@suse.com>
 <db39670c-7e36-2cf5-a87b-92d10d3aac18@xen.org>
 <7bcf8fac-df56-2032-0057-2b7c671e59be@suse.com>
 <16b1c490-1d8f-1c35-496a-a60fb1404fc3@xen.org>
In-Reply-To: <16b1c490-1d8f-1c35-496a-a60fb1404fc3@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2e93161-48ea-4b62-26c5-08da73bfee47
x-ms-traffictypediagnostic: CO1PR03MB5811:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WR8HD9y7xJJBBS5wS21rOPVeD2rMtGgLO0Pcbhz8InFQY+gENCS+0Y3BrP3Ic0GOlZX/yVWylyEVzwK/zQeUXHHTFNDteDqSJHXJ173U5W/wh3oYKyLlVD5+Jgsi1OZeodEzObEqCFSkl3nIe3ma6pAVrmParC53wUJQZVgEwEdDeQ6ejwWRwt8iRPN8qmOsaZLwusikf2gBk+Z40H0PFgNqExlgAXsZbOSf4GxpyAKphmdx3kqkgWi/P0QFwertGTTxgmw/61ysYq+pw8VZhpI7h0hHE4FqaY6l8+BKyIYuqc9vvQoTlUguy2sH9WBenisqJFiv1oXag+VT52J7jCDsF/K2Ww5IQCUhFgcu7P3yTVZoCMdhDIfTXuHtpuT2DSduFA81IsYUcbUyg2I15ywmwAb3J+COC5xEMtDlZBnYRyaqpq+eVgOISPIPNB5MkpgRm32FmjmGdxXqzGnZAMriEcAymuDU/kfmrEAEesSaUnp6lOTH8npc3HR+tKcYjTFWWqfBuDq+Ims29J9ZBQscaU69ArJEJG8yECAnG5OLXWxBc9kb1ds3f7SXy2fSh4c6RFAt1s0IXUsXN/U7U4rGMCCiwINbAQPoaCOzpp4dEbE/xlebn5FjRQYH6yihICfmSTSGVQAIB39UmUSN25cWZC4kuMjlw5hOCOkgjjFzClEa8T5lBJHgHW343mayGTaH5YPWZ9ziT4fGugtypMWZxk+vaIvfWJ/UMLNGk+gXNbCZnAdL6S1H+ZRTM4c2ICOj1/RLYfgdVWOSo5FF1eYYyh/+2/Bt2uj8FBp0mVe3sI7b9L+wGo3B3OETdc8f5OyHFytFszaFBXPE6Y51SdPymkh4NFy7Jik/BJ/iq6qN9hNKjbEBQclRF2aNeQf/6j0YePp57kej7zdilD0eww==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(478600001)(8936002)(186003)(6486002)(5660300002)(966005)(53546011)(31696002)(86362001)(6506007)(6512007)(26005)(2616005)(41300700001)(83380400001)(122000001)(2906002)(316002)(82960400001)(66446008)(110136005)(36756003)(54906003)(4326008)(8676002)(38100700002)(31686004)(76116006)(91956017)(66946007)(66476007)(66556008)(71200400001)(38070700005)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVNVOHRWN1ovV2g2L0hJQ21TL29hbit3aXdCWWMvd0ZaUVM1a3dad1NFWE0r?=
 =?utf-8?B?SzNFbERmYlVub0ZsTlVVTlFTM3lFVVV4SG0yb05WeXdVTUxhR2tJVHB4NjUy?=
 =?utf-8?B?Q1FUWGR1VGRWMlovZ21vQkUwWDBzZmNxS1R0cHNxaTBzOEMvazQ5MTNpV0pY?=
 =?utf-8?B?cHVCVHBQbkt5ejFCc1k1L2U4WmFwblcxQ01PU1hESktoUEFsM1N3NWgrWnNM?=
 =?utf-8?B?dHAvdW92LzBRY0p4amwvWUoxU1V3eGRuSTdBSnBRMHJyTHliVzRrQ081OFlI?=
 =?utf-8?B?czFOY0pLM21NNEEzdmxuUmdBbTdzSTJDV0o4THIzMWhXbVo1dnNNN21CbTZG?=
 =?utf-8?B?cUlkMTRaN3c0ZkZJM3hUZE1ZRUROUTJ0M3ZEemdCUElNTXI5ZFI5bS9md0Vk?=
 =?utf-8?B?NnhzTzRmY1kzaURKbGFrcGpTdjUzMWtOY3lTU3l2Ry94TVQweHYxSjlvWnJn?=
 =?utf-8?B?SER3dzhXeTF3ZERzR3doMjZJOWdpY051cFFLaHBHbXBBaktmdThuWG9oVm8w?=
 =?utf-8?B?QW5xbzVWYm1DMUlvS1BhZVRPbHhsRlhHMFZycnZlNVBMVUwwTXVaaFZhWEcw?=
 =?utf-8?B?ZGVxc2lXRGFXaGNjMTN4YnZ4Y01KU0RmOVlzbHhwaVZzaDRCUU0wR3F2bkc4?=
 =?utf-8?B?TDZmdmFYeXFLb21xNU4rbnZ5ZGpobDMwbytEckQ5RWlKdkN4bmdaSVprWkUy?=
 =?utf-8?B?RThrazlJU1Nad3dHa0FNZkJZMy9ieTlHdmM5YVphOW9rdEIxVGR5eGhnaGpu?=
 =?utf-8?B?NU5yMjFkTjJlWGxyZEtCbG1MSGtPRVM5clpLL004M0dPc1QySUM1MTBLKzNH?=
 =?utf-8?B?Q3RtY3BsbjdURDdGcGRoU08vM2tIT0lMNCtXQzVBY1hKNjhnSUZOV2l4bGZy?=
 =?utf-8?B?ZGF2QnJsK2ZlczA0QUh1alMrR3ZXaGtYY0ljc0Z5dDZIUTJNZEVNTmZlRWJu?=
 =?utf-8?B?RTlaY2xUNTFPOWRQdzZHV3QzYks3S2o1ZFdyRnhZQWMydzRqYWRQM05xMjRS?=
 =?utf-8?B?NkVJSmk5K0tuNm96eUtoZG43MWFPRzZSYVVTZUpzektkcXdsOWtsbHJPdSt2?=
 =?utf-8?B?eDl3NDMyTEdIdlZxZlhKcHRZSG9VZThDVFlpcjZldDhHYzVZUlROaVdXMzBD?=
 =?utf-8?B?VEhRdVNiNGxLRU9KZGpUUkExQk5tajdYcG1qRDcyZVh1R2loODFDSGc4a0dG?=
 =?utf-8?B?cTllMlBxUmppdjBOKy9TRFRDOTYwZnVlRlR1TmNDd2hPUktrOWlJeTJwTTNx?=
 =?utf-8?B?QjlsdXNrVlRrbFd5TjZZOW9sTzN5aTYxemFyK1lFS2JIZlUwSE04MjhKY0Fy?=
 =?utf-8?B?Nms4ZjZuM3J2cnZRaEIxY3N1ditBVFJwQ1RaMU9qS3c3TEhTNDZuaUNHTVVn?=
 =?utf-8?B?aTBTOXBXY2I1WVhvK0lUQ1pYUFpWQkhCOHFRNDk0QlBoZVg2Lys3TFluUTlG?=
 =?utf-8?B?bXFxdHBMK3Uya3lqaWFnVmU2a2xVU0t6d083L3M2aXgycDVtb2RuaTBNK2M0?=
 =?utf-8?B?S09zaXFxOUppVjFwWHVqVUwveGFMWTh3UVBQbS94OUJjY3dzRXBidXJhN3k4?=
 =?utf-8?B?WjVwbVpuWXZtZ2hjU21XTGhIQVk1UWNXRkdmcFZXY3BUcVNwd2FOZVBONlNK?=
 =?utf-8?B?Wk5TcmN2cTdkZ0pFNGltdndibEJ5ckFHWUtDNFREY0JhbHdiUVkvWlhOc0gy?=
 =?utf-8?B?YjNtTHNJcmVXdWRZWWsyQktoYlhtTGV4VHU0UWxhN0F6akxZRlVnOXcvWDV4?=
 =?utf-8?B?ZTBjUERxbFNsU2JQdkkrZEtUV1ZiSlBwN3NMODhRTUFxVnl3RVBUa3ZUdVFB?=
 =?utf-8?B?VW10a2lGL2dWeDZGeUwzWVpwVWRybG5VbGswaTBRQk00SVpWUFgyNXZkVVJ3?=
 =?utf-8?B?eHFBYkh3d1JzUG40Yzl0OTBzMGlGbU1nL3FjWVJiWkRIUjczL0hMRk0yQkRC?=
 =?utf-8?B?aHk5dlduZEpxSGtZMndlNlVOYm5aMUxSR2t5ZkRsOU9IMjhCWWk2VjNQczZY?=
 =?utf-8?B?YnJqYTN1VzRYRG9OM25USkFBNlU4QkdTbTVST3Vib0d6Q0Rickd6WXY3S0ZW?=
 =?utf-8?B?SGZFQmxiVFpCelpHRE1TV1JpUlVteGMxMWpCcEdLTkYrR3JBMGU0d2lHTzhr?=
 =?utf-8?Q?1XBHbQObTuywGKHtu1LfmTtx3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13FB6D8AD946C849B8A6B39EE361DC54@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e93161-48ea-4b62-26c5-08da73bfee47
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2022 13:15:39.9309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /swKbZsCVXQUC8+7+paF0Zo+2cFyVemfZLdPnE7o7HE5t97Fex+s4Fvvr3qXtcBkUbDn3DvyHqOZ4RrFqHXP1kTKwc7wxnQ6gefXdpzO8TY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5811

T24gMDEvMDgvMjAyMiAwOTo0MywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiAoKyBDb21taXR0ZXJz
KQ0KPg0KPiBIaSBKYW4sDQo+DQo+IE9uIDAxLzA4LzIwMjIgMDk6MzYsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4gT24gMjkuMDcuMjAyMiAxOTozNiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhp
IEphbiwNCj4+Pg0KPj4+IE9uIDI5LzA3LzIwMjIgMDc6MjIsIEphbiBCZXVsaWNoIHdyb3RlOg0K
Pj4+PiBPbiAyOS4wNy4yMDIyIDAzOjA0LCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6DQo+
Pj4+PiBicmFuY2ggeGVuLXVuc3RhYmxlLXNtb2tlDQo+Pj4+PiB4ZW5icmFuY2ggeGVuLXVuc3Rh
YmxlLXNtb2tlDQo+Pj4+PiBqb2IgYnVpbGQtYW1kNjQtbGlidmlydA0KPj4+Pj4gdGVzdGlkIGxp
YnZpcnQtYnVpbGQNCj4+Pj4+DQo+Pj4+PiBUcmVlOiBsaWJ2aXJ0IGdpdDovL3hlbmJpdHMueGVu
Lm9yZy9saWJ2aXJ0LmdpdA0KPj4+Pj4gVHJlZTogbGlidmlydF9rZXljb2RlbWFwZGINCj4+Pj4+
IGh0dHBzOi8vZ2l0bGFiLmNvbS9rZXljb2RlbWFwL2tleWNvZGVtYXBkYi5naXQNCj4+Pj4+IFRy
ZWU6IHFlbXUgZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3FlbXUteGVuLXRyYWRpdGlvbmFsLmdpdA0K
Pj4+Pj4gVHJlZTogcWVtdXUgZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3FlbXUteGVuLmdpdA0KPj4+
Pj4gVHJlZTogeGVuIGdpdDovL3hlbmJpdHMueGVuLm9yZy94ZW4uZ2l0DQo+Pj4+Pg0KPj4+Pj4g
KioqIEZvdW5kIGFuZCByZXByb2R1Y2VkIHByb2JsZW0gY2hhbmdlc2V0ICoqKg0KPj4+Pj4NCj4+
Pj4+IMKgwqDCoCBCdWcgaXMgaW4gdHJlZTrCoCB4ZW4gZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3hl
bi5naXQNCj4+Pj4+IMKgwqDCoCBCdWcgaW50cm9kdWNlZDrCoCA2NmRkMWM2MmIyYTNjNzA3YmQ1
YzU1NzUwZDEwYTgyMjNmYmQ1NzdmDQo+Pj4+PiDCoMKgwqAgQnVnIG5vdCBwcmVzZW50OiBmNzMy
MjQwZmQzYmFjMjUxMTYxNTFkYjVkZGViNzIwM2I2MmU4NWNlDQo+Pj4+PiDCoMKgwqAgTGFzdCBm
YWlsIHJlcHJvOg0KPj4+Pj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3Nz
dGVzdC9sb2dzLzE3MTkwOS8NCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gwqDCoMKgIGNvbW1pdCA2NmRk
MWM2MmIyYTNjNzA3YmQ1YzU1NzUwZDEwYTgyMjNmYmQ1NzdmDQo+Pj4+PiDCoMKgwqAgQXV0aG9y
OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+
Pj4+PiDCoMKgwqAgRGF0ZTrCoMKgIEZyaSBKdWwgMTUgMjI6MjA6MjQgMjAyMiArMDMwMA0KPj4+
Pj4gwqDCoMKgIMKgwqDCoMKgwqDCoMKgIGxpYnhsOiBBZGQgc3VwcG9ydCBmb3IgVmlydGlvIGRp
c2sgY29uZmlndXJhdGlvbg0KPj4+Pg0KPj4+PiBKdXN0IGluIGNhc2UgeW91IGRpZG4ndCBub3Rp
Y2UgaXQ6IFNvbWV0aGluZydzIHdyb25nIGhlcmUuIEkgZGlkbid0DQo+Pj4+IGxvb2sNCj4+Pj4g
YXQgdGhlIGRldGFpbHMgYXQgYWxsLiBQbGVhc2UgYWR2aXNlIHdoZXRoZXIgYSBmaXggd2lsbCBz
b29uIGFycml2ZSBvcg0KPj4+PiB3aGV0aGVyIHdlIHNob3VsZCByZXZlcnQgZm9yIHRoZSB0aW1l
IGJlaW5nLg0KPj4+DQo+Pj4gV2UgaGFkIGRpc2N1c3Npb24gb24gSVJDIGFib3V0IHRoaXMgdG9k
YXkuIFRoaXMgaXMgYW4gaXNzdWUgaW4gbGlidmlydA0KPj4+IHJhdGhlciB0aGFuIFhlbi4gU28g
SSB0aGluayBhIHJldmVydCBpcyBub3Qgd2FycmFudCBoZXJlLg0KPj4+DQo+Pj4gSW5zdGVhZCwg
aXQgd2FzIHN1Z2dlc3RlZCB0byBmb3JjZSBwdXNoIGJlY2F1c2UgaXQgaXMgZ29pbmcgdG8gdGFr
ZQ0KPj4+IHNvbWUNCj4+PiB0aW1lcyB0byBmaXggbGlidmlydCAoc2VlIG1vcmUgYmVsb3cpLg0K
Pj4+DQo+Pj4gT2xla3NhbmRyIGFscmVhZHkgc2VudCBhIHBhdGNoIHRvIGZpeCBsaWJ2aXJ0IFsx
XS4gVGhlIHByb2JsZW0gaXMgZXZlbg0KPj4+IGlmIHRoaXMgaXMgYWNjZXB0ZWQsIG91ciB0ZXN0
aW5nIGJyYW5jaCBmb3IgbGlidmlydCBpcyAyIHllYXJzIGJlaGluZA0KPj4+IGJlY2F1c2UgdGhl
eSBzd2l0Y2hlZCB0byBNZXNvbiBhbmQgT3NzdGVzdCBoYXMgbm90IGJlZW4gYWRhcHRlZCB0byB0
aGUNCj4+PiBuZXcgYnVpbGQgc3lzdGVtLg0KPj4+DQo+Pj4gQW50aG9ueSBraW5kbHkgb2ZmZXJl
ZCB0byB1cGRhdGUgT3NzdGVzdC4NCj4+Pg0KPj4+IFJlZ2FyZGluZyBmb3JjZSBwdXNoaW5nLCBJ
IGFtIHdhaXRpbmcgZm9yIHRoZSBPc3N0ZXN0IHJlc3VsdCB0byBjb25maXJtDQo+Pj4gdGhhdCBv
bmx5IHRoZSBsaWJ2aXJ0IHRlc3RzIGFyZSBmYWlsaW5nIGluIHN0YWdpbmcgKHdlIGFscmVhZHkg
aGF2ZSB0aGUNCj4+PiByZXN1bHRzIGZvciBzbW9rZSkuIFNvIG15IHBsYW4gaXMgdG8gZm9yY2Ug
cHVzaCBvbiBNb25kYXkuDQo+Pj4NCj4+PiBQbGVhc2UgbGV0IG1lIGtub3cgb24gTW9uZGF5IG1v
cm5pbmcgaWYgeW91IGhhdmUgc29tZSBjb25jZXJucyB3aXRoDQo+Pj4gdGhpcw0KPj4+IGFwcHJv
YWNoLg0KPj4NCj4+IEFjdHVhbGx5IEkgZG8gLSBpZiB3ZSBmb3JjZSBwdXNoLCB0aGUgbGlidmly
dCBmYWlsdXJlIHdpbGwgc3RpY2ssIGFuZA0KPj4gaGVuY2UgcG90ZW50aWFsIGZ1cnRoZXIgcmVn
cmVzc2lvbnMgaW50cm9kdWNlZCB0aGVyZSB3b3VsZCBub3QgYmUNCj4+IG5vdGljZWQuDQo+DQo+
IFdlbGwuLi4gV2UgaGF2ZW4ndCBoYWQgYW55IHB1c2ggaW4gbGlidmlydCBmb3IgdGhlIHBhc3Qg
MiB5ZWFycy4gU28gdG8NCj4gbWUgaXQgc2hvd3MgdGhhdCBub2JvZHkgcmVhbGx5IGNhcmUgYWJv
dXQgdGhlIHRlc3RpbmcgZG9uZS4gVGhlcmVmb3JlLA0KPiBJIGRvbid0IHNlZSB0aGUgcHJvYmxl
bSBpZiB3ZSBkb24ndCBzcG90IGZ1cnRoZXIgcmVncmVzc2lvbnMuDQo+DQo+IElmIHdlIGRvbid0
IGZvcmNlIHB1c2gsIHdlIGhhdmUgdHdvIHNvbHV0aW9uczoNCj4gwqAgMSkgUmV2ZXJ0IE9sZWtz
YW5kcidzIHNlcmllcw0KPiDCoCAyKSBMZWF2ZSBpdCB1bnRpbCB3ZSBoYXZlIE9zc3Rlc3QgZml4
ZWQgKmFuZCogT2xla3NhbmRyJ3MgcGF0Y2gNCj4gcmVhY2hlZCBsaWJ2aXJ0Lg0KPg0KPiBUaGUg
Zm9ybWVyIGlzIG5vdCBhbiBvcHRpb24gZm9yIG1lLCBiZWNhdXNlIE9sZWtzYW5kcidzIHNlcmll
cyBpcyBub3QNCj4gYXQgZmF1bHQuIFNvIHRoaXMgbGVhdmUgdXMgdG8gMikuDQo+DQo+IFNvIHdo
YXQncyB5b3VyIHByb3Bvc2FsPw0KDQpUaGlzIHNpdHVhdGlvbiBpcyB1bmZvcnR1bmF0ZSwgYnV0
IE9sZWtzYW5kcidzIHNlcmllcyBpcyBub3QgYXQgZmF1bHQsDQphbmQgSSBkb24ndCB0aGluayBp
dCBpcyByZWFzb25hYmxlIGZvciBsaWJ4bCBjaGFuZ2VzIHRvIGJlIGhlbGQgaG9zdGFnZQ0KbGlr
ZSB0aGlzLg0KDQpUaGUgdGVzdGluZyBzaXR1YXRpb24gd2l0aCBsaWJ2aXJ0IGlzIGFscmVhZHkg
YmFkLsKgIEkgZG9uJ3QgdGhpbmsgYQ0KZm9yY2UgcHVzaCBpcyBnb2luZyB0byBtYWtlIGl0IG1l
YW5pbmdmdWxseSB3b3JzZS4NCg0KfkFuZHJldw0K

