Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4603D6D9616
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 13:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518869.805831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkNzZ-0006lW-GQ; Thu, 06 Apr 2023 11:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518869.805831; Thu, 06 Apr 2023 11:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkNzZ-0006ir-Cm; Thu, 06 Apr 2023 11:41:25 +0000
Received: by outflank-mailman (input) for mailman id 518869;
 Thu, 06 Apr 2023 11:41:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RM5I=75=citrix.com=prvs=453d769fd=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pkNzY-0006ik-Aw
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 11:41:24 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2df4311-d46f-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 13:41:21 +0200 (CEST)
Received: from mail-dm3nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 07:41:18 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6949.namprd03.prod.outlook.com (2603:10b6:a03:43f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 11:41:17 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Thu, 6 Apr 2023
 11:41:16 +0000
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
X-Inumbo-ID: f2df4311-d46f-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680781281;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=FSOJcFuyJLoPTZUkurwEgHtgOIn3wm4+zs0pUUG072c=;
  b=UdNLsgv7Zw0ebBotoJrJ/IXeVIfpuYHfruLA44e80NzD3zj1rlsi1IHT
   JIHAlaZVqbJrocWwtMycLCoc/bpuNfJiFtbBWJz2eQxGc28S6htlnc+MR
   Vv5qtikT5zc54E6klymWJYousWiOKnONZ3xYLtdmaRM92HG+Nm/cx/B2I
   0=;
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 104580366
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IcbTPaKBkrdRN7kPFE+Rz5QlxSXFcZb7ZxGr2PjKsXjdYENS0zQPx
 msZWWyObKuNYWCnftt1bo7g9UpVup/cnNZqTVNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA4gRgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5eI35D7
 aVFEgkcTUGao8Lm+o2pY/dj05FLwMnDZOvzu1lG5BSBV7MKZMuGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTSPpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyrw27+Xxn2lMG4UPO2a/MM03wCZ+n0SVyELaUqYjcWlmmfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAHSThbYdBgq84yRhQtz
 FaCm96vDjtq2IB5UlqY/7aQ6D+3Yi4cKDdYYTdeFVdZpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:Wb7A56M3QeUjxcBcTsajsMiBIKoaSvp037BN7TEWdfU1SL3+qy
 nKpp8mPHDP+VMssR0b6LO90de7Lk80hKQU3WB5B97LMDUO01HYSL2Kg7GSoQEJ00XFmNK0nc
 9bGZSXQrXLYGSTba7BgTWFLw==
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="104580366"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNotY7T17C5arjjADDIK3ynwFtruXaQ7q4h/OD3p/0r6yDIqG3JJD/g+e1g/KpQYZTMg2Bsybd2W7di75xTIQNd+IW5Plqe7GM2bBD/iXdr48jAKEVKYCXdAl2rOZhqRhYzo29tlvveVmCD6lAKC9nmOoNj0QK66/w661yeFnCFgFUYoD42bYiAjUrNhZYrQPHZieXrcgQV8Aqfe8N0y1q8fgxg7fEd/ncVigSZhu2a5pAiu6TqwPa9cAIJxqGKAfDRdq/UzoSIc52ctdq6jyTpU6FKQageiwCGLCnnnuWd28gzddwXw9852B6p+aELBFhdriuv2ve7eXVzKsXdVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waqCQJYQpwRKwKZIL9b/VKrKkOu4lwBg+iCU1akNzjg=;
 b=oYzQEFjLYksgKWJd+UorPFNdZg7T0OHHgi5aa3/qeED2A5HPLcVlO5tBDN8gspmWigJ3cm2XwteQgAF0/VwfMrnJ/VQYHO1wi98Q7sUXI81hsB/IGSENv0RioWPCf7wHZUhbCVx9uHR3QBgOP5CdfChsSHqo4T+LgvQz9dBxOCwtu2NEV+/NT5iCS5dWh3AwwChVapk+XLDArRuEk3z1v/f+26g7OZFSxEaplVZLPRfV2iy+/jx0SkzXoqk7NxRkcT+TpvF2I/zgmkkwOL5mxGukTbwZ/tAcikKoqkT4tDntWGRaUs7Dwp+pk/WOY9nwHjpWlpHQjx0eLj4SabaSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waqCQJYQpwRKwKZIL9b/VKrKkOu4lwBg+iCU1akNzjg=;
 b=qBH5Jmh0SW1RvRPcbcu9JbI5+BSlpja7zNTjGKDBtuHnkUp9fEEuQrj3UzAR3u8nD0CEBkfss0QtrapPOibsGO1dS8jll+ZZVpUuZi5ZTUD+5OaqaagO/ZDPWhFXy6QCspTsWvXfNU3K2Mh0qfJswIJWrsaKBwuW/O+9ljpJP5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2] livepatch-tools: remove usage of error.h
Date: Thu,  6 Apr 2023 13:41:06 +0200
Message-Id: <20230406114106.54735-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR08CA0001.namprd08.prod.outlook.com
 (2603:10b6:408:142::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: bd345b09-697c-4b94-987a-08db3693d501
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fz3dFpKXPppw55wCrR5kbp+aaFfUkUlR0L3yuLzzZVLlmfFu3LvHC44bomHaOgo7+2KpaH5wfSCIszAx0b7HgdkHnJbDYrv2yblU4aeDk+Y20K7VG6PHnioCtm73KvuFhUvUXCA4QOzHzZbkHRq8vgV1qbn2sU5+wBohPd2WUzUAezw9JoUpMVuG4n7+aiQ95N1PEVvyxJBsjnfug5i0hXEkN0Tvb+gOXLZAmAVx6BwmvpVvN/kcCU8ynsE5W958zcwehphvqmk5jnd64FI0O89FmsUhV3FuF6Jyw6nveXDJ8lFKdJfLsM/2ivWF9dRckCnnCNVMnk7z0igvHgZqKGRTqk2g6xwhXj33K45vIb0Atz21qaAXClyLTDSoqtDYv9gZ9xybsFX3MvxyGy7/iVN6Am5Q8EW3WPNHmIuBwxeMZ7daF4w7tmOGlbJEOHji/4gkugPx7kvhF2wj6JoSZcuqVf+4FWT/X5eMyZ4O4Gg95EykBo0/CdigzQUSfGeEoFMRYbs+ErUHCNkB664PcYwDXN2YHdXP9dlIN4k0hDC3TQdt2gjpXR6i1ZQVRaGi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199021)(26005)(186003)(107886003)(6666004)(54906003)(86362001)(8936002)(8676002)(5660300002)(2906002)(41300700001)(6916009)(2616005)(316002)(1076003)(66556008)(4326008)(478600001)(82960400001)(66476007)(66946007)(6506007)(83380400001)(6512007)(38100700002)(36756003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTllRXd2NXFyQy8xYi9pcXRhYmpja3ZOSHlBSTZOcG5YZG1rNVhjNVZZWDJ6?=
 =?utf-8?B?UENlVzFNNlh5UGlTUWtCYzR4YVBBT2U1eGkvQWhFZjF3VzljWndCWjM1ZEFT?=
 =?utf-8?B?MlQyVlMycVRSNHZFSkl5aWJYL3JEMGk0RFpJMVIvQmhBclFHUStVQmtQOElZ?=
 =?utf-8?B?WjJ0RlZiRVU3VERKeVczaDM1MGRDWFc3emtpNng2M0hENkNMUXAwMk9xTXE5?=
 =?utf-8?B?VlI5L0xLVzBMRkYwSXB5WnRmQmVOUVA1QUFzRXljQmlsQzJXQnNaVE5aTHNk?=
 =?utf-8?B?ZVVFWUNJcExFaTl0V0dMQjNCRlVLQUJ4ZlBEV0xDUjhFUi9rYlk5QVJjd1k5?=
 =?utf-8?B?MUdONVZBN1dlakdib1ZiTnBtNWtSeHdZSzNhOVg1Y2E4YVgrNjVGRUhwNDMr?=
 =?utf-8?B?Z3lITEp6ZHBLOUp5cjBFWVBQUmYrSXUxc3hxTUZITFJYRjhtMWsxNGh0S1hV?=
 =?utf-8?B?dXpkMW5LaGQ2a1l4T1pISnNZc0EvVitRaEZ5aGphVVBDM2F3R1N0enZ6UlFw?=
 =?utf-8?B?NjB3eXRzeHZyekZFZVk1K2p1WTZzK09nNGlyZTNEbmxYQ0tBWEhYcmNTckky?=
 =?utf-8?B?QWx1YkhtWnFiV3dwcmlmVVBtYlV0SS9VZDlaN1U0VkNWbXNnc1ZRV3UzaDMw?=
 =?utf-8?B?amlXbGtEalBuZHBQa2hoUGhNQWFPQVFScUg0M2syVXh4RTd4UW5uSVMyNlll?=
 =?utf-8?B?L3lUKzVtcGFPc0VjK0EvbFVhZVppN3VERlJTYVVDcGdNYjJlQ1NnZ01TOWln?=
 =?utf-8?B?STN2MXROL2N2VmlMdGxaVzFPZllSLzNWK0V1c2JpeUZHNzJIcERLR0RIZmJ0?=
 =?utf-8?B?VFVuUUZHVkNQMGlTTWVEdy9LdnpvTjJjVllTd29lUk9pZ2NrbTdZd1ZIU2R4?=
 =?utf-8?B?VDNqWVhLNXN2WGhzcGhYRG1CVUpGc2NYSUN3bW96ZHdoclhJc1hQSmptVU8w?=
 =?utf-8?B?eVY2V3hFdTZNaG8zVHM2WERsOWVHYjBCZGhHbFd5N0tzazFQNW9McmxwdklC?=
 =?utf-8?B?TUpZdmZhT1BSc2dNN0w3TjR6bDFHK2R1NUhnb2xyUGgzNFc0d09nVlVnc0VZ?=
 =?utf-8?B?U0ptUlNWUCsyNHR6MGxYbmpaY1JkNVFLZGtaTmZjeExwWVkxcDM1VE1ZUlZx?=
 =?utf-8?B?UFJoaE5DR010SE15VDhuUXBrd1ZTdldYQ3FJMXlQYzY2N21rMVMrQ2JXeUti?=
 =?utf-8?B?N21Idm0wS2g0QVp2NkdBQ2hNVTVRMlJMZ2xkT2NDYmJBV1VxM0MxQ0NuZWdB?=
 =?utf-8?B?RWlJSjVmVW5WNFdGWUh5L2sxdEdJTU1ZR2dBS3ZLbmQ3NUljL0FKcmVaWFJU?=
 =?utf-8?B?SXZRSjh3SkdCeUFWWFpqZjJGcVJmUTJnWkxUZU1EdERjQnhUNkdsbjdOS015?=
 =?utf-8?B?ejdmWndUUTRMNENBemNERVNsdnV2UG9DbE0wVmlsSm1yWFF3QllrZ3RFQTBu?=
 =?utf-8?B?NjlqSUtyVXhaSlVidDVvNXM2OXVDbndkTk5QR1o2UUxTVkVMY1NFU05IT3hV?=
 =?utf-8?B?NTNvQTUzOFZlblBUMjJRM0NnV2hXUjlacm8vY3FZZWZuUFhBYUx5VEl6WXpI?=
 =?utf-8?B?Lzc1RHBSMHB2RDhrODRHanZYYXdvMjdBd1ZyWVJLSHR3dDBib1BoM2s2YmF6?=
 =?utf-8?B?QVVsYWVUcy9DNDJpQ0piVkxBaTFLWDFUaTk3VjNrYmEwMDV1aHRESmFPVUYv?=
 =?utf-8?B?NGtzcjV2THF5U0NhMWc3a1BpVWptTmtHRVVyL3drUEI4anNFTDdkQ2pUOFRQ?=
 =?utf-8?B?cUlsdFNlcWV1OEkzem5QM0Y4QjQ3TjQzcXBQTEZxSFJCMytRS2RDQmNtakNB?=
 =?utf-8?B?eWwyM21yRXlXTlkrbnBPVldKNjVqdm9PcnQwMXVHYWZORGZKUmZNLzFwMHo0?=
 =?utf-8?B?U1A2REtGNmZrbU5DUHkrYnNzeFFoazRoODA2N2M1M2loeDF2bjFGUHJNME9J?=
 =?utf-8?B?UnV2N2RNN212Tk5uMjhpYitldExRN1RVSlpSY1F3bFh5UHk4d1lIeTBLYUcv?=
 =?utf-8?B?UmRqUTYwUDJTNmlkc1I1RlFQdnpYdkNmNlg5T0ZzYTRNMUxjZlpXZWUxaTE3?=
 =?utf-8?B?MzZHeU1BeXpRMFVrZytpdE9xMllFeEhaV29lWFg2dWdTSXBEWUEzNnpGYXhr?=
 =?utf-8?Q?Y8cmuN8z6DAoaD+U9cnkpKttI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Msqkiko7HtJFsnd6KhtuWpRvgqTSNZjtq+2fv/mfS+FAt2eSuH0nobm4x/tffLxgHxGSQ8ZDb1gh+SInPYnqkHh/MKNLjKV5lRimOTlDVmaYue34NNlMPsXt7UAs0vjjnePd1SjptMl717bQOEHXv21eId/YvAz9VDkLsrK1RrN+HTuCRMwxpgLdYEzOKIRwJqV7jsjAassuF4l1wCGfazylmysi8Cjfg/eMxyXUvg6yPja9Reo9YqYADULSxwX0swBlZQg0V9cvo3wBB96/2CSUKTTerCuS2Tg12FZc4kvbLK1k7TWNqfU0jtSDegaxN5srCBdTsBwuFPQCYEFf9KkL06qoIHU9clEYIkxzDLY4vOSBmu4gYMaW+999Moe7JNNLAX3qK6gDypYy48YDtLX+9cXy0UaOT+2KynHYR+XcvGOhUyebbdHKbyjQegVj56fNTaOHD4g3H9O6/zpUQgB97LqXrYI6I8l2WSQWXxFYeRtjjp8d3dy0sQJExx+6ML7lrSjKRLHKlPHcGnTzDNaa6dIekbwy2ZMzjhPTShw5n/Q2Sl1HkCGYxhGy2OLpIeKisTdpKjmAKeWUboMMiNoEMtFUGsycmeYlP6nTqBOuK7MYD5GymzXRi8GgMk4ntlM2J7ju1LGkUaTMTpfrSZJbam4exabSBckfNmdQcULQFFTKyKFfy1cu8Bu6dEYfCWmvByAi68yF1xKB0ghH+ZcXYUOc2hPxeABNnTvmpNpqpVHsr8daYdPaPFYDpqaEv6qRbu71yvV+v51WS+RSuP5zeXmkuSPZ76UAaKinsMbjbTCcy6rB4qbdK5EBvJi7
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd345b09-697c-4b94-987a-08db3693d501
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 11:41:16.8040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OHCIy5rjj/eTxstseBPzwbouXinUgoFwC9dxeabwWXUYcr2PFFObgQdxG4Z8VVSoD1N6nJsBcYBSb/KF+aeIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6949

It's a GNU libc specific header which prevents building on musl for
example.  Instead use errx() in ERROR() and DIFF_FATAL() macros.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
---
Changes since v1:
 - Use errx().
---
 common.h             | 9 ++++++---
 create-diff-object.c | 1 -
 lookup.c             | 7 +++++--
 prelink.c            | 1 -
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/common.h b/common.h
index 9a9da79..bbaa950 100644
--- a/common.h
+++ b/common.h
@@ -1,18 +1,21 @@
 #ifndef _COMMON_H_
 #define _COMMON_H_
 
-#include <error.h>
+#include <err.h>
 
 extern char *childobj;
 
 #define ERROR(format, ...) \
-	error(1, 0, "ERROR: %s: %s: %d: " format, childobj, __FUNCTION__, __LINE__, ##__VA_ARGS__)
+({ \
+	fflush(stdout); \
+	errx(1, "ERROR: %s: %s: %d: " format "\n", childobj, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
+})
 
 #define DIFF_FATAL(format, ...) \
 ({ \
 	fflush(stdout); \
 	fprintf(stderr, "ERROR: %s: " format "\n", childobj, ##__VA_ARGS__); \
-	error(2, 0, "unreconcilable difference"); \
+	errx(2, "unreconcilable difference"); \
 })
 
 #define log_debug(format, ...) log(DEBUG, format, ##__VA_ARGS__)
diff --git a/create-diff-object.c b/create-diff-object.c
index 780e6c8..d8a0032 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -45,7 +45,6 @@
 #include <string.h>
 #include <libgen.h>
 #include <argp.h>
-#include <error.h>
 #include <unistd.h>
 #include <time.h>
 #include <gelf.h>
diff --git a/lookup.c b/lookup.c
index 39125c6..9633ea2 100644
--- a/lookup.c
+++ b/lookup.c
@@ -28,14 +28,17 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <error.h>
+#include <err.h>
 #include <gelf.h>
 #include <unistd.h>
 
 #include "lookup.h"
 
 #define ERROR(format, ...) \
-	error(1, 0, "%s: %d: " format, __FUNCTION__, __LINE__, ##__VA_ARGS__)
+({ \
+	fflush(stdout); \
+	errx(1, "%s: %d: " format, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
+})
 
 struct symbol {
 	unsigned long value;
diff --git a/prelink.c b/prelink.c
index 2039e5b..18c5159 100644
--- a/prelink.c
+++ b/prelink.c
@@ -27,7 +27,6 @@
 #include <string.h>
 #include <libgen.h>
 #include <argp.h>
-#include <error.h>
 #include <unistd.h>
 #include <gelf.h>
 
-- 
2.40.0


