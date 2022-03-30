Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E434EBB07
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 08:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296052.503933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZS6r-0005Wg-6T; Wed, 30 Mar 2022 06:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296052.503933; Wed, 30 Mar 2022 06:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZS6r-0005Tg-3I; Wed, 30 Mar 2022 06:47:13 +0000
Received: by outflank-mailman (input) for mailman id 296052;
 Wed, 30 Mar 2022 06:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZS6p-0005Ta-Dl
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 06:47:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 385de07b-aff5-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 08:47:09 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-1j0P494_NIS9vdIKgINR6A-1; Wed, 30 Mar 2022 08:47:03 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB8349.eurprd04.prod.outlook.com (2603:10a6:102:1bd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Wed, 30 Mar
 2022 06:47:01 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 06:47:01 +0000
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
X-Inumbo-ID: 385de07b-aff5-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648622830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YmTMmwd00tZOgY9P/GKREsDxPKBNgOei6ZTa1vvjE94=;
	b=M96HZeeEeUuSvbonRptboWDP6FgPNNF3AMJKOFKfMjOgi4eanZFFVZqUYNFYl9QXNHU+Bx
	sgKpoYwn0Q4Yj3t8I4hift4tcsabhnzvtZ/l9rdCwRK3O2NLa5xc1p0oDX+zWQIC0e7UJn
	4XIjZdT0lsq9nkaG6Srb+bYtEfibaWw=
X-MC-Unique: 1j0P494_NIS9vdIKgINR6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dsoi6STj1NVlhIm/F5yl0CEjWXQGyUnc6OflTA0GHweLtMezsdCXUrGVUvfPBiy7D1rgSqKmWNZn1QF7UOnykER7h6FrzpqFW3ZsWfCjU4eLgM41Zj67AJ5u26nNsniQRyaemOHgi6FM12NG4xk7Ik0OM9mgi9AjmKBusVbsAOaAnWeTlkuxwSNgabpMPtxr21N3Eycc4XTdPs8RBOzB7EtXIKLDgGFOF/Gb70zQN4RgCzHy2yFBIynGOakI4LeJGODprEJN6pmv2Rgqav3XqnMnCZmW5YySNpm73yAtW9eXB2OWmu3ScLgzuc1tGZ4pbVw8G+lVxwEeFSgQQDddsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmTMmwd00tZOgY9P/GKREsDxPKBNgOei6ZTa1vvjE94=;
 b=HMRm+if7EgQATILeEOzaTif+xtuhMieGRi+8bpbXuPAdVPj91eLEgLoA5AFaa2P/AEFwtoLswxB2cNKLDoIWEe/gb40rO69wsRJzEYfz652KJajdrL6yTToyjZDLAOI0h0C1OZK/tI8SEaNgILWXaeffs4OGKHMa9S2WQx1GIIuzQFLqSx2fWVgYT446G7dt4Abc7nMMndG69CCB36BlJnZcEdiQowGuG2EiEM8A8ti5vIqMV/kIVurKb+IzTmHhE+7kFQGjLrlzrY0kjVBKqxhfuCCFM9BeIKRcJM8tvR+iOTc+K1qrBdEQU9ffUudr6oUU06xviRUDdOpOLl8nng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b20fd202-0fd2-ad8a-58dc-1ca83b8da444@suse.com>
Date: Wed, 30 Mar 2022 08:46:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/3] x86/mem_sharing: option to enforce fork starting
 with empty p2m
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <JGross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
 <04459197-458b-8d10-2692-981495c0e243@suse.com>
 <CABfawhnKL_7iBiOAHLjtKhH6sCDRfrLcNS_kr3YSLr=XdQdUGg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhnKL_7iBiOAHLjtKhH6sCDRfrLcNS_kr3YSLr=XdQdUGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::12) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 790c49bb-74cf-4d8b-33b7-08da121917c8
X-MS-TrafficTypeDiagnostic: PAXPR04MB8349:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB83496DBF78A395E633BAFE6EB31F9@PAXPR04MB8349.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pvk1fFPLofYKH8emWKRh2+RDAgrIX3DOG/xuUEAhCXSBw6acy22rDdzJWZnrFrx8Qxk6xD3QLpq/m3qQDnxxPySP0PzrdGOXjPPTkXVX8BY32p85VFYMJ+G/nIyVLAwIMgAhvLlJeNkt2qElezpmc5Vcywc4ojbEfTtWbPsM4Yqm++WW7pmgmN2sW7h4BYNyoRs6a1cEN3YxtyOJOIT1WP+LC0Z69rdtJdKOB0XLWuIAvJuX6r2Bx5rxiXIq/aYAIqOvNIZatDmIX+oibEdXpvEL6xxi9Wi+0X3o5pvFG324dYrgIAqy1nRHenofG/vDWoroRXBlReCZpamvOS2v1zBSGIX6tGxgICmW+71x7CNnuIkJFzvXuLTAayigW0GblY60MCp2gMUfAYCD+1mfjhMeO7fLNH1JerqJMrImjtd5aM/7077w+RRs7iHVWgftae0uqLYV80W4lhYjexBkSV/JahpnIzjkKDtotvIl8uAvObYYQRWXqDeEL/1HqIuCN1S5Hx5jX7XP36FkAAAdPRycEun7jRjwrieCnwAWf24N9I0aLFJN8JdQBXjd2A9alJcr57EXDtxlEiPnaphfkiZtH8hGo9QSBO0y/gGuQsjqEO07yuVKiQaWSICFVb8MQllI1qULvr/LNK3atHAuNd8gSj0jXbyHv1KWaMZKU9BCcg1Eh6/9FIEy8YSOymSi+HW3xMBEP9CM/ywPN85vAR1jn0CviKL8nx3DRFB+2asopQ5cuhonXpAShoqtnu2Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(2616005)(6486002)(316002)(38100700002)(5660300002)(7416002)(8936002)(83380400001)(26005)(31686004)(186003)(6512007)(6666004)(508600001)(86362001)(53546011)(31696002)(6506007)(2906002)(54906003)(66476007)(66556008)(66946007)(6916009)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmhQZEQxa0FmbmFvbSs4d25lZ3RxelkwSkxuSzRhUVFmL0cvZHNhSjZOSWdU?=
 =?utf-8?B?SHhiY3BpK1UwN3pGUnZPSTVsTUNUWGtFRTBtd1Y3bG8rRlJUc2pIem5SQTR5?=
 =?utf-8?B?V1FGemhQWGRSVjhXVW9zRDVJenl0YzQ3R05hb3ZwaDEweU9weklaaU1QQkk0?=
 =?utf-8?B?OUtoZzNpclVyNCtUQVgxR1gveHhESFdzQ2xnM1VKM1dBK0pNSmtKVTRLeGlW?=
 =?utf-8?B?VDhMYXlQeGo1TlNLQzUrZXBYVkpFdWFOUE1CNXRVL0dxdGVkemFMV3hmUytV?=
 =?utf-8?B?aHdmT0NHa0ZWK2hvKzFsSGZ4MmFPQ1ViY3J1S24weTNUUWhYYy9mUHhNeERw?=
 =?utf-8?B?Uk9QOGExQ1FmSk85aXZIdTdKNG5NdmNEMHR5VVUwdTVYMjVLQUt5WHl1dGsx?=
 =?utf-8?B?NVRIcnBXUVY4a2t1U0YzWm5Nb1RhdXh4TTR2L0ZGaUNmMHJuRHdXczZHN3JJ?=
 =?utf-8?B?ZmlXMWgyMDlTaVBDVnF5STh3NEtRNkN3UXMxZ0w5VG15bHV0VmpMSU96ZEMz?=
 =?utf-8?B?cFoxTnlSQ29sczZ3V2IwUm42SVJzS2dNZUlpZVpZT0s2VW1XMWtnZDVwczEv?=
 =?utf-8?B?a05rYTlxUjIvcnBNMGlRbUIzbUtqUnY4NzNKanNaSXR1REZxMzVtRVJqSGR1?=
 =?utf-8?B?eUNLS3FtMzY0VGRBRDZLdXdBVmZFYzdjTzl3NFhIazZ3TVNNakNVaW9NTUpX?=
 =?utf-8?B?MEVQMVRtR2lJMWpDUzB1bjhBYlh5RTNlL3FmQ0Y5Q1BSYXB0djgxZ3BmaytJ?=
 =?utf-8?B?V1dXZHR2WXZNVVBQbHhxOXdoaUpFbnlUN0EzVlRQUVJEUnZGcEljNWpFOXph?=
 =?utf-8?B?MFp4bkRGUTlmZk9Kb2o3cTNlTDI3NGxmeTNiRDN2aXN3MGdvWnZ2RVVEeW1n?=
 =?utf-8?B?QndTZnkrelE4Nmo5R09ldVZFU2F3ME9CNUNwTk04UXRSNlpudjlpY0F4bjBG?=
 =?utf-8?B?OGxIc3V5NWhpaklqY3lQY1Z2VUN5N3djVytBSWU4Rm1ab3ltZTEyRjV3RTNa?=
 =?utf-8?B?aXQyUm9seEZhcERqRDhETm5hUW1UakhPVzhodTEzRGNOMERkeUFhTWpPTWs0?=
 =?utf-8?B?QmxMZXhvdDNiR2xWSGFac0syUkh4RU9ZaFNKWlczUmVSS3h4VmYxVDN4TkpX?=
 =?utf-8?B?N29ndlk0d3F5RkdVOUxBVlNWSzNPaWR1c1ZqMkFDaUdNWERpREk0ZlpxeTBV?=
 =?utf-8?B?WFZiWHpBZERrZ3lLN2pTNjA0RTRKaVNhTjVsUFZSbHgvM3I4NHR0L2NHeWVI?=
 =?utf-8?B?cENvK0xkemNGQkFqbGNRUWlkeCszbXR5UlRmbXJxYklpK1lsNjREOGJWUXc1?=
 =?utf-8?B?RGNhYXRlRmEraW5qSS9uajN2eUNlOG1qYWMvQXg1cTYzNSsxN2p2VUxDK3ZD?=
 =?utf-8?B?VHg4b1FSR2VqRngzeVppYW9GUG44ZnN2RU5YSzRXekJvcjJwaElOYTZ2OUhz?=
 =?utf-8?B?U3dkYlkvYmtCS1pFTTg1V3Q3QWVLanJPOUQxN3lMcndrZ1JrSkFYMm0xZWZK?=
 =?utf-8?B?Y3FISmc2SENRcE02Ti9yS01TZzlwa3FWNFJKNDlmSDJ6S1NKOE1hSU5sK25M?=
 =?utf-8?B?ZnEwbURCNXloMWd5Nm5MMlF4Z0E3bWtxdHl6ZWU5TFFXdzhlelBUVnppYkFn?=
 =?utf-8?B?amhSMitBTERhVCtuTC9GaThHQldiTjd3eGRDUVJKN1RoTHN3YlYwbEZUdVRM?=
 =?utf-8?B?a2txVTBzRVNqUDlYTWErSUZnZzBBYjFGMmdTN002bmVsTEQvZnZvbUYzeU51?=
 =?utf-8?B?Wkk0dkl1MXY5SHQ4bW9BMFd3cGpRRjJtL1dEWXdyWW9QdWt0RmNhYVQwSVgw?=
 =?utf-8?B?VU9mdFo2UjIyNURzYzUwaEN5QzhqVVdPbG1OMk90N0psbUtxa2JqcTRBUUhW?=
 =?utf-8?B?L3plYjgvNWF6SERiYzkvNFFBS0R1bG1qL1NXaXRjbmQxSVdDSk54dUd4OGNF?=
 =?utf-8?B?VGRnaUlPZEVrS3p2YlFMc1ZqZldjQWdvbm1PcHRkTjBQMkZxKy9xTDV3d2sx?=
 =?utf-8?B?R1VEWU5La3pUc3RHTXF1Tkt3VjNUM0lHaW1FcDhjTkZyNngxcXFneHZ5aU5F?=
 =?utf-8?B?RnZha29RcUhGMysrL1ZMY25nS0lWQzQzR21VRWxFWlFTK1BEMitRS2x0RXpy?=
 =?utf-8?B?c1hKb0RUVDRVTXFkN2VBQmlWUkRjelFDb1l2RXRDL1B3UHpWei8wc3pDb2xl?=
 =?utf-8?B?MWt6Z2lmZEpjMDNpUXRuYlBoQys5NnV0UWdUeklWQ2Q0ajFMUGlCYWMrbHVT?=
 =?utf-8?B?Qm5CbzZXNXZIa2Z3VFhrNTVNd1duSHo5eDhROWJIZXlqRUp0STFjZS9rb0k1?=
 =?utf-8?B?Z1VaZ1JwdkNXL0QrYmQyTFk0R01INmI3R1pyK2RzU2x5VlN1Yi9oZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 790c49bb-74cf-4d8b-33b7-08da121917c8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:47:01.0699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7+DpVTyg44fyO4C+Koma0oeUsat1Upe9jqRX14IPnM7UhfItUrLw8gaArBsZiUN2ud/aGk1aSUG3mdFBE9tFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8349

On 29.03.2022 18:10, Tamas K Lengyel wrote:
> On Tue, Mar 29, 2022 at 11:42 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 29.03.2022 16:03, Tamas K Lengyel wrote:
>>> Add option to the fork memop to enforce a start with an empty p2m.
>>> Pre-populating special pages to the fork tend to be necessary only when setting
>>> up forks to be fully functional with a toolstack or if the fork makes use of
>>> them in some way. For short-lived forks these pages are optional and starting
>>> with an empty p2m has advantages both in terms of reset performance as well as
>>> easier reasoning about the state of the fork after creation.
>>
>> I'm afraid I don't consider this enough of an explanation: Why would these
>> page be optional? Where does the apriori knowledge come from that the guest
>> wouldn't manage to access the vCPU info pages or the APIC access one?
> 
> By knowing what code you are fuzzing. The code you are fuzzing is
> clearly marked by harnesses and that's the only code you execute while
> fuzzing. If you know the code doesn't use them, no need to map them
> in. They haven't been needed in any of the fuzzing setups we had so
> far so I'm planning to be this the default when fuzzing.

But isn't it the very nature of what you do fuzzing for that unexpected
code paths may be taken? By not having in place what is expected to be
there, yet more unexpected behavior might then result.

Plus - how do you bound how far the guest executes in a single attempt?

Jan


