Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA357B29C55
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085649.1443953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvKA-00036y-C4; Mon, 18 Aug 2025 08:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085649.1443953; Mon, 18 Aug 2025 08:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvKA-00035V-9R; Mon, 18 Aug 2025 08:34:38 +0000
Received: by outflank-mailman (input) for mailman id 1085649;
 Mon, 18 Aug 2025 08:34:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKqL=26=oss.qualcomm.com=pratyush.brahma@srs-se1.protection.inumbo.net>)
 id 1unvK9-00035J-2A
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:34:37 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b76ee86-7c0e-11f0-a329-13f23c93f187;
 Mon, 18 Aug 2025 10:34:35 +0200 (CEST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7V4w9026361
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 08:34:34 GMT
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunr5m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 08:34:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2445805d386so41155905ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:34:34 -0700 (PDT)
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
X-Inumbo-ID: 2b76ee86-7c0e-11f0-a329-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YKnYr324eUUhj+QvrdVq/1e4Gz0w8e7EzwXqGsvWiSk=; b=Aze4Y5K8XQlzwnRF
	KS2Vkdxd7n2qp5VewK8A0a6hxTVqbzMOozD5we+cTVDCFI/JgzI4KiILotlO/UDT
	5nep91KwnnHHqgiAzY1H8M3CWe1zTEmZYyWHunj4Ox0D6WSd5grZgkLGRwPg1VDC
	AV7KF5nJZeWoctIPiE0ufDcHdCnyV7xMUGfrwbXbmIslahVPylvI9zmR1/9esOJY
	AFEx5vpmQjcRyyhWxPm+CoJZ5aqsnT0c5D/yh/yGTOu1npeEZWylk1LpzGMfAn+L
	zrROeF6fcgqEzADtHMgH4NoIVLArFoA6z69DOF0yue7AxwnGRTjpFvxh/tfVJGe1
	wi1rZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506073; x=1756110873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKnYr324eUUhj+QvrdVq/1e4Gz0w8e7EzwXqGsvWiSk=;
        b=rAefTKdjgLQpoAiwDbLvyHZBhwJkfiHkaYAjEvIlVmqDZ1H2kh66aQQ00JiGH+bIzx
         ZUXYG25nV20/rT+IQHLOiUVAg/v83HLa0rg050JN/+Kb6Ba7z9bkA8RvBgKEfElDLk0h
         KUFoFm5JQgTW4/9nANAlttGV8eso226ms3XFna9bNZNf4InwkJ9QuqOrXRGLtWiAl5h1
         zxUZKDUM/fSjXENSeEK7kqkBPI3uuuUy4BRqqP6LjCV6PIDe83M3u83slpyA0w5Vs4cD
         3U32HLev1sjxBDcO4unOR5dSSCo7Iv31ziRpReZZmQHLBoMYYvI8inaUPwArwBXIMfct
         4mJg==
X-Forwarded-Encrypted: i=1; AJvYcCX21Wv0cX/RdgxtuYpU5w8O21SvmWTExBuSL0rbyE+HqNwCoYW4BfG041mDhNvDg9nFdmJM2Lxomk0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwsOMJxpqRnsaKUcVd96LDvaCmka7XQCyYbESqCpfU7y9wBZ0u
	SLn4JRTyhzX1B3Ekmf2ITI/ySL/saElShII9A4VgZddvQIjJhT1ITvSdS/AzC2NOaSZ8ObJoqQl
	jX0rgDFy+fZianZJ/cBEx0MelQz+gT9r25Ne9KwwUuX08AhxM+cEI+oMR5IDXNKDno3ZlBv5hST
	L4HmQhXayJq1sOrFWQh08W5KpUvVv3gUAJ6SNh1SSzlKI1
X-Gm-Gg: ASbGnctNuvE6Xh0NMBxVaLmv+kxTK1LN7cM318BgTIbPU2/mi4YeJFYNl4Qz8H4V0KK
	43FcuYS8T8Dwp4ruuRgfPb6wkfqJK5adSai2ssoJP3/zGuLEWFeD1kgdyEDraLduspk8z5ctZPD
	dw0yLmC2yuYjpk0EjXZXxoeA==
X-Received: by 2002:a17:903:b07:b0:23d:fa76:5c3b with SMTP id d9443c01a7336-2446d745130mr162002055ad.22.1755506072928;
        Mon, 18 Aug 2025 01:34:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0iaKkOx5HF+G/2fDa+4Vn+rw7qYZXEvgZcGmIZ96t7UkZ4Y6iVl499qKwZ/lWHVbWQiw75ZkO9MQbjWLb6hM=
X-Received: by 2002:a17:903:b07:b0:23d:fa76:5c3b with SMTP id
 d9443c01a7336-2446d745130mr162001485ad.22.1755506072460; Mon, 18 Aug 2025
 01:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250818-numa_memblks-v1-1-9eb29ade560a@oss.qualcomm.com>
 <d7cdb65d-c241-478c-aa01-bc1a5f188e4f@redhat.com> <CALzOmR0C8BFY+-u-_aprVeAhq4uPOQa+f2L5m+yZH+=XZ2cv_w@mail.gmail.com>
 <63082884-1fe2-4740-8e6a-e1d06aa5e239@redhat.com>
In-Reply-To: <63082884-1fe2-4740-8e6a-e1d06aa5e239@redhat.com>
From: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 14:04:20 +0530
X-Gm-Features: Ac12FXzX5PzSlv6roYThUOo89xclaREe5qOUHnsYKt7fIrY-t8kJ9YEJL5m2flQ
Message-ID: <CALzOmR0MJv8EgPiFTvvbdkk8H_0BEDA4QQXKyqRPOCwwzGwjsw@mail.gmail.com>
Subject: Re: [PATCH] mm/numa: Rename memory_add_physaddr_to_nid to memory_get_phys_to_nid
To: David Hildenbrand <david@redhat.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
        Oscar Salvador <osalvador@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>,
        Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-acpi@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org,
        linux-cxl@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 0PggYd9rQg3QLmqxpyannjEkKd6qeAQE
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a2e59a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=AFlVVsuRyXfiT6IdkpsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX78rLrxAKSq8Y
 RkafkVqFGrLquNuumVXP5X3mi4jphYuYdWa/m3DAOCOZsqyBkXXGn13EuhePGf31CzOd+8qWP5p
 DqwDNFBJtXlo0yP+9qZKhartkfpuA20e0RjsXg9oF7ptj7r3mWAmbfJ33316gPUlWfyhR2i167C
 p31DhRQtDgcChHrdHnedHUj2qZBSEkiHWJCka/adlfJuXFQFycUs07z4P8sKWaC0Epg9vS5M8Dq
 vd4r1wIU93E9Da8tXsfkkwWc1+y7j2Ehw7kdQvZXW2ElxNNszvumzAy7nima3j0k647ZryicsJG
 t0MZA547Wkdvf/AndItGt7Ap7he4zwHu5uJc7gxTMKGm6QpK6NVBc15alVeN/OlUVIAuEWbTXSQ
 U1A5Vo77
X-Proofpoint-ORIG-GUID: 0PggYd9rQg3QLmqxpyannjEkKd6qeAQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071

On Mon, Aug 18, 2025 at 2:01=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 18.08.25 10:27, Pratyush Brahma wrote:
> > On Mon, Aug 18, 2025 at 12:29=E2=80=AFPM David Hildenbrand <david@redha=
t.com> wrote:
> >>
> >> On 18.08.25 08:41, pratyush.brahma@oss.qualcomm.com wrote:
> >>> From: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> >>>
> >>> The function `memory_add_physaddr_to_nid` seems a misnomer.
> >>> It does not to "add" a physical address to a NID mapping,
> >>> but rather it gets the NID associated with a given physical address.
> >>
> >> You probably misunderstood what the function is used for: memory hotpl=
ug
> >> aka "memory_add".
> > Thanks for your feedback. I get the part about memory hotplug here but
> > using memory_add still seems a little odd as it doesn't truly reflect
> > what this api is doing.
> > However, I agree that my current suggestion
> > may not be the perfect choice for the name, so I'm open to suggestions.
> >
> > Perhaps, something like "memory_add_get_nid_by_phys" may work here?
>
> I don't think this name is really any better and worth the churn :(
>
Sure. Thanks for taking a look. Will drop this.
> --
> Cheers
>
> David / dhildenb
>
Thanks & Regards
Pratyush

