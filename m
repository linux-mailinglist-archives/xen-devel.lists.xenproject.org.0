Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678B05146CC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 12:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317175.536387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNtw-0002p9-MC; Fri, 29 Apr 2022 10:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317175.536387; Fri, 29 Apr 2022 10:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNtw-0002mS-HO; Fri, 29 Apr 2022 10:31:04 +0000
Received: by outflank-mailman (input) for mailman id 317175;
 Fri, 29 Apr 2022 10:31:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHQo=VH=citrix.com=prvs=11116ec15=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nkNtv-0002mI-3L
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 10:31:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 758b9ed7-c7a7-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 12:31:00 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 06:30:57 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BY5PR03MB5202.namprd03.prod.outlook.com (2603:10b6:a03:220::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 10:30:54 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 10:30:54 +0000
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
X-Inumbo-ID: 758b9ed7-c7a7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651228260;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=PgjE1s4K8ADDAB0sRXajJd/m9wMCDG44D/TvRHrN3lY=;
  b=JXWSNQc66yjiNeGjOGtADfMlhrRqnYbmzmlfT4rwLa8iKjjTI5VV9b3e
   Ebcv2ukbz/0rxbIITS+wIVizuGfoE4D8um2kndDiLtA4/48UHRCh2TpKa
   cNScFA2ciCHpuBGaqAFM6ANS+jEyvnyp+KinOeS8s+euVR5O06Vv95ibW
   4=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 70219840
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ErFHU67Y4xAfzphC8KrZngxRtA3GchMFZxGqfqrLsTDasY5as4F+v
 mQfCD/Xb63fNjT3KI9/bYzn8k9XuJDWnYM3TAE4qy8yHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YTjUlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSMVAgJIfLRvtgwDT9JLgVbPoF/9YPYdC3XXcy7lyUqclPK6tA3VgQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfibo4YHh1/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IA8gvE9fZvi4TV5Alv6IPzHPrxQPrQQpVXukPJ+
 j3v1l2sV3n2M/Tak1Jp6EmEgfTUgS7gRMcbGLi58NZ6jVuL3GsRBRYKE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSHPc98xql0bfP7kCSAW1sZhxrZcEitcQ2bSc3z
 VLPlNTsbRRlt6eUUjSa7auOqi2pOjk9KnULbisJCwAC5rHeTJobixvOSpNvFfCzh9isQzXom
 WnV9245mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 xDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:k3Tw8KDK9LQt4cjlHej+sseALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPEfP+UwssQIb6K290ci7MD7hHPtOgLX5Uo3SJTUPNgGTXflfBOfZsl/d8k7Fh6JgPM
 VbAtND4bTLZDAQ56ubkWqF+r0bsb26GdWT9IHjJgBWPGZXgs9bnmJEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue7267OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLhCM0llWjrqi+quGRieerN/b8yPT97Q+czzpAUb4RG4FqegpF5N1Hpmxa1+
 Uk6C1QQ/ibo0mhAV1d5yGdnTUJFF0VmiffIZjyuwq7nSWxfkNFN+NRwY1eaRfX8EwmoZV117
 9KxXuQs95NAQrHhzmV3amAa/hGrDvCnZMZq59ks5Wfa/ptVJZB6YgEuE9FGpYJGyz3rIghDe
 l1FcnZoPJba0mTYXzVtnRmhIXEZAV5Ij6WBkwZ/sCF2Tlfm350i0Me2cwEh38FsJYwUYNN6e
 jIOrlh0OkmdL5dUYttQOMaBcenAG3ERhzBdGqUPFT8DakCf3bAsYT+7rk57PyjPJYI0Jwxkp
 LcV04wjx97R2v+TcmVmJFb+BHER2uwGTzr18FF/pB8/qbxQbL6WBfzPGzGU/HQ1sn3LverK8
 pbYqgmcsMLBVGearp04w==
X-IronPort-AV: E=Sophos;i="5.91,298,1647316800"; 
   d="scan'208";a="70219840"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocQSFPZjQCXIqcDto1YuPQ2IECsabOm3TjqvGPJL+ddCcvnzvpPVAsRJUk0PlwJJTYJTqa9GG9K2Z2k6hAApO2zxzizydcEduCj1QS9LgBpRAXVyY07uyUoJXM/eYKAwJIq2pTl0UFHVG8DGyYj8obPp+Cdq/WzilNSfjUNYHjZCMa6/jjgq2S+naXuHq1MmzoxZ2snoxv7ZtIVj1cqQ81KtwdYdxKIuAkvcCLIugrATkZeOY1Q5ohMh7oB75hUKtRbv42raOCjueHnXYE4JnWApEbGVvEIklqeBmRBmVp+wxR9lMlLXKtzgKA+OAaHMLAh+azcSvfk2LGPZ9EWxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59j5mz3u8ZF0PqWfok6mKKzC3zhHwI576gux0R3uzmE=;
 b=QI1B9wihTjO4HNRmYznzyTshjEyFNEB3m+4df7MxDWfivTXIOZXfZAVxRuNK3sOyYH/jJAT5rRaC8taY8mPyPeI2cHze7fAURa7FoyAB73HikytvXIcBMQPeRHlKR1cTl+kBxHtnzO8cQ0FlME8aBbNH+sitzLdxUkM8udzHzcMG8TAwuAzFuRRvqIKrKxHp3ulRZ415pWOtvfzgrAYiFDkif7dI5WP2xLUejCpv6rP4sdPVO3Xdh/6JXE/C9wBVXcm+LnV8aUPARWrFgiYj4vIkkK5YSARwZQzryT9vLXfxGDGbK+4Jq3nUn4wcRER1r8HrNNXCaQ1MjfrSreWZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59j5mz3u8ZF0PqWfok6mKKzC3zhHwI576gux0R3uzmE=;
 b=UEK+zURLFAFMUC8vnbrjhi8Fx+hYLCYcOf4SowZ9dhAOnsS1QFS2hXuNBJlIY2HHQXElfXSqtcWDkGdRIZxjNMfq6VU0kmo5fFCreRABuRNvtStbm/svLeFfvMg25Z5PsMLX8+gqmxfMf9l5+XpDq9l+Jl/NxmNNHtcO3a9FM4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 29 Apr 2022 12:30:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: osstest service owner <osstest-admin@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [xen-unstable test] 169819: regressions - FAIL
Message-ID: <Ymu+WnVjTANHk+na@Air-de-Roger>
References: <osstest-169819-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <osstest-169819-mainreport@xen.org>
X-ClientProxiedBy: LO4P123CA0347.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12a2ae01-0281-412c-6ea4-08da29cb572c
X-MS-TrafficTypeDiagnostic: BY5PR03MB5202:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<BY5PR03MB520200750D0344EA1E547E8F8FFC9@BY5PR03MB5202.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iwEm3ndKTlTk3XnoTf1BABuidrGLg9rwMyeJR6FnRWg26vYZr/DcqKCC8b8BHyXccvcLyoJAmUD/AoePsUw9sK5CKz8glovazd23xlH3LUic967BivjKcE16ZJ5D3IcfUOWIuUWKgkfFoXgomiSCy8O9e20UHSP6dnKcCxfOcKHZVTLYI6RGDJWxaODYT0hVm0AduU8bqOpioPwKHnKYR6nZBgRxbfGbUhaajFd58i6PSKADPaOC30YPSsurgHaR83Atp9UiWH0hPY1Uj3piZGo8gE/RQLo/6SfeqZAOklaJ4PIqgPUgqK1ulVBT2FFu1Z9P3XPlsQA9TlvgGhmnOUjM/qIx1Szcs5Msx6kj0eWaZVbwEts6ffiO2AeqAG+MKUWAlSd5doT6sMQlDWAU58ZHUcCJhVYs7WkT7ZJECkQsxLSmGVJBI4W4Okk4RAPHVsh9PxhHLpPcZHaqsqgGPMuwRfWSXKtmmq5jVu5wKPQtUzqLN1902NfB2/cNDmybTdjkjktzXxJrK0xBz6KuDBBqKtaPctQJxFpbanikVV99RgickrSVHK4jB5u03+zbnYwamFC8cLRkP+LLDPwgZkdKaFW4mXEOYvUJmSA7+NWbtNuhPUIn3lyRf+izJ8Q7drEuXp7gzWTQEb4ikdQr469yi2ShwJ1i6zIUhvBb+6aNNVuguxd0SuK8jgdtG5SGNT2jO0CQQ0xfLssMgLLtdm/z7j+YL/rLUSzmoiy7RfM1OY8/NqOWp/cyXpLwJx37zah0KXCh2yHOM4OgiQLpxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(9686003)(54906003)(6512007)(6916009)(86362001)(966005)(316002)(83380400001)(508600001)(6486002)(6506007)(6666004)(26005)(33716001)(4326008)(66946007)(85182001)(66556008)(66476007)(38100700002)(8676002)(2906002)(82960400001)(5660300002)(186003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akMxRE9UaWw5cHAzU0s3WFYwWkxGcmFxZ0dYWHozaUVyZEx5RERURnIwZ0VZ?=
 =?utf-8?B?VVIxWkVLOXRWNFQzVmdBMUo2SzJBaklLcmtrYTZnZlM1d0tRS3ZIb0syaWJh?=
 =?utf-8?B?OUlDbVZPcytwQi9JbVFaQ2VMd0gxV2NocDN4dUJyRW9OV1VZSmN2emtjaGNK?=
 =?utf-8?B?d1lGY3F0NU1aK0lnVEl6eHdxUTd3S1doRS91azlaSmhGbTlQc2p0dkdmQ1R2?=
 =?utf-8?B?UVpSdXV4aUl0VzhmdEFNZWUyTVNEK2FyTi9TWklkWjhpUVV1Wi9IZjZJQ3By?=
 =?utf-8?B?cVp5WHlsRllLTWRuaVdYUXV2dmJjOGVnWkhabmhqQWkrb1VCSFNpS2dFdktS?=
 =?utf-8?B?cHhoVE5Fa0I2blJVRGlCQW5pSkxvaEtDRURIME1PaDJnU1hmTG00SnRoVE8y?=
 =?utf-8?B?Mm5pZXF2KzFFZGc5MjA5NGxFYUhFTVdsL29idDlsME9UWWpENTJYY2NpcVlT?=
 =?utf-8?B?UkZRa256dHlEeGUwd09qdTU2RW9GS3ZkZWpiVi92c0xvVmhVR3hIcGg2V05S?=
 =?utf-8?B?T0FaY0VtZndRejh5K1ZuR0FFU0lVTjdTSXp6TEZuby9Semd5YnVNbzltbU15?=
 =?utf-8?B?KzNjbE1SSU1uOWsvazk2bFJqR1hUNDFHOHU0RGgrTlhnNjBINXUyU1ErMzZo?=
 =?utf-8?B?UlVvWjZUM2dkT29kUTAzWmlkd2ErN2VPdUplSXhWUklnRzhPSGZIMXVnT2V0?=
 =?utf-8?B?UEtkRkdHRk9LMmU3Smp3elVQQy83bXVSZjhmbHRkV2pHUDNsR0FXUHRnOUg2?=
 =?utf-8?B?V0ppWTA5MGJCMGdHRGRvWGd0RmxMMkQ0SXBaVXNIZi9kMXRteVN1TmsrcEpz?=
 =?utf-8?B?dDRtR3dvWVM5WTNEU0xKRlMyS0c2UGFuNVYvOHVwR1JxVUhrZkEvaGpoRVVX?=
 =?utf-8?B?OElpVVU5ZWE4SFB3WVlESUJ6THZuMlFrNnNnSVA5a1VhSjRUVXZYTUJKcEtD?=
 =?utf-8?B?ZEMwbG1IOFJtb1VZTEVuYlo3aFhEeVR4cit6NTZMT0FEUzJRNWlpUHVjU3RI?=
 =?utf-8?B?dHhoMEZvTnVOK3ZvS25xTWtkbVlxMFYvTEh3dEZVV0ZhemtmTWl0anFRM0Zz?=
 =?utf-8?B?RUxPZVJSdko0bTIwMzFVOC9jSXFhakVjRmNCMDdSSlZnelJUbkx3R1I5V1c4?=
 =?utf-8?B?V3h5dEF6OFMzNGJSOXBRVjcvVUh0UnVWK0hTemVUQzMvZXM1VzZoU3NBVXkr?=
 =?utf-8?B?YnVMZUE0cTcrRmUwTkd0cWdEU3IrQnNNWTVPREMvZFBhQUZIRTR5aU1nOWho?=
 =?utf-8?B?d0ZpeXJqdGFvMkYwQzVJU3ltUm1hVjUxRDBsckJlNmh5aEI2eHptYnVYZk5G?=
 =?utf-8?B?N2dUT1N5TEhmWHhDR0RncHB3Tm05SXZJb1NucU0wZ1R1bk5weGUwOEh3eU5o?=
 =?utf-8?B?Wi9pWGE2Rkx5MG1mOThEY1NHWmxNdTNQSkFXTWluZWhPL1VobVphVDRTQmcr?=
 =?utf-8?B?c3d6OG1Bd0VDc3cwcHEyVUtzVDNycFA5eVlDeHNIMzF0dlZncFZTM0VSTXNG?=
 =?utf-8?B?VkM0RkJOSHVXZ0hENnlWaG1hdjFIVnUvcndxaDk3RnpPMUZ5ODd3L3RhUEdK?=
 =?utf-8?B?UUpPYnExMWxlWDhyUFpnOVRLSG5qN3BFZUJEK2JsclZPUmhlc1RGZHJrVzV3?=
 =?utf-8?B?RVlBWVZQNDF3VjRkWTRGd0xIMG42S3N5Yk03QVgzd1g3ZG9pWERwOEQ1MVYv?=
 =?utf-8?B?WlpwOCtET3lXcTIzeTI4bVV2dlBvUzJWMGlqb0ZsVWJqa1FoT01rM0NmSXFh?=
 =?utf-8?B?emE5dVBvR3FLeFBZNkdhbTNJVUxFZ0g3R3h3aFBZSlRDUzAvM3I0dmZOQWc2?=
 =?utf-8?B?UWw4ODBaU2FtQUlOMHpYMGJweE9hQWQ0VW9HcmM0ZXZXdVBzQ0o1OE95RFd3?=
 =?utf-8?B?d24yODVVUFFyVTBWVi9IbzhjdEpRYlUrTmFiL2M3SjdDODJieUJmT3NBRUY5?=
 =?utf-8?B?L1V1WXJ6L0NiTlg2Y01kMWNjaDl2bEVjVEJQMDVBQ04vc0F0WS9iOHBYL21o?=
 =?utf-8?B?cjFtVXQwTitOd000MDEzT0cvRG1kaTVPS3N2b0NYeTk0R2toZUlucDBvemRV?=
 =?utf-8?B?RE5TU3dlL2pIUkJNYlFIbmhSOEdvZU5SQjVneVNlMkJxdmVyNngyOXViNmJF?=
 =?utf-8?B?dWhraFZ2bUxZem43YzAyVXhNRkFuSlZIeFJqSk5Lek9GQTJ1d0JIaHBWZVFj?=
 =?utf-8?B?dWFMRGVYd1J4S2pzbjdaY1VQbTRBZWRhempDVFZOaVk2c0VnZm82VXA1ZTNw?=
 =?utf-8?B?THFyWmlhWGxKWWN2Z2xBeStROGIrdDhVditKUHNQd2lGWEZxTWFlLzM3OStC?=
 =?utf-8?B?V0ozNnlNaHVTU3A0RWtkRjJWem9GU2Z5TmRCaUZpS3E0SUJhNE1iNENuazhw?=
 =?utf-8?Q?7OdV0RkCouqTzwGc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a2ae01-0281-412c-6ea4-08da29cb572c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 10:30:54.5224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFdo1WXgPaUxUB/ODVQ1fr4w1McLY4XOngfe+YODoLV3phH2HLb0A4Rkby6IBqQ0YIUgxf2Y+U9EtLa/+PLBJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5202

On Fri, Apr 29, 2022 at 07:46:47AM +0000, osstest service owner wrote:
> flight 169819 xen-unstable real [real]
> flight 169843 xen-unstable real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/169819/
> http://logs.test-lab.xenproject.org/osstest/logs/169843/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-examine      8 reboot                   fail REGR. vs. 169775
>  test-arm64-arm64-libvirt-xsm  8 xen-boot                 fail REGR. vs. 169775
>  test-arm64-arm64-libvirt-raw  8 xen-boot                 fail REGR. vs. 169775
>  test-arm64-arm64-xl-credit1   8 xen-boot                 fail REGR. vs. 169775
>  test-arm64-arm64-xl-thunderx  8 xen-boot                 fail REGR. vs. 169775
>  test-arm64-arm64-xl           8 xen-boot                 fail REGR. vs. 169775
> 
> Tests which are failing intermittently (not blocking):
>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail pass in 169843-retest

Looked into this one, and it's slightly concerning, guest seems to be
stuck at installation:

Select and install software  [  481.093857] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[  509.093865] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[  545.093820] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[  573.093809] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[  609.093855] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[  637.093836] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[  673.093957] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[  701.093854] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[  733.093805] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[  761.093817] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[  797.093898] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[  825.093863] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[  861.093865] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[  889.093945] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[  925.093974] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[  953.093925] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[  985.093832] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1013.093855] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1049.094031] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 1077.093860] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 1113.093938] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1141.093803] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1177.094051] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 1205.093805] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 1237.093955] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 1265.094004] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 1301.093835] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1329.094039] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1365.093883] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 1393.094167] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1429.093857] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1457.093900] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 1489.094026] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1517.093997] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1553.093996] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1581.094064] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1617.094076] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 1645.093882] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 1681.093896] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1709.094022] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1741.093870] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1769.093854] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1805.094017] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 1833.093837] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 1869.094043] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1897.094101] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1933.093879] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 1961.093933] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 1997.093952] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2025.093925] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 2057.093895] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2085.094172] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2121.094018] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2149.094021] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2185.093931] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 2213.093864] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 2249.093951] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2277.093899] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2309.094054] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2337.093956] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2373.094111] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 2401.094132] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 2437.094064] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2465.094003] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2501.093959] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 2529.094050] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2561.094027] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 2589.094061] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 2625.093999] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2653.093956] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2689.094024] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2717.094093] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2753.093913] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 2781.094095] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 2813.093959] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2841.094117] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2877.094041] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2905.094009] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 2941.093893] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 2969.094085] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [ksoftirqd/1:17]
[ 3005.094061] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 3033.093917] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]
[ 3065.094060] watchdog: BUG: soft lockup - CPU#1 stuck for 22s! [ksoftirqd/1:17]

debina1 is one of the boxes I've put into production recently.

Full logs at:

http://logs.test-lab.xenproject.org/osstest/logs/169819/test-amd64-amd64-xl-qemut-debianhvm-i386-xsm/info.html

Thanks, Roger.

