Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C04C81DA5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 18:16:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171515.1496532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNaAG-0003cL-6q; Mon, 24 Nov 2025 17:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171515.1496532; Mon, 24 Nov 2025 17:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNaAG-0003aj-3j; Mon, 24 Nov 2025 17:15:48 +0000
Received: by outflank-mailman (input) for mailman id 1171515;
 Mon, 24 Nov 2025 17:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FZvs=6A=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vNaAE-0003ad-QH
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 17:15:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35e8227a-c959-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 18:15:44 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 5E8314EE8C8B;
 Mon, 24 Nov 2025 18:15:43 +0100 (CET)
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
X-Inumbo-ID: 35e8227a-c959-11f0-9d18-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1764004543;
	b=FzDgmMdHHsJyKYNCM3TRuI6Cl6alLGP5sHkvMAr7Ln7Dg0Fx+QtWK0CmZzmZrDVsky9h
	 5z2ZYsY0DJ3fhyfK0X1DcI0rTDjxHJhPm/54Om1bVgigvdo+lm9Apw1w5uxIGXntmGahu
	 KUVecAC/vg2700v4fhn6FzEbOQwY/XcNNt5io+li7CGd07qu4C/tn1OgPx0/p1LoHFQ6z
	 7Ny4qUbazhbfk5YuF/c3wwACPPiRYkaRL00XYltsu4qjwKmmrUjyat+tsiCUpTtBZHvJv
	 2z4VWjJGm8L1g0AJMoNtnGwBVDvxt5VRlniBij/IGiqtiSaucRFE96VCM0V5bUqWaHNRi
	 OyaQRmpP0FCzLm2PclOMiRGEX/BDVL7zYsymva8dsnMz17IZ4dgJvncIQ1bBQgxTlU9JN
	 eLcqNdFa5IQUOXyWRyeBAHzZcBGfpIEBtTCAyw3CN0EIh+MuN42q7CnT+QhjIFICAjbBb
	 3omYOJ8vjp/e6p+IGWqd6qHQSL/wY616t7Cu+zii5P+h5kWKC/DWU0UfJpJE2nTD1vNus
	 pKdhCnGOQD6ubYImfxH4qwjCdNa33LZ/MRVj+Xzz3cT6XPwYh4sKJDwpal+C9SGGHKIO8
	 ozkUx3Fjg2jSpt6NSPBGMI9R1LJZEFG9ANdIT9XvCp0jXdEDQnpsAiBLX/n0OhQ=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1764004543;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=cA+qhwu1ZUv2/ZNtFBKumlIMpWo8wuI1OYhnj7fQvAs=;
	b=DMF6132eSVkpRYNtyiJPgcPkcWe4zKU5Up9CDUoc//e8fPAlh1umZVaXTGkYgHkAPgeJ
	 5yh+9bhAH3Vd6br5wRHl3/5KtPObFsZGiSCVDpQ3ok/0x7r/DR9PNLvilFABF/eRMkxZR
	 RkrmzRIp7vfMexJA4vzRkHyDfl3jdQ5ahmnpEmrHKda22epLwDvwfEYX7q36+u7hup3AT
	 13Nx/Qzecx4vUaqxdF8H9GRrBsn0DlcL4fzN+/vuI8dQJXx1EwyiZCQ6Y04XG/xWBwu2c
	 P/P5Zr0FA3o4rkZmWdm8fKsyoLgSV9yEAHeKzxO4PxBZtJ7Ic3sFLHnERp8qv7QTYIQK1
	 iJFzChHxxb5sB/Oata7jdY0R+NgtjWN+arsogQ0Py8kntGnEmbuYTyrm8WjndVKFkz0xB
	 34NgHuMqdxGf7C4QncQrzJjZWYkSsy8zL+XJ40SQsVf0baVWI0HSR0UqpNfpdBINMPZw0
	 1BQQYxf6ZP1py3JOr20aUEYZHkeu/VSuuJNahRrnzGSEgfOJOftK5caaP+4RHkQ3+dLcG
	 wtJ9SOChhBqrPZiLPEdOorT1RdKF/kIlJTlln2rbHTV4Yj2fdKWOgfsJJ/OIS/vGIX2j0
	 wZ8273Yjw7NVl0BcmHNpImDvq8qTHuTPn84flIh3X2Rg0cPrlDxYKb2YUYZdaLw=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1764004543; bh=H/9ZHD9Ggfvgzq4TlreYcPz0OnyJKMRvYGWeOW1Q7LY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dDE8VcaT2AZws6wgDoLH+23haKWlAqw5U/xLD1fxoWSSQwQTDqMv/qNGeynSnj3bJ
	 jDI6p9UuPDlt3qnxi7Ken37BndLIhq0hb4xth3l2grUI+3U6JtQlutSyHcVuBTgK+L
	 QbGrqeKUp0i4RDuRGAkszJsKcx2/4A9t2WvhJ0hz/c+wYjDevx3ikVizcUk9N3Zm6S
	 pm6Zz33uiPvULpJcPd4U14pRHw3D4B02qZkdq9sTIVhI66u2V1KsW85xufl16HxVVv
	 6ZsDlakor38pd0atVEWoQXQh3D3Jr/cqrjOi7PJvujA2Lp0+N0GEsf5uuXleXi0QA3
	 60bAwabXVOC9g==
MIME-Version: 1.0
Date: Mon, 24 Nov 2025 18:15:43 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Doug Goldstein
 <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v4] automation/eclair: add new analysis jobs with
 differing configurations
In-Reply-To: <alpine.DEB.2.22.394.2511031448530.495094@ubuntu-linux-20-04-desktop>
References: <6244858973ae88195405630b4a6847085ffce638.1762198392.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2511031448530.495094@ubuntu-linux-20-04-desktop>
Message-ID: <84bc6efff60733ae9fbcdfd253bc5542@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-11-03 23:52, Stefano Stabellini wrote:
> On Mon, 3 Nov 2025, Nicola Vetrini wrote:
>> The following analysis jobs are performed:
>> - eclair-{x86_64,ARM64}: analyze Xen using the default configuration 
>> for
>>   that architecture; runs on runners tagged `eclair-analysis'.
>> 
>> - eclair-{x86-64,ARM64}-safety: analyze Xen using the configuration 
>> for
>>   safety, which is more restricted; runs on runners tagged
>>   `eclair-analysis-safety`.
>> 
>> - eclair-{x86_64,ARM64}-testing: analyze Xen using the default
>>   configuration for the purposes of testing new runner updates; runs 
>> on
>>   runners tagged `eclair-analysis-testing`.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I'll commit it as soon as the tree reopens.
> 

Hi Stefano,

could you merge the change or do you want me to rebase? (there should be 
no conflicts however)

Thanks


-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

