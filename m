Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1147751310A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 12:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316402.535321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk19W-0002Fk-5M; Thu, 28 Apr 2022 10:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316402.535321; Thu, 28 Apr 2022 10:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk19W-0002Cg-1x; Thu, 28 Apr 2022 10:13:38 +0000
Received: by outflank-mailman (input) for mailman id 316402;
 Thu, 28 Apr 2022 10:13:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nk19V-0002CF-89
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 10:13:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddce7183-c6db-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 12:13:36 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-mFdMtEgJMIC2iSxVsFTofw-1; Thu, 28 Apr 2022 12:13:34 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB5972.eurprd04.prod.outlook.com (2603:10a6:208:120::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 10:13:33 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 10:13:33 +0000
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
X-Inumbo-ID: ddce7183-c6db-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651140816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SOylW/xOk1biFGmAmJblj3puGUp0ilc0fo9TwKsdZDk=;
	b=XTDkRMMIz/volerpIX+ZknoGr4hltTSEshOUbw1+VCVIBpJuz0wXE7AXmXMfM9ZzvoKGAP
	W0uERRTBFVlNaJgFyiopheKtt07JQQPLpxbIbt/kXjOfr7dFByk8mhA0ZSYUBqGWumOcKP
	TU9qBphTm0ET8uKRSnraE23BOPE6NcI=
X-MC-Unique: mFdMtEgJMIC2iSxVsFTofw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCWFQGUfP9PZQ0v8FXb8NqF3wlsPaumai7ngoYiauu6QPduUBjjmjHhI72TN4FK8O5GjqQLEUgZi05c0qgKwNijKCb4Bv0ISJxUVYbUNf2OvVhwc3tIGXnEz4cYS/dLw1yJUPBrN/DTh5D7u0Rxovgj92GBzBAiHVm4mx6Y4RBj16piyL90W7zBbl+e67k2FTvYgLsRuQaYyJ1AnR7nUqIK8G0JKB7k8JSptKsP4JePOXDK/FwZe5OOPXhpFbL2Ult2tmFsK4l1HFxqxYXKeFu10rfMLJ2MdVszNrl+VkvB4BSlY8Bwlc9jqADgpzoDfX6K7x/UfP8vRGBQm4bCFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOylW/xOk1biFGmAmJblj3puGUp0ilc0fo9TwKsdZDk=;
 b=m9q1rSo1QdJ6/9QrUYZsaPF0SFSy2OCqnp/aQqFOjjTcZ7ChYjONfQaMVEVyM6+0NAlv4yfxwIjB4IIrD5+Nm6R/QCF7SoPsDnKQeuuE9dXCrx35/J8KRxT2nhHhVx/SIjTqS8S4DdrKAt+GTiJAbPWgVNseyB7wi4+hVDCuK0Xkz0TVaCLEHFAEZGHLW1VAop7dSpnsPfhjvD0emS9oB6ELHOoKR90GQDIQAiGooXk2zpF1SnVYtexzQpWgOQj5K20eoxPeudNAyOwEgdWCb2BSng/Qb4TrK3mmDGdkPRAWlb/goOXvCQnizJwCS9vDdRm7d2wVwpXWzITIB84lXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d23258dc-3837-ebe4-26b1-75b0f32477e9@suse.com>
Date: Thu, 28 Apr 2022 12:13:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] x86/cet: Support cet=<bool> on the command line
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220428085209.15327-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220428085209.15327-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0028.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::34) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b38a0e3-f476-4ee1-463e-08da28ffbfe6
X-MS-TrafficTypeDiagnostic: AM0PR04MB5972:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5972A22C86B80D7332EB884BB3FD9@AM0PR04MB5972.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AljA8z7Zmq+UqYnkGKxMayJHYi1Kx0T2XE5RV0/RYwKa1H0VN/Txz2eV6XpBXOZisbToVireBE5vIQYdcjWaiwk25l921Ycpv737lXnUtuUnwfKbqOArzcFKXIK9SJCqx7OXGfau6fhaZGlBbyMOJr+TnKyOkjma54EI0JzHDvGxMe4Jpyrrs8IoHM5wvKXkfbkPQXRKYDS/w7SeDQcYCq9WFEnFJyx5BBxZ47huI0aNfSNjiwjvNzus+952DLrXcdMproIEx18erQOTehjHY3xOQQMLIdHI+CTMk70226sJielIsQPL+fIwsC54VbWDb/saLrMNn6+omKlzhDLdXLG5HLDmV0DkfWEVrIRbZLwfFC+P5VcbftdYGZlRHjbfMo0i1W9w4iDBmjNpnPjK8ytVJKw9J2uvtMg1lMMHxn9Chcs8x0dMi5mubZ7LU3RRVfjmnaBW88vh+U4kXbF5E5dXKRYFddIy6KwkWiXTlu+XJ27BOGTcxAQUtJamk5f5TvDGvq8pG69lSoj3sUF6UQEjAyHUcurdIg8D9G5dpLLRL1WlfGZy+HCQl4onW8Zq6ezsSbuF1HFjD/DTGYyY9LEjCAH6fvivOJ1kRAMD6JFmwU+HHm8kLHH6AKVWgDres6/QOggAgmZ3eLx1pnufbbkEd/rdK4b9tExXt5SxzinuvFllRygPuWkTqkLyrQv9EYsDPtNpEInWOeWP5n+GBEwhjBDkeGDX+B76QFAIhewRLkdcejUU+PSwVXHsEDDr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(316002)(186003)(2906002)(2616005)(86362001)(36756003)(6506007)(31696002)(6512007)(53546011)(26005)(5660300002)(8936002)(4326008)(8676002)(38100700002)(6916009)(54906003)(31686004)(66556008)(66476007)(66946007)(508600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V05Kci9wajViSlFHZ0ZTdnA4N052Q1lvSktYN2I2V05VUG5JOVlxeWR0cXMr?=
 =?utf-8?B?Yzl5Z1BHN1BiRk5qNWJpV21nc3BWYzBMSkQ3Smd4MFFBckhJay9wcG5jMFZz?=
 =?utf-8?B?Y1oxbWhIcC9hb0x0VlQ3amlDWWlkUXhQVkVmMlpYVUEyTjdseVl2R2Rxa2da?=
 =?utf-8?B?Z0V2N3VFNndia0lLc2FYZE9EaUlrUTV5Z1dTL2gzYXJ6MGFwR3AyQXk1Mm1Y?=
 =?utf-8?B?YlVoRVVXTTExUWxpdjhMY1dZSVJhR2k2NVlWa0QwckpFZ0YrS0dCSUlGWis3?=
 =?utf-8?B?TlB1UUtXOFpwMTc3SmVacm12UlhBVXFGM25TaGZ5YmUwakZyWkd5ckhsczN0?=
 =?utf-8?B?S1d0RHpiQS9May9uZHlwTFhheUlXN1Mxd29MdlhLSU9UazhvRGpIbWpGaFph?=
 =?utf-8?B?ZXErdUdiTmVRMVVHcGg3T2VPZG1PbEhoc0NHQ1FQcjBDYTB5WU10eS8zakNK?=
 =?utf-8?B?UGV5TVltRnpyUjBkdkl2YmlUQzh3eFlCRnZlRmwydUNnbXo5UlV0WGhsZ1hM?=
 =?utf-8?B?ZjNRUkhRVzZVL1BRaFpFZmdta25oUW1QcFV1bjlBOWdMZmsveDBraUhsc2lo?=
 =?utf-8?B?MWpKUi9hZDJZUkFEWjNDVVBzR0U2ZW9BNkExNm5VYkIyaE15TjNUVGwrc3c3?=
 =?utf-8?B?U3RIQjhFcEdMQ0lhYTZIS212Y3JTY3EwVjkyV0FNVmw3Y1FEdGdZdmtHMkFt?=
 =?utf-8?B?N2s1UGNTU2Y2ay9iSGpVNHVpY3ZBTVRjdXpSNGgxSGVnMW5uUUtRcmpvYm4r?=
 =?utf-8?B?bWVQbk5BekVsYkRuUVRMcUJyalN0U0tzN0JzcGZDcDhpK2dXbmgzZm51QWYy?=
 =?utf-8?B?MlljT0t1bTdXeGNEZFlsNVd1d2lnNUlERElPWnNpNkhkcUJvRXhsTDhvaC9v?=
 =?utf-8?B?Rmo0b29QSytlRW9jaXRpS1ZWaTJjek1lempCRnNaSEwweEZVWTdrNmNFRXpN?=
 =?utf-8?B?WW93YU5CSlVNeGZSOXR0Q2lUTEF4bUwrQ2JyMUVleEw0L1BoNEJ2M05ONytq?=
 =?utf-8?B?TCtXaEQxWUFBWnlZdzdpTkFXUzR3Ym1udVVIYVAzTElielhRN1VUSTNyenM0?=
 =?utf-8?B?M25sQ2pPeGUxaFl2Z1hWZG9OamY4OWdRcEtoMmhaM2Y4eE9haHMyajNhMDlE?=
 =?utf-8?B?SzZaY2pINkZQSUFBVHhXWTVVQVRWK3RSNW5acklyWWVvL0I5cjFiZC9GRUZi?=
 =?utf-8?B?WnFKMXZkTkJTMkNlNDRRZmxMbWl4bWFDbElFdkIzeWNCdXNISnZBUkE1ekdu?=
 =?utf-8?B?cklkYlRweUdiQ2tVMkZ5a09ZaCt4YjErSFV2dGRwdzJxNy9oNFZNd3BxRDFh?=
 =?utf-8?B?UXRlVmFoRE55ZkNyK2xzTUV5Q0U0UkdsQkE2THJKaGFGRVJDUCtrYkRFb3Z6?=
 =?utf-8?B?YWVUK3QzblVOZnFWay9SNFJsZUt6VE9CVWlhOHFuaGt1alhzeEcrTk5zdmFV?=
 =?utf-8?B?d2RkcDdJb25sMkpNSlV5aFk0MlBsaW1vcEo4bkQ2WHNaYWw1cXAzY1E2YmNz?=
 =?utf-8?B?NnVnYlppbTJSN1M5blBDNzBMV2ZMTEVDbkV0S2NlZDVKcjh0dDZOK0JiajV6?=
 =?utf-8?B?QkhicFBpZG5SNG5FOTQ3SjRtQmpyMzRNSUppalZSQ0dEbnhIbS9kSVRuYjg4?=
 =?utf-8?B?WFBQVDBiVGtndjBZaEpFOWhkcFUvUGVUYUd4WXVhQi9Oc2tlSCtlV3NqVi9x?=
 =?utf-8?B?Sndra0dsUndtSUxHRWh3a3lKV0JHWVVjbTJCREtkTkVhSE1qK3Y2UjRGMVpM?=
 =?utf-8?B?bjNQNzNuQnd4YXV1V25RRmxiZTFZWXJlVGZ5dysyc0JBREw0OTFGMERYMFlh?=
 =?utf-8?B?MjhsTVpLSHBpbmpnQVJiOUpjU3FFajg1L2VaaGJXMmRJdmtIUXcwQlJpWlpK?=
 =?utf-8?B?M1QzTjJoRnNLSVNpVlVxemdtb1dobXY4YnFqMUVkSzRhQkpqRitGaS8rWVlr?=
 =?utf-8?B?cjZLUjBBenlHMFczbVZVNS9SS2dlbmhYMkpmUWRlam9leEpZbklFaDN5YXVR?=
 =?utf-8?B?djdvKzZvaGxEWG4rZ3djT1ZWbHIyVWRrWTdmM3doVVN2bXo5QStFcFN0OXBH?=
 =?utf-8?B?RWxkZUdIbFJMazh6NzFWSFFnaTE1VU9NVlFtR2Rjc3JuRkU4OEZxSXVLM211?=
 =?utf-8?B?ZnRLdUtTMjBqQWNXb2g1VVFLc3NQbWg5MUQvVnFZM0VTMXNjRmdwYTV0czc3?=
 =?utf-8?B?bTVCOXl5eTFOcWFxcVlTdXc0Vmk1Z2NZRWl2a2RVSlR6Y0hiN00yUUJDM01y?=
 =?utf-8?B?bFdqekFmeXBTcWxzdzJSeksvWDYxMzBvNHlXdFRVa2VFd0ZMdkNoVzI0ZGd3?=
 =?utf-8?B?YWhjK0F3UnVXWkhmaitsR2hqR1VDUWxCUVFheCtYTUVwQjA2aEE1QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b38a0e3-f476-4ee1-463e-08da28ffbfe6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 10:13:32.9063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4gDc/2sLMMXa6C6N3LJGS1YOAJDjrEQZ80z9CAI5xBLJyk6LwLmI0JyI2s9hKHXLAuCzgjIjqbRwOWjOlnDdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5972

On 28.04.2022 10:52, Andrew Cooper wrote:
> @@ -283,6 +283,8 @@ CET is incompatible with 32bit PV guests.  If any CET sub-options are active,
>  they will override the `pv=32` boolean to `false`.  Backwards compatibility
>  can be maintained with the pv-shim mechanism.
>  
> +*   An unqualified boolean is shorthand for setting all suboptions at once.

You're the native speaker, but I wonder whether there an "a" missing
before "shorthand".

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -117,7 +117,20 @@ static int __init cf_check parse_cet(const char *s)
>          if ( !ss )
>              ss = strchr(s, '\0');
>  
> -        if ( (val = parse_boolean("shstk", s, ss)) >= 0 )
> +        if ( (val = parse_bool(s, ss)) >= 0 )
> +        {
> +#ifdef CONFIG_XEN_SHSTK
> +            opt_xen_shstk = val;
> +#else
> +            no_config_param("XEN_SHSTK", "cet", s, ss);
> +#endif
> +#ifdef CONFIG_XEN_IBT
> +            opt_xen_ibt = val;
> +#else
> +            no_config_param("XEN_IBT", "cet", s, ss);
> +#endif

There shouldn't be two invocations of no_config_param() here; imo if
either CONFIG_* is defined, use of the option shouldn't produce any
warning at all.

> +        }
> +        else if ( (val = parse_boolean("shstk", s, ss)) >= 0 )
>          {
>  #ifdef CONFIG_XEN_SHSTK
>              opt_xen_shstk = val;

Having seen Roger's reply, I'd like to make explicit that I don't
mind us allowing strange option combinations to be used, so long as
what we do matches the sequence in which they were provided.

Jan


