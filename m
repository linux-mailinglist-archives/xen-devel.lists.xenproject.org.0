Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB032EC5D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 14:39:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93708.176839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAfd-0008Cz-Qg; Fri, 05 Mar 2021 13:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93708.176839; Fri, 05 Mar 2021 13:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAfd-0008CZ-Lo; Fri, 05 Mar 2021 13:39:09 +0000
Received: by outflank-mailman (input) for mailman id 93708;
 Fri, 05 Mar 2021 13:39:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w+o=ID=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lIAfc-0008CU-Bo
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:39:08 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e184123-8b4b-44ff-8e88-81fec1225734;
 Fri, 05 Mar 2021 13:39:07 +0000 (UTC)
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
X-Inumbo-ID: 3e184123-8b4b-44ff-8e88-81fec1225734
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614951547;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=255sxRsZFPhMkMJClT+45Zmcz2S1ESOv10SDQzCsULQ=;
  b=hJH4PWr+bk1Lc3yNA6OY/fB5L7ttmMC0tf/n+rAGpBu0M71oJ9PqqMJm
   1Tw/yfyifuQUYg83rATYwbBTWLYurWWoyj45BihLMc+c4x1LpIkDAj3b1
   GgSEhyCOJYjFdeQdLjmvW2hvuSm9tJ9M1IYETzNBVDR73xG8k/CaV4sK+
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Np9k7AOFFUMllDBAU68I5EVK982G1YgzrCHuF/hryP9krIJNcdL2j5XZeT0z/ZnooD+tExliS6
 B/g0E0pVFo74As/VEnocxMnj6WFDGxgFFgAlu7qo1lb7RXRKeYByQxkRxHD32LC5aTUyNFLF8m
 ycM3ZoWRAsAuebgNQ4hMOoGHXoDwUjuyYMFuUJxa5mMac8ygvllHVpeB40BrVJ7ekuQkZjo4f6
 /R6w+SU1yG2UE9K/aAHzdvES22HA+kiXwaOHwcb/KOJc991xauXSV9iL97ZwBxKSVeMNdrCNmp
 h2k=
X-SBRS: 5.2
X-MesageID: 38626148
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,224,1610427600"; 
   d="scan'208";a="38626148"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HArdjncKaiRjkJxFnWEJo/r1DlytVQzge66qivDq4907QJM/Uv8KiTDZlJ5R8RQbqggjVTfbUaWhckXnYmpcdCp5Z5jTz05v/h++UScwpukQnJ8Eruf5IHiTNuQsU2/Ps0HsYDSukGON7KCg/kjFoljz6xJ8dsVxqzP7vs7Dtzgee6xUNsY5//WLE9bxj8P2f01WeV1dmK2HWknOdHCM3GdwiNXiwZy+pr365FuS6Cu8UCN2MtyOUljM72+/m5NnOKgdwY/MnucUw+ndkWiMPUvIwsDRlLZSC1RW3RyKTvTeSghneh8JEq9kSvXvpIZJ4ulgCBbt4y2h3dXeFGydbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGUL/fVldIoxWNj+dCeZWEcNQG9ZzVAw7e1+qXhsVuI=;
 b=my31I57KpgKgdpA65akD868zSfQxLv+oujmhp9UUdVro0H3vnVxEqpokox4zs5YdSlBY63hrXDvQSEnpBDcFXGabXEFZGbM6IMxblyFpUtFU05BeuiKo07FakAPPNDFoCn/MHTQnSAfE+6+HdxnlBTgQtpiZbNgA7Xtq3mp73b2erdWBsFUXfTBJ13WuxGc89I1HSgidQ/A/sXBro8pujVf5Z4qivgXA3qc1xyJwQ0wPLhgTV2wYp5aH+5fsK0QTlGmg0+4akmZEdfPA8eFfJzYyXzHlCpXFGLLaQzbbK+LUXUx0ymNR/ffn07QJioSxGH9y8X4s7HLzTgdsDRkwkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGUL/fVldIoxWNj+dCeZWEcNQG9ZzVAw7e1+qXhsVuI=;
 b=KfnSV7cc2IF7AkzzPA6d2HMqWmgWruljjFM0FJgjRB/G+1RGhgjQjs/192HWDr+Qkd+tQrv2YGoD/bi2eAk/SsNor6abvqt8EH76pjh1MVsC6JHzsBvBcy4OLQoIN2fCqIWl1YbxET/jfPkcw5rB1OUPE3piMkuQQbNU4eNRiEc=
Subject: Re: [PATCH 3/3] tools/libs: Fix headers.chk logic
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
References: <20210305124949.6719-1-andrew.cooper3@citrix.com>
 <20210305124949.6719-4-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <291c999a-19aa-2863-8154-4acc1774b4b8@citrix.com>
Date: Fri, 5 Mar 2021 13:38:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210305124949.6719-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0034.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8d65704-5e96-42e6-0ce6-08d8dfdbfd93
X-MS-TrafficTypeDiagnostic: BY5PR03MB4998:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB49985B67BACECA3B3D145EB3BA969@BY5PR03MB4998.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TO6RtOqhc4+VXgCW/4IDItFQ3EZbtpON994AlCTj14D/tp7S5cQ/PAwSeVJCjGqb7zzW+p2Dblj2uZC5UERizqOIkZG/H/XHrQ0YIm39NQboz0cP2Hrmsjrd3GJonYhNjwKL971mczHN7+7d/+JTSXDNNoDo2irivF4WKgvowt9W6p01VCaOp2f4AMYKZHFuR50exD1zz3+VQzqwAyvf/1cgFW8uq5ooDg/nvtPJrsTyymlTSxeMFYBouEXbMjPaYWcS/7+ofjYhxrW3I8ZFfxdIyT69EdT8TTXweAi2h596xmhNVCthll/oLWgOhGSLHIJNBnyvkGQo5yyqoJULpttlJadP5Wb8c04sb17GDQgjKD3ZPTSiNqXE9yREGs7XrJ6O81Nv+iSy6ZNoAgkpJlZl5UUpVOiBkaklIIDqYncr3z4Ji5Kz+gKOKBu18X+7iCCQuYo9yiomWzPomkQ9e1W1tATb/MUgGwWcp5pJXqOqWmJoeZjpG4xLqD6V+c+ffiPiQbR+hIiAPV+Kvo+R85vJbmEyOz/erqtpx+GC5JjuWE+4WMGDsMQMtyQg8/XPz/OBZ+s0pyR6NmBcgvARwKOiduIzFxPk1sv2X4bbGhc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(16576012)(66556008)(26005)(31686004)(8676002)(6486002)(16526019)(54906003)(66946007)(2906002)(186003)(4326008)(956004)(36756003)(478600001)(5660300002)(53546011)(316002)(6916009)(66476007)(31696002)(6666004)(83380400001)(8936002)(86362001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ano3Wml1Q0NjeTBtT0docURPR2Z2VzArWEJWNFNsZGhTelpWRzEvQlF0aTYv?=
 =?utf-8?B?dVU3bDRnWnJaM0UxMWhOcUNjZjZBTEFTaHJYRHdlWnphRTZmaVlJeXBFUDEr?=
 =?utf-8?B?T2JYanZjNE84a0ttOFVGZklBb25sM1hHTTVZeU9CWUlaV1VqcEVoV2hjNXJC?=
 =?utf-8?B?eTdIUEE1dHlsTUlyRkI2bVQ2UlV1VEtHOFhTNEQ4eGg3eXZSSjY0WXM4c1NG?=
 =?utf-8?B?bkRIM3lhTmhHVHZwbndtNnhvZm14TkFXZFg0UUFMZXR0QmFJRFo1SUpWUHVK?=
 =?utf-8?B?SnoySUpMcVU2alhJKzNMTURoN0VOZUlScjZWVlFRU2ZkMXdtdlNIc2JrTUJ1?=
 =?utf-8?B?OThuckNSTHpGTWpTSGdvK1V3eWU1bHBVdzdkQTlJL1ZFbEIwaHNsTEVJejJo?=
 =?utf-8?B?aTNIMFRGdHVlY3p6RW0xRVkzV0gyVWhJV0JQQlFOb2lJcjI5UWtCbDVrSWtJ?=
 =?utf-8?B?UXJxMEVRQmx0ZnZ2UEN2OGRqYkVXWjcvbStlQ2NSWEFRSHBCT25jSGR1MHdu?=
 =?utf-8?B?T2svV0YzamFQeWp2di9sZFlTcU5SVGwxVHpxNS9Ubk90K0dLS0E4SjR4TWZa?=
 =?utf-8?B?Z0lkMTRVSDJUT3h6VFc3ajErd0VMMjkzcy9OV01tVzdZR3F1ckR5Y1o3WVUy?=
 =?utf-8?B?MzFZbHZIby9VdXNHbVE4b3duU1RqaXRrUHY0SUppUFN4Ynh5dTlQdEFwUnlU?=
 =?utf-8?B?b29xVE81bzdvaU9UWVdKQzMyNmVleC9VK0RvRm5EZFV0MXB5Ym5jN1gxWmdq?=
 =?utf-8?B?K21pZS80RE40TnRoTk9NS2FjOUFvelQrNDFkS2k5eFJtMnlBVE5vdDJxdTl6?=
 =?utf-8?B?VjBkY3p1bXRqVHBXZHNvSXJZQkZKRmV1TWFLR2xWTzNlaTVCYmR5YjlFL1ph?=
 =?utf-8?B?ZkVsTkJkWkZYZWgvSXRDUG1NVHU5THZkMTN4ZURNUzJGNWcwWVhMSWFIbkxk?=
 =?utf-8?B?dEFHdlliY1E5elJGYkExamNwbFFMNG5oOFpBMUZDMkRTbnNPNEp6TTQ0R0NO?=
 =?utf-8?B?WmtuZi9oaDlsbzNxN2FJclJGdWwyaTNxRVdPakhTZHVsbkxESlVRdE90MjdB?=
 =?utf-8?B?eDdDZFU4dmJkSWhkTVc1L1FTWWhlbkxoTzQxQzd6M3JzN3VLeXhxN3Y0ZWVX?=
 =?utf-8?B?ZmJxVVVRa1F5U01QaTcrTWJyeTVEQStRNTdTOTB3T0FvRDFWR2dPeW1CemQ4?=
 =?utf-8?B?RVB2MTdWNUJrL1EydjlyYUk0azN6YVZSbHlXZlYxZWs2UU4wdFd0RWNCdjBo?=
 =?utf-8?B?aVNhMXo1MVdHLzkwTnc4eDBDc25WVU1POVdQd2F2ZkRDeDM3a3IzWUp4ZFYy?=
 =?utf-8?B?TTlFUm1raEZ4V2NpbXJ6OUJxZ0ViazBUdlYwbUF4ZExhYTViSDhqWFEyQWxF?=
 =?utf-8?B?Y0tWc2drZmRUUnB5Rm1RdkI0Q1lJbWZJUy96NGczbFhEZ3o1Mmx0YndKMFNm?=
 =?utf-8?B?UWRTQmVnMCtnbVg5UTNrUnRMclc0bzlzckJZeGo5b3pBZXJRUFdCZlhadHdB?=
 =?utf-8?B?NWxqQWxKaUJXNUx6eUkwcFBCdzRYUzVIM3p3VUxJeW1ZTWNTeWNDMEd4NFhX?=
 =?utf-8?B?eDBWcDJ6SU9USjVxd05kK1BSb01RczhzNVRHck5HNlROY01HTmQ0WEJOUHc5?=
 =?utf-8?B?bDZyNG5aZ285dDdsYmZVd2txTkpGaG5vZWxpWEF4aWJyQ1RNTGRhVGRRc2dZ?=
 =?utf-8?B?cC9BaVBoQVlhNWtzWU1MbHFubzJhUktxVTlaYVlXYkgzRE9aVEd3NzNOWGRG?=
 =?utf-8?Q?ok/C/HGbn1HynCJrLtYd0641Q1NBZSDfKUB5Avl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d65704-5e96-42e6-0ce6-08d8dfdbfd93
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 13:38:42.0578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjLZlCCWq8D8Uma5YT03t20XMcpMijC2IcVHClD+1uC2ZAItYwTHPRQSNnHuL8RssyTJ+3xAubgYYhC8S0qAxPt/Rf3BblvtJlxU/CH6c0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4998
X-OriginatorOrg: citrix.com

On 05/03/2021 12:49, Andrew Cooper wrote:
> c/s 4664034cd dropped the $(LIBHEADERSGLOB) dependency for the headers.chk
> rule, without replacing it.
>
> As headers.chk uses $^, a typical build looks like:
>
>   andrewcoop@andrewcoop:/local/xen.git$ make -C tools/libs/devicemodel/
>   make: Entering directory '/local/xen.git/tools/libs/devicemodel'
>   for i in ; do \
>       gcc -x c -ansi -Wall -Werror
>       -I/local/xen.git/tools/libs/devicemodel/../../../tools/include \
>             -S -o /dev/null $i || exit 1; \
>       echo $i; \
>   done >headers.chk.new
>   mv headers.chk.new headers.chk
>
> i.e. with an empty for loop, and checking only the $(AUTOINCS).
>
> Reinsert a $(LIBHEADERS) dependency.
>
> Fixes: 4664034cd ("tools/libs: move official headers to common directory")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Juergen Gross <jgross@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>

Apologies - I totally messed up the CC list here.

For 4.15.  Regression from 4.14, in some build-time checking logic.

~Andrew

> ---
>  tools/libs/libs.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
> index a68cec244c..2d973ccb95 100644
> --- a/tools/libs/libs.mk
> +++ b/tools/libs/libs.mk
> @@ -76,7 +76,7 @@ else
>  .PHONY: headers.chk
>  endif
>  
> -headers.chk: $(AUTOINCS)
> +headers.chk: $(LIBHEADERS) $(AUTOINCS)
>  
>  headers.lst: FORCE
>  	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp


