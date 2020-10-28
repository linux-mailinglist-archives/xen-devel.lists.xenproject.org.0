Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8640F29CE80
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 08:23:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13317.33871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXfnS-0001XY-60; Wed, 28 Oct 2020 07:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13317.33871; Wed, 28 Oct 2020 07:23:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXfnS-0001WV-2j; Wed, 28 Oct 2020 07:23:02 +0000
Received: by outflank-mailman (input) for mailman id 13317;
 Wed, 28 Oct 2020 07:23:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXfnQ-0001WO-79
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 07:23:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd554b9d-b447-4104-afac-ff0f72e5bc4d;
 Wed, 28 Oct 2020 07:22:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3D87AC91;
 Wed, 28 Oct 2020 07:22:58 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXfnQ-0001WO-79
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 07:23:00 +0000
X-Inumbo-ID: cd554b9d-b447-4104-afac-ff0f72e5bc4d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cd554b9d-b447-4104-afac-ff0f72e5bc4d;
	Wed, 28 Oct 2020 07:22:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603869778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rk5iwzZRpz+eecA97DrbPMASTKj+GayBmzsxxFyB5iU=;
	b=ZCq5phEy8zzPDWKtdM90WEudGRmICWe8wGrrFXYeQdWBhJMNPldPoHW8ggsqPt7NbyJ6OV
	g9RcWo1ww/Z1IZyBkc+6DUD5JLMGYdX6OoveK2f37X52ldXE/bQaGbo3l/RvVnAyqkmHqx
	+IV86z6I3JlGYfyNgOalHK2XspqUOVA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A3D87AC91;
	Wed, 28 Oct 2020 07:22:58 +0000 (UTC)
Subject: Re: [PATCH v1 2/4] xen/pci: Introduce new CONFIG_HAS_PCI_ATS flag for
 PCI ATS functionality.
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <1bb971bed3f5a56b0691fbcfd0346ae721ba049f.1603731279.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2010271640280.12247@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f2930a1d-ec05-6c24-c012-76a307f97deb@suse.com>
Date: Wed, 28 Oct 2020 08:22:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010271640280.12247@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.10.2020 00:55, Stefano Stabellini wrote:
> On Mon, 26 Oct 2020, Rahul Singh wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -20,6 +20,7 @@ config X86
>>  	select HAS_NS16550
>>  	select HAS_PASSTHROUGH
>>  	select HAS_PCI
>> +	select HAS_PCI_ATS

From an abstract perspective - is there a way to have a PCI
subsystem where it is impossible for an ATS-capable devices to
be present? I think this shouldn't be a HAS_* option, but an
ordinary user selectable one. We may then even want to consider
having it off by default on x86 (the command line option
defaults to off as well, after all).

>> @@ -48,5 +50,27 @@ static inline int pci_ats_device(int seg, int bus, int devfn)
>>      return pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
>>  }
>>  
>> +#else
>> +
>> +static inline int enable_ats_device(struct pci_dev *pdev,
>> +                                    struct list_head *ats_list)
>> +{
>> +    return -ENODEV;
>> +}
>> +
>> +static inline void disable_ats_device(struct pci_dev *pdev) { }
>> +
>> +static inline int pci_ats_enabled(int seg, int bus, int devfn)
>> +{
>> +    return -ENODEV;
>> +}
> 
> pci_ats_enabled returns 0 when ATS is not enabled
> 
> 
>> +static inline int pci_ats_device(int seg, int bus, int devfn)
>> +{
>> +    return -ENODEV;
> 
> also returns 0 when ATS is not enabled

And really both ought to be returning bool.

Jan

