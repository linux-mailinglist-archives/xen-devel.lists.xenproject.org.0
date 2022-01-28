Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B5249F9BC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 13:44:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261988.453949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDQbT-0006bh-JQ; Fri, 28 Jan 2022 12:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261988.453949; Fri, 28 Jan 2022 12:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDQbT-0006YF-Ff; Fri, 28 Jan 2022 12:43:47 +0000
Received: by outflank-mailman (input) for mailman id 261988;
 Fri, 28 Jan 2022 12:43:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nDQbR-0006Y9-PW
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 12:43:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed774e6d-8037-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 13:43:44 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-4LnytWwUMTKIWsJCDbjIhg-1; Fri, 28 Jan 2022 13:43:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6372.eurprd04.prod.outlook.com (2603:10a6:208:16b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Fri, 28 Jan
 2022 12:43:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 12:43:40 +0000
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
X-Inumbo-ID: ed774e6d-8037-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643373823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7X2ntNnnQ16v9t4cWE5oej4JS0ziR+EKIL+nJJ914GM=;
	b=i/12UPsmOyNKK3BJZ9BXtW13dlAgAUJSvmaK1cLBniAu+JWWe/9WCfw+Wjp6iSv0GfNtoO
	lBjL6n3d7+2E2Nu/fYyJZqiV0CgPeQjigjG2YRr3+u0xAMzCUop+zhL+NYzI7kAQ9rMiy6
	OtD12ExioW8IYwCYFLXhbP0ThcEjmRc=
X-MC-Unique: 4LnytWwUMTKIWsJCDbjIhg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4Y/9TEyo6wnXF/u4OU7Yy+9OVJISNomQtiR9MDhN8hL0iN+C4IgB8fm9yTTW4FL2SX213EIo6/zkh8y5Q86+x7HYZ1OFzWrF8hQOItobMqpKvm2XYJYjPd/f4VgKlqUYJegvwfDGzHbZCSy8ACBlEpjtx7HW1nCVt+aaIVbcdHOlEo7RgPqlsN3Qw9TT+6ckNVdTwdlQVu7XYLt/DG9gZf0D/dXOKRV2unvW83eNB2KTGWcy1PpHy4pa19HX2mZMzH3NS9QT24hTlrxv/ekgyNxjCKrIVKQjH5AwZNSr0PxDD1m6Ul7uxZ/5cnEr0Nl7xF5aHatLIVwfxl919P+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7X2ntNnnQ16v9t4cWE5oej4JS0ziR+EKIL+nJJ914GM=;
 b=e6ul2/ArrhymqzEU/axOlvGgdl8NuCS5Q1wCE8Nw9nVVAWnVqbUT/qrZaJuWF5aO2ztwYdbmHnIGbLlljDo8McdEkhzswLPBFL/fJxoh0BFUO5f7uAvR4eqwIp/sXG5ok0zrHM7Xp5ZFCRfmj2WciAJ+pkKDsW5GQEotYzk6QSyEncrgTQl4LwlpEpN8sV+Wk8EiA9q6OH3ApVcvROf1PAPMOFUbKIuSW1noY5A6qHnC96rV48Fe4a4lO9hljhPODOVt+mCgGSJGeAE/FSOZfXE1sLWNnsTjuWMBYHDeuoOSCdibbU8Z5DqeLqxazRpgSVxegSOyPOkDiwiFPSqcDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b9b4262e-5ca2-b051-7aba-b2ad1a6bdc01@suse.com>
Date: Fri, 28 Jan 2022 13:43:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v9 08/30] build: fix enforce unique symbols for recent
 clang version
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-9-anthony.perard@citrix.com>
 <708a1723-7b01-e82b-f2c2-d031a33ae55e@suse.com> <YfPbndiBeViN0heB@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfPbndiBeViN0heB@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0057.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 749548e6-7641-467f-adb8-08d9e25bcf46
X-MS-TrafficTypeDiagnostic: AM0PR04MB6372:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6372A80C07A35604A2CBF4F6B3229@AM0PR04MB6372.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q74R1Nwn6ZgoMaH9DeWl4HiGq//x6fmDXwwke94mPXQK3wzmy8OVrtLBCi5ISaSp3GeJS7aCL4vKNs3o9xu4z0SPRtHOdLr9Kg3kS6eOfOPnKOVu3NWiaxkC7GAJGQjd6OB44oXBokVjraZZRBMqZTsIU3x+YRnUqcUCqz2+tf/GvSsgpnLDTw9u59w/1W+0jxcnA0oVFjzHJJjv69S1QEEGCaHAMS+7jdX+moM6tMUADLnhzLwmA//NB6tGfFbUwqxFMSSPSq0COSiGZ9xEf8QHpIX7eYBD8V/dI+OrJFyIL7mYl+1lggpgrpK46vG0xX+yrYobw7M81Nyd6VSoqRIs/v1/OYBIXRMbRrq7uNT/jKkniE46/FoP0yG+y4nrlwgg00VuPg2DdFRaolQJScZ3HEXMj8GMo8MSdkkKVdhynC/LM4Q2cDfN11BzAxJy4EnrHO0DlWwGvmBh5Jl0zhswFsoljGQEdk0+U8gTtM4/sxDxTcB4d32ZQtA4rqUAMFLHv50xORWd+tpoZgNMCDS8u8yxKSVp9Plq2vseSkSYzR1fd4BYZTCJnLLcIHxoEL/h3ibLwe7GdRc5J+Yc6VcUe8WmD7NuwNbyGti/q5f14YuICimcSKln3srpR5FR2NMTTQpGvzp53YjTFzDWZ416etstIkKUl21h171GkQ7NZULBt9ArK4/LLsYVlDswyfW/TULpM5J615SOljoeEWYIIeg9aPvM0KBbO8zKddARReOV9jhz2DwmmRnKZr7DgvdVfjwpPbDteqm2yHbOzsDDYcE4YAgwJ5/0p7XksyMOz6lLYEjsyEA5RDzxZzLJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(316002)(54906003)(508600001)(5660300002)(38100700002)(6916009)(2616005)(66946007)(66476007)(66556008)(8936002)(8676002)(6506007)(6512007)(31696002)(86362001)(53546011)(4326008)(6486002)(83380400001)(966005)(36756003)(31686004)(26005)(186003)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2p3VXRGZHkxYkczV3NSc0loS2VCcjlQMEdaM2llWGkvVEJmSVlqOUIwZHpq?=
 =?utf-8?B?MzNsUUdwazZIZTBRWE8waWIyWGg5d2dpZkQ1TjNnTXRyRHVSZjFSQjk5Nm00?=
 =?utf-8?B?eGNuS014bUM4eVNISWh5dVM5ZS9kUEtibW15dVhxRU5DeTZUbnQ0WjhzYStx?=
 =?utf-8?B?Ulk5SnN3eGw3cHZlb3VtRE9iTHJrS0pOKzlFZWU4OFBvTktLampaM0xNWmdY?=
 =?utf-8?B?ME5KSUt2OVlNTk9mYXhWM3FoeUFQZHlWRDhkdEkvRWFvbGduWVh2WW5IVVhl?=
 =?utf-8?B?TWZQWWlDNDhYWXpsVzcvMUdyZkt0eTV6Zkc3dUZJMElNVjdqaERMNXdDajNs?=
 =?utf-8?B?UEQwbnAvVDFmNmppL3F4WTdnSmgyU001YWYrZHZ3ek02dXJMM1luZ2dDTjVM?=
 =?utf-8?B?MDNVOFQ5SVVMTjVDMGo1azFpVlJkS1JkVlduNStKUnh4QW9CWTFrRWFwTWhr?=
 =?utf-8?B?ZjA3aTRxUVdLQWsrVDZkQWxvRjBXakNNUTJsL2RBdUdLMXVzMVR1R2F5OUE4?=
 =?utf-8?B?QlNwa21BMXpZL0Q5WWpReFgrQ3hDSHZxcXlUeTZjU3FZck9KSllaakRuR1Zu?=
 =?utf-8?B?dkU5TC82ZlRQQWo2Z0tMTW5KMEk5QzdlSm5Sc3ZFR1VUeGxkVXZkZDg4NnpO?=
 =?utf-8?B?V053VlBPQkxCSU5BeWZHUHJjdE5sUTJ2elcxRVRXNEM2bGFrbkpVdk41N2hl?=
 =?utf-8?B?RkFaL1ZCdTZTcGlKTG5wZEtEakRXbGFHTXlOaG9rTGdjcmpiYkNsK0tHUU1E?=
 =?utf-8?B?dnFaNjJUZzRuRXFQY3FxZHJrdW9Ib1BZT0J6UTVzb3I0MUlLK1BkcFRWN2RZ?=
 =?utf-8?B?MVlCdFkzeTRLdXMyTUd6UFdVNDdna21ZZDFWSU1GaGZERmt0MU14RVRTUjBO?=
 =?utf-8?B?eGh5cU5VeXMrcTNTY2hiZk9Bbk9kc1VDM0cybno3cUVwSkJJK21sVllDVXFU?=
 =?utf-8?B?eGk0NHF2SXkwd3RhVnNVSU12N2E4ejVwaFdCbHE0eFFsRTlKNmkza3AzdVZZ?=
 =?utf-8?B?TUNZNXZnelJaY0IyTVkxNm9MWjJ3eTYxNnVNcWF0SUNoM2VRR2UyeS9sTWVa?=
 =?utf-8?B?Z0EwM1hCaTYzcWdrVTZMNURqTXJwbXZYZWp2bjB4YTlRVlMxVVhneGhES2hK?=
 =?utf-8?B?STVrQU9zODlzOFFQL2FwL2RmNm5SdWIySXVlbEM5K2VyRFFud3Z6aERRa3Yr?=
 =?utf-8?B?VHBPWENKZW5aWkMzZHk0a0w1SE5DUWlyUjBDNHNCbkVodHFnc0JDS1RBbHcv?=
 =?utf-8?B?M3dVQVZKaGhYVk8zY3E0N0thQXJCR2krbk1ISTdSUlowb0EyMm5xdEJwZVkx?=
 =?utf-8?B?Q0Y3VUdvTkhWRDBpc1RKZk1XSWRhRC9lNFhhOHVaTWgyRWZ4bTBjakJjbS9O?=
 =?utf-8?B?aEhZemxYU0hwVk1SMFRHZ3N3WmhzMFhpWGgyZ21kZHVHTFVTOW5pcVI4K01E?=
 =?utf-8?B?S3p6U000STZNY2MrQVRmazhCQWlJSFYzMG0rdUNrZkhQWGxDdUVOKy9hWWgv?=
 =?utf-8?B?T3V1NkNsaXRQa3JwMUN5MEk1SWtzc2xQREYrVnAwL2VKRHdlcHVCSkZMNzlO?=
 =?utf-8?B?QlZRcU9wQzk3ZloxcUZNTWh0K1BTNTZHK2pQWXI1NjlTYys4Q3k5WTJNa3Qr?=
 =?utf-8?B?djNodGpJV2U5QWtLS05TSHpCcnc4QkhBS0Z5cDJzMUFUVkFKaDl1Q2FjdEpW?=
 =?utf-8?B?ekFxSmZvdFJSc21UeGZlMlVtZWptQlRkUGMwQ0xBV0VSUDM1citEek10QmpX?=
 =?utf-8?B?c0lPSGZ5azVNWmt3Z0xVY0ZGek9mc1d3SmE1eUs4dnBtSFcxVC92RnY0TitV?=
 =?utf-8?B?TVdVTzloUExMVnV2RTZpc2VLdWxoVmlEcS9ucnY0QVkxN2FBTDM4WThuSUtX?=
 =?utf-8?B?RlptTkorcXg1SkJrS0hhUUNzWHJkQXd1ejVJQkw0VVJYODZHNXFwaG12NGU1?=
 =?utf-8?B?NHR5ZTlBZ2tBTWNpTU5KMVIwOHViUnBEamUxM0gzcU13RkFSNmZWdjR6NHN1?=
 =?utf-8?B?Sjk3RXRLRk4xeTNoRDZRZWNWUldDYURPSXUvRWRUR3R4aUZEYzdBZWVwRzR6?=
 =?utf-8?B?R2tmaFV2V2lhY0kxMEU4QVBTZktKd2RlTVAweWNvYlE2Nm9JWnJNSkhDMldz?=
 =?utf-8?B?dE9UODg2b0ExM3JtNnpQYzhMeWthWE9GZUdERS93Vi9yaDNObzVjVk5OVTlt?=
 =?utf-8?Q?ajDa0BCYNRnZPKu7+QaDbkU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 749548e6-7641-467f-adb8-08d9e25bcf46
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 12:43:40.0177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyMiJhtGMIYKKDvCWdo0e9+8WbKEuNEpDu47s91c+Qralx73n+2rFl8aLZGqI5rXOQmlTS//6XMzLbSbXMxESg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6372

On 28.01.2022 13:03, Anthony PERARD wrote:
> On Thu, Jan 27, 2022 at 04:57:20PM +0100, Jan Beulich wrote:
>> On 25.01.2022 12:00, Anthony PERARD wrote:
>>> clang 6.0 and newer behave like gcc in regards for the FILE symbol, so
>>> only the filename rather than the full path to the source file.
>>>
>>> clang 3.8.1-24 (in our debian:stretch container) and 3.5.0-10
>>> (in our debian:jessie container) do store the full path to the source
>>> file in the FILE symbol.
>>>
>>> Also, based on commit 81ecb38b83 ("build: provide option to
>>> disambiguate symbol names"), which were using clang 5, the change of
>>> behavior likely happened in clang 6.0.
>>>
>>> This means that we also need to check clang version to figure out
>>> which command we need to use to redefine symbol.
>>>
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> The "likely" in the description still worries me some. Roger, would
>> you happen to know, or know of a way to find out for sure ("sure"
>> not meaning to exclude the usual risk associated with version
>> number checks)?
> 
> I found f5040b9685a7 ("Make .file directive to have basename only") as
> part of LLVM's "release/6.x" branch (and "llvmorg-6.0.0" tag), but not
> in "release/5.x".
> 
> https://github.com/llvm/llvm-project/commit/f5040b9685a760e584c576e9185295e54635d51e
> 
> This patch would seems to be the one changing the behavior. This still
> suggest clang 6.0.

Oh, thanks for digging this out. May I suggest to replace (or delete)
"likely" then in the description?

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


