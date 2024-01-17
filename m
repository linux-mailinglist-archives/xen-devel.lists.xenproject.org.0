Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2448303C2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 11:41:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668367.1040516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3Lf-00056M-Dt; Wed, 17 Jan 2024 10:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668367.1040516; Wed, 17 Jan 2024 10:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3Lf-00054F-AO; Wed, 17 Jan 2024 10:40:43 +0000
Received: by outflank-mailman (input) for mailman id 668367;
 Wed, 17 Jan 2024 10:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X+bD=I3=web.de=Markus.Elfring@srs-se1.protection.inumbo.net>)
 id 1rQ3Ld-00052N-JP
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 10:40:41 +0000
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dabb93dc-b524-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 11:40:39 +0100 (CET)
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MF2gW-1rNpMJ2Ney-00Fk11; Wed, 17
 Jan 2024 11:40:19 +0100
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
X-Inumbo-ID: dabb93dc-b524-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1705488019; x=1706092819; i=markus.elfring@web.de;
	bh=vJqkCYXJxdgrKwi1w2Jjol0tYLSav4W0xcsFJVVuKzs=;
	h=X-UI-Sender-Class:Date:To:References:Subject:From:Cc:
	 In-Reply-To;
	b=gCJ4kmmzLFuW9q10d5VlkqRSXfsWhY1BOy4mZ1KZqwZSmsmcey/Wru0Ji7i6RCu+
	 5RjDMXuku7/D3SoymJH0hL90nQcJVq06x7EPvwHNQpYUzsFeyLFA1t7qJ2L011T0P
	 sttEf0pKEjfy+QlGzksncaZ5bM/qRhJ3ACU91tPjFONtt00/nrtZy4tlb/uWC6gnQ
	 QXTNai0u1aqCLL+4hM4zTmeblB8HEur3q+2xEFrahf3mIQ1PiVeCcQC+4rOiTVX47
	 3vjodOG6/c1AGm35XGR6Dmrqke/TMy053GHtw6K7Kff0+DDZyJuBRjvf/qktobjRV
	 T8UjpDuvPD+ByaVPlg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Message-ID: <3e0c7008-417d-4549-ae0a-7f8d26522117@web.de>
Date: Wed, 17 Jan 2024 11:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kunwu Chan <chentao@kylinos.cn>, xen-devel@lists.xenproject.org,
 kernel-janitors@vger.kernel.org
References: <20240117090018.152031-1-chentao@kylinos.cn>
Subject: Re: [PATCH v2] x86/xen: Add some null pointer checking to smp.c
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org
In-Reply-To: <20240117090018.152031-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JaLRwvXgJjiefll0Tuwas9XKSthWswOnaJewGiQBlyjTcPN9V2f
 hcrT9hCDF4WMQbUTC8k8ldktcIrVPniJAn+SXNC0BsbmiJJp3ojo24Oib8U7MUU+sBdD0Yu
 9c2+NUGv0VOR/06RxZoAV6HYBZVNQWN89GhXqQ6KI3r7QMKbUFyIENEbq7fU76dv24P0270
 O6iv+fKAQp+KD0B1eJeiw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YvfY7JRbdYE=;mP4N+bwOpR1xsAuYUabDW0+JE/C
 AE3sP6atgL4o5w8kpHZI1+fNDuODzzspTSsZR7Ts2xw+W8gyXyG1AU9oeO8z2bx51b+YDZxEc
 MbwFGMGq2pX3mvIDaFzbYKAXE/lHYKT/46vU02RCllriNMVeBdckIzK5GJnmy5BhwV9obgmBU
 uMnG0nxdznUdK5vArhi41S8rswOBBjA+p5BXIMTwuElcMviIZDzAgwaafC7M3oRl7yOEhXGTj
 kl387WORzaxMA5yuQk0SH089zXvB0kDj25tXAy50rOLWbGnPMeoU+UBwkwuMUrPR+fLAckcAQ
 5iezZjgPUvQOJrDOCGqLBm3U0KcSfDlOjBB/zGrIPGKsZ/USoc22ulDNOmT+q7G5NlWoHU2/S
 Q2jcDKj+XSwagdZr3XoaA+ntcEd90yizsoxwOHIdbnKxrYJ2gjeGocUOh1468GgeBXSIBNGB2
 Hc50BeWZWY+7fO7z7MBIYuWNPJTMhx/XS5uYn0x/8yLmq4WZFNc4mMRi4VkGrPHlpi42INqOj
 Iy+FP0U7hHYRqyu5biKL3OMOaiuhvlWKO5uTYiPRinKgQW9YZbbe12zJq4A6Pt+LM1EtpfBfm
 2r+23QPpCOME0xqwxvqai/69Nhxpxk9+MIVgx4qcnj+YfvhNimWMcfCBBO1s1EtwBmRVEUpgO
 SmQLEwYWfc2cV5bYz1T5thQLt2Noez5tEFErKazzhFyWhoi6R6jbgiAA7IXO3arCEQ9jxYMDF
 W5WS9MZKEiWQ99oQBTjVxcJ1AVBiX3Z+olPFFpLww+Dn/e2q74nF6G/dUQcFSKqFEdWHgJYOe
 ViGCTUON4npiWlzfq/oXAYoWsPa+0AnfUc7bevojJ/udgrqE89563O9spHpPWxCl8KHVFlm4Y
 wfzUoxVF2hfAH6Siuqg7QOkBgCXbJbZKUlgqEx5fjzd8GRqpuO4HdA0YWzg7NHcsdBMym5Xz4
 iEsT4g==

> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
=E2=80=A6
> +++ b/arch/x86/xen/smp.c
> @@ -61,10 +61,14 @@ void xen_smp_intr_free(unsigned int cpu)
>
>  int xen_smp_intr_init(unsigned int cpu)
>  {
> -	int rc;
> +	int rc =3D 0;

I find the indication of a successful function execution sufficient by
the statement =E2=80=9Creturn 0;=E2=80=9D at the end.
How do you think about to omit such an extra variable initialisation?


>  	char *resched_name, *callfunc_name, *debug_name;
>
>  	resched_name =3D kasprintf(GFP_KERNEL, "resched%d", cpu);
> +	if (!resched_name) {
> +		rc =3D -ENOMEM;
> +		goto fail;
> +	}
>  	per_cpu(xen_resched_irq, cpu).name =3D resched_name;
>  	rc =3D bind_ipi_to_irqhandler(XEN_RESCHEDULE_VECTOR,
>  				    cpu,

You propose to apply the same error code in four if branches.
I suggest to avoid the specification of duplicate assignment statements
for this purpose.
How do you think about to use another label like =E2=80=9Ce_nomem=E2=80=9D=
?

Regards,
Markus

