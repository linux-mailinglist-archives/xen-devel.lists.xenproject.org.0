Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D584D3187
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 16:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287934.488260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRy11-00066k-M8; Wed, 09 Mar 2022 15:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287934.488260; Wed, 09 Mar 2022 15:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRy11-00063u-Iz; Wed, 09 Mar 2022 15:14:15 +0000
Received: by outflank-mailman (input) for mailman id 287934;
 Wed, 09 Mar 2022 15:14:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRy0z-00063o-RS
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 15:14:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9388071d-9fbb-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 16:14:12 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-n12ccq3OPMmrT5ro8Y9ObQ-1; Wed, 09 Mar 2022 16:14:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5337.eurprd04.prod.outlook.com (2603:10a6:5:1b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.18; Wed, 9 Mar
 2022 15:14:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 15:14:08 +0000
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
X-Inumbo-ID: 9388071d-9fbb-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646838852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yrpNBLGYU93k46NxfhdHcGQjmVPUW8QJexOIfYOXk4M=;
	b=nSDCcxn7NJhFJS7jTtr4+pAh6jVw/qBNRcCsrGPN0LJSLu/gAdHNlV7v90v1Ebd/3mjr6F
	0w/YNUGTRyMgFDVpg8WPu2971RYPxAVaNbxrQy6dVyH334m33NkY+7a+cHQ2KeScNvDL94
	PJqYV6r2gQ6lyU1guRQ4DENcImcjnWo=
X-MC-Unique: n12ccq3OPMmrT5ro8Y9ObQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6WCpm/08k/HAuddhcBSjNaUxTP+d4uIQ7KUoLP5lPvlSxX0oayjLWC8h8NJeG0VpRnUl241Y8qED3Vi04C1r0dPRExfgVcipwUICay0MUq/9W6KhW2BEbT5S0DWwOBdYqOAQU70FWHPnT4Ezf7SGwTl8I3dOUPKD+vVrvfLxn8kwToxmyR/7wZ23CfNZb19wgiIC3DDXQ8/fU+n9r20GO664L6+Qjyy5ECb5F2vqvxfKOkN4iCjE/9aFTM7A1G3Hg5FXhRJh+YjxRY+w2hR3vGbvsPqjmnPzcR94fGPRPp9DMuWnzQj1wDeRyCa8+tHW1BuzKXfvLlyWlkO3s2Veg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrpNBLGYU93k46NxfhdHcGQjmVPUW8QJexOIfYOXk4M=;
 b=VuKeDVVWfcaUt/sXm/hmApSzLVruVwmZPUWk+AE14H1GapcEd+Po9QqwbdFwvWk0jy/arBIPgJE1lqO0POGitlVadFMGSNwu+FuEuSlt1aUSlMsqb71wD+IXFFYt01kayC71rS3G49MNAHM71pFN/9s9x74L52h64V5t5WTFg8UeRtjCq/weYrrdkY9U1UkwbXaHv8WJ2JDW4xjLbnX/M7xINbloAjasts62XH3J1cdCVFQvyLmNvebFHFs/8IypFOGfK0Ais9LjUk0EvvrND5fhbnoPSd7WkdAeVGiGAbdiYD/r0QByl+cipE/yGpvH9Kkj6Da23ILGTBNj3I9d2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1298de41-654e-f73d-128d-23a850c61348@suse.com>
Date: Wed, 9 Mar 2022 16:14:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Content-Language: en-US
To: Bjoern Doebel <doebel@amazon.de>
Cc: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <03798b67ec3a892a302e6be5d87ea676e6376036.1646837462.git.doebel@amazon.de>
 <5cdd27addcec926eb48fdeab08ad3371e7c3fd7c.1646837462.git.doebel@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5cdd27addcec926eb48fdeab08ad3371e7c3fd7c.1646837462.git.doebel@amazon.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0035.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b15aa27-08f9-4071-c71d-08da01df751b
X-MS-TrafficTypeDiagnostic: DB7PR04MB5337:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5337D9C464063353FD5A15B6B30A9@DB7PR04MB5337.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y4Rsky8dBfON5aziZNUp1tvCMJ3XJkE6jdgb/DO2mZP8u2IhuHRjfvCmkkrmDIjoZheMDdivRH9UOEE9F2FVGhRohl5Do/ZIIq5mmtVURqmdgdm40UwbD/PADSyiFWQGObuFuuuMDy9eLyJbciXZIcuPwBe1lrhGpOhuXRRZu2ahQDfU9fFnWS7BsxKECTHiVizXRxuPM1m9xNbjPIAMnip7cV/GUr9PvvBAUPJLtaPbGlsoBYZCtQpamgcx6d/pm4u+Oc2/RlIk+6kj5sO33Ayc7gLFJIPSPvLKduTZE3QUkRDcrY8aSmhL9gjqpgaHqEVbXNV8eXSlhJQe1/QUkOIRwIcCABPjikk6xW4XvHVLMZ8IoAzJTalKjVLMf1uperfcK/iD8XDJYxyhV/YPFBAqJDkxHo0aq7a3aeh6pxh52Xoulo+FBQVdo4ZSNNzMTBsT5CupzsPQotvvxuZWMYCQcf47A3ISAr863/zJRPRfbTCGT0FUnZGxuJfjshMAWpAbgOSVq6WpFnZYR+HypU+YkGpj3x/mIh1gpi/VdGjUJEiXFdC/fT3PRXHJBl6qyinKzR36gEuqCJ24f3Qxvv2HAuhl7eZjqsY8EKTGrOY2XUgscTwkKF3bDEOaOToIG2vEQaOA6x28MCH89WPzTCW+p695MHYYE1pHwMUOOuZXClBVwrvluezvweLQPSQPQDzQgY2zxwU84WEdwe0ki24p3gHfndKU6F3lRIjv5I8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(8936002)(186003)(5660300002)(2616005)(54906003)(316002)(6916009)(6506007)(6486002)(53546011)(38100700002)(31696002)(86362001)(26005)(6512007)(8676002)(4326008)(6666004)(66946007)(66476007)(66556008)(31686004)(2906002)(83380400001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjBTd3dlZDZxMGtiZDQrQ241T1JLZGg0aGg1WTZoMEJVOVArWWl2L0xNclov?=
 =?utf-8?B?RHVBV2xEeHBDQmNMZ1FGK084dVlRSzgwVHdQbnZnSlpxVGdoUTlGWUVXNTF2?=
 =?utf-8?B?TUhNbjJXYk51dDBocGZ5NHNyVnRwWGhNVVBVbGE0RGZSWUhnaDk3NTUwYlBC?=
 =?utf-8?B?UFBtNHhhTGZ1UVRJNXlZaURzZUpNNUR0Zjg3SjJ0RDZPc2VTdWRld0t0ZytW?=
 =?utf-8?B?a3QwQlJBSGVxejRWd3RNNTE4VENWL1cyK3pOTlJlbm5laWdheUZPdFJiSnIy?=
 =?utf-8?B?eW1zaDBSN1N4V1JoSDJ0QnJKcFQvQlJsdloydDY5VzFBUzF2WUt1U2QzMS9w?=
 =?utf-8?B?NnZkd0lucDZyalBKanpKOGl3cWNMdk04alR5Sm1WeXl1eXJxZjFHSHlCeEUy?=
 =?utf-8?B?Y2U4TDlsaVNCZmpuY3M2ZWtvNmN5VmpCMTlMNXc4YkxiS1ZGWjhWOFpGbTFJ?=
 =?utf-8?B?d3ZPSW9xaXFTTit1OSswSkxxcXk3Wmdqb1ZOOEJlczVlVFpOOU5SSUNXSXIz?=
 =?utf-8?B?TTJYOXFWNjE3WFFhUzEyTWU3dks0UGJyZkNYTkwrVXB5M1UwNzdYNFpVbml4?=
 =?utf-8?B?SmhISDcxNHJ0ZGRnaGVkSDk3MGpiVlEvUXU3RDhqMWo0dXUxeGhYUGtvR3lr?=
 =?utf-8?B?NmNIaks4SSt0U1ZVQllmS2tFbHRnZlNCNGg4aSt6Ukl4QWF1S25XZ3pjR0x6?=
 =?utf-8?B?QldDZHJmTVpBUEZOejlqTVRESStiU1pDT3E4K3FIdHJBUlVaOTF5WDR5NDNh?=
 =?utf-8?B?bWhjOUdyR2c4Mk02eE1UdzdsRmtJWFQ3TWgrd3A3SmhrckNjRWdKRmhkWlU1?=
 =?utf-8?B?eURJaHRMOW1ieUFldmovR253M1l2cHIreGVsbDhZWk5UTGo2eXBtV2tmckEw?=
 =?utf-8?B?TzFRV1hCci9nNUlpU3o0U1YvMDd4WXhRZU05UXovb1NaTTJBUktiRWp5aGJT?=
 =?utf-8?B?YXhiL2Z3dkZOdFRYSUFsb1VaTHFqTzJtK1JwUVhQNUkwd1BRM1hwZDArd0NX?=
 =?utf-8?B?dU9zSjBUb0FjY0dOTkVpTWltbmxkMU1aSFoyVGY5VEdpUU9SS1ZKdzAweW9P?=
 =?utf-8?B?ZnowQnNPRkkrMWRONFVDOWEyMWRpTC9BbGYreVcxWWdRTko5eUZYbytxUkEy?=
 =?utf-8?B?NlNRQWRlVTRCUjdMMWRoZjl6QWdjWDN2K1k2NXQ5NEJmbjM1eXhFcGdlTi92?=
 =?utf-8?B?Q3U1VkMyMjhieVIydnI0TXlXT2NSdG5IVUFrNTk4c1FEMkdnaXl1TEhPQ251?=
 =?utf-8?B?bHArR3hkcGFxNUpYM1dlQUx5dHJoaUZaZFhxM1g4TEJ0K1NHRlhFTVZ3dExl?=
 =?utf-8?B?ay9Rb2JoMW1GYUtQMmsyOVdDaTlBQjNWUTJEU1JqUEw0Ty9TdDVDSTBnS1Bo?=
 =?utf-8?B?Qkc2cmdteUg3a09EU1VLaDZoK2RIREtIc0ZDNTZKbTNOdGhvbytRMkptNVlT?=
 =?utf-8?B?bVQrUHVTdVJ5ZlE0OU56c0d6bkZMMVBmU0tBMVFTRU00dU1wTUtGY2U5NGtC?=
 =?utf-8?B?ejdRbXRrT3N4TlgzaHRtdkRDMk5PMHZ1VFRneWpyWk5GclhZV2Y3dTFmVStx?=
 =?utf-8?B?WktuVGhuVGUyUE5NRmhtdEhTbVNRcmVwMCsxY0JIZnhlblc0cGlkZ3dsSGRw?=
 =?utf-8?B?UzE0MUsxWkgweEY4Ym90OVQyRDhma3l1N29FT2RDKzFGZ1VNbkZTdW9Ud2NT?=
 =?utf-8?B?eVg2aEhUYVZLbnliQWtNeURRZytabWFpN2RTY1BOaTVLeEw4ejZmam1tNlUr?=
 =?utf-8?B?VnFia3ZOWkNmVlpTM3pudmtUYnkrSnFKQjFlcURuUUR6UTFBelBBQ0JYRXVx?=
 =?utf-8?B?WUV1b1UwdkY1QndlSjdUMDJncUcyNkcvemlWRVk1RXl1Nk5kQmRMMW81dGl2?=
 =?utf-8?B?Yk5qcHhqN3hqZS9CajJ5VkQzRUx2S2JrbjRvSTFienkxQ3lZOVorUjJMTWJq?=
 =?utf-8?B?eUFHaS9rOFl1YXQ1SE1lcXU0cFIxMFVYODAwRmtQZ0srTWtMRVBlSFNUN3ZR?=
 =?utf-8?B?dU9JcUtJWEdUOGMxZEk3dHNaUkZmSHgvNkYrS2IwdVBsOHpzcXJ6K2NOSlZ3?=
 =?utf-8?B?STRZSGRodVM2cHExOWVWQitkTGIrR1NqQk1BMjlqeWR1NGNVb21DVlpqcDBk?=
 =?utf-8?B?dmFZVE5HOE0vS2FwT0V3ODU1MGVVSEloRVc5bE1MQ3JhYTAwaDcyN1Y0Zm5q?=
 =?utf-8?Q?2FfOKSstyuAX/D2W23dMJbo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b15aa27-08f9-4071-c71d-08da01df751b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 15:14:08.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oiDE3WG1HxaYp27AR0M+NPdYSY5u2NVWxR5BSVw93jAPFVYvydcHO4SSHxDY0NExYJ2KiZon90VapL+ZXpV9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5337

On 09.03.2022 15:53, Bjoern Doebel wrote:
> Changes since r1:
> * use sizeof_field() to avoid unused variable warning
> * make metadata variable const in arch_livepatch_revert
> * rebase on top and make use of Andrew Cooper's was_endbr64() patch
> * use padding byte to store offset rather than reducing opaque area

You seem to accumulate things here, thus making it impossible to spot
what was changed from the previous version. Retaining all changes
information is helpful, but it wants splitting up suitably.

It would also have been helpful if you had mentioned the 2nd
was_endbr64() that has appeared now.

I'm glad to see the casts are gone now, thanks.

> @@ -114,8 +115,21 @@ int arch_livepatch_verify_func(const struct livepatch_func *func)
>          if ( func->old_size < func->new_size )
>              return -EINVAL;
>      }
> -    else if ( func->old_size < ARCH_PATCH_INSN_SIZE )
> -        return -EINVAL;
> +    else
> +    {
> +        /*
> +         * Space needed now depends on whether the target function
> +         * start{s,ed} with an ENDBR64 instruction.
> +         */
> +        uint8_t needed;
> +
> +        needed = ARCH_PATCH_INSN_SIZE;

Surely this can be the initializer of the variable?

> @@ -130,12 +144,24 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
>      uint8_t insn[sizeof(func->opaque)];
>      unsigned int len;
>  
> +    func->patch_offset = 0;
>      old_ptr = func->old_addr;
>      len = livepatch_insn_len(func);
>      if ( !len )
>          return;
>  
> -    memcpy(func->opaque, old_ptr, len);
> +    /*
> +    * CET hotpatching support: We may have functions starting with an ENDBR64
> +    * instruction that MUST remain the first instruction of the function, hence
> +    * we need to move any hotpatch trampoline further into the function. For that
> +    * we need to keep track of the patching offset used for any loaded hotpatch
> +    * (to avoid racing against other fixups adding/removing ENDBR64 or similar
> +    * instructions).
> +    */

Bad indentation of all but the first line of this comment. Also the
middle on of the lines is too long.

> +    if ( is_endbr64(old_ptr)  || was_endbr64(func->old_addr) )

Stray double blank in the middle.

> @@ -143,14 +169,15 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
>          BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE != (1 + sizeof(val)));
>  
>          insn[0] = 0xe9; /* Relative jump. */
> -        val = func->new_addr - func->old_addr - ARCH_PATCH_INSN_SIZE;
> +        val = func->new_addr - (func->old_addr + func->patch_offset
> +                                + ARCH_PATCH_INSN_SIZE);

Nit: On split lines the operator still goes on the previous line. (We
often make an exception for ?:, but not normally anything else.)

> @@ -159,7 +186,7 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
>   */
>  void noinline arch_livepatch_revert(const struct livepatch_func *func)
>  {
> -    memcpy(func->old_addr, func->opaque, livepatch_insn_len(func));
> +    memcpy(func->old_addr + func->patch_offset, func->opaque, livepatch_insn_len(func));

This line is now too long.

Jan


