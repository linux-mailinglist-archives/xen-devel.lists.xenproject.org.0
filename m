Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249D8327C2
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 11:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669016.1041579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQmJg-00032X-0Y; Fri, 19 Jan 2024 10:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669016.1041579; Fri, 19 Jan 2024 10:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQmJf-0002zn-Tc; Fri, 19 Jan 2024 10:41:39 +0000
Received: by outflank-mailman (input) for mailman id 669016;
 Fri, 19 Jan 2024 10:41:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZhYs=I5=web.de=Markus.Elfring@srs-se1.protection.inumbo.net>)
 id 1rQmJf-0002zh-AE
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 10:41:39 +0000
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51ee27b3-b6b7-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 11:41:36 +0100 (CET)
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MXGK4-1rcI6C0CUA-00Z3qK; Fri, 19
 Jan 2024 11:40:54 +0100
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
X-Inumbo-ID: 51ee27b3-b6b7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1705660854; x=1706265654; i=markus.elfring@web.de;
	bh=cO3V1vzVt/XdQPd4h52EbfomnaIJyRP7lYScOtdsYfA=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=aUMfllpXhQp96ch+72qMDLSmcLyDdYTI95M+i9y/KrwZRGGMot0eTY+0rwXCxNP1
	 sdtxYWf+w/xQEMObBPPZEGZ2Bxs0PACvQhN9EjN2YBb5Znd733txOgj7sZL/YpnkD
	 vaIebkxOArHMSUG70Yz4IYTZWfVvSgEX6deyqWAcJ2IrarpPQyGXepDZvUbwXrvzn
	 ZI15Q2evZc1Cc25/KsDRbED7Fjw6NMuzXi8CTg8S0ep7lLH+DgSK9a4Z3nmBLRa6W
	 7eMHYqrbVE4wFqXuEypmjD7JKIxRDBwgD2pOOO4vqL9AR5brc2F6nnyPPNDz6NMhV
	 LpQ1qPF6+/MEXWj4pg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Message-ID: <91af4a8c-d2e2-416f-b02e-5d69553c5998@web.de>
Date: Fri, 19 Jan 2024 11:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/xen: Add some null pointer checking to smp.c
Content-Language: en-GB
To: Kunwu Chan <chentao@kylinos.cn>, xen-devel@lists.xenproject.org,
 kernel-janitors@vger.kernel.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org
Cc: kernel test robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>
References: <20240119094948.275390-1-chentao@kylinos.cn>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240119094948.275390-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ghWwRZ/xa5RiEzFG9SbB0YwItzwhscPRgB036myKdl26mgHPgKw
 VQbfwMEIvEYjgoBwMzGbrC86u73mQWUAltu6JjfaeKhE0StOY0nu7+cgBg/EHNLAO0/X+BM
 EBxxa3DUjgyyfYOV5m3vCuXn9YLNj9tZuWEYayV5ptyDsZtJkANo7xydQln4MmP7NONjqa4
 EUy/959xDksIDzQKmvvUA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Jdxt2uu7/7Y=;HuDpAVrdHwPdL9vQoUbqKiGrS40
 jrr9+Shr1pVnJD5Of/QXY9RNn0QLS8cUxdkrkEY3hPpLtU4ONu5yTqk4gf0qoqVTuGJnOD1Sn
 4UrF12BONo5rcPNaYyf5k0IW3lMsXl5nF472p1Jtx1Go5zQ8wxkQHDivMIkKwGG2AWoMX61ZU
 Hi4/FpxLFYz/LiUddzOcuuxVbJiBPGiaonoQF43MXTxrNGoKyQZ7xsGD3X4KTDkUorVbhbSwZ
 sXHkWnKRV+yASAqYr2MNrkdkuIrgCUTG8vs0YqBg1T+nivDDbNM7kt67VU8jgqMmGR3S+oITw
 q3J23UQ7mfv84Xmg0Q2kWQfRbTDcl7VIbhnpBCsug4ijQ6BcJcxT6r77xDu/Gp19LaRutvHWq
 ikMASjzuT7OfjYcHxu0yiz3NQK20GUuaE4ehx8Ka/Pk0uihwglrabOKlYTwTeEqP9tn+SGyY6
 Iu/nz7+UgqBi2yurZd2IxhwOZ+BezJKN25qru5qAzKFwxuhOdUyCunv7h3r8teyCJ+t2WLjc6
 GAbxLzJ97GbfWnuP423Zs8y/UjUP75u+nPGqSNd5Gpf3fV3/ezW04pzkB3Q7PZYMZtWHB85C2
 HIlKfL63hLkXUDWriYv4ejxh2C4YQPKfxsEXRZDF0wFEsC98DVews10fJgSqVfyOIcyLTApZj
 3I8uM37B4H+d5Gerjo+2NgOB0h5sSMUhhs5syKmsoEgYRKZsVa0/Aj69GIawSRHt9uxDtDWlR
 R2okc37C8jVAGB6hu0wheHhb/K1G8n7ct3UDPNeBm1F/Yua2vuhBObIWg9vSt6OXXWf5nBNaG
 dpEBLuKRz4narT4kDT5Bwag9mpo6h9E2tybPq5PIodGIqJYy5QV7t297S77lifFtdLwEYnr5U
 Ww7jgUT4o5p/aTeMKxVvbdVh+CL/k3q5PrpQ0Bpd58eTxWYJUwx3KS3VhhpciBGDK15c6dp1V
 HIfFig==

> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
=E2=80=A6
> ---
> Changes in v3:
>     - Remove rc initialization
>     - Simply error paths by adding a new label 'fail_mem'
=E2=80=A6

I became curious if you would like to simplify further source code places.


> +++ b/arch/x86/xen/smp.c
> @@ -65,6 +65,8 @@ int xen_smp_intr_init(unsigned int cpu)
>  	char *resched_name, *callfunc_name, *debug_name;
>
>  	resched_name =3D kasprintf(GFP_KERNEL, "resched%d", cpu);
> +	if (!resched_name)
> +		goto fail_mem;

Would you like to add a blank line after such a statement?


>  	per_cpu(xen_resched_irq, cpu).name =3D resched_name;
=E2=80=A6

Please compare with your subsequent suggestion.

=E2=80=A6
> @@ -101,6 +108,9 @@ int xen_smp_intr_init(unsigned int cpu)
>  	}
>
>  	callfunc_name =3D kasprintf(GFP_KERNEL, "callfuncsingle%d", cpu);
> +	if (!callfunc_name)
> +		goto fail_mem;
> +
>  	per_cpu(xen_callfuncsingle_irq, cpu).name =3D callfunc_name;
=E2=80=A6

Regards,
Markus

