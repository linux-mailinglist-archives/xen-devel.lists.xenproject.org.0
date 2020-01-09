Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4357F136400
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 00:49:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iphWG-000724-Ph; Thu, 09 Jan 2020 23:47:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LS9B=26=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iphWF-00071z-7W
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 23:47:15 +0000
X-Inumbo-ID: 5b62f388-333a-11ea-bb11-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b62f388-333a-11ea-bb11-12813bfff9fa;
 Thu, 09 Jan 2020 23:47:13 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 009NccQb003715;
 Thu, 9 Jan 2020 23:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=nRKnwHomok/PpPFwHMvZtyTJWnTH8Av6uYkXPJFr5L0=;
 b=A+1qXt2wKxmM3O0bCR4wk11/+OHX6zPymnH2xGsRDPxDOgPP36J7gWvT50+GAborHaRr
 orzlH4nhv17YJJZ1HUyBcRJBd5lQoRsr+SW68bga+0ez4jaFItUmrfPRU+7hOnoPk877
 Zi4WLc7wwbvqV/f4UCx80CugqpR9UEx7Hs5Cr0JynkTioE453a2Dw7u9+iijqk7AGlP4
 S7kclCvN7Tfb9M9TKQIyH+WXWGlb7G9rbVVJGssLyMxgGJ1dCgU+F9py4/iHPta9u/nl
 fs3NAZrv+JwM/acsSR+todj4Km0Ok/PckbiUPQC+IhFyH+1Sp5ISntCzDbNM1aJZvbQF WA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2xaj4ue8qa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Jan 2020 23:46:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 009Nd1pj089807;
 Thu, 9 Jan 2020 23:46:23 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2xdms0b9ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Jan 2020 23:46:22 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 009NkKGp001333;
 Thu, 9 Jan 2020 23:46:20 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 09 Jan 2020 15:46:20 -0800
To: Anchal Agarwal <anchalag@amazon.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, x86@kernel.org, jgross@suse.com,
 linux-pm@vger.kernel.org, linux-mm@kvack.org, kamatam@amazon.com,
 sstabellini@kernel.org, konrad.wilk@oracle.co, roger.pau@citrix.com,
 axboe@kernel.dk, davem@davemloft.net, rjw@rjwysocki.net,
 len.brown@intel.com, pavel@ucw.cz, peterz@infradead.org,
 eduval@amazon.com, sblbir@amazon.com, xen-devel@lists.xenproject.org,
 vkuznets@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com,
 dwmw@amazon.co.uk, fllinden@amaozn.com
References: <20200107233720.GA17906@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <88721569-d425-8df3-2ab2-3aa9155b326c@oracle.com>
Date: Thu, 9 Jan 2020 18:46:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200107233720.GA17906@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9495
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001090198
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9495
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001090198
Subject: Re: [Xen-devel] [RFC PATCH V2 01/11] xen/manage: keep track of the
 on-going suspend mode
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxLzcvMjAgNjozNyBQTSwgQW5jaGFsIEFnYXJ3YWwgd3JvdGU6Cj4gKwo+ICtzdGF0aWMg
aW50IHhlbl9zZXR1cF9wbV9ub3RpZmllcih2b2lkKQo+ICt7Cj4gKwlpZiAoIXhlbl9odm1fZG9t
YWluKCkpCj4gKwkJcmV0dXJuIC1FTk9ERVY7CgpBUk0gZ3Vlc3RzIGFyZSBhbHNvIEhWTSBkb21h
aW5zLiBJcyBpdCBPSyBmb3IgdGhlbSB0byByZWdpc3RlciB0aGUgCm5vdGlmaWVyPyBUaGUgZGlm
ZnN0YXQgc3VnZ2VzdHMgdGhhdCB5b3UgYXJlIHN1cHBvcnRpbmcgQVJNLgoKLWJvcmlzCgo+ICsK
PiArCXJldHVybiByZWdpc3Rlcl9wbV9ub3RpZmllcigmeGVuX3BtX25vdGlmaWVyX2Jsb2NrKTsK
PiArfQo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
