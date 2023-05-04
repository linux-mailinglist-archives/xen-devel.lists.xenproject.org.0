Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D54BC6F6E68
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 16:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529831.824682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puaPT-00048F-RF; Thu, 04 May 2023 14:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529831.824682; Thu, 04 May 2023 14:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puaPT-000466-OR; Thu, 04 May 2023 14:58:19 +0000
Received: by outflank-mailman (input) for mailman id 529831;
 Thu, 04 May 2023 14:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puaPS-000460-6Y
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 14:58:18 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe16::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19c9d1f3-ea8c-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 16:58:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7862.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 14:58:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 14:58:14 +0000
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
X-Inumbo-ID: 19c9d1f3-ea8c-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip5WEMsvhoegzjaaoFKKD8bBekZoUcujBWmMfQy1g+ZHqJ5wxYqT3KJMJldbM/1l+rN59S1IiGNEAJiyce19IWLxozfm8chAxaZSc2luUScLX4mf19vKgf1gh1h97ZycW9Cn6WdDmVCcQ/+GYGQohCSy6Vl8p00Rl2Wy+MEzDGz0vDhJw+Hcyy4UM6i1asqgs+SWAKiVFeuvYRvbwPJ1lGgM3PflwvJPw3W5AnUeR0sWQpfSRpNqFIYcU/XIWVFzzqWUGhNnr47WS0uBzDnOI6LIzGjIffhGSippAnSm1VarCqwsQvcuC+T5E9isGBmWIhkGYb5P6RqvI23FTK0N1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHns2eARKQnQVqrbuS0ItzjVrOdmKr1yaovuxzQ1684=;
 b=Ud6SN4gJCs+qN0TSG9SASeoalEyOMIbV7EWODlluUUAyOId0IfvlZWWJhkrN36zcjgRxLxMwvYQo6EeMCKX27sNg+Bft1t1I0h3RnA3loJUoG/W9InjqodGCxv46edieoITC0RhQMhDMGDaYWidcgfLPmylFjY+V01/JQSi0psaAOb+cnlIvfOGXqpIHZZU+aJjJw20LaroqJTCuZfcjkiNnGPs/mxsK7CcdFrkGuAootlGE7t1lJwCQFElpT+2J5lWINgEVwVcZ2nTjeg4tKUypwygYcPhSOyleAYBtdigRReK6i5odsn6Vg3u/kTFlwjXFHIPukj3vOMc9lZI3VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHns2eARKQnQVqrbuS0ItzjVrOdmKr1yaovuxzQ1684=;
 b=mz0Mn1EmVPG55MBs+EjBs5e5SDRcIIL9sz/HBgurGNMISPNYlbV549Uoan5gT+hn+5MtUT0ivmavSQeljfnxiwKX/LUghvz2kC1yDOn7p/UQb6fzQbHsutKA1ywkzat2SMClfb/ne+KwChW6TPJdQ2C76i8DySB6K/JeMMTgX0QP3QjvZX9esOWeqaCTx0/D1wjzZYpM0WFVvHoPVoeLj8dtF1ksGT10MHQGxG1jF2Bqf57VIDxNP6SnxIMIE/7x9tHH0idA28+kF95pvsFRrbMa099brS3cLZScyC3gb1d9PqRN//2RoCgZfaONE4J53X2oC2A1a8BIT8zed3Lu5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85820299-1a45-652d-283b-cca89edcf3b2@suse.com>
Date: Thu, 4 May 2023 16:58:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] build: don't export building_out_of_srctree
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2e3c8f9d-8007-638a-c88b-21ad2783d8d3@suse.com>
 <9e63c6e5-11cb-9f0e-b33e-0247b17e3785@suse.com>
 <30ef6706-5c01-441c-9c5e-08e578019166@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <30ef6706-5c01-441c-9c5e-08e578019166@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a7c445-87b7-4ef9-9640-08db4caffc93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	weoX7mbyrYQfZ5jyynF1/ndma/cGqtBJN+D4pr8tJUvnoa/fdC/+wHjfMnRox/TCxlcvHay8GdYPLBBSoE2h2JocCGTcHIBLnD2qI2mTh4lJ+h5YTlybBSdklEU/R8ZpDTNhQLay1FtCUIYQ1kZydCQcdKAZM/nHOZjyZ3L7uuN7+vhNLcpMt7HTbTbN4/7lzsJYs8lOZVhk5JY++a4HyUdm4+MRLZlm6noGxgF1f4PCE/kVo3pL/WOyeUWBk4HckOd7WZfJZ6gS5kRobUieTpLaRRImcWBe7O9IX+Th8g0i6IjL1/jvSJHLvF00rbgdjIBslL2q7+5bVluGdRI7rydjOvkQK207viY77WnJxdmqsXHazypSG7OAneKUL6ekNXxhTdvxeJN7d4qECjqxkLtH1aUM5Lamel9XIQfDYKGb30EvY5wcTJuovDn0Dgk/VMTTuJ5aQOHakmPBO2HMzumVzjoTyJN3dm5h+YA18BJzAbSd0B+i1P8cHFMn1q/2yAZ8n/M9Njb9a+J1Cxt8GU4jBcy3FISaPupHSse3dZ1RlwoORPf0j/zkHUj0VdL16+GCdULI2dOqT4iuGGNI91eI6d6E/okGXhaViTiM8/Tc7v5l+25fiCc70ZWgiSM/DlEdn4HFAuYnsSbGt5xUEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199021)(5660300002)(8676002)(478600001)(38100700002)(8936002)(54906003)(2616005)(6916009)(6506007)(31696002)(86362001)(66556008)(36756003)(66946007)(66476007)(31686004)(6486002)(4326008)(83380400001)(6512007)(26005)(186003)(2906002)(316002)(53546011)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWFMUnV1b1g1cWg2UlVIWmp2VHJHOUFsa2xkcHJyYzdCK2xqaWpmN28xL1pu?=
 =?utf-8?B?dEpIQUpjNEdnOHgxeldmM1pRVW1kUnJWZ09sdnpkMmRCcGN2TG9mMUhOcEti?=
 =?utf-8?B?OHdVU3RWTDVveC95RWUwdmFsZ1BGNVUwUXdXYWtYK0Fqcmt6NENVMmRnajhq?=
 =?utf-8?B?alJUYk1aUERTYXh2M1ZKOHlld1Z2WkNkYUJucFlpUEhkR3BHaUNlUVZVOWVa?=
 =?utf-8?B?aTdRZ2R2TGQxbDdxK0p5UnorektRTHJRYlQ3SnhjeUNIN2IwZWtjeGdxWHow?=
 =?utf-8?B?NUh4Um1Qc3B6aHVicGRzTDNzdElSOWtDTWNrNGZod040Z0Z0b0ZDM2VTcFRU?=
 =?utf-8?B?NWlEUzJGa0dyeGhOeEtpemVUdUZLTXViWnB2c0dKMStHSHpXOGljY0t3QTNk?=
 =?utf-8?B?SEJZVDk0L1B3U3pWek1TSDByRW0vVFNuTFFwdURXU3hyd2JKWThoaXVBZzNS?=
 =?utf-8?B?bGI2RGtVNGVYeHdMWlR5MHNwdS9hbzZzY3I0TEZlZjNGRHkwMVlXWnlHRTBE?=
 =?utf-8?B?OUhUNmtrSXA5cVFLV2VvNE93RjNKMHhCK0hQWE91a3pDT3FXdnhuSHpqUjFI?=
 =?utf-8?B?bkN4WjQxNXBNeWRDRXVta295ZklJRDRDN3NZTTJPWEphV0dVS042eEtPQ1Jq?=
 =?utf-8?B?bW0wM05xM0xCUGtiL0x5ZUJjTWQ1d25qNlB5VnZIWC9sYy9aQktpbWdGZVdi?=
 =?utf-8?B?NjJESm5EYXF5bFQycnlEa1ZKWFZGL2c3YmVGQ3RJZU1oaTgwQXRSdDRvVDVo?=
 =?utf-8?B?WEhtZnViUGFhdExzYnFRZmp6bVNJRzdnNFFIbnRPa0hVZTN5aTZHR3FNbzJk?=
 =?utf-8?B?d2NaRFJlaE9GZit6LzN2dkZMSEl4bSt5eVVCRGZ6UlMzQ2R3SWRUNGF1L2tX?=
 =?utf-8?B?SnkxbVpldlNtazhnT1BuNmRycU1YaXBXSkYwMmpMSTZPTFdZZWJxcjM5Zk5B?=
 =?utf-8?B?S2tpMUw5bnpKYmFacUp1cDRnQVFtWThlbld0ZGR6c3RzOWVRMzZnV1FzNFlr?=
 =?utf-8?B?cTVUano4dXc0bW9sdEFockhLd0J4ak9kQUxkR3FEK1pWMUtVZ2VTV24wNmxN?=
 =?utf-8?B?RDM5RHE5ckk4VGplbjREZENvdzcwYzc1bXV3YVdvWlBYMUNVUUxaWFJlcVg0?=
 =?utf-8?B?NXpRVGo2SlVFanlBR3o1dXY3dWdUNjlEeFlZYWY1UWhuTTFXK0hiYkVEM01a?=
 =?utf-8?B?dTN1OVBXTmU0eWgrekZKeGRGdFFpK2c4SVl4OHZOUGY4RjFheXFCNi9jcGNC?=
 =?utf-8?B?RENvcVlEblc3cU5lTFJhaWxNWk1CVTAvRVdkZGRndGM1UHkxNDNRSW1IbWQr?=
 =?utf-8?B?eUF4d2gydVBGcUJTcW1YbWRmV05jU1NQR3NZckREV0pNcjEwZUx4eG95Vmhh?=
 =?utf-8?B?eVNlVlRxanlkdktqeEtoR3pWdWdjNzBCVEJxa2N3M1RpbjlGZjhsRk5rajVW?=
 =?utf-8?B?M2x0dWhnOHdqYmRaTE1Rd3hkaUttZXhMM3o3V2hJNzhQN3AyTTM3OWJDNDc4?=
 =?utf-8?B?cG5qTndpWWVXVWgzaDhyK095czZEWkEwYThINyt4bjc1WHJzQm5DRGRHZFRn?=
 =?utf-8?B?VDRSVTZyT0M1ajMvVGoyVEM0c2xONUEvUGpGelZFYjMvY2Z6ekNRNEppeXNs?=
 =?utf-8?B?TXZTYWs1STNEdzR6c3VqMm1vdnh5TEZuRUdOUkxOVHhzT0ZTaWZVcG10Y3Vx?=
 =?utf-8?B?S3Fodm1DOTRMWE51NHFpc3pSakZOLzVBSk1weEZWRmtuNUx2akN3UFIxQ0F6?=
 =?utf-8?B?WHpkM2NPenUySU1ZZWNZeFJwQll2Q2lyMGxsZUgvdzlkN1dVY08vTHE1OUtI?=
 =?utf-8?B?VmloMy8zdmowQ3VsSDJsVi80MVRPYUo2VkNEVDdJOUF4RlljREZ1aG42U0Vu?=
 =?utf-8?B?R0FqWW1zY21qa3JxMGF2ZlNJM29MU0tNQXltd3dNeVF3SXMzbGJjZ0ppbTd0?=
 =?utf-8?B?ZVBGeWlMZ1F5TS9sWURnTm90TFdNU0ZxTVpkK2dUVEV6NjZvNDlMN0taS2J3?=
 =?utf-8?B?TDlYSXBjWno0ZzFKbml5NmlUNDNnaEZmdDRPa2VSa0VOclBySmFoeHA0OU52?=
 =?utf-8?B?Tk0rU2hGbkNGZDEzODQrTDBDTGw4ZC9vNlRMMk1JWHVXYy96dy9xcTJpYnpn?=
 =?utf-8?Q?PH0LfQ5XMOsCqEP1qQoqBAwO9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a7c445-87b7-4ef9-9640-08db4caffc93
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 14:58:14.4854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1/qwZ6jpyws3BNJUtnAqd2UhnCPHMWFFXLaqJHkLV6xqWnaFnrKNCHkjPZP0LLpfPUXlr8MawJqmYX+hV0IyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7862

On 04.05.2023 16:49, Anthony PERARD wrote:
> On Wed, Mar 29, 2023 at 12:22:16PM +0200, Jan Beulich wrote:
>> I don't view a variable of this name as suitable for exporting, the more
> 
> We could rename it.
> 
>> that it carries entirely redundant information. The reasons for its
> 
> The patch replace building_out_of_srctree with abs_objtree and
> abs_srctree which also carries redundant informations. abs_objtree can
> probably be replaced by $(CURDIR), abs_srctree can be
> recalculated from $(srctree).
> 
>> introduction in Linux commit 051f278e9d81 ("kbuild: replace
>> KBUILD_SRCTREE with boolean building_out_of_srctree") also don't apply
>> to us. Ditch exporting of the variable, replacing uses suitably.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This patch feels like obfuscation of the intended test. Instead of
> reading a test for "out_of_tree", we now have to guess why the two paths
> are been compared.

Hmm, it's quite the other way around for me: I view the variable as
obfuscating, as it hides what it actually expresses (or better based
on what properties it is actually set).

> Anyway, there isn't that many use outside of the main Makefile, so I
> guess the patch is kind of ok:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.

>> For further reasons (besides the similar redundancy aspect) exporting
>> VPATH looks also suspicious: Its name being all uppercase makes it a
>> "non application private" variable, i.e. it or its (pre-existing) value
>> may have a purpose/use elsewhere. And exporting it looks to be easily
> 
> This sounds like you don't know what VPATH is for, but I'm pretty sure
> you do. If there's an pre-existing value, we just ignore it. If VPATH is
> used by a program that our Makefile used and that program is intended to
> be used by build system then that a bug in that program for not knowing
> about makes' VPATH. So I don't think we need to worried about it been
> exported.

We may use programs from our build system which aren't aware they might
be used that way. No matter that I know what VPATH is for, I consider
its name to violate the shell spec.

>> avoidable: Instead of setting it in xen/Makefile, it looks like it could
>> be set in xen/scripts/Kbuild.include. Thoughts?
> 
> I'd rather not make that change unless there's a real issue with
> exporting VPATH. We are more likely to introduce a bug than to avoid
> one.

Well, okay, it's surely (hopefully) a highly theoretical consideration
anyway.

Jan

