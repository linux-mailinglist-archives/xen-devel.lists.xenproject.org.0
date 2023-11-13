Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7930B7EA1FE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 18:37:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631879.985654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2arx-0006PP-GF; Mon, 13 Nov 2023 17:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631879.985654; Mon, 13 Nov 2023 17:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2arx-0006Nc-DD; Mon, 13 Nov 2023 17:37:05 +0000
Received: by outflank-mailman (input) for mailman id 631879;
 Mon, 13 Nov 2023 17:37:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dHgb=G2=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1r2arw-000525-9Q
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 17:37:04 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 402dd66c-824b-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 18:37:02 +0100 (CET)
Received: from [127.0.0.1] ([12.191.197.195]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 3ADHaD5Q2879261
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 13 Nov 2023 09:36:14 -0800
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
X-Inumbo-ID: 402dd66c-824b-11ee-98da-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 3ADHaD5Q2879261
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023111101; t=1699896975;
	bh=SCbNEaKysaDENzp7ym8rKe0t6E54PmQIYjGt+gUaVHA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=yDdz7RU+C8v9nYIEBzCAWgRm3F1WpeF12wJgCrA6ccgmNshH+SnO2sPhDYH9PySHL
	 YyqF7gWVqnOyr+dQAlGtnI9JasuK7AwYlLy1Tt2yJ1F5ZtYRCDnhW+aPvp3RGHfPVB
	 ysKh2MIXuyuYvp9nlGkCXC0QcYduFhDiMoxcqjQi9RkcMYie4H2Kw3TzoAxlI6tvXV
	 rrRKQ+lxLK4B2iaxhdShSn2TR4kmpimd9HhJX0jQ6J/xPqAgC0pG4q/9GwQchMAeUS
	 VQv4HAjGvUZ+w8UYh6+zktz0G+ELn42zjvoiL9UHu2Nr46sqxDE142BCoNIRfAyLDl
	 nQ9dbCgQdGOGA==
Date: Mon, 13 Nov 2023 12:36:04 -0500
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>, Xin Li <xin3.li@intel.com>
CC: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
        kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
        tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
        x86@kernel.org, luto@kernel.org, pbonzini@redhat.com,
        seanjc@google.com, peterz@infradead.org, jgross@suse.com,
        ravi.v.shankar@intel.com, mhiramat@kernel.org,
        andrew.cooper3@citrix.com, jiangshanlai@gmail.com,
        nik.borisov@suse.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v12_19/37=5D_x86/fred=3A_Update?= =?US-ASCII?Q?_MSR=5FIA32=5FFRED=5FRSP0_during_task_switch?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231113093742.GAZVHuZk9CGTRIfAWb@fat_crate.local>
References: <20231003062458.23552-1-xin3.li@intel.com> <20231003062458.23552-20-xin3.li@intel.com> <20231113093742.GAZVHuZk9CGTRIfAWb@fat_crate.local>
Message-ID: <3BFEBDE8-6F90-43A5-AE34-07B0ED0CAAAE@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 13, 2023 4:37:42 AM EST, Borislav Petkov <bp@alien8=2Ede> wrote=
:
>On Mon, Oct 02, 2023 at 11:24:40PM -0700, Xin Li wrote:
>> From: "H=2E Peter Anvin (Intel)" <hpa@zytor=2Ecom>
>>=20
>> MSR_IA32_FRED_RSP0 is used during ring 3 event delivery, and needs to
>> be updated to point to the top of next task stack during task switch=2E
>>=20
>> Signed-off-by: H=2E Peter Anvin (Intel) <hpa@zytor=2Ecom>
>> Tested-by: Shan Kang <shan=2Ekang@intel=2Ecom>
>> Signed-off-by: Xin Li <xin3=2Eli@intel=2Ecom>
>> ---
>>  arch/x86/include/asm/switch_to=2Eh | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/x86/include/asm/switch_to=2Eh b/arch/x86/include/asm/=
switch_to=2Eh
>> index f42dbf17f52b=2E=2Ec3bd0c0758c9 100644
>> --- a/arch/x86/include/asm/switch_to=2Eh
>> +++ b/arch/x86/include/asm/switch_to=2Eh
>> @@ -70,9 +70,13 @@ static inline void update_task_stack(struct task_str=
uct *task)
>>  #ifdef CONFIG_X86_32
>>  	this_cpu_write(cpu_tss_rw=2Ex86_tss=2Esp1, task->thread=2Esp0);
>>  #else
>> -	/* Xen PV enters the kernel on the thread stack=2E */
>> -	if (cpu_feature_enabled(X86_FEATURE_XENPV))
>> +	if (cpu_feature_enabled(X86_FEATURE_FRED)) {
>> +		/* WRMSRNS is a baseline feature for FRED=2E */
>> +		wrmsrns(MSR_IA32_FRED_RSP0, (unsigned long)task_stack_page(task) + T=
HREAD_SIZE);
>
>If this non-serializing write happens now and, AFAICT, the CR3 write
>during the task switch has already happened in switch_mm* earlier, what
>is the serialization point that's going to make sure that write is
>committed before the new task starts executing?
>
>Thx=2E
>

A resource cannot be consumed after the value has been written; this is th=
e only necessary level of serialization, equivalent to, say, RAX=2E

A serializing instruction stops the entire pipeline until everything has r=
etired and any stores have become globally visible=2E

