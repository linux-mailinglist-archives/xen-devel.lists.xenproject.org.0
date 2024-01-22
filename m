Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3E7835F19
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 11:07:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669730.1042090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRrDG-00035C-4W; Mon, 22 Jan 2024 10:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669730.1042090; Mon, 22 Jan 2024 10:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRrDG-00032z-1l; Mon, 22 Jan 2024 10:07:30 +0000
Received: by outflank-mailman (input) for mailman id 669730;
 Mon, 22 Jan 2024 10:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGu3=JA=web.de=Markus.Elfring@srs-se1.protection.inumbo.net>)
 id 1rRrDE-00031W-I0
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 10:07:28 +0000
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b06fd13-b90e-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 11:07:26 +0100 (CET)
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N1d7i-1qzQGl1nD6-011tRs; Mon, 22
 Jan 2024 11:07:03 +0100
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
X-Inumbo-ID: 0b06fd13-b90e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1705918023; x=1706522823; i=markus.elfring@web.de;
	bh=fTg1GKoElQXtI92ElzyjxQkY95Oc2Gw5CPCoF4BKwq8=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=XbLTyj35Lb7jl1Yxk5KWnYotJUTzEV/OahrmTGAuvwBNAl3a+VwS5Yj6WbV0eTWT
	 F8XF4+XunIdby/uzCcMOOXrbW1nz0ynfe+q8vz86czFsJHriEmDKJWjHye5gDjekJ
	 3zJdBiB8SvV6FuY74cI9jSzvCGCSRC5rAZdb8vLb9G06jExBKLSY6l4PqdiFcDwB8
	 Ce3nIBc9znPGdYrOIH8xCam1LgCpl7GlXMfteTWW3HyMt7yYNleZj0VLEuSafpBJX
	 LdY5ZefXx197/9mhH7YnobqgSJ8w7SeTv9fyjuS3g01X41Md/kH696KNsDSTb+nmR
	 fDZwscOeNJL4O01/SA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Message-ID: <b0b1ba48-1d48-4163-afc5-ac92121ee14c@web.de>
Date: Mon, 22 Jan 2024 11:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] x86/xen: Add some null pointer checking to smp.c
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@linaro.org>, Kunwu Chan
 <chentao@kylinos.cn>, xen-devel@lists.xenproject.org,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 Jonathan Corbet <corbet@lwn.net>
References: <20240117090018.152031-1-chentao@kylinos.cn>
 <1705655941162581.825.seg@mailgw>
 <517fae75-c4e7-4576-81ff-6a14a3eb9cd7@kylinos.cn>
 <dfb6de51-3ebc-41fc-a750-cf5ca2ac05aa@moroto.mountain>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <dfb6de51-3ebc-41fc-a750-cf5ca2ac05aa@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TVWkH58C8d+xxHWHzHB64epa3s2plijd4rtx+6kS7ddQj8Suzvv
 naMuUTuD5EWLL2maurgo9AVz+dfWzvKtULBa/5Ve/rZFZcwKc9G46OszjBW7AP9yBR2RipX
 lK43Pd+vVigt/FjZRtStKTTDI5ju3W3XLb/WimEdl4OICVTk1/YmHkjTr/9CBQ1xYQ94yFA
 aDAE639lz9NSS4qWe7X9A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dU6CzvMVSpk=;fSHtYB/+Ly6z8pY0YGpGVG3ymD3
 S5R+AQd74kyXPO7x6bf/abdvDEWT2fFiA5grBn0s2z1asUGulEyqknQZVKJwf0tKu2SFstgor
 C/k1kCa4Q1jtgtl3ehPa0kPjTNaru70z78epFuFQTTS6fKSCe3ZrV7ekGai8+G8Hk7yOgiQXU
 FgIixZkdWM3rkJ54x8VUy6DnkxGN1mIkWIVQT87i2xg/BRetp7hS+LYad+RpxlHzxvABYaFMS
 yTWm8/CYgyNkKb64NqBPX/4EETyRZmoh4Pg/ONAtpFP6K6RRshD3XLN+LTIsf/dt4hPZ/OO6K
 zhJ3Jcd1jHt3rZbRkLwlP1aQTms2E3DXa/sPOTYIHuawGiZL43TXPy1nvG5Qu5XUD+uLR3UcV
 MSUBMqfOBKib4NuW2aKzkwhtbtHAoj5OPdJkdO0KL00ZXjJYha9ar9z4FwFEyZ1uJuyeyouRP
 /RqzuWH97IyQeevzIJ4G4ujdTPtemaWdj8C97cgBcFTGQaxF+AjXHFLnDnOeGwka7ehoySB4X
 WEQB4wDsnXTCEppwuZwANErLkf/0Pvy94yrRC2T6DmIt6v2LaBYQMXpvj02MO/hbZgv3mS7VR
 WC+u/TOo2Es1jI67Vg0HD/nGJCfItmhF37j4A2V3sXpaVksjIlhhi0btsiu+4OQdcvfv5633N
 daXMmq0nbOUPsumFU3SHFodudI05p3k4JBAYBudav4Z2nhG+sPc9ZQWskqP+FkFUVkln+jFT3
 nhXJMMD1BxRr77e5AdkLzRBhX7B63C6MBSR9TfPXbS0+4aAQs2fzLWb9SsX3rDAPwldNNrgpa
 C3enyvAYKhgNNxSEoKwSHU0BTHyxrTSyvXXnSABRXE+7SqHuxuNl5W1vih1+iMORigNwPmFqs
 w0CgqXRGAAG4XNsHi8qw5xoGBkcwrbwWz964mjZpoza6mVBLAMBLcTHqiNvV8IEoGtqzH/hV/
 lNYuYA==

>>> How do you think about to use another label like =E2=80=9Ce_nomem=E2=
=80=9D?
>> I'll add a new label to simply the code.
>
> I'm not a Xen maintainer so I can't really comment on their style choice=
s.

Linux contributors can discuss various implementation details.


> However, as one of the kernel-janitors list people, I would
> say that not everyone agrees with Markus's style preferences.

Can a corresponding document be improved accordingly?

Centralized exiting of functions
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.8-rc1#n526

Do you find a related information source helpful?
https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+go=
to+chain+when+leaving+a+function+on+error+when+using+and+releasing+resourc=
es

Regards,
Markus

