Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEB62DEB7E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 23:21:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56733.99406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqO7c-0003Mu-Qc; Fri, 18 Dec 2020 22:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56733.99406; Fri, 18 Dec 2020 22:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqO7c-0003MV-NB; Fri, 18 Dec 2020 22:21:12 +0000
Received: by outflank-mailman (input) for mailman id 56733;
 Fri, 18 Dec 2020 22:21:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVAa=FW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kqO7b-0003MQ-RB
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 22:21:11 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0decb3a2-4fa6-49b0-9da1-4c517e926ff2;
 Fri, 18 Dec 2020 22:21:08 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BIM9oPV136457;
 Fri, 18 Dec 2020 22:20:55 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 35ckcbvpbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 22:20:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BIMBNlk088681;
 Fri, 18 Dec 2020 22:20:55 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 35d7est623-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 22:20:54 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BIMKojC029673;
 Fri, 18 Dec 2020 22:20:51 GMT
Received: from [10.39.216.141] (/10.39.216.141)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 18 Dec 2020 14:20:50 -0800
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
X-Inumbo-ID: 0decb3a2-4fa6-49b0-9da1-4c517e926ff2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=LFswpajBY9zLf+LGKOD2926z3byOYd3nuJV0gcHFwuo=;
 b=dZp8L4KJhmFq+UyI0FGpmRS3lCVEgKscMT9ACH0ELMbmMUyWzTJr+xE9LxyT/jzRu9gA
 Tnmfv72gEGpi0Ow48z2ZYAXS3A3Zbv4EQz1nqpSbum6WumKxj3a2UuKzOpcTf3I+0tiJ
 G5AY0CEB21mEQ0t5t+A/nVlBf2e11wyaKV11PBf+ThzK+W8t9lkdCLPgygVY+V+n607V
 xlsm8Qn1F59vBzUHgQbwSQ+zqNKwo1wjQGwahXkekEpBbGGqVilpcp6h/+qQQZkOwQDw
 XL6SMAN+ZMXKNKj7dF2DacOcMtSpIjZEnpGY6cbVkOCb3q7u850x5nKNS+3SbRspA+mK LA== 
Subject: Re: [PATCH] xen: Fix event channel callback via INTX/GSI
To: David Woodhouse <dwmw2@infradead.org>, "x86@kernel.org" <x86@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
        jgrall@amazon.com, karahmed@amazon.de,
        xen-devel <xen-devel@lists.xenproject.org>
References: <5ba658b2d8a2bce63622f5bb8ef8d5e6114276eb.camel@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <6b6544ac-06b3-2525-aed9-39015715f71d@oracle.com>
Date: Fri, 18 Dec 2020 17:20:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <5ba658b2d8a2bce63622f5bb8ef8d5e6114276eb.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9839 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9839 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180151


On 12/18/20 11:25 AM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> For a while, event channel notification via the PCI platform device
> has been broken, because we attempt to communicate with xenstore before
> we even have notifications working, in the xs_reset_watches() call
> called from xs_init().
>
> This mostly doesn't matter much in practice because for Xen versions
> below 4.0 we avoid xs_reset_watches() anyway, because xenstore might
> not cope with reading a non-existent key. And newer Xen *does* have
> the vector callback support, so we rarely fall back to INTX/GSI
> delivery.
>
> But those working on Xen and Xen-compatible hypervisor implementations
> do want to test that INTX/GSI delivery works correctly, as there are
> still guest kernels in active use which don't use vector delivery yet.
> So it's useful to have it actually working.


Are there other cases where this would be useful? If it's just to test a hypervisor under development I would think that people who are doing that kind of work are capable of building their own kernel. My concern is mostly about having yet another boot option that is of interest to very few people who can easily work around not having it.


>
> To that end, clean up a bit of the mess of xs_init() and xenbus_probe()
> startup. Call xs_init() directly from xenbus_init() only in the !XS_HVM
> case, deferring it to be called from xenbus_probe() in the XS_HVM case
> instead.
>
> Then fix up the invocation of xenbus_probe() to happen either from its
> device_initcall if the callback is available early enough, or when the
> callback is finally set up. This means that the hack of calling
> xenbus_probe() from a workqueue after the first interrupt is no longer
> needed.
>
> Add a 'no_vector_callback' command line argument to test it.


This last one should be a separate patch I think.


>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/arm/xen/enlighten.c          |  2 +-
>  arch/x86/xen/enlighten_hvm.c      | 11 ++++-
>  drivers/xen/events/events_base.c  | 10 -----
>  drivers/xen/platform-pci.c        |  7 ++++
>  drivers/xen/xenbus/xenbus.h       |  1 +
>  drivers/xen/xenbus/xenbus_comms.c |  8 ----
>  drivers/xen/xenbus/xenbus_probe.c | 68 ++++++++++++++++++++++++-------
>  include/xen/xenbus.h              |  2 +-
>  8 files changed, 74 insertions(+), 35 deletions(-)
>
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index 60e901cd0de6..5a957a9a0984 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -371,7 +371,7 @@ static int __init xen_guest_init(void)
>  	}
>  	gnttab_init();
>  	if (!xen_initial_domain())
> -		xenbus_probe(NULL);
> +		xenbus_probe();
>  
>  	/*
>  	 * Making sure board specific code will not set up ops for
> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
> index 9e87ab010c82..a1c07e0c888e 100644
> --- a/arch/x86/xen/enlighten_hvm.c
> +++ b/arch/x86/xen/enlighten_hvm.c
> @@ -188,6 +188,8 @@ static int xen_cpu_dead_hvm(unsigned int cpu)
>         return 0;
>  }
>  
> +static bool no_vector_callback __initdata;
> +
>  static void __init xen_hvm_guest_init(void)
>  {
>  	if (xen_pv_domain())
> @@ -207,7 +209,7 @@ static void __init xen_hvm_guest_init(void)
>  
>  	xen_panic_handler_init();
>  
> -	if (xen_feature(XENFEAT_hvm_callback_vector))
> +	if (!no_vector_callback && xen_feature(XENFEAT_hvm_callback_vector))
>  		xen_have_vector_callback = 1;
>  
>  	xen_hvm_smp_init();
> @@ -233,6 +235,13 @@ static __init int xen_parse_nopv(char *arg)
>  }
>  early_param("xen_nopv", xen_parse_nopv);
>  
> +static __init int xen_parse_no_vector_callback(char *arg)
> +{
> +	no_vector_callback = true;
> +	return 0;
> +}
> +early_param("no_vector_callback", xen_parse_no_vector_callback);
> +
>  bool __init xen_hvm_need_lapic(void)
>  {
>  	if (xen_pv_domain())
> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
> index 6038c4c35db5..bbebe248b726 100644
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -2010,16 +2010,6 @@ static struct irq_chip xen_percpu_chip __read_mostly = {
>  	.irq_ack		= ack_dynirq,
>  };
>  
> -int xen_set_callback_via(uint64_t via)
> -{
> -	struct xen_hvm_param a;
> -	a.domid = DOMID_SELF;
> -	a.index = HVM_PARAM_CALLBACK_IRQ;
> -	a.value = via;
> -	return HYPERVISOR_hvm_op(HVMOP_set_param, &a);
> -}
> -EXPORT_SYMBOL_GPL(xen_set_callback_via);
> -
>  #ifdef CONFIG_XEN_PVHVM
>  /* Vector callbacks are better than PCI interrupts to receive event
>   * channel notifications because we can receive vector callbacks on any
> diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
> index dd911e1ff782..5c3015a90a73 100644
> --- a/drivers/xen/platform-pci.c
> +++ b/drivers/xen/platform-pci.c
> @@ -132,6 +132,13 @@ static int platform_pci_probe(struct pci_dev *pdev,
>  			dev_warn(&pdev->dev, "request_irq failed err=%d\n", ret);
>  			goto out;
>  		}
> +		/*
> +		 * It doesn't strictly *have* to run on CPU0 but it sure
> +		 * as hell better process the event channel ports delivered
> +		 * to CPU0.
> +		 */
> +		irq_set_affinity(pdev->irq, cpumask_of(0));
> +


Is the concern here that it won't be handled at all?


And is this related to the issue this patch is addressing?


>  		callback_via = get_callback_via(pdev);
>  		ret = xen_set_callback_via(callback_via);
>  		if (ret) {
> diff --git a/drivers/xen/xenbus/xenbus.h b/drivers/xen/xenbus/xenbus.h
> index 5f5b8a7d5b80..05bbda51103f 100644
> --- a/drivers/xen/xenbus/xenbus.h
> +++ b/drivers/xen/xenbus/xenbus.h
> @@ -113,6 +113,7 @@ int xenbus_probe_node(struct xen_bus_type *bus,
>  		      const char *type,
>  		      const char *nodename);
>  int xenbus_probe_devices(struct xen_bus_type *bus);
> +void xenbus_probe(void);
>  
>  void xenbus_dev_changed(const char *node, struct xen_bus_type *bus);
>  
> diff --git a/drivers/xen/xenbus/xenbus_comms.c b/drivers/xen/xenbus/xenbus_comms.c
> index eb5151fc8efa..e5fda0256feb 100644
> --- a/drivers/xen/xenbus/xenbus_comms.c
> +++ b/drivers/xen/xenbus/xenbus_comms.c
> @@ -57,16 +57,8 @@ DEFINE_MUTEX(xs_response_mutex);
>  static int xenbus_irq;
>  static struct task_struct *xenbus_task;
>  
> -static DECLARE_WORK(probe_work, xenbus_probe);
> -
> -
>  static irqreturn_t wake_waiting(int irq, void *unused)
>  {
> -	if (unlikely(xenstored_ready == 0)) {
> -		xenstored_ready = 1;
> -		schedule_work(&probe_work);
> -	}
> -
>  	wake_up(&xb_waitq);
>  	return IRQ_HANDLED;
>  }
> diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
> index 38725d97d909..876f381b100a 100644
> --- a/drivers/xen/xenbus/xenbus_probe.c
> +++ b/drivers/xen/xenbus/xenbus_probe.c
> @@ -682,29 +682,63 @@ void unregister_xenstore_notifier(struct notifier_block *nb)
>  }
>  EXPORT_SYMBOL_GPL(unregister_xenstore_notifier);
>  
> -void xenbus_probe(struct work_struct *unused)
> +void xenbus_probe(void)
>  {
>  	xenstored_ready = 1;
>  
> +	/*
> +	 * In the HVM case, xenbus_init() deferred its call to
> +	 * xs_init() in case callbacks were not operational yet.
> +	 * So do it now.
> +	 */
> +	if (xen_store_domain_type == XS_HVM)
> +		xs_init();
> +
>  	/* Notify others that xenstore is up */
>  	blocking_notifier_call_chain(&xenstore_chain, 0, NULL);
>  }
> -EXPORT_SYMBOL_GPL(xenbus_probe);
>  
>  static int __init xenbus_probe_initcall(void)
>  {
> -	if (!xen_domain())
> -		return -ENODEV;
> -
> -	if (xen_initial_domain() || xen_hvm_domain())
> -		return 0;
> +	/*
> +	 * Probe XenBus here in the XS_PV case, and also XS_HVM unless we
> +	 * need to wait for the platform PCI device to come up, which is
> +	 * the (XEN_PVPVM && !xen_have_vector_callback) case.
> +	 */
> +	if (xen_store_domain_type == XS_PV ||
> +	    (xen_store_domain_type == XS_HVM &&
> +	     (!IS_ENABLED(CONFIG_XEN_PVHVM) || xen_have_vector_callback)))
> +		xenbus_probe();
>  
> -	xenbus_probe(NULL);
>  	return 0;
>  }
> -
>  device_initcall(xenbus_probe_initcall);
>  
> +int xen_set_callback_via(uint64_t via)
> +{
> +	struct xen_hvm_param a;
> +	int ret;
> +
> +	a.domid = DOMID_SELF;
> +	a.index = HVM_PARAM_CALLBACK_IRQ;
> +	a.value = via;
> +
> +	ret = HYPERVISOR_hvm_op(HVMOP_set_param, &a);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * If xenbus_probe_initcall() deferred the xenbus_probe()
> +	 * due to the callback not functioning yet, we can do it now.
> +	 */
> +	if (!xenstored_ready && xen_store_domain_type == XS_HVM &&
> +	    IS_ENABLED(CONFIG_XEN_PVHVM) && !xen_have_vector_callback)


I'd create an is_callback_ready() (or something with a better name) helper.


> +		xenbus_probe();
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(xen_set_callback_via);
> +
>  /* Set up event channel for xenstored which is run as a local process
>   * (this is normally used only in dom0)
>   */
> @@ -817,11 +851,17 @@ static int __init xenbus_init(void)
>  		break;
>  	}
>  
> -	/* Initialize the interface to xenstore. */
> -	err = xs_init();
> -	if (err) {
> -		pr_warn("Error initializing xenstore comms: %i\n", err);
> -		goto out_error;
> +	/*
> +	 * HVM domains may not have a functional callback yet. In that
> +	 * case let xs_init() be called from xenbus_probe(), which will
> +	 * get invoked at an appropriate time.
> +	 */
> +	if (xen_store_domain_type != XS_HVM) {


Can we delay xs_init() for !XS_HVM as well? In other words wait until after PCI platform device has been probed (on HVM) and then call xs_init() for everyone.


-boris


> +		err = xs_init();
> +		if (err) {
> +			pr_warn("Error initializing xenstore comms: %i\n", err);
> +			goto out_error;
> +		}
>  	}
>  
>  	if ((xen_store_domain_type != XS_LOCAL) &&
> diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
> index 5a8315e6d8a6..61202c83d560 100644
> --- a/include/xen/xenbus.h
> +++ b/include/xen/xenbus.h
> @@ -183,7 +183,7 @@ void xs_suspend_cancel(void);
>  
>  struct work_struct;
>  
> -void xenbus_probe(struct work_struct *);
> +void xenbus_probe(void);
>  
>  #define XENBUS_IS_ERR_READ(str) ({			\
>  	if (!IS_ERR(str) && strlen(str) == 0) {		\

