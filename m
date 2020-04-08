Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC61A1D80
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 10:40:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM6Fm-0006rN-W3; Wed, 08 Apr 2020 08:40:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M0gu=5Y=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jM6Fl-0006rI-Qv
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 08:40:09 +0000
X-Inumbo-ID: 8d8e0c12-7974-11ea-b58d-bc764e2007e4
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d8e0c12-7974-11ea-b58d-bc764e2007e4;
 Wed, 08 Apr 2020 08:40:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id h2so4262808wmb.4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2020 01:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=+qE9XoupkITSIvgnncMclC0UqTdwG7DHScX5XnqacAE=;
 b=cyF12knWEDym9wgKgtzie97jiX8UUDFQn8uHVYrtPUvsYx7YXKJbwmZiU2LjcO2dJ9
 pwBfwHvP6bpCqYMrHRB7in8eBFA56RmDffeHXaSJb/RaZjjOq2kM28xWYtaKomLCX79I
 5ZFB6S6SJTCz/Zf2tFkU1Mrwfvc8CtQ0PGOR/heBVF3nARUXrzgTu0k1RloQ6lOVy16P
 MppIi9PuKgHk6w5aMPqjCVTvRpqLGrofT5djnSROCbSw3ALEvY/iwu0YBOfpRbNmUvKl
 kZaxczAVEISy1fVU4mAKLHuCBds9uBIBcfsbWD+EKPBig4cX3FOWaZt3vGQVEx/dT2ua
 FCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=+qE9XoupkITSIvgnncMclC0UqTdwG7DHScX5XnqacAE=;
 b=jI6Xlho4ynD39s4PFJmM3dCori/EGyrgEuipnwa88bJ6lGmJOprK7xgVxFMDZlo9l6
 8gxcLgnpcwxLqx2aSYDScXio14UnGpd+/23SPmtzDSi5yqqJ1TIf5hZ5qE+onF4HoqyD
 OcBTxGSp8QFBszyA3Rj7p0sP+TCfbZny/X+FumP2tABeO/QsZUtiR4v82eakyDFsBclx
 wvxsdhfANm7Rh1MarIz5ZBAYD8zifzMrx87GZ3ukp54oPDHXv7RBSD9bQHHK66mtvMXq
 gyVsJcAsNjNKDdJBa6rHvtkQ61k4fAqCPPVtrCtjZ43qpbAM24EXwQLhOWq2fGL/TckH
 b5Ig==
X-Gm-Message-State: AGi0PubfPX1TDEczgXtWPM25ygNHQv8g1zqSzW7J915NKPBCXR/wyLl+
 s8tcm9R+q0lQlxWKMKgN05w=
X-Google-Smtp-Source: APiQypKBnZx9SX7tcr7LXwcBq4Lfo7QxCE52mSRmfX+GHxwqW/ShhJVMyPtdLyFjxvdBiBkXAjrXhA==
X-Received: by 2002:a1c:5605:: with SMTP id k5mr3695219wmb.83.1586335208070;
 Wed, 08 Apr 2020 01:40:08 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.190])
 by smtp.gmail.com with ESMTPSA id f4sm17483044wrp.80.2020.04.08.01.40.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Apr 2020 01:40:07 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Maximilian Heyne'" <mheyne@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20200313123316.122003-1-mheyne@amazon.de>
 <6f476505-5e85-8a8a-d6d7-db56ea921637@amazon.de>
In-Reply-To: <6f476505-5e85-8a8a-d6d7-db56ea921637@amazon.de>
Subject: RE: [PATCH 0/3] Cleanup IOREQ server on exit
Date: Wed, 8 Apr 2020 09:40:06 +0100
Message-ID: <004601d60d81$4e7c4e80$eb74eb80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGvBAjA7hxOW9V3ZNauiodGQFqJFQEiCWftqLPpwbA=
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
Cc: 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Maximilian Heyne <mheyne@amazon.de>
> Sent: 07 April 2020 10:16
> To: xen-devel@lists.xenproject.org
> Cc: Ian Jackson <ian.jackson@citrix.com>; Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH 0/3] Cleanup IOREQ server on exit
> 
> Could someone please have a look at this patch? It solves an actual issue:
> Try soft-reset with qemu-xen-traditional and it will fail.
> 

I'll take a look today.

Ian, obviously we know that qemu trad is largely dead but this series does address a serious shortcoming. Could you take a look?

  Paul


