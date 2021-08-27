Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A143F96D7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 11:27:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173517.316600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJY8e-0004TB-0H; Fri, 27 Aug 2021 09:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173517.316600; Fri, 27 Aug 2021 09:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJY8d-0004QX-RO; Fri, 27 Aug 2021 09:27:03 +0000
Received: by outflank-mailman (input) for mailman id 173517;
 Fri, 27 Aug 2021 09:27:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVCk=NS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJY8c-0004QP-A9
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 09:27:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27329f27-3014-41fd-8429-67c93a0c020b;
 Fri, 27 Aug 2021 09:27:01 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-uH3g4OaJPwuBYxN1Byf8Ng-1; Fri, 27 Aug 2021 11:26:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 27 Aug
 2021 09:26:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 09:26:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0235.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Fri, 27 Aug 2021 09:26:57 +0000
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
X-Inumbo-ID: 27329f27-3014-41fd-8429-67c93a0c020b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630056420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=49X9HUtKmCoxlpsj64qfOvL54npLODYkICa9fxmHsjk=;
	b=iRZY8wiPL0jGFqII1yz7K1yxCIQH8P1TKm5rAgYq5Ka7lGC+NRMJPW6PCkaWfKNZKY1O4j
	7MeypTw54gNb6wCBxoeUFDdX0u7wdHQXSDF6ZmRq7Halk5k+zTS/UCxmTfsSo+/yMa/E1r
	F1J1dWSudjjPXkRjbuO/DK/vUhRPhfA=
X-MC-Unique: uH3g4OaJPwuBYxN1Byf8Ng-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERsWoW54M+b75apBnzWqCmBDPzpefaCY4nRDhH2dDdzprrkF0hI7VzWRY3kbnMzsTqxgOhfYTVNSaaMF2SIWdqeVzE2dspA3WGRiWzBdJ4cINV+OmNKyu6dSxEbraWxAzb2zES1XLxEIrmYJAYDxirrX6R8WeV88U8paXAJojBfUqJXNn/xAJlJjACGKo+hnqBh3NrDnOzG+4WJK6vaFOeJbk2iOlZlwQWu7VBCLzA+le1tCBhMSAZiAmJ1AYL+ly5nx8YJLA2pyvsQaaMtHA6AzYHgWB3TdgM4PHtjWvlNnHWCDNlV0kSHNxQMwC5l1ZO3PPxdMQxRXp4HnXUiMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49X9HUtKmCoxlpsj64qfOvL54npLODYkICa9fxmHsjk=;
 b=GhA4MhMgUw0T0pjVdgJ7iqUkm+N45z+8w1nGgJxrRzjgitGEiW5vYpHhUYbG/bMgsOV16v59F3X+e7IrCU6wOgnMJ+mlB8XDTrGsiFbps0F7qBoE802Y6vg4SIjEWSvRQRAEPrEAgl7qQVgt08UhaofdFU97PRVbO48BPV97GQRukAIsbe5bVPeUMPr9sXEXWvFT/gkH2hLQgRDbMs+BK3I4eWN4LihLCoErr4x9Gr0R4NLExBLNDVHde9RgIUwOgyYBIU6arBvLyOMf/s/dmKcfWFR1ltzoYI6LwN6tXtcqK9OKlp2nACjoo56ip40rzmlBiw2+75dNuLVCejulmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: HVM guest only bring up a single vCPU
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <a1724918-94bf-748f-5c4b-5a3ec176368f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dc1e3e1f-f7b1-6f73-3a16-804496952df5@suse.com>
Date: Fri, 27 Aug 2021 11:26:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a1724918-94bf-748f-5c4b-5a3ec176368f@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0235.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f80904f-f2d1-4b88-d96e-08d9693cd107
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686163371571D1130E2B1E4CB3C89@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K7tie/qPOnmgnPgn8kq0OWTPKYGSWhLt4E9kwabltIjbFkey/vY8LP6JHKHZeWIRFjCZSTxD2HESMlNprro5pYN4VFNnJ4RWM9WhRN05SzRLwelhP/GNUvMxIL4Jv+JQMi62cMdkaWH6OwEzhS94RspXQYjtdluD+E+7J4+8hX1mpWBPSHJSm8vjTT2v8h2EUpFtxjUjIfKi3BVQuK5N1f5QNs9qH9Ejk0oxFINeCTCeUTdpspb+1HdUPbxhiCPiGVmFcJaP94fMW1OwpOuQyA1MBtBwst/EvXyh5OAA2rOSIH6VJh7W8fl6JaqAv9Wgm3tjjmUZYeS8YnEZHdg3tWCOi6b6rdM/aX/R5qajAYCJk+lkOJv33+RE2pdcYAPVU2l0MnTCkAJRV9mqm6snC056TfWZXmCZdxG93Lr+dMTOFWD40XvgSEGkdfGwadXJSZumQnxCf1MGm4Eh6j7G5FDb9W6V4ONVCif0UEK7cJQiYLYuEir1d16OcrY51OxVkRUZi0khEH8WYkWI7rN6V4FPfbVNwJBCy4ITmHZrIdYmpotsT0es2eR538BmzzZ+TXuAz5CzjktzNWfYkrg+NXBX94Mevnmgg+mdqzQZrgcPqkHjZlRbk89a2YNp7DIvqOVwPKnpW04fGQLVy1iXhBJk82+Dn+bCB+ASygS9ZHp0Cl9ELyokiGHTD926iyvKB4uVsX/QVJeRvS8vMlUpAei99s6MAX5ilC7eE98AaWU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(136003)(346002)(39860400002)(956004)(8676002)(2616005)(8936002)(86362001)(6666004)(6486002)(83380400001)(6916009)(66476007)(2906002)(5660300002)(53546011)(186003)(36756003)(26005)(316002)(16576012)(66946007)(4326008)(478600001)(66556008)(54906003)(31696002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2xFS0F0NlpPQUZRb0g1NUdaZkNYWDBJS09ERFNSWmJpbXZGNjROaWdRdXN6?=
 =?utf-8?B?empYRHZxZW5KRmNDVlAwUmVQL2M0WGZONG1ad29VdDBSb2FCUklOQ0JhQ0kz?=
 =?utf-8?B?eUIzTEgzSGppTUNKVzZNcUZOemFZNTN6bXUrblg3QjVoSVFLU1dZdkNLNFlq?=
 =?utf-8?B?eHpKaE1ySjdpZ2RwZjV6cVE0OXpJb0tBT3BRQW5zZDUrTFdZUnZlL3pNUzBQ?=
 =?utf-8?B?YWJWN3c1c1JqNHhYazZzR0IrK1VrQ2s2OVBKcDZCRFRNdkQ2UzFXVmhYbjBU?=
 =?utf-8?B?MVUxeldEbWJSR3FpZ29zY0d3TGJYTFhvWHNhZlNjdU1uM1pWbjdXR0l0b1hh?=
 =?utf-8?B?Rm0wNWVqZGZNN0pIK3R1bFhBLzBrQjZWR28vaHYrZXd3NFBKV2ROazFJMGtF?=
 =?utf-8?B?dDQzejVYYzFIcXhKVEp6K0EvTE00RnAyZ2dMSUhFdVNxbXdZOGZ6L2RPbjdX?=
 =?utf-8?B?YlJRazZQUE82RXRHT2EybjNROG93U0xWa3JBcFFXL3FHUituTEtTWmpVdlNE?=
 =?utf-8?B?Q1VRTzRFNW5CZ1FYRzljc2dOOUg0OVhLVDhmd1EvTUxuUWxMMjFIb2lFMGNt?=
 =?utf-8?B?YTNLZXFLUUZyUEtJMUtIL1JuaDQ4RytGeUpsTHc2c1diWElFWHBiS3VtLzhw?=
 =?utf-8?B?blFybVpTYmd6V1RIcjgvSHZvY3Qxc3ovODZCOTJRcFlyemFpZTg2T3A2NzA0?=
 =?utf-8?B?MEFKNlNtVmY0WmpqeWs5Y0cyYnhmbTd4SGVCN2VRamVVOFRWcXhqRXVyWDdV?=
 =?utf-8?B?cEhaOGFILy9jZ1p2ZjZMeGoxcXZzWXkyU1MwZFBwYVpvR0hOTlcrWEUxMHBE?=
 =?utf-8?B?UllEM0pkWEIvMEw5QW9ZcDdKZGhBYkVnQkhlam1LV1NiZDFLeTdpQ1IycFIw?=
 =?utf-8?B?TE9VTklnZ1Y1U2RSM3gxNVpKeElRcWJDYkJxZCtnWnRkQXdtWllaQ0JhU0do?=
 =?utf-8?B?clNYelFvcmszRW41b05WSmR5NnpDMCtnVlZCZ3Exd0dpcXgrK3E4akZidnFL?=
 =?utf-8?B?b3B5dFA5UEdmbTVBY01rTGM5RFROSlBET3h3WjZSSmxaN3pnSnlCV05FdU50?=
 =?utf-8?B?YVJHTWRFNzltWkY3NGFjNVJpZ3pYNUd6SXZYNnhnTVdSMk15OEV1MW0xZDJF?=
 =?utf-8?B?bERCdG5lZDVuVWo5eDZRRGdySEI2OXI4QmVFZ0pqalA3Qy8rNDlRaWJzb0hT?=
 =?utf-8?B?V1VlRjdiNVVrNEJKNjVrYzgwZy92THlQQXpEWkRUT3dBRExQVmhFM3EvL1Bs?=
 =?utf-8?B?WUxONHAzV0tUZXB5QlRhdkpTSEdWcEF1L0U1bXQwY0dSbSt5M3lXZHNyRzNp?=
 =?utf-8?B?T1FYYmRUazdCL3pUbDgrSHBrS2F5MzJCcUYwTE9mZHdQc1VVcUtKcW4rK3Rp?=
 =?utf-8?B?MDdERnc4aGZOVEN1U0t3MXhWdUJYM0d3SjQvQ0lhL2hMcWZSaGoxOG9pZDk3?=
 =?utf-8?B?TXFtWVpBNk5RSHpEUXR3OVdoRWl6VzZMVzBIMU5Pc2JMUEMxZGpKdk0yZDV5?=
 =?utf-8?B?dk9saFU3Rm5NdGFQNm9ZcjMrdnNNYWpPR0dYTWNCcnRuUXRmaU92Ris4RnZx?=
 =?utf-8?B?S3NNUVBsR0gxUTZLS2J2NWMxTjFtc3pwMTRDdFV0MmV4NmJGWVllNVV2ZXVD?=
 =?utf-8?B?dWdnK3NveDB3Ui8ybUc3aitGZ0JuQ0VCbERYdzlrd1ZKc2F0MnVzaitzeWdi?=
 =?utf-8?B?VEZpamFuT0xiT0RNNFFycUxBVml3WFdNd2RCSHZ3bGUyVnovL3ZHTXlDdzJN?=
 =?utf-8?Q?ufNaxQz2ulwgC8I6ZGNjKS3EAJh2Xnp5Dr+gWdq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f80904f-f2d1-4b88-d96e-08d9693cd107
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:26:57.7041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zr3+x8QdOb4Nzh8YaAMRYSyft1syhz3cRncQ+xeoJHL1F4sPJoIUExj63RxOFVfNPLCREDd91+aWD2oqO+qYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On 26.08.2021 23:00, Julien Grall wrote:
> Digging down, Linux will set smp_num_siblings to 0 (via 
> detect_ht_early()) and as a result will skip all the CPUs. The value is 
> retrieve from a CPUID leaf. So it sounds like we don't set the leaft 
> correctly.

Xen leaves leaf 1 EBX[23:16] untouched from what the tool stack
passes. The tool stack doubles the value coming from hardware
(or qemu in your case), unless the result would overflow. Hence
it would look to me as if the value coming from qemu has got to
be zero. Which is perfectly fine if HTT is off, just that
libxenguest isn't prepared for this. Could you see whether the
patch below helps (making our hack even hackier)?

Jan

libxenguest/x86: ensure CPUID[1].EBX[32:16] is non-zero for HVM

We unconditionally set HTT, so merely doubling the value read from
hardware isn't going to be correct if that value is zero.

Reported-by: Julien Grall <julien@xen.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I question the doubling in the first place, as that leads to absurd
values when the underlying hardware has a value larger than 1 here. I'd
be inclined to suggest to double the value only if the incoming value
has bit 0 set. And then we'd want to also deal with the case of both
bit 0 and bit 7 being set (perhaps by clearing bit 0 in this case).

--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -594,7 +594,9 @@ int xc_cpuid_apply_policy(xc_interface *
          * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
          * overflow.
          */
-        if ( !(p->basic.lppp & 0x80) )
+        if ( !p->basic.lppp )
+            p->basic.lppp = 2;
+        else if ( !(p->basic.lppp & 0x80) )
             p->basic.lppp *= 2;
 
         switch ( p->x86_vendor )


