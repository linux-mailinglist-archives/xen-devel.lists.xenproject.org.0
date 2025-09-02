Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 745CFB40A59
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 18:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107054.1457609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utTfI-0002fG-Ie; Tue, 02 Sep 2025 16:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107054.1457609; Tue, 02 Sep 2025 16:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utTfI-0002d0-G0; Tue, 02 Sep 2025 16:15:24 +0000
Received: by outflank-mailman (input) for mailman id 1107054;
 Tue, 02 Sep 2025 16:15:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4ch=3N=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1utTfG-0002cu-TV
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 16:15:22 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 038d166a-8818-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 18:15:17 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3dae49b1293so559977f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 09:15:17 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b98e77231sm31748715e9.12.2025.09.02.09.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 09:15:15 -0700 (PDT)
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
X-Inumbo-ID: 038d166a-8818-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756829716; x=1757434516; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8rpCTPTFw8X4eh6zkPAZWJ5LiQbfBpH/0A49TUy6YBA=;
        b=Unoa3NgAoYEw/xNE6OEPKhve9TBsp676LEg+t8DqLDgwoch0Rnrl1ZRk9NAK6H9mIc
         mxpUXaXPu6thu8QXUfoqwso/s+LmYDIBsIwmuTJ3YzO1wQOsuhxggjXGslZnH/OnzzfR
         7JJYQzHYmU6PwD6A1xd9f6qxPY/j8Fhf65Uzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829716; x=1757434516;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rpCTPTFw8X4eh6zkPAZWJ5LiQbfBpH/0A49TUy6YBA=;
        b=p2wfLpsb9npILYNYZsppDCMHl3skGld3uosL2M/PkGDwVWocSXbAZDKsTCSs6h1TPm
         xQC+ZlvMn+VaC3AJS4GqGZRGNrWX7iF0VW7Y5PslhmjWmsNtE1Fr3zcbeBx3qqaa+xlH
         fE7xBroV288NbsFptX2Pxgu0zgjIR5tvRl8eOaYSc0FZcOIb1SoFhWKtCpa295EWpeyF
         0WO8IfFUhOhdG1L70xFjSuFJGM1i03LANFPsj8ef14d5N5M6PWwSxAgju0N1wJF1YJ2X
         V9Y4KBqLSbaVi/+IyE1IqrsVWHGsSldvh9mkL0CFZOTpYEdjCXT88oV0fHAqoK7lNb4+
         XLOA==
X-Forwarded-Encrypted: i=1; AJvYcCWZZe0W8UVcIon6vjPfVBGPm+GpM3xzz7R6W1Myp7h8xV92HnbFq2g1JzTYcELm++Nrx+vePvbpWHc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXJsVYSFqrdv7mcLW7236NPVK05Wt+Eknra7oaUPK0MR2As7pR
	EWvTVlZn0g/X8qqb3ZjLt26IhDwmxueSoAsrFL/vv8GQftpE7wZObkwobAq5DodarjWY5RjIKsN
	GEqup
X-Gm-Gg: ASbGncs3VMWIF+k2EcV8yRjYsSCSipfWprcx8oBO3voCQ/T6MsqvxOe+bRaC9QurXNB
	qI0toWWjH2ZDGy5SmWLotmJ2an4X1ZMjXqHgFkTGde6h2XNZfxTQQnTuWQQvOhi2rBhjVEVO9Hc
	OmsGOF28DD0E8XPXCb98nCxaXYDimrrcTutlCb6qBNyFhIdK328+pdqCi+NGt8PIoHD1SyQox3M
	SUcdTFVpGQ7Nd/53VYpw0u1oRZRf4rqRXBO4sUEcwh2V/3FgKqsD5GpLyuBmISXOlQCoS0pQZpV
	AGZKDkkDWU2nEjFqHTO5B+XYnDigPWpt7CIMsiT5Cw7yFmF6o+C7RrC1237jvRowQjbjWbm72Ox
	h5s0KRwq7r+7R4Pj1NHtGBpKzLH0UOS07i6+0h15zYaKtysK0GfJYpbVmpuX5Sf5S5vzM
X-Google-Smtp-Source: AGHT+IE/AyVSkKsjhPXo2LgmBpxtIFIwbOo5KWGKKcl8U81GcYp6/IDMatSE7EsGOFQx/bYuImj0rg==
X-Received: by 2002:a05:6000:22ca:b0:3d0:64c1:1a40 with SMTP id ffacd0b85a97d-3d1e01d67bemr10175487f8f.46.1756829716216;
        Tue, 02 Sep 2025 09:15:16 -0700 (PDT)
Message-ID: <f0ac2189-c117-4ce5-9a1f-174df898eefb@citrix.com>
Date: Tue, 2 Sep 2025 17:15:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] releases: use newer compression methods for tarballs
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <b07e8b46-06b1-4f41-958a-d8739778c50e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b07e8b46-06b1-4f41-958a-d8739778c50e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/08/2025 2:54 pm, Jan Beulich wrote:
> Other projects have long switched to xz and/or lzip.
>
> Tidy things some as well: With the removal of qemu from the tarball,
> intermediately extracting the tarball again has become wasteful. Drop
> that. Invoke compressors using asynchronous lists, to reduce overall
> latency. Drop the -v option from the (previously implicit) gzip
> invocation.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Don't expand intermediate uncompressed tarball. Don't check for
>     commands' availablity. Don't request statistics. Use async lists.
>
> --- a/docs/process/release-technician-checklist.txt
> +++ b/docs/process/release-technician-checklist.txt
> @@ -119,7 +119,7 @@ RELEASE TARBALL
>         make src-tarball           # uses git-describe (best for RCs)
>          # ^find some way to add git-cache-proxy to this (done in ~iwj/.gitconfig)
>         mkdir /volatile/iwj/website-thing/xen.org/oss-xen/release/$v
> -       mv dist/xen-$v.tar.gz /volatile/iwj/website-thing/xen.org/oss-xen/release/$v/.
> +       mv dist/xen-$v.tar.[glx]z /volatile/iwj/website-thing/xen.org/oss-xen/release/$v/.
>  
>         # website-thing/xen.org is cvs -d mail.xenproject.org:/home/downloads-cvs/cvs-repos co xen.org
>  	cd /volatile/iwj/website-thing/xen.org
> @@ -139,9 +139,12 @@ RELEASE TARBALL
>  	cvs add -kb oss-xen/release/$v/
>  
>          cd oss-xen/release/$v
> -        gpg --digest-algo=SHA256 --detach-sign -u 'xen tree' xen-$v.tar.gz
> -	cvs add -kb xen-$v.tar.gz
> -        cvs add -kb xen-$v.tar.gz.sig
> +        for t in xen-$v.tar.[glx]z
> +        do
> +            gpg --digest-algo=SHA256 --detach-sign -u 'xen tree' $t
> +            cvs add -kb $t
> +            cvs add -kb $t.sig
> +        done
>          cd ../../..
>  
>  	cvs ci -m $v
> @@ -152,6 +155,10 @@ RELEASE TARBALL
>  	# should show something like
>  	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.gz
>  	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.gz.sig
> +	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.lz
> +	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.lz.sig
> +	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.xz
> +	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.xz.sig
>  
>  After a .0 release, update XEN_EXTRAVERSION again (to .1-pre, see above).
>  
> --- a/docs/process/xen-release-management.pandoc
> +++ b/docs/process/xen-release-management.pandoc
> @@ -274,10 +274,10 @@ Xen X.Y rcZ is tagged. You can check tha
>  https://xenbits.xen.org/git-http/xen.git X.Y.0-rcZ
>  
>  For your convenience there is also a tarball at:
> -https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.gz
> +https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.[glx]z
>  
>  And the signature is at:
> -https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.gz.sig
> +https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.[glx]z.sig
>  
>  Please send bug reports and test reports to xen-devel@lists.xenproject.org.
>  When sending bug reports, please CC relevant maintainers and me
> --- a/tools/misc/mktarball
> +++ b/tools/misc/mktarball
> @@ -5,14 +5,6 @@
>  # Takes 2 arguments, the path to the dist directory and the version
>  set -ex
>  
> -function git_archive_into {
> -    mkdir -p "$2"
> -
> -    git --git-dir="$1"/.git \
> -	archive --format=tar HEAD | \
> -	tar Cxf "$2" -
> -}
> -
>  if [[ -z "$1" || -z "$2" ]] ; then
>    echo "usage: $0 path-to-XEN_ROOT xen-version"
>    exit 1
> @@ -21,14 +13,20 @@ fi
>  xen_root="$1"
>  desc="$2"
>  
> -tdir="$xen_root/dist/tmp.src-tarball"
> +tdir="$xen_root/dist"
>  
> -rm -rf $tdir
> +rm -f $tdir/xen-$desc.tar.[glx]z

This is asymmetric with the rm at the end.  I'd remove
$tdir/xen-$desc.tar* here and remove the final rm.

Looking at the uncompressed tarball is part of my process, and it was
preserved previously.

With something along these lines, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

>  
>  mkdir -p $tdir
>  
> -git_archive_into $xen_root $tdir/xen-$desc
> +git --git-dir="$xen_root/.git" archive --format=tar HEAD --prefix=xen-$desc/ \
> +    >"$tdir/xen-$desc.tar"
> +
> +gzip -9k "$tdir/xen-$desc.tar" &
> +xz -9k "$tdir/xen-$desc.tar" &
> +lzip -9k "$tdir/xen-$desc.tar" &
> +wait

Interestingly, this wasn't fatal for not having lzip, but the error was
clear on the console given the reduced verbosity, and doing 3 at the
same time worked very nicely.

>  
> -GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc
> +rm -f $tdir/xen-$desc.tar
>  
> -echo "Source tarball in $xen_root/dist/xen-$desc.tar.gz"
> +echo "Source tarball in" $tdir/xen-$desc.tar.[glx]z

This was grammatically awkward to begin with, but is now pretty useless,
especially combined with the set -x so it gets printed twice.

Something like this:

echo "Source tarballs:"
ls -lah $tdir/xen-$desc.tar*

generates:

-rw-rw-r-- 1 andrew andrew  32M Sep  2 17:13 /home/andrew/xen.git/dist/xen-4.21-unstable.tar
-rw-rw-r-- 1 andrew andrew 6.8M Sep  2 17:13 /home/andrew/xen.git/dist/xen-4.21-unstable.tar.gz
-rw-rw-r-- 1 andrew andrew 4.7M Sep  2 17:13 /home/andrew/xen.git/dist/xen-4.21-unstable.tar.lz
-rw-rw-r-- 1 andrew andrew 4.7M Sep  2 17:13 /home/andrew/xen.git/dist/xen-4.21-unstable.tar.xz


on my system and is rather more useful IMO.

~Andrew

