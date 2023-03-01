Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41176A7162
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 17:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504158.776737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXPTc-00053U-OX; Wed, 01 Mar 2023 16:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504158.776737; Wed, 01 Mar 2023 16:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXPTc-00051J-LR; Wed, 01 Mar 2023 16:38:48 +0000
Received: by outflank-mailman (input) for mailman id 504158;
 Wed, 01 Mar 2023 16:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0zca=6Z=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1pXPTa-00050h-NL
 for xen-devel@lists.xen.org; Wed, 01 Mar 2023 16:38:46 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86c74a79-b84f-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 17:38:44 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id k37so9031981wms.0
 for <xen-devel@lists.xen.org>; Wed, 01 Mar 2023 08:38:42 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b003daffc2ecdesm101200wmo.13.2023.03.01.08.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 08:38:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DAA201FFB7;
 Wed,  1 Mar 2023 16:38:40 +0000 (GMT)
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
X-Inumbo-ID: 86c74a79-b84f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLJB0AywjKErpano3hVxQBKZ1gllESkhAW0hnMNDsWQ=;
        b=Ny6yujlRJ9bR/RWpfN7TJPhmn6Y2SpV5i143jJu4HQ5TYnz2MIBVVthziDHIsWZ3Xz
         dyQNWzOw3oZiOeU41/aa0VOR/rWnsNKAA8EzD402f/R/euqJ5KakgeTyzP5MuxdU3qbe
         k0+/GepenSV33Q7DbOHctuPIVpcPVd/8ErpCfyhtmOzRNF6eqV7Zfz9NYdV2QHWNrfIT
         5y8XBwFdDUzAmg5Qt306eP3gYVlbSrgZr+of0bm1G+y/0Ax6OBtN7+gXd3pz0K+K7x4d
         4gauoX9mKkXQc2eZ7HQ6uqXoIwmz3jiHPdKBDG/HYwnpzPtqM/SxCsmp7u8KgADBDrj5
         mNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MLJB0AywjKErpano3hVxQBKZ1gllESkhAW0hnMNDsWQ=;
        b=uiyWjik6cwWK27AfqTZDYuSkrYNUiiEYcoPK4llM7T9dVW2QSeroAkRz/aAfI1OJhC
         7c1btpwVPWGbZz8RmLF+y1H5/uH3GHex1/a5DmOeeeli1k+T2gnTVDLRlE4sMxLJor4P
         va2UCE6F7CHfTueRFllYo0wsNEc4BKDfIJo0GOSdgyyddAEVA2jK5zJhkeON8M3unzIc
         qPZnSNb4wcIS1P4JPi1rQlpvSNVmYyVCz938DjnunMiTrgvgnw01dcjFTNnSCg0aQPki
         oscusljpC6/d//0Ev1ij5e80/OX10FE0PTSN6Y94rWQvfftKhMXZx2zqah2fP5kh5pQi
         BhOw==
X-Gm-Message-State: AO0yUKUfbndPvof4e5SUfp6osBzoe2E6cjY3z8PatwTwhD/mBm3WGEAY
	9Ooo2zKaSNznKdk1kftmbm6XEw==
X-Google-Smtp-Source: AK7set8WBgfC36G3IFqFpRa7gBd2pVVtyWUHN64EG9LFoiuEgjP0tf5cL7IIFNkQ8zEijLa0yqq7mg==
X-Received: by 2002:a05:600c:44d4:b0:3eb:29fe:7baa with SMTP id f20-20020a05600c44d400b003eb29fe7baamr5520403wmo.34.1677688721652;
        Wed, 01 Mar 2023 08:38:41 -0800 (PST)
References: <Y/9zkDAS4odz93GM@fedora>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org, "Michael
 S. Tsirkin" <mst@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, stratos-dev@op-lists.linaro.org, Oleksandr
 Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Sebastien
 Boeuf <sebastien.boeuf@intel.com>, Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 virtio-dev@lists.oasis-open.org
Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory
 mapping support
Date: Wed, 01 Mar 2023 16:31:41 +0000
In-reply-to: <Y/9zkDAS4odz93GM@fedora>
Message-ID: <877cw0ctpr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Stefan Hajnoczi <stefanha@redhat.com> writes:

> [[PGP Signed Part:Undecided]]
> Resend - for some reason my email didn't make it out.
>
> From: Stefan Hajnoczi <stefanha@redhat.com>
> Subject: Re: [virtio-dev] [RFC QEMU] docs: vhost-user: Add custom memory
>  mapping support
> To: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org, "Michael S.
>  Tsirkin" <mst@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
>  Alex Benn=C3=A9e <alex.bennee@linaro.org>,
> 	stratos-dev@op-lists.linaro.org, Oleksandr Tyshchenko
>  <olekstysh@gmail.com>, xen-devel@lists.xen.org, Andrew Cooper
>  <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Sebastien
>  Boeuf
> 	<sebastien.boeuf@intel.com>, Liu Jiang <gerry@linux.alibaba.com>, Mathieu
>  Poirier <mathieu.poirier@linaro.org>
> Date: Tue, 21 Feb 2023 10:17:01 -0500 (1 week, 1 day, 1 hour ago)
> Flags: seen, signed, personal
>
> On Tue, Feb 21, 2023 at 03:20:41PM +0530, Viresh Kumar wrote:
>> The current model of memory mapping at the back-end works fine with
>> Qemu, where a standard call to mmap() for the respective file
>> descriptor, passed from front-end, is generally all we need to do before
>> the front-end can start accessing the guest memory.
>>=20
>> There are other complex cases though, where we need more information at
>> the backend and need to do more than just an mmap() call. For example,
>> Xen, a type-1 hypervisor, currently supports memory mapping via two
>> different methods, foreign-mapping (via /dev/privcmd) and grant-dev (via
>> /dev/gntdev). In both these cases, the back-end needs to call mmap()
>> followed by an ioctl() (or vice-versa), and need to pass extra
>> information via the ioctl(), like the Xen domain-id of the guest whose
>> memory we are trying to map.
>>=20
>> Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_CUSTOM_MMAP', which
>> lets the back-end know about the additional memory mapping requirements.
>> When this feature is negotiated, the front-end can send the
>> 'VHOST_USER_CUSTOM_MMAP' message type to provide the additional
>> information to the back-end.
>>=20
>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> ---
>>  docs/interop/vhost-user.rst | 32 ++++++++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>
> The alternative to an in-band approach is to configure these details
> out-of-band. For example, via command-line options to the vhost-user
> back-end:
>
>   $ my-xen-device --mapping-type=3Dforeign-mapping --domain-id=3D123
>
> I was thinking about both approaches and don't see an obvious reason to
> choose one or the other. What do you think?

In-band has the nice property of being dynamic and not having to have
some other thing construct command lines. We are also trying to keep the
daemons from being Xen specific and keep the type of mmap as an
implementation detail that is mostly elided by the rust-vmm memory
traits.

>
>> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
>> index 3f18ab424eb0..f2b1d705593a 100644
>> --- a/docs/interop/vhost-user.rst
>> +++ b/docs/interop/vhost-user.rst
>> @@ -258,6 +258,23 @@ Inflight description
>>=20=20
>>  :queue size: a 16-bit size of virtqueues
>>=20=20
>> +Custom mmap description
>> +^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> ++-------+-------+
>> +| flags | value |
>> ++-------+-------+
>> +
>> +:flags: 64-bit bit field
>> +
>> +- Bit 0 is Xen foreign memory access flag - needs Xen foreign memory ma=
pping.
>> +- Bit 1 is Xen grant memory access flag - needs Xen grant memory mappin=
g.
>> +
>> +:value: a 64-bit hypervisor specific value.
>> +
>> +- For Xen foreign or grant memory access, this is set with guest's xen =
domain
>> +  id.
>
> This is highly Xen-specific. How about naming the feature XEN_MMAP
> instead of CUSTOM_MMAP? If someone needs to add other mmap data later,
> they should define their own struct instead of trying to squeeze into
> the same fields as Xen.

We hope to support additional mmap mechanisms in the future - one
proposal is to use the hypervisor specific interface to support an
ioctl() that creates a domain specific device which can then be treated
more generically.

Could we not declare the message as flag + n bytes of domain specific
message as defined my msglen?

> There is an assumption in this design that a single
> VHOST_USER_CUSTOM_MMAP message provides the information necessary for
> all mmaps. Are you sure the limitation that every mmap belongs to the
> same domain will be workable in the future?

Like a daemon servicing multiple VMs? Won't those still be separate
vhost-user control channels though?

>
>> +
>>  C structure
>>  -----------
>>=20=20
>> @@ -867,6 +884,7 @@ Protocol features
>>    #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
>>    #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
>>    #define VHOST_USER_PROTOCOL_F_STATUS               16
>> +  #define VHOST_USER_PROTOCOL_F_CUSTOM_MMAP          17
>>=20=20
>>  Front-end message types
>>  -----------------------
>> @@ -1422,6 +1440,20 @@ Front-end message types
>>    query the back-end for its device status as defined in the Virtio
>>    specification.
>>=20=20
>> +``VHOST_USER_CUSTOM_MMAP``
>
> Most vhost-user protocol messages have a verb like
> get/set/close/add/listen/etc. I suggest renaming this to
> VHOST_USER_SET_XEN_MMAP_INFO.

VHOST_USER_CONFIG_MMAP_QUIRKS?

VHOST_USER_CONFIG_MMAP_TYPE?

>
>> +  :id: 41
>> +  :equivalent ioctl: N/A
>> +  :request payload: Custom mmap description
>> +  :reply payload: N/A
>> +
>> +  When the ``VHOST_USER_PROTOCOL_F_CUSTOM_MMAP`` protocol feature has b=
een
>> +  successfully negotiated, this message is submitted by the front-end to
>> +  notify the back-end of the special memory mapping requirements, that =
the
>> +  back-end needs to take care of, while mapping any memory regions sent
>> +  over by the front-end. The front-end must send this message before
>> +  any memory-regions are sent to the back-end via ``VHOST_USER_SET_MEM_=
TABLE``
>> +  or ``VHOST_USER_ADD_MEM_REG`` message types.
>> +
>>=20=20
>>  Back-end message types
>>  ----------------------
>> --=20
>> 2.31.1.272.g89b43f80a514
>>=20
>>=20
>> ---------------------------------------------------------------------
>> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
>> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
>>=20
>
>
>
> ----------
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

