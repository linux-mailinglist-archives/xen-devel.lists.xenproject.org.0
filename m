Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AF3497A70
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 09:41:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259750.448271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBuuH-0004tl-KU; Mon, 24 Jan 2022 08:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259750.448271; Mon, 24 Jan 2022 08:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBuuH-0004ra-GV; Mon, 24 Jan 2022 08:40:57 +0000
Received: by outflank-mailman (input) for mailman id 259750;
 Mon, 24 Jan 2022 08:40:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nBuuF-0004rU-Qq
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 08:40:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5782cd48-7cf1-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 09:40:54 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-o60dTjObNxOR2ABwvfB9sw-1; Mon, 24 Jan 2022 09:40:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0402MB2696.eurprd04.prod.outlook.com (2603:10a6:4:a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 08:40:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 08:40:51 +0000
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
X-Inumbo-ID: 5782cd48-7cf1-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643013653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxx6atfFd5k0JsQH8AAEwYCnCy5pCATTJVzFVmPKpxg=;
	b=RRfiSOTI5BodSzDTwqgSRZ8GYkRh2MuKkUlYWnFP8pBLn85mRBXjGjucYhqX9bNyEzqXTq
	RQKf2yrs/t90Vi+yhI50Z7IBO2WS+UmDKEtUOU3h0fd8sHuatsyMJEK5plM0Hlq41at3/k
	JI+sdqBbO+1PXiSmamfWle2VJI7AoX8=
X-MC-Unique: o60dTjObNxOR2ABwvfB9sw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEVq3J/UAAIiLhsaTOxMhwrfFdZ2MXeQFQPjznlEKdSZ8JINDebWr3KA/TTJmfLN/bJN36/L7cXH5Og7eUzYdA6JLX7fSv7IeODdryLwPR0Jn69SiumE7V+sR5SsdkpylRihVOer0bM6Wg0KTEuP2s8wSUOg8WUfB1lfW6gnI16CsQ6DBvNprAxv7ibCwFNy1l4Sr/GTfVvrDjdhYwZPQhn5qInpHV0r8ATN21488ogU0f/t8koEo9xIpsENPlncTYA9w4QhOc9NJeGj/gZle673YYgIOg+JUKibqt7rGgcGd097FipDGcuOookeheEx3tibh+MASN6xHYeSBRpFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxx6atfFd5k0JsQH8AAEwYCnCy5pCATTJVzFVmPKpxg=;
 b=UpRuk4T/hB9a0wFIsq8Q0jVRBRLzRjHZtcsrZukpg+Qm9fcevpEs62wIj7sMc0TvZtwNByp1+J0ppygNoJnwSkG5AL1D+iaDsxGkXL0W5FJHDQND7PKnS9Er1i3b+tl32iAeK4XuNXlF3Paq20LGiQFwpEcYg4Y6LZjiG3sFphfYDTt7T39bsPKt2j5wJw0RgDfkNidbIL4ZpfaxdxwHiUKiPmbrsr/ftqfHY/QGssKh4osvFK7zShyzJkd9Tbd9CdRVTZ0AEm6FC8xaZ59Mb9tkIMg10WbgJg9nu6hjNxAe3Kd+rGjU8pTC04FQ4IpdGdb5maF5oGWKzRJZfd4LWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9497ff64-8fe3-5d5d-303a-2d9f8709ade3@suse.com>
Date: Mon, 24 Jan 2022 09:40:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Debian Bug#1004269: Linker segfault while building src:xen
Content-Language: en-US
To: Hans van Kranenburg <hans@knorrie.org>
References: <2a095341-a727-23d1-2dce-dd9caa72c920@knorrie.org>
 <798c8459-7f28-c081-15bf-04ea94e8b711@knorrie.org>
Cc: 1004269@bugs.debian.org, xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <798c8459-7f28-c081-15bf-04ea94e8b711@knorrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0086.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 682f87a1-6fd9-47aa-465e-08d9df153a23
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2696:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0402MB26968088445D1027C48F6053B35E9@DB6PR0402MB2696.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CQgGwU3XpLhEzlT6hraRj9K3YGiDR5h8on10nvd5Vb8XcEzqHQcenNaC+1SnTboHZpLdZGPx3UVQkWH0gaYdGx7y34Gj4zWeZxWzbvV3Qc2OIQAqvwtlkZx1AZtV35eThSGzWOWMagfiYsGzX3qsh6XbTYt88wiX1d/iWqC5T+3cmRsy5kX5O/tEelsxaBBqDXG+dFD5Ag+1eMNCHRcoaEDTuczJhnNP7f9MJhvKgFmbSo1WkeZVVovhhmRJ+OfwXbekU3Kr29IurAAYVwaXzdlPZza7y0rmpy5TJUW/tf+yhkSoUdUFhYh4Tlk37OjZc6Tf0GayHp8ibNyufXdV/7hih+E6r23ZeenOwed7uvjRUN3a1ESwGmSF8+qeIqP5c4SRjC5OWi2i9860b7nftoXVTJmvVXdYSuD7zVjJ/DxX4cxbLYqjHR/VzdHr//TE1FRJR8ZJTmrHJWf802OnCscjVsIwOkkeTYKavQl50to2GlyEhPlAKg7bhgyNFx7OGB8z3bNbASr9l1QKwzh3SJd/8xIPOk4bJebp9oDw8guaRrXpAc7Dw+d6XTc4fd/Ev3wiWNYHZ9kP9WJ4JGO1Ho3WIwK/FXEwhdY6xxM5MzKYFO3IS8CObY7lOOya28VSmHY79qB4Q8nEzFvuqQvKWgQIIRsGFNEkCIBz7tWRMn9xOaByK6xDazvv/TUONx3R+NFrlvujaI9sKkJYzIqxhDjk2BvdhajoLJJC+gcselWL9RnY4EBlMCF7YVEVIdQ/1fhSwi3X3VFjPWIEFMeLFKjgzSSHYRj7w0QXPISbnHAix6AMEzv4Y3VCfaB/G2MQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(66556008)(38100700002)(66946007)(66476007)(4326008)(86362001)(6512007)(186003)(53546011)(26005)(31696002)(6506007)(31686004)(2616005)(5660300002)(2906002)(36756003)(8936002)(966005)(6486002)(316002)(508600001)(8676002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmZaV1JmNmN5ekJULzU2TFduTFZRa1hxbjZHaTdDenlHMDQzTHUza29rZVIv?=
 =?utf-8?B?V1BBSCs4ajkvMDYvbjJyYjdQMndGSEt1MjJQRlNmeDljb2U0dlJnUUVHaVl3?=
 =?utf-8?B?N25ISTAycDVOUGxwOGQ0Rnk0VUlQNGQ4V0ZMSEhBbkd0QUhkTFp0Z2Z5R3Ri?=
 =?utf-8?B?NDBqbHg5UVI1TG52K1RVTk9xTWpGUVMza3FyUHhTNUdIMkcyM0Q4TEx4dEEr?=
 =?utf-8?B?N3czdXgxSmhQU1ZQc0RzZlRJamFneU44bnJ5UXNKa3dsRzd6d04vZjlJb3V5?=
 =?utf-8?B?OTlxcTV4cmUwM1F3TEFoTzBSMC8yK2NRNVZ4LzJNK1R1Ynp1SlFwd0JqODc2?=
 =?utf-8?B?bDdUanlYNzNYUlltWXE0T3lJdFFyRU44SjZYa2NJblBLVWdyWi9rZU5Oa1Z4?=
 =?utf-8?B?Y3Z2eEk1SlhSSDVNWnovdFRRSkFNNkZCa3pER2llcE0xS1kzR3hxQTVaQjFj?=
 =?utf-8?B?MU1LeHRzR0I0c0diZkFkY1B0OStGQy9KK3pUMzlqM0dEL2FTbWswNkkxcHNI?=
 =?utf-8?B?YnNsWjkzM3ZSWEgwci95SGdHaXoxKy9TYmJ4NnFYaFBRWGY1Sm1TRDluM3pv?=
 =?utf-8?B?b2crVGZrLzJhRFhWNnJDMUJhRmZPb3ExUDVNWVBHNmJHSjBCL2Q5dnRKTGdk?=
 =?utf-8?B?cVhIN3gvVUJ2cDFrNFpGd3hzN0FEdjVXNVkvZzZBY29FcVAvb2NuNGFpNW1T?=
 =?utf-8?B?d0hKK2k0T0o2RUs4UnJhQWU3R2xxYlM0SnhOaXJRK2ZkQzNnVnJZSUV5WHVK?=
 =?utf-8?B?UUhtM29yRi9iZUVpVXROcEV3WHorRmFUbjhjUFBZODZ3VUFnMi9ja2NRaHZo?=
 =?utf-8?B?UjFNUU5pMTNLYjhtUnY5dHZIWXkwVmt5N21ENGlxaEt0RzhNQmtUR1d5VEE1?=
 =?utf-8?B?Qm9Qak9vV2Z5dWUyV2ZVQmFpODZjODZPa1l1NnFqaFJOc2hLaExiWGhBZ29M?=
 =?utf-8?B?K084aGt5cUtEb3AxK0R5RllDZm9IZHpKNWE1TWtFWEJhc3IvQmFVNWxKYlEy?=
 =?utf-8?B?NU5LNEV3a1ZwSkV6c1lhRlBqVjJEU0NkS1c0RDVodVp6NkQ1RmtIWkNGUS9H?=
 =?utf-8?B?WXdyL0x2TXFXRmhweEgwb0I1K2NlOXRTTDZyblJpN3ZEaXpmQjNvTklGamFq?=
 =?utf-8?B?SG1zMkk1ZWo4NzFTRnJJY0lxTVprY0pOd3RWZUdFb1orUXVGdkphMVU5eXNv?=
 =?utf-8?B?ZkUwU1FTMWxXazdYaW5DQzdlVENKMVlwOHNFRXZwWWwxUTdhdXJWQ1c5ZFJh?=
 =?utf-8?B?UHlLMXNWdHFCbXhEa3VucFdEWi9OamZpTlc3Qi9naGpVMk43RGtkQ2FoZDNo?=
 =?utf-8?B?REdnR3o0RFp3ZmxkeDN4clFZRjlGVHRMS3hYNUI5QW5oYnVvZkh4Q3dUd3ZQ?=
 =?utf-8?B?Q2lST1ZVckVBb2JWYVM5RFF6S211VjFWbHBwT0tsWmhKVEdxY3B6RVNzR0RC?=
 =?utf-8?B?eVhJdkcyMjBQVnVXMHdheVprbVBlaVZsdXRZK28vUHYwR2w4bkdMMTZWbWJM?=
 =?utf-8?B?VFlyS0h6RURsZENVS1FYbjdFdTBjNVRlYUxLa1VPM0NtOVBwdHFCUmdpVXM0?=
 =?utf-8?B?YmdZTUxaMHJGZEJSaW5wZzNLRDhkT0F0c1IvT0N4TG9kK1N0R3h4a1hrSHZR?=
 =?utf-8?B?cnJjVUJDOXFrSmNTOFhGZmVWdjVoR1Q1RkxJbk9lcXFCTHczY1BNdU5laWNq?=
 =?utf-8?B?dVpEVDNsTEtYL2RPRW1tRXA4VFd5Ri9QYnlUV0psMTBHYThmRDVDSC9MSGdn?=
 =?utf-8?B?eWVrMGYzSStOWWdoMk1Eb1lLaHJaemIwWm9XWXJ4WEV3R3dVNHBVUEhPeU1T?=
 =?utf-8?B?azRsbWNMbEJlUWxFYjR6SEF4NFBCTk1iMlJWUEtJMnk4Q042cklvajlYUEI3?=
 =?utf-8?B?d29OeWpLbkY4NFNFbkRnVUg2SUc4Sk9ORXhhampOTk95SzlUaW9Nc0UzVE4z?=
 =?utf-8?B?S2pKaWtpTm91MlZMQ1BLTE5ENlJNWWNqOE1oTXdnNzE5dkVrWFdJMHI0TUZj?=
 =?utf-8?B?L1pXZEtoYlVQODN5dTQyRjIrdUhnUTcvZVpyTUh2cWQ5eEJ2MkZnUk9MRlJW?=
 =?utf-8?B?a1VEcnRJayt5cTJCWEpDYnRnUC9QWkdab3U0LzZkS1FFMFMzWGgxY3I0REc3?=
 =?utf-8?B?d1NxaG91T1JWOFhjMnUvQ1JDcFMrcU9QYjhpcXhWTndxdEFYMFRpN2luS2o1?=
 =?utf-8?Q?x2XKfd3Q7YdG5cOXTmY4Cs8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682f87a1-6fd9-47aa-465e-08d9df153a23
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 08:40:51.3552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJ9uxd0d38q4m+afVJ2amJBgI4h6aOLSgId8UdGfWj80hRLnrqiYSa1sTokr04JwCeQdS6Uwb6FNopFjphR77w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2696

On 23.01.2022 22:52, Hans van Kranenburg wrote:
> (To both the Debian bug # and xen-devel list, reply-all is fine)
> Hi Xen people,
> 
> I just filed a bug at Debian on the binutils package, because since the 
> latest binutils package update (Debian 2.37.50.20220106-2), Xen (both 
> 4.14 and 4.16) fails to build with a segfault at the following point:
> 
> x86_64-linux-gnu-ld -mi386pep --subsystem=10 
> --image-base=0xffff82d040000000 --stack=0,0 --heap=0,0 
> --section-alignment=0x200000 --file-alignment=0x20 
> --major-image-version=4 --minor-image-version=16 --major-os-version=2 
> --minor-os-version=0 --major-subsystem-version=2 
> --minor-subsystem-version=0 --no-insert-timestamp --build-id=sha1 -T 
> efi.lds -N prelink.o 
> /builds/xen-team/debian-xen/debian/output/source_dir/xen/common/symbols-dummy.o 
> -b pe-x86-64 efi/buildid.o -o 
> /builds/xen-team/debian-xen/debian/output/source_dir/xen/.xen.efi.0xffff82d040000000.0 
> && :
> Segmentation fault (core dumped)
> 
> Full message and links to build logs etc are in the initial bug message, 
> to be seen at https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1004269
> 
> We (Debian Xen Team) are awaiting response, but I thought to also let 
> you know already.
> 
> * Does the above error 'ring a bell'?
> * Can you maybe also reproduce this in a development environment with 
> very latest binutils?

I've tried with a 1.5 weeks old snapshot I had lying about; no
"success". But your and my builds are surely quite different anyway.

> * Maybe someone has a useful comment for the Debian binutils maintainer 
> about what's happening in this step of the build?

It's xen.efi that's being linked; not sure what else to say.

> * Any suggestions about what we can do to help figure this out?

I'm pretty certain this needs debugging from the binutils side, so I
guess you will want to report it there (even more so with 2.38 around
the corner). I guess it's actually debugging ld or bisecting which
provide the best chance of figuring out what's going on.

Jan

> * We'll try to help debug, but will surely appreciate upstream help if 
> things get too technical. It's simply the case that I did not have to 
> look into a very similar issue before, so it's new.
> 
> Thanks!
> Hans
> 


