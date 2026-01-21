Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOEVOHjycGk+awAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:36:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8095946E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 16:36:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209929.1521808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viaFC-0001kS-Hz; Wed, 21 Jan 2026 15:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209929.1521808; Wed, 21 Jan 2026 15:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viaFC-0001ic-EJ; Wed, 21 Jan 2026 15:35:42 +0000
Received: by outflank-mailman (input) for mailman id 1209929;
 Wed, 21 Jan 2026 15:35:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GdGN=72=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1viaFB-0001iW-86
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 15:35:41 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5c1711d-f6de-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 16:35:39 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB8352.namprd03.prod.outlook.com (2603:10b6:806:466::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 15:35:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 15:35:35 +0000
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
X-Inumbo-ID: d5c1711d-f6de-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htBiYI/ER1F0xunbZzb1Tkn4wBzO1uQ/m7pfUn01484tE+J+Olyfi+Nrx5qo4LH+uEDHX4bE3ImckFWJWQPz/9Y3apDQOuzgI/hIcD82zu4pQ1eIYlz8D1CMcsEfC+X6ePwW6JfqUbkcJDGCZa0Yfu+3juEvJUfOC7hO8RMVoAPL7nonNBQtttlKDUT1MtOaN73+LPF38wSNlpGPmblLMjc9H/cqoKBe/Xfu5QMBbcn9H3DW3Il4P8dCkNcWwpxWCjo37VHKGEtsncqwsQaeUZNVAdT75u6ChULn/MxIz3cpxnaDvPEAT/driWQ7GhsgIDPTnPQTQ5mebul4od6kXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRoU1iEdKjIswk6mIvdZfWB7lGau8bj22VbTsylW6mY=;
 b=rmv3BjovLBFDhYJUQ0PRL7XBs89oiCH61Ln31GoQsFI/mVOe+OzBkWE1FMFraJoOqjnDdc3r8VaSk5VQSbfS34wBGLBsBhBEzI9Akx516MYXnHI7qM2P+9sc73Ccd43ZzOOQXPu3knsOKWY+wyAnjuBLvnHjbjFzo7L6DVr2NpqIPTIJkQs1bU63hiZlb9we4ROZpArgu3YRVuPv5rMFZ4fxmhCmNpPYJJCihvrLTuRr0+xQQOyncI0ckrt5dImAL8w+m3cFVgecSkYyfnjPzgDedIrNVEiqpvI/xDKkmvvR66GjwP8MncypsyT3pw5ig+hVyms12YPt0OrMQiAu5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRoU1iEdKjIswk6mIvdZfWB7lGau8bj22VbTsylW6mY=;
 b=gl34fVAk4AdmxabzYU8WZrSiBLYdhmr+qYKofQXZASyL3xyVv/PU5h/axEyHi02OoqqADhsZ75iaUrtGBOy7gjMkuRg+c9A20mkF8o46W+ut5NSImILK9Tp5/qYk+w1hS8yPfWqpoci4HU2Fx99dhrAqxq08zXeKFvOlK/UWmTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7fbc3acf-b878-4a82-bc08-89b91fb9aca6@citrix.com>
Date: Wed, 21 Jan 2026 15:35:32 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 2/3] x86/svm: Intercept Bus Locks for HVM guests
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260121142857.39069-1-alejandro.garciavallejo@amd.com>
 <20260121142857.39069-3-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260121142857.39069-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0043.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbfa8da-f453-4267-d379-08de5902b8be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d25YZEZnb2J4RjYrMHB2NWJ1WmZXc3VnM0NiazFnVkI2V1NtT0Q5eDkxdzgx?=
 =?utf-8?B?TXRRVXdaTUFzL21kdWNLUmRCK0ZIWnlQQXZ1UldyNWtjTlI5SE9COXJmMkFj?=
 =?utf-8?B?WTdCQ1plRjJubkgxRy9KTG1hYUFjTTJKVlFyc1pJeXo3QXVwOG5KUjEvSnNY?=
 =?utf-8?B?ejVWcjZJTzFnbVVJQXdKUWxaR0tQcUFTd1FGYzNieTVwaTdlMWNmUHRmamJu?=
 =?utf-8?B?TGMva2orc1hEVSs1VXh1Y0ZESEduNXZhTHpUNFVPb0cvYnRLdFd4SjRxMjEx?=
 =?utf-8?B?N2tMcThZTU9IMlF2MnM0cU1VVmVveGpoOExGTU82TzJZNUViaU5yOElvYjVS?=
 =?utf-8?B?NGw5NEZ1eTdnWUdiM0Nyemh1WGtRaTRqbVNPdkszc1BDVkdQY2tJamVHOXc0?=
 =?utf-8?B?OE9adWZ2ZDNuOVliNjgzd2ZiaXQxN21ZdXA2aHExU2tSa2NpRnYzRVBrWFY0?=
 =?utf-8?B?aWhYeFh2d1AzeXJMVHI0NzlLeENqc3dHVzU2NHFiQVJzcVVjSzNTYWovSmhv?=
 =?utf-8?B?MzA2Ri91WVJsTFk1SFJic2R1eElObDZ6OUYwMEw3ZzZJRThMZjIrU0o1Q0hz?=
 =?utf-8?B?cDFiN0diRUVXOVRoYVc5cHdUVUl6bU95VXoxZ2tONEdhTXFRMlpLcjlZT0hp?=
 =?utf-8?B?SGpBN3VsQktXY2tIRDJjMFkxeXJmb01INGpHQTl4THBDeDRneWhXK2NJZzY1?=
 =?utf-8?B?RTRyVkNBU1h1dm1kVzc4NkxSSFhpd25WeitoRzJoa3NKenNkQXNKdUZ1cDVK?=
 =?utf-8?B?b0xZUUdBK081KzZBcGRWMmV1d1g1Q2NVb1lOQmZyMUU1T1FpNlpkc2wxeHQ2?=
 =?utf-8?B?YUZXcWcrb0VTak9hRjlUb0lmMGgwaG9ON3RXSGp6T2Q4R3dwQmFFM0o0RUd6?=
 =?utf-8?B?RHRLbngxdmNiU2ZPdTZCUGhFQk5ZWFZMb1NTMStFN1k4Y3VDY0hpQWxCZlNy?=
 =?utf-8?B?cGw5TVhGTXV3dS9DZGxBajlBSXptN050T3k4VENzNEtWSnlyVmFhb0hvRTJC?=
 =?utf-8?B?emUrMUZVZlZ3NStiNkNTUEc1UzYvOFYyUE5WdEhaazRmblhpZUpkNW1KSENP?=
 =?utf-8?B?ZTcxNDh2eCtlUEQ4dmpsVGxFYzI1MWdDc0hyRkExYWFVcUdwZlRlYTFaNXY4?=
 =?utf-8?B?VWE4VlhIK1BJWW9LcU1Hd2VsY09tZkFCaWU3RWl1TERTdFhVeXo2bml3amZS?=
 =?utf-8?B?Wmp5ODVpR3NqdWl3WmdmdTBDamd0VThKdDZqQXB0eHlpQ1hMMElLeHlyZ1VH?=
 =?utf-8?B?Myt1UFpQYlBWNzgzZG5QUDNTZzl2MkVKWk9XV1RCejcyU0lFTHM3MWZTQVhj?=
 =?utf-8?B?b0kzSGl4TUo5bjRGc0tCTmk0bExPZkdQMHNBYmcyKzJpM0lMWXIxMW41MjdQ?=
 =?utf-8?B?OTlvSmdZcFpoU2NrRXppOU00T2JlVnJYTG9udmZFT2gwQUczOVFFaVF2ekRJ?=
 =?utf-8?B?R3RCdVJ0ZlRIZmZTbGpPRUhaUEZqQU9RY1BoczVyeUdWWURtbFRoVDJnRi9W?=
 =?utf-8?B?WTZpeXJMR0NkRmRBUFBYb2RqNnNWR0xVMTZuNEI5bkNvRUlxa3U1YUw4SW9Y?=
 =?utf-8?B?T2h3ZEpqVSt5UjEzbkQ3RWpvM1VIcXNVQkliaUw5M0lIbUE0VEwyS3dpTis0?=
 =?utf-8?B?RkNjcHIyQ1BQQWIxa2JSNWI3aVlYMG5QMzQzbmd0WFk5RVpnRWFCeWZtVnF2?=
 =?utf-8?B?R0ZDQ09CQ1EwdEE3ZWNXL3Fjek5veVZQLy9PaVNaMGRrbmNqRlY2d3huODhV?=
 =?utf-8?B?dnQzQjJyTE9naGV3OWxTYlVVTWlqdkJYb3JBeC9RWDQ5bG51dFVaVG9DcTF5?=
 =?utf-8?B?VlQrTC9aZjVVNGlvelpzRkUyK2lQVjRwL1V4c2grTjhZcTlrN0luVjRUaHpW?=
 =?utf-8?B?VWVOV2dlY3hSblVzdlNaUzNrM1d2eUJybzh3VE45V3kzWXl0bmZVTkdnRXd3?=
 =?utf-8?B?VE1mczI1WGZMYTJZdmd1dFRORUNHWW5jUmJnY1hwOUdlV1V2VzNRQ0RuQk9M?=
 =?utf-8?B?Smt3Y0taWWxwcjFEK3c4TFJhTE9IQVhFakRJNkNhS3A0RFhoWkpUTlNkaTVB?=
 =?utf-8?B?QXdLaDRlZUFBRTlRZEVucVl5TVYzZGVYdkcxYlY1dlJSYkg0OXBZUjFXWWo1?=
 =?utf-8?Q?jwe8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGJZRFpuSnZTYWxBT0tjd0ZJQzM0ci80RjZBUXg4TERsREIxOWlsaUR0dWdD?=
 =?utf-8?B?cHFLUzhkdStnSUFwNnlUOWVKbzdZUTdEZkZBYVJFNmZnRTVRbEJOZENxQ0pp?=
 =?utf-8?B?NzMrcVVkTnNHUUltc1FBUGpUQUluWG5obnhVUzZSRnlpbzI1eDh6REk2S1FZ?=
 =?utf-8?B?SHVmSG10RHRNcWw4dFpZU0d5d3BHVzU5b3IraWFBUXgwaERTSTF4ZHM3SnJy?=
 =?utf-8?B?dXp5L1ZhZGNYSDJ6dlBYOVBFb3E0dTYvU1NUYnVoVjBUZEQ3aHhUUXozcGNn?=
 =?utf-8?B?M2lkSHVVaERoRHE4cDU1VW1KR1VGOFJ5Z1dWZmxBWG9ON1R1elcvL3UvN1hj?=
 =?utf-8?B?ZmY0OU92OVUyYmFaTjBPUFBGS3JXS0lOdWwrdC9rTzBONVVEQXVEenZ5TWVU?=
 =?utf-8?B?NGRGakJRNk9KaExVMjZpbWpyZnYwckhQWUNWMlV6WjcwdElDZUpEZktqSUJN?=
 =?utf-8?B?L1hyeW9SWmpkTDJqQWFTdDJ0NDBzK3RWWm5wdUxUOC9Ydy9xUWRwK1Jyb1BQ?=
 =?utf-8?B?N043M3ByeS9aQlRrMFlwS2V0UlJwcm5sbklFVDJEOGJwMHFEdWl4YWVVWVhz?=
 =?utf-8?B?d3ZLUGg5MTBLeHI2R2RoL3pNYWNFVDAyanZsNzhtRHJsMUs3b3FRWFpBRTkx?=
 =?utf-8?B?Y0p2MWc5R29MMzhiQWM4Mjh2SVVqOGxSSVRxVFhFZHBiR05BWkpxeENkQ00x?=
 =?utf-8?B?eWF3dnRkMmUrQTJUZXJHV2pEV05NcXRsUG8zMWZIVXROUTViWmNva2xZSDFT?=
 =?utf-8?B?MDM5TVNsRUVvbGc3Y1BYUHd2UDVvV0p2MWVDL1hSNUxMcHIwa2JablVMaERj?=
 =?utf-8?B?VFVWdFNuaURLZ3BCcTBVc0ovOEdDSmJuTkpqdUJNV2QzOUluQ3dZM2tzOU1M?=
 =?utf-8?B?UDMxaHA2bTZYekZRT1BoT1B1N1VuQnJjMkt6cWc5eUdjeEhFWCtUd2hxOStr?=
 =?utf-8?B?TnRtRG5yMXlWa3NySy9Ka01xL1J5ajRBZ2RFVTlBckRta0JYa29kYVRKYjhj?=
 =?utf-8?B?VDlTMXdaeVkxYk9PdHcrTDQ3cTZDQUJYdWRmWFhzTWtlbUxRdW1uTUNDaVZs?=
 =?utf-8?B?SXpOYThObkIyRmR1ZWdJemFLZlhSQmYxQTJmdWlSa2xGSU1yTno0dHVvWjg4?=
 =?utf-8?B?Z3VGWlNGQTZKZExwMWpLclMxdXF4NGVRMFJBczlja1BsWitMamtid00wTFFX?=
 =?utf-8?B?UkM4d2EwOFIrVzRQRTdXeXJFeDJFMTVPclNpMmtnM2JRbGdtUi94WWtMa2Fr?=
 =?utf-8?B?blJSZG5qRVhXVVovVWxSaVE3Wko2cndIRXBiUVRrNW1pUXVjTHJsdEl4NUJR?=
 =?utf-8?B?UGhabEQwNTIyVzNnQnhDRTlKVC9MNlJ5UnRFZXJCYWJrVE1JV2o0cEVnMmtk?=
 =?utf-8?B?VTNPZkUrL2hieGVNVmJ6RU45TzByallPR0lzTGVmdjJLVCtub3Q4K1ZOcysv?=
 =?utf-8?B?VXN1NlVUOVhNV0xmaG1sYUszeXBHWmtMTytjUURFM3RQTzJLT1VRUWprUjBm?=
 =?utf-8?B?UW1NVDYwUlhlV1BtWm1UOHhtUmhDNEpSQWxJcjlxN2xtbWpuN1RiSVN2R3Bl?=
 =?utf-8?B?QjRna0t1YnFvZi9NWDNEci9EbzJySjVvdWdIOFpOQWVyMzNuVHhsYVBzaUd6?=
 =?utf-8?B?K0pZdXdTN2puMTBQay8waXlYdUorcERMdUR0R2F6bHJhYS8xT0d1Mys3Slk2?=
 =?utf-8?B?Q2FsTzNoa2Y4SW9nVCtMclJWQ3RqVEZ6UmpkU2p5b3ZnQ09kaGpCY2E2NzdG?=
 =?utf-8?B?ZzRlUUFMSXUrV1VoNjQ3Z1VJR1BteUlJTmlSYVNUY3BEd2FiSG5QZCtDN3dF?=
 =?utf-8?B?SElRcXRUVGNBTGpiSk1ZajlpT1NJakJ3SlhZenptOWtROG1uNFdCV2swazJM?=
 =?utf-8?B?NjArUWRlMVRhVU8yQ1FEdkpSTWVPVHVkd2l3dWgyQjRrTENWSzdEZkQzd1V1?=
 =?utf-8?B?bFVIU2Rheit0YTk1T1duOTdXSWxnczkybEM2ZWVqbG5DMXFSQTBWcnptWmhZ?=
 =?utf-8?B?cFVwRWR6aVBYVTlISEpnMFV3b3pkcU16TktocHZ0NmN1S2ZDb2J6VlVBVGJP?=
 =?utf-8?B?SDk4eDkwMHc5NW1qYkFCWHlocVh2bVloK0wrd3libUc2Vml1azVLRS9uOTZ4?=
 =?utf-8?B?QnpnQ3BiNnRseU00WWtNOHpham9wc2IrYk9CVk9udzZXUUFhSENlY2NlWmUr?=
 =?utf-8?B?d0MxUDc1anZ0L3NSUjFmdDkvK0Y4N1NadnUzT1F6TUxnbGQ3eTJSY0x3VFBn?=
 =?utf-8?B?T1dNT1dYSkVvWExEVFAwU2tvUjN0NTJ1cW5HVGZST0E5dmdXL3NHc0ZqaEsx?=
 =?utf-8?B?Uit1czRueHl3VkdqU3gxVkh0RFNYcTRpYlgvRHE3KzBJWlpRV2RXTW9PclZi?=
 =?utf-8?Q?DeLPpNEG0WsmoQgs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbfa8da-f453-4267-d379-08de5902b8be
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:35:35.8240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1T6ZqqLlK93fdQMuV2VO+XVheEb0lM9W6k74+Wq+yYCBHsHd3ugHKDHBAgmNt5HstVSK9HHnwY/5jfeJpqIo6JeNbd1YmwwfYc3EQ7hjPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8352
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4C8095946E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/01/2026 2:28 pm, Alejandro Vallejo wrote:
> Configure the Bus Lock intercept when supported by the host.

"which is available on Zen4 and later".

(I think ?)


> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 5d23603fc1..abda5a9063 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2524,6 +2524,7 @@ const struct hvm_function_table * __init start_svm(void)
>      P(cpu_has_tsc_ratio, "TSC Rate MSR");
>      P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
>      P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
> +    P(cpu_has_svm_bus_lock, "BusLock-Intercept Filter");

"Bus Lock Filter".  The Intercept part isn't terribly useful.

>  #undef P
>  
>      if ( !printed )
> @@ -3087,6 +3088,11 @@ void asmlinkage svm_vmexit_handler(void)
>          break;
>      }
>  
> +    case VMEXIT_BUS_LOCK:
> +        perfc_incr(buslock);
> +        vmcb->bus_lock_count = 1;
> +        break;

This needs an explanation of the behaviour.

/* This is a fault and blocked the Bus Lock inducing action.  We're only
interested in rate limiting the guest, so credit it one "lock" in order
to re-execute the instruction. */

> +
>      default:
>      unexpected_exit_type:
>          gprintk(XENLOG_ERR, "Unexpected vmexit: reason %#"PRIx64", "
> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> index cbee10d046..15223a693e 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -66,6 +66,9 @@ static int construct_vmcb(struct vcpu *v)
>          GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
>          GENERAL2_INTERCEPT_RDPRU;
>  
> +    if ( cpu_has_svm_bus_lock )
> +        vmcb->_general3_intercepts |= GENERAL3_INTERCEPT_BUS_LOCK;
> +

This wants a justification for why it's unconditional.  Something like:

/* Well behaved logic shouldn't ever Bus Lock, but we care about rate
limiting buggy/malicious cases. */


>      /* Intercept all debug-register writes. */
>      vmcb->_dr_intercepts = ~0u;
>  
> diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
> index 231f9b1b06..68cf5eaf0b 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -68,7 +68,7 @@ enum GenericIntercept2bits
>  /* general 3 intercepts */
>  enum GenericIntercept3bits
>  {
> -    GENERAL3_INTERCEPT_BUS_LOCK_THRESH = 1 << 5,
> +    GENERAL3_INTERCEPT_BUS_LOCK = 1 << 5,
>  };
>  
>  /* control register intercepts */
> @@ -497,7 +497,7 @@ struct vmcb_struct {
>      u8  guest_ins_len;          /* offset 0xD0 */
>      u8  guest_ins[15];          /* offset 0xD1 */
>      u64 res10a[8];              /* offset 0xE0 */
> -    u16 bus_lock_thresh;        /* offset 0x120 */
> +    u16 bus_lock_count;         /* offset 0x120 */
>      u16 res10b[3];              /* offset 0x122 */
>      u64 res10c[91];             /* offset 0x128 pad to save area */
>  

Both of these hunks want moving into the prior patch, which resolves one
of my concerns there.

All can be fixed on commit.

~Andrew

