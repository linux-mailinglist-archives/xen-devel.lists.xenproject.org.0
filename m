Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806FB478574
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 08:12:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248420.428524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my7Pv-0000RS-Hs; Fri, 17 Dec 2021 07:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248420.428524; Fri, 17 Dec 2021 07:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my7Pv-0000PQ-Ek; Fri, 17 Dec 2021 07:12:35 +0000
Received: by outflank-mailman (input) for mailman id 248420;
 Fri, 17 Dec 2021 07:12:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zqed=RC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1my7Pu-0000PK-8l
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 07:12:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b361c40d-5f08-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 08:12:31 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-dVS8qkvmNJiBNc9g7dtobQ-1; Fri, 17 Dec 2021 08:12:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5166.eurprd04.prod.outlook.com (2603:10a6:803:53::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 07:12:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 07:12:25 +0000
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
X-Inumbo-ID: b361c40d-5f08-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639725151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmHn+CnE6itoxRgrD97ITmCMKimndrn8qe9Do/IYSzU=;
	b=E0OKB3u5hXKVUvXabrUIkZlLZu1muau1A5SXw5lpI/kSZZtJOxtsNyHljMK2RLofWqmQSY
	VP6/L1sZQruRtuSVvv/J47H630i1aGQKMGA4SIGQ6hUmM/ralirY5sQpyQFl1jSzUzI4L2
	74rWQqubK3Iz1IpG55RReYT/7Roz7bI=
X-MC-Unique: dVS8qkvmNJiBNc9g7dtobQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0h9SYulNKY2rwcVrBUy9CRVkDZGUTmTQIApR0EkoG0nXKM/XXOt3sEL/OwODgfuZgSHmQviQJQ7z0F5Ykg7jUZmNFvlt3u7EuwX/CCghLhHuDwZbScAjysY62ijNjh4gfcpro2fkyyNzh4L6lZMwNV1ff+l/QRtclD4jWdFFyiJwZ55pth8RaatuGUgoHmQ7C5VWjy8j4+k73kX8ZvM/0NiGa5FmxbtvsANokydBAhDWBuSezIL+alOKyX+CXfDawGpa5gMt7JZXjoemGHCHQuIMr4m5B56Pu719IvdlhakuknOowDt3Vsn1LLwLeWuDru5NKnrI+NNvBsCPixAtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmHn+CnE6itoxRgrD97ITmCMKimndrn8qe9Do/IYSzU=;
 b=Zxa07Dpp1QMduhlGeibYuWr5DFVZgwoN3JShHHxPUBw2y0OFpYyLnPtdF0Hp1UjBBmpsJbdto/m9NCTXoI7XOUqaY8kqtYqqURlfE8jEuJhfXOg9KxaOfstzfkYuR9Ezpr162gQYpCZ2w0ZBzHTNUWakaM07Xqc7yYMcjeNV133uGC+F/e4JGtkmv1t9JiPzyHMjLjt3ZDiidM6/6kTlj34U7t95Opp87PaX3WGWU7qAN+RZetW7SgsPpzwUMiBUwitzgMDmyPGN4Qs7fSZ0+k2ZecvufLYJmMXpLfErrnlCqMUlFLlS20UoVvW0vb1GWEEtSVM6y239IzTGzSB8Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08488d6e-3bb5-71e3-2e07-aafb912d69f5@suse.com>
Date: Fri, 17 Dec 2021 08:12:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Content-Language: en-US
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
 <5876e66a-9a12-6a69-989f-a5ba6709886c@suse.com>
 <20211216173625.GA3623693@EPUAKYIW015D>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211216173625.GA3623693@EPUAKYIW015D>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0073.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2dceac4-ae9b-4d15-247c-08d9c12c93fc
X-MS-TrafficTypeDiagnostic: VI1PR04MB5166:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5166721DA472316191220412B3789@VI1PR04MB5166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XwqLLcnRdNPMyFiHsESi8w50Zgigkg2zj3Lu4/Nw2BlZ12LMG9gXa5GixT8tH5poxJVjocE+vwB3Qh3HgyZ+tHyh2WSOipD9p+fac4K2FhLefdQKS9QbSRkVs563MfNexb2USpw4ajxwb8bQx9H2NPtf96Kku8otT3tT/dyGvZrGXWqNh0PfCchAGDQSYzhKeyiXvyphP6OCOCckOXmNWwMmhrJgvp6Fc5A9emEktFJxloBeZrILbWxcZ540uoNltmIpAsEJgOrMyWUgINl/I0W286m4Fo6P3JTQCwtNpYV6SIrUz6TyZiZJm4IB2oh2BtR5K+I/+XAUvudpOz/fYH17+ZbRsbxogUX0nobL3j5U1gLP6wluXwXUIed2HGGNfNeVsKbCtO6gUMmFUTbpH6lMPBedECuZ3+tIUy2+A7r3fp6kvSeMnPbo2yZvBEjDVphkTW/keeIzP3LTP6paApn2Sgh0Hb54vHHs9FN4qkc81PBWqRUYF9gzrkot5vJtrtCDkgHXAKEwEl5B3+KqUgjjhehY132pLUzzRXvrCdYPaVJUrNyzPDaj0m1YvY1SkMD5Lk7QqNwlmPZqt8xrk68jEyfi9Ophi6+S4negzeF6nSWkwpQHOhJgBWv8sdQTDGVePzJhHg5nw4PXCNYxFPxts3h8+Dev/fvj1kXcm1gmIA+M3aIR+ngEn/eFYE4FBJW+KG5cU3EvUiShPaQfdvs1bkqm+tJalN8o70vso18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(5660300002)(38100700002)(4326008)(31686004)(6512007)(53546011)(6506007)(8936002)(66946007)(6486002)(8676002)(54906003)(66476007)(66556008)(2616005)(186003)(6916009)(86362001)(316002)(26005)(83380400001)(2906002)(508600001)(7416002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWlBeWRWSWl1YThYSHl2TzhxUzMxSFV0Y2pHVjdIOVNWdjZkNDlQMWxGaFFo?=
 =?utf-8?B?NkMrY3M0M2lPMzZJK3hxYUxhYmFkOEwxY0p1SFpvTng3dWlEYytENnNPNjZY?=
 =?utf-8?B?djh0cGhhZnduUzB5cEpSZGNFTDhLZUovSGtoWkRBeGtUTXQ5ZjN4cDlaejdX?=
 =?utf-8?B?SUlFQVlWRzc3d2h6ZVVDMVVEOG5DNXB0WS9EZks3c09yc1FQMGpJRmxWREky?=
 =?utf-8?B?cDdnU0pXSEozSzdQcXlpQytaNVdEeEUyTWZYWkd6OEs4dGZ3NTlPNGFhdDIw?=
 =?utf-8?B?ZU0xMkticXRzSElpZXkzTEw4b1N0cVp2d0gyU2owcE5yMzNNMlpCMm4veHdY?=
 =?utf-8?B?TjJOU1ZhU3FZTmRlVU5GMHFzK2dZZll4Z2w4azVEd1lRQ2ZzZVBwQjdsdktq?=
 =?utf-8?B?RXpDSWJuSnkyemZNQ0hTUlJLUUlzK0xDcnZkSEdLQkhVdFI5K2hKUUp1NTMr?=
 =?utf-8?B?Y0dqQnFTb3p5V1BpNHR3QUVEUVBzZ2VGWjFXS3BsR3Q1Rk9HbTNDZUVMQmw1?=
 =?utf-8?B?RzUzQ3ltVFREdVNsRGhJZ0k5VG1McXNMaXhCeXh6Y1NrMGM5Y2dJaVFvZ0Ix?=
 =?utf-8?B?NUd2a1pKcWVLWThTbVZxUUxwTEtMSENyQi9OZlBZQ0cydU9saWcvWlgvSmNE?=
 =?utf-8?B?bVdvdmdBQ0JYOTRhOFlKQm0rR283a29VL1g5Z0tITGo2S1ZOZk5tNk9JN29n?=
 =?utf-8?B?Q1JFSTF6SW1xUnZJTjBOL29EOW9Ycnk4Yk41emtYZjUxR1h5TStWMDYwd21H?=
 =?utf-8?B?QmJPMFZ1UHBXdlRvamRHTEY3MkprTnNKSmRoWXFnNEJuV2cxODhzeUdRVnc3?=
 =?utf-8?B?K3FydHFLa0JUci9IRngyWXpkR3ZyYTVNa09pdlU3MldhdGdRajFaZUc2dk40?=
 =?utf-8?B?d2tjTk1HRVZjVVBnZkxJUG5Uc0w2RTVLTmt0a1lTZ2gyUC9MUWZsbXRMVE1K?=
 =?utf-8?B?NUR6ODBxbHlzNTVmRC9oQ2dyMWJEcmtYY1Nyb3NjVmR0NGNxYTBDeWlMZ1gz?=
 =?utf-8?B?MWlSMnhNekxSbzI1U1FqQjlGT1RnM1RXUXA2bUxiV1A4WlNvckp3Unl5L3or?=
 =?utf-8?B?YkVFYlJYVzZNYUptYWp4OUdtN2kyd2xjaFN0ekdNR0tQM3I0c1RCTVRVczNJ?=
 =?utf-8?B?YjBVcHRPYnNoL2lhVHdpQmJXdjFxeWhtL1JNdHJXQlZMa281cll0eEhXZ2dx?=
 =?utf-8?B?dm1CenIrMXNKVXp5SFl4UUhSeHNwYUVpSzZMSkVDRXJ0eko4b2IxeFJmY3M2?=
 =?utf-8?B?L3FWWHZZUUlGWVdaZ1p2ODQvUVNQMDY2Nm4xbFNKZmRZVkFvLzV0NjZ5bEJv?=
 =?utf-8?B?QjIwbCt5dFZ6eUUxSUx6RDNXVmRwLzkrUzliME9oVDJEZWNlUm1zeEdxS3ht?=
 =?utf-8?B?MzR4YVFHT0dkbEhHaE1iR1dlVFZhbjFqVEF0ODgybVRpMG52aHBzbGNHK3lR?=
 =?utf-8?B?ekZFbGVmZTdZMm4zcll3dmFiNzUwQjczS1YvY0NmeWhWdXRiRTkrblpuRmU0?=
 =?utf-8?B?YXZLRFcwS3ZoU0Y4OGI2Ull1cm0xdCt0bkZSY2lxSlVrRlJ3NGpVNFNySUd5?=
 =?utf-8?B?UkVBM1hCMGxyVExEeTR6TTFRamtzRmlZMnlxZ0JuTjBvUzJ3ZFA2TTBNbnY2?=
 =?utf-8?B?QzFXVlhkYkpnUGVCdUpzQ1NaOFRCZmM1YW5ZWG0vbWg1MkFMeWlFaDMxK2s4?=
 =?utf-8?B?a3NPN2t6emhNWnNTRzVwL0NUMnlmL1U3N1o2am9DbzRuNUREeTNibVNsY1Jl?=
 =?utf-8?B?aVR2aGRBeTAra3JNNjJkKzBtYkZMVFU3REg3Q3lRSi9tSTJMSm1QVGR3ZTZu?=
 =?utf-8?B?TU1mOGxPczlCVGNQWnNoSlZZQ29hTUlBdmlXdytMUDMvdE1mOXVrUWNEV29a?=
 =?utf-8?B?ZlNWUVBCSjFIejdEdFBmZy90L0ZxWEU0ODdrKzdCT1N1TnhIWjdnbU1ZaDFV?=
 =?utf-8?B?aE81dW9lbVdqcE1YZFg0OUdiL3ZIcFFMRkx5dTZlQzFtR0s0YWVSRUw3TjFF?=
 =?utf-8?B?Y1pnMHliS29XSU83V0lVSFd2UE9LODlncGNQaHMvY0grVk1jMGJwZ1NIWEtK?=
 =?utf-8?B?MHdrd2hNSjdXaC9uMFErY2lhb0xMNmd5V1dzamlSYTdqUTBrd1FLS0o2NGpT?=
 =?utf-8?B?ZkxNc3RNMkVSZ09udXJxc3N1MHVrbGs4SnUxZktUR2psbjZTbzJUUFlQUGhE?=
 =?utf-8?Q?z6AsPBbsMnrmeeun09pBnA8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dceac4-ae9b-4d15-247c-08d9c12c93fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 07:12:25.6851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPnjOLY4QiyYCxeMe9R+7l6xuRIOZvSuBRJITIK0LdX6idbnpvG1DW0kjjd3xl6d7sVdZYSuKOuz036Oe6a6hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5166

On 16.12.2021 18:36, Oleksii Moisieiev wrote:
> On Tue, Dec 14, 2021 at 10:41:30AM +0100, Jan Beulich wrote:
>> On 14.12.2021 10:34, Oleksii Moisieiev wrote:
>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -1177,6 +1177,13 @@ struct xen_domctl_vmtrace_op {
>>>  #define XEN_DOMCTL_vmtrace_get_option         5
>>>  #define XEN_DOMCTL_vmtrace_set_option         6
>>>  };
>>> +
>>> +/* XEN_DOMCTL_add_sci_device: set sci device permissions */
>>> +struct xen_domctl_sci_device_op {
>>> +    uint32_t size; /* Length of the path */
>>> +    XEN_GUEST_HANDLE_64(char) path; /* path to the device tree node */
>>> +};
>>
>> This being - aiui - Arm-only, please enclose it by respective #if,
>> just like we do for certain x86-only ops.
>>
> 
> I agree. I will add #ifdefs in v2.
> 
>> I'm further afraid the term "SCI" is ambiguous with ACPI's System
>> Control Interrupt, so there's some further tag needed in the names
>> used here.
>>
> 
> Thank you for remark. I'm thinking about SC as System Control.
> What do you think?

I guess "SC" could even more so stand for various things. Even the
spelled out "System Control" looks overly generic. If this isn't
Arm-specific (in which case adding "arm" into the name might at least
help the situation a little), then I guess some further disambiguation
is going to be wanted. Since I don't know any of the context of this,
I'm afraid you're in a far better position than me to come up with a
non-ambiguous name.

Jan


