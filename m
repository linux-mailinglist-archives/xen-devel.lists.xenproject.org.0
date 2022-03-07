Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A576A4D006F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 14:50:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286049.485383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDk0-0002E5-DA; Mon, 07 Mar 2022 13:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286049.485383; Mon, 07 Mar 2022 13:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRDk0-0002Ac-8A; Mon, 07 Mar 2022 13:49:36 +0000
Received: by outflank-mailman (input) for mailman id 286049;
 Mon, 07 Mar 2022 13:49:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRDjz-0002AW-HC
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 13:49:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b45ce44-9e1d-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 14:49:33 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-RORnIGj0O8in5_hQ1D-G8Q-1; Mon, 07 Mar 2022 14:49:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5749.eurprd04.prod.outlook.com (2603:10a6:20b:a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 13:49:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 13:49:30 +0000
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
X-Inumbo-ID: 6b45ce44-9e1d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646660973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XPMDXJ8DEsGxfE6cWFy2tMlf7ejnDjisqhedDx6eHvE=;
	b=VDCkbYQCMO86bPJ1Ut5C9/JNsf5q/ClFBS5R8f40BSqWQ5dw+XzRFnzjBAaFqdqT032ZOj
	/8sJdRsn62cwSoIsYWKCaZFQvYCoOXxXCmtX+FZSSsaQlpSOh2mDMIhMG+B0e8sG8FZ2lg
	3v+0YHT9M3uvcJjmNeTflQP66tbdYjE=
X-MC-Unique: RORnIGj0O8in5_hQ1D-G8Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5vUUEjT+CqY9fSKPmcYfMazJXfmZUx38Hfp4cgmYuJnnBZy6VtPeqgKrN3Yl1PYbaPF9R3FMWQIKe3NFkWRrRGULw5izrJIrgNi8yvlbhn8P27UjlY+n7lb1S0uVOnmZOCpA1TjbrIRyB4ViaFG2iveSnD2xaS5/qUHRJ2nyQOG1qCQ45vx/u3pTEWM2jnlDYdd0NpwcOdSZjWju8Wi/g72H3EX6Uapc3PmErH8ssbk4aF/G8aQrU4st2qlWXH8NtCCHTDEa/wYj5zcLfc7PCv1wqCImTVgr+nRnuuIMiQ4jOLsmZZcFqi9ytWtqcXXDvGsYDFXVx6TRu6cIjUuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPMDXJ8DEsGxfE6cWFy2tMlf7ejnDjisqhedDx6eHvE=;
 b=RSFvSbQ64v88UO8BcYy7tKxD94gdwwGL7KYVLi1LvQgat3ekbgoTWnJOI6xtkP1PD6n0dSYFVX2jK97H8pp2ChCuFzgGgE0b1NnVohYbkeXU5TQ1tVKwl1mNjPwUSPRkIQPP6YrE9vW+ZIRI3tCQ3wUyO4CsjKOKE3Sl3y39jE+pLCnVPgbv9N5vGTqUnyI+nLOedjsD0trrNFHQSvChy7nK5WvhFcTvI47GWBHvCtLyWjCJu3GlCzl+cNUa42uzrebMUTiQVqzoDTVayxMxDQgpeCDDdTCr5zi+evf0Y4rGVlwTrcaTTpEyRg9l3L6YfDZ1iZNLY+3IFhy6oZFRuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b982bab-9b16-61e7-620f-5a5b2be39588@suse.com>
Date: Mon, 7 Mar 2022 14:49:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0017.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84970321-079e-4ff6-6f82-08da00414de3
X-MS-TrafficTypeDiagnostic: AM6PR04MB5749:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5749A3357F295B91B540586BB3089@AM6PR04MB5749.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XnRueKY22NRlNU2WZ5BqQRaeN5jMHjK1eRyknDXESLsBJQ6CD2+lclq1ljeSlzg3cmpMEKvaFCCyu7f5f8jv+AvG8QyMphdUHZmtswIz9WrZ+V2VnejCPHMABN4KViihADd8+O8OK+AytOBHl2fwNN+/uSXn/NVcaUFNNtS30csE6lPSUsfgpUSLX5KySf6ehvqUmZP5IZ/ZQntnPbEgrfXFak1rO6gyiRStNOr3+GDgSB8IejyykIO40GzeXug3c/+IxwwIxKysRwXMnbgRK13/V2Mno8IC214uudloaIoSNFtzkXdwPNGYiR5VT6T8k8yHkSHr5jQE6ht29l/GhvZUlLrOdYDSTMupB/AJ2TVUS9ty4NeTiVFgoGJU5GtP4xaPGtSU6uFk8LNOF/+RMb4MOvlswbxd1aP6QmeoKG4AoZEuEKqaPRMnbBG2yJelRbjL2R38zuiqa4AQH/rLsyNKV6iV7wdPK+UO01uqnSnXROqy+vdQ/TCN9b3U5lOAJ+ZjaHbJ4ISDY6PF3cZail/pBZrsFOcvT3xzBjdHTT98b3HKvm3QeyH9fGhhwFNBXzwywWkkdk3hnjo4II9aDlgRNRlRNuoZ78dLbyMfNHh3ZdKK5pgtuoW4i6eQZQdWHaX3AH1FDAae/8Sk9eRXN52DNFhVt6QkTy5GqQ0ypX2x5Yq8kZerQoJ3EgV/vgaA2A8gVha1fVE3ZGTUPIpQxdqwJWLaboU9bcfMKOyReSyMQWPkLXpo8jj09Agr8lJh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(6486002)(66946007)(2616005)(31686004)(8936002)(4326008)(8676002)(66556008)(508600001)(66476007)(31696002)(5660300002)(2906002)(86362001)(36756003)(26005)(316002)(6512007)(6506007)(186003)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXp3akNqcDg4a1QzUEVRdUdvL3FWcm1qSU9QRkpxUGFJcGtnQ1FLZzJ2MjZ2?=
 =?utf-8?B?TEFLRUsySm9XRWhua3QrU2wzOHlGcmIwaVNPN3VjczJWcUs3dmlMZmk0ZXoz?=
 =?utf-8?B?Q1hvR2JSQ3hEWDdGZnZjMUQ3VEV2cHh2OW9UbDYrS296ZFV6QUxteGNRUDVa?=
 =?utf-8?B?UDRnOFRGNjlJWU5KRW1mUndqNFlUejNHM3Bxc2lLVHRzL0hhcHdjZUVFWG94?=
 =?utf-8?B?VjdlTXF2VE9lSWZadnFNQ0lPK0RxaG8zcnZsSVI2OXBudGVmNnUya2N1Q3hR?=
 =?utf-8?B?cFZiSDV0aU42OEZZZ3BLTXVubmxkNE9uRlpwY29NRlA2d2xMQnFQb2FRUFFk?=
 =?utf-8?B?NHoxdHFSU1RnY2IzVDhOMzNQMkdaenkvNEF4OFRKQU5WcDJmQmxsK1RVNGk3?=
 =?utf-8?B?SmtvaWp3N2RTMUJBTkgyZFdTWnZWWm9vcEhGdFhWYU1wOXdERzFkR2hpTXlX?=
 =?utf-8?B?ZTd0RytQclVvNjRXYWQ3OVllTlRVWWxsb29tbmJ1SlBPZXppVGkxVEh1QWRV?=
 =?utf-8?B?RHZSUUJGYUR2YzBPS0RDbWZjQktHc2lHcXJaektmYk9NQXhZV3BTR1RreDRy?=
 =?utf-8?B?RkRXMzNDM1ZadnJYODhjZW5KYWlRWVgybWxFazZaMStzMS9DcGM0YmVrSUhM?=
 =?utf-8?B?RUYySWhIYnBJTVhyYi9IdkRzSzJtODRmSjNTcDZ5VTZBUHNsV3VLaUhSdHBz?=
 =?utf-8?B?YjVKSGIyNC9BVmhRQ2RtTHAxRFNzM05OcGRWWWRxL3c5a2VCNHluSFp5YVFT?=
 =?utf-8?B?eENxTkpWWjRTWS96WjQ5a2tyUlVtR1I1ZXgxbUhXV1pQUGkxY3QyTG5pNThU?=
 =?utf-8?B?UHcvYnA2Qmt3UnprSnBISHBkbVA1di9YRzIxamRucEFVKy9lK015d042VGts?=
 =?utf-8?B?eEFzRCszZVNMck5KU0xqRDIwa3h3WWRKY1ZDd3ZGMlMxbnplUDBha2hVUlp3?=
 =?utf-8?B?VDMxdy9uZmNuMkVFVkZsbm1NTUpBaEx3aHEzZjhsV2EzcjA1RnJibWRCSkxo?=
 =?utf-8?B?N3VPWXlObTdEcTJVamJrTjZMYVhYdUptN0dpUFZyOFphbG4vN1JoekJBVlNp?=
 =?utf-8?B?TGVKMXcvYUpKcUdab0ZSRWYzblQrZEU1dnBoTGRkR0RhSSt1SWxsRzFnUXRl?=
 =?utf-8?B?dW1zSHNQNms5U1YzUjAweXpjZXhOcUM1OVlWek12VUZQbTVvaittSnIzTDdo?=
 =?utf-8?B?Qm1CVlRsc1hPTTJyTHdOd2RXQjlybFIrN0w2aG1URFBvSEZZTW05YXFrZGxW?=
 =?utf-8?B?d1hBa2phekhlRjN2MVdkenV1dmQ5UkdCdTJQb1NpZU1UdVhxWXpUZVU1NGdO?=
 =?utf-8?B?bWtsS1VKYlVHZG1CYXZNak9xYVdoNVNXWWZHUDEzZlpabWNvZVV4eXVVYVdC?=
 =?utf-8?B?cVNLKzZ0NWV3TmZ6TEFMY004aE1iejVjdUZsYURmMGRGRnE1dHZwcVZYc1R3?=
 =?utf-8?B?eEhDczFBVm9qUDFaTnRjQVYrZXZQeE5VRW1leW94dkZVYzNnQmVCYVZWbk80?=
 =?utf-8?B?RWlaNFpVZGxBeVFVQUZSb00xbEgrbXMzRnIvNEVmYU9VMkZwMTd3MWVvYWZT?=
 =?utf-8?B?NEF0YmhQZkY2eDBKd29Ka0NCcmhtdXVwVGpyTVhpL0NrcnFHbnVjNjd5dTBJ?=
 =?utf-8?B?VW4rRW1iUXplL3BjZWtta3Z3VWpzTC9PNEJ2ZDNnR0dpQUtWOWJqWHVBdGwy?=
 =?utf-8?B?UnVhUUo2dG45a2tKc2dyNHNVeU1pb3NJam1VSVhmNGpmaTYvVmVsbDRIS2Jo?=
 =?utf-8?B?MGErOTJZOStxcEFzandycHM0Y3FsMEJ1bE5WNDlsNG96T0lYU0FwMDVHZ3Iz?=
 =?utf-8?B?Sk9QcFF0b1RLQTRTZkk5azRjbElsT2hudkUzWUxzMmx6dHcxM21KODdteGgy?=
 =?utf-8?B?U280QlJsbWhscHM1VXV0TGRaRllrUi9qU0x3cmdRUTI3OXNaM0xoYm4zWG9C?=
 =?utf-8?B?R1JnZGRCNVBIaDNwN1hDS0ZXTXFqekJqdmtySU5zM2RGTFJUY0lXTXJtc1Qw?=
 =?utf-8?B?bWRKcVJIdkUwVVNvUkJYM0sxQWZqdVFhVy9KUWZodTdMRWlRUWpnbFZza0RX?=
 =?utf-8?B?d1ZUL2g2UEtDWmVHa05KNGoyS2xOL2x3Q0ZaVEZQWktxQnlYdk1pNWZXR1cx?=
 =?utf-8?B?QTB6OFR2aDNJQy95dVRUTWFsblBUeVkyU292RCtwOHdqL2NnK0tqcjR3T2xR?=
 =?utf-8?Q?m8E9gprZvmkFsCo5uWWMb0s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84970321-079e-4ff6-6f82-08da00414de3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:49:30.7377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15ZtFMbPGn4DlimpAuBBID8TYuVEPHZwYRPVDLXN1re2M0VplyUO+oMwN9heKg3GgA1Lzpoqam0sKZ2cQQthqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5749

Support for this construct was added in 2.22 only. Avoid the need to
introduce logic to probe for linker script capabilities by (ab)using the
probe for a command line option having appeared at about the same time.

Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Obviously this doesn't take care of old LLVM ld yet, if any care is
needed there in the first place.

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -70,6 +70,11 @@ ifeq ($(CONFIG_UBSAN),y)
 $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
 endif
 
+# While not much better than going by raw GNU ld version, utilize that the
+# feature we're after has appeared in the same release as the
+# --print-output-format command line option.
+AFLAGS-$(call ld-option,--print-output-format) += -DHAVE_LD_SORT_BY_INIT_PRIORITY
+
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 
 efi-check := arch/x86/efi/check
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -30,6 +30,10 @@ ENTRY(start_pa)
 # define SECTION_ALIGN PAGE_SIZE
 #endif
 
+#ifndef HAVE_LD_SORT_BY_INIT_PRIORITY
+# define SORT_BY_INIT_PRIORITY SORT
+#endif
+
 OUTPUT_FORMAT(FORMAT, FORMAT, FORMAT)
 
 OUTPUT_ARCH(i386:x86-64)


