Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F215B4B517B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272094.466909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbFF-00075T-W8; Mon, 14 Feb 2022 13:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272094.466909; Mon, 14 Feb 2022 13:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbFF-00071G-P0; Mon, 14 Feb 2022 13:18:21 +0000
Received: by outflank-mailman (input) for mailman id 272094;
 Mon, 14 Feb 2022 13:18:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJb3X-00023t-1C
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2d506b2-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:06:13 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-g_p5hmWkNEqg-6-zvkGJCg-1; Mon, 14 Feb 2022 14:06:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5199.eurprd04.prod.outlook.com (2603:10a6:803:62::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 13:06:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 13:06:11 +0000
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
X-Inumbo-ID: e2d506b2-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644843973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4FVh8cPtI6Qx3JBUWvCzCxbP2jpQnDKqAq4oIJlIiI4=;
	b=mn6NzQgz8I54a8fpXxqLmJsV4yzeAY3kKr+i+UI8us4zyi5Ipboh9iWOcitAlLdA7n8kj/
	BdDFjOIuSFlEmoZSp4hCu4sBmEOFewGRiXQTjlXjf8ZBHSSIb5vKQZSUuc7E0k7r0JuJ1n
	RBk5y02M9JwanH3ZhX52qz+DvtVLbwo=
X-MC-Unique: g_p5hmWkNEqg-6-zvkGJCg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSrVERXDbLP5B1NZUaO56yeafgddpABbB5DnxoLqeCYCV3WB4lYMxOpju8AM3leQBUgda5yQ6s7CZsygweV/LkYEnFUTfKWZFqDMzCz3FSsBL4ujiv0xUlYWOcSCXFEzVxBPZc/6SLNzjwIwuYD84Xfkputf7xlLWeHC5KI+vnmfsbp6jrUILfk2Xo+8SCwktvtzEGjyH6EC8k7nk6fMrW74kTdE6ZTYhrbnAWzFj8i2GvUlrcLeonSB3MArV7n0IG+fp+WN/lQinI+Hh/hYxDepjqkLmvyzNGmU3GiH4kJacwUWtdrCs4EHz4FXsBYDOCiC5tDJspGUS2M/50aw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FVh8cPtI6Qx3JBUWvCzCxbP2jpQnDKqAq4oIJlIiI4=;
 b=JM30sCrm5MFJOV2NDn6W7AEKm+MUak8vZTIZeUeazom+klpVqVmrtelKbr7xScRb4yM6D+1kLZ37ksSZagH2sKPTyBJ1tA9znsgTP1kcyYpDdvYweJG4bFJEpY4NtbX4yrzGtnJoT5nicOQIiRpW9hZxG+AqeN7rW4E+euWMFzBrxo8Fw8XJCpbDcHlANPHWHZt1/7s9yevfLc5lDOohVH3dB7c9Me0lLyF0oPSaMuPPo+uxe6/w1ZyT9LcctZblnScExip2/v60vN9lCuMeCZ8pckd+UaDJ9nQaVpHEH2UyIFHn7VrK01u1/qMSl5Hn9QBmXh6q7IBVTK4jNKFbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d53c6f9-8d1a-3d48-6ea6-14a484d578a0@suse.com>
Date: Mon, 14 Feb 2022 14:06:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 3/7] x86/altcall: Optimise away endbr64 instruction
 where possible
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125632.24563-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0037.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51a1ad90-9478-4900-1a98-08d9efbac5b0
X-MS-TrafficTypeDiagnostic: VI1PR04MB5199:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5199FD765B33D8B64AAB23F4B3339@VI1PR04MB5199.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WId77kIrvDMgFcMuaYqBSEwJn3q/QCPPwdzfFvMKzyLq/xW270P8vvNzftsYxbMI1Rcla4gDNYDz4ppCnNlNGG1VH58ZoAvWv1wO671zTnCQEirPkAvjmmsG4Hyc+xQ1CFjyu1QppzHN+q3D2a4Sv/b/g6hgGl1viX6VBZOqBz2wGJrbGbhMySytE86onpFNkzIkp2n9Dn18pGnxjQnfFmhF6+RZtI4drTkXJKGNPXCyaAzxmW6hBpYiWCIZVjYVVQry3R4XOu/Ip84plUSlEiAtdagX6bmZ5JuUGagbHsQ90w8CRJLuC1xq/2C2Yu9+s81Mb0FRsI7zLZHZNTUDDbUPmVDJpB51Qlv/Cr5WXi1Xez9pqxJnuM8sz2F4X/swNphUw7GUealVVcvLqxZjugllllHCGKlPjEa0xN8ssgWv5Tf+C+MFh+A0IkI8V6QYZq64JJXfpgV8anr3lLgt3m4d+PargU99dL7DFeYhXhTMtKfrW2TWR/1jQZ9Y6NuZfteSf6TNSqSNjUAZD1qJ9vyIbJJf7RHxQTeDq22LFUMFpcjkrt3+1CjA4VTtyZN9Y1T0wCC2l9sGb8Th42wHJ1mWqrtfRbytngAJMVX1MCvuCsI7A3iiift091rFJgvZOuWLqQbeoROAjnk5Ttu7HD6XKNL4KbBR5KKhkpuVoPndTnk5jmXPDR0mim8lpYlMP3CL3f/FHF2rI0dsrNZO6juTmiUjcylHChgcunEGoAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(31686004)(66946007)(83380400001)(36756003)(86362001)(2906002)(5660300002)(66556008)(66476007)(8936002)(8676002)(31696002)(508600001)(2616005)(54906003)(6512007)(6506007)(6486002)(6916009)(186003)(316002)(53546011)(38100700002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3BnckpCZDhxTG54Y2FkMURyWkxhYzdsL1ZxUFB3TkpYNjZMU3NFRTk5a1JZ?=
 =?utf-8?B?bDdMc29YZ3Y4L1VnT1N6QUQ1ZlFoZ0hyYjlMYTgyMWhHcEVGSW1xSWZGNjlw?=
 =?utf-8?B?bUErTWsxeS9leVQrQW5FRzlzZTErcFNtVWZURkg2VFlFSDQ3L08vODNiTjNp?=
 =?utf-8?B?YmhtTzV4WDFKQVkwS2cvY2tBUjV4YUxQTzZVSndsaXMvc0U3VnFrd20vL2NK?=
 =?utf-8?B?TEU4WFhKaTQ1NGhKME5WQThDYklPVHpFZjV2bnF6RnVXMjBvNGFLb3F5a0Fp?=
 =?utf-8?B?enFQZk03RnZ4MGcwT2twanFsOVV3QW05M29lT1l5UFdkSmZqWktRbUtzSExl?=
 =?utf-8?B?WGhJYUhuTnlZMjNBUmVLdVdyME9ES2hOVkllKzJKR0RxMFhadE04SWJHallE?=
 =?utf-8?B?MzVaRmRFMmMxZ2EyRCt2RU5zSGR1ZDFUNmF0eStoTHk2SEdjU1kvN3UxMjdR?=
 =?utf-8?B?YkVtdlFxOFp2dzhscHRzQVRLUnQxOW1wcEsrdHVJemQxVXRFc0JRZXVQVnJO?=
 =?utf-8?B?SVZxN2NDcWhrVjNJY1hiMWc2WjNZSXNoS00zMXNMQXN5STE4NXNFT3hhR0ZC?=
 =?utf-8?B?YnhmZGJlY1h6eWlScmpjZCs4T3dXWUtkWk05dk1FNFNyV3pUdW9TNDNzVmZR?=
 =?utf-8?B?RTB5TllPU3l4ZUFzQW5uYThpYUdzN1ZnNm91VmxEblBWUFlNWWlCSlEzNGRU?=
 =?utf-8?B?T0ZQdkFCOXJBeGpEeWRCTnNmNStUMjEwUkdUZElYbi9ZdThJc3ZiREVhVHJr?=
 =?utf-8?B?aitPcmdnSXpYNGdPTENGcmZ6cXBhQkZEVUU0RW9ucmQ4MSt4MnRXb1JyQ3d4?=
 =?utf-8?B?a2haSUF0YVROT25CUnZzQitKNXNNZU9sM3E4Qk1DYjlJQzFaYnpOUjN1L29a?=
 =?utf-8?B?T0s4VytwS0JHMFR6NytiRmJ0OW5ybDR3L1ZmUFBxTjF3VWZYV3RVYzBQNmRY?=
 =?utf-8?B?QStyeFJVOGt2NmdjYmlldXVzN0xjOHcvK2tscjVReURjbUM1YytBVWZOMTcw?=
 =?utf-8?B?a3lFQ0R3VTMvZWNCWGN3RXRWNDVYbzJ1OFN4RHNQblltc1V3aUJqSHo1NVBX?=
 =?utf-8?B?eDd4ekJiVkViZWxKRFZmWUc5SXpzajVuMzV6QS9meDIySWhIMXVXS2Z6R0hu?=
 =?utf-8?B?d1A2WlBxeDQ3Um16RlBhanc3VVIvVnVHRUM3Z3lJL1VLUlVmL2FTNzZKYjRH?=
 =?utf-8?B?NTlpZklJa0ZpSXlncUR6cVpFckZraXhrODZFNGJQYldCbW9NTnJ1QzVPWW15?=
 =?utf-8?B?U0htSlVYamJobjVxaldKUXhoRzI3ZXFiT0JrY0xQd3g5N3NZODFLZVp6dmtF?=
 =?utf-8?B?dmpLdnQxRHVaRkREV05sNEpvUW9YVGkrN1V0RUdMUEdUYzBmdUlXVUZJS0Rh?=
 =?utf-8?B?Nm83TWpsS1ZBVHgvSFhQaHZoVklBWWpzeGxiYzl5Um5WZzhjME1HQ3Vrcyth?=
 =?utf-8?B?ZFplTTFSV1EvRVZIOWFINVRTZDNwQ1lEMDJoZmNEMmU2MDZXa014WGc2YkYz?=
 =?utf-8?B?MnhGcVUvdmhFWElrOWZBYm91YURveGpjQmZoOSt0V0tsZFFGMzNJT2VyMktL?=
 =?utf-8?B?ZXJneUcvTXI1YjJrMFNsT09jU0JibzRWNnFHbjhhOHRscmRtYjQzbC9IbHdP?=
 =?utf-8?B?Q0RPeDArV3ViTi9Zcmx2NVluUkZLWTdNRFlXQzRsUklobEU3VWJXZmZ4T3ha?=
 =?utf-8?B?SDZoMVZkK1gxR3dYY2cxeHhlU1BqS3plYUdSdDhWeTMrNnZreUhISmlabEU1?=
 =?utf-8?B?RGwyUW5yemh6NVQySCtESW52TE10NEI1TUZ3cGg1SmNXZ0M4MENiUGY0Rk9y?=
 =?utf-8?B?cnFLWkh6N2F0czdZZ1JvdEdDM1FBRXdFVlN1OXRidkRDTW0veFlzWjlzUWZ4?=
 =?utf-8?B?WVhrbW44eGE0dnhvVFFIeUpIT05ybXNRd3VaWk5OZlcyaVgrcTRqcjVlV05i?=
 =?utf-8?B?dUJiY21GOEFnWUN1Q0dCOXlPUm1ZWERjUjVaRFlFUlpoTHpKeEhENnNmVDlj?=
 =?utf-8?B?TzB1dlkvem1nSlM3M3FSQTNkSDZMd2Vaemd5RkZBYi84ODg5c2g0eUdkT0p4?=
 =?utf-8?B?WW9rbnYvN05GTCtRL3NYY1QwZ0FwQ3dvUlNGc3k5Y1k0a0VUbGxkNUR3amxu?=
 =?utf-8?B?UTJBN3htNzkzejZNQVE4bDFiS0M1Z05raE0zamw1V0xZSFJsekwzcmZOdGJv?=
 =?utf-8?Q?eDSq/3b1njtGXSzwlOlF8nA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a1ad90-9478-4900-1a98-08d9efbac5b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:06:11.0806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8a5xpDeGBPjhmEGgxoGJksrWAI1mPMIR7fIMj5r7d6hhFn1jENsLJMSGeHqdViWj7sGuRCN+JyjY2mhUt6cqvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5199

On 14.02.2022 13:56, Andrew Cooper wrote:
> With altcall, we convert indirect branches into direct ones.  With that
> complete, none of the potential targets need an endbr64 instruction.
> 
> Furthermore, removing the endbr64 instructions is a security defence-in-depth
> improvement, because it limits the options available to an attacker who has
> managed to hijack a function pointer.
> 
> Introduce new .init.{ro,}data.cf_clobber sections.  Have _apply_alternatives()
> walk over this, looking for any pointers into .text, and clobber an endbr64
> instruction if found.  This is some minor structure (ab)use but it works
> alarmingly well.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two remarks, which ideally would be addressed by respective
small adjustments:

> @@ -330,6 +333,41 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>          add_nops(buf + a->repl_len, total_len - a->repl_len);
>          text_poke(orig, buf, total_len);
>      }
> +
> +    /*
> +     * Clobber endbr64 instructions now that altcall has finished optimising
> +     * all indirect branches to direct ones.
> +     */
> +    if ( force && cpu_has_xen_ibt )
> +    {
> +        void *const *val;
> +        unsigned int clobbered = 0;
> +
> +        /*
> +         * This is some minor structure (ab)use.  We walk the entire contents
> +         * of .init.{ro,}data.cf_clobber as if it were an array of pointers.
> +         *
> +         * If the pointer points into .text, and at an endbr64 instruction,
> +         * nop out the endbr64.  This causes the pointer to no longer be a
> +         * legal indirect branch target under CET-IBT.  This is a
> +         * defence-in-depth measure, to reduce the options available to an
> +         * adversary who has managed to hijack a function pointer.
> +         */
> +        for ( val = __initdata_cf_clobber_start;
> +              val < __initdata_cf_clobber_end;
> +              val++ )
> +        {
> +            void *ptr = *val;
> +
> +            if ( !is_kernel_text(ptr) || !is_endbr64(ptr) )
> +                continue;
> +
> +            add_nops(ptr, 4);

This literal 4 would be nice to have a #define next to where the ENDBR64
encoding has its central place.

> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -221,6 +221,12 @@ SECTIONS
>         *(.initcall1.init)
>         __initcall_end = .;
>  
> +       . = ALIGN(POINTER_ALIGN);
> +       __initdata_cf_clobber_start = .;
> +       *(.init.data.cf_clobber)
> +       *(.init.rodata.cf_clobber)
> +       __initdata_cf_clobber_end = .;
> +
>         *(.init.data)
>         *(.init.data.rel)
>         *(.init.data.rel.*)

With r/o data ahead and r/w data following, may I suggest to flip the
order of the two section specifiers you add?

Jan


