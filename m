Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 917266B8128
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 19:50:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509369.785002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbnEJ-0002Gt-C8; Mon, 13 Mar 2023 18:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509369.785002; Mon, 13 Mar 2023 18:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbnEJ-0002Ek-9P; Mon, 13 Mar 2023 18:49:07 +0000
Received: by outflank-mailman (input) for mailman id 509369;
 Mon, 13 Mar 2023 18:49:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bF6M=7F=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1pbnEH-0002Ee-Vb
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 18:49:06 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4aa7b7a-c1cf-11ed-b463-930f4c7d94ae;
 Mon, 13 Mar 2023 19:48:57 +0100 (CET)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 167873333662692.37692466709711;
 Mon, 13 Mar 2023 11:48:56 -0700 (PDT)
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
X-Inumbo-ID: b4aa7b7a-c1cf-11ed-b463-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; t=1678733338; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DdiEuoqwCumTuyHQZYvdZ2/4CItAiqNWx2pxX1jyoQ9vL1X5T4qz8etf6nCSUBWXOKSws3yStKFT9E30LaJL16rNOVQcA1ab7qiqewXPObEZSwGSCBc1tcnnENFy/ybVmPmTRyJs62F30qjkJpJ2WpudKWdDvC0uG4KY4z7SbE0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678733338; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9OzqtH04IDQlWHm6oCpRrRkrahOK71fHIjql3+xCS/E=; 
	b=YbcQcfKP8UlYPmEO6ws2sY1KM7lFnDM2Al1tj912sFY9CzXgefUaTBLzFFx93UHY/csjmTWXQNdAB1h5wBnWDrT4Mc3cSD7JW2S3SbYzdVC7KLeTUCLwzExVc1aFsPnrCLnm/8OvBK6gX2U5kvB3jzSzLY8ufXzLTLVY4SBmgto=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678733338;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9OzqtH04IDQlWHm6oCpRrRkrahOK71fHIjql3+xCS/E=;
	b=Md1YzOEfeCs/z/Y/teCmAlx5RWDV7OCSUh9al48qo2hpG3UkEy1PXZ3tef4sm8rK
	8Y223qJLh7Ia+KKmWD7zsU7Z+Sr5mF9GmT/WthMyZAxOr3ayh58KBl4X1AsMMbLHgTJ
	z4B2nw1vmSecdiiF0dxxi7Qu1Ja7HHLk513RJMN0=
Message-ID: <a990fe77-6132-c5df-c149-6255fb13d845@apertussolutions.com>
Date: Mon, 13 Mar 2023 14:48:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] flask: label-pci: Allow specifying optional irq label
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230313175047.20719-1-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20230313175047.20719-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/13/23 13:50, Jason Andryuk wrote:
> IRQs can be shared between devices, so using the same label as the PCI
> device can create conflicts where the IRQ is labeled with one of the
> device labels preventing assignment of the second device to the second
> domain.  Add the ability to specify an irq label distinct from the PCI
> device, so a shared irq label can be specified.  The policy would then
> be written such that the two domains can each use the shared IRQ type in
> addition to their labeled PCI device.  That way we can still label most
> of the PCI device resources and assign devices in the face of shared
> IRQs.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> v2:
> Describe usage in docs/misc/xsm-flask.txt
> ---
>   docs/misc/xsm-flask.txt       | 16 ++++++++++++++++
>   tools/flask/utils/label-pci.c | 13 ++++++++++---
>   2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/misc/xsm-flask.txt b/docs/misc/xsm-flask.txt
> index 2419c5cf29..ba89ebbfd8 100644
> --- a/docs/misc/xsm-flask.txt
> +++ b/docs/misc/xsm-flask.txt
> @@ -205,6 +205,22 @@ parameter, which can also be changed using xl setenforce).  When using the
>   default types for domains (domU_t), the example policy shipped with Xen should
>   allow the same operations on or between domains as when not using FLASK.
>   
> +By default, flask-label-pci labels the device, I/O ports, memory and IRQ with
> +the provided label.  These are all unique per-device, except for IRQs which
> +can be shared between devices.  This leads to assignment problems since vmA_t
> +can't access the IRQ devB_t.  To work around this issue, flask-label-pci
> +takes an optional 3rd argument to label the IRQ:
> +
> +    flask-label-pci 0000:03:02.0 system_u:object_r:nic_dev_t \
> +        system_u:object_r:shared_irq_t
> +
> +The IRQ labeling only applies to the PIRQ - MSI/MSI-X interrupts are labeled
> +with the main device label.
> +
> +The policy needs to define the shared_irq_t with:
> +    type shared_irq_t, resource_type;
> +
> +And the policy needs to be updated to allow domains appropriate access.
>   
>   MLS/MCS policy
>   --------------
> diff --git a/tools/flask/utils/label-pci.c b/tools/flask/utils/label-pci.c
> index 9ddb713cf4..897b772804 100644
> --- a/tools/flask/utils/label-pci.c
> +++ b/tools/flask/utils/label-pci.c
> @@ -28,7 +28,7 @@
>   
>   static void usage (int argCnt, char *argv[])
>   {
> -	fprintf(stderr, "Usage: %s SBDF label\n", argv[0]);
> +	fprintf(stderr, "Usage: %s SBDF label <irq_label>\n", argv[0]);
>   	exit(1);
>   }
>   
> @@ -39,12 +39,19 @@ int main (int argCnt, char *argv[])
>   	int seg, bus, dev, fn;
>   	uint32_t sbdf;
>   	uint64_t start, end, flags;
> +	char *pirq_label;
>   	char buf[1024];
>   	FILE *f;
>   
> -	if (argCnt != 3)
> +	if (argCnt < 3 || argCnt > 4)

style nit: space inside parens

>   		usage(argCnt, argv);
>   
> +	if (argCnt == 4) {
> +	    pirq_label = argv[3];
> +	} else {
> +	    pirq_label = argv[2];
> +	}
> +

style nit: space inside parens and curly brackets could be dropped or 
should be moved to their own lines.

>   	xch = xc_interface_open(0,0,0);
>   	if ( !xch )
>   	{
> @@ -107,7 +114,7 @@ int main (int argCnt, char *argv[])
>   	if (fscanf(f, "%" SCNu64, &start) != 1)
>   		start = 0;
>   	if (start) {
> -		ret = xc_flask_add_pirq(xch, start, argv[2]);
> +		ret = xc_flask_add_pirq(xch, start, pirq_label);
>   		if (ret) {
>   			fprintf(stderr, "xc_flask_add_pirq %"PRIu64" failed: %d\n",
>   					start, ret);

Style nits aside, LGTM.

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

