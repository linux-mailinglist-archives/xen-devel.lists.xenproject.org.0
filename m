Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A63634F6019
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 15:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299895.511199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5xy-0005im-Ss; Wed, 06 Apr 2022 13:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299895.511199; Wed, 06 Apr 2022 13:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5xy-0005gN-Oz; Wed, 06 Apr 2022 13:44:58 +0000
Received: by outflank-mailman (input) for mailman id 299895;
 Wed, 06 Apr 2022 13:44:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc5xw-0005gH-Lg
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 13:44:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd8dc0cb-b5af-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 15:44:54 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-J9wOXHFeMgimVhxkrUGLGQ-1; Wed, 06 Apr 2022 15:44:51 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0402MB3517.eurprd04.prod.outlook.com (2603:10a6:803:b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 13:44:47 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 13:44:47 +0000
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
X-Inumbo-ID: bd8dc0cb-b5af-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649252695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=heBKlj06CTYVGHNsPSMUURzlVSPp71oReOj5mYLKT1s=;
	b=AMLiMa/XN5hzz/KtF0ZS0uA0WhLk6E2RN6F+iqsQ0VaQ/jGr3KpRlxyxWQzf1H+nv09SvP
	DqywAkAZNTbeN9YLejX7BEiZaOVByVe6dtsr0REBgLzidve9JTHoftuNKUSzcJCrJ5YUiC
	Q68uwYaNVCwbid0GP4AmET1vL1Ryt6o=
X-MC-Unique: J9wOXHFeMgimVhxkrUGLGQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkNmUGHNjYX74gs/hM94nfUoKIce2VCDgqMYDi7heq/cjsmJO1W8TMmePu6cS6yrp+0wNtQTT956VLLsDhN6AMrF4wx6rEuyUT4Jiq/KcnrGawLmGSodHYOQ6njXvk6IXuHLba8gl7IKguF4MfLS2lLZxcePG4gS4qnSbVluKoBTGeGcIMvbI9MQvKbL/8amUqvL8589n/mb864+kAuRXf8fpOAbYAn67MZ4xIE8cH58wXfELG+DHaGM1onFLY1eyLtF3f4Di77HAWsgLikPmODhULHwCnlUY6qgyv/RS5joO2FhlkpuQdKHsHryFg9GGFcTsx5p2plMFJc521P1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heBKlj06CTYVGHNsPSMUURzlVSPp71oReOj5mYLKT1s=;
 b=Ae+uqry6Jiz8vLHDpKR1g6QfM/EAkNXhe7taimV+MNcAZodywOXgOfJkkVclXj2YXpMJTIe22ObJRPpSfH/7JlNrNrvnYIokdlJLE6Ia/yDTxADIHLr4ML0DjHAU8ZRh2KsLQErzofXsUva/l2cEELZlqVc2oEaqK4Feq5QgK3qGHw/Eh5WNmf0Y83v6dwx877VLHWWJCpXcCXZDZmMOoO5AIaqfXBoeHo9cbb4b/nuEK1mHpl+klG4tNMk2ySwewhm90X3nc5MtdUjwOKeUVYqSSmCzAV8eZtrXxAxpP3mopql7aFMZOpXsIfJ2YQd6Cszx3VAxWnbp2w+NA3v4Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a389ee0d-6b2c-22bd-1004-99f79ad5f301@suse.com>
Date: Wed, 6 Apr 2022 15:44:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Content-Language: en-US
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220401104713.22291-1-jane.malalane@citrix.com>
 <20220401104713.22291-3-jane.malalane@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220401104713.22291-3-jane.malalane@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0126.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afa18fe6-3765-4d40-90ff-08da17d39d7b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3517:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35171D0CBB8887DB0A63CEC0B3E79@VI1PR0402MB3517.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eGm4z5fU1HyigS0wu6TSc6HxicyH2NgH7AOq9vvyFjVa51quvv8/ZtwzLk40/q53xSoNHBhqxflev9ZR4nnjqoaUyLnMyH4O1bXsvNE7u21vno3H3GISrAlfx71/WzKWcRLWoVB+wI+xdSZwkmNBqzlTnKtU97sZOv8vNcCPvHAI/98Fn/RILn+m7FrqTKgaVJPkeMol6gFrQL/mBQFxtVnb/Axh7osdyDnPfdz/zDArUIAi94Hpg1wu6aWBeZQNUEiHLaRvi2UOtyMMBilsP8Ln8GhMrqRNN/COBvoC+B0pYE1RQCJ0FxgYSO/fFY2tl2lK7aSajUeyWKaw46HnrZUWv5Us8QhuwldvHlgDBH2BVm4I3LitvgNcxiCohVytks09Rif9FIYFS+P4IHJfcghjl3fm8P2hh6r71/e8VB4AiXL5JTJrf+DufpZ6nWt9dKZmRkrQBssB6Yy1Dj89LSitwXX1o2DvKqWFvxabh+orqDbGDqt08T/CyCPdUYU9IXf+E+jQZrWPeYynBZsZzUjxpXxbeh0W2LStxc+kEZrAGcotv5OHgnPFZ0TAa7W0RWpfiJT47c9RImONrODJ/EVmdbpj/KjtZlQ/7pnCIKeOGN/qi3iGPJpT3sXnUJqvqQsrdd90yvldljXv93icLY+n365ml8vm3xy8YtcpzD0kqB8HEszwSt97aqbBdkjyw04Zx3ynuG3RWir0ovKNpuSVv3LuN69hCjm8xyw3PICynzx071gsRMJ4Iejp0inV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(7416002)(6486002)(8936002)(31696002)(86362001)(6506007)(36756003)(508600001)(31686004)(2616005)(5660300002)(66946007)(2906002)(186003)(6916009)(54906003)(26005)(8676002)(83380400001)(6666004)(6512007)(316002)(4326008)(66476007)(66556008)(53546011)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFVMVnROYmxadlBuWXVTcW1pZnArZjdoTkdPbE1VeDRxMzlYNmFCdXRFWisy?=
 =?utf-8?B?Q0FXY1NESHFFRmlxK2kxYkNBdGJsQXducHFERCtXQXIrd1dROXhTWWprNmIz?=
 =?utf-8?B?c2l5V3pidHQ4Nk05Nzh0SkhnYWRjb0tmZzhXYXo0Y2hhdzk0VWZxWFZlcys1?=
 =?utf-8?B?NHBoZksrSUlVRDg4bzE4TTBIcFlFaTYvL2EyM2tjazAyNDFDL2ZFbythZ0dy?=
 =?utf-8?B?N2w4empoT3I0V2R4NEJ6clN3Z1YzR1BMT1k3Qm9BV3p5aHUyNy9oVkZhazEx?=
 =?utf-8?B?WWFWQkRsZlc3ZUQ0b0JzRzl5UmZlWWpMT05yWkZFNmtQd1ZsYmE1VGIxVFpE?=
 =?utf-8?B?MXdNUTlvZmZCWmdlK0xhTHBmYmVtcnp3b2hvVnU2MHpXaWJlR3dleElucjho?=
 =?utf-8?B?MGZMenNTcmhTb2N4ZEozM1d2MWJESHlxNWZlTHVuNlBtZTdtbldUQkM1djJZ?=
 =?utf-8?B?UHFvS0hKWDkrcFFUU3JzdHdHNzBoSGdUWjdwWjBZYklOWUJhdHpDMk5hdmlT?=
 =?utf-8?B?Y3J3Q1JHUlU2NWN5STU1dnNDbE1qazMyeWJaU0FRWjgrNXo0b3gyU2xYQ3Bj?=
 =?utf-8?B?S1lDaG1STEZpQ25EMjlEd2xBblQxU2FDREd2enhJRElhMSswMDJWQm1pcElS?=
 =?utf-8?B?R0twZ3NWTnp1KzkxSUwwTVV2UGF5cWF4SWFNd2tJMkl6dzI3NUYzL2lXSFhl?=
 =?utf-8?B?M0RKNHlCM2dSLzJlcWNFd0trMGo0bTJjNFlVVFliMFYxbE56aEhCZ1NKOUdW?=
 =?utf-8?B?a2hoTFp6Nm5DMzZhNC9GUmhZYit5N0JIZy9QQkpRdUJaYi9Lcm43NmpOTmd1?=
 =?utf-8?B?alNjNmNNN3FoaC9GcUZIZXREdjJQYXZubkpZUDBLeVNGcENoYm9YZlp6TTZk?=
 =?utf-8?B?UlUrTUlFRG9UYm00SGhlbmUyT0NqYWFZa2o5dVBSYnhkVHBlRWJmNW5UQzZL?=
 =?utf-8?B?NnpOZS9yVndPV3J5WEwzdlFrVWxrTmVFclRCV0syZkluQ2RJUVd2TnR3K2cx?=
 =?utf-8?B?ZEIrVzFqUXNpc3g3S3pEby96WTVkV0tpSHBVL0lnUzRjRGZReFhnb0xXNlpX?=
 =?utf-8?B?V3hlYjBKbkRoR1YvUVdWTVg2T08va05aSkJ4QlJ4VTJHcTJvSTF5VzFNZTJC?=
 =?utf-8?B?akZjWURKaHIrR3E0ZnRHa250UnJ5NlRpdTFtdko2N092VzF1YmxXUVFKTjZP?=
 =?utf-8?B?c3dScWhMZlZpVnpPZy9aTExpTHAvNVNpSU5zaUxwU2NaQjFRdUhxTENoTG50?=
 =?utf-8?B?OTRicU1td29BR25zMzdtS0dBQWM5SkJOQjhJSzNYSWlvQ3F5N214V2NrbWxB?=
 =?utf-8?B?Zk1BRm0zSGROZGp1cjd3bHFtWmkxbGEzSTBHZExhS0FXT0hRazZrRHlnVUIw?=
 =?utf-8?B?ajNUVlQ2NWdiVEUzcmpON1U0RnIraG9Dek42ZmMxeEszNHdHSy9hbXRpSE5k?=
 =?utf-8?B?WjIyTUZTd3Z3MzludU1reTFXQWlzSGUyMXVwWVpvTHJCZGZNSkMrRGk3RmtI?=
 =?utf-8?B?RDJDdmpmYUpqUUxzQndMMk1sRDNUNHhTMXJyZmFaOUUzd0ZIMUs3RXVWZ3hL?=
 =?utf-8?B?OThnTWQ1OFlKZFF2RmhIeHNFL1ovRWtQSWl1cGhycm5uR0hEWVc4anRiNGdv?=
 =?utf-8?B?SmVpM1R2MXB6R1FGbkxHVlYvOTJuY0c4VlB2cnh5dWZneHFkTVZkSWVCcnBh?=
 =?utf-8?B?OUVpL3BYZDBYaUpTeXdUN3VvUmJYSnBJc2lWd1VEYXp6NmJQTlI5eVhkZjFL?=
 =?utf-8?B?bUVRRFhwZFVjRi9EUjdlR1R1SEJ6b1RDQ2pSTGhFVndCdWpCL2YyRFBEYnVJ?=
 =?utf-8?B?VnEyVGxMUWdLc0ZmRVJQVTcwbVZlejJsR0tqVENnM1Z6eWZmbXpybHZkWVpL?=
 =?utf-8?B?UyttdHVKa0VtWENkRUF2OXBZdnpta0tnNkd4YWI0SVRZU1lvZGpFeUhPcEpT?=
 =?utf-8?B?c0piOFFwcEI4STdqR3lud0c0Si9TOWlMT0w5VlZxZ3ZRZVJxZHJkUnpGQ00y?=
 =?utf-8?B?R2NBTjdGK08wQTZoQ1Y2dkNocDVwZ20xTmFNRUxyS1B6QW51U1g5cXJqcFBU?=
 =?utf-8?B?WU9EZ2RCTnBXUk1zNHM5Ukp3bzFRU2lydm5rcUxYMlZ2UDZsNzRMOTlURVhJ?=
 =?utf-8?B?WmhIRWdYQi9yUFN0aitXWkZhd040WklJUkRVaWhEV2pyTHpYMm9pYXR0TThz?=
 =?utf-8?B?QlFqSTZqdDRHdlJrd3AzODZBMDZKRGptSnNGRWRrMDZabnp5c3hrNUNJOW5j?=
 =?utf-8?B?QWVmTnNJTkJPMzdocm5sa3dwTUo3RVI4cDNxY3Q2UmkwVUFnWXVTTFdTeEFE?=
 =?utf-8?B?M3YwalYvdVo4YVNhNysxUFhaV1NiQVg4eVpiM3paN2tiVGNpc0RzZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa18fe6-3765-4d40-90ff-08da17d39d7b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 13:44:47.5724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oy9g3S1/4VQtLB/rYElBaWX31SmYwfK8BD/d8wDJBzZMSjsMmK9YTMZurRFqWw6C7aNdkT/AsI7ePt9psx5iPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3517

On 01.04.2022 12:47, Jane Malalane wrote:
> Introduce a new per-domain creation x86 specific flag to
> select whether hardware assisted virtualization should be used for
> x{2}APIC.
> 
> A per-domain option is added to xl in order to select the usage of
> x{2}APIC hardware assisted virtualization, as well as a global
> configuration option.
> 
> Having all APIC interaction exit to Xen for emulation is slow and can
> induce much overhead. Hardware can speed up x{2}APIC by decoding the
> APIC access and providing a VM exit with a more specific exit reason
> than a regular EPT fault or by altogether avoiding a VM exit.
> 
> On the other hand, being able to disable x{2}APIC hardware assisted
> virtualization can be useful for testing and debugging purposes.
> 
> Note:
> 
> - vmx_install_vlapic_mapping doesn't require modifications regardless
> of whether the guest has "Virtualize APIC accesses" enabled or not,
> i.e., setting the APIC_ACCESS_ADDR VMCS field is fine so long as
> virtualize_apic_accesses is supported by the CPU.
> 
> - Both per-domain and global assisted_x{2}apic options are not part of
> the migration stream, unless explicitly set in the configuration file,
> so it is safe to migrate a guest that doesn't have assisted_x{2}apic
> set in its config file between hosts that have different support for
> hardware assisted x{2}APIC virtualization.

While I can agree this is the case as far as your changes are concerned,
it reads as if this was a broader statement. Since hypervisor CPUID leaf
contents can change across such a migration (which is pre-existing
behavior), I'm not convinced the statement is generally applicable.

> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor

Jan


