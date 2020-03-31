Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF71995DC
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 13:55:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJFQF-0001YA-Hf; Tue, 31 Mar 2020 11:51:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7Z5r=5Q=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jJFQE-0001Y4-1G
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 11:51:10 +0000
X-Inumbo-ID: e8dc29f8-7345-11ea-9e09-bc764e2007e4
Received: from mail-ed1-x534.google.com (unknown [2a00:1450:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8dc29f8-7345-11ea-9e09-bc764e2007e4;
 Tue, 31 Mar 2020 11:51:09 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id o1so6514461edv.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2020 04:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=6aChU1mHcbmij6d11rLXZJtE3FiC8C1NKX1ujzg/298=;
 b=mIr8PWOgS6BH4GateuN53Z9/ZrgVhz0iH5E+S+PLdBNrrwKlbwBThNTbcpCzTKCY5O
 a5dMuIZSfrFs5pN9P4tHvA7RIjmWi+8ufZrInHb3h5ScAtShAATI/HObTmDGCSsCiFVJ
 Oi2WkKya9nwWMGcp8FzXDlLzsf8bnNQmWmGfsjxhB3QCtdZcTfZuUAJKxfChWoKzDoR5
 mtS53K6J4VG4ZTWp5yI6Pbx+LQkY+GvtKOUC8LBHACn8WOLfM62vIcW318L/OgEAxTem
 MPAtGmKQWQ2NJrCtL/FHH75acMZyEnXMPW3NsE8RnnXrpsJrdJd83G0QvI2KIkeQVBKi
 u2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=6aChU1mHcbmij6d11rLXZJtE3FiC8C1NKX1ujzg/298=;
 b=mxBgkW2TIpyWWLkCCeqpdWNfhg7l9cU9Sm9bGe3KhNK793b3RpQZaiEe+dx58JcOci
 9iZFF9xeR+qyl2DU4fceRX/NN1IhxcHMz9h/mvQlgnWuBNy/i7L4dDwEnnOc7fFkt8qw
 u51iqs/zaloJ0y7ARM2A1PwvG4AyW65k7JhYESSUEQ67ilELmX95eVC8VE0dKBrk+wC1
 y9b8/Y7P4q2x6QRfZskOIT9j/jsgyQr/c6Yovw4YG3tH71RQLKNKy9Ds+PlPG83MaAtr
 61G6FtDS0m0dVWB87LLun7BD0Il/xV6NWfeO/rcIlGXOS9z7F/LJy3PsjSBc2R2AlfgL
 1+eQ==
X-Gm-Message-State: ANhLgQ260/n/v+Ozdga3TdNSmVCsygeC+dOG7kseb+ofmwKDyQAMo1yE
 vMm8ApEA94knriB0JiqGpp8=
X-Google-Smtp-Source: ADFU+vv9UPwkcZVp3u3k1PaY1cDbXOcxmpPCWdMcGEeRP4v3Rs8ifzBP+hwpK0dwJiKDVY1bqxG/Vg==
X-Received: by 2002:a17:906:5e43:: with SMTP id
 b3mr14547023eju.375.1585655468155; 
 Tue, 31 Mar 2020 04:51:08 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id n62sm2246701edc.74.2020.03.31.04.51.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Mar 2020 04:51:07 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200306160254.8465-1-paul@xen.org>
 <58f00871-2fff-be69-299e-e2b9911e0723@suse.com>
 <000301d5f63a$df5f04a0$9e1d0de0$@xen.org>
 <0648e7ac-f5d7-4207-e2c6-8418681cca13@suse.com>
 <004201d5fc70$128cc610$37a65230$@xen.org>
 <8590eadc-b561-ba7c-c474-141102ec76bd@suse.com>
In-Reply-To: <8590eadc-b561-ba7c-c474-141102ec76bd@suse.com>
Subject: RE: [PATCH v4] x86: irq: Do not BUG_ON multiple unbind calls for
 shared pirqs
Date: Tue, 31 Mar 2020 12:51:05 +0100
Message-ID: <005f01d60752$aa090980$fe1b1c80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIK2yJyYyCu4hvzDwRQ39T9TXjhmgIXPdL9AaPqNSQCpdNRqAIEmAPBAG+DHyinskYl8A==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Varad Gautam' <vrd@amazon.de>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Julien Grall' <julien@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 31 March 2020 08:41
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Varad Gautam' <vrd@amazon.de>; =
'Julien Grall' <julien@xen.org>;
> 'Roger Pau Monn=C3=A9' <roger.pau@citrix.com>; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>
> Subject: Re: [PATCH v4] x86: irq: Do not BUG_ON multiple unbind calls =
for shared pirqs
>=20
> On 17.03.2020 16:23, Paul Durrant wrote:
> > That looks like it will do the job. I'll see if I can get it tested.
>=20
> Any luck with this, yet?
>=20

I have asked Varad to test it. He hopes to get to it this week.

  Paul


