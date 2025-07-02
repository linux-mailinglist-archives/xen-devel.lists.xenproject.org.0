Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92618AF6582
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 00:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031601.1405412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX69m-0005MH-1x; Wed, 02 Jul 2025 22:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031601.1405412; Wed, 02 Jul 2025 22:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX69l-0005K4-VM; Wed, 02 Jul 2025 22:42:21 +0000
Received: by outflank-mailman (input) for mailman id 1031601;
 Wed, 02 Jul 2025 22:42:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsHN=ZP=bounce.vates.tech=bounce-md_30504962.6865b5c8.v1-a090fbdbd9a648fb9a644b0ec935ed84@srs-se1.protection.inumbo.net>)
 id 1uX69k-0005Jy-CN
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 22:42:20 +0000
Received: from mail186-10.suw21.mandrillapp.com
 (mail186-10.suw21.mandrillapp.com [198.2.186.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce300c1c-5795-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 00:42:17 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-10.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4bXZf019VXz5QkLn9
 for <xen-devel@lists.xenproject.org>; Wed,  2 Jul 2025 22:42:16 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a090fbdbd9a648fb9a644b0ec935ed84; Wed, 02 Jul 2025 22:42:16 +0000
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
X-Inumbo-ID: ce300c1c-5795-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1751496136; x=1751766136;
	bh=SHAawigTxxv6yh6TdZAJGRPMMIrw2ifj78O7i+3plPQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=m52R/ZbgEqSLPzTueva15ms/alji5VupZIRXBRzw6ZO9qLmvEIVEaPIgJc1k/q39B
	 1+MO5Q5zw/gIMySM7Y+XJZ/togwXHWbufOhQdQk9DYLpKGcDrgi+gQ4/b14XH1WsZZ
	 efAn3yrrkDYZjTEK7fyulZnWOSwnDJxxwjj16ZxGR3cZKpZt22Ud99j3K0PoCR+t2r
	 tY8d7Vv4ZZQhM6280DbzMima51gm+FDU1wwGcsoNgq+LzKVbIyS6Qn1mTyiqg2up6m
	 FszCOUks42X3jIxVFYwlSh3f4Hxuu4qwe5ArjsSeaOTQ7quXXl6Uf3pk9pDsA4Cdz3
	 TMp2IEDdYFvCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1751496136; x=1751756636; i=ngoc-tu.dinh@vates.tech;
	bh=SHAawigTxxv6yh6TdZAJGRPMMIrw2ifj78O7i+3plPQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Bk63xhpXfcLqo20k0VGWRGuB+rsZ+fB5rlsbpPAWLOD09l0q/4vNYwULJ91j2fQgN
	 6aN43Q03mLoZu6gVE+HKBNCN+stc/8NZif/CNXcKsSykRJlYtslJBKd/xR+GhBYn2T
	 M9GoZBt8cV9o7xteTRp5KqNCJeVKDfyCo2XbA5Q29TVWingIEj21HU5Tj08J0rrNRT
	 HOVWs7o6V8WZxNs5ujtpsM7q3kFb4q01h9K8u6gbAQt2alTfn9m8ZqgU1DsuloQCWl
	 egmRYYM4OJsgwi2L17zgtpRgwvNmg3Ihof+V3Ndy4uMVD0q/08laCfa1jPrlHolJ0f
	 aOfzttmf/STdw==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20xen/gntdev:=20reduce=20stack=20usage=20by=20dynamically=20allocating=20gntdev=5Fcopy=5Fbatch?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1751496134720
Message-Id: <ab668ddb-1ea5-4444-95fc-f31469b4f05e@vates.tech>
To: Abinash <abinashlalotra@gmail.com>
Cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, "Abinash Singh" <abinashsinghlalotra@gmail.com>
References: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com> <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech> <CAJZ91LC610AsBZ8X3u8ZxAUhc6QT0FHeffQT0ARmnMgsGrdZQQ@mail.gmail.com>
In-Reply-To: <CAJZ91LC610AsBZ8X3u8ZxAUhc6QT0FHeffQT0ARmnMgsGrdZQQ@mail.gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a090fbdbd9a648fb9a644b0ec935ed84?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250702:md
Date: Wed, 02 Jul 2025 22:42:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/07/2025 23:53, Abinash wrote:
> Hi ,
> 
> Thanks for pointing that out.
> 
> I haven=E2=80=99t measured the performance impact yet =E2=80=94 my main f=
ocus was on
> getting rid of the stack usage warning triggered by LLVM due to
> inlining. But you're right, gntdev_ioctl_grant_copy() is on a hot
> path, and calling kmalloc() there could definitely slow things down,
> especially under memory pressure.
> 
> I=E2=80=99ll run some benchmarks to compare the current approach with the
> dynamic allocation, and also look into alternatives =E2=80=94 maybe
> pre-allocating the struct or limiting inlining instead. If you have
> any ideas or suggestions on how best to approach this, I=E2=80=99d be hap=
py to
> hear them.
> 
> Do you have any suggestions on how to test the performance?
> 
> Best,
> Abinash
> 
> 

Preallocating may work but I'd be wary of synchronization if the 
preallocated struct is shared.

I'd look at optimizing status[] which should save quite a few bytes.

Reducing GNTDEV_COPY_BATCH could be a last resort, but that may also 
impact performance.

As for benchmarks, I think you can use iperf and fio with varying packet 
sizes/block sizes.

> On Mon, 30 Jun 2025 at 16:05, Tu Dinh <ngoc-tu.dinh@vates.tech> wrote:
>>
>> Hi,
>>
>> On 30/06/2025 06:54, Abinash Singh wrote:
>>> While building the kernel with LLVM, a warning was reported due to
>>> excessive stack usage in `gntdev_ioctl`:
>>>
>>>        drivers/xen/gntdev.c:991: warning: stack frame size (1160) excee=
ds limit (1024) in function 'gntdev_ioctl'
>>>
>>> Further analysis revealed that the large stack frame was caused by
>>> `struct gntdev_copy_batch`, which was declared on the stack inside
>>> `gntdev_ioctl_grant_copy()`. Since this function was inlined into
>>> `gntdev_ioctl`, the stack usage was attributed to the latter.
>>>
>>> This patch fixes the issue by dynamically allocating `gntdev_copy_batch=
`
>>> using `kmalloc()`, which significantly reduces the stack footprint and
>>> eliminates the warning.
>>>
>>> This approach is consistent with similar fixes upstream, such as:
>>>
>>> commit fa26198d30f3 ("iommu/io-pgtable-arm: dynamically allocate selfte=
st device struct")
>>>
>>> Fixes: a4cdb556cae0 ("xen/gntdev: add ioctl for grant copy")
>>> Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
>>> ---
>>> The stack usage was confirmed using the `-fstack-usage`  flag and mannu=
al analysis, which showed:
>>>
>>>     drivers/xen/gntdev.c:953: gntdev_ioctl_grant_copy.isra   1048 bytes
>>>     drivers/xen/gntdev.c:826: gntdev_copy                     56 bytes
>>>
>>> Since `gntdev_ioctl` was calling the inlined `gntdev_ioctl_grant_copy`,=
 the total
>>> frame size exceeded 1024 bytes, triggering the warning.
>>>
>>> This patch addresses the warning and keeps stack usage within acceptabl=
e limits.
>>> Is this patch fine or kmalloc may affect performance ?
>>> ---
>>
>> Have you measured the performance impact? gntdev_ioctl_grant_copy is
>> called quite often especially by the backend. I'm afraid calling the
>> allocator here may cause even more slowdown than there already is,
>> especially when memory is tight.
>>
>>>    drivers/xen/gntdev.c | 24 +++++++++++++++---------
>>>    1 file changed, 15 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
>>> index 61faea1f0663..9811f3d7c87c 100644
>>> --- a/drivers/xen/gntdev.c
>>> +++ b/drivers/xen/gntdev.c
>>> @@ -953,15 +953,19 @@ static int gntdev_grant_copy_seg(struct gntdev_co=
py_batch *batch,
>>>    static long gntdev_ioctl_grant_copy(struct gntdev_priv *priv, void _=
_user *u)
>>>    {
>>>        struct ioctl_gntdev_grant_copy copy;
>>> -     struct gntdev_copy_batch batch;
>>> +     struct gntdev_copy_batch *batch;
>>>        unsigned int i;
>>>        int ret =3D 0;
>>>
>>>        if (copy_from_user(&copy, u, sizeof(copy)))
>>>                return -EFAULT;
>>> -
>>> -     batch.nr_ops =3D 0;
>>> -     batch.nr_pages =3D 0;
>>> +
>>> +     batch =3D kmalloc(sizeof(*batch), GFP_KERNEL);
>>> +     if (!batch)
>>> +             return -ENOMEM;
>>> +
>>> +     batch->nr_ops =3D 0;
>>> +     batch->nr_pages =3D 0;
>>>
>>>        for (i =3D 0; i < copy.count; i++) {
>>>                struct gntdev_grant_copy_segment seg;
>>> @@ -971,18 +975,20 @@ static long gntdev_ioctl_grant_copy(struct gntdev=
_priv *priv, void __user *u)
>>>                        goto out;
>>>                }
>>>
>>> -             ret =3D gntdev_grant_copy_seg(&batch, &seg, &copy.segment=
s[i].status);
>>> +             ret =3D gntdev_grant_copy_seg(batch, &seg, &copy.segments=
[i].status);
>>>                if (ret < 0)
>>>                        goto out;
>>>
>>>                cond_resched();
>>>        }
>>> -     if (batch.nr_ops)
>>> -             ret =3D gntdev_copy(&batch);
>>> -     return ret;
>>> +     if (batch->nr_ops)
>>> +             ret =3D gntdev_copy(batch);
>>> +     goto free_batch;
>>>
>>>      out:
>>> -     gntdev_put_pages(&batch);
>>> +     gntdev_put_pages(batch);
>>> +  free_batch:
>>> +     kfree(batch);
>>>        return ret;
>>>    }
>>>
>>
>>
>>
>> Ngoc Tu Dinh | Vates XCP-ng Developer
>>
>> XCP-ng & Xen Orchestra - Vates solutions
>>
>> web: https://vates.tech
>>



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



