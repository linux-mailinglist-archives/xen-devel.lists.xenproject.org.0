Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A47522DBC
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 09:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326569.549125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nohDy-0007gN-1l; Wed, 11 May 2022 07:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326569.549125; Wed, 11 May 2022 07:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nohDx-0007eB-U7; Wed, 11 May 2022 07:57:33 +0000
Received: by outflank-mailman (input) for mailman id 326569;
 Wed, 11 May 2022 07:57:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dmv0=VT=citrix.com=prvs=123c0883c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nohDw-0007e5-98
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 07:57:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00bc9897-d100-11ec-a406-831a346695d4;
 Wed, 11 May 2022 09:57:30 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2022 03:57:27 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO3PR03MB6712.namprd03.prod.outlook.com (2603:10b6:303:17b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 07:57:26 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 07:57:25 +0000
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
X-Inumbo-ID: 00bc9897-d100-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652255850;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=buX/3xcPguYYtA/VPUoDQ0PmVIz4klk2Fn9IGEeFCVk=;
  b=JhEA1wCgUfEQCE2y5UyGrG2kU3lFuywNXsAYLyhAo8pbzar1AkdD0n36
   sJpQ97i+fy731QlRK342oFjtpJNh2rSGVTDN6rCmf/ZJ10IBYyfAKFiP8
   FX7kH5KMEbdvuH1QxLKQoeaNFCQ92IG6tNyatK9MnjdjG66ZjDQvdZBQW
   Y=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 73540412
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4cGJba/elmktc3h+qz/mDrUDvH+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jdLXWnSOPmMYjP2fdggb46yoRkO7cDXzYUyGQNsrnw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IHgW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncHtQxwsOqKWpLkYYxpXOSVyHbB/+bCSdBBTseTLp6HHW13F5qw0SWQJZ8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHfuMuYYwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKGAE8A7M/8Lb5UDQ41dh3p7RFOaFa8C3TuhLnmeSv
 yXZqjGR7hYycYb3JSC+2nelnOrGhy74cIMUCryj9/RujUGTx2ocExkfXx2wpvzRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Eec39QWMwar8+BuCCy4PSTspQN47sM47QxQ62
 1nPmMnmbRR0q6GcQ3+Z8raSrBuxNDITIGtEYjULJSMa5/HzrYd1iQjAJuuPC4awh9zxXDTvm
 TaDqXFkg61J1ZJSkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshUZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:JuS5VKqmdt5CoOfKtVU7aooaV5u5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wI9HdwGOtx5Dt
 //Q9VVfYF1P7ErhJ1GdZc8qOuMexvwqEH3QRSvyWqOLtB1B1v977jK3Z4S2MaGPLQ18bpaou
 WybLofjx95R37T
X-IronPort-AV: E=Sophos;i="5.91,216,1647316800"; 
   d="scan'208";a="73540412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrZlElgn/EkNFMbf8vb+di4+gPPDLgBfc47Gxgdk8AVJtZmk124KA7XFkIF/mEJ4tUHVN6eROPj+sSWN7k+iJRbpi4e87uPeRf5u9gQ4nTZxT5hbZ5NyqBEG133fg355mI6JOO8o6QYszAo/8zqjN5c6o7lbufozAdy0/3QdTZc17g8+QGunq7yWPJuICfjzY4cRWg+NCHVOqFtqmJY/tRK3CDGSkO86gwD2NKUZWwUcS+3RYO4ApXpUSZ576Y+pnoRdUe6A3A29MmSzsfFJyjiEMpjIo2J5JYPaKrezz01wijKU5QX4LITtP+2b/kPJZ26mRa4KUt5Bf9u11alFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5YG+5H5TaKV9mgCpKNyDoJBKbSuy8KSHr32Ip4JaUY=;
 b=AZx72kLxFmAtE5uZj/an6liFvV1y7++D1JMGniqU0MN94s/wqfGRro+lk5mhlV1Uqy5gNNI8jv/h0e9+CgP3cguBClv75jXI2ZIIjtulRY/buV/XqzVobFYBDKtepKQt/KXUvVZmwSkD5FBuneqdphmLBNiFcw3pXllTo1kmuW029sxXIgjJJYPx9cRaQ9+vjEy/serJqzUbXgHI2gxgeHthxFO+VYC0GpOXlPywVPZ0hg72104bZjzGwyZafq4X31tqzWTdSyJvLg16dUEID3QJkLtcAu/4xERCiqbGkvol8jbCZ32jjlFghC6Z0gdT/0UJ8N7aHxtHsDRt+eHEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5YG+5H5TaKV9mgCpKNyDoJBKbSuy8KSHr32Ip4JaUY=;
 b=T72mizp/cvs19UKuzAnnTCPj+KgEuBLeMYbY9y5dbR4+NWXexYqH4/UcYktlf6USsnfwsHsy6Rv2hI8h82Cnm/HbCwAKwKmiB7MnnTQB2WJSwpvny3l663tx4mHZkHcRGZZ9A0NZG0SRHuOwcLgBSzbnePjod9Gu/2vtDsHPRuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 May 2022 09:57:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/2] ns16550: reject IRQ above nr_irqs_gsi
Message-ID: <YntsYOMA9fYXzpU5@Air-de-Roger>
References: <20220510155824.1779789-1-marmarek@invisiblethingslab.com>
 <YntjzqQl0CIeGzR4@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YntjzqQl0CIeGzR4@Air-de-Roger>
X-ClientProxiedBy: LNXP265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fc956bf-b5ce-4ca0-c836-08da3323e362
X-MS-TrafficTypeDiagnostic: CO3PR03MB6712:EE_
X-Microsoft-Antispam-PRVS:
	<CO3PR03MB671241115520F268B34B801B8FC89@CO3PR03MB6712.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7UapwuSujzjEVme14hFQSXP0+76GnQgcU9fjlrXeMhlO24r8v5oR8m+Aux5o+mtEc6U4YzjELMrMAekxi7dTBvSy3ZA08aeGcPa5X2WQwj7a4UnGpgCEU7u6HP33nVVj2OtapUckzclrBMAozcXfO529D+P+pZgPYosP4+2ZyYaAq/lrgDHwp+Q0qhKyL45IGm+tgZe1URrt3y0hWnjFY/w6y552klARkholcHtqmGwqVie+0XRErNKjfVwHejXz+o8xPsg8b3HISi0ysvd+Mmj64k8vQvImlUuyDyPcIPVXIg+XLgeSzKcqTfFQRdnYeYXXaWrU8aJ/aoFlKp7F9iMglwwXzSLIB8QuOPI5UNSBbjBYY7GNCOFL962fhl1i02RTjQPqLYPQxZIGl/84/upmSr9sV2BHi6xcnvkfeJ1LjkfCRTpYlwQqZfB/hyviN/OncbdsVTqnuBR0UuB1R6wxs2nMkoN9EckLmFHyO46F7GI9VFgjdxJwK+pEh4SXHXeyMYCk9N4FnLwFy71QqLz1do+WnP2I2iBBTlqz/VDBotjXXWQ8v6fWeJYrMTFjGv2aqEf9dP9U8oURasRsAXma5oLrQ1o/tdOEWItUcnDi1dOwWzQQ7SnTSqQBfyUV4o8J9mgylTryJqqf8w7Z6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(508600001)(8936002)(6486002)(82960400001)(316002)(38100700002)(8676002)(6916009)(54906003)(4326008)(66946007)(86362001)(66476007)(66556008)(9686003)(83380400001)(6512007)(26005)(6666004)(4744005)(6506007)(85182001)(186003)(2906002)(33716001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWdrSUpnR1MxVGJYa1FTRFJJaVdjeUNiMmlpVUZ1TkVGRXpZUUcxeHYyMkhI?=
 =?utf-8?B?ck1aWGxQekV5YUIzbG14M21NSmdEWTI0QmFGSHRZdTduY2x1eVpkNkpKbDAy?=
 =?utf-8?B?MTVvbFMrWU9TZVhBb2tyRHNMZ3B6VGtIZC8wNEZETGdnY0hvdkVjYTNSMzBN?=
 =?utf-8?B?MlpQVjVZWkpEMjVVNzFsNmQydHJ1TkFlNC9BZGtuNXRXZWRSVWFzVVdsQlVV?=
 =?utf-8?B?M3Ewb2lIY2VVK0s3bjRZa1JneGJ5UXdUcEJQaEVXb1pNbUlyT0U1Uzh3WjFF?=
 =?utf-8?B?anBJTUlXVm9jTm4rWEJmNWxrcVVRNUVtUThYQ1ZKZmZob0I1RGdyT3dvaVVj?=
 =?utf-8?B?OFJnOGNGQTZuL2pXZDVEQnZpUGl3cE1xQlUvUkF2ei9pbjZ4Z3ZQUGRsZWFL?=
 =?utf-8?B?VWhTVWdIcW1BYlkyRk9mQW5LM0Zsa1l3VXVOYzFCQTQ1RnJZeGhudHhMSFh4?=
 =?utf-8?B?aE1xaXVUUDc4STFNRUYxNytGdjNZZTRqalp6RzcxNG5hcDFrcGpiK3ZwS3JB?=
 =?utf-8?B?RFV5Y0JyNmozV2c2RFo4RHVqZjBuYThKQnNRdHRRMjhhU09sQmc4ZG1CNXVq?=
 =?utf-8?B?dm01MzlVNU9sWlFteGFwT3FUdXBCcmI2QUZrLzM2ZmpHc3p2cWM4U21aZmJN?=
 =?utf-8?B?MmNUUjRmc01iaklEK1k2RHFReWxjMEdzdE9YRG8rR1luS1JQTGZVeGpNeWtn?=
 =?utf-8?B?NjdmUmRLclQ3NTZ4NjVUTVhHdTdJTVh4MktFQ1hLamFWNi9JeXprREF2cDRW?=
 =?utf-8?B?akVIOU1wNWtGc3pxS29zYWJpTDRZRGE0ZnFDWW9MRTUzQmtCd3NQQXJpN1Ax?=
 =?utf-8?B?b1AwNjJtQ0xWUEdaYTVZc2pQSzRvdXU3MFoxSllRZ3N4ditEYTlyYXFvbzZa?=
 =?utf-8?B?MDRlSzJSWEJLU1orYWM5TnJXcHBQTmQrZWRybXlVcTFzN2V6TXdKSUtqUWMv?=
 =?utf-8?B?NGtIUFRjeTlxM3l0TUNOdEFXNml6VzdNWmdsTmdzbFBDa2Mvd1ZkVGNOaXBW?=
 =?utf-8?B?a3pDZEx3Z2ZNZjRhU0lwWlRNUGRUdHJFUWRSY2Q5OUw0TWY1MC9NYURpeitN?=
 =?utf-8?B?N1d6UFlzVlFNYTgzVm5hbmlRb281L1lWbHF3N1pCc013cEN6MHRDMFBsWk80?=
 =?utf-8?B?YWpzNXphOWVJa1VpU0kzNEtxaTd2Zm1rVnBaUXJJK0FwRlhnL05HWGczTXNa?=
 =?utf-8?B?bXpuNXdKMEpCUkNsVFd6OVJyQUdRQkFqb24zTmFkTk8vOG5KbkRvb050bElz?=
 =?utf-8?B?NkRHNERyNVV4QnRGY29MSTlvM0hwQVk1VWluOFJqbnhwN0U4eWVpb1pObFFD?=
 =?utf-8?B?VDd6Mm1YcTk2b0pHOHNhb2NOdXZiMGlQT25POGpEY05MN1FmaXJ3VWhZMCtu?=
 =?utf-8?B?OWdQaFhrTWpidVI0Z3NKTzhaQVRKNEtaT2pnKy9HVmNmcjRGZy9PUTNVNG5Z?=
 =?utf-8?B?SkRnUlJ3L3lnRW1KNXNiaGJlTUIvbVZuaHNSSElPL0F4RExFSmxEd2FUbDFV?=
 =?utf-8?B?VnV3MGpuZkhmeUdkeG94SElyTXJwN3BPa3dTUERMcmYwYlJyQzg5WEtvV1Bw?=
 =?utf-8?B?NnRVSDA1NjF4b0s4cEhheXU2b1pvN2k5RUsyRGg0TlJGekNJam1sMHRvMkRB?=
 =?utf-8?B?cDVGeXBvUmExZzRZSm5rVDlZN2g0NmZJandiclVMT3ZLaTZFTUZqS1loeTQw?=
 =?utf-8?B?Mmk3RzNabHJiQXdIQ2F1RUhPZWZwbFZaVE9PQ3d4WnNvQmdjbHptaEZQMEkv?=
 =?utf-8?B?ZXc0UE9NS3JHaGhsNWloRFVpR2hLYmtwTi9TZ2pJcTZaYk8wUEtwaWNjNW44?=
 =?utf-8?B?SjZPNnRsK2xtUElZN2FGRm0yL1g1eWVEOUVqNEd3MW9ia0JmRTkxOWZDZzZj?=
 =?utf-8?B?QjdjOVhQNTRWNjBEclhCRnBRYXB6NVFVTTBjOEp0ZFhPN0c0UThwZ0NpQWxE?=
 =?utf-8?B?SUJtK0dlYWY3VVppRmFNbDdOSkhtY0ptL2FmV21ZWE9oWXA5YmJ5bWxiQW5P?=
 =?utf-8?B?cjJsenBVWFlPbzN0czM1bUo2MENUclVCRUZ1cGFocUwrYm85ZkJzUmh6R3pR?=
 =?utf-8?B?c20yRlU1bldUSDZjY1BGWnNpR2tUcG9QVW81RGxoZlJUTU5qL2tpTXZab3lF?=
 =?utf-8?B?Zms4eWhjNVdETEtBbHhSeEhsK25hNFE0RVNvYmZ0Rmo5YUNHODFVVW9vV0pF?=
 =?utf-8?B?U3lZYlNGenFneGdPUHlGUXc4RmlyNEUyK01Zc0k2cXhHc0JLcW05cTZJdVVQ?=
 =?utf-8?B?cGdzdlpjVkdnVnVJUmxSNHVidE9xUnJtOVRYOXJOWDdUQ2t3RlZ1OFUrdzgv?=
 =?utf-8?B?ZDNQUlk2dUZZNXdWTHQ1QjMxVlNZaDB3UlR0cXloZWtNZFBybHdUenhGU3Ro?=
 =?utf-8?Q?wgF9zmbajm999fOE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc956bf-b5ce-4ca0-c836-08da3323e362
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 07:57:25.9369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWtCBYjcpIO+F8iC7N9BXgNmz3qKLJoNDIlZw+4vppJwyplLz+IieKglBSWfZPLOo6z5KFWCAk7QU9eKPyHe0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6712

On Wed, May 11, 2022 at 09:20:46AM +0200, Roger Pau Monné wrote:
> Subject line needs to be updated :).
> 
> On Tue, May 10, 2022 at 05:58:23PM +0200, Marek Marczykowski-Górecki wrote:
> > Intel LPSS has INTERRUPT_LINE set to 0xff by default, that is declared
> > by the PCI Local Bus Specification Revision 3.0 (from 2004) as
> > "unknown"/"no connection". Fallback to poll mode in this case.

Forgot to comment: you should also mention that this 0xff special
handling is for x86 only, other arches can use other meanings for the
INTERRUPT_LINE register.

Likely this also implies that the 0xff check should be protected by
CONFIG_X86 (albeit I think that code is already only reachable from
x86 as Arm doesn't yet enable CONFIG_PCI).

Thanks, Roger.

