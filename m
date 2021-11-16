Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4A0453402
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 15:21:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226304.391018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzKP-00084y-0s; Tue, 16 Nov 2021 14:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226304.391018; Tue, 16 Nov 2021 14:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzKO-00082K-Tx; Tue, 16 Nov 2021 14:20:52 +0000
Received: by outflank-mailman (input) for mailman id 226304;
 Tue, 16 Nov 2021 14:20:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmzKN-00082E-Kf
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:20:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6663be78-46e8-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 15:20:50 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-U4AUoh_jOx63D-956Bntrw-1; Tue, 16 Nov 2021 15:20:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4606.eurprd04.prod.outlook.com (2603:10a6:803:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 14:20:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 14:20:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:20b:110::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Tue, 16 Nov 2021 14:20:47 +0000
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
X-Inumbo-ID: 6663be78-46e8-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637072450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4YHrVYXhFY8N/CjkmefMZHQwY68DAEjz+e6XBcKGUEI=;
	b=ARLfkKJ+krOTQiTVlhP9OJ32RKAokKf6SjklqV/0Bm1Kv3959XOd8dHn+U/DPMz3cBtqfU
	mm1wZK/4cy0yw2IUAvUEOLZtvwK+Eb41IC0ttcdZCR0qMhnc3GsR/IDWuRUb2L+PBOFKYt
	QuLQdSzSpbkXIFJIh1mSCgCncXNTyzU=
X-MC-Unique: U4AUoh_jOx63D-956Bntrw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9IPuRuOzySy7nHljyVABQho0HtD1N93908eJIKy/zpAmJcNw8zATRGxxn6JzBaEKp2WYifVM4zG/gYyRKAQQdnob5psEYBzcAWwq6wGjhYzTkPtHovcrj7jXkHuVrHV7plHc+n0AegHis9tXeppQxjolM6foVs/N41GsyVotxbhb8NeZ/9vvUYS2aReqaq2DUfA2dSzcWL0Z2nPwYui3vcjiPiDsIU5zd830IT/qwaSiPsCqJOzsAHkcmYt6okl1l7SZJTFrSfWmEBoB9S/l5dDZ+rc1SEWgxeO6NUZdQI/mgxk3ZpQog8IVXKR2Jb87f6nGOYiBO3Skx0ZuqLyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YHrVYXhFY8N/CjkmefMZHQwY68DAEjz+e6XBcKGUEI=;
 b=E1IFJc2cQwseS/5CNlnMCp/m8BzE7u1m80ptPWVz52I5SCCdn5eYyL5Ci0r4iUr1eIqzJL5+BxHxfW18p+1/xOw0WfHvqyPSwZAIY7aRSAGFpLWz/NGaESb6/RCfeetV70K/SwvBhhl3k20rJ3U6FRyqeQNPzfJT1TAR/azyEC63x4MQo32eSAORy4/J69FoNEi1L3xclSHtpAtQExeI1ZDzBCYE8w0qvBeYsrKFv3U2ZfwVTUk/LCWVrDMB6hL7xxmFKgr0EQUpL6bmKla0ieANYvtgl40aILZ224PgFGCczomixB2Ht794gNWOw+0EXNRaaZz0mZKsXoUICdHBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <570d6aad-764a-cdb1-5aa2-dc9a9744907d@suse.com>
Date: Tue, 16 Nov 2021 15:20:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 0/6] x86: ACPI / APIC / IOMMU interaction
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <e1efcf93-b633-26f2-31f2-9ee53563a41b@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e1efcf93-b633-26f2-31f2-9ee53563a41b@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dee9f26d-9489-4f16-efd8-08d9a90c48a9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4606:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4606920CB38FB9BBD536AB35B3999@VI1PR04MB4606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MgXfgHt9Pnjadp9viAPYLYffjK97JcWpG2QT1iDJORP8WpDjnMsq+vQouHT7ptOSzGwWt1B3j3maYDftK764wlWi5lTzlSPPtVYxVFk10/xoH6is/OHdJgeTZcj1u+15sQwEqm261XFIl+qa22ridx6OCHsxfr7toDNL+yUd9oSCw0xUFrf64noCvC1CVnxwAIEk58XUqTvxi8C1UQaUAHMQKFSWHnMJhZEHOkcbAP5d8i1nOY/sREsdPer5Gbb7HvnGaFEYGuVWhskbCIKji6DqHItjBH6Ku0jQ86GGfuOP2KXnVpldGC1E665rZpRSKzYxLZUTOygexFhr6vugvjHVT1Rt/4Ubm01CmH6ooM0vqZhpJAQJcMqcRKIQoqjpKSoMQPV6xvnIx5UZ3FscNqnzkxpYlEjmBujE8KBmatoLZWm8U+vHSRTDC0Q61Vk/NLUiGbpbu+FDmNyaQaVp55wCzYQDlW/KmPr74cn2xHg/eFIxf4pOpZrbUEuttnOkL7k5bSolVzQzSAr2x7+IX3/umkxIvo7Lph1ma+WrvNqXuH5ReGHoQTAE49igLdo28OXn7eEq6FJgC5nCO8R2DJjxhEVxQt3O8VI0ex+PJJs1JnQy3JxLn9VYPvdyKU1+B1dpazZx2cvZvFKGCwJDgERQzrWUYJxGXB0vhSWKUC3on8lq7QpJgLcU6yyGZGmnxmPH50ZXNBe+eGe2xWpp2ohYyN2GJrwFqtm/4z8FVRV2K6ILAEWV67Vc1PtN+lG8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(508600001)(6486002)(4326008)(31696002)(8936002)(6916009)(956004)(53546011)(5660300002)(66476007)(16576012)(31686004)(2616005)(8676002)(316002)(83380400001)(86362001)(38100700002)(54906003)(186003)(66946007)(26005)(66556008)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3g1b2pxeUwyMnFJbHRhZFhER1I0M1RkQkMyUVhPZi9LSmtzaHZpVnFTbTQv?=
 =?utf-8?B?a2ZLQURVZHJLaDhHT2lBY29XbHFMMGtrUmIxQ1RPd3lSekJ1SFVZWXRWdUV0?=
 =?utf-8?B?MnU3MjM4NG1BQksyR05NS05vdnpxbDJITi8yTlBwb0pTMjdSOFh3cTZtTHpv?=
 =?utf-8?B?R3poWVZDTFB0SXVXbjlFcnFzNHpqQnVZU3ZIcnJqT2k2S3hLMGZuU3Q0a1VP?=
 =?utf-8?B?MkRLVkFjZTFlZ3I2aUpXdytRSHlMZTZDdTJVaFhVRThqMHloNHBSYXQ2Sm1C?=
 =?utf-8?B?WE1ZL1o2ZkY3Mmg0MmdPQ29hMVJzbzZ5NnFPZEI2QWJuM3BrcldPN21SQW1D?=
 =?utf-8?B?eWZXRjJocW9UeTRnNTlXU3pDY0dyR3RCcHVqcTVWcmZGRkRac1QwQ3V1MVFJ?=
 =?utf-8?B?MFdBUEhVUTdwS05lK1ExQlhxSFVYN05YUU5xeXZpbGdRaWZtM05pL3FZUzVE?=
 =?utf-8?B?allXYlEvTXovQTVXY25jT2NxYWlVRWU4S21jTlJaVjcyR3Zyc2xleDRyTlJK?=
 =?utf-8?B?RjVoazFId1MrTjNMbWUrTTFEeDVMdjYwQ0dFVUtPZnhpdkdTUm5idVNINzh4?=
 =?utf-8?B?WCttMTJhN1Z0TW00Q09UUVBVaWIwekdxbGEzRkJGU0NseUpwcE1takpDUENZ?=
 =?utf-8?B?eFpkNnRmSTdyQkdYK2xZYUdKUnlmUTRKN1R3MzBmajZkdEFXVk1mQWxqenQ3?=
 =?utf-8?B?ek43Wk9UemdtVmhXWTlDYVJqNU9GK3dDMGNzQ043QzRydC95N1B6Z3Jmenkw?=
 =?utf-8?B?endRM2xIVlg3N3Rvd3VrSHJTazFkWFNGaDFPQW5DZVBZMWVWRlBRamFqU2tF?=
 =?utf-8?B?cTdSSG0vWlovWEtSUG8zTjlLbmZLRkw3UUJHdnplWUo1VDJBNVc4ZVZKQTFv?=
 =?utf-8?B?UXdad256ME1ycVM2VHE5SGgrRjNadHg0d1NOMjZhbEZwTHRjcitMS01nN1Nj?=
 =?utf-8?B?YW13bHhpZ1NpVGJFVkJOcXlRZ05LOFArVndlQk9BUm9xaTZzd1VlZVFsNmM1?=
 =?utf-8?B?aGF0eVl0VTJCUW9qSk9jb2xwL2l2UzFsME5rcmRFWHVVQit1TlptemVHU0pH?=
 =?utf-8?B?bW9pL1FMZUN1Z2FaYUpzQ3NoeDBXNjY3NDEwZngwd3B4NzhEc1A3cHlEMERW?=
 =?utf-8?B?T3NwK05OKzE1ZFhNeTNjTVU3NE1pdEVjRHBsWDZ1aTJscGJaZTcrQTViZVow?=
 =?utf-8?B?ajFsL2ZlRjhqZDNsWmRybXF3NVEzTFNiVlBaYTUwZkFNcXp0enN4SkFyS0dE?=
 =?utf-8?B?ajNtSS9uYUl6dGoyb2M4S3RxV1hJcGxLVExGVjdnMXdScnhwMUJka0Iyaitv?=
 =?utf-8?B?ZWFmQ2RUWGx1R09YdGUvZW1oaTJHVWZTMmFQV1kwSXBtcFdBbVZ4Mk50RWVO?=
 =?utf-8?B?ejBYbHBNaWJFZ3JDbTNjeXBsNFNwKzVIN0ZwTkg1YndNcWM3TFdXUUNrckFa?=
 =?utf-8?B?TGVXLzl0eVRIVjcvT0RRbjBFdjlRS3JRL1J1dGZZTExDNHVyOHQ2RkVHMjBZ?=
 =?utf-8?B?ZU9BY3BSWFRZNEtWbnNxcmkyZ3dFOUw1Q3ZRTzl3aUhNa0VwREdTTE93WUJQ?=
 =?utf-8?B?NGFBUk9YSHIvcDhTZ0NXUk43YXlHMHFGTXByOW5JRFgxU2FubFZJQ0VORHE3?=
 =?utf-8?B?aEFGMjg2eGRNM3BwTWZ3L293WmdnY0wzYUtNSGYvckpFTk1Cb2hBTCtia1Jt?=
 =?utf-8?B?TTAyRjVlNWxYSTkvTlpVU3VxOW1WZ1ZzaWQ3SWpEVW9xN0daeVVmMnMrVis0?=
 =?utf-8?B?Y0RRWlV6QkkxNld3VFlSaWU3UEFhRzB2ZHZKN2dzcndLY2JCWHdqdGRZNnJ5?=
 =?utf-8?B?WktGbUp1ZGpzc3NKcFF0VVFib0xQeVp2VTYvN3kxMW16MFJDenRHUUJMYk5o?=
 =?utf-8?B?YXYxZHpLTmdGRWVHNGsyS3dEdUxFcDZSODBWaURWTXJxL21NTlFwdXBRZXV5?=
 =?utf-8?B?WEd6TUlYbnpQTkVPdlQzV0l4TlRVbWQ1NTRWZ3ZzTFlUOXYvTFRtei9uUm90?=
 =?utf-8?B?bEdpbytGdzBaOUo4OGdUSDBPZFhtdmNmTG5uY0xVODNzNG13RFlPZnFlNDRH?=
 =?utf-8?B?UmorcUNBdHN2dGc0dzYrVTRtUVgyUUY3dEhVbVlTSWY0eFhhM1R3TVo1Um16?=
 =?utf-8?B?Sit6bGZPUnZUbHNWV3R2MG1aaTR2RE5IQzU4dnBCV3h1S0tERGtzNTBTZ3FI?=
 =?utf-8?Q?jMMJ3bt3QgIg/HqNGE6/jKs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee9f26d-9489-4f16-efd8-08d9a90c48a9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 14:20:47.5203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgCohdUeoEdp+ShgTsyq4VYaemh9hmK3ioQ4Hx0taUKrj1lQSJ7SJQ+VqcFaGW4vizS0KL1g1rCXKNXghDNU2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4606

On 16.11.2021 13:09, Andrew Cooper wrote:
> On 05/11/2021 12:30, Jan Beulich wrote:
>> While reworking patch 1 (the only one here that I consider a candidate
>> for 4.16; see there) I stumbled over quite a few things that have long
>> been ripe for cleaning up. Hence the tail of 5 further patches ...
>>
>> 1: x2APIC: defer probe until after IOMMU ACPI table parsing
>> 2: APIC: drop clustered_apic_check() hook
>> 3: APIC: drop {acpi_madt,mps}_oem_check() hooks
>> 4: APIC: drop probe_default()
>> 5: APIC: rename cmdline_apic
>> 6: ACPI: drop dead interpreter-related code
> 
> Patches 2 thru 6 clean up an area I'd recently stumbled upon.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> Patch 1 is looking very risky at this point, especially given the late 
> correction, and I think it would be wise to wait for 4.17.

Well, that's also been my takeaway from Ian's responses so far. I did
put a question mark there because I wanted it to be considered without
meaning to actually push for it.

Jan


