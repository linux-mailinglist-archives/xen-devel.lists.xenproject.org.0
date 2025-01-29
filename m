Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B30A2207D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 16:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879207.1289429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdA4F-0006qD-8U; Wed, 29 Jan 2025 15:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879207.1289429; Wed, 29 Jan 2025 15:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdA4F-0006pH-5E; Wed, 29 Jan 2025 15:33:27 +0000
Received: by outflank-mailman (input) for mailman id 879207;
 Wed, 29 Jan 2025 15:33:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lGVs=UV=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1tdA4E-0006oQ-2Y
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 15:33:26 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60582cfb-de56-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 16:33:24 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso50738805e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 07:33:23 -0800 (PST)
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
X-Inumbo-ID: 60582cfb-de56-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738164803; x=1738769603; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ozyR5rYO3UM8Xpf+WbwbVauvZHmYNlQD8ZmfWR8sTI=;
        b=O2MKuBhvJJGBDszeKziDRXeQSk2229bASF1gopxMFpC7T65cREZl+sv8xU6Z35S6IL
         qC7x4fRfXg28kNOSCnyYnzr/4IOutrprX6Mgmj94+QSggTZ1FF+F5ROEdY+6qjqNJJNt
         OIrH3w3ng+iI7shDSUpm9aabSghI3U/xvDksN//L5Na2KP3/jwB2Cs9EJ4BGzpp2eGTc
         77ulRu1IMtjJQhCPm8i3h+IvgXSS3LIEvkq2gX5YeebZz+Vt4dtirpDZN0N8N28aZ/7U
         3z1cKIiGw8+JH38aTNBD287S/vjxFR0phL8Cj3rBSNkcbukd/ZV9k7xOEJDbMeJqtZFN
         n87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738164803; x=1738769603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ozyR5rYO3UM8Xpf+WbwbVauvZHmYNlQD8ZmfWR8sTI=;
        b=VVsLZul7i8GxDbwgbxzb2INPaybGyi0zG+XXnQgBboabLI1wavp0HlnIrbpOQ93M+u
         HsunhYEyAW8hoVRYWQpPTTVVshEO3sKxTQEMyb8W9w3nwELQQFXHRkIto/nIbIpLtJMo
         M4YwW7llayzxASUe2zuMyrooFGt7MfEOnJ685DryqKf2qNiIEt0FB0DbvtIQPriUaKCR
         4ZAmGiN39Trt6wQ9RqPs6gLnX3sgmi6RK+d7MdG+6vLeqON+c/zYr0L5P0Rno4PC4Kov
         iPHFGXlB2+hU6ZO/6jQNHqJygDJkbrQpXQCSI1BEpkMaCCf2H0upUwJjvco4S5Drl82R
         u5Cg==
X-Gm-Message-State: AOJu0YwG2urPALYf1HiYYYeTyGPty5ykVXrsubxS1Gcjyl2GFSzd4Vww
	XJCeibx7evYTysXTs7sZ+PwAJJCmjbqDHdhf0eLiwsG3GvgMaQmNKJt6RUR6POiGd02wAxeA5JK
	Rs0zYXDDHtkBL/iUjTZ83alH+cF8=
X-Gm-Gg: ASbGnctNYqudsKO9uSCtlO2ZWmf5MbB3VzD3omybp2PkCRPXbA9COITP4X1E/KR19sK
	FI2xWouKgNVE+y54+tc5+6CY4RyThrkbUi63e76JU7iRDVUf2U94NDOu1gynxR3OyQ/FMuMA=
X-Google-Smtp-Source: AGHT+IHrduHzLf7wTGckZY9XGvGJmoOUtCQJn4bhhJkNXz3tKE2FYgEhvoAhzFcnHqP8ONEGY0N9uW3FfskG328/UMM=
X-Received: by 2002:a05:600c:1d1e:b0:434:f623:9ff3 with SMTP id
 5b1f17b1804b1-438dc3caaf4mr34666605e9.15.1738164802940; Wed, 29 Jan 2025
 07:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20250114195010.3409094-1-ayan.kumar.halder@amd.com> <20250114195010.3409094-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20250114195010.3409094-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 29 Jan 2025 12:33:10 -0300
X-Gm-Features: AWEUYZl8Xk5mXk0DVTE9PVwKqnuaqc6dOqIgefWuLRmiNQgsPapxHFF2HsqIRNE
Message-ID: <CAJ=z9a1ynFU86ac=1Q7i=xSNh2bjnZJ3+tPjsjWvfw7294n_NA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
Content-Type: multipart/alternative; boundary="000000000000a3f754062cda0721"

--000000000000a3f754062cda0721
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 14 Jan 2025 at 16:50, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
wrote:

> We have written the requirements for some of the commands of the
> XEN_VERSION
> hypercall.
>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>  .../design-reqs/arm64/version_hypercall.rst   | 33 ++++++++
>  .../reqs/design-reqs/version_hypercall.rst    | 65 +++++++++++++++
>  docs/fusa/reqs/index.rst                      |  2 +
>  .../reqs/product-reqs/version_hypercall.rst   | 82 +++++++++++++++++++
>  4 files changed, 182 insertions(+)
>  create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
>  create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst
>
> diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> new file mode 100644
> index 0000000000..1dad2b84c2
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
> @@ -0,0 +1,33 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Capabilities
> +------------
> +
> +`XenSwdgn~arm64_capabilities~1`
> +
> +Description:
> +Xen shall have a internal constant string storing "xen-3.0-aarch64".


Can you explain why we need to specify how Xen is storing the string? At
least to me this feels a bit overkill. What matters is what/how the VM is
seen.


> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_capabilities_cmd~1`
> +
> +Capabilities AArch32
> +--------------------
> +
> +`XenSwdgn~arm64_capabilities_aarch32~1`
> +
> +Description:
> +Xen shall have a internal constant string storing "xen-3.0-armv7l" when it
> +detects that the cpu is running in AArch32 mode.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_capabilities_cmd~1`
> +
> diff --git a/docs/fusa/reqs/design-reqs/version_hypercall.rst
> b/docs/fusa/reqs/design-reqs/version_hypercall.rst
> new file mode 100644
> index 0000000000..8bb7a66576
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/version_hypercall.rst
> @@ -0,0 +1,65 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Version
> +-------
> +
> +`XenSwdgn~version~1`
> +
> +Description:
> +Xen shall have a internal constant storing the version number coming from
> the
> +Makefile.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_version_cmd~1`
> +
> +Subversion
> +----------
> +
> +`XenSwdgn~subversion~1`
> +
> +Description:
> +Xen shall have a internal constant storing the sub version number coming
> from
> +the Makefile.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_version_cmd~1`
> +
> +Extraversion
> +------------
> +
> +`XenSwdgn~extraversion~1`
> +
> +Description:
> +Xen shall have a internal constant string storing the extraversion coming
> from
> +the build environment.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_extraversion_cmd~1`
> +
> +Changeset
> +---------
> +
> +`XenSwdgn~changeset~1`
> +
> +Description:
> +Xen shall have a internal constant string storing the date, time and git
> hash
> +of the last change made to Xen's codebase.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_changeset_cmd~1`
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index d8683edce7..b85af19d19 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -14,3 +14,5 @@ Requirements documentation
>     design-reqs/arm64/generic-timer
>     design-reqs/arm64/sbsa-uart
>     design-reqs/arm64/hypercall
> +   design-reqs/arm64/version_hypercall
> +   design-reqs/version_hypercall
> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst
> b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> index fdb8da04e1..10bc7b6e87 100644
> --- a/docs/fusa/reqs/product-reqs/version_hypercall.rst
> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> @@ -59,3 +59,85 @@ Covers:
>  Needs:
>   - XenSwdgn
>
> +Version command
> +---------------
> +
> +`XenProd~version_hyp_version_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 0) for  hypercall (num 17) to retrieve
> Xen's
> +version in the domain's x0 register.


> +
> +Rationale:
> +
> +Comments:
> +Xen version is composed of major and minor number.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Extraversion command
> +--------------------
> +
> +`XenProd~version_hyp_extraversion_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 1) for hypercall (num 17) to copy its
> +extraversion in the domain's buffer.


> +
> +Rationale:
> +
> +Comments:
> +Xen's extra version consists of a string passed with 'XEN_VENDORVERSION'
> command
> +line parameter while building Xen.


Not really. It returns a truncated version if it is too large. You likely
want to describe command 11.



> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Capabilities command
> +--------------------
> +
> +`XenProd~version_hyp_capabilities_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 3) for hypercall (num 17) to copy its
> +capabilities to the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Capabilities related information is represented by char[1024].
> +For Arm64, the capabilities should contain "xen-3.0-aarch64" string.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Changeset command
> +-----------------
> +
> +`XenProd~version_hyp_changeset_cmd~1`
> +
> +Description:
> +Xen shall provide a command (num 4) for hypercall (num 17) to copy
> changeset
> +to the domain's buffer.
> +
> +Rationale:
> +
> +Comments:
> +Changeset is string denoting the date, time and git hash of the last
> change
> +made to Xen's codebase.
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> --
> 2.25.1
>
>
>

--000000000000a3f754062cda0721
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,</div><div dir=3D"auto"><br></div><div dir=3D"auto"><d=
iv class=3D"gmail_quote gmail_quote_container" dir=3D"auto"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, 14 Jan 2025 at 16:50, Ayan Kumar Halder &lt;=
<a href=3D"mailto:ayan.kumar.halder@amd.com">ayan.kumar.halder@amd.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)">We have written the requirements for s=
ome of the commands of the XEN_VERSION<br>
hypercall.<br>
<br>
Signed-off-by: Ayan Kumar Halder &lt;<a href=3D"mailto:ayan.kumar.halder@am=
d.com" target=3D"_blank">ayan.kumar.halder@amd.com</a>&gt;<br>
---<br>
=C2=A0.../design-reqs/arm64/version_hypercall.rst=C2=A0 =C2=A0| 33 ++++++++=
<br>
=C2=A0.../reqs/design-reqs/version_hypercall.rst=C2=A0 =C2=A0 | 65 ++++++++=
+++++++<br>
=C2=A0docs/fusa/reqs/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
=C2=A0.../reqs/product-reqs/version_hypercall.rst=C2=A0 =C2=A0| 82 ++++++++=
+++++++++++<br>
=C2=A04 files changed, 182 insertions(+)<br>
=C2=A0create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall=
.rst<br>
=C2=A0create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst<b=
r>
<br>
diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/docs/=
fusa/reqs/design-reqs/arm64/version_hypercall.rst<br>
new file mode 100644<br>
index 0000000000..1dad2b84c2<br>
--- /dev/null<br>
+++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst<br>
@@ -0,0 +1,33 @@<br>
+.. SPDX-License-Identifier: CC-BY-4.0<br>
+<br>
+Capabilities<br>
+------------<br>
+<br>
+`XenSwdgn~arm64_capabilities~1`<br>
+<br>
+Description:<br>
+Xen shall have a internal constant string storing &quot;xen-3.0-aarch64&qu=
ot;.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Can you expl=
ain why we need to specify how Xen is storing the string? At least to me th=
is feels a bit overkill. What matters is what/how the VM is seen.</div><div=
 dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
+<br>
+Rationale:<br>
+<br>
+Comments:<br>
+<br>
+Covers:<br>
+ - `XenProd~version_hyp_capabilities_cmd~1`<br>
+<br>
+Capabilities AArch32<br>
+--------------------<br>
+<br>
+`XenSwdgn~arm64_capabilities_aarch32~1`<br>
+<br>
+Description:<br>
+Xen shall have a internal constant string storing &quot;xen-3.0-armv7l&quo=
t; when it<br>
+detects that the cpu is running in AArch32 mode.<br>
+<br>
+Rationale:<br>
+<br>
+Comments:<br>
+<br>
+Covers:<br>
+ - `XenProd~version_hyp_capabilities_cmd~1`<br>
+<br>
diff --git a/docs/fusa/reqs/design-reqs/version_hypercall.rst b/docs/fusa/r=
eqs/design-reqs/version_hypercall.rst<br>
new file mode 100644<br>
index 0000000000..8bb7a66576<br>
--- /dev/null<br>
+++ b/docs/fusa/reqs/design-reqs/version_hypercall.rst<br>
@@ -0,0 +1,65 @@<br>
+.. SPDX-License-Identifier: CC-BY-4.0<br>
+<br>
+Version<br>
+-------<br>
+<br>
+`XenSwdgn~version~1`<br>
+<br>
+Description:<br>
+Xen shall have a internal constant storing the version number coming from =
the<br>
+Makefile.<br>
+<br>
+Rationale:<br>
+<br>
+Comments:<br>
+<br>
+Covers:<br>
+ - `XenProd~version_hyp_version_cmd~1`<br>
+<br>
+Subversion<br>
+----------<br>
+<br>
+`XenSwdgn~subversion~1`<br>
+<br>
+Description:<br>
+Xen shall have a internal constant storing the sub version number coming f=
rom<br>
+the Makefile.<br>
+<br>
+Rationale:<br>
+<br>
+Comments:<br>
+<br>
+Covers:<br>
+ - `XenProd~version_hyp_version_cmd~1`<br>
+<br>
+Extraversion<br>
+------------<br>
+<br>
+`XenSwdgn~extraversion~1`<br>
+<br>
+Description:<br>
+Xen shall have a internal constant string storing the extraversion coming =
from<br>
+the build environment.<br>
+<br>
+Rationale:<br>
+<br>
+Comments:<br>
+<br>
+Covers:<br>
+ - `XenProd~version_hyp_extraversion_cmd~1`<br>
+<br>
+Changeset<br>
+---------<br>
+<br>
+`XenSwdgn~changeset~1`<br>
+<br>
+Description:<br>
+Xen shall have a internal constant string storing the date, time and git h=
ash<br>
+of the last change made to Xen&#39;s codebase.<br>
+<br>
+Rationale:<br>
+<br>
+Comments:<br>
+<br>
+Covers:<br>
+ - `XenProd~version_hyp_changeset_cmd~1`<br>
diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst<br>
index d8683edce7..b85af19d19 100644<br>
--- a/docs/fusa/reqs/index.rst<br>
+++ b/docs/fusa/reqs/index.rst<br>
@@ -14,3 +14,5 @@ Requirements documentation<br>
=C2=A0 =C2=A0 design-reqs/arm64/generic-timer<br>
=C2=A0 =C2=A0 design-reqs/arm64/sbsa-uart<br>
=C2=A0 =C2=A0 design-reqs/arm64/hypercall<br>
+=C2=A0 =C2=A0design-reqs/arm64/version_hypercall<br>
+=C2=A0 =C2=A0design-reqs/version_hypercall<br>
diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/=
reqs/product-reqs/version_hypercall.rst<br>
index fdb8da04e1..10bc7b6e87 100644<br>
--- a/docs/fusa/reqs/product-reqs/version_hypercall.rst<br>
+++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst<br>
@@ -59,3 +59,85 @@ Covers:<br>
=C2=A0Needs:<br>
=C2=A0 - XenSwdgn<br>
<br>
+Version command<br>
+---------------<br>
+<br>
+`XenProd~version_hyp_version_cmd~1`<br>
+<br>
+Description:<br>
+Xen shall provide a command (num 0) for=C2=A0 hypercall (num 17) to retrie=
ve Xen&#39;s<br>
+version in the domain&#39;s x0 register.</blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=
=3D"auto"><br>
+<br>
+Rationale:<br>
+<br>
+Comments:<br>
+Xen version is composed of major and minor number.<br>
+<br>
+Covers:<br>
+ - `XenMkt~version_hypercall~1`<br>
+<br>
+Needs:<br>
+ - XenSwdgn<br>
+<br>
+Extraversion command<br>
+--------------------<br>
+<br>
+`XenProd~version_hyp_extraversion_cmd~1`<br>
+<br>
+Description:<br>
+Xen shall provide a command (num 1) for hypercall (num 17) to copy its<br>
+extraversion in the domain&#39;s buffer.</blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=
=3D"auto"><br>
+<br>
+Rationale:<br>
+<br>
+Comments:<br>
+Xen&#39;s extra version consists of a string passed with &#39;XEN_VENDORVE=
RSION&#39; command<br>
+line parameter while building Xen.</blockquote><div dir=3D"auto"><br></div=
><div dir=3D"auto">Not really. It returns a truncated version if it is too =
large. You likely want to describe command 11.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;pad=
ding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
+<br>
+Covers:<br>
+ - `XenMkt~version_hypercall~1`<br>
+<br>
+Needs:<br>
+ - XenSwdgn<br>
+<br>
+Capabilities command<br>
+--------------------<br>
+<br>
+`XenProd~version_hyp_capabilities_cmd~1`<br>
+<br>
+Description:<br>
+Xen shall provide a command (num 3) for hypercall (num 17) to copy its<br>
+capabilities to the domain&#39;s buffer.<br>
+<br>
+Rationale:<br>
+<br>
+Comments:<br>
+Capabilities related information is represented by char[1024].<br>
+For Arm64, the capabilities should contain &quot;xen-3.0-aarch64&quot; str=
ing.<br>
+<br>
+Covers:<br>
+ - `XenMkt~version_hypercall~1`<br>
+<br>
+Needs:<br>
+ - XenSwdgn<br>
+<br>
+Changeset command<br>
+-----------------<br>
+<br>
+`XenProd~version_hyp_changeset_cmd~1`<br>
+<br>
+Description:<br>
+Xen shall provide a command (num 4) for hypercall (num 17) to copy changes=
et<br>
+to the domain&#39;s buffer.<br>
+<br>
+Rationale:<br>
+<br>
+Comments:<br>
+Changeset is string denoting the date, time and git hash of the last chang=
e<br>
+made to Xen&#39;s codebase.<br>
+<br>
+Covers:<br>
+ - `XenMkt~version_hypercall~1`<br>
+<br>
+Needs:<br>
+ - XenSwdgn<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000a3f754062cda0721--

