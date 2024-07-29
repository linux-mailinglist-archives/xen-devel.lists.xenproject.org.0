Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FBE9407BA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 07:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766988.1177850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYfd3-00011i-7M; Tue, 30 Jul 2024 05:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766988.1177850; Tue, 30 Jul 2024 05:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYfd3-0000zg-1n; Tue, 30 Jul 2024 05:42:33 +0000
Received: by outflank-mailman (input) for mailman id 766988;
 Mon, 29 Jul 2024 16:19:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kiB1=O5=yahoo.com=avikalpa@srs-se1.protection.inumbo.net>)
 id 1sYT6G-0000ez-HW
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 16:19:53 +0000
Received: from sonic304-20.consmr.mail.sg3.yahoo.com
 (sonic304-20.consmr.mail.sg3.yahoo.com [106.10.242.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f1540e1-4dc6-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 18:19:51 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.sg3.yahoo.com with HTTP; Mon, 29 Jul 2024 16:19:44 +0000
Received: by hermes--production-ir2-57d49df6b5-64vl7 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 4f7f708f22a9c57021e9511dbee6f05d; 
 Mon, 29 Jul 2024 16:19:40 +0000 (UTC)
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
X-Inumbo-ID: 5f1540e1-4dc6-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1722269984; bh=FV14CYu2wRRrZzwFPU5EC4El3CLPS+/fFrU6poNeBPQ=; h=Date:To:From:Subject:References:From:Subject:Reply-To; b=oPsP7hoc7dUBZPqXCL6lDRIyouozZ9gPLPAd1PMfwdp68zoBy472SJvK4YJqtnSn7AF3zLd0hy37NLq6YgA/4GCohBhjGpzOMZvGbc2qCZko0MXdtwUlWX8lDo3UC5jP8Z+h5lIERpRMpdT51q20rdIm8l8KOd5Ih0/ZPN6O+Ge4YqPvs8jiBqL5v13XjQZ0TZyDnFcQW32KrpeuYB+qXRil2/d/2Tw0tFWbcCx6asTTPSLI0iBcQqPsI9EUCk1RZYpEV42siZt7LJqS8AGIMa4sNj+vGNAr3YalEH0+VM7+h6ki2x8w/wtY5+QcCc9ixuz4OL0AOtbjYLcTdHdjkg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1722269984; bh=CACZexD0DFJcNV083K1e2ugya2waxsWXT0/VgENaLEu=; h=X-Sonic-MF:Date:To:From:Subject:From:Subject; b=SY5wdgbdqkl6ZnPa9RaZjHagTDAZjzPAA9gY/9JFcElAXCsEMmrUbizXYXmyBmYcNztdkbJ4u3oQy24ZUreasN4H9EpPL6CnVOnraa/V0fru2ajJ0FVqEDoTt8/B71AemC5r39mDFaC60UPAk7H/u0tDtB5wP03wcJE9ojAbrJU38NHJKqpD/OjIqN/XTCsGdV6CXVvCJ7LJU2n8XG+tXOwuvMVWdkq2YGFzIehed3vtQft2z3W8/mPa6vDe8bLHR8IX/+GQYxTpV0ghTpR8HSQS4P3ZWDyuyMZZdSKno/TAb+S9yFmi4KYNe8JsoqqXuVQO+rces6m+FLG48E2vrA==
X-YMail-OSG: riPUJrgVM1m1n9wJwjWZ3VUuXlANWVKM.yfOi5mJ7oMB4njhdFkNqifdxuXMCpC
 Yd6mLcMbR5kyXnC8wMKq.7.Et60XxRtcvu8TXPZY1CtWaLzzSv9dVFZA9i3ekuT_rObo.1fSJZnz
 Tdc62VfaTv3.22GS__u1jDbo7mgsfzX7dcTSm7fFdICj3ML10E6rbjTZXFfEdSjvcOjWJ5.yboQr
 odLVG4Lz23Cad59sQXhS6datHZjCm98QwtiEKXi1p5MxBqU8d.sdKSEiwozvfDQ4sUy_oBwL0n9p
 baEy16DwfTXpMgBEQBXfW_7OAYHJCKjKllWlLW.IutHk82t9pyXYaI3_Fdj2qsNATBd3UayQrxPl
 QXVZqBpU2v4naXTomikCgGMrkdwP.DfgOEOVzK6ScWv8CNP6S5zlEUYsLWP3vqgXcd0RdJGNryX4
 raLf7mTnF8NLIdqRL46g1KcgvYqqm3zQBkMbiU_Un95d0tlPo36KJU9b8mglUEJdRq2xOW8XmiDA
 8DIvGgWWCWDL.Q9c9HdEVo_E.bYCxDseSQOkjd9C3xyHW5d7w5_TmFFgsvy4KYOoc2k3mUbFVl0.
 h8qJ74cE89GLzB4GRi8vaoQl3iI7GCgrXOP4ma5gR.5hAOpYzBSTMLMAX5M7tJptW4JdfVpJP1iF
 JB49sDw1immAhEHZoOYjgclYnsKBAXjqDTiRYe0bQp3bjDkCxoPDBa0UcuDarR3JD3BU_eznLi.r
 x4V3pTjv1fGtRhnxPzeCUBeHCjyeeGfEl.s3g_XqRyIFbVQF_wsc7nxMrXqGTlhKIgqGIOp9wiQG
 PKb_RWpPui1mzEGd6j_MZpTEFFo.MH5moWQ6VPqCvDDfykZ5jp9uvqz8IaaohpjHYvLeysQN0Q7K
 48oPa43S89SfiKoJarAt06s9P9QpbYJSxpt5RmTF5jfghbqLZpTXwfcllgtvVy.IujM87tozThrC
 V90tYSxkGNGcKW754slRxqonyGQnOBYegYyz3RktbNqgdbpqY9E_jqBJj_8.47Bln94_7snDwQQ5
 oUtJ9iX1D.O4HGTTYEh6dyXDuUA_hpKTdOoNJ1xjWthFBO7aXiW1g_vgtHFa8U7HaU4L1KtbXvPl
 FEzmCOx9seiICA9crsYKjgLSCUwOLH1xNIl_hGiJ5c7CuSaZxGCWlabxYDfvQrKFDhc.SwjKNPrR
 zHsNihxTF7tT0KjDI05oDlTwF0uV.F_aCUNDcESl4ov3OmDS4DyCt6RkUrp1tsnBpAuYWOBu3.mf
 DcsyXGa_3TR84vEzt7C0yFlPfLkFcjEAvAtbNqn17f9cKKne_pPHIjJshNdFwm6mCzFWscAyqwgm
 vSooGeDlbco2cN7eljXaGjm_Z_H.WahMZ8DdquEZxiWuIx.ivgNVrMnZqkoMmrhzL90A2MwiEp1A
 _CSBFcCn1IrqEC4t9exaKR77ObB8VWe3mvLfW_.iJVvF1g63gJQPD7bLSTk9D4zgMo7cxvipFhMS
 k3sgBrS9ALQ9FmRlZ_3XLTYx9qgbcWI3CxIs3p5wpeDSAkpKsKam1eDb_un3WHsqlEC8aUiSjAYO
 2NuAPKa0VlRkAu_YkqdUKOCoWS.t6pE5Sd6qGWPUxpvHMgZjuV82w43uI2U4qzPsa1yqh1UX7JTL
 zeolqO4XGb7gK4.lDRfAJKOYSlMU018AdcbUQdO2iyU.mqbrfuiptbMVqgq6zONrtZ4rXDJaWkEb
 7cWUpugzRbyO6Khu9W0pGjQF7g8GAOCF7O1GG3cX5pZobNLbmDpuZsJ3NGUoz9UxubqSkvwEFuEz
 kT9x.4hK1U4AtK_7db3eiysseCdcbiPIHVSq1JX7JYe8MjUao4rsK_JWOpFP_75e2g1xIMmcO30G
 3BvARsTX3JIbnn1ve4oPtcJ9IToCLWl_tym0UBv1.B40IJaUxWqcvxZ2wVXkjGzUpTZ6quDcPBlH
 5.hxry.TaHV5mNbDhiyUIuAPOvowdm5fxpdsmHeADP1EJHYaly3362RC.KiveUxdhMAJKsFsHfsV
 tnbeIPFWG3VRriNkdGPP_6XQjyVabdvyiFaJxm8JbHKlP6aqcyxbz2tnjM7izpbDni7Xe2Qv9cyB
 dUNwb.KUTqzMNB2Oc8mXbFdw94Sw8qSOc02nO_KB_Kv5gewRWSQLmw32O2nL.AiVM8NiUuAZAs1o
 Z4PCBvYURkb2st6f.V03QN4M9Gk_AvGh5aUXaP2c4ejAR7PcEJg45ngO18QyzGA--
X-Sonic-MF: <avikalpa@yahoo.com>
X-Sonic-ID: 0822630f-8684-4a72-a30f-72ad7e49e5fc
Message-ID: <c13e7918-6657-403d-a804-c40874460cff@yahoo.com>
Date: Mon, 29 Jul 2024 21:49:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: xen-devel@lists.xenproject.org
From: A Kundu <avikalpa@yahoo.com>
Subject: Missing documentation and kexec failure with Xen 4.19-rc4 and
 4.20-dev on Linux host
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
References: <c13e7918-6657-403d-a804-c40874460cff.ref@yahoo.com>
X-Mailer: WebService/1.1.22544 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

[I'm not subscribed to xen-devel@, so please cc me in replies.]

I am experiencing issues using kexec to load Xen 4.19-rc4 and
4.20-dev. The current documentation at
https://xenbits.xenproject.org/docs/4.19-testing/misc/kexec_and_kdump.txt
appears to be missing crucial details on properly using kexec
with the --vmm option (which may not have exist for sometime) for 
loading Xen.

System information:
$ uname -a
Linux host 6.9.10-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.9.10-1 
(2024-07-19) x86_64 GNU/Linux

$ kexec --version
kexec-tools 2.0.29

Steps to reproduce:
1. Set variables:
XEN_HYPERVISOR="/boot/xen.gz"
XEN_CMD="dom0_mem=6G dom0_max_vcpus=6 dom0_vcpus_pin cpufreq=xen"

2. Attempt to load Xen 4.19-rc4:

# kexec -l "$XEN_HYPERVISOR" --command-line="$XEN_CMD"
Could not find a free area of memory of 0x3b6001 bytes...
elf_exec_build_load_relocatable: ELF exec load failed

3. Attempt to load Xen 4.20-dev:

# kexec -l "$XEN_HYPERVISOR" --command-line="$XEN_CMD"
Could not find a free area of memory of 0x3f8001 bytes...
elf_exec_build_load_relocatable: ELF exec load failed

4. Follow the steps in the Xen manual:

# Set variables
XEN_IMAGE="/boot/xen-4.19-rc.gz"
DOM0_IMAGE="/boot/vmlinuz-6.9.10-amd64"
DOM0_INITRD="/boot/initrd.img-6.9.10-amd64"
DOM0_MEMORY="6G"
DOM0_CPUS="0-5"

# Prepare Xen and dom0 command line arguments
XEN_ARGS="no-real-mode dom0_mem=${DOM0_MEMORY}"
DOM0_ARGS="max_cpus=6 dom0_max_vcpus=6 dom0_vcpus_pin"

# Load Xen and dom0 kernel
kexec -l --append="${XEN_ARGS} -- ${DOM0_ARGS}" --initrd=${DOM0_INITRD} \
   --vmm=${XEN_IMAGE} ${DOM0_IMAGE}

Result:
kexec: unrecognized option '--vmm=/boot/xen-4.19-rc.gz'

I have tried compiling kexec-tools 2.0.29 from source using
./configure --with-xen, as well as using the apt version, but
both result in the same "unrecognized option '--vmm'" error.

Please provide guidance on the correct steps to get kexec working
for loading Xen 4.19-rc4 and 4.20-dev. Additionally, I kindly
request that the documentation be updated with these details to
assist other users who may encounter this issue.

If you need any further information to investigate this problem,
please let me know.

Thank you for your attention to this matter.

A Kundu

