Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098674A8365
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 12:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264651.457813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFaib-0008I3-Ej; Thu, 03 Feb 2022 11:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264651.457813; Thu, 03 Feb 2022 11:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFaib-0008FH-BV; Thu, 03 Feb 2022 11:56:05 +0000
Received: by outflank-mailman (input) for mailman id 264651;
 Thu, 03 Feb 2022 11:56:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFaia-0008FB-9v
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 11:56:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42dc8833-84e8-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 12:56:03 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-Nj7y5JOcOBuynyUfF13R3g-1; Thu, 03 Feb 2022 12:56:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB8326.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 11:55:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 11:55:59 +0000
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
X-Inumbo-ID: 42dc8833-84e8-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643889363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlIUFxMgWGxdAvsZ3Zpu7XbgD5YlGha65sq9XotFu8A=;
	b=mPhfpqKr4P+FaPr22Lv/zl4OpKlwg/6WgF7n5eA/XvC4EmMND1n/eoxMKKi6hmSzAamBdt
	TaFT30R46WbrQaGwxa/392By97c5xWysnIIi3xwVUAdorGa4j0c9OGNA/dxt4ftAZNEo2+
	0C9PY9BorL0G+uVWEG+i5mNcfj7T7nI=
X-MC-Unique: Nj7y5JOcOBuynyUfF13R3g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQiBWnyhviWF2+thkcauOmmHorNiCfjw9LoUcfM3BYSjkB0Ja29vhXVygWKgw50PZovJR+63LWGK1DjDvoyoV4UdVTN4qxF+KTSH7qiGk7raIFNp9UgfzOxBEGuEStwfnrJCuerqoJJevuCwIv1hsxK/ukOr6Zc1ltSV3yjBOPwb+m6HlXyPzJ739hL1KY/kgPQKqqzxRghfrhfVgRk39pNRuhW6WXhe66dAj6U6WuTeoIMHmGz2IisrfVFn9EMn5K4QRRE3pu+cHbAkSBs/2nQGAOVyl3K8ZEzTvfgXzDxgzKJ+xPpzEKIXOmIlk9r/rVV7Rr6akxNfM7+SbvOdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlIUFxMgWGxdAvsZ3Zpu7XbgD5YlGha65sq9XotFu8A=;
 b=Pl91cN5r/EhNs94ZeylOwRwZQBAGyXFnTQQOGetiIcYPIDLiwbzBQGkrr0Yxe72wN0DMC+ba1ccd1s8bf02KydIa0LjDHvJ/O0l53qu+UlEM6z05pyYjMTF0pHffJgrbMc78CQrm9pbS+/Atbrj5StoiUtzJZokT979pbD8WFR8Ccvm0N5hXONdABzyS+e6Y/vMqRoR8jYrnuxqdmQvaQzrFtV/ecsKzlD1tgFp89N3RT2mNSym6tITM9afY4OZGw3y4SgzGj9tMep4RstHB/hFPZEZinVrxKYkQFmhL0J0syG6rC7CQJoDJf4NU6zrWYIZXYsR2qHzdWDObiTLcuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bae9ad85-a26a-67f7-93af-166cc743e046@suse.com>
Date: Thu, 3 Feb 2022 12:55:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tools/libxl: don't allow IOMMU usage with PoD
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20220203110651.17419-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220203110651.17419-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0099.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a782fb82-1042-4763-a76c-08d9e70c24f8
X-MS-TrafficTypeDiagnostic: AS8PR04MB8326:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8326A9B752510919511D2B84B3289@AS8PR04MB8326.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NcJGp7TD25n7TCCJtiHLqnhLE8usKTfZjz8ls/xlCqOByrSxEucGRAhdcBFoqD6Wl2Nvw8QgUKWKQ2vwOHe/1svES6bvwLnURtCIXSxnoKiLtamHIrgZ008UNW8JCW7dk8GAu1bi038NGHgESRR/HotgNmyDBCLOTRTrYrGRVQMDcFHBjtJfY1w5ACLAK/Jotk0AnYLdVYXR9lLjtIbToeOhqMv/6ce+lSi90zi4LhewWVCtcnTqiv8tXDQN2D4DInQAUcEBL7jHbIs7446kcZFJFdSQPMhijA3iYbu5lh0Idn9D9K90UGAX+BbHScqTY9PT9dUT2MV9UppBQJRvACrLV/PCBYhGFEez3QMnA9HhgwHihXx7zzjM1CbGCwhZo5O0kY/eagNWDVDeLTcGv16o718XLHq4KChAM4qXjaH3DBaP8ZBOM4CNO0Xs9Kbbd4fxLf7PuVuvoBDn+rBy43BgSzsuIXX6WT+8+kTA7DR2xC0BTdz5J3u3qcOfRKSG6KukqtVobv3RUGJXUW5KjDoX7kLYEVseol93vdS3MBVxrpLUqfSEdq//6hkXDV3htBN3GBwSNeYzpQVKInGsQDb91aR1JbP9N73aFN7zdQaVCE0ilP0DAa1OiAph5/QnDutT6AD6r37RoOQOo/tkHycjuZA+3Bp0UmLKn7G48FZSwQcmDHt1q7wuz2dlu0GaYm4mMdGANEVTXybUVv1NkyDdrpbrqG+0uPWoYburRtpOD8ul0n100hq1azbHKO4/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(5660300002)(53546011)(6666004)(508600001)(6506007)(6512007)(4744005)(66556008)(6486002)(316002)(6916009)(66946007)(38100700002)(54906003)(26005)(31696002)(4326008)(8936002)(2906002)(86362001)(36756003)(8676002)(83380400001)(31686004)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d252RWhLRlIyenVrYlRWRzFZRmpIUVMvQjF4NWhacjFmWDJIaHVEMytRV1JN?=
 =?utf-8?B?bjVoMDYyYXB6UVU5Z29YR2wzWWNGenhnQ255OXJaTEZydEJUTU9NS0dUYllD?=
 =?utf-8?B?TVdwdzE3YUZkZFFkMHRxaU51cG1YSm5iNURMTkFkNjJRc2FsU0IwRWJEWVFu?=
 =?utf-8?B?VzQ0S29FbzdkVzJDR3FZQXZPRWtLS1JncENET3hWbTFFTVZqdEJta3pxOG1S?=
 =?utf-8?B?RnB6cWZ4VG5SaVUrOHR5cHYzYnN2dTlHSmFhc2NHRGttRE9QeHh5RW5xdjdQ?=
 =?utf-8?B?ak5FZHdUUC8xY2dDN1RURFZ2YkptbUQ5R2hkb3JYVU9IbTNlMld0WlFTa2ti?=
 =?utf-8?B?RG9SaDQxS1V0QlF4ZytWMGJhbnVEOXl5WkpJMmRaQzBIU2t4WXJhdTdoY2py?=
 =?utf-8?B?cUVWMXIxUUJ5aE9JR1pqb0lzWkJNQWE3cVJSR1FteWU2bzlnOU1uVWtRODg0?=
 =?utf-8?B?SHAwVVpmaHUwb1NJWVBhSlQ0dGdtZHV4eUxrMEdPWU1iL0VUOU44dlpnRVc2?=
 =?utf-8?B?RmdFaFNZY3E3aThJTFAwSGtvSmRISXlXV0NhbGtGc0huRC8rZ3E2a0JjaFNi?=
 =?utf-8?B?Y0IyOElHanBoMW01NGNjeU9DY3pvY05Qc05QN2JXRDlZREZGRjNncHE1bEhs?=
 =?utf-8?B?eTNBdHd0M0pKR3Avd1ZBR1dGZEV6UFJ3SkU4bEQ4SnEwUTBqZEpmaXU2WTlY?=
 =?utf-8?B?ZXdacWJIOVkxR3p0KzNjUG4xbHpTNEJaZFBUMW1CL0RTZi80bGZoZ3ZMd3ZS?=
 =?utf-8?B?OGYwK01GcGhZK3NnU0pEcUI3VEc4S0paVnFoOWVGTjJpcnZ2RWpLR2tPRzlW?=
 =?utf-8?B?elBRWFk0dlZOdEpXOUU2cklYT0hrWUp2RVhYTkdncTRFSzJGVWtrRld3MXFX?=
 =?utf-8?B?alpZdWMrR0FPd3Zub2hBNjRrVnZBbW9JbkpYcEc3UEtUU1hqR3lhb3BVSGVZ?=
 =?utf-8?B?RDFMR21KclJ3b0lGMTRCM3JrT0FNb3VvU21xNGwxOVBLUkYyMDh6Z2ZVMlVz?=
 =?utf-8?B?MnVEc2hSNmFsVW81d21vSkRLRitCTkZua2l2eXMwRS9Vb2dTZk9vNmNRZVd6?=
 =?utf-8?B?T3V3cThtTmFuU1orR0VhL3lScEt1TmE5ZmNDUnVGRGFNNlVDU0RTRXNvUnFK?=
 =?utf-8?B?cmhZOXdpZVM4Ni9wTEtuU0pEVExQU1kybFoyREplM0hEV21yeHllcEx2MEpN?=
 =?utf-8?B?MFpWMk1FUk5xaVNzdElvdTBEUEhROWhIdjNDSUo0UmQ0bGtIUDdoVTJFcXl3?=
 =?utf-8?B?dVA1dzJlT0pndkxTTVdKZ05pVmxaLzJLa0E5U2FoMTV0MEk5ZnZ2cHcwbDBJ?=
 =?utf-8?B?aCs3ZVA3eFREb2N1eVVDWGRpYm9jeksrYnB1M0xveXNaRVBTSHpDWDV0WmUw?=
 =?utf-8?B?YVZ5Z1Zrd2dDVnNya1YwTE1IOW4wRitqWWlrV3BLUVJ2d1hMU0NjZHpWRTdv?=
 =?utf-8?B?M1REbjBlREtuQ2paWmJjcjFHNEFIZk04STRWOUMwbW1SZ3NjSHZzMk85RnBO?=
 =?utf-8?B?VXljSlZNdDBTZ21LMHRpUmpyY0kxU0JpcFY4UzdpNWhqbnhWQUpDdmZINjRV?=
 =?utf-8?B?S1JPV3lRL1JkeFlHUlpFdWRiN1VkOGdNaUl2MHRZLzIwdlBXamFBYThWcVhR?=
 =?utf-8?B?WlBBNnlGTHhnYlQ1bFUxcndITWRLMWVnM2EyOFdrcVFtRkRxOGdFamJWdFc5?=
 =?utf-8?B?TThmM0d6Y1BoUnRSWDM4dW53WDFJR21UeUZlMkN4RGpMOHdrdFR3c2JpeUpw?=
 =?utf-8?B?R1A4TTlvMURJeDR5U2RjNkRsdlNQNG9URDFhVDlFRXUybndWdEZBVDZoVTFX?=
 =?utf-8?B?dExsajdjbXIySDVQUFBVODd6ZVZCSkpFUU96U2FwaHFFTjZQdzNvdDNBN0hS?=
 =?utf-8?B?aVlFZlY1a2t2S1VRd0ppOGYzbFp4QldsbXVPMmtnSlg3eW1oQTZPbXllLzBB?=
 =?utf-8?B?K2VvQlZ1VWZ3QWZSK0c2V283cEJWNitrZVdTMmFja3FYWlU5WGg5czhpRlZD?=
 =?utf-8?B?eTJxQ0YwcnovUEdyMnArd1pFTEJ6UmVyaUFJTTFHSGx6Q0VmbEllQUpHaEU1?=
 =?utf-8?B?UEl0YXZQcS9oS09nNGdGUDFnMzMzSU0xK1B2ODBKKzlSM1ZVbEdGcjE2dmlB?=
 =?utf-8?B?Z0liZmhqWHhnNVdKY3FlT2RTRmVOYWdoTEszQ3UrYzY4STJvOUxkQ3ZycjJX?=
 =?utf-8?Q?XlDeUoZlXr3Vbo8ENKdxf3M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a782fb82-1042-4763-a76c-08d9e70c24f8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 11:55:59.6628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPMWRlsXQzliJC9rRTf8tYVSNklAjntfCz2zFMbt8QlJx6asew3HetE3jHtk1VOULaV078CGxs4pRzvj7viMnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8326

On 03.02.2022 12:06, Roger Pau Monne wrote:
> Prevent libxl from creating guests that attempts to use PoD together
> with an IOMMU, even if no devices are actually assigned.
> 
> While the hypervisor could support using PoD together with an IOMMU as
> long as no devices are assigned, such usage seems doubtful. There's no
> guarantee the guest has ballooned down enough memory for PoD to no
> longer be active, and thus a later assignment of a PCI device to such
> domain could fail.

That's not a precise description of the constraint: The guest ballooning
down enough only means entries == cache, but for device assignment we
need entries == 0 (and a guarantee that no new entries can appear, but I
think this is already the case once a guest was launched).

(FWIW the wording in code comment and log message read fine to me.)

Jan


