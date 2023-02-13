Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CBB6943CC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 12:05:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494362.764403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRWeB-0001F7-3s; Mon, 13 Feb 2023 11:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494362.764403; Mon, 13 Feb 2023 11:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRWeB-0001Cz-07; Mon, 13 Feb 2023 11:05:23 +0000
Received: by outflank-mailman (input) for mailman id 494362;
 Mon, 13 Feb 2023 11:05:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hPdT=6J=citrix.com=prvs=4018836dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pRWe9-0001Ct-Dl
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 11:05:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bf35e03-ab8e-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 12:05:19 +0100 (CET)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Feb 2023 06:05:15 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6355.namprd03.prod.outlook.com (2603:10b6:806:1b6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 11:05:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 11:05:10 +0000
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
X-Inumbo-ID: 4bf35e03-ab8e-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676286319;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=r3/a8WF2x6t8QQ/NlA9CWJmt4lOO0SParreVHDBup30=;
  b=VTwtobEQCO99x15uu2e+qh6YPFAyFImvqOEsRZYQCU4PPSPD1siyasm+
   uZGY5vu87jhrByxnFyNeumIoY6ntT89L8Ja5fuN1yaISpyUZU1Eb5ki3s
   qDqcfaSM5mtzfXStOC5Fdcg1nbiEJSAqRGpnlfgcJsSB5hc/jVfPeRnkR
   0=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 96797059
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0mgtz62MM6VbslVAifbD5Tpwkn2cJEfYwER7XKvMYLTBsI5bpzcBm
 2caUWyCOf3eZzHwLd52b96+/E0Gu8fSn9ZgSwJtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZnPqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfCDxp3
 sQdazM3Mhmp1tiR/53gcvVgr5F2RCXrFNt3VnBI6xj8VK9jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6KklwZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXKlB9NNTODpnhJsqFq07G8wGB1VaVC+hMOW1RC8C+hyA
 VNBr0LCqoB3riRHVOLVVQCisneAuRIbRNN4HOgz6QXLwa3Riy6bDGUZSj9KaPQ9qdQ7Azct0
 zehgNfBFTFp9rqPRhq19KqS6zW7OiEXLGoLTS4CUQYBpdLkpekbjR/RT9AlDK+8iPX0Hy39x
 3aBqy1Wr6Uei4sH2ru2+XjDgimwvd7ZQwgt/ALVU2m5qARja+aYi5eA7FHa6bNMKdifR1zY5
 XwcwZHAvKYJEI2HkzGLTKMVBra16v2ZMTrax1lyA50m8Dfr8HmmFWxN3AxDyI5SGp5sUVfUj
 IX74Gu9OLc70KOWUJJK
IronPort-HdrOrdr: A9a23:8Vv4/a21vV4K/EBaebqw+gqjBW9xeYIsimQD101hICG9Lfb4qy
 n+ppomPEHP5wr5AEtQ5exoS5PwPk80lKQFrbX5WI3DYOCIghrREGgP1/qG/9SkIVyCygc/79
 YuT0EdMqyKMbESt6+Ti2PUf6dCsbu6GeKT9J3jJh9WPFhXgspbnmBE43OgYzRLrX59dPwE/f
 Snl656jgvlW046Kuy9G3k+RuDG4/3NiZ78axIeGhg9rCmIgjXA0s+gLzGomjUlf3dmxqoj7m
 jfjxa8xqKttZiAu0Ph/l6Wza573PPn19tdBNeRkIw0LSjhkQylfZlmQPmjuz8yydvftWoCoZ
 3vmTtlF9lv43nRem2zvDTs3hTtyzYo5TvDzkKVmnHuuNH+X3YbDMVG7LgpKCfx2g4Dhv056q
 5RwG6Dl51ZC3r77XzAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEb8bdRiKprwPIa
 1LNoXx9fxWeVSVYzTypW902uGhWXw1A1OvXlUCgMqIyDJb9UoJjnfwhfZv3kvoxqhNCaWs1N
 60d5iAU4s+CvP+WJgNR9vph/HHTVAlDyi8dl56am6Xap3vc0i92qIfqY9Fl91DdPEzvesPsY
 WEX1VCuWEofUXyTcWIwZ1Q6xjIBH6wRDL316hlltNEU5DHNfPW2Be4ORgTutrlp+9aDtzQWv
 61Np4TC/j/LXH2EYIM2wHlQZFdJXQXTcVQ478AKh+zi9OOLpevuv3Qcf7VKraoGTE4WnnnCn
 9GWDToPs1P4k2iR3e9ihnMXHHmfFD54PtLYeLn1vlWzJJIOpxHswATh1j87saXKSdauqhzZ0
 d6KKOPqNLMmYB3xxe+04xEAGsoMq8O2sSTb5pjn35+D3/J
X-IronPort-AV: E=Sophos;i="5.97,293,1669093200"; 
   d="scan'208";a="96797059"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8NBIJedvppyG3xE0uCNSL0vwmhaUoOD36Y9B/VVEpkIfu4lEao4omwPECT+vUIcuc32321UctRY6addd4VcLs9YnegkiOfwtWgvFLx6yhwOtoPnYfmVt2L9zFpNmbzUnSVYan9VjpG4ur/OBte3pK/CQOQbISokgu4SHvr6fmSVFfDIPwb42inUlS0GUb35crGz3hRhgjhLGj/LoRpdAp3PIKNqhTa0jv9QTKhjflxBlu1ztzb+tjI21gOjsRPhuq3v2rGHBo+P2sLpidrkYz2TeE8B5x3qzeCdVa1XAdmmHvyaMEN8cWuuWEvnfwi14q2R+HaZbYE7Gi5BNxbqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3/a8WF2x6t8QQ/NlA9CWJmt4lOO0SParreVHDBup30=;
 b=QeRckJVR/00h1YFyUb5DLRxvcQkDJ6vmIh+/8CTcfje2jJEMw73HpG9l/i/ZjU3WORuoI0aHkJJh3br/uhbvRS+YUttHHN+eSfNTfBBzJJNZzz4/OHIN/6ras3ABf0qraWTIHDFnYKBHdJjWT7pr+QCnKBb2gM9/pTlu5wwsmvA8tXM8WBgbUmVTY4PKyjugIvv1edbnsIIMSm1K2BsQA8siO2mjvnu8Q3LLXTRx0E/19KD43yGc9a2D6rDNZIVlPvZx/cJrO1bPlt9HYiEOzEd0Z9Qs7lsggbDSe/PkhZKlLGp8TIbbV8Chq1YzhGeAFO12vsimLit5nQwmSa6+rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3/a8WF2x6t8QQ/NlA9CWJmt4lOO0SParreVHDBup30=;
 b=qMKRKqiF6yAlZus3SBNhlFORMW09Ty6hPTfQRzV4sD+k3HIxHkFN+fAyLXXBKKMrPpHiyeX9qgfN6F4V3oT+ZunWPURQ9nnM/4ozZD14m/t0DcJwEZPo/4Rje80gAEN41sGn12a60WYRugvEYVM4/IJbAdTTp53K+H954bZsQqQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4c3e3350-b415-3414-c1be-f5d7775ea867@citrix.com>
Date: Mon, 13 Feb 2023 11:05:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/vlapic: call vmx_vlapic_msr_changed through an
 hvm_function callback
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230207094347.1059376-1-burzalodowa@gmail.com>
 <a1fbb69f-3fb0-3a80-cafe-94b0fdba5a2b@suse.com>
 <c3d5f342-5897-5dbc-22ff-4f52885b3a6d@gmail.com>
In-Reply-To: <c3d5f342-5897-5dbc-22ff-4f52885b3a6d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0612.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: f12801fc-4e4e-4a4b-5740-08db0db22c4c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dZoBIPrM1rDe5ypEewoVfSipBTB9y4jUNhHvtzz8ZZGv6cqi4Jm/4YUvc/S3vGgGGTe6N799Yhauj3Ray1yZTuLTVbYJR7B5wOuTTIFYPX7jVFy8bQAXD+2Mt7+mdKgoD4rbSw0o+oAfFwkZqzbeJv23PH3RxwO53TF4PLQXuL683H0M8HKmRGBee/TwjebYgZeqLq4ZFisDTkXeyLJmLPSJNwnvgPky1XZyoW0Th2SM/xlOuZJpLEGY35AiAQBDgwM7U3xhCP9S21J4ewufvidcPqPxuYW5XDDvpmm/10e611efofBD+P3vT60PqvQaCbIgx7Dlm91V8AR5OqkaXQZhbFpPt0rULn8aJAsxG0cmVGv61Y1zfSG46XsfbaIz1oKvzKMEWN1ny3C1eamT2k5kSxLYJLLUmU4Daan1Gz4D658Kk+z8wdG2TPDYx7FHK4pFAiDQqx+fZkfunqtoBC6t+v8rZs3gZNd1tciBy+zJ6nt+imy62lnoS+FdAalrVljHOehOxKBFAueHQzrWaSfToq8G2BM6IvhbUXPNgmXY+bbapjGnqbrpcD+DXvMp/uChtE73XYQqjZFBh3eQn9tmmal0N2QOwxL3/+S66tkgMrFg5mm3Shj0wsMhSu5t+HYRjr+VxYYpKfeYHFI1YDKkZh0apKea/cLPKGIbbTOVS95byfV69wS7zuDlbEqa/LU0SP0deQJMkrw6w33IsDWF79P/6P56UPPV6gJi+7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199018)(38100700002)(82960400001)(36756003)(31696002)(86362001)(2906002)(41300700001)(4744005)(4326008)(5660300002)(8936002)(26005)(6512007)(186003)(6666004)(6506007)(53546011)(2616005)(316002)(110136005)(54906003)(66556008)(66476007)(66946007)(478600001)(6486002)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXBWVWU0cDRUM3RnUmlmT3o3M2E1RDhyMEJHKzJtN1YwYmREZkR3MlVYRHJD?=
 =?utf-8?B?V1hWdnZ4dTRlTUx2MkI1SGR3dnhXVjlyZzBRMmlzNnNDRnY3ZjgvYmxza24w?=
 =?utf-8?B?alhrNm5FQzY3ZmhlUWpIOEdib1RjZUI5T0lENmhzaXpXQmV0YVRzMEFaY1ZM?=
 =?utf-8?B?MHhYUDZtRVcwNUEvZHFUYXpNRDZJNW1xUGJSbDRYTzRxbmFzVHN4WnBpZnFz?=
 =?utf-8?B?K1lXcm1iY1A5UnRORUdlRHFNWDRwRE14UzN4b1RCazNGeWhFem4zZ2dJZkZv?=
 =?utf-8?B?TWpQVFNzMmo0MFF5bDZLTWQ2bDZwNzhkMjRMOExPTmNOY1NIUW9wb1RldDNh?=
 =?utf-8?B?eFFYbTA0NW9pRW80QUt5a1NUY1FXL01DeWhIdWVhK0pCcEZ2Zk5JREJtMUg1?=
 =?utf-8?B?TXd3ODZHKy9hdDlxSlpqNE1HbmxnQjMrNmtqUmZyY2lZZGFvUkk1bG9RY05m?=
 =?utf-8?B?NFg4c0h3Yi9mYnlsbG9ydlprTVZLYUQwTk0zcHRtZzlCUWpUMzl5Yk1PbzNL?=
 =?utf-8?B?VFYrR1FKSzhxWVFtZ2pKWmVhMHFiT2RWenpRM0VidFlZMW1ESHhNQk1yQ2x2?=
 =?utf-8?B?T0JmTzNwZ2xnKy8rY3NscEpKL1NwWmpWY2VHTUJBc01BZ2ZFbnBtN0w0emFo?=
 =?utf-8?B?SHltdHBWM3M5ckJGbEMyYzRKWHIwb3ZzU1BsUndKVG94L1Bva3lTeVFoOUNH?=
 =?utf-8?B?dUtaKzhPRHJnS1cyNjlHbzM2RTRrY2NVZjZoSXYwTVZRV0dSem5nZHVQOUo5?=
 =?utf-8?B?bXF1TlhHR09rdU8zc0NGdW9XdFMwNFFMUjlObWlFUFRHK3daS0JmQll3RVNH?=
 =?utf-8?B?YmYvS0RTR3NNNzRxdmMrUTB1SGxKbWFSZ0xlNzNBNTZHSS9SbS9jaEg1cEtj?=
 =?utf-8?B?OFVmY3JHODN1U2RSK242Mm1DZWNQbmVJU3BkUm1VR2g0R2xyWVpUWWl1UXND?=
 =?utf-8?B?Wm1CeVVCeGVnT1dEUzhQNmQyM25YU2V3OUVVU2lxQURhWmlKRy9HQm9PY1ZD?=
 =?utf-8?B?RHZ5ZTFsakR5eWVpMEM4TjQ4bTI2VXNETzhoMnVaRFdPZWJKdTlrZEhWdWRn?=
 =?utf-8?B?ZjJEbGQ5MTdBeGxWelpUdGUxMmdTVFZtNVNydERDcFF5UllIRmZXandEZW5a?=
 =?utf-8?B?bjlueVNjQ3JIdEl3a29pc2xoeDR4Z0xhVXRUU0Y0cnZweTcwNVNRVkl4T3o1?=
 =?utf-8?B?WlNnekRWVjJKLzEySkYxZkhZUzgyY0VHb2srYzFPUmJ5TjU5Ui85VHc5WnU5?=
 =?utf-8?B?TjVUZGJkdHF4cUdKN29UQ0lzeUpqQytEMENmc0dCYVBPZzczNnpmRjZGZ25R?=
 =?utf-8?B?Mm8raitKU3FpN0lWU2MxdERyVm8xNWhoQnpiZlBzVzNOQWhQU04vd2hhWFhI?=
 =?utf-8?B?OElSaFBoS0twNGV4eGtjU0VJSytDWlJqc2tFcTJnNmc4L1dyRVRCdVdCUjVy?=
 =?utf-8?B?M01LSE1wWkJLWC91azhYR0YvdjRGQzE2N01DeUh5RHJ2SnVFMmpUZEo2Z0t5?=
 =?utf-8?B?dkFHYmZqT0JKbVJSeTJFakN2a2l0WUlSNFBEdUxSYnZKL0tQandZQllOdjZ0?=
 =?utf-8?B?WXArZThydW1SZ2NndEVlS3NaY3NpcWNldmN1MXNpMkUxRzA4YkhCRU1Fei92?=
 =?utf-8?B?SGd6QTFOeVZNUVpueEhzZkQ1aGw4cTZFSURpZE1oaDBaWmc1Z3dIc24wK3d6?=
 =?utf-8?B?WXZEV1A5RnhES0NjRWcrbTFpNnVVRy9yUnlBdndjVExNZWdGd1lOcGl4Z3hV?=
 =?utf-8?B?QjY5QjI4SThCTEhPRU8rK2dxQTZGZmtQK3pwczFURW8vK2w1Z1BBSDVqMXNv?=
 =?utf-8?B?cnVBdHM1Q1lnbExvT1ZaNkVJRVNGUld2RDJNcmQ4SERHbE0rSHJPaXBXSVM0?=
 =?utf-8?B?bXRzNjlWcEQwdjJiRjlLZndJYmJhOTFIRm13MGhveG5qK0F1VjZ0c0wxY0V4?=
 =?utf-8?B?eTc0NTJOU2hRTDducVd5RC9KUjdqRGovMXpDb084bnNwR005QlhRRlNZUENK?=
 =?utf-8?B?S3NrZUJTb29EOHRjVGFyMkdzdmovcWxySDN5UHRhWFZWQ1lweXR4NllkRitl?=
 =?utf-8?B?UXhLd0JhRjdpeE9qNFgrbGpwYTgxc0w4cjlTdFZwWUdjS2ZSbGxobUNvbnBs?=
 =?utf-8?B?Z1l4TWVFNnBuRmptZGlBNzMvbC8yNU1yclRMV2hFMTN3K0MwQmd2ckZKWFpu?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hf1IRyZlpMRy0Nuagu7gaUFXiNZtG9Ic6xDVmHHU73UkDNY6TTad/AT1PuBT8e/yE1gNV3V99ER7vkqLEjWzi1JRDP/dOzPHZ4PiowG2bs5Q9cYZJ1JomwZa5RM5l+wn+7CUf80XNlt3+lcNVYjZTpZaYqLgEzwJsbB3o0iBORv5bsApsl6XbYTkyBuorMHhf2dfbVykeDRv2qQfcxIVIUYCs0B+M0SLOZJkmG+3df8GRy2lLhYX0me8jzWwPAiZOEpTVpjkMaQtUFHEyBCyAgEnCWAj2ppj+Avw5jx2+qkSI4nyjMoKn0YKBauDTqT6jYfeTV/BK/XR7SZ+amM9kCO4lr5UyeBAqt4yc7vrzGrL+NGbsL412WnH+A0KVfo7TQUYPToe0+PPMfGZ/XT1xHsutXoPotewoz3SVXb3kzobrkUXKGi+C4z1Dz2uCxNCu70N9+KggWs4T2HAamhibz5y5vVtHKJMRwGISvJYPSz767c42N4dm8q3H8DVZlfLM5pFqr5Ex3NWXdXqJraf4rEWf1AlJVgPKP+6+o8mbXPY7fACRoQVgMpbeOCuhskK0ehJmc3D/jl7yssImgVGUL7b47nBOFXiP1dKBzJBq9JhwAaLxKDiEXpn8MEDFvDZNOHyK7WSstOJO91VotjidmSOba5NlTzVjwYW3OUGLYHmJxixcIzMyxzEPhcuPDlzAVI5hMJXHKhbInld6vajcLRF5JDSpymROGlnTTdOBRdECt3DaMTWURc0Ip9DWIq78x0XlMY5BQtt5uTNgR7ctE1oqdGpZR9joQI8QdljI7g7AOmrgcfW+qBGMjPXxi5G2sORjdbqxMCLuflIA0bCc4SiFCxcy+L2fMRekEGWT4zmsRWQLvar+w6XZQI1MjjD
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f12801fc-4e4e-4a4b-5740-08db0db22c4c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 11:05:10.4566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZaqpSR2YeSq7fyW37pb84Jh60+MgOSPt/cOUcPTFusTG/Gg9OJOCQm0ba02LUq4faa5gd80B9tJPGe19ZWxnTQX8puBo5SZyq4yDIJsji8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6355

On 13/02/2023 10:54 am, Xenia Ragiadakou wrote:
>
> On 2/13/23 12:09, Jan Beulich wrote:
>> I keep forgetting why putting it on just the declaration isn't
>> sufficient; I
>> guess a short comment to that effect next to cf_check's definition in
>> compiler.h would help).
>
> Yes, that would help. I don't know why it is not sufficient placing it
> just in the declaration.

Because it's part of the function's type.

~Andrew

