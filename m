Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F87276B1F4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 12:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574063.899265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQmi2-0001v1-OF; Tue, 01 Aug 2023 10:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574063.899265; Tue, 01 Aug 2023 10:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQmi2-0001sS-Kx; Tue, 01 Aug 2023 10:34:34 +0000
Received: by outflank-mailman (input) for mailman id 574063;
 Tue, 01 Aug 2023 10:34:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQmi0-0001sE-Jp
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 10:34:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffc35661-3056-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 12:34:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7632.eurprd04.prod.outlook.com (2603:10a6:102:e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 10:34:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 10:34:28 +0000
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
X-Inumbo-ID: ffc35661-3056-11ee-b259-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJ9CjExknNtp8EHGjQG+rxkUex3lVDTrrwhvHLWInk6n+UYiMb2+OmJ6Bz3YEArrkRAIAg0Ri0nkS62Icf2Xgjz83LZ6gLOAmzsKBrDyVTe+xAMRLKdwbltmEsw6vkHP4NcW0xy2o+zFd7g1B8gPut2mroow1CCa9BEFjTRgLq8rIZGemcieqcWkMjfkr0dmVMxlu2g9YsOAu24KPOPgB9TMB+RC9lsdJoTCxVaETDpYRuwzgCnB6PgkZlr92v84TFtIvdw0pJn5w6zv0w+mJELpiN8XTvyT8IHmP4JVIFQT0QQrVRogfPcayLBU8nQf8+TqF/Ai+ANBz8RgBaRNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPetlcq0W8Si/8ESOPYhHdDKK+dXarC7uGuQ7gajC7I=;
 b=XyRv9Ui8C/8/xmzCkw8Thf33v9IeRtC5MoQ8RyrH066sLd48GNvB00G25yiv39s1mLFsJogipj0ix0YIriw9MMcMJmRLE8lpEcQCUFWzSBnvjgeDUk9KEVt5E2MUzYz/pd62BIzxJFvx7NowotWI/PUhlhdrq1FvBr4Rfwoov/0X/IIrY8woSTVG3u21Uy9ObeLnWWklKpCpvCarSoCYoRN/1y7yKoNxSWkTOlC1Kb8/eH06/nr6SJ1uRjHePGnwzwKgkx6IU8Nu9FHvp1DYwRmUC+h7wT8KWjuWZzzMIB+cBDpgcvBHWDimNLQo4UgG5hxd9rhcpk2n4sPIYFD0aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPetlcq0W8Si/8ESOPYhHdDKK+dXarC7uGuQ7gajC7I=;
 b=LC/RolXF2JmXHB+EJhKKAOAOcBJJHbByoncfgRARC/9n5Z8Glwb1bWtPNsnYjlE4XlUDogoDE+BN6LEe0ipVmWrvgQwmZaSVaM0W9G4I1JRcXIPN5a9Ah7zBW6xdo6hgU/jougZqBvsTQfpGuicqtYOZRRu/ww8ae+a9v1qGq1aH8Pj6Dq4QGPDm7QQlq2n0QJAQr+C1osvFvx/UauVbO4YL7+/FvNXjoiv3e8R1iN4p3o5IbyYvkr2xhEflZFYSyOTtYcq8/UpMQR12v6Dv1i0GeYP2CVG5kST6l+hi9XDCnp7XqmyrmYDAFGnqXncUmqZdYf7/Zy20IOeZ/1i5OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4ba63342-6200-1f76-bf63-8df62e8955a4@suse.com>
Date: Tue, 1 Aug 2023 12:34:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] common: move simple_strto{,u}l{,l}() to lib/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf6bebd-fac5-43ce-12bd-08db927ae228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NZzwQ+ltOd6lJzIWMPmwef75wgDWHKwXukbWsLvytNRsnw5TLpAp7lOHKbFf5CpVqqZ7Lpi3g2BxrTLIccv2RSK6+qmXV9l9XTlIM1Ad01Yk/74NzghFKF8XK3hcr1QDnbx5NP1VCLHfd8hR/oI4J20P8qfn4TwuCsMt+0xZh2zbKgy0hFpul9ThnRIUr3qcM9gnn4xOMsbzKTrgazvzMC75akWvXzNM66B7bMvvqmi/c1w2bOeTDxgOOD/Rim2Vvklgc7uJT2X5nfhlJKxWpzm9h9VXHZDR52v+B+HOWR8od8dw1yu1nJnUZM4vQF9N845e9DAaKCPASz3mrtqHukYbrtGzdFNDLg3wzU4qEeR/jEr3s/lF2ak0YvinmMlFbdhQWClneSd8925HLSGuEVPYNCmM0732jf75u19728c0390aQsghuEnFmTeMYAUBAnreXUjiN0kZEGeBhUoS9ApuLMWjB2KR+AYUVscVzqRzMhn0mQhaNb8m4fV2t/ucCqHyvvWXRPK2fT2Dwa5O0iniw+x+sT71AHFGZv3KCocaCwZme5jYugH4nl1uhHewHAyfkIYJCgQMCuw0SVRJ9/4yGy0KyUMBU2DUx1pbx22oHFLHTSUoHSQE5rANYOe+qIPs2gFFDspiUGDMZXG2Vg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199021)(6916009)(2906002)(4326008)(2616005)(83380400001)(186003)(66899021)(316002)(38100700002)(31696002)(31686004)(41300700001)(478600001)(86362001)(6512007)(54906003)(5660300002)(66556008)(66476007)(66946007)(6506007)(26005)(8676002)(8936002)(6486002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzZEWWdSVDk2TkNZOURINzlLZkxpbDI1N3R5UDJYRUpka09hYjBZaTNsZ2Jl?=
 =?utf-8?B?T21tSE5ZZUR2dmt0a0xVRXJDRzlxdGVBVHJoNUFOYjBhc3VwRmRyMDI0eXdY?=
 =?utf-8?B?SitHTGJXVmttUlQwcU9NRFBydndvUzVtWTdQUGRpNkZEWHBha3VJeEdnZlAv?=
 =?utf-8?B?cjdsR2V6anhrd2huRnVBakp1Q0RON3p4WjVFeUFTY1VJaE5aZDQ4U0ZhV2tq?=
 =?utf-8?B?VVNZK3REc0l1ZTV6bHlwYWJJK3NWWXVNUEo2Q3VWWkxHcFlrbWg2Q2pzaGsy?=
 =?utf-8?B?SmdncnpPUTVabEJrRjB5NjhtZXRPWjQvV3lKOGphbGgvSTRxOHJVMlNjSG9o?=
 =?utf-8?B?MDdVekNmTk01MFphOVNacTBmQk9CRllVbmJFRm5GR1Y4ZmQ3YWY4ZUIvMFc0?=
 =?utf-8?B?SjJFM2xWZmV0dmIva2VhRm9hc0NDSjdCeWRoOTVhWXloQU9lNFlIVncvdnhR?=
 =?utf-8?B?aStyOWFLaGl4Vk5TQzVLUmJKNURBK3dVZ1dMdmtSeksvbS9zRkJobzZpSHY1?=
 =?utf-8?B?Y05FdXdkUS8rZFAyYS81dnRqS0FYZEtqTnFjbDdwNkN3ZHdnMGxaTlk2NkVM?=
 =?utf-8?B?Q2VNRXBJaC94clI2OVQ4a3RsL0N2LytnYzVObVZQYkJCeFJDUmQ3b2U5Nmox?=
 =?utf-8?B?RmVGZzN0a0NjUTVDZUQwRHhkSjB1eWQyN3lueUVYZEtsZVRuQlp2VTduaHV1?=
 =?utf-8?B?MDZCN3kxaEZrRzdKbVRiR2tManZsTUdWWEYxN3BMNnZGLy9FbHJTREdURUFo?=
 =?utf-8?B?NkZqY0tlYllnUzlLQld5ZkdINWZUQkVNM2VjM3lFSWVEVTlwSDFlOUVzL2Uv?=
 =?utf-8?B?N3U5YVZFSEFzRjd1TUNGcHAzMjdRblVZdXNUQUdPT3lST0pRaWE2SmxOK2ZB?=
 =?utf-8?B?SmZ2cWhjOWEwaHFwSG5UMzNPbWNXb091SEFCVWRFTGordDVkdUpnUTVUQmd0?=
 =?utf-8?B?eVVoR3dNWTYyVmoveVhLeW9MYktTY3plOUYwRzdoRFI4a2ZrUGFkQnM2QmEw?=
 =?utf-8?B?bjVpcm8wUlVuMEdoRENQRk11dGNMbnExcWRVY3l5Z2l0MEgwMkhzZ1V5S01U?=
 =?utf-8?B?WUtyTVdtU2tSVjU1M2JyaVI3bkVtMjUrWUk5eFRTM1llR1JtOXplWmx1NVo1?=
 =?utf-8?B?MUtYMVBobjRYaU9QOHZ5OHJWcitOSzFydmsxUlJmQVFKK3F4ZWFFTjl6Qk1X?=
 =?utf-8?B?M1pzRkEyd0dRTGQ0ZzhGdkFsc09kYXFucVVmOFQvVG54Wnk3VUtuOFgxUjNH?=
 =?utf-8?B?dWlQNDlVMkE4d3o0NCsvR0RFUTltcE04c2w4UFZxNVk3b29ZYzd5Mm9uWWtF?=
 =?utf-8?B?bjIvUWpFRkgxZ1hmNU9ZSHlzZHhPOU9TSFF3UC90MjRsbDhUVGdXZlM5dHgz?=
 =?utf-8?B?NWJjaFlMSzVXSkVkVEd6a0FpcUxJQ0JmNlY5QnF3OUpQTkdURytqVWpNaWRX?=
 =?utf-8?B?UHFsdUZsS0NQaVU3OU9OSC8vVzh1c0Y1WTZqYmd1RzFXb2VObVlrZEdTTjht?=
 =?utf-8?B?amJ4Zllzc29SWlZxaVhGaXJvWkZVQThUMmJMZjdhb0VOTk9JSStmSW1maEV1?=
 =?utf-8?B?OU5WK1VoVUtiMS8vYXJFRXBaK1l6c28wVm5RRmw5L3BYRTY2TnNDeS9zbCtr?=
 =?utf-8?B?TytkQTNDUlQ4MmFTeHdXMDk0VWFwZWtjYStUd2FKZFJSZHM4bGxGNDVWa2w5?=
 =?utf-8?B?eXI0bHNuZUtKbzI0STM5VDlOQVNoOEVsMjZVcDMxbGxLeGdDdkw0dENRR0dO?=
 =?utf-8?B?WnRGUlJKeUVFbWN3dTlMSC9RcUVPUE5hSnNDbDJZeTc4dThFMmtSVUZRb004?=
 =?utf-8?B?cDh0cUd3ZzBpajlBMFIvcFlFUXIyRTNLSkIyUUFpU01MaG9XZ0RrVXVCQWZq?=
 =?utf-8?B?NGR6Ty9MTW5McnBmRDFQQU45Tko2SlZ1QWQxVEZCRldRUzRSS2tNWmg3T2JX?=
 =?utf-8?B?YzZvbzFnMEJjdmFGVTg5L1JWa3NZWGJNS0RodlJ1SWpzTWVwVkFFTC9ZRTk5?=
 =?utf-8?B?YmoxYkdrT3JTYmxQVHd4bEdOREZFbit0K1Z4bXhNUEhFWGltdWp5cHFuS2pY?=
 =?utf-8?B?d1oxOENuOTZyQUc1dEZJOXR5WlZhY2lIeDhwL3FVV3I2aEwvc0l0NG94ZDBI?=
 =?utf-8?Q?0mpxG0g7dAe/40YLe3+4agItX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf6bebd-fac5-43ce-12bd-08db927ae228
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 10:34:28.2089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jga3wutTo2CBCYiGXIB3Y6jBHQBhHCrHLVYF1E/CsnBastg6EFCECRMKt7T4IzbVsC5xB/cIeYMwmNI2T3PDMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7632

Convert style from a Xen/Linux mix to pure Xen while doing the move. No
other changes, despite having been heavily tempted to do some - at the
very least to make simple_strtoul() and simple_strtoull() the same in
how they deal with non-numeric digits.

Requested-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Further changes I was considering:
- "value" doesn't need to be unsigned long, and even less so unsigned
  long long,
- strtoull.c could simply include strtoul.c, after #define-ing "long"
  to "long long" and "simple_strtoul" to "simple_strtoull",
- "else if ( base == 16 )" wants folding with its inner if().

--- a/xen/common/vsprintf.c
+++ b/xen/common/vsprintf.c
@@ -24,108 +24,6 @@
 #include <asm/div64.h>
 #include <asm/page.h>
 
-/**
- * simple_strtoul - convert a string to an unsigned long
- * @cp: The start of the string
- * @endp: A pointer to the end of the parsed string will be placed here
- * @base: The number base to use
- */
-unsigned long simple_strtoul(
-    const char *cp, const char **endp, unsigned int base)
-{
-    unsigned long result = 0,value;
-
-    if (!base) {
-        base = 10;
-        if (*cp == '0') {
-            base = 8;
-            cp++;
-            if ((toupper(*cp) == 'X') && isxdigit(cp[1])) {
-                cp++;
-                base = 16;
-            }
-        }
-    } else if (base == 16) {
-        if (cp[0] == '0' && toupper(cp[1]) == 'X')
-            cp += 2;
-    }
-    while (isxdigit(*cp) &&
-           (value = isdigit(*cp) ? *cp-'0' : toupper(*cp)-'A'+10) < base) {
-        result = result*base + value;
-        cp++;
-    }
-    if (endp)
-        *endp = cp;
-    return result;
-}
-
-EXPORT_SYMBOL(simple_strtoul);
-
-/**
- * simple_strtol - convert a string to a signed long
- * @cp: The start of the string
- * @endp: A pointer to the end of the parsed string will be placed here
- * @base: The number base to use
- */
-long simple_strtol(const char *cp, const char **endp, unsigned int base)
-{
-    if(*cp=='-')
-        return -simple_strtoul(cp+1,endp,base);
-    return simple_strtoul(cp,endp,base);
-}
-
-EXPORT_SYMBOL(simple_strtol);
-
-/**
- * simple_strtoull - convert a string to an unsigned long long
- * @cp: The start of the string
- * @endp: A pointer to the end of the parsed string will be placed here
- * @base: The number base to use
- */
-unsigned long long simple_strtoull(
-    const char *cp, const char **endp, unsigned int base)
-{
-    unsigned long long result = 0,value;
-
-    if (!base) {
-        base = 10;
-        if (*cp == '0') {
-            base = 8;
-            cp++;
-            if ((toupper(*cp) == 'X') && isxdigit(cp[1])) {
-                cp++;
-                base = 16;
-            }
-        }
-    } else if (base == 16) {
-        if (cp[0] == '0' && toupper(cp[1]) == 'X')
-            cp += 2;
-    }
-    while (isxdigit(*cp) && (value = isdigit(*cp) ? *cp-'0' : (islower(*cp)
-                                                               ? toupper(*cp) : *cp)-'A'+10) < base) {
-        result = result*base + value;
-        cp++;
-    }
-    if (endp)
-        *endp = cp;
-    return result;
-}
-
-EXPORT_SYMBOL(simple_strtoull);
-
-/**
- * simple_strtoll - convert a string to a signed long long
- * @cp: The start of the string
- * @endp: A pointer to the end of the parsed string will be placed here
- * @base: The number base to use
- */
-long long simple_strtoll(const char *cp,const char **endp,unsigned int base)
-{
-    if(*cp=='-')
-        return -simple_strtoull(cp+1,endp,base);
-    return simple_strtoull(cp,endp,base);
-}
-
 static int skip_atoi(const char **s)
 {
     int i=0;
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -28,6 +28,10 @@ lib-y += strrchr.o
 lib-y += strsep.o
 lib-y += strspn.o
 lib-y += strstr.o
+lib-y += strtol.o
+lib-y += strtoll.o
+lib-y += strtoul.o
+lib-y += strtoull.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
 
--- /dev/null
+++ b/xen/lib/strtol.c
@@ -0,0 +1,28 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/lib.h>
+
+/**
+ * simple_strtol - convert a string to a signed long
+ * @cp: The start of the string
+ * @endp: A pointer to the end of the parsed string will be placed here
+ * @base: The number base to use
+ */
+long simple_strtol(const char *cp, const char **endp, unsigned int base)
+{
+    if ( *cp == '-' )
+        return -simple_strtoul(cp + 1, endp, base);
+    return simple_strtoul(cp, endp, base);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- /dev/null
+++ b/xen/lib/strtoll.c
@@ -0,0 +1,28 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/lib.h>
+
+/**
+ * simple_strtoll - convert a string to a signed long long
+ * @cp: The start of the string
+ * @endp: A pointer to the end of the parsed string will be placed here
+ * @base: The number base to use
+ */
+long long simple_strtoll(const char *cp, const char **endp, unsigned int base)
+{
+    if ( *cp == '-' )
+        return -simple_strtoull(cp + 1, endp, base);
+    return simple_strtoull(cp, endp, base);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- /dev/null
+++ b/xen/lib/strtoul.c
@@ -0,0 +1,61 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/ctype.h>
+#include <xen/lib.h>
+
+/**
+ * simple_strtoul - convert a string to an unsigned long
+ * @cp: The start of the string
+ * @endp: A pointer to the end of the parsed string will be placed here
+ * @base: The number base to use
+ */
+unsigned long simple_strtoul(
+    const char *cp, const char **endp, unsigned int base)
+{
+    unsigned long result = 0, value;
+
+    if ( !base )
+    {
+        base = 10;
+        if ( *cp == '0' )
+        {
+            base = 8;
+            cp++;
+            if ( (toupper(*cp) == 'X') && isxdigit(cp[1]) )
+            {
+                cp++;
+                base = 16;
+            }
+        }
+    }
+    else if ( base == 16 )
+    {
+        if ( cp[0] == '0' && toupper(cp[1]) == 'X' )
+            cp += 2;
+    }
+
+    while ( isxdigit(*cp) &&
+            (value = isdigit(*cp) ? *cp - '0'
+                                  : toupper(*cp) - 'A' + 10) < base )
+    {
+        result = result * base + value;
+        cp++;
+    }
+
+    if ( endp )
+        *endp = cp;
+
+    return result;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- /dev/null
+++ b/xen/lib/strtoull.c
@@ -0,0 +1,62 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/ctype.h>
+#include <xen/lib.h>
+
+/**
+ * simple_strtoull - convert a string to an unsigned long long
+ * @cp: The start of the string
+ * @endp: A pointer to the end of the parsed string will be placed here
+ * @base: The number base to use
+ */
+unsigned long long simple_strtoull(
+    const char *cp, const char **endp, unsigned int base)
+{
+    unsigned long long result = 0, value;
+
+    if ( !base )
+    {
+        base = 10;
+        if ( *cp == '0' )
+        {
+            base = 8;
+            cp++;
+            if ( (toupper(*cp) == 'X') && isxdigit(cp[1]) )
+            {
+                cp++;
+                base = 16;
+            }
+        }
+    }
+    else if ( base == 16 )
+    {
+        if ( cp[0] == '0' && toupper(cp[1]) == 'X' )
+            cp += 2;
+    }
+
+    while ( isxdigit(*cp) &&
+            (value = isdigit(*cp) ? *cp - '0'
+                                  : (islower(*cp) ? toupper(*cp)
+                                                  : *cp) - 'A' + 10) < base )
+    {
+        result = result * base + value;
+        cp++;
+    }
+
+    if ( endp )
+        *endp = cp;
+
+    return result;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */

