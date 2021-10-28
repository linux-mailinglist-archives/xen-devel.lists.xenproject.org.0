Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C473643E20D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 15:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218039.378319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg5Qj-0007O3-1A; Thu, 28 Oct 2021 13:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218039.378319; Thu, 28 Oct 2021 13:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg5Qi-0007M1-U8; Thu, 28 Oct 2021 13:26:52 +0000
Received: by outflank-mailman (input) for mailman id 218039;
 Thu, 28 Oct 2021 13:26:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Bw3=PQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mg5Qg-0007Lv-Tq
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 13:26:51 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b47bb778-37f2-11ec-84a0-12813bfff9fa;
 Thu, 28 Oct 2021 13:26:49 +0000 (UTC)
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
X-Inumbo-ID: b47bb778-37f2-11ec-84a0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635427609;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=A3H/kgwksHOHrFEsqR/o88gHwbTl30STVFrpzKzM2hQ=;
  b=aT+LZrXFONbR3t7ZcExn7GMhX7MQjG+rM8C9ac5xTcI94hyMjf3a/vJg
   yp11IVIQ59ZvgB4iJaid088j1VmoZQ2gnESjp/D3m6nrXjvjw8Ovl4X0F
   LlXl+01/GPe/QR7BWRD2RM8Wj+j1wPy2+DR0/5nt8rp57y/IMvXaPVXnX
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KqBACIgmDRhH9xszq+YtsbBZKhzFHjIusonzHXOGuChy/DjARYHFwQQpfAQZxsOgApMS0DhiVi
 wp/P/Ro3lY9uaS+njPKCmAOGq15t95XfcvAA73ykYX6TaFbp9wZsqH6zQij/KlcfPeI3wXaWuk
 ViHAVMZcEh2t397sSBLSfbIOy6g1cenmiCMc24/d8PAWl4CbqZhDk4IJG8ErtoD9HRfT2ul8r4
 dbKyt326qjNFdHhdUCi8uBzAtqWGr+GrRgzi8LCl9kCIm24+woIzasl7wJF/EJ3dIhN1TPh7pB
 Jk2BLyOIjeE8JOdqgqmg644s
X-SBRS: 5.1
X-MesageID: 56549343
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ujx4Sq04+yR8IJt33fbD5SV2kn2cJEfYwER7XKvMYLTBsI5bpz0Dm
 zROC22Caf3ZZTT1fdskOY/gpxkGv8LXzodhTwBkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es7wb5h2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhjtVql
 ogSlqGKQ0QAAvTMwtQ+eQNmOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIEFgGZr2psm8fD2P
 u8jSmIzXj/5XD5gZVgyJrU6l7ehiSyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1UgUSwt
 m/A537+ABwRKJqY0zXt2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRqGSzRtZeI
 Ew84Tc1oO4580nDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyxecHTZZER18UtZlnfNvRWYa9
 XWTofq8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNps1kyXH76PBIbw14evQWihn
 FhmuQBn3+1L5fPnwZlX6rwub9iEnZPOUhIurjveWmao/2uVj6b0OtT2tzA3ARtGRbt1r2VtX
 lBYxKByD8hUVPlhcRBhps1WRdlFAN7eaVXhbaZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusQOZyXyN/QpMtLtYyjP8UQGPY+8PhwzRoEXCqWdiSfdpH0+DaJu9zm1+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48gPUwDnUgDKZfobcmjlXyPiOPGDFbMEOttGAbeP4gRsfLfyC2Io
 ok3Cid/40gGOAEISnKMqtB7wJFjBSVTOK0aXOQMJ7PdeFI8QT1xYxITqJt4E7FYc21uvr6g1
 lm2W1NCyUq5gnvCKA6QbWtkZq+pVpF6xU/X9wR3Vbpx83R8M4up8okFcJ47Iesu+OB5lKYmR
 PgZYcSQRP9IT22fqTgaaJD8qq1kdQiq2l3Sb3b0PmBncs4yXRHN9//lYhDrqHsEAB2ouJZsu
 LanzA7aH8YOHlwwEMbMZfuz5FqtpnxByvlqVk7FL4ALKkXh+YRnMQLrifozL51eIBnP3GLCh
 Q2XHQ0Zta/GpIpsqIvFgqWNroGIFepiHxUFQzmHvOjubSSDpzit245NVuqMbAvxbmKs9fXwf
 /hRwtH9LOYDwARAvb1jHus51qk5/dbu+eNXl1w2AHXRYl23Ibp8OX3aj9JXv6hAy7IF6wu7X
 kWDpotTNbmTYZ63FVcQIEwub/iZ1OFSkT7XtKxnLEL/7S5x3byGTUQNYEXc1H0DdON4YNE/3
 OMsmM8K8Aju2BMlP+GPgj1Q62nRfGcLVL8qt81CDYLm4ubxJoquvXAI5vfK3ayy
IronPort-HdrOrdr: A9a23:HzRHEqpiT42nwMvMUSLTpvQaV5uxL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPPHFXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhOY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX202oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iAnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDQ4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAqqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocZTbqjVQGbgoBT+q3vYpxqdS32B3Tq+/blnAS+pUoJj3fxn6ck7zM9HJFUcegz2w
 2LCNUuqFh0dL5lUUtKPpZ3fSKGMB2/ffvyChPmHb3GLtBOB5ufke+93F0KjNvaDKDgiqFC3q
 j8bA==
X-IronPort-AV: E=Sophos;i="5.87,189,1631592000"; 
   d="scan'208";a="56549343"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjRuQMBujP9/VOMFQqKmEZkHxLMiQ/xU5WhTLnScaQIQzg8apCA8b5eUENBDnZVaq0rlVOTRHrKN6/gxzFnKfXny4xFpaEGYiMxx6u+t3oz/0Sn/kYBbnfbqGGSLGTOp8C/1DEpazVA2eZE1WtkEIeKsaP97VnvPFn7J+V74TP38LyYc7TLEaxOCFoWr0fzSANfUmUL/oAAnTirNfI0LGVBrzSe7KsSvaxMbHIdN410NtnfxtAqDerOXrnhVBSs6VpOHSmIUUV/b7xgX0Ch+eohSTp+Zfl/PbCCY1jouuingHnfiYaO1nTysYKu8PUlE2kCIrCUkcoPyy/uomT3/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euJgYPFU8bUrNLRObsngksn9vuyg3OJUWI2FfPHJMwQ=;
 b=NTuSHkMCTqAVg+sKpEpynsZ1xvSDWrfuaiEuUMJXaKlL0lqAoyDzb8qJNBv5PbfJOQMN7ZT3XRjSTaTumHVwy7AeEuzL7aWN0rBn1zIpCY/STKQGxN7SMIkbXMEdrVNfGdtjIAv5AN1RVzrQOPT9FyVEbD/s98Jwl+p5CmD6Ml2MGCM0/iNejOqM3TD0e/E7tst/unWsa5vuaC06lG5ncEQxmZhcnGJkU8VQ/Nd7pbUPEGlfieCHsyDuOMajniv5EMR+qPK8EP+T2vatzZYZHo1PwbvCpB1ux8djW/fFmApuNRNhZKbzjhbkn/imaldh7Lv2srvF5cES2wePKUTbYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euJgYPFU8bUrNLRObsngksn9vuyg3OJUWI2FfPHJMwQ=;
 b=p5GxkUFt3Yn3rAyPBgh36aJU9CBGCkd+HaB98A2mmnEtY+e+NVw0tRrS7VlspOJNSGy66MkR02T74MNXIHPpmU6Wd11GP3xi3rfrx5BZ0i7bGFKbLqgjd+raNQ298shcUXK5NRDqqa6KpqqSFAr5BUtR5OxAHX1CzZ03/ad4L0k=
Date: Thu, 28 Oct 2021 15:26:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] x86/passthrough: Fix hvm_gsi_eoi() build with GCC 12
Message-ID: <YXqlEQWk1HGNLKq3@Air-de-Roger>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
 <YXpRzHEawUZEU87h@Air-de-Roger>
 <64788530-a18c-332f-c287-84478a200816@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64788530-a18c-332f-c287-84478a200816@citrix.com>
X-ClientProxiedBy: MR1P264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c5275a6-549c-4a8a-fa23-08d99a1696f1
X-MS-TrafficTypeDiagnostic: DS7PR03MB5591:
X-Microsoft-Antispam-PRVS: <DS7PR03MB55910F47C371063CA35E92C98F869@DS7PR03MB5591.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kzuQ+LQAEiSnokffErpMSkdhfX+XXKl8XQn0BI1UBtyHVuX/zGrFd0kv27Ys28uG5v9Ph/kefP7G41bJxj8/tTNXo/azrPxoNz7G0wJzzjOA6oKu34iBFEjglO0fl3Eo3+eOZtxl1cPh55L0dFhWkwin7lRyYYqrql16fWKFHGvGs/088aeBgz/LA28GQfWpaZ6SLV0X3eyqaQyAUYCuVSBwYho8s5hjmomrE4DiZPvFnNSO5zPSGCbcQWZRE1vxX+lXU3iKr7EQzyM4q985r9qwddWJQ9a2k6Z/T771YTbzNoYdw1dGEegJHo5L4X+jk3Y/mngLXcCzCtDDhXjuEkdlgvVo1/JdqYf4KdusWK0yeMV1N8vIjYlct/fxbHGsnAyM2KdQUZaUBCWoHPlDwSCIyhNgRNr8v7HasmRZCcNO5Gv8dgpaBzVVPT3BEhIOsdTW2NW+7OG9WmimhovRlHB132gmSJS4oSjluOGqc+G8WzytJYN/vOuUNYnPWMsBo3T/qxOwsCbqILzqA4xhd2FnTsQFlW9lDsHpt8zIcabeIELENgwQYzKm6VqXtZAQh0GnjdT5wyUb26TOPNXoTqILZ51qoauS6J6p1cWEtrPsX52C6WM4DZEcNFrFAqrscoRE90BATs+BYVmgJBVj0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(508600001)(86362001)(2906002)(4326008)(6636002)(6666004)(956004)(186003)(9686003)(6862004)(85182001)(6486002)(316002)(8676002)(33716001)(38100700002)(66946007)(54906003)(66476007)(66556008)(53546011)(26005)(6496006)(8936002)(5660300002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkpJY3Q4L1k2YnFuSkszRzJkYUowK3ZqcGFEaDNZc3ZtaWNCZDYvZCtMaG1s?=
 =?utf-8?B?MkprUmx3eWd1NDJlblZKNWQra2NFMERXSzdkU2xjT3MyeHJKMzk4RllJUS9j?=
 =?utf-8?B?Qlo0aDg0eENzMUFLZUxVNmR3VVhkUWlqOVVDQU02Zy9xbUVzbCtQOUo1b3BC?=
 =?utf-8?B?eWhwOUo4ei8rUHh2VEhqUVEzVTNMUHFEbE1pOTM4M1RLWER6QjBsVTFob0dU?=
 =?utf-8?B?aURDU2R2ZUNlaEdRWC85YVNrdi9OTUJVWHRFbUtXNnpRYTZvYXNpeDBYWUlV?=
 =?utf-8?B?S0Erdk9nVi9oZ2ZadytWUnlMOC9DMlhvZENWK1YweDFVTEQwZ3JzZC8wSTJw?=
 =?utf-8?B?ZVlSYkQyRFViTVZMYmtWdVErZm1SaUVhSTBYWjRMQXhsR2ZQaGxuSitwSTh3?=
 =?utf-8?B?VGFtZUR4NWZVaEw3YitxL0hEeG9lM3AwZ3A0b1VXSzRpMmwzSjZaRW0yMFpD?=
 =?utf-8?B?VDJCZFkrai9HSHhzOFJLaG1zakNGQWhtUVBZTzN5UFAwWk8xVUR0Z2VLc1N5?=
 =?utf-8?B?eTZWQjN4c0ZPVXcreFJ4cUVzd3VYVklFYkszMldKZE1nSkwyTHN4TjEwVk5D?=
 =?utf-8?B?YnowNGx6VlNnTGNhYTExVVlGMnpkS0IwUnRvWnN6V2RpWVdCQ3ZYdUJPY0JH?=
 =?utf-8?B?NzNka2UybEJBMllhTmU0SWZRWk9mRFg3WThGMjVGbWhBRVd0SWxNYk9scnVn?=
 =?utf-8?B?d3IvZHh2cXY3R091YzJlaElDYUNJcGo2RDBRLzB3NXlmTU9sZ3hEQjZ5NFVk?=
 =?utf-8?B?NDd1Q3J3VFBncWtLVU5kL0FiVVAvS2R5ZlFlSWczaHcxcVBhajliNXFicmtI?=
 =?utf-8?B?ZkJicG55eXlIaEs2UXlNeGpyelZuRXFqLzNNSVJsaHIrKy9CamJVU0ZHMjhZ?=
 =?utf-8?B?d25iZmRqNjQ3RDhaWVZrSXA4U2J6OGR6a1VvQzJQdmRmQ2lRMlNRME1sM0Jz?=
 =?utf-8?B?Z01QRUxVYjhJcnR4UkFWVW1LYk4xdUVqSGFIQVNEVVZuakVCOFlMZmx5anY4?=
 =?utf-8?B?KyswZTVWVFFxVk9TVE9ndFFsV2s1OC91aVdkWGdCOFZqdEU4VXN0NEtzSGFB?=
 =?utf-8?B?YnAxcmRpb3lZSFE2L1ZabGtET2dXSzdnSFdoL0NjWXJDUnNhRTlQYjVtZkFD?=
 =?utf-8?B?MkdSbVBPbjNtQXVJVkxVSE5GdGUrY2ljK3RCNDVRekRzVk9pVFEwR3pkbEJ4?=
 =?utf-8?B?UXlPMHp3MmRmWm5oZkFBZjJvRDRIVWc0WUt0YWp4MFhSSTFCYy9Qb0VvRWlz?=
 =?utf-8?B?TEZKUjZVVFE2ZE9GTVBNdU5NVlFqMWFKY3hEN1NiL2FrdUpnMnhuMGkvaDFw?=
 =?utf-8?B?dnoxYjVGR1JXYkxXNGszRXpvWThJS1pTUWY4MnppZVR1NmlleWFJb3R2UmRU?=
 =?utf-8?B?T2VFUUFqNW9rMEVlK3FEU0hwUnMyQktham10dXVnOHh6MlRTRFJEZDRsREg0?=
 =?utf-8?B?bVpCckZVdElnMFFoQ0VjbEN5OTdnZU9RUE1aQ3I1OGlacmRFWFVBYVdsRmtO?=
 =?utf-8?B?eUVtaXlIQlRYdFl2bWhRdmxCUEVrNk5WZStiT1F3bU9rY2RaREtVcEpnK2sw?=
 =?utf-8?B?RnFub2lTUVlkaW1Cajd0aDVJS2xrTG16cmd3ZG5UVmlnZmhwSnpmdEx2Z01Y?=
 =?utf-8?B?UHhwYm9SZVZodmpUQXFHT1pFUXRKYXR2emZ0Z0NYTEhXMVdsWU5hcForNmNl?=
 =?utf-8?B?UHNLYlVTaHNmbE1IeHhWQ0UyVlViTjBsMHlqcElrNGpRNHhWRGh4bkxQUElZ?=
 =?utf-8?B?anBFMHJWb2psOThFaW1aU1JwNThIaGl0c2Q5Y2Q4MS9HRkhRTG5SZjhlNE5L?=
 =?utf-8?B?NjFJMkR5OHF3cEJVRzBOM1BCM3J5UVUzYVlaRkROM0kwcXRZbnI5UE5uek80?=
 =?utf-8?B?Wm1NbmZwcWZ6ZTY0Qk5QcXdwenVjbS9td3gxZGFTTnZsSjk1dzVlaUp5RWln?=
 =?utf-8?B?RVcrNUZxcDVQaCtvKy8yeGRQVFhGOEJienBmbEJLYWNRdS9wYWNST0I0Kzhh?=
 =?utf-8?B?Vlk3dzIrUVBzZnBrSnJtekFNZDVYVCtpV0NFSk82RTdxYUhsRk5CN240WjBM?=
 =?utf-8?B?WityaTlaYzFSaWdKTWJGdmtmSTFCMTBJZEJiQ3dKNlNrWlVOK0liT3Y1Sm1B?=
 =?utf-8?B?RThsVnZYMTNNRDJuTGRCenpzZEhOVEg5YVY4UGtPQnNmVGt6cWo0TU1qTUNr?=
 =?utf-8?Q?2kYglDmPkUeL8iU+ccJXqnw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5275a6-549c-4a8a-fa23-08d99a1696f1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 13:26:46.3169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9fX9W62TWgORnuyPbF/Aa6LuSlwNZTHC1MSSstEKWDJ7sOeodN+nT7Vu/NSM2x6At45JbpnuB8c5c+f6ZHKew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-OriginatorOrg: citrix.com

On Thu, Oct 28, 2021 at 01:15:13PM +0100, Andrew Cooper wrote:
> On 28/10/2021 08:31, Roger Pau Monné wrote:
> > On Wed, Oct 27, 2021 at 09:07:13PM +0100, Andrew Cooper wrote:
> >> GCC master (nearly version 12) complains:
> >>
> >>   hvm.c: In function 'hvm_gsi_eoi':
> >>   hvm.c:905:10: error: the comparison will always evaluate as 'true' for the
> >>   address of 'dpci' will never be NULL [-Werror=address]
> >>     905 |     if ( !pirq_dpci(pirq) )
> >>         |          ^
> >>   In file included from /local/xen.git/xen/include/xen/irq.h:73,
> >>                    from /local/xen.git/xen/include/xen/pci.h:13,
> >>                    from /local/xen.git/xen/include/asm/hvm/io.h:22,
> >>                    from /local/xen.git/xen/include/asm/hvm/domain.h:27,
> >>                    from /local/xen.git/xen/include/asm/domain.h:7,
> >>                    from /local/xen.git/xen/include/xen/domain.h:8,
> >>                    from /local/xen.git/xen/include/xen/sched.h:11,
> >>                    from /local/xen.git/xen/include/xen/event.h:12,
> >>                    from hvm.c:20:
> >>   /local/xen.git/xen/include/asm/irq.h:140:34: note: 'dpci' declared here
> >>     140 |             struct hvm_pirq_dpci dpci;
> >>         |                                  ^~~~
> >>
> >> The location marker is unhelpfully positioned and upstream may get around to
> >> fixing it.  The complaint is intended to be:
> >>
> >>   if ( !((pirq) ? &(pirq)->arch.hvm.dpci : NULL) )
> >>                   ^~~~~~~~~~~~~~~~~~~~~~
> >>
> >> which is a hint that the code is should be simplified to just:
> >>
> >>   if ( !pirq )
> > I likely need more coffee, but doesn't this exploit how the macro
> > (pirq_dpci) is currently coded?
> 
> The way pirq_dpci() is currently coded, this is nonsense, which GCC is
> now highlighting.
> 
> It would be a very different thing if the logic said:
> 
> struct pirq *pirq = pirq_info(d, gsi);
> struct hvm_pirq_dpci *dpci = pirq_dpci(pirq);
> 
> /* Check if GSI is actually mapped. */
> if ( !dpci )
>     return;
> 
> but it doesn't. Getting a non-null pirq pointer from pirq_info(d, gsi)
> does identify that the GSI is mapped, and the dpci nested structure is
> not used in this function.  I would expect this property to remain true
> even if we alter the data layout.

I think we have further assertions that this will be true:

 1. d can only be an HVM domain given the callers of the function.
 2. The pirq struct is obtained from the list of pirqs owned by d.

In which case it's assured that the pirq will always have a dpci. I
think it might be better if the check was replaced with:

if ( !is_hvm_domain(d) || !pirq )
{
    ASSERT(is_hvm_domain(d));
    return;
}

Here Xen cares that pirq is not NULL and that d is an HVM domain
because hvm_gsi_deassert will assume so.

Thanks, Roger.

