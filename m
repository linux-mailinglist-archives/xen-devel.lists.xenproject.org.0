Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD28BB81BB
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 22:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136849.1473284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4mPn-0004o2-OY; Fri, 03 Oct 2025 20:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136849.1473284; Fri, 03 Oct 2025 20:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4mPn-0004lo-KS; Fri, 03 Oct 2025 20:30:07 +0000
Received: by outflank-mailman (input) for mailman id 1136849;
 Fri, 03 Oct 2025 20:30:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4mzO=4M=bell.net=dave.anglin@srs-se1.protection.inumbo.net>)
 id 1v4mPl-0004dY-Rh
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 20:30:05 +0000
Received: from cmx-mtlrgo001.bell.net (mta-mtl-007.bell.net [209.71.208.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdb13c9a-a097-11f0-9d14-b5c5bf9af7f9;
 Fri, 03 Oct 2025 22:30:04 +0200 (CEST)
Received: from [192.168.2.49] (142.126.189.246) by cmx-mtlrgo001.bell.net
 (authenticated as dave.anglin@bell.net)
 id 68C1701503F87783; Fri, 3 Oct 2025 16:28:45 -0400
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
X-Inumbo-ID: bdb13c9a-a097-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bell.net; s=selector1; t=1759523404; 
        bh=ZSiozYL9av6/yqYZ1ojB886S7qQBNu1kIdF3OOFiSt4=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type;
        b=mTyB940Q0GfYnz21tXBKxSqulFOleIM8RqWAD1qt0T+IeVc/x7q7w2b5fRIOtNXDNYcWfwqOc1XE/8ZiQvYv9IUqrPAVyjdV9tzWazGdgV9waIoTwZuRGyJVXRyw3HdLAbMmaDwvX/DnZZMuOe/hYT2pUn/4G/pMadKa1vPmonyx06EQLMKqbIaYjm9Ywu7zbP+EeJdnUMOipDSFlERyd5QUTqvmNWXWgKC7rz71cvp5ysij7JS8K1uNHzu6XRQuvFEufyez+tkVwvh73Ft0PmeSGAn3ntwarU0fgPFWE5NCtZCcwHaDocyhTZNT6XB3+INlaDdgbnmii+pw1xYCcg==
X-RG-SOPHOS: Clean
X-RG-VADE-SC: 0
X-RG-VADE: Clean
X-Originating-IP: [142.126.189.246]
X-RG-Env-Sender: dave.anglin@bell.net
X-RG-Rigid: 68C1701503F87783
X-RazorGate-Vade: dmFkZTFAVSVH3SiUOFRgEpdKbxkygZJRN+wjQ3+7JLA/aHxHSm5i7/PF4mTBT8WtBn7+lxiMRPYLKXtCf7iS9x+McIrTICRECzSEsBDDmX0g+rXi4ctSksWPFcfviRm+PotPodUreZwFE6frq9b/vZEWb9zohQp8N7b1TBIv581R6bMFc3aRYEoBuh6XFu7wQcCcbyctvLBQ9AekV97lK3DUxQ9tGcTDjh44Ei8XDzNWZYGLXru/OXuyyVa7U035NNK7XE/UT2nBkRYYlTzUefAExYdm5r1AjIdGXoCVmMdRppQMDACxagJbItn+DPkJkK1D0uasAZcsSUoBAyFDdObcd9rbrkK+4MlJQXN6niRN7ztkec65gQWM7JFKddfdKIVZMsOdle3RXVrmEbYnkuZw+ClrPLYlsCYCGLNnzy9/eHGWmdlSKWKykBjq3V3P/imMdsohjOWPsu3FAU7N961cqrCS6BAleJcJRZ7cZRqO1xwU6qJPWAk1eKkeK2KmEypOTyHDN/P+DrdGdY/zckiNfWcrY1QB9SoGB7IFYrdtE99hVyEjkzjAzm/yGBJlaP3J8IBYWqFZyPtHFt6E+Ch59FlmNbZ+3GPApsc7p/7XvSOS82tfG4hA2Bu9MDLbD+hvLd4FUqQUBf0W5NH3gX5MPaP17NoqnnFOR1XFqkNnFwFm0g
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Message-ID: <45e1dff3-aff1-4a41-ab24-6eddf6171e3a@bell.net>
Date: Fri, 3 Oct 2025 16:28:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/9] parisc: Convert DMA map_page to map_phys interface
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Leon Romanovsky <leonro@nvidia.com>, Andreas Larsson <andreas@gaisler.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Geoff Levand <geoff@infradead.org>,
 Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
 iommu@lists.linux.dev,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux.dev,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 Magnus Lindholm <linmag7@gmail.com>
References: <cover.1759071169.git.leon@kernel.org>
 <333ec4dabec16d3d913a93780bc6e7ddb5240fcf.1759071169.git.leon@kernel.org>
 <20251003150144.GC3360665@nvidia.com>
 <610b10bc-1aa2-4fad-a40b-be5fcfa04430@bell.net>
 <20251003172618.GJ3360665@nvidia.com>
From: John David Anglin <dave.anglin@bell.net>
Content-Language: en-US
Autocrypt: addr=dave.anglin@bell.net; keydata=
 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
 T70V9SSrl2hiw38vRzsl
In-Reply-To: <20251003172618.GJ3360665@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-10-03 1:26 p.m., Jason Gunthorpe wrote:
> On Fri, Oct 03, 2025 at 01:18:32PM -0400, John David Anglin wrote:
>> On 2025-10-03 11:01 a.m., Jason Gunthorpe wrote:
>>> This doesn't actually use the virt at all:
>>>
>>> 	offset = ((unsigned long) addr) & ~IOVP_MASK;
>>> 	if((size % L1_CACHE_BYTES) || ((unsigned long)addr % L1_CACHE_BYTES))
>>> 		ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, (unsigned long)addr, hint);
>>>
>>> And ccio_io_pdir_entry():
>>> 	pa = lpa(vba);
>>>
>>> Is a special instruction that uses virt but AI tells me that special
>>> LPA instruction is returning phys. Not sure if that is a different
>>> value than virt_to_phys()..
>>
>> ccio_io_pdir_entry currently only supports KERNEL_SPACE.  For KERNEL_SPACE, lpa() and
>> virt_to_phys() are equivalent if page is mapped.  lpa() returns 0 if a non-access data
>> TLB fault occurs (i.e., page isn't mapped).  Not sure if that
>> matters.
> 
> After unfolding everything the expression is
> 
>   lpa(phys_to_virt(pa))
> 
> So if that is always equal to pa then lets just drop it.

If lpa() was replaced by virt_to_phys(), the result would always be equal to pa.  So, I think it
can be dropped.

Dave
-- 
John David Anglin  dave.anglin@bell.net

