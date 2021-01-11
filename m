Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 796842F107E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 11:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64763.114475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyum8-0001le-EL; Mon, 11 Jan 2021 10:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64763.114475; Mon, 11 Jan 2021 10:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyum8-0001lD-AO; Mon, 11 Jan 2021 10:50:16 +0000
Received: by outflank-mailman (input) for mailman id 64763;
 Mon, 11 Jan 2021 10:50:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ci+=GO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kyum6-0001l8-TQ
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 10:50:14 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45d698fa-34c0-4b8d-a8ec-e78a09279f76;
 Mon, 11 Jan 2021 10:50:12 +0000 (UTC)
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
X-Inumbo-ID: 45d698fa-34c0-4b8d-a8ec-e78a09279f76
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610362212;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xXU6ZvOrxc02Orilqf1Q4Vg6clX4gv2uRkjipCEhZhc=;
  b=CB3DclxSryLorkIS0yNCd0XGO542P9DOsVmNFqj1JO+osJsOK7qRv6kj
   WWTs972nvkEh60UZu/xB4O2G6awJuc3z/WR39oSVp9vK47WTlL/XLJ85T
   iGkiR35ed5MJyu3lSlSfDXfliO2tMQqTa3Z2D1pzaoHDBC438+EJ0WtGe
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ed0gKSu9H6oRElfQobDW0FrRsKzNwQia7Yaeb+5fFGpXz1muPr0tUQxsTaF6rDmvqipG+npKUo
 IfppnA0VRAGs2TXcSXLeZtZvjjlPdcmdCNxvAzbH9Zou6EaxyCOzW9L4xOr4uGX9gypMZcQG8d
 M1l/WGPGRpcM2/JswLp4WF5H1NosPsbbYl+E7hHSpdZPHRDpcMjCCS22fPHBpUpJ1hlUONmD7X
 e3XOiySHqPEDCcKjTeLVIASx4jwM95Ds9nCwmeiq7WbyJThK84wG+Kr08uPkk2lQDpXrDvPlp1
 M8M=
X-SBRS: 5.2
X-MesageID: 34854818
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="34854818"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGmLSEzGzu1pmO8KeW7L1VVVODvB1T3zySg0vlO48za2N0CROogMXBeLT7qUxPLsROrRrnRtSOJyXtFcHyv6rNvdm6B8Fit2tr86AO5Zs6uts3DJo2uc1z54Tsv2KfCCN5VIR9WyIDKuVb7r3KK6a5J9eMVDIL0+KFP2ER0gS0XQjQjzWB3m2x3PcXaxPr+16dTEc7zFM4wGM6eMOZ6mAiWAa6dWR4GIeeCkDi1qHdfKRwKvz8oP7GDeoUmoZTU+IhueC177ppWcmQEAawBDPR+M9wzyLFtqTd+tG4ZACRcNZwT0lGzRoLP7u4UREBp2p61XLol9E+zb5ASF6P34yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJM76eaGKONXGj0LDehZpAPv50J84xuS8wH4i6oJndw=;
 b=lCgirfqw0ZsWrxidJZkYnxZ4hbEyteSW96zDp0u7n9AExH2fMgPHSgqHU8iBVcE/1yASwBrG8uW9CYNx+/fDEkqj6OmIxqIn5FdDRM8Ofl5z4YhYzQT6IzDt37vqXa0+hifaDpGg7JrpuU8Cw0cf+LPxoduE+FYUInE52YtA/klawdOHcVE9lvd/oNc7CBsqQLG98pFA2NKZ+vFdppCAQXg+oT99bdQ/VgXbgVmCxqjaw61irMTM/nUh2E46OglZtU0Knfdy2fATqOenHZkZJvs1EtfzowCWaI6v6XJ/6RLt9C5q3sTHGBj9hPuci42vqZoqwnxplkAHgEzRxKOjig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJM76eaGKONXGj0LDehZpAPv50J84xuS8wH4i6oJndw=;
 b=FCV/kmaLH1CBRYKfupxBQKpub7Mt/taJuBEl3NSHNsPGCJ7+4o65TkKIJeFN8OLgtd0pDqI+agAyZKRSicibrv0iP7K/D+Fo6lt4CQ79afAYOBzBh1lr0B9b+I2dtFD1ItM7K+jbTqSBY7oQU1ebR5XCJI6MCnUgNQktjVB6Kq8=
Date: Mon, 11 Jan 2021 11:50:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@cam.ac.uk>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?=
	<michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2 05/11] tools/foreignmem: Support querying the size of
 a resource
Message-ID: <20210111105001.xioy763vaior5udg@Air-de-Roger>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-6-andrew.cooper3@citrix.com>
 <22be067c-1e6f-c87d-f910-ced27091a87a@cam.ac.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22be067c-1e6f-c87d-f910-ced27091a87a@cam.ac.uk>
X-ClientProxiedBy: MR2P264CA0145.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::8)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ef7e82e-40b7-4f59-2269-08d8b61ea82b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4396:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4396F18989DE66162E7A541A8FAB0@DM6PR03MB4396.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hLhMZSPBAfnSDbHwk5cuMBG+7MaV5isJaBvjxvhgDpebKMOl64hWcDoIUiLmXnyjFsMeoJf7KnJMC1S5rwIdU4VR4uihimupWD4tm4jGT2rIwoMAf8cwr5g4VdFY7oWbV7wTE43NMSQgZlWfeop/TebkaULOGtc0Oqra+lYlbN5zjbdBGoc+JyuSRNoNgl+s9pzr4ALLKSrA60VRP1bgGwMUNI1tmz9BjCl99HuCbj294bn9QhXsDVeUpWP5N67F54JGVIT0uLN7H2dTjLDHSCNH80vrLRq8Bzk9Xilb1OYEI4bI+s6d7MW5NNCEqDwqUFLQ7PIZvu5iBMJzp4X4QroM5nr98TfBZmjE42ZPJLSilubWVuPjaiPIiFTxvrZEAkBvJRH2phtXafMYoCUKXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(396003)(136003)(346002)(376002)(366004)(6496006)(66476007)(9686003)(54906003)(956004)(83380400001)(2906002)(8936002)(6666004)(1076003)(6916009)(53546011)(26005)(316002)(33716001)(8676002)(478600001)(5660300002)(16526019)(4326008)(66946007)(66556008)(186003)(6486002)(85182001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NkZ6Y3d4c2MzVjNRdEJHc09NL1NQNVJUUVBHY2JDcHdMeG9kVFkrVFdNMWNP?=
 =?utf-8?B?Z3JtdXQ5VnlqdUxmR2NqNjlXK3A0QTVpS0k0SURGdWNMeE9YQVFHY3YyOXJW?=
 =?utf-8?B?eXI4QllmbE9KT0tvTnhoMndvYVJTck4zVU4yN1dpZzgxSTBwQUpIUGNKVFZj?=
 =?utf-8?B?N1IvbGhRVDdBTCtld3BOU1MxbGkxNFhVYThueDNNd3g3a0k0bHhxYjJDdDJG?=
 =?utf-8?B?Y2sxRUtZYnBPVWQ3T3FaaUViSVJ3L1o0N3p2cVp5cEwva08zdFloaGxnN2U0?=
 =?utf-8?B?UFNwNktPc1JURzVHVlhWOWxkVkI1QzJRM21KOWJPZ2pwdmJIdC9RVEdjaHh0?=
 =?utf-8?B?TXJXMHIyNU90V3NrbS9IM1FBcm04UUNZZDdjQkxwTGpRdHE0VlAxZlJSTklV?=
 =?utf-8?B?WDJEaHdscDlqd2xkR2lHTEc2L0tpbHlOL1hpdlhiNlRMVGNaTXR5blNhYjVM?=
 =?utf-8?B?SmdkeWpmN0NxaWIzSXdiQmdLb25CSHYvbUZBdDE2bHU3ajc5YWhUTUoyb09n?=
 =?utf-8?B?WkFMbldYS2s3UUtQRGZJY1BmTmlWYUZsSkg1S3BNVnd2R1ZzclllOGlLQnhC?=
 =?utf-8?B?MTBIRk5oaUV0ZHBpM1JNY3JLL0dHQnZ4SlBRSkU1dVZSMFV5TVozRFRhaDRU?=
 =?utf-8?B?a09GSkxtYnYzblZCUmk0RmErMzdNNzdSNUdGclBPVU5pWnJmMHUvSldwVmRY?=
 =?utf-8?B?bFdvbEQzYWNNRTJKRWhOMTdIaG5RNldheXVQaW9TQldVSlZpNVNhRGRjZ3BR?=
 =?utf-8?B?U0pmbG5WV0x0WTdJSWJvNkprUDRHMnlkaUdmMklxRUpJeTBQOHV3SldGeDM3?=
 =?utf-8?B?TnBrL2E4MHdaYjQ2NGhyN09EZlVmTGFQMHRaTGc0dmJvajNCdCtXTlJuM2dx?=
 =?utf-8?B?bWJCcmFkVWNRM3gzTmlhNHpzaXRWK0hrOFRkeUVxcmpZMHU1MnQ5Q3JrNlla?=
 =?utf-8?B?bVhhbkpXN0M4NkczNDhSaGFsVytoYnhWcjRIWS9KOFhMUDVoWUNBeVRZVWVT?=
 =?utf-8?B?WTd3WFNBLysvZzNRdXc1aWNDdG55a0diV1JPclMvNnhTOFBWUXhETXdMeEhW?=
 =?utf-8?B?QnBBTk5yQUFEYVh4bk5SQllTWjhBOEQ4THdCN1FTazVxcmNVSWNJRTRNVGk5?=
 =?utf-8?B?QzdvZFp4UDByYVZXVGM5VVpQWUlydVJmZnB2THNwdzFlbnBIdWNaRkFCMGxC?=
 =?utf-8?B?aGZDczIzN1dFUi9BR2VvS21pblUxNHdOd2RxQzVSaG5HQkRTdGVMcUtDVnNM?=
 =?utf-8?B?YWlKYzI3UjVmTnBUU2Nsd2Q0VmlDOGVUUFYvZUc0UXp0cmErU3R5ekRUY3N0?=
 =?utf-8?Q?29FEu/4bX8N3UU9UN2IWr55tPn61fdW97/?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 10:50:05.8622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef7e82e-40b7-4f59-2269-08d8b61ea82b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJ6gBZUqPS2NxZUNW1iNDR+yu8XGPmPoGo/CAlfcEouQK8RX0fKerSUGxD0RDdi+W6O1994lAL8ZPN2HpTy6ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4396
X-OriginatorOrg: citrix.com

On Fri, Jan 08, 2021 at 05:52:36PM +0000, Andrew Cooper wrote:
> On 22/09/2020 19:24, Andrew Cooper wrote:
> > diff --git a/tools/libs/foreignmemory/linux.c b/tools/libs/foreignmemory/linux.c
> > index fe73d5ab72..eec089e232 100644
> > --- a/tools/libs/foreignmemory/linux.c
> > +++ b/tools/libs/foreignmemory/linux.c
> > @@ -339,6 +342,39 @@ int osdep_xenforeignmemory_map_resource(
> >      return 0;
> >  }
> >  
> > +int osdep_xenforeignmemory_resource_size(
> > +    xenforeignmemory_handle *fmem, domid_t domid, unsigned int type,
> > +    unsigned int id, unsigned long *nr_frames)
> > +{
> > +    int rc;
> > +    struct xen_mem_acquire_resource *xmar =
> > +        xencall_alloc_buffer(fmem->xcall, sizeof(*xmar));
> > +
> > +    if ( !xmar )
> > +    {
> > +        PERROR("Could not bounce memory for acquire_resource hypercall");
> > +        return -1;
> > +    }
> > +
> > +    *xmar = (struct xen_mem_acquire_resource){
> > +        .domid = domid,
> > +        .type = type,
> > +        .id = id,
> > +    };
> > +
> > +    rc = xencall2(fmem->xcall, __HYPERVISOR_memory_op,
> > +                  XENMEM_acquire_resource, (uintptr_t)xmar);
> > +    if ( rc )
> > +        goto out;
> > +
> > +    *nr_frames = xmar->nr_frames;
> > +
> > + out:
> > +    xencall_free_buffer(fmem->xcall, xmar);
> > +
> > +    return rc;
> > +}
> 
> Having talked this through with Roger, it's broken.
> 
> In the meantime, foreignmem has gained acquire_resource on FreeBSD.
> Nothing in this osdep function is linux-specific, so it oughtn't to be
> osdep.
> 
> However, its also not permitted to make hypercalls like this in
> restricted mode, and that isn't something we should be breaking. 
> Amongst other things, it will prevent us from supporting >128 cpus, as
> Qemu needs updating to use this interface in due course.
> 
> The only solution (which keeps restricted mode working) is to fix
> Linux's ioctl() to be able to understand size requests.  This also
> avoids foreignmem needing to open a xencall handle which was fugly in
> the first place.

I think the following patch should allow you to fetch the resource
size from Linux privcmd driver by doing an ioctl with addr = 0 and num
= 0. I've just build tested it, but I haven't tried exercising the
code.

Roger.
---8<---
From 5d717c7b9ad3561ed0b17e7c5cf76b7c9fb536db Mon Sep 17 00:00:00 2001
From: Roger Pau Monne <roger.pau@citrix.com>
Date: Mon, 11 Jan 2021 10:38:59 +0100
Subject: [PATCH] xen/privcmd: allow fetching resource sizes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow issuing an IOCTL_PRIVCMD_MMAP_RESOURCE ioctl with num = 0 and
addr = 0 in order to fetch the size of a specific resource.

Add a shortcut to the default map resource path, since fetching the
size requires no address to be passed in, and thus no VMA to setup.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
NB: fetching the size of a resource shouldn't trigger an hypercall
preemption, and hence I've dropped the preempt indications.
---
 drivers/xen/privcmd.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index b0c73c58f987..3278f93eb3da 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -717,7 +717,8 @@ static long privcmd_ioctl_restrict(struct file *file, void __user *udata)
 	return 0;
 }
 
-static long privcmd_ioctl_mmap_resource(struct file *file, void __user *udata)
+static long privcmd_ioctl_mmap_resource(struct file *file,
+				struct privcmd_mmap_resource __user *udata)
 {
 	struct privcmd_data *data = file->private_data;
 	struct mm_struct *mm = current->mm;
@@ -734,6 +735,19 @@ static long privcmd_ioctl_mmap_resource(struct file *file, void __user *udata)
 	if (data->domid != DOMID_INVALID && data->domid != kdata.dom)
 		return -EPERM;
 
+	memset(&xdata, 0, sizeof(xdata));
+
+	if (!kdata.addr && !kdata.num) {
+		/* Query the size of the resource. */
+		xdata.domid = kdata.dom;
+		xdata.type = kdata.type;
+		xdata.id = kdata.id;
+		rc = HYPERVISOR_memory_op(XENMEM_acquire_resource, &xdata);
+		if (rc)
+			return rc;
+		return __put_user(xdata.nr_frames, &udata->num);
+	}
+
 	mmap_write_lock(mm);
 
 	vma = find_vma(mm, kdata.addr);
@@ -768,7 +782,6 @@ static long privcmd_ioctl_mmap_resource(struct file *file, void __user *udata)
 	} else
 		vma->vm_private_data = PRIV_VMA_LOCKED;
 
-	memset(&xdata, 0, sizeof(xdata));
 	xdata.domid = kdata.dom;
 	xdata.type = kdata.type;
 	xdata.id = kdata.id;
-- 
2.29.2


