Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2AFC70947
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 19:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166290.1492868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLmch-0005K1-AB; Wed, 19 Nov 2025 18:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166290.1492868; Wed, 19 Nov 2025 18:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLmch-0005I0-5i; Wed, 19 Nov 2025 18:09:43 +0000
Received: by outflank-mailman (input) for mailman id 1166290;
 Wed, 19 Nov 2025 18:09:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t1IC=53=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1vLmcg-00051g-4K
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 18:09:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb00f713-c572-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 19:09:41 +0100 (CET)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-N94ghYGsPj22AWNkJSK94A-1; Wed, 19 Nov 2025 13:09:38 -0500
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88050708ac2so593166d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 10:09:38 -0800 (PST)
Received: from x1.local ([142.188.210.156]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e445bd4sm265876d6.10.2025.11.19.10.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 10:09:37 -0800 (PST)
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
X-Inumbo-ID: eb00f713-c572-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763575780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iWKuGlFXZQJhDckFQcgt5gxApYJTrA/9Towipm9l4OQ=;
	b=WLKJ7kl8dB3i5BML+gsMXEqOpB6+nlBAPZYmvqTNq4g6fl+VVzv+s1Hv17BfHkeIu8gzlV
	B8b5bZghzEi4KI8td6ngoMvvjeZiwIC8Ubs4f1+wytF9LlaJ8TxOQrTYRXKL5ogC6utky+
	mpIuzNei1gsHLUc6RJmX8xY63tr7mUk=
X-MC-Unique: N94ghYGsPj22AWNkJSK94A-1
X-Mimecast-MFC-AGG-ID: N94ghYGsPj22AWNkJSK94A_1763575778
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763575778; x=1764180578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWKuGlFXZQJhDckFQcgt5gxApYJTrA/9Towipm9l4OQ=;
        b=LMzQ7eRyv8WHWW/LZZwnCc8++7C2eeVfJMhutFW2g0nPkwxULaSVlVNDWBVp7ELx8R
         jgOCpzlrF80xRSZDhjvY0LbjD0Ga1UB4rL2yKucOT2a1ANbU5ecyIALZhqOq6Mcvq/nT
         se11g5b0eDfKcrnmLLJ1eztDzfb7fEnB+yZFqq2aBF2u4vLRLZDWeJFPDHfWCcDheki/
         mhAw4Nvx7BsTZcIpz3n0endzOSQhTJLFnuOnUHC6uh4Z7PR/rtKXvKdgl+cqy4+HDU+I
         mH1JoqDgtBkGMag0du2dSdRtPqADjdCKhBgXiaR9/U2ZoQ+3C5tB4MTZiKOMLqpgC1jS
         QT5A==
X-Forwarded-Encrypted: i=1; AJvYcCWIbpfbEKxejz8rp2GHSKoBuFqw3gF8GwCzWpY11MIiKUz6CWmSZ+Cji7iP38j6F+PwepMi2pODO0Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZBvy05BcD5CGzhvU4pa9CQ7MtLiAVEPZy05PqOvZnjcj6kVvu
	K/mum87JMuSQRS1DFZNKL4KURN/D5NgnySum18Wh3QrBzrgPifE1TxpI7Iu9UywmHb/e4+x8hy0
	XeZuMoyi6tOaKm3/Z80kqnNHfchBUxN1sxqAkRzhKXXHAJVAn3tRDVWtebp3x4pdLxeTH
X-Gm-Gg: ASbGncv1DCrp46yJkwCTYy2ksAf7pUc1n/U0cav2+puDwgN4+Dsh8Hew+cGnmuBKeU8
	KtWoqi+N99psI76AbGMA9eBVj/sITLsnuyIeSg4ILZpfQLfkMyIQrBigFqY5cKe5SVFG1UUHr7X
	8QmyFNBeYCScd+CJUCarG+ka6xPqMps4ny56vHXSIm83X8XECj/krBdlDAtVuSLSKEQU/IS6U0Y
	j3y/oIRa0rjk/izPRoSgs8mwvl/guuecTfthY9NVWe7bDcoHBTtVVF5j9/RKy71pgIvw3ROMJVe
	XzB19acQRr7nsKSD4Gbv7KJEvQdYT5Y0hybkKPFkY09XhEPZqa7eP+V2frXDvaj4Op7/GSdbxq0
	QIgM=
X-Received: by 2002:a05:6214:33c6:b0:87c:a4f:afd3 with SMTP id 6a1803df08f44-8846e02d57bmr1889456d6.16.1763575778020;
        Wed, 19 Nov 2025 10:09:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELSahBwRm5SxgULUmKqEQouDGBl9IAYstEeLqOk0A49a/xIWSs9mc1bJ81aMUBPzhLGlz0ig==
X-Received: by 2002:a05:6214:33c6:b0:87c:a4f:afd3 with SMTP id 6a1803df08f44-8846e02d57bmr1888776d6.16.1763575777665;
        Wed, 19 Nov 2025 10:09:37 -0800 (PST)
Date: Wed, 19 Nov 2025 13:09:35 -0500
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
	mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
	gengdongjiu1@gmail.com, peter.maydell@linaro.org,
	alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com,
	harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com,
	dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
	sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
	berrange@redhat.com, farosas@suse.de, eblake@redhat.com,
	vsementsov@yandex-team.ru, eduardo@habkost.net,
	marcel.apfelbaum@gmail.com, philmd@linaro.org,
	wangyanan55@huawei.com, zhao1.liu@intel.com, qemu-block@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/5] nbd/client-connection: Replace error_propagate() by
 assignment
Message-ID: <aR4H3-CQ-F8ZUN_Z@x1.local>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-4-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251119130855.105479-4-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IEOcER8lyS96JImryaSQWBNWAYKHlqf13vyNaVF0DHE_1763575778
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 19, 2025 at 02:08:53PM +0100, Markus Armbruster wrote:
> connect_thread_func() sets a variable to null, then error_propagate()s
> an Error * to it.  This is a roundabout way to assign the Error * to
> it, so replace it by just that.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


