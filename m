Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD603AC8B0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 12:21:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144403.265786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBca-0005gq-9u; Fri, 18 Jun 2021 10:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144403.265786; Fri, 18 Jun 2021 10:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luBca-0005eD-6f; Fri, 18 Jun 2021 10:21:08 +0000
Received: by outflank-mailman (input) for mailman id 144403;
 Fri, 18 Jun 2021 10:21:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luBcY-0005e6-9c
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 10:21:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84f872d9-f83e-47d7-87e9-0ea5af0b22d7;
 Fri, 18 Jun 2021 10:21:04 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-ifoYLjiJO5mrmltFyfeC1Q-1; Fri, 18 Jun 2021 12:21:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 18 Jun
 2021 10:21:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 10:21:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Fri, 18 Jun 2021 10:21:00 +0000
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
X-Inumbo-ID: 84f872d9-f83e-47d7-87e9-0ea5af0b22d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624011663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dAYCbiHz5W5de7kCOn2UsXKOpDE9eB18Ff1fPYV212I=;
	b=EsV17lEyp9C3Yu8gmZSo/x8qacCCHafpDZAZyNbugb7RgqLYDBp92vQ8b9Hx/h7XBeVNHN
	kWjpF1UcmYaX8It9lOwpP7ww7aMuQIwU2/R3bBhLmDMTdd9LgqOJwHEGopl2gzjGUqVkCh
	pEGznZdRukNKpUNL8u+mRvpJ1oOIHRY=
X-MC-Unique: ifoYLjiJO5mrmltFyfeC1Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1nhdtDduAVF4aythp+atH//rtvnSiSOvZb6nWjvrrpI5PadJ+0jLvyxJRauY2QxFDLwM/39SClHRYDRtVa9YfJ4tSyDD8Fju0W4vcu/WNXKmLWbWjjowXmtMWxdSfMGaQzBXS4zyZ0Rwgsqlpmnjh+dXT97I2otquA0jTU90El2lOWzvln+sUkBp78vUvNkPSOnJ7krLQkMLYwzz5DwSMfI7oj+H/CZc4QrwCFYbbh6hkzA3lTrPd3bpszRp9tkDiK2fbY4e165g9sf+TFh1R94Nz2zOjhZIXIUawNTXGjlXMDN13YPHyE+YSYCkeE1K5QVgElfDUTl7zsYl2ucPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAYCbiHz5W5de7kCOn2UsXKOpDE9eB18Ff1fPYV212I=;
 b=DJ7BH0L9TrbJR8pt4ex5xyySk/lVI118/aeHq+9kImMUVdDhzoLSUfzcvmackcyGEEgkYy7h3nFUsSeYfBjmWqCYApN3fn+fo2gYnsDJDzaaexdXPcTIyA/6krKeIAgxbiAJ9l4fAjbYME7+pXu8wUzl7f8VIJW1MhnxlKVZOLiCe6Srz9lgBsUbz4ENJ7eHw1rSBduUhM0UYkSuIWwsn95SHtfNDzU0D8lVFKcBjYWy7F371sieHGLQVXGUwSqPyRg2LoHU1aJsiYL7gMns+AAe24tSj5GzGgMm0GqDbtQfSAiMy/M0aotHgjWIINwHLu8dbQp2atsT25Eu9q+T5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] allow xc_domain_maximum_gpfn() to observe full GFN value
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
Date: Fri, 18 Jun 2021 12:20:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54da9493-b0a5-49dc-ac73-08d93242c536
X-MS-TrafficTypeDiagnostic: VI1PR04MB6862:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6862578B731D487B1249DDFEB30D9@VI1PR04MB6862.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8sq7yEMyN6MrBOnU5HividyYGQRo78kE379aEmBT/QorjbmGitHwrzTo9uj3jm/kFY/7n8/fN4ETVzdSyPjrEXTRiZkIPstVaNCqokKM43TiKy+KLIiPVTLRnzpRQmRujkMldhuMRmwfeYAr/laUeOdVTD7uI6Kqr1CWUSfdJi1EZPHTZ3q0QfH3/tCLzaGHPFNnEeBFQXEuJgic5zxDXpi/B1SGoQGhl3aB+sfC1nZrb3+t7ucRiOTzZjLq/F1qYm24KsRKCzZHZ5EJmKTiHJgNRSRw0yJvNEbzp5MIjCthG2o9rACXuY4DSyCiE0cP0/+fZPxuv1cSqnwnIBr5a7J09q/YJ8Tj4dylcUQqQsomK/kFvFf6P7TZHeF4dRS0bH0zJgbwXxOWz1sZoT+Ta3UjUm4PT/xcKFL9ofwHZnBSkaWgAZzrYcG7yPC/UV6KXo8Yu0ehrK59U3UGViPePtLOcmRiH7qF+AXm7lnX3FQBcjdCm1P1zq71dx3REJnkqRpZX9jyc6i8Ig8KmG/FfqfI7I+6AtuNuKV4K5gMtqw+dmfmS2vt1OM2WNUuqf29g80riISVU46Xg4a1KRjFCfVZ9keylcYXshrJjqoPLfZxCfzZ+GPwPfYceknqN10YTTuaI+j2iAyoXIbU3v1Qu3W0yBZRwDNR1UQ+DslDEFv9nDkhhlVyF6SzvLyq+Gif
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(366004)(376002)(396003)(66946007)(26005)(2616005)(4326008)(66556008)(316002)(6916009)(956004)(107886003)(31686004)(8676002)(36756003)(38100700002)(186003)(2906002)(86362001)(16526019)(83380400001)(54906003)(5660300002)(16576012)(66476007)(8936002)(6486002)(478600001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWdHSVFYOUo5TDRkbXdFZmRTMHVXanFNZFVPNUR5NktqR0ZOclcrMFUyQTBP?=
 =?utf-8?B?eUZjNjdrR0Z2d0t6OXBUV1lWVTJkSk9FUXdXM2JyRUZ6NjVWQ1VHUlEyemFz?=
 =?utf-8?B?c3kyYTFqSThOT3E1UEszN3lQZ3hkV2RKYitjS0FQM2pmNmN1MklSUlNidUdh?=
 =?utf-8?B?WWMxampUSmh2b1VwNlpxYnAwNGVuL1R5QmtZdmVReVFvWXQ3VmdER1FMUHIx?=
 =?utf-8?B?OTdyNy9hVlFwZUpKZkJ6YXI1Smo2VW53bTh1YTVqYVl0eVd0YVYrcXE3RmN3?=
 =?utf-8?B?WkoxeVFVUjByZGNxOXVKMEN0cEdYWWpEc1ZQdlRWQlZCMjVHWStYUGpZN1NS?=
 =?utf-8?B?TGFWNjRDZmg2cVkyUlczTEJLb1F4aDlpRExsTFNVaG1VeWVTSzZpazNvN3Rx?=
 =?utf-8?B?TlIwTnliTW9aVFd5MmJuNkZ5M21XSy9UZkFHM3NpbHh5ZlR3ZVFNUXR3YVZI?=
 =?utf-8?B?RDY3WGtoeFprOStHS0I4UjdMcHkyT0NBNlVjYXdnUlh4bnNPMS9DbjUwMDJo?=
 =?utf-8?B?czRZL0Z2bFVnc3Nmb0lpS09qNXlUTzV6bkNzYUZqQWhXdFlyUGpEVGVac1FS?=
 =?utf-8?B?RXNROHA2QnI1TzRDWHFLTmZmcXpScWZqN1E5cVBXZVFjRTV4d3JjRnE3dCta?=
 =?utf-8?B?TWNRREhFZE1TRXFpL1dLd0lKTHkvM0VDQzdMWFV3TSs5K0NwL05ZZzc2U3BG?=
 =?utf-8?B?MERIQzlSSEFnTEhxMGJVeDRBc2tpVENFcmY3ZVpwbFFnREdDUDk4blZueG5Z?=
 =?utf-8?B?b0NjSFYzekpFVWlXVG16T0tFclAxamZocmxmL3c2SUlvZWRhM2NqSkwvVUZu?=
 =?utf-8?B?djRsbndaQ1pZY2c1ZjlZVXNZNWVlbVZUMVB5OS9qN2VJeVhSWFV6c2tkSksz?=
 =?utf-8?B?UXc0ZWJsTzFxdXVYcFh5NTd6Sk82VEYvRXVHMUI2Wm0zN3hGWjlMRkcxdTBN?=
 =?utf-8?B?MTlyRE94amNBeVZjeUsvQlhCTTRvYVBwaFVJUDRWNUdLUGpkVGl2Y0xjVmVy?=
 =?utf-8?B?UDhFbzU2eWhGdzJtL3p0OCtxNUZEb0h5S0JVRmd3T3pUMi9kZWRpamZwaC9v?=
 =?utf-8?B?OWRCcmZEcXFJR0RQTkV0dDNnU1kwcjduYXhWempTNHcrUG5qY1d4TGxpS0F1?=
 =?utf-8?B?SWsydG9iQlJtaFBSTnZ2cE82L3pDQlVHREV1RW90TVliZkRKWWsxbmtuUGdJ?=
 =?utf-8?B?VlI0OW9yQ21XL3JnSloyY1BSTHRoZ05NakI3aTFSQ3lQbjNPY3F0dTU4UkRD?=
 =?utf-8?B?M1RrMGdzcnU0R1AzQTBvN3Y3dE5PcWpIZ1JGU1JRRWdYSG02dllNSDg5ajJs?=
 =?utf-8?B?UFlKNk9FMHpFaGlzQ3k3SkF5OVNXMHdNTnIzNUtYSUJuOHZXT3NaaWZydFhk?=
 =?utf-8?B?Vm1xUHFUaEs4UUIwOXdLMWpXaGExSm5uZUUvT0lNVk8rQkIyMGlYZDZDdENG?=
 =?utf-8?B?NTkyRWprdTgxdi9FbDcyRTJsTklLY3VLWFVvZGlmUWdWTjB6NWFpb2RPUjZs?=
 =?utf-8?B?dDRLV1BXN1hMYzIrV0VFWDV5ZUtTZEREZG14VUVBVU1pSGRNeWRNbkVReDA4?=
 =?utf-8?B?RUZ1NFZCY2U2Rng1UkJmMVJoL054VnEvMDJTZXVMVGJUZndqS080Vi95NW4v?=
 =?utf-8?B?Z3hLQnJXbk5FYUE4ZEl4eFFDN1FyVWkyY2psNmc0SmxzckxOZ1MxQUlCMFpY?=
 =?utf-8?B?NmR1cEtsM2Nubi9CeTJ3R3BFbWtqWUV0eDczc0dpZTRjc1J3MWJ2b25EOXI4?=
 =?utf-8?Q?ga19Mg0Z7uPWxWA8c8LIQ0nv+yb/xEhpjm5+QUZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54da9493-b0a5-49dc-ac73-08d93242c536
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 10:21:00.8850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPGA83IGLh8q+g+Ox93WLsZZF7IAib4Nq85pBthzvUEufDjNTNTgve2oGNfWXjsM+Qf+eoSRjrYoUQS22IyR8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

The present remaining osstest failures are due to truncation of the GFN
resulting from the hypercall return value being passed back through the
ioctl() return value (on Linux and Solaris), which is "int", plus the
same for some further internal interfaces (osdep_hypercall(),
xencall<N>()). Some of the memory-op sub-ops, like the one involved
here, may pass back values which don't fit into "int".

Different effects can be observed with a 32- and 64-bit tool stack,
each causing one test to fail. The changes here will only deal with
the truncation resulting when sizeof(int) < sizeof(long), i.e. only on
64-bit. For the 32-bit tool stack case to work in such a situation,
yet uglier hackery would be needed. But even if the full value got
passed back, we'd then hit:

#ifdef __i386__
    /* Very large domains (> 1TB) will exhaust virtual address space. */
    if ( nr_pfns > 0x0fffffff )
    {
        errno = E2BIG;
        PERROR("Cannot save this big a guest");
        return -1;
    }
#endif

in xg_sr_save_x86_hvm.c:x86_hvm_setup() (and there's a similar check
on the restore path).

I wonder in how far a guest property can legitimately cause an osstest
push to be prevented by causing a failure like this one. And of course
I'm also puzzled by the ovmf change having managed to make it through
its push gate.

Note that I can't tell at this point whether there aren't further
issues, as I've not actually tried the ovmf case. I could easily see
there being oom issues there then, once to full value gets used for
setting up the p2m monitoring during migration. Or processing might
then take overly long.

1: x86/HVM: wire up multicalls
2: libxencall: osdep_hypercall() should return long
3: libxencall: introduce variant of xencall2() returning long
4: libxc: use multicall for memory-op on Linux (and Solaris)
5: libxc: make xc_domain_maximum_gpfn() endianness-agnostic

Jan


