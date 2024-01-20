Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F15833518
	for <lists+xen-devel@lfdr.de>; Sat, 20 Jan 2024 15:47:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669411.1041892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRCbU-0000u5-Gu; Sat, 20 Jan 2024 14:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669411.1041892; Sat, 20 Jan 2024 14:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRCbU-0000rx-Dq; Sat, 20 Jan 2024 14:45:48 +0000
Received: by outflank-mailman (input) for mailman id 669411;
 Sat, 20 Jan 2024 14:45:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWTf=I6=web.de=Markus.Elfring@srs-se1.protection.inumbo.net>)
 id 1rRCbS-0000rp-1q
 for xen-devel@lists.xenproject.org; Sat, 20 Jan 2024 14:45:46 +0000
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95e4e961-b7a2-11ee-9b0f-b553b5be7939;
 Sat, 20 Jan 2024 15:45:43 +0100 (CET)
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MxYbN-1rBITt3fsv-00xdP1; Sat, 20
 Jan 2024 15:45:24 +0100
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
X-Inumbo-ID: 95e4e961-b7a2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1705761925; x=1706366725; i=markus.elfring@web.de;
	bh=7y4p5pvIngJ3aP5NdJ2PdSmbuGEVhNmS9q08S5a8BFM=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=tGxaID6IT3dSC3/B4UfQc/MN8x5dcyTLJDlF3YBXneCX8n27wLq2KwFlteAc06xO
	 vtI/tGKL8FfmwUOT6RnCyHoxjaPl3x17vAEvbDM/YNcv3bDHdnxERL8VOC+MKPL3m
	 GqB80XXgHXepjBz9PPZZ/B9wOR3qzaHTPEd9FDdwqKN4XRQsZ4Ui3qLOePR19cjqu
	 56QvIkPYiTs3o89DlcmcULWbmaE5snDHdhiCHaF9kEEfPNhP7Ft6jXfGPZf4rKwck
	 kBksZrjvN7w2R/LAEXsxOQANQvfX9AW4jaD4CAmcURJ01wSdB7UqcpxGL+8TBUHTA
	 uu6e57BeO81CEg2TPA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Message-ID: <26ef811d-214c-4ce4-a9f8-4fa4cfdefe29@web.de>
Date: Sat, 20 Jan 2024 15:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/xen: Add some null pointer checking to smp.c
To: Kunwu Chan <chentao@kylinos.cn>, xen-devel@lists.xenproject.org,
 kernel-janitors@vger.kernel.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org
Cc: kernel test robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, Jean Delvare <jdelvare@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
References: <20240119094948.275390-1-chentao@kylinos.cn>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240119094948.275390-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f7xX5lxSHQgJlr4n1BCo7mY8k5CxgyoVCcwDx8vDb81qa7iinjp
 ygTbFkH+h1w/S5ZoMSnj08gwbxWJGFxt9wXsJdUQHSaxAWNG5h3hUKEK/epM8rFwt3ZMsAe
 GGoA1wFozLQEI4nm9mmzNp+YSVHpveqj6S7m9BzPY8ezDb0rPR16s07u5MxZ71jjWEdHQKJ
 EXpaFRb580g4W1z9GL0AA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dNssvMK/v/k=;q8XQawuUKS31N/PKm5AGzjbYetO
 99hHwMBOmOWBnCIy1bqPUwVm8VmZgCs81618fDliO0XeeIbovun5R5Ivg2XLiN4bQ13ywhuru
 z8DGl7M0acIsPBeBndYtQ8El6P3tpZba7uhfEb42sgsXLaHFRMbyGIKR9/9ZrYy822bGxxUz2
 iD5aPXV2tlaCJd+ilskTN6s1abEhXVTtBS6u+1H44vXVb1Lm2Kzx1OGt1h7oM3PQ63TqIfM9H
 kg/GCpwrB+h4ONPE+VTgtGfsVQGmB75i22mpaOQd3xI8KvKghyRMoTPCgBicpjIry4QtwDKQP
 4zMeUexk0t70KEdkPsZedJf/LNW0xgWIJe6350byUcSNShf3xu3zcO71IEacZGlPU9kAvbV2K
 im/7Nnz4J5Oijgz/2vfqpx6bRxh/g3XLPkwmfPAxm24VDQcQZYOBuYM09u68tzj6XZnchJXQk
 6iMjKVvG1OKF5Ycwn692qN+JVfao+CnpqkrgUhRDMnjdYSiWqTUB8naValNX49RAxLiWs3i1M
 Te2XgOGNokH97CHMg8xVzCy/tETUpIeGD9uGmVKB4aHL11fwkbenPlTCaGVhXg987GeUzqNAe
 3oJo/fVsKc0EqFJA31r6VXG2hddutsBE6Qu2I8Y6Btcu6ph3LjogkIe2/zPMniIBhYrDHcySi
 KoZRIwbbbnbs5Jxx8hgqv55swN/S895voDMWcFYe7DRZDn4xbqG7QzufXJd+evmpqI1Ol95GT
 iIAwMa8PA2pTCokH863jHX8N+G3CprI4Tvpr3xaYr9+WZXdDvCYYKMag8O03GHC0Mmjwf4jY9
 ogNZORmcWd2toItGVKzO6QaGV+Px8nNxW6cx8bAsXkZvYEX/Of64IJarFhn0NEqXpLWKap9A5
 ifFKHt46kCyVOpG56PUiPOr8+i9R4gLi0wvDtL3nTVwISNBnqVDQG7hjvK2rPFsdZYOK0bSBu
 UHt0VVpGUUs86MGWxByob6GgwwI=

> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.

How do you think about to refer to the function name
instead of the file name in the patch subject?


=E2=80=A6
> +++ b/arch/x86/xen/smp.c
=E2=80=A6
> @@ -114,6 +124,8 @@ int xen_smp_intr_init(unsigned int cpu)
>
>  	return 0;
>
> + fail_mem:
> +	rc =3D -ENOMEM;
>   fail:
>  	xen_smp_intr_free(cpu);
>  	return rc;

Is it currently preferred to start labels in the first text column?

Regards,
Markus

