Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB87843E7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 16:22:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588501.920014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSGy-0001nG-To; Tue, 22 Aug 2023 14:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588501.920014; Tue, 22 Aug 2023 14:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYSGy-0001kL-QY; Tue, 22 Aug 2023 14:22:20 +0000
Received: by outflank-mailman (input) for mailman id 588501;
 Tue, 22 Aug 2023 14:22:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYSGx-0001kF-Rw
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 14:22:19 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe16::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c13b829-40f7-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 16:22:17 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB9173.eurprd04.prod.outlook.com (2603:10a6:20b:448::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 14:22:15 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 14:22:15 +0000
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
X-Inumbo-ID: 4c13b829-40f7-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zd8Pgc3uY9NNXKgi8RD10kk7N6ZMztU9HQgXz2mwR6HDxwYB7ESx2teAVt2b8dzSnUIpj8ZhvQJZVzXJjjjNN+L+07+ngeMrVfk8xtyiiNVj5I78rqVpIu7aiVIfE0dlz08IdzvCu5283FqJMAv4IvwtwwVlMVV56Wxa83zI6Cgi68ZPhKJbLstxKGWIpsJF2RN8BuBXNcJ+WYzEHaFObbfk6R8w7YlEbTR07do28p7ZXYTOESS/OS1oyqEGBZglagYlsGPv6QWkkkhSJ7Nvo6VNIUS1ndkoY5fUYzazHhie50XWf5IXz80Bv2GMz4x58zdizEMYeKO6WVtG0kElYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rimVZimHKKy59YK9PiaDDDNC//LNm9xS2QFG7NPHwU=;
 b=faiYWhANPWU0utOfEXi8x5uz4fHwRx05neKQfF9rlETsth4isX2XrfiJr4LYOpKcM7pMIoYntdkKH+REea+Rop1ZHAJWsnHct9zJHXrsHpTLNRBawrkRN2GVLEoqf7PUn8V2KAFRpjep8qjjQoCu4kHOFwFomFMfOJNnNadd3hcl4n1nu8v7F0tQTgy8GymyjNlb1bjTll12WyBlVb2ZiDuLxgSd23Ecxl87HbgHllNBAl9olYFmBSNlnR7bchsums9q9YIPo1dtPxtZ1ebxqijrXvtWeQ4eSkWsRNR3aVhSNen4mq+vTsS1UqIUXgpGI0qyEVTwZcLlNW5XmDG9qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rimVZimHKKy59YK9PiaDDDNC//LNm9xS2QFG7NPHwU=;
 b=TPgesFTcspFMXxQ710a1NMJFoUt1xJJLtK1A/zG0bRveXvw9mKsUqH6/gW8lYB9K/nrZB78ieNPOwRV8quQJ65Jvw/zE1Jb9V/1gJQvt5JDgZJqkf56+68IkobeVuYpBnVd53i5Ywv68n7/4Z7EOC/5lzKE0RaSiBuybDHkXzi5xYrFdB6rl7v0L6Qzk0604T2L9JR1qKeTDFuGevtjtxC6fI6j/RgDrmvTWxrGIxuz7j1rMSyY8V0POgBhNqx2c1yxyYTK4+9mEiYgPorC8YSg5r/lhuwA1BbONiljxn6nsK6TcDqnSShKLzDVdlw5HcAu8BzzqXIQAu5b2Hz6NFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec9ee16b-71d8-9142-a314-0e782b481bef@suse.com>
Date: Tue, 22 Aug 2023 16:22:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/AMD: extend Zenbleed check to models "good" ucode isn't
 known for
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0236.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::8) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB9173:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd17076-c47e-437d-0ac5-08dba31b2edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IAjy8O00gypVvvBproqBMETwq6TkJdOCT9M+N8ECmSYO8doCKktSXb/Myf3u1b+OW2ZmhcvvktqaEWljAGLx0Vb8FjQkF4px7YiWK57T63r5nL6Z5KicnRQHJyUq1CqKCo85TaArvjhBiiktPvv4URtgTd2psEAZdWGKFlz0agtwoM2XV2y8t5CW7t/26VpxZiOR8zsppz4C2ZvrK5KIJ2Cbg91UZvqzRFPVbN9StI/viu88OM+fh8MxAU0dHnSX3lc+v+Y8vYp/vYCBL/Iqsh8gQ4Rv01dYLol2LglABcL6UZZj3EKqEBSN5re4TT5sRxHqJ1+MvzL1KxJZiXKTW6OQ0R2dTp4DKKBN6lILg66pP7hyORVUbKTtVtSlH18voR2yN9h4E3Q03md1u1yRrG0wFuvomucCh8UKGbWpXHS1N+A+uR4P5sd3l/jYueUk/yXjjvulgADZUw2Z9BKrNsQWDNr4NRzi7x0IHuOD4rjzCpP6KDmVMxJxDe3P7X9wkAbO3WdYbtm0LOKA3R67SmkNZJ8uY/iu8UjX8qIy6ehehZQTZQelLdlBewkQdzjfoGtF/RkShyTN2CvHeCcQoPi4z5IgIruflZpOpJspFG6Q3N1HBYzyT9rTJ2GCwq2HpcgUcv6Kf2u9q4rzy5ymvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(54906003)(6916009)(66476007)(66556008)(6512007)(316002)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(6486002)(6506007)(4744005)(2906002)(31686004)(31696002)(86362001)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azFwREorUzd5MnI0bUJ5QlhVc2ZuZmwvY2xLV2hsUTlMZUtkN2ErK3pSaWZ4?=
 =?utf-8?B?SW55b0ZvV1Jzb3ozbzlROWZsbm1BcGxWYmhXelRrcFNVZmd3YTQ2cW9mNFdv?=
 =?utf-8?B?MVp3MEVTckZvMGhud0x2UjVPejZSZm1LZjA0UGduRDJSSzhEWlRUL2ZJQzdq?=
 =?utf-8?B?TmN6amFSWEhhY01lWWlCYkx1bE5US3RSeTlqc0tXUmZZeTVpbE1aVkVpaXB2?=
 =?utf-8?B?THFDT3ZvejhoTGNuWVltcnhncFpaMW9BOThYZkdJcU9vNEJyTC9JZk94aWNa?=
 =?utf-8?B?MWZZS25Zai9RZjZwQUhVOHVLb29tSTM1WElPYS9udVZFSStzZW0zckJ4NHcx?=
 =?utf-8?B?a1pHdFZpdHB2RmQzbGJWRlJkRDNZNGh3QXN3dnQ5SXNxQXNpY3NsazluZm4z?=
 =?utf-8?B?dXNZU2pNYzZXQmRFY3NjYk1KTHlYcnpuaEpNdTZVVXZnMW01V3dPWmFmc1Nj?=
 =?utf-8?B?aVlGQ3lVVDVaamc4WGNVT2R6NkZMS0JIdDFMSm9ocHRGNjg3K01aNEVTMElP?=
 =?utf-8?B?Wm5OVWRsUEF3VW8rR0lhZjg5NnZhUE9KcnBRbG0wYTl1K3NNdTdjdGJFdExl?=
 =?utf-8?B?emVoc0crNlhvNHRLRXdpZ2dXRkdSMXd1YmxMTXFDK21RaDJIM1pBanpmYzFE?=
 =?utf-8?B?NlFKSEJReStSeEh6QXlBeDZVL1NBcVdyOXpZcy91SFJReWxHOTFjZGI4ZXh0?=
 =?utf-8?B?ZW5RSWpYOENnNnQxRlhjYkUybVEyZHgvSW15U3F2UmxOKy9MQjkwTkdtckM3?=
 =?utf-8?B?NjNMZ292ZW9VdE12NVRIY3VqUUttb1kvTUlXRWtjTFRyaG1TSG50MmIvN1BC?=
 =?utf-8?B?ZWVocC9kSU9DbXZyOUZ0L3kwcjFyNTJSVHpsQWRjb1BaNmJxWkJlbmpQNlF1?=
 =?utf-8?B?emVFeUUxdnVzRDRCYUlnWHNmeUcwSmVXMGpsV05xRVd1UlRHVUxvZkVmUTZw?=
 =?utf-8?B?L1VSK2ZUYUhpbWUzSURGUnJNb3JNanpJSFcyMzR2MXlKbk5nUms5ajB5RWJM?=
 =?utf-8?B?MVJtZzZ1RS9zYlp1SEFrYjZERlpQRE1oNm43QXdLTzNvOC9iTTc2c0JHM0xR?=
 =?utf-8?B?RGlCeW5wK3V6Y0NJeTMyckxLdkM2OGpQV1N0UnhGOHE4WFIyckpzREozVUQr?=
 =?utf-8?B?WG5JemJTeS9MU2R1ZW5ORnFEb0d3a2M4Z0lNa0xRb0JQQVJUN3BGRHorQUFH?=
 =?utf-8?B?aDlyL2I1TjJqRGNVZDB6aENTeGpINW80NHp4Q1pIUlNUNHltNzdLVGNkRXFJ?=
 =?utf-8?B?WnV6VXN0YXQ5bFVRQ2dYa1p4TENpVzBnaWIyS1FQRGI1dFIrd0dDRTBxeFZo?=
 =?utf-8?B?cjRycUwwNmlQcXg3MXppRzdFRXg0alNVbVM3bVZ3WGx1SzQ3YzZuYnJZYlVL?=
 =?utf-8?B?d2JQREFJeCt0YmxHRGxUbllKSFRtTXNKMy9OSVZTdHVHNDNTWTQ0NmxTcWd4?=
 =?utf-8?B?M3F5endWb1F2d2dMenNlVm5uK2pxMmhCRW5oVVFQODNoeWhHSWxzYitOYW5G?=
 =?utf-8?B?VEVBQmpNdDIvZUhNT0FEbzRmcXJ5bTUrRnpUUHMwd2gvS0xmZnQ0QVNIUk01?=
 =?utf-8?B?WXVrZ2h0eWhVMFh6UDBoRUZaNjBFWWNFTWhQa1hadTQ2QWpsajc5aEV2RnhN?=
 =?utf-8?B?d2R0dkxRSjRCMVVVRWNlL1dtcENDR1hncFRISVBlR3pYcGNRdUxZS1FSSzhp?=
 =?utf-8?B?RjB6MW9TUFZMTnV5eEk3bDlnWHRheW9HM2ZPZFVxWWtiWXo3aVpqSjF6ZmlV?=
 =?utf-8?B?K0Flc2VKYXlKMzZBMDZtdCttNlcyWEVJb3g4UWJzZUQ3SjZ3ZC84SjBKLyt0?=
 =?utf-8?B?YTA1REV0STBlakNFY0JycGsvQVZGL0NUUU9DT0tMaGVXazhjZ0k5b0FvMFVO?=
 =?utf-8?B?TUJuVWhPbSsyUUxtOTFaUHRGUEl6V1F3TFcyaXJTVkZkSmdOVzJWM0ZQeDQv?=
 =?utf-8?B?SFFDSzh3K1lTN1cyeUpDaUNEcnVuMW1vRG1DWjlMcHJES0xrdm1mRWhjT1BH?=
 =?utf-8?B?b0VVNWFaeUhhckl6aE8vdE1jaHN1VWZlU0dUQ3Erb3ZwTUxqTEFyeVZCVUlX?=
 =?utf-8?B?UEFGaUFxSFVQbWE0ZmFLUERZbEl3RW9GTUw1bkJ5VUUrUW55Z0pzZmhyR3Az?=
 =?utf-8?Q?BMox9ZFnOIIwRYdqfQutitdjC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd17076-c47e-437d-0ac5-08dba31b2edb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 14:22:14.9696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3PuW72gXQugy/OTz4epEqxYh3ATr0ohgowNFobeWiBOZLPPvR4JtcdvEhqLT8AShyiIS95KHGTckmeyB/YllQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9173

Reportedly the AMD Custom APU 0405 found on SteamDeck, models 0x90 and
0x91, (quoting the respective Linux commit) is similarly affected. Put
another instance of our Zen1 vs Zen2 distinction checks in
amd_check_zenbleed(), forcing use of the chickenbit irrespective of
ucode version (building upon real hardware never surfacing a version of
0xffffffff).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -936,10 +936,14 @@ void amd_check_zenbleed(void)
 	case 0xa0 ... 0xaf: good_rev = 0x08a00008; break;
 	default:
 		/*
-		 * With the Fam17h check above, parts getting here are Zen1.
-		 * They're not affected.
+		 * With the Fam17h check above, most parts getting here are
+		 * Zen1.  They're not affected.  Assume Zen2 ones making it
+		 * here are affected regardless of microcode version.
 		 */
-		return;
+		if (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
+			return;
+		good_rev = ~0u;
+		break;
 	}
 
 	rdmsrl(MSR_AMD64_DE_CFG, val);

