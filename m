Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755F569F2A1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 11:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499335.770436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUmH8-0001Cd-R5; Wed, 22 Feb 2023 10:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499335.770436; Wed, 22 Feb 2023 10:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUmH8-0001Ad-Mc; Wed, 22 Feb 2023 10:23:02 +0000
Received: by outflank-mailman (input) for mailman id 499335;
 Wed, 22 Feb 2023 10:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUmH7-0001AX-CX
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 10:23:01 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0b5de9c-b29a-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 11:22:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6935.eurprd04.prod.outlook.com (2603:10a6:20b:10e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Wed, 22 Feb
 2023 10:22:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 10:22:56 +0000
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
X-Inumbo-ID: e0b5de9c-b29a-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jlq0qxK9Ds/6pID+/wPqHgn25q9JRlb4D1l8aIlzAUtFIi6EaZIhoBWT+kXdAA69JWQIuHV7ZXGwSFKBnja80x5/ZQtjK8WyTVJFQKOXtNHsZv3AEZ1tn+JY7tSZuLYmhG77cnqGKZMq0bTQ7CBoiGnnP5Pf+wPKecSF8xeaXupX4sgSQA0dhlaWePCCGizmBsh909BhUG/SUPWdMFjLY/OHQAgziiX8H3cZQwyizjRIj+zx+Y0uu14nD6X+40CDQoO63icfFOuyH23ToE1vn7OXrySg8T8jSv5q9tgm7v+aK4ZR5hbIyeXXf2XJ360fNe134pFdoNCc7YpVfBkYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OABGfhw/XniI7F6M7hCIrlgr1VnzTirO+SOQl/uiVm4=;
 b=MJJ+EQsDuWzTboHavD2Eekfz7wiOH2bjBMoQX5lxgLUuFlXTSigXWaDku6iZy9z12M4TPD9z1waPvm/lmTEqyZUyUvR3kM0Xox8/5SAuxcpTIADi9jD5yxYsm6CuoNhr09MrfvpTywl/Iv/TxBfK56/Sqz0Ygg6CybfnW7rx0yiyjDqo/23tZjtw2BRv0GiC3VRa9jTjGJNUYEkF7LTQvFscrFxquj1kkdaGJ6zlVr3Uz5piWS3Av/yCAn7Q1CS5v/GQK0uKLSgpLVreg/OYXAYmYtnwe0q86eczMHUOsjHzHOlz3kBVV0mFEzvqYDwrVODu8LgVsR/PiGuV6q6REw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OABGfhw/XniI7F6M7hCIrlgr1VnzTirO+SOQl/uiVm4=;
 b=c2v50GSSSwGew/jLEJ5YVJVjDKawZVsKjtkoY4ez6sm03n/GZu4VwWclz//kVSQ5rtSKOkHzxm9cDsk6jY4i9YuGsnLOYfrQTC7DEi5Bs3sgONrAVjbn7yDhW2bN8yTOmL2mTJJ6lKP69SSyQSuDSW5KIi1my1A9aak8sZ0a2WUbulhLDnsNNM1ohudNOAZZr3EliMFe+K8eYxQtjfZdK2AOgmwCA882lYU5urphTwobJg8OG8x/iPDcc7/b11hHsSmy7+R2iLVpnhsbbzkVIBM8iXGyRv+8mPR4Swhp0GNGVaW07ltzx+NJKQUw+UKrXHEp7FplK80A8vNVTv/pSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <359b8d70-0a97-8a52-fca4-4f6b7621d58c@suse.com>
Date: Wed, 22 Feb 2023 11:22:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/extable: hide use of negative offset from array start
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db58c3f-3b58-4cd3-67a8-08db14bec3aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QrmfSYRhs/UoW16GlVrkvu0Cdbd7jwsOPA9wKGWfvbKMS+/ezo6cQq7Xf67vnr8rIGzKoy5OlQ1dGefG49NKKJUThJmMhAw/mK1fK9OGDyC0HeRM4ei2jqOK//ZIe8ra5pKDCX+ZAk8Nw9Om0Iv4trZSyYoTpW2K4T7P7uS5gGGyrUZB6si214kHMQPAm30BAbSlui1BiJdfBAnfkyaHEmFoRW6JkMCZgonNAD3uZH6Z1j2P54iLu6EtmT9HzlEGVOWd6rsxVytsRNiM0ukwb2rKy7XLxmI08D/9QGipT4S3N6tZDwA31xeWFyhzETFKSjlJMK4qlEdogGfXNPczFN1VqOwNn6wwGXgLeFGJboEfHHSnO7NmuShVwk+o0N+yulOUJxlU2CvZHFjCTUIrjO0CwlaFRV+6QTHeH8BPeDhI/VQHJ8mFHBM64rcnqeW2fRT7L1PJmIEoJQYFuLzo7DNVWDAGiR9s302QXf6g4DqvkJ5lidtYYPRVj1jAvP6Zjj55qK+DqkaxEzDbKDjtcw9O11fZiLKoJsU3lsiLTYsnZ2dwDXI6G8KGBIZ/K90n4YG9YTSTfZtNjXuNIJYYo9lVCVQNa24P5kWdWnksTpBrytprGy75V8iiK5qyFqE4NmZIxTdNh1K+EuvnL/bIHfrnwtRX31Ol8u44eIReHQdKPjufQZFOkaez0VP8gFhEFJN01ieIHjSe2FV637Hnmd6h7xFfPZSyRqXkp2SF86k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(346002)(396003)(136003)(376002)(366004)(451199018)(2906002)(86362001)(2616005)(31696002)(83380400001)(5660300002)(38100700002)(66476007)(6916009)(316002)(41300700001)(66556008)(4326008)(54906003)(66946007)(6486002)(8676002)(8936002)(26005)(6506007)(478600001)(186003)(36756003)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGFQMlVMYzJKRnllN1UxUVAyR3d0bVZLNnp2S2ZTZkNQVnZBVDhsR3kvVmJp?=
 =?utf-8?B?UEdOQTNPaFNnMUZreEZ3WmhTZ0pvVTdESDBBbWVPUzB5U043MDNyWVZTY0FL?=
 =?utf-8?B?QUNzbWkvMjQ5MldWazY1d0Qwcm5rbVJTWU9ocXhPRjgyRlNYMEMwT0FQdmN3?=
 =?utf-8?B?QS8weUdQb1lMQUNmQnk0UlR3UWRMVmduOUFVSWgzU05pbFdUcEt6WkJFSzh5?=
 =?utf-8?B?SW1xYlorRVZDZEpQWkFFRjFrMFk5Z0NWRk9ucWlLYnB1c3FjMmsyUDFia1Jn?=
 =?utf-8?B?ekdOdDg1Y0xuUGhxSFZUUGM1WkQ0RzMxK255K3U5b3hhTVhJSmdnTkxiRGxr?=
 =?utf-8?B?eUs2MnQxakt1N0lMNW1SL1dGUjlDRUEwcDB4SW5ZRmpmSUhnSTRjWVJ2YUxH?=
 =?utf-8?B?Zm5KcmpEVTUyb09SRDhCSWlTNXdYOTE1bk1TenNnZVNyZkxzdm01bUpNU3l1?=
 =?utf-8?B?eTExWGlSMTZVdmRkblU3WFM3WFo0d05PSmZLeUwwazZhMExQcmZhTWg4eTRQ?=
 =?utf-8?B?N3FCNzJVZTFYZEk5L1A4STZ3am5tbXU0MWFvQ1V3R1FTTEhvaGVxRGgxVm13?=
 =?utf-8?B?T1NmcHJvdHpHdTFaaUU1TS80blJtemFPdWhVZWRqMVpvR2RSMkZubTFzWC9F?=
 =?utf-8?B?TkVhV1lsU1dQWXFaR0dnTnFGbllaeGlOeDZKTklRYmE4amlxT1FkajJ5eHBE?=
 =?utf-8?B?cDVaR21LZFFYUTZTOG1KUlRwcm1UT2pVZkhjYlVpN2VtWGxYV2VuN012TEdD?=
 =?utf-8?B?QVpXS2gwQUpqbU9NdVRtL1NMMy9KUHZvVTNWSFhCQTczbHV3QzduTm5mYTVh?=
 =?utf-8?B?MGQ3YnZKbDVCaDRSYlhqcjhwbnUrcEVOZHJodWFpaVhCYUdpVHcvYnIrNkdq?=
 =?utf-8?B?YzF5WWhwbTFha2FkeGo0azZxd0k0bE9Ib1V1Rlp5QlI5OGlUUmthVm9TR3Bl?=
 =?utf-8?B?RXhYOGZiSlNCd0ovM1pBU1p6NGhBajdMYUZzNytlOTBqUkZENm9penNtYmIv?=
 =?utf-8?B?LzBWa0pQejJwTmZuQzZrSU9hNk9MY1NQazUwOGNlZU5CcWlsVzJRZGhJWXVN?=
 =?utf-8?B?eDZIZFF5amtUQXRVNFk5MzB0dXY5RDVFNVI2QW1ac01zMVVPaHF4VTJVKzlZ?=
 =?utf-8?B?Y200QW02endDOUU0dTBSUWhNYkNBNVpYUkNCb3dTc1F4aVFMelNGQ0lPN243?=
 =?utf-8?B?SG9RRUkzUC9SeS85eE1VMmI1akY2VXNmdk1lVTFubXdPbjZjZnpnUUVTTUlh?=
 =?utf-8?B?YlFDWVFkOXFvWU9XdGk3RTJTalRjR245a0QxbWlHek5lT3lmUUlpeCs4Z2JX?=
 =?utf-8?B?MnRJUEV0QWFhZDFEM1M3OEVXTlFyWlJzWnZLTW9PQlNBdVFRNWhGMTVuRTdZ?=
 =?utf-8?B?dDVZODMrclNhOEpCSkhXN2hVeno0L0RxaXE5SVphWTNsRzh3UnBIdEQxN1A1?=
 =?utf-8?B?UUJxZjRTZitGd2d5azJZWGUwZXN2YXNjazVxYXgvVnh2OHJXVm1KRnhvOGNL?=
 =?utf-8?B?VWJxYzVobkh0VXg3TFc5MzRZLzRqKzE0YytjaDFiUDVnL0NtNkhQTEpIbGJI?=
 =?utf-8?B?d3cvSDZ1QzZtVzkvay9pdEltOExCQ0VuVWkxWTZabEZ6VERnQ0pMR2lHZTQx?=
 =?utf-8?B?S0lrRlhPWlVmRWxlU2RwU29vRndVR09Qeis5alpZSFF4UTlMQkdTc3JuQ3Vj?=
 =?utf-8?B?Ulo1cUFtaC9RK2k4M1FmUWRJVUFxTE1DRDNDaWZzanQydkpEekNDaDM1RzVq?=
 =?utf-8?B?VnhTVGQ0YWVLTER3YnJLL0JidmthbWJVbUNjQUVJVnRnV0xJYm5VMzkvZ3ZI?=
 =?utf-8?B?Y3FZR2J6VFRkeFBVU0cyS2FlbVg4N1ZQQ2lad08vODE2eXkxMlNFZmFYOEM4?=
 =?utf-8?B?ZU82Z3FwRGRKYktvZ3h4WVlTY2lEbDBOeWlTeTgxMlNqSGVmZHdoOXo5NjJz?=
 =?utf-8?B?MExySHJXbjB2ZzV0UitBdmdsL21ITjZOaE9TeE9HTEpPY1E2cGgzTGY1MnJt?=
 =?utf-8?B?aHV0Y28zSG5VYldRRExmUW9iZ01QK3N3OEJXZ0g5eWcyOHN6dE5ZemFNUFND?=
 =?utf-8?B?ditrTHV4Um9yZzBsY3IrTHVtNUtEeHJXSFVpZUVlT3VoeUFvS1FXQXNXTXJE?=
 =?utf-8?Q?mufGsRBNF5bdaSJoRv/qy+dhQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db58c3f-3b58-4cd3-67a8-08db14bec3aa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 10:22:56.3842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wknenollkm+xZXPIs78+Ja7+IHFhh7dJQXroSi8maF1Dao6IWbihA0QcIMyD8aaKDwa5vmK1Ckj49DEH7/tidQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6935

In COVERAGE=y but DEBUG=n builds (observed by randconfig testing) gcc12
takes issue with the subtraction of 1 from __stop___pre_ex_table[],
considering this an out of bounds access. Not being able to know that
the symbol actually marks the end of an array, the compiler is kind of
right with this diagnosis. Move the subtraction into the function.

Reported-by: Anthony PERARD <anthony.perard@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
To keep things simple, I'm merely calculating "last" as a local variable
now, rather than replacing its uses by suitable ones of "end". In the
longer run it may become necessary to actually go this 2nd step, as in
principle the compiler could inline the function and then still spot the
same issue. However, while the subtraction of 1 can likely be avoided by
suitable other adjustments, "last - first" cannot easily be. Yet that's
also an offense, in that it's calculating the difference between pointers
into distinct objects.

--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -64,9 +64,10 @@ void __init sort_exception_tables(void)
 
 static unsigned long
 search_one_extable(const struct exception_table_entry *first,
-                   const struct exception_table_entry *last,
+                   const struct exception_table_entry *end,
                    unsigned long value)
 {
+    const struct exception_table_entry *last = end - 1;
     const struct exception_table_entry *mid;
     long diff;
 
@@ -91,7 +92,7 @@ search_exception_table(const struct cpu_
     unsigned long stub = this_cpu(stubs.addr);
 
     if ( region && region->ex )
-        return search_one_extable(region->ex, region->ex_end - 1, regs->rip);
+        return search_one_extable(region->ex, region->ex_end, regs->rip);
 
     if ( regs->rip >= stub + STUB_BUF_SIZE / 2 &&
          regs->rip < stub + STUB_BUF_SIZE &&
@@ -102,7 +103,7 @@ search_exception_table(const struct cpu_
 
         region = find_text_region(retptr);
         retptr = region && region->ex
-                 ? search_one_extable(region->ex, region->ex_end - 1, retptr)
+                 ? search_one_extable(region->ex, region->ex_end, retptr)
                  : 0;
         if ( retptr )
         {
@@ -198,7 +199,7 @@ search_pre_exception_table(struct cpu_us
 {
     unsigned long addr = regs->rip;
     unsigned long fixup = search_one_extable(
-        __start___pre_ex_table, __stop___pre_ex_table-1, addr);
+        __start___pre_ex_table, __stop___pre_ex_table, addr);
     if ( fixup )
     {
         dprintk(XENLOG_INFO, "Pre-exception: %p -> %p\n", _p(addr), _p(fixup));

