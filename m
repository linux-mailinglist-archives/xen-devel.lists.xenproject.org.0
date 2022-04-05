Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A7D4F2972
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 11:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298663.508859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbfV7-0006BG-EC; Tue, 05 Apr 2022 09:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298663.508859; Tue, 05 Apr 2022 09:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbfV7-00068t-AG; Tue, 05 Apr 2022 09:29:25 +0000
Received: by outflank-mailman (input) for mailman id 298663;
 Tue, 05 Apr 2022 09:29:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbfV6-00068n-5v
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 09:29:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e08306cb-b4c2-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 11:29:22 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-nPthoNw4PNeSRxSyrWINcw-1; Tue, 05 Apr 2022 11:29:19 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB4942.eurprd04.prod.outlook.com (2603:10a6:803:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 09:29:17 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 09:29:17 +0000
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
X-Inumbo-ID: e08306cb-b4c2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649150962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IM0WjWhCvNW9c+LjtMIykjleIdq/y4xbeWXDJ6rNR5c=;
	b=c6rkTOo5/aFltPi8hp606OEgnsC+5BFyIkAMmvZk87pkkWCeWRwQtPv7/bqNS617GvUiKj
	FQQvbFHKKLgzRPemXQ6PoH6rp50qb9HOPQm089bx9YEBWQa+NHyP6l1DEJSl1DAEjkf7vF
	bV1pBLCDxyE2wvc6FwjsulqDb3oGD5I=
X-MC-Unique: nPthoNw4PNeSRxSyrWINcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUpUmcImDFsXBAkMa3xW8wvi/pLPebHzMyL83m/clx01sN1i0HM1XQZJJVmldckYdEXdy6V58hyHmsogQXjxcl/cSCDEMJ6m2ZZy6Ba3zr6xPbpAehBlypO5Z4qLdVA5ZEbzQW4DxAj+FBf8RMEVu3YUPmPQnc+0VZPVZUtm1v6RWrJkelP4Tje0kOj1KiFYa30CJC+DbbUPR/dY6Xvpdc/xTGWa37R+WVqxnZ5V28HZwoVTX+3vMEBnNsv22xK6z3kjT+evO3gr44ZDmCUC3p0A/RyJiKVRPEaHe7UC5D56Wl4pUcmYRoQUP5sbD0hH8eG4FDTdALP234W72APDeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IM0WjWhCvNW9c+LjtMIykjleIdq/y4xbeWXDJ6rNR5c=;
 b=Mh1XT48bRERjMz0Xk2CY0XvvuZnkru8cOHV4cPS4KUV+qhuSOHLpR9Acr6aByvbOA2cUsOhWsrxVCG4cKKNKhohVADvhSW2ysk/YperNb2YxTeLvGF7UyvI+Oq5RxBrNSIB151Yls1Nt/F7F2n9GJaDTJCeW82qmZGUEMc2XqR7o2+oltZAg/lVYIA5CoabVm1Zd3tGF48ay3xIyL+H96apbIVdYJrJ0f+GF/S7kh0qdhOWMXnsB9Q1sLWPkjOQHiEziOR10s6tJbwwqSn2wgG20vMoTUXo45fQTaHp9DVBqUkLLZojkZJEiXTahgJI2I1/mkBMxyUR846BzK3e7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8cdd0a02-5a8d-1c4c-9012-c4f1bb08201c@suse.com>
Date: Tue, 5 Apr 2022 11:29:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220405091616.200270-1-michal.orzel@arm.com>
 <20220405091616.200270-3-michal.orzel@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220405091616.200270-3-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0010.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10cb1cd4-a35b-41ea-8863-08da16e6c17b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4942:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4942CA84E3F59C469507D2F4B3E49@VI1PR04MB4942.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VM1gaSpMvHxxErYgyb5EBJEfuI+HEeQMd1GFM5LcLRWgNQartED+axD0sD/0JD0sM4FW6NH3AgGn08KbT8ACo0TDoXd13KILgYU1GykFRHP7yHrEbKQiX0qLDa6u+WLBKcbuKlvb0+SWryymjbaIhH8cbA4YknXe7SQi3Uzt0h9ZK23jVo/l2syTG5UAgOM3MyiHJoPjRf3Vhz4JUmIra6d5knUOAav25pwv0f3Mmj50YCD3QpeMt+K3Q64PIFi5LOK2Na7XI0YQufFwzLSjNnNpTnud5QiT4oGhchW5jtBZ+7jU/crVsHecq6iUcw4Uz8oFCgjYXOvnccFG8ob5BnrBBFnGnaa9hBRrUQ7AAdkhJkmkuGQC4oik7qF9LfIy43YXZhIRh4XPII7x5BuPpxXNAvIQY5BSKFuZM2ZeVemrVqjQXgS/lyDA2I0GCPg4fi0E+IcFxuQiv1BWUDHxhOGy23u7zAJ6i4/ABsOO0sOIozNLCrgUBmTECJOMSRIAEr2RmQ2jJUfGPl+XZdW1KyPvKDydNcji33yoQ+MXKMeX+GdhWvBZ7OyFgG15CJpmX1g9jXF8vL0AhnOjeN46I+mTnojqmSLtXmuvpY+vrSEHQllDVdlCF97lTXAD6POGPyxPUO1ZUQzOL/gnF8RiUJirAlhDfKEIGFohPMEZhOZLLNEM1kzqWBI/D5vOxBuRFSgJGzulrCp88U9QkG3WW2g9cziPfkFTFG/U1EMIc5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(8936002)(54906003)(66556008)(66476007)(316002)(6486002)(8676002)(186003)(7416002)(26005)(66946007)(86362001)(5660300002)(31696002)(6666004)(36756003)(31686004)(4326008)(508600001)(6506007)(6512007)(2906002)(2616005)(38100700002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTNoNnpleXUycmI4Mms2N0djKy9UYWdFems5RG05bHRHMlJHTDBkSWkydkwx?=
 =?utf-8?B?REVEZUhmcmlWdlkveklZMWs4ak9QQzcrZEo1SVF3TEpsSWV1UGZxYlB4ME9t?=
 =?utf-8?B?cmdCeXhaUXFVZDFMejg4ejBTYm9RWTJGRTJ1Sk5BNlVMRzBsV3ZEOEhXTnMr?=
 =?utf-8?B?YkVrcDdnWitJQ1htNHM5Z2w4eUhIbXRuVXlqNFdvR1lGdllmRzVxOTlBbUgv?=
 =?utf-8?B?Umh1UVhLbHU1VzlwK1ZqQjNKMXM0M3hXdjMySTdPSEdoNC9peTVqTXE1NXFK?=
 =?utf-8?B?enFwalYxQW5DblkxQkNDNHI4dWlpa1gyOHgwdmo0WU9Bd1JoZ0VHaHFaQ0pv?=
 =?utf-8?B?YW1TZjg1SUJSNnpNU3JSNERKdStjYWh4d1ExdS8wN1NBNVh4U0pCQ3hBSWxm?=
 =?utf-8?B?WXdlekZGdThLck9FVlFEd081Q1pkL1NkRzlFUi9rYldqS0puWUxIbzNQWUU4?=
 =?utf-8?B?ckRkNUQxK1o3YURtOGowZURkY01obXp2TEZMa1VaVTUvRGtHK0krcE1Uemo5?=
 =?utf-8?B?Y25Uc01FUkwxV1cwWXhEcDNiRmhpTndaUEx0V01NL0xNMWgwdTVOM0ZBT2Rj?=
 =?utf-8?B?Zzd0MDkwUHl0cTh1WjgrM1pWVm1FNnVFMVdrRjF1dkRqMnMrWEs0NEhkTjBE?=
 =?utf-8?B?YURzUmlXOUdCb3pPcllJR2dvNERldXAvWVY2NjlIVkgvSklSU0FkcFpPeDI4?=
 =?utf-8?B?L2FhaG1SYVlCdEZJNjdjOWxuY29YZ0U4S1BxZXRVNmc1eERjVFdZT2lDTDIv?=
 =?utf-8?B?QXJwek1ERWtHTjRCbHBneFF6KzhNMVFVYXVsSDhZbUt4N2tOMVBKWW53b1Uy?=
 =?utf-8?B?NFhOUmFVczhVMm1iaFNGWVd0dTdPSGJzeElod3VhbjhNM0I4ejNoeFpjcnQ0?=
 =?utf-8?B?ZU1OWGhTbHNycjloQ1hISmdGbG1GQWJSN3V5VzE2MlZBamVYaFhTQU8zVjY3?=
 =?utf-8?B?N3BSNXcxcVZDSVp0aURzZnorWmdsR1RUd0d0N3ROanpYbnk3RnZaUnlPNUZW?=
 =?utf-8?B?d1hYekhvNTB6VGd5R09lemF3RjZZbUFiT3FRU2ZYSS9ieTc3NGhaaENRb2Vk?=
 =?utf-8?B?UTFDeUk5eWl0QTUySDJIWmhLNk4rNHJ3NUVISkdMdlNac2p5dlJuaEd6TlRS?=
 =?utf-8?B?akZTcHduYlJHQ3NnU0ZVbGRtTVIwUlVsWDFwc3p1Y05QNWhPNGsxL3lJUjRi?=
 =?utf-8?B?eDBYTE9ZdXY5a0hucmVZVGdNYmc0VHE0enRSczBGRmVEMkttcXdYdkVJV1Fh?=
 =?utf-8?B?U0ZBSnBRTml1cm1iZ3hrc2d5LzRmMmF5TFFXREZ0N2kwb2lOMWlIeFQvZGty?=
 =?utf-8?B?eVdqS1NpLy9jY2xkYTQ1UG1oWGNFeVJGZ3phMStrOHV5cFh6aUg3S1NYTENV?=
 =?utf-8?B?aHFudUVvQ1V2T3padW11VVN6bjVYaFZNSHZHc1FzcGE0bUdPSjROYWV5alpz?=
 =?utf-8?B?NEU5Y1RpTTF4UmtGZ0NWLzdRSjlOVDg1NFJCdTk3NXN3RUNvcXRoWVJ5TVd0?=
 =?utf-8?B?Ynk3eHBFS0lFbzcyVHd6L2RSbnlRaG4yRVZ3NW9VL3YveTNTQjhUcTRZbWRu?=
 =?utf-8?B?bit0NkNQeGd4b2trV2duMFN0SGRIQjFTeHptc002c2prZHJpZFBVbldBMkQ3?=
 =?utf-8?B?SmNpQitzRWNuNWxDSU41NjFLR0F1OHgwYW4vVUNMcGZOdHc1aGVpNW9NWnlR?=
 =?utf-8?B?VnpYWmUvTUJ0MjdGSjZWbEZxbEtLZVA4azhMeUNPc2QyWlJMcEZINnVxdnR2?=
 =?utf-8?B?Mms1cHgvRzVORlFGdjFTcVlkQ2E1SGxCT2p1QlMxa0Y3UDFyQTYzOUJuQUdO?=
 =?utf-8?B?S3c4Wi9qVUN3RHRGTDY5OWRQdXlYVVRyMkhBTmFrZzg3Zy8zc0swVGZsRU5T?=
 =?utf-8?B?NlNSUlVzck5GQ1c3ZCtBbFd5WFdiUXNRZ2VQbmxFZWRsY1U2enVzWEpNb25k?=
 =?utf-8?B?d1ZkNkc3ZjRWQ29ISlhXYlE3eUxSYTBaSVYxU3NvUTA2Q1diR2FiYUk0MDFP?=
 =?utf-8?B?TWNSU0o3YzJKeEtIM3RHMjdSWUVIMXZkalo4a2lvUVFoWUVGaE5FTnZOSkhP?=
 =?utf-8?B?YW5IMXArTlhGTWphUHFPWGpVL2l2YWpoOTJneDYwRnhZNE43Y0MyTnhhYmZq?=
 =?utf-8?B?RW5EQTloNlBYc05FM0pxQm15Y3lHaENQZStuMnZpYmVYTlZuUG9QNmV5K2R5?=
 =?utf-8?B?aVNTOG1DKzhSWEJiYmhCdytvKy9pYS8rRXFPYzdYVmRPL1YzK3Q3L0cwRFEr?=
 =?utf-8?B?emFjRkY0dnU1cnR5RURmN2ZNRTREQzJaVnBxRlJQNHNER0sybnFpR0NPNDQv?=
 =?utf-8?B?SEs5Y2tXdWluTzlwUmdRQmNMdnVxeHM2K1dMSFNoOEFtVE11STl3dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cb1cd4-a35b-41ea-8863-08da16e6c17b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 09:29:17.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClztkR5fNPzPnS9QBA+VBhaGBzAJh1tXChVXarzu5SkVbIyKIee7185IO4HNrmwZtUjKdyj1gnJvwzbebqrKlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4942

On 05.04.2022 11:16, Michal Orzel wrote:
> Populate header file xen.lds.h with the first portion of macros storing
> constructs common to x86 and arm linker scripts. Replace the original
> constructs with these helpers.
> 
> No functional improvements to x86 linker script.
> 
> Making use of common macros improves arm linker script with:
> - explicit list of debug sections that otherwise are seen as "orphans"
>   by the linker. This will allow to fix issues after enabling linker
>   option --orphan-handling one day,
> - extended list of discarded section to include: .discard, destructors
>   related sections, .fini_array which can reference .text.exit,
> - sections not related to debugging that are placed by ld.lld. Even
>   though we do not support linking with LLD on Arm, these sections do
>   not cause problem to GNU ld.
> 
> Please note that this patch does not aim to perform the full sync up
> between the linker scripts. It creates a base for further work.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


