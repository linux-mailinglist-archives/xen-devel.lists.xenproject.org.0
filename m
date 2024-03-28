Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2237F89027B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:00:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698942.1091200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprDi-0005V0-N5; Thu, 28 Mar 2024 14:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698942.1091200; Thu, 28 Mar 2024 14:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprDi-0005Rs-JW; Thu, 28 Mar 2024 14:59:10 +0000
Received: by outflank-mailman (input) for mailman id 698942;
 Thu, 28 Mar 2024 14:59:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyVg=LC=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rprDh-0005Rm-ID
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 14:59:09 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8183151-ed13-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 15:59:05 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1e00d1e13acso7838955ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 07:59:05 -0700 (PDT)
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
X-Inumbo-ID: b8183151-ed13-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711637944; x=1712242744; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/IW0LQiZfxjf4sT101EkPYTcYm9obKSnyKLDKEZzO8=;
        b=G9eOkciILbBoCTkx13KHRG94OoajEhePw4ctN9Vz9IWKwVh5m+HR/icH6UX7riYWAn
         yidZbBKPq3SqhcbhWgLeHdct1VjKRwZjgjHUCuERVktQWSes7gmvqlqhlqhOFN0brVRI
         bFlIZq/rP4L8tX7rUlCFkNf+sRBYsD6sDc76c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711637944; x=1712242744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/IW0LQiZfxjf4sT101EkPYTcYm9obKSnyKLDKEZzO8=;
        b=cphRtevNQJ/ZLMevljy5LmERsAYaLJdDREAENlVLADJnYtzlP1XgO/HewSTUwsiumz
         TWPbX7DPwhdW68hK3ACIjUU/RCYvaCEEmxLZkFb148hFBNSwkkRO0/aIEzxO2SDleq/6
         /fpi1lz1xHd6JKzmV1AddyHwhTM2O26GjhDWZKxQWjNoyczbpe0vWCD+9R4DLWgPlMCf
         alvDFlDhawxt7by9x3Ii80kFT9KwOG7iFw+PQZUvgNWxPYXCtEV2PfD1KiIWNKvO4fQl
         aQaZHJai0ewvLykowJ+dWUWT56iLWWNYR4/DwTRwb5Q/IRwgCPj281xQ1vnbBYDaNMBE
         u9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWWK8EXlCf5wKFsDMu1IpZV5G2o1sUn9v+9YkMLQNsAUuzuhOuTcEM4NBm/EIZDCsRDtYJe0ghENlnEBCctJfGzFwtdBq3BvMNTqKeFcHQ=
X-Gm-Message-State: AOJu0Yy1YctlyYwyvpHeQgsoDXq0yZyI01CP8Qgih8Q3vIfEPEl1r58+
	wEbFqaqyZWWAuonTLJuYaYlN42LOxPlQzibG4KXbEHiJZK+rLLoK4ShspbDCMN0irmbjzgGbYk8
	gFysSO7NQF8U+UgAi5pbv5+DJzAO3b+YcmiWA
X-Google-Smtp-Source: AGHT+IEJ6ndaNUOER4Bv0HLkvnP9DfaVgnvpn4S/wsFTnXs9e52eCFILA+X3h5WHn8RvvsD2k2PHJiP/FrnsiyhtFqM=
X-Received: by 2002:a17:902:d48d:b0:1e0:e2a4:1b1b with SMTP id
 c13-20020a170902d48d00b001e0e2a41b1bmr3561877plg.0.1711637943773; Thu, 28 Mar
 2024 07:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
 <20240313150748.791236-4-ross.lagerwall@citrix.com> <CAEaD8JPr_Mxi5pKUV+Ybpx+H8c7G=j+D4g3FQcc8n9yiydk19Q@mail.gmail.com>
In-Reply-To: <CAEaD8JPr_Mxi5pKUV+Ybpx+H8c7G=j+D4g3FQcc8n9yiydk19Q@mail.gmail.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 28 Mar 2024 14:58:52 +0000
Message-ID: <CAG7k0Eq9ggCziG5A1psosZPuY4SoYoSUuUx7peg4CAt_B+3UPw@mail.gmail.com>
Subject: Re: [PATCH 3/7] multiboot2: Add support for the load type header tag
To: "Vladimir 'phcoder' Serbinenko" <phcoder@gmail.com>
Cc: The development of GNU GRUB <grub-devel@gnu.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 7:31=E2=80=AFAM Vladimir 'phcoder' Serbinenko
<phcoder@gmail.com> wrote:
>
> Not a full review. Just one blocking problem
>
>>
>>
>>      }
>> +  case MULTIBOOT_LOAD_TYPE_PE:
>> +      grub_fatal ("Unsupported load type: %u\n", mld.load_type);
>> +  default:
>> +    /* should be impossible */
>> +    grub_fatal ("Unknown load type: %u\n", mld.load_type);
>
> Don't use grub_fatal for this. grub_fatal is only when continue to execut=
e grub is unwise. Here you just have an unsupported file. This is definitel=
y a GRUB_ERR_BAD_OS
>

Noted... I'll fix that.

Thanks,
Ross

