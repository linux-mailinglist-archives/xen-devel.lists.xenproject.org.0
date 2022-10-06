Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CDF5F63D2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 11:51:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416804.661495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogNXJ-00063H-Fr; Thu, 06 Oct 2022 09:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416804.661495; Thu, 06 Oct 2022 09:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogNXJ-00060t-D6; Thu, 06 Oct 2022 09:51:25 +0000
Received: by outflank-mailman (input) for mailman id 416804;
 Thu, 06 Oct 2022 09:51:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xibJ=2H=citrix.com=prvs=271cd1fce=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ogNXH-00060n-Oa
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 09:51:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e657e6b-455c-11ed-9377-c1cf23e5d27e;
 Thu, 06 Oct 2022 11:51:22 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2022 05:51:19 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6386.namprd03.prod.outlook.com (2603:10b6:806:1c1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Thu, 6 Oct
 2022 09:51:15 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 09:51:15 +0000
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
X-Inumbo-ID: 6e657e6b-455c-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665049882;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=m/VYlMSbCju6dBMqbt2mD95iGbvMd3E8cg9WkRMolnE=;
  b=CKeOjraQWWJyety7dXdo/kePFUSJtfwTXtmU15JJIHZLKSlu8YmBDOle
   2aKAVB05BUZ5wMvJFzvfXd1Se3aY/9f2ughA8PxwxLDvD3eHVEhj4l4A0
   qOyk6A49GYc7XbgGULjZSGSBb+Cgo6YApv8kVJ8uLfm2LrM5IGN8MZCu0
   g=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 82526224
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8ZGI4ap1JKpo1IEp4bNNUbiGnEleBmKNZBIvgKrLsJaIsI4StFCzt
 garIBmBPfbZa2X8KI8nYYqxoRlXu8TXx9FnHQRvrysyFy4X8JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgT4geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 tMnBAsDdwm6rbi6zbiHbutIvdUFFZy+VG8fkikIITDxK98DGMmGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0oojuiF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efx36hBthISNVU8NZv3Ue0mGBOIicofmnhkP6AsHDueuNmf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx750NisoM27S+7ErwiTumrZjUTSY4/gzSGGmi62tRboO/e5ah71Sd6P9aNZuYVXGIp
 n1CkM+bhMguAJeXhWqySeMCNLiz4rCONzi0vLJ0N5wo9jDo93v9e4lVuWh6PB0wbJZCfiL1a
 kjOvw8X/IVUIHahca5wZcS2Ftguyq/jU9/iU5g4c+ZzX3S4TyfflAkGWKJa9zqFfJQE+U3nB
 aqmTA==
IronPort-HdrOrdr: A9a23:2mALQa0+6sbB2B2yhHGLJgqjBdJxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQD0g/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T+c2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdkDXI4XIL0TvP2FWYiXzsrYjQQy87MdNIgcZ8fgHC40Qtkdlg2O
 YTtljp/6Z/PFflpmDQ9tLIXxZlmg6dpmcjq/caizh6XZEFYLFcgIQD9Ad+EYsGHgj99Ic7ed
 MeRf301bJzSxe3fnrZtm5gzJiFWWkyJA6PRgw4tsmcw1Ft7QVE5npd4PZasmYL9Zo7RZUBzf
 /DKL5UmLZHSdJTRb5hBc8aKPHHRFDlcFbpCia/MF7nHKYINzbmsJjs+og44+msZdgh0IYyop
 LcS1lV3FRCNH4GMff+nKGjzyq9A1lUBV/Wu4NjDtlCy/HBrYPQQGy+oAtEqbrknx0daverKc
 pbdqgmR8MLFlGeabqh7zeOJaW6FkNuIfH9muxLL25m8fi7XbHCh6j8TMv5AobLPHINZl7fa0
 FzLwQbYv8wo3yWZg==
X-IronPort-AV: E=Sophos;i="5.95,163,1661832000"; 
   d="scan'208";a="82526224"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euSDPsdf/eRCb8vW4KtcMnt6pFEyEGBzrtym93wno6e/MiZsjSmL8nybtFl16MH7pXi+30ud2OtGzScFEuzBCa9aPLBPOmWIgIuDS56D6TyYKXnxSxmnmzpraE9ELMTQDu8CsJzjlbPNCVMnvMCqR7a24tr660lMbrDR3SUro1xDnhUnWx31UpY7bDNAOSN3YyO6aG1dnQTIlWc2DuQKSjqCjQps6KzeGcAQJajM+hF2KXpQnvrtrV7Wx+n+OrJNHx7IDOMSR6XUbkbSzYwu/wPTSxSG7ZtUQu0eGkt0e+UA/z3YnzGk0hOJpNf18pikM45x/0g2hZziJ8ymFQG+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqMqzPuCSglOGtU5MOkOsCLR9mksTpAyA5QPdJyClHs=;
 b=C5Toj/0HdL3fKMWJlW7W5sBrJCgU9KJSnADb9KuicBbGlTCaKLbNHqvpAh63lf3bC+5S+DjOgrW4B8PgBsQMx6hPwUwt2mYLXgX9+YAiZklBu45piAzrZNDgxZNwV6DHHxhzkiEctFYbwM3GiXGEpBuRK6BocUPJeF5Sf+hQdk7LRRPvFrmNw8c0gX2fBU0iAvI1urirrTdswpQqi0js9voyGTdQ1FNDHXIZpKzjVOKD5qo1q7jSBLIG5DnKEWFIvfX4i8nlDN6IL9Pu+zH1PZi3qolUO4X/s+OPwca0SXllzfTtMvq/Tb4t7XQ6jP3hd9E03jICbDOHocWpdKf6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqMqzPuCSglOGtU5MOkOsCLR9mksTpAyA5QPdJyClHs=;
 b=iIw/4ZE9JZ7mXcUzNNMcptVuE+PzJMX2aF8sue2yiuolqFC3Qbv8ygyLjDv5TbDS2elc8uLaKRsIvF/0A4dZfBdEk0U3CNmLKxHFQ+HnkJCM1DS+2mxMKlvfwUHd4YMBfdFnYC5h1S9JQObc47UUZ2AH7kXXD7iSEAkbHHzk0QI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 6 Oct 2022 11:51:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v2][4.17] EFI: don't convert memory marked for runtime
 use to ordinary RAM
Message-ID: <Yz6lDnBWcIVAe7o+@Air-de-Roger>
References: <ca557de7-88e9-bf2b-0f5e-6a42dca3f9f7@suse.com>
 <Yz6XgVMd/a/XU7jr@Air-de-Roger>
 <187834a6-6fcb-6e84-1247-ed7f4e23d417@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <187834a6-6fcb-6e84-1247-ed7f4e23d417@suse.com>
X-ClientProxiedBy: LO2P265CA0351.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::27) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5efaf8-3ed6-44da-f099-08daa7804f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AXErx0KS0wNmY86V8yDPTOjkDhcXDmvSNXJWiQmG5UVfFGatUVYeBUH5gJZAh9zumAZ9TlZ/8njnGgggAARF4eJ6TG9zsDSv90oKToUF6OCp+dOxgDec5uQlzcngHFtwCussxeWz5hSIbkD9fnFnivH8wnT+SPSs9PQK0eNTJf4vJArFrgn/YPc6J+bzMh8sA9+IuYerJTPVNDb8cPy9EgpI790TYZd/FsoldXO17xlEsdDzj541Ph5xc6jZIqcKOYZq5xNUqAK3q8SFliK7f3CbJzTZv54YM9JR9NoIaDGgP9LP5rmjAzi3oBuFIFZsg0rhbIArsTqoMichGbZbwr9xQkZJ+3Y4ZgeLoZNZWYQREtnTgmaWK7LRywaFe87UV6qs2frovsD+3T7i2DQ9hs0HmaKcZWZd5d2xs/a4R856hgg+PQtvTVTMKFomRN8L/w6mfmSmBOp0Mx/LJ11SL8bUtCpNBw6y9wpPWCwI44vfCWxMKQX7oWlyREV79r6PmEcmGeMO7YVdAp5CWNQkyNUbyrCEHhejp96ukAzSx30wOB89N1GbgDJ9W9U+B3BoH/Ox4Q8WnK4GoK8UGOfe8nt9m1b+2iQ7QKE+4qJMIa1337ZUXnsqVtBOFIAo5ilDs391cR32XMgDLj17ZgwJoAv6rq6m3UZutRPm/hRynJYZsrZBQW34kyb5nmLMlBpyLQUE6NFv1+tDntYCWjegIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(396003)(376002)(366004)(346002)(136003)(39860400002)(451199015)(6916009)(33716001)(478600001)(85182001)(2906002)(8936002)(6666004)(66946007)(316002)(86362001)(8676002)(66476007)(26005)(38100700002)(4326008)(54906003)(5660300002)(66556008)(53546011)(82960400001)(6486002)(9686003)(6512007)(41300700001)(6506007)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blpRK0g0UnBxVTduNis1UDVRZnFCRkh1ZVV3MHQxNzlzSW43QXpkVTcveTNX?=
 =?utf-8?B?dVFYRjdnclpZeURxT3NxV0ZoeS9BRk9QTmN3Mk55UXMyMnJzNytoVmFDR2w3?=
 =?utf-8?B?c2N0ajVOazFFYUZkbVJsVVJtNEZ6em5VWFg2aU84QVphSERxWFBDRXJjNzBi?=
 =?utf-8?B?Z0h1dDY5K3RPc0pPVjlCMzFpYmNpaENWekkzM1UzZ29lQkVVQzljRDFIb1pW?=
 =?utf-8?B?TW53eWdhMTdXYWhmamNiNVFveVdPL2owTlV5RXBOVVJuZ0U4Y2c4eXRLRGpu?=
 =?utf-8?B?U1Q2dzVOYjVwMjR5emhVcXk2RGQ5VVNyM0hrWkxSNktNTm1seFg0SW5pa0R5?=
 =?utf-8?B?aE1vNVBwLzRRYm9RbWcrT1ZwUmpsbGxUUVhVZWM1aEUrVDdaMTBsaTFyZ0F2?=
 =?utf-8?B?aHJJN0lEVWZGeDlRcG1nU3JFMnhWazZrSkJBWlRVZjJxUTFiUDd3ZGpJOEpr?=
 =?utf-8?B?OG5zc1grN0kydDlkMDFsYUhKdWRkcXZZMmJ3MmgvMXVmbmcxeGtRUnp1Z1Y2?=
 =?utf-8?B?T05PcjM0RmlFQWkyZFF6QzlwY2JvcjFNMXJRK3VUWUVRV3p5QkF5SmVyZUhv?=
 =?utf-8?B?MjE3V2h3K1NwTkNIWlJjeTk4ZFBFeGVuc2ZYQTdHenBtNmlmdXBKQmd3VHk2?=
 =?utf-8?B?K2hROVM2Z0NHZTF0TkgwZHBmUU1KYlVEMnB0eFR0ZWVBV3JvZ1hYTnZibkJU?=
 =?utf-8?B?aSttTlRlQ1d6K2lZU010VHl5WXZsdkZpbXEwZmhBS2hjVm5oVm5LZFV3Qndk?=
 =?utf-8?B?TjZ3Vk40aitHSDFnNHk4bGM0WGMyNTBqQ2JPOHNSVFZFL1A5NUFlOG5UQjFk?=
 =?utf-8?B?aGVVM3JiZGphdnZtTlpmSlZoSG5DaXBINCtNbkpERUszWlFHWEdhWUdlUkVK?=
 =?utf-8?B?dy8yT01pUmpFSis5R0ZPbXpWN0g2UVovbmgvNVlPTkw3b3c3a1AybzBzYUlh?=
 =?utf-8?B?eDlSbXcyVnhVa1UzRFBvQyt0ekZHNmtMMnZHeUcwYVF3TC9wSlhXR2hpdStT?=
 =?utf-8?B?TVVUSVBYTU1xMkJGclNTd2tsakJicHhhMkNtK2lwbWJZZWtQTjhhZ1MvKzVQ?=
 =?utf-8?B?UTlxSEJvVTJYUUpLMlJwYmZleTNLS2lLTmxsQ2cwZ0tHcVRRbWRLRURONVFE?=
 =?utf-8?B?dVJEMmVabnBwOHUyM0Q2Q3YvS0ZHRjNqd2orV0doMEJPQk5VUnNJcExlL1hL?=
 =?utf-8?B?aTJkMDZEOWFMMkM4UDV3RDFVR0dVQ1l6TWJZRWgrVFlWazhRcW5vUllFcjR0?=
 =?utf-8?B?Q2lDMlBUNndLOFZpUDFyNEg2QUFmOFphK2VuYkF0T0tuMTBWcFJaL1FjZWR0?=
 =?utf-8?B?NUppVlQ2dEtwY1NyajRDb1NrbitBWVBVUFhSRmpqang4cm1oM25hcVZ0NE9n?=
 =?utf-8?B?UzBObForZHlySkQ0YnMvTGJETytVcjB5WHByMTJqUEU0SXNxbElVM0h6WGg3?=
 =?utf-8?B?MC9nR1AvRWJHeGNmbjZrOHY3cVFqVTdTcmlzSDhIcitMaVc5MHdZaElKUWQ2?=
 =?utf-8?B?MWM1bW93RmF2UEhON1RvSGY5OVNwb2M4b3pHODJ1Q05MQloxZDdReFQyam14?=
 =?utf-8?B?ei8wdlJFZnlpNWExVkhQaUVBUDBJZWZmRml2OWVVU2JPTjhiWngwNmczb3Vi?=
 =?utf-8?B?d0tOVGNZNlRRanVIUXVJbmx5cHhTSEZjcVZkSWMyMFo3cmZiWEhKNURlZElp?=
 =?utf-8?B?em5sZjA3RDBWSHV3NHJHUGQ1MnB6eDY2cFBlRFR3TjZtNTVEVmxpYzlGQ082?=
 =?utf-8?B?eTErcjZUL1ZQbjdqa1c5SEtBM2xxakJjeElmZk5aWHJ5dE8yeEtKc2RiNVVO?=
 =?utf-8?B?UE94c2Q5UVcycHBEMXhpdWJidEwxbDFpaTVTQzFxdmVlUzl0VkVBcjV2bUFJ?=
 =?utf-8?B?TXhuU1d3RENsb3RtcGxUNGd5dmJkbm1rWHNMZG9HNDgvVCttNXVUbVc5QkIv?=
 =?utf-8?B?eTFzU0orY1NobytNMFE4d09qbExyTDdpQUlFcHkvMlBBVXZBV01wMmxFR2RV?=
 =?utf-8?B?bEFtL2N4NVlhQkhyZFUvTUZvbVpLNnlrU0p1QnFyalFPd2JwWTU3Vk5MNXNK?=
 =?utf-8?B?Z1FIaEJoSkpOdkprb21xejZXZUdtTEo0c2hBNEJoTk4xMlRjZEI5aTBJWDhZ?=
 =?utf-8?B?cjhtZ0xjQVZ2eGtCdCtxUHV1Nnl5bWpkUTl6VzhXVFAySDRibVkrSzNCS21L?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?QzFMc3ZPMkNlaThlVTZDZXU1K1V5ek4wL3RKRlZrSCszdGRDRGkyMHUxWjl3?=
 =?utf-8?B?Y2hDaU8rSzJmTm8yUVZidzBqbnBSNjhjM0p0cWc4MHZZWlRxTnJoU00xdjFW?=
 =?utf-8?B?UWV3N3ZtU0c1NDJqSWxwWkYvZzhpZDlaeHVueFBiZUFaZ0tqL3JrU2cwS25R?=
 =?utf-8?B?UzNNV0ZjSFUrRXE1d1NLVHNyWElOcmF1a2k0VWRVLzk5T2xDcXlWUitTMDh0?=
 =?utf-8?B?M3Q4MDNuMnZzRDkyTEJUWmNSckdQSTl5MVZzOHhlVlJ1ejhaYXZnWGx0Zk8y?=
 =?utf-8?B?MHhmc3Z5YUtTOTNVdSs4OHFQTVltTEdsT0c3d1NnRk9wb214ckhnZ08wcWVG?=
 =?utf-8?B?QjJ0aWxUbE9kWnNKdGF6MnlzNWluZVArMlVXR2pwRExqeGRJRmcvb3RXUFRG?=
 =?utf-8?B?RG14dkNLK00zaklTZWh6VTNseU9YNDI1N1RKMExaZXdvWko5c0x6SWYwZjNR?=
 =?utf-8?B?ZXEyMjFWTHBhUzJqSkd2L2pRemh1YjVGQU9VNEJGTU13eHpRME5kOUpWZk9W?=
 =?utf-8?B?RDZydWUweE5iQWx6d3ZCTzdBWTNGKzJCRGJNT1Z2TVBaSnFrQ3FNWmMrdGcw?=
 =?utf-8?B?dTRaQi9PV2RRd3orMFVFY3pEQWFrMEJ4dkJVY3BsSU1QMnlnR3pvS1htL1Ez?=
 =?utf-8?B?cHBiZTZ5NUpvR0NGUVVrM1pyMUpDR2lJM2ZRMmtlcjNkMEhpNFYxUVR5SmZC?=
 =?utf-8?B?eG1hTDcrS0JPRGZlazRFc1A3bFovblQ1bkxtVkZES1o2ZlUzajJwZi8ydFd4?=
 =?utf-8?B?ekhIZ0h6UXByQ2lXbENlZmFIWWdaK1g2YkkxNlVPK0ZrTk1vRTkzN1FsVlc0?=
 =?utf-8?B?OXI5ZUI0d2JUL3UxbGJtUHdWWEluVHEyM212RWRQSHFQM1VYV1lzY2JZNnZw?=
 =?utf-8?B?eDlJVDRsem52M0ZmZTBIMTJ2eDk2VjJjeTJhOU9PbG9yK3RoQkRNY2hBb0pl?=
 =?utf-8?B?b3ZrY0dtVFp4a0pUVTRWajdQeUZrcTg4OUViN1Q3SzVTSGtZMkNNSEZEVGM2?=
 =?utf-8?B?N2lOM1VsSTBLY0RnSVBtQ2lBTDBkTStuQk5IYkFlY1hLUnNSdmRNeGlrVUd5?=
 =?utf-8?B?YlBzVDdqRE9MMjVnbGdGRDlvem96cTRjTTl4WERFTmhEbnJlYWJ6SmZ0c1Q4?=
 =?utf-8?B?N1NPN3RIQ05KUEtDR29JQmY3Zm80dHJzZDhueCswOXN1aWFpYXZhUDNxL3FH?=
 =?utf-8?B?Yy83WDhhRkw5QXFYU3V3Zmw2SHRIVmxxbU5XTG9EdmducGluYjZmTUJPZEww?=
 =?utf-8?B?U05IeDVxemRGUXJTNTJXTlZRYm9jRVI0OStQNGRnSzZTMGdFRXJ4YmpnUTkw?=
 =?utf-8?B?bEFnWkltbG82WDRxdHNTYjdkVU11YzdDUk5GRlcrZkREdTdYc3pJb3paTEdy?=
 =?utf-8?B?cHU0bklqY1J1UFRHNUlYQndvRXJ1YjJwUTR0OG92VktmUktXNm50Yk00K296?=
 =?utf-8?B?VUZJV0lCWmJndjMyRW5kcFVEL1ZIVlcvSWdBSGdxd0JCeGJJbklnSkFKQTBF?=
 =?utf-8?Q?zyVXyU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5efaf8-3ed6-44da-f099-08daa7804f2f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 09:51:15.5040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kc1luz7rD5lwPcEZZ8NXwcukWHaC3DosARPz4Hlyyvs27E/9uVulVPBlR/0wyui2LlBjVzYHCAOdt0inEAqIBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6386

On Thu, Oct 06, 2022 at 10:58:43AM +0200, Jan Beulich wrote:
> On 06.10.2022 10:53, Roger Pau Monné wrote:
> > On Thu, Oct 06, 2022 at 10:40:56AM +0200, Jan Beulich wrote:
> >> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
> >> higher priority than the type of the range. To avoid accessing memory at
> >> runtime which was re-used for other purposes, make
> >> efi_arch_process_memory_map() follow suit. While on x86 in theory the
> >> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
> >> E820_ACPI memory there (and it would be a bug if the Dom0 kernel tried
> >> to do so, bypassing Xen's memory management), hence that type's handling
> > 
> > Strictly speaking I don't think dom0 needs to bypass Xen's memory
> > management, just overwriting the page would be bad enough for runtime
> > services to not work correctly I would think.
> 
> Then how about:
> 
> "While on x86 in theory the same would apply to EfiACPIReclaimMemory, we don't
>  actually "reclaim" or clobber E820_ACPI memory there (and it would be a bug if
>  the Dom0 kernel tried to reclaim the range, bypassing Xen's memory management,
>  plus it would be at least bogus if it clobbered that space), hence that type's
>  handling can be left alone."
> 
> I didn't think the clobbering aspect needed pointing out, as the same applies
> to all other memory which Dom0 is able to access beyond its actual allocation.

I think it makes it clear that just clobbering it from dom0 could
cause issues to runtime services.  I guess it can be extrapolated that
clobbering is also bad if reclaiming is.

Thanks, Roger.

