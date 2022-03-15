Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8944D99CA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 11:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290733.493174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU4sy-0000KA-Go; Tue, 15 Mar 2022 10:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290733.493174; Tue, 15 Mar 2022 10:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU4sy-0000GW-DV; Tue, 15 Mar 2022 10:58:40 +0000
Received: by outflank-mailman (input) for mailman id 290733;
 Tue, 15 Mar 2022 10:58:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOId=T2=redhat.com=dgilbert@srs-se1.protection.inumbo.net>)
 id 1nU4sx-0000GQ-8a
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 10:58:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc8e66c4-a44e-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 11:58:37 +0100 (CET)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-qGsAbB09OBG8g52H0ioF-A-1; Tue, 15 Mar 2022 06:58:34 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 f14-20020adfc98e000000b001e8593b40b0so5150803wrh.14
 for <xen-devel@lists.xenproject.org>; Tue, 15 Mar 2022 03:58:33 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l41-20020a05600c1d2900b00389d3e18f8esm2188196wms.26.2022.03.15.03.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 03:58:31 -0700 (PDT)
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
X-Inumbo-ID: dc8e66c4-a44e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647341915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j4q1mDkTkfU3rhMwSrf7xL1WLfewGHyjSGlrtIXdyt8=;
	b=T7EDu2xV275NETyx7EG9BEbB+wO4fU9kQnmfUAsW5KXsY2bPrdqAMjN80fndtWGiVyVxSp
	Dfi1veKNTP0twdnT3vIPv8kr//a24jtyl8WbM3yDUG4c05PB7asyNU1Kb3GvLM4NYIT7KW
	wsMeecsMTnMUmjaLcPitSUqa8nRoweQ=
X-MC-Unique: qGsAbB09OBG8g52H0ioF-A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j4q1mDkTkfU3rhMwSrf7xL1WLfewGHyjSGlrtIXdyt8=;
        b=Hf/ypqYsO+dC2f87X6/Mr26ciBcUknLPZiYjtSkddoz5IegncKEoGnOmi6Wr62e3BV
         3BH98VyafLjWS1bBH6ofmdlxE+kjXM16YLBeMAxp83E8CjTH0Gs1JxKGDHx9HR+iL64+
         Ii5Cb7FZ1TTpbw4NOfIoXMbMxIN3PeKOQ1MIRKFIrlqqsS/TVDkjZMcmwZoFSKfr+U8L
         h5HbzLxGGLADzi/eseO250qpcFycCZc3bH5+hHyiZkRJ0jXmrCQ3HpckMGbDw+d0MzMt
         G9CgXhKjddw+ylzCsCYT7mFA7zSUxl2XBWhZ5XCRAycuQ6kzCVCojUmIew4hDLGW0iuE
         +95g==
X-Gm-Message-State: AOAM531oUhXD2qMFrAR1C4cwrcSVlGT7TA6eY4SNkEc/srSHKR92/EBV
	phUXxSosRd/9ouk72/RcjqXTRzOLJUz3kjtErB13zzXbOgjRwnGwtdEPth66Ax0jeUeRXgqgyn5
	V9KkAWFDtsJLdWdbtGwyTx1ogTLM=
X-Received: by 2002:adf:e704:0:b0:203:750b:3d8 with SMTP id c4-20020adfe704000000b00203750b03d8mr19437745wrm.623.1647341912945;
        Tue, 15 Mar 2022 03:58:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8F5reu0obf+EcRrMdtMT6tiW8zTCLp5lDbrl9sclZsfIDBUU+L8B96ElFqtFOlRiqihEQ9A==
X-Received: by 2002:adf:e704:0:b0:203:750b:3d8 with SMTP id c4-20020adfe704000000b00203750b03d8mr19437702wrm.623.1647341912687;
        Tue, 15 Mar 2022 03:58:32 -0700 (PDT)
Date: Tue, 15 Mar 2022 10:58:28 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
	Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Corey Minyard <cminyard@mvista.com>,
	Patrick Venture <venture@google.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Wenchao Wang <wenchao.wang@intel.com>,
	Colin Xu <colin.xu@intel.com>, Kamil Rytarowski <kamil@netbsd.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	John Snow <jsnow@redhat.com>, kvm@vger.kernel.org,
	qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-ppc@nongnu.org, qemu-block@nongnu.org, haxm-team@intel.com,
	qemu-s390x@nongnu.org
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Message-ID: <YjBxVFUw2DtBniYS@work-vm>
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220314160108.1440470-4-armbru@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Markus Armbruster (armbru@redhat.com) wrote:
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
> 
> This commit only touches allocations with size arguments of the form
> sizeof(T).
> 
> Patch created mechanically with:
> 
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> 	     --macro-file scripts/cocci-macro-file.h FILES...
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Just a small patch then...

> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index d65e744af9..aace12a787 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -91,7 +91,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>  {
>      int i;
>      int64_t dirty_rate = DirtyStat.dirty_rate;
> -    struct DirtyRateInfo *info = g_malloc0(sizeof(DirtyRateInfo));
> +    struct DirtyRateInfo *info = g_new0(DirtyRateInfo, 1);
>      DirtyRateVcpuList *head = NULL, **tail = &head;
>  
>      info->status = CalculatingState;
> @@ -112,7 +112,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>              info->sample_pages = 0;
>              info->has_vcpu_dirty_rate = true;
>              for (i = 0; i < DirtyStat.dirty_ring.nvcpu; i++) {
> -                DirtyRateVcpu *rate = g_malloc0(sizeof(DirtyRateVcpu));
> +                DirtyRateVcpu *rate = g_new0(DirtyRateVcpu, 1);
>                  rate->id = DirtyStat.dirty_ring.rates[i].id;
>                  rate->dirty_rate = DirtyStat.dirty_ring.rates[i].dirty_rate;
>                  QAPI_LIST_APPEND(tail, rate);
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index aba1c88a0c..3a7ae44485 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -43,7 +43,7 @@ struct zlib_data {
>   */
>  static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
>  {
> -    struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
> +    struct zlib_data *z = g_new0(struct zlib_data, 1);
>      z_stream *zs = &z->zs;
>  
>      zs->zalloc = Z_NULL;
> @@ -164,7 +164,7 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>   */
>  static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
>  {
> -    struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
> +    struct zlib_data *z = g_new0(struct zlib_data, 1);
>      z_stream *zs = &z->zs;
>  
>      p->data = z;
> diff --git a/migration/ram.c b/migration/ram.c
> index 170e522a1f..3532f64ecb 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2059,7 +2059,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
>      }
>  
>      struct RAMSrcPageRequest *new_entry =
> -        g_malloc0(sizeof(struct RAMSrcPageRequest));
> +        g_new0(struct RAMSrcPageRequest, 1);
>      new_entry->rb = ramblock;
>      new_entry->offset = start;
>      new_entry->len = len;

For migration:
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


