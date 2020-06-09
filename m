Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCA61F391B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 13:10:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jic9X-0003SG-6P; Tue, 09 Jun 2020 11:10:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kazQ=7W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jic9W-0003Rx-BQ
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 11:10:46 +0000
X-Inumbo-ID: dd633b2e-aa41-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x633.google.com (unknown [2a00:1450:4864:20::633])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd633b2e-aa41-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 11:10:45 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id p20so1908203ejd.13
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 04:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=zx5AoOosdYlTaKv0p9tnq8rrFBNsFIGLT11EWzMH0hs=;
 b=In07grGzbm2tPRPQC0ggbJijnmPBoC3gseWy1O4SLsFP67kMXzjKZtcGxKXldlVrIY
 X5t2Cdjfw9IhkCSWVzbmNOFwOwj11dIzYiK8IaLQFRCVGF5TdKd6pTCii8nTzze1z+Ov
 DcF2p67nql3jsubUv0sEjRD2g37JWkvwITaayrO7YkeIt0bENkkLWbmSaquGUladq21F
 0LwW5cpfCYjwn1qMEs6OAgfOipjVAFdtP4aoSyG6DU/1YXpYQKT78IIoDkPPUeQBpS3M
 AX/7ugXvrb3LphlvGWSOYMPIW4jcS0+Gs6hJ/ImYV/UAiv4zXPtRSgeF7AGmeW6hqy4c
 GtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=zx5AoOosdYlTaKv0p9tnq8rrFBNsFIGLT11EWzMH0hs=;
 b=dSCtDUR+g6x19b2u3jEXXqaX0nWeBqqDt6S5oe1MIADOYcGV+kRIvXx+F9sUMWxn8Y
 c828jiEMlU0YKvIP5/rP20ndLKIiLXyw6z9KkkCuheP3IUUo9ja7WHgD4K/sHdJi2u9P
 9alNqg87NIlpqNcY3xwAmWFaKW5WfM//dWy1AispKdg6UGoqhF/8LdZHzkfkbyOo9IWC
 I6IbRqBTze21jcxPwClSTmMkbIoOInQo5YfAVqFr3cWzbjO+nHjfZbUUAnz7LXTtebDO
 sLuVeod3oiFUWr/LLmkinY8rGQYdR02X0U9Ifx9EsukuONIM3cATIW0SwKCBQdB+nSGS
 ut/A==
X-Gm-Message-State: AOAM532qw8x7fx2coQPOVr2eWx9uzjaH5MTwNFj4g943EUncjcf+07gh
 eO4Mo6kyAxsP62193JJ4CtI=
X-Google-Smtp-Source: ABdhPJzAHpkfbVB+lonYQyWOAoyZX7OhmsN7nZ8PtPKcAyhhLkvDUvqQxa8LnHLziiMJlKSKmswyog==
X-Received: by 2002:a17:906:d111:: with SMTP id
 b17mr24709296ejz.267.1591701044854; 
 Tue, 09 Jun 2020 04:10:44 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id o8sm12776936ejx.84.2020.06.09.04.10.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:10:44 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <20200608171556.27847-1-andrew.cooper3@citrix.com>
 <75b41942-3281-39ba-fa46-4a55667989f8@suse.com>
In-Reply-To: <75b41942-3281-39ba-fa46-4a55667989f8@suse.com>
Subject: RE: [PATCH for-4.14] docs: Minor build improvements
Date: Tue, 9 Jun 2020 12:10:42 +0100
Message-ID: <007a01d63e4e$9e85d330$db917990$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJEU+WnBi/4ky7HWNu3kNbmli1y/gFex+JAp+j/FHA=
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Xen-devel' <xen-devel@lists.xenproject.org>,
 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> Sent: 09 June 2020 11:42
> To: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>;
> Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <ian.jackson@citrix.com>; Xen-devel <xen-devel@lists.xenproject.org>
> Subject: Re: [PATCH for-4.14] docs: Minor build improvements
> 
> On 08.06.2020 19:15, Andrew Cooper wrote:
> > Don't use "set -x" for the figs rule.  It doesn't take effect in the recursive
> > make environment.
> 
> I'd rather view this as an unintended debugging leftover.
> 
> > Turn the HTML manpage comments into makefile comments, not shell comments.
> > This saves 3x shell invocations per manpage.
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Release-acked-by: Paul Durrant <paul@xen.org>



