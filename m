Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96BF9EB1AD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 14:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852315.1266139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL00b-0007lU-TZ; Tue, 10 Dec 2024 13:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852315.1266139; Tue, 10 Dec 2024 13:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL00b-0007jv-Pr; Tue, 10 Dec 2024 13:10:37 +0000
Received: by outflank-mailman (input) for mailman id 852315;
 Tue, 10 Dec 2024 13:10:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zYqq=TD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tL00a-0007jp-CH
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 13:10:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23bdc95e-b6f8-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 14:10:34 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 11BAE4EE0738;
 Tue, 10 Dec 2024 14:10:33 +0100 (CET)
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
X-Inumbo-ID: 23bdc95e-b6f8-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1733836233; bh=ZLb419UtYIiSd+C8NJrDogsdQjYSzrnVggMezwZxMZ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BquhtKY6qEW8ahSfeja92GRZKSRV5gj6hxmWYP1yWO/81gnzHx7W4r53T8qosDg6K
	 g38U365dCpetsSBoo4/MhSG2rT9hQlUNYUvAGbT8x+GTPzj4Adba+z5jKp9RApc70j
	 1h3wctwcYerE/4ftSe8MscKA3PCgvX0yvKIKmHrlkip0y5E15syxwLH7Z4vUxqAg07
	 IXF3ZSfLsC8mwFp6fuGtslj3GRFdMVw/C9/1hwX7n6JOHgv19rYxsdtNh5f5JX6exX
	 GBdHwhOamVY7w9+g5PYzUzZh5DFWIK7d0+9r+ao7OHBvURln3YTWQeexV/icu3id4n
	 eEtjLElMXgbcQ==
MIME-Version: 1.0
Date: Tue, 10 Dec 2024 14:10:33 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3] x86: p2m-pod: address violation of MISRA C Rule
 2.1
In-Reply-To: <b8680a05-1605-40ae-a3e6-e013525097cc@suse.com>
References: <05b5fd3a85d033adacd5aa08ca81ce579cb1a120.1733827766.git.nicola.vetrini@bugseng.com>
 <b8680a05-1605-40ae-a3e6-e013525097cc@suse.com>
Message-ID: <7684e75d33c741c532a65014473e2f92@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-12-10 13:43, Jan Beulich wrote:
> On 10.12.2024 11:54, Nicola Vetrini wrote:
>> Rule 2.1 states: "A project shall not contain unreachable code".
>> 
>> The placement of the loop after "out_unmap" can be moved earlier
>> in order to avoid the unconditional return to be marked as a cause of
>> unreachability for the loop, as this is a consequence of
>> "__builtin_unreachable" being configured in ECLAIR as being 
>> deliberately
>> unreachable, and therefore not reported as causing the code after the
>> "out_unmap" label to be unreachable.
>> 
>> Replacing one instance of "goto out_unmap" with the loop avoids
>> considering the unconditional return at the end of the function as a 
>> cause
>> of unreachability, while preserving the semantics of the function.
>> 
>> No functional change intended.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with ...
> 

Thanks

>> --- a/xen/arch/x86/mm/p2m-pod.c
>> +++ b/xen/arch/x86/mm/p2m-pod.c
>> @@ -1005,7 +1005,14 @@ p2m_pod_zero_check(struct p2m_domain *p2m, 
>> const gfn_t *gfns, unsigned int count
>>              {
>>                  ASSERT_UNREACHABLE();
>>                  domain_crash(d);
>> -                goto out_unmap;
>> +out_unmap:
> 
> ... the label indented by one or more blanks, as per ./CODING_STYLE.
> Happy to adjust while committing.
> 

Right, I followed the style used in this file assuming that it was in 
line with CODING_STYLE, but I now see that this is not the case. No 
problem either way.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

