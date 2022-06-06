Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E200953F2C6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 01:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342733.567805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyMVT-0000Ru-Av; Mon, 06 Jun 2022 23:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342733.567805; Mon, 06 Jun 2022 23:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyMVT-0000PH-7Q; Mon, 06 Jun 2022 23:51:35 +0000
Received: by outflank-mailman (input) for mailman id 342733;
 Mon, 06 Jun 2022 23:51:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HB7Z=WN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nyMVR-0000PB-K5
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 23:51:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96a81075-e5f3-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 01:51:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 417DD60DB5;
 Mon,  6 Jun 2022 23:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF1FC385A9;
 Mon,  6 Jun 2022 23:51:29 +0000 (UTC)
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
X-Inumbo-ID: 96a81075-e5f3-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654559489;
	bh=9RgMCcCNdditTAFm/8CFCB2qfs95j5mT6jhToGpSwEU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pP+r4euzwEJYLNybS7H69mN/G96q6AEOmPWS29vC7GyUquu/XI0fqDJ2Ox25aCZAs
	 E2UsgQ3ZGshuXI5k66HHIWsHqWnOjesket0ygtYLdRcHp4tUd1GWH0PlmwQFyTrBmk
	 1wjlstt0Cq6cg5jHfdUE15DMGd/nBlK0jl8jv2agoiQDtJWNnx9410hyeN1cjX4kBr
	 gFcS3lLcmQuep378iV4Y49Zr49I2349tI19/csjHEMXHaCs0wJfgpE66vVk2acNq3X
	 f+LWFA7wdNM9Beqv2ENiXG5xz93jULPWDa1P4kNlv7TlOFGWR7Y/zPJc6BIXODqe1w
	 0bDALzlhhPVCg==
Date: Mon, 6 Jun 2022 16:51:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/4] arm: add ISAR2, MMFR0 and MMFR1 fields in
 cpufeature
In-Reply-To: <FE1F683F-FD96-4D55-8863-B9DB373CE790@arm.com>
Message-ID: <alpine.DEB.2.22.394.2206061650330.277622@ubuntu-linux-20-04-desktop>
References: <cover.1653993431.git.bertrand.marquis@arm.com> <4a0aef106ac7b6c16048ff3554eda1d8b3eab61a.1653993431.git.bertrand.marquis@arm.com> <alpine.DEB.2.22.394.2206021738430.2783803@ubuntu-linux-20-04-desktop>
 <FE1F683F-FD96-4D55-8863-B9DB373CE790@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Jun 2022, Bertrand Marquis wrote:
> Hi Stefano,
> 
> > On 3 Jun 2022, at 02:45, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Tue, 31 May 2022, Bertrand Marquis wrote:
> >> Complete AA64ISAR2 and AA64MMFR[0-1] with more fields.
> >> While there add a comment for MMFR bitfields as for other registers in
> >> the cpuinfo structure definition.
> >> 
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Changes in v2:
> >> - patch introduced to isolate changes in cpufeature.h
> >> - complete MMFR0 and ISAR2 to sync with sysregs.h status
> >> ---
> >> xen/arch/arm/include/asm/cpufeature.h | 28 ++++++++++++++++++++++-----
> >> 1 file changed, 23 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> >> index 9649a7afee..57eb6773d3 100644
> >> --- a/xen/arch/arm/include/asm/cpufeature.h
> >> +++ b/xen/arch/arm/include/asm/cpufeature.h
> >> @@ -234,6 +234,7 @@ struct cpuinfo_arm {
> >> union {
> >> register_t bits[3];
> >> struct {
> >> + /* MMFR0 */
> >> unsigned long pa_range:4;
> >> unsigned long asid_bits:4;
> >> unsigned long bigend:4;
> >> @@ -242,18 +243,31 @@ struct cpuinfo_arm {
> >> unsigned long tgranule_16K:4;
> >> unsigned long tgranule_64K:4;
> >> unsigned long tgranule_4K:4;
> >> - unsigned long __res0:32;
> >> -
> >> + unsigned long tgranule_16k_2:4;
> >> + unsigned long tgranule_64k_2:4;
> >> + unsigned long tgranule_4k:4;
> > 
> > Should be tgranule_4k_2:4
> 
> Right I will fix that.
> 
> > 
> > 
> >> + unsigned long exs:4;
> >> + unsigned long __res0:8;
> >> + unsigned long fgt:4;
> >> + unsigned long ecv:4;
> >> +
> >> + /* MMFR1 */
> >> unsigned long hafdbs:4;
> >> unsigned long vmid_bits:4;
> >> unsigned long vh:4;
> >> unsigned long hpds:4;
> >> unsigned long lo:4;
> >> unsigned long pan:4;
> >> - unsigned long __res1:8;
> >> - unsigned long __res2:28;
> >> + unsigned long specsei:4;
> >> + unsigned long xnx:4;
> >> + unsigned long twed:4;
> >> + unsigned long ets:4;
> >> + unsigned long __res1:4;
> > 
> > hcx?
> > 
> > 
> >> + unsigned long afp:4;
> >> + unsigned long __res2:12;
> > 
> > ntlbpa
> > tidcp1
> > cmow
> > 
> >> unsigned long ecbhb:4;
> > 
> > Strangely enough I am looking at DDI0487H and ecbhb is not there
> > (D13.2.65). Am I looking at the wrong location?
> 
> Right now I declared here only the values which have a corresponding
> declaration in sysregs.h
> If I add more fields here we will not be in sync with it anymore.
> 
> And on ecbhb it will be in the next revision of the manual yes.
> 
> 
> > 
> > 
> >> + /* MMFR2 */
> >> unsigned long __res3:64;
> >> };
> >> } mm64;
> >> @@ -297,7 +311,11 @@ struct cpuinfo_arm {
> >> unsigned long __res2:8;
> >> 
> >> /* ISAR2 */
> >> - unsigned long __res3:28;
> >> + unsigned long wfxt:4;
> >> + unsigned long rpres:4;
> >> + unsigned long gpa3:4;
> >> + unsigned long apa3:4;
> >> + unsigned long __res3:12;
> > 
> > mops
> > bc
> > pac_frac
> > 
> > 
> >> unsigned long clearbhb:4;
> > 
> > And again this is not described at D13.2.63. Probably the bhb stuff
> > didn't make it into the ARM ARM yet.
> 
> As said before, are you ok with only adding stuff declared in sysregs
> to make it simpler to sync with Linux ?

Yes, that makes sense. In that case just fix tgranule_4k_2 and you can
add my

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

