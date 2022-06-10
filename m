Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB331545D0F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 09:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345890.571567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzYxQ-0005Sa-Qo; Fri, 10 Jun 2022 07:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345890.571567; Fri, 10 Jun 2022 07:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzYxQ-0005PF-N7; Fri, 10 Jun 2022 07:21:24 +0000
Received: by outflank-mailman (input) for mailman id 345890;
 Fri, 10 Jun 2022 07:21:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0XP=WR=citrix.com=prvs=1532263ae=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nzYxO-0005P9-Um
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 07:21:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec696e4b-e88d-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 09:21:21 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jun 2022 03:20:11 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 10 Jun
 2022 07:20:10 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.014; Fri, 10 Jun 2022
 07:20:10 +0000
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
X-Inumbo-ID: ec696e4b-e88d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654845681;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dSu4CdkFOrXCCianLZv8vazJy4XB+5BY/fOt7Qv0ROc=;
  b=c0juvJt+Pv3XK5bcrguiY3i3h1LKgBVrmxdqzG2411wERe3nuOgXfvKa
   rxi1dmpPkVJES8OOGYVD0p/o9+iKrV6/eIYWm8Xg/7IZ9S/Yo3/xa95pp
   OWWQNXF50xrQ2NW8xBuxA/kLIBVNkCiron417nxtS435w3R+WaSVQiSMx
   s=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 73305796
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fnSW2qLrqVDZ+5wOFE+RoJQlxSXFcZb7ZxGr2PjKsXjdYENShjJTn
 GAXCzzTbPrfazD9ft1wbti/8E4FusXdydQyTFRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh3Ncw2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OQRp43ucl0SBfLFgb05D0ZpNwxFPJQTrdcrIVDn2SCS52vvViK0ht9IUwQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHsiFGv2UjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SKkK2AH+Qz9Sawf50/Q7QhX4JjUKZmMVIPWZ/cI2Wi3u
 TeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGSzR8T5dw21pjiDpBF0ZjZLO+gz6QXIwKyL5Q+cXzAAVmQYMIJgs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZo8yeEJpprUZwQ3N/
 g0=
IronPort-HdrOrdr: A9a23:Hm9nGa0fMV/kyRMbYVtAfwqjBS5yeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtrp
 uIEJIOdOEYb2IK6voSiTPQe7hA/DDEytHPuQ639QYRcegAUdAF0+4WMHf4LqUgLzM2f6bRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REoGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUMTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+6Z/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUR4S0LpXXt
 WGMfuspcq/KTihHjDkVyhUsZaRt00Ib1i7qhNogL3X79BU9EoJvXfwivZv3Evoz6hNNaWs19
 60TZiAq4s+P/P+TZgNcNvpEvHHfVAkf3r3QRKvCGWiMp07EFTwjLOyyIkJxYiRCe81Jd0J6d
 /8bG8=
X-IronPort-AV: E=Sophos;i="5.91,288,1647316800"; 
   d="scan'208";a="73305796"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCW+STYwHvQ2mjLrWF/fC6A7g/vSCurLkdf+Rj7P5fWZFuI1etUZfTGLqOUQQ5OxDzrbyXv2JsXaU+nvgeCrhjSYkIT9ShQJOPpvy/bzCZhhPh9pKRKdT42uw3nLVcnVJ5ktV9FxKQuKxiJ4WeZgRxj7+ew9mBIzZ1CMSyEE4E+5lLCRDAX2ppOEjgJF+n5+j+lDSZWJyUsELhIP5QQLTTi2YXKRSUBxtzNFXutAXn+GZSD3nD3mqskXam+C0et1kMwIgH4YYpLTWLb2I3XWDw/ExWEJxs3Ol28Orp2LkBW+gk1rdbEv7YHgv6kOSwvp9twI3Jn0o4NRsfktorq7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEA6IMl8YlMCwvCPZ2+wucaeGxQUlLP1gmCEgyAOOs4=;
 b=O4KY6+ftGbD5jU8CbB1kGhLc0sEZoF6cb7lakB4xzX4VMw5rNbFpN6iiPjwi/heva8Mp1trxTjARLZKzmvZSc7/Q5ulho0unsGqZ1PZ9ejR1gJX6kpFenesO4Ee1yy3UeJgnbVkjkGIxyWJS27M8xRkZdQXbNjF7SIYaRGo362CuLsdiH+h3JDhqNgpdhi0PqZp6XoE5AhyvUtmtWRdzR1BLcoA8T+M+dJbKPVRG0Z2YvxORG/abDqWm08zhg2pjzwjU365dUfUdoxjK95WuDGbTpTmVZSQpqreyU/UY9HGK5E7r3ZZS2kRXjErx8YPaHCohCsxPWvLUhYhWQy9kqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEA6IMl8YlMCwvCPZ2+wucaeGxQUlLP1gmCEgyAOOs4=;
 b=CXdwBcdFrUShdPNZCchuKZQh2QYuYzYvnkkglk1VeqfqRQIca5uf8OgzTUWoUZdwzRel4gn19dnuENQy1f+HZQ04QBkI6Tj01obG20xkFZmhYyKBCjQMxlAPq6ZyDSIXP6tATTgC7UaKcAwilb9dB8Iw6braOFE0vF0VJqlgStQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 10 Jun 2022 09:20:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] IOMMU/x86: work around bogus gcc12 warning in
 hvm_gsi_eoi()
Message-ID: <YqLwpGXxCHy5HJpg@Air-de-Roger>
References: <52090c8d-fa21-6f53-c33b-776c12338f62@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <52090c8d-fa21-6f53-c33b-776c12338f62@suse.com>
X-ClientProxiedBy: LO4P123CA0119.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8285029-363a-4e65-9e44-08da4ab1a6fc
X-MS-TrafficTypeDiagnostic: PH0PR03MB6786:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB6786C0D2979AC1D2C64BBF0A8FA69@PH0PR03MB6786.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MBgY7qJ59RMJy5eqOv7V/oOliOCwTkzU1x98QVdYw8UhL9hF4GCGuqf+qivUoLzVhNmMI6NJb17Z374rJg5i2gMlo2SmaAflUZ1+UH4zK+99rbCs/BMim11HzDKEeJIzWFf8Z+is5pKosP2DrdaEcMpQE0YgL35/UsuLt+AQBmwnTJIpJxtBNbvbh0Lg1WPOiSt3urlnMPea4B2B/WCuEdnijKAynCVh2fbS9vYzaAISKJRSM930mubN3Msmiiq0mebRRW7guSq0QMY70DHh1/98dAOT65PwGqL9Wu33ZJcNqqZk7oFURYoWxLhI7G3v97nH7RntSbS9TXtO16FjcQ2KSQ89e6aHuVGdVlNlgMCgmB7skbcTIFNJ4Ah9cqdVdjtdRzZrR+CIrGm9KnmfkVphS1WyW/Ok13GI2UD66Nu8CqMxbE9D4WDX+FErO/mWN3H2d/6wT/toIam450TEFwXdDcLoVgk+23pKIgnMdclEZcdZpy/aHjPRRw4s7Mt4dWetzZ6HcdO/Xb5qdsJHrXUmdR4z4tCFxM3Xpl7BeS6s0NKEs/JbBmAMUVeaWGu+BWlnr6xDXXNgDk5An9n9yNZnk5fG/hA0HVbLKcfoTYEdwyQ0OwKDzI+mUtoid84eqJS9knc7Bu1q/GUsSDQ0VYBdeK80DsyJxyvNfSIA5QIaaubZCvGIF3N7KsN+22by+MYFaZV2cBuWNy5bBRvN0CgmalbYVk52z9RlaLBYz60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8936002)(82960400001)(5660300002)(6486002)(966005)(86362001)(54906003)(6916009)(316002)(508600001)(26005)(6512007)(38100700002)(66476007)(66946007)(66556008)(9686003)(6666004)(8676002)(4326008)(83380400001)(186003)(6506007)(85182001)(33716001)(107886003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFhrMUZoa3RaNFBhdFNITncyQTlmN2x2NEFPeUhxV3NCSCs0OUIxWXY3U0VO?=
 =?utf-8?B?Q2R5SUd3c1BWb21idk1wSGlUNVZLT2IxTlpJNHduRzhJT0sxVEg1eHNOSjNO?=
 =?utf-8?B?aGlhVmErYmh0cjI1Q3RoaVFXOUs0MldXRmhXN1VRaWtpUWNIN2lzekNlY0Vi?=
 =?utf-8?B?MVJ3RTBSTndMSTFaR2N5VEFKOUttWkFqczBwZC9oQ3F3Zk1NTUtjQkhjK1B3?=
 =?utf-8?B?SjJBZUZjY0V6TTRtdnArWktZeGpTSjlTTXczQlBzMVVKS3NxdjhsOVBlRmVO?=
 =?utf-8?B?aGhmT3lZTkZOZk5jT3hFUlBwT0U2ajlLQnYyc0VUUUh6VGkwOXFTcnVhVkFo?=
 =?utf-8?B?ZC8yMzVUOVptRHZQSUZHTkFmc3E0VXA5b0hJaUh3N0dBTVdGSG16cDFNdzBE?=
 =?utf-8?B?VjBFakk4TE1iS05aMy9uYVNtUE5PSU1pT2tVTmNBRXJXTmNuVE5CSTlNQ3FZ?=
 =?utf-8?B?M05NTWNGcmpNVHBHS25rN3lrdDRmYUNKU3pNOGpYYmlLcWI1UDl6dTVPcTdJ?=
 =?utf-8?B?SWNjZC9sZ09ZNXIwUit6K1Y1cmh3ejlLaXkyWTRveFgzUzA1WmZaS3FGWWsr?=
 =?utf-8?B?NmttR296N0pWa1o3THJwS01LRFNxcjR3dzlQRVBLaEhtUGh5ZEhCZVR5eURI?=
 =?utf-8?B?UEtsckNYWmU3ZUpjRHFxZUNTdGlVYlV0QlNORmg0ZlpMVXBwSWMxMGh4K0JF?=
 =?utf-8?B?bmJheG9sUmdEeVFRdUYwRG9aNFZqZ1c3Yit5Y1hzZ1pxRmI0YXBlbENENG9o?=
 =?utf-8?B?V1pLeU5nZGNXeXgzRjFDVmpjU3psVC9IM1JzN1d2Mm9iQnE2eDIrclFWV0p5?=
 =?utf-8?B?WWRtNjQyUU1tVSt2TzhDa2NKVlhqY01GMWVtdTdUK2Y3dXVZeDVmbXZNTWhB?=
 =?utf-8?B?cCtFdkNNSFdMMzVyanpjV1VFNWdsWlBBS0lLbnZsbVMyemZoVFJqRzU0SStW?=
 =?utf-8?B?Tkx0SVE0TUJhRkhRQ0VLdVlHaW56TndFY3pwMHVBMkFBZHdRdzVZd2xmb0ly?=
 =?utf-8?B?aXZZN1IrUVZISmhKNXppK0V2Q1BqSisvemtBWEJrWmtscVo3Umd0bU5GQWNh?=
 =?utf-8?B?Smw3K2VRT21pRU9KalJ6RWVid3VoYzR2NytzMlA0eUZMYWwzV1d5NndFcjc2?=
 =?utf-8?B?Q0ZMc1l3L2kwbEd1VW5TNSs3K1dJaWF2azRmVm9NcXBsNzZDblREY2VqM21w?=
 =?utf-8?B?cjJIMzdRRGR6TVNnU1lrdjdzc0RjaThvRUhnck0xNG5lYW14NkhvM0plOTZK?=
 =?utf-8?B?SHcyTXJSZEhDK3M1UEZEalZVb0IxanJXVjg2MXpIUXlZTE9mdWNXYVVHMzhh?=
 =?utf-8?B?UlNnL0F2OVoxbllTTENNdnFsSGlGSVZJS1Y4bitvejVBaGVrTmExWVhJaDAw?=
 =?utf-8?B?czVCZURON3R4S1V3c0ZsQ1lpT0xRR2VKVmUwVXhFYldNcW1XajRqTFQyM0ZY?=
 =?utf-8?B?WjRmUEFPdzdBMzZsNzVDSXhBbERLVzZrSWxldGEwTDYrUkl4ZXloMHVKSEha?=
 =?utf-8?B?RXJaSkZIMENvY3BpSWY5NHN0TW5GZ1ZqS29GcHpKNzRrWlU0SHNyZkpNaGVx?=
 =?utf-8?B?djNUYU1ydG5Nb0EyR0ZhZnMxeVU4MU1BNW1XcHlrN3JKSmZsTFkzdXFhbTMw?=
 =?utf-8?B?WkxhZGdWWjBBUVhoRHRvWEkrU1UrV0hyVWhLcGsvSHl5SkR0ci8zRFNhZytN?=
 =?utf-8?B?QmFCK1Rrb0NlNzhpbEdoNm1Senp1bkZwSjg1b3NqY2FBRlFuWi94VmRZcGhT?=
 =?utf-8?B?RkhFbDBKT3pWbGtXSmhHREFOT0VwZlF0OTU4S2YrLzZnUDNVSjBYN284S3dZ?=
 =?utf-8?B?WmtaVkVWYWY2ZnREUmdwOHFyM1RhNTlaZGhEdGc1c0JqSTRxTHJacm45Z1gy?=
 =?utf-8?B?TjJVME16N2VWaTZIQ00wcUxWOURxOEo5UnhuaHYveGYzeGMvdWRBNnROVFcz?=
 =?utf-8?B?YzgwNjVzZktyNXhvS3haNVVNWkd0bWZ0c1ZoeXRQY3Ztd2JPQ1RIUkhCVFg5?=
 =?utf-8?B?RVlZM2dYb2NhclFPeU42clBCUmJpSTdlTUZPMmI1RGlVL1hIdk9Gcno2MFZm?=
 =?utf-8?B?bzN6V3NUbVFOZk4rSElsRkwwOGRhM0FwRU1KRnlReHpHNU5uWlRNQWdTUlB1?=
 =?utf-8?B?ZUJTQXUzQUpDTG9idVNPZTFJWU1vNHUvWldhbEl3Y2J5STJiWGRCYnVOSGRO?=
 =?utf-8?B?aU1ibEtNQ0dzTnkwbm81WXFkeXc1MzF1dlJCSGNyUGRYaUY5T2ZvYUpJTkRV?=
 =?utf-8?B?ejlRUjMxRFp6YmN0bnhPV2l5cUgwMEhnR1NtMDdScTNsSUVQR2ZuZkVBdVRD?=
 =?utf-8?B?N3lTeHdoaHdNL2cyc200dURoSXFJaEE1NTJsY0ZnSVFuc0RtWUR0b2gxc0lS?=
 =?utf-8?Q?HjOBO7gc2SlzU+/M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8285029-363a-4e65-9e44-08da4ab1a6fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 07:20:10.0086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLkxC+KFZaIHsdR8CPV9ALefcVV2yWctBgyAn896g+0RbSGyYHi/X9P7nDEJM8s1o40HqMlYvHgawPeX08xzwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6786

On Fri, May 27, 2022 at 12:37:19PM +0200, Jan Beulich wrote:
> As per [1] the expansion of the pirq_dpci() macro causes a -Waddress
> controlled warning (enabled implicitly in our builds, if not by default)
> tying the middle part of the involved conditional expression to the
> surrounding boolean context. Work around this by introducing a local
> inline function in the affected source file.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102967
> ---
> This is intended to replace an earlier patch by Andrew [2], open-coding
> and then simplifying the macro in the one problematic place.
> 
> Note that, with pirq_dpci() presently used solely in the one file being
> changed here, we could in principle also remove the #define and use just
> an inline(?) function in this file. But then the macro would need
> reinstating as soon as a use elsewhere would become necessary.
> 
> As to the inline - I think it's warranted here, but it goes against our
> general policy of using inline only in header files. Hence I'd be okay
> to drop it to avoid controversy.
> 
> [2] https://lists.xen.org/archives/html/xen-devel/2021-10/msg01635.html
> 
> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -25,6 +25,18 @@
>  #include <asm/hvm/support.h>
>  #include <asm/io_apic.h>
>  
> +/*
> + * Gcc12 takes issue with pirq_dpci() being used in boolean context (see gcc
> + * bug 102967). While we can't replace the macro definition in the header by an
> + * inline function, we can do so here.
> + */
> +static inline struct hvm_pirq_dpci *_pirq_dpci(struct pirq *pirq)
> +{
> +    return pirq_dpci(pirq);
> +}
> +#undef pirq_dpci
> +#define pirq_dpci(pirq) _pirq_dpci(pirq)

That's fairly ugly.  Seeing as pirq_dpci is only used in hvm.c, would
it make sense to just convert the macro to be a static inline in that
file? (and remove pirq_dpci() from irq.h).

Thanks, Roger.

