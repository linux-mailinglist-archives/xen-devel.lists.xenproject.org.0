Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4857835BF7
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 08:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669677.1042024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRp1f-0007vt-Ia; Mon, 22 Jan 2024 07:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669677.1042024; Mon, 22 Jan 2024 07:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRp1f-0007tY-Fe; Mon, 22 Jan 2024 07:47:23 +0000
Received: by outflank-mailman (input) for mailman id 669677;
 Mon, 22 Jan 2024 07:47:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tj5a=JA=kylinos.cn=chentao@srs-se1.protection.inumbo.net>)
 id 1rRp1e-0007tS-Dy
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 07:47:22 +0000
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77fb0a7d-b8fa-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 08:47:20 +0100 (CET)
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
 (envelope-from <chentao@kylinos.cn>) (Generic MTA)
 with ESMTP id 935448798; Mon, 22 Jan 2024 15:47:13 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id EB762E000EB9;
 Mon, 22 Jan 2024 15:47:12 +0800 (CST)
Received: from [172.20.15.234] (unknown [172.20.15.234])
 by mail.kylinos.cn (NSMail) with ESMTPA id 0A1E9E000EB9;
 Mon, 22 Jan 2024 15:47:01 +0800 (CST)
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
X-Inumbo-ID: 77fb0a7d-b8fa-11ee-9b0f-b553b5be7939
X-UUID: 565b878a508849b98085f4b287cfd53f-20240122
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:341d19ce-db61-4755-8c58-6ce5c2018139,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:7
X-CID-INFO: VERSION:1.1.35,REQID:341d19ce-db61-4755-8c58-6ce5c2018139,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-3,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:7
X-CID-META: VersionHash:5d391d7,CLOUDID:6bb26d2f-1ab8-4133-9780-81938111c800,B
	ulkID:240119184126L868QB56,BulkQuantity:15,Recheck:0,SF:66|38|24|100|19|44
	|64|17|101|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,
	TF_CID_SPAM_OBB
X-UUID: 565b878a508849b98085f4b287cfd53f-20240122
X-ns-mid: postfix-65AE1D80-872727190
Message-ID: <e7a6add0-5526-4efd-8b00-07e399e292c1@kylinos.cn>
Date: Mon, 22 Jan 2024 15:47:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/xen: Add some null pointer checking to smp.c
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, xen-devel@lists.xenproject.org,
 kernel-janitors@vger.kernel.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org
Cc: kernel test robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>
References: <20240119094948.275390-1-chentao@kylinos.cn>
 <91af4a8c-d2e2-416f-b02e-5d69553c5998@web.de>
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <91af4a8c-d2e2-416f-b02e-5d69553c5998@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2024/1/19 18:40, Markus Elfring wrote:
>> kasprintf() returns a pointer to dynamically allocated memory
>> which can be NULL upon failure. Ensure the allocation was successful
>> by checking the pointer validity.
> =E2=80=A6
>> ---
>> Changes in v3:
>>      - Remove rc initialization
>>      - Simply error paths by adding a new label 'fail_mem'
> =E2=80=A6
>=20
> I became curious if you would like to simplify further source code plac=
es.
This function hasn't changed in years, so it's OK for now.
>=20
>=20
>> +++ b/arch/x86/xen/smp.c
>> @@ -65,6 +65,8 @@ int xen_smp_intr_init(unsigned int cpu)
>>   	char *resched_name, *callfunc_name, *debug_name;
>>
>>   	resched_name =3D kasprintf(GFP_KERNEL, "resched%d", cpu);
>> +	if (!resched_name)
>> +		goto fail_mem;
>=20
> Would you like to add a blank line after such a statement?
Sure, I could do it in next patch.
>=20
>=20
>>   	per_cpu(xen_resched_irq, cpu).name =3D resched_name;
> =E2=80=A6
>=20
> Please compare with your subsequent suggestion.
I=E2=80=99ve seend a reply.
>=20
> =E2=80=A6
>> @@ -101,6 +108,9 @@ int xen_smp_intr_init(unsigned int cpu)
>>   	}
>>
>>   	callfunc_name =3D kasprintf(GFP_KERNEL, "callfuncsingle%d", cpu);
>> +	if (!callfunc_name)
>> +		goto fail_mem;
>> +
>>   	per_cpu(xen_callfuncsingle_irq, cpu).name =3D callfunc_name;
> =E2=80=A6
>=20
> Regards,
> Markus
--=20
Thanks,
   Kunwu


