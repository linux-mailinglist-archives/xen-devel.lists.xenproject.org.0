Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 848645461C2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346113.571900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzaq9-0001Ta-JB; Fri, 10 Jun 2022 09:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346113.571900; Fri, 10 Jun 2022 09:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzaq9-0001R3-EJ; Fri, 10 Jun 2022 09:22:01 +0000
Received: by outflank-mailman (input) for mailman id 346113;
 Fri, 10 Jun 2022 09:22:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nzaq8-0001QI-0K
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:22:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzaq7-00052V-Gs; Fri, 10 Jun 2022 09:21:59 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.23.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzaq7-0001By-Aq; Fri, 10 Jun 2022 09:21:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=1n1OGo/fhKvqbYvMMZubM5NgMCq1Vy19RgCUFKHE4IE=; b=mZn1NQO4rHVOv0qImiCOwyhW9J
	mftMA7SrWQu8wCATy1Xla0GBbQicqcYswUpgqqxkJELW8chP8ghi65mnqefB5PatQyr5KJ87cYGHV
	CzbojqXk4BYzFfGZ9BV0K0lsKMzWavT2WVSX9NqY/2wPy74o78RsnwGkRHPHfpyBo+qE=;
Message-ID: <e1369888-4135-c2f6-727a-a018d78a4d3a@xen.org>
Date: Fri, 10 Jun 2022 10:21:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] add more MISRA C rules to docs/misra/rules.rst
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, George.Dunlap@citrix.com, roger.pau@citrix.com,
 Artem_Mygaiev@epam.com, Andrew.Cooper3@citrix.com, Bertrand.Marquis@arm.com
References: <alpine.DEB.2.22.394.2206091748210.756493@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2206091748210.756493@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 10/06/2022 01:48, Stefano Stabellini wrote:
> Add the new MISRA C rules agreed by the MISRA C working group to
> docs/misra/rules.rst.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> ---
> 
> I added the rules that we agreed upon this morning together with all the
> notes we discussed, in particular:
> 
> - macros as macro parameters at invocation time for Rule 5.3
> - the clarification of Rule 9.1
> - gnu_inline exception for Rule 8.10
> 
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 6ccff07765..5c28836bc8 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -89,6 +89,28 @@ existing codebase are work-in-progress.
>          (xen/include/public/) are allowed to retain longer identifiers
>          for backward compatibility.
>   
> +   * - `Rule 5.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_02.c>`_
> +     - Required
> +     - Identifiers declared in the same scope and name space shall be
> +       distinct
> +     - The Xen characters limit for identifiers is 40. Public headers
> +       (xen/include/public/) are allowed to retain longer identifiers
> +       for backward compatibility.
> +
> +   * - `Rule 5.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_03.c>`_
> +     - Required
> +     - An identifier declared in an inner scope shall not hide an
> +       identifier declared in an outer scope
> +     - Using macros as macro parameters at invocation time is allowed,
> +       e.g. MAX(var0, MIN(var1, var2))
> +
> +   * - `Rule 5.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_04.c>`_
> +     - Required
> +     - Macro identifiers shall be distinct
> +     - The Xen characters limit for macro identifiers is 40. Public
> +       headers (xen/include/public/) are allowed to retain longer
> +       identifiers for backward compatibility.
> +
>      * - `Rule 6.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_02.c>`_
>        - Required
>        - Single-bit named bit fields shall not be of a signed type
> @@ -123,8 +145,75 @@ existing codebase are work-in-progress.
>          declarations of objects and functions that have internal linkage
>        -
>   
> +   * - `Rule 8.10 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_10.c>`_
> +     - Required
> +     - An inline function shall be declared with the static storage class
> +     - gnu_inline (without static) is allowed.
> +
>      * - `Rule 8.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_12.c>`_
>        - Required
>        - Within an enumerator list the value of an implicitly-specified
>          enumeration constant shall be unique
>        -
> +
> +   * - `Rule 9.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_09_01.c>`_
> +     - Mandatory
> +     - The value of an object with automatic storage duration shall not
> +       be read before it has been set
> +     - Rule clarification: do not use variables before they are
> +       initialized. An explicit initializer is not necessarily required.
> +       Try reducing the scope of the variable. If an explicit
> +       initializer is added, consider initializing the variable to a
> +       poison value.
> +
> +   * - `Rule 9.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_09_02.c>`_
> +     - Required
> +     - The initializer for an aggregate or union shall be enclosed in
> +       braces
> +     -
> +
> +   * - `Rule 13.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_06.c>`_
> +     - Mandatory
> +     - The operand of the sizeof operator shall not contain any
> +       expression which has potential side effects
> +     -
> +
> +   * - `Rule 14.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_01.c>`_
> +     - Required
> +     - A loop counter shall not have essentially floating type
> +     -
> +
> +   * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
> +     - Required
> +     - A switch-expression shall not have essentially Boolean type
> +     -
> +
> +   * - `Rule 17.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_03.c>`_
> +     - Mandatory
> +     - A function shall not be declared implicitly
> +     -
> +
> +   * - `Rule 17.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_04.c>`_
> +     - Mandatory
> +     - All exit paths from a function with non-void return type shall
> +       have an explicit return statement with an expression
> +     -
> +
> +   * - `Rule 20.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_07.c>`_
> +     - Required
> +     - Expressions resulting from the expansion of macro parameters
> +       shall be enclosed in parentheses
> +     -
> +
> +   * - `Rule 20.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_13.c>`_
> +     - Required
> +     - A line whose first token is # shall be a valid preprocessing
> +       directive
> +     -
> +
> +   * - `Rule 20.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_14.c>`_
> +     - Required
> +     - All #else #elif and #endif preprocessor directives shall reside
> +       in the same file as the #if #ifdef or #ifndef directive to which
> +       they are related
> +     -

-- 
Julien Grall

