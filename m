Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D407AF308
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 20:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608482.946974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlCuf-0004Ma-KL; Tue, 26 Sep 2023 18:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608482.946974; Tue, 26 Sep 2023 18:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlCuf-0004Kq-HM; Tue, 26 Sep 2023 18:36:01 +0000
Received: by outflank-mailman (input) for mailman id 608482;
 Tue, 26 Sep 2023 18:35:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IkXO=FK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qlCud-0004Kk-Gn
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 18:35:59 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87c3675d-5c9b-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 20:35:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C6F3182854AF;
 Tue, 26 Sep 2023 13:35:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zLpHj49KWDVj; Tue, 26 Sep 2023 13:35:55 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E83678285510;
 Tue, 26 Sep 2023 13:35:54 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hm6-p5H0jqlD; Tue, 26 Sep 2023 13:35:54 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 4AD0082854AF;
 Tue, 26 Sep 2023 13:35:54 -0500 (CDT)
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
X-Inumbo-ID: 87c3675d-5c9b-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E83678285510
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695753355; bh=n+dQDsjv2Iwm5LbVam4kpYYM71OrO0kEEtUMUVG721s=;
	h=Message-ID:Date:MIME-Version:From:To;
	b=WiybqYpG15xFiY6qpujbFCWrInWam72vhXUv6b9p43CqxOXmCGWtTPH21HzPP4+zb
	 xlmUjfCPZRGv6H11HLFb53lMUqbKObmQaC9f6z1UHYy++LhIPzkRL+CJwzXHmLVqRL
	 Ip8lmgjdQl+oP0UTUkldva+HFuOORBHR4CodzC/Q=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <4919dd70-92c2-b62c-baa7-1733b039a621@raptorengineering.com>
Date: Tue, 26 Sep 2023 13:35:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] automation: Change build script to use arch defconfig
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>, Michal Orzel <michal.orzel@amd.com>
References: <cover.1695681330.git.sanastasio@raptorengineering.com>
 <beb83dd70b15ee6bd896fb26532f5debf955cd48.1695681330.git.sanastasio@raptorengineering.com>
 <alpine.DEB.2.22.394.2309251609330.1403502@ubuntu-linux-20-04-desktop>
 <59f73c32-bde9-b0a4-00e8-24db1fea2d87@suse.com>
 <2f348eb1-1e66-22d4-dafe-20ada835155f@raptorengineering.com>
In-Reply-To: <2f348eb1-1e66-22d4-dafe-20ada835155f@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/26/23 12:43 PM, Shawn Anastasio wrote:
> On 9/26/23 2:19 AM, Jan Beulich wrote:
>> On 26.09.2023 01:12, Stefano Stabellini wrote:
>>> On Mon, 25 Sep 2023, Shawn Anastasio wrote:
>>>> Change automation build script to call the make defconfig target before
>>>> setting CONFIG_DEBUG and extra options. This fixes issues on Power where
>>>> the build fails without using the ppc64_defconfig.
>>>>
>>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>
>> Nit: Tags in chronological order please (also affects patch 1).
>>
> Will fix.
> 
>>> What is the problem specifically? Is the issue that CONFIG_DEBUG enabled
>>> before make olddefconfig causes certain DEBUG options also to default to
>>> yes, and these additional options don't work well on Power?
>>
>> No, the issue is that "make olddefconfig" takes the existing .config
>> without even considering the arch's default configuration that was
>> specified (KBUILD_DEFCONFIG).
>>
>>>> --- a/automation/scripts/build
>>>> +++ b/automation/scripts/build
>>>> @@ -22,7 +22,12 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
>>>>      # RANDCONFIG implies HYPERVISOR_ONLY
>>>>      HYPERVISOR_ONLY="y"
>>>>  else
>>>> -    echo "CONFIG_DEBUG=${debug}" > xen/.config
>>>> +    # Start off with arch's defconfig
>>>> +    make -C xen defconfig
>>>> +
>>>> +    # Drop existing CONFIG_DEBUG and replace with value of ${debug}
>>>> +    sed -i 's/^CONFIG_DEBUG=[yn]//g' xen/.config
>>>> +    echo "CONFIG_DEBUG=${debug}" >> xen/.config
>>>>
>>>>      if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
>>>>          echo "${EXTRA_XEN_CONFIG}" >> xen/.config
>>
>> It never really became clear to me whether kconfig honors the first,
>> last, or any random setting in a .config that it takes as input, when
>> a certain option appears there more than once. The change you make
>> implies it's consistently "last" - can you confirm that's the actual
>> behavior of kconfig?
>>
> 
> I actually tried to avoid this issue alltogether with the sed command I
> added before the echo to drop any existing CONFIG_DEBUG= line.
>

Just realized that options in $EXTRA_XEN_CONFIG would also be subject to
this which is likely what you meant to point out -- my apologies.

I've tested locally and Kconfig does indeed seem to honor the last
setting. It throws some warnings about the overridden symbol but the
build continues with the latest value, e.g:

.config:94:warning: override: reassigning to symbol DEBUG
.config:95:warning: override: reassigning to symbol DEBUG

Thanks,
Shawn

