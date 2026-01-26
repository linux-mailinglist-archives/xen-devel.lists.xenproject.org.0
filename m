Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFcoK2XFd2nckgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 20:49:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F054B8CC45
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 20:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214017.1524448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkSaZ-00033K-MY; Mon, 26 Jan 2026 19:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214017.1524448; Mon, 26 Jan 2026 19:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkSaZ-0002zm-IR; Mon, 26 Jan 2026 19:49:31 +0000
Received: by outflank-mailman (input) for mailman id 1214017;
 Mon, 26 Jan 2026 19:49:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dWRf=77=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vkSaY-0002zg-34
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 19:49:30 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e5f8ae2-faf0-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 20:49:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D552660121;
 Mon, 26 Jan 2026 19:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABF5C116C6;
 Mon, 26 Jan 2026 19:49:22 +0000 (UTC)
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
X-Inumbo-ID: 1e5f8ae2-faf0-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769456964;
	bh=y4OL2InCJj7ANEKbgaAtXyG8coS1JKg/AsOVCQz4Tnc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jr4hv14LaAgXe8G5ODoYO+o0t6UmwfE+D/ak+apZozamlh6GkB++RQ0QNWYhSWP/y
	 icuJmf9V3qM8F/sLgz04jkFQ3RSlEEgAzjQ9s84ig0/3Ug6md8UnPkRhXojPFj5F8a
	 l6vO4M/32i49qJ2tBoZLgp7voGgy7bwd0m5ZAuZt6VEl0KbStuwKM5H8itYd0SvAuW
	 8k9sjO4MoKNIfc4s4Jys5nUivWeN0z9xHxcLFFBr9q/SqVMPSLXMA9GXaO5mzFE4u8
	 tRMT7oGBfk3IzFSeqVg01tm+HsiE82/yVSH1UvRVmlWxai5wfE5YgOXgzSly0ev4XC
	 5FcPUwfUjyKFg==
Date: Mon, 26 Jan 2026 11:49:22 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v8 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
In-Reply-To: <695431e2-bcbb-45ca-8276-a0a23f71c12e@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601261148240.7192@ubuntu-linux-20-04-desktop>
References: <cover.1769020872.git.oleksii_moisieiev@epam.com> <f5157ccb30cb1fe32ed9c59963490afd7fc1bb85.1769020872.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2601221741410.7192@ubuntu-linux-20-04-desktop>
 <695431e2-bcbb-45ca-8276-a0a23f71c12e@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-301432995-1769456964=:7192"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jbeulich@suse.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,da_rx.name:url,hdr.id:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F054B8CC45
X-Rspamd-Action: no action

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-301432995-1769456964=:7192
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 26 Jan 2026, Oleksii Moisieiev wrote:
> On 23/01/2026 03:51, Stefano Stabellini wrote:
> > Not a full review, but I found three issues plus some spurious changes
> >
> >
> > On Wed, 21 Jan 2026, Oleksii Moisieiev wrote:
> >> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> >> index 15f7a315a4..268df3010b 100644
> >> --- a/docs/misc/xen-command-line.pandoc
> >> +++ b/docs/misc/xen-command-line.pandoc
> >> @@ -789,7 +789,7 @@ Specify the bit width of the DMA heap.
> >>                   cpuid-faulting=<bool>, msr-relaxed=<bool>,
> >>                   pf-fixup=<bool> ] (x86)
> >>   
> >> -    = List of [ sve=<integer> ] (Arm64)
> >> +    = List of [ sve=<integer> ] (Arm)
> >>   
> >>   Controls for how dom0 is constructed on x86 systems.
> > Spurious change
> >
> >
> >> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> >> index e4407d6e3f..be0e6263ae 100644
> >> --- a/tools/libs/light/libxl_arm.c
> >> +++ b/tools/libs/light/libxl_arm.c
> >> @@ -240,6 +240,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
> >>       case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
> >>           config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
> >>           break;
> >> +    case LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT:
> >> +        config->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA;
> >> +        config->arch.arm_sci_agent_id = d_config->b_info.arch_arm.arm_sci.agent_id;
> >> +        break;
> >>       default:
> >>           LOG(ERROR, "Unknown ARM_SCI type %d",
> >>               d_config->b_info.arch_arm.arm_sci.type);
> >> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> >> index 4a958f69f4..9bfbf09145 100644
> >> --- a/tools/libs/light/libxl_types.idl
> >> +++ b/tools/libs/light/libxl_types.idl
> >> @@ -554,11 +554,13 @@ libxl_sve_type = Enumeration("sve_type", [
> >>   
> >>   libxl_arm_sci_type = Enumeration("arm_sci_type", [
> >>       (0, "none"),
> >> -    (1, "scmi_smc")
> >> +    (1, "scmi_smc"),
> >> +    (2, "scmi_smc_multiagent")
> >>       ], init_val = "LIBXL_ARM_SCI_TYPE_NONE")
> >>   
> >>   libxl_arm_sci = Struct("arm_sci", [
> >>       ("type", libxl_arm_sci_type),
> >> +    ("agent_id", uint8)
> >>       ])
> >>   
> >>   libxl_rdm_reserve = Struct("rdm_reserve", [
> >> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> >> index 1cc41f1bff..0c389d25f9 100644
> >> --- a/tools/xl/xl_parse.c
> >> +++ b/tools/xl/xl_parse.c
> >> @@ -1306,6 +1306,18 @@ static int parse_arm_sci_config(XLU_Config *cfg, libxl_arm_sci *arm_sci,
> >>               }
> >>           }
> >>   
> >> +        if (MATCH_OPTION("agent_id", ptr, oparg)) {
> >> +            unsigned long val = parse_ulong(oparg);
> >> +
> >> +            if (!val || val > 255) {
> >> +                fprintf(stderr, "An invalid ARM_SCI agent_id specified (%lu). Valid range [1..255]\n",
> >> +                        val);
> >> +                ret = ERROR_INVAL;
> >> +                goto out;
> >> +            }
> >> +            arm_sci->agent_id = val;
> >> +        }
> >> +
> >>           ptr = strtok(NULL, ",");
> >>       }
> >>   
> >> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> >> index 4181c10538..ddadc89148 100644
> >> --- a/xen/arch/arm/dom0less-build.c
> >> +++ b/xen/arch/arm/dom0less-build.c
> >> @@ -299,6 +299,17 @@ static int __init domu_dt_sci_parse(struct dt_device_node *node,
> >>           d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
> >>       else if ( !strcmp(sci_type, "scmi_smc") )
> >>           d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
> >> +    else if ( !strcmp(sci_type, "scmi_smc_multiagent") )
> >> +    {
> >> +        uint32_t agent_id = 0;
> >> +
> >> +        if ( !dt_property_read_u32(node, "xen,sci-agent-id", &agent_id) ||
> >> +             agent_id > UINT8_MAX )
> >> +            return -EINVAL;
> >> +
> >> +        d_cfg->arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA;
> >> +        d_cfg->arch.arm_sci_agent_id = agent_id;
> >> +    }
> >>       else
> >>       {
> >>           printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\n",
> >> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> >> index 986a456f17..0796561306 100644
> >> --- a/xen/arch/arm/domain_build.c
> >> +++ b/xen/arch/arm/domain_build.c
> >> @@ -86,6 +86,37 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
> >>       return -EINVAL;
> >>   }
> >>   
> >> +/* SCMI agent ID for dom0 obtained from xen,sci container */
> >> +#define SCMI_AGENT_ID_INVALID UINT8_MAX
> >> +
> >> +static uint8_t __init get_dom0_scmi_agent_id(void)
> >> +{
> >> +    const struct dt_device_node *config_node;
> >> +    u32 val;
> >> +    const struct dt_property *prop;
> >> +
> >> +    config_node = dt_find_compatible_node(NULL, NULL, "xen,sci");
> >> +    if ( !config_node )
> >> +        return SCMI_AGENT_ID_INVALID;
> >> +
> >> +    prop = dt_find_property(config_node, "xen,dom0-sci-agent-id", NULL);
> >> +    if ( !prop )
> >> +        return SCMI_AGENT_ID_INVALID;
> >> +
> >> +    if ( !dt_property_read_u32(config_node, "xen,dom0-sci-agent-id", &val) )
> >> +        return SCMI_AGENT_ID_INVALID;
> >> +
> >> +    if ( val >= SCMI_AGENT_ID_INVALID )
> >> +    {
> >> +         printk(XENLOG_WARNING
> >> +             "Invalid xen,dom0-sci-agent-id=%u, SCMI disabled for Dom0\n",
> >> +             val);
> >> +        return SCMI_AGENT_ID_INVALID;
> >> +    }
> >> +
> >> +    return val;
> >> +}
> >> +
> >>   /* Override macros from asm/page.h to make them work with mfn_t */
> >>   #undef virt_to_mfn
> >>   #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> >> @@ -509,7 +540,7 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
> >>                    dt_property_name_is_equal(prop, "linux,uefi-mmap-start") ||
> >>                    dt_property_name_is_equal(prop, "linux,uefi-mmap-size") ||
> >>                    dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-size") ||
> >> -                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-ver"))
> >> +                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-ver") )
> >>                   continue;
> > Spurious change
> >
> >
> >> +static int scmi_dt_assign_device(struct domain *d,
> >> +                                 struct dt_phandle_args *ac_spec)
> >> +{
> >> +    struct scmi_channel *agent_channel;
> >> +    uint32_t scmi_device_id = ac_spec->args[0];
> >> +    int ret;
> >> +
> >> +    if ( !d->arch.sci_data )
> >> +        return 0;
> >> +
> >> +    /* The access-controllers is specified for DT dev, but it's not a SCMI */
> >> +    if ( ac_spec->np != scmi_data.dt_dev )
> >> +        return 0;
> > This comparison can erroneously fail when the pointers point to
> > different copies of the same data
> >
> >
> >> +    agent_channel = d->arch.sci_data;
> >> +
> >> +    spin_lock(&agent_channel->lock);
> >> +
> >> +    ret = scmi_assign_device(agent_channel->agent_id, scmi_device_id,
> >> +                             SCMI_BASE_DEVICE_ACCESS_ALLOW);
> >> +    if ( ret )
> >> +    {
> >> +        printk(XENLOG_ERR
> >> +               "scmi: could not assign dev for %pd agent:%d dev_id:%u (%d)",
> >> +               d, agent_channel->agent_id, scmi_device_id, ret);
> >> +    }
> >> +
> >> +    spin_unlock(&agent_channel->lock);
> >> +    return ret;
> >> +}
> >> +
> >> +static int collect_agent_id(struct scmi_channel *agent_channel)
> >> +{
> >> +    int ret;
> >> +    scmi_msg_header_t hdr;
> >> +    struct scmi_msg_base_discover_agent_p2a da_rx;
> >> +    struct scmi_msg_base_discover_agent_a2p da_tx;
> >> +
> >> +    ret = map_channel_memory(agent_channel);
> >> +    if ( ret )
> >> +        return ret;
> >> +
> >> +    hdr.id = SCMI_BASE_DISCOVER_AGENT;
> >> +    hdr.type = 0;
> >> +    hdr.protocol = SCMI_BASE_PROTOCOL;
> >> +
> >> +    da_tx.agent_id = agent_channel->agent_id;
> >> +
> >> +    ret = do_smc_xfer(agent_channel, &hdr, &da_tx, sizeof(da_tx), &da_rx,
> >> +                        sizeof(da_rx));
> >> +    if ( agent_channel->domain_id != DOMID_XEN )
> >> +        unmap_channel_memory(agent_channel);
> >> +    if ( ret )
> >> +        return ret;
> >> +
> >> +    printk(XENLOG_DEBUG "id=0x%x name=%s\n", da_rx.agent_id, da_rx.name);
> >> +    agent_channel->agent_id = da_rx.agent_id;
> >> +    return 0;
> >> +}
> >> +
> >> +static __init int collect_agents(struct dt_device_node *scmi_node)
> >> +{
> >> +    const struct dt_device_node *config_node;
> >> +    const __be32 *prop;
> >> +    uint32_t len;
> >> +    const __be32 *end;
> >> +    uint32_t cells_per_entry = 3; /* Default to 3 cells if property is absent. */
> >> +
> >> +    config_node = dt_find_compatible_node(NULL, NULL, "xen,sci");
> >> +    if ( !config_node )
> >> +    {
> >> +        printk(XENLOG_WARNING "scmi: xen,sci node not found, no agents to collect.\n");
> >> +        return -ENOENT;
> >> +    }
> >> +
> >> +    /* Check for the optional '#scmi-secondary-agents-cells' property. */
> >> +    if ( dt_property_read_u32(config_node, "#scmi-secondary-agents-cells",
> >> +                              &cells_per_entry) )
> >> +    {
> >> +        if ( cells_per_entry != 2 && cells_per_entry != 3 )
> >> +        {
> >> +            printk(XENLOG_ERR "scmi: Invalid #scmi-secondary-agents-cells value: %u\n",
> >> +                   cells_per_entry);
> >> +            return -EINVAL;
> >> +        }
> >> +    }
> >> +
> >> +    prop = dt_get_property(config_node, SCMI_SECONDARY_AGENTS, &len);
> >> +    if ( !prop )
> >> +    {
> >> +        printk(XENLOG_ERR "scmi: No %s property found, no agents to collect.\n",
> >> +               SCMI_SECONDARY_AGENTS);
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    /* Validate that the property length is a multiple of the cell size. */
> >> +    if ( len == 0 || len % (cells_per_entry * sizeof(uint32_t)) != 0 )
> >> +    {
> >> +        printk(XENLOG_ERR "scmi: Invalid length of %s property: %u for %u cells per entry\n",
> >> +               SCMI_SECONDARY_AGENTS, len, cells_per_entry);
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    end = (const __be32 *)((const u8 *)prop + len);
> >> +
> >> +    for ( ; prop < end; )
> >> +    {
> >> +        uint32_t agent_id;
> >> +        uint32_t smc_id;
> >> +        uint32_t shmem_phandle;
> >> +        struct dt_device_node *node;
> >> +        u64 addr, size;
> >> +        int ret;
> >> +        struct scmi_channel *agent_channel;
> >> +
> >> +        smc_id = be32_to_cpu(*prop++);
> >> +        shmem_phandle = be32_to_cpu(*prop++);
> >> +
> >> +        if ( cells_per_entry == 3 )
> >> +            agent_id = be32_to_cpu(*prop++);
> >> +        else
> >> +            agent_id = SCMI_BASE_AGENT_ID_OWN;
> >> +
> >> +        node = dt_find_node_by_phandle(shmem_phandle);
> >> +        if ( !node )
> >> +        {
> >> +            printk(XENLOG_ERR "scmi: Could not find shmem node for agent %u\n",
> >> +                   agent_id);
> >> +            return -EINVAL;
> >> +        }
> >> +
> >> +        ret = dt_device_get_address(node, 0, &addr, &size);
> >> +        if ( ret )
> >> +        {
> >> +            printk(XENLOG_ERR
> >> +                   "scmi: Could not read shmem address for agent %u: %d\n",
> >> +                   agent_id, ret);
> >> +            return ret;
> >> +        }
> >> +
> >> +        if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
> >> +        {
> >> +            printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
> >> +            return -EINVAL;
> >> +        }
> >> +
> >> +        agent_channel = smc_create_channel(agent_id, smc_id, addr);
> >> +        if ( IS_ERR(agent_channel) )
> >> +        {
> >> +            printk(XENLOG_ERR "scmi: Could not create channel for agent %u: %ld\n",
> >> +                   agent_id, PTR_ERR(agent_channel));
> >> +            return PTR_ERR(agent_channel);
> >> +        }
> >> +
> >> +        if ( cells_per_entry == 2 )
> >> +        {
> >> +            ret = collect_agent_id(agent_channel);
> >> +            if ( ret )
> >> +                return ret;
> >> +        }
> >> +
> >> +        printk(XENLOG_DEBUG "scmi: Agent %u SMC %X addr %lx\n", agent_channel->agent_id,
> >> +               smc_id, (unsigned long)addr);
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int scmi_domain_init(struct domain *d,
> >> +                            struct xen_domctl_createdomain *config)
> >> +{
> >> +    struct scmi_channel *channel;
> >> +    int ret;
> >> +
> >> +    if ( !scmi_data.initialized )
> >> +        return 0;
> >> +
> >> +    /*
> >> +     * SCMI support is configured via:
> >> +     * - For dom0: xen,dom0-sci-agent-id property under the xen,sci container
> >> +     * - For dom0less: xen,sci-agent-id in the domain node
> >> +     * The config->arch.arm_sci_type and config->arch.arm_sci_agent_id
> >> +     * are already set by domain_build.c or dom0less-build.c
> >> +     */
> >> +
> >> +    if ( config->arch.arm_sci_type == XEN_DOMCTL_CONFIG_ARM_SCI_NONE )
> >> +        return 0;
> >> +
> >> +    channel = acquire_scmi_channel(d, config->arch.arm_sci_agent_id);
> >> +    if ( IS_ERR(channel) )
> >> +    {
> >> +        printk(XENLOG_ERR
> >> +               "scmi: Failed to acquire SCMI channel for agent_id %u: %ld\n",
> >> +               config->arch.arm_sci_agent_id, PTR_ERR(channel));
> >> +        return PTR_ERR(channel);
> >> +    }
> >> +
> >> +    printk(XENLOG_INFO
> >> +           "scmi: Acquire channel id = 0x%x, domain_id = %d paddr = 0x%lx\n",
> >> +           channel->agent_id, channel->domain_id, channel->paddr);
> >> +
> >> +    /*
> >> +     * Dom0 (if present) needs to have an access to the guest memory range
> >> +     * to satisfy iomem_access_permitted() check in XEN_DOMCTL_iomem_permission
> >> +     * domctl.
> >> +     */
> >> +    if ( hardware_domain && !is_hardware_domain(d) )
> >> +    {
> >> +        ret = iomem_permit_access(hardware_domain, paddr_to_pfn(channel->paddr),
> >> +                                  paddr_to_pfn(channel->paddr + PAGE_SIZE - 1));
> >> +        if ( ret )
> >> +            goto error;
> >> +    }
> >> +
> >> +    d->arch.sci_data = channel;
> >> +    d->arch.sci_enabled = true;
> >> +
> >> +    return 0;
> >> +
> >> +error:
> >> +    relinquish_scmi_channel(channel);
> >> +    return ret;
> >> +}
> >> +
> >> +int scmi_domain_sanitise_config(struct xen_domctl_createdomain *config)
> >> +{
> >> +    if ( config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_NONE &&
> >> +         config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA )
> >> +    {
> >> +        dprintk(XENLOG_INFO, "scmi: Unsupported ARM_SCI type\n");
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int scmi_relinquish_resources(struct domain *d)
> >> +{
> >> +    int ret;
> >> +    struct scmi_channel *channel, *agent_channel;
> >> +    scmi_msg_header_t hdr;
> >> +    struct scmi_msg_base_reset_agent_cfg_a2p tx;
> >> +
> >> +    if ( !d->arch.sci_data )
> >> +        return 0;
> >> +
> >> +    agent_channel = d->arch.sci_data;
> >> +
> >> +    spin_lock(&agent_channel->lock);
> >> +    tx.agent_id = agent_channel->agent_id;
> >> +    spin_unlock(&agent_channel->lock);
> >> +
> >> +    channel = get_channel_by_id(scmi_data.hyp_channel_agent_id);
> >> +    if ( !channel )
> >> +    {
> >> +        printk(XENLOG_ERR
> >> +               "scmi: Unable to get Hypervisor scmi channel for domain %d\n",
> >> +               d->domain_id);
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    hdr.id = SCMI_BASE_RESET_AGENT_CONFIGURATION;
> >> +    hdr.type = 0;
> >> +    hdr.protocol = SCMI_BASE_PROTOCOL;
> >> +
> >> +    tx.flags = 0;
> > is this correct?
> >
> >
> >> +    ret = do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
> >> +    if ( ret == -EOPNOTSUPP )
> >> +        return 0;
> >> +
> >> +    return ret;
> >> +}
> >> +
> >> +static void scmi_domain_destroy(struct domain *d)
> >> +{
> >> +    struct scmi_channel *channel;
> >> +
> >> +    if ( !d->arch.sci_data )
> >> +        return;
> >> +
> >> +    channel = d->arch.sci_data;
> >> +    spin_lock(&channel->lock);
> >> +
> >> +    relinquish_scmi_channel(channel);
> >> +    printk(XENLOG_DEBUG "scmi: Free domain %d\n", d->domain_id);
> >> +
> >> +    d->arch.sci_data = NULL;
> >> +    d->arch.sci_enabled = false;
> >> +
> >> +    spin_unlock(&channel->lock);
> >> +}
> >> +
> >> +static bool scmi_handle_call(struct cpu_user_regs *regs)
> >> +{
> >> +    uint32_t fid = (uint32_t)get_user_reg(regs, 0);
> >> +    struct scmi_channel *agent_channel;
> >> +    struct domain *d = current->domain;
> >> +    struct arm_smccc_res resp;
> >> +    bool res = false;
> >> +
> >> +    if ( !sci_domain_is_enabled(d) )
> >> +        return false;
> >> +
> >> +    agent_channel = d->arch.sci_data;
> >> +    spin_lock(&agent_channel->lock);
> >> +
> >> +    if ( agent_channel->func_id != fid )
> >> +    {
> >> +        res = false;
> >> +        goto unlock;
> >> +    }
> >> +
> >> +    arm_smccc_1_1_smc(fid,
> >> +                      get_user_reg(regs, 1),
> >> +                      get_user_reg(regs, 2),
> >> +                      get_user_reg(regs, 3),
> >> +                      get_user_reg(regs, 4),
> >> +                      get_user_reg(regs, 5),
> >> +                      get_user_reg(regs, 6),
> >> +                      get_user_reg(regs, 7),
> >> +                      &resp);
> >> +
> >> +    set_user_reg(regs, 0, resp.a0);
> >> +    set_user_reg(regs, 1, resp.a1);
> >> +    set_user_reg(regs, 2, resp.a2);
> >> +    set_user_reg(regs, 3, resp.a3);
> >> +    res = true;
> >> +unlock:
> >> +    spin_unlock(&agent_channel->lock);
> >> +
> >> +    return res;
> >> +}
> >> +
> >> +static const struct sci_mediator_ops scmi_ops = {
> >> +    .domain_init = scmi_domain_init,
> >> +    .domain_destroy = scmi_domain_destroy,
> >> +    .relinquish_resources = scmi_relinquish_resources,
> >> +    .handle_call = scmi_handle_call,
> >> +    .dom0_dt_handle_node = scmi_dt_handle_node,
> >> +    .domain_sanitise_config = scmi_domain_sanitise_config,
> >> +    .assign_dt_device = scmi_dt_assign_device,
> >> +};
> >> +
> >> +static int __init scmi_check_smccc_ver(void)
> >> +{
> >> +    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
> >> +    {
> >> +        printk(XENLOG_WARNING
> >> +               "scmi: No SMCCC 1.1 support, SCMI calls forwarding disabled\n");
> >> +        return -ENOSYS;
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static int __init scmi_dt_hyp_channel_read(struct dt_device_node *scmi_node,
> >> +                                           struct scmi_data *scmi_data,
> >> +                                           u64 *addr)
> >> +{
> >> +    int ret;
> >> +    u64 size;
> >> +
> >> +    if ( !dt_property_read_u32(scmi_node, "arm,smc-id", &scmi_data->func_id) )
> >> +    {
> >> +        printk(XENLOG_ERR "scmi: unable to read smc-id from DT\n");
> >> +        return -ENOENT;
> >> +    }
> >> +
> >> +    ret = scmi_dt_read_hyp_channel_addr(scmi_node, addr, &size);
> >> +    if ( IS_ERR_VALUE(ret) )
> >> +        return -ENOENT;
> >> +
> >> +    if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
> >> +    {
> >> +        printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static __init int scmi_probe(struct dt_device_node *scmi_node, const void *data)
> >> +{
> >> +    u64 addr;
> >> +    int ret;
> >> +    struct scmi_channel *channel;
> >> +    unsigned int n_agents;
> >> +    scmi_msg_header_t hdr;
> >> +    struct scmi_msg_base_attributes_p2a rx;
> >> +
> >> +    ASSERT(scmi_node != NULL);
> >> +
> >> +    /*
> >> +     * Only bind to the SCMI node provided by Xen under the xen,sci container
> >> +     * (e.g. /chosen/xen/xen_scmi_config/scmi). This avoids binding to firmware
> >> +     * SCMI nodes that belong to the host OSPM and keeps the mediator scoped to
> >> +     * Xen-provided configuration only.
> >> +     */
> >> +    if ( !scmi_is_under_xen_sci(scmi_node) )
> >> +        return -ENODEV;
> >> +
> >> +    INIT_LIST_HEAD(&scmi_data.channel_list);
> >> +    spin_lock_init(&scmi_data.channel_list_lock);
> >> +
> >> +    if ( !acpi_disabled )
> >> +    {
> >> +        printk(XENLOG_WARNING "scmi: is not supported when using ACPI\n");
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    ret = scmi_check_smccc_ver();
> >> +    if ( ret )
> >> +        return ret;
> >> +
> >> +    ret = scmi_dt_hyp_channel_read(scmi_node, &scmi_data, &addr);
> >> +    if ( ret )
> >> +        return ret;
> >> +
> >> +    scmi_data.dt_dev = scmi_node;
> >> +
> >> +    channel = smc_create_channel(SCMI_BASE_AGENT_ID_OWN, scmi_data.func_id, addr);
> >> +    if ( IS_ERR(channel) )
> >> +        goto out;
> >> +
> >> +    /* Mark as Xen management channel before collecting agent ID */
> >> +    channel->domain_id = DOMID_XEN;
> >> +
> >> +    /* Request agent id for Xen management channel  */
> >> +    ret = collect_agent_id(channel);
> >> +    if ( ret )
> >> +        goto error;
> >> +
> >> +    /* Save the agent id for Xen management channel */
> >> +    scmi_data.hyp_channel_agent_id = channel->agent_id;
> >> +
> >> +    hdr.id = SCMI_BASE_PROTOCOL_ATTIBUTES;
> >> +    hdr.type = 0;
> >> +    hdr.protocol = SCMI_BASE_PROTOCOL;
> >> +
> >> +    ret = do_smc_xfer(channel, &hdr, NULL, 0, &rx, sizeof(rx));
> >> +    if ( ret )
> >> +        goto error;
> >> +
> >> +    n_agents = SCMI_FIELD_GET(SCMI_BASE_ATTR_NUM_AGENT, rx.attributes);
> >> +    printk(XENLOG_DEBUG "scmi: Got agent count %d\n", n_agents);
> >> +    ret = collect_agents(scmi_node);
> >> +    if ( ret )
> >> +        goto error;
> >> +
> >> +    ret = sci_register(&scmi_ops);
> >> +    if ( ret )
> >> +    {
> >> +        printk(XENLOG_ERR "SCMI: mediator already registered (ret = %d)\n",
> >> +               ret);
> >> +        return ret;
> >> +    }
> >> +
> >> +    scmi_data.initialized = true;
> >> +    goto out;
> >> +
> >> +error:
> >> +    unmap_channel_memory(channel);
> > This might cause the ASSERT at the beginning of unmap_channel_memory to
> > trigger
> >
> >
> Great finding... First `goto error` could be called after 
> `collect_agent_id`.
> So in case if we receive -ENOMEM from `ioremap_nocache` inside 
> `map_channel_memory`
> ASSERT will fire.
> 
> I'm planning to refactor this as follows:
> 
>      static void unmap_channel_memory(struct scmi_channel *channel)
>      {
>          ASSERT(channel);
> 
>          if ( !channel->shmem )
>              return;
>          ...
>       }
> 
> This will cause function to skip iounmap if shmem is NULL;
> What do you think?

Yes that's better
--8323329-301432995-1769456964=:7192--

