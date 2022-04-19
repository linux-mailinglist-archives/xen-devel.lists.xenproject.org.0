Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D527A5070D8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 16:42:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308212.523840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngp3G-0007XA-1n; Tue, 19 Apr 2022 14:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308212.523840; Tue, 19 Apr 2022 14:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngp3F-0007UT-V6; Tue, 19 Apr 2022 14:41:57 +0000
Received: by outflank-mailman (input) for mailman id 308212;
 Tue, 19 Apr 2022 14:41:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngp3E-0007Sd-G9
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 14:41:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8a47346-bfee-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 16:41:50 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-bPgPPefyNSamYu_xie2HPQ-1; Tue, 19 Apr 2022 16:41:53 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR0402MB3877.eurprd04.prod.outlook.com (2603:10a6:209:1d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 14:41:48 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 14:41:48 +0000
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
X-Inumbo-ID: d8a47346-bfee-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650379314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmelHo0xMZYMjkYdRuVUuqugozkzocb33PhVnrTykgE=;
	b=bEVjOjCa2inMXZbaAkb17FLz4V/eo6Iy63+AILxGzcw0S/LjFRW93uyIqgcs0H618Hy1sD
	sjk/OyQ57DbVxDSIiJltHlwL1cVBzsXqso3r8XphzJwSTXQA06D1PKzN4OHZBAtHFLeIsa
	wGs0WTivBS/2VmgoxOuW+HGrQEjnXfU=
X-MC-Unique: bPgPPefyNSamYu_xie2HPQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pp8qp4lbb6G9rXK3IhEb8CC4gNvKdEYOU+iLI/jIO0h+Rl38vR8+9zzMzGXDWMp3lBA2yK2ca5Kvu8gTfR+PRVCr1ful1MbqhKppd03CUEemWXdcH2iXWC2+TiA0+OfNhyblC2fotkhK5qBSE3wfYsA3H46IeOPAA7UZjNDJrUVZkYTdMQnb/SyrK+F0bip5wYXXrUPPd93af5PW52IBh/+vwT4Q9RnsxQjzvpO0HDie7LQtMMNomEPbnhlD1xtMfZTAI4XCSMhpFPhSpP9gZ87PFjxAfK4TlVQWFtosvXA+7d+4mzmieBqd7L3Q4Yai4BfeA9zFmCRVYYIygzY6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmelHo0xMZYMjkYdRuVUuqugozkzocb33PhVnrTykgE=;
 b=F1Dir4cU+cbS/9BsS6UqefrLNrjwi7zcPu29ifIsozgLTsOTCyO76H6SK+nhAKKmWdoNhPn+xvH73/rdVvDBzljngkgjbGVEu4+6t3UfBDIUIekWwJmHY5Ae1EMwwYeGG+hNJb7YfveGDbKdlDA1yVUfoShUysuQFjJk+toAvj+h8WMydfFM/lKGCsJ8pF6FEqvxMg3ejF0YWn5l4B/9VVZyRjoglX+FyGR91gJHzmC81VN1e4aodZbgT7/qJVsgRdlW9BhOhO1UzJAu2HOTqrrdxlywHwb9cDEll+LqUsk8HM6LObqfqUHqU0Qk4PK988TXi7t40pnA3yyJyPxcPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a78b37eb-410c-8764-9225-8685bf231543@suse.com>
Date: Tue, 19 Apr 2022 16:41:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 3/3] xen/iommu: cleanup iommu related domctl handling
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220419135254.21729-1-jgross@suse.com>
 <20220419135254.21729-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220419135254.21729-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e878e82-2376-48df-2625-08da2212bba7
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3877:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB38774977A8D31DA2A4846DA3B3F29@AM6PR0402MB3877.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6scTr704M2qdKNpfsS4a7oUCDIdJJktVixJX+YWeBLQupA5buhUYyDi6fkenmwUALue0Djig31lkD0kUalWHQd96BFuTvK6sWvmGMSeMSEhh6EN5KJR2BYodfWlIY4D+HwiJ3qCnRN2+AHhy4Zi0DnHWxMWj/jRIQSxyYTViAsWXdJeo2p+AUGiOflN6w2hUgpm/e87TyAhiYkhh4xtxoSMgao0Ef8QvOAhAop7e4aL9ESapQ8mQQqIw5BIGQTr1Z2YpZCx6GqaNYLNuKaDAzyOxbWytazO0LyixA++od+e3lFIXDXsVHNeBG1+d0rqn6uDhGl7iguhUvMoTdr3QM9CK15DsMFHxNzYEkiVmmcpWCRhTBEv4ZaEO9OGMZ9Tf3tm4PEB0KQMgmvl0sErTF8MM+FwtYDe5ObMseLMX1rhjdaASu6K5lTpG21ZJzdP2asJqmEkVw5fFgXAMEVEQjc0+4+lhODi7lMwNpl8F3rdtWlUEEGGfhI9Ef2LPlxEAHgwYFfMpMeGfMnai/deEGmP0DZ5keiuoxFdSxj0p5AUtljECKw5Ve7/fj/Advcdv5k9ZgLaoCAT3sDXhS+uP7FkwY1dPcHCHWmGcVAkn5SgKFOcLcFlAFvUytqvAtm1ngHjSIv1RUtTOO860rJ2h1qhrriJBD3FpHtf9m+57ySJacIA1j3i1IZPGaBCq/bxU0mzNgaUqTWGUNlQrNfDP5jkOXZCL3BKCUJuDkjCJ/gjq3v+68fD/DS1VAt+mocNQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31686004)(31696002)(4326008)(6862004)(66476007)(6512007)(66946007)(66556008)(36756003)(6636002)(8676002)(53546011)(6666004)(186003)(4744005)(54906003)(316002)(26005)(6486002)(38100700002)(2616005)(5660300002)(508600001)(37006003)(8936002)(6506007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cG1ualBkSi9Jdjc1dWZPejJrOEhvSzNHdllGNnJKWldNeEg4cFZFdVBtUEYv?=
 =?utf-8?B?MERDRWR0YS9xS082c3o4b2J6aEpUOWVrY1ZNYitFK2N5RTV4N2R2OE1RRUtQ?=
 =?utf-8?B?WEtXZzNkL2hxNHlRZEdkVDMxVWRRc2RQRWg5eVVWYjBOUVRGcEkrTjZSVFFQ?=
 =?utf-8?B?SGkzOE5lYXFsMXdUZjdYbW9Fdjl6T2lCcmFianp3bEdHQWJtd2pLVVlYc0RW?=
 =?utf-8?B?Wk9qUHBSOWo4Y00rNFY5K05vSkIxMnF0TlBVWEF5TGZQRks1SEhVSW00bWU1?=
 =?utf-8?B?c3dMNlpuQ0ZacEFiWDR5SHd1UzBmbWhzb0pxT1FyZCtDZTliMGZDNFNvdDds?=
 =?utf-8?B?cFhmS0t5SEQwbFdDUzRyUWNEV3Z2NFJKcVo5NWUxTXJ1SXVMeFVZMENvK3JH?=
 =?utf-8?B?Vm1veEVGLzh3ZzVsMUQwa201VkxybGQ0M1pRM1ZIcHRuOUVrM05yc1hVSWVE?=
 =?utf-8?B?OGFCWEJ0RjFiNGRucko0SnBsVEREbmJQM3Y4a0dmYWJFKzBlcEx3NlptRnhs?=
 =?utf-8?B?a1hBR1FPbWVCVDF1UzRjaWw5L29nSklveTNVaEtSNm1Mdm5OZStYdlkyU0pC?=
 =?utf-8?B?cVFqYjQwZFkyQU9HbkV0aEdGTTVpT2hTWktLUy9QZmtWVU9mNVFiT1JhNEJK?=
 =?utf-8?B?U0V5SFhkelRnMkJUN3lpR1FWRHE1d1ZKR25PZzNmc2RGUGVpMzcrViszYk43?=
 =?utf-8?B?N1RnR3BSZWFzK3g4UU14NUtoMHVVY09zRWxaaGFpVVNwcGg1S05ROHBJQXJE?=
 =?utf-8?B?WjFyRjlEMVZOSFhpQkRkN2sxcURObEFRaE9aQ2pLTHRNam5EVjFwQWFmUXI2?=
 =?utf-8?B?b1RHTGVDODU0ZGphdjRhMHgraHlQRzdmeHpZZ1JrNVEzRkdTVWUxM1E5c2NL?=
 =?utf-8?B?STkxeGNnbGVBM0VSWWwwUFpXOVlTOS9TQTBReFVuSHlNeFlOMVpFMDkybUpG?=
 =?utf-8?B?blozWmJpYUZ5OW5MMWRHYlNkYUlhRklZTkUzL0hJMkV1YmhiKzdYL3QrTEhr?=
 =?utf-8?B?SWt3dDA1THlFOUM0NjhxdEpKbVVaSEJXY0hLUytDb0FMSk8rZEI1MFFPM3NH?=
 =?utf-8?B?NTJScUZlR3FEcUM3aS9TM1NKUkhGWWgvN0tWa0ljV1V0c1Ivbmc1U2dxSFFC?=
 =?utf-8?B?Y2lNbjh2ZWRBcTlzNFJoOU5oTkVCcU4yRW4zOWJaTWRlUGZZaXdBZDBCQW5R?=
 =?utf-8?B?RUcwZENaMzVRQVBTaGxhek1ncjhNRDczVmdMOVMvaGtzWk5hRFdHVy9MUWtO?=
 =?utf-8?B?aWpGWFh4STM4citab0VFOWg0dWJKRDlnUWpUZDFmaktodkU0NWJSTW1NQU5Q?=
 =?utf-8?B?TEpDUXJjbEVuQ0FkU0RpZ3djZnJ4cXdrS1JncGJNVVB3clJHR2NpbWF5NW1n?=
 =?utf-8?B?d3BEelJDU21veTNjZ3hSMVo2ajk3Wm5OSi9ud2FpZHhBMjlZMjNqYWxTS1hX?=
 =?utf-8?B?eTNSK2dBODNHSnVRTmVHUWRTU29pQk8wLzNab0JsVHNOMGEvK05tR3ByVVJG?=
 =?utf-8?B?R3VrQzh0NzJBd0xBN3Rxay9BSFN4MzBXTHhrNkhaOE05SzR0dzM0a0s2MHEz?=
 =?utf-8?B?QXdnUGNVczdIbUdOeG1UU0xCallBdWNNcWxjcElaRVNiOCtWZGw0a0VjZmxC?=
 =?utf-8?B?Qy9GczIrdWtTTDNSTy9nSnhzZXZKYXZndTFBanl2dU41SHhMSVlNNzA3cWZW?=
 =?utf-8?B?ZTQzUjNXVUZMOWxCQTZCajRhSnpuOXJISWs4OERHeXdINE5CZlBtdlpJYTMr?=
 =?utf-8?B?b29YR05FUDJjaXIrN3g0UVNNZmppUTUrYjFZVTBIMFZpeDRVbnZkK0JTMnR6?=
 =?utf-8?B?d211T3ZKUHc4UExpbjA0L3NxYXJ4MUhlajQ4ZWZMaDkzWHV2RmUyeGxST2Rh?=
 =?utf-8?B?NFVOQm9VNW5uV0JsMzhvQ3pOalk4Wm9vRkdnK0VibEpqd1RDcjhtYk5WcmhL?=
 =?utf-8?B?VjdHTUNpalZKWml6azBYY3ZpUU1tMHdOSC9rRzZYbXM5cXhuVE9MQy9iaVBK?=
 =?utf-8?B?ZmliOFNqaVZySmgwdnk3UVp6U0hMMzNiNTc0QTRiemEvc2JOeEtSaGtsbXNB?=
 =?utf-8?B?SUVqVks4U3JlUnlXd2RPdmd4Ly94bFpPWXlnL3BXdFlka1JqTU1NQVJYNVB3?=
 =?utf-8?B?czRvVC9NMjVSOCt4TXBLemc4d0Q3aTE1WWszZGtQUi83N0xpa3laSXBIQ0NO?=
 =?utf-8?B?a0xBQmNFajRMRGtRVnhiSkQwSHZ1S0pCOEZFZEdEZ3poZnJZK09IcTh0a1dL?=
 =?utf-8?B?Q1REWkNYVVZldVZMNU9RZ09aOVVHSXZqeWNLYWhnb1pBN1kxbUQ4ZE1hTjBU?=
 =?utf-8?B?U21jblY4K29vVzBwd1poUkgzMFpSdVN2NU5leVk4VnFCU0tMMG96dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e878e82-2376-48df-2625-08da2212bba7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 14:41:48.0488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puoLqjFQyygyhJUejzr8Q29cNkFyjsZlS3uRVAhcBMrhg8rfhI4nMX7aNlKjqLovTGsHqwhnEvywZldWVUM25A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3877

On 19.04.2022 15:52, Juergen Gross wrote:
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -871,6 +871,13 @@ long cf_check do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>              copyback = 1;
>          break;
>  
> +    case XEN_DOMCTL_assign_device:
> +    case XEN_DOMCTL_test_assign_device:
> +    case XEN_DOMCTL_deassign_device:
> +    case XEN_DOMCTL_get_device_group:

As said in reply to Andrew, I'm not convinced having these enumerated here
is a good idea. But in any event the whole addition wants framing by
#ifdef CONFIG_HAS_PASSTHROUGH now.

For x86 I wonder whether the adjustment wouldn't allow to drop domctl.c's
including of xen/iommu.h (but perhaps it's included indirectly anyway).

Jan

> +        ret = iommu_do_domctl(op, d, u_domctl);
> +        break;
> +
>      default:
>          ret = arch_do_domctl(op, d, u_domctl);
>          break;


