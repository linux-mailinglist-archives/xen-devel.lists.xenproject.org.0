Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3B23E0E69
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 08:32:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164122.300343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBWua-0005wR-Kz; Thu, 05 Aug 2021 06:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164122.300343; Thu, 05 Aug 2021 06:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBWua-0005tv-G0; Thu, 05 Aug 2021 06:31:24 +0000
Received: by outflank-mailman (input) for mailman id 164122;
 Thu, 05 Aug 2021 06:31:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FJ0=M4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBWuY-0005tp-Fx
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 06:31:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cd1812e-dee1-4d64-81b5-a840b0a7a9ea;
 Thu, 05 Aug 2021 06:31:21 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-3ARM7xQtME-UvcsiXVOJ3Q-1; Thu, 05 Aug 2021 08:31:18 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5326.eurprd04.prod.outlook.com (2603:10a6:803:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 5 Aug
 2021 06:31:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 06:31:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0246.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 06:31:16 +0000
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
X-Inumbo-ID: 9cd1812e-dee1-4d64-81b5-a840b0a7a9ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628145079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=knNHBwop9o4F+q/IufFmBNEmkdjW2M9uIYpMX1yd6WE=;
	b=HWCwNQiLAXNt3Fbz7KVeEnnNRAExhQVSZyNMRvxxupe6EucdZMbVBAvC56PDI3HR+PZAJf
	RgMBvIj4x5XoHfTQCoUwgUzs+MPzoJGjEhRXfgp1aI1TH0xNmPtn3baaBz5J0QcTuic3iN
	6Cgi7E1jbPQOOFUOU7iNLABN5yZop9A=
X-MC-Unique: 3ARM7xQtME-UvcsiXVOJ3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQIHnOTMUgnZJ7yx9iH/KCViJKP2hK35yOaMR5mVgAxxWFDLorA5HcFXj9gFuEaN16+VDvHNt+H/XYGF5ifP/lIKzOZAEPm2tSW9NCLIZDvK4LkcZODOd7P/68F5k/0C1DHwgxfrQCrz44LgXOF1q7Kj2VEfKrLn/WB6kqGDXAFUvzAxiU0EbGyTmgRARITEfuyiOXdaQU43GYAf/Dk0hNurVdk/Swk97+TMKw7rKTsTmmh/A2D0KaGaYlMn5Q7qRNFxJCvNnmr83snKRsxVousf9z2nsr046oyFebeaDn7LRAaO0Gf2CSBamZDV3RXwnB2j85KjPTOdPocaA80dKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knNHBwop9o4F+q/IufFmBNEmkdjW2M9uIYpMX1yd6WE=;
 b=eFoOCKs11YZ2VwJY899SsTUYTxj5pzRuoCoXS9uomWHVGOBy+j9u4uw626jjYa4tUmuDUEXiMOON4tzV31YAiiUgHV6L6pqPX+cXqIW+5OsrTfbqgnGpveaK0Siw2hMwkhSw6UwJwEgttAvlDMUenc/5Qjb+9fiWnEEwLSOaDzTRR81VRhyhFZ2Lsy2H4z4GEPR4Rdc57u5mza1W3wvAWnuv0zViMGrHfWRFzqGCLBvYFQ8vOj21Fww2ZmE3PqZhfQqWLuxxDV1uzLt8f03C3CnCJdeW8JbRtRK55oZ209EWlDpwFnvEKuSSwnI/CrBnfLzarBZIhW+E0O3hFPVCaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] Xen: credit2: avoid picking a spurious idle unit when
 caps are used
To: Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <162809973863.23114.6885532925742864556.stgit@Wayrath>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d0b4209-3eb7-8e55-804a-00f13bd97ddb@suse.com>
Date: Thu, 5 Aug 2021 08:31:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <162809973863.23114.6885532925742864556.stgit@Wayrath>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0246.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::18)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd1b6c91-5d97-4d91-bc1f-08d957daa154
X-MS-TrafficTypeDiagnostic: VI1PR04MB5326:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5326BD3DF31ABA307414E36DB3F29@VI1PR04MB5326.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XFG48x1tiiPpyT2/xzj29Qm6U5+PCj7qKdVi21b1LWUJFjZYX26PY5OAd/7V2qeGsuvOo1xc0uup+++diMRxllFa1MPGZkcwXc7YysNPr0UNA+xnWjD2IpBT8X6tz9NzFrHnG+lPcuBr3EokcknNstNbq5nT/55HDuvzAEwBNLEl0F0cABQZha5mRolXj5YQtyaHHuQ0rwi5MNRjJlKdfneatYFjQX65DbUyA6I74pph6BxzXmQfjgLKg5j/ADFxdWGtLj/88iknmeDxDmOR/LBBaqO+aDZBicJ4GI/mH9BEDTB8anK4lU2Wfb3Mld7WTpuOx+NhYnRKveHPnAodLBTom6frVNpw5/UViWApq/PDnxeaZxPmEcnJrfSVvssht3Zx7Zap+w+GCCUanuJW+uT2pV5uGybhe69bY57kZNcEcoc14BE5V5C4GzZ18iJh8/ls0PgYq+4g+bk/l8c1UkRltMalydO0A2+wv/vGgQBNpjyJBoyF1VHaY2WovMw+FAltEHHqNLhUdgP4JjhhOirb3ZeXCaZdbF4s284K9wmj3U5br9ZNKPnRj6LGWMBFg5NHExfPRfnx2RRq/D6y9Vxps+xp956Vk+IB1rzcEnIQbycoCN5YjieAp0wh3NTMihO30qT/IxPPR6O7W7Zk3v/K5CNCt/yqNLMtCfBARfTqIWA5yQsbhr9ctCgbpAtOSIPcS97HYm1vRe9MxPeybsIrRYAfz0Htk+/ntz4c1fI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39860400002)(346002)(366004)(376002)(66946007)(66476007)(66556008)(6636002)(36756003)(5660300002)(31696002)(31686004)(26005)(6486002)(478600001)(53546011)(8676002)(6862004)(2616005)(86362001)(37006003)(16576012)(2906002)(4326008)(186003)(316002)(38100700002)(956004)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHBJbnQ1QTd6dGtxK2t4K1VYVGRrbTgzTU11NXUzeHFrUU5kR2RFMFJZb08y?=
 =?utf-8?B?ejVjNXNuanN3QkVnMm9yaElBS0hqTEIyL2c4c3pCNWVnMjdRVWJGNXZkRXdR?=
 =?utf-8?B?V3BaT3MrT1FGSXZxUThqdUdHc3BEamcyUkRjUDN5aXduRFovSXVTTk5oS21T?=
 =?utf-8?B?cVN5WTZEYjR0Uy8yWXIyYTB4NitrOGxESmdnVnJ4Wi9BbkZsRU1wRmZiSTB4?=
 =?utf-8?B?UTNMWDRNd0ZYZ05PUVlPdjZhL1RGUi9PRE9KTkxueGlwcEtRV0ovSWozaWg2?=
 =?utf-8?B?THFja3RxYjBMS0p2OHVhKzV1akZ6SWxiVGo2UnhqYkNjVGxSUHl1MzY4enNa?=
 =?utf-8?B?a2pmeklIc0JpcStPYTdKL3dxRXRLZzJJa21LWEdaVC9YNWpkS3JGQUQ0M2lj?=
 =?utf-8?B?R0tUVExpZmUweHZ2UURxbGozOTYydzVJaEljbmtaZERBV1BoS1h2RnJBZnls?=
 =?utf-8?B?WVl6QjlPbDBqaTBPdndhVGNPS1FyR0lIbk1qdU9JUU1JUUYzNGxSZUM1UzZ4?=
 =?utf-8?B?N1pySkZMN1BSeS9yUGlYUWhoVzBFTG9mUUJZTmVWMVI3bW1VN3RmVGZGQUNW?=
 =?utf-8?B?alQ1bWJLMnErK01XRzEwb1VETlk3eVpRWGxIOWxCMnJsTHpMNTZJWldUbjR1?=
 =?utf-8?B?K0xzM2lpRkxSUkJLNDZCbG1aWDNwMEtZNzBsbk1WMllNdDE2MWpJZ3AzeFJn?=
 =?utf-8?B?UENzYVFrbUdBYS9WM21lVEpKSXpnVlUxZ2FvQW9ZOWtpK2dNS1lPSGF0V0dV?=
 =?utf-8?B?Vm1EZjlxRHI2dHBURlY1NFZ5S1I3bG1LVVU3YkNxZVhkblU2RmFZNVUxQU1M?=
 =?utf-8?B?MDZSenZESE9wSnRtTnozcUVTdGNvTVkraU9MMHhnVHpPWDRUbUw4ZUVRY3Zh?=
 =?utf-8?B?YTRXQklDaHVkTEdRWXN0d3VEMVBFeUdsWFFENFJuaHBjV0w2MmZBeEhOL0Zl?=
 =?utf-8?B?QTZaeldNMGJmTUI2RVdHemt3REQvTDF6Tk9CY1pnTkdUMTRqbjNURmRaLy9R?=
 =?utf-8?B?Rk1iZ0hINi9vMEZJRUdESGN3WlRISUtKV3p5eURobEZ3V1QrYW1ZU0x0UTl4?=
 =?utf-8?B?UVBkWXJmbGF4eDZreHNENWdidEZSUE0rUXVWaVlTVkg0V09aempjWDAwR2xW?=
 =?utf-8?B?dWcwYk1BTUFrQ28xNktGem9TeHdzUW5idU8yaHIwZXRic1lLbXJHVDZOVkFj?=
 =?utf-8?B?OUdzelowM08zSDJSYzNsbUhsbEhhWUNwWFREZS9TV3NkTzdudm9UNmRJSkpN?=
 =?utf-8?B?Nk14SXNLWWp1cTdsbWFvcUwwUEIwemRHLzArQ1ZTeDEvNzZodDU1S1lmVlQr?=
 =?utf-8?B?dWx2Tmo1Sk9HQkl4aWI5R2EvUmlUOHpzZFFWeUIweE96WE9SOXY5SmpqTDda?=
 =?utf-8?B?ZzZFUkJlK2NKZnFwWk5BWFhmS2lIL0I5VDRsR0plT3NXckxodFFTNDVpSHdF?=
 =?utf-8?B?djVDSnhRb1kwdjZZaGdCRWxiNDlqOEd0ZE9jQk5QSFNhdUJRQThYMDRzRFVB?=
 =?utf-8?B?MmI0V0lxYjU5VGtCaWhXVytKaTQyODF0RHF5YVEzYUlBY21rRFUySnBVU2JX?=
 =?utf-8?B?b1AyWWRkNzEwbGozT2xHR3d3MXVhOGtNYld3QmRDYmI5bklFcHRTcmlTTGg4?=
 =?utf-8?B?RWtWbC9tck9TNHE2d0Nrc0gya1hYbWZmYWxaN1Y2Wm5BQ3JyTUtWR1JPK0VF?=
 =?utf-8?B?TkVnN01qMmVneE5acjlVN2tNall4RnJsTkljaXJ2UXZZQkJaM25SblNsVEhi?=
 =?utf-8?Q?1HWoY3gTaOApiOMgMNtoMMo9hVYO5Hzg9DrkYI1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1b6c91-5d97-4d91-bc1f-08d957daa154
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 06:31:17.1567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mi+jrb55+9UGDLHVGXJIUNNL4Vpm2DuPk682d8RoVO2A06/SFmZI/7pZ9NRLSraR6hwhv3I1YNWlYl1ZOHoV8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5326

On 04.08.2021 19:55, Dario Faggioli wrote:
> Commit 07b0eb5d0ef0 ("credit2: make sure we pick a runnable unit from the
> runq if there is one") did not fix completely the problem of potentially
> selecting a scheduling unit that will then not be able to run.
> 
> In fact, in case caps are used and the unit we are currently looking
> at, during the runqueue scan, does not have enough budget for being run,
> we should continue looking instead than giving up and picking the idle
> unit.
> 
> Suggested-by: George Dunlap <george.dunlap@citrix.com>
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>

In part based on your explanation in response to my v1 comments:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit:

> @@ -3494,16 +3503,25 @@ runq_candidate(struct csched2_runqueue_data *rqd,
>          }
>  
>          /*
> -         * If the one in the runqueue has more credit than current (or idle,
> -         * if current is not runnable), or if current is yielding, and also
> -         * if the one in runqueue either is not capped, or is capped but has
> -         * some budget, then choose it.
> +         * If we are here, we are almost sure we want to pick the unit in
> +         * the runqueue. Last thing we need to check is that it either is
> +         * not capped or, if it is, it has some budget.
> +         *
> +         * Note that budget availability must be the very last check that
> +         * we, in this loop, due to the side effects that unit_grab_budget().
> +         * causes.

The sentence looks broken to me: I think you either want to delete "that
we," or add "do" before the 1st or after the 2nd comma. If you agree, or
if you have another suggestion, I'd be happy to apply the adjustment
(let me know of your preference, if any) while committing.

Jan


