Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3E03FDD41
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 15:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176422.321041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQYg-0001Xi-N9; Wed, 01 Sep 2021 13:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176422.321041; Wed, 01 Sep 2021 13:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLQYg-0001Vw-Jj; Wed, 01 Sep 2021 13:45:42 +0000
Received: by outflank-mailman (input) for mailman id 176422;
 Wed, 01 Sep 2021 13:45:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLQYf-0001Vq-B5
 for xen-devel@lists.xen.org; Wed, 01 Sep 2021 13:45:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4bd0fda-0b2a-11ec-ade8-12813bfff9fa;
 Wed, 01 Sep 2021 13:45:40 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-7b8lZMMcPm6vtlABb0kWiw-1; Wed, 01 Sep 2021 15:45:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 13:45:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 13:45:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR05CA0124.eurprd05.prod.outlook.com (2603:10a6:207:2::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 13:45:35 +0000
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
X-Inumbo-ID: e4bd0fda-0b2a-11ec-ade8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630503939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h++qf6KL033IrhpD4G9A6T6GzqjOOh03iX8crHOUczI=;
	b=gkCU88ShhK9ERjWmul6HOvfOC+Gqj0MyoxfQqpDYrS13bi1SzLhEXzMv9oRTXMWP85qhuA
	Qlf9GEgda3jyo+kU5fCnH9jH/tE271AB4yyK07+p4TTpVMH+trKSlQBJ16lh0dKD0oOMe8
	C72qUL1TzjLQez44b8Qld6r4Un4MO9w=
X-MC-Unique: 7b8lZMMcPm6vtlABb0kWiw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuXJfWY0amJ91RgzcHI470nvMF64yGQ3cnRte9BYhY/5ix/pOgT3/l0WrDbceGnUmo91wGrHuAz2ESz8JkC1Sh8jrSRmqDh4KYDpZ1eIRMfLWOOf99ySvgQw1dYfvX0gF8qmJNs6Z/0Uj0tuoymOjQA8K4uGWbRY1riL+t0/mz7SppE4JRxe4DlaYP84TdcFq5VYXG2jZKPfAmLS+8S6i8mcfKyU9/7bOwNidn702QFEghLyJ7FJ5vA0FCh7wpiO7PRwEuYnAuXVUVnWU2xpHs+x4YAEs0yicOzxhiWXy/0pTtJockM7kiwuBITPfn5DDIDHOg7WgfY9PwSi+2DQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h++qf6KL033IrhpD4G9A6T6GzqjOOh03iX8crHOUczI=;
 b=Yg5C7l/JK4Ol2KDRKt/3rW7rwD0yAREQK9pb7+YNteb49CiX3W7dgtCkSoZXxPXl/CG43pmRZa2bDhM/9rtG2H5NZLNWCCe7bzauDkavAf/I7jlu0fM8RvwNJjntpjwiUq6I18jryTq3tR8UYPtqlGv6YhyyK1w6OWqHb2NhGd76NxxcnmCdn6MuWZdB3Ja+1PXVkyqMUSKPZH44rD/6yRYJ99P3UyB6HcNO7c8irErHf/ZFNCpIKToebI6L/MQfAsGQ2tU+3d/lFqF8XD1ymo5vwwqgHpxImgo/vg5+8WFdDDjTE5Xh5j4JlJTbkViITH3Usmu60yc6X93gCsD8rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xen.org; dkim=none (message not signed)
 header.d=none;lists.xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: Xen Security Advisory 378 v3
 (CVE-2021-28694,CVE-2021-28695,CVE-2021-28696) - IOMMU page mapping issues on
 x86
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xen.org
References: <E1mLMZy-0006TJ-Rw@xenbits.xenproject.org>
 <CAKf6xpsAz7oPX+PdZokm+BAqreqL8rnrAd9UYvdz=F0M-bcMUQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <367a756d-9a14-6970-3820-d863a998583e@suse.com>
Date: Wed, 1 Sep 2021 15:45:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAKf6xpsAz7oPX+PdZokm+BAqreqL8rnrAd9UYvdz=F0M-bcMUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0124.eurprd05.prod.outlook.com
 (2603:10a6:207:2::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60b81f1d-a3fd-4b7d-ba5c-08d96d4ec6d7
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23348D16AE16713AB275AF82B3CD9@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lm9E47T5e3pNBd3xexBskqnLAhkNqfNUfcAVkxdv1rgj+8PIvqVOEWIPYuU7Fl+b9/k99CnB5SbWShUlH8THGGhJG76BHpPuSrk9qP4EwlQ2R9zUVDP8W0gA6g6S/jis+ex+HrTqmQNvY4b3U2KPrET/jKVXRk8TYJal/SiVoAkWBv+x/PHgNvcYU23rrUZlczfcFhwN1suGbAYsFBxbHi9L601qgx2irA7qTN2RMvfCupv0SKyko8bxMRq3eM7+GIxGqnWNHtxjG9bEEGYLkMyhMT0tOlu51cFh5XJLg170o0zhcGormi/tSFCPhe1lNS8AT0x3BY+LK/Uovi9a78O1lf5kq2gthBCWHw5chw0gXvyNjN5e2oAwKQWcQF3iC1ERfcbuQttqnuSThAVO1OG/vzL2gBeTNhiMvseOCVJEai0cz8OwvTlDk+50lg9OeyfLsJTobZ0YKiFdRjiwzXX6H8F0UM6pryJmQgsPPM61Ak2s+4Aj4xKaNmTRmHdBxp/FLb/31Ws3LPDLvkvB3DbTnopy9KqMh2eBIBcOzrekaKz+54i6aDudZvWQdcmm7mjrZmzYnSl7sJofZ+u3ZT2w0d4w881QIPzCPfQrWQzA3kVYBZObwdXe57aR/H6bl7QEmwmIVxjAohBODGndHfu2tcaMdgMlC6R3dEC7mpYVDvrGYfYTtkfPG4XpaqJIx/wed2riSh2tadnjTaBxVDWo5EHVQrUHX66VKdnz+QJ9B2T01ssQNq/j2j7uJfWJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(376002)(346002)(39860400002)(66946007)(15650500001)(36756003)(83380400001)(2616005)(956004)(6916009)(4326008)(16576012)(316002)(2906002)(31686004)(66556008)(66476007)(86362001)(31696002)(53546011)(5660300002)(8936002)(26005)(6486002)(478600001)(8676002)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHg1Q3BVeTJ2VTlaa3lING9DSW5oblhnaXh4QTVQbHAxVlpPWDhuRWNWbVc5?=
 =?utf-8?B?aU12SGZ4bzdpQ2dXM3JRYnhSNW95am1aVjlzWjRCNmduaUJ4eUR6MzVNb3Bu?=
 =?utf-8?B?QkZrY1BkTkxmVS82aHd0cERyMlJrSEcrMlhiYTBVamZHUXZzalJramhFVHdP?=
 =?utf-8?B?WTJCZFZoOFZncCtCWkFUL3FuNXgwWFR5bGNVUVgrS3ZvL2RSSHRMYVVyVE1o?=
 =?utf-8?B?cW5SWEE1VjdiOTNWYU95cWxndDRnVTI3OG5aYldsbzBLb3dNN2xBSWxRc3Zo?=
 =?utf-8?B?YnJVbGpJWDJUaS9sVENyL1IzaEpxK011SmVNQThnZGNEWU0xalhiUEplcFBO?=
 =?utf-8?B?QlYxTXk4c0dMdWJhZTZJYVVrODNvbUpvcGUrR29nWWhYZVU1WEhrUU85Sk9I?=
 =?utf-8?B?emVwbCtrWFJleUFuVVgrUCt2eVZGYmk4QWQxTmk1aXFtTElpTG5YUm44R29a?=
 =?utf-8?B?UWdrRFdLL2JnRUw5SmhBdzhKR2szY3FsMlQ0b2wvcHdzalNHR1N1Njdad0x1?=
 =?utf-8?B?UVZiYjBueHZTRmEyektWK0FhUXpYL3RIV09ldGdzRzY1cEN2eTVVVEgzREVQ?=
 =?utf-8?B?aHdnZ3IxbUZDb2RrS051ZDdTRTY0RmR1cFZIemMrNXZneFQ2aWRyaGVOL0dp?=
 =?utf-8?B?cHd5NFo4M09OdVlCWjBKOG54MVgzOXdMcU5RWVR3TnF4RTF4K2p0Wmsvb2Jx?=
 =?utf-8?B?dE8xbEpXRmgrbUljc2Q2SlNRVW5LSkFiZHNyRkpwQXV0ZTd5cm9QT2hKelIr?=
 =?utf-8?B?SUVVY3c4cXFqUE5QclA0YTluVnNtUVozT25sVXQ4bzZzcGVXdFNNQ1pGcjBR?=
 =?utf-8?B?RksrQTBiN0x0ME14Z3N5dTRlTXIyOCtYSzdLUWNuQ1B0M1FhUzBXQ2c1Qm8y?=
 =?utf-8?B?dlNUa2ttMGxMVHR5bWVjZkU1V2NHU1puYVFpaStQUVBFQ0huZ24wWVpmVUNk?=
 =?utf-8?B?a1kwaVltaVUxU1crV1ZrUkxNN2t6SWFTUTcvKzhxcXRCRm1COUNiY2pyRVNj?=
 =?utf-8?B?RW04ZGZyQnFvU2lXdGMyV3lJZFRCUUZyQ2xvMysxVXVIdDNYTlhCRGY4S1Jm?=
 =?utf-8?B?SFpNR0IvMHV0Uzl3WnVkWnRWWVFKSE5ZOXdvY2dOL2NyZFhZUzZQd1p6SWQv?=
 =?utf-8?B?THJERDRpUEl0N3VZWUJJVmdFVFlJVnhSMkVCc0FuczJHUDMyT2oyeW10bnp1?=
 =?utf-8?B?US82N0U4Mkx5UjkrbVlGemY1WnNEajl1OFdSbi9kdU1CdnZDOVU3MzBCSEFF?=
 =?utf-8?B?KzBrQXJNWFRHa2c1L1FKSU5YY1lqVzVETksvTlVtcE9pditHNGl4bEdKTzdH?=
 =?utf-8?B?cGRnT3JRUjVRTXR1b2F3SFhqcis5WHZubGlxdWZSSnRKMldCRnFGaXZhZnBO?=
 =?utf-8?B?K3dwR2J6UWJuWmU1SU5YTk95dkU3SmVQMGxRRkR2N3FwdDI3ZFlFcGdMa2oz?=
 =?utf-8?B?QlhnV3BmSGlOWHRXUzVPSGVBYlRFNjQyT01iYkNDRnU4OUc2UUxocm95NnlF?=
 =?utf-8?B?TkU5WFJMWlRlTW94cVR6enFPVjhyeUQxYXV4S3U5S1FZKzI4QXYvWENSSjhj?=
 =?utf-8?B?YUx5TGVDdWtQUjVGNlpPZzlRUElidmVNK1M1Njd5cytnOUNrQjRabVFJMTZW?=
 =?utf-8?B?NHdUVUMyeUZOSkYxSXltU0RsanJsZWNCbGtIazdZeVI0UEJGcHFSckVueU1p?=
 =?utf-8?B?TDJzUU9GdmlVT08rVmJqWitaSVhUblo4VEcvVjdDT1N5MGhkdjZIS0ppTERL?=
 =?utf-8?Q?aMJeP/a0hD4XvkiwIDftT0bIdPnpli1Mv+p09Xl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b81f1d-a3fd-4b7d-ba5c-08d96d4ec6d7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 13:45:36.1518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3V2wUtrqZrPA87VtkBWBub158OXgC4bKAn+P+aDMPOpp6VtRv+bnWOiX3Tnyrc6nnwRR3n2F84jUmTssJ+mAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

(removing all lists inappropriate for a question like this one)

On 01.09.2021 15:22, Jason Andryuk wrote:
> On Wed, Sep 1, 2021 at 5:34 AM Xen.org security team <security@xen.org> wrote:
>>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA256
>>
>>  Xen Security Advisory CVE-2021-28694,CVE-2021-28695,CVE-2021-28696 / XSA-378
>>                                    version 3
>>
>>                    IOMMU page mapping issues on x86
>>
>> UPDATES IN VERSION 3
>> ====================
>>
>> Warn about dom0=pvh breakage in Resolution section.
>>
>> ISSUE DESCRIPTION
>> =================
>>
>> Both AMD and Intel allow ACPI tables to specify regions of memory
>> which should be left untranslated, which typically means these
>> addresses should pass the translation phase unaltered.  While these
>> are typically device specific ACPI properties, they can also be
>> specified to apply to a range of devices, or even all devices.
>>
>> On all systems with such regions Xen failed to prevent guests from
>> undoing/replacing such mappings (CVE-2021-28694).
> 
> Is there a way to identify if a system's ACPI tables have untranslated
> regions?  Does it show up in xen or linux dmesg or can it be
> identified in sysfs?

For VT-d, "iommu=verbose" will cause ACPI table contents to get logged.
For AMD you need to go one step further and set "iommu=debug". Obviously
you'll want to be careful with enabling anything like this on production
systems.

Jan


