Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4342220AC8C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 08:54:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joiFt-0001NZ-Ne; Fri, 26 Jun 2020 06:54:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bhlb=AH=nvidia.com=jhubbard@srs-us1.protection.inumbo.net>)
 id 1joiFr-0001NU-Qq
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 06:54:31 +0000
X-Inumbo-ID: e27a77d6-b779-11ea-8280-12813bfff9fa
Received: from hqnvemgate24.nvidia.com (unknown [216.228.121.143])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e27a77d6-b779-11ea-8280-12813bfff9fa;
 Fri, 26 Jun 2020 06:54:31 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef59b470000>; Thu, 25 Jun 2020 23:52:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 25 Jun 2020 23:54:29 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 25 Jun 2020 23:54:29 -0700
Received: from [10.2.63.78] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jun
 2020 06:54:29 +0000
Subject: Re: [PATCH 2/2] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
To: Souptick Joarder <jrdr.linux@gmail.com>
References: <1593054160-12628-1-git-send-email-jrdr.linux@gmail.com>
 <1593054160-12628-2-git-send-email-jrdr.linux@gmail.com>
 <59afe2fe-3718-85aa-f3b5-83ca0b9df577@nvidia.com>
 <CAFqt6zZdq_OMZ3EBDGC+Bn4uPBEhDGOYF=jB4B16z7rY6hpZ7g@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <a750e5e5-fd5d-663b-c5fd-261d7c939ba7@nvidia.com>
Date: Thu, 25 Jun 2020 23:54:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAFqt6zZdq_OMZ3EBDGC+Bn4uPBEhDGOYF=jB4B16z7rY6hpZ7g@mail.gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593154375; bh=Q41CWEP5r3Ufe0JNWhziz/qb4o51XvJxncTjiFALTd8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=KztnXTTdUvCLh7PVjhgdEdJjQLzOZ+aiFMqOIGgtqGoF0ODBvP087ugRo3NmzGeBU
 spIKPTrXPydpzoSH1PEByxRFPLmch6g1j9Ts6UuzwLBNdRsplAxU00Upc7Fn73AN1A
 jAyupSo+0x5EY6DMJiyuNm2cl96pczadN10iObrRoix9yShwNmNk3XQt6Iv/81P+LG
 mk3cyuVI9pY9kgOqNBpI6MQ+1VJ6WXJc//TcPdFrEQzi1gNw4aT0k/nJFwrpuKvCVH
 727IJiaCE++NmKS8Na8++JuQCfdG9BKYQb2yCQ5DMKW+xnzb9QSzraquFoe866bI1i
 xyboQkZZz52hA==
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
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org,
 linux-kernel@vger.kernel.org, Paul Durrant <xadimgnik@gmail.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-06-25 22:26, Souptick Joarder wrote:
> On Thu, Jun 25, 2020 at 11:19 AM John Hubbard <jhubbard@nvidia.com> wrote:
>> On 2020-06-24 20:02, Souptick Joarder wrote:
...
>>> @@ -612,13 +612,7 @@ static int lock_pages(
>>>
>>>    static void unlock_pages(struct page *pages[], unsigned int nr_pages)
>>>    {
>>> -     unsigned int i;
>>> -
>>> -     for (i = 0; i < nr_pages; i++) {
>>> -             if (!PageDirty(page))
>>> -                     set_page_dirty_lock(page);
>>> -             put_page(pages[i]);
>>> -     }
>>> +     unpin_user_pages_dirty_lock(pages, nr_pages, 1);
>>
>> "true", not "1", is the correct way to call that function.
> 
> Ok.
> 
>>
>> Also, this approach changes the behavior slightly, but I think it's

Correction, I forgot that I put that same if(!PageDirty(page)) check into
unpin_user_pages_dirty_lock(). So it doesn't change behavior. That's good.

>> reasonable to just set_page_dirty_lock() on the whole range--hard to
>> see much benefit in checking PageDirty first.
> 
> unpin_user_pages_dirty_lock() internally will do the same check after
> patch [2/2]
> So I thought to keep old and new code in sync. Shall we avoid this check ?
> 
Just leave it as you have it, but of course use "true" instead of 1, please.


thanks,
-- 
John Hubbard
NVIDIA

