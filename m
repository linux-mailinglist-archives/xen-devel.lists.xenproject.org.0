Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDA55E9A76
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 09:33:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411428.654355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocic4-0004AK-02; Mon, 26 Sep 2022 07:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411428.654355; Mon, 26 Sep 2022 07:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocic3-00048X-T5; Mon, 26 Sep 2022 07:33:11 +0000
Received: by outflank-mailman (input) for mailman id 411428;
 Mon, 26 Sep 2022 07:33:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocic2-00048R-3K
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 07:33:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77a60d29-3d6d-11ed-9647-05401a9f4f97;
 Mon, 26 Sep 2022 09:33:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6811.eurprd04.prod.outlook.com (2603:10a6:10:fa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Mon, 26 Sep
 2022 07:33:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 07:33:05 +0000
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
X-Inumbo-ID: 77a60d29-3d6d-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9h+Qlr1bPwoi9Xs/kYniLYCg1B++A1p4b7z/JNcFyaPyA5KLw0o3hq4DItK6zy/LAcWQOCLfuIWYx76wHnd5KCmOC8qMGIGol91WgV+/drBddnBrdb+f3CBoaDX+LSe5xtys/KYUdGOmS+2Z1BQ0ZDYewHWfnSpLz1oT+avdOCej/xGoCq2vHdV0KGBooh3p59SOe5yJulHPaWVTpbqzG4cA/M6gEIhLVU9Lcu5P47JQIdfx51l8EQVseGFcGfYr7y4PHQ5G2BHiyt9uHbkKihiaRchefg/2MWcGflbMave1eb1r0jnF/NvDqX8Rk+qaHLG2wxii4ZklE2soAS8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWcXbLBlrUdJsiomgj1tfYqTibopzRmvio1yIqp9zkI=;
 b=BSQseq+F8waYyC5kB8RSUO7LQqea/4AhG9d3vncN6AHU/QyF8FG2scD8B9I5gTYOEY4efdBowyLmL0my66JDLboAVIlXF9hHK4JJ/MxSZeOq+WXwCQppS2Xgu1SVNDgnoN6HVS4Ca+L2HYhZGx+Mm8HftkPrX4zF2AcXQi4/g4785isUXT6Fl82ZEmdcXETbMJFo2op/VxBENyR78ZYHV+/sJEd2IMiFZuq8lGzTXG7GZ0tcr8JzVXFFh8lP8DWTgIRoWy8ecIXtH9wlhpkuDNvQ4aENHiXLPx413fnZhxVv0diYnl0SPljej81rssSBevXm+mj2rjHANEzuyLq/dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWcXbLBlrUdJsiomgj1tfYqTibopzRmvio1yIqp9zkI=;
 b=z737yYUSZw4tbl/AeohwubkwHjxRuCuVVOG8BoxeafkHTEFhbBG7MwLqWjWiRhZK/xA0q71S0ZGmyQ5IFtbhT/33DtN6XhfNzN2jYRsROoT0nTeP7fgTzhJGNKPh/8QZ64Ku+3mEmbeAhkuuo//nianYuAaW5autc/lr+M/j+HRdb5dnIvnQY0iGhTIUoLs6o1IsQLB3Vc88S7nKHkzL2snlZxJjoX1t+LbK1rwaG3NsoBip9BSBHc04odax97iEgXp/2Zh3PvsXW4UG2DACPxV4js9JzmmlSPpK8IPHvPg3qTigO7I0maoESmgXiFCSjtQ2y1CbzsoMZn/3jSXAtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <489b2308-8ab8-c1c0-1471-04aa1c4bf0dc@suse.com>
Date: Mon, 26 Sep 2022 09:33:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] x86/ept: limit calls to memory_type_changed()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220922160516.5929-1-roger.pau@citrix.com>
 <ddac718b-0ffd-0eb6-d784-4c35ee4b42cf@suse.com>
 <Yy1vvemAmiTdPZxA@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yy1vvemAmiTdPZxA@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0030.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 361e5284-71c4-4d2d-fc7a-08da9f9159f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j5KhOvdj6xsvWF7mAG/SBFq5bHoKVD0h4rh6ZNWxXAtCU3WJo6toPmJUolZhPuPnYUoML78zPN4q7vTN1kSdOihuKs8liY1Zzj6Q3A1BYhDkPrPxrMIf8vj+jLqpAza2OGChmRh2bOQMmsw/bcaJK+qj0ebeib+pBWEZ6VUyTSyagiqV4cMqVovjMuG1mBITKq6D3Lm7VfIX7ng9PsrPfV+giNiIYprqpm9uK4F0iTqgh5pYmbHE4ilDhudZDuU62sTKoRgXNJDRnEHkegABAq5ScJ7nX9pSlhi5edRtuJ6QRRoXg7gAX/Xs/h7AFzuca83cM3jWN1RuWRXnQnIFzENRAuoWQ/Lv2fmOziM7dj8VSM4s/ts/X3TTSMWot5gkURFYiHtI00rEM5iLFXyept6rXG450MlgkLsuQ0tpEFBfVtiK4YTsslkaNXnodLnLHrzeQjxoiI2gFAgS8PCEUwdBjCZw3VF78cNKkqwleec5Uyv7jWfLBBrOuWYaFz6UN5QRcvjRQ3c32j+HNfYi8U0vO3igWW0v0t95wWyyCCLZCTvm4lxiBaJD/6t8Ec+GUwOyBrJd/J1m9QxqfeFufVLedP68qMCv9nOiFj4iRFhb4e+Gs3g2qcpf7LsnJxdw4GeWuyGVEnZYZtn7zafsqy4iS43kJ+OrMPLTXCoXl2KzoYEaeVfbNwSLZK47CIpirvpKhsnwvFpa4/QCDl+f1pPM2v3j+K5Esgo2nyCpkIi5OxFBLgorgM5osYqzVsX8Q3zVfkkR+MdPnmFPsAXFIYXm+HsmKE7YtYzSBQBSIto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199015)(31686004)(53546011)(41300700001)(2616005)(186003)(6666004)(8676002)(8936002)(38100700002)(6486002)(5660300002)(6506007)(83380400001)(66556008)(26005)(86362001)(4326008)(2906002)(478600001)(6916009)(66946007)(66476007)(31696002)(6512007)(36756003)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1VsdnpJZUpxR2pZMHo4YmtLRk9qbmNNd0g0Q011QXJISDNGWW9WQ3pqeitQ?=
 =?utf-8?B?MklSQkVicml0ZWJ0aDBQMExjclB4Vm44L3RPRmlTQ001SUlXY3k5RW1kaHJl?=
 =?utf-8?B?MnFqVVdUZGphSWFIaFRpYzltUk5hZlQzMHdQT2k5ZW9IalNReXVhK1ZGUHpK?=
 =?utf-8?B?dTNOSzNCeDFsZkFHdzdhNWU0NjVmS0VIN2IrbndGZFdZcTY0ZFlGekcwcEhj?=
 =?utf-8?B?NmVYS3NMWjdoTDlwNVE2VnVhTW1SWldvdlNiYzZWd05zRzlUb0g5Z0xBUC84?=
 =?utf-8?B?d010ZUNLTEkvcExPOUJzc05YMDY5d3hDSzZvSUdRQTlnTHZaMGhpd2VHdXFM?=
 =?utf-8?B?YTVXY29ON2pkbXIwNTVHdndVZngva1ZKRFdMQkwrWHBSd0J5WCt6cm90QU1Y?=
 =?utf-8?B?T010a1RCeFM1YkxZQjg2YlZoYk8rc0grZEJQL3hyUTRxYUtaL3V3dXRyR3F6?=
 =?utf-8?B?a2wrbHhnTzFTaW1mMGJZc1dMby9uT2Y0YU1oZHVidkw3eUFmemkvODVoWE1k?=
 =?utf-8?B?bjNyeDJxb0pha3JHbVRmdlZoUHpON3Q3SHVsVzBiTk5ab1FJb1BkN2lMU0Uy?=
 =?utf-8?B?MG9JOEM5MGhkUUxLejVra2ZZVDZJTW5Lc1NqYXpvUSsxRjBCcE1DTnNyaXZG?=
 =?utf-8?B?dVUxMGwwWnpjZkwwK2N1VTVXRTh6VUMxR2lFMnA0TWV3R3ZRdFhqVXBDY0Z6?=
 =?utf-8?B?Vk1MREVjNkl6STFpT2U4azBENFFUeTRwVG12ejU5L1ZndE9GekxlYWZuQVdB?=
 =?utf-8?B?Sk5HdDRUSXY3SWt0bU1yQnE0ZFhZUFl4VmF5NHNzdmdJTHZTTkdhaFZMSGlP?=
 =?utf-8?B?eDZnTTVERHozcDlaS1RDMzhwdTMrYWc2c2JNTDZUZE9yNFRJd0F5b2g3ei9K?=
 =?utf-8?B?RWQraFNTVllXZm1YZGlYbElycGpwdWtuRDJoMXBwWnhTUVhxTVJwU1IzTFlu?=
 =?utf-8?B?cVFYUUZpRVQrQVlrRS9XcXVEeE9oWTlvVisvSDlEOE1qSFVBTFM5a1hkNGFa?=
 =?utf-8?B?Ym9EK0puWDhHKzgwaHNJK01qL0luTnlnN3JhNXdOZUIrRGx1VERMNm5GdUNt?=
 =?utf-8?B?WFR1L0Jqc3g4eDRWR3dQSnJvMWJFSWxKS2xNaDVMTHFiZFpTbVlTc2NRNXRh?=
 =?utf-8?B?MU1WU1Q2NUFTZkswVE5nSTQ2TVZHdE5jS1JrZVN3ejhoay9EdlQ2Rnc3am13?=
 =?utf-8?B?WEp4M2t5WDZsbUNrYVJ4dHIzektGdjBRd0txaVZINkVUZEpjK3JkUHd5WkVG?=
 =?utf-8?B?Mmd5YTQwS2dxOXAzK2hsR0RNQWNDdFN5cUF1KzlnRW4vZnpDM0VhUlZsMTY2?=
 =?utf-8?B?eE9BNWdKSitOMTMrK2ZFYVdDb3VJSVh3WWxpSzUrZ21KOXRnRitKanpYU2sx?=
 =?utf-8?B?KzFQT2RxSExhT3JYeG1wK3VQY1p6SGFKM3NUV2xtRlBOdFRVYkdlS29SM1Rm?=
 =?utf-8?B?WG54YkVwNy91RmlGZ3lWQ3h5RnYxcFA0NldOblpnS3RRZk9hSlcxN2NGK0hS?=
 =?utf-8?B?VUpNTzRBU2M5SEJ1MEFRcFEwWWJQWkU0ZFp5ZUlSRHo1cVV4cXNZOVlzMzNy?=
 =?utf-8?B?N1U2OXVScW9UTTA1bDc3MFZvWjhEbDRiZ2pKUTVIclJXdkpBWUduc3ZDTFpZ?=
 =?utf-8?B?VVFoYlBkT0tBc013ZXRnZFVyNVpDdWRaOWs1amJCWnF2eXpvdXV6cDRLdHNI?=
 =?utf-8?B?NGlLQVRKS0V6a00vbTRjNnA2NnNLSk8xUGRHWklaUFdoTzNBZnF2WEFSY1Nk?=
 =?utf-8?B?OEkzb2V2TkRvYmo2WjBacUxuZ3FJWFhNZ3pXcEovblRtd3hYdG4zZW4xaXJL?=
 =?utf-8?B?R1BzcmJjLy9JYUc4VEloM0lvR0tQdkE4ODlsVk1vQ3FXVDlyZjRnQUNtVGJR?=
 =?utf-8?B?YnZIMU5kL25JUTd5cFlpVVUyNzZtbVVhWGZOUFljR0w4SXk0d2t4ODlkbHNL?=
 =?utf-8?B?WWxwRWd4ZWtmNE5GS1V5Z2Q3WUsrTVlRMWpZcFVKUEFhaEY2cDYva1RBR1Qz?=
 =?utf-8?B?b2JpMVlselpwZHFRRisxNFluR0liamN4T1RKZWpjSWJlWTdCaTdJSDZxUGlx?=
 =?utf-8?B?M3p1T2xabFFoMURQU0RlckhQK2FsOTdlVnZlQ25FMlNtaXhlYVJsRWtlWEFY?=
 =?utf-8?Q?SLU4Aq9uzZ7RtGNKV9G9D73nK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361e5284-71c4-4d2d-fc7a-08da9f9159f0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 07:33:05.5948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDc6W09b1O2ZSFCAujXwTHfU/wDiWGt4ppfRIKLogYudUhIvxqCKxD0u1e2ro77Y4NRrXXX/JfOURY2pg65d4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6811

On 23.09.2022 10:35, Roger Pau Monné wrote:
> On Thu, Sep 22, 2022 at 09:21:59PM +0200, Jan Beulich wrote:
>> On 22.09.2022 18:05, Roger Pau Monne wrote:
>>> memory_type_changed() is currently only implemented for Intel EPT, and
>>> results in the invalidation of EMT attributes on all the entries in
>>> the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
>>> when the guest tries to access any gfns for the first time, which
>>> results in the recalculation of the EMT for the accessed page.  The
>>> vmexit and the recalculations are expensive, and as such should be
>>> avoided when possible.
>>>
>>> Remove the call to memory_type_changed() from
>>> XEN_DOMCTL_memory_mapping: there are no modifications of the
>>> iomem_caps ranges anymore that could alter the return of
>>> cache_flush_permitted() from that domctl.
>>
>> I certainly agree - this was an oversight when the two aspects were
>> split. One might argue this is a (performance) fix to the earlier
>> commit, and hence might want to go on its own with a Fixes: tag.
> 
> Was wondering myself, didn't add the 'Fixes:' tag because of the extra
> content.
> 
>>> Calls to memory_type_changed() resulting from changes to the domain
>>> iomem_caps or ioport_caps ranges are only relevant for EMT
>>> calculations if the IOMMU is not enabled, and the call has resulted in
>>> a change to the return value of cache_flush_permitted().
>>
>> I'm less certain here: These shouldn't be frequent operations, so
>> their impact on the guest should be limited?
> 
> Citrix has an use case for vGPU where IOMMU regions are added and
> removed during guest runtime.  Such functionality makes uses of both
> XEN_DOMCTL_iomem_permission and XEN_DOMCTL_memory_mapping.

I see. Maybe this would want saying in the description, to express
that there's little expected benefit for upstream.

> While the memory_type_changed() call in XEN_DOMCTL_memory_mapping
> seems to be the most problematic performance wise, I though it was
> nice to try to avoid memory_type_changed() as much as possible, as
> those tax the guest quite heavily with EPT_MISCONFIG faults and the
> recalculation logic.

Trying to avoid this is certainly desirable, I agree. But we need
to make sure that it's not "easy" to break things by touching one
place but leaving others alone which really would need keeping in
sync. Therefore I'd see such added logic as acceptable only if the
risk towards future changes is sufficiently low.

>> And if we were to restrict the calls, I think we need to clearly
>> tie together the various places which need updating together in
>> case e.g. the condition in epte_get_entry_emt() is changed.
>> Minimally by way of comments, but maybe by way of a small helper
>> function (for which I can't seem to be able to think of a good
>> name) sitting next to epte_get_entry_emt().
> 
> Such helper function is also kind of problematic, as it would have to
> live in p2m-ept.c but be used in domctl.c and x86/domctl.c?  It would
> have to go through the p2m_domain indirection structure.

It would need abstraction at the arch level as well as for !HVM configs
on x86. I'm not sure the indirection layer would actually be needed, as
the contents of the function - despite wanting placing in p2m-ept.c -
isn't really vendor dependent. (If AMD/SVM gained a need for a similar
helper, things would nee re-evaluating.)

> Do you have any suggestions about how the function should look like?
> I'm afraid the fact it needs the previous cache_flush_permitted()
> value makes it kind of weird to encapsulate.

Indeed.

> I've attempted to add comments to make it clear why the new checks are
> added, but I would also need to add a comment to epte_get_entry_emt()
> to notice changes in the condition need to be propagated to call sites
> of memory_type_changed().

Right - it may suffice to have one more extensive comment, but _all_
involved parties will need to have at least a cross reference such
that one can easily find all pieces of code needing to be kept in sync.

Jan

