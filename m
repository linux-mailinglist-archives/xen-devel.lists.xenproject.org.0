Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C0E82564E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 16:07:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662194.1032152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLlmx-0001XD-So; Fri, 05 Jan 2024 15:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662194.1032152; Fri, 05 Jan 2024 15:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLlmx-0001U2-PQ; Fri, 05 Jan 2024 15:07:11 +0000
Received: by outflank-mailman (input) for mailman id 662194;
 Fri, 05 Jan 2024 15:07:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qw3+=IP=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rLlmw-0001Tw-Qt
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 15:07:10 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 188ac485-abdc-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 16:07:08 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5572ffdba53so728220a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2024 07:07:08 -0800 (PST)
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
X-Inumbo-ID: 188ac485-abdc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704467228; x=1705072028; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57EA3Pee1hhACBB6gT+9NULYhceeX3zvghZDugvPfsg=;
        b=YBrxkZ+JoqPK4cN0TLOlU1zb05lKM1ETq/RAg85edxViwPCpzi6qZ24+8Fe182NCGk
         9zdg+x24eMtZAzkKSrXWCShX69FF7pkrdYNyWIARSrit3UTx9+yRNg+zWjYbXQOU38Xc
         B9IuQTDqS2x+LB2jHVen7khXqNO0ynFSxX5n+Wa8WEhBV3LUlBL+aYyw/bLRJ+ieymlN
         aUqlwWt8SZFaZuouuwW7imGnrqoVuACPGNWHW4GFTVZe0EJxnVxYo2cEfy1BpOL+UQNa
         lgEILD1IqJP/8vx2+eQHOwfBbcQ03HX9e7wo8Ih4kf0NHOZhPG+NActCG/ZZNEoF1++6
         Zm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704467228; x=1705072028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57EA3Pee1hhACBB6gT+9NULYhceeX3zvghZDugvPfsg=;
        b=qilQ6IjwxSJYFYRyTufIJY3fR7ZSbM3SLJM5XWWkoGt72IHsDf/Z3VpgKupLcr1cKT
         TRfzD8hfJ8z+6P2O57OnDstxLeTvERtSjs64RhLAbBCej0EfF+zS+OR4Jd3anL+OEpQS
         tRXdR1CQmcrKEkdze+Fl+Sa24ifBM5uC1lSwgSqWiH11A8tzvXNdv5+/o0WYr0q+YWmV
         Ti5aQWv6ceVMi6tisyVMmZ1zcolgVRvyxVSXIw9rrFXt8va/7dyFFj+Lw/Ze8JPnEs7K
         bufJkUY06NB4jcfn/VlQ5u9umMFAtv36sKBbWTR4bpaZcoL08+4cy+FcJPESTHRN8dqA
         rvyQ==
X-Gm-Message-State: AOJu0Yx/Met6xM/PMAUVKBd2A2JqOfBBHgzp8+G7NBevpdpcMQeWIyXQ
	9nJ8nwOWK0panihhlCQuUl7MzZ9soykJ8dtF8t8=
X-Google-Smtp-Source: AGHT+IGc2r5KRZMDrcIhKGfo3XNxOrSFyNixck6AGZ2uPicsxsOK2nDdoisHyDBe+PuSmJRoqKWBu7zxUSDSLqFH/9I=
X-Received: by 2002:a50:d64e:0:b0:557:1267:e380 with SMTP id
 c14-20020a50d64e000000b005571267e380mr925019edj.77.1704467228111; Fri, 05 Jan
 2024 07:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-5-jgross@suse.com>
In-Reply-To: <20240104090055.27323-5-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 5 Jan 2024 10:06:56 -0500
Message-ID: <CAKf6xptD0U1CH7FPH+w=ayA22GkGBbiMjWXym5Lw-RtbmDinRA@mail.gmail.com>
Subject: Re: [PATCH v3 04/33] tools/xenlogd: connect to frontend
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 5:12=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Add the code for connecting to frontends to xenlogd.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

