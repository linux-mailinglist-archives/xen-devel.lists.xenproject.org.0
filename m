Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDDBB7EEBC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 15:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125140.1467176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyrEm-0000fQ-Ub; Wed, 17 Sep 2025 12:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125140.1467176; Wed, 17 Sep 2025 12:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyrEm-0000co-Rb; Wed, 17 Sep 2025 12:26:16 +0000
Received: by outflank-mailman (input) for mailman id 1125140;
 Wed, 17 Sep 2025 12:26:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BlG=34=rsg.ci.i.u-tokyo.ac.jp=odaki@srs-se1.protection.inumbo.net>)
 id 1uyrEk-0000ci-JH
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 12:26:15 +0000
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7eb24e9f-93c1-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 14:26:13 +0200 (CEST)
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
 (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 58HCO5JM035551
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 17 Sep 2025 21:24:05 +0900 (JST)
 (envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
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
X-Inumbo-ID: 7eb24e9f-93c1-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: a=rsa-sha256; bh=7Wlnz80tbhY7qRbZWs6EVByRB96OxlH4d0GlP1+LXn4=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=Message-ID:Date:Subject:To:From;
        s=rs20250326; t=1758111846; v=1;
        b=pcA8k4lRgBS+t8ieEiJwckoiL6SVDotMvZ+SV6ab51ZpRmSZyNHvPc1tsm2O60Z3
         Vabanu3VGyMcDlvcTQMXwUgSGM/R4Jnh/R3IDNzM5e1R3HgJDb2e5mIzVFRbiwUM
         KsXbDp5IK3b97+7+r5cI8qagpx1WBNngXicMKex9/qHpeXUVy0rpDmZsO0PEx0Rb
         EF9uZa7bjHuJF/0Q6D7LZBneKBPEqtgTamSWtX+vQPcVa14v1PSzh6qbcvRLSAet
         AyZ4qOdB0eryLyrNWxaSLxlFUUWtkZN8b1o+cuCe9TTBTJ/abyzONpk9IcMp0uUH
         /kM7345Karx0jA73rC5T1Q==
Message-ID: <a1ad2a8f-8a69-4d25-bffd-482aec2fe9db@rsg.ci.i.u-tokyo.ac.jp>
Date: Wed, 17 Sep 2025 21:24:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Do not unparent in instance_finalize()
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Helge Deller <deller@gmx.de>,
        =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
        qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
        Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org,
        John Levon <john.levon@nutanix.com>,
        Thanos Makatos <thanos.makatos@nutanix.com>,
        Yanan Wang <wangyanan55@huawei.com>,
        BALATON Zoltan <balaton@eik.bme.hu>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Aleksandar Rikalo
 <arikalo@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Alistair Francis <alistair@alistair23.me>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        Bin Meng <bmeng.cn@gmail.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        xen-devel@lists.xenproject.org
References: <20250917-use-v3-0-72c2a6887c6c@rsg.ci.i.u-tokyo.ac.jp>
 <aMqiK5SaeBJlSa_h@redhat.com>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <aMqiK5SaeBJlSa_h@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/09/17 20:57, Daniel P. Berrangé wrote:
> On Wed, Sep 17, 2025 at 07:13:25PM +0900, Akihiko Odaki wrote:
>> Based-on: <cover.1751493467.git.balaton@eik.bme.hu>
>> ("[PATCH v2 00/14] hw/pci-host/raven clean ups")
>>
>> Supersedes: <20240829-memory-v1-1-ac07af2f4fa5@daynix.com>
>> ("[PATCH] docs/devel: Prohibit calling object_unparent() for memory region")
>>
>> Children are automatically unparented so manually unparenting is
>> unnecessary.
> 
> Where is automatic unparenting you're referring to being done ?
> 
>> Worse, automatic unparenting happens before the instance_finalize()
>> callback of the parent gets called, so object_unparent() calls in
>> the callback will refer to objects that are already unparented, which
>> is semantically incorrect.
> 
> IIUC, object_property_add_child will acquire a reference on
> the child, and object_property_del_child (and thus
> object_unparent) will release that reference.
> 
> The 'object_finalize' method, and thus 'instance_finalize'
> callback, won't be invoked until the last reference is
> dropped on the object in question.
> 
> IOW, it should be impossible for 'object_finalize' to ever
> run, as long as the child has a parent set.
> 
> So if we're in the 'finalize' then 'object_unparent' must
> be a no-op as the child must already have no references
> held and thus no parent.
> 
> IOW, the reason to remove 'object_unparent' calls from
> finalize is surely because they do nothing at all,
> rather than this talk about callbacks being run at the
> wrong time ?

This patch series deals with the situation where the parent calls 
object_unparent() in its instance_finalize() callback. The process of 
finalization looks like as follows:

1. The parent's reference count reaches to zero. Please note that there 
can be remaining children that are referenced by the parent at this point.

2. object_finalize() is called.

2a. object_property_del_all() is called and the parent releases 
references to its children. This is what I referred as "automatic 
unparenting". The children without any other references will be 
finalized here.

2b. instance_finalize() is called. Past children may be already 
finalized, and calling object_unparent() here will cause dereferencing 
finalized objects in that case, which should be avoided.

Regards,
Akihiko Odaki

