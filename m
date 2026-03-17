Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNfDItwauWn5qgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 10:11:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFDF2A6486
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 10:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255882.1550664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2QSS-0004n3-Vg; Tue, 17 Mar 2026 09:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255882.1550664; Tue, 17 Mar 2026 09:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2QSS-0004kV-Se; Tue, 17 Mar 2026 09:11:24 +0000
Received: by outflank-mailman (input) for mailman id 1255882;
 Tue, 17 Mar 2026 09:11:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kl79=BR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1w2QSR-0004kP-79
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2026 09:11:23 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43ff0f0b-21e1-11f1-b164-2bf370ae4941;
 Tue, 17 Mar 2026 10:11:21 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5a13a06fc85so6401099e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2026 02:11:21 -0700 (PDT)
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
X-Inumbo-ID: 43ff0f0b-21e1-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1773738681; cv=none;
        d=google.com; s=arc-20240605;
        b=Cuq5e9yuK5hVPuzTj55PmHKjrCcPvpy+DqH9V8z/FiUUH0lgcTNjfbVRMlpEm/PZAB
         undCQ+VO1OLeJeHUOA0cBPBBzkPfa9fcV9RktWgafgJGSYpRWQHfjbhs8tCyFa10SJsY
         XZJQRpZUCMAn3Wmu8Vxnt5FbwRxxSQqkTHKCl749+I55YfXy/OCgMxvcTpI2MmBi+vvU
         VRmfLb+AJZDTLqOdwJenk7WHuw6SIfvW240GM1llC1PjFcNT8KUgZGiAf29wrnBeU+bc
         DlmFUQRX0ghtSnlgDWisaTgTYNICuYd3BjUh1fVab0ShoRNkEjPfSN2kN/fReDOJ9zVw
         z1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nkEcKtGK7W0itPlp7juniLRhOMlFw+Hwy8TtIl/2+bc=;
        fh=faZgaLXBunWRu2fOSvCD2+wee1cBQ6SxC+e4j/V67JQ=;
        b=hmcPLQ/ydgpBb7iFUxzqWfCkWVV3t5ycDM4UDpQELErHItMYEbz9ZwBC2ATg17XHHr
         EsYG/C7othDBp2M3TsVajQ2Mwgqz91nWbwyv0clPVFTP0zIb5LKyB7gYctO9iDbVGf+H
         Regxzi2SeyVJiJGItkqdsMaNBGYs/dK2daC8k1xyGr6xpBm2aEsZQiYfpfwz1/eMzqJH
         tIk5i0lUxQigBXKVtbkPYFQlHe+kOUG1/xvyTZhADKsVt6bqrSFJ9/E8q2yg1Ro6e3e0
         MkNT4cZIdEGuuIPKxCVT5Mo1kGcvhPZICC8zFnoWoFc3YneDoPht+FdhqzhN/Que7Ak5
         gf3g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773738681; x=1774343481; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkEcKtGK7W0itPlp7juniLRhOMlFw+Hwy8TtIl/2+bc=;
        b=X0nRyIp/fJwLHKY5W5vnFCeGLq0VCblBQGJNZZ19wfvParEfQdGlJM1yVMLOO4P1Po
         1oyOh/YmAwDOkEZE6kcRnFbWY5aoVatPJ3OMkWPQ18kYLx8HPOehM2rOSNXUA+gQCm5A
         llAf6YTm5t9iYlXAbKAHCDIV6uot7NEsJI0nQDfAlNwhmBQx7WsyNRTsgzvXT9r0Fw2f
         HoSGSRgqiffrMIhbWeW1Dk2IWxygdNtaupmHEVyDdovg+7zPXCg8Fq163k9N1hA7aHYk
         d8jJZBOaLTyu3e0QSYsJTnx3pgDE3Ivqz9+Rm1ZzsE/gJRU5+xEC6D6CZHIUpaUV/G/Q
         GxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773738681; x=1774343481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nkEcKtGK7W0itPlp7juniLRhOMlFw+Hwy8TtIl/2+bc=;
        b=Q2vpcQCc7//0pkVUqmL8U8vNJUABaDA+tJ2hp0aGQP7ImLWDJrpM2WST/h7wEye3Qg
         Lgk59Px4zqlV7h2BEbfA0kJeFs/juOiPYZKm4H05rUIMEAbTNYbaavVY+huSka1zC3OV
         BkKSRRZxMwop+pou52iDd4SVFF1ocsfK7VawBlLKfRZrM7KZNWJGviB2PN6z6hYFr62+
         0GHZ/UQO3b4XGXCup4kuTXhB0LJgGxI0XF1Tardr0W2SBNemhhpxRO0WPROTAIbfsgwx
         FwsUmMWs6knPj8DUU6xBOO/SSjh91yG3TDbUOdAl5LPl/MXyaTBDeZK5fsbzcy9uDunz
         PDvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPvcZhmuHu7JGq7mHMabpTP1KYdk+kYjv0dui2bGREXPwHrqTLtwNMFBjQLSKz5TJUkwF4hb7sSg8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhmqIrCs3pGdwS4ZJgVP08eEYITrlj0XAZT8eQ+obIVu8LUC4y
	JYMHoK5yc9AnzHkoZT6hYGMXAuV5IjkIDCwTUEVVL14MXP6u7JHdRZsbqR3B5RCe960RgTLz8hD
	CwjKyjchR4AfvKFJY+3eAQJbLxR2fJok=
X-Gm-Gg: ATEYQzwudA4Busx+7n67ZSJ74mnlILeWwBarTVGiHzFFWgN5MGisCoSHE7ejZJSD4Ok
	ehcu8PCXGmr+b97b5sZ/ca6DjynP06zKvVZB4aDbK5V6KXVZv7GnpzZg4Vd5YtkNz4DsNUSmTa1
	efxAt3nWwSqFy7b4HFq8d/A47tPYWs0+GWQdB6XEoswIIfpNDT8737VeeDg/bvQzmreXIa3kfFZ
	fyR8iWioIXV+lbUa686EquPgXWVPQDuOaQMCyaeGKXsXfuJ0wmfnRZVca5Ygv6LqZEaOmScfPqV
	/yUpBWo=
X-Received: by 2002:a05:6512:3ba4:b0:5a1:3134:923f with SMTP id
 2adb3069b0e04-5a162b24c07mr5308582e87.40.1773738680825; Tue, 17 Mar 2026
 02:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <AC263D87-9EE3-4F32-BC5D-1A290781C48B@arm.com>
In-Reply-To: <AC263D87-9EE3-4F32-BC5D-1A290781C48B@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 17 Mar 2026 11:11:09 +0200
X-Gm-Features: AaiRm51BvAY87TTNqn85G45hupOR8_oL6EbbB1xjRRPC4u4fig0uXpxb01cGnlA
Message-ID: <CAGeoDV_a-tUGrQai8+VzQwwGHSGwbJ04Y6uWg-pr5mVi52dsaw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/19] GICv4 Support for Xen
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykyta Poturai <Mykyta_Poturai@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CCFDF2A6486
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bertrand,

On Tue, Feb 3, 2026 at 12:02=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykyta,
>
> We have a number of series from you which have not been merged yet and
> reviewing them all in parallel might be challenging.
>
> Would you mind giving us a status and maybe priorities on them.
>
> I could list the following series:
> - GICv4
> - CPU Hotplug on arm
> - PCI enumeration on arm
> - IPMMU for pci on arm
> - dom0less for pci passthrough on arm
> - SR-IOV for pvh
> - SMMU for pci on arm
> - MSI injection on arm
> - suspend to ram on arm
>
> There might be others feel free to complete the list.
>
> On GICv4...
>
> > On 2 Feb 2026, at 17:14, Mykyta Poturai <Mykyta_Poturai@epam.com> wrote=
:
> >
> > This series introduces GICv4 direct LPI injection for Xen.
> >
> > Direct LPI injection relies on the GIC tracking the mapping between phy=
sical and
> > virtual CPUs. Each VCPU requires a VPE that is created and registered w=
ith the
> > GIC via the `VMAPP` ITS command. The GIC is then informed of the curren=
t
> > VPE-to-PCPU placement by programming `VPENDBASER` and `VPROPBASER` in t=
he
> > appropriate redistributor. LPIs are associated with VPEs through the `V=
MAPTI`
> > ITS command, after which the GIC handles delivery without trapping into=
 the
> > hypervisor for each interrupt.
> >
> > When a VPE is not scheduled but has pending interrupts, the GIC raises =
a per-VPE
> > doorbell LPI. Doorbells are owned by the hypervisor and prompt reschedu=
ling so
> > the VPE can drain its pending LPIs.
> >
> > Because GICv4 lacks a native doorbell invalidation mechanism, this seri=
es
> > includes a helper that invalidates doorbell LPIs via synthetic =E2=80=
=9Cproxy=E2=80=9D devices,
> > following the approach used until GICv4.1.
> >
> > All of this work is mostly based on the work of Penny Zheng
> > <penny.zheng@arm.com> and Luca Fancellu <luca.fancellu@arm.com>. And al=
so from
> > Linux patches by Mark Zyngier.
> >
> > Some patches are still a little rough and need some styling fixes and m=
ore
> > testing, as all of them needed to be carved line by line from a giant ~=
4000 line
> > patch. This RFC is directed mostly to get a general idea if the propose=
d
> > approach is suitable and OK with everyone. And there is still an open q=
uestion
> > of how to handle Signed-off-by lines for Penny and Luca, since they hav=
e not
> > indicated their preference yet.
>
> I would like to ask how much performance benefits you could
> have with this.
> Adding GICv4 support is adding a lot of code which will have to be mainta=
ined
> and tested and there should be a good improvement to justify this.
>
> Did you do some benchmarks ? what are the results ?
>
> At the time where we started to work on that at Arm, we ended up in the c=
onclusion
> that the complexity in Xen compared to the benefit was not justifying it =
hence why
> this work was stopped in favor of other features that we thought would be=
 more
> beneficial to Xen (like PCI passthrough or SMMUv3).

I have been asked to run benchmarks for this series, so here is a short
update from my side.

Test setup:

- AWS c7g bare metal
- Linux bare-metal reference and Xen dom0 runs
- fio random-read workloads on an NVMe-backed EBS volume (gp3, 160G, 80k io=
ps)
- Main workloads:

- 4k, iodepth=3D1
- 16k, iodepth=3D1
- 4k, iodepth=3D4
- 4k, iodepth=3D1, numjobs=3D4
- 5 repetitions per configuration, looking mainly at median values
- Main Xen comparison was done with the default scheduler (credit2),
direct LPIs OFF vs ON

Summary:

- With credit2, enabling direct LPIs gave a small but repeatable IOPS
improvement across all tested workloads, roughly in the 0.8-1.1% range.
- Mean completion latency also improved consistently.
- The clearest gain was in tail latency. In the 4k randread,
iodepth=3D1, numjobs=3D4 case, p99.9 improved by about 41% and p99.99 by
about 34% with direct LPIs enabled.
- In this setup, switching from credit2 to null did not materially change
median throughput, so the observed improvement appears to come primarily
from the interrupt delivery path rather than from the scheduler choice.

A few caveats:

- This was a low-contention setup with only dom0 using 8 CPUs, so it did no=
t
exercise heavy VCPU migration or scheduler pressure.
- I also tried an artificially constrained NVMe host queue depth
configuration, but I am treating that only as a stress/control case and
not as the main result.

A full benchmark report is available here:
https://github.com/xakep-amatop/giv4-benchmark/blob/main/report.pdf

The same repository also contains the raw benchmark result archives used fo=
r
the analysis.

So, based on these measurements, there does appear to be a measurable
benefit from direct LPI injection, with the strongest effect showing up in
tail latency rather than in median throughput.

If you need any additional benchmark results or specific test cases, please
let me know.

Best regards,
Mykola

>
> Cheers
> Bertrand
>

