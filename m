Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC05458B19
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 10:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228683.395769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp5JL-0006kx-DU; Mon, 22 Nov 2021 09:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228683.395769; Mon, 22 Nov 2021 09:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp5JL-0006iT-AB; Mon, 22 Nov 2021 09:08:27 +0000
Received: by outflank-mailman (input) for mailman id 228683;
 Mon, 22 Nov 2021 09:08:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp5JK-0006iN-AR
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 09:08:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfa629f6-4b73-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 10:08:25 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-YLka_QGNMBimcLC7R-NX5w-1; Mon, 22 Nov 2021 10:08:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 09:08:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 09:08:22 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.10 via Frontend Transport; Mon, 22 Nov 2021 09:08:21 +0000
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
X-Inumbo-ID: bfa629f6-4b73-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637572104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=taq/4FP63TvSgH0rGUpj6q6EkDRJb4mcJNZVC5nj74I=;
	b=ZOaZajDI7aifRRk92qxZNw//zQ+4saN0LpbfWdHdNge6AqNlwD50X4BNfWnYwETGo5BZgz
	CVWeiNDGAoYI4ydq/FuwfZAWD8PsZQ88sWSvaG1Y1vkLfmTjPCQTkSgf0pWE5mdvw4P/PM
	mKLDZUf2JRBmrx+DOC92b1Yb2+m3Abw=
X-MC-Unique: YLka_QGNMBimcLC7R-NX5w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WK75p3sLiVB5ysrEn2PCpph9AQz3sxQx1DfcI4Defrg1Si6HGNnTLjDjl8+slB+dCP3HkJsm0ycZJvGOUKmxZfVXsgWWMLQxDttD1qKFqiXDJVWqEGq8Pu8aMrWCJMa7ImUA+eAnoYz9kfdWva/Zru9WWER5DROLgvdULkIhGxiSbpAWOQuoKhWX7p6Ct+UlZbbBc60z98EH2JRZeSz7b1+bNJNWiX2tC6R8sGWJ9klhxh/FSeem/Jr1Q2p3HHx5FF3Zj3ENE2Qg9nANd9UZ/30cfMyaRczU4rHnLgpQzIiq/FyxpgZK6wGkI9MtBC0dLO//ZAkPYQwj3Mp7fMrR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taq/4FP63TvSgH0rGUpj6q6EkDRJb4mcJNZVC5nj74I=;
 b=TNvulYEEJVTjd3O/A7ezuHcreml5YXR3kn3Ul1hyG13EiWxetT88UQHOxloVdGHwEz2QHRDBZqUX15t49SFDyDGw2EkmQnWRLvaF031Ts/ZJFWSVs+wAQ+fkBnSdPoWnmfo2R0sAJ+IGjcdK+uyO8jofI0uuy4w/pJZnd5sBcyTCIOS+XeLKuH5VLLOfQ8/xwP0UPhHaf8khr5lbcWkNTXZUOAsGO7PMLa39UapCcyP0aEMvxEfQrGFeyPX8Rue8EH3jQWYEu5EUU0RkN1XsTK40nbBIX3XWCx0NnVyWrhedSYqsb15tHIJWJmN8b/cG2FdiRJ+I28lW3xWifGlzPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe2af9ad-36a7-40c9-8591-4b83831a3e87@suse.com>
Date: Mon, 22 Nov 2021 10:08:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 5/5] x86/traps: Clean up diagnostics
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
 <20211119182106.14868-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211119182106.14868-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26ae6f73-6da8-4f39-0a5f-08d9ad97a1f9
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038C4E3CE6161731D0A7634B39F9@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gxfTkmD9YDnFBi3cubbjc7G7YH26f08qQfQiqHPRN/OvHhUDhPzGPB7vWlE0To3nNu0/rDR0iAHntEKA/EGFPMTkr6LaO/OyEEEddVD9toM1tnWDElrzV/btxrWLbl38JnrM8v/aQlJh4/GE7C+7keYfg3gpDhb8yLk6+XWWx0eGWo2q68ZcilqrFDC2EzEaACuSLTW+MgyeqdM26rAV0a6dQiWmtaRFJ88avwkF2xES6R6kXiAqy2G2QFVmiJEJ2R1kvi6nmyBbyxdnXn0GpRJ6+bgCSz307Ik7LDTJS7JBNhSTHO+D0l1LmbmhpgsmIr3Zua6/DHtqxgk5P79BIFC8SVSYy1eQhLaYz96elpxzNTA+03veikHETmsScMrpoWaQCmcWr1S/0oEPcsSW9DuUlN3ZiHEvEgjx82VubPa/xV6uoZN8NXVjr7EkfrcNu8zDGjMDR+ugnzxEs1Q0TDRo72vk2F4uGPRQc3LKqE62tfk1nc/Q9k8vUu5ku/abWNevZg/wSLGv8zszwn21cwP+tseR202Wu7WknVu+PrYXV12qoiL6FGLy4oMRHN0zU5Qdw1QyGnY0jRx2150eyMz6i0PGolLZ1/lZGT2Wzuyu2j2Pi2wn5icn7dFmmZ12UiYzmo9jeJoHVs0SFSJlE0/hEA9rrShcEw2aEY+3iE/wXTGgBQpuTcjTSPxzF5pYeu6l5Ik7eHO6Rc0NYYlE7Bsm7RgMXoSCL0UWXGPpeBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(86362001)(53546011)(66556008)(4326008)(66476007)(31686004)(36756003)(38100700002)(508600001)(5660300002)(6916009)(8676002)(2906002)(2616005)(66946007)(6486002)(31696002)(54906003)(316002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWtrc0pyYXhiNENCRlZZWFVCdzdDRkw1ZExRRTdld0syNC9RaGZmQUxYQWFB?=
 =?utf-8?B?bmVXbkhLaHB3eFZaK1U3Y1h4TXF3c1d1YUlES1BSTTNWTzNueUxhMjE0a1J1?=
 =?utf-8?B?UURISkRCMDNTYnFucjNVMTdFNWdsWDZ5Y3Ayb2YwN0xwRlhKbnJURWNFUFJv?=
 =?utf-8?B?MG9QNG5sQ1NjTm1HRStwK0UrbldISVR6bUUwc2ZpN2J2MExQdlBmQS95S1Z5?=
 =?utf-8?B?QTI5aW5xcXlienlHS0UyZFMrNkhNNEYya3RqL2RONkx4MUI2c3poR25ZeFV1?=
 =?utf-8?B?eGRrb0pUMjZDdVFxdlVFZ2hxNytsVldiM0tEMkZlVTZ5QUpOTkZCSXBBQWtO?=
 =?utf-8?B?NCtLWG53a2pDMTJLV3BqTGNPUGlhYzBITzVrWVBMc3RsRElRNi82YTd4VUVN?=
 =?utf-8?B?UURJY3d4Ny9IZGZHNTJrZmViZTJGVWovUjJxa1BzUTJQL0xVUDdDcHVoMkZa?=
 =?utf-8?B?akxUbEV0Q0NHV3dZTytqTzdHVyt1SGhNOGR5QXpVOUowVHNCNzdLdmJXMGsw?=
 =?utf-8?B?WnN6SGdsbDgyZEk1blRRcURBNFRSaFJZUDJBZzBiT1hTbER5emZLQ0xIdzdQ?=
 =?utf-8?B?Y0NNL1JiMUtPVjBoeHQwbm0xeVE1L2VHdzJqOC9TQVhWYWViYk9FQlNNSjVB?=
 =?utf-8?B?UkFoTmMyck9mUURVc0RXMisxOTg3cnBLNW9HOHpPdllsVG4xWDBBVGVSa3VX?=
 =?utf-8?B?VnEvN3l3MzlDS09ZSDhtUkc2dHRhSnNNSThNcDdBV2ZIZGlXS1U1NDNyRGEz?=
 =?utf-8?B?K2xKSjh1Snd0bmdBZjRaTUYzKzZKU2xxcmQraHZKWVMvQnB4N1lKZnc4bnRZ?=
 =?utf-8?B?UEFIOW5oT09yN3RWY1BkTEVkNWVmUnNwQk1TQmhiOUJ1b3ZTVlpWYlJ5R2My?=
 =?utf-8?B?ZmFjNm1hOFllSlhBU3NWOTEwclVYWUphSTQ5WThGVHpTL0VGeVRNYjBLUWtL?=
 =?utf-8?B?RWlCMzdWNzJ4U0tFblJCMmRPaExZWXdEUnJaMXhZRnRZb3I2WkIrNlVJa3BR?=
 =?utf-8?B?UG1PaTVzRkZzL2UyK3hnbGRnRS9tbE1wS3FDa1ZhQjY5dzJtY3RLQlgvZ3VT?=
 =?utf-8?B?U2xjWEYwTzZEL3VpSlJxUytqVnFuUzdzYXY2UzcxbzVtVDR0aStnUVhNM3ly?=
 =?utf-8?B?UWpDV3RrRzRuUEVHUDdpdzl1b2dtdFRrQnhrOWVOeHdMWWNUc0tuYVNOZ0Y0?=
 =?utf-8?B?R21xYUF3bFpGbDBibGxaQWxENUh2OS9mek1Vd0hjVmhPNnRjK04xbnJiWjZG?=
 =?utf-8?B?SkpYclZjeUJ4Z3NzVUFITVQrZ1hlUE9xa2JrUWU3dUxwdEF3cGFsQUlvclhV?=
 =?utf-8?B?Z0hXMXBUWDNjQkZ5bHBZNHN5QzB6MHNMeGlWeUJvazB1RkZLd1VyNnMrcTZj?=
 =?utf-8?B?R3dRQ3JWRjcyU2hDYTQxQkx1cEJQQUYxakJnSWRoWWFOQmFVQTlva2gzTzFJ?=
 =?utf-8?B?TEVqdlhFdnZINnRXRVF4ZVFkL2lwU05kV3YwTkpUYlh6eU9YeEQ5ZU51THRU?=
 =?utf-8?B?aG02NjBTa1lzWWVWeWZNNldIdU1NWGdlc3pSc2pCQXZITkdSTVFZRVJZb0du?=
 =?utf-8?B?TEk2YWcvNGdHZUovMEduZkprU2dyY2JSOEdjcUY4RDl4RmsvajlXWmw4ZFZ6?=
 =?utf-8?B?akNKOXRLN25YTnJYN1ZOK1lnTmVGaVBQYmYvdlNiQi9Sb1FST0RPWjc5Q20w?=
 =?utf-8?B?TEpTRDBWRXJjWit6UnluU3BBbW90aHo2NTN6a3A0RmpISFIvMVpkZk9sN1BE?=
 =?utf-8?B?L1ZSNXhsZ2pWdTV5VnhYWjlrTUhWdEc1Lyt2MEUyRnlDZHZEU1ZxQmJvM2U3?=
 =?utf-8?B?OFF5bnl3OEc5dU44SEhvWHpDdTFKZlEzeTcxVnJYYVNlUlhqdEoxYlpRTFFE?=
 =?utf-8?B?SDdpdHpOQ2NWdWNlU2p5Qm8rdks5eG44bjVDVS8zZ0RDcEVQUFZQcDdlL3ZJ?=
 =?utf-8?B?K09XZ0NPRnZpVzJPOXVwWnVZK3liQlJFeE9hSm5Yb2x2TG1RQ3NMSG5mRTU0?=
 =?utf-8?B?dEI3ZDIxL0ovVVFHcEVwMnd1bzc5N2JaQ0NibWFBNVZMT0tDaEJWZHV4MHVD?=
 =?utf-8?B?LzBSNEZQM0wyakdJeWRZT0xRV1ZHd1Y3bCt4cHF5QmVFT3lWM0lsQTZCVE5X?=
 =?utf-8?B?UHI5Z2tiSGZQM0Y1NmJ1dWM5VkdYcUhOZ1RKa29nSjRsK1NuZjI0c1R2S0lP?=
 =?utf-8?B?NURaNW5QT3FGZWgvYjFNaHpJMDZvQzRFQTFuSUc0bm1YM1dOQUdRWTZadXdr?=
 =?utf-8?Q?Te+QyC7LOZ770jnqKz0VhQE8Tn8iYiGMyXP9ubXR7M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ae6f73-6da8-4f39-0a5f-08d9ad97a1f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 09:08:21.9705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bi2OWDgsrmDZGesL/Ih54BeF0lHFD9IZlOEsKpmdOozzHCRSEqKBIGm4Sm6H3UMFaW9YsyOZ15YseMkSZYT88g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 19.11.2021 19:21, Andrew Cooper wrote:
> do{_reserved,}_trap() should use fatal_trap() rather than opencoding part of

Nit: That's do{_unhandled,}_trap() now.

> it.  This lets the remote stack trace logic work in more fatal error
> conditions.
> 
> With do_trap() converted, there is only one single user of trapstr()
> remaining.  Tweak the formatting in pv_inject_event(), and remove trapstr()
> entirely.
> 
> Take the opportunity of exporting vec_name() to improve the diagnostics in
> stub_selftest().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with one further aspect to consider:

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -759,21 +759,7 @@ static int nmi_show_execution_state(const struct cpu_user_regs *regs, int cpu)
>      return 1;
>  }
>  
> -const char *trapstr(unsigned int trapnr)
> -{
> -    static const char * const strings[] = {
> -        "divide error", "debug", "nmi", "bkpt", "overflow", "bounds",
> -        "invalid opcode", "device not available", "double fault",
> -        "coprocessor segment", "invalid tss", "segment not found",
> -        "stack error", "general protection fault", "page fault",
> -        "spurious interrupt", "coprocessor error", "alignment check",
> -        "machine check", "simd error", "virtualisation exception"
> -    };
> -
> -    return trapnr < ARRAY_SIZE(strings) ? strings[trapnr] : "???";
> -}
> -
> -static const char *vec_name(unsigned int vec)
> +const char *vec_name(unsigned int vec)

Is this perhaps too ambiguous a name for a non-static function? exn_vec_name()
at least, maybe?

Jan


