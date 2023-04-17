Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868B76E454A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:34:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521952.810978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMBz-0006PW-I3; Mon, 17 Apr 2023 10:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521952.810978; Mon, 17 Apr 2023 10:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMBz-0006N4-Ep; Mon, 17 Apr 2023 10:34:39 +0000
Received: by outflank-mailman (input) for mailman id 521952;
 Mon, 17 Apr 2023 10:34:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poMBx-0006Mu-UB
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:34:37 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe16::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 726c8fb4-dd0b-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 12:34:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7926.eurprd04.prod.outlook.com (2603:10a6:20b:2ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 10:34:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 10:34:34 +0000
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
X-Inumbo-ID: 726c8fb4-dd0b-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGoe6Z2TtzQjhPFeVWYZxUn9D8iK+C93BmiCbt7za3/xAXIH9Ac/lJTYlPnIRc4lcnX7R0F41wNCRGZjS0QyDtj15XM0Wc2GmcVvh/CDgTxi64BadNQVOAfYz++eiUIjGgfuzFVEAFXqVjLTkbpz5JxS7yg9fmPD8v6KWr4Fx4SvPqIXssjJn41YcGMiGTJjJh8why3yddOLrJ6ayVenye4aoJMvBpUpYGld9tImkx3ekvgnwZNPrtA7JX9co1KIKxqfwpdcse/VDD0frwUdFIKiCb/ddxrn+b9AQqlRqqj4yytS2pKFz4xBm8aTGwL5EL8Uv7AUvO6MKqeuk3Ns1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baBHCNCprn9x3IMJt6q/GtY4bteAhrnSmSni5g5U3yQ=;
 b=X6qD7iEuOsyyCWivDINDtkulg6ET0nlxPcgiHFhrYdGo4cbuW75fLsSuKfGtBMSrBUamVIn3yrn+nf9A8xFNODR2eD3RiNgwClmF+3+zCA9q0pAZv+mP5E7Po0O8AkMjHwZ6IOmaO7aG4uld7eO9zolrJxENNtt7zcLjqYY2BAZ9RHoJDbOJXuesFRDv269HfxYZ8B38pOtetivIth8pTsozmhwrXhoZDmNQsNbSdJPNNw0PeuXgPcqTQ1162pBlBChw/fDbzUQVwM1VPzgu/eofIBhmkfGbvU7u1GZCIzDmewfwhNxxtThB0Yy3jVKmYgPOmwl7dmlpc/TUnVg16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baBHCNCprn9x3IMJt6q/GtY4bteAhrnSmSni5g5U3yQ=;
 b=QJOSUO07QpEzSsqWRdaoT9g57x8iZmO1e1vGP55/opJReWF6tsrOf29yRtoooJkuPJZIi2kdSEEMxEezjEZI3SXxu+1TS6+P/em8uuMNPwQs2mmHoeA+NgYy2dwFJBtVs7I5203LJPqWZwQ+y0XSfNzLoKj+Ik6R0Vbeif3GfBkV+g9EV9q1QiZ4EPQvhI51D2S7hz0hSiMuIoxSd16CwBue49ylJLGBbSCVb7QXJzGbkraLbClHb26sdsTCO+4H+ihXyrXvvFZum8aNAgTd6MpNUVqT1w/wHSW8YxZRcUjO9z3b9ahMRvpENRUmVb4wU7KuTTs7fQJI57lqHcDkqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <963624f1-a36a-5d48-c34f-552d9d6c4950@suse.com>
Date: Mon, 17 Apr 2023 12:34:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
 <ZBNA9q5DXJYG3KVp@Air-de-Roger> <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger> <87v8i0wyv0.fsf@epam.com>
 <ZDgZEZIG89oW6rEw@Air-de-Roger> <87leivw8qp.fsf@epam.com>
 <ZD0cyXLt1knXyUzA@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZD0cyXLt1knXyUzA@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 96c861c0-926b-4d9f-0516-08db3f2f55e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hFRlIt/PT8DBDvbBU2kcVxB2ki0tPUKuxvI1nKJqAmgZ69LUM5ELygRTbdGiMPEeKci/AtsU5xsXIwBFZveYhPxdO18d18NAMCRLvC5fKBoBvtLvy3JmB+pkQIg/zy1GlEUw7vFOgbqpoSTbsR+5g+BdtfTjf6sAr38RVDac8rgp+9qc9DyMS9eXoFEYzdug1vBQGV8tuzyr/EmT4/EW2KdqR2+wRD0YEAttPo3EOX6T0X4DAjROfdXztsmyY1grJ6D96mTGGdHoCM54ZvJz5crS1pd85Jl5P0cJGd7CNfASF1RujQ06bt7CiiVtkNCDpjuEJGofcwFV+gxun2r807hUchlHWuferxcgrOPEWUvlPWNnzW3ZBoKtQnVDGPyq9kOIWF8G2oyTdD3iN3Mo3pdNmt6zjw8rPWPT3h9NixgqSGV6Fa0ftFerT93eNCH2fQN1RvnfDQSx/tCW3ZintyiJhrbaKOJdInSFlP61D4TKSVhRYeDcHIbk92VEE9SwlHjyyheXrwu1yFtFNPcOzsiy/+QgpihSmxbmEUQGKeAY0kVKFsORZheuJu/1KFTrgOTnjIS1RDg1yhyVOel1n9HXmb4/PcvpaS6k06Lp0YOxurqO2E7jpaXzHjHgXbFpDRb+qvPuhcJ1AfiV5Z/vRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199021)(38100700002)(8676002)(8936002)(5660300002)(7416002)(2906002)(36756003)(86362001)(31696002)(478600001)(6486002)(6666004)(54906003)(110136005)(31686004)(186003)(2616005)(26005)(6506007)(6512007)(53546011)(66946007)(66476007)(83380400001)(316002)(41300700001)(4326008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmFya01iZHRySHVjOUtuQ2tTOFJYU0VuZnE5RERYS3hpQmt4UmN6VG5NM2g5?=
 =?utf-8?B?Ylo4UUo0NW9lejFyTEMzK3ZoclpaT29LUFRtK0NwSEVlVkZyalJYNk5hOThm?=
 =?utf-8?B?dXdmRjEvQlE4Ukx1S2Y4ZE1JL0lsVEUydFhFQWVBTnZ3RFNDdTVnOFJxcytp?=
 =?utf-8?B?Qk9GZUE3MTd5MllNbE16MDJDaEdWRTduR0V3L0RyVkVVWVQ2R2hNWjhtd1cz?=
 =?utf-8?B?OFZFajZKd25CZTU5RmxXbTlpbmtKSlhHdmJTTUVxbjN4eW9CY045cHEzVWRF?=
 =?utf-8?B?UFgxTm5IYk5XMytOaEp2ZWlsT21pR01IbWUyWFFobk1kWDVxNk8wZzloUzlC?=
 =?utf-8?B?MTFpajA2Y1lpVTZnVHp3dkRROW8yRGlnbnFuZk1Db3huMEYyTUdtdktxbTZ6?=
 =?utf-8?B?UEVSdWdkU0VnNnFFODNCbFhVQ3ZldGtWcUVZKzcvL2h4dElROWIrTkw2Sm1N?=
 =?utf-8?B?Qi9haFkyeUJMaTl3NVdnVnhXc0JSYXkzTTc3UHp3bjArYWs3QzlzMVR2YWcv?=
 =?utf-8?B?RUMyV2tOcXh1cjNlZG5BUXlRUmdldXJnS0pqR0I5Y0h0eHJaQi9YYWxOenJy?=
 =?utf-8?B?MWYrZFZwSkNNYU5GZ3cvamNjU2FCTWVnVVZNZ01tdHdZZE00aVVqMW5FQWZR?=
 =?utf-8?B?eCtDUGpIWHNLVlMzcXUvNVFtdG9oVVN0dzZrVXZYelhzTWd0OHpBc2V1RUIz?=
 =?utf-8?B?eEJ6eWNIVk9aamlrL0VHT2wxdmdRWG1lKzE1bkFFaHlZMjBtVlFMMzlYdWZK?=
 =?utf-8?B?cUJYTEwyc01xUFdxTG1JWmFlUVB2L05makc3UnREZUZuRGVTRk9CazJ5ajBS?=
 =?utf-8?B?djhXVlRSREhKdWlOVkMvQ0FxcER1M1IwVTJGZ2RocFc3WitUS3c1TUYwbEda?=
 =?utf-8?B?THV2ejZhTjJMV2Y3dmFOUmY0RjFFUDZqTnhmeXpCYlhZZ3B4Um5TaVppQitV?=
 =?utf-8?B?bFBxTUNONkNrNW1aUkNqNWJ6MHh1am9JNzZaeVQ1UUxZQy9qWHpmN1hoUk1O?=
 =?utf-8?B?OHBxYlViN29IODR6eDRjUmxDN0YwYXBSQnpnWTFWSVpyTUozc0RNdXQ3d0FJ?=
 =?utf-8?B?THI1dXZMbjRRaGcwdEpzZkxBblZjNEk5R1hTbk1SaHI5cUxkeHhHcmpCVU01?=
 =?utf-8?B?K05hMEdSZ2RVbnhqTTJwcFNxdy9yekx3Wm5UcTV5WXlvTDc2L3VtQVJYMTBk?=
 =?utf-8?B?VU16Qm5VRStLZldyeUdsZFRqUG5idk1VdTJaQVFTQi93NDFVYWQzTlFOalkr?=
 =?utf-8?B?bi9tUXNKRU5pK1l2bzZZRWRiRWlmMWlkcjdrNHc0eGpZVE56MzYwWXBmWWE5?=
 =?utf-8?B?QzY5VWVWdSs3Vlo3SFF1dDZjbkxuVzVIakgwRUJmK2N1dnhEQUNQRGlFVXE1?=
 =?utf-8?B?OHNHR2NSd2hLckVJUjBGS2dZS3FLNm00SUd4M3JZbkdYVEJPRmxnYkxpdDJw?=
 =?utf-8?B?U1lUSzhvNjc1KzRxaERvK240QS9zbzJrNDJXYXBZS3dBUXFqeWhEdmJLOHJQ?=
 =?utf-8?B?UkZLbk1JZkpwd0Vvc1JQd1lLdWY1U2xnbGpaelVtQzNQZ3k4NWJSSUVEZ3dP?=
 =?utf-8?B?dGRNY0ZTbFYrNUZ3bE5aY0YrK2djNFlIWnB5dXZRVkJ0Qy81Mmd1Y1hZU2hh?=
 =?utf-8?B?NlJMcDhNek93YTFmek1idU1sTXNmeTc5WWhQeHo0WXFxdGxsSmZqNUlQa3hW?=
 =?utf-8?B?U3VWUXVnd2Y1bnhUSW9kRDE4OGMxWGpTRW5IS2dwTTdVb3VGeGthSzF5NnNl?=
 =?utf-8?B?Wm9MOUhoU1FiR2tiQkMyK21pWlV1cjVDY3hMTURWK212MWFSZitpY0taWUVU?=
 =?utf-8?B?RldSeXluLzA3RU4veWh1WXByQ3RGNC8vU0F2ZGNuRk80Z1RValBNR2o2eXZx?=
 =?utf-8?B?L1pBM0RZVWpMYTdJVFZUOEwrWFYzM0p2eUdtc1pQNkYzSXNwZktkbXk0bUhX?=
 =?utf-8?B?SFBRd1c0NGtRTEdZSTEzdm0yK2ZJajBHclZOK1YrRlVUVzltcG84RGhIR2ZP?=
 =?utf-8?B?czUxM3Fkdlg0cSs1N1hnRk92UFR5OGJOeEl6WkpGeUw1OXlyTkZnQnNpQnhG?=
 =?utf-8?B?ZkVZYmhNbXRZTVVEVE14UXZCYVBXbWlrM1RmTGNJQkc2cnRwREpESWJPSHlx?=
 =?utf-8?Q?p3iL9QITGSzYB+14OwY9qsd2J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c861c0-926b-4d9f-0516-08db3f2f55e5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 10:34:34.2297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEKdjnPS/PgBS5NbOMnGdM/YursXfuLO0pI6i6yNDZnkjyBynu8Qzo/M9U0tm1xtySWkYxc+FXtodRPnMnU8fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7926

On 17.04.2023 12:17, Roger Pau Monné wrote:
> On Fri, Apr 14, 2023 at 01:30:39AM +0000, Volodymyr Babchuk wrote:
>> Above I have proposed another view on this. I hope, it will work for
>> you. Just to reiterate, idea is to allow "harmless" refcounts to be left
>> after returning from pci_remove_device(). By "harmless" I mean that
>> owners of those refcounts will not try to access the physical PCI
>> device if pci_remove_device() is already finished.
> 
> I'm not strictly a maintainer of this piece code, albeit I have an
> opinion.  I will like to also hear Jans opinion, since he is the
> maintainer.

I'm afraid I can't really appreciate the term "harmless refcounts". Whoever
holds a ref is entitled to access the device. As stated before, I see only
two ways of getting things consistent: Either pci_remove_device() is
invoked upon dropping of the last ref, or it checks that it is dropping the
last one. The former looks architecturally cleaner to me, but I can accept
that moving there might be more of a change, so wouldn't object to going
the latter route.

Jan

