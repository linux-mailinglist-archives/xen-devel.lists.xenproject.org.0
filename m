Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AA35B897C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 15:51:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406966.649385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYSmU-0005uz-PQ; Wed, 14 Sep 2022 13:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406966.649385; Wed, 14 Sep 2022 13:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYSmU-0005sc-Lp; Wed, 14 Sep 2022 13:50:22 +0000
Received: by outflank-mailman (input) for mailman id 406966;
 Wed, 14 Sep 2022 13:50:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VL8e=ZR=citrix.com=prvs=249e2d04f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oYSmS-0005sW-NB
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 13:50:20 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29fd4ca0-3434-11ed-a31c-8f8a9ae3403f;
 Wed, 14 Sep 2022 15:50:18 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Sep 2022 09:50:15 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CH2PR03MB5253.namprd03.prod.outlook.com (2603:10b6:610:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Wed, 14 Sep
 2022 13:50:11 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 13:50:11 +0000
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
X-Inumbo-ID: 29fd4ca0-3434-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663163418;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=J1AU8plJZrxCjpnPUEeGqFq0bbbD8AuhAa8IqzdwvGg=;
  b=CE2FAQ/DvLcgVGjjJtxjtlxD4t5JYlfoj5bS6svD/BPjupw0TjA8A8pD
   rp/VrP/595QBMqWW5BH4DffCKL+Hdegka7t4TblSfoevjNXfa784dovvT
   VKr3i22HYqtr5BNNoPRl3eGuM+vtpGtdGXZsdXS3OKoxuXIJeVOWW4n0n
   Q=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 80487216
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AY9gdLK63kmE5hv9GcqHWKQxR2vbMJQuBRyYv2?=
 =?us-ascii?q?ybIXl8q2Bzspq5RRtaLSdRirHyfPWYI/V1F0QLCw8HWTaBjtYjshk9S1H9T/?=
 =?us-ascii?q?Ufviw/3dkcJ/7P7WYn33J+4kjf/KU4vY9Vx8fISpLue8SrrfFHZfH2vTPGoC?=
 =?us-ascii?q?U1jA/mez0Juz+rhqTzWPEGYQmnd9wd+03LOYCCZFxVuFnHGU2I+xZXZBL8p8?=
 =?us-ascii?q?BBf2VQweabRtQCTrVtsnBZejVVOjnIZvwgrE9/h0SwlF6aGAMYdUW1xUFS/o?=
 =?us-ascii?q?b7d+ZTQgfIK4Yg2jx2fzaVh50ROe45RxXKjvyVkzD9myIjFQwoqdqVfyvH48?=
 =?us-ascii?q?M1KKYPO62sECRLbUHdBhxUZisoltg+AaRB8uEzP/kWKjYkd1XBkQPP1SxB6s?=
 =?us-ascii?q?98wGtAfKQMNLc4nvu8cmYrThM4NiRnLmgH6dVvqi/Ac6UtXCsFogoXD+YIG0?=
 =?us-ascii?q?FJ0Kx+sRprHiLWa2IwqvcOj1rNfCL8BlCaLEaRfCp1IJmqSmoCF3axrUEIhX?=
 =?us-ascii?q?KnZgRkWwMU8K7i0UrE+FMGeWbOJ1W7kzAPui3mRXzWiuUz8uP70riweP5pbQ?=
 =?us-ascii?q?BcKRBF0lHF8BCJCquUoAeBci62xBsuoFfoD5OAbUp4/lyq0LnRmtLdNy3r/i?=
 =?us-ascii?q?99ASe0CQET+gV7KAa3Hgp1y0IjDQBdvJiESY+PRG/hEHOFpidUGXwo6elksf?=
 =?us-ascii?q?nyRtNymmi5sDbFGfhYRTu38r/Vf4TxwAyCwqtZM4tIc46IG92n0saC5TgNwa?=
 =?us-ascii?q?WChiVyBeLrCzhvvCpykURkzj/1ZjthhXbyD3WUiVjo9NpJ6UbkDqBrqHE19q?=
 =?us-ascii?q?cbrXmpdljklhaqQBtmgpE6LBiZDvSTyfRwfTBae1aNQZ58j6cim4Qe9ucaCX?=
 =?us-ascii?q?RghIlBThA9ozAFmHQINGGQqYkcjdVrtU1pdfCmi+qhHKkFHsQuz6lxkSnnBN?=
 =?us-ascii?q?BclxHWl+n/G/xZEr+xWaMKTZJU2ttyt5shU3SZNDXPC8v8BVoYgIJss+kYcW?=
 =?us-ascii?q?fGqmiCSCfCNVfVJBWvMA985FvVe9pttscP71iPss5kEriYPl7+I38/EO5IWK?=
 =?us-ascii?q?6AH9N2K13CQytL83bOlUPAwr5lIik14v6arOx2xJGP8ochY2FvsVBsY6aVnG?=
 =?us-ascii?q?+k7i7dVbuWXKkrYiMD5vmn8KUW10X+ZHjX6WTpSauoIOPVqTns8vwBcevIaP?=
 =?us-ascii?q?l+HHUkTreWXtosnUW33h1KQayYuUcmvnfTw/1CqLi/3XJ+XKWM3CDhvmcXQK?=
 =?us-ascii?q?x8AV808PLKOn4nqJpQl7HJrp6ZE130Gu0OAEjHzVuw56P87zsBg14cmSIQAY?=
 =?us-ascii?q?r/ImtDLqqk+F1oIzCrf0PUBNZMiLlH818F5hJ2/KJ9X7bxUi6tnc+Zhudg0M?=
 =?us-ascii?q?cshVoH2s06RPzRuaFUwNtQltJb1DsGdL7IOLkBfnBksMjMpxl7jSqfxxFjrE?=
 =?us-ascii?q?XzFgU+8eSI4xBSQNjidaOoRi5njHmIvJ3hLi3ISWM1xEFR/VACl5OrN5UK9X?=
 =?us-ascii?q?S3RWt9ZDZYewG0muuHmbsdQVGBBdaBu6q0By1F4TeZnngJbQx9dNoFSUdRHn?=
 =?us-ascii?q?PgrJSNzbAGzS4llUZKiOFti/uKvjLrXO6gGIzd2qx3UIkg0h+9Qf7Pkce+oq?=
 =?us-ascii?q?W/M4FzSj0xa+5g3oMdOtgg4bFBTBl3g1Q6n2j6KdaUXJICsAsTWkSE1ZJREr?=
 =?us-ascii?q?TsHSUbL5R8E/1Ad7tfyYBQ3EjU13V1uRsonZXVIknPHsCulSKVlJuAs845iN?=
 =?us-ascii?q?WOdZVz4mJaMxJljuvnW9hbOKtg9EnOfDIFbRvehwzGaXfwQr/k1L+J35I4H8?=
 =?us-ascii?q?kfD8qoYkYFCyZ6Y6DAKSfm+JSnTZhrWBKrrwT0+T8rRKlkt7jFlzcmiJVPZF?=
 =?us-ascii?q?PM7ks4/Fmz21PAInp1Ky0QP6Uhrnw9RdJODpIT83JbxvzuWJ/bpa6XtF2OQ6?=
 =?us-ascii?q?eNFII1l4gcxOZr3aLh7PsyBRi6/JVzg2kXWvmd84wganIoIpRmdGTTL6nyOh?=
 =?us-ascii?q?FYdlqdz7NHsOXBJoOaeJCMrwPwaBbnrLMGSNmBYDd9BVmNfVPtT0wQBUyjWU?=
 =?us-ascii?q?wVbGfwizaqU7RynYCssEMKamIKxhH39ZubVV5hh2Oi3rev1kyUfN1Xx37rIA?=
 =?us-ascii?q?3juRTtuvizLE5/XJmIfilpl/vK9yZWoESP2LrxYXpEy8OiiufXcn0OEavqGH?=
 =?us-ascii?q?k4giLsfoolPzQ5HRSZpj3d5JGM0g2baO+c90J1OQESM6Eyg6pvF/hhrlBiRR?=
 =?us-ascii?q?HtkPgmgg8gwMzK+MdpbfUVm+RkcvsT/k3Lr78zqr6G4EVPhimjZdIuKPKEhf?=
 =?us-ascii?q?+LcYL/VsZgw1eu/6H7KNfrXzw1i3/uJMVmqBYPfALtd0wGQgezViVu1/WnOy?=
 =?us-ascii?q?zatjktG/1YFjbq1LsAFeTCOlchCawqRLL4VQ1rR4bT2NZ/2Cgrv3iTzY2pO5?=
 =?us-ascii?q?vEHUkrQd7/q4zzlbuhQB76i24Y4C2k7S81/BZfJjR/xtclFD3b+m39qo/az2?=
 =?us-ascii?q?3Lp69Z89q555eBjA0F3Iv1g1gRGKg1ibkEF5yKNq3GiR7u7hNAL42yoawA+S?=
 =?us-ascii?q?Yp1E4DCn0PowpVEOoKoMjoRNeJX2LWag6Env8Bj6jL5qH3x/mvJX3w1ZOLdF?=
 =?us-ascii?q?F9FEGmtiB9IhAeWd1qonZthAdxj+iyXg3miYiauPa4BIBmoG6SZrrlmn9g/q?=
 =?us-ascii?q?/I/wVy05py4oFJ/Sgi75OuMUoLvwhQaya7OW3pLKLPPs6uFtjM3jJRr7P3sK?=
 =?us-ascii?q?3JPdNQ3YgkhICFcfjO6CF8LpaCsZHyesmx+Bo1t1+J9E7eHtHXsdZxRGI/K3?=
 =?us-ascii?q?Pb+Lhb8n43CSFPNDt1Wo3zuHllKBgIfVmw7k5AOmEoLzsCL?=
X-IronPort-AV: E=Sophos;i="5.93,315,1654574400"; 
   d="scan'208";a="80487216"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaMoScj4Njdu7GMI3NAyczhrHnh9f5XS/gLgmqYCEJ9ktNTwWbKwFLAC6nbZS5FEO2fC4U6KKSM6HjgX4RITobBz770kAqCh/sQeDjnvFvl7SrOGe3B1GKyu7yQeVjWJmrfwESHOu6+rmH24kzvPKhgbl7lTOZRpYuN3iRhrIVhhBW8zdP1cKDV41qsY0tKaaqAA+pIAA+4sl6I8T+l5Q4ueYEDipGCeL95w722LySfxkIVarneJ2BO8E7KT4WtpUMWsWvd1XJHZfm9VS8SnLEBG3z62+7AjgZwlHqd30DAAK0qKIB8xyBjMXjD2CzQiVMVrYblbo0n2PVFsTX7b8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2sOe/63kgG1OhSccS7QuJkq0DnuUDrkO+xJxjoRv/M=;
 b=Php4jEr2y3p9Wg9X47S9v1QW4DI9xfvn9fX7x9Mp2jHx9CHPahg9hybc/SqaVoBDvQqKJhxtVa9bmJf4/3HLSqBH/bk8g6iNa5Qf7VZIzkDa6CptavBTvn5N0iRA8QyiHaZnUMBAc4KkUCy/BQUxgq2u1iSnIwfoTchCoj8hAXQXDgTOJZh2UpXrXSjp60aCMrHTVZaTnvR+YuiL99iaL0XAIvfnksgfOG2HIjs3+rTuNaGUXIF4bfFuPRvEXHX9Pvw/1QjhWS/+E5zW3ktf7HkQI6AbwUx5TemQJmPD449COsDpolV40J26gG/+M0DHGA+SLlE6ey9WRfpKpLUUKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2sOe/63kgG1OhSccS7QuJkq0DnuUDrkO+xJxjoRv/M=;
 b=F8dk+HsU9Ht3ZbueHfSSUYstVjllcjLiCxxmn03w1C7S5ue0rXeHrlPmfH3Bn0JyMeAOKMLhhaTZ3VembTgi3MkQCmqC/r89Nbl9sbDvqyhcqFo8bjc4w2udTpEd+u6cOcmo+1mDkhXteF/YQg9oKHAaY9LHU+o8O1GK4FvzNtw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 14 Sep 2022 15:50:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Licensing issues
Message-ID: <YyHcDgQeaevA3jfo@MacBook-Air-de-Roger.local>
References: <b58f5340-d4fa-df9d-89de-6137005add77@citrix.com>
 <YyCnNem7dj8EfQCd@MacBook-Air-de-Roger.local>
 <7a068199-ef6f-89bd-ded1-56766b9420fe@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a068199-ef6f-89bd-ded1-56766b9420fe@suse.com>
X-ClientProxiedBy: MR1P264CA0020.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|CH2PR03MB5253:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f0114b-8805-4be6-e832-08da96580aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3D09o2Fcql/AYn5YQ3QOJYju3wvE7KoVgL7tXvsz2KNYyv1+Qv8K2iNI1ySWERGv0wlTh90L3QY63Zyb4Al3hiHnSyJR8IMXYoJf/8lzil8Kc6daroVCh4sznpSw8cUiSdn/Hbqw5bCGDhrDZcxdyZfItGBBIbVCsO0nF5FXCwaQYC8nClAPT8A7kWByYSxyyqbgXiiiF3MHXPCtWWYTQJXWrNSdOPp8hldw3MeaJ74KEpxNm2GMWNkOGL6Lahh9GjIy4pFae1hs9mA7ryKjKdsWu9IG21aSJdZQNCpOxXC1jXTYODsLhgb2sXs+gDzI0lVTHW+M6NPHVXCLkbA7owbinrd+8/mvFZfmX+CMQol5zk7cPSp97LurgCi3vGpJXCPXF71xnZyeclCRLk7bviv2+bMjvrTJ1x2S2+DQaiwIXc1Bfia3m4HGXJM6mTljQoANBO5fdEmoA//zu2b+Jr0lml8Ts1poM+T8TaPLB/KSjtCaqbEEUVh2QsDg8K27VNXChEhcfj4PGjLN0lTWRJAi9vzo/xfaw6aLmRhh4TyeqzH+rqMfX+/5PSzLVqTGwbZEgRGtovwjKn0JIh+S79V13eITAoPAQ/hPc9Px8YGIpvZlsFdS3ynhXsPW6FU/pOUXTvinJvluOSDje7Zt7yfaX9WMMsAsWKDOUu5bFmm5BQ+LCkZxbVAwq60jmfOvhQlj20jSQeAMLAm95ldZSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199015)(6512007)(38100700002)(82960400001)(66556008)(85182001)(3480700007)(8936002)(6506007)(6486002)(9686003)(66946007)(41300700001)(316002)(26005)(6916009)(6666004)(7116003)(478600001)(8676002)(2906002)(66476007)(86362001)(4326008)(53546011)(5660300002)(54906003)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1ZOd3ZwKy9GU1JkNURjZXRDajdUOGtJQS8wTmgxbDRxMGZNRFlXZExIUHY4?=
 =?utf-8?B?K255MU5XTWJPS0ducXdSOHBvVkMyUHVqQkZEYVR1UzBQenpPTEgyVUprZkVq?=
 =?utf-8?B?cG9jQ2Uya1BCU0NwZFBObHBWQUtRTGRkQXdCVi9jOHVYUk42T2NDYkFpWEZJ?=
 =?utf-8?B?RE4rNFN0eENFeitnQ2xrZlJxNzlGcFFtYU1RU01ma2wyNFV4Z2k3WlNDNnlq?=
 =?utf-8?B?bkdUTWVJV2U1MCtjN3lBcHRuNGxJZitFVFhNbnJFVXBySTF2TE9hQ0lvV0tO?=
 =?utf-8?B?QU9xZ084QTZwK2o2NDliRkZzakExSmlndEpvdE9OTm5SQ1R4TXgxTHRBSUdN?=
 =?utf-8?B?RWxROG9lcVpkU3ptVnMrOEZKTUdyOEhtdjNKUEsrOUpmYUhqd3JvN1FueE1M?=
 =?utf-8?B?Ymo2L1FmSWJ2d2lSVFJrYTNTNFNJQXlFbHNjS3g1Um9takFyb3RqV0dpUk9l?=
 =?utf-8?B?dGhsV2Q2S0tVVzVhQnRXZlFWWVFqMm5ySFFqMzhoTzZCMFBvb0haY1dLZHZQ?=
 =?utf-8?B?QmtZV1d1MXl5cTgwVGk1UzBMTm4wakZLQk1VY2ZpZjhUeEZ6WHdBWnN1MVZ5?=
 =?utf-8?B?WXVFN3dNaitoVVBxV0w0SDFnc1hzTEE1ZGw5WWpLMTN4bTd6MEkyYmNWd215?=
 =?utf-8?B?eEhrcWtlTlRJeW5pYzhqWWVNUFBsNUpUZ1pXbHRWbFZ1UE5JMHo5WDUvem5H?=
 =?utf-8?B?TUlCOW5rd0tubkZRL3hMa1JCN1NNVkJwOStLdHZrbWtsYVVXQmVIMnllWnZt?=
 =?utf-8?B?N2pObGEwVHZOVFJNS1NKOHVEYzd4ZFBack10UXpkbitxelV5YWpacStKemlq?=
 =?utf-8?B?VDROTGpyVE1COFlraGpGYm5XQ2tXb3BIZWxDYnlMb2tNVDFjb1JiQmlVclZN?=
 =?utf-8?B?cmRDdmJFMVQ0OVZRR2szQ2VEcVBLMkxGSjZxSS9mN3hkc0lROGpRaW8yNVVJ?=
 =?utf-8?B?RG12cUFnWXF1ZG1CYTVlQ3VJMkhmam9IbHpvY1d1ZUoxaWozdDhoMXkxL2VP?=
 =?utf-8?B?N0pJZmtPTzRhcVNhdlFwem9NNXF5WEt2cFhQMEtCWGJZVTVkYlNDN3lkYk80?=
 =?utf-8?B?bGhZbERoNW9ONzlvQmcrUXpUYU5JL2RVcXpDbHc2NDNXWTJHOEZnMElqWTNk?=
 =?utf-8?B?QW8xMnVWTTZiV3JrUUFRVUtGZ1BnM0FZQlltRVJ6aG1YUldHeUFzRkh0Yy90?=
 =?utf-8?B?QXdoVHRuRGhsSm1rL1RraWJ1MmxLOHd4SERzcE1qNCticURmYjZZVk4xYzVz?=
 =?utf-8?B?Rmlxb3IzejJkQWR1anBURCtXZVJxQ2VuUE9GTnFzODY2cmxyNFZ6aU1wRCt3?=
 =?utf-8?B?cGM3eVJyRUZDM0VhMldiRjd6TXQ0QzB6SmRPUUJXVEtKRm0vWktyS3pLeDdU?=
 =?utf-8?B?WStNdjBZRkpnTFlhUmpkOVBxUEFsekdvM0U0TzRGbTBSQW9iYXR3elQ3ZUtt?=
 =?utf-8?B?bGtVQk1OWDZtdnZMNFBFVmFpcVBLS2ZZcmVXTGZINmVyOHlEdXhRSSthaUpV?=
 =?utf-8?B?cTdHQ1hDeXVRR3oySFI4SXJXN2lmN2hQa2ZlZUlHVUNyUjVrN1NscEdjelNE?=
 =?utf-8?B?RDJQcXZlc0k3T0d2NVNoS1l3Qm95NnQ5U3ZEankyYnRrWkRPUTZTbFE0Zm9x?=
 =?utf-8?B?N21wVkdBS3Y1Z0dTVmlTSzl4cWZjZExLelowQ0tjamczcDM0eC9Sekx4dmVU?=
 =?utf-8?B?YXZwOHhlZkFPc3lISURVdmR4TUVneFJBZlRIUXE1bkk5UVJaY2NRS0daaWRZ?=
 =?utf-8?B?d0ozKzFFZmtvc0tPdlZiSU84QUJOZGhIUGhDWDB2d3Z1RGQ4bEl2T3UyTXZy?=
 =?utf-8?B?SWt1Wks4Y2prc2JGazRBSWs3YUtadVVvTlFCQWpSUXZGUlNPM0RZV2JIelh2?=
 =?utf-8?B?Nm9Kdkl2V1NGZWNPYXkzaStjaWU1RWFkYzUwRlJCTlZOb2tIQjVkS0dxdjlX?=
 =?utf-8?B?ZTNpSldJRFZLUC81a1R2VE9kVE5ycVNjSUNXbEhEaytqa1d5OUx1clJPdGpk?=
 =?utf-8?B?amRFR2VWYjJ6U25va2RvTGdVaU5mUmt1aWNwWDZvekZFY2F5RFdNUHNsdVR1?=
 =?utf-8?B?b3dhTER5MEEyZUJISi9tOW5QTWdCQnFmWjdNV3dEZUtScnlucVBab09ITExV?=
 =?utf-8?B?YXliMndHbGl4NGRnd20vcWRWcXBQVHhJTVJmZ0NaVjJhcC9YS3l3WlJpM3Zj?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f0114b-8805-4be6-e832-08da96580aa6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 13:50:11.0094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESjH48mpBuZWtgNkNw52ZQRRQCzR+6Wg1GGnalXNZQ/3VTvAJWjO1WGYHNcwmp47qKSgO0q/mmkfj9gxCuIcAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5253

On Wed, Sep 14, 2022 at 01:28:27PM +0200, Juergen Gross wrote:
> On 13.09.22 17:52, Roger Pau Monné wrote:
> > On Fri, Jul 22, 2022 at 02:31:28PM +0000, Andrew Cooper wrote:
> > > I've been cross-checking licensing details, and we have some problems.
> > > 
> > > 1) We install xen/include/public/COPYING into /usr/include/xen/COPYING,
> > > which is not common practice.  The installed file is mostly useless
> > > because it discusses files based on their xen.git paths.
> > > 
> > > 2) We actually use the MIT header for the public interface, but we don't
> > > actually call it by it's common name anywhere.
> > > 
> > > 3) The following files are missing the MIT header:
> > > 
> > > /usr/include/xen/foreign/x86_32.h
> > > /usr/include/xen/foreign/x86_64.h
> > > /usr/include/xen/foreign/arm32.h
> > > /usr/include/xen/foreign/arm64.h
> > > /usr/include/xen/sys/gntalloc.h
> > > /usr/include/xen/device_tree_defs.h
> > > /usr/include/xen/errno.h
> > > 
> > > Foreign are autogenerated from headers with MIT licences, so that's an
> > > easy fix.
> > > 
> > > errno.h was an oversight when we added it.  There's no problem fixing
> > > it, as it is covered by multiple statements elsewhere in the tree.
> > > 
> > > device_tree_defs.h is problematic.  It came into existence in c/s
> > > 1c898a9fec7e4 when some LGPL code was moved out of libxl, and some GPL
> > > code was copied out of Xen.  So there's currently an GPL+LGPL vs MIT
> > > licensing violation.
> > > 
> > > I have not looked through history, but it's likely that the copyright is
> > > covered by individuals/companies who are still active members of Xen,
> > > and I don't anticipate any problem getting it formally relicensed (it's
> > > just a few constants), but this does need fixing.
> > > 
> > > sys/gntalloc.h is more complicated.  It's stated as public domain which
> > > is fine for our purposes, but inconsistent with everything else, and we
> > > need to adjust the various files we've got which state that the full
> > > public API is MIT.
> > > 
> > > But it does raise a different bug.  Why do we have random linux headers
> > > committed in the tree, used by some userspace libraries?
> > 
> > I would guess this is because in the past (pre Linux pvops kernels) we
> > wanted distros to be able to build Xen packages on boxes that did not
> > run Xen patched kernels, and hence didn't have the user-space headers,
> > that's why we had to add them to xen.git.
> 
> It isn't so easy.
> 
> Those are headers of Xen-specific kernel drivers.
> 
> Especially in case new features are added to the upstream kernel drivers,
> we want to be able to build the Xen tools using them without requiring a
> bleeding edge kernel installed.

We could #ifdef code based on what's defined in the headers.

But that would have the side effect of limiting the builtin features
to the support present in the kernel used for the build process,
which can be an issue for Linux distros I guess.

For FreeBSD that wouldn't be so bad because the kernel is packaged
together with userspace.

Roger.

