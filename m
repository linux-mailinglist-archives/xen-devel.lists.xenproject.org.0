Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF465F3CFC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 09:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415188.659697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofbwC-00062D-0X; Tue, 04 Oct 2022 07:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415188.659697; Tue, 04 Oct 2022 07:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofbwB-0005zO-Tp; Tue, 04 Oct 2022 07:01:55 +0000
Received: by outflank-mailman (input) for mailman id 415188;
 Tue, 04 Oct 2022 07:01:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofbw9-0005zI-Ea
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 07:01:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60041.outbound.protection.outlook.com [40.107.6.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c034db9-43b2-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 09:01:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7837.eurprd04.prod.outlook.com (2603:10a6:102:ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 07:01:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 07:01:49 +0000
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
X-Inumbo-ID: 6c034db9-43b2-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMsbFcHFPll3oO6QKDyF7G6VaTCzeoFhprvgaxNFBF0ADqisIwJ6N3GUV7UtNUERpIZ9j+7a3Aq6CbvjfEbKgQoGEzYYTp+058ZLoXWFBQ9IWOoGe0JAB0RN1Nhw5+87oFFzLtkQVo6clRQMs+ZDMnis7KlxHJXk/erLBXvlkkaFlBBXulxWO7NkSUEvphwxvtUWsa5s/sg+BIlIVosMXAUkFMw2EvBGen29Mv7Vc6cvNYv7Mi+mXszo3X7NykqgVNDaY/K5KnBBleLhTe+15yvgktDUp9D1K+Hx3WLunrTdIPJwI/1uvT09N+cYsAQ3laNyxOQUazHoKJW/W+y/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rMCXh5lcyI/4KD223irbp/iwJHL0sSbEzfWQQ1Rnuo=;
 b=KvV8ErwcYrtF4VZi+EqelnmiHYoMyvQwaxXWxsFPUyP8mO+jJ9NQg8Ahf1dhHvT3IV6KlodjR6RaoL4u2SC7nAAwPqDPOq42gXDxYo9m4MJkTA7/Rd5DsadwKCQnnowIxoslS3PHC9omUq3P+OU6C2zc+fMUf7FDs6DNzGaEmsvf0SdQ8/vgY5frTelme650acauHBwinOh4GbzeGczzmLuGCDYtBPS0DLtvGZtd5+BPSU35RNhTOs+SDYdlw7/SJ7GNUFIASdzcfD0UxaKspXXUHnKAEFyYKyfrirUCEDl/o1JlH8L9QTJzkMxHNpRWAeJ5BO+WJGa7tWFeXfITng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rMCXh5lcyI/4KD223irbp/iwJHL0sSbEzfWQQ1Rnuo=;
 b=hEGmAYRmu/kjlla3yG1MqXOHB6wY1zYhl0Nnf7dO858qarrfqiR0CYT8IyiunPbn9O/OOMhSRLFK/76AQiUy+zbc6h+8QOBGPKYQnu61XW9yVIm/7nUnun1IjKWZltLwH2wlTU2fML1lr0bGcF+MMN4H3ngh4D7HmNMaWiv/V5N+Rv0V16rpuw1tlMvTuh+WuWWkYBSezZZx29SwyOmcotIt9OpDy7aMm2wpVSM4/Ugh8FfS2sWOi8DGcEfVHlYAh7JtcPk+VKgKdepvEWr1xUvWD7nMTtxchAFl9jpubEA02L3hXLRrQUaPMyif6YAd4Jo/mqHkb9ywTpHWqTS75Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a8ee8082-5ee9-1073-987a-388ee2c10bc8@suse.com>
Date: Tue, 4 Oct 2022 09:01:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 0/2][XTF] build: suppress GNU ld 2.39 warnings
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f4f8dd4-cfbc-e2c2-4a5c-ef31acc4162b@suse.com>
 <bd57773b-77d0-8e69-69ad-d17b272996de@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bd57773b-77d0-8e69-69ad-d17b272996de@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: e00fa5b0-cc0a-4044-a588-08daa5d64f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1VAPhwzWWCHO3RPovIgiIQKT9RgKqVmm85uFlf/2TKgQXvXSh9Hu1CoK7mY2/PuJw9OGAkiIVC8uy/E3rnYVWOie7UniY4OjkXIx9Db3kw4JhuxYx298ESoxMNlqxq4xYVzH7DwNrO2AcgXU0nvhkPJijAD4tevelP0ddcnTlkRDT3wrH9gjxAl9hsKCnwg5GjsAGk+HJyhI/xBIFLa6SmDMfZ/PVqGBEZG3agEW2R7b08la3DgfQ/rt1kuk557J10keIE8jMzz5NfdxuBOYAXQgmvPJoEFT9JEGnEENLLdLethSP91GkEr64fagqHedAUXJTjhRWvlg8G0r8wvvbhtWQpGYgaD6Hv9ZT0K19VgXxEzv2I89ulUoe6cpaIhd30/xerbn3imay3ZdDh5j5CNURdnQ5cSw6801WNlnthK0A1XvNDbw3Cc92k6WQFxGRExddHp6b62oHfT0mgnfDE+b3/cUH3ol+JTl9GU6uRT+28Tu8v02m2zM9TzIwP2OQj9uLZGTdImVSDlDKfxlIzUMmyXQ3W3kIgfsNz8ulV8fo5HAtU2t67PM6MPCuQioPVNNaXr45zGjxBXHG+I3a2r8O7nRhJiy3wQTJsqylSzEa7VuP8iqh/8wsvKHOsVoJfiNp6O2JFwA5u69IYANMU1Jbzv9lHokSNvaD30GT2ZaHJXa7YLp/kj6CBShsUzpGoijSLAPRyvZIXnCZR8A6RslPZjb2WznOu+s+TvZ5ANsTsL/DV7/wJXYMyT+0iPlXGhdbRfZc0A1TVluhgzvULonV4XgAHmSFTL+VNJ1Mmk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199015)(6666004)(6506007)(53546011)(478600001)(6486002)(66946007)(66556008)(66476007)(8676002)(4326008)(36756003)(316002)(6916009)(38100700002)(31696002)(186003)(2616005)(26005)(6512007)(86362001)(83380400001)(41300700001)(5660300002)(2906002)(31686004)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWU2L3ZDZlhSREwzS2hpUWk3cjZDOXRndEVCWi9KbitNZmg1VU9xK1REZFNh?=
 =?utf-8?B?cHViUE5rRWVUalNsSzYrM2RvN0Y0d1JtVTdYUjFwTURFTmE3djVsWWVJcXNv?=
 =?utf-8?B?b1JCVTFZUEtqZmVWaW9IRzczZVRpZXZWeENwOWRidHQ5a1FtZUJYNjRrZ1dO?=
 =?utf-8?B?SzlMbE5KVWNjNlF1TW0zZWVhNnprNVgrQUJrU1JwWFdKWlBZYW5ONVdxdW5X?=
 =?utf-8?B?Q0kwM3JDSU8wSjdRSTJaNmJtSzJqZDZ1OWtEQ0o2LyszYnhhUEl0RWRxTkhN?=
 =?utf-8?B?ZGZ2Sk5YcUFwcXZoSEZFNmFmWUFpc04vTXVsc0hWM0ZPNWo4bnhSeW0xeEVm?=
 =?utf-8?B?Ykc0T2FhckpRdUtoM0tROGtTZ1NKMkFFeTh2WUYxak1lZzIxZUZnZGkzSThE?=
 =?utf-8?B?UmpmeldJK3ViK3BmMkFPK25iZ0hMVVVRc0tMQjV1bWJsZFR0dmFLc3R2ZDJO?=
 =?utf-8?B?V3ZyTkU0bXdJNlhNeEE4RkxRNHoyLzdRRWFoU2g0eGlCVGNzY3pBZWNkeFMy?=
 =?utf-8?B?aGVORHBETExOblFaMU9sL2t6N1Q1OFlJSzVyZ3BKaXJIdlpGdEFWUjdocUZa?=
 =?utf-8?B?Mk5IZ3RPZjRvK1duSmtHLzAxekZKQm01U1YxdzBhSnB5TG1yWmdpUHlCMGFq?=
 =?utf-8?B?MnBlZi9QQ3JrMDNycFRjNGlpRFE4cG9RNDc0TForKzM2dUdsWk9uc0lhZ2tH?=
 =?utf-8?B?Q28vbG5LNkZxSzcwdzZmRWp5eGhac1Zkdko0bXk2azE1dnB6ZkIxV0VZM3di?=
 =?utf-8?B?MzcyUUFDUFBjbVZXTThPVU8yY3FOZFBrN0pVdTZGcjlZT2R0VmcyRW5YNVpD?=
 =?utf-8?B?cmpwSmZNSEpDWmVnNlkzM2k3bU5vRkRzK2tCT3kvK1NRajhUNjJWRkk2UDc4?=
 =?utf-8?B?WExFUDN0TkREUW8xcFBWRGNtd29oUDAxUk0xUmVqUmtVTGZwNWViTkNiZTZS?=
 =?utf-8?B?eHdrRmUxZTN5WTkvT1Y3WUFicDcrWUdyUmZMN2tORTRiajRiSlpxKzFycm5E?=
 =?utf-8?B?WFdBMnhNYUdXVWt4YVRUQmp0WWNBSlhFRzVzK0FMV2tWV1RrMWFnQlpNaStn?=
 =?utf-8?B?Umo5TFJabEhoclZtUmxtcHVmelBRdkgvcjhwVVA1bEFhcStRS0JTV2lTVmtI?=
 =?utf-8?B?RFBwSlEycVpveUtwS1ZWMlVsTGtkNGlIM04wR3MzaStoc2dtdExiWkNpNGJF?=
 =?utf-8?B?ZkNzclZrV2hsUU5na2pKeXlOQk9sOVJaVklhRlFpdWJxSDR6SkJlczhxSnNz?=
 =?utf-8?B?Q0RNaWJJQ0NVbHhjQVJ1ZndZZyt3SmgvZWNHbHBjS1VITkx3dVlUeVhNSjF2?=
 =?utf-8?B?aWRIcXVGSTBFek9GR1B1bk9EMGRhVmNtWlpTMlRxbjRiaWdUcDVWbGI3MVhz?=
 =?utf-8?B?aG5tdkNUV0xKRGJzY1IwU0U1MVZZaDYva0QyODdJMFVGQThIcXZHRVNSbDNk?=
 =?utf-8?B?ZXJWRVNFY0JEMFZaSnRzVGFLWHlPNHp1cVpUSVFRREpFcjhGTU1EQ0wvcXg1?=
 =?utf-8?B?dk04WjRTN2FEZUh3SjgzemlsSnhGQW8zTXZ0UlRiQVVWNXlNWDl4cm9jY3la?=
 =?utf-8?B?aThtL1hvUnhnaGx2NFZndTJmTGFtaEhveExDbEFqMDFRTDd5bDg1TVIyK3VY?=
 =?utf-8?B?MVBSMXllR1c0THBQbnpYZW0xbDhCMEg4RGxVZHJWVkxzU1V5b2NYL1d4dFVQ?=
 =?utf-8?B?MXYwTFpEVnltd3Z3S1gzWDJ6aGR4eW1GazREUGF0MHJjcGZCQkcxYzhnRUdS?=
 =?utf-8?B?T01nKzZXQlNBWHJTazdzRnQyUG9aMnRrZ1UrWFZUaG9Dak9ZcjAvWFkrbFFp?=
 =?utf-8?B?TzVJR2xXQlI1REw3Q1pkNUFsc0htbW5PMElPaWkxUElRNWpiSDZzcTVWNE1u?=
 =?utf-8?B?UGwrTTc0Z2k0UjdtVjVLNENyQUxEaUtVckJ1TFY4cE5yQ3NnV0xjcTg4Mnk1?=
 =?utf-8?B?Y3dhdmljZVBtZ1lSS2FKdnN2UlBITE40c1hDWTRCK015ZkdVS2l3UEpPNzB4?=
 =?utf-8?B?clU5N0tkRkpzVXM0RGNlRlZ1L2hLblRNK1hiWDZ3STU5NDBwMzZlc0dFUHhu?=
 =?utf-8?B?S05WbEU4SnVKRmJtbkxrMjB2TVVpN1F1N21lSjR1RnZ2bzdsM3dTaEhSVGNN?=
 =?utf-8?Q?N2KWVroBa9zgtnUo4xX2y7s+m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e00fa5b0-cc0a-4044-a588-08daa5d64f07
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 07:01:49.5238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6C5ujYEu1kSUkXVbxWQFKXYnc5V5724lYUFVNenGbiZjpP/yqiScw0P5bkdw/YTNKQOojqDFg7sHCXCSGymWsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7837

On 03.10.2022 15:44, Andrew Cooper wrote:
> On 29/09/2022 11:03, Jan Beulich wrote:
>> Like done previously for the hypervisor and elsewhere.
>>
>> 1: suppress GNU ld 2.39 warning about RWX load segments
>> 2: silence GNU ld 2.39 warning about executable stacks
> 
> I've taken these, and dropped the `-no-pie`, but there's something else too.
> 
> $readelf -Wa tests/example/test-hvm64-example
> ...
> 
> No version information found in this file.
> 
> Displaying notes found in: .note
>   Owner                Data size     Description
>   GNU                  0x00000020    NT_GNU_PROPERTY_TYPE_0         
> Properties: x86 feature used: x86, <corrupt type (0) datasz: 0xc0010002>
> 
> readelf: Warning: note with invalid namesz and/or descsz found at offset
> 0x30
> readelf: Warning:  type: 0x12, namesize: 0x00000004, descsize:
> 0x00000004, alignment: 8
> 
> 
> It's only hvm64 which reads as corrupt, so I think there's some
> collateral damage with the conversion between ELF64 and ELF32.

Iirc there was a binary-incompatible change (accompanying an
incompatible change to the ELF spec) to how notes are generated /
processed for 64-bit objects (some hand waving involved here, as
this did happen quite a while back). I assume the .note section(s)
will need converting (to insert / remove padding) in the course of
converting between ELF32 and ELF64.

Jan

