Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCB96A3F36
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 11:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502326.774074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWaST-0002kS-1X; Mon, 27 Feb 2023 10:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502326.774074; Mon, 27 Feb 2023 10:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWaSS-0002gq-Uh; Mon, 27 Feb 2023 10:10:12 +0000
Received: by outflank-mailman (input) for mailman id 502326;
 Mon, 27 Feb 2023 10:10:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWaSR-0002gd-5h
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 10:10:11 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9e93188-b686-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 11:10:09 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7121.eurprd04.prod.outlook.com (2603:10a6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Mon, 27 Feb
 2023 10:10:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 10:10:07 +0000
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
X-Inumbo-ID: e9e93188-b686-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCBuojq9wpKDjs69h2BJPNokmRkX9GZCDI9XDlmRJMbKmo7vvl0OKPeiSxOcUJTNTY5zJX1YpcZNY7+jTyj284AqHo2Nab3d8H/3/WUs77P/G/o66Qdzl3z2dT4WgmAY4SScP0hTVj2p0a4u378grNWRMKAligVPp16uQ5Y4IK2uYVr5CJYV71JATf3aNBaMEdmPrZdwPNv3E1xJT70qFr2U0vot9hLOoS4/xQmnb5fFkkc9nuVdSuUADjwUD3uop7bA1cdb+SEm6Isz8ZHfsqDXVoJkP5fU1wmKJoL/yphiQGDlcVsJvwW4cgpUymRY7+FHX2wEVpYTtaPO5gK2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rya8ckti/z1muuzqQprH8wpyD6pFZgRxIBnQYYpvtvk=;
 b=FPyjaSSE+8pJ5nKELarDZKtpL281d9GuQ+6sIC6QjruqhOWLLUfTilUPd1/+j7EXTDn6f/8g6tndmh5JrxKd/8DWqVHyuzffHEX/vMB9afCy1myurK0BeYg48JINwy0a1zDYLgIrk5ZRKNDJxuHnn6SNvd0ce64IzeB+2t3ncCgOQPfQHPhm3emGEJPFcxZMOvuuzRg5RE8EMjNikc/oQDErgm6usHljwgOzuwT64GJIJV2Lp0lrNTsaufj21irCwMOkD65tJmDlSi8NsBrd7M/Y88A/dHzYPAfygO5vlAe2ngw12bcXBTDUirM7Q2YwxYUCXAEdzLjWnk/DcokGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rya8ckti/z1muuzqQprH8wpyD6pFZgRxIBnQYYpvtvk=;
 b=RIbFXTKnc2j5hhlbyBVKs3LEe17t7iiPPbPjc/2onqQk7b2nPb7La+EDT8B+BmbRcuvHhQtQtKZaPzF/1PJWIqG3MsIpM54SpdcK9uejjbt7Ad9Y8Xrvkyrbdf7qYvBhgPlPZMO9J4/wSb6Tq3dbiHB5pgtizsTNkm1uPZ/RyewNhmGEEyIG2M4Lu9F6uNSEkUr0IvhQ2WKOOs4FDq8qFLSo8W3RbDVrEGomSN6v5TqYDHByhQ8ITqb9SqwuMCtv7SnupXOFOrJ899jIGwksrvwE0LsE0FoV/1we5EcHnymfDW0IHypPMCRqaSYvKEbbTnhiPD+DqWCdge8zfqlT5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c16cbd72-9a5d-cea7-dd17-c9521328fffa@suse.com>
Date: Mon, 27 Feb 2023 11:10:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] build: add crypto/ to SUBDIRS
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230227095315.6483-1-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230227095315.6483-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 35755093-9fb9-4f52-c516-08db18aaccda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UmJFO40bHICAwh/OqWUBigByDIZG2u10zYh0a+xyakwRoWNcYk830fZjxeby/we7I33Sw5oGuDqRRtyAUiZibvcwLSJ5T0NPJ6NJJc3xa5z0LWd+/hQJjxwgK4nsd4iCsKao4nPcnqemfhAW/4kAku5icoutER3CtNFN6LHWjJ1eshu44UauvyMYTbSXIIQPtIMkjIeZnFeNEz2y4VgaCg8apUETs8EufYmPJR+gNKdqqE0ciQ1WQ+nrH6uYULcZt5nKkkNv3sIlzICz9XTLULwvP4+AYXQ8voK9HRfsB0guFVYqmg4VBETlysi1GBvUnaQwg35Ixap8dvrP2vomcm5irarKlBXqDGZWdKIqmgGZ4bm1SozdMVHYIxzl/VTLvAjynyjBZX8gZF+S0aT0z4nIEeHJZI1sbrRw+uAhJoq6x1FojYl9TlhwXacUqq0bPU9F7FfPs3y2iKkKKhROpXrRa1+fnNFCblPDCRqV316AEKUykB57R1G2TsOcRDcMznW0bKn9mAHcSKkvEMhPr1sMMJBpm0+8GXhuPAdymNvqcZVDoC2r+ihj0qAgCXof8aWgF1KKt5tkedrtZF4pytQBYvZnq3lpQPhjyew2UxqUYyL3gFez0l7jADLOcWlRFf5SX3ahimZtnn6pHRTrN+5gOwsv3jBY4DYoeNSfsmsTyEBGnt+bVJc9dV9w7jKv94lrhUnE4dvOPMeZ36GszY0hoUbA4Yja6BaY27qyS1I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199018)(6512007)(6506007)(26005)(186003)(53546011)(41300700001)(6486002)(36756003)(31696002)(86362001)(8676002)(66476007)(66556008)(66946007)(4326008)(6916009)(478600001)(54906003)(2616005)(31686004)(316002)(5660300002)(38100700002)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0ZmVktnKy8xVURNYVZMTktNVmZ4OGFDNjRvN3BKRnpaeTBUZEZpakFkc3ZN?=
 =?utf-8?B?elJka2VDWUFMc2lMSDZ5b3VBYnF6TWVaUzdJRnJTdjdFc0I1ek9rYk50R1Bl?=
 =?utf-8?B?QmpmbzM1Ykw3T1BDb3NqOHdjUXk3V3FsR3FJM1dIZW1PWWVKV3o3cjRiTWxh?=
 =?utf-8?B?d2RwOVhBdTRocTdiK3ptQ0dpcitMN1dVcnhpNGdFZ2UveHpQcWpDZWpsOVps?=
 =?utf-8?B?L28vY1FBYzZ4MG9XbkNseVFRcks2Sy9zMW9BbDZJQ1JXbVBTQjJRZTNyOFRx?=
 =?utf-8?B?L05QeGVLRFZ3cWZuNlVQU2wvOU1TaUo0Qy9lVnpqSzZNWGxNRXQzSWcwRXNi?=
 =?utf-8?B?b1IwVFNyNnpEV0hueGI3YzdvaldldS9Lem1Xd3RIdTZsaEZ3T01FVHNlUmRk?=
 =?utf-8?B?NWlXUkJpc3ZpTVFtRGY2Y2phdUpCbVdJZ2pBdVFzS2FLWFlyN0doeEkwbEUz?=
 =?utf-8?B?ancyWTR6N3M3S3hiOXI0aTRHeFVBUGU2cGhHRVdINlNGUXJURjJZTWJqOGNY?=
 =?utf-8?B?TFZYbXdzcGU2S0tjUTFVU2R1K3Z5MGRXZHV4aTlUTUlHekdXcWJNZkZLM29S?=
 =?utf-8?B?ZVBzeVp2UnRQL3E2Y3BsT0N0WVJySnJia1hXNGpxcFlQd3d6ZGZzbVBMZG80?=
 =?utf-8?B?Ym5DZXZ1OGEyczhXMXdSeVhjQmVJY3F5ajZLSXJKanhGYkxrUk9FWnhBTjUy?=
 =?utf-8?B?UzZlZVRuNkE1SUwxTDJrVzE3aVZRYXBmWEpuRnZEbUxvZUdEV2lMcWE0bWox?=
 =?utf-8?B?N2VIdGlhTjNUOFJCSEtvM1RjUkVzQTFSb2lBSDNUamtjeGdpdXJBQkd1YzQx?=
 =?utf-8?B?WDRiMFptcDliNjFWQXR5V09mOS9uR3p1NThZbkYrellaamZvYjA1RHRFc3V2?=
 =?utf-8?B?ODIyREZUNlgxSTBjT2ZCTkRUUTVwTGxtYVhGUDNKWG41THBtOTVGRzFEZWty?=
 =?utf-8?B?c0dMaU5RMitobE9ic0tIdW83VjRwcEZjakp1QTNGN09ZK3BVd2hkMklMN2Nr?=
 =?utf-8?B?ZG9oM0VaSEdQM3lhTWtIMVR5WTlVVGVxQ0RweWJMZmR6YXlSV2FWN0hhZHZQ?=
 =?utf-8?B?RXBDNTljTUZ4MWpzVFdGbk80Wml1ODZjektkbDVMZEovbFpIaFliSVo4cWMx?=
 =?utf-8?B?U3Z1NExxakNmYTk5ZG5VSXpRR0JtSzl4bUMwcnIvKzh2VlBPakxIN2xQRFFC?=
 =?utf-8?B?dUpYWlZoV3B2ZGVtN2NWemt5dEhtdjJmTEE4VkR3bzJvdVk1YzJEM01nSzla?=
 =?utf-8?B?OUdlUFozdjJOL1RCSitWQnZKNDZFS3JkeUUycm1MVUR1aFZyMWJybFZ0V2Jj?=
 =?utf-8?B?Z3RkcDRFZ2QzVkRheFFNdEtZRE4zMFNNdDltMkpxbDBReXc4SG9CZWFxei9Y?=
 =?utf-8?B?dGNvNy9GL3IwOTY3THZqUXd3RnE4dnlIQ2JmejhVN3EveTNNaFdWSHZDSDVC?=
 =?utf-8?B?NmdCTHo5SnJ1NGNZVGQ3NVFCQ2tQSFJCUjlqbzJqdWIxL3ovNUQzWnNUbDk0?=
 =?utf-8?B?aDJpR2pXeDEyMWErWExTREVYb3Y0WU9POFFHcG1XekNwQXorbHA1bGl0Qm1y?=
 =?utf-8?B?SERpV3BPNzJlTVNIVVpGbWhkNVdlQjNDSDNzSlp0SklIcktSY0FKOFVuMlVs?=
 =?utf-8?B?Um5QcmdBVFAwaG0wVXVLT0ErUTExT2VKZEZNdEJpTWtyTzJ3R1VQcEF1cjZH?=
 =?utf-8?B?K3hjQkp1YnM0TnlYQXk0cFJuMmNNNmdVY1JZYVpLZlQxclF3cFdVVFJjcFlS?=
 =?utf-8?B?VFNpdjlmZ1M1dE1lbzVheFAvY1l4OG5uRG51TDZKbnVDbnMxbU9WOTJ2bEZD?=
 =?utf-8?B?UGRkYzZzT0V5Q0prOEpxVGFoV3FMZlArZTBQeVUyaWU2Rkd4dlZvK09wN1lP?=
 =?utf-8?B?WVBCbjJWNWtaak9MZUxJdTVwR0Zuc1ZZeDRaN3NmWGZsYnhWazVZbGhqNlNu?=
 =?utf-8?B?QlZUazh4YjZtNVBRc1ZsOWZFUkg0cGExR2cxeDRzbUdBYjVqVk1Pbjcrdk5C?=
 =?utf-8?B?ZTVZZnhJckMrZmd2Zm9Xd2FCTzRGOE8wTVlHY3VJekljTnMrVENFcW1sK044?=
 =?utf-8?B?eE5mc1pVdEFOUDUyRXJ3Q1RuTk1Oa2R6cVBDQ1ViTFRvRzZvZndseUtYUHFV?=
 =?utf-8?Q?FENgipjK+ywQLeadz4FrRwr2G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35755093-9fb9-4f52-c516-08db18aaccda
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 10:10:06.7359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4M+xmCS4xzQCScbVfnJ0Gs+10N+dDaqeSb0z6Z844t+hAD2VVXDG3Y0q6/rkvXfSa1TByTWJigcuiyyK0YqAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7121

On 27.02.2023 10:53, Michal Orzel wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -589,7 +589,7 @@ $(TARGET): outputmakefile FORCE
>  	$(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
>  	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
>  
> -SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
> +SUBDIRS = xsm arch/$(TARGET_ARCH) common crypto drivers lib test
>  define all_sources
>      ( find include -type f -name '*.h' -print; \
>        find $(SUBDIRS) -type f -name '*.[chS]' -print )

As long as it's arch/$(TARGET_ARCH) that's used here, crypto should imo
also only be included when selected (or at the very least only when an
arch might select it, which afaics is possible on x86 only right now).

It would also help if in the description you made explicit that SUBDIRS
isn't used for anything else (the name, after all, is pretty generic).
Which actually points at an issue: I suppose the variable would actually
better be used elsewhere as well, e.g. in the _clean: rule and perhaps
also in the setting of ALL_OBJS-y. (That'll require splitting the
variable, to that e.g. _clean would use $(SUBDIRS), $(SUBDIRS-y), and
$(SUBDIRS-) collectively.) It is, imo, that lack of consolidation which
has caused crypto to be missing from SUBDIRS.

Jan

