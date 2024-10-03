Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 696F198EC58
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 11:36:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809236.1221459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swIFE-0001PT-W2; Thu, 03 Oct 2024 09:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809236.1221459; Thu, 03 Oct 2024 09:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swIFE-0001Ma-Sx; Thu, 03 Oct 2024 09:35:36 +0000
Received: by outflank-mailman (input) for mailman id 809236;
 Thu, 03 Oct 2024 09:35:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCg9=Q7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1swIFD-0001MU-Ng
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 09:35:35 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d727e413-816a-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 11:35:34 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5398f3be400so978158e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 02:35:34 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539a82ab175sm134156e87.283.2024.10.03.02.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 02:35:33 -0700 (PDT)
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
X-Inumbo-ID: d727e413-816a-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727948134; x=1728552934; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mTJ5NGdE4Obg9f7cUWc6IregmTSmjfZ1zSK5rlRzubo=;
        b=LY7KJjP9rAMPsk/7F6SwTwl1CNyZjS3dz5Zy9Wp7YOWJ2R8XqBnvjl9QhfvHBcBia2
         kiQcWJXqDk+VDI4arYy4UCgK35PvbAHCuZYr2umdP9aPkw2e9VLh8v5ptzVeMK3sNIP5
         Sv2UiipDnBXSp/A68X+v/uhMb6zu2vm9uNCh4KQggrwOdTHaS8dE5Grly7Lex1MGikCn
         qTk0h+s+/+p7/j4ukyGbYsYHj4rPd0oSlqFnuP5kf83EVj9d+a5nHliEnvZTu+7ZIHxO
         YyCAFOGRoqfx6YZLgB4mVEPK4gXrNmCEEvYhY4RxjOoixqs8A7XRq2wx2zyR3Jyavzh2
         BLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727948134; x=1728552934;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTJ5NGdE4Obg9f7cUWc6IregmTSmjfZ1zSK5rlRzubo=;
        b=NjXpB85YxM69URTv5AUD0Fg0Rj0cs91MLAIqTeBsw1ZBhg7Fo2fSoRl0WW0ACsY+5R
         xdqy/x3lg0zky98paBQxl2qA4dA3iWvNXZP2I9oYaFiyOr/odkuyFZDAufzjjjQGbSyi
         UKU1hT1mHKn3MPM2kdMDzfLqQlZIbtIl9dm54MPx6mW/pnuuZplwTDyboh7Gv8WvryPM
         cSuJOm7w3oUIIZh4bLx5WeZh5PC6sZIIAlHfKkM2uDn3GRD1faIKXOqnqj7/77YAdR3i
         aP1Yd6r1az/97r3qwUDjqS9FI7vUDq7rgKBL8tciu8e1wCu9krmFbC38vCiQu0KJ+63H
         U3aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLYPQZ6W2LWWtVyMugm7WCK/ZLuv4VnvIfXQZCENPVODAYxxpDaZrZKWIzJ+lHYp2MUHveB1zDz8U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywv33S8NJW8ctjrwnAvTb7+1ySICGdTY81taxbczeHGeAiHq3Bs
	AERo1fS9jPwOz+3AzOuT42+/V9ESIUhGCRuIwSom4sqDuT/1+IED
X-Google-Smtp-Source: AGHT+IGcsN08v1E8kiF+SMS90bY9gheXwnCzj93u7O8iLzGcoSougkFgId3zQyfj8i2MXAWQARGCLQ==
X-Received: by 2002:a05:6512:138d:b0:535:699b:b076 with SMTP id 2adb3069b0e04-539a0665826mr3827464e87.16.1727948133926;
        Thu, 03 Oct 2024 02:35:33 -0700 (PDT)
Message-ID: <5778c6f610e36fbb34485790a8ac3e2227518db5.camel@gmail.com>
Subject: Re: [PATCH v4] xen: move per-cpu area management into common code
From: oleksii.kurochko@gmail.com
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Thu, 03 Oct 2024 11:35:32 +0200
In-Reply-To: <1c930c7a-50a4-403d-a867-b569e1efced6@amd.com>
References: 
	<584dab4111041a660377f677cd829d4b2b4b8b2d.1727714022.git.oleksii.kurochko@gmail.com>
	 <1c930c7a-50a4-403d-a867-b569e1efced6@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-10-02 at 15:41 +0200, Michal Orzel wrote:
>=20
>=20
> On 30/09/2024 18:39, Oleksii Kurochko wrote:
> >=20
> >=20
> > Centralize per-cpu area management to reduce code duplication and
> > enhance maintainability across architectures.
> >=20
> > The per-cpu area management code, which is largely common among
> > architectures, is moved to a shared implementation in
> > xen/common/percpu.c. This change includes:
> > =C2=A0* Remove percpu.c from the X86 and Arm architectures.
> > =C2=A0* For x86, define INVALID_PERCPU_AREAS and PARK_OFFLINE_CPUS_VAR.
> > =C2=A0* Drop the declaration of __per_cpu_offset[] from stubs.c in
> > =C2=A0=C2=A0 PPC and RISC-V to facilitate the build of the common per-c=
pu
> > code.
> >=20
> > No functional changes for x86.
> >=20
> > For Arm add support of CPU_RESUME_FAILED, CPU_REMOVE and freeing of
> > percpu in the case when system_state !=3D SYS_STATE_suspend.
> Behaviorwise there is no change for Arm given that none of these
> actions can be executed.
> That said, by looking at the code I realized that we never call
> CPU_REMOVE so it is effectively
> a dead code.
There is no change for now but what I mean by this message if one day,
for example, enable_nonboot_cpus() will be called and park_offline_cpus
will be enabled/implemented for Arm then CPU_RESUME_FAILED will be
handled differently in comparison with original Arm code. In original
Arm code it will do just break but for common code it will do
free_percpu_area().
And the similar for CPU_REMOVE if park_offline_cpus is enabled and
cpu_notifier_call_chain(..., CPU_REMOVE,...) will be called then the
behaviour of common code will be different from Arm code.

Do you think it would be better just drop this part of the commit
message?
Or would it be better to add:
  ...(what I wrote before), however, there is no change in behavior for
Arm at this time.

>=20
> As for the change itself:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>=20
> with one question below ...
>=20
> [...]
>=20
> > +static int cf_check cpu_percpu_callback(
> > +=C2=A0=C2=A0=C2=A0 struct notifier_block *nfb, unsigned long action, v=
oid *hcpu)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned int cpu =3D (unsigned long)hcpu;
> > +=C2=A0=C2=A0=C2=A0 int rc =3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0 switch ( action )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 case CPU_UP_PREPARE:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D init_percpu_area(cpu=
);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +=C2=A0=C2=A0=C2=A0 case CPU_UP_CANCELED:
> > +=C2=A0=C2=A0=C2=A0 case CPU_DEAD:
> > +=C2=A0=C2=A0=C2=A0 case CPU_RESUME_FAILED:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !park_offline_cpus && =
system_state !=3D
> > SYS_STATE_suspend )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fre=
e_percpu_area(cpu);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +=C2=A0=C2=A0=C2=A0 case CPU_REMOVE:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( park_offline_cpus )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fre=
e_percpu_area(cpu);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> Aren't we missing default statement here as per MISRA C 16.4?
> I think we only allow to drop it for enums.
Yes, you are right:
https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-pro=
ject/people/olkur/xen/ECLAIR_normal/percpu-common-v4/X86_64/7975314011/PROJ=
ECT.ecd;/sources/xen/common/percpu.c.html#R5092_1

I will add then:
	default:
	   break;

Thanks.

Best regards,
 Oleksii

