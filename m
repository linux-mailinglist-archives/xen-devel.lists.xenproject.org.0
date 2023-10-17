Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139377CC03C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 12:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618184.961531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsh17-00029v-27; Tue, 17 Oct 2023 10:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618184.961531; Tue, 17 Oct 2023 10:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsh16-00027D-Uu; Tue, 17 Oct 2023 10:09:36 +0000
Received: by outflank-mailman (input) for mailman id 618184;
 Tue, 17 Oct 2023 10:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbBI=F7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qsh15-000254-Rw
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 10:09:36 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4586b34d-6cd5-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 12:09:34 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53e2308198eso8554823a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Oct 2023 03:09:34 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a93-20020a509ee6000000b00536159c6c45sm933884edf.15.2023.10.17.03.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 03:09:33 -0700 (PDT)
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
X-Inumbo-ID: 4586b34d-6cd5-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697537374; x=1698142174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c6n+AA/9zNI5CwCGBPq7mnW8RW4i64r7WOiGfs97Dhk=;
        b=UGU8U8liYb0RKYd8MbNli3gqay7KNvtrYKYRYKuL1XfeX3HA0mm5Cxorc/zF8bXVSw
         r3Un9Dw79yDU0ueGAt85Tf7HGhtT9NRThzMtI4l8QtHSD9xci9AXZiNF4ujF7gAU3J5w
         iZ4RyNXA1giNOEViAXDh7RGLbCTcjt6bYhtt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697537374; x=1698142174;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6n+AA/9zNI5CwCGBPq7mnW8RW4i64r7WOiGfs97Dhk=;
        b=rouBbcgv3Za3PEoGK8vrBVM2fahJ5nqSMBMxmtLB9hE2PSfkozYK4qzGMIoMZ9mmf0
         7aFa5ohXFFrzghcCRYUlehqQLtUphbRwiVMhVZMMdUNIVBV2lOaSzV+vCNYH++NYMiO2
         U1V+1Z7r2WSmyDvlHYw3fMB5f4jy4R4SK0ps561uKSJy/nfz22SyM+HCw/QHwUVjVOBV
         h4yg7Ve9XEZ1LitE6IFA4YhNcb2smeYhlQDeJq1anFY4ATUix4W1SsXv/ne1TZBbUTd/
         MB1mNKP4/2hfigMeEdmeC25W20Oe5zdVPNUYphAWPW+iRzfltcRJlt6mzQUVnG2fEdu5
         1DzA==
X-Gm-Message-State: AOJu0YyOOCjhLwFQcwmh7DLdtmTeYb0rtGhjscvzGbvUSX4Xxl1515iF
	VyxPd/4gRh6pFKB+jSWJr4z6yA==
X-Google-Smtp-Source: AGHT+IHYVoNe4HyAl4nG2bkZVzyaJ4t4HlpcLSGr/mC4NlbRPDoSceZ1JfPCIPNg28/xJZsjjfLpww==
X-Received: by 2002:a50:8e5a:0:b0:53e:7781:2279 with SMTP id 26-20020a508e5a000000b0053e77812279mr1479939edx.36.1697537374148;
        Tue, 17 Oct 2023 03:09:34 -0700 (PDT)
Message-ID: <9de84dd4-a137-4dcc-be57-7be953145f8f@citrix.com>
Date: Tue, 17 Oct 2023 11:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.18] docs/sphinx: Lifecycle of a domid
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20231016162450.1286178-1-andrew.cooper3@citrix.com>
 <ef8ca952-fe3a-4180-857b-7f4dd09b8259@suse.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ef8ca952-fe3a-4180-857b-7f4dd09b8259@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/10/2023 6:24 am, Juergen Gross wrote:
> On 16.10.23 18:24, Andrew Cooper wrote:
>> +command to ``xenstored``.  This instructs ``xenstored`` to connect to
>> the
>> +guest's xenstore ring, and fire the ``@introduceDomain`` watch.  The
>> firing of
>> +this watch is the signal to all other components which care that a
>> new VM has
>> +appeared and is about to start running.
> 
> A note should be added that the control domain is introduced implicitly by
> xenstored, so no XS_INTRODUCE command is needed and no @introduceDomain
> watch is being sent for the control domain.

How does this work for a stub xenstored?  It can't know that dom0 is
alive, and is the control domain, and mustn't assume that this is true.

I admit that I've been a bit vague in the areas where I think there are
pre-existing bugs.  This is one area.

I'm planning a separate document on "how to connect to xenstore" seeing
as it is buggy in multiple ways in Linux (causing a deadlock on boot
with a stub xenstored), and made worse by dom0less creating memory
corruption from a 3rd entity into the xenstored<->kernel comms channel.

(And as I've said multiple times already, shuffling code in one of the
two xenstored's doesn't fix the root of the dom0less bug.  It simply
shuffles it around for someone else to trip over.)

> All components interested in the @introduceDomain watch have to find out for
> themselves which new domain has appeared, as the watch event doesn't contain
> the domid of the new domain.

Yes, but we're intending to change that, and it is diverting focus from
the domain's lifecycle.

I suppose I could put in a footnote discussing the single-bit-ness of
the three signals.

>> +ceased to exist.  It fires the ``@releaseDomain`` watch a second time to
>> +signal to any components which care that the domain has gone away.
>> +
>> +E.g. The second ``@releaseDomain`` is commonly used by paravirtual
>> driver
>> +backends to shut themselves down.
> 
> There is no guarantee that @releaseDomain will always be fired twice for a
> domain ceasing to exist,

Are you sure?

Because the toolstack needs to listen to @releaseDomain in order to
start cleanup, there will be two distinct @releaseDomain's for an
individual domain.

But an individual @releaseDomain can be relevant for a state change in
more than one domain, so there are not necessary 2*nr_doms worth of
@releaseDomain's fired.

> and multiple domains disappearing might result in
> only one @releaseDomain watch being fired. This means that any component
> receiving this watch event have not only to find out the domid(s) of the
> domains changing state, but whether they have been shutting down only, or
> are completely gone, too.

All entities holding a reference on the domain will block the second
notification until they have performed their own unmap action.

But for entities which don't hold a reference on the domain, there is a
race condition where it's @releaseDomain notification is delivered
sufficiently late that the domid has already disappeared.

It's certainly good coding practice to cope with the domain disappearing
entirely underfoot, but entities without held references don't watch
@releaseDomain in the first place, so I don't think this case occurs in
practice.

~Andrew

