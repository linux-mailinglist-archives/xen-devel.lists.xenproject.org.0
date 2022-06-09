Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C7D54451E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 09:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344710.570270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzCuZ-0001Wi-NB; Thu, 09 Jun 2022 07:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344710.570270; Thu, 09 Jun 2022 07:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzCuZ-0001UJ-KR; Thu, 09 Jun 2022 07:48:59 +0000
Received: by outflank-mailman (input) for mailman id 344710;
 Thu, 09 Jun 2022 07:40:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Zro=WQ=intel.com=xiaoyao.li@srs-se1.protection.inumbo.net>)
 id 1nzCmR-0001BI-8p
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 07:40:35 +0000
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f95386f-e7c7-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 09:40:32 +0200 (CEST)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 00:39:38 -0700
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.173])
 ([10.255.28.173])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 00:39:36 -0700
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
X-Inumbo-ID: 6f95386f-e7c7-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654760432; x=1686296432;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5n59FDDxmhbu2HSu9CH2sYVaxYeqlNolsszNS27NcpQ=;
  b=AOfJJlgt+jlvPWtQGPeKOGyCSDt92ltI8L2PR70k1wFwcJ3VL5f+mSUi
   /tyiEVmPHyC0nEyceVl+ywQrRKzXzJ1yC4YZxLxc7B7KXaER5yCeBUolB
   rQ8GPQ7zsg4QelBpQWJBRmohcOkLpuLFU77Jp3MHIkc7xtzceLO2vz4h6
   bqscNACjaq7NgaJCtEH3oNmq4FnkgOK3lYOH+YqZraeEvCSN7CoDPttyC
   H5OjCIr9GalQvPbAEgOi7HzJUdVd21tXUdQ6XaFLLLFdJpDoYxMQp5utU
   dHyKtNiiha7Ev5LsXoqmF4f7ouqlh/mfwn26o1m63ZaJoTIld96xERzu1
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="363513210"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="363513210"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="908134993"
Message-ID: <4f2c4d5b-dab8-c9d2-f4c2-b8cd44011630@intel.com>
Date: Thu, 9 Jun 2022 15:39:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/3] x86/vmx: implement Notify VM Exit
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>,
 =?UTF-8?Q?Pau_Monn=c3=a9=2c_Roger?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Cooper, Andrew" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Beulich, Jan"
 <JBeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 "Qiang, Chenyi" <chenyi.qiang@intel.com>
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-4-roger.pau@citrix.com>
 <BN9PR11MB5276B16CB69514120B7E0E318CA79@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <BN9PR11MB5276B16CB69514120B7E0E318CA79@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/9/2022 3:04 PM, Tian, Kevin wrote:
> +Chenyi/Xiaoyao who worked on the KVM support. Presumably
> similar opens have been discussed in KVM hence they have the
> right background to comment here.
> 
>> From: Roger Pau Monne <roger.pau@citrix.com>
>> Sent: Thursday, May 26, 2022 7:12 PM
>>
>> Under certain conditions guests can get the CPU stuck in an unbounded
>> loop without the possibility of an interrupt window to occur on
>> instruction boundary.  This was the case with the scenarios described
>> in XSA-156.
>>
>> Make use of the Notify VM Exit mechanism, that will trigger a VM Exit
>> if no interrupt window occurs for a specified amount of time.  Note
>> that using the Notify VM Exit avoids having to trap #AC and #DB
>> exceptions, as Xen is guaranteed to get a VM Exit even if the guest
>> puts the CPU in a loop without an interrupt window, as such disable
>> the intercepts if the feature is available and enabled.
>>
>> Setting the notify VM exit window to 0 is safe because there's a
>> threshold added by the hardware in order to have a sane window value.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> Changes since v1:
>>   - Properly update debug state when using notify VM exit.
>>   - Reword commit message.
>> ---
>> This change enables the notify VM exit by default, KVM however doesn't
>> seem to enable it by default, and there's the following note in the
>> commit message:
>>
>> "- There's a possibility, however small, that a notify VM exit happens
>>     with VM_CONTEXT_INVALID set in exit qualification. In this case, the
>>     vcpu can no longer run. To avoid killing a well-behaved guest, set
>>     notify window as -1 to disable this feature by default."
>>
>> It's not obviously clear to me whether the comment was meant to be:
>> "There's a possibility, however small, that a notify VM exit _wrongly_
>> happens with VM_CONTEXT_INVALID".
>>
>> It's also not clear whether such wrong hardware behavior only affects
>> a specific set of hardware, 

I'm not sure what you mean for a specific set of hardware.

We make it default off in KVM just in case that future silicon wrongly 
sets VM_CONTEXT_INVALID bit. Becuase we make the policy that VM cannot 
continue running in that case.

For the worst case, if some future silicon happens to have this kind 
silly bug, then the existing product kernel all suffer the possibility 
that their VM being killed due to the feature is default on.

>> in a way that we could avoid enabling
>> notify VM exit there.
>>
>> There's a discussion in one of the Linux patches that 128K might be
>> the safer value in order to prevent false positives, but I have no
>> formal confirmation about this.  Maybe our Intel maintainers can
>> provide some more feedback on a suitable notify VM exit window
>> value.

The 128k is the internal threshold for SPR silicon. The internal 
threshold is tuned by Intel for each silicon, to make sure it's big 
enough to avoid false positive even when user set vmcs.notify_window to 0.

However, it varies for different processor generations.

What is the suitable value is hard to say, it depends on how soon does 
VMM want to intercept the VM. Anyway, Intel ensures that even value 0 is 
safe.

>>
>> I've tested with 0 (the proposed default in the patch) and I don't
>> seem to be able to trigger notify VM exits under normal guest
>> operation.  Note that even in that case the guest won't be destroyed
>> unless the context is corrupt.
>> ---



