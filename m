Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E46D16A91B7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 08:30:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505569.778410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXzrT-0004Zr-JH; Fri, 03 Mar 2023 07:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505569.778410; Fri, 03 Mar 2023 07:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXzrT-0004Wu-GC; Fri, 03 Mar 2023 07:29:51 +0000
Received: by outflank-mailman (input) for mailman id 505569;
 Fri, 03 Mar 2023 07:29:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXzrS-0004Wo-EN
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 07:29:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cda6b31-b995-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 08:29:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8221.eurprd04.prod.outlook.com (2603:10a6:102:1cd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21; Fri, 3 Mar
 2023 07:29:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 07:29:45 +0000
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
X-Inumbo-ID: 2cda6b31-b995-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPAWn+oFHPNXIsXfY9oMdCMl59IoWF0UC4p9RJ2NZ8ig+4UFsmTfTgFYdlJ+170GyzmFXAF/CO6++LQdiDLv8Sy8SWxTSxX6Dkpa1Q+XQ7HN03GKHC0vsqJI3YXjTcEXLKTP+LoAmAjH00LHVr43fqt6Z+x6B86YOYXOmsSMyOavPJ8yy81vFLLrL4x4eYSVvCHN/f4vU7VVFtsfuV12vXrwq9bMTQp5/n9Skj7rOMaZuf0/1Ug9eFcmNgxV4niOrQNASHlgZ6d64nuAfOkaXYxdsIEMqkIwC/JwNrFUC0gc2Mo6VPuqCOTp+xTRRjcp+LAJIfblAEsBoiLvIlc5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKT4JdsglRZPTHEzV39FFFEjDFV50TGZ2NHTLgwHKxc=;
 b=USHIFKiSaxRhPUuELzZ9cPg3/TGrx4cL74Au35bXkQznwaISc+m65dcFop3WhecI8LCD8fUjeotCQwTSY8eGmCsvRtVY4xCuQ78hhZkHZaPn7GdMbEqu5wyOo5zRxQrHtKv/++bfPzdae6fGwP2tY4soUp51x9ll5YOE8yQ4zb5lto1L1P9Zf553mxWTjSOSWm12hO6NwXL+pdTlA0kaMlK1/MbMGV7zlmh9bFgYveEmNDCdgARyqRKUacwc9KBS/TPjyOxVCBGIP/1nAQ9+F1oLXxVcHUGie7zZ+FgEX/sEDJ0yuwL/uHB1aNxAvvNT0ccWkzNeMa/NcuvxeMZZ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKT4JdsglRZPTHEzV39FFFEjDFV50TGZ2NHTLgwHKxc=;
 b=jItbhu8t+gec4QUfuxwTL7DSO62HIoSYqmX8wUmFUEDDXZmrFg44yLaG2QiwV8juzKmss/O8Ba9cRP4StfSuOUVubxL2Ek1LNZncuoRE/D70kBXfS84KfHY0jzJ/Kq7+rmOEsBqWziUK+4mCD14XO3pWDPA/gIKsvYbV2YfolYiJLexe00zDdQBfdIsygdrqtYeKhfaOtX9op14mBQn6exr4PAHopIszxi1ZPDbulnLSlh6XsdmEyAfQkwJp6kDualz0J575u7A+6RZ+iFx7673Y6juJYU4MS9HiOdDnPE102JpR748KOSrheKSFISyDoSo5uvSNYZLjnTcSWfhtkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <072cf7c6-9f43-6507-bf8c-a79ceedf3000@suse.com>
Date: Fri, 3 Mar 2023 08:29:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] bunzip: work around gcc13 warning
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c8ca91-b7e5-441f-9015-08db1bb90ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ScTD4taxUGs7A549VzxfWG8eUiJ5fuhNiuMtpdvTGOYguFBvGaauSLbf9P2N/GO5EzZaqtUL57MAw9mXfr0Fzw0AJk0NZXMN+S9hx9q4A1BthNYEtxlOjdxnLbL5s4AIIQgv0EthaLcvdPwnHVuSSA/LHiiT659JsYqkbGDBk4u/KgcLDq1utysPl8sYlLV1owIrI27DvLm86893DItD6kEuwXNOLMRrSFv6zMzy/xWDMxjfeH+om1Dt+Nu3iHgjhV/08eqpa4fSKSLHfU2f9nOtGqd0REiz2zeftj5uHbq/8I+MLxDITrqo+MD9K6B3Ix3wNu55vSwzsF0jzX0neKfJe0NKN+9jx7F4qhKt2aFpRcsz2+7wkkou1COfdfhvHX3UdlnTAefXjyYVbvIfr8nNxZ5xrJAxA78EgY60u1guKR7t0xwSXFGxSjn2uxEp73+605x0O9aENBNPVr+S2xMW3YTGw78KWpYg1hkbSjDbGLZvFLNp9nRj6vDAInLUZ2AMWhatQUeNe0Da9UvrQuW9zU6RLE3i/gk1pR8baaGJCrB89F4UGZw7p3cHr6gaISNBZ8rbbnj5PFyvbAt/Zo7qf9+IP1RsteMs7gWd+2r+v3XIt24YtlLA57pyviM6/U/mAaOt+3u5QcwaMJ/h4l33BYpdCzpFP/PoaAqxB6p+U2LzZvvBFrrpnkjhrcaIJhVNF0Z+qv43CoZ2zfEjm3I5+oBTm2rX2xzgbOhE2FI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199018)(66556008)(31686004)(5660300002)(8936002)(2906002)(41300700001)(8676002)(6916009)(4326008)(83380400001)(316002)(6486002)(966005)(478600001)(66476007)(66946007)(6506007)(2616005)(31696002)(38100700002)(86362001)(66574015)(6512007)(26005)(36756003)(54906003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHRYYUcwYTBOaVR6WWZkVitpOHVDaFZxNlRuR3ZaNmhiclpRc0dLYjhSSWRZ?=
 =?utf-8?B?ZWc1YzYyUlp6RWtIa1ZSMkYxYTNDUzBUMWJGVVVWODd2Q213MjdESmZLT2JV?=
 =?utf-8?B?UW00REFBM2ZEL01VWkVaa2hoNWVYbVFaWng5REl1eXMweEc4WkdBNEs0cFVr?=
 =?utf-8?B?MGVLQVZPWlZtMDRJV3BRV1c1QnNYVzh0dklXc0lMQlB4eVJqSngzQnUwWkta?=
 =?utf-8?B?MUcvU25yTXU2OHl3ZXY3UWd3Sk5Ybmx6UU8wY2xJSXV1TjdPVU9TSUw4NkFx?=
 =?utf-8?B?RzFLeVA3LzJ1V3BTS3JGS1BTMmhLNmMxMnZSbEZ4SjIxdUowbVZYSUYzTkZQ?=
 =?utf-8?B?VTR2d3Z6SXJoaWNXaFdjTUdwWlZuams1UHZQSDBJRUpXTFpsUi9DeFEzalVH?=
 =?utf-8?B?YW0xOWttYjhnb0JqVGRpL0tMSlhVY25qaGJucHVkUnhGVXVaV0dTRm1GeFYx?=
 =?utf-8?B?SUMyZDNRbmlJTlFSWkVINkJQRFB5RWdVZk9tS3ZxM3NKMDViakFGd25hZnNN?=
 =?utf-8?B?elRzdW1VVE5rSk5JM3JoODlwb1hLY01nRXVwQWVNZDI1NG90OTBQL2kwSW1W?=
 =?utf-8?B?M2Y0dE1aYkFqQW5XajBVT2lzbDNZZ1Q4Z25wQVdId1dSaDNOYWI3SU1RREk2?=
 =?utf-8?B?cnh4aHN1UnBVbE8xWE1PeUZEbE5IU05OWHkrVW5GVVN6U3FEVGI3V0thVUdu?=
 =?utf-8?B?djlJWGpLYyt0Ly9CNmR5N0h6emFDTnZWcWUwUEpDOVVHN1ZkMjdDTmJzeUxC?=
 =?utf-8?B?UHlCVmQyTXkzVm02VHErTUxtVnFVVEE3WTQvWDlKbUl6byt4Q3NiQkxob05s?=
 =?utf-8?B?TCswTnEvMWFtdmFYZnlaTVBLYktOZStnRm9hWVFmSkxUTTE1VklZTlVkZ1h3?=
 =?utf-8?B?eTUyMksxNENkMy9XckVPOTkrYUQzTEtvMGZZaVdxa3pzdHZ2TnVadW5MSGdH?=
 =?utf-8?B?eW9UYnBzMjNxSHRwdDJrbkx3L0hPTC9oWDhQMXZYbUlUVWowYmFWamZ4ajJY?=
 =?utf-8?B?cHFtWTA0WFZTNDl4Y2kzdmNVTlllVWVyejl0dGgxUEJ0MmhNSzQ1VzVEbkdC?=
 =?utf-8?B?TXphZnR2S1FFTEJIaHdFVWtyV2YwUUhMV3Q3c0RweFJISmljZ01sZjBraVNu?=
 =?utf-8?B?ckdmeTZGcW5tKytjR3paUmZnUElwTmxsVkozbmFoM3U1TXp3YlNuS1g0dTcy?=
 =?utf-8?B?UUVWOWRDK24zZUhVR2ErYzFNNFlvREVvZnkzUE8xcWozRGhDdWhjaEhOazdZ?=
 =?utf-8?B?ZWpia1h3UlFQUUtrMEc4eGozUWZISFN3ZHpPRFkvVlR3ZGxucGlYUkNsVWJq?=
 =?utf-8?B?ZnhsVnlKbDloRTdUMVZyVUFWRW1YeVZQcEZvRVZrVWdOVXBKTWJKME1aYnRi?=
 =?utf-8?B?OU1waEUwdHl2QWNzUW8xWEFLcVFBeWs5SFljQ0pDWlg1ekNra3I2YzBBbjJk?=
 =?utf-8?B?UStqR3pGeGtCQWpxSUhEYWl4MGhDeTFqaWFyZ0NSMFFKdVJyeHpxdE50VXBU?=
 =?utf-8?B?bzhaN1JjajlSTXZmbHgwdC9iS1JGVGVsSnZIVStVSkMyNHptYVR0ZjhJVVYy?=
 =?utf-8?B?L3AvYWRhdGpkaTVKcDc4cUFFTTVzc1p3Z05SeDVNbnBLTERIMnk5YzEwSDk0?=
 =?utf-8?B?bHhmU0k0YUk2S3FIN3Fsalc2VEd2Y21ZM2Zkb0Y2MlNWUkdJck9LUGZ6ajM0?=
 =?utf-8?B?dUE0Z3ZMbDBBT2JSdm5oOVRmenI1dHFvQUlwMTAxanE5Q3IxU0s3NlhzMTh3?=
 =?utf-8?B?amoxSmJhdzhlSE1pMDVjTFFSbFJaclV3RW05WHBYUlZLQi9KQVpqMmdXa2JR?=
 =?utf-8?B?SURSNDBnRlJFY0d5K0w4czRQMDBkM25jQUx1c01FLzBybk5rRklSemI3UW9o?=
 =?utf-8?B?MW5qK0FKOWJTcVQ1SFNnZDQ0T1QxVDBQdHF5Z00vSjAvUTF5d3JNTnEzUGx3?=
 =?utf-8?B?VHlGS3VPUXlMbm5UYXhpZGtDa0ZpTGF4Zk5LY0pucnY3Wm5hZUZ1dDE5L085?=
 =?utf-8?B?LzRSbXNDR2dDYUNId20yWUxRS01KRDdpalgycmNuZUN1VkdaR2RNOHM5NmtC?=
 =?utf-8?B?eDNMMzJlYmZqRGtYMGdhRk5rZjJJOGo4UzBGcGd3SmV3Z3hTbDR6dldQZXV3?=
 =?utf-8?Q?GsEpCtq7AAYZXpy7yzHozezOY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c8ca91-b7e5-441f-9015-08db1bb90ff6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 07:29:45.5023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zaAUi3HxWcgeh7zT4k7lfpYfH8qR0N069f8603ZTzcOJXfpVOfLFiY8jGcAhJ407UwJtOkvGu/hLhpAJ0l89Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8221

While provable that length[0] is always initialized (because symCount
cannot be zero), upcoming gcc13 fails to recognize this and warns about
the unconditional use of the value immediately following the loop.

See also https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106511.

Reported-by: Martin Liška <martin.liska@suse.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: We've cloned this code from Linux and the code is unchanged there.
     Therefore the same issue should exist there, and we may better get
     whatever workaround is going to be applied there. But I'm unaware
     of the issue, so far, having been observed in and reported against
     Linux. This may be because they disable the maybe-uninitialized
     warning by default, and they re-enable it only when building with
     W=2.

--- a/xen/common/bunzip2.c
+++ b/xen/common/bunzip2.c
@@ -233,7 +233,7 @@ static int __init get_next_block(struct
 		   becomes negative, so an unsigned inequality catches
 		   it.) */
 		t = get_bits(bd, 5)-1;
-		for (i = 0; i < symCount; i++) {
+		for (length[0] = i = 0; i < symCount; i++) {
 			for (;;) {
 				if (((unsigned)t) > (MAX_HUFCODE_BITS-1))
 					return RETVAL_DATA_ERROR;

