Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F53A3EFD08
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 08:44:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168105.306906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGFIU-0002S4-2E; Wed, 18 Aug 2021 06:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168105.306906; Wed, 18 Aug 2021 06:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGFIT-0002Of-U7; Wed, 18 Aug 2021 06:43:33 +0000
Received: by outflank-mailman (input) for mailman id 168105;
 Wed, 18 Aug 2021 06:43:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGFIR-0002OZ-V7
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 06:43:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9932eb7a-ffef-11eb-a538-12813bfff9fa;
 Wed, 18 Aug 2021 06:43:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-mjlq727SMwaUMT9j6Ns-3w-1; Wed, 18 Aug 2021 08:41:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2957.eurprd04.prod.outlook.com (2603:10a6:802:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Wed, 18 Aug
 2021 06:41:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 06:41:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0055.eurprd03.prod.outlook.com (2603:10a6:208::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 06:41:19 +0000
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
X-Inumbo-ID: 9932eb7a-ffef-11eb-a538-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629268882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8j5YC7dzVd2OqONZUdcuLZvK1uYaUhuv7Fu3o0wdmw=;
	b=iRg80Dju8/MCVbP1cHSy7lYdzyet+PBZheU9ZdLJCwIWdB+7KaIxjCTZQTlNG0XymSVasm
	6q5Ay6ch04fE8dg44HESSkJYKlZnuHOTex1Oipryty095Qq+C7ZG1BnifMBg5PfpF7OTRY
	nZDdmJVbkhzRn4uI1cnLTI1v39uP/gE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629269009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8j5YC7dzVd2OqONZUdcuLZvK1uYaUhuv7Fu3o0wdmw=;
	b=DUE422anC5RTB2MrPD9fdeT7ExG+nVfiWWqdwa5BXQiLUYQ5ILB9DZaMzfV3Kxny5wuOZ6
	Z3MTfl/2XJDo3kCothRVgL/61YiMy+3yxOwohCVkqXyge4X/luNQQO7hnf68l3Nu9dQzIm
	WsG++C2iJ0ZZJOrbfxOoCSL6Mpnati8=
X-MC-Unique: mjlq727SMwaUMT9j6Ns-3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfHwikCzfTbeBG55WaE6O1VY/CguPdBwNjfCLzuiI/hcMcq9A+xY0LJP0OKB2xHta160zmv2BK2DlIBvzVboHeDwGYefs/+oRVfO1McsiiIwfLLLR3QfIuZu7RF++GnYwAWCPKM0mR/aIivQkoWntFLRGT5S4LF1tD0v6sdM75IuKj365bqkcvApnVVtt5mOY0TPEW4LkXdgMqHybq+IcWqGxwvEJZn1VTiQpEqjdl6k+L+Ce5OVLjNQISvchb2+o2yUGhN9m7wwzlWHeuDe31wYvn5OXKB1KmHhdmr17sow8smYpHC9BdrqZk2+bvBejKSAzeMoGsdhm6CVRUDTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8j5YC7dzVd2OqONZUdcuLZvK1uYaUhuv7Fu3o0wdmw=;
 b=Z7rX5/YguIdAWlCyXsGuzfrAcXUP/+hmyHAWfAPGB7kcMHeTDQ0a4DNa7HeTONss/xO1aRqLj1anMgIrM6+DXrB5vbF15lUnBIoLn6FThQAULuiw/tgznTaU38X6E5fDGjp6seNMz58AazUYb2rOUuda99wFJAjQWz32Me2vJVkyX95oNiStwCis+WGkMXTc7/JmK8a2UoNhRFEiIGgjaTA4ZfIJ+4N5rKePPBEdMeb/LOPHBhXHkL+O4UBVF8haFIzd7iZN6ipBznC/ZNx1pxoeFFqxXKn8J438T2Qe6teKzasMxMeD1kXFifSyWac4vEfBCY8Lh5O03+MsO3aGYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: invisiblethingslab.com; dkim=none (message not signed)
 header.d=none;invisiblethingslab.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: S3 resume issue in cpufreq ->
 get_cpu_idle_time->vcpu_runstate_get
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <YRvMy9NgGxYKRcNc@mail-itl>
 <42948041-59a5-e243-ed39-6e2afe3fd1cd@suse.com>
 <d700e9f6-8c64-52b6-6881-5816c2895200@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d0f3c58e-fb2b-3d67-b9c1-1c8cdddb9055@suse.com>
Date: Wed, 18 Aug 2021 08:41:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d700e9f6-8c64-52b6-6881-5816c2895200@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0055.eurprd03.prod.outlook.com (2603:10a6:208::32)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4402927d-4eb3-43a8-a1a0-08d96213300b
X-MS-TrafficTypeDiagnostic: VI1PR04MB2957:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB29574E053BB28FFA75C846F1B3FF9@VI1PR04MB2957.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q9JhTZls5BjsuwOtMyV+MsGSCPDKHco13i52h2CLgPabUYCaTwmkGS0lDqk/j5xxax/4jUhY2MXFSl+r9Ps00cKrkDhoQmyhZDaldScYFIqHCtdfFpFjwQznMnAKHRRd3OwmtMi9UJ4AykDpjCH0Vyk7SREWUTdgcHkSvU4VNg5MNLQesnMDb+eSkuvjn/6srA669SVPFkYNTr6OWSgmwNb06adWd3hC8DnnhlPt8yDoP4g9d791Lo0nEFkeWAvZmyZ5p717+fRlmwNqMR33haEEoJ647qnLlAPFbTzpY0UAR0ISFno6n7WyL5uYcA7Tmz6hjRMPcFL8O9H6wQnaZR2yK9tvdL5d7AWibZXn3Zw87kvOntFVCTWsZHF0z05pK+JGHq7V4K1Kb2gBF/AtKdssv5hVOwNQa6diSzgdohk9MIcTJMV1p9LNNY0FBVWRGtkd62b0DXaSnJybPT5v9UuC2zaGSkbEc99wn9o1BSgiFT1O9kLxtOUVdNvqoUrXFX+fciWTKwXyVxsxs+PivRDo12l0KNJFJb1/unZ3fbS6YENN99kHdYAodf4Jn5DyvCElEPLH13ncrkSJywyS9SizV7eLj5LYQw1xhbF54z3rNIjuOboYqVspuQ5GRvmA6X8ITTEO993tL3eQECEQRijV81ixBJtWZ6ManPG5YeZvTne7ZGViVWcnf2XdKqNE/O1TNQ52toDx02dsNcvYdoKRgLpTDyC0Jn1V3ELI/rw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(956004)(4744005)(4326008)(31696002)(86362001)(5660300002)(16576012)(37006003)(6636002)(316002)(2616005)(6862004)(2906002)(66946007)(66556008)(66476007)(8676002)(54906003)(38100700002)(31686004)(53546011)(36756003)(8936002)(508600001)(186003)(26005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enpNSGU2WnlyUklDSlNHbWVHNFFtWG9NaDJwSkQwakZDWFpoRE9DSWNTY3c0?=
 =?utf-8?B?WGdaaFZMT3hoZ3JCMTBGa2grYVQ0Zmw1cjhBdjc4bnBKNW9XQmpuN2x6TjJs?=
 =?utf-8?B?TjRkL0s2VTdVRUxKbk5ySFJrNXo5cVFXOFdjdUpzT0d2Skd6TWhzRmhNRHRo?=
 =?utf-8?B?TkxUcXdBZ0RUR2IzR3pDQWliOVhEWkZaRjN2NTdqeTZ0M3NQTFdhTkp2U2dJ?=
 =?utf-8?B?dHFjdnhYa25wZE44L3M2NXhGWnR1ZVJLK2k0S1grSWs5cDJvcXNJWDhQVHkx?=
 =?utf-8?B?blFlZmpHUHRKRDE1aVpkL29vODhOb3EvMThzZEFXaS9WdXdiazdVdkNpRjky?=
 =?utf-8?B?Q240OUFRYnB4Nk1YK3dwWS96YmVCTHRKVXpaYU5YbTJ3UkxLZG9tZGdhSmVD?=
 =?utf-8?B?NElLZWVjV2xxQVl1cmVMS0V5L1dLeTc4TnYraXRIblBBSlcrT0drd1k0dHZu?=
 =?utf-8?B?OXRWMmlHT0F3ZnA1aCt3Z1RhU3o1WlZXWUtRbnNhZ0lZUzRMZC9BdUF6UTNF?=
 =?utf-8?B?eHNNY0x2aUlLeE5PS3RpSHVvVDZqSmc3OFBUOEtqc25Kek5RRE0ycDhnM2R4?=
 =?utf-8?B?OUorUU5TNlE3N2M2Mko2cHVqU2MyZGFVUWxjYTNGb2t0LzB2NFVoNitmTFl0?=
 =?utf-8?B?d3l0WjBvMnRoUkRlT3g3cVh6Sk1yL0gxLzVTT2hDUU1qZFV3S25pNEc4WGJy?=
 =?utf-8?B?REZaNkVmTG1lRHZjcEdKZ1RBejEySWwrbE5OZGlDL0RiZXJ3RHJVUVhGUEV6?=
 =?utf-8?B?V3Y4ZlhNckFYT3phZnAwbW5QeE1ncnRFdStIZEw2UWY0NDEzTWp3QlRuQTR3?=
 =?utf-8?B?MUhHNGV4dFF4U1FXOGxLVEpJWmtLSmxuL0Vha0k3SjRnby8wcFFSQVl1eDhG?=
 =?utf-8?B?NENTbnlzY0x2MW5XaExnc2dybU1Oa0lMSHVtaDJiTThuYk1vTHVKZGdJY3dk?=
 =?utf-8?B?a0JKdFNxdlBjZXRoUjJNdWlwaDFDUURJUTFjZkVDUzI1RXZuN2swaUNYMGFB?=
 =?utf-8?B?SUlQdC9LbzM0WkpHalU4SS9KR2V4SEZ6c29ERGV3d0tTazFIVzhrUkhOQjR0?=
 =?utf-8?B?aDRrMm1XWE5wZ0Y2K3RaSWNBRjh4QWJxd0FEUmw0RmlnT3BheHZKQklNS2lz?=
 =?utf-8?B?bFdqTFRUN2JtYzFjeDh0K2ZjOWFxUmJONzdnWVhiTnBRSzB0M1VtendtTmc0?=
 =?utf-8?B?OW1wcVFlNU1oR1FVeit0ak1obWRDeDBqaXJzV1JDdElKdzJGN21hcUVwa0p0?=
 =?utf-8?B?Z2FoalJFTGVUcHJBL202R0RsdVZUYkhLWkRrWmp5UjcvMktBbGxQQlhab0ZD?=
 =?utf-8?B?TzAzVFNuNDk1eUorZzFBQXJkc240SGRMRWtEWVY5Zk5keHpza1hXdi94bnMw?=
 =?utf-8?B?emVJQTRGWUxWYnpDUUVVZTNycTZ0Z0hCb1Nnd0wyZExGKzI4aUZFdnI3ZEgy?=
 =?utf-8?B?RFNPU0MzRXVkL3RndGp2enVGT3VVKzY5VGVNL3JCaS9yajRmTkRGc3d5MTZJ?=
 =?utf-8?B?VWdSci83QnphK1NHem5CV00vWEZnQ1B3WW1LOXFBVUZlTllSUjdLVWJPYzJG?=
 =?utf-8?B?aERNaVVaR2xuSHAvcy8xZjlMNzFoR2lSOHprdjRrbVp3dE9PS1FYN0pUdmM1?=
 =?utf-8?B?dEc3T2QxNi9qNjFQYWpiK2M3MTVyMGNxczJXK0IzWFU2ajlva1FxQXlYNTVN?=
 =?utf-8?B?WXFTMTlvQTljSStoSm1kSDNaSVJ1UHZPNzVFS2tXYnozVXVvSE9vZmpqMk9J?=
 =?utf-8?Q?CPHaQQX4e3D66qIpUDO9g05LyiA45SWHPDVEdzT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4402927d-4eb3-43a8-a1a0-08d96213300b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 06:41:20.0694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGsuCbjT8fkc5Q6n1GGJ6VJtcPnKjD1w9iOI8ZBxW8iC7ONIrVb24E/7zRc9l7a7MSLPqkG4vXG5lpAhYFMWZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2957

On 18.08.2021 08:24, Juergen Gross wrote:
> Could you please try the attached patch?

Seeing the patch, two questions:

1) Can idle_vcpu[cpu] ever be NULL when cpu_online(cpu) returned true?

2) Seeing get_sched_res()'es access to per-CPU data, would it make sense
to move the cpu_online() check into there? While I guess the majority of
users are guaranteed to invoke it for online CPUs, I wonder if there
aren't any further uses on the CPU bringup / teardown code paths.

Jan


