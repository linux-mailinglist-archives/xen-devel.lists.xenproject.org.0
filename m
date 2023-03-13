Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F6C6B7916
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 14:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509278.784759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiMV-0006jt-Ae; Mon, 13 Mar 2023 13:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509278.784759; Mon, 13 Mar 2023 13:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbiMV-0006iB-7u; Mon, 13 Mar 2023 13:37:15 +0000
Received: by outflank-mailman (input) for mailman id 509278;
 Mon, 13 Mar 2023 13:37:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=koCJ=7F=citrix.com=prvs=42903c55b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pbiMU-0006i5-5i
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 13:37:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99dcc31d-c1a0-11ed-b44b-930f4c7d94ae;
 Mon, 13 Mar 2023 14:11:46 +0100 (CET)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 09:37:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5365.namprd03.prod.outlook.com (2603:10b6:610:a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 13:36:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 13:36:59 +0000
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
X-Inumbo-ID: 99dcc31d-c1a0-11ed-b44b-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678714631;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LmT0CHabLUNAh86KdimLPknycg/YY9KZkkqH1MNgNj4=;
  b=K1q6SfOzPEF6JO1aDsxBCGWprSz6zUKQ3rNnRjf6zV4v3jNAkwghJTIb
   eGUhnCoMrYeP/Rh7ZawPlnbXnI+ywzgbz48llAyZEjNh/cr6aSqRB8nW6
   Wz3nBmydtIF3u9uVwi4AxsaVeb/lm2OTQqhyJzABGM16aWviTtPAMvM9l
   4=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 99417572
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WI58L66ukDDDOpkh5YXs8QxRtPLGchMFZxGqfqrLsTDasY5as4F+v
 mFOW2iGPPmMMzCjeNsgb4SyoEgCvMDUmNU1QAtkqHgwHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasS5weF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 8InMCsmdiG4hLiR/rO3a84zudshM5y+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+WF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNDSOTnq6Ew6LGV7mpDVA0XRWGZmsakzWGyaf9AI
 l0N6wN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19KqQrD60ETgYKykFfyBsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 y+OhDgzgfMUl8Fj6kmg1VXOgjbprJ6ZSAcwv1/TRjj8sV4/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8NJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:xklX565KcToOU2i++QPXwBnXdLJyesId70hD6qkXc202TiX4rb
 HMoB1/73SftN9/YhwdcK+7Sc69qB/nmaKdgrNwAV7BZmfbUQKTRelfBODZogEIdReQygdV79
 YHT4FuTNX1Hhxhity/5AWjCd4vzJ2G/cmT9ILj5mYoRQV4L7tm9UNiFg2AGFZ3XRRHA518HI
 Gaj/A3wwadRQ==
X-IronPort-AV: E=Sophos;i="5.98,257,1673931600"; 
   d="scan'208";a="99417572"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDJAztTfUfDYLBRWV5zLsvTQ5beMe1CsdSiFTN9cdUzUovKPL3T0qxwdcEB0V4fTn2aJOUEwerkaW0ltmb5X4r+g33icTesffECylYooy9WBPuAjnYsMxbbZwNLaPXLbR+HyymeQ2FR+rq1Kj5TEl52aNsSWuXZeGR3OVk2HXD+z5fq5AGUNphBT8p0i4Mt9LrzoywKc4ZkEzPiRCmrpLvcEwAQ+Qo5mi74oGhVOq/bFhZZ4EZbql5Pz79a54ivgg50EUq7x7M19bNDwdbBTgYyjMzZFRpNp0CU/ahEztb9IdQKDLCqpPn1XRjnPts9Ga28sKJ9b9yW5PxZ2jMd1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckj6+/q1FRsp7eOBkvyOHQWaWK6QwyzQiWg0//eFKj0=;
 b=StQmGuXp9dacfNduD4UMneedAcI3YaeiHl6jiGEyFy0urNv3HlOFAsntXsMQxkOfbFIUDR/WVcpRO4uIEI5TVRjuGin3l/YPkHjYE/e8/jaLIdaw559tCBwkAjcvQPAtEKJAOA57r9N1sKE46gT4JVnM7P645brmwuCzz8R/doxJhwrBfdSkFZ/wOl+sZRlAg28oOyHKduaomrnCeRLSqHOy4s53GM8Kmfz6qHt1NZaNHPb+1ebZw7khJqVU8/OoCrYZRJ13NnPNXj3N5DnjxanY4gA3jPjF7xqVvpT3aiA65yBtxCOD7/Es5zI7HmRCeYkp+K4jM7NAu3QYjQLpBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckj6+/q1FRsp7eOBkvyOHQWaWK6QwyzQiWg0//eFKj0=;
 b=dZh4yqQgawFI39q7/2oYDhJKCN/K1J6EMl0DZkUZi6fR3ERbH31/bZHXZnjZT4wfTaM1BbzJR+wFBZ5iV4hDZovNlKns8HhceN4huFnqZWHaBsSGRj2LQVGa5aXTrDW2YcQWqjg4uJzXcLo0cwubrj6ZgqIn+1NbMiSONVS9B2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <69804a5d-e454-2eeb-8826-d585113ab341@citrix.com>
Date: Mon, 13 Mar 2023 13:36:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4] core-parking: fix build with gcc12 and NR_CPUS=1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5a2ee9fa-df29-6665-771a-970c00c58838@suse.com>
In-Reply-To: <5a2ee9fa-df29-6665-771a-970c00c58838@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH2PR03MB5365:EE_
X-MS-Office365-Filtering-Correlation-Id: ce506d2c-a4ed-4a29-9c48-08db23c804cc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PVjKpU7gCxgGrwLXRbo4ZKCn+7nvo64PsvEejq+GD39+8jWLlINMoZ5pEdCG9ZbpefxnzOeAZAzWfYL2rj5AeiV4ZMqq0+JpYIVKar5FaQeE4YJK0ZHTPJIYTdOIQjXRSbUrsl42RZIP7JadyqvnAIQpivtdzxo643oZTQ2oIp+UXMLse25AHJViNSKFgIqqmCd25R0AgtXbN/3sl91ykA73Y7zbKpbeWiJlCG9de7Cs9XuV8YKRx6KZzX0Tihy+PbXbQdk9FmnCCAXxbE50wfPBonGGILRbLmSr3vxitbmxUC5a7gVJhSsrFcBLSd7NrrE2eC+QnFv7PNDhRCrB0982ePga3FxLFVLlfpeFnndu8IIg63aoVzlhv6HUzaLoUYvISQSOD0ruC2r1qOBJ9JoDTf4DWjT07YDi5FyAfO2NkTLQXzD/PAM77fw2HGz8psOqa1HAWbspxvX2D0E4+Qv6W6nethEN5/Tzuh8/s1wZWOIUeRslKKdvG/7ifUVQxF95FMDWuIyVtB+jn7ZhtJ9rORdkumB/BgA00tgPI1xLf9uU7z6TtV/xWlZNwZO8q9Eo3LuuHnQ4m81xHogphdKKrEDshBv5eI2rg4WJNZPr1t8bYGzejP2P416C1SPBQA08bco4tJ9gUfXJ+VgLMcCFzPAPgtQkE5yt/k7t7/9FUY9drJpPFKN1oIl7wilG9oINlbXqc7MZ/XXbpsbXF/iPzGWGNzvx7GA/+GvLVXY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199018)(36756003)(31696002)(86362001)(82960400001)(38100700002)(4744005)(5660300002)(66946007)(316002)(6486002)(110136005)(54906003)(41300700001)(478600001)(83380400001)(4326008)(66556008)(8676002)(8936002)(66476007)(6506007)(26005)(6512007)(6666004)(107886003)(53546011)(186003)(2616005)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnRBM29aaXZFV1h6QUQrRkg1QUxUVis5Mmk3U2N6ejBMbjFRUU5aREk2bVRN?=
 =?utf-8?B?UDF0dlFHM1B3UXBOSXAzQkJvRGo5Tko0Z0kyN1Boc1hjSU5JSWZzdjc4UHgr?=
 =?utf-8?B?OFJmUW1KMi83TUU4dkJCU25vYVNOeUlZZzd3VG9kSUtwNlNjQkVFYk1nblFh?=
 =?utf-8?B?cEplQTNsMHNGWHNlaVdjZmJZb2t0U01pbjlUVlpqSHJTQ2NXOFlweVpXNFk4?=
 =?utf-8?B?UGhYUTBtRkRuV2J3RUlvc0NNdEllVHFBWUQ3VlRpT0JQOFRMWVQ0UTN0MTYy?=
 =?utf-8?B?NUNzMXlGeDNyaVhESkl1T2NDNEpaUkE5SkpQVFI4NXdWYUNPZ3pCekx3b2hH?=
 =?utf-8?B?R3BpWEF2R1AxZTE3blVISWhmdzZqeEhtTVlmSGJicUtQRlRBamcvNFV1Ujdi?=
 =?utf-8?B?WVhscjd6bW1FbmpkaTQ2RWNzRkdDWVJWV3R6bEx5WlI4MUtleXdWYkYzTm9l?=
 =?utf-8?B?N2ZoY2g0dzY2K3ZSSy9pOWhTSkJGd3I2S0F3enVpdkpPaU1wa0lpYk9GeWFL?=
 =?utf-8?B?MmFwU1VrTXdPNE1lSWJscGtVYWlwYmFZSTV5N3Jmb2JhVUtBTjdSMnkzUWtH?=
 =?utf-8?B?UFpZaVRaK1RtVExCYS85Uk95NFFXcnBuRkJkcWNtaVhncHp0a0R5WW1ZOWw5?=
 =?utf-8?B?SDRHUnNUMzU1L2dGWndFUFdCNDM4RUZwZzVBZG40MGg1Z09qc2xIU0ZhQlpp?=
 =?utf-8?B?Mm9ZbXNUZ1p2ZVZTR0dHOGZHSVI2SDNOVEw3TTNpUnlqWndrcGJNUi9MQ2Vj?=
 =?utf-8?B?Qmd1eVpwSklqeGFIUjIvUm1wWk9DcXk1d1pmbXFZQ05HSlFXV2RsV1hFYlY1?=
 =?utf-8?B?L0xKRmlwbmpJSDVMY1ZIekZhQStabHpobHF4RmZ6QU9mNTl1VXZlN2VCZTFF?=
 =?utf-8?B?SWFESEQxRkRIMzBMOVVacGpuT1UvUmtKN2dYV1F3aUhDU1RSa2p0UTErVndX?=
 =?utf-8?B?K0kyKzBoeENUSFY3ZFVTaDg0TUx3dFI0MCszOHM0dFJ2Si9Jayt6WTBPYmhV?=
 =?utf-8?B?bjdCa2VNSXp5aWcveGM2M3lUMTR3R016c3M0LzUyNUR5QkVjR2VWaC9Zb3Zo?=
 =?utf-8?B?Slk3UVpFc3E5OG9QS1NLMEJiSkNjZHlhQzJ0eVhjMVMvM3kra2NaeGgxaVVt?=
 =?utf-8?B?Y2xZUFU4dTVIUGhGUE9ENkNiUDdCc3JoRm5lUzZEMXJCWktHSzlzejE1eGxv?=
 =?utf-8?B?Z1lrdzFvdDBBVUZ5U1RTc3ZUVkl2Qk9DajBraURGSUpETHpoSVVWUnJRclA3?=
 =?utf-8?B?MjZjRjJubTBqMVJGM0xxdnRjcG1xbE5GUVR5cVhOVFNBWVhDeXUxY0lpZFFF?=
 =?utf-8?B?VVYyb0RtSWxZaG9pMk1INFM1MW5DM002cFh4c1k1SDdMOEI1RU5BMGh6a2Ux?=
 =?utf-8?B?MWM1Nnd4Mkp3cUlXUUVrRjkwaXhob3VhTWFRZDhYUmU5RGFxamMwSlAxeFEv?=
 =?utf-8?B?R214ZU05OGphaGtOZExSWXJmK1lTSkJ4Y2NIYlo1NDJlY3cweksxOXlhbmVU?=
 =?utf-8?B?Y08wOHhyaWNjQ29tTGJnbUJvdEx6RGlYenhockgreVdHVFlZTDFWU2pNV2pU?=
 =?utf-8?B?TEQweURuUXBseXZIRDRlMkVqRGc1bU5RbmY4cTNzbjB1M1VKU2o4S2Z4ZVQ3?=
 =?utf-8?B?WXhPV0xtZEVCeTJDKzlJalJ2MUpLeVFYeE9nL3pRNjZYMngyc1lWcUtWOXNV?=
 =?utf-8?B?SUFSZjE2dnpTcTlGRFh6YVZYK2NYL0pHQjJrQWp6eG1sTzBHMTk5UGtPUjdy?=
 =?utf-8?B?SXV5QlpueXRmM2VIUTNEODdVUGNMWVVwZ1JESlhoWVcwajJnVTBHQTdpMEc3?=
 =?utf-8?B?amFFZnIvekxncCt0UE0xZzI1SStDU1FjTHJRNnA5UHFkTFBoK1V6NTBTVlJR?=
 =?utf-8?B?VFl5WmNqMG15S3VobUducktaWmlwK0ZyWmNQVEp3cExqM1Y2UC92VVJ4K092?=
 =?utf-8?B?QUVCR3NVa0hMM2dqQkhEdHE3Z0JPWTdaM1JCRXJkdzJnV1lZS2FWSTNRbWl5?=
 =?utf-8?B?V1U5T01WbWFORXRueVBtQWFSTjlkZGIrWVVPWEJvQnVMN09helNlaXdNL1RM?=
 =?utf-8?B?OGk3WTZLbDUwZzVZeW5mM3BsSFhJYzVweHlDOUhoaTZ1TGsyMHNBcmJTRVJm?=
 =?utf-8?B?QXV0cEg4bFFpQ1BqRURZeUtiaWhKYUNvbHBzUGhMQmNrNXJwZUcxaWJSUHVM?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hViyoajb3wWwb0QeQdunMGbjKhMyHNAtbL+RMMf/8+NFxuNAYxCLMtZiAXGfFWFty0PObfuDDa6xtuVOHEfwIAWCbJUfqfDs1qu4XKOKIMGa9r9FiwSEKwPpkxsPpPYajlIDgURsOR8BnkXfsdxM4Woa3VzxenYE9efa899KSk+FTB8Pxgjn4IBnRcIlX9whNMEN8AqcuFhOJF551qJq0zs/hf7vBacUPtU+dNZ6m6Rj5Qw6UStva7JtUXarFHV20CFAX19Vakxznd5qgkEQu2NfvebxX66Trbqg5/KsbEADOQGlMzWVmj1zyEdNu3euZnogcQChnnB4YbxxICW+HxFolel17jnxG55Up5p/5cWQjP3Hsn6eyaMQ3y53M7XpH9RelqKpPLz1RWLAjMrMxssPW4KPEUPMxhAF13IfQKn2OL/+CDd28tvf4Sa67UWwkhj6kFQv8Oq7ip7ozDECHr+jJSRYcAxTkHE/Ij8zVSE1RMm/hm/lfZA9tBXbWK/hnKQaSCNy7IGQoTrQEHm/jdskFfZGTpW7p/m/4pL0TSyixlXLZ02udy8bx2qBH86l3sNoWyAvdYLYfKtwTbb6F3VZ0Fp3sN8oAmlqIHf6YMLuaidYPSBsU0cBeviVK1se4msMV/qbbmLQ0kPwulvZJp9mcw2mvOXkIdlooCKcV9hHjrc9d4pDcqNMig7vEr04vlQsz27O3CjpCT17gqZFR0mIbn5uzLOOp0gyctfgTsZy4xvq0LFLwNrt3eZ3lnifZIfXbOHXzaqVxit/789IcWS1XptjLL8mdZEB6vBOp4mAo+rP4IgTbi8Q/+EF8WMEaQ/6RG7J/dlafCOj248s8lpBBuYnQv7oocsemDhm1so=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce506d2c-a4ed-4a29-9c48-08db23c804cc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 13:36:58.6819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CwzYlBQXN8Mj1UpVjOTcLKHKmU6WjDqN7SqJ5u4EZzRpZ9K4dNKmuZxu2ePF8gnqqUeXHlWyATJc9eWdXf7DMVHiCDPylVXDgsE18G2+8rE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5365

On 28/02/2023 12:34 pm, Jan Beulich wrote:
> Gcc12 takes issue with core_parking_remove()'s
>
>     for ( ; i < cur_idle_nums; ++i )
>         core_parking_cpunum[i] = core_parking_cpunum[i + 1];
>
> complaining that the right hand side array access is past the bounds of
> 1. Clearly the compiler can't know that cur_idle_nums can only ever be
> zero in this case (as the sole CPU cannot be parked).
>
> Arrange for core_parking.c's contents to not be needed altogether, and
> then disable its building when NR_CPUS == 1.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

