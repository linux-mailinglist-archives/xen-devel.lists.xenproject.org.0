Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E114450F3
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 10:14:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221326.382985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miYoY-0001s4-0L; Thu, 04 Nov 2021 09:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221326.382985; Thu, 04 Nov 2021 09:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miYoX-0001pD-TO; Thu, 04 Nov 2021 09:13:41 +0000
Received: by outflank-mailman (input) for mailman id 221326;
 Thu, 04 Nov 2021 09:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miYoW-0001p7-8C
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 09:13:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ee4621b-3d4f-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 10:13:38 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-dIVlQN7QO5yRG9JQcfQDnw-1;
 Thu, 04 Nov 2021 10:13:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 4 Nov
 2021 09:13:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 09:13:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0048.eurprd04.prod.outlook.com (2603:10a6:20b:f0::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.13 via Frontend Transport; Thu, 4 Nov 2021 09:13:33 +0000
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
X-Inumbo-ID: 7ee4621b-3d4f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636017218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/81wyuY2f14e2jpOysYAPhE3iEyIGZo5UgzxSu9XhT8=;
	b=HSEujXenfV8uK/3n05gEVpMWucBZoFmKv4P+ocAog/G81UGDdBpU4pM77po11iCTdLPy40
	0l0cNHDGWOsPPhJy9hQ4e+td98XIxC2AhO5Naw8rAvcjvSgoUWN+gG4bbW6dcpnjVOdMpY
	g8qE6UVmyrixN/qMFh+kmZbQToHRxqE=
X-MC-Unique: dIVlQN7QO5yRG9JQcfQDnw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClNnkJozI4eWHzUSQAGtMJhyxDVICTcUXGeDKiuzVgdhCqK0JGvf3mrhptK15vgCAbe1BS5Qr4R6lYFviZwUH1t9uRSJJW7IDo1u3psSfR4Pb0vAi3fv0UePf5RNrm99fzx0/zBCLQcYQcT++FNg/hhRHshkhg+5pUx++0utCj3W66Jmy6oe6a6FAP0OMg813lSY5Kv4fSKbdaPVck6aa9wrsDN+DRHzZ6H99dtirPFztB6DcmPISw3zcBipGOG7F8b4VP0tYKPOg0LZk1tBvMK5KZEXVLmlGYSkG7xMb1KQhLKXyHUjHXuOlURgmK43jGaEUnb4iDBD/1WoWaDpLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/81wyuY2f14e2jpOysYAPhE3iEyIGZo5UgzxSu9XhT8=;
 b=VdLxEx92DSQXKn8U+vP53IFw7pTaQ67BTnoZ6SgUgMU6yeN7naqZR8vxY3JDO+cEzBQCdNnnhigMUd8Yjn4OKyPkLxCzNjy/lg/Q+GbnXBSUCZO1a71Ci/OaxZ/XNOKCzlGnldYeAgLHpWXTMJ4uUkM2WEmo8EsRcG238WouymMny7cqXBVp9+77PM0aA7s9s4vrUShIk6UbBMqg8LD9AiUIhnW/Gnx2jw27SFtxJXFcXrzwomuZvJCTpfWhSxKKPw8rCGdp9gfwYd2I455bGREqxHZedOZWIFHW5oQxE7lLY07mItKxV/VRHcBbK3KerIzFgkSg8QU440f1I4hIEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ddeeb9a-814d-6a22-7099-f69162dd0db7@suse.com>
Date: Thu, 4 Nov 2021 10:13:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 09/15] x86/pv-shim: don't modify hypercall table
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20211101152015.28488-1-jgross@suse.com>
 <20211101152015.28488-10-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211101152015.28488-10-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0048.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6a81e6b-10b0-4d00-aba3-08d99f7360b6
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3120F22017045B92EA268AADB38D9@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZDBpISU+u9X6tYF9KoDSNsRS+sPn9I65QoKZrsHzWN6oM+uZFVjTsXMfFmytCsur7gMiggUDFKgGiBDRuCM31+SXhY+gBTDRtHTH/93h+fCPLzcfadzackGIS24BhNWdsHVBSQ68gxz0JonjZWndRCG7u3aKG5Xx3TQ8ZJapuybwrv77cp1fAM0ybjm3+9qElIXfIg7C6qcOGXK5Kby3wCLUziOQRYcMsOECHbaCWlJTYSdz0rAyc/5hktDnMa3XIgA+IGbQnWxCKfIE8ZxRmPrDUSE39wNngpvRcXh0PxBmjtX9Zq9PVHESq3gcB9GmayY88QOUJhgmp/4LM+oChJvdo7PqV0gCknETB3qzcnp4U1T7nwpGWIwAFk9FylXQJ6OxL11vFr+MJhqGLb6AnZlLQP8OowFsDNqYkYRgcM0jpAlSqtyyoMbXuIDCAXi5eMqv5/IAKQm5V3TSg/5T7yf9SRT0vFgC6V8B38LRE03gcF3/n6xgym58Z+7MeAmoZgp65JjgUgx3Ae676RFOhtd5EpsNgH9oaiCudNsjidguxvRn+NyR7L7OY6X3IWYtSRyb6pUbcuQt0S614vr0tl+5tPTXvlT6UOJ8Qwk75sn4Loq96nV7zpVOb12P5H+yS+THV+OxGdzaflzdYhGWxjxvpJnoQ3jzvE9DMkC7kmIiuHTzZiOtlxxE3gefuQdmaN/tkFU2Mpc6iy+JTMnkXeZWU0VDA3cCLfDHv+KR9xI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(6486002)(8676002)(316002)(8936002)(16576012)(38100700002)(26005)(4326008)(53546011)(5660300002)(83380400001)(86362001)(36756003)(956004)(66946007)(2616005)(66556008)(66476007)(6636002)(186003)(508600001)(31686004)(37006003)(54906003)(2906002)(6862004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk94c3c4enppdVpGWW9CeUpWT2tIZkliMXpwY2pCVmN3Y1FNWTJTbGdLZkNi?=
 =?utf-8?B?Z0k4MEtEeEZkSTAyKzgxVklxYWRtV3ptVjNLd1N3d1BYR2prZDNiZTBDTTZR?=
 =?utf-8?B?WEprTVRTeWI5R2wzQmdON2NsQjlKbzhDckdka0IrMW85dVo4SVliM0hHSVNZ?=
 =?utf-8?B?Uk9xUkJZS1lRSDZjY0xhYi93YUxQWktTYjY1NmRUSHdVQUw2N2lhVTFaRE1r?=
 =?utf-8?B?dTZIZnpSUExPNGpBdTgwOE5yYTA3RjlnRzNUbzJtVm9aeERxenp6QWhTMUtB?=
 =?utf-8?B?T2F0MU9BZ3lWekNvNWhMaElaYjJXTXJSRUEwYnJFYXppcmNLMHUzbWFTNHhp?=
 =?utf-8?B?anZKVlBRbnFKSUc2MDlxeFkwMW4xZmlCejRsSUVPemRWL09Rbm5EWWNuUVJW?=
 =?utf-8?B?dUx1VDR5Y0JpQytLTDFnRW9UV1Q4ZXlUV0dSSFdKcFJHUFBTc0lKVWJQZWdL?=
 =?utf-8?B?TWsxYy9BbndJbVFTclJXdzdIT0F6QVExYjBCUWR1azlHYnZqejRmUUNvNG9I?=
 =?utf-8?B?WmlHWWZZQmNObnY0emdIWUc5OTJzTTZpcWkwNnhHbC9MRmRLYTdSZ3B5S0ww?=
 =?utf-8?B?UGN3YXJLYlkzTDBYWmZINmNzbCtIT2pQTHRHSytXQVJYYWQzbmRDVGdWcWUz?=
 =?utf-8?B?VWJ6M0ZTUXRkTnhzMGlzcVNTTTBkZ0JTZUVnU2N3UWpuaGl2Z05wd0UzMjUv?=
 =?utf-8?B?bTVicVp5ZkUvc1UrVHpNZFk5YkdsMk9wMHNCY3hMTDRwaWtnOHhicUI0M0Ur?=
 =?utf-8?B?U09qWU9kVXl5ZWRmNDcyeWFlTDR2ZnpBdFhXS1ZFeXFoRXhISW0vY0xrK1U4?=
 =?utf-8?B?YmdYSE5TSzFMTU9vdEt3Ukw3YVNoTTJaSm1MN3JvWkoxNGtGZThhaTc0VDIw?=
 =?utf-8?B?ZjdOUnVYMWNWelBid3J3Mm9Na0N3a3ZzM0xTdWd4Zlo1OXQvRnJyU09mcElI?=
 =?utf-8?B?c1BnaEJtYjZjL0dyVGh3YnBKbloycFhTTDErTE9aMDdqL2lxVzdaMHJsMy96?=
 =?utf-8?B?MXYvcnZuc0dld1g3ZzRzc1E1WWNTSGgzL0kvS0ZJby9BcUFkYlVWdUQ0bEtJ?=
 =?utf-8?B?RjNoY2dpQWZmYnpFQ0xlTHNyWGpwbGd0aFBxNnhKczlzaGgyMi9ON2FpLzVY?=
 =?utf-8?B?VEZXU1d5NXJNSmp3QXRVbWgxQXdaK2NwaG5rb0x5SnJ4Z2JFSGRvN2NnSVBu?=
 =?utf-8?B?dGpFTFlTTkR6NWl2ME1rdndHN2VDN0c2ZXdrb1dTSUYvbWVRZkhZQ1BYbzA4?=
 =?utf-8?B?eFd5aU9IczVyMWZlaTdtdHBERzZOaVBtblBJMVJPNjlzRUtnS3JIUHNXMEt5?=
 =?utf-8?B?ZjF1MzB1bDhxL1BZUUh3Tkx3UWEvajJDOUNJTzhLSFU1NjFPbkplRXlhd29B?=
 =?utf-8?B?K0JZeGc0QlIyb0pldHFUK3ZnazBWMWZsTS9TS3hXaGpVSlRScnh0OENMNGpX?=
 =?utf-8?B?R0cvcFVMZjYrYWpuYWVCSC9rRTZ3OHFONGtRYTNKWi9ha2tNRVBOVFliYUdQ?=
 =?utf-8?B?ODFwZm9wWDBDejlSTitXMmh0bjA3ekU4VndNc2crTG0xUmt6Q1UraGV4UytS?=
 =?utf-8?B?Zy9FY3lDdkp4ZWdGd0VKVUF6WWtrd3JEeWtWWEhKcGtpUTd3ZG9PVmlRK2V1?=
 =?utf-8?B?ZE1hVkROR3pjVEkzV0s1TlZBdUJ6eEx6Nno4WmsrZHFPbGNYYUQ2Y2hDVGRp?=
 =?utf-8?B?bUdGNDhGQ0dsTlhHMDlpYWZpV1NpdFhuUFZDOTE2VjErSnIwN1JOTU5SRC9K?=
 =?utf-8?B?Lzd3QzczcmFkblNIaENadUVqSjNTMkJuR2FCdFJ6RWZyTTdQcEQvbDJ3YU5W?=
 =?utf-8?B?bkZzWVV1Qm5Nd2g0MWFPR2E0MkdQd3ZKUVpRcEpsYXcxTGh3VTdIMVFZc2R6?=
 =?utf-8?B?RkFCNnlSMlE3dHVULzVpQkhINjM5dGFUUnFWUTMwU0wzRGNVamJxR0k1Y3do?=
 =?utf-8?B?MGVmWUxmNVZlMVVrVm1NYStDTmsrWWVxVmovaW1ES05oVWdnblpHWjVNVlM0?=
 =?utf-8?B?YVFRMGgyRlRPSTNBRlAyVm1jYUJvM0UrMFVOV2N5eUlLRUZ4SktiN3l4T3Ur?=
 =?utf-8?B?bFJNYkR2UXRhaUdwNW9sQUdvVmVlUzU0VmR4THBJMnd3NEh5d2Q3K0pHUXRK?=
 =?utf-8?B?Y01vb1l0RlVyVlF3bU1wMHZHZCtDUEU0VUtzVjRCQktmalkrSnpqSjlaTHVP?=
 =?utf-8?Q?dKW8qqs03KX2EGlOwAPgPys=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a81e6b-10b0-4d00-aba3-08d99f7360b6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 09:13:34.3684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYFeLJX+aJD0Zkeyg+iXSK54knKSIOojkB6kD7lzVn+uEwEASeyCnrXppnfbOqtrJl7y4q8pGGY20OjMSJtyvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

On 01.11.2021 16:20, Juergen Gross wrote:
> When running as pv-shim the hypercall is modified today in order to
> replace the functions for __HYPERVISOR_event_channel_op and
> __HYPERVISOR_grant_table_op hypercalls.
> 
> Change this to call the related functions from the normal handlers
> instead when running as shim. The performance implications are not
> really relevant, as a normal production hypervisor will not be
> configured to support shim mode, so the related calls will be dropped
> due to optimization of the compiler.
> 
> Note that for the CONFIG_PV_SHIM_EXCLUSIVE case there is a dummy
> wrapper do_grant_table_op() needed, as in this case grant_table.c
> isn't being built.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with a remark:

> @@ -1190,6 +1194,11 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
>      int rc;
>  
> +#ifdef CONFIG_PV_SHIM
> +    if ( pv_shim )
> +        return pv_shim_event_channel_op(cmd, arg);
> +#endif

At the example of this, this is sub-optimal: In !PV_SHIM_EXCLUSIVE
this would imo better be unlikely(pv_shim). If it was just for the
positive forms, the annotation could actually be included in
pv_shim itself:

extern bool pv_shim;
#define pv_shim unlikely(pv_shim)

but this wouldn't necessarily play well with e.g. "if ( !pv_shim )".

As I would hope compilers don't mind constructs like "unlikely(1)",
I'd like to suggest considering to add likely() / unlikely() on
this and similar paths you add here.

Jan


