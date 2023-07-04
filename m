Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 340EE746E0E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 11:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558215.872107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcmR-00061O-FG; Tue, 04 Jul 2023 09:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558215.872107; Tue, 04 Jul 2023 09:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcmR-0005yS-Aj; Tue, 04 Jul 2023 09:57:07 +0000
Received: by outflank-mailman (input) for mailman id 558215;
 Tue, 04 Jul 2023 09:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bK4X=CW=citrix.com=prvs=5424eaebb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qGcmQ-0005yM-In
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 09:57:06 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 204443a4-1a51-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 11:57:04 +0200 (CEST)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2023 05:57:02 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ2PR03MB7525.namprd03.prod.outlook.com (2603:10b6:a03:566::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 09:57:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 09:56:59 +0000
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
X-Inumbo-ID: 204443a4-1a51-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688464624;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=U8ZjVsaGXtSV+cvAFoZC7DnUTy09AzEfXrMVBYtc9vU=;
  b=IdTBIo9pPpMv5n9uSwycHsDe6APqvvMFEfmkyqSvD15GWnUjCExh5VQi
   5vT8vTuJVBsVhotY+fDZxdL24OroppGEmoJj93NNZ2/jSRYt6T/JWFoD0
   k9iB4mVPEw90BfTIksUFqwuZSy353Ip3QzYgzzo67JIJxhtNlR7rbsRuj
   s=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 113811165
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DzLbqqkZJMRESW3PjKG0g+no5gypJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKCD+Fbq2Pa2vyL91yPY2woR8G7JPcyoJiQAZr/C40QiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5AOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dsfGBsiMhKdvd6Vm4OqcdVwmeZ/a9a+aevzulk4pd3YJdAPZMmZBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVklI3jOmF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHirAdtLSuDQGvhCuECr2mUfGhsqcUK4j8norGisBY1fN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml06fR/kOVC3YJShZHb9opstJwQiYlv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRt3jX4iIQ6jxaKS8k5Fqew14fxAWuon
 2HMqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgDpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:EDRZOqnKqXOUqnHR06aTy4DCkAzpDfI93DAbv31ZSRFFG/Fw9v
 rPoB1/73SftN9/YgBCpTn+AtjjfZqxz/NICOoqXItKPjOIhILAFugL0WKI+VPd8kPFmtK13J
 0QFpRDNA==
X-Talos-CUID: 9a23:0YcFem/sicwiwxsniLmVv2kTKusKLn/D9kvzeH6pMlp1V5/JDkDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ALmFsgQ84JUZxpTmG0MjmDxOQf/9127inBFILrbE?=
 =?us-ascii?q?fuOe0ZApWKWnCjCviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,180,1684814400"; 
   d="scan'208";a="113811165"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPReMC9TC8rTNAQPjWq/BMGOzqor6SYsGqPYu6IdJHK8KOzHKNZyUX5flBa2+W15RmTrl9PikuuRf7w0S3zI7dwfdLZ0f6UhKXX2CeJW2sKqtWax1OFjkHsAcTrw+mYVitfWpftNh/Ywy8KWSaWV9nt5j9abdce5uwJYOXciJkTlRSLIjt3IbiXT2+qxeFPpcLUXyh9XXOL3Xg864h2iEqPSbPVnlsvdtkgULjsl6hp9A+uNLw29TFYEABPM2br7+Tu1B4P8nKNT0LoEzRI3TdSG8vwVfrNLrqLISEp2orwLEOthgPKvxYfJbBIhlRXf76/0lOF2NzdCg7gSE+AqnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73s0z9K7VLPa8Uyp+Lbp6tEDaXxy79OKqbEz+XfK2UQ=;
 b=kGbmrfpV+FKPAGgFapQYyWHOtxdKvAOXpsLa5E43pgi9i9FflI+hk8XVFvS9qvYOyNnvSrZ9fFwnMGWwE6I8ElNickv80WXoklv61G6+LL9upAriCCimJzKTajm1kAaWxEb/f4vNGQgNyAHaas13sgTLTfLRRns13/ujHlu6ew4llaqeveppAbgzz6+mR6hUQGVZQ8xzS0Ly/vEXwZDqNCr8AUuq7/YM4Kg7aqT8JXUBD2mpl+dd8HooAAOWu2muIX0ZUMgqzOmwd060Xeu2d0yiUsNq/rOwQ842CcprgazMPYs6r+xZzVtdm7w0eFFYH8V1beBdO54QmzoX/gYSRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73s0z9K7VLPa8Uyp+Lbp6tEDaXxy79OKqbEz+XfK2UQ=;
 b=vR362JJfIaKw6GvEPCMc6LAzJzYfmhR8WfydISz3SMm4UTmiDOSQsjXi/VLPdlQcTGHuRKsNFrOxQKu3lT4jSFUEAZfFQf+JDKHPHJPAmlPQiEwp0pXMcg6odeBqWMjcUmB5YvDsMj1XnN29MqDjy2puvmM+/McGMDz6QflTurs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Jul 2023 11:56:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, qemu-devel@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: Re: QEMU assert (was: [xen-unstable test] 181558: regressions - FAIL)
Message-ID: <ZKPs5r3wen4PymqX@MacBook-Air-de-Roger.local>
References: <osstest-181558-mainreport@xen.org>
 <ZJwoK50FcnTSfFZ8@MacBook-Air-de-Roger.local>
 <947da45d-f336-4034-bf51-fb190420506b@perard>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <947da45d-f336-4034-bf51-fb190420506b@perard>
X-ClientProxiedBy: LO4P265CA0192.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ2PR03MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b866fd3-80ff-448c-4539-08db7c750257
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o+8Yr2RnKx1Tl7rf89PtPgTR6qNqQf22rOgs/+hR0JgdJTJTNcqBP65LSFShg9em7w9ag88JKQh43LDmSbNg96BYjSzB5y6TnTfgJg3KnryUh1QfrlpENCl691FSfMvdEBiNVol37K0uqAvh4/ojMUo+edjMpRUr2Iirhw7oxEBIUTvEfrD3AnyOGlP90NR227eevB5CC3gBWajUwcfW1uQkwjSEUbJYEytubxoZSMZp/L+eQB+CUgnI7JoIyY0F6j15GNmmYec9Shz2kBek7jj3tvINglB67MNPiOMW9hsjSBFA5pLymZZyG0p4pka6jdtlRTA/YYzmI6DS8cj7Pb9f88P1ITRfhrBPkiPLK5Tf0JGvYnoDAfqzL4cjHrjD1d5hoOiJWPfdi5hdwNHdDh7H0NXEuRBxCgLMqvJQkQtXNxfTnCsS67A47kHBATpeqx+asK2FM2UoDe1yPxNed3Zj1IohRabrCKo9FQ5dcfoO88qIdFavrzjq0MHz2dHReHEcz04rXOdISsQPyIsQe4fYjvMOc2P1gEvWP0sI4z4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199021)(41300700001)(6486002)(6666004)(38100700002)(26005)(82960400001)(83380400001)(186003)(6506007)(9686003)(966005)(6512007)(86362001)(478600001)(85182001)(2906002)(316002)(66476007)(4326008)(66946007)(66556008)(8936002)(8676002)(6636002)(6862004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2VaaXJYbEZlQ2ExTVdleVZOTFNOSmltNW8rWXVmRmNIaXhUUmcvN0NjYmdQ?=
 =?utf-8?B?MU40YzBtL2ZiVWYyVU9JMS9qS1dSb0NiZlE2MTVXaTV6V3dMNGxnaStpbDBi?=
 =?utf-8?B?M3NmaWc1L3EyM0tqTTI5TkU4Z1ZOcVM0dE0yVkJBc1hoQkZidkJwMzVsS1NJ?=
 =?utf-8?B?QXloYk0zL3J5RWxBVG5QRk11UVozMkpiZzFpYmIrT3U4UUxRMElhME9SSGUx?=
 =?utf-8?B?dWR2Q2dRVmJyK3lvL1BiUHlhUVdTRVpJWFJHbzlFeE14L2ZXZk9UZk5wSWRs?=
 =?utf-8?B?Mk51bmQ5cHIyVExkMitaTU03L3g4SjlnQlpwQTh2R2FuYTdzQ2tFeEtwdE9q?=
 =?utf-8?B?azZHS3NTeFlnWm1SZWFZY3p4T1pIMW13QXpvS2RDQXkrTTRFL1dEaCs3eDE2?=
 =?utf-8?B?T1RMbU1naUxCSkczUUIxajVPMzQvbXJuMW9uaDhoZlBaU0QzYjF4U29xZk5P?=
 =?utf-8?B?MlBQb2dJa2FCVDAwZnFwZmdRMk5Ockw3SjZJbXpmY1ZDOS9hcmRiMVdoTUhr?=
 =?utf-8?B?R3lJL25BTlZ5aTBLUjNoQ0pRT0x0aGRnOUpPeVRNSUsvN0x4MHVrenhHQlp1?=
 =?utf-8?B?YXlYcEgzekZoRElsTWt4TTVlYU1Ld0psY1FyV1o3ZWRydGNTM2tDRlhVRmRI?=
 =?utf-8?B?Y3Z4dGQxTzNZTmlTRTUybjVibE9LSnZrSW5Ba21sYW5XcEZUUURzSUl1Mzli?=
 =?utf-8?B?MXVkK21jMkxucnpEa3FBdk1YdWxMYWh2QS9sUE9QMXRFSUVqeGY2aHdYczNz?=
 =?utf-8?B?a3g4cnZaU0Y4NDY2MUFVeUxnZnc5R1RkclRjVzRSSmRVcVpvTzk3QkloUW45?=
 =?utf-8?B?elVqV3R3ZHoycFNaYjMvYWJVTmRROTFzSWlmcnRZTnZYOUlXNFRsVVN1NnBz?=
 =?utf-8?B?bnRhcGpZQ0hLU3prdzhiSG1xUURmWUhOcUw5MnhiQ1Z3VlUxNEVsZGVKTmow?=
 =?utf-8?B?bDRIODFtdCtxY1ZsVjF6OGlNbUVLeE1KMCtlODBDNDN5MnZaWWJiOWtBRVln?=
 =?utf-8?B?dDczZ1p3K1RGVHFYM1U4Y3lNay9La2VpcWpOc0xZQTF2K2NXdmxJcjhSbXpK?=
 =?utf-8?B?Z3o0V2lPY3dZWTA0b0oxRFdKcFcwMkZ1d25YYjc3QzlvMU0rSmJYYkR1TTlV?=
 =?utf-8?B?bWZLZjhEV0ZvV0FWTDN4RjVFQjZuZUtDK2ZpZitDS1ArazZSUE4rQk56ekxo?=
 =?utf-8?B?S2hzYnpTb1ROTHF1V3gxRDJkZ3MrelQ3YjMvQjZHVHZ2U2FWbVBkRGdRYmpi?=
 =?utf-8?B?MjhjaWhwKzc1N0VMUmRJd3FPdW5xNmlocHZqZVBVM3RiRzFlNGdhejk3TUta?=
 =?utf-8?B?RlE1T1RwaVdrdFB3MENXU3hpb1djdUY4NWlXS2QrcElubzVhMlkybnBHYWtu?=
 =?utf-8?B?VEZPemZCcE1NN3RrNWlHcncvNWNDNGlDajFaTUQxMENWLzF6T0xGWGZiS0VS?=
 =?utf-8?B?c0VjcjQ1RXBwaWlONkdadFpmbGwwTERBbGtVRCtFZUp3eXVHMklnSjVRaGU2?=
 =?utf-8?B?OHJZQytTckE5cE9CdkUvNjBpbzJJaHNmN2hIMWZ0d1phOFZSTExTWDhteTJx?=
 =?utf-8?B?MmMvc1ZPdXlBY0FscEpTY1c4a0JoT051eWVKY2grckE0MCtZUUxyNEdVb0Yw?=
 =?utf-8?B?c2pLNmVwUDNHdTNSNy84OThoKzE5dVJoaG4wdEpKWGVkNldlME9aemp1ZDJT?=
 =?utf-8?B?RVdhTGZaR3VWU0U3NURiSzN4bS9kckJneitSdzJWVnhTdmxCQUFPY0QxNklI?=
 =?utf-8?B?T0tjbTJYU2p1bEhrcUVvL3VqUWc1T3gxSUU0bFdlQWFLK0xqRGFpMHZUZ3Mv?=
 =?utf-8?B?eUFyUWs5VzE5VVZ0Y1dVMlhrODNPQ3BPV2M2SVhjOHRzSXI5MlpvY3R1c1FV?=
 =?utf-8?B?YytEQkxvR3RoSWFTeVYyaHRkN09wNHZjQ1hmSVVUaFdNd3JNeDVHdTNIOEQ0?=
 =?utf-8?B?TXR5cko1WkVZbml5MXQwVnE1Mm9LeGpTLzV3NFZzeVVNSmVPd1J2eS9LNHp2?=
 =?utf-8?B?d1VvWjdMZXFnSVVRTXFOSGpJZEJZZy9aK0RsVlBweTM4ekhwUm5ma2tQc3F2?=
 =?utf-8?B?Z3ZPZW0xZTlSK0ZjTUdmMWp1UHdCeEIvQ2lYRjZKT3RpWXMxeEtEa01ETjJM?=
 =?utf-8?Q?VMIzYEaurlhfhl/3J7uRWTHBl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dC0ip8Q94KcRwFOMbeM0myalosUHLYKONxmy3Oib5oyLk3ePj8qWvDq+eOsoXs0xYLJIJ8A3vJ48nnGCbiwhWDFEFOp9Ex0+8t9KRwIzfrSIW942azZaHxCZfc4QJE9zL9anhGzIKIIiLpoQ4v3uHXbpiKuR7/ZybDQlEU7pvkMz3Q5Q2yaLZ4bGVv+diiSf8gB0YqiKeJiTaGMG6M4rut/eQHVtxa8s0e+DBQe4nmYarXa/02iVj6/AAhVdCvg5v9G0rV+QVDWStUtIH6b5ZyijAqEdDjp3pLpqllMcmNtRgNKR6JhlUxjqjKod3VH0qT+C6liCs2CEW2G88tVbF2khhTL9rx6zkQ5AIcgGvATqBAmPs7V1GUxOKQJa2q41tLKFIVXBk2O8hYfsR5J406QTbScdAoA4MHEFbe51KJZAAQGmWMflRcIfjf8lcol88d57/hSCR0b7fIjunMKDPc+dRLNrok8kH+wWxrJ6aiZlBn/6ZGJm2+QuyvPpRDhvQxgMMdL54YVVW0q+OWaZAI05tJOSO8QxnLrWkw5DwPRSeMAno8T2Lu1TjeuIO2CqUmp6pSIJwyJ3UOcT7hgLUd50wTEqnIwWNKliL7jJbvvPSNOt1VuQMQ716qL3zvh7hcCSPfECD2+uvRxxhaGuhsqYA0nWPS+CuPJrowC5kOq+AkIWUJ+6uF4QsVXqASDuYCarUs9CEmm6eWxclgDASl3xEZ9mo2CmkevXe5dOpKzAdXdPVIgDdLEMhL9eiKoXNVRuCx15QaM2t8Yc6qAed3smv3qEqYXHi/QqdleY2Fk6mGIwhxDkLKPzZ3Y+oeB8uhC0jszW9aLnOlgOcsDLCA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b866fd3-80ff-448c-4539-08db7c750257
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 09:56:59.6823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pB8n+i5z6//g6H1OailAKN7JNo+XO9XdqcZHznzIcn3YqKoOEchWrXSbMHmYS7SX442x7HDqNZconzzFyab3mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7525

On Tue, Jul 04, 2023 at 10:37:38AM +0100, Anthony PERARD wrote:
> On Wed, Jun 28, 2023 at 02:31:39PM +0200, Roger Pau Monné wrote:
> > On Fri, Jun 23, 2023 at 03:04:21PM +0000, osstest service owner wrote:
> > > flight 181558 xen-unstable real [real]
> > > http://logs.test-lab.xenproject.org/osstest/logs/181558/
> > > 
> > > Regressions :-(
> > > 
> > > Tests which did not succeed and are blocking,
> > > including tests which could not be run:
> > >  test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 181545
> > 
> > The test failing here is hitting the assert in qemu_cond_signal() as
> > called by worker_thread():
> > 
> > #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> > #1  0x00007ffff740b535 in __GI_abort () at abort.c:79
> > #2  0x00007ffff740b40f in __assert_fail_base (fmt=0x7ffff756cef0 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x55555614abcb "cond->initialized",
> >     file=0x55555614ab88 "../qemu-xen-dir-remote/util/qemu-thread-posix.c", line=198, function=<optimized out>) at assert.c:92
> > #3  0x00007ffff74191a2 in __GI___assert_fail (assertion=0x55555614abcb "cond->initialized", file=0x55555614ab88 "../qemu-xen-dir-remote/util/qemu-thread-posix.c", line=198,
> >     function=0x55555614ad80 <__PRETTY_FUNCTION__.17104> "qemu_cond_signal") at assert.c:101
> > #4  0x0000555555f1c8d2 in qemu_cond_signal (cond=0x7fffb800db30) at ../qemu-xen-dir-remote/util/qemu-thread-posix.c:198
> > #5  0x0000555555f36973 in worker_thread (opaque=0x7fffb800dab0) at ../qemu-xen-dir-remote/util/thread-pool.c:129
> > #6  0x0000555555f1d1d2 in qemu_thread_start (args=0x7fffb8000b20) at ../qemu-xen-dir-remote/util/qemu-thread-posix.c:505
> > #7  0x00007ffff75b0fa3 in start_thread (arg=<optimized out>) at pthread_create.c:486
> > #8  0x00007ffff74e206f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
> > 
> > I've been trying to figure out how it can get in such state, but so
> > far I had no luck.  I'm not a QEMU expert, so it's probably better if
> > someone else could handle this.
> > 
> > In the failures I've seen, and the reproduction I have, the assert
> > triggers in the QEMU dom0 instance responsible for locally-attaching
> > the disk to dom0 in order to run pygrub.
> > 
> > This is also with QEMU 7.2, as testing with upstream QEMU is blocked
> > ATM, so there's a chance it has already been fixed upstream.
> > 
> > Thanks, Roger.
> 
> So, I've run a test with the latest QEMU and I can still reproduce the
> issue. The test also fails with QEMU 7.1.0.
> 
> But, QEMU 7.0 seems to pass the test, even with a start-stop loop of 200
> iteration. So I'll try to find out if something change in that range.
> Or try to find out why would the thread pool be not initialised
> properly.

Thanks for looking into this.

There are a set of changes from Paolo Bonzini:

232e9255478f thread-pool: remove stopping variable
900fa208f506 thread-pool: replace semaphore with condition variable
3c7b72ddca9c thread-pool: optimize scheduling of completion bottom half

That landed in 7.1 that seem like possible candidates.

Roger.

