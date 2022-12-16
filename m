Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9199164EDF5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 16:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464812.723322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6CfL-0001j4-Op; Fri, 16 Dec 2022 15:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464812.723322; Fri, 16 Dec 2022 15:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6CfL-0001fv-LR; Fri, 16 Dec 2022 15:30:27 +0000
Received: by outflank-mailman (input) for mailman id 464812;
 Fri, 16 Dec 2022 15:30:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Zr/=4O=citrix.com=prvs=342bb51ac=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p6CfK-0001fp-3p
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 15:30:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8de754a5-7d56-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 16:30:24 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Dec 2022 10:30:18 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5783.namprd03.prod.outlook.com (2603:10b6:510:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 15:30:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5880.019; Fri, 16 Dec 2022
 15:30:13 +0000
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
X-Inumbo-ID: 8de754a5-7d56-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671204623;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pwwJEkrFReZPzLzP51LhMk3PJhtYr+RTzrbi7FqpBfA=;
  b=FJHHKqDXfEFRUMM2zGUVfiXNLyBfBDEOoimpdpa/6YEKYbUqOt12QYyM
   T4nLdq4bvmOEZGbalVNaTPJvJokr77pX0O8OMboAW2vZ3mSuRKv8EOFOv
   hVUaxklg6O+mJrTG3vkkEo+qF8dtldyK9sB76xEJ88ji3fLu66SxGzAM5
   s=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 89165806
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5IWFhK9Zi2Q8OhI1+zlWDrUDTH6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jRMDWmPbKuJZ2GnctF2bdyw9UMBvJXVxoBlSQBqrSw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6kV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklrx
 /tGdBZcfymCjr2bkKznGsZ0194seZyD0IM34hmMzBn/JNN/GNXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUvgNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCNNLSuDorqACbFu77EFLUy0weV+BiqOwlVWDco12I
 GUS5X97xUQ13AnxJjXnZDW9qWSBtwQRWPJRFfM78wCHzqfI4wefCXMARzQHY9sj3Oc3QyAn0
 hqGkcPBAT10rKbTR2iQ+7uZtjCuPjBTKnUNDQcUQA1A79T9rYUbihPUUs0lAKOzlsfyGzz73
 3aNtidWr7keiM8j1qOl/EvGiTahupjISAEu4gzdGGmi62tRZoejZsqu6FvG6f9oKIefU0nHv
 X4YlszY5+cLZbmPkyuLSf5LGLip+/eDPTv0hV9pAoln9jKx9nrldodViBlkI0tzM8kDPyHof
 k77uAVN6ZsVN3yvBYdrfZitCMNs0LL7CNDkUNjQb9xTct5wchOK+GdlYkv492XkjFQsnL55N
 dGBdt6hF14bD7hqyHy9QOJ1+bs2zSklg2/eQJnhxBSm+buYeHORD7wCNTOmbOci4eWfpxjH+
 v5eMdeHz1NUV+iWSiXe948eKXgEI2c/Adb9q6R/Zr7dCglrAmcsD7nW27xJRmB+t6Fcl+ON9
 HftXEZdkQP7nSeed1XMbW1/YrTyW5o5tWg8ISEnIVev3T4kfJqr66AcMZAweNHL6dBe8BK9d
 NFdE+3oPxiFYm6vF+g1BXUlkLFfSQ==
IronPort-HdrOrdr: A9a23:TLApKqOEchiqEsBcTjGjsMiBIKoaSvp037BK7S1MoH1uA6ilfq
 WV9sjzuiWatN98Yh8dcLO7Scy9qBHnhP1ICOAqVN/PYOCBggqVxelZhrcKqAeQeREWmNQ86U
 4aSdkYNDXxZ2IK8foT4mODYqkdKA/sytHXuQ/cpU0dPD2Dc8tbnmFE4p7wKDwNeOFBb6BJba
 a01458iBeLX28YVci/DmltZZm/mzWa/KiWGSLvHnQcmXKzsQ8=
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="89165806"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1n/OdYmGyBFbTIBgCVuaWwGZq4dFvguvcFySFXOaV1B1bQ8xSBg76TqFM3CyEf2uKcMMMo25PEF9zT4Fv432FKla/xMnU5RxVjesdap6v4CvZEQQJVZbdyaRRsh/Xhwe+sdFBhTiAprsFwQDdtuQglxJ8ToxrirS3cEjT588vFo2bFo6CuwL7DvS+PYW/YPRvT1gGdE1jOiWic4eMJU22unYrYWZSqRCw6rLuskkqaZ606Ev0uKxmIVUV2aLi2fejd+ju4i0afN0qf/o/P4AkvpILUV+3Dpk14EGCfX5kb5kbL71WLLvai9DErIREqTuQ/LQcjyHJ1qOMua+l6lfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwwJEkrFReZPzLzP51LhMk3PJhtYr+RTzrbi7FqpBfA=;
 b=UhTZTbmvw51ZXqJWmlCsy9274YqjfWasfmRD1cAxpyiCvR/KNy/Z2S7/kW+kiDnctxobLymAPxHFRGVUpnkoj271iRDa/cfyUuxCWgRfMucygK1j59fQJVE9cP50sDw/cX6gEoV8JI9XcD6OWWwQ/HH7yzyl0TsTP4b9yWFuXzMNwUMlCexUwZ2XEtIqgH/CCLVzLx3ye5KpF71c7tUNuUmpCw8DaPnhJa2YBV53+CDzWW8m53dBJWNRU3pjydGo6f4f88Gqi1zrSf3IAtJyyAJA/GYXczBf1betJFuMnlfMRrndmGrT7x7BbhLWykcOKy9ddIEQZoaMqca94vUfNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwwJEkrFReZPzLzP51LhMk3PJhtYr+RTzrbi7FqpBfA=;
 b=wOrqpP4lxFUYAPymZ+ppdtwrV2lwXl3LPG37IXyQQW/DvZOQoMUxd4if6nM4S0vuBLO0bE+eMm9MMylyUL7PkDkRhU4hlCO14Zva3IIj7j5z0y2P4U9a4ZID5Bovr+R5j5aNWAd6Ah2mzYJSXtEkdGUlaVJxvoTD8UbuQmX+GsA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, "Demi M. Obenour"
	<demi@invisiblethingslab.com>, Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
	<rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Matt Roper <matthew.d.roper@intel.com>, Lucas De Marchi
	<lucas.demarchi@intel.com>, =?utf-8?B?Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YQ==?=
	<jose.souza@intel.com>, Daniel Vetter <daniel@ffwll.ch>, the arch/x86
 maintainers <x86@kernel.org>
Subject: Re: [cache coherency bug] i915 and PAT attributes
Thread-Topic: [cache coherency bug] i915 and PAT attributes
Thread-Index: AQHZEWNKBewvTtnrP0qLWzHfxYCD+w==
Date: Fri, 16 Dec 2022 15:30:13 +0000
Message-ID: <1c326e0c-5812-083a-0739-aa20fab3efc4@citrix.com>
References: <Y5Hst0bCxQDTN7lK@mail-itl>
In-Reply-To: <Y5Hst0bCxQDTN7lK@mail-itl>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB5783:EE_
x-ms-office365-filtering-correlation-id: 0c3803b8-67ba-4253-265c-08dadf7a6d3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yKocoAleDd0KJlySRHxDfJahm5GtWcZ9D1QI3ojTWz2MqbMkB8rqzM4pT/GlZl2oza1yTITkbH4N0zoQMHZsjJi7sYHSgKFr0628DBPjUdjYm3LmYluFNXm7UCN+5bQTZl2jYh7IgLwN/eGZjHgTBczmxIcoRmfIpOnBIqwW78NTu1q6V7E7Xt4hJXho97JeoTm667h+Z7wo3OpuAHHSkNNVVminfrPr1VFxwQtDMMGDg6d91WwpUvvXqEQXd6L886XLkDA4VoYNCZvAt59HNV2x+0v/AA1+sea69LyU7ZEYS90/X5olhrdPZ98S+t87qbZtzkeBNUwiuZnzH99jgQVHUeK5cnl938jA5zSfsVrF4+QbbAN+eDlG6lLFlWUUW/P0VrQ0xoyYzKxzdeYJVt0VpXI7rxmC/dZjfia8ZBOw/AXrpSj1sGb8f6ynTlRrhPgCHXSvIpoa55yYPsyYbuLBJT7WO/Io68WrC3t1cTeT5yaE8F/VZxEEtssgOAdZDFjOPf/0YnKauo++njFjy9ptG6aEjDsvvVAVLf3jItstLvy2lmBk/PwkGjIGMo0VTCPvoRDzP/YHH4ZHbhAU7krBClLIlzhk0A38JA9RrSQPs0Jlv10JMUAl/wGAXwwWIVk+IoLiS/765SKZBtqSwlfqMF/lW6suThMzuxc/RP7/JPsNM8lDs9BAyfnCWIrbka8zblkiR90T9lIH3tni71uzTU0Kp8Ae8OIVa4JI6B/CX9X4K1ZVmQV1jlL3D3sVfEWAdPsrLyaZYcExw8RvUPlkjvRY4XtI8Ithl+TPjLTOHEWoDr5NXSJwGbowpD5mnhlutxj/3FyaCWmbVwXPtA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199015)(31686004)(36756003)(186003)(91956017)(26005)(6512007)(66946007)(76116006)(66446008)(478600001)(66476007)(71200400001)(966005)(4326008)(41300700001)(2616005)(6486002)(86362001)(31696002)(64756008)(8676002)(66574015)(5660300002)(2906002)(8936002)(7416002)(122000001)(53546011)(110136005)(6506007)(66556008)(54906003)(316002)(83380400001)(38100700002)(82960400001)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eGNEVUZsVmxiZ3JuQUlLd2ErNWN5TllrNUtDQU9KaUd6U3J3OGRKSlhpWGFO?=
 =?utf-8?B?eU1HSW5pYk9CazBYczB2bjlYNmcvL3IxbHFrdHJBTjBmYzNZUUlmNjVjcjY3?=
 =?utf-8?B?NXNHRG5xS0poTFdDZ0N4KzNma3Y0cSt6M0phZVNMWXg1MGxadDBGakdNNERU?=
 =?utf-8?B?V2dOZWtzNTIyQXV2dzVnSDJqTUMxNE13UGh1MVdmTlpMY0tNUmVZSHZuSmZM?=
 =?utf-8?B?UHR4QUNjWVlLNW5oTFEyNjRWMjI1MktJM3JzUHJGeUJWZ3poL2ZKV0YwZVZY?=
 =?utf-8?B?alFGRkRwdEtZSU5sY0U2RG9SNGlhS25MMDFKblVtVmhyK1MzTEhoSnpFTG5I?=
 =?utf-8?B?NlNqNHZReGRnQzVYWS8xMkVTK1NENmdORlcwb3JZR0pWd1A0bjkvb3lLY3da?=
 =?utf-8?B?eFNsRXZUMHdtVTRrOUV4R29OSmxnL3hKakdqV0ZWNU93aENBVFlibkc0TTFS?=
 =?utf-8?B?VklCTm1wZTIwZzBEZXdQU0RLTTBOc0dabjdrTFBRUFRCNk9TdHRXZWZIN3h3?=
 =?utf-8?B?V0MzdFJURU9nZnRNSWx0aHN2Wmd1bVZrdVM5ekc1em5YcEFUSFJ2QTJlbFNl?=
 =?utf-8?B?MTR4emFrK0xldGExVTZVYy9ON2lPVmh3MFB4Ym05K2NXU2ZoejNZNDlFeE9o?=
 =?utf-8?B?aWpXZ1FDcExyTGFzQjAyQ0JYVDNSbXZGbUs2Uzc2VldYS29JN3kvTTRwcFVB?=
 =?utf-8?B?aWhkYVN3S2VDQUh3VHpsUWg1eE4rYkd1dzZGblhRd2xxbks3c3N2NlFYRUZ1?=
 =?utf-8?B?aE5UMGgrVFp2b0Z6QllycE5LVDdNYVVaTmR6c2gzT05zWlc5TTYwLzlXQ0Vs?=
 =?utf-8?B?dXkrWjhwQU8zOGxVNHY5Z2Voa2FBMXNMN290RG9ScGNkU1ZvL3F1cVZlMVBk?=
 =?utf-8?B?ZmhIZStRVkVxNlZZdmg2VWpIc0Z4R2xCVVZrWjVTOW90RFYzZ3lJRW9SMFpQ?=
 =?utf-8?B?cWVicng1cTZnZWlWODJVbGh4cVVTSXpCdkVKMm1TWS96cjZHUTN0bEVzZU8v?=
 =?utf-8?B?ZFN2bkh2aVNHNmxRRFdCK1JBb3NjaStBSnNZcnpiclhrQ0FSNWE0ZjJjTDFn?=
 =?utf-8?B?dnBmVTFLQU05TXFTcXFTbFBEM2NyaWdON1pIdnRGcHh0bTJmRkVOaENONGp0?=
 =?utf-8?B?clhsMHQvRHl1MnZVK0t5bGVwOXlyNm4zRmtoaENmSHNHcEY4Q1pNSUlrYUYy?=
 =?utf-8?B?TDJiMjl0TDl1eE1ZRXBFOFp0WUhsaU5GUHp5TFVGaUJQZk05Ykh5Y0Y3VEU1?=
 =?utf-8?B?b2V0L0FGMjE2aW95TzdDanM2Y0JMdWJuK1o0YVo2K01ncFJKcGNXUzdhb3B0?=
 =?utf-8?B?YnFneDRIVjhLWjNwL1prcHZneHp3YkR6aEhtU2sxQ2d4MU53OElPZDVxVTI2?=
 =?utf-8?B?M3RKVXNUQjNsZFk3U2RHTWJzVlRLUTF5bEwvL2paK3RTcVRENStaZ1gwSkRv?=
 =?utf-8?B?RVpBTGZEMjhJdmxZQ21rT252WXBiUytwQ2pObUhHYnBCeC9KL2ppYk5YeXhX?=
 =?utf-8?B?SjRKYWoraDJvQ1JYcm9nL3lHK2RFa2N0NFBvU2paUmVPdERLQmJ5dStqWU5a?=
 =?utf-8?B?SFVBWXY0UzBzcTBPbGh4TVZWSGRwMWZSQWdQSnFCSi9meGlON2tkOXZCVlcw?=
 =?utf-8?B?RjZ3QmFUSmU3R0NtamZWdTV4eWhDMGIwL1I1eWcxNGtRUVk1cTVnUjhITzJZ?=
 =?utf-8?B?akp3dk1DUHRIV2x3aFlDbTlJdUg2Z2JydmtZSUI5M0hOZ1hvUmU0Wi9KNHYz?=
 =?utf-8?B?TnRNSXJpRS9rV1p5Wlh2Qy9jazk0bnVQUnZZM2ZXK29wS3poVmF1OEFielVt?=
 =?utf-8?B?aXFrb2M1UUtVN1JXNUFpZ0RjZWkxVTYyL21VYTk4dDR1WXRHRncvRklMS3Av?=
 =?utf-8?B?RmxLWEt0ZDYwQlhaOW5GTDFGWEtkZHdaaGJVMDFlRVFhVHMrTWN1cDRGbTZ3?=
 =?utf-8?B?ZFFXQU5HbnRRVmlpaHN3QURZbmd5WENla3pkTHc0WHRrUGJTU0tKR2ZSTDM4?=
 =?utf-8?B?R3N3RkJicDVscEpnSlFUbGYyYVpIbzFCTE1lQVVjdGdhS0hYcjNRRnh1QUdk?=
 =?utf-8?B?RlV3Mk5NaUJVRk9pVkgwbjFqUVJOYUtBK2JhTU00RTR4dThTM2IwdzdGYmpX?=
 =?utf-8?B?ZWJQTWIveE5VWjVBa1N0TDdqcGZXTDBtN0Zqa3c4ZFIrZUQwNjQ3WDIrek5n?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FB0DF6B138B9A4F8BD3397C646403F8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3803b8-67ba-4253-265c-08dadf7a6d3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 15:30:13.7318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CX2s9UdkbF+OLDho9P73nOrfOOcb/Wvt4IVUpNtqy3+9tjrusU9n6bBsqna7zt8Afq7/CKimB6RG5aLEpp9ejbk43xFxCbhz7zKwYcRlp/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5783

T24gMDgvMTIvMjAyMiAxOjU1IHBtLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6
DQo+IEhpLA0KPg0KPiBUaGVyZSBpcyBhbiBpc3N1ZSB3aXRoIGk5MTUgb24gWGVuIFBWIChkb20w
KS4gVGhlIGVuZCByZXN1bHQgaXMgYSBsb3Qgb2YNCj4gZ2xpdGNoZXMsIGxpa2UgaGVyZTogaHR0
cHM6Ly9vcGVucWEucXViZXMtb3Mub3JnL3Rlc3RzLzU0NzQ4I3N0ZXAvc3RhcnR1cC84DQo+ICh0
aGlzIG9uZSBpcyBvbiBBREwsIExpbnV4IDYuMS1yYzcgYXMgYSBYZW4gUFYgZG9tMCkuIEl0J3Mg
dXNpbmcgWG9yZw0KPiB3aXRoICJtb2Rlc2V0dGluZyIgZHJpdmVyLg0KPg0KPiBBZnRlciBzb21l
IGl0ZXJhdGlvbnMgb2YgZGVidWdnaW5nLCB3ZSBuYXJyb3dlZCBpdCBkb3duIHRvIGk5MTUgaGFu
ZGxpbmcNCj4gY2FjaGluZy4gVGhlIG1haW4gZGlmZmVyZW5jZSBpcyB0aGF0IFBBVCBpcyBzZXR1
cCBkaWZmZXJlbnRseSBvbiBYZW4gUFYNCj4gdGhhbiBvbiBuYXRpdmUgTGludXguIE5vcm1hbGx5
LCBMaW51eCBkb2VzIGhhdmUgYXBwcm9wcmlhdGUgYWJzdHJhY3Rpb24NCj4gZm9yIHRoYXQsIGJ1
dCBhcHBhcmVudGx5IHNvbWV0aGluZyByZWxhdGVkIHRvIGk5MTUgZG9lc24ndCBwbGF5IHdlbGwN
Cj4gd2l0aCBpdC4gVGhlIHNwZWNpZmljIGRpZmZlcmVuY2UgaXM6DQo+IG5hdGl2ZSBsaW51eDoN
Cj4geDg2L1BBVDogQ29uZmlndXJhdGlvbiBbMC03XTogV0IgIFdDICBVQy0gVUMgIFdCICBXUCAg
VUMtIFdUDQo+IHhlbiBwdjoNCj4geDg2L1BBVDogQ29uZmlndXJhdGlvbiBbMC03XTogV0IgIFdU
ICBVQy0gVUMgIFdDICBXUCAgVUMgIFVDDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB+fiAgICAgICAgICB+fiAgICAgIH5+ICB+fg0KPg0KPiBUaGUgc3BlY2lmaWMgaW1wYWN0
IGRlcGVuZHMgb24ga2VybmVsIHZlcnNpb24gYW5kIHRoZSBoYXJkd2FyZS4gVGhlIG1vc3QNCj4g
c2V2ZXJlIGlzc3VlcyBJIHNlZSBvbiA+PUFETCwgYnV0IHNvbWUgb2xkZXIgaGFyZHdhcmUgaXMg
YWZmZWN0ZWQgdG9vIC0NCj4gc29tZXRpbWVzIG9ubHkgaWYgY29tcG9zaXRpb24gaXMgZGlzYWJs
ZWQgaW4gdGhlIHdpbmRvdyBtYW5hZ2VyLg0KPiBTb21lIG1vcmUgaW5mb3JtYXRpb24gaXMgY29s
bGVjdGVkIGF0DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9RdWJlc09TL3F1YmVzLWlzc3Vlcy9pc3N1
ZXMvNDc4MiAoYW5kIGZldyBsaW5rZWQNCj4gZHVwbGljYXRlcy4uLikuDQo+DQo+IEtpbmQtb2Yg
cmVsYXRlZCBjb21taXQgaXMgaGVyZToNCj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xp
bnV4L2NvbW1pdC9iZGQ4YjZjOTgyMzljYWQgKCJkcm0vaTkxNToNCj4gcmVwbGFjZSBYODZfRkVB
VFVSRV9QQVQgd2l0aCBwYXRfZW5hYmxlZCgpIikgLSBpdCBpcyB0aGUgcGxhY2Ugd2hlcmUNCj4g
aTkxNSBleHBsaWNpdGx5IGNoZWNrcyBmb3IgUEFUIHN1cHBvcnQsIHNvIEknbSBjYy1pbmcgcGVv
cGxlIG1lbnRpb25lZA0KPiB0aGVyZSB0b28uDQo+DQo+IEFueSBpZGVhcz8NCj4NCj4gVGhlIGlz
c3VlIGNhbiBiZSBlYXNpbHkgcmVwcm9kdWNlZCB3aXRob3V0IFhlbiB0b28sIGJ5IGFkanVzdGlu
ZyBQQVQgaW4NCj4gTGludXg6DQo+IC0tLS0tODwtLS0tLQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94
ODYvbW0vcGF0L21lbXR5cGUuYyBiL2FyY2gveDg2L21tL3BhdC9tZW10eXBlLmMNCj4gaW5kZXgg
NjZhMjA5ZjdlYjg2Li4zMTlhYjYwYzhkOGMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L21tL3Bh
dC9tZW10eXBlLmMNCj4gKysrIGIvYXJjaC94ODYvbW0vcGF0L21lbXR5cGUuYw0KPiBAQCAtNDAw
LDggKzQwMCw4IEBAIHZvaWQgcGF0X2luaXQodm9pZCkNCj4gIAkJICogVGhlIHJlc2VydmVkIHNs
b3RzIGFyZSB1bnVzZWQsIGJ1dCBtYXBwZWQgdG8gdGhlaXINCj4gIAkJICogY29ycmVzcG9uZGlu
ZyB0eXBlcyBpbiB0aGUgcHJlc2VuY2Ugb2YgUEFUIGVycmF0YS4NCj4gIAkJICovDQo+IC0JCXBh
dCA9IFBBVCgwLCBXQikgfCBQQVQoMSwgV0MpIHwgUEFUKDIsIFVDX01JTlVTKSB8IFBBVCgzLCBV
QykgfA0KPiAtCQkgICAgICBQQVQoNCwgV0IpIHwgUEFUKDUsIFdQKSB8IFBBVCg2LCBVQ19NSU5V
UykgfCBQQVQoNywgV1QpOw0KPiArCQlwYXQgPSBQQVQoMCwgV0IpIHwgUEFUKDEsIFdUKSB8IFBB
VCgyLCBVQ19NSU5VUykgfCBQQVQoMywgVUMpIHwNCj4gKwkJICAgICAgUEFUKDQsIFdDKSB8IFBB
VCg1LCBXUCkgfCBQQVQoNiwgVUMpICAgICAgIHwgUEFUKDcsIFVDKTsNCj4gIAl9DQo+ICANCj4g
IAlpZiAoIXBhdF9icF9pbml0aWFsaXplZCkgew0KPiAtLS0tLTg8LS0tLS0NCj4NCg0KSGVsbG8s
IGNhbiBhbnlvbmUgaGVscCBwbGVhc2U/DQoNCkludGVsJ3MgQ0kgaGFzIHRha2VuIHRoaXMgcmVw
cm9kdWNlciBvZiB0aGUgYnVnLCBhbmQgY29uZmlybWVkIHRoZQ0KcmVncmVzc2lvbi7CoA0KaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvaW50ZWwtZ2Z4L1k1SHN0MGJDeFFEVE43bEtAbWFpbC1pdGwv
VC8jbTQ0ODBjMTVhMGQxMTdkY2U2MjEwNTYyZWI1NDI4NzVlNzU3NjQ3ZmINCg0KV2UncmUgcmVh
c29uYWJseSBjb25maWRlbnQgdGhhdCBpdCBpcyBhbiBpOTE1IGJ1ZyAoZ2l2ZW4gdGhlIHJlcHJv
IHdpdGgNCm5vIFhlbiBpbiB0aGUgbWl4KSwgYnV0IHdlJ3JlIG91dCBvZiBhbnkgZnVydGhlciBp
ZGVhcy4NCg0KVGhhbmtzLA0KDQp+QW5kcmV3DQo=

