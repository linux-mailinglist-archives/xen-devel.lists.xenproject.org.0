Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKCpC0pBvGm7vwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 19:32:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6E02D10BD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 19:32:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257509.1551892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3IAV-0006fD-Cx; Thu, 19 Mar 2026 18:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257509.1551892; Thu, 19 Mar 2026 18:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3IAV-0006d9-AM; Thu, 19 Mar 2026 18:32:27 +0000
Received: by outflank-mailman (input) for mailman id 1257509;
 Thu, 19 Mar 2026 18:32:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iU77=BT=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1w3IAT-0006d3-VI
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 18:32:25 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8228e45-23c1-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 19:32:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 72EAF60053;
 Thu, 19 Mar 2026 18:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2336C19424;
 Thu, 19 Mar 2026 18:32:20 +0000 (UTC)
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
X-Inumbo-ID: f8228e45-23c1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773945141;
	bh=q/AIFKBlYrlqgaIU+R+X2Kbm55lVUhw1nLQSCLmd6ew=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SLfxJBQH3ZBwLVeaWFuXtr69z+ue66UBDBXapfmCGZU/5sePR0jM8ttItsExbkxXd
	 fat6HASgQmW8lTt+q9Fv/u0XJTf3d3wZAiJLqrgzYHG5GWO4lK+JttBOqJXt5pwhQF
	 w+6FlJPTdi3oKlG3m7NbTFgXf1aiA6jp7uCbZskZpkhz+sWDidVqJYVEsczF3/Cr0q
	 5HIA6+fCuzX4SwGeOuI+h7S9iLuLC57oeWrh6xVKPtDKceG2qv5E5rx2twVSmjZBNQ
	 hX57e6N1IjMEwU/bgDkP0m8XkKB2jG/ioYVncpqZsFKATtztVHzIe50BPghhEOmL2B
	 /aAbuSjpDjtvg==
Date: Thu, 19 Mar 2026 13:32:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Kees Cook <kees@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Huth <thuth@redhat.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kevin Loughlin <kevinloughlin@google.com>,
	Zheyun Shen <szy0127@sjtu.edu.cn>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Xin Li <xin@zytor.com>, "Ahmed S . Darwish" <darwi@linutronix.de>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Robin Murphy <robin.murphy@arm.com>,
	James Clark <james.clark@linaro.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>,
	Wei Huang <wei.huang2@amd.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Somnath Kotur <somnath.kotur@broadcom.com>,
	punit.agrawal@oss.qualcomm.com, guohanjun@huawei.com,
	suzuki.poulose@arm.com, ryan.roberts@arm.com,
	chenl311@chinatelecom.cn, masahiroy@kernel.org,
	wangyuquan1236@phytium.com.cn, anshuman.khandual@arm.com,
	heinrich.schuchardt@canonical.com, Eric.VanTassell@amd.com,
	wangzhou1@hisilicon.com, wanghuiqiang@huawei.com,
	liuyonglong@huawei.com, linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org, linux-perf-users@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v9 7/7] PCI/TPH: Fix get cpu steer-tag fail on ARM64
 platform
Message-ID: <20260319183219.GA519221@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319065735.45954-8-fengchengwen@huawei.com>
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fengchengwen@huawei.com,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:lenb@kernel.org,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:jonathan.cameron@huawei.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make2
 4@iscas.ac.cn,m:wei.huang2@amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:ryan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy@kernel.org,m:wangyuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[helgaas@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[70];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6F6E02D10BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Let's make the subject a little more specific, e.g.,

  PCI/TPH: Pass ACPI Processor UID to Cache Locality _DSM

On Thu, Mar 19, 2026 at 02:57:35PM +0800, Chengwen Feng wrote:
> pcie_tph_get_cpu_st() is broken on ARM64:
> 1. pcie_tph_get_cpu_st() passes cpu_uid to the PCI ACPI DSM method.
>    cpu_uid should be the ACPI Processor UID [1].
> 2. In BNXT, pcie_tph_get_cpu_st() is passed a cpu_uid obtained via
>    cpumask_first(irq->cpu_mask) - the logical CPU ID of a CPU core,
>    generated and managed by kernel (e.g., [0,255] for a system  with 256
>    logical CPU cores).
> 3. On ARM64 platforms, ACPI assigns Processor UID to cores listed in the
>    MADT table, and this UID may not match the kernel's logical CPU ID.
>    When this occurs, the mismatch results in the wrong CPU steer-tag.
> 4. On AMD x86 the logical CPU ID is identical to the ACPI Processor UID
>    so the mismatch is not seen.
> 
> Resolution:
> 1. Use acpi_get_cpu_uid() in pcie_tph_get_cpu_st() to translate from
>    logical CPU ID to ACPI Processor UID needed for the DSM call.
> 2. Rename pcie_tpu_get_cpu_st() parameter from cpu_uid to cpu to
>    reflect that it is a logical CPU_ID.

And simplify this, e.g.,

  pcie_tph_get_cpu_st() uses the Query Cache Locality Features _DSM
  [1] to retrieve the TPH Steering Tag for memory associated with the
  CPU identified by its "cpu_uid" parameter, a Linux logical CPU ID.

  The _DSM requires a ACPI Processor UID, which pcie_tph_get_cpu_st()
  previously assumed was the same as the Linux logical CPU ID.  This
  is true on x86 but not on arm64, so pcie_tph_get_cpu_st() failed on
  arm64.

  Convert the Linux logical CPU ID to the ACPI Processor UID with
  acpi_get_cpu_uid() before passing it to the _DSM.

If there's a specific error message from BNXT or similar that is a
symptom of this problem, it'd be nice to include that.  Or if the
problem was just poor performance because the _DSM returned the wrong
Steering Tag, you could say something like:

  ... so pcie_tph_get_cpu_st() returned the wrong Steering Tag,
  resulting in poor network performance.

> [1] According to ECN_TPH-ST_Revision_20200924
>     (https://members.pcisig.com/wg/PCI-SIG/document/15470), the input
>     is defined as: "If the target is a processor, then this field
>     represents the ACPI Processor UID of the processor as specified in
>     the MADT. If the target is a processor container, then this field
>     represents the ACPI Processor UID of the processor container as
>     specified in the PPTT."
> 
> Fixes: d2e8a34876ce ("PCI/TPH: Add Steering Tag support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

The patch looks good to me.  Thanks for all your work on this!

Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  Documentation/PCI/tph.rst |  4 ++--
>  drivers/pci/tph.c         | 16 +++++++++++-----
>  include/linux/pci-tph.h   |  4 ++--
>  3 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/PCI/tph.rst b/Documentation/PCI/tph.rst
> index e8993be64fd6..b6cf22b9bd90 100644
> --- a/Documentation/PCI/tph.rst
> +++ b/Documentation/PCI/tph.rst
> @@ -79,10 +79,10 @@ To retrieve a Steering Tag for a target memory associated with a specific
>  CPU, use the following function::
>  
>    int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type type,
> -                          unsigned int cpu_uid, u16 *tag);
> +                          unsigned int cpu, u16 *tag);
>  
>  The `type` argument is used to specify the memory type, either volatile
> -or persistent, of the target memory. The `cpu_uid` argument specifies the
> +or persistent, of the target memory. The `cpu` argument specifies the
>  CPU where the memory is associated to.
>  
>  After the ST value is retrieved, the device driver can use the following
> diff --git a/drivers/pci/tph.c b/drivers/pci/tph.c
> index ca4f97be7538..b67c9ad14bda 100644
> --- a/drivers/pci/tph.c
> +++ b/drivers/pci/tph.c
> @@ -236,21 +236,27 @@ static int write_tag_to_st_table(struct pci_dev *pdev, int index, u16 tag)
>   * with a specific CPU
>   * @pdev: PCI device
>   * @mem_type: target memory type (volatile or persistent RAM)
> - * @cpu_uid: associated CPU id
> + * @cpu: associated CPU id
>   * @tag: Steering Tag to be returned
>   *
>   * Return the Steering Tag for a target memory that is associated with a
> - * specific CPU as indicated by cpu_uid.
> + * specific CPU as indicated by cpu.
>   *
>   * Return: 0 if success, otherwise negative value (-errno)
>   */
>  int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type mem_type,
> -			unsigned int cpu_uid, u16 *tag)
> +			unsigned int cpu, u16 *tag)
>  {
>  #ifdef CONFIG_ACPI
>  	struct pci_dev *rp;
>  	acpi_handle rp_acpi_handle;
>  	union st_info info;
> +	u32 cpu_uid;
> +	int ret;
> +
> +	ret = acpi_get_cpu_uid(cpu, &cpu_uid);
> +	if (ret != 0)
> +		return ret;
>  
>  	rp = pcie_find_root_port(pdev);
>  	if (!rp || !rp->bus || !rp->bus->bridge)
> @@ -265,9 +271,9 @@ int pcie_tph_get_cpu_st(struct pci_dev *pdev, enum tph_mem_type mem_type,
>  
>  	*tag = tph_extract_tag(mem_type, pdev->tph_req_type, &info);
>  
> -	pci_dbg(pdev, "get steering tag: mem_type=%s, cpu_uid=%d, tag=%#04x\n",
> +	pci_dbg(pdev, "get steering tag: mem_type=%s, cpu=%d, tag=%#04x\n",
>  		(mem_type == TPH_MEM_TYPE_VM) ? "volatile" : "persistent",
> -		cpu_uid, *tag);
> +		cpu, *tag);
>  
>  	return 0;
>  #else
> diff --git a/include/linux/pci-tph.h b/include/linux/pci-tph.h
> index ba28140ce670..be68cd17f2f8 100644
> --- a/include/linux/pci-tph.h
> +++ b/include/linux/pci-tph.h
> @@ -25,7 +25,7 @@ int pcie_tph_set_st_entry(struct pci_dev *pdev,
>  			  unsigned int index, u16 tag);
>  int pcie_tph_get_cpu_st(struct pci_dev *dev,
>  			enum tph_mem_type mem_type,
> -			unsigned int cpu_uid, u16 *tag);
> +			unsigned int cpu, u16 *tag);
>  void pcie_disable_tph(struct pci_dev *pdev);
>  int pcie_enable_tph(struct pci_dev *pdev, int mode);
>  u16 pcie_tph_get_st_table_size(struct pci_dev *pdev);
> @@ -36,7 +36,7 @@ static inline int pcie_tph_set_st_entry(struct pci_dev *pdev,
>  { return -EINVAL; }
>  static inline int pcie_tph_get_cpu_st(struct pci_dev *dev,
>  				      enum tph_mem_type mem_type,
> -				      unsigned int cpu_uid, u16 *tag)
> +				      unsigned int cpu, u16 *tag)
>  { return -EINVAL; }
>  static inline void pcie_disable_tph(struct pci_dev *pdev) { }
>  static inline int pcie_enable_tph(struct pci_dev *pdev, int mode)
> -- 
> 2.17.1
> 

