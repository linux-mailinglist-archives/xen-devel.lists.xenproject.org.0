Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA2A4F600F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 15:37:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299889.511188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5qV-0004BJ-1Z; Wed, 06 Apr 2022 13:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299889.511188; Wed, 06 Apr 2022 13:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5qU-000487-Um; Wed, 06 Apr 2022 13:37:14 +0000
Received: by outflank-mailman (input) for mailman id 299889;
 Wed, 06 Apr 2022 13:37:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc5qT-000477-6Q
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 13:37:13 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a889f5f2-b5ae-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 15:37:11 +0200 (CEST)
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
X-Inumbo-ID: a889f5f2-b5ae-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649252231;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jA0D4LkSxyQZXXMt/ecYO18ZL0TPEKfwb67+/W22RXA=;
  b=hJ3/2RClp0RoUs82NSqc9867yWvMECoe0aZ0taqN8+IfF96qaSPJlA0j
   NbpkRlvhm4jdEu7r3C4XXYsWi46qvS3uyyIxlYe9bg8r0YZD/+Xukdazg
   lSf9ZW/+Jdnj7EXXrcQCiJ+tN5CQ+n2Jlo08nCuWZP7eKFOCfctmh15zo
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70556846
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mlOtt6lq/9VKM7dfrZF+5Fjo5gxbJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYWTvSaKzea2r3fYh/YY+3pk9XsZHUnIBjGlRspC4xQiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlW13V4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYS18IBKr1tvsmSgRxVBpfBoxiopLgCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQq6DO
 pRJNWQHgBLoRiJdCA0cGpkHotjwj1vCazEJ81nFuv9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyL8eDwDCI9natgO7nni7hXo8WUrqi+ZZCn1m71mEVThoMWjOTufCkjmauVtQZL
 FYbkgIsp6Uv8E2gTvHmQga15nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neKks3oA3pzsbSTYXOb6rqQ6zi1PEAowXQqPHFeC1Ffup+6/d913kmnostf/LCdjIXUIzbJ7
 S+xtTUXwI4ytu8vjYic1AWS696znaThQgkw7wTRe2uq6AJleYKoD7CVBUjnAeVod9jAEATY1
 JQQs43Htb1VU8nR/MCYaL9VdIxF8cppJ9E1bbRHO5A6vwqg9He4FWy7yGEvfRw5WirolNKAX
 aMyhe+zzMILVJdJRfUuC25UNyjM5fK+fTgCfqqJBueimrArKGe6ENhGPCZ8JVzFnkk2ir0YM
 pyGa8uqBntyIf05kGvvF7tNge97mXtWKYbvqXbTlUrPPV22PiD9dFv4GAHWMrBRAF2s/m05D
 Oqzx+PVkk4CAYUSkwHc8JIJLEBiEJTILcueliCjTcbaelAOMDh4U5f5mOp9E6Q4z/U9vrqZp
 RmVBx4HoGcTcFWacG1mnFg4M+ixNXu+xFpmVRER0aGAgCF5O9vwtftBLPPav9APrYRe8BK9d
 NFcE+2oCfVTUDXXvTMbaJj2tot5cxq3wwmJOkKYjPIXJsQIq9DhkjM8QjbSyQ==
IronPort-HdrOrdr: A9a23:FmSP76vo7lKKP6HDrm7DHuNm7skClYMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkDuRYTzrdHGeKjM2YabQQ/
 Gnl7Z6TnebCDwqhoPRPAh2Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iGnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAkqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocbTbqjVQGZgoBT+q3tYpxqdS32AXTq+/blngS+pUoJgXfxn6ck7zU9HJFUcegx2w
 2LCNUsqFh0dL5nUUtMPpZxfSKJMB2/ffvtChPlHb21LtBPB5ryw6SHlYndotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.90,239,1643691600"; 
   d="scan'208";a="70556846"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1G2hH7Fgq8NmbEvGp/D4Z3HfvoFSBhg6GY1cWhe1Cl8r122AkziiEjQbN/BFNGWi0SZ51ptAK+OUq28OSe5gPRmULIS6LYOYdChbkl5yAZm6WyI2vtTUXhr7y2eCCbxmXYpnUFljPABBOlQ9gFPeiLkO/nOH8AFss03imMHaRQU3zyrKf113WuTzV+J3mx1/UNhbAwDLgL9gBkk5wLf8lISnoulE0SXax2U9A+8jz0Q6sn2TtkRpu1U/ohZGEmb5WCQ/1lIeB0G/easG0xrOiTJR9jgUxAmjkVAU6UvD+zskpgbhGA0S0Ve7Xq9E5aazDVXH6mLH+Ke5ItjaaaTig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rssg5By14zh8Wq19ELzqJ9Nq5Qpn7C2wW1f/XbIf8/c=;
 b=gZvM27eO3L8Q+yZc9TS6LWhQPimeL6B4HXsHT6H1nbrrRY4SUxZjJ62LWuPcEbbIb7b/LqDG4NME/93thBFRyoiDqUa+RnCb+X2DyW6tm5j92IT9l2ELq6nW9ZW1PwhKU8Kwtd62p0hw1NpqmU/k/L/oKyDuD63KzA3Nm8JLxlfY+lupnCzNPuc+PMo52ixYbaTdQw4eD9YN8lI3f43JffdZ5JrbnaAl9WGcvb2vDJcJkAJzZJLM04YVAB0ycguU4++cI3rtjbvAPE5yxRn1YNOMMU/O4jBcyFNdfSfGJGZYVm4u3r9/7DruY4Y1h7Me0X8q9VC3/VrF+uu+ReK1uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rssg5By14zh8Wq19ELzqJ9Nq5Qpn7C2wW1f/XbIf8/c=;
 b=e5RwBI+PIwCuisTBvFyGL+hQXJa2qEEa3YFwfdbFaXmTfgQrnhwurUCfToo/9CdFEjdA9armeFBUx1uj6V4PJeNlgagEGacvZOlLeXAIAN+Aimiolb78tt17KWhX0kzrTAasOtLFEwTcxRTT9/QaQ1Xph8gww4D4xHexSdAQ8a0=
Date: Wed, 6 Apr 2022 15:36:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 1/2] VT-d: avoid NULL deref on
 domain_context_mapping_one() error paths
Message-ID: <Yk2XcUhUn0BYk3lA@Air-de-Roger>
References: <e17b98ee-8d84-512b-6403-26c7b2ee1eb5@suse.com>
 <d232b6bd-17d2-c78f-49e1-67ffc2502810@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d232b6bd-17d2-c78f-49e1-67ffc2502810@suse.com>
X-ClientProxiedBy: LO4P123CA0489.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79a2cbbd-7fd6-48fd-a03d-08da17d283b1
X-MS-TrafficTypeDiagnostic: SN6PR03MB3789:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <SN6PR03MB37895CF25908E688CAD916FD8FE79@SN6PR03MB3789.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3KfN0YfIG5FlCHRt/FgspmWxJmVtTIPQvOLtNYG9durvz7B6EGqmg9gXdhEYQ+sqE9+VSJ9sUAROAKTa09S4JJVZVLtF68J5uQRUXrN5Kq1TcIN/WKxMVH8Jksk3gMipvwD8HaqlQv+eLrQXrpwPjKDguetKq2PMqX2QISEuDC+AB5C190JOd9G7HGSHGT2PH29lNH3aMOO89qawDoWJOGe4iHYvrMHRxWVs7bJQz2yKaoLiigUtmy8XJe6cSgPNBi5e4XU6CarJiTLcsrqxnMQcHIJs44F6UoYV4hclvglYndZ2GzQ08V9pSlon422a/3u7fptcCpcxDJzmzO0R86XoZ0oF8BtNDaadoDmyKrlnQ0BBY7SlAKJhI0A3peL/wb9UACMjbSHuCp+IZ4ziUj8zg8sFdwc/F7gq6nZULY5YamP3Pn4Bm5g6g6vCdcl6UjRhjfl3AnmxG8f2lKnm16X4HYFbNFRmNkwFx3vcHlnz1uWKu0kzgRYP3klRQUlPdWJvch+yMubqn5w2Rj4ClxwqBEZn6jpzl/pLqs0eMWaYFzGi4qeME/9HhDdm+kUTrnR3CED+KOgFzAGUI15+1Jq2jP83KMX++xeliMlMLgtuzoneO+bl9QRA6X0xsHPTLr82j/cdK3vBe0V5WRjPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(6666004)(82960400001)(5660300002)(6512007)(8936002)(186003)(85182001)(38100700002)(26005)(6506007)(6916009)(9686003)(6486002)(54906003)(316002)(83380400001)(86362001)(4326008)(66476007)(508600001)(33716001)(66556008)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzEzZjJ1Q0NzNklGOXR0STZ0YzNpdXJHeUFWV1JjTEZ4TzQ1WmJjajAvcVVE?=
 =?utf-8?B?MGZtQkM5eHlsdEFEZ3F5V0RJUVBhRzdkN2lsc2E5VXVEdVlDTlI3Qk9FdndV?=
 =?utf-8?B?WkNZcFg5RTFDQmh4TEo1aTF6RDB4dVlmLzhValpBYjQwSWprNjRyQm1EYVUr?=
 =?utf-8?B?TlNGTXM3cG1mOVFhNXJKdENCdzBRUFB5YVowNWtWSkZkdnJQMzl6SUEwYmh1?=
 =?utf-8?B?enZ1SHhaQ2Jzcm5LT2FLRjBXRW91TnptODNpRVg5d3Rxa1ppZ2Q1UUdLS01G?=
 =?utf-8?B?SkRuTlRsWXpRYzlYQmU4TDNaVzJ4bVloVXRXSWVUdUdoSytxamFMVzhHOUxk?=
 =?utf-8?B?SHhiTWVHTGJSNkR2aWVXUk9odG9YbVNvMGZKbHN4SnZpU3M3SlVyTGQwUHc0?=
 =?utf-8?B?YkY3RGx1V1ZjSlNLaEVYcjhsWEZqVjBoOVZEWjI2bjBzV0psRVdWNWFZcmwy?=
 =?utf-8?B?Q0ZNVTZsWHRpTTI3azV6SjBJUjFPRWRPSS90RW1sZjZ6TWNEL3pERGVBN0FJ?=
 =?utf-8?B?ZU1nMUp2SlFtc1QrYk83Skl0bTVtdWRsQkJmVUVCRWlSM2NyNXdJVGhqRkVl?=
 =?utf-8?B?Q2NtK1JQMzBQTysvaHRnbktBNmtHdEFxeVdnVlJXYXlWMGJjNHM0SzMwWHov?=
 =?utf-8?B?RHVVS3pXVFlZMk5sWVdsOFlDQ0Q4UXp0a0s0OEgrRnBLSUl1QVphRkVPcU1k?=
 =?utf-8?B?dTZkdmFOQmlRckpsQ2FhQ25leVAzQmN5b1Fua2xHSWs0Wkd6SFNhV21zelNL?=
 =?utf-8?B?QkJ1dHNhWFBHWjlqeU5EMGRVc2VwVjIxbjI2bE9ta3VueHNKYTlxT0ptVG04?=
 =?utf-8?B?Sm83TllZQy9CakE3ci9aanpWQ2kvelBoS0lFSkV2Wm96Qm8zTTFQSGFQR3o5?=
 =?utf-8?B?bHF2K1NISUUzTHE1amtnaVNtVHY4c2ZPQzBRRndCM3Y1TTA2WTB1L3MzaDJu?=
 =?utf-8?B?VkZLai9jSGNXYk16bWx6RVNXOGlLWlZjMU56dFJwRDZGWFRmdkdPcnN0YzMz?=
 =?utf-8?B?NWVIQk05NGVmTEEyU1FZNUN3T09NQktCRlJtVWkrenF1VUZNbnVnYktCcWV2?=
 =?utf-8?B?TkUrZFF6L0lzdjI3NUhlZGhyTjZzWVNzZDFubVM5TklIMm5mWEJRd1VwRlhm?=
 =?utf-8?B?aGFUS3MwcmU5MWlRTHQ0NUVacm1UdEMvRXYwVFlCRkJtTjNmcFNwemJmWFRx?=
 =?utf-8?B?MndTMThJZ1J4QzFuWG5paFFvNlFNaVBCNXFsQTIyRHVWRDUxQ2lhK2lGK2F5?=
 =?utf-8?B?RFE0SVdlVmFQVlBHTnVURnJDSmJ0NTcvZnRzUWY1bW5FNkxvNDl5NzJjRlFi?=
 =?utf-8?B?WnFOL1RRTUoyK2pESHNFMnZyYnpBeFF2eU1PYlhJTHhKYnBZTCtHc1hsUlV6?=
 =?utf-8?B?NkVTMUhVbGE0K1hFcGlWQm1YN2xZR0JYL3BQcjRYeHZlMnNUQkZJRXgxdHVp?=
 =?utf-8?B?QnhwL0JVVUl1SENtd0g3bmRhVE5zb2ludHpZdXpnT1lFVUZONStmRFFxdG4v?=
 =?utf-8?B?WHdBd3VjNDNDV292OC8yTjRTZHBJK1pGeldNU09PVVNzVDMyZ1BEa3g2RFI1?=
 =?utf-8?B?c2MrVUVkT2ZEeTE0cjcyOHcrVXdhU0thNDFMOUpUaDVpN1hIMmxSTU1IVW9j?=
 =?utf-8?B?Wlp2R2JCVGVDa2hWVTFsUlNzY04wVjJaYUV4dzZWOW9PaVhOTmNUWjh1bGpl?=
 =?utf-8?B?aWdhZFN0K0NpM1hzSzI4Z3MwOVgzNFRMeDJZNWp0TXlHbzF3WGlmVEhJeVlO?=
 =?utf-8?B?V2xKckRHaUZsVXRxcGJ2RGI0NmlqZVhHMWNBVk84bDBjRHp3TU96Q1Frd3Vy?=
 =?utf-8?B?U2dDYU1sTXRic25xdmJxdjlBOVB1L2I4bWhJMS9nZVVrUWcxYTQ5S1dIWXl2?=
 =?utf-8?B?d0szNHZvekw4Z0Njc0g0Uko0VW93VkRlY2l1b3lkWVdsQTNLMEhwN1hDTGFQ?=
 =?utf-8?B?azdpS0xETG5NWnhURXEzM0lvdWNkU0hZVWl5QS9aZUFGb3BMVDdsaUJEamNa?=
 =?utf-8?B?aVRCSHVUa2FxeUF3K3dQV2p5U3lRcjVIeHVnTG5aZEs3aVZDU3ptWklTQ3hG?=
 =?utf-8?B?elU1MzBXWlZQSS9sZG5ZSVBNT2U3b3ZheXJUekIvNGlwNGhHY1FMSVRtSFdu?=
 =?utf-8?B?K1VmcFgvS3ovZ2NqOW5DRzUwRm94bVN1MU5KL05mRFBQSk5Qc1lDNDB2Z0pE?=
 =?utf-8?B?MFVLWWtmK0JsbWRzNlUyVnJKclR0K1JMRElKRzNjZDN2R3NaMzlJTzdhM2h2?=
 =?utf-8?B?WEY4am15K2MzMzFuOXkzY3VIQ2x6S25vd2VqVXVhcUdQNy81STdOY2pYWExs?=
 =?utf-8?B?dS85NmNORVFvelU0aDN6YWVUSjlrMko1YVRmU3RIYkk4RVRheGR2SDZ2d28r?=
 =?utf-8?Q?NROGi4BdKVApr7Qg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a2cbbd-7fd6-48fd-a03d-08da17d283b1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 13:36:54.7467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zf6vV3nZV0zuHitN5tg4dPaCv9/415Ojfz17PZUwY3HLmRSz3zetwwrrcrQPOX+gOJVfMBY8pSm94r/S54MMew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3789
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 02:24:32PM +0200, Jan Beulich wrote:
> First there's a printk() which actually wrongly uses pdev in the first
> place: We want to log the coordinates of the (perhaps fake) device
> acted upon, which may not be pdev.
> 
> Then it was quite pointless for eb19326a328d ("VT-d: prepare for per-
> device quarantine page tables (part I)") to add a domid_t parameter to
> domain_context_unmap_one(): It's only used to pass back here via
> me_wifi_quirk() -> map_me_phantom_function(). Drop the parameter again.
> 
> Finally there's the invocation of domain_context_mapping_one(), which
> needs to be passed the correct domain ID. Avoid taking that path when
> pdev is NULL and the quarantine state is what would need restoring to.
> This means we can't security-support PCI devices with RMRRs (if such
> exist in practice) any longer.
> 
> Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
> Fixes: 14dd241aad8a ("IOMMU/x86: use per-device page tables for quarantining")
> Coverity ID: 1503784
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -750,6 +750,10 @@ However, this feature can still confer s
>  when used to remove drivers and backends from domain 0
>  (i.e., Driver Domains).
>  
> +On VT-d (Intel hardware) passing through plain PCI (or PCI-X) devices
> +when they have associated Reserved Memory Regions (RMRRs)
> +is not security supported, if such a combination exists in the first place.

Hm, I think this could be confusing from a user PoV.  It's my
understanding you want to differentiate between DEV_TYPE_PCIe_ENDPOINT
and DEV_TYPE_PCI device types, so maybe we could use:

"On VT-d (Intel hardware) passing through non PCI Express devices with
associated Reserved Memory Regions (RMRRs) is not supported."

AFAICT domain_context_mapping will already prevent this from happening
by returning -EOPNOTSUPP (see the DEV_TYPE_PCI case handling).

>  ### x86/Multiple IOREQ servers
>  
>  An IOREQ server provides emulated devices to HVM and PVH guests.
> --- a/xen/drivers/passthrough/vtd/extern.h
> +++ b/xen/drivers/passthrough/vtd/extern.h
> @@ -85,7 +85,7 @@ int domain_context_mapping_one(struct do
>                                 const struct pci_dev *pdev, domid_t domid,
>                                 paddr_t pgd_maddr, unsigned int mode);
>  int domain_context_unmap_one(struct domain *domain, struct vtd_iommu *iommu,
> -                             uint8_t bus, uint8_t devfn, domid_t domid);
> +                             uint8_t bus, uint8_t devfn);
>  int cf_check intel_iommu_get_reserved_device_memory(
>      iommu_grdm_t *func, void *ctxt);
>  
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1533,7 +1533,7 @@ int domain_context_mapping_one(
>                  check_cleanup_domid_map(domain, pdev, iommu);
>              printk(XENLOG_ERR
>                     "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
> -                   &PCI_SBDF3(pdev->seg, pdev->bus, devfn),
> +                   &PCI_SBDF3(seg, bus, devfn),
>                     (uint64_t)(res >> 64), (uint64_t)res,
>                     (uint64_t)(old >> 64), (uint64_t)old);
>              rc = -EILSEQ;
> @@ -1601,9 +1601,13 @@ int domain_context_mapping_one(
>  
>      if ( rc )
>      {
> -        if ( !prev_dom )
> -            ret = domain_context_unmap_one(domain, iommu, bus, devfn,
> -                                           DEVICE_DOMID(domain, pdev));
> +        if ( !prev_dom ||
> +             /*
> +              * Unmapping here means PCI devices with RMRRs (if such exist)
> +              * will cause problems if such a region was actually accessed.
> +              */
> +             (prev_dom == dom_io && !pdev) )

Maybe I'm reading this wrong, but plain PCI devices with RMRRs are
only allowed to be assigned to the hardware domain, and won't be able
to be reassigned afterwards.  It would be fine to unmap
unconditionally if !prev_dom or !pdev?  As calls with !pdev only
happening for phantom functions or bridge devices.

Thanks, Roger.

