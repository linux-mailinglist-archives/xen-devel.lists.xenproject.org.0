Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2458250721C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 17:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308316.524006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngq6A-0006Ct-2J; Tue, 19 Apr 2022 15:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308316.524006; Tue, 19 Apr 2022 15:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngq69-0006AD-VV; Tue, 19 Apr 2022 15:49:01 +0000
Received: by outflank-mailman (input) for mailman id 308316;
 Tue, 19 Apr 2022 15:49:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mThm=U5=citrix.com=prvs=101c57682=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ngq68-0006A7-LI
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 15:49:00 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3981191f-bff8-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 17:48:59 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 11:48:56 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5045.namprd03.prod.outlook.com (2603:10b6:a03:1e6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 15:48:53 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 15:48:53 +0000
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
X-Inumbo-ID: 3981191f-bff8-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650383339;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CN7iJu3+WgRtQBoa4LugFHQmLBVb+qeMz0d7acpQ1DI=;
  b=EJ7j17OB4TDIjdsfjAzUztHDCTmBYgCiXsneUsbDnM0nuTZRQ2oYWvVF
   7pB7VaW4FlUt7uMngO7arhcLgDENIeTle5ExiHUvkHeWO4it6BH/mqHKh
   Jq1LGtG9TLXBZ0izr0hUAoAQcHp++4pm2pVojShBCpmd0CQVa6ws/F5a0
   4=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 69299652
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CsnKHq6SztKQmqu33Ly11wxRtDfGchMFZxGqfqrLsTDasY5as4F+v
 jBKC23VPPnYamKmfN0gaYW1pB9T7JOEn99mTQdk/y08Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTgUlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSyTTkvD62dyd86WjJ7CDpPJ6BL2aP+dC3XXcy7lyUqclPK6tA3VAQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiao4YAhl/chegXdRraT
 +MfZSBic1LrZBpXN01MIJk/gP2plj/0dDgwRFe9+/ttsjmNkVYZPL7FEerFW4Cqd8Fsp3nDh
 CXj2lbIXwlZDYnKodaC2jf27gPVpgv5Uo8PELyz9tZxnUaegGcUDXU+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFactwMYc8pdFas98g7l4qjb+QGCHUAfUyVMLtchsacLqScC0
 1aIm5blAGJpubjMEXaFrO7M93W1JDQfKnIEaWkcVwwZ7tL/oYY1yBXSUtJkF63zhdrwcd3t/
 w23QOEFr+17paY2O2+TpAmvb+6EznQRcjMI2w==
IronPort-HdrOrdr: A9a23:1wZtF6/9yPQnoX/qZwRuk+GBdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrbX5To3SJjUO31HYY72KjLGSjgEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpgdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1cjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3bRY0eTFcZcso+5zXQISdKUmREXeR
 730lEd1vFImjbsl6eO0ELQMkfboW4TAjTZuCKlaDPY0LDErXQBeot8bMtiA2XkAwBLhqAC7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0WbWIyUs4mkWUkxjIdLH7AJlOJ1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEy82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBNB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+q6GjMiq9NFlVcQ6duv22vaIJy4EUbICbQhGrWRQpj9aqpekZD4nSR+
 uzUagmdsPeEQ==
X-IronPort-AV: E=Sophos;i="5.90,273,1643691600"; 
   d="scan'208";a="69299652"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OviiamYew0XevVa7kSZTlDjT6mAbIBF8Kxlr0GNS1ACqap7J7ykc9y/e//LkWleoWUfN/8KB9mMK9YB1P4/+hNzifW/pWYdBQ5SI4b+XM/tKn1IBqoqhJBIyLvMF5pf6ijKvN6bECFxQGgEgs7EGRwmX6Y+jkgWGxFks7NJ2LiT2MgDkZTho9mdL9xj0yGqBe7cWpo1asGOjhnxutugnh7II7eZ5AbBfexabyLRsy/HKv9g7cmdxrSO0vUr+ZqPnkeNaEtNECIXgCSTAQcq1epe5l++8l360KVl2n1RbKtDYsbB5+4dML8B7mzoCOvknaO4QjjulFTfB66BGWplYqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CN7iJu3+WgRtQBoa4LugFHQmLBVb+qeMz0d7acpQ1DI=;
 b=n1HBYqmTlk0UyyhytHQE5nkR8x1UhR2L4FFCRC9tVZUXLsxDDxalK20CAyTJVfxETLGJcq1KqmHRg5gNPdVLgfsVkKSNyKQgBaTRRmBTctQW2l24jdt/cwQSH501mTVuWm8ySPWOaJhefZG0QxVCVvdykIWDKXF2VGzKBngXtlt5n3IwA9KoDDRxC7wAoarjUrwUyH76rnoxseXOXTAxdSK2yD3kHCeIEJwa9VOyyQFXq277ydeyLRaGRi+JW+L0FBfdvVJxGalC+tZzZRVMzHVtaavDcqoUlnmzmxRQ++rrplzKHvwrGNqkPSe2yfkmshJF3UU8vy/KZa/LfE8kng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CN7iJu3+WgRtQBoa4LugFHQmLBVb+qeMz0d7acpQ1DI=;
 b=T9ZeO67aw8jr1P2qmT9tPwtt8nRDA/OwjHqmLbdhTjc4YHDBeE55HnQOegSNQbjezKSBTnNNxRPKeltOWuejmy4Yz3JWZBmfiC/CwQfy8RhBecHkCSugQ8AMx5L+S2CB7wD1zi4GZkz/bwpG1ZiZy+3P7+vxHXVdCr+YadAJDhQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Thread-Topic: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Thread-Index: AQHYU9FUwjuogeCS0EWgGeBVFIanqKz3Yk2A
Date: Tue, 19 Apr 2022 15:48:53 +0000
Message-ID: <8a8aa0c1-e6f3-2dc0-77d4-282af89f4ed6@citrix.com>
References: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
In-Reply-To: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f45b9b4f-3102-4c3d-8809-08da221c1b1d
x-ms-traffictypediagnostic: BY5PR03MB5045:EE_
x-microsoft-antispam-prvs:
 <BY5PR03MB50456E0C519FA1C67007A5F2BAF29@BY5PR03MB5045.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rR4WixcqE0j3j3B4NUdXoLwQvN6PypVJGrdXhA0BeYS3UmQQKWIEFmSTwwkFH5hquy+WMG0t7s9JawDGIYPHhXKjUem+mYunswHQKbtLuFCMfAqDMBoHSaownRgUrb5NTsB1YAqx+ScQJj2CRhXqsQDmZVEmm8UNyXCUKA60hYoG7ewKa6DNMtJ8gzVOeu/iuAE2kCrw4IWxB2SrYVfVWXzcd+0ABkzuUMONIu58ZyXn6RAXQbHCgsdTSiRsOGian/s8fvr/IkUW7w5leZ+4JXhctP3RpQbpvrnGEhKiOKanPBw8/IvKc0BqMXKJJd3NUFVolI7qF6quFl5olPBtB4zeL8kvloNg2MOloZItvGGM6/P+ryZZ/iEHr2TCl9i9YCvj14tClos5rge3JFwGZjdWdFrA90K9d4D3sbc4RuVW0uGMwyCmXvN1nmCmBDsAxhZ6KjmNsAh/ClxXV1CnCBCjw66Qmc7IpvUELwr/heStc05wO78ewM20oviH4NKaOJERJ/vCo+SHUdsyPTE9Wq3djnB+WAg960tSo/MdraWixLfKQAleTK6K+tGDf5rrVe1V/hRbTcSSMXd+CAzHRF/Jjri2R23AFEIMmTAVYMx7907sbZE9kcVMlesGfYQYLWTiZHadlV/77cZPgwgfBECViJ5iS4nERFBYf0dKiUIV+T/AEMn3MMnRjthoOH9pku3hVr6SdCjgdifrhIGaJBVKzfxNjDiDbtozVHNrY5HvvvhSa5/ZADd0T/9TjadFpiTuXP6qRPMfWDXiVC6pOw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(38100700002)(66446008)(91956017)(76116006)(54906003)(66556008)(6486002)(316002)(2616005)(31696002)(71200400001)(66476007)(8936002)(110136005)(8676002)(4326008)(4744005)(122000001)(64756008)(53546011)(5660300002)(2906002)(38070700005)(508600001)(186003)(26005)(36756003)(82960400001)(86362001)(6512007)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NnRZVXNNUEpHRVpQeDMrT0F1Q2NSbDJRbk13OGsxcWhoT2lreXJyQnNvbzlm?=
 =?utf-8?B?cXZJY1R2NWNPSFUxRGVBSnhPU1lUYVF4KzUrZGxkS0J5cURSMGdPaWoxMmVF?=
 =?utf-8?B?ZllTRk5mU2NaamhXMjNBRi9pbXMvNXpUMk9oblRPR0JiZmZHaE9oaVI2MjdE?=
 =?utf-8?B?MnE2ajFEbUxZaG5WdGZWaXFJQmh3ZVU0TE1DYXBDN2ZLR3ZTVFJlejlKdzdw?=
 =?utf-8?B?cTR5cmZMclZGbm8ycWhWcmxNeFhRNi82N1krUGdkL0R3aGlEcmR4K0twNzRl?=
 =?utf-8?B?MnlMenJLNEF2UnY0TDBKUGRBZHN5Tm9PdVZDRjRWQ2ZwUzdTc0VGOXZzelNr?=
 =?utf-8?B?dWxyZDdzcy9NODB0L1hLQ1R2NzU2M2ZpM05PWFRhVFljREIwK2xhK0c1aG84?=
 =?utf-8?B?dy9aUENNME1GNFBhYjg3WVJKSXVMMDkxNk8zNmJ6RmRqczlIMzI2QUF3SFp0?=
 =?utf-8?B?MGhidm14VEFFaU81eEVXQ1g1d1dTcmN3TjNpeVdyUzNROFlQWmU5a3BlMi9N?=
 =?utf-8?B?bUprajRwSXBFUHlmVkVwK1A5Nys5NkJQak1hRm05MzlSQUZ1c3Q1cEJ1NjVo?=
 =?utf-8?B?Ujl6SVJyNm9Eb1FQWmcvR0VRSmdBRzVpVTdqLzVVWnhqQ3BiUWtJdGhaMHl0?=
 =?utf-8?B?VGtEV21zLytWOTlGQTV3ekZrVlc1V3h4ZHJ6dEJwT09sakp3eHR6MTZ2QjB2?=
 =?utf-8?B?bVM0RFA4SFFtWkZpVE1WdUVsRDkzSTQ2N21QYmk0NGYraVlwTmVraHJtY1Ex?=
 =?utf-8?B?TjVMemt2dUtCS0luUmZyMTNka2R0VkV6VW5QUDh6RE1VVnVRV2dBSmVMVjJZ?=
 =?utf-8?B?eng5ak1ZTHUwRjlZTW84QkVyUXg0NjdWcmpIZDgzd2FQVnJBeXNJRFUyWE56?=
 =?utf-8?B?eTcvdzZhblpDaCtPeThSSEZlT0dxd3JnZitDek5DRkFaTkFmY2V1ZDVqUjJR?=
 =?utf-8?B?UXRkVjhnN0NRRHF5RGdNR0V0VHgyMnI5dDJ1RjNYZTF1VjB6S1NxMWZRcGV6?=
 =?utf-8?B?ZXJNeE5SVG5tMFZTUWFRb0lKeTBmemViTzMwckhVMmNnSDVuS0F0c0lSeHdM?=
 =?utf-8?B?ZXYrQ2RaQzJqNWUyd1FuRmpNVi9CbHNZNUQ3S0xjbHhyOWlzV09GZ0I3ZnhO?=
 =?utf-8?B?NFd4cWNDWlhKTFdEOFVlcS95V2VlZEpnaWU0V1pUK0o5eXZLRE5pOURlSUNx?=
 =?utf-8?B?SW1FRkZtZEpsaFhIWWR3MG5jZmREQWxQTVlkU1J4amkrU09vdUtwUUtudU9H?=
 =?utf-8?B?amRDY3l6c3BIai9YeUx0OExmWUtpNVlEemtaOUtNTURMMUF0WHpTa0gwWnM4?=
 =?utf-8?B?UU1EOGs5ajRwMG9JRE5TUkg5ZUVLZmcxbkRkMjQ4Wlp5QnppWUIxVjhXTlFK?=
 =?utf-8?B?VlpzdVdBcENldzcrYnhBZWtSa1NXaWkyR2VIZ2FrZVludUFhQ1JIK1NMV3dP?=
 =?utf-8?B?K0J4bk9aVytOQlgzc3RodE5QdjNHZXRJZFVxNmQrLytpMXp1aDVxbytnYUY3?=
 =?utf-8?B?RU1uSkI1bmpMS3o0RnlTTDltZmE2aUpPaFlEQzFMWjh5WC9BSC9KUkVsc2tl?=
 =?utf-8?B?YzlVUHgzeHY3dldQMWRBL0ZEaTJPWnV3ZEtONUhMTHdxRDhPKzNma3lBUjd2?=
 =?utf-8?B?aExheS9aQ2NMZjdwNHZpVTdHd08vUWN5RmdkWVFaMGNmU2xibWdxTW1LRDF0?=
 =?utf-8?B?R25xVTRUR2U5TTBXUTE3b1NVNDN4blVicEVuTzFEWFlPNnFPZmpYZjIyL2JT?=
 =?utf-8?B?dVBnOVhRS3RZcU9teEswWDBIMXV0bXJnMjNqVExWL2xzNHdNbHZBR1R6QXhD?=
 =?utf-8?B?bVk0NlZNZjVJYjRIYVZOTnAySXNwZUxqYTlXTWpBY211VkZWUEFPL3ZhU3BW?=
 =?utf-8?B?RHpyeXlPTml3bUZUMzVGbHhtZFAxNmVtNW81WUFFYlVSV29TOU9jY0lZdTRk?=
 =?utf-8?B?NTRIV1FUaWZVN21sNWZvUUxUcmRzT24zc2dsSk9wVVREU0NHYjl5eEdpVUtP?=
 =?utf-8?B?NmR5MWwyck5EaFNpTDFqcDlLbXJJZDhjUS82YTl0UXdxbTJBbG82QXlJWTZr?=
 =?utf-8?B?Qi9Pa0xuMTNYVCtKOE5pU2Zyd3dvbEFTUzFsNllmYUExbGFiWVFRNjF2VEdG?=
 =?utf-8?B?cU5tYzJ4VEJ6RUdOYTdIaDhFd2VYMGdBbzRTYithdlhvMkZaR0c4MS9ESmE4?=
 =?utf-8?B?UmJKZEFZMElmOU84Qzh4Y1lSN1VKWWFBNFcxMlYvNU1TYWV5aGFUUmM3NW9t?=
 =?utf-8?B?Yyt1NjJGV2hOclBwZFdTWVArVnpLTXluVm5MYStBeld1UmZEMUtDdFZyZ0I0?=
 =?utf-8?B?eStRWXJRVmF5QXltN3FuRWZUMHRzWE5Tc1I4aXQ2cTRMNThqVlVSUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <643225A77020764B9FC16182B67ED1BC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f45b9b4f-3102-4c3d-8809-08da221c1b1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 15:48:53.4757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2db6fGgtB4s1bXt12AGLMwkpyk7KxLoONSYNOIK+ruZ8KilC2EiTYxrdwqZo9LuI6ysB46KCoJN1XC+iZTy7LPQY3B22tFwig6X3YlI+lJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5045

T24gMTkvMDQvMjAyMiAxMDozOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEJlc2lkZXMgdGhlIHJl
cG9ydGVyJ3MgaXNzdWUgb2YgaGl0dGluZyBhIE5VTEwgZGVyZWYgd2hlbiAhQ09ORklHX0dEQlNY
LA0KPiBYRU5fRE9NQ1RMX3Rlc3RfYXNzaWduX2RldmljZSBjYW4gbGVnaXRpbWF0ZWx5IGVuZCB1
cCBoYXZpbmcgTlVMTCBwYXNzZWQNCj4gaGVyZSwgd2hlbiB0aGUgZG9tY3RsIHdhcyBwYXNzZWQg
RE9NSURfSU5WQUxJRC4NCj4NCj4gRml4ZXM6IDcxZTYxN2E2YjhmNiAoInVzZSBpc19pb21tdV9l
bmFibGVkKCkgd2hlcmUgYXBwcm9wcmlhdGUuLi4iKQ0KPiBSZXBvcnRlZC1ieTogQ2hleWVubmUg
V2lsbHMgPGNoZXllbm5lLndpbGxzQGdtYWlsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPg0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9pb21tdS5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4g
QEAgLTU1OCw3ICs1NTgsNyBAQCBpbnQgaW9tbXVfZG9fZG9tY3RsKA0KPiAgew0KPiAgICAgIGlu
dCByZXQgPSAtRU5PREVWOw0KPiAgDQo+IC0gICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSAp
DQo+ICsgICAgaWYgKCAhKGQgPyBpc19pb21tdV9lbmFibGVkKGQpIDogaW9tbXVfZW5hYmxlZCkg
KQ0KPiAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQoNCkhhdmluZyBzcGVudCB0aGUgYmV0
dGVyIHBhcnQgb2YgYSBkYXkgZGVidWdnaW5nIHRoaXMgbWVzcywgdGhpcyBwYXRjaCBpcw0KcGxh
aW4gYnJva2VuLg0KDQpJdCBkZXBlbmRzIG9uIEp1ZXJnZW4ncyAieGVuL2lvbW11OiBjbGVhbnVw
IGlvbW11IHJlbGF0ZWQgZG9tY3RsDQpoYW5kbGluZyIgcGF0Y2gsIGJlY2F1c2Ugb3RoZXJ3aXNl
IGl0IGVycm9uZW91c2x5IGZhaWxzIG5vbi1JT01NVSBzdWJvcHMuDQoNCn5BbmRyZXcNCg==

