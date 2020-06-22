Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A920383D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 15:37:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnMdS-0008Pa-1d; Mon, 22 Jun 2020 13:37:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnMdQ-0008PV-Me
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 13:37:16 +0000
X-Inumbo-ID: 7c0f1d38-b48d-11ea-8496-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c0f1d38-b48d-11ea-8496-bc764e2007e4;
 Mon, 22 Jun 2020 13:37:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luoqD8AUmefMtjd1uCfObt8rOR8iOYE1AdTTaRgrF0EyJpBteLvoWm3/QqbNbK75ahkLOXfZrLF4dX20+03sWYiPlQv0CWgvhpPhK3imaoBOg9Q2MZV4IZAcjoJ6TUmbOT6EGYMaUSaj9hrsw3XyFCfkOuzzh+a/XhiyMMd13XA9QFdDfQWScorhvaUJeFOxankM2UgISref1lfORoXn3+Wof5ghI5Q9xiXvQNYKV0WQ5U70LdrXLJf3ApoJFr7W8biWvztlYTtTVCrsHXtaDH+yZNc/0nNuozNJmKKs6ls92Qe9p/4VBBgzxZeXf08NUcArfCW+yAHfjYQclkRdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/XzEBPQQXzXR08MRCb0HnUC8pEe4WsH9GVfgMfzLyg=;
 b=LIbNbh9jkrDW15nalNhKHGFHmBBqhTRY7yd4/5P3Ixvwnj79WRmIExW8uVS28S78SGgq5LS9CHHLB3k/PFxQbj3B067tq/omj61CNM2ndwXc+K3fwaCREZp9WCYtlcP1No5Ex5qLLhNTYiuWYhp9EuACpCmxmupCiAjs146KuB3EmREP3aOSIwZ4Js/7Mbzci+P8KiE9Lp6xU8fuBiAXZgtyn5wxZbGnqN6kLl6LpYLKwQNXzs7I7L+IILzmmk+jl5wPKMSlzeoz/S3mucP4/B8jxdcv/D4HPhDn8cruIaZmt/ZHEO2iMabtIwOMu4uMu4oTK/26V34cCWO0uwwjTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/XzEBPQQXzXR08MRCb0HnUC8pEe4WsH9GVfgMfzLyg=;
 b=jK0VaHuuROzgjCLf8HTZA7z2/RMnu6AV/6i9oyI5TNqYyjDRo5oWXg1S1Xcetreds/gSCQp3p5OdDswIqDRMfA8ZnOW3BCNfKanmFIucK2bP7sOVRwAnLQ4cjBywIroYqguH3LvLGIRxoPll0qx46KhcYIDOmYlzKomtwWzCxXS30IlclXjcissempzNtefConUbicIrwVFiX3ycFRq+4M7fMJ74cX5PE9nP9HHQ7FOo8CBDpKQyK4VN2Xr77RVUYTiQc7sOXUR7b+jDKK3oTJLBqoqPAo/JPIhxte3XbdpB+Chme3sn37gwcFJlueEtv3ZhK+g5ddhYqIN2qzP+iQ==
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4815.eurprd04.prod.outlook.com (2603:10a6:803:5d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 13:37:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 13:37:14 +0000
Subject: Re: [PATCH] x86/CPUID: fill all fields in
 x86_cpuid_policy_fill_native()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <41177396-9944-0bbd-66d2-8b4f2bd063f0@suse.com>
 <e4d644e6-7481-0a66-379d-509c57faf4c8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ff39ac65-70e6-c81e-dbcd-bc38a78b4e4d@suse.com>
Date: Mon, 22 Jun 2020 15:37:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <e4d644e6-7481-0a66-379d-509c57faf4c8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0101CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 AM4PR0101CA0052.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 13:37:13 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4333c71e-a0a5-4146-e22a-08d816b15f84
X-MS-TrafficTypeDiagnostic: VI1PR04MB4815:
X-Microsoft-Antispam-PRVS: <VI1PR04MB481516B7D787FA11152706F8B3970@VI1PR04MB4815.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CzTL+qleB5I3n0lpDmCfJtURlYQ0ZAtbDQa0rkSu9/eMU0LNCvGlSwsxAciBf+pEmxq06YcmAYwmQQHOkTlO0H9Dg9nvK3cB86QX+79X0X918vFq/HIDrsxs6yQtq+5/fpX31XIvNu23a5z7Xvh96spYpQXkjTMToWoI8LcpQG+5IZS+xpo3H8GO1VKY8yAoFYuW1fJ/nhg73jcUSq/fXTmzv1P8BRhsBQj7EEDVk5GPBIV1tL1HmDtHq0gbxwGZhanEgifErNkRLsBWOutNM6pvJwkDQyn3t1pc86aM+/XCviuM9lMUg5GJj2b0nmaxFarED5Ey7wFiX5pHhl3LPX3Syu/NKllKR/l/Ebd0Sc7vJ1AtG3SuzmphRw2o9/x8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(376002)(396003)(366004)(346002)(136003)(36756003)(16576012)(54906003)(316002)(6916009)(8936002)(8676002)(956004)(2616005)(478600001)(6486002)(16526019)(2906002)(66556008)(66476007)(66946007)(186003)(53546011)(26005)(31696002)(83380400001)(5660300002)(86362001)(6666004)(4326008)(31686004)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: QVQE/3a2AlpkguwxC7U4NEkZaG9ajniF2qxkphJJCe9lPgSHmP0gHh19Sj5zdvlLoVOQC58NDWH7D+rEd8pA7HGvsjjAhh34CUZMT0hdM0lJ7x9LVocBFwsmST75pRqRF6QN8Oso5FFsC3VG8Vh6xXfPIjO+oJxI/3r6PtvQPCwDGVr605hgsNSwx9VsBSHwIe+iyO6qagAW1E8RCIuVfBV8FCmQEuG3KKQem+fGXCa0yYaYHq7fnMTxROZ9jBAp1wn36tWFUWOfC/v/ASHFRE4nK3G1e/3C6O17zurHU4mcxWoxgoEEvkl+EHzK7DUpP+X9bS+BSaOgFDAC6cd5TSjERoXzuxWz8jZyg8MI9KX88eUwgiCVOYvF6up4ByfTvuwGb9zLCVdCC0vGXwWwAzBU5a8vHxoqO0uNqcPJCZ9Ej7UC64o94tuzUAzScagTEmcKYWsRpS4fVJiffBdakcPlSHOLTgMRooyk/YchJwY=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4333c71e-a0a5-4146-e22a-08d816b15f84
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 13:37:14.1970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEpqwubYWGOXUK0F/5sXkiZsg2C29xAv3K2xAQryUgrd2DMYoImfGh3JwCukuaAypB7MmjD9m12O9fn63DIv3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4815
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.06.2020 14:39, Andrew Cooper wrote:
> On 22/06/2020 13:09, Jan Beulich wrote:
>> Coverity validly complains that the new call from
>> tools/tests/cpu-policy/test-cpu-policy.c:test_cpuid_current() leaves
>> two fields uninitialized, yet they get then consumed by
>> x86_cpuid_copy_to_buffer(). (All other present callers of the function
>> pass a pointer to a static - and hence initialized - buffer.)
>>
>> Coverity-ID: 1464809
>> Fixes: c22ced93e167 ("tests/cpu-policy: Confirm that CPUID serialisation is sorted")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/lib/x86/cpuid.c
>> +++ b/xen/lib/x86/cpuid.c
>> @@ -176,6 +176,10 @@ void x86_cpuid_policy_fill_native(struct
>>                            ARRAY_SIZE(p->extd.raw) - 1); ++i )
>>          cpuid_leaf(0x80000000 + i, &p->extd.raw[i]);
>>  
>> +    /* Don't report leaves from possible lower level hypervisor. */
> 
> ", for now."
> 
> This will change in the future.

I was pondering at that moment whether to add it, but then I didn't
think we'd want to let shine through lower level hypervisor info.
But yes, I've added it, because it won't be wrong to say "for now",
even if it end up being for much longer.

> With this, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, Jan

