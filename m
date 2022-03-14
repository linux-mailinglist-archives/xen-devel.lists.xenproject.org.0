Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEDE4D7E1B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 10:05:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290064.491923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTge3-0003aF-PF; Mon, 14 Mar 2022 09:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290064.491923; Mon, 14 Mar 2022 09:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTge3-0003X9-LS; Mon, 14 Mar 2022 09:05:39 +0000
Received: by outflank-mailman (input) for mailman id 290064;
 Mon, 14 Mar 2022 09:05:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=knG6=TZ=citrix.com=prvs=0654505ba=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nTge2-0003X3-9G
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 09:05:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8635898-a375-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 10:05:36 +0100 (CET)
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
X-Inumbo-ID: e8635898-a375-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647248736;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7f3FHybYmBRtMV3SY7h+9wnyt7PDiERXxkmS4Z6l5DE=;
  b=KDWwot4jSpl9yeR3JJKYkLAYPxYCXf3fvnVz4GY1ArljQWV3zpPADzAc
   TBxPlI9uhS5RVVlxIkDuKO/uG4mc6xm5enIJePoBYwCQSZFgfS29E+pPz
   ltfcxJMK0h9u918JiPNPknDhKMe3LMiL7yYxb7zuNA5d+ySi7QvsL14bd
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66554970
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ohbssK79ImKvACswGUMDpQxRtDvHchMFZxGqfqrLsTDasY5as4F+v
 mEZXjvTOfaLa2rwftt0PI6+8hlV7cCBzdVjGwdqqy9gHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPgX1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSVWCE0A7XDmdgGcDkCEQR/BvZ24JD+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQ6uDO
 5tGMVKDajziPidfHWodFK40leX1iECvSy1nk2288P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc/9BNfAH8A6M9rH3w1ybI2k/FQ5ZR+Vz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbv1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4PeRECnCBtJ6sybp1qXHb4
 BA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSL8JNEPumkhex4xWirhRdMOS
 BWP0T69GbcJZCf6BUOJS9/Z5zsWIVjISo2+C6G8gitmaZltbg6XlByClmbLt10BZHMEyPllU
 b/CKJ7EJS9DVcxPkWrnL89AgORD7n1vmgvuqWXTkk3PPUy2PyXOF9/o8TKmM4gE0U9ziF6Mo
 ogFaJfSlUk3vS+XSnC/zLP/5GsidBATLZv3t9ZWZqiEJA9nE3smEPjf3fUqfIkNokifvrygE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:HQya061CXe660Nj+A2xAFQqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhRQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXyOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mOryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idgrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amGazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCR2B9vSyLaU5nlhBgu/DT1NU5DXStuA3Jy9/B96gIm0kyQlCAjtY4idnRpzuNId3AL3Z
 WADk1SrsA8ciYnV9MMOA4/e7rENoXse2O7DIvAGyWvKEk4U0i93qIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.90,180,1643691600"; 
   d="scan'208";a="66554970"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1bVnN9sI5r3xddNXZ0v8fWj24Lcb8W7Fi4kqkBzuyA2KX0yAMNADbSkKjgFRwTnIu8DoZMeNRKyxii4oPpdApIsiOIczJcASLswrQTL3vX6BVH2MT/NDaqIHtkHlkAlDKopI9ufDU3PDctpeZS/v/X6zUe2YU7PlwHOKI2pv/aprckMTUvM1K6hcUsVZ+GmetMATjm7Qh18hgVGOZ+HKkFZ1AQvxB0SLIQQfmrS+zcLk9+ICdu3Mll3Bf5I/eTbJwORyTp2R5dAYUbC8+v+4sK5tY/ay+5Zj6fTrDS5I9N5tF4c6WR6qeaupXlFxxqiuYhMt87Z7lXeFN441g74bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/K3+KEk8psRZATLFl+Eews4VxIIWVr363BhTaQLETI=;
 b=YwZEBzLeiwJnzgMwWJdtchAQI2HI6/PzWtDTLqJDKK4R7R2KwPPcuj+bGJtMbDbIpamrS0Yjj26u2Sf8bgkU0snzVbekPp4/07v/wNin+WAhC0eNjwPIfdi/G/L9sNPNgyLtwmTT8gtmbYsBQ9RQ/6zKaeXnWK7DWbjY60yikQP7VK+sBJTM752W2LF8VMqUxB2OeQvkhNn4l9O5TGS0zshhmtn2+bST/hlZQ/EOcXQuFADQodVIkED7mz1BbLYKceptAYM8fX/VHvqt8+li42cwV5gyJRIH7PXVJag5o3WvOB+YLXrnucEwk/XaNb6zmN3VY4f7WdtZxYXyvUiRXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/K3+KEk8psRZATLFl+Eews4VxIIWVr363BhTaQLETI=;
 b=fHJP6D+RUQ+VbwOOpUvLwSZW7EHUn0seBSiv3lCMbuKsT8DKz3/NKoa3tQozz96liP+SskGr05op01znSaCf58Mf30CwHY3UlZlwwvnE57UNsO9Qu3tggtkMb03+zC86ajUzlflYNfwT6lNv0ZHaAh/mk68qadldq+aoAiAtxWM=
Date: Mon, 14 Mar 2022 10:05:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Message-ID: <Yi8FVxTu/r8cUVt3@Air-de-Roger>
References: <97bebbfa-b5e8-4c57-162f-2a052de92f02@suse.com>
 <Yitd9RNJf1vvOsf4@Air-de-Roger>
 <517b0f83-ba5e-3aaf-9c06-9b7078b816ec@suse.com>
 <Yitlw1EN+egVJ4xD@Air-de-Roger>
 <bdd016c0-b02b-3128-7187-d781b6f88dea@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdd016c0-b02b-3128-7187-d781b6f88dea@suse.com>
X-ClientProxiedBy: MR1P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d22cc07-86bc-475c-3cab-08da0599caad
X-MS-TrafficTypeDiagnostic: BN7PR03MB4356:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB4356C35281C0FC21E49244C98F0F9@BN7PR03MB4356.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2KGfIctbB8tuaO1kamDm6CDn36sGH83ce8Gb0h1XDPGO0jEY5DDJ1TLBPHz0rPHMDzcap8kIa2VeAnEdsbJeruK0KVQtipHmU5chxXA8epid+JPzvIc224aQ7sYjTPsqmZA9KSeCY++993S4welKof6hPWiACXXO9z3dRwIhD4fg6T1XgevoFY7SBdcErpzqsLKK+v0skOzJm0qpe031uY+Z4fCiCEH5iztLQ0WDHvG13omEgGjsba/wuouBNiTOzfdkCaElNp5srMdRABJWS06/KWl4KztsHrmsHEwPIR/8RI6LcbrvvM2Bv4uQ9XK5krGhY5BooT5t+40uoV/yd7bhQr2ZvR7UdZPhzOXsY49xKhoiFArTUzQA3psazmGF3cG7/b9s4spjDNvZYaIAo8SqxSNaJZB/rzjaEUbvVmvKllbxqZ+neKiZ9YLMkLxo2/B/BJzj5mK6fNOAiKPG2X+5YmeKVn/Mzw0bgzaFBdKRdfI3UE+GKy02hNyTsFqZgVQBSB+hYcRvbDN0DJ5dE/wjYukELrFLK/wSk4AsIz5/CCLF5OIs4WX9cpntVcpQNrre7wSB+bkiz1Ec/DnzK0BiGsHiEoNR+nSVh5QT+mHMqxPqrxTPwZ5/Ws6w8ZhqLXuG5gbIuOFPJ3CIinbfTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(33716001)(508600001)(6916009)(2906002)(6486002)(54906003)(53546011)(85182001)(83380400001)(6506007)(26005)(186003)(8676002)(82960400001)(316002)(66946007)(66556008)(5660300002)(66476007)(4326008)(8936002)(6666004)(9686003)(38100700002)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlZQc1Rmc25xMnFQZFA4L3VrQmd2Vy81VTFmR1ZMN1FNbjFEbm1JNmtLUjl5?=
 =?utf-8?B?enQ0SlkrejVjV1J2ODE2L2kzNEViVERiS2tVU3MyUVpaWUp2WE1VTkRSdDVD?=
 =?utf-8?B?VDROQWw5Y3lEVloxWFY4WmlrMlhlSFVRMkw1K0hPVDQ2cXFPOWlXb3FPekhn?=
 =?utf-8?B?L1RySWZCRXBYVUJIbkQ1WXBrcXZSZlo4WTh4Rnh1MWhCVS9BVVBsSTI0dTlP?=
 =?utf-8?B?UzRZa0srSW9zbHQ2OWU3WVUyK0tuYXRhYnkyNUhrWDB2NGxTemt0ditYYUUv?=
 =?utf-8?B?RVBCL0FvNy9rMTBIenJpbXFDZkk3SWpKRGovU052a1RORStNYmYyaDRBU2tE?=
 =?utf-8?B?eE96NENFZ044MDV1a01La1lpajVWWkNrTzdycDZwZitTTWpGQ01XQjdEUTNv?=
 =?utf-8?B?QVRQVXNpc1FEOFhTTWxNSzg1SUFETEFDZVdaMXJSMlA2RjFMWlVFc2lyT3hk?=
 =?utf-8?B?T3FKTzdJNlQrWlZZRWdQV2lqOVpjb0Q4aEFEeTc5dEN0MkhmUmNTTkVXYTNL?=
 =?utf-8?B?L1pQVGVJRG1vWGtSZktPK2FBeHFLMnlxQW1oNjBKNm9STWppeVRwNXhTZUNt?=
 =?utf-8?B?Uy9WdWluUEY2d2JOYks1cTlzYnM2VmJ3d2hFMGd1Nm80K2FkcG5OVkg1aDhk?=
 =?utf-8?B?TDloWjJtQVJwUDFaNnZNME0rSWh3TTZHd1YrTG12czRXMXZoOUxHYytuQTdZ?=
 =?utf-8?B?ZldHVTVyV0NuM2R6SnRBY2J1cTVyV0oxRVJRUnZ2TGRiWmFNdkdmcVF5YXZx?=
 =?utf-8?B?bGRLR3pRZ3A3RVRTYWtKY00ySVZqb0p5SEhrNUFtSnlVZXhwSGRmQ09PWXJT?=
 =?utf-8?B?R1BOOXRWUlVYN1l2blZ0K1duRUdlUVFlSzlSZzd3ZWRaU21GTDZyRUhxT1dD?=
 =?utf-8?B?Rk1pNDFNMnVuT2FUeW1PcE4zMDBBKys5cWlzdDFYWVZOK3d2UjBCZGVFMTVq?=
 =?utf-8?B?bHNRajVBRFZsUENJbXc3OEx5TWJvL0JDeHNlN0dLNVRyQ1lTc1JVbkxieE10?=
 =?utf-8?B?UGdCanZTQmpXenBEQWt3Y1pDUGJTUUNXZXI4bmMzUmtiMjVSTlRhYld1NlpR?=
 =?utf-8?B?VW1WY3FnSWN0eFNDdG5YRFBYdnMwelh6QUtNVllyZmlOTkFmQWF3UFZPMXNu?=
 =?utf-8?B?b2xhZkNKaDVQKy9XRDlrbDU1Wk1lWGJhby9xNjF4SFY3YkdLRXVqZVFQMG55?=
 =?utf-8?B?WHlIdjhadTJPdkg5Z3hNQmh4SlQvYTNKdE5TZVpPSS8yY1VNcFBjQWZyOWpP?=
 =?utf-8?B?c2hQWTAwS255aG1keStpSkJ3QUF4RmhtenE4VEl6TFRJeE8xamg3SmdNL1NZ?=
 =?utf-8?B?akVNeWdyckR6VWNaMVg5NXNVSWRoYWh4RVFrUXIzdWRzYlZNamc1V2hjb3Vu?=
 =?utf-8?B?MG9Ic0NnSkRLNU9VL0N0SGNPdmk5dlZqZ2FCbnk4MzZrMUx5M1Q1SHpxNWdn?=
 =?utf-8?B?UzI1RDBDS0J5bWZrN3hHa25xWjRidGRkWERGWXpZTElSb0craXpaZTUwYlZ3?=
 =?utf-8?B?SktxVUh0eXBMSWtXV3FGQjZuSXJBazZXbWdoMUtBRDhEMW9uQmFpNnFzM0dt?=
 =?utf-8?B?WVdOWHEyNkZTK1RQYzVMSC94Y05ZL05uMTN2NkRoS0I5cHZjWGdBbHloMkp2?=
 =?utf-8?B?RjFsYmVKZlVlZVRNTzE2UGEvR1pZUUt2cGpDZTBTMCtHVjRlQlpJbFN5VHFK?=
 =?utf-8?B?aWZuckt1d29sSkNmUnY2WTZmSU5pdHlHSnZuOHpBbFViWVcwZ201cVZja0Ny?=
 =?utf-8?B?QmJabjNmc1J5cUg1NzJMMXpmY2d4R3A1Q0FrN0VqVHdhU3ZYRGMwUHMybDVR?=
 =?utf-8?B?QWJrOU8xQmplbjZHRTVpNmtFVnQvdGZLdnNtS0pRL1FzRERpVzhlYUlFK1dj?=
 =?utf-8?B?bzFkbWgzRkV1U2pkaCtVa3JIUjAvSUx6eHkveElvRUswYkE0RWdBMGZvNTVs?=
 =?utf-8?B?RzUvbkE1eVM1dTA5aVp1N0pQRUNkaGs2Um45aWNlTVBTbGZjUzc3WFFBakN0?=
 =?utf-8?B?WkN2T3lFTXRBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d22cc07-86bc-475c-3cab-08da0599caad
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 09:05:31.6082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwW2Q3734D7ek3R12O5K9GgaHs6WoHJEO1Foew/onOPEDBnuUJhqnRtlzUq3t9FpGkhi1TMZ5QfcVTsiwiVZzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4356
X-OriginatorOrg: citrix.com

On Mon, Mar 14, 2022 at 08:38:52AM +0100, Jan Beulich wrote:
> On 11.03.2022 16:07, Roger Pau Monné wrote:
> > On Fri, Mar 11, 2022 at 03:55:57PM +0100, Jan Beulich wrote:
> >> On 11.03.2022 15:34, Roger Pau Monné wrote:
> >>> On Fri, Mar 11, 2022 at 02:28:40PM +0100, Jan Beulich wrote:
> >>>> Support for this construct was added in 2.22 only. Avoid the need to
> >>>> introduce logic to probe for linker script capabilities by (ab)using the
> >>>> probe for a command line option having appeared at about the same time.
> >>>>
> >>>> Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> v2: Always define HAVE_LD_SORT_BY_INIT_PRIORITY when using LLVM ld.
> >>>>
> >>>> --- a/xen/arch/x86/arch.mk
> >>>> +++ b/xen/arch/x86/arch.mk
> >>>> @@ -73,6 +73,16 @@ ifeq ($(CONFIG_UBSAN),y)
> >>>>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
> >>>>  endif
> >>>>  
> >>>> +ifeq ($(call success,$(LD) --version | head -n 1 | grep -q "GNU ld"),y)
> >>>
> >>> You are not going to like this, but I think this should live in
> >>> xen/Kconfig together with CC_IS_{GCC,CLANG}, ie: LD_IS_GNU or similar.
> >>>
> >>> It's possible we will need this in the future in other places, so
> >>> having it in Kconfig makes sense.
> >>
> >> Despite me not liking this (until, as said elsewhere, we've properly
> >> settled on either approach) I did actually consider doing like you
> >> suggest. But: I would have to introduce there more than I need here,
> >> just for consistency's sake, and I wouldn't have a way to test the
> >> LLD part of it (I did check - none of the distros where I chose to
> >> install Clang offer the linker). I realize I could ask you to help
> >> with the testing, but then the first point would remain. I'd prefer
> >> if for this simple build fix it was okay to go the old fashioned
> >> route ...
> > 
> > I would be fine with you just introducing LD_IS_GNU. That's all we
> > need so far. We can introduce LD_IS_LLVM if/when required. I prefer
> > that asymmetry rather than doing the detection here.
> 
> Yet I'm not happy to go this route. I'm only willing to do this
> consistently, but that in turn not without us having formally sat down
> and discussed the overall model to use. The only short term alternative
> I see is to go back to SORT() unilaterally, hoping that for now
> different priorities won't be encountered.

Would you be fine if it was a patch of mine that introduces
LD_IS_{GNU,LLVM} to xen/Kconfig (Acked by someone else) and then you
use it here?

I realize this is tricking you, but I would rather get this unblocked
if possible.

While I can agree to test for features in Makefiles closer to the
place where they are used, I don't like doing the version checks in
Makefiles, much less arch-specific ones.

Thanks, Roger.

