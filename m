Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E74C0FE1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 11:12:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277253.473688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMoc6-000513-9Q; Wed, 23 Feb 2022 10:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277253.473688; Wed, 23 Feb 2022 10:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMoc6-0004zC-4V; Wed, 23 Feb 2022 10:11:14 +0000
Received: by outflank-mailman (input) for mailman id 277253;
 Wed, 23 Feb 2022 10:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMoc4-0004z6-7i
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 10:11:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebdc2305-9490-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 11:11:11 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26--3-GMgKSP-Obv7AdpR7oKw-1; Wed, 23 Feb 2022 11:11:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR0402MB3944.eurprd04.prod.outlook.com (2603:10a6:209:1c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Wed, 23 Feb
 2022 10:11:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 10:11:05 +0000
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
X-Inumbo-ID: ebdc2305-9490-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645611069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oZXHA9bbcKY5LHV6iVNy+eglUHCbFFEz4iwrktrCMPg=;
	b=SbxPgE64H9Sb+vIRTMtimWUMYwEBAnhfYezJAonzDUpORrnafX+hMNPkRvnm5l4CBqR2+D
	3qMBmp9FsQ+HpU6gMHXgP0o40Y6vrbDDuEU32RB+IlUpfy/C9YJ8nxE4KNqhRfl945urWu
	e9is90PGVBU93K5hdX+PLfOSwDQYU5o=
X-MC-Unique: -3-GMgKSP-Obv7AdpR7oKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFIm1JKiH05MNyhofzaF16rxJYic5gA0DegUIdcDraWxo02/yAL1/lLglD2S8ZfBjB8/dT+1WdoptV9hjEhLUZbH2kdAYdzdGyH1CJAETl982rqkfgjwuejDyPBje/6l6thAsyw/PfznrA+y6HZQMFaZvYtzwRVeSuxKTqCT4b8g3WzcXPlgw2RXyhO0z9UmbHooYzZ3VdTw0mZ0Mh9jk/qu+3x1KzcKlczFiZ+6s+DgkpAW4pzy3DeaObRniNOW3rQy9334PaHAwR3CIB/newhfvFGsOd5wWfwTjfxU2AiIY44K3o/Gefgp1eNUe36j1eCeIbgDk4c5ZXBBMV8F5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZXHA9bbcKY5LHV6iVNy+eglUHCbFFEz4iwrktrCMPg=;
 b=az8nWDxS8pcUJz12aXumtgwLlOGpdre1lDA2oXzCDOphbYiWj/NWU3rQAD5W3o5EPnoaVvf/JNp+/DEM+nVFMmbBWW/HngcSL+eIAyFFyYrKWXwfmko8VhFmUcx/RyPhwDoVm/sN/kXUiCQsnjafgDDislVhNe2Da2Np+ZwiEoWzbNXHDQP0s/3ljMny1dF8r58eAr8anays3TZJR7f38eJKh22oo8FfS+yr6aWgjjm1PszqgJYU8kx4kbR/8lTs5x1Af6pDYrDhcdfVeuQyN5jib6Z+w/8MLsHsl+4tjdDOWPt74ixP93hlpOaAeEvG7+i2t7EJLpQYp8wYLGhkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <91935ffd-a270-f1a1-28f1-645fa4167fcd@suse.com>
Date: Wed, 23 Feb 2022 11:11:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86: correct fencing around CLFLUSH (+some tidying)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0113.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8728d829-765c-4ad5-f3b3-08d9f6b4cdbe
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3944:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3944E0EE8ED110A35FE07819B33C9@AM6PR0402MB3944.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tvh/c+Mn/WAmGOUvlDi1jeFHmYkImzp8q0xJa+aTZEblVkYmMj9fFBu9sjgBdiRS0kbqqabFC76zaius+4AhKTCog3EAEt+km78iSkITb2sraCh1adnemnmV4Y3diCf3a5XqKcZ8+oKuXcndmrPqxfHUOVLUbZGUXupqJMdxsnh79u07FC65z34+jWFoa6bObhBkxsBVyg7l7+pS7XtRvqKAA3sgLUedIJnFVcdpv/h5owunbQxfrfyx/LF4q9AaluKwFcV/elvh/SudjsWG3uiEACcvzeYuMYvHxOMuOijyaxqOx040w+QDyUMj/Ecm+z3qe8TIm6RTZoWVIjmINTEfDnr3c36DTvW2nZ7a6URFT5IuA/8owroQb/ca+8O38BG39jPmX5DfHHCcGTnlMG1IkDITqDARwizAwrwZTdN217SBwtPE3S9kz7s55tyW9zVvDTW85oVBQ98nAUOpC8FDmrXtUecZCS30m6exb1U/3hqNyb7Bsrr/QTi2DQSw5o0W9Lfe3ZQaIvDFINg0ib7tzhX3K3qEsBZVTC4+pw1Iuml1TpfrKq75jTYAEOPYp8W1xPsv2/YLwa+PwJPTDe+ORmyDixe6pg7sXUe/jEBuZRPM8Aampz4b3hb0EK6HokRsQjcowb1Ngjvkm8N+8dbKt5mU2FgDKPWKzSU2fFVhcriVm/VjDZjqd0uGPAI8rnHa8e5Z/TAqF+yDax55bPlhkN47r/ebw+FikSULIHk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(86362001)(6916009)(2906002)(316002)(54906003)(8936002)(31686004)(26005)(186003)(2616005)(4326008)(6512007)(66556008)(6486002)(6506007)(66946007)(36756003)(508600001)(8676002)(38100700002)(5660300002)(558084003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTBnbVVUUm53UGRWTEpqQXZibzQvb3NLemMzZHp3c3M1R0trSHAxOVVZSWZ3?=
 =?utf-8?B?eWRReE41TS96aGJkRkpWa1JXcUQ0QjVCQTBwMlF5V0N0SUI4bEozWW9rMzY0?=
 =?utf-8?B?Vk1kWXJFZ0xDNE1LOTRmWnA2MmF6WXA2RzJyYmlUYTdJbEFBV00wNlJ1L3Q2?=
 =?utf-8?B?OVFVS1d1VnBPSEpoMGdqb2gweGtSYlE0ajcvMEhRV3VSZWRYOS90ZGsvQzBJ?=
 =?utf-8?B?UFg3eFE5anE2YUc0QXdqOEZ1amdDbHh1UUxueExjWC9tQmZVWVNQZDVEQmZy?=
 =?utf-8?B?czFnWFlqRk9GWVNtRXB6NjhGaDNHcGJ6VWF6TEJ4NS9uVVNmSEphSmtzaFo3?=
 =?utf-8?B?eXRKZ2ZyQzJiM0V5RXprMjRmeXFJSnorYmVHSCtGYTc4ZHNzbWo1c3AzS0Zl?=
 =?utf-8?B?WTZXd0NMUnhsU1dqUGcrSk1QeiszVXNkMnFUZjJTckZCN2FWNHE3QXJEZWpS?=
 =?utf-8?B?R29QWGV6RkNiK2ZuZklncmh6bUxLZVExbGNzU0hqZzJTNHVxUWFndUtabTNX?=
 =?utf-8?B?WnZkZ1dXbDVRbnRVN2luOFdCVzRJdStQTEEwMEQvVnI5UVhpMFZ1MWY0U3pn?=
 =?utf-8?B?aURZWklhbGtEcTVtMFpldHdTRkZXWVhqMjM0Q2Y3WXVZUzdtcjFPcTRqd3VJ?=
 =?utf-8?B?K1czNjVxVm9kSWFRZ1EzMlEwaWhXeVFSU3JXQmk1WlBpM2wrSEtyb3lpYlZ3?=
 =?utf-8?B?RFVCVFNVL2ZWT3VFZElRbi9kdnVJNGVHNlIxdGJYWnNaeGdwdFVMQWptV0hX?=
 =?utf-8?B?emhZVzFSR1V3Vjc0WWNDV0dieDNsOVdpZkN6aFhUcUlkalNQR21Fc2kza0Jv?=
 =?utf-8?B?d3BxZWRPVDVWc0docmxxM3RLR2QzajlXM2g1azMwVThNcFozK2VWdlJDR1dH?=
 =?utf-8?B?MkJaL0tCNkYrZTN6L1FHbmhYMGp1OXVwZDY5dzVxazNneldQMlpPZ205MnMz?=
 =?utf-8?B?dHdTTCtnaVBHSXFBb0JBZ0c3VzUvNjNSL2RyNmtyclpTdUd1cHFDaVdQOFBK?=
 =?utf-8?B?ekVyWlVXeVlld1hEQjgvOG1sS0Z6cHlKNmljN3pDZ1c4VHRJV2ZnMlRXaTZj?=
 =?utf-8?B?b1hvMWpHS1BGbENYSk9jMWZqaW9pbWw3UmZnT2hQckt5WnZxU3NUQ2h2Mmhh?=
 =?utf-8?B?UkYxdG01WjBMVi9MQ2Jrc1BtenRLSjJReG9vTHd2aEFhcGZnNC9kaGhhdUFR?=
 =?utf-8?B?UFhUT3BuQ0ZhRzRaQXpzZnVmWHF5ZUNiRkNaL2Mvajh5cWNsb3dzVVlaSFo4?=
 =?utf-8?B?MW80dm5ab3ZKaWRHY29DNWZVcU9NcWpVUUhiNkpuZHhBL0JnYXQxNFN5NGg1?=
 =?utf-8?B?TWtJRzU5RDNrdmFSd0VYR2I4M3RCUWNlUUp2N1ROa2xkM1daVnRvSU53SG5C?=
 =?utf-8?B?SDFvYW16WFNKS3FXWkI4UlgwNm8xZEhRKzdRMElPWHlPMWR5U3RrUDVxQVcy?=
 =?utf-8?B?TEY2emdBU215YTNoekZMUHREM3Vnd2xCcDVkVVhNenBhbFhaVGRBK1hPcS8w?=
 =?utf-8?B?bTRxbHBFRE4zSzI5bkdMZ1dISjFIVW1nMGNCMllEYkJnS0pkbndOMWJiakNq?=
 =?utf-8?B?b0kyR0NWUmxNc2hjTWd1STlWMWlib2RKVUxxRUtMS1ZDSVhCcTBKdzRJMGdt?=
 =?utf-8?B?S0Ivb2I4L1o2WWtEb3hPL29mT0sxTFNsWjk4d1lWZHI5ZGs1UXNYZElHM0xo?=
 =?utf-8?B?S2ZOajMzMXN3NlU0TG9ZVWZsSVh1S0lzTVZXblJlWVJ2YWM4U1c1TDlsL2x2?=
 =?utf-8?B?T3gyczBYVXhkMjhnZ0Rqam01UkxPQUd3a1VuTVpVVlhrdUJrdGFkZ2ZlVG9j?=
 =?utf-8?B?eUhXT2ErNFZTbmMzK1E1Z1dVRFdzWlFvUi85R0pFRDVRQ25adVZQdENnSW1Z?=
 =?utf-8?B?dnpzRjN0c09ybXU0Nnl4VC9TV1ZKVjc1bVB4UGwzSk1PU1VkV05pUy9wcjV5?=
 =?utf-8?B?ZFpCUTU2M2h2NGppZ3lFMUh5Z01BRU9weDZwOENsdzErY0hGc2o3elM3WUQ4?=
 =?utf-8?B?S1loRmxJSzBZM2FiOVlJN250bCtwOUxpcmNOZjVRSnNYTjdKUFRTN1RoMGxH?=
 =?utf-8?B?ZUh6a2hsdWt2RUhOUDk0Q2daOVRLd2VuUW5jWjB4a2VmaXB4TEFySjBDRjlV?=
 =?utf-8?B?NlF0amhtU2JCQ25mUHA3TUxabWVTdXdJSGMxRmRhRnlXa1lBVklYdlN2Ynlx?=
 =?utf-8?Q?rREbYFAt5WvIwKCFA6sPojs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8728d829-765c-4ad5-f3b3-08d9f6b4cdbe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 10:11:05.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0otYrWB5zlE674kOF5Py8YzJbqpE91cJBBKF0GKkNLogj0FwuZ4Jgi/eb8RHswbFkMDJskAk5vRGyCjGyizrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3944

While it'll make backporting of the last patch a little harder,
it seemed better to me to do some cleanup first this time round.

1: drop NOP_DS_PREFIX
2: cpuid: replace more cpufeat_word() uses
3: correct fencing around CLFLUSH

Jan


