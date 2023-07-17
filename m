Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4947560EF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 12:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564394.881850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLLps-0007VN-LL; Mon, 17 Jul 2023 10:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564394.881850; Mon, 17 Jul 2023 10:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLLps-0007SV-IS; Mon, 17 Jul 2023 10:52:12 +0000
Received: by outflank-mailman (input) for mailman id 564394;
 Mon, 17 Jul 2023 10:52:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVQe=DD=citrix.com=prvs=555fa4c0e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qLLpq-0007SP-Pq
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 10:52:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8be37d1-248f-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 12:52:08 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jul 2023 06:52:05 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB6941.namprd03.prod.outlook.com (2603:10b6:510:156::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Mon, 17 Jul
 2023 10:52:03 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 10:52:03 +0000
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
X-Inumbo-ID: f8be37d1-248f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689591128;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=iC38s16ivPQM5JTCNhgH75pQFdoBV4gAHFGGaBImJEM=;
  b=PJZPbAhO6CGG23Iy7ykBGXxW4lZnXoOLiOt5LS0lf8TyuJY5nI7Q5tVg
   awVqzUjguCvNGak/gSHfZWA5gkPwjipeaRfSiWGqIWvOcO2vjXzE+1B1r
   40eiei19T7wz9m2q+kJkv8hxcEZlx2MMLcsQ7lxEgPNpqooh6yQG7OqRj
   U=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 119030282
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:01j7S69noz+sCsYcghtyDrUDcn+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WpKCmGFOvqLYTf2Lt5wOdux/R4C78XSx99jHQpuqSA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmOqkU5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklt0
 6EjOjcjNyyRxLmTzKqcVdRJ3eg8eZyD0IM34hmMzBn/JNN/GNXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilUvgdABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraWzHugANhCTtVU8NZu0VqthWMYGCRKFn+rr/CWkk6yYo1Af
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaETMUKGgEaGkORA8B6sPipqk5kx3UQ9BsVqWyi7XdFjD5x
 TSXpyF4g6gLhNQK0aST903ImD+qqd7CSQtdzh7MQmuv4wd9ZYikT4+l817W6bBHNonxc7Wal
 H0Nmszb4OVQC5iIzXWJWL9UQuDv4OuZOjrBh1IpB4Mm6zmm53+ke8ZX/S16I0BqdM0DfFcFf
 XPuhO+Y37cLVFPCUEO9S9vZ5xgCpUQ4KenYaw==
IronPort-HdrOrdr: A9a23:GUDlU6kKTFrfOtWY3FVDqF96RiDpDfIo3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyFJwTOssJbyK
 d8Y+xfJbTLfD9HZB/BkWuF+gAbsby6zJw=
X-Talos-CUID: =?us-ascii?q?9a23=3AUZx6xWg/47KoFTDqAxN+nnfHKTJuUVuA92XXDRa?=
 =?us-ascii?q?EGyUybbGNbkCt3fhIjJ87?=
X-Talos-MUID: 9a23:86QlOwoBU0xFbltahbUezzUzM/kr7K++MRxOtYUIsuacNSBJZCjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,211,1684814400"; 
   d="scan'208";a="119030282"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2G3WPRKdsIpZN/kSdOrOs8TktzL1w2dAc0LE4fMIHSAcbDpsYdv2d+jXbBdvbKCJrvDJPAXgptOe/n48oEy2KDTfSsIjPKduwLFauV6g+lfwHNyQ5vrZ/JLBQVpy3q5K9C+QInEQxpmliTUdthARcYP0ZpJjC9MQie74hVMMkK50Vjmv+CApEaJa/vAIyOCN+1AmvvY/ND04fY8bJxPqjh/jT52i5DUonYPBBlWvUBuA7t3C/mzm9Q+JuYoo9obxYCyDx6qmrX+Rm1vUynJiY8uIB1nROyYV0x2dgrAwEhrrYVkORK8wDtbse3bn1ZlVXenr91PltTbsoDz52AZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bMnT8j/thIsdisojHHqR+sOOlbPG+p+8Pu+VyJkT1s=;
 b=SGB4Qj4Zx8UO3IcroeqD3D3/NnyLlNhijg8gmT4qtHvuSDIXlikIHnf7/O5EiDYyuHI3gBulC9rRfUobmpvlsPBqzeBabrfyLyIzhHJ1dbEYYQ1o6fWJD9CN824XBsB79RWiaONstbd+a0mKIakg1/690cazs8gonW/8dBqHo1momEYpNG7Qf0ruFAMi7B8Xe33XLKmOWgfwSmlNcEYmNcKEUEhPiq6jW3tQuB2tnJ9vTuJVtiCV8mSctMe2cWt0ST9Bxt+osI7LiG91/VivyH/E1t7b1rMSQ1HXwn1rkogrA9+YD0DfPTCU55q27P+Bfkcqp8m7lpReTj+WXx6ctw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bMnT8j/thIsdisojHHqR+sOOlbPG+p+8Pu+VyJkT1s=;
 b=MFzAdr3SIyiwFakn8QKT+K/o7FasLw9CVPyLeab8DOMKrF5h98/EEOuRUePAO6ol5Ndj3f1i0BQJjbrlQuY+gxqWeByiBTYcUeAVPD6MYvAV4GPEVK2+rLJEvtQfSSTBH5oMaCEJyC3zoOs04suJD3TX/MJBqPFIHVynkJNzsco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Jul 2023 12:51:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/HVM: adjust pIRQ calculation in hvm_inject_msi()
Message-ID: <ZLUdTB_gZjRzhpJe@MacBook-Air-de-Roger.local>
References: <5cfda162-07a3-8a02-4511-b0578b12dbc2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cfda162-07a3-8a02-4511-b0578b12dbc2@suse.com>
X-ClientProxiedBy: LO2P265CA0457.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 26259a3f-2d5f-4688-555b-08db86b3d9b9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WJKK+5hKrfbDyAW6gJuL96wtJHJLaI5OhJLtl9v+gfNgpDPkchnJ2wdpxyUkvefMweEusoTnYBHS8MfFi7V98+EDThfrbO7ubzJtfOR82XNlllywS+pzXa4EIt6kLixef5/ntJqSRaNkrPpA8d5J+G/ZfNd+5E/fSHpboA+NH3xkxDlaLX5yA5a3bLh+geYCVKMrbmUgy0FSbkiOWkXYiLk0aL0TmFFC7TAmAk9jJN3fOihAr8jUBNEmRjttfvd5KlGyXNLjix/eBvXwhl+lrye5oLAJa5JleLQAK0bdo8zTZ2CNaULsa2YGsNpfppA3/wAa2hQsqeQT7WXTPaLEfpw5/xM3o6Trz2gQsB8OR5ZWHtLUvki391RxDKXGt0cMwbQ9Nx39C0zC1R2NJj0SWO3r6qF9GAEkaIhAF5aJtqECk7gFBR3gNguPfBOHlQFTjWkoN1YJsSGlfHEvsvI4ug6UJsr1pBnaL36rQA6pKN9YXt0/f53KCWPwMUV8oyd4Dp7g3ChPkWcFa295ZYjBxTT89DM+qNF9tgIDVczJvmcYcyvwDmsOqJf+LfUXZb3G
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(9686003)(82960400001)(6506007)(38100700002)(26005)(186003)(83380400001)(85182001)(2906002)(5660300002)(478600001)(54906003)(86362001)(8676002)(41300700001)(6486002)(6666004)(316002)(6512007)(8936002)(66556008)(66476007)(6916009)(66946007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHZFZTZQeHF5QzM3WjdoNHV0TTJJdUZXajVnSHJEYzV0enRzSXVnUldrb3lT?=
 =?utf-8?B?V0FtU212YnIxODgzNDBNM3FRNVdtb3EzY2lkSlY0eUZBNkMrZDhIYUFyZXlq?=
 =?utf-8?B?TVF6Mm43OUwrUmlaVkdPSi95WHFjVDBvRi9vc3I0VWwzK0JnMzRWWVZEZWVT?=
 =?utf-8?B?S09YTkYvY3ZoK2d2K29kZG1tRU9nZENuSG5Wd3c1WkVXaVJZOUovNHhDZU9V?=
 =?utf-8?B?dnNiT0xjODZVaUdLOTRXSmpYNGRtUExNME5rUzBoV3JMNUtjUzhwZjNJVzJQ?=
 =?utf-8?B?OFRSYjV5ZzlmWEhmck80RmhLSTBCVU96NWlVeGJweVVLSVpMbVpENlNwYzBL?=
 =?utf-8?B?R2ROKzIxNVhvNmQydG81MDBWaDZDQmwrNFplUEFPempSUC9OQlVyOEgrQUQy?=
 =?utf-8?B?b05HRUpoZUJ4SlduU2s2eExKMjdTZU5oRUVWaDRkLzN6VEltZ0NacXhmVnFH?=
 =?utf-8?B?SFNUaExqbkpXMk5zS21wZnVSTzR0NjdpQnh1RjZhMTNXK1Vtc0NoblMwZmdP?=
 =?utf-8?B?VGh0anQzeUtIZGJDQmdJalpSc3hOcm8wdFJVZkNyenFncXBuYzdLdDZ3bEov?=
 =?utf-8?B?b0hvOVNUU2J1clEyMDlRUDY5YzlKOGozZjAzSmRuYVgyZ3FlWkdDNGlCelNP?=
 =?utf-8?B?d2R5cXA0MlMwTzVXM2wxVGtRbXdpdzdFdVBKRTRYcTVFd1lDdTZxdTJhVjNP?=
 =?utf-8?B?cWFoaWo0RTg1N1dLSWJTY3hFSTMzN2hVeCtHUys2QlMvU216cHcySHRFMkx4?=
 =?utf-8?B?RE1ISUhEdE5sT3NJQ1k5QmFvVi92akFLblhpc1pENlNUNTRhR3o3d3lEcmtJ?=
 =?utf-8?B?VXhNZzF5K0hndUl6U3ljVjNBUk8zOE9Ra3dsR29SMC81eGllYnkyVmVURFdK?=
 =?utf-8?B?eEduOVA4cm1JUVRRbVZxbk80NC9qZ0hPWWJzV1Y2K0xJdEtXcmc3dm1VelZ6?=
 =?utf-8?B?ei9PU1hTUDdaNHhtTHdnVVZPMEVqWUwwV2NFdmRKUzVLN1hQMTg5MWlMZEVu?=
 =?utf-8?B?U3pWZWcvRG1tS2U4OUljd0ZQSEZDaWpLRFBaTmRwSjQ2a2JJMnBHVnJPTVpl?=
 =?utf-8?B?K1BRazNMdWxseEg4Ync0YnRIRFVlV0J2bUxTU2w1aE5zOG1Cam11YW8wb0NT?=
 =?utf-8?B?Qm1Pa3ZaZTVyMjRzQ08wWlZhSGd3WkJodFBWUkVoNnFjenBZTGRqWGZ6bWZ6?=
 =?utf-8?B?S3lobllFT2dCUXFxN1J5VVBtU3FWOHl4SDAza2lDVVo2S0FzbnA2b3phWmpV?=
 =?utf-8?B?UG1OcXI2ZUJ0N1Z3ZGFCWWQxZDExSXlOa01CZ0ZaSnhOa0lhNS9FZW9HWTVE?=
 =?utf-8?B?ekRrSnNRSVRTd0lXdVdGNExoWTF0UXFoVE1FTFV6NWJtOVZ5VTdmQ2R6aTRH?=
 =?utf-8?B?YXVwT2lwcFpjU0htUGZMelBHS05tNUExRlhQUVNRQ0NwTFFIeTZJMnhmbE9x?=
 =?utf-8?B?ZFhzTSthZ2lhejBLQ1ZBYU9QTmNLMU50QmxRc0U1dGd5UmVyd0RKNjFPZ2Q4?=
 =?utf-8?B?WUcraS81S0FVRGh3S1R4SEZXM0dvSnJOYlZpU2VwS3BkTHJiTE55NlJGblpL?=
 =?utf-8?B?bEdEaFVGaWh5Sm9Ua3hmNE41a2ZseWpJSEVuektGallHU24xcGtYcWdSbk0v?=
 =?utf-8?B?akU4Z3I1bVpMaHBZSTZIejhVbzFtNU5qTzJ0eDFCVGY1Q1RpVzl4akRabStu?=
 =?utf-8?B?Q2wvLzRRb2hhMURHbXk4SXRLVU5PNTc2V2lTRzRrc3FwR2JWSDJkNmxKQTJG?=
 =?utf-8?B?TlFmdXVRV1NFemZnWWRMaXN5cFpVZlQ5NkNRZ29CZk90QklEWVgycHFLbXhY?=
 =?utf-8?B?Mk5IT3FtTVVCVi9ORytBZXFMd2toclNkME9NdDdzM2NQczhWL1lET1h1TlBz?=
 =?utf-8?B?cXBwbUdZN3c4aEc1NGI1V2tESkpiTnhGQUYwMjlGSWJFTENna0w1Sy9TY3ll?=
 =?utf-8?B?Z041UVhWZlZsSTIwbG5WVHFCRWsrN2s5RzArOE0rQnhhSDJsak5RajlmN0o2?=
 =?utf-8?B?R2lUZ0Rndjg4VTA5VkZwb003aFZ1a29TNHRHVE4xL3UyRHloWWZSMDkzLzZX?=
 =?utf-8?B?cXZOVFoyaWY0dERvL053djhkUW15bTBYVk1JZTMxQ242Y1RhaTNzVWY0c3ky?=
 =?utf-8?Q?a9s+iQEALEgEYkdSgsDVvA4pe?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2HPHpZ0iqDnCTzxAwmey7an7KYwZzrt3Q4FDewNN0jd/v56T1X+F+4wg2tt6jusu2MMFu0I1JlzUi12INPRHsrrFjYdR/DCME0onMpTrmcOBo2FjNxfQME24hGZJcH+jlOCjHx8VxK4QMl/3CpI69ocrsZi3TwlRNMiqW1zpr+GDk9ZgXkNqv03nWqfGArA3nay2DN6IRu1yFOmUzsx078jGViFNfsNaiaGEqysqDT4qKoNQlHD1PpyxVMnmLd8M/PiI+vWF85ST8pDKAHC+AbGku0nP1QDrhcmj5KDRQxrbodrW3oKfgH+BnkwPJALQTkUKV5TKw5zVQ+zlxCuUj++T+klPMQZldvTuBY/IY+NulQ5r0OdPz6K7WlRz2DKrEA1SSE6HtutQtaZbTLzD9Dd4iYN4ec5GgJ2CKfvuf13YDxT5nXI4nTE1Ud8c47Q0Z+WsTMsnQh1drAiuFO2EsbNNB0PqG1Sb/Ex5hGchLPwFNlBphtW2bCm2svLU6KBuiMqEWyStW3qEhYvvM/nKXcJjJ42zc/IbOUBMW1Vdd0eIN/PVpD7f8d/rseMMuljh9uJY4yKWwvtQ6D6DZgVqZj6VGxwv6koQdD8yxFNtxtBmpgqk0+KWSbxk2o+2SX49vnHS7noXcg/+WFVnwO+Y0s7AOfPZlEndCB2d70HU3VCHSbVbaD9M3PjZbnprPZI2cKgDY+kWhlysUDYEHmv+FQliHzxFDxiKe0eit9OWbHgZfkcdC7D5k+6j704hQ/NRxraTT/Rftj7PcRPx6K8rKLNZvXfL+VeF4LLefeQkZA6rax7fphG/rLNGXYu0xS8V/NA3PeMj8m/OyH5vN1zXvOcUnf4XXNphlX8JblyLVJYP5rl7HbKXzs6AaiOFrFgs
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26259a3f-2d5f-4688-555b-08db86b3d9b9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 10:52:03.2516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3g5AKFPbBL852BU6Fy1Ml8aeE4YsJFC8L+Qh10DsuZ5OLKTxJMdq1kezmAoYJXm3/6qQ6Z/3vCiSsNs4VCIFUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6941

On Mon, Jul 17, 2023 at 11:31:57AM +0200, Jan Beulich wrote:
> While the referenced commit came without any update to the public header
> (which doesn't clarify how the upper address bits are used), the
> intention looks to have been that bits 12..19 and 40..63 form the pIRQ.
> Negative values simply make no sense, and pirq_info() also generally
> wants invoking with an unsigned (and not just positive) value.
> 
> Since the line was pointed out by Eclair, address Misra rule 7.2 at the
> same time, by adding the missing U suffix.
> 
> Fixes: 88fccdd11ca0 ("xen: event channel remapping for emulated MSIs")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I have a question below, but not related to the change here.

> 
> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -383,7 +383,7 @@ int hvm_inject_msi(struct domain *d, uin
>  
>      if ( !vector )
>      {
> -        int pirq = ((addr >> 32) & 0xffffff00) | dest;
> +        unsigned int pirq = ((addr >> 32) & 0xffffff00U) | dest;
>  
>          if ( pirq > 0 )

I do wonder whether this check is also accurate, as pIRQ 0 could be a
valid value.  Should it instead use INVALID_PIRQ?

Since there's no specification or documentation how this is supposed
to work it's hard to tell.

Thanks, Roger.

