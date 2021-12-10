Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA63D46FE0B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 10:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243671.421580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcOb-0001bx-4h; Fri, 10 Dec 2021 09:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243671.421580; Fri, 10 Dec 2021 09:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcOb-0001Zh-0y; Fri, 10 Dec 2021 09:40:53 +0000
Received: by outflank-mailman (input) for mailman id 243671;
 Fri, 10 Dec 2021 09:40:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/FQ=Q3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mvcOY-0001En-Ni
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 09:40:50 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4045abbc-599d-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 10:40:48 +0100 (CET)
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
X-Inumbo-ID: 4045abbc-599d-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639129248;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ypTxCdICQoNxy5RsIr8bp1QL+9ixRXKt+hM8zLxPkqc=;
  b=O82RI0Yvoc3dRVwnv7tVpfJSQtCM5YUZnZovfgL55/2GchNvmiCQDAuJ
   Ml1UPUn6et3BJ51kuWWdrEQll259Wyrp1gGeYRbmkoCmlv8pdRYj2465F
   OD5fW1VM330ulkfCdDI/4Bh8GZwRnx1/odhc6eXHmb1gpQsW8+PnOnoww
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 20nt6s2aK78oGIjHzTiPvgyIC7pGXJpjpf4p35iEQYwj40djTF7oxLWvh8jGEfVP9YWZY8Tirt
 K28kw68m4r/tgjD09K6FZYgvispUX8yOqWcC4UBQh+HnHI8nN0W7+hiKbwR2nO8jncwuBZurYq
 OuYrT8Y8DKNxMf6SnhkOvYw2B0pGIuuGw6to3DYVVqYwYTIX+H+O3HkrVcmMj37pwEOos42C3Y
 2v3GVbzXyS6VgPgbYJwr3bZD1vxN9uD+wgX4TeDF+GRr+V/ER6b/iYCoJ3uvQkUc/UU17kmhPG
 ol1qUk/gipRXeAfdE/Fz2Srx
X-SBRS: 5.1
X-MesageID: 59667623
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KnjDkqPxpGeFaDDvrR1HkMFynXyQoLVcMsEvi/4bfWQNrUp0gTwDy
 mdNDGqBbquCMWPxf492btvi/EsC75HXx9NrHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400s7w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoyyPlopP9
 clijKGpTikWDqP1gcoiXjANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/ibu4EHgm1r7ixINa/3T
 YlaNz10Vz7dcQNJEX0bGpU9zc790xETdBUH8QnI9MLb+VP71AVs1JD9PdyTfcaFLe1Kmm6Iq
 2SA+H72ajkYPtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUj7gjX9JfIzD+kH28qcQ5PUcUIi8IfEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSLhRqjBNzAJrVkg
 JTis5LGhAzpJcvS/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZdcJmK1P
 heC5Vs5CHpv0J2CN/cfj2WZUZtC8EQdPY69CqC8giRmPPCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMxiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:zWgr4atOOdlyHeYU5qlNAj5h7skC7IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLnAbV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqpmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87isIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXsHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa13ackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmP29yV0qp/VWH/ebcHEjaRny9Mw0/U42uondrdUlCvgslLJd1pAZFyHo/I6M0kd
 gsfJ4Y042mdfVmH56VMt1xNvdfOla9Mi4kD1jiVGgPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.88,195,1635220800"; 
   d="scan'208";a="59667623"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fq71SeUkMIG5r3wh2VAJ8aAUhtmXXVCivspvkM/8V2ALLc1gSHjlIRG301fWB5c2XHthoo250ve/ms6bOkHGJ5EkVlMbtXZaUlcqVx6d/MELTKO00bJ8YorVmG6+yQLJuM4ppFDvsbhOQZDL4Tn5da40HecfmeLh3Ch2BDA2WgEfqXlP7XC/udP5BIbtUGkql10HI9SnazxRQ/bvfxybZLaklhGZs/0icUaf+mXujIsOKPK9ZgjaGwHXfHT9YJzZfmHJOmUTDa4rT/rl+T6R2l1XBnB/prWZzqH6z2CCQecCqMhnOWMYXX+3YoJXyTYs3a6DTuqMMz34Qr3KwucVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIyypW6AzLL5gp/yEy22ql5gxDAYqGlkZ9UX1xagXgM=;
 b=QQma8yulTZ5H14tzZy6OaSMVP2mEfUHcZGZVt/hE5Is6cAQ5dxtTqCitS/AoRhwd2Y1NLYsxUs/SObrSpESnshndNhwTK2r3RreYkwBykIkPhcTlJwpCHY9TnWQNKl0sHTwWC+PfF0MyleRr0e8GL1uBHBpQ5yQQIKt3tp2YF0iluI5Q03Lkuapw3FhXABYShkwOWiJhUNNNfHc3DqXnk0HoiK7KbLZ6rHxcnfXMCb9iICD2wiYPie8YYE97/UhAdN/ppsDSMNdRU9kTGhXI1MZ5OuykmJoVOhcutXlL/bmts7Zsc+GHMX2CzwwVhD4s9EB0Yq6kbSU4fCdBG2znnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIyypW6AzLL5gp/yEy22ql5gxDAYqGlkZ9UX1xagXgM=;
 b=xG6sn8NG1fmeZhalWRxehpqv0BwBLSXRIkAJG1GVRfnk+1iJsQYQyrsoHXzonAs7awHSAx969zRxOXxcvefk6li1aCa1oZmK0JXZ8zI3AvZkAQyp7aqyzz+54YvVBZ6GBGGoY7inA9Mpd1Oj9EYnapH3EVVOTsGk1dCNB/bcn1Q=
Date: Fri, 10 Dec 2021 10:36:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 07/18] IOMMU/x86: perform PV Dom0 mappings in batches
Message-ID: <YbMfnFWIlSN+GXH9@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <cc183d61-f4ed-1cf5-185b-0673c9927892@suse.com>
 <YajTvrZz0xGOR3vT@Air-de-Roger>
 <2a3a0a37-525d-e2aa-b396-b01d97434d56@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a3a0a37-525d-e2aa-b396-b01d97434d56@suse.com>
X-ClientProxiedBy: AM0PR02CA0211.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63959696-634c-49ff-bfd5-08d9bbc08e8a
X-MS-TrafficTypeDiagnostic: DM6PR03MB4841:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4841727490CB534E2C7563028F719@DM6PR03MB4841.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nIpOMpHpFapRijrW4nGymNa0KQyneYWotF6HbEd+CTVKh6e5+zBMKGcwbOKH64xrzI0CAO3tD2zT0pkEHNK2UUmk6iUqFGolN0cq8+Vazkzn6eD2uQwKmcAAQWE5VzHlDHINSewbe/PcubHnsuA1BbI5pdyLA6VqywCzuWbC8sQtRH+o0IYxIhX5X3y67NW6hEddpAdBS1vAauMQIUvjIVmOQKyE/1+i6K40zt7/R3nrLS+XLgzuziKJ1AkNwccvQY0BITLfn1avakDKGye3D03c5eEuFqKTyV2qxIWRLKEKnTCYacMb8Y/7rD/5xFrVlqK06AcCPHYj1YtCcwUZNsMlCqlqySoomOu2t24T8LS/RGlpBXRHlDUc63uWY/uv9FnsFXi//Th6ocb9VKNPfu4rGfCpULpPKVE4Y2ysHf7YeHWzLXJVrz/bsAd720miLaSbvD8ZdYWaj3gl4kQPcjNvT+TiCEcBu402a/L5WWpEV9a46Hk5txSORVPqpkGSGhKx5wy+cOcgAIpixvTCEWG+fb+bueLuzhne1uNKDyF3AqG3DWXPYCkFji2LD8BLTrTE6kL5RG63dDkDielBS8EUhlmdakrHGnpD0UtFCYAp8Pd/4d5A7D4OIs2wyDC6QyflHVKqpIllzw/4r4EXztqE7boAdKCPlYlxulZj37HZ1z7tfilAWgHrneRxGt2gCVDsfmn9k0OkZY5KemiIRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66476007)(186003)(66556008)(86362001)(66946007)(54906003)(4326008)(6666004)(53546011)(8936002)(956004)(26005)(2906002)(508600001)(6496006)(6486002)(5660300002)(33716001)(8676002)(82960400001)(316002)(83380400001)(6916009)(38100700002)(9686003)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekZZTzg1MDVvendCSFlkR2w0R0RPNTZvV3dFNm5QdGtsbVQxSk4rb1VjM1Ra?=
 =?utf-8?B?eEUvYU5LMW1UQkJhN3BOWHFUQXk1ZWlyOWw4RzN4RUVwOUszdVFybUQyTkww?=
 =?utf-8?B?Ui9BZkc4RW4vMXFJVDlOa0JPK3hDc1ZCTFVUcVFRc0FyUnNGUmFTV0ticFFG?=
 =?utf-8?B?OXV6SjE1S1dxNlJIWnExZXF0OFl6bDhQRUFTUTN5YytFU1NFWU9vM0F5MWRu?=
 =?utf-8?B?dTRvZnFCUlo3dHZOUWxrRDVIQnRHbHdyOVZraGVaSWhkNUEybG4wRDhtL25z?=
 =?utf-8?B?UHcrMFgrS1BxaEljL1lOdnhueUVZZE15aDZFZGNkbVNaMC9GamUrNFVvRVNZ?=
 =?utf-8?B?RmFHSStWSE5rTHdtRElWQU9lbVdNeUJ3ZnZhR0xUMVBFYlBVWGhDdDJNaW1L?=
 =?utf-8?B?d2VtL014cCtWVCtlRnFxVmUzTFJkd1JXS0lVMStGZzRmTEsrYVh6TmFVWW5s?=
 =?utf-8?B?cHpsVGRacUZNVFZEcXQzT25GdHNBN0hwSS9XbTMyOWNJQ2twTXVlbkpINTJ5?=
 =?utf-8?B?OVE2NDg4YU1Ud2NtQVlSaW1taVowSU1yNlh4MzNoSVY2dFVQNWxQUi9ZRTBm?=
 =?utf-8?B?Y0tLMlhPMlVCemF0bmd4dEhRWXFkNkY4YUJPMXdPeGNqTlVNNW1VcDRMZlgx?=
 =?utf-8?B?UjQrWDJ5S3RKUi9saUJQTGl4VlVoUEFoTm01SGtvK09IdmVxQkRGYTFiSWZW?=
 =?utf-8?B?NzJraC9jWlpYQnFPa0EvS0prMnNYdXlPdE1ZNy9VZFJUNlJ2MThTTGgvSTBo?=
 =?utf-8?B?REdXQjBqMzlWQzBqYmw3b1NESFNzL1EwMlVCQzJJcWQ2dDZBbitkZkltV3ha?=
 =?utf-8?B?V3liWkd4RFFyK0l2aEJkWVBxTzBqMVpnYU0vSjJMN1hsbTlOSHRDQkEyRFg0?=
 =?utf-8?B?bXg5ZmdiQ1dWTmozOTdMV09vdFlUSWJNb25KZzc4b3oxcWRWL3g2TGFHcDJD?=
 =?utf-8?B?amFGaXpsRGJEeUphclZyWmRtaU9JNzl1YXdINlF4SWJ5VW9VQjRWZDJPc3Vq?=
 =?utf-8?B?MHNxV091MUZVbENta2VOM202cDY3dVNjN2JWeUpvL1NOd1QxSWtPVEZOaTZF?=
 =?utf-8?B?SGtjeHlRbElqMFJBcVcrVFlFcDhVL0hkcWZJNERNMytMdVAxSDQ5RE9PaEhQ?=
 =?utf-8?B?aTIrV2pZeHQ3VVkrWWpuSGp5aElKZ3JOaWQ5N1QzdC9oUURTV3pLTmlUYXVH?=
 =?utf-8?B?QmIySTZvTFNiYUtMc0NoZmVJR3QzMThXMWNsTmdhWFVVZ29wVjY1MkFacVRv?=
 =?utf-8?B?VWY5d1RSa3Y1OC82YnNGOTRmMkJnUis3OUtNdm9nYmkwdWZXRm9iNzhLL01o?=
 =?utf-8?B?ZVBRdEpvb1BqUnhzOWdKU2hhWXo1UmdVV2VMTXFnU1cwNDhDc2V6QXdJL1F3?=
 =?utf-8?B?Q0w2ZHlReFVoMDNGVm9IZ3I4eUw3TThRcnpsa01rOXQ1c28wSDJsd2NwQzBO?=
 =?utf-8?B?S0ZMamtGTEEzdjlLQWdzbDhGL1B4S3VhK1dNMFdVZCtBZzQyM2N3UGI2V1hj?=
 =?utf-8?B?OWZ2WmJwajVOM21DWFpuUFhCRmFNdzZnMEQvQloxYnNLbng4WTR4Qnp2eVRw?=
 =?utf-8?B?TzVqK1MxMjVZbEtVbU5pdWZMZHdsbnhtTDVCelFrRHZHb0UzRFFNNmFJb1BJ?=
 =?utf-8?B?YU9MaTkxNzJaeHRWbmdiOVc5THhubE9PeStQOG5IZHJER2N3TXJNWGI3Ymc3?=
 =?utf-8?B?ZjYwYzRId3M2U1o0R002SmlxMm1kdkFLeE8wNkpRSjdoWlNWeUxaRmlCWXpw?=
 =?utf-8?B?VDJXMXdXLzgrR212alFPb3IvTGVuVHdLOURjZTkxcWxrMEZvNGk5YlBBUDNK?=
 =?utf-8?B?VGExckdtdGF4OFQyNFIyVWpmV0U3ZVZJeXNtU0J4Wi9pbkxRWnRsS09JY0Nq?=
 =?utf-8?B?Yk03SEhBbk9ZS2xDb0J2MDlrZW1kQnBiNnI4QkhtR1JzSlJhRlZITTUzMGRM?=
 =?utf-8?B?K0NlZEV3NEtxc1NnRXZZTlNST09NdlJGRGVBejBKUmZyVUsyK0taTkNDc1ds?=
 =?utf-8?B?eVYva3pmbk1JZnJPQStadU4wZXNXbGVIMXR1dmc3a2MxR1RvajJpS05kZW1t?=
 =?utf-8?B?cHJzTVlaRXpRNldZQVNvckxGR05sd3FiclJTUmE3WVF1eTJ4VXc3R1Rhbm5L?=
 =?utf-8?B?WE1GOGZxSmRxZmppMDV5YWlHOHFyLzMvYWFTMWg2d1kyZUExRXZTcFBXcTNa?=
 =?utf-8?Q?4hGsJIemJrr9L+5z2xY8rEg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63959696-634c-49ff-bfd5-08d9bbc08e8a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 09:36:35.0841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vo+PwqUCQLqoiGTaM9BWupiIqfxqN04mvtmJCImJ0Yqo+5xBy/hcHwRe+5sU6GRRrAxyUQPxZWJUsNx4OiSEGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4841
X-OriginatorOrg: citrix.com

On Fri, Dec 03, 2021 at 01:38:48PM +0100, Jan Beulich wrote:
> On 02.12.2021 15:10, Roger Pau Monné wrote:
> > On Fri, Sep 24, 2021 at 11:47:41AM +0200, Jan Beulich wrote:
> >> @@ -689,7 +763,8 @@ int __init dom0_construct_pv(struct doma
> >>          l1tab++;
> >>  
> >>          page = mfn_to_page(_mfn(mfn));
> >> -        if ( !page->u.inuse.type_info &&
> >> +        if ( (!page->u.inuse.type_info ||
> >> +              page->u.inuse.type_info == (PGT_writable_page | PGT_validated)) &&
> > 
> > Would it be clearer to get page for all pages that have a 0 count:
> > !(type_info & PGT_count_mask). Or would that interact badly with page
> > table pages?
> 
> Indeed this wouldn't work with page tables (and I recall having learned
> this the hard way): Prior to mark_pv_pt_pages_rdonly() they all have a
> type refcount of zero. Even if it wasn't for this, I'd prefer to not
> relax the condition here more than necessary.

Right. Page tables will have some types set but a count of 0.

> >> @@ -720,6 +795,17 @@ int __init dom0_construct_pv(struct doma
> >>      /* Pages that are part of page tables must be read only. */
> >>      mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages);
> >>  
> >> +    /*
> >> +     * This needs to come after all potentially excess
> >> +     * get_page_and_type(..., PGT_writable_page) invocations; see the loop a
> >> +     * few lines further up, where the effect of calling that function in an
> >> +     * earlier loop iteration may get overwritten by a later one.
> >> +     */
> >> +    if ( need_iommu_pt_sync(d) &&
> >> +         iommu_unmap(d, _dfn(PFN_DOWN(mpt_alloc) - nr_pt_pages), nr_pt_pages,
> >> +                     &flush_flags) )
> >> +        BUG();
> > 
> > Wouldn't such unmap better happen as part of changing the types of the
> > pages that become part of the guest page tables?
> 
> Not sure - it's a single call here, but would be a call per page when
> e.g. moved into mark_pv_pt_pages_rdonly().

I see. So this would result in multiple calls when moved, plus all the
involved page shattering and aggregation logic. Overall it would be
less error prone, as the iommu unmap would happen next to the type
change, but I'm not going to insist if you think it's not worth it.
The page table structure pages shouldn't be that many anyway?

> >> @@ -840,22 +928,41 @@ int __init dom0_construct_pv(struct doma
> >>  #endif
> >>      while ( pfn < nr_pages )
> >>      {
> >> -        if ( (page = alloc_chunk(d, nr_pages - domain_tot_pages(d))) == NULL )
> >> +        count = domain_tot_pages(d);
> >> +        if ( (page = alloc_chunk(d, nr_pages - count)) == NULL )
> >>              panic("Not enough RAM for DOM0 reservation\n");
> >> +        mfn = mfn_x(page_to_mfn(page));
> >> +
> >> +        if ( need_iommu_pt_sync(d) )
> >> +        {
> >> +            rc = iommu_map(d, _dfn(mfn), _mfn(mfn), domain_tot_pages(d) - count,
> >> +                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
> >> +            if ( rc )
> >> +                printk(XENLOG_ERR
> >> +                       "pre-mapping MFN %lx (PFN %lx) into IOMMU failed: %d\n",
> >> +                       mfn, pfn, rc);
> >> +        }
> >> +
> >>          while ( pfn < domain_tot_pages(d) )
> >>          {
> >> -            mfn = mfn_x(page_to_mfn(page));
> >> +            if ( !rc )
> >> +                make_pages_writable(page, 1);
> > 
> > There's quite a lot of repetition of the pattern: allocate, iommu_map,
> > set as writable. Would it be possible to abstract this into some
> > kind of helper?
> > 
> > I've realized some of the allocations use alloc_chunk while others use
> > alloc_domheap_pages, so it might require some work.
> 
> Right, I'd leave the allocation part aside for the moment. I had actually
> considered to fold iommu_map() and make_pages_writable() into a common
> helper (or really rename make_pages_writable() and fold iommu_map() into
> there). What I lacked was a reasonable, not overly long name for such a
> function.

I'm not overly good at naming, but I think we need to somehow find a
way to place those together into a single helper.

I would be fine with naming this iommu_memory_{setup,add} or some
such. Marking the pages as writable is a result (or a requirement
might be a better way to express it?) of adding them to the IOMMU.
Would you be OK with one of those names?

> >> @@ -372,16 +372,30 @@ void __hwdom_init arch_iommu_hwdom_init(
> >>                                          perms & IOMMUF_writable ? p2m_access_rw
> >>                                                                  : p2m_access_r,
> >>                                          0);
> >> +        else if ( pfn != start + count || perms != start_perms )
> >> +        {
> >> +        commit:
> >> +            rc = iommu_map(d, _dfn(start), _mfn(start), count,
> >> +                           start_perms, &flush_flags);
> >> +            SWAP(start, pfn);
> >> +            start_perms = perms;
> >> +            count = 1;
> >> +        }
> >>          else
> >> -            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
> >> -                           perms, &flush_flags);
> >> +        {
> >> +            ++count;
> >> +            rc = 0;
> >> +        }
> >>  
> >>          if ( rc )
> >>              printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",
> >>                     d, !paging_mode_translate(d) ? "IOMMU " : "", pfn, rc);
> > 
> > Would be nice to print the count (or end pfn) in case it's a range.
> 
> I can do so if you think it's worth further extra code. I can't use
> "count" here in particular, as that was updated already (in context
> above). The most reasonable change towards this would perhaps be to
> duplicate the printk() into both the "if()" and the "else if()" bodies.

Maybe. The current message gives the impression that a single pfn has
been added and failed, but without printing the range that failed the
message will not be that helpful in diagnosing further issues that
might arise due to the mapping failure.

> > While not something that you have to fix here, the logic here is
> > becoming overly complicated IMO. It might be easier to just put all
> > the ram and reserved regions (or everything < 4G) into a rangeset and
> > then punch holes on it for non guest mappable regions, and finally use
> > rangeset_consume_ranges to iterate and map those. That's likely faster
> > than having to iterate over all pfns on the system, and easier to
> > understand from a logic PoV.
> 
> Maybe; I didn't spend much time on figuring possible ways of
> consolidating some of this.

I can give it a try after your code is merged. I think it's getting a
bit messy.

Thanks, Roger.

