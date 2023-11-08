Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976957E5289
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 10:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629231.981272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0ehZ-0005w1-7f; Wed, 08 Nov 2023 09:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629231.981272; Wed, 08 Nov 2023 09:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0ehZ-0005tW-4y; Wed, 08 Nov 2023 09:18:21 +0000
Received: by outflank-mailman (input) for mailman id 629231;
 Wed, 08 Nov 2023 09:18:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r0ehX-0005tQ-SC
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 09:18:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7d00::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bec06b34-7e17-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 10:18:14 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7628.eurprd04.prod.outlook.com (2603:10a6:10:204::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.17; Wed, 8 Nov
 2023 09:18:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 09:18:11 +0000
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
X-Inumbo-ID: bec06b34-7e17-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yx+74Cjne5ccth2czdxOp/H7x0Cf0c3HcsJhs2ojXmhHXerwOeUbTeyBegWS/rYitYEYLci22IET01Ceckn87LoihVFyiUQ/cCCNM5YmFptckuke7L4/NAhs4MVt6ZulV/TbiAnf8Pt1p10tmUdrmGBPfMpOuYqKHoAbYINytpF8rDxczSIM/ag+dI3gJnAbTsLUIvtqfUUmYGsXZue0XLyCHtonHSqQs08QnScJTZNiLz4T+P1bZfPCrxyBDG2zkPZ/kdPosw64Uo+n5+nNFHxxNWisxPHJXDBM3xWEx89iZjpXnt3Qmbxkg8rtpVSbOyf0H095rFYDpccJOmKD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+h0nNtcvewlwEZ9EgqswuiBSdIROxESPV1pN0MvnWl8=;
 b=Wg5fMc4aSWAJ5XQXI7P9eNsImUB+h1jUgudHvBAIXw+k9VQwbXNG8/NR7DY3s/Vr49yaqRqtUzYYY5pyCDQqKnfqEs5C27VN79WNqT+ZgFchB8/+cO0qncd9G6RAwBwesyFwCkKA2ZTe9g14smfB4gPQGmRtYP+dPf+YJDEIV1dSzYLO3BfVQKYJLMEdLJpvPbH2+HBYCrTAdb2UQgzNYYB/V51iXENS5pHHJN7Vruiygf+6WI07dW72NAYvylJQPe/Po7tQI/R57l5c8bxSuKyNMiNjTwZHANbNF/Q5plldVuvYT47kdWEaGtxO2fkbJ4ypftoSFqb+OT1wCLKWuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h0nNtcvewlwEZ9EgqswuiBSdIROxESPV1pN0MvnWl8=;
 b=4MEP+F16Ji2WN8u5Ljn31RI/BM02MnV7sOjxZHK9ipqcsltuYWHROpvFyHpwhKSB/oKW2/ojpksAAyFF+i28+UrVqXnNb1CMAoN4hp3esLYtedZDkgJJY+ux+lsF19IqVIG2JYPqubFZSTk/fJEGeGAzfjmduOe6rj7R91nZExf+6kUEsX/5+5r35EU3fRAVOvRLxRGrEXG7LdJNZjpJtAjNeuJTFsJ/Vxui8PAuL5yYALQIDVkXGahslDDs7ITa9JHGPVi+NqSE6pPZKOtf2qm7Sxvlz7xfhFqRfXAhdzXWGivq9eaZ1Alex/Fefu/Z+MpIAGtPf06KFX8jOXsm9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd75ee81-3ae2-f776-416d-1f2e9690e3bc@suse.com>
Date: Wed, 8 Nov 2023 10:18:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v3] xen/string: address violations of MISRA C:2012
 Rules 8.2 and 8.3
To: Federico Serafini <federico.serafini@bugseng.com>
References: <d28ea15aa8d36622548b433d5fb6f19dd521bdfb.1699369270.git.federico.serafini@bugseng.com>
 <3e94cfaf-7c01-dc5e-4d14-85d69e540479@suse.com>
 <b949bd0b-3071-449e-bfd9-ad25cc0a1d22@bugseng.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <b949bd0b-3071-449e-bfd9-ad25cc0a1d22@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 58678f70-8b1c-4a01-1fcf-08dbe03ba140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xH85q9wolU7zRIglXwcK9KrJvfOGzbboVlH/y4KK2rtQ0rCPu4LHK2TxtEhXANnnZg7Y659uIOiR6JLrc9D809E4cDYCFL4ndhUxk1VfDqPwrledK8+iMlwlYUYnm8TS3R3QNXP99K2oJv7CGTBhZCRe5+ZWDxKuc3QTeAXpk8yC6Wye/Yw1gTt+DRg8s0PQjxq4KaAo6h4Sg/CQitQeKw4+obfy86EmoHXsdzW4LElfokK4tfys4rZykQqrNkHAeWJ8h3De1eLyN2285IqSHxUa9R2XqsYRwkojTUaAfMoghlaSz2Y4+clgvfM5J/02wLP/GB2MXqVFzsTHqSgINIYxQFTnQ9eNs2JHcA1vYcmBSrLIjEvebWHsCa/jTrfR51SfwMOAoO3aiY5Yr0D7OkiYaFH6l4ZFwRzx+SXZV2q+1qY980Q74Qq4LbFYhQMNGy58VdH8FkYANyE2aLTVugVtSqEAF5d+vPl7e8DoR/8nKA+ieXq/9xmKr5oqNI9XW7SMBhuSCIR85Pjlu8HN9+FEP4fqzaYx1lwBCC7fC8rsKIlXRH+9S+XECKYIZRQ7NrwUTfiOcbZccV0VVeMOM9rdRdAWeF7Y5SwcoGFhl6DavDEHlr39Izo5TCLWubOOlYhaEdMnToZVxFVxlJxQEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(31686004)(478600001)(6486002)(6512007)(2616005)(83380400001)(38100700002)(36756003)(26005)(66556008)(66946007)(66476007)(316002)(6916009)(53546011)(6506007)(8936002)(8676002)(4326008)(2906002)(41300700001)(86362001)(31696002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0FMWVdMT2ZrUU1vL0FvY2VrR3RHeUZ4Wll0YmtpY1pEdnAvdVBFSHllTkZs?=
 =?utf-8?B?K0Y1U1l6SmFvZS9WY1Zyb1lYYmVscGgxNlNvczc4VjVSaWVzQVVFVVN1ZC8x?=
 =?utf-8?B?NFJMWTBTVTN4Ty9vTG1YaWorNWhpRUxOSUlrRkpDMVZBQ1pEZWR1cCtmeWVz?=
 =?utf-8?B?TWI3SWh4QjZ5d0RqenR0VjgrYm9McU00YWFQUGFuU3hOclRLWld1SXNEQkVj?=
 =?utf-8?B?c1pzK3pBVWFkZnNwbDVYQ1BGdE5VZDA3UmIvUjVBY3NsNkRzTkhlbWhWT3E4?=
 =?utf-8?B?VUFncDdXbFFldk55R21OVUVERElNTUdlMERubks1QkZKL0NnZi9yYUpuY2E1?=
 =?utf-8?B?ejNUYmtnVmsvd3VRT1FJai9COW5DUDJWRXg1OE1KNmplL3VacWdKeGlNZy82?=
 =?utf-8?B?RW5mT2lRUk9Xc3ZtbmdpSkJZQU9LN1hLY0E1TWZuUm56WHUvbk1UME1qSkJo?=
 =?utf-8?B?amRac0NjSkN2dm5tbFU1MDVJVXJZOW02MVF0UFYyWTl5N3V3YmNqM2dlUCtB?=
 =?utf-8?B?SWNjZFF5MkkwclpUeS9PbDRwQ2g1Z2hXc2c4SW1aQWxZMElUOGtsQnVOUGZK?=
 =?utf-8?B?ODVOeksvN3h1RUtrWDdrYmNFWjdBNER0L2VPeUZNaUxPWmw3dFcwcmlZMFhW?=
 =?utf-8?B?Y29hN1lRaGlQZmJuY1pvY05lN0luaDVwTk11WmZhWkl5Rm9LL2tBVzFJVXpi?=
 =?utf-8?B?WlRkbmhJV1pXcGFlT0JNR2Fkc2NGNVpKS2JXbVhkNFNKWm42R0hzbTFDSkNk?=
 =?utf-8?B?QS9EMGFCcEd0ZW1NN1ltSWFNRWs5bUJzWUlQNURqTWNZTEVXQ2F4ZVh6NS9W?=
 =?utf-8?B?cXZhSEFyNkFnZTVFamFENzFaUzZobUp5ZXRlS1VMNHlrdDJ4T25uRkNFS1Uv?=
 =?utf-8?B?UUlSUkE3dEZkcVJLajQ2RitzekV4SG1JMVNqSTVzYy9MU21QZzErYWNBSC84?=
 =?utf-8?B?OGMyWlZ2Z0FTRU03b0Exb3FiaWovSWhZeHNGcmFvNzN1VFlCYXFiVVluVWp4?=
 =?utf-8?B?UG9CcSs3V3NaUjJWTjRONVBpWnl5UjdmaHR1VE1ocTdWUHlPNE1jbjhXYzBX?=
 =?utf-8?B?cWNmaWQ2QWRPek9zcElOUnRmVFlJQnlhOHBPU1VacGlZcjVrNzE5Nzl0Ulo2?=
 =?utf-8?B?QlJieHpOY2l0THJCWTc3eERPT00xcnk4ZHVSU2VxVTJUR2x0U2ZsUi8rTVNM?=
 =?utf-8?B?WWVtMEw3a01ISVRTdm9SQnZyck1BMW1hQzJ2UkpDSmI0VWlsSWtuSEh0cFUz?=
 =?utf-8?B?NVZkSlhwOGthU3RYQVl4SEtaOWZzcUJUU2JxdmpjZ2J5Q2FpQ2w2Wm9sdDR0?=
 =?utf-8?B?aEsrVXlOSnl3SjhwQzZNbDJEUHE2MUN4ME9qaXFZbEEvVE8vZWNyZkdxWENx?=
 =?utf-8?B?TG1QQkFKb3hFY1Y4OW5hY2liMmRMZTFmeUlXMDZpelVZUlhKNUIwWDIweW84?=
 =?utf-8?B?YTdPZ05DL1lRUVhGL0k4YnI1dUZTcDdYcG5QL2FNallDVFpmUjFBU2h2NUJS?=
 =?utf-8?B?T01vRnlGbDdsZXoxZklzRmh1YlFpVkdQd2tWL3ZPL3hrY3JmTjRHSGlacVdF?=
 =?utf-8?B?NXUwanNvcW1uL1ZoeVFidGU5SnJTcVA1bnJCeUwrY1JtajcwT053anRFaVdq?=
 =?utf-8?B?ZlU5eG84UHMrdmtCU254TFdmbnkweDBpOTF5K0liUkVSMmh2c3Q3aXdqeDlt?=
 =?utf-8?B?RWtkNDQ1MytiMk5UK0czcWhVTFNUNFpRT3dycEh5TVgwUzhuRVRpaGh2UFJ3?=
 =?utf-8?B?blhEK3hQYU53VXdiR3B1citBb0VWeFAyU1JrL2s0WjV2ODVUOFJ6c1VZdXpN?=
 =?utf-8?B?Zit1eEZRUlZDdldjZVVHcGtHUWdIUDdVdU5JaU4rRnl3b01YV2dOdFBBbW9I?=
 =?utf-8?B?M0kzcEp0N3FVQ2JXbTd6Rmd2VzZwMlhqRHpsWURwVWduL09OTEhtdG0xSDAw?=
 =?utf-8?B?Z3dKclUwdVgzMUw4M3FtdDRqanZRVWNoRWNCOE1mT1pBNkQ5N1Q1aGJReDg0?=
 =?utf-8?B?WFJtK3lrbHVaNStYMXVUcDZNNFR0M2Fya1lTRllKK0VhekxKdnlOMWcySml6?=
 =?utf-8?B?N2hYL3ZUREc1NDBQWndoL1dRQlZRZlJMMHVrYng5T2RBT3pWaE9TSXRuSGp2?=
 =?utf-8?Q?Bo7xF7fWApvcqV+GI2zo4PeP7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58678f70-8b1c-4a01-1fcf-08dbe03ba140
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 09:18:11.7402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpLkWg7HjRgJmrFHPfdG7JkmjiCMHcGWS4JnGyU+DxmDFKYdVDW8y8P3pEl2utU93Sm295QeqSYWB6UTQScTdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7628

(re-adding xen-devel@)

On 08.11.2023 09:43, Federico Serafini wrote:
> On 08/11/23 09:07, Jan Beulich wrote:
>> On 07.11.2023 16:18, Federico Serafini wrote:
>>> Add missing parameter names and make function declarations and
>>> definitions consistent.
>>> Mismatches between parameter names "count" and "n" are resolved
>>> in favor of "n", being the same name used by the C standard.
>>
>> I'm afraid this wasn't done consistently:
>>
>>> --- a/xen/include/xen/string.h
>>> +++ b/xen/include/xen/string.h
>>> @@ -12,27 +12,27 @@
>>>   #define strncpy __xen_has_no_strncpy__
>>>   #define strncat __xen_has_no_strncat__
>>>   
>>> -size_t strlcpy(char *, const char *, size_t);
>>> -size_t strlcat(char *, const char *, size_t);
>>> -int strcmp(const char *, const char *);
>>> -int strncmp(const char *, const char *, size_t);
>>> -int strcasecmp(const char *, const char *);
>>> -int strncasecmp(const char *, const char *, size_t);
>>> -char *strchr(const char *, int);
>>> -char *strrchr(const char *, int);
>>> -char *strstr(const char *, const char *);
>>> -size_t strlen(const char *);
>>> -size_t strnlen(const char *, size_t);
>>> -char *strpbrk(const char *, const char *);
>>> -char *strsep(char **, const char *);
>>> -size_t strspn(const char *, const char *);
>>> -
>>> -void *memset(void *, int, size_t);
>>> -void *memcpy(void *, const void *, size_t);
>>> -void *memmove(void *, const void *, size_t);
>>> -int memcmp(const void *, const void *, size_t);
>>> -void *memchr(const void *, int, size_t);
>>> -void *memchr_inv(const void *, int, size_t);
>>> +size_t strlcpy(char *dest, const char *src, size_t size);
>>> +size_t strlcat(char *dest, const char *src, size_t size);
>>> +int strcmp(const char *cs, const char *ct);
>>> +int strncmp(const char *cs, const char *ct, size_t count);
>>
>> There's still "count" here and ...
>>
>>> +int strcasecmp(const char *s1, const char *s2);
>>> +int strncasecmp(const char *s1, const char *s2, size_t len);
>>> +char *strchr(const char *s, int c);
>>> +char *strrchr(const char *s, int c);
>>> +char *strstr(const char *s1, const char *s2);
>>> +size_t strlen(const char *s);
>>> +size_t strnlen(const char *s, size_t count);
>>> +char *strpbrk(const char *cs,const char *ct);
>>> +char *strsep(char **s, const char *ct);
>>> +size_t strspn(const char *s, const char *accept);
>>> +
>>> +void *memset(void *s, int c, size_t n);
>>> +void *memcpy(void *dest, const void *src, size_t n);
>>> +void *memmove(void *dest, const void *src, size_t n);
>>> +int memcmp(const void *cs, const void *ct, size_t count);
>>
>> ... here (not counting functions which aren't part of the C standard).
>>
>> Otoh I'm unsure I understand that part of the description correctly:
>> There was no disagreement for any of ...
>>
>>> --- a/xen/lib/memcpy.c
>>> +++ b/xen/lib/memcpy.c
>>> @@ -8,16 +8,16 @@
>>>    * memcpy - Copy one area of memory to another
>>>    * @dest: Where to copy to
>>>    * @src: Where to copy from
>>> - * @count: The size of the area.
>>> + * @n: The size of the area.
>>>    *
>>>    * You should not use this function to access IO space, use memcpy_toio()
>>>    * or memcpy_fromio() instead.
>>>    */
>>> -void *(memcpy)(void *dest, const void *src, size_t count)
>>> +void *(memcpy)(void *dest, const void *src, size_t n)
>>>   {
>>>   	char *tmp = (char *) dest, *s = (char *) src;
>>>   
>>> -	while (count--)
>>> +	while (n--)
>>>   		*tmp++ = *s++;
>>>   
>>>   	return dest;
>>> --- a/xen/lib/memmove.c
>>> +++ b/xen/lib/memmove.c
>>> @@ -8,23 +8,23 @@
>>>    * memmove - Copy one area of memory to another
>>>    * @dest: Where to copy to
>>>    * @src: Where to copy from
>>> - * @count: The size of the area.
>>> + * @n: The size of the area.
>>>    *
>>>    * Unlike memcpy(), memmove() copes with overlapping areas.
>>>    */
>>> -void *(memmove)(void *dest, const void *src, size_t count)
>>> +void *(memmove)(void *dest, const void *src, size_t n)
>>>   {
>>>   	char *tmp, *s;
>>>   
>>>   	if (dest <= src) {
>>>   		tmp = (char *) dest;
>>>   		s = (char *) src;
>>> -		while (count--)
>>> +		while (n--)
>>>   			*tmp++ = *s++;
>>>   	} else {
>>> -		tmp = (char *) dest + count;
>>> -		s = (char *) src + count;
>>> -		while (count--)
>>> +		tmp = (char *) dest + n;
>>> +		s = (char *) src + n;
>>> +		while (n--)
>>>   			*--tmp = *--s;
>>>   	}
>>>   
>>> --- a/xen/lib/memset.c
>>> +++ b/xen/lib/memset.c
>>> @@ -8,15 +8,15 @@
>>>    * memset - Fill a region of memory with the given value
>>>    * @s: Pointer to the start of the area.
>>>    * @c: The byte to fill the area with
>>> - * @count: The size of the area.
>>> + * @n: The size of the area.
>>>    *
>>>    * Do not use memset() to access IO space, use memset_io() instead.
>>>    */
>>> -void *(memset)(void *s, int c, size_t count)
>>> +void *(memset)(void *s, int c, size_t n)
>>>   {
>>>   	char *xs = (char *) s;
>>>   
>>> -	while (count--)
>>> +	while (n--)
>>>   		*xs++ = c;
>>>   
>>>   	return s;
>>
>> ... these, seeing that the declarations simply didn't have any parameter
>> names at all.
> 
> The disagreements are between parameter names used in
> "xen/arch/string.c" and the ones used in "xen/lib/mem{cpy,move,set}.c".
> 
> The reason why some of the "counts" are left is to reduce code churn:
> I preferred to add the missing "count" on the declaration rather than
> adding "n" to the declaration and also changing the name from "count" to 
> "n" in the definition.

I'm not happy about the resulting inconsistency, but I can kind of accept
the "reduce code churn" argument. But then still the description wants to
say so (along with making clear where the disagreements were). These are
all adjustments which aren't required for functionality, so it is even
more relevant to explain properly why the code is touched despite
technically all being fine.

Jan

