Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457C96BD1AF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 15:04:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510634.788666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcoCs-0000M9-QZ; Thu, 16 Mar 2023 14:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510634.788666; Thu, 16 Mar 2023 14:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcoCs-0000Jt-Mr; Thu, 16 Mar 2023 14:03:50 +0000
Received: by outflank-mailman (input) for mailman id 510634;
 Thu, 16 Mar 2023 14:03:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcoCr-0000Jn-LS
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 14:03:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ed3ad68-c403-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 15:03:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7130.eurprd04.prod.outlook.com (2603:10a6:10:123::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 14:03:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 14:03:44 +0000
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
X-Inumbo-ID: 5ed3ad68-c403-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOsQLgyALbRtjWMw/D5OcB1QGDxv+K9jNBrEwkoqUvTyW9VCdXZTW/DxqGCvGFlByIw54b9LG6Wey+xDHcltdvaaZ/qowx5G5ZkhFIpglgpLUCHrntDZXhRWqkp7kibQ4tZM4HS/Ad2an6f2V+53iM9kq9cC3lj8jHXT5BiN8vcccCsCKtStv1H0y/y1qH3XHWiw620XvRvpC+L9hmpA3c9HOuzI/ySKMrMeLuO/zFTVrN4X1qUwoz9en9DAw4Tvx6tqrJwt/jArvKnG1gujZM9bE7JdczLA+AHBfqdGsc9GTB+pplLvTVFxd+aF7Pt81MHI4WyejGUAiN8eE9UPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2uhJWPbKKDrpppv7FdA/IBSH0epMWBxkyGNEEiYxUA=;
 b=oIZGyw6WFORPGyPvG6m5sdDKwgFjTRNIzvOVg+D1Kv9S31LSdVuhOHGA2cXjiJebsOYbG27MVrWoLdtnOhOLSFdAFqYjiNsekiXlLn1Q02e7kJAeWMUAuw+ShzUJJRwR6UveW3cLk7HJaST/FFFidT16/3sBRtOpYX0Drt6nFA2APa6X340k13tnQKbEYsA60lvQ5Jq79u5DQ4SysKsPq4IYcAoT1N/LN+ITbeUZl11w9+fcooxbAqSjTRYtIIzgpSULpfGEGApEIRtEM3rBk/BseQQSDgPJ9AU15KI5IUG+teTrLr1mW6HBrmu+MbgQD/xZRRcc2rEJGCtz8hy00A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2uhJWPbKKDrpppv7FdA/IBSH0epMWBxkyGNEEiYxUA=;
 b=DrdpfGctG8L7aLgt/Kpu7qnV+Of1yhwFcNT0vhQMwR4azoKr/XNU4todSlE4vUU78RgaDssz6N2OKPSQGLr+g/G5IzEgoEmSjb98pizq/xQ9TIr3iwxSPWGsa1EB1jJFtygd698htXgOf/IOH3ddSo6MUFofoxPm2aDOPNULRe3HeU0UbJHfUxFYjBKoGsgUyA42DULmRm+p9G5sX50mPdQgMCvbLF+MPyjSUk4UZAyw4JptKP2dGUvBfO3GiRGV0GsIPaQ+gVuqFaOyooFasbbfzV3nDYOBY353p3Dvy8eGoymYrmjKAnJlyq++5cdB/mv/0SiYAiYkV+G3c1Nd4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0be85ad4-f0d9-a5c7-e7bc-c546558df835@suse.com>
Date: Thu, 16 Mar 2023 15:03:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
 <ZBMfpnzW4YdqEiA0@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBMfpnzW4YdqEiA0@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: f7d057b5-2e14-4112-857c-08db2627412e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lsq79kkFK6A9O55h1DzfWxnynacNgBFc5SW/LYdld93bACwNBv2AuGvwMR/hPE71LkOgy94N6jlwuPssYEeTj5Vggdrb1ehBel9hspsIq+uxUTB+JviUHOfdxjZ/ARyu2jy+zZBsyHEqd+JRPF2D9hwT6l/JGLm10HQjSeXSpnWAOoxB5zpUW8ORQFfX9RCtHQmiRZPxsBiTP5VK+0F+2T6y7oWu3WSD5H/xrYjeYhabPT34iAuWRT1TsTsOBm7S/gxUklIWphpqBxQwPExAUcI0F2oym0uvgUXh4Ux4l3G8cWuM9MDORy5iheKOSyAo1h4GAGYM1WqJdapDbDpkyIJ1pTsVeLgqne+zynlEC9bJ9U1SUnpuk7dzLRSheHMISq1QcIcGAwPBpDO6iq5xFrqJIg6Z1HTzMu2Ip8cuxNJsa8Gf3voYjlWcv+UUkLHHU5ONVqLKwvplpgH2ee7BVNqjffySEtCxRokF4LoL6ZV+VhXIl2AytfPywUSJWJbNOEGK3+GGKKTSXRSRS3VLQmE6jQ94Lf3VPXcisbCXFsAkxcND2WaH434RL02t0J3ystfVk9uqo7kIYwyG2iqQcOhhnY5OjRd7WXQHu6FHhgHhi3vhyzhrfg2ljkBA2Z1VMiPONADB2nFvP+1Rvg4JPXq7ulAooJ5+Y/y62zy6D7KJjSmG1OVHig5VfsIuFmwMXNcslIIgzoIMPRrp/zRUiPVhtDtICwovlVgn9VE/OJg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(31686004)(41300700001)(8936002)(2906002)(31696002)(38100700002)(86362001)(36756003)(5660300002)(8676002)(478600001)(6916009)(66556008)(6486002)(66946007)(66476007)(4326008)(54906003)(316002)(2616005)(186003)(26005)(83380400001)(53546011)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm1HbTcwUldManRlN1hqNml6TFFrTGJubmRCekwzaFJaWGM5NUdvdmRKTSt6?=
 =?utf-8?B?c2pDUVNwbTlWOUtBTnAvYUhDYlJwV2UxRytzSGhja3d3emZZd0NLQWpma2Jj?=
 =?utf-8?B?SDFDRGpIbHQzS1J2UGVqRUx3ckx6c0VESy9zc1YrRzVEeHNqbThKRUZhQzla?=
 =?utf-8?B?YWdQYW1CS3pvUzNzdlpwVTdncDZWK2NRU01abUdSTGU5Z2pXWFJiQnZ4cmZI?=
 =?utf-8?B?bXF0V25hNnlzOUw1ZUFUcVpOeDE3RmVyYTVuWXRUdFZkK29pYXFndlRoYkRQ?=
 =?utf-8?B?WDZ5ZnlBUzVJTEdjai9CaHZ6eVM5MXBRaGR1NWJiME5aR080WFdDRTBBdDM4?=
 =?utf-8?B?UU02Vkh4QkRzdjRUNE8zd2RxUmlwaytuLy9IN0hFSjBwSy81YWxsMmRFQTdR?=
 =?utf-8?B?SnBudUtTNDAxOVpURkZWbjFjdmhmeWx1cGd5MUUyWW1HU2ZzTnJIcVllMWlw?=
 =?utf-8?B?c21ONnV0UHA1VmhzZFdaUGtpbFcwVlp1bHZIaUdNZzhHMHZia2lNb1czZWdn?=
 =?utf-8?B?WWN0UUt3QzAwbEJCY1BsT0JPcFRXZWNKNCszeU1BdXJvUlpTcTVrSWdBQWR2?=
 =?utf-8?B?OWhFU0MxQlZnQlFIMlpqWGhpbFYvcVdPTUpDSThxZzl2ZFc2MnVUZjlkcU10?=
 =?utf-8?B?OWdUa05Gai9LLzZkazdJeTBFNXVtVHNHMjVSZGFSQ21DbzRMejh5VEd0OTIv?=
 =?utf-8?B?REIrOTM1Q2ZMRzc0b3F1cGNxQzhJcFJRbDUwUGU3TGNxOXU1bCtkR2RDNnY2?=
 =?utf-8?B?TkQ0enhFNXJVS2t4REM0NUp3cVVzUGZ5R0dwbm95L3pGd1ZwY2dJMTkvQ0pi?=
 =?utf-8?B?cUswbzMxeDhva1Z2TmNzeWJQQ2dCanBVOHA1SkFudTJ2N3dreWJoRWwvK3lH?=
 =?utf-8?B?NDN6Qit4MUhTc3lWUHFCVmFtTVVzWVVWSmNUQi91djcwYVVoL2ZaQkpHN3Zu?=
 =?utf-8?B?Yld4dmJ3YTNMRXlLcm8zdWloS2ZKSk00dlNBTCtadncyK1BtNlB3cXFlSFFT?=
 =?utf-8?B?ZjExY25CWjRtQXNyemFPbUVucmFaamRTeTlYVDVpYW84QkdIVWh2RmdmMUFk?=
 =?utf-8?B?NENSWWpCNjVuSGhTUXptdEo2THI5MkZiTTl6eHdLYmVRZm1vMzBtM3c5Q2Ew?=
 =?utf-8?B?NzBWNUV2NmUwUnNYeUFybmRBNWJMaDRZT1NyMVhyWncxOC9LUmJMR2NCK3hj?=
 =?utf-8?B?dlVSSXhLWkw0MWovT1dxTmczdUwzMk9rcTZvSTJVZSt6eXhwektxYUZwYTVw?=
 =?utf-8?B?Tm84UGJVVC9ITnd2WHhKbWlXejJjQWhKVENIZHZvOEJ3UCtGTzhLYnZYQWY1?=
 =?utf-8?B?OVg0QVJ2Z09rejBEbG5STkZEY0dXNHZKS0N3VXA5UEhVZzJmSzdHNi9Hd2xK?=
 =?utf-8?B?b1N6dXp0VkhDQ3pHdUIzTi9pcTVNMWdkZGNuK2NuQmJPN2U3eDMybEc0LzRj?=
 =?utf-8?B?T2QvQWNtOHZkaUs5UlpwOXZmUGZsVW5sSEpCeHRjbG1VWmtycmxNQWJ0M2JC?=
 =?utf-8?B?K1BDa3RROGl3bThWUExRbzZ1bE1lays0bmE5ZVBEdG5acHp2a3dwRUlBU010?=
 =?utf-8?B?amsydlU3amlZaDNwdlVNc2JpTm5rcTc4ZjBTR3pESmJ0a2tBYnBsOEFic0pE?=
 =?utf-8?B?UTlxejRKSXVhTFpRbGNpUitXakNPenU3Z3A3UFB0NmVlNTV1bElURkE4ZHkr?=
 =?utf-8?B?V1hvT2NiZmNIOVF5SExkS2l5SXpvMi9veDRGTWwyZDN2TUlSUElhRmUrTXY0?=
 =?utf-8?B?cDhZdThPeno1ZzF6d0RwVVVDWWt2TFdKM2lQTncvcThPcGV6M1FDTjNNRzdI?=
 =?utf-8?B?bHIwS0N2K2VCUkovRXFQWjBQWXRsMnkvdUpDcmF3V09LOGpXa3B2R21mVDl1?=
 =?utf-8?B?dTBoa0FoMlBJbDJyMkcyQWxHZllKSnViVldCWDZidUxMcnlwMkFCaEdxTjBh?=
 =?utf-8?B?Ym9rZndzRGZlVWQvV3FRU0VuSDk5NFlucldSRzhvTDBhUGwyM3B6U3IrY3Vq?=
 =?utf-8?B?YnVFcERuQWRDNkhRQzR2cSttTzgxL3YyY296MXQxOTdlTWFLQlVIdDYxUlhD?=
 =?utf-8?B?d2E1YnprVXFHd3gwNHVHK0txUzQzRU9HSDBuR2xGdFZGakRpY0dBaXMrZFRB?=
 =?utf-8?Q?B+moXPorq4J5DHa2gimol32LZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d057b5-2e14-4112-857c-08db2627412e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 14:03:44.5329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwjZpGsjc4ADszw7u5u+9No9x+Nr4W729PAKFI1MO+gbiWUMtFgJ/mNpvFDRrgBpWwrY6CGJ+iQ3GtMOntm7og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7130

On 16.03.2023 14:54, Roger Pau Monné wrote:
> On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
>> --- /dev/null
>> +++ b/xen/include/xen/refcnt.h
>> @@ -0,0 +1,59 @@
> 
> This seems to be missing some kind of license, can we have an SPDX tag
> at least?

Not "at least", but strictly that way for any new code. Patches to convert
various existing code to SPDX are already pending iirc.

>> +#ifndef __XEN_REFCNT_H__
>> +#define __XEN_REFCNT_H__
>> +
>> +#include <asm/atomic.h>
>> +#include <asm/bug.h>
>> +
>> +#define REFCNT_SATURATED (INT_MIN / 2)
>> +
>> +typedef struct {
>> +    atomic_t refcnt;
>> +} refcnt_t;
>> +
>> +static inline void refcnt_init(refcnt_t *refcnt)
>> +{
>> +    atomic_set(&refcnt->refcnt, 1);
>> +}
>> +
>> +static inline int refcnt_read(refcnt_t *refcnt)
> 
> const.
> 
>> +{
>> +    return atomic_read(&refcnt->refcnt);
>> +}
>> +
>> +static inline void refcnt_get(refcnt_t *refcnt)
>> +{
>> +    int old = atomic_add_unless(&refcnt->refcnt, 1, 0);
>> +
>> +    if ( unlikely(old < 0) || unlikely (old + 1 < 0) )
>                                          ^ extra space
> 
> You want a single unlikely for both conditions.

Are you sure? My experience was generally the other way around: likely()
and unlikely() become ineffectual as soon as the compiler needs more
than one branch for the inner construct (ie generally for and && or ||).

Jan

