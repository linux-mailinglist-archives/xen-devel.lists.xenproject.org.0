Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D2D2E9B3E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 17:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61375.107942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSym-0005z7-BI; Mon, 04 Jan 2021 16:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61375.107942; Mon, 04 Jan 2021 16:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSym-0005yi-8G; Mon, 04 Jan 2021 16:45:12 +0000
Received: by outflank-mailman (input) for mailman id 61375;
 Mon, 04 Jan 2021 16:45:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yCAg=GH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kwSyj-0005yd-V7
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 16:45:09 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 728e1ef0-6bcd-4e6b-9020-499ae901acfe;
 Mon, 04 Jan 2021 16:45:08 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104GdJwW074505;
 Mon, 4 Jan 2021 16:45:04 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 35tg8qw579-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 04 Jan 2021 16:45:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104GgjPG128177;
 Mon, 4 Jan 2021 16:45:04 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 35v2axdgm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Jan 2021 16:45:04 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 104Gj1me025165;
 Mon, 4 Jan 2021 16:45:01 GMT
Received: from [10.39.231.107] (/10.39.231.107)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 Jan 2021 16:45:01 +0000
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
X-Inumbo-ID: 728e1ef0-6bcd-4e6b-9020-499ae901acfe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=ToUz8IdpNitBVRh9WeY5eT1Ye9KRaer07bBCPRPay70=;
 b=lLUBYUW+G4uw3v9x7eeYny68TIRoNNP0c8rKDWZ1V8jmkTr2UHzbEEa6SoYfGtQNWFbd
 OfaBl6wp/QFS3+cfWTMichx5caRI+fN50BnRDtYWyref2UrxUpGclQXcjg707KC45w+c
 Dg6tTV3IC/BpEcktlyJcrs/ftg386M8rysNjftT4sAE0eLQKvwlClFucUlMZa0heoXMd
 Fx7be58Kt4j6rkMmFIxB5gu71SuWJqbhyK6ypfB0e3oQ/Rg+pNGAgRDVlP25KQ2h9P1Z
 XkcZPTccZFRTQXBlQn8MRRKs6ElkbND0TDe0F5dp/y6um8d8u1io4cwkUXQFPJUke8/3 pQ== 
Subject: Re: [PATCH 3/5] x86/xen: Add a no_vector_callback option to test PCI
 INTX delivery
To: David Woodhouse <dwmw2@infradead.org>, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
        jgrall@amazon.com, karahmed@amazon.de,
        xen-devel <xen-devel@lists.xenproject.org>
References: <20201224115323.3540130-1-dwmw2@infradead.org>
 <20201224115323.3540130-4-dwmw2@infradead.org>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <19664323-02ab-5aff-53e4-ece4a4a9e9b5@oracle.com>
Date: Mon, 4 Jan 2021 11:44:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224115323.3540130-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040108
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9854 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101040108


On 12/24/20 6:53 AM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> It's useful to be able to test non-vector event channel delivery, to make
> sure Linux will work properly on older Xen which doesn't have it.
>
> It's also useful for those working on Xen and Xen-compatible hypervisors,
> because there are guest kernels still in active use which use PCI INTX
> even when vector delivery is available.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>



This needs an update to Documentation/admin-guide/kernel-parameters.txt


-boris


