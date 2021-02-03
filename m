Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27230E191
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81021.148930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7MQI-0003EP-Om; Wed, 03 Feb 2021 17:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81021.148930; Wed, 03 Feb 2021 17:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7MQI-0003E0-LO; Wed, 03 Feb 2021 17:58:38 +0000
Received: by outflank-mailman (input) for mailman id 81021;
 Wed, 03 Feb 2021 17:58:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L1oB=HF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l7MQH-0003Dv-F4
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:58:37 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 201e75a8-f5af-46b6-9180-77516bb62f80;
 Wed, 03 Feb 2021 17:58:36 +0000 (UTC)
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
X-Inumbo-ID: 201e75a8-f5af-46b6-9180-77516bb62f80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612375116;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=trcoQUEy5txRTrkPduMpJ/zANyByYqabtUa0dtboCho=;
  b=KDdEYxdhLW4vp1tnHZ7iGPdgSav+aSLZQrlDE8LN5StQ15d7l4zDxUmB
   Jzih2rUkQfF4jCUjlOD5VKgNp4z1rhl4hIiyFZar0uPltccd57rMjeWA4
   vJySMKuI5pDzWgC9oJhOAWJSfqr0zRG7R/Y7nXquovEPCBl97C9zhVE1U
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vQIsZrlU8rjQ4RHzpTnfcjUbuRHoAJj4LFKkYEXTrVSMzpFLtqL34QLRmknlQxGDIz+iOeWqh+
 s0hkX6lmFgzw+UwfCdaVZC25ziynybjqyD3C8r1c7sIb5WmHHaTyIwSTl7i4wHtu32nWOBXNui
 Mrep6DLd7vcQtk6TlJRnRpPnwlm4NA5i4yhg6FgX9g2Qgdmfi3aAI+R1uFZHgN3BofHnipNOui
 ADt5cAl2Ou3jYJnuj1nhxWzgzzy0ENYZiIUbzd1dlronveRoIw3ghmAlPW490EKBQGvm3ZJJsV
 8ik=
X-SBRS: 5.2
X-MesageID: 37823703
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,399,1602561600"; 
   d="scan'208";a="37823703"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y29yYlYHYQ0x01KG4+/4leStVdhwQ48Yk1q/4DdE8q8c5k+LW6/jJGHRRE6hcXUP1FiCdYwNtsL9Yss4eGMxbkzFuYcifxlkfLMH1oIvw0boN94s9zZmT/uVX/U0HZr6/wBlw/8A06vkF12Wr20bmMtYZN7mwViPUxtYke1K8NCrgdr2huZTL8/8ojhFulxnqNkYDoCmqRT6Ikj/KojoTwwx0+6gd2Uq2A/yj7CuqHBNXQXXyIfVlff1F/FnsysJbyL4OPQSaAIdts82669Ms2Rnei7P52MBBhodMKMWN0HWliXfXHyCKewXEhSF6+TJmVgWlINWfUgMHSIbhO7YPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmNkCv8sutdkYan5lMTj0IWcXRQ7sSkRkyHjZ+tlES4=;
 b=Mg8yzhq7V2l1cmX3wwwaq0Fh0gRN9mku506t/DrJ9beWgMKAkIha8GrW2T0QucjrV/uQYaidcOqMX1ANsZNQpbNH/NnOYw/XfoRuHGVl3SrbDgzU8iBddVgQ+ZVkEjGEFcIQRYxCxZ+HrIPsXuXEKvd4XwB9UNTtCH6Wu1aTZyXFx1dCR6RfmdGevH0rQGIU/RHBbpDqhXuuw8BkEhJpjVxr2kS5yF1dNEbmFDjq5V5MBxQ40HZRCB66OwyCvOCvAm010vEozzE4KLugyLPFsSNWuujJYm0t9zPdvHMpolY3jz2grO0sXfZ232TcnKzFxMFnfnFQz8YeIhVr7YOjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmNkCv8sutdkYan5lMTj0IWcXRQ7sSkRkyHjZ+tlES4=;
 b=sGRPDC2Wz3AtQPfj79s/VI4lqJB7vz0qfNckRpARc9K3/U2tQ3Wz5+BwprGiyDJbovXPa0TGx9YtvgjZ2iXQrsJRxEsNTyzSJdR5wnrf8D08xB6UQ7uoGG6qjXmPD2zOVDW6PDrDrR36mBDQF7b5rz4VHIX0468ulYaOHjSLKUc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.15] x86/efi: enable MS ABI attribute on clang
Date: Wed,  3 Feb 2021 18:58:05 +0100
Message-ID: <20210203175805.86465-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::30) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7141ae79-a15e-4322-6d31-08d8c86d4a49
X-MS-TrafficTypeDiagnostic: SA0PR03MB5609:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB5609451C893E84377946BB3E8FB49@SA0PR03MB5609.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4bsGsDJsgpd7znIp0KYIcsrLbHLV4382rwoU9+tVsPqb2ggYgWrO+Y4zZbdGAkxvqkaCZ9TiSJKj3oiT42k/Rutyfmos1kwbNH1qwBzdhKAal3Fc+tzLDXmDi0X8mXjgrrjBxzjhThhBhQpF187F4jd8Cdviz14zBIN5nLP2Koem4KyMtYW1J30K0LRD2eZQNdH6cEuMPyC+DMkypiYYIYdM6Dcb2e8+Q5O67iVe9e5KO5hnPOHBYrZOl0aOe+48be0FaTAK9OxjT/gOXamrAi37iCz+WCa3VEdD6yTUYO64lURrOIv8GIFN0IXy/UzpzurZygirsT7FBbvyjQXZaYlq8U9cJ2YGWogoDjkT16FSj3gVP64VuFmPhRvZ1Z0jreoVRhWL8zfEgrswSqVkMSFtjcqHO379KY7dvybVavyAZwWVAZTOGzqHJGFWXV1RJBeeJXZEj+P+28Yn+2UZ3uHxo3LjuKIL1LaxfkanFgtnua2p5cqdAEDxfyWq9U2VnO1oxtfeEttTUQlwgL5G/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(36756003)(66476007)(6666004)(54906003)(66946007)(6486002)(83380400001)(4326008)(8676002)(6496006)(66556008)(8936002)(16526019)(26005)(86362001)(316002)(45080400002)(6916009)(186003)(2616005)(5660300002)(956004)(2906002)(478600001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NStUNEV6aVEveXVvMWdjYjhINUpMM2d0YU4zR3RNaE14Z0FiS0FhYzRLNXAv?=
 =?utf-8?B?dnRZeU5uRjAwekU0dGg2RUMwMm5UdnViZzRJRU5XQktPRnJORTJ6VFhBVlVQ?=
 =?utf-8?B?NS8zRmkzZVR3Z2t4dFdLSUNiSm4zOXk4b3N4bTRWeWF1elM1Tk5jbEdEQ0tz?=
 =?utf-8?B?bS9uK2VabkpoZWs2V1kxeXlqZlFKOWhUYlk1NExURDZwNjA1TDZuT2lqMGtF?=
 =?utf-8?B?ZVd4Y3J4UzF2MkZEQnhoWVVJcXZIalZxK0NQZzcrMVk1TFhQV2pRWExrWGw5?=
 =?utf-8?B?eldTajg2K2FqdGZsaUx0ckh6d0x4SlRGZk91VEFtVjNQbmxjV1FTSTBxY1JH?=
 =?utf-8?B?NDdqSWJRdWZTVTJOaWlRMUpvM1NWZHVuVVg5S3hUeDlJVERKQWRJNmV1dU5S?=
 =?utf-8?B?MWcrbmNVbTlBMGpxMUhKWXR3V2wxR1I0eWpOZ2tCMzFCV3pUMmZlSHp0anFm?=
 =?utf-8?B?ME5GNXhjOUYxMnM2MnROZGhWQlNaaEYyRk5OenJ4d3ArZTVXY0dhRmNIaFNM?=
 =?utf-8?B?OEhULzBqMVpMLzNDREdNY3N2bWJUYWVEZVU5THpJZEd3ckhPcnhDUzlyY251?=
 =?utf-8?B?M1RGRm1JN0llaXJMNWZnL3R6TDNhQm0zT1Q2NGNDbDZ3MHRMZnIxZ2RBVlMy?=
 =?utf-8?B?UU56VjJRREkzbnhDUEhCTy8zTllWVXdYRFpsdFUrcUJjOERMemNGVDZSdXJk?=
 =?utf-8?B?ZXl5S0crTnAxeXc4ZXZzdllEazNhQXg1YkRyaXAxUkF2bUsvTEI5VWpXRExY?=
 =?utf-8?B?ZnpIRmdXb3hHVytqMGRNbEkxNFd2SURSV3BHc3Q1MHliT2s0TkRYV2tjdm5T?=
 =?utf-8?B?Y3FuaG9taEhOVGYrN2thR2ZBVndqMHZHMGw2emdYMURnQVhiT2cvL0tkL01Y?=
 =?utf-8?B?dWFDVi9rOWxVd0JmdTNhQ1NBY1dLZC85Wm9IS3lWVVg5UEtLTzN4NlNpRU9y?=
 =?utf-8?B?TmRlMEZrYVVYMVNNS2h5ZEovNmFSelgwK2VjQlBnM3IzSmpPUUpidGJVN2hS?=
 =?utf-8?B?MUl0dEFkZ1RwdUVsSmw0VE1YN2Z5bjVxUzVTaDRkVWhkTGYzUmRmSlZ0MHNF?=
 =?utf-8?B?WUIxUUtxKzQrbU93RERYUGEwcWhJZHBrUzVJY3h6VEM2QXF1TFRWVzBENC9v?=
 =?utf-8?B?T0MySG5FK3JWTHVOeUdkLzZTMzUzWHQydkl0U0dQdTF1c24wbXZhcWR6cktF?=
 =?utf-8?B?TWV4V2F2QXZFK295SjdTWjNlb0h4TTNwR1B5UysrN3V1dWVJMzBLQWRvS0VI?=
 =?utf-8?B?dXlsWEtxemJiM0VLTzdHSHk5VDFhblRtd08za2ZXK2VWZnQzMzlPczJ3cVhE?=
 =?utf-8?B?MEhtdmZxVEhiR2w1Tk1SMTd2ZHVEMkdVWWxUWXFsU2xtUVpxalBQMlpqdjlo?=
 =?utf-8?B?alpaVVNYOGRacHRlS0lRWGdNVFZRNWRZWmc3V2xTclVKekRMZkJPRElUWEQy?=
 =?utf-8?B?VG4vM0VrNFluaklMMk52TWhVMUVkT1hKZGlDVnV3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7141ae79-a15e-4322-6d31-08d8c86d4a49
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 17:58:19.8780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhYBoYNw0Auxh/za7PeAyktaeErsja0ptV6IvLJgxu30Twq028CYnZsE39bPMUa3AqhpGdkJlOsQOViou3pZlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5609
X-OriginatorOrg: citrix.com

Or else the EFI service calls will use the wrong calling convention.

The __ms_abi__ attribute is available on all supported versions of
clang.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>

Without this a Xen built with clang won't be able to correctly use the
EFI services, leading to weird messages from the firmware and crashes.
The impact of this fix for GCC users is exactly 0, and will fix the
build on clang.

The biggest fallout from this could be using the attribute on a
compiler that doesn't support it, which would translate into a build
failure, but the gitlab tests have shown no issues.
---
 xen/include/asm-x86/x86_64/efibind.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/asm-x86/x86_64/efibind.h b/xen/include/asm-x86/x86_64/efibind.h
index b013db175d..ddcfae07ec 100644
--- a/xen/include/asm-x86/x86_64/efibind.h
+++ b/xen/include/asm-x86/x86_64/efibind.h
@@ -172,7 +172,7 @@ typedef uint64_t   UINTN;
 #ifndef EFIAPI                  // Forces EFI calling conventions reguardless of compiler options
     #ifdef _MSC_EXTENSIONS
         #define EFIAPI __cdecl  // Force C calling convention for Microsoft C compiler
-    #elif __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)
+    #elif __clang__ || __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)
         #define EFIAPI __attribute__((__ms_abi__))  // Force Microsoft ABI
     #else
         #define EFIAPI          // Substitute expresion to force C calling convention
-- 
2.29.2


