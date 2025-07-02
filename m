Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25AAAF1174
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 12:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030882.1404560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuWo-00039v-3e; Wed, 02 Jul 2025 10:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030882.1404560; Wed, 02 Jul 2025 10:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuWo-000388-13; Wed, 02 Jul 2025 10:17:22 +0000
Received: by outflank-mailman (input) for mailman id 1030882;
 Wed, 02 Jul 2025 10:17:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W7z3=ZP=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uWuWm-000382-Uc
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 10:17:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb681c75-572d-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 12:17:18 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 065E24EE9BBA;
 Wed,  2 Jul 2025 12:17:17 +0200 (CEST)
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
X-Inumbo-ID: bb681c75-572d-11f0-a313-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1751451437;
	b=iqtXSYiT6gp8n12eu/7r874L7xg4O3JmYbKK6UCz0Bo+kt9lU2K2vbHrjKund5M0GdM6
	 S8/GBQ7AQm0y0PxWZ5Md5IHgONULL8J9tQmbk/Y6djCDeZDOwt3HzrvL3M4ZfQIj2YTCs
	 DDd4sLRXSbrgA5X7BJhN5SJPWIeeWV0VXRvDm+0qpTtQFm6Wi5onqhYfS8mObFF96R5Rx
	 bL+1Ey1yz2ogLiI+GlWK626oIkCs+1Qeq8z2h3dVtjKCmGiUP7YXx+t+C/1xs+e9X8ttv
	 4eaJY1+aiZlEJFh6YYb4DFSjCsPLJUYtegH5+SyF7ibKKwss09MRh0pEH/rojpvYbx5cs
	 UqlElwME+vOB1GFUJWK87iDwZPCoXgzWwxG6vE4AxVSK1imddK5GDWJpLDe+gleFyWfcl
	 jBsReC3O3FQN2veOPmoILUDEvodKMLmPccxVRJGM82cNg6bnUIFU8PuupK16nIjpJfTdr
	 EReQqfbYJWzkbCjF33Mj5/5Fb4xPUNLZD9oLZmsk2xbReFk8wtiPw0aaK/eozNX5tbadZ
	 4oEcM5BtnPtS8DDcuPOKQedzodL6V4h5Fg9lQ+svTX5ZIazDWruOwdqgzPkPWKjXy1TEe
	 KI/3HtQzAPdcQlhFaAfqQEsiYiHDxNR6mFsXqqifSIVbrAOXdAYbYMAAsX5DkGs=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1751451437;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=nwttDMvK/94FjAwGtt4ykSygR63H3NXsgEVfT0u/9DY=;
	b=4DrgGyoOvBUpoZB0482IWFVA9aVR7V7BF/cyMXSkFTq5yuS57yQn0u8XQdyC3hf+youD
	 WwKXDrn1ITZSvZ5gzPZNmqZt8W+1jwRMW7N/iyiLxOzf/a0TuHv3jUFfyuHxS7RKLQ9Ed
	 Jp9Xe/BDQtikNtQBnaebTCpVrBH1OQITLiDIpBdnGyGhKTsWmRT7EOTN9ibzEEetS9CJY
	 mCw8MVy126Ic6bGJZ6qRRZ9/8gidggIA+RIRyrek++pWqzV31wT6+TPXxfqXvn/9eUQCM
	 qp1O/cX0xPH+JeTSVRxdVLRBU9mqGmTnlF4e9HCGCNPu+ZMDy0jxjDk+lK+UvwnWkHnkR
	 5Rm5q0GcfB1rcm65p2CpbB/nBpst7YhraURBlvRS6zjGwDlQOjRy8c8+sVpvDm8IW1AD7
	 R1CRSBhVNJ1nwpaJ/aXFUXn/jJLSEYkTS3yln7F0ZYSDaAHTUs6E55/0jW4mq5EBYMrQn
	 YDaejShqDLSKIoYa38BN0DhH76k0xSVSS6BF5VlMtcEkdl700rmBayDNnCBg/4sU37qkC
	 RVIdZtaUvNaqZqoLjw7HmV3Cjs1Em4vvhvzXjAV5pp9KeBudBH7vDHeqqA3/cFqISSi4N
	 xVwNorKCN2x4mBtbTJT+VK+tlie5PZtReM4kfX7CqW867WpCOY6ckvJML+2o2IU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1751451437; bh=TQBul9TxEpi71gK6HMOATXQlOVhNjSADj6SuJq+6LuA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HtQ45ug0a130YJz/YrhMsRNUi2TZc5h01t/4tLNSmyVSJx4CsrTc3ijl0RsF2BQG2
	 e2zcVWONsBaurQ6asxXE21L2oaZTJAWCn4pDBidcsfZbwsCvScUUNhBPePG6cNMEmx
	 fftcbkl0EMlBCq5HLbOQIVKzgTuBVDzM4hBFGCvkIESXh2JBQ4nBna9zNzACprvmir
	 BuxHd9U8b8l4q1SdD+uwtR0Ako5FsknXE4EThwbnLLUbeOU8HnFrtpsvGpy88kZ5Vi
	 TyG4+kRK0ZW2LIrK3rLUIM5AzMgyZ3m7TM2PZRQF6T4LKcibSETYV7fhtOF4w2EIA2
	 SKB7OKtxj3w9Q==
MIME-Version: 1.0
Date: Wed, 02 Jul 2025 12:17:16 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, victorm.lira@amd.com, Federico Serafini
 <federico.serafini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
 <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
In-Reply-To: <396917b3-b60c-46b4-b599-dd07e7fe5171@epam.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <396917b3-b60c-46b4-b599-dd07e7fe5171@epam.com>
Message-ID: <999bc08958d451096336a102f162045e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-02 11:55, Dmytro Prokopchuk1 wrote:
> Hello, Nicola!
> 
> Would you mind if I take part of your patch (related to MISRA C Rule
> 21.1) and upstream it?
> 
> BR, Dmytro.
> 

Hi Dmytro,

I don't mind, though some concerns were raised about the current form of 
the patch (see in particular the last email in the thread). If you are 
able to address those concerns, then maybe this can be upstreamed.

Thanks,
  Nicola

> On 4/23/25 20:54, victorm.lira@amd.com wrote:
>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> 
>> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
>> reserved identifier or reserved macro name") and R21.2 ("A reserved
>> identifier or reserved macro name shall not be declared") violations
>> are not problematic for Xen, as it does not use the C or POSIX
>> libraries.
>> 
>> Xen uses -fno-builtin and -nostdinc to ensure this, but there are 
>> still
>> __builtin_* functions from the compiler that are available so
>> a deviation is formulated for all identifiers not starting with
>> "__builtin_".
>> 
>> The missing text of a deviation for Rule 21.2 is added to
>> docs/misra/deviations.rst.
>> 
>> To avoid regressions, tag both rules as clean and add them to the
>> monitored set.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
>> ---
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>> Cc: Anthony PERARD <anthony.perard@vates.tech>
>> Cc: Michal Orzel <michal.orzel@amd.com>
>> Cc: Jan Beulich <jbeulich@suse.com>
>> Cc: Julien Grall <julien@xen.org>
>> Cc: Roger Pau Monné <roger.pau@citrix.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Cc: Federico Serafini <federico.serafini@bugseng.com>
>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>   .../eclair_analysis/ECLAIR/deviations.ecl     |  9 ++++++-
>>   .../eclair_analysis/ECLAIR/monitored.ecl      |  2 ++
>>   automation/eclair_analysis/ECLAIR/tagging.ecl |  2 ++
>>   docs/misra/deviations.rst                     | 26 
>> ++++++++++++++++++-
>>   4 files changed, 37 insertions(+), 2 deletions(-)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index 2c8fb92713..ffa23b53b7 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -639,8 +639,15 @@ in the expansion."
>>   # Series 21.
>>   #
>> 
>> +-doc_begin="Xen does not use C and POSIX libraries:
>> +identifiers reserved by these libraries can be used safely, except 
>> for those
>> +beginning with '__builtin_'."
>> +-config=MC3A2.R21.1,macros={safe, "!^__builtin_.*$"}
>> +-config=MC3A2.R21.2,declarations={safe, "!^__builtin_.*$"}
>> +-doc_end
>> +
>>   -doc_begin="or, and and xor are reserved identifiers because they 
>> constitute alternate
>> -spellings for the corresponding operators (they are defined as macros 
>> by iso646.h).
>> +spellings for the corresponding logical operators (as defined in 
>> header 'iso646.h').
>>   However, Xen doesn't use standard library headers, so there is no 
>> risk of overlap."
>>   -config=MC3A2.R21.2,reports+={safe, 
>> "any_area(stmt(ref(kind(label)&&^(or|and|xor|not)$)))"}
>>   -doc_end
>> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl 
>> b/automation/eclair_analysis/ECLAIR/monitored.ecl
>> index 8351996ec8..da229a0d84 100644
>> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
>> @@ -79,6 +79,8 @@
>>   -enable=MC3A2.R20.12
>>   -enable=MC3A2.R20.13
>>   -enable=MC3A2.R20.14
>> +-enable=MC3A2.R21.1
>> +-enable=MC3A2.R21.2
>>   -enable=MC3A2.R21.3
>>   -enable=MC3A2.R21.4
>>   -enable=MC3A2.R21.5
>> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl 
>> b/automation/eclair_analysis/ECLAIR/tagging.ecl
>> index 1d078d8905..3292bf751e 100644
>> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
>> @@ -88,6 +88,8 @@ MC3A2.R20.11||
>>   MC3A2.R20.12||
>>   MC3A2.R20.13||
>>   MC3A2.R20.14||
>> +MC3A2.R21.1||
>> +MC3A2.R21.2||
>>   MC3A2.R21.3||
>>   MC3A2.R21.4||
>>   MC3A2.R21.5||
>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>> index fe0b1e10a2..88328eaa8a 100644
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
>>          construct is deviated only in Translation Units that present 
>> a violation
>>          of the Rule due to uses of this macro.
>>        - Tagged as `deliberate` for ECLAIR.
>> -
>> +
>> +   * - R21.1
>> +     - Rule 21.1 reports identifiers reserved for the C and POSIX 
>> standard
>> +       libraries. Xen does not use such libraries and all translation 
>> units
>> +       are compiled with option '-nostdinc', therefore there is no 
>> reason to
>> +       avoid to use `#define` or `#undef` on such identifiers except 
>> for those
>> +       beginning with `__builtin_` for which compilers may perform 
>> (wrong)
>> +       optimizations.
>> +     - Tagged as `safe` for ECLAIR.
>> +
>> +   * - R21.2
>> +     - Rule 21.2 reports identifiers reserved for the C and POSIX 
>> standard
>> +       libraries. Xen does not use such libraries and all translation 
>> units
>> +       are compiled with option '-nostdinc', therefore there is no 
>> reason to
>> +       avoid declaring such identifiers except for those beginning 
>> with
>> +       `__builtin_` for which compilers may perform (wrong) 
>> optimizations.
>> +     - Tagged as `safe` for ECLAIR.
>> +
>> +   * - R21.2
>> +     - `or`, `and` and `xor` are reserved identifiers because they 
>> constitute
>> +       alternate spellings for the corresponding logical operators
>> +       (as defined in Standard Library header `\<iso646.h\>`). Xen 
>> does not use
>> +       Standard library headers, so there is no risk of overlap.
>> +     - Tagged as `safe` for ECLAIR.
>> +
>>      * - R21.9
>>        - Xen does not use the `bsearch` and `qsort` functions provided 
>> by the C
>>          Standard Library, but provides in source form its own 
>> implementation,
>> --
>> 2.47.0
>> 
>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

