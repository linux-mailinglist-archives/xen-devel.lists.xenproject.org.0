Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A19177629C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 16:37:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581179.909761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTkIB-00005A-NT; Wed, 09 Aug 2023 14:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581179.909761; Wed, 09 Aug 2023 14:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTkIB-0008Uf-Ka; Wed, 09 Aug 2023 14:36:07 +0000
Received: by outflank-mailman (input) for mailman id 581179;
 Wed, 09 Aug 2023 14:36:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkWR=D2=citrix.com=prvs=578b5fa55=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qTkIA-0008UZ-If
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 14:36:06 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f3b12f5-36c2-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 16:36:01 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Aug 2023 10:35:58 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4919.namprd03.prod.outlook.com (2603:10b6:a03:1ef::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 14:35:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 14:35:57 +0000
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
X-Inumbo-ID: 0f3b12f5-36c2-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691591761;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nYx+HxtKi1JS4SAOvd39cD21W4X8yr8Lg7PLyMUnq8s=;
  b=S62RG+iljrX+Y9u3zI3o85MkoJ3SU7zqPDgX5kp2irQvH/j8f3gWa6yK
   RrPXE02qBtW/fA0XZYXqssyQLWwjHOhnHZfsQgsKRWFiLUURx26xCOvNG
   lD9kXZ7AZv57Hg5qKEbsYWAV1RvScrIB1dWqB6E+uzuuWjkxxyeLpe+CS
   c=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 119017707
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:J3xyuqK0sWXkXfW/FE+R/JQlxSXFcZb7ZxGr2PjKsXjdYENShTMDm
 zQdXm6BOqyNNGL2LttyPN/i8U4B6J/UmN9lHgBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gRvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4pBGt+p
 dgkAwshdy2FqO2H2eriW+dF05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMlGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqqANtNS+XnnhJsqFif7WMXUT8caXa2pMbhmmOYfNBuD
 3VBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4J5oflqYRq1BbXFI88SOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:pHR41av1Oe3beomZUBf1iuq/7skDSNV00zEX/kB9WHVpm62j5r
 mTdZEgvyMc5wx+ZJhRo7u90Ze7IU80iqQFhrX5UY3OYOCkghrKEGlahbGSoQEIYheOk9K1jJ
 0QF5SWa+eAa2SS8/ya3ODQKb9J/DDtys+VbInlo0tQcQ==
X-Talos-CUID: 9a23:Q0zFsG0c9BxfW9egWm3ZPbxfRMUvQi358FzrD1aFD0lmeaTNEE6e0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3AgJ5cnA4o7wghZQ1WPOyug1Jcxoxt74+hDBkvm6k?=
 =?us-ascii?q?rtsy7bTxdHRCfvRCOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,159,1684814400"; 
   d="scan'208";a="119017707"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiIqgldnA3UAn7dl31PDlEZkiHB6LhGp2ZXQTPRpTmlxRTphqyUDe/hjHDz4341E4sdldfOgkvLwWSz6kH+k9QE5uXINzlH/h21soWBvGbDmcrj3kshHniao7W8zV0T5FMO6KtjrMlluwQyw6MTK3K+PtIYklC2PFX1hNsd6p7hV16wm1Rvfu82RMyT9lDO+EiWFNFMeZcYMm+K0wgLl78ChrqUSld00py/E7t6C90xD0recnQMYs8jEIYK0dJmVPJUL1UlgH6g9NZ7OcmsP0/JZ3+rl7CSPVkXafow/m47nx2Pz+MetcY7GR4hp0vjlPa5D65E9QZDFtYe97F9GvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpMMCxfj7BVSG4J1D4V3WsA/uJ7w6fw04YD4dnrrU2w=;
 b=jesuw7ruz2mAzS/8J0+vN6QcSaIC3laWEpO1/UHAW/gOe5HjoeyuYW9xz9/ppstUvjctN+807ikNNC55B085+U3R0rk4o4St7oDWtJPapMWZ1nSS5FFohqSBoeS1pG1XRnD2PMlHM/4IiGuo8rZ5oBSPQ/2mZiJDPfm4Bvyl72T6NmjMsv517uYPJjq0gNWWDAFB1Cpjdlr0Xft0FBVrdh2KTdn0MUv3O7nph0lRH9fwrWpDZVZh+EhNIDUot1NMeV/Lzil5SeqTvXGZqmyo9ZIlHvuDIG/G8n1uDJaP3gdPb8SnUjdrZpA8kzurX7ExPHb5HFSRrsavW/SXY6r+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpMMCxfj7BVSG4J1D4V3WsA/uJ7w6fw04YD4dnrrU2w=;
 b=PfUs2JjybMS3HRe72P9UIDAGfI3ChbIijpeZa4QhavGx0azCf8eckC1+EVRHRjXzGaA6Mx2ncgQCt4I33nL8sixZ2NzEyt4J81RZbS/ZJj0fKDlOSJ45+bHBkBGPWiu4kOBk4Qy5W0zqb5pNW6JBe1ToClH9HRMT+ZhtdUgLfCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d430aa00-11b8-2d41-fcbc-d5bf4871b958@citrix.com>
Date: Wed, 9 Aug 2023 15:35:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: implement cpuid() in terms of cpuid_count()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <9c310f74-e6c3-f86e-8044-0e078ad00254@suse.com>
In-Reply-To: <9c310f74-e6c3-f86e-8044-0e078ad00254@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0560.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB4919:EE_
X-MS-Office365-Filtering-Correlation-Id: 8908885b-2e2a-48cb-4f71-08db98e5f16c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BSq+9hTXoBrhZqW5JYfHxBPa9qKJB4Jg2fE9Xi9yYjv3NLjZwwAAnIg6JWv2hJWqWgWAYcySCU2KoXbpfg5YcFREHtHsnm2xHt30h3HF1QNeYs/xI0uFkdMHSk4tX4Eo42w2iaH/FTWw/jdrmPD0YyF+I3272Xpw/dWwD1IsuDiQVzG+YdkcTe5DVfD3Upexhj2wwnTrZK0OsNBu93vWiCmbDQSHCpogirVxcbOvyqmD3PcbnZ96UwFAYqaJcC+ZXaEpzt+pFwyTfczhO2xlJyK3NTLaBQxws9M6FNsNWpTEezE9NqMTouNUAV6/9jZlXMw6tdArFeWIuKudcTXm/6+yC65CCpvQ21dzkFV+LmPaNcLng8B6trQsSwLU6uUJZHCxOz4c2BvKAeqDI23Rs9qUwhq8IFwC+aBf1C6mpcHeo8cjt9nraFdt/JYYx4ttKABXyeK9gks9RVBawtaDvY8spxd/UkLp2xgVJGDsm3N8TNmR67hhcCHSvH1pCctAatuJHlFJHd2V73bN7Ks91CZZnwWBPgwEwqn36HU6Mxb3pwI9qU2n9RfGc0J4Qzx8H0ccEvQ3ubceyxyRRHx524p7kL7Jgu8xcix1IOE5mv3bHDnwJ+aEZnX8eOLunuRxKr+g4wa15U5fHRcQNQh/aQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(186006)(1800799006)(451199021)(31686004)(83380400001)(478600001)(82960400001)(2616005)(6512007)(26005)(53546011)(6506007)(107886003)(8936002)(41300700001)(66556008)(66476007)(66946007)(316002)(8676002)(31696002)(4326008)(2906002)(6486002)(6666004)(36756003)(110136005)(54906003)(38100700002)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEpEbDlXZTNQUnBkNWdQakVXQmVnWnhvbXJ3RmZPclVQS3FLU2JNWDgyRlhh?=
 =?utf-8?B?alJSZk5tMGw0VXdiS2h3dWdQeVpQU29wZnNQWlM1T2lZYjlHWStpTkpiWGEw?=
 =?utf-8?B?Ti9Eb0lJZnh5QVpLSXRMQ1BBMFl2UDlKdWMxb2FVdStWY3NuK2VFRXdaZkdz?=
 =?utf-8?B?b21OcE1helBKaE8rS2l4WjErT0VJdkxOL3UycktVTGtTRE5iRnpGWjhYUlJ2?=
 =?utf-8?B?ZG9JbW9iN0p6emZEVVd5OWhzckdrVzFvdUVLazl3dGErUSt4SXQvaUh0NDhO?=
 =?utf-8?B?WnJMUTFONitMQXR4cjNjS241UVo5bVI3SUZYbmhpZVRBOExxNHZLTWV6NVli?=
 =?utf-8?B?WTNMdFRjakNXb0NYRzQySmdjZ1h0K09rTXR4NGlxTE5Td1lpNS8wV2ZpeXRG?=
 =?utf-8?B?bk9MbjJ4eS91eWJaTDNQdEV1bktDay9MMnpxU1VxRXd4dEswbUhVK0VSSDVC?=
 =?utf-8?B?WEtwL01PVEUxQlcybkJGTjJEWVgxbHBKRlc5K0cvYXBwNUgwSlZPcHVrUHN6?=
 =?utf-8?B?ekd6amxwRE4yRC9uclpjb2JkQ0U1SUVzV0xZbEJxSlhKOGd1NFJKTmplT1li?=
 =?utf-8?B?OTdOcVZTNkY4NE1HNjR0cEh4dWw0dGExVGNvNnRuYmIzbk1jb0drSHNuTENH?=
 =?utf-8?B?RXJCWDIzRzVNRXVPcnRxQlVLdS9rY21xTzVtUFZWMGFUSU93S09oRlZNK3NR?=
 =?utf-8?B?WGVYS3YrZWtaSERWYzh5b2RteGEzRHhIRG1WYUIzeEFMRnVNMWhNcmQ3ZGFQ?=
 =?utf-8?B?eHFQS0JzUGRObTNzczVOaXZEb3dyOGlVMkIxbG4wRGkvcGtjYjJrVGtCNzFz?=
 =?utf-8?B?b3NqSzk5UlorWjJRQmFXSGVFam1mYXI0NE5lYlBxeFB4aE9NRTBjTERiOFlh?=
 =?utf-8?B?RlllQ2xnYTE1VjJBMUhreG9qanlpT0hLN2RJNzdwcEg1OVZDMUxZYzMza2o4?=
 =?utf-8?B?aFhkbEEvbXNDTHI0VUltK1V5dUdRQ2cybmt2dFBqdndGaUVCSVZWOU80N09r?=
 =?utf-8?B?NlJGTDhpcjdxWkcyeW5Ub0U2VmpkYUU2bEhKQjltT3N0aitpQVp0RjJiT21z?=
 =?utf-8?B?TVo2TDlIU3M0bHg0Ni9FQlNMdG1FWGJHbGxPUFhKcnd1WFJoWU1EdWlyd3Jv?=
 =?utf-8?B?c091MFJCK1JhTGFCcmNWcHVjazZSbVk2dFkwVzhkWVRPa0o5eTZSYkN0ZnRk?=
 =?utf-8?B?dXdETyttWVV4MHg0c3pZVGJ2NXZzVC9Rb3VjMVl1djAyZ2FUQ203dDdTQmZO?=
 =?utf-8?B?UzlzeGNpUmYvcmJodUNnY3VVZzlDRlpEWGJkZlQwdGdKMmVKOGM2L0xNNm5o?=
 =?utf-8?B?UWFreWJ0RHUvYUIvdWhHdEJXc05Hd1NRK2pzYTdxc3ZQemlmT2RMWm9IbGdU?=
 =?utf-8?B?UXk0S0ZudGdxMjFCdWpQVmkzdW5rT2ptSEVoN3RpQXhVTjUvTDU1ckJzamVH?=
 =?utf-8?B?M2VoVWdkM0NhRlF2V1pEc1N3d0JIMHl5b1JYSUFyaVZqTGh2MFdKbVFYL3lP?=
 =?utf-8?B?RmJqa2l3T3R2UWlFMEFzdUJMWlhNREJWRGNPaUtYc1FMM2tmd2pIeFZKVFhx?=
 =?utf-8?B?M1pnZyt5ck9lSHY5QnRCc0JqSHYxL3dXa1k1M2UwQWpPNjM0a3h0OVRTQ29y?=
 =?utf-8?B?NDB1Yi80bDBkNDIvVFRTakNNRWtpdE5IdkxOV2FheW5RSjVLS1pzOXAxK1dM?=
 =?utf-8?B?NEFXd0xYODVKdG1weE1XQnRSOG1mb3BiQmYyZGhqZm1KcGcyVnBDdVNSZVY3?=
 =?utf-8?B?dlNXQ1VvTHpMN0Z5M201S1MzR3VqcXBaT3M4S0lSTkRhOVNjUUxXeGFPeE04?=
 =?utf-8?B?eDBTMy90WW16WTVIRnN0VzlUbVFmbC8zK2VUN3hMaGdyNTlqRkc5RzNMQmlm?=
 =?utf-8?B?ZjNhK3hMWWpmdWw0OE9CdWxKZzd6TmRwbE8wR0V5WVNFN2dIeGlhQjlGZXRO?=
 =?utf-8?B?Y0Q1S0NOQmZoKzZ5QWQ5VUY0MUpwWHlESXVuR2VjcFBrZlhTeTR6UkJGTm9n?=
 =?utf-8?B?QjVnejl5T0t6N0Z4TEdBWm1xbTdYSnlSR0VzYUQ5MXR2eko0WlY3bDhOaGZN?=
 =?utf-8?B?SG5aeWpWUkRLK2VDcm1IWEh1U05aczhsUjVIMzc3bmhmMXFLVVMyWE9OeFNy?=
 =?utf-8?B?UkZnVm1DeUpEcDVTT1JuS1RQNlErcEdoamhKSG1rMVBJZkF5YkY2MS9nUThx?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fBdRq232Ao49GTaXnB3SQKpP09v0ncCERDsPn7FPjmWszaVNO4/VCFChUSffvfZ+54GMQpkwx/Y3VLQA5aiO0eWygzb2PbqDXP8fDzG7FKfVfH+iRg3oPy1lyKJ4Q7RtUFhcYYojZ61pMeLa1Iq/q6Yi/KtXT7+nSuYbvulBN8mKcnTDPG3BLIl3HKwazNVfq+C0A8a/1vvj/eyjXI5nBlCecfi2jQmwMlSnFT4aMBZo5uSDR6cwde08M7xBI34gFs1QcciY3TgGgWdru2SKOVFQVddN96hHl+YZEnMMUnD1ruGVam3XfwDDckG3OIWOWfI2LbZVutCQhdB9d9iRFeVwpMqN6+zh7aYp7+O5hwbNpuEIOwAxb6zXP9c0k+4G4tpUytzXWpy3/xc9gn9bd2/xDtPUoPG42sK7N/RVO+oF1O7N7aDW2BCaERbEfezjcIkhSh3iLGh5xscFKskHLG7SBIkVisJjMbS6QGoRxtSrxU4UwDvAG+V7W/G+Amjx38UuDSIWR+OVbKhHm3xVAcwAmaz39UZLFY1xU5Zh/evpCJg/qYFUnAUeVAMDj6k2t8V+xGHRjtikMOkVdZZgpGzIDcRKbtINfiTgHpRbvvpXa4ce8zA70iQ+ndi5CNQN88h0+IU0BPSOrhyHFeFIBN1N4CtFHsWUZtJWQofhaes1pD9Up4Mi/YjlzVncvvwz0DcBTkBWVCnQhSMQmqAZLOmyPN1B9lw9QQQ+sSh7NwmeTQkEZVnSFFo1Cn/wk4SGqtwUR+OrC6EQl5FVnPsNJ77lQZNKL6U3dwEbf0lyjlzd0ggSeP/vZx3SupGhC8MQ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8908885b-2e2a-48cb-4f71-08db98e5f16c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 14:35:57.0953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/I6iiiWIELGHhv6ECEKmeN/Mxl7Zz6lAlRx8kIxrHQc2Bksny6f5zBnsx2L+7h3yXtFtReG6GnKm0i7LSNzZIIyRUuKEf9lsmEonGJyBmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4919

On 09/08/2023 1:29 pm, Jan Beulich wrote:
> Since as a bug workaround (likely inapplicable to any 64-bit CPUs, but
> it probably doesn't hurt to keep this) we clear %ecx on input anyway,
> we can as well fall back to cpuid_count(). This allows getting rid of
> four risky casts and makes things type-safe. The latter aspect requires
> two type adjustments elsewhere. While adjusting init_intel_cacheinfo(),
> convert three other local variables there as well. For the struct
> cpuinfo_x86 change it is relevant to note that no 64-bit CPU comes
> without CPUID support, and hence cpuid_level is never set to -1; the
> comment there was simply stale.
>
> No functional change intended, yet of course generated code isn't
> identical.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Hmm, far less invasive than when I last tried this, but that was years ago.

> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -131,13 +131,8 @@ static inline int cpu_nr_siblings(unsign
>   * clear %ecx since some cpus (Cyrix MII) do not set or clear %ecx
>   * resulting in stale register contents being returned.
>   */
> -#define cpuid(_op,_eax,_ebx,_ecx,_edx)          \
> -    asm volatile ( "cpuid"                      \
> -          : "=a" (*(int *)(_eax)),              \
> -            "=b" (*(int *)(_ebx)),              \
> -            "=c" (*(int *)(_ecx)),              \
> -            "=d" (*(int *)(_edx))               \
> -          : "0" (_op), "2" (0) )
> +#define cpuid(op, eax, ebx, ecx, edx)          \
> +        cpuid_count(op, 0, eax, ebx, ecx, edx)

Can we swap op for leaf seeing as both are changing?

Preferably with that changed, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>

