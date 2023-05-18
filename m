Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B44707C25
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 10:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536244.834401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzZ68-0007LF-7n; Thu, 18 May 2023 08:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536244.834401; Thu, 18 May 2023 08:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzZ68-0007Ic-4R; Thu, 18 May 2023 08:34:56 +0000
Received: by outflank-mailman (input) for mailman id 536244;
 Thu, 18 May 2023 08:34:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=joHs=BH=citrix.com=prvs=495b323d3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pzZ66-0007IW-Sa
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 08:34:55 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dab760dd-f556-11ed-b22b-6b7b168915f2;
 Thu, 18 May 2023 10:34:52 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2023 04:34:38 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6769.namprd03.prod.outlook.com (2603:10b6:510:120::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Thu, 18 May
 2023 08:34:33 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 08:34:33 +0000
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
X-Inumbo-ID: dab760dd-f556-11ed-b22b-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684398891;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yYyjy6cYQ7Zlm7OGQQ3EZXNb98J8mMHDjexKfljOy80=;
  b=bSDBTN5gg9TVbQYgeZI5NnD7JECkOle5f1454SCxndBNgTX7MKPXMeZJ
   9LAPv7/XEZOqSTVyCVdQ/ta7CTI7QzNG0rJwh2r4AQmzbjkBdp9UyraKy
   dL3ux2Hetq+3jAke6yeYMDLXkTzmUj2iSYZKxXjP4Onk26TjzLSmnVXh+
   4=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 108247284
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xAMSIa2EY4YO4PJfa/bD5TNwkn2cJEfYwER7XKvMYLTBsI5bpzUEy
 WYdWjyAafiNMGWkctEnad+zoEoH6MKGzNJnGlZqpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFnNagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfDjhi0
 KAeNC00MzucjcaqkOO1eMZMmZF2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFIZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13r+VwXyhCN56+LuQ6KJLrGC06GoqCz4MBFrq5si1mFOBRIcKQ
 6AT0m90xUQoz2SwVcX0VRC8pH+CvzYfVsBWHul87xuCooLW6QuEAmkPThZadccr8sQxQFQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJSM17t/iqccJhx3OR9pqE6moptTwFXf7x
 DXihDMiirsai8lNzLmy913DhzOqp7DASwJz7QLSNl9J9St8bY+hIoautl7S6K8YKJ7DFwHf+
 n8Zh8KZ8eYCS4mXkzCAS/kMG7fv4OuZNDrbghhkGJxJGymRxkNPtLt4uFlWTHqF+O5fEdM1S
 Cc/YT9s2aI=
IronPort-HdrOrdr: A9a23:C0osjaA6KZD/GJflHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: =?us-ascii?q?9a23=3AzsO782gDEWQDhQTmMv3H18ee8DJufSTx6SvWP1K?=
 =?us-ascii?q?BVE12QpmJGQ6eyoxEjJ87?=
X-Talos-MUID: 9a23:zdlOpwSSSJKhuVIbRXTy2BBOCeBG5Z2tK1pckMRBisWWKBNvbmI=
X-IronPort-AV: E=Sophos;i="5.99,284,1677560400"; 
   d="scan'208";a="108247284"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDj1Bw4xwXn7sFbso6cO11RL6ll6YBwvJvxDx88NYvbglgenJrmOWrR49H0FWem+67w196iLVI8OaMDnsxUUl1C7+Uh/wHyl41BtLG2TFqAqan6UZfTfRpmVxRYRh/rfEFJOepXectlSV9mbEa+YNW7goxtKnXp5vxXXZk4vj0EInbL46lJN5L7uBkS+WyuNYA7gdgnEoi/RauWKfRYkdnaTsdhyW5CfEWAhhwihOr8OmV0n3KBbZMnnjidwAWzsOg6Ladlbis7PsaYHjuHpLoRf/O8MK7MS2RBe6d7evprh1iKoyqTwJQaKCSLdQVFECk5MBjKCe/WwmemT+m3rzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umiSJINlN7iH5/qvE4Jx983fQszMg/7S/RA0VjeOv14=;
 b=coiXy1qGPgTEU7TMnqONerqfPF4ZSdPRiDKsk+xHX4+gtYIVeCKkyNu+VjEE1He1eeVzq/L7bkNRg5If0BJOOMYTEyhwNyye3HvGt/tTz6F3FSE1Cwei3Cgms0PuCA3vhKVQThfi4uMKMUPTifM3rM+rZrclM+JlPHiG4+08jHZyO2mEkdwPT+BNVPgEGeUiHi1qUf44oZa4OsLqil2poyhNrKHfIK75M0fiqmCb83Sy3/WCDahBGTQunlrrxZU5hCcij3nKzmurZVr+yGQ9yV3EuCmGmKxe9XTnxitAyvSjKqNIyCpdeT1/KoAPDpfdsWSynh+UkaPsakJnhrDbJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umiSJINlN7iH5/qvE4Jx983fQszMg/7S/RA0VjeOv14=;
 b=jDRFa9amZ4UHoVx30RwdsS5tUbXF4bnn4QuDQxeaHxwjZongi4dj49g6R1Mk22fKc5Hgh6Mg5nofbCFa8fn2yVBxjs2ENRgRK6dbABkw1D+O4LEax8bTg/U/phBdF0MWQUlFVAiym7SB00Z9Jlu9tF0k2oYFL3Didq6Ba3uqmNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 18 May 2023 10:34:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com,
	xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
Message-ID: <ZGXjEQ2yM5CXqn3c@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-2-sstabellini@kernel.org>
 <ZGH+5OKqnjTjUr/F@Air-de-Roger>
 <alpine.DEB.2.22.394.2305151656500.4125828@ubuntu-linux-20-04-desktop>
 <ZGNLArlA0Yei4Fr0@Air-de-Roger>
 <alpine.DEB.2.22.394.2305161522480.128889@ubuntu-linux-20-04-desktop>
 <ZGSTGIMh6qvCLZSr@Air-de-Roger>
 <alpine.DEB.2.22.394.2305171354590.128889@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2305171354590.128889@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO4P123CA0199.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 297b8550-87de-4c29-52fa-08db577ab45e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H50f6fRS6oAgaiE3Zjt4C+bz9OJOlf9j3fOua5KC9UK2rsvCoKREDWYPOoYkNfLQTiy2MMax/T0YojwcZiNUxmsXl8Qc9givsc/Qz1j2REOiR2jC96plb6vfOok4/wK9avgctohMewMeyW+uiVXX3JU+zwdVjzkoO3CqpwIFl3PgIiGfOBu3eQby6spuhYnBo2B1FNDVz/stYfGSvjhopAboIEtWP5MKAzcT+5YPG4TBEuLemBYglzcZ2wkigtkAh/9A4hi6cdz507PsDHMPlpl8bAtuLO6/th0PXPt7xw8bfpYIIpju8/ZEmC6dhsJqGIOqUf2+t9nAPlntVnfF8Sl10ggiw81ad1PhVVrYUi7qrBQN+rVkiEkrSFnqeJNzb2mubz+FcSX/uR8E9uXUF/enPE5uI66sjqyXuJbvhI2tjIcHPzRxtaflK8AwXQM8B0EUDy4kEQXLGW8OMYX7B642QjxGyZwpweGYnDb4Zov0BXFVKJw3zClQaejEcMSvJ0XgdgrTkIIsrCcKH6BhH2MuoPlcuWpy1Y8xUMQNbO2Hu5fUjujWeo+W/xHr0oQE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(478600001)(6512007)(26005)(6506007)(186003)(9686003)(6666004)(6916009)(4326008)(66476007)(66556008)(82960400001)(83380400001)(66946007)(6486002)(41300700001)(5660300002)(316002)(8936002)(8676002)(2906002)(30864003)(86362001)(38100700002)(66899021)(33716001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SSt2NS9xanc1SXNJbjU2VC9aUm9uSlFBREREbkZWeGFCZ1NlNGR4UGRRbERX?=
 =?utf-8?B?ckE0dFU4UHlqd1FMM1NZKzRlVjlTRk9sRlltN0U1ZWsvOGdZS2liak5XYVdz?=
 =?utf-8?B?NU9FT2JkYzJncEU4ZUJrbmZQbHhuSDkzN0hxSldKLzd3MitnRTZLV1h2Nmk1?=
 =?utf-8?B?d3lnOEFGZXhNZjdOaVIvQ3pzaXV4OERUZFJyQUpHQllibG1Vd09FMlpaUjc5?=
 =?utf-8?B?ekdqZjBuUEJTSGlXb2txT2JJWFNCSTY4K2Rnb3IzTitCNkxGRDF5RjljSy95?=
 =?utf-8?B?OUVxa2ZoSEhRQ1RrTU13dXRQZHducFpibm1VWlFqajJXVGw4ZTM5Uno5NzV0?=
 =?utf-8?B?SDFIMTVqUGtBaXpLQVRMWnpUc05OK0hGZm9ZbU5SRFd3UWxNTWxnWE82QVZz?=
 =?utf-8?B?T0tyK1dIOUc0R0VEeUs4TFNlbWFFSjBUOHVESzBaOU1sTU9BaVI3OGxMbkQw?=
 =?utf-8?B?a1RhazFrZmNOL1g2d3R6bVQrek9WdzFXUXA5bVNXQ1R0V3o1MFpaay9kTW5D?=
 =?utf-8?B?VTA0Z21aNjh2Ni85bitITXRHRDBJSUZwZjl4RGF6UzY4M2RQUWpGMitEdTR0?=
 =?utf-8?B?ejlMM0Nqc21IYkc4b3VVS0JTV2szUlJ3MTQwQktBempZVTQ3UklFTWlUU3ZK?=
 =?utf-8?B?YkdnSExCbDlacHF1MzQveXVkdkJlYm81VytHWGwzVk5uem93Z0tycWh1cDZq?=
 =?utf-8?B?QTBuSlNPM291TUlUcERGSStrTTQzcFB5aFdXT2hSd0s3a2tjb0tuNUVENmdr?=
 =?utf-8?B?VE13ZDFWbENEcUhmSTJFZ0NUaEJDM3E4TzVwNm9OWFpqTHM2d3RJMU5mWE9r?=
 =?utf-8?B?UTVvbXo4N25QeVdRY0hSSWZrajhTdm1zVDJCd1AvOFVtOC9EazQvWUhLbDlS?=
 =?utf-8?B?Vkc2c3ZyME8wdjNLOHQyREJiVU5XM0ZkK0ZMRXNLOG1DY0gyWXI3YlkyME1u?=
 =?utf-8?B?TmU1dkh3dTZ4NU9yTzd5a3dPYkYxVVNwSkdFaHA5cFg1ejRkNmdCVmUrcFdQ?=
 =?utf-8?B?SlNzMUE0SVQ4MVpzYXhuMDR5RE5wWHFtWlFUYUdJcXM2bGdDRGRNSE5SMFJx?=
 =?utf-8?B?L0JQL01Qc25ZMUIyTzd6TGhyNWxFOENHUUF3djhCSU91TnQzcnZ3dlNrdkNO?=
 =?utf-8?B?K09mUy83a3VGak8zZEFhbWFMR0ttT2ptVVdXaTgwQWsxbU9NU0s1WWU4cFJY?=
 =?utf-8?B?U3drZUl3YmxpK1dzNWhvUmpRNkJHL3dFbUVPamd0MmhLb0RWVWZyQ0dyWjRs?=
 =?utf-8?B?d3NYcHJQWUhiV1VVc04zVGp3Ym9wRG5xU1c3SElvTVRCNk1VOXJCTUphUmJP?=
 =?utf-8?B?aDd2amVkdnpyK2VEejFOdVhkWWlyN25KWnQ2TldIUG1ZTXlaTnBCSzZBcDZr?=
 =?utf-8?B?MVNiQm54L1RMQllRRDNmcE11ODJCUUpqVE81ZGlzUTBiMWN6S21GVEtJUms1?=
 =?utf-8?B?NHVhV0NlNGJQbHZiajZIZWFvemhnc0k2OWtIWlpnYzJ0a2hNd3JpWGEydy9x?=
 =?utf-8?B?NGFRVzdHcVI0NEkzVUI5R3FRT25JWUNCem1iT3B0am8wSzlBdWRVdDU3VkJt?=
 =?utf-8?B?RGo1UHJ6WTVZOFJlWmlERVE5TWVNL1dkM1AvYkw5Rm5zS2l4RHVBVVJUdWp2?=
 =?utf-8?B?eE1UUStyTHBidS90RDhIRTlZdDllV1N1MW9hM2wrazBhQW1ML285ODUvNG1T?=
 =?utf-8?B?U1FiVkNVcFlzVEg3MXFpMXlIQURPdm9PaXFCUFdGNDlXMUVPZm5WeFVKN2pn?=
 =?utf-8?B?ZUdBajhyK2hMdUFnSU9aSVZuZm5zU1dKTWk0T1BCTCs1aDN3ZXlrVTBaNmVU?=
 =?utf-8?B?Zi90aE5vV3JSTnNpS1k3ZGtYN2wwZFZFYzFidnNZbm5OVW44clA1UVQ0dmFq?=
 =?utf-8?B?VmNZTTR3VURWNnZLZjhzekh3Y3cvSGNtRzhDaFNlTDk3MGZqclhpSUlnaG9O?=
 =?utf-8?B?bnMzdVFKK01RUUd3Q1RxeFI4VXVSTUEyWlk1M2tPRUFMV0ViWUl0QjF5bEl6?=
 =?utf-8?B?ZHgyMXIzUk1MeTJ6ZysyY2lQNzhPeVV2SHpWTG1od2FGaXV2MGx4TmxYTElp?=
 =?utf-8?B?ZmttQlpBOHVnaGUvNnpzRG5SNU5EVWhjdVhQT3ljSzdzcjJ6S1dKeGIyMVBw?=
 =?utf-8?Q?qj2nn/INkj9PqL8EkWnafVm2P?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KYM3z+xGTiugboyTd7roKnioIaIBr8RDPJrsvC0zqJnjH1kjlgetbcuBKKeqi8p8bG/o1V0Ci1ud5LWEefe8WFPb26tBYJtL4BlTO3RJEhV9utwWuZ7T4OMEmWLLtpHr8hh2zNKcPV9q0gXrJGs9fzKCXI0l/M1o3ZXRR4x1JaY/FT9USErydNDvGW9rZAbLOo/95TwbWTnfzouaXdjvqKXYJepSSs/pNZ7QY8NLV1CZUqjVPcuIo2ZYWevV14K+IIM+wQryc09fnw1lXpIKojCDGVSueh1vBJtQpn0D2D3+zkzRbYN7I4MH5LUNPY5O2BQw7OICGTrj+G+DnR/dVynhV12U2VWG4LCjivvsCFE2OXi5LXrCtS5xLc6zaMwiXKODDc1VhsomxA0wxR0KUyeOyLNdXbHnF2K9i+cjAYVVAJ0N2csgsvXdpsfoA2iWl5vHOP6lJrv4yzm3nwizIBkRQbuGAM8p3tY7oUxTd1BjQLSxOvjRdr9WiOte1L2PrPuD3TySs9dV27MrRfr3PjpxWqoyMtvIg/4u5RvYJ9pjnuEg4iklcp2H2K3cVzoLgSoV1RTahsBscEEMzZGWuLpmkmweOOPt2QMYdqdmcvGeoZ9yft23eA+skr7tSNNUyi7PDv+WOw2lyr0PNNu4Uf+FBuOrULhVRNzPJ5jrmwimJVl3i/h0B8hZ3xfiAvh9rbt+8v9sRbgM5ZIS6Ze2mn+s8gCy7GjnRowApf5m+yI1RylnicYNxDydcVBXYxzFrP2fABY7dbLNAZNLcVi7v1JsKzXMQU+zIpXcRqngsv1U8EURoooVsE0QLqXK3T++V3dWg8iU8g8q30t2QXpq6JRq8TbLy84dgySJsAwDzQw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 297b8550-87de-4c29-52fa-08db577ab45e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 08:34:33.1464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2wCCo2UBmxXZStd1/h+2UupshJynhpIa4OLV/MHQg6QL0PQO4rHZj/2+6atfFr+PoMCvyKjVduTZ4Xo57Ympg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6769

On Wed, May 17, 2023 at 02:00:01PM -0700, Stefano Stabellini wrote:
> On Wed, 17 May 2023, Roger Pau Monné wrote:
> > On Tue, May 16, 2023 at 04:34:09PM -0700, Stefano Stabellini wrote:
> > > On Tue, 16 May 2023, Roger Pau Monné wrote:
> > > > On Mon, May 15, 2023 at 05:11:25PM -0700, Stefano Stabellini wrote:
> > > > > On Mon, 15 May 2023, Roger Pau Monné wrote:
> > > > > > On Fri, May 12, 2023 at 06:17:20PM -0700, Stefano Stabellini wrote:
> > > > > > > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > > > > 
> > > > > > > Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
> > > > > > > the tables in the guest. Instead, copy the tables to Dom0.
> > > > > > > 
> > > > > > > This is a workaround.
> > > > > > > 
> > > > > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > > > > > ---
> > > > > > > As mentioned in the cover letter, this is a RFC workaround as I don't
> > > > > > > know the cause of the underlying problem. I do know that this patch
> > > > > > > solves what would be otherwise a hang at boot when Dom0 PVH attempts to
> > > > > > > parse ACPI tables.
> > > > > > 
> > > > > > I'm unsure how safe this is for native systems, as it's possible for
> > > > > > firmware to modify the data in the tables, so copying them would
> > > > > > break that functionality.
> > > > > > 
> > > > > > I think we need to get to the root cause that triggers this behavior
> > > > > > on QEMU.  Is it the table checksum that fail, or something else?  Is
> > > > > > there an error from Linux you could reference?
> > > > > 
> > > > > I agree with you but so far I haven't managed to find a way to the root
> > > > > of the issue. Here is what I know. These are the logs of a successful
> > > > > boot using this patch:
> > > > > 
> > > > > [   10.437488] ACPI: Early table checksum verification disabled
> > > > > [   10.439345] ACPI: RSDP 0x000000004005F955 000024 (v02 BOCHS )
> > > > > [   10.441033] ACPI: RSDT 0x000000004005F979 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
> > > > > [   10.444045] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
> > > > > [   10.445984] ACPI: FACP 0x000000004005FA65 000074 (v01 BOCHS  BXPCFACP 00000001 BXPC 00000001)
> > > > > [   10.447170] ACPI BIOS Warning (bug): Incorrect checksum in table [FACP] - 0x67, should be 0x30 (20220331/tbprint-174)
> > > > > [   10.449522] ACPI: DSDT 0x000000004005FB19 00145D (v01 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
> > > > > [   10.451258] ACPI: FACS 0x000000004005FAD9 000040
> > > > > [   10.452245] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> > > > > [   10.452389] ACPI: Reserving FACP table memory at [mem 0x4005fa65-0x4005fad8]
> > > > > [   10.452497] ACPI: Reserving DSDT table memory at [mem 0x4005fb19-0x40060f75]
> > > > > [   10.452602] ACPI: Reserving FACS table memory at [mem 0x4005fad9-0x4005fb18]
> > > > > 
> > > > > 
> > > > > And these are the logs of the same boot (unsuccessful) without this
> > > > > patch:
> > > > > 
> > > > > [   10.516015] ACPI: Early table checksum verification disabled
> > > > > [   10.517732] ACPI: RSDP 0x0000000040060F1E 000024 (v02 BOCHS )
> > > > > [   10.519535] ACPI: RSDT 0x0000000040060F42 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
> > > > > [   10.522523] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
> > > > > [   10.527453] ACPI: ���� 0x000000007FFE149D FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> > > > > [   10.528362] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> > > > > [   10.528491] ACPI: Reserving ���� table memory at [mem 0x7ffe149d-0x17ffe149b]
> > > > > 
> > > > > It is clearly a memory corruption around FACS but I couldn't find the
> > > > > reason for it. The mapping code looks correct. I hope you can suggest a
> > > > > way to narrow down the problem. If I could, I would suggest to apply
> > > > > this patch just for the QEMU PVH tests but we don't have the
> > > > > infrastructure for that in gitlab-ci as there is a single Xen build for
> > > > > all tests.
> > > > 
> > > > Would be helpful to see the memory map provided to Linux, just in case
> > > > we messed up and there's some overlap.
> > > 
> > > Everything looks correct. Here are some more logs:
> > > 
> > > (XEN) Xen-e820 RAM map:
> > > (XEN)  [0000000000000000, 000000000009fbff] (usable)
> > > (XEN)  [000000000009fc00, 000000000009ffff] (reserved)
> > > (XEN)  [00000000000f0000, 00000000000fffff] (reserved)
> > > (XEN)  [0000000000100000, 000000007ffdffff] (usable)
> > > (XEN)  [000000007ffe0000, 000000007fffffff] (reserved)
> > > (XEN)  [00000000fffc0000, 00000000ffffffff] (reserved)
> > > (XEN)  [000000fd00000000, 000000ffffffffff] (reserved)
> > > (XEN) Microcode loading not available
> > > (XEN) New Xen image base address: 0x7f600000
> > > (XEN) System RAM: 2047MB (2096636kB)
> > > (XEN) ACPI: RSDP 000F58D0, 0014 (r0 BOCHS )
> > > (XEN) ACPI: RSDT 7FFE1B21, 0034 (r1 BOCHS  BXPC            1 BXPC        1)
> > > (XEN) ACPI: FACP 7FFE19CD, 0074 (r1 BOCHS  BXPC            1 BXPC        1)
> > > (XEN) ACPI: DSDT 7FFE0040, 198D (r1 BOCHS  BXPC            1 BXPC        1)
> > > (XEN) ACPI: FACS 7FFE0000, 0040
> > > (XEN) ACPI: APIC 7FFE1A41, 0080 (r1 BOCHS  BXPC            1 BXPC        1)
> > > (XEN) ACPI: HPET 7FFE1AC1, 0038 (r1 BOCHS  BXPC            1 BXPC        1)
> > > (XEN) ACPI: WAET 7FFE1AF9, 0028 (r1 BOCHS  BXPC            1 BXPC        1)
> > > [...]
> > > (XEN) Dom0 memory map:
> > > (XEN)  [0000000000000000, 000000000009efff] (usable)
> > > (XEN)  [000000000009fc00, 000000000009ffff] (reserved)
> > > (XEN)  [00000000000f0000, 00000000000fffff] (reserved)
> > > (XEN)  [0000000000100000, 0000000040060f1d] (usable)
> > > (XEN)  [0000000040060f1e, 0000000040060fa7] (ACPI data)
> > > (XEN)  [0000000040061000, 000000007ffdffff] (unusable)
> > > (XEN)  [000000007ffe0000, 000000007fffffff] (reserved)
> > > (XEN)  [00000000fffc0000, 00000000ffffffff] (reserved)
> > > (XEN)  [000000fd00000000, 000000ffffffffff] (reserved)
> > > [...]
> > > [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
> > > [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x00000000000fffff] reserved
> > > [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000040060f1d] usable
> > > [    0.000000] BIOS-e820: [mem 0x0000000040060f1e-0x0000000040060fa7] ACPI data
> > > [    0.000000] BIOS-e820: [mem 0x0000000040061000-0x000000007ffdffff] unusable
> > > [    0.000000] BIOS-e820: [mem 0x000000007ffe0000-0x000000007fffffff] reserved
> > > [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
> > > [    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
> > > [...]
> > > [   10.102427] ACPI: Early table checksum verification disabled
> > > [   10.104455] ACPI: RSDP 0x0000000040060F1E 000024 (v02 BOCHS )
> > > [   10.106250] ACPI: RSDT 0x0000000040060F42 000034 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> > > [   10.109549] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> > > [   10.115173] ACPI: ���� 0x000000007FFE19CD FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> > > [   10.116054] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> > > [   10.116182] ACPI: Reserving ���� table memory at [mem 0x7ffe19cd-0x17ffe19cb]
> > > 
> > > 
> > > 
> > > > It seems like some of the XSDT entries (the FADT one) is corrupt?
> > > > 
> > > > Could you maybe add some debug to the Xen-crafted XSDT placement.
> > > 
> > > I added a printk just after:
> > > 
> > >   xsdt->table_offset_entry[j++] = tables[i].address;
> > > 
> > > And it printed only once:
> > > 
> > >   (XEN) DEBUG pvh_setup_acpi_xsdt 1000 name=FACP address=7ffe19cd
> > > 
> > > That actually matches the address read by Linux:
> > > 
> > >   [   10.175448] ACPI: ���� 0x000000007FFE19CD FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> > > 
> > > So the address seems correct. It is the content of the FADT/FACP table
> > > that is corrupted.
> > > 
> > > I wrote the following function in Xen:
> > > 
> > > static void check(void)
> > > {
> > >     unsigned long addr = 0x7ffe19cd;
> > >     struct acpi_table_fadt *fadt;
> > >     fadt = acpi_os_map_memory(addr, sizeof(*fadt));
> > >     printk("DEBUG %s %d s=%s\n",__func__,__LINE__,fadt->header.signature);
> > >     acpi_os_unmap_memory(fadt, sizeof(*fadt));
> > > }
> > > 
> > > It prints the right table signature at the end of pvh_setup_acpi.
> > > I also added a call at the top of xenmem_add_to_physmap_one, and the
> > > signature is still correct. Then I added a call at the beginning of
> > > __update_vcpu_system_time. Here is the surprise: from Xen point of view
> > > the table never gets corrupted. Here are the logs:
> > > 
> > > [...]
> > > (XEN) DEBUG fadt_check 1551 s=FACPt
> > > (XEN) DEBUG fadt_check 1551 s=FACPt
> > > (XEN) DEBUG fadt_check 1551 s=FACPt
> > > (XEN) DEBUG fadt_check 1551 s=FACPt
> > > (XEN) d0v0: upcall vector f3
> > > [    0.000000] Linux version 6.1.19 (root@124de7fbba7f) (gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 SMP PREEMPT_3
> > > [    0.000000] Command line: console=hvc0
> > > [...]
> > > [   10.371610] ACPI: Early table checksum verification disabled
> > > [   10.373633] ACPI: RSDP 0x0000000040060F1E 000024 (v02 BOCHS )
> > > [   10.375548] ACPI: RSDT 0x0000000040060F42 000034 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> > > [   10.378732] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> > > [   10.384188] ACPI: ���� 0x000000007FFE19CD FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> > > [   10.385374] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> > > [   10.385519] ACPI: Reserving ���� table memory at [mem 0x7ffe19cd-0x17ffe19cb]
> > > [...]
> > > (XEN) DEBUG fadt_check 1551 s=FACPt
> > > (XEN) DEBUG fadt_check 1551 s=FACPt
> > > (XEN) DEBUG fadt_check 1551 s=FACPt
> > > (XEN) DEBUG fadt_check 1551 s=FACPt
> > > 
> > > 
> > > So it looks like it is a problem with the mapping itself? Xen sees the
> > > data correctly and Linux sees it corrupted?
> > 
> > It seems to me like the page is not correctly mapped, and so 1s are
> > returned? (same behavior as a hole).  IOW: would seem to me like MMIO
> > areas are not correctly handled by nested NPT? (I assume you are
> > running this on AMD).
> > 
> > Does it make a difference if you try to boot with dom0=pvh,shadow?
> > 
> > A couple of wild ideas.  Maybe the nested virt support that you are
> > using doesn't handle the UC bit in second stage page table entries?
> > You could to remove this in p2m_type_to_flags() (see the
> > p2m_mmio_direct case).
> > 
> > Another wild idea I have is that the emulated NPT code doesn't like
> > having the bits 63:52 from the PTE set to anything different than 0,
> > and hence only p2m_ram_rw works (p2m_mmio_direct is 5).
> 
> Many thanks to Xenia for figuring out the root cause of the bug. The
> underlying memory region is already added as E820_RESERVED to the guest
> (instead of E820_ACPI). When pvh_add_mem_range is called with E820_ACPI
> as parameter for the interesting table, pvh_add_mem_range returns with
> -EEXIST without doing anything.
> 
> The original fix by Xenia was to carve out the relevant subset of the
> reserved region and mark it as E820_ACPI. Instead, I rewrote it as
> changing the type of the entire region to E820_ACPI because it is
> simpler and doesn't have to deal with the edge cases (partially
> overlapping, overlapping 2 existing regions, etc.)
> 
> What do you think?

Hm, I'm unsure whether wholesale converting reserved regions into ACPI
ones is correct, for example Xen will handle reserved regions specially
when creating the IOMMU mappings, and RMRRs are also expected to live
in reserved regions.

The issue is IMO with the usage of dom0-iommu=none, which leads to
reserved regions not mapped in the dom0 physmap (see
arch_iommu_hwdom_init()).

One option might be to move the mapping of reserved regions from
arch_iommu_hwdom_init() into PVH dom0 build (as part of
pvh_populate_p2m()) and thus render arch_iommu_hwdom_init() PV only.
That would also imply that for PVH dom0 `dom0-iommu=map-reserved` is
fixed cannot be modified (iow: reserved regions are always added to
the PVH dom0 physmap).

Thanks, Roger.

