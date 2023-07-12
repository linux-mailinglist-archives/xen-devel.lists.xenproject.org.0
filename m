Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0823D7508B7
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 14:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562473.879159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZI6-0006I8-7y; Wed, 12 Jul 2023 12:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562473.879159; Wed, 12 Jul 2023 12:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZI6-0006GS-4k; Wed, 12 Jul 2023 12:49:58 +0000
Received: by outflank-mailman (input) for mailman id 562473;
 Wed, 12 Jul 2023 12:49:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJZI5-0006Fb-09
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 12:49:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99ac8978-20b2-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 14:49:55 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAWPR04MB9808.eurprd04.prod.outlook.com (2603:10a6:102:383::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 12:49:53 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 12:49:53 +0000
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
X-Inumbo-ID: 99ac8978-20b2-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwzK1DOq+IN1bQPeZ0BwmYbkonuEaih7dmCCjBlCnie/cU3be8+yUIR6RovQQ4YjQaoZlV8Vt22GEg80TnJihKxUeb2WNqXnh1h0ssmhA0mEUfoxnAHyHBCOgyM+i8kLNrxPHFpAYA/SQmqrHHCRduLHeRJFyFSfkBZVR5LS1IAPw/TkaOduw8Z82tROrxdGSbl+ZX+zykVE+w43SMVD8H6q2gXbm/o8mGzXT3xILdh5tQgWy/0Gtv0iSHsCv+W3A8DrmtGbjwof2algnYoN/w7funD9YfumN9Hxk6lsw/BQvf5jgvXkcqAvDclJj8C9jUyMDSVJgj06kv0JmydBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9lCbn3DqAMl1RM2QPrZTbiQRfaWGrcLMBTpPLT9Qjc=;
 b=FnIT6132SVgNltVOKsK9pj4RaiQoprz1Dx4j3h3xy43E5C61WNwz9xkNPoCNC4zpshShoqzZdtK/xr1BcWgDqVx8i39AoX8okyTW43XIUMTY4sAXHGcLMvJ8dzb5cezZ1lfIv/0b4qBPK6Tz9l51A9zlIgiKe+uh+fFtFJmWSkf8QyTDV8R20QPFsVrJZEutxcFPWkKjGCxdJJuHRXjcTcKIx+/U8ZwPchKKCsZ+upyrknyvycCuZDZKHcQpnRlP+jEf25ieH1YvjjpwJLMAIdR+ATyXBuLkOJeYiX3Xr0anvw2f3xQO6uEA3rL7rppeFdf4O9zkE4kV1pWhDgkGBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9lCbn3DqAMl1RM2QPrZTbiQRfaWGrcLMBTpPLT9Qjc=;
 b=Ukf1EtzGiVbc986myLdFSqsnFS3i+IvJlJ1B/fIIO1nqvXPPjR/QVpxAcpTY7DGU7iIMVv+6iTc9efjU4lX825KX7kZYxeIs4/CVvG+x3NzCQKsxUToRrdyn8+utu4+qeAnOwFsEAs02f2Bce2YymMarwjQvNXP8xrKyoWkjnTTrOFUFfkAdxcBpW1FReSmlKg0E67DasQWUNkBXPT41z2F0XGkBi7CG0/8aePIPVcw6Y0wiuiPhFaM8qs6B3dt/ppoO8I5DS0p4SgiZbi2ggMA+uQm8Ocnm+lXyPLv9zkbfyEjU76FcxHjVcmmoDSM1OwAi4U4tXsg1pB6PDICWoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <73977cf1-b38a-4eb8-4bac-cf2656535cb0@suse.com>
Date: Wed, 12 Jul 2023 14:49:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Violations of mandatory MISRA C:2012 Rule 19.1 in X86_64 build
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
References: <fa2bc5da-b866-05ac-409f-c26e025428c3@bugseng.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fa2bc5da-b866-05ac-409f-c26e025428c3@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::6) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAWPR04MB9808:EE_
X-MS-Office365-Filtering-Correlation-Id: fb51a40a-768e-4731-95f3-08db82d67cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OIqSWDflAV65DMcnunRf61ulASECkjWpi3vEBbXNnKHnmcZTsZ7seXrAWRtD9rey1VNnlpjL6bSIVSP23XF7mbifa6fqH2JsiqhhbqZrqja8FB7FXiL7JEmsUNeyoU7jGeVyzgydpt/P4wZRbhsvZjbbCDxhA7NALdfagTltn24g7xzEgi3OjdwBtaLG8/QdGBSFEi+zPRjnjGxSDUVvgUGmALzu8al3A0RfifrCz8IBoMbGAwV076x2K7mInHy05gtLpxPFoA27dcjMDA3Jtu2olHZ4bS0y/jMY1wNS2SauCCjem+cCwtuFHiH68Ghmph828rcSGtxDFt7zHxe71ACXdENWpUAbCSgC2OrOsoI+eDGRm/16pkq+z19EnxSNqhZUTHgDqyoFxjjFKUL7W56kL/IZpCZkvHWa6cIRhdcTzKg1mctSnAWE7wDLElxfib83fQPYZx2m6aMp812vdsB/g47WyZld3XlrFx0+wVjOvWEmI4ioq7g3v1jZBuv8x5Opj92KeFLznB6G3t9VInuN4dk8hZA7I+Su5bkQQpiu+9z/5xzYPwiO7QNC+menBH6QRzqBfMNtRYUTYa0wN7/wA2L2/CmZv2TwagGhsyBjiMjs2FcU1wW6J4JWscnU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199021)(4326008)(66946007)(6916009)(66556008)(66476007)(6486002)(966005)(6512007)(83380400001)(478600001)(36756003)(186003)(2616005)(6506007)(86362001)(53546011)(26005)(38100700002)(31696002)(41300700001)(8676002)(8936002)(31686004)(5660300002)(316002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWF0d0twTE1xY0RvK21nNTV4WjFtUWFERGRtcHQ2MTd5MzhzWlI1dTQreFlG?=
 =?utf-8?B?dlJFbXhibVBTekVVbFhHY3l1cmg4Mi85aDJhbUJ4bXZoOFMyeVpCbTZybGJj?=
 =?utf-8?B?ZmorU2lPU24vK05zWEloRWcxckZjbGc1MEZmZE8xbUFtUVFUdHVjZ2FpTHFN?=
 =?utf-8?B?a3M3SmhPYjNicDhrUlQzL2h5Yk5TR2oyVEQyaUJrU1ZEM3FRT2RCMDI1UkxS?=
 =?utf-8?B?bXQwZ3Z2Vko4YkNjUUt4OVRZTEVKZlVyekM3dkRrcU9ES0hRMEsrRjJWRFlo?=
 =?utf-8?B?U2FmWWdWT1VMYkkwREtKZEgxeGovd1pXUVdzRnFGUGdEMDJoWmFqRmVHaFpq?=
 =?utf-8?B?ZE1kMmRkMmRmSjlmczAzZmRPM0pqNVA0bndXYU82TGZob3hmSzcyWU1MdUFl?=
 =?utf-8?B?aEp1clFjZW5CaXlxZnVRVnFEWXBDQ0dRalhTN1oxVktlZ295YnRTdnhLNmxD?=
 =?utf-8?B?L1dJNUVyY3UrekVWRDZZR2xnMng1MktJV2RVcHlxT1JJd3RCNC9HTEZWM0hR?=
 =?utf-8?B?SzB5TGt0Y2lycFAreDBXdzBTY0Z4RVpkWGJuUUNJZXBLdkxZQkh4UmsxVHUv?=
 =?utf-8?B?RHNaZlFkRFFKSDNQbXpNRDhrUGR6T09aSlZ6Tmt4YUdla2x5b0ZVSWhWU2pi?=
 =?utf-8?B?R0Z3b1hmL0FqSkE1RUIxajhIRVlkVGcrb2tqc2tyMUpCNmVRczBQU3dUUitx?=
 =?utf-8?B?UGZUUk8vUlBnWnFmcy9SRVhSOUZoNDluUitMelVLV211QzBuY1NPc2xxd1Vt?=
 =?utf-8?B?RlZtcGR1Wi8zdmwvSHpxTEdJVm0zSFJRN1R1QjFrWXlmWHZkVHBOczF3YW80?=
 =?utf-8?B?L1NqdE15QUhFaFZ4Wkh6QXg5MnRaZmJZK0tKUlhkbzJFS1RVQnBncXh4ZHBT?=
 =?utf-8?B?QisyM09INHk5VGFlWmtQazN2UGhKWU9zZkY4dzlHZnZ3V3FjTmRydEZlQXM3?=
 =?utf-8?B?dTNGcHF2NGlYWCtScXlFcE50U2RzaThRRnB5TG80UjBXN3FrY2kxZG0reHdK?=
 =?utf-8?B?Y3NWc203WUpJV0trZFV5MHZaS0owSnlrNWZhQkNnYXQ4Ny90OWJwODNzak5r?=
 =?utf-8?B?bllZa2NHWDZrS0U4Z2taSE5SRWM4OUthcndVS09kN2czUWovK0JhMUtSdnVq?=
 =?utf-8?B?ZGpFYzdBczhjMjlpaDRzMmREVHFsVVJERi9lOFUxbEpNbHdQMTZnSkxBRjE4?=
 =?utf-8?B?MXVmMHF1eUVWdUp0WWZseDgycVNvYU1zMTFhWmlJREhpZS9aWk1SdWRqelh1?=
 =?utf-8?B?VWI1TnlMbUxvbDdnTmtmYVRtOS9jeXQ2NVMzejEzOU5EMGlJc3NIS0cwY0k3?=
 =?utf-8?B?SlZ3NnNtUzNDN08yKzBXUS9yYkVvOHcybmN1cTg5RWNaVmk1dEl4d3E4WEt5?=
 =?utf-8?B?SGx2UVlsWkZ6Ky9DUU9zUHNxNnlXT2Zuc05abUErYTBtSWhmcUF1by9raHkw?=
 =?utf-8?B?b1FnQ3pQVUJvSTJzVkdLSjh1NlA4OGVubW1FVHRPZXhrK0svV3F6K0JFVkhQ?=
 =?utf-8?B?dGU1YTdheCs1VUpwL3oyVmVZWTVCYjdVcGQ4b2ZxbUJ2QjZZVHFlMDZuQXFN?=
 =?utf-8?B?M3Y0ZFh6SG96enA3YzhpQkZxdkt3S2w5UU1aR1hHYlhKSWFGbjJ3a3lFNHhG?=
 =?utf-8?B?VUdrVkdVVVBXbnNvYmZ5RlYvMGVVZktKeWFQT2R3N3lsRy9xdS8wdkVJcDBp?=
 =?utf-8?B?SWVkbGZONERpWTJFWEtvNW9GTVFOVmNEV1Y4U0tib1VwK1JxM201NzNMR3A3?=
 =?utf-8?B?Y0pqRXVscXRIblJYdjl0Y3lEakJMZmZ3RnhPRU9CdjZRSE5iZk5xSlY3b3pM?=
 =?utf-8?B?QW9aY2JjYWJNYnMxZVFneHE3RGk2a2piQkdKbHJ1ZzFidlpIVlBUMi96S3pO?=
 =?utf-8?B?MHNlMWRuUUtxeCsyd2RDdzJrOXZWbFNSSG5acHZsU0U0bzVNaGdpYzBRM2lq?=
 =?utf-8?B?RVhwc2NxeXVPNEQ3ZlVDaWxmaGFaUzdtbGVPcm8rR0hRYkdQY2I1alU2WnIz?=
 =?utf-8?B?TkVMdzNOR1EybFhnNnpZMTN2QkVZTUVOUm5GdWdKV3FSNVpEbGFRdUVPZ1FK?=
 =?utf-8?B?ZU1meXdONzFJM2Zia2FCUHpEbG5OSUVnOGgxNHBFbTFFTkNqcWx3dUMyTG8y?=
 =?utf-8?Q?5w7sNeXeenyiBk9l0n0xzUMQ1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb51a40a-768e-4731-95f3-08db82d67cdd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 12:49:53.3464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6uRqysDkonHIsM8X1ktsKTE80+wC3e6UilSrMWGLLhO2IFmG5/0UsJxWvk3OivI67ao/dReSokvLTIiRNSbGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9808

On 11.07.2023 18:40, Roberto Bagnara wrote:
> Mandatory Rule 19.1 (An object shall not be assigned or copied to an
> overlapping object) is directly targeted at two undefined behaviors,
> one of which is the subject of 6.5.16.1p3, namely:
> 
>    If the value being stored in an object is read from another object
>    that overlaps in any way the storage of the first object, then the
>    overlap shall be exact and the two objects shall have qualified or
>    unqualified versions of a compatible type; otherwise, the behavior
>    is undefined.
> 
> You can see a number of definite violations in the X86_64 build
> at this link:
> 
>    https://saas.eclairit.com:3787/fs/var/local/eclair/XEN.ecdf/ECLAIR_normal/origin/staging/X86_64-Set1/149/PROJECT.ecd;/by_service/MC3R1.R19.1.html

Hmm, gives me "Unauthorized".

> As the rule is mandatory, it cannot be deviated.

Which is odd, and that's in turn because the C spec is overly strict
imo. Considering the one example we looked at yesterday, I have a hard
time seeing what UB there would be on little-endian hardware. Both
fields (rip and eip) don't overlap exactly, but their low halves (which
is all we care about here) do. With this I cannot come up with a way in
which the compiler could screw us up, even if it wanted to.

Jan

