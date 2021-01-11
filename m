Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903932F227A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 23:12:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65387.115837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz5Py-0007Pr-8I; Mon, 11 Jan 2021 22:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65387.115837; Mon, 11 Jan 2021 22:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz5Py-0007PS-4l; Mon, 11 Jan 2021 22:12:06 +0000
Received: by outflank-mailman (input) for mailman id 65387;
 Mon, 11 Jan 2021 22:12:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cm4Z=GO=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kz5Px-0007PN-7P
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 22:12:05 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6211159f-caac-4fda-b0e6-ea49f794554e;
 Mon, 11 Jan 2021 22:12:03 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10BM9g6t000777;
 Mon, 11 Jan 2021 22:11:58 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 360kcykkxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Jan 2021 22:11:58 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10BM6SaB101267;
 Mon, 11 Jan 2021 22:09:58 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 360keftbsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 22:09:57 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10BM9uUV017394;
 Mon, 11 Jan 2021 22:09:56 GMT
Received: from [10.39.223.157] (/10.39.223.157)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 11 Jan 2021 14:09:56 -0800
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
X-Inumbo-ID: 6211159f-caac-4fda-b0e6-ea49f794554e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=qKII6CRwHxF6zi5JdH7+fTS9ebZYq9tFI4FIuyAD8ws=;
 b=L+q/q2onFVPovRvpx2VhhSK2tW9y/BHHSBokxogqmEDwiyonDpAuuxL3VKyaD/rqybVe
 uPWLv9FC5vApFJWnXlH8ZM+nKFwNvhXkiLj5daTyhF4YrJezCl8dUVcUntSXXkSavUdC
 /QaRa/U8D4NFF6Ubotas68D01go6q+2hXLysU+j9tWgb0xCK8guEW8UrOqAC5qKYh98l
 oAXj2ywph1q0VBL1YaUKa3woE5/+qY/u+gsDK5tvv8bqOXksYMn+tdOCm+QPCxD6kBgQ
 WJICZGSUg9LkFF0uvvf39sDWNh5DmoUOKFXaqTL12yyzwSsrncVxmWvLxJNIYHjfov/o ww== 
Subject: Re: [PATCH] xen/privcmd: allow fetching resource sizes
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20210111152958.7166-1-roger.pau@citrix.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <555ba53c-1b6b-6cf7-9887-52d4179f7456@oracle.com>
Date: Mon, 11 Jan 2021 17:09:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111152958.7166-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9861 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110123
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9861 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110123


On 1/11/21 10:29 AM, Roger Pau Monne wrote:
>  
> +	xdata.domid = kdata.dom;
> +	xdata.type = kdata.type;
> +	xdata.id = kdata.id;
> +
> +	if (!kdata.addr && !kdata.num) {


I think we should not allow only one of them to be zero. If it's only kdata.num then we will end up with pfns array set to ZERO_SIZE_PTR (which is 0x10). We seem to be OK in that we are not derefencing pfns (either in kernel or in hypervisor) if number of frames is zero but IMO we shouldn't be tempting the fate.


(And if it's only kdata.addr then we will get a vma but I am not sure it will do what we want.)


-boris



