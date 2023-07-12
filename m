Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4B0750861
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 14:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562455.879128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZ3G-0003Rs-DX; Wed, 12 Jul 2023 12:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562455.879128; Wed, 12 Jul 2023 12:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZ3G-0003Pc-AT; Wed, 12 Jul 2023 12:34:38 +0000
Received: by outflank-mailman (input) for mailman id 562455;
 Wed, 12 Jul 2023 12:34:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJZ3E-0003Ju-G5
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 12:34:36 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7597ead6-20b0-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 14:34:35 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS4PR04MB9292.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 12:34:33 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 12:34:33 +0000
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
X-Inumbo-ID: 7597ead6-20b0-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X18hHrRz4hEnVPvdts88BmNXw6De0Xek5EPFjYXGgEmNMNH7syP/ogRTi++6T24r0uXn9T0gtxaJbS0KPddbFhr2psW/S3cIhSw2FST3uLBDDyA3O2jzxHj2VwPeO+K9AThibKruD26HBkMphkfPAQ36qolXBG5MJR7RFpRkfxKJNayJapOP7s88WLQYaRxdiO1XZrfBtVQd2Ab+xKYQVQVyjrtqHbano1q/0GPkClDTOKbpKE5hOG90p89o5ZZ1+7nzmBcWL8qyzJ71s0ZxAIUxOXU9LLG2wsJl9dCgcP03+m3+0kIkIqXXU/F4ShwlhaT27SDf9t55pgPLP44g9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSfHTrJ7pOa2oeWcPF+TfLLO+C/+vFOck5rOH+Ofwek=;
 b=EJWj3UTh9LnXveqOOW9EPCbFXXrMf2jGIK2QStWjPsM038Oc3WyMMwEsoVI2aJektL/u3e5CR9lEDY5tHOX2da9L4sZNwsMIA+1erP1vg9PD1XuX2t9iQUU0UUqHXFNXRjX/hb0Ll8JLpMp8em0vZfM5TVz6oGoDDNcijUYMMbCM6YN4c/w3a50u/LIimDW9iA7iZ0FUQvHSm43LORHxozxeTG8HI8Adm6amcLiG4kaWTMl0YCU0bwd887oiArStybk9fPYdYv9sffTfwGvfOl1ID6knat3LklQUdjBYL01tdEpyZaGTixrMNYq3GUaN1cF6aS2dgKXi6Z1DZd5AXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSfHTrJ7pOa2oeWcPF+TfLLO+C/+vFOck5rOH+Ofwek=;
 b=u9y6mRJaK1MhwR4OxHxvYBFhesi6YY03g9dIs2wyAJhfoJsVOW1VuLKGUna8mBDiskkDk4mrfFLlqCkXG7PE3Bm9ixX6OUioWW9pEywFfIbGZ5gMwEDn5T/8wTGvX7yqQfMKMiWZD6kIFlvw50P1E0WCpxxA5Wjka5Gbdl9E6rS8eU+nu45wMD0UhDJ/WDW+WAaOADV8XjxsPJch8xkYC3g7vQ2OM4KgO6XbcEEKocJr6+yoiNVcbAHZj3RJEeRR7sYTUcFQTcb5JIWq2z2ZWeikE5VnWgNx9N5NedZ1ecaLIy1AmbGV5ed9EJcmwTj5T42if5cIU0Vh1xsDFetyrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e1cea22-dde5-c723-5ebb-78a54b128b56@suse.com>
Date: Wed, 12 Jul 2023 14:34:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH 2/3] x86: use POPCNT for hweight<N>() when available
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
In-Reply-To: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::18) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS4PR04MB9292:EE_
X-MS-Office365-Filtering-Correlation-Id: e43d1a94-cdee-4255-5458-08db82d45861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RP3OD1sCL//X8rGouwER+qrjCXd41eCylQBCzYMYBFXUmuezb77V99wOCxSXRf4pZP6BukJcL06Aih4tG2YTMZ1ldo5GqEfpmnt0ZBsvgz8CbdzQCEoYnIcziztUsRs7kVDBzW9AWNx1BjQqUvb6lSFJAJ9p/XgJbJeFcuywyRweElE6F7cW8BOkW1RR/YoEmKhFvzbsn3+hZK0oDIQoJfqfWUmzeS6xQqvfEQGSIn30zsh9TtdmuYn/+LtRAeWp5RQl/p36R4nUULjFb8b+E749Ugya1S/bHHkp5UOzZ6wcY2xrOZKZhU7PF+qeudhC93ivZhSRMRniiga8KM+fAUgsQAZZCedMCjQnBPkDem4VjfHedhkoQpvXJnba/+q2UDJyjTACdNd9ZRsCpOs8IhWNp2qryMzdWD/HC2nlYkiuDdCc/Gme/kDFzcd/9YxcfnWfPWlXCm9jUsem9UyEt5YtPFyf+occ2aZpIF5WemzfBkUpNsK9L+EEdHQAY3MWKnbjc8h/AjdxJLicvFtoNURTIRffuir1uvKwsBEy71Bk+Cz78IhOrz5yFzv7XQL0h/WtMpmzrPN2JvmJ0UZjp/fNytxVUsO3DJ+sqhk3G5WXhlbh/CfpxJil/59PRfPoqVz04OvdXwMDiBrIRR3ZMVArWWruvRcDsC/9iYqfrYXD9LyucTaXIm+kju8ckUv8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199021)(2616005)(2906002)(66556008)(6486002)(66476007)(4326008)(316002)(66946007)(54906003)(6916009)(478600001)(26005)(8676002)(186003)(6512007)(5660300002)(6506007)(41300700001)(8936002)(38100700002)(86362001)(36756003)(31696002)(31686004)(16393002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkxHVE5EalZHLytsZDVXMzBGNlJkdkFha0VWTEpmVXlHanc4d0dMTWVBbEFH?=
 =?utf-8?B?V2E2bjRHbW80a3NBTUlMcVJoTVB0NkNYcmVPSGgrY3NwRDNhZFBnbG9icXpF?=
 =?utf-8?B?YzRUZXBubE1UbGhFVm1YU2V5VVBqdHY4ZWRzd042eW94WkNSZHJkSjlMbGJY?=
 =?utf-8?B?UjROT2luNXZuU3h3TVhUcmxhMjlQdTl4amllYVBMSWIyTUttdDBRdnBYY1FU?=
 =?utf-8?B?QlpWeU92QURNOE9GMXNzRXM3S2JaTCt2RUVMRytmMjdiZk14dEhpZWc3eHpZ?=
 =?utf-8?B?ZitLNzk2VFp1SEh4MXIrOGMwN0E1VmhaSjFFSUdwR3VuUGlTalhkTDRhQzJr?=
 =?utf-8?B?OHl5RTJXWXI2dXU4aitNaS83VVltdmdDZUFZVmpuUG9KWGpIWDV3d2orQmp2?=
 =?utf-8?B?R1M5bEI4SUVxakdXc0g4bDlIUDdTajVRTVl0amo3NEVJelY0NTluQUc0T0VO?=
 =?utf-8?B?UWh2eC9nUjdYc3BWUXlQbFJDZ0JRd1NUUWd3di9tekUyTzJXbVMwK3EzODJF?=
 =?utf-8?B?UUZOSzBKcVRaY0doVnc2Q2cyTG1vMTNvcEw4eHlRZlpIVkptdC9ndWZHU0xX?=
 =?utf-8?B?YTRpYUN4UVpnRGEwaTJ4WjNBNVltYTZXT0paR0ZhZzB4Q28rOFVUbU5EZVpj?=
 =?utf-8?B?VHFPNm9KVW9EVGhaNk9mblUwL3BPSERFL3ZrcmdCOGVlbjRPRU94ZitRWlpL?=
 =?utf-8?B?T3NwNVVrcWZLQjU3TjhEMUlKMWl5UkpGaURSTnYxS1E4NWZJK0ZKMXBkSjUw?=
 =?utf-8?B?ZTlMYkdzN3NBYTlFRGJ2b1JOWUlHWHhRdUlQM2RlR20rRktKcFBZMVRhWEhG?=
 =?utf-8?B?YkRlZHNUcEJ4Z3B1T293a0N0NUxYelhldHdhM2UyeDgzQ1UycDVoQ1ZUVSsw?=
 =?utf-8?B?Qi9udnlRa2s2dVkvV0MvWnIzYmM1WFFNY1ZqdUhZYlFHTG5BUWd5dGNtcC9V?=
 =?utf-8?B?bW5tRnY0NWdWTkRhc201VzBjVjFUQ05wQ2pjS3A1K3pTeCtxL2FRWHpCQUl5?=
 =?utf-8?B?QUhsakZoRW16bTl4MWhWNkgvMW5rZUt0MUhqaUdWTXBkQnVKZkVtQndQOVRC?=
 =?utf-8?B?Y3hScWVHY0Jia2pHVzZwTnVMYzY2aGRIZVpuWFg3VTRFaGwyQ2JJZzN3UUY0?=
 =?utf-8?B?V3FDdlhmbGp0MWZicDdtcVg4V3NJdTdrNmxtdzJmbHh2c1FOVEk1bFVMTTNR?=
 =?utf-8?B?MUdobmVWSmttaThVeTNQT3RmNFZjeXlIVVZIei9kM1BCbkwvL3BpcWh2WWQ2?=
 =?utf-8?B?bXlXT0tkK3dRYVJOR0ZwVzl0dlZVOHNvV3R3aTl6dUtsM3NESmVDUmsxaDBW?=
 =?utf-8?B?WTB5Q2ZHU3BLN2tyN0dhR0UrU1hYOUtYcEEwSEtrTUNobENEN29INWtiZk1X?=
 =?utf-8?B?MjZJNWJpNW9GQjZFenJCd2xQcGt0UjR0eTBhYVNicDFLbEQxMFpoWG5tbFJV?=
 =?utf-8?B?M0hrQ3pYMHZyYW5IWER5eTlYalJYMlIyNjB1Sk9pVHNpUHlVbms5MGFsWWdv?=
 =?utf-8?B?ekJrbHRVb0pxUVBUNFVDSVZqZFMyekVVYmFLdDBPc2ZDRnB6Z2dyc0UxRmdj?=
 =?utf-8?B?UGhTSko5NitHYnBMRkNXeWtFTk15bDA2VTdsWFlZQ3FVNUV3OVUwSm84Qnpo?=
 =?utf-8?B?RlJIcEJWN3NZakxpZi9GNkZZMVZEc1VRVkwybVU1VlM2K29SZzdCQlovdSti?=
 =?utf-8?B?djFHMEpVbXFCYkdCeHlWbDQxY1FJcS9QbjdzcXkybWpTLzA0T3NKMGFaMll5?=
 =?utf-8?B?aDR5eDd6R1ZqRUNGTVBZQU9wU2U3N0pPbFpEUDVIMEZCZ01teTVuRjFyZ0Nj?=
 =?utf-8?B?ckNqNk9COCtiSXkxZTd6aUdiOXR0dnZ5bCs1eDloVllaMEhSeGdmb2ZRUThq?=
 =?utf-8?B?RXFjTVJwQWV6Q0xHNHorQnJUclFXVzdaMUZ5ZDJ2SjhRUnB5S3BpSld1Um56?=
 =?utf-8?B?ZEZVc0xna0NTcU5JUXpJR0cwOGtPRGgrd29WOFgrQldEOGpwS01nR3BJWnJS?=
 =?utf-8?B?akxsOTdFV2dhYmxlQkFkNmx3Yzk0aGhOZ0NNQ2tkWXNBdzBZZ0FwZmRBTjMy?=
 =?utf-8?B?ZGUvRCtZZXRCU0VsdU1sUVVJK3VzRWZxaXVkOHNMZWFBYmdWM3Njd1IvK1pV?=
 =?utf-8?Q?XgmDW6gODvyAdVNyWn2p4WCQY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e43d1a94-cdee-4255-5458-08db82d45861
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 12:34:33.1398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhA+nsuu82yVaV/GcnRpON0jsMBakbS3M/7Ei9Kf8iCsyRlowvKCctWsEZ1Fz/nPy9tZ25U1DiTIAiGFpSKmzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9292

This is faster than using the software implementation, and the insn is
available on all half-way recent hardware. Use the respective compiler
builtins when available.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Re-do in a much simpler manner, without alternatives patching.
v2: Also suppress UB sanitizer instrumentation. Reduce macroization in
    hweight.c. Exclude clang builds.

--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -475,9 +475,16 @@ static inline int fls(unsigned int x)
  *
  * The Hamming Weight of a number is the total number of bits set in it.
  */
+#ifdef __POPCNT__
+#define hweight64(x) __builtin_popcountll(x)
+#define hweight32(x) __builtin_popcount(x)
+#define hweight16(x) __builtin_popcount((uint16_t)(x))
+#define hweight8(x)  __builtin_popcount((uint8_t)(x))
+#else
 #define hweight64(x) generic_hweight64(x)
 #define hweight32(x) generic_hweight32(x)
 #define hweight16(x) generic_hweight16(x)
 #define hweight8(x) generic_hweight8(x)
+#endif
 
 #endif /* _X86_BITOPS_H */


