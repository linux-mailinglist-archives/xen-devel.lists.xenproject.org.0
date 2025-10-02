Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD6CBB424C
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 16:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135916.1472840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Jzf-0004XM-9l; Thu, 02 Oct 2025 14:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135916.1472840; Thu, 02 Oct 2025 14:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Jzf-0004Uy-6k; Thu, 02 Oct 2025 14:09:15 +0000
Received: by outflank-mailman (input) for mailman id 1135916;
 Thu, 02 Oct 2025 14:09:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VSxO=4L=linux.ibm.com=farman@srs-se1.protection.inumbo.net>)
 id 1v4Jzd-0004Us-Fe
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 14:09:13 +0000
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e06fd94-9f99-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 16:09:11 +0200 (CEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592DcqA9018505;
 Thu, 2 Oct 2025 14:09:09 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e6bhvx26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Oct 2025 14:09:09 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5929m9CD007292;
 Thu, 2 Oct 2025 14:09:08 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49eurk66sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Oct 2025 14:09:08 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 592E97FB23855854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Oct 2025 14:09:07 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A14AC58053;
 Thu,  2 Oct 2025 14:09:07 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1371158043;
 Thu,  2 Oct 2025 14:09:06 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.61.134.141]) by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Oct 2025 14:09:05 +0000 (GMT)
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
X-Inumbo-ID: 5e06fd94-9f99-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=IvLoj8
	f/uaT6vb3usKUYhawAOTd750whQ4Az1PbiH24=; b=rk6T7knnIq2lEBmbBAJw2c
	9ck6wOX6+dSAZ1mz/eTDesKeIKXTvI5A6X016FABrEMYVM5AzO82QHkOJIB1tVn4
	hJDhNp2mmsWPF7Dz4PpyWjaZ37aaxztfrVgKY3BgC8NN0UExGZLzoxc3Zw+Bxhrt
	0T5woftfwoqzR/8O44JKDVltvwY0KvgnWiPDvLp8jv5vgGL9A149BkPScFQCrXS6
	5fpNhluH7QuUN9KaEhV6d+IouTBBQYoMhcTpqsNpmf/w+B063B5qLUeqpos8EpRJ
	Iezb8bpcSR7MkaUmfyRVZ+eXjJQxMs3U4UNAH3ThezmBZM4EbGZ0jlP/6tu+8IHA
	==
Message-ID: <00c873bc92ebbc13413c8f236ed3eaa0bd7c98bb.camel@linux.ibm.com>
Subject: Re: [PATCH v4 07/17] hw/s390x/sclp: Replace [cpu_physical_memory ->
 address_space]_r/w()
From: Eric Farman <farman@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
        Thomas Huth <thuth@redhat.com>,
        Richard
 Henderson <richard.henderson@linaro.org>,
        Halil Pasic	
 <pasic@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Matthew Rosato
 <mjrosato@linux.ibm.com>,
        David Hildenbrand	 <david@redhat.com>,
        Ilya
 Leoshkevich <iii@linux.ibm.com>
Date: Thu, 02 Oct 2025 10:09:05 -0400
In-Reply-To: <20251002084203.63899-8-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
	 <20251002084203.63899-8-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Se/6t/Ru c=1 sm=1 tr=0 ts=68de8785 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8
 a=VnNF1IyMAAAA:8 a=nq8n1J83xunWhl9p0hoA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxMCBTYWx0ZWRfX39RhvSZB/gEw
 fSRHuBwOdxuPFd7OlaeTzHF/Nb+cKAR9udZB/zGx2iD4cQnpJQcXJQBQWGuia/xZvDJ9pxgerqG
 eFJ03+dNfvdgD9SrzbhneaThs1kybjmf2X8pvLccB2gqCFj2cpNn50xzs3YcTVZ53mzFMycFi13
 w3f5l8sQ4vGjMxiA3tDur41+reA/5qbD/wQL86ZGeofjlyUfva9IUPjwNJajtg+S3A4Nesa1VrV
 iTeVKLL6/U42HyhWqMDLEfwyMbB2H0MG00wwNQ3T8oiwnQjHyax8s5d6P1hHCA5X1RksMgmbbBF
 F6EpivV6k015dMg+arrtgZwFW9b100QiL5fZh1C2vswTWV5ABQfH1uBbkK4ySENU+94O9KAHACJ
 m9XEmZTAubBVaAVQJAhB1GgJrWI+mA==
X-Proofpoint-GUID: uZbYcs5fD30pLPjF7MCuOSROuWpRsdRB
X-Proofpoint-ORIG-GUID: uZbYcs5fD30pLPjF7MCuOSROuWpRsdRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270010

On Thu, 2025-10-02 at 10:41 +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> cpu_physical_memory_read() and cpu_physical_memory_write() are
> legacy (see commit b7ecba0f6f6), replace by address_space_read()
> and address_space_write().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/s390x/sclp.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>

