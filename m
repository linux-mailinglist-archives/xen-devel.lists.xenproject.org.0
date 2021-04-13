Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6BB35DB10
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 11:24:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109604.209232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWFHI-0003Ot-HR; Tue, 13 Apr 2021 09:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109604.209232; Tue, 13 Apr 2021 09:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWFHI-0003OU-ES; Tue, 13 Apr 2021 09:24:12 +0000
Received: by outflank-mailman (input) for mailman id 109604;
 Tue, 13 Apr 2021 09:24:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWFHG-0003OO-UJ
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 09:24:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9911ded-f39a-4bf6-a234-252def82cb15;
 Tue, 13 Apr 2021 09:24:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECAD9AF0D;
 Tue, 13 Apr 2021 09:24:08 +0000 (UTC)
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
X-Inumbo-ID: f9911ded-f39a-4bf6-a234-252def82cb15
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618305849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0JyzQT29QISH1n2na2do1XSDb0Bj3BwcVDJrbVg7+zo=;
	b=j0sTeKWFOS/ctbjv1DJD3oxq5NHFWsQy5Dz4csHgGQMerAyk0wESxHS7QrMFICD54wkktY
	/edukcNjcIIduBti1iDW2BCZZsan+J7tfzgITIshs5hgnYPYEOyyvsVoQlULlp+0hq8iO/
	qgyEb6oTSxvtdfbTmY7ygEZqTZSgWtA=
Subject: Re: [PATCH v4] VMX: use a single, global APIC access page
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <1c489e77-6e65-6121-6c28-3c4bd377223c@suse.com>
 <YHRnvQvWJ7QsXVgX@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c07396f2-b0c5-092b-4e3e-5f452c453e56@suse.com>
Date: Tue, 13 Apr 2021 11:24:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YHRnvQvWJ7QsXVgX@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.04.2021 17:31, Roger Pau Monné wrote:
> On Mon, Apr 12, 2021 at 12:40:48PM +0200, Jan Beulich wrote:
>> The address of this page is used by the CPU only to recognize when to
>> access the virtual APIC page instead. No accesses would ever go to this
>> page. It only needs to be present in the (CPU) page tables so that
>> address translation will produce its address as result for respective
>> accesses.
>>
>> By making this page global, we also eliminate the need to refcount it,
>> or to assign it to any domain in the first place.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>> ---
>> v4: Set PGC_extra on the page. Make shadow mode work.
>> v3: Split p2m insertion change to a separate patch.
>> v2: Avoid insertion when !has_vlapic(). Split off change to
>>     p2m_get_iommu_flags().
>> ---
>> I did further consider not allocating any real page at all, but just
>> using the address of some unpopulated space (which would require
>> announcing this page as reserved to Dom0, so it wouldn't put any PCI
>> MMIO BARs there). But I thought this would be too controversial, because
>> of the possible risks associated with this.
> 
> Really seems more trouble than reward. Also there are systems with
> MMIO regions in holes on the memory map, like the issue I had with the
> Intel pinctrl stuff that had an MMIO region in a hole on the memory
> map [0], so I'm not sure Xen would be in a position to select a
> suitable unpopulated page anyway.
> 
> [0] https://lore.kernel.org/xen-devel/YFx80wYt%2FKcHanC7@smile.fi.intel.com/

Yeah, I had seen that. What I'm having trouble to understand is how the
OS will know to avoid that range for e.g. placing BARs.

>> @@ -411,28 +411,22 @@ static int vmx_domain_initialise(struct
>>       */
>>      d->arch.hvm.vmx.exec_sp = is_hardware_domain(d) || opt_ept_exec_sp;
>>  
>> -    if ( !has_vlapic(d) )
>> -        return 0;
>> -
>> -    if ( (rc = vmx_alloc_vlapic_mapping(d)) != 0 )
>> -        return rc;
>> -
>>      return 0;
>>  }
>>  
>> -static void vmx_domain_relinquish_resources(struct domain *d)
>> +static void domain_creation_finished(struct domain *d)
>>  {
>> -    if ( !has_vlapic(d) )
>> +    gfn_t gfn = gaddr_to_gfn(APIC_DEFAULT_PHYS_BASE);
> 
> Worth making it const static?

The compiler ought to be able to fold this into a suitable constant
at the use site. Definitely not static imo, and I see little point
in making a local variable const, unless one really wants to
document something very special.

>> +    uint8_t ipat;
>> +
>> +    if ( !has_vlapic(d) || mfn_eq(apic_access_mfn, _mfn(0)) )
> 
> It would be better to use INVALID_MFN here, and init apic_access_mfn
> to that value.

Oh, yes, that's easier possible now that the variable is static.

>> --- a/xen/arch/x86/mm/shadow/set.c
>> +++ b/xen/arch/x86/mm/shadow/set.c
>> @@ -94,6 +94,22 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
>>      ASSERT(!sh_l1e_is_magic(sl1e));
>>      ASSERT(shadow_mode_refcounts(d));
>>  
>> +    /*
>> +     * VMX'es APIC access MFN is just a surrogate page.  It doesn't actually
>> +     * get accessed, and hence there's no need to refcount it (and refcounting
>> +     * would fail, due to the page having no owner).
>> +     */
>> +    if ( mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) )
> 
> I find this assignment inside the parameter list quite ugly, I would
> rather split it on it's own line.

Well, okay. To be honest I'm not even sure why I did it this way, as
I could have expected a respective comment.

>> +    {
>> +        const struct page_info *pg = mfn_to_page(mfn);
>> +
>> +        if ( !page_get_owner(pg) && (pg->count_info & PGC_extra) )
>> +        {
>> +            ASSERT(type == p2m_mmio_direct);
>> +            return 0;
> 
> Are there any other pages that could pass this check? I don't think
> so, but wanted to assert.

"Normal" extra pages have an owner, so no, there aren't any others.
If and when any appear, this may need further customizing, albeit
generally I'd hope further pages matching this pattern would also
want similar treatment.

Jan

