Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A0A77265D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 15:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578454.905963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0YS-0002un-Gb; Mon, 07 Aug 2023 13:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578454.905963; Mon, 07 Aug 2023 13:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0YS-0002rg-DJ; Mon, 07 Aug 2023 13:45:52 +0000
Received: by outflank-mailman (input) for mailman id 578454;
 Mon, 07 Aug 2023 13:45:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ru+M=DY=citrix.com=prvs=57627f799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qT0YQ-0002ra-D4
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 13:45:50 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5f89aed-3528-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 15:45:47 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Aug 2023 09:45:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5026.namprd03.prod.outlook.com (2603:10b6:408:d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Mon, 7 Aug
 2023 13:45:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 13:45:38 +0000
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
X-Inumbo-ID: b5f89aed-3528-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691415947;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=03YFklj6Mi3U22d1eUiP+as3AS0eNIXY1D4H+ZisMsA=;
  b=W4FC5EhXdbsD+uRfhTVJjWtrtypnRYxMGRvvG6Mk1azjyntT+aX4V+8Z
   mSfO5s+xFFkIGt8DZKO3E8fNNjtlvazmsALIR8OKuO3+aUT9cDJqd3kLH
   EAIxMKXWquYHQBsTnxMiB+re60LH1b31KVmWb5T+UAQWaooFU1ae/jfJK
   g=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 118604915
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:A/Km7KkpBdI+jOuObNGbxJTo5gy5J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXUWCEafjeZmujKNskPYy/oBgF6MWEz99qHgFt+yE1RiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgb5ACGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eYgAxk9SxGjvdmz34yXZLl3qs99KPC+aevzulk4pd3YJdAPZMmbBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3ieCxWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTe3mrqI72QD7Kmo7MjRNb163+/mA03GXX8BuK
 0UUxAc3ov1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceZTEsz
 E7PoNrvChRmqrjTQnWYnp+EoDX3NSULIGsqYS4fURBD89TluJs0jB/EUpBkCqHdszHuMTT5w
 jTPoC1ggbwW1JYPz//ipQyBhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHbQKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:Le1WkKkTMJH+4bbbWUwOGSX/d6zpDfMxiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msjKKdkrNhWotKOzOWxVdATbsSl7cKpgeNJ8SQzJ8/6U
 4NSdkaNDS0NykAsS+Y2njHLz9D+rm6GcmT7I+xrkuFDzsaE52Ihz0JdTpzeXcGIDWua6BJcq
 Z0qvA3xQZJLh8sH7iG7zQ+LqD+T5qhruOVXTc2QzocrCWehzKh77D3VzCewxclSjtKhZsy7G
 TflAT9x6O799W20AXV2WP/54lf3IKJ8KoOOOW8zuwubhn8gAehY4psH5WEoTAOuemqrHo6jd
 XWpB8kHsJrr1fcZHu8rxfB0xTplBwu93jh41mFhmaLm721eBsKT+56wa5JeBrQ7EQt+Pl6za
 Jwxmqc875aFwnJkijR78XBE0gCrDv/nVMS1cooy1BPW4oXb7Fc6aQZ4UNuCZ8FWAb38pouHu
 VCBNzVoNxWbVSZRXbEuXQH+q3mYl0DWjO9BmQSsM2c1DZb2Fh/0ksj3cQa2kwN8ZosIqM0kN
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnPLtvAQOMl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeWTwZxw9AzXSmnVZ0Wt9ihn3ek6hlTAfsuvDcXaI2pe1/dI4s9vTPEzYs
 zDe66/WJTYXCzT8YUg5XyLZ3AdEwhZbCQvgKdJZ7u/mLO7FmTUjJ2qTB/yHsuaLd92YBK3Pl
 IzGB7OGe5n0meHHlfFvTm5YQKZRqW4x+M+LJTn
X-Talos-CUID: 9a23:obPbMG6EjqztXi5r2Nss7nY/M/AAc13n93LPHWOWWX1FQ+ORcArF
X-Talos-MUID: =?us-ascii?q?9a23=3AYaPbpQyTxJr7QEzcpw25DmtkmFaaqJ6HU3oInc8?=
 =?us-ascii?q?GgpC7HChiCjeUjAqaW4Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,262,1684814400"; 
   d="scan'208";a="118604915"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0c2DjAj5CZt13GgTyS2VXcDvnHWQlsAdQol4i11qOhucJrbQkKVfpbva7Uz1ImQUE2MNoJRcMZdzvmCNMY0lbK+u4DVBRbGdKmTEoH4O0ynSP/WN93jHeEvBtighlA0kozdlQA2rXZkO9/NyUJij+DXelAdy80Fd7N4RJfl880kaF6HD1J4mr0IAbVF07LNTQvnoaya4b1aovCGHLONoGCvPzB3f/OhV9I2sylp8G5fD58Z+NommTXH78hYF+47dIZQep4mqRlWO14WJ8MscXRf+RUv4sEUC/oOjQXzKk5AigBBpM8l+UF0ULHeDo2fBud2p6XHzSdXjSshLNQHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXXnkgZttQSW3pq00KkdBdU/MEjO96Uage0DISgZQOs=;
 b=YLBKioT09kwWSGozCYT9wom5MR9wECHsvuZuO50XN16qwkYdTRuY+5kxKhw9UlaBEOa9/YP1XHn0qDS17m1bBNl5yqQQNChkPCpxCK/bziVGlvt6XFodGW/WUSf1ZvAtM1+tMd2wRMmXVDPf/meUJCIbzkeE8YDgnYEtbCKAyHtGe5sDogEPMomkanLx/axCsLuQX4VzeW/kT/RLwotOQ+PxKVHn0pqcjLKs8b0KeSZHPOeZh/atEXZnqyEkAVlZMb9f4gRtvn/CW/IK+SMiTvVDwdGm7WYRo/FYKCRjl0ooqy1LE8Zoy0MzU+cM1MEIN7PjjW49MwRDAO9o3cIUZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXXnkgZttQSW3pq00KkdBdU/MEjO96Uage0DISgZQOs=;
 b=P/Di6KoijY5Qn3WsqdSk7aHxGDJFA970+KmAQCDcAcSzzIphGGbq2KBYKG1UiLoaef0XugDikZ8skkVoX6NU7wWGbDJt6S5TawNc/ka54SIzarEuu09Kb+J/aGosWGSLFy+NS746zrGITSmS1ma3ZODlOxIiFUD+Mlsks63oAB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3a0223c9-53b9-7cab-6ea3-dd5a6e02119d@citrix.com>
Date: Mon, 7 Aug 2023 14:45:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: Drop opt_pku entirely
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230620174704.3907275-1-andrew.cooper3@citrix.com>
 <3daf5b51-cf5f-b9c7-b02e-0db5b48aa03f@suse.com>
 <6a22f4d7-e0f6-67f5-ba44-af0a07523c4e@citrix.com>
 <04e7a7a4-8926-9e5b-c872-caba8d43d563@suse.com>
In-Reply-To: <04e7a7a4-8926-9e5b-c872-caba8d43d563@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB5026:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e7827a-7ffc-45a6-c959-08db974c9579
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bGG7kZy+xoPz99T7t6q2QTA7kgBCuTZuo6QkV3IfqDIc6eRSKK9JxFjt2gjoqcdxVD4O8ydZ1l45wBqQCjJ1fMY3pS6jnl1J7QnLvD5YFpauIadADaDYMPWmpn3AdPJXeBqpfZKKnPqP5c+R152jfpQvyDleS7Jl1kWiKLOOc5mMvROM/GufmKGNEDqzOs+MIv+4W/F9KZT3jLesuhOfItj2Ll1/utJnMVk/ZpnT8+EJbXoDK99K0/GeM9A0kuHghGhjG1MjqNvdKmXGzS0zo71zv4vC/dFGSyO0yfJd1ECrYmp/eXI4eZ4x6rRkYrxoS5eRai7mgWkDNESTz/1OY2IHckxcNJA8xbw0uge+pBKa/sIto0psvw1kSVWB4dldWM1GuVKLLRyQMYDl+Bsa5gJ6FxNp+i9c0fWdDZbkDSgBTO2VM/iAY0ANzWkbaACZPfkFtpNgxEhEdiFJNayz1h9Kl/KwVwKaEQ+dRj729OW5i7TPm/HhL7UbfImXrile0ddZDV0FCWJOxrYWwIhNSiSiaKXS8nrtLlQsVJbsMdy4rgGtRELqDU6+piMAqIhSIqbJvlO9H22g7ZjhlmeOh3q9MX8OOKrcbhttV+ZEYHOydxTQ3kszpYTbt3hOZo+p3jmyRx/Vsi8PuRsbh066/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(186006)(1800799003)(451199021)(41300700001)(26005)(2906002)(5660300002)(31686004)(83380400001)(8936002)(8676002)(2616005)(478600001)(6916009)(86362001)(316002)(82960400001)(31696002)(6506007)(53546011)(38100700002)(54906003)(6486002)(66476007)(66556008)(6666004)(66946007)(4326008)(6512007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHNhVnhDa1RUM1Bsa2xmRkRlUXhVL3Q4MUtwY2luWXhNVURRODF1Mit5aFZT?=
 =?utf-8?B?NHBqUUlva0ZBd3hhRTZzbmlUQ2FzYzI1U0FqQUcwZkZGS2FIdGxmYW5ZcDBx?=
 =?utf-8?B?QUJKblBUd055ZjhPZU00ZWZNMDE2ZGptMXpoMlRZY29ETU0rSHdBY0lZNFhT?=
 =?utf-8?B?bkdOblVFOUNlayt0NGJ5WDNpK0p1WTI5dy9qZTZzeDliajg1RkRCZWZsTmFj?=
 =?utf-8?B?QnErdXNmd0RXcTIyQUNhNU9mWlNsU3RURDFvbUw3QThZQTF3S1dUSWh3VjlO?=
 =?utf-8?B?UFNUbDIxQnN3cDB5bTExYW16OFo5K09KeDBqMCtWZ3Q3SWorWitOUTR1clJT?=
 =?utf-8?B?TnhpTFo4SGtmbEMyaHNDZ1JVUHNXUW5NSXJuWW1FcGNHSXB6ZCtvQ2ZhVURN?=
 =?utf-8?B?ck96a0hGRVRPbm1PcUhEbmd1ZGs0Y0dFMHhKSTFOSW9QdmpUOVpnME5oNHFr?=
 =?utf-8?B?VUtGZWR2dFJ5TjlxMjM3T0FJSlJCRUpJL2NJVWtGTllHT1BoNFNaTzd0c3gx?=
 =?utf-8?B?bHJwcDUrMkMwSmpwVTJDb25BZWtqTTNEYVJxNkplWUhiYm9SOHMxc1hkRFVX?=
 =?utf-8?B?RkVxbVNzVmZUNTlYWTVOMGNSalhybnFRT1VoNVUycmh6RGhkem1ZNnVETUNF?=
 =?utf-8?B?UlhtQnJZMktyZy94ZURUQTY1S21Jem41SjFEbFlidE0wL0phWWZsWWtNZmJr?=
 =?utf-8?B?blNmK1JCcUhiejVoMFppZDJnTlZ4QUNxaU1ublZWSG9MUWR0VG1IV1k3U0Ny?=
 =?utf-8?B?MXdyZHpZMThVbFROVmF5emdqckU0dzhOQzFRbVc1amVUTHFhaEVZeE9yWS8r?=
 =?utf-8?B?a3RKb1FwVWJRelpsdkV4ZEJ4VHhTR1Q0a0JJVkluUjd0a0RReS9Sc212KzFF?=
 =?utf-8?B?SEJTdldhOGFqb1F3WHR6dHk4VXF3ZGdHbmRXNzMyNWVlN3JqZmJDSXNLM3Nh?=
 =?utf-8?B?bUo1RFlGemY4aFcrNXJWaTFFamR4anQrTmViTE9xMDZaZG1qWjNiME5oQm81?=
 =?utf-8?B?QjFwYUwyVTBlcEwzYUJnOTZGNUFVMUZkNDdNa244VHpuWlRUNlpCdm0zRmRa?=
 =?utf-8?B?QUtaTWV4ZXRUVXZFK0Z2b1lteitrb2w3SC9zdzV2K3ZqKy9NdDR2R1F2RFlB?=
 =?utf-8?B?Tmt1WkM2Z0RPZk8ydUpEUTlkY3VCR1N0TXBDem9FWE1HQUVZMTZicnJlRTVi?=
 =?utf-8?B?TDNZYVhHamx2RmJRNDZxOTdiMjRwaDJRdmZuTlB3QjN0VUZ6VWNicTBtYmxP?=
 =?utf-8?B?RnpmeEp6TFZMeWVoYUJjNVhXOWJ3ZlhBcG1vWjVKR2xieG8rRFV1Y3FwU1NP?=
 =?utf-8?B?R3orcXBNYWlocVUwWEZ0dndkRytXSHVHSzB2dHgzNWlwWU82am9NQm9JMEN0?=
 =?utf-8?B?VUpFV2RrRTdwYWNsaytrL2VmejVqcVNMK25iMEUxSjJkejhmeU5uOWxGZXJP?=
 =?utf-8?B?YnVvY0FDMGpNMmxKWEpaWkJaVkZLY1kxYmlWbGIrTnk4TmZLMDhCSTlLd3Jt?=
 =?utf-8?B?YzkzSzBBZ1pOd1JJSGJmSkZBUEpweEFnMEFpMWVOMWlDbVM2Ym1McktBdS9h?=
 =?utf-8?B?M1ZJWWdsYkQyT2FBWlIrSkprYjdVZ1RZNEF6NkwrN3dMb3hzK2x3bWJ1UDk1?=
 =?utf-8?B?U2dvbllBU1FYV0JZRlp6NVErNmZIdlVyYmVnaWtDOW1FZmJiTGwxS2h1aFpz?=
 =?utf-8?B?aXNna0VjbGFvVHZ1VnJEditkbjBiUlhkMnR5QWN1bXhZUHlJbTYxd2ZMYjBz?=
 =?utf-8?B?U2N1ZUFiUVRnOGhZK0lLM1I5amlrNEY0QTJ3RXVzbGp0NmlrdDRTNXJ4L3Iv?=
 =?utf-8?B?N2srMnhVNmpvd2JqQUNyN3JUdHJmcjRXNk8yT2x1V3Y5YXo3VXpRV3pGa1M5?=
 =?utf-8?B?b09XYmxMNWNaUU0xY1hUUGVSVjBPMndaMVpjRVovV3crTU1IK2pCclpyK2pw?=
 =?utf-8?B?V09pVEV1c2plK1FDamc5bFhGWUozeHdsU1BmS0l5b0JPK09PUmxMTXh2V1F6?=
 =?utf-8?B?TVBQWG5IWTNsRHVQajJFcUJwcktkSllaU3BvQVh4d3VBc3FIcERBKzFCTGJ2?=
 =?utf-8?B?RXJOMlZtTTYybGNZOHBRRlFzSGFuaWlKK0RTWDdHR3VnUkN4NEgzbHd0Y1Rp?=
 =?utf-8?B?bWxldFFaQ2V6STN6NDZnOVdmZmJ1V0F1YnFlcGZ0YUxIWW5oWGNGYk16NUgz?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MeN07R+p4pAQSFteqz6XQRBlpgRwF+7OMzla/doWZBwf1rmBwCa0Dwalnj3USIQsbrTCUfLQLa/9jHjXi/TH3IMoNSi5NoibVmqJ6cCxDtOT9UYyKwQg+m81LU/TnzaMaBVUUi+Tdg2SqGh6FXPTZjdQWlDo1O54OKXJEuurhXfkai/a/YNEqC69RH514Xt8BCDMz/Cixsss3DkV/m3mCso0TB6oYZINuzTv+06MtjtGwfWscNrUx//3O9vYm+uztYVvsPmgEJZm4wm8QeHE3C8ZjaCXlTM2oQFqhML/G4vW9mhd/Sd+7Aa/86KeeHkMDCj05ywzTPS+nbBqHG25ox4hKYrk/Tob3omRZv4xAnsmcX+dcFs271J45LJDrtzrum23aDobXkMlrHUdWDHyocALSofNwuSukggbDodfRUpj5/MluI37WbP3f6CH7+dt9jQJCDqzeVNprqBnk74iHGLyeusOCIj4gedjnYCrZoA+7cA4CffGkFPMcpePLmhxllMXHBvUxC0jB0nlcd8T2ocyp5tEfjmKglxJmElUmjFFt032gPYCGbsWB9PVl6jd/MTWNn+SpXoW3K/7fj8c0nS1rX4nJYo0tk02B++SHs8CGdSpUq37wP4FEiAzXDdQyXtc0Mqr0mBFB+OYkuJKVL6qA2uetWZ7QY6ROsFYcCTh853oCiu9sq6ZcjaR8Vyrpoe9gU6QCujLzh+70+c3e0gSlgPe29Xrng4Ls8SCz3MKRLAuUsdOmrRCce8Z+Bfdr2vMhgUct1uOHbPBlsngczWNSrWnHtTJox0wzWhmQoxeDRYz3KJYht8f2dJlttuiFTLDJQUZ1yb7pLc8WGgWAQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e7827a-7ffc-45a6-c959-08db974c9579
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 13:45:38.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PseCvN4vYcEIlHyJiwTT4CW/b0/wH3NQZyailoCbow5cpiN3LcdcNc+spGNbF1MzV2hjnCtKXkyXr786/oO9NNEngXuR/Qp+SIDFONzkKNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5026

On 07/08/2023 2:34 pm, Jan Beulich wrote:
> On 07.08.2023 15:21, Andrew Cooper wrote:
>> On 21/06/2023 8:37 am, Jan Beulich wrote:
>>> On 20.06.2023 19:47, Andrew Cooper wrote:
>>>> --- a/docs/misc/xen-command-line.pandoc
>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>> @@ -1950,16 +1950,6 @@ for all of them (`true`), only for those subject to XPTI (`xpti`) or for
>>>>  those not subject to XPTI (`no-xpti`). The feature is used only in case
>>>>  INVPCID is supported and not disabled via `invpcid=false`.
>>>>  
>>>> -### pku (x86)
>>>> -> `= <boolean>`
>>>> -
>>>> -> Default: `true`
>>>> -
>>>> -Flag to enable Memory Protection Keys.
>>>> -
>>>> -The protection-key feature provides an additional mechanism by which IA-32e
>>>> -paging controls access to usermode addresses.
>>>> -
>>>>  ### ple_gap
>>>>  > `= <integer>`
>>> Elsewhere you said that we kind of imply that only the explicitly named
>>> sub-options of cpuid= are supported. If that's the case (which could do
>>> with saying more explicitly), you will want to add "pku" there in order
>>> to not regress what is (deemed) supported.
>> I disagree.  I can say it was equivalent to X without X being an
>> explicitly supported option.
>>
>> PKU shouldn't be adjusted by either of these options; it should be
>> controlled in the VM config file (if at all).  I'm unwilling to make any
>> suggestion that this is supported.
> Hmm, so you're suggesting "pku=" use was unsupported, too? If so, perhaps
> worth adding the word "unsupported" to the CHANGELOG.md entry.

Well - it's just hiding a feature so nothing (interesting) is going to
break.  But it also isn't an option that anyone ought to have been using.

>  At which
> point I'm fine with no adjustment to cpuid= doc. And then also
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.  I'll tweak.

~Andrew

