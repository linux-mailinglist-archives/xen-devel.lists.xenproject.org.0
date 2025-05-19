Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED32ABC7B1
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 21:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990163.1374095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH62q-0006uX-3H; Mon, 19 May 2025 19:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990163.1374095; Mon, 19 May 2025 19:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH62p-0006rm-W1; Mon, 19 May 2025 19:21:03 +0000
Received: by outflank-mailman (input) for mailman id 990163;
 Mon, 19 May 2025 19:21:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=58Im=YD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uH62n-0006rg-7y
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 19:21:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64e61f17-34e6-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 21:20:59 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 387B34EE7C60;
 Mon, 19 May 2025 21:20:58 +0200 (CEST)
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
X-Inumbo-ID: 64e61f17-34e6-11f0-a2fa-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1747682458;
	b=heaalXsJ9UfQQr5H/jbcKatMFe6jTX/cHGBLteC4EvW51Eim3b/E0UhExc7BnV94idiQ
	 xYxRiOtEX3c6Pf02P/dQ24W3I/KmxZlGRorIOR5Su0XMVDZJSVEQuvwQyvLNdW2arc9qv
	 WDcwxFP7d+RKK4GhlHRNxR0EQ+4/PgwPJWObAb3hB58IvkX7RtfXp89yPvkXWeYrtL5Qb
	 6mJqRwBkA54YsSb2iwFjQREJJHKE8wnNCyLT4BsXEZsQkjLGNucOF/IAwmqU4hWNPvAn8
	 IhXLk909BJiGFkS9mhDfPty+psDXFaBa1jxDRH0aqd67tPyTllSshfQj5DFg8SlTiPAu5
	 K82+Gh0kNpfvd6I9Pm9yVFRPu93QXGMsabam8BUgjTOkgAjTMK3/PRa3J40b6inZdsGyS
	 dNvJjRNhr6sLrj8+rTZThutTYmrYYHiipCyOastFAf5EYNvaW8dEmM2Ydiecxh11OWWNh
	 2U3A4g4PZggiUorJyGSzwAjWS+b7jT/vfjk6WLsM8/LecEOn0PiqH6K2l2hLILOXTH3Cq
	 utdboPds4kmKLtnsKT2ghl5RGAsxMQN7cePlI5YCPSMi13mDc7C3UncTnwtwtsLxQbeKi
	 KwsRXHY2B205N5f2qZmAyAhEO42O6CYPsw+5TeEAJlduUDe+R13OYvN2rE/1yhE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1747682458;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=zxRF2dssG7vSmsDLWc8ihjORk55Chb9jxYYjVkZFTYc=;
	b=d40S1y421z+dxdoW7irVCO7pPP2JXCzT8ZwSNJjq9FVjejh5C/pN5+wLaWqxozaahCnf
	 z2AdOUhonZ+BA4c92tWz9OE7ijsnssV4+n3gy2ofpgvPHhSh0VEo6bWc+/sz19bUdF3pc
	 FGQqi0JQqLQ9eBd2Q9fKp9ENQvpqj32qRcJ6MSPe1o0Abqk0BsFG2VdvBJmXy2il0LNtx
	 T7qgAZn5QEh1wqjwRU8nEpu5tpyyZq8z3JdlySXOGx6M13daJ+G1sFbHF7yoYpO74V0UE
	 xiLT9XQu9xbJNvny5r0hFB2Yi0A8zH2/BFeKKYWLT77LXawOEW8J1Raw41xxoTlfa9+FZ
	 uDnqBSJQfBpNnJsxWf+NTCYsFCAFVOYC8MRR/RwUFiY5buHrWnr1fjiU3DunKENooQJsk
	 ASd3tc+OWLmYDknEX+FiwbEcK9ysFlHrLuvdFGG5F4ndPDp+VYyvTZqOVgZpgPV74yh2r
	 YbxrPIMF7hCV4ZxRoEAlrGHlc4ojcINF1bs1Jbid/DMtGvgM1PAryyrBluiFa2DGoxwNr
	 TaEFJ0qKTss2GDBTch05+J7lNBEOAg9YlZr2WBf5Alp4/tFbYJ1vGCs7crMY5d0y4mUzG
	 6+o3+aiL3AaQVXNHo8bmCpXWDLHClD1S7LGi1t7CNK4ZZOgUkF1CGNnDH//E3js=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1747682458; bh=CTFzUztmBHn/M1AXC5FXNL6nWy78MIe54bI+jmcxygo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jtwieQFtS3Tpyttp5jgYDRxYydd8gWmL1Qdw8ow1EHmf20kzMeCOCx6CyLCB0cC3A
	 nuYMdV4Mg7Ko8JvnWmDxynWwrC2payr9oIZv7P2M94JYzw/CEQ6hIEPokwj+Fkxugm
	 CItgBfcNv6/jx6tTL4izmUx43adnapXXki+Y4qnD4GT5OoPXlcdr+CucvXPlXbjmDN
	 Wi9+Bt3xMcWkd1Rfx8pg7GjpBhE2bGpKc24Lk3W2iID7I1gaejHsNGi4xwFpaXT4NG
	 HESTUpoZjeeQIt7uYbGr8JoeeLFfUT4xLCT1i262d7tf8+QCF9vXsTLp2msG4VvSM9
	 PiQah4vwQymzg==
MIME-Version: 1.0
Date: Mon, 19 May 2025 21:20:58 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: Give compile.h header guards
In-Reply-To: <a967e60c-0474-46ac-87c0-d1d6ce5ce289@suse.com>
References: <20250519135227.27386-1-andrew.cooper3@citrix.com>
 <a967e60c-0474-46ac-87c0-d1d6ce5ce289@suse.com>
Message-ID: <945af229127e3d6dc578f0ae23059686@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-05-19 21:10, Jan Beulich wrote:
> On 19.05.2025 15:52, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Is this to please Misra in some way?
> 

Directive 4.10: "Precautions shall be taken in order to prevent the 
contents of a header file being included more than once". One approach 
is to special-case this file, but Andrew suggested this approach which 
addresses the issue directly.

>> --- a/xen/include/xen/compile.h.in
>> +++ b/xen/include/xen/compile.h.in
>> @@ -1,3 +1,6 @@
>> +#ifndef XEN_COMPILE_H
>> +#define XEN_COMPILE_H
>> +
>>  #define XEN_COMPILE_DATE	"@@date@@"
>>  #define XEN_COMPILE_TIME	"@@time@@"
>>  #define XEN_COMPILE_BY		"@@whoami@@"
>> --- a/xen/tools/process-banner.sed
>> +++ b/xen/tools/process-banner.sed
>> @@ -12,3 +12,8 @@ s_(.*)_"\1\\n"_
>> 
>>  # Trailing \ on all but the final line.
>>  $!s_$_ \\_
>> +
>> +# Append closing header guard
>> +$a\
>> +\
>> +#endif /* XEN_COMPILE_H */
> 
> This split of #ifndef and #endif is ugly. Can't we switch to something
> more conventional, like
> 
> #define XEN_BANNER		"@@banner@@"
> 
> with the first sed invocation then replacing this by the result of
> a nested sed invocation using process-banner.sed (which of course would
> need adjusting some)? (Maybe the double quotes would need omitting 
> here,
> for process-banner.sed to uniformly apply them.)
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

