Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D5B3BBA10
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 11:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149973.277375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Klq-0002WN-Vx; Mon, 05 Jul 2021 09:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149973.277375; Mon, 05 Jul 2021 09:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Klq-0002TK-SK; Mon, 05 Jul 2021 09:20:06 +0000
Received: by outflank-mailman (input) for mailman id 149973;
 Mon, 05 Jul 2021 09:20:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0Klp-0002KC-Db
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 09:20:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e4ad8a8-dd72-11eb-8440-12813bfff9fa;
 Mon, 05 Jul 2021 09:20:04 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-oOeDK2uuNx6hhAsZyM1agA-1; Mon, 05 Jul 2021 11:20:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 5 Jul
 2021 09:20:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 09:20:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:20:00 +0000
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
X-Inumbo-ID: 2e4ad8a8-dd72-11eb-8440-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625476803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aE2e9I9ykhO9ORR0cizNPluzBg1KOXSa8syIJgFqcac=;
	b=EKlIfNTAc9toIEqHIsXsblxnvX9+vWxYIG4hfpgPc+P6beK0ub7LKQG9xAVA1NjXe5fQN7
	SqgTiILGEwq8vb66AJ36SsLptoZxK5Y4UhKg+D21Brb4wiI3+DzRXAi9jm/IIThObPsF2k
	dwejevughPk0Xsb9g90enRiwZiauQTY=
X-MC-Unique: oOeDK2uuNx6hhAsZyM1agA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHEAlIJhydj66wlvkPhJ1VmTGJNRlrfSuA1UGIWXMKAS+migzvWDP+EoB7BVKS+x5xu5ZfM8KGQKkbTroSTVfJqq8xoyuYrR+v/mVTxUzZNDAQUu0H10p+mSL8aFgtKfZWI+v3CTLNuFfuEND6ggjYlwV9OeWUcAzeyMeE8uasjao7GvIQSgRpIhnz4FdrlVmA4431O38rKrIsAW37pSSELeBO309DaqEb41/vOI82Dk7OCzUV/JZeWjghGt7+9B5g8SWA2+KgRM+QbEZ25RV9sa6qDqkex8fmOZDZkkyderxW/l0S+Q2kgy+deyBxbYzpF28niSqKipGVpxKWRFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aE2e9I9ykhO9ORR0cizNPluzBg1KOXSa8syIJgFqcac=;
 b=oVUJdXtreh1Cc/r4TrL2GhntsaNyudtmKeT97Ic1M0iyj4hDea++xvKiz6fvQb1qtqvd3iD/Pftt9NJNmdVJBrMrgnGxhqTjsP1EENeq8ZBfEiShtBer6/QhjyS5GWuQ9wjhYsSjBCJ0hqraFgZzI4oghGAX+tHH8dLJJocF9OGgZamB19n7UjoOJtgA6lgBxqG8CImafgnPj2V5hhWEjnNjtUzAC/K4YJ2QPfgMofBgFlc5BvEOD4xo5ADl85YFnZugdhnduGRPbq3sUB9xJKr6L/I2vYjGIxmncQSuE6xb4KzRFL4mb5gW25vwBlviPQLxEbbTWPMRrZS2PNVLXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] tools/libxenguest: Fix migration's debug option
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210702190342.31319-1-andrew.cooper3@citrix.com>
 <06968742-355f-ad37-0681-e51eea256414@suse.com>
 <20210705100228.4947ed4e.olaf@aepfle.de>
 <ed3ceecf-239f-9bd9-e040-5246c9b49f53@suse.com>
 <20210705103224.26f3835d.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e2a3967-06e5-75ec-3aa5-1f39b6700e63@suse.com>
Date: Mon, 5 Jul 2021 11:19:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705103224.26f3835d.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P251CA0011.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 279c6ece-704d-48c3-2d95-08d93f9610e9
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB73750FD287C906704A647E61B31C9@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	626IT4OZjeSPolmjiXWPBn+TZIb+6gYUbelKU0iuE2dYiodXOm5b8ci0O7X1cVfBFerhT2WYq1VBJ/dABv5UPTEGwLjW90QZThyWsLJhoWKnIHR4Mt3x370ThwPkzk6mgCYm8iRWSoQAL3qY8ENxuh0W9RjbF/c5a8/ZRCA1Ptd1HV3YIK9GmE1UfTAV3NsHI7vHoE1TtlClLTAXU/o6zrA7qP23aehzrV1+vSohB8/8p56Pblm+FVkXpgxycd1MTSX2moZ3SW53NnWaqlRmgpCeWa7MhGDu5khGbmac9wKtL188NYKA9992IGy8p9cLqq02v9Karbw1ZmHnFMu9BW1tsi7VzvnZVQOZTWgNnNMZLnPzZ+68suBBhAfRR+1c4Vp8YbxaKhMkXvgOjhPfRKI6O6PkM3dJY1kgUqcmGzssmVQcwOsbj6la3x8qe9hilsH/nLusyYLeoiLqtHKUAuT3qNG2Xs9rTMtFvV1SPDY6ZTCLK2PAw8uJz+rkl7dFqZh4fYJtN7hpnNiMy5lbQF8Ig15wb1SFcyXA98YbYUmRuPE0gUYXjjYorXMIbj3fcZSW2BI5XEc2nA4W5sFv1vDYOTNLz1bQE92wbKB/v4x3qxxg6QzKK+Z8nSsRbnzjJ6bdzhZK+5W9bkSemGe9fUjnFfqFQGrU6dviVQAH1Gi26HzUNqCIj/nNgSU6pYDTCw9lxKlyTV6avsbsO8+ibqtGiVkYp460Pt3rPVhrTG8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(396003)(346002)(376002)(2906002)(16526019)(83380400001)(26005)(53546011)(54906003)(36756003)(38100700002)(478600001)(8676002)(31696002)(186003)(16576012)(86362001)(8936002)(31686004)(66946007)(316002)(956004)(2616005)(66476007)(6916009)(4326008)(6486002)(4744005)(66556008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkgxamxKcG52ZVVUU1hPZWtUelI1cGFpOUhrRzJncVJkYlB0N2RXZmd0eUtK?=
 =?utf-8?B?TVRpMW11OFBacjFGUkdPSW1FcjF1c2RQbElkaVl1ekg1Z0hPcmQ4TWZxVWZi?=
 =?utf-8?B?QSs4aTN2NXpNV1dUUjhnMXhuNkRZRWw3Ynk0NXRpMXV3dTk1djFvL3cyeWJD?=
 =?utf-8?B?M3pDMi8xTzVoNGd1RjRXVnIvZ1RXOG4zT1pxL0FEalp5Q0VXeitIS0NiK2d5?=
 =?utf-8?B?dU9lYmVCMlBGekZ6cU5KeUVDMjdiTlQ3Z2pYSGhqbW5SMFlVdnFEZldmeWwx?=
 =?utf-8?B?MmZPTThpRmJFRVRHUEtMMzd4M0ZLL1BmbFNaT0s0Vmx2dktab1ZORWNPRFNJ?=
 =?utf-8?B?VDMvK3VlZFNuQllwaHE0STF2ZnI0dkpwZDNsYjdRNWw5byt6d0d3QUNiYkEv?=
 =?utf-8?B?cEpvdFZUdjRiMkRYajk5bjMwaENpSzM3SFU4NzNMZ2N3dlRNYnBiSzJ5VlFH?=
 =?utf-8?B?YWdOMDMvRm5CR3lPVGljQWlnTkRjcDZ2OFNRWlNvdXBnRGRqMmdiaXdWS0Fq?=
 =?utf-8?B?Zm9vZXlodXFVakdueWtMSmZrRGVuS2NnQkZzTFFmay9GQXIvMDBIb0dXNm9X?=
 =?utf-8?B?akp1VnJjalZscUVqTTNCdXZNREZYS3R6T1VFbnhRTVdTZE9jYUN0Uzl2b1Bu?=
 =?utf-8?B?VTh4MzJvWDJWc2dudlo2WHlOZXlpbllkaUo4VjNYZkk0b1J3U3Q0LzJnVnRO?=
 =?utf-8?B?T1ZEaWRRbGNLcGRmeVBDRmI1VzFvY01PN1NlSXFyVU0zTUtsYzBJNW53MzRo?=
 =?utf-8?B?THBJYTRaZzlQVDl4WElJd3gvbTl6VTR3Y3I0ZENya2pYckhXYzBxczRBQWcr?=
 =?utf-8?B?NE5YQnlEUWVKQndpYzE2OE5PbnppYTVuei9WRjV2Wll1NytwczhtcHNKK29l?=
 =?utf-8?B?aEZtbm5YZzloak5YRlhTOXArOG9DaTFRcUR1RG91dHEyaWRwRzdIQnpYdVIz?=
 =?utf-8?B?elpuS1drRTdWOHJBYXcyRHRuS3pIVExEcEdFUW43dG5UdlcvbXBhNzlXNTg1?=
 =?utf-8?B?akVZdW1SOW1FLytvMTF5aU5HMW1kNTU0L3JNRG9RZEV2SFpRaGdEYzUzOEwx?=
 =?utf-8?B?MG1IY25SRERQbk8vVzc1dXJQYWE5ZXBSelU3NHpabHNoem5NNk1OZVo3TlFZ?=
 =?utf-8?B?M1pSUVhaQWRHM0hDVEp3bDlZZ0pGQXpvRXkwaTRsNU9UeWVUcWVtSVQ3ZFlM?=
 =?utf-8?B?Z3Nvbng5ZmRkSTM1bXpJZXZOU0hYWjhOclZYOGZqbDFWTGprQ1l0NStmM2py?=
 =?utf-8?B?b0hGUVN2NlJhTnhXUG5ndzdwYzdXMjdyODRvc0x2SXBKOHVDZC9QOHpvZTda?=
 =?utf-8?B?ZEJVem9VTFFXTU45S1pza2lFYXpBZzFCbnBHUUhKVFY3Y0x5U0sxa2dhUzUx?=
 =?utf-8?B?OXVKOTJiUlBsNHBTUFhTMXVJdUJHcHBTRHpZUUU0b3RGczFJTit4Zmt4ZjJH?=
 =?utf-8?B?OXYxM1R2eHRIZzZyWWwzUGVqZUcvSmkzdUpramZ3VjdPT2JnM1Y0TnJRcXE1?=
 =?utf-8?B?MENsVVdpSjc2UThJdFRVaktyMDBlTEFFaFdmR3VZWnhtNEI3bTdrN21adEFt?=
 =?utf-8?B?NzVCdmRWS2dJUjNxNmxPR3lwRC9GcTViUlc3QnI2dUFmQ0R6dm9oeXY2eDZ2?=
 =?utf-8?B?bXlPU2hSZkNXQXBMSTJXbldLbzIyenh6SnBrVzVHMkJmUnpiMHloa29rWnNX?=
 =?utf-8?B?WW1KQ3E0NnhBcnVDRitZLzBNanFlWUtWcDJVR3JqK2RnaXU2NFNROEdsd2hV?=
 =?utf-8?Q?FGTEE3RLpU502OZOTGk/LFCJdH0ZsKovHEGZDpq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279c6ece-704d-48c3-2d95-08d93f9610e9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:20:01.1916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sq4X54mWjhb9xM//qx2JteHUMR0HzTCKUKonmtSEDue4bMh8SEqRC2UbKwUVqEDMoNSgfyyEI4Itj6g7gz1srA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 05.07.2021 10:32, Olaf Hering wrote:
> Am Mon, 5 Jul 2021 10:23:00 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
> 
>> I see. A similar problem then exists with at least the FIFO event
>> channel per-vCPU control blocks?
> 
> I have not done any debugging how the pages differ and what they are actually used for.
> 
> My guess was that it might be activity from the backends, particularly
> netback. I found no API to query the usage of a page, so I declared the
> interface broken..

"The interface" being which one? The tool stack can map the guest's
grant table, so it is in the position to find out about all grants
without further hypervisor help. Afaict the same isn't true for the
FIFO event channel control blocks, though, and maybe there are
further ways by which pages may get modified for a paused guest.

Jan


