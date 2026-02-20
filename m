Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPMlMmlkmGmJHgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 14:40:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E78167E76
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 14:40:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237124.1539552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtQjc-0005KE-94; Fri, 20 Feb 2026 13:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237124.1539552; Fri, 20 Feb 2026 13:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtQjc-0005Ht-5X; Fri, 20 Feb 2026 13:39:56 +0000
Received: by outflank-mailman (input) for mailman id 1237124;
 Fri, 20 Feb 2026 13:39:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rFK=AY=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vtQjb-0005Hn-6V
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 13:39:55 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2cfdf6a-0e61-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 14:39:54 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SN7PR03MB7153.namprd03.prod.outlook.com (2603:10b6:806:353::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 13:39:49 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 13:39:48 +0000
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
X-Inumbo-ID: a2cfdf6a-0e61-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqBjgkljgtXwDj76pD5uT0rsQao8hTPODZR5hrwmA9yfZspI57n23oCoXFlJWOivTZBtaaodhnLHE+A8OyDIg6oaq/Vxcem+882Xb3Fai9PjhoewBOrmFvfvOB00He6NotpKGlYDvHZqf/J7Y/dQQmexWCUtxgRnwWY1Ow4y33BgEhbtD6r6xnoJLfqAvVnMt0YH51EIbewIwmHKw50d/AAnz3QyXvQwcT6BBNSj19Z8/gnmgtFhgjCT/0LbELBI44oGSPyorLsQXg3kw6nIEruqqyRr2uiCC1wbd0DdHuAPtjx7AyiRVKVG3JZl2LImfWzu3HZ9FZUZw+hjgRHwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IqUASny3tPCh8erTjAVLjdnTNSchbWRdSKLR4yM834=;
 b=wvY9IPwxuOCs2gRxbfxTwWEd/Te9BDRBR9jlpCkghusIVX6NRWRBGHL15EkY5FkvYI2qPcdGmzrMiVA6VkF7gPWlwDNbyn03TgRvHOvDyhVtguH7FkB9xUoZ467Xu0uRTD8CQUcfeo5FknyLAqyqu688OXMTv+9iOW+B5Lh+H9lxAK4kfXb/1WiajiTYr7rEmQOFi850BPujfbj5Of3z9Xf21RnfF0qgklH30JjYjA0kDbuakWYI4hOtEc9c/smCduIRMUNKqL5pLEAwAKlaiAR9KYYQRFcD9WwhJNkmvIfU7HLcISyRftScBgiQPN+cQ+6EZ72PE/DEsK1q/gnDqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IqUASny3tPCh8erTjAVLjdnTNSchbWRdSKLR4yM834=;
 b=PZQ91dpabsh6tLbHc4F7lwOFBM+bsY4jhbwhGGoaEdUjPLSSusHa/AU99bXWOGSU4AYIfqpoKyjZ+rfKaK4FCRHqfTvQ0wBmT7fxcldOWEtYR/yfD/5vhL1Ru2DVhMBijy2d0OXVRwpFlvf7JJDWGDTgnqNjS7FDhjyt69st7EE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9e305671-421e-4d05-ae0c-4549d1431cdf@citrix.com>
Date: Fri, 20 Feb 2026 13:39:45 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 01/12] x86/shadow: reduce explicit log-dirty recording
 for HVM
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
 <55287753-1973-ef36-3802-82250b8bbad8@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <55287753-1973-ef36-3802-82250b8bbad8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0130.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::9) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SN7PR03MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4a2a1d-d40a-4ea7-85a0-08de70858462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?allxUkowcHNtZVlPQWFSNjhoV0VESDJ0bVE0Y3BYMlowM3JsZmhheDJyMDI2?=
 =?utf-8?B?dXFuZTN4Ti9hNTdydndBM083VkVRS0k0WFdJUGozMi9LY3NLYTJ1eDl0Y3No?=
 =?utf-8?B?MUJiUUJZWllYd0tKV1hFRmZEL1lRQzN2dUFqUzNFbkhBMkJaUXpIUlBWaGdL?=
 =?utf-8?B?VnpyRWQ3WUpKdHdrdTArU3Z0Zzg0U2ZidWlFRERPbDlvTDAwTjBsVmYyOFhX?=
 =?utf-8?B?dWpmV0hCOExEY0FKcU1NRnhGZExibjJpcUFTY0JZYUJyVURyejlxOXhJd25J?=
 =?utf-8?B?b092dkhpaW94RmwvZFczWklQcUc3Mm5pbVN0cXdrNGpaQXZROUR4aTVXZFl1?=
 =?utf-8?B?VlRmT2cyQWRqbFhKVGlOYWpIanFLWVdydHhLM3Byelp5cHlLZUQ0Wk4yRDdS?=
 =?utf-8?B?dnhaU09SVTY4TmtRN0N5WHRRQXF2SU8zaE5DN0hYaGhheFhpZHkrUlUrTGl3?=
 =?utf-8?B?VTZsYmE5by9ZVjVaaThIdysxc25aQUtZTW93WERuVVZZTGcxZkVFakVWU0VU?=
 =?utf-8?B?cHFCQXJFZkc4R1hkOTE3dGNCbjFldVNiUy9XRTVxVnZ4eTdUL0t1b2ZoSm5L?=
 =?utf-8?B?U1VnNDdsQkJXbFlxdjB6dEduTmRhcVNISDBSTG0yeHBYTFdSSGZpOXlOQlF4?=
 =?utf-8?B?TEp0czdQMzN3VmcrNmFZZnU0aHpzdjVxUDErNzRMUFJ1U0VZdWtXYnJGVk1K?=
 =?utf-8?B?azB2S3JOSE1HeHJxWWNSdnhZUFEvQm0wRGZHQXpUUDZtaENtaU5rRTFHUDJq?=
 =?utf-8?B?OWpub2Nqak1wZmhIREdBQU81Rkh4ZnE2SURONE5HTzEva2hyYllMWklPZnBi?=
 =?utf-8?B?QlJ2TmUrMGdyNHJHdW5xenNuRkpTaUFuNnhLNWp3SmRscGc2eW5YNGlDbnRy?=
 =?utf-8?B?MXMvTHBNZ0x0OGVydjFreTFWd2IwM0pFcldFZ1UveUJMYlJaakVVTGJsV0pN?=
 =?utf-8?B?M0JuMDRoMnk1aHJYM2hreHZEbDVUbE5DTitueFc1VW83bnRZTjl5WmhLa20y?=
 =?utf-8?B?dFMrSXB2bkF2V011OGN3OTRPM0R3alVCS05IZ2J4TVgwMmdUdTc2dC9TUURk?=
 =?utf-8?B?Mm5pMElxWVhzb0ZsVUdmWERQUHZPMmJnakxWUzk1dkFFVCs5UENOcFhtSmZl?=
 =?utf-8?B?ZFcxOTY2QWZxeU8zYlI3NlBRSHNrZEZYcDJyTC9xNG8wOSs1ZkVUWWJONFVU?=
 =?utf-8?B?ZzBaYWlZb1FtbUVXNmp1M2ZzRUdGMEkxTDZ0cTFXbE1ReGsvYWpITGM0WkFJ?=
 =?utf-8?B?dVZZQjVFL1kvM1gyMnh6QXlrNi9iV3RtdWpNc0NNVFptWjUvenhsT0dMaThD?=
 =?utf-8?B?TkcvMUh6TnQxVWVNbVJrOTFlS0tVNTI3RFlVekliOXJHbU9oQVRFOERWaW91?=
 =?utf-8?B?Wm1PM1hwTTk2RVlKajFNWVByUms5Qm5jeUhQY2d4M21wbmd0YWgzYVd5L1la?=
 =?utf-8?B?UDJERVE0cDRrTmZFRGZxVTBCaWU3b2E4NEo5YlVJVXdoQ1NZbVVLMXBwTFQy?=
 =?utf-8?B?OE91RENWNDNmcmNqL1NCRHIwTktXMmRGdDl4bTFISEhXanZycTIyU3ZoOWhU?=
 =?utf-8?B?S2VJdVFJVnJzQ2ZlSzNtQ3hqSGcxWU53Y2RLZHdXRFFKeCtZMG83UzlNYnd6?=
 =?utf-8?B?VnZsSk1FMlNQelQ2Y29mUXJubkhlL29NL0dsWWI3WmJzK1lMOWpxd1JWUDlD?=
 =?utf-8?B?aVZhMUNWdUh1Q21XWGdaSGh6MVltN1NsWTZqVWE2bUFRdVZxQkxUNDhQL2NM?=
 =?utf-8?B?OU5MbzdpbXRMUEM5T1JHMTdMd1ozNytLRTVyWWg3NWY2OVFNRnBuUmNZZUNY?=
 =?utf-8?B?NmF4NnlHbGhMV2c0TjZnd3hTbU5Wd0hPaW9uQWx1Z0pHQWhQaVcyZFErQllP?=
 =?utf-8?B?Mk1wb0JIQkk1QnlRSGp2bTEvckVHaUx5U0tqY2ZKMVkwaVZZaTdWMXphSlo5?=
 =?utf-8?B?RGtsU1FoRm5HSmtYTzR3dERxS0t2TisvT1RNQ2VVdzJjNHZ1NmtyUlJQZGNL?=
 =?utf-8?B?NXE5aVhucHd4bWtzUnU3Mm45NDVlMmZtKzZFVzNkSnJlTC9ma0hzTlZmWWJs?=
 =?utf-8?B?RUZxM01BYW5HS0Q3d011ZDNXYXJFOXdVR3Y1OWhGbTlvdGsyc3NLOWdNYmhR?=
 =?utf-8?Q?2XbU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0V3eElYcEpVMk10eGhpU25yQndTcG1MTXJRUXNJVHJhemV2MFZKUEZFRHA4?=
 =?utf-8?B?dUR5U1RNeUhCLzZiUGoxd0RmaTlkZnorMmZTQXhPNk5aMTNmUFJIV2I0bWhh?=
 =?utf-8?B?NEJJZGxCVzFranRlakNkZ2xzRkROMFZ4c05WWGowclBzMktQS3pZK3VrNUY3?=
 =?utf-8?B?QzM5VXhreC8vL3lqMk00R1BmeHVURUszT2R4Z01kOVNMVG5oZU9leTUyb0JH?=
 =?utf-8?B?OWFrbjhNWjZ0VXJxOUZlYWVIdUZFOWVnYlo0dXpYVktKUk1IZXIzRHViWlNx?=
 =?utf-8?B?ZTZqdGljMzI2UHA2TFlSM2xHbmk2TXpiNzI0VGN0Vnlad3B5aHV0alllT0dB?=
 =?utf-8?B?WFVJU2J2bDVSTU91QmdYVGxIcVVUQ2VQSEZOQ0tNalJnVmFXNCtBTnhZaW5G?=
 =?utf-8?B?M0U5am9CZUM4S1pBQ2lUaHdRbmNSaWtPcVNSMHl3NEJKc0xVaUJHa2xjRGZG?=
 =?utf-8?B?dXVQcDFHVHVHcmE5L0xkWUw3eFhLRXJxOG1yMjVSRkczQkFnS3FUNUEwLzMy?=
 =?utf-8?B?dmhSYzZWeEJ6ZFBLMTJrRkErVHZDZ09BTHYwRENZRkxXNE9iKzA0OVVyWmJC?=
 =?utf-8?B?elh0VklzZmQ4ampvc0g1R3ZvcCtJbE1ZcVpiZnpWL1UvaDZXL1AvNWc3TVcr?=
 =?utf-8?B?bW8yRTAxK2Z0VmdzOTU0ZituUW80a2VYa0grdTlIejREbFYzZzdTWkxldXpa?=
 =?utf-8?B?VEpQZkk0MU5CY1FMQjNwNnl1bHRHWk51TVg4ZkZDQk5BT2RFMFAwakF6YVZH?=
 =?utf-8?B?bDVYdGVQR1ZaNnhvd043YWVBRkZLVzF0QVdVTGZzT0F1M0lYOVVCRzJleFlH?=
 =?utf-8?B?eTZFd2pvREphUkhOekczdzlJaHpjcUs1T1dqN0pueEpldVg5aTZWR3BiT1ZD?=
 =?utf-8?B?bU1PN1BqdTRhY3pFYmc3M29BZHVka2E5T01SSzJnemlSQnF2U3MxbmpDNzFx?=
 =?utf-8?B?VnBaY1FZUm40SnBzYlZWSlpEKzcwdDNHQmltTDB3NVNIbUU1MEhCMXYwYU9L?=
 =?utf-8?B?RTBzNUlPT25YaFNKR2FJWGZHRXZ3cmx2NmNLaHllclJNT0ttek1qMlRrdHFM?=
 =?utf-8?B?VmsvSWJxYVpZU3dFV1NHZllpUktOQTVERUpXd1l6akwxa25nSW1JTTN1SS9H?=
 =?utf-8?B?eE9uWWRBTWxFS2JEN3BjbGpFSmhIM0d4cmJlaUFwY284QllXOS9TNTBublYz?=
 =?utf-8?B?Qkc3anBVWUNvankxZWNNZ2hGMVhIWWxwYXl3UFNZQUtoU0FLUHJ5TCt4Rkx0?=
 =?utf-8?B?L1V6MjZ6ZmREb0VDbWM3NVZRMXkwVkRzdWwveDh2SmhZQnBJMVFxclVYRVJR?=
 =?utf-8?B?SkxONGdZZER1VUNnL0NxRDJQeUJTdzVMdnNTOUpQWmhXZ3V4Qm8yd2JkUDNH?=
 =?utf-8?B?dXlRQmgvcW1sZmppV0JTeURqK0tNYTdIVnlnc09veEpXUEp2OUZUWVlEbStM?=
 =?utf-8?B?aEdBbzRtNlBjaHdjZ1NoSUxZRmtYbW9GT2lIUjMva0NNdjVTVER5eCs0VkRu?=
 =?utf-8?B?TGc3bjFhd0RHT2cwNG95VnArU2F4S3R0TmVVbnpGVldIS2U5UVpIVDQ0NXBY?=
 =?utf-8?B?R3pmWHc4aTN4TmovVlJCQkNKbmtmRE9Nb3NtaW1PYzhueXBxQ2I4OEN4Z0t3?=
 =?utf-8?B?eFNxbndzL05DbFdab0FxVGFyWGl6bzROTHVDOUwrUnVaaXhOd0lZTXlTMzBL?=
 =?utf-8?B?dkYrdnBNMFl1Q05BSi9TbGRFMjdpbVNPeGk2YlJHR1hnMUp1dSt1WjJRaEpZ?=
 =?utf-8?B?ajFVMHJRN0RpM01BVmY2aFB5eTJMak5EaUpETklCU0JtK1k4VHNndXdvME1t?=
 =?utf-8?B?UFVUWkhOdGo2QVZsZ0RrbUVHL3FtTUhXZnpFVXNOdG80VnR6aTFJSU5DblNT?=
 =?utf-8?B?U29JckRQOTIxdVRkWnpSUkthUDNJeksyTWczaGVteERhZWo5L1hib2pqUXlF?=
 =?utf-8?B?ejQzbFBIeHpVWjg5M2JmQUxCMTZEc1JWdXR6Q3NOYVlHWmlPbktUbk1sVWZr?=
 =?utf-8?B?aklKQWp1amNkUnhYRW1HRXEyOVpPM29oMXJEOUF5em1kU1FQQ05ranJaek9X?=
 =?utf-8?B?a2tudVIza3Jac0dSZ1MrUitLOVg4OElDMms3Q0lxanNNbjlIYmhGQ3F5NEN3?=
 =?utf-8?B?Yjh4QUZWVWN4QUJqbGh4V3B0LzE4dGRDek9hT1hRYk41QkMrK1VHK2FZc3p3?=
 =?utf-8?B?NjBZMUtCTmtFMGtlN2RQWUNZaXozdVpjOWNVUXVuVmREbVFLdnQzNG9wUCtD?=
 =?utf-8?B?NWMwOC8rR2hqZStaZVB5WW13L3UwejcrcmNOcVh6Z3grTkJtQzV3TiswQVMv?=
 =?utf-8?B?b09wYUp2SStIRWZTYWEvTDdSZUpzTXhCSUE3eGFTSlhGWUhRTmVxUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4a2a1d-d40a-4ea7-85a0-08de70858462
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 13:39:48.9451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: In9qOJJvwwiLUEE+BixqpmrTVXJ6LV+YrsR1ITaUhd+Jqbasq39mQMXqwJSwaJykmnC6dH87/N8CP2i7gxGKuz40/UyjiTGX3YuUxUJaPvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:george.dunlap@citrix.com,m:tim@xen.org,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 28E78167E76
X-Rspamd-Action: no action

On 16/05/2023 8:37 am, Jan Beulich wrote:
> validate_guest_pt_write(), by calling sh_validate_guest_entry(), already
> guarantees the needed update of log-dirty information. Move the
> operation into the sole code path needing it (when SHOPT_SKIP_VERIFY is
> enabled), making clear that only one such call is needed.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

