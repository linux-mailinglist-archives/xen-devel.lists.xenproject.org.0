Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBFA4A858E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 14:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264784.458015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcVl-0004EP-Nv; Thu, 03 Feb 2022 13:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264784.458015; Thu, 03 Feb 2022 13:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFcVl-0004B5-Ks; Thu, 03 Feb 2022 13:50:57 +0000
Received: by outflank-mailman (input) for mailman id 264784;
 Thu, 03 Feb 2022 13:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mjBt=SS=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFcVj-0004Az-LB
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 13:50:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d56dad6-84f8-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 14:50:54 +0100 (CET)
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
X-Inumbo-ID: 4d56dad6-84f8-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643896254;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TH0YcttGKgnOP31CS0AleWw3PvS2sNL7rFM1UKVRy1o=;
  b=cIJlIH2b2MAAuJH/IMmn7ghLOMTTk14fOaQmNb1ifzMMAqIlbncIPDX6
   Zhx8vRYzQC/+7boy0Zs/JKXehDTyZa0aY34PzuymhVytw2Us5L+xFSbs7
   1VxzyMqhsdbN3mufJ7sh6HIxXmTKFGLh1My2Zt/7idEdQePrZV5w2CjbB
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: R169npPNz6+bqMpH37TtUfVe26HslTAQ4nRe3FmxXcUMW1daKJ5uaOC8gM1Lz+Xg8fSQxX5CQm
 XfqfZ5ysXpWyFeZ7GZks80KWXj96K4l5K16aBN29mkC99F3Y4/Rm0LUf+K10vULASAFbuOmf/G
 E9XiB8rJapjjNNUA6Bryob0smWma4l4yof40il7PyH/v4haoUuFhCq7SJ7K05G5gxm8CiGn4Ku
 M5DOL012vL32Mb1LbFyseqox/c4vcamLUpcLuptNBrRumvH7JMXuT3eBqrmkgvhpI0eSHtp+y7
 O9NstBOCiGgsZVEtjhTkiFXS
X-SBRS: 5.2
X-MesageID: 63818176
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:clEjcq0/Xmu88UmXPvbD5SJ2kn2cJEfYwER7XKvMYLTBsI5bpzFTn
 2dOCDqHaKrYZ2L1LtwjO43i8UNT78PTnIVnTgNppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5w7Vh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhsoBOz
 OxRq6aMZ0QABfaRvuk2SCd4DHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4QIhWdp2Z4m8fD2O
 s8JLgZVfAn8XTJJYFYaDZEcksWziSyqG9FfgA3M/vdmi4TJ9yRz36LqK8H9YcGRSINemUPwj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZCglee22gSAx0+TkagrL+yjUvWc81bA
 1wZ/Gwpt6dayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4oeE3AKgGnY+chACQed96ek7bicU9
 kDcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K9+d9u13ojWv4mSffo1YOtRVkc1
 hjX9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocd7xorqp5
 iFsdy2iAAYmV8rleMulG71lIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGG1O
 x+I5F0MtcQMZxNGiJObharrUKzGKoC7TbzYug38NIISMvCdiifblM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efAOBa9FOlUWHPTPrFRxP7V+239r
 ocAX/ZmPj0CCoUSlAGNr95KRb3LRFBmba3LRzt/Lb/ee1c2RT16Vpc8A9oJIuRYokicrc+Rl
 lmVUU5E0lvvw3rBLASBcHd4b73zG514qBoG0eYEZz5EAlAvPtSi6rkxbZwyceV1/eBv16csH
 fIEZ9+BErJETTGeo2YRapz0rYpDchW3hF3RY3r5MWZnJ5MwFRbU/tLEfxf08HVcBCSAqsZj8
 aar0RnWQMRfSl06XtrWcv+m03i4oWMZxLBpR0LNL9QKIBfs/YFmJjbflPgyJ81QexzPyiHDj
 1SdAAsCpPmLqIgwqYGbiaeBpoavMu1/AksFQDWLsefobXHXpzPxz5VBXeCEeSHmeFn1oKjyN
 /9Iy/zcMeEcmAoYuYRLDLs2n7k14MHipuEGw108TmnLdVmiFphpPmKCgZtUrqRIy7JU5Vm2V
 0aI9oUIMLmFIpq4QlsYJQ5jZeWfz/AE3DLV6K1tckn94SZ2+puBUFlTYEbQ2HAMcuMtPdN32
 /olte4X9xe720gjPduxhyxJ83iBcy4bWKI9u5BGWILmh2LHEL2ZjUAw3sMu3KyyVg==
IronPort-HdrOrdr: A9a23:m0nguqj0OsSaZh7Y2Hhbd+ktm3BQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVeUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDl1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9kfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ1yHtycegA2w
 3+CNUZqFh5dL5iUUtMPpZxfSKJMB2/ffvtChPlHb21LtBPB5ryw6SHkondotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.88,340,1635220800"; 
   d="scan'208";a="63818176"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYwEafNT7zZ5edQjBTHcc5JVQ0gdvPopmzeKSUX/sU7rMbCPkqNsaNwUzi494Z9toPXOmX1X90Wt2m1bclF4+drycUFC4TNLXqDBaJOSIk4dbX0NfM90KumjneED8y9+ZXMJErXtY1YcOH8lbfEtG9UIvySjB5qLIXJsmbFeJpG6gBxwbbvz4UugUNq/rFtIVr7ZZIo4ST3XHLqpfDZ6u8GpqGHj6WyIVSg9lHX16kd/Xf7/pCDQcNGbAjvX5bUGaTm86NPjVuDGIamVd6Mwyqn62FLpOKwGOLiSMJ48E8ztSd+bM78TfY/ZA2yxLGu1ujkHtFhyS9TZncN0RdHB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24HJAMn6dwns7ZrlAtR65gk3ceNBsb4qPm0v4UZ40f0=;
 b=kusBJYKW/18U7bD90QjBwucF24lizSyFZ25BHE8tw+02bIkq2JdBL5sFo2rxxHPLk708OHA2otmtm/XE62/EceXqnvKnAYUdC/1UuMlhLH3veN2DkOi+CsVz/Dy5P9seEEkRJ+MjDRHkABxtvF+wWztZpx56Zoug3gpMZJzaxlDdUPYSiT74C5ZKc8SlorHJOtd5E57Hh22OLjbjAulPf9wHnKsCLVa/5uSOwMejwGx9bo41W8J4VLPj8/ysdih/C9p4O+I+B7jRbLzDfQaESAzd3HRfrwCWlmB2M1mZ4XluSanyhPiIRCOllrSLA54Quh3f4D78bLU5l3j6V6ct5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24HJAMn6dwns7ZrlAtR65gk3ceNBsb4qPm0v4UZ40f0=;
 b=YM5aa32vB57FV7WcZpCN7EiECCUxqA7CAtDutuHnVtkpuYbLiUYHR01gV0qRvF6B26MmvVnG3TiBMU8ybLtThy45GlAZKnDEoVH6+3yMOLRFCn5WKvkLeNbVWUUg9vT4Mg0tfsofJwL/itvsqNZNsbtEs7eGi2dxtWdZ+lhf2Do=
Date: Thu, 3 Feb 2022 14:50:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools/libxl: don't allow IOMMU usage with PoD
Message-ID: <YfvdsDQA/QfZAewh@Air-de-Roger>
References: <20220203110651.17419-1-roger.pau@citrix.com>
 <bae9ad85-a26a-67f7-93af-166cc743e046@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bae9ad85-a26a-67f7-93af-166cc743e046@suse.com>
X-ClientProxiedBy: LO4P265CA0098.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dbeaef3-6e69-4945-6b3d-08d9e71c2ddf
X-MS-TrafficTypeDiagnostic: DM5PR03MB2988:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2988B0CBDAA2303A7308AB5E8F289@DM5PR03MB2988.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rZeHEZEcDUGucwPdC8jTkLtdxxQfsqQEzcTHQmG9vWI/GHZRjlLcxOfXjr8NSevwWiTMGf416WuX8D88b2GbdBw9IHM2Mst6EzB/yjYWE7OH6qCX+D3xXQvgzm9OZ35OHE/KuKUGUPWhWc3oRYKspQO0wmfURoPeSC9/mUuxCetsRB4UcTKqlaFuiycFDd+mvyIRnbJarQJAT3x37R20EyYJ5s1nZZPStG4b3YN9yC7jyb/kC5BILjcPQfByIak+cRHf6DnSyzmva+DISyW6qTuqkzSutXr8IQN4RT/aQ2Ig8/JQ1oYiby6+1SOlFftUfUfBMjQOoTvdcXvdNN/mHiTC4T0vl0lanjxnYfjuamA33jeU4+9BPE2HsRmLg1/N65HS/wPsL2/MMK+OplzhyKFvFRDlvQFwZbAym+aIuCPynbxvFlnpTN5l2DMyWRirCO5zXtox2eVb6QW5H9dLQ0tcI/IYjOip9xX7pdqskc26tM+8XnrgxokTjCvmfgKdDGa4E7UdGUJYFQOF8yIDCjK70ZlXBnG3a6UaBWL1kOFf/NdCw/lylse4pwaRgasNGgjBt/AobyG4MiKBEN/0Tin2/eaxMvVqp1562J4YDu6h2ohKuk5aOqsLwrSq5+9ydUIhAqBQQD9QbJ265ocwBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(53546011)(26005)(186003)(6666004)(9686003)(6506007)(508600001)(6512007)(33716001)(85182001)(2906002)(6486002)(66556008)(66476007)(316002)(6916009)(8936002)(8676002)(66946007)(86362001)(4326008)(82960400001)(5660300002)(54906003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MklpUEEvK0RTbEh2eVlacDAxbHRFV3JYei9GakVqMUQyQkg2YUVIcDZiM3Ni?=
 =?utf-8?B?ZUpMSG42MnYrNXJ1bzVEbCtMYTNGc3BEcUxIdGhPMm9rQ2ZwYzFHalMrdDFR?=
 =?utf-8?B?Z3ZVYytKTFBBMXgzK2g1WlBTNVRMU1FQclMvK1E0dW1zejljV29nVFJIQ0p4?=
 =?utf-8?B?bVYyY3huUnBGUU5XanBNcDZzQWJkTXlFNzlEdVZiMS9nVzhTcTNDVmt0K2kz?=
 =?utf-8?B?VE1GV3Y5V0N1OGJtUjNiTzVneHlRS2E0VUlQN2R2NGtRWFQ3ZCszUFE0ZWE1?=
 =?utf-8?B?d2E4ajlURVJpUlEvM09TNkthcnRXSTNiOE5vMUFiTUc3eStJdkFjWXBNQXFC?=
 =?utf-8?B?K1N2L3BwQXp5OVg1eXh4cWFzeXkyTjZHWVlWdzNxTXpIQjNIbjI1dmNaQ2NS?=
 =?utf-8?B?dTFGQ2lMSlJiVkxTaXkzWGV6bncvTkxDV1Z4L21uaG13MGpFUzBFeTdRV0Fy?=
 =?utf-8?B?TWJxakIyaERFWlpBS0VEVWsvNzlTdjdwT085c1lRQmFDVDExL3lxdG9lTTFX?=
 =?utf-8?B?RERXTi9GQmowSFhkb0R2MjBiVEk3cDdSWGVnM0ZXUTR2WFAyNU41ZlcvM1J0?=
 =?utf-8?B?OXZlTTlsRllJTEFZVHo5UFJKbHRMRm5lbEx3eGd0dWNNdDhOR2RNdTBVN1VJ?=
 =?utf-8?B?ZXdiQ1J6L1RWMXFranBIV0JxK1VIbFhTV3Zqc29wT1lrek5Nd0Y5QnA4eUNG?=
 =?utf-8?B?Sm81T0h3MUthVm9LaVg1bWZpUlNiMVl0VkU3cHF6b1RMQzhIMURtRHJqQUNU?=
 =?utf-8?B?RmdVZGJReDB0eGZEa2RZazd1K3FhRkNoYXl6U3V3aGxyUm5IckNFamkxMVhR?=
 =?utf-8?B?aHc3Nzl3WFlRcFF2dEZhMGNzeGl4c2F0Vk9UcnNRVHJ5RHFsdjRzamoyRXZz?=
 =?utf-8?B?bHR3MEJDaW5VKzZ3VnhlZE5QWmdzT1hFdmZxeEowd2ZtMmNBUTNCTURLRENO?=
 =?utf-8?B?MzJmZkRrL2gyL09SZmdXR013ZjA4NDJsSVh3eHUxSEw5dEY4UG1BUTRUMmV6?=
 =?utf-8?B?SE9BY0JNVVJLaHA2ZndHNWtKSnkwL0lxdmZQQzdCNEpFZ2JwcnZWOTIxaUds?=
 =?utf-8?B?clRucE1IZ0d3NlJIUTB3ajlPRTNQZ1VTamRFdWtNS2xUdWdOV29SRjNjUWNr?=
 =?utf-8?B?ait0UWRMWWhxUlpCbm9LK0cybk5FSmg2ME9Udm1iWmJlb0oxMVRjNEtKUDJT?=
 =?utf-8?B?VTlxemF2enVkQklWaEZobDdsc1Yxc0pnTE4zQUhxVml1WEcyQnR5NHVQc1F6?=
 =?utf-8?B?OThpWTk4VUVxcmtScWcyVlBWRXlmOVRTY2t3T2xKTmoyWjZFbDJXRlloK2N3?=
 =?utf-8?B?UitFdlMzcTJBVC9mQmVCbTNhQTJyVlc5U3dZYVIwK3BKK29MTThqa0FTOXI2?=
 =?utf-8?B?VXZzOUJxRlNFWUl2Y00wcjg1ZGwyL1AxaG5ERWMxbktJdkxJcVBZeUozUk5i?=
 =?utf-8?B?WXduRGdvR0VuOG5GcjFyOGoySHhVZ2ExNlEzaTFkckdCTjN2TDdVUUtsRklN?=
 =?utf-8?B?bm9qQ2lIdldzNTkzRnlGaFlIMU5HMXpYUEs1QTJITU1hSEx4RDQwaTZYWUlX?=
 =?utf-8?B?T1N2Z3RKUzdNUUtLQ3VjSTNNNWVRd3JKeUwwZXp1QkxHL1c5d0hPK0hQRXQr?=
 =?utf-8?B?QUdaWGNqU2dXNmNOTTMzcFZudnQzWDhRV3loeGRndEVyRzByb1N3cG1JWjA0?=
 =?utf-8?B?eks0UUl2TjFCREFnREk0aUxSREFDUzFNVkJveG41VWdpVTZKRHdpL3JBdm8w?=
 =?utf-8?B?SzRnL05seE84d0R2YzZ6bUhRaHk1L3QyZFpKemt4TzJQbVQxZ1Y4WnVNREUz?=
 =?utf-8?B?L1lKYXh5YVNsdUVRbnZIWENxYytOczNnVUY4RzZiNG1jZnBxdld2aVhGS2ZU?=
 =?utf-8?B?TUFDR1RoQWF0Mm1NZFNSS1RNc0ZFclhwNU8zbUdQU293THQ0Tm5mQXFEdGdl?=
 =?utf-8?B?eVZyaFdCOFB4Y2R6RW1mNEl5YnRyMmJEckMvTmQyQ2JjSW5EUnNhN0J2K1hw?=
 =?utf-8?B?Y1Zld1NnRjZDTzdROVgvZUJLdkRsMklMcmdkRkloWEwxeDV1azdHQ25VMGdy?=
 =?utf-8?B?NmpYZzc5Z0phc1Y2WTI1UU5hTEZwWHZJVml0N0lkeHBGcU42bFBnSWFBWStG?=
 =?utf-8?B?WHloUmxUb0JpaElXYjZtanVnZkJUZXVBcHV1YXl5VHdWb3VQM0J2amJzQ0Jt?=
 =?utf-8?Q?4FTBestMuTA5ZwEBp50nHSk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbeaef3-6e69-4945-6b3d-08d9e71c2ddf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 13:50:46.7321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHh0kE9N8yVdRX0bsn7Qwf1+SKB4+UR5k9R/qYwQka+xlloIRUSJ2aqbczaXskB8RLUE4uF855JptOqtNbc0EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2988
X-OriginatorOrg: citrix.com

On Thu, Feb 03, 2022 at 12:55:56PM +0100, Jan Beulich wrote:
> On 03.02.2022 12:06, Roger Pau Monne wrote:
> > Prevent libxl from creating guests that attempts to use PoD together
> > with an IOMMU, even if no devices are actually assigned.
> > 
> > While the hypervisor could support using PoD together with an IOMMU as
> > long as no devices are assigned, such usage seems doubtful. There's no
> > guarantee the guest has ballooned down enough memory for PoD to no
> > longer be active, and thus a later assignment of a PCI device to such
> > domain could fail.
> 
> That's not a precise description of the constraint: The guest ballooning
> down enough only means entries == cache, but for device assignment we
> need entries == 0 (and a guarantee that no new entries can appear, but I
> think this is already the case once a guest was launched).

Would you be OK with:

"While the hypervisor could support using PoD together with an IOMMU as
long as no devices are assigned, such usage seems doubtful. There's no
guarantee the guest has PoD no longer be active, and thus a later
assignment of a PCI device to such domain could fail."

By "PoD no longer be active" meaning cache == entries == 0.

Thanks, Roger.

