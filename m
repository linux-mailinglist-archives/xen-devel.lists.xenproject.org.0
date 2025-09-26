Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14916BA32F0
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 11:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131371.1470491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v24t9-00063J-Pj; Fri, 26 Sep 2025 09:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131371.1470491; Fri, 26 Sep 2025 09:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v24t9-00060n-MT; Fri, 26 Sep 2025 09:37:15 +0000
Received: by outflank-mailman (input) for mailman id 1131371;
 Fri, 26 Sep 2025 09:37:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sfwB=4F=gmail.com=igor.korkin@srs-se1.protection.inumbo.net>)
 id 1v24t8-00060h-JT
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 09:37:14 +0000
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60e69191-9abc-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 11:37:13 +0200 (CEST)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-b5526b7c54eso1234564a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Sep 2025 02:37:12 -0700 (PDT)
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
X-Inumbo-ID: 60e69191-9abc-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758879431; x=1759484231; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l25PVufoEze1lltftXdbDqYNubL4UHrPe2LpDNcvXBY=;
        b=f65lQzQpW7ZlRdm3wVTvZO+qOAlJyrXP/Id3K9fMy/FpstSnoJYtPlvKJbSBvwcjQr
         v1L6oLxzyjivbErdYQt1jHdROVE6U3gF/ECF1/aMc6Ql5MY/d8Gf00Y1LGqPgH2PrPGb
         rykw/gd5bmWa70f6pNOqb4umUfvuhIvKXq6JP/mOFgG6e1RvN06R1+Tyj5YT1LecPsbj
         24fgh4evyGVVNh1nVOzfc4nDSbYHD+OqPcP5BAq8P7r3T17PEN0/lKHC2vTdz7S8Zt2C
         RhlUG6KuEg9PCpXBfEMSqhs2JWFH4EzxelvzPfcQiXjulK4MHjEFlBXEdRLU5QvLorRo
         E1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758879431; x=1759484231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l25PVufoEze1lltftXdbDqYNubL4UHrPe2LpDNcvXBY=;
        b=Oh2XbrspzYcIXvtu8FtwsWG8IHprfgW7fQgboQ3Qau1OP3grfEgabd0XAq5RIW7PdD
         RYK2bd1P3YyYT09Pwc5C3PrwPYwETuZcI48c3FT+SO7htc54pbH/MQJ4n27vfLt8OmkD
         MgdhPgJNcjr3JL8RzVxgqmS9vXp4n3nc7VzO8hxN+F8z/SuJhy6nTRCVJRHp44FWuOId
         oNLUNd+cq/EtMFjLh5PGhhnXHiPWgGhC35YZAxckqfB252RjRcgB/Lgg7/ONuiK5Gd5h
         iyDC4gMr2i42zh1ij37TV5XDwxN7Qvo9BJwxZ2GIKnY+oHUflYXr8hto8PYo+XUj+1u/
         /bBQ==
X-Gm-Message-State: AOJu0YxIv7SssPOgXgznqP6wT+aYLgY0Tyvqqtxoosz3fesNTWX4Ahrh
	6GCTcu7eFrwdTQ5h0YVTIO9ZaSx//ekeqARuohhhpVQAZTg3+kGBFMX66OV8c3uTZFVyDiW9l8N
	z//IwmHcYQgXcJtlk6nobMDU/zug43qY=
X-Gm-Gg: ASbGnct4EVUxCyGIrxCJykhTUE5cwGF+61J7F+4kiF2v9GciGp3fMdlNLFqX7tRnS3G
	S0CRQZ0/9ZaMbNtorECQpj5wl3HbfWTFy1JVqPAPDxFmm1BDixY2PKwZ8bK9EF2jqLLGwzEXK/W
	6X6z/ROJgXWkQ6T9u1pQZ8+Ebtv2h+JbZeipAjJyYJXtVeEKAmi/Dr52Jny1ifQHREjkiAsqtHW
	KmilvvmZ4ksCqR+hFV+YmXIXQ==
X-Google-Smtp-Source: AGHT+IGvR8SV/U37a8hFNtpHhTlAXy36hymiGG+1KSM38jqu6jDkntFCoeNI1IUJ2lkHyDsjyYW6NJT7Es7Kd9I59R4=
X-Received: by 2002:a17:902:da2d:b0:269:8fa3:c227 with SMTP id
 d9443c01a7336-27ed4a06e11mr63322165ad.8.1758879431129; Fri, 26 Sep 2025
 02:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAC8oKvry6UFOE6B9dkfWFPEkehc3o4w+xJPZJe-sUpks6WmzNA@mail.gmail.com>
 <9a2c77f3-fbdf-4d8a-8793-7d75f9ffb538@suse.com>
In-Reply-To: <9a2c77f3-fbdf-4d8a-8793-7d75f9ffb538@suse.com>
From: Igor Korkin <igor.korkin@gmail.com>
Date: Fri, 26 Sep 2025 12:36:59 +0300
X-Gm-Features: AS18NWBpkFu3A_mdBzBkqIT9gHx5bnplecRr_TC30gGI5cz2NTWt3qPb9Ct8GV4
Message-ID: <CAC8oKvq5iMWaZS2UzQnYUiZY9uh7UwPPDNJhPZdYufFQaFoJ_Q@mail.gmail.com>
Subject: Re: [Question] Unexpected growth of nr_cpu in `credit` Xen scheduler?
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the answer

The information about xl debug-keys r I will provide soon.

Here is the output of `xl info`:

developer@host:~$ sudo xl info
host                   : host
release                : 6.1.0-38-amd64
version                : #1 SMP PREEMPT_DYNAMIC Debian 6.1.147-1 (2025-08-0=
2)
machine                : x86_64
nr_cpus                : 48
max_cpu_id             : 47
nr_nodes               : 2
cores_per_socket       : 12
threads_per_core       : 2
cpu_mhz                : 2100.002
hw_caps                :
bfebfbff:77fef3ff:2c100800:00000121:0000000f:f3bfbfff:00405f4e:00000100
virt_caps              : pv hvm hvm_directio pv_directio hap shadow
iommu_hap_pt_share vmtrace gnttab-v1 gnttab-v2
total_memory           : 130724
free_memory            : 54067
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 19
xen_extra              : .3-pre
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p
hvm-3.0-x86_64
xen_scheduler          : credit
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          : Tue Jan 30 21:22:03 2024 +0100 git:199f7986eb-dirt=
y
xen_commandline        : placeholder hap_1gb=3D0 hap_2mb=3D0 altp2m=3D1
hpet=3Dlegacy-replacement sched=3Dcredit dom0_mem=3D-54068M,max:-54068M
dom0_max_vcpus=3D48 dom0_vcpus_pin=3D1 force-ept=3D1 ept=3Dad=3D0 max_cstat=
e=3D0
dom0-iommu=3Dpassthrough=3D1 watchdog=3Dforce watchdog_timeout=3D20
spec-ctrl=3Dno no-real-mode edd=3Doff
cc_compiler            : x86_64-linux-gnu-gcc (Debian 12.2.0-14+deb12u1) 12=
.2.0
cc_compile_by          : pkg-xen-devel
cc_compile_domain      : lists.alioth.debian.org
cc_compile_date        : Tue Sep 23 08:15:41 UTC 2025
build_id               : c3666203ea8a9657a1bcf35f963e9371e5cb51dd
xend_config_format     : 4


developer@host:~$ sudo xl cpupool-list
Name               CPUs   Sched     Active   Domain count
Pool-0              48   credit       y


developer@host:~$ sudo dmesg | grep -i hotplug
[    3.167091] smpboot: Allowing 48 CPUs, 0 hotplug CPUs


Thank you!


On Fri, Sep 26, 2025 at 11:04=E2=80=AFAM Juergen Gross <jgross@suse.com> wr=
ote:
>
> On 26.09.25 09:17, Igor Korkin wrote:
> > Hi all,
> >
> > I'm observing a steady and abnormal increase in the `nr_cpu` value
> > reported by the `credit` Xen scheduler
> > (visible via `sudo xl dmesg; sudo xl debug-keys r`).
> >
> >
> > This behavior occurs consistently when the system is subjected to
> > heavy synthetic load (e.g., multiple VMs running stress workloads that
> > fully saturate vCPUs).
> > Over time, `nr_cpu` grows far beyond the actual number of physical or
> > logical CPUs (48 in our case), and this correlates with noticeable
> > performance degradation, especially under high VM density.
>
> Can you please share the related output? Especially one instance of
> the "xl debug-keys r; xl dmesg" before the test is starting, and one
> with the wrong number of cpus in the data.
> > We=E2=80=99re running on a dual-socket x86_64 server (2 =C3=97 12-core =
Intel Xeon
> > Silver 4310 CPUs with Hyper-Threading, total 48 logical CPUs) under
> > Xen 4.19.
> >
> > Is this growth of `nr_cpu` expected in the credit scheduler?
> > If not, it may indicate a bug in CPU accounting or runqueue management
> > that warrants further investigation.
> >
> >
> > Environment details:
> > - xen_version            : 4.19.0-5.25.0.38431
> > - xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32
> > hvm-3.0-x86_32p hvm-3.0-x86_641
> > - xen_scheduler          : credit
> > - Hardware : Dual-socket Intel Xeon Silver 4310 @ 2.10GHz (12
> > cores/socket, HT enabled, 48 logical CPUs)
> > - NUMA nodes : 2
> > - Dom0 kernel : Debian 6.1.147-1 (6.1.0-38-amd64, SMP PREEMPT_DYNAMIC)
> > - nr_cpus                : 48
> > - nr_nodes               : 2
> > - release                : 6.1.0-38-amd64
> > - version                : #1 SMP PREEMPT_DYNAMIC Debian 6.1.147-1 (202=
5-08-02)
> > - machine                : x86_64
> > - nr_nodes               : 2
> > - cores_per_socket       : 12
> > - threads_per_core       : 2
> > - cpu_mhz                : 2100.000
> > - virt_caps              : pv hvm hvm_directio pv_directio hap shadow
> > iommu_hap_pt_share vmtrace gnttab-v1 gnttab-v2
> > - total_memory           : 130724
> > - free_memory            : 54064
> Please share the complete "xl info" output, including the xen command lin=
e.
>
> Are there any cpupools involved? Any cpu hotplug operations?
>
>
> Juergen

