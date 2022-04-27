Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5BA511216
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 09:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314439.532500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njbqH-0000ho-48; Wed, 27 Apr 2022 07:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314439.532500; Wed, 27 Apr 2022 07:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njbqH-0000gV-16; Wed, 27 Apr 2022 07:12:05 +0000
Received: by outflank-mailman (input) for mailman id 314439;
 Wed, 27 Apr 2022 07:12:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njbqF-0000Lx-C1
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 07:12:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 561d86c3-c5f9-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 09:12:02 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-7o_dKtAfNoWfR5-OsPqdOQ-1; Wed, 27 Apr 2022 09:12:01 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB6334.eurprd04.prod.outlook.com (2603:10a6:803:102::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 07:11:56 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 07:11:56 +0000
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
X-Inumbo-ID: 561d86c3-c5f9-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651043522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+Itu8ukV/UjIqOAoynxGEAGLz9QbPd4mNuWdPdhqkY=;
	b=S7+OnG8ZBnnvZuinEf1Cd6JIhvItwCRFo4B/RRvdHFZ/K2S7k8dhOyZ0Go62Ji8JxeB1M9
	zHc/J3MNLL58F6YkpdkG66ngWwPcv+msrikXr0EGbUyA91GE+jHNT83PgGHDIgMyZu2/aL
	T3gFe6mqMlzF3hVgQc3nlRzCngYfgyg=
X-MC-Unique: 7o_dKtAfNoWfR5-OsPqdOQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgGEMVaCXbKSkseTH0hmcDOoB5xLnTWfV1qZb/PPkhb2WvpX0yYZJTlMB3FiB9i7az5xxnQe3VM/XZaCViehn/Ofs6AUJMRO15vv1dAIYNJ60CuOX4OHaaJoxO0pvmRa3p83GUzerBiDeCmF9kXGopAze9Xtvm/Yfi2VpUMOSQ2wZqrUUdHy77wAt+2eMP+II/zkFTRIRKiHLwxc3IzBCaadlvMue76nuEYO1YDZ2ciegc/luWeqyWskPc23M68M2YArOJEz6mPo2JLpmHvZEAITk/f5fy9Reec9byc5Gq7dA7Kr4rZE3spflIIIhYQe2BX6VHSAoPIN/OYJjQ6yJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+Itu8ukV/UjIqOAoynxGEAGLz9QbPd4mNuWdPdhqkY=;
 b=drWLndu5vYgesZOLyCY6/NGmZKjLZ2hJujTRFB0I0gsGZJ++wZv2lfNLSBqV14gBWWFqN6uH4bmKEfnTOaHH6KoJXQRhD9rTrfnNfhmpLw4ac9Sn9onR3OkcH6KQso+0Irip20tODG8IYNxK5qebubZ2GSqMeW6n7RFmsap4UAE0BxPjGDOl+T6lnfDINvR2EJULSUyHdDjxmOVKpNbKuYwl8Ye28+pwkQqJwqFcPWxcBQBXCqouaaF4e+tYXvykbLz6f0HVD3YQf8AqdXmpOhK3o29WAcdpAH4Op4RGzR/8wv9Gx1yT2d6Q8iHArPjketo/TRyEFRAqw6J8jsZKoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f2fe0788-ff74-b5a4-8714-e4eed4d73f14@suse.com>
Date: Wed, 27 Apr 2022 09:11:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] xen/public: add new macro to ring.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
References: <20220427070309.15090-1-jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220427070309.15090-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a5b3f9e-6675-43c9-f7a2-08da281d36d8
X-MS-TrafficTypeDiagnostic: VI1PR04MB6334:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6334A69F9EE075CEA48608F5B3FA9@VI1PR04MB6334.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9c8geRuAXd6ti7vZ/5tty/z7DWMuMY65xGy9Fo6R6iQ7hJ+4hpkgQu4aDLQakOjMhD+gTL+Gh8OO8wP3ubuyc8sTa5SN/rzGMJgckfjocPIIpsnuPMNI8b3tLPUYTXVKhpwww0vh/sZq0JqDfUAkgr45l2p0H/F2hOHVZvljdFAj4/z29uXzedT+ocQx3AVRc2TsBWm3vhrYluJpXZPaPs8vuKtH/arTozZd8FWajRfrR9MaucWc4M6x/cKt2TQusdi9qquCm32qd+DXmYNZGPoB53cKME0wdIt3jM2Zmew7vjLMtChFS5Bygz9hETakSqe5bGe0gRrON5wqW16Yn00PDTDZ6XF5Eag/AKtKM5kiFrnoLu8aPiiqbujK9YfrvOQPFUkDAcSKQYZGGjZW5BdjNUAfR8mx5YhfOhctCfH72rbFFlnnqqLJd9L/lUOQNV8kjZknG3OnovBemoTL7TIGKG4Cq9RIgsYddO5eiyABR3f3v0eHW/5gmTZ+fuNfrF+iKlTk+aAFl2a2Hd7jN6DixIsA/rDsyBX9VBLHh0SVt7C343eXOoysK+D90U+Tg9JmZBSfs9JPxZmp4b5xIjiX18DUa/Rhj6gKfOUK/nX47pzD8y5jxnwaZitIBEyD8OUoFsvxLkTM2kw4xQKvKzfcHAglBXV24dZoCtyPY1Jo1pVKt9oo2u3GUqyx1UIu9FMkDy0mgUJrOFbvVPLbsvZ8fUwnwWBqTtbqkUanquyY0ZotL/vW4rnnz8xct44F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(2906002)(6862004)(4326008)(8676002)(26005)(6506007)(66946007)(53546011)(66556008)(66476007)(5660300002)(38100700002)(186003)(31696002)(316002)(6512007)(86362001)(8936002)(6486002)(36756003)(37006003)(31686004)(6636002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGlBTGVHNVp1WnlwUld1MENCS0pXU25Dd2VBQng5SXZvaXFlTDdQVmxlWktO?=
 =?utf-8?B?eDBWNEovRVE0SXNwejlHMThwTzEycnJaMjZrUG41YlBDSjVjVVltamJTVkVr?=
 =?utf-8?B?dndqNnhmWjlhMDFmeXNlNDVUdDYzQ2Y0WmI0U0VCOXZYbXZiTDdGUGV3T3kw?=
 =?utf-8?B?U0Q1Z29RN1cwdVBNRHJKWXkxSzJCOVl6QXNVbEJxZUZsUEdFY3BxcG9JR0FR?=
 =?utf-8?B?OWJMVHNpWmhueXdIRStLbGZGRWloUG40WEt3T1Z3b0pFcHErQ2FwU0lrVWo5?=
 =?utf-8?B?UWJRL3pqUUVoTlIvekNiSUVjV1c3MC92SkpmdDJNdm1NRTRZSllreFhBTzdQ?=
 =?utf-8?B?UWo5aHdTSmtnazNEKzFvUmlnc2c0VmNwTUZQSGxJQmhaKzBzWjlBeC9ybEVO?=
 =?utf-8?B?UTVjRUo4SFZNSFpRVi9HMG5GZGMwcE50ZGhiNWlCd3N0SFFSYWhpRksydUZV?=
 =?utf-8?B?aFQrYlJtQmtsY3VKZHYzTThEa2xOYlMyMEczUTVFL1FSZXNHbXJtalhnM3hT?=
 =?utf-8?B?bVlObFFwMlAzYitPTmh4Y3hGaXNjT053THU0NVFxdHlFZWVqcVhHcEtlWGxZ?=
 =?utf-8?B?dWpOUkRNUzFuVlh3U3BmRlR3UVhjTGtXQ2M0MjZ5MmZNUURxUEgyQkxFN2N6?=
 =?utf-8?B?VFhCbVRtMXhDTGhhanBhaVdVUjJCSE1Vam1WVzJ2WXoyRzhpZHQ2STJXQ0Ey?=
 =?utf-8?B?bjVyWXhYUmhqaW9qbzFXbmdLQmYzUXNiNEo5cy83RVRhQ3F0blRtZ1hhOWJ6?=
 =?utf-8?B?bFgzamhsdFVFODVLc1llQjRSSUtJSU5ueWI1Qk9iTWZyMUxEeEhoM2JxN2Rl?=
 =?utf-8?B?c2NDY2lnT1J1S1daVTNDVXN5QW8zanVkNlRpKzQweWozQlhJaWl2bk4vSzNO?=
 =?utf-8?B?c2ZabnhxdkVXcWNhOHBQNitOSFR5b3ZnTW03US9uTjVoeHByMCs3RFREbmRE?=
 =?utf-8?B?QWdFQ2tNYUFlb2FUY2JuaFVnTXpKRzhWKzB6d3ZScmQ2L0VaNDZ4QkFqMnZr?=
 =?utf-8?B?UHFMTm1WTXhrZktQY0VpczBCMzUvdXpOTWlLVGtLalYrOVhDcHRvblB3dS90?=
 =?utf-8?B?bGtKNUNyeUdjZUNHWHRvM2hjNWtXTFYxUEJ0L3RDcU8xTHRYQyt6MzNDdkR4?=
 =?utf-8?B?Q29ka0M0SzdrZlZ3QzZwMUQzcW56c3FEa2l1MHJ0Y3I4Nkgxd0NUcjBCQmZ4?=
 =?utf-8?B?T3p1Q2NLU2h0QXhHNXFmUTJQZ3orTStPdXA5VlVRaUZmNUJ1c1h6bDlqaU4x?=
 =?utf-8?B?aUJHMW51SjlZQjh2bEl2U2FIenFnOFY5K2JsRG9oNmJHWGRmckxwOGV3TGpp?=
 =?utf-8?B?a3hjOEtSaWdzY3UrUGkzNHVVcUh3alRpSzlBTmw4MlBiR2tjdXhaMXdHbGg0?=
 =?utf-8?B?R1BQT1VyR0VCS0hUTnNjOUtxMmtSVjRzSktmbHp1YkNKQmo3aC9BN0Z1bmtq?=
 =?utf-8?B?WTNMNTNLL013bnk3NzJYMFZzZ2s2MkZnd05rejFROXNFZmNjU0xSQURkT1hL?=
 =?utf-8?B?YlcyamZ0RzJMczNVSlV5bzN6ZGRXOW8rcnpjcW1NVmJjNGpuYnNPTDBqMzBP?=
 =?utf-8?B?ZERuajUzV29qWDhlYWxVWUJMR3dUb3RqTDdYaUVTQzFqYTZXVEY1T1Q4Yk9N?=
 =?utf-8?B?dUtITWlDNCtpT0FucEJDUDJQajBsSW8zQmFxTDZvYVRKbm0vOXEyclVNM2pV?=
 =?utf-8?B?a05SY2FCd0lJS3pNQ0JvYnhzTmNMcmV5Q3VOUlVocmtidlh0MHNyYmdpM3dm?=
 =?utf-8?B?eUdFb0hOL1dwWFAwbGkwbFRRQkhRVjBqRUxVdDN3QkNQR2J2VjE2TW9lazUw?=
 =?utf-8?B?aVQ0UllMZklNdjcxR1NNbTRGWW5NRGtmR2RSQ3poVG5jV05QY2VuOTRNMnNT?=
 =?utf-8?B?cU1pclZHTEZCd2M5SzJlcklpQ1JtN3dzbTEwWWJrY2lqYW5rVlVVdEwxcTJP?=
 =?utf-8?B?ZFpsVGF2ME5FOU5IZ1ViZDlWZkRtMUwzSkl0RVZZSDdJVm1GQitXTTlvWGtL?=
 =?utf-8?B?ZkMxSkxSOTZ1RHpaS2I5MDN6ancxNHZvQVpWdUNIRzNlYUpIQXJjT2pUZk9X?=
 =?utf-8?B?UzIwdDJQaXJrTG1Sd0JLNkNlTDFLbWxnOEJraCt5ck1nNG1jRVpNcHpxMlRw?=
 =?utf-8?B?TUl1Mlg1UzJSUjFqYmZja1hXTjFxNU8zYmdKbkljdVdaRjNSbUNJQ0FiRTRn?=
 =?utf-8?B?TUI4N25HV0V6T1djU3YwQ1Z2Yk9yTXExYkNxb2VtRDVxZEgrYTh0SWdUZFNn?=
 =?utf-8?B?ZUg2Q1duRHRlaFMxQ09pNWxjbFhXMW1XTC8rMUxhYXpkcGJ4QUdHQlpCeEhx?=
 =?utf-8?B?Nm8yK1FWS1BrT2lLS3RSZjYvNnFyQ01XOXBsdm5tTGpsZUV3dWpHQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5b3f9e-6675-43c9-f7a2-08da281d36d8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 07:11:56.7260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnGxW9ZKFVe2bIOxFHQEhRRe9s3diBtNQni/I5Dm4iaq4UFKBZ6TI43WGU+leUY/BCVs+H13gKtr22fGCkH6Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6334

On 27.04.2022 09:03, Juergen Gross wrote:
> For the initialization of a ring page by the frontend two macros are
> available in ring.h: SHARED_RING_INIT() and FRONT_RING_INIT().
> 
> All known users use always both of them in direct sequence.
> 
> Add another macro XEN_FRONT_RING_INIT() combining the two macros.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/include/public/io/ring.h
> +++ b/xen/include/public/io/ring.h
> @@ -95,9 +95,8 @@ typedef unsigned int RING_IDX;
>   * of the shared memory area (PAGE_SIZE, for instance). To initialise
>   * the front half:
>   *
> - *     mytag_front_ring_t front_ring;
> - *     SHARED_RING_INIT((mytag_sring_t *)shared_page);
> - *     FRONT_RING_INIT(&front_ring, (mytag_sring_t *)shared_page, PAGE_SIZE);
> + *     mytag_front_ring_t ring;
> + *     XEN_FRONT_RING_INIT(&ring, (mytag_sring_t *)shared_page, PAGE_SIZE);

... I had hoped for the original text to remain and the new macro
being suggested as a shorthand. But you're the maintainer ...

Jan


