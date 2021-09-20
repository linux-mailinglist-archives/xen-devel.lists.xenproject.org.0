Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E681D411198
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 11:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190375.340212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSFF7-0002Zg-6w; Mon, 20 Sep 2021 09:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190375.340212; Mon, 20 Sep 2021 09:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSFF7-0002WN-3T; Mon, 20 Sep 2021 09:05:41 +0000
Received: by outflank-mailman (input) for mailman id 190375;
 Mon, 20 Sep 2021 09:05:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSFF5-0002WH-Sz
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 09:05:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebb118e3-19f1-11ec-b866-12813bfff9fa;
 Mon, 20 Sep 2021 09:05:38 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-qpL20eRVMDuAkqAgV67LvQ-2;
 Mon, 20 Sep 2021 11:05:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Mon, 20 Sep
 2021 09:05:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 09:05:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.5 via Frontend Transport; Mon, 20 Sep 2021 09:05:32 +0000
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
X-Inumbo-ID: ebb118e3-19f1-11ec-b866-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632128737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x1gRd4rVTbYh/if/ZLwT2eaARXO4ZWVJhsrxlMf4eyw=;
	b=U7bxCq3xI9yHVacqC8OQY0fAJGxvbNWbgjF+/otWxVJ9SZsIICPBThGgJt9PDNHE+Ozcp2
	5ciaF5MYk7oK3I+tXBS6SZdiYq5WlsLJ4Cqam6HDh1cdPN7x3qzyu+1oKCZ+uACnlRdxQo
	tcdpZcL5F4eJ7+XVBc8+Hat0iE6g5S0=
X-MC-Unique: qpL20eRVMDuAkqAgV67LvQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dA+cnksg6+iorDGNfEEK9px7MAF+imw3CZIw+T8eYyQfqbTL27RvXmnmwuA3iPRMA4UniELGZuMIm2EXpc7LQlK9zRyXjphdiBrDqjQoB6JV0uCui9Oio93UiBIKR7iHiUoCyZZgqJC6/o2c7mqmUdEG0D6UMa1K5DMXelVBq0fmrXI+ZJybeMs9ChvolIxTHvxkK1TGTNtjBXZjGRlkPFM12rO08n1i0BJUKlr3faAytQKCFzQynxMbyTEMBJSuvMa9lJFQuMEl+P3+s6E4rMSfIlk70l/rK8lNko6Y35uQAtO1KJA6U1CJv5zPHoY9PWmnQ9jF/SJjDHaCBJHqPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=x1gRd4rVTbYh/if/ZLwT2eaARXO4ZWVJhsrxlMf4eyw=;
 b=fysGRk6tFU5OkwCJ2wZVQfTnFeBG60CX+or0i71JmObAB4TLT5If4OUuKOOhR0uMAcagolP2bEfTdEQRKgKE0+eovpalgU2eAnOAhpgJjrwJNWCWHLKVUI4FPXYx7U8e7Bvx8xNnxitCjeYr8MPW2jDRqlFG8UcgbGMVikoDm1gwa+2NMnVw8TvU/8ZH9YdW5ARGPUfO96OJMfscAjqblLnA2/2ubvWdueAPGo6EEUdwmArFrmd+jgoaCV03eqDi+1B98hi+hnyRTZAEL9xrYFuSb3k5IU69AwlSjJoFX2ZAOwgrnJHGTvsF/Sg/0XT6b/n61DIAuxcuJUtErifHFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 4/6] x86/trace: Reduce stack usage from HVMTRACE_ND()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
 <20210917084559.22673-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ef2df9df-df4a-8f8a-3f69-88a027ba66eb@suse.com>
Date: Mon, 20 Sep 2021 11:05:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210917084559.22673-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ffd54a4-4ece-4c8e-fe61-08d97c15cd6f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41905DD3E3F22435672C96BFB3A09@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MEc6eWKwyLPsdldVOfMde3Ht+4a+kRcMxELbhsEW02XBRIR073UI6P1CAkvmy5IJ3uaj5+CgCjBd5g/YY/7lirDMmxzhTkEQfIbq3ojIsEItnLTsqunnyUUuvFpuBbQfHVQW4UYLsuChFv+kVna3wppSe/1WG31OdwMr6nyM7WxxKhg+q9RiFPKOnwZWqmmkNKx/ibRb6adZJGsjK4IH4pmvAjF8JOzhSsBbhPlRl3aKofKwsGENC2+cFNGMClnVha21q5ezLEfuHoZC3QEqv7TR+mD/edb3S4of+9PrH/KP/PNwq+EUNltL3q4Gqhw3kDyr1JV6gcbpRZAOFhIKTlbTeJ1LN6QCIqIVUDqd+7vtz/dNGdBOmi3VZqz9lIB+U+mXZBjG0B7/SgfNBob0CYwjUrYRYTQBt32czVJeknKH1GNXV3zuoiuvZcFaruQmoCGnLjbxynxvHB7vm9cLjnvm1eAZORpZOxAS+8lS2Eye8ZCfSTp/la6ZrI/Pop4bBkqEpLa9PxntsVhQ2zI4Wahqbh3GXnQlXw6X1NQYw0ymZoT0jrwFCX5M0CPRQslZ2HStw/UayA/G/DX6XfacklTGeNKmKsYSt2n1fWgwVGHI6YL38CXd8NKGLDVd930H4T169aRv28vs+owWNupI6ncp71ccmTbjb6sVzYz9chKgljGaSIZzNvdVO8ZZvaCP/DOrlV71LoXDLbFA0smFqbu22NTxPJuXcTuLSXsA57g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39860400002)(136003)(376002)(396003)(6916009)(38100700002)(16576012)(5660300002)(36756003)(2616005)(956004)(478600001)(6486002)(2906002)(26005)(66476007)(83380400001)(66556008)(8936002)(186003)(66946007)(4326008)(54906003)(86362001)(316002)(31686004)(53546011)(31696002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlUzZHNsa0VwRDBVVXhCeU5ZN0wwRVNZRzZIYmhnMlp4S0tYUFNudUVtSHpD?=
 =?utf-8?B?eEp5ekt1SGZWVEJ5T3l2WkZERXlzWE5vTlducE02NTJNMTU2RTRGMjQ5VWg0?=
 =?utf-8?B?ZjlpTDFMS09WMEZuSGc1SFVrRUFTRmVBUmFqNlpJQXdJR0FZK0duS0lkb2sv?=
 =?utf-8?B?RitDSGZRSmUwTkpCdjUrT1VOMW9uZDRxVWZQZUc2K0FkZ1B3emw3OGpCejhq?=
 =?utf-8?B?cGE0YzZ5L2toUmE5c3ZQZkZnaGlwNHVHUERKVDBRdlI4bXk0WG9teDgrRGpo?=
 =?utf-8?B?bm9xdWFKOHBCeHVkQWFYWGdMcys2WEZaMFBOV3R6NWlZOW9XN1Y4RDZ4TWpy?=
 =?utf-8?B?cGIzanYydjUvc0ZmSU1RbzZJVWJuSS9IeWxiNHdkbDlSMUhBbUlCL0xta1dI?=
 =?utf-8?B?WXdtRXdaRk1PbkFKcUJreVl0MkZqZFh3VnM3L1R0UWp1YTdwM0lFU0tnQ0Rz?=
 =?utf-8?B?OUY5anRJSFJ3M29XOXhhUVVTdjVXRWZYenNNRGdVTXltTzc4U3Joa2Z6Tmdq?=
 =?utf-8?B?ajZPbk1MdDB0WU9jVTBXMUVXR1ZzdXJrMm9UZDUrYmJXTERSYXdFdUpzSWxC?=
 =?utf-8?B?aFhHVjlYbnpoTlBjdVhTdjFrUDF1UVJSMk4yV1Y4cFJtZlRYTXR0N2dQREtn?=
 =?utf-8?B?K0h5SFBBcnFuTXVSeEJiNkpvcHVvbjRncVRiVTNaQkVIaDltVWNQWUNhdjdw?=
 =?utf-8?B?WXV1NHpCSXZqc3FmTktqeWNpZmhpWkxteitzcXYyanZYNHRqeExIR1hvRVFC?=
 =?utf-8?B?dHViaWpDTzIyanlZUkljL3VNR3F2aitEemVXc1lxSThURFJsRWVhUnJ6SGhi?=
 =?utf-8?B?S2dPYjJnSUdNa1A5NEw2WVdWOEI4Tk1oeHdlN2NVVFliSkhaNXcwMnE4anNa?=
 =?utf-8?B?UHdJZkEvbCtlZWxxdzVhQ2lueTVVVERYKzBEcmVtWmtaUkNFTXgzWHZNTVlP?=
 =?utf-8?B?cGFzMCtoK1AzcFFvNmw5NTM2dGd5dDIrWkMzMElaUERFZ3d3T1VJenZMc1Yv?=
 =?utf-8?B?VFhpMVVQMHREd3NZd09QbmwveUFJV05hd2lJL1NwbDZmcVhkRkNQQ3RreEMy?=
 =?utf-8?B?MTVQc0VqV2lDUTJEN0ROYTVjcS81MHQ1bGhHL0I1cDVibk9FcEJoU1lSL3RX?=
 =?utf-8?B?NGY4OHdFN1FhaS85QU5XQ3JWMzZBa3B0MlZ4aUtDdGxRTTc5YkpRdTl0S3gz?=
 =?utf-8?B?N2hkMjY5WWRUQWJ3NVRBa2dTTm9nelpmMGtLZGY0YzRyTGE0Q1dsTGFXM2pB?=
 =?utf-8?B?ZVVwMGw2OVFRaXluNGUvSVY1UFBjVFExdnArRTloNFZ0OGxXaFVySzhFZ3h6?=
 =?utf-8?B?cWJ2UU5yQStPM1BZamdPallUVmtkaisyWDhPYXhBZjQ3TzBlZm52RTZrV0Jm?=
 =?utf-8?B?VlJKNE0xZXFvT3R2YWtBVzNLK1NaK3JYSStaVHAwRUZCeWZpZGNYZDIxdlBZ?=
 =?utf-8?B?S1F1M3E1MGY1MHMrdVNubkdXalRhdmNCcThIYWFQL2VLTzFJSHFlMHVhL1Za?=
 =?utf-8?B?dTR4L2Y3aE5aeUdlbGo5UTNlTVVhaHJjUzE4dTdRUDlqQVJVc1QvNktDM0Uw?=
 =?utf-8?B?dXZsUi9yS0RhNi9kNTVRam0wSGhRTWtQYVAwczk1eXZ2MUFMU3QzTzVIMy9m?=
 =?utf-8?B?MHh5LzRkR0Q2N3VIbFE5MEZkZ0daeUZsMG9uR0RJYlgxYUlDRDk2R1FLblFS?=
 =?utf-8?B?V24xbmdpdjhEMnQyaWpPdCtIOEhFSllXcm1za1FEaFIvd1N1TGRUTGM3ZVV1?=
 =?utf-8?Q?dIFP8b2dvVhIyh8uuPSfaHuB5AlTfPnLYNys6M7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffd54a4-4ece-4c8e-fe61-08d97c15cd6f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 09:05:33.3581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBGPNkjBck0ULsnk4Ep71TJjXNTssemEGcgJQGYlrTHj8SaoLvk1/Qt4INgFBMvrkaLZDwDrGXDgTHiJ6HPvzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 17.09.2021 10:45, Andrew Cooper wrote:
> It is pointless to write all 6 entries and only consume the useful subset.
> bloat-o-meter shows quite how obscene the overhead is in vmx_vmexit_handler(),
> weighing in at 11% of the function arranging unread zeroes on the stack, and
> 8% for svm_vmexit_handler().
> 
>   add/remove: 0/0 grow/shrink: 0/20 up/down: 0/-1867 (-1867)
>   Function                                     old     new   delta
>   hvm_msr_write_intercept                     1049    1033     -16
>   vmx_enable_intr_window                       238     214     -24
>   svm_enable_intr_window                       337     313     -24
>   hvmemul_write_xcr                            115      91     -24
>   hvmemul_write_cr                             350     326     -24
>   hvmemul_read_xcr                             115      91     -24
>   hvmemul_read_cr                              146     122     -24
>   hvm_mov_to_cr                                438     414     -24
>   hvm_mov_from_cr                              253     229     -24
>   vmx_intr_assist                             1150    1118     -32
>   svm_intr_assist                              459     427     -32
>   hvm_rdtsc_intercept                          138     106     -32
>   hvm_msr_read_intercept                       898     866     -32
>   vmx_vmenter_helper                          1142    1094     -48
>   vmx_inject_event                             813     765     -48
>   svm_vmenter_helper                           238     190     -48
>   hvm_hlt                                      197     146     -51
>   svm_inject_event                            1678    1614     -64
>   svm_vmexit_handler                          5880    5416    -464
>   vmx_vmexit_handler                          7281    6473    -808
>   Total: Before=3644184, After=3642317, chg -0.05%
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Normally I wouldn't recommend patches like this for backport, but
> {vmx,svm}_vmexit_handler() are fastpaths and this is a *lot* of I-cache lines
> dropped...

The change in size is indeed unexpectedly large for these two functions.
However, what I find puzzling is that TRACEBUFFER is enabled by default
(i.e. also in release builds) in the first place, and that it can only
be disabled when EXPERT. More gains could be had towards dropped code if
the option wasn't on by default in at least release builds. "Debugging
or performance analysis" (as its help text says) after all isn't a
primary target of release builds.

IOW what I'd prefer to consider a backport candidate would be a patch
changing the option's default. Thoughts?

> --- a/xen/include/asm-x86/hvm/trace.h
> +++ b/xen/include/asm-x86/hvm/trace.h
> @@ -67,38 +67,30 @@
>  #define TRACE_2_LONG_4D(_e, d1, d2, d3, d4, ...) \
>      TRACE_6D(_e, d1, d2, d3, d4)
>  
> -#define HVMTRACE_ND(evt, modifier, cycles, count, d1, d2, d3, d4, d5, d6) \
> +#define HVMTRACE_ND(evt, modifier, cycles, ...)                           \
>      do {                                                                  \
>          if ( unlikely(tb_init_done) && DO_TRC_HVM_ ## evt )               \
>          {                                                                 \
> -            struct {                                                      \
> -                u32 d[6];                                                 \
> -            } _d;                                                         \
> -            _d.d[0]=(d1);                                                 \
> -            _d.d[1]=(d2);                                                 \
> -            _d.d[2]=(d3);                                                 \
> -            _d.d[3]=(d4);                                                 \
> -            _d.d[4]=(d5);                                                 \
> -            _d.d[5]=(d6);                                                 \
> +            uint32_t _d[] = { __VA_ARGS__ };                              \
>              __trace_var(TRC_HVM_ ## evt | (modifier), cycles,             \
> -                        sizeof(*_d.d) * count, &_d);                      \
> +                        sizeof(_d), _d);                                  \
>          }                                                                 \
>      } while(0)
>  
>  #define HVMTRACE_6D(evt, d1, d2, d3, d4, d5, d6)    \
> -    HVMTRACE_ND(evt, 0, 0, 6, d1, d2, d3, d4, d5, d6)
> +    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4, d5, d6)
>  #define HVMTRACE_5D(evt, d1, d2, d3, d4, d5)        \
> -    HVMTRACE_ND(evt, 0, 0, 5, d1, d2, d3, d4, d5,  0)
> +    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4, d5)
>  #define HVMTRACE_4D(evt, d1, d2, d3, d4)            \
> -    HVMTRACE_ND(evt, 0, 0, 4, d1, d2, d3, d4,  0,  0)
> +    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4)
>  #define HVMTRACE_3D(evt, d1, d2, d3)                \
> -    HVMTRACE_ND(evt, 0, 0, 3, d1, d2, d3,  0,  0,  0)
> +    HVMTRACE_ND(evt, 0, 0, d1, d2, d3)
>  #define HVMTRACE_2D(evt, d1, d2)                    \
> -    HVMTRACE_ND(evt, 0, 0, 2, d1, d2,  0,  0,  0,  0)
> +    HVMTRACE_ND(evt, 0, 0, d1, d2)
>  #define HVMTRACE_1D(evt, d1)                        \
> -    HVMTRACE_ND(evt, 0, 0, 1, d1,  0,  0,  0,  0,  0)
> +    HVMTRACE_ND(evt, 0, 0, d1)
>  #define HVMTRACE_0D(evt)                            \
> -    HVMTRACE_ND(evt, 0, 0, 0,  0,  0,  0,  0,  0,  0)
> +    HVMTRACE_ND(evt, 0, 0)

These HVMTRACE_<n>D() aren't this much of a gain anymore; perhaps down
the road we will want to have just a single wrapper macro adding the
modifier and cycles arguments, otherwise making use of variable
arguments as well?

Jan


