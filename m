Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C854EBF89
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 13:05:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296256.504254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZW8x-0002kJ-SY; Wed, 30 Mar 2022 11:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296256.504254; Wed, 30 Mar 2022 11:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZW8x-0002he-PG; Wed, 30 Mar 2022 11:05:39 +0000
Received: by outflank-mailman (input) for mailman id 296256;
 Wed, 30 Mar 2022 11:05:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZW8w-0002hT-BW
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 11:05:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53fc72e5-b019-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 13:05:37 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2052.outbound.protection.outlook.com [104.47.8.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-nN37OYbfNlm4APNdDLh1yQ-1; Wed, 30 Mar 2022 13:05:34 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0402MB3695.eurprd04.prod.outlook.com (2603:10a6:803:1d::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Wed, 30 Mar
 2022 11:05:33 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 11:05:33 +0000
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
X-Inumbo-ID: 53fc72e5-b019-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648638337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=23PpZPsq+frtG4bi3DwFGXPe3nlscKwcNzLG0s1a+aE=;
	b=EOh5wPQmNDPW/LRR+ejZva1ZN++RTNdBz1txwFhdJ2UTPpcW8824xAQlF7y/AWZ4H9kKhV
	Ceu5qCSdl+1E8E2+6ZPtIlWZbcHx07oiJyDbwPscJZlgGvk+NaRwx3NxqX/ucsM7paqE4w
	9WLoQF4nTWdBKRxsBx7jKZBU0dTA7TQ=
X-MC-Unique: nN37OYbfNlm4APNdDLh1yQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eg9buBnh0JVcfyGk8SbV17CWf3+NlaZrZc5jjzlzMkglu93W68magmkl38vH0xWgH6D4fYK5X/+DpE/+4+nX5xrMd47aCOk0dAzGDPEi0AVOLpBy1FmIkSf+1dk5rkyor04G/j9hrpvnggH1Ywjs95xnI6pfPXEBTbAiJHi0ehDlE7uGIJLOxKwfWOmZSKhpUoFISgxFg6iRlXoaOijNHF31i3uJrE7p/i2UZ2li3WZZnYHc85LyvVJY17m4EwY2gErMnRjpJL3hp6YH5sMGQvhBHrdZy/fF260UwbIoaK5mJPlUZi7rqfBTirhiBCoHpDKKep7iDHrg0vfxbsXQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23PpZPsq+frtG4bi3DwFGXPe3nlscKwcNzLG0s1a+aE=;
 b=Js3uM6e6UeQq1jbxHcFKwDMUkL7Zdf5ceM7svXLt5VgAKwC3FqAsQWC96m8cJIyZ5X/rJ1HCRbZvTANJ54Pf5CzJOGXrvXGgilO6oWpHbrF96hmanY8LnrnawiSHC1FApHlB1qC2Lp6/BGgm9ePaS3Z5hgEkY9lhDvEaSIlNWAgbov9XYZ83RNUSgEcVpCA01i1JvhAJFEdJgnJQwHqUEd7yS+obEsBF3NxocwcmDmyTKUAR0KdGwzZvSRnFMfamvY1+Up1aO+MoMSMouBL9i9caqmojFHTAwAIChjMVIfKibH0hzf3uSlPCJ0iRHe3eDfwyCDvZwAHMFjGxJmcubw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <772f0afc-64db-6b98-af49-bd970ac78cbb@suse.com>
Date: Wed, 30 Mar 2022 13:05:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] livepatch: account for patch offset when applying NOP
 patch
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bjoern Doebel <doebel@amazon.de>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0017.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::30) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b3df56d-5cbb-4472-77f8-08da123d35b9
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3695:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3695A03D44D1BD28FD6F52A8B31F9@VI1PR0402MB3695.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZgrRvsA5ZQYxdxl3+oe5wWqCR6DRxS9Z7AeD0DZgCIbUfx7l7nyoxtxOY3kh+D7r4NwQ9S82Qs/PF737zxHqWAn+5HlaFeUrLueuVMlHCrK7JELiviaYhEbwTZk+iNZsMBiho2+yvhMzGhhj0yoVVKdYsNdE+WYHcLaR915vdrI6N+hEqkqoPoqbelTKj/YUFmZUXBhyHyoV7MXPhYE1YV/OucDeRfjPdSCVHT82syXShl8AwOuu9Ax1cyuF2dxNr4r/bnqMfvg6Q2NlsHd0hjuH8/QrT1kSIICTx1A+TvaNgpZ8b7xFxPYm8ExK4EztSRHwGcc0+VqXmMjUZKW16stEhUameR1/kn/Njgh3t3KJ2ZvnT/d7w4gMAuvLp/BqetBmH8hOtldOeWM99JlU/qIU2AEBtyUztpzghvCaTEEO2z+KFq304bVZwwqYDVlHkJVpIT2Zg8tmltzAZ5nwe/4+ZggKqsdQqcDl9ex56NQqJDAMQhb/PVl0AkMwt2BwzXkAJeHLEdnRhlP6NhSudgAIICQO1BMG7pciva3xg6HwAYowUf1ASC1Lcfhyjg8xoEikbk6MyPEfUJmljVkOjOaHN/G5lbY1M3/ja3lf0/lr5D0dN35s01nxV/EYBJC+j/IVEs3xamyXFcdSM3fPs5CekW8hFTx+MsFeLp135BMzVh/zhTOZ47B4Q+GlxRnhfBlUC1CzHZZpvUViGXvn2+hHyA3pum2PTL8nvjyM5qwefcl0owDNXDtpE+IeePJd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(508600001)(83380400001)(6486002)(36756003)(316002)(186003)(66476007)(66556008)(26005)(66946007)(31686004)(6916009)(5660300002)(6506007)(4326008)(8676002)(6512007)(38100700002)(15650500001)(31696002)(2906002)(86362001)(8936002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzF1U1J6NTN5bU9BYWhzNGdYK1VBMHhxNHpqZnhHckI4Q1VUWG5Cd0hjZzcw?=
 =?utf-8?B?dm5Hc3BYRE1Kd00wekNNeUt6SUgrMnYvbmkzckIxZ1ljOS9Ob1FiNHhyRU5w?=
 =?utf-8?B?NHFUanhLU21qK05oZWFmVzJOQ3paT1BTTkRIem9oZGVERzI5UzYzMlVTSWZm?=
 =?utf-8?B?RGJZbjJqT2lINHBqNlhmcmpUdmRkbEJmaEhYOThnMTlzUVpRYjh1N1BZT2RK?=
 =?utf-8?B?cTNzc1pZZjF0TTdSUnB3bDFCOHdzbjR3Y0ZOQksrbWtBaDlIN1p3bjdSc0lt?=
 =?utf-8?B?cWZMV0p2cCtybDF5WTAyOXpicHhlbis1VElhc3VmdStPZ0dEM1h6aHdKRGs2?=
 =?utf-8?B?YnJ1Ni9BMzFIYk1TV1JiNW53RDV1eXhWM1QxR3lHRHl6Y041V2xyTFBSOXI1?=
 =?utf-8?B?cTArb0xPTDFLNUF5SVhISll1NmxkL0JUK0lFNHhycjN5L0pQb0xUV0lrMGF1?=
 =?utf-8?B?QTI2RTRRM3lkanlXRnZncE5mTWcvd3Q3T2I0b2tkSVZZV0hBbExUQUI1cGdi?=
 =?utf-8?B?UmNhWmdLV3FEb1NoajBUUHVkMnlZeVVHdUp0bkgxaE9vUjBhSFhzSTRZR2RO?=
 =?utf-8?B?U1lmeUQvWVVDQm1HTUV5MUtRSkQ4R3ovMVZLUXIvdHNsYmxHdWM4ZkVpQ2VM?=
 =?utf-8?B?cGFlVWpORFRIRWd2T1N0UVprU2dvMVVMU2Vsd3o1Y0o4dEpXbzBrMDRJdCtv?=
 =?utf-8?B?WHJLb3ZNV2hnT0N1bGc5WHVhWTJ6L2VIUlRIV0t6UjVwM3ZZQStlZktZT092?=
 =?utf-8?B?YXh3VndkNDdORTV6RUxRYVBheEh5Zks3MU5IV0h2cjduRTB1U3RrdnlMRzFm?=
 =?utf-8?B?RVBYOFN1NzZGb3JaTzU4R1UxWVhOTXc4cmdkM1Bmd1ozeWlJd2lkKzNlWjI0?=
 =?utf-8?B?L2N2NlI3cVkreTMvVXVIQnlRRERUb0hhQm9XODFYVGMrUkxWRmFaUEJPZXVx?=
 =?utf-8?B?a2puTmdWNG0vRkZ1QU1MOEpjTWM4elc0Q25EZWJNWWFyM3RMcjYwYWZWTU5y?=
 =?utf-8?B?SVB6LzBnNGFOcHkrT1V3QWtCUUVBMWNORHphOWJBdUlycnJTeVQ0ZGM1QXR6?=
 =?utf-8?B?MGFDUFhMT3ZWcTlSOHQrc1Uzbk9OTWZuZlBESCtSeHh6ckxPMURWcmRJb1Vz?=
 =?utf-8?B?R2szb3NVeDUrSE9TTEp1OW5vNW03WE8wOCtZc0g3NmVqbHRzY0lUT01BU0Qz?=
 =?utf-8?B?eXl6VGJjQVFBdkpKVG1ZeU9EZWtseUlDaGVUSEZWVDUrYkNOR3gzc3dHb2N4?=
 =?utf-8?B?QU5FcGZzL2Uvb0xzSWJxTy9WaWdhZXVyQVVWMHpONUhUMHRpYmhOQjVLR0Mv?=
 =?utf-8?B?bjBrY3pmNHNTY1FZNktlVm5XUlR6WERqcmE0S1BqR3lPdnlyMkpPeDA5VHcy?=
 =?utf-8?B?MW52YU50aitHVUpLZW9OWk1LSWJkMG9wdlQ5WVA0OXNxbysrclE5ME1PQ1Jn?=
 =?utf-8?B?QW5xY0xodmdYbDFKUG1TVVZPYi9EYzVFNDd3ZEFZS21PQys5Nm9VOWlUOUUw?=
 =?utf-8?B?M0RVM3JxSHROOUZVcjZ1RklWb3kvcGRjaDRxY3k2TDdQVkNuS3NkVUEza08y?=
 =?utf-8?B?V1VrMi8vb1crS3RxYnVTcTVJOGhxSCtUNVVwMnk2dmh5c2JXSi92Z1hSSENG?=
 =?utf-8?B?V3lOOXZrMWlRT29MY1Y2OVFtN2x2eHArWHZBSitVWEZvSjdHNG1MaExmZUxN?=
 =?utf-8?B?ZnV4OTI0WnNnRUVURkVqK3JqbHoyUW95b2ljQm0yYnFta3dMbFBxSy9tYmFO?=
 =?utf-8?B?YnowcDlvOUNhWXd1eWNUNlFWcytIZDlnY3J3eWc0anRieTJyZmdsMXBRQllH?=
 =?utf-8?B?MU9MSFJHeGN0M3JyUTZ1dVQ0V25laGN3bzZ1OFMwK3RTcC9qRWtkTE5uOVAx?=
 =?utf-8?B?T29NSExnODFRd2JNWVQvZGNXdWJ6aEhob3AyM3dxcnBIelJEcFBrSjN1Qkw0?=
 =?utf-8?B?c3hkU253eEMrVjV2ano4N2h2V3dhVG5jY2NESmpPcEZKbW83SHlyczRLNjBH?=
 =?utf-8?B?NzVPa3pwdzJSc08xbzIyajlKM0dpOXBXbDBRSmFnTkQxUEFSSS9LZTFveHlP?=
 =?utf-8?B?L05FN2wzdUtJbUZiTys2VG05VnZoZW5nbEpaS3duV0xabjRDRkZOL1JUU2tY?=
 =?utf-8?B?blRsMDg0NXlBRStaeXNtN0FKM2pHSmw0eW10dWpUMW1tSk8xQnFSaWJOTlYy?=
 =?utf-8?B?NGVQaC8vTkZteHVOcGV1MmZEMlFFWk1lRm9pazZGci83NGNYLzIzTkFYNk9N?=
 =?utf-8?B?amExV2dwT2phcDJVYU13YjFhV0tIdlJFaHZISE8vUTA4NWZyK0o2T1hEVHZC?=
 =?utf-8?B?elh0MFlEQlBtbVFCbjkwaXBhMTEyWlNlaVIwYVZjS050cStRRFdnZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3df56d-5cbb-4472-77f8-08da123d35b9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 11:05:33.0936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hJWkoEQziSBohFWvQx8H949qD0s6AZweTv1dl6LRlo2pPRDw8VvrhEVHCGDDRMw7PELY7gvWcXmRG12EKHZ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3695

While not triggered by the trivial xen_nop in-tree patch on
staging/master, that patch exposes a problem on the stable trees, where
all functions have ENDBR inserted. When NOP-ing out a range, we need to
account for this. Handle this right in livepatch_insn_len().

This requires livepatch_insn_len() to be called _after_ ->patch_offset
was set. Note however that the earlier call cannot be deleted. In fact
its result should have been used to guard the is_endbr64() /
is_endbr64_poison() invocations - add the missing check now. While
making that adjustment, also use the local variable "old_ptr"
consistently.

Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhanced functions")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-issue livepatch_insn_len(). Fix buffer overrun.
---
Only build tested, as I don't have a live patching environment available.

For Arm this assumes that the patch_offset field starts out as zero; I
think we can make such an assumption, yet otoh on x86 explicit
initialization was added by the cited commit.

Note that the other use of is_endbr64() / is_endbr64_poison() in
arch_livepatch_verify_func() would need the extra check only for
cosmetic reasons, because ARCH_PATCH_INSN_SIZE > ENDBR64_LEN (5 > 4).
Hence I'm not altering the code there.

--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -157,9 +157,15 @@ void noinline arch_livepatch_apply(struc
      * loaded hotpatch (to avoid racing against other fixups adding/removing
      * ENDBR64 or similar instructions).
      */
-    if ( is_endbr64(old_ptr) || is_endbr64_poison(func->old_addr) )
+    if ( len >= ENDBR64_LEN &&
+         (is_endbr64(old_ptr) || is_endbr64_poison(old_ptr)) )
         func->patch_offset += ENDBR64_LEN;
 
+    /* This call must be re-issued once ->patch_offset has its final value. */
+    len = livepatch_insn_len(func);
+    if ( !len )
+        return;
+
     memcpy(func->opaque, old_ptr + func->patch_offset, len);
     if ( func->new_addr )
     {
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -90,7 +90,7 @@ static inline
 unsigned int livepatch_insn_len(const struct livepatch_func *func)
 {
     if ( !func->new_addr )
-        return func->new_size;
+        return func->new_size - func->patch_offset;
 
     return ARCH_PATCH_INSN_SIZE;
 }


