Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 684659407B9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 07:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767230.1177855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYfd3-00016a-Et; Tue, 30 Jul 2024 05:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767230.1177855; Tue, 30 Jul 2024 05:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYfd3-00011d-9c; Tue, 30 Jul 2024 05:42:33 +0000
Received: by outflank-mailman (input) for mailman id 767230;
 Tue, 30 Jul 2024 04:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EP8J=O6=yahoo.com=avikalpa@srs-se1.protection.inumbo.net>)
 id 1sYe4P-00047z-Kz
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 04:02:41 +0000
Received: from sonic311-22.consmr.mail.sg3.yahoo.com
 (sonic311-22.consmr.mail.sg3.yahoo.com [106.10.244.39])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b9a03b3-4e28-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 06:02:38 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic311.consmr.mail.sg3.yahoo.com with HTTP; Tue, 30 Jul 2024 04:02:29 +0000
Received: by hermes--production-ir2-57d49df6b5-64vl7 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID a6a452cd5391e7bd45c6614673d5491f; 
 Tue, 30 Jul 2024 04:02:22 +0000 (UTC)
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
X-Inumbo-ID: 8b9a03b3-4e28-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1722312149; bh=aW3+eSQfsxuMVwhV9iZgk7IBkdQbWmEeUnyPqQY/GMo=; h=Date:To:Cc:From:Subject:References:From:Subject:Reply-To; b=SUVMnoBqRzbzW97WeYsOLwUSKBTApl0o5UXm43S8xle9zAaYZ/XFTdwUp6YNgKBhxVNoWWybN4wYndzpqIedOPy1Nd4VUuH7qX9yLdQpE+HXQ1L09UdxkRGo89jKMAJhA4ce0Qj9a94p9Tyfby23kRRNcap1zE1M7vQaXfYuZ5iSCB+sHFAB/XHbo1RZXGtFiBS26PfEM7lhsnUlzdZiC6bk9oTWi9MxkPbP3dTSYQMxG1eT9Dh00JtWYNiqfRwOtRZhx9nS27daTOvPQqP/xE9FYiuUAxqGHZBkNFXIHHeZhJArJADn8kpb04IxlIHoo6smWVW9QVoweN31xg42zw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1722312149; bh=e9ntVuWGP8U+iZJRjNooRQZWYfJeWe2kfbTOhFfNLXx=; h=X-Sonic-MF:Date:To:From:Subject:From:Subject; b=aqfuEtwQ31ObOyfCRWiQOxeSE4r3QSsxK+6s0p7xMgSHlV4CXNycupW3B82GXGVsNw2I9w+Au9NHmGwxAug/YhzQybqNrwzlvjBOBw1ufnqgGLkq3siNcgC051FQ3MWuVFyjXpn7yQ9Y3yAg8WZZb/mr3dMdmqfHPpo055ZmLX9ZgIiR5cA6xDCgxsqU3W8W8HEqpyYHSm8D3/plb/ldbKDmm474gz6NsksvWDY3eyd+HxJRpBaQSrLKFZcxUw4pm7XCd33PlEUXMhzPcSQ5CiQ/p2Tv2TDwLgHKkShA0UmyY4swPYiqgU/GMh3/C171y43oh2BVEr98m8gqYYwkAw==
X-YMail-OSG: Tey3vWsVM1muYHYyLHsILzy6CM8QOBk.3QLF8Kr4ZM1_fVRxe.9PD8D9yb_KnsS
 IsTyRDF6n6vABI6FOqx3VEHSiu0j4aJao0mow_jXdKTkf8aM5O2VTggrapbItF31.tNfLhwRHY9F
 9hGZYfDiKWx4L8kaBsskuL5GseF.jHxK7Sp0jR5ymvfbLNbjNtks3HL1B5zG9DFp5n0WbQKeB4Fw
 _65TrI_JKsRaDTGJf6vuOb0bx1XgOLE1Mp0La2TbdihRVpQGiR8L1MaYPEG3BXnTZBxlMMeq7Xa2
 NbA8M0a0e63DVIfB4BLw7QsfTfzKOp7sKwDlXIwh4VNRiHZSgKeGkHzYTc98pCG9l1Br.zfJN.8B
 eQ.aGs47u7iWp8XV99adKSVsbXBIqb80NYRvIx4uhB2lmR8Ny1WK_waW.ejmPZbHZz1IAf7HIk9l
 3mLHRwsLz3XOgK8OHMHYWPs3AnKcqWDQvvcJpM5DAuGZzSMcUThSP_anXoHnTT6VEBpkgXeQqnWX
 RGhsL71Nz47ElTZicf.aUFB0zCnQYrOl0dwZQA_sQ_bp7abH.tbVI1GmgdielonRyhI.X1EYbWAm
 i5acSsHKDZsQoqdHF.4cohyrqho6DhPPh3wodWTjragHrgNfX_oO77.eAMar1iPfLGuVBfL2ezXX
 SnVWsKORJGD.U7SAp3MNo1GvHjOPchiqO3GD0.hud9snLVTZ34XnAG.ttwXYqv4EnMvgP_P4sre5
 5TXieTbgljKHppU4UnmnWOg18AFHJNYCf3Q2Fjs2JEPiOjPPYylL1EU7pth7qIdtPOwvr4fWyB9B
 nTpHI7gwoxFAS7Fb2eImubEGudiUKqDRzowvKzm8iIW_jIDrE2wc21q7x6jyslClh4FMt9gf2Xdt
 qhHLRtWs4DNPmAx2SzrMrMzfbKcSY.b.7loQRr9.KMjj5Jtli1YwKzddqi5rT7SbbO81DGn5alqJ
 EiNX5t7ZQEkcKZLqlIldx915e4Q_pimSwLE9VPp97KS3bkuphe3GsoqRLvJYCgiM4oGqPW3XGmBK
 FpkoGfKAgsNUWIFxNrkXKzSazc8kXkQiBo7cexcybKok34EAEuAfIOc3CEOwLLXt7.r6sO9vSBBt
 Wdfn5bzEnN5FMLT7o4i.OBCnQRNsDikT0sloQC93AcRM58l4Mvq2PJPHkP_63aZu7wgC5RLwQi_F
 72ykaIEelFUWBdGX3oa5K9GsdTsdGTy0vY6VtJ9QJATufyNOhE2wZPK7CZNeP0bvlIUSbFVtrtt4
 YxV47Q9CWef_EmVeUhqAEVUyjuvFMoKXZTkvKD8OPJ_F43KnMnNhnpBAOszVH3C7F0uw_y_8Nq0.
 dkbtmemnW3PHRujwy..LKvG8Dug8z5H.iGIGGXfMTX8TLIDonwFIJlOrGBdsLFn2Vo2GJPlY6B_Y
 QM63GZl7dhNnl23d9gynxBI93_AehAr7hAxHC7iQSnW_cstOct3T4ZWVmSPlN19otZ79n7lShsU_
 VxH.zGWPEb.36PBMLfJe8_tjW.AzgQs3k3oZOAhv_tjk56KddltHFqKaIEQYv9i76PhFpXipsjMQ
 VrnNFKFObHcGMvxzraIAyTCdLPjmPM.ZNV33r1pZ5x5U685nXWuYaL_Q398VS.1IUmBtbUW2roHq
 VFoJ1atUJwEp6ZHVhNLzzZpm8YpwpiE5i_Cv_YSDnA3gncBscQUxxK7kuUNGovIVwhR6PuCgZ1am
 9uBqwKLPHuHswG49pB.OR8pS_VxdkmT9N9jrUul9sNG2FRIQPiGnv3jO75AZeZ8OKv.J1XcpKEha
 b4tBe4qJpF99JjxOLvFibtT1dVgAIYpprUiLTqXJTGCUJVPYgqw2HR046hftXMJ.hRowEKeSQ64f
 ApobH4w33cCKgT45_SGSibzbx4uyjaHG3lg5ohF5h3ZaRU3hMT4lj134eFBwt_9yNXlNxGuEryuW
 _f8kfq_WlaF.O5C7ASDoNP8pkPBynyCvgU0u2HctkD_QCklZjoRXgKmh1th.wLjwjiaNPikLtloF
 _JXPQAFqpIXFn_et5C.gcqzV1SzHIHS6HttaUUdgUq86TZPSJDaZpo2CKN_EMk.uiox0GEkJTgvn
 c_ACg.NZa.oX1kqDQYB1Selt6vJlp8h8aS7KbYnS0f5PKxa9BcNRmijH5alypzIwpByp_uLv4oYZ
 IWFkWG130qK9o2z8ePjUYxxdvfsaoDoIvI.rc1tkNykYnHD9Zaqpgwax0UD_vYKdWzOYfcmHu2h.
 NnZg-
X-Sonic-MF: <avikalpa@yahoo.com>
X-Sonic-ID: f070aa9a-c771-45f2-aa1b-5cfee1fd7865
Message-ID: <05395ed2-3bf3-4926-8e24-c2e7ff37ed26@yahoo.com>
Date: Tue, 30 Jul 2024 09:32:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com
From: A Kundu <avikalpa@yahoo.com>
Subject: [KEXEC] Lacking documentation and kexec failure with Xen 4.19-rc4 and
 4.20-dev on linux host
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
References: <05395ed2-3bf3-4926-8e24-c2e7ff37ed26.ref@yahoo.com>
X-Mailer: WebService/1.1.22544 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

I am experiencing issues using kexec to load Xen 4.19-rc4 and
4.20-dev on a debian host.

The current documentation at
https://xenbits.xenproject.org/docs/4.19-testing/misc/kexec_and_kdump.txt
appears to be missing crucial details on properly using kexec
with the --vmm option for loading Xen.

kexec complains the --vmm option is not present.

System information:
$ uname -a
Linux host 6.9.10-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.9.10-1 
(2024-07-19) x86_64 GNU/Linux

$ kexec --version # compiled from source tarball with ./configure --with-xen
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

4. Follow the steps in the Xen manual at misc/kexec_and_kdump.txt:

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
./configure --with-xen, as well as using debian's apt version, but
both result in the same "unrecognized option '--vmm'" error.

Please provide guidance on the correct steps to get kexec working
for loading Xen 4.19-rc4 and 4.20-dev. Additionally, I kindly
request that the documentation be updated with these details to
assist other users who may encounter this issue.

If you need any further information to investigate this problem,
please let me know.

Thank you for your attention to this matter.

A Kundu

