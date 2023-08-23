Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844367850C3
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 08:44:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588943.920601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhbh-0007N0-Ac; Wed, 23 Aug 2023 06:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588943.920601; Wed, 23 Aug 2023 06:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYhbh-0007KU-7O; Wed, 23 Aug 2023 06:44:45 +0000
Received: by outflank-mailman (input) for mailman id 588943;
 Wed, 23 Aug 2023 06:44:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iSH1=EI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYhbf-0007KG-62
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 06:44:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89f17df8-4180-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 08:44:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8432.eurprd04.prod.outlook.com (2603:10a6:10:243::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 06:44:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 06:44:39 +0000
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
X-Inumbo-ID: 89f17df8-4180-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpGwkopt+2bXQXdnd/os/aQFRYbMVFu3KUqChpGQ3Q4qvRW9Ruene/zQZ+9eEVczwBKdPjQcW6RR1sNjLeQ2FxUFpX5qAtmYsArYvrSiSbt3cJ5w0B34ZseXPWFvGRHcbArSZEyIWISqr762OPgb/tRXM/9z90hnyatzv2NbaWjZi63A1RpQixutmE3habsztLfOJWu49kaQIs49WpvRF1yfA2srOqHm8VoQrHtCX3tZZdsU1IWgZec+c5K81dYOGpBqVWSoIgeT08zhBbk7iJ0tHSUviQC8E0DoysyZOPjDT+m2C51LK/DZpreicoZQYh7q3exXp8lbcSCMCnlv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjL8phfs8yZ7oxcefTCszhz3o3NCvSLL8CNDgov9eP8=;
 b=Xp4iiVm0hhukrD/0FUzceMf6/Eq/9VPUaFGctlhmvgU8OJAZsWh+s6T7rYxyUGxq3z8XXPyv4Sq+JgRkccaXryOMwUkB/AHreqno14u9aHNi/KARJJ25C/6LtHgigqk6pfN4m5Gt5COEp15TpC11CAJBg5N1r56s2ZY54Nd/3hF8KMybvPzulPodcnh4FfjM0qvJszAfxb5oOArgBNM9heqo+HnWDwj0S78UtY4d8S5vHczuAfxL5LZcS7Pvh8f7oohL0QAmKPZUNRKCnFq0MQMX5Q9aofyIsH2VwNL9cLWyWiOGqta8Brl5hEBMMoV7Sr3MFAU0bXGXecXPmhinog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjL8phfs8yZ7oxcefTCszhz3o3NCvSLL8CNDgov9eP8=;
 b=BPflQgQiQ0siOpF01G/1J0z2CmxbnbJHykNMQk3dJc/Vh1skliNY1dgLVtPpeSIVNhQa0FNsyhU7yL5NxxPeDdguPX46DhUP2BqCZJQz/SFnnCWMswa7pFGSEwRdMd5LitN9sozVmp8xGAd1Rfk4y2ZHw/N9Ffky5tlh2aShCGltKsTcyByjjq4feZRYKOpKWSkcYlPAufSubIJcUnZkbDM7Ek4CPQbR7nfRvbLlinglHLS8g/ljPPDNCWG8FwGzSmZvZImxHHcNbv5+YEEOZ3KVTiTnGiWetpcLmNejfr1NoxpV3DUASXlq9kFXV/6kwdeabVh8xxy4yZ2lq29VdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb370876-eacd-e637-2562-20266e4a96b5@suse.com>
Date: Wed, 23 Aug 2023 08:44:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] docs/misra: add exceptions to rules
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, nicola.vetrini@bugseng.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230819012410.1754839-1-sstabellini@kernel.org>
 <5400f672-5ae6-4559-920f-5244bcd83c57@suse.com>
 <alpine.DEB.2.22.394.2308211803170.6458@ubuntu-linux-20-04-desktop>
 <1fd0b3b6-0771-66ad-9b3d-85358ab4102c@suse.com>
 <alpine.DEB.2.22.394.2308221712070.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308221712070.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: cc26a66a-983d-4a27-c214-08dba3a46c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	47jgaV/yoy6H8SeWZtnhgJC/ffMzfLbjnuZIa54W80MjYW8162F1Bfh0z57A3fYwPlijxclTCoJPdHcoCr/2xOK9Y0ezx9EdVV/sN9A4nrceIHjkRe5ChpNIPj1TT7bdBT5BT9Aw131frrEbRG+czgK6wjomxn6EJnm3c8n3zUcRFFQrYM/0r0hgU+MycdX8AXV45iYIMdObxSM6kEv9VXrMC7wnTvnU53PW7Y18q8Rv2o5pkYOqkRGm6psqVROhzk+o5FujJMh/yqUyxP/Ooifv3++HfDRfe5iQvZnAm4A1RdD8C3wi1qRWqEjcZEIFdCwolqdKf7Pp8gtlov7+yTOaFX1JEffpcc08bDq7fGg7dfVVVrZ7ZNDVxERCf02o4Dwqz5OCNwdH0HKq4VJm3Uf7q2EWA6g/nn9H7ZLTXBNCaAP7jIfKSDVmWH3GaPq1XWf7K9KJKwVlXcGmUJa5vCPLrHGszZ0CKvtdP188DDQAEf7auvZ2TP2VaAwPsZ8V3UASII+ArJMLlQO0ALqhJfFuN1DkwUGL4UNdLxrS+W16HN9K/U4zcXytz0LhgVVVqIVoHT10gMgVlpaUvBFdG/eFu9ozt3OekcQBFpUOBxKJauaEozPBsnR9tLMoVJh1eetnOrfmP4lY4AG+Lm5ShA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199024)(1800799009)(186009)(2906002)(4744005)(38100700002)(6506007)(53546011)(6486002)(5660300002)(26005)(31686004)(31696002)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(6916009)(66556008)(66476007)(478600001)(6666004)(36756003)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STdlbkhDbHBDeHMySDNrUkx1ODZ2dEVubUVOTkYyVzRGaktCUkZnZlJPNkJx?=
 =?utf-8?B?Rmo5bGRNNTZHMWtYWTB5MXBvVit6RFd6QmJzeUdBLzNTdGJ0U05wWHVQM3Zq?=
 =?utf-8?B?V05XSnpYcmE5aHFKSjhkM2M5WjE3MmtuOS9jRDVpV0RpMXpaUnhWdFU2a3dJ?=
 =?utf-8?B?L0VpTy91Nmk2Qmp0OFBRMXFMOE1XR1VEaTVFdnBTUzJkcTRnSFRhMXVMYVhl?=
 =?utf-8?B?c0grZVhSamlHaUJCTjRGdXZCSEx3QjR1dlpsS1h4M2k1ZVM2ZEVMVk8vQTEw?=
 =?utf-8?B?bXU1MnBhQUhHeU9zbWNsQXJsQWJxc2pVS2c5MGRndGlOcVlQby9RT3UwWFlh?=
 =?utf-8?B?NE01b2Z5c3QzRUpCSEVTZlE0K0t6Wlp2aWVUQjl6OGVYM3Vka3RPTTFwc2tZ?=
 =?utf-8?B?V2l1NWxlRW9wWnVOY3pDZEVDUG5ieXJXWHI1b3JIREN2YmN6R0s2UEVaN0kx?=
 =?utf-8?B?WkhLN2VkTkpyMU05NExuYUhDQ2xZdXRRbHMzS2ZDZEVnR0MwOWdTbVlMYTZ6?=
 =?utf-8?B?VEI1NHByYXlETVY2eHlXNDNpWHhVaTEyUjNsMnhMK3BoQWpCd0ZaTmswUmh3?=
 =?utf-8?B?UThLZFhwbjE2OUU4bHF3WU5MaXlWTHM1UWJteWRSSXNpZFIzTGIwOGVzMmxS?=
 =?utf-8?B?TFVPaDU3d0lqN1VyZWpZRUZwbUdPaHNvS1JXYklNTkp0L2E5RjBkdFcwZjFt?=
 =?utf-8?B?SU9oem9MVG44Sk41YkNaNVZpSm82azl6aDhmWDVtb2loZE5rY3Jkbmp4OG1r?=
 =?utf-8?B?OHM5YjdiQmR1OTl2TkgzT29LNm9RYm5aOU9kUDIwZm9SaG15WjJqSDhLUnpT?=
 =?utf-8?B?UXZYbEhCQi9RdFNRdlBtdEM3WUNHNmNkem40WjhobjhYVGt1dGFkbnpLN0pp?=
 =?utf-8?B?VVZlYzBBTXBDSzRoeEVLL3ZZQm1oMWtnY2RFQ3djUnVxd1hFK1RxU3pHc1VN?=
 =?utf-8?B?MWJXYjdSaEdlRkd3SzNrT1EwOXJteGU4eEtRRWxxY1h6VFJueURCYStJUzVr?=
 =?utf-8?B?TGdhbXFNVUdvOE9iVitWbXhDQmkzUW5DV082eWd3azhXQnZJYW16dFAzaWQ1?=
 =?utf-8?B?RVZ0bHRIUGpnMS9lSi83amhwSWk5d3AxVFN3cFpBY1Uxb09vUG4wT1ROOHM5?=
 =?utf-8?B?UHN3Q0NEbXJwSGdEbzdrVGZrc0c3U1FIbUdkbzdJbEI4TTlLZFN6V04zOUhj?=
 =?utf-8?B?WWFueFVoTFVoZnN1V3JOKyt6eURrRXJJWU13QTFRdTRsNlVhcnNUNFEwaFlN?=
 =?utf-8?B?YkVsUFlRTnlFS3ZxUmNycG5sVDNycEtZYWZPS1hRcXZrOVIwRG5wcTd5ekFW?=
 =?utf-8?B?Zi9YcW8wU0d3anRGRTlCckNhc3dHcXg1T3JDbnRuTzhGVjJaVHlGWTN2Q0R1?=
 =?utf-8?B?aXNsWGd3WmR1QktoVzJwZTArVEFxMHF5ZnU2TGpjNWNOQVFvZXo2R0JZaHdF?=
 =?utf-8?B?OUllZ1BXWUFXbEg0VVo3R0VEWmo5RndEVFUrWWNRaVpaSjVBSnFzMklzS05o?=
 =?utf-8?B?V0Y5Z3ZBT0hyNjV0cWVUMy9hdWZmbzJCdmpxQk82UTVlenVLdnRUNS8yVlJh?=
 =?utf-8?B?RjBnTGZRcm9kd0FEekV6aDI5REdkdExQYlNsVFVra3UrZERBc05iNHNpTE9q?=
 =?utf-8?B?WGM1ZTY5d2lVZERlUThDZHg2cWxjZTdWTmJmUnNPbXdvMnpRdlpTSWpNZ0lJ?=
 =?utf-8?B?Z0ZVVy9QL2Zjb25Wc0V2eWx0UU5xOEZuTExlRGN2ekF6bWVhb2JYaHhqQ2hI?=
 =?utf-8?B?L2h3aHZTeDFHcW9iRU5BSXRDT2dHa1R6MTd3MTUvVzBIU00rSWJrRDZjS05U?=
 =?utf-8?B?UGZ3OEdXMGZnaXNsaXNVUTN2eEJuR3dyYW5ZQmRzaWp5L3o0czBFZ3Vlbm92?=
 =?utf-8?B?UmdBeFJIWXJYMW9Ic2FGczhvMnhwNVVzS1BGbkpielZsV05nSHZUd2xBQ1BU?=
 =?utf-8?B?aFdJb3VGdmJuMDBzSklWaGlJem5mUjQ0TXR0ZlgyQUFSMjFCaEk4NXJWbEZV?=
 =?utf-8?B?ZE9keW9MSFUwcHhDbE1IenRhTUhaZ3dyTW5XSnZrQUhycnhHb01UUnp2a2RV?=
 =?utf-8?B?TlNzenM5a3d2a0dHUVQ5RG9INm9HMWVoTUF3N3JodElOSmxsZ1o3SmZoazNi?=
 =?utf-8?Q?rxMIiXUIX0pbuxNkTNcRnoE0v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc26a66a-983d-4a27-c214-08dba3a46c2f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 06:44:38.9323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBoCJEnTEvFgmV75lhGpqBXFx3VMNa63UarBRTpvFJd4QjWYGXSeEWCEtDr/1ZjAI79hfaJK/XMy6pLLkbex4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8432

On 23.08.2023 02:23, Stefano Stabellini wrote:
> On Tue, 22 Aug 2023, Jan Beulich wrote:
>> On 22.08.2023 03:40, Stefano Stabellini wrote:
>>> If we only mention BUG, we are basically saying that as a general rule
>>> only BUG is an exception. Then we have a longer more detailed list for
>>> ECLAIR because in practice things are always complicated.
>>>
>>> On the other hand if we have the full list here, then the documentation
>>> is more precise, but it looks a bit "strange" to see such a detailed
>>> list in this document and also we need to make sure to keep the list
>>> up-to-date.
>>
>> Thing is: This list shouldn't grow very long anyway, and also better
>> would grow / change much over time.
> 
> +1

I assume you read what was meant (wouldn't), not what was written (would).

Jan

