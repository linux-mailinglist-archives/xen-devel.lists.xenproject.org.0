Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDCA6BC90A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 09:26:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510365.787875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcivj-0001hU-De; Thu, 16 Mar 2023 08:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510365.787875; Thu, 16 Mar 2023 08:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcivj-0001ek-AZ; Thu, 16 Mar 2023 08:25:47 +0000
Received: by outflank-mailman (input) for mailman id 510365;
 Thu, 16 Mar 2023 08:25:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcivh-0001ed-K4
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 08:25:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 231afaae-c3d4-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 09:25:43 +0100 (CET)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 04:25:39 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH7PR03MB7091.namprd03.prod.outlook.com (2603:10b6:510:2a4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 08:25:37 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 08:25:37 +0000
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
X-Inumbo-ID: 231afaae-c3d4-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678955143;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=OMLZkr4T5e5p4/CSjWY3EkPuWyKiWklxU/Cbpl9sYOI=;
  b=ElCvVgLfF2dhko8N13Rg4ETAWEpz15eXs/Ppu+YdmNkshN4NR1OjTQTQ
   4TIqyygD9ltSkVg7Tamgfu+k7pTgFGQfgPCG4YuicShawziRhgHLvGYGW
   YMTYzlNDZDbjm9PkgOu7Jmcs/46KFt52+87KDZ9bvG4wwfb/2DFxACM1u
   c=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 101488429
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+KvLZKKhzhhNrEUnFE+RH5QlxSXFcZb7ZxGr2PjKsXjdYENShmBRz
 WAZXTuHPayOYTfzKotybYm09E0F6sDcn9M2SlZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QVgPa4jUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4mOkVi8
 /07awkRVTGmhMmu/LGESsxV05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLnGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv037OfzX+hCer+EpWf0fpDh1u1xlYdGUdHEmCjuv+HoUGxDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8U49QWMx6z88wufQG8eQVZpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq16bO8vT60fy8PIgcqdSICCAcI/dTniIUylQ7UCMZuFravid/4Ei22x
 CqFxBXSnJ0WhM8Pkqm+o1bOhmv0ooCTF1ZloALKQmii8wV1Ipa/YJCl4kTa6vAGK5uFSl6Gv
 z4PnM32AP0yMKxhXRelGI0ldIxFLd7fWNEAqTaDx6Ucygk=
IronPort-HdrOrdr: A9a23:MK12sKponEeWe/p7O7cgMu8aV5o6eYIsimQD101hICG9E/b0qy
 nKpp9w6faaskdzZJheo6HjBEDtex3hHP1OjbX5X43DYOCOggLBEGgI1+TfKlPbehEW/9QtsJ
 tdTw==
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101488429"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tyk92O1DG4D9hPgQV9toVREOLuczWhfC1gZ0/zgWwvFN+RnPGO9eYpdnQBeR9mDXn+QM/sTuFWwltI0R0vsFinz1+buFs3nn150fnQo+S7vII5dm/5Rszul5Y/jnRtDYGrf0Y+TbCf98PzjMnjEq+DcTrKH8+Rm361q/jBl+FZ/chA+HAxAz826st08Zc+Uao1gnQIn/QuHProDPQBhGYyjG1WpkzJJBY0/R8zOwlRMsztNiNYKnstKH747Nh+JOltdsgfhWuyOyfiK3useQ6WnV1W0HFf1RAgZNlTamPFdgbpktb9Xr3a4ykYESd7Y2nrhhMJtdlcujoyNfRhSkRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Owxe1oMilNs25RrdMGTZ/EyqJtyt34d2tICWpI/7uj0=;
 b=UCZfb+jbkuvBuqzbjNVT0ttmoFib+PWI3haMtiera5iblE4DxRDkY3do1aiY42WncRWo5BOFfilKDUVqiST7TsDDbsjbK3UYSaxYARBVt4yO5Lw1+PB0hV5c3z+ThNfk6DgRZNfMqu61kkXPlbayuAp0B9hHEB+GF7HZpFEACxDMqXwlTizOI5ichMwICWDU6ISWCiZcli+4KAmoXiW4Bp02jXDosDi0WEwHNrfbuutp7Nt0/2ZcagOwJMyX4Zs11in4xPZ8y06NjW7EwW8drabNd18uDerhHv7bWq6lWyba5zMg0W9hE+09icFfbK1vRXTe3UNGZXXkdQhZyLvAwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Owxe1oMilNs25RrdMGTZ/EyqJtyt34d2tICWpI/7uj0=;
 b=B03PQzEF440JIT33kjsDb/8v44DKHp1z4zmW6dwYd7jNZNhGBMGSH/JqFFjSjQ0oGTiZdKkiVyg0cADlG1D+/1mWQOcfeZMLk2qoAHJpHWEbaxU91zUVI3wOisjyFx9TQNhkhMJ7q5jTtLqSiaR/MOhTl2vubw+vH6Gvj4m8g6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 09:25:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/grants: repurpose command line max options
Message-ID: <ZBLSenQQGP9LlU+P@Air-de-Roger>
References: <20230314144553.8248-1-roger.pau@citrix.com>
 <7db90f7f-3344-75bf-120e-2113908adfb4@suse.com>
 <ZBCV4Y6Cz91eypUN@Air-de-Roger>
 <68302943-4d12-ff48-bc60-2c63781f67d9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68302943-4d12-ff48-bc60-2c63781f67d9@citrix.com>
X-ClientProxiedBy: LO4P123CA0368.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH7PR03MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: c33358ca-6c14-4e5a-bb52-08db25f804c3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5hJCZMNoa01XSDjHPUnQCjDovcydqi1iBzGngpkr5z3SVjuVCYMzT4Yw7Oc3pKor7kKNOyEtB7KqBfRvWeGT/zxMiv1ozK8eRPeOHH3c3sWxUA94TNrLqm2hWVDSFRn273tyGFaPqTj5yHpNN1CEP8LW0zjZCzu+qUM1NYgez9r0n1KdGXnGc4EvcBBEUQy4pByPtJ7zS1IrdHb4VSVacNw726KbODU9NCqOGuMqOacTgPU6GZUioDrTZXGUFwY68RneAlr/ie3XDzCM1ZZ/cObNgMCd83BmWAChxLlv6vH8aYL/5g8Ym8IMYLprHZKb58w3qiU+4g3oGzG1/8Jlme4qLC7vF2Wx5WgCVaIUm025EK8gV4RZ1szvKJQ+T3AL9KGMGIxNrkpQjO85AdceyAR8kWuwdvJB9eT6OwPVQVKtONHTKak9Qggo4Y08ZcS3l70Sx+Gu+25KWbBFVmeQ6cMet+FhOaFBft//FMiBz3BbaWSyNEYzPTvsb7nWB5le0Jlv9Qyltdkcck/EO8abeBd3vOc4YZlE1vDcaWj4SYTM1/dZJJT482gK7R3kj82mQCpHfow6hOoMNb1WpBgcvOykz4ABbglf4Co3qbKthvZgkg8X3yfpc5WmzvDLwwiLzglFbUFsGPsaR2sYNEjv/INZJM/zGkUA2S4PiRpXmYrFdEFTBx22EJhF/qR2JhI5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199018)(33716001)(2906002)(6486002)(26005)(83380400001)(6666004)(85182001)(82960400001)(53546011)(4326008)(8936002)(66556008)(86362001)(8676002)(6512007)(41300700001)(66476007)(186003)(66946007)(6862004)(5660300002)(9686003)(316002)(6506007)(38100700002)(6636002)(54906003)(478600001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXh6T3RYUlhHa0xvWnR3eXh6SllJeU9kbm1VTUNmNUdjT3lIMXYycmlNMkVk?=
 =?utf-8?B?Tld4RFVob0hxWWpsWnRsbVkveFRaTDNOZEFXY2lVRUVEY1o1MmNGbHFBN3Nx?=
 =?utf-8?B?eVhDYkgxa3NGK3pWQ25qc3JOQnhqSWJaV2pHOWtGSzFFSjh0dDhFcmRBS0oz?=
 =?utf-8?B?ODBuYUVxaXpoRUZYZnJTZkpqNzR5UGZycmhrRTZYdUVBcVowR1Q1aXZzdHR4?=
 =?utf-8?B?cXdBTjhKZ0I0enMyMWtHMjlkNG9GT0lXRnBzazNoTldyb3hDTGVuMjg0Sml3?=
 =?utf-8?B?Q3ZKQ202WXF6NU5vcHZXMXcwUmdsTTJpZ3B2QnBWZHZpL0k5QUlBTXNWV3ZT?=
 =?utf-8?B?L0gyS05oaFpPZFNMUzB0VFZ1dDdMRHBsM1R1T01udHFyRkFXNTJQUWdGc1pv?=
 =?utf-8?B?cHR5bGNRaVVBWnI4cjZLQzNvUldEL1RUQ3MvK3FodG8xSnROcHlNYjZKSzJZ?=
 =?utf-8?B?VE1rQXgvQitkOU1zK2tTaHRxN2RqK0QxQmszcERhMWY0QTIxczdKQ0QwWXd2?=
 =?utf-8?B?WjNMUnFPaE1ZWkQ5WlVaeTJVb2Q5V1o5aFZ3aUJqRHhzQnZpVFVxVEw2OTBI?=
 =?utf-8?B?UFhNRVRJamFlLzMyK2VDQXdiTEx3cDhNb2VkVU8wYU0wWG80WUtRRnZuYUVk?=
 =?utf-8?B?azdPazNWOHpzRTJSVGVUeFlSVmJNV2tLbXFUWnQzZ0prRGIxeWMzc0RYN2Y0?=
 =?utf-8?B?UG1CS0UxUnU5bTFTYjJsOEZLK0xwWEJCRjBhVVFOV0Y1aXlBbEpyRkloaUdS?=
 =?utf-8?B?NUhMelBpeGlaVXJCU3JWb25iYjJHQWtSbUNWWFV4MGx5RVlNcy9oQ0wzWHdM?=
 =?utf-8?B?QmU1c2tsNklKLzRsUk1nODdOQlNQbk5vcWNFR0pKb2lIQ0lURXFtaE0rREEw?=
 =?utf-8?B?YTlGUDFrQ0FFSmw2S1FsOHY4R0hXS0JzNTFXTlhHS1hsQkI1OTExU290L21x?=
 =?utf-8?B?Y0lSeFdNb0IrUmo2aTNqbnRLRVNDdGZhY2lLSzFPdnQ4OHhDVVlGTGVVM3ZG?=
 =?utf-8?B?ejdlOFduT0Q4S3kyMng0d0NNVHk1WjJCSnJBb0FOcWNRQW56SGs0WEkzV2xW?=
 =?utf-8?B?OXNWTW1CT1BnTENOamJkMGZLOG0vUFBYNzdlTUcrY2NWSkoyc21VaDQyL2xk?=
 =?utf-8?B?ZGZ6VkNxZGx4RW9UV3RsNFdzS3BJMHRvZ2FYZm1LVTVBaGRkeUkyWkdiZWNh?=
 =?utf-8?B?VVpxZ0lJYWNYYzR6TVN1NmJKSGk3cC9hMUxEQXg1NTdYWWhYR0xXR2VSUGhZ?=
 =?utf-8?B?c2p3YWE4TjZUQ1VWMGtIcm1mVG55cjRaQ2xqSXBKNlVRR2ZqdEl3aHhIcWNs?=
 =?utf-8?B?Z3VyTHRHYXBRSVJkMktwc0hxb2Q1MDlOVDJoZnB6aUdpSnZUNGphTi96VlM4?=
 =?utf-8?B?M1JHZHFpcHJydkFVMDdrRStwMFAyWVFtT3NQMjUxTmtOTFZCN0xOOE1ObzYx?=
 =?utf-8?B?dlpiYzhPWnppc25RSU9xc0lyTzhIS2xzZ2VzbWt6RGVyOUlWMElKUkZaNnFL?=
 =?utf-8?B?Rk1QNjdDNWVkQ2FKYnRzM2w1WDdnRThFWE1OZSt6VlFWcmdsTnNvMmdzYjRR?=
 =?utf-8?B?YzRkbW5BWGVWc29sZ3l4c3hFaktCQWFUS01KQytCTTF0bWpENTVlZWcvOUpu?=
 =?utf-8?B?cVN0Z2VzZGptRkI0dHFxTlZweDNkbmUwYThnL0hXT2FOVnpiNFRPQ2J6SWZr?=
 =?utf-8?B?aHd5NGk3bHlrMFZ2SUo5bGVVdU1LRWEzdzdzTTFtaS8zQ2J2cm9aWGdFaEc5?=
 =?utf-8?B?TUMvNVYwc1RTT2dYYnlWR3grSVRSTDFYVllQYmRsNE50RHdJWDNyQ1NCcVEz?=
 =?utf-8?B?dmo5ZmJvTG1EWGw4blBSTDNvc1JTQ2NpUFNRb0plK0tHUzA0WHdEL0RSb1dm?=
 =?utf-8?B?WW5FT3UrNk9GUElNTytWTmpkcDdXYmQrbTIrNC9rREk5NnJ5UG5HWVVXcndY?=
 =?utf-8?B?Z25QN1JaK3lTeDNTZEN3WkU5c1pZc1luVEk4NnRnSDlrbnU2ZjI2OFRsZ2xu?=
 =?utf-8?B?SU9ZNjcxSXFsMHlHbVhqaWNkeTREUE1tZzZYcm15am9IRVJBWkdBcEVVTUp4?=
 =?utf-8?B?UEFiT1lDai9JL2hBQ2svWXNsNzVaQXBLWXdBQlNUM1hlWlJMdU5ZaGpkWHpw?=
 =?utf-8?B?NUlCNEMweTNmbU5rcGpQbm8wQnNVQ0dMVjQ0TkZBRVkzRGlkT0FNaElkdUpo?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WstshOfbA8f/+lDwYkWbgNKSlRYD4f7sTV8f9WqupYhy4qesGCYbSnvboJ5/uLAippgEpl1YPhhtesYwZddk0FEY2OYLtJ3ou8Zvgt04o2UgNfjG0Ho02Ni/GEfylM+0cL02QHrMPQiyZBvORIs9dCpzyUUXHYmNOZA3s5+JPkpPusDoQjetJTgDmpOU4zgxo5AUVehq94o8y187WBY+RA9n32ni7bZ4dgX1x3pZjMYsIfKwAQeE7tft1g1Ky0AV2vhiSbEhHl8KajDDlncqTqTURiJNDdMhoO7+jiIBZQrz/eci8SHeNBQIk4+sKPEJ1PWYkfPK1LRyVBVP3EJOCeayndXB4wsgFhIpR/hzXDBLqjaZw+wQUiMJLhC51ED1sRh7tAK+Tyl2vIBNnv7eDFJ9u8ctvvA3kF42ulhSmnpOH/21Tvz1dpxtprrEu2MDN1+ADW5Lwvrd+hDVanNvzfmfI+SDDrytsY/+MLCSb+m8BEuqHHzxyaXQmB+L15xleWn4qJz7szItMI2OF30y8X/QIK/xXMHYXLjrpJExQA7TDjsUYALb6QaftOn74SDnUGGl232kieH7Xp9BQ5vIg2rLuv/2H9O6YpBI3doA5px1Iu2r3UyS4v6dF2jHGi8MaeDGLZ3kzq7tSxUmHaD3iQObDvMqnycLhMnq5U1fNgSYUaTjzvs9d1ESDiWek1qGCn029Vq5hDVx98uhE1U0EVaIqahlrmDVz1UCxEwsHo2k05988DbRtwBeCJ6hCP9L44byfa+VX9mYyT6ZW5V3cybtvorTRSEP8aK/4yqNtwi0VvOUBXLc2tkQ5CbeVwlCh1rzlNHXuUiVSjfhSN0MHZUU3iz1JtUyTeqKObVdJjU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c33358ca-6c14-4e5a-bb52-08db25f804c3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 08:25:36.8547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAzoPR5/mzaVxtXv4+h3Qy1FuCNi0qiIbIH1RpHlnUfSY0/hQ3NBDP8giQVn4/ZqkHyG6K2jJsouBt5qe9wlGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7091

On Wed, Mar 15, 2023 at 06:40:57PM +0000, Andrew Cooper wrote:
> On 14/03/2023 3:42 pm, Roger Pau Monné wrote:
> > On Tue, Mar 14, 2023 at 03:59:22PM +0100, Jan Beulich wrote:
> >> On 14.03.2023 15:45, Roger Pau Monne wrote:
> >>> Slightly change the meaning of the command line
> >>> gnttab_max_{maptrack_,}frames: do not use them as upper bounds for the
> >>> passed values at domain creation, instead just use them as defaults
> >>> in the absence of any provided value.
> >>>
> >>> It's not very useful for the options to be used both as defaults and
> >>> as capping values for domain creation inputs.  The defaults passed on
> >>> the command line are used by dom0 which has a very different grant
> >>> requirements than a regular domU.  dom0 usually needs a bigger
> >>> maptrack array, while domU usually require a bigger number of grant
> >>> frames.
> >>>
> >>> The relaxation in the logic for the maximum size of the grant and
> >>> maptrack table sizes doesn't change the fact that domain creation
> >>> hypercall can cause resource exhausting, so disaggregated setups
> >>> should take it into account.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >> albeit perhaps with yet one more wording change (which I'd be happy to
> >> make while committing, provided you agree):
> >>
> >>> --- a/docs/misc/xen-command-line.pandoc
> >>> +++ b/docs/misc/xen-command-line.pandoc
> >>> @@ -1232,11 +1232,11 @@ The usage of gnttab v2 is not security supported on ARM platforms.
> >>>  
> >>>  > Can be modified at runtime
> >>>  
> >>> -Specify the maximum number of frames which any domain may use as part
> >>> -of its grant table. This value is an upper boundary of the per-domain
> >>> -value settable via Xen tools.
> >>> +Specify the default upper bound on the number of frames which any domain may
> >>> +use as part of its grant table unless a different value is specified at domain
> >>> +creation.
> >>>  
> >>> -Dom0 is using this value for sizing its grant table.
> >>> +Note this value is the effective upper bound for dom0.
> >> DomU-s created during Xen boot are equally taking this as their effective
> >> value, aiui. So I'd be inclined to amend this: "... for dom0, and for
> >> any domU created in the course of Xen booting".
> > Not really for domUs, as there's a way to pass a different value for
> > both options in the dt, see create_domUs().
> 
> Correct.  On the ARM side, this is configurable in the for all dom0less
> VMs in the device tree.
> 
> I've committed the patch as is, seeing as it's fixing a real bug we
> currently have.
> 
> 
> But, I'd like to point out that there are still some issues which want
> fixing.
> 
> The /* Apply defaults if no value was specified */ section is pointless
> complication.  All callers pass a real number of frames, except for the
> dom0 construction paths which pass in -1.

I'm afraid that's not accurate, xl still passes -1 if no value has been
provided in the guest config file.  And the python bindings
(pyxc_domain_create()) do seem to also hardcode -1.

Which is not to say it can't be done, but we would need to move the
default from being a command line option to a toolstack option (an
additional patch).

> The logic gets smaller and easier to follow if each of the dom0's
> dom_cfg's default to the appropriate opt_* value.  Userspace which
> really asks for -1 gets a large domain that actually honours the
> uint32_t ABI presented.
> 
> With that, the writeable hypfs nodes become useless, and can be dropped,
> and the opt_* variables become __initdata.
> 
> 
> Next, we need to do something about the fact that the number of maptrack
> frames has no relationship to the number of entries.  I don't know what,
> but the status quo needs changing.
> 
> Next we need to confirm that running guests with no maptrack is safe and
> security supportable option.  XSM_SILO + 0 maptrack blocks most of the
> grant related XSAs we've had.

I've given this a quick try and it seemed to at least boot fine, but
haven't done any in depth audit.

> And in some copious free time, we still need to get to a point where we
> can construct a VM without a grant table at all (but this still looks
> like a lot of work).

Yes, that's likely more work.  I did an attempt in the past by
allowing to set grant table version = 0 (patch on the list somewhere).

Thanks, Roger.

