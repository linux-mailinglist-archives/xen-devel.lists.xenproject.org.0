Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A842962A91
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 16:43:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784921.1194331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJsl-0001iD-Ox; Wed, 28 Aug 2024 14:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784921.1194331; Wed, 28 Aug 2024 14:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjJsl-0001gi-M2; Wed, 28 Aug 2024 14:42:47 +0000
Received: by outflank-mailman (input) for mailman id 784921;
 Wed, 28 Aug 2024 14:42:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HR2x=P3=bounce.vates.tech=bounce-md_30504962.66cf3762.v1-a95f825d5daf4dfca293eb7ba3c198a2@srs-se1.protection.inumbo.net>)
 id 1sjJsj-0001gc-Ii
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 14:42:46 +0000
Received: from mail187-32.suw11.mandrillapp.com
 (mail187-32.suw11.mandrillapp.com [198.2.187.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c820c60e-654b-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 16:42:43 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-32.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4Wv6Zp1FhHzQXgCTT
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 14:42:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a95f825d5daf4dfca293eb7ba3c198a2; Wed, 28 Aug 2024 14:42:42 +0000
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
X-Inumbo-ID: c820c60e-654b-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724856162; x=1725116662;
	bh=iIxB/m3mCS7MC/ry2Lyz0dBSlsPzD3LE+gEALXQt8f4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ooAwTccbQEQay0SqqEXDdTdAP62kqUcuoGIrp8/QBQcwC4VZCaWGuqQipxgLwK5Dx
	 4GHT8dPq5pcnBHa0jzAC9CKWrO1s1F+djAPBBFavHg/HQ8Ecg8vhD5h5qzbWRplVvo
	 RwtvUKI5ULhuMqbUDQk9zjdHKItot1t1eaSrBZzwmeijeXEFIwD/x75cKrz9G8SYJZ
	 gU83VKiHl86aQpxvrFLrNhb8liYXvFpQ+0P26PEJLE9m+sD6sCGia5sF10bO6DdRGN
	 ZwFxejgjwJI9AwzMNpGMY6uCsOHt5R284awVGYKZgus2RqRLSDFfPlzu3FMGr7h+pn
	 JMQy24XDcHl5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724856162; x=1725116662; i=anthony.perard@vates.tech;
	bh=iIxB/m3mCS7MC/ry2Lyz0dBSlsPzD3LE+gEALXQt8f4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BlHutNXWYqcpV3HWae+V/9xzYZuUUeWHR/h/6rgtZTip6J/CzGwAdGjBS8acSXung
	 DAc2A9NFbu3h54o7o8228W4jMZUPC3A7hLpUsc+LnGoVk07L34AQqgv6Yq8V1e4gYy
	 Yd7mM5qsR+LFU01num+6VuGBzPmnuL/ufUPzi1pySGuz3IGmoi12wap+grSb3Iv8gN
	 cd0q33JbPBob+4FEBRyZO4RZsSgIWnIYN9GEApOaDrACCws53GvLC98O5Am9A39iZ/
	 anTf0wLlAj4yTz+Go9raYVg1jw0FddvvRV75kRbwAsa9BpC4hVfIc52lcWnG8lXUVH
	 X/MaphBZHm6pw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=202/3]=20libxl:=20Probe=20QEMU=20for=20-run-with=20chroot=3Ddir=20and=20use=20it?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724856161354
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Message-Id: <Zs83YDlqNXhbyQag@l14>
References: <20240827100328.23216-1-anthony.perard@vates.tech> <20240827100328.23216-3-anthony.perard@vates.tech> <8ab87d44-8a93-4468-b960-0c76c1e6a147@amd.com>
In-Reply-To: <8ab87d44-8a93-4468-b960-0c76c1e6a147@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a95f825d5daf4dfca293eb7ba3c198a2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240828:md
Date: Wed, 28 Aug 2024 14:42:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Aug 27, 2024 at 06:20:42PM -0400, Jason Andryuk wrote:
> On 2024-08-27 06:03, Anthony PERARD wrote:
> > QEMU 9.0 have removed "-chroot" command line option, which have been
> > deprecated since QEMU 8.1 in favor of "-run-with chroot=dir".
> > 
> > Look into the result of the QMP command "query-command-line-options"
> > to find out if "-run-with chroot=dir" is available. Then use it in
> > place of "-chroot".
> > 
> > Resolves: xen-project/xen#187
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> though one suggestion below.
> 
> > ---
> >   tools/libs/light/libxl_dm.c       | 78 +++++++++++++++++++++++++------
> >   tools/libs/light/libxl_internal.h |  5 ++
> >   2 files changed, 69 insertions(+), 14 deletions(-)
> > 
> > diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> > index 46babfed0b..298fbb84fe 100644
> > --- a/tools/libs/light/libxl_dm.c
> > +++ b/tools/libs/light/libxl_dm.c
> > @@ -1183,11 +1183,12 @@ static int libxl__pre_open_qmp_socket(libxl__gc *gc, libxl_domid domid,
> >   }
> >   static int libxl__build_device_model_args_new(libxl__gc *gc,
> > -                                        const char *dm, int guest_domid,
> > -                                        const libxl_domain_config *guest_config,
> > -                                        char ***args, char ***envs,
> > -                                        const libxl__domain_build_state *state,
> > -                                        int *dm_state_fd)
> > +    const char *dm, int guest_domid,
> > +    const libxl_domain_config *guest_config,
> > +    char ***args, char ***envs,
> > +    const libxl__domain_build_state *state,
> > +    const libxl__qemu_available_cmd_line *qemu_cmdline,
> 
> cmd_line/cmdline makes me think of command line strings.
> qemu_opts/qemu_cli_opts is a little more generic, to me at least.  But not a
> big deal if you want to keep it as is.

Yes, "opts" sounds better than "cmdline" in this context.

I'll rename "libxl__qemu_available_cmd_line" to
"libxl__qemu_available_opts".

And "qemu_cmdline" to "qemu_opts", both in the struct
libxl__dm_spawn_state and as argument of functions.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

