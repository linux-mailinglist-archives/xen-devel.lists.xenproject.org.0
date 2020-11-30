Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9A32C8297
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:51:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40998.74084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjglb-0005i5-33; Mon, 30 Nov 2020 10:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40998.74084; Mon, 30 Nov 2020 10:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgla-0005hg-Vq; Mon, 30 Nov 2020 10:50:46 +0000
Received: by outflank-mailman (input) for mailman id 40998;
 Mon, 30 Nov 2020 10:50:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3VR=FE=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kjggo-0004Aj-HG
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:45:50 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fce6a8ae-1655-4ee9-858f-ecb60cdda627;
 Mon, 30 Nov 2020 10:45:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e7so15506949wrv.6
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:45:39 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:8931:214a:807a:cb80])
 by smtp.gmail.com with ESMTPSA id a65sm7213049wmc.35.2020.11.30.02.45.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:45:38 -0800 (PST)
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
X-Inumbo-ID: fce6a8ae-1655-4ee9-858f-ecb60cdda627
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=/diZ7VyXKP6X0O8jl6ZE2tV3//7EXwwtnKHThnr1OrI=;
        b=EWstEzre2pVp1WZ73KD7U4Lc0jp6RrfMUZLmSEQDAYXR8SwrUJDwYbDBQMb3qkG9WO
         sRg6rnrh14Vrd7tmJh+nv0K8KO4YRrR+99SyzXSRLKlIIEgIAiYJaB5gC8pwuf3FGe6z
         YHukkUKEJPS/CJKrg76SYWrZb4mxevjNZvZQ2V9hUj3IvRlSyjp0Vd2+vAaUxYtV0Fvn
         thdmP22iJ3UlV+jjG1d3Q4ole60R0U8nMDlsUAMfFQqrcyvbAAVGspzkRtHWouA7yVrK
         O7L6Ff6DszFUCT1dB7VV+nUIjc9AKi+h9miDHCkCPkgON/7Y7JcOfasfn6GZJq1SRlbU
         lxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=/diZ7VyXKP6X0O8jl6ZE2tV3//7EXwwtnKHThnr1OrI=;
        b=V7zGdsONtvq0hODOWeG1vFhK1AuFwFeI6u2+YFvM4vkjt1vH2Q0GTpJ5MQPsOTt3nn
         RPPRsLkm5WH+9Q/Bgo2rr1KKtlXD1KeRgQn9C2zNE4IQcqiNZxYl3c4+PsYghRBCXiRV
         EHNhoh5Zg2sx+Jhx+wu1jIPez7hAqCJQ/tPQkZVD40UBzsIJ16JE3c+3E8PC1lWZAOXu
         JWBGMH9HzCKIrbD9csSv8bcZhUD5FEgRgK0df9JUaA8SxpHKOGrjBNb5GpTXPVtYZn4I
         Ck8tYrCaO4GneOrs4sowKnRijkJl4x5xdEXnD3LZmp4neCort/vCw5iFintHIBJqHRr3
         /Vww==
X-Gm-Message-State: AOAM530kx2s+jzK27hpi049YKNkWr7AVvJlnlCcll0TrNaiQX79RwCn7
	jUHCs5v8n6nw8YGn315brC4=
X-Google-Smtp-Source: ABdhPJxl2R2FeAhkgx28P0MkA80KZrR1KI2bcy0PiaoXvbbgPlycFWvcCZKFlvEmHyHfAOyawsweGA==
X-Received: by 2002:adf:82ca:: with SMTP id 68mr27203214wrc.332.1606733138482;
        Mon, 30 Nov 2020 02:45:38 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Kevin Tian'" <kevin.tian@intel.com>
References: <c78e09fa-606c-c6c4-e9db-b57cb50ee5e2@suse.com>
In-Reply-To: <c78e09fa-606c-c6c4-e9db-b57cb50ee5e2@suse.com>
Subject: RE: [PATCH v4] IOMMU: make DMA containment of quarantined devices optional
Date: Mon, 30 Nov 2020 10:45:37 -0000
Message-ID: <013601d6c705$f09fd9a0$d1df8ce0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI15LetYabIv76Hs54hT8VKRuHZ1akiP7Iw
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 27 November 2020 16:46
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant =
<paul@xen.org>; Kevin Tian
> <kevin.tian@intel.com>
> Subject: [PATCH v4] IOMMU: make DMA containment of quarantined devices =
optional
>=20
> Containing still in flight DMA was introduced to work around certain
> devices / systems hanging hard upon hitting a "not-present" IOMMU =
fault.
> Passing through (such) devices (on such systems) is inherently =
insecure
> (as guests could easily arrange for IOMMU faults of any kind to =
occur).
> Defaulting to a mode where admins may not even become aware of issues
> with devices can be considered undesirable. Therefore convert this =
mode
> of operation to an optional one, not one enabled by default.
>=20
> This involves resurrecting code commit ea38867831da ("x86 / iommu: set
> up a scratch page in the quarantine domain") did remove, in a slightly
> extended and abstracted fashion. Here, instead of reintroducing a =
pretty
> pointless use of "goto" in domain_context_unmap(), and instead of =
making
> the function (at least temporarily) inconsistent, take the opportunity
> and replace the other similarly pointless "goto" as well.
>=20
> In order to key the re-instated bypasses off of there (not) being a =
root
> page table this further requires moving the =
allocate_domain_resources()
> invocation from reassign_device() to amd_iommu_setup_domain_device() =
(or
> else reassign_device() would allocate a root page table anyway); this =
is
> benign to the second caller of the latter function.
>=20
> Take the opportunity and also limit the control to builds supporting
> PCI.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v4: "full" -> "scratch_page". Duplicate Kconfig help text into command
>     line doc. Re-base.
> v3: IOMMU_quarantine_basic -> IOMMU_quarantine_fault,
>     IOMMU_quarantine_full -> IOMMU_quarantine_write_fault. Kconfig
>     option (choice) to select default. Limit to HAS_PCI.
> v2: Don't use true/false. Introduce QUARANTINE_SKIP() (albeit I'm not
>     really convinced this is an improvement). Add comment.
>=20
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1278,7 +1278,7 @@ detection of systems known to misbehave
>  > Default: `new` unless directed-EOI is supported
>=20
>  ### iommu
> -    =3D List of [ <bool>, verbose, debug, force, required, =
quarantine,
> +    =3D List of [ <bool>, verbose, debug, force, required, =
quarantine[=3Dscratch-page],
>                  sharept, intremap, intpost, crash-disable,
>                  snoop, qinval, igfx, amd-iommu-perdev-intremap,
>                  dom0-{passthrough,strict} ]
> @@ -1316,11 +1316,32 @@ boolean (e.g. `iommu=3Dno`) can override t
>      will prevent Xen from booting if IOMMUs aren't discovered and =
enabled
>      successfully.
>=20
> -*   The `quarantine` boolean can be used to control Xen's behavior =
when
> -    de-assigning devices from guests.  If enabled (the default), Xen =
always
> +*   The `quarantine` option can be used to control Xen's behavior =
when
> +    de-assigning devices from guests.
> +
> +    When a PCI device is assigned to an untrusted domain, it is =
possible
> +    for that domain to program the device to DMA to an arbitrary =
address.
> +    The IOMMU is used to protect the host from malicious DMA by =
making
> +    sure that the device addresses can only target memory assigned to =
the
> +    guest.  However, when the guest domain is torn down, assigning =
the
> +    device back to the hardware domain would allow any in-flight DMA =
to
> +    potentially target critical host data.  To avoid this, =
quarantining
> +    should be enabled.  Quarantining can be done in two ways: In its =
basic
> +    form, all in-flight DMA will simply be forced to encounter IOMMU
> +    faults.  Since there are systems where doing so can cause host =
lockup,
> +    an alternative form is available where writes to memory will be =
made
> +    fault, but reads will be directed to a dummy page.  The =
implication
> +    here is that such reads will go unnoticed, i.e. an admin may not
> +    become aware of the underlying problem.
> +
> +    Therefore, if this option is set to true (the default), Xen =
always
>      quarantines such devices; they must be explicitly assigned back =
to Dom0
> -    before they can be used there again.  If disabled, Xen will only
> -    quarantine devices the toolstack hass arranged for getting =
quarantined.
> +    before they can be used there again.  If set to "scratch-page", =
still
> +    active DMA reads will additionally be directed to a "scratch" =
page.  If

There's inconsistency of terms here. We should choose either 'dummy =
page' or 'scratch page' (and my vote goes for the latter). Also, rather =
than true or false, shouldn't we have 'off', 'basic', and =
'scratch-page'?

  Paul


