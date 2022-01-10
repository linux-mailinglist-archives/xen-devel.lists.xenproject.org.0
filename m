Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447554893D9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 09:43:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255234.437339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6qGX-0002Jc-8B; Mon, 10 Jan 2022 08:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255234.437339; Mon, 10 Jan 2022 08:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6qGX-0002HH-4H; Mon, 10 Jan 2022 08:42:57 +0000
Received: by outflank-mailman (input) for mailman id 255234;
 Mon, 10 Jan 2022 08:42:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6qGV-0002HB-KB
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 08:42:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b07e218-71f1-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 09:42:50 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-1YJNaNrqNvKyjBJWSNeH0Q-2; Mon, 10 Jan 2022 09:42:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6302.eurprd04.prod.outlook.com (2603:10a6:803:102::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 08:42:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 08:42:48 +0000
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
X-Inumbo-ID: 4b07e218-71f1-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641804174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtUsklSb+M1LdlTEkS/ih+4NH1LQS8z1Xrr+PfO3BCQ=;
	b=WMSZT++bdk7ypQ01GhB/ot53YCXnVG+MKKySpHb7eeZVYWDjRVIVcSu/OHs7YAyO2Z7NnX
	JDVaKdnIBW5lTgDXOyCYvdiRq4/8Ujl/PbzBEFD3wmEzB8x+ouPq49hm046sQDPOvMXvs4
	ZI+H7E7E1i/ywqZgBSF3EdY05tqaWj4=
X-MC-Unique: 1YJNaNrqNvKyjBJWSNeH0Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgSkjCLxI/D0n6ZCKECVThzWEc66I4r8TbLGiJjjkxBRKFLaikcoqpbBBnmpPHaWIBJ676e7QLHHVsVQf60tlmHflCrBNp/6C82HpQQTmdR0f9/j71t3opevN00kL+VnDyLsAKGo91iiadGFiw601VJa+lQCsthcwKBhn1J42B5/H4EmMx+QcdGHNh3vYi34WcEvwH9CVwwtO7rxxHRACYi2qm4hEynXJMZgHE/C+7rIcySmsllsDMeYv+kL8H6VrLHS/z7zxYRhvOAHKEmdd91J9K8WNvuXqFq7EIN5FOqSGVUCDrrihINufgHWWnHFsTinAtMI7UtF1XA2wdm7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtUsklSb+M1LdlTEkS/ih+4NH1LQS8z1Xrr+PfO3BCQ=;
 b=AJJDNe+hbXLntsDey5yhmUEle1DqCgv7pxVqExd05Tc6nHWeHli1Qz7kmb9dAjk67s6bLX/3rdQd3BmzrrBhPEOIvR9b8QUQQNqAIRr9bpjF3Mmo/6KCv4KXb+6B2b8viZtsZEEvnNrnEi0l8Pw5QbK7k0+emaXORw+6vXQ9bmFos/c4nX/NnGTtjvKMqZaqcWGfTHeyEWo4y3rT1DxyyiKxficNriD0F3bRbr7o9dM1hXMWaJcjZayI8tchIlyV8NYrgfrA8wO8uM7mFfjjUuT1UdfqB7HgrXNBr4xHDGRTPfKrytU5YFu+g6C/MZWVnqyRgMkl3P2v/QTb3iq+5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e5fb9e5-8334-9888-4bae-97564caa90bd@suse.com>
Date: Mon, 10 Jan 2022 09:42:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] build: fix make distclean
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20220109100133.19731-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220109100133.19731-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0046.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21cb3a70-8afb-4466-66b7-08d9d4152df3
X-MS-TrafficTypeDiagnostic: VI1PR04MB6302:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6302683BD47ED5F9E1D746D6B3509@VI1PR04MB6302.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9MRX6513oivKdlCKYap58tF6F0B1Lf1jKXb2+Cc9Arv2EYVILJqeouAIn0N4zyvNy91dEPnAFHNco5B3H4J9OACgWWiKfSm/9Cu/lM+RsOZFHwJNaNfLw4MzrMYPaGBFQQDb4JPOhn+lUjDcZIOLmCr59uaqbvu8sERYfUSdVorCrIssPm8DPOYmOOHKl8zA3F9g5lJ2sISsqq40FRtsCZZU5TWdWeujK60aKN2R7FR2HxNEDNHZFDbCBY8/+6DGMNWTo7r75riFHlUakDXSfTzqvbq56JkoSDCREtA3dgOYt4oQ0bOkdXWxXIdRaD5L71QV+00jQdGNK7pcXWA+C5c/5Kb2HoBtX6ojdHbY6+7ldmL6lrvK4T1hIg/gw3TrGjdDYKDGGTk3GkKPfzSQxK7/zKp+oxK+bMb/wolSTcKYKACwL4QU9FtqEGwuNxC0XoiwYMsT1MLSrztTTjtl92SlEp8THxIkoNlmaJ8YHU//ilwGqNkmxBEeLmCfQ5lM/iLsIuFo3vUcvJBDTgmg2G5O2Awgn/tyRyobPtQ5Iq/3Il0V2lTgUDbsMcbfdV7eWpE0bPyahih8uP0uWfVUYwc0CMDmwnrZ6VIksFO0yRcjEn8XYXGiO8L+MwUnGOWkalONnZ+2ybKkH2LbqiENMFCB5PHl6xdWlIqCHmPDzrD4pCjCZN9Q1r1NWm9TId6vBB8ZDhuBqJN93zX+8aDEwMYDIlRa5vJh/y1LKIObm1E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6636002)(8936002)(37006003)(6512007)(36756003)(54906003)(38100700002)(5660300002)(6862004)(66946007)(66556008)(2616005)(66476007)(83380400001)(186003)(26005)(6506007)(508600001)(53546011)(31686004)(31696002)(2906002)(8676002)(316002)(4326008)(6486002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmUxV3ZJRXVQdHI3U1c0ZE9JRmhSdjdVaUV3NmZLcmpyT2N6Ukt5QUFFOGtJ?=
 =?utf-8?B?bStmaHJVeU5iWU9aR3NERytNZy9QSFl2VlpiRWFSRHByZy9JeU1sR3gvNWVK?=
 =?utf-8?B?UWdEVGg0Y2hmbzhzenFuajNLWHRLTlhDRkxLNTdOT3Vsd0pVUzlObVNWdUhz?=
 =?utf-8?B?L2tPcXI5RFAzMWNuMjZzZE1ZOWxFcDg2YWk4YkY0Rzk5enZ4WHJOOEVqL25O?=
 =?utf-8?B?SW8yTHZYN0E2WWRCMlRpbFFrakpFaGpCODZkZTBkMzVRdEdNUTc5NDBXcnNW?=
 =?utf-8?B?dE5qZk9XR2J5Mk1iWHVVZVl5M3RGZ00rWnJNeFBIaHU4NkU3MVZKUEttT1Iz?=
 =?utf-8?B?RlliSGdabTZSdVpnN1ZPcVBPbGM0S0FqTVA4Vkg5NXNzSFNBVkZBbmMwMnc4?=
 =?utf-8?B?ZXVucUI0ZDBUaVQ1WDRCYU9QcEdpdWdtb0dFTlJCb2ZJNXNNZ1pOdzhFeWhO?=
 =?utf-8?B?OWg1ZFdLNFJFTWl2b3pRNjRtelVLR3hDUXVYUGI2WDhCbVRSbDhZVFc0bW1P?=
 =?utf-8?B?NEowcFU0RWErUEJqM09pT21zVitOQUhTZS9GRkZlNUJKZzBZSXk4ZDhyM2F1?=
 =?utf-8?B?Ym5FMHpxN1lUc3BZQWdlNTlkbGhSbUFzZnZ6QjN0VVN4a3FDRFNSTng0cmpZ?=
 =?utf-8?B?bUlZU0RQZEkwVXhNa2RPVERBcUNYWHE0amVLL1YwdkQ3RXNzTENwQ29TQTd2?=
 =?utf-8?B?ZmpMZGF0RTZWa3NNMkNncEQybC9UMElMZ3FXZGlWMjZIcURGUG1tc2VEL3l0?=
 =?utf-8?B?UW1sbFVYNDN1eGloWGFTNTUrYWNKRGN0K1NxQUhtUlkybzlxNnpDdEhRV2dv?=
 =?utf-8?B?NmJ5SzFudDJLK3NGTFJ4eVZobDNqVFJEQmZxc3hSZDE1SjNFOGVZY255VHJx?=
 =?utf-8?B?d0U0b0J1OUtZQmtqWVNFeXZnSXNEeHZHK3NKVmZDOEVnRXJKTEl2Y20wOGRZ?=
 =?utf-8?B?N3JxbVVHSXhNNFlPUS8xdzVhZ3lCMkJ0QzBrcjVzZFduMEg4OXVlbmd1RHRV?=
 =?utf-8?B?WTVnbEhHa2V0dXA1c0lORTFaUTkrM2ZsSmRNZVdxLzg5UVAwUUI5S0UzaGNT?=
 =?utf-8?B?dEErQ3I3ZjZUWlYwMXZoMjlkOWljYU01Vll3M2VkS1ZHcmRxdHd4Y25PTERK?=
 =?utf-8?B?OU9sQW5RaFZLLzRTTk92WHZDaVFFUWdDd0hFV1YzNy9vYVpxMjI2R1dXRGtm?=
 =?utf-8?B?UTdKcFQ5VGpBTkNtZUJQZkkzTmdBUkxUVkpXZzRnaWtUZEVwazMyZVlMb3M4?=
 =?utf-8?B?TXEwcnR5cXhYclRQWWNrZVZ1dzhiUXUvcmFDZ2NMRWFxRFMrcGdPMXg3ZFln?=
 =?utf-8?B?ZlI3aytRZFdZUVZkMzExUXJSbWVURlFiOHNXYVZrSGM4c29YUWFDeFArWHZt?=
 =?utf-8?B?dCtJdmQ0RXpwNGp0akx4M0RCaXNlcXlBUERoMjhCcjlVbXJPd2U3U2F5Y0Y0?=
 =?utf-8?B?RFJ4ZUhJMmdJVStHV293VVRaZnVVNHpDSEl4YmwxeTR0aDRRY2tJWk1wS0FY?=
 =?utf-8?B?ajFXcnI1RldvM0NxeXFDMUgvZkdZemgzY2phQzFGNGtSaGR3UUJQazIzaXlB?=
 =?utf-8?B?aS9ObFBuNE9mdnNTYWhNZ0VuRmJ0Y25pOVBxRHRjN0krQ1BHM3BYTHl3YnlH?=
 =?utf-8?B?a1NoUG9qY1YyV0Zidys2UWNEZzhSS1NXa0lZZERFVEx0Uy95dmVhUlV4dE5P?=
 =?utf-8?B?dHlrWExrQURGWStoRnhyQXJGbElKTVFNQWtScFl5NGpqVzMyZ2I3YTQ0aWpZ?=
 =?utf-8?B?M2l3a29uWDNzNDloQ2hpZFlpUytDczcrbGF1cVFvRmI2anFRcmZEZzJQZDIv?=
 =?utf-8?B?UTcwU0dpM1NiT2R2ZWtjRVJ2RjJpRVhGNnBBVkozUWUyWDFNWTR1RFpZL3FU?=
 =?utf-8?B?RXExT0huN2NFeG9pRWZzaGIxK1VsbWMxK2VpeStESEVNOHBYd05PNVp4UW9Z?=
 =?utf-8?B?Zm5Fb1dCWHRqbWxIUkwwK3k3OUt1S0VWckxWQUdkV0ZjZmF4bHgvdUR3NG9P?=
 =?utf-8?B?d1ErNXdobjdrdzB5eEpIOEdHUk1CbVVmbWp5NHJrTEJZbFZMSTk4QXlUR3Bx?=
 =?utf-8?B?Y0Z6TnhJTjRrV0VVdGZleGV0akRtTzNXa2RvK0tuaXJ5RFZ1QmlCSlhwK0w5?=
 =?utf-8?B?TGMyWUlqWnFsK3RhaUY3WmhBanhJa3hMbFk1eW9xVDBHMG5HUGJpb3JEQXIx?=
 =?utf-8?Q?1OUr9G+Xq1q0WVDNvejFq4w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21cb3a70-8afb-4466-66b7-08d9d4152df3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 08:42:48.1802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsoOVrn++eUFNwn7CHjrRyGynZx+1IvKHLowVC4aKMjOS9CsrNu/q2gvU4Bv+269bH0vS5K0c4Bu9HpZ53VoCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6302

On 09.01.2022 11:01, Juergen Gross wrote:
> "make distclean" will complain that "-c" is no supported flag for make.
> 
> Fix that by using "-C".
> 
> The error has been present for a long time, but it was uncovered only
> recently.

And that's because the rule simply was unreachable before? Or it was
reachable, but only via special (non-default) $(MAKE) invocations?

> Fixes: 2400a9a365c5619 ("tools/debugger: Allow make to recurse into debugger/")
> Fixes: f9c9b127753e9ed ("tools: fix make distclean")

To distinguish from this commit's title and to also identify the affected
component, how about having "gdbsx" somewhere in the subject? (To be
honest, with this title I wouldn't even have expected the issue is in the
tool stack part of the tree.)

> Signed-off-by: Juergen Gross <jgross@suse.com>

Preferably with the above taken care of (which could be done while
committing, provided suitable adjustment suggestions),
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

> --- a/tools/debugger/gdbsx/Makefile
> +++ b/tools/debugger/gdbsx/Makefile
> @@ -14,7 +14,7 @@ clean:
>  
>  .PHONY: distclean
>  distclean: clean
> -	set -e; for d in xg gx; do $(MAKE) -c $$d distclean; done
> +	set -e; for d in xg gx; do $(MAKE) -C $$d distclean; done
>  
>  .PHONY: install
>  install: all


