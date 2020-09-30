Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD0927EA56
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732.2479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcWf-0006Cb-2Z; Wed, 30 Sep 2020 13:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732.2479; Wed, 30 Sep 2020 13:52:09 +0000
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
	id 1kNcWe-0006CC-Ve; Wed, 30 Sep 2020 13:52:08 +0000
Received: by outflank-mailman (input) for mailman id 732;
 Wed, 30 Sep 2020 13:52:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4L7U=DH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kNcWc-0006C7-Vm
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:52:07 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8102ca42-4066-4198-9dfa-3f32131ed65c;
 Wed, 30 Sep 2020 13:52:05 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UDnbT9006766;
 Wed, 30 Sep 2020 13:52:03 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 33swkm0mc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 13:52:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UDotT4030264;
 Wed, 30 Sep 2020 13:52:02 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 33uv2fd8am-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Sep 2020 13:52:02 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08UDq1Iq003108;
 Wed, 30 Sep 2020 13:52:02 GMT
Received: from [10.74.86.12] (/10.74.86.12)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 30 Sep 2020 06:52:01 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4L7U=DH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
	id 1kNcWc-0006C7-Vm
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:52:07 +0000
X-Inumbo-ID: 8102ca42-4066-4198-9dfa-3f32131ed65c
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8102ca42-4066-4198-9dfa-3f32131ed65c;
	Wed, 30 Sep 2020 13:52:05 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UDnbT9006766;
	Wed, 30 Sep 2020 13:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=DYvNZ24WcHe1KWr7V2ILrRL6telSJk6Mrq2Xp0T+C5Y=;
 b=saqa9v8TSfkZ7qeliqIy18/pBpeDpVTpF7hKL77aNLWruIdNUWz7/1moLn2oitcpk7TG
 RarCmEuzXPKWCM4Oyj4tLaO1Xfe5uBTPUYWLEI24AwZDA0+2mAOMPpkryltaj9sAygow
 28zs+bRmVT/KYsFZ1XaosxdzEOe3ITB/52vuiufwEzr30CWQ0YRGS4VkEgPobGrqas/A
 SxSX6olqEElHve+elu36LOMa9CEg+3/yl3/5fTcRLqScj4ZCcHhM4ZtJAmyzpxLZNZ+K
 HuLtvsS3KAvePi/xZr2mk5dK4w6gjFEVoc/gRcIRDM6KbCfI9Wj2wNJnLvzBGYWRjKoQ XA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by aserp2120.oracle.com with ESMTP id 33swkm0mc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Sep 2020 13:52:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UDotT4030264;
	Wed, 30 Sep 2020 13:52:02 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3030.oracle.com with ESMTP id 33uv2fd8am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2020 13:52:02 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08UDq1Iq003108;
	Wed, 30 Sep 2020 13:52:02 GMT
Received: from [10.74.86.12] (/10.74.86.12)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 30 Sep 2020 06:52:01 -0700
Subject: Re: [PATCH] xen/events: don't use chip_data for legacy IRQs
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
References: <20200930091614.13660-1-jgross@suse.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <c2faf646-ac77-1f36-fe01-cf39a56d5dc7@oracle.com>
Date: Wed, 30 Sep 2020 09:51:54 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200930091614.13660-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300109


On 9/30/20 5:16 AM, Juergen Gross wrote:
> Since commit c330fb1ddc0a ("XEN uses irqdesc::irq_data_common::handler_data to store a per interrupt XEN data pointer which contains XEN specific information.")
> Xen is using the chip_data pointer for storing IRQ specific data. When
> running as a HVM domain this can result in problems for legacy IRQs, as
> those might use chip_data for their own purposes.
>
> Use a local array for this purpose in case of legacy IRQs, avoiding the
> double use.
>
> Cc: stable@vger.kernel.org
> Fixes: c330fb1ddc0a ("XEN uses irqdesc::irq_data_common::handler_data to store a per interrupt XEN data pointer which contains XEN specific information.")
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>



