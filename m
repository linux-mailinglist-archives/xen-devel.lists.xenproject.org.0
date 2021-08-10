Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391CD3E5489
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 09:45:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165283.302078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDMQw-0003Up-KY; Tue, 10 Aug 2021 07:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165283.302078; Tue, 10 Aug 2021 07:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDMQw-0003SN-GB; Tue, 10 Aug 2021 07:44:22 +0000
Received: by outflank-mailman (input) for mailman id 165283;
 Tue, 10 Aug 2021 07:44:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RCh7=NB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDMQv-0003SH-EA
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 07:44:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71b7fb58-4b2c-46f0-8e52-de527ec48adf;
 Tue, 10 Aug 2021 07:44:20 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-IRWD3rT9PpSTV8Zd-yGR4A-1; Tue, 10 Aug 2021 09:44:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Tue, 10 Aug
 2021 07:44:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 07:44:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0147.eurprd07.prod.outlook.com (2603:10a6:207:8::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.5 via Frontend Transport; Tue, 10 Aug 2021 07:44:14 +0000
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
X-Inumbo-ID: 71b7fb58-4b2c-46f0-8e52-de527ec48adf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628581459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ICUI8qVoyRXs0bBz+bRZDKwGe6uOXeYotQcl3ORBBHY=;
	b=QmSuk7owQaVD4Rtmb+w+16xy6Q+gJsHxC+APhkwCeE51zwBbahc0ag2lTnAxCTO2UiLWeq
	cyxw8KPOpzZML1mZNzfgYGO9XjzNaGsAM87QvVok+sidToheusPjR2ZNQltnG9SuwAmSVE
	4piPASKIsM5MOq2JEY3ElC83mizqNds=
X-MC-Unique: IRWD3rT9PpSTV8Zd-yGR4A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0fNVIyqi+nLqKkaQzEjPsd/K3m8DTXiHOcyrjfzks2xbh/rL9/mbS2wWTvIBpE6tq+Hy5ZqAQyRpLCfnRt2YHMlbtEZpKLo/G/8w1tw5Mjr9PXu5UAoQzwYX8Q5QvYAMLsQKdjIPbBrLL6lLEpA4FJqoUnjOicyVjGeWvrm12eBW5ZE6uSPTRZnMQxmF5P2JicbcHN4bkxYgPTnhw6/vzxvkjlx6yjT7kxNxjAoDvbzbnY7K1MHob2bmUZIIoQeBZGbjBQ8Rn8edlmFintBVVPnLG66wqqNhN1lgA/QPE+T+FnbKgAv9s/q/4DGFXjzz1FcSn8YH5VO+Psa6za5+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICUI8qVoyRXs0bBz+bRZDKwGe6uOXeYotQcl3ORBBHY=;
 b=luROPZRTWVI1jdmmvwThBpUm3/Yn16jqOnqjXX0M3hyNGlzHhnC1CM8z9g6kRnSznGmyoAaTZ5AKADZb6ST59BuXrwuRwPV9DlElQKVlFZxIiTLYyxwqf0MQR+Qk90anLknQo6s7YuN1tYNwCJT8Hj9HTfusDP/P5iOACBU+qpB7yh9faqZuImiba4MwffECY8fUOVRZdSimQ6G5pRk3HDOR4QBEh/12oXERAakJxiXEFz7CKa8VMe2diwiDgE0CctuYTVOxZxcLmmjwJMEPjnsNlKUNwfhp4Qqemu+UYH0Qdu6d0qNGv5nmX2OgKCIYXnGMSBQ6bEklcNEN2tqnZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 21/31] build: set XEN_BUILD_EFI earlier
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-22-anthony.perard@citrix.com>
 <791838fb-b69d-d471-cfff-fe984e13f6e6@suse.com> <YRFQ5ufigapRnXgr@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <82429ede-6bbe-ee51-861e-cd8d0c627311@suse.com>
Date: Tue, 10 Aug 2021 09:44:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YRFQ5ufigapRnXgr@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0147.eurprd07.prod.outlook.com
 (2603:10a6:207:8::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3d244cc-341e-43bc-ff35-08d95bd2a6fa
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6477792E5BEA3A692C1041DAB3F79@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kdfeMDx4I+r6qvikv/QtMQcijAqrGkoKkvWebL88+8TRDanI9/HKebzaxDzgspD/NUXfb3EAcEaRQ3TW6D68fg6y+m8LUcw8nnHeYHFzA8cAIFaPPEWY84IWX736g3nKgjMFIeBmOXA/c7QG8mhTgQHLoWO6CqwMhcAJloxu8w+CyBk8t1h54GtnI8FHbT7+YrwQ0E18St1KSiyZZhU6Caq42rRHAR0pe8m26Dj9HahcU7qxnboaBbiPKWW7fwbD9jApry3HRQVj2KKprQoBRvG2at9S6jPq/BcfH5KIc+Wg2xw6pdYVsAffe3/3PGYZTq5Dej7gXIhVyXlv2HP36Xc5eX68MM2mgUdsgx/QiHBh+PLRV8RF9A61lDvdTiD0NWPlJkLUSTn0hbYYEwCG4p4KLRd6TkKU0G4F6mmYKD2ON19JRm4gBz/o/dBtvFKlM8E5eSSibC0EoKZrD7o92/63wkickzgk0PEkRC55PCQYpd+LhgGaualyuaexY0nlNvY1d0UNAJcbpddJzJUHWn3GXGj7WVOCeTe/0lmHobHg2ougv+kZBtfZQN7ildVM95XV4nYqLvrKiX1x/xYbVcvy5PDDrhY9z0y63BEBwEH0jjDLznEpisThAOMG1/aFTNWLwHeCfGgT4Ca6HLVWTrm1cuiBZ+HnCqFz/sMCxpKr2XOloq/7quSaNQf77fQ0uFTVPZiR98GBMzIf5+wvaN4j2wRNzEoziz6T1oFNOc8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(39850400004)(396003)(366004)(186003)(26005)(36756003)(6916009)(2906002)(38100700002)(2616005)(6486002)(53546011)(478600001)(5660300002)(54906003)(956004)(16576012)(316002)(8936002)(8676002)(86362001)(4326008)(31696002)(66476007)(66556008)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3JhOFJnZWtGQmlnQUE5aHp2WVZkTU95bU1Ed3k3REQ0ZE14Y2lDeHc2bGZD?=
 =?utf-8?B?ck43bjBlaUs5b09oaERDUWJXY0xSTGdzWFlEemVvbWlQeGtpZ1BlMGwvRjFr?=
 =?utf-8?B?Q0xFdlEzTXBqa0FkNElTaDdlcktxZzZRTHFKckxKdlB5WEtZWDhHcVFtMmxY?=
 =?utf-8?B?d2EyRlhXWE5JTDM3aWszaCtPWDEwcjh2YjlCYm5aNXd0eHFucjVKYmNLRmVo?=
 =?utf-8?B?d1J1M0dTQXdzQ3pxL3doR0x3WlUzWG1YYVNDV29qSmszdm01VmpwcjdwZkEr?=
 =?utf-8?B?ZC9sNU5rVjAvRm5NYlJSOHdoR0VtTlZML2tNRW9ObEU1alh0VCs1SEJoaStL?=
 =?utf-8?B?bEdsQms0L1E3bThXVUdIcjVJUWFOOStuT0R2TVhxSHdNWS9oWTYyTlNtVWt3?=
 =?utf-8?B?MXNzdnV0aDl5V0J0S241SDdvbHdTMzE2ZXNRQTNOWSsxUXBQdDZHVGFjSi9J?=
 =?utf-8?B?QzVwNEwveldqaE4yR0dlR1dUdFZTQzhFU3QrTDZsNVdyK0V5bWUvQk9GMzgw?=
 =?utf-8?B?TDlRMmU4YURDWHBlaHFnc3ZpbU5Ja3pjL0RLcWRmMVJ2WUFlemNtWWx5blpW?=
 =?utf-8?B?Y2llREt6d1ZUcy9zQlhxQWRoNG02eHdwUVBnNGhaUFA0WmQ3YjBJbkY4SEx4?=
 =?utf-8?B?REpZRlljemJORXJlcnc3OWpTZm1LcHFKZWZLMTYxdnZsQzE0dUNRTWdvR1k2?=
 =?utf-8?B?T3NkVTFqd2wrNnRJV3JYTXlYdG15MDljVHNQVGQ1UUovY1lja1J6a0hkN0t0?=
 =?utf-8?B?UUxFNzFqWURIbllFSzBXL1lrVWRUYXdFTzhSWXNuWjB1eGdqbERKa3MrWTlJ?=
 =?utf-8?B?L3VGeGE1T2lBemZNakV2K3Z4UG0yZUNBWFBXSnRod2Y3WnlqNmFvMTFiQXlB?=
 =?utf-8?B?OVJTTFdQSDhNR2dYc0NScmlyVUFERmkzcXFqa2Y1TWt2cVZ4SzNxek1oeURp?=
 =?utf-8?B?YkdQVEZYc3FHSE12WkwwRTVJQ0ROTVFqZ0tEZllvbUJXRzlPV1VPaElzV1BE?=
 =?utf-8?B?Yy9BZ0dTKzRPNXFYYk5RYjBrVmwxS3dqUzl4UGRWUUUrbE1TZkVQUUxUNkox?=
 =?utf-8?B?VkErVno0VE9BRWtBMkVmMVg5K3B4T0dwV1F4c1NBdkFRQXFTa0xjUWpON2N1?=
 =?utf-8?B?WjNsWEhrV0QrZ293aXU0UVJrdGVvNnBtUWx1YjR4c3ozTE1rWHR0MDBLaUx5?=
 =?utf-8?B?WnJyMUlGdTI2UUNJa04vQysrZnJBT25XZERCWktOZWJ5bXd2RU50MnFLaksz?=
 =?utf-8?B?Ykxtemtnb1NJbnNHeENkQXEwVVZDc0dVY3NpakNaeFV3WVNReVNQWlZjaUpQ?=
 =?utf-8?B?RmN2b0R5M1pOdlF0SFpQdUl2eWlsY3NRQm5XTjNCSGVsQjZpL3dlTmdmb0Ju?=
 =?utf-8?B?czlpOG91SmpDbWN2SXZjM2UxSys2dmthc0xyeW1ZSkpMcURhODZ6N3duVkgw?=
 =?utf-8?B?emlzWFNHODQrRSt6Q0F0YmlGcTJKdEpPRmsxWDlGUnhSUEw3V1p5KzNmYWt2?=
 =?utf-8?B?a0dZQUl6TXJCVzUra2JNa3QxVm95RHAwb015aTFtcFF2TFo2enpUTDBZOENp?=
 =?utf-8?B?bGF5MnB3K2ptbFFGYjYySTB0elc0bmEwN2ZJL3ltTlNGS3IyWWFwR21SUTR0?=
 =?utf-8?B?RThJRkNTVGs2cmNJTE5kT0VPcmowcXZrRlIya0JPbmM4Q0hHZVhhK2s0QWp1?=
 =?utf-8?B?Y3Jycm0rM0cyc01YWThoc0prYkR5amtCRGRFN1VoL1F4eTIwSWE5SDE4bjRU?=
 =?utf-8?Q?f3tfnaIhI58YOEmJa/fp1ShrO+4zCdDFN1wcJ4E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d244cc-341e-43bc-ff35-08d95bd2a6fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 07:44:15.3382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYIiEoImWesDPFwWyQkCzxkfY7G1a0+2fC165LPt0l6+ZmE29Q2AaqNuXFYNcxd3Axw0uaaO2fQuZrxCFrdLvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

On 09.08.2021 17:59, Anthony PERARD wrote:
> On Thu, Aug 05, 2021 at 09:27:18AM +0200, Jan Beulich wrote:
>> On 01.07.2021 16:10, Anthony PERARD wrote:
>>> We are going to need the variable XEN_BUILD_EFI earlier.
>>>
>>> This early check is using "try-run" to allow to have a temporary
>>> output file in case it is needed for $(CC) to build the *.c file.
>>>
>>> The "efi/check.o" file is still needed in "arch/x86/Makefile" so the
>>> check is currently duplicated.
>>
>> Why is this? Can't you ...
>>
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -126,7 +126,7 @@ $(TARGET): $(TARGET)-syms $(efi-y) boot/mkelf32
>>>  ifneq ($(efi-y),)
>>>  
>>>  # Check if the compiler supports the MS ABI.
>>> -export XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
>>> +XEN_BUILD_EFI := $(shell $(CC) $(XEN_CFLAGS) -c efi/check.c -o efi/check.o 2>/dev/null && echo y)
>>>  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
>>
>> ... use here what you ...
>>
>>> --- a/xen/arch/x86/arch.mk
>>> +++ b/xen/arch/x86/arch.mk
>>> @@ -60,5 +60,10 @@ ifeq ($(CONFIG_UBSAN),y)
>>>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
>>>  endif
>>>  
>>> +ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>>> +# Check if the compiler supports the MS ABI.
>>> +export XEN_BUILD_EFI := $(call try-run,$(CC) $(CFLAGS) -c arch/x86/efi/check.c -o "$$TMPO",y)
>>> +endif
>>
>> ... export here?
> 
> The problem with the check for EFI support is that there several step,
> with a step depending on the binary produced by the previous one.
> 
> XEN_BUILD_EFI
>     In addition to check "__ms_abi__" attribute is supported by $CC, the
>     file "efi/check.o" is produced.
> XEN_BUILD_PE
>     It is using "efi/check.o" to check for PE support and produce
>     "efi/check.efi".
> "efi/check.efi" is also used by the Makefile for additional checks
> (mkreloc).
> 
> 
> So, if I let the duplicated check for $(XEN_BUILD_EFI) is that it felt
> wrong to produce "efi/check.o" in "arch/x86/arch.mk" and then later use
> it in "arch/x86/Makefile". I could maybe move the command that create
> efi/check.o in the $(XEN_BUILD_PE) check, or I could try to move most of
> the checks done for EFI into x86/arch.mk. Or maybe just creating the
> "efi/check.o" file in x86/arch.mk and use it in x86/Makefile, with a
> comment.
> 
> What do you think?

The last option looks to promise the least code churn while still
eliminating the duplication. So that's one option I'd be fine with, the
other being to do all of this together in a single place.

Jan


