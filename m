Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 014F129F88D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 23:44:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15226.38221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYGeS-00073A-VS; Thu, 29 Oct 2020 22:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15226.38221; Thu, 29 Oct 2020 22:44:12 +0000
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
	id 1kYGeS-00072l-SE; Thu, 29 Oct 2020 22:44:12 +0000
Received: by outflank-mailman (input) for mailman id 15226;
 Thu, 29 Oct 2020 22:44:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l48A=EE=linux.ibm.com=stefanb@srs-us1.protection.inumbo.net>)
 id 1kYGeS-00072f-1D
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 22:44:12 +0000
Received: from mx0b-001b2d01.pphosted.com (unknown [148.163.158.5])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa5dddcf-3114-49a4-b515-f46fb62b2cfb;
 Thu, 29 Oct 2020 22:44:10 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09TMWoFR105701; Thu, 29 Oct 2020 18:43:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fyx962g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 18:43:59 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09TMXnPI108232;
 Thu, 29 Oct 2020 18:43:59 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fyx962fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 18:43:59 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09TMhSNR019179;
 Thu, 29 Oct 2020 22:43:58 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 34e1gpax1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 22:43:58 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09TMhuBn42795512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Oct 2020 22:43:56 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64B0B78063;
 Thu, 29 Oct 2020 22:43:56 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C603578064;
 Thu, 29 Oct 2020 22:43:54 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 29 Oct 2020 22:43:54 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l48A=EE=linux.ibm.com=stefanb@srs-us1.protection.inumbo.net>)
	id 1kYGeS-00072f-1D
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 22:44:12 +0000
X-Inumbo-ID: fa5dddcf-3114-49a4-b515-f46fb62b2cfb
Received: from mx0b-001b2d01.pphosted.com (unknown [148.163.158.5])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fa5dddcf-3114-49a4-b515-f46fb62b2cfb;
	Thu, 29 Oct 2020 22:44:10 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09TMWoFR105701;
	Thu, 29 Oct 2020 18:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wIvAuR1n5JBSPhQ5ZuhQQ2WGTQ/wVeN+2RQNQwNlkcg=;
 b=oeGE8O/fIclNNn4JSLbiWEELlXBeaOEkppd9+xNSJs5lCN8o0DTYPykfZ3ripCOL5oep
 kTpaypQriNd1SIZjalT6wTu3rEP7Hu0AHvGXJCSfXk6WArW9hVCCBR4bK1BilUpnGjNO
 ObsozvBdYUFTb/IGO+NKXMuuVOOORI8LRbt8Ay/seQniRlPOLM0XzLZ/ozghPhRdWctY
 IcqyQJ1Wd7bc838+W8yH+c3OvXzX2FtlAGavlp+Mqe6IpXhBXKEuH1AfQVtykC4uFVy0
 IRZKhIvJJh9Z20+XIWB/D9De1SACwOkxyZ+FjFR8H95w0yVGqcuHig27uVaVwV6R5PHN TA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 34fyx962g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2020 18:43:59 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09TMXnPI108232;
	Thu, 29 Oct 2020 18:43:59 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com with ESMTP id 34fyx962fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2020 18:43:59 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09TMhSNR019179;
	Thu, 29 Oct 2020 22:43:58 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma02dal.us.ibm.com with ESMTP id 34e1gpax1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2020 22:43:58 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 09TMhuBn42795512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Oct 2020 22:43:56 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64B0B78063;
	Thu, 29 Oct 2020 22:43:56 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C603578064;
	Thu, 29 Oct 2020 22:43:54 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 29 Oct 2020 22:43:54 +0000 (GMT)
Subject: Re: [PATCH 14/36] qdev: Move dev->realized check to
 qdev_property_set()
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
        Eric Blake <eblake@redhat.com>,
        "Daniel P. Berrange" <berrange@redhat.com>,
        Markus Armbruster <armbru@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>,
        Max Reitz <mreitz@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>,
        David Hildenbrand <david@redhat.com>,
        Matthew Rosato
 <mjrosato@linux.ibm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>, xen-devel@lists.xenproject.org,
        qemu-block@nongnu.org, qemu-s390x@nongnu.org
References: <20201029220246.472693-1-ehabkost@redhat.com>
 <20201029220246.472693-15-ehabkost@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <4d1f56fe-c213-0967-2828-8f6a34e02ce5@linux.ibm.com>
Date: Thu, 29 Oct 2020 18:43:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201029220246.472693-15-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-29_12:2020-10-29,2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290150

On 10/29/20 6:02 PM, Eduardo Habkost wrote:
> Every single qdev property setter function manually checks
> dev->realized.  We can just check dev->realized inside
> qdev_property_set() instead.
>
> The check is being added as a separate function
> (qdev_prop_allow_set()) because it will become a callback later.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by:  Stefan Berger <stefanb@linux.ibm.com>


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
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Matthew Rosato <mjrosato@linux.ibm.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: qemu-devel@nongnu.org
> Cc: xen-devel@lists.xenproject.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> ---
>   backends/tpm/tpm_util.c          |   6 --
>   hw/block/xen-block.c             |   5 --
>   hw/core/qdev-properties-system.c |  64 -------------------
>   hw/core/qdev-properties.c        | 106 ++++++-------------------------
>   hw/s390x/css.c                   |   6 --
>   hw/s390x/s390-pci-bus.c          |   6 --
>   hw/vfio/pci-quirks.c             |   6 --
>   target/sparc/cpu.c               |   6 --
>   8 files changed, 18 insertions(+), 187 deletions(-)
>
> diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
> index e91c21dd4a..042cacfcca 100644
> --- a/backends/tpm/tpm_util.c
> +++ b/backends/tpm/tpm_util.c
> @@ -46,16 +46,10 @@ static void get_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
>   static void set_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
>                       Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       TPMBackend *s, **be = qdev_get_prop_ptr(obj, prop);
>       char *str;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_str(v, name, &str, errp)) {
>           return;
>       }
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index 1ba9981c08..bd1aef63a7 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -400,11 +400,6 @@ static void xen_block_set_vdev(Object *obj, Visitor *v, const char *name,
>       char *str, *p;
>       const char *end;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_str(v, name, &str, errp)) {
>           return;
>       }
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index fca1b694ca..60a45f5620 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -92,11 +92,6 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
>       bool blk_created = false;
>       int ret;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_str(v, name, &str, errp)) {
>           return;
>       }
> @@ -228,17 +223,11 @@ static void get_chr(Object *obj, Visitor *v, const char *name, void *opaque,
>   static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
>                       Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       CharBackend *be = qdev_get_prop_ptr(obj, prop);
>       Chardev *s;
>       char *str;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_str(v, name, &str, errp)) {
>           return;
>       }
> @@ -309,18 +298,12 @@ static void get_mac(Object *obj, Visitor *v, const char *name, void *opaque,
>   static void set_mac(Object *obj, Visitor *v, const char *name, void *opaque,
>                       Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       MACAddr *mac = qdev_get_prop_ptr(obj, prop);
>       int i, pos;
>       char *str;
>       const char *p;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_str(v, name, &str, errp)) {
>           return;
>       }
> @@ -388,7 +371,6 @@ static void get_netdev(Object *obj, Visitor *v, const char *name,
>   static void set_netdev(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       NICPeers *peers_ptr = qdev_get_prop_ptr(obj, prop);
>       NetClientState **ncs = peers_ptr->ncs;
> @@ -396,11 +378,6 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
>       int queues, err = 0, i = 0;
>       char *str;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_str(v, name, &str, errp)) {
>           return;
>       }
> @@ -467,18 +444,12 @@ static void get_audiodev(Object *obj, Visitor *v, const char* name,
>   static void set_audiodev(Object *obj, Visitor *v, const char* name,
>                            void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       QEMUSoundCard *card = qdev_get_prop_ptr(obj, prop);
>       AudioState *state;
>       int err = 0;
>       char *str;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_str(v, name, &str, errp)) {
>           return;
>       }
> @@ -580,11 +551,6 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
>       uint64_t value;
>       Error *local_err = NULL;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_size(v, name, &value, errp)) {
>           return;
>       }
> @@ -684,7 +650,6 @@ static void get_reserved_region(Object *obj, Visitor *v, const char *name,
>   static void set_reserved_region(Object *obj, Visitor *v, const char *name,
>                                   void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       ReservedRegion *rr = qdev_get_prop_ptr(obj, prop);
>       Error *local_err = NULL;
> @@ -692,11 +657,6 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
>       char *str;
>       int ret;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       visit_type_str(v, name, &str, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);
> @@ -752,17 +712,11 @@ const PropertyInfo qdev_prop_reserved_region = {
>   static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
>                             void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       int32_t value, *ptr = qdev_get_prop_ptr(obj, prop);
>       unsigned int slot, fn, n;
>       char *str;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_str(v, name, &str, NULL)) {
>           if (!visit_type_int32(v, name, &value, errp)) {
>               return;
> @@ -846,7 +800,6 @@ static void get_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>   static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>                                    void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       PCIHostDeviceAddress *addr = qdev_get_prop_ptr(obj, prop);
>       char *str, *p;
> @@ -855,11 +808,6 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>       unsigned long dom = 0, bus = 0;
>       unsigned int slot = 0, func = 0;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_str(v, name, &str, errp)) {
>           return;
>       }
> @@ -969,16 +917,10 @@ static void get_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
>   static void set_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
>                                      void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       PCIExpLinkSpeed *p = qdev_get_prop_ptr(obj, prop);
>       int speed;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_enum(v, prop->name, &speed, prop->info->enum_table,
>                            errp)) {
>           return;
> @@ -1054,16 +996,10 @@ static void get_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
>   static void set_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
>                                      void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       PCIExpLinkWidth *p = qdev_get_prop_ptr(obj, prop);
>       int width;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_enum(v, prop->name, &width, prop->info->enum_table,
>                            errp)) {
>           return;
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index aab9e65e97..195bfed6e1 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -25,6 +25,19 @@ void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
>       }
>   }
>
> +/* returns: true if property is allowed to be set, false otherwise */
> +static bool qdev_prop_allow_set(Object *obj, const char *name,
> +                                Error **errp)
> +{
> +    DeviceState *dev = DEVICE(obj);
> +
> +    if (dev->realized) {
> +        qdev_prop_set_after_realize(dev, name, errp);
> +        return false;
> +    }
> +    return true;
> +}
> +
>   void qdev_prop_allow_set_link_before_realize(const Object *obj,
>                                                const char *name,
>                                                Object *val, Error **errp)
> @@ -66,6 +79,11 @@ static void static_prop_set(Object *obj, Visitor *v, const char *name,
>                               void *opaque, Error **errp)
>   {
>       Property *prop = opaque;
> +
> +    if (!qdev_prop_allow_set(obj, name, errp)) {
> +        return;
> +    }
> +
>       return prop->info->set(obj, v, name, opaque, errp);
>   }
>
> @@ -91,15 +109,9 @@ void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
>   void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
>                               void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       int *ptr = qdev_get_prop_ptr(obj, prop);
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       visit_type_enum(v, prop->name, ptr, prop->info->enum_table, errp);
>   }
>
> @@ -149,15 +161,9 @@ static void prop_get_bit(Object *obj, Visitor *v, const char *name,
>   static void prop_set_bit(Object *obj, Visitor *v, const char *name,
>                            void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       bool value;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_bool(v, name, &value, errp)) {
>           return;
>       }
> @@ -209,15 +215,9 @@ static void prop_get_bit64(Object *obj, Visitor *v, const char *name,
>   static void prop_set_bit64(Object *obj, Visitor *v, const char *name,
>                              void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       bool value;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_bool(v, name, &value, errp)) {
>           return;
>       }
> @@ -246,15 +246,9 @@ static void get_bool(Object *obj, Visitor *v, const char *name, void *opaque,
>   static void set_bool(Object *obj, Visitor *v, const char *name, void *opaque,
>                        Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       bool *ptr = qdev_get_prop_ptr(obj, prop);
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       visit_type_bool(v, name, ptr, errp);
>   }
>
> @@ -279,15 +273,9 @@ static void get_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
>   static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
>                         Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       visit_type_uint8(v, name, ptr, errp);
>   }
>
> @@ -324,15 +312,9 @@ void qdev_propinfo_get_uint16(Object *obj, Visitor *v, const char *name,
>   static void set_uint16(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       uint16_t *ptr = qdev_get_prop_ptr(obj, prop);
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       visit_type_uint16(v, name, ptr, errp);
>   }
>
> @@ -357,15 +339,9 @@ static void get_uint32(Object *obj, Visitor *v, const char *name,
>   static void set_uint32(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       visit_type_uint32(v, name, ptr, errp);
>   }
>
> @@ -381,15 +357,9 @@ void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
>   static void set_int32(Object *obj, Visitor *v, const char *name, void *opaque,
>                         Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       int32_t *ptr = qdev_get_prop_ptr(obj, prop);
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       visit_type_int32(v, name, ptr, errp);
>   }
>
> @@ -421,15 +391,9 @@ static void get_uint64(Object *obj, Visitor *v, const char *name,
>   static void set_uint64(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       visit_type_uint64(v, name, ptr, errp);
>   }
>
> @@ -445,15 +409,9 @@ static void get_int64(Object *obj, Visitor *v, const char *name,
>   static void set_int64(Object *obj, Visitor *v, const char *name,
>                         void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       int64_t *ptr = qdev_get_prop_ptr(obj, prop);
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       visit_type_int64(v, name, ptr, errp);
>   }
>
> @@ -496,16 +454,10 @@ static void get_string(Object *obj, Visitor *v, const char *name,
>   static void set_string(Object *obj, Visitor *v, const char *name,
>                          void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       char **ptr = qdev_get_prop_ptr(obj, prop);
>       char *str;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_str(v, name, &str, errp)) {
>           return;
>       }
> @@ -546,16 +498,10 @@ void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
>   static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
>                          Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
>       uint64_t value;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_size(v, name, &value, errp)) {
>           return;
>       }
> @@ -598,16 +544,10 @@ static void get_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
>   static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
>                       Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
>       char *str;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_str(v, name, &str, errp)) {
>           return;
>       }
> @@ -678,10 +618,6 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
>       const char *arrayname;
>       int i;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
>       if (*alenptr) {
>           error_setg(errp, "array size property %s may not be set more than once",
>                      name);
> @@ -921,15 +857,9 @@ static void get_size(Object *obj, Visitor *v, const char *name, void *opaque,
>   static void set_size(Object *obj, Visitor *v, const char *name, void *opaque,
>                        Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       visit_type_size(v, name, ptr, errp);
>   }
>
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index 38fd46b9a9..46cab94e2b 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -2372,18 +2372,12 @@ static void get_css_devid(Object *obj, Visitor *v, const char *name,
>   static void set_css_devid(Object *obj, Visitor *v, const char *name,
>                             void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       CssDevId *dev_id = qdev_get_prop_ptr(obj, prop);
>       char *str;
>       int num, n1, n2;
>       unsigned int cssid, ssid, devid;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_str(v, name, &str, errp)) {
>           return;
>       }
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index b59cf0651a..d02e93a192 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -1256,16 +1256,10 @@ static void s390_pci_get_fid(Object *obj, Visitor *v, const char *name,
>   static void s390_pci_set_fid(Object *obj, Visitor *v, const char *name,
>                            void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       S390PCIBusDevice *zpci = S390_PCI_DEVICE(obj);
>       Property *prop = opaque;
>       uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_uint32(v, name, ptr, errp)) {
>           return;
>       }
> diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
> index 53569925a2..802979635c 100644
> --- a/hw/vfio/pci-quirks.c
> +++ b/hw/vfio/pci-quirks.c
> @@ -1498,15 +1498,9 @@ static void set_nv_gpudirect_clique_id(Object *obj, Visitor *v,
>                                          const char *name, void *opaque,
>                                          Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       Property *prop = opaque;
>       uint8_t value, *ptr = qdev_get_prop_ptr(obj, prop);
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_uint8(v, name, &value, errp)) {
>           return;
>       }
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 8ecb20e55f..cf21efd85f 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -798,17 +798,11 @@ static void sparc_get_nwindows(Object *obj, Visitor *v, const char *name,
>   static void sparc_set_nwindows(Object *obj, Visitor *v, const char *name,
>                                  void *opaque, Error **errp)
>   {
> -    DeviceState *dev = DEVICE(obj);
>       const int64_t min = MIN_NWINDOWS;
>       const int64_t max = MAX_NWINDOWS;
>       SPARCCPU *cpu = SPARC_CPU(obj);
>       int64_t value;
>
> -    if (dev->realized) {
> -        qdev_prop_set_after_realize(dev, name, errp);
> -        return;
> -    }
> -
>       if (!visit_type_int(v, name, &value, errp)) {
>           return;
>       }



