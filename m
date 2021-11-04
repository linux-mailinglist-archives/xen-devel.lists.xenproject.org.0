Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F07445C00
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 23:06:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221922.383857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mikrN-0005a7-Um; Thu, 04 Nov 2021 22:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221922.383857; Thu, 04 Nov 2021 22:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mikrN-0005Ws-Rd; Thu, 04 Nov 2021 22:05:25 +0000
Received: by outflank-mailman (input) for mailman id 221922;
 Thu, 04 Nov 2021 22:05:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jM55=PX=redhat.com=philmd@srs-se1.protection.inumbo.net>)
 id 1mikrL-0005Wm-Ld
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 22:05:23 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d79c2cd-3dbb-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 23:05:22 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-eQOgmhKeMk6V4Fy7_GcItA-1; Thu, 04 Nov 2021 18:05:17 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so2863007wms.8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 15:05:17 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c17sm6507637wmk.23.2021.11.04.15.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 15:05:15 -0700 (PDT)
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
X-Inumbo-ID: 4d79c2cd-3dbb-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636063520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=55IgmPgmgSuFU9TD9sDvt/2ASWtxXb/fPvF+Rr/pBEI=;
	b=OeRsT9OZj037HOboHxS3iv080deug4S+vX9wINGdKbuLky9iA/OesbKr9mQqXoWCXvJ+rO
	QL1KMGx/fpY8TV+yRYj9kXe7+6bC9Qhn3AYnCyYIPUOf+ZPOSr60l1fLnnMfzpfuNA1ovr
	JgWni7d+q78t7qeCKrFq5BH64wq38dY=
X-MC-Unique: eQOgmhKeMk6V4Fy7_GcItA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=55IgmPgmgSuFU9TD9sDvt/2ASWtxXb/fPvF+Rr/pBEI=;
        b=RUlkILbjtxfiMkb2Azhbe4F9BquLErOtMRmHk+gG41yBLXpNcGpG0jVgcBsunFTHMQ
         txvdBUyjwcPS8Rs8PJMJuxsI2D/VpKTTevrs+v4UHG3CL36HqqaxGsZBzEBE2IQ+L/Dw
         1HcShVJxLSKvcedhWod22jigcn8Fi51cLdUCtVGaFe/lYErga1+yurIUsBBnPWIt7mJ/
         pW3MW9hPjy8+5Uo0dkw8oje1ES4U9NqFZbrkm6P1QvPKoeJTK4SjIAAbE+6xkuK418rc
         hVtIm/8DYMUuy+Aeji9IwMCU8ANMlDOVkbtx4i5kbedgsXGlwVaa7VDNvHulvM7EK7Gg
         ClsQ==
X-Gm-Message-State: AOAM533etl0K1VYlnSH3ZsrjrGZgztbDU1+/QCiZa4FWriWyExP2eVC3
	v2xtQjFThuJo5BbDNQb9SVCxOj/JktOKMmWyHTZShy1+/fFLuNRkMUKafnYS8wrjjYkIyv2J1or
	Av6jdKgOhGzbRS1vXM5E98kyiwyM=
X-Received: by 2002:a7b:c316:: with SMTP id k22mr27241658wmj.22.1636063516522;
        Thu, 04 Nov 2021 15:05:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjuyOzFEoyPllk1OzGlmTypUNL8HrTM0i7sNCF1fqIwt5RxcZxT6UmP+XE0SaD8CiW4+dEaQ==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr27241636wmj.22.1636063516364;
        Thu, 04 Nov 2021 15:05:16 -0700 (PDT)
Message-ID: <6f8b30c5-d93d-882d-cf1a-502592e4bcf8@redhat.com>
Date: Thu, 4 Nov 2021 23:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 07/20] migration/dirtyrate: implement dirty-ring dirtyrate
 calculation
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Cc: Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eric Blake
 <eblake@redhat.com>, kvm@vger.kernel.org, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?SHltYW4gSHVhbmcow6nCu+KAnsOl4oC54oChKQ==?=
 <huangy81@chinatelecom.cn>
References: <20211101220912.10039-1-quintela@redhat.com>
 <20211101220912.10039-8-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211101220912.10039-8-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Juan,

On 11/1/21 23:08, Juan Quintela wrote:
> From: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
> 
> use dirty ring feature to implement dirtyrate calculation.
> 
> introduce mode option in qmp calc_dirty_rate to specify what
> method should be used when calculating dirtyrate, either
> page-sampling or dirty-ring should be passed.
> 
> introduce "dirty_ring:-r" option in hmp calc_dirty_rate to
> indicate dirty ring method should be used for calculation.
> 
> Signed-off-by: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>

Just noticing in the git history some commits from your
pull request have the author name (from + S-o-b) mojibaked.

> Message-Id: <7db445109bd18125ce8ec86816d14f6ab5de6a7d.1624040308.git.huangy81@chinatelecom.cn>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  qapi/migration.json    |  16 +++-
>  migration/dirtyrate.c  | 208 +++++++++++++++++++++++++++++++++++++++--
>  hmp-commands.hx        |   7 +-
>  migration/trace-events |   2 +
>  4 files changed, 218 insertions(+), 15 deletions(-)


