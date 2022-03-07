Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D644D00A7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 15:04:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286069.485414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDxx-0005qP-51; Mon, 07 Mar 2022 14:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286069.485414; Mon, 07 Mar 2022 14:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDxx-0005oV-1X; Mon, 07 Mar 2022 14:04:01 +0000
Received: by outflank-mailman (input) for mailman id 286069;
 Mon, 07 Mar 2022 14:03:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRDxv-0005oP-4m
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 14:03:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e8fcedf-9e1f-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 15:03:58 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-fvLjhe6tOSae9JkFyPK03w-1; Mon, 07 Mar 2022 15:03:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM8PR04MB7249.eurprd04.prod.outlook.com (2603:10a6:20b:1d0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 14:03:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:03:54 +0000
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
X-Inumbo-ID: 6e8fcedf-9e1f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646661837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LhL91v+erslwG97KFfViS8SOcILS0gvy4/Lv/4rkzE=;
	b=BGwJJq1pXYB7mFgVUuFAc7h8XdvJ0eS//cUtraXmMsGK8i4CBX1i7Ztf46iolnZzatZohd
	c5oGvMAWx/LzM3v9FHuCCu9w1x4hR3/+QzxquJzPkcl/2MXIpsokIa1kJwUYe5LgdPiqMq
	3cAH4OqZGJj2hiawRGsGURS8xWGLr9w=
X-MC-Unique: fvLjhe6tOSae9JkFyPK03w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvx/tVx/NcM2ps2eUcbNOIuGZpKA7yD0nsoIsP15dMlvn2IOMQtiLa9I+rQjXxu0XRU6B7Fp2r2CIRyXarEEdbSONdC/BS1tNpIMXN41Gd9on5OO1V0Mn1qg+KIoxMOJooLTp5+3O7brfW7rJqVlq3XupZ+Tv5BsG1r87y2naezNbH1roaDjjteUsQxfBgRskyYUkB3ILVl7BByjih/1Rq7tzEjvFC1hRgQOlDKUrRgk5+bXdZdQqwuwAB7UJ2HcZJm7loyW5Ju+39B/uEbf3SqO1cDVWDjteUiE+NDMLAurUBzypo+PU1TlrWsgbx7wx/R1IJt0lehregSPMDEw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LhL91v+erslwG97KFfViS8SOcILS0gvy4/Lv/4rkzE=;
 b=ghc1+dZge3+Ga0z+k1OdD/qSfGerPAbbR0kOFcp27mDhTLf87Xd0fmq7Q1gVgnZgzqKHjVjCT91N+EhrNMeRgBF6cdz4TSxubN+NL2KP/la/MO+mRuNeathd1dPaVg0bGHiGMmMk7ckAPETAsaLaDznVNW14pP4gf+4fMMmgRkfTmrAVEGYlATKSxd8+4PBlM98Op4ptqKO9L5hQXHsrYylkI4vp2di1Q7/eTWjuGqhi6DRB/sHad9YkQvGmwZwjY4A/30WfZDkuyBRbrbBdp3knT5NEhFeU51PMoDaUuj+DZc6c/ACsqlkgmZzu9WnbFXVmDe8w3H+k6+ZGz/QSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8315826a-c6ae-0abe-a25b-74e37080383e@suse.com>
Date: Mon, 7 Mar 2022 15:03:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Content-Language: en-US
To: Bjoern Doebel <doebel@amazon.de>
Cc: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1646653825.git.doebel@amazon.de>
 <deb5d86b20c02312023959bae06b0fe651a4b2f4.1646653825.git.doebel@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <deb5d86b20c02312023959bae06b0fe651a4b2f4.1646653825.git.doebel@amazon.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0097.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b23dd623-f32e-4b76-34bf-08da00435099
X-MS-TrafficTypeDiagnostic: AM8PR04MB7249:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR04MB72493982A2F9E0EC5C0B772DB3089@AM8PR04MB7249.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GVRXVcv4WBZ133CRaFuFv8/bbkGqG7KFWLcW+QaLPgr84x7QjwcFDGy99aRJm/C22JkJQljNM6AjsD9XGtVqR50t43a885+mauLbXYPbYrpsXh0vwQqct4ZNwEuvgqBjPJm8rlUBt7sI8pRsskiSsBAJxP1/mWzmGFeVf9Zzh89CEmLwxEWJCwIkf2WWakQFoLdR7QJzMHIedp4Sy03pwySqY3Ku4rQWmSmh9BoVFgrUQ2WqLREnHoXCXAqsDJriPylbhaJXh2P2dgoLHfXOOX9k21evDRoX6rw/WlBngXIJooFdohKUs0yDKgQJBfF7GjaEqH6fhcBIiFBWqrs3gsszHB+JBh0Hb6iIkoQ+VQFj65gNpQ1Mw4H1Ci8AIL0StqHgy7RJU9ypokbeYKc+IwU08a1BnA4L1JMceEcnVoBGIeUdhBrOSc2PPhFsFc84uHSxaLHZDuVk0rooSwoxHG5VEJT+A3ReCDHGK0Dkq3rDsQ5A83BPmGiSGg5DveTlkMWty5xwQZH3w7IyPS0BzCWajuT0Ll/3KlB/6WXnfSrmry0rmwbKdaQ4WOm8zgsZVvmFpMW83Gpk9Sc+fGz/2h1brf03yxB4TAtbs0/XKw/uzKbA7CeCE2GbEm7tvTUbSQafIxZVbvJDwy/7Iqrhos/RSzIm2GG06yS17ug/MSXcJnXYl5EtTWjm/z+4SFRiM3WjlzJ2EnjgHeAUk5yLT20MxNOFpw4f91V53DXOifsbH27NCqeOqweSY1hUzFl8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(6486002)(508600001)(6512007)(8936002)(86362001)(6506007)(316002)(2616005)(54906003)(31686004)(6916009)(53546011)(36756003)(83380400001)(38100700002)(66476007)(66556008)(186003)(4326008)(5660300002)(26005)(8676002)(2906002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2Q5TG11NElkSzV0QmZ1SGk0NTBSYUsxK01RNVY3Znl4cEhzT1YvSDZPbFVN?=
 =?utf-8?B?QUxlYlRqQmRVV0F6bFVsU01kR29sd0I0bS9nRTY0Ky95UlcwRE5OQW9RczJS?=
 =?utf-8?B?d2FTMXVJVGhLS002dlBTZmhFVTNTTkpDeXFzV0pmajdyN2RpcGRicmFZWEsw?=
 =?utf-8?B?YnZ1VDBGclJmWDNqdHRDc2Y0OVlkdW5wRFJwOXJoU3U5NGNXRlhuZTlvVEJB?=
 =?utf-8?B?Z205Sjl6MEgzUERKUmJBSDRKOVNHMFJ5cDY3S2cyUUwrT1dJZk8vRTROQ0pQ?=
 =?utf-8?B?OGJvWnZ0bmdVWlZGa2J5OEl1aUg5LzVMWXJNdlhGMlRGK0ROZHRaY29zRlVa?=
 =?utf-8?B?Y2l3c0xJVVROdm1HaXFaWVdTSEdNQWlTTVZQbUYxbS9iWDdCKzVNS0VFYWh3?=
 =?utf-8?B?UzFraU9UenhiUE9rWGwzOVliSExGcTI4TWpjUWdPSjR3T2laZjNhU0Nrb1l3?=
 =?utf-8?B?cittMGZ6MnNVUCtrQkd4YlM1TEpKYUlhbUF6cU4wRDZMT2tjekxwYkorOEFM?=
 =?utf-8?B?d2ZhVklvenZCaVB5SmFlaGJ1bFYrcStLTHRjQU94VWlmanZjQlBIUXMxdk10?=
 =?utf-8?B?bE5BdGl1a2tiRnVpcnV6Z1pnUm1VakwzY1dnRjQyRXdMRXp5YXJZZ0liaGZG?=
 =?utf-8?B?MTRjTWpueFllWnZoR1FNdFBXbjM5eUIvMEZWOXNIcUo1NDIrVmJ4b2xWODFE?=
 =?utf-8?B?L2xVbkRXWUlkODUxRkpnUUM2UDloYUM2d0NCK1BTRGYvOW5hMlhXNjdyUVBZ?=
 =?utf-8?B?Z2wzWTlmL0VqN2NzaFdTMnllV0puck9EZ1FlYU9wZ1VzM1RudlRsU0RCbk5E?=
 =?utf-8?B?Z2xwRjI3dXhzRXZGY1hOZGt6OTVDTjhZZ2pwQlpOKytIV1VRMmdOdjlVeDRZ?=
 =?utf-8?B?cDhWVDZuLzN2c0R5My9LdEJudzdUTm84WmtPWFNLaXA2SkkwVEg4VjN0YVRt?=
 =?utf-8?B?TFlIdStadEFNeGFIbHg3TFIyV2l4RFExU0NJRnFZZFg4VW9MNVg5cmNQa0x2?=
 =?utf-8?B?ZGRsaUdBTnZkNVZTeVlVQlVPeGc1MzZMREx4SkluQkh3UXVUMzBiRHB0cDhS?=
 =?utf-8?B?OWxMcFhMVDUvdzlReUpBV1R5ZzIrbkVvOUV0OWlGTC9kcmJSWVlhcGR4Mmdi?=
 =?utf-8?B?ME81VWJDRHFPWGZLY0tLOTFmQjNXdzVJVDRxQUMzYTI1T0RkWDI3V2NqeFdG?=
 =?utf-8?B?OVN6cW9USEJoQVF2SmU2V3EzdnB3bmpDdi8vZUdPMTlJclFCbGRHVFNFOTE4?=
 =?utf-8?B?SUpiTHE5aGMyMWljY3FVbGxkd3FiZDlNUFR1NHZJQUF6ZVJPdThVMlhONGF2?=
 =?utf-8?B?VXBtUTJTUkQ4aWhSTVorNTJDM3VUNDgxZzZXSWhYbnAzakticm9ieDhWRS9W?=
 =?utf-8?B?QW92OWYrblZOU3g0cTI5MEZBdmdQb2k3OHBqeWJ4amhmL2tMVTVzNGNhMk1n?=
 =?utf-8?B?T0tmN3lnNCtCMk10d1FBb3V0cHFFUE4xb3NaUjErRzJrekptSTJtaXJSTStV?=
 =?utf-8?B?QW9HR0NmckFQbVJLM3BZUlVJSW1ZNmxxSHRmUk5wdXBKREluamVnUWJBVHdN?=
 =?utf-8?B?ODV3VFhwNHlCZGxicVNxUTZER1REdTIvYzVnQ05mbkhGWWhreEliTEdMZXlS?=
 =?utf-8?B?ODNkUFgrSjFMWk1QR0xPWjRyVGtldXFIaGhCWmVhbVU5UFBaalVzRVNSSjQx?=
 =?utf-8?B?SFZJU2dtS1lOd3ZpKzYzOHVDS2k0U1RsNDN3RC9NS1BIUUlERnhHaDhHQzdX?=
 =?utf-8?B?LzFJZ3YzeVV0a3lCZ0J4V1NPdy8rTTVaWjZFcVNmL2NvUVNnUmNvYUszSVc3?=
 =?utf-8?B?KzE4UzZlM2lrT0k4bG42YXRzdUEzbWJLOEx0T2hpclo0cXZSVFlSSHJCL2dU?=
 =?utf-8?B?TVdRSWVTNkVlR0lRMHZGaGczUk1jYUE5UWtBY2dIREwyekhMV2xDdUlNUDRJ?=
 =?utf-8?B?VWxDRk5BbmlZQmdwS0laK0M2QUhQTDI5VU1naE1ITW9lbDk3dWpla012WXBu?=
 =?utf-8?B?SlhVcFk5MmhzcFM4ekN6alljVkJIa2hwRC9iVC9LNklnMUNOWklJSjQwTVpr?=
 =?utf-8?B?Si9sOEIyd01GNXNOaW4vdTFlZ2FLRzFQelBZUkI3MzhOZGx6cmEyVGZKK0tU?=
 =?utf-8?B?anV5TlJEczlnYjkzNGhzZk9peXY5RTZWeTFsMTU1cUF5SXQ3a3lNdFFLQllV?=
 =?utf-8?Q?BL0Kdq7zHjGtWYwQz2eQP6g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23dd623-f32e-4b76-34bf-08da00435099
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:03:54.3247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrBPv7sJ6B4GxSSbmZrgQEkluLjhBrHS2g/dhk8aR89rcalivqnPnCcd7o9w+uMWHrkksYCxKhysr06Zs2/EcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7249

On 07.03.2022 12:53, Bjoern Doebel wrote:
> @@ -104,18 +122,36 @@ void noinline arch_livepatch_revive(void)
>  
>  int arch_livepatch_verify_func(const struct livepatch_func *func)
>  {
> +    BUILD_BUG_ON(sizeof(struct x86_livepatch_meta) != LIVEPATCH_OPAQUE_SIZE);
> +
>      /* If NOPing.. */
>      if ( !func->new_addr )
>      {
> +        struct x86_livepatch_meta *lp;
> +
> +        lp = (struct x86_livepatch_meta *)func->opaque;
>          /* Only do up to maximum amount we can put in the ->opaque. */
> -        if ( func->new_size > sizeof(func->opaque) )
> +        if ( func->new_size > sizeof(lp->instruction) )
>              return -EOPNOTSUPP;
>  
>          if ( func->old_size < func->new_size )
>              return -EINVAL;
>      }

I continue to be concerned of the new local variable causing compiler
warnings. With the adjustment made compared to v1, the specific
warning would have changed, and we're now liable to see set-but-never-
used ones.

Taking of versions - please tag your patches accordingly, and please
have, in each patch, a short summary of what has changed from the last
version.

> @@ -159,7 +202,11 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
>   */
>  void noinline arch_livepatch_revert(const struct livepatch_func *func)
>  {
> -    memcpy(func->old_addr, func->opaque, livepatch_insn_len(func));
> +    struct x86_livepatch_meta *lp;

As before - const please (wherever possible).

Jan


