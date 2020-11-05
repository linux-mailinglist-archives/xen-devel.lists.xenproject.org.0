Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B512A866F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 19:50:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20019.45622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakKk-0006NK-Pw; Thu, 05 Nov 2020 18:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20019.45622; Thu, 05 Nov 2020 18:50:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakKk-0006Mu-Lh; Thu, 05 Nov 2020 18:50:06 +0000
Received: by outflank-mailman (input) for mailman id 20019;
 Thu, 05 Nov 2020 18:50:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6HEM=EL=linux.ibm.com=stefanb@srs-us1.protection.inumbo.net>)
 id 1kakKj-0006F7-9u
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:50:05 +0000
Received: from mx0a-001b2d01.pphosted.com (unknown [148.163.156.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 417bf15c-a35f-4a5b-9548-93de63798a7d;
 Thu, 05 Nov 2020 18:50:02 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A5IXkOm036973; Thu, 5 Nov 2020 13:50:00 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34m7re1txr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 13:49:59 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A5Ibre0052700;
 Thu, 5 Nov 2020 13:49:58 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34m7re1txb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 13:49:58 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A5IlBhL027678;
 Thu, 5 Nov 2020 18:49:57 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 34hs33gutu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 18:49:57 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A5Inosl39780740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Nov 2020 18:49:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 932CF7805C;
 Thu,  5 Nov 2020 18:49:55 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03A1578060;
 Thu,  5 Nov 2020 18:49:53 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Nov 2020 18:49:53 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6HEM=EL=linux.ibm.com=stefanb@srs-us1.protection.inumbo.net>)
	id 1kakKj-0006F7-9u
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:50:05 +0000
X-Inumbo-ID: 417bf15c-a35f-4a5b-9548-93de63798a7d
Received: from mx0a-001b2d01.pphosted.com (unknown [148.163.156.1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 417bf15c-a35f-4a5b-9548-93de63798a7d;
	Thu, 05 Nov 2020 18:50:02 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A5IXkOm036973;
	Thu, 5 Nov 2020 13:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HF+zIy3dMq9WoBj7Ui49l20NKBjwZxB8ohvtpMNY4X4=;
 b=ob78G21it51g6/PxidTte7GuwtCenIhiwe07h9DqVd+XTpxhnW1STqMkw+zJTKkmD2xq
 s1gOdPOFLEWUNp2OrCi6XEpWpdZa27ytwE19AMJ+Ztgl6IWUg6306jaN7PGjaIf9iBNa
 2q+omAwsCWB6aJmJGktBAg4wFh2TNIpWQJZ1qvmJgk6PmreTXd69rWb3HgSFtKKSVjDX
 EIWNe5SSJjX3fiztI2RHe12DG28OiqfO0U5M9bLDlrtwbFez4aSxf6KAG5fNCX9WrvMU
 fXLEvTVjjnoBNg2KpLZEzT/wCtnfcokkD7VTVeb7i07sKu2mChg9PAB7XBN/JXywDngK Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 34m7re1txr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2020 13:49:59 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A5Ibre0052700;
	Thu, 5 Nov 2020 13:49:58 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com with ESMTP id 34m7re1txb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2020 13:49:58 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A5IlBhL027678;
	Thu, 5 Nov 2020 18:49:57 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma03dal.us.ibm.com with ESMTP id 34hs33gutu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2020 18:49:57 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 0A5Inosl39780740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Nov 2020 18:49:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 932CF7805C;
	Thu,  5 Nov 2020 18:49:55 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03A1578060;
	Thu,  5 Nov 2020 18:49:53 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu,  5 Nov 2020 18:49:53 +0000 (GMT)
Subject: Re: [PATCH v2 36/44] qdev: Rename qdev_get_prop_ptr() to
 object_field_prop_ptr()
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>,
        Markus Armbruster <armbru@redhat.com>,
        =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
        John Snow <jsnow@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>,
        Max Reitz <mreitz@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Richard Henderson <rth@twiddle.net>,
        David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
        qemu-s390x@nongnu.org
References: <20201104160021.2342108-1-ehabkost@redhat.com>
 <20201104160021.2342108-37-ehabkost@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <5d4020f6-2df7-0f61-4060-ac885dab3bab@linux.ibm.com>
Date: Thu, 5 Nov 2020 13:49:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201104160021.2342108-37-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-05_11:2020-11-05,2020-11-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=2 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011050121

On 11/4/20 11:00 AM, Eduardo Habkost wrote:
> The function will be moved to common QOM code, as it is not
> specific to TYPE_DEVICE anymore.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
> Changes v1 -> v2:
> * Rename to object_field_prop_ptr() instead of object_static_prop_ptr()
> ---
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Daniel P. Berrangé" <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Matthew Rosato <mjrosato@linux.ibm.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>   include/hw/qdev-properties.h     |  2 +-
>   backends/tpm/tpm_util.c          |  6 ++--
>   hw/block/xen-block.c             |  4 +--
>   hw/core/qdev-properties-system.c | 50 +++++++++++++-------------
>   hw/core/qdev-properties.c        | 60 ++++++++++++++++----------------
>   hw/s390x/css.c                   |  4 +--
>   hw/s390x/s390-pci-bus.c          |  4 +--
>   hw/vfio/pci-quirks.c             |  4 +--
>   8 files changed, 67 insertions(+), 67 deletions(-)
>
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 7f8d5fc206..2bec65c8e5 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -223,7 +223,7 @@ void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
>                              const uint8_t *value);
>   void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
>   
> -void *qdev_get_prop_ptr(Object *obj, Property *prop);
> +void *object_field_prop_ptr(Object *obj, Property *prop);
>   
>   void qdev_prop_register_global(GlobalProperty *prop);
>   const GlobalProperty *qdev_find_global_prop(Object *obj,
> diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
> index 0b07cf55ea..bb1ab34a75 100644
> --- a/backends/tpm/tpm_util.c
> +++ b/backends/tpm/tpm_util.c
> @@ -35,7 +35,7 @@
>   static void get_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
>                       Error **errp)
>   {
> -    TPMBackend **be = qdev_get_prop_ptr(obj, opaque);
> +    TPMBackend **be = object_field_prop_ptr(obj, opaque);
>       char *p;
>   
>       p = g_strdup(*be ? (*be)->id : "");
> @@ -47,7 +47,7 @@ static void set_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
>                       Error **errp)
>   {
>       Property *prop = opaque;
> -    TPMBackend *s, **be = qdev_get_prop_ptr(obj, prop);
> +    TPMBackend *s, **be = object_field_prop_ptr(obj, prop);
>       char *str;
>   
>       if (!visit_type_str(v, name, &str, errp)) {
> @@ -67,7 +67,7 @@ static void set_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
>   static void release_tpm(Object *obj, const char *name, void *opaque)
>   {
>       Property *prop = opaque;
> -    TPMBackend **be = qdev_get_prop_ptr(obj, prop);
> +    TPMBackend **be = object_field_prop_ptr(obj, prop);
>   
>       if (*be) {
>           tpm_backend_reset(*be);
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index bd1aef63a7..718d886e5c 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -336,7 +336,7 @@ static void xen_block_get_vdev(Object *obj, Visitor *v, const char *name,
>                                  void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    XenBlockVdev *vdev = qdev_get_prop_ptr(obj, prop);
> +    XenBlockVdev *vdev = object_field_prop_ptr(obj, prop);
>       char *str;
>   
>       switch (vdev->type) {
> @@ -396,7 +396,7 @@ static void xen_block_set_vdev(Object *obj, Visitor *v, const char *name,
>                                  void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    XenBlockVdev *vdev = qdev_get_prop_ptr(obj, prop);
> +    XenBlockVdev *vdev = object_field_prop_ptr(obj, prop);
>       char *str, *p;
>       const char *end;
>   
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index 96a0bc5109..8781b856d3 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -62,7 +62,7 @@ static void get_drive(Object *obj, Visitor *v, const char *name, void *opaque,
>                         Error **errp)
>   {
>       Property *prop = opaque;
> -    void **ptr = qdev_get_prop_ptr(obj, prop);
> +    void **ptr = object_field_prop_ptr(obj, prop);
>       const char *value;
>       char *p;
>   
> @@ -88,7 +88,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
>   {
>       DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
> -    void **ptr = qdev_get_prop_ptr(obj, prop);
> +    void **ptr = object_field_prop_ptr(obj, prop);
>       char *str;
>       BlockBackend *blk;
>       bool blk_created = false;
> @@ -181,7 +181,7 @@ static void release_drive(Object *obj, const char *name, void *opaque)
>   {
>       DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
> -    BlockBackend **ptr = qdev_get_prop_ptr(obj, prop);
> +    BlockBackend **ptr = object_field_prop_ptr(obj, prop);
>   
>       if (*ptr) {
>           AioContext *ctx = blk_get_aio_context(*ptr);
> @@ -214,7 +214,7 @@ const PropertyInfo qdev_prop_drive_iothread = {
>   static void get_chr(Object *obj, Visitor *v, const char *name, void *opaque,
>                       Error **errp)
>   {
> -    CharBackend *be = qdev_get_prop_ptr(obj, opaque);
> +    CharBackend *be = object_field_prop_ptr(obj, opaque);
>       char *p;
>   
>       p = g_strdup(be->chr && be->chr->label ? be->chr->label : "");
> @@ -226,7 +226,7 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
>                       Error **errp)
>   {
>       Property *prop = opaque;
> -    CharBackend *be = qdev_get_prop_ptr(obj, prop);
> +    CharBackend *be = object_field_prop_ptr(obj, prop);
>       Chardev *s;
>       char *str;
>   
> @@ -262,7 +262,7 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
>   static void release_chr(Object *obj, const char *name, void *opaque)
>   {
>       Property *prop = opaque;
> -    CharBackend *be = qdev_get_prop_ptr(obj, prop);
> +    CharBackend *be = object_field_prop_ptr(obj, prop);
>   
>       qemu_chr_fe_deinit(be, false);
>   }
> @@ -286,7 +286,7 @@ static void get_mac(Object *obj, Visitor *v, const char *name, void *opaque,
>                       Error **errp)
>   {
>       Property *prop = opaque;
> -    MACAddr *mac = qdev_get_prop_ptr(obj, prop);
> +    MACAddr *mac = object_field_prop_ptr(obj, prop);
>       char buffer[2 * 6 + 5 + 1];
>       char *p = buffer;
>   
> @@ -301,7 +301,7 @@ static void set_mac(Object *obj, Visitor *v, const char *name, void *opaque,
>                       Error **errp)
>   {
>       Property *prop = opaque;
> -    MACAddr *mac = qdev_get_prop_ptr(obj, prop);
> +    MACAddr *mac = object_field_prop_ptr(obj, prop);
>       int i, pos;
>       char *str;
>       const char *p;
> @@ -363,7 +363,7 @@ static void get_netdev(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    NICPeers *peers_ptr = qdev_get_prop_ptr(obj, prop);
> +    NICPeers *peers_ptr = object_field_prop_ptr(obj, prop);
>       char *p = g_strdup(peers_ptr->ncs[0] ? peers_ptr->ncs[0]->name : "");
>   
>       visit_type_str(v, name, &p, errp);
> @@ -374,7 +374,7 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    NICPeers *peers_ptr = qdev_get_prop_ptr(obj, prop);
> +    NICPeers *peers_ptr = object_field_prop_ptr(obj, prop);
>       NetClientState **ncs = peers_ptr->ncs;
>       NetClientState *peers[MAX_QUEUE_NUM];
>       int queues, err = 0, i = 0;
> @@ -436,7 +436,7 @@ static void get_audiodev(Object *obj, Visitor *v, const char* name,
>                            void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    QEMUSoundCard *card = qdev_get_prop_ptr(obj, prop);
> +    QEMUSoundCard *card = object_field_prop_ptr(obj, prop);
>       char *p = g_strdup(audio_get_id(card));
>   
>       visit_type_str(v, name, &p, errp);
> @@ -447,7 +447,7 @@ static void set_audiodev(Object *obj, Visitor *v, const char* name,
>                            void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    QEMUSoundCard *card = qdev_get_prop_ptr(obj, prop);
> +    QEMUSoundCard *card = object_field_prop_ptr(obj, prop);
>       AudioState *state;
>       int err = 0;
>       char *str;
> @@ -549,7 +549,7 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
>   {
>       DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
> -    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr = object_field_prop_ptr(obj, prop);
>       uint64_t value;
>       Error *local_err = NULL;
>   
> @@ -637,7 +637,7 @@ static void get_reserved_region(Object *obj, Visitor *v, const char *name,
>                                   void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    ReservedRegion *rr = qdev_get_prop_ptr(obj, prop);
> +    ReservedRegion *rr = object_field_prop_ptr(obj, prop);
>       char buffer[64];
>       char *p = buffer;
>       int rc;
> @@ -653,7 +653,7 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
>                                   void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    ReservedRegion *rr = qdev_get_prop_ptr(obj, prop);
> +    ReservedRegion *rr = object_field_prop_ptr(obj, prop);
>       Error *local_err = NULL;
>       const char *endptr;
>       char *str;
> @@ -715,7 +715,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
>                             void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    int32_t value, *ptr = qdev_get_prop_ptr(obj, prop);
> +    int32_t value, *ptr = object_field_prop_ptr(obj, prop);
>       unsigned int slot, fn, n;
>       char *str;
>   
> @@ -753,7 +753,7 @@ invalid:
>   static int print_pci_devfn(Object *obj, Property *prop, char *dest,
>                              size_t len)
>   {
> -    int32_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    int32_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       if (*ptr == -1) {
>           return snprintf(dest, len, "<unset>");
> @@ -777,7 +777,7 @@ static void get_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>                                    void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    PCIHostDeviceAddress *addr = qdev_get_prop_ptr(obj, prop);
> +    PCIHostDeviceAddress *addr = object_field_prop_ptr(obj, prop);
>       char buffer[] = "ffff:ff:ff.f";
>       char *p = buffer;
>       int rc = 0;
> @@ -803,7 +803,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>                                    void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    PCIHostDeviceAddress *addr = qdev_get_prop_ptr(obj, prop);
> +    PCIHostDeviceAddress *addr = object_field_prop_ptr(obj, prop);
>       char *str, *p;
>       const char *e;
>       unsigned long val;
> @@ -892,7 +892,7 @@ static void get_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
>                                      void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    PCIExpLinkSpeed *p = qdev_get_prop_ptr(obj, prop);
> +    PCIExpLinkSpeed *p = object_field_prop_ptr(obj, prop);
>       int speed;
>   
>       switch (*p) {
> @@ -920,7 +920,7 @@ static void set_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
>                                      void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    PCIExpLinkSpeed *p = qdev_get_prop_ptr(obj, prop);
> +    PCIExpLinkSpeed *p = object_field_prop_ptr(obj, prop);
>       int speed;
>   
>       if (!visit_type_enum(v, name, &speed, prop->info->enum_table,
> @@ -962,7 +962,7 @@ static void get_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
>                                      void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    PCIExpLinkWidth *p = qdev_get_prop_ptr(obj, prop);
> +    PCIExpLinkWidth *p = object_field_prop_ptr(obj, prop);
>       int width;
>   
>       switch (*p) {
> @@ -999,7 +999,7 @@ static void set_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
>                                      void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    PCIExpLinkWidth *p = qdev_get_prop_ptr(obj, prop);
> +    PCIExpLinkWidth *p = object_field_prop_ptr(obj, prop);
>       int width;
>   
>       if (!visit_type_enum(v, name, &width, prop->info->enum_table,
> @@ -1050,7 +1050,7 @@ static void get_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
>                        Error **errp)
>   {
>       Property *prop = opaque;
> -    QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
> +    QemuUUID *uuid = object_field_prop_ptr(obj, prop);
>       char buffer[UUID_FMT_LEN + 1];
>       char *p = buffer;
>   
> @@ -1065,7 +1065,7 @@ static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
>                       Error **errp)
>   {
>       Property *prop = opaque;
> -    QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
> +    QemuUUID *uuid = object_field_prop_ptr(obj, prop);
>       char *str;
>   
>       if (!visit_type_str(v, name, &str, errp)) {
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index aeab4ae9b6..9aebd7b8a9 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -50,7 +50,7 @@ void qdev_prop_allow_set_link_before_realize(const Object *obj,
>       }
>   }
>   
> -void *qdev_get_prop_ptr(Object *obj, Property *prop)
> +void *object_field_prop_ptr(Object *obj, Property *prop)
>   {
>       void *ptr = obj;
>       ptr += prop->offset;
> @@ -96,7 +96,7 @@ void field_prop_get_enum(Object *obj, Visitor *v, const char *name,
>                            void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    int *ptr = qdev_get_prop_ptr(obj, prop);
> +    int *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
>   }
> @@ -105,7 +105,7 @@ void field_prop_set_enum(Object *obj, Visitor *v, const char *name,
>                            void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    int *ptr = qdev_get_prop_ptr(obj, prop);
> +    int *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
>   }
> @@ -134,7 +134,7 @@ static uint32_t qdev_get_prop_mask(Property *prop)
>   
>   static void bit_prop_set(Object *obj, Property *props, bool val)
>   {
> -    uint32_t *p = qdev_get_prop_ptr(obj, props);
> +    uint32_t *p = object_field_prop_ptr(obj, props);
>       uint32_t mask = qdev_get_prop_mask(props);
>       if (val) {
>           *p |= mask;
> @@ -147,7 +147,7 @@ static void prop_get_bit(Object *obj, Visitor *v, const char *name,
>                            void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    uint32_t *p = qdev_get_prop_ptr(obj, prop);
> +    uint32_t *p = object_field_prop_ptr(obj, prop);
>       bool value = (*p & qdev_get_prop_mask(prop)) != 0;
>   
>       visit_type_bool(v, name, &value, errp);
> @@ -188,7 +188,7 @@ static uint64_t qdev_get_prop_mask64(Property *prop)
>   
>   static void bit64_prop_set(Object *obj, Property *props, bool val)
>   {
> -    uint64_t *p = qdev_get_prop_ptr(obj, props);
> +    uint64_t *p = object_field_prop_ptr(obj, props);
>       uint64_t mask = qdev_get_prop_mask64(props);
>       if (val) {
>           *p |= mask;
> @@ -201,7 +201,7 @@ static void prop_get_bit64(Object *obj, Visitor *v, const char *name,
>                              void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    uint64_t *p = qdev_get_prop_ptr(obj, prop);
> +    uint64_t *p = object_field_prop_ptr(obj, prop);
>       bool value = (*p & qdev_get_prop_mask64(prop)) != 0;
>   
>       visit_type_bool(v, name, &value, errp);
> @@ -233,7 +233,7 @@ static void get_bool(Object *obj, Visitor *v, const char *name, void *opaque,
>                        Error **errp)
>   {
>       Property *prop = opaque;
> -    bool *ptr = qdev_get_prop_ptr(obj, prop);
> +    bool *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_bool(v, name, ptr, errp);
>   }
> @@ -242,7 +242,7 @@ static void set_bool(Object *obj, Visitor *v, const char *name, void *opaque,
>                        Error **errp)
>   {
>       Property *prop = opaque;
> -    bool *ptr = qdev_get_prop_ptr(obj, prop);
> +    bool *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_bool(v, name, ptr, errp);
>   }
> @@ -260,7 +260,7 @@ static void get_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
>                         Error **errp)
>   {
>       Property *prop = opaque;
> -    uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint8_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_uint8(v, name, ptr, errp);
>   }
> @@ -269,7 +269,7 @@ static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
>                         Error **errp)
>   {
>       Property *prop = opaque;
> -    uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint8_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_uint8(v, name, ptr, errp);
>   }
> @@ -299,7 +299,7 @@ static void get_uint16(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    uint16_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint16_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_uint16(v, name, ptr, errp);
>   }
> @@ -308,7 +308,7 @@ static void set_uint16(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    uint16_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint16_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_uint16(v, name, ptr, errp);
>   }
> @@ -326,7 +326,7 @@ static void get_uint32(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_uint32(v, name, ptr, errp);
>   }
> @@ -335,7 +335,7 @@ static void set_uint32(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_uint32(v, name, ptr, errp);
>   }
> @@ -344,7 +344,7 @@ void field_prop_get_int32(Object *obj, Visitor *v, const char *name,
>                             void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    int32_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    int32_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_int32(v, name, ptr, errp);
>   }
> @@ -353,7 +353,7 @@ static void set_int32(Object *obj, Visitor *v, const char *name, void *opaque,
>                         Error **errp)
>   {
>       Property *prop = opaque;
> -    int32_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    int32_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_int32(v, name, ptr, errp);
>   }
> @@ -378,7 +378,7 @@ static void get_uint64(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint64_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_uint64(v, name, ptr, errp);
>   }
> @@ -387,7 +387,7 @@ static void set_uint64(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint64_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_uint64(v, name, ptr, errp);
>   }
> @@ -396,7 +396,7 @@ static void get_int64(Object *obj, Visitor *v, const char *name,
>                         void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    int64_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    int64_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_int64(v, name, ptr, errp);
>   }
> @@ -405,7 +405,7 @@ static void set_int64(Object *obj, Visitor *v, const char *name,
>                         void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    int64_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    int64_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_int64(v, name, ptr, errp);
>   }
> @@ -429,14 +429,14 @@ const PropertyInfo qdev_prop_int64 = {
>   static void release_string(Object *obj, const char *name, void *opaque)
>   {
>       Property *prop = opaque;
> -    g_free(*(char **)qdev_get_prop_ptr(obj, prop));
> +    g_free(*(char **)object_field_prop_ptr(obj, prop));
>   }
>   
>   static void get_string(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    char **ptr = qdev_get_prop_ptr(obj, prop);
> +    char **ptr = object_field_prop_ptr(obj, prop);
>   
>       if (!*ptr) {
>           char *str = (char *)"";
> @@ -450,7 +450,7 @@ static void set_string(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    char **ptr = qdev_get_prop_ptr(obj, prop);
> +    char **ptr = object_field_prop_ptr(obj, prop);
>       char *str;
>   
>       if (!visit_type_str(v, name, &str, errp)) {
> @@ -484,7 +484,7 @@ void field_prop_get_size32(Object *obj, Visitor *v, const char *name,
>                              void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr = object_field_prop_ptr(obj, prop);
>       uint64_t value = *ptr;
>   
>       visit_type_size(v, name, &value, errp);
> @@ -494,7 +494,7 @@ static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
>                          Error **errp)
>   {
>       Property *prop = opaque;
> -    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr = object_field_prop_ptr(obj, prop);
>       uint64_t value;
>   
>       if (!visit_type_size(v, name, &value, errp)) {
> @@ -531,7 +531,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
>        */
>       Property *prop = opaque;
>       ObjectProperty *op = object_property_find_err(obj, name, &error_abort);
> -    uint32_t *alenptr = qdev_get_prop_ptr(obj, prop);
> +    uint32_t *alenptr = object_field_prop_ptr(obj, prop);
>       void **arrayptr = (void *)obj + prop->arrayoffset;
>       void *eltptr;
>       const char *arrayname;
> @@ -570,7 +570,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
>            * being inside the device struct.
>            */
>           arrayprop->offset = eltptr - (void *)obj;
> -        assert(qdev_get_prop_ptr(obj, arrayprop) == eltptr);
> +        assert(object_field_prop_ptr(obj, arrayprop) == eltptr);
>           object_property_add_field(obj, propname, arrayprop, op->allow_set);
>       }
>   }
> @@ -760,7 +760,7 @@ static void get_size(Object *obj, Visitor *v, const char *name, void *opaque,
>                        Error **errp)
>   {
>       Property *prop = opaque;
> -    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint64_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_size(v, name, ptr, errp);
>   }
> @@ -769,7 +769,7 @@ static void set_size(Object *obj, Visitor *v, const char *name, void *opaque,
>                        Error **errp)
>   {
>       Property *prop = opaque;
> -    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint64_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_size(v, name, ptr, errp);
>   }
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index 496e2c5801..fe47751df4 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -2344,7 +2344,7 @@ static void get_css_devid(Object *obj, Visitor *v, const char *name,
>                             void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    CssDevId *dev_id = qdev_get_prop_ptr(obj, prop);
> +    CssDevId *dev_id = object_field_prop_ptr(obj, prop);
>       char buffer[] = "xx.x.xxxx";
>       char *p = buffer;
>       int r;
> @@ -2373,7 +2373,7 @@ static void set_css_devid(Object *obj, Visitor *v, const char *name,
>                             void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    CssDevId *dev_id = qdev_get_prop_ptr(obj, prop);
> +    CssDevId *dev_id = object_field_prop_ptr(obj, prop);
>       char *str;
>       int num, n1, n2;
>       unsigned int cssid, ssid, devid;
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 54fac3851d..99b18d56ba 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -1323,7 +1323,7 @@ static void s390_pci_get_fid(Object *obj, Visitor *v, const char *name,
>                            void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> -    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_uint32(v, name, ptr, errp);
>   }
> @@ -1333,7 +1333,7 @@ static void s390_pci_set_fid(Object *obj, Visitor *v, const char *name,
>   {
>       S390PCIBusDevice *zpci = S390_PCI_DEVICE(obj);
>       Property *prop = opaque;
> -    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint32_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       if (!visit_type_uint32(v, name, ptr, errp)) {
>           return;
> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
> index 802979635c..fc8d63c850 100644
> --- a/hw/vfio/pci-quirks.c
> +++ b/hw/vfio/pci-quirks.c
> @@ -1489,7 +1489,7 @@ static void get_nv_gpudirect_clique_id(Object *obj, Visitor *v,
>                                          Error **errp)
>   {
>       Property *prop = opaque;
> -    uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint8_t *ptr = object_field_prop_ptr(obj, prop);
>   
>       visit_type_uint8(v, name, ptr, errp);
>   }
> @@ -1499,7 +1499,7 @@ static void set_nv_gpudirect_clique_id(Object *obj, Visitor *v,
>                                          Error **errp)
>   {
>       Property *prop = opaque;
> -    uint8_t value, *ptr = qdev_get_prop_ptr(obj, prop);
> +    uint8_t value, *ptr = object_field_prop_ptr(obj, prop);
>   
>       if (!visit_type_uint8(v, name, &value, errp)) {
>           return;



