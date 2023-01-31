Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EC86828EC
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 10:34:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487480.755124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMn27-0000RW-1V; Tue, 31 Jan 2023 09:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487480.755124; Tue, 31 Jan 2023 09:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMn26-0000Po-UG; Tue, 31 Jan 2023 09:34:30 +0000
Received: by outflank-mailman (input) for mailman id 487480;
 Tue, 31 Jan 2023 09:34:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMn25-0000Pi-Ii
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 09:34:29 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2041.outbound.protection.outlook.com [40.107.241.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75146907-a14a-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 10:34:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8478.eurprd04.prod.outlook.com (2603:10a6:10:2c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 09:34:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:34:26 +0000
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
X-Inumbo-ID: 75146907-a14a-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODIHzNUxNeNKibGytfkT/fU5kSu6KsFYiimQC+qA0LY7TuAx7j7eisWScaMcKJwQb+HxF9vdgTKZaBehz/8IAWol1XontBPMyjOb2gl5GfkGBSEnrt4eo2Zs84PteEZjWctPzojn7TY4kT8rz423JL98Ix4Vaa30Fwigiy0UcVgK4+GdtWEM0B1u/CaPMCcOwpF9vPOTk2SgBpPgVeMP91W7JqesyDCt0+VrdCEgmw7wEeLAdPTw6jQwJYw5Kvh4989vEfnMpP0DMDeGQsOANjKO4jpogga12i224Jk5SymU7siR5Uh3sT3xnpLyvGBhxE5lGxC8HZpt8K2u2kZ8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+PlCKXgtw66fgXDbozMa0qLuW7sUDRE/I1XW0+CKPg=;
 b=VsMFxG4zcga4qWvn97xvr7hqqfi3GPBQPtP2bGfwPSmU/LE+jGbRXwPA3xXQFHcJjlPECJKnpgEwqMuswlAp/BXWBPzgpQY7HGhOhZfQNeGhs2Sa/u3r3k5t9riRIpZoJrbcGTBA+EOJsaoM3SosZriNF3yXoh9W2yzGkmg+n7M1msmAw86VY5hHM/vh7KcHtuH1a4XvubK4YF/6ESWc4I2FdyMOGHXwVF3bguOr1eqo/QdqZBxXqgpKMzIEiwup+VDJD/4m5n06je0K9jPFQYES7nqrYqpftSV1ohFOZOoF/V9VxptE028WOH74B1e48ntGX02PmGuvzOEYG5Q9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+PlCKXgtw66fgXDbozMa0qLuW7sUDRE/I1XW0+CKPg=;
 b=JIq1topNSojTmk3AEVNArAD5+BIfjC10WZgDaqKMBOZvqmWFpCMRjJ//appJ4NA3sMr4O0OoDLDGaXHFfX/OMMdtmPLqHuL0Amp7xiz31PMNy5SCLqoPPZlrp+LO2+44b/dwGxKwqrsoCbZAPt6sPqxqp+9D6aoTEKHD9eM2B+iDG2XTjlJTJ1iQLM3uiBMIb3g3murtFMjvTRqTA1eIN9JjDFDp9M26XrHfsoZ1gLidi1a8Q5SVLOtXHLo/l0ZNfkRb5KNcvFJVFWM0zV8xpBk5HxptOA9FIQ9Mf8bWMgrp+ZQHSqRM1Bmq7sV3M6QWVTxivY9m5WGuSrUppgw6dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9dc52d71-4148-0c16-d153-3ebcd1a9c754@suse.com>
Date: Tue, 31 Jan 2023 10:34:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/common: rwlock: Constify the parameter of
 _rw_is{,_write}_locked()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230130182858.86886-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230130182858.86886-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: da0cab7e-2aee-405f-8b01-08db036e5821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5+3HFUygyOI/zXDQT7zabEmUFYLbE1z5aa8htR9mom/P1TA5tVjF6LC9pAurtnoP23WAu6PV+w0UZzKSgeTDHFmhOXjkANlAOHtj4hLExJsa8kzxz5PzPExzC2tsmNBEax0E5sjd3sfvWcmcThf+4cx7dqe7YJjRcJxIA8SHqL5Gd2/zR/DPsgFWUU1+vDorAH+uoTuEdC3e6tQdcLVitClviuwHn4T/vy2KIWNl+N9mWKSAqWx0Qdxvsr2l2Ox7ADgHtOzIOy/Km1rbMG/mq/d+4IS1rrcM16YqCGfSaOS9GDzerrTEUhgTp8QY6NrDin4AE2BssSE45t7bIXsB/4Jj239/IxZ2mRPXNXxXG6hooz5NBVm6o2bi6NdgsgUICBf2Y7Im6wTw6CtFHA4VKE2HMR1b1w6BxBNg0LWcJiitelYGXpm/7EZ3M0JPVO/Xp5izKU0nVPQRZ9Cd+y8KYIEGmmQzaxrmJ09gDqW/clFDvODhWWh/ICBH1j2DxV+idzNwbb53JUW2YREebwssVTHFPrOdVXZpREkFx34mmF0H9EbgKEvB4oOL2Wh3BeCnpQ4xdtWxeEokqCRH+QaFYMbXimIZk0rq4B3rTXn1W+1CHnIab4qK221Jsd4sG2ixQHYpc91Ehdw7+00KWBJTtC01pFsUNOVrARCaG7UF1xYAqeN3k9A4vF8vC0bqzLebFpeQv3kCPaRlsmKdVYyCAnsOpA69h21pbCxu4fd2wnw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199018)(4326008)(6916009)(66556008)(66946007)(66476007)(41300700001)(8936002)(8676002)(83380400001)(31686004)(2616005)(6506007)(36756003)(53546011)(54906003)(316002)(31696002)(5660300002)(6512007)(6486002)(186003)(4744005)(2906002)(26005)(86362001)(38100700002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUtiWWpyZnFoVmovOFFadlI3ZGNxUjZobFYrdmlvMmJZeXhNdFV4MWdGWUhV?=
 =?utf-8?B?OFdyUHhkaW1BMUhFczJPYityMWpTL0R4YmNiVHVZNlNheU1mYm5mVlZ2UjBE?=
 =?utf-8?B?S2cra00wY0FCc0JkbHdtN1ZXYWxuUnRiektsOUU1eUZ4ZEE2ZFdxN1R6Z2Fv?=
 =?utf-8?B?MmNqZEd5aVIxS2k2VWhJcVZMd1pCODRmRHpLM0RoS2hUYk5IWGtMbURkSUly?=
 =?utf-8?B?NCthQ1BvcTBPejVJNm8yVHJ2MG9MRGc0TWdVOVIvTW5pOTk4NXIxSmlRZnk3?=
 =?utf-8?B?dit3UmhDSG4zM1dVMVFsSmhuMGNrYkRnSXVNTTBqVDl2bWVHdnRWK09zelJi?=
 =?utf-8?B?V0lrYUdpTkgyU3QxTGVKbW12ZUFJNUFxNkVVRjFxQ2RFTG5vWWMyZ2EzTytX?=
 =?utf-8?B?b2dCQzMzaXMxYXl3Y0RTRXpITFNaTDBrU0xzK01VVXovUGVVek1valEvZ2Zp?=
 =?utf-8?B?aUFjbStsT1pSQ0psSG11Qkd3NS9ocmxuWXJLRDl6bXd3aTB4MVNoUSt3S1Jr?=
 =?utf-8?B?ek9vNUFETE1YR0tvQnZBTDFSVFp0bnFtL3gzdVN1L2NwWHV4RjA4cVRtYmtE?=
 =?utf-8?B?SG5tVnRZZUhaL3dxMk1IaHJpbWpGYzRBZnRmSm9xOXFrcVpnS0w4WEowZ21X?=
 =?utf-8?B?aEVBcnFKRU02YTVKZitUcm92SlNkMTkzU1pmcHNQVGh3aGpoL3dwc2ZJbUk2?=
 =?utf-8?B?ZWNIWFNEbkUyaXZYalpsbGpta0oyRWw5WVJFelJRNlZubE9Pa0VPWFNBM0xL?=
 =?utf-8?B?UzFkU255Y1FDaUw3ZVY0eFdyZEp6SERQMWlUcDQwTW0rdkwvUllLNFNIcmdo?=
 =?utf-8?B?RHZCbzJnUXNDWGNTQ3Rsb0t4aG9CaWVFZUJRL2I1VlorZFlFWDRjZFVXaDVD?=
 =?utf-8?B?OWE5bXV4Sm1BNjIvSVJ3bFFaRUV5cXY5UTY3VEFWWHhhMnQwek1YLzNyVzZN?=
 =?utf-8?B?aXNKUFZkbFpJc3phejBub1VjZGpscjcyY0xKaUR1aW44d2h1dmlmb2k4Sjdy?=
 =?utf-8?B?aDVrMkxjWTY0NVdaTnV0MCsrZk9JTS9kaDY2bTVueXhuY2hOQjRLeTBTbyt5?=
 =?utf-8?B?UTFTVUFmaThWTER3UXVuQWsxSUY3N0tzd2U2WmRFZWxpUjQrNkpFcytyaVNK?=
 =?utf-8?B?NjF1dTdVaXNLWGNHV0Nld0lxTlhmR2ZZK3NiYzJMQktlSXcvWUZicHVEVWhr?=
 =?utf-8?B?eDhvM3l0S0VlUUV3aFI1cE1XeURocHpyay83ZEw0cXVkTHpLeU5IdjZRTlBD?=
 =?utf-8?B?dGZ0QzZwYXo4SlRpcWIwT2RCOEVaUHJzSWcwMTFKbjhsYXFDTzFYVExtK3Nm?=
 =?utf-8?B?VjZaUVBqcjZyV2RUdUxZbFV5dnVFMXl1SEt2REVRQjNnc24yNXYySU1OMG50?=
 =?utf-8?B?eE1BZ041NXdJOFB5Y1cvdmdhOWRHWUpDN3dzQ29Fbm15Sll0dU1kdWtlRFB4?=
 =?utf-8?B?cHJRUjRPMlkxUk9LRXowZkdmSVZyOGdSUzY2VnF0V3F2ZDBneThpNkFuVFBP?=
 =?utf-8?B?WTBpelZpRDNUQTR2QXlQdW9LdjNZamJheE1rVEFudlI2MnpiN3JMbVFHZDZG?=
 =?utf-8?B?NExDOGdReFNNMTJtSzNTc0h4UmtsMi9YeXhmQkxsUXV6TGYyZkVzUmpHc1VF?=
 =?utf-8?B?QUg2SjczWmNPSzFXZzRaS2hidWF5c09CWEZpNnhDMDNEd3NSbU80N1dBOXBC?=
 =?utf-8?B?RVdNWkZyQWU4ZmdjK0NXeWhzZkFWc2phQXF5STk4a2F5TFNoTHhvd1h1Rm5l?=
 =?utf-8?B?ZStkV1lYNWFhS29laWFTVkdiTnNOa0JobTBTRHZFNDdmand4V0dNeHBKYVA5?=
 =?utf-8?B?R0oyRmlac1ZqN0tnU1ZnTG5KbUgrSlJCb2E0RWZDMk1rV3RpQm44VHhHRlB1?=
 =?utf-8?B?RE04UVBuaUJoTEFxRWxHUGFaSDdNZ2FuV21CQjllaHpRYW5NL2FOTXE0VzQz?=
 =?utf-8?B?QmZucThuUmJ2by9uZDFocTFrSFFxdWdlZCtkZ05SaC9KRWxhcDhrbXNnTUhQ?=
 =?utf-8?B?OW1ReDJ3dVA4d1h5QzhDb0k2YVU5NDhpRlJ1OHByWVR3bDYwakJ0UVU0cjZM?=
 =?utf-8?B?UEh5OHVDK0FCemNQQmJ2VGJIaURZM2Z6blpKejRtTDRyT3Q0bzArQVB3MW1O?=
 =?utf-8?Q?QCDcmfghNXqtzN5beuL8p4snm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da0cab7e-2aee-405f-8b01-08db036e5821
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:34:26.5279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hhco2Uk3YsNVV9Tqlp27Bsp+2A5QHPCiKEg53cR1iumQSrV86FpjEYGF1HpaonQ+O/TxgQMDBI2WU48GceYCEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8478

On 30.01.2023 19:28, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The lock is not meant to be modified by _rw_is{,_write}_locked(). So
> constify it.
> 
> This is helpful to be able to assert if the lock is taken when the
> underlying structure is const.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
(maybe also Requested-by)

Thanks for doing this on top of the spinlock change.

Jan

