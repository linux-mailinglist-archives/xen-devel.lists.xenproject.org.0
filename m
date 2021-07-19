Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D85A3CCEBA
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 09:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158154.291283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Nyh-00054s-TY; Mon, 19 Jul 2021 07:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158154.291283; Mon, 19 Jul 2021 07:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5Nyh-000524-Pk; Mon, 19 Jul 2021 07:46:15 +0000
Received: by outflank-mailman (input) for mailman id 158154;
 Mon, 19 Jul 2021 07:46:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTRW=ML=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m5Nyg-00051y-JU
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 07:46:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63408da2-e865-11eb-8aed-12813bfff9fa;
 Mon, 19 Jul 2021 07:46:12 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-r5wBzxIPN-Ovx1y1dc3ySw-2;
 Mon, 19 Jul 2021 09:46:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.32; Mon, 19 Jul
 2021 07:46:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 07:46:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.13 via Frontend Transport; Mon, 19 Jul 2021 07:46:06 +0000
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
X-Inumbo-ID: 63408da2-e865-11eb-8aed-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626680771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6mL306FYP7Ry+mtp7PqTn/55XpmoS+G2PS5W7c5Tbv8=;
	b=ZatpjtCuC0juqtUPiq0XCBZVST1JItNOFlBMWjgXqG5HgeVn5iRB6P2qRzVCGsede4SxOS
	tdvy+A+jN38BSU1WJntakIPRVyTMa5ShasmzCLPeSepQQN4BU0OUC0gHwOKkwIxf0Uk7yI
	1mT/55Lrb8Vc1BhFF/pj9CrIC1jqWjk=
X-MC-Unique: r5wBzxIPN-Ovx1y1dc3ySw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AL8QMfGref/tpNiMQFODw9bLyJ4uItVw5tPdTg2TTfowjFsjTggagK1tvchXXWFnUseB7zoJlQpSgizZByvigE1Jgr/nIonh9VhbQKsp0APVo43NDh68gx02TL7IYPbqKG/HzIsHh1ShZ00hkkAfDZm3C3ge5lRLbpoFy1Cj+y9n2QfE9ttZjg96/7FSRBeh4988JdaupiPg04kn2HXrPgF24ocF5ZtIZsnTLMqz4MJqhT5VoBPtXpYOUsCARPw0ww2LMNrySRfCG6q3mjEOJZfpIZ7VJB01hJvyoTNessWPMTlzadvGy0mpbT3Jc134rc0Wx0vjrYYlapRrUVTq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mL306FYP7Ry+mtp7PqTn/55XpmoS+G2PS5W7c5Tbv8=;
 b=BpbOWdsTcaDp3CEjjZST6TIcFlNQ8smbmz+hgAefxuyP4KYhy+1oGMWOrKtMCcnJ/0pE/XNdXriu71xyfy43mCeRIF7Jh4w73Xh8xLfWTy7ORvxiaDesL39WBcswMWIlF3yK9ESYSGt5oG0KfZqKM57GrazgeqSiMlli8NYPobJgU7LL1znir48zQmxyAeWnMJo0DT0idaG5ZKQYjv8qJTAa0gBRDy9k3h6T/nJfEnU/o/mp4OLVUY9gTFU/bh+ZbfDV8GnN37DLB172PB3do4IlZZhMnu4BqKDdWGumCCMAi8kJOIhFh1k7oCkth+wkobGDyRcqLxa84ZMELimWug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Ping: [PATCH v2 00/13] x86: more or less log-dirty related
 improvements
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, George Dunlap
 <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <b77e536e-1113-6fc2-55b0-b6b4f7b91b18@suse.com>
Date: Mon, 19 Jul 2021 09:46:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a68b36b-c50e-467a-7880-08d94a89443f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233414BFDF5F4F85358E04A9B3E19@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wyVlmpketnzq1/Gxc9P0xYxysWtN3sQlX0pqg51RfQ++XEVrNVgTeoqYW46XwnKKUpeELU3zxCSWiTpaS+3qWp92Rq3ahu4baA1c7CeVZ6aZiIOiDcLovMK+ry39JW1hlNsJ1AgoPs32+VLBOal1AN0byIqJisnYpfoeBjUInrdjiFGPRbH6lLbwoi62aUmWoJBzjHLYpOY2qhVLKJjBC5pDTP7nW3VGLGuAkQMxcxOzUapIb81pyU740ftmwlvIeHH2FXO/0jcvuGYP9RxlZXbxYoVi4vvbU1xQauGByV1UusQiRt0qjhO1pNkLkCy7ZJCfv4EA0iSOKIpW7bNZoffJeGTUleYXGiFpWQC9dju5zOOxNAOcIkXB6PlhEsjXKlTWiZaeuzDd0Dfk/P/VsMn3bC5udU+50PJ7N49/yBTfzdy+i6100WQmfPvbeym1vY86a/3QWCgoL/pkU/1gietcJXz/L0+LwehsC2hQ5FHwF/dm2PGvO0mTSygwVzs0bFrO+AzwlZ5j+IrEfA2KmV2JjyRsbkLrmVi7tv7HJoJa7O7weo9ppzQurjPeLtLoGOk5gPwR+kedQ4ZpBnxXLqr3kjuG3a45uA6B4YIBCpRyVn2wyz7cRBcbgAk80ypzY8a4UHBvj+Ulxqc6+1J7IS7l/m8H9DGAJqRZNMbyXH8IVnzLWH6kY9moXuXj+HGM2y1U9pwXhKOGSlwM8yko0+3PI9FnimB+RCzA2vs7pedOTAiXC7UsANhmrA2etYBq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(136003)(39860400002)(366004)(53546011)(8676002)(16576012)(31686004)(36756003)(54906003)(110136005)(478600001)(316002)(86362001)(26005)(5660300002)(83380400001)(38100700002)(4326008)(8936002)(956004)(2906002)(6486002)(2616005)(66476007)(66556008)(31696002)(186003)(66946007)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGZwNUpaTU9WamliZkhSNkNjZVRIbnhLeWFPa1k3VW41K1BoeUdRc0E5L1Vm?=
 =?utf-8?B?aXh5cXIwUUtuUUcvTkNjMEIxNSt0Zmt6eHlQekozZkJmUXlEMnZzbjg0UlRR?=
 =?utf-8?B?Mmd5TGdyTFl1U0g5ODd2MDM1NDV3TnFhOHpodHUwZXBSRzkxOGg0bkdVM0t4?=
 =?utf-8?B?L0J3b2Fqa0I5WnF0am9EUzRNY1NMdGlIWEd0ak1uZDhnYUN3VnpzOHgzMFZm?=
 =?utf-8?B?YjZkU1ZUemJjMVovYmJDeHRCNTh3OGNvNEZ0NWNKZFUrZ1FmY1NRdzJ6MnVt?=
 =?utf-8?B?eXFBbDIybFRrZE10alNQT0t3VTdSYkNlOEZRN1F5ZGt4TEpIcDkzTnNMczlh?=
 =?utf-8?B?V2pFQUIwYitmdjVhVXRYSjVMTzMycW9vTmNKSzk4cXBIT05uczFIWDIrczNV?=
 =?utf-8?B?eDdhbXVza3htd3FBUDVocEN1YmxWNVIyMHQ0dUMyRzJQNWJ4b2xWckRmN2ZU?=
 =?utf-8?B?YU1CWkZLUHF4MHhmVGhremtzRFlFSVdGSVN3SnBVSGZNU0VQK0kzdUVKQ3No?=
 =?utf-8?B?cllnaTUxam5SN0tFZ0NTS0M2aWpjdE9RbmhjQno0ZDE0TmJkWjdhZUtoT3Br?=
 =?utf-8?B?akZXT2dnSFNUQUlwYk9RK214OHdMNmI1bnJjSmZqanNONTBYQlUxZ0lRanQw?=
 =?utf-8?B?TjZRdndaU3NpUVdhVFBDNEt4Qk40WlVoTG1ldG1WNE9oaEVhZ0lQLzlHYkda?=
 =?utf-8?B?SlgzNUJmNjBDL1oxK2RBbkJOSHZpUUZoUnFBUGtReElkVWdtUTFmdGZHZXFW?=
 =?utf-8?B?bEdNZ1pxeDEyNEFtK3ZVbXE5eE9MYUxDeW03dmVnNW9pbVVYVjhBNEdXQ0I4?=
 =?utf-8?B?VTdFQno0SERhRFBTZXF6Y2RrUmNHMXFuVmR0UDFHdGlFRVB4b092a252MzFS?=
 =?utf-8?B?QTVScEMwQXdtc281YjlMekgxTHFaU3RoVHNDUGVZeEVkTENqbjZ0YkFrajFo?=
 =?utf-8?B?ZmhicjU0SG45SDdUVFdray80TVp6VDNqenVWZ0RIL0tVeFpLZUxvVCs2b0tB?=
 =?utf-8?B?R3BRU2hGN0ltNFM0dm5KVzh3aXVXR2V6SWpVeFRKblViaFNIWHNlaVZJa0xt?=
 =?utf-8?B?OXp3R1JBWGtaR09Sck1vNyttOWZmZTI3dXZySTVFakFnQnZzYzB6MG1lYTd0?=
 =?utf-8?B?emUxVlcwbWVWdlVQM2hWM1hCUHdRMTRRSUo1eHJkN2hZT3NNb05JS0UrTHln?=
 =?utf-8?B?K3llK281NWZRenU0cGsxcXBYajh2S1JDYU1qUXY5VmZoTHlUa01qd2NnNFQw?=
 =?utf-8?B?bXV5UjJCRXAzblFxVEV2TXQ3TEZxK0RNbDE5clFyOCtkd21kS0VRN0dydDRH?=
 =?utf-8?B?L3hzZU5nMVVpeDBFVi9BdWZaM2xIc0x4WEN2dmhHb2lkQXcvNE41c29JbHh2?=
 =?utf-8?B?TDE4TkZ4cEVQK2tuZit2TzcrZHlOekFQOWVBWkRONjQ2bEpjc2xCb01oZ2t3?=
 =?utf-8?B?NlBtaWxIbVdZcm16a0czc0FuaU82MDB3WWoyNzFCTnZ5SXprWmtGVkcxZVRz?=
 =?utf-8?B?OG9PQmFDdkhHTmtJdkkwZy9CQ3RwV0doNkJCeFhQZk5kbXMyd2ozRFhXOUtq?=
 =?utf-8?B?Y2JaYWl4Um53bEZ1MnFBZXY4Z1BLNnhBWXFzRHk2R3hxYVpmNDBYLzhuQUQw?=
 =?utf-8?B?UGhkai9mcWZpaHo0enM2aUhlb3FSVktVS3JOZExPM1JXM05ENmpvQnFjOFNI?=
 =?utf-8?B?cVZXWVdic3hJejN4MHY3aE5Icy9kZnlHeGZnNWlWaFhQbFRaamRPQnQ2MmtB?=
 =?utf-8?Q?R869kshVAG5SPPKx+esR3ffv/Vwpt5H0bhJNc48?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a68b36b-c50e-467a-7880-08d94a89443f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 07:46:06.6890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/Dgpsw2m+IoJApLgUyQKCI8d5632CUSNg4gOj8D4Tr6nfD+xudF0jo1hIsVlOM395DhEDTW2LiwjV2R6voIfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

On 05.07.2021 17:09, Jan Beulich wrote:
> ... or so I hope. This series continues the attempt to deal with
> the ovmf change putting the shared info page at a very high address
> (which is now planned to get reverted there, but the general
> problem doesn't go away by them doing so). There are further issues
> with truncated value, which are being dealt with here. But there
> are also not directly related changes, when I simply spotted things
> that aren't very likely to be right the way they are. And then
> there are also adjustments to the underlying hypervisor
> implementation, with the goal of making the returned data more
> useful to the consumers.
> 
> With these changes in place, a 1Gb guest which has "inflated"
> itself by putting a page right below the 16Tb boundary migrates
> successfully, albeit the process takes from some 20 minutes to over
> half an hour on my test system.
> 
> In v2, besides integrating 2 patches that were previously sent,
> there's one new patch and otherwise review feedback addressed
> (albeit there wasn't any for a number of patches).
> 
> 01: libxl/x86: check return value of SHADOW_OP_SET_ALLOCATION domctl

while I did get an R-b from Anthony on this one, but ...

> 02: libxc: split xc_logdirty_control() from xc_shadow_control()
> 03: libxenguest: deal with log-dirty op stats overflow
> 04: libxenguest: short-circuit "all-dirty" handling
> 05: libxenguest: avoid allocating unused deferred-pages bitmap
> 06: libxenguest: complete loops in xc_map_domain_meminfo()
> 07: libxenguest: guard against overflow from too large p2m when checkpointing
> 08: libxenguest: fix off-by-1 in colo-secondary-bitmap merging
> 09: libxenguest: restrict PV guest size
> 10: libxc: simplify HYPERCALL_BUFFER()
> 11: x86/paging: supply more useful log-dirty page count
> 12: x86/mm: update log-dirty bitmap when manipulating P2M

... all of these are still in needed of suitable acks (patches 8
and 10 have an R-b though, and are independent of earlier parts of
this series). Patches 3 and 5 have objections pending by Andrew,
which I did reply to verbally without it having become clear
whether these replies were addressing the concerns, or what exactly
the misunderstanding on either side is (and hence which, if any,
changes I should make).

Thanks, Jan


