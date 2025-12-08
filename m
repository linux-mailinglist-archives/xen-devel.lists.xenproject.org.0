Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201C6CAD474
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 14:33:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180533.1503704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbMC-0006ON-UI; Mon, 08 Dec 2025 13:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180533.1503704; Mon, 08 Dec 2025 13:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSbMC-0006MD-RG; Mon, 08 Dec 2025 13:32:52 +0000
Received: by outflank-mailman (input) for mailman id 1180533;
 Mon, 08 Dec 2025 13:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLQx=6O=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vSbMB-0005iU-KB
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 13:32:51 +0000
Received: from mail-yx1-xb12b.google.com (mail-yx1-xb12b.google.com
 [2607:f8b0:4864:20::b12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63923ab7-d43a-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 14:32:50 +0100 (CET)
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-641e4744e59so4237735d50.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 05:32:49 -0800 (PST)
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
X-Inumbo-ID: 63923ab7-d43a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765200769; x=1765805569; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs5jS1SXs7VRHG7zUnau2PbwSwbc30wTyLYdoftGvzc=;
        b=SZLPfEUCK/GGATN2QHF/88fw/c9d7//iJAI0Ke58Is3a3ReJJgG41Jri2wtbJALPB8
         gsEz3Hg28tie09JyISHVYP9hLaj7Hh5EY5D6TMsR+fQoNHfGM5Zmt/0tWbXjKMQeJ8/3
         5DF5v+oDwNvCHVh5JFotGJKuJKFWaptTJw86ujAaSFuIGyDJMr/C8JOfjTWeFEiLvBZv
         XL9QyRS65aSoLgqhedw9CfPdkRYfuda6WE+s4NTZ2MLMvBlTG8oU7aontId7OEfqXlft
         kNwP/QDiI2ZkduFsXrefovdr6WY8Qoe/jyM7UDP3zxNCxtYhqJC9UUDQWXf2FuFM0AjU
         MZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765200769; x=1765805569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bs5jS1SXs7VRHG7zUnau2PbwSwbc30wTyLYdoftGvzc=;
        b=a5XoehU5+Odwrakgqs8NzSitmSmPtdE9J1Nr/HhwmI2zK6l+nI2D93+7VB/QVQgxdp
         1ljIbu6It80IuFmgirISsDXjw11w+WrazW7wgrH7Qrm4ja9OwzykB5wlMKal8ZjMIp9y
         rTUd1OuFnT47MhBPxnAFuvNtDQP2vHOhDdUZX/WlO/o4GWJV3zsyHwpePhsKdbudvCTK
         1Nd9HPPyIZg/eW2uZBhQZGGBONk2jfXqD5WPHjo9QEqnhsLTRLnb3EWMSh/k8FJnJSgx
         bJKdjQX8We87dzxH8NLxIFC1cz3xHlRJE3Tk0JwjnnFLbAVsUB5Ihl7kxyiosrY778Bu
         Wamg==
X-Forwarded-Encrypted: i=1; AJvYcCU7IIBdZ17VnZ9f0cEbWjLP/V2aUpYIh8soKNLUces8v9o5Q65jdT1OfYYIEZjJX3qrZhJmIq/VnDY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCnor98ILLZ0CBmq+H12ItO9tFj9invS7JKEIN6YwKjbl+q572
	cMiRA6dXbisyT0nKNkMtxMm0BlJYLMSJunMuZyICIbeK26FNjKGHpKahX3z351COcB5vupcsqD+
	rR4xJgzSjMTFfa+ok7WSpWWqB9Lk1Ios=
X-Gm-Gg: ASbGnctaz0MdrBGnhB4eDMPbvBSuTlanU8NVzqwIPG1mEmCKZJEUmrWo6KToOHvZfcv
	HgGGIrt5uKFmIYROXQUm+cTUN9jef6XGPwr+P71n3axtQUab872AoStqletNQDmQlyiyDL4hVPd
	hE9PJ20qjpRps5X84X/sveNi77cwRHZ8Qz+vjWOhyIkKdaPRmHJXP1+RK7on+yverDouh1FVvJc
	eS5+inuKwow3QnGhjyC/BBvmgkYyXpkOoIr7GBEqoXYgkPUUNrAsjIWpw59XiaqW9l0mGQ=
X-Google-Smtp-Source: AGHT+IEe0GpAAzIygQP0/bcVw0qXw0KKuiRZzxozS1nfBxWEjutLds5ZpHcPSx9aLMdWW0x6HUwXvskCnFTv6U/MSdc=
X-Received: by 2002:a53:c045:0:10b0:63f:beb2:951b with SMTP id
 956f58d0204a3-6444e7a784amr5058197d50.42.1765200768679; Mon, 08 Dec 2025
 05:32:48 -0800 (PST)
MIME-Version: 1.0
References: <20251205160942.46694-1-frediano.ziglio@citrix.com>
 <20251205160942.46694-2-frediano.ziglio@citrix.com> <3d8f0224-de48-40cc-8341-1cc4aab1b9a4@suse.com>
In-Reply-To: <3d8f0224-de48-40cc-8341-1cc4aab1b9a4@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 8 Dec 2025 13:32:37 +0000
X-Gm-Features: AQt7F2oIB2Xir0g4sGSuVj89j8R4nh51RaWeYpHvZZUsWVy8YT58CcUp0ay3td4
Message-ID: <CAHt6W4egs5JbrcDyFZ8bpbJy=mfeY4nGoru=aOtigfCoSBEooQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] Do not attempt to workaround older binutils
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Frediano Ziglio <frediano.ziglio@cloud.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Dec 2025 at 08:24, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 05.12.2025 17:09, Frediano Ziglio wrote:
> > From: Frediano Ziglio <frediano.ziglio@cloud.com>
> >
> > Older binutils versions do not handle correctly PE files.
> > It looks like they could work if they don't produce debug information
> > but they mess the PE file in other way like putting invalid
> > flags in sections.
> > Also different tools will complain about the format (like
> > objdump and strip).
>
> As already alluded to in the reply to Andrew - the above doesn't make
> clear whether these binaries were in fact broken badly enough to be unusable.
> As indicated there, my experience was that they were nevertheless usable. In
> which case I don't think we should take such a measure.
>
> Jan

Hi,
  adding some more comments.

Frediano

