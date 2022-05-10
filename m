Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8282E521C51
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 16:30:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325730.548433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQsj-0005uZ-6W; Tue, 10 May 2022 14:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325730.548433; Tue, 10 May 2022 14:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noQsj-0005sa-29; Tue, 10 May 2022 14:30:33 +0000
Received: by outflank-mailman (input) for mailman id 325730;
 Tue, 10 May 2022 14:30:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=To9D=VS=citrix.com=prvs=122921be6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1noQsh-0005sS-9z
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 14:30:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcaf9753-d06d-11ec-a406-831a346695d4;
 Tue, 10 May 2022 16:30:29 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 May 2022 10:30:26 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA0PR03MB5386.namprd03.prod.outlook.com (2603:10b6:806:b0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 14:30:22 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 14:30:22 +0000
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
X-Inumbo-ID: bcaf9753-d06d-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652193029;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=lDOPjqJ1geWMZ2Fz7X6osdAZYk3zcCHK9ulS6mQtLgw=;
  b=E9Vh9fUjVuw5N2Qu9mSNgwJ66ANMi6rmXuRxH5XDdIEgLhz5JVUaByW1
   4cVjDnGB2vA5vT1lbUT7LzkzNPjg2dTKchOmGgZkPI6o2hUkQqmrb5S/q
   YkOB8LDokvY/g6CIh+9hspVIhhVepISVHxJCXvDZPbsUVLwodj63gZ+16
   Q=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 73473834
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jICCOajaIqF4J/XuQGmMyKVsX161bBEKZh0ujC45NGQN5FlHY01je
 htvD2uPbqrfYjSmco1wYIuz80gCu8XQmtQ2HQNl/n82FyIb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlrV4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTkVHYbou7QxaT0CUAJZJqNgpbTeIGfq5KR/z2WeG5ft69NHKRhueKgnoKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIIehW9p7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wnJ+vFnuDS7IApZl52zHPSIINWzYu5PwUKBu
 zvJvH76HURPXDCY4X/fmp62vcfNly7mXIMZFJWj6+VnxlaUwwQ7CxAIVF39vfiwjGa/Xc5SL
 wof/S9Ghbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xHmEZShZRZdpgs9U5LQHGz
 XeMltLtQDlw6rucTCvF8q/O9Gvrfy8IMWUFeCkICxMf5MXuq50yiRSJSct/FKmyjZv+HjSYL
 y22kRXSTo471aYjv5hXN3ic695wjvAlljII2zg=
IronPort-HdrOrdr: A9a23:EoQq2KEE3ykyVnq/pLqFe5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHP9OkPAs1NKZMDUO11HJEGgP1/qA/9SkIVyEygc/79
 YdT0EdMqyWMbESt6+TjmiF+pQbsb+6GciT9JrjJhxWPGVXgs9bnmVE4lHxKDwNeOAKP+txKH
 LajfA31waISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0md
 gsAp4Y642mcfVmHJ6VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="73473834"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXFPXUuTSacc4BllRLTlx1sG5pTdi7ltkiCoXrGZu+zctMyziruF0LWGd2lrMUXd28paikHTVjHU2EYgzUf+CMtRodQzBBK7cTSomXQCZSjqADtfVlHvP+fv3LCsxJdxQSNqQhL5kWvD9PApnR0tW2sFQHnzQsscyIHiTzI2t/y/dZ1xPxIXJ0zDVT0q4BIMG4oS0arAzJLhglbPM49Lwx9DCNGPi3R+ngLZgMkC39yuB8/rfulUPyI6PPZyONwva97AovJ0mgIBv41HdmoK83V7k3HECbtdjvQYao5AT6a1tm5QODgg6lEan/Nes3nFnsNhcFruT2RCYbVYb4g+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkPxeKH8HAYRWYOLD7bIbXYFqahuxamVPN/5WElQmo0=;
 b=M3esar28zkkwStpeCjAi+9/dYLVutuxQOTwk9MLGPeViTqBv/yjjeYxxP3iYwEvJxbRmwJg56MGnzYPUqzPF2hqen20sjYp+Mmu5BEXeggpGRS/xjW/ETDLbReimyf4+YLouWIRVQIhZ1HbZ4scscbiVda5zYffonz5Nw9h3sedB5lejYar+P2F3TcMf7Zy1MxaJf/weEto9u9ZAlYB0mImiobwDY7SylWLPQvTkbLp2szurIeruc/gxWrOiPIAmzD+iMwovgqHHDBiq39Za35lNN4vv7oJJ6VoXGH7K2th5xmeIeiwhwH+rim1QWTeyOaK0Zoqu1ZxX/rbqOkL0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkPxeKH8HAYRWYOLD7bIbXYFqahuxamVPN/5WElQmo0=;
 b=a2gQgbeEqTMrmw9JXaPQ62Om/WM6iZXHLKf+fuyYxVvrVlR/Ob5o0FfZqsKIGxzmpdnICeVXu+bEAWQ0acVhHKcjiHIKIVUj5pSIx+9Zn7MItk/af7InWmA5Bmrgcx/3XHPYSPFJ10vXN6GQ26Mc4vwi5wsVi0fVTwwKzbUx0yQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 May 2022 16:30:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Kevin Tian <kevin.tian@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 16/21] VT-d: free all-empty page tables
Message-ID: <Ynp2+faOjZguAUVP@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <b9a2be8d-3bb9-3718-6e3b-f07f6dcdde20@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b9a2be8d-3bb9-3718-6e3b-f07f6dcdde20@suse.com>
X-ClientProxiedBy: LO2P265CA0277.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61b37809-bd35-46fc-cf3b-08da32919d83
X-MS-TrafficTypeDiagnostic: SA0PR03MB5386:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<SA0PR03MB53869FA27A88CBD0F431C3428FC99@SA0PR03MB5386.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EMfgQr77yHUM3rPSqOZqrwP0prwHm9O740UnNEGIO8b9NytptIX+NbGHN5XBmXQ0mJrKj6V++2vIRtpWqm6AV8ZNxQIMXhXjBxkyC+a4k5v6DMOi9KZtmk6LtGkc8eH8bLPq0Krujbq25O/CrwTRytirdnBnDIN/WbJgFXt1jCuwjBt4/b4lK2kFHrK1NsZ43UTVikOF/NFRFAGp2RM42ijD86SvjL1dyLzN6MdHq0/Fo4KTkMPIpzflphnOpZQDg4EUxpVGzOqQWVznj3VfNZ/yAY78YxDMFgh4Yt49JmgeD9gHntxEkMAGHDoU3tPB1T5w3co2xY1A+5WS+vaTbe7htLSs5GzwdPXZ5J0m+yx48MYkGA48ZU19LE3yoE7SubSHi/h2xh+yIqSv3DF7KhNLbJVmezUNts9Vo3C54BZPX7NMxuXUWMKM5B36/sr5667JWs4djOmAUxiCuJ0G/86kFHL884K7aJuIxMnXyhfSOvTW2C4Fz9T5jryU3Gv1gMTHNBN1Vh8f0layIBDYIHb3eQtT6vshag586QZSlPPFoM13nfLbc6vikxGbPu9tf47ZjuuxJkkafcrkVqpXFJ17u4i6PI4i89SRdqIiLAHxLMsLwZR5/V+4SWywxDzrsR97KP7gfDNsFOcm/gTjHwmSigro3HSLNvd4cst/WYA7fO1g5ndd7RYOBY+85OcRKjGJ+DyeB2yojRrcoYQ/+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(316002)(9686003)(508600001)(6666004)(66476007)(66946007)(6486002)(6512007)(66556008)(186003)(86362001)(82960400001)(110136005)(2906002)(4326008)(54906003)(8676002)(38100700002)(26005)(33716001)(8936002)(6506007)(83380400001)(5660300002)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVdaaGhtaU1CaXdOSFRVM0V4WmRYRUp0b0N0YTNMZWRKTy9YWkVzN3UrdGd5?=
 =?utf-8?B?Sm5PRW01MHZDRFFPbjVRMW9sZEY5NGM2QkdBSlFxU3l6UVluSWdpcGxqVmxM?=
 =?utf-8?B?OEYwTVNKWXJLZGZzZlpOOU1rWHR4NldzMkYwVlJOUnllUGRKbTVIUUtXOWpn?=
 =?utf-8?B?bStUN1VHdGlkWEpoajZZZVRBQTgydnp2NzJmQS9iREhFSnhMSTltb05KbTdL?=
 =?utf-8?B?YVpGVlZKSkdjKzE5K1pGNmFUbldjZFNPN1JkM2w0bmF2MHJBVFNUZm1LSlVI?=
 =?utf-8?B?bTVOS0h3SC8xRUZkNWk5QTUzSTgwVklXbkd2ZEZWYTJ6VTlOMU9hMEtOQTZG?=
 =?utf-8?B?NlNRLzh2NjJzNE41eFFEdmRJdnkzbDQvL2FkS2RIRi9MMWlacy8wUVNkWDhI?=
 =?utf-8?B?czRGektQckZKRTF0dlhveTJwWnVLUkdpZzEvRmJza2FJRDNsOCtBVEpLR01H?=
 =?utf-8?B?N1NPcWRId255cVdHVS93UWdyVkJoSmltMHcvdnBPbk95Rmt3MkxPTGMvamRP?=
 =?utf-8?B?NzlldzA3cVhLWDcrSE5EOUhYTjBmMU1KMzJFQmdiTGdFMVRyOEtrY3c1VnhU?=
 =?utf-8?B?SmZjUmhyZUNNUEN2NnF6ZmxlRlQreXFLYkxqRHF5eENmVzFiRk5BQmFsYUZr?=
 =?utf-8?B?dVg5bG1oWGNmSUFRVG81NmNJaHZyNTFKTFdNV0RVMkEybnBlOTAvdGNPT0Jt?=
 =?utf-8?B?N0RCY214Wks5YWdGOVplZStwVjByL0VJMTFJYktvK20rUWk0ZG1ZM0tlZnZy?=
 =?utf-8?B?a0tBekVjWkYyL3JpVStCWStiVldoWjRzRnZKVFcwWjMybW9DUlVsWkRzanpo?=
 =?utf-8?B?cWs0MVUwczhlSWwvYmRDY3RFS0ZTQ3h5aXJMMWFXTkY0M3lCcktmeHZ0UGNu?=
 =?utf-8?B?dHBKKzROU2pQNU9mbnJudm92eVdZT2pTeGpDU2Z0c1hxRVNRcmRhWWhzVGs0?=
 =?utf-8?B?eUJQc3lzVlpQNTlaWkxZRjJYRkpwMGRuVS9nR2V5T2RLQXc5aGpQL0E5b3o3?=
 =?utf-8?B?M2ppL1BiWC9GMGxaUTJDTzQwMUNDR2tKOHNDYloyeEFXOVlmT2liNEpQMXIz?=
 =?utf-8?B?OXc3ZXFLT0JkUzJ3c3lwYlB0VE5rOTlIbEpKUlBzMjB6MFpiRjg5WThZelBq?=
 =?utf-8?B?bGk5ZmgxNmtLNGNLUVhidVFwOVQrVitMZWFIaGhwaHQyTWUveE9FS0VxMFE2?=
 =?utf-8?B?N05nQjRrNEx3WTNUVEZndE11elQ1azJVTUptSFJVVWVpOFlWczg4RnEySjFU?=
 =?utf-8?B?OUtUR0huSnp1RVZzQk9wM2xHVDNhYWNudUFtcG1LeFZNS2EyL0drYUdtQmRI?=
 =?utf-8?B?ZVliNjdoL2tYRnpLa2tHNzJTMmxDaUhOTEFuTXpuYzd0Q2pGMWlQT0NBdHNr?=
 =?utf-8?B?REdpaEVoZXd0MVI3SEQwMVRVZ1g0MjlvVjlDbTliV3p5VGRuSGFPU0pLMjNt?=
 =?utf-8?B?MjV3UEFIejdzOENob0l2YTFwN3B1azZSbWRvL0J1Qm5uRm9SL1M0MndHL1ZR?=
 =?utf-8?B?akRNb04rUDN0RTdTNXJORWV5VEpHQzhxcTJmNFJkU1lUQUtyRDJEaFNEZy9I?=
 =?utf-8?B?N0RGVHVEYUhJMDFQRE5WcWVIUjhNWVA1Wk9vMGl3Z2s1d1J3NkdPUklraU4r?=
 =?utf-8?B?dStyMW83YU1XeU5MZzN0aWJwOCs2b2RaR2szbElwMWl0SlRBbG53ZHVZeGtx?=
 =?utf-8?B?dUM5NzdYR1AyKzNnSFk2RTJoQUZHSjZtVWVOZDJ3SzlJYTNjNGt2aVNIdzNR?=
 =?utf-8?B?WlMxK08rc3hvUEk0LzRCYmhvUXZRTXpxRVNDSU9lV1gweWR2ajJmM1pNd254?=
 =?utf-8?B?ZEtJeHJ0N05NaFY1MURpWUZkckpWOG1UcTBpNUp4VDNxek9lSXJPc081L1gw?=
 =?utf-8?B?ZmRBaDhkS2pUMktCWExBSWRITXQ2VVZ1UzkrMGxOOGlCb3ptdE41WTU2MzUz?=
 =?utf-8?B?cmxsM3pWTXlpRmg3MmJEZDJkakpnWUJrMm1QbS9ydE1HVm5wOS9IeHI5cmo1?=
 =?utf-8?B?cFJoRUhuWGk1ZnU4cmR6TjkrN1RjNFRxVGRpaFNMS2s3SlpqU1BZTTFNUVZ6?=
 =?utf-8?B?dDNtcUZSeFNZb1NtVmZ5Y1hZa3Y0SzRNY0wrZGxNTWlYN0E2Wi9ydEFtV3M4?=
 =?utf-8?B?bmNvWTUyWnFXNTZhNnBzdHFLc0I0dUVuMDdnNkFQelRlM1gxSnFrUWl6QSs0?=
 =?utf-8?B?MXhkMzhwb3NhWFUyYVhkWmRsZlZKMzJGWlNOek13eG9pLzZPZkUzV3k5YkhT?=
 =?utf-8?B?YU0xUmFZRWpEZ21MVVBxWmVMOWZXRC8zZXp0UEVaQlJWWkxKVjVlK3c4K1JJ?=
 =?utf-8?B?QmlibjFrQWwrU3JVWVRVMWltdVcvRHlSYXZUbEtxN2pjNkZSVFVyNFBJSGZm?=
 =?utf-8?Q?EjBaKkUZSUtjYlag=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b37809-bd35-46fc-cf3b-08da32919d83
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 14:30:22.2061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQ2JDEZfg7SbBpY/16wXm5ppR6BAHQ+invleG3LhgZ1Y2jnvSB0/P9Qd2QmaZXST+GdAg3091S9+brUce9f49A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5386

On Mon, Apr 25, 2022 at 10:42:50AM +0200, Jan Beulich wrote:
> When a page table ends up with no present entries left, it can be
> replaced by a non-present entry at the next higher level. The page table
> itself can then be scheduled for freeing.
> 
> Note that while its output isn't used there yet,
> pt_update_contig_markers() right away needs to be called in all places
> where entries get updated, not just the one where entries get cleared.
> 
> Note further that while pt_update_contig_markers() updates perhaps
> several PTEs within the table, since these are changes to "avail" bits
> only I do not think that cache flushing would be needed afterwards. Such
> cache flushing (of entire pages, unless adding yet more logic to me more
> selective) would be quite noticable performance-wise (very prominent
> during Dom0 boot).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v4: Re-base over changes earlier in the series.
> v3: Properly bound loop. Re-base over changes earlier in the series.
> v2: New.
> ---
> The hang during boot on my Latitude E6410 (see the respective code
> comment) was pretty close after iommu_enable_translation(). No errors,
> no watchdog would kick in, just sometimes the first few pixel lines of
> the next log message's (XEN) prefix would have made it out to the screen
> (and there's no serial there). It's been a lot of experimenting until I
> figured the workaround (which I consider ugly, but halfway acceptable).
> I've been trying hard to make sure the workaround wouldn't be masking a
> real issue, yet I'm still wary of it possibly doing so ... My best guess
> at this point is that on these old IOMMUs the ignored bits 52...61
> aren't really ignored for present entries, but also aren't "reserved"
> enough to trigger faults. This guess is from having tried to set other
> bits in this range (unconditionally, and with the workaround here in
> place), which yielded the same behavior.

Should we take Kevin's Reviewed-by as a heads up that bits 52..61 on
some? IOMMUs are not usable?

Would be good if we could get a more formal response I think.

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -43,6 +43,9 @@
>  #include "vtd.h"
>  #include "../ats.h"
>  
> +#define CONTIG_MASK DMA_PTE_CONTIG_MASK
> +#include <asm/pt-contig-markers.h>
> +
>  /* dom_io is used as a sentinel for quarantined devices */
>  #define QUARANTINE_SKIP(d, pgd_maddr) ((d) == dom_io && !(pgd_maddr))
>  #define DEVICE_DOMID(d, pdev) ((d) != dom_io ? (d)->domain_id \
> @@ -405,6 +408,9 @@ static uint64_t addr_to_dma_page_maddr(s
>  
>              write_atomic(&pte->val, new_pte.val);
>              iommu_sync_cache(pte, sizeof(struct dma_pte));
> +            pt_update_contig_markers(&parent->val,
> +                                     address_level_offset(addr, level),

I think (unless previous patches in the series have changed this)
there already is an 'offset' local variable that you could use.

> +                                     level, PTE_kind_table);
>          }
>  
>          if ( --level == target )
> @@ -837,9 +843,31 @@ static int dma_pte_clear_one(struct doma
>  
>      old = *pte;
>      dma_clear_pte(*pte);
> +    iommu_sync_cache(pte, sizeof(*pte));
> +
> +    while ( pt_update_contig_markers(&page->val,
> +                                     address_level_offset(addr, level),
> +                                     level, PTE_kind_null) &&
> +            ++level < min_pt_levels )
> +    {
> +        struct page_info *pg = maddr_to_page(pg_maddr);
> +
> +        unmap_vtd_domain_page(page);
> +
> +        pg_maddr = addr_to_dma_page_maddr(domain, addr, level, flush_flags,
> +                                          false);
> +        BUG_ON(pg_maddr < PAGE_SIZE);
> +
> +        page = map_vtd_domain_page(pg_maddr);
> +        pte = &page[address_level_offset(addr, level)];
> +        dma_clear_pte(*pte);
> +        iommu_sync_cache(pte, sizeof(*pte));
> +
> +        *flush_flags |= IOMMU_FLUSHF_all;
> +        iommu_queue_free_pgtable(hd, pg);
> +    }

I think I'm setting myself for trouble, but do we need to sync cache
the lower lever entries if higher level ones are to be changed.

IOW, would it be fine to just flush the highest level modified PTE?
As the lower lever ones won't be reachable anyway.

>      spin_unlock(&hd->arch.mapping_lock);
> -    iommu_sync_cache(pte, sizeof(struct dma_pte));
>  
>      unmap_vtd_domain_page(page);
>  
> @@ -2182,8 +2210,21 @@ static int __must_check cf_check intel_i
>      }
>  
>      *pte = new;
> -
>      iommu_sync_cache(pte, sizeof(struct dma_pte));
> +
> +    /*
> +     * While the (ab)use of PTE_kind_table here allows to save some work in
> +     * the function, the main motivation for it is that it avoids a so far
> +     * unexplained hang during boot (while preparing Dom0) on a Westmere
> +     * based laptop.
> +     */
> +    pt_update_contig_markers(&page->val,
> +                             address_level_offset(dfn_to_daddr(dfn), level),
> +                             level,
> +                             (hd->platform_ops->page_sizes &
> +                              (1UL << level_to_offset_bits(level + 1))
> +                              ? PTE_kind_leaf : PTE_kind_table));

So this works because on what we believe to be affected models the
only supported page sizes are 4K?

Do we want to do the same with AMD if we don't allow 512G super pages?

Thanks, Roger.

