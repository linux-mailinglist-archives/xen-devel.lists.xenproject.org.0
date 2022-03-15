Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C1A4DA119
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 18:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290906.493529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUAvf-0004P9-FZ; Tue, 15 Mar 2022 17:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290906.493529; Tue, 15 Mar 2022 17:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUAvf-0004N2-CY; Tue, 15 Mar 2022 17:25:51 +0000
Received: by outflank-mailman (input) for mailman id 290906;
 Tue, 15 Mar 2022 17:25:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9QY=T2=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nUAvd-0004Mw-Bj
 for xen-devel@lists.xen.org; Tue, 15 Mar 2022 17:25:49 +0000
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f20d6070-a484-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 18:25:47 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Tue, 15 Mar 2022 17:25:43 +0000
Received: by hermes--canary-production-bf1-ff8c5d676-2sm24 (VZM Hermes SMTP
 Server) with ESMTPA ID 970a7cb24095610cfceb0a4285b9bafe; 
 Tue, 15 Mar 2022 17:25:40 +0000 (UTC)
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
X-Inumbo-ID: f20d6070-a484-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1647365143; bh=/GH9rXBVOrh+r5btEEYMd5e5xYLXrOt+SuXPidbyhR0=; h=Date:Subject:References:To:From:In-Reply-To:From:Subject:Reply-To; b=jJ0N1+CzY/HJO3pYbdPULZPggtKpbfK1ySbeUiAuD2HP3OvRj3owmqAY/+KZ7Uxsl/UWq9MeYfTZ3WHbMpO8s+krIhAdkYxwY9VN9/Pl0JfyLiid6wyzN/HHqpDNjJJdZ7lsFX/1NO3X+zttPLsEJlAjcuGSXZj8zC2OrkKcictEDGenwfM35c0bizpvJ11XnvUE8fFvzIjZsW2elyZ9D/mNUdiIT7KHvKlJcoxlz9dOGIeFsMUoAtYSqwJfmRo1ZOVTsMsSipYW5cTdKX6SFA/7TXYBszl64HlCc1LiS4+hiwW0WfZ/jccPLNFbRW3RD9+zyT5dOicVAk9ID3EwOA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1647365143; bh=DOaR/+gdEwIBnB5hyCbXTwbivNbhnk4xoveuJ55eCfD=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=ncY/4rc0ChQ/GQtYLgXoIw24L/5UFHa+zTqVBNL2JpPvPGUhIdzH9yaTW5wc10MN2on6LuBve5UZXCPg+zm/P1YCFNmmVav2joPdDq0J1rCbsQKg+hntBvzpW3fPdxrtONme5P4M/Iax+ag37RGG5YHq/sz91KKHvX1msmYcPublH0Wu+hlkA7hB2uODOW+5WZwEAyJKyu4FW5kuPJSRdsmdANaoCusfYz/92wImqL/niP8HcVZm6gnImSUC348JjLaEPmlBrSYz0szPZtLyDlQkEh3ZeC6JcwgX5NJtVRCBYb2e3P2IElATdKDhpkDrnFFhl+i84zTeLRTO/8+kgw==
X-YMail-OSG: 4s14emQVM1k8A5dFioa37dHxZ7QqexA6.GK5x4scAI4_6HDEIErKq8N.MKirPWR
 hD9lX_wjRcKVPzAaAMxdIVSiP8UlynzG9b43gGCScQ_Fm4UyFSPRZuOuqyIxZixU_amem_MAVB4h
 TugVBG6gu.MEt6ivPiwH721ickPOe3Sfy.Bgfuv0fQX_6rgCxarYIS0O1YvFhQw_WVtLBl3NdSJT
 6qgMM6_BHrXO7y7YVJsqwsxKTaSYlM6KGx359dfoa4duqpEQAZpCUivCetudHkKOK1BY6AQUWqi1
 m6qQabAU9wYxTKy697X19Z4uhe0Onw5Kl1Hj4nd512R.2KIlHWuHIbR4qG32OVWv7bv3Z8St4hxF
 0MSVtqp.Z_CvC7mVNOJdPqN9zPBd.pc7SX2eeWQaXVv8GCrw23.0aniDPndOn1QwFW3i2u7Ctt82
 .Hx4B1fYEoH4Qs8AOJ8zbBAwhSu1gOb9xjU6MZGGLQTFkzOSJ35VN8qviROfFjq850dilp1KMxh4
 WqrpUbLfpM4h8_WRUYOfLnw1q1zEtZEMDx_dVZr.Kbs4aIxS4AG1f9cENoyqffw8NFO4REJbMKti
 9sq6h5CwblIH6X61DDpBQuWdUGlypxYMe35BYJ_MYSDXv.KEpDQq2tn0o2EhkW8NuipClUgm3DGz
 LkLhAsNcGtzmMHybTGup300Jm2oMGiYgO3wGZAUWk_abbjuTOSQ9rG7OKqn9pcaf2FBY3qBRUiYO
 8VYa8FWwQSjJCwo_y2An7Edc75F1epOypAzQIfV_etxHE8j4j08Xc.JU7FIhOfcHKei1dOZ2T6Nz
 Cl5YPDNgmb2bOf5SyC30NZBAr7lq5DTdVNHn4P1OJqeskRWpkYd2wByzZsVsrnI3Ta1qzsI9w2BW
 Szui9B1c7iSm.AUa5W2CjL0JU1xFw8hLPMUBf8wPvF33vJTFA_vpGmgJ0fV1.Jb7AFTkudjfxX5z
 Mi2o0OGbUmVgA2nYYyq2RE.uAFM6d7wFcmPYSKFNaNIqMEGZ7QOWJxbLAA0b6uDtdE2o1pEg2lRA
 _.yYLJWZQGta5gh3xCx8PUX_XyMOTma9bPrpOteWDYNgsvtzml6PrPeJAlOnCHc5mIOksahjENDK
 yuuk49BPeo6lQnatYkxC61MPXgKJq6WMouto4Hwj4jCgFnxI2Y9M.utmrrO0D7Pgs2w86aYRLr5p
 LzCaQEcBgbw4h3PC4u1b0VFKPPdM.XaY6VGHrovIQ70AppK4xRy4OLCb8.Dk7ccPdnFgwgtsZwAp
 wlBAxdCIZKfJzxOuhZtj.npX8VkKXkkjcqiDaHc6M5qeC_aBFz_j5H0JE7T388qjwoy5SeX5vFtv
 sxplLcG6IeufwstkUbK8FKFLQ06hdzEOHZLQy4LVH9EOrnhjy5C15XRGd2ACKrp_1Q1maytE.l.I
 1t3hDFCYRDRKEPz1iOImd0tWWxQY1hjfBHDpK2xWsla_T89dNKd9KqUnjoP3n9A0cBuIE7kLhfRX
 x3SHgzrhAZW0hM9Ibpy_n.S3bvBmCm239USSei_Q7BT8vjSHC.7Pkb9H9hOe75gRfPhDy5zRIscK
 LnEQmCVoxZ407rxB9X8m1VJt2oLPO3Re6MpPc2pLd8mjwh.ZVySz.QCHQTK5_ddOgOLoljNi7vwx
 DTFHPtrVY06QZvTbldpVstibnmT9.QJOpLqMddn54JOwgO7ck9XyXdP.y0_EW8wUU4qUTf4QoHiE
 iTeVydIqRNjhWfCvd_jxTlP78MS9XVpUBDMygGLGFer3V_7lY2sI6w7RUyTU8H0wgoL9ea_yaHGA
 VwU_y8iLhmJIfFiJdmuYExKFwGGII8Dx0jvFBVD3Cx_.8vC2UZKQv89G5KTjtzz5HjqyIr7UFNZO
 MQAXRKkfSJUq5YLs87SQcb2HcFK6JWSBts2qXU1wqWlrRW.iFAHgkZeNPvrm27bqbKYc_OsnHP5Z
 mbABgQs6HQEn1xG.lxspVc31ee8RYXMBkNduZ.SVa1tDKjMGpzW_NRodR5ZSJQRb.R1ul4Z0YSio
 njBDSWhqq8Wb5FWIEb3RGymWmtBsC8B9FVqPqN8afP9nImac74F8IMFbu_QgB4F203J7vOqlamf7
 3LUL1vfEF5Lf9B8ybXI6rn3OrAZ5SyQUsEEtKtPPy3td.rjGc0XDBvONKRds54aqAujCc7VxLCkN
 xegUPcHNyKa.dzS4k82n7u6t2WCvKhsFKpaaaVLEM9GG4AzfhP9YIaEXWVyTYGlyhA9Vce0I.d44
 Pxxkp
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <01dc645f-6c98-0d93-6882-6e2f4dd29e8b@netscape.net>
Date: Tue, 15 Mar 2022 13:25:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access to
 Intel IGD opregion
Content-Language: en-US
References: <b11b0b13-4f10-7d77-d02d-bb9a22bce887@netscape.net>
To: xen-devel@lists.xen.org
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <b11b0b13-4f10-7d77-d02d-bb9a22bce887@netscape.net>
X-Forwarded-Message-Id: <b11b0b13-4f10-7d77-d02d-bb9a22bce887@netscape.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.19878 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/15/2022 7:38 AM, Jan Beulich wrote:
> On 14.03.2022 04:41, Chuck Zmudzinski wrote:
>> Fixes: abfb006f1ff4 (tools/libxl: explicitly grant access to needed 
>> I/O-memory ranges)
>> Fixes: 0561e1f01e87 (xen/common: do not implicitly permit access to 
>> mapped I/O memory)
>> Backport: 4.12+
> Just fyi: This is fine to have as a tag, but it wouldn't be backported
> farther than to 4.15.

That's entirely reasonable. I understand this is a bug fix, not a
security issue.

> Apart from this largely some style issues (see below), but please
> realize that I'm not a libxl maintainer and hence I may not have good
> enough knowledge of, in particular, potential unwritten conventions.

I will take your comments into consideration regarding style before
writing the next version of the patch, and carefully check libxl's
coding style file.

>>
>> @@ -610,6 +612,45 @@ out: return ret; } +static uint32_t 
>> sysfs_dev_get_igd_opregion(libxl__gc *gc, + libxl_device_pci *pci) +{ 
>> + char *pci_device_config_path = + 
>> GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/config", + pci->domain, pci->bus, 
>> pci->dev, pci->func); + size_t read_items; + uint32_t igd_opregion; + 
>> uint32_t error = 0xffffffff;
> I think this constant wants to gain a #define, to be able to correlate
> the use sites. I'm also not sure of the value - in principle the
> register can hold this value, but of course then it won't be 3 pages.

What we are storing as the return value is the starting address,
not the size, of the opregion, and that is a 32-bit value. If we
cannot read it, we return 0xffffffff instead to indicate the error
that we were unable to read the starting address of the opregion
from the config attribute in sysfs. The 32-bit value we are looking for
is read at offset 0xfc from the start of the config attribute of the
Intel IGD in sysfs. The offset 0xfc is defined by PCI_INTEL_OPREGION
both here and in hvmloader (and also in Qemu). The data that is
read at this offset from the start of the config attribute of the Intel
IGD in sysfs is the 32-bit address of the start of the opregion.

> Maybe the error check further down should be to see whether adding 2
> to the value would overflow in 32 bits? (In that case a #define may
> not be needed anymore, as there wouldn't be multiple instances of the
> constant in the code.)

That would work also. Please not that I chose that value for an error
value consistent with the way the current function sysfs_dev_get_vendor
does it. While that function does not assign the variable 'error' to
its return value for an error, which in that case is 0xffff because
that function returns uint16_t instead of uint32_t,
I chose to explicitly assign the error variable to that value to help make
the code more readable. Your  comment that this could be a #define
instead is good. I also think we should use a #define for the error return
value of the sysfs_dev_get_vendor function Something like:

#define ERROR_16    0xffff
#define ERROR_32    0xffffffff

might be appropriate. But that would be touching code unrelated to
this bug fix. I think again the libxl maintainers should weigh in about
what to do here. They might let me take this opportunity to update
and improve the style of the patched file in other functions in the
file not related to this bug fix but I am not inclined to do that without
an explicit request from them to do so. So I am not sure yet what I will
do in the next version of the patch, but I will address your concerns here
and try to explain my reasoning for the changes in the changelog for
version 2 of the patch.

>> +
>> + FILE *f = fopen(pci_device_config_path, "r");
>> + if (!f) {
> While libxl has some special style rules, I think it still wants a
> blank line between declaration(s) and statement(s), just like we
> expect elsewhere. Effectively you want to simply move the blank line
> you have one line down. I can double check in libxlt's coding style file.

I think I followed the same style here as the existing sysfs_dev_get_xxx
functions. I will double check that and use the same style the other
functions use unless they clearly violate the rules, and note that I
deviated from the style of the existing functions to conform to current
coding style and suggest a subsequent patch to update the style of
the other functions.

>> @@ -2531,6 +2572,37 @@ int 
>> libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
>> domid, vga_iomem_start, (vga_iomem_start + 0x20 - 1));
>> return ret;
>> }
>> +
>> + /* If this is an Intel IGD, allow access to the IGD opregion */
>> + if (!libxl__is_igd_vga_passthru(gc, d_config)) return 0;
> Despite the provision for "return" or alike to go on the same line
> as an error code check, I don't think this is okay here. It would be
> if, as iirc generally expected in libxl, you latched the function
> return value into a local variable named "rc" (I think).

I will double check how the function being patched handles the return
value. I don't even remember if it has a local variable named rc for a 
return
value. IIRC it was either ret or 0. I understand that libxl expects rc to be
used these days, though. This might be another candidate for updating the
file to libxl's current standards.

>> + uint32_t igd_opregion = sysfs_dev_get_igd_opregion(gc, pci);
>> + uint32_t error = 0xffffffff;
> Please don't mix declarations and statements.

I presume you are saying these two lines should be re-written as:

uint32_t igd_opregion;
unti32_t error;

igd_opregion = sysfs_dev_get_igd_opregion(gc, pci);
error = 0xffff;

Please reply if my understanding here is not correct.

> I also don't think
> "error" is really necessary as a local variable, but with the change
> suggested above it might disappear anyway.

I do plan for the next version of the patch to use a #define for this 
instead
of the error variable (or add 2 to overflow it), so it will disappear in the
next version.
>> + if (igd_opregion == error) break;
> Like above I'm not sure this is okay to all live on one line. I also
> think it would be nice if you used "return 0" or "break" consistently.
> Of course a related question is whether failure here should actually
> be reported to the caller.

Good points here. I agree about consistency with break and return 0.
I will change this to return 0 and move it to the next line. I do not
want to change the current meaning of the return value
without knowledge of how the caller uses the return value.
IIRC, currently the function always returns 0 unless it encounters a 
negative
return value from xc_domain_iomem_permission, in which case it returns
that negative value to indicate an error to the caller. So if we return 
anything
other than 0 here, we might be returning an error code that the caller does
not expect or interpret correctly. I will also consider putting an error 
message
here before returning 0. A message something like "dom%d: Intel IGD
detected, but could not find IGD opregion" would explain the error that
happens here. I don't think a non-zero error code to the caller is
appropriate here, though, because, as already mentioned, IIRC this might
return a value the caller does not interpret correctly. If it is 
necessary to
return an error to the caller here instead of 0, it will be necessary to 
ensure
all callers of this function will interpret it correctly. I would 
suggest an error
return value greater than 0 to distinguish it from the return value < 0 
which
indicates an error from xc_domain_iomem_permission, but I hope libxl
maintainers will accept a return value of 0 here, at least for this 
patch. A later
patch could re-work the return value of this function which would also 
probably
require touching the caller(s) of this function to properly respond to this
particular error which is different from an error from 
xc_domain_iomem_permission.
In any case, I will double-check to see if my current understanding of the
meaning of the return value is correct before writing the next version 
of the
patch. For now, I will  use return 0 instead of break here and move it 
to the next
line, unless I hear otherwise from the libxl maintainers.

>> + vga_iomem_start = ( (uint64_t) igd_opregion ) >> XC_PAGE_SHIFT;
> There's no need for a cast here, as you're right-shifting. Also
> (just fyi) there would have been three to many spaces here. I'm
> additionally not certain whether re-using a variable for a purpose
> not matching its name is deemed acceptable by libxl maintainers.

I wrote it that way expecting a compiler error if I didn't do the cast.
I have not checked if the cast is necessary, though, and maybe you
are right. I will check and see if it is necessary by removing the cast
and see if the compiler complains.

If the cast is not needed, I will just use the 32-bit igd_opregion variable
when calling xc_domain_iomem_permission instead of the 64-bit
vga_iomem_start variable. I will remove the three spaces and use a
more descriptive variable instead of re-using vga_iomem_start if the
compiler insists on the cast from 32-bit to 64-bit.

>> + ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
>> + vga_iomem_start,
>> + IGD_OPREGION_PAGES, 1);
>> + if (ret < 0) {
>> + LOGED(ERROR, domid,
>> + "failed to give stubdom%d access to iomem range "
>> + "%"PRIx64"-%"PRIx64" for IGD passthru",
>> + stubdom_domid, vga_iomem_start, (vga_iomem_start +
>> + IGD_OPREGION_PAGES - 1));
>> + return ret;
>> + }
> I have to admit that I find it odd that this is done unconditionally,
> but I notice the same is done in pre-existing code. I would have
> expected this to happen only when there actually is a device model
> stub domain.

I don't understand how that works either. All my tests have been with
the device model running as a process in dom0. I am thinking maybe
in that case it just uses dom0 for the stub domain, but I have not checked
that. I will check it by dumping the value of stubdom_domid to a log in my
next test.

Thank you for responding promptly. Now I have some work to do writing
the next version of the patch and documenting it clearly in its changelog.
It will take me a while - I will spend enough time on it so hopefully the
libxl maintainers don't have to spend so much time on it.

Chuck

