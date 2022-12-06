Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C172B64422E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:33:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454712.712241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WBk-0001x4-7M; Tue, 06 Dec 2022 11:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454712.712241; Tue, 06 Dec 2022 11:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2WBk-0001um-4S; Tue, 06 Dec 2022 11:32:40 +0000
Received: by outflank-mailman (input) for mailman id 454712;
 Tue, 06 Dec 2022 11:32:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XkKw=4E=citrix.com=prvs=332b12f58=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p2WBj-0001ug-ED
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:32:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aeb0a8b3-7559-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 12:32:37 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Dec 2022 06:32:19 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6716.namprd03.prod.outlook.com (2603:10b6:a03:407::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 11:32:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:32:17 +0000
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
X-Inumbo-ID: aeb0a8b3-7559-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670326357;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JjUYSVyH0tA5nppj98/TjOV1I1SvOk2ZvH7PUo6C4BY=;
  b=b4MOmMHk+gaZpzHBVv9mtk9UlkKS15n1dQm62V9vUwayezD4XQegqjrZ
   OhQx7hCy2arHC2K24Wn1qoULSmOk8XUQH1V973YSG7cWiKfHbAAY7awv9
   iJlRsQmTNBfbDztkVT5MRGrOEm0XAtF2S+7mdrLRTgbxo/D/6+HfAwq3s
   U=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 87210266
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wMMOVa3gjmuJ039lWvbD5SVwkn2cJEfYwER7XKvMYLTBsI5bp2EFx
 zMfCGCAafjZM2ugLY0lbI+/o05VvJGBydMwQQVkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wZmO6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfASZ8x
 OA9IzI3NiuDxNiH55yUV9FSv5F2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6Kkl0ZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOkAttKTuPmnhJsqE2e9zcQFjoLbnTh/aWm1Gy5Uoh/b
 FNBr0LCqoB3riRHVOLVUxC9oVaFuAAdQNtaF+Am6ACLxbHQ6gzfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaES0cN2oLfyIHZQoD/dj4oYs3gw7PT9BsC6q8hJv+HjSY6
 zKAoTU6hr4TpdUWzKj99lfC6xqzorDZQwhz4R/YNkq57wZRdIOjIYuy5jDmAe1oKY+YShyLu
 igCks3HteQWV8jTxWqKXfkHG6yv67CdKjrAjFVzHp4nsTOw53qkeoMW6zZ7TKt0Dvs5lfbSS
 Be7kWtsCFV7ZSfCgXNfC25pN/kX8A==
IronPort-HdrOrdr: A9a23:I/+KRqHP5wyjf2lnpLqFxpLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNJICPoqTM2ftW7dySSVxeBZnMbfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj3Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oK+RSDljSh7Z/9Cly90g0FWz1C7L8++S
 yd+jaJppmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjow4OyjhkQGhYaVmQvmnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF4CfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqA/7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1bwKoVKuZFIMvJ0vFgLA
 BcNrCE2B+QSyLDU5nthBgp/DVrZAVpIv7JeDlZhiXf6UkqoJkw9Tpl+CVYpAZCyHt1ceg72w
 yPWJ4Y641mX4sYa7lwC/wGRtbyAmvRQQjUOGbXOlj/ErobUki946IfT49Flt1CVaZ4uqfaoq
 6xGW9wpCo3YQbjGMeO1JpE/lTER3i8Ry3kzoVb64JisrPxSbL3OWnbIWpe2feIsrEaGInWSv
 yzMJVZD7vqKnbvA59A20n7V4NJIXcTXcUJspIwWk6IoMjMNor239arO8r7Nf7oC3IpS2n/Cn
 wMUHz6I9hB9FmiXjvijB3YSxrWCzvCFFJLYdznFsQoufsw39d3w3koYHyCl7G2ACwHtLAqd0
 1jJ76imr+npACNjBP101k=
X-IronPort-AV: E=Sophos;i="5.96,222,1665460800"; 
   d="scan'208";a="87210266"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6lxCMgGDnsPLtgJr4E042qVx33a80kMkJGyK26cV7Yw67d/JRr0El0mzgPM4JvaFGbxYUc70eFvkWit8YF5OJWJAcfrLXXB3MTX1nmPvoUpwO46mIhqTNbK9lpcxBGV0XUJ3cGPNOo//9yS48jOZqqCnVm7PJQufk8Ms0R81LqOo+eUMsdWre68XNbXLBg2qi7SMkEI5zntkSm4DCmwfJzt7cphE44+u1NUGPj4t4KvsknhzyY/PlubQiLzLKhjJR2tfmppOF3HfLlIv6PcoM6g5FrS7DWejDxg0mryek3JREaUgHdbshX07byX/JXbit+eA4qZjgkkHD/iqlfqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjUYSVyH0tA5nppj98/TjOV1I1SvOk2ZvH7PUo6C4BY=;
 b=XiA0PBRGNicC9W6629yBCBeRj8xtUZI3rP6WfGlSrmMO2LVlgECcQo+y9df9jhTGiNqHihO/3H17YdV5AEQJOK0SFgse71A00ySzh3XPw8sa3DZ7kjxoVT6hLo6sE14vTuNzRulWZr4XAaJ4y3d9b6su5HD6ZsHi9xAAzXbPSb9dhs9Q35Ytt1+g7Y2GNCaNXUUqocZJ8XQE71hNOu+ykXR/Gf7KbLZO1ujsEHpoqNI2L1boB1Wxu7JgGzP2SjltI2OPthOw38j3df/JgN6wxMF9qiZkoj+BRv951ox97i5qqCYvZNvA8l/wT1UASNPIfN1pUVAISqT98KaDUrix3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjUYSVyH0tA5nppj98/TjOV1I1SvOk2ZvH7PUo6C4BY=;
 b=fVdYjry8dLy0UiqfuFoIUWTSiPgRn62hleErceY/925l3KEhPK9PPClTZiPDhw7oydX+RtuPzYxlL/SUlsooQo5g2zp/Nu56n9Fb840cbKeJ+mt/OeRjHDpti6gg9/K1k5Hj2R2eEzUoas4xXbV7h84bpf9Ae3uYWHDBxTONOhQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau
 Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 6/8] x86: Derive XEN_MSR_PAT from its individual entries
Thread-Topic: [PATCH 6/8] x86: Derive XEN_MSR_PAT from its individual entries
Thread-Index: AQHZCSwLt8pWvQpnJE2aMagXMCMCdq5gunAA
Date: Tue, 6 Dec 2022 11:32:16 +0000
Message-ID: <ac0605b2-5c1c-09f2-9526-1aa7e777e7dc@citrix.com>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <5ddd32a453b098f277f2d4aa9e044a40183d4bff.1670300446.git.demi@invisiblethingslab.com>
In-Reply-To:
 <5ddd32a453b098f277f2d4aa9e044a40183d4bff.1670300446.git.demi@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6716:EE_
x-ms-office365-filtering-correlation-id: 5209f5c8-9e5f-4bc2-40fd-08dad77d8771
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 RQ0Q4I+MVTk4Wzxrp4/4JvY31T9GZi7H2J7CmyHEDSkhFy5muQQzWxEZJ6OgpEi2WpBGayB8EDgRYUjAb5OYDRQW4dFI2/4zZkVX2Djud7aN2vYI15gUdDhPdtcym2xRM5gLbuDCTN30wHmuYG85/GRaQ4r05t/j9E9GChslexLpYB9XOdJuTyNRMrLkh1hUCUbPCFEP2rGCShABFJTm9qt+aij+3wshqKN82S6vtMmQKtZdYgdPd0QQ+3lbk5EqDL+nRXil3yamCoOzHYWqHpWt186ybU575Wjwl5w20fKkVQGTkRQ/vRlnLwUXoUTq/eIgLA2vpClNY05WjylhknPwILblH3M5AIqfXDGFk4krq79Z/oxNPtriAGHorvpj4a5+Yp2M333AzZvPn8wAxaZERlNiPYA6YKw9Ja/CHLwXgAg0FUfT/oFB1UwJbEObtgakDpI/SdR0dP5PVQilQ9A2ZUnEGl/Q7HO+CuXEx3+BzUxGEs8i7Y9CfmVKTSmiMQCrN5/DH3UQLctim0+SqLm0HVg0S6zSW0wUNIAIOyF2ji8/rVDNyrB8pXiQ6ArbKp9Fr9zdpmyM/t0Uho8yRLvI9lRDYCw0bM4JrnbGWXydEhvvd2RNGmgYWXXr3g2TLe6DnQn6YEImUrgtnX95Fk2JxYyPcx88z+8iz7n5mri/7Q4eWt1VIqKNgsbEfPop9/ks+geZw4MGptBjaXY+5+nmIEQPVXSOfuYmrkWWT5OaGglijRSuN51OglxqZYpQLZwg7ozpPNPPOHhBmAr+lg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199015)(83380400001)(122000001)(86362001)(31696002)(8936002)(82960400001)(5660300002)(38070700005)(4326008)(2906002)(41300700001)(478600001)(8676002)(26005)(186003)(53546011)(64756008)(6506007)(6512007)(110136005)(66946007)(2616005)(66556008)(66446008)(6486002)(91956017)(54906003)(316002)(76116006)(66476007)(38100700002)(71200400001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFdycjEyK08vL21USGk1TTh6U05YVGpjMk9ldjFmbEdiY2ZIc3JEQUtETTdr?=
 =?utf-8?B?aU5CVk9QRHdsWHNpYkJUOUppSHVtRURQd0l2clMwN3d3dUhGOVh6bWhJdFdB?=
 =?utf-8?B?dVlsbURYaGNMTzRhTStKZjRoUTVYeFNCSmVMSVpkOFljUjE1Qk9Rd21TbG54?=
 =?utf-8?B?WDFtTExjV2h3c0MwMDJXcDZKV2syc0ptZjdQTXFPN2pLU3U5TUplNWwxdTNY?=
 =?utf-8?B?T1NRMnBTbnJhdlF3emdSS0Q2aFNzZlo3aVJjYzQ5Q3dkUlM5VlBvTWhRSDQr?=
 =?utf-8?B?b0doQlNxZHV3NnAyL3BIQXMwZHpuc0tBOC9ncXVRYW41c29qejgvWFI3bW9l?=
 =?utf-8?B?eFBnaWo2c0VyZ3Q3ZzdDaUdTODBTM0J0di83ZVBpLy9TU0sxYTVIZkwyREpP?=
 =?utf-8?B?SUh4UUU4ZXNxZG9sU053TlhJZGZ0SXZJU3M4T0daVkZWcGt3UVE1MUQyTU1L?=
 =?utf-8?B?Nmh3TUtxMkdjdzdobWlLaGNXTnlmeVR0YU9ObnJkaWtTaG5qVUc5d3ZuZmJO?=
 =?utf-8?B?dXRtdDJESEFWditvM2hCYVZKWEZyUVZmb1B5ZGs5ZjhWbG4ycTVnaE84R0tq?=
 =?utf-8?B?U2h0ank0MW9LM2trTEZEQzJpcmMwd2RaOVhWTjdWZ1NKOFBmb2cydkc1NThE?=
 =?utf-8?B?MG1Ga2JDOHZieGZNUUJWL2VIWEc3WmZFZjVReUdVWDBiaVRaUzNrSlRka2wv?=
 =?utf-8?B?SXpVTXptblpmSk9OVUF1UCtVUkpQa2h5b1g2cmFqTWlqb2JGb3pDbDFudVNY?=
 =?utf-8?B?VWljazJGWGRYSUdBV0RhOFJaY3hGa2Rud1RlUHpyRWlDaVorcnVyWldOclk0?=
 =?utf-8?B?ZHVZVmtaU2lueldZQ2pVOXdCOFNkblhtNjBmY01GNDU0bldKV2FIQlpmdkk1?=
 =?utf-8?B?ZnJ0VXlWZTQwckVrMTlka2pJV3lwWW5SYTJPYUtPS1RPR2dqSitCRWEvTFRF?=
 =?utf-8?B?TkVjK1Fsd0dTRWRVSzdGbG1IWTQwMUtwbEdLK0VZbVptUi9XU0VrQ0IyZy85?=
 =?utf-8?B?S0szdnNwTWs3UEVCOHZGMlpucitOdVVzbHFGSmZiMXRFZmFnQTZhbGFkMjdu?=
 =?utf-8?B?L1hKT0s3b3NpQ1hROW5TQWNPMlFqS1BMMEx4TDA0NE1pOXZhSDFQUVRpdXZa?=
 =?utf-8?B?SW1FUWFHREI5dXk2Zzh5YjNzTVpoK3d2MmdWaXJ6bldlaERkNUZTVGNiRmJG?=
 =?utf-8?B?OXFUQ3o4dFFobmc0d0x2RXpudHE5U2pmTmFYa2gydXNHVGFjc3NXOGRNejd5?=
 =?utf-8?B?ZTlUdHo1WS9oMXVNQUtzUUtDYmRJNlNiMi9lbElRZU5vRjhpbHhwZ3NVYm9H?=
 =?utf-8?B?bEZRdXJJWFI5VEdNalhIeDFjVUtHSXIxVEJta1pPOW1wYVZFRW52NU5GNGpq?=
 =?utf-8?B?Y0VqaFpqdVBXd2xaMUg2bDhjMnNEd2x2bVdPZVVRZndWdnJ4M01wTW00ZmxY?=
 =?utf-8?B?NXYwa01QNzRIazVicG0wTHdxd290WXJvNmZ0UGVKeWtwVys5My94YlRqVzh5?=
 =?utf-8?B?Y2svMk9PVXNUbUZjRzRMeWNkUkFoL0pWODAxejJhalk5dmZEV1ZkU1JCL2k1?=
 =?utf-8?B?MXVlM1pybk9IWFpvcUEzMzFZMzVnZU5rdlg2aVpiNFp1Rm12NGRmb1FsUzJN?=
 =?utf-8?B?M09mWGVveUpSenJsdW9BdTN5RmdEU3JvUUpRa1oreUZwMWJyQTZMNit4YVdm?=
 =?utf-8?B?TTVqVVJuUytqSFBxaDlacGtiaFFrVE5zOEVydnhuZmdkUEUwbXRCQnRwdzBC?=
 =?utf-8?B?Qm5MQk9SUGxqdEYvLzhpQmdraEJCb29LTTluNEwvejBuWGxoUDNGZjJwNVFw?=
 =?utf-8?B?bnNlaDJzYXJYVFV1VStQWjRoVVZIWXYwU0xtNG0xZU10QndqamMrd2IwaEhi?=
 =?utf-8?B?cC91cUpmQ0ZueGo5TEJPMWZ1TS95M0lVSlViMm5VbzNGaHFhVXdtb1ozN0xh?=
 =?utf-8?B?VHJFYjhpMTVhbzR2NEFJZm9IZkpXb01KNFdqclhIbzVHaFRPNlpydVU3OUFy?=
 =?utf-8?B?TzBwMlRtdms1VnpMYUVlMHhabEFaQVdlb1ZpeVNNUzBoYklXVFNnK0NmNzJ6?=
 =?utf-8?B?ZEhCRWV3aVBZejVCMzg4U0poc3hYbTVidEFhL2dNOEJEVk9uT3ZLbktwYlVD?=
 =?utf-8?Q?kG3TeDltTCw00KQ0Xx2MRUhk8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D86DCA167AE01A4DB90C2F9D334DD7B7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?azUxaDhCMHZGR1g4eDU1Ulc2SEYwZjJZWHJDQkZ1dkgyb25jNWFuOTJTa29w?=
 =?utf-8?B?ak1OVjdhcUxJaCtQN3A5dTRsbmo4d2ZPZDhBbU41TStOSjR2K1pRblN2VGxC?=
 =?utf-8?B?OGlEcGZOUVVYdHhqbFhSVFd2MGpMM29uem41THE2Mnordk45SXBpT1FXdU0x?=
 =?utf-8?B?TGlBaEtlUG9iU1BTSGpnd2UzN0xNZVVMT29RWCt4MTB5STZJUUdYdGg3Z3pl?=
 =?utf-8?B?a2dSZVQzc0xCY0Y2RXVjK0ozVXpMWlI2N243cS9qa21RaDJtT0JVY0dwellW?=
 =?utf-8?B?d3h2cTUrTjFZbnF5UWxKSktybTdkbE81MW5DOHBpZGpmMFlLdng2V1diOEh2?=
 =?utf-8?B?RFJwUWN4cjZnT0VKNmcrdFBxVnNWZWRRdUg3V2hmYnRpZTNtcWh6U0x6aWpW?=
 =?utf-8?B?blhQazljK0ZtK2RRN3RWYnh1OVFTOTkwYTdySDJXZEIvNTBnVDZaNUgxNEN3?=
 =?utf-8?B?VGxuMlRVcE9XMWdhZ2ZEa0VWaHMxNUVwTmxDd081SzBuKzZmYTF4cERSL3Bw?=
 =?utf-8?B?a1JlWWRiQmxkLzF1bkdHcWhGZG1sY2YvQVVMQS9ZWkxTK1pnY1pBSWkwbitw?=
 =?utf-8?B?WlFHeWRVYXowTGVFN1hzaG1tdkVoOVZlMjdkOUVJUG5qRjkxZU80SXpWaTBX?=
 =?utf-8?B?NnBVakdhQlN4dW1VaHZRUzhoNjZxa01VaUhSN1I0NFd0MWtLL0xicVdSM05S?=
 =?utf-8?B?RklyeUF1WndzajhBVzRJdVlyY1ZzQWNaZ09TOU9Bd0VMdUVNMEZLK2kxY1pX?=
 =?utf-8?B?MlZ2STM5VGVXelJmbCs1d0E1UkhEUzVMK0Y4QXhVWUJ2akpJaHlCZnpiNEdE?=
 =?utf-8?B?QWcrVGlabWU0aXExVzg5ck4veG1BZmFtZVNsc0NpUXkrSEx3Q1Z1WnR0YnVm?=
 =?utf-8?B?WGZJcEZsbTd6ZlFpYThwdUF1MGtTa0MzWlVxQ1RIV0pQUkJkMWNIUU9tbU8v?=
 =?utf-8?B?K0tjK3pmaitJd1JTbjFzb0pNMUZWcTFBVUY1UUFjcDh4Z044aFBaNVQ1NkJC?=
 =?utf-8?B?VW5ndm0rQldXZlpFZHhWTTBZb3VvTjdWWWQ2MGh4YnUrWEZKZ1A0ZlpPUXNX?=
 =?utf-8?B?bkdZV05PYVZSamhOMHNONUZ2RzZKWlZsdDZFWkQ0cUg2S0J3R2lFWTIvUDla?=
 =?utf-8?B?Z2JvVHhIQW9LdlJ5U20ydWZhSWwvcndQOEhPTkN5alVhTklKc3dhQXFFQWEx?=
 =?utf-8?B?ZmhQMUxWWFA4ZDF2UGhoMm4yR3d6dG43VzkwbUMxbnlVZ2ZzS0VmYVNQM0dH?=
 =?utf-8?B?ZHJhbjY3bnBxMDQ1Q3NSMGhEWURDK0hjR2p2WWhGYjZHLysxUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5209f5c8-9e5f-4bc2-40fd-08dad77d8771
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 11:32:16.9107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9YVwCIaynfv8WEhNZ063ErUKR5pGJmL0W3GnoXCXg6EfVoqNjXwzqdy7I0ACJkuBtPwSssDmuh3cWe2UMozt8pj+S8OYBKIrin5xiUo2yFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6716

T24gMDYvMTIvMjAyMiAwNDozMywgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KPiBUaGlzIGF2
b2lkcyBpdCBiZWluZyBhIG1hZ2ljIGNvbnN0YW50IHRoYXQgaXMgZGlmZmljdWx0IGZvciBodW1h
bnMgdG8NCj4gZGVjb2RlLiAgVXNlIGEgX1N0YXRpY19hc3NlcnQgdG8gY2hlY2sgdGhhdCB0aGUg
b2xkIGFuZCBuZXcgdmFsdWVzIGFyZQ0KPiBpZGVudGljYWwuDQo+DQo+IFNpZ25lZC1vZmYtYnk6
IERlbWkgTWFyaWUgT2Jlbm91ciA8ZGVtaUBpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPiAtLS0N
Cj4gIHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8IDIyICsrKysrKysrKysr
KysrKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vcHJvY2Vz
c29yLmggYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgNCj4gaW5kZXggOGUy
ODE2ZmFlOWI5N2JkNGUxNTNhMzBjYzM4MDI5NzFmZTAzNTVhZi4uNjRiNzVlNDQ0OTQ3YzY0ZTJl
NWViYTQ1N2RlZWM5MmE4NzNkN2E2MyAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2luY2x1
ZGUvYXNtL3Byb2Nlc3Nvci5oDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wcm9j
ZXNzb3IuaA0KPiBAQCAtOTIsMTMgKzkyLDMzIEBADQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFg4Nl9FRkxBR1NfTlR8WDg2X0VGTEFHU19ERnxYODZfRUZMQUdTX0lGfCAgICBcDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFg4Nl9FRkxBR1NfVEYpDQo+ICANCj4gKy8qIEluZGl2
aWR1YWwgZW50cmllcyBpbiBJQTMyX0NSX1BBVCAqLw0KPiArI2RlZmluZSBNU1JfUEFUX1VDICBf
QUMoMHgwMCwgVUxMKQ0KPiArI2RlZmluZSBNU1JfUEFUX1dDICBfQUMoMHgwMSwgVUxMKQ0KPiAr
I2RlZmluZSBNU1JfUEFUX1JFU0VSVkVEXzEgIF9BQygweDAyLCBVTEwpDQo+ICsjZGVmaW5lIE1T
Ul9QQVRfUkVTRVJWRURfMiAgX0FDKDB4MDMsIFVMTCkNCj4gKyNkZWZpbmUgTVNSX1BBVF9XVCAg
X0FDKDB4MDQsIFVMTCkNCj4gKyNkZWZpbmUgTVNSX1BBVF9XUCAgX0FDKDB4MDUsIFVMTCkNCj4g
KyNkZWZpbmUgTVNSX1BBVF9XQiAgX0FDKDB4MDYsIFVMTCkNCj4gKyNkZWZpbmUgTVNSX1BBVF9V
Q00gX0FDKDB4MDcsIFVMTCkNCg0KVGhpcyBpc24ndCByZWFsbHkgY29ycmVjdC7CoCBDb25zdGFu
dHMgZm9yIE1TUnMgdHlwaWNhbGx5IGxpdmUgaW4NCm1zci1pbmRleC5oLCBidXQgdGhlc2UgYXJl
IGFyY2hpdGVjdHVyYWwgeDg2IG1lbW9yeSB0eXBlcy4NCg0KVGhlc2Ugb3VnaHQgYmUNCg0KI2Rl
ZmluZSBYODZfTVRfJFggLi4uwqAgKHNraXBwaW5nIHRoZSB0d28gcmVzZXJ2ZWQgdmFsdWVzKQ0K
DQppbiB4ODYtZGVmbnMuaCwgYW5kIHRoZSBQQVRfVFlQRV8qLCBNVFJSX1RZUEVfKiBhbmQgRVBU
X0VNVF8qIGNvbnN0YW50cw0Kd2FudCByZW1vdmluZy4NCg0KVGhlcmUgYXJlIHR3byBtaW5vciBy
ZXN0cmljdGlvbnMgKEVQVCBjYW4ndCBoYXZlIFVDTSwgTVRSUiBjYW4ndCBoYXZlDQpXQyksIGJ1
dCB0aGV5IGFyZSBhbGwgb3BlcmF0aW5nIGluIHRlcm1zIG9mIGFyY2hpdGVjdHVyYWwgbWVtb3J5
IHR5cGUNCnZhbHVlcywgYW5kIHRoZSBjb2RlIG91Z2h0IHRvIHJlZmxlY3QgdGhpcy4NCg0KPiAr
DQo+ICAvKg0KPiAgICogSG9zdCBJQTMyX0NSX1BBVCB2YWx1ZSB0byBjb3ZlciBhbGwgbWVtb3J5
IHR5cGVzLiAgVGhpcyBpcyBub3QgdGhlIGRlZmF1bHQNCj4gICAqIE1TUl9QQVQgdmFsdWUsIGFu
ZCBpcyBhbiBBQkkgd2l0aCBQViBndWVzdHMuDQo+ICAgKi8NCj4gLSNkZWZpbmUgWEVOX01TUl9Q
QVQgX0FDKDB4MDUwMTAwMDcwNDA2LCBVTEwpDQo+ICsjZGVmaW5lIFhFTl9NU1JfUEFUIChNU1Jf
UEFUX1dCICA8PCAweDAwIHwgXA0KPiArICAgICAgICAgICAgICAgICAgICAgTVNSX1BBVF9XVCAg
PDwgMHgwOCB8IFwNCj4gKyAgICAgICAgICAgICAgICAgICAgIE1TUl9QQVRfVUNNIDw8IDB4MTAg
fCBcDQo+ICsgICAgICAgICAgICAgICAgICAgICBNU1JfUEFUX1VDICA8PCAweDE4IHwgXA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgTVNSX1BBVF9XQyAgPDwgMHgyMCB8IFwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgIE1TUl9QQVRfV1AgIDw8IDB4MjggfCBcDQo+ICsgICAgICAgICAgICAgICAg
ICAgICBNU1JfUEFUX1VDICA8PCAweDMwIHwgXA0KPiArICAgICAgICAgICAgICAgICAgICAgTVNS
X1BBVF9VQyAgPDwgMHgzOCB8IFwNCj4gKyAgICAgICAgICAgICAgICAgICAgIDApDQo+ICANCj4g
ICNpZm5kZWYgX19BU1NFTUJMWV9fDQo+ICtfU3RhdGljX2Fzc2VydChYRU5fTVNSX1BBVCA9PSAw
eDA1MDEwMDA3MDQwNlVMTCwNCj4gKyAgICAgICAgICAgICAgICJ3cm9uZyBYRU5fTVNSX1BBVCBi
cmVha3MgUFYgZ3Vlc3RzIik7DQoNClRoaXMgd2FudHMgdG8gYmUgaW4gdGhlIGJ1aWxkX2Fzc2Vy
dGlvbnMoKSB0aGF0IHlvdSBpbnRyb2R1Y2UgaW4gdGhlDQpuZXh0IHBhdGNoLCBhbmQgYSBCVUlM
RF9CVUdfT04oKS7CoCBXZSBzdGlsbCBzdXBwb3J0IGNvbXBpbGVycyB3aGljaA0KZG9uJ3Qga25v
dyBfU3RhdGljX2Fzc2VydCgpLg0KDQp+QW5kcmV3DQo=

