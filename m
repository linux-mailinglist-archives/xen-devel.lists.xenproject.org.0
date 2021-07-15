Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501653C9D94
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 13:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156549.288924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3zIh-0000Vl-9V; Thu, 15 Jul 2021 11:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156549.288924; Thu, 15 Jul 2021 11:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3zIh-0000Tk-4t; Thu, 15 Jul 2021 11:13:07 +0000
Received: by outflank-mailman (input) for mailman id 156549;
 Thu, 15 Jul 2021 11:13:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U73d=MH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3zIf-0000Te-PK
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 11:13:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f4c5002-e55d-11eb-88a9-12813bfff9fa;
 Thu, 15 Jul 2021 11:13:04 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-dee0yNkPPnK3tm2FcIJrjw-1; Thu, 15 Jul 2021 13:13:01 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 11:13:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 11:13:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0012.eurprd09.prod.outlook.com (2603:10a6:102:b7::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 11:12:59 +0000
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
X-Inumbo-ID: 9f4c5002-e55d-11eb-88a9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626347583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H24Rhl076w3gp8DB47TIEXFpvq2NqTLzbrvbO2Vcybs=;
	b=VyTr5gzHvuVCWxODXahrK5bAt1/npnNWAaywK2fZKBpPmPjWBoWGIpO9IkWXwqD2avdAA8
	7sEhLGxn0hTv42LE86AxTvgTc3WZifkrGwem1kALhxrQF9cJEgaY95pgNb4EXkUfZL6IGV
	PFDEbHSI5hK8uM88nWhoYOzAI4PBfTk=
X-MC-Unique: dee0yNkPPnK3tm2FcIJrjw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcaMO3ToQU3CyZ5cUarQ46AaRVpHL6iDWHez/MmkDpMbaVeofybMwBmF8dlxJRPpHaTkx2ZkQGccpwTnCxOLwzwso5zGt/6ziJwhLd0jHoyUU0pRlht58WspmODzQHMXyabpGsFbZ9Bo9lGaRgHj5vkySdO0hGXJPpBt3IxShXMZNs9VviTgvkXahPdXjFXcBxUCK9U0liXL3j8YjhzcizGoblvD5x6tAs5JtE8hsmNCOAFbtIMisd/z9KFuaTCB18hPDhBxupV7OyljgeOXkj/J67mn6F9PFwUIfXQuroP5LpDjLLfR5L//GWKTeSea2YPTd4gcXuqzKtdo3nFivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H24Rhl076w3gp8DB47TIEXFpvq2NqTLzbrvbO2Vcybs=;
 b=mhr1O/JrKkue/SEwFoe9RJTTgtTpnVixk7BRjg3vRP+RZdrR0GDPndEtxw66XX+e7dsSq4gvSuR1vXzb6+HQ4g2JuCIwSfybldLetHCc2TTPP5yQK2IVobjLt8LdXDv8Hi4PtTdsaVH9I6Xh9I/qEws8UJ5GZXHE42COORdY871jxvGLeNbzznlElFocsEaDdlG5fKLpZLc0lQSgNxU507rBWTTZRq5xdY1+uTGYCqZabmyWcnhfbpkGjazOt2ZBXoc+jcTm9BRZ/jPP+wlVgVvg9dVN1WhgMhNhVGWOWzvO6YQ3v1CGkVuQUECaT9QuTTdefBptdO4/zJ40+NEaoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: preparations for 4.15.1 and 4.13.4
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
 <a37d01a9-69bd-b656-ff8a-b693dbc014b1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8cd6349-bbf3-9f50-12b8-a2118bf79a40@suse.com>
Date: Thu, 15 Jul 2021 13:12:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a37d01a9-69bd-b656-ff8a-b693dbc014b1@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0012.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d3f189b-71eb-4ac9-98dd-08d9478181a9
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3390DE253500223FFE3D4E77B3129@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IPnY8GmxJi653tF1kbmD9XgQCAW9BsIOmaMMINbImbIDXMGVV42LoXuRQzCz3lGKEGDbIkguJlRg6rvMAhJc5b1s10EUuP9tICDpUK7qPJpnMurdBiy+IudcxiIjooB/Wfz7Jcri1z003cF9Z/GgbyIBj4Ct16T4gV1N6wiDnE1P2XYKHMf+zMwVTzz1kLs2ac0mZgXD8ULr1alX6aTFK+hNqxzfpmJ7egwkVXYYRVpyO50wsFEvxSWdaocZn6UOL6doGwnikyO2VvnDJzJWbwVFyggIPm6YWt8vdETtAHnezSGGnDh2asDnclpa/fM//hgo8sTbbFXM1zk14BZARUlocmecwaSb355sxHuFwJsADLJNx1T4T5bzezuebRSygpqtK64tOEcYjryJc0jTBywKufePRZkp8zR9zyve6kuFcXeJNJi1+WTG6JgosRSMOPoe5qUwfeulgbIwIZ/h1l9I7bnu+dlpNEYUS/j5dd0cBj/M3hZ4VVhl/vjG0GAW5zCRTdekLjZrTZuc4s0rTkVoyHBmWlgXkQRUDU28XPxmHWWoUhBgkm8cajj4mcYPIfEEMxjxhdNrr0rcMAba4u5R8uyIaJSzsDZ6+eJGIENISyVghZA+u1qoDg+WYi5EB01eX8fNYBZvB6TqpP4mf/XdipUeSPB3nW8oMKTIUG/lt4ok15mqgpxcATdYX2DDxBax+/rddZ4WJNixlt+fBmHsbGT2fN5SH+I8bnt8kfs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(376002)(396003)(366004)(136003)(38100700002)(53546011)(478600001)(4744005)(8936002)(316002)(54906003)(16576012)(31686004)(2906002)(186003)(4326008)(31696002)(6916009)(8676002)(66946007)(66476007)(26005)(2616005)(956004)(6486002)(5660300002)(86362001)(36756003)(83380400001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eG84TFIySHJld0phQVdNclAyT0NTVkVDY2g0QVg1angyQUhVMlNXSFBWZjVX?=
 =?utf-8?B?b1NiZXJOOFJLK3RWK2lBSGV3NWJudWt5T2VLdDFNNnREQU5QMGpEcWtiUEh2?=
 =?utf-8?B?alI2UWxZWURpYURmV3N6YnlNUnplY2EvR1B4YzBLcDdzYms3ZkhXdkdmTlVs?=
 =?utf-8?B?RG9iOUQzODJtY3ZMWUh6Y2RIOGp4SXlNSm1JTVRnOUxja2tCRHYyeGVYaGkz?=
 =?utf-8?B?MnUrMHpWUzV4WkFxRDQrdUFJam16K0ZWN1pYUWo5MTJMTzdYejh5MDNxWWlC?=
 =?utf-8?B?ZXA0dDA4Zi94ZDlkR2kwd2FwbitNZ0NJbGN3L2FzaFlxNFEwenZWbzlaeE9v?=
 =?utf-8?B?WU9XaEpzOERXdGJyTG5saWdhSVRDaUszTXRjbTJJUmdqWHZFM1VCakN1aU9J?=
 =?utf-8?B?ZWZhcWpRQUFyRXJkNUpuRGs2UnpBQTFDd2FmYkQvNWx4VG1mUWRCd1lNMCsz?=
 =?utf-8?B?QnhYVCtWOURxWW51dzJIRXlhSnBGaitGQkxFa0U5b3ZSUHBLRlErT2E0TDFi?=
 =?utf-8?B?N2JodHpETVN4blJnTW9zMy8rQXVhWmljMXlETXh2a0M5czJ6ZGxQbXVWS29B?=
 =?utf-8?B?Q2dpT0puc0xrK0FTcGhrYkpsZncwWkRXc3Z5TFhlYk1IN0pVNjJUL21LZ2Zu?=
 =?utf-8?B?bTJtTXV0MGhsT2RsUWdGUTdLTVVpZ1lqbzdLZmNLaXVOMDFmVFlrN3BuVjB1?=
 =?utf-8?B?eGg2SW1yWXlLNTFzQ1NoUVlpUC80SGZPcjFXdlFsb0VKc0o0VHlxcEdYd0Vj?=
 =?utf-8?B?YlhsWlY5MFUxdzZoMmRKQlpTNDkyeTR6RTRSanh3M2lqVTZGUzFoTHJpYzNt?=
 =?utf-8?B?L280azN1YlBIeEMrdll0RXFvWlVoKzhHenZ3Y2tQZjBNOUNRN21mK0hTd2c0?=
 =?utf-8?B?V3lLQjBEZEk0TG5kdzVKZHpYWmp6Q3VYQUVQZUtFN2RHMS83Q1N1UllEYTAy?=
 =?utf-8?B?YTRKY0E5SXAwZk1MSWZjS2J4d1J1R0VRMk5RWndNdDB2YTBxc25MMGRaakdq?=
 =?utf-8?B?SXR6VmhsajBLTHI4SU5zZ0JJRXd2amNCWkxwTW1QbmhoL3JOelJONDlkR1dB?=
 =?utf-8?B?VVQ4TGN0bGhZUmpZT0ZWT1Z4Z2QxeTNiMnhQZWtQU2t1NDdIdW1leTBaYWUv?=
 =?utf-8?B?d01xT3hEZXdoK0F1MDV1ak9paHFNNVM0TDhQbzBqUEVSLzVDdUhTMkwyMnhE?=
 =?utf-8?B?alUrc3VxeWhLUEpiakVNSVZvaGtYcC91eXdyS0VOTWxXelQrb3JOTStBL3ZC?=
 =?utf-8?B?RFNlNDZDNjlIaDNsakdrekg3bERmaEo1blNEc0VUTC9sQ0NxaEF5dXRONjNy?=
 =?utf-8?B?ZVVLc2VVMkNjbXJRLzBaTFVMUmZyT3kweEVnaXp3Q0tMTzZndkZOMWtrWEE5?=
 =?utf-8?B?MkpFdkJnem0zenZMTjZWQWlqdGN3RXJTUlBrcTRKMksyVGhQclpxR0U4Vjd6?=
 =?utf-8?B?R3g0MllaZjQzYWxtZFNtR3dNWlZjNlJpQnNhSnBTOWp3K2p4M1JGdWVJSkJs?=
 =?utf-8?B?YlhzZW9OWEtLUFpTeVZySnBNeStFTkk3ME93RFpxTDQ2Y2l2SzhpWHpUZXFE?=
 =?utf-8?B?MzJTVlZ3T2Z6cERxWWZHV2VLNyszV0ExN3JQMlk2RHhjWis0TE9SYk5LUVhm?=
 =?utf-8?B?NzU4ajdRbzhSODgyZlVUZXluT3BJeWZ4TkJSVkNBNTJ2QVlLb1Z6RVFZTnky?=
 =?utf-8?B?QWJSSHd3T0tvZUU3bXJjZDhleGRpTEVsY2dNUTUzM29od2ZPSVhqQkJhZDVm?=
 =?utf-8?Q?wrYjVgkPdP2IcbY1jh+KPIQ5Ic3pXAQpt78yo8H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3f189b-71eb-4ac9-98dd-08d9478181a9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 11:13:00.3073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HR1voBwsN7/lv3ePYmV1TzZZ/scwcxemp1T/wAs5Nh8v0NSIfC/dHpumPsY06gkJ9okMD4byYXMafgknSK85FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

On 15.07.2021 12:58, Andrew Cooper wrote:
> On 15/07/2021 08:58, Jan Beulich wrote:
>> All,
>>
>> the releases are due in a couple of weeks time (and 4.14.3 is
>> supposed to follow another few weeks later). Please point out backports
>> you find missing from the respective staging branches, but which you
>> consider relevant.
> 
> I've got a queue of:
> 
> * 429b0a5c62b9 - (HEAD -> staging-4.15) tools/libxenstat: fix populating
> vbd.rd_sect <Richard Kojedzinszky>
> * 41f0903e1632 - tools/python: fix Python3.4 TypeError in format string
> <Olaf Hering>
> * 67f798942caf - tools/python: handle libxl__physmap_info.name properly
> in convert-legacy-stream (74 seconds ago) <Olaf Hering>
> * e9709a83490f - tools: use integer division in
> convert-legacy-stream<Olaf Hering>
> * 1a6824957d05 - (upstream/staging-4.15, origin/staging-4.15) build:
> clean "lib.a" <Anthony PERARD>

You'll notice that this last one is already there.

Jan


