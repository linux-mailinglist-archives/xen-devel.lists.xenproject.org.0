Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0843BE284
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 07:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151938.280744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1060-0003Xa-AN; Wed, 07 Jul 2021 05:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151938.280744; Wed, 07 Jul 2021 05:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1060-0003VP-6v; Wed, 07 Jul 2021 05:27:40 +0000
Received: by outflank-mailman (input) for mailman id 151938;
 Wed, 07 Jul 2021 05:27:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u0Kw=L7=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1m105z-0003VJ-6N
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 05:27:39 +0000
Received: from mail-ot1-x32e.google.com (unknown [2607:f8b0:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98b8dc18-be9f-4e17-997e-8ff25bc3699c;
 Wed, 07 Jul 2021 05:27:35 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 l17-20020a9d6a910000b029048a51f0bc3cso1110225otq.13
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 22:27:35 -0700 (PDT)
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
X-Inumbo-ID: 98b8dc18-be9f-4e17-997e-8ff25bc3699c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=j7XHXVF9YD1avJZZrZLGLUlPl2pc8rskIvlEiSY7aj4=;
        b=dmKDfM+w+kKBkOO48bxIH03f/EzYE4wLhNSBONeBsVWuPG3XsFLEX226sew6hYP8yt
         ToO7xVIUYh4w75pZwKJJmwk8Q5hr58d23VFLgvQtB1ZTyEScalmdMLwC3bR89bmhuqAT
         er/SoCo+WlbB7I5goBPzo2SW9wOYjzANuriUH1panFRMUu/vZ2BvlupFemiCTzK2VLb/
         4suRmFoMz9HN3Dx3AmHzlp3f3uWuXHLgGMuuy1Re3RwJq3YM9ozcy2dqicSPteCXIkF6
         T7Ucb6EYoS0e843xvQI824XRrxirna7+GgMFjzrSyFL0cMiINERz5UlUbv7P48/2FyUZ
         I1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j7XHXVF9YD1avJZZrZLGLUlPl2pc8rskIvlEiSY7aj4=;
        b=KHhnx35u8XcUuJSsb8WzM51pXjSi1M8AJ3Gokw1uMScx9pUGGbkcZaaEm/Ckk3iKBS
         xpgeHh8KzWMEXadmidVw8SU7zJTX7DPDbt4BwnVoigv2pFYxIXO7kmOrHgk+lGD3avTO
         1QJqEWWLUNch/5LY4s2e1oBCxXcg/WD1Bl5MAJMZAVDNQ0qF7wJot3XcgHRbUiVsDf2C
         5g/oJNpuwKkzU7gLuK0f/jXLz5xwlUGDAowd/WsG9BHIKZlRWTZw2WdQzEHfSw1l3Rna
         IxVgJ9wWGovZ6aIoJA6nFcy8wrvwR5o8vl2ZV/TAzJbDmp47WrJJM2GxMl3ylk3FcS5t
         nTOA==
X-Gm-Message-State: AOAM532ICK4xBWO6+pEFK6WMZhFdFgXf6goFM1iZZwxzfInp4GnlxsgR
	1SaSalLo4rdLRGlFrx66eMUXBDj3EoApH6XKxC5ZxDxXeEA=
X-Google-Smtp-Source: ABdhPJwp76bFKuM25Z4eF8IXo6VfP6JSVs4qaoma/ddOLEXrytTnOLhk1NoQgf0VVb7uOlCcLlN+YdkwIAsqEC7BCc8=
X-Received: by 2002:a9d:6ad2:: with SMTP id m18mr2986169otq.78.1625635654164;
 Tue, 06 Jul 2021 22:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210514034101.3683-1-christopher.w.clark@gmail.com> <20210514034101.3683-2-christopher.w.clark@gmail.com>
In-Reply-To: <20210514034101.3683-2-christopher.w.clark@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 6 Jul 2021 22:27:18 -0700
Message-ID: <CACMJ4GZU6MqYRXrFnTRjbSMF+XPL2-JcsOqqED-Kpz30rYdEYw@mail.gmail.com>
Subject: Ping: [PATCH v4 1/2] docs/designs/launch: Hyperlaunch design document
To: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>, 
	Julien Grall <Julien.grall.oss@gmail.com>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	luca.fancellu@arm.com, paul@xen.org, Adam Schwalm <adam.schwalm@starlab.io>, 
	Scott Davis <scott.davis@starlab.io>, Christopher Clark <christopher.clark@starlab.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 8:41 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>
> Adds a design document for Hyperlaunch, formerly DomB mode of dom0less.
>
> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> Signed-off by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Rich Persaud <rp@stacktrust.org>
>
> ---
> Changes since v3:
> * Rename the Landscape table
> * Changed Crash Domain to Recovery Domain
>   * amended text to indicate that this will be new rather than existing X=
en
>     functionality
>   * including update to the configuration, permission, function table
> * Add definitions for =E2=80=9Crecovery domain=E2=80=9D and =E2=80=9Ccras=
h environment=E2=80=9D, describing
>   the different functionalities
>   * some design issues deferred
> * Added section to explain the motivations for the separation between VM
>   creation (by the hypervisor) and VM configuration (by the boot domain)
> * Adjusted the description of the current process for creating a domain
> * Added recommendation for UEFI boot to use GRUB.efi to load via multiboo=
t2
>   method.
> * Added Document Structure section
> * Added section on Communication of Domain Configuration
>
>  docs/designs/launch/hyperlaunch.rst | 1004 +++++++++++++++++++++++++++
>  1 file changed, 1004 insertions(+)
>  create mode 100644 docs/designs/launch/hyperlaunch.rst
>
> diff --git a/docs/designs/launch/hyperlaunch.rst b/docs/designs/launch/hy=
perlaunch.rst
> new file mode 100644
> index 0000000000..30fce8c9c3
> --- /dev/null
> +++ b/docs/designs/launch/hyperlaunch.rst
> @@ -0,0 +1,1004 @@
> +###########################
> +Hyperlaunch Design Document
> +###########################
> +
> +.. sectnum:: :depth: 4
> +
> +This post is a Request for Comment on the included v4 of a design docume=
nt that
> +describes Hyperlaunch: a new method of launching the Xen hypervisor, rel=
ating
> +to dom0less and work from the Hyperlaunch project. We invite discussion =
of this
> +on this list, at the monthly Xen Community Calls, and at dedicated meeti=
ngs on
> +this topic in the Xen Working Group which will be announced in advance o=
n the
> +Xen Development mailing list.
> +
> +
> +.. contents:: :depth: 3
> +
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document describes the design and motivation for the funded develop=
ment of
> +a new, flexible system for launching the Xen hypervisor and virtual mach=
ines
> +named: "Hyperlaunch".
> +
> +The design enables seamless transition for existing systems that require=
 a
> +dom0, and provides a new general capability to build and launch alternat=
ive
> +configurations of virtual machines, including support for static partiti=
oning
> +and accelerated start of VMs during host boot, while adhering to the pri=
nciples
> +of least privilege. It incorporates the existing dom0less functionality,
> +extended to fold in the new developments from the Hyperlaunch project, w=
ith
> +support for both x86 and Arm platform architectures, building upon and
> +replacing the earlier 'late hardware domain' feature for disaggregation =
of
> +dom0.
> +
> +Hyperlaunch is designed to be flexible and reusable across multiple use =
cases,
> +and our aim is to ensure that it is capable, widely exercised, comprehen=
sively
> +tested, and well understood by the Xen community.
> +
> +Document Structure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This is the primary design document for Hyperlaunch, to provide an overv=
iew of
> +the feature. Separate additional documents will cover specific aspects o=
f
> +Hyperlaunch in further detail, including:
> +
> +  - The Device Tree specification for Hyperlaunch metadata
> +  - New Domain Roles for Xen and the Xen Security Modules (XSM) policy
> +  - Passthrough of PCI devices with Hyperlaunch
> +
> +Approach
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Born out of improving support for Dynamic Root of Trust for Measurement =
(DRTM),
> +the Hyperlaunch project is focused on restructuring the system launch of=
 Xen.
> +The Hyperlaunch design provides a security architecture that builds on t=
he
> +principles of Least Privilege and Strong Isolation, achieving this throu=
gh the
> +disaggregation of system functions. It enables this with the introductio=
n of a
> +boot domain that works in conjunction with the hypervisor to provide the
> +ability to launch multiple domains as part of host boot while maintainin=
g a
> +least privilege implementation.
> +
> +While the Hyperlaunch project inception was and continues to be driven b=
y a
> +focus on security through disaggregation, there are multiple use cases w=
ith a
> +non-security focus that require or benefit from the ability to launch mu=
ltiple
> +domains at host boot. This was proven by the need that drove the impleme=
ntation
> +of the dom0less capability in the Arm branch of Xen.
> +
> +Hyperlaunch is designed to be flexible and reusable across multiple use =
cases,
> +and our aim is to ensure that it is capable, widely exercised, comprehen=
sively
> +tested, and provides a robust foundation for current and emerging system=
 launch
> +requirements of the Xen community.
> +
> +
> +Objectives
> +----------
> +
> +* In general strive to maintain compatibility with existing Xen behavior
> +* A default build of the hypervisor should be capable of booting both le=
gacy-compatible and new styles of launch:
> +
> +        * classic Xen boot: starting a single, privileged Dom0
> +        * classic Xen boot with late hardware domain: starting a Dom0 th=
at transitions hardware access/control to another domain
> +        * a dom0less boot: starting multiple domains without privilege a=
ssignment controls
> +        * Hyperlaunch: starting one or more VMs, with flexible configura=
tion
> +
> +* Preferred that it be managed via KCONFIG options to govern inclusion o=
f support for each style
> +* The selection between classic boot and Hyperlaunch boot should be auto=
matic
> +
> +        * Preferred that it not require a kernel command line parameter =
for selection
> +
> +* It should not require modification to boot loaders
> +* It should provide a user friendly interface for its configuration and =
management
> +* It must provide a method for building systems that fallback to console=
 access in the event of misconfiguration
> +* It should be able to boot an x86 Xen environment without the need for =
a Dom0 domain
> +
> +
> +Requirements and Design
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Hyperlaunch is defined as the ability of a hypervisor to construct and s=
tart
> +one or more virtual machines at system launch in a specific way. A hyper=
visor
> +can support one or both modes of configuration, Hyperlaunch Static and
> +Hyperlaunch Dynamic. The Hyperlaunch Static mode functions as a static
> +partitioning hypervisor ensuring only the virtual machines started at sy=
stem
> +launch are running on the system. The Hyperlaunch Dynamic mode functions=
 as a
> +dynamic hypervisor allowing for additional virtual machines to be starte=
d after
> +the initial virtual machines have started. The Xen hypervisor is capable=
 of
> +both modes of configuration from the same binary and when paired with it=
s XSM
> +flask, provides strong controls that enable fine grained system partitio=
ning.
> +
> +Hypervisor Launch Landscape
> +---------
> +
> +This comparison table presents the distinctive capabilities of Hyperlaun=
ch with
> +reference to existing launch configurations currently available in Xen a=
nd
> +other hypervisors.
> +
> +::
> +
> + +---------------+-----------+------------+-----------+-------------+---=
------------------+
> + | **Xen Dom0**  | **Linux** | **Late**   | **Jail**  | **Xen**     | **=
Xen Hyperlaunch** |
> + | **(Classic)** | **KVM**   | **HW Dom** | **house** | **dom0less**+---=
------+-----------+
> + |               |           |            |           |             | St=
atic  | Dynamic   |
> + +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> + | Hypervisor able to launch multiple VMs during host boot              =
                  |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + |               |           |            |     Y     |       Y     |   =
 Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + | Hypervisor supports Static Partitioning                              =
                  |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + |               |           |            |     Y     |       Y     |   =
 Y    |           |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + | Able to launch VMs dynamically after host boot                       =
                  |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + |       Y       |     Y     |      Y*    |     Y     |       Y*    |   =
      |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + | Supports strong isolation between all VMs started at host boot       =
                  |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + |               |           |            |     Y     |       Y     |   =
 Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + | Enables flexible sequencing of VM start during host boot             =
                  |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + |               |           |            |           |             |   =
 Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + | Prevent all-powerful static root domain being launched at boot       =
                  |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + |               |           |            |           |       Y*    |   =
 Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + | Operates without a Highly-privileged management VM (eg. Dom0)        =
                  |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + |               |           |      Y*    |           |       Y*    |   =
 Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + | Operates without a privileged toolstack VM (Control Domain)          =
                  |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + |               |           |            |           |       Y*    |   =
 Y    |           |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + | Extensible VM configuration applied before launch of VMs at host boot=
                  |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + |               |           |            |           |             |   =
 Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + | Flexible granular assignment of permissions and functions to VMs     =
                  |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + |               |           |            |           |             |   =
 Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + | Supports extensible VM measurement architecture for DRTM and attestat=
ion               |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + |               |           |            |           |             |   =
 Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + | PCI passthrough configured at host boot                              =
                  |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> + |               |           |            |           |             |   =
 Y    |     Y     |
> + +---------------+-----------+------------+-----------+-------------+---=
------+-----------+
> +
> +
> +Domain Construction
> +-------------------
> +
> +An important aspect of the Hyperlaunch architecture is that the hypervis=
or
> +performs domain construction for all the Initial Domains,  ie. it builds=
 each
> +domain that is described in the Launch Control Module. More specifically=
, the
> +hypervisor will perform the function of *domain creation* for each Initi=
al
> +Domain: it allocates the unique domain identifier assigned to the virtua=
l
> +machine and records essential metadata about it in the internal data str=
ucture
> +that enables scheduling the domain to run. It will also perform *basic d=
omain
> +construction*: build the initial page tables with data from the kernel a=
nd
> +initial ramdisk supplied, and as appropriate for the domain type, popula=
te the
> +p2m table and ACPI tables.
> +
> +Subsequent to this, the boot domain can apply additional configuration t=
o the
> +initial domains from the data in the LCM, in *extended domain constructi=
on*.
> +
> +The benefits of this structure include:
> +
> +* Security: Contrains the permissions required by the boot domain: it do=
es not
> +  require the capability to create domains in this structure. This align=
s with
> +  the principles of least privilege.
> +* Flexibility: Enables policy-based dynamic assignment of hardware by th=
e boot
> +  domain, customizable according to use-case and able to adapt to hardwa=
re
> +  discovery
> +* Compatibility: Supports reuse of familiar tools with use-case customiz=
ed boot
> +  domains.
> +* Commonality: Reuses the same logic for initial basic domain building a=
cross
> +  diverse Xen deployments.
> +       * It aligns the x86 initial domain construction with the existing=
 Arm
> +         dom0less feature for construction of multiple domains at boot.
> +       * The boot domain implementation may vary significantly with diff=
erent
> +         deployment use cases, whereas the hypervisor implementation is
> +         common.
> +* Correctness: Increases confidence in the implementation of domain
> +  construction, since it is performed by the hypervisor in well maintain=
ed and
> +  centrally tested logic.
> +* Performance: Enables launch for configurations where a fast start of
> +  multiple domains at boot is a requirement.
> +* Capability: Supports launch of advanced configurations where a sequenc=
ed
> +  start of multiple domains is required, or multiple domains are involve=
d in
> +  startup of the running system configuration
> +       * eg. for PCI passthrough on systems where the toolstack runs in =
a
> +         separate domain to the hardware management.
> +
> +Please, see the =E2=80=98Hyperlaunch Device Tree=E2=80=99 design documen=
t, which describes the
> +configuration module that is provided to the hypervisor by the bootloade=
r.
> +
> +The hypervisor determines how these domains are started as host boot com=
pletes:
> +in some systems the Boot Domain acts upon the extended boot configuratio=
n
> +supplied as part of launch, performing configuration tasks for preparing=
 the
> +other domains for the hypervisor to commence running them.
> +
> +Common Boot Configurations
> +--------------------------
> +
> +When looking across those that have expressed interest or discussed a ne=
ed for
> +launching multiple domains at host boot, the Hyperlaunch approach is to =
provide
> +the means to start nearly any combination of domains. Below is an enumer=
ated
> +selection of common boot configurations for reference in the following s=
ection.
> +
> +Dynamic Launch with a Highly-Privileged Domain 0
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Hyperlaunch Classic: Dom0
> +        This configuration mimics the classic Xen start and domain const=
ruction
> +        where a single domain is constructed with all privileges and fun=
ctions for
> +        managing hardware and running virtualization toolstack software.
> +
> +Hyperlaunch Classic: Extended Launch Dom0
> +        This configuration is where a Dom0 is started via a Boot Domain =
that runs
> +        first. This is for cases where some preprocessing in a less priv=
ileged domain
> +        is required before starting the all-privileged Domain 0.
> +
> +Hyperlaunch Classic: Basic Cloud
> +        This configuration constructs a Dom0 that is started in parallel=
 with some
> +        number of workload domains.
> +
> +Hyperlaunch Classic: Cloud
> +        This configuration builds a Dom0 and some number of workload dom=
ains, launched
> +        via a Boot Domain that runs first.
> +
> +
> +Static Launch Configurations: without a Domain 0 or a Control Domain
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Hyperlaunch Static: Basic
> +        Simple static partitioning where all domains that can be run on =
this system are
> +        built and started during host boot and where no domain is starte=
d with the
> +        Control Domain permissions, thus making it not possible to creat=
e/start any
> +        further new domains.
> +
> +Hyperlaunch Static: Standard
> +        This is a variation of the =E2=80=9CHyperlaunch Static: Basic=E2=
=80=9D static partitioning
> +        configuration with the introduction of a Boot Domain. This confi=
guration allows
> +        for use of a Boot Domain to be able to apply extended configurat=
ion
> +        to the Initial Domains before they are started and
> +        sequence the order in which they start.
> +
> +Hyperlaunch Static: Disaggregated
> +        This is a variation of the =E2=80=9CHyperlaunch Static: Standard=
=E2=80=9D configuration with
> +        the introduction of a Boot Domain and an illustration that some =
functions can
> +        be disaggregated to dedicated domains.
> +
> +Dynamic Launch of Disaggregated System Configurations
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Hyperlaunch Dynamic: Hardware Domain
> +        This configuration mimics the existing Xen feature late hardware=
 domain with
> +        the one difference being that the hardware domain is constructed=
 by the
> +        hypervisor at startup instead of later by Dom0.
> +
> +Hyperlaunch Dynamic: Flexible Disaggregation
> +        This configuration is similar to the =E2=80=9CHyperlaunch Classi=
c: Dom0=E2=80=9D configuration
> +        except that it includes starting a separate hardware domain duri=
ng Xen startup.
> +        It is also similar to =E2=80=9CHyperlaunch Dynamic: Hardware Dom=
ain=E2=80=9D configuration, but
> +        it launches via a Boot Domain that runs first.
> +
> +Hyperlaunch Dynamic: Full Disaggregation
> +        In this configuration it is demonstrated how it is possible to s=
tart a fully
> +        disaggregated system: the virtualization toolstack runs in a Con=
trol Domain,
> +        separate from the domains responsible for managing hardware, Xen=
Store, the Xen
> +        Console and Crash functions, each launched via a Boot Domain.
> +
> +
> +Example Use Cases and Configurations
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The following example use cases can be matched to configurations listed =
in the
> +previous section.
> +
> +Use case: Modern cloud hypervisor
> +"""""""""""""""""""""""""""""""""
> +
> +**Option:** Hyperlaunch Classic: Cloud
> +
> +This configuration will support strong isolation for virtual TPM domains=
 and
> +measured launch in support of attestation to infrastructure management, =
while
> +allowing the use of existing Dom0 virtualization toolstack software.
> +
> +Use case: Edge device with security or safety requirements
> +""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
> +
> +**Option:** Hyperlaunch Static: Boot
> +
> +This configuration runs without requiring a highly-privileged Dom0, and =
enables
> +extended VM configuration to be applied to the Initial VMs prior to laun=
ching
> +them, optionally in a sequenced start.
> +
> +Use case: Client hypervisor
> +"""""""""""""""""""""""""""
> +
> +**Option:** Hyperlaunch Dynamic: Flexible Disaggregation
> +
> +**Option:** Hyperlaunch Dynamic: Full Disaggregation
> +
> +These configurations enable dynamic client workloads, strong isolation f=
or the
> +domain running the virtualization toolstack software and each domain man=
aging
> +hardware, with PCI passthrough performed during host boot and support fo=
r
> +measured launch.
> +
> +Hyperlaunch Disaggregated Launch
> +--------------------------------
> +
> +
> +Existing in Xen today are two primary permissions, *control domain* and
> +*hardware domain*, and two functions, *console domain* and *xenstore dom=
ain*,
> +that can be assigned to a domain. Traditionally all of these permissions=
 and
> +functions are all assigned to Dom0 at start and can then be delegated to=
 other
> +domains created by the toolstack in Dom0. With Hyperlaunch it becomes po=
ssible
> +to assign these permissions and functions to any domain for which there =
is a
> +definition provided at startup.
> +
> +Additionally, two further functions are introduced: the *recovery domain=
*,
> +intended to assist with recovery from failures encountered starting VMs =
during
> +host boot, and the *boot domain*, for performing aspects of domain const=
ruction
> +during startup.
> +
> +Supporting the booting of each of the above common boot configurations i=
s
> +accomplished by considering the set of initial domains and the assignmen=
t of
> +Xen=E2=80=99s permissions and functions, including the ones introduced b=
y Hyperlaunch,
> +to these domains. A discussion of these will be covered later but for no=
w they
> +are laid out in a table with a mapping to the common boot configurations=
. This
> +table is not intended to be an exhaustive list of configurations and doe=
s not
> +account for flask policy specified functions that are use case specific.
> +
> +In the table each number represents a separate domain being
> +constructed by the Hyperlaunch construction path as Xen starts, and the
> +designator, ``{n}`` signifies that there may be =E2=80=9Cn=E2=80=9D addi=
tional domains that may
> +be constructed that do not have any special role for a general Xen syste=
m.
> +
> +::
> +
> + +-------------------+------------------+-------------------------------=
----+
> + | Configuration     |    Permission    |            Function           =
    |
> + |                   +------+------+----+------+--------+--------+------=
----+
> + |                   | None | Ctrl | HW | Boot |Recovery| Console| Xenst=
ore |
> + +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D+=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> + | Classic: Dom0     |      |  0   | 0  |      |   0    |   0    |    0 =
    |
> + +-------------------+------+------+----+------+--------+--------+------=
----+
> + | Classic: Extended |      |  1   | 1  |  0   |   1    |   1    |    1 =
    |
> + | Launch Dom0       |      |      |    |      |        |        |      =
    |
> + +-------------------+------+------+----+------+--------+--------+------=
----+
> + | Classic:          | {n}  |  0   | 0  |      |   0    |   0    |    0 =
    |
> + | Basic Cloud       |      |      |    |      |        |        |      =
    |
> + +-------------------+------+------+----+------+--------+--------+------=
----+
> + | Classic: Cloud    | {n}  |  1   | 1  |  0   |   1    |   1    |    1 =
    |
> + +-------------------+------+------+----+------+--------+--------+------=
----+
> + | Static: Basic     | {n}  |      | 0  |      |   0    |   0    |    0 =
    |
> + +-------------------+------+------+----+------+--------+--------+------=
----+
> + | Static: Standard  | {n}  |      | 1  |  0   |   1    |   1    |    1 =
    |
> + +-------------------+------+------+----+------+--------+--------+------=
----+
> + | Static:           | {n}  |      | 2  |  0   |   3    |   4    |    1 =
    |
> + | Disaggregated     |      |      |    |      |        |        |      =
    |
> + +-------------------+------+------+----+------+--------+--------+------=
----+
> + | Dynamic:          |      |  0   | 1  |      |   0    |   0    |    0 =
    |
> + | Hardware Domain   |      |      |    |      |        |        |      =
    |
> + +-------------------+------+------+----+------+--------+--------+------=
----+
> + | Dynamic: Flexible | {n}  |  1   | 2  |  0   |   1    |   1    |    1 =
    |
> + | Disaggregation    |      |      |    |      |        |        |      =
    |
> + +-------------------+------+------+----+------+--------+--------+------=
----+
> + | Dynamic: Full     | {n}  |  2   | 3  |  0   |   4    |   5    |    1 =
    |
> + | Disaggregation    |      |      |    |      |        |        |      =
    |
> + +-------------------+------+------+----+------+--------+--------+------=
----+
> +
> +Overview of Hyperlaunch Flow
> +----------------------------
> +
> +Before delving into Hyperlaunch, a good basis to start with is an unders=
tanding
> +of the current process to create a domain. A way to view this process st=
arts
> +with the core configuration which is the information the hypervisor requ=
ires to
> +make the call to `domain_create`, followed by basic construction to prov=
ide the
> +memory image to run, including the kernel and ramdisk. A subsequent step
> +applies the extended configuration used by the toolstack to provide a do=
main
> +with any additional configuration information. Until the extended config=
uration
> +is completed, a domain has access to no resources except its allocated v=
cpus
> +and memory. The exception to this is Dom0, which the hypervisor explicit=
ly
> +grants control and access to all system resources, except for those that=
 only
> +the hypervisor should have control over.  This exception for Dom0 is dri=
ven by
> +the system structure with a monolithic Dom0 domain predating introductio=
n of
> +support for disaggregation into Xen, and the corresponding default assig=
nment
> +of multiple roles within the Xen system to Dom0.
> +
> +While not a different domain creation path, there does exist the Hardwar=
e
> +Domain (hwdom), sometimes also referred to as late-Dom0. It is an early =
effort
> +to disaggregate Dom0=E2=80=99s roles into a separate control domain and =
hardware
> +domain. This capability is activated by the passing of a domain id to th=
e
> +`hardware_dom` kernel command line parameter, and the Xen hypervisor wil=
l then
> +flag that domain id as the hardware domain. Later when the toolstack con=
structs
> +a domain with that domain id as the requested domid, the hypervisor will
> +transfer all device I/O from Dom0 to this domain. In addition it will al=
so
> +transfer the =E2=80=9Chost shutdown on domain shutdown=E2=80=9D flag fro=
m Dom0 to the hardware
> +domain. It is worth mentioning that this approach for disaggregation was
> +created in this manner due to the inability of Xen to launch more than o=
ne
> +domain at startup.
> +
> +Hyperlaunch Xen startup
> +^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The Hyperlaunch approach=E2=80=99s primary focus is on how to assign the=
 roles
> +traditionally granted to Dom0 to one or more domains at host boot. While=
 the
> +statement is simple to make, the implications are not trivial by any mea=
ns.
> +This also explains why the Hyperlaunch approach is orthogonal to the exi=
sting
> +dom0less capability. The dom0less capability focuses on enabling the lau=
nch of
> +multiple domains in parallel with Dom0 at host boot. A corollary for dom=
0less
> +is that for systems that don=E2=80=99t require Dom0 after all guest doma=
ins have
> +started, they are able to do the host boot without a Dom0. Though it sho=
uld be
> +noted that it may be possible to start  Dom0 at a later point. Whereas w=
ith
> +Hyperlaunch, its approach of separating Dom0=E2=80=99s roles requires th=
e ability to
> +launch multiple domains at host boot. The direct consequences from this
> +approach are profound and provide a myriad of possible configurations fo=
r which
> +a sample of common boot configurations were already presented.
> +
> +To enable the Hyperlaunch approach a new alternative path for host boot =
within
> +the hypervisor must be introduced. This alternative path effectively bra=
nches
> +just before the current point of Dom0 construction and begins an alterna=
te
> +means of system construction. The determination if this alternate path s=
hould
> +be taken is through the inspection of the boot chain. If the bootloader =
has
> +loaded a specific configuration, as described later, it will enable Xen =
to
> +detect that a Hyperlaunch configuration has been provided. Once a Hyperl=
aunch
> +configuration is detected, this alternate path can be thought of as occu=
rring
> +in phases: domain creation, domain preparation, and launch finalization.
> +
> +Domain Creation
> +"""""""""""""""
> +
> +The domain creation phase begins with Xen parsing the bootloader provide=
d
> +material, to understand the content of the modules provided. It will the=
n load
> +any microcode or XSM policy it discovers. For each domain configuration =
Xen
> +finds, it parses the configuration to construct the necessary domain def=
inition
> +to instantiate an instance of the domain and leave it in a paused state.=
 When
> +all domain configurations have been instantiated as domains, if one of t=
hem is
> +flagged as the Boot Domain, that domain will be unpaused starting the do=
main
> +preparation phase. If there is no Boot Domain defined, then the domain
> +preparation phase will be skipped and Xen will trigger the launch finali=
zation
> +phase.
> +
> +Domain Preparation Phase
> +""""""""""""""""""""""""
> +
> +The domain preparation phase is an optional check point for the executio=
n of a
> +workload specific domain, the Boot Domain. While the Boot Domain is the =
first
> +domain to run and has some degree of control over the system, it is extr=
emely
> +restricted in both system resource access and hypervisor operations. Its
> +purpose is to:
> +
> +* Access the configuration provided by the bootloader
> +* Finalize the configuration of the domains
> +* Conduct any setup and launch related operations
> +* Do an ordered unpause of domains that require an ordered start
> +
> +When the Boot Domain has completed, it will notify the hypervisor that i=
t is
> +done triggering the launch finalization phase.
> +
> +
> +Launch Finalization
> +"""""""""""""""""""
> +
> +The hypervisor handles the launch finalization phase which is equivalent=
 to the
> +clean up phase. As such the steps taken by the hypervisor, not necessari=
ly in
> +implementation order, are as follows,
> +
> +* Free the boot module chain
> +* If a Boot Domain was used, reclaim Boot Domain resources
> +* Unpause any domains still in a paused state
> +* Boot Domain uses a reserved function thus can never be respawned
> +
> +While the focus thus far has been on how the Hyperlaunch capability will=
 work,
> +it is worth mentioning what it does not do or limit from occurring. It d=
oes not
> +stop or inhibit the assigning of the control domain role which gives the=
 domain
> +the ability to create, start, stop, restart, and destroy domains or the
> +hardware domain role which gives access to all I/O devices except those =
that
> +the hypervisor has reserved for itself. In particular it is still possib=
le to
> +construct a domain with all the privileged roles, i.e. a Dom0, with or w=
ithout
> +the domain id being zero. In fact what limitations are imposed now becom=
e fully
> +configurable without the risk of circumvention by an all privileged doma=
in.
> +
> +Structuring of Hyperlaunch
> +--------------------------
> +
> +The structure of Hyperlaunch is built around the existing capabilities o=
f the
> +host boot protocol. This approach was driven by the objective not to req=
uire
> +modifications to the boot loader. The only requirement is that the boot =
loader
> +supports the Multiboot2 (MB2) protocol. For UEFI boot, our recommendatio=
n is to
> +use GRUB.efi to load Xen and the initial domain materials via the multib=
oot2
> +method. On Arm platforms, Hyperlaunch is compatible with the existing in=
terface
> +for boot into the hypervisor.
> +
> +
> +x86 Multiboot2
> +^^^^^^^^^^^^^^
> +
> +The MB2 protocol has no concept of a manifest to tell the initial kernel=
 what
> +is contained in the chain, leaving it to the kernel to impose a loading
> +convention, use magic number identification, or both. When considering t=
he
> +passing of multiple kernels, ramdisks, and domain configuration along wi=
th any
> +existing modules already passed, there is no sane convention that could =
be
> +imposed and magic number identification is nearly impossible when consid=
ering
> +the objective not to impose unnecessary complication to the hypervisor.
> +
> +As it was alluded to previously, a manifest describing the contents in t=
he MB2
> +chain and how they relate within a Xen context is needed. To address thi=
s need
> +the Launch Control Module (LCM) was designed to provide such a manifest.=
 The
> +LCM was designed to have a specific set of properties,
> +
> +* minimize the complexity of the parsing logic required by the hyperviso=
r
> +* allow for expanding and optional configuration fragments without break=
ing
> +  backwards compatibility
> +
> +To enable automatic detection of a Hyperlaunch configuration, the LCM mu=
st be
> +the first MB2 module in the MB2 module chain. The LCM is implemented usi=
ng the
> +Device Tree as defined in the Hyperlaunch Device Tree design document. W=
ith the
> +LCM implemented in Device Tree, it has a magic number that enables the
> +hypervisor to detect its presence when used in a Multiboot2 module chain=
. The
> +hypervisor can confirm that it is a proper LCM Device Tree by checking f=
or a
> +compliant Hyperlaunch Device Tree. The Hyperlaunch Device Tree nodes are
> +designed to allow,
> +
> +* for the hypervisor to parse only those entries it understands,
> +* for packing custom information for a custom boot domain,
> +* the ability to use a new LCM with an older hypervisor,
> +* and the ability to use an older LCM with a new hypervisor.
> +
> +Arm Device Tree
> +^^^^^^^^^^^^^^^
> +
> +As discussed the LCM is in Device Tree format and was designed to co-exi=
st in
> +the Device Tree ecosystem, and in particular in parallel with dom0less D=
evice
> +Tree entries. On Arm, Xen is already designed to boot from a host Device=
 Tree
> +description (dtb) file and the LCM entries can be embedded into this hos=
t dtb
> +file. This makes detecting the LCM entries and supporting Hyperlaunch on=
 Arm
> +relatively straight forward. Relative to the described x86 approach, at =
the
> +point where Xen inspects the first MB2 module, on Arm Xen will check if =
the top
> +level LCM node exists in the host dtb file. If the LCM node does exist, =
then at
> +that point it will enter into the same code path as the x86 entry would =
go.
> +
> +Xen hypervisor
> +^^^^^^^^^^^^^^
> +
> +It was previously discussed at a higher level of the new host boot flow =
that
> +will be introduced. Within this new flow is the configuration parsing an=
d
> +domain creation phase which will be expanded upon here. The hypervisor w=
ill
> +inspect the LCM for a config node and if found will iterate through all =
modules
> +nodes. The module nodes are used to identify if any modules contain micr=
ocode
> +or an XSM policy. As it processes domain nodes, it will construct the do=
main
> +using the node properties and the modules nodes. Once it has completed
> +iterating through all the entries in the LCM, if a constructed domain ha=
s the
> +Boot Domain attribute, it will then be unpaused. Otherwise the hyperviso=
r will
> +start the launch finalization phase.
> +
> +Boot Domain
> +^^^^^^^^^^^
> +
> +Traditionally domain creation was controlled by the user within the Dom0
> +environment whereby custom toolstacks could be implemented to impose
> +requirements on the process. The Boot Domain is a means to enable the us=
er to
> +continue to maintain a degree of that control over domain creation but w=
ithin a
> +limited privilege environment. The Boot Domain will have access to the L=
CM and
> +the boot chain along with access to a subset of the hypercall operations=
. When
> +the Boot Domain is finished it will notify the hypervisor through a hype=
rcall
> +op.
> +
> +Recovery Domain
> +^^^^^^^^^^^^^^^
> +
> +With the existing Dom0 host boot path, when a failure occurs there are s=
everal
> +assumptions that can safely be made to get the user to a console for
> +troubleshooting. With the Hyperlaunch host boot path those assumptions c=
an no
> +longer be made, thus a means is needed to get the user to a console in t=
he case
> +of a recoverable failure. The recovery domain is configured by a domain
> +configuration entry in the LCM, in the same manner as the other initial
> +domains, and it will not be unpaused at launch finalization unless a fai=
lure is
> +encountered starting the initial domains.
> +
> +Xen has existing support for a Crash Environment where memory can be res=
erved
> +at host boot and a kernel loaded into it, to be jumped into at any point=
 while
> +the system is running when a crash is detected. The Recovery Domain
> +functionality is a separate, complementary capability. The Crash Environ=
ment
> +replaces the previously active hypervisor and running guests, and enable=
s a
> +process for mounting disks to write out log information prior to rebooti=
ng the
> +system. In contrast, the Recovery Domain is able to use the functionalit=
y of
> +the Xen hypervisor, that is still present and running, to perform recove=
ry
> +handling for errors encountered with starting the initial domains.
> +
> +Deferred Design
> +"""""""""""""""
> +
> +To be determined:
> +
> +* Define what is detected as a crash
> +* Explain how crash detection is performed and which components are invo=
lved
> +* Explain how the recovery domain is unpaused
> +* Explain how and when the resources assigned to the recovery domain are=
 reclaimed
> +* Define what the recovery domain is able to do
> +* Determine what permissions the recovery domain requires to perform its=
 job
> +
> +
> +Control Domain
> +^^^^^^^^^^^^^^
> +
> +The concept of the Control Domain already exists within Xen as a boolean=
,
> +`is_privileged`, that governs access to many of the privileged interface=
s of
> +the hypervisor that support a domain running a virtualization system too=
lstack.
> +Hyperlaunch will allow the `is_privileged` flag to be set on any domain =
that is
> +created at launch, rather than only a Dom0. It may potentially be set on
> +multiple domains.
> +
> +Hardware Domain
> +^^^^^^^^^^^^^^^
> +
> +The Hardware Domain is also an existing concept for Xen that is enabled =
through
> +the `is_hardware_domain` check. With Hyperlaunch the previous process of=
 I/O
> +accesses being assigned to Dom0 for later transfer to the hardware domai=
n would
> +no longer be required. Instead during the configuration phase the Xen
> +hypervisor would directly assign the I/O accesses to the domain with the
> +hardware domain permission bit enabled.
> +
> +Console Domain
> +^^^^^^^^^^^^^^
> +
> +Traditionally the Xen console is assigned to the control domain and then
> +reassignable by the toolstack to another domain. With Hyperlaunch it bec=
omes
> +possible to construct a boot configuration where there is no control dom=
ain or
> +have a use case where the Xen console needs to be isolated. As such it b=
ecomes
> +necessary to be able to designate which of the initial domains should be
> +assigned the Xen console. Therefore Hyperlaunch introduces the ability t=
o
> +specify an initial domain which the console is assigned along with a con=
vention
> +of ordered assignment for when there is no explicit assignment.
> +
> +Communication of Domain Configurations
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +There are several standard methods for an Operating System to access mac=
hine
> +configuration and environment information: ACPI is common on x86 systems=
,
> +whereas Device Tree is more typical on Arm platforms. There are currentl=
y
> +implementations of both in Xen.
> +
> +* For dom0less, guest Device Trees are dynamically constructed by the
> +  hypervisor to convey domain configuration data
> +
> +* For PVH dom0 on x86, ACPI tables are built by the hypervisor before th=
e
> +  domain is started
> +
> +Note that both of these mechanisms convey static data that is fixed prio=
r to
> +the point of domain construction. Hyperlaunch will retain both the exist=
ing
> +ACPI and Device Tree methods.
> +
> +Communication of data between a Boot Domain and a Control Domain is of n=
ote
> +since they may not be running concurrently: the method used will depend =
on
> +their specific implementations, but one option available is to use Xen=
=E2=80=99s hypfs
> +for transfer of basic data to support system bootstrap.
> +
> +------------------------------------------------------------------------=
-------
> +
> +Appendix
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Appendix 1: Flow Sequence of Steps of a Hyperlaunch Boot
> +--------------------------------------------------------
> +
> +Provided here is an ordered flow of a Hyperlaunch with a highlight logic
> +decision points. Not all branch points are recorded, specifically for th=
e
> +variety of error conditions that may occur. ::
> +
> +  1. Hypervisor Startup:
> +  2a. (x86) Inspect first module provided by the bootloader
> +      a. Is the module an LCM
> +          i. YES: proceed with the Hyperlaunch host boot path
> +          ii. NO: proceed with a Dom0 host boot path
> +  2b. (Arm) Inspect host dtb for `/chosen/hypervisor` node
> +      a. Is the LCM present
> +          i. YES: proceed with the Hyperlaunch host boot path
> +          ii. NO: proceed with a Dom0/dom0less host boot path
> +  3. Iterate through the LCM entries looking for the module description
> +     entry
> +      a. Check if any of the modules are microcode or policy and if so,
> +         load
> +  4. Iterate through the LCM entries processing all domain description
> +     entries
> +      a. Use the details from the Basic Configuration to call
> +         `domain_create`
> +      b. Record if a domain is flagged as the Boot Domain
> +      c. Record if a domain is flagged as the Recovery Domain
> +  5. Was a Boot Domain created
> +      a. YES:
> +          i. Attach console to Boot Domain
> +          ii. Unpause Boot Domain
> +          iii. Goto Boot Domain (step 6)
> +      b. NO: Goto Launch Finalization (step 10)
> +  6. Boot Domain:
> +  7. Boot Domain comes online and may do any of the following actions
> +      a. Process the LCM
> +      b. Validate the MB2 chain
> +      c. Make additional configuration settings for staged domains
> +      d. Unpause any precursor domains
> +      e. Set any runtime configurations
> +  8. Boot Domain does any necessary cleanup
> +  9. Boot Domain make hypercall op call to signal it is finished
> +      i. Hypervisor reclaims all Boot Domain resources
> +      ii. Hypervisor records that the Boot Domain ran
> +      ii. Goto Launch Finalization (step 9)
> +  10. Launch Finalization
> +  11. If a configured domain was flagged to have the console, the
> +      hypervisor assigns it
> +  12. The hypervisor clears the LCM and bootloader loaded module,
> +      reclaiming the memory
> +  13. The hypervisor iterates through domains unpausing any domain not
> +      flagged as the recovery domain
> +
> +
> +Appendix 2: Considerations in Naming the Hyperlaunch Feature
> +------------------------------------------------------------
> +
> +* The term =E2=80=9CLaunch=E2=80=9D is preferred over =E2=80=9CBoot=E2=
=80=9D
> +
> +        * Multiple individual component boots can occur in the new syste=
m start
> +          process; Launch is preferable for describing the whole process
> +        * Fortunately there is consensus in the current group of stakeho=
lders
> +          that the term =E2=80=9CLaunch=E2=80=9D is good and appropriate
> +
> +* The names we define must support becoming meaningful and simple to use
> +  outside the Xen community
> +
> +        * They must be able to be resolved quickly via search engine to =
a clear
> +          explanation (eg. Xen marketing material, documentation or wiki=
)
> +        * We prefer that the terms be helpful for marketing communicatio=
ns
> +        * Consequence: avoid the term =E2=80=9Cdomain=E2=80=9D which is =
Xen-specific and
> +          requires a definition to be provided each time when used elsew=
here
> +
> +
> +* There is a need to communicate that Xen is  capable of being used as a=
 Static
> +  Partitioning hypervisor
> +
> +        * The community members using and maintaining dom0less are the c=
urrent
> +          primary stakeholders for this
> +
> +* There is a need to communicate that the new launch functionality provi=
des new
> +  capabilities not available elsewhere, and is more than just supporting=
 Static
> +  Partitioning
> +
> +        * No other hypervisor known to the authors of this document is c=
apable
> +          of providing what Hyperlaunch will be able to do. The launch s=
equence is
> +          designed to:
> +
> +                * Remove dependency on a single, highly-privileged initi=
al domain
> +                * Allow the initial domains started to be independent an=
d fully
> +                  isolated from each other
> +                * Support configurations where no further VMs can be lau=
nched
> +                  once the initial domains have started
> +                * Use a standard, extensible format for conveying VM
> +                  configuration data
> +                * Ensure that domain building of all initial domains is
> +                  performed by the hypervisor from materials supplied by=
 the
> +                  bootloader
> +                * Enable flexible configuration to be applied to all ini=
tial
> +                  domains by an optional Boot Domain, that runs with lim=
ited
> +                  privilege, before any other domain starts and obtains =
the VM
> +                  configuration data from the bootloader materials via t=
he
> +                  hypervisor
> +                * Enable measurements of all of the boot materials prior=
 to
> +                  their use, in a sequence with minimized privilege
> +                * Support use-case-specific customized Boot Domains
> +                * Complement the hypervisor=E2=80=99s existing ability t=
o enforce
> +                  policy-based Mandatory Access Control
> +
> +
> +* =E2=80=9CStatic=E2=80=9D and =E2=80=9CDynamic=E2=80=9D have different =
and important meanings in different
> +  communities
> +
> +        * Static and Dynamic Partitioning describe the ability to create=
 new
> +          virtual machines, or not, after the initial host boot process
> +          completes
> +        * Static and Dynamic Root of Trust describe the nature of the tr=
ust
> +          chain for a measured launch. In this case Static is referring =
to the
> +          fact that the trust chain is fixed and non-repeatable until th=
e next
> +          host reboot or shutdown. Whereas Dynamic in this case refers t=
o the
> +          ability to conduct the measured launch at any time and potenti=
ally
> +          multiple times before the next host reboot or shutdown.
> +
> +                * We will be using Hyperlaunch with both Static and Dyna=
mic
> +                  Roots of Trust, to launch both Static and Dynamically
> +                  Partitioned Systems, and being clear about exactly whi=
ch
> +                  combination is being started will be very important (e=
g. for
> +                  certification processes)
> +
> +        * Consequence: uses of =E2=80=9CStatic=E2=80=9D and =E2=80=9CDyn=
amic=E2=80=9D need to be qualified if
> +          they are incorporated into the naming of this functionality
> +
> +                * This can be done by adding the preceding, stronger bra=
nded
> +                  term: =E2=80=9CHyperlaunch=E2=80=9D, before =E2=80=9CS=
tatic=E2=80=9D or =E2=80=9CDynamic=E2=80=9D
> +                * ie. =E2=80=9CHyperlaunch Static=E2=80=9D describes lau=
nch of a
> +                  Statically Partitioned system
> +                * and =E2=80=9CHyperlaunch Dynamic=E2=80=9D describes la=
unch of a
> +                  Dynamically Partitioned system.
> +                * In practice, this means that =E2=80=9CHyperlaunch Stat=
ic=E2=80=9D describes
> +                  starting a Static Partitioned system where no new doma=
ins can
> +                  be started later (ie. no VM has the Control Domain
> +                  permission), whereas =E2=80=9CHyperlaunch Dynamic=E2=
=80=9D will launch some
> +                  VM with the Control Domain permission, able to create =
VMs
> +                  dynamically at a later point.
> +
> +**Naming Proposal:**
> +
> +* New Term: =E2=80=9CHyperlaunch=E2=80=9D : the ability of a hypervisor =
to construct and start
> +  one or more virtual machines at system launch, in the following manner=
:
> +
> +        * The hypervisor must build all of the domains that it starts at=
 host
> +          boot
> +
> +                * Similar to the way the dom0 domain is built by the hyp=
ervisor
> +                  today, and how dom0less works: it will run a loop to b=
uild
> +                  them all, driven from the configuration provided
> +                * This is a requirement for ensuring that there is Stron=
g
> +                  Isolation between each of the initial VMs
> +
> +        * A single file contains the VM configs (=E2=80=9CLaunch Control=
 Module=E2=80=9D: LCM,
> +          in Device Tree binary format) is provided to the hypervisor
> +
> +                * The hypervisor parses it and builds domains
> +                * If the LCM config says that a Boot Domain should run f=
irst,
> +                  then the LCM file itself is made available to the Boot=
 Domain
> +                  for it to parse and act on, to invoke operations via t=
he
> +                  hypervisor to apply additional configuration to the ot=
her VMs
> +                  (ie. executing a privilege-constrained toolstack)
> +
> +* New Term: =E2=80=9CHyperlaunch Static=E2=80=9D: starts a Static Partit=
ioned system, where
> +  only the virtual machines started at system launch are running on the =
system
> +
> +* New Term: =E2=80=9CHyperlaunch Dynamic=E2=80=9D: starts a system where=
 virtual machines may
> +  be dynamically added after the initial virtual machines have started.
> +
> +
> +In the default configuration, Xen will be capable of both styles of Hype=
rlaunch
> +from the same hypervisor binary, when paired with its XSM flask, provide=
s
> +strong controls that enable fine grained system partitioning.
> +
> +
> +* Retiring Term: =E2=80=9CDomB=E2=80=9D: will no longer be used to descr=
ibe the optional first
> +  domain that is started. It is replaced with the more general term: =E2=
=80=9CBoot
> +  Domain=E2=80=9D.
> +
> +* Retiring Term: =E2=80=9CDom0less=E2=80=9D: it is to be replaced with =
=E2=80=9CHyperlaunch Static=E2=80=9D
> +
> +
> +Appendix 3: Terminology
> +-----------------------
> +
> +To help ensure clarity in reading this document, the following is the
> +definition of terminology used within this document.
> +
> +
> +Basic Configuration
> +    the minimal information the hypervisor requires to instantiate a dom=
ain instance
> +
> +
> +Boot Domain
> +    a domain with limited privileges launched by the hypervisor during a
> +    Multiple Domain Boot that runs as the first domain started. In the H=
yperlaunch
> +    architecture, it is responsible for assisting with higher level oper=
ations of
> +    the domain setup process.
> +
> +
> +Classic Launch
> +    a backwards-compatible host boot that ends with the launch of a sing=
le domain (Dom0)
> +
> +
> +Console Domain
> +    a domain that has the Xen console assigned to it
> +
> +
> +Control Domain
> +    a privileged domain that has been granted Control Domain permissions=
 which
> +    are those that are required by the Xen toolstack for managing other =
domains.
> +    These permissions are a subset of those that are granted to Dom0.
> +
> +
> +Device Tree
> +    a standardized data structure, with defined file formats, for descri=
bing
> +    initial system configuration
> +
> +
> +Disaggregation
> +    the separation of system roles and responsibilities across multiple
> +    connected components that work together to provide functionality
> +
> +
> +Dom0
> +    the highly-privileged, first and only domain started at host boot on=
 a
> +    conventional Xen system
> +
> +
> +Dom0less
> +    an existing feature of Xen on Arm that provides Multiple Domain Boot
> +
> +
> +Domain
> +    a running instance of a virtual machine; (as the term is commonly us=
ed in
> +    the Xen Community)
> +
> +DomB
> +     the former name for Hyperlaunch
> +
> +
> +Extended Configuration
> +    any configuration options for a domain beyond its Basic Configuratio=
n
> +
> +
> +Hardware Domain
> +    a privileged domain that has been granted permissions to access and =
manage
> +    host hardware. These permissions are a subset of those that are gran=
ted to
> +    Dom0.
> +
> +
> +Host Boot
> +    the system startup of Xen using the configuration provided by the bo=
otloader
> +
> +
> +Hyperlaunch
> +    a flexible host boot that ends with the launch of one or more domain=
s
> +
> +
> +Initial Domain
> +    a domain that is described in the LCM that is run as part of a multi=
ple
> +    domain boot. This includes the Boot Domain, Recovery Domain and all =
Launched
> +    Domains.
> +
> +
> +Late Hardware Domain
> +    a Hardware Domain that is launched after host boot has already compl=
eted
> +    with a running Dom0. When the Late Hardware Domain is started, Dom0
> +    relinquishes and transfers the permissions to access and manage host=
 hardware
> +    to it..
> +
> +
> +Launch Control Module (LCM)
> +    A file supplied to the hypervisor by the bootloader that contains
> +    configuration data for the hypervisor and the initial set of virtual=
 machines
> +    to be run at boot
> +
> +
> +Launched Domain
> +    a domain, aside from the boot domain and recovery domain, that is st=
arted as
> +    part of a multiple domain boot and remains running once the boot pro=
cess is
> +    complete
> +
> +
> +Multiple Domain Boot
> +    a system configuration where the hypervisor and multiple virtual mac=
hines
> +    are all launched when the host system hardware boots
> +
> +
> +Recovery Domain
> +    an optional fallback domain that the hypervisor may start in the eve=
nt of a
> +    detectable error encountered during the multiple domain boot process
> +
> +
> +System Device Tree
> +    this is the product of an Arm community project to extend Device Tre=
e to
> +    cover more aspects of initial system configuration
> +
> +
> +Appendix 4: Copyright License
> +-----------------------------
> +
> +This work is licensed under a Creative Commons Attribution 4.0 Internati=
onal
> +License. A copy of this license may be obtained from the Creative Common=
s
> +website (https://creativecommons.org/licenses/by/4.0/legalcode).
> +
> +| Contributions by:
> +| Christopher Clark are Copyright =C2=A9 2021 Star Lab Corporation
> +| Daniel P. Smith are Copyright  =C2=A9 2021 Apertus Solutions, LLC
> --
> 2.25.1
>

