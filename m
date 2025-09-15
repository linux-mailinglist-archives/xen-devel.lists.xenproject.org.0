Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4DEB57F78
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 16:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124341.1466743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyAWL-0006v9-D0; Mon, 15 Sep 2025 14:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124341.1466743; Mon, 15 Sep 2025 14:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyAWL-0006sg-9s; Mon, 15 Sep 2025 14:49:33 +0000
Received: by outflank-mailman (input) for mailman id 1124341;
 Mon, 15 Sep 2025 14:49:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uyAWJ-0006sa-Oj
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 14:49:31 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f9302d7-9243-11f0-9d13-b5c5bf9af7f9;
 Mon, 15 Sep 2025 16:49:30 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3d44d734cabso2723211f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Sep 2025 07:49:30 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-267b0bbab01sm9878695ad.116.2025.09.15.07.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 07:49:29 -0700 (PDT)
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
X-Inumbo-ID: 2f9302d7-9243-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757947770; x=1758552570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6tXQeSc9UFIcIaC80pLCYs62/iLGI6+GAveXdj6Nq6Q=;
        b=fn9phLoKbuLuQ/M2tWsApumP0xRjyE6TjyxYYnlAdKLz/xSjTMvLWIpiNT82Ru3RXs
         z4rRztZFFm2C3Uu3whtCSl2rgf4DYfYku9+1M5EketgCeOrxQw6D0F405jlus87f9M25
         IAI1oXN9R5vhBWz7cHyNKi0Bvpg0I3TSF9YktCa1k0gh0toVr/xsYVe9dDF3y+TJ07YN
         R/ZIm+GmUeX1T85hcA+NJndmqdPw6owLGWdcNk5hl6XtO0Q5rmnXC3dIG0Cit8aN/pWK
         6zhxUxLK/smAz77I2qyGbR5lklc6aD9tvbqSVhD6izpdoI4jQBeG63mgXsWxtx9qr9Bx
         GAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757947770; x=1758552570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tXQeSc9UFIcIaC80pLCYs62/iLGI6+GAveXdj6Nq6Q=;
        b=sJsYors0J8Bc3SvasZ/1zKGgLTiA4gZ4lzko4OKlS4Y4udtcsLMb061vg4mH6iK7vX
         nGbW/QsyH/Bcanx9T6qTLviPn6cDoxwCHnCVy9JP5QQDlBc7OzHlDsPJk5ZohAVSy012
         Y8eD5mKHlcvggqVYIMp0l+OvUJdHu3SFjuffKWyYI/XYoxY6J/AnPO5vLzE8K4YCFm0i
         PgMs18MXggzqxNnZ3oz81QbklzxepDuyLcgRW7BMewEkUtW2RSV5pf2uZwAcHxuGWjrr
         USxdEPR/b0HxolD9XbZaLhLX6+gLKyGioAiznuF78MjarAT+UT27o93SZb8oWttxdQas
         gwJg==
X-Gm-Message-State: AOJu0YxzhL2sr1U9rgTSQMrGUrbAkZed3MXZztqtNC3sGWDcpwvskiNa
	jmT5ChKkCuGLpmso9lI9+yEq/oT0sOqrT6CT292eXczLuyDnkv3CZ/1qzWWAkrPqZg==
X-Gm-Gg: ASbGncto4LV2puBjIgdei23R2Ls/eArpDwrftTfnm4DlfGqiFMrYJzMTnFM7cgtX5E6
	FjF2RRgBkqj4cuuzIgi3CRTrxf/vkUI7jjXzekrEMjBecXwozU3/njD/v2r6M489eMzpZLY4qDx
	WdBJvD3498pgV3PTjtjwTEvFPE4yvoZPPVeRg7/OCcTKZyLAPhacIsENQkprVlKjpbKF12IBarI
	DyTC7TvFI/le/Pa399TA6eOAaNZxGNgrDMUBghLcJj3HccLD6BUomrII9xkjumMueHrxo9LsdUu
	IW1CEfJsMStWIQWLrXue6FTRx/lQ2MLjIzkwBu3r7KZ51CEE6sl/1jdpDBYlBhhjKf+v1mxcYIX
	DYZ96142BzYDaiyrp1uaH+lASON/swqX1X2seLfJs+Q==
X-Google-Smtp-Source: AGHT+IGmGCF/wt8DUigXpLtGunnYCs6QSBpcMIItOcImwJHxvysK5u/w6VKOnR4iM05xK2OM/KxWlQ==
X-Received: by 2002:a5d:5887:0:b0:3eb:2d8a:4fca with SMTP id ffacd0b85a97d-3eb2d8a9c6cmr2596053f8f.63.1757947770118;
        Mon, 15 Sep 2025 07:49:30 -0700 (PDT)
Message-ID: <9d55721e-bd95-4354-b839-f8896eedab24@suse.com>
Date: Mon, 15 Sep 2025 16:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/16] emul/ns16x50: implement MCR/MSR registers
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
 dmukhin@xen.org
References: <20250908211149.279143-1-dmukhin@ford.com>
 <20250908211149.279143-9-dmukhin@ford.com>
 <CAGeoDV8iL374T7n=f_AQTA5VPfKThcEq-fN4X3kzWLzbjCzjew@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAGeoDV8iL374T7n=f_AQTA5VPfKThcEq-fN4X3kzWLzbjCzjew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.09.2025 08:00, Mykola Kvach wrote:
> On Tue, Sep 9, 2025 at 12:12 AM <dmukhin@xen.org> wrote:
>> --- a/xen/common/emul/vuart/ns16x50.c
>> +++ b/xen/common/emul/vuart/ns16x50.c
>> @@ -107,7 +107,7 @@ static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
>>
>>  static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
>>  {
>> -    return false;
>> +    return vdev->regs[UART_MSR] & UART_MSR_CHANGE;
>>  }
>>
>>  /*
>> @@ -232,12 +232,63 @@ static int ns16x50_io_write8(
>>              regs[UART_LCR] = val;
>>              break;
>>
>> +        case UART_MCR: {
> 
> Probably the opening brace should be moved to the next line.
> See CODING_STYLE:
> 
> Braces ('{' and '}') are usually placed on a line of their own, except
> for:
> 
> - the do/while loop
> - the opening brace in definitions of enum, struct, and union
> - the opening brace in initializers
> - compound literals

strictly by the wording of the doc you're right, yet if you go look then
you'll see that we really permit both forms (and apparently prefer the
one used here).

Jan

