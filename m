Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA024FB5C4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 10:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302725.516440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndpCe-0001Gs-Ia; Mon, 11 Apr 2022 08:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302725.516440; Mon, 11 Apr 2022 08:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndpCe-0001F5-BC; Mon, 11 Apr 2022 08:15:16 +0000
Received: by outflank-mailman (input) for mailman id 302725;
 Mon, 11 Apr 2022 08:15:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MKM0=UV=citrix.com=prvs=09308b1b0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ndpCc-0001Ez-6g
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 08:15:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80b10bc9-b96f-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 10:15:11 +0200 (CEST)
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
X-Inumbo-ID: 80b10bc9-b96f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649664911;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=zmM8WFB/94ESC5RxqZIJQAVaYI12SNQLWgWVfDpFSjU=;
  b=HlVtG/IS0nBn1x48TGLZABArwr5BeBI5tAdqsC9GHSHiclKQpO0qf5Bl
   VqFd2uB7VFaas4mHyGcgDsfQzefvSnvgm/I+YGWyrpDxgGH7KrUYRrv2E
   NIvPj/hXf1EM//WzX7iTwuAowxn/chfCVRpq2Y5VBZJpiZ20+A+Q50njh
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67931007
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dkndcKju8UDjzZ4MnM9Phxq5X161chAKZh0ujC45NGQN5FlHY01je
 htvWWqBbvmKZzP8eYgna9jn/RlXvMODx4MySgdtrXozEH8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1rU4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTsJP67Apcgdbx9zKGYnEIBl6bX7f3fq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiBN
 pFAMWIwBPjGSxFjHAkKUqAhpvypo2X1cRNC9UrOipNitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoVD6ak++V2xVSfw20VIA0bU0Ohpvu0gVL4XMhQQ
 2QW8Cczqak59GSwU8LwGRa/pRa5UgU0AoQKVbdgsUfUl/SSs13x6nU4oiBpVPwnt8MLaTwW0
 HSy2IrEKB9+uoHLRifInluLlg+aNS8QJG4EQCYLSwoZ/tXuyL0OYgLzosVLS/Ds0ICscd3k6
 3XT9XVl2e1P5SIe///jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5XFhAztJcvU/MBofAnqNOv0j8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5VIPvcEIYSL1PPUfj2eN5yMCl/aIKDgYfqqMMoomjmZZKWdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6gev2TCPEEt8tbQrRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7cQhRfSdmX8ivwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg6AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:6255i6PxdM/S28BcTy3155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080lKQFmrX5WI3NYOCIghrLEGgP1/qG/9SkIVyCygc/79
 YfT0EdMqyIMbESt6+Ti2PZYrUdKZu8gdiVbI/lvghQpGpRGsddBmlCe2Km+hocfng7OXN1Lu
 vU2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnS4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUoZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpAoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPUi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZMIMvD0vFoLA
 BSNrCc2B4PGmnqL0wx/1MfiuBEZ05DUStvGSM5y4+oOzs/pgEN86JX/r1cop46zuNMd3B13Z
 W0Dk1WrsA8ciY3V9MLOA5Te7rANoTyKSi8Ql56Z26XUZ06Bw==
X-IronPort-AV: E=Sophos;i="5.90,251,1643691600"; 
   d="scan'208";a="67931007"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nl0AjlMrnHR1jk/IVUAQxclH9hKGKe4Wt350kyUBAy15CokMjtaPMMxHE2XIR2OqelNXqodt9FKMhxUF1B+0C+zmTdo074gj0oUFS/olkRG8Wz3WKZi0VJ/tsmuI/CSYFkbEEOueVFg9dwCLNyldvErMIrV0jGxjh/XcAZfawem4ed3k4lgw19U5OP1lREy4OcmVe0p9TJksWm4Rc6fJfRMAnz3+mb0n58y2TMX2/fd9tD7oYA+tB+MRBGSzwAN3+eK7J1sGiX5hr5v3Sy+7iQzpkZ7EPPg5GLSkPix2oRULBt+ZXQ4rUASHG0IcnBFHR0bp9x4XOQb1nY7J9l4rdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6pmHdgCZoQmpVt3Nyf2kGVwFjtVIi5m7I/oNz7I8tg=;
 b=QmWg4XUmJRtszLrs0oxcGQnsV+LIA9tY1mA5idscZ6N9IkbLFZwNaIgvnCBYxyNAdSG5OaPX9Vmpy3mFBbnofjBD/fgoaXA6d4Mzg/haoMXde+Sc36fNx1du3vOkcTQJwJUadMFnVxonpfk1swRurQAFNhP33trO3u4xZthcRX+iqpfpzAcpvdPgukn3eSkAf/CjzTyJO5p6fbbVsfUa5RtC52+9yGOVdz6xhvSkJuViNGXmB6X0h3+0BMyzgu6Igvtoqx6aFl7RpFpWTR+2w1FQ7xoBQhDEyLDMHNO0mfB3bzTS46S8PMrAWmz4oZLgZeQXEf1A9tFZl5BtiXiV7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6pmHdgCZoQmpVt3Nyf2kGVwFjtVIi5m7I/oNz7I8tg=;
 b=IaGLkWdhyBExsLw4DzW7xJ5xj/l4EYhBO0o2M6Eh+y37JvZ+xM8Zp7Y//Ru6PPV2UD65H8s9/9ZEIUAvXahSgL9Oq5fR3CvjcpDlD+5Q8k1MOkiGm3WpDCfyHw21lGLVWOo24umJLvCvbWjI+oGTSv9naqPxrQ2iR0DlED5Gk14=
Date: Mon, 11 Apr 2022 10:15:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: osstest service owner <osstest-admin@xenproject.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [xen-unstable test] 169172: tolerable FAIL
Message-ID: <YlPjhj6mujR4u81u@Air-de-Roger>
References: <osstest-169172-mainreport@xen.org>
 <c01eacd1-cf2e-9258-f06b-5a0278fa0ce9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c01eacd1-cf2e-9258-f06b-5a0278fa0ce9@suse.com>
X-ClientProxiedBy: MR1P264CA0069.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e7f1654-f3f9-4ad6-077d-08da1b936314
X-MS-TrafficTypeDiagnostic: BN6PR03MB2609:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2609DB49A3E64CB3C70DEB0E8FEA9@BN6PR03MB2609.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ta/Ue7rfs+3wPgDRKrcR1tvZ8IljXy0SV+qtJn5F17IBE6NU4wphuT8t9+wUa3I5l1oApwNxl14OuCbbP51HyGO3eunNDE497SV35EOcLv4WOZYG3uvD5q5pG6H378QBJM2WkYi6Z61hVgHw95uWCq7hqUEoO1+WI8D7MwCOwL+eFjBmAUi0VjBq5/URfbl8ckmzeiqpzcJlgA6Pqp+B6MH9jOjOGdeo59QVEzHlHv/gCfhAJmeUfe9CiP3iUn0Wbdmgbn9AJ1W7UN9ra+RyzrLGm3QtZo6iqrjMyuc1P2tqAhp17QwhRqZ8ot8cEKtFd6cIBERkPaCorM2/QS6AahZ3unVLzWslP0xZ7DkSLZEqbMc63Ve+c+NnOyOXkyqGevNNQKqct4L5KyAe27MTTsbl9258Pxc3vvput4tXnB/eoMhnf4CIiRg1df+VxJLTwFM6kgeIg2cCWiWcNhzbcwa/hALXPYdz2XafgaMRHhdq5v5ajm/EV7SJHmdSDrIWlJ1A254PN11MDUk1ijm6ehmEEAjR7fKlCRhPBhAkMnd/6y+y0z0XdG0W40o5RFjY195IAsHuy3cGP0U5IEvDVtWfV4wJEECsibORs18iN3g66eOkcz6Yua6GYJHjzAJ1fCXqbR9oXjjMa4rvqWiBlbkBReIRc4kG6FuBJlHbGNfHP+IIwA7CnC7JKjhOpmgGIjpncFWc3DmCwsIzfA7hUewTFUzldLa7fGD7wPvWR1I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(26005)(186003)(2906002)(83380400001)(33716001)(86362001)(4326008)(8676002)(82960400001)(66476007)(66556008)(508600001)(38100700002)(6916009)(316002)(8936002)(5660300002)(85182001)(6506007)(53546011)(6666004)(6512007)(9686003)(4744005)(966005)(66946007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a21RaGFwLzdBOTZUd3hvblN2US9ndlFmdkZNR2xBbncwL1JZOC9rUWxPSzZO?=
 =?utf-8?B?cjdCSWZsVGRzaUFOczM2MnptZC9MaVRqVVVSQ2JvTFlCVG1GMXhBTlB3NVdX?=
 =?utf-8?B?eVg5ZEVmRmpNcHgrTWNoMXVvWXJOdWM5MDhtRlhLZ0Q3UUMwcW4zaHhJcnVB?=
 =?utf-8?B?L3F2NWdOVHBCRVZLakhraTcxQ3FCS2Q5dlFmQ2EwSlNUdGQzb0JvS2VvbnJW?=
 =?utf-8?B?VTk2RWpubFU2cHJWbk83SmNmSzRGa0JUbVBUMGVKWUZmTWx6RlN5bGRhSXVG?=
 =?utf-8?B?aWZodkJWZWxtVDJtQ2ZKQzlMTVBwS2lNMmRxMGxIMCtWT2RHdU9ENXpYOWNK?=
 =?utf-8?B?bDh5c2JQdkRUcitlczJGVmlxeEoxd1AremlkbzlveEpsVHhuaXJZVnJwa1pJ?=
 =?utf-8?B?QzdRRGZGSDFmY0QvZWdCbktMNGxhQ0s2andndjhQam9aSjh2SzFxblRmcHNQ?=
 =?utf-8?B?aDBNZ3Z0dEwyTVlXTWVuSzZlelhYL2RZWmJxblZxUXBpUzRIMzZZcHd0d3hC?=
 =?utf-8?B?bWNYdDBLbzNKS1JSekhPb2ZLZXUrK1gwVlRRSWpmL1hHNWNZSVQ1a0NyNG9n?=
 =?utf-8?B?bzJQaDVhOXU5eWw2eTFyK3RKcWN1b2NUTXMvT1h3RWxKcUZSMElPb05LT3Yw?=
 =?utf-8?B?eGJIbTZPbjIxSkxKdjBFQVdNZVJwY0p2WmVvODNTQW1CRUZDaGtCbE00TTdW?=
 =?utf-8?B?cUNrcUV5K2lvQnVBTHFjdU8wVnlXaWdBTGJFTysrTDBxOXdOM2p6K3p2NjZR?=
 =?utf-8?B?WXNUV1grRlNQemNOdDRFN0dqS0h5dTAwVFZEOGVIOENHZnhrOTU3emdoQmRm?=
 =?utf-8?B?M1k5WTdrTUdoV1VybnBmN0cvaHQvZ2xJM2diaGtsUlRDa243Znc1SkViVVBE?=
 =?utf-8?B?d25hOUtneXhESk5nNTQwUlhzdjc2REpZRVVFYlM4SHlNbXVIS2Y0eHJ2cy9u?=
 =?utf-8?B?bHpENFRHcVdYMzhvb2tkYWVsdE5MUTBmWE9LWVdhRHRqWThIRTRMWTJzWDZV?=
 =?utf-8?B?b1lEaFZ0ckwweXNuVlQ0elhYajZPN0krMDZ2S1Byay91Wjd5UjlSSnl4UWFv?=
 =?utf-8?B?Z1RaMm9Cam1Wcm5zNjluSSsvMldPSGo1Yy91RDFieSsxcEZqWmJ4Q2xqK1JW?=
 =?utf-8?B?ZnR4VERIN3VyTFU4T2RSNis2blZoNUh3R0dmRDB1WkJsSmhONjFnNlFoMVUz?=
 =?utf-8?B?TjNwRklmVStvWE9LL2dLWkhvQkNOa3V1SDZpbWFHV2RtMDRPY05LQnI2dDUv?=
 =?utf-8?B?MjRLbHp1VWZCbzYzd0s2czlKT0o4S2pLdTVlbVhhMDVCVzFGRTQxYXhCaUE1?=
 =?utf-8?B?ZTZlQnlQQWR0RTdDZXpMVlBBa0c1Skg4RWZQTjdSTUpnS3orNEpwaFd1aU5n?=
 =?utf-8?B?T3Zpdlg5enIxRlErVU9lc0hiV2RGbHUwSUdsVVZDZzZYQTF6MGZES2JldUcr?=
 =?utf-8?B?YVVzWE44dks2cFV4ZlFqQkRqTGtNcDBwUGhFRTJzVW96U2xiRW9MVXRzdjVG?=
 =?utf-8?B?QWo4aGxTZUY1RHVRVEc5TTVZMmJZREhibEJOcExoNzJQL243cnhCc0VOSERD?=
 =?utf-8?B?dFJJVVA1UGVaRUR1cldRbncrb2FoMzZGbmR1dFVIWWZyVzNqcUhyVDhTcloy?=
 =?utf-8?B?NTlDVW9BN0oxejFwQUVlNVM1dHh6TTZER0I5eVdvSkFaQzMvbVV0MDVwak03?=
 =?utf-8?B?Zkx6UE52TzF0SXo5cUFhaW9nNHdidnNjYlB3ZFEwRGdueU5yR2pTTndQdS94?=
 =?utf-8?B?WHNnZGZPcFhzYWpDeGVjSzg0Ym9lNHVGMXR3alFJOXlJWjJBU2FZeVRRN2Jp?=
 =?utf-8?B?WXQ4WENQclNwdGtpTDBxYldzNXh0dnRtcUluYU0xdUNPcDhOSVk3Wmo0dHhm?=
 =?utf-8?B?OFpFamtRK0NrUU5iYTRaU09RaUplaHdVWkNLYkQ3YitLN2hIRTY4eGVLcm1x?=
 =?utf-8?B?UGFydk1QdWQyKzBwajZXWmxITTIzQW52Mk5GMzBDQTR3b29SVklqMFdGZHRU?=
 =?utf-8?B?YnBpS0xiaTJTU0VWZFcwU3lTMUs3eWkyaTg4TXB5dkIvQzRUV2xBOFJZbXZI?=
 =?utf-8?B?eFM3WktIV0hXU3ZmSkRsbVlSYmRONGNMVU13Mk4rZDdZSXdhaWZ6WlgvYjdG?=
 =?utf-8?B?amJrTnFXRnVaSDJRdUQ5OUJBVG54NUU0aTRGaU5WNGVranVMUnBBZGpqaW5j?=
 =?utf-8?B?UGJlbXY3SmcyYy94bUtndFFSK2krQ2lqVmc2OUNIQkp3S0VHU0RZYnowRTZy?=
 =?utf-8?B?NkNCeUJFSTh5bGFCWTRxclh1UHVjUU9xQkJMWnZSZlhISlVwenpIOUxrb0hY?=
 =?utf-8?B?ZkNOVWtheEM3aXc2ZXpETzFtWlZ2WjhIem9iRFp4Y2VsZFFMMWZmdXpuT0JU?=
 =?utf-8?Q?knMmy6Uz7b7HLjgQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7f1654-f3f9-4ad6-077d-08da1b936314
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 08:15:06.4152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SO0VI3yHBUla2+BkH1NZO4esVupnkjyCDSoMJJArBjY2fIgf4Hb4DWT1aH3Dpkicg4KSs/XWGT+K1nfFfUmD3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2609
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 09:00:01AM +0200, Jan Beulich wrote:
> On 06.04.2022 00:30, osstest service owner wrote:
> > flight 169172 xen-unstable real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/169172/
> > 
> > Failures :-/ but no regressions.
> > [...]
> > version targeted for testing:
> >  xen                  e270af94280e6a9610705ebc1fdd1d7a9b1f8a98
> > baseline version:
> >  xen                  e270af94280e6a9610705ebc1fdd1d7a9b1f8a98
> > 
> > Last test of basis   169172  2022-04-05 04:42:27 Z    0 days
> > Testing same since                          (not found)         0 attempts
> 
> I just happened to spot this. Perhaps not a big problem, but somewhat
> odd and present in earlier flight reports as well when those were
> simply re-testing an already tested (and pushed) revision.

Hm, indeed.  I will see if I can figure out what's wrong.

Thanks, Roger.

