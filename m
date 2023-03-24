Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E706C7ACD
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 10:09:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514232.796292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfdPk-0004vZ-4u; Fri, 24 Mar 2023 09:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514232.796292; Fri, 24 Mar 2023 09:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfdPk-0004t3-1d; Fri, 24 Mar 2023 09:08:48 +0000
Received: by outflank-mailman (input) for mailman id 514232;
 Fri, 24 Mar 2023 09:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fvgu=7Q=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pfdPi-0004sx-Ro
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 09:08:46 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a9cdd1c-ca23-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 10:08:45 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 l15-20020a05600c4f0f00b003ed58a9a15eso499041wmq.5
 for <xen-devel@lists.xenproject.org>; Fri, 24 Mar 2023 02:08:44 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.149])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a7bc7c5000000b003ee1b2ab9a0sm4306039wmk.11.2023.03.24.02.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 02:08:43 -0700 (PDT)
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
X-Inumbo-ID: 7a9cdd1c-ca23-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679648924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tl24kxujrDRhD/Pw1VxqIQuGTyFCOtjGuHoJAXogeUQ=;
        b=KF7vhgGUy9iSCVz/2JMV95cnXXiwuET9tU7Rc7Ha4nCWlEtjrRR52AkRL3JFzV31N8
         FvBvjTemrQpnvLLevT/7WRHrnq6vQTjJaal/zyxaU9lnhkPgeE4ZxxrwnrSeYP5XXpBc
         4V7jndgKaulVRlh2NX+8aC2vQ132DHHauBUvo9d076iWPZ097+573LyCG57UyqnF/weQ
         Wl0cANOGoKc/C+uNjEJ93bVBXPTZ7IkGYmTVHGwGkHxXXK4MlPEb6KAWoXYRQNmd8+4H
         wQFnUqtZsqyWz/Sra/sxWYXnULQ6q5z/LE5eyV19WnrETSaXYW26jzEB3xzi7XfnA3JF
         5cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679648924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tl24kxujrDRhD/Pw1VxqIQuGTyFCOtjGuHoJAXogeUQ=;
        b=hjMxlPbPK9YEp8/MsFqH4jHzxVZJj3jQh1oKZ/3eIh5PPVOr9yynDL7kQQ2W/SJQDw
         B9yAOW4pNHQH1kCV6+ke0+tMnE6FnoUp1pxACquLeMZyTUu183CxN5tME5n7x/v+av+i
         3X5rlEF2Pcq2gfoQc0USYsS9WSQ+jzi6qbOvLKzLk9j0UVMxuOgh7Gy8el+ueufuMItG
         xxfE0JFkwfrzXOlUGYI1eA9Ej9ZVt5aG6nwcZLCj34DnoEHEKOHljDQSsqD8WK33KtPF
         LS8ygynJ3bBCIetNdI38D9+tWKtCilG0sSdM9grWN/f4YBnqhiqg5i9nblkSkuLn3V/X
         9+RA==
X-Gm-Message-State: AO0yUKUtEXvKxRsODAFNXv+RIY0zU+95FQebGPlYx1mDe7A1kl7hATg7
	97fx/6DbAVo3xLE8YDHEBdrnxQ==
X-Google-Smtp-Source: AK7set/vvjAUaOTR5nW6O5SRtNoHqTNaeTjKsckBwHxq1C38GOKprexc3eF5NaIoYwtOC0bG/ZduEw==
X-Received: by 2002:a05:600c:c4:b0:3ed:b048:73f4 with SMTP id u4-20020a05600c00c400b003edb04873f4mr1903820wmm.5.1679648924434;
        Fri, 24 Mar 2023 02:08:44 -0700 (PDT)
Message-ID: <1722e75c-bc06-4a34-5e12-fa3622ed86a3@linaro.org>
Date: Fri, 24 Mar 2023 10:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v7 6/6] PCI: Make use of pci_resource_n()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Anatolij Gustschin <agust@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas
 <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
 <20230323173610.60442-7-andriy.shevchenko@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230323173610.60442-7-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/3/23 18:36, Andy Shevchenko wrote:
> Replace open-coded implementations of pci_resource_n() in pci.h.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   include/linux/pci.h | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 70a4684d5f26..9539cf63fe5e 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2006,14 +2006,12 @@ int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_struct *vma);
>    * for accessing popular PCI BAR info
>    */
>   #define pci_resource_n(dev, bar)	(&(dev)->resource[(bar)])
> -#define pci_resource_start(dev, bar)	((dev)->resource[(bar)].start)
> -#define pci_resource_end(dev, bar)	((dev)->resource[(bar)].end)
> -#define pci_resource_flags(dev, bar)	((dev)->resource[(bar)].flags)
> -#define pci_resource_len(dev,bar) \
> -	((pci_resource_end((dev), (bar)) == 0) ? 0 :	\
> -							\
> -	 (pci_resource_end((dev), (bar)) -		\
> -	  pci_resource_start((dev), (bar)) + 1))
> +#define pci_resource_start(dev, bar)	(pci_resource_n(dev, bar)->start)
> +#define pci_resource_end(dev, bar)	(pci_resource_n(dev, bar)->end)
> +#define pci_resource_flags(dev, bar)	(pci_resource_n(dev, bar)->flags)
> +#define pci_resource_len(dev,bar)					\
> +	(pci_resource_end((dev), (bar)) ? 				\
> +	 resource_size(pci_resource_n((dev), (bar))) : 0)

Seems (to me) more logical to have this patch as "PCI: Introduce 
pci_resource_n()" ordered before your patch #2 "PCI: Introduce 
pci_dev_for_each_resource()".

Here as #6 or as #2:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

