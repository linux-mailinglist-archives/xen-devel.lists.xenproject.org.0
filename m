Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA3919E11B
	for <lists+xen-devel@lfdr.de>; Sat,  4 Apr 2020 00:33:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKUrk-0005lb-QT; Fri, 03 Apr 2020 22:32:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4svF=5T=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1jKUrk-0005lW-5L
 for xen-devel@lists.xen.org; Fri, 03 Apr 2020 22:32:44 +0000
X-Inumbo-ID: 08824654-75fb-11ea-b58d-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08824654-75fb-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 22:32:43 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 033MHjNZ099109;
 Fri, 3 Apr 2020 22:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=kbuFMLH3xDECqB1AltVVQH9o6tW9Kx9JqJoqt2C7pSc=;
 b=eWTB4oUqqB3BuqgYrRcjhs5pMjVJ2nQkf3+Knkcsv/rGM8/CnARcyuyONahursFYJRgK
 QjO6yi2JZMbsmWKhNPgWIJbBma4TOT8A1gX0Yxp0XKztqt8F6hv07pXmCD3d8l6Fem9m
 g2WYKZulUoDxKgYymMltJf6UvrSyRDSscBZEhH/m1WBe6c4A3vPUZfF8z9ThBsEHStIq
 qiFDSIzsoEmmabNeLCQCj57V7e/s5iuTMNGhxrBsBv8MgfXdXiEaiWNmVQpKkbbEmWqb
 3uZymcD7YmyZptj9IrOIdVGHSTJqNy52uTfwsbftTw4VO97viVN36HLmNU4TQc425NmT wA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 303yunp28e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Apr 2020 22:32:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 033MHD54041412;
 Fri, 3 Apr 2020 22:32:38 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 304sju5vwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Apr 2020 22:32:38 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 033MWbfH004761;
 Fri, 3 Apr 2020 22:32:37 GMT
Received: from [10.159.153.117] (/10.159.153.117)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 03 Apr 2020 15:32:37 -0700
Subject: Re: Live migration and PV device handling
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anastassios Nanos <anastassios.nanos@sunlight.io>, xen-devel@lists.xen.org
References: <CABB6KG-UCdPTa3yM57JB13G=Yebe8chuQKvKkNbtoGRSZ9Ypsw@mail.gmail.com>
 <a8c56ab0-bc51-fa1c-c63f-cb9ada8a1823@citrix.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <d698f1ed-247e-404c-04ce-762c651771d1@oracle.com>
Date: Fri, 3 Apr 2020 15:32:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a8c56ab0-bc51-fa1c-c63f-cb9ada8a1823@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9580
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004030172
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9580
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004030172
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Andrew,

On 4/3/20 5:42 AM, Andrew Cooper wrote:
> On 03/04/2020 13:32, Anastassios Nanos wrote:
>> Hi all,
>>
>> I am trying to understand how live-migration happens in xen. I am
>> looking in the HVM guest case and I have dug into the relevant parts
>> of the toolstack and the hypervisor regarding memory, vCPU context
>> etc.
>>
>> In particular, I am interested in how PV device migration happens. I
>> assume that the guest is not aware of any suspend/resume operations
>> being done
> 
> Sadly, this assumption is not correct.  HVM guests with PV drivers
> currently have to be aware in exactly the same way as PV guests.
> 
> Work is in progress to try and address this.  See
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=775a02452ddf3a6889690de90b1a94eb29c3c732
> (sorry - for some reason that doc isn't being rendered properly in
> https://xenbits.xen.org/docs/ )
> 

I read below from the commit:

+* The toolstack choose a randomized domid for initial creation or default
+migration, but preserve the source domid non-cooperative migration.
+Non-Cooperative migration will have to be denied if the domid is
+unavailable on the target host, but randomization of domid on creation
+should hopefully minimize the likelihood of this. Non-Cooperative migration
+to localhost will clearly not be possible.

Does that indicate while scope of domid_t is shared by a single server in old
design, the scope of domid_t is shared by a cluster of server in new design?

That is, the domid should be unique in the cluster of all servers if we expect
non-cooperative migration always succeed?

Thank you very much!

Dongli Zhang

