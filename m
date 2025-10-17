Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB64ABE6E58
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 09:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144976.1478156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9eaI-0002Wa-VW; Fri, 17 Oct 2025 07:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144976.1478156; Fri, 17 Oct 2025 07:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9eaI-0002VA-SV; Fri, 17 Oct 2025 07:09:06 +0000
Received: by outflank-mailman (input) for mailman id 1144976;
 Fri, 17 Oct 2025 07:09:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YhSQ=42=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1v9eaH-0002V4-4k
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 07:09:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2963c389-ab28-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 09:09:03 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 188044EEBC5F;
 Fri, 17 Oct 2025 09:09:02 +0200 (CEST)
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
X-Inumbo-ID: 2963c389-ab28-11f0-9d15-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1760684942;
	b=rukfvWtCQPfyuqglTgiLPcowOTzCmRi5mRfjpVOEnwOAGNbhn+PsOEgybjj++AzKI4kP
	 h+vUGVPMQc+Dn1V05VqWddD+XIgIUQisgh+5vIfA8G1gbxctU/ng76B1DP3LqQB8iRNkJ
	 Z8UnwiCbTiXaqAn0p3EOoiJ2EbhyRs7V1vQACk0bVsMX6ZWXS9TU0iPmyfA2ztzaqAbwY
	 R/+uUJDQP5Nxc7lSKON0+8+mdUXgZj1B81VJjJdc8TIZDmUTBfkkSIZuVaa3VjkqjNTag
	 USS3uYIzlbppekgiO4AzjUIrqjWRcoVaCs/Vx6/Ee8APgRXUKUbxDkkPTRGuh5m/t5zuZ
	 XbDdzlT0//DrjzXtXudftOCcYaPVMdgThAjH/kAQL/JsZslRriUUi2FFV0nRvOj9LvKbG
	 sFxoQ5K1Z0xkfctV6J4ccEG0p5SMd42DtdYgg+SSVq024kapmFiEBd1zmz+euSCCVEnAo
	 29sgmXC+PiYEImVRFDpb/YDjFdHbR4sOYrO4BOE/iP5PoQ+e0r2NWgG4wrnHDXPWP0haG
	 uHQw+NkK4k79WmzbKcKUcToQ94igC/Zf0AsKUfqvzU4CiZq5+nzRD+lpqbSzRqKsZj2WY
	 mLIbX9qZfpDMDCAY7XODUaBfXpjiLuxYIndADUOeSSe4NK/a905NlHiAZYKyxwQ=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1760684942;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=uOLU68QL+B1cd2TjzJ1O64c9poVxHBQFTgYc+mgv57E=;
	b=R1x3hh/ggebYXYorO/sECJfl9yT0knAOiEzkVSvV5lfH09a5hfRhLXU+Oo5AJpFuOK+K
	 zqWx7QwI/OUpBm+/M3bkQE3bcssazdnaDPS4TJU9Q0tHDlAa8qTFaJk+MSkfg/u/J3OIe
	 pVEABSkG64u65WNxEmovfh5gj2h1JS7r7q3NReL8oIZcjMsFmabwehzgyHiUj/KJZS+UR
	 rfdVc2oyklavtjd/G1OXbr2S9yU2iNN03Uo8cxne7R19MU4poboTq6iv2EaF8AUomATcW
	 4w17UoX2O61Jzu5C/QJSnKqT4JbrvzH02Lj9J8eYAGVgvqsLbpfuGXC0DHXShlt+g99L1
	 RrCi7KFg4PZ7KvJj6TeaEU6mMfmukzVsXS7Loaz7i5MdHs8U0nGz5zlFWh3eWaVH3RBeD
	 t0RIyIlf7lSDIn/f4xEh9x7LD7tohMYoIhluKPK4IkNGSCpzHgGDj346rN4c7t6pkpePU
	 NoHOYzDCWrp90XIIcxp4aQDl5/yVcvC4oAfF3krwvyDgDgmE10hJfdi5od9nmFxe2VqSE
	 ezu/9lfrPkCXwLUESxbC4NhGSKhi7Wy5AIf+ZjH+1crEppte0abrxLgET1F0StQQ6IGIn
	 zgxMg7j7Iyvet/p6wwQ9mOeP9HRuj3CE9HkfxREW1yUGHcJymPsU/pjxXbOM2bA=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1760684942; bh=SelCThbNPkQ+ztePm1/4P6CBVR+deXT/K2b2yEXDICA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RAUjRC4e9p5x4wbGuj6D2zdgWMh5d3XeMkoa+ash3QzwuGsSQFC315ELLYZVMfMtY
	 Tv1Tcc7U0UC1X+0YpSf/73IX52Mo6AV5+a5X3p/xW9plTQ+MO7O49i8DhByyuis7VG
	 gp5x0/IDiY8WDq68ONGRPmhLaiGCUUpzFtVzEE6jLmUs6Oi5BScbnE+nB8gIeL+KWZ
	 CSbd+q8KHukKdYq+zat7kxRU2/dGKKymEpRDl33NJaeL6BcYZoegOwGeBU6HFSSKja
	 D3SoAk2WWd5lnOcVhrBTlKO24WLa5Sx8rrPJu42wiZHuFqQFyusjUtugSO0+0ei9Yy
	 jDiggBJau/arw==
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 09:09:02 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] misra: consider conversion from UL or (void*) to
 function pointer as safe
In-Reply-To: <ceedeefa-c506-41ca-9dfc-76937979caa9@suse.com>
References: <0e72c83102668dfa6f14c4e8f9839b4a73d30b3d.1760458094.git.dmytro_prokopchuk1@epam.com>
 <ceedeefa-c506-41ca-9dfc-76937979caa9@suse.com>
Message-ID: <321363444f9a3d3471bf1b3b2e020047@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-10-15 08:20, Jan Beulich wrote:
> On 14.10.2025 18:16, Dmytro Prokopchuk1 wrote:
>> --- a/xen/common/version.c
>> +++ b/xen/common/version.c
>> @@ -217,6 +217,20 @@ void __init xen_build_init(void)
>>  #endif /* CONFIG_X86 */
>>  }
>>  #endif /* BUILD_ID */
>> +
>> +#if defined(__i386__) || defined(__x86_64__) || defined(__arm__) || 
>> defined(__aarch64__)
> 
> Why __i386__? Also (nit): Line too long.
> 
> And why this restriction without any comment here or ...
> 
>> +static void __init __maybe_unused build_assertions(void)
>> +{
>> +    /*
>> +     * To confirm conversion compatibility between unsigned long, 
>> (void *)
>> +     * and function pointers for X86 and ARM architectures only.
> 
> ... explanation here? More generally - how would people know to update
> the condition if another port was to be certified?
> 
> Finally, with the v3 addition here, is Nicola's R-b really still 
> applicable?
> 

I agree with the point you make about i386 (e.g., 
C-language-toolchain.rst may be mentioned to provide some context about 
the preprocessor guard); that said, my R-by can be retained

> Jan
> 
>> +     */
>> +
>> +    BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
>> +    BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
>> +}
>> +#endif
>> +
>>  /*
>>   * Local variables:
>>   * mode: C

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

