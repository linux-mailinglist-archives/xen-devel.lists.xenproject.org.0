Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544351F369D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 11:09:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiaFh-0007bS-Cx; Tue, 09 Jun 2020 09:09:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kazQ=7W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiaFg-0007bN-FP
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 09:09:00 +0000
X-Inumbo-ID: dad5e14c-aa30-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dad5e14c-aa30-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 09:08:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c3so20360682wru.12
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 02:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=e87qbX8taTu/TmxWOZZTUTjhubAMWOgGXPqyXIjZre0=;
 b=Szl5DFLCV0wa7N1KmocMXcuVbyDZ96YoyMV4oGP4FbmyxZVP72SwbgIxv+pG2Tq9F8
 TV+49/UIjbQtYpON2Qcns8xASS3Zwt8rVUzgoYfdl372j3tFusESBVfn5VqxI5Pdvw7I
 o4O1myzM23i+QCS3I0nqWxGnP2nCW7HSZ2nPIwKfyvKFDdjxHX+pWiegGJDrM3VvJps8
 lbmQlOr5QH+v8iXFBKRX8KKKA6t3NoGL87fPeKbqf15e1IW7/j4yhcLgSyeUyRRpczC9
 kQHKRTbC3WvteuZ8MQGAIaKTVFvB+9xY9nF5/VLlioLgkMZAyUXkAsbT8TTlJ1PBbiDm
 Z/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=e87qbX8taTu/TmxWOZZTUTjhubAMWOgGXPqyXIjZre0=;
 b=aL0R7TwrnvpTF9x6TEKVRKlWACSemBVELBQgqCok7EmD5JvZpBiML8N93L/V+d16KH
 ahqT40n8BtFiXw8oXIGuEi91cghhpnztJnxvyRojRxXu1iE73wqu5msTU6D/T36HMz+W
 htukbRW6rPXGM7wBmlxKxO658gwYyaypiX07HhLdRjan8k/606eMOGx4/RlNWllJZtUv
 GMymaz3E1Doa5Vmv2RffzhOo2cUj06b13MHFiN4I/7MBLQgbaytRTr7r7jQz5I/XHMFY
 4SNVKnyptRs9Zs+5W2ydgO58HvaeWx9orhhQZtvcQcMX0XTnyR28ZnKXsuND9UgWsPA0
 w9mQ==
X-Gm-Message-State: AOAM533I+ciOdqB/IS6hVZkldT4sUOCGAIBF7evUpS5wWK2BozIMOtE2
 03+1T5PMb82fP+SB64EkKdBDQjM/+co=
X-Google-Smtp-Source: ABdhPJzE1wIbGcSCkqzYyWl32XvYIdYYc4BXaKKH7g+kVPVNfc7YCwPhwBFFewvnfD4n0cLIm4977w==
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr3220723wrx.214.1591693739219; 
 Tue, 09 Jun 2020 02:08:59 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id e15sm2351474wme.9.2020.06.09.02.08.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 02:08:58 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 "'Olaf Hering'" <olaf@aepfle.de>, "'Paul Durrant'" <xadimgnik@gmail.com>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609110016.16a52277.olaf@aepfle.de>
 <005f01d63e3c$fcf84fe0$f6e8efa0$@xen.org>
 <e8976262-4406-eaca-6381-0a8c017b4727@suse.com>
In-Reply-To: <e8976262-4406-eaca-6381-0a8c017b4727@suse.com>
Subject: RE: [PATCH v1] kdd: remove zero-length arrays
Date: Tue, 9 Jun 2020 10:08:57 +0100
Message-ID: <006301d63e3d$9c141fa0$d43c5ee0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIqIZk/Qusa7Qsu5bkjM27jAUAPHgHVoA+LAZtbwz4ChcRm7gE/+bE7p+6BznA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Tim Deegan' <tim@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 09 June 2020 10:06
> To: paul@xen.org; 'Olaf Hering' <olaf@aepfle.de>; 'Paul Durrant' =
<xadimgnik@gmail.com>
> Cc: xen-devel@lists.xenproject.org; 'Ian Jackson' =
<ian.jackson@eu.citrix.com>; 'Wei Liu' <wl@xen.org>;
> 'Tim Deegan' <tim@xen.org>
> Subject: Re: [PATCH v1] kdd: remove zero-length arrays
>=20
> On 09.06.20 11:04, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Olaf Hering <olaf@aepfle.de>
> >> Sent: 09 June 2020 10:00
> >> To: Paul Durrant <xadimgnik@gmail.com>
> >> Cc: paul@xen.org; xen-devel@lists.xenproject.org; 'Ian Jackson' =
<ian.jackson@eu.citrix.com>; 'Tim
> >> Deegan' <tim@xen.org>; 'Wei Liu' <wl@xen.org>
> >> Subject: Re: [PATCH v1] kdd: remove zero-length arrays
> >>
> >> Am Tue, 9 Jun 2020 09:55:52 +0100
> >> schrieb Paul Durrant <xadimgnik@gmail.com>:
> >>
> >>> Is it not sufficient to just change the declaration of payload in =
kdd_pkt from [0] to []?
> >>
> >> AFAIR this lead to compile errors.
> >>
> >
> > OOI which compiler (might be worth mentioning in the commit comment =
too, for reference)? I'm not
> seeing a problem.
>=20
> We don't use array[] in public headers, but AFAIK using them =
internally
> is fine.
>=20

Yeah, we have XEN_FLEX_ARRAY_DIM for public headers.

  Paul

>=20
> Juergen



