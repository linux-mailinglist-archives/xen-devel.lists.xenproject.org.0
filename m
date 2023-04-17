Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660326E43FC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 11:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521885.810867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poLGH-0002hn-Gm; Mon, 17 Apr 2023 09:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521885.810867; Mon, 17 Apr 2023 09:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poLGH-0002fp-Dp; Mon, 17 Apr 2023 09:35:01 +0000
Received: by outflank-mailman (input) for mailman id 521885;
 Mon, 17 Apr 2023 09:34:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poLGF-0002fg-GC
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 09:34:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ced5294-dd03-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 11:34:57 +0200 (CEST)
Received: from mail-dm6nam04lp2048.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 05:34:49 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB7159.namprd03.prod.outlook.com (2603:10b6:510:29d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 09:34:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 09:34:47 +0000
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
X-Inumbo-ID: 1ced5294-dd03-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681724097;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CjiwO2LbqKOgJFR5GfspgFmo2PSkJjR8xbepR1QYH08=;
  b=XnIz4nGRg63n3NsYIFwREbZrS+pbRyBGcG5TfUCFqZzcnPIBKQ3XGBDP
   VujoETSbZrCWG0cP/imzkvOl0x8WuAeou1jLwBydZEPLvc2Fbuz6VV0XZ
   t9DTKOWcUASHXDTmPWfCvIblD2fFOZvxfAE4Ds/MoM5ONrsaV7f33Vs3h
   M=;
X-IronPort-RemoteIP: 104.47.73.48
X-IronPort-MID: 104562965
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yO70BaDF1lBPlxVW/xPiw5YqxClBgxIJ4kV8jS/XYbTApGh31WNRz
 GIeDGmDPvmKYWP9KNB2aYXl8k0Hv5TSyd8wQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9B4ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpMJWK1Nt6
 KEhCTU9TU6unuG/5oykRbw57igjBJGD0II3nFhFlW2cIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxrswA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37eTwH2hCdxPfFG+3vFL33DCmkEwMSExahi5nvr+2nK6f90Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZjQtE7sM49RRQxy
 0SE2djuAFRHr7m9WX+bsLCOoluaOi8TN2YOIzAFSQgt5MPqq4U+yBnIS75e/LWdi9T0HXT8x
 m6MpS1m27EL15ZXh+O84EzNhC+qqt7RVAkp6w7LX2WjqARkeIqiYI/u4l/ehRpdELukopC6l
 CBss6CjAComVPlhSATlrD0xIYyU
IronPort-HdrOrdr: A9a23:pEyRXa0f1SfiqsBcD8kioAqjBI0kLtp133Aq2lEZdPWaSL3gqy
 nOpoVi6faQslwssR4b6LW90cW7MBHhHNtOkOos1NSZPTUO2lHYSL2KhLGKq1bd8m/FltK1vp
 0QFJSWZueAa2SSTvyX3OB7KbsdKRW8n5xATN2x80tQ
X-Talos-CUID: 9a23:EmoKXmOSU28pDe5DBg1G3nw3B50cU3jt7yn9OkyxL1h2R+jA
X-Talos-MUID: 9a23:/bUa5Qk37R7FcJWeU5u2dnptFZhFsviDK3kxtqpFufaHcnxMPxOS2WE=
X-IronPort-AV: E=Sophos;i="5.99,203,1677560400"; 
   d="scan'208";a="104562965"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlP52K8tBWrd0CRfEEdtDO/fGUtV/jqS35HN2m/7Ywv+B00I7/2MMn9FYrlhsoxr2WPF9tTEMtHD7VLya5izjacnhB0kLAoaLIwaE+2RAtR4LxqjWL4tanZQabn0v4YT3Sx6AgcSmu/46xdbKnudgpkR5Ux8TFCNmBGrd32Z0tqrwF6b0E9VpulllfT54pZxbQ5GA4vsNoyHT5/Bp9VTN1Ot1nvqHiiuQ5YGTi+dIdD197nk5Os/t2f3karWZztP8JlG1cPV+QXmFJMymAkUe/+FCKiFIASgBim12bDX7lNUX7z6q2/IyP9ou3v+gEcDPzurJGHFZe5XYPlPovkCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGDmXLLZfnd90PTseAF0OPUHPoRFvm7qxvzmE5AZKkY=;
 b=n1gCg2RpKv072Vyrah2iLPjRpnWUEAmf+IYcFVvYFyPw7yKr0NAY8h9D0X9J+F6vwB9BPTWX+YtXhNnhs9a/HBEZce9TCpNmwxp0FDYQWa7hG6Wjrle/hMsGJpQ/GGZmnoaAnk+5i7W6++YvVdwSytqJVxuztRHvJzX1dEHyjLXGCVdWvZJP1Uu+22w9soJpeu0QrDXLjDfcOAwVBHg8P0CBvxbqIvKOx6Q3v7BF6e+E/9z837eM8iTC5fpHvzDFhm9nu2pLn7U9gkz4RDmWK+/VL5igJMkKENLlBVIM9qeJ7+bvICm4Hpr88YGt8Eqt8QGwrVfkI7UohCeyPh4fbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGDmXLLZfnd90PTseAF0OPUHPoRFvm7qxvzmE5AZKkY=;
 b=aly1j86dJu/M1oBxXcjGWdPUCRnDh/SFbn80dy7z2z3u5W0D72Cb5GWdTM6J7zaQ1DjMTXoJ0ya57yy4McBQrdzdCE861I+0TgRLtMU7+xaUWl2gada3WpvfkDy8TKSOF0KduVblhj6KeGfgueiMkwzIGdDBBsG8EAO7N5yj/+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a8f841c9-9a09-75ba-d8b6-c8924074a210@citrix.com>
Date: Mon, 17 Apr 2023 10:34:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/livepatch: Fix livepatch application when CET is
 active
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20230415195816.3717648-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230415195816.3717648-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ca0a94-68a1-4f45-b7db-08db3f26fb8c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wKq0C0DZAq0f2+oGVISahTh8VsqdvG2shZqv84OJRonPk3jtdeWJXyLu5tBDGd1gfXkIrSXfRcW+yNGGd1pjTDyPinmTyzvQjubIntowgIaaiA5jnpYeEVZ63O6xP0ldlZ9puIGOVQOua8rUrSQtZ1+3SzNfWLLH3+gxhFfUnJ9WiiBSDN5536E/5vAVKY0v3aezrvpa8Vw6WVqrJ21bQmljUSy59L6tPFsdswRzcseiSd+eIKAQ1BooWr3OQhwIPPYvYse1mYtONri9Vw2p5ZwtNn4k4GhXTCmdeUbXevlGHBuVSMOEcfcYHErtdQ7OTRPIXP/0dGV2i8F18z5mSCjnZWfFkVSJThaiNJ7l3JOF9al57+ibRFrZeZY1Ac/CdBcasRVOWWwLl54TZ4UVlXUxFoeDBp2KWziJqj96yqZoAPN+u4TY1vPfWRfIUqbfhlevxvP0YmHNKqMN63ZI42pQ+MPAW8eCrM3tNroy900JVHoKHONnYaCBA22ISo8xRYR8QoeiL9t0yOFf5DXpaeKZ0u83plEwmOcxNPH4LXAa0ifhP2QYuI04QqvfcG5RFrcJpoTKSY7bhKy1E6ZrxtzwECLglWOogg/U+w05ReLwwMgaaT4186oJcZAGTDIkVfwnW0kqqT+thGD8SG7ZwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199021)(38100700002)(8676002)(8936002)(5660300002)(2906002)(4744005)(36756003)(86362001)(31696002)(478600001)(6486002)(6666004)(54906003)(31686004)(186003)(107886003)(2616005)(26005)(6506007)(6512007)(53546011)(66946007)(66476007)(316002)(41300700001)(82960400001)(4326008)(6916009)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3VMRnR6NHJkSjJ2NFE0dC9NTzNmRmFOVzF5T1hyWXk1d3BiakNIVXJkZGVV?=
 =?utf-8?B?ZFQ0L0Erd3R2NjY1em12L0ZUNmFjMGtiR1BoSXUwM0k2a2RSUGQ0NU8ycFFx?=
 =?utf-8?B?TVY2Z3VoZC9VM2FRQmpxYmNVcTBSTE1uWHc1dkRmQkora1Nydmcrd2VmTjIr?=
 =?utf-8?B?ajNCZ1JBK0dobnNhZzVqNG1NNGRIUTkvUUt3aWYra2llWFg5ZXlSQnJyWWl4?=
 =?utf-8?B?NHdHQ2JoSGcydHMzclNHaGhrb0haemRSUWdJbVo2OUNQZGpsYnd5QWRmS3BG?=
 =?utf-8?B?eS8wWTk4SlZkTE02TnJMMjhJZzcyZGdKUEZqNllNN01jeFBQQ1FzMFdIZldZ?=
 =?utf-8?B?T1BhTUJiM0pQYzREcUs4ZUcrbXUrUzRZWkFBSmJVbDZLUTlnZkpHQithejVR?=
 =?utf-8?B?N1paRnFIdEFPbWZYTGl4RXFxSFdtcDdDVjBGUldtT21wN010em9RTm5jcS9X?=
 =?utf-8?B?YUFIWFhSNnUvbXd0d1ByYUQyTUkrOHo1OENHSkdDN3Nid1BYTU5ya2lnaVZR?=
 =?utf-8?B?RU1jOTZvbEpFM2NINEd3SmZkRXd0UmpYTFY5cWxwc0R6SXYzZDdVdncraWVl?=
 =?utf-8?B?WlVld255YktwTXU3Z3dZbjQzVGt4VEwyWm8xc3JUZ0tuOGkwZFpYL1NlQTFC?=
 =?utf-8?B?dzhNU3pmcUhmZG1zSjZqenU2UW1xanpUSGEvV25XS3ptYVFPenUvQVh3dGlj?=
 =?utf-8?B?ZU5vRGFqLzZPSXRLQVdycThwbkx2cXcyQkFuNHEyeUVYN1NCaGZwaS9mS2Jq?=
 =?utf-8?B?TnA2cFdJRkdkenVIN21oMmFjaGpwL0o1ZkpldVpJOUppbC95eEdhemdoRFdq?=
 =?utf-8?B?ZzVyWGlWYjg4Q05iY25odzVFb09kd2JiYngvMlZTZUVFOG4zK084Q3Zkc0pj?=
 =?utf-8?B?aEd6cDBYcUdYaGxuczFUVWdNZHZxMG1kck5xU2xnK0thTUErOWZkWHpnSXhz?=
 =?utf-8?B?NEkxcThRT09GeFJNM1pJRmNVZEFRL0pDbXdudmRSUkxYQXRRdGNjWXFVa0da?=
 =?utf-8?B?S1dxWm5iQ0RLUVczNU9VdG15VkdpTnczc0xPQ1g4VHoyb1RSSDdYNTYyN3pZ?=
 =?utf-8?B?cmhwcy9CdVlkWTFnUU1wRVFFaitKbklBUUNONCt3ZVc4YVBhRTJBOHhMSFlu?=
 =?utf-8?B?NHNmTEVMLzliengxNXQ2cmprK0Y1enR6Yzd2c1V5a09vSmZTQmRKV1JTYUxH?=
 =?utf-8?B?NTE4Y1pCMzFGdGZldVJ4VEs5dXl5RndoYVhhZ1lLTzhkWVF2RFZEek1sYlNp?=
 =?utf-8?B?NkRFMWQrWjZiVFpFbWVMb2ZzOGM3ekRBODFwT2xhcGxTMjJJbG9sNnhWbmlT?=
 =?utf-8?B?UFFmOG9IK00rRHkreGpaUUpkV0hEZDZ5UHgyWEVNQkMzMUd2T1BBN09TVEJP?=
 =?utf-8?B?SkdyU2tOY1ZjeG9mZmZRYjRmVllMcVZtMGYyK1JVUE1MUzhSY1BTaGM1VHE2?=
 =?utf-8?B?bjFzYWpPTUU5aTRLK0UvU05RQXExZEZ6UVlIYzcvZE9LS05MTnJ4ajhzbVRw?=
 =?utf-8?B?eFNBRUpyRVhPaGhOUDhmanRYWElWZzNNM2pjMEYzazZDcHRuWUpSTEJFZHB0?=
 =?utf-8?B?a28xMTlJUk9kVDB1QUd3NGExRTJrWDBLeVZsSTlEU2ZycXVGWmdPbmlldFMx?=
 =?utf-8?B?cHdJbHJHbStPR3JxOTJLY0hUV0l2VHNvTmh0YlBEK1BLTzQ1SUZvd3R5dndu?=
 =?utf-8?B?WkJhUVBRSHUvZG1nM1RoSVE4K3J3cnFPcnQ1ZWNrZGFibHltVm16WithWnhE?=
 =?utf-8?B?NjRTVmUwNjJiVVRiUFJraGhvRXNQZUptRkljK0tOZE04UG1RZms0cEExRzZz?=
 =?utf-8?B?SytVUGljSVppMlFVczEzY1dOUEZDbXVjZ1h0cG1YcFM2NExvSTBpR2UxbjNs?=
 =?utf-8?B?aFVEV0V2ZU93SktWYVgxd0lyS3ozVzliOGtEbW5pQ1lCNklwWk9OblNUemZQ?=
 =?utf-8?B?UXJ3NFhCN0RMQmU5T3VsYWluNUlJM20xMTVaMEFvbWJSaUVRdld4S1lKamQ1?=
 =?utf-8?B?dUlEOFVlWU94NzNseW1IdlZzbVlnbkFsTUFPL1J5bkdjZFUveFdnbXd0cUhC?=
 =?utf-8?B?cE1SL1ZXbzJROFBsV3FOZWcrSVlXemU1Q2ZjNm5yM256dmJDMTFlQWtsRVdX?=
 =?utf-8?B?UVBpNW1JSXNNQmxiSmhpeUtYZzVXZGltSC91cVhvaWlQT3NPRmtUNXZ2VVA3?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nLGpOphqxtYHah4rmmPfbIQsEWJvLSnkiYeHUiqBGqtMgCJsFViIIO79FJIX4FCJ9Hp5iDARgbUJST5MAB817fHroW817sodd2O3irhKRWQMeODyCeXKr+/+hohvM2ViEoaHOCvq+ksOfKulgHpTxEYbE2V4pl8BkzV9cumd6zIdG4Y67weqTfuP1ZVTxc2I5L2BqYWfQHkvIf6DYjR4uOFWnMxGOEZG6wlD1iTi9nd3lTDcZYirk1RXZCFCDfcMjwx43ysUXm+EuuZBQJT6HFGksQfJ0FxAAbcnQmAzpsJL+ValQrDkGvpZFSXkv/ra4NlhOTFiJKoJF+gKm4pQ20+A6E7sQ4RVCP3QylDUxgZKSU/Nb38S8qUD6C1gZf8tSaKCW3i0KhgjCRhhLxr1CJfJCgiHpmzVBpZQjtywA5spvx0pHoTIToGkeNJsYiqtZlrmfYGGHHciExNmOLPA8teHgfX7rCkxa9M04Jka3eI9veEEfKP30cqrk5L4mcce/hFZ+KcFqx+F7ikvjvcHo5qLXPjte0bQ7SYlPUqvP9PA9JC9IRQfi9D41CPnJMEq+dhlNWC1mpBIsrVnjTe3uOvqOfU8hdGSWXbe4Phq6T5BmUher3+DxTtDPhnNHlKcrwlCknyvPHeN3PPaaP5+RWqpY1UgDqNaRwP7XrmDI1CdTQmXWj0L7QFwucQhwdpj9Zl9YLpSEBRzSLC5QUWVZgLVGp80E10F8+KcKQLXxpo3xwP/Gtds2L8aaAAkyRYa4anyFgDtzaJKqdOrybg3pv/mMumxZmiP3z/hgpPQn50Tft8xpIWPHB8vrT0zGHq5JOTJ+mTy0p4vvEh49cos9Z//BWXP5yge/w8PMZN8CHU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ca0a94-68a1-4f45-b7db-08db3f26fb8c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 09:34:46.8791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3crwXTqn/xbDSvy7vqYRrlz6rKlOe5UqhDfskDY7l+02yBivsEvZFbtOVzmplad2uQ/de13Nuxrp8ejhgMiXmKeHXalgZrbQn+lvZRRqNw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7159

On 15/04/2023 8:58 pm, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 36a07ef77eae..1707bcd2d15c 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5879,6 +5879,77 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>      return modify_xen_mappings(s, e, _PAGE_NONE);
>  }
>  
> +#if defined(CONFIG_LIVEPATCH) && defined(CONFIG_HAS_ALTERNATIVE)

Gitlab testing highlighted that this should be || not &&.

I've fixed up locally, but won't repost just for this change.

~Andrew

