Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D23D7E51AC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 09:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629217.981241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0dbS-0002Mp-MT; Wed, 08 Nov 2023 08:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629217.981241; Wed, 08 Nov 2023 08:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0dbS-0002KZ-Jp; Wed, 08 Nov 2023 08:07:58 +0000
Received: by outflank-mailman (input) for mailman id 629217;
 Wed, 08 Nov 2023 08:07:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r0dbR-0002KT-EE
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 08:07:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaf56d89-7e0d-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 09:07:54 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8464.eurprd04.prod.outlook.com (2603:10a6:10:2c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 08:07:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 08:07:50 +0000
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
X-Inumbo-ID: eaf56d89-7e0d-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJ2g83SPAB71cwTKfJgO6oxojG6is+1SXoYmn+oITmSuPI1C7ZWvbduYpAv1Cd8iA/cuBBAvAs+KWMRyYIOFfJjihtp8CwGJ+u7nstF6/CcOCTNnWsjx9idZCaqybzV9LSoaH5HZ8IFdqpbT8sfbOeUOdu4nPDMcF2Q7rklrT9RgWoOYAenAp7HeoBrE1XfOPfLb87TGtQTZecBmrQAg4intKOBY1DawGPHMsRuBiHGbDHK4mqrsyVcc2Z8+Sc/XhEnD43GCUT6oJonf0n7YUcqQ5BfWYjlpIxedZ2dpKiDM1UN/PdNd5UjlVDj3dL5nGdC902fY4P7zdAbBoeJw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QaBxUfnatMweMqqI2yFQaKMByKzbLYi5OTYIF3vqcA=;
 b=IOjVrFNiYBsdn1VxWcVJpiR4GO8DJFGcT0Jhki/JbjqJtkWa7+6SpIKo3eywrucIisnck/bIOQAPGE4C1eoLtiZYbaD/wULQHfF8YMQ9C1s4eGX6rhO6D2adgpBBoBztP+lcHM5nfPzVD3YoT6s20Z2E+4XleZOrtOjh+9nyfY8sBCU+Wnxzq13zjlg/QtJ3xrOIzguPAkSkZaYRUy9VrXCmKpmlwcvTWEWGt0k4uzk47oiTfDFShT1+xMtyusVbnmjZPmQ/KONwlLB7FqkpKz1kCoSRp50pLX1/wp10zGyRtPgVSzaQ1QUpJfssAy+2GH7Kl2sLcvzReuVcPH6sjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QaBxUfnatMweMqqI2yFQaKMByKzbLYi5OTYIF3vqcA=;
 b=i3WnwDpUshVv2RvXxrDtUcBP58fXC9FWQrnoKH1RtzSuuYFB10DSiZNcz2D+p9QWl1HRCon1FrACmEo2QMvLjdl1Gf6r62y+8YMl0li+xiEpUNAabPROfUHz/+RoZGd9z2gF8IE1oYHATGpzRIL3bjSyQkYOIQDsPmId2wzdR7cGH+O4b2udZXARfgXJcD4SNJc0sVr5YKzDEXAZumEukDetM890vg5EO4wnboATOsbSJozeew5q3+KVGvqTDw16IesnjDqhsO/H3hNW8Vt+oxesq8Lpyw540by6GG1qJzxzm+GC7aTmeQAWjtVrsyN14i/QcWmYDg/uCeG/kmeN7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e94cfaf-7c01-dc5e-4d14-85d69e540479@suse.com>
Date: Wed, 8 Nov 2023 09:07:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v3] xen/string: address violations of MISRA C:2012
 Rules 8.2 and 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <d28ea15aa8d36622548b433d5fb6f19dd521bdfb.1699369270.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d28ea15aa8d36622548b433d5fb6f19dd521bdfb.1699369270.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2ede87-cf46-4c34-f0a1-08dbe031cd37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ASPFPo+9iiVbVRaTTc/MaIJ+rHBu2FGPEfOjg+DZ9NrGInA1V8tWbnnNiow+C7sx2PbhMLrE5z5ySmT9PdmCcNoG/o4rs7pz/qQUtIHNH/VMa3uG9/8mZwvqQmtoW+WNGeuWXHAbKOebG5r1i8oiOK2ktFKkUOK70U81z3vCw+A0XfOghVukiKs1lwAN7WYwL5WPuC9gE9UYLGcGkymMVaTZeX6ykFlzgheEgAuHJYrhhzqTkNO/mLTaDebXGrq6l/3RYZ5pUiP+HzgJKkwoPU8hU3hq3Jy1fjHI/KYOcRnBE6hHR5xnSdFlbzmtKzeZmlyM7Dg2KdHScHjXE9gmb/SV82Z+GGK91Yn8Dw7stYoRDTRPAD4STp9k0LoQBdhNcAefXrbEiE2kD2lFzswcVh0hjc/zajPyu3n3MyE9cHItmqz9NVOvwaKKPIxFY7pxsQJeUp+mDVOXxlE2J2KmIl/G3zlkUX1ouY8umIggs7o5P1K9lYGsH7TKj5xwsE129xn0UD0KYoXITGKqKRT0Asl5GJbfptNZMkPXEgr6mYzjmZhO8pTztxxLI+g3w/4cpMF3FqH2nZRpLuLYIGidFm1ZywkHuf+LwlHzZIO6L+NjQ3ptPHFdinIvarybcUdoqPxq0z7ByEKS1n12jnNBSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(396003)(366004)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(36756003)(5660300002)(4326008)(8936002)(8676002)(38100700002)(2906002)(6486002)(6512007)(26005)(31686004)(2616005)(83380400001)(54906003)(66476007)(316002)(66556008)(6916009)(66946007)(53546011)(6506007)(478600001)(86362001)(31696002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3hseklZTzNMN2I0d2RyRDlaWVI0NzAwK1R4di8zdjhVVCsxUlVmWnJTeWpi?=
 =?utf-8?B?UlJUbEh4Mi9FQmQyeXNBNlRZWjBPRnJ6ZWl3YnhnaEJ3MWZCRDZvYys3R3NF?=
 =?utf-8?B?RW1LNjZSQmpwc1I4c0FHYmN5cUVZVnhheWc3WlpqcncvakRUekd1T0FjVEtW?=
 =?utf-8?B?V2JhZzRrL1VNd3VOL0VOajl4S09xZ1pLbE85U0RpRUU2bmtVQWRGTTEzNS9u?=
 =?utf-8?B?Z0Y1N29PR1IvOSsrbkxybUJsbmsrdGdaWkRhUHY4alhBV1dva2Ezb1VYYnlz?=
 =?utf-8?B?ZndVbkpjQ1BuVUw3SDdaQ0N2T0Q5bTFvRGZzV1NLYm5UdExtYmtHMXQ2ZlVV?=
 =?utf-8?B?Zm5sUk1QMXMrd0hBaFdVMUd6QUhvRk0yWWk0S1ZUb3RjVS92QWhPRDNTS2R0?=
 =?utf-8?B?M2NuYnJEdStPLzRIU0tYV3gzL0k1RHNsdEVnOUx3MVM0bmhKS2tpbWtJblRv?=
 =?utf-8?B?MFdGK2ZacC9VNkw2eFB1TnpxOXV3TWlDZ2VidHJhZzBPZVlXQ1ZheExCZ3ZC?=
 =?utf-8?B?MVpINkJvdnBJNUJmTEVDRmRqODZJZ0UyS3NuWEY4L0NPcWx0Um9zTG94ektK?=
 =?utf-8?B?QkZRL0pnOHhMNHhzYWR3a1ZPT1ZWeVRHblNFeEI3bnlWT2xPSlVidG5HQVA3?=
 =?utf-8?B?V3FtRk9BTFdpQVB6R2cvTFFOQmlOVEdnZ2JLVUNCY1MzeU1tbzdDYm9lNCtt?=
 =?utf-8?B?NVN6T3YrSit4b084M1JnSEpNL0laZHFCWjZsYmxzT25lU3V3TEhLSW5Lb0Uv?=
 =?utf-8?B?WjZJRUZtVndxSjNNRmFJYk9mWEsySFhiR000NlhzUnhHWHMrcVE0bi9hdUtV?=
 =?utf-8?B?N2JnbWpwMWJ2UFpRbGNORU9BZHI5ZkVkeXgzV1hTZ2JpOFpoSnhOM0oxSEY1?=
 =?utf-8?B?c2wrWXNhQURFNGIvNzJoTU5wTGJiZzBpelBRVndzbFZiRytJRU9DMTlBeVMz?=
 =?utf-8?B?ZDhXMWpWK3hLcmFDSnc0TmVaSlVDNWRRRUpVUGpGNGxIRXkzNGVTQ2YrRnk0?=
 =?utf-8?B?REQ4c3Y1LzhCY3JmK3dqVDhwR0ZWR2RNREpwZWp5SFk1V0xxTjJ5WjEwL1Q5?=
 =?utf-8?B?WG1UUE05UWVmOElMUWo4RDFiTnppdFBmZSt0ZkQ3MjVWREJTdEdPY2pmMlU4?=
 =?utf-8?B?TXhlbjltWUtWWGh2MUt2WFVZZkpwZG9BL010RkwvZmc0R1FDbGxNd0YyaDJT?=
 =?utf-8?B?SDFHTERaWWMvUEpIYVR4Ri9DU0F5WnptcjNTeXc4blpzaG5JYUtzdFhLTjl5?=
 =?utf-8?B?WWVTQThtZDRTbGR2UmhwejM3ZWljcTRwQ1B1YzVJUHo2WG45aXh2N1BaNjRQ?=
 =?utf-8?B?eFh4RnB3T3htZVQ2OWpIeWV1RnZta0puTWd1dzNFZXJFQTJTY1pWWktHTlJn?=
 =?utf-8?B?NElsZFpLVzd5SGE0TUNzSlkrTkZJTm16NjRQamxRbW1qU2NWaGZibnM5NTRt?=
 =?utf-8?B?NS9ubWtRTzY5SzRRS0hMOHJNUjRHZTVXYWppaGZ2ZWJsYUpZemQ0SUlEWS9B?=
 =?utf-8?B?LzZnUUJGNlFpWHppZG9OWllHRUc5UFpsRThiNFArZWR5ZmxpcUM2TEJkMGJD?=
 =?utf-8?B?MGV1TDg1UFA3Y09QRGRkS1ovR05HV2tmWTRvbm9rUXVtWndrd0lUN01ZTlk1?=
 =?utf-8?B?ZVRrYW5CbFpPYUUyZ094S2Mza1RueW1SRlA4cmZUV2tkTUlZT3Vtb01RZVlR?=
 =?utf-8?B?SkNZV1N1Sm9uWkNFa2Y1WlZBWmZ2R0o1TjBHclJsZEZmYitiM21pK0M5Y2tw?=
 =?utf-8?B?Wml0dU1NOVFYUjdnZGh3SHdISndZN1BQSjZoN1BFNGhLOWZkMzZmQjJkdFJu?=
 =?utf-8?B?MnYzUnlzVk9sRnlDU3BvU3pJWHpwaEZhbUxKSVlVZ2hTWTJuc0M0cUVsWDJ2?=
 =?utf-8?B?Y1RNYjV3K0FpNS8xRzI3OW1ZSFdLQkt5dmpld1NVVGo4SXM3L0pPTjVkaXd0?=
 =?utf-8?B?bGYwdmVCWTFONkY4WUhSUHU4Q2lHcUNIdVhzVXZOMEx2K2QraWFyZjFWVWpI?=
 =?utf-8?B?bHZ2T08xVjc4VEhRSHVCWjVSbXY1MEYxTkl2a0hVUjRGNTNRMFpWTmpScU9n?=
 =?utf-8?B?RUptT2pwSkc1YWRoMnhrK0xtZ0hvWkxZUE1ORVJJbFAwRzdPeGJ0ZkJjbHUr?=
 =?utf-8?Q?FCcd5soxqrTMI38WY2Of7WO1B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2ede87-cf46-4c34-f0a1-08dbe031cd37
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 08:07:50.5573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F04zVwxnlXVH8xatjxvvcKdbsrbnAh7TlFULWrjTlY9L/TZsQnkYLDRqZIj3dsItuTaMv9AQdbNzFwLl1iFNCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8464

On 07.11.2023 16:18, Federico Serafini wrote:
> Add missing parameter names and make function declarations and
> definitions consistent.
> Mismatches between parameter names "count" and "n" are resolved
> in favor of "n", being the same name used by the C standard.

I'm afraid this wasn't done consistently:

> --- a/xen/include/xen/string.h
> +++ b/xen/include/xen/string.h
> @@ -12,27 +12,27 @@
>  #define strncpy __xen_has_no_strncpy__
>  #define strncat __xen_has_no_strncat__
>  
> -size_t strlcpy(char *, const char *, size_t);
> -size_t strlcat(char *, const char *, size_t);
> -int strcmp(const char *, const char *);
> -int strncmp(const char *, const char *, size_t);
> -int strcasecmp(const char *, const char *);
> -int strncasecmp(const char *, const char *, size_t);
> -char *strchr(const char *, int);
> -char *strrchr(const char *, int);
> -char *strstr(const char *, const char *);
> -size_t strlen(const char *);
> -size_t strnlen(const char *, size_t);
> -char *strpbrk(const char *, const char *);
> -char *strsep(char **, const char *);
> -size_t strspn(const char *, const char *);
> -
> -void *memset(void *, int, size_t);
> -void *memcpy(void *, const void *, size_t);
> -void *memmove(void *, const void *, size_t);
> -int memcmp(const void *, const void *, size_t);
> -void *memchr(const void *, int, size_t);
> -void *memchr_inv(const void *, int, size_t);
> +size_t strlcpy(char *dest, const char *src, size_t size);
> +size_t strlcat(char *dest, const char *src, size_t size);
> +int strcmp(const char *cs, const char *ct);
> +int strncmp(const char *cs, const char *ct, size_t count);

There's still "count" here and ...

> +int strcasecmp(const char *s1, const char *s2);
> +int strncasecmp(const char *s1, const char *s2, size_t len);
> +char *strchr(const char *s, int c);
> +char *strrchr(const char *s, int c);
> +char *strstr(const char *s1, const char *s2);
> +size_t strlen(const char *s);
> +size_t strnlen(const char *s, size_t count);
> +char *strpbrk(const char *cs,const char *ct);
> +char *strsep(char **s, const char *ct);
> +size_t strspn(const char *s, const char *accept);
> +
> +void *memset(void *s, int c, size_t n);
> +void *memcpy(void *dest, const void *src, size_t n);
> +void *memmove(void *dest, const void *src, size_t n);
> +int memcmp(const void *cs, const void *ct, size_t count);

... here (not counting functions which aren't part of the C standard).

Otoh I'm unsure I understand that part of the description correctly:
There was no disagreement for any of ...

> --- a/xen/lib/memcpy.c
> +++ b/xen/lib/memcpy.c
> @@ -8,16 +8,16 @@
>   * memcpy - Copy one area of memory to another
>   * @dest: Where to copy to
>   * @src: Where to copy from
> - * @count: The size of the area.
> + * @n: The size of the area.
>   *
>   * You should not use this function to access IO space, use memcpy_toio()
>   * or memcpy_fromio() instead.
>   */
> -void *(memcpy)(void *dest, const void *src, size_t count)
> +void *(memcpy)(void *dest, const void *src, size_t n)
>  {
>  	char *tmp = (char *) dest, *s = (char *) src;
>  
> -	while (count--)
> +	while (n--)
>  		*tmp++ = *s++;
>  
>  	return dest;
> --- a/xen/lib/memmove.c
> +++ b/xen/lib/memmove.c
> @@ -8,23 +8,23 @@
>   * memmove - Copy one area of memory to another
>   * @dest: Where to copy to
>   * @src: Where to copy from
> - * @count: The size of the area.
> + * @n: The size of the area.
>   *
>   * Unlike memcpy(), memmove() copes with overlapping areas.
>   */
> -void *(memmove)(void *dest, const void *src, size_t count)
> +void *(memmove)(void *dest, const void *src, size_t n)
>  {
>  	char *tmp, *s;
>  
>  	if (dest <= src) {
>  		tmp = (char *) dest;
>  		s = (char *) src;
> -		while (count--)
> +		while (n--)
>  			*tmp++ = *s++;
>  	} else {
> -		tmp = (char *) dest + count;
> -		s = (char *) src + count;
> -		while (count--)
> +		tmp = (char *) dest + n;
> +		s = (char *) src + n;
> +		while (n--)
>  			*--tmp = *--s;
>  	}
>  
> --- a/xen/lib/memset.c
> +++ b/xen/lib/memset.c
> @@ -8,15 +8,15 @@
>   * memset - Fill a region of memory with the given value
>   * @s: Pointer to the start of the area.
>   * @c: The byte to fill the area with
> - * @count: The size of the area.
> + * @n: The size of the area.
>   *
>   * Do not use memset() to access IO space, use memset_io() instead.
>   */
> -void *(memset)(void *s, int c, size_t count)
> +void *(memset)(void *s, int c, size_t n)
>  {
>  	char *xs = (char *) s;
>  
> -	while (count--)
> +	while (n--)
>  		*xs++ = c;
>  
>  	return s;

... these, seeing that the declarations simply didn't have any parameter
names at all.

Jan

