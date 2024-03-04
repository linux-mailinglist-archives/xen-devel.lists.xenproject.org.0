Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588B86FF20
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 11:33:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688268.1072303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh5cd-0003b1-VT; Mon, 04 Mar 2024 10:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688268.1072303; Mon, 04 Mar 2024 10:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh5cd-0003Yi-Sn; Mon, 04 Mar 2024 10:32:39 +0000
Received: by outflank-mailman (input) for mailman id 688268;
 Mon, 04 Mar 2024 10:32:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TG1g=KK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rh5cd-0003Yc-6G
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 10:32:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85aec628-da12-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 11:32:38 +0100 (CET)
Received: from [172.20.10.8] (unknown [37.161.114.33])
 by support.bugseng.com (Postfix) with ESMTPSA id 5D1114EE0737;
 Mon,  4 Mar 2024 11:32:37 +0100 (CET)
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
X-Inumbo-ID: 85aec628-da12-11ee-afda-a90da7624cb6
Message-ID: <97fcacd7-c359-4e10-837c-29a31c86d331@bugseng.com>
Date: Mon, 4 Mar 2024 11:32:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviation for MISRA C:2012
 Rule 16.6
Content-Language: en-US, it
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <c50660973e090b854447b439424a0c2e18559513.1709547523.git.federico.serafini@bugseng.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <c50660973e090b854447b439424a0c2e18559513.1709547523.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/24 11:28, Federico Serafini wrote:
> Update ECLAIR configuration to take into account the deviations
> agreed during MISRA meetings.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes in v2:
> - rephrased to make sure the deviation is not interpreted as a suggestion.
> ---
>   automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>   docs/misra/deviations.rst                        | 6 ++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 02eae39786..9ac3ee4dfd 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -378,6 +378,10 @@ explicit comment indicating the fallthrough intention is present."
>   -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
>   -doc_end
>   
> +-doc_begin="A switch statement with a single switch clause and no default label may be used in place of an equivalent if statement if it is considered to improve readability."
> +-config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
> +-doc_end
> +
>   #
>   # Series 18.
>   #
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 123c78e20a..ce855ddae6 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -322,6 +322,12 @@ Deviations related to MISRA C:2012 Rules:
>            - /\* Fallthrough \*/
>            - /\* Fallthrough. \*/
>   
> +   * - R16.6
> +     - A switch statement with a single switch clause and no default label may
> +       be used in place of an equivalent if statement if it is considered to
> +       improve readability.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>      * - R20.7
>        - Code violating Rule 20.7 is safe when macro parameters are used:
>          (1) as function arguments;

I forgot the "--reroll-count",
I'm sorry.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

