Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3119452A533
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 16:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331004.554441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyVE-0003QF-Ui; Tue, 17 May 2022 14:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331004.554441; Tue, 17 May 2022 14:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyVE-0003NT-PY; Tue, 17 May 2022 14:48:48 +0000
Received: by outflank-mailman (input) for mailman id 331004;
 Tue, 17 May 2022 14:48:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCXU=VZ=citrix.com=prvs=1296e7181=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqyVD-0003NN-Ew
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 14:48:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72bd9ac9-d5f0-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 16:48:45 +0200 (CEST)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 10:48:41 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB3716.namprd03.prod.outlook.com (2603:10b6:406:cd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Tue, 17 May
 2022 14:48:40 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 14:48:40 +0000
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
X-Inumbo-ID: 72bd9ac9-d5f0-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652798925;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2LVmP6s5oJ07jJ7mBGBP68hqIjT2sLGIakNfiM/QSn0=;
  b=RV/JWU0LXqbZSZU3zJYfk7yhWLxq/q7ZOOL7N3bPOzdFFU6GkQTb98TG
   vOGIQnuTVoVtVsGGt4xq1pFyPLHfrnHb0yzggaYoqJAPAz8dhKzyqdgAK
   asftQ5Y++3eYrCKXpEXYVyXFL6mKj0S4xweEJtlmzsWsE00wZj4XYoFgY
   8=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 71510971
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zSb2VaMiAiO77HbvrR2alsFynXyQoLVcMsEvi/4bfWQNrUoh02RRm
 msYCmvUafuJYDOjfN4ka4i18EhUupfRyt9jSQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk29Ew27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 4hdlJzpZAATHKiSmO5adUBXFzt+MvgTkFPHCSDXXc276WTjKiOp5so0SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7HNaaG/+iCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33ySmK2wH8Tp5o4IL42L3lwUv+oPzPfqPYtbXdMkWwQGH8
 zeuE2PRR0ty2Mak4TiP/2+oh+TPtTjmQ49UH7q9ntZviUeWz3YeCzUXU0W6uvizjkOiW9NZJ
 FcQ8yBopq83nGSpU938UhuQsHOC+BkGVLJ4CPYm4QuAzq7V5QexBWUeSDNFLts8u6ceWjgCx
 lKP2dTzClRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85i8jVf5mGa+xy9jqQzf5x
 mnSqDBk3u1Jy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDDhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:E+Dy6KzcKlSOt1/uUTqaKrPxvuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvoRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIF/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF8nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvWOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1rop5PzuN5d3B+3Z
 W0Dk1ZrsAxciYoV9MMOA4ge7rBNoWfe2O7DIqtSW6XZ50vCjbql6PdxokTyaWDRKEopaFC6q
 gpFmko/1IPRw==
X-IronPort-AV: E=Sophos;i="5.91,233,1647316800"; 
   d="scan'208";a="71510971"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=No3w5fdbz+aQ0SgcVJ43SgMuSBmw4wpJcagCNWE2GqkASduBpjCUT1DSrzW+Jzl0VDWMORpA4y3dAK+lDpVCbonGKmKqH+fHLrgYULn34mrZ4/N/+xNR3YBthyHAb4eQRXQ+ZeDH1LSsFc8GL7VGIwtK02vW+DCeDpKtGPeYH7km6NtaVeLgcf9XxX6EN+Sj5CxJzpfKGTbhTLax8Vo0TCoTbpGH+qlhvoseH/knk3E7wMY9/qvstCiTx3/DVjhj83EltPB06f07YyHOsaREm71iQaCc0gb5cxVnS/dg6ksLqgGIbXCeW/9hjwtIz0kOt2GQyTb5GhmVs6dvN/9bFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BU1iE8uiEduxFiLngPWmZPLIrI3cSdCmzeRl/3TB6Vw=;
 b=fTdfCq9pM7by95YU+71qR2MERbiu0aIwXOSOlWOjgkFsDrnD7fm2V8Hp+GtycHHPB3HrYvamGK56ygJfdaa+n/z+wreqbVvtCT+lIO29+VToGiDq9vK4sDf6POS8h7OK16HJ0EcTWkAkftWOOjo+0fMzVliZbufQBppkDAaFGsePb1vBZLiSdlWEFKz9j6ttFK99JCt++iuf+Ly9netMSqa68MtcfrCe1/F4HpltCQX6WDsuKPgymA+9uusOkk8dQ41ilVMhYDilUDD2C9SOtv+W31ZyzLzsHlLGJvnq/rgqWkgUz1DgNUYL32W4mubQ/xX4+huu4UvleWvvT+H/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BU1iE8uiEduxFiLngPWmZPLIrI3cSdCmzeRl/3TB6Vw=;
 b=IVpcK+j6wqHa9P/TWqzo+8vwqRU7F3pkV3x7+QIjz9Jtbh7RdZXEe7gR1MnfmTkzIYdWRdEi1XYNQurBSP3wBwx6z1Wk+oMzeYK+ZxW4T53wzvDZ96zue8oz5xl7S4R+sbS7K8mtROT4IMFnbaoZfUflzwMyvBr6K7mIP8az8TA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 17 May 2022 16:48:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Message-ID: <YoO1wt6Wq1+XOXsK@Air-de-Roger>
References: <20220511143059.1826794-1-marmarek@invisiblethingslab.com>
 <c8f95032-1417-adfe-3170-62b39ec0f6ca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8f95032-1417-adfe-3170-62b39ec0f6ca@suse.com>
X-ClientProxiedBy: LO2P265CA0231.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54f7e386-d58b-4a48-130f-08da381454cf
X-MS-TrafficTypeDiagnostic: BN7PR03MB3716:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB3716F2BDD117FE60F811A6338FCE9@BN7PR03MB3716.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S9Mcspw5zImvgpU2jfTJOl7MgfivRMimrisMkWfdjF4ij2QsMHNa6Uy/Et7utYiumc/wPJUopotYG9s2iDmXsoCOsR7uSe6GBgl4gVeVJ2C8jfirebryhZBWLGe7xeef25yYFb2jawgOOfVybaObXDwj6VLQiy92OjYtYAq6+K4e1j6RB4uEoVJ/j2dCErtCSyeAr4c/mYZNUQWS/7836mnMInSAdDATzz2Ba22GMT7M6voNy4oBkOgat7YJLZqveRIivLB73sd/TxvblLXd9UduuL7QjLZxVwFFAtee/UtDN9gL6gtI6mTGYwDl5n8VacJSwpbY31WZlJRDQYv98VWU1LwjHhLwwf0f+/fXjQIEuT0itk1U5hDOPfwNOYHpz9ORRmMmXviW1XoWG8WlgjXU1DFLL3zEfJoDXAat8wR7lW1moBvKlaQRvlUHvRBhru7mx53HSabY2tqm5gLe7+rPQ3ggJI/MF8Kmrt4s/827YAEr9420yNZvbuPRkXuBB+EC26v9JqsicCwhIyy55oFA1drlZOOXKkyxyaZNJUcJGoH7FA54NXWEeM6yu8+ML5Uf/PVqcFyjNzuBpVUnG+odJtAV7ENmBgiWDAi9EZo3BIovACKk/VeVT3ixd2NFRwhyFdSQ3be3Di0ggA5vrDl0NkyBI5SIgZB+KYqGEhuRpMiwuQN+sPSvzgvfuY1LrBoGuhAbNWrWOXDYuyRwNw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(316002)(85182001)(66476007)(2906002)(4744005)(6486002)(4326008)(8676002)(6666004)(38100700002)(86362001)(82960400001)(5660300002)(33716001)(54906003)(6916009)(6506007)(186003)(6512007)(9686003)(53546011)(8936002)(508600001)(66946007)(26005)(66556008)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzQyR0VtUzJjWEpKTVUrNEFGdHM5QXBQc3lRT3h4QVdOZFFGSVp5cUh0MEpN?=
 =?utf-8?B?UGprNHdHYXFlVk9QODdvWUVienh1QnI3NTNBU3JVUy96Q0ZpUTBDdGhtYTB2?=
 =?utf-8?B?MlZsckUvK2FFMmE1bHphSVRNbzlXeWp5UVNMU0pxMDM0bmp3a21hSlE4K0F4?=
 =?utf-8?B?U2JmSk1SNXc5OUdtdjUrNnRvR1lzSy9lYWUvZ3dvYnd4dXVSUGFBTmh2TG5R?=
 =?utf-8?B?NkJWUFhHa2VnOTVqeWRGc2J0SlhUV0wvVXJDQk5odmJ0VlExbzFKTmhGVHFX?=
 =?utf-8?B?c0plN2lKQ0ZTUnk3NllaM3Y2clBxMmxnNWNsVFVFajg1dExXSGxtWFVTMU5u?=
 =?utf-8?B?QThxSUYxTUxkbWcrckhOaXlMc2xkNFdqUEJPMWs0eDZ4eGQ5d0JvNTVFSCtO?=
 =?utf-8?B?VmtnUkEra2p6N1NGVnhKZWs3MDB4M0FWbkZvS1NxYXYydDVzS0NkOEtOV1pB?=
 =?utf-8?B?SnZNT1FiUm9nTUNGTmJvdGhFMUFXbUZDaEdaZTZWY0VoQVByNVRydldGenJV?=
 =?utf-8?B?bXZQVVE3WHRuemR2ditPYWU4enhLbGVhcGtEMTNLMms0N1A4YVNmQTFDRmlr?=
 =?utf-8?B?WmRDemVmZ0d5UWdLbDZseEVaMVRjZXNQbmQ3Z3RjS1JQQUpwcVJTZXNmcHdr?=
 =?utf-8?B?QjZ0QmpucjJlcXN5UVphajV1SWJRdmtENWdEeXNLYkhuNU5NdHdraVV6QmlS?=
 =?utf-8?B?UnYxY2hQU2VxY3d0N1Q5TkljWHZHeC94eXNaOWF4R2ZqZXlsd0RWQjhZRmNo?=
 =?utf-8?B?RG1MZkJGNm1TY0UwODVsQkREWHhHUm1xN085NTE4SVNhOWZVZUg4VjU0bVl1?=
 =?utf-8?B?Z0VaeTFpOWlpS3hoaVd2S0ZGWTVibGJQb2Zxd2Y1Wnc1QWpHT1Rkbm1uU1R5?=
 =?utf-8?B?ZXd2UWN5aEVpUy9mY2lCbnZWUldpbkxjWm9mNHZlOGxRa0tYcGNjWEZYeEhL?=
 =?utf-8?B?UmJyQ0l6MzIxZjJZSDdWQlhBNDFzWVJXa0FPZElLcVh0VWtLcWdLbXVaYnBy?=
 =?utf-8?B?QWtLaGJMbzVpd2VLdkh3bFp4MVV3WVd3ZXlHdGVHMWFyYlFWeG9lRVNQQ1Iy?=
 =?utf-8?B?b1RWM3MwZzZvbWU1S2hPNWdVNW1EQ0IyL1FTRk9HRmJaM0dkUTFKQit1NVVq?=
 =?utf-8?B?R3EwMVBEUG1KYXNPOUtRa0J6S3p4M1RwdWtMV0c5cE5FVE01Zkg4WC9NQVdu?=
 =?utf-8?B?VEpJVG5FOHJrSHdqK2pKZmR2Q2dqdk9ieHI3Vm5BK1YxSnZtUmtCTDByQjcx?=
 =?utf-8?B?VWg1WFVQVXA2aUFscVY3ZXBNUmwwT1VlL256ME4zeHhFVE5TM1NkdDMrL2Ro?=
 =?utf-8?B?SkRCYjVhV21yZDNTd3hXWWZkbkpWTEpLa1ZlTnk3NGFuSlFaaVVjTEtmY1Bx?=
 =?utf-8?B?bFJwdU9TczJkRXh5SUI5SHNFN0tkNFgweHFVT1pMcTJTSW9iQW9IL1lIeVNS?=
 =?utf-8?B?NWViTVpNbDNFeEl4TkFLYW5nU3dZZ0prWi9vTzJvczRjdnBZdFdIREhsWUls?=
 =?utf-8?B?N3pIQTQyM0g4QVFFVGhUcnZzejRmZFBUK1Fvb3FMWFA3T01lQmdxRC9Rc2pa?=
 =?utf-8?B?bFZoNUxVR3ZJRnFVVXJlZ3VyaEJibXExTWdGcndMTWZ3TGxDS0pLWHpRWWN4?=
 =?utf-8?B?WEJVOVJmb24vRUFDV294NlNENmx4a0xqZkU3bW52S0pteWFJQW5hSWRpUXlp?=
 =?utf-8?B?b1hMVkYwUloySVM4OXpkNUxRM21QZmVCQmRpZENqd0l0NEtLSWl2L3kzZXoy?=
 =?utf-8?B?Wm5pS1pQb25RNFpmdlc1eUkraVc5UDgwWjY5SityazRCZlRlZmZmZkt4aWcz?=
 =?utf-8?B?eGtpdkh2Z1VuSGF1Y214SEtKbnNXNFpucGswQmRvVUZIZFlGMXdnbUlVTVpR?=
 =?utf-8?B?OUFsbnl2dmN2SjJWSHAreGpvOWNITDVUUVVxNnR2MXR0WTZ2L3Z6bEczTDh0?=
 =?utf-8?B?Z0dydlBHR2RSVEIzVm1XRjhid1JxM3dSTmtETEVBRmdZK3Rsb3FzckkwMHBu?=
 =?utf-8?B?d3JEQ0NTV1VoQ0dpc0tBQ1dLRHhZeCtPM2w0SjFMbmZPMTltVFpTN2EwN1Fh?=
 =?utf-8?B?UDVZNXZkZWVuNUp5RWRNQjJ0ZkMxWkZCMENBRVFuOUorZ01vd2ZITGIvRnN1?=
 =?utf-8?B?VnBRb1Bac1AxMkMyYXFTWm9CTWpteVBCMkE4aFpnMEJ6b2Z2MDIyNmdRd3U1?=
 =?utf-8?B?Wk5HZTJNdlNqTWI4NGsxRjQvK294TEx2K3pLTFZXcHlMbXNNSlFzZnVVclpU?=
 =?utf-8?B?anR5L1Z3bjkwTjlYcWZUTlNDRTZYaktwVWRZNVR1N3R4K2JBazNxaTVDRyt5?=
 =?utf-8?B?Ly92cFRGRjF4VXlaS2J2UUxmVGxzeWFBRCthY1N2NGp0NUVBOFR3N3BEVkFx?=
 =?utf-8?Q?WAwGFcJhPLN0IwkE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f7e386-d58b-4a48-130f-08da381454cf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 14:48:40.2048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nb5unCIewAKY+nO0cb4yWquaMU1VeiiFKJ7Fq7Fxs+AHczzc8SnELrBSrU/eieiquQD5I9k9EYN++AoUSANTQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3716

On Tue, May 17, 2022 at 04:41:31PM +0200, Jan Beulich wrote:
> On 11.05.2022 16:30, Marek Marczykowski-Górecki wrote:
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -1238,6 +1238,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
> >                              pci_conf_read8(PCI_SBDF(0, b, d, f),
> >                                             PCI_INTERRUPT_LINE) : 0;
> >  
> > +                if ( uart->irq == 0xff )
> > +                    uart->irq = 0;
> > +                if ( !uart->irq )
> > +                    printk(XENLOG_INFO
> > +                           "ns16550: %pp no legacy IRQ, using poll mode\n",
> > +                           &PCI_SBDF(0, b, d, f));
> > +
> >                  return 0;
> >              }
> >          }
> 
> While this code is inside a CONFIG_HAS_PCI conditional, I still
> think - as was previously suggested - that the 1st if() should be
> inside a CONFIG_X86 conditional, to not leave a trap for other
> architectures to fall into.

The CONFIG_HAS_PCI region is itself inside of a (bigger) CONFIG_X86
region already.

Thanks, Roger.

