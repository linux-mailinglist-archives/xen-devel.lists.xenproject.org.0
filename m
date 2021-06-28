Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEADF3B5DC4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 14:14:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147839.272915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxq9m-0002uF-Ub; Mon, 28 Jun 2021 12:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147839.272915; Mon, 28 Jun 2021 12:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxq9m-0002ry-RV; Mon, 28 Jun 2021 12:14:30 +0000
Received: by outflank-mailman (input) for mailman id 147839;
 Mon, 28 Jun 2021 12:14:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxq9l-0002rq-PR
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 12:14:29 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a594bc0-b2e7-427d-adfd-96e3d10df11f;
 Mon, 28 Jun 2021 12:14:28 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-3uTLG9ckNEGPAFMFn3U8yA-1; Mon, 28 Jun 2021 14:14:26 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Mon, 28 Jun
 2021 12:14:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 12:14:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0214.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 12:14:23 +0000
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
X-Inumbo-ID: 7a594bc0-b2e7-427d-adfd-96e3d10df11f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624882467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M90D9+BdxAf5Mno841pb00beQDnilbxJZ2fZ/0gnGZg=;
	b=eQpcboxjNS8RlRJyUREF+MDe8PzWtw1UJRomXebMDRwCipUuQTTKSKYLXpgPkaaRs8RPDZ
	BQq/yqyuK+2n7AikL9mZ4nKMBVaQXdO8bHQsa3jYVD8bpBUnoe/YwhsXnSBLqr7HfNCfXL
	tJYWSzwqvThIgtZZMJ+SI0Ej6VELW20=
X-MC-Unique: 3uTLG9ckNEGPAFMFn3U8yA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fs/xqZLINdwa5bYp5EoujBIkT7M8W7uORxbS9nXiQsWJQRn9HCQf+bA4wZCxN1rVGp7+hvwdDm7QZ8slitqeZEAlz/nnVnMo5FHVXXjtGbB1yI1AhFLfF5liwUbmojk+xhS8hYNuGmO8q9dl6GpAbOlNlNSCzWMtVIAl6ELAgJ07Tk/2hh1nzqnDXI51SXIOi7Xozd+CE7OG1HCgDnKQRuTKccIY9Y85lqF/ZIrVN8yHGFUMOaXGo8Ao0yBIop4PjUFsz9okg3awHs5avYZ7hKokn2TtIp2sxvKqPi3W68fc+djMj5TvlEpv+Xk1O+GnQYApnFUBuv2SL/go5t58Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M90D9+BdxAf5Mno841pb00beQDnilbxJZ2fZ/0gnGZg=;
 b=a9GAl74VtNegW6DcUHF6baSSgdaFKVNlVBt1lzxBvU0SaDB6+0fkdWXzRDpf0yrlpJrYbTG5f0BJ/birylbwLqxy7yjrN6Lg8DFppEJxBAHdDu3iOAS3L0Lo6oo+gXJxwMNTciy2QUxGgdiH1KiSdj4nehjaxbwR56BQEryqNSWdc5IVxE6oh1thWZK75D2Sz1jc9aGnn7XPjzVqVRGXSI4ILtRytkEQdoh0/iXSzU8WlJvrmiWTzV4pQUZc2oIOKM1/G3f7N36C4PoHY0qTFMMEXCb956ASIyYG3WTnmYFuVEjCQGqmDP1u1//b+bk9MER7zWHWa6b9Me7GE2gc/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH] x86emul: avoid using _PRE_EFLAGS() in a few cases
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9285f566-e352-9265-e9e3-e9a1e15ce7d5@suse.com>
Message-ID: <8c9a84a0-4dd5-178d-5409-838ce10825da@suse.com>
Date: Mon, 28 Jun 2021 14:14:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9285f566-e352-9265-e9e3-e9a1e15ce7d5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0214.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eca7c97e-5923-4a52-75b6-08d93a2e4418
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6477513AFE5749A4EABB3A22B3039@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VQL9du8v7RCBIl9p8aUzJbkzyLAN55GeMTM7SvfdgIm7psNub8h487QAdvxxV6azZ9Uk9swmpZtHyMqELWlXibl5kTH7byx9SAucWKpLNL/0IY8cA6yKQuH8kzQRLrDl4Bj2OcAmDNGLBbaNNRyDDU5s/lmZHBeUkEPkQ0+9gHUa3AEddZsjStFqiTzH4iLk9OPa+9wS6nCUS5TgbHRtVXa/rnz1fS/GxcI05k9vFjO8QOkNtTiEIp0TLYAHiQo6qHIk5WJL8FPizbB0cEtxMJxANvnhTcFwtXiBd5rht55jfb2auRT0SVX2UJlkZ//Z1cOkOdDiXguYODAN3kQauLn2Fst3MGoVEKy9iuEG28VEQ3dPyymUrkiM8nBh3TiYZezJyGnbCX40NGrR2JvDXKinJU7tsz8C9p1puVFsJXoDOf7v+9GHVZhlNClkZnmghbeShfkmgWU/OhPC4i0A/eh1Migv+hRgKX2ofr0Qmp2KRo72u8WME228qZDAby3fmMf0pdASr1h18Hm51OZ6depGDDRkmHelGS9VtA4SUp4zJujpD8QDr0mATjcapzcRXgKmWJwpdQHjd8Pkw/xN4/5oYyOq+NbccVpqmMbQUmQHiismUdY6HMhr6qJRkPHMO8EVVD5aXjDqRi+tI2EQ3zX+6Jl4Qxf3rdvea2bDbPFmWsgeE5kufgzxOMdfrxSXH0NiVS9nIJvoBZsP/wVILOSDcjB8QgEEZzUJFFwFYz8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(39860400002)(376002)(346002)(66556008)(66476007)(5660300002)(8676002)(186003)(36756003)(53546011)(16526019)(2906002)(38100700002)(16576012)(8936002)(66946007)(86362001)(26005)(31696002)(83380400001)(110136005)(4326008)(2616005)(478600001)(31686004)(956004)(6486002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWNkRlhwM0ZSRDdBK3hFOWxQeEJlZkl5LzZ4VkMvclhWajNtOHJOQmw5aUhC?=
 =?utf-8?B?bGhOMVNFTjhsMWNKQWovYjhjcXExVU0ydHJnOWRVV1R6eDB6STJQd2Z3aFYw?=
 =?utf-8?B?elRaajJRNUYrT3Z6SlNwNG5sd2NQZDJGT2NsWWdtRW1rZjVqOXh5blgwMEpV?=
 =?utf-8?B?VWsyck53SFFkL3VJbmJXVlQ5djYyb3B5SXBCSGIrajhRUk52T1RWaVZYMmFU?=
 =?utf-8?B?bk9XSXk0OEFZNXd6RFcrR1NYVDcvalhLS3pYWThKUm5JejVsU2lRZkJVRjh2?=
 =?utf-8?B?SHVXNTVvMDVuTkhYODh2YlNqR1VsczJldHNMeG9EL21qSlRRbEttOEJUS2Ur?=
 =?utf-8?B?cWNocTVUNzVmTnVib0wyQXBybmdnaGR6OTRNTElqOThRa3dsU2dTSFFrazl6?=
 =?utf-8?B?SDVFUnlsRllneTNNTGx2Ry9adDFKVHpoT3puQXlkQ1JOUzVEWk5BUVdZN3JN?=
 =?utf-8?B?MytLK0NiN0RjSERiNU1WZ0NoNzhmTGM0SEJEV0lPTm1rSzFENGJ0eFBPY0ZZ?=
 =?utf-8?B?TXRYN0ppUTRLdzA3NnhBZnM0Vjk4VTRWU3M4V1lQSHRtM05LOTloMVhER1hk?=
 =?utf-8?B?Y3JrTnA5WHg2aDVjSEdVSmFtdWxVNlNiWXU3RHdkaUFwdlQ0K2tKdXQzUjVh?=
 =?utf-8?B?bS9CektucERCTE1xdER1dEkybTRwSmpvRVBoSWVwemhsU3VBeW1CbVBBUFBh?=
 =?utf-8?B?QVkvRTYvcHRyVStFMG9pWHhTTDR1WU15UlZ1bno1V0NnV2hqU1U0d2kyY2kr?=
 =?utf-8?B?ajVPUU1vVkFkTUNuRXZiQlpITFd0Y2dQZWxteUxYemFiYk1tTG13UEJhREEy?=
 =?utf-8?B?N1FwTmc0Y3BDNFhyUUNja1RPdXA5ME45WUxNaUc1K0NlVXk5dEtla3BQWHZa?=
 =?utf-8?B?UjNQWHZ3VGxOYlM5NGNkYW8rRGM1c3RlMmo3Q0g5TXZuWkxzMzRlRXZhcXk1?=
 =?utf-8?B?L1ZQUDU1UWw3c0h5clR2Y29Cem9HTHFLUU5TdTlZa0JGb3loUWJmZDdMQ1VU?=
 =?utf-8?B?SEdOaVpDUnAzL2YwWGs1OUtaM1hNMTZxc1VrV05QdjE0Z3RZZjN1MTMxK2tz?=
 =?utf-8?B?YjZKeGdJSTZiRTNuVDk3a21RNE5LaCtWb0NNMDJLTTVSdVQ2VjdLUituNkJz?=
 =?utf-8?B?d3RoWXQrdFdRR3pJWmhjaDk1Y1JXOWZjOGtWc3NGRGFvMHFJOHFMQkVFTXlB?=
 =?utf-8?B?YVJhNG1NeUtrSzh1ZlJnMEp5RmI5NEo1a3pVZDZOT2pjOEZWVC91RTZUNkh4?=
 =?utf-8?B?MnVWSmdRdHVCUU15TGoyQVpIZG1iZXRLVUZ0YnRRaFFRN0czUmNhS3liQzZr?=
 =?utf-8?B?SW0wOTVIYTgzeW1GWjlIVDBiR2s3NTFEU1VNRjdtWlp5TnJzOXhGUDNxakRK?=
 =?utf-8?B?OTFaOUhXRGxIVkJoeHQzY2I3bUZ4RW43SHBXQVB5ajBKTGZ5MDlsK2ttblRl?=
 =?utf-8?B?TEVtd3JoUGVwczNOc3Nkb2MzNVJNZ0VmcXR4UEpwdDk4TEZJSlJNZUo2aDVY?=
 =?utf-8?B?YnFVaE9BL3hhVWlpckxTSFR0MkNxS2d5TjVCMVFlMmNoZVBvOUxIek9HZGtj?=
 =?utf-8?B?dGYyenNxNFBsTFkwdCtwRjRyaWF2Qkg1dUgvUmoxK2NIUTU1djlTTExFcmdx?=
 =?utf-8?B?WjdKQ2ltYXAvN1pSc3ZEUjg3NkFKaEdKMnlrSEt3TnBCSUthaDJWTFg1ajEw?=
 =?utf-8?B?SVR6MU9jd1JQSEdacXJOd1BLOFpHYUpnVUFJVHhpN29XU0xuUEJWQjJhVU1w?=
 =?utf-8?Q?k7z+7aoqr/0Tju7Zlt+d0BPIwImNHpBVd+c+lrB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca7c97e-5923-4a52-75b6-08d93a2e4418
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 12:14:23.6285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnwKEzcJe8AHgS1oyVrHQmbZEtbrStTa35qjM44b7qolCOm80U10YTMn8vm4AodA0D9aT8h6NG2t/mSsq+/8EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

On 02.06.2021 16:37, Jan Beulich wrote:
> The macro expanding to quite a few insns, replace its use by simply
> clearing the status flags when the to be executed insn doesn't depend
> on their initial state, in cases where this is easily possible. (There
> are more cases where the uses are hidden inside macros, and where some
> of the users of the macros want guest flags put in place before running
> the insn, i.e. the macros can't be updated as easily.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Anyone?

Thanks, Jan

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -6863,7 +6863,8 @@ x86_emulate(
>          }
>          opc[2] = 0xc3;
>  
> -        invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),
> +        _regs.eflags &= ~EFLAGS_MASK;
> +        invoke_stub("",
>                      _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
>                      [eflags] "+g" (_regs.eflags),
>                      [tmp] "=&r" (dummy), "+m" (*mmvalp)
> @@ -8111,7 +8112,8 @@ x86_emulate(
>          opc[2] = 0xc3;
>  
>          copy_VEX(opc, vex);
> -        invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),
> +        _regs.eflags &= ~EFLAGS_MASK;
> +        invoke_stub("",
>                      _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
>                      [eflags] "+g" (_regs.eflags),
>                      "=a" (dst.val), [tmp] "=&r" (dummy)
> @@ -11698,13 +11700,14 @@ int x86_emul_rmw(
>          break;
>  
>      case rmw_xadd:
> +        *eflags &= ~EFLAGS_MASK;
>          switch ( state->op_bytes )
>          {
>              unsigned long dummy;
>  
>  #define XADD(sz, cst, mod) \
>          case sz: \
> -            asm ( _PRE_EFLAGS("[efl]", "[msk]", "[tmp]") \
> +            asm ( "" \
>                    COND_LOCK(xadd) " %"#mod"[reg], %[mem]; " \
>                    _POST_EFLAGS("[efl]", "[msk]", "[tmp]") \
>                    : [reg] "+" #cst (state->ea.val), \
> 
> 


