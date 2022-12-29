Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB525658AFC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Dec 2022 10:29:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469683.729089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pApDt-0002pL-E9; Thu, 29 Dec 2022 09:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469683.729089; Thu, 29 Dec 2022 09:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pApDt-0002mj-B4; Thu, 29 Dec 2022 09:29:13 +0000
Received: by outflank-mailman (input) for mailman id 469683;
 Thu, 29 Dec 2022 09:29:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4oVf=43=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1pApDr-0002md-9U
 for xen-devel@lists.xenproject.org; Thu, 29 Dec 2022 09:29:11 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3efdcaf8-875b-11ed-8fd4-01056ac49cbb;
 Thu, 29 Dec 2022 10:29:10 +0100 (CET)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-rMzQXtXnMiWFSc0mHzngng-1; Thu, 29 Dec 2022 04:29:07 -0500
Received: by mail-wm1-f69.google.com with SMTP id
 g9-20020a7bc4c9000000b003d214cffa4eso4556599wmk.5
 for <xen-devel@lists.xenproject.org>; Thu, 29 Dec 2022 01:29:06 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 f8-20020adff8c8000000b00282194eaf7bsm7531081wrq.71.2022.12.29.01.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 01:29:04 -0800 (PST)
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
X-Inumbo-ID: 3efdcaf8-875b-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672306148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2G2HBi7RmxjXnaOAY9mntq61IebxaL6Lb+V6cYPCWk=;
	b=K1i3Vo9i5iV/jhIyDuf3NdqUI8neXkPaIl+JOebG/kqdlS1bCgzKHpuy7tiw/FIlAU1wqa
	pqgoVj9POAy1lpaXPtoV+PSx+/ltrIJ7+4p7M2wJRZrI5kTiZo0fiECrAGB2pUMiijJSP8
	VGDOcIH4otSYAsOAnqL3wFr08YheQdQ=
X-MC-Unique: rMzQXtXnMiWFSc0mHzngng-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2G2HBi7RmxjXnaOAY9mntq61IebxaL6Lb+V6cYPCWk=;
        b=mC4iu8GjhqfA6m7OrAovKYB0UAZBPOiYHUDTIEM3aQ3nyQh6lNY9mT1pz5eN7TVItf
         wAVPnyxksLb3C/TEuzEtILDC0PqpVyFOTHsd/5BOEIHWHa6dQC9v6/Mi/aGifKydhw3I
         CIiljDqUMt9zwGufQONIr3FqxWzhTyEDcJdyNAxRhLKVuoyN98DLOhBZSXlOslu58jaE
         fIDcwNs2PCB5khXBy4T6kMReDj5pXbmWnJzYCiuUsEA9GvyHLUxegWUvLyftxo/8KEBX
         wSPxVcqtYVSxiE/s7qXQMCY02WgzQq2oaLeWLNMUD7idb5tKzI5zjUURt9UkxhGSdOVg
         WoFA==
X-Gm-Message-State: AFqh2kqyHYBDguukFS28/bjdB1soBAXNa/A2cUfWehf1xu0hhv7moTIg
	bbIEiBKLomR18jhZ6xS8Hgjm882FMTQp1dJgytkZe4AogcRQkzTiUarlsDqv3kp2oWOBx/Oij/a
	d4kpcHzPn/V/PCW2LTtFw0YUXojQ=
X-Received: by 2002:a5d:46c3:0:b0:242:7676:689d with SMTP id g3-20020a5d46c3000000b002427676689dmr16793800wrs.19.1672306145926;
        Thu, 29 Dec 2022 01:29:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtvjWFBbb03W7bVXUDXS3S/VxZUjupIzmYbFuMIRxk+FI9eyNYhfuauEmH9uHEbJaq7Qg4B3A==
X-Received: by 2002:a5d:46c3:0:b0:242:7676:689d with SMTP id g3-20020a5d46c3000000b002427676689dmr16793782wrs.19.1672306145747;
        Thu, 29 Dec 2022 01:29:05 -0800 (PST)
Message-ID: <20f8ff01-8240-5c53-99ad-c75d37f6639c@redhat.com>
Date: Thu, 29 Dec 2022 10:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/6] util/error: add G_GNUC_PRINTF for various functions
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, virtio-fs@redhat.com,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-5-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221219130205.687815-5-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/12/2022 14.02, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   util/error-report.c | 1 +
>   util/error.c        | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/util/error-report.c b/util/error-report.c
> index 5edb2e6040..6e44a55732 100644
> --- a/util/error-report.c
> +++ b/util/error-report.c
> @@ -193,6 +193,7 @@ real_time_iso8601(void)
>    * a single phrase, with no newline or trailing punctuation.
>    * Prepend the current location and append a newline.
>    */
> +G_GNUC_PRINTF(2, 0)
>   static void vreport(report_type type, const char *fmt, va_list ap)
>   {
>       gchar *timestr;
> diff --git a/util/error.c b/util/error.c
> index b6c89d1412..1e7af665b8 100644
> --- a/util/error.c
> +++ b/util/error.c
> @@ -45,6 +45,7 @@ static void error_handle_fatal(Error **errp, Error *err)
>       }
>   }
>   
> +G_GNUC_PRINTF(6, 0)
>   static void error_setv(Error **errp,
>                          const char *src, int line, const char *func,
>                          ErrorClass err_class, const char *fmt, va_list ap,

Reviewed-by: Thomas Huth <thuth@redhat.com>


