Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0986AACFD49
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:13:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008004.1387214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRG4-0007NM-Bl; Fri, 06 Jun 2025 07:12:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008004.1387214; Fri, 06 Jun 2025 07:12:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRG4-0007Kr-7s; Fri, 06 Jun 2025 07:12:56 +0000
Received: by outflank-mailman (input) for mailman id 1008004;
 Fri, 06 Jun 2025 07:12:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiyi=YV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uNRG3-0007K6-6M
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:12:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a95a309c-42a5-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 09:12:52 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 918824EE7C3E;
 Fri,  6 Jun 2025 09:12:52 +0200 (CEST)
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
X-Inumbo-ID: a95a309c-42a5-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1749193972;
	b=KEuBOrWrt8hxb4KviAmQMkmbOAYfrWVBihPQKiE4Z6vYZLFCniY3e6gYoBFEEkssDtsz
	 qanDT/xJDub4NiiClVDsHe5v5JrgMZGPK8GjoOr39aGvR4SFKiMhXTr64TfcbJHXvsKRm
	 7omy4MH8p/Sc/K0LuUQscORpxMKGEjo/gP49IFZN+1Jn44eWeGggmKJmmQbI800kSrLv2
	 9/Ah8ZQozM35VdHD4dpB1WQ46xBjHVjDN5q6bGpD+qG3RjIA4H+3ADydZBGgjqYzkbtoa
	 +d4FZ3x6FnFR3a21w20lbbqdax7bge3t4e0kCpdFYhQboiFHh6arLs2n7i032DTrgvxsH
	 Bp4zm5upq3ANcgVlrpLQ4+dVe+g5S9GKpQdmu2Z7yLRSChuSGQAQ+YXcmGJBakBEs+Unw
	 AX7Onzf1O0UVIg0lbPyvSyhXimKCT61oQZYLmZMhmcW0HHl4/HS4bmm1Z9pgvR4KPYsvA
	 InIJ8y4fpBnBte7D4IuyGc/nk3cvHdGoF7yZDNQYSD5Sx39RJTi1v6DoFsAR4crl2eut4
	 L59WiCRIjZA7k86xmrGeQhf+dRvO8GM4pqMURf+h94EWztdeIDDbs9IZFaO7rJEufhNkG
	 Rr8F/3J/BBVt2lkNQbNKplXF1V0MEq37fpyVBsrC4e6FxVkZjWUNWG4bqBL3nJE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1749193972;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=8XlTGpk6rzDC9YecCj+wib31GFHYBlMi6psmQaX3a3A=;
	b=IAwwlNB7U6/yb08y8pVNMcP5IfonrVuB9NoD4rMyn525y/Mvh4LQExN92gFNaQgnapiA
	 12+Sfr8RBVGdXGBRKx+kq76SYyZlICZ2NGlZDaqE+VYdvzCKXmYAtF8rCp0jvQiZCfTym
	 AyFv6tsSbdLQZxZfRfBbgS5IRoc3xRnnFs4BTxfVYABqVYOl5BoQuMszF85ISFwj/P55h
	 sx/D8lEdKhdI4hrlRB+lnNujBuvHx+DVXCYoZ/dhhZ/Uf/LBNrK7YkUDYY8LuSur8Q+a4
	 f+1t5vXiYqZWvhuJERmTNLZ4kkIbba+kPUxSI8fZ2G8Mt0sDdInsJQ9kIR2xHwMS6PNbS
	 PRpl0c1vPE8BuylcgBHC660Dh1hBDyb/9cLo2mf8k3a3OdaVKXdrXLREx10glzYaG5rgg
	 TYXEFCC2/teOG3eRyRpAzLOsxUc7TDPxWisZup+pGnbX5o1bzkS0ZZNAWujm9L1JRpjVF
	 03dxvfkfQ4Q4TepvSltFY0pHmSUOzKxy7CbaGaHtnIuTQjlAtxFtZskesou/QrJrwy2QO
	 zgy3WMqUMpuGc+zTA4mCbmhWY8ljy5PJIa/rXALxV9/urCTDyPbKnn7xBhIQN+H1zOHTh
	 0LNOrYT59fQ20k6HguP5l8KjfNu5VKz+pHRQYzdGbMeFGLbiOhEB2rUzI3JdsrM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1749193972; bh=MEIswzf9AbMH3RMOi3FfrqAXmVJCATQH/G9GbmTX6tw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QfDQXTEVnPG5O4XNPs9ZtjaDCP2BxSUEJ/Idh1RJcksDCQi0GpdzCjXjI9E/ZIL/Y
	 SHXLHKy/hokTl8AsExks8NB6J9h1VcnZQcOWumTDc7vJfp+xO0Tn/AqzwP2X57BRYc
	 CSEGkHRTFvNLt6lS8BDXlPnMXvltcFtnpIkHvPMmEpjxgV2x9Gs9Fd2wIACQXgomMS
	 yxRBh8+hoKiPzI8jzOxsEFegAaeCw5Q7suFG0V9HwBBbZXEgkKykEsUGM7cTMp4E4F
	 Uv7e9TJLoWXP5O8qEpHk+M8EpzqWFrx8b3a4vA+iCbUetutN1+2oJULK1YbVldXnkd
	 H+bngwkfX3Xrg==
MIME-Version: 1.0
Date: Fri, 06 Jun 2025 09:12:52 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <stefano.stabellini@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Alessandro
 Zucchelli <alessandro.zucchelli@bugseng.com>,
 xen-devel@lists.xenproject.org, federico.serafini@bugseng.com
Subject: Re: [PATCH] x86: remove memcmp calls non-compliant with Rule 21.16.
In-Reply-To: <alpine.DEB.2.22.394.2506051624050.2495561@ubuntu-linux-20-04-desktop>
References: <20250604233537.2892206-1-stefano.stabellini@amd.com>
 <c252a43a-4e00-4584-bbb1-05347aa9b49f@suse.com>
 <alpine.DEB.2.22.394.2506051624050.2495561@ubuntu-linux-20-04-desktop>
Message-ID: <13ad335c1868bcc02e2dc0a8da521f6d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-06 01:39, Stefano Stabellini wrote:
> On Thu, 5 Jun 2025, Jan Beulich wrote:
>> On 05.06.2025 01:35, Stefano Stabellini wrote:
>> > From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>> >
>> > MISRA C Rule 21.16 states the following: "The pointer arguments to
>> > the Standard Library function `memcmp' shall point to either a pointer
>> > type, an essentially signed type, an essentially unsigned type, an
>> > essentially Boolean type or an essentially enum type".
>> >
>> > Comparing string literals with char arrays is more appropriately
>> > done via strncmp.
>> 
>> More appropriately - maybe. Yet less efficiently. IOW I view ...
>> 
>> > No functional change.
>> 
>> ... this as at the edge of not being true.
>> 

Then our views of what constitutes a functional change clearly differ. 
If you are concerned about performance the patch may be dropped, but 
then does it make sense to apply the rule at all? An alternative 
suggestion might be that of deviating the rule for memcmp applied to 
string literals in either the first or second argument, or both).

>> > Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>> 
>> Missing your own S-o-b.
>> 
>> Also (nit) may I ask that you drop the full stop from the patch 
>> subject?
> 
> I'll add the S-o-B and fix the subject
> 
> 
>> > --- a/xen/arch/x86/dmi_scan.c
>> > +++ b/xen/arch/x86/dmi_scan.c
>> > @@ -233,7 +233,7 @@ void __init dmi_efi_get_table(const void *smbios, const void *smbios3)
>> >  	const struct smbios_eps *eps = smbios;
>> >  	const struct smbios3_eps *eps3 = smbios3;
>> >
>> > -	if (eps3 && memcmp(eps3->anchor, "_SM3_", 5) == 0 &&
>> > +	if (eps3 && strncmp(eps3->anchor, "_SM3_", 5) == 0 &&
>> 
>> Unlike the last example given in the doc, this does not pose the risk 
>> of
>> false "not equal" returns. Considering there's no example there 
>> exactly
>> matching this situation, I'm not convinced a change is actually 
>> needed.
>> (Applies to all other changes here, too.)
> 
> If we consider string literals "pointer types", then I think you are
> right that this would fall under what is permitted by 21.16. Nicola,
> what do you think?
> 

While I agree that the result of the comparison is correct either way in 
these cases, the rule is written to be simple to apply (i.e., not 
limited only to those cases that may differ), and in particular in the 
rationale it is indicated that using memcmp to compare string *may* 
indicate a mistake. As written above, deviating the string literal 
comparisons is an option, which can be justified with efficiency 
concerns, but it goes a bit against the rationale of the rule itself.

> 
>> > @@ -302,7 +302,7 @@ const char *__init dmi_get_table(paddr_t *base, u32 *len)
>> >  				continue;
>> >  			memcpy_fromio(&eps.dmi + 1, q + sizeof(eps.dmi),
>> >  			              sizeof(eps.smbios3) - sizeof(eps.dmi));
>> > -			if (!memcmp(eps.smbios3.anchor, "_SM3_", 5) &&
>> > +			if (strncmp(eps.smbios3.anchor, "_SM3_", 5) == 0 &&
>> 
>> Here and below there's a further (style) change, moving from ! to "== 
>> 0"
>> (or from implicit boolean to "!= 0"). As we use the original style in 
>> many
>> other places, some justification for this extra change would be needed 
>> in
>> the description (or these extra adjustments be dropped).
> 
> The adjustments can be dropped
> 
> 
>> > @@ -720,10 +720,10 @@ static void __init efi_check_config(void)
>> >  	__set_fixmap(FIX_EFI_MPF, PFN_DOWN(efi.mps), __PAGE_HYPERVISOR);
>> >  	mpf = fix_to_virt(FIX_EFI_MPF) + ((long)efi.mps & (PAGE_SIZE-1));
>> >
>> > -	if (memcmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
>> > -	    mpf->mpf_length == 1 &&
>> > -	    mpf_checksum((void *)mpf, 16) &&
>> > -	    (mpf->mpf_specification == 1 || mpf->mpf_specification == 4)) {
>> > +	if (strncmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
>> > +            mpf->mpf_length == 1 &&
>> > +            mpf_checksum((void *)mpf, 16) &&
>> > +            (mpf->mpf_specification == 1 || mpf->mpf_specification == 4)) {
>> >  		smp_found_config = true;
>> >  		printk(KERN_INFO "SMP MP-table at %08lx\n", efi.mps);
>> >  		mpf_found = mpf;
>> 
>> There are extra (indentation) changes here which ought to be dropped.
> 
> Yes

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

