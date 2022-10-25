Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7C960D17A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 18:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429985.681387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMd0-0000L5-1K; Tue, 25 Oct 2022 16:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429985.681387; Tue, 25 Oct 2022 16:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMcz-0000JH-UL; Tue, 25 Oct 2022 16:18:09 +0000
Received: by outflank-mailman (input) for mailman id 429985;
 Tue, 25 Oct 2022 16:18:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bJBo=22=citrix.com=prvs=2902c4af2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onMcy-0000J7-9j
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 16:18:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9adffab7-5480-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 18:18:06 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 12:18:03 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6467.namprd03.prod.outlook.com (2603:10b6:806:1c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 16:17:53 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 16:17:53 +0000
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
X-Inumbo-ID: 9adffab7-5480-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666714686;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=m+i4sHg7IBkkLa+Mf9gLvszUSJAZauKCbXCfioV8TnU=;
  b=Y1PjSJleNDjCvxPtLOYGrVlVZ55Dyuc8xIfnhuhQoBd8W6KQo6NVq7M1
   BaoQihWmI48aNoUObiGtcSPwk7cp00xeAb7jb+tNTCLvnJmMk8A81GzlG
   ZmE67rZzU7ds9pBhrG62IrIHQHiXi2er9t84zIgCqcvtUoR+7r/E2kkA3
   M=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 83497631
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ANLWD9a+3xMfAqnQr+PSdDrVtTnXEGR8FBUUsX?=
 =?us-ascii?q?f3yWtIz9vRTsLWGvXqmPfCZcdWsP4vopu+2z3U3mJjUTX9Z/g/8x71fQczQH?=
 =?us-ascii?q?sjbQWZ1jk0CehxW279Z/Lc5tKK4qroPo3sedcJGL0wKJeJZHIJmkcJamxg03?=
 =?us-ascii?q?bSVN9VOn1zWBZYqc6YutarifwFQleknOyM+4sSnfUELZd0kIk4dPvvn7hvAz?=
 =?us-ascii?q?9EWaU/yFoeIgB65D5G2qixzmfTBFf2d97MHDq4TYIJL0WIXm+wBixsBCydLk?=
 =?us-ascii?q?IG3FCgjB0Q6hzzqEPHoN5m1/w5Sz7UvqkwjMnuJbHf3zH5nILQlVHTmamucE?=
 =?us-ascii?q?D0vXfCBx8rKi66oEBMN2vUTr6X0uid6wB4o++zy43s3kLB3ZKWqzE5HMKvTt?=
 =?us-ascii?q?tj7hW92jNvb4pOsij241YAOWWkUg91oeXftCpwG5JHkcfzQfTpNonjcEQ9Vb?=
 =?us-ascii?q?TYL8wgJGdf19p287r9yM514Mfin5wW32y9QodGGn5h9Hz24v5eCXsX59gKS1?=
 =?us-ascii?q?NZNh1CZ5+PfavAWtYqrZGWTFlPdjjXwiiIOI2doAJvDGxPsgDOvUH9Md9Lhb?=
 =?us-ascii?q?xwngW4bE7CBk1oowyJHrXJ+TmMskvxse7Ek4ZC0GhiaA9JkTxZC6KJIeb3rc?=
 =?us-ascii?q?7n35F9CzOz0ayMvjDT/wR9iLgEiHtw7n9AF9zZZQPlHxr4wM0Rvw8uShBYZB?=
 =?us-ascii?q?9topWEek2Sgq58vhbORCPsGWZWLWM2uQ52pgkSFCpzbz5SaXE9ysJbHSMQb+?=
 =?us-ascii?q?mBJD2+4TP78en2IOlUNRThEChejrLZOUFLajAVRy3lfZ8Fzsb/zGg7rUHFzR?=
 =?us-ascii?q?8aoCGncjgY1wR4PR2/MIvK94dVv9MXWug/xA6RwOWIRQcJaP1gT0zOwSiXW+?=
 =?us-ascii?q?Y7udmofSNv9S2+6gciHaOpFAj9haT0/xhKDlrdxThxCKZWNxIlXxwx53hx2b?=
 =?us-ascii?q?wHE6eLNI2ze8FYpI302TY4jCaCCzUyl7P389B6y4Wy3ZWQNCH0w/vBcdR0u1?=
 =?us-ascii?q?uCMmTA1VcxhwTSSFiD4Oazv00IN1SV82bHYvoRuiqsk/FQKhm1aXxvJwVl5g?=
 =?us-ascii?q?9+QDKGVbzlflsag2ixc6NF3NpCMuUEducFs+XRUnQpaN00PyfclumGn6rUOM?=
 =?us-ascii?q?NQyrcYhqTmx2PS5CRVOHRvoPm64YImIROahjflnRow3IjvBimAFsTkCJjX8J?=
 =?us-ascii?q?ddszaUdRXAfFKV5gXyW1UCgN2+3pcC74pUX/nebNqJ98fHyWPif+KFqDPPjk?=
 =?us-ascii?q?6Uxl1FKnp9EmDHvV6QblQkCu/TDTKUl8Mo47qyu4MQvKATr4BGrFKtVih2Ht?=
 =?us-ascii?q?F6+IASCelyTCJwPtlyPKMESYs3nHPWuhbuLGt0Jg3a05jnXhbAkD6N7FsNCM?=
 =?us-ascii?q?Q1qlR47A7YmBEgXR7KbSmuv9lQLtvz2w1/hU4GFeh81ZbjoNg+xR7AIK+6fa?=
 =?us-ascii?q?OLC9fD3/5trUul44bFv8mhBUsP8PVaOtVrb8znx2Z/shv4a+7SBeG2mMAfJI?=
 =?us-ascii?q?w5GSQw7GAwO3x/U0rVIyC1d4gUAbvZgOVkZjBsvp3vMX4A6exCELRe6pMGdE?=
 =?us-ascii?q?1loma5uPlEfVi7HBg+yizpgLJEFSei6102G5tV8xdWNWVRr+6xGKpv/onerd?=
 =?us-ascii?q?WEXz0gsCZgKeAKDPVo17hP/ClTcB+Wb5h0rrlG4MO/zFUOUXq1CqV/2pnAkq?=
 =?us-ascii?q?NCbDXmMUiRlb6NN9Vi6a4xPzBJCny9gItun0qygq5/dxOEiBhjEPF/Hm8Aet?=
 =?us-ascii?q?yrrY+yi9FQUhf1hzRT9uwkQYjoEvUHSiH+I2MA9zrEJwvIX0OloaOZmNbS7F?=
 =?us-ascii?q?a64iuVeALspS/bt9180ffxCxVXiAn2qmP9k9xskh9woKpHNiNS8qMsmdYok+?=
 =?us-ascii?q?aF3fv4vTgyWC6UoKy88vmKj9rOPg3HVJyDuG4YP4eGyw24ZoO5lEeTu2nSFv?=
 =?us-ascii?q?eibxxrmRi0OszZzk9Q5Q23QaL8v7Fw4yV2gCF0cnfHI+ZWD8zcZK0x5iT8+F?=
 =?us-ascii?q?ydEzDJcrxNWAC8UO83M9nPffytnOHq4QNyGTnSHnwXeQzNcM3QfP63wLrBHk?=
 =?us-ascii?q?xaJM/kjqjz935PzNuf61XcOMPXSpPRcfx2yHHwr5PFoNJCihIvvreI8GnnRM?=
 =?us-ascii?q?v4Gn97uCgSDlDfOwB/FvrEEg27fxWoYdEzd3uRgvlR9hCFezjU2vM287sVNc?=
 =?us-ascii?q?RPZHQj1LLGJA35bkuQCX7aMFdythx2PKFTMM4XGUmtJVg6HYqkBu3rFd29uS?=
 =?us-ascii?q?nf/HzaN8IDDWE982jBv/R9EkilDF6F0WmSIcPPzvDOdw9RXqzCHNcbfZcawe?=
 =?us-ascii?q?iW89JA+7XWnDMjgY1twTbTCwN/RMHoIaq185yMBqBj1Y4O9XgMZ0SFXr212L?=
 =?us-ascii?q?BWTHc2vkJrDAzGbA4BXeJjv+z1nu8MItSEs0bz/p1d3FFDVa2HTm4P+tNsbU?=
 =?us-ascii?q?frmuQikaYowz8sFr/s3uYGBKuX8trXeQ4/0TkQvanSEO/QKQhfEi3BvcVl96?=
 =?us-ascii?q?K/F4lKF6V/Y5BYdbNv6jCyZUB4ZOrmKnCv8?=
X-IronPort-AV: E=Sophos;i="5.95,212,1661832000"; 
   d="scan'208";a="83497631"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RANcz0hXEW84GTbf+trnjjqAqIfwlDrs3mTR1HjHDi1gbKQ/2d+z7JdszQSRZFmVviKCgkBc6c8GBjVd4/p4et765nXhqmwxIc3hQ+WQgCU2qZoEHhUQ2ku40NANbu8JkkKMxl1dPsMQy6LCDQrv+c9/UFUepv52yhGgkXjONmb+sHvaHHeYW2/rRo637Do0nhopOwdM2tCFXsAUvL5nRlaW1zs7Mg2rKmQMf4AmGrG9T8zhNER89Yl1VTXAhBFFLHMNBV5qZmmQzNEMxOBvvnpykU8N4xfMoO3k8ageBwPdKoLAX/l3sNi5j7v8p9dynhPxczEISJKmWa+Go/o5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4w3HFejju8d5NqF0KPC9JTKjG5rn3zs2ISvVqta4EY=;
 b=nze6ddY3xxiYmyffZTw3FKoxUSRnNrm7HHZaZZ7nJ5AJPJgRpf5/liFn0izDglXtA22s37py+jPvxQrfqpHHkq0xjdqN2FaGeVGgQEiZ2BSGA9SrCnRhqLAfWjdcCTrUHP/h2xdTnhdTwulEsN4PW+cLdhZpwancPdFkBtCaE0g93RCO5i1f4zaBJeVdTR2imKScgnqMz0TPCtibvP3tG8pZT7gYoBEWtC/whUoKxvhPMeFzARs0mubY3+RvpxOvFm8s6s7uL9ZL/EnNkXVnTHiypod5Av6dl7V0rCISvOMoawaFHaRqb3ThbA8S9fi7JwkNbPZ74l1rfiicm6F/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4w3HFejju8d5NqF0KPC9JTKjG5rn3zs2ISvVqta4EY=;
 b=XtZRkCV+f47drw15WNaY2g2L3ImSKW+HYPtPoznh6twJpGUvuIdarnOr0VP6l2kJ/6wP3iOjE2UEExnHmQyZH3CnVP/MA33EELh4E3E1bZn3SBHFO8aGm1pMe0d9pWC2bbIyA5yso0BVbKDEX2BS3ll4LaNHNhSGa04kQWP8YAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 25 Oct 2022 18:17:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] common: map_vcpu_info() wants to unshare the underlying
 page
Message-ID: <Y1gMKgWDxjcBOlCn@Air-de-Roger>
References: <b2382fad-e328-fb03-2860-cca93625f4bb@suse.com>
 <Y1gD7GmclguLZCM8@Air-de-Roger>
 <1780acb3-d297-edc6-3a1e-adf8b28a5262@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1780acb3-d297-edc6-3a1e-adf8b28a5262@suse.com>
X-ClientProxiedBy: LO2P265CA0188.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::32) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: 86286596-7030-4506-b77b-08dab6a47731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	juWQV6zxNI51+SLk662FsB8TDMlmyT+pgMJwcGoI/zSitB3YknYTibWb5MBfKzOjIBchKQTPvEhvpUKuejwmfFUW/qkfsl0xNgLbG3nsuS1q1kqcYf5kV43LdeKIucT3tZzlurh9aCHNES6w61m9hA8eCyhPf7yC3NmObiUakwH1LZT1Iak56WwR+TrEVEhm8DMnWjObjeijsInJvZZYcsoiBFnhcnxdVxxRni9ZXHJAcCXnY5Z3srIdZnLVxpoSmoJ2iO3OyCODxoEer54l0qLdRxAXg4LjUGCh5rNOX3W2RNJdMHjnL5g/XXGa6mYQwPsIgQdJs4kiXSgvNv/k6imLIje+yWC6jB2gKOVDeq54L+aQvW4zeajS+4x4hPZiHDxuXmZ/KLZIVYYL1WE0CmoEYJ8VPfNXpV9kmEKZCJlPpEr1pHZ4SOGfo9E2LFEHPSqqjhKE3m+C8g5KESM51cRYW8yuPacmLzCJRs3ytwaJ8LuPMSJ5uPt68Mr8EB/GmPmAVABswqwoRZ7IL8egUy6MaoZrWjgZUjvAxsYpZBpp87wZQavn6ak3UGw4DCEp9xwR3Bqg1I+y4wiV3x09KAT8VnulVmlFsgArYjncJ0moaRer1wPXlfKN0XULOx8JFLZ4Z1QSWC+9fW1x2pfkQzc2Kx9CXny8StYx7TQBGG9LJQZBv5lstgYKz/XZiyhlRfEAnnN1RP+b3/E1Mrun5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(366004)(396003)(39860400002)(136003)(376002)(451199015)(66946007)(6512007)(85182001)(86362001)(2906002)(38100700002)(82960400001)(186003)(6666004)(8676002)(6486002)(4326008)(53546011)(26005)(6506007)(6916009)(316002)(66476007)(66556008)(9686003)(5660300002)(54906003)(33716001)(4744005)(478600001)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkVDekFkajdZcDBlekxJS3FRUWFweTFXSkdIdXgzaXRvNzRYYU1zSWtFd2ZS?=
 =?utf-8?B?SlB4VVVrMlRPeW9ibkdpV1FrOURteVF5TXFYWDF6NHp6ZkxCZStJcHVwaHJn?=
 =?utf-8?B?TlhTZTYrVGI2N1JQeE9ZT3ZZR25Yd2p6S25yZVcxVllCMmVBRVh5eVhGc1Vm?=
 =?utf-8?B?ejdkSVpPWXJ1dVR1dTFGLzVXOGNlQ01DRXZId2VvNWhuelBzbjRwL1R4L0NM?=
 =?utf-8?B?Y0VoYWhwYTY2MTd5US80am1lL1BJZmovVTFGWHM3alZCYmphc1lhb2pLcEE4?=
 =?utf-8?B?VVhJemxBNXNoTFdub2U5OExmc0hOWWE2MzBCSzRKQ1NweHJJQ1ZRQUVTcTFw?=
 =?utf-8?B?eGh5bFRtNWxiQmF3UFdLbXZDc1ZiREpqQ05LR1lNZzQ3V3ZFQk1mUHVLdFJH?=
 =?utf-8?B?RlRlTzBiaFAycStVMmRzeVRuNnk5R2x4cE1RdDgrSTVrM2JaVjZFNy9JWW5r?=
 =?utf-8?B?YlA1NDMvM3FDNDRqbHRNVzRnbmVqZ3VYZzg1c2JQLzV3cFRkcWJhSGxkdStW?=
 =?utf-8?B?Vm9lM1FLTlVtcTlncWQ1Vk5pdjM0TXhGYk5ONWZoYU9iU0VQa0hkcEl5UmxL?=
 =?utf-8?B?cm9peXQ0OUFVU0p1QlA0QmhqQU5TUVpQbkZZN09zTG15ZzZzcy9zZG1yOFAr?=
 =?utf-8?B?OTJndEJaZlZieGptTHhhSXJmWmhkWmpuWUJNMnVaVGdXczZLRDJQL2RsUHFW?=
 =?utf-8?B?OHY4OUJWUTBQYkVBRmdyMkE4M0JJV20rVU9GenRZTDZ5MXRVVkpkeHczaXZ0?=
 =?utf-8?B?Z2hGQnFNN2RybjZVMmlrQzFnMGZ6dDBzNUxuM1I0S08xbTRnMWZua21WTTQv?=
 =?utf-8?B?Z2s3RC85RWNvZXFaWWV4dmtVWW5oSFdQb3hjMk5RdUdMaHJlb2Q3b0JWbUxV?=
 =?utf-8?B?YnloZnhpdTlxbWthaDN1OGVXcUtMbWxlUm9VSXV6M2wreC96RVZzRXJxQjc2?=
 =?utf-8?B?UkxzMUxOcmw0RHBzck54Zlc1eFc5Y2cvbmtlY2cxNDBOZjVWOXVKanlZa2lI?=
 =?utf-8?B?Q0tVd1I1RG9OV1dIWDduYmszdkxPUkxBVzIrc2Zwbm5nN3RnazBtM21BMnBZ?=
 =?utf-8?B?R0EwenNodGhHSmtwZHducFZxWHlmNzZSUXg5ZVhYTGN3bG1vSUdWalIxSnM2?=
 =?utf-8?B?b0hkcnVoVlFBbmo4ZDJHU2RWZ1FTaVhOTG9oOVc2VWR1aW9pWkY2TWZQRllX?=
 =?utf-8?B?Y2Y2ZW9haVUrVk05elVPWExHekQyQWpsZWdVNEVjWUVad0xabU12Zis5YmRW?=
 =?utf-8?B?T0ZBaXZvV2lOSXN4c3hCc3JzT1RmS0pEakwvTjNXNmZaeGFNYiszNEJkdVo4?=
 =?utf-8?B?K3g3czh0OGNXZkZ1T1JpRkhsMkgrZCtrOXJIazB5VjEyNUR1d1FZOG9ZMnQ2?=
 =?utf-8?B?eDlCWkhNdEJMV1gxeUVUalJBa3hDZURxNnE0cUxjeHhwWDlWRlFLK2R4UXNQ?=
 =?utf-8?B?blVvQ28weVBLb1ZtOXczT1FUdWJuMDZpc1E3bjNTclhiSmQxM3pMeDlwSThG?=
 =?utf-8?B?eVBUUE1DalRoQmlJZkg0RVd5SjIyWG1BN0ZMZVR4bWZ1RUJZWE4rdVhqUk5Y?=
 =?utf-8?B?cTVLelA3ZkFpdXRmSWNsYmk3RTUwTndVVTdDT0hybG1hdEhPdElSc0svVjlx?=
 =?utf-8?B?TlN2VHh1RkxMdWVNbFVwKzhPYTl0VThvSG40Zm9wZ001aDVQMTQ3WTFRbVBO?=
 =?utf-8?B?cFI2KzVCMTBIcEdVcUpnNENJVlBqUCtGcUdsZDE0dVJROW9IaVNMT2xjVUZG?=
 =?utf-8?B?bG5XbEtuNW9TNGl0Q3Q2ZGZTeUpvWnVLWGFwSGV4TWJhRlhneXhNVG5mcyt6?=
 =?utf-8?B?MFVVdmEwVlFPRzNVMkZMVlVOUHNHT2tKcjIrUytoTG9HR2l4Q2NNMGlsYTVl?=
 =?utf-8?B?Y2dzKzNUayszOWk0eVRHRlV5Y3JmeSt1d2hLbjFoSSswakQ5MWZKWGN2dmZR?=
 =?utf-8?B?bHNGOFo2Ym54S3N1c3gvMlFydnRZbHZrREZ6bS9VejIzeVhLeVoxUm1Oa1Rj?=
 =?utf-8?B?Tit4SFZ4a0dpREN5RmN3QkxDYUhvWlVXaW5CUUUyUVBIVXVFQjI0OFRxNGZj?=
 =?utf-8?B?NmoxYmErQ1dYWjhTQUJLcStkREV1eWFZSTdSL2hSclVNcDJZOGVkRmRTMnFW?=
 =?utf-8?B?WVVUSWtMcVJ3TVIweHlRQWkvQ0FaNzFoTGdVek1lRmVnckY5ZG9tM3FjWk82?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86286596-7030-4506-b77b-08dab6a47731
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 16:17:53.4489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0G1+nE31qkPBwaub0EJ5hx7sJVrHMc4bqQkO+7juncVcIkf/KZR9P5qU+7MqPg2P/Ob1p5aHH4TXtH8ks6dDbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6467

On Tue, Oct 25, 2022 at 06:04:49PM +0200, Jan Beulich wrote:
> On 25.10.2022 17:42, Roger Pau Monné wrote:
> > On Tue, Oct 11, 2022 at 10:48:38AM +0200, Jan Beulich wrote:
> >> --- a/xen/common/domain.c
> >> +++ b/xen/common/domain.c
> >> @@ -1484,7 +1484,7 @@ int map_vcpu_info(struct vcpu *v, unsign
> >>      if ( (v != current) && !(v->pause_flags & VPF_down) )
> >>          return -EINVAL;
> >>  
> >> -    page = get_page_from_gfn(d, gfn, NULL, P2M_ALLOC);
> >> +    page = get_page_from_gfn(d, gfn, NULL, P2M_UNSHARE);
> > 
> > I had to go look up that P2M_UNSHARE implies P2M_ALLOC for the users
> > of the parameter, it would be helpful to add a comment in p2m.h that
> > UNSHARE implies ALLOC.
> 
> Same here, plus I needed to further figure out that the same implication
> missing on Arm is okay merely because they ignore the respective argument.

... it's made worse by some callers using P2M_ALLOC | P2M_UNSHARE
which adds to the confusion.

Thanks, Roger.

