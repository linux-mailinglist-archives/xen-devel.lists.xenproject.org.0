Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0187797054
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 08:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597123.931313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe8qp-0006ij-Mk; Thu, 07 Sep 2023 06:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597123.931313; Thu, 07 Sep 2023 06:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe8qp-0006g9-Jv; Thu, 07 Sep 2023 06:50:51 +0000
Received: by outflank-mailman (input) for mailman id 597123;
 Thu, 07 Sep 2023 06:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qe8qo-0006g3-9k
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 06:50:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7d00::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e00ed557-4d4a-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 08:50:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8789.eurprd04.prod.outlook.com (2603:10a6:10:2e0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 06:50:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 06:50:46 +0000
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
X-Inumbo-ID: e00ed557-4d4a-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEzRKWDcthaxQp64haRwcYKFL1iT6QiTx9X8NepP3fQZPryaaKD4wWpzmNfyafQLaMKrxUkcx1Pp1yVXtn58OI/29CdRC2gIu4D/IorxTWN/xpSAzK1UvkCVsWGpTmE93pNwbJ/jypX6Zn3LgOrnmnKqGWwgyFBOOf6o0/1MQHojvsxGICUowiqBHdq+r29BvaOT5qoYvAe2NdyS6uSb8j+TAmZ7RnAHq1pV4yFrQtFIMCvul8EKQ9KgV3J62KSSTHiMeDAyEoxHaVw6eipLii/BMlSmO3sbSjeUyHdfU56pBNKGQNFizlZOAQYCBKtOJEOF1a8/bzwQJWSbQzmvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIhFXxpnD/TvIeWrOQVh/jma8ZYPOA4vhMj7fc9I4Dg=;
 b=gDJZWAZnx1ko5onBFLa5SGU1/KrPGvgqSuJI6TUI19DLG82zcsI0x2wnUC8iGNB69oWcuqsmtILyCxUyVaiZPP0obI3kB61PDmoSGvzXA+fzSqMgxJFMWd5kLoYUaZEFIdfci+genBKqVkv+NZdtkOT8HBeZgSB914l6JZrbpV3COEo3YYMWpDqLlFyJyKJf7m5SzkhxfdAcsvGA4gmOJsXKAeWY/BTwUBS5HcNjtRSum8QlgIXgezREPwjFYIUUKXl2ArF18b0VzMtY9IXXNq1CmH2Ani+T8i4BLmvzm5HHrTJFK3SSasr/tDMo3wLV6x9NF5RJN6BEh7czqWkc+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIhFXxpnD/TvIeWrOQVh/jma8ZYPOA4vhMj7fc9I4Dg=;
 b=BcLapTVRwL3Cd0l+fcvj27Oosjkknf9ej5gK6s9bHrb7qowsLsBOm/cknMpDxDM1ueNw7ESt2uvr/1io8zQ2e3r5AiWDGIuUeFrItO9ds7U/35vyOqexl1g+GsZjABehAAVzb+Iy2rBqvclPJrekEcrx77TFWlVs6ptwbALuB4EkulNbkn9G5EFl6CscpDI8y0Uchy04lIaNoZyfPPQvL6B9xwEzi7ehOPxPvjA1jyHpS3bIJLzWFFqVlJBU/day94nXAHdagsIeiK1sShCLO1GkwjGbjM7OczumuM85UaC707RtsEweB5g33XiEG/TNTLpNZVkS6yy/etqu4Y0pEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5364a4af-6447-519f-8a2c-bc1c441b374a@suse.com>
Date: Thu, 7 Sep 2023 08:50:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com>
 <alpine.DEB.2.22.394.2309061346410.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309061346410.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d70e9a-6ca3-4cc6-3de0-08dbaf6ec353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0K322QKzBV1iijhWPiqwFjmEObbtbBkCol+n8zZ5rdIDiB4KhXypt7fMZZkYPWXlJ4px/mfxnKaisXG7zo3BTodo5PCmUd1Tq9U0BMLJu6eQ1gOPeozDpy9Xnl+3S1y7JDvIOxCLa4o+S/Pi4LJNdhKhjv8AoHLYwcB19HWeUYAsP2/PU3aXtOgDzxY+BrdVtQUvL+zOgCbPk/gJw+iw50qWoZhXjs+i52YvAHAMlOx5G0nv0i3Y7TfAHWqQ/TAR+urEdy0hfCr2BwVEOMVydf8nFTSn747z469xyLUyQFDwpXFPvFWVjudkFnxVihpUsoMtMeXViN+c1XnhwfEbmCJSlzO9SDtYmbqngb7C/5wy1QdDtgYM8N+VJDUdxyuheG5ivf7wlve/UUKRvLVgC+Sg2xi8GmSx4I5bGH5WfobaaUgt4r5pA3AQIF/c8Gx9+2G0iaFz2sKzhg9DuhwmdwEfOStZch8oIxBkVixW9b4gvdvtutGwep4PfL39XEgNcoOynbWyAajNyz0BWhhxb6yTrxxJ1aPrxbywwIW7Oq7zO1k7LjsalAdMTiGXsGESKAqmXwLQbRh6osAPr65mFOd13TP4zHrqr3kbtvhlzZ8BYUGHNtQQvsSVRG9WcuYiSu3i7K4CaM8JIP85lBxBiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(396003)(346002)(136003)(186009)(451199024)(1800799009)(66476007)(316002)(83380400001)(26005)(2616005)(6916009)(41300700001)(5660300002)(66556008)(54906003)(8936002)(2906002)(8676002)(53546011)(6506007)(6486002)(6666004)(478600001)(966005)(6512007)(4326008)(66946007)(31696002)(36756003)(86362001)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWtacERoNzI1dENDNHpuSVZTamo1aXRFSGRRcWpoSUZMSVlsZEFQNTFwb0wv?=
 =?utf-8?B?TUYrZE9mZGF4bGovd0p2YjRQOEV0WFRjU2hUb284VHNpeFZqUWRiTktmSFZW?=
 =?utf-8?B?dHdBYkxUajhVQzRjM05EeGNreFJRTWtZVzkrL3pya3ErVUVub3hVUHhFSVRi?=
 =?utf-8?B?eE5JcjBINW1QUVh6VjN5S3I1YWFndmJ0QTdHRVZhOUEwMmtJVG9Oc00wajRi?=
 =?utf-8?B?Q1FMay9mclNDa2VibHBTQWNOYjBRNkxha2NOUFdaTDlNVmxkMUtwT1R2aWJC?=
 =?utf-8?B?bm1sQTc2czJaNVVkTW54Y1lEUzNkUXdnUloyWWwzVVNHcVdjeHRMVVBuNmxm?=
 =?utf-8?B?NzVqMzVlazhXdDBTNnZmM3BHaFVxcTRRSllPbmU5LzJuNURaazlIcW9TNGNY?=
 =?utf-8?B?cG42TXkrWFhlTWFBZjIyODgyK2pJbjF4Wk9wclZHVFE2aklQNWdkZUc5eXdr?=
 =?utf-8?B?bUgxSVlhbUhMNnJSZFJJd2hTbTRaS1BmUGIyOWcrcUZWN2ZZTGxEWTdyQ3Qr?=
 =?utf-8?B?QXFsK3J3dFYyZGU2VHROU0RTOVlkL2hkT01UekNYdlJ2SXhhdm4wWGczdHFU?=
 =?utf-8?B?MmVCRmFOeFMwOURPL2xjR25NWkt4T2RNb1kwZlVCTU4vUEIvNFBGNnAvcmt6?=
 =?utf-8?B?VjhxQldtTGVxNVNqdVhmQUcxOENRdWExb05QbWlJa1RzcHlYRWtYY0NGUmtF?=
 =?utf-8?B?MDIvbGExSXNiZmFvQXdTZXFzT3NhWU14YUJHS25TNWFjNmY0QU5KemYvdXFX?=
 =?utf-8?B?MUhrUFBDZnVVdHZ1SGw2d3NZSmkyOW5MVDJNdk1RUFNPOFdFZzdmYXM2czZz?=
 =?utf-8?B?VjdTUXd0VUFoQ2o0amZHRmNEK01nZUdMTmFoc203dzk4RHgrWmYzZW9WdzZ2?=
 =?utf-8?B?SWhRQ0prRkVUampjMWFQejVNT1JiQmZJQkVOc3BDR00wcnIyZ3dUbW9pNU15?=
 =?utf-8?B?UmxjUG5tc3N2cTByZFVTRlJ5dm0wc3lxZmNFVXh0R2QrWmFZQ2xzWFVNQk8r?=
 =?utf-8?B?SlpOR2RqSFdTeWNzQjZYanQxd2FmTEJzZkVHQlRaazlTQzhFT01RellEbjlP?=
 =?utf-8?B?a2F6VzFjTkhsM2w1K3BkUytObnZvNStIZ2I5VGtCUHdnUklyekNqSXd0VXBk?=
 =?utf-8?B?YSsxd1E5bXNua0Z1eFVoVzBJN01KUUQ4Z1paeGRaOUFQNG02NlA3Y3hUdndk?=
 =?utf-8?B?dGNjTWtYSFZJSTJXTk5DRDh3TUhUL1pQWHlmUlJyeFVLS0RObGgzSjdjbGUr?=
 =?utf-8?B?MVFCT1RFRmtUYjVXK3k0T3lQWjVFZFhGSFZxSVUzSWZBL0MwVG9qZ0dIZ3Rv?=
 =?utf-8?B?cGM5NDhEck1lVVBuMmNmZ2UrMzNVaWptaElWRWc5NUpRbWxkKzVYSEdhdW9G?=
 =?utf-8?B?U3NQRnhUQldwWkp6ei9xNldNNzNHeDhkVEx6bW54WGE5VGYvcDVyUUkrN215?=
 =?utf-8?B?LzJLeDU0dG5wN1hSWFBPZTZJaDhESi9YMjdPeVZtVWhleXJDOVNaZStUdnQz?=
 =?utf-8?B?aXgzb0FyOXBndjZHQVhxNm8xOXhScmQ0c05BVlBtUlFOOUpkV0lzZ2hOSVp0?=
 =?utf-8?B?UEtweVROdmI0UDZxOXVtRzJCUWlOUkt1UEdkby9RbVR3aEYwUmpPZVpNcGk1?=
 =?utf-8?B?dFBDY0VnZjN4cmduaTBNdFVPN2Vzc05veEhLeDloMWNpRGVQMGZTOU5LYTN0?=
 =?utf-8?B?eHlsVEswWnhSSUJkQUxoK2J6cGFqbW9RcTVwNVVHZDMwbUVFWklCSnM0cU1n?=
 =?utf-8?B?eTVQODArQmlHWUs5aGFjUkk1ZkJaV0ZkL2xEa3hqWUxYRm8zbjFxYmtNV3lB?=
 =?utf-8?B?RWdhOWlLOTVtQ09tcitwWlRvajdqZFBaWnRrRmcxU29iY1RoOS9RMmE3TmVL?=
 =?utf-8?B?clZpcXJabVJyT0oySkxwQlZtYU11UEVpVzJiOXRCRUhhT0Zqc2tucUE2K2NF?=
 =?utf-8?B?NExTNnZDa1JxbHc0eTVWd01FOFMva2FRUEpFQjlISlZneEE1bmI2WG9uYUhq?=
 =?utf-8?B?WUgzSXFlUElqc0JvWXFQazVtR2U4MStwbTM1eU1OSnJHRy8yU2hONGZKT1Fj?=
 =?utf-8?B?Z0NiUVp2Vjd4SmhmbVczOS9iT0dDRE0vd28vbVA5WW9yMXowYjN5WGFZbFIx?=
 =?utf-8?Q?7n4oGlddE4Ituse/iyPkELzpf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d70e9a-6ca3-4cc6-3de0-08dbaf6ec353
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 06:50:46.2344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOikSMNyZtExJUJQ97YQ65L8smKJ0VuBCYybMzfoXtXsig3B48xVfFRsLCN00OcEDEQVwP/KbDcdK9UCiiD9lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8789

On 06.09.2023 22:49, Stefano Stabellini wrote:
> On Fri, 1 Sep 2023, Jan Beulich wrote:
>> On 07.08.2023 11:38, Simon Gaiser wrote:
>>> It seems some firmwares put dummy entries in the ACPI MADT table for non
>>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>>> 0xff. Linux already has code to handle those cases both in
>>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>>> same check to Xen.
>>>
>>> Note that on some older (2nd gen Core i) laptop of mine I also saw dummy
>>> entries with a valid APIC ID. Linux would still ignore those because
>>> they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xen
>>> this check is only active for madt_revision >= 5. But since this version
>>> check seems to be intentionally I leave that alone.
>>>
>>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3bf1dbe64b62a2058dd1944c00990df203e8e7a # [1]
>>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10daf10ab154e31237a8c07242be3063fb6a9bf4 # [2]
>>> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
>>
>> This patch was committed with unaddressed review comments. The normal action
>> in such a case would be to revert, expecting a v2 to arrive. One alternative
>> here would be a timely incremental patch submission. Another alternative,
>> considering in particular Thomas's most recent reply, would be to properly
>> downgrade CPU hotplug support in SUPPORT.md (with a corresponding entry in
>> CHANGELOG.md).
> 
> I am in favor of downgrading physical CPU hotplug support in
> SUPPORT.md.
> 
> I noticed that there is no entry for physical CPU hotplug support in
> SUPPORT.md today. Should we assume that it is not supported already as
> it is not listed as supported?

Hmm, I see

## Host hardware support

### Physical CPU Hotplug

    Status, x86: Supported

pretty close to the top of the file.

> Specifically, would it be a good idea to add a sentence at the top of
> the file saying that anything not explicitly listed is not supported?

Iirc that was the plan to do for 4.18, but then we need to be sure that
things don't unintentionally become unsupported. I've no clear idea how
this plan was meant to be carried out, though.

Jan

