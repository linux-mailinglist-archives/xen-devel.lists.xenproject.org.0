Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D379F785349
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 10:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589064.920785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYjgs-00056p-HY; Wed, 23 Aug 2023 08:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589064.920785; Wed, 23 Aug 2023 08:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYjgs-00053r-EB; Wed, 23 Aug 2023 08:58:14 +0000
Received: by outflank-mailman (input) for mailman id 589064;
 Wed, 23 Aug 2023 08:58:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dmRg=EI=citrix.com=prvs=59206e676=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qYjgq-00053l-9x
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 08:58:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cd12f6b-4193-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 10:58:08 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2023 04:57:38 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6144.namprd03.prod.outlook.com (2603:10b6:5:397::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 08:57:32 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb%5]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 08:57:32 +0000
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
X-Inumbo-ID: 2cd12f6b-4193-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692781088;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3/TyvNW2GVqOih1sAeJN8t8pMIa15OeTSSTgyzku0A8=;
  b=Y+QtuuMjn7Urcl/YXWVv+KVcomRh+f6B3AHGphTHJWeK7V8RKmsVX1Tf
   0APXQ0ciJZZxSBGl6rqwWrcWy6mPSWZ2tQ7KS70qKHIcRPhvkYjlrOEQj
   oN9ZiblinN4HthZU0eR8FDy96oiCzWYzbQaev3K+UokFt2d8D6rz8z/u5
   c=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 119035283
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FM3Nf62J69iZz6oZ7PbD5btxkn2cJEfYwER7XKvMYLTBsI5bpzVUy
 mIZXzzUMvzfM2f0fN4jPI+z8B5Tvcfcm4UxSVRvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gxkPqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfM0sRq
 9gcKi82Nh2YoMPv6Yq0Ca5+v5F2RCXrFNt3VnBI6xj8VK5jZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6KlFUZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r1376Xxn6hCNl6+LuQ1v5OjUeq/WUvWDIOeQO64uCIk3SyRIcKQ
 6AT0m90xUQoz2SJT8D8Vhv+i36JuDYVXtYWGOo/gCmW0bbd6QudAmkCTxZCZcYguctwQiYlv
 neLld70AT1ksJWOVGmQsLyTqFuaAyEEa08fbCkLZQIA75/op4RbpgLCSJNvHbC4ivXxGCrs2
 HaaoS4mnbIRgMUXkaKh8jjvqjahtpHPQgMvoCnaQ2ml4xlRbYupIYev7DDzxvZaLZ2FT1CH+
 lsDls6f48gHCJ3LnyuIKM02ALy27uyZdh3dhVJiFYMo8TiF8nuvO4tX5VlWLlpzIM8AfjPuf
 0b7tgZY5ZsVN3yvBYdXZIS+D8krlO7ACN3jWdjda9YIaZ90HCel4SVvbAii32nrn2AllK15M
 pCeGftAFl4fAKVjiT+pHeEU1OZzwjhknDuKA5fm0x6gzLySImaPTqsIO0ePaeZ/676YpALS8
 JBUMM7iJwhjbdASqxL/qeY7RW3m51BiVPgad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:geDtKa1FswIwHGM681wlLwqjBdVxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQMEj+Ka+Adwo4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/PwmE0gwYWzZvx65n1W
 TeiQT26oiqrvn+k3bnpiLuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkd6yesCszqOSP7k9vtN
 XXuR8vM+l69nuUVGCophnG3RXmzV8VmjXf4G7dpUGmjd3yRTo8BcYErYVFciHB405lmN1nyq
 pE00+QqpISVHr77W/AzumNcysvulu/oHIkn+JWp3tDUbEGYLsUiYAE5ktaHLoJASq/woE6F+
 tFCt3a+Z9tABunRkGcmlMq7M2nX3w1EBvDak8euvaN2zwTp3x9x1tw/r1qol4wsLYGD7VU7e
 XNNapl0JtUSNUNUK57DOAdBeOqF23kW3v3QSOvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtFQ1Z1nlBaS1rdN2Gyj2MSaAtAnWu4NjD8ATgMy4eFOrC1zNdLkWqbrhnx1FaferH8
 paO/ptcorexCXVaMF0NjbFKulvwEklIbMoU+kAKiOzS+LwW/rXX7/gAYDuDYuoNwoYcUXCJV
 ZGdATPBax7nzKWsznD8VTsZ08=
X-Talos-CUID: =?us-ascii?q?9a23=3AVvRZOmlEBxHTEfs7ECsWpY9AVZjXOU/3kyn0J02?=
 =?us-ascii?q?nMj5kU5q0EHao9+AjgfM7zg=3D=3D?=
X-Talos-MUID: 9a23:ImBiswilrPcYx0Thp5XfnMMpFMdM7r6XM0kxwboel5GFdjVBIg2Rk2Hi
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="119035283"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lb691/LSx7BqV9ASUwL+aoltY/b4bRqs9H1vCciVf08KjcjzX8w+Qt3qwU3Qj6OrzBdvHbzb2MWPBKZXtgcMA4KlOyybTrOTUPMt0d0tcIky49Tq4O50Ukbu4Z00b6TVcZ6Wa90IXdLKsF/kHaqpqXon5EBvLphogpFi0XLyAJsZJy0Lw4q3d36dG2ZelvuC/z37Dbl/OjO1J8THbqQzb8ZgC3zxZWmFGV9RKX3jFuUfjBQwneVjiGtJIc8DQkoZI0Vs9Ld6Sdba3iLDfqbSV8pQZL+uHlCQLenDPl3SJEPOpiJs8B/Dw9pPL4kGtpMa0oK7HbiswOtkbR7C89UGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0nNEOtUxbaY5nSKEukRbat0USR8PkqvD/v6uyh48LA=;
 b=bPXS+A4smp2iu7rK0DR51EsrDnR2xRE3rUjol//x75d66ae8jVEzzpB5wTi0PXUjws/fyw1RiygLVSvnOnJX/g6EH5WgYGOw4gmMNmUaKEgJQ9irM8RscnLpcpVJNIwy0IOgN3HJwcmWz+KKhDxx6aE5RnGnNWLpOe3cVTpwMXz48x+oiSBJ6v/LMlYm08f99NV6AT/tz2GJiSFuxE5h7n0PKrFWwZkN+dQCIRWcifknSrb+81p/7qyX5+JDuFUoJGb6UdjLOGi7lIfvYqcNRmJ0Vnlavj949P9ErUz9apMbJDMuS0HTrcb2I/mWQZpJknU41UvumgvD+MoZAodTxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0nNEOtUxbaY5nSKEukRbat0USR8PkqvD/v6uyh48LA=;
 b=UF42HPGd7vkvuogozK0BUpW11TdXAuIa8zjw2ZD3aU5/eJ9+yACqAixOxU0058lvQDFKjoGR81oxMS8RMXrV/yaFG1tnQfQ6/p74EGr2mFm2hvS1/n3icTjAfoMMcW+RWnrlbF/Nm+qxhuCNkcOkJmCRbwr8po71VW1+mcdeNwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 23 Aug 2023 10:57:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to gsi
Message-ID: <ZOXJ9s8hb96l8ys2@MacBook-Air-de-Roger.local>
References: <e8843d7a-eecc-373c-a6b3-6a893bc0eb2a@suse.com>
 <ZBLg8WB8HCoZvwz5@Air-de-Roger>
 <df607690-0bfb-94a3-fac6-5e20f183dc20@suse.com>
 <alpine.DEB.2.22.394.2303161611220.3359@ubuntu-linux-20-04-desktop>
 <4edb59db-d2b8-122a-fc10-59001857bee0@suse.com>
 <ZBQ4DKJ8ZAroyPIQ@Air-de-Roger>
 <alpine.DEB.2.22.394.2303171115320.3359@ubuntu-linux-20-04-desktop>
 <ZBTEBkaI8q/mrJmv@Air-de-Roger>
 <alpine.DEB.2.22.394.2303171346410.3359@ubuntu-linux-20-04-desktop>
 <BL1PR12MB5849773109F9A9C6AE4D824EE705A@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849773109F9A9C6AE4D824EE705A@BL1PR12MB5849.namprd12.prod.outlook.com>
X-ClientProxiedBy: LO4P265CA0284.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 4864ed53-7253-47a6-70da-08dba3b6fc8e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i+ukRFiS+KwEDuXhnIO1PakxEURLtTAbpMyrUyeE03nB7y2RN9nV4Qk67HemDlarBjzEBLKRddlAmEyXdnkfra576cmcwnwO0KQzvphM7nEn/eeihiBI8pE/zQXOUo9ieLVUQQW8aacWnPBcZuXfMN9T6Pb9yxPO0ph65FuYPgxmc3RE68jJPp5HhL2w5qKN0LvEZDBHD6LOlwKRT+BKR8DXCMsHF2k+fHAjdaUPHARrzBez7s/OBfoYsZ3ng1iUy67BuH07NjyRQFPBgJHA6O27TTFJlADm9BzOk4m/YVdKwSs1OWei90JSDyWHDyxIDeBcdbMbJ/Z14ig/1KZSD73wfM0eVMZ1Ht3nXMwz3TeegsvZpUy9QrFNIo9K4EmoXc81vektvhj3KEUMeA4n4Zbckms7/aacMTuqxrc6Kum2hZpt4ciI2eAEbwllTPW5QMGtmoKayV+R3Dk45Nixo0eCZAE3wAiyrGTbjhRz/ITA+gxC1k+UXhDYltrqcJQS5HDXzymK1SUeV87ZtWFavO9F3HzGaM4Hd7Rju4lgCmwOtM3YH/hMXNt8S/KwbJdK9QpbiYsXWp+H6KKLlBKl/nZxxKJ7x/ES64qDslFhec0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199024)(186009)(1800799009)(86362001)(85182001)(478600001)(5660300002)(8936002)(8676002)(4326008)(26005)(38100700002)(7416002)(83380400001)(2906002)(30864003)(6512007)(9686003)(82960400001)(6506007)(6666004)(53546011)(316002)(6486002)(66476007)(66556008)(54906003)(41300700001)(6916009)(66946007)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RC9JbE9KaU50bXFsdjFkRDRhazVDbWZHMlZ2YTluWlEvbmZjK3MxelVzVGpi?=
 =?utf-8?B?dlBZN0RyMlJpcnBBSklkY0VHUW5zNlJBVjNnQ21hdzU2OFdYdk9TbEhoWDBE?=
 =?utf-8?B?S29QOU0zWGNoRHRMRXprMlVZK1B4aW5Jd0NmQmxSeWY1NDJHZTBkYThhWGhu?=
 =?utf-8?B?bThNQnpaa2J5czdyeU1HNGdFc2dkcmxEU0k1UjBsamNKR1VwSDRKN1FnNmRz?=
 =?utf-8?B?YnhUTk5ab2NtUmI5MXZIUmhyemY4alJRVVZoRzFTVmQ4TC9ZYm91azNLL3RT?=
 =?utf-8?B?bWxjVXNScmRLTmdQNkl5SGlkWDE4ZWhxZWR6b2pOMW9zZVdIZk9QMGRQRkho?=
 =?utf-8?B?ek5odXFWclQ4TlF3Sk43ck52VlkrSDZJandVS3VkbDBPOGZZbExnQURZZjFj?=
 =?utf-8?B?RWNLSGZHb1h0bXkrT0lROGRCR2JkaTRJamVYbDUrdHB0a0NQcHVJUEhWdUtU?=
 =?utf-8?B?c0V0WXJwTCs5bU85VEZMSmpwWS9YWk1kYnJoY05UbzBnQmI3eHh1RGRTL1Vs?=
 =?utf-8?B?VDBOUVpBTktXb1NmY0tEQmoyVVA1YTF1Vm9VMGN4SEpPcG5lQTFkelRMcGdU?=
 =?utf-8?B?NUVxcGRMeFVIU3BDQU1zeGlHUXNaOWhvWWJLdzJDTy80S2NUWUExa0hOcVVR?=
 =?utf-8?B?RldwVDNua0p1RXJWNGw2WmNKMVpOVlY4L0t2K09ReXlmaUxCcTg0L0hTU2xX?=
 =?utf-8?B?cnpROWRNY2VyeWZHdmdZYkNNOGJLNzYzWndOVE9QVUNqNTY2UEU2bVF2a1dq?=
 =?utf-8?B?M2srOVQ1dzFTRjgzSUEzM1lEMHo0Z0VZOG43eHVGc2pjMWVvTmgvT1c2c3c1?=
 =?utf-8?B?U3NlVlhnR0p2dEFrSk96Q3I3ajZjV0h3UWVibGNmVk8weXBQcUt3em5mY0lJ?=
 =?utf-8?B?RFpqUURIS3BaR05PMVEvZlRLK3NDeW9Qa0pzVVIwdHplL3FsTE8yenJOb0k2?=
 =?utf-8?B?L2I0SnE4eWUveGI0TG03cXhNTDNQd0tySjlSWDlnVG9zS0dacDBMMUUxYjNx?=
 =?utf-8?B?ZmtNVmRQQkVpajlOcitJYlUvd1EyTnoyYy90OHRtSXJ6NVN5NTlLcDBKUy9q?=
 =?utf-8?B?S0VqTmRxQWJUUUFnbHd2WE5SZ3hLRjcyejBwdTcvYjlMcERoUU5CRk10WHAv?=
 =?utf-8?B?eHR1NFgyS0dsTkxyWG83cEhMRlVHVnpOd0Z3bVovSDVkdHVqNnNsWDVhQlVG?=
 =?utf-8?B?UVNrYVk2VmE0Vy8xZjJZMWJ0TDlkYnFsUkR4eTRBRUt0Q053VFQ5bmMwZDdP?=
 =?utf-8?B?SHJrVVY5RlF5TlVqNm4xODNtOVp1VkczMVk1dVNWc1VCNXJsT29qZHZUeVBS?=
 =?utf-8?B?TmVNU0JXdENDRDV3dW5MNjB0Y05ydkdCbEhjb01zTEZORnZCU1ZTQ09HeHFO?=
 =?utf-8?B?SnJxZUV2NDhtWWlCemh3NXJDRG8ya2UvYmhkblhFTWlsQzlJZkt6aVdFM3o0?=
 =?utf-8?B?YXpqdmgraFZ5cjNSLzcvdUJ6VUZWMHJXVlZuZG1oQ3FtdmVaMHYvVXc4U0lN?=
 =?utf-8?B?MnYxekIvSjNELy9BNlgwaE00RnoyWkhWL0wvZ1ppL3ZQVkl1WGZEM1pndmxR?=
 =?utf-8?B?R3JNeTI4cFZvSHNrVTlwa3N3WUZ6UktqK2o1RUVTdDAxNEV1bHBQTXd0SHlQ?=
 =?utf-8?B?akh3c3Y5Vkt0S09PNUNIUnFnRkpGVDhtckgrWTk0ZlBFY1pRZXRldGlhSHVX?=
 =?utf-8?B?cExUL2FCTVFlaFpGMTM4bXl5STluMmQ5U2tVOWliWnBXcHk1N3B4OEJIbmgv?=
 =?utf-8?B?dlpZUm5sUSt5THhPU1V3amFlRVhBV3ZHRzdqMmZVVGVReVYzVS81MHRlRjQ2?=
 =?utf-8?B?QUF1eUtVWGlrd3lMeVVwZEJQR2pTS25OWUdNUkloQS91VXBWbGs4b2VETUI1?=
 =?utf-8?B?ZFppcWFJNng1YVVFdmVhVkoxc2txUEEvWHQvcnpJOW5lMWoxSXBDWE5TM0lz?=
 =?utf-8?B?MENsdWRVUERmWUpXVlFCYm4rYVZzRGxQT0FoV0VaRWQrVzBTVTZuZFpvbENz?=
 =?utf-8?B?YzFqS1RwVlA3eGRrV1B0cmN0YnJUQUVnNVlXRFRJNVRkV2RNeGg1c2cvYk55?=
 =?utf-8?B?aU1rbTFRczNPRnJ4Y0dqUHVGeG12ZXROMzJIZkc5RkZrUUZuM1A1R3FKRkI1?=
 =?utf-8?B?SHlXanJsU2lBZGE1MER0WU9sUlFma3hmZkJlYUthUUVUOFlKYW5sMjM4bWRV?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bd1FGcQxwqQsktfAIHbL8xKZX7aHo3CSZ3TmlrVmAbWDPpwyE7kDsywtKWsjGGBAeHeGKk3+vtxP0Ci6LKznjYHrXq0W4lUMCYYWMcv9S6pMlw8OtbNcBRamlkE1aqIG0ZLuIzJ2BumwSf9BN1dNOAl+vZDVjT8f8HdDemthpeTDlAWjdTSLf87CFwXRRi4BMHwZ8MCtdrG7qAJJx1kU2rwTTHEGNr5uLFrXzU5IAlon+K/niwxW38YUe3MJzLJrthtMVbSpZ7bmr0taUZ3WunAEogwT66ByWHAnGl9HXwq6V+xu18lQ7D1KCMnFlCjbB+aKC8ViFBJC4luP1RF+nh1W4X+iBda2b6pDCLZVsqK1ri3ghxAvncOx7F4h4k9PuMgXGw0ftBFlm5jAT/pnvLcobv44GoAalOcLjf0FRFkPkPZFYA/+1UTGBOG9Z4OFLpE7QuyRb2vcRPMoW6OIL5r0Z9+FlqeLbKOvFq4N16rOV9QXdLlaHyjQvLLCfb1Ti9wYeMMCqHt/VjwDFxw1uMIXvJivABF1wR5rEZtH+dRDiYPTxnMvM1/2fmuFCcGDLUzVrsBQuCcJ3BXLBLTNUUYgxaf+EkdSNpOSxLbOcOVn4943LSIfFhgIsZzGWOJNtczGtK6Uyfh3eQt8+BFlS0HPeRNi/JfGbCWqtYAQWc3VqRlV1vfbPzNJu34VC6exQNduusmYgTaNRHp/jlDJMDPblaEJfMS+qInattnbO+DyLc3NrUlJdMRmvtAia9jUyf2Cck1D21NDVA4I3xOxIpd/FWXPEcERF+t7nJPy/rlTITVngus1BwdqFkUYmKailKP5Ybxyil0pJViduC7TB6tchMEyC2FvwnVK2rnj/ORKCoXhQ4yoLaGMtK853EYk
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4864ed53-7253-47a6-70da-08dba3b6fc8e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 08:57:32.3337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCYD3DVa2alNT0a8UqzcFS8HCKSVkZ5YVsiPoLly9TaFjhgCG1e6uksf8vQUKjixiwy+bMdt+HUHM8zbmgIIRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6144

On Mon, Jul 31, 2023 at 04:40:35PM +0000, Chen, Jiqian wrote:
> Hi,
> 
> On 2023/3/18 04:55, Stefano Stabellini wrote:
> > On Fri, 17 Mar 2023, Roger Pau Monné wrote:
> >> On Fri, Mar 17, 2023 at 11:15:37AM -0700, Stefano Stabellini wrote:
> >>> On Fri, 17 Mar 2023, Roger Pau Monné wrote:
> >>>> On Fri, Mar 17, 2023 at 09:39:52AM +0100, Jan Beulich wrote:
> >>>>> On 17.03.2023 00:19, Stefano Stabellini wrote:
> >>>>>> On Thu, 16 Mar 2023, Jan Beulich wrote:
> >>>>>>> So yes, it then all boils down to that Linux-
> >>>>>>> internal question.
> >>>>>>
> >>>>>> Excellent question but we'll have to wait for Ray as he is the one with
> >>>>>> access to the hardware. But I have this data I can share in the
> >>>>>> meantime:
> >>>>>>
> >>>>>> [    1.260378] IRQ to pin mappings:
> >>>>>> [    1.260387] IRQ1 -> 0:1
> >>>>>> [    1.260395] IRQ2 -> 0:2
> >>>>>> [    1.260403] IRQ3 -> 0:3
> >>>>>> [    1.260410] IRQ4 -> 0:4
> >>>>>> [    1.260418] IRQ5 -> 0:5
> >>>>>> [    1.260425] IRQ6 -> 0:6
> >>>>>> [    1.260432] IRQ7 -> 0:7
> >>>>>> [    1.260440] IRQ8 -> 0:8
> >>>>>> [    1.260447] IRQ9 -> 0:9
> >>>>>> [    1.260455] IRQ10 -> 0:10
> >>>>>> [    1.260462] IRQ11 -> 0:11
> >>>>>> [    1.260470] IRQ12 -> 0:12
> >>>>>> [    1.260478] IRQ13 -> 0:13
> >>>>>> [    1.260485] IRQ14 -> 0:14
> >>>>>> [    1.260493] IRQ15 -> 0:15
> >>>>>> [    1.260505] IRQ106 -> 1:8
> >>>>>> [    1.260513] IRQ112 -> 1:4
> >>>>>> [    1.260521] IRQ116 -> 1:13
> >>>>>> [    1.260529] IRQ117 -> 1:14
> >>>>>> [    1.260537] IRQ118 -> 1:15
> >>>>>> [    1.260544] .................................... done.
> >>>>>
> >>>>> And what does Linux think are IRQs 16 ... 105? Have you compared with
> >>>>> Linux running baremetal on the same hardware?
> >>>>
> >>>> So I have some emails from Ray from he time he was looking into this,
> >>>> and on Linux dom0 PVH dmesg there is:
> >>>>
> >>>> [    0.065063] IOAPIC[0]: apic_id 33, version 17, address 0xfec00000, GSI 0-23
> >>>> [    0.065096] IOAPIC[1]: apic_id 34, version 17, address 0xfec01000, GSI 24-55
> >>>>
> >>>> So it seems the vIO-APIC data provided by Xen to dom0 is at least
> >>>> consistent.
> >>>>  
> >>>>>> And I think Ray traced the point in Linux where Linux gives us an IRQ ==
> >>>>>> 112 (which is the one causing issues):
> >>>>>>
> >>>>>> __acpi_register_gsi->
> >>>>>>         acpi_register_gsi_ioapic->
> >>>>>>                 mp_map_gsi_to_irq->
> >>>>>>                         mp_map_pin_to_irq->
> >>>>>>                                 __irq_resolve_mapping()
> >>>>>>
> >>>>>>         if (likely(data)) {
> >>>>>>                 desc = irq_data_to_desc(data);
> >>>>>>                 if (irq)
> >>>>>>                         *irq = data->irq;
> >>>>>>                 /* this IRQ is 112, IO-APIC-34 domain */
> >>>>>>         }
> >>>>
> >>>>
> >>>> Could this all be a result of patch 4/5 in the Linux series ("[RFC
> >>>> PATCH 4/5] x86/xen: acpi registers gsi for xen pvh"), where a different
> >>>> __acpi_register_gsi hook is installed for PVH in order to setup GSIs
> >>>> using PHYSDEV ops instead of doing it natively from the IO-APIC?
> >>>>
> >>>> FWIW, the introduced function in that patch
> >>>> (acpi_register_gsi_xen_pvh()) seems to unconditionally call
> >>>> acpi_register_gsi_ioapic() without checking if the GSI is already
> >>>> registered, which might lead to multiple IRQs being allocated for the
> >>>> same underlying GSI?
> >>>
> >>> I understand this point and I think it needs investigating.
> >>>
> >>>
> >>>> As I commented there, I think that approach is wrong.  If the GSI has
> >>>> not been mapped in Xen (because dom0 hasn't unmasked the respective
> >>>> IO-APIC pin) we should add some logic in the toolstack to map it
> >>>> before attempting to bind.
> >>>
> >>> But this statement confuses me. The toolstack doesn't get involved in
> >>> IRQ setup for PCI devices for HVM guests?
> >>
> >> It does for GSI interrupts AFAICT, see pci_add_dm_done() and the call
> >> to xc_physdev_map_pirq().  I'm not sure whether that's a remnant that
> >> cold be removed (maybe for qemu-trad only?) or it's also required by
> >> QEMU upstream, I would have to investigate more.
> > 
> > You are right. I am not certain, but it seems like a mistake in the
> > toolstack to me. In theory, pci_add_dm_done should only be needed for PV
> > guests, not for HVM guests. I am not sure. But I can see the call to
> > xc_physdev_map_pirq you were referring to now.
> > 
> > 
> >> It's my understanding it's in pci_add_dm_done() where Ray was getting
> >> the mismatched IRQ vs GSI number.
> > 
> > I think the mismatch was actually caused by the xc_physdev_map_pirq call
> > from QEMU, which makes sense because in any case it should happen before
> > the same call done by pci_add_dm_done (pci_add_dm_done is called after
> > sending the pci passthrough QMP command to QEMU). So the first to hit
> > the IRQ!=GSI problem would be QEMU.
> 
> 
> Sorry for replying to you so late. And thank you all for review. I realized that your questions mainly focus on the following points: 1. Why irq is not equal with gsi? 2. Why I do the translations between irq and gsi? 3. Why I call PHYSDEVOP_map_pirq in acpi_register_gsi_xen_pvh()? 4. Why I call PHYSDEVOP_setup_gsi in acpi_register_gsi_xen_pvh()? 
> Please forgive me for making a summary response first. And I am looking forward to your comments.

Sorry, it's been a bit since that conversation, so my recollection is
vague.

One of the questions was why acpi_register_gsi_xen_pvh() is needed.  I
think the patch that introduced it on Linux didn't have much of a
commit description.

> 1. Why irq is not equal with gsi?
> As far as I know, irq is dynamically allocated according to gsi, they are not necessarily equal.
> When I run "sudo xl pci-assignable-add 03:00.0" to assign passthrough device(Taking dGPU on my environment as an example, which gsi is 28). It will call into acpi_register_gsi_ioapic to get irq, the callstack is: 
> acpi_register_gsi_ioapic
> 	mp_map_gsi_to_irq
> 		mp_map_pin_to_irq
> 			irq_find_mapping(if gsi has been mapped to an irq before, it will return corresponding irq here)
> 			alloc_irq_from_domain
> 				__irq_domain_alloc_irqs
> 					irq_domain_alloc_descs
> 						__irq_alloc_descs

Won't you perform double GSI registrations with Xen if both
acpi_register_gsi_ioapic() and acpi_register_gsi_xen_pvh() are used?

> 
> If you add some printings like below:
> ---------------------------------------------------------------------------------------------------------------------------------------------
> diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
> index a868b76cd3d4..970fd461be7a 100644
> --- a/arch/x86/kernel/apic/io_apic.c
> +++ b/arch/x86/kernel/apic/io_apic.c
> @@ -1067,6 +1067,8 @@ static int mp_map_pin_to_irq(u32 gsi, int idx, int ioapic, int pin,
>                 }
>         }
>         mutex_unlock(&ioapic_mutex);
> +       printk("cjq_debug mp_map_pin_to_irq gsi: %u, irq: %d, idx: %d, ioapic: %d, pin: %d\n",
> +                       gsi, irq, idx, ioapic, pin);
> 
>         return irq;
>  }
> diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
> index 5db0230aa6b5..4e9613abbe96 100644
> --- a/kernel/irq/irqdesc.c
> +++ b/kernel/irq/irqdesc.c
> @@ -786,6 +786,8 @@ __irq_alloc_descs(int irq, unsigned int from, unsigned int cnt, int node,
>         start = bitmap_find_next_zero_area(allocated_irqs, IRQ_BITMAP_BITS,
>                                            from, cnt, 0);
>         ret = -EEXIST;
> +       printk("cjq_debug __irq_alloc_descs irq: %d, from: %u, cnt: %u, node: %d, start: %d, nr_irqs: %d\n",
> +                       irq, from, cnt, node, start, nr_irqs);
>         if (irq >=0 && start != irq)
>                 goto unlock;
> ---------------------------------------------------------------------------------------------------------------------------------------------
> You will get output on PVH dom0:
> 
> [    0.181560] cjq_debug __irq_alloc_descs irq: 1, from: 1, cnt: 1, node: -1, start: 1, nr_irqs: 1096
> [    0.181639] cjq_debug mp_map_pin_to_irq gsi: 1, irq: 1, idx: 2, ioapic: 0, pin: 1
> [    0.181641] cjq_debug __irq_alloc_descs irq: 2, from: 2, cnt: 1, node: -1, start: 2, nr_irqs: 1096
> [    0.181682] cjq_debug mp_map_pin_to_irq gsi: 2, irq: 2, idx: 0, ioapic: 0, pin: 2
> [    0.181683] cjq_debug __irq_alloc_descs irq: 3, from: 3, cnt: 1, node: -1, start: 3, nr_irqs: 1096
> [    0.181715] cjq_debug mp_map_pin_to_irq gsi: 3, irq: 3, idx: 3, ioapic: 0, pin: 3
> [    0.181716] cjq_debug __irq_alloc_descs irq: 4, from: 4, cnt: 1, node: -1, start: 4, nr_irqs: 1096
> [    0.181751] cjq_debug mp_map_pin_to_irq gsi: 4, irq: 4, idx: 4, ioapic: 0, pin: 4
> [    0.181752] cjq_debug __irq_alloc_descs irq: 5, from: 5, cnt: 1, node: -1, start: 5, nr_irqs: 1096
> [    0.181783] cjq_debug mp_map_pin_to_irq gsi: 5, irq: 5, idx: 5, ioapic: 0, pin: 5
> [    0.181784] cjq_debug __irq_alloc_descs irq: 6, from: 6, cnt: 1, node: -1, start: 6, nr_irqs: 1096
> [    0.181813] cjq_debug mp_map_pin_to_irq gsi: 6, irq: 6, idx: 6, ioapic: 0, pin: 6
> [    0.181814] cjq_debug __irq_alloc_descs irq: 7, from: 7, cnt: 1, node: -1, start: 7, nr_irqs: 1096
> [    0.181856] cjq_debug mp_map_pin_to_irq gsi: 7, irq: 7, idx: 7, ioapic: 0, pin: 7
> [    0.181857] cjq_debug __irq_alloc_descs irq: 8, from: 8, cnt: 1, node: -1, start: 8, nr_irqs: 1096
> [    0.181888] cjq_debug mp_map_pin_to_irq gsi: 8, irq: 8, idx: 8, ioapic: 0, pin: 8
> [    0.181889] cjq_debug __irq_alloc_descs irq: 9, from: 9, cnt: 1, node: -1, start: 9, nr_irqs: 1096
> [    0.181918] cjq_debug mp_map_pin_to_irq gsi: 9, irq: 9, idx: 1, ioapic: 0, pin: 9
> [    0.181919] cjq_debug __irq_alloc_descs irq: 10, from: 10, cnt: 1, node: -1, start: 10, nr_irqs: 1096
> [    0.181950] cjq_debug mp_map_pin_to_irq gsi: 10, irq: 10, idx: 9, ioapic: 0, pin: 10
> [    0.181951] cjq_debug __irq_alloc_descs irq: 11, from: 11, cnt: 1, node: -1, start: 11, nr_irqs: 1096
> [    0.181977] cjq_debug mp_map_pin_to_irq gsi: 11, irq: 11, idx: 10, ioapic: 0, pin: 11
> [    0.181979] cjq_debug __irq_alloc_descs irq: 12, from: 12, cnt: 1, node: -1, start: 12, nr_irqs: 1096
> [    0.182006] cjq_debug mp_map_pin_to_irq gsi: 12, irq: 12, idx: 11, ioapic: 0, pin: 12
> [    0.182007] cjq_debug __irq_alloc_descs irq: 13, from: 13, cnt: 1, node: -1, start: 13, nr_irqs: 1096
> [    0.182034] cjq_debug mp_map_pin_to_irq gsi: 13, irq: 13, idx: 12, ioapic: 0, pin: 13
> [    0.182035] cjq_debug __irq_alloc_descs irq: 14, from: 14, cnt: 1, node: -1, start: 14, nr_irqs: 1096
> [    0.182066] cjq_debug mp_map_pin_to_irq gsi: 14, irq: 14, idx: 13, ioapic: 0, pin: 14
> [    0.182067] cjq_debug __irq_alloc_descs irq: 15, from: 15, cnt: 1, node: -1, start: 15, nr_irqs: 1096
> [    0.182095] cjq_debug mp_map_pin_to_irq gsi: 15, irq: 15, idx: 14, ioapic: 0, pin: 15
> [    0.186111] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 24, nr_irqs: 1096
> [    0.186111] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 25, nr_irqs: 1096
> [    0.186111] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 26, nr_irqs: 1096
> [    0.186111] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 27, nr_irqs: 1096
> [    0.186111] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 28, nr_irqs: 1096
> [    0.186111] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 29, nr_irqs: 1096
> [    0.186111] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 30, nr_irqs: 1096
> [    0.186111] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 31, nr_irqs: 1096
> [    0.186111] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 32, nr_irqs: 1096
> [    0.188491] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 33, nr_irqs: 1096
> [    0.188491] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 34, nr_irqs: 1096
> [    0.188491] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 35, nr_irqs: 1096
> [    0.188491] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 36, nr_irqs: 1096
> [    0.188491] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 37, nr_irqs: 1096
> [    0.192282] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 38, nr_irqs: 1096
> [    0.192282] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 39, nr_irqs: 1096
> [    0.192282] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 40, nr_irqs: 1096
> [    0.192282] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 41, nr_irqs: 1096
> [    0.192282] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 42, nr_irqs: 1096
> [    0.196208] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 43, nr_irqs: 1096
> [    0.196208] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 44, nr_irqs: 1096
> [    0.196208] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 45, nr_irqs: 1096
> [    0.196208] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 46, nr_irqs: 1096
> [    0.196208] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 47, nr_irqs: 1096
> [    0.198199] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 48, nr_irqs: 1096
> [    0.198416] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 49, nr_irqs: 1096
> [    0.198460] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 50, nr_irqs: 1096
> [    0.198489] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 51, nr_irqs: 1096
> [    0.198523] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 52, nr_irqs: 1096
> [    0.201315] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 53, nr_irqs: 1096
> [    0.202174] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 54, nr_irqs: 1096
> [    0.202225] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 55, nr_irqs: 1096
> [    0.202259] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 56, nr_irqs: 1096
> [    0.202291] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 57, nr_irqs: 1096
> [    0.205239] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 58, nr_irqs: 1096
> [    0.205239] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 59, nr_irqs: 1096
> [    0.205239] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 60, nr_irqs: 1096
> [    0.205239] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 61, nr_irqs: 1096
> [    0.205239] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 62, nr_irqs: 1096
> [    0.208653] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 63, nr_irqs: 1096
> [    0.208653] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 64, nr_irqs: 1096
> [    0.208653] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 65, nr_irqs: 1096
> [    0.208653] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 66, nr_irqs: 1096
> [    0.208653] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 67, nr_irqs: 1096
> [    0.210169] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 68, nr_irqs: 1096
> [    0.210322] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 69, nr_irqs: 1096
> [    0.210370] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 70, nr_irqs: 1096
> [    0.210403] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 71, nr_irqs: 1096
> [    0.210436] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 72, nr_irqs: 1096
> [    0.213190] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 73, nr_irqs: 1096
> [    0.213190] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 74, nr_irqs: 1096
> [    0.213190] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 75, nr_irqs: 1096
> [    0.213190] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 76, nr_irqs: 1096
> [    0.214151] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 77, nr_irqs: 1096
> [    0.217075] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 78, nr_irqs: 1096
> [    0.217075] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 79, nr_irqs: 1096
> [    0.217075] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 80, nr_irqs: 1096
> [    0.217075] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 81, nr_irqs: 1096
> [    0.217075] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 82, nr_irqs: 1096
> [    0.220389] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 83, nr_irqs: 1096
> [    0.220389] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 84, nr_irqs: 1096
> [    0.220389] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 85, nr_irqs: 1096
> [    0.220389] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 86, nr_irqs: 1096
> [    0.220389] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 87, nr_irqs: 1096
> [    0.222215] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 88, nr_irqs: 1096
> [    0.222366] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 89, nr_irqs: 1096
> [    0.222410] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 90, nr_irqs: 1096
> [    0.222447] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 91, nr_irqs: 1096
> [    0.222478] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 92, nr_irqs: 1096
> [    0.225490] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 93, nr_irqs: 1096
> [    0.226225] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 94, nr_irqs: 1096
> [    0.226268] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 95, nr_irqs: 1096
> [    0.226300] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 96, nr_irqs: 1096
> [    0.226329] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 97, nr_irqs: 1096
> [    0.229057] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 98, nr_irqs: 1096
> [    0.229057] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 99, nr_irqs: 1096
> [    0.229057] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 100, nr_irqs: 1096
> [    0.229057] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 101, nr_irqs: 1096
> [    0.229057] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 102, nr_irqs: 1096
> [    0.232399] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 103, nr_irqs: 1096
> [    0.248854] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 104, nr_irqs: 1096
> [    0.250609] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 105, nr_irqs: 1096
> [    0.372343] cjq_debug mp_map_pin_to_irq gsi: 9, irq: 9, idx: 1, ioapic: 0, pin: 9
> [    0.720950] cjq_debug mp_map_pin_to_irq gsi: 8, irq: 8, idx: 8, ioapic: 0, pin: 8
> [    0.721052] cjq_debug mp_map_pin_to_irq gsi: 13, irq: 13, idx: 12, ioapic: 0, pin: 13
> [    1.254825] cjq_debug mp_map_pin_to_irq gsi: 7, irq: -16, idx: 7, ioapic: 0, pin: 7
> [    1.333081] cjq_debug mp_map_pin_to_irq gsi: 1, irq: 1, idx: 2, ioapic: 0, pin: 1
> [    1.375882] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 106, nr_irqs: 1096
> [    1.375951] cjq_debug mp_map_pin_to_irq gsi: 32, irq: 106, idx: -1, ioapic: 1, pin: 8
> [    1.376072] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 107, nr_irqs: 1096
> [    1.376121] cjq_debug mp_map_pin_to_irq gsi: 37, irq: 107, idx: -1, ioapic: 1, pin: 13
> [    1.472551] cjq_debug mp_map_pin_to_irq gsi: 37, irq: 107, idx: -1, ioapic: 1, pin: 13
> [    1.472697] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 107, nr_irqs: 1096
> [    1.472751] cjq_debug mp_map_pin_to_irq gsi: 38, irq: 107, idx: -1, ioapic: 1, pin: 14
> [    1.484290] cjq_debug mp_map_pin_to_irq gsi: 38, irq: 107, idx: -1, ioapic: 1, pin: 14
> [    1.768163] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 107, nr_irqs: 1096
> [    1.768627] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 108, nr_irqs: 1096
> [    1.769059] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 109, nr_irqs: 1096
> [    1.769694] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 110, nr_irqs: 1096
> [    1.770169] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 111, nr_irqs: 1096
> [    1.770697] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 112, nr_irqs: 1096
> [    1.770738] cjq_debug mp_map_pin_to_irq gsi: 28, irq: 112, idx: -1, ioapic: 1, pin: 4
> [    1.770789] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 113, nr_irqs: 1096
> [    1.771230] cjq_debug mp_map_pin_to_irq gsi: 28, irq: 112, idx: -1, ioapic: 1, pin: 4
> [    1.771278] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 114, nr_irqs: 1096
> [    2.127884] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 115, nr_irqs: 1096
> [    3.207419] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 116, nr_irqs: 1096
> [    3.207730] cjq_debug mp_map_pin_to_irq gsi: 37, irq: 116, idx: -1, ioapic: 1, pin: 13
> [    3.208120] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 117, nr_irqs: 1096
> [    3.208475] cjq_debug mp_map_pin_to_irq gsi: 36, irq: 117, idx: -1, ioapic: 1, pin: 12
> [    3.208478] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 118, nr_irqs: 1096
> [    3.208861] cjq_debug mp_map_pin_to_irq gsi: 37, irq: 116, idx: -1, ioapic: 1, pin: 13
> [    3.208933] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 119, nr_irqs: 1096
> [    3.209127] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 120, nr_irqs: 1096
> [    3.209383] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 121, nr_irqs: 1096
> [    3.209863] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 122, nr_irqs: 1096
> [    3.211439] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 123, nr_irqs: 1096
> [    3.211833] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 124, nr_irqs: 1096
> [    3.212873] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 125, nr_irqs: 1096
> [    3.243514] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 126, nr_irqs: 1096
> [    3.243689] cjq_debug mp_map_pin_to_irq gsi: 38, irq: 126, idx: -1, ioapic: 1, pin: 14
> [    3.244293] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 127, nr_irqs: 1096
> [    3.244534] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 128, nr_irqs: 1096
> [    3.244714] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 129, nr_irqs: 1096
> [    3.244911] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 130, nr_irqs: 1096
> [    3.245096] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 131, nr_irqs: 1096
> [    3.245633] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 132, nr_irqs: 1096
> [    3.247890] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 133, nr_irqs: 1096
> [    3.248192] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 134, nr_irqs: 1096
> [    3.271093] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 135, nr_irqs: 1096
> [    3.307045] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 136, nr_irqs: 1096
> [    3.307162] cjq_debug mp_map_pin_to_irq gsi: 48, irq: 136, idx: -1, ioapic: 1, pin: 24
> [    3.307223] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 137, nr_irqs: 1096
> [    3.331183] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 137, nr_irqs: 1096
> [    3.331295] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 138, nr_irqs: 1096
> [    3.331366] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 139, nr_irqs: 1096
> [    3.331438] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 140, nr_irqs: 1096
> [    3.331511] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 141, nr_irqs: 1096
> [    3.331579] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 142, nr_irqs: 1096
> [    3.331646] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 143, nr_irqs: 1096
> [    3.331713] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 144, nr_irqs: 1096
> [    3.331780] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 145, nr_irqs: 1096
> [    3.331846] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 146, nr_irqs: 1096
> [    3.331913] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 147, nr_irqs: 1096
> [    3.331984] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 148, nr_irqs: 1096
> [    3.332051] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 149, nr_irqs: 1096
> [    3.332118] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 150, nr_irqs: 1096
> [    3.332183] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 151, nr_irqs: 1096
> [    3.332252] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 152, nr_irqs: 1096
> [    3.332319] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 153, nr_irqs: 1096
> [    8.010370] cjq_debug mp_map_pin_to_irq gsi: 37, irq: 116, idx: -1, ioapic: 1, pin: 13
> [    9.545439] cjq_debug mp_map_pin_to_irq gsi: 36, irq: 117, idx: -1, ioapic: 1, pin: 12
> [    9.545713] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 154, nr_irqs: 1096
> [    9.546034] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 155, nr_irqs: 1096
> [    9.687796] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 156, nr_irqs: 1096
> [    9.687979] cjq_debug mp_map_pin_to_irq gsi: 39, irq: 156, idx: -1, ioapic: 1, pin: 15
> [    9.688057] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 157, nr_irqs: 1096
> [    9.921038] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 158, nr_irqs: 1096
> [    9.921210] cjq_debug mp_map_pin_to_irq gsi: 29, irq: 158, idx: -1, ioapic: 1, pin: 5
> [    9.921403] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 159, nr_irqs: 1096
> [    9.926373] cjq_debug mp_map_pin_to_irq gsi: 39, irq: 156, idx: -1, ioapic: 1, pin: 15
> [    9.926747] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 160, nr_irqs: 1096
> [    9.928201] cjq_debug mp_map_pin_to_irq gsi: 36, irq: 117, idx: -1, ioapic: 1, pin: 12
> [    9.928488] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 161, nr_irqs: 1096
> [   10.653915] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 162, nr_irqs: 1096
> [   10.656257] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 163, nr_irqs: 1096
> 
> You can find that the allocation of irq is not always based on the value of gsi. It follows the principle of requesting first, distributing first, like gsi 32 get 106 but gsi 28 get 112. And not only acpi_register_gsi_ioapic() will call into __irq_alloc_descs, but other functions will call, even earlier.
> Above output is like baremetal. So, we can get conclusion irq != gsi. See below output on linux:

It does seem weird to me that it does identity map legacy IRQs (<16),
but then for GSI >= 16 it starts assigning IRQs in the 100 range.

What uses the IRQ range [24, 105]?

Also IIRC on a PV dom0 GSIs are identity mapped to IRQs on Linux?  Or
maybe that's just a side effect of GSIs being identity mapped into
PIRQs by Xen?

> [    0.105053] cjq_debug mp_map_pin_to_irq gsi: 1, irq: 1, idx: 2, ioapic: 0, pin: 1
> [    0.105061] cjq_debug mp_map_pin_to_irq gsi: 2, irq: 0, idx: 0, ioapic: 0, pin: 2
> [    0.105069] cjq_debug mp_map_pin_to_irq gsi: 3, irq: 3, idx: 3, ioapic: 0, pin: 3
> [    0.105078] cjq_debug mp_map_pin_to_irq gsi: 4, irq: 4, idx: 4, ioapic: 0, pin: 4
> [    0.105086] cjq_debug mp_map_pin_to_irq gsi: 5, irq: 5, idx: 5, ioapic: 0, pin: 5
> [    0.105094] cjq_debug mp_map_pin_to_irq gsi: 6, irq: 6, idx: 6, ioapic: 0, pin: 6
> [    0.105103] cjq_debug mp_map_pin_to_irq gsi: 7, irq: 7, idx: 7, ioapic: 0, pin: 7
> [    0.105111] cjq_debug mp_map_pin_to_irq gsi: 8, irq: 8, idx: 8, ioapic: 0, pin: 8
> [    0.105119] cjq_debug mp_map_pin_to_irq gsi: 9, irq: 9, idx: 1, ioapic: 0, pin: 9
> [    0.105127] cjq_debug mp_map_pin_to_irq gsi: 10, irq: 10, idx: 9, ioapic: 0, pin: 10
> [    0.105136] cjq_debug mp_map_pin_to_irq gsi: 11, irq: 11, idx: 10, ioapic: 0, pin: 11
> [    0.105144] cjq_debug mp_map_pin_to_irq gsi: 12, irq: 12, idx: 11, ioapic: 0, pin: 12
> [    0.105152] cjq_debug mp_map_pin_to_irq gsi: 13, irq: 13, idx: 12, ioapic: 0, pin: 13
> [    0.105160] cjq_debug mp_map_pin_to_irq gsi: 14, irq: 14, idx: 13, ioapic: 0, pin: 14
> [    0.105169] cjq_debug mp_map_pin_to_irq gsi: 15, irq: 15, idx: 14, ioapic: 0, pin: 15
> [    0.398134] cjq_debug mp_map_pin_to_irq gsi: 9, irq: 9, idx: 1, ioapic: 0, pin: 9
> [    1.169293] cjq_debug mp_map_pin_to_irq gsi: 8, irq: 8, idx: 8, ioapic: 0, pin: 8
> [    1.169394] cjq_debug mp_map_pin_to_irq gsi: 13, irq: 13, idx: 12, ioapic: 0, pin: 13
> [    1.323132] cjq_debug mp_map_pin_to_irq gsi: 7, irq: 7, idx: 7, ioapic: 0, pin: 7
> [    1.345425] cjq_debug mp_map_pin_to_irq gsi: 1, irq: 1, idx: 2, ioapic: 0, pin: 1
> [    1.375502] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 24, nr_irqs: 1096
> [    1.375575] cjq_debug mp_map_pin_to_irq gsi: 32, irq: 24, idx: -1, ioapic: 1, pin: 8
> [    1.375661] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 25, nr_irqs: 1096
> [    1.375705] cjq_debug mp_map_pin_to_irq gsi: 37, irq: 25, idx: -1, ioapic: 1, pin: 13
> [    1.442277] cjq_debug mp_map_pin_to_irq gsi: 37, irq: 25, idx: -1, ioapic: 1, pin: 13
> [    1.442393] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 25, nr_irqs: 1096
> [    1.442450] cjq_debug mp_map_pin_to_irq gsi: 38, irq: 25, idx: -1, ioapic: 1, pin: 14
> [    1.453893] cjq_debug mp_map_pin_to_irq gsi: 38, irq: 25, idx: -1, ioapic: 1, pin: 14
> [    1.456127] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 25, nr_irqs: 1096
> [    1.734065] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 26, nr_irqs: 1096
> [    1.734165] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 27, nr_irqs: 1096
> [    1.734253] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 28, nr_irqs: 1096
> [    1.734344] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 29, nr_irqs: 1096
> [    1.734426] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 30, nr_irqs: 1096
> [    1.734512] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 31, nr_irqs: 1096
> [    1.734597] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 32, nr_irqs: 1096
> [    1.734643] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 33, nr_irqs: 1096
> [    1.734687] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 34, nr_irqs: 1096
> [    1.734728] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 35, nr_irqs: 1096
> [    1.735017] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 36, nr_irqs: 1096
> [    1.735252] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 37, nr_irqs: 1096
> [    1.735467] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 38, nr_irqs: 1096
> [    1.735799] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 39, nr_irqs: 1096
> [    1.736024] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 40, nr_irqs: 1096
> [    1.736364] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 41, nr_irqs: 1096
> [    1.736406] cjq_debug mp_map_pin_to_irq gsi: 28, irq: 41, idx: -1, ioapic: 1, pin: 4
> [    1.736434] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 42, nr_irqs: 1096
> [    1.736701] cjq_debug mp_map_pin_to_irq gsi: 28, irq: 41, idx: -1, ioapic: 1, pin: 4
> [    1.736724] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 43, nr_irqs: 1096
> [    3.037123] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 44, nr_irqs: 1096
> [    3.037313] cjq_debug mp_map_pin_to_irq gsi: 37, irq: 44, idx: -1, ioapic: 1, pin: 13
> [    3.037515] cjq_debug mp_map_pin_to_irq gsi: 37, irq: 44, idx: -1, ioapic: 1, pin: 13
> [    3.037738] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 45, nr_irqs: 1096
> [    3.037959] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 46, nr_irqs: 1096
> [    3.038073] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 47, nr_irqs: 1096
> [    3.038154] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 48, nr_irqs: 1096
> [    3.038179] cjq_debug mp_map_pin_to_irq gsi: 36, irq: 47, idx: -1, ioapic: 1, pin: 12
> [    3.038277] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 49, nr_irqs: 1096
> [    3.038399] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 50, nr_irqs: 1096
> [    3.038525] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 51, nr_irqs: 1096
> [    3.038657] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 52, nr_irqs: 1096
> [    3.038852] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 53, nr_irqs: 1096
> [    3.052377] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 54, nr_irqs: 1096
> [    3.052479] cjq_debug mp_map_pin_to_irq gsi: 38, irq: 54, idx: -1, ioapic: 1, pin: 14
> [    3.052730] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 55, nr_irqs: 1096
> [    3.052840] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 56, nr_irqs: 1096
> [    3.052918] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 57, nr_irqs: 1096
> [    3.052987] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 58, nr_irqs: 1096
> [    3.053069] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 59, nr_irqs: 1096
> [    3.053139] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 60, nr_irqs: 1096
> [    3.053201] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 61, nr_irqs: 1096
> [    3.053260] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 62, nr_irqs: 1096
> [    3.089128] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 63, nr_irqs: 1096
> [    3.089310] cjq_debug mp_map_pin_to_irq gsi: 48, irq: 63, idx: -1, ioapic: 1, pin: 24
> [    3.089376] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 64, nr_irqs: 1096
> [    3.103435] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 65, nr_irqs: 1096
> [    3.114190] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 64, nr_irqs: 1096
> [    3.114346] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 66, nr_irqs: 1096
> [    3.121215] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 67, nr_irqs: 1096
> [    3.121350] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 68, nr_irqs: 1096
> [    3.121479] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 69, nr_irqs: 1096
> [    3.121612] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 70, nr_irqs: 1096
> [    3.121726] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 71, nr_irqs: 1096
> [    3.121841] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 72, nr_irqs: 1096
> [    3.121955] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 73, nr_irqs: 1096
> [    3.122025] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 74, nr_irqs: 1096
> [    3.122093] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 75, nr_irqs: 1096
> [    3.122148] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 76, nr_irqs: 1096
> [    3.122203] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 77, nr_irqs: 1096
> [    3.122265] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 78, nr_irqs: 1096
> [    3.122322] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 79, nr_irqs: 1096
> [    3.122378] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 80, nr_irqs: 1096
> [    3.122433] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: 0, start: 81, nr_irqs: 1096
> [    7.838753] cjq_debug mp_map_pin_to_irq gsi: 37, irq: 44, idx: -1, ioapic: 1, pin: 13
> [    9.619174] cjq_debug mp_map_pin_to_irq gsi: 36, irq: 47, idx: -1, ioapic: 1, pin: 12
> [    9.619556] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 82, nr_irqs: 1096
> [    9.622038] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 83, nr_irqs: 1096
> [    9.634900] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 84, nr_irqs: 1096
> [    9.635316] cjq_debug mp_map_pin_to_irq gsi: 39, irq: 84, idx: -1, ioapic: 1, pin: 15
> [    9.635405] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 85, nr_irqs: 1096
> [   10.006686] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 86, nr_irqs: 1096
> [   10.006823] cjq_debug mp_map_pin_to_irq gsi: 29, irq: 86, idx: -1, ioapic: 1, pin: 5
> [   10.007009] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 87, nr_irqs: 1096
> [   10.008723] cjq_debug mp_map_pin_to_irq gsi: 39, irq: 84, idx: -1, ioapic: 1, pin: 15
> [   10.009853] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 88, nr_irqs: 1096
> [   10.010786] cjq_debug mp_map_pin_to_irq gsi: 36, irq: 47, idx: -1, ioapic: 1, pin: 12
> [   10.010858] cjq_debug __irq_alloc_descs irq: -1, from: 24, cnt: 1, node: -1, start: 89, nr_irqs: 1096
> 
> 2. Why I do the translations between irq and gsi?
> 
> After answering question 1, we get irq != gsi. And I found, in QEMU, (pci_qdev_realize->xen_pt_realize->xen_host_pci_device_get->xen_host_pci_get_hex_value) will get the irq number, but later, pci_qdev_realize->xen_pt_realize->xc_physdev_map_pirq requires us to pass into gsi,

So that's quite a difference.  For some reason on a PV dom0
xen_host_pci_get_hex_value will return the IRQ that's identity mapped
to the GSI.

Is that because a PV dom0 will use acpi_register_gsi_xen() instead of
acpi_register_gsi_ioapic()?

> it will call into Xen physdev_map_pirq-> allocate_and_map_gsi_pirq to allocate pirq for gsi. And then the error occurred.
> Not only that, the callback function pci_add_dm_done-> xc_physdev_map_pirq also need gsi.
> 
> So, I added the function xc_physdev_map_pirq() to translate irq to gsi, for QEMU.
> 
> And I didn't find similar functions in existing linux codes, and I think only "QEMU passthrough for Xen" need this translation, so I added it into privcmd. If you guys know any other similar functions or other more suitable places, please feel free to tell me.
> 
> 3. Why I call PHYSDEVOP_map_pirq in acpi_register_gsi_xen_pvh()?
> 
> Because if you want to map a gsi for domU, it must have a mapping in dom0. See QEMU code:
> pci_add_dm_done
> 	xc_physdev_map_pirq
> 	xc_domain_irq_permission
> 		XEN_DOMCTL_irq_permission
> 			pirq_access_permitted
> xc_physdev_map_pirq will get the pirq which mapped from gsi, and xc_domain_irq_permission will use pirq and call into Xen. If we don't do PHYSDEVOP_map_pirq for passthrough devices on PVH dom0, then pirq_access_permitted will get a NULL irq from dom0 and get failed.

I'm not sure of this specific case, but we shouldn't attempt to fit
the same exact PCI pass through workflow that a PV dom0 uses into a
PVH dom0.  IOW: it might make sense to diverge some paths in order to
avoid importing PV specific concepts into PVH without a reason.

> So, I added PHYSDEVOP_map_pirq for PVH dom0. But I think it is only necessary for passthrough devices to do that, instead of all devices which call __acpi_register_gsi. In next version patch, I will restrain that only passthrough devices can do PHYSDEVOP_map_pirq.
> 
> 4. Why I call PHYSDEVOP_setup_gsi in acpi_register_gsi_xen_pvh()?
> 
> Like Roger's comments, the gsi of passthrough device doesn't be unmasked and registered(I added printings in vioapic_hwdom_map_gsi(), and I found that it never be called for dGPU with gsi 28 in my environment).
> So, I called PHYSDEVOP_setup_gsi to register gsi.
> But I agree with Roger and Jan's opinion, it is wrong to do PHYSDEVOP_setup_gsi for all devices.
> So, in next version patch, I will also restrain that only passthrough devices can do PHYSDEVOP_setup_gsi.

Right, given how long it's been since the last series, I think we need
a new series posted in order to see how this looks now.

Thanks, Roger.

