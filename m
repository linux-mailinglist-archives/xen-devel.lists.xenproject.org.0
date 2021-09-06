Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD222401C4C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 15:29:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179905.326344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEge-0006LV-C4; Mon, 06 Sep 2021 13:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179905.326344; Mon, 06 Sep 2021 13:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNEge-0006J7-7f; Mon, 06 Sep 2021 13:29:24 +0000
Received: by outflank-mailman (input) for mailman id 179905;
 Mon, 06 Sep 2021 13:29:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNEgc-0006Ix-7m
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 13:29:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cecdbee3-918a-4524-9703-f2dc5c642011;
 Mon, 06 Sep 2021 13:29:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-4-YjVHstorM1SLv8-ofyYDbw-1; Mon, 06 Sep 2021 15:29:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 13:29:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:29:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 13:29:17 +0000
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
X-Inumbo-ID: cecdbee3-918a-4524-9703-f2dc5c642011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630934960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3OCOX0BR8N3bNEaVRo41nPsf4k/oWlMETypATXxQfg=;
	b=ddVWkeYSNY6jZwDbzgb4goYuXhZThyaQGuXVxaeBmzR/dSHC/vutwANf6oQqzddMYbpDWP
	NqB+eouYkFC7MUdDzhzAntgIlEhcHa+MobSo1b48ZoDwLjjc0cvogGBp/8CWnzAM55vCFD
	AqoHpAYKabobOMxJLKcOlINxTspS+Bk=
X-MC-Unique: YjVHstorM1SLv8-ofyYDbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrwQPq9DNZIcxM2j9SlRty6gLcEdn6aTmreLx2n/ifvO3fFzkC2UGQrnAAnkiagTFMmsDBfjFSwKvWI3kV/GdE+92lokw2uFPoUQCRyikrKQNcxx2ewu8ziEpucyVR2E/W8iE4IZitLcyJfCF8sJX+P1jaHadcrP1nsc8aZMLnsueNdh3ui0EX5sHhwvHFpT85nskDWClXeJ03GPchkYXyizZijAxKzyuojY2ZHqLz5O5YuJxx6fOxOXuNoNsIGnv+Ndn8JoQmYh9hM2kKhvOhXV5pLi49uDHJ8u8cjytuiJLQvIJ+3bZaj/o45MIqQA6MSnequgFhUXQxKgTYsEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=G3OCOX0BR8N3bNEaVRo41nPsf4k/oWlMETypATXxQfg=;
 b=diUTTM9UGY6I+wylvSBInV5iPwdi5k/au3IuaEB4r3sT5mzx39mzpF4WR3uzWZkbniKXe0vFCKetzJWuKPWvjLNJUUYRU9Eb3yh5seFekASTg8pFU1jcmLbGfyRsAiqDzJbKaUn4ub8XW5p5EIkHJvAwghx6acHU18Nh4eA63+gMwCrEB2nm3EVl6NigVIhGIlT5/AbsDFr3jbe5P87IQXf+UmlR/gHLE0IXNbjiWGVZ0WMKWXYigIkRC1i3xuAQqq4NpVwiXDefF0nrErO/7wh+fZiw6bFwIzQO4s5dQG48cfIUynFk1Kx6jdomkRr0R7IVo3/RzBfwVafOkJ9SSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/9] gnttab: defer allocation of maptrack frames table
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <062bcbd3-420e-e1c0-3aa0-0dfb229e6ae9@suse.com>
 <7b8fba1a-767e-87f8-d0eb-5af5e5427bb4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60acd486-1641-6db4-4451-247edcc11522@suse.com>
Date: Mon, 6 Sep 2021 15:29:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <7b8fba1a-767e-87f8-d0eb-5af5e5427bb4@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P250CA0029.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38cbc938-7c44-4dfa-f8d4-08d9713a53b0
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6479766F1F06E92615A57BA9B3D29@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yQm0psxsr09FTyI8IrwMoJ1zG7VcnMBxQKPALDMawJ3qlVTZZ+wmhiy3XQXk8ruKpc2YpqzwG1j9pTa7zdS5aj5/AM0vtPGkL7Nz5JZkxoL2jBSE92sYI99kx2duyM37j8XRone7OfVxofrz90y/m5vNoTOP6gY1iqD9b2riYpxuHUIuA9SPPgO5OAVYBZG3qWCbk3GfxmhpMciKy5xT5+ZTm7zhSyoW9myL0g/KpNmwQnhvB1ktB+2SMAqcuuhBWc1bme540MVQbwAxVnkY4dBZSzpQKWwb6OhHD4pJK8zdatG8+E7BOc85USAxxBWgei8AAgtWbUHeQXyLwYpVBVv60VVs4IOSzZPFK8/Vpn7817AkdcedTK5zU1a2vhGE+qy67ViS1D60efgNLtxuC/664wI0wgL5GgeDGRxERbcJPYJDIApjiYXP4429bJUBNSfjyK+GnmjbArBTsmiY4ls4tNdUQzf/1zXjqxBxOuRWeNbah9gQyuEGuuzfgqWpFDxFVJ497bX/VcNo9/dKi+Hfaoc4DTCa8RLkdZlLKWauiyEZPC0Y+Gmv5W//ufPXKZLRLh0TIF3YMClZIBeMLpVHm/Q2DlP5Rf/fV7n70yMu7jZklfcOB4xU2mdTUeIHdKigqUn3gQgoat3X8gsop9oQ7CVthzMH/zbA+zepuTCzWpAaZMczovkxeFPpj1pDqOinpfN6m9uH9PtMlBm6bmjrC+VNS4IOCkKPvjGSzT8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(136003)(39860400002)(376002)(316002)(54906003)(8676002)(38100700002)(66946007)(16576012)(6666004)(2906002)(5660300002)(36756003)(478600001)(956004)(6916009)(4326008)(66476007)(8936002)(31686004)(83380400001)(66556008)(2616005)(31696002)(53546011)(86362001)(186003)(26005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3c5WUREV1orVnRNUjhyTEQxYkZpakR2bHlDOGpNTyswd05BMW5DSmdZRlA2?=
 =?utf-8?B?QmhaMEx4Q2I5K1BJS1VtcWV1dERDUHVPMG14T1BBY3IwWUVaYUNmWEFhSXZk?=
 =?utf-8?B?b000ZnFFbEZwZVEyOTlPVDkwMHNDZHRNcmRvdEhOUyt0Y3NXaEIwelBldUVv?=
 =?utf-8?B?MlFzcmx2MGFrQXdHTmxSWVNFRElzdUZJWHAzazBnWGY2cEhLa1BjQnFUVDB1?=
 =?utf-8?B?TEIvNWYrMllqczViYzBJc3U1djhqdTVFWklOSDJzSWhDRGVNaHFhcEZMdy96?=
 =?utf-8?B?SFcvL1o5bXJ0S2lFWmpRSGxlcWtWU2I2RkVRZEtUeURkVWc0SmtJR0NJUnor?=
 =?utf-8?B?TmRmL2IyUTZJK1hwd0VlR3N4Vzd1VnhUS1huY1dCZmMya1J4VTIyRG5EeEhU?=
 =?utf-8?B?SjhVcGptSXdScWRBYzh4aktvNDRhY0grbHZDdVZ5aTVMcU5GYWhnN2I3Q1Mz?=
 =?utf-8?B?YTlTLzc4VmZZMjZWR0FTOGhWMlB1emlEemtHeXcvcW5WdU9TdUkzS0xSa1pm?=
 =?utf-8?B?NmVSNmg3NFpvdUc1cW5jYnNIRGFtekJKWXdDeHpYYnpMRHVxaUpxVjQrTXUr?=
 =?utf-8?B?L2hFTmtnT0x5YVBJd0xYMWVhWnB2djI4N1MrOTdtbkl4bS9FcXNtYXJrc1My?=
 =?utf-8?B?YlhSallvTEN4OTRWa01QV2tJWWtlaGZvUGx1ZjdhUE1qSmJxRGFxSW93N1ZF?=
 =?utf-8?B?MEFCSm9SeUR3bWN0VlFhM3QxZmgvc2NkMGU3a0VJZkdEN1oxWFBCc2IzTFZt?=
 =?utf-8?B?N29aajB6cTVIY1NvZWVGa2xqYTAzM1Z1cE13M251d2FMc2tIUGV4Ny9Vdkl5?=
 =?utf-8?B?TFk3cmlHZ01ha2p3NjE0SVNicVk1Q2I3c0hnamdMZTU3cnluK09qV29rbHhT?=
 =?utf-8?B?K1RkNUNFSllqVGhCeHdQVTRTaUlWb3hqRyt3QXVZM0NVN3lKQnJpMlBUQjZR?=
 =?utf-8?B?RkhlMEtCSjBqSVRBOGp0dlBoeVZHcHdyYis2UWdWd1RiTFcxNkdrNEl1NVhi?=
 =?utf-8?B?YXpaQ0thRVVjRktNOEYyM2VrbEk2NUFycHNtVVQ4MmdJeHVqQnpPOHk4SndF?=
 =?utf-8?B?SHJIOS8rTlFwaVlZU29aeXBlYktTbzVsYlhpWTlhVTl5UXBVMlpnanlpbkdo?=
 =?utf-8?B?QVh3TEswYnRoQ2VVZktBUmx5VVNvdmlGaHdnUEhpMExKUGpTN2Mxc1RXQzNl?=
 =?utf-8?B?VWQ5ckU2MFU4QlhmTTRES2VBMVZtMDBXSmxWaXU0amlLd3hUck1PMVRnRStC?=
 =?utf-8?B?VGtJVVVBZUpjakZXZGJpbFdKWEVjSFhkTW5mYk44YVVwSEtzMjlIUVIzRGR3?=
 =?utf-8?B?MTZvN2ZLSEFKYk5DV1VHcjZ0VEhaOG1nT2dEYzY2V2d0aDBHV2ZtR1Fzb1cy?=
 =?utf-8?B?WEI3RmdGeHN2dldIaU9zNThlb2ZXcmZadjZpb2g2bnF2RDE1WUw4UmJiSXk2?=
 =?utf-8?B?dlRkMW0rOTlYb1ZMMDErdnlmM2c5TFRHUG9oSGJUNENJcnZwOHBETk90aHN0?=
 =?utf-8?B?WDVGUGFsaUFNOTVMWjBEOGVhMkR6VG9wanFiL3d5SHlUUWJTd2IzckpiNDcy?=
 =?utf-8?B?RkRXeUV6NDFJS2V2WU9mMXdIYVRieC8yeEhEVXNkZUR1NGJ3QmQ2ZGZWTHEr?=
 =?utf-8?B?T1IvWTY5SUh2dHRNTFIyS1dJR2dTb2IveGZYNzVVMXo3NjZ4VHI1UElsYncr?=
 =?utf-8?B?RWI1eDFuUWE1d29Rd2dIR0NsTzRmdnhWcDQrdGZYU3NRUDZocWtHNHBCSmpS?=
 =?utf-8?Q?Pg0a2RA2RZ2QOHbYsdFGUTee+1GM/cewq8prwOP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38cbc938-7c44-4dfa-f8d4-08d9713a53b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 13:29:17.7043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTl/eKVymEaVKobkZkht67y6gbWDqjWy/3aJ+CzL8pIhbox1kixJML9x/KUfQ4tnNx5w1G90TXzyXYeQsFwlnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 06.09.2021 15:13, Julien Grall wrote:
> On 26/08/2021 11:09, Jan Beulich wrote:
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -633,6 +633,34 @@ get_maptrack_handle(
>>       if ( likely(handle != INVALID_MAPTRACK_HANDLE) )
>>           return handle;
>>   
>> +    if ( unlikely(!read_atomic(&lgt->maptrack)) )
>> +    {
>> +        struct grant_mapping **maptrack = NULL;
>> +
>> +        if ( lgt->max_maptrack_frames )
>> +            maptrack = vzalloc(lgt->max_maptrack_frames * sizeof(*maptrack));
> 
> While I understand that allocating with a lock is bad idea, I don't like 
> the fact that multiple vCPUs racing each other would result to 
> temporarily allocate more memory.
> 
> If moving the call within the lock is not a solution, would using a loop 
> with a cmpxchg() a solution to block the other vCPU?

As with any such loop the question then is for how long to retry. No matter
what (static) loop bound you choose, if you exceed it you would return an
error to the caller for no reason.

As to the value to store by cmpxchg() - were you thinking of some "alloc in
progress" marker? You obviously can't store the result of the allocation
before actually doing the allocation, yet it is unnecessary allocations
that you want to avoid (i.e. to achieve your goal the allocation would need
to come after the cmpxchg()). A marker would further complicate the other
code here, even if (maybe) just slightly ...

Jan


