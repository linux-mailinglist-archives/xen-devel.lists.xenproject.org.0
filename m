Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE8087FD65
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 13:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695349.1085011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmYKQ-0003TE-JK; Tue, 19 Mar 2024 12:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695349.1085011; Tue, 19 Mar 2024 12:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmYKQ-0003Ql-G0; Tue, 19 Mar 2024 12:12:26 +0000
Received: by outflank-mailman (input) for mailman id 695349;
 Tue, 19 Mar 2024 12:12:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEhX=KZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmYKP-0003Qd-2l
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 12:12:25 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f131974e-e5e9-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 13:12:23 +0100 (CET)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-789db18e169so410433785a.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 05:12:23 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 c14-20020a37e10e000000b007883a49baeesm5393735qkm.4.2024.03.19.05.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 05:12:22 -0700 (PDT)
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
X-Inumbo-ID: f131974e-e5e9-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710850343; x=1711455143; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gQt0odOmvw5H6hpmT06UGP+RKK8QTRgUqYE6UvCuvfw=;
        b=X2xNKT3g8UkGnySnbq2iQ481af/9VyrLEeeJq+W/iXtcUKisjhGvItjOFqWiWbrchE
         6mQlyNNsq4z2EkY26t04HiFAXLU5CAcNDlI9I3o9Op4Gln3HVCZahk4Pqu1uv9iUH6DR
         j4gFhmGwqWbqmtc4evLD0rF9kD9GXTTDZa91M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710850343; x=1711455143;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQt0odOmvw5H6hpmT06UGP+RKK8QTRgUqYE6UvCuvfw=;
        b=JIb2bvEmof6fks4SwpCw6xjWApPGW5/m6PKEN/pM82fc4lSDVNGSvolqKVRGBMsf5z
         uqi6xOeoR7tvDsuxSVtV4WTim68MtvwANXJpHVJ+JD5o+rMJpLFAaH2dwV6sxj48EEWh
         pvBZIKWfvS2gzlePEjBuMNcgQspajvcSdhrfFrK8XOsnu7o6uFAZffMtUK0UzDu2yHVD
         DHuIw9RLSPiA3Sz/5eMYNCKbwpDdF4WfewQqqLz3tLhhGP+fFvuoRQFDGaJCvRmHSZU1
         eBe0kdeo7zKbguyhiBCYLlvYfIx5dqP9FFlBH5c9FvaXD1ule8YpubtX46wK0Wo+8Qas
         uVPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs8V3mFb93rqqRPm7wHNCFb70KcvAGiMW2pic4QgqUiF+5opayhEjiIkoIo2LeCt1dMdnKSjTVZNXaTb52UC7b3VXjBHpegCrdgCB+1wk=
X-Gm-Message-State: AOJu0YxqK+uOCl6v1ETiE6U1SnPgQilvNl6PxIsWSi6xmBdF9P8kIGaD
	AdxY5AoW1hPV8kvXBpJ/yXvsLW3EYGJgZQ0ntg6vJyw3ZkjKoN25wloU8EJaRvUIbOoCzkIJisK
	U
X-Google-Smtp-Source: AGHT+IHujs1BIDKf3HnuE/+uXlGopEJkkf1KUyI/0UKnM59OyfByEdnWC59U0Xr2iWMQqy+fEMEi9Q==
X-Received: by 2002:a05:620a:2408:b0:788:2b2f:4d74 with SMTP id d8-20020a05620a240800b007882b2f4d74mr20664050qkn.18.1710850342651;
        Tue, 19 Mar 2024 05:12:22 -0700 (PDT)
Date: Tue, 19 Mar 2024 13:12:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>, grub-devel@gnu.org
Subject: Re: [PATCH 1/7] multiboot2: Add load type header and support for the
 PE binary type
Message-ID: <ZfmBJKJVXcTBzgDr@macbook>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
 <20240313150748.791236-2-ross.lagerwall@citrix.com>
 <c6e79962-0537-4ed8-b99f-f2614f5a7987@suse.com>
 <CAG7k0Ep6fDfjKXj-iwuGh=pF_BS-1EaT9kRm1xJTZ=bmt=3+rA@mail.gmail.com>
 <d2be3727-3a94-408f-a751-e91792c9d15c@suse.com>
 <CAG7k0EoHs7WZrgL4ixZWvfc1VUv40pQe=qt8WTLMdQhBv54ngA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7k0EoHs7WZrgL4ixZWvfc1VUv40pQe=qt8WTLMdQhBv54ngA@mail.gmail.com>

On Thu, Mar 14, 2024 at 02:24:31PM +0000, Ross Lagerwall wrote:
> On Thu, Mar 14, 2024 at 1:37 PM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 14.03.2024 10:30, Ross Lagerwall wrote:
> > > On Thu, Mar 14, 2024 at 7:24 AM Jan Beulich <jbeulich@suse.com> wrote:
> > >>
> > >> On 13.03.2024 16:07, Ross Lagerwall wrote:
> > >>> In addition to the existing address and ELF load types, specify a new
> > >>> optional PE binary load type. This new type is a useful addition since
> > >>> PE binaries can be signed and verified (i.e. used with Secure Boot).
> > >>
> > >> And the consideration to have ELF signable (by whatever extension to
> > >> the ELF spec) went nowhere?
> > >>
> > >
> > > I'm not sure if you're referring to some ongoing work to create signable
> > > ELFs that I'm not aware of.
> >
> > Something must have been invented already to make Linux modules signable.
> 
> Linux module signatures operate outside of the ELF container. In fact,
> AFAIK the actual signed content could be anything. The file format is:
> 
> * Content (i.e. ELF binary)
> * Signature of content in PKCS7 format
> * Signature info, including signature length
> * Magic marker: "~Module signature appended~\n"
> 
> This kind of arrangement does indeed work but it is fragile. Since the
> signature is on the entire contents and tools that understand ELF don't
> parse the signature, any transformation of the binary (e.g. to
> strip out debuginfo) will cause the signature to be lost / invalidated.
> 
> Nevertheless, this could still be an option for Xen if this is
> deemed to be a preferred solution by others. It would be good to hear
> some opinions on this.

No, IMO the PE route is likely the best one, as there's already all
the tooling around it, and it's what other OSes use to perform secure
boot.

It would have been nice for ELF to grow an extension to the spec for
image integrity data, but I don't see myself doing the work TBH.

Thanks, Roger.

