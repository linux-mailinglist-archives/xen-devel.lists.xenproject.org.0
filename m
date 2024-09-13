Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CD5977AAD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 10:07:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798057.1208204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp1Kx-0007RG-Do; Fri, 13 Sep 2024 08:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798057.1208204; Fri, 13 Sep 2024 08:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp1Kx-0007OY-Ad; Fri, 13 Sep 2024 08:07:27 +0000
Received: by outflank-mailman (input) for mailman id 798057;
 Fri, 13 Sep 2024 08:07:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T2Jz=QL=embeddedor.com=gustavo@srs-se1.protection.inumbo.net>)
 id 1sp1Kw-0007OS-I0
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 08:07:26 +0000
Received: from omta036.useast.a.cloudfilter.net
 (omta036.useast.a.cloudfilter.net [44.202.169.35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 346b626f-71a7-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 10:07:23 +0200 (CEST)
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
 by cmsmtp with ESMTPS
 id oKA9sqZZ1iA19p1Kssaeni; Fri, 13 Sep 2024 08:07:22 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id p1KqsGZ7Ai3Rgp1KqsOmWm; Fri, 13 Sep 2024 08:07:21 +0000
Received: from [185.44.53.103] (port=33586 helo=[192.168.1.187])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1sp1Kp-003hly-34;
 Fri, 13 Sep 2024 03:07:20 -0500
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
X-Inumbo-ID: 346b626f-71a7-11ef-99a2-01e77a169b0f
X-Authority-Analysis: v=2.4 cv=WootM8fv c=1 sm=1 tr=0 ts=66e3f2b9
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=rpUMG24A1zG+UrzXDtAMsg==:17
 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=XDqWC4Y5o2EKXtXKao0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6KfcZtPVeZZV/1trMGJbgYpR83sGh6LCzvZuwD+hI2A=; b=hQ1sYzGqhnO9XQDtwWNSTBhuyX
	5xBTO8VpxiBaSx6ob4XmniY+X0tIUGO+l3OMHXgwLUPPBY/tXpOYQU+jqGP1A/Wqpt9grR4pctGDd
	/SmrnwLT18OH57s7mYh2SmuJtrYFs8IEM0Db58ioidys2VIYzOM6xWSrSIrxEcpQhJFzZxPDoPd1N
	R+QDOH+KTaRGqaHiyHEzxyJ88kxVGoYbtlJbPbRpyrOpB1TM47FIaIS7s9a7CgL4GMrVEzUG1broa
	9kepKcT0OdcSDUAybAtqcgQhoxnTRrL5ak4iTv4KeJDgrUVpIyioe1fj5Q90mstj41uU/sZpjNRed
	zPD6wtLg==;
Message-ID: <9fabe73e-23ea-49f2-9c06-17766a07fe9d@embeddedor.com>
Date: Fri, 13 Sep 2024 10:07:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] xen/pci: Avoid -Wflex-array-member-not-at-end
 warning
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <ZsU58MvoYEEqBHZl@elsanto>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <ZsU58MvoYEEqBHZl@elsanto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 185.44.53.103
X-Source-L: No
X-Exim-ID: 1sp1Kp-003hly-34
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.187]) [185.44.53.103]:33586
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 15
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDAdQsRq9OQr+OUd50pGnQ+em761PjuXf9DVZOMaEWdChhOhLES2pXSfvHdnCEPa8neYy/pXyz+GK+InauAnd5SW3RpCVZ7mm5uZCBeG6odxQbk7FaHy
 eDaJ15FIL69Wr/MMvZ4W95srS833n/ug84/ivGz/PynKaIx0vfRF2LF5yNd0Ynz3vFZsTw6DFYxtTugvCRW2i60uLZb1gw2KtzYRXTzYCTfeSjeQuR0z3Vry

Hi all,

Friendly ping: who can take this, please? 🙂

Thanks
-- 
Gustavo

On 21/08/24 02:50, Gustavo A. R. Silva wrote:
> Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with this, fix the following warning:
> 
> drivers/xen/pci.c:48:55: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   drivers/xen/pci.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
> index 72d4e3f193af..a2facd8f7e51 100644
> --- a/drivers/xen/pci.c
> +++ b/drivers/xen/pci.c
> @@ -44,15 +44,11 @@ static int xen_add_device(struct device *dev)
>   	}
>   #endif
>   	if (pci_seg_supported) {
> -		struct {
> -			struct physdev_pci_device_add add;
> -			uint32_t pxm;
> -		} add_ext = {
> -			.add.seg = pci_domain_nr(pci_dev->bus),
> -			.add.bus = pci_dev->bus->number,
> -			.add.devfn = pci_dev->devfn
> -		};
> -		struct physdev_pci_device_add *add = &add_ext.add;
> +		DEFINE_RAW_FLEX(struct physdev_pci_device_add, add, optarr, 1);
> +
> +		add->seg = pci_domain_nr(pci_dev->bus);
> +		add->bus = pci_dev->bus->number;
> +		add->devfn = pci_dev->devfn;
>   
>   #ifdef CONFIG_ACPI
>   		acpi_handle handle;

