Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A0A72FFF1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 15:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548779.856915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9QTk-000607-Nf; Wed, 14 Jun 2023 13:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548779.856915; Wed, 14 Jun 2023 13:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9QTk-0005yF-KO; Wed, 14 Jun 2023 13:24:04 +0000
Received: by outflank-mailman (input) for mailman id 548779;
 Wed, 14 Jun 2023 13:24:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0CzZ=CC=citrix.com=prvs=522257c86=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q9QTi-0005y3-Hg
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 13:24:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7a55bb6-0ab6-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 15:23:59 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jun 2023 09:23:56 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6223.namprd03.prod.outlook.com (2603:10b6:a03:37f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 13:23:50 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Wed, 14 Jun 2023
 13:23:50 +0000
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
X-Inumbo-ID: b7a55bb6-0ab6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686749039;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=y+pdf4YCSaQqeK6eev4RIoFd0/TlIajkB40cgFzFmrM=;
  b=F0EGFrKMBqC+nOLBK4wpjDyQSKYB/V/dV6H3FH5CUJnP0EdKL59XDgjv
   5293Vu4pBrNMQiU5etP0hx7YXMaecZnwEL+pi7+/JvEWCFsQ48sUvkNxv
   Z/2JwMq/vs1nJhSoUnK+cuDgj3Mff/t3G2CaJZnSCe6rmtvoSURVm3k6G
   I=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 112776359
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QQXqIa5tvDefQQ/SxTmdagxRtCrGchMFZxGqfqrLsTDasY5as4F+v
 mBJWzvUMvffN2unL41zPYi29kpUsZ/Ux4dqQQBvqX0wHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4S4AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 PU5b24BNza6jN2Xzu+pY9JrheQfI5y+VG8fkikIITDxK98DGMmGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ok0ooj+OF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHmkB9xJSezQGvhCjW+17TMDUBwtR1Kdnsizh2vnAu1FA
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2IB5UlqY/7aQ6D+3Zy4cKDZbYTdeFFRepd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2NNo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:Q+5Py6puW3iJh/xideGgGwsaV5oReYIsimQD101hICG9JPbo8P
 xG+85rtiMc6QxwZJhOo7u90cW7K080lqQV3WByB9iftVLdyQ+VxehZhOPfKlvbdhEWndQy6U
 4PScRD4HKbNykdsS5XijPIcerJYbO8gcWVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3AbQar/Wsd7dDZHNsYzh7ZMFNM6IsIe1yaknuJBXa?=
 =?us-ascii?q?zNkdnFa+8cliT2J9rxp8=3D?=
X-Talos-MUID: 9a23:V+4eOwlbXxfbjp+AFJACdnpvBuFDvLT2CXsfmLM5isOJEHUpBC202WE=
X-IronPort-AV: E=Sophos;i="6.00,242,1681185600"; 
   d="scan'208";a="112776359"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZmCJLa6TziQjJXHg/tLs7SZ1ER/xdaygvnGwD/RzdSNmSI7YyKHnCFUgMMJXY7AD96S4kSmCy0rJFI5oJL+Ks/H7N/c9hHUytZQMY5RwVSwdbVHqgPWbczbFGlg20g6vRpwLVQSkz3DVsCoKjF+pykUtFruJgNGLmiiitXIEayds1aHSpWvb/xZIYGkCiDSs8il+GIbTxbYt3ylupywopHM6sXfOP47M1eDsa3v51QfxrEwrYbqRqil1Q2gp41bTHZWeBl1uMsm7eTiIY0uVpJuAK95GIXiU69ukHaMRX2lwpLbDOcDJHAsS2MSUjzUFJLdQn0zSKWu1hP6ved9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EW0J2ASRDyPn3qivvp1t+h7uBWPprYtfWZ7NzD/HKt0=;
 b=SkBRLPkv9i4wrwu9tw8UpZhhNPTXandfSNM1VD7wRo4qjAA0Pe4B3DudA1CVYo7cg8ce0x70iU17gNrMKnaE4N2m+VIN3B122dgEVcRxv79J7tycrvX+DVKMwqg3YCb8JW/lMkFKLW0+wqPnuX/SyUITMXEI/+W+PfBjkqJb475QvrNpAKcZM4PcJDlVKoIMY/IHv4DPxh4Sjtu3GgDS0dDb+eSlkFhkbqp0dok6RMBYEqhI1yc6cKVTBWBBmX9BN1ChmxsS78ulZDvwPV2hnnmj7YC/Pg03+rfaPuKRZ6Gqa/wT9dIAKNovCtiHtzO5wSgQxXvXbb3IeSdY95EOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EW0J2ASRDyPn3qivvp1t+h7uBWPprYtfWZ7NzD/HKt0=;
 b=tYCSgZRpHU3dfOaC1vJA4Z4uv+eXt1rKzULVXMFytxkdxCSEI+RKrSNeiNlpj+TlNi6LsXSXLsKbJNzLe4swuJjgafcx/9j/VAth7MM7zLDDWHgXWgakcdpFuhBT9M4XR4M9S3xjXNLPLJvjkkVtsom8zrGzuLtdJXxksG/K3QA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 14 Jun 2023 15:23:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] iommu/amd-vi: adjust _amd_iommu_flush_pages() to handle
 pseudo-domids
Message-ID: <ZIm/X4hDpMLIeuHX@Air-de-Roger>
References: <20230614083236.64574-1-roger.pau@citrix.com>
 <5c12e29a-ea85-b216-fedd-a8028a82d3ac@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5c12e29a-ea85-b216-fedd-a8028a82d3ac@suse.com>
X-ClientProxiedBy: LO4P123CA0196.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a93b11f-3e59-464f-e307-08db6cda9745
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8YVC5rOwhi9HFRj/TZvJ+ijRQ8jRaqHYumG9OBUo37XZMMC1rUybzJcgAxw9NJpuCOkwmD9Bhcp3y1qM7+sI0AbOYn1mLpzlZVbs+BDEOcxXZ3z8KfsycZ2PLLzMu0My2iySVbpJoAhXw65MGF91fn+6vbIbvSPKaBW1j7esAP+KUvGh+J04lVceKWiEdcZ4bNQQYvepAOCjr+WCwn9bwQacHR/uCFDM7i4b69Duo5bJmO07Jk0N2UfDBSGFh9qO7AOs5lVT4ToF/Tu5hRj2CPonFfitPKJTVyn/JrQMpfvfwCDrNTMV2EW2Sml3rSQIXE8YqprusFQ2bRb1wZylmr5aczjIAKWVxtp3hp5+kjzCTPfEmZlr17SSrkQkDbWwlIeIbzBUOb3MGNcOcN88Nh7v04x69TkCFw9dT1MSn9qGTQpuqZn97q+b8vprwEt4+8UR7ELKzicvYpTnklA8Oh11CuyiODfUdrTy+LqFQJXBLbvy6XBlyKjGxhqOMLrHKwEl04ub8t8UZj+zHgLXnHAGwzaXYVvKtMWbQK8SSuk1FNK3KMqXqil0hpm6VHA7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(83380400001)(5660300002)(186003)(33716001)(6506007)(2906002)(41300700001)(6512007)(8936002)(9686003)(26005)(8676002)(6486002)(316002)(53546011)(6666004)(85182001)(82960400001)(478600001)(38100700002)(86362001)(4326008)(66476007)(66556008)(66946007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3lkMmV4bWp4Z0J5YVlQeEd2Ym9BT2pWTzd4ZVkzQTFCSlUrdURBc2F4eU9H?=
 =?utf-8?B?K0x6YUl5SWRpWkh2QVZvNklFTUlXeWJDYW5SUDkxSDRIL2Y3Rmljb21GU1Vl?=
 =?utf-8?B?TmE5Uk9VK2swbWJ5dXhiMk1MbEY4S25wOXB4R1NadTNGSC90Um1HajdVZXlE?=
 =?utf-8?B?c2ZaL1U3N1VHVXYvd25hbkM4MDRhMG5pYm9yV2N4U2ovQ0licldoYU1nWE1z?=
 =?utf-8?B?ZnBEWG50VXBab3psd1hOY3NhQUNRNDBqc0ZQMlRkT3dIckhVY242WFZpSGkw?=
 =?utf-8?B?N3NaYmFtT0hXUER6UnRYWWZLRzhIbDhJemdla2F2dU9wL25kK0lCdG93dDFR?=
 =?utf-8?B?WEdMMU9RaXA0cC9XZ3kwcjFVY2ovS0d3L09nRFhEak1jOE45Z1BxakhmaTdK?=
 =?utf-8?B?VktTWU1JQU1hekY1cFhqTkgra0dYMUtYZmZnTlVVazNGeXovM1A4SVFhcnhk?=
 =?utf-8?B?YTVZc2gwaW5YZVlvQzMwS09ETE15NDBwVFA0RXczUmM5R3ZkNFYvNWZJRHVp?=
 =?utf-8?B?Z1dvaTZ1Z01ibWJUYnRqVlRQMTJPUUlMVTlWWFRTZVdObEdsaVhIYlhKSmdS?=
 =?utf-8?B?TkxiQzExUG43OHdQWDZzeENjSUxFaGYrUWpNOEsyL2w2Smwvemo5TEVndUFE?=
 =?utf-8?B?UFZCajhiOXlteVJnbHhjalVFVDhFYUVnWEs1NTE0am9oaTgxdlZIakpyNFR6?=
 =?utf-8?B?NlZpajJlTmE3MS9jV1QwQnZRRlBCVG5tL1d6QVB6RDdRNHJ0b1NvRExvU0RW?=
 =?utf-8?B?MXI5emJPcVAyWEZPR2lKeXlaQzEwcE0wMFhvNDRNTHg2ZnVoWGVUYjlBdUJu?=
 =?utf-8?B?Y0txMmlHbk1ubm1DN21LMEl0LzN6eXcxUVVsVHRoWkNXTE1adUxYaHZKeVVH?=
 =?utf-8?B?bjljVnVTS3gyOXNOQUpLVTFUL3pWeE1aZUI2Z1djemQwbXNUYUZwdHNpc3Rq?=
 =?utf-8?B?d3B3N09OOVEwLzdPMXVKRTh4SGUwU3EwKy9Wc01nV05TUTVoaUhHbkcrNHhz?=
 =?utf-8?B?M1V3bkNoNUVRaWRMU2VEdk52aXlVdkZlYWtrN3oxVnVaNXAwcm41ZW5IMzdL?=
 =?utf-8?B?MlMvMmpDWGhrVHZPK1BHODFXTGZSYnppL1YrVU9oWlZnOG9SNUZpOGxZZHRn?=
 =?utf-8?B?YnhqV080eWhDYldHTWFGSkNHOU03NjFSOTNDeThLSG9pd2ppZ3FYY214NjZF?=
 =?utf-8?B?M3lSMW4xK01UcUpvOFlWSTAvRDhjRDZBTmx0emJzVTNpVjhCeWNCZm9mZjRG?=
 =?utf-8?B?aTBTZTltQzdwQjJtd09Gc2dzcVAzdXlQRnN1cTB4WlBOTjZIbFBSQ0lWMUhQ?=
 =?utf-8?B?aVVLcW50MC9zUmQwbmY3eWZORGpYWk1ZYWNlaXFERmRyWlF0TnNmdG5oWFJJ?=
 =?utf-8?B?a2labzd1M2laN0Rzd2pBR1NDVXNOSGp2ZWxQeVRuMjlHdzdtV0R0ejllOTNS?=
 =?utf-8?B?OTRESEc1Yys1QjY5RytGcml1QlJUN0lPT2lCSGxLOFZKVjZJN1c0UWNIcnFG?=
 =?utf-8?B?ek9mWC9udi8raElUdHA2ekVYMkpJeCt0VDdUZ3Y5dHEwY3ppT3h2aFZyZms1?=
 =?utf-8?B?UE9NS1FjVHBoU1RBbzl4UnRscDZpOG9uN0p1eUxmN0FTZjJQKzR4N2JPVVB6?=
 =?utf-8?B?RHBtdFpBV3dFdzVPbmpYS01IaTBOR25TR3pzTjlMSjBUMWhTUUpxaUMyWG5B?=
 =?utf-8?B?VWRRRHl5dkY1aTM0Q3RobUZXTHc0NnUycXdaWlB0and0RWVJM3RTTVhGUWlV?=
 =?utf-8?B?M0hnaVNvakZCWGJISU9xclpmeE1ZQmVqQjE4MkNkeDZsdHkrK0lmNlBQQXB6?=
 =?utf-8?B?T3hOd2FMZkdGWXIrRlQwZzVaUWdWZSt5ZHo5aFQ4S3FEb1RwVUxuWk0wU05y?=
 =?utf-8?B?RUJZdVcrR1ZXZExLRUZ4eFZEMGFJTmRoZFFNZVBRVGUvZllNRm9PR1FTOTlk?=
 =?utf-8?B?NGVZNXJtQ2NrMWR3YnFjWFJ2UWw1L1UzUU1WV2VuaG5Mamg5cWVlWkhSbEVW?=
 =?utf-8?B?bWVFaHR0Q2R1T3kyWnN5bXZOeDVsR203cXpUZTdlbmhhNWFYRU4vNHZSbFdG?=
 =?utf-8?B?ajVGOWtlOU9vSlVaWHZZcDF4QjU3NkxETTBwK0JhTk5Bd1hyRVpKVklCVmFN?=
 =?utf-8?Q?hG3881Wkgd6Za4LKQCXJb52r7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JLAC7bfOkGmgLgxu4ZI2UOMOkk3SgbMgrqUh2IRFiMxvXqMeKnmwhRFrLrVbni0c9Ip2DOUC9u8OmBeUt805lO1oO6x2f57pL/IOP7rNNouJCZag1Xdoazlhh1QVMrBDH1iUzebwxer5ogIHeBKeiFK3px/6mHyFpX5pV1d9Dz8Kz2vLOe5F8zLmdB2nGNTlfR81BPRu+80Oo2qwdsOwJUfCC7lu8WYqFKx+zikuJjzHhslkrnDYVIyEQYyJGyPSiSY6BRlhdEg9sa3rankpmOtK0D9hORWh/N9tw1MkOdK951VfH4YRpVPKgIOUHTOt8mSss++p2Vut6sXZmugj3QIiSHR6Ng4Axihm3Y4m7qSd30fY/eIoysvsRaCjLgV54u31GRUmg+joIdoRE1E36wVg5HxAtQaNsJizL6rKGkEkcu2sOXycg26qKh3ecgWcGDMabujGH8ByRPG2Dkl42icyBaR77pfrNW6bqTN2o/Ax+9jUT36B3YT4VXMhhlIexHBy6JsPujQCsCDok/rNJPLIN3Exw+Ic9sXZqH/pLr5nOyjjvaZoCkmjf/Ij/pIryXyVThwacrbmDwseHIIZFtYIpBla9PgNMN+iGiqaeJEEXnUhvG8XRds2C09re4IOjM7CXcKBajBx3gaz9Nv6zwrANbg5Yn+/cjGPAuB+qyIQe/exJb77Q07dTUTKyt21O3RYLkkz135WoNVYob5RksFd8PojRvDUPhDNIL5UbyT0gWGoKt2WLJGsbYSTNiASJ0OFKLnQWiPipIFczFCKlv6zsP/u4IWq3DQDzaU32k0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a93b11f-3e59-464f-e307-08db6cda9745
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 13:23:50.2727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rA4PHd/HJncPoRlDTO+UNQdzH8dBordAY2tPx4+mGWfDNooVfsdktiWbPOolg8vxYRhdsBfiXyeVaYpG4k4O8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6223

On Wed, Jun 14, 2023 at 02:58:14PM +0200, Jan Beulich wrote:
> On 14.06.2023 10:32, Roger Pau Monne wrote:
> > When the passed domain is DomIO iterate over the list of DomIO
> > assigned devices and flush each pseudo-domid found.
> > 
> > invalidate_all_domain_pages() does call amd_iommu_flush_all_pages()
> > with DomIO as a parameter,
> 
> Does it? Since the full function is visible in the patch (because of
> the "While there ..." change), it seems pretty clear that it doesn't:
> for_each_domain() iterates over ordinary domains only.

Oh, I got confused by domain_create() returning early for system
domains.

> > and hence the underlying
> > _amd_iommu_flush_pages() implementation must be capable of flushing
> > all pseudo-domids used by the quarantine domain logic.
> 
> While it didn't occur to me right away when we discussed this, it
> may well be that I left alone all flushing when introducing the pseudo
> domain IDs simply because no flushing would ever happen for the
> quarantine domain.

But the purpose of the calls to invalidate_all_devices() and
invalidate_all_domain_pages() in amd_iommu_resume() is to cover up for
the lack of Invalidate All support in the IOMMU, so flushing
pseudo-domids is also required in order to flush all possible IOMMU
state.

Note that as part of invalidate_all_devices() we do invalidate DTEs
for devices assigned to pseudo-domids, hence it seems natural that we
also flush such pseudo-domids.

> > While there fix invalidate_all_domain_pages() to only attempt to flush
> > the domains that have IOMMU enabled, otherwise the flush is pointless.
> 
> For the moment at least it looks to me as if this change alone wants
> to go in.

I would rather get the current patch with an added call to flush
dom_io in invalidate_all_domain_pages().

Thanks, Roger.

