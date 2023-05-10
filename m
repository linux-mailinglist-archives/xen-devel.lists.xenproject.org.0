Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8596D6FD60E
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 07:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532612.828886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwc9O-0001SS-4s; Wed, 10 May 2023 05:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532612.828886; Wed, 10 May 2023 05:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwc9N-0001Lj-VZ; Wed, 10 May 2023 05:14:05 +0000
Received: by outflank-mailman (input) for mailman id 532612;
 Wed, 10 May 2023 00:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VlwF=A7=hotmail.com=rafael_andreas@srs-se1.protection.inumbo.net>)
 id 1pwXXT-0004li-Sy
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 00:18:39 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02olkn20822.outbound.protection.outlook.com
 [2a01:111:f400:fe13::822])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36252708-eec8-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 02:18:38 +0200 (CEST)
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3bf::6) by
 AM9P192MB0871.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.33; Wed, 10 May 2023 00:18:38 +0000
Received: from DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::5056:b334:c71f:b047]) by DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 ([fe80::5056:b334:c71f:b047%6]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 00:18:38 +0000
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
X-Inumbo-ID: 36252708-eec8-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpxuxsysUsDSy+raGfwZoQG51JT6QRIdG++XXpcSoUesQw9F8jwVr0CgyxdY5R1VWVm5xIdvfHI3sWj6Z0zJJQVYrvodrggawSqPEizDJuK7Jnrj8qjgZhvnW4eb8YyOOcvawrzlq6Hzk/idD2yl1nWTqFB4j3yphKgZ+G3GHeahTanKOZ9jhTI5OZPRvtzbUuBuUFyz4tx2uI6vdxgj+JtpecFWHwvtaQ9dGM7L55c88nhG0qC6TVGbyCDBr1ZetSQnlkrB25+06IgTPZP7cUxjU59sMb0EWsMq5qpe5Akaaj/zFEQDctr5asjw4mPRl1HJG60hHHzmkr+IBo9+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Co0A8XpUzSdvSffHfW1JcfS0NgGlehxe6pGZTt39HIE=;
 b=T5BOE9bB0TEiD5VWiQpmV7JGoup47DkMRhy1Y6WnVG6R2Nz1dioJx3xrlqr1RpOh3FRtFmDx0gBOiksojwbH5dXSMEqhHvL8Kh0gJ7fNogjiTh/s9lIWBkABKx4fkgKywqHX3q0V8Boavg0lJXNNgQAVHYwvEuBIux+5J9L71X51i9v0TbF2pBXAUZIR5ClNSc9LK/zUtly9yxCA7QHxbVeyAxg0OK0qusSGVfSQtsZujKowVj5SFYkEMs701RmSmruWKJDz+6+Rmmp23tTVDq2OuwMfIzrllGOmbp4eZV7Sn648HQa/x43ojBic33Omlf6dOCsLZpEL0EKEKRpYgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Co0A8XpUzSdvSffHfW1JcfS0NgGlehxe6pGZTt39HIE=;
 b=RIat4IdLGcLGFwu7+3bnNxBZdsF8F5KYs7DP+LXUPfgq9THaa7pZ3Os8sFfsjAwB5fdvJH8a97htQNrNib0c/qCJjmclRDcHntrpmJEHkBlK7ucGLq2HUTK6M35AbXNY/AOYFub+JqqhpiCH22WjkJxEB2ArhChsMEZK7HZ89DCHKfykWiRH7syXrbPvpQs8lN3Th/iDFcumvSTmhVFoZr4zjg0zHcOv1H8loSrUPA51+ZRWKsJMSo2ZS6Km0ofGotSrUD/OfWCesFINzSX1+3omg2HMZRW2oOhwnZ2Be6bFTaf8SqGtF6gcBCz3l8hMe5Z6ar0poKpGVNYgUppsmA==
From: =?UTF-8?q?Rafa=C3=ABl=20Kooi?= <rafael_andreas@hotmail.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Rafa=C3=ABl=20Kooi?= <rafael_andreas@hotmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/2] x86/Dom0: Use streaming decompression for ZSTD compressed kernels
Date: Wed, 10 May 2023 02:18:22 +0200
Message-ID:
 <DU0P192MB1700F6DFE45A48D90B5FE679E3779@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1683673597.git.rafael_andreas@hotmail.com>
References: <cover.1683673597.git.rafael_andreas@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [HcumDLXUQx2Ka6y8dbImpEzA8tER5uiK1S3VfeyYV5wT2Hi4Nw5fZ9XqlsqI5KUK]
X-ClientProxiedBy: LO2P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::16) To DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:3bf::6)
X-Microsoft-Original-Message-ID:
 <c99bfbb52fa28dbc50c588828e2e325ba12be52a.1683673598.git.rafael_andreas@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0P192MB1700:EE_|AM9P192MB0871:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a01a52-a7fb-4686-ab79-08db50ec19c7
X-MS-Exchange-SLBlob-MailProps:
	ZILSnhm0P3k2XayEnZ/FXgv66CsfMCS1d7vfnlsnkxPz9PUXJadlSovgYnwo3lJ6PxRKlGP/SxcNROzPIHNCRtP3M+1kuBI/U+oo7Dpgd+Cwj1g1PGktYMMwagUf+Fjl1181pDhQnaVi/teLqHASkpl1GFzJW0BraS7JuIUeP2gOtW5TRGOYoiZbWtidRWc/NYabT2xh+8CWAfawcyO751KLlO+DDiFD8fo3sPVzPiFeHju87Lu126nUFDfVAnRWdxvr/TZaiZqEVKUEQEohD0UYOHjqDDJ7pePb0jY3qFbHK6TxMrCQYycSpVsASUuuoPPsQMG52S/tDRs2Jk5kKcNPCVKtBZ1iez8uVDvf30oRt+KPzvxcD3hDlWqPXIDd1VVL3kAE1Nh/zllFkiujAt8NOPLwJJPO03XhzLoJlGzBaDUBIYFSN4hFpvshdp4zpkfny5Ksv52QXI6KJKv9X38f5uskkhQ60EVXVzSTglTsFdjcarpU573Thb8ezfJ97eWc8ER6TAFxzAc1FBPI81N2QfEByfP4FfKnfk3ee6VjwkXptZDjGd+hfl9Qi2qUPG1Oym80RH//ULTm1WL4/LTpz9cyIBB2KPi6Hnf+ca9C0bxJwy182OxXb1KnM0Ri15/D81jvL2biMVcBWPkpwRoVSDni8iuB1SXRhJ37Spoe4Rcb6Yo9qPkZFt80WagRwOqCuin9ejZHacIp3uQ0ZkoGM6YPzlVvJK03GLNndk3+54cGbPV2+hIH6ZUHa1O2Q0apHGOImIIjRJYBZ4RjjNpXuy8+YQLV
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W5pC3f03pX93RXyqnro6AjJ8bptsX7vbdbLudov9rnBmZnW4pJtG5Z3hUX7qylEk6zEYu5mOu6Hq/ZLU7WrkoTFMb2H50RAfAIDWRLf8U+pW1w/Ez7DRmObRgD+2q7VPNyvxvjBanHX+FU42Aex0LbpdfH7i5nPl2b21UTu2J84F8uAs+8JBzeiC6wDXSazpagrBVnvSPsnzr0V5rNPQI8YCn2+rWqgo/kf/90jzOACVKY0ryFi3x24n66K+s2FFANPvbyk3N7JQzTO5UPwxKbNfegx0ApnURgrnf8bwwtfy/2MQnowLBYaqmFM2+TDy/NbxV7k6DgKkEioLakTeeqCxr+1tPQuaR9O16bLFMyOzb1EaNwIzuw7tny4dl5I1/Mgz7R1BJ3wXKQ+OUZ3taqwxQKTQqA6Q2xzyd2PXWQ8pMODyqkJeNhtjneDOXA4CilWl3z6ZExjcqDIvdX/N0WYGTVMvbxzk79mMDlZHZp9D++4irUe7XjqPWBNeJ7xyw8HhNXWLmx+i2RaqbL2/BQuz5zJLCgw6pCphhbZjqcIdgoVtB29AoJwkMEfPiSwRJBgDknUw5jCKHWh3FwHP1R+i0zuNETbepDlMdEjapyec33qkfjqPxdhR1PJIzVWv
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTJhekZaeFpSd3JKV3I3Qi8rSnFpNjRBWXNNQWlGUXovcUZ4Q0crNTJiNG5W?=
 =?utf-8?B?L29qZEtKNWhqR2dNeXJheHExTjhKM3lMb3JpSVF2VExGU3ZRb3Q2enBtUDJ3?=
 =?utf-8?B?OVRMZDZnTm5ESUJyRUs4MzcrWDNFSHZmT0pwU3RVaENHbHYrMkZzbzJicFFi?=
 =?utf-8?B?NlRoTWNPcm1RZ3J4RENRMzR3UDZvdFVmOHd4QUdFMWlpMEl5OW85d3JDSGZI?=
 =?utf-8?B?ZUJONUNNQUlKajJScHZ0dXVIUkxabGJpOC9WSlRncE0rWHY3NTFVTWQ2L2dO?=
 =?utf-8?B?dU9IWjl2cDZKOS9QeVN2TjRSS1FoY0QzYXgrVTZrK3AybFNEemJ1aHBVWFhS?=
 =?utf-8?B?N2hRVlhsbCtucnN0cTdxbm41QklOQ0hUZW11RlBPdE9nTW9WQ1lhYWQxMFZJ?=
 =?utf-8?B?Q1lWT3c0Yk83YmR2ajliQWFUZWFxSVBPYnY1S1VUb3Jud2N5RE5OL2NLSGYx?=
 =?utf-8?B?SURyTERmVWhIQTZ5YklVNHMvdWw1QWVZYU13Q3RKRWZRQUZzZktXWE95Y0xT?=
 =?utf-8?B?L1JzTFc5Q0ZLMFBBUG5hb0tHWmgybU1Pa2R6eDQ4MWVMaUFJQkozb1hMN0JE?=
 =?utf-8?B?a2hpc3FxN3RvK1ArOXRya1N1LzFuTkM5QWhKR3F0b014SW0za0pHdzhLSGtx?=
 =?utf-8?B?aUVpZW5vOUxURy8zWjZGVVRnZjBDOWxRc2hhY0dKZ0dFcHZiUE45Z0tkWTZ0?=
 =?utf-8?B?SFh0ckZtVzdXZGxKT2dIOThQelVDV3U0SUVLWFo4ck9UbWtnYkhCU0l5dnFn?=
 =?utf-8?B?SW4rY0UybWd6WlRXZ3AydkhWSGd4YkczUEtXVXFJb1p2OXh1ay8vYWoxdEN3?=
 =?utf-8?B?UmpRUDJJRG9VYzBOcFNucUcyQkx5TVlReEFVU2dqNFk4eElsdEhpcFRHSHdr?=
 =?utf-8?B?Y3FEK29uZ3RMOXVrdThSUWdBRjNLcGpmUG5wY0kvKzhIQ3VWd2RyS2pWVENG?=
 =?utf-8?B?WjZWZ1N0bWo3UkdlTzVDQnk4c1Evek9Kc05Jb1hGditZSmNHMWM5dkFpd0d4?=
 =?utf-8?B?R2dFUTRlK2N2dnpOM0xyR09EUGZCSlFINi9VOG5JZC9sTktmRG5mS3ZvUmhn?=
 =?utf-8?B?TXhTVGxCMTVkUERPdHRSRTlEcmRxNW5Tc1V5WTQxekRnWjBjRHFKWUJJRE9F?=
 =?utf-8?B?ZktKNkV6aUZpTUgrRk1ia3EwWmdsc2NWb3ZEWHFaN2F5dnhyQUNXUDRuWmdp?=
 =?utf-8?B?MmtGNG1yUjkwYmVWcDVYZ05HNlYzQ3g1NFhBMXZMbFM2czFETTRnZEk3RTdQ?=
 =?utf-8?B?SnlDUG4wMlNRaDJFWHdFUVV3Y1J0VS9tY3ZneHBEM0NLZzNxbjhDUldrWW04?=
 =?utf-8?B?U3d1SFZncDhPOUVncjQzQ3ZuSWErSTRkcHdhY3l3RDJKOVRtTFhGeGREanRo?=
 =?utf-8?B?bHNwS0FLWTNpRUdybVlMSHJTQmtScERRMEJYakROK0t3NnJtSW82Ykh5SWpS?=
 =?utf-8?B?ZEx3dzVDakVyZ25DdmU0SW5mYVQyTmcyaWE0bzNZc3REaXd6d01id05LQnQw?=
 =?utf-8?B?NEZ3OElSUUVvRnRQb0FGaGNDNlVubitwUTE0MFhQTjZFdG1TZTVtS0FULzJV?=
 =?utf-8?B?S0t4T0pOME9pTDZ6eU1Od2dBZ2lodDhrM21KamptZXpqRnpVUjJUWThJb2Vj?=
 =?utf-8?B?NlJtR054b2FoZXFqMWlEZDRXbDZRKzdrQXU1WDlUWHBGd0w4a1VOaTFNT21P?=
 =?utf-8?B?Y0N4UHl1NjRJSUNiT2lHUzFTdTJxUlhON24zQVhJZ2NzZG1kdmtlUlRzTXdx?=
 =?utf-8?Q?8Xrx4eLFd8qMRBfmMI=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a01a52-a7fb-4686-ab79-08db50ec19c7
X-MS-Exchange-CrossTenant-AuthSource: DU0P192MB1700.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 00:18:38.1978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P192MB0871

On Arch Linux kernel decompression will fail when Xen has been unified
with the kernel and initramfs as a single binary. This change works for
both streaming and non-streaming ZSTD content.

Signed-off-by: Rafaël Kooi <rafael_andreas@hotmail.com>
---
 xen/common/decompress.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/xen/common/decompress.c b/xen/common/decompress.c
index 989336983f..cde754ffb1 100644
--- a/xen/common/decompress.c
+++ b/xen/common/decompress.c
@@ -3,11 +3,26 @@
 #include <xen/string.h>
 #include <xen/decompress.h>
 
+typedef struct _ZSTD_state
+{
+    void *write_buf;
+    unsigned int write_pos;
+} ZSTD_state;
+
 static void __init cf_check error(const char *msg)
 {
     printk("%s\n", msg);
 }
 
+static int __init cf_check ZSTD_flush(void *buf, unsigned int pos,
+                                      void *userptr)
+{
+    ZSTD_state *state = (ZSTD_state*)userptr;
+    memcpy(state->write_buf + state->write_pos, buf, pos);
+    state->write_pos += pos;
+    return pos;
+}
+
 int __init decompress(void *inbuf, unsigned int len, void *outbuf)
 {
 #if 0 /* Not needed here yet. */
@@ -17,22 +32,32 @@ int __init decompress(void *inbuf, unsigned int len, void *outbuf)
 #endif
 
     if ( len >= 3 && !memcmp(inbuf, "\x42\x5a\x68", 3) )
-        return bunzip2(inbuf, len, NULL, NULL, outbuf, NULL, error);
+        return bunzip2(inbuf, len, NULL, NULL, outbuf, NULL, error, NULL);
 
     if ( len >= 6 && !memcmp(inbuf, "\3757zXZ", 6) )
-        return unxz(inbuf, len, NULL, NULL, outbuf, NULL, error);
+        return unxz(inbuf, len, NULL, NULL, outbuf, NULL, error, NULL);
 
     if ( len >= 2 && !memcmp(inbuf, "\135\000", 2) )
-        return unlzma(inbuf, len, NULL, NULL, outbuf, NULL, error);
+        return unlzma(inbuf, len, NULL, NULL, outbuf, NULL, error, NULL);
 
     if ( len >= 5 && !memcmp(inbuf, "\x89LZO", 5) )
-        return unlzo(inbuf, len, NULL, NULL, outbuf, NULL, error);
+        return unlzo(inbuf, len, NULL, NULL, outbuf, NULL, error, NULL);
 
     if ( len >= 2 && !memcmp(inbuf, "\x02\x21", 2) )
-	return unlz4(inbuf, len, NULL, NULL, outbuf, NULL, error);
+        return unlz4(inbuf, len, NULL, NULL, outbuf, NULL, error, NULL);
 
     if ( len >= 4 && !memcmp(inbuf, "\x28\xb5\x2f\xfd", 4) )
-	return unzstd(inbuf, len, NULL, NULL, outbuf, NULL, error);
+    {
+        // NOTE (Rafaël): On Arch Linux the kernel is compressed in a way
+        // that requires streaming ZSTD decompression. Otherwise decompression
+        // will fail when using a unified EFI binary. Somehow decompression
+        // works when not using a unified EFI binary, I suspect this is the
+        // kernel self decompressing. Or there is a code path that I am not
+        // aware of that takes care of the use case properly.
+
+        ZSTD_state state = (ZSTD_state){ outbuf, 0 };
+        return unzstd(inbuf, len, NULL, ZSTD_flush, NULL, NULL, error, &state);
+    }
 
     return 1;
 }
-- 
2.40.0


