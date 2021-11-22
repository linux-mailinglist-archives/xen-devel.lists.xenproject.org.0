Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0351458AEB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 09:57:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228673.395748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp58m-0004jE-59; Mon, 22 Nov 2021 08:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228673.395748; Mon, 22 Nov 2021 08:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp58m-0004gj-1X; Mon, 22 Nov 2021 08:57:32 +0000
Received: by outflank-mailman (input) for mailman id 228673;
 Mon, 22 Nov 2021 08:57:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp58k-0004gd-Tk
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 08:57:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38f8b401-4b72-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 09:57:29 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-E74l1FcFPmqP0nwQ4S1RqA-1; Mon, 22 Nov 2021 09:57:28 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4847.eurprd04.prod.outlook.com (2603:10a6:803:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 08:57:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 08:57:25 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AS8PR04CA0172.eurprd04.prod.outlook.com (2603:10a6:20b:331::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Mon, 22 Nov 2021 08:57:25 +0000
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
X-Inumbo-ID: 38f8b401-4b72-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637571449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gbs47Slrz91ow+m3n6nh5ZKNT8/8EVP0eOUPNRmnsP0=;
	b=apm4232SZEkje22bqVVQEJ8AU1r1hie+gYFlTGAM5p0Ct2OsmZFxXQL+LTKK1zieaFkV60
	nQ/i1UmODmTjyFCoXS2PXJIbRkKEPt1CTKkjZYHly+ILg4LTN+423XmarjOXfWWcV1V6GS
	CIBCN+T+3jXuiOL44H+YSCcQTKK6HWk=
X-MC-Unique: E74l1FcFPmqP0nwQ4S1RqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSFfjdKasNSkkxCxyD4ywsp7Xqq500I6Ck8F399jYnKTtYOHCcZ0SpwCfkeliG8K67ZMdCxRcYe0irFDKxflG7oYtJhu5n5+pOtVMo2aS5UE6fkGNzXqkkKPMqk8rlm682PerwQJJsceAW2AT3fC7jAj0ZeEKiBaI0yA8gsF9rTAXh9gftjP3kswRpKnQ3/hZpYfVmuCR3oc1gG/DQNkygxyNvtxNN+EJ+FiDYIgZ+vADG4Opj8eqFoQn47aMSHe8hRXGumbxzf4s/QT59mqwFuPCD0Re7N37zNvZw0m3gf8/d6VwBpJ+/4+fZtxe4FDGxctZT3ZJmAAyZczgIjsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbs47Slrz91ow+m3n6nh5ZKNT8/8EVP0eOUPNRmnsP0=;
 b=mECpqijHeaYkA5Uoz2Mjzt27oOwprG5K+G32T2PdnTNN0UO09HwPcGg/PponbTRMGQKWSO0PVyq6TStUgaeUcPgmo3SiDUNd4GbI7nNP5jYFGFD7Cyl7CecqINr4RIMH/SyPC89xLh7lis+xuwVqJEdWGOV60B/ichWYjNrsI7VmU310WEWGPkmqLAJY1ZOW0Nc0kmJ7lDAeFfNLq7qePKkLqJ65tUZJ3AXHdbQDfUb2Ab+fFdi9KPaUOVEDibirK49D2MyFXm+82APcHAcD2hLYdhP3lgTYYMuDNm8pU/exx7SMZZyNnomRk0YDXLBrMmeIyUSww97JSR/5iH657g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cff0241-ee75-59f5-49ff-cd29964efcbe@suse.com>
Date: Mon, 22 Nov 2021 09:57:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/5] x86/crash: Drop manual hooking of exception_table[]
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
 <20211119182106.14868-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211119182106.14868-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0172.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6348582-e1e2-4f0d-ef90-08d9ad961ae9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4847:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48473348BFC7969D9DB6DD19B39F9@VI1PR04MB4847.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/6cSZzBzmNgFa6vzq9TfAPsMbngDd6C7lYrB0dNtOF699b0vYl4SticTHjthhA8d8CuRc5N4oQOW8gSTMv+uhOpxpPyvoY1LYUlQ3annNS7d5gHedQQh2/avUAEuETHiCm0lnL4vA2ZRnw7UOm4XBQQ2X/iCNJPxxztKofGbP1+JDCiI1GsSu2n5ijTqan/ht5vv63LI0HNzgHgh2HqTFfFDqmKnd+PPZ04jQe6fFOePmXHppDlkqArh4lePHExda+zh+UMzuG+RWtagPvFkThKG39cwV2M+V0IBoXu42kFmIC/mvadPzh23fdcjrE7B1jgUaSmOnjWuwtLgrtY+HXK5vMldQZV+Lb6NqtFYJn1xlt/GgNTkdGHZrX0UN/4XoOpvZFneTbWKKyJdEixtnNT1wCHH2bky21IM+FYHJGwVa2LVVhWo9wUk7BLPNqHtjS4bYkQ0Sy+2m+QWWeJimSCyq9FfEWjqePb9hsBYGtRe6Kf2FmdKou4FZA2EL1zBdRF2e8FYRGMD+zfnu+O27anXBg4h80cutROng84MxSYEsx7zT7dwNg9EjAw6j9h/AZwFNrl3ypTOIX+1p+pfgSH5fSdy4jkiTszsTt58enU5bMl3BQswKV8tDLeTictAMmgUVEPCaVdrb4SGG9FBqRl1sEUEj4Qf+HAEGREQbug3cidcZU9AdL+HSEED/ceXceT7/yZdSOJD3qP502+HkzOqE6t780yt7hPmn0ZF8Jk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(2616005)(86362001)(6916009)(508600001)(6486002)(2906002)(316002)(31686004)(5660300002)(53546011)(8936002)(36756003)(8676002)(186003)(4326008)(66556008)(66476007)(31696002)(66946007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0FCNWx6TDF6RnJOSXpERzVaTmNHRWdiZG9sc1ludG1rQkovQkZ0Q0lzYVEr?=
 =?utf-8?B?U1hTUlo4Ym4yazBEM1dhL3puUGxSNFdzcjdpck1xUHRRV1VBSmx4MldUV3Vq?=
 =?utf-8?B?d0RGUUNQajNWWVhaTEpiWEZOOTBqQkdobzh2UTlUUE1RUU9pMlZXaExkalFS?=
 =?utf-8?B?MVFNK3czUllIQkd6Slk3RzNyZjJSVmFzVThEM1NheTdmLzZBNUlLY1RnN3ow?=
 =?utf-8?B?aXEwR2pJblRMZ3pQdHV4bVc5dlA0QnpkdHNjSkREUTVYb3k4SjIwKzhJb3Ux?=
 =?utf-8?B?a1JrUEF3dlZmNklHNmkycWxRUVBRSURjUHVzbzI4NGYwTTl0MHVRcGs4Zngz?=
 =?utf-8?B?T3lkckkycXhSZm1YQjZHNS9la1ovRi9WN2NrYTJFdDJZV2t1dHdiWms5Y3Vq?=
 =?utf-8?B?OW5hbGhEU3I5V2hJSHNiTGVwa0NxNE9HT2NDRzJtcHFFY0hrRHhzY0NiNXgw?=
 =?utf-8?B?c0oveXlSN1FGNTNhZEhsT1hlcHVGZzJQMDdpSCt0dzBpNXRWU3lEMjhHSWlV?=
 =?utf-8?B?Zmo4VFQwV0hSQVFzV2pmQzY2ZEJuaXpRZ29xNm9zNk9xRDhNN08vRXV5WTc1?=
 =?utf-8?B?WHdCRnBTZkJqVlRGZkhmbXczMEtzdi9ubGgwdGtja2RNcXg5MlNkdnpRc3I2?=
 =?utf-8?B?MzFUbjFFSCtnUUhIVkJhTFdJVVg0Y3VCNTlTVG1INWw4dUV2NWFVdHRab0Fh?=
 =?utf-8?B?Z1BtN2lYaWhQMGpSUU42ZGFMMTI3K2ErWnVzMzhndjlGbHA4cHBTa3dLb1RJ?=
 =?utf-8?B?QmZXUEozMnNhVkxNVHNadjIvOWRnWG5TUTd2TXZ6aFV1UlBSNmZGaWYwV01j?=
 =?utf-8?B?ZlBHMlA0OUlZeWVFYk84SjhmWnhkbzJib0tkWmUybzB6SU12djMwQ1ZwaW82?=
 =?utf-8?B?RlFOZ3ZVMHkyRFh1V01lNWVCSHJ1ZHFDN0dzY0kxditCeC93c1RRU2hzUkhU?=
 =?utf-8?B?M0VOZWxtNHRTOVFodHlBL0VNUlJpcDFkZEY4eDhCcG80MCtORE55bTI3c3Zs?=
 =?utf-8?B?VjVyRjdkRjIyWk4rMWxzbi9rU2dNbDJnNzBJdnJtVmpIcHJZYmFNUVZ5VTJr?=
 =?utf-8?B?cHF3QTJRN2lSZUVYSWQwMjNOSXNiVkp0eG5JMG14dUhRMm9SOFY3WG9YbTFx?=
 =?utf-8?B?bVZHejVYMlJ3SmMyMitYSXJhZHc3NksyWDN5U1BlNEljV1d6cTlYUWlTeTht?=
 =?utf-8?B?Qkw3Vk4wd1Z1aFlGUGV3SEczNkQ0N2JpY01HR0c2blg3aVZGQjlOREZLYzZ3?=
 =?utf-8?B?SjliSndGZ3dYTDgraEh0bERuODk0dDNnUmJnTkpFSTlVTGt2RFNCUVYxRVpE?=
 =?utf-8?B?cFRlSkF5RTBJL2tCSjd3WGVhR2VRR0hyMTU4eFFVVlhXY1lHTjNsZHdkWHJm?=
 =?utf-8?B?RUpUMDU2cXVYdkpGVE1wdGVKNUZwakpzaEo1VHNXUXdZY2JZUTlRdmgzTE5I?=
 =?utf-8?B?SEg4ZjVNUkV5Z3ZFSEdGTWRYZkovc1lIK2d0VkNXcTJMdnhERGdTNGEwa1V4?=
 =?utf-8?B?ZTZjNXZURXowTlNBUWEyTFByTmgzdGRLL2dBZ05lb0xPZmxtcjVUWHdheTZ1?=
 =?utf-8?B?TUh4TVZXVVZ0Zkg5ck5tRWdvRDBWQ0ZKKzFFeWRtUTRRTFQ5ZE1HamM3RFJH?=
 =?utf-8?B?eWlLaGR0cGdjUGxTZ0FyMEdpQ2plR1YyKzRxVUt3Rk5Lc2FzeGVXendRL3ho?=
 =?utf-8?B?TEtUQlJCekQzMVVubmFkU0FqSDFXenl4Ly9LYWhzWVBDT2JINmlpK3kwb2tB?=
 =?utf-8?B?MW5Xb2NZbnZuVVF3QnhZaXdNdDlqRkV4b2ptMXhrdDBFUTdmR0hsL3VIMzkz?=
 =?utf-8?B?dGM0eDd4UDFPNUVKT2lWcjVtVVdab3loVkxyK1d6YTVPMEQxRkdnN1dqMmll?=
 =?utf-8?B?YktZaHZKcU5zTFBrWUI5eFA3dFFpeW54bm9td2U3cG1RL1d5WjhvanRzUVV5?=
 =?utf-8?B?Y2xmcUpTU0dWWWFlMVZBa2VkSkpQZGkxMUhBYmdFYmVQazE3VExhUXZ3WUk5?=
 =?utf-8?B?YUd5Um95ajdObllYMXQ1OGVSOTVOblhURjBIcXR5Nzhuek1mdTNReEREV1Ba?=
 =?utf-8?B?T3c2bUNGRThlejNPb3o4dlZzVjlmMGJleDZwNTVMbWMzc1pnY1Y4US92V2lz?=
 =?utf-8?B?SUl0b1pSN1Q2cFphVjZTVzB1ZjgxUnNkTEFLK3Y1SXZ2dXpXYXVVa295T2Rz?=
 =?utf-8?B?U2kvMjloNEJZenUvWHNQd05McnZaMFMzL0NXRktLQXY2cjVwR2IzNi92dndI?=
 =?utf-8?Q?+QKHscpnBK4QlXnNr6YfU9LHt0H9Fot1ByNpMUs7gU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6348582-e1e2-4f0d-ef90-08d9ad961ae9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 08:57:25.9083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5HMVVKTiWvtf2X+KVIktfeA/tRfyr6HkQYC1SyA6pTCPn32y0H3UPiKcI0wlWS5yPLthc18xHw38fdR9kHRjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4847

On 19.11.2021 19:21, Andrew Cooper wrote:
> NMI hooking in the crash path has undergone several revisions since its
> introduction.  What we have now is not sufficiently different from the regular
> nmi_callback() mechanism to warrant special casing.
> 
> Use set_nmi_callback() directly, and do away with patching a read-only data
> structure via a read-write alias.  This also means that the
> vmx_vmexit_handler() can and should call do_nmi() directly, rather than
> indirecting through the exception table to pick up the crash path hook.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one remark / concern:

> --- a/xen/arch/x86/crash.c
> +++ b/xen/arch/x86/crash.c
> @@ -36,10 +36,8 @@ static unsigned int crashing_cpu;
>  static DEFINE_PER_CPU_READ_MOSTLY(bool, crash_save_done);
>  
>  /* This becomes the NMI handler for non-crashing CPUs, when Xen is crashing. */
> -static void noreturn do_nmi_crash(const struct cpu_user_regs *regs)
> +static int noreturn do_nmi_crash(const struct cpu_user_regs *regs, int cpu)
>  {
> -    unsigned int cpu = smp_processor_id();
> -
>      stac();
>  
>      /* nmi_shootdown_cpus() should ensure that this assertion is correct. */

Looks like this is the first instance of a noreturn function returning non-void.
Are you sufficiently certain that (older) compilers won't complain about missing
return statements (with a value)?

Jan


