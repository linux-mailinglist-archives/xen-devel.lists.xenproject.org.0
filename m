Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CECF757C40
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 14:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565196.883143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkCd-0006rl-Ay; Tue, 18 Jul 2023 12:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565196.883143; Tue, 18 Jul 2023 12:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkCd-0006pU-7c; Tue, 18 Jul 2023 12:53:19 +0000
Received: by outflank-mailman (input) for mailman id 565196;
 Tue, 18 Jul 2023 12:53:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c9jt=DE=citrix.com=prvs=5561f9d71=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLkCb-0006pO-PJ
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 12:53:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ea5b852-256a-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 14:53:15 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2023 08:53:10 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6062.namprd03.prod.outlook.com (2603:10b6:5:391::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Tue, 18 Jul
 2023 12:53:06 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 12:53:05 +0000
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
X-Inumbo-ID: 0ea5b852-256a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689684795;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jjhGQnTdv0lV3LQ4QNMj1kSCSW5aWhHhMnok7Ucdh/E=;
  b=UanMrCNFtT9wpvK4aPPQ2hWpqlZIZxmtLg+xn151kEmcfl7Q1w10gpsv
   KSLGdlBFUJeawmm2mRE2eTsDOrAx/BOMjoNu5xZznWmy8mKO6EuFQhOuL
   vk3vw0WCzx1PvOi4xjEjluHQEzmBgzZzt/JKGsszy7plkMd2u7j4PzAHN
   c=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 115883969
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FmoSVa121AZVAUk3cfbD5TRwkn2cJEfYwER7XKvMYLTBsI5bpzMDz
 zZNWWvUbquJNDOnKY11b4nlp0sB78XUxoAxTgZlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNnNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfW3tky
 flCMxs3cB3Tqv67kbeQF8ZFiZF2RCXrFNt3VnBI6xj8VK9jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6Kk1cZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137KfzXiqBtN6+LuQr/9Ij0Cs61UpFiYnR3i6/OmgmkK1VIcKQ
 6AT0m90xUQoz2SwT9z6WTW5pmCFpR8WX9dME+w85xqJw6CS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTG4NDURLGQCTTQZVgZD6N7myKksijrfQ9AlF7S65vXwECv1y
 iqHrwA/gasSls8B06in/VHBjCmor5KPRQkwjjg7RUqg5wJ9IYKgOYqh7AGC6e4addnCCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8yWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:D4h0oaGXPof6X4MjpLqEHseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV86faQslwssR4b9uxoVJPvfZqYz+8W3WBzB8bEYOCFghrKEGgK1+KLrwEIWReOk9K1vZ
 0KT0EUMqyVMbEVt6fHCAnTKade/DGEmprY+9s3GR1WPHBXg6IL1XYINu6CeHcGPTWvnfACZe
 ehDswsnUvZRV0nKv6VK1MiROb5q9jChPvdEGI7705O0nj0sduwgoSKaSSl4g==
X-Talos-CUID: 9a23:jo0Crm3I6+KSC60oiiLR5bxfQNoPTniH11zqPULoJHpkGbi+FHC59/Yx
X-Talos-MUID: 9a23:CrayCASynbNtzy5VRXS1hRNtKfhF2p6wM3EfspRbq9CUOSd/bmI=
X-IronPort-AV: E=Sophos;i="6.01,214,1684814400"; 
   d="scan'208";a="115883969"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsQ1dR/tArWYzUumUt0MrXcuX0koHdAHb7bpXYJIGG94BOCjXydCIg+Q7Z6cInzPCIsd2fs8Ho1Xsg97ixUrWt4+bkHM1R5kf5b9QNkhMmslBKo4mxqQwvETBmwXOYZeQcOfC/pszQboxorKmv5HsR/cTf/ReTAf8uyZGSJEQURgxMUogVOg7AWDKoR2MH3areguJ3d1EtTcd/qPd2F6SPD76n+pA/NIHUOb4blI0pA9p2lHJd0Qk3VmwHDXOfoZUHnxIiMrzaqcvhV909OnzX1PhwP9wujW0KPkoKm8os77hyQ8U7nmTfjW8cs5AY08GDq8vMnckzfMnEjMLmrXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjhGQnTdv0lV3LQ4QNMj1kSCSW5aWhHhMnok7Ucdh/E=;
 b=QJyDsWURjQjGzFjhrr5ZvnKqviQEX/261ZVUF8HbSPhE14GSymd5vEvdICVtmzmMxv1jghmDUcCV1IpxGrgAQxPuuatxLSmTi74dtJMLPSex+gf+J11a4ukUiCZllMSxwgxCnmtJfFPpGQcYclkzOI06OOpUCnMFoOpFTz2XiqWiUPkrioyin1USSB8mT+XFo5yBVxpRcWp47Va0dwKL3hUcCfl+UDPjedRgL4f6Kj701e/0SM0OtsDiAmDpR2MrxY1wjqwEn6u7znMtzm99ByEm9kHciIIEk7aCRodMC/tACEUuY+UpMhwPgLc05JNlXEM1/IE4hS5ncJIvCE51WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjhGQnTdv0lV3LQ4QNMj1kSCSW5aWhHhMnok7Ucdh/E=;
 b=L79OMWQxfwQK8MXeeFJwOnrLkoXGNGB0KYqfeu2O4+TiVt2q6PL+wOuBVjZlrDR40a6fzxMeX5HGlmaVYYrL4t1R6ujqwIMvAQYQUmI98Nx7H5dnZZBUUg+DiLY4kZxm7NeHjG3T6B8Nx5g5NcU3MIeoEfSmRn+vVdNWuGpdzDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 18 Jul 2023 14:53:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/hpet: Disable legacy replacement mode after IRQ
 test if not needed
Message-ID: <ZLaLLe2HFDN5oWUq@MacBook-Air-de-Roger.local>
References: <20230718122603.2002-1-simon@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230718122603.2002-1-simon@invisiblethingslab.com>
X-ClientProxiedBy: LO2P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::28) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f844b9-114f-4a49-b4ad-08db878dee21
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wJNZkDHFAm6lWH6UUx+2MZ4KjjB73lRy8TUJZ0ZAN0OSw32IWDxn2qAa+WWFuZCBRCM39qzLo5PtxQXNXb0igrK8vTGKQLVFCKivn1pZAkv6WUakl2txvyacYkH1cBydnm7cW5uo6A3Ls0U/ZngW/EOiGx5APSrF9N2y62HWEagTlS8dNxM4fAeBph2Rqaacnz+UKZGrKn3XE4CsuSIY5ik1sL8+r3Rs2rR9jPBBbIW+kATQ0OT1hJwFpDSe7nssAYrSi4llDIJQZjtSZhfhJcW+qyU7ArB2WlDpcLYsMybL+pf0tuuFCmIai/2Dfv3JDN5hoZKOSU2NxJ3s5Rjm7cg7BR/Yv9E4F8TRh9QEkxOJKCANNPUWmqIuRbceeoiXtQzij+n9dN73KGRoAasNI78U31FMlbSN9S8QJ2GKhVaAAHa0QRAX70jRsysjcdW0T+CfERo0ttdu2G70FUXRTwq1o5can+2LvNOIFjGF0SL9rcsCrrEkq5n0trWCltkA5pZ6UDyuorFnwKjISlUrfW8QmxRA7b+wgy19Bp7X9cvnBjd59++aM1jPGOdCUdtW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199021)(2906002)(4744005)(8676002)(8936002)(66556008)(66476007)(6916009)(4326008)(66946007)(316002)(41300700001)(5660300002)(6512007)(9686003)(26005)(6506007)(6486002)(186003)(85182001)(478600001)(6666004)(54906003)(83380400001)(82960400001)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDlIMXhUVGJzcXpmWHFlUmsvNVc1ZEJSckF4THY3MVNmenlqS2xpSSs1dTdL?=
 =?utf-8?B?WHNwcjhBYzlqUkpQM0JIMHlIdzMwU0dsQTJ4NzN4OFliTzVwTFMzZ0c4eHB4?=
 =?utf-8?B?RHNQNHVralZJSUpDNFFpMXkxbDRGV2hSYytOWmxqZGpqV1lZUWt4RGZ2bE1U?=
 =?utf-8?B?dzZHcnlaajE0dmlYUGtpMmZleSt0SW10a3dYYnRrNzFmWENidXNPUjRVOXVG?=
 =?utf-8?B?R2hSOEVpMzdxNzUxTUhRU0VSbFczcjZNWFZhUEJkQTVXSmhTeE1pcEJLQ0ZU?=
 =?utf-8?B?M0owSHkrZ05WYWExK3A0elV6TnJ5VVdnYkxPa3lXUEJ3cG5WNVdLK3BvNHA5?=
 =?utf-8?B?UnNHNkl3dG9ZOU9BaGoyK1ROc2VjZWFXWFRCMzVIbWhneDU1WTdJWnYwTEY5?=
 =?utf-8?B?WkRUZXFkdjB5NG5HUFlyaURlYXM1ZWFDdzgxZDFudjYxcjBobEtTZjJjN1hy?=
 =?utf-8?B?ekxkbWxjOUpxY0Vic1FRSExzQjYzclZPUWlZMkdIc3lGL2ZaWUJWbFU2bUNZ?=
 =?utf-8?B?VTFuUnk0SndaeHhZOHhVUG1IdDV2di81ek1LakN5TmJLR0ptOVoyTTFxRmFU?=
 =?utf-8?B?Z2dMcVBqTTQvVzZkeW1rY0lPUHVsRHNQcWxjQTR4QlRxWEMzUEhQQVZ0aThn?=
 =?utf-8?B?SGRINEFZYXRYblRRb0tjai9VRlhtZWhTaXh6azhOQmVMRXNxYXhUMGd5RE4v?=
 =?utf-8?B?a2h3cmVhSFFxeXNYdkc4UFA4VkJnSWdKMG85YWNvZ25KVVRCWm5vS1JmY01q?=
 =?utf-8?B?MnpGbmRUYy9vakJnWEo5c1hjdndKc0RmcFJGa2dYNHJwWmRTd1dMUEZkcm9O?=
 =?utf-8?B?QVhaVEd1OUl4bWNaNzZ4TFNwUjkyWEdUb1ptQlZCbDl1SjR0SXBWZTk3UTdI?=
 =?utf-8?B?Q2UzQlM0Zmd3aU5FNmtabFRIc1ZHSGthZWhDaUZySUs0SVRtdmZXNkNFb3Vw?=
 =?utf-8?B?VFBCWGJ0TVNYR2hUeUFFdWg5b0N0SHE5elJCSGZrWTBsQVpBL3ZvUnJLZHJh?=
 =?utf-8?B?dGhzV1FPcE9GMENPNUR2cmcyRmxheEdFWDVFVVhOR1lJYWI4d1pxWGtkcEtY?=
 =?utf-8?B?ZjJwanpGOGJDdGVKd1ZGeDJGTjNFdEYxb3VJaWJzZ1pNYWVyVXNURzNrYXNi?=
 =?utf-8?B?VlpEV2ZWUVhJUkQrekRIelk2MkhVK3RBLzRHYjUxcG9Da3dPQUdmYWtoVzg3?=
 =?utf-8?B?d2xncVJ1WGhPS3p4bW40NzBtNk01NXlBeUYxVnA1VnVSUjI4bmtYNXpHUTU2?=
 =?utf-8?B?ODZySTVVWjl4Sit5a0FlNENWODNGandFeUNkTVBnTzZCMVpXWXJ0T3NkNXBy?=
 =?utf-8?B?enlBd25pMmIzU2YzanJnRGpmOU9XNER6Vlk2R0dJQVJRaXVFZGlkcDFuMmwr?=
 =?utf-8?B?NGllYzdpT2lmRk9WSjBZUlByRC9IdFdQVjl6c3JRYU13VDdub1BnVkZnK0xU?=
 =?utf-8?B?K3lKMkU5c0dnNEhzek9nTTJoaTdFNkxDSEJDa3U0aWdZaGs1WUZhRHZkMFR6?=
 =?utf-8?B?TEYrMkZtZGR5WEROdTFKNk1oMGFtc1Iwcm5tZitncm84NzFiWStwOUdZR1Ex?=
 =?utf-8?B?RmgwYTVyeGNNd2JqN2E1bzhVdms0WU9kSzNiK0dmRzZTazhHMnF2RXdZQWY2?=
 =?utf-8?B?bjRUMTg0SXNyM0RXSHd3a2NCdkNOODVPUm1NY05FSjZMbDd6dnQvNVR6a3F5?=
 =?utf-8?B?bGJFdGxvMTRDclM2RS9LNitXTCtxNFRtMUZ4Y3BDdTFoM0dBK3RUMVhsQ1NR?=
 =?utf-8?B?akl1RzlrTjZEOWNKUlBqVU44emlmaFdnTi9yV3dtUzRoWU9STWFVSGZzSzdL?=
 =?utf-8?B?cTBqcWk1a3N3WFE5aXhGTTI0Ly9DK0xVNmg1V2pINTRnMWJPNUd3UWdJZHM4?=
 =?utf-8?B?L3o4cTdmM2ZiNGNiQXJ1N0pLNGlRWEhCeUNmMnkyR2V5NjhnRGJ5bi9xMVAx?=
 =?utf-8?B?Qm1qTlhlTlNQbFEweURZVXIzNGUyT1BVU2cvMVRSSTVvZ1FVSm4vNWlVZ1pn?=
 =?utf-8?B?Q1lia0lkeCtMa1BpWXRnU3o2LzhvYkFiemp4bm82TmdtYUJHaGpRdFZVeGJE?=
 =?utf-8?B?dVdwb1N1aEpsVkdHOU56NFRBdDRuTnZXaVYrcVNYd21oRG4zV2JaWVVkSkhk?=
 =?utf-8?B?U2crQTBmS3gxcitOcWdtS3lLMFlFMnBIdUJDZmtEQW04bFNIdWpBMlRHTlNx?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BOTV06Ae8urmJC2c92wTFXG12rJbxS4C5ukkLwCAMEHFVzxAUC5WpHQ5DYLK+IZocgrzFikedNToQiSVcfXqAD9elg2z4eutBjFo2RtHhHTo/VAamuNd7xefIRJ5a7oG8Ay3hVgwNk+cjvYqDi4U8DcesELOZqkExuf51zGPFysquPti2nAAkS9lcyyFfQTezoxaG7wgZd6QiOA14j02sWeRbfp5SbdEcuCPMf72i0be2PKbFqkxXl2/wF9vNhr3nHKoz4v2QEKPlPL5Vex6K8TecNguWKy9iBIKArwv37vNvhdachU/6MxZjHY95mFIlovVVtwcREv7ezwKcJEYkaIrDR5m+xFruSama3Z1rzCQnCYS7agIAVRS1t+6VxybgYPFWCHargTcsIdxliJqrg247ui0pyelxwSEOZqrOWG0XAeiwa1oXmjXqejDfc5OKVXESzUtLxz5nW/OKkdefLQB+vUJfeFWgOndsYSl7kvYkSqqYzLTev+JRP3IotKBhxhTiwbnuEh3hWE6ejMwL+E8vmoqBK4SA8DflysdXAvLXm/5k4/Cdk3TFlywIdDMTYkX+RseGW5XxlH1TngInlTuZNRSU12dnPMZkE5+O79QG8zODyC7yXTscZpvi2+3U/qWjpCZy5YPR8vEQ3gF/drOPvnMfGPwOxduD6Hys2N/cvisxxYEqHwusgFE7TPYjX9blTMExjmK/DvphYnJBoOJ4hZvLxc3WNtgDiPrHk7IBw2OrvSpwzIDBRQzkQ7uhyNYH3hkQyxfQMgEa5lM3jylYEowsYyT6PxkfKYCsJxd/02xdr83BoI84INgHN1v2aiYm86TwrSVho2CO1RCmXg8jb8H+w1PWn0DIVpfpWX60IitL1XKfqIFgswB3m3g
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f844b9-114f-4a49-b4ad-08db878dee21
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 12:53:05.9235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0+wyumKaeZvbaX3qX7E3R12ybZFY49i0FTJ3yhrOftYZzl+6mK+g8Xnej79HYOOYUDEtBbnGvo/Q/ORSQRdVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6062

On Tue, Jul 18, 2023 at 02:26:03PM +0200, Simon Gaiser wrote:
> As far as I understand the HPET legacy mode is not required on systems
> with ARAT after the timer IRQ test.

What's the relation with ARAT here?

It would seem to me that keeping legacy replacement enabled should
only be done when opt_hpet_legacy_replacement > 0, and the currently
modified block is already in a opt_hpet_legacy_replacement < 0 gated
chunk.

Thanks, Roger.

