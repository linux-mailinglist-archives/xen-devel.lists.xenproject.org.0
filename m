Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B44700C4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 13:36:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243805.421855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvf7R-0004Qj-Jz; Fri, 10 Dec 2021 12:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243805.421855; Fri, 10 Dec 2021 12:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvf7R-0004OV-F8; Fri, 10 Dec 2021 12:35:21 +0000
Received: by outflank-mailman (input) for mailman id 243805;
 Fri, 10 Dec 2021 12:35:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/FQ=Q3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mvf7Q-0004OP-N9
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 12:35:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1042db5-59b5-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 13:35:18 +0100 (CET)
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
X-Inumbo-ID: a1042db5-59b5-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639139718;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Rdn+zmvZ51XAp/sMu8W8RvGtHBxl32cTDbJakM2zqPE=;
  b=E14ySr2GYnO3jePu6Z6w+f03lfULbDlT4pqsn1csxGE27S1w+3pKOvUF
   xKpqMLktfZYpx1Hjnd2GUe78jQeSGqP+aZJSGZiNmcJZIF3/t7DhYo2S2
   wT9KdLvttNt2f9TtWI3OdPjtyriogz6s2NSXD99QpMqHhJfixRNWFHN+6
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IUmUWG1Yo4blDtjrmEJzQArDUjSTR6OtsFve+3JD7R1FXP39wZpp0W8LJcaS8XSLfaeMtEg09R
 hssCb5Lh5IPrQESqtefIiUGPxug4PtWFGA/5ciKezelDNzLGD+K8m+wvgAETucx/+Z2ijc9M5H
 ZXnjPJkV3NYMJy9xLHK+L2+RWl9stBGkRJtQv9rFghbo0qwyRTkLGr+LNbKWAB8InVbc8vSei4
 NEjbAW/CibXH94FVemjgredfd1fUmdviN0BiaNp6CSq7Mcywmk3AUlDxtu+Rqw8jlLFE846f8T
 qrCYN8bGjW4qtayXRdn6M6w2
X-SBRS: 5.1
X-MesageID: 61794647
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5RizUqALfL0ArBVW/8vkw5YqxClBgxIJ4kV8jS/XYbTApGgmgmZRx
 mFKCz+Ba/yIYGv2eoolad/n8EIF6MXVnYQwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+EX570Eo7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/2x6rztZtx
 Mlxq8KMVgoqYr30yKcsakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHfyVtIMGgGhYasZmIKn1O
 41IahZVXDPbWzNlJ21GVLEFg7L97pX4W2IB8w/EzUYt2EDLxRF1+KjgNpzSYNPibdpRtlaVo
 CTB5WuRKhMQOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO70RylCL1qbI3xjHOncJTWJRUIxlhfZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQizARVodt/xory9U
 J4swZD2AAcmV87lqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkyY55bJGO3O
 B6P4Wu9AaO/2lPwNcebhKrrVKwXIVXIT4y5Bpg4kPIQCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLq9NOdg5TciBgbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3QApy6QL+wD5t5s1whOikgYQSh13Q5ON7956YDbZonO7Ig8bU7n/JzS
 vAEfeSGA+hOFWubq2hMM8GlodwwbgmviCKPIzGhPGo1cal/SlGb4dTjZAbuqnUDV3Llqcskr
 rS8/QrHWp5fFR96BcPbZav3nVO8tHQQgsxoWE7MLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94rwSrlwBEtXGWXf/I2aDyiC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYln3WLNtJn6KgZtGuqFXn+ILvAK3X
 gSE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6rOidTEFfHxiQkygMfrJ6PbQsz
 folpMNLuRe0jQAnM4regy1Zn4hWwqfsj0nzWkkmPbLW
IronPort-HdrOrdr: A9a23:ZD15lK/RheXfqOpp/m9uk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,195,1635220800"; 
   d="scan'208";a="61794647"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCum0UgIS755D20Vayy4Z5Q+A0Kaj1HvhNQAggtuZXQ5nkhX0u7x4wtna4+XkVWx8vgDOvoDN9TXqgsWKvj231oZRyiTSv62nC38mjvYfCGfiH+kBGFl+YjJojni4/TBTnITGwRKy6MVAnrtZb0+89nX24tMADuqutDfYCyTFfYrEKJgbt/i4V6F+N0ij+Nomgyy78vJ280Iiu28dH3u7OGQi7mEsTlwZhB3hnt20vW7Fi31eFrPfAekH0btdiWLO+rYWVVHMw2AbUgTAjVJcAghSFG6DE03MpJtvWnLGGPcuoctk6mmIIbbayImbW57PXqOdwCwbMATWWzY5P0q7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNiZ04hkOWOqIXNWIUGrwx3nRSkzSkJgzizKF5BZHc4=;
 b=cYMDMKHJDgegUAyDwBFTDDalvOLt7sPX8bZfH8gaGhfWhQFCFXk8lPpip8ajCs1nXPTkCY3IQGlv190HMJnvO5j2aq6rYUbqlUuSAnk+goKGsPoYg2hAWrjFGuKVsQ6fkTYFtnG1gXTRprFSO0qNc5b9MwU+JDUouSiZ8qQETgJMDapmArDyWzV13QKwR1PK/E+w5LcyO+4unA/l5fZqeMQECG6I51FipEA0jx0Q+P+4/7kIRZOfgc4Ck8cTSkVOmCkO3OJy1C4u+FkiHnfbc1tW+1++OhMGmKk4HRpyd97dYal7HR+m2nozFxf1gL0zYjrYzHldxmOH3jBJMqRCHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNiZ04hkOWOqIXNWIUGrwx3nRSkzSkJgzizKF5BZHc4=;
 b=xbXIUzIGAkL98crK/DFL2VXHT+3nmKc0E5tg6kB1OuffVYFUEeJrYC1hvBExT0mriae790zF+CTH+va/fVqidak5uUWyS+22S9nVTA5C0VTBLNzgd+XTGyZuCQnILlBSgm7udOALWXp/RjiqYO1eAjEhHA+CDcuHtl2eQidIaUk=
Date: Fri, 10 Dec 2021 13:35:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 07/18] IOMMU/x86: perform PV Dom0 mappings in batches
Message-ID: <YbNJeFAxJDpAyi44@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <cc183d61-f4ed-1cf5-185b-0673c9927892@suse.com>
 <YajTvrZz0xGOR3vT@Air-de-Roger>
 <2a3a0a37-525d-e2aa-b396-b01d97434d56@suse.com>
 <YbMfnFWIlSN+GXH9@Air-de-Roger>
 <ad9d298a-62c6-bde1-ea42-698ebd1a7f10@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad9d298a-62c6-bde1-ea42-698ebd1a7f10@suse.com>
X-ClientProxiedBy: MR2P264CA0155.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af9a9abb-2273-48b4-69a3-08d9bbd98156
X-MS-TrafficTypeDiagnostic: DM6PR03MB4537:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB45377803AAE800BAB1C31E5D8F719@DM6PR03MB4537.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QeQu+qlTKaa30wJWNR4cpoBG7p3kwFebFc2b7TAhIEDuMH/J64LgilXTatlw9Kwi91XZ9wseUWH3nYNf0XMGwH2GrhbSx/9FaQA5luB+Elu7bX2UwVYOXj0jT8TB+p1PdHsSFLpuyg/guw/odOScXKkNJlrsk2d0+E8spKVocxeOBHwVgPDNj2wrMLPgbgmSP7cgyUH96Ucv6lPdaMPgnAsYSzwvgbSgX6NyzKgrYEWH72NeawSDUBX+XDWC2GS71gbNvMAwaKulXZM7k5+laumm4aDqIfZwGQnnAUlJDpbfERKUMlrJQ8Kt0Tl+oHLWPNcigwrEPydSPShhhjvHP887VPjzT2CgFQYOsHsM1jFfnKG6ah7O2+r0g/3io3hd6tQMbF15ykyi2rRj7A/rqR4BpMLdGWVQ+gZYRna393kt3zqeayaV3dG/1MQqp+4YdzpHuDS7hJxapund+nOfgdFFhBCIhoP0tv0L3qVEvj+t4Q5WY4Yig1d37aFVgoC23EpRBPf8K6YFoR4pu3b7Jj21dBZZHUtGSNJbA7Z5WHPTO5za4zvbEvke1RYpk+9BlFYUYUtPVGj2MAEoUblbfWVbD9eB9GRALZWpAa3dHdY0gpFpKS0qCqRlWl+IVybkz7OMji5sA4ZzjKhvgDfORQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6496006)(6666004)(9686003)(86362001)(6916009)(6486002)(2906002)(66946007)(85182001)(66556008)(66476007)(508600001)(5660300002)(316002)(53546011)(33716001)(4326008)(83380400001)(38100700002)(26005)(956004)(82960400001)(54906003)(186003)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGdmWmZWRDhvR1ZPZXhBdHB4N0dXL1JVaHBqTmpRYmpRbEN6TDZrbEU5VUxK?=
 =?utf-8?B?NC9FaHJyTytsZUVka0d1elhsdWZyUWVFMXVncW1ZOGdla0hEdVA1V25oUjl5?=
 =?utf-8?B?dUdOK2JKZGgzdy95TklMS1l5L3E0cEdtcG4rbHh3bVp0RGp3Z2ZOVFRvMGZt?=
 =?utf-8?B?YlVuWkhQR3JWT3NrOFlRUWNCQ1l1R2xZVVk0Ym12aXZIa3FwUHhiNGdLZXpB?=
 =?utf-8?B?T2VGOTV4YWl0MjdITDJ0SUVwcDgxMXZBRVRiZVhQVXJLNEdPbzl1SmxXUXhs?=
 =?utf-8?B?NUhIOEJ3cVBsQWhITXB0U08xYUVpaGtTeWVOR2ZubkQ0U2xlOE5qckhYNWYz?=
 =?utf-8?B?TmM1RjFmZXMwWlJodEE0Wlh1RlJPOWZkdVBjY3FieHVsNHR5V2JFWjJuMEhN?=
 =?utf-8?B?bE1lSW0zdHVXRjZuakpyR3Z4Tjd5RjNVVFpmMS9PcGtEdnovQ3daMDZYYUZU?=
 =?utf-8?B?SnhaSlFLRDVrVERRMHFHVU1ucmZHNlpKRDJCQ3dvWUxqcUpRZEZzWWhnbTdp?=
 =?utf-8?B?eVVVWUZGMWlPQVptYTZxOEZveGVRL1k5TXlLYzVKNHNRU3U1TGFTK0xzRDBT?=
 =?utf-8?B?Z1VLeXlNbkxLcXZlMUlXekJPS2xmSEdYSkRrMmR3LzRoQjlFYU1aVUhVVUFs?=
 =?utf-8?B?RUhBVlpxMTJuR2RHU01OZnlEM0YxNzczMHRHYVZpOTBSeGE1WkZqN25KMWo3?=
 =?utf-8?B?RTQ3dVBCL3M5MWNZMUNrcVFkQTh3b0xMZlEyQUZHT0JXT2syeFk3alQ5VkZ0?=
 =?utf-8?B?TGVGeEFWeE50dURaUHRaWGpvQmRHclEwdm9WQUNiL0RvMnhrc0FsVktYL3ZC?=
 =?utf-8?B?UXBuY1hBK2N6bGZnKzNVR3hLdmM0SzFseWsrSVJDT2NFa1A5NGlHcFl1Q0t1?=
 =?utf-8?B?ZXJnU0xObDVrRWJrbTgrdXBZTy9RdnpPWlNZMmJRdUt6S2N5aWZJWmhlc2tJ?=
 =?utf-8?B?SlNMOUw0eisxWkxFbE9zYlRDZlNibkVONCs4TkFUUUQxVHQxZnk2MlZidFJh?=
 =?utf-8?B?WkIxdWZCWEZoRk85RzkyOWM4ZmUrTmxDUVBCZW9vazdwUmt1V1JUVzN5bDN4?=
 =?utf-8?B?SG91a1pJNGJDQ1UySC9IU0VBR1JaZDg2b3p1eFZiWUxIQWhPL2l1aGVmYlpw?=
 =?utf-8?B?Um5vd0YxY2U2bTgyeGk4Zi9mM2JLKzErQkJqRS9xeDczNzZ1ZFJyazdWczVR?=
 =?utf-8?B?TzQyaWFEMmlPc3FaSW16RG9ubmgyTnB6N0VBYjdyaFFWR0V1Q3VBNEsrcm13?=
 =?utf-8?B?aTdGeHBweDlmQ2JqYlp6cHN6YTdzdmt6VUk2ZkVBaEZtRFJyOEh1RWY2aVBP?=
 =?utf-8?B?M2V6YjgzRVpHaXpaZHFQQ1dpUzIwUGgvQVBjdnhMSTVoQStOaktEUE42ajNo?=
 =?utf-8?B?bHdrSkhYZ3JWRlZST2tSODRNQVVRWnJqSW1wN3F6eEFjbGIvWGc4UWpQN004?=
 =?utf-8?B?cnBvZm9lTnFwYkNrbkJ1MmlGd1BZTERNVUVQT1k0K1NtdWV4R255a2dpaTM2?=
 =?utf-8?B?TEtGZlp2ZE5iL3d2bGJYT2RQTWNnMDFNZTJnZmpEZ0lpVU5udDdqVVpuLzRs?=
 =?utf-8?B?eEdJT0I3MkkxUjBpR0l6bXR2YlAwL3FreVY4V1dsVDhtMWpYQ3BjR0Q4ZVlr?=
 =?utf-8?B?NXlaV0FqVmMzUFZRR0wvQzNEcDFZQVF2UURteFhpVDhBT0pXd29JcXE3Zm85?=
 =?utf-8?B?UWduMDB5ZklyS3d6ZjZPMmRhTkx3Y1dvejVhbkg0bkVuNmNMZStMeHN5bFpR?=
 =?utf-8?B?ck14MDJGOENnVmtQbjk2SnUrUFhSQzVaeVAzQmhidnU1b2pyVjBFZU03YzRm?=
 =?utf-8?B?d0VyS2laMFhGbHZ0em1iRHBEcUh4ZXAvN1NtYlVwd1NCU1FnRFVrQ01wQ202?=
 =?utf-8?B?WjdIMDNnQlZMUVpUb3lqeTdRUnFUL3UybWlJQVBTZW9MV2x4QkxISkpyTEth?=
 =?utf-8?B?aFg5dFZ5bTFKK1J2ejdUei9mekNtT0N3Wm9ZRVV6bWZOQlpnNGhJK1FaMkFU?=
 =?utf-8?B?MG1Mbng3KzZhTi9uRFZQcHlEQ3g2WmpwZVU0aTJ3T2xmUFhEVDZRUkl4Qkxv?=
 =?utf-8?B?dU1oU2c3dWlaRWpINXlNT1Y2OVlNdGl1Z3BTT3VrN29OUGFOTmRoRXJ0RS9L?=
 =?utf-8?B?MFpSS0xIVWJmNU55dC92OW9TZWtZUGxROVZsaTh2RDlFVjFBSHk1eldMKzV4?=
 =?utf-8?Q?+CLKK9PGTwfk/8qTOT/89mg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af9a9abb-2273-48b4-69a3-08d9bbd98156
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 12:35:10.3051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IwFaIEweGeTpjqxodURS/IEwRwBM8j3ayJs6eh0LRVgxBa9IIT5j5fTiJp8GCOYG3DUxuJRwItvYQXaEPn7Bkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4537
X-OriginatorOrg: citrix.com

On Fri, Dec 10, 2021 at 12:41:31PM +0100, Jan Beulich wrote:
> On 10.12.2021 10:36, Roger Pau Monné wrote:
> > On Fri, Dec 03, 2021 at 01:38:48PM +0100, Jan Beulich wrote:
> >> On 02.12.2021 15:10, Roger Pau Monné wrote:
> >>> On Fri, Sep 24, 2021 at 11:47:41AM +0200, Jan Beulich wrote:
> >>>> @@ -720,6 +795,17 @@ int __init dom0_construct_pv(struct doma
> >>>>      /* Pages that are part of page tables must be read only. */
> >>>>      mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages);
> >>>>  
> >>>> +    /*
> >>>> +     * This needs to come after all potentially excess
> >>>> +     * get_page_and_type(..., PGT_writable_page) invocations; see the loop a
> >>>> +     * few lines further up, where the effect of calling that function in an
> >>>> +     * earlier loop iteration may get overwritten by a later one.
> >>>> +     */
> >>>> +    if ( need_iommu_pt_sync(d) &&
> >>>> +         iommu_unmap(d, _dfn(PFN_DOWN(mpt_alloc) - nr_pt_pages), nr_pt_pages,
> >>>> +                     &flush_flags) )
> >>>> +        BUG();
> >>>
> >>> Wouldn't such unmap better happen as part of changing the types of the
> >>> pages that become part of the guest page tables?
> >>
> >> Not sure - it's a single call here, but would be a call per page when
> >> e.g. moved into mark_pv_pt_pages_rdonly().
> > 
> > I see. So this would result in multiple calls when moved, plus all the
> > involved page shattering and aggregation logic. Overall it would be
> > less error prone, as the iommu unmap would happen next to the type
> > change, but I'm not going to insist if you think it's not worth it.
> > The page table structure pages shouldn't be that many anyway?
> 
> Typically it wouldn't be that many, true. I'm not sure about "less
> error prone", though: We'd have more problems if the range unmapped
> here wasn't properly representing the set of page tables used.

I have to admit I'm biased regarding the PV dom0 building code because
I find it utterly hard to follow, so IMO pairing the unmap call with
the code that marks the pages as read-only seemed less error prone and
less likely to go out of sync with regards to future changes.

That said, if you still feel it's better to do it in a block here I
won't argue anymore.

> >>>> @@ -372,16 +372,30 @@ void __hwdom_init arch_iommu_hwdom_init(
> >>>>                                          perms & IOMMUF_writable ? p2m_access_rw
> >>>>                                                                  : p2m_access_r,
> >>>>                                          0);
> >>>> +        else if ( pfn != start + count || perms != start_perms )
> >>>> +        {
> >>>> +        commit:
> >>>> +            rc = iommu_map(d, _dfn(start), _mfn(start), count,
> >>>> +                           start_perms, &flush_flags);
> >>>> +            SWAP(start, pfn);
> >>>> +            start_perms = perms;
> >>>> +            count = 1;
> >>>> +        }
> >>>>          else
> >>>> -            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
> >>>> -                           perms, &flush_flags);
> >>>> +        {
> >>>> +            ++count;
> >>>> +            rc = 0;
> >>>> +        }
> >>>>  
> >>>>          if ( rc )
> >>>>              printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",
> >>>>                     d, !paging_mode_translate(d) ? "IOMMU " : "", pfn, rc);
> >>>
> >>> Would be nice to print the count (or end pfn) in case it's a range.
> >>
> >> I can do so if you think it's worth further extra code. I can't use
> >> "count" here in particular, as that was updated already (in context
> >> above). The most reasonable change towards this would perhaps be to
> >> duplicate the printk() into both the "if()" and the "else if()" bodies.
> > 
> > Maybe. The current message gives the impression that a single pfn has
> > been added and failed, but without printing the range that failed the
> > message will not be that helpful in diagnosing further issues that
> > might arise due to the mapping failure.
> 
> I guess I'll make the change then. I'm still not really convinced though,
> as the presence of the message should be far more concerning than whether
> it's a single page or a range. As middle ground, would
> 
>              printk(XENLOG_WARNING "%pd: identity %smapping of %lx... failed: %d\n",
> 
> be indicative enough of this perhaps not having been just a single page?

Let's go with that last suggestion then.

I would like to attempt to simplify part of the logic here, at which
point it might be easier to print a unified message for both the
translated and non-translated guests.

Thanks, Roger.

