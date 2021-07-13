Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3253C6B3F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 09:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155042.286349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3CqN-0005Mf-Qv; Tue, 13 Jul 2021 07:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155042.286349; Tue, 13 Jul 2021 07:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3CqN-0005Jl-N5; Tue, 13 Jul 2021 07:28:39 +0000
Received: by outflank-mailman (input) for mailman id 155042;
 Tue, 13 Jul 2021 07:28:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3CqM-0005Jf-TT
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 07:28:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71ec2ccb-c919-4a7d-a4d0-4509fddb9bff;
 Tue, 13 Jul 2021 07:28:37 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-QtPoz5HlPoKmtgsh3yVEmw-1; Tue, 13 Jul 2021 09:28:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 13 Jul
 2021 07:28:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 07:28:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:102:b7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 07:28:32 +0000
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
X-Inumbo-ID: 71ec2ccb-c919-4a7d-a4d0-4509fddb9bff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626161316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SDZRzSsMsHriMl7Ei0wanroOEzhHhSecTryBf7rF50o=;
	b=cKNco1UyovaiH6ODhh2ao4TGOfG1CW8JcD1YXJflqlvmA3acxHifd9p53ylESZaB/nbhvI
	IyCMvfyJOl184YQqvuniVCDMRx5C29VJLy+hbLn65144Hlt8i7bB2ogyTBVV3WLYJVNzl6
	IBTFfgRPDJjPCg2/Y0aodm4LIoYIFsg=
X-MC-Unique: QtPoz5HlPoKmtgsh3yVEmw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRBH4DiZMiLOlI077vPqrdRk4kFc2IcRuXTw2XEepjzUQ7DBhsDFh2obE9VrQc7XjViCln0xrxu3GL4FsqXt4kzhRbZNalp3/hSyEsNc59Kg4f6W3q3uT63IWt4m468lgT/EeJREyGakVNShW8rN/hp90lZTQxoGRaDKOuZO9WVNOkB5Qnq6NZflvt1gwExsFHZSyO3Bp4De07aqk+LlVV6v1eJ+9Y2unfJhE0dn7byV1g8n3ltnrkf4RLO1NX050CCj1QTPy+y1m1IarUH+fF0QcAiTISfdFEKIdtRLnKo2NxOItvkJH252cYce8ankyBNqf7aPJpvahscjuDm8FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDZRzSsMsHriMl7Ei0wanroOEzhHhSecTryBf7rF50o=;
 b=VFgNoXolhPb1EATeLpzbcux72khhSHtd87SCmR3mGHEbhhe7K/WvK6KJM7ZdHlrUQ5HrX85RhZk1JDxXSJ9T2GA0X4wN7e5xoxrpcJvSaBxQN6fFnBFKzNbsLGvY2d0e6voz34SeuztmJlqpxTFDa/o/R73A3KjW25BoxW/bdQC/kDMHP0CHJagitQd5u0PdGgUJT4KsJjwNNsOEl16NbB4HHO5pE8MyZe3PJNUacYLTqwcWjI4O+Fe3dAW7QQM03BLt7WplSsJipJsXlRHuR2JFmXX2yK+OV3ZxR0FD4hQTLYb2ioqsyfc/nkm7WmfGr5cEW4F7X0s85AP3R49JmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 05/31] build: factorise generation of the linker
 scripts
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-6-anthony.perard@citrix.com>
 <5a9f0468-7ef6-eebb-cebc-492050ed7e8f@suse.com> <YOwhY9yycoMACBGK@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76fa22fe-c2fa-b563-9644-f2dabc3a6f6d@suse.com>
Date: Tue, 13 Jul 2021 09:28:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YOwhY9yycoMACBGK@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0013.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b09d72c1-e0d7-4cff-1eaa-08d945cfd1dd
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71494C0AB0F0032B844EB2BBB3149@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2zL5WoZm518RdvYHzQ0+kvAO6ZToLmgDJzKgwAGtO8CftwmZ1sV0D+wq2DB77kU5EA3McWI8pLVuoCdSNqod/gkK1/P7f6F/XgMYu0k4XvW7dBe/SsmEScopTJKwShfC7+2T1Du9irfVVO57TuuEbuklHcMGINkWA83NUjY/yw5qbPiCIxigfxzFrGSRPYM50Nmkkp5j3Q3423I38Zq7yVr9fOO2tzwc45MmY/BQmBFCx8HrmYk3f2dZNxhvVsni6E2aMplFYHiO63PhLUQBSuESUI6SaB8Ul39mdlssBpUmQYctEj/jvaxvOa0NPF9y/l1kalsbXRwRK8ncHlK7hO7VUPwRC18QVhNPGwuOAxv1cKlyFDp+mMRUQYWYRPZ2VqZq+K3WB/xG/r8AdXGYrLzqTHJye5QIMpLFbdsO61Zt5yaPhTTJM9oIaXPhgOZuHzMZDlrJMFejL5SFRkfsjShM5pKuDnjjJEU30n6GZbdl+S4W5/zvjDF27Fxpdvxq005a6hJfLVRZO//cHC+CcSOPsf4nNfRxnRNeCv6/upjLLE2U5Ztg2GvqgiSmhbUmJ3Czj+jt5K7B/wOVfXxUqEjWOPK6o9VyexfQ2s1r2N1VzBtNxNMM9i1Lyv8YYt2j+LNgHGyTcQ2Q16ddYzL+mgb/weNWFGtN35HfIXhuvNz2wNwb8gk1mHpwVnCiqBBUq57SYcrrcd1VeodZM7d9oZXbaz6sjdGjr1O2NcsTnjLwdeTK3qK+SBf7nAA4IpsI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(396003)(39860400002)(956004)(8676002)(86362001)(54906003)(4744005)(2616005)(31686004)(66556008)(2906002)(7416002)(478600001)(66946007)(66476007)(5660300002)(36756003)(53546011)(186003)(38100700002)(31696002)(16576012)(26005)(316002)(6486002)(4326008)(8936002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1JqQnRpb0x2MHVXcGhTWUlxbkh4VGRCQllKdTlNR2xiUXJ4K3AzSmJZRDFm?=
 =?utf-8?B?UDROTHRJNWNlSUVxWFg1MDVGWEFrSkFRbVpYeGRFdzliTEgrUGlDcWt4SThO?=
 =?utf-8?B?ZnpPd3BxN3oycm8yTUNTWmVQeFRzOXl1aTlHQTVXRENwcjZqb1dSUlFqd00x?=
 =?utf-8?B?SGs3RFF6R1ZDNTV1clhjVjNiUDJtSWJzc055dElaNFBWZzA5REpEeUtURnlW?=
 =?utf-8?B?T2VyTC9KQ0YrQng5K0tlUkdaQWIzQ3g3TXN0SzlaZWxGQ0lUYWdxdjBmK1Q1?=
 =?utf-8?B?d1VVbk9odzRpNE44WGpnckRjWnhCYjAreEs0Q3V2S2pEbWZIN2tweFJJMkty?=
 =?utf-8?B?azE2d2tvejJnNUVmZTRBdFV4cHl3YXBGZUJNSVVGdVg5aTR0ZXVUQVdMM0hV?=
 =?utf-8?B?WkpaN3pkdHh1MDZ6OEUwTWExLy9XcE4wVElCL0pMTzdCTmZDdGNvWjNEYnBP?=
 =?utf-8?B?ZC92N3pzRExGZ3JWYXYyUjFRa0dUUGhVaTMvcVFwbWl5SytCczR1SFk4OGpm?=
 =?utf-8?B?aVE2dVRQOTNBN1l2eEROU1Q3eTVZUzRPQ1NGRkZJWkhzdUY4R0twOG5QOW9I?=
 =?utf-8?B?c1lGUGZYZ2FEU28vbzA3YmlHNFpUaWplVnRCY0FESU9XMHVMcDd3Ykp4eHpH?=
 =?utf-8?B?WnV5SjNOM2Qxb05Vd2hWdENadjZWMk10NXFGQzE1NjgyMHFadm42eUhLY3Nm?=
 =?utf-8?B?c2JpZ3MyUlBLd2VTUnF4UTYyM0lHTUhhd2dkU0VwMTUrVzdpa0VkZ0JFRGdH?=
 =?utf-8?B?UTJkK2tyNjZVMy9WQTBaU1MvbUl5TUlJK1FFQ0tmV1dkblN0QzhRTGJMQ0hm?=
 =?utf-8?B?OEFKYkNLV3JmMzJnbWNDMkVtWTcvUGMyczdEQ0NvSWppOUpOL21nUE1YaEcy?=
 =?utf-8?B?YVFpdHprMlc3Q01DSzB3U2tzclIwOFNQTDZ5ZlBFL0ZBSk9UT0xqKzlYQ0Jl?=
 =?utf-8?B?RGFtVnhNZm1TRkk4ZUJHYjZiSCtPOFVLc1RuWXdCeTMrSS9GaDl1Z1lNNjln?=
 =?utf-8?B?bjhuUzBLYTZDQkRYSklwd0paMHJ4WFBzcjZHRVo5UHBDbXVuOTF3THFqbzh2?=
 =?utf-8?B?OVdneGJlSjhSdlJmZURaZUtmZDNlcllqOE1BSVVxU2prZXFYZmszRFhEWThU?=
 =?utf-8?B?UkRBN0g3cXhEMXptTlZuY2xWRE1NVkNDL1phRjdGemczSUlEd1NuQkh1QVA2?=
 =?utf-8?B?ZG1oU0tTZ0VFVktsejlDTXBpWkdKRTFDOUVHdGR1OXFpdEJ5WklSZlB4eGdT?=
 =?utf-8?B?TnhpbXdvNUJsR0U1ZHFtczd2UXFzV210OU5NZDZRdDc1aldXcWxVSUJaSDlj?=
 =?utf-8?B?QTFsYUdoMlliU012ZU9EdmtzMzB6Ty9qbHg0VzdrR3EvaDAxaE1uMUM0elkz?=
 =?utf-8?B?YWZiQll5SkZScVY1MFkyVXBSRlhkVEFVYktLU09idUF4YU9HSEdPY09ZZHRt?=
 =?utf-8?B?Nk0xSStlNWtkZjdqQk1qSkZvM1pMb3ZSbWlpLzVEZEpYZXdTcWNOOWN6d1Vt?=
 =?utf-8?B?c2RTZTlrdS9vVmVuWkp3elZocWlDMnpDSDR4a2ppS1o0aE5LTmFFWWRNeTht?=
 =?utf-8?B?MTVVTVdpYml5b2cvY2N4dUsxRSs0YjQvbEhKK080b2lTMnUvWlZ1WTRQZmhS?=
 =?utf-8?B?aWpoVVR4K1NUNXcwNThqQi9rR0VUSXNaNlYrbGl1emVRKzFTSUt4ckE5bW1K?=
 =?utf-8?B?UUIvWlpnWDBkcW5ZNTlzNllSdVVZVCtEanBHVmZSdXN4eXFnR0c0cVZhNlRR?=
 =?utf-8?Q?sRCpFsqfCTC7pYAr8WOY5IS/cPeGfNJDDh7hsUT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09d72c1-e0d7-4cff-1eaa-08d945cfd1dd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 07:28:33.1861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8R1cCa8koETWylvFDwSGvFXFJhFIhQoqaXCxfSRXzV0MiKhw8Q6nP5NLY+dBbBIkq1m4zM36PQbX72z8LuxGHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 12.07.2021 13:02, Anthony PERARD wrote:
> On Wed, Jul 07, 2021 at 04:25:33PM +0200, Jan Beulich wrote:
>> On 01.07.2021 16:09, Anthony PERARD wrote:
>>> In Arm and X86 makefile, generating the linker script is the same, so
>>> we can simply have both call the same macro.
>>>
>>> We need to add *.lds files into extra-y so that Rules.mk can find the
>>> .*.cmd dependency file and load it.
>>>
>>> Change made to the command line:
>>> - Use cpp_flags macro which simply filter -Wa,% options from $(a_flags).
>>> - Added -D__LINKER__ even it is only used by Arm's lds.
>>
>> I'm not really happy about this, not the least because the symbol's name
>> doesn't fit its purpose (we're not linking, but producing a linker script
>> at that stage), but well ...
> 
> Also, the leading "__" is probably a bad idea as I think it's reserved?

I guess that's intentional in this case, matching in particular
__ASSEMBLY__.

Jan


