Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDB34145B0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192392.342802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSz3w-00019G-0Y; Wed, 22 Sep 2021 10:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192392.342802; Wed, 22 Sep 2021 10:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSz3v-000172-Sa; Wed, 22 Sep 2021 10:01:11 +0000
Received: by outflank-mailman (input) for mailman id 192392;
 Wed, 22 Sep 2021 10:01:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSz3u-00016w-Hr
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 10:01:10 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0229630e-1b8c-11ec-b968-12813bfff9fa;
 Wed, 22 Sep 2021 10:01:09 +0000 (UTC)
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
X-Inumbo-ID: 0229630e-1b8c-11ec-b968-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632304869;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qQRL86pL8BNr0dgDPNorI2W3ms68R2tkI8CVwXInORE=;
  b=KnYQcExC2gOtNCSVt250iqpTUiZO2k3Erk85+zKFs/aasNVBE3xuMx5B
   eDipLyzsAiflYtgCZX2BYdEF1SxvrNRWttmN6h3uRZ+H0RzoRLGfSlonb
   P+ATIJ0t3Ix4wiAvuVpE1iAlxpcBHUNyGi+EwcjchPQoekkroZiQAO5yK
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s1lB/sIv8FDERjkYLpPxWCfXNtCvSh2t4dPeeb4Bc5lM5m0rnM1q6/26KMnUym0XCQPiKl/h9n
 dbA28Pt7SycQs0f/4f7Dwss4e8A6KpnQxNwVTV3+NVSDUMZPZmOiwiWugPn47w38EWXDuWYuEc
 wXqwkQEN6Ri+Lbkl72dC7ngyYj7REDO+XZXeVBarhisXsoOhg3oKG/QoL6h/xtpHA4R1sL0KzU
 4UCTEQKW38Dnzw8W5J75Y5lpT/yrNyXU56CchyTclGqVabX6hD7WlkqmI328fcuDTDfvp5qkY0
 kKJxpYw7Jnf+2IbHbv4Oh9RX
X-SBRS: 5.1
X-MesageID: 53321579
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ivxB4Kz0bDDOvTzvarN6t+flwSrEfRIJ4+MujC+fZmUNrF6WrkVTy
 WcbDGyPbqyNNGLxfY9xOYTlpEoOuJ+DmNBnGgpvpCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s7yrRj2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt4Bp8
 vl2q5Krc1YwBPCQmdxFdhBGMxgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYIDh21p258fdRrYT
 +06bB5GT06eWhNKYwcIJLMmteaiwXaqJlW0r3rK/PFqsgA/1jdZwLXrddbYZNGObcFUhVqD4
 HLL+XzjBRMXP8DZziCKmlqtme3njS79QJgVFrCz6rhtmlL77nMXIA0bUx28u/bRoky0Vs9bK
 kcU0jEztqV0/0uuJvH/Qhm5rXisrhMaHd1KHIUS8xqRw6DZ5wKYAGksTTNbbtEi8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9fXc4SRQaQxA/ssDZ/d0ytkrqR8hDKfvg5jHqIg0c0
 wxmvQBn2e5J1J5Vi/3ilbzUq2nz/cmSF2bZ8i2SBzj8v10jPOZJcqT1sQCz0BpWEGqOorBtV
 lA/ks6C5aglCZiXnURhq81cQen0u55p3NDa6GOD/qXNFRz2oBZPnqgKuVmSwXuF1e5eIlfUj
 Lf741852XOqFCLCgVVLj2eNNijX5fK4SYSNug/ogipmPcEqKV7vENBGTk+MxWH9+HURfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4FZpPWlE0AALOhCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnkMqOB4Fag13DBNyuQbXVvNOHmUZpl9CppNi0wJ1e4nXMkZN/3vqsYcpI2e5gh9fBikqEoH
 6VUJZ3YD6QdUCnD9hQccYL58N5oeiO0iF/cJCGiejU+IcJtHlSb5t/+cwLz3yASFS7r59Amq
 rit21qDE5oOTghvFujMb/erww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSU+t076tjEg6yAvryFKeomExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6taz9b9XygNoQCfCY1ixU+4yJ3CH2Y9Et7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZymvI8PA4AETm/ysmrrOIXHJbMwSIlCEAfqB+N5kow
 Lt5tcMbg+BlZsHG7jpSYvhoylmx
IronPort-HdrOrdr: A9a23:4c+PBqCqQSajIIvlHemo55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEKhSqafk3j38C2nf24dmpM
 JdmnFFeb7N5I5B/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="53321579"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ch1nka1NJZVi9fqPl97WeIYuMxoENPqMSstbfRZq+blIWnT5ehYddE5ZznUZyMsX+uBkyj2pAAniMCf6hTINABeFpwuPsv4DP3UP09Pu0/tMFsoJNYB6tz6eqS/pW9qtZsk0EOTJv3VnqqmStLRX3WDmU5XFmuPJ+d5LGGiCLJNQrJPzh+eJAl6a874IEGayCLxmVJbUDGKjYYqvtdfhsksoAbMsjBW518YyTO8hec5bamxCMrH49BU3r1/w6eDw8d/LnDYJf6beqPCKp5jRHkvEZ9QHNlgWOOrnF8xZI+bJloYeQfNZaP9cNKAvBTpWLFRfFoi7wNXIZXF2mgAFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=USClfeoc2YZ7F2ElexwdnWbKJ1U9/jdBu7bSUjnvKEE=;
 b=b0vZfVUXmQsPX2NYRWHwsbnk6JMqm4YvGV6uvKy7eq/650BB+rqBlz7EXA6zxVgC3k3ZecDIWtF6uNTgI4lC3sUpWs8lCi0KuWq3K6HDIDPlfy+x/G52oA8VeKzwXQnR2bDHCOWDTo3NjvWnH6zTKu6QCtQgKftCxIjE1tUYAdx/8188pH5xfRFsf3oHxJ+S2HuB47ZRxUaDhHjobvfhyGKF0/XeycN+uYl0L/nsLG/qvsmHvcuP2LU8ZRUIlcE0Rh32+5QNyjhOQ9rLPmdSQv3pLJ8cMxiWvpVekXHoJj26mF32c74NLQM5RYHe0SAL54MvV7K/pxj/19vFbGfbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USClfeoc2YZ7F2ElexwdnWbKJ1U9/jdBu7bSUjnvKEE=;
 b=RQzpmGsS6yNRhAjR/GwJ/WUsDtkTwYjzw/A+P5G0pTuWMfBhLQpoy+5nJMaErb1NUocZKF4FVU3tzdZK4A2JJwA7T1yNScEYA/v3p5HsT9uA3gd3R9n7bQ+ZXcVCUsfZb4j/huL7VaZyWaNHqWp6EPevt9h+52Of+OsA13SoOCw=
Date: Wed, 22 Sep 2021 12:00:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
Message-ID: <YUr+21K8GNqMFjKB@MacBook-Air-de-Roger.local>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <YUhgdMyTbfL8Hyke@MacBook-Air-de-Roger.local>
 <5c1fd288-2972-d264-d6b0-3c7bc6d67be0@suse.com>
 <YUmYpzhJrBZkSYyd@MacBook-Air-de-Roger.local>
 <ae0fb20c-b7c9-2467-0951-b84b2f647382@suse.com>
 <YUr2zZL3kV4/nBQp@MacBook-Air-de-Roger.local>
 <8fd9e2d5-b875-ef7d-d80a-15b6ba2948b5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fd9e2d5-b875-ef7d-d80a-15b6ba2948b5@suse.com>
X-ClientProxiedBy: LO4P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a675003a-7122-4084-03f9-08d97dafe3fc
X-MS-TrafficTypeDiagnostic: DM6PR03MB5323:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5323F8AC99F4EE25ABAB70118FA29@DM6PR03MB5323.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tzAt6BgR/OLu/iXb3uF+rB/oe6gMUrUmJn0JnlF7uFrFq2W97AGgKc08izNFzaXi15PqNNllza9pQAOKZNilPTBzAtNoJ8GQO2vTliCOiovXSflBc0EBCy5ZOAqS2RuTZAcWunlFdrBKrBV/iK4c4aX2ZIfiySgJTs/ZRDngQTIyfGF+n6qwfFPNZGhd6m9YcLPnUoW03MvVQOR1kzHYBtwHI3+JIDNxaxB7XFtWqtVfKkSR4nMkD+PBVxzkfUhbwN73Zvl0uGkJtAfbWrlW850i4wXzoy5hEkJDG1UmiSiqf6GbMzSXtIJIoM39D5VRd8RwQ0otFVMDrxX9MAgOnqmga+DFV8smX3pQ4ZIijHoMXw+uUlZKV4l2XY3O1/FMcMPrFnzpSIGV2Co6euMAZj9myshk9xKgMiI76uq8ilZDR8A0QgszdU8tTIfYuX/52nj9A84izzhADNCG8e51c+a0j6G9yDPXXZOOcppBnM6KWXBl6HQu+RJaA2KqlvGaFeoJ7QmctyW60WrNa583ede2qlKVC2sFPlFUskXdkXh4EMi4u+bpxt3H8D9ngF4L/uJDaU3C4xGZlQ24sSWAZVvHvSJwP7w3uMd9XtD8RLnzrVxpwgfGWLq5Yo20HeCw7scGr+Jr93IB7wbVM9nJRn/d9g2BdBSmP/OlJQQo8w3j1Jb5b+NtszMkXb7dan754OLBHf3054klTCia9YDnejQILdrxCZTyQiN2FTkoIQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(26005)(9686003)(956004)(6496006)(6916009)(38100700002)(83380400001)(8936002)(53546011)(6486002)(66946007)(66476007)(66556008)(186003)(54906003)(316002)(6666004)(5660300002)(85182001)(86362001)(2906002)(4326008)(508600001)(76704002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnlXVUtaQkhQMk12ME1tQXFYVHJjZGhsSDNCZW9VNldQWFJBSGUyWDBlVHNR?=
 =?utf-8?B?a3FQVnRrWjQrMXVnbnhuQ08vUmtZUjFmSEI5TlJFRGpaVHJId2p6OHhUaFl3?=
 =?utf-8?B?QzlpOG4raCsxWitERWpBN2w0U1lXK3cxVXBQbEJDblIyTGI1VHptdXc1Z2JV?=
 =?utf-8?B?NHRnaVZ2Vy8rSG4velVscWtGbEJuM3FNQUZZV3hZWUFrTzhrSDJSTkFsUHcw?=
 =?utf-8?B?T0NWM1ZheFlpSWcxeEppVVAvWXNmWU02UVZqR0t4d2dBbFFmOWZEeXZDVDhw?=
 =?utf-8?B?UEh2enB4aTEvZUp5YXlDZlU2clIrT2RwRTNZejBCNWQ3YVJ1TDRuaVlsWkY3?=
 =?utf-8?B?SzRLTTVQMXNkN0tvS3ZtckxQdUJvUllMdTNCTFBHWEg3WktHb1MwZGRRNEVk?=
 =?utf-8?B?TjRqamxDT1BqTitXNDVWUWZZS1ZaaDRUSVYrL2FsazBKeFZESDRheVR4cXoz?=
 =?utf-8?B?dkxyUkt0dmRHWThJTnJGcDB6QWhVSU9ZQjR1S2pYOTRPRmpCTUZqenR1c1Rq?=
 =?utf-8?B?UnRKTHdmczMvdDZtRWZ5SDk5VDVySHJwRHU5MVJYdnlVSkhTQjRlUng5cUtF?=
 =?utf-8?B?WEVSanJKTDhveCtCbmx0ZTRqZ3Z2VnJGOUxUTEVoSnJrV0dyWHJNTmVwSU9Z?=
 =?utf-8?B?Z21TMW1WL1lpaVBPYmczUThEN0I5MzdjVjVucDR6ZGFBaHdjYXViWTMvNlZC?=
 =?utf-8?B?VVp0NURkOFhCRWZqTDhBY0ZuWjBTUFFmVURqRzVtRXdHQWxxZTRaU2pMWGpM?=
 =?utf-8?B?dEpQZGFLTGl5ME5xSUhqNzNVR2lWQlQwK0VIUjhnaER3UWFCR3k1dnd4MTFy?=
 =?utf-8?B?THluWVgxVnRhb2IyZmNCRWNJZDkxNHZ6RTNLaDQrTm9Jei9sYkg3aTgxRTJh?=
 =?utf-8?B?WFBMZzFVTWwrVEJqeEJVN3ZZQVdIWDIyYk41STR0QW1JWjVPZ3VjMFBuNytB?=
 =?utf-8?B?Nk0xdXZaTTdkNmljd21aelJNSW94OGJmdER1R3J2RUVQbGNzVklIK3hQNlRV?=
 =?utf-8?B?OUcxOElwSjFONGxrOVp0TUllNTc3YzhlYmYyL3pNdFRBUWV1dVBVcFBnanBj?=
 =?utf-8?B?dXZLaG10ODk5L2FvYTF4UzRsWGt1T3V0T21YbXpaMHJGQkU1Y2tPUDBuZSt4?=
 =?utf-8?B?aUFNN3hDYU9xMUhNM3MxQkNjMExrTXhMcTVsZ2pzQklyejZINFR5ZytVVGY2?=
 =?utf-8?B?UENjWHZtdDVNSWZaUkpEV2JveUt3ZjNxZk1Ra2dhMW9JajRTMk44UkdldVpC?=
 =?utf-8?B?N1g4bzRIMStOdmt3eXN3U2c0d2RZUjJ4R0hHR0JYV2pQMmszandJeWh5NWJh?=
 =?utf-8?B?MnZlVUFjUFdCQTV5dmdRcld2UEtXd3Z2SG1sQmVhcXR5K1pRVEhXN3NEdlBK?=
 =?utf-8?B?UlhoL2hXQmg4Zjd3RjZXaGVqcTJYanNveW9RWHAwWlNaSWkxL1ZPSzdKU2gw?=
 =?utf-8?B?cXpDL1NUY2MzMDMyY2VXMTkrZ21mUFhIdFVSR25tR1JHMXRxNE8yNTR3cFlG?=
 =?utf-8?B?b3MzUm5lYVhFaGdQRWVvWXVZTHlXMURaTnl1Q2oyNzAwZlA4YjR2b1NDM25t?=
 =?utf-8?B?anhjTCtRVFk2Z2EyU3hOdVR0M0ppT0FuY1Uzd3NyeVc3YmhGcGZyUnBTRmFE?=
 =?utf-8?B?Vkl4K3RyNXoxaGs1bUdQLzdoUWw1UktCNXZXN25YcTBBTWpsT3VpTXk1M212?=
 =?utf-8?B?TmpRTU56TzY4REFBV3lQUDFvWWxGd2FSRE41aFEySDBXWkhWby83Q3ZtUGJk?=
 =?utf-8?Q?+kBimlYF7Fxw4fbu/jt52CmosGcVE46P4WdKMac?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a675003a-7122-4084-03f9-08d97dafe3fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 10:01:05.0086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tc643bh8A5G79micnvCYALpbFv0NsTKxp8LOKw8G3siOTrC+yQrIAurau+sozv2Ok3PHtlm3iWpkVdDia5uuug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5323
X-OriginatorOrg: citrix.com

On Wed, Sep 22, 2021 at 11:42:30AM +0200, Jan Beulich wrote:
> On 22.09.2021 11:26, Roger Pau Monné wrote:
> > On Tue, Sep 21, 2021 at 12:12:05PM +0200, Jan Beulich wrote:
> >> On 21.09.2021 10:32, Roger Pau Monné wrote:
> >>> On Mon, Sep 20, 2021 at 05:27:17PM +0200, Jan Beulich wrote:
> >>>> On 20.09.2021 12:20, Roger Pau Monné wrote:
> >>>>> On Mon, Sep 13, 2021 at 08:41:47AM +0200, Jan Beulich wrote:
> >>>>>> --- a/xen/include/asm-arm/grant_table.h
> >>>>>> +++ b/xen/include/asm-arm/grant_table.h
> >>>>>> +        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \
> >>>>>
> >>>>> I'm slightly confused by this checks, don't you need to check for
> >>>>> gfn_eq(gfn, INVALID_GFN) (not ogfn) in order to call
> >>>>> guest_physmap_remove_page?
> >>>>
> >>>> Why? It's ogfn which gets passed to the function. And it indeed is the
> >>>> prior GFN's mapping that we want to remove here.
> >>>>
> >>>>> Or assuming that ogfn is not invalid can be used to imply a removal?
> >>>>
> >>>> That implication can be (and on x86 is) used for the incoming argument,
> >>>> i.e. "gfn". I don't think "ogfn" can serve this purpose.
> >>>
> >>> I guess I'm confused due to the ogfn checks done on the Arm side that
> >>> are not performed on x86. So on Arm you always need to explicitly
> >>> unhook the previous GFN before attempting to setup a new mapping,
> >>> while on x86 you only need to do this when it's a removal in order to
> >>> clear the entry?
> >>
> >> The difference isn't with guest_physmap_add_entry() (both x86 and
> >> Arm only insert a new mapping there), but with
> >> xenmem_add_to_physmap_one(): Arm's variant doesn't care about prior
> >> mappings. And gnttab_map_frame() gets called only from there. This
> >> is effectively what the first paragraph of the description is about.
> > 
> > OK, sorry, it wasn't clear to me from the description. Could you
> > explicitly mention in the description that the removal is moved into
> > gnttab_set_frame_gfn on Arm in order to cope with the fact that
> > xenmem_add_to_physmap_one doesn't perform it.
> 
> Well, it's not really "in order to cope" - that's true for the placement
> prior to this change as well, so not a justification for the change.
> Nevertheless I've tried to make this more clear by changing the 1st
> paragraph to:
> 
> "Without holding appropriate locks, attempting to remove a prior mapping
>  of the underlying page is pointless, as the same (or another) mapping
>  could be re-established by a parallel request on another vCPU. Move the
>  code to Arm's gnttab_set_frame_gfn(); it cannot be dropped there since
>  xenmem_add_to_physmap_one() doesn't call it either (unlike on x86). Of
>  course this new placement doesn't improve things in any way as far as
>  the security of grant status frame mappings goes (see XSA-379). Proper
>  locking would be needed here to allow status frames to be mapped
>  securely."

Thanks, this is indeed much clearer IMO:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit I still think we need to fix Arm side to do the removal in
xenmem_add_to_physmap_one (or the x86 side to not do it).

Thanks, Roger.

