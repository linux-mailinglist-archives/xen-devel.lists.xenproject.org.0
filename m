Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C03F642700
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 11:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453404.711009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29A9-0006nX-34; Mon, 05 Dec 2022 10:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453404.711009; Mon, 05 Dec 2022 10:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29A9-0006kn-01; Mon, 05 Dec 2022 10:57:29 +0000
Received: by outflank-mailman (input) for mailman id 453404;
 Mon, 05 Dec 2022 10:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Zgi=4D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p29A6-0006kh-Ot
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 10:57:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99a26dcf-748b-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 11:57:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9668.eurprd04.prod.outlook.com (2603:10a6:102:243::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 10:57:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 10:57:22 +0000
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
X-Inumbo-ID: 99a26dcf-748b-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjhA/BSUP/kQ/J43019U+mXMnXoNavJeZm00b9f+yLyX1RQsUsOTjh0wg+YLxpprDcVUW2qXJE48L7Riv2Ira/e2JV0KURqAxqI3a53HbWKd44Mg5yIZ+a4vCIxYPh3rwDQVfNEgqs37BcNW8TKx1UMAROiTHGaBsCXOln3mjrRaAvk6vz0j29374Oig4ENB9lC2rwwynA6CsoShKzBURT/27mBC0Fnl2FXqA1Zth/F/PxiXYcdWNgynCXHmXcav3gKNqoZ6MIbS9fZJAsMNHLwGTOtWc2YiQvE00EMgrF65X92XSC2pY7o/sUFA/q2KZQHLKPGU5U+taFC0EtdD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uv9FYJlS2bgx1NUhzCCEjG4x/8BVZY4I/aG6TUPqcg0=;
 b=d1o706JQ0Pc8thXJysr3urDBNIJ1GiRRdO+XOLho+YLGcwgc3sdK/Wz5ynKv+wr4F68yJLPK+ynrcKO5V53u72O3dFLNMF5D5Bb9qNLH0V962/b9OMEnaD46Z69hKvFF9I0A24FqHcaXH10IF0N/YtlhFib734xlRBz/iw6625SWT9u+U/wy9I+UlkxqDh9g6O6gU7qGeixVFvg+dtcm9EX+m7IAwDGrPHetVtBqBgZRNe//Y0MxS94UnZvDLnjMTsokD0+iOl8HfEstXtq9w2zQuFIyFgwvYLxKov4MZxfJVx9bX86PuDNKD1+z5I4KTQhgMyp0836CMsbzQY5h6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv9FYJlS2bgx1NUhzCCEjG4x/8BVZY4I/aG6TUPqcg0=;
 b=K/4VbMjS5gqRYpCvjtzyfZUQVMgZQUSrYjFP1d3UqBmtBFJV3qJmx+Ahkd5WEAFjPrYVXk6/uZWzKtNeMIA8PcnhY+F0JNyqToHcLSWkKn2jvF3MpGUBNaghp7oO48zkCr8Vlw1Tb8YlbW++fIfiVTUBId67vPm0NNm6VvbsVGHCWIdCIvbg0waObtfFvV6csGLF64kERkAKPqwsYzQCRrpat83YwsAfMRRT8FrMneXR3CMZZI5ribyOZVekO9x/nRIqmjugN8JKTgbpgngHaSjWouQ+U1k2FYvf3STkLSJ4dmYZ/0O2TgQlqE4tULj7NNosk/Z3C4Vvn99cawstQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f634b7a6-4082-e780-7bc8-08a806a04e30@suse.com>
Date: Mon, 5 Dec 2022 11:57:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] Reduce hard-coding of PAT value
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a7d3fc3dfe6fb8dfb75c7b35a78a299bee9685f9.1670172466.git.demi@invisiblethingslab.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a7d3fc3dfe6fb8dfb75c7b35a78a299bee9685f9.1670172466.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9668:EE_
X-MS-Office365-Filtering-Correlation-Id: ae28ca66-84e1-4aa4-a957-08dad6af7c85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1CKfDfXhiXx8sY5Qwbx/opNkYFH3MJzNHfL7mOmbXGlfPTHNtQVTRZmlUKpKRf7mhHt0E1PNI71Y4QK2F37tdOdoG+uyQF7wtx5sOehXFDX7ul011huwYjdj+9E2teq6q4PDe0RsZtsuHai5GCmAirxHh+5YFV/VyrcoOV3MsRd+zFzZfY3YCBGEcygmjFJahQbCIIBR+bf7shPvGG79IcUwni+gsDgKNYstBQiB6voKe8eNaUuogIiOJ9nOjIwC0J1KkBiaOFyu0mx1wwgQZABHmav3MzTibw2No8+bn8bm56mv7p1rIo6Y9Nabr4QGnOIwGAhvNWTfdu7sJd2W07xbW3YPj9bVB7xmRvNnfM1fsFArLKM9Xfjj7Lid2Q22LcOzzUle+rE+z50/uaNIA38X+h6Ecsk8mNJ6+Yq1tglCvTrsZakojJncCbk021ELeUbxbbJqQ04dJwrYW7DB0XKq1sAeZRqaUaYWsxxRkuX82FzgbdkNz6ey65HtVgTqaQyTQ4iUSNS2CsOlxWvQK2Q/MgJ/+xjgHPtFZWdlIeODGlyYsZYcRT6ozBKtBAOw4Digm75ic4V3INtzpPLqSSPJ4lD1l7fAvoSgIu4rlhBeh/RAKW5BlJja8FHHTc1GfveSjLGF4Y/jFBSDfUn6dVXm0dsv6klu3Xxu1Be5fAU+JlQGs2XDFnU45EJSiCpfnS2fGBVhUcQa3t8D2IX+xA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199015)(36756003)(186003)(316002)(6506007)(53546011)(6512007)(26005)(6486002)(6916009)(54906003)(2906002)(31696002)(86362001)(66556008)(66476007)(31686004)(38100700002)(4326008)(8676002)(66946007)(41300700001)(2616005)(478600001)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eCtSUVpkSWRGUnNKS3p0SGJQcFB2UWVtMnhtNkhvMGRMMTNHczRDSm9oSEwx?=
 =?utf-8?B?eURGNyswdUZYUDFxQStZeExiTXE0U2pHbkxHR0xsTURyNUJzYVE0OTRKN1hW?=
 =?utf-8?B?blRFWmtZTm8vVkRZN0JBVzVTU1FYZGJoT1QzTEpubndYeVpDNmIybVlZTU1Z?=
 =?utf-8?B?d0xRY1hxTlNnTDU4QU5NdDN2b2dHc1JrUXY3VHdpdEswZjArZDVOcUV5dVRh?=
 =?utf-8?B?dmRJOC9ZT3hFYWlHSDRKaUlyRkwybFF0NGZ0SnF2UHN1TVcwai93OWVrM2V0?=
 =?utf-8?B?N1lnZEZxa2dyeDZKYXlTRG1oeUo3YjJmcCtRQk14Y3IrNGY5TXRONVk2eVBX?=
 =?utf-8?B?U0VEV0ticGJKblVBNGNQYWlEaGFkNUFUdW4wSkV5THlPTTVYTXUxbXYzTzRV?=
 =?utf-8?B?UDIrWGRQL0s0bnRCd0E2T0VzWlZEcHRpdnE2dEhxYnFHek9VT2hEQThqeUdG?=
 =?utf-8?B?bUVocUhBdW8yQ1VFaVFza296YkNsMzF1TDdkSGhzYkdQVS9xWUl2OEVxTzZ2?=
 =?utf-8?B?TzFPd1EzUmljR1k1M1NSV0cxY1c5VzVIZFBabXcrZWdMdFVjWmwxNStZcTc2?=
 =?utf-8?B?cFdsam12d0pJa2djVXNCVm1yNnMwVno2emdxL2thZmxqYlZYQVZuMmh2YXJE?=
 =?utf-8?B?Q2lwMUhYc25nNktHTGF0VVhqYXNpc1pMS016d2ZJS3o3cVI2NlhLWlRqV0xz?=
 =?utf-8?B?STNXY3NLc243TE5KUTdZRnc1aGd2dkhPNWRNVzl5bGpxOXNUdTBNMVBreEhG?=
 =?utf-8?B?SmRROWNWZTd0UHpzSUVHeFkvY3p5cktQM0hiaFBITDFxWGZTRkpmSHByeHF1?=
 =?utf-8?B?VjVLU2RQdGl3NXEyRkRoNmoyWHNCWE9vdmd0MG4vVittaGdPZGV4LzlBaldF?=
 =?utf-8?B?WURZTkFwNDlNdCtpUExZS0ZZQVVkWjk5eVp4ZEhhejdjMnlaMVhiT0s1dTEz?=
 =?utf-8?B?aFVoL2VuTHlyMHhzUmFYek1QUWdITU5keGlFNHliM2cwMEkrb2FBNFoyU1Zi?=
 =?utf-8?B?RWNzenMrdm83bGNsL24zVlFPTUUraG1ncysyMlZFazJJSHpMc2o2NTl1dXU0?=
 =?utf-8?B?WEZSa3ZDWEZGSU54eWZaQVJJUVFmaXJPUlgyLzdybGZ6Sm4yMkw4ajVVa0p5?=
 =?utf-8?B?dmZHMktTbWNITXZsaUtLS1cybVFMd1gwZU14NlBLc2N1d3BKZEloQjdnOVJX?=
 =?utf-8?B?M2RHaFlmWU1kZlJBZjN0K2VIYWl2cnhjMUlrL2ZEUmE4ME1VTkYyblo5b0Rw?=
 =?utf-8?B?WHIwVjcxcVRjdUVxMDZLLy83MndGS1JTSUhZUG4wZXN4NlJZdGZEM2cyMDR3?=
 =?utf-8?B?cmVEZS8vTks0TWkyUDU5RE43UnByMWl4eTNBN1l2NGwvTWJCTzFFNVZIdUxh?=
 =?utf-8?B?NUJMWXh2MHZzK0JxOUZjUjVRaXI3clgrQTBja1VaUVc0RXhSblhud0ZqVjdo?=
 =?utf-8?B?clRQT0p2ZzJMYjBXMWw4SCtCaFlMa01IRmJQTVRLQjQyQ3RidWphTmtSZGN4?=
 =?utf-8?B?Q01JT1YrRGxpbXcyQ3pYbDFhSEVIWkV3d1lXVDJ6WDNjczZwZWhQT3QrNW5s?=
 =?utf-8?B?cVUxdkRrMytqdFRDZ1FUNm5SK0ZJLzExVSt3VklrREZHVW1JbEJ6TDdIWlNp?=
 =?utf-8?B?eEU5K0NPc1BvajU3NGpwZ2RYNmlmWm9DKy9kWEtoaE9Ob3FGaTJBTHV3ZVcx?=
 =?utf-8?B?SGgyMnhIYUNRQmdIN2ZnblgrTnlwdFphMHg4WTVjZ2hCV2FidnlSTmtTM3JV?=
 =?utf-8?B?QTVCaHFSZkNLQk5nc2JyWXRwMVZUM3NjeHhSV2huUzdLaFQwWjJwOWZKemVv?=
 =?utf-8?B?VUtKNFZPWXRvZUlZME83bnQzaDQwcVE2czVXRHB5dGdqYVhPQ21hT2dycjk2?=
 =?utf-8?B?ek96WXJKNlQzV2NxdjlNbDRMRzJUTWIxdS9lTUROYUFKY2xRVWdBVnJpQ2t6?=
 =?utf-8?B?dnMyUFZ6V3N4REwrYUp4My9LRC8zSW5Id3RJVjB4MGtFV2JFaTVsTS9VVGlM?=
 =?utf-8?B?c2h0RERkM2d2ZEdMcEJQSzJYLzF2bXRSTG9aMGZiQS96cDlKOUMzbTVBOUZG?=
 =?utf-8?B?ZWZxWUNJQm45U2VRNUtzRlRoTnoxaXAvejNpSzhiWEdHelhMVmJYTkFRQkIz?=
 =?utf-8?Q?PIfzeCUmjGhFUM2ZBSl35Orgv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae28ca66-84e1-4aa4-a957-08dad6af7c85
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 10:57:22.5601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCKe0dnUkXu8zryY9lQLWV7KU1jYooXbG6y1SfdqGz8QLlQawY3LDmHn3Jg3zjmoSNGQMzc4inF33nlYE5g9HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9668

On 04.12.2022 18:13, Demi Marie Obenour wrote:
> This makes the code easier to read and more robust against any future
> changes to this value.  No change in behavior (modulo bugs).
> 
> To: Xen developer discussion <xen-devel@lists.xenproject.org>

Looks like you mean to send this to the list, but you actually sent it
to yourself according to my mail UI. Cc-ing the list now.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -961,13 +961,10 @@ get_page_from_l1e(
>  
>          switch ( l1f & PAGE_CACHE_ATTRS )
>          {
> -        case 0: /* WB */
> -            flip |= _PAGE_PWT | _PAGE_PCD;
> -            break;
> -        case _PAGE_PWT: /* WT */
> -        case _PAGE_PWT | _PAGE_PAT: /* WP */
> -            flip |= _PAGE_PCD | (l1f & _PAGE_PAT);
> -            break;
> +        case _PAGE_WB: /* WB */
> +        case _PAGE_WT: /* WT */
> +        case _PAGE_WP: /* WP */

The comments are now redundant and should hence be dropped, to improve
readability.

> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -535,7 +535,7 @@ _sh_propagate(struct vcpu *v,
>      if ( guest_nx_enabled(v) )
>          pass_thru_flags |= _PAGE_NX_BIT;
>      if ( level == 1 && !shadow_mode_refcounts(d) && mmio_mfn )
> -        pass_thru_flags |= _PAGE_PAT | _PAGE_PCD | _PAGE_PWT;
> +        pass_thru_flags |= PAGE_CACHE_ATTRS;

Personally I think the switch to using PAGE_CACHE_ATTRS (here and
elsewhere) would benefit from being a separate change.

Jan

