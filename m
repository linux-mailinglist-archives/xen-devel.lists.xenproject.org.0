Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FEF526659
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 17:40:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328597.551657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npXOo-0002zv-Ac; Fri, 13 May 2022 15:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328597.551657; Fri, 13 May 2022 15:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npXOo-0002wO-4v; Fri, 13 May 2022 15:40:14 +0000
Received: by outflank-mailman (input) for mailman id 328597;
 Fri, 13 May 2022 15:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0acU=VV=citrix.com=prvs=12587a88a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1npXOm-0002wI-Oe
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 15:40:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7c39fb7-d2d2-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 17:40:10 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2022 11:40:07 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN6PR03MB3584.namprd03.prod.outlook.com (2603:10b6:805:42::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 13 May
 2022 15:40:03 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.016; Fri, 13 May 2022
 15:40:03 +0000
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
X-Inumbo-ID: f7c39fb7-d2d2-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652456410;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qyX5QQ1dlZwnJT6EKaQ0Vs0xLPXfzV4ortBuXyg3zXU=;
  b=LakAEEsJ2WpCcKYbTtpZNuoIUHeKfb93ofQOO6tHKYZs+0vAQ3tRykCk
   VBM9Z4GkSK3CbwRTXzpcgY/jvkH6Mj0V9MF7bCXCav7+ZhRZlkuAUpIi4
   cSqFB70oc1ldDJiqdPNlsG0L3G+5SPvh8U4XmR6OpUeq6p/z2dDnehggi
   Q=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 71666640
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sXnuDK2cLaFwMpM06/bD5aZwkn2cJEfYwER7XKvMYLTBsI5bp2MCy
 WIdDTyCOa3cYmSgKNEjaNzno0hSsMfWmoA2GwBtpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMx2oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /11uoyAaR0THJTAxvsYVzBqUAZeF7xJreqvzXiX6aR/zmXgWl61mbBLMxtzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B86dBfmWjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SChLWMG9Ar9Sawf53fL009ciJbUHOWFcISpTpRFoUe4q
 TeTl4j+KlRAXDCF8hKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGS0SvHtUhv+p2SL1iPwQPJVGuw+rQSSkKzd5l/DAnBeFmIdLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:6LipdaOZeviyM8BcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.91,223,1647316800"; 
   d="scan'208";a="71666640"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0KtStMaymITWg7PoJLpjP3iicMRmRVrBI/KNOCE9I0PSi4goaaG/tZE55BZXG6IncaGfKMq1xtavdnW6wUBqzOBMt0Hzy4dXavZRg2LzTqi9nJDO42zK4OYnWOquh/EVH9Gk43jHZ97CgyitEEqYdMMpmsez3dK8zjkTJjgZCFoR+nJIIP0OXgzfIhTziZS9AV6A7nXS3kW+ilQIa4jifx9N3X+2CETwPFV15r3wfBQAZf4a9GYWfCzsVe+PJXluUrOSOs1nthMAtVzq3abVy2RYYxM7GLgV4XF00iUwI8HcRiuiBFjzViGUBS+y9HIO2J2Q7aCin9p6HK4ZE9Pnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwyRRLHFwC9ItfPVSVYVGnUiB7/gbhJ57y1bXrCevHk=;
 b=JIfsOmcOHiqifTaKRv9S4+M75e3bdmobiCWJ4Q0r9uov8dWrKkoKyom86LRyy8qQKjRPAvsNTvD5Hu7L0t1iHkWSjI+6rMsN0qmwH8dq1g5HGv4tcsQc05ETwH5YEQH9IYTuWYD6E8Sy2LOd/iqoMYz2Urv017gXAn8KDl+7oKAOXtyoDlZWNxec+nbJ/qhcs5eAPTySbHYVA1Lr5er5mv/aUy7tmErTM6/37zRWvgRS2chLAf1iQJM3WmVHJY4cX2uwDbjYObtxp+N+IVzxMT6gmMQI3z9UlxeM/ykMuvzkkNwEFqddM27/CnQ68K60win6GIkPXp3Dcmxjhhhkig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwyRRLHFwC9ItfPVSVYVGnUiB7/gbhJ57y1bXrCevHk=;
 b=ddhz0k1s8u4pRR6T2t4iehaopDYJmjz2Xh+ALWKYpofFpnk7ovpOea7YAFiOcsllNMqPIukdh4nduPZK8JIzPyXdtosFb3J4oQjzsOEvxq3oHOlEwl81nr9K046WXGFa5E76dQLMhSWcbPy9EcKP2ebzr18z2eYQSO2ufidtO30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 May 2022 17:39:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/hvm: Widen condition for is_hvm_pv_evtchn_vcpu()
Message-ID: <Yn57zsIVGfM8s4Ld@Air-de-Roger>
References: <20220511151423.20241-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220511151423.20241-1-jane.malalane@citrix.com>
X-ClientProxiedBy: MR1P264CA0072.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7092ee2b-4555-4d58-5d05-08da34f6d8a3
X-MS-TrafficTypeDiagnostic: SN6PR03MB3584:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR03MB3584B72CA52A7EAD287CB3828FCA9@SN6PR03MB3584.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nsQo2eIoHtZft0nEImXDP87VP3Q6OB0vysVNsUPRy1gHWAXDEnL8P4IXljpg81bXhkd5tnTcml1A6Qm0fqvZAOMoN5RdP6VcFsV8FLVQChavpMVVo+x9P17BjxvJfb+qwKPBB1rAiSY7EA8k2DObo2B8ZjEj+8+MMUatMkptPLkVxvgy3yJH+WUurhJWQz/uvk2CSP73ys1qZjs6wBLHHyu1y4vWo9Xxi9cuy1azfLKt/C1wddhJbnKkJQK1BAeVQphZKvn2jK/P6FufB2Dg5H7TcYB2CofdNdAdBZn5FQN06lQSsEJQ6pHqVxYdKC2jNPXqHdPckyv4QA4yLrKKBghIVks1I886eu/iqWXwj7iUHN44He2SfZnKD5vWOY05VMcvzF7lhPG2V9lnOd3f+oIHm/qHqNTgQ3adbXn4i1eveXU+eBuySlOQ16qD8xdHtzoBGPYO+kzFu/Hs8NbCUKUbPXVf4hpXZEki3UKaQbEDgG62CErF7aw9rTt9/QdWH1N2KS8y4M/7lzF7PB1EC5ynlf+ezlfbtchnvKqESZhLjVCgahPtR0jUXYZ82rGZIvN+eCHwLe3Iq5WkxUy7Y8f0Mc8g1mXrytoKXaynDS7EQmhzxvwcFHyoXbq5gLmj29FJ7HNEh/DgJiFnAIP2rw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(38100700002)(66476007)(6486002)(508600001)(85182001)(186003)(33716001)(5660300002)(2906002)(6636002)(9686003)(26005)(8676002)(6862004)(316002)(4326008)(8936002)(66556008)(66946007)(86362001)(6512007)(6666004)(82960400001)(54906003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDhUQ3hpQ2JPcGFZYVNxL0dtczg4UHJmRFNIYWg3OWJ2bVdrOVRwRlFPUVZP?=
 =?utf-8?B?Y0xHNlZqR2c0YjFUb2szVHhObEhOUnBOQW9Ed0NXeUYvOUFjeVNzNDFVL3M5?=
 =?utf-8?B?T1FQTzdsSjNOVmNFMExuV0lEWENzSGpBZlVBZzdqYTUxUi9BM1Y0Ny9QK3Qz?=
 =?utf-8?B?VklPVS9YT21aZ0VZU3RIL2d1UzB4V29zYmFBNDBtTnZYTjlGWUFmM3F2Zmls?=
 =?utf-8?B?cTJRWG1WWDBRK2hDWmh3TUZZZksrMWJ0SkpHOFdxM0dDektHRnVMVHU0TW1n?=
 =?utf-8?B?NlFlMHRLVVNPbzhSaDFKV3EvbnFqZVVyMTc2UmVLcy9IdExCbGdoRjdNVnR1?=
 =?utf-8?B?dldJRTRQVnhPa3RqQlNPcXFNSjlPdjRWenR5L1dQZmJzVHRoR1lNWEIwTVI1?=
 =?utf-8?B?Qm5NOERRcXc0NUF1T3JkTVhRRldiMmpTZ1VqVGpMeTBlcCthV2JCdEZvRDZC?=
 =?utf-8?B?VEcwNERLUENIamw0VGRWU0hOS0pmUHJabUU2dlRNMEJtRmc0VkgwMmxvSStN?=
 =?utf-8?B?dlN1ZWFvVHlOanZQRFNyUHg1OXFDOVMrREhqMTB1Q1R4MnVSR2pkTldWd2VH?=
 =?utf-8?B?Zkd1YWdLZ3RKWVpRZXBVUkdRNlpNMEhKUlhPdnUxSzZHN21OVXUya2FkMmc5?=
 =?utf-8?B?T3d3WGl2Tk5EeTh2S3ViM2lVMUN5SW9NdUQ2TWlOcmt3ano2YVU2RExiY2k4?=
 =?utf-8?B?Rkd3WVVia0xIS2dGSGljTUdoM1NaaEs0SUJEcVNBdUdNbEZoOUFwcUdTa2gy?=
 =?utf-8?B?UGZWV0ltbGlBZ1JJSEk3QkhoWlZoN3ExQjlzdW81UmJ5bHU5YWFSa2ZOWHY3?=
 =?utf-8?B?K05WL01DbkJQaCtsNm1FWW1pTVd0K1k1aElZMUY1TXhIS29GVkxKcWNZeFlo?=
 =?utf-8?B?UTRJK3ZjRUN3RFlFc1NPY1NhTFg1RlM1cEFBV3FqTnllSEhna01wMG5hSXdn?=
 =?utf-8?B?bDF2dUxwWG9BbmdycHQ4M09SeHFrVEp3RWZ2WC9pMzZEOWNPUVA5ZFJnSzBU?=
 =?utf-8?B?NDBTS2NuNEdDbjNKanlhUk56T3NOR0w1bmVGN0hXbStuUVBVQ0NUbGkwdGxY?=
 =?utf-8?B?L3A1WXlmT3NJS2ZaVVg3Ym1uQlpUZzByNVEzOEYrdm5UaW9lYWxteGVOazFR?=
 =?utf-8?B?Qm94QWY5TWRLNyszM1BiZDBYbEhrUHNScytoVVNJa1RLVWRldkpzYVVwNTJN?=
 =?utf-8?B?N2ROY1M4cnNLaWRVeHd5RVIvK3I4R3J1aTl3d0VubTdSUWZISisvNklKd2pn?=
 =?utf-8?B?aDEzM0xqNmtuczM5RS9MM2gyQTFDNHlVQUxSckZrakpuUnNZZldSTUh3UG1W?=
 =?utf-8?B?TVBQeXVzYjlzVVYrUW1JOXowcFE2blg1RVNycDJRS0laZTBPWC92UGVaRUVD?=
 =?utf-8?B?TVBjSUFCeTJRd1E4YmxlT0lqdXloLytPOFdOTTl6QU0xVU92aGphU2owWExK?=
 =?utf-8?B?SXVGKzRlRkh3MjFOTFVwN0RKSG42aDVpeTdyRjZJWHB4RjBQQVpZWllhWXY4?=
 =?utf-8?B?a1kzTjRaMU5KOFNkbUd6SDRNRXZzY3dtankrWjVSNUs2Z2ZQdSt1UW9xQ2pB?=
 =?utf-8?B?bGpNbERtWG1ENmRsUGR4UDdselNGVE5yUzZPaWkwUWFRZUx3d0JHZXg1eE45?=
 =?utf-8?B?VVRRRmFpUnZlRW9BWXBDTFJ1Q0pGVVdIWldzcmxjbzZ1RXJ5NFN0TysreVF4?=
 =?utf-8?B?QzR6TjY1S2tZWlBqU2FLcGszZDk3eDRQWnM5MGk0U2I2RjFhcThUeS9MUllO?=
 =?utf-8?B?ZysvYUZ4U3JzektjU0V3VC9xZ2tySEhjWllVc1YrY1ZDdjd6enVpUkZ0eDV2?=
 =?utf-8?B?K0pheGpRZFZvK2JwNkNWRzM2Y0NlNzcwM0lQM2pZWjJ3SVRPYmdwK3lYcFNQ?=
 =?utf-8?B?VkpKdmI4aVlGUHhnRkI2V0NlRkpyeldFaWVDaC9hQTN6aGNxaXNTVFZPMEF1?=
 =?utf-8?B?Yzd3TU1MRjB4dEpIWDdVTE1CR1pkZlpWYTcyaHpRTlhQQklDMUtOKzdBY0Ux?=
 =?utf-8?B?T05IVGJFUmpSaDdGMHMwaTFqMUxrL3h4b2VtOXUrYzV2dXlEZ2VTUmVXZDN3?=
 =?utf-8?B?ZXc1R2FwNDBGQmRObld2STBSYXFzY0hDWDcySFJKUDJVYXdmd3JQQVFlZE5T?=
 =?utf-8?B?RUJkZXY3VmkwK0JHdlFrYnZqM3VZSGh0U3hIR2kwUStyZXBIdE83bDliQTls?=
 =?utf-8?B?L0tsN0xKRUV6UkhvcHJENmJKNmtFZk95YXQwNmZ1aHdZSUU3SStVK1FhNzI4?=
 =?utf-8?B?QzgvaFpKV2h4bXQyWDBkNkdONFE4emdUZ3BwWi94aW1VeU9UaDlsVDdib1dy?=
 =?utf-8?B?bnQzaGVaVTBQcEtzeE5lUkV1aVBoZUZWZ0Rndml1b2ZHUFNYalhmZi9JT3pJ?=
 =?utf-8?Q?TXSFrWv26B5fzIbc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7092ee2b-4555-4d58-5d05-08da34f6d8a3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 15:40:02.9405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TxiGytqfXKKGTAd61srRl3SQJ++EuA3BH2Sm9wjbw7mseR/4IjoYjOtW0R4zMKU/DkNATCBeqSpto/Zo9r2/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3584

On Wed, May 11, 2022 at 04:14:23PM +0100, Jane Malalane wrote:
> Have is_hvm_pv_evtchn_vcpu() return true for vector callbacks for
> evtchn delivery set up on a per-vCPU basis via
> HVMOP_set_evtchn_upcall_vector.
> 
> is_hvm_pv_evtchn_vcpu() returning true is a condition for setting up
> physical IRQ to event channel mappings.

I would add something like:

The naming of the CPUID bit is a bit generic about upcall support
being available.  That's done so that the define name doesn't get
overly long like XEN_HVM_CPUID_UPCALL_VECTOR_SUPPORTS_PIRQ or some
such.

Guests that don't care about physical interrupts routed over event
channels can just test for the availability of the hypercall directly
(HVMOP_set_evtchn_upcall_vector) without checking the CPUID bit.

> 
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/include/asm/domain.h   | 8 +++++++-
>  xen/arch/x86/traps.c                | 3 +++
>  xen/include/public/arch-x86/cpuid.h | 2 ++
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 35898d725f..f044e0a492 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -14,8 +14,14 @@
>  
>  #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
>  
> +/*
> + * Set to true if either the global vector-type callback or per-vCPU
> + * LAPIC vectors are used. Assume all vCPUs will use

I think you should remove LAPIC here.  There's no such thing as 'LAPIC
vectors', it's just that the old mechanism was bypassing the lapic
EOI.

> + * HVMOP_set_evtchn_upcall_vector as long as the initial vCPU does.
> + */
>  #define is_hvm_pv_evtchn_domain(d) (is_hvm_domain(d) && \
> -        (d)->arch.hvm.irq->callback_via_type == HVMIRQ_callback_vector)
> +        ((d)->arch.hvm.irq->callback_via_type == HVMIRQ_callback_vector || \
> +         (d)->vcpu[0]->arch.hvm.evtchn_upcall_vector))
>  #define is_hvm_pv_evtchn_vcpu(v) (is_hvm_pv_evtchn_domain(v->domain))
>  #define is_domain_direct_mapped(d) ((void)(d), 0)
>  
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 25bffe47d7..2c51faab2c 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1152,6 +1152,9 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>          res->a |= XEN_HVM_CPUID_DOMID_PRESENT;
>          res->c = d->domain_id;
>  
> +        /* Per-vCPU event channel upcalls are implemented. */

... are implemented and work correctly with PIRQs routed over event
channels.

> +        res->a |= XEN_HVM_CPUID_UPCALL_VECTOR;
> +
>          break;
>  
>      case 5: /* PV-specific parameters */
> diff --git a/xen/include/public/arch-x86/cpuid.h b/xen/include/public/arch-x86/cpuid.h
> index f2b2b3632c..1760e2c405 100644
> --- a/xen/include/public/arch-x86/cpuid.h
> +++ b/xen/include/public/arch-x86/cpuid.h
> @@ -109,6 +109,8 @@
>   * field from 8 to 15 bits, allowing to target APIC IDs up 32768.
>   */
>  #define XEN_HVM_CPUID_EXT_DEST_ID      (1u << 5)
> +/* Per-vCPU event channel upcalls. */

I would maybe expand the message to:

"Per-vCPU event channel upcalls work correctly with physical IRQs bound
to event channels."

Thanks, Roger.

