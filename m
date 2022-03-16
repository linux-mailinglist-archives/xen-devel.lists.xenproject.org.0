Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130474DAE6A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 11:44:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291134.493972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUR8d-0003S8-QL; Wed, 16 Mar 2022 10:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291134.493972; Wed, 16 Mar 2022 10:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUR8d-0003P0-Mc; Wed, 16 Mar 2022 10:44:19 +0000
Received: by outflank-mailman (input) for mailman id 291134;
 Wed, 16 Mar 2022 10:44:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUR8c-0003Ou-1U
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 10:44:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06e5b388-a516-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 11:44:17 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-HeE4QRPAMdOZ3m5rkBa-_Q-1; Wed, 16 Mar 2022 11:44:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6087.eurprd04.prod.outlook.com (2603:10a6:20b:73::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 10:44:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 10:44:13 +0000
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
X-Inumbo-ID: 06e5b388-a516-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647427456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xjoIcQZg/CYfbxLC/sWCrL3cKB4thKIIuGW0AERhs4U=;
	b=E5+GxzYqoTXlzJNXevRvbTLqkhA/BxxRoE71yNTU5IK3FufKFHc3EgngkW2ZyaeMWEBdv/
	LzmwtmoKZZgJqVMwNoExSksfWYJXSZ+xLW300c+FQVc48B7BpJXaoL5aGfdxRzATZIIQ0l
	hrBymESwnC2L1c05jwzLm+Y/95iQgu4=
X-MC-Unique: HeE4QRPAMdOZ3m5rkBa-_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeqgUEPVKk+MTFiXza1ct5xRzDdbKpAuCvstI7bYuCK/gvuaWzLlP7asyUuAv/yWFU0axQsByObdEKvHeugtcpCaYnv6Gq5NifLj/Zok7Ta+ji3AzZnp4Ax3GU55vh942PYw/yOA7pByG3MPdgjfCvnfPNh3s4cdqg666pJkmG/9do618s18HGIt0qmAHwlSMYrw0HC9q8T450wncbY7JRKvSDGwxNhMnFcankEm6QnLPgdfayIadiD5/TmqRnBAW+Y/Q734X0sAdK3DTSNkPcGWhUSqmfnQofOnn2IXqvS7hN7OK4L3oan8CLEu6C7XUykUsuEzbETbcpMZXZHwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjoIcQZg/CYfbxLC/sWCrL3cKB4thKIIuGW0AERhs4U=;
 b=ogd1csjJttV3/2PX2jBrUImNtJHTYLGbA+fIqTorY/yJgzvyUGcCr1kSOeMtWMnkE7ECd2xuT7kGj4r1U9bNl06kHdwFzQMq66PlUQd6vOUAlLUDyYXaPxdfGysR+H4n6VulTs4GsiHqi3nejfF90PoOrLjBpfBsqLjcDUZcUxT9jryFNTGq957r5tXWoc9ufr1POeOsJ4zAbZgtX9ajo0wjjXcIKwLobJw1d0N4XUpl/4XGrTGETfq6TTMn2cmbx4nEuexAL/gHch08a5shg/3dyANiNOS0XzUzN13ZCU0lR4rcZ2UyFsTe8szoLB8aO4OYfmyhHKYJwT4z1+k/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cadc8c33-5310-ed9d-69c1-96e41f266b39@suse.com>
Date: Wed, 16 Mar 2022 11:43:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: correct VSCALEF{P,S}{S,D} entries in predicates
 test
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:206:1::42) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8cc663c-26c9-437a-7277-08da0739e75a
X-MS-TrafficTypeDiagnostic: AM6PR04MB6087:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6087C1C320CE9F8985414B6CB3119@AM6PR04MB6087.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bio6y9P8p7K5Sspqy9V4ppZ7bnXaNOqzDkAHvGULNEM+G6MN4AenL9S73UXxzHW+J4kvJfytWLt2K4f8oxViirr3vIxybEIoFpmUGedbfb8z/QRArxZ6Q4AuxrvrjDEFTzHzj5czdsqH+T29eBx7ZsEmbcpptp+fdfGdp4AFiUUGNY2L09NMon+/v+HXngSZprREdEk0zGI7qfaa6jIumaliygB/iJls7NoXOThzykcMl3g20wmPT2RrfcxVG5J/A3UTSXUsLejkqCcTAZcWaCbBVKlm8UpnmxX4DPZnUOyzSMAyMEL0VEBR7HifT4cBJxxF1wn0i8yq5sMvv/3P1plYXMQz88vyPMSx0Wkcsg8BPoXxRnqGwiGZLQMoYbsQdN5Re9Ur4tw6BX5UrG/sop1cqC5yyQ5YllmnGzDBIaTcOTReac8CMdLgFQTQCWBnSnp4MZEqV0HjZXaK5ZIIIwmkQdsc6HtMztCK9/W3W/aMjEgojzgB+oyY/Vp2DZKxXXAUtteOvqTrmsLZmiuU/YrElF3ORKmkebyA/Px+TjtEIEpDC2O0kIOPi0tqCqOIOvOurZfB+synfbEvUxkz9px2Wh38e/+p0RxB/5s1yz5CsjQ7AjnBXgTQN2HXoT0z9nnMqoKP+8qRom0f7QH+g8V+dltaAgKhxyG9WqFE2n7mfpn3tyGBxmCLbwjn4dBOZPhfXkxvldh7sjRxaQ3L5WJomlOVrmG+CPiUnkAOHno=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(6506007)(38100700002)(6666004)(6512007)(66946007)(316002)(66476007)(6916009)(2616005)(54906003)(8936002)(4744005)(6486002)(508600001)(2906002)(26005)(31696002)(186003)(31686004)(86362001)(5660300002)(36756003)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGUzWXJGZG9wSmdGNEZpeTRoTEg5akJ6WVZRa1VnNndGcytZN3grREdYOHBk?=
 =?utf-8?B?YVNCSHViT21YSm8rZHFpQmZ0YXpaT3ptaHFZQ0RXLytwaDJPOHNKRlBNMHRQ?=
 =?utf-8?B?U2VSVm1HUFV2c0s1aG12aGhNc2lXTnpqNDhIRFpLdXIvMUFUQUJ5VmhPVnR5?=
 =?utf-8?B?OTNza0tncDFTcjFCV0NhUVBjOUlYVjAyWktEV0cxMTQvKzhiUzBwcytJTlVT?=
 =?utf-8?B?MS96YUNTcCtkU1lKSFhURUJUNElMMHZzVGlIUElWeHo3T0xZZGFqeWpQWlZB?=
 =?utf-8?B?NFlXcXJ4NzBRWDl4NzNXbDBIcmxPc1BBZzdnYW50UXVyT2JzN1RqSnNHVStm?=
 =?utf-8?B?c21HeUdKckl6NGZPSFBLY2FLWWdzRzdDR01sYytkamx0dW1aUkp1b21RVDU5?=
 =?utf-8?B?T2tpYlRrV1A3RzA3OGVWZE1kT1lvZWt6aGFqK1BRSzdzWHJLUkhEVU5kbVJx?=
 =?utf-8?B?a1RxR3haYXlncW95ZUxZOHhaOW1KeEJENmZuaTJkTm9aaWkwN0lKRml1NW5E?=
 =?utf-8?B?YUEvbm9DZmp4NklyNTVTc2RvNXZRYldUb1gxdExYL2hNQjZadDRkSGxraW5w?=
 =?utf-8?B?TmdzOS84ZUJBV0ZmYTZTcXV6N1o5TnBYTUlRRlFEZTgrOG1FOHI2aWg2QkpW?=
 =?utf-8?B?R1BwdDFMNEpRNmJEamZwT3VPVm5jakZ3dVFldDZyS3g0bE9pTk1ZU0M5eFBC?=
 =?utf-8?B?QUFaWjkwaTNaZmVJRUx4M3pSTHNERVQ5UHNlTmNEV0tnL0xsaE9qcTZMR1Fj?=
 =?utf-8?B?QnVETjlQczVsOTkvQU1CN2tJNE1oT0xrbHJnenlOYTYydUIzckcrQnlVeFZ3?=
 =?utf-8?B?WjJqejI1aWFIZllNaThOSGVuZnhFNHd6cVV6elEwQnFNcjN3KzNyVmhOTjY1?=
 =?utf-8?B?VkwyZzAyY1EvM01MUkVVKzNIKzYySURyM3k4dzczRC9kSDFyWENEd0F5ZGNa?=
 =?utf-8?B?b3NpcGNyZldrbytJWnZiOU85TUw2bWRRSmtGN25HbnhRd2RLdGVadzhVQTdB?=
 =?utf-8?B?R2I3U2d3UDQ4TkxpRndWRmd0L3NMelpZVC9sd3BiMWdmelBMTWRLT3FZMFBB?=
 =?utf-8?B?NkEwNU11b2tuU2hicHJIeFN3Qy9ydTgzODArdGFEa3AyaDV4eW1CWWxoWmZ0?=
 =?utf-8?B?MmhzVjJ3SGJSTUVqeWVzNFlDV0R5TVM0L2l5bnNPRmI5YjZoWGV4R2hmcjU2?=
 =?utf-8?B?Z05oZmpiZ0hXbGZ2T09HTjVzMlhzSHdPYjVhOC81V21oZEZ0TExUd1dFdDdB?=
 =?utf-8?B?YW40bk40TUpPTUpHcmxaaTB6dFpIajc5N2w0SFdiZmVnRmVYWFRjb1FNZU5x?=
 =?utf-8?B?SzJZeDFxSzhDTU5nVlZ4cGlnY09FZDR6cW84Q1JqSTdsSjJKMTFkdUxpb3BJ?=
 =?utf-8?B?Tk9ZZ1NBTFZ5dUxUNkRyZVlNOHI3T1I0QWx6U09oYTZsYVhGME9nVXpUODBD?=
 =?utf-8?B?aVJKOUxOZXlsRU1RSXBhQmFFREdMbmU4dWt1VnZsUWxqaGZvd1JVL2M1Rkxs?=
 =?utf-8?B?RDZmRDc4V1M3ZktMMGF4OFNRSFEzanJ4ci9CYlRkUE9DbjBVYXpqUlVPeVlo?=
 =?utf-8?B?aWVXeXZ3RE5JVWpLSDBYVXdESExUaGtudDNaMlp5Sld6Nm4rUWlPWE9aL1JF?=
 =?utf-8?B?NGVtVXZ3S0svbVhUaENvcmhobUtYN3IyM1FabzhBZGRaN1V0THZMdE4vdnl6?=
 =?utf-8?B?RTdlVnB6d25HMnpEK1JEanFoVERudEgxWGxBT0swQVRoSzNYNlhIWTFvaExr?=
 =?utf-8?B?OGw2YlRPc25SYnI0TDRONGRuUVk0OHdQY2trdVgxN3prUXN0Rm45OWJIMFln?=
 =?utf-8?B?YVBMNDRiQ2tsdURIRERzMVlRa0drU3ZXQmw1cm81cHI4Y3hQa3VmdUYxS1Vy?=
 =?utf-8?B?MFVoTlRyMnNkamNDc25xWmJNVU83akdHZGtJSGY5cXkyVEI4Y3ZTNXp6OFdB?=
 =?utf-8?Q?yfCJmND/Er7aBBiIbAJwDAopg9DCEHyD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cc663c-26c9-437a-7277-08da0739e75a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 10:44:13.5620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJEpsa00sJnd1+/rSxVYtGyhiHnxS1AxP5CpBCfbvxWIDOMo1yvjPOm3l14cm05xCYYod2/Jfo7fPuZ5wC+eAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6087

I can't see why these would want / need to suppress testing of the
register forms of the insns. Quite likely a copy-and-paste oversight
when originally creating the table.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1822,8 +1822,8 @@ static const struct evex {
     { { 0x2a }, 2, F, R, pfx_66, W0, Ln }, /* vmovntdqa */
     { { 0x2a, 0xc0 }, 2, F, N, pfx_f3, W1, Ln }, /* vpbroadcastmb2q */
     { { 0x2b }, 2, T, R, pfx_66, W0, Ln }, /* vpackusdw */
-    { { 0x2c }, 2, F, R, pfx_66, Wn, Ln }, /* vscalefp{s,d} */
-    { { 0x2d }, 2, F, R, pfx_66, Wn, LIG }, /* vscalefs{s,d} */
+    { { 0x2c }, 2, T, R, pfx_66, Wn, Ln }, /* vscalefp{s,d} */
+    { { 0x2d }, 2, T, R, pfx_66, Wn, LIG }, /* vscalefs{s,d} */
     { { 0x30 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovzxbw */
     { { 0x30 }, 2, T, W, pfx_f3, W0, Ln }, /* vpmovwb */
     { { 0x31 }, 2, T, R, pfx_66, WIG, Ln }, /* vpmovzxbd */


