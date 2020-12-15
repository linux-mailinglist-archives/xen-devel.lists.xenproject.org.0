Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB322DB177
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:33:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54499.94720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDFr-0005Wi-JJ; Tue, 15 Dec 2020 16:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54499.94720; Tue, 15 Dec 2020 16:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDFr-0005WJ-Fy; Tue, 15 Dec 2020 16:32:51 +0000
Received: by outflank-mailman (input) for mailman id 54499;
 Tue, 15 Dec 2020 16:32:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1gTI=FT=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1kpDFp-0005WD-U7
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:32:50 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebf22e93-3046-4853-af95-96e5c538d4e1;
 Tue, 15 Dec 2020 16:32:49 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFGK4w8157495;
 Tue, 15 Dec 2020 16:32:47 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35cntm3fp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Dec 2020 16:32:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFGLBOJ119059;
 Tue, 15 Dec 2020 16:32:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 35d7en91tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Dec 2020 16:32:46 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BFGWkEM011567;
 Tue, 15 Dec 2020 16:32:46 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 15 Dec 2020 08:32:45 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id B54586A00F4; Tue, 15 Dec 2020 11:34:52 -0500 (EST)
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
X-Inumbo-ID: ebf22e93-3046-4853-af95-96e5c538d4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=dEzuJZYdwQshX1RFzGp+3lUMPPjUeZnIpK7xkDUWxjA=;
 b=fyerFR+RzpDkgqlU8NwrZXmLK4pxCcAiv01Dk06x0j9rVF/7Febv7M9ZaRKwVg7NlK7w
 AqnJDurlP9MG3ad2Xvi0TjtduauvbNIVRGBY2FYy/JmFhZtJupxfOeYl03s6hHkJ0Gxl
 U+CUVltwIEFOPd0yxv5KBa2Uv3Ixg9+NhQ4vG2x66YnDF0uAr7EKLvMSD6dNy8MizvMQ
 V1KEmkmVdnG9pK1hUQcUoKsoDqZiD84zN0O402Mez7EBxqHTv52s/wG0Q9Oxy4D2kV28
 GKI3qnzGDqzKa6AXtoVa1W8zv54NpZB8fZmv2toNK+c724GemOZUJ65VNA9fNbY5gYEG Gw== 
Date: Tue, 15 Dec 2020 11:34:52 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 4/4] livepatch: adjust a stale comment
Message-ID: <20201215163452.GA349@char.us.oracle.com>
References: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
 <659b188d-d26e-3351-2285-3e75197e2c5f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <659b188d-d26e-3351-2285-3e75197e2c5f@suse.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012150111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012150111

On Tue, Dec 15, 2020 at 05:13:43PM +0100, Jan Beulich wrote:
> As of 005de45c887e ("xen: do live patching only from main idle loop")
> the comment ahead of livepatch_do_action() has been stale.
> 
Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

Thank you!
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -1392,8 +1392,8 @@ static inline bool was_action_consistent
>  }
>  
>  /*
> - * This function is executed having all other CPUs with no deep stack (we may
> - * have cpu_idle on it) and IRQs disabled.
> + * This function is executed having all other CPUs with no deep stack (when
> + * idle) and IRQs disabled.
>   */
>  static void livepatch_do_action(void)
>  {
> 

