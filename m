Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957524A3EEB
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 09:57:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262805.455189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESV6-0004U0-9l; Mon, 31 Jan 2022 08:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262805.455189; Mon, 31 Jan 2022 08:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nESV6-0004Qj-5o; Mon, 31 Jan 2022 08:57:28 +0000
Received: by outflank-mailman (input) for mailman id 262805;
 Mon, 31 Jan 2022 08:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nESV4-00042R-Ni
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 08:57:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf3bf128-8273-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 09:57:25 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-onPEGWRZPX-TIJOPj3VKKw-1; Mon, 31 Jan 2022 09:57:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB8689.eurprd04.prod.outlook.com (2603:10a6:20b:428::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 08:57:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 08:57:22 +0000
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
X-Inumbo-ID: cf3bf128-8273-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643619445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eds8dzQvZSCAzcG+Kw3lWrYgRNpaKYIupvYj0hoW7XQ=;
	b=cFRVNs+UCB8Lb1aTpVWcVznDdc3z81pqrC8eV9Dxeg0Sg43HhGK4/bfhTGYb+/egJeWXXo
	NpuK0DyU4qHlluEQ12j4gU+mMaOsSQNkHzvj6TsKxUOOIZ9VG4U1yCPOqIjN5RufdFBfFG
	IsEZQ+QLMm3fcNbkYEIMo2G0sM6QmKY=
X-MC-Unique: onPEGWRZPX-TIJOPj3VKKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJqI8V7bD4B9QGnYaYahpRmtsAQv2DPTYLqbvywyrOvzaxlYQlFsrDROYc73xTb1m+HG6hdd+QTJI4cjZOusWLNB0cB+r74y78pOXiyNP4IOgzux2BL/8UYI2tcR/lZ7u7dwLlZMTY5Qg4b9oNLrvxcqhcd4qUhUGMRqwGKfLnM+ZHAesmnmj/1mNzsiOw7TN4Hj65skrisSqt+NtVtzceV63pZpAYjHdcZ7zaM+ujITkRL6DLVTtomeGr3m7VPpTLQE3xo7uGeLuHyIG2KavwGib2zNaHo2wPh7+MVFYRaMqx0AlP81t1zTCiX1eogA9uRs+2ZrrMcQegIsGrlqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eds8dzQvZSCAzcG+Kw3lWrYgRNpaKYIupvYj0hoW7XQ=;
 b=cjJ9Ym/Ay9iEYWCoWBAxf2WQyJ69VLlV//HRhXPkeU22gKg5W+h45h4fpX3uIHPzM8E1Xf5W6YuUP/JrB5Rb6GJjbKDUxttKOrpZ1DM8WdBMpAbMdQopaKOE/FX4LH5THc4wrmJwC+1is1PNSd+3QhnXtp6iNeL4aAb/EA2QEbT4f4k8OO9v/xTfpBukS79l6xBwrYJsGnZBKrjwBKTSuO2lxNyXdROChauj4OWOn71MUMimIBSk+oJZSmox1RWpFIOsLA7NacrY0Eq3ikGFwJLKp34pJ+fJp/Q5t5hEQg03/iLHB+remu7PwhEGWH4B0LBeDh50gf+VWqpBu7wAFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ef2ddc06-c406-7b7b-1bff-1cb7aaa45abc@suse.com>
Date: Mon, 31 Jan 2022 09:57:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 03/30] build: fix exported variable name
 CFLAGS_stack_boundary
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-4-anthony.perard@citrix.com>
 <d729f897-6319-e82d-f953-c8411fde1e07@suse.com> <YfQGF0JHWcxQHwmy@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfQGF0JHWcxQHwmy@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0057.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79e2a151-2e1d-48a6-3b51-08d9e497b1cd
X-MS-TrafficTypeDiagnostic: AS8PR04MB8689:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB868975FF7ABA235BEA8EB777B3259@AS8PR04MB8689.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U7DTh37DNqx06djapiANdog4Wbjq9Tctu78M+HoivrIWSSz7qumlmAn0S9WiMfTXNMV7w/wKtC1IwjlhcLgAV7vrlglQxoZaX9vV0ZEMXq0uOeuKnIytjMsG0dQItWQfJ3RJuT++NdT1WF26F3yfLpoMxhJeI6Muq4IXIzXcEB0sMGUJ1vjqqrdHqtMn/u/Zh1WI7zVvGbhPE2XKTn733QlNFADFCbtYgeta59gMuoM9XSC1ClWU3iPS5qzvSQTKNUvApeaEDIIVXu3YVlZMKS8CE5t1IamVDLf4+j2PWTE8Ie+nV2LuSqZo9s3Antkkt0G+d9vQKXyAKb1stmrglVEO0psxzY97kE2vEecHTT5z50zrTh+j5xCJWO41oPYS++b+2A6mSm0Nq0qrXvS3Sd9efHSHg1UknsnVeA4sw5g0Xj+Nvzksw4bkTrF/RQzWOM1zZxCrwrf217jYy1rp3vl8WBJ1vyyaJrVT1Q+20NyWPb91SGVe7Te/JaCsSGjd2ZbF41KdTPA/f/f/gVwoZtKsIW6Rfwh0C+0bd6IzVk0kHGWpk3jLeb1BTVOzv5WLlpUcIYzsNrHEnMxXzZlJDaoIR5rF3M81mTWrRrY8ktrZg/QdZ8Dbdv345vd/0U2Bn0XVRboSUlUveNqcR96MJeUkJeUu7pKuBqMiHtAwEo4gOcZ1wsXam+hJfv2yXGcwTJLLwLJyW6m+2luZtuxFfP1FpGUzc3QJmhUz3B1RPas=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(8936002)(508600001)(2906002)(4326008)(31686004)(316002)(6916009)(54906003)(6486002)(6512007)(6506007)(38100700002)(53546011)(26005)(86362001)(2616005)(31696002)(186003)(5660300002)(66946007)(66476007)(36756003)(66556008)(83380400001)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aU5pOHdMODlMVkgyOFV3MCtFYXZSTGtBN3lLWnl2eFcvSExmTW03eVlHWnhJ?=
 =?utf-8?B?cXhQc01YV1JXTXQzWklheWY2elgwOHFyaXlXYm1HTUE3U3dpZUdMRjJmTXQz?=
 =?utf-8?B?dGpLOGZXRExkb1NNY1VaeDZKSFNXeVZTWFZnZ1U0NlhLWTBUSms0MFFQS1k4?=
 =?utf-8?B?NHNjeEZzQUpFa3huV25VTzNOaCtiU3Yra2t0d1pobGZXZjNpcndsRUFVejdM?=
 =?utf-8?B?YmEzRFZ2TkcyOWlCUTl6T05xZzI4OE9vN1VZdEtHSXhLenV5MlZpSlRtU1dC?=
 =?utf-8?B?bTJuSFpsb3gxM0g0M3Z0aVI1amJKYjR4L2kxL1NGaVBZMjVmZjV6cTNqTDR3?=
 =?utf-8?B?a3VmcHcxZFNaYTR5YjRzR3Z2eTRKWnRYcjRrT0Q5Y2laaU43QjY1STRoRFFP?=
 =?utf-8?B?Y0UrbWMyVTZWQnR3NjZtenVIY1RsaGszZi92YXJWWEpENXNlL1JLalU2V1pm?=
 =?utf-8?B?TXI1dFVzaS82OG1WZDRyMDNhblJrUlFlQkRGUkxxUlR0dk14TCtqdEVOZURm?=
 =?utf-8?B?OXFsMTNQTTBIZ2VVbHB4c0J1ZmJCNnBWYlZaTExsVC8xeFBiQUoyekMwaFpP?=
 =?utf-8?B?UFlQU3puWmZ3Q250VW5NbE52TG50ZGFKS21YK1FadUJMaDJhcmdPaFBNajVM?=
 =?utf-8?B?Nm5xTnA1cUU0V0FERkQydmw5WDBmOW1weDVSWERCVWFFTU5sUitKVnhHYUs4?=
 =?utf-8?B?V2txckVMcytraWtyYTU2WFJ1TldXR3RiSzB2MFR6ZXpBUUU1eHc2THZ2UHFG?=
 =?utf-8?B?dWtWbTVvdUpwU2cvN1NaL0JHNGxWMVV5UDlpTjJLZFlwbXJPcEpFamhGeThW?=
 =?utf-8?B?WkpRYjdPeUxFdFdxK2g1US95ZytrKzBoZGNuMzM5U2FBUzA4c0xYMXN6anN2?=
 =?utf-8?B?dnRENXptUW9ScmFyaU9nMFZTamRiVkxNbFJ1VlhQWDRBbDFPZi8vMm40RFZM?=
 =?utf-8?B?Z1pOZVFldXg2VVJUQXlzUjE4VXI2UUJmcU1aeUdKNlNaTVUxVm5YWklXYzQ2?=
 =?utf-8?B?SzY3SFVMeWJvZ3o5Y013WmNJbHRGVUVNNFYxd3k0TkROWU9HYlJCd1VIaGdC?=
 =?utf-8?B?MVdUbzlFRHgxNEorZ2gvdUhFamMvSGNhSkxrYmN0clJ0Zyt1cXZRdzFRaUFJ?=
 =?utf-8?B?dGpDelVHM1dXV1o4ZEVJQnZielVlWVJEVTVPSjM5MmxYK1BJUGgxajlwTmRF?=
 =?utf-8?B?dXlkRVBQNk1KeHNEZnQzZFd5TGYzRlFOd1I5RFJJczVZcDhRa0Y2NnhBR3N6?=
 =?utf-8?B?V25JRVhIemRlQVB3U2psUE5Ja2VYWER5WUZHQXdUMVZNcmROV2ZQOWRBTTdC?=
 =?utf-8?B?dyt4TUl3TGt6RDRQcGVISDBKY1FaandRZWdDTk13RXlodWpDaVlHRkUyU1J1?=
 =?utf-8?B?RWhJZU00d2dpR2I4dHZBNXA0a1JDSEp0Q1lZc05CazZCQVFnUWxyRHR2aTBm?=
 =?utf-8?B?bEpsRHBuUDFCV0JJOGJwakJHN2orRURRdkRRdi9YZGFZTGpMMjZoaFpGeU1j?=
 =?utf-8?B?a0VOZVI0UHFHcHpZSS9XVkRJRUI3WmR5QXpqZWdPUjkrUDVlS1E4VmZpeWF2?=
 =?utf-8?B?Y216WUQwaWRacHIzZDdvK1RUdVRmV0JNeklCTnEvdTJYRWNjNnp0SzRHaHZa?=
 =?utf-8?B?WkJqYnNKVlp0Z2orYndHNTdBc3dIYnRVYWg5SHVwaGQ3QXBMeGJ5RXFYRHps?=
 =?utf-8?B?ajhuVWxaS0tRNGRnT1A4TDE5S1VHM0lxOW9qc3NWL1dpekNDSmVHak05UUt1?=
 =?utf-8?B?Qit2OWNmZDlIeGV6V2F3NGVIdnJ4bDhVbnU3ZDZMRzJ1SGUweThGWGpKL09F?=
 =?utf-8?B?TFZ0Q1lBeWdJQzY5eFdmNExWdUJqRE9KV0lLVDl3L1hhWkJ4Y05QMnhyYXQz?=
 =?utf-8?B?MkUzTFFaUlltdFV1TG5ESW8ybERVdVk2TjIwV0ZSS3FZNGkyTmtCMmFwZGZm?=
 =?utf-8?B?eWZIQ0t0Rm9CNlJVRmY3TDFyT0ZUT1NiV2NQMDhsUGxnZ2U2TzJWYXZKN2xq?=
 =?utf-8?B?NUcvck5ydDVyRG1Fd1BlZjB4dys1T2l3QjZoREhESUtkOFV2TlJpaXdvYU5I?=
 =?utf-8?B?WDJrNFh4Y2p0MFlZb3BLaWRJejVxMkJ6a3VNL3h5V3BJK0FoOVhvSFRISXRG?=
 =?utf-8?B?RUZOV1Q3ZHI5OXlzRHZqa1VlajVhRWhKdkxueEJNWXNZNlp4aDRMRmNiRitL?=
 =?utf-8?Q?0VHGP9+Rg2zyMqgCsuU72Js=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e2a151-2e1d-48a6-3b51-08d9e497b1cd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 08:57:22.4941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFJd/eUahK3NhSldSxDugxWOCIZnhI8LEXEPNw4y6Rp27DH6qmO7D78g+E6wT6AZ/YI0bPMWruAXU1J1wnP7Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8689

On 28.01.2022 16:04, Anthony PERARD wrote:
> On Fri, Jan 28, 2022 at 12:14:58PM +0100, Jan Beulich wrote:
>> On 25.01.2022 12:00, Anthony PERARD wrote:
>>> Exporting a variable with a dash doesn't work reliably, they may be
>>> striped from the environment when calling a sub-make or sub-shell.
>>>
>>> CFLAGS-stack-boundary start to be removed from env in patch "build:
>>> set ALL_OBJS in main Makefile; move prelink.o to main Makefile" when
>>> running `make "ALL_OBJS=.."` due to the addition of the quote. At
>>> least in my empirical tests.
>>>
>>> Fixes: 2740d96efd ("xen/build: have the root Makefile generates the CFLAGS")
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> While I did commit this, I'm still somewhat confused. How would quoting
>> of elements on a make command line make a difference to which variables
>> get exported?
> 
> I don't know, maybe without quote, make run sub-make directly, but with
> double-quote, a shell is used.
> 
> But after reading the manual, I didn't expect the variable to be passed
> down sub-make at all:
> 
>     5.7.2 Communicating Variables to a Sub-make
> 
>     Except by explicit request, make exports a variable only if it is
>     either defined in the environment initially or set on the command
>     line, and if its name consists only of letters, numbers, and
>     underscores.
> 
> But somehow, sub-makes also export the non-shell-exportable variables,
> unless the command line in a recipe invoking make has double-quotes.
> 
> 
> I've tried again, and checked the process list:
>   - when running `$(MAKE) -C foo`; make just execute make
>   - when running `$(MAKE) -C 'foo'`; make just execute make
>   - when running `$(MAKE) -C "foo"`; make execute /bin/sh -c ...
>   - when running `$(MAKE) -C foo | tee`; make execute /bin/sh -c ...
> 
> So, CFLAGS-stack-boundary disappear when /bin/sh is involved.

Very "interesting" behavior.

>> In any event I understand the description that prior to the subsequent
>> change there's not actually any issue. Hence I'm not going to queue
>> this for backporting despite the Fixes: tag. Unless of course I'm told
>> otherwise (with justification).
> 
> Justification would be that it's not supposed to work, based on
> information from make's manual.

Okay, I'll queue it then, but in case it doesn't backport
straightforwardly I'll still consider leaving it out.

Jan


