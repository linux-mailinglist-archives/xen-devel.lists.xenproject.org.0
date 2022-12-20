Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22E2651D9A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 10:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466823.725771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Z5T-0003TZ-36; Tue, 20 Dec 2022 09:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466823.725771; Tue, 20 Dec 2022 09:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Z5S-0003Qm-VV; Tue, 20 Dec 2022 09:39:02 +0000
Received: by outflank-mailman (input) for mailman id 466823;
 Tue, 20 Dec 2022 09:39:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7Z5R-0003Qg-Bm
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 09:39:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2049.outbound.protection.outlook.com [40.107.7.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21bc272f-804a-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 10:39:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7571.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 09:38:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 09:38:58 +0000
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
X-Inumbo-ID: 21bc272f-804a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiTRgSGAyCoG5vk2OfEBbdehqm89SbZU+eRLGkOrl3hGT6k6yqrKS3htCCTebAg50acJvlZZJQIK/ml2DMyh4WJP7eyx5Bul1z515KmQ9tropBa64L0Fr+UkW5gHx9PONxh6JizZnQUj8OAyFEffGUsOvl3Va+H6gM/LxQindAHNlK09rcTmymyyRPjeHWuryrsJvtg+cEvLTBV1e6eu8zX8eIacZEuMQA0oPb1+2isYOeXo6d0LjOpHtEikU9/3FTJxYdDo0fK2e6wyMNh/gsf8NdGhB6PGr4h7ykmnRR++Az6MNb1QcCX6pYHaN9WOnrqMQf8DNwft/pE7PWG/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54sLO94CEgeqfB5DE1j/NEXE7jCLxSHQUAP2HF88qYM=;
 b=iO++/KhXKtt8f8f8aNSpmlAwA4QE3W+dINCHokqMwmwy6bMGeKcdjen4pPXLBUkX4Mr/C9afsH+2KzbjadsgNhMINrr7foxSEeF9Z9ljpHoKrvjc/adzHEV9KEa75zrkuQ5EslsY8MjFeEvtR3xn4zWBMw+VdtqFE47FWCOjSq4cKb0Q8hoZTQNjj4K+jhuf23UjUEB2cJAtjp7BHcsEQkaJru8adnLsmZMGSx1ygIADudg3ZUno1gZEGv01qcTyuHoLekS8vSSb7L0OJknvI8MGeU0JRm9NfOuog1rW5sGmeFhweXjnNJ1Pfj7kkZFPmMt02hVy8V0zKwhW7/NuiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54sLO94CEgeqfB5DE1j/NEXE7jCLxSHQUAP2HF88qYM=;
 b=vPUmHSl5ISvc78MIX//Htr59RhIT5k5XE2U/H7LJbgcnciIeB4OGJ3IBQEFO/pA4KtZ+P1OAi4fK6Vsn5ceZolAAR4LvaJx4OTH9XfgeGg5hclC3QL7Mdmi7WE1eBfkO2yuiUIv3eNSWxUZ+joTWVbZXsMTQwc1fT+/nQmHhvQz8BgQZsiD0OjPkQaA5MjsfzXb4wMjwSNDCql+vaWgYh8kh7E+uB0S7BMhmgEweUi5zJhViKacZWNsNbMhF+QrcV6RmfLH5J0B3ya6nkWd04PAbU68QbjeFFaknYxOdOh72xw8rQdWa4BKaUczihqi/5Emm7KcjnO8AXPONwolH3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72ebe791-7e3a-acc0-0021-cbffed69e10d@suse.com>
Date: Tue, 20 Dec 2022 10:38:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 05/18] arm: cppcheck: fix misra rule 20.7 on
 arm/include/asm/string.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
References: <20221220085100.22848-1-luca.fancellu@arm.com>
 <20221220085100.22848-6-luca.fancellu@arm.com>
 <4b51edb0-a203-a6d1-b660-914dc0c87bf2@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4b51edb0-a203-a6d1-b660-914dc0c87bf2@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 548f139a-0842-4657-e083-08dae26e04f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YUrMieT3uUQj4VyG12YxRWYZNtD3ta02sr0YnfgwQXoYjKUAo6jOshKR0udU+qEYzNWNV3G7gaANp0reYY3LyFsAWdrdwxweXLHPPHpMDHg7b+FdM+aNkykIcKWUVwyxpY+dADZqwmz2Ec7KlCt6OwzZpevyhmefh4jcDrIh4X3OpavSIb0AUQg8p0XxMIbYxhSUvr61UeOL0i4lUZEBaPAXfPKIylYKMYzuMHUxmuqNRZ9LQKvBnHh59WA/4o1mbHvFY3CG2SlaSOQkFJeSrVRAU1A+51j9oMBCX0T3xFLvqpxIXu0ZqvyhYCIGKOnAZBN5zcerMJBTtnCDmFGLa9l7PyZ/JD/jCWdZBiB4UCZisFZnDqD07E4DA2dnQV5eOUWmY7jRh+QZb7AwitRYsHHL8FSuMyoa0Bj2RNPxkV4bx3CFOEvWDxhxxIdasdjuTxGmNnZHJlCbNzdfUfPLZP2S626927vW64OVPWeRotWmm9Qzxzx6OSHHiac0XG2I/mQD5pt0MJ8CIO4tCmnRIz5evtXaM78SQQvEen/kt5tRuuUietvddSF6PZj3j/nYqUQtHb7jSxLiCGZ/nFObVURm/tOhmlzPKTkrvJTgMHXP8WvbH/W6n9J9tiGX157igGakDvz1yrb1iReWHCfRYmUS+8RbRm+MDIBobJQoqoyR9MBxBGnddwf9CYHgKlqG3P8PjHw8Z6E0Lg7w4d5Ur41/TYt05QnIY4iMKgY1YinMShCRxuMevWf2TYvy0j15YTi0HjDrwIR+HcqdwAnj8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199015)(2616005)(38100700002)(86362001)(2906002)(54906003)(478600001)(36756003)(6486002)(966005)(31696002)(316002)(26005)(186003)(6512007)(5660300002)(31686004)(66899015)(8936002)(66946007)(8676002)(4326008)(41300700001)(66556008)(83380400001)(53546011)(66476007)(6506007)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU5sdldkRktPc3ZtMXdZNmYxYlRkUS9ObEFVM2lXazBrdGp4bmY2Q0thN1Fh?=
 =?utf-8?B?SXNveTYvMDdZTUc2R2xpQ1M0RHg4SzFIUHdGVjBPdjhmcTRVRWNodW91QkRS?=
 =?utf-8?B?cmp1ZVhyeFNXTDhqL2t6VDl6SEQ2ZnE3R3c0WVhYQzRMbHRoZnRjcDFCMlox?=
 =?utf-8?B?eFUzUEV1M29iTC82cTVweXBnK2xKSDZBamRDTktLU0dNSzVNMHVDYS9YL1JF?=
 =?utf-8?B?NWx3SGN2bkJvYmFvVmRhVkQrV3RvblBiVk9uMHY1V256QmFOSlUvNlRleXVo?=
 =?utf-8?B?cHZkaVdaNWlodzcreEZxdlVlcVloMi9oOXppVmdZT2crU295UWpsTEJ1RWsz?=
 =?utf-8?B?MDNBeUQzeE00SmVoTFQrbnpUZUF2OXI3eXo5eUQvdXIxMGV0NTFadDRoelhC?=
 =?utf-8?B?aDg0dnNTWW5neitWQ3VWYjlYVzNKVDVSdVV5akQwa3lVaVFwWkpuZFFBS2Zs?=
 =?utf-8?B?THdTY2x0ekVtU2prZjYzT285K1VubTNkVFhnQy83ZDBJUHRwTXRHOFBKOUdy?=
 =?utf-8?B?YkRpKzVCcHRxRDRDdmp5cXQwSUZ4TktobWxCSDlGMWFhYVlJK3JMY3BnazVD?=
 =?utf-8?B?ZE5ZUFcvWlE4V3c1d01jekhZaGcyQ25mdzY0eDVTdkhUOG1yL3pVYmVxZ2J6?=
 =?utf-8?B?Qkk2Ynh3VklPSlppT21lUDNxT2RVREp6SnNNWU1IYTNCdEZ6T0IxZktrMmd3?=
 =?utf-8?B?TW51dFNzZkVTc29vTlRRS2w2MHdQRVFKYTkvOExualNIS1NMQTZCMDhxWFV4?=
 =?utf-8?B?T2NsTEd5YXhxYWhxYmhzOGZubEhyZ3pZRG9qcnhKMHFpTVJMbTZCZ3Vrd29n?=
 =?utf-8?B?aHBoTzJSd2dkRC9ZVTRjQ3piZ09VNFYwc0g1UkhsaXhENFNpamVRVUIyd0dj?=
 =?utf-8?B?SitkTkdqVzhwYWQvTWE1Z0drUk1BSnluL1VXVEhZU1F5SEJGcE5Ld3E4MGIv?=
 =?utf-8?B?VkkyZm5GNnVpK25MUWRrSVVyclRWSmt3U2xZY3RpZ0FBZWR4c3ZNNEMwZ0V5?=
 =?utf-8?B?NFFqSG1XQ1YxdlFwTjhVbXdPcWpXSy9TZFh3YWRUbGhqdmp6N1I0cGIyNVdW?=
 =?utf-8?B?Zldxd3JtSUxLVkI1K1djSVBhQ2hZYWN4aTQrdENZRzFJaS9QbmRNUVQ0Z2U0?=
 =?utf-8?B?ajhPOG5YaytISm9xbnRWdnROMFBvNFZKRFY4WEV2YUZXUGo2ZnNabEJINXor?=
 =?utf-8?B?dVA1RG1yRk80NUVZYU52WXh4YVhPTjROOFZ5eGROaGZwNy91T1VaY0tiMFQ3?=
 =?utf-8?B?NmllejR3RmY3Wkd3S1pTQkdDTDJ5bUZ1SC8zRDRicmk0Y3Z0dndyOFFxQ2w3?=
 =?utf-8?B?Sk1BKzlJZE5sMkZBVTVuNnJPUUlnV3FoVWVURmU5eGw0aDQzYmt3dFpxUTFk?=
 =?utf-8?B?QWFBa3plT2lrcys5OHZYUUVzNWlCSU5aNTByR2tnZURybHNLZmIyaUJuSFNQ?=
 =?utf-8?B?MzdKSEU4Y3g4djJnRmxtSm13RFBkcy95ZEpxQUxJYm51Zk8yeXdnNXQzQlZB?=
 =?utf-8?B?a2Rrcm03cU9tUzFKTWQ5amRORW1Nc0VWRTMzbS9oa201ajZvU1BBc1ZHckVP?=
 =?utf-8?B?N0tsZDZhVE1zYkNoQWIzSWhRWDlZbUxiVUJScjZ5RGdvUG1ZbFZpVTNuUHRD?=
 =?utf-8?B?WWcxclhpNVpIaDRUSERJRDRCYjZwMTZieExoTkNkL3R1WUhEYzNMc0VBMXc2?=
 =?utf-8?B?MytlVzJCOFBBZ0FlYVBZUEt0cW9QWktMakY4a1ZjN29qNEtaUDlPYUNBc1hB?=
 =?utf-8?B?VzVuTVJrbUI1ZGJtZ3JDL1piWWZWMHpoZDQ0RzYva2VhWUJkWjczaEVobHZ4?=
 =?utf-8?B?TW9lMU5lOHN4Mnc2WVd2cU1KeEdSU1o1UmxQTUtrRExZQ1IvcVFXR3BuV3dG?=
 =?utf-8?B?K3g4eGp4NGFmNEFScFUzTTB4Zld2YkZndmhwazVFT1hXUFVHVFoxQTA2TDhk?=
 =?utf-8?B?OWJxVE5BLzBka3Y1Ny9ZTWUwYWFyWDlsYlp6N0J2bmNxMlNJYjVYbnBOWFFY?=
 =?utf-8?B?enRVWDcxNTZpWGgvTytnRkR6b3FYTnJUb0E4VEIxakx6dXJqUzZRQXQrOVpE?=
 =?utf-8?B?NS9LeXMxVitXUmQ2a09XTUthZmdUVU8zT09sdHI0ZHBySHcvZEF4eG5qQ3hm?=
 =?utf-8?Q?Z0nBkzX2Tqc+z2qmgxaRqzVyr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 548f139a-0842-4657-e083-08dae26e04f9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 09:38:58.5673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTMowmZvu+IQ8d3/njwS0u1Z9Udj9bItaVO3gf40wyjYNdykviq6NtMZDP7b3s9QfYia+2579PVJabkhCr8/1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7571

On 20.12.2022 10:12, Julien Grall wrote:
> On 20/12/2022 08:50, Luca Fancellu wrote:
>> Cppcheck has found a violation of rule 20.7 for the macro memset
>> about missing parenthesis for the "n" argument, while the parenthesis
>> are not mandatory because the argument is never used in an
>> expression, adding them will not harm code and readability, so fix
>> the finding adding parenthesis for the argument.
> 
> This is something I have argued against in the past (see [1]). So...
> 
>>
>> Eclair and coverity does not report this finding.
> 
> ... if neither Eclair nor Coverity report it then I think this should be 
> a bug report against Cppcheck.

Furthermore in reply to my "Arm32: tidy the memset() macro" you said [1]

"In this case, Linux has removed __memzero() is patch ff5fdafc9e97 "ARM: 
 8745/1: get rid of __memzero()" because the performance difference with 
 memset() was limited. For Xen, I think we should also remove the function."

So either you want to follow that route, or it would rather be my patch
which ought to be considered for merging, not the least because it also
deals with yet another MISRA violation.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2022-08/msg01185.html

