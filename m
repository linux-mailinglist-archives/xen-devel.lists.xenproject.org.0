Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6077355A5
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 13:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551020.860302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBCy6-0007Po-PY; Mon, 19 Jun 2023 11:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551020.860302; Mon, 19 Jun 2023 11:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBCy6-0007O8-Md; Mon, 19 Jun 2023 11:22:46 +0000
Received: by outflank-mailman (input) for mailman id 551020;
 Mon, 19 Jun 2023 11:22:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0708=CH=citrix.com=prvs=52710b0ac=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qBCy5-0007O2-Fo
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 11:22:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ad65625-0e93-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 13:22:43 +0200 (CEST)
Received: from mail-bn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2023 07:22:21 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by LV8PR03MB7470.namprd03.prod.outlook.com (2603:10b6:408:192::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 11:22:19 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 11:22:18 +0000
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
X-Inumbo-ID: 9ad65625-0e93-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687173763;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YqPfMsvTFJDvOA9NkEElmZO1j0rqDWIgpItp1djNYqI=;
  b=eZJf5+eWCAGTSKKtUs3uEKqIAP6rmWNYYIWsC/Jq5Ah58w1uTErBL7Oj
   9Twaz6S+ZAYFkmAhDU7crk6zjXWZ+uJIvFaCp2eQxm5BjhaHf1Cd6Sdoe
   G8EDBACOX/FUF2FuOrmknaR38fUws+Ebw4eUxBKXO6v7/vtNDNumLtK6H
   E=;
X-IronPort-RemoteIP: 104.47.51.45
X-IronPort-MID: 113722971
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2oioH6wVgqicDGiaTD16t+f6xyrEfRIJ4+MujC+fZmUNrF6WrkVUz
 2ZNWmyFOaqCZTDwLdx+PoywoBhV65TWzdVqTlY4/yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPKET5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWp3r
 vshCxpTVR+KpaW757aJUNVOue12eaEHPKtH0p1h5RfwKK58BLrlGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjGVkFEZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137SQx3mqB9t6+LuQteBMv22wgXQqWV5JeWGgrNznh2+uRIcKQ
 6AT0m90xUQoz2SpU8H9Vhjh+iOssRsVWt4WGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaESofIHIGZCQEZRAY+NSlq4Y25jrNQcxkC7WdlcDuFHf7x
 DXikcQlr7AajMpO3aPi+1nC22iovsKRElNz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6ft3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:U7j+GKCwFPs556vlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: =?us-ascii?q?9a23=3AUrqzrWl1OLg33ZkJUwvJwsy7xYTXOXbkl3DpAGX?=
 =?us-ascii?q?mMmlgavqYblui4p9GrOM7zg=3D=3D?=
X-Talos-MUID: 9a23:as4ImAih5JAFLiSQdV7Y08Mpd9lO3JSNT1g0wNZZl/OfOAkuNhaNk2Hi
X-IronPort-AV: E=Sophos;i="6.00,254,1681185600"; 
   d="scan'208";a="113722971"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9XJuYq2lMJDLoLgqC3fY4bwUtgPbZCpYQGXSUihbBWDiMzezFhCuYBn3vYUo15Y5UJX+T4maR+eiyB7ym988HDzzAuciz7DlpjOPKY2o/A82OBgADOURxWA5usQ3IJUHK+Ula403CyyCNTF5P4BdDvEd3OUdFYSHgxJDLR0ziniwqIPhOtMqN76arqVM0pDMzzy6HW481NJNoHq5YfpqNoDxn735nfsrkb8lbn0kAzinfmza4m9yfgNF6WnT2IamLz2AsWNtQbD9fwHeWGogyJE6jzqtQo5mrv9WsgitRbnLQCB0TR30kxNDcyMnGmaAWcvM8SF4T/UBhcctUvZaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAD+krmLdS4uUTUyM6ETM0wmungCk7wqOGUk/sKZjls=;
 b=eHIja/1yT6VVQLPCY9s5/1nahd5dCSJzmlKuBM/GLBSifMtbRwSWE3A652x23aGoveI2q6dmpnYPynsnRxZKvhXfDIEwTWiAMQzsw55InNkav/KLZ6bPImphOS0Fva8XKfj2GM09p+uiAdForzPfYiKdJ9IsuTuGVfRBpDlpiP/kxqRToSjbPWSxi2gG9ADQ/oFoVvxhSNL6Cy9dlqzf4mGPXVVpf3+Gl6O3bw0+ET4IUAAVcapgcDia1grRkhsd55Ydz8LyTzdOz2mJFZW5HBNpZSeYpxYYuw/3zYcCO4EE+GpkEpgcr9wb0oZ5zTfKL0Z3iww2m85+ple2JKrOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAD+krmLdS4uUTUyM6ETM0wmungCk7wqOGUk/sKZjls=;
 b=sXgNCSh1JI1ORyXzu19qCmNPU2HQPgCOAbk51gaZmq0QYoyKRVivm0mkxepS8N78Vr5QSivazJ9vVjtGNWIOx62XXxUp/oJ0ymJtcTgkQbebutnxou6MhkUgBx10j8hM+jrxuH7tlgu2CiVBhAr784rQJ4aoHYh3xK3CjqI52c4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 19 Jun 2023 13:22:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Joel Upham <jupham125@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v1 0/1] Q35 Support
Message-ID: <ZJA6ZGPlqX4pZ/d4@MacBook-Air-de-Roger.local>
References: <cover.1687121835.git.jupham125@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1687121835.git.jupham125@gmail.com>
X-ClientProxiedBy: LO2P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::32) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|LV8PR03MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: ce70934d-fece-4dbd-4cc3-08db70b77133
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4cbbMegli5NQhTi469qibVHuBVF6mcwiz5Fxs/KVm9KrjBhjxd+Wv3/KQYtqBUHwmrV1dy2VL1ZRx5YqPARbHbP5Bp4WcGSuZa2gmnxA0c7E0USa0TMOEo4J4OBaPGh1stJhCed5NDINaYE5dwJnVK9pywNw5t28HEMCZj7WnJ659AtvV4w6hD15jZz6/SgyhAkIGvbLfg8pU2NDaqJOB8icazdy685TFCro4t60FZdBd95SKYns1B6gTQC84Wpdctnib+WoNEF8uWvTF83vGngVAtpFynxdVhqSoNPJpGP7mBYSopBvprliDBm/mNRWD8R8VNSAG/v+FyYuwBd6/uVP56n1/GEX6unaxQWxinKEQwbnkJCOR0So1KXnwBUtFaA4vYXOXUEDnj8x6bM/4/cuXNoNKjdt9uMRd58uCldNVm5neQ2nigp4FLomyiA+DAET3yFVcSKL6MU4qOHeswptjv3XpBgPbWFA8HtUBiAY7v1xHeWbkXCmaloSTnPypVMoJvs76zl64KYpQuxdQdVFgYiJnmk0CK1JD9CXdtA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199021)(82960400001)(83380400001)(38100700002)(86362001)(41300700001)(8936002)(8676002)(5660300002)(6916009)(66556008)(66476007)(66946007)(316002)(6506007)(6512007)(9686003)(26005)(966005)(6666004)(186003)(6486002)(478600001)(54906003)(4326008)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjI0dmh4VnRwd0JCMjB6YW9ueStDWjNYZkpLbktiRGZQNEJjWGt3bU0vcGpX?=
 =?utf-8?B?bzFyYkduR1dkaU5UU0xGSVR6Ykh5RnR0Zi9qNzIrOUlMc0ZyQ1EvdWdURzIv?=
 =?utf-8?B?UHM4Wk43cytCY3d0bHF2eWZxTUd1dEpHUUdBTnFINUdTUWpYdFhlaTFmdmtX?=
 =?utf-8?B?cGRzN0JKM21kRzZBRDQ2cndLbXJXaCt6YkswOEJxa0pxbndrbHRuak5WVzhG?=
 =?utf-8?B?YWJNTFFSOUVhQU5pOEhqR2pyajNpUUlWdERRU3JGZitiMzBaNEJIVTlVc1Z6?=
 =?utf-8?B?Q0YxL0E0UDQvWGVpY3lqWXE3VURrQ3R5RFFEWjJiT3hOblZGMkJoMHNqVXQz?=
 =?utf-8?B?c2kzVTZZeXczaThNdXh4QmpOVGRleHVRS0g4dWg2K3d2Qk5mMGVTVlMvUFRC?=
 =?utf-8?B?ZFhRTkk3NjVTc3lZM2tIYUExODNZS21PZzV4cTMvTHB1SEJ2UE1jVEQwS1JK?=
 =?utf-8?B?dm9WM0Y3ZDBhbWl4ditiT0JpRUxhQjQxc0taVXNvL2VYQmU2ZUdFL0lZa1V5?=
 =?utf-8?B?clhjWXIxclY5NDFqcTloVHB2MTk2bXNRV2txRmh5ZFZ5ekNPMUdZWkgxWndi?=
 =?utf-8?B?ZHd1RWxrK0U4L1BIUWJtSHJ5YzVJSlA5SG9EYkQ4TFd4N3I4MlBQMFhJZ2hR?=
 =?utf-8?B?UlpYakxlMXloT3hzTFFPTVRKd2svb0tyckcva3pqNlpxb2ZDMXc5T2VRd1Ax?=
 =?utf-8?B?MHk2aTgrR2JSRTRaemI4MWNBOTdycklCM25hcHArWmh3ak41MW5rLzc4N0Mr?=
 =?utf-8?B?K3JJSDFFSmdZUmZCM05US0FwWVJFczZidGh0RVJZb0hLZDlYV1hKK0JKOFc1?=
 =?utf-8?B?emR2M1hza3d3b2VkWHBxc25uc3M2TWQ1c085U2d4Sk93anBITHRnS1dyN21J?=
 =?utf-8?B?a0VnM3Q2SXdoaU11aDZnU3Fhb29tQ2QrZm5ONnBGcFFoRUlDcXBkOXoxajMv?=
 =?utf-8?B?OUIyaUhES0ZiMVNrdlBhUTVKNGFrSTIyblo3cW9VQU10cWdod3VVS2dzSWcw?=
 =?utf-8?B?QWVBZ3lJbUtqRGp0aFk5YXJGL29NM2hFQ1JmcmxabHprTER0dUVia1hrTG1T?=
 =?utf-8?B?UXk0bnV2QjRMM3MvQXEwRXhvckdES0NhZ3RUK2F5Sk85QlVCREEyVWVML1VD?=
 =?utf-8?B?MWRIcEpFbTE3TCs1Tko1TE1vYUQwaENUVlVLWlgvZEFhd21raXdEQmRXVktC?=
 =?utf-8?B?TmRYQWIzYlBrMmxUeVpUQjByU0NkM2N4cWYyaWIxOUNYSXA0REZFOEVscERZ?=
 =?utf-8?B?WlBTWW9XNVRKM1FLQWt6aExUM0VXRHBpTG1CK1lyWG51dzVDZ3RNSmhzN2Zy?=
 =?utf-8?B?OHZMTUI5ZDZqTWxYNGhmQ2loVWFiWkpGb1RSdlNxRDdoM2paNFAxRkxCaE5x?=
 =?utf-8?B?cTNpSjBzWlZROEJ2bDUyK3JoVEVCb2tuTmlJY1VKdkRxRDAyS3E1VDMxeldr?=
 =?utf-8?B?YzNVZEFNT3VieUZBRmlQN1F4Q3phdk9Nd0Uyb3ZzRHZIUVloUFFTK0JuNTB2?=
 =?utf-8?B?bFArQ1A5TXNGeERpVVMxeDNqMk9Nb2xvVE9kVVBiMEN2WTB0V3BlOXl2NkRB?=
 =?utf-8?B?TUx5S1FqWHpsSENTSkJxNTc4VisyTDlDWDl1OWQ2YVFLM3hZclZUV1VnWHBZ?=
 =?utf-8?B?eWxwazNhNndhQ0dJcytRaFFjOTZGZFN1bml5RkVtS3ZnV2VFRkIxZ1M2TmY5?=
 =?utf-8?B?VHc0S2pReitDcEgvRWtTTjZtbFZyR1J4UmQrTHI0YVh4cStYeWxVY2RsTVZX?=
 =?utf-8?B?TXBHMUF1andnYnpMdEhqSVBpOXdDa0lzSTArcW1uTnI2SUhqaEN1aWVKTEc5?=
 =?utf-8?B?dUtsbHRuTWx1SDZNSHl6bzJVb2x1dkRHbE9FVktYUHFLRHZYZllkVlRtRllr?=
 =?utf-8?B?VklWdjUvODA0VlYxVWN6UjNCRWZmbHJHSFQ3aEREejRGV3lHb3MxajB1TTBJ?=
 =?utf-8?B?c2N5amhMNGw1bDJXWklINktIa3BRajZTc3ZOYUp3cWVzRjNMaTF0TFMybSs3?=
 =?utf-8?B?QmJqeFc3bHB6cVVSdlMyVC9BbVhlbXJuTERvT21FRFNnS3czOVZibEtPNGxF?=
 =?utf-8?B?OTg0a2lRb1l6YktZOVEvbldadXMrOWlYYWx2VWtjZkdrUW53SmtkajVzYnZi?=
 =?utf-8?Q?9wxglM/lYrbXuY4+HUmgBloUK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y0KNkiLE9GPoPyVcU+3oC+g4D74w8jic7Mvm0yqHn6tF+jiURKjQn4NVfHLxvSYcmvQf57bfyH/ojoeBL3IJa3ekpKQlV10sxqdnbmXGGYrz8UwEQR+8niaig99JVZP9rvPMeXSP4BF+2l5A1ZMObmFbSJq3LtV8C6LZ1UXcs5yz7jHRn90qwP/ITzuAXW+RVWSih1M/o7s1yA9Y8zyqIN2LoXXF5u9g30Wcvny+EuiZpCSyeZezIXSTzRpDMvaFcvJAfoi7hfrzpWc9UoT6b6aRu07QjHID0lFBJ+9nZbFHofFwtGaOD+G6FrSUOA4sYZj6vtAVsepuMwZaajQ5gzjG89q9CpRZl80LvGzUuvrAvQI5EFjByu+/B3f89KRTKWp43/9tIS3ay9HqgwbRrV5LY5r7cCqwAmE5ogWTXz0M+3ENzRMhpPMbuOxX7Fg2BbH14M+vRK8NRyAfYq82Dxp7hJ8O0WNVEbgV66kmPBEdeiNe4qhTZOJfYo8Sy1Ufikfc0xgcfOqg5WNW5PE0S1biNVRmhVn028hcHpfF1fmIzDgN2U0PBMDpGek2ZE9Tj3Q3/v8srcHLGj79E4Yra6RCFblPokTIQJsh0rxqZLrBbCuPfwVbPU8Pil2wjphvpm2oPcvBNtWgg/MQZjqWHF9jpgI7aBTmwN//RK8sai6BOiNAwyRvRruxpP48OfnPqPkYHRBE53vWU0EXCIRSmJ2aH6kXBQZ/Kyio/gGH/SKGhwxTO4Aw7JBjg1X7fjCkRhgkoTUFAvl+HLeju9k5kwmZB41QpsjcSb9TKQqkREtLWcc0sBAs5kCOPWH0wZpZjtRRxY4ep65bCFPGJjJ0XcWmCKNzdsyk5dCV8fUC8zk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce70934d-fece-4dbd-4cc3-08db70b77133
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 11:22:18.6688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1uPaxkbXKCbcGkZaqXXGAmaKmwE3VlDy+YXU729zAiPNezqOwA3Tcwtp7UrmJRI+FLHULrq5eaqWXKWoFyrfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7470

On Sun, Jun 18, 2023 at 06:22:01PM -0400, Joel Upham wrote:
> Q35 support using Qemu's device emulation.  I based the patches from 2017
> found on the mailing list here:
> https://lists.xenproject.org/archives/html/xen-devel/2018-03/msg01176.html
> 
> I have been using a version of these patches on Xen 4.16 with Qemu
> version 4.1 for over 6 months.  The guest VMs are very stable, and PCIe
> PT is working as was designed (all of the PCIe devices are on the root
> PCIe device).  I have successfully passed through GPUs, NICs, etc. I was
> asked by those in the community to attempt to once again upstream the
> patches.  I have them working with Seabios and OVMF (patches are needed
> to OVMF which I will be sending to the mailing list).  I will be sending
> my Qemu patches to their mailing list in hopes of getting everything
> upstreamed. The Qemu patches allow for the xenvbd to properly unplug the
> AHCI SATA device, and all xen pv windows drivers work as intended.
> 
> I used the original author of the patches to get a majority of this to work:
> Alexey Gerasimenko.  I fixed the patches to be in line with the upstream
> Qemu and Xen versions.  Any original issues may still exist; however, I
> am sure in time they can be improved. If the code doesn't exist then they 
> can't be actively looked at by the community.
> 
> I am not an expert on the Q35 chipset or PCIe technology.  This is my
> first patch to this mailing list.
> 
> Recap of changes to Qemu, only here for reference:
>   pc/xen: Xen Q35 support: provide IRQ handling for PCI devices
>   pc/q35: Apply PCI bus BSEL property for Xen PCI device hotplug
>   acpi/ich9: Multiple fixes for S3 support
>   acpi/pcihp: Allow for machines to hotplug when using Xen
>   isa/lpc_ich9: Write lpc configuration for xen IRQs
>   q35/acpi/xen: Provide ACPI PCI hotplug interface for Xen on Q35
>   q35/xen: Add Xen platform device support for Q35
>   q35: Fix incorrect values for PCIEXBAR masks
>   xen/pt: XenHostPCIDevice: provide functions for PCI Capabilities and
>     PCIe Extended Capabilities enumeration
>   xen/pt: avoid reading PCIe device type and cap version multiple times
>   xen/pt: determine the legacy/PCIe mode for a passed through device
>   xen/pt: Xen PCIe passthrough support for Q35: bypass PCIe topology
>     check
>   xen/pt: add support for PCIe Extended Capabilities and larger config
>     space
>   xen/pt: handle PCIe Extended Capabilities Next register
>   xen/pt: allow to hide PCIe Extended Capabilities
>   xen/pt: add Vendor-specific PCIe Extended Capability descriptor and
>     sizing
>   xen/pt: add fixed-size PCIe Extended Capabilities descriptors
>   xen/pt: add AER PCIe Extended Capability descriptor and sizing
>   xen/pt: add descriptors and size calculation for
>     RCLD/ACS/PMUX/DPA/MCAST/TPH/DPC PCIe Extended Capabilities
>   xen/pt: add Resizable BAR PCIe Extended Capability descriptor and
>     sizing
>   xen/pt: add VC/VC9/MFVC PCIe Extended Capabilities descriptors and
>     sizing
> 
> Changes that would be going to upstream Qemu:
>  hw/acpi/ich9.c                |   22 +-
>  hw/acpi/pcihp.c               |    6 +-
>  hw/core/machine.c             |   19 +
>  hw/i386/pc_piix.c             |    3 +-
>  hw/i386/pc_q35.c              |   39 +-
>  hw/i386/xen/xen-hvm.c         |    7 +-
>  hw/i386/xen/xen_platform.c    |   19 +-
>  hw/ide/ahci.c                 |    2 +-
>  hw/isa/lpc_ich9.c             |   53 +-
>  hw/isa/piix3.c                |    2 +-
>  hw/pci-host/q35.c             |   28 +-
>  hw/pci/pci.c                  |   17 +
>  hw/xen/xen-host-pci-device.c  |  106 +++-
>  hw/xen/xen-host-pci-device.h  |    6 +-
>  hw/xen/xen_pt.c               |   49 +-
>  hw/xen/xen_pt.h               |   19 +-
>  hw/xen/xen_pt_config_init.c   | 1103 ++++++++++++++++++++++++++++++---
>  include/hw/acpi/ich9.h        |    1 +
>  include/hw/acpi/pcihp.h       |    2 +
>  include/hw/boards.h           |    1 +
>  include/hw/i386/pc.h          |    3 +
>  include/hw/pci-host/q35.h     |    4 +-
>  include/hw/pci/pci.h          |    3 +
>  include/hw/southbridge/ich9.h |    1 +
>  include/hw/xen/xen.h          |    4 +-
>  qemu-options.hx               |    1 +
>  softmmu/datadir.c             |    1 -
>  softmmu/qdev-monitor.c        |    3 +-
>  stubs/xen-hw-stub.c           |    4 +-
>  29 files changed, 1396 insertions(+), 132 deletions(-)
> *** These patches are not found in this series, if they are supposed to
> be I will send them here as well. ***

It's unclear, do the QEMU patches depend on the Xen side?  I have a
suspicion you likely want to post them mostly at the same time, but
using two different patch series (one for Xen and one for QEMU).

> Recap of changes to Xen:
>   libacpi: new DSDT ACPI table for Q35
>   Makefile: build and use new DSDT table for Q35
>   hvmloader: add function to query an emulated machine type (i440/Q35)
>   hvmloader: add ACPI enabling for Q35
>   hvmloader: add Q35 DSDT table loading
>   hvmloader: add basic Q35 support
>   hvmloader: allocate MMCONFIG area in the MMIO hole + minor code
>     refactoring
>   hvmloader: seabios dsdt set to load correct config
>   hvmloader: ovmf dsdt set to load correct config
>   libxl: Q35 support (new option device_model_machine)
>   libxl: Xen Platform device support for Q35
>   libacpi: build ACPI MCFG table if requested
>   hvmloader: use libacpi to build MCFG table
>   docs: provide description for device_model_machine option
> 
> Joel Upham (1):
>   Q35 support

I'm afraid this needs to be split into a patch series, with proper
commit messages in order to be considered for review.  The current
huge patch is impossible to review at all.

Also you need to keep the Signed-off-by of the original author in the
patches.

Thanks, Roger.

