Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADB28F27D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 14:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7308.19156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT2Wt-0001L4-0v; Thu, 15 Oct 2020 12:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7308.19156; Thu, 15 Oct 2020 12:38:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT2Ws-0001K4-RT; Thu, 15 Oct 2020 12:38:46 +0000
Received: by outflank-mailman (input) for mailman id 7308;
 Thu, 15 Oct 2020 12:38:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TbfH=DW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kT2Wr-0000WT-0H
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 12:38:45 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50541fb8-a46e-47b7-9882-058dab80a902;
 Thu, 15 Oct 2020 12:38:26 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCXr68179009;
 Thu, 15 Oct 2020 12:38:02 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 343vaejrtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 15 Oct 2020 12:38:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCZKWO070415;
 Thu, 15 Oct 2020 12:38:01 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 343pv1s863-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Oct 2020 12:38:01 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09FCbqom028591;
 Thu, 15 Oct 2020 12:37:52 GMT
Received: from [10.39.226.219] (/10.39.226.219)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 15 Oct 2020 05:37:51 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TbfH=DW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
	id 1kT2Wr-0000WT-0H
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 12:38:45 +0000
X-Inumbo-ID: 50541fb8-a46e-47b7-9882-058dab80a902
Received: from userp2120.oracle.com (unknown [156.151.31.85])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 50541fb8-a46e-47b7-9882-058dab80a902;
	Thu, 15 Oct 2020 12:38:26 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCXr68179009;
	Thu, 15 Oct 2020 12:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=49bcEdM7cuP+mMMv2qlqFDAObr/+ij1Sw78R9zLmZVw=;
 b=TlYJFy8XIrD4eomiT9aosxaFWdViJgtVQ2M/+PROA7GYl7iWMtf8ToxHIkW675rx1WoV
 Ei49JFN71Q9rR2D/11YeRR84AmwJjUX6KKmuLpahodh/8fHbL1cdncjiexv2IAvZWl+J
 P7wXBsXUfwP9D93D2anNQLpD5dR8oK4DzuS27U3uHZ5rGwGvexz/c1/0A8fVDND2W7zx
 XWxy6HYlEe9+haW1UJJjnJuA3zvClnSGZsN6XMxiCw78yvXD2vcnPj6E0S6YPZeGxEhM
 GworrstDO7gdM0qTTL3mQ0VuKdAMqDF3MNhkuoHgxC2WFbeCEYyv68zwAUC7gHQTA2b0 MA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 343vaejrtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Oct 2020 12:38:01 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCZKWO070415;
	Thu, 15 Oct 2020 12:38:01 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 343pv1s863-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Oct 2020 12:38:01 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09FCbqom028591;
	Thu, 15 Oct 2020 12:37:52 GMT
Received: from [10.39.226.219] (/10.39.226.219)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 15 Oct 2020 05:37:51 -0700
Subject: Re: [PATCH 2/2] xen: Kconfig: nest Xen guest options
To: Jason Andryuk <jandryuk@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
References: <20201014175342.152712-1-jandryuk@gmail.com>
 <20201014175342.152712-3-jandryuk@gmail.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <6cd9363c-ac0c-ea68-c8e7-9fd3cd30a89b@oracle.com>
Date: Thu, 15 Oct 2020 08:37:50 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201014175342.152712-3-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150090


On 10/14/20 1:53 PM, Jason Andryuk wrote:
> +config XEN_512GB
> +	bool "Limit Xen pv-domain memory to 512GB"
> +	depends on XEN_PV && X86_64


Why is X86_64 needed here?


-boris




