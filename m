Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC86FD60D
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 07:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532609.828872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwc9N-0001EO-FI; Wed, 10 May 2023 05:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532609.828872; Wed, 10 May 2023 05:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwc9N-0001BT-CO; Wed, 10 May 2023 05:14:05 +0000
Received: by outflank-mailman (input) for mailman id 532609;
 Wed, 10 May 2023 00:18:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VlwF=A7=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1pwXXO-0004li-5W
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 00:18:34 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02olkn20800.outbound.protection.outlook.com
 [2a01:111:f400:fe13::800])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32251c1f-eec8-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 02:18:32 +0200 (CEST)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 AM9P192MB0871.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.33; Wed, 10 May 2023 00:18:31 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::5056:b334:c71f:b047]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::5056:b334:c71f:b047%6]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 00:18:31 +0000
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
X-Inumbo-ID: 32251c1f-eec8-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6ggHOMYqA+VDkqkLM68zo3xoa3Im/SBUvsAq441pKH/4JAmGm6lBaPQSyIhOVrb7TQrnLvqtXP5f7ZcAv0Xh5k4OA2qVebfapADHlVxPgr+MFHNkNsK/JZN9huKiLMSFFAFF85a/X6CDsPTE289L3oXx+iJYGSEyQxnSNQdvPAVTy3zvyEIdt7OBg/yB4sap+vMuJOC18XB5R3k9HGZZ37VNUfl5ZELpCXoscROY6AsrENtwk4hjb2iBl8Eq66nHXlbk4VewO8S/0J6l0aKW9rgxN2bl5Ug0scGB4+y5jh8A7eHcSdssx2frZH8b1AFK1KZtVO+6A1J8+pxqYPq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HVxw76X4sNRQ9I6fgOOtesQKW3CkebbZBE9wbgYkqE=;
 b=oJg1Kn+8Rd1cLUYZQZJ+2xmot3wGRrKFPcCbsVZubCR+uKfFAg6E9SQAAXmFb0GedBelIAm4IH1W/PJr2eNzavj0xNWt7mR6cKkuDLXyPUUeMPgB6Hq0O3oybrq8L3uULH+eN/bZraKHEiUO+rV2B8QEpOSI4A/CzaN9+Am9i1hncTKRF0IiFqnG5uxzmdySvOfXESI7XLMBLQKeHkqtLrBPoH6qieUtVhen4Uk8I1o1B9TzzAd80sAXbPL348i558qYtw9yWctdfbkyPH0iB7cnf/gwkTRbk6otmcV0VYtr0DSD0sG5FirzVgaai9CGMZuI2okPOQGGYEt87sJ/HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HVxw76X4sNRQ9I6fgOOtesQKW3CkebbZBE9wbgYkqE=;
 b=eEjrJN9Cqodg2ENtj2iZJMJA2zMvzbV81Xq0POlDJc+WWGFB1w53H0oZdeJ/Ya9BeVHyaaOXOzspGju+c7zsdt7sQSTSiijo0swh/33ClDbN0TMmMPh0b8tXDVPASO481sSLR91YQU5yOzRrAy1zCATdxzEwuRCYVDxd4dOGDrwF4xO+BeL4FEydKjzVxv4hA30mV3AcOf8Fr+qs53tQMc2EhPOQS4mAKt3KSicr3TyfKnmpg+BQ3B+GPM7WhrddGqhkoKcF9EbuL8v/fVuovROm7NznNWr5ZgcI5kAlmk+7hsgXBEnqMaSDB2N6MLNVTh3B4UIOzA9jDIZxhegytw==
From: =?UTF-8?q?Rafa=C3=ABl=20Kooi?= <rafael_andreas@hotmail.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Rafa=C3=ABl=20Kooi?= <rafael_andreas@hotmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 0/2] Use streaming decompression for ZSTD kernels
Date: Wed, 10 May 2023 02:18:20 +0200
Message-ID:
 <DU0P192MB170087F1C604F82B946E0CD5E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [beReuaQEGpvvNbuXWl9DsV1UepjdXlqA/OFaDoYM0Eh/m0k42bwxKZ3y6Hazqxye]
X-ClientProxiedBy: LO2P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::16) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <cover.1683673597.git.rafael_andreas@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|AM9P192MB0871:EE_
X-MS-Office365-Filtering-Correlation-Id: e80615e6-f4ff-4213-4d0c-08db50ec1586
X-MS-Exchange-SLBlob-MailProps:
	ymJijV9pwJmf0wTWvqOqqkTBWKB/77TABiBo5ZvpMUBhh6UTcjUfUxQ7enf06q6+eSMzXfClCxGJ3JFYCJhmRcPQ6jkmu31XbHF8Wcw5ocbIJSCq9JR9umdgARHejUCalI8WpDqtZjo61adrBQEiwRi4IZR/99u9xAbwVJSIJ5IIxAhSBE9zE2xzCBBuCBUo9NMSZ2PJpdpRBy7nwLXY/FpKxHIl8EDUNNbXr2Ioy2zao5gfX8/Atz55rzADkvkQqidDAcTHIj4R2cdxGboYFzOxix9cTDSGQ8Kz1jtM/Tao4G500mTUAzVjAqUjcFtMbQURKPzBQoBTjqGirBujuIfXQsGuTgflw5aerwRstjIUE3LetKvZcrvcgytD+AWDcthtVbWeWsjGsX41K0w9DZPp01JAEsUMbkrdIQZdpJxau3H0VfqQz+FjPsiC8PvUS6g/PiqEgGH645Sbpz3Pbmf6ksyVNi/TDFQC/isRJcbZ5DWpCEVe6OGN60iyDdafneWFezhYM8wQZS7OJxs00hcddwRXiNvIctZaZSvZ9zytArfDXESAuRtOFdf5XYux15LB0PJta+g9AJmJeVzAnp2mdk/844IoZ4jAI1e9W2FwhYXpjQuQ+WFOLgao3gwWOQ30P3uNauIWfqlEmyaoOe4G749HQ4hnygm8GC9lLvVUhDuviUZw9B7NoPChJz3a8zYL6rGBW7euLBOkSvGRAdKZoqKt8HHUWcBBBlZLlkYvifhgMBuCiNfsxiVxfIjyn9myem07H4gLxZvsLKuBSqRy0qEAX876tbrr1OeCiDVgWnjKLXHn4MNw/qCVT2FA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gp7JB/is2poLvR1Hg1XZuV+GG6gIVp0+xC8MfgDSSGGtPoQyL4J9HVMny2tKxCXv1OqMOOGzYQNlMejKy5Di2o5mFFjm6rHKDgK/xF8rdwXosiCJpPyPvRiVWWTP6LqsbjId3r3ouEHrSr9Zd9pjnNIOK6HlcE7L+ZW0YfyBScOW8ZUpJ26pEBFGkmRVSbqeVgWOhrNaG9UflBslb1WPzMoAWVJ5Jo5w26uI/iYG/MM+WOip6OXlNNyTBjsru3bHU1rfMNm9je09cDX4I2si1yvbbXba0F7DSJ6IBPbENKg4IZ65gIH1g1OztemHriIRcQQxejNHpOjbwuUwGcoP0lHe2oW0gZBsHrKNA5qUr8IKBGJcUN52V6OMGvz7uzyzpHhvREjseCvpTErIsyhITcIbFVJH7rZOfODaeP/KQdXwwx+Rd6XEKR8ptSey06yoiiHlbqiQBMG4/sj3ZjQJTK7H2xlNjpmxR8amCkK3SWywaoxY6Ays7BNeBgup+av5kkPXYkadTevv4f/hbEEfEyouZG/xDzA2oRTSSaM/lOWLY6Se8fK+kMgIFkCOaJf+cyltX4pKW6kRG2QGMQaQ1Qf51Eu05EQPe11DwUkWiPo=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHZEK2lQWGZNTndjQ0I3dHIrck5zZ2FQVlV6TjUzdXMxaHM1alA5ekdVZXhN?=
 =?utf-8?B?ZmZndEtGUlV5MU1uejk0VTFBdlFva2Z1WkdkcU1pQzc5TmxXTk91azh2a21Z?=
 =?utf-8?B?MzRzV2VCQ0lKY2Zwc1ZIVWtDWGNGWGdtZURrNjVhbTk5QlA2M3ZsVzFFZjc2?=
 =?utf-8?B?VFY3b0VySjMvSnNEMXlId3YxNzZqdEtnNzZQK2xjdXNFOUV5Q2FTd0FJWVo2?=
 =?utf-8?B?L2xpNTNaQ0Y3aEN1V2tQUDFFYWgydzA5aHgxTmJjWjgvSXFXVkpXK3lSdTBi?=
 =?utf-8?B?REFndTl6d3M3c0tleUVUQlgvVHZGcWgyZXk1UjVJQ2xGbHVlVEFHU2c0SjRy?=
 =?utf-8?B?bE9kQXc2Rno1MnIraFBTTzNUbkxOV1U2MHZHRHgzbEFKM1VMRCtFcFVBS1c4?=
 =?utf-8?B?R3VoaFVuSDJLRHB5Q0hLMi9PNDNqa01UZ1NvNUxIZi9XckY0Sk9LazJCY3B4?=
 =?utf-8?B?UGZBaEdqczVRaThyUCsvWDI4M2Jid1lzU3RPeXFCdlBPQ3RyV3ZHNyswVFhI?=
 =?utf-8?B?NFBrTnpGUU5HZDhpMXZmNWlRdnVuVitSdWFoUzgrNVdjNG5aWWdjQXFlclNF?=
 =?utf-8?B?Y1krQk0rYmFKQTRDVVkrWXBRU3JaWVNXTmVFdVBwSTZUemRVZVpXSFYrZGFH?=
 =?utf-8?B?N0VFanJSbFZ0NGRNdmthaDVBK0ZrY2lRK283QzlkOFQ2UGpLZnpmdUNIN3Zi?=
 =?utf-8?B?d21nZFhEcm1mamRzVG1ORGE1RG5lcHh1ZXhnV1dOLy9MbUVkS0t3WWhpUjYz?=
 =?utf-8?B?ZElLTFBTTjM3eURXYWx3RWxINDhKMGhuc3ZrTzQwb1pRcmYvelJJUUZTckNh?=
 =?utf-8?B?aSswdktabnpJc2pmWFMrV3FZRkN4alR0bzRlMFY3VEZUdjlqMTVTckNHUTNk?=
 =?utf-8?B?RUVNVjJ0TnRKZUlJT1FObnNiZ3dMazFUYjlTU1Z4VCtJcXpoUC91QWpPRDFj?=
 =?utf-8?B?SWFHMmZGUlhPaHFPbFFrbW1aSHdsNTFLWkR2ZFljaXBWd2tRQXFpNXljTGNQ?=
 =?utf-8?B?OWR0YU5DcUw5dEZpYXlYZzJoMk45c3k4MUoxa2VjYVg2ci92UjVHU01xT3pO?=
 =?utf-8?B?TmN4ell1bi9kck1FOWNLb1RRTVFRdVQxbUtvaEJPdDlEOHVUblFHR0tkeUlv?=
 =?utf-8?B?WjZQRDR3Skoxb3J2VWZPTVN2NzhzdWFYdUFGTnFOd1VaVlk4RG01M244S3FX?=
 =?utf-8?B?MHhuYjkybWxzQWZxZnB3emJGd1FhUW9nNTVHcC9KL3hvNjIvRk5OZjJKVjBi?=
 =?utf-8?B?TTNYTFJDLy9ZT3ZETnBjVXU5YTRlZjJuUFVra0NJVTBFMGJ5dVdzbWF2Z0Yw?=
 =?utf-8?B?MnorcTFETUlINlpNSXRnYTljNWJaQkJJS0VwMG5GUjlUcS85alRWdFRVNEVl?=
 =?utf-8?B?Yi9LLzVaR3JzWU4zWUc0aWJCS0t4V1h0dXFPS2t4S1d6SEI5c2haNnNJU1l0?=
 =?utf-8?B?VUo5K3IzZ0MyZVJMZE5URkdRcGhGVThpUFRJVlFFTm40N3E0SHI2R0I3eGYx?=
 =?utf-8?B?cXMxQXFtUE81cHJ3c3JRUnEvdUF4cWpTRDJVMUc5Rjl1QkxPUTNZcnhhRVNK?=
 =?utf-8?B?OWdHK1A3TFEzQ252Mm5CNWE4UURoaC9YWVJVY0hodmlXczRiOWVwZWNIOHJV?=
 =?utf-8?B?YnNNZU9XWlJoaFFlYlU1NFduVGpMQkRlRVhna3VrTGU1R2RTTUJOcWZIb2t2?=
 =?utf-8?B?b3hWcXZrQm5VamFQTUEzUjhHUTJESVAvUk55L2JQa2dzL2t4cWV4UE1SeUk3?=
 =?utf-8?Q?WkXBGW0mFt9Zf+8pPU=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e80615e6-f4ff-4213-4d0c-08db50ec1586
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 00:18:31.0806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P192MB0871

I've attempted to get Xen to boot Arch Linux as a unified EFI binary.
Using https://xenbits.xen.org/docs/unstable/misc/efi.html as my source
of information, I've been able to build a unified binary. When trying to
boot the kernel Xen complains that the stream is corrupt
("ZSTD-compressed data is corrupt"). I've been able to reproduce the
issue locally in user-mode, and confirmed that the issue is also present
in the latest ZSTD version.

Using streaming decompression the kernel gets unpacked properly and the
output is the same as if doing `cat kernel.zst | unzstd > bzImage`.

A problem I ran into was that adding book keeping to decompress.c would
result in either a .data section being added or a .bss.* section. The
linker would complain about this. And since I am not familiar with this
code, and why it is this way, I opted to add a user-pointer to the
internal decompression API.

Rafaël Kooi (2):
  xen/decompress: Add a user pointer for book keeping in the callbacks
  x86/Dom0: Use streaming decompression for ZSTD compressed kernels

 xen/common/bunzip2.c         | 23 ++++++++++++----------
 xen/common/decompress.c      | 37 ++++++++++++++++++++++++++++++------
 xen/common/unlz4.c           | 15 ++++++++-------
 xen/common/unlzma.c          | 30 +++++++++++++++++------------
 xen/common/unlzo.c           | 13 +++++++------
 xen/common/unxz.c            | 11 ++++++-----
 xen/common/unzstd.c          | 13 +++++++------
 xen/include/xen/decompress.h | 10 +++++++---
 8 files changed, 97 insertions(+), 55 deletions(-)

--
2.40.0


