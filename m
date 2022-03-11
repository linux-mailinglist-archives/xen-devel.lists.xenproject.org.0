Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A842B4D64D5
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 16:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289170.490611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nShQV-00024D-1S; Fri, 11 Mar 2022 15:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289170.490611; Fri, 11 Mar 2022 15:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nShQU-00021k-UJ; Fri, 11 Mar 2022 15:43:34 +0000
Received: by outflank-mailman (input) for mailman id 289170;
 Fri, 11 Mar 2022 15:43:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXIo=TW=citrix.com=prvs=0626a3ed1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nShQT-00021e-Ad
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 15:43:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffe7fa31-a151-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 16:43:31 +0100 (CET)
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
X-Inumbo-ID: ffe7fa31-a151-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647013411;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Qb1WPJrHE7r6NligJnq75SM4L052jdVODx99ty9UA84=;
  b=ZDGfOteFxOn7/9YNwKdhz1xyhym5TYYC9OujSafYJSyzPbXlH+vOtSc+
   iBjl0r/XRpa2elQ5Z0x+3E/bRhgVw/AjUYrNUCoF84/+TDnHqvqY+j9Cr
   ULHxlQ+Trlggxx0K4v3pkc6oxQ3CS3uhy+8lMyaT9FcECs1+umUQPOG2O
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66423434
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:T+akjq5EKWgG+LSLSHKIXgxRtOHHchMFZxGqfqrLsTDasY5as4F+v
 mVKXG+FbP+La2X3fdh2bdu08U1T6sfcy9Y2TgE9rSszHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPgWlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSwezoYYvXnnt09QgdiGD0vHepMx77+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQ6qEP
 JZCNVKDajzxXUxqF14RN6kjhe6kqWakLyx1gVas8P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2m2orv/Cm2X8Qo16PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGr7U29UGtZsnwWVu/unHslhsVQd9ZCeA5wACL1KvP4gydC3QETzhOc9gvvok9QjlC/
 l2Dks7tBDdvmKaIUn/b/bCRxQ5eIgBMczVEP3VdC1JYvZ+z++nfky4jUP5jIpOE0oXeHwjQ0
 i6wpzRvp/IZss8ygvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlyXTVKNjhCo1F8Bps3Nf0pVd0V6cs+D22k5JIVdABuWouTKuF3yttRNMIX
 KMxkV8AjHOwFCHzBUOSX25XI517pUQHPY65Ps04lvIUPvBMmPavpUmCn3K40WH3i1QLmqoiI
 5qdesvEJS9EVfo2l2XpF79FiOFDKsUCKYX7HMGTI/OPi+f2WZJoYe1dbAvmgh4RsMtoXzk5A
 /4AbpDXmn2zocX1YzXN8J57ELz5BSNTOHwCkOQOLrTrClM/QAkJUqaNqZt8K90Nt/kEzY/go
 yDiMnK0PXKi3BUr3y3RMSs9AF4uNL4ixU8G0dsEZg/5hSJ8Pd7xsM/ytfIfJNEayQCq9tYtJ
 9EtcMScGPVfDDPB/jUWd57mq4J+Mh+sgGqz0+CNOlDTo7YIq9T1x+LZ
IronPort-HdrOrdr: A9a23:ZvmPAKv6w20wTKQ2uhXpLj3S7skCkoMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXmF+rQbsaG6GcmT7I+0pRodLnAJV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmH56VNN1xMvdfNVa9NC4kEFjiaGgPR5t3c04klfbMkcEIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.90,174,1643691600"; 
   d="scan'208";a="66423434"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aX8HJokydeHtP8eunHlOQ7XDjuhQ5Mq/U9b71zOIXYnHrbhDCsgE4OWhsBbkytsHAEei9d4873R4vgwReQUtpY4D18cMS5GcpLoXluH+pbMBCVvL8mibwz8i03qExeH1JlGKtTnpWflqzrCJqSzB9kqcsOheqrtp9vKZh+qYymnWh3ZuJedZpd3aBah2Pl7m5A0UbLNKYc+ZqyNkt8ofbTIG1Lv8VXU2axBeGv4VwMkO+pgsDIbnpbQqOIvrL+rASXwCgtPbG+qwl1WqNvDRYfqrSuCd5tjhp9z3OsfrZNehNB3v1joj5UXk0vIqlymEKeQnWj9/pHK8n11i8PjRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o78LAcSdpDOuZYvRCUZArWtMiA+1Enw3E8fVQ0izufc=;
 b=VS3/A6yTgl7oCfY7Eoxv4V+S7JYvlmydZI7tdJfK7eX6EmVTwqYNm6V5lZ8L47pHknx5zdhk0K3o6DEIpaJN3r8HsRq6uPTC3aDOgZLh/0TJ80sOAUaw3qE7iS9w363yLduNBrYoSondcgnRNkDiZfwzdSJ3h/uKoI5OXbUD2xlH2/rbUxL4u/FAJ+1PvXr78ndVD1LU7v6o9wZFgdby2b9Izurgjpbvf6lyslcjCmxyfw8FkCPgwbH0c9UxWxgPavyZ/DdTEtZB1zmAkrsjcn8BjgzXwlggeqdyLhkIvCPjZ1YHnJtbhERCVY41+oS5La0n8yeiXsdu8crpr1y2tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o78LAcSdpDOuZYvRCUZArWtMiA+1Enw3E8fVQ0izufc=;
 b=ZsoRXvyzj3e45N8/EXkRRYTngnGcv6TGe1I1o4Jx0HcXAwKojbR4tFx7yDFSzXzRIrxqwhJyQYRRG2cZKCcyeO6EH4gB9xzicKqKYrU1a03HQ68H40jws7qiE8eXRwqo8hkqiO5MXOnfOoWKYuKVb9h3rTDWYFv+Q2ybc5y9Jhk=
Date: Fri, 11 Mar 2022 16:43:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs
Message-ID: <YituGsgaGaGSIMZ1@Air-de-Roger>
References: <YioddbNor6w/U9ed@Air-de-Roger>
 <53361d65-2bd8-c07b-938c-91b95f2d68ad@suse.com>
 <Yiojgxgd4amSjHog@Air-de-Roger>
 <3055b4a5-2d55-9cf1-1069-8c57208bf0af@xen.org> <YiopXU65pAlnNVNI@mail-itl>
 <d2c63630-6ab3-b4dd-128e-72f871fb9e08@xen.org> <Yisp0Q/cNGbgsO/7@mail-itl>
 <2a5c59ad-2fa5-b668-8bce-0d55e89a4afd@xen.org>
 <Yitk68wpP8HV4od9@Air-de-Roger>
 <5cedf43b-3903-9668-69a0-01b8ba339ba7@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cedf43b-3903-9668-69a0-01b8ba339ba7@xen.org>
X-ClientProxiedBy: LO3P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c13a5a1-d9b9-4d21-b1aa-08da0375e1ed
X-MS-TrafficTypeDiagnostic: CH0PR03MB6049:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB6049DABA4DDD81D9B4420A458F0C9@CH0PR03MB6049.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r7ssdApBtUU8Dezo7qZs5Bheu/1UBr0w6hibEwf0N5BIqmGOY6ulVUZnHN5n96/Mga9oboRVpTUNmbnqX/lf6/OZAO5xPyhSBDHeZh0xVNS+v5JxVnF+q/kdlJAFkLJi7kCbOnHsf7SLIlwB+nwqfY4Hlzmnx3DqTn5zqwS/fgR4WZRbsbtt9btH3ihx4UyPll2x5v7X+yJumrMZZO6dP/PW7kJOBzxJ7e0+A1MDQSfOYiyTe9/caNHm7vpCRF7qzHfvIdyDIx38OhNkNoFZpxT3bmE8JNzHEtYXZuvWo6nI8ZGudgME8zJSZCAJaQ851oQ4hqR+9nl83U6MalROP+ER4KOx0TqOMJD4w19iE9rCHPvPq1NALiSNwTRFc6sBso3pzaayiDqexOboin1VxUqc3v8wO/DQXr0aULl10bZ4Zes3ygymr7QUzdiVOSDpyBeWToBniGI848WS748tqWLRn7Tn8EzNH1GVxlv2GUlTCMji47tXrcnNj54+fdeH/TVXxKHoBfXue7DBJDKNJBEC91FHgFUYthQlmG3Nk+m8ZyY+8uV5dmgV/0xjMoqrxYcXnB+yCH6Z6ysvvuowtnUPpaEnuDYIm02EZCn/4aOVVHXPnmaBiRqkoIRDrBit2OQ3wEwZptUaUaTFOlGyZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(26005)(186003)(83380400001)(66556008)(85182001)(8936002)(66946007)(8676002)(6486002)(33716001)(66574015)(38100700002)(4326008)(5660300002)(66476007)(9686003)(6666004)(2906002)(6512007)(86362001)(82960400001)(6506007)(508600001)(316002)(53546011)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGxoamN0Qk5WQ3phK0gwaGlXcnQzZzZ2ZVZDckUyMko4bzI2bVBRKzZZenhG?=
 =?utf-8?B?N1dsV0NMN3IyNTJrY0pmY3ZwYnBMcnpyMHFrYmQ3ODZtdWdHcWVYZzFNYTh3?=
 =?utf-8?B?VWtjcm5IMmZ5MU03QjV1S2dlK3h6bnVlSkwvc0JsdVNlb3YrSFprYytjMUZH?=
 =?utf-8?B?K01qUm5GcHR3ZHZMTEg5VFNiNkxsSkFWWXRSUElGSkJSUVJEWmg4KzJ6MG5N?=
 =?utf-8?B?MndwbWVQNzhXVWRXQllxcm9LTXFPUjI3dkRDZXlDL1UwMTlhUHBhcGpWRE1W?=
 =?utf-8?B?N0FSZEoxaUlXWk81RXU2NUZHUFRkUWJOY09rYk1lTVgrV01BbDU5L2JxUzlD?=
 =?utf-8?B?WEVpdFNIUWg2T2dLc1VibkVLYytySmpCS0R1ekg0ZTVwMlVvZzUvV2IvR3Zm?=
 =?utf-8?B?WnpGVTNQTG9aRjNJeTBtczcyM2ErMUlHMFFucDZCd0RBZktVM1dYcFBmMGZL?=
 =?utf-8?B?aStCMlJnN1F6U1REUmJJcTBYZ1lXaGFqSHpBb0hadnZkME92dTU3RzJiQVZr?=
 =?utf-8?B?WTBzMVNlL3JyQUp2SXp0eDRmbjNkcDB1NmFSNTA0a2MwTEcydnRndlBNMGt0?=
 =?utf-8?B?TUloU3hLbXVEdlZ2UWJBMWtPZzFRMHhXZG5ydmwxQlI4TlNkU0pWWGV2a1Va?=
 =?utf-8?B?U2loLzFIenZNcjZBN09wWmVPTGVVNmR6QUFCUmJSc2pDajhRNVFsbnN4YlJy?=
 =?utf-8?B?OGxHcmxBcUZvSWNPOXB3SG5HbjhsL1orajRCcDlEaG1xZjdZekkwanlZckRD?=
 =?utf-8?B?RHZFa0JIVHhIOEVuOUJSR05NQlR0bEgyTVpYaXR2R2x2NE4yU3lXWElDeDR1?=
 =?utf-8?B?M2hzYzZqSm85Z2kzbkFzS0pzWkR4bGZLVWtwS0YrK3dYdnRJb1VHSFRxalNG?=
 =?utf-8?B?UGE0NnppY3FaM3dnOGJKNGNvMDRVN2dYQjgvaVNYdG85V2tEOGhFbTZxSjBr?=
 =?utf-8?B?bXdUMVh6ZGFucFRNUFBmcUtGeHJWWm5rQXdOQ2JTaUgxNGs3YXdJbTVJVHg3?=
 =?utf-8?B?VXBKcjlETFVkcUtLbk0vMkVPbjc0TGJ0MGR3cDZYbERmNk50L2VEVkpENW1E?=
 =?utf-8?B?djNvalVmdFRpYng1aHFVQTlicXNuQUhIRCtEWnhtU3gvU2JMc3dYMjBUTmto?=
 =?utf-8?B?R2hKQmcxTkdKc0xOTi9HQVQ0anV1U2ZiU216NTdvcFB3VjIzRkpxWDBmTmhw?=
 =?utf-8?B?Skw5Qi9tcDR0S3NRdmhwQ2U3bVMzblAwWTZGZ1RpNmlnRzhNdy94b29Dai90?=
 =?utf-8?B?bFUxc3EwanZVS293RFg5cFFEYkNOUzBBZFRNcldpd2RDZElUaGNyNEZTRDYw?=
 =?utf-8?B?Y1JmSTJHa1lOK3FyQmk4ZGcwc0VNTzF6Y2xpNVdoYSs2Vk5mQkdiN3dDdWhO?=
 =?utf-8?B?N1pMWXlLd28vTTh4RG11dWxpY2tGM25yYW9kQzJ6YkZiN0JxU3ZnYjRlS0N3?=
 =?utf-8?B?VUhOclFZMktwYXBwOXhNOW1OOVVwbmZIUGI3SVRyWEJqTTNRRXc4b1RhNjJ3?=
 =?utf-8?B?SEhOU2NLQTU0NjlES0w5MFV5Y1dQbERkWkpkKzNBZ002RUF4bDFiRmtHeUtS?=
 =?utf-8?B?SGpOYXpRQkduUXFOK2NZNUkwUGZUV0lrNGZKVzM3RWlVQnZSR29aU0lzR1RN?=
 =?utf-8?B?TFB3YlByb3hiVExGc2JxTE0vck5PRTViYnhUQ20xMVpuTXZKWXB4MXREVUM3?=
 =?utf-8?B?M1JZcjdHRG9lSHgraGs3SnpPamFmZlU0M1NyWlJ4OFZkamY5VlAzVVNnUVN4?=
 =?utf-8?B?MVNXMytBM2w2ZWRhUC9TZDJUV1dkeXkxTmxGbWVPMkZJc0ltU2FqNWozNHhy?=
 =?utf-8?B?ekNrSWdvZHhOcU5wR3hLQkpmakFUN2lTM0Jlc2x3RHVRaCs1NHRUaGNoMm1q?=
 =?utf-8?B?OGtuVnlNVE5JRGtCRFhZdVRQYTZXMExmQ1RsU2U1dUdIcjU5RDZqanZlWjV0?=
 =?utf-8?B?QWZyUFRLRkdBMzRYT1hOM0RyUCtqMWkrV3JCT3pkcEhaUXJBVXZ4Y3BRZ2ZL?=
 =?utf-8?B?OFdkY3p6cXN3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c13a5a1-d9b9-4d21-b1aa-08da0375e1ed
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 15:43:26.4260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xw3wbIGMz+WPAjP8hslDlg7cs3i1+YT9KFWPvZt3BLh6RrxKRiNIkqzhsjbstK1cdfZqnlE2VGexlInbNTNQnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6049
X-OriginatorOrg: citrix.com

On Fri, Mar 11, 2022 at 03:19:22PM +0000, Julien Grall wrote:
> Hi Roger,
> 
> On 11/03/2022 15:04, Roger Pau Monné wrote:
> > On Fri, Mar 11, 2022 at 11:15:13AM +0000, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 11/03/2022 10:52, Marek Marczykowski-Górecki wrote:
> > > > On Fri, Mar 11, 2022 at 10:23:03AM +0000, Julien Grall wrote:
> > > > > Hi Marek,
> > > > > 
> > > > > On 10/03/2022 16:37, Marek Marczykowski-Górecki wrote:
> > > > > > On Thu, Mar 10, 2022 at 04:21:50PM +0000, Julien Grall wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On 10/03/2022 16:12, Roger Pau Monné wrote:
> > > > > > > > On Thu, Mar 10, 2022 at 05:08:07PM +0100, Jan Beulich wrote:
> > > > > > > > > On 10.03.2022 16:47, Roger Pau Monné wrote:
> > > > > > > > > > On Thu, Mar 10, 2022 at 04:23:00PM +0100, Jan Beulich wrote:
> > > > > > > > > > > On 10.03.2022 15:34, Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > --- a/xen/drivers/char/ns16550.c
> > > > > > > > > > > > +++ b/xen/drivers/char/ns16550.c
> > > > > > > > > > > > @@ -1221,6 +1221,9 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
> > > > > > > > > > > >                                  pci_conf_read8(PCI_SBDF(0, b, d, f),
> > > > > > > > > > > >                                                 PCI_INTERRUPT_LINE) : 0;
> > > > > > > > > > > > +                if (uart->irq >= nr_irqs)
> > > > > > > > > > > > +                    uart->irq = 0;
> > > > > > > > > > > 
> > > > > > > > > > > Don't you mean nr_irqs_gsi here? Also (nit) please add the missing blanks
> > > > > > > > > > > immediately inside the parentheses.
> > > > > > > > > > 
> > > > > > > > > > If we use nr_irqs_gsi we will need to make the check x86 only AFAICT.
> > > > > > > > > 
> > > > > > > > > Down the road (when Arm wants to select HAS_PCI) - yes. Not necessarily
> > > > > > > > > right away. After all Arm wants to have an equivalent check here then,
> > > > > > > > > not merely checking against nr_irqs instead. So putting a conditional
> > > > > > > > > here right away would hide the need for putting in place an Arm-specific
> > > > > > > > > alternative.
> > > > > > > > 
> > > > > > > > Oh, I always forget Arm doesn't have CONFIG_HAS_PCI enabled just yet.
> > > > > > > The PCI code in ns16550.c is gated by CONFIG_HAS_PCI and CONFIG_X86. I am
> > > > > > > not sure we will ever see a support for PCI UART card in Xen on Arm.
> > > > > > > 
> > > > > > > However, if it evers happens then neither nr_irqs or nr_irqs_gsi would help
> > > > > > > here because from the interrupt controller PoV 0xff may be a valid (GICv2
> > > > > > > supports up to 1024 interrupts).
> > > > > > > 
> > > > > > > Is there any reason we can't explicitely check 0xff?
> > > > > > 
> > > > > > That's what my v0.1 did, but Roger suggested nr_irqs. And I agree,
> > > > > > because the value is later used (on x86) to access irq_desc array (via
> > > > > > irq_to_desc), which has nr_irqs size.
> > > > > 
> > > > > I think it would be better if that check is closer to who access the
> > > > > irq_desc. This would be helpful for other users (I am sure this is not the
> > > > > only potential place where the IRQ may be wrong). So how about moving it in
> > > > > setup_irq()?
> > > > 
> > > > I don't like it, it's rather fragile approach (at least in the current
> > > > code base, without some refactor). There are a bunch of places using
> > > > uart->irq (even if just checking if its -1 or 0) before setup_irq()
> > > > call. This includes smp_intr_init(), which is what was the first thing
> > > > crashing with 0xff set there.
> > > 
> > > Even if the code is gated with !CONFIG_X86, it sounds wrong to me to have
> > > such check in an UART driver. It only prevents us to do an out-of-bound
> > > access. There are no guarantee the interrupt will be usable (on Arm 256 is a
> > > valid interrupt).
> > 
> > It's a sanity check of a value we get from the hardware, I don't think
> > it's that strange.
> 
> I think it is strange because the behavior would be different between the
> architectures. On x86, we would reject the interrupt and poll. On Arm, we
> would accept the interrupt and the UART would be unusable.
> 
> > It's mostly similar to doing sanity checks of input
> > values we get from users.
> I am a bit concerned that we are using an unrelated check (see above
> why) to catch the "misconfiguration".
> 
> I think it would be good to understand why the interrupt line is 0xff and
> properly fix it. Is it a misconfiguration?  Is it intended to indicate "no
> IRQ"? Can we actually trust the value for the Intel LPSS?

Sorry, maybe this wasn't clear. My suggestion was not to just do this
fix and call it done, but rather to add this check for sanity and then
figure out how to properly handle this specific device.

So adding the check here is not a workaround in order to support Intel
LPSS, but rather a generic fix to ns16550 for an issue which happens
to be triggered by Intel LPSS. We would still need to figure how to
handle that specific Line value. I haven't looked at the docs, will do
on Monday hopefully.

Thanks, Roger.

