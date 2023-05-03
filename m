Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8676F5267
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 09:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528993.822860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7MI-0005c3-51; Wed, 03 May 2023 07:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528993.822860; Wed, 03 May 2023 07:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7MI-0005ag-08; Wed, 03 May 2023 07:57:06 +0000
Received: by outflank-mailman (input) for mailman id 528993;
 Wed, 03 May 2023 07:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlPw=AY=citrix.com=prvs=4803f4e7c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pu7MG-0005aa-Kq
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 07:57:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15600c5c-e988-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 09:57:02 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2023 03:56:58 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA3PR03MB7396.namprd03.prod.outlook.com (2603:10b6:806:39a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 07:56:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 07:56:55 +0000
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
X-Inumbo-ID: 15600c5c-e988-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683100621;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bGjhDo7vIaxEMzr49lNGjOBF70RQKgKjgiJwsZsUYkY=;
  b=dLkTKMOWq/5u9MQ4WnJHcqpdtLrXPwS8IzPwj+HoOCQbO+o3/xziErhx
   yAfh69N+58dER13PbTGbcyKSXARgeiYXUkZo1adOjT9WjSr8Y/2InRGWk
   WvC0vPoN03oSTxBU+U7MsoNdNK8Da03R2a96LnkwyS8rotoNrxP7XclsL
   Y=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 107698380
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4JTAi6k1UzF3A60W9PW9UH7o5gxUJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOWmmGOPiIYmv9KNEnOd7npxwHucLRxoUwGgQ9rC82EiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgW5ASGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fkdcWsJXzCzvdP1x5abQ/Rqpocmcsa+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea9WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOLmp64x0AX7Kmo7LAMHClCLm+mAlE+ncNx2K
 24rxQYHov1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+WsDezNC49PWIEIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 FiisywWl7gVy8kR2M2GEUvvhjutot3DSF4z7wCOB2a9tFonNMiiepCi7kXd4bBYNoGFQ1Kdv
 X8C3c+D8OQJCpLLnyuIKAkQIIyUCz++GGW0qTZS81MJrVxBJ1bLkVhs3QxD
IronPort-HdrOrdr: A9a23:llbhLK6BaN3+WzVkcwPXwY2BI+orL9Y04lQ7vn2ZKCYlB/Bw8v
 rE8sjzuiWVtN9vYgBdpTntAsi9qBDnhO1ICPcqTNWftWDd0QPDEGgI1/qA/9SPIVyaygZXvZ
 0QDJSXYLfLYWST5qzBjzVR3LwbreWvweSQoaP78l8odAdtbshbnnVE4sTwKDwJeOGDb6BJZK
 Z1I6B81kudkA8sH6CGL0hAZfHHu9rI0Lr+eHc9dmcawTjLtyqs9Ln5VzOF3hISOgk/vIsKwC
 z+ignk4afmlPm+xnbnpgjuxqUTosLl1txAQOqTjcQPQw+c7DqAVcBaQrifuzJwmsGDgWxa6O
 XkklMbJsFu7HGURG2vvhf3/AHl3F8VmgTf4G7du2Lnvcv6AA03ENBAg4UxSGqi13Yd
X-Talos-CUID: 9a23:c3kzHmP+TQT9Ne5DXSw+r0olOvAfQz7a6FfZPkmYSmM3R+jA
X-Talos-MUID: 9a23:PeXJLQbtPsYJkeBTkyH92zpSDtdR/aW3I04kkbc5hOWtOnkl
X-IronPort-AV: E=Sophos;i="5.99,246,1677560400"; 
   d="scan'208";a="107698380"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6FJtlJcw+2wB9EFVXfNpDk7wb4gGhppc4F+lsQUjoeKIw99G77CjiYzkod9t5NoIS/Bk/qeRrCCAcU217jeMZ9Nd3AeCz9Zkwm1E/gbZDCMlIvTWNe7W0RrWfOATikVqvF9/gTzzWq5JCzUvcHxJXmcQAyGl/JA1B0aBWyaUCRingH85tUh4ufVelCpBPNx1qS5NjG+t2AhiuQy9ErsJvY9Dya6PXKSn4M9cy0NRx9T+btjRbpVvaqBu+Z+tIMFdG5FpLIktaa+a4DzXYWlC6KdEoAfKjzHdbqEkqiZWIeMVh6uSDV20Ki5uQL317oC2J5w3Jd2nh/4u2/MRzrSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGjhDo7vIaxEMzr49lNGjOBF70RQKgKjgiJwsZsUYkY=;
 b=CH5+vAlLMb52jSTvR7VJsuH1SeqtLvnNjkx0GuHEhXPRQdFD6ypyVy2L69vt2X5Nx31G6tXJ0Rbpru1t2gY3NDyYxi6/PmhGG6TWh4Leb6RUrRewEJ9nZlNJuFStvdqFWHD3VUo3lKGbS2py3oIeXc2Sugu4RU3eMTAJLg7R1du4Ad5WiYFBfmgZj0XZCrJasIoI48qhC8ED9KPkIWNrVGBgeODy2Wji5cbn3b7QcrVuqHJkc8YlIDVh48W/towFNj7aQ+ZJUwjPmvsoIrdMaUPmPtbPhjiUzNaRhfu+RgXepO1YLVF1WadWlxqB16XEGvg5lLG/eFCn0R++wKcakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGjhDo7vIaxEMzr49lNGjOBF70RQKgKjgiJwsZsUYkY=;
 b=bFrAoHOXqPvp/eiaHdgpKGjMmvcZQwLhTh8R3UIYLpVKyVcBEoYf0NZL3YDb8UfCBLCt51NXdHU/lJHmLKa8iK0LL0zbcsFCFwgRw6Xh0Lpo2oVoVIEJUuyrC0jO4IzjD0qvlflybsRLs07SgUTTVjsEJ0R+QtgXNFJb/wequYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9e9927ec-dae4-c204-73e4-a534368bbddb@citrix.com>
Date: Wed, 3 May 2023 08:56:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libacpi: switch to SPDX
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Jennifer Herbert <jennifer.herbert@citrix.com>
References: <a06075c3-8e6f-a470-e8a0-58fd299373c1@suse.com>
In-Reply-To: <a06075c3-8e6f-a470-e8a0-58fd299373c1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0316.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA3PR03MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a11f186-01b5-4919-dc9a-08db4babf6bc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nQ1WEvjeLhboXYbS57F09TxQOgx2xKDbDTudFDG5cz2wxqF/yv7Vi18hUfg4bra4QTAsPcdK3PZyA7u06iLuDPEJSQuTt6XIlJLYGnRceWG2PGVZloSXPOsjV1enOWTGHxslhR5qhNw/8S4bOdGXzsBY4tr5C7byIXJGCJnvSNK+AMjSKuL6klO/69qNVq6Z0XUkcqatwaQiwC2o30fejKFG38iRewUBRr8npA6Udl+yok8QbnPjM/tH7IOj7khRUvfFgZs+P3AHADWNHetlLBPCuqb3z+E8amEh8257DSMI0d6LK9qCN1gpv3gU3WELPa+y9uIqRJfjxz1UjtnDyjJDn/lUOIix0CJq6ENNZ6535x3uDOuL1k6GfcQDQj8GVZychUhf31+zKPdtUrOfZDOXvfHBIlhRKio1cXOKw49dIGZ6XnKjyHJ5NYIn999MLE37njfslPSBWbMXkwDBPKzaeM35adNjxnOjykENaicF9qC80uwc8PDd8iD3VVXN78r5fp13gnShlRuLLp/ww5Dh8QjTOeKhP7hF688VVPvIcPIU1WdZgFGD6tit5EO37rB9LnMOt0ECngkAyjlTr9/q7ZixkCL8ChFzrtM3Xy3OrCix1MBD2imTDiWy+uGacILVJCgb/j6IEQvZcaYQWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(66476007)(53546011)(66946007)(4326008)(66556008)(6506007)(316002)(86362001)(82960400001)(26005)(6512007)(31696002)(110136005)(38100700002)(54906003)(478600001)(6666004)(6486002)(186003)(36756003)(107886003)(41300700001)(8676002)(2616005)(4744005)(2906002)(5660300002)(8936002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3RoU05OZTR3SUhvUmVyL1krRzZjZjJ0VzRNSnppMi9LUVVyd0dMWndGM2Jo?=
 =?utf-8?B?S0lDVGNXaE5hMmpCSVp2VVZFOXduTVpBWWdvQWZvY3E0Y2JmdTNWeG9VRlh4?=
 =?utf-8?B?dHFKQjRnb0M3QU1vMEJvaHppcVdqREhjOVErZk9JVUNCanNjMkt2YWdoUEJT?=
 =?utf-8?B?S0dKaU5hdjdrdy9OWEV5dHhrclc0UkZObUIyWU16ems5WXd3dU5Nck1uek92?=
 =?utf-8?B?WWdGZURaeElTZ00xK1lENmhsUXEzdkwwMHA5cWgvTXlaUUg2Tkw1V25Jek9l?=
 =?utf-8?B?c21GRldxeVNqa2dPVjlTVVBRYkRCeFNGWjhTK0t4Y3VHUVV4QWRqMUhiUlBk?=
 =?utf-8?B?UDZwYjRkMS9kMDlBSVg3cTZtVU1iamxJWWhsS0pXTTFrcUhGZ0RNc0dPQXc4?=
 =?utf-8?B?UjR2Z2VDc0lTRlFxY2NZamN6VFdtajhUOVFMZS9SZkJCRzFPbzVjazd2Rldq?=
 =?utf-8?B?cFVWem1VdEY3ekJWV3VUbDRWVjM4dFNsMThwWkxjSGdSc1MzZmZvQ3llU0hk?=
 =?utf-8?B?OVI4QjNSWFNCSXNxenI1ZzNPMlJhOUY1dzlTeTU5ZW02QktPWlYySWhSakdm?=
 =?utf-8?B?ZU5nL3BsMWkxTTEwNnJPRGwvVlZDRFZzenVKSWJMWTJGWWdOVjlSb1FHMzky?=
 =?utf-8?B?ZVY0VEY5MXlHQjRpWGEvOXpWODlBT0trY3RYZVFxZUVmL0p5d2dHcHNtWnU5?=
 =?utf-8?B?Y09jYWpwN1E3MmJCM0N2cVlwaUJjbUxSTjBleGhGbllsWFpHcXkvcnI0QXVE?=
 =?utf-8?B?M0kycmhyUXVodzQwRVdtNFp2MWRqSW9PZE5HMEFCQTJ6NERnUmw4aUFBaDFk?=
 =?utf-8?B?azlYYytsV1ZxT3czMXBDbHlmN1plcHluZGVldnpGSzFORDc2M2JWRU0vdjBr?=
 =?utf-8?B?MnpwbEpwcll3WEJ0VmF2WjNETGt0WnIreHVId3BBcEFySGgyS0VkM0F2ZVky?=
 =?utf-8?B?WkRNV2RTYm5yMktlRHdBekxVMDQ1UXBFN1I2M2RlK2tVcDVDSXM5WlAvckth?=
 =?utf-8?B?SUJyb3RLTVVpUm8rRkgxTlJJQ0QxeXhybjJ1b3BqUFB5eXBwUVR6WlRMWG5D?=
 =?utf-8?B?S09BcXI0K0JuemhWL1ByV0lHTlZXcHQ0Ykh6T0syN0tFV2Q0dTNrREhZcFpR?=
 =?utf-8?B?SnczYUs0VWYvcUgwMWRBd2pmc2o1VEJ6TUNsdWJldW1KNUtMQlg3VC9tUlI5?=
 =?utf-8?B?blRnTlRRdnpZM2dmNE9iSUxaY05nbEIvTEJmWkhqd05DM1RuRG8yaVpOMW9n?=
 =?utf-8?B?ZkNFQTlua2F1QlJtTWtDcTdhUXlnUTl2QTVDZnhuT1o2YUloTlZMb3hVVlBN?=
 =?utf-8?B?RW5YVTlJK1hVRXhLVUovNGxMeXdGRnRMb1R6RCtIWW5xaHhiU2dsNW5RYU91?=
 =?utf-8?B?UHdjaGZ6K3U5aUVoZkVFdTViQjVFdWFpWnUwbUtsNG9nLzdtOHQ2NmpwaDdp?=
 =?utf-8?B?bEtXOTJ0Z0RTbExoT05iSisrZ2lpTmpvVGQ5TjlNR2JuRDV1bDNtZERSQXZu?=
 =?utf-8?B?RGFzaWhacUxRWHV6NlhGOVBjOCtSZDNqd0N3Y2R6b0tyOHVnSEgweW1pRVB0?=
 =?utf-8?B?cjF0ditha2JFdDJabFBJMVM2K0ZuVE9Za1NaV2ladWs3ZUR2Lzl4Um81YkFH?=
 =?utf-8?B?ODgxOUQya1FUMDhYUkJjcmNHNmI2TUhFeFZ4RzdTR09Nd0RuVWd1Zmk3S0Mz?=
 =?utf-8?B?aGNBYmhuTGJaOTNsb0E3TnJKb0s3bExEaHRXQ2dDNzdIM1dwd1RBY0RCdzg3?=
 =?utf-8?B?SVJEeFA4SGIxSGg5eVZ3L2FZZFZXbkxJd2svS3orRkNJcUI1TG9zcjhyRWxE?=
 =?utf-8?B?UDN2YzltczNPZFNwUlRHWEMxUFhqVGs5aTNqUkh1TzVpTzQ0SzhXMm5PeVI0?=
 =?utf-8?B?SzZ5VjlHaTEzRXNaMnd4emp2S3Z2S3EwUU9naXZ1bkI5N2dsV3pINUtXZFkx?=
 =?utf-8?B?c1hHM3M2d1hzaDgreThSZzRrNkZ2cnJuZGY5bk04a3JHelcvdjVhaGU4Nlox?=
 =?utf-8?B?cU1ZS1RGZEhDMGkwUmpsRjd0ZG1qZkc0RVQ0cnZ0bWdNdmtzV1BsL0k4ZUd4?=
 =?utf-8?B?R25vZ1FQbHFGRXE0bGJKZTlzTDJvZXU1eUVDczNLTXA4YTlZNHZIR0Z3Vjd0?=
 =?utf-8?B?SUx2UlcwdkdzbWd4WndOc1h1NW9vTkNjbVpmNXBrb082QkdWR0M1dHJlWGEv?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DbpQoi6pHE8EcAQdYaUaWMVGefJ9aUIYxFVes96lZvYQLVZIOLtbmGbk8wK41QUoWaGUKneFxDSkA1+hx7Uw42oX4AmeB+f6dJRUWLLU0LyVAQ/VAqMVIr/YTgy/J/dISlXKGcSAlP2yB7v0DQscL4sN9qIAbujBuZMjpaGKZ0jLjvVbRlj8ZApUYI5cQs7FA8C7iAzL5nXdEiefg5KToPXVECtB9lD8zCzZeYfTfO4zHQMF1xPS7ylzCZ2rCpg1EL8qrqRcabBwOCO1TRZGrvx8PwNUyCWwtPylOuWpvbnYAfXwGv6lBV+pb8iabQPWOI8mV3mtR5hlkSchTH7MYgDnUqTamaLiS0CKz+eY8yxmdx6aHUEqn8L7vFageSEtDnt+Le4MBhLGAKzCN2alPWaBZmiXYkAhH/aL4ZnvzKfeYejLR0ANsDMX0PvLlJiowO0auW2OQYIJNq+1mf5SKWmROGNs9a8NPO2QN+uiT3AWWThik/Zz2aWgAp2VHxjanBWWgQMHIZuxmoJbs8Ykr2syZdZUoFl5Q6W9oLc/Rm1daM4m0DBB0ynxXx2ie2UzkoVBNcSsegwtCaV8+WZNoRB8VIVVazFJVktW0uXMP3/MmnM4ss92BfyV/9DMJ2CJS3wRWfzd5ao6/3S4WQQwQm4JKJVOQwET9IYaLvntCbRdxH3hgLnsHdVTyCAbVaijbY7EqbGwHKqzy/OIarFp+oHkjx+rmjIxVtD5acT1Zj94O/vLTPWSG3BT22aRdaOOdLqVVGpxnPu3opaXTIQCAuYSyAFnExiQPSwTChH3mlllLeLmAE/yMihIuMSI4YFGMRYgPIzmFhSrolGUJGC8hQ61+CEd35WNDa7lTwQT/N8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a11f186-01b5-4919-dc9a-08db4babf6bc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 07:56:55.7541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FViMrhnaLElDVjkoe0rnwROErnSaw7yGYxF+Lq8x6kQ5hYl4e3FHlL/T4oJUfVoPWETcymwBpIebYzzGrIeDNVVb6zlY3JnOCYhUpOJZeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7396

On 03/05/2023 8:45 am, Jan Beulich wrote:
> Commit 68823df358e8 ("acpi: Re-license ACPI builder files from GPLv2 to
> LGPLv2.1") added references to a "special exception on linking described
> in file LICENSE", without actually adding such a file. Quite likely
> COPYING was meant instead, yet then its text matches LICENSES/LGPL-2.1
> except for some explanatory text (clarifying the "only" aspect) at the
> top (and formatting). Hence replace the text in all the files with SPDX
> references to LGPL-2.1.
>
> Note that dsdt_acpi_info.asl had no license text. An SPDX tag is being
> added there nevertheless.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

