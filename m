Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00379690CF8
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:30:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492606.762229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8s0-00075b-PF; Thu, 09 Feb 2023 15:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492606.762229; Thu, 09 Feb 2023 15:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8s0-00073u-M7; Thu, 09 Feb 2023 15:29:56 +0000
Received: by outflank-mailman (input) for mailman id 492606;
 Thu, 09 Feb 2023 15:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XqTS=6F=tibco.com=etorok@srs-se1.protection.inumbo.net>)
 id 1pQ8rz-00073k-Eb
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:29:55 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 994df588-a88e-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 16:29:53 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so4154367wma.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 07:29:53 -0800 (PST)
Received: from smtpclient.apple (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s12-20020a05600c45cc00b003dfe5190376sm2365624wmo.35.2023.02.09.07.29.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Feb 2023 07:29:52 -0800 (PST)
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
X-Inumbo-ID: 994df588-a88e-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVDe833MzmSGDZZpxWGzdw93FcDtlMCnEHb70rs7kjo=;
        b=TLpvSbGsAB8/hXRb6Px4uVKWwY1DnBIq/+mhdOJSoamwGznLgLruASrNR42OQ5bYDp
         s0c+BoHt9j24lPaMdu2T3SxvDFFI2XdydK8+71XDv2fliugM4gfQ0MPA+hIQMvAzHRSo
         v1IYG/e3WsXDT7QLrrILv4osam5FkTe5Bc4DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVDe833MzmSGDZZpxWGzdw93FcDtlMCnEHb70rs7kjo=;
        b=BD0gC0igu2BUBMHYScEeG3Hx4z3eDqWT5LZxDXn8AHlMRT4gp5JHvM4HE3HyRVp4eK
         zmnQExEIVuWP1Fj4g74avy6bCYU8X8QzBVNLx1X12gNZVj1WJsMDSO6ztHP/WH46EhYj
         pYLna6xVo9doU4WbgwR3myPhxtPp5LWDIHnl90yHYrCokb2CRQHH3eviNqQ5JUvzs4HH
         eM2iIkVcinyyq08DGBXHSiWSidI3L569mt/luGqOBncYuWnIQn6J9HtSn/hk3W1jFDvG
         PO5JuXq1G9QR7KtpunpENyus6c0cPUxKnCnf3k3KUI/RXyAA+XrK6Z6ghAUHhOg5Fx6K
         k1AQ==
X-Gm-Message-State: AO0yUKVdgvG/DwNhPCGWyrrYbk+LnD/LcoH4ax1dUPhpXQ78ura5oeZb
	A3nRTjb0wjEHLO4ifY4C+Zairg==
X-Google-Smtp-Source: AK7set+cOS2bND4YP5mM4tsTtnNDbzKmGb9eXE0GXc1R+lrPjk/22flEz9qvLy+NkOYA7AgzPP0vNQ==
X-Received: by 2002:a05:600c:43c4:b0:3dc:5302:ad9 with SMTP id f4-20020a05600c43c400b003dc53020ad9mr13541350wmn.27.1675956592515;
        Thu, 09 Feb 2023 07:29:52 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH] docs: clarify xenstore permission documentation
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <201204d9-038b-9edf-8132-fa697ab36175@citrix.com>
Date: Thu, 9 Feb 2023 15:29:40 +0000
Cc: Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 Edwin Torok <edvin.torok@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A8BEBA1E-A9B3-49D2-8EB7-5F17BA84D1D6@cloud.com>
References: <20230209144148.4132-1-jgross@suse.com>
 <201204d9-038b-9edf-8132-fa697ab36175@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)



> On 9 Feb 2023, at 15:15, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> On 09/02/2023 2:41 pm, Juergen Gross wrote:
>> In docs/misc/xenstore.txt the description of the Xenstore node access
>> permissions is missing one important aspect, which can be found only
>> in the code or in the wiki [1]:
>>=20
>> The first permission entry is defining the owner of the node via the
>> domid, and the access rights for all domains NOT having a dedicated
>> permission entry.
>>=20
>> Make that aspect clear in the official documentation.
>>=20
>> [1]: https://wiki.xenproject.org/wiki/XenBus#Permissions
>>=20
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> I feel as if Edvin deserves some kind of credit here, seeing as it was
> his observation...
>=20
> Also, CC to double check the wording.
>=20
> ~Andrew
>=20
>> ---
>> docs/misc/xenstore.txt | 17 ++++++++++-------
>> 1 file changed, 10 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
>> index 8887e7df88..d807ef0709 100644
>> --- a/docs/misc/xenstore.txt
>> +++ b/docs/misc/xenstore.txt
>> @@ -45,13 +45,16 @@ them to within 2048 bytes.  (See =
XENSTORE_*_PATH_MAX in xs_wire.h.)
>>=20
>> Each node has one or multiple permission entries.  Permissions are
>> granted by domain-id, the first permission entry of each node =
specifies
>> -the owner of the node.  Permissions of a node can be changed by the
>> -owner of the node, the owner can only be modified by the control
>> -domain (usually domain id 0).  The owner always has the right to =
read
>> -and write the node, while other permissions can be setup to allow
>> -read and/or write access.  When a domain is being removed from =
Xenstore
>> -nodes owned by that domain will be removed together with all of =
those
>> -nodes' children.
>> +the owner of the node, who always has full access to the node (read =
and
>> +write permission).

>>  The access rights of the first entry specify the
>> +allowed access for all domains not having a dedicated permission =
entry
>> +(the default is "n", removing access for all domains not explicitly
>> +added via additional permission entries).  Permissions of a node can =
be
>> +changed by the owner of the node, the owner can only be modified by =
the
>> +control domain (usually domain id 0).

This looks good in general, one small nitpick, maybe we need something =
like this too:
", or domains equivalent to the owner or control domain (domain =
equivalence can be established with the privileged SET_TARGET =
operation)"

Thanks,
--Edwin

>>  Other permissions can be setup to
>> +allow read and/or write access for other domains.  When a domain is
>> +being removed from Xenstore nodes owned by that domain will be =
removed
>> +together with all of those nodes' children.
>>=20
>>=20
>> Communication with xenstore is via either sockets, or event channel
>=20


