Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9664EE07F
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 20:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297050.505872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZzau-0007eC-5F; Thu, 31 Mar 2022 18:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297050.505872; Thu, 31 Mar 2022 18:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZzau-0007cP-19; Thu, 31 Mar 2022 18:32:28 +0000
Received: by outflank-mailman (input) for mailman id 297050;
 Thu, 31 Mar 2022 18:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BbJ=UK=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nZzas-0007cE-3Z
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 18:32:26 +0000
Received: from sonic313-20.consmr.mail.gq1.yahoo.com
 (sonic313-20.consmr.mail.gq1.yahoo.com [98.137.65.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6b3576e-b120-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 20:32:22 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Thu, 31 Mar 2022 18:32:20 +0000
Received: by kubenode532.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 9b5afb7763e4aaf9096236a465979bfd; 
 Thu, 31 Mar 2022 18:32:13 +0000 (UTC)
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
X-Inumbo-ID: e6b3576e-b120-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1648751540; bh=0H9zgbxQBofOpYevtrbxkA2xkjIpendTdhuZjpBEIRc=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=h7PAFhxXhn4FSFhTjNJCErju+oglIj5mDgjxgCYTRk7d574OC56JY1EhWGuACMg1zlqaWpvOsGTAf9pJDkJARcMOq7knACeaYwA+LLAE9aX86NddvHGZxc0ooY04FSR5ChAHsT43iNWuobkorzogpFXB+0Ialt4BTW4hfo/T/y5cd/j8HtdHa3jiPlKqZtQKPZ+RZhgskP2B/DwgAdArGVzQJhrOEIwr/9WZc8PpbmeJSoFA93VPXwJ+fwsJmx5Z7xQ6lYYeVyq0C2Ppv1HfFVXQzRo0yFdqgCcvG80sBHovqXmPy9PXCNXVw8S6Auxhl8p2FuTYAK4Hys9CmKHfuQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1648751540; bh=JrWjWS3Dy0ZJCoXh0qUql2NLNIi5cp6s0YHdBDzISvx=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=TfWruq2HVdJGEZ1peEzLLrQL2cnTMyX92pio5k4Kgy2WZyzcFHYg2u+RwPdtY3KMGZbaKx5WmHursXPlbwaeT0HzyrAtD3lNKo69qKhvNREBxtmQS8IAvvR8iqDTdYvAA8TauLeTY3/dT3okHALXuhIZG3tTPhWig5ygw+LPQ6c4/qlhrnKXxauVi2QyTB5YWX1VOwhzHv215aZSRIOWSft1OCxOkD55cSDKTgKTW6KQ+iX4qQvQpvEH/3WCAWM0zE4dj3iUcJ4cTFtzJO6Qkgbf0+ZmijpkmcPJ7C9CcYnU/us1WVpHHibduTGAYOr5Q947A8GmS/KRgwMWVML5cw==
X-YMail-OSG: MziJqJcVM1mhj8RrsikUBh4KT88M5waF9XCXH4Lmvg7m7zN_UknYmdkL4.rP_Sh
 MKjWAT5fFHBPpQjMUqOczqSqhTG9YxmP3g07z0UibNqZwVFeZ26NjoawXaUKqyLVZkZtBaLSms12
 HZ6ZuMyTvGglocSZQzPRjoZBbR3Rz6iL__J08zocQxyYBHt.hvm8UK41OGhPl0XeoSSLUkLtSuL0
 zyTNLQlp6nw30m8kZ4_Z_tz8vxONcGj02vtDzAjpi_oCjWAon5pHI8S0jzIDBUofDaNOYtvhsmbb
 MLTbZVBL_YQhF9jc5iqqk04g1f3IX1XNsCDS9CGV9AMPti3fXziWwN66brtSqJjkHgqNWZ6Eynl1
 cwB7Y._7vlOq3.rUOD4k2eY.APYzoQCgV1Jw3VerAl9_BbftigwaKCA9y_5dlZiY2m1cs_fADAnI
 1h.2uJsrp9JM5yzJDHYzBa3HhychYRUa04_kS_xshRE...r_D6g51k90ILopgLIBgAeqZs4ElTrh
 i541vVJGwoWTsolbx0bjw44FkVwe11LnAKNIe30SGMEb02lsBQDbIxgAAbVCRG6qhFggmzLbONkf
 upx1SsWGZfe7yr_buQW9XB8MDKFlBPpuDB4I8qErcSRMPwCGOaZPL96rC380qBqH.cV4ArxzWyRS
 xGDz_tec_IGf4qgj5Oq7WxjPhLvE98gBhGXbwpVSjdVmGj.p67wvTjgvZFF.ORnkn0usMKGX4vt8
 JVub1Yq2PZd7PEkTMeOYCagzus4eUQUHeFTNZWh_k78FLUtHKgNl1dhhXFavWTgHKNluPFj70ZIT
 xmnswMr8ksV8di1enBgmCgWd0aAXnq461kyxL_QuRMe7c0udQ7mdP7JFGFNRCKpNvwsDST0nvfS5
 jdR4Vj6HTZS9oAbjb44ucwVfsYP8tkMoYB7ab4W.ojrqmWClP5KJQGklB1IOxAZIIZFMfQ8I8B.9
 EBDhyrRb1f.OmEzpIRtJL8DdkusjdXOGUS4GzMun686V4PEY7gSTju973qZ9nOU7OAgvgnj2px00
 85GTh1UoJJl6LytRaXIijb8NPcpcdnL0ycbKVH77XnzjxxSoi2z3W3qaKzbocrPMgm7znTGpRbkT
 quJGUdIETyHUa646.hNc7f3Pu_GNt1ZtmJ.2FE3W13Dy1rx3rR_rg4Y4q_zkULkOUuhpJbiJuWfk
 5nPJE9gH6SPQSxtg.bk_WlUJG32u0pKRadR7QV5c4FJ8AkyZ8vXM830Wltx8u_WqBK7ughhye3Oh
 oLGlrDkpBdQw_c4JFqidgOCerl8cIzWHvD7fKwkUtTsL0HdzpRNiEAOqfOSHK6B4yKoOMsNwEP1Z
 AwMBCsS.AE9YyNr0ui3_jhnG_sjyrISfkC7AVfxoqiuYXLWbFPEG2lZCbAKNyk8.X8EtWe80CmtY
 N.OyUryg1ZHAo3u0iT0raeoTcqr6jOiAg28L1fHziV7O6bbhUbBWIfTtstDuW5EuRPshHo3qutWB
 eORF82o1fvVbqArI.PqMdGLyg0hopXDhAf1DCZ59voFk_Axrq1sHtpatWDI1cVZEyofMc9axhOMv
 pmL5_lJ_EjsU9aSnM27IdReJtYa2WNo_nAmS.cti6hh7R9WDP7CQIdyUqmdO1sBL.s2MVH0dZlnT
 nX9jW1qB08puJ3buAMjnDSqazDqb5YaEYeECbdxJMaPEfB_KfUpcnVETFr_KYh42KbM5yBgnqLXP
 ohX_yjuqILqLw_IcSi.HjKRLUsXbohp3A0j5u9Y2KQ_l_AdPDGzbt6BuTQaHtZmNla4770MH7iSl
 MBVQjOoo_bBB_Yqjq.uz_aJbCeISz79YgGrVHutxd.grrFPWf94MgvyaLG3ND0JWLlqLJJgYQjT7
 5xwwa1QzFmb4d_m8TpjtHqUnfnoh2EuzuFBp0r1XS9UrJ2AQkOCGA47KfOk0Mydgefc_cmmQOHXx
 OmTkzYhAj.Pd8goELxDJTswlRmEAlLYhqNfxEXa0rzmO0nT.PBNDHPnHsS9X5E.oJjuFURT09TzM
 sHdgLaogP2guMaQVW_YgdXR4Zhd.YrXC7wnUrskE45rdByhdqpSZYNcLebEKgd21C8SYvZ0Ad3Xj
 PiVNSVJ1uwhYyLcj_TSt1koDPWP8TscoyBjL8qEFke6GDDVmrf_4kW8tiR5wM2rf9wAyGbI.bodB
 1pGV9Iqz9pU5.3uJAEvaFmWd5ZixPkwih56JDB1b8twvjWowqhkmiGhmPwRcA5KHoibyMIfmQYo9
 AVmtdW2nN4kLJNQ--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <4b40eb36-71b5-d3dc-8551-73a684bff2dc@netscape.net>
Date: Thu, 31 Mar 2022 14:32:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20001 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/30/22 1:15 PM, Anthony PERARD wrote:
> Hi Chuck,
>
> On Sun, Mar 13, 2022 at 11:41:37PM -0400, Chuck Zmudzinski wrote:
>> When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
>> opregion to the guest but libxl does not grant the guest permission to
> I'm not reading the same thing when looking at code in hvmloader. It
> seems that hvmloader allocate some memory for the IGD opregion rather
> than mapping it.
>
>
> tools/firmware/hvmloader/pci.c:184
>      if ( vendor_id == 0x8086 )
>      {
>          igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
>          /*
>           * Write the the OpRegion offset to give the opregion
>           * address to the device model. The device model will trap
>           * and map the OpRegion at the give address.
>           */
>          pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>                     igd_opregion_pgbase << PAGE_SHIFT);
>      }
>
> I think this write would go through QEMU, does it do something with it?
> (I kind of replying to this question at the end of the mail.)
>
> Is this code in hvmloader actually run in your case?

Hi Anthony,

To test your theory that hvmloader is not called in my case and
does nothing, I did the following tests:

I wrote a little C program to read the mapped IGD opregion
address in the guest from the config attribute of the
IGD in sysfs:

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdint.h>

int main()
{
     int fd = open("/sys/devices/pci0000:00/0000:00:02.0/config",
                    O_RDONLY);
     uint32_t buf;
     off_t offset = 0xfc;
     pread(fd, &buf, 4, offset);
     printf("opregion = %lx\n", buf);
     return close(fd);
}
------------------------ end of C program -----------------

Since the config attribute cannot be read by an ordinary user, it is
necessary to run the little C program as the super user to successfully
read the opregion address from sysfs with the little C program.

I also grabbed the BIOS-provided physical RAM map in the
guest which shows the 3 pages mapped by hvmloader for the
opregion (it is the second to last entry in the table):

Mar 31 13:20:16 kolbe kernel: BIOS-provided physical RAM map:
Mar 31 13:20:16 kolbe kernel: BIOS-e820: [mem 
0x0000000000000000-0x000000000009dfff] usable
Mar 31 13:20:16 kolbe kernel: BIOS-e820: [mem 
0x000000000009e000-0x000000000009ffff] reserved
Mar 31 13:20:16 kolbe kernel: BIOS-e820: [mem 
0x00000000000e0000-0x00000000000fffff] reserved
Mar 31 13:20:16 kolbe kernel: BIOS-e820: [mem 
0x0000000000100000-0x00000000bfbfffff] usable
Mar 31 13:20:16 kolbe kernel: BIOS-e820: [mem 
0x00000000cc346000-0x00000000cc352fff] reserved
Mar 31 13:20:16 kolbe kernel: BIOS-e820: [mem 
0x00000000cf800000-0x00000000df9fffff] reserved
Mar 31 13:20:16 kolbe kernel: BIOS-e820: [mem 
0x00000000fc000000-0x00000000fc009fff] ACPI NVS
Mar 31 13:20:16 kolbe kernel: BIOS-e820: [mem 
0x00000000fc00a000-0x00000000fdffbfff] reserved
Mar 31 13:20:16 kolbe kernel: BIOS-e820: [mem 
0x00000000fdffc000-0x00000000fdffefff] ACPI NVS
Mar 31 13:20:16 kolbe kernel: BIOS-e820: [mem 
0x00000000fdfff000-0x00000000ffffffff] reserved

Now with the current code and no patches, the output of the little C
program to print the opregion address from sysfs in the guest is wrong,
the opregion address in the guest is not displayed (it should be
fdffc018 because the offset of the opregion from the page boundary is
0x18 (24) bytes on my hardware) but it displays an error value
(ffffffff) instead:

opregion = ffffffff

I would expect it to be correct if nothing overwrites the value
hvmloader wrote. In fact, I think the value hvmloader wrote might be the
page aligned address of fdffc000 instead of fdffc018. I am not sure
where this error value comes from, so I do need to do some
investigations because I think you are correct that the value that
hvmloader wrote was overwritten somewhere.

Now when I apply my patch to libxl, I get the same physical RAM map
in the guest:

Mar 31 13:12:35 kolbe kernel: BIOS-provided physical RAM map:
Mar 31 13:12:35 kolbe kernel: BIOS-e820: [mem 
0x0000000000000000-0x000000000009dfff] usable
Mar 31 13:12:35 kolbe kernel: BIOS-e820: [mem 
0x000000000009e000-0x000000000009ffff] reserved
Mar 31 13:12:35 kolbe kernel: BIOS-e820: [mem 
0x00000000000e0000-0x00000000000fffff] reserved
Mar 31 13:12:35 kolbe kernel: BIOS-e820: [mem 
0x0000000000100000-0x00000000bfbfffff] usable
Mar 31 13:12:35 kolbe kernel: BIOS-e820: [mem 
0x00000000cc346000-0x00000000cc352fff] reserved
Mar 31 13:12:35 kolbe kernel: BIOS-e820: [mem 
0x00000000cf800000-0x00000000df9fffff] reserved
Mar 31 13:12:35 kolbe kernel: BIOS-e820: [mem 
0x00000000fc000000-0x00000000fc009fff] ACPI NVS
Mar 31 13:12:35 kolbe kernel: BIOS-e820: [mem 
0x00000000fc00a000-0x00000000fdffbfff] reserved
Mar 31 13:12:35 kolbe kernel: BIOS-e820: [mem 
0x00000000fdffc000-0x00000000fdffefff] ACPI NVS
Mar 31 13:12:35 kolbe kernel: BIOS-e820: [mem 
0x00000000fdfff000-0x00000000ffffffff] reserved

And now I get the correct opregion address from the little C program to
read the opregion address from sysfs in the guest, not even the
page-aligned address that hvmloader appears to have written:

opregion = fdffc018

Next I removed the code snippet from hvmloader that allocates three
pages in the guest for the opregion and writes the opregion address to
the pci config attribute, and now there is no memory hole allocated for
the opregion in the guest:

Mar 31 12:47:34 kolbe kernel: BIOS-provided physical RAM map:
Mar 31 12:47:34 kolbe kernel: BIOS-e820: [mem 
0x0000000000000000-0x000000000009dfff] usable
Mar 31 12:47:34 kolbe kernel: BIOS-e820: [mem 
0x000000000009e000-0x000000000009ffff] reserved
Mar 31 12:47:34 kolbe kernel: BIOS-e820: [mem 
0x00000000000e0000-0x00000000000fffff] reserved
Mar 31 12:47:34 kolbe kernel: BIOS-e820: [mem 
0x0000000000100000-0x00000000bfbfffff] usable
Mar 31 12:47:34 kolbe kernel: BIOS-e820: [mem 
0x00000000cc346000-0x00000000cc352fff] reserved
Mar 31 12:47:34 kolbe kernel: BIOS-e820: [mem 
0x00000000cf800000-0x00000000df9fffff] reserved
Mar 31 12:47:34 kolbe kernel: BIOS-e820: [mem 
0x00000000fc000000-0x00000000fc009fff] ACPI NVS
Mar 31 12:47:34 kolbe kernel: BIOS-e820: [mem 
0x00000000fc00a000-0x00000000ffffffff] reserved

I ran this case without my patch to libxl for safety reasons because the
opregion address in sysfs in the guest is wrong and I get the same
error address return value using the little C program to read the
opregion address from sysfs:

opregion = ffffffff

So the conclusion is that hvmloader does allocate the three pages in the
guest for the opregion and writes a value for the opregion address, but
it appears it is overwritten later with the error value when the guest
cannot access the opregion and with the correct value when the guest can
access the opregion.

So I agree that I should understand what is going on here better. I
tentatively think the call to pci_writel in hvmloader can be safely
removed because that value seems to be changed later on somewhere.
But we do need to keep the call to allocate the memory hole for the
opregion in hvmloader, or maybe move that call to the toolstack.

So I will need to have a better answer to your questions before I
propose the next version of the patch / patch series.

Regards,

Chuck

