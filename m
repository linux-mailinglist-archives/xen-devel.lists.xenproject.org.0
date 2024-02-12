Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A31C85110D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 11:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679521.1056967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTgU-0002sw-6M; Mon, 12 Feb 2024 10:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679521.1056967; Mon, 12 Feb 2024 10:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZTgU-0002qD-3N; Mon, 12 Feb 2024 10:37:10 +0000
Received: by outflank-mailman (input) for mailman id 679521;
 Mon, 12 Feb 2024 10:37:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9jSY=JV=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rZTgS-0002q7-OZ
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 10:37:08 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab92ffc3-c992-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 11:37:07 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5116b017503so4096668e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 02:37:07 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c298400b0040fdc7f4fcdsm8240866wmd.4.2024.02.12.02.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 02:37:06 -0800 (PST)
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
X-Inumbo-ID: ab92ffc3-c992-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707734227; x=1708339027; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNeG2pIJ4FHUiCpE/SuqfX3/MiVauHYmdF0xmWZokYQ=;
        b=nSY7v9ixmTo2v+22hzbOmAbVRVDs29TUND+uYKEUBACTj/ur5FL6ITxq4lDOjdoI0T
         y8J4UfisWjO0NQke52RUVsBHI7dEk0iD7gvfuTVrxzT8pEZUZisCRAbITUkX7A2w63sX
         nAXr7KvXNasM+fpBNf21A+bJI9Vf8sDiMbTkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707734227; x=1708339027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNeG2pIJ4FHUiCpE/SuqfX3/MiVauHYmdF0xmWZokYQ=;
        b=HyxW+Dt627KHyAX7hexHRDwY3fYjEYt2SOLkSQZpZ/Yp2FsYSWWbtn/HFENXFEk41C
         keL7iVrCgS0C3NBLyPYa2xML9i5/oJuYSTR+KtQdx/4i+aHe75iOYEeSWyO27zlhW95X
         OfKmV/uQHPcWE3bjT8B6tcyg0yDi/QCNmyJiAm5cZH4vpwGMrHCmfQCtAz1Wi6kAmAHy
         KP0OEQvtS21cOSACOFGAAON2y4Q2u8Xi2+Gdh+9AU060jk7sh/jQEJoXNbOO7aSbXYLH
         ZJOxdseJ+5JYP7Sz6laV3/Smo0PmLfxQM6+X0uBDDMZrvE3GE/qXZOonWN1SalVhtT6n
         JhwQ==
X-Gm-Message-State: AOJu0Yz13zZRby1iUbZ8A8v2zVgoloClWotdVvCgX9/Pc3ceECib4dWJ
	h3+Q6QBfsWId08VKP2dzfgiM041wFaKGzINhZiI0SdC9GqMltec4C0Vf5XLzab4=
X-Google-Smtp-Source: AGHT+IGuil5j5HYCfxQUEtAulBqlU+/v7x1mcVJhJ9zcIduYoikBTsc38dlhHQuvabsBpvFbx2XXyg==
X-Received: by 2002:a05:6512:31d6:b0:511:51a2:e9c4 with SMTP id j22-20020a05651231d600b0051151a2e9c4mr5481039lfe.15.1707734227180;
        Mon, 12 Feb 2024 02:37:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrnCdYKWqscqZmyxTKeM2xjcGSBoicKRQgKOdfaJeO2PJ7Woj17Z7dVioF3V7DE1jC+ZQYdBzt0OKr
Date: Mon, 12 Feb 2024 10:37:06 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/4] hotplug: Update block-tap
Message-ID: <ea8cc573-bcb1-4f6e-b1d1-0e2e22476515@perard>
References: <20240201183024.145424-1-jandryuk@gmail.com>
 <20240201183024.145424-4-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201183024.145424-4-jandryuk@gmail.com>

On Thu, Feb 01, 2024 at 01:30:23PM -0500, Jason Andryuk wrote:
> Implement a sharing check like the regular block script.
> 
> Checking tapback inside block-tap is too late since it needs to be
> running to transition the backend to InitWait before block-tap is run.
> 
> tap-ctl check will be removed when the requirement for the blktap kernel
> driver is removed.  Remove it now as it is of limited use.
> 
> find_device() needs to be non-fatal allow a sharing check.
> 
> Only write physical-device-path because that is all that tapback needs.
> Also write_dev doesn't handled files and would incorrectly store
> physical-device as 0:0 which would confuse the minor inside tapback

Missing SOB.


Is `block-tap` still going to work with the example given in the script
header? That is:
    "script=block-tap,vdev=xvda,target=<type>:<file>"
Or maybe, that example is already broken?

> ---
> diff --git a/tools/hotplug/Linux/block-tap b/tools/hotplug/Linux/block-tap
> index 89247921b9..5eca09f0f6 100755
> --- a/tools/hotplug/Linux/block-tap
> +++ b/tools/hotplug/Linux/block-tap
> +count_using()
> +{
> +  local file="$1"
> +  local f
> +
> +  local i=0
> +  local base_path="$XENBUS_BASE_PATH/$XENBUS_TYPE"
> +  for dom in $(xenstore-list "$base_path")
> +  do
> +    for dev in $(xenstore-list "$base_path/$dom")

This function is probably missing "local dom dev".

> +    do
> +      f=$(xenstore_read_default "$base_path/$dom/$dev/params" "")
> +      f=$(echo "$f" | cut -d ":" -f 2)
> +
> +      if [ -n "$f" ] && [ "$file" = $f ] ; then
> +          i=$(( i + 1 ))
> +      fi
> +    done
> +  done
> +
> +  echo "$i"
> +}
> +

> +check_tap_sharing()
> +{
> +  local file="$1"
> +  local mode="$2"
> +  local dev
> +
> +  local base_path="$XENBUS_BASE_PATH/$XENBUS_TYPE"
> +  for dom in $(xenstore-list "$base_path") ; do

Should we add "local dom" to the function?

> +    for dev in $(xenstore-list "$base_path/$dom") ; do
> +      f=$(xenstore_read_default "$base_path/$dom/$dev/params" "")

Same here, maybe "local f" would be good to have too.

> @@ -89,15 +183,57 @@ find_device()
>  # the device
>  add()
>  {
> -    dev=$(tap-ctl create -a $target)
> -    write_dev $dev
> +    local minor
> +    local pid
> +    local res
> +
> +    claim_lock "block"
> +
> +    if find_device; then
> +        result=$( check_tap_sharing "$file" "$mode" )
> +        if [ "$result" != "ok" ] ; then
> +            do_ebusy "tap $type file $file in use " "$mode" "${result%% *}"
> +        fi
> +    else
> +        tap_create

The new function tap_create() is doing something similar to the replace
`tap-ctl create` call, right?


>  # Disconnects the device
>  remove()
>  {
> -    find_device
> -    do_or_die tap-ctl destroy -p ${pid} -m ${minor} > /dev/null
> +    local minor
> +    local pid
> +
> +    claim_lock "block"
> +
> +    if tap_shared ; then
> +        return
> +    fi
> +
> +    minor=$( xenstore_read "$XENBUS_PATH/minor" )
> +    pid=$( xenstore_read "$XENBUS_PATH/pid" )
> +
> +    [ -n "$minor" ] || fatal "minor missing"
> +    [ -n "$pid" ] || fatal "pid missing"
> +    do_or_die tap-ctl close -p "$pid" -m "$minor" > /dev/null
> +    do_or_die tap-ctl detach -p "$pid" -m "$minor" > /dev/null

Should we also call `tap-ctl free`, like `tap-ctl destroy` seems to do?

> +
> +    release_lock "block"
>  }
>  
>  command=$1

Thanks,

-- 
Anthony PERARD

