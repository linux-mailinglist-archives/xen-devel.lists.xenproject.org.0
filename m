Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D853ECDBBDE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 10:06:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192856.1511918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYKod-0005bv-6V; Wed, 24 Dec 2025 09:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192856.1511918; Wed, 24 Dec 2025 09:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYKod-0005Zx-3q; Wed, 24 Dec 2025 09:05:55 +0000
Received: by outflank-mailman (input) for mailman id 1192856;
 Wed, 24 Dec 2025 09:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYKob-0005Zr-UV
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 09:05:54 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bee024db-e0a7-11f0-b15c-2bf370ae4941;
 Wed, 24 Dec 2025 10:05:52 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b736d883ac4so1006136266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 01:05:51 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b80464e01d9sm1568956866b.42.2025.12.24.01.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Dec 2025 01:05:50 -0800 (PST)
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
X-Inumbo-ID: bee024db-e0a7-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766567151; x=1767171951; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gesNZNDeS2jPSBits+A/Y3F+dFVM+6O+52QZzdLbCII=;
        b=ho8QS3iSTgqDfCXijJLA2zxD1vBWyDdCJ7W4sjWix+g5Xq6k2nqfjefYoF0nz7PN0y
         uts/3AitU8zAYol+mGBJ0cvi9U5/NHmIhUrnUh3kMLgT8U4WQ31/Cklii28FxY+MNdcX
         2pEBAJfX/rRcH6sEMQbGmfD5t4xTmMuo1XJgF1OdoeFyjXV+I0N3PhtJLsboQIuAiQ0d
         BJR9/c7Iivu9H5xEHugPc2iuPFF/txwc+F46jgjNUOghCg1SVUWfjO/sC7KBKzYy9nRQ
         mGPKDT+kIICMtETnM436gzhpm4BwHTEwP3KgN4lEN286nKaNb0nPFnBjll4CvG8AL+KU
         VRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567151; x=1767171951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gesNZNDeS2jPSBits+A/Y3F+dFVM+6O+52QZzdLbCII=;
        b=aF/G5YxJRGQXyAbCKblqsaahIEJ7Hw2BlG7PtVnUGtpt7Etw+RJOB+WSfD5KfVMG0C
         mS9vSa4WRseZd2CrL/RHuIgz/zQvAq9/EnB99qASuLpVzkLVP69kUO9ruFY/eDqlnhtB
         pLlmLeQgP26lSA1i2ulKF6RahzoNqSLA51xYgFxliv4CYYkEZuASbJTv0Uugx+DEZZmg
         7ZOHEQWO+DI76G6m6JjKN2FtjhbYlI3N1wcMUq8QvmhCT1IqxVC4NGAPTw875T09yN1r
         ozDeC2mQoQ37POw3LRIP+C31dTRBYF5PnF4T8OqtGugBKnx94e/yha2zPo5Asjg1/CIp
         MxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCULaS2zeKDxqo+etlnAEdPP1Jlflrm0HSVta+GnQhzR+AH/8moYQwn8odL5kMd25qVHCMzs1vQzks8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0Gy0W1vZVUqTu5wtWcp8T4EmRnJ4NlBWP1mJXnhadWaSjcdfd
	1k0QU17zmJwe0+OgZ9p0I4m1n8eRkMDuQOU235d7hjKwTl07sklCZpYi
X-Gm-Gg: AY/fxX4rgUL0aMuSQeFyLk/OCJ+eW3pDIfi6eJidX3+RyeBKv1eDr0GJb/ZjOLQs3mW
	66S3NwOyzWkSTkGv0hGDFjouGlZHiJgk68TFxIlVaNy/Jww5UrraxxIdII+qs0/lXsaP3Q1hvQ9
	RQHIJQJylTamgHK3Sze0PT3i5lDQN8hoCSfK830Xt7erin6fY2C7frJ3sUrOU3B4e0ZZzjdz+tR
	Gb8PXLbeK/+uXaV0AG03uS6Ll6RIdp+c9pFYI8c5dEck76PvYOvOHANnxYsjRMbO0ZoQd6x4jrF
	BrZEcJ2iszDiSKnNDGBS6G6VciXQgRNdkU+/Job4ANE7IDcV7Pu/q9MFLu6Cz5/mvI1heZ1ibPj
	zLdio/hQ9Te0/MzHl939IKDxUBHhw635Sw3n6hiYnilWACp7vDZsb9l0C7BICGFlbFhqg5bZ4No
	fTs6phHKAqygiIlDRyJEvQqUy5khtc4RudHseBOnKDQZSfim31k4xIfPeFQgFZkLPE
X-Google-Smtp-Source: AGHT+IFeA+KUDy2tCnVcee7ZdawLOXLnOaNqd7nVMpZ986OShD2ECoKzFscQfjMlUU/Aar97zmJ5rQ==
X-Received: by 2002:a17:907:706:b0:b7c:e758:a79d with SMTP id a640c23a62f3a-b803717dbf0mr1784720366b.37.1766567150699;
        Wed, 24 Dec 2025 01:05:50 -0800 (PST)
Message-ID: <ace5aa8d-d192-4f6e-a0b7-0005f759d151@gmail.com>
Date: Wed, 24 Dec 2025 10:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen/riscv: add RISC-V legacy SBI extension support
 for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766399205.git.oleksii.kurochko@gmail.com>
 <f4225d3134ec12a392a2e5d91414bfdf9d0665a1.1766399205.git.oleksii.kurochko@gmail.com>
 <74eec4dc-de48-4060-8f87-ba04023fda17@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <74eec4dc-de48-4060-8f87-ba04023fda17@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/23/25 5:11 PM, Jan Beulich wrote:
> On 22.12.2025 17:37, Oleksii Kurochko wrote:
>> +static int vsbi_legacy_ecall_handler(unsigned long eid, unsigned long fid,
>> +                                     struct cpu_user_regs *regs)
>> +{
>> +    int ret = 0;
>> +
>> +    switch ( eid )
>> +    {
>> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
>> +        vsbi_print_char(regs->a0);
>> +        break;
>> +
>> +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
>> +        ret = SBI_ERR_NOT_SUPPORTED;
>> +        break;
>> +
>> +    default:
>> +        /*
>> +         * TODO: domain_crash() is acceptable here while things are still under
>> +         * development.
>> +         * It shouldn't stay like this in the end though: guests should not
>> +         * be punished like this for something Xen hasn't implemented.
>> +         */
>> +        domain_crash(current->domain,
>> +                     "%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",
> Hmm, wait - patch 1 says you would consistently use #%lu for FIDs. I can adjust
> while committing, unless you tell me not to.

I think that we should drop printing FID at all for Legacy extension as according to
the spec.:
   The SBI function ID field in a6 register is ignored because these are encoded as multiple SBI
   extension IDs.
And according to "Function Listing" FID will be 0:
   https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-legacy.adoc#function-listing

I would be happy if you could drop printing of FID during commit. Let me know if you want me to
drop printing of FID in the next patch series version.

Thanks.

~ Oleksii


