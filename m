Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C55E7CAD7E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:28:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617779.960818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPV6-0004lo-BH; Mon, 16 Oct 2023 15:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617779.960818; Mon, 16 Oct 2023 15:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPV6-0004jG-7s; Mon, 16 Oct 2023 15:27:24 +0000
Received: by outflank-mailman (input) for mailman id 617779;
 Mon, 16 Oct 2023 15:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsPV4-0004jA-OA
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:27:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f599a3b-6c38-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:27:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8638.eurprd04.prod.outlook.com (2603:10a6:102:21d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:26:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:26:50 +0000
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
X-Inumbo-ID: 7f599a3b-6c38-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRxERr2jXMhJDDtyw1JIYSsXs2Z8gHpmtKC4uwUZ8LYNgGkjKOVQkRUSBDRWtlJOu5+8dVxs812iz5VIErNekBSXRmXwzT0Z4w970y5LAEAns/5KF+OfiITJG+BDkFK1ubtoKv1ewJBsvhnt8pdmtlgpBvXyKRRfeY3iZNAMYvVRtFYpF3oNGJcrKneuXzsYYgtndpEkBcSZ4GYJzNY0fsNeNVfW67QL0hvgVG3Q4kycr7PaFBplcmWvPh2R3q+Fe8HDWVdCejIYFy2aqo4lSD9ItIWCexDKx0thh8gGcJeP0C96mXcCLO+y5EAgzb49fzVY5hhllCOaFXHCvuXh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNFF5l0WFjxRRCJamkZRiGvDRuEwmtqhh7uCkOdO294=;
 b=gaQc/ojQBLgRoXTECLF2fjIXkRnt2T14UuVYVp4tkeqln1ft+vrPP/Rz6UXV/H+SlIf/YAua3ftAgbZwGO9NNgKdLJU4bAjhzDxARgUATWz+CDvuUSjAD/1cavhQ03ppP+YkwtQ5g1yLNOGWL6v+KPBWFOVU7tdpedAk0FdM5L9OUDGF57lpRfuv61AwET56dP/RwRLTK9sgGU2lU8K6Ah8cNjR+k3hbWA4uErFNVv5QYmwMlTxhnaYOOrCXxXgUGo0k1i2mc9k138V05wKQsWdzMWvFoc5Be5VgyQILRTBv/gz88vZp+Wt7DVQoqJd/hL10TU7J/Khw4+ti6NTPFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNFF5l0WFjxRRCJamkZRiGvDRuEwmtqhh7uCkOdO294=;
 b=COZ6oes39ac8gJvr+PXLpMRIoAdlkWDJsW3YP/iUpGq+v/PTvZYYqKsrD1LmWuCwk7zjJn2PkUOOAqI3cP2rOGH6eoYi/ALICqFLfklBVdBB99G/azng3vW9YukoIYoX1uKlv2B9Vd2Bc6lK/QFvRcbeBxScPHsFSTz/iwURxcolHaWZXpFdHSa8pvZ4EFByGrK62z8xjOHdrWQHcDR5cy3E0E6S5Nninx/USPz4xNVszXP8VDVFZ02hAmni7rrzu6DWZmLkiVFwB9vfGKbl8Wl/9/3ZVWCyqyjqRa5/t4z7PuRof0lfIXhlNC9m1XAjz3i2YzxFZsLDKv+R2W+Mog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d7cd7a02-b960-384e-4af2-f70b425e5ad1@suse.com>
Date: Mon, 16 Oct 2023 17:26:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <henry.wang@arm.com>, xen-devel@lists.xenproject.org
References: <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8638:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a98853-5761-498f-6779-08dbce5c51c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gAQDfRb5R82A3HuMZXLDygv9OauVnA8MxQ5Kerprn+yTUZWdD2petCCkcqeZnfZbXHB+qAqD0lRtqbZywTRnHJHbCse5q7XdM58Boi+b2p/2ciFk1QipBrIeGKW/niX2Fojg+oN3SO+A+s+7I9+UglgLHMS1+syYpEyyDUj6PAP7lmF6BCUWIukeeS/rKU5A9EVxN/TM5qqe9jlaIE2BDi35+cTOGTro7CAvrRxf581x2Y3/3zLujpmUJWoA1LwIt/K5Hi0jG1+Gib129Qm1cwAm9eWYMkSxKT8n0K1QmjHv/ZMRdKwaFLQcR6N3XNiZ+ACqpXUcVXlI7hibsNTBay/VoPb9h+aRjy3p3HEg5mP1+JYonHD5+PftjWQqej25hmLOhpH2q4Cxs6cTzBEtwGY9c0bCJu+ZZqdiBVIzAyBMvZFso0wL4ZcF3WzJns+s2roo4P/z9oHNiVo7eNQLxl/cRtHu0evkGr2OJApU40fmasNjhHVOMVvf39ZsT88c8QtvDrvL+8xtbNt22WFuayS9DPaVm7v+S4Ak0PItGB7HFCuglXqTxat6ZwJ9czVuHPE4sbwHc+O36HGKgESs8HnlsHgZwN3pt4Ab7Pvp1oijsz0cYYQkqkjhLUQf2xxH6iI3u5XC1LyfDF9Jai+GRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(31686004)(6486002)(36756003)(38100700002)(83380400001)(6512007)(26005)(6506007)(66946007)(66556008)(54906003)(66476007)(6916009)(316002)(478600001)(2616005)(53546011)(2906002)(41300700001)(7416002)(86362001)(31696002)(5660300002)(8936002)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NytHWGU5UXBDeC84bWVZb2c2STF6S0VueDlpL0hMSUxzRXZ6M2FrSjlmNStG?=
 =?utf-8?B?anVTYXdFMWgvczhpaS9sc3QrVjBZVTZMUEJLWTFNbkVrUjQvb0t2ZSt3ekE1?=
 =?utf-8?B?OGtGbWpIc25RZlJEYmttUGxSOE1tM3ZGc1lOTW9CM3pMZGRHQmVSNSttV05B?=
 =?utf-8?B?ME8yQlNhdy9pcU5VZ0syckxyOFVkWUkrekM3ZUNGS1ZaamFtbGFZd3prYmta?=
 =?utf-8?B?V1lHdEM5a3htRkFjSW1mZnVrZ0lHT2lkWGYrMDAwSG1LLytyUE51Q0RWK3JN?=
 =?utf-8?B?UXdXa3I4cUM1Z0s4akRtNXRaNE5PY2FhQXVtSURFZWpOS0RmYVlYY2RZcGta?=
 =?utf-8?B?QWhpcExoaWFxQWxMcC8vdnphNklIWUxDZVNCSkR3RThBRXBQNVhyUHNXdER3?=
 =?utf-8?B?UDRWbGQrTjRxcW1MdXB1RVNUaUQxTnZ5alo5YnE3L3crbldQNFNzNWZNY1E0?=
 =?utf-8?B?Q3RFNm16ak9wTUJQcUh6UStTMnlaZitoSkZ3M2twR3VQNkp6WVhiRlpDcFQv?=
 =?utf-8?B?Y1VlQW1jT0xYRDV6WnJJVDdnZ0NHeHFpYmlqV29WdC8yYlRVUWVOMDU1c1pa?=
 =?utf-8?B?TElqaTRRS3YyWS9aMzZaVktIM3l3cHZyemRqNWh3RnVMeVhNcDVjYytNN2o2?=
 =?utf-8?B?WTUyKzNrQVNxMGp1ZGNZT0IrOUtpc2NGTWxyNkpYUEg2UjZOOTI5WTZ6SU41?=
 =?utf-8?B?a3M2MjgyQ1d6akhJMTFSSjNGNzBrL0pGWEtiWTJGc3p5OEVKaXl1SWFGdnNN?=
 =?utf-8?B?Ukk3SjNNN1YwVVRwazRKOTVQV2NmbUhRdHFIREJRYkNxQklCTXU4Tlo2STNS?=
 =?utf-8?B?bG9BcFlNc2dqVGF0b29tdi91SGEyUGdkdzFVRFZCYTRuSzlWRVNuWGo1YVZG?=
 =?utf-8?B?UFIzWUV0b1htZ1JmS1YxbUoyYmh2c2N0Q1FOWDVOVFNSVVVXMGRzUVZYSEFC?=
 =?utf-8?B?cTVXUW5KMWQyeHRJM0d6cmkvTGpBeS9GT3Zib201Q2NhUmlneXlTM09ubHBZ?=
 =?utf-8?B?SXFHN0dNemduSVFSc3pOZ1dDc1JvWnl3WVpaOGw0YTMzdXV2V0NxblM2YVl6?=
 =?utf-8?B?Y0F4bjRDOFU2VUxBMHVpTU5lcDJBTENHOWVxTUZkTmVUWEY0eFozZW8ySEd6?=
 =?utf-8?B?VE1jQ0pjUU51dWN4VjM0S2pwbTFsSjRiQTI3dUVrTUlYZ2x0d25MdWJGNzJp?=
 =?utf-8?B?SE5lNTArOUMxVTE1YkZmSnJRRkFob2xwZU5aUGVtZXdFc21ZWjUrVnN3YUh3?=
 =?utf-8?B?LzN6ODlZcldrMWhBRGtqS1Ewdnl0R1oycHpkSVhUbHkranZSSm5GdFFuVjBH?=
 =?utf-8?B?ejVieWVXeUVOYjVNNWxsZ3Y1cFVLTTRFdVdTck0xaEgrbjJBekN0WjVnT1Bz?=
 =?utf-8?B?NnNOUXFUbGgyeGx3U0owUnBPemtwRVBQYjdscyt6ZUNtVTZ3dThhSUZCYTlV?=
 =?utf-8?B?YkpiVmpXWkxQaFlyTG5vQmhxL253am9UWk9zQVRXOTNlY1NyUXdkZlU5VSth?=
 =?utf-8?B?Q25sS1AvREhGMXNEbFhMajlvVUtCSE5HTm42bUhtZVUzZWc5OE5UU3BpY1Jk?=
 =?utf-8?B?bGtMSGFCdk1KYkFQcFZNKy9naFZFeGNvcXhKQTRZN3hVZUY5VTM2ZnJGR1hW?=
 =?utf-8?B?dHl4NlBONTZ5RGcveis1QTk3NlkxL05zSWhRbGZ4WmE5Z1pBeTRUeFN0Q3Qv?=
 =?utf-8?B?TkZ3cXpkQWk1blpzU3Z2MjFWQitTNDVzTC94aElHc1JXcytvSU9UNzZCY1Fr?=
 =?utf-8?B?RTdaM05WTXlZZHp1MGtJcURFVWU2ZlpWZGozK3dnUk4wdnZqZW9qOWlCM1dx?=
 =?utf-8?B?aEpnNG5nN0FiNzVqWW9henZmWGNyRHN5SUpaU0JPb0hkU0ZScWtDTW5yVVJm?=
 =?utf-8?B?Y3ZKcXFydnNVU1Y5VExQQjR0T2w5NzVCL0hDcngrbDQvZkJmMXBFZzUzOVhF?=
 =?utf-8?B?emh5WGZPMGkwWWMvdGpXbWF1TlB5YnNKYkZsc3d3TjI3REdSYmVNOWR6K044?=
 =?utf-8?B?SEFhNnA0eXpTcEtGdWd1OUNpWGJSdlVMek9lS2M3WFBCN0tuelYzS0gvVWVa?=
 =?utf-8?B?RVhVUnd6SlluS0FCd2lOUlhsNW9xK0EySzJVN0llSEFGUGErMXZPWjljWmhJ?=
 =?utf-8?Q?Cakcpq6c4fJ64Dgi1AY2y2Tgi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a98853-5761-498f-6779-08dbce5c51c8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:26:50.9572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2UGeZ3oHcZJNzrRiBgnOHtY5d/U0G61/uDAJ6eOW9cY/hp7rTuRvdlMzOX9Ek3XUecFK5M/EeqhZG2E99B23Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8638

On 03.10.2023 17:24, Federico Serafini wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5901,17 +5901,17 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>   * a problem.
>   */
>  void init_or_livepatch modify_xen_mappings_lite(
> -    unsigned long s, unsigned long e, unsigned int _nf)
> +    unsigned long s, unsigned long e, unsigned int nf)
>  {
> -    unsigned long v = s, fm, nf;
> +    unsigned long v = s, fm, flags;

While it looks correct, I consider this an unacceptably dangerous
change: What if by the time this is to be committed some new use of
the local "nf" appears, without resulting in fuzz while applying the
patch? Imo this needs doing in two steps: First nf -> flags, then
_nf -> nf.

Furthermore since you alter the local variable, is there any reason
not to also change it to be "unsigned int", matching the function
argument it's set from?

Yet then - can't we just delete "nf" and rename "_nf" to "nf"? The
function parameter is only used in

    nf = put_pte_flags(_nf & FLAGS_MASK);

Jan

