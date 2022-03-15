Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644ED4DA26C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 19:32:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290922.493574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUBx5-0004hB-6b; Tue, 15 Mar 2022 18:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290922.493574; Tue, 15 Mar 2022 18:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUBx5-0004fO-2y; Tue, 15 Mar 2022 18:31:23 +0000
Received: by outflank-mailman (input) for mailman id 290922;
 Tue, 15 Mar 2022 18:31:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9QY=T2=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nUBx2-0004fI-MS
 for xen-devel@lists.xen.org; Tue, 15 Mar 2022 18:31:21 +0000
Received: from sonic307-55.consmr.mail.gq1.yahoo.com
 (sonic307-55.consmr.mail.gq1.yahoo.com [98.137.64.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18ac10a6-a48e-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 19:31:16 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Tue, 15 Mar 2022 18:31:14 +0000
Received: by hermes--canary-production-bf1-ff8c5d676-gcp4r (VZM Hermes SMTP
 Server) with ESMTPA ID 3cf9313018d59551d96e7b7a84034beb; 
 Tue, 15 Mar 2022 18:31:10 +0000 (UTC)
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
X-Inumbo-ID: 18ac10a6-a48e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1647369074; bh=oho/+qOw29G0gsInJoiLP2QFv/JNVB5CxhH6u6tiO7w=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=Fni9KFhk20yUZISR7PzfRx+ASa2BNC18HfVYZenPE70ZsBEdAFB7LrB/fGnJAM87sUeqGSYQ71mUHfU6z0SRlhoBp+q7Xjfky1BFQHTGW40G8uwQBHJ8o6wIBhI8G/JkFP7h/VBS5hzmh91orFqdpYa35SHkn6faxdjGKxvSwqOo/haujf2t6BCwOLl05MTkmsLfLLwO4g202RQYdoJZcrrQFIvLc35SUGw9ypii+wheWy38xV5y/GtJgra6ABbtXnw2ov+gCja42rvipv7R52agbUw3QNU7mRPBhnKHPEePd35QJE3i7M2c3QvD2qdAOdLJOFIDVqliUazsSa69MQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1647369074; bh=LPWiX+Y8PAZmnS7CGV5HGCjecUzjVtplsNypTVo8aBC=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=QUM+WqJIcmjDkD34wekLh61FilTisKnlulJ7AuSjXH58hHtsjlQHDLMLe6ZzyFUQC19OyDD4z58s3h+ib8EVK34uhDECVlja65AKQgfGsjqA9Hkk/1amQm6w6PK0u9/gO46WCsL47bDGiZDgRBOxRrv68A5Py73VGEZ/XdnkVup17wUOL9jEb38ux1rOeC7MlADcPefxWB8tKSw+xT4nlnJTEuQG2BNyb5+/umaPezgUOixgfN0kA/rvZV2mLABjtcDdhyMZUge6gKyONOUVrK/tlaGO5byT/EkpbAiFwuTz3HkdYPS8OJGJy7G+mFZ8ocEXmDOTAGxrKSJv7EM99g==
X-YMail-OSG: jgCi8yQVM1kDD_9BUHUyZ9NspAzfBsjPZWx5a_OXRuxl.OKX4cPu7ExfzpNqQ..
 iAZmVDGDABMzWmNqWVcqLa4qCXV_.eivvGCqBKr_6iZuIkkuW5pmVg7Czbg_h_g1.lp.gUHDiKO.
 zYPzNuQ._u4OMnSedmCQPi04weHA79X7zqNPbYxuej.qRkaaL8Dj9LvbxtRh9JhDORHqd_AGtiRH
 yyruPzKEDxkYFGd7cV0anGSKZ6GRJSHew_e6VpoS2UQQapBM_gkEB0.N_MRPDtUbjvc2Q4rJimwp
 kPbadwLg.EwqaJxCKcgbABmmPWN4z.3HcIRbrLZdfzby4nTqO2tngY_N5FH0AsDHs8v9ReSf023i
 rjZ_2dQ2aYNpivcwzsOlZ.ZQsDaFcS8_w92r.ar98kQ0W8KS7j3gVF2ZYnzZTuWkOJcjyBcndaf.
 0kZ0700Yi8kOuhb72vx4L4J5POHw_j2dPoG5cP_OVO3PIYjsb8SlnYiNOKMBybYLxyMiGnem375Y
 .Vp9rDKKshDA2uMJOUnf_hpbazm5tbMCWvR41MZXkX_Syv.nx0RQK1cM8EmQZMPitNquOWmbeBDC
 ilc2I6.SQFjgdY34vq_SLFeM1E7u7svCNcDyPFl8iG_lEx9MWxyNjEQ2eUW.Wvh2OB7kiJICx77.
 Iush6Ohulops.n2c7aoGF7NKRNX1H7UM2ZRNDX7nC9y6K4f2Vpv0WQZZsPZcJrEIW5Qnt59HxuPo
 Do3wzdBksXfxDelsbJDpJaCVKzTnNiDNCjY49yo3jHOHiNTjPo1tBjQx9S3_2CHnHSS9iMnQnU.7
 ClspwLGSFRwPoRxXSkZaoNtjuei75XoEH_g2tghvgfzfFdkevsaYebYcVJm.R6gY98.H34.q2.YJ
 behgfR.z3xeQb2kVtzuyQrxVxWdm3mlLdq1GYAYiCmHKzXA0vG3zchtLgGdKAezEfQp2JPNSqt5d
 amedKnyM0vkFWaB01E5RBVnK7DdkBYUVatVZMTwYJ21zSBu8JcMAj16Cgt7ttirB98qfDdziKaQW
 fhcNeoZA.4bxY6Jjo7QYJY4xd4tH9BBndXcRw0Dh3dSHKY1jme3Rqj9m1b48rC_js233Ru6yhqdd
 jXkb_OiouhRIMdIBifxGV9lVNCcIBagy484ng1tT1M4AYk5hS14_n503HeHXs_AXspmZOkcyf6X1
 2RC1DyuYd4_.qkcIVWFcBXPJneFat2WyIMniM1Gf0IQ6HZoddEXbgbGP_rp_NU0_Fv0w2Ifk4AQf
 cSQ2GzttfgRTH0c8cC34ANxCUqT9hfNajQd_EsAvPhZyzpM6WlVBBitA2FbjcU5nWI61_nOe6bj4
 cHvZZuYAYNtudrRGmXfOHPCy6uEcQ8TbZ4aWifvRjWuqyJiQdo93GD2BdP5mX9EzLzla5MguXuF0
 __3jEsyAY3hHr_iU45nUb9PCc0MxfPoL4eYyHwLkqpcbufTA9Bs9b2ieqeU8.83fYhcr.P2OLfBf
 XYCHFZpxA2BjRWCk5XQULt4e9zqMcgX8.1hDEwk6oiiD4fOPaYs1Erg78_4uvbZ0OH4pM3VtaXJs
 g9mkQONGwnj2K4_a3v0nYhfHpjz3THdgkK991smWgIJ8w9Gd_1aHhANsViU5vm4j216yuFvoEiPx
 pZO0y2MwTM3RoZfUtwJ5TW8mbbtkZ.i4EPhSvzZY7oIpC1BFMAFIERvhgvNRGU0CmnK3U8JuAw1c
 Xba..cKihGDQGnKJjOqcN._XKvXkxAraUvx9pmUxm_95VSKMl7VgaK7h3wThn000c7MkqUZDvBRE
 N3FoNWcJMmtj32jh4Z5AFPB1izbaKoZVwQah7d2yccN58gi06ukBP.VAKpJmJhN5EQGLUZWRN5Y0
 LEeNVkjN2I46oO_q0YiTmOYDsZy.AXnmPp2jcp17BC4.LB4n.9fIKUGD8vq7LhZqLyFa1iHK_60h
 RnTEGJkNep2FCHD9C1dz9FrwqPYv20CGIE6SHZCaBsz3MTz4cAZyLHlIuz6pRzsy7gTVNKmQ3lEW
 Pr7yFLdwF67ae58EZUbFc3ziSHxQQ3gbY1op2D_qt04tWad0n8mPO85_CrmUnKuoAtXHqIII8LkD
 sbCdfpnjxOHUWo4iY3eQ5U3XfgQLva5L.1LEzpDdCY62LuBljaXYOwOB3hm8P9H3MNGPs1dbw.eZ
 xBohaz6l5CkoM5Dfk2YIR18h_2PoK_yCDKuFwzKXxdG9pT74gpi.Vb8BUkKilJDc7QlouYT847Co
 9n8rsxeuEuJl5og--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <99a88a66-c1e8-61a2-f4d3-3fb7202424b2@netscape.net>
Date: Tue, 15 Mar 2022 14:31:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: xen-devel@lists.xen.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <23f5afb4-c712-f872-acee-7f18b98b73e6@suse.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <23f5afb4-c712-f872-acee-7f18b98b73e6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.19878 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/15/22 7:38 AM, Jan Beulich wrote:
> On 14.03.2022 04:41, Chuck Zmudzinski wrote:
>> Fixes: abfb006f1ff4 (tools/libxl: explicitly grant access to needed I/O-memory ranges)
>> Fixes: 0561e1f01e87 (xen/common: do not implicitly permit access to mapped I/O memory)
>> Backport: 4.12+
> Just fyi: This is fine to have as a tag, but it wouldn't be backported
> farther than to 4.15.

That's entirely reasonable. I understand this is a bug fix, not a
security issue.
>
> Apart from this largely some style issues (see below), but please
> realize that I'm not a libxl maintainer and hence I may not have good
> enough knowledge of, in particular, potential unwritten conventions.

I will take your comments into consideration regarding style before
writing the next version of the patch, and carefully check libxl's
coding style file.
>
>> @@ -610,6 +612,45 @@ out:
>>       return ret;
>>   }
>>   
>> +static uint32_t sysfs_dev_get_igd_opregion(libxl__gc *gc,
>> +                                           libxl_device_pci *pci)
>> +{
>> +    char *pci_device_config_path =
>> +            GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/config",
>> +                      pci->domain, pci->bus, pci->dev, pci->func);
>> +    size_t read_items;
>> +    uint32_t igd_opregion;
>> +    uint32_t error = 0xffffffff;
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
>
>> +
>> +    FILE *f = fopen(pci_device_config_path, "r");
>> +    if (!f) {
> While libxl has some special style rules, I think it still wants a
> blank line between declaration(s) and statement(s), just like we
> expect elsewhere. Effectively you want to simply move the blank line
> you have one line down.

I think I followed the same style here as the existing sysfs_dev_get_xxx
functions. I will double check that and use the same style the other
functions use unless they clearly violate the rules, and note that I
deviated from the style of the existing functions to conform to current
coding style and suggest a subsequent patch to update the style of
the other functions.
>
>> @@ -2531,6 +2572,37 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
>>                     domid, vga_iomem_start, (vga_iomem_start + 0x20 - 1));
>>               return ret;
>>           }
>> +
>> +        /* If this is an Intel IGD, allow access to the IGD opregion */
>> +        if (!libxl__is_igd_vga_passthru(gc, d_config)) return 0;
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
>
>> +        uint32_t igd_opregion = sysfs_dev_get_igd_opregion(gc, pci);
>> +        uint32_t error = 0xffffffff;
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

I do plan for the next version of the patch to use a #define for
this instead of the error variable (or add 2 to overflow it), so it
will disappear in the next version.
>
>> +        if (igd_opregion == error) break;
> Like above I'm not sure this is okay to all live on one line. I also
> think it would be nice if you used "return 0" or "break" consistently.
> Of course a related question is whether failure here should actually
> be reported to the caller.

Good points here. I agree about consistency with break and return 0.
I will change this to return 0 and move it to the next line. I do not
want to change the current meaning of the return value
without knowledge of how the caller uses the return value.
IIRC, currently the function always returns 0 unless it encounters a
negative return value from xc_domain_iomem_permission, in which
case it returns that negative value to indicate an error to the caller.
So if we return anything other than 0 here, we might be returning
an error code that the caller does not expect or interpret correctly.
I will also consider putting an error message here before returning 0.
A message something like "dom%d: Intel IGD detected, but could
not find IGD opregion" would explain the error that happens here.
I don't think a non-zero error code to the caller is appropriate here,
though, because, as already mentioned, IIRC this might return a
value the caller does not interpret correctly. If it is necessary to
return an error to the caller here instead of 0, it will be necessary to
ensure all callers of this function will interpret it correctly. I would
suggest an error return value greater than 0 to distinguish it from
the return value < 0 which indicates an error from
xc_domain_iomem_permission, but I hope libxl maintainers will
accept a return value of 0 here, at least for this patch. A later patch
could re-work the return value of this function which would also
probably require touching the caller(s) of this function to properly
respond to this particular error which is different from an error from
xc_domain_iomem_permission. In any case, I will double-check to
see if my current understanding of the meaning of the return value
is correct before writing the next version of the patch. For now, I
will use return 0 instead of break here and move it to the next
line, unless I hear otherwise from the libxl maintainers.
>
>> +        vga_iomem_start = ( (uint64_t) igd_opregion ) >> XC_PAGE_SHIFT;
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
>
>> +        ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
>> +                                         vga_iomem_start,
>> +                                         IGD_OPREGION_PAGES, 1);
>> +        if (ret < 0) {
>> +            LOGED(ERROR, domid,
>> +                  "failed to give stubdom%d access to iomem range "
>> +                  "%"PRIx64"-%"PRIx64" for IGD passthru",
>> +                  stubdom_domid, vga_iomem_start, (vga_iomem_start +
>> +                                                IGD_OPREGION_PAGES - 1));
>> +            return ret;
>> +        }
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

N.B. I forgot to send this reply to xen-devel and cc the libxl
maintainers, so I am doing so here. I also re-formatted my replies
to avoid lines with too many characters. Sorry for the
confusion.

