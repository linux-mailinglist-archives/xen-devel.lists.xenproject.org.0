Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B730276C69
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 10:52:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLMxv-0004EE-97; Thu, 24 Sep 2020 08:50:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZ1S=DB=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1kLMxu-0004E9-L0
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 08:50:58 +0000
X-Inumbo-ID: 5d3e9b88-b378-4218-866f-fc6e700f5a72
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d3e9b88-b378-4218-866f-fc6e700f5a72;
 Thu, 24 Sep 2020 08:50:57 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08O8mmjN170892;
 Thu, 24 Sep 2020 08:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=8i27Hnu1OAJcvB1yHMRMI94E4lxHYQ7AoZrcXSYbvQk=;
 b=IIXzxFedoU4UmTx1Uywkdpt3NpGS/AHEbEv6d6lwRy56IB/JltPhS99jZto8te0gwvJ5
 2vhiTolWzs5tRWJSXBwFM7X476gFEB+e8PlbgIT0Kh/dQY+3IDr7xtDeVgVU+wZv4/h0
 2lvsRjeULz/BbPeKKu+BTDOjNbunmMUAZZDdfDwYaYIhbxvzQuHYYBaeceJDRtd3mNqy
 nvzcK+NbeSSXyz1gwG7pTLGv4WtZUVzLhYyq5wHnmuL46WAP/ECkmWZ5Ljnc5CYRAOEy
 f0g2AipEE/2hPCvXHsc5t1ljgMaZzaXHptxXsOm3GN8t7oMxrKxRvyvZVEEl6Miepvca MQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 33ndnuq0te-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 08:50:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08O8oUJV087025;
 Thu, 24 Sep 2020 08:50:52 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 33nurvwje0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 08:50:52 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08O8oogG018513;
 Thu, 24 Sep 2020 08:50:50 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 01:50:50 -0700
Date: Thu, 24 Sep 2020 11:50:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: hch@lst.de
Cc: xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, 
 linux-mm@kvack.org
Subject: [bug report] x86/xen: open code alloc_vm_area in arch_gnttab_valloc
Message-ID: <20200924085044.GA1569000@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=10
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240070
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=10 bulkscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240070
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello Christoph Hellwig,

The patch a0e7ac6b4907: "x86/xen: open code alloc_vm_area in
arch_gnttab_valloc" from Sep 23, 2020, leads to the following static
checker warning:

	arch/x86/xen/grant-table.c:110 arch_gnttab_valloc()
	warn: did you mean to pass the address of 'area->ptes'

arch/x86/xen/grant-table.c
    93  static int gnttab_apply(pte_t *pte, unsigned long addr, void *data)
    94  {
    95          pte_t ***p = data;
    96  
    97          **p = pte;
    98          (*p)++;
    99          return 0;
   100  }
   101  
   102  static int arch_gnttab_valloc(struct gnttab_vm_area *area, unsigned nr_frames)
   103  {
   104          area->ptes = kmalloc_array(nr_frames, sizeof(*area->ptes), GFP_KERNEL);

area->ptes is allocated here.

   105          if (area->ptes == NULL)
   106                  return -ENOMEM;
   107          area->area = get_vm_area(PAGE_SIZE * nr_frames, VM_IOREMAP);
   108          if (!area->area)
   109                  goto out_free_ptes;
   110          if (apply_to_page_range(&init_mm, (unsigned long)area->area->addr,
   111                          PAGE_SIZE * nr_frames, gnttab_apply, &area->ptes))
                                                                     ^^^^^^^^^^^
This increments area->ptes.  In the original code, there was a stack
variable which was changed and the area->ptes pointer wasn't modified.


   112                  goto out_free_vm_area;
   113          return 0;
   114  out_free_vm_area:
   115          free_vm_area(area->area);
   116  out_free_ptes:
   117          kfree(area->ptes);
                ^^^^^^^^^^^^^^^^^
This frees a different pointer from what was allocated.

   118          return -ENOMEM;
   119  }

regards,
dan carpenter

