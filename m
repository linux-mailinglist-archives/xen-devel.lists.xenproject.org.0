Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64F336C27E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 12:14:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118266.224327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbKjC-0003rL-IJ; Tue, 27 Apr 2021 10:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118266.224327; Tue, 27 Apr 2021 10:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbKjC-0003qw-En; Tue, 27 Apr 2021 10:14:02 +0000
Received: by outflank-mailman (input) for mailman id 118266;
 Tue, 27 Apr 2021 10:14:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdCB=JY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbKjA-0003qr-52
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 10:14:00 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbdd89e2-0a8f-4c64-8b84-a33d84ffa95f;
 Tue, 27 Apr 2021 10:13:58 +0000 (UTC)
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
X-Inumbo-ID: bbdd89e2-0a8f-4c64-8b84-a33d84ffa95f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619518437;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7jDF6Wvf8LVzhXAQGKXkV6e43XO9sOj1GM8weZbQFQE=;
  b=F7t3H+hpdNi3IhD0gZRch9sPqyc+nlfW0b1uTzAtCwFMF6ncR9+gGmOZ
   esGSK2U1kGGkeiWuLJLse5CrzUyKJFeGhiqLYnw3dRV5rpbR5mk9GZx/Y
   XkDVwF4EeHfh5ynvqQWqMempNF4BZZWnIkpcgCCjODhARziUTIVl2ZVRR
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: W7EoRAjsmgLknpOKyR85bYP4doE++5uewmPnaULHx4MoCQs91YxbhTr+syaksVCdelZ/BBgxsY
 Zy1lYywvLPyJqINzUwymRXkmbtIPZtCmfnvZGz0fvfB+P6kZQNoj5/OwiTc3yRXLEMysDSMQEJ
 g6LZwZUT4tXIt3Pfn6BS7Ebt8Gyv81KMPzVwLnE9F7ThhXL7I+mda6H45EuKZ4VuhVrdHw76WO
 zTtMMZ00qBGuePNAIOmorC45i+QmvX7yEfV13utThqqemCNDj+wz/kKuEzQx2+v2zWTl1oRYPy
 rF8=
X-SBRS: 5.1
X-MesageID: 43991520
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9uR0lqDPv6BfyG3lHej/tceALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPvfVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VLdMgXE3Kpm2a
 9kGpITNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0McShBQchbnmNEIyycFVB7QxQDIJI/Go
 aV6MYvnUvfRV08aMOnCn4ZG9XZr9rQm578JTIADRgr6A6B5AnYl4LSOR6ewxsYTndz0a4vmF
 K17zDRy4eCl7WAyhHa33LO9Jg+orrc4/ZKGcDksLlvFhzCkQCtDb4RPYGqnDdwm+237UZvrd
 +kmWZcA+1Wy1f8Ol64ugHs3Q6I6kdd11bHxUWDiXXu5ezVLQhKc/Zpvo5SfhvH50dIhrgVu8
 gnrgHp1esiMTr6kCvw/NTOXR1x/3DExkYKquIPk2dZFbIXdb45l/1twGpuDJwCECjmgbpXad
 VGMce03ocyTXqndXzD+kFgzNuwN05DZCuucwwpv8yY1CVuh3Zpz0cU79x3pAZxyLsND7ZD/O
 jKKaJuifVnSdIXd7t0AKM7TdKwEXGle2OMDEuiZXHLUJgdPXjAsYT67dwOlamXUa1N6KF3tI
 XKUVteu2J3U0XyCfeW1JkO1hzWWm2yURnk18k23ek4hpTMAJ7QdQGTQlEnlMWt598FBNfAZv
 q1MJVKR9f+MGrHA+9yrkjDcqgXDUNbfNweu949VV7LiNnMMJfWuuvSd+uWDKbxEAwjRnj0Dh
 I4LXrODfQFynrudm7zgRDXVX+oUFf454hMHK/T+PVW55MKMqFKrwgJmXW07syGMlR5w+sLVX
 o7BImivrKwpGGw82qNxX5uIABhAkFc56ilc34in35ND2rENZI4//mPc2Fb23WKYjVlSdnNLQ
 JZr1NrvYa+L5mawzEeG8uqW1jq1kc7lTavddMxi6eD7cDqdtcTFZA9QpF8Eg3NClhTlRt1rn
 xALCsJXFXWGD+rqajNtu1WOMjvM/1HxCu7K89drnzS8W+Go9s0e3cdVzmyFeiNgQgvQDJQrk
 Zr87AWhYeBnTrHExp6vM0IdHl3LEiHCrNPCwqIIK9OnKrwRQ12RWCWwQCBhwoLYWrs/UUKjm
 nHJSmZEMu7WmZ1izR96OLH4Vl0fmKScwZVZmphuYNwL2jAp01+yPSGfKa1zmuXZGYT2+11Ck
 CxXRIiZidVg/yn3h+cnziPUU8rwZgjJcTxJrUuebO74ALgFKS40YU9W9NE9pdsM97j9tIRWe
 WEYgmPMXfTEOUywTGYoX4jJQh5oHQpiunTxRXg9WS0tURPWsb6ERBDffU2Mtuc52/rS7K0y5
 1/l8sypvb1HWPraNKKoJunJAJrG1f2myqRQO4po5wP4v53m7t3ApXBUTzHkFtAxw4zKc/olE
 UYBIR3iYqxTLNHTog3QWZ++FFsqfGkaG0MmSbyCvUlfV4sg2TAVun5robgmP4KOAm5uAD0OV
 Oj6CVT8PfOYjub2dchetUNCFUTTHJ51W9r8+yDfbDBEQmGd+lM+1yhL3+2GYUtAZStKPE1rh
 xg5cuPkPLSXy3k2BrItT8TGNMAz0+XBeezChmLA+hG7piTPkmNmLKj5IqWgC3sQTW2L2Qeio
 stTz1fUu1zzh0jhpYwyC68V+jepV8kiUJX5XVfrWHWs7LWqlvzLAVhKg3WgpJfQDlVPDyptK
 3+gJml/UW4xiNE15nFHFpXZfdUFbErP9LKExs=
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="43991520"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrqTFBs1m9n/0dz/kFqflQiBmQ/Ulyaybk4/pinJnE6SknLBW4aKcioFYmsVqBb9lTp+XpZv8P3jFbSuyCQVSDAX/2HtdQJZ1Ip4F0UI4lxPE//tgJxYnWUL8BWwMtgoKqbSqHspfzlh0Rr7W9FnIhY3EAJK5T8b4J5ii0C/rJW4e/KG+gD+LQMp1MZMCmfFYkLlYSsOwVYcMmNQXsC/FZRMUuZz8krrsuzEXAKECSUz6VO08GSHr9NbM7YbvjsY4Juu0FhqgcLF4qCn92rmuUmZ0Lu5LZ1Iw/TGaoK3t+kx9YqtGYBOnaNNva2ysdFxkjWHtjWOVRUGlrUoUKYNjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdDLMUlgbjmhB7z9vklvy5BuyDYDvl/ql/xjhKF4GR0=;
 b=TW8Kk6rI8y70SiWs/0HaTJV79X7kDwvtas+z/gDUNCq2VsHHtobAz1eZ0DZFhpkjP2TnDgqzFVqDm/vWQM83aPNZ8n9PpeHpxtQrCxX4US1R9iqHe4MOp/102Gbl9xpv/3GodMFj9XvWVScKvMH1aumKniq8YUhSV3U0wjFG1K+Y0GEiJu5OPJLtWrOw/0vQ6LFYMepdjEsf0AN1JJKqN9IT8GBnlX1Lp8N3NaVEsYxAyY319pb/smvq3bPLGHOlTk67UB/4UWC0ciiCshh9tfsr12qQO1yHZ8+g3rm6VS0J1v4qHmtDdGAO+Pon4iK2bp8mJKD7zvPF1VP8OtIupQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdDLMUlgbjmhB7z9vklvy5BuyDYDvl/ql/xjhKF4GR0=;
 b=g+Pa0WAfophBiFz4CDzAYokmS61BY7BHOH4QWj8DX+HEo+ClASxitlXNobOWhJVKl4txtu/AmgVpA4ztuq+3EuHo5/UjtwK3e3TToUFIWfWANPKmOk6fFzrTL13lmAh5SB0NiB3Mk6a2tj8MUDJfmO3k4S6lHc6soud3lOV46Ic=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <03630ebd-861e-b02c-e845-1e2324211562@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/3] x86: Initial pieces for guest CET support
Message-ID: <3e5369d1-a6eb-92c4-868c-0b9d205aba7a@citrix.com>
Date: Tue, 27 Apr 2021 11:13:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <03630ebd-861e-b02c-e845-1e2324211562@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0206.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5db2505b-bfa1-4b54-94bf-08d9096528c1
X-MS-TrafficTypeDiagnostic: BY5PR03MB5284:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB52846098FD84EC5D597E3535BA419@BY5PR03MB5284.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RkOdrQPsdd0XbuvM/EGExN1DAU4s1hGoEd/wQS5U637loXcON5AkBzHZwQgKrng3P5qvLmsbd+VIzHyycVZhT+YTTo5IluMLNcNIpvqyZ96Km+1DuR/AQRWcmUIJ8p10An1ooVozc+U6g9gXAZFrWf4dgNNfXZ61NCGQAefklME3qN/h7aziaBiw1JS1j5HoGw5Uz2PbBryM1RVJMXSAXhEURSsA9M8VB9CcpT1VrWbjFygB0nsfqVq1MMWeMP6HoRbc2hZHgKy8u3vIPAYRCMqSjNnsw2V061fmaRbyTqlPpkzsTrNWFRN09vFgGSK+Hc16nXx+KinxJ05stoYBA1nXOi166q8wWIGzzZSyR7h0r6pPaH5kxbLNp8MQ7LFrdKdNt968oE4+UOP9FJ/MnkfjcYo8gVBnw30Tr3DXJ0jzagvLjKlg6h5X2SSMF11L/T2D2T9ZXpUzNE8GEdnNYj6OST3CPu260iUxKXpoxuWlTMAQt69gqvuEH63+jJ0nqhDVJXy7clZSSdohb2dmPR5wDuMSgvuAGmG5SYND5syJrguEa/7DNJ4pYIi+GEFnBBESIHamJFLF79yI74SpmrHHTn5ZJ+Vx7iLqCoog/J0fWbBOuqgadJG3BtbP9laD4o415baBNq5x0wvu1VwHdP0kuriTxHbO+jg4QBt8dvUAAy7KETtwt+Wmo7tLdoWm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(366004)(376002)(39850400004)(36756003)(66556008)(66476007)(6666004)(8676002)(31686004)(26005)(956004)(86362001)(2616005)(8936002)(66946007)(2906002)(83380400001)(53546011)(5660300002)(478600001)(38100700002)(54906003)(316002)(6486002)(4326008)(31696002)(186003)(16526019)(6916009)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WEo4QUg1RFcxYVlNdDRENHEvRzlEVk5KdEptSFNMaFpRb2VsV0pVaDNBb2Zm?=
 =?utf-8?B?MVNhc0x3UE5RRW0wRWZxMytBNWdkK3plNHVZTVFTaUc0Rk12c0NVYXVVdVor?=
 =?utf-8?B?RUpNeXJ5aURLeDBHbTN4UmR4SExGVmdkNHV3eUlEZlZ0T25aU1hkWGEvRjF1?=
 =?utf-8?B?Ujhndk04YUVmUXYvWWdVNHdmeTlzOXBVOFR2dTErZEhMZlNDNVVybnVhcW5k?=
 =?utf-8?B?Rk9LU01nNlVIdjdBNE5ueCtjSndSRjB0TDBpbVNaUUYyV1lzalYrY3RuTnZO?=
 =?utf-8?B?NGlXWE5NaVJyYm4yUHlCL3BXL3BlbWVHMTFvaHVsVWxsQzZDM2FsdWkvQUdU?=
 =?utf-8?B?eUlMbks3ZzhIN0hsRXVvaEN3RTVhY3NXQTM5RmNvVFFUR091SEtrdVNXTGtO?=
 =?utf-8?B?NDNCS2xKMTBLaDlMNUVTOU83clhIY0FqM2RhWG1ERk1jczh6TVR2STkycThh?=
 =?utf-8?B?eUFYNlAyclVEVkJxZ1RUODNUT04wSUljaVZ2VnEzak1tL2tDS0JhcnFXZ29K?=
 =?utf-8?B?UVI0bHJZOFRXUnp3VDdSZEN3MHBpUFg1dzVIMlVidVprOUU1ZHlkaUpaQmlR?=
 =?utf-8?B?U3d6QlE0U0ZnTWdONkY2cnFnZGFXTnI1OUsyU3pNLzJac3NnU2kxVUIrZWlB?=
 =?utf-8?B?dmhqVjZOQWtma2pvN0hZSkVqaGY2NWZjWFliWVJiR3owV0VnVUpjWWp4dnJL?=
 =?utf-8?B?Q2lKMUFXbHIwRFgrR0hIbUZHTDdHVHZuWlhRdUtmZHNaeVU1OVFDNVN4RTUw?=
 =?utf-8?B?azNXcXZRT2MwalRWL2RwUmduY3hMMEk5bGNXK2NZa3NwamwxWXY2VnZmZDFY?=
 =?utf-8?B?d0tPb2FDR0NWWGN4dEp6amhYalBpV0VBVEo4aEZPc01XZnJSa1o5eVdScHRS?=
 =?utf-8?B?bW5JUHFzVDZKd2VOSWdFcm5IenpXZDhFZDFIdDJXSnc4TWVYYXVLQTBEakVK?=
 =?utf-8?B?L0lXcFU5dnpDakliOVo5cDJJVFdSU3JnbnpkcE00ZzJvd28wRHorOStKL2lG?=
 =?utf-8?B?NUxBNmRXOERsY2tkTGg1ZWhGZmJHZXNKQXVMMVNGOHYwZk5XVndaR0R5S2Fq?=
 =?utf-8?B?Y1VuT1lKQk5uNnM5TWZxa29jSiszVy9QQitrU2x5djFtLzlYeGNxR1RKamJ6?=
 =?utf-8?B?U291bUt4N2VXYTQ4M2k0Wm5QRFRKQyt0UXJWSElUTXRabFlTalRPdFQ3cmxj?=
 =?utf-8?B?QXFKMU8rZHVrMTZLSUlYYlhFSzdYQncrTTFuNUNub0lrSkpBZ1ZodWtlK3Rq?=
 =?utf-8?B?T0MwVmFHV2dhZXc4VDlrbXpKOFdScFF1OXZDaXR3K0QzVkJ2RnZKSEVvOEpG?=
 =?utf-8?B?Q2sxQXNMb0Ixd2pSL0d5ZkVTcUNPek1xK05HSWN2MzQzaWx4OHFuRWR1dldT?=
 =?utf-8?B?a21vQ1IySjBtVWlKVkdEc29EM2pRTUUxaHkxZkEzZ0pCbW9SOWlXekFWakVr?=
 =?utf-8?B?UU55eWo2Z29EVVhENTBjbDExcUNlMzFxT3lTdU84M2tPQlBydHZuYmVzQzJk?=
 =?utf-8?B?RTVaNnAveHZ0ZTJDb21PcGFwc2wxNkxWeFdabHBqYkFON3BOeU9WMmQzMGsx?=
 =?utf-8?B?Q1JuSm8wd2ErSUxpc1BSYW1XalpjbnZTT3dMdDF5ejNGUEF6QVZmM3JXVHp6?=
 =?utf-8?B?cE5tTWliMElKM1N3VTltcFVTUUhVNWJORGxENWRkQjNaeGxXWk90eDYwM0xi?=
 =?utf-8?B?M0hIV3hCUDRNVk9ydDAwR28vYmFMbk5NcTJ4N0s2SjdjaUNWR1lEd09KeUtY?=
 =?utf-8?Q?xDYwObK9OLQRdGwe+bO8ayMT+vcSROV9/O3czrt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db2505b-bfa1-4b54-94bf-08d9096528c1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 10:13:53.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXA04xM4oHIjnUpb77O76HwfZIp6A9xlGS+ts3336XfbBEDJb7QBWCOd4LJK/ZlYKGjzkK7QBBmC/5AtVYirbp1UYZ9ZOoQ6YEyvakpo814=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5284
X-OriginatorOrg: citrix.com

On 27/04/2021 07:46, Jan Beulich wrote:
> On 26.04.2021 19:54, Andrew Cooper wrote:
>> Some initial pieces for guest support.  Everything will currently malfun=
ction
>> for VMs which explicitly opt in to CET_SS/IBT.
>>
>> Still TODO as a minimum:
>>  * Teach the pagewalk logic about shadow stack accesses and errors.
>>  * Emulator support for the new instructions.  WRUSS is an irritating co=
rner
>>    case, requiring a change to how we express pagewalk inputs, as
>>    user/supervisor is no longer dependent on CPL.
> I can put this on my todo list, considering that I'm the one to play
> with the emulator the most. Just let me know if you would prefer to
> do it yourself. (Otherwise my next item there after AMX is now
> complete would have been KeyLocker insns.)

My plan was actually to start with WRSS and do the pagewalk side of
things, including refreshing my comprehensive pagewalk XTF test.=C2=A0 This
will block work on all the other shadow stack instructions.

There are 3 emulator complexities for shadow stack instructions.=C2=A0 SSP
itself as a register, WRUSS no longer being CPL-based for
user/supervisor, and the fact that RSTORSSP in particular uses an atomic
block which microcode can express, but can't be encoded at an ISA
level.=C2=A0 I've got no idea what to do about this last problem, because w=
e
can't map the two guest frames and re-issue the instruction - the
aliasing check on the tokens forces us to map the two frames in their
correct linear addresses.


IBT is quite different.=C2=A0 There are only two new instructions,
ENDBR{32,64} but tweaks to lots of other instructions (all indirect
control transfers), as well as 0x3e for the notrack prefix, and the
legacy code page bitmap.=C2=A0 The tracker bits themselves are somewhat
irritating to access in the {U,S}_CET MSRs.

Furthermore, I don't have access to hardware with CET-IBT (the SDP seems
to have let out some blue smoke), so any support here would be speculative.


Other bits I'd forgotten from the first set of bullet points.
* {RD,WR}MSR support for all the MSRs, including finally breaking into
the non-trivial work of context-dependent state.
* Changes to Task Switch.

>>  * Context switching of U/S_CET state.  Recommended way is with XSAVES, =
except
>>    the S_CET has broken sematics - it ends up as a mix of host and guest
>>    state, and isn't safe to XRSTOR without editing what the CPU wrote ou=
t.
> Hmm, I wasn't aware of quirks here - would you mind going into more
> detail?

I'll double check my notes.

>
>> The above ought to suffice for getting some XTF testing in place.  For g=
eneral
>> guest support:
>>  * In-guest XSAVES support.  Windows is the only OS to support CET at th=
e time
>>    of writing, and it cross-checks for XSAVES.  Linux expected to perfor=
m the
>>    same cross-check in due course.
> What specifically do you mean here? The XSAVES CPU feature is marked
> 'S', so ought to be visible to Windows. Hence I guess you mean support
> for the respective XSS bits?

We really shouldn't have exposed XSAVES without XSS bits, but yes - what
matters is that the {U,S}_CET XSTATE components are usable in the guest.

~Andrew


