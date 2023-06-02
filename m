Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 657CA720094
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 13:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543096.847735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53C8-0000oA-SX; Fri, 02 Jun 2023 11:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543096.847735; Fri, 02 Jun 2023 11:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53C8-0000lu-PU; Fri, 02 Jun 2023 11:43:48 +0000
Received: by outflank-mailman (input) for mailman id 543096;
 Fri, 02 Jun 2023 11:43:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7HB2=BW=citrix.com=prvs=510adbd96=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q53C7-0000lo-2B
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 11:43:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8ff91ea-013a-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 13:43:43 +0200 (CEST)
Received: from mail-bn8nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2023 07:43:36 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6453.namprd03.prod.outlook.com (2603:10b6:a03:398::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 11:43:29 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6455.024; Fri, 2 Jun 2023
 11:43:29 +0000
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
X-Inumbo-ID: b8ff91ea-013a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685706223;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KDQz6qFkZbP+chS4VwtMVD1Imy+d76fapWz8/pmdLs0=;
  b=OKZlkQzWJ1B7B8uaG/Ch4RsverJTXCbYSXilN0wWBatdasf7d+Qtl/2l
   6LAoZw9tK+f1H/v/7ZQfF8pXkziPpJSB2KMlnvs4WyHcxZnBCwAopd0Ry
   qqoakf0tRnUsnzMYer65QfcomE+I0jdiBBN1tAgM2UzDniJpTd/jmLw4D
   Q=;
X-IronPort-RemoteIP: 104.47.74.45
X-IronPort-MID: 111374382
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kjCyIqP8NerEt13vrR2wkcFynXyQoLVcMsEvi/4bfWQNrUon0jJVx
 2ZMWD+AP6qIMGf2edhwYIWz8xsHuJHRmodlSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5gZmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0u9WB2ho8
 94kFDkEdyjen8uozauLU9A506zPLOGzVG8ekldJ6GmFSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vZxvzW7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyv32bOUzXmTtIQ6Ebzg7aJTumOp3EsxDjkHWUK1n8OjoxvrMz5YA
 wlOksY0loA75UWtTcT4VjWxpXLCtRkZM/JTHvM77keRy6PSywefGmUACDVGbbQOttIwAzoj1
 VaLntbgLT1prLCRD3ma89+8tTqvPQAFIGlEYjULJSMa5/HzrYd1iQjAJv5gF6ivh9GzBjD0w
 BiNtiE1g7hVhskOv42g9FXajjbqupjIRAco4hn/U2S+qwdoY4jjYJangXDe5OpNMZ2LCFyGo
 3sNs8mY8O0KS5qKkUSlRegLE6G0z/2EK3vBmVNpGd8s+ynF03eiZolR5DhWLkZ1PssKdDnlb
 VWVsgRUjLdLJHqwZqZzaoisI84r0aTtG9njWv3OKNFJZ/BZZAKBuS1je0OU92Tsi1Q317EyP
 4+BdsShBmpcDr5opBKzRuwd2LttwTosyGf7TJX3iR+g1NK2f2KYR74DNx2Vcukz4aeAoQPU2
 99aO42BzBA3ePP/YTPe9MgcJEoKMnE/LZnzp4pccevrChZvHWg6I+PSxb4ndJ1om+JekeKg1
 kGwXE5RjmD2inzOJQyJbW1LYbbjG514qBoTMTQ3OFe021AqeYu18LoEbJwzYKUm8+p4i/VzS
 pEtYcKbCO5ITTfB0zsYZJj56odlcXyDhwiDIi6kazgXZIN7SkrC/dqMVgDv7igVEi2vtcYk5
 aLm3QfSW5krSAFrDcKQY/Wqp3u3tGQdkeQ0RFfVLtRJUEnr6o5nMTP2lPwsZcoLLH3r3SeXy
 A+MHT8DueTS5YM2mPHSnryNpYqtF+p4H2JZEnPd4LLwMjPVlkKh3ItBXeCgbT3bEmTu982KY
 fhWxuruGP0Og0xbt4l7Va5vpYoU6sHzvbZcwkJBFW/SclWwIrp6Jz+N2swnnrdExqJd/xC3X
 E2P0tBAPPOCP8aNOH4cIhA0KNuK0/48kyPXq/8yJS3S7yZt8L2KeU5bJRWLhWpWK74dGIEq2
 +A6o+YN9heyzBEtN76ugi5d+GuNKXgBe746rZxcC4ju4iImzlxEaNrBBC7z/IqCddxkNVMjK
 TuZwqHFgtx0+E3GdHYiEGnX6sBUj58OpRNiwUcLIhKCnd+truQr0QJY6yhxTgVRwhhNyet1N
 kBiMkEzLqKLlwqEn+BGVmGoXgtHVBuQ/xStz0NTzDGECU61SmbKMWsxf/6X+1wU+H5deT4d+
 6yEzGHiUnDhe8SZMjYOZHOJYsfLFbRZnjAuUuj+dyhZN/HWuQbYv5I=
IronPort-HdrOrdr: A9a23:ULm3pKho3S5ISh7VmzORI+7QdnBQXssji2hC6mlwRA09TyX4ra
 2TdZEgvnXJYVkqKRIdcK+7Scu9qB/nm6KdgrN8AV7BZmnbUQKTRelfBODZrAEIdReeygdV79
 YET5RD
X-Talos-CUID: =?us-ascii?q?9a23=3AJTwhkGlcM9Fk3EAgyrIM1K9iWerXOXT8yn72JW2?=
 =?us-ascii?q?ENW9gUYXIUXaO9bpUivM7zg=3D=3D?=
X-Talos-MUID: 9a23:LJvdJguYvYw4kFjgVc2ngTA6L5tR2ZqUEmcvl7EXt9CKCxZqEmLI
X-IronPort-AV: E=Sophos;i="6.00,212,1681185600"; 
   d="scan'208";a="111374382"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqshhYmX2c0MKA1edxvpIHLXrUSsh75D8fdWePFOE3ridZZNXen1c8BbuYhwB21GnntHO8kJ6tqemyf1uAC1CFsqHeae2m+TRkBuV/v7h6N3v058bD42dRYUrwXe6BbkiY42+hnnzwt8mPXldWWptQlOu7ZmRHcHzrxcvKvH0cIR4jPqeuxWE8O2+glV6wqoz7mz450hJd1s5ZjtYeDTrB5aH5V2hrm+zj9BEl94OHgYPZAeP41clfGSJ2rO60rilA0tcW1mAg/E1/bWVQo3tmlEAtwxjs4+Zqv3etcuPjL0MLXTj/H8Zu4QSCpT77vfHHoIWKvMho8OjZ8oL8PbJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xi7YcqVQqckgh1ie/0c2dQlJNuQV48GdpRpYWfQpWdw=;
 b=FFxUbfjAU/f3pD4iBhx1G1OSNE7Q9bU1n0Q2/cJhDksGuaho9knB1u16G1gB8vozxcq1DdmpNHMD8L6LBQAOWhevhcIwcIDnruHJgXqkdzlBi/EQ95fTQPBKiMzm+oGXNtejP/q2y0GYLHjMeqMG1kxoaFKl57UhiwV/7B/TelrkYhtkHaoytyXxb7LBAKfko1j0hlLt+E5Qw+I20+JE2LPeWYqNaMjla/DkV+tzDZsh512gr1t+GEB45cPY9iPUUrUm1Hi/0oaH0DGlknUJHpRiTk2Gtiy1/eQgDHMhTWuMSujfnjHFDSt2b0cJQjQwzPn5jR8KR2WMKfclVL6rCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xi7YcqVQqckgh1ie/0c2dQlJNuQV48GdpRpYWfQpWdw=;
 b=UL0lY9GlDZswBani3WJdftMvkGDGLOpdAN5bEqDkEvaHdqb9vMSxbTvWZ2/loGmCkEO/snUgxO6SyueOAFhLDhUzdWgCl3QM7YkqwjFMH4VXlD9NoSZpfAuvfNmQ7T0WKlP4poAI+1jR4+Z1TzkW7Ysag7CDipwq0Y1aAcwe9tc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 2 Jun 2023 13:43:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: "jbeulich@suse.com" <jbeulich@suse.com>, andrew.cooper3@citrix.com,
	christopher.w.clark@gmail.com, nathan.studer@dornerworks.com,
	Stewart Hildebrand <stewart@stew.dk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>, Juergen Gross <jgross@suse.com>,
	dfaggioli@suse.com, elena.ufimtseva@oracle.com,
	anthony.perard@citrix.com, george.dunlap@citrix.com,
	rosbrookn@gmail.com, lukasz@hawrylko.pl,
	dpsmith@apertussolutions.com, mateusz.mowka@intel.com,
	kevin.tian@intel.com, jun.nakajima@intel.com, paul@xen.org,
	Wei Liu <wl@xen.org>, konrad.wilk@oracle.com,
	ross.lagerwall@citrix.com, samuel.thibault@ens-lyon.org,
	christian.lindig@citrix.com, mengxu@cis.upenn.edu,
	tamas@tklengyel.com, aisaila@bitdefender.com,
	ppircalabu@bitdefender.com,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Michal Orzel <michal.orzel@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"Garhwal, Vikram" <vikram.garhwal@amd.com>,
	Xenia.Ragiadakou@amd.com,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: Listing the tools required for Xen development/testing on x86
 and Arm by the community
Message-ID: <ZHnV2lhkU1EkrQ68@Air-de-Roger>
References: <baa9627c-51d3-1ef0-e125-f7803d72179c@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <baa9627c-51d3-1ef0-e125-f7803d72179c@amd.com>
X-ClientProxiedBy: LO4P265CA0274.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6453:EE_
X-MS-Office365-Filtering-Correlation-Id: 89163d12-82c9-4d17-cd01-08db635e953a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4OWFg/Z7//iWioSDj+rQqho+Bvvh4WSvQPChD0h6OXj9HWGY2Rwmi8H2/PzJ4ktdUHOvGU+ql0/KRCW9SXboC/ni6HQF7E3yQPvmPai04yyHY2hBM2bmlT4gtmHSMlOxFhCuszqX2U5NRwuXqIVxBmREJltg1ozDlWn9e9YZMfgxeJkNksG1hnYxU2B0msoa5hbDOOdzsikgDF1uSTLS7GOHINMqxONk8zKfDX5X1AuUj/jribs0zDHJa2hO+xXheTbNAAsA3ky9D5ZqWT1ldsTNoDbdgPjOvO7rilGEMdhbTKziYyRUrJtnu9KS8O30bgOW9f6aFEl2tAzWlY3lNDlGxdLr0ZiKAC2L+TbVLHPhXtcjXkGN0Hi294/Xg/BiUUl/zht/GCtFEEfTQPrx/8BOoNVLqu5K5Dr/5W+yZ8ytA5AJHq8GOfF4PBr+kRARUK7OziT3zuJTZvz+MF9XnpJgGohmZCvqXZXTay3d1TqEV2AgHegG79B1V7VQqjRJ9PjhbYMkGr5MCXIYUnovQy3DmlrPMRtwSghJgqSKnkk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(8676002)(478600001)(6506007)(9686003)(26005)(186003)(6512007)(6666004)(966005)(6486002)(2906002)(41300700001)(83380400001)(316002)(8936002)(7406005)(5660300002)(7416002)(66556008)(66946007)(6916009)(66476007)(54906003)(86362001)(85182001)(4326008)(33716001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGNJdGVtWE5KNHpBeGx0RTFxeTBSQVpWT09jRFVwQ1dLRTcyWDFXZTJidmIw?=
 =?utf-8?B?RElLK1YxYVloT25ETmpuNE0zWEplalF0NmY0ME10RHZ5eEVWQndZL2NvM1I2?=
 =?utf-8?B?TXJ1cFdHUUpkR3plWUZDa2dmWTBBUXdEcTF6dXBCT25JNFU5a2tmRFo3bW1C?=
 =?utf-8?B?SEVQZFB6VUlIYjIrQVdKZk5DbUFONlkxZ0RkZDhpOFlLa25xaEJKRmJxK2Jy?=
 =?utf-8?B?QWNpSk9lZEVNaHRuS3EvbUZrMkJNSWg5K0NHbGR1Zkp5dlpveUpEUU9UWi9v?=
 =?utf-8?B?UkZzOVorQUN1WTlnZkhENmF1d3ZlaHQ2L3NwMmtFV0w3WFlscjJHMnhlblQy?=
 =?utf-8?B?ZUxLOUcyNXBEcDhIdFc1eEhuVGR2N0o2UDE0dVYyWlVFRHpLSE8zdG00TURm?=
 =?utf-8?B?aGFYWk4rT1BqTU9FQVNZSW1weWRmOVJ6RlBvS3N1M01oUGdpcmFCcExxajVk?=
 =?utf-8?B?QmQvODRxTjhMQWswOXZLT1hYb1l5OWN0L0FtNHdySkcwRk9pMVBiaWFiOXhp?=
 =?utf-8?B?MFowUmExS1JTeFlLZjB2UE1KMW9rYWlnZWErK1dITHM5Tm1mQnh6UmJjN011?=
 =?utf-8?B?QWZCcmM4Zk9Nd0NLQnNXcVlDQ3dWaGZoNGxJMTIwazBlTW1waTZiQi9xVjF1?=
 =?utf-8?B?TTNMWnI1WUhMN1VJZEVEV3pvVGxuZW5SdVdnc09sNVl2b293WnpuUXEzYXd0?=
 =?utf-8?B?MEJhNlVtODRFMGFHV213eVhJeDZ1TWJyVFZ3WEI2ZTZYbVg2WDFxT1hVeE9E?=
 =?utf-8?B?eEhtSVNXMkxKdUlCMU41RC92eGtWRkwrNk5qVGV2QjJRVkd0eFdYc0ZCbWs4?=
 =?utf-8?B?aENFK1RObDV4enMxWUN4bnhvMEhmZkp0WDg5SytyV0pCVThBakpHUWlhcFdL?=
 =?utf-8?B?SjF2dHdZK2JNUHA2d2FnZHZSbnBWQVJOZ0s2bzFVTGRhNkpFSlBBUU5vekFk?=
 =?utf-8?B?ZmRLenFEdzYwTkhlZHoxeWNYdDVsOVZpalZUVnpWQTJQRG1LdnIvVFA4NlNP?=
 =?utf-8?B?TmxKY0lJdHVFMWl0Mjh2WGtlVjlLVEo2ZFQyam12V0x0ZG9wS0Rtb2Y4dm1J?=
 =?utf-8?B?WUpOR1lNQTRqQWFRakk0eVMrYXdwKzBEKzBLd2MwaG8yS3JNampWSjZZWTRj?=
 =?utf-8?B?alNLNytaRHlzeDRJTThtdk1UeDEwN1FMa3RTZHdtQUxodk1XbW4wbUI1Y2t1?=
 =?utf-8?B?V0twZS8vL3N6RFhSRzJoTzI4N1UrQ2RQdHFEbXFUTGZSTGZTNndQVlF6dDBL?=
 =?utf-8?B?MHpSSU45VFQxWnlmM2RHWms0V1YzcnlUYnExWm1rWUJtR1hsNWExWWJIcWE0?=
 =?utf-8?B?aGJpTDd4WDZKYk1mTWNHQmVadlNmaDhoMFN2LzdWSjcwbjJSV0Q4Rlo2MVZE?=
 =?utf-8?B?bGx6aUJISFlSMGw5QVNxVnFpWXp3aU80ZUR0enhCTCtwZGQ1eGthRHlGYnVK?=
 =?utf-8?B?UjFGd1BwVDFSWGdZYlFVdG1EUG1NZzk4VWl5TVdvbm1ZWkJjQmRqMlQzVTM2?=
 =?utf-8?B?SE1UL3g1OTJPSTBRL1YrNTd2Mko3ZkFuL2lXdFU2aXpPWGV3TmxYWnpncDNi?=
 =?utf-8?B?WHFRWTRNQ3c3UDI1TFlrWkMzQWU1NGFJWkRlQlBTd3cyVWNPZytpNXFuZ3ZJ?=
 =?utf-8?B?bmVPNHFSTExJeThHQVYxT09oRXI3a2ZqTzRBWWZrYXBzalhGa0d6UzdWVnhD?=
 =?utf-8?B?WUNleklBVVlQSmNVZGZNYjRxSGdXTUk0Rm92ampNZW9haXJ3dHVwdFdlWjdz?=
 =?utf-8?B?alJ4OGZnL1EyKzJCN253UlpEb1N3N2t3a1pLWFZzKzhmcjBIbm82aHVRazFq?=
 =?utf-8?B?eEVwSmg3L2Q1eHRDMkcvVDV6UFh6MUEzMU9KdlpNSXNJMGtXak9LLzVZM3Fs?=
 =?utf-8?B?MjFYdUZER1dqekZObi9rRE0yditrWlpRdU9PcERYVE1XYnhNQm5yZHlQNUhI?=
 =?utf-8?B?V0tYUENtaE5rY0pHZG1odU0rVTBzQzNJbTNDSDQzQkNJd1prNnU3bHZ4RXZ2?=
 =?utf-8?B?SUlnd1hYaVJhRWc1eU5qNTQvMWV4Mjh1MDhEcVJFUXpaTGFHdmIwd3hsaGVK?=
 =?utf-8?B?Qm5NbkxlYkI5NGpFYmRPVzRhcEJBRm80d0VpMEtScW9nUi9FWm9UYkRyVlE4?=
 =?utf-8?Q?YJSvSun9f9FjZpmus/6kmjn43?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?QnZyNUQrKzA4TVJ1L25VVjBlbVRVMjRjbENSYU96cXVpWTJVUU53MHJmM3ZE?=
 =?utf-8?B?WEhrMUJmMjZrYllsemtaMEJTcUJCaWNLeTZmNitiNnNtMUc3TFVVZDdGNmVD?=
 =?utf-8?B?QWxPOTJKQkhFT0lKdS9qQ0tBdFg5Qnc5K0FZdFE3WE9ZekxISGFlSFdMM0lo?=
 =?utf-8?B?emdPc29TLzhiMlpaZFNiTkdvWWp6Zi9kc2pNT1E4bk5RY1NnZEFBK25Fb1V4?=
 =?utf-8?B?QjlWejB2TXhKRjN4K2tRdSsxdjhUR0pQNXVzM0kxc0xoK1p1R2lhWFhkT01F?=
 =?utf-8?B?RHovT2VIcXpFVnUxQUptYlZqZjlGcVJnVEViS2tsYUFEZnYvWUordGpPRU5v?=
 =?utf-8?B?YnQvdVB0SUdSd1lVUzFoYk9kbDZGVFlWSVk5ZmMwb1Y0WlNkYmRBSnEvcFRG?=
 =?utf-8?B?Q0drRWFtbXF3c21yNk1tTWZQUlRZMk9ha0VRSVNHcFoyVnljbHRQNmcrcFZ2?=
 =?utf-8?B?M1pqRGhoSHVUUHdRell4ZVRyWXllM24rVE9vbkxUL285M2xVSW5hOWwrQjRE?=
 =?utf-8?B?K05BZ1VUWS9semUzemJJZXFNK05kTCtWODlITVNSR0JrZTVRUEV6eGhzZGpq?=
 =?utf-8?B?WWxyMm1wRXgxNE9VbEFGMG5LSE1RdGVMYWd1UDlKUGtRVksyd28vSXQxemNI?=
 =?utf-8?B?QlhBbXlwbDdJSUtybkd3RmQ4Z0tuTTlnYTMrUVVqcGJsem1GRUEyaTNJVTN0?=
 =?utf-8?B?a29pVzRwSWF1dlU0UnA2ZmNYQ3hVbTlVU3pyOHZhQXVzZGs5eTRpNE94QW01?=
 =?utf-8?B?ZEcwa0VXWUpCR3VCVFh2bGRobXFZMTI3RVFkTDNZUThweHROaVU5SUMrUk5n?=
 =?utf-8?B?WGp5bXgwMlk4REUwY2lmQUszWmdKbWNkSUZTY0Z5NjdRbFhtZkk4Y3BBRjQ5?=
 =?utf-8?B?cWphTEV1OEcrRjN6ZHpFa243Qk54MFY4ZHhEQ055UUljSkhxeHBJNEJqVlRS?=
 =?utf-8?B?dGRtWFh4RExtQ2MrNElKYWZqOEFDTDRiMS9Qd0Y4MHc1OTRvQnVTbmJHSWZN?=
 =?utf-8?B?QXcvRjFQM1cwUU5tTkNLemJSMld0WE45Ym04SW8xQldkYnc4OXZzWDNGMWxh?=
 =?utf-8?B?SXNpc3BXOXZLNXFpSG9iK1RrYkphc0FJcFV3YzQxc1kzWGg2NXRTVGtPaXFW?=
 =?utf-8?B?Z3hXd0NudXRiVUVNcmJsSXNJdVcwRFRMaVJtTzVQdzhXMzJXb0ZDYlh1Z2d0?=
 =?utf-8?B?RW5QVUlMUERqbzBhUVFzZjVRUHNLamltQkoyT09raVJ5clY5bjlERmdHOTNI?=
 =?utf-8?B?RHhTSWdrT09nRDhHNVJuWnNQZTlGOU51djNsQldacG9xUjA3blpSNEJCL0RQ?=
 =?utf-8?B?dHFqaUhaR1hFMEc5eGFESmthRUZ2R09DNDdMbjZuN2RVMmttUXFJZE0xSjBZ?=
 =?utf-8?B?Mys5MG9MVWFmeU8yN3l6d2J0SDhObkVzRThQajlCNG4vcXJrQlZ0cnRoWEs3?=
 =?utf-8?B?MXJFWmZ4MWF4L0lVZnE0TGRwWSt0SE94K3ZrSXNSdVZrU0VlWUE0MDdvMys1?=
 =?utf-8?B?TVBtVTM5Q0JyUkEzT0pjMWRtbFB2NVdYK2k3VjdzekpVcC9RTEFHN1lkOGh3?=
 =?utf-8?B?Tnh6SDFNdUU5UFlCSkxxQVRHL3BBWlhjN1ZwN29BMDZJMEpYamF0V0E2U2Q1?=
 =?utf-8?B?L3dBREswQ2dYczVodG9HTjFCYmsvNStuVWZ5SEkyTmVFV1hMQjRVWjVoekFk?=
 =?utf-8?B?citDbFBLaHdWTit2Z3Exc0tyTDVGaUZOZUpTY3VVYkZPdVNEL05jK0c4d0w0?=
 =?utf-8?B?YWpTaE9rWTAvQ2MzNlBJU0tMZ1QwaDBXanhpV3BOU2tydTFHWmFHVGhlTHUr?=
 =?utf-8?B?eW9uV3V5U1Jnemtnd1RJZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89163d12-82c9-4d17-cd01-08db635e953a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 11:43:29.2999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuOcZ/9Pa/YtpsZR24UQZZAf4a1KE0D7D0fViPsfLd1e2g5ofcSOpxVCNrXIGoE908W8Yo0Qe1NywLminFq8Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6453

On Fri, Jun 02, 2023 at 09:48:48AM +0100, Ayan Kumar Halder wrote:
> Hi Xen developers,
> 
> We are trying to better document xen project development processes and
> related tools. At present, we are targeting **x86 and Arm** only.
> 
> These tools range from bug/change request tracking means, compilers, infra,
> editors, code-review tools, etc which is connected in some way to the Xen
> development and is being currently used by xen-devel community.

What is the end goal of this?

I'm kind of unsure why do you care about which editor I use to
generate my code, that's up to the developer.

> I appreciate if you can let me know anything I missed or mistaken and the
> version currently being used (for some of the tools).
> 
> 
> 1. Code management portal - xenbits (https://xenbits.xenproject.org), gitlab
> (https://gitlab.com/xen-project/xen)
> 
> 2. Project description - wiki.xenproject.org
> 
> 3. Project management - gitlab
> 
> 4. Code review - text based email clients (mutt, thunderbird), git-email, b4
> 
> 5. Text Editors such as vim, emacs
> 
> 6. Code review history - xen-devel mail archives
> 
> 7. Code revision management - git
> 
> 8. Xen coding language - C89, C99, Kconfig

assembly (gas), python, perl, shell, Makefile, bison, flex, ocaml,
go...

Likely more that I've missed.

> 
> 9. Testing tools for Arm64 in gitlab CI
> 
> compiler - gcc-9.3.0 (Alpine 3.12)) (most commonly used version)
> 
> binutils - GNU Binutils for Debian) 2.38.9
> 
> emulator/hw - qemu-system-aarch64-6.0.0, qemuarm64 6.2.0 (From yocto, poky
> disto - 4.0.5), zcu102 (**need the uboot, TF-A versions **)
> 
> dom0/domU kernel - kernel-5.19.0
> 
> rootfs - alpine-3.12-arm64-rootfs
> 
> firmware - U-Boot 2022.10
> 
> 10. Testing tools for Arm in gitlab CI
> 
> compiler - arm-poky-linux-gnueabi-gcc (GCC) 11.3.0, arm-linux-gnueabihf-gcc
> (Debian 12.2.0-14) 12.2.0 (most commonly used versions)
> 
> emulator/hw - qemu-system-arm 6.2.0 (From yocto, poky disto - 4.0.5)
> 
> dom0/domU kernel - kernel-5.15.72 (from Yocto), Kernel-5.10.0-22 (from
> Debian)
> 
> rootfs - alpine-minirootfs-3.15.1-armhf.tar.gz
> 
> firmware - U-Boot 2022.10
> 
> 11. Testing tools for x86
> 
> compiler - gcc-9.3.0 (Alpine Linux 9.3.0), gcc (Debian 12.2.0-14) 12.2.0,
> clang (from Debian) (most commonly used version)
> 
> binutils - GNU ld (GNU Binutils for Debian) 2.40)
> 
> emulator/hardware - Qubes HW (**need details regarding machine, firmware,
> etc**) , qemu 6.2.0 (From yocto, poky distro - 4.0.5)
> 
> dom0/domU kernel - kernel 6.1.19
> 
> rootfs - alpine-3.12-rootfs
> 
> firmware - BIOS Dasharo (coreboot+UEFI) v1.1.1 02/22/2023 , EFI v2.70 by EDK
> II , SMBIOS 3.3.0 , SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen), GRUB
> 2.06~rc1

I do use an LLVM based toolstack, so that's usually latest LLVM import
on FreeBSD.  We do also test this on the cirrus-ci, see:

https://github.com/royger/xen/runs/5334480206

I_n any case I think the scope to some of the questions is unknown,
it's not feasible to expect to list every possible combination of
Linux versions vs Xen version vs whatever guests versions a given
developer might be running.

Regards, Roger.

