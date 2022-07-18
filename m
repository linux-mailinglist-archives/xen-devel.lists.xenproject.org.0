Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58898577E64
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 11:12:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369412.600818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMn2-0004gn-T7; Mon, 18 Jul 2022 09:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369412.600818; Mon, 18 Jul 2022 09:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMn2-0004e0-PR; Mon, 18 Jul 2022 09:11:44 +0000
Received: by outflank-mailman (input) for mailman id 369412;
 Mon, 18 Jul 2022 09:11:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDMn1-0004du-8v
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 09:11:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3112b39-0679-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 11:11:41 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU2PR04MB8950.eurprd04.prod.outlook.com (2603:10a6:10:2e1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 09:11:40 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 09:11:40 +0000
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
X-Inumbo-ID: a3112b39-0679-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKeZSm6Igia5t4k/foPy3hLJOLKqsL8sVyvJXX2HtxIphSNd0z951snGyRazldQV2YN0YEUUvvzPcYngBp3/29PzGbVVk/anQ+bDakqauCKh0k6q+jJZ5jq1ciFh3hvzVXL+RGVVjBd4bhuQJuBi/4x6wVKxJDbUy0EtSpop7JIHSer+dy2LnVHVBnj8wb49sI82a1jkcsTT6s034mtK83hWiQoQdICoZZVnFSgq0z+0LQaBsAJKPC1LNY5iJu+Owv3wW2ugMROlUyufHzlpGUTsbuMuwx2Et8kxbHLcFT2oSODblswRBAvDVcZbmzR7tePjb88V8qDa6UgOG1JK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEEVgnAVgf0unhwcndHTceHBQIXvox7S5PPgOOD0iHs=;
 b=MRQxS+cPeHkx3bz+725HEzmHaSBVxYSEcT4H0GuMzxGmGkzjZU/8kTczlq67F7AA3ef/sLA7GfPTw3wS8OYfMAl/QOT2btCgpsMLs1pJP+y9N2EJIN9uTvweq+bQrxiFzWaTV/rVHCPsN0zxrQS7B6wzZd81JxDQ7dqbAfrvJ7A0kPh/CC/L1jY/ht1q/4E+B/EGvvSw693spMKfhEIW5Me74HJ5vHDjy1YpF/z1TMPVB5yDFgosxhyEWYTTVu5DNVWykaPpUhX9Lf0fWPL80COrSDwXNunK3mPjbgAZrpoE1k/azINjrJdiPoljgcGe6FPjoxNghFSWgB5puSLRGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEEVgnAVgf0unhwcndHTceHBQIXvox7S5PPgOOD0iHs=;
 b=zjZO4t7x3Tqe9pwQJaSUkoErXoXvhCe1w1PROORgqaDqlSmTYIWwfITNvaZYdaZAVvpBXMaqYKDkONN6W8Uogpjt9ViGpwGTVe6Oo7U7m0yFeHRryBErSLmRLsc34Hbr/BUc2SJPdwIHgaLTgWKyBWZEXxOn60PCsZPbOpzlH3v0YKsV1KLHpyM0VXihWP0KzFF0czO5WufbZDmi/bS4eGPkL/IXp++v8fcWPUnzCIIyfcCahHXGa7jdCU+puc3DdLRdRQh5ySnpBLT1JURNfL7pYxaQvAbBtugxO0/x+KeknKEUYRrKOhOVRMGTq4Yv2Hl8gCixnrCMotreGVjkHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc25adc2-7e99-0394-a446-56a1e5e804e4@suse.com>
Date: Mon, 18 Jul 2022 11:11:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] xen: Fix latent check-endbr.sh bug with 32bit
 build environments
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220715132651.1093-1-andrew.cooper3@citrix.com>
 <20220715132651.1093-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220715132651.1093-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26b15c35-f5ac-4c17-1f39-08da689d864a
X-MS-TrafficTypeDiagnostic: DU2PR04MB8950:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FRkV8n54tAy4K/YfpYqLCS0+HRyN97LdKKDFT4MrMC0qtYS85lQgtdqU5YoI6wGG9mmFKUu9rokdVSudZm+R1IZ6qpxuYXL4JLNA9P6XMPF5oTt4s81ECZt6uUsiMH9roAvqOcus9TP2CEholMiSvAn2Vz233Vse4x7L37YeTmDRSkARIpWFXv5t6I0c0RvLBZdcl2fbdyWlTGJ9mTT69bD8jssxmJ0p18g+xEiUEwnQ4gDEqnrRpf1lVluuUObc4b7RnLP5bGUHHC37sZyUewl9r/OzgbFpK4kFReyecy116ZA0o4Szwqr9jUCasTfGMSbLqm45Wga2G/O8iUy+lghwjS2MTL5azO4Oa/o3qY0hP74BB90Zp012FNXT6Ca4eoJiDQDqZfRX7FuvUV9PoKsF2dUb1tOMil6w2qWwWjjjZ48mpV5LkUpQEwHwnuE1kuCkPcNmL+qWvjk0B/72/0cqLWtA60FADPe444N6OAXVC7A2K4AFNNEwzLxHB1bZj5LY/YMMnlb5K9TsKwVK2owHnHE4jnqh7d4821FgVupLh2wv0VM6Qaq7u+0K4XSlCKjISRbzXaSxqUrsItYS+vitpxzrhYuBEYj+xK1nm56WQK+VkyK86yzzjGSJXIPUgT7kTk1Aj6N3+KeyWewVclj+5AiAwtEOMKgCi69KHkLP27CJuKHAU3m4xWSaynn/+ihgJPrtPLmVJze9JH2CgsyyUebkkMdsE6D8kHjCoSge3ecIiy4lEscRafQePsRwlUuIcXG1qTVbcQFRLIyaHtYgbIYMc9SOrsah1B1/yR92aGPqb32cyUehe+1IPqDMIlAj3w39L8ajfkEb4q6V7b6N7Evds+KYFT3Qe3+Ui2dHvWvJIuhgyFmiVMJhdcO04b2cGVP+sU2TpXBQBkPw5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(366004)(376002)(396003)(136003)(41300700001)(6486002)(478600001)(186003)(2616005)(66476007)(6512007)(26005)(53546011)(66946007)(6506007)(38100700002)(83380400001)(31686004)(7416002)(2906002)(8936002)(5660300002)(316002)(36756003)(54906003)(31696002)(6916009)(8676002)(66556008)(4326008)(86362001)(4290200001)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0V3MWhwZHUzRGczZ2pjazdRS0lzVUk4aEdoeHhXNUtGOWZGMG9VV0R4aUlZ?=
 =?utf-8?B?NmtxNHdIa2VSbVVodGk4OWlKbFBsVmhIMzVEQ1FpSFloMUVKYTRlYzhKSWt4?=
 =?utf-8?B?NEcrY0g4Uzl2eFR1UXRxcVdqclNXYXZoMzBuNHBrSVU2WUIzWTZsclBDdE9l?=
 =?utf-8?B?ak1nRUJWU0ZkV2gvcEtQRzdkZnlhLytodGQrUVZaZkp6YVR5U3FaQnREYnJ6?=
 =?utf-8?B?YmYwd24xWFVTdWwwYkhCeUNlcnVIenZqQnU3VXdxb3AzSjk0K1ZhWGU3bFFE?=
 =?utf-8?B?VjhQRTJPd21WaFp6OE9ZbkZVMlQySDhGbFByODY4emI0S1RVcllHcy9MUnVz?=
 =?utf-8?B?OFBqQWpwTEdLdVVjRHRaOEpGem5qWGxydmVBNTV6Nnd4bW14UzZOUStnTTZm?=
 =?utf-8?B?NmpKSUdKK2lxTkx3alJMRzZNUE80WUM1aXExWkViYXVFUkE1OVVDOHVzeEZz?=
 =?utf-8?B?RENMbHplU0JUYUVlM1E3SG1YVWdXMGJhUHE4TDRlTVNvT3Zia0FGVVdscjJM?=
 =?utf-8?B?TUw3LzBUU0s1Tkt1aVBqdXZIOU1Bc1dVRjdDQU95Qjd4M3lHR21vU1lYSE1j?=
 =?utf-8?B?ellzYUJIYUhrNzRkT29rdkJKMGJRQ3dBUGpHdEVVcUR3Wm15dTArWUNaYkkr?=
 =?utf-8?B?aUZ2UHlRaW5qMWQzVFo4aHZScTV2VzZmYTMxMmZVZmdvbmZOTi9YNHd3bHdX?=
 =?utf-8?B?U1FML0VRYk92ODBjWWxxWFFnWnp1eURFQjUxbDJ6RFhHeFZGL1h0a3RydXp4?=
 =?utf-8?B?d3ByQUF5Y2Fqd3pvZnlkM25pVHorSEloZnhGcVNkRlNsVnFvdVNRMUswNnhI?=
 =?utf-8?B?N29YVE96anV2MHZhcjRpc2VhWVhWWk14YWUreUhYdzZtVklCSzhuL3hkWDVN?=
 =?utf-8?B?VmM5Rjl6a2ErRmEzVktnRERWR1VQbXpyU0xqd1dtaTdrODZRanhRVWExN3VI?=
 =?utf-8?B?SC9YNDkxa1BxU2s5YUttTm1XYkE3aUVIRUViY2dnYkN0TTBINmNqNExUWkFM?=
 =?utf-8?B?T3V5NjdzWHQrOEpUNDdLUFc2WXQvUnBRaEpQanA4Smxpbk9IcVBzbm9Sekdz?=
 =?utf-8?B?N3IyNDdtOFdaU2c5cllVd0RDQ3NSRzREWGQ1MCtjWkZVWnd5UlNFQ0ZmRGkw?=
 =?utf-8?B?dTNuaEdab2VVMXkwQjF3eXF4bEhqaGMwMzFJZDE1NWtnakZ0azVxOCtTQ2dD?=
 =?utf-8?B?NDZsM3g2S3R2WnJ0N3p2eU82cTFRckswMFFoRmJyRkF5TXlIYUZDY3RIdTBH?=
 =?utf-8?B?cWZmUmQ0K0lEb0s3b20rUHdqblVSVTlCazVBTDFHdTh3K1gwa1dnQi9kQXV5?=
 =?utf-8?B?MHdjQ0lpUG9uTzZXUTNuTHFiNXBPN3ArdkUrQkJaQkhmelNQSjRTenNQTU9B?=
 =?utf-8?B?YUZuUjg1OGxIY3FNODhTamxrYTBKdXNsemIvVlZORk8vZ2pKUG9BU3RsN1ZD?=
 =?utf-8?B?MFpuRXNPS2c2eFNoOGxzZTdEdnBuTjlCZS8yb2VYcDU4andSa1BPbDQ2SEg5?=
 =?utf-8?B?MXNSZTAwZnl4NDVsbG5mTFYwQVg1NlZpWEdhOWpZTkd1NXBicUpXbmVzdDlD?=
 =?utf-8?B?bGQ1bU5ZRWsyN1dxdlNTRUwvODVKYk1yQkhEUUh5R05EdSs0YURlMmNKK0N5?=
 =?utf-8?B?VVY3Zy9iNUlkNEdvMDhzMjJRTUhpOGkyL0FqblNkSG1vNTFkeEEyOU5mdzkv?=
 =?utf-8?B?aFVoSm14bTBmMm9zbkF2YyswZlcwYXFUOHRvN0MwSndpUGNXcnJKNEVWNVda?=
 =?utf-8?B?QlBDUXlZaGxVVE9QdlpQYVIybWxUTHRSR3MrcmpsMHVJREZEaGk3RWdZcHE1?=
 =?utf-8?B?ZmZLeS9TRmhlOHUvQWJiU3JvNTM1MXBhbE9idDN1ZU5saU1nS3JsUlZDRSt1?=
 =?utf-8?B?QlJjTjRacDJEZXAxY2FOYktaZVREYUQ0YVl6YXBUWEY5OEg4Zzc5M1NNelp2?=
 =?utf-8?B?TCtEMm1oRW5XZXZjQ3Z0Wi9lOGdXSWxkOFVkSFZnNjlxNzNiUWtVZElZQVo0?=
 =?utf-8?B?amV1dFNIY2RuZ2luNEtya2JpWTczZHdGVGE0UGNsZ0FUWHNjSklrV2tDT0U2?=
 =?utf-8?B?c01JQkxIZXdFZFU1WnNNanRicThxekFKa0kyL1h5bFRaWFhWdElIWHZlR0FY?=
 =?utf-8?Q?P1Ln4CS4givdL0PdkuMdgyZco?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b15c35-f5ac-4c17-1f39-08da689d864a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 09:11:40.0223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3j25HM9bDoc0CwL/0lCkYYI+qxZiNuYRXQQzGg6c/PxDK73HT7ro1Zw7kkxZkNNRM9pCUQllerlAWIrC/t8OSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8950

On 15.07.2022 15:26, Andrew Cooper wrote:
> While Xen's current VMA means it works, the mawk fix (i.e. using $((0xN)) in
> the shell) isn't portable in 32bit shells.  See the code comment for the fix.
> 
> The fix found a second latent bug.  Recombining $vma_hi/lo should have used
> printf "%s%08x" and only worked previously because $vma_lo had bits set in
> it's top nibble.  Combining with the main fix, %08x becomes %07x.
> 
> Fixes: $XXX patch 1
> Reported-by: Jan Beulich <JBeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with, I guess, ...

> --- a/xen/tools/check-endbr.sh
> +++ b/xen/tools/check-endbr.sh
> @@ -61,19 +61,36 @@ ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
>  #    the lower bits, rounding integers to the nearest 4k.
>  #
>  #    Instead, use the fact that Xen's .text is within a 1G aligned region, and
> -#    split the VMA in half so AWK's numeric addition is only working on 32 bit
> -#    numbers, which don't lose precision.
> +#    split the VMA so AWK's numeric addition is only working on <32 bit
> +#    numbers, which don't lose precision.  (See point 5)
>  #
>  # 4) MAWK doesn't support plain hex constants (an optional part of the POSIX
>  #    spec), and GAWK and MAWK can't agree on how to work with hex constants in
>  #    a string.  Use the shell to convert $vma_lo to decimal before passing to
>  #    AWK.
>  #
> +# 5) Point 4 isn't fully portable.  POSIX only requires that $((0xN)) be
> +#    evaluated as long, which in 32bit shells turns negative if bit 31 of the
> +#    VMA is set.  AWK then interprets this negative number as a double before
> +#    adding the offsets from the binary grep.
> +#
> +#    Instead of doing an 8/8 split with vma_hi/lo, do a 9/7 split.
> +#
> +#    The consequence of this is that for all offsets, $vma_lo + offset needs
> +#    to be less that 256M (i.e. 7 nibbles) so as to be successfully recombined
> +#    with the 9 nibbles of $vma_hi.  This is fine; .text is at the start of a
> +#    1G aligned region, and Xen is far far smaller than 256M, but leave safety
> +#    check nevertheless.
> +#
>  eval $(${OBJDUMP} -j .text $1 -h |
> -    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
> +    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 9), substr($4, 10, 16)}')
>  
>  ${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
>  
> +bin_sz=$(stat -c '%s' $TEXT_BIN)
> +[ "$bin_sz" -ge $(((1 << 28) - $vma_lo)) ] &&
> +    { echo "$MSG_PFX Error: .text offsets can exceed 256M" >&2; exit 1; }

... s/can/cannot/ ?

Jan

