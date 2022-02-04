Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C524A98FF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 13:12:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265452.458822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFxRz-0002iO-Fr; Fri, 04 Feb 2022 12:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265452.458822; Fri, 04 Feb 2022 12:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFxRz-0002gX-Bl; Fri, 04 Feb 2022 12:12:27 +0000
Received: by outflank-mailman (input) for mailman id 265452;
 Fri, 04 Feb 2022 12:12:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTBG=ST=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nFxRx-0002gR-72
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 12:12:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4d087fd-85b3-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 13:12:23 +0100 (CET)
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
X-Inumbo-ID: b4d087fd-85b3-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643976743;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VV1SgA/+vHhVXkU0glUqb589oAQ2iOPI7l8P+Ayc/vc=;
  b=V14IH5uy6WcgngLD1PZlCKd3DJmEAzwEP3lnPcxHdnXuUqXGj+6kiH9p
   oBQtXCteYYRNHQit/YmAxn4RlS1DB3BfHc6E242J844PnrC0lAe7MHsPQ
   aswcgbqq4u4Yje6Oigzj9Zs3uXcUwHmVMR0WX6v76eVEYR2+5dMU88afC
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NDFaphHeJ8slrujuoiwlRnUqPxcZW2FkYlgBXR6m9wH4PZyQEh6DW7k9NAYkaw6H123mA2PPpx
 o1xe9THslPN2J0qpQ3XOE4X4AKwBymD7px4qxfuoHGjyyvaUav+8zcDHvPrHqNq5YR3TAg00Ut
 wn+4eRf3ap62vXFZJDz9FR9lRx09Znpx2iQH7yTvJT0FnmLhF87s4dG4pxVPaIVqYylMlD1oBQ
 uoikQFq+piuzpuXsNcyjXwJAYSpg9K+ksOk8+G5+aOGikYL6Gp25qy5rY1rkfT9YZ6G7hVZJwd
 VvoXuMnS+JjTsddZ4nSnhha/
X-SBRS: 5.1
X-MesageID: 63900360
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:o4Hwnq9OdOQrsunmX2ocDrUDanmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 GAdUWGFPqmJN2Cjf991atzi8RhVv5aHnYRkSQM+/H88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rh3tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhM5
 OVVu4PzYDskZLSXgP9BTxZiVB1haPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4VTK6GP
 JRBAdZpRD/KRS1xZGhINKgzs/ul30bmLxR0uGvA8MLb5ECMlVcsgdABKuH9eNOQQt5Otl2Fv
 W+A9GP8ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkgIxqYAi+UrtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEA5Yg5ZZsNlnfM7HyVxz
 kTVg9zTQgBw5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A70JZTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CVc8yR9xLpXZX1oqMBraL9WdF1Oz63dWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPuMQDZyb0MP4sPNnZ5yEWIU7IT4+Nuhf8NYImX3SMXFXfoHEGibC4gwgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eRD+8zK/kuKHcqT503+idK2PSfJIZ9YYArmRr1ot8us/VSKm
 +uzwuPXkn2zpsWlOXKJmWPSRHhXRUUG6Wfe8J0KL7PTf1Y9RQnMyZb5mNscRmCspIwM/s/g9
 XChQE5Ijl35gHzMMwKRbX5/LrjoWP5CQbgTZ0TA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:BK0dm6z6nDkOTTmvGjrUKrPxiuskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9IYgBdpTiBUJPwJU81bfZOkMgs1MSZLXbbUQyTXcFfBOrZsnPd8kjFl9K1up
 0QC5SWZOeAb2SSyPyKnTVQcOxQg+VvkprY/ts2pk0FJWoBBsEQjDuRSDzraHGeLDM2WKbRf6
 Dsgfav0gDQAEj/Gf7LYEXtMdKzwuHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX262oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkFxnAjv0idvrD
 D/mWZnAy1B0QKJQohzm2q05+DU6kdo15Yl8y7CvZKsm72ieNtwMbs+uWsQSGqp16NnhqAh7E
 sD5RPri3IcZymw7BjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklXavoMRiKo7zPKt
 MeRv00JcwmBm+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNBKVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaNKAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu4ljDlhCy/TBrZbQQFi+oWEV4r2dSq8kc7/mst
 6ISeZrP8M=
X-IronPort-AV: E=Sophos;i="5.88,342,1635220800"; 
   d="scan'208";a="63900360"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaIrsuInwIEAnOVzMQBGCNUyB4YHp0UB009rVO04YcpW0XDP7Lc3Ao6/sTI3keyKWzb/M5Kf+Q9mC5GDq/y3OfraT0qQyYvElKjrZW0wSNaVn4j0NDAn6dwuJTSLjvPdElLZQQXHmLqRePMbI2u6ucDw9/cy3qlfE6/MwRDEX51kbUgjnzSYIgdP1dbeIYBm+nG/Vqqel3xnt73xlpdyhaAzGci1eH9az44k1fwwdcznjFkKFeADO+m4iDw1k/Zz7tD9LnqGD9wmMVYZ5fOrhtChYEBtQtoFWzK6fhK5m2wWN94YMWsDHRtVNAxeWz+fpyeKJvWDjoRT6OR3pPQWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV1SgA/+vHhVXkU0glUqb589oAQ2iOPI7l8P+Ayc/vc=;
 b=Rm0Fz+b2p8GC/gk9qFPvJZoSTTGEEuvVMJb3yJy5hn4pnHnhSC69ueFAmQD4oHmbG/GMVSHW7LQ6H7sIOWhTnW2QJz7lr4QA0SFq/tTmscMEjPLbRGpvudOVbN/R6xZEl2dk+QY2KPiolp8VpxJvwtsHTi18zrx4TNck77Q3e9WBFR9HtlKOw+WBHLo1qMURuNHZaPd2RttDeZ+KJkxSivlQpFaJy39ka/wNXtoZP7HsVVkmWpThxhoqfsPZ/O0eqBXNlhc5bUj/1A+PMrwYxkv7BigbPOZWTlqiCOW/OCu3yJaBYfxziHa4/cAXS3Q039hLbVloNMQReNHcyC0URA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV1SgA/+vHhVXkU0glUqb589oAQ2iOPI7l8P+Ayc/vc=;
 b=rOQAKSdWz1c8828azoG8xGkUTl2g4SRSn5xWIoEjKYDGUx52ac9hSQaiGsgYnN1mKwGR+x94ZlVHcm521p9hPOywd+Yxrh5Dtmv3+80+C8UgvnGYktq/19Q4x9dxl/MFicd5C1n+nhtFlycVBhxjdnGGxXoxLXvdDgi/jUuuv7s=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools/guest: Fix comment regarding CPUID compatibility
Thread-Topic: [PATCH] tools/guest: Fix comment regarding CPUID compatibility
Thread-Index: AQHYGSl3cICfrTH0c0a6DCprlMhYPKyDEOqAgAA9p4A=
Date: Fri, 4 Feb 2022 12:12:16 +0000
Message-ID: <f2ce80ee-f30c-dc6f-e4b7-5d8eddb5b3d5@citrix.com>
References: <20220203181023.1554-1-andrew.cooper3@citrix.com>
 <53b98995-8cef-48b4-7728-3bfbc236af5f@suse.com>
In-Reply-To: <53b98995-8cef-48b4-7728-3bfbc236af5f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 931af6b9-4de3-4bf6-3460-08d9e7d795b6
x-ms-traffictypediagnostic: PH0PR03MB5718:EE_
x-microsoft-antispam-prvs: <PH0PR03MB57189D694350F280854EDCB9BA299@PH0PR03MB5718.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7CN1XU200XQ5p5aNPlytAA4GSR04c2ew18E+EFfBrFuPv72Fh6YDRekIp4OC+F8/fwWWjbpeO/fZSCgqcbuDZ71c9RIBSzT/eH/I6kUgRLhRlwqk5BqIoHUAY3JBNGVIacR8mWorBvqx0tpcGqKTXZuoqT8oP7x0R9JjilZqhCjdUL+L6RBh4y0uYBfe452mHbPEFIWbocN+O4yEJ7es6lJOvjbtujhXdCEEYaaqDEjEOQFbjFVUPtL5gsjNChUZRmzhZYropOTkaZ5xaouEezJFT7+r3YqIqedermwEldtonJXwgLD9V9Y4juipy4halRsQ/Nxd62wQJmLORjprVHt53zZgemW3FJtdsbMkvJtD3JEGwD6e+7o6/QuUXiryJV2TqxI6K3KbhMYbM4g1WONDG3PKITgzlCf4O0gBCtv8XhMZgloroMtFRgJfW7gMVNY9GrPVDK0fx5vy5C4OIZj4nCuK4VKjurjUfMTwjDL8sMhrCJmNz4JhsU1yoSgiq0eLPFnVTsPSJ8sybe/HDm7O4rnHxQNP4eUg//VU3I5dQhVNoNl04eMQDsF8JgXkrVf2PekNw8Jvj/e9QcWGqVRLuV4D0W9tJe669MWDFvrxgSCy48g8ufmsIHWC31BXEmGuocPuGXsxqxRsvma/TDpYGqL/UlM78SaqX3xLRVDT2coT0gFZHnSA8yQHIDi9gUoepn3gpbUrsugc3LC4UiICpZD3cwLOJJeUWxce1vrtfgN9wBYnKH6hAN4Cf6+uYvngHszHZO2M8P/Tm9bjKQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(66476007)(66446008)(186003)(6486002)(66946007)(4326008)(26005)(76116006)(31696002)(8676002)(2616005)(82960400001)(6506007)(8936002)(6512007)(2906002)(64756008)(53546011)(71200400001)(38070700005)(31686004)(316002)(6636002)(110136005)(54906003)(38100700002)(508600001)(36756003)(5660300002)(122000001)(83380400001)(86362001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDV1T1dGNFQxaWFnbUhlQXY5ZHV5SFMxc1VhOTFObHlaOWFWMWU1VTdDUmp6?=
 =?utf-8?B?dlNuZjZaM2pmVlA0dWMwNHcrRTdXUFh6ajBDQVNsUm5yalB5SzBoVXhrWE5p?=
 =?utf-8?B?L3NuN2tUazZlMmhWVTdsdG1xcThuMDRhS3ZnSjAweWxxdTRNYWFIWHI2UEwz?=
 =?utf-8?B?M2hFRFIybks3MTJ4bG9YRFl6eHBIbTFOYXlneHZibDV6MEszQlNteTVSeS91?=
 =?utf-8?B?VE1PZ0tkTkxLNnc2K20yaUswY0xMZ3R2Q0FTRitxUnJIbWtPd3JYUzFPOHRl?=
 =?utf-8?B?bnZKOUhNOUw3dWhoai9OM0dMN3gxYVNXUkM5YXQ4WE0yeTBZTlQrWkhjY0xz?=
 =?utf-8?B?OERqSHhKOG9zNWpuRUJQc0pBUzFQbjhkbEtkcUNBMTJ0NlpCaWFBWUJSSFFx?=
 =?utf-8?B?WW5kS0NFMGpFTnBSdmh1TU5iNExxTnA0NDM0VkUrVmloVlFQcXpORmRzK01O?=
 =?utf-8?B?VUZFS1FZSmtReXBRNFZUU1BmU3NqckJsODlKWGJHbU11U255QVJURjNCbFBC?=
 =?utf-8?B?dUpNL0UrcVRkbkplQkpvS1I1Z3c0VyszQ3F6bjk5QjducVAwZnlqZW1xTjND?=
 =?utf-8?B?K0F2WkZtNmt6QWgzdVRSYmFwN29BV21zL3pKYmZDVTlnT0F2RlRCUUFKV3BV?=
 =?utf-8?B?OG9OT2lCTk5MMGt6S2ZSVG53MVVUQUtjSWRhbi9uOWxBc3JYR2FYNGQ0YkE4?=
 =?utf-8?B?SG8ybzc4M3k2ZG9pNnpVVit5Vk5HK0lydTdiTDU1UjhDeERoQ0w0b2tBeFB4?=
 =?utf-8?B?OFZoT21OeElnbW5NR2NvekNkRXhSSGw3Q1crK1pPYWJ5eEx0TW83dVJjRUpI?=
 =?utf-8?B?QjErVzVISmNEKy9wWWdlakNnNkpTd1orOGdBZWpvbHA3ZmFyQ0haOWRjRGVL?=
 =?utf-8?B?bFpQSHlDZk9hUU5UNHZkZS9TOTFRbXdycUx3V1hMRGx1TTVmUDBrZHo0M1NM?=
 =?utf-8?B?NlAvSHVZbFUvb1cxSmxUV2JscW1qYysyTVk2UnJjZksxOE13clF6Yk11RUk3?=
 =?utf-8?B?eFVMRHp5NUs5Qmc5TjJid2UrTmlDVi9qMG5BNTMwQlRzVEgxWmRxR1ZldzFU?=
 =?utf-8?B?ZStoSElaUTkxc20rMTBNVTVELzczWEVWL2puK1dJVFhPeS9LcmlyMSt1Wkwz?=
 =?utf-8?B?MkVQZDcxYXAyQlE4c0dxWUNJZ2VCZnJNWGxMdzZneGVCTHRyVlZPQzdZR0do?=
 =?utf-8?B?dmxxblBpaFlVZktTWjFRcjI5V3ZCaUZ2ZkpYZWlocGQ4aFdmeVQ4QWNHQ2ZH?=
 =?utf-8?B?WlJRWGtJZ09XYXRlTlQyWW95VFkwVHNEWDduU2N4eHlHQjltdmFKYndUckFz?=
 =?utf-8?B?a0JHTncxNUhvUHNvQ2hkSWc2REFtdnJKTjhwVHcwUGx1QW9oOUZHdEU3UURy?=
 =?utf-8?B?KzFZdm5RN21UVFRqMGZESEptcTYwN2I2cEpiUDJRMmhqNU1ONE5ZTXVxellD?=
 =?utf-8?B?OG1hZWR2OFcvZi9oUDdQZzNvUXpuZHFEcXVmNlFWSGdyVTlNN0hLNW14M3Ix?=
 =?utf-8?B?NTRRa3drTnJrZkVKTXZtY0ZGeS9rREtBc0FrcTVlU28yYWdZbTJOVk5aWUNC?=
 =?utf-8?B?Vy9KTWg5UUFaeUpLcGZMWEJsU0FFY1RrY3V1L0VkQUZDODhtaUpJbDYvTGRn?=
 =?utf-8?B?MldVSWI1bDJVU3l4WXNXQW9VdjVYcE5OYk5uRWRBV01yN25SSWQrbnJSdUZT?=
 =?utf-8?B?aWdRYS9sY1F3MkovdGNMM1JjSHA1dXhFVnQ2L3d2MVduODVJMDlJVHFmbmJO?=
 =?utf-8?B?UW1Ja09QelQ2ZlArVncyd1o5Y1I1bDAzK2E1dEV4M2JJWGRJNkJZL21TbHVE?=
 =?utf-8?B?bGlNRTlXTUxLK3BEK3d0emEveWhTM2pkU1RmdUI2amtKQ1ZMT1pvM1ZRS0Zt?=
 =?utf-8?B?YXZQWVZQbUpFdDVXVjljbnIzRlZaeUhyTW9RZmRKb3hDM09XMHNBVkxVaWlZ?=
 =?utf-8?B?bTYzZm9VYUJvaTM2STJKRXd2OUFuN3E1SDkxVytjSUF3dDUyekF5a3N3eFN3?=
 =?utf-8?B?bG1sYW9xYWJKL0luUlFlR1NGcjZULzRZZUpmekxiR3dsY3JUa09rNzNaMjhu?=
 =?utf-8?B?TEZCR0RvazFYdytucWFzelJ3RDZSMnlQQ3FxUGxkOWxueFZvWUtnVTZLcWFx?=
 =?utf-8?B?cDJrN3F2dnBOTmtmb2hoQUgyOVhJL3YrMmtPdytTQ09wSVF3SGxjMzhteXhs?=
 =?utf-8?B?Z3VQWTN0TkxucVdNUVJWWHI0K0F0ZzhUaXdlU29aRTYxMmFwU1BXOEFPTGVB?=
 =?utf-8?B?dTB1aE1vYnhVUGhIRVpXN2xJSmdBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECAC67A0F71B7245BB3185CEE23DDC97@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931af6b9-4de3-4bf6-3460-08d9e7d795b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 12:12:16.0523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: //g4w9XD/MAdDem1XcbnSRbWQzCThNoA0gTjpez9TZrfnxPTNgGBEy2w6DCK2VzhaODF55i8he/IckjgNEwiq6JXIjAtA9FsOk3QJb5HGvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5718
X-OriginatorOrg: citrix.com

T24gMDQvMDIvMjAyMiAwODozMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAzLjAyLjIwMjIg
MTk6MTAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBJdCB3YXMgWGVuIDQuMTQgd2hlcmUgQ1BV
SUQgZGF0YSB3YXMgYWRkZWQgdG8gdGhlIG1pZ3JhdGlvbiBzdHJlYW0sIGFuZCA0LjEzDQo+PiB0
aGF0IHdlIG5lZWQgdG8gd29ycnkgYWJvdXQgd2l0aCByZWdhcmRzIHRvIGNvbXBhdGliaWxpdHku
ICBYZW4gNC4xMiBpc24ndA0KPj4gcmVsZXZhbnQuDQo+Pg0KPj4gRXhwYW5kIGFuZCBjb3JyZWN0
IHRoZSBjb21tZW50YXJ5Lg0KPj4NCj4+IEZpeGVzOiAxMTFjOGMzM2E4YTEgKCJ4ODYvY3B1aWQ6
IGRvIG5vdCBleHBhbmQgbWF4IGxlYXZlcyBvbiByZXN0b3JlIikNCj4gQnV0IGRvZXNuJ3QgdGhp
cyBjb21taXQgYW1lbmQgNjg1ZTkyMmQ2ZjMwICgidG9vbHMvbGlieGM6IFJld29yaw0KPiB4Y19j
cHVpZF9hcHBseV9wb2xpY3koKSB0byB1c2Uge2dldCxzZXR9X2NwdV9wb2xpY3koKSIpLCB3aGlj
aCBpcw0KPiB3aGVyZSBERUZfTUFYXyogZGlzYXBwZWFyZWQ/DQoNCk5vLiBBbGwgdGhhdCBoYXBw
ZW5lZCBpbiB0aGF0IGNoYW5nZSB3YXMgdGhhdCB3ZSBzd2l0Y2hlZCB0byB1c2luZw0KDQpjcHVp
ZC5oOjg5OiNkZWZpbmUgQ1BVSURfR1VFU1RfTlJfRVhURF9BTUQNCg0KaW5zdGVhZCwgd2hpY2gg
cmVtYWluZWQgdGhlIHNhbWUgc2l6ZSB1bnRpbCBYZW4gNC4xNSB3aGVuIGU5YjRmZTI2MzY0DQpi
dW1wZWQgaXQuDQoNCj4gV2hpbGUgbG9va2luZyBhdCB0aGlzLCB3YXNuJ3QgUm9nZXIncyBjaGFu
Z2UgaW5jb21wbGV0ZSwgaW4gdGhhdA0KPiBmb3IgSW50ZWwgdGhlIGV4dGVuZGVkIGxlYWYgdXBw
ZXIgYm91bmQgd2FzIDB4ODAwMDAwMDggaW4gNC4xMj8NCg0KQ1BVSURfR1VFU1RfTlJfRVhURF9J
TlRFTCBpcyBzdGlsbCA4LCBzbyB0aGlzIGlzIGFsbCBmaW5lLg0KDQpFdmVuIGlmIGhhcmR3YXJl
IGhhcyBtb3JlLCB3ZSdsbCBzdGlsbCBsaW1pdCB0byA4IG9uIEludGVsLsKgIFRoYXQgc2FpZCwN
CnRvIHRoaXMgZGF0ZSBJbnRlbCBoYXZlbid0IGJ1bXBlZCB0aGUgbGltaXQsIHNvIHdlJ3JlIGFw
cHJvYWNoaW5nIDINCmRlY2FkZXMgd2l0aG91dCBjaGFuZ2UuDQoNClNob3VsZCB0aGlzIGNoYW5n
ZSwgdGhlbiB5ZXMsIHdlJ2QgaGF2ZSBoYXZlIHRvIGFkanVzdCB0aGUgY29tcGF0IHBhdGguDQoN
Cn5BbmRyZXcNCg==

