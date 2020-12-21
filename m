Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C732DFDF4
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 17:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57428.100450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krNwT-0006Rh-Cv; Mon, 21 Dec 2020 16:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57428.100450; Mon, 21 Dec 2020 16:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krNwT-0006RI-9B; Mon, 21 Dec 2020 16:21:49 +0000
Received: by outflank-mailman (input) for mailman id 57428;
 Mon, 21 Dec 2020 16:21:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Nof=FZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1krNwS-0006RD-2T
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 16:21:48 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2aa4506d-b894-4cfd-bf27-71646c238caa;
 Mon, 21 Dec 2020 16:21:47 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BLGEYGM028818;
 Mon, 21 Dec 2020 16:21:44 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 35h8xqx5mn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Dec 2020 16:21:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BLGFW0m014656;
 Mon, 21 Dec 2020 16:21:43 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 35hu9q8x50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 16:21:43 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BLGLgmE000659;
 Mon, 21 Dec 2020 16:21:42 GMT
Received: from [10.39.211.32] (/10.39.211.32)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 21 Dec 2020 08:21:42 -0800
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
X-Inumbo-ID: 2aa4506d-b894-4cfd-bf27-71646c238caa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=vXlthgkNB9QQlX/LZXXo/ZcJJ1O8/cQ/XGgeABWEs+w=;
 b=zxbo+zVvMoGXi/Por812DhVBTmTkv44ge8xGrSlvh4SSZUpBcF5owbMcVXQqinWUwdZa
 PxgV4wXmoi/Ja7Nxywy/m2sRvJkWwBrDyyHGMQSpeod1FnZeoUj40ktLzX+XZJrUOUwh
 kznwoMWqw8cvzArrzRJuhNPmchJMmGLqfHeGSvQy07FOXzwKdQ4KMP/jrtUuRtYoIBcE
 k5KSkVULZ1ZfG+uTu7KYk3yFvucc5unCEtkf33FGCjsSunBtqTUNfpU0nv1LeTgZ3OcY
 tKgeh0hLn3ADp3fuaGhX2Rik7JwESl2KV3dp6DT7yC5q/Iiqky2Bmr5cQA2HMth5eQIt YQ== 
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Cheyenne Wills
 <cheyenne.wills@gmail.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
 <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
 <4fc3532b-f53f-2a15-ce64-f857816b0566@oracle.com>
 <f4ff3d16-40f6-e8a1-fcdd-ca52e1f52ca6@suse.com>
 <c90622c4-f9e0-8b6d-ab46-bba0cbfc0fd9@oracle.com>
 <0430337a-6fcd-9471-4455-838390401220@citrix.com>
 <c6e05b63-b066-9bd0-9da1-1fc089cd1aea@oracle.com>
 <10958d4a-154f-a524-35e9-a75eaf50fe55@oracle.com>
 <90740e33-c69a-16d7-2622-fa57a1f34272@suse.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <0dbfa20a-5c3d-77c5-1ef0-4baf74e60195@oracle.com>
Date: Mon, 21 Dec 2020 11:21:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <90740e33-c69a-16d7-2622-fa57a1f34272@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9842 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012210116
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9842 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012210116


On 12/21/20 3:21 AM, Jan Beulich wrote:
> On 18.12.2020 21:43, boris.ostrovsky@oracle.com wrote:
>> Can we do something like KVM's ignore_msrs (but probably return 0 on reads to avoid leaks from the system)? It would allow to deal with cases when a guest is suddenly unable to boot after hypervisor update (especially from pre-4.14). It won't help in all cases since some MSRs may be expected to be non-zero but I think it will cover large number of them. (and it will certainly do what Jan is asking above but will not be specific to this particular breakage)
> This would re-introduce the problem with detection (by guests) of certain
> features lacking suitable CPUID bits. Guests would no longer observe the
> expected #GP(0), and hence be at risk of misbehaving. Hence at the very
> least such an option would need to be per-domain rather than (like for
> KVM) global,


Yes, of course.


>  and use of it should then imo be explicitly unsupported.


Unsupported or not recommended? There are options that are not recommended from security perspective but they are still supported. For example, `spec-ctrl=no` (although it's a global setting)


>  And
> along the lines of what KVM has, this may want to be a tristate so the
> ignoring can be both silent and verbose.


OK.


ignore_msrs="never" (default)

ignore_msrs="silent"

ignore_msrs="verbose'



-boris


