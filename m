Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1F16D0ADF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 18:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516794.801489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phuyP-0001jr-PU; Thu, 30 Mar 2023 16:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516794.801489; Thu, 30 Mar 2023 16:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phuyP-0001iA-MM; Thu, 30 Mar 2023 16:18:01 +0000
Received: by outflank-mailman (input) for mailman id 516794;
 Thu, 30 Mar 2023 16:17:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiWc=7W=citrix.com=prvs=446b09b9a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phuyN-0001i4-Pj
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 16:17:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ccccff5-cf16-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 18:17:57 +0200 (CEST)
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 12:17:44 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY5PR03MB5000.namprd03.prod.outlook.com (2603:10b6:a03:1ee::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 16:17:42 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Thu, 30 Mar 2023
 16:17:42 +0000
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
X-Inumbo-ID: 6ccccff5-cf16-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680193076;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=iFpHDpTkpP9jaj/L6dnLnJNfkeEr0jufmkgET8tMWJ4=;
  b=FHJ6Ec+5rEkQEYKid7Rs7WbKnu63DN50paK4B0kSDuV4A/D8mvs/LD09
   WlzkYpAVvD+XBT1AX2dw9hr5RFocbH9wZUG5tjrLVR0PGFscHhQBQblby
   p2ejVwU4aIQZ+fbN7qxzgGzo0vcsV0ZG17G/tj5suG0wuVavlrwmpEXC3
   U=;
X-IronPort-RemoteIP: 104.47.70.108
X-IronPort-MID: 103077549
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:g6RGqavLWZEboSUg8x9Mo3aDR+fnVGtfMUV32f8akzHdYApBsoF/q
 tZmKWyBbvjcYGbyeN5/aY23o0NXvMOAmt42GwNupXszRSpG+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASFzyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCS02LQyfpNiNxq/rbuxO2ugjNfPAFdZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiANlKS+Llqq8CbFu7yWAIAhQXCkKCvLql0kWVZOlYD
 mJIw397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L85g+DA2EeQz1pado4tdQ3Tzgny
 l+ImdzyATVl9raSTBq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseJNZlfXwEDD0h
 jqM8y43guxLidZRjv3ru1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nW/MBRaI3hxI2U2ss=
IronPort-HdrOrdr: A9a23:4Onv36DEKzvPfjTlHela55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZImPHrP4gr5N0tOpTntAse9qDbnhPxICOoqTNCftWvdyQiVxehZhOOP/9SjIVyaygc078
 xdmsNFebnN5DZB7PoT4GODYqkdKNvsytHXuQ8JpU0dPD2DaMtbnndE4h7wKDwOeOHfb6BJaa
 Z14KB81kKdUEVSVOuXLF8fUdPOotXa/aiWHSLvV3YcmXKzZSrD0s+BLySl
X-IronPort-AV: E=Sophos;i="5.98,305,1673931600"; 
   d="scan'208";a="103077549"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtoHFhMUsUzaVRRjPM00cMW6QtvkURZu9YUXQqZntcRrkf2gf+Pd9Nl1K2N81AT2gCEd/t2lnHGdiBffLDQovZZydWSQFC7PCsgsvGoSHzLO++K9aJZ8/vVoejlln5srqJLO55tAiLW8ABKwU7mq3hYoB/6A4QpSu4qxwbfB3Dojw0y76/8xGdmGDQCYY3RYVEedWsYhrHXh6+mrXXplJN5X6A2RQSrOXCfvMjI94xRPLc8OgtyV8gud6nlSj76ucmy5qy+m3zfPLIENukv3gOFNxVzy0GbUzdf9MQ+e0cs+SJsyZ/RHL1Gy+zVZLftBpsvCpH7s2fVend/ifPb2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=em7eAcOH84sb9CI6wNZvCbA9Cerek/Jl5dXFIQOBVp8=;
 b=NDMHCj9vdaO2fZFjjNjIwHjfa/VeOkzfbUd78KNTbrflrj2vfiA/OeAxNk//8kyYMw52NsLk2Vg7IGyKiZHa/ULZNrOQkWFj8Ta/XVEfNjq/mpId4kb2M89Fb/WdUFqx0N6Vvn71cjKVzzYNZIs3R1Y2yJ7urvyWtE0dDtIZw3TR+AA4dfAa+Z5Qp9aAe6dzrIXirGfsT53dPnxrkxLkEpCSeXIsY05UMlcNvZg8vylp5CmQE1pzTIu40yZF1XabERfbxWgesNnA+JSgGOD5dzYiKYTzrcNKEA56w1XvjJK5lnvfvTcYSisWRzP2wuHcTYTkFmhHAHz+fwtNm1KffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=em7eAcOH84sb9CI6wNZvCbA9Cerek/Jl5dXFIQOBVp8=;
 b=OZ/gBFKVsy0nRbA0cPzRYHnzs0+gu1hXigsi3qDws4klkZrEcwGyLlozFdB0K7+AcyuyEQJojbk+x4cTOQQJF0Hqvf/CyRglYY1Wabco0zRhBuCekEpTlahlWW79LfyZxmPO89PmhdUg52rB+vBBff+X5TL4q2FDO3MGBwdgS9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 30 Mar 2023 18:17:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: marmarek@invisiblethingslab.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] efi: only set a console mode if the current one is
 invalid
Message-ID: <ZCW2IHKP4GHNmBuk@Air-de-Roger>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-3-roger.pau@citrix.com>
 <c62446e1-8e47-5fa9-1c7b-a441d38711e6@suse.com>
 <ZCWuYjP7L4obvXt9@Air-de-Roger>
 <50fe2ff9-9633-1cbb-4afb-b577778d3edd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50fe2ff9-9633-1cbb-4afb-b577778d3edd@suse.com>
X-ClientProxiedBy: LO3P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY5PR03MB5000:EE_
X-MS-Office365-Filtering-Correlation-Id: 978972c8-4053-4b22-c791-08db313a49f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	trO09HTIIpD+Pe2E5pit+S0gMa0lygsSiIqvlptEMTmBliMY40GbPzlO4tgiqDlyLmNwTPJjlafd1CbYtXwrHdZNkgeDRPMO/eVC/TtFc6e4oiuGcwvFjNPn8OIEQEe2XvG1GKYxQ83p56ETvkCG5BJIQMTGexWXH06LzOX0sZnYwHIxxZ3yB0zFwQq86WkcuHtQaPkJhPIZ+aoFFtZ6wVqAakYiwpXhkKxRKKgLzo4Mu5nwu4Q1K9TxIHDQwSOvJ9BPEjwik0NADvoOdhmovc6d1Yys17mrAHvX1qmuOdr4XBp0fYH/QgSQPTmXtD5ZG9w7M1xiGuHgZ+CxakMjgdVw2+1YYCLff5zK6AMLyuhCDR4rbilUomPhXwEbeIOSPnIjMc2kszr4+quhweGM38viF4/K4gfzk5/h2at9uE5D/vVg9V8WYcI51uCDtF30gL+ri7ht/tBLUuttKKe5hRMw5hv7cFo1acNpxgRVPLyYzzmLPDeDnAxCCeuNrp/aA/EvtcRUR5kvwCUxX66S+1qkMKJmt3QATFIoXdku1iSo5e6x+0ye++qdimwVet1O
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(478600001)(26005)(6666004)(2906002)(85182001)(316002)(6506007)(6512007)(53546011)(186003)(9686003)(6486002)(33716001)(6916009)(66476007)(66946007)(66556008)(8676002)(4326008)(38100700002)(41300700001)(8936002)(83380400001)(82960400001)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVcwM0l2NC9kNEluRVRYbGlPTFJUQWNpZVRZSWxrUUphMWIzczczTEYxZ2pu?=
 =?utf-8?B?dlN4TDV2U3IvTElBMW9NRWRmQ04wUy9RQUIyR0F0TUxzbjRRUGpiV2VybzhC?=
 =?utf-8?B?ZWVIaDdVUjRObGlqOWlZbFBQMzhMTkFweXlhMGhpSUltYmxYdzVKd2YzeElk?=
 =?utf-8?B?UmhFZFQ0R00veFlUT21GWHZ4Q2tkanYrc0MyVmZYSndwQTBtSVEyVFd3eHNG?=
 =?utf-8?B?SFF0bS95TE9sWjhLTm42KzJsK01RcS82Z2xuZnJYQ1lZNnkrR1NNY0NiYU9r?=
 =?utf-8?B?KzJyclJJb3puTElNYy9TVXIxbU9ac21LbU9xaGZ2L2dVSEttUWp4czFxbVJX?=
 =?utf-8?B?bVZVREJzVzNJZ0FoUFpucnhNVjd6RFVscU54VFo3emUvWFpOL0tZa1A1QTB1?=
 =?utf-8?B?QVhza1cvRnp5dXRPcFoybFBPVS8weXFJV1ZxVklveEZWUUZiTnJ3QitVOXI1?=
 =?utf-8?B?ekhhNHRTTEhXanBreDhWWlY4WXVOMk1vVFlTUHlOVVZNNkVERVdYemJRb25C?=
 =?utf-8?B?SmtsL3RyYTkzdm91bnlHYUs4cUZ0R2xZeng1Y1NGVVhmckFDczJDbzUxa25P?=
 =?utf-8?B?ZUVNZ3MvU3ZXY3NENUN3U3BSajV6ZDhQUjl6UXR4WFNjbEkrMXcwb2JYZS9o?=
 =?utf-8?B?eDRFaVloMlphL1Yzc1U3amZuNkcyTHBSUVBBS0JqQTRIeTRNTGk3OXRMSVZi?=
 =?utf-8?B?UlFsMllOMFhEM0dNajZKbWloeURKRE0zdWhPN3piVGNzZVlmQm5lcUhFd1pM?=
 =?utf-8?B?bzNlcTJjUC83dElrazArTElCcXQrajNvUGRQT0p6NTlkWXduT0wvdVZJTXJ4?=
 =?utf-8?B?K2YvZlVKQ2F1cnJuU3NrVjc2WVFoM0Vqd0gwZXlPTVVnTldEYXp3ZkpWU2Fy?=
 =?utf-8?B?T3kxb1I0alFaT1QraDlVYmJxRUYzNkpqWnUxdmdEVndrWU16MVNpclByTHVZ?=
 =?utf-8?B?aXBQTGI4cmIycmVyV05KU1pRS1Q5QVJMaFc5cWQwaUJWS0JsVFN3VnYwQzN1?=
 =?utf-8?B?SGp5Y1d2UWUyZ2JMKytOUytGVWlyanlpMWREb3RIRWdpcEptS2dsZFdjL3Qx?=
 =?utf-8?B?cnIzNzc1Q1ZVcW5qbEh0OFJjNlFTaXdNYU9EVytsYk9HOXB0SFhvV3QzTE4r?=
 =?utf-8?B?V1JmT3R0cXBiaVA4bWhNZHBYMC9xYVZqSVJGTE1DbGNrOXZOSXQ2cVlyOWZB?=
 =?utf-8?B?bGNFSGxXUFFmcldLb3BPM2VIR2k3Z3lnZU1Sc1RyczM0RllTcGhzdmpHRU1i?=
 =?utf-8?B?Y1E5QXN6NnBIZDZnRTdIeEpYczF2RGZwVlM3eTlhTjBIRWhla2NEYnQ4ZVlG?=
 =?utf-8?B?SVF1T0hCKzdZRDNqTXhKUGxrZitWZTZGRm9wUG8rR0tDeE0rOVZTaFF6c0ky?=
 =?utf-8?B?cTMzYkcrd0tuS2g1KzBSOExWamtjMUlKQnlOb2taeVRDVWl0dmIweWs3YkNL?=
 =?utf-8?B?bmluVlJHdlg2ZWVXVXpqT0hkU2hHZllzaTJ2ZUF5d2todCtFQ3UvNXdXNEZT?=
 =?utf-8?B?NlZwNWVZaSs1dDVXd0RHd2RZb21Wb0FzSG12Ni9Vc3l0THpmVlB3RUtHQWJu?=
 =?utf-8?B?Nlk1dU9WRERLWTJHRE5qRkMwcGl5MEhyMSs3eTNXeDg0UTYzSnVyUkVyTDQ0?=
 =?utf-8?B?ZjB4UlQ4d29PV2I1aHdDc29Jc2ZZQTdnQWpJaWd6YTNUTmVOZCtYbHREQnV5?=
 =?utf-8?B?emIreld5TmtoTVBNQ2ptWDlGN2gvaUFNc3o4dlh4UnRobmh5QlFncFNOK0VV?=
 =?utf-8?B?QkZzM3ZwUGhvbUhxZlM5QnN4a3BqMnc2d1ZHTGltNis1Z0ZWaEVHRnB2REpq?=
 =?utf-8?B?ZlUwNlBqR1dBWTNZZkFLd2l5eitSSFJrVTJiaWIvcURyeVRwNU1VSWZUMkFR?=
 =?utf-8?B?b0tzOVVtdFdoSHh2bVRVclZpNGJMVWgrVkRxS21tY3hJVW43Qm4rSXdKWEl2?=
 =?utf-8?B?M1ZXQkIzYk1YODc1NExabVpzUmRPVHBBNFlTQXBjcUZ2UjFvZll1QndHL2NB?=
 =?utf-8?B?cTBpdWxEejNmMWQ1MXpzRmVEL3MzOUd3TzdacFhmYmVXRTBjTWtleS9oTGFN?=
 =?utf-8?B?NnluMDB1OFdoNzhMZ0FtZ2R0RUxnODJ0SjhINnBIOFFSelRJNGtCYzk1K05p?=
 =?utf-8?Q?QpDwoAqW752GnsXDjvSeAJume?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J3W1deEM/EdI8dPDOKjB6qVNnoYG+N23fJ5dAWhPsDL1EA76cSJhf/TEDs8NguEzos9de+iibjzU5qs73e73NTn54f6BkHvJoVMt+P0k2qCJmL8o1ZgDLWt/vyaD4WV2uw5oweqjQQSCZXJNsNL31iLQcVMBdPwzc0GkxeZ58tp0g1Ho0kaQotfdI2HoR3WC7CUZVxR2xGABNZTEnjqEbgFtMTjPiHdVeaZWdSkxERo1WbVrC+uMfn2J4O1WFx7pIYh850uJVLpax3CCuw21JcK528plmwjI2084jCKkY7ZyZRBXycaiHqG+1t3Z7VcAqkOfPtom1+f0c+e7LNVdqK8uuzxYL/163PSJVAu4eg0GU/31f6gL2/CGvIHojYEpjH0c/Bh9W/q+HyFhfwf1qQ7s/iEPe9rrSMQn9qUqKKjk4nHyClcekDPturMU497EJdZmdC0jsq/pvcCQIEvQWEh5cxzfvzhljYENV9KudvulIXsJ93WJcTh9RC8oP4vRxuIwyQhsBYgHrt1V9cfaowoRG0sk5iErSoPwMbMY/SR/r8spIJ1OLXnqSKKr8LT/jtbQEFQWkek066R0ecky59bvtejy+X5yWE5ELEN3Anct/cQv+HixUlgLZlpkxs1PjXe26mE/yC1njUMkzXp9vdHzaHiOn5AwlLtdukhBDdxhG6X3pCERvx4T3d5hqUbkLAiyDn1q63AsnmE6kj69HamhXZ/mNt58rGt0uFJPeIw6MCwvtKVuehAYimfdY1HYgYZvvyNLC1CTLDd2WcCi16TzMc/cahnc9wCixMzGlY6WQNkeRcDwdDfYL6hVyaCmDlcCm9cSj3SiQjhI8fyzDYXXBjspbZYaluYcielpY6k=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 978972c8-4053-4b22-c791-08db313a49f0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 16:17:42.3312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrmHBmZLffdxBsPn8G2Ks8sIHD44BxugUvgnzni/FKIelQR5GLQps7LMMXUWrh8u2eG+tIgK6W5U/sFdidaB1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5000

On Thu, Mar 30, 2023 at 06:07:57PM +0200, Jan Beulich wrote:
> On 30.03.2023 17:44, Roger Pau Monné wrote:
> > On Mon, Dec 05, 2022 at 03:19:13PM +0100, Jan Beulich wrote:
> >> On 23.11.2022 16:45, Roger Pau Monne wrote:
> >>> Do not unconditionally set a mode in efi_console_set_mode(), do so
> >>> only if the currently set mode is not valid.
> >>
> >> You don't say why you want to do so. Furthermore ...
> >>
> >>> --- a/xen/common/efi/boot.c
> >>> +++ b/xen/common/efi/boot.c
> >>> @@ -799,6 +799,11 @@ static void __init efi_console_set_mode(void)
> >>>      UINTN cols, rows, size;
> >>>      unsigned int best, i;
> >>>  
> >>> +    /* Only set a mode if the current one is not valid. */
> >>> +    if ( StdOut->QueryMode(StdOut, StdOut->Mode->Mode, &cols, &rows) ==
> >>> +         EFI_SUCCESS )
> >>> +        return;
> >>
> >> ... it might be okay if you put such a check in efi_multiboot2(), but
> >> the call here from efi_start() is specifically guarded by a check of
> >> whether "-basevideo" was passed to xen.efi. This _may_ not be as
> >> relevant anymore today, but it certainly was 20 years ago (recall
> >> that we've inherited this code from a much older project of ours) -
> >> at that time EFI usually started in 80x25 text mode. And I think that
> >> even today when you end up launching xen.efi from the EFI shell,
> >> you'd be stuck with 80x25 text mode on at least some implementations.
> > 
> > Won't you use console=vga vga=gfx-...
> > 
> > To switch to a best mode?
> 
> I don't think "vga=gfx-..." is presently consumed in any way xen.efi.
> Doing so would require a similar hack of peeking at the (ordinary)
> command line options as in legacy booting, except that in xen.efi we
> read that command line from a file, which iirc is done only after
> fiddling with the video mode.

I will only take care of multiboot2, since I don't have a way to test
xen.efi ATM.

> >> Overall, looking at (for now) just the titles of subsequent patches,
> >> I'm not convinced the change here is needed at all. Or if anything it
> >> may want to go at the end, taking action only when "vga=current" was
> >> specified.
> > 
> > I guess I'm slightly confused by the usage of both GOP and StdOut, I
> > would assume if we have a gop, and can correctly initialize it there's
> > no need to fiddle with StdOut also?
> 
> Setting the GOP mode is done last before exiting boot services; this
> may be a graphics mode which doesn't support a text output protocol.

Right, that's what I was missing.  I assumed that all modes available
in GOP would be compatible with the ConOut mode.

Would you be OK with leaving StdOut as-is when booted from multiboot2,
or there's a chance of things not being properly setup?

IMO it's not very friendly to change the StdOut mode if not explicitly
requested, as in the multiboot2 case that gets setup by the
bootloader.

Thanks, Roger.

