Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2037610E1C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 12:10:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431876.684528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooMJX-0007vQ-9w; Fri, 28 Oct 2022 10:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431876.684528; Fri, 28 Oct 2022 10:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooMJX-0007sb-69; Fri, 28 Oct 2022 10:10:11 +0000
Received: by outflank-mailman (input) for mailman id 431876;
 Fri, 28 Oct 2022 10:10:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3R+4=25=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1ooMJV-0007sI-Ae
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 10:10:09 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b27ddbb9-56a8-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 12:10:07 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id b29so4390352pfp.13
 for <xen-devel@lists.xenproject.org>; Fri, 28 Oct 2022 03:10:07 -0700 (PDT)
Received: from leoy-huanghe.lan (211-75-219-199.hinet-ip.hinet.net.
 [211.75.219.199]) by smtp.gmail.com with ESMTPSA id
 p11-20020a1709026b8b00b0017fe9b038fdsm2678944plk.14.2022.10.28.03.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 03:10:05 -0700 (PDT)
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
X-Inumbo-ID: b27ddbb9-56a8-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qoRKvtVQlXySzXk8G6GxZl37sL+q1/QwV2HPSxPeiwQ=;
        b=EvFGmUcam85mPU0pWZxH6ePEah+NiQ92/juH9eZ9nt6RwEhkupBOFeXHHiewO+VGm4
         cK/0HvtCy24KHAdyppSXLcQNaDXTh9diezwJi2Nn/9qhiVhNECMkJNK+MVIj6m7v5T22
         bh2AOrfEI2a4OiWM+1mYbdBm8xc5ITGTIJ5nGLbW2rggipCQjlmrIDj1hYVRBaBpwICv
         3DWWCXyaLxb68pypPfOtdT66Gshga9EyHM/6V5Sxab5100RjHYQ4TDiS4VJZPglZmjgI
         qaRmNU91LzgQ3/60W08nm67WuJYmzvNv86D7Fze9nvhbQp8nWerY7IXBm5x0yF0C3asw
         omvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoRKvtVQlXySzXk8G6GxZl37sL+q1/QwV2HPSxPeiwQ=;
        b=uAal0i5eCnFsMh/y4GLh07lUdjRGwGz7+mpu7JcK+V79yS9QuwjvKXzLOdhGsf1T6Y
         7Z8j/3kNstGMpDm342JC5q84UXczEdvd/uiYlIvu2OqWR6QgOGBWl17qlK6rkTDI9+UI
         vcPQPylGZIE6NzlAOsE51ncSeYjJivDtx6/ZqNdbcQ5NC/yhl5x06qNQq30yEhJJf2zX
         6P847MoiPLtQSsu+bEtakSOBJrZFOC0FeXgq+PzXD+LqFLva0HPKR+POPeuvQ3JnWWx8
         3i8E5qYdSk+WdYBv/aCMghUcO1JJr3MdBGHih6Ph6gwcZCmFVaX+ZghtZxTEtXiJBZX5
         suQA==
X-Gm-Message-State: ACrzQf3/qongQonOdaX9w8YUdEFJgl5ZiShN84Rge8WpvVyGPAsctyJT
	nkJBnbxjvtS2eEP2+QzKQdjCZw==
X-Google-Smtp-Source: AMsMyM5F7/JB5P5Mo8KOtDo05NIjk05htZLFA9MKQVlsl7hYw5B3L+bPTBRrgVivHZS1+pKwqqfGDQ==
X-Received: by 2002:a63:ea4a:0:b0:439:4695:c0f8 with SMTP id l10-20020a63ea4a000000b004394695c0f8mr45676573pgk.440.1666951806030;
        Fri, 28 Oct 2022 03:10:06 -0700 (PDT)
Date: Fri, 28 Oct 2022 18:09:58 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen Develop <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Kasper Ornstein Mecklenburg <Kasper.OrnsteinMecklenburg@arm.com>,
	jgross@suse.com, oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com, wei.liu@kernel.org, paul@xen.org
Subject: Re: Issue: Networking performance in Xen VM on Arm64
Message-ID: <Y1uqdr1j9YwuIUBU@leoy-huanghe.lan>
References: <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop>
 <Y0VbQ3esM8gucmqQ@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210111434240.3690179@ubuntu-linux-20-04-desktop>
 <Y00/SW5Ro+SlhoBU@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210171638080.4587@ubuntu-linux-20-04-desktop>
 <Y1J39UsPlM8htxFx@leoy-huanghe.lan>
 <alpine.DEB.2.22.394.2210211341440.3873@ubuntu-linux-20-04-desktop>
 <Y1ZvDt7/I9JXJh2r@leoy-huanghe.lan>
 <alpine.DEB.2.22.394.2210251655420.1397955@ubuntu-linux-20-04-desktop>
 <Y1umvVrGLktIvJuk@leoy-huanghe.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1umvVrGLktIvJuk@leoy-huanghe.lan>

On Fri, Oct 28, 2022 at 05:54:05PM +0800, Leo Yan wrote:

[...]

> If map to the code, I think the function xennet_start_xmit() in Xen
> frontend driver is critical for the sending interval in domU.  I can
> see several things cost time when sending a packet:
> 
> - Xen frontend driver needs to setup grant table for every skb, it
>   invokes the function xennet_tx_setup_grant() and
>   gnttab_grant_foreign_access_ref() to prepare grant table;
> 
> - Xen frontend driver sends notification by calling
>   notify_remote_via_irq().  It will trap to Xen hypervisor to send the
>   interrupt, this takes several macro seonds for this step.
> 
> - Xen frontend driver calls xennet_tx_buf_gc(), the interval for this
>   function is vary, it will take ~30us in the case for reclaiming grant
>   table.
> 
> Any thoughts for this?

Supplement info with Ftrace function graph.  You could see below
log which shows the time is spent in xennet_start_xmit():

 1)               |  xennet_start_xmit() {
 1)               |  /* xennet_start_xmit: TSC: 50702652609 */
 1)   0.240 us    |    _raw_spin_lock_irqsave();
 1)               |    netif_skb_features() {
 1)   0.280 us    |      skb_network_protocol();
 1)   0.920 us    |    }
 1)               |    gnttab_foreach_grant_in_range() {
 1)               |      xennet_tx_setup_grant() {
 1)   0.280 us    |        gnttab_claim_grant_reference();
 1)               |        gnttab_grant_foreign_access_ref() {
 1)   0.280 us    |          gnttab_update_entry_v1();
 1)   0.800 us    |        }
 1)               |        /* id=103 ref=871 offset=2050 len=1514 TSC: 50702652709 */
 1)   2.200 us    |      }
 1)   2.800 us    |    }
 1)               |  /* xennet_notify_tx_irq: TSC: 50702652741 */
 1)               |    notify_remote_via_irq() {
 1)               |      irq_get_irq_data() {
 1)   0.240 us    |        irq_to_desc();
 1)   0.760 us    |      }
 1)   3.880 us    |    }
 1)   0.280 us    |    xennet_tx_buf_gc();
 1)   0.240 us    |    _raw_spin_unlock_irqrestore();
 1) + 11.120 us   |  }
 1)               |  xennet_start_xmit() {
 1)               |  /* xennet_start_xmit: TSC: 50702652974 */
 1)   0.280 us    |    _raw_spin_lock_irqsave();
 1)               |    netif_skb_features() {
 1)   0.240 us    |      skb_network_protocol();
 1)   0.760 us    |    }
 1)               |    gnttab_foreach_grant_in_range() {
 1)               |      xennet_tx_setup_grant() {
 1)   0.280 us    |        gnttab_claim_grant_reference();
 1)               |        gnttab_grant_foreign_access_ref() {
 1)   0.360 us    |          gnttab_update_entry_v1();
 1)   0.840 us    |        }
 1)               |        /* id=101 ref=869 offset=1026 len=574 TSC: 50702653093 */
 1)   2.800 us    |      }
 1)   3.320 us    |    }
 1)               |  /* xennet_notify_tx_irq: TSC: 50702653124 */
 1)               |    notify_remote_via_irq() {
 1)               |      irq_get_irq_data() {
 1)   0.240 us    |        irq_to_desc();
 1)   0.760 us    |      }
 1)   3.840 us    |    }
 1)   0.280 us    |    xennet_tx_buf_gc();
 1)   0.280 us    |    _raw_spin_unlock_irqrestore();
 1) + 11.800 us   |  }
 1)               |  /* finish_transmit_data */
 1)               |  /* transmit_data */
 1)               |  /* finish_transmit_data */
 1)               |  /* transmit_data */
 1)               |  /* finish_transmit_data */
 1)               |  /* transmit_data */
 1)               |  /* finish_transmit_data */
 1)               |  /* Before_throttle */
 1)               |  xennet_start_xmit() {
 1)               |  /* xennet_start_xmit: TSC: 50702654697 */
 1)   0.280 us    |    _raw_spin_lock_irqsave();
 1)               |    netif_skb_features() {
 1)   0.240 us    |      skb_network_protocol();
 1)   0.760 us    |    }
 1)               |    gnttab_foreach_grant_in_range() {
 1)               |      xennet_tx_setup_grant() {
 1)   0.280 us    |        gnttab_claim_grant_reference();
 1)               |        gnttab_grant_foreign_access_ref() {
 1)   0.320 us    |          gnttab_update_entry_v1();
 1)   0.920 us    |        }
 1)               |        /* id=3 ref=771 offset=2050 len=1514 TSC: 50702654801 */
 1)   2.400 us    |      }
 1)   2.960 us    |    }
 1)               |  /* xennet_notify_tx_irq: TSC: 50702654832 */
 1)               |    notify_remote_via_irq() {
 1)               |      irq_get_irq_data() {
 1)   0.280 us    |        irq_to_desc();
 1)   0.760 us    |      }
 1)   4.160 us    |    }
 1)               |    xennet_tx_buf_gc() {
 1)               |      gnttab_end_foreign_access_ref() {
 1)   0.480 us    |        gnttab_end_foreign_access_ref_v1();
 1)   0.960 us    |      }
 1)   0.280 us    |      gnttab_release_grant_reference();
 1)               |      __dev_kfree_skb_irq() {
 1)   0.240 us    |        __raise_softirq_irqoff();
 1)   1.240 us    |      }
 1)               |      gnttab_end_foreign_access_ref() {
 1)   0.480 us    |        gnttab_end_foreign_access_ref_v1();
 1)   0.960 us    |      }
 1)   0.240 us    |      gnttab_release_grant_reference();
 1)               |      __dev_kfree_skb_irq() {
 1)   0.240 us    |        __raise_softirq_irqoff();
 1)   0.760 us    |      }
 1)               |      gnttab_end_foreign_access_ref() {
 1)   0.400 us    |        gnttab_end_foreign_access_ref_v1();
 1)   0.840 us    |      }
 1)   0.280 us    |      gnttab_release_grant_reference();
 1)               |      __dev_kfree_skb_irq() {
 1)   0.280 us    |        __raise_softirq_irqoff();
 1)   0.880 us    |      }
 1)               |      gnttab_end_foreign_access_ref() {
 1)   0.360 us    |        gnttab_end_foreign_access_ref_v1();
 1)   0.840 us    |      }
 1)   0.240 us    |      gnttab_release_grant_reference();
 1)               |      __dev_kfree_skb_irq() {
 1)   0.240 us    |        __raise_softirq_irqoff();
 1)   0.760 us    |      }
 1)               |      gnttab_end_foreign_access_ref() {
 1)   0.240 us    |        gnttab_end_foreign_access_ref_v1();
 1)   0.760 us    |      }
 1)   0.240 us    |      gnttab_release_grant_reference();
 1)               |      __dev_kfree_skb_irq() {
 1)   0.240 us    |        __raise_softirq_irqoff();
 1)   0.760 us    |      }
 1)               |      gnttab_end_foreign_access_ref() {
 1)   0.360 us    |        gnttab_end_foreign_access_ref_v1();
 1)   0.960 us    |      }
 1)   0.240 us    |      gnttab_release_grant_reference();
 1)               |      __dev_kfree_skb_irq() {
 1)   0.240 us    |        __raise_softirq_irqoff();
 1)   0.760 us    |      }
 1) + 17.720 us   |    }
 1)   0.360 us    |    _raw_spin_unlock_irqrestore();
 1) + 29.320 us   |  }
 1)               |  xennet_start_xmit() {
 1)               |  /* xennet_start_xmit: TSC: 50702655824 */
 1)   0.360 us    |    _raw_spin_lock_irqsave();
 1)               |    netif_skb_features() {
 1)   0.280 us    |      skb_network_protocol();
 1)   0.760 us    |    }
 1)               |    gnttab_foreach_grant_in_range() {
 1)               |      xennet_tx_setup_grant() {
 1)   0.280 us    |        gnttab_claim_grant_reference();
 1)               |        gnttab_grant_foreign_access_ref() {
 1)   0.280 us    |          gnttab_update_entry_v1();
 1)   0.880 us    |        }
 1)               |        /* id=28 ref=796 offset=2 len=1514 TSC: 50702655925 */
 1)   2.280 us    |      }
 1)   2.920 us    |    }
 1)               |  /* xennet_notify_tx_irq: TSC: 50702655958 */
 1)               |    notify_remote_via_irq() {
 1)               |      irq_get_irq_data() {
 1)   0.280 us    |        irq_to_desc();
 1)   0.760 us    |      }
 1)   4.160 us    |    }
 1)               |    xennet_tx_buf_gc() {
 1)               |      gnttab_end_foreign_access_ref() {
 1)   0.360 us    |        gnttab_end_foreign_access_ref_v1();
 1)   0.880 us    |      }
 1)   0.280 us    |      gnttab_release_grant_reference();
 1)               |      __dev_kfree_skb_irq() {
 1)   0.280 us    |        __raise_softirq_irqoff();
 1)   1.280 us    |      }
 1)               |      gnttab_end_foreign_access_ref() {
 1)   0.360 us    |        gnttab_end_foreign_access_ref_v1();
 1)   0.880 us    |      }
 1)   0.760 us    |      gnttab_release_grant_reference();
 1)               |      __dev_kfree_skb_irq() {
 1)   0.280 us    |        __raise_softirq_irqoff();
 1)   0.760 us    |      }
 1)               |      gnttab_end_foreign_access_ref() {
 1)   0.400 us    |        gnttab_end_foreign_access_ref_v1();
 1)   0.880 us    |      }
 1)   0.240 us    |      gnttab_release_grant_reference();
 1)               |      __dev_kfree_skb_irq() {
 1)   0.400 us    |        __raise_softirq_irqoff();
 1)   0.880 us    |      }
 1)               |      gnttab_end_foreign_access_ref() {
 1)   0.400 us    |        gnttab_end_foreign_access_ref_v1();
 1)   0.880 us    |      }
 1)   0.280 us    |      gnttab_release_grant_reference();
 1)               |      __dev_kfree_skb_irq() {
 1)   0.240 us    |        __raise_softirq_irqoff();
 1)   0.760 us    |      }
 1) + 12.440 us   |    }
 1)   0.800 us    |    _raw_spin_unlock_irqrestore();
 1) + 24.080 us   |  }
 1)               |  xennet_start_xmit() {
 1)               |  /* xennet_start_xmit: TSC: 50702656728 */
 1)   0.240 us    |    _raw_spin_lock_irqsave();
 1)               |    netif_skb_features() {
 1)   0.240 us    |      skb_network_protocol();
 1)   0.760 us    |    }
 1)               |    gnttab_foreach_grant_in_range() {
 1)               |      xennet_tx_setup_grant() {
 1)   0.280 us    |        gnttab_claim_grant_reference();
 1)               |        gnttab_grant_foreign_access_ref() {
 1)   0.240 us    |          gnttab_update_entry_v1();
 1)   0.720 us    |        }
 1)               |        /* id=103 ref=871 offset=2050 len=1422 TSC: 50702656823 */
 1)   2.160 us    |      }
 1)   2.800 us    |    }
 1)               |  /* xennet_notify_tx_irq: TSC: 50702656850 */
 1)               |    notify_remote_via_irq() {
 1)               |      irq_get_irq_data() {
 1)   0.240 us    |        irq_to_desc();
 1)   0.720 us    |      }
 1)   3.920 us    |    }
 1)   0.320 us    |    xennet_tx_buf_gc();
 1)   0.280 us    |    _raw_spin_unlock_irqrestore();
 1) + 11.000 us   |  }


