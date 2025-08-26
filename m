Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D427B35634
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 09:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094023.1449372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoXf-000587-BF; Tue, 26 Aug 2025 07:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094023.1449372; Tue, 26 Aug 2025 07:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoXf-00056M-8a; Tue, 26 Aug 2025 07:56:31 +0000
Received: by outflank-mailman (input) for mailman id 1094023;
 Tue, 26 Aug 2025 07:56:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dnfn=3G=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uqoXd-00056D-Go
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 07:56:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b31f635-8252-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 09:56:27 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id D1B5D4EEBC47;
 Tue, 26 Aug 2025 09:56:25 +0200 (CEST)
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
X-Inumbo-ID: 2b31f635-8252-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1756194985;
	b=EElN+fFoy2R6YGEkxfGMlWldCMc7dMR5nG0jLAO4v39x9QuwE4TjCObbDwk0U3Pz6dUB
	 hRgx3tlscoTYyh1wUIr9tH0Swbp7K2SWw6esqB5fGIZd6abqini+U53P6J5Mb+X5JrfiE
	 B6qrPhU68aX8OpRTsj2J1yzfiivte0JoUQl1tntl1iLiYWIUv715oYfd2g5zYlec4cOy6
	 s4N3jzCkR160N983eu4C9LnCiBkjWLONmPqIvdpqzddH9NYk0YEiAQzMuRXH8me6E0yh0
	 TbmiEzeGzDu2l2KNgW5hxQASS/3u6uRNTec4Xe2mdOS7GIB3mTwvrNpVo/UCuDqYnuH3o
	 E72GxtQso8IEdKG5929KZBoKDCdnvTP9AIo9s3/QrxsxfLV702ngPboQI0Ii99HO57UWl
	 ODS4V9pIuqm6MuTFVNSngQNQ6v/3/dvNM1lA2fX8+adBSW+zrz+dit+9hQ/GCH6ajsrAC
	 joK+RnjENDNzH4oUjdZWoiShdrahdhac3r2qwjPja3INszLoc97qpO+Dza+rTmS2+sX5i
	 NgJF1g+HFnXx6iS8tMvEOQX3tIB2Sn8vJSjghopRzUx805An37ltR3DrvrbpGXrtKCxVv
	 fEvyPgs72m/qXp5TkZwL2xmd7K75rv+uOntFfciYObBByh5+g0Ixhd8Wxg/0sps=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1756194985;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=2a34Nk9dEAydgyzZvGZr7cQoriBy4lEgOXv122koJ+o=;
	b=jdNVHBmJsSsJWvXy7fwEPHHuh/qufVnwbNRyYsdjT4VgVBTrD8YtGypwaEpNKrAaJrD2
	 TZRcP0+Zist2lAEl1vVKob+ZRR9fjfUyr5mgYWTeb9seNDIlEyWg4jhsz/zwqk8FpWV9F
	 59ERV/hoeAewoGS0/FgTMUd/TDhj/n84ows6Y67GpWgoSN3nZtCutWPxufKnpDz0eUPUP
	 VDVS194esfWJIja1ovr23Tf/l/njNx5baWCCG9scqrj0T/7FUJo0dV80vlwfdKsmkK1kH
	 x/CDwieHNW0CoyC0yD/LYC51BLiuNbCAVN4C13Rvb7fbtQJ9gvuFoKaSTkCzBTI9pXpHn
	 7oqRRe1QcaFdwsDOB7CFbg4/mn+7XaQ8O01WBxAje0TBMDhGkTM692ZSgst9IT8+gbiVn
	 n8IN3oFI+ZWG8VMaEiYhSDIXchIYJ/d6qRwM3UYjjYkGqx5RUD/ySzzHi3tV0n+L6hc25
	 gcBv6RU8Z0Wz62b78FmZ83XSM4IuCQPtP02faCPXF1ucM8825aEO2cVfslK/2cY+LCMww
	 9EOGVaafD6u2ZMhEHlrGFldOshQWCun1/PnMOV28c6eczgM86w/rTPhM9FagpgZzsWDvz
	 D43+d58TEbalUDo66XAeupHmMBVUbSpM19Ub+bt9fO7HrBwNSE5BWCH2w9u3suk=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1756194985; bh=9kiD3Gg1MpTc3e705GzsFWjkOCq6RUiuNIpz2u0NpyM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=E2w6y19qt7qq9j09BHYvF/J0qkF4M0Yo7f54iFEWssElq/e9TzMi+jOQu5LNBfe0G
	 ZWMI+1FCLQb0sX5XGGgqmV3ORJVVpWJmDVcQAK9h+tdgv/ddCbznbJ9n9bGSqNXhGX
	 1Amrns4CBIHn/oCoSi3pM3pd2HanjPxEH/fnvv9vnfI2J65EHcO1LwdO+qd7y0YKPF
	 w0MqcpWiv+XZ3Y8LXbK1tr0uhLFMVVBcgXLoPuRwKTH9HgpD2F3hA9vmarrXUbtqZI
	 1OMLGP5jrOkkWrO6GM3pAVvQcmchEFMFLEUleKi2WUOI0Hnkrrpo2ydRcZJyxl7ZCR
	 k/TQikzMoit3A==
MIME-Version: 1.0
Date: Tue, 26 Aug 2025 09:56:25 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] misra: add deviation of Rule 17.7
In-Reply-To: <204a1526-7e3f-4b91-b1ee-95f3d89ff756@suse.com>
References: <812b78119cee801662a31d39b556cb453aa69508.1756192362.git.dmytro_prokopchuk1@epam.com>
 <204a1526-7e3f-4b91-b1ee-95f3d89ff756@suse.com>
Message-ID: <112a4ab83bf2abce09d4ff1b67671847@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-08-26 09:45, Jan Beulich wrote:
> On 26.08.2025 09:36, Dmytro Prokopchuk1 wrote:
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -575,6 +575,11 @@ safe."
>>  -config=MC3A2.R17.7,calls+={safe, "any()", 
>> "decl(name(__builtin_memcpy||__builtin_memmove||__builtin_memset||cpumask_check))"}
>>  -doc_end
>> 
>> +-doc_begin="It is safe to deviate functions like 'memcpy()', 
>> 'memset()', 'memmove()', as they return a value purely for 
>> convenience,
>> +their primary functionality (memory manipulation) remains unaffected, 
>> and their return values are generally non-critical and seldom relied 
>> upon."
>> +-config=MC3A2.R17.7,calls+={safe, "any()", 
>> "decl(name(memcpy||memset||memmove))"}
>> +-doc_end
>> +
>>  #
>>  # Series 18.
>>  #
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -576,6 +576,13 @@ Deviations related to MISRA C:2012 Rules:
>>           - __builtin_memset()
>>           - cpumask_check()
>> 
>> +   * - R17.7
>> +     - It is safe to deviate functions like 'memcpy()', 'memset()', 
>> 'memmove()',
>> +       as they return a value purely for convenience, their primary 
>> functionality
>> +       (memory manipulation) remains unaffected, and their return 
>> values are
>> +       generally non-critical and seldom relied upon.
>> +     - Tagged as `safe` for ECLAIR.
> 
> I realize I may be overly nitpicky here, but in files named 
> deviations.* I find it
> odd to read "It is safe to deviate ...". I further find the use of 
> "like" odd when
> you enumerate the complete set anyway.
> 
> I wonder whether the deviation wants generalizing anyway: Informational 
> return
> values are generally okay to ignore. That is, the Eclair configuration 
> would be
> limited to the three functions for now, but the text / comment could 
> already be
> broader. Then, for example, open-coded uses of the corresponding 
> builtin functions
> would also be covered right away.
> 

While I understand the pragmatic reasoning, from a MISRA compliance 
standpoint it would be better not to make the written justification and 
the actual deviation diverge, and then wide both the ECLAIR 
configuration and its justification suitably once new cases want to be 
deviated. Other than that,

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

