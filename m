Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C287881A4
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:11:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590659.923039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRuF-0002Tj-BM; Fri, 25 Aug 2023 08:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590659.923039; Fri, 25 Aug 2023 08:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRuF-0002RV-8j; Fri, 25 Aug 2023 08:10:59 +0000
Received: by outflank-mailman (input) for mailman id 590659;
 Fri, 25 Aug 2023 08:10:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFgK=EK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qZRuE-0002RN-30
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:10:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea567098-431e-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 10:10:55 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3FFF84EE0737;
 Fri, 25 Aug 2023 10:10:55 +0200 (CEST)
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
X-Inumbo-ID: ea567098-431e-11ee-9b0c-b553b5be7939
MIME-Version: 1.0
Date: Fri, 25 Aug 2023 10:10:55 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: luca.fancellu@arm.com, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com
Subject: Re: xen-analysis ECLAIR support
In-Reply-To: <alpine.DEB.2.22.394.2308241453470.6458@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2308241453470.6458@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <da8dce5678814f7e0805522a5111b09e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 25/08/2023 00:24, Stefano Stabellini wrote:
> Hi Luca,
> 
> We are looking into adding ECLAIR support for xen-analysis so that we
> can use the SAF-n-safe tags also with ECLAIR.
> 
> One question that came up is about multi-line statements. For instance,
> in a case like the following:
> 
> diff --git a/xen/common/inflate.c b/xen/common/inflate.c
> index 8fa4b96d12..8bdc9208da 100644
> --- a/xen/common/inflate.c
> +++ b/xen/common/inflate.c
> @@ -1201,6 +1201,7 @@ static int __init gunzip(void)
>      magic[1] = NEXTBYTE();
>      method   = NEXTBYTE();
> 
> +    /* SAF-1-safe */
>      if (magic[0] != 037 ||
>          ((magic[1] != 0213) && (magic[1] != 0236))) {
>          error("bad gzip magic numbers");
> 
> 
> Would SAF-1-safe cover both 037, and also 0213 and 0213?
> Or would it cover only 037?
> 
> We haven't use SAFE-n-safe extensively through the codebase yet but
> my understanding is that SAFE-n-safe would cover the entire statement 
> of
> the following line, even if it is multi-line. Is that also your
> understanding? Does it work like that with cppcheck?
> 
> 
> It looks like ECLAIR requires a written-down number of lines of code to
> deviate if it is more than 1 line. In this example it would be 2 lines:
> 
>      /* SAF-1-safe 2 */
>      if (magic[0] != 037 ||
>          ((magic[1] != 0213) && (magic[1] != 0236))) {
> 
> One option that I was thinking about is whether we can add the number 
> of
> lines automatically in xen-analysis based on the number of lines of the
> next statement. What do you think?
> 
> It seems fragile to actually keep the number of lines inside the SAF
> comment in the code. I am afraid it could get out of sync due to code
> style refactoring or other mechanical changes.
> 

Having the number of lines automatically inferred from the code 
following the comment
does not seem that robust either, given the minimal information in the 
SAF comments
(e.g., what if the whole if statement needs to be deviated, rather
than the controlling expression?).

An alternative proposal could be the following:
       /* SAF-n-safe begin */
       if (magic[0] != 037 ||
           ((magic[1] != 0213) && (magic[1] != 0236))) {
       /* SAF-n-safe end */

which is translated, for ECLAIR, into:

     /* -E> safe <Rule ID> 2 <free text> */
     if (magic[0] != 037 ||
           ((magic[1] != 0213) && (magic[1] != 0236))) {

this will deviate however many lines are between the begin and end 
markers.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

