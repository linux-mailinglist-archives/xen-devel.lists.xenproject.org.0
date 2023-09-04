Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10787911A2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 08:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594968.928420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd3Qv-0001wX-28; Mon, 04 Sep 2023 06:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594968.928420; Mon, 04 Sep 2023 06:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd3Qu-0001tk-UN; Mon, 04 Sep 2023 06:51:36 +0000
Received: by outflank-mailman (input) for mailman id 594968;
 Mon, 04 Sep 2023 06:51:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vltW=EU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qd3Qt-0001te-N0
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 06:51:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c93b8c4-4aef-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 08:51:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7842.eurprd04.prod.outlook.com (2603:10a6:20b:245::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 06:51:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 06:51:32 +0000
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
X-Inumbo-ID: 7c93b8c4-4aef-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4rrbQC7NuJ2YPxVI2oJKowd0y+Kz8pMLe5yYLd568iww2tFcCjggbOGq6OME//pQ7l7DSzq/8mYZe4NmWyKzjV6Pg+yuFgXOT0TvhGSycp8lQKAPwoN8O8fjXe4eK0nIGhA01bjhG99EdGgRAqZ5FXPlRMwOuQ1w6wI5JOunBQZEkq6DwnPjQc0siJ8IRflOjWjREqWWjl/dPkD9/IEQvarAhv1gJ/jp12bSSOuzNhTdg6NMoq4h5JsnAOhvzDVdx1q834Hp+UmLj45HhSHYtMYfihTrDjTAcRgPTi/0vOdDxOX7XOGQypONBvno3ITrfm6RWupk4LdU0qxJd2tNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TF2lOeCbTErEfk6SsN41ExQh882zt8sOJvz5ZkwPoWY=;
 b=RciAYagqaaECs5nsfi2v4DRTsBeBONNnwoGN3PZ2Wn7VNRVB2Jx0cdK7OhR8filIP/UG5mynNbADoNl2UOk/uxujUbN4tRs7qFbWe9+HZuR2GKx9Vk8OMFOD6wQdTmr5zp/eOjg/SccseL0DVBpSOtJG7roYzrSlJXtDjw1DqP0+DyqFFVvjq/pIxyBHlFvzi7SwqlrksvoIoQOPZDVTJXp2dE2ZXDDxziIZ5SbiN8wCM0peCPPbiJtHRauxXwcGllJKJeFe+GLi4z0a83vC5WTo4iUHHaxT72zGJjfALMAj2zmjTSxnDrbJM2iTWgJWPKOaMv856bxHD5jEzujOdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TF2lOeCbTErEfk6SsN41ExQh882zt8sOJvz5ZkwPoWY=;
 b=YHLF+3hqDxkLz+VZTCShu3xOAvBqTaoBns0fkxOnBqcFx0QQgWqqGXXpAh5AEUsjkXje4/G1JIAwS2kgHCxNJSWmy5v9KIHDoaMYNxe3VDRz3Gor20/xIhVEcSHoaX4sFijU9LKeqQigzR1nkvk8SeQMloZkt+m2eUHgoEByW3i/MNv9UUnY8QFqUl4prTOfBbo00fcTguiXtxYKSwX4NyO15A5FCjVEAfzxPNzQEiFn5+DNRkWdG4Ghj4qu6GSdDdrfesxTPCzYMF8TXUxHsKcvllndGwbcdYPQqVVpW4lOQMFIgP/980/fa07tLco3GbQ4WDiUMjqPTaHgYAMqEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44f0ee82-2a84-d4fb-15e0-fb74ed1ad2c3@suse.com>
Date: Mon, 4 Sep 2023 08:51:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] tools/misc/xencov_split: Add python 3 compatibility
Content-Language: en-US
To: Javi Merino <javi.merino@cloud.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230902162246.15672-1-javi.merino@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230902162246.15672-1-javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: ccdfd1bf-698e-43d3-fae8-08dbad135f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A6Xxwj03pCiVyjnMdg5VmCFdhQAaO1c2GrFOSdBRyLkAt6NRDLPbydyb/Z8iRlefq1AQjgbFjroWgGW12v/Xxk7R8b85bKpBQICFikyeEEo8H3j5whY2YJ/cmdiPodadKkgLGgdejIgA4BRzcJsuqmgmwHr6Yp/wcNaFe3loDISOBpINfn84VnAcBDe5ELETGOjh0lgq5KRHLNFZx8MhrioSoU+95BBSxIRuDGRmdo9pIKEum7gj3MDNXI/yMS0LaVJf2L6jV2G97t+q804ANYkgloBP2smhtR6x0BVchlRkCmQUWcIxhFWh+qN/6YHXQWziWajH2CR4FBmeHqVUDyMlKqBTIzxIGkmr0p6ZsyFxeC968Ci2tM0yNuEsKKZ229SXDYhzYBclK7zRSuCEli4jDpATp7zICW0pSqwSHpy0IUrdKzFA0Yhe3+Fh3HGECLOSj05tU5rmOcarvnqB2rVOSWtpFG/2GgZsEws9+U4FUkOknvapaW0t8CV5r6q/VL3trsCyuq0o5TkQyhKEPQcV8MsAm0aW/g1p94prDBZN4NayIwtr/2LrSqi9rMqjcGHVKVuuj0Eb8qEmv+Pp0boFY5GsO+wYrd29cAWE/nEcOR9SpYpSDeEafwBkQ4jsskUsj3Z0QD6tyl+7qb04Pg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(186009)(1800799009)(451199024)(41300700001)(6506007)(6486002)(53546011)(478600001)(38100700002)(83380400001)(2616005)(26005)(6512007)(4744005)(54906003)(66946007)(36756003)(2906002)(66476007)(66556008)(6916009)(316002)(86362001)(31696002)(31686004)(5660300002)(8936002)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTlTdGw4bXFRU0NwQS8wQ1E1VUtqbVltS0RadUxwV1NFRVVCMlZGanh5QzZ6?=
 =?utf-8?B?NCtRRXdHTmlmS25WSHhUb1dKck91Zk44RzIyOHdIRjJnbHdFWGxaWHVvek11?=
 =?utf-8?B?Y3pzU3lLbTlmTTNPdUJZckIwVUx1emo1eExjZGxicUZOdVdoQjJVclo4WWJ1?=
 =?utf-8?B?VGo3QStweUw1M3R3Z05JZnNiazRiVk81bXZoSVBrZyt4V3hsSWE4WHV2d21n?=
 =?utf-8?B?WmdhYzUyRVJCRWowNzRWb3pzekNiQyt6NzNwZmo0ZE1ubTBPc3ArY0pTS0s4?=
 =?utf-8?B?WWpqeXNYT2ZBMWtUL04zUEJxTjBlWW1nc2VFSUl1cXpBWG9pdU5oT3VJdHRD?=
 =?utf-8?B?elA5VlV3RzNzVHpQbkhDZlRYYmhvWjVZajVMV1dnSHpqUzNaK2VBZ0k3RUVs?=
 =?utf-8?B?OEh3MG1McmNKMFhxSlNVenJQN051bkp4ejh3Q2kyKzR1bGVRQVVQaVFMNWF3?=
 =?utf-8?B?SHpSRTVhWjM0L2RsTFo2YTdWcWp6eW84VnZxOUZaZVNWSTlZYlk4VGZ4UGVI?=
 =?utf-8?B?VDI0b1dXVzRSekZJeFo2SElUeHUvcjdDQ2U4MkZlRjNJamFldFo3aDB6TFBy?=
 =?utf-8?B?bjFMK25yVFFHNzlJbzNhS2l3b0tBUjh2YnhyU3lUN1JNWnhEbjNKaDQ5d2lI?=
 =?utf-8?B?VDhHbWFScXowUllMQzhweDAxVnBGVkVvYjRJeE9MMWdpTjhRSXg2VWF6KzhO?=
 =?utf-8?B?YTErbHoyN1pJT2xoZEg2T01jNEdJd2lMQkE2NEZxdXo5NGVjc0NZWlhQaTZ3?=
 =?utf-8?B?d1JsVXovZTVXaHNKZGU4bElqOUNweEp3WjNLT0xpdEUza05vOFRNSDMyU25u?=
 =?utf-8?B?ZERwQzZ5Yy9XbjR2dU8rQXhhVWdTNXJVbUMxRHptNFRrNzVMWlZFQWNLSVJj?=
 =?utf-8?B?WUhkd2Z2RldWTlhDT3lTMnJlMUg2WEtKRTkydWM2UGdNT2s1SkF4Y2t2U200?=
 =?utf-8?B?R09wVE5SV0xTclJ1dVJDMVhXVGc2N2ZuTmlRSm11V3NId1IyRUU4UWpoaFJj?=
 =?utf-8?B?ei9rd3kyZnRlVGFzNW02WG9pQ2Nza01HT09QcFNIR1JOeHFUbElMRk5qdjJp?=
 =?utf-8?B?dXpVaThpMXRYQjN3U2pMeUJvL0syVWVtSEdjbGtKTU83cjlXZHUweFlUY0Fm?=
 =?utf-8?B?d3llUHdGMXc4YU1EMk5Bb1krR2N0VzdUUTJSelNCWUNiR2NPZnZXb1hMenh4?=
 =?utf-8?B?U2ZsR09Vd0dyQnR4Qi82Q0JyTi80WjJPRVVyUTdIdzFxMG1kZklhQ2pLMTBW?=
 =?utf-8?B?VjRHdGhFY1g2bzlHTUNkNUw5UzFlQVZRMDZzMzMrWUxEOWtQT2UrRkg3RDBr?=
 =?utf-8?B?aDFDOEp0VVNzZHpHYzBZc24yMGEvY1BKYXJMdjBlV2dQNG9jT05LU1k3RXFM?=
 =?utf-8?B?QWpDK3RZUXVoVUY1cVFSQWpHN05Wc0ZvNzRIdWRQc01NY1dnSFFQcHdzTDZk?=
 =?utf-8?B?c2cya3NRcnBkTEU0K1RVY2FDWXhiTURGSTBydmpIZ1NLNVgySGsrcWh1azBL?=
 =?utf-8?B?aHdtdE1PaFJROFlpTFFRMDVKT3gwUjcyekk4Q0dFNExJbmJ6UFR4bG5aNHpr?=
 =?utf-8?B?ZUlMSVhDZm12WWV4YWdtTzFkbkJkSzJadkNoc2tMN1pQdVN2RjRNMW5IZ3Zv?=
 =?utf-8?B?czZ6ejlnVk53ZXN5OUh1RytuVkduSUJzM1E5djlkSVBKcWkwRUtYQTFtQkZL?=
 =?utf-8?B?bFBUVkEzVW9kMkR3M0ZsODhub1BkMTQ5ZGpDODlhSDRqbjBtZHE1NWpxU2FR?=
 =?utf-8?B?L1M3REVQdHlVNDk4cnlVM0ZheDNzZ2N5NHhBM0xJcmN4bzA1WFdpeUxXUVBa?=
 =?utf-8?B?UEZTZGZlQkZRalFEbnUwcEVQVWRucFBHWnVqcFczTnFsUEZOSU02V0FuVkhr?=
 =?utf-8?B?YURRK0kxekVRZnlvL1ljeU9lZm9tTHpuQ3hzeENGaEZUdS9Ddmx2ajhKdVZG?=
 =?utf-8?B?bXJrMzZvKzZud2J4Ly96cWh3bmZaeklYVEt5Wm5Ib2lWV1hNMlpFSnBNVitN?=
 =?utf-8?B?UzJ1U1BLNFlsbHliMXkydlRrNEd0ZHlWcE1LNTM4a0NxQVVLcFE3TVBCOCsw?=
 =?utf-8?B?eGhkaGN0a3dFL3p4b3d2TnNaVFlZY0J6T1NYUk92RGc3eGFkamVYYzd6amNt?=
 =?utf-8?Q?5oydErIMYZOwNeU6DFBxkUvZT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccdfd1bf-698e-43d3-fae8-08dbad135f6e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 06:51:32.1919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1hnPwbZiVmEDVegoQhhseTOLvNDFEbwQwZbsQwMZTdfXW64jp/l4X4xCxtA4kSQqBpp0tNlJ1/A5fHNjuZSzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7842

On 02.09.2023 18:21, Javi Merino wrote:
> Closes #154
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

The title isn't really in line with ...

> --- a/tools/misc/xencov_split
> +++ b/tools/misc/xencov_split
> @@ -1,5 +1,7 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3

... this part of the change, and making Py3 a requirement here (assuming
that's indeed necessary) surely wants adding a few words as description.
Grep-ing the tools/ sub-tree I notice that so far we've avoided explicit
uses of "python3", and I assume we would better continue doing so as on
a distro with only Py3 a "python3" alias may legitimately not exist.

Jan

