Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C474CA60DED
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 10:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914265.1320051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt1i5-0003P7-U0; Fri, 14 Mar 2025 09:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914265.1320051; Fri, 14 Mar 2025 09:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt1i5-0003NS-Qg; Fri, 14 Mar 2025 09:52:09 +0000
Received: by outflank-mailman (input) for mailman id 914265;
 Fri, 14 Mar 2025 09:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsSs=WB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tt1i4-0003NL-44
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 09:52:08 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcbc1aa1-00b9-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 10:52:05 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac2a089fbbdso350432866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 02:52:06 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aef5dsm201800666b.35.2025.03.14.02.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 02:52:05 -0700 (PDT)
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
X-Inumbo-ID: fcbc1aa1-00b9-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741945925; x=1742550725; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJW02GMZVGQontxjtShyt+sfWSZFEhj5sIu/AzHE6rw=;
        b=UrEL/zN+SKs3+aNrexykzl1XlhRRsA2F7pIs6BFI4pwZ+G+Tm04Oa0MQQOwRaU4Pqm
         IDXilV3DhR3hBNupq2de5mVy8JgAaOq5qaybJHiakIo5vaasRSukzNczDDECb6Kik3Gr
         RBwmCYXDZshfoV8D2N5E1d+gdcgjeA6DsMHGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741945925; x=1742550725;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nJW02GMZVGQontxjtShyt+sfWSZFEhj5sIu/AzHE6rw=;
        b=Je4+jW2DG3n7K53ZvuzlekJgU67uscDpWtcr7jpYj9INuZKlxa1NXyAtOjhVrHz5Wj
         c7x4EZj1QdNLGgUh/JdIhhshSWso2aThlOjdUWw7fRPjnRMuOg1E1U3hI5GAjfpSwdOP
         Y5PbKd7Dsi87La/hcoMAPQu0O9ldiE6AiH1YfNi030XKFF3fqGOyR0X8JRZ0AJHDMxMT
         hSRtXKO8AxA8eSLAuOw1JbBpaLjNzNye7k94EY0H5XCaqPqzJ3o/QTY961bpb7o+OIU4
         YWBBPO3AfTVEc7/Y5S3MxwgVIn3hGQO6lpdcZlW0tv2ZiSb6eVXRi5epHWF1oksIxU04
         T11w==
X-Forwarded-Encrypted: i=1; AJvYcCWSr9TzqzhL+ImuzuArqXDhOij5ASF1xxnfQVsI7vt2VvrIiW6TGF9EoBJYSLxHagp2mDRN+dBdyJE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHlfZX2uti3ArA3iF32Mt/g/45CXvCDuf4UxBaIW3SC33IbXJL
	Z0QcluqndjP0S2mIfs1Qz4iinTq27lYZDMcqGaAiyYhJ8w9Xl1aRiCqSoq/n8tI=
X-Gm-Gg: ASbGncvZxvEh0L5hG/agmHy/1o+WSw0m+3mLV2diRCpx+OoQdAhFXoezsUYMjhgk3QZ
	QgtaWN7K5+X8UoxW5bTRYdelye6OIVovEn8Q5g+vp+egktQ1vNl4Pv0Py5KKe7SJhg9fnheIDHu
	dAtzOIs152Q8eKjQgsnaCF8jI5MJOob4V2JsuewW4T/jNcgPSajSXuZWS8p60ixdMLzYyp1hl9O
	/zrJ2K/LrqB8t/FOjXS+o743WxafJDnm0OUcb63WxvyQG6d+dhtmc6OO4CgC5U8a2TGdJaLFnHy
	dpCZ2/cWFmv2P1xL/nkcitTnvLVvXqRgdTHLMxUvOQqRCOAGUyU=
X-Google-Smtp-Source: AGHT+IHfq8ItZY+Sp+P5C6WnfGpqm4YM3VP//GRjh4uGsC25dB3Yzt/7yPkqwlAC397goCIuUYXW+w==
X-Received: by 2002:a17:906:c147:b0:ac3:d1c:89ce with SMTP id a640c23a62f3a-ac3313056d6mr163412366b.9.1741945925482;
        Fri, 14 Mar 2025 02:52:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Mar 2025 09:51:55 +0000
Message-Id: <D8FWAI9SCVYQ.1MXWRT6VR9Z9W@cloud.com>
Cc: <ray.huang@amd.com>, "Stefano Stabellini" <stefano.stabellini@amd.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Sergiy Kibrik" <Sergiy_Kibrik@epam.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 01/19] xen: introduce CONFIG_SYSCTL
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>, "Penny Zheng" <Penny.Zheng@amd.com>
X-Mailer: aerc 0.18.2
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-2-Penny.Zheng@amd.com>
 <D8F334YWF1QL.1489MNJCLHXQ2@cloud.com>
 <1f394187-ffb6-4ddf-a6b4-e1f2384b5244@suse.com>
In-Reply-To: <1f394187-ffb6-4ddf-a6b4-e1f2384b5244@suse.com>

On Thu Mar 13, 2025 at 4:24 PM GMT, Jan Beulich wrote:
> On 13.03.2025 11:58, Alejandro Vallejo wrote:
> > Hi,
> >=20
> > On Wed Mar 12, 2025 at 4:06 AM GMT, Penny Zheng wrote:
> >> From: Stefano Stabellini <stefano.stabellini@amd.com>
> >>
> >=20
> > Commit message?
> >=20
> >> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> >> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> >> ---
> >>  xen/common/Kconfig | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> >> index 6166327f4d..72e1d7ea97 100644
> >> --- a/xen/common/Kconfig
> >> +++ b/xen/common/Kconfig
> >> @@ -519,6 +519,15 @@ config TRACEBUFFER
> >>  	  to be collected at run time for debugging or performance analysis.
> >>  	  Memory and execution overhead when not active is minimal.
> >> =20
> >> +menu "Supported hypercall interfaces"
> >> +	visible if EXPERT
> >=20
> > Any particular reason for placing it in the middle of the common menu a=
nd not
> > at the end?
> >=20
> >> +
> >> +config SYSCTL
> >> +	bool "Enable sysctl hypercall"
> >=20
> > meganit: Arguably "sysctl" is a hypercall group rather than a hypercall=
, so
> > "Enable sysctl hypercalls" sounds (subjectively) more appropriate.
>
> I disagree. I view it as one hypercall with many sub-ops.

One could make the same argument for sysctl and domctl being a single hyper=
call=20
with different ops.

Regardless, nit as it is, I don't think it matters much either way.

Cheers,
Alejandro

