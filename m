Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7683BBEAD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150300.277916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QE9-0000pN-Pa; Mon, 05 Jul 2021 15:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150300.277916; Mon, 05 Jul 2021 15:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QE9-0000mh-M5; Mon, 05 Jul 2021 15:09:41 +0000
Received: by outflank-mailman (input) for mailman id 150300;
 Mon, 05 Jul 2021 15:09:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QE7-0000mb-QY
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:09:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03893818-dda3-11eb-844a-12813bfff9fa;
 Mon, 05 Jul 2021 15:09:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-0sHwquLPM4yUJ9oJgtlG5w-2; Mon, 05 Jul 2021 17:09:36 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Mon, 5 Jul
 2021 15:09:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:09:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR05CA0097.eurprd05.prod.outlook.com (2603:10a6:207:1::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 15:09:31 +0000
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
X-Inumbo-ID: 03893818-dda3-11eb-844a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625497777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5buNUgj+0oVWdtvoqKZy3ZklKKtVIW8m9kzUCtBgzHw=;
	b=bFR2ReMCx05VBme/Fno3elJZVffZNAsrM60rLBlpGat81kQuXqPmX7Ok1pKM7HUzusGvlw
	xxtzWvbPvkay59mO9IWgPLVLvsUR/IYhXTf366/O/XE3UsiOxEOCXxuLrtFHj8JfDUCVuH
	0YNWZ/dHcXzdnaOrHifAT8+d4mF3xms=
X-MC-Unique: 0sHwquLPM4yUJ9oJgtlG5w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAyiqCDOQ7s6l35fvf3Ps6ZxyqfFzPPWX4z/6rzuBIhkib4a9xwCwKY7/Qx1Ha8thTAFKRYkbuUsHbJkr9ftaOMtoeSEu/Ruva9F+4eiHnRY1Uda2SwW5T6cBK/RsSx1W12AuXBKBjh0JEBJBuMlpPs5foO8cS8fM4BiF/7UziVlrI7b0ZZm+QipkhE5dtg0DB2fuukPlpNJTqJO4wAZH++0yiguef+foCo9K20Z6lgFw3HuM70di8C9s2uwWGUkB+YQ3aJgZXzSlX7k0I9FdX1cpJ+ltsJVMsGZsbTJWVpJH86R7pbwldY/boxJlLnTNoT6vMWlSN5WikcsXRxcIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5buNUgj+0oVWdtvoqKZy3ZklKKtVIW8m9kzUCtBgzHw=;
 b=MllU1UZF7dAS8ngAhmZXe4gSN8HdRlugMitx3dL09/WzSeJMpSbiM4vh+gg2kg4kCkvI58hsmst8KBPolpU7dCWT/Txiy2aHW5KSoR9wh0U3fQUev0jbB9tBfdle4rH8nlbe+qVAsX2Y1C/lXV5cZwwB/lExFq0Lz0EjlruneIDkQQEyXF3L6BX+9eSfQkfENp4TLxF7lbWqOMYrFQf7qRlbkj3XO4s9t/2K8iCIAEcat2KREj2WcBeQmgDbZhSsTPab6d6sj46K0fzCaRLBf7EZv3MiZBxm0puvkJsqefmaPDgAjeRYKKpM5T3r2tits0gtbO1D6FsXn64+VUxbEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 00/13] x86: more or less log-dirty related improvements
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Date: Mon, 5 Jul 2021 17:09:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM3PR05CA0097.eurprd05.prod.outlook.com
 (2603:10a6:207:1::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e1a3f87-f789-4572-9ea6-08d93fc6e4bf
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70404E4B413FD3843FCA06CAB31C9@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cem+X/0k4dhgAaWMvqI/e8gjFeqpheR2FPuFUL8sLXj5mHCYdDXaj3SDJiJmWYRbgLbVAFdI8aPYJkG39a5KV7U6Y9Kwb/SGRyQtKUq6ZA8LXozQJI1TtpvelmlremfjbpO9iTWI/hz/7Sp6qaO9TcpXdz88L+R+k9xuX1afbHxkxcviM52KDDus8AXLyZmCtPDP0RkUieUaz0Ybx363Wj4vPv2iRfMpq6GJOz4dAsl0pWG/yQqFM/590mN7t4Jy49DU99HlTxb9CGQWqerSN9ZO55e37EWElwQqV7QCwP3GVJ8cS8hCnVtRdnIONnDTnd0h1JJ8zY9s44pI6C/ZcXgIHpdeiXXLgMZGh0ybAxoN9pvpzdJRf2TtHjK0H2FjXl5NtFiftvTI2Mp4QskT8Ze/rvgxS0b1Cw9keaXZ13id38KNPpalCLd9iel39QpnbDV86zYZycCUdHCbf+MELrwzkeAvWlbQUqsG9UyZSD59B67P/Xe0KA8M27oU/NkrGJ14oIhHmLBZaG7vJQ3FuoCZbTFIEZqySnM7k2+j141UFiuzRgiphSe92LACsTi29Y8b6GPsn5E1OitEU83LtptTg2kWJ8wpXDDTKwaPARp1cu+VJrjspkpYQ2DxtvhvYUo63wtPlCDnpVtTbhiNMqjoz7MH+mHPwVmYFg3nOwJaBt7OvJ3asQfKKV4k4IoGAqmAX9GqcONptE5BqrrINNsFgd24JA2xnq2J6TzVgVCX1i5CK9FxB46TeYx4bhxl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39850400004)(136003)(366004)(396003)(66476007)(6916009)(2906002)(66946007)(8676002)(16526019)(66556008)(31696002)(316002)(26005)(31686004)(83380400001)(2616005)(54906003)(478600001)(956004)(16576012)(4326008)(38100700002)(36756003)(6486002)(86362001)(8936002)(186003)(5660300002)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFNGMjU3VC9qakk3RzVQTmtuTTUwQkFpdTN6T0N2V0dxWFQrOHlGQkFWN3Zo?=
 =?utf-8?B?ZXZFL1NITzBzRDVTU2F3L0dUOU84Zk5yRWtDb25leHpaS2JWMVlrQUFXRngw?=
 =?utf-8?B?bmpaU2Q0d2hlVTE5SXd0dEE0dlFtN3o0THZDOGVTZnYrUEhEM3N4ZDhYUHFa?=
 =?utf-8?B?eEFXYnczRi8yMW9vUnBPWjN3N3dNVVhlZDFMWEdVazU3eFBFb25QbW5TL0Jq?=
 =?utf-8?B?ZEw5RnU3a2Z3NnhubHJaS2VPQ0M2TDl2RDZZNkp6dEY2UTVkbk5KbGpuUlBR?=
 =?utf-8?B?aVhmOEtiV1hZNW5xc1o0bjlCcUpnNXJUaE96bmViRkxOalZ1c1RUNnhRbzZk?=
 =?utf-8?B?R0c5SVdsR29ib0VwNWs5QVB2MUpmN3g1bXpUK29LcFUyY0ZPWGphOEthaktY?=
 =?utf-8?B?eXVqNzBFcHIzNzQ3NktEUmFSSEQxUjlqS05hMlUxUnhyano0YnZUVXBvZGJu?=
 =?utf-8?B?SjIzdzZOSVF2bEp0eFRFYUtzRUJuWmJiajhiS2dLK3d0MThjOGZ1Qk1DTGdW?=
 =?utf-8?B?V2RNWjRQcWo5VkJtaUNFVUJBaWprSUxjWkhuVVplcjdUdlhCWThIdjFUbHY5?=
 =?utf-8?B?NjMzdEpSVEhSdTRZUVRRaWowOFc2VGlmWGNxOXFVL01WUDNYUHh4TzNYK3VK?=
 =?utf-8?B?LzVyVkwrdzhvaHhTczR3M2VNYkRZaFQvdTcrZWhvbGZnVGF2aksxdy9KeTNQ?=
 =?utf-8?B?QjgyanA1bTBtK1RUaFp3QmhiNDdaY3JtdFZRQWxmeU5jdzFvcUFVd0V1S1Rl?=
 =?utf-8?B?d09TbGdYMEM2cGhQaVlTUGg5VDcvMTlVS1NoUm4vRG1td1E0b1YrYktzcFo5?=
 =?utf-8?B?QlRKZ1V5RmozYkJ0KzJjNUkzSndaYjhvTjd5TWNhOVk1b1NmWk1BdkVUdUl5?=
 =?utf-8?B?cjVjYWtUOGxwaG9GdGJuTi9ueXpTci9wMGV1YUFvZUtjMU5WNHJOWXEyd2ZM?=
 =?utf-8?B?MnJISU9KaEd4OFExbVVWTVlCdU5raVlqR1hiTGY1cThaTEtnRkRBMXY3WWFH?=
 =?utf-8?B?ZXRRNzhmZ2xLQXpmS3lLcWl2L1NSVjl1Q0VQR0hkSHBucW9XZ1JKZlZueWJo?=
 =?utf-8?B?TEg0OE05L1Q1ZVZJL0pTQ29HYUhKc2FxM1RwMWttUEh2ZnZYeHRjSENWZjZJ?=
 =?utf-8?B?cWJhOEVpb0pOOWRUNkhsejBLbWxHUkxKeG5FN3JtUnhRaElYK05nT1hFbis3?=
 =?utf-8?B?TjBlWmdRbFhObTF4WmEzVytyUFlOWFpWNWtqb2R1K1VhejFpTng0NUJEVkhy?=
 =?utf-8?B?WGFMSDZnY0RvWTZpeEVhZmJaL1ZJUmJ4S3FVZmxWYXJJd3Q0UzlEOUpiNnNu?=
 =?utf-8?B?T1Z4SDRCVkdxRi9scXZDL3hhbmFEbFI4V2wrT1ZhOTVLdmZybW4yOTZWeTJy?=
 =?utf-8?B?NkIvbmxiei8veG1QdUhSaHZqOVB5WWVBSUZZSGsrMUZqRTF4MFhjUWJRZy9y?=
 =?utf-8?B?aTRJQ2Q1SzI4Sk4zUDJSRGZCdVdVRlVWeDVVUDBtaXNPUG5pZVNya1BPbmsx?=
 =?utf-8?B?RjR3QVJNMDFOcmlqcUNyNk1XVzd1VXVEN2hBSjhWVWdFZHJ1U2JMVVVpUTY5?=
 =?utf-8?B?clM2YkkzdHFWamRwZXZPOGxIMnlyWEtQQWlMVm1JMUVPZjJPTzBzR3NZejZ6?=
 =?utf-8?B?SlVLOUxxR1F5TTcrOFlmTE5TanVmU2labFl4c3FQVU52dTdPamoxUDU2aE4x?=
 =?utf-8?B?bkl1MkFoTDQ5WW1mb0ZvV0N0QVlVSTN5Wlg1N3d5WC83QzZXaFRuenROQW1X?=
 =?utf-8?Q?Y+G0pZF1ajALUQBFDyYlnIwEMvwkPdOMgyxGyv1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1a3f87-f789-4572-9ea6-08d93fc6e4bf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:09:32.4582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyDOcpotiAB5HMVvw1cBXjnfe1NzpjCYn4J8yQJeQ1PxW4U9CYEGUYC8C3/LKa1DwhcJKE/GU7sUvbDpSgrQcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

... or so I hope. This series continues the attempt to deal with
the ovmf change putting the shared info page at a very high address
(which is now planned to get reverted there, but the general
problem doesn't go away by them doing so). There are further issues
with truncated value, which are being dealt with here. But there
are also not directly related changes, when I simply spotted things
that aren't very likely to be right the way they are. And then
there are also adjustments to the underlying hypervisor
implementation, with the goal of making the returned data more
useful to the consumers.

With these changes in place, a 1Gb guest which has "inflated"
itself by putting a page right below the 16Tb boundary migrates
successfully, albeit the process takes from some 20 minutes to over
half an hour on my test system.

In v2, besides integrating 2 patches that were previously sent,
there's one new patch and otherwise review feedback addressed
(albeit there wasn't any for a number of patches).

01: libxl/x86: check return value of SHADOW_OP_SET_ALLOCATION domctl
02: libxc: split xc_logdirty_control() from xc_shadow_control()
03: libxenguest: deal with log-dirty op stats overflow
04: libxenguest: short-circuit "all-dirty" handling
05: libxenguest: avoid allocating unused deferred-pages bitmap
06: libxenguest: complete loops in xc_map_domain_meminfo()
07: libxenguest: guard against overflow from too large p2m when checkpointing
08: libxenguest: fix off-by-1 in colo-secondary-bitmap merging
09: libxenguest: restrict PV guest size
10: libxc: simplify HYPERCALL_BUFFER()
11: x86/paging: supply more useful log-dirty page count
12: x86/mm: update log-dirty bitmap when manipulating P2M
13: SUPPORT.md: write down restriction of 32-bit tool stacks

Jan


