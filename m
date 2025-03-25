Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36975A6EE47
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 11:56:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926301.1329171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx1wr-0005MF-F4; Tue, 25 Mar 2025 10:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926301.1329171; Tue, 25 Mar 2025 10:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx1wr-0005Jj-Bk; Tue, 25 Mar 2025 10:55:57 +0000
Received: by outflank-mailman (input) for mailman id 926301;
 Tue, 25 Mar 2025 10:55:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EZqO=WM=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tx1wp-00056Y-EN
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 10:55:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b92e80f3-0967-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 11:55:54 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 983D94EF4728;
 Tue, 25 Mar 2025 11:55:53 +0100 (CET)
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
X-Inumbo-ID: b92e80f3-0967-11f0-9ea3-5ba50f476ded
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1742900153;
	b=0KMfMjh15yeEB40ZquDFwYyDezjSwtL2pv0uVLRgrMCvbqoZ+IkschhcKUQJei2/MwcI
	 uemFQNaltN6XjqWlzJfzc4CNTc/0k0jIDeZ9EiUxEw90T1K/p50RadYr5+UHhoy0ocH2C
	 eAO8/iu6K6Gw3zeqIhB6aPxxNTGQBm8KRbgZiLXiymLa1FpypXJWGtLHnvI2MpHLATMpm
	 dU5GA3jgtM7pc49aJId2V1SO5PvwPYAQYG4x7vx6pljs2Doq3wamJH9cTGHhOVGGydxCW
	 uy3ccDBj4ctfu/YxcrdbvDm/k2/yUCS9kJB23F+BZbXJbvy80OA6tQ7x/6hP8b5qVOR8P
	 nsc4zMRzGTfMIiAa74+sxa3MCuWwye6ifrJoV9Art5YcrxW3c93q73/C3FkV0AtqhzEaM
	 kZfX5fRsR+X9OdmkNWrZB0YO3nb2hRp2G5kSqRJNqjl3V7lPTRWH8JOgC5RKWiSedTS6K
	 lHib1ezpTeEY5AKzSPcAquHKBIE9qFM1tV4zxHaPCywHRLaLLrKp9EIZvNxMuu9Mqd5ef
	 1t+bHDXyw/QOxGb+KCQrgiBpu7TH4M6lIbwGgm3Sk2f8gLNqBIOJeFQHDScAahCYeNzKb
	 TWnOzeeOMr5AJrmrdsSNOVXTGaIOFaA4Uf8xcs2lrgljnfVwh3S5GLr2/naS2yY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1742900153;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=ilUwjiAGNJcFAdIICWaBjPIXXv2Zd5F+IA2f3npweDU=;
	b=m81zFFE8xG5e7vMr6APnsTNPjHNc7EIJE8JO7MXGsqeOF82xooV9IuRdxnVw96tKmdFb
	 uqeTjvcf7Ch1+7G8GIz9yBtsRBqU8xptoWVmtctDF4RLUi2qXt6jiO34U2DKTceKRcWCN
	 RIZV1cBZrssQeR93faycswzwWSjls1kDejyse/GBBVZODZ2bEKHFCXUlK4ByBzZOxMbpX
	 f+eX6eC/M+xO2iF0iOfwFqxJdW1DMaCsXMM6KNGfsiAorMYobBLo4S+9xOydg3yDU/uO1
	 KW4ldoQbrroYAVVMYcpgjL64ccWJzMgfKat8SUiAI449LOvzVrY9u7QICn2RDDpvCegTV
	 kYKWsPrDiyjJXSP1UNc+P3P3+96jZkxpTEmqyVS+8MbH63XFMeT0a1yWM6Inmt6YRpwDO
	 TC+0r/HJY6XXemNFxu0dZhLq/LSVXEUPCsT2aPtNyxp2aq7ceFhi008FyxUZsSrblKUj1
	 GN0beLKHDDXuWFcvkI3KxCoN1llZ3tm+8hj3H/PHMAvPS0EO7iXoAwHX7J+9deuKhVB0q
	 8qOAfit1ntk99TYXgJBKGn2bXGG2zKprVx4CEu8GFKIBxhbLGg4NveikeftIgcAN48Xuh
	 /FKhmKy/Zt+8MlU7cZDWhPTh+Ql2UVjdKMcPJwKA9HoXyGBgMXDx23cPyyfsOdw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1742900153; bh=H5wclqjetaQbiV4vqle48EoTSE1AL9UwBrhAcfsQXM4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KbLdlmWUGZjfixO8Ol8irc8d747Ax1zG4YE0FkfCfCo950ZhmlRMlNAeSWqjb4lLr
	 zf6kOM6KchBo+fN07VzhRHi0dpe/knsvyfBTRV4t9ryMeV+Iil3IMQSVXcb1cpdIF7
	 GscQz15e4lw3NP4T3CPafWKLX7Z2QDKZN28/o4UVeXOcawUgXkxJV7p9F3V8eaHEH0
	 tYLx7Rf4blM2phJLkUMtn/dAnie7sJj5qWU38ZnxtG6YB6QA73LlUNP/tiv7mx77wm
	 VjOu+thr0f/Q/Lll21T9VpMHa3ICkHyuRJJ9wP/1zEhY+7ivh+lwKKq9/ewEFxOfrL
	 jhx6waGnaX5bQ==
MIME-Version: 1.0
Date: Tue, 25 Mar 2025 11:55:53 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 07/15] xen/cpufreq: fix core frequency calculation for
 AMD Family 1Ah CPUs
In-Reply-To: <0b340303-db4e-4723-b53d-178b2676a36c@suse.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-8-Penny.Zheng@amd.com>
 <0b340303-db4e-4723-b53d-178b2676a36c@suse.com>
Message-ID: <d1432802d12ed4fa0ac61c9f7b2cbcc4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-03-24 16:47, Jan Beulich wrote:
> On 06.03.2025 09:39, Penny Zheng wrote:
>> This commit fixes core frequency calculation for AMD Family 1Ah CPUs, 
>> due to
>> a change in the PStateDef MSR layout in AMD Family 1Ah+.
>> In AMD Family 1Ah+, Core current operating frequency in MHz is 
>> calculated as
>> follows:
> 

[...]

> 
>> @@ -658,19 +670,20 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
>>  	if (!(lo >> 63))
>>  		return;
>> 
>> -#define FREQ(v) (c->x86 < 0x17 ? ((((v) & 0x3f) + 0x10) * 100) >> 
>> (((v) >> 6) & 7) \
>> -		                     : (((v) & 0xff) * 25 * 8) / (((v) >> 8) & 
>> 0x3f))
>>  	if (idx && idx < h &&
>>  	    !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
>>  	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
>>  		printk("CPU%u: %lu (%lu ... %lu) MHz\n",
>> -		       smp_processor_id(), FREQ(val), FREQ(lo), FREQ(hi));
>> +		       smp_processor_id(),
>> +		       amd_parse_freq(c, val),
>> +		       amd_parse_freq(c, lo), amd_parse_freq(c, hi));
> 
> I fear Misra won't like multiple function calls to evaluate the 
> parameters
> to pass to another function. Iirc smp_process_id() has special 
> exception,
> so that's okay here. This may be possible to alleviate by marking the 
> new
> helper pure or even const (see gcc doc as to caveats with passing 
> pointers
> to const functions). Cc-ing Nicola for possible clarification or 
> correction.
> 
> Jan

Yes, it would help. Currently there is only a property for 
smp_processor_id(), though there has been some discussion in the past 
about adding a formal deviation. Not a big problem either way since 
currently the rule is non-blocking, but definitely an attribute would 
help any future work on making that clean.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

