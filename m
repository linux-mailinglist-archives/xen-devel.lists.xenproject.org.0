Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B7209668
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 00:34:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joDxq-00005v-37; Wed, 24 Jun 2020 22:33:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/Xx=AF=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1joDxo-00005q-Ha
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 22:33:52 +0000
X-Inumbo-ID: c6872980-b66a-11ea-8152-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6872980-b66a-11ea-8152-12813bfff9fa;
 Wed, 24 Jun 2020 22:33:50 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05OMX4Zx189956;
 Wed, 24 Jun 2020 22:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=LrRRP1uISqiOLZ3r9hh9xnytMH0TB9dvWbVtsNJaXR0=;
 b=jbaIjS5QSNbrN7SvoxsqJAL5jAzjAm0l1p+vo0ETbc9mh4N2cpyMEf3JXf4IGZ95UZFc
 G6u4IyA2euN4GYgtfmdmQEWzwlwSjwy7/F8vOE4hhjm9TH8Tbd7ENL1huiSrfUXwQV2C
 V96vMXhjZqBKAcRSE2Lva3sqiXCAjIH6RBjsvL/g5W+v0UomgYYbaHBDS8rAbDgKhKqy
 9Y9gquECazI5rK2oOJqwEWXzUXsAu4CXiUYrbztKUhBnbRNOh1qX8C+oQJVMyy12BpRQ
 v/Bk6PehnoDVMg3oB276FUXPGHJJo18mfRniCH4Xib+IZMuGuK+E/1Wd8K8NgFi/LNlv +Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 31uut5nfdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 24 Jun 2020 22:33:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05OMOBkC085267;
 Wed, 24 Jun 2020 22:31:47 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 31uur7gnap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 22:31:46 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05OMVjS5031279;
 Wed, 24 Jun 2020 22:31:45 GMT
Received: from [10.39.255.162] (/10.39.255.162)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 24 Jun 2020 22:31:44 +0000
Subject: Re: [RFC PATCH v2] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
To: Souptick Joarder <jrdr.linux@gmail.com>
References: <1592913499-15558-1-git-send-email-jrdr.linux@gmail.com>
 <c68a3805-080f-22c3-a4d3-f03be6b32176@oracle.com>
 <CAFqt6zZo4ZZ9sHGqMGiYoGoA8HQ2z_ijwnpr_b+PHuAzq31scw@mail.gmail.com>
 <c2130c7c-b545-218b-f2cf-69f5059f220c@oracle.com>
 <CAFqt6zaO06gAJjWTLP4fGooLPHcm+oUJtpvhfpr6A0Zsj4PE7g@mail.gmail.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <1632d980-94a7-0f3b-0010-dee3a88a0a11@oracle.com>
Date: Wed, 24 Jun 2020 18:31:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFqt6zaO06gAJjWTLP4fGooLPHcm+oUJtpvhfpr6A0Zsj4PE7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9662
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240143
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9662
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 cotscore=-2147483648 priorityscore=1501
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006240144
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
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, paul@xen.org,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/24/20 12:41 PM, Souptick Joarder wrote:
> On Wed, Jun 24, 2020 at 9:07 PM Boris Ostrovsky
> <boris.ostrovsky@oracle.com> wrote:
>> On 6/23/20 9:36 PM, Souptick Joarder wrote:
>>> On Tue, Jun 23, 2020 at 11:11 PM Boris Ostrovsky
>>> <boris.ostrovsky@oracle.com> wrote:
>>>> On 6/23/20 7:58 AM, Souptick Joarder wrote:
>>>>> In 2019, we introduced pin_user_pages*() and now we are converting
>>>>> get_user_pages*() to the new API as appropriate. [1] & [2] could
>>>>> be referred for more information. This is case 5 as per document [1=
].
>>>>>
>>>>> As discussed, pages need to be marked as dirty before unpinned it.
>>>>>
>>>>> Previously, if lock_pages() end up partially mapping pages, it used=

>>>>> to return -ERRNO due to which unlock_pages() have to go through
>>>>> each pages[i] till *nr_pages* to validate them. This can be avoided=

>>>>> by passing correct number partially mapped pages & -ERRNO separatel=
y
>>>>> while returning from lock_pages() due to error.
>>>>> With this fix unlock_pages() doesn't need to validate pages[i] till=

>>>>> *nr_pages* for error scenario.
>>>> This should be split into two patches please. The first one will fix=
 the
>>>> return value bug (and will need to go to stable branches) and the se=
cond
>>>> will use new routine to pin pages.
>>> Initially I split the patches into 2 commits. But at last moment I
>>> figure out that,
>>> this bug fix ( better to call coding error, doesn't looks like lead t=
o
>>> any runtime bug) is tightly coupled to 2nd commit for
>>> pin_user_pages*() conversion,
>>> which means we don't need the bug fix patch if we are not converting =
the API to
>>> pin_user_pages*()/ unpin_user_pages_dirty_lock(). That's the reason t=
o
>>> clubbed these two
>>> commits into a single one.
>>
>> I am not sure I understand why the two issues are connected. Failure o=
f
>> either get_user_pages_fast() or pin_user_pages() will result in the sa=
me
>> kind of overall ioctl failure, won't it?
>>
> Sorry, I think, I need to go through the bug again for my clarity.
>
> My understanding is ->
>
> First, In case of success lock_pages() returns 0, so what privcmd_ioctl=
_dm_op()
> will return to user is depend on the return value of HYPERVISOR_dm_op()=

> and at last all the pages are unpinned. At present I am not clear about=
 the
> return value of HYPERVISOR_dm_op(). But this path of code looks to be c=
orrect.
>
> second, incase of failure from lock_pages() will return either -ENOSPC =
/ -ERRNO
> receive from {get|pin|_user_pages_fast() inside for loop. (at that
> point there might
> be some partially mapped pages as it is mapping inside the loop). Upon
> receiving
> -ERRNO privcmd_ioctl_dm_op() will pass the same -ERRNO to user (not the=
 partial
> mapped page count). This looks to be correct behaviour from user space.=



Sigh...=C2=A0 I am sorry, you are absolutely correct. It does return -err=
no
on get_user_pages_fast() failure. I don't know what (or whether) I was
thinking. (And so Paul, ignore my question)


-boris


>
> The problem I was trying to address is, in the second scenario when
> lock_pages() returns
> -ERRNO and there are already existing mapped pages. In this scenario,
> when unlcok_pages()
> is called it will iterate till *nr_pages* to validate and unmap the
> pages. But it is supposed to
> unmap only the mapped pages which I am trying to address as part of bug=
 fix.
>
> Let me know if I am able to be in sync with what you are expecting ?
>
>
>> One concern though is that we are changing how user will see this erro=
r.
> My understanding from above is user will always see right -ERRNO and
> will not be impacted.
>
> Another scenario I was thinking, if {get|pin|_user_pages_fast() return
> number of pages pinned
> which may be fewer than the number requested. Then lock_pages()
> returns 0 to caller
> and caller/user space will continue with the assumption that all pages
> are pinned correctly.
> Is this an expected behaviour as per current code ?
>
>
>> Currently Xen devicemodel (which AFAIK is the only caller) ignores it,=

>> which is I think is wrong. So another option would be to fix this in X=
en
>> and continue returning positive number here. I guess it's back to Paul=

>> again.
>>
>>
>> -boris
>>
>>



