Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAEF458CBF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 11:52:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228774.395918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6ve-0007L5-Jz; Mon, 22 Nov 2021 10:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228774.395918; Mon, 22 Nov 2021 10:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6ve-0007Iz-Go; Mon, 22 Nov 2021 10:52:06 +0000
Received: by outflank-mailman (input) for mailman id 228774;
 Mon, 22 Nov 2021 10:52:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp6vc-0007Ir-M9
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 10:52:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a1643c1-4b82-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 11:52:03 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-DvCIhdW-MLCV5A67LcV9vQ-1; Mon, 22 Nov 2021 11:52:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 10:52:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 10:52:00 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM0PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:208:14::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 10:52:00 +0000
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
X-Inumbo-ID: 3a1643c1-4b82-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637578323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0+hMQazKjQAVHNoNABL+U6iR+6g5nLMY3pXN92DXVU=;
	b=TWgbEByc0O0dCJzgJOzW/7CV10y3+uanXo1nbfTZ2lyhzZ7Zp0QAH4wnzzqwGcFfscqgUL
	QLJYccg0EmXqDs0KZuPx/PTWBD05dkMSaclSdf07sLIGCQ1gHS14gE4FPtCvTPWWpi2yQQ
	dN4uHT+9kB137qMMuixYGyBxgHKrP+g=
X-MC-Unique: DvCIhdW-MLCV5A67LcV9vQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsLeqF4nX40CpJgUKFnRQ/3iEd820pMw7xb1yIn/wKOwtbjh+jOEABT28cxKw+3LCsm6lcuWFIK3wb0XLqgj2cEqgtsaP8TkmyJ1GcY314J0u+vCh4Tj/VlSYGfyMUwyyhiLP0ZPa9v858+fE1xKn0kKMWnYsq/JKt5VA7c94WuuiC6AXIWekrOEp4c3jYaoyycLOVQngt/q+bS6B9pYhG/6U0e2N2jJuUGZ/f6t/py7NXPLIUKYUZiW4V1G6d8soBflkjLaNDaceoRbHxP6FMb6duDL2pZqUeCKNMUcYvHdrrh+XBRE0AGDK1T0vjc9fuB6ulWHFNtYOjdJ+3tR2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0+hMQazKjQAVHNoNABL+U6iR+6g5nLMY3pXN92DXVU=;
 b=BXDZ+ufZWciWtxDuGvvE6CmeixaFrRcQ7i2G0tFH2xHFPlFOSLSWj7nVi9EtBHk/mRecxIl9bbYCtPfZJIb54sXu47NblPIRbyfwRZzXyCjAa3+aZE6gF8RjeSELB5DujaH8L8fd7KT2v7oyDn/NQ5FNxR4RHH/vyd57x7jdEbEFo5WoNAfN+Ssc86clqV/+pGWjhvC5dQZe7itTwFuTxdfebu1En7ktpamynRKjxUZsH5XWOe0OUSWRX3O8wVlCa3jWgGay6329BQ+GAPkfPvj4eE9SnCFrzk5Vbm1igz+ZXJ4Og1VNLAOxay38LQ2ihgTiu/1FcF48yCBSXzKcnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f8fd875-a69b-1821-5abc-a8062a7a6242@suse.com>
Date: Mon, 22 Nov 2021 11:51:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH for-4.16 v2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Community Manager <community.manager@xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211122104005.58897-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211122104005.58897-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:208:14::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d814f213-9f6d-4359-b26d-08d9ada61cb7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5327:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532777E1C3CED886CCF76B9FB39F9@VI1PR04MB5327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OkIjgbhi5E5NoTrNBuruPf6x3Eeu73iZwNDgCRnBINi8dy5l4fMQHDbXYHvTa2/O8NHmJAYpCuawn+P+r0GmQKteQBY8rMIe1pDkIMm5t8OJ3YuBbrlfzfa/2DdIKavp491ft8WvmUuxuGxsGIMn4ZygvUv9yjhOgJOvJshKr/8PUhbiMpc6fZUqtT5dSel2zfL1ngdLEsveWGKVcBWs1t6PGOrkeCoaTFd8ZmzrviBiByD6ow+c/C8kXpfOX31YHY7rN7MlzKeBR0qCzj4CS5ZGIcietSVXOLiwNztzgR2uWmdQCA+vckXzokbxszEARxOWApGqBocCPTgcY53/+n0UzoNq9L+6QkYFi+uDHqVcNgAg9UES2FcQqIKbJJ4kDYRMI55z+NMln1DloBL+6QZ45vsJrtG1VrbAa+++mV2TB3tlD8t1S0dcqO0EfYiXdbxseJSioOfsMioiOq9lrrBh6gtC/6TzTOul624bEBmrhERgDySpp3RbGTTXNhmmIx4yoTEWvrU9zX5Cvp4BHLQ+1nnYMJkI2xLk68JCzLNgYmaHaL2tUBq6t3i+Ign+K+14/3hkPg43oqko5gzKDE/itCfVYZ2ucfkLXVSYj4OrqgJl6MF7zMNGUcFI+JzOONrXDo5rAV4Ar9/53lGM2F0hzIZYY9iH3hIfzBQwItx0ZJKcJsx4oZzrkLxst+hiksK8IgDlq4Z4/7flkNvaD0aTW5uGrgWWClt4L8TpdZui5RD76CCz7Hx6orSNONcl6v0aGywBLXyImNYvJNKWEO1UMERgnNk9YaI8DjppBOzyCl838xwaQHX2y0lwal7ONSWaE9t5hsGBmcMFLgVx1XN8IwbUZleJATCArsoqlu7XlcqQX2fzQy5hyyE9PR/mZ7fpnUhY39wyCuiPSTGVJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(4326008)(2906002)(6486002)(6916009)(38100700002)(316002)(2616005)(31686004)(66476007)(66946007)(83380400001)(53546011)(66556008)(36756003)(186003)(54906003)(31696002)(86362001)(5660300002)(8936002)(8676002)(59356011)(207903002)(219803003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWdCdzVSUnZkMGppc1Y4aVZvVFptWmFtZjZiNk1NS2hDck4vUkRTd1VxSVlQ?=
 =?utf-8?B?WE50dGw3YVVqbnRLYzI4aStJeXppK05XdDg0V0JZbjhpdDlLVFdYTlVOWmVF?=
 =?utf-8?B?MGNGSWVLWmlFUElFZEIyREI5bDkvTTM3d0xCc3I4cDJBOTFlNUJyTERpMklN?=
 =?utf-8?B?TitmYlR1WTRwTFRpTXR2bGxIVzVaZTdETTh4cVhtWVVnWk1xa2dEV2JKRUcx?=
 =?utf-8?B?bmJJRzkwQlR6bkkzU1RUMmp3SmcvOFVDamVhNk9BUm43azVGVHJaNmNVYXE3?=
 =?utf-8?B?R0ZsY05TTHJrTVcydmlQS3dnKzNGWnNiRmhRQy9ISHh0d3lxa3FyeE4vMWV1?=
 =?utf-8?B?UFdTcFVTMmpySlRDZTdxTEdCL01oRU54RW9TQWhlQXhzcE9uVytBcHFrUDFO?=
 =?utf-8?B?WnZwckNyOFcybWx3M2xMTjNRUGdPazUrYnBkeUpheERUQmNDdmJRYyswQjBh?=
 =?utf-8?B?b09aTWtJSGpBengzVjkzQTdPZjE0dnZjelpZSFVabHpCcEh4MDRFb0c4THZm?=
 =?utf-8?B?dHZpWDFKYzEvdVk5dHVzYzdlQ2QvR2kxaUFkR1NKcE0yK0wzTkFQc3VFZWwz?=
 =?utf-8?B?bkJrUTJXZW45SDN1UU43ZFBjdXZUOUdDT0pIelBmK25jT202QVFmNy9kZFlO?=
 =?utf-8?B?M1dqZFY3a2FQRGp4SklkTTNQa3FuWVFGbVJhYjBGN3ZabG1FLzdTRXNuZWww?=
 =?utf-8?B?ZUNkMjNyczE2QlUybEdobWgxTzhzaC9GN040VGhZQmIweFlXYkI2VlRDRDZ3?=
 =?utf-8?B?L2hBNDBCMFNXRDRmSFkxR0ltS0FXOWNFcHI0aVloNFY1OStZL1hleExQRDhG?=
 =?utf-8?B?dzJvaC9wNE04bnhuRGhOc3dwcTRjRGQrRDRCZGFwQjk4UHlIOTVsRlUwTTJr?=
 =?utf-8?B?d2ZQZFZCN2d2eTQyQzdCR0NxMlppWTBNdlVnSkVWdU5XVWRoTVBtMEozTDEv?=
 =?utf-8?B?dndOU0NBNkNrSk9teDMybUtvNzNVT0tKdVNmbTB6eFpCeXVIN1RBWi95VVVr?=
 =?utf-8?B?bUhIcE9DeTFHdy9DdDlqR2RrRmVoN0FWcTkzajZnM09hVjdtSzZnZzlQTTFS?=
 =?utf-8?B?aTY2b0pUUld1MGMxYk5pZXZOMFlxYXRLZ24zRnEwYy9HaFcvY010VG1GN3JV?=
 =?utf-8?B?UW11b24rdzhTZGVrd1dBSXBoRTJwWStpbGJnbWRwSDducXpVWmduMlZQYXht?=
 =?utf-8?B?VTJKcXRHYWRUUE1LTCs5RktldERvVFU3SzlHcGY3dUtENnVUbGZ1ZUYzVkZk?=
 =?utf-8?B?TXJBRThJSU5RMmQ3eFQ4SlJpbmVvZXVpeElGUlZCMTZwb2tCUWhNSTRoUUdO?=
 =?utf-8?B?bEVEa2RJcjZ3ZGtwQ0tUYy9UcDRmcW85eU5TZG5jVUFhYitxd2xCL2lnRnBV?=
 =?utf-8?B?YTZKOWRWdzZEQllURytSbVY2R3NKRzZBckRwbDFwVGtZR2FhK3lnUUE2RGVM?=
 =?utf-8?B?SkV1Y2pEUndUL1U0Nkk2T0NXeTg0YnpNK2FabzI0K3BFTi9wUjhqSkVpUzdy?=
 =?utf-8?B?bU5NWTl6aFlQcTgydWNja2FGbm9YMStCd0xEZUZDMkU3akJ4d3hNejc0Yzda?=
 =?utf-8?B?Rm1Pamh2UnFkTW80TUxCYXV2bkdJZDlWWnJJOWpPZ2F2Q2pvSE5pTExwT1Ny?=
 =?utf-8?B?SFQ4TUg3MEZrUzk0TUFmemdsaXlnODh6cUlpekoxeUtFcmsyMEdKdXM4ZjAr?=
 =?utf-8?B?dFRIWEw3RThlSzN0TzEyUE5nZlRGd3BHZUJGd0dnMlUvOERQWEFoZVgzWmwy?=
 =?utf-8?B?K0d4aEJiY2dqdlFXVXJCV28vOWNQbEVLbEdTTS9HZGR2TVlCUExIRnVuTFNz?=
 =?utf-8?B?VDR2azhPV3pHT1ZqMm5TTGNYY1hEdkxrbk1NWnh1WUlxSkJFS3dYSURiSzZh?=
 =?utf-8?B?ZXVqdC9UMTdjcG02eEJZd2FDVDljbHdtWmJldmVNak1kOUt3T3hVMjNwV09Q?=
 =?utf-8?B?eS9oMHpodDVlZGlhUGxicXA2QjQ1YnlxYWp1bkJHZEl6cnBLYlFCbzJ5ZnN0?=
 =?utf-8?B?eDM4RmF5cGtGTHlsRDJFV0NuR0d2YUNEcCtId3RIMytZWVozUXlWSVlGRlFE?=
 =?utf-8?B?ZXZvL2VGNnhXcFF3ZkVVb3Erc1hyZEJYZHpFRE1JSXk2WmE4SE9oTEVpQVlv?=
 =?utf-8?B?YXBhQW1Bb1A4bVdSdDJ3bFRMOXNYNzVNYktHL3FhL3hBYVhuOFJLVmpoZG02?=
 =?utf-8?B?MCszdDYzM29pajdXK3p2VDF6K0FucmdIQTVrVVlQM1VzZERjMDFlRUhCOFhI?=
 =?utf-8?Q?Jt15Xt8evPLR9gdnybB3eN9uTxgXedHHIWrXvxgPg4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d814f213-9f6d-4359-b26d-08d9ada61cb7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 10:52:00.8772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kS4SyEc1vDf03mUXpWST6gfUJMZavw2T7fXZbxJHJUxx9rha/1Mb8CtJe9yBdSlCgwl9MmlbKBZ9E7KneOLBgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5327

(reducing Cc list)

On 22.11.2021 11:40, Roger Pau Monne wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -21,6 +21,32 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
>     no longer be built per default. In order to be able to use those, configure needs to
>     be called with "--enable-qemu-traditional" as parameter.
> + - Fixes for credit2 scheduler stability in corner case conditions.
> + - Ongoing improvements in the hypervisor build system.
> + - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
> + - 32bit PV guests only supported in shim mode.
> + - Improved PVH dom0 debug key handling.
> + - Fix booting on some Intel systems without a PIT (i8254).
> + - Do not build qemu-traditional or pvgrub by default.
> + - Cleanup of the xenstore library interface.
> + - Fix truncation of return value from xencall2 by introducing a new helper
> +   that returns a long instead.

This has been backported, so it's not really new in that sense, I would say.
I don't necessarily mean to request removal from this list, but some indication
as to its availability in 4.15.1 may be helpful.

Then again I realize this also would apply to a few other items; this one is
just where the aspect first occurred to me.

> + - Fix system register accesses on Arm to use the proper 32/64bit access size.
> + - Various fixes for Arm OP-TEE mediator.
> +
> +### Added
> + - 32bit Arm builds to the gitlab-ci automated tests.
> + - x86 full system tests to the gitlab-ci automated tests.
> + - New x86 pagetable APIs.

May I ask what this is about?

Jan


