Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA6427E8FC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 14:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.664.2219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNbaU-0007AC-Qj; Wed, 30 Sep 2020 12:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664.2219; Wed, 30 Sep 2020 12:52:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNbaU-00079n-Ls; Wed, 30 Sep 2020 12:52:02 +0000
Received: by outflank-mailman (input) for mailman id 664;
 Wed, 30 Sep 2020 12:52:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qtLl=DH=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1kNbaS-00079i-3d
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:52:01 +0000
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 854cd741-df35-4b5a-998c-d0f4416573d8;
 Wed, 30 Sep 2020 12:51:58 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 95so1650364ota.13
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 05:51:58 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qtLl=DH=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
	id 1kNbaS-00079i-3d
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:52:01 +0000
X-Inumbo-ID: 854cd741-df35-4b5a-998c-d0f4416573d8
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 854cd741-df35-4b5a-998c-d0f4416573d8;
	Wed, 30 Sep 2020 12:51:58 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 95so1650364ota.13
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0wPhcg2LSZHu/TGS7lNnmy/csXQmnvXJn2oVG4UhCFU=;
        b=XquRtfZkI3Z1/dyelbhmy6+S3LdOrJ+Ls99zb0gNP1isZ5/ROkggvmrEz/emoeYGWy
         +7WV2wttZIrKzGps4H/VfZv8ipVy3amtJxb5yY3hYY3sY9T+XmpNAPp9usVKoA9ucM8I
         yFhLFNdvMezP74CymnCXqb+/GWbzizh3ybux8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0wPhcg2LSZHu/TGS7lNnmy/csXQmnvXJn2oVG4UhCFU=;
        b=m3sr3/a2w8b2vO/XztI4Ene2VykpZJV5ZwEzQtBfWxaIFo0wt2wMN/NT2/GzcCq4Zs
         CkCymJiYVj8qCCapUWNDIu3c2+NAr2g1zb1KAqu+GaN6l1ec7I0105H3o/umPjCVwPWL
         DyedmIQa2Ek50Dh3qv+OFbk0eZQVVT4VQCQuo/Hetd3zkMJRbgtSanQTYPYPDk5+KEf+
         X2KW0Ez+7xed6Qq1kHo4lkDIbrPAQ/7WyHx2YHQRRGJrGGA7TJeHvt+70XHD3NXkXRor
         qkdwuuzsaO21zKxFswPghuDBj+cgKfxoHCfUd3cL5MYoTrSjBCfZWpMAuOWCNjtN+g7T
         Hb7Q==
X-Gm-Message-State: AOAM533Q3osg90XYKJePq2dUO15EGovrWr76xfnqBfZErfi9RZuthfm7
	3xjJ8vBj7BNpv+5y5ZRNFfEaghC1aZGVd+0dUtgzDg==
X-Google-Smtp-Source: ABdhPJxxpGai/lgr0vj7vZLBdjw/nwkhoKL0Cu07SVu0LJH3S5jKfA3Xrm3c1q+2d1FIg6dGQXev7SEllIxIp/8QKPM=
X-Received: by 2002:a05:6830:14d9:: with SMTP id t25mr1567057otq.188.1601470317809;
 Wed, 30 Sep 2020 05:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200929151437.19717-1-tzimmermann@suse.de> <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com> <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com> <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com> <20200930094712.GW438822@phenom.ffwll.local>
 <8479d0aa-3826-4f37-0109-55daca515793@amd.com>
In-Reply-To: <8479d0aa-3826-4f37-0109-55daca515793@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Sep 2020 14:51:46 +0200
Message-ID: <CAKMK7uH0U36NG8w98i0x6HVGeogiwnYDRiKquLW-8znLa7-0yg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Dave Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>, 
	Alex Deucher <alexander.deucher@amd.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Qiang Yu <yuq825@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
	Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
	Steven Price <steven.price@arm.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Hans de Goede <hdegoede@redhat.com>, Sean Paul <sean@poorly.run>, "Anholt, Eric" <eric@anholt.net>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Huang Rui <ray.huang@amd.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Emil Velikov <emil.velikov@collabora.com>, 
	Luben Tuikov <luben.tuikov@amd.com>, apaneers@amd.com, 
	Linus Walleij <linus.walleij@linaro.org>, Melissa Wen <melissa.srw@gmail.com>, 
	"Wilson, Chris" <chris@chris-wilson.co.uk>, Qinglang Miao <miaoqinglang@huawei.com>, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, lima@lists.freedesktop.org, 
	Nouveau Dev <nouveau@lists.freedesktop.org>, 
	The etnaviv authors <etnaviv@lists.freedesktop.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	"open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>, 
	"moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 2:34 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 30.09.20 um 11:47 schrieb Daniel Vetter:
> > On Wed, Sep 30, 2020 at 10:34:31AM +0200, Christian K=C3=B6nig wrote:
> >> Am 30.09.20 um 10:19 schrieb Thomas Zimmermann:
> >>> Hi
> >>>
> >>> Am 30.09.20 um 10:05 schrieb Christian K=C3=B6nig:
> >>>> Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
> >>>>> Hi Christian
> >>>>>
> >>>>> Am 29.09.20 um 17:35 schrieb Christian K=C3=B6nig:
> >>>>>> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
> >>>>>>> The new helper ttm_kmap_obj_to_dma_buf() extracts address and loc=
ation
> >>>>>>> from and instance of TTM's kmap_obj and initializes struct dma_bu=
f_map
> >>>>>>> with these values. Helpful for TTM-based drivers.
> >>>>>> We could completely drop that if we use the same structure inside =
TTM as
> >>>>>> well.
> >>>>>>
> >>>>>> Additional to that which driver is going to use this?
> >>>>> As Daniel mentioned, it's in patch 3. The TTM-based drivers will
> >>>>> retrieve the pointer via this function.
> >>>>>
> >>>>> I do want to see all that being more tightly integrated into TTM, b=
ut
> >>>>> not in this series. This one is about fixing the bochs-on-sparc64
> >>>>> problem for good. Patch 7 adds an update to TTM to the DRM TODO lis=
t.
> >>>> I should have asked which driver you try to fix here :)
> >>>>
> >>>> In this case just keep the function inside bochs and only fix it the=
re.
> >>>>
> >>>> All other drivers can be fixed when we generally pump this through T=
TM.
> >>> Did you take a look at patch 3? This function will be used by VRAM
> >>> helpers, nouveau, radeon, amdgpu and qxl. If we don't put it here, we
> >>> have to duplicate the functionality in each if these drivers. Bochs
> >>> itself uses VRAM helpers and doesn't touch the function directly.
> >> Ah, ok can we have that then only in the VRAM helpers?
> >>
> >> Alternative you could go ahead and use dma_buf_map in ttm_bo_kmap_obj
> >> directly and drop the hack with the TTM_BO_MAP_IOMEM_MASK.
> >>
> >> What I want to avoid is to have another conversion function in TTM bec=
ause
> >> what happens here is that we already convert from ttm_bus_placement to
> >> ttm_bo_kmap_obj and then to dma_buf_map.
> > Hm I'm not really seeing how that helps with a gradual conversion of
> > everything over to dma_buf_map and assorted helpers for access? There's
> > too many places in ttm drivers where is_iomem and related stuff is used=
 to
> > be able to convert it all in one go. An intermediate state with a bunch=
 of
> > conversions seems fairly unavoidable to me.
>
> Fair enough. I would just have started bottom up and not top down.
>
> Anyway feel free to go ahead with this approach as long as we can remove
> the new function again when we clean that stuff up for good.

Yeah I guess bottom up would make more sense as a refactoring. But the
main motivation to land this here is to fix the __mmio vs normal
memory confusion in the fbdev emulation helpers for sparc (and
anything else that needs this). Hence the top down approach for
rolling this out.
-Daniel

>
> Christian.
>
> > -Daniel
> >
> >> Thanks,
> >> Christian.
> >>
> >>> Best regards
> >>> Thomas
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> Best regards
> >>>>> Thomas
> >>>>>
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>>> ---
> >>>>>>>     include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
> >>>>>>>     include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
> >>>>>>>     2 files changed, 44 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_b=
o_api.h
> >>>>>>> index c96a25d571c8..62d89f05a801 100644
> >>>>>>> --- a/include/drm/ttm/ttm_bo_api.h
> >>>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
> >>>>>>> @@ -34,6 +34,7 @@
> >>>>>>>     #include <drm/drm_gem.h>
> >>>>>>>     #include <drm/drm_hashtab.h>
> >>>>>>>     #include <drm/drm_vma_manager.h>
> >>>>>>> +#include <linux/dma-buf-map.h>
> >>>>>>>     #include <linux/kref.h>
> >>>>>>>     #include <linux/list.h>
> >>>>>>>     #include <linux/wait.h>
> >>>>>>> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(str=
uct
> >>>>>>> ttm_bo_kmap_obj *map,
> >>>>>>>         return map->virtual;
> >>>>>>>     }
> >>>>>>>     +/**
> >>>>>>> + * ttm_kmap_obj_to_dma_buf_map
> >>>>>>> + *
> >>>>>>> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
> >>>>>>> + * @map: Returns the mapping as struct dma_buf_map
> >>>>>>> + *
> >>>>>>> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If the=
 memory
> >>>>>>> + * is not mapped, the returned mapping is initialized to NULL.
> >>>>>>> + */
> >>>>>>> +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_kma=
p_obj
> >>>>>>> *kmap,
> >>>>>>> +                           struct dma_buf_map *map)
> >>>>>>> +{
> >>>>>>> +    bool is_iomem;
> >>>>>>> +    void *vaddr =3D ttm_kmap_obj_virtual(kmap, &is_iomem);
> >>>>>>> +
> >>>>>>> +    if (!vaddr)
> >>>>>>> +        dma_buf_map_clear(map);
> >>>>>>> +    else if (is_iomem)
> >>>>>>> +        dma_buf_map_set_vaddr_iomem(map, (void __force __iomem *=
)vaddr);
> >>>>>>> +    else
> >>>>>>> +        dma_buf_map_set_vaddr(map, vaddr);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>     /**
> >>>>>>>      * ttm_bo_kmap
> >>>>>>>      *
> >>>>>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-=
map.h
> >>>>>>> index fd1aba545fdf..2e8bbecb5091 100644
> >>>>>>> --- a/include/linux/dma-buf-map.h
> >>>>>>> +++ b/include/linux/dma-buf-map.h
> >>>>>>> @@ -45,6 +45,12 @@
> >>>>>>>      *
> >>>>>>>      *    dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
> >>>>>>>      *
> >>>>>>> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_io=
mem().
> >>>>>>> + *
> >>>>>>> + * .. code-block:: c
> >>>>>>> + *
> >>>>>>> + *    dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> >>>>>>> + *
> >>>>>>>      * Test if a mapping is valid with either dma_buf_map_is_set(=
) or
> >>>>>>>      * dma_buf_map_is_null().
> >>>>>>>      *
> >>>>>>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(str=
uct
> >>>>>>> dma_buf_map *map, void *vaddr)
> >>>>>>>         map->is_iomem =3D false;
> >>>>>>>     }
> >>>>>>>     +/**
> >>>>>>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structur=
e to
> >>>>>>> an address in I/O memory
> >>>>>>> + * @map:        The dma-buf mapping structure
> >>>>>>> + * @vaddr_iomem:    An I/O-memory address
> >>>>>>> + *
> >>>>>>> + * Sets the address and the I/O-memory flag.
> >>>>>>> + */
> >>>>>>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_ma=
p *map,
> >>>>>>> +                           void __iomem *vaddr_iomem)
> >>>>>>> +{
> >>>>>>> +    map->vaddr_iomem =3D vaddr_iomem;
> >>>>>>> +    map->is_iomem =3D true;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>     /**
> >>>>>>>      * dma_buf_map_is_equal - Compares two dma-buf mapping struct=
ures
> >>>>>>> for equality
> >>>>>>>      * @lhs:    The dma-buf mapping structure
> >>>>>> _______________________________________________
> >>>>>> dri-devel mailing list
> >>>>>> dri-devel@lists.freedesktop.org
> >>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01=
%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961f=
e4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DHdHOA%2F1=
VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=3D0
> >>>>> _______________________________________________
> >>>>> amd-gfx mailing list
> >>>>> amd-gfx@lists.freedesktop.org
> >>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01%7C=
christian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DH%2B5HKCsTrk=
sRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=3D0
> >>>> _______________________________________________
> >>>> dri-devel mailing list
> >>>> dri-devel@lists.freedesktop.org
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%7=
Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4=
884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DHdHOA%2F1Vc=
IX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=3D0
> >>>>
> >>> _______________________________________________
> >>> amd-gfx mailing list
> >>> amd-gfx@lists.freedesktop.org
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01%7Cch=
ristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DH%2B5HKCsTrksR=
V2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=3D0
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

