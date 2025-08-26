Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB79DB36272
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 15:19:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094398.1449709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtZe-0003bG-B7; Tue, 26 Aug 2025 13:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094398.1449709; Tue, 26 Aug 2025 13:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtZe-0003Yk-7b; Tue, 26 Aug 2025 13:18:54 +0000
Received: by outflank-mailman (input) for mailman id 1094398;
 Tue, 26 Aug 2025 13:18:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dnfn=3G=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uqtZc-0003Ye-Hv
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 13:18:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34118aa7-827f-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 15:18:49 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 271134EE3C0D;
 Tue, 26 Aug 2025 15:18:48 +0200 (CEST)
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
X-Inumbo-ID: 34118aa7-827f-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1756214328;
	b=DFrdtsKvb3qM7POoTeQ0ILGngfMVdO50sIsXtaFD1TNPN0oaNSXu2X6go3DQztp+kb4A
	 O40WBrfzF65zr7R3yu4MmQT8Qatp92YMshZS/CC3buXJcZ9dSbhYywXDzAcbcCAMgeLwt
	 nrDlzKcBhEp/YZ5tC9JiYL1gaIeLkiuZVh7h8BTpNDg945TllZyzhijU9Klhlr+I+sKha
	 0NBSqvG6f/yXfMHgvYHNfySuhvvQf+5hwt+Wb3VrYGG2ckioBsB/sScTC+jqemzWKww/s
	 mIpJOQQyt2isawVK3LDp95uXu+XAz3NvoO0cby467+ZGZ2lIUQ7R8aNiexikFDEAeoI1e
	 ejd9jueVAZp6kkuwpohVl6wzCoX4+RekiI+eHimyKZY/3+4wSEg41Qko99/9Dx1NYt6Yv
	 AaFcEJENeGmh/Wg8Lxyw1awdn6Ny2U/c4qQcrSW2+gcDO+jZN6750E9pSpcXoZw2c+fyH
	 Lcw1/B9mv+nV/HD64FX3H4Wj67jQ3L7XDPVGZjQ8R34NJxOTjiisnBhQTZNbAzVqM3Htp
	 ngY1c1rmk+KHIY1hHPZSl7Cp4e4QGlIZtMrfxCLI2n+SVAieG94qA5CkIQRjE0lAwbgFS
	 aITZB10dCIsFvAi53lhBp+/ucupvRJ9wHRCsfmbiE/UlM56Jl00h6XRtZVigkJE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1756214328;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=mvN2vKUuIhWjjpE/sSy78Bf6+wHBAQKLnC289fBo6vw=;
	b=sjEGCPjWLsfl20k/tvwEX4FPdI02NqSWtwuKSjbhgW50AlgkCPQuZdr+uuypyDra/n8E
	 nvxJZb3bt1C5O3Yg8e0ODd7oWjWtKEjNhSyUC/8doutcZu1+FdcAxwdsNTtn79pUeIrSN
	 a5fyrU29CFZ20k3/DjmzwJra6UN2amzksp3JANYwOFBqPW6P+UT6luspQqFbDtCuODoZo
	 rnTxZLRs61JuvOuMmx6603rnt/iAfL9MThF+fPxynsnNyz3GZ2CAl2yEXXhvZ3kY/ZFZr
	 1cMEBYuCufAxSiVQEc9bx1TV5vtu4emckdgMFjmLafFxNA+PfTJPJQ2WnWBrVS8tjwvKa
	 QouUNq/botCdWfzvIeBTnDK9N/mL8gGGGQp6lHVc9/dgQV0QRut2x0lCw1SeeL2lOFA4L
	 cZxfuXYfsVUXLz5HfcEPXkTzUSCX5tE0XU+LHlAH9J6dPGCBdFUSV9hA6jegcarGU5+YF
	 0oTMn+nJVzYCZmtR/PFQ72J9Yji+2AGzNzzu1HwXAuTFYwfx/qHWrmpb4IO03xEdcuuxc
	 8OerEkCe+zYIKKbD6+LSjJnAwWvm6P0VGhFDFZJZMxrfJnoAtW3hufZWCP/q2MNg3zgd5
	 IZI04QbfQ9EeT9sRsBgQcvdKGqJwI74Z3/lZCZ7WzkiHt6BVNTZi/mqx0vA6PwI=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1756214328; bh=xQHjhOJooiPiBCpe9Vmc/aeThbuYe8+70FQKBf69xkQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e/WEJADT0eyvbwtSIqIcVYURdL5eH1fwdndno6T8rKhvzKM378Z8UeswCt4vtyj2d
	 qieB13DJKejg34Ex7qu/KTl3fbP2AtDWU2SZ4MSUogmxS57LOmA9jJ2hWxdcfW/iaP
	 VdCT7RYyvCuhF4sp29SO7Pq8Rev9lIfvOfd7P1RN+5FEWH/2NYppkLvWCBn2rcZQDY
	 fIssG4DOJHLHPbzHo/QZs/3o9NuGXL+Kw1N3o8P6F/LErfigvo+nvlQChA/K4JhsVp
	 oK25bQ+KSkGGYiqJIppLUpyBeuaLqsejqNcjXPWAKMiF/W13bdh5KINxhXn4Hgl+6I
	 4R/ytQ5Tu87bw==
MIME-Version: 1.0
Date: Tue, 26 Aug 2025 15:18:48 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] misra: add deviation of Rule 17.7
In-Reply-To: <dc6d7445-3abb-485b-9651-15e3aea9ca52@epam.com>
References: <812b78119cee801662a31d39b556cb453aa69508.1756192362.git.dmytro_prokopchuk1@epam.com>
 <204a1526-7e3f-4b91-b1ee-95f3d89ff756@suse.com>
 <112a4ab83bf2abce09d4ff1b67671847@bugseng.com>
 <dc6d7445-3abb-485b-9651-15e3aea9ca52@epam.com>
Message-ID: <134e8e34582445522e82584aff3b7229@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-26 15:14, Dmytro Prokopchuk1 wrote:
> On 8/26/25 10:56, Nicola Vetrini wrote:
>> On 2025-08-26 09:45, Jan Beulich wrote:
>>> On 26.08.2025 09:36, Dmytro Prokopchuk1 wrote:
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -575,6 +575,11 @@ safe."
>>>>  -config=MC3A2.R17.7,calls+={safe, "any()",
>>>> "decl(name(__builtin_memcpy||__builtin_memmove||__builtin_memset||
>>>> cpumask_check))"}
>>>>  -doc_end
>>>> 
>>>> +-doc_begin="It is safe to deviate functions like 'memcpy()',
>>>> 'memset()', 'memmove()', as they return a value purely for 
>>>> convenience,
>>>> +their primary functionality (memory manipulation) remains
>>>> unaffected, and their return values are generally non-critical and
>>>> seldom relied upon."
>>>> +-config=MC3A2.R17.7,calls+={safe, "any()", "decl(name(memcpy||
>>>> memset||memmove))"}
>>>> +-doc_end
>>>> +
>>>>  #
>>>>  # Series 18.
>>>>  #
>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -576,6 +576,13 @@ Deviations related to MISRA C:2012 Rules:
>>>>           - __builtin_memset()
>>>>           - cpumask_check()
>>>> 
>>>> +   * - R17.7
>>>> +     - It is safe to deviate functions like 'memcpy()', 'memset()',
>>>> 'memmove()',
>>>> +       as they return a value purely for convenience, their primary
>>>> functionality
>>>> +       (memory manipulation) remains unaffected, and their return
>>>> values are
>>>> +       generally non-critical and seldom relied upon.
>>>> +     - Tagged as `safe` for ECLAIR.
>>> 
>>> I realize I may be overly nitpicky here, but in files named
>>> deviations.* I find it
>>> odd to read "It is safe to deviate ...". I further find the use of
>>> "like" odd when
>>> you enumerate the complete set anyway.
> 
> Updated wording (probably for the v3, if it's fine):
> 
> The functions 'memcpy()', 'memset()', and 'memmove()' return values
> primarily for convenience.
> The core functionality of these functions (memory manipulation) remains
> unaffected, and their return values
> are generally non-critical and seldom relied upon. Therefore, 
> deviations
> from this rule regarding their use
> can be considered safe.
> 

The last sentence reads a little strangely. I would write: "Therefore, 
violations of this rule due to these functions are deemed safe."

> Dmytro.
> 
>>> 
>>> I wonder whether the deviation wants generalizing anyway:
>>> Informational return
>>> values are generally okay to ignore. That is, the Eclair 
>>> configuration
>>> would be
>>> limited to the three functions for now, but the text / comment could
>>> already be
>>> broader. Then, for example, open-coded uses of the corresponding
>>> builtin functions
>>> would also be covered right away.
>>> 
>> 
>> While I understand the pragmatic reasoning, from a MISRA compliance
>> standpoint it would be better not to make the written justification 
>> and
>> the actual deviation diverge, and then wide both the ECLAIR
>> configuration and its justification suitably once new cases want to be
>> deviated. Other than that,
>> 
>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

