Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999524A837C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 13:05:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264660.457823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFaqt-0001Qn-Fz; Thu, 03 Feb 2022 12:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264660.457823; Thu, 03 Feb 2022 12:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFaqt-0001O1-Cn; Thu, 03 Feb 2022 12:04:39 +0000
Received: by outflank-mailman (input) for mailman id 264660;
 Thu, 03 Feb 2022 12:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFaqr-0001Nv-BC
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 12:04:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7478859c-84e9-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 13:04:36 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-S2fY4oEjOeWBBunNbNQSzg-1; Thu, 03 Feb 2022 13:04:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8225.eurprd04.prod.outlook.com (2603:10a6:20b:3e7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 12:04:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 12:04:32 +0000
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
X-Inumbo-ID: 7478859c-84e9-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643889875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RbGtFGAPQdoQUjLHf23UTiEs2aFu9ONuIqPMYyI9F6Y=;
	b=NoofWdtp/fC1UMMUp54cfNu2LQ9VI0J4ISfyZcRE/FVMhdKft0hAjoA8hL2LyXX3KWNnKt
	mM52zJWuco13uQUZZWRawIcgOM7W3qvusPk34KS00lUIEbEYqWwm5ynxGTVNEsm57WRIBr
	zmX2VyLSgHhUqRgE9AhET8T14AM1KxA=
X-MC-Unique: S2fY4oEjOeWBBunNbNQSzg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OthmLkaoqR8xxbs49opU5o5EyH9mwraeOMdKKH0F+pH9XppDp7J8fyWZElRu1tn8UbcGAytSa9jK7sfFcJVL7OFpwjxzIh4YLhcSOKjtVzPaEOtfX1/T2y+fM2yBp3Esacb7t3sf49JrQpf/v+xqFkcjCbQAp9dYlwVz9/qNIcAQOq97C/qYfHhv039vJgM0+EG6cjKK2EsWPWCCGG+PhO9fDIEg8I6Q52M9bEPNro+R5v4ClFQ9r5Zi94CK+yMTs2ScwQ2HARC85NaEs7cST5sPTIRnqSGf6NiuSJnved8Zka5KmMgn41Xx2W6rxBpzr+b4UlbsMkBAeB28q5+16w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbGtFGAPQdoQUjLHf23UTiEs2aFu9ONuIqPMYyI9F6Y=;
 b=b6Ia9ajXC0T08YqSXsK5ZVQnuHJSvAHW2znfhUcsWNNTaLXLR2/yYlAskp+XSpkPDoqjfpO4kZq56HjF3sMZ6V6kuicCZwJ/VNv5mOpJ6zzkh8998X0U0xPepPzwwR8gGgeb7Ofg60HT1ObbT2AFD1DRpQU+L4byu52NTMr0RSSdwTC+CPVwWn0u3Xif6aDFl1TJaQBXD98ylgxnUwXV/BZ4KNaZZgIVKtua/IV1x59U/lc33NFzWtVQLexzIIX6tUxp9bvl3FAEaYavJTuVriQmIrK/lEgLWNcP1zC9RI0/dBjShb6rIm0pTCdIqTo3H+lFzOKbbSic0L2OpDF+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b14bf41a-663c-6522-8596-df9377d69fef@suse.com>
Date: Thu, 3 Feb 2022 13:04:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen: add option to disable GNTTABOP_transfer
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220201090239.32067-1-jgross@suse.com>
 <2c3c7da6-0239-1999-3cb4-a5f49745c6b5@suse.com>
 <93d0c738-df71-bfc2-445a-7b892884d8f3@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <93d0c738-df71-bfc2-445a-7b892884d8f3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0091.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b05b0a6-d584-4663-6008-08d9e70d56b9
X-MS-TrafficTypeDiagnostic: AM9PR04MB8225:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8225512065A20A39BDE27812B3289@AM9PR04MB8225.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1AhIJG2Re1sUzKW821K63wrPCWmndJ7Uz7iMlCbDtsBVhh8uL0whHU99dx0q6Bo3Ren4qyLIjF7fSCCqAgrPzZEwUgGFZbttp4leNc3BRfWanoSv2CP+Vy1FfIJtLh7FFZ4YzxOf775FaK5BzbiCTm86oRzutFiN1CYP6/x0gMfy2EmU90SSuEi0fmP1LRfeKszsKLaDn77tnovQoV6n2IOzefHqFeiXWg7QsklSO7FMs7UhLNjTmYUClAyL8PxgyJR+mAGusGM8Pbphmx5JJgubqyGsPimN4p5WprVqU6VBGxlUiw2rrY1pE/ANeufKMk8epSWvulm0MSBNeSjX5+hnQZpQfJQqm29Yvz2Vkpag7AZDqj9k06pDWwoa+2wZowIjKhdSAXWsf8NpEJH7fNVMWZykLfTh3Z3+PGHNBnTrnLqoMpGJngC14gY6CVF1ii0rdVsUc9kODIEzAq86ZCs6HK9dgFeJlijK+aWJvLT24TaAby0yLWkRedpitU/6nkj0/TliLKqzOgX8ZlJYcoWRQKBqfK5dywgDoeZQ+aYlXDh1MgqZLf84lQ+2FrygyY7wtOa4e0YQP3XfkuBopypI8RXulh649RfhOtYIHYVKp/xgsw8LVcfXyF3mxqns7yHPnjKArnUjTFrFq1yMlOPOyLBqaUlDWzbZ/cmW9CPAsZzPwat6DEwkAfLQtAQLBe9aJ1C4kQPZTsUTOAlhw8jL7JlKmmkzhIZwqerlUqmEh1fMtjlai5G4w3UFWkj8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(6512007)(508600001)(5660300002)(6486002)(66556008)(31686004)(316002)(2906002)(83380400001)(2616005)(66946007)(37006003)(54906003)(6636002)(26005)(186003)(6862004)(86362001)(6506007)(53546011)(6666004)(8936002)(8676002)(4326008)(36756003)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3F6T3hJaDNkQk50aFJrL2h5QnJ2ZjVtOHJlaFNmSnZtTWZUWWN3VXNNekVF?=
 =?utf-8?B?MU9uOFhCN3dGNVhYbjhzbGtnQTlNVDVxY1R1Q1NjMFJZcjVrekxhU1dyQ2pZ?=
 =?utf-8?B?b1ZlVTFYelB3SzM1QWdVUWkyNmVzQWhrMFREU3U3bnNiQ3ZOaE5hZUJZNCtM?=
 =?utf-8?B?ZmcvRzl3SitYK2N2NDlRL21tYmttSFVHS08zenBjNzh2cmdJdmJEVUdpbmQ1?=
 =?utf-8?B?TVBYZ1orVTlsYXdzK3FYV1hOVHZLVC84WGp6YzZFQ0I0YU5ySktuSTFId3Fm?=
 =?utf-8?B?SFhXSTBIMzB5NnNGcHBFKzQ4Y3czSVlwdFIwR0VuTHkyNkZtN0RiQnRyMmty?=
 =?utf-8?B?OXUxeDRpYm5BUXBXL3FZVHF2cERPalhFYVdMd1NFbUd1eUREK05kbUVYZE56?=
 =?utf-8?B?NnZ6cDhhMGRmVW9HU1RRZnhRS0NRWTJWWHVaRTgxNjBaNFYySmJhV1FmcGtm?=
 =?utf-8?B?UHI4NWpDejBIdmg5dGZ1RzllUmgrQktTUmsxYUpsL3JIWmhnc0E1RDdyNFJt?=
 =?utf-8?B?OVI1QWViQW9TNUo4ZHRYUTJGeUcxbVJ2Tk9UcFRKM1hIWkM1T1BxSlJuL0lQ?=
 =?utf-8?B?UDQxZUdvRUErRVZ6aGY2WVFBQWtuV3o0TVViampWZFVhVmpML3NUTFQ2V1RU?=
 =?utf-8?B?eW9xaktzdkloWEZiTjBRTzE1V1o4b2J4RjF3VTUrS2dPRFk3eUV4aGVpWDEw?=
 =?utf-8?B?R1pzNVBXUnk1aDAwZHdGYVU3aE96MTdud3F2QkIyWkxWYTdpbFh2VmNDQ01Y?=
 =?utf-8?B?dG1TanJBbUFFQTBOTDJ1K2I1bTNLSmoyUGZ5NU14WWozL0dTendObUF1ZmND?=
 =?utf-8?B?ek8zRnNkbmt5RVZoaVdDTE9QaHpCM2hoQ3dpTmNiRHJ5TSsyZW14cGF2cjFI?=
 =?utf-8?B?RUFqQW5RSlprcHJJd2QvOHp5V3FwQ3lKQ0pXZVUvMk9uQUZDRnRoQ2JMTkUv?=
 =?utf-8?B?akYyWVgzdjExalViL3NpeC9mdytWeFl5WkpWdDVVc0laNGlzM1dySUtyeWlk?=
 =?utf-8?B?OVphQVpaVzNoR2pCZHdrbVdNdHJxcmg3NHZWMjRCVTNkNmtpbFg1aG9ZK01M?=
 =?utf-8?B?a2h0RnR4UUQ0UlQvckl0N2dVN3JTandvc0s0cENRNFdrOVI4eDFkMXFTSnVr?=
 =?utf-8?B?T2ZvWFgrSTJxYUFxSXBrSFpPa2VRdkVhZU9UT2UrSHI5UHhtV25sdXlZZ2Yv?=
 =?utf-8?B?Qkc3ZVRPdzRTYng5MEhlZWltRWxVcEpRTU9xWktremUzS3d4RURGRHl4dmV0?=
 =?utf-8?B?dnp0d0dTYkp0SDVGTU41ZjdiTWpKTEh0OWdueGViTTFxa1BIaW1vYm5IV25S?=
 =?utf-8?B?c2xkOTdBSTJKT0lqNEo5Nk5lLzlEbTlZWFR3NGFGZnFsOWdSUWJLUjdlemFS?=
 =?utf-8?B?dUZSdWFOUXdhTTFtWFQ4TFNoaVU3Nmo0cituMENuaXBHRE5JUTNwcnYrN2ZO?=
 =?utf-8?B?NG5OekJMOFpoSldWeVJsb1UwczVKQ0paV3JBUldWanVRbWZDNkoxcU95RFIx?=
 =?utf-8?B?VGp2WFc2eEI2dGp5T1FGVkNDbXNVditGeXRZWk9hYnlBdjZYSUI5THd3Wkc3?=
 =?utf-8?B?bExSMW0yM1AwejJjbjNuTHpjdkxuU2NLVFZ2M1BndzlYeTZxaGIzTFZLOWMx?=
 =?utf-8?B?WWVwMmtHYTNyOUxTdnpFZnJhNkJiQlE1cnZoZms4eXhuWEllbVZXV05MZklu?=
 =?utf-8?B?aEdWQWJxT2p6OWdCb3BRdlJXeUVsa0FBaG5ISHcvZk1tSHFIRHYvZFA2V0pB?=
 =?utf-8?B?OFJjbjFlb1JPaFVoWEZzRkNWaTRUTElMbmcvVEFXdGtPN1VKYnRVZnVuY010?=
 =?utf-8?B?bzhwSUpPSVBFdUk2UEc5YXFTajlIMUdVMCtpUGdFZmdpZWludnFwMFpLM1JK?=
 =?utf-8?B?SHNhWTF6NWdrWkFYWjhPU2ZlYjdWNFZHeHVrNDJlMGZjWW9uZ3lVeTRUMjg5?=
 =?utf-8?B?dytDN3JJNXIrVGcxbFAzMmFGcThCVXJYNWp4MUhPRi9HMmVCd0pROHJYZTM3?=
 =?utf-8?B?NjhnN0x2T2hzdTE3ODdjK3FKN003ZDNGSlNLeFg1NUlMaERWZm45NWM2Wkhw?=
 =?utf-8?B?NUlLdnp2V2RaYmxROGs2bGRiRjI4cW9FeTRMOFlSVCtuYS9KVVdiSit5L2hy?=
 =?utf-8?B?d1JMQ3JoRHdwWHlHTE1GZmhROWg1QzUzLzBRQTQzZVJRcmIzY0VtaG5CTThl?=
 =?utf-8?Q?jSbqSLzXhflrmx+C0rlBkMc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b05b0a6-d584-4663-6008-08d9e70d56b9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 12:04:32.6934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLLlgY3nN1F+KQ0uI2Hz+Omu4ocx1BmoMDhbey/uE/mtvPuUzeA6VXWU1lupwrZWJnoczqoxJjxcsX2K48XUVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8225

On 03.02.2022 11:55, Juergen Gross wrote:
> On 03.02.22 10:10, Jan Beulich wrote:
>> On 01.02.2022 10:02, Juergen Gross wrote:
>>> The grant table operation GNTTABOP_transfer is meant to be used in
>>> PV device backends, and it hasn't been used in Linux since the old
>>> Xen-o-Linux days.
>>
>> Kind of unusual spelling of XenoLinux ;-)
>>
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -181,6 +181,7 @@ static int parse_gnttab_max_maptrack_frames(const char *arg)
>>>   
>>>   unsigned int __read_mostly opt_gnttab_max_version = GNTTAB_MAX_VERSION;
>>>   static bool __read_mostly opt_transitive_grants = true;
>>> +static bool __read_mostly opt_grant_transfer = true;
>>
>> If this was conditional upon PV (with a #define to false in the
>> opposite case), it could be __ro_after_init right away, while at
>> the same time allowing the compiler to eliminate gnttab_transfer().
> 
> Nice idea. The other option would be to put all (or most) of
> gnttab_transfer() in a "#ifdef CONFIG_PV" section, allowing to
> remove the "#ifdef CONFIG_X86" parts in it, too.

Yes, sure. The downside being that then this code won't be compile-
tested anymore in !PV builds. Yet keeping code visible to compilers
is what we aim for elsewhere by preferring if(IS_ENABLED(...)) over
#ifdef where possible.

Jan


