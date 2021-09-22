Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B5A414D59
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 17:49:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192928.343663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT4Tx-0006Sb-54; Wed, 22 Sep 2021 15:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192928.343663; Wed, 22 Sep 2021 15:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT4Tx-0006QP-1S; Wed, 22 Sep 2021 15:48:25 +0000
Received: by outflank-mailman (input) for mailman id 192928;
 Wed, 22 Sep 2021 15:48:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mT4Tv-0006Q2-UK
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 15:48:24 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83646ea3-1bbc-11ec-b9b4-12813bfff9fa;
 Wed, 22 Sep 2021 15:48:22 +0000 (UTC)
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
X-Inumbo-ID: 83646ea3-1bbc-11ec-b9b4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632325702;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Fm/iZHQVTaG/+qDwkx2g8Ef/Oogvcsp2C7j44nofTKU=;
  b=FebmuMphC9v3IAL5ZezO4yagq6v7aGimDJj2N7eqI5wbJWvbYIn7hBAV
   pu7OCnBuPheb96yGtDmGRvRJpxg19o/0XVMdEatoVV6hw35PEe6+pWidZ
   G30oCLiEoV69omSkSHZYv76lGARnAAq9NXs1xPzr6biUFvMf9v3RlF3v2
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PpjQHeQ76o7inVIpTL1cXonMl+doGrHuu3dnq0Ou7DcqJXlaibLMHWxivaQAoTH4A07gA9btq6
 DOzm8SEuzC87bT7TijHo4gdGJCyVk8zLtHyfGNRUULc5zHMnRP1kCFEdAR3MSaRO6z9ex3VyKV
 MU3itc9PUxn7SZeThms7PDZXE0JM9JgGQ974b4ynCqTRqjEVUMPHLa4BPFsX+jZ9RwdotLdh1P
 hDWBKtMrgLBzTfOfKXdkKcm6U1++/qaayULaMQ76E3buv60FCr6MYkHMUY9AvBDxcA670n3w6e
 v+Nug5TQlFEIsSCMM4xmXgv1
X-SBRS: 5.1
X-MesageID: 53336251
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lfYoS6LlTKwJ1CD2FE+R+5IlxSXFcZb7ZxGr2PjKsXjdYENShTJRz
 2MXWW3SbvmMYWahLdt0b97nphkOsZDcyIBmTwdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM5wbZi6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Sx/Rh0
 u1prqWrdlgLGvHTkukzaj1HRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XvoQDgm1t36iiG97hf
 ukCb2Aofi7mXCcTYmgyArUijaS30yyXnzpw9wvO+PtfD3Lo5BN1+KjgNpzSYNPibdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6Fre16/pri1273XEIBVsdUl7TnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjd0bghG6ehjoHYsFvTM8etB6Hx4TtxxnMUwDoUQV9hMwaWN4eHGJxj
 AbZwY+xXFSDo5XOFinMre78QSeafHFPdD5cP3dsoR4tvoG7yLzfmC4jWTqK/ESdtdTzBTi46
 DSDtiFWa1473JNTivnTEbwqhVuRSnn1ouwdvV6/soGNtFoRiGuZi2uAswOz0Bq4BNzFJmRtR
 VBd8yRk0AzrMX1qvHfXKNjh4Znzv6rVWNEiqQc3QvHNCAhBC1b8JNsNsVmS1W9CM9oeeC+BX
 aMgkVoKv/du0I+RRfYvOeqZUp1ypYC5TIiNfq2EP7JmP8kqHCfarX4GWKJl9z20+KTaufpkY
 snznAfFJStyNJmLOxLsFr9Bjud0ln5hrY4RLLiipymaPXOlTCf9YZ8OMUeUb/B/66WBoQ7P9
 M1YOdfMwBJaONASqAGOmWLKBVxVf3U9G77srMlbKryKLgZ8QTlzAP7N27IxPYdimv0NxOvP+
 3i8XG5eyUb+2iKbeVnbNCg7ZeO9R4t7oFI6ITcoYQSi1U88bNv996wYbZY2I+UqrbQx0f5uQ
 vAZUMycGfATGC/f8jEQYMCl/oxvfRimnyyUOC+hbGRtdpJsXVWRqNTlYhHu5G8FCS/u7Zkyp
 Lip1wX6R5sfRls9UJaKOaz3l17o5CoTguN/WUfMM+J/QkS0/dg4MTH1g982P9oIdUfJyAyF2
 lvEGhwfv+TM/dM4qYGbmaCeoo61OOJiBU4GTXLD5LO7OCSGrGquxYhMDLSBcTzHDT6m/ayjY
 aNezu3mMe1Bl1FP6tIuH7FuxKM4xt3uu74FkVg0QCSVNwymWuF6P32L/chTrakclLZWtDy/V
 l+L5tQHa66CP9noEQJJKQcoBghZOSr4RtUGASwJHXjH
IronPort-HdrOrdr: A9a23:ZH4kga1qTGYW7X4v5FXqxQqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.85,314,1624334400"; 
   d="scan'208";a="53336251"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uj0gRfTQugQaDSfdJ6vZp1vXwd4efcnCiPIG2CAsqbJOwzxZxuhDH7abNVO+h5RfkOyPOt3jIjpFQptcI5BkDxqHIY23GTY6glV6lRaNfHYNUtbFGf6Tq4nmHwkjOEK/U8FRYljkeWoBrNSowPmlYehoG4qGhBhAsVNNMvuZIns7ImZ6zlV9IBbpXDJ54zOLc6o85BN0df33MRa2owrFtbOtg03jKxx7oahtGW21AhA3LMxT08qlWAC8nQy+GSLvFS8SKcWpFAbabBVAlLCdUihcF8u5s4jmrwap2nGU6KrQ4U9P6s2Yzm1N4ZnxckSGFn/TM3nnyJ3KLG4GFEUg1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=n4NAxChxHIbz2sxh8SXGwiWz7oHmjAwd5Fcf/V1mcnY=;
 b=AXLZxi8xDwFz5D2Yr5UOb7KBj/iCHxH3OZAnucdyRK6je3jjRXyjxEVdlps+dy/UCQKT/Eb0E6Kso5OayaBTOJHeDtxWjaE/Jz8V6yCkWyQHzHKKZYdTFMkO5HC3v32sLjBT9bzlzbiirPMasshpaSi+1M3CO6VWw+JY5qugiTbBcs7FHTK9umAiW2grL38UT7DiWX6+28+eo9OlBYhA45BHpwA7KdjV+Oqz8uedexN5PF63inA1RwptYfGj6xWMT/C3v9JwfC3/dk539ABEDdo7kPNQrfBfA7yyzWiSikexl7MCMdNrYNZkiQQKr0HACUjCQkr7zqSzY7uMYoLoWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4NAxChxHIbz2sxh8SXGwiWz7oHmjAwd5Fcf/V1mcnY=;
 b=FVtJONRojxJgc0iq1eTT2mcbiMZKJqXn0SaGNUYfUI4IzlANp8uI2q1g1MUteEVR/9pEqiPSNDNUIPl8EAJ6eWlRbOIcpZ8/geYyl3pLDa26SfKr/KS/6kf/cpI026EiEqR5kzNUdLmpKW36FFePjUd91SigJNzuAL8IvXN64uA=
Date: Wed, 22 Sep 2021 17:48:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 5/9] x86/PVH: actually show Dom0's register state from
 debug key '0'
Message-ID: <YUtQPUHjZ8GnfeCE@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <4ae1a7ef-d6e8-75db-ddf5-987f10175196@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4ae1a7ef-d6e8-75db-ddf5-987f10175196@suse.com>
X-ClientProxiedBy: LO2P123CA0075.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f35446e9-22d1-48b2-7639-08d97de065e1
X-MS-TrafficTypeDiagnostic: DM6PR03MB4604:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4604016B86759FA448FC99408FA29@DM6PR03MB4604.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JATlDs+FoSvkletnp8qaVFaNSPMQcJxmTi1D9HXGPB10L7rgr0dZ2biA7BfvyVzx3L/2MRUJlNNLl+CaERFaCWjaMkyCAH4XrzhVEu9o2zj5mU/p+y7W5fJCnhgvWnFDzUb3EjL4bq08t9bG49bCEb2988NQ3Pw3oYYvgDoMSqw1hSb+91CzVtO0uI3FUSFt17606C2VGoN2nsgW0bp7xwxTDIimiLRHwqR+erqZUbD+VPSxpXfAlCFlkHvwpQQah/rlw2iiR2FLnNZ8WJVj1FkBdqcM4SYoSuVFG5wdae/1yCWNChwKrGJU43JAP65cPFnXMGoerM7vw4ebibvpk90lRU4zNLY5wqiI4HJRRxxx75xfkzsGqumx7tr1n1kzMSt7mQEQCOu3fcngDBnc7/hAtRg4M1V7rRqGj5Hu1S8YNlf93ajCz9Z/CExRX0/5Bg3gDIS0RssCbDfb+sA52ykRGLnzaxQm86IgsSK5jJIEYZy5KgoR4mns0wDoFghbuhLecmQl3HvxuGi3SfVLmhUi2pfR8Y5M/dkhB+RsZUzSlru4wiSUUQ+A0zb+LMQqZZyQg1giRD+kOWn6L0yZjLb9E10VcNKAwgwiUdjiB62Cdy3S9DpRaxmb+nv2hMEvZnNgYuJR8zCgQPRJ4VxBDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(4326008)(6496006)(26005)(86362001)(54906003)(6666004)(316002)(38100700002)(956004)(85182001)(508600001)(6486002)(5660300002)(8676002)(66556008)(66946007)(66476007)(6916009)(2906002)(9686003)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2NtelRSWnF4RWt5bnRUZkVhallwVTJRSjA4c3c3QzQ0Mjh1dXkyZmN6aGta?=
 =?utf-8?B?bTJLcmRCUGs0aWdFRFJzbTBHdWwrOTFqWFI2N3hUaDJIcGZGVnNQR2t6b0FU?=
 =?utf-8?B?KzJGTnBmUHpsMEN6bHJ4cEdSMU56aTNrZGpIWUtJeUx2R1VMcUhHT3ljY1c4?=
 =?utf-8?B?a3o3QnhyZHFyQytyOTVBOVZ5R1VJRjh5eGRweHpSeDJkK3BVUDFWalorUHUr?=
 =?utf-8?B?V3dsQWJZUTRrQURldEo1SzJ3UE9QbjJFQVRGOFJrVDFuU3plL3BhbFZzZENy?=
 =?utf-8?B?NTFkUzh5dFp6VW84STN6RWFFdkR3NXRMSWxqWkhHUkJDcVp3U0E5a0NjWWpQ?=
 =?utf-8?B?ZXd4Umd3WmEwbndUVEhCT29JTFRIREprU3NKSnEyOGlwN2FVNlFmSFFQNFF4?=
 =?utf-8?B?VG8wU0pFeTlUa2ZlTDdFVHFNZ1M1bTNVbGlJc29KSjlsVERwTmpSMU5hMDNu?=
 =?utf-8?B?cy9XUlRHQi85cGFYb0h6bGNCNE1VeVR4V3M1OTUxVXZsR3hhelRjUDhETU5o?=
 =?utf-8?B?cDE4dERIOHNibEttdjZSTHZkakVzUFV3NlZodFRJQkJjN295bzFIb1hWUlRy?=
 =?utf-8?B?WGhuMFB0bmpoaUxCem5zU3hSNmRjb2NNUEFDOGpwT2dkVThCdXNqOWx0NG9z?=
 =?utf-8?B?Ykg1eFVhUFlRR3RVWGVNb010eHVyM0gvWktORlVFRFVvWE1wM3BNYWNBMEl2?=
 =?utf-8?B?U0NFTnVYUlpMTnFLVGtDbElCWXNUZlFLRlc2d2ZVaUFVZHF5aXpwdmFBbU9r?=
 =?utf-8?B?Ky9CK3pBZDUxcHFLa0J4eFUrWlpXaExHMElsckYyb2ZrR1NtbEx6MU1MTDhh?=
 =?utf-8?B?LzE0L1kzcDczV2pkVjh3L3hDVkt0K1pvZ3RPa0VJbGNNQjJiRnBJNEVWc3Ur?=
 =?utf-8?B?SWF5S3BlSU01L2x3S3I1V290M3hUdjJGQ0UxT2xRbUFZZzVXaXVBVGZkdlFD?=
 =?utf-8?B?Q0RrZGR3WXRpakIxeU1jTDVSQWFiYWJ1bk9Zc2hZd0VLcExxQW5kWDJ4ODJS?=
 =?utf-8?B?OEQ5S2ZyK2FMaDRpWGMzVjI1NWVoVng0R1lZcWI4dXIyVTEzTytHVEMvaGN3?=
 =?utf-8?B?Sy9UQkpOU0I3UFl3MERzYXdWUW1xU2Z5ODRBVFR3bWZHK0N0Vy80Ni93TEJ0?=
 =?utf-8?B?WFQvSFJiREMvby9nNHd4WVlySzFSK21ERi94bVQrczk5V0FBY1JOb2VZVzds?=
 =?utf-8?B?WXN0RnRRRU1nbzhEWXdUT051TEhZZitQc2RZRnAzVFRQUDV4eTZacDlEdC94?=
 =?utf-8?B?aDhhdmViR04wWG54b0hFUXVXRzNoY1NiV3h0VDF5LzRDc0J6NTZnZnJvNFBJ?=
 =?utf-8?B?aUhvQXZNb1pibk9TQit2TnR0K0dEdUVjTHpjS0t1ZmVpWGtPVWt3bUJ5Tzda?=
 =?utf-8?B?NWlSNEhQdVh0YTZLTW5COC8rQW4vVU9MRCtVSUpOZndVWjhGcFE5cDlWeGIx?=
 =?utf-8?B?TDhYT1RTRWhvZXAwK1JYem5PVEtFQUIzR2R5M1VxWDB0WmZhZjZCc3lPN0lT?=
 =?utf-8?B?SnNYZlY5QVBzeTk4eVIwRzFYb2NyclNub01KZzd3OEFHcUFoTlBkaWhqdGt4?=
 =?utf-8?B?MC9idVZOTXkvUjRWTGNPdGVhMGtTcm5RU3B4dkFmamZzYjZubW51WTdKSWlF?=
 =?utf-8?B?U2o0WHNwRUpPQjJuUXJFWXFKelhaWUhxc2pHT0IvdmdsTVd3Q1I4eU51MEM1?=
 =?utf-8?B?SHpYa0pPT3JhVmh2a1MxQzl6VzVOUEpPMEZpRzVpYTZlTmtTM1F1dGxzeWYv?=
 =?utf-8?Q?wRf7ixn3161ZjxYF5HQxiNTlC+6BtuOW+OKCliM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f35446e9-22d1-48b2-7639-08d97de065e1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 15:48:18.6868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWeGLPYwJAows4+Q4WocDAHlv741mnhJGcyDNa+SH8T5M6RluhSd3pGqy7KfwBVj/zuviHrzyPHV4hkhV/jiMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4604
X-OriginatorOrg: citrix.com

On Tue, Sep 21, 2021 at 09:19:06AM +0200, Jan Beulich wrote:
> vcpu_show_registers() didn't do anything for HVM so far. Note though
> that some extra hackery is needed for VMX - see the code comment.
> 
> Note further that the show_guest_stack() invocation is left alone here:
> While strictly speaking guest_kernel_mode() should be predicated by a
> PV / !HVM check, show_guest_stack() itself will bail immediately for
> HVM.
> 
> While there and despite not being PVH-specific, take the opportunity and
> filter offline vCPU-s: There's not really any register state associated
> with them, so avoid spamming the log with useless information while
> still leaving an indication of the fact.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I was pondering whether to also have the VMCS/VMCB dumped for every
> vCPU, to present full state. The downside is that for larger systems
> this would be a lot of output.

At least for Intel there's already a debug key to dump VMCS, so I'm
unsure it's worth dumping it here also, as a user can get the
information elsewhere (that's what I've always used to debug PVH
TBH).

> ---
> v2: New.
> 
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -631,6 +631,12 @@ void vcpu_show_execution_state(struct vc
>  {
>      unsigned long flags;
>  
> +    if ( test_bit(_VPF_down, &v->pause_flags) )
> +    {
> +        printk("*** %pv is offline ***\n", v);
> +        return;
> +    }
> +
>      printk("*** Dumping Dom%d vcpu#%d state: ***\n",
>             v->domain->domain_id, v->vcpu_id);
>  
> @@ -642,6 +648,21 @@ void vcpu_show_execution_state(struct vc
>  
>      vcpu_pause(v); /* acceptably dangerous */
>  
> +#ifdef CONFIG_HVM
> +    /*
> +     * For VMX special care is needed: Reading some of the register state will
> +     * require VMCS accesses. Engaging foreign VMCSes involves acquiring of a
> +     * lock, which check_lock() would object to when done from an IRQs-disabled
> +     * region. Despite this being a layering violation, engage the VMCS right
> +     * here. This then also avoids doing so several times in close succession.
> +     */
> +    if ( cpu_has_vmx && is_hvm_vcpu(v) )
> +    {
> +        ASSERT(!in_irq());
> +        vmx_vmcs_enter(v);
> +    }
> +#endif
> +
>      /* Prevent interleaving of output. */
>      flags = console_lock_recursive_irqsave();
>  
> @@ -651,6 +672,11 @@ void vcpu_show_execution_state(struct vc
>  
>      console_unlock_recursive_irqrestore(flags);
>  
> +#ifdef CONFIG_HVM
> +    if ( cpu_has_vmx && is_hvm_vcpu(v) )
> +        vmx_vmcs_exit(v);
> +#endif
> +
>      vcpu_unpause(v);
>  }
>  
> --- a/xen/arch/x86/x86_64/traps.c
> +++ b/xen/arch/x86/x86_64/traps.c
> @@ -49,6 +49,39 @@ static void read_registers(struct cpu_us
>      crs[7] = read_gs_shadow();
>  }
>  
> +static void get_hvm_registers(struct vcpu *v, struct cpu_user_regs *regs,
> +                              unsigned long crs[8])

Would this better be placed in hvm.c now that it's a HVM only
function?

> +{
> +    struct segment_register sreg;
> +
> +    crs[0] = v->arch.hvm.guest_cr[0];
> +    crs[2] = v->arch.hvm.guest_cr[2];
> +    crs[3] = v->arch.hvm.guest_cr[3];
> +    crs[4] = v->arch.hvm.guest_cr[4];
> +
> +    hvm_get_segment_register(v, x86_seg_cs, &sreg);
> +    regs->cs = sreg.sel;
> +
> +    hvm_get_segment_register(v, x86_seg_ds, &sreg);
> +    regs->ds = sreg.sel;
> +
> +    hvm_get_segment_register(v, x86_seg_es, &sreg);
> +    regs->es = sreg.sel;
> +
> +    hvm_get_segment_register(v, x86_seg_fs, &sreg);
> +    regs->fs = sreg.sel;
> +    crs[5] = sreg.base;
> +
> +    hvm_get_segment_register(v, x86_seg_gs, &sreg);
> +    regs->gs = sreg.sel;
> +    crs[6] = sreg.base;
> +
> +    hvm_get_segment_register(v, x86_seg_ss, &sreg);
> +    regs->ss = sreg.sel;
> +
> +    crs[7] = hvm_get_shadow_gs_base(v);
> +}
> +
>  static void _show_registers(
>      const struct cpu_user_regs *regs, unsigned long crs[8],
>      enum context context, const struct vcpu *v)
> @@ -99,27 +132,8 @@ void show_registers(const struct cpu_use
>  
>      if ( guest_mode(regs) && is_hvm_vcpu(v) )
>      {
> -        struct segment_register sreg;
> +        get_hvm_registers(v, &fault_regs, fault_crs);
>          context = CTXT_hvm_guest;
> -        fault_crs[0] = v->arch.hvm.guest_cr[0];
> -        fault_crs[2] = v->arch.hvm.guest_cr[2];
> -        fault_crs[3] = v->arch.hvm.guest_cr[3];
> -        fault_crs[4] = v->arch.hvm.guest_cr[4];
> -        hvm_get_segment_register(v, x86_seg_cs, &sreg);
> -        fault_regs.cs = sreg.sel;
> -        hvm_get_segment_register(v, x86_seg_ds, &sreg);
> -        fault_regs.ds = sreg.sel;
> -        hvm_get_segment_register(v, x86_seg_es, &sreg);
> -        fault_regs.es = sreg.sel;
> -        hvm_get_segment_register(v, x86_seg_fs, &sreg);
> -        fault_regs.fs = sreg.sel;
> -        fault_crs[5] = sreg.base;
> -        hvm_get_segment_register(v, x86_seg_gs, &sreg);
> -        fault_regs.gs = sreg.sel;
> -        fault_crs[6] = sreg.base;
> -        hvm_get_segment_register(v, x86_seg_ss, &sreg);
> -        fault_regs.ss = sreg.sel;
> -        fault_crs[7] = hvm_get_shadow_gs_base(v);
>      }
>      else
>      {
> @@ -159,24 +173,35 @@ void show_registers(const struct cpu_use
>  void vcpu_show_registers(const struct vcpu *v)
>  {
>      const struct cpu_user_regs *regs = &v->arch.user_regs;
> -    bool kernel = guest_kernel_mode(v, regs);
> +    struct cpu_user_regs aux_regs;
> +    enum context context;
>      unsigned long crs[8];
>  
> -    /* Only handle PV guests for now */
> -    if ( !is_pv_vcpu(v) )
> -        return;
> -
> -    crs[0] = v->arch.pv.ctrlreg[0];
> -    crs[2] = arch_get_cr2(v);
> -    crs[3] = pagetable_get_paddr(kernel ?
> -                                 v->arch.guest_table :
> -                                 v->arch.guest_table_user);
> -    crs[4] = v->arch.pv.ctrlreg[4];
> -    crs[5] = v->arch.pv.fs_base;
> -    crs[6 + !kernel] = v->arch.pv.gs_base_kernel;
> -    crs[7 - !kernel] = v->arch.pv.gs_base_user;
> +    if ( is_hvm_vcpu(v) )
> +    {
> +        aux_regs = *regs;
> +        get_hvm_registers(v->domain->vcpu[v->vcpu_id], &aux_regs, crs);

I wonder if you could load the values directly into v->arch.user_regs,
but maybe that would taint some other info already there. I certainly
haven't looked closely.

Thanks, Roger.

