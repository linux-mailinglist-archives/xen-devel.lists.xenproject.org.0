Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22891704906
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 11:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535083.832687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyqs8-0001fS-OU; Tue, 16 May 2023 09:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535083.832687; Tue, 16 May 2023 09:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyqs8-0001de-LI; Tue, 16 May 2023 09:21:32 +0000
Received: by outflank-mailman (input) for mailman id 535083;
 Tue, 16 May 2023 09:21:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S66/=BF=citrix.com=prvs=49309c509=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pyqs6-0001dW-Ve
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 09:21:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08450031-f3cb-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 11:21:28 +0200 (CEST)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2023 05:21:15 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA2PR03MB5771.namprd03.prod.outlook.com (2603:10b6:806:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 09:21:12 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 09:21:12 +0000
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
X-Inumbo-ID: 08450031-f3cb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684228887;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=TDuJLJc9JTp2gSh3nCkWiB74uRaH05uB2T6EVgzcnz4=;
  b=E1TAKYGIo1EZfuwGJJZk93qzBH85j2UahJzWC3MCcKgbgF/LN4lXYViu
   9E1yxtcq4a8P3QdPYxyHsDVW8ZkLrLab0+zDyG0VPrvHFUYaiORcWRJ0i
   XTqVQkVeSfG0cp+5nPvT9+qbpBxw2kPgwiAhYn9vWTt+3k/GwqAultot0
   g=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 111644949
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:F+QxhK4P4o41lolxbJLdxAxRtNjGchMFZxGqfqrLsTDasY5as4F+v
 jQeXGyBaa7ZMDbwet0lOYji9ktVup+DmINqQQY/ryA8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0S4geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 cRBE3MiYAu4tryym52aQ85L3eEsBZy+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+SF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHqlBN5DSOzQGvhC2EK110EiKzwvTUK9quumikOnfN8FJ
 BlBksYphe1onKCxdfHmRAGxqnOAuh8aWvJTHvc85QXLzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/HTrYcyh1T1R9liGaK8jdroMTj1z
 3aBqy1Wr64PgMAC0aL95kzOiT+oopnPTyY84wmRVWWghj6Vf6agbo2srFLdvfBJKd/DSkHb5
 SdY3c+D8OoJEJeB0jSXR/kAF62o4PDDNyDAhVloHN8q8DHFF2OfQL28KQpWfC9BWvvosxewC
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:1jZeKKt0f2rRjW/guRAkX0Eo7skD+dV00zEX/kB9WHVpmwKj9v
 xG+85rsSMc6QxhPU3I/OrrBEDuex7hHPJOjbX409+ZLXPbUSiTXfpfBbKL+UycJ8SGzJ8g6U
 4DSchD4azLfDpHZJ3BkW6F+r8bqbHtzEnPv4jjJhxWPGJXgs9bgTuRIzzrbXFedU1pBYcZCJ
 HZ3cZOvTymEE5nFviTNz0qX/Xju9aOr57tYQcHCxk7gTP+9A+A2frVEwW4whxbaD9Ewa4j/W
 /Z1yT1676uqevT8G6j60bjq7pXhfr8wZ94CMuAhtN9EESLtjqV
X-Talos-CUID: =?us-ascii?q?9a23=3ABG05+2tkTI4/eWzszQuwjcJs6IsdSiTmj1jeOHS?=
 =?us-ascii?q?JV2IyZ5ycbnjL3axNxp8=3D?=
X-Talos-MUID: 9a23:LoM9wwsHy2nIAh2Dls2n3C5EJepZwIWXEFkLmocZu8SdEiEqNGLI
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="111644949"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVpnLsN0fHSmkvMCfioD73q2hNpKrPq4hW7OIbp50DRHFKHKaG9XBhEIYVzoJ51qS3nGZUIn09w1e1vji8vKHZx9+bKpq2Zd5P5Ld/gawn3pQ1u0SznqPbKFMaA84vQ1xAzO+2JGNJMKrp2Zbs6UIaoidJtO3MifKr0W09WRUSM6IXWmpmnNM6jN9QDC604IGmkpaxp/6x0vu6WEhPUPLGM4CEfOAPjoxs8Ht48rG0NZHc3TzJgwyhDrWOLmUy+9ueuhdjZRFoJ88uc/FuEwg5NRPOPO3B3MyOxaRvkPDFaHKzRoDr40+9rhZYlX78OXIL75XtA49ub52ylxZdpbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Iaz8Ns+pztBCChtJr+/H8kIaExMISa0flvV/PBsQXs=;
 b=mM3P+/+1NZFujYwvxqlaewGgA7txyhZEs68XIL3ayJnrPaLzTHpAOydJr9Kr8DHsKWYe3KA8Ekc+hg7JXf3KMA9YOO4zgiWNxXNAnsF7ajB11K4g4KYzZNxM6HYk0SAUpo2v6MbvujnHSYvexgimipeiQsu+/MTDTr18an9N7DuD/G/r//yUIOFy1Te2aaCmoLoTD95T3107Yl9CCB4HflmvnVYTgJgdsYrhUgEu+ZIillkviaGmGl/OUj13Hp4YIYYh6g5nhj93WHQ1tU6ZaelxL4pzWwZCvpTQJfOSpjE0dMEi9eRXPKcx/k6+MNdf+l0Z7cNUaCrbSICuzjVoNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Iaz8Ns+pztBCChtJr+/H8kIaExMISa0flvV/PBsQXs=;
 b=p8WFQkmbuKJ1vZFKHxf210Cp/BjuxwzQLxqD1mWoxpqwnB/qkSYKbsv6Bbz/fyoYNuTY/pFDNl9IiNx9ksLgWyTGa9FqPHBfwC7fa1orR9bwVCa0kwgBiUUrXVz0aCcy248tbqvP5GKLcA74tuMAB4eKYDlbJu2Cw9utwUKNDoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 16 May 2023 11:21:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com,
	xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
Message-ID: <ZGNLArlA0Yei4Fr0@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-2-sstabellini@kernel.org>
 <ZGH+5OKqnjTjUr/F@Air-de-Roger>
 <alpine.DEB.2.22.394.2305151656500.4125828@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2305151656500.4125828@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO4P265CA0135.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA2PR03MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: e8fc7d12-3c4d-40cd-944a-08db55eee3db
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JiqOvaANBivDLepYIrUSCSZX7cmK18REKUuqb1AksWxOmeTih530K6lcgIZLJVYw8gNpToh7ZNI9me3BIKGMNDMUSWsv5GyIdE+nNmdnSBQr5xKLywBO1u6sSe5KO5f4+uefmX4tCP5TtVKB71O0smuQ3wr/nHNGDAmnAMlgQ/4/AwdYTb4gqMUtAhC3oY96eUW5sSKxcOHS8cHkEaiRn6bm3eUvfJYsfLiugjrtE17Ens8BOsl+o4W3oGkuBX4rXTjRfDDIu2ojgql+DTMJ8tgu7rQiSE4f7oQ9UUYr6Snvvm6G1cJDupd0xrMDKLd26CN7njLzs24F7Pm9H6xja10/dRiLvv2EEqSVGkPxU3bMinUyMDPslIILWNiDhPuUZYBD9D/nicn31rRwsYThUXbVo+kKapLI82wsBb1yYeBavEn0a6UF+TnZhPMtNz/Hq8x3TUk6F7Vh3PX0Wv4G2usS7DEtxOoqZf9ve4vN4Vo57xrv0SWGgAta2qGs10RUu6CMN33ajpmxElqF0XzfCxxBwPirQvNCaevI41uOvJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(84970400001)(4326008)(66946007)(66556008)(66476007)(6916009)(478600001)(86362001)(316002)(85182001)(6486002)(83380400001)(6506007)(186003)(26005)(6512007)(9686003)(41300700001)(8936002)(8676002)(5660300002)(2906002)(6666004)(33716001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEVpaUE0SmZHazdpeGpEdm0wSnI3RDRFZkdENzlWU1RubW8zMGZGaFh1ZUFs?=
 =?utf-8?B?TjVHVE05clNKZ2hjYWhpbzI2MUtGOXVFMXpUQnhLRVIvZjJPNTI0aE5MSUx1?=
 =?utf-8?B?UXFZMVRhVmo3dk1SZmxVeXl3cGtCSlIvR1Y1eDBSdnRDdk1jMjBxOUZvb0Ny?=
 =?utf-8?B?T1ZHZ2h1RHovaHNsdUNaR0VUL3I5RGdEZHEvUGhYVDBOcS9laEVjUDFjMjlJ?=
 =?utf-8?B?OVowWVk2dmRMRHZ2Szlhc3ZJdDdIczQ2Z2xoM2srdFp6VTJPTmJNRXhmSm9B?=
 =?utf-8?B?N09EVllleFNISjV5bUw4MTRhWDllTUg2bXI5b1p1SW5LL2F2Rkhqczl4K01H?=
 =?utf-8?B?ZHhoRnArWFAza2RMcTRrYkIrcXQ1VGwrSXU3ZGNGNUV2YmF1S3BHeURVMHlY?=
 =?utf-8?B?V3RnSUcvNUV0K3pySnIvOEdZK2hQYmtxZzZFMVBPcWhUeVQ3clRHZWpKeHlh?=
 =?utf-8?B?L05vU09lK3dCTjI1WjBnb1I5NlVteWlEUE53aFFGeGRxMXl3dVVZWmNYSi9t?=
 =?utf-8?B?Nm1rOVNBMVlpV0dtdHBwNWVMWmpBSjBVUVR2ZU1WekZqNE5FeFdHM25iMTlx?=
 =?utf-8?B?TkQvK3FxaHZGZnR3MWNHV2VEOC9YN2Q4czcxbzNaamU2WHBTbDY0QjhXdGF5?=
 =?utf-8?B?a3J4VkMwTmlBOXFRUUNqK2o4d2xuVm9MRmZXNlpZZlBFMVQwd0Z0aU80U2Fq?=
 =?utf-8?B?ZzVyYk81T0JMWEZaUFM2cGd0T0RwaU5Ub0RjOUpwRmVOaFZNVWtpd1NMMGI5?=
 =?utf-8?B?QjVjeEZTNGlod1RYRm52bkRpdi9xVUFUU003WHJrd0V4cUlDM1FsUHc4bUV1?=
 =?utf-8?B?NWdRUy91b1lRN25lWWx6WnFMOFFweENFWHZza21hNGFkZERIVHprL0hkSmNC?=
 =?utf-8?B?Rm5MUCtMOXhjWFZhZE42Yml0WHlveXlrUmRSY1RpVWtVbDNVZVJTRnpRTDFw?=
 =?utf-8?B?c2RuOWxZWDBnKzhRc3BpL1hMc0VqaUtDNG9CWlFlOXpGTlJzeFBzblJIUThO?=
 =?utf-8?B?STM0QmkwYTU4REZwNGpvOW45U0ljeW1uQzdvOGNRdFhTa2xFRVU0MURZcUtX?=
 =?utf-8?B?ZDE2K1FSZXYzSUZia0pVZkZyaTdyc1ZMYS9udGNZRHc1bUNWaVRTellXZE5F?=
 =?utf-8?B?NjVZZHErN1lqSXd2ekpnaHl5QlVabjcrbHlJMkhDS0s3aXRxcytseVpoTm9i?=
 =?utf-8?B?VktzQ0tMS09QcE9VNEFGeUR4dEdKNWsvd3AwZVg0Rk9QN1ZJZ2JjN1g4Smg3?=
 =?utf-8?B?U3pTajU1S0ljQzk3MEFDUkxQaWI0dlB2UGxVQTBUdkNTQndqY2gyaEhQUjZ4?=
 =?utf-8?B?UTN0UEowSklLRlo1Y1UvTnZLYzVTKytFY1I1SnpjdnVaY045UjdIRGkxekow?=
 =?utf-8?B?MVVyOVg5Uk5Sa1NrTmZ6dDJaYXpNdG84SDgyRC9RZk1tSzVwS29HSENKRGRW?=
 =?utf-8?B?QjFheXB5aGJIeWZSUzVDNjhKczNEdTFhTkN4cFZ5RnBwbVJ6bFZZelQrS09K?=
 =?utf-8?B?aDdoaDNiOS9tMnMvcjJ3WjZzZDI5QmV4MldNVzlETjNLREl2bXMzV0h3UnJl?=
 =?utf-8?B?elBnck5DSVlGQnZwS2xjdXhQLzhNZk9sL25LZXlVY0FyMm1EZ2NqOGFpS3lm?=
 =?utf-8?B?Z1JsendsbDdvem0vRnFjU1crZlpKaTEzU2RMQXVUdEMwWlNuSFJJckd6aXRM?=
 =?utf-8?B?QWgxYXBPS2JsV2ZEM0RvZmNxd0RZbldCUlNyY1JIZXBIWlV1RllIN3FYeXVq?=
 =?utf-8?B?YWVjZVZuR3RkME0zZ1dTaHY3ZWNXbnRBa2doVjk0R3VOWVEwb0hRU1F4UjhP?=
 =?utf-8?B?eDRKaDVqbGE1WUxEYkxVYS9tM0Y3M2FFM0lFandKY0hGSHlQV29Mc2ZXN093?=
 =?utf-8?B?WHo5S2NsQ2dxbnlkNVpxWkJNMldsaHMzWjBtZkllZjN2aWl3R21sT2J4VjBW?=
 =?utf-8?B?cVNzendvMWs4SkpQa2NXZzg3MXUrSzA3UHhRYnFuR0hJZzExdUo4QlRSM2xj?=
 =?utf-8?B?TDJvUkJWQmhCQW1FcWNpTGlVN2hPUHRjMW8rQW9mai82NkNWRWtqa05JT0VK?=
 =?utf-8?B?SEw2ZFpqbjZFdU5ITGRkN1JFNm5SR0pHUTgwVGVOQkNJaWttOWdFaUtuekk2?=
 =?utf-8?Q?sZ/Mg2WLY+6JlL8EW3ehJgjiX?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jOhi7Y3ppVbJviKzs4Vpf6/2j7rrnm0MlzV3/boC4nh3WhdTBeLoet6tcAM/PDMR/j+d1qslq+ZZDxgxQ8zF4wwQNU7NswidNW+dUaYMQlrhuNCDBjOXiZKOV/j03C9w4hzBeS0pat/uz2njjzgIRLUmcKsCmzAfqZASObvkrAHbEaqSZ4jrDVCPSUST6EW0U1+n5Jri2LmbaXxRa/GqKA1npe1zklbNotsCAUeUX2Ph6efteCBG6N0OzyJFk7Af7JQfk4Czm/RuKeZ2B4gjjxdmpyLs/l1tj90EqmVaSA26Br1ddO/SMQ7CC1CqRKLq2NXrDLD414tZ6nCoD2kAaR7hfREFt8VTfV55xCR7cuEzpKsDXzMVjQc+nrEbcMtetUZVCy9ClsgIuBY08TRTlWyzqgfxm+M1noPc2Iq7XYOrGG9fWwHKUrK5fgUlB/OWdqEJU17vW+0RMNWimTZPMLA/FHUjGhmAefTmRTKLux5GthUn1n3PqMk4sqF/L39hJuCV0UuRZcml3M+aMLn9jdvUCoDNjNV5SyhAOJ3pv3U9W+s9gTicZJAkf6rgQvKo6uGRcj/TV9di2bdJ0VJVoqrMHVKDi8qiU+4oEnOFwu5htasJ/iXcSzzNxInzgYxQRO+VYRyrR4eFBWXpn4elv+vqu6w8LxKVWQbVbBvJq2lXz0Dure1zts0I4SIy3QAzvF4r8walMapz/qjp3BTafAVBl2IC+NwCnG3OAwwq3ONIF72lyLHQIWte4nus6RjXuHROjN+6UF2XYoHdbNaNATx07zPET3eq3xJ5EmObrzyrqfRxLoHmSBwyEXocuazgBf5cUAS78CoKbKQ8PH3FxXfPNihYmuMJ5rpWl5IgTIk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fc7d12-3c4d-40cd-944a-08db55eee3db
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 09:21:11.9411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMQiu2VELBlhU/xTLRw7w161qkTEM1LoziQbRJamrLjNl6Q677OK1VreTm5P0x9g5uOHlmeFmfZWTQREt5T85w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5771

On Mon, May 15, 2023 at 05:11:25PM -0700, Stefano Stabellini wrote:
> On Mon, 15 May 2023, Roger Pau Monné wrote:
> > On Fri, May 12, 2023 at 06:17:20PM -0700, Stefano Stabellini wrote:
> > > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > 
> > > Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
> > > the tables in the guest. Instead, copy the tables to Dom0.
> > > 
> > > This is a workaround.
> > > 
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > ---
> > > As mentioned in the cover letter, this is a RFC workaround as I don't
> > > know the cause of the underlying problem. I do know that this patch
> > > solves what would be otherwise a hang at boot when Dom0 PVH attempts to
> > > parse ACPI tables.
> > 
> > I'm unsure how safe this is for native systems, as it's possible for
> > firmware to modify the data in the tables, so copying them would
> > break that functionality.
> > 
> > I think we need to get to the root cause that triggers this behavior
> > on QEMU.  Is it the table checksum that fail, or something else?  Is
> > there an error from Linux you could reference?
> 
> I agree with you but so far I haven't managed to find a way to the root
> of the issue. Here is what I know. These are the logs of a successful
> boot using this patch:
> 
> [   10.437488] ACPI: Early table checksum verification disabled
> [   10.439345] ACPI: RSDP 0x000000004005F955 000024 (v02 BOCHS )
> [   10.441033] ACPI: RSDT 0x000000004005F979 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
> [   10.444045] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
> [   10.445984] ACPI: FACP 0x000000004005FA65 000074 (v01 BOCHS  BXPCFACP 00000001 BXPC 00000001)
> [   10.447170] ACPI BIOS Warning (bug): Incorrect checksum in table [FACP] - 0x67, should be 0x30 (20220331/tbprint-174)
> [   10.449522] ACPI: DSDT 0x000000004005FB19 00145D (v01 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
> [   10.451258] ACPI: FACS 0x000000004005FAD9 000040
> [   10.452245] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> [   10.452389] ACPI: Reserving FACP table memory at [mem 0x4005fa65-0x4005fad8]
> [   10.452497] ACPI: Reserving DSDT table memory at [mem 0x4005fb19-0x40060f75]
> [   10.452602] ACPI: Reserving FACS table memory at [mem 0x4005fad9-0x4005fb18]
> 
> 
> And these are the logs of the same boot (unsuccessful) without this
> patch:
> 
> [   10.516015] ACPI: Early table checksum verification disabled
> [   10.517732] ACPI: RSDP 0x0000000040060F1E 000024 (v02 BOCHS )
> [   10.519535] ACPI: RSDT 0x0000000040060F42 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
> [   10.522523] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
> [   10.527453] ACPI: ���� 0x000000007FFE149D FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> [   10.528362] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> [   10.528491] ACPI: Reserving ���� table memory at [mem 0x7ffe149d-0x17ffe149b]
> 
> It is clearly a memory corruption around FACS but I couldn't find the
> reason for it. The mapping code looks correct. I hope you can suggest a
> way to narrow down the problem. If I could, I would suggest to apply
> this patch just for the QEMU PVH tests but we don't have the
> infrastructure for that in gitlab-ci as there is a single Xen build for
> all tests.

Would be helpful to see the memory map provided to Linux, just in case
we messed up and there's some overlap.

It seems like some of the XSDT entries (the FADT one) is corrupt?

Could you maybe add some debug to the Xen-crafted XSDT placement.

> 
> If it helps to repro on your side, you can just do the following,
> assuming your Xen repo is in /local/repos/xen:
> 
> 
> cd /local/repos/xen
> mkdir binaries
> cd binaries
> mkdir -p dist/install/
> 
> docker run -it -v `pwd`:`pwd` registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12
> cp /initrd* /local/repos/xen/binaries
> exit
> 
> docker run -it -v `pwd`:`pwd` registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
> cp /bzImage /local/repos/xen/binaries
> exit
> 
> That's it. Now you have enough pre-built binaries to repro the issue.
> Next you can edit automation/scripts/qemu-alpine-x86_64.sh to add
> 
>   dom0=pvh dom0_mem=1G dom0-iommu=none

Do you get to boot with dom0-iommu=none?  Is there also some trick
here in order to identity map dom0? I would expect things to not work
because addresses used for IO with QEMU emulated devices won't be
correct.

> 
> on the Xen command line. I also removed "timeout" and pipe "tee" at the
> end for my own convenience:
> 
>  # Run the test
> -rm -f smoke.serial
> -set +e
> -timeout -k 1 720 \
>  qemu-system-x86_64 \
>      -cpu qemu64,+svm \
>      -m 2G -smp 2 \
>      -monitor none -serial stdio \
>      -nographic \
>      -device virtio-net-pci,netdev=n0 \
> -    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& tee smoke.serial
> +    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0
>  
> 
> make sure to build the Xen hypervisor binary and place the binary under
> /local/repos/xen/binaries/
> 
> You can finally run the test with the below:
> 
> cd ..
> docker run -it -v /local/repos/xen:/local/repos/xen registry.gitlab.com/xen-project/xen/debian:unstable
> cd /local/repos/xen
> bash automation/scripts/qemu-alpine-x86_64.sh
> 
> It usually gets stuck halfway through the boot without this patch.

Thanks for the instructions, will give it a try if I can find some
time.

Roger.

