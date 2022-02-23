Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701FC4C1894
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:27:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277664.474451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMuU3-0008T4-3T; Wed, 23 Feb 2022 16:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277664.474451; Wed, 23 Feb 2022 16:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMuU2-0008RE-W8; Wed, 23 Feb 2022 16:27:18 +0000
Received: by outflank-mailman (input) for mailman id 277664;
 Wed, 23 Feb 2022 16:27:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMuU1-0008R8-Iy
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:27:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76b88c9a-94c5-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 17:27:16 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-HbQXPRPDNSK_r68BxkW_3Q-1; Wed, 23 Feb 2022 17:27:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7862.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 16:27:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:27:13 +0000
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
X-Inumbo-ID: 76b88c9a-94c5-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645633636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHvaPd6DZRY/CUTgr7uDsFTCgjGjrQW4ENvwC/TxBmU=;
	b=D7u2z7jr1VdQQ/CWN2Nbw7ZsX+On0Dn8LfUuBzXZUmP7hgDth/mQgs3pdNmm6bX6Qx/f9L
	j/7X11Mtuyz6/NNtuMfAwVDqO+LErtMk4HwdpCc7rWdrsnkJD7PPKaqv+H8ukoeY5ogwer
	f2+lbpaR8zmQI7Lexy3iJvP4qNyK1yc=
X-MC-Unique: HbQXPRPDNSK_r68BxkW_3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+QHMRBBLJatEsNQCEJv8efy/r8y2l2i2a1RdWH45udgynlBYT1DwdhQ7hJ9+B9Iguk+uulwfVp5+2Uub0lgVBPQEtjXRcdr5Ulq++BhvWeZDyl4yyR3nQCd8MWmcRw81NK9qgzAddQqcnnWunsrqyD8vDHaCyNghRPsshMd3Pc7SyuznHfaLU2oyhyqqq02ut4ns8AVkzTBY+VP4DTrDqMf03rhiINIgh1iFOes+H/EbbVMTf/BZgL44TdF1nF3xHoyYte+gS6CTSn9D/5bGx6xizS019sjBV+SITd3olYlj7VHIAN3vwPBp6vkhfYFxfo0iL8ZQeEQ5Z2wNirTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHvaPd6DZRY/CUTgr7uDsFTCgjGjrQW4ENvwC/TxBmU=;
 b=PG/8IhbSVGI9uOkqnQiFGId97U/8Asrpvni+r44gTL1E3A1i9Rg4sHZmvtdRGq9au7Z7jcqkCZugTSXmtHAg2eX8f3I36p0XHMsiP06/X9zAwNsBvWSZFX7BS8otmEM5WvAdk5LXFmh9bN8FuiXkPS+TOKNVMIQ6u0TY3p2Es4O26vgPEsMCID0Rl0bQv+XvEKVEp6IU0Dr+/P0XeaLZ0oU4gsRtu0kJJStL9na/HYYnFsHAF9MtPIRqm9fc0GkbBTr/mjdEa+Swl/C6U16CQ6fu267k49jfYOB/QujumzL1KAzsVlGZPt5xCqCAbxr6eSHewiOQLzYTKsKkZ3K23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0004cd1-6082-853b-a6e4-9dbd530fcce2@suse.com>
Date: Wed, 23 Feb 2022 17:27:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RFC] Avoid dom0/HVM performance penalty from MSR access
 tightening
Content-Language: en-US
To: Alex Olson <this.is.a0lson@gmail.com>
References: <949b4776e23e4607776685a7e2705b9e77f5b717.camel@gmail.com>
 <a1099ae9-9e0d-cf54-e786-835c13f2ba40@citrix.com>
 <d11e54d47776008c17762458e6abbd44ab0beed5.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <d11e54d47776008c17762458e6abbd44ab0beed5.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0020.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a01bf03d-cb31-4195-1f67-08d9f6e958f6
X-MS-TrafficTypeDiagnostic: AS8PR04MB7862:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7862879B45DC01B7D7AD082DB33C9@AS8PR04MB7862.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QSk7uVxafBn2JzxjemVYbo+AYvIHvySFvD+I4q/dMlVdvAMc4M3jdPeK6MGp8b5fUmwOCb8ah2PsIfPMzeHfezYMk2LSahAZJJ05M0C2CpNxAoppKxA7CNvE4trWGzdIRqBu1JIT/8aNsRFTYLF9xlLgu3CfaoY3Ax/s10LzYMNXhWpW8Om2RmAJ3nj4UXFioFsUyod3r1HgejWU8d8YweiKO4P18jYhEZzO9HV+GZ4evIOARYWOACM/viGfHY3bkG7ZfI7Nxg6ipzS1O4VMKMIsaPBvrj27hJxy2VDWHto6FdZpV7qLkhEkLDVAei2T0TZs1uAq2E13O77Bjy+4CMl7+Xx3I5tCnJetibJLsIN1R1oLNSwxkQ5+Kkchk4eTeKq6cZJWzSWTvd0ZW1tlRltj/inLdbk6MWCzCjDUnaX8hO1NbFletXQCeNeti4gnpxbBkImvtPkz6Qp7Uk3vgyv5nReobm6GpzE7fHBa3VH5vUXzRsz+69R7Va/cfFOoQhIWdR4jBgLugJZjmzKEvbZk/5+92cnNWJxTcSvlWtnGhucK4/7BTb2hLvwISXxE2bTM36RSCjavA24odlXp79g0BA2sV6rmktpqukdCpnArzsaxxJqyywir+lFgeNbtXgCkw8+9i1OliNq4HaZPatnIYLeYi9NAhVgoGarXQK67Gx9eVjDXJv6CGDpQa2Xd0JgZyJDZhsAzQGiexqdVsxxyU+mb23B+l3hp6zmc1Fg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(4326008)(6486002)(8676002)(2906002)(83380400001)(31686004)(66946007)(186003)(26005)(8936002)(5660300002)(36756003)(38100700002)(66556008)(54906003)(6916009)(508600001)(316002)(53546011)(6512007)(86362001)(2616005)(6506007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGJKSksrb25uTlVJL3E1b1ZGNkF2cERMallMeXVmcjdFQk9TeGVyY2M0b3BE?=
 =?utf-8?B?aktadWFmMTFCQnJySThSN3BvYVZ4UFJ5MG1PaVZpVGNvMER1QThyc1pGNTdy?=
 =?utf-8?B?cThrU1U2TGduUndGTmIxSFB3NDcvSFFlcGVFL3lYalE1OW5yK3RLUzNwM1N0?=
 =?utf-8?B?SkRHcVRpNE56T2w3V3ZCbE8zK3pXU1psZmVCdlJ6WjJKdWh5MkMzUnlUalVI?=
 =?utf-8?B?dmRBYm5sSnNFRHJTUjZ1aDdQMTQ3L1R1K2JVQzVzN05DemlmcGVjQTBiMldn?=
 =?utf-8?B?Ulp2K1cxaTZqVllwZHhZeE9iNGVoRTZSMHpaVTJ4YmlvQnNtb3NVVFdLR056?=
 =?utf-8?B?MEVOZkozRDNyOUwzZVZGV29FYndsbmtMb3JMbys5N2N5YkpHK2NEaHZrMWpu?=
 =?utf-8?B?ZjMxT1ZlU25GdHdGWndHM1hrZUlkY3I3MG1mQmtDRWpoZi9wdmh6VGhVZ1dR?=
 =?utf-8?B?cCs5YkEzKzFVV1diS1pabTYraE1meXEzTncwRHpOSzY4YmU0MW1YeUtIcTFw?=
 =?utf-8?B?MVluUXhmcTl2dDZLUjdJeW9LWVd3K2tRblJtRjk5am1WMHphbzZ0akpSUXlB?=
 =?utf-8?B?TVlaTFJvRFJZY2JIU3NRRUlOdkhuUi9OTiswVXBKQ2dBQVRuUWcxL1lnZDdv?=
 =?utf-8?B?UXdHQVdwUzVQcldySlhGenRVN1JNV2lscUlTQXRzTjhxanp1VkdnQkNPL0Vl?=
 =?utf-8?B?MlRVR3Y1a0tUUlVIanNjd3JwQXhLMTEyWUR5TkpsTUU0MzBwbjdFczZaS1E5?=
 =?utf-8?B?NDk5RjcyZWJNSnpRZHVqM0pWUy9Ic0pNV3gvbFJobjM0MEphVFB5WlFpUlVQ?=
 =?utf-8?B?UTl3Q01uSmVBVG4reng1cUxMOWVuQ2FrRXJKWGhRN0h2WjExdWlORlZmOS83?=
 =?utf-8?B?S2h0ZVpBWnVHUzdueWlkdnd1UWJtakZEOTJoTUYxTU8vbkdNMjZINlpqSFZx?=
 =?utf-8?B?dFJVc2xKNTlyeFl1VUpEOVo4Qmt3c3NHRXNBTEtaYWJmOHNQemxZM0hmUGJo?=
 =?utf-8?B?NFdRSWdmWE8rN1FObFhEa2VuVDMxeE5DQ1RQT0ZBWUdrazgyV01LYXhycVdr?=
 =?utf-8?B?OUZjUmNzZmFYNFBmaFRrN1R4RzljcitBZjd5WlhvamxpTWszNWk5V0M2L2dU?=
 =?utf-8?B?M29hK3k4ZW1pVW5uaFJYcG43Ry9mSmwyNUZpL3ZjMlMrTCszRVRmOS9aSDVz?=
 =?utf-8?B?cFhjWDI4L3dvaGRTcFlwZ2QwM1c5b1NWRVVycldoSWNwR3pHTTU0cVlUakJN?=
 =?utf-8?B?NmR3YloxR0xwZmNRdlpEMEZSakE2SEx0U1pBYWZOUGt3ZFM4U0wySmFQR2NI?=
 =?utf-8?B?VS8vWk5jRTZCeVZCQ0hiUitDc2FlaE52RzNiQkZBdXZJRG1rVFBHODduTTdz?=
 =?utf-8?B?Sm9RbHZ2UlpmZFJrNzhKS1poZXJIaFZPWnFZUVEySTRtRit0M1ZObXQvNjlr?=
 =?utf-8?B?akV2VXdNLzBpRTBkbDNybk94NFVka0x6Nk1yc204VTh0Rnc1YnNsZEwva3NW?=
 =?utf-8?B?d1BSOG9tNisvSnR6Y0VkYjU0aVg5bEp0SHUwTDN5bk8yR2Q0bXpNcTFlUFVh?=
 =?utf-8?B?R2Z3d3JsSlNIcDNWYUdpSlhieFk1Nk1Sa0s2Qmx2d0ZBWUVTWU9TVmx6dFpJ?=
 =?utf-8?B?NlViNGZjWDhySWJEdXlFcGFDSTMvVEhTS3NJcGgrakl2V3dIRlNpZ3dNeDE0?=
 =?utf-8?B?SGZYa1dzb05Fd05zeWtVSW83TE5GZUVWMGM0UVl4RTR3cmhSdnhMaHZodlhV?=
 =?utf-8?B?WXBJN1J1WmsvQUE2Q0JMcm5TK2FQMURIN3BOejZLR0lqQktqNjBKUVk1T2tR?=
 =?utf-8?B?aVJMSGRTRW5vVFhRYXBqZDdMTTVKdC9JbStEenpNajdrZ2lISmYxc2hGVVYr?=
 =?utf-8?B?R1dBeEIvYXVLcUJGQ0dZUENmdmlJaG9ndGxVM1dFcjRDbENxZkxpeFNMaDl3?=
 =?utf-8?B?VDRUU1UwNnFTZEc1NEQ2RGkyV3dHaEsvc0tCT1dHNXYvZjlnS0YzNUdZeUFM?=
 =?utf-8?B?eFlaVFZUN0pPVEFjN0RFZDFqMFhQR0d2ZU1xY05DNm9OWkwrYzRZSEFvQ3Ft?=
 =?utf-8?B?Nkp6T250VEdGSHlaZUE0YXQvTng0WDhFZXNIeXlSbGttOXhRSWdGcVpITDFz?=
 =?utf-8?B?K0JDZ29TdVVUV0JIMHlXZktjRVVDNUJQM0tBZEFUbTZ6amJ1NWQyVjZzM1Nw?=
 =?utf-8?Q?MyD70hZJpVseAxXMka4GJ90=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a01bf03d-cb31-4195-1f67-08d9f6e958f6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:27:13.1692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uF4BxrAHQVZaHTGq7gHM6Uv4UdLEV1eZcYWk/ljG9boe68Y6MDZK0HX/lHlfOGHOx+QuZW4F5SQOlTF7SlNZ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7862

On 23.02.2022 16:38, Alex Olson wrote:
> It seems to me there are a few findings useful to the Xen developers from
> venturing down this rabbithole:
> 
> 1) For conditions in which MSR registers are writeable from PV guests (such as
> dom0),  they should probably be readable well, looks like MSR_IA32_THERM_CONTROL
> is currently one of a small number of "unreadable" but writeable
> MSRs.  Otherwise seemingly valid read-(check/modify)-write operations will
> behave incorrectly under Xen.

Hmm, this is indeed odd, just like for the adjacent MSR_IA32_ENERGY_PERF_BIAS.
But changing the behavior for such things requires (a) doing archaeology and
(b) being certain that no old Dom0 may be affected by an adjustment. Quite
likely this write-only behavior is a result from removing read access in the
general case. IOW I think we want to re-add read access for these two MSRs
(and any others fitting this pattern) for Dom0. Care to make a patch?

It's perhaps worth noting that (write) access to these two MSRs sits behind
is_hwdom_pinned_vcpu(). This is a mode we generally recommend against using
anyway. I'm not even sure we consider it (security) supported.

> 2) As Xen controls CPU frequency and c-states,  might there be benefit to it
> being extended to manage Clock Modulation / Throttling? (I wasn't expecting dom0
> to be able to influence this!)

This had been the plan many, many years ago. Yet no-one ever came forward
with any code, afaik.

> 3) Perhaps PV domains (such as dom0) should not be allowed to modify such MSRs
> at all since it would result in unintended effects depending on how CPU pools
> and dom0 are managed?

Well, the general rule already is to limit what can be written. So wrong
cases now need to really be dealt with per individual MSR.

Jan


