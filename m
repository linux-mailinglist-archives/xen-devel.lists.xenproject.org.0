Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6127E78419E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 15:10:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588468.919973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYR8p-0007bl-1v; Tue, 22 Aug 2023 13:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588468.919973; Tue, 22 Aug 2023 13:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYR8o-0007Z2-VP; Tue, 22 Aug 2023 13:09:50 +0000
Received: by outflank-mailman (input) for mailman id 588468;
 Tue, 22 Aug 2023 13:09:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKjN=EH=citrix.com=prvs=59114b803=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qYR8n-0007Yw-KL
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 13:09:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29f78c98-40ed-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 15:09:47 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2023 09:09:43 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA3PR03MB7304.namprd03.prod.outlook.com (2603:10b6:806:2fa::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 13:09:39 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 13:09:39 +0000
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
X-Inumbo-ID: 29f78c98-40ed-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692709787;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mAVF277SHkWjbdgvdHBYYXut7rzZc8my1fM29NIroIc=;
  b=QitO28dDC+VtIH67Hzeuq/HkFb1QX4htTVbgtZqKQmKaqiG+5JJ6w157
   1Z5letE0jqF3zgFFL42zdYv3621EY1JmU4CAnBNbBPdBzMUd6VbLPtbrB
   Dmlw6rn9W4E/q/dCaQ07fa1MVKQ+5kwlLnNm7CR8zrKrDaTtW0HEhwFbr
   8=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 120684737
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7r671qkbClHzGGtP0X0RJozo5gywJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXXmzTOP6LYGH3co9+Po+/pEsBvcfXx9A1TAFuqStmRSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgb5gWGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fs0C2oqRCidu6G38ruXeNlCpPYsdOC+aevzulk4pd3YJdAPZMmZBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkV03iee2WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmjBtJOS+bnnhJsqHfLxEhQK0VJaUm+rOa81kueRf8He
 3VBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQN4prsgtXhQxy
 0SE2djuAFRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85i8jVf5mGa+xy9HwRzf5x
 mnQqDBk3upIy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:MUJPFas4IVhDaINIX3gep/NX7skDoNV00zEX/kB9WHVpm62j5q
 STdZEguHPJYVkqNk3I9ergBED4ewK6yXct2/h2AV7AZniChILLFu5fBOLZqlWLJ8SZzI5gPM
 9bGJSWY+eAb2SS4/yKgzVRx74bsaG6GL/Bv5ah8599JTsaEp2J8W9Ce32m+0dNNXZ77cdQLu
 vn2iJezwDQBEj+dayAdwU4Y9Q=
X-Talos-CUID: 9a23:NVAPjmGYJyZRk1VGqmJg2G1OPeodbEGezUXZD32IJ0RbR+W8HAo=
X-Talos-MUID: 9a23:Z+7x8Qt8gHPISjZFFc2nrmlgEIRLu/uSGkUAjpBavumaGHQgAmLI
X-IronPort-AV: E=Sophos;i="6.01,193,1684814400"; 
   d="scan'208";a="120684737"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KI4WlmupnEmtcgnstoQ8pkpWXUaLP3ib2HQkYs8oWEn8CddRiNeGtdYhTHIXftbyxkU4eXjMp/bUqRyM3lQKgvB7Nx+xMhtB09b0VtLZNNsElOj3yZtmRmim59E2alcNt5KScOSyHuvhntNn1CEssjJNmFuZRk2SHvaakAPhW01tjpXa+hDWUM55cdJlSoJPfvtpKKwLk0N87+3hO5g0gc53QT+UbmKCa/uLiQG1DzLoaxBY53DutWPpCGAlokE/fqfyvAVBchemV/VAABDzNsApWQbou89rYqpbGtxfCFhuEjOfkYbJD0atN8f9ZQzONuDcFtFU2mWj7YhOuQueUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXtAKe+JGF6NbMKJ5iiobtXIovKnXoNNruM/MNvIG4c=;
 b=BoGGr55sD/EQPzE2DPCjZiEps5ARYcDd0BHfSsXLMUqtcY4irwv7t3+9mZVSPRc+2rauZiaYEVx6ElnxSjYcpmGZDVSXnu9a5mD6ahNKAKdMxOYeVk2Gxf/o0YbF53akt5JBJvuufBQGtVrUMMi1YVvFZsS33eryZpxcjXIkYHefzuVND1IGSRVa2Z17A2H32/1pgRPvw6WPVASCh0P6lji48/EYkUToLVQun8fPUSUAfS+T/+tT3hwN7x90Z/ypETkR6MvrVMvAqIZNDqPCkTpkliqqJMZBYyAWatTnakmmHYve9LQI1dbp5uF6c057jD+K66Ylq3383hbbI7TQwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXtAKe+JGF6NbMKJ5iiobtXIovKnXoNNruM/MNvIG4c=;
 b=YSF6ipkatGKlWJkrB152zoGDSaJXyjlqBnAJAIbPfg7wpZdGCLe0ZgFX4DsYelppP7j+rReV/GG1v2CKExJDQSmf0rsi44aPq130gCzYRDkPECoeh5IzSNJeD4+xUvyJj+KMiAF665Xj0dHVSUttpAX9Ywx9tSi6Up6shAmWt/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 22 Aug 2023 15:09:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 5/6] libxl: use the cpuid feature names from
 cpufeatureset.h
Message-ID: <ZOSzjldwiDdSIFyF@MacBook-Air-de-Roger.local>
References: <20230725130558.58094-1-roger.pau@citrix.com>
 <20230725130558.58094-6-roger.pau@citrix.com>
 <2256ee98-e34e-2229-66ac-baf2337d7c30@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2256ee98-e34e-2229-66ac-baf2337d7c30@suse.com>
X-ClientProxiedBy: LO4P123CA0153.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA3PR03MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 57dc768c-338f-443d-3a52-08dba3110ade
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NT0OUUPRNuoJ5MfaO+m77OQ9DEqxPnMhsRZSrapXloj3V0N+h2JaJull8STRc7lHOWyM46qthJCp2r0/n9PX17P9hWHlBDVHto2fD17P3fi8n+1M/tW1qmhy6wBeO8e2ZN17O0pVwTNrD5/RFEyYwx1DycX8FZxbfnXOrX10rpVU6ulYbC16IVnlHq8OI6OTAb99wKp+UGeFqmuHsySLCzgUxPSY4vn6Za1RGtV0mEhWzAmOubt+SUF7RRlzJodnOXySQj3QNXWTB5Ibw8+L7bwQqwrmAucG6Z3pIpY29gnIVfIx2HTrP55jP7dWFm80d9qtaSVB5Y2c2EGitXn1H6KE3aYJFBcis7d04yNAm8LKEkzYzjBteL9PU1ChYYwAq1wHNoMZCOf5knLgOpYK1yQI36xx10RkBAUvDDk1CN/W4J5E4hhqcV/u0J3Qp+Y2poliNfUe+MGx/a8xQXZRAwQrrblFCm/ZwR2/sze/WmXOeNEmsJhAL3ivZlQSiPNeuXVxApDkExG7m+65niXDxCbuZTk/MYRfVHIItNlSFEb7mIfQje3gDAaPScbqHQdb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199024)(186009)(1800799009)(86362001)(5660300002)(66556008)(66476007)(66946007)(316002)(6916009)(2906002)(54906003)(8676002)(478600001)(4326008)(8936002)(41300700001)(82960400001)(6666004)(6486002)(53546011)(38100700002)(9686003)(6506007)(6512007)(26005)(85182001)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ukg0TzhRb2ltek9sZ3BmNktUR1huMjhpTWVwV0t0UkhmaDQ1aEZPZjJoSWgr?=
 =?utf-8?B?SERyNmVoUkYrWGlBcGdGN3oySGdhVmdmSjVSa1RrVVpmdzFiWlBaYzE1dTJG?=
 =?utf-8?B?OW1NR2xZVGJnMjVpejVHVzUzWFFsTVd0REJLakI5L1hGZzhHUGEwRXdaN0l0?=
 =?utf-8?B?RXRIajdpNGVYSHM2dXlQWkVJODJRUFB1TWpob1dHNjNwbitZY0Zid25wb3Fn?=
 =?utf-8?B?Q0RLR1d3MFJXTTMzTmhvY2FRVEc2RXJGZ3ZEbkh4SFp2NXhHYklKUFlOUjRp?=
 =?utf-8?B?bE9yVjM1akU2ZVA3SGR1eEFwSXg2clFkVW1JbXNnb0JJaGppOFJ2Wm9oMEt6?=
 =?utf-8?B?anFRZGFjdXNmUk41T1Q2VHJmQjNLcjdvZXdhZDU5YlA3WkZJQy9IYjNNWkZE?=
 =?utf-8?B?eExoYjNxZFNGSS9YTkpVQnI1bGVmeHFkUFlSUENSa3FWc1cxb2k4WGY5THBM?=
 =?utf-8?B?aEh2cTVLWjNkQk43aWpRUGJoeEVjaW5leStRLzlwa05DVHFLVDQ2ZVNPNjFx?=
 =?utf-8?B?SnlqU0o5Vk1DNGJaLzJ0UndXL05EdnYvWS84UFQ0OHRXRGJySW1XK2tOdHpx?=
 =?utf-8?B?bDYyNWt1UnFYKzdYK2NVWTlkcmVaQUpxcTFLVEhLWmxnSDZRVndZejE5WFBD?=
 =?utf-8?B?dzdtcURYMWFhYmU0VC83UjBDcm0xYlgwV1Q5ZVVDZEI5cTRxK09iRFFOZEQr?=
 =?utf-8?B?U0laZXZ0RkV5VHI3Yi9HVHpxRnozeFUxOWNvUkRSdzU2T3dSNHFXTDF0b1gx?=
 =?utf-8?B?SmFhZ1BCbUxGeHdsYXNaY2JaZUFESmFCTGVHbDFqWndDYzR3ZjBiU0lTak44?=
 =?utf-8?B?RnI5aG9ESTJGbm0wRFE2d0I0Z1JUVXFjMkZHUlRHRkdSVGJTUzh4R3BBTmJK?=
 =?utf-8?B?MFhoNUR3d09lZFVXd2FGUm44bFpaTThwUjlvUGZjUWVLNng3VW9yQWZKWnFR?=
 =?utf-8?B?d2t1MWFGM3dPc0ZOTElySVl3dUlSaXlwMDdvNjlyMzFvZTdYd08xSnEyUjNo?=
 =?utf-8?B?MXdnc1VDL2FvYmJHV3pURDBoZmVCNUpxdzNnMFppWW1YRlBMeVF6MjdkdlBE?=
 =?utf-8?B?c2NNUUFEZmJZTmdVQVlDUkxybGdSQUYvemh2QytpVlRvSHJ0L2kwS1J1S0dn?=
 =?utf-8?B?NTc5RXEzeEZGWElRR2Eyb0JmVmZVS21SWG9vcmtxd3k5Y1Z5MG5DY2RDbDhz?=
 =?utf-8?B?VXE1Rm15aGhjdnJ6d3hkTGQwbVkybVZHYWd4QjdoVUFkeXppUFlRZmt5YldM?=
 =?utf-8?B?N1didWY3RklqU2hWblVKbENYRVl0WmxpME9DbjBCNklYemQxc0pVWXRmeVRy?=
 =?utf-8?B?MmloNkNJcG9zWkFlSEY3dWp4WEI3dmV2Q3A3VCtwTXRmVnBzMDYvRkJzRk1P?=
 =?utf-8?B?eUZwNHVRTXJBbWtFUVo1OXhCaWRJUXNFTEI0QUtkQVR2dFJTcnFQc2RaZlZz?=
 =?utf-8?B?R3dqT3lWSjZRM21nUktrVmVmOGxtblpYbXlWOUlENHZVQ1lSY2UxRHlLazBr?=
 =?utf-8?B?bVRKbVh0NktGS05rd2c3Vlp4MXoyNDAzWWNVSFU3TVFobjYyajNnWDBIc2U5?=
 =?utf-8?B?SXNEZVd5ZFdTcXNwMUhKTWFCbDNvTFgwZk9Vb0hUYWVPbWQxSEhqVktUeFFw?=
 =?utf-8?B?L05mc0JGVVJpam9TdWpvc1JDZUJneStCZkhSdmdKRXlTL0FSVzQxbzJKTmpM?=
 =?utf-8?B?MVk1VTdWVzJjTGhNUGo0ekx0aURtTFZLR09aR2VNOGhmNDNwUmdzejlpMElB?=
 =?utf-8?B?S1JHRWxXVmlmajBTTzlWU2V4K3FuakdKQ2tackIrNXhpY0FrRGhwUTJzUnBh?=
 =?utf-8?B?UWNJNUxnaUJKTVpNMkJCNlhtVm1KaEdXWUJXLzlFQ09lNVJyZWp5YXJWVTJK?=
 =?utf-8?B?czAzWmR3UGt1V1dWa2dmTlZkNUUyT2JKSXBYZDduRjN4dUhvcVBxeWlOZ1RD?=
 =?utf-8?B?VmEyci9aa1EraklKT1JFL29UdmIxbG45a1dkeDZPd1h0SEJZSXBZWVo2KzZl?=
 =?utf-8?B?SzFGckhKUjB0cnRnTEc2UldhNkJ6ckhQeDdvL3djUmlPV0prZDFpNXcwSjNu?=
 =?utf-8?B?Q0ExU29aZFNzQVYxSE0zSHo3NytHMTRlRlNNTHFsOURzSndIRkZCdWhQQ2pG?=
 =?utf-8?B?N1JBdUVjNHBoT1hhOGNSQzBnbVZMSDl0VTBJUFV0ZldQSzdLVkN4R29MT0U0?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IYJ4j6OmlW+xWLrnekODD1JHqTvRi1Yq0UpA9IUyBypRQh4hvbJQb+3myeIqbzYHgbN6fQuYsVvXHpAs3Dct9CLkpIsgRyblGNxWxiI/5cXzeIVCEoRccEpctq3S54qruTXfrf4M6r7JLvCUg81tPJUPmFQhlSXqZpDsXuh0Fd6e8uY2TY5njl/Q0XUGP/xLnJ1ScGyMHqf6MoYD8Us5NzY0qdiUL5iP6BuG06Sbxvj7iuhOm7/JZNf3fUs7eSBjsFnLXoGt8VwtcNd24tynmutX7DsOSFPWFFkBoXOyxKezzjbr7SNTJpWdrWgiKveGfQM+B2ZJ467N5XD/vmeUOOYMg0N24zMsVvAeKq0gaF33Y6hltFVwKbUUVkaM3bbpLAyJQ7U6i/4bdToh0Xvq6p2ZlTNFVTSBNaoHqWyLAHZDWBu2qXq2cjlHwarZ48zbJ33L9LsqAW8nqHRlLbeXRtrTG6ijaX8iTHAruQ3W1rMUJDW3yEbIxS8mp7STv2t/1GJq6xAqIFeoIlm7aWRkEL6fHnu5FXqofXt+zFeQg+iwtUDuFmnIdLJNG4VuwZ3fPJhJ+WsZiaYnGvu8lYzCOiJpIv7MXso82V3ZUHoWAlyJebgw0JsFVXWhOTIx7K+j1cQzv7sMLmV06iPDambwvk+m26VkY3SHQmkOeaq9TAg85yThyiflkviu6O/vfLuEUt1mONUkaRXKcAwVAWE7JPspR1jno5crzhuLdGz8+3AYxWL+u7O8XCXql+GIN8Pnl/HKUQFqqz47jjtNbZ6BxkEBlz2P9Cmoo9puFca96H6eQZ1O2gYa9w2g8Rd8jPFB
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dc768c-338f-443d-3a52-08dba3110ade
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 13:09:39.7901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhthqhgiPzdSvCJZt2ctxC2uuNJ/slzld34uI15JoVJwnQRv3tUkqcK5iA6Tu8ar3PMezIJOQGI4i0C+dezJ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7304

On Tue, Aug 22, 2023 at 12:27:10PM +0200, Jan Beulich wrote:
> On 25.07.2023 15:05, Roger Pau Monne wrote:
> >          {"invtsc",       0x80000007, NA, CPUID_REG_EDX,  8,  1},
> >  
> > -        {"clzero",       0x80000008, NA, CPUID_REG_EBX,  0,  1},
> > -        {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
> > -        {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
> > -        {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
> > -        {"ibrs",         0x80000008, NA, CPUID_REG_EBX, 14,  1},
> > -        {"amd-stibp",    0x80000008, NA, CPUID_REG_EBX, 15,  1},
> > -        {"ibrs-always",  0x80000008, NA, CPUID_REG_EBX, 16,  1},
> > -        {"stibp-always", 0x80000008, NA, CPUID_REG_EBX, 17,  1},
> > -        {"ibrs-fast",    0x80000008, NA, CPUID_REG_EBX, 18,  1},
> > -        {"ibrs-same-mode", 0x80000008, NA, CPUID_REG_EBX, 19,  1},
> > -        {"no-lmsl",      0x80000008, NA, CPUID_REG_EBX, 20,  1},
> >          {"ppin",         0x80000008, NA, CPUID_REG_EBX, 23,  1},
> > -        {"amd-ssbd",     0x80000008, NA, CPUID_REG_EBX, 24,  1},
> > -        {"virt-ssbd",    0x80000008, NA, CPUID_REG_EBX, 25,  1},
> > -        {"ssb-no",       0x80000008, NA, CPUID_REG_EBX, 26,  1},
> > -        {"psfd",         0x80000008, NA, CPUID_REG_EBX, 28,  1},
> >          {"btc-no",       0x80000008, NA, CPUID_REG_EBX, 29,  1},
> > -        {"ibpb-ret",     0x80000008, NA, CPUID_REG_EBX, 30,  1},
> 
> Noticing only now, while doing further backports: Why was btc-no kept
> here?

An oversight, would you mind sending a patch to remove it?

Thanks, Roger.

