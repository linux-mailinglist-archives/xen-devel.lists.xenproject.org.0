Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C77AB8925B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Sep 2025 12:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126817.1468145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzYi4-0000CP-Dp; Fri, 19 Sep 2025 10:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126817.1468145; Fri, 19 Sep 2025 10:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzYi4-00009j-6z; Fri, 19 Sep 2025 10:51:24 +0000
Received: by outflank-mailman (input) for mailman id 1126817;
 Fri, 19 Sep 2025 10:51:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFOU=36=rsg.ci.i.u-tokyo.ac.jp=odaki@srs-se1.protection.inumbo.net>)
 id 1uzYi1-00009Y-1f
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 10:51:22 +0000
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91dafea5-9546-11f0-9d14-b5c5bf9af7f9;
 Fri, 19 Sep 2025 12:51:19 +0200 (CEST)
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
 (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 58JAnSkG034536
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 19 Sep 2025 19:49:28 +0900 (JST)
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
X-Inumbo-ID: 91dafea5-9546-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: a=rsa-sha256; bh=MP/aWQfL5AeteLs3iYOvs5XOjlgtCOWSBWzrwpTeLHA=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=Message-ID:Date:Subject:To:From;
        s=rs20250326; t=1758278969; v=1;
        b=S5fu8gfxZZiPnzD5VRHNv/uTY6iJWyIUwLazMNVUmCBeynHTUOA2iEgcOHc6KflY
         emqbX/bQhivXM0ZJTrM3Kdix317VEnNTLuR55r4BD6CCS2KsNV+u6uR2Gu2MeHSQ
         lBZ4MUkNXjzKLJFzzUPNWcYrBs4hFzvr5zRMtUKMo/3Etb6/jheULNi1cf88hRVF
         09KetWzajL11CS43aTEF5Ibb+gEZWvRrpGktxAm4fHCDTmcDcDa8Ov/Q3dITg4E+
         n588HfUKfhFonV0Thdy6AMTm3LydrhGYm0/d08ebrVqGb/oTCwq/Tj1NiNFxZ9K/
         VBUOfiYyB4m/Du6sv1fF7Q==
Message-ID: <10834681-260f-4727-9687-77b3eef085bb@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 19 Sep 2025 19:49:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Do not unparent in instance_finalize()
To: Peter Xu <peterx@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
        Eduardo Habkost <eduardo@habkost.net>,
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
 <aMwRSpezxmIwIHrU@x1.local> <f536fc18-73ab-676c-bdec-59e94a3e5408@eik.bme.hu>
 <aMwxYY9E3QghD10K@x1.local> <aMxOM-XCamf2y8ke@x1.local>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <aMxOM-XCamf2y8ke@x1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/09/19 3:23, Peter Xu wrote:
> On Thu, Sep 18, 2025 at 12:20:49PM -0400, Peter Xu wrote:
>> On Thu, Sep 18, 2025 at 05:29:34PM +0200, BALATON Zoltan wrote:
>>> On Thu, 18 Sep 2025, Peter Xu wrote:
>>>> On Wed, Sep 17, 2025 at 07:13:25PM +0900, Akihiko Odaki wrote:
>>>>> Based-on: <cover.1751493467.git.balaton@eik.bme.hu>
>>>>> ("[PATCH v2 00/14] hw/pci-host/raven clean ups")
>>>>
>>>> Could I ask why this is a dependency?
>>>
>>> It removes an address_space usage from raven so this series does not have to
>>> change that and I don't have to rebase that series. Otherwise these are not
>>> related. I'll check the problem reported about my series and send an updated
>>> one.
>>
>> This series should be a split of a previous mixed up series that may
>> contain address space changes while this one doesn't.  It also doesn't
>> touch raven.c and ppc/.
>>
>> Can I then understand it as the dependency is simply not needed?
> 
> I meant, it seems we don't need to wait for the other series to merge this
> one, hence the there is no real dependency.

You are right. This series can be merged without the raven clean ups.

Regards,
Akihiko Odaki

