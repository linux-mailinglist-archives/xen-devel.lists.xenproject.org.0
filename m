Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C86D2DEA5C
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 21:44:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56675.99262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqMb2-000117-WB; Fri, 18 Dec 2020 20:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56675.99262; Fri, 18 Dec 2020 20:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqMb2-00010i-Sw; Fri, 18 Dec 2020 20:43:28 +0000
Received: by outflank-mailman (input) for mailman id 56675;
 Fri, 18 Dec 2020 20:43:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVAa=FW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kqMb1-00010d-7i
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 20:43:27 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dacd7049-351e-4e31-bec3-e23511a2cfe3;
 Fri, 18 Dec 2020 20:43:26 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BIKeQtL122498;
 Fri, 18 Dec 2020 20:43:22 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 35cn9rv7pj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Dec 2020 20:43:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BIKfNTm052695;
 Fri, 18 Dec 2020 20:43:21 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 35d7esqs3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Dec 2020 20:43:21 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BIKhIrT031029;
 Fri, 18 Dec 2020 20:43:18 GMT
Received: from [10.39.216.141] (/10.39.216.141)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 18 Dec 2020 12:43:18 -0800
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
X-Inumbo-ID: dacd7049-351e-4e31-bec3-e23511a2cfe3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=KGkrhxqOcM6OiUfI259rBQpozA1rYuM0leg0FkluyEY=;
 b=rcLyBy0bVLWp/07VwW2T+kZsXMYBjnoMETEee5T+PFY22SKj+Hb/zJA+ErlB/2ZDgJAZ
 rnMldy+QF7UAr2PyhBbBS+pR1sC1avSnUM/WUvpo3p5Co1smxfgbSkLzeDT6tUytPVfg
 sS8VChG+1R+v5JIz//1JpUkR4qighsSK3zIallKj5YT4FdHjorUXKCPk5uHTymDvS0Xn
 6cVaTSeRJ6vO14WzZs/9ThyG0oX9eDZmDcH1JdN0KdyLvxqmLaknvVcc1p9GuLEJEEsH
 r8QxSiUYZfS9GlbkhLVsDIfAdm6w8rtNi2Im681v1bMs8rc5f7vd7zthFgL2Z/YeV/Sv Gw== 
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
From: boris.ostrovsky@oracle.com
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Cheyenne Wills <cheyenne.wills@gmail.com>
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
 <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
 <4fc3532b-f53f-2a15-ce64-f857816b0566@oracle.com>
 <f4ff3d16-40f6-e8a1-fcdd-ca52e1f52ca6@suse.com>
 <c90622c4-f9e0-8b6d-ab46-bba0cbfc0fd9@oracle.com>
 <0430337a-6fcd-9471-4455-838390401220@citrix.com>
 <c6e05b63-b066-9bd0-9da1-1fc089cd1aea@oracle.com>
Organization: Oracle Corporation
Message-ID: <10958d4a-154f-a524-35e9-a75eaf50fe55@oracle.com>
Date: Fri, 18 Dec 2020 15:43:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c6e05b63-b066-9bd0-9da1-1fc089cd1aea@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9839 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180139
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9839 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180139


On 12/17/20 12:49 PM, boris.ostrovsky@oracle.com wrote:
> On 12/17/20 11:46 AM, Andrew Cooper wrote:
>> On 17/12/2020 16:25, boris.ostrovsky@oracle.com wrote:
>>> On 12/17/20 2:40 AM, Jan Beulich wrote:
>>>> On 17.12.2020 02:51, boris.ostrovsky@oracle.com wrote:
>>>> I think this is acceptable as a workaround, albeit we may want to
>>>> consider further restricting this (at least on staging), like e.g.
>>>> requiring a guest config setting to enable the workaround. 
>>> Maybe, but then someone migrating from a stable release to 4.15 will have to modify guest configuration.
>>>
>>>
>>>> But
>>>> maybe this will need to be part of the MSR policy for the domain
>>>> instead, down the road. We'll definitely want Andrew's view here.
>>>>
>>>> Speaking of staging - before applying anything to the stable
>>>> branches, I think we want to have this addressed on the main
>>>> branch. I can't see how Solaris would work there.
>>> Indeed it won't. I'll need to do that as well (I misinterpreted the statement in the XSA about only 4.14- being vulnerable)
>> It's hopefully obvious now why we suddenly finished the "lets turn all
>> unknown MSRs to #GP" work at the point that we did (after dithering on
>> the point for several years).
>>
>> To put it bluntly, default MSR readability was not a clever decision at all.
>>
>> There is a large risk that there is a similar vulnerability elsewhere,
>> given how poorly documented the MSRs are (and one contemporary CPU I've
>> got the manual open for has more than 6000 *documented* MSRs).  We did
>> debate for a while whether the readability of the PPIN MSRs was a
>> vulnerability or not, before eventually deciding not.


Can we do something like KVM's ignore_msrs (but probably return 0 on reads to avoid leaks from the system)? It would allow to deal with cases when a guest is suddenly unable to boot after hypervisor update (especially from pre-4.14). It won't help in all cases since some MSRs may be expected to be non-zero but I think it will cover large number of them. (and it will certainly do what Jan is asking above but will not be specific to this particular breakage)


-boris


>> Irrespective of what we do to fix this in Xen, has anyone fixed Solaris yet?
>
> I am not aware of anyone working on this (not that I would be).
>
>
> -boris
>

