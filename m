Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ABF3BEB1B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152441.281641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19ek-0007Qa-T6; Wed, 07 Jul 2021 15:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152441.281641; Wed, 07 Jul 2021 15:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m19ek-0007O7-Pj; Wed, 07 Jul 2021 15:40:10 +0000
Received: by outflank-mailman (input) for mailman id 152441;
 Wed, 07 Jul 2021 15:40:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m19ei-0007O0-UB
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:40:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ab41a92-df39-11eb-850d-12813bfff9fa;
 Wed, 07 Jul 2021 15:40:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-lKOikZomPBihPdHbAq4tyA-1; Wed, 07 Jul 2021 17:40:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.24; Wed, 7 Jul
 2021 15:40:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 15:40:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0159.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 15:40:03 +0000
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
X-Inumbo-ID: 9ab41a92-df39-11eb-850d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625672406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fNmVWWMwPJb34vqdlRm5vzD7Alq1jRH2uoPSe+Zvgso=;
	b=CXPLvPWJGmoAWsr1OhHVx4NxJkqLgfakr0Fky5sLKHwfworKBlBsLA7Vy8zJ9YyracVful
	rQ2gebM4R2nTQPhozBZ2aqiD8lj5WMCVH179Xv/pTie+55Ibi4PVrMHKlG6hDktH2VDVD6
	IgZr4/u/1fNj8nvlTsF8QcgMY1g+jVM=
X-MC-Unique: lKOikZomPBihPdHbAq4tyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyF9BxdbiF9NthNNXjptpYOBMIN/p/3jaHtvY0ATmBYK9xJb0rA/CJ1tzW/O/yC32XtW0L6TiPQApWRbXOcCOchZTYHtxWygKxB6nnhLfD2OhpGS56hLZlNEDdsD5aXP8UbsxlXg5lD8wjiNQHbmcXaL/n1yldd/aigDT74U/ZnCAfqWohhttoHRSTbmT8MGLAcs7X54SwH6qDQylWivtRI84UzAgI6doy8Z0K9lmbUEJR6j1DwOVTLrtQGpDiWbu4BEGEN2DYWHv0HV+I643+ixXxJGTMe1ZB7kziyq2tjPP2gaRipZHyJMoljVIxSgWUSi1/E0ajE3vospG97IUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNmVWWMwPJb34vqdlRm5vzD7Alq1jRH2uoPSe+Zvgso=;
 b=FJri5rYWm0Z5j2ZCtEThYJHKeDVQ6M4tvT9iCZOhIEPd1XPDJ9wgcxl+WpkEfIYvSawZfjZwqo1SZY2yxJjKDNtUZdcoFbpTzuIh+66JWzXVC/O2krPVMyXS/oYS4h92HEXX5JUpI4QCxc7ygUUuQYFBqRQHrRrByq+qT/5DevE7qbycZsKWP2VN7yCtafob+cd4fIC65uw1ZgoC7LP6dWojzM8BN7ahnCuqVMJ9izJq+hrh4nv8m1THBtaEvK6Bqn432zqGR9UqXdYdlcui6CmF5icfWJ7AOc8len8sKPWWex8l/rLlVVJIUJ2RlPWp70DnJU6xesFLMNSdZdaqxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 15/31] build: move make option changes check
 earlier
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-16-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb5a783f-36d2-fc73-f71c-4a12e5cf6515@suse.com>
Date: Wed, 7 Jul 2021 17:40:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-16-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0159.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86f15d9d-f260-435d-26b7-08d9415d7d35
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038CD15F354D7CDAA1EA7CAB31A9@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q9JspD4KJXenfHgic5v5qJHoDRhhOu/ElnE8ZrhD1GqRVxGXphHpYpZX1yzbD6mzarJHPpudqhkNKL46ab0OG2J/c5JtDEgYEOtnfsJxSHoLqC+2eheOJ5V4woOSdS8+oznmPSKFNiAyv0fy1+52tbD/4OWvUj6l3P+PlME9Kx7HihHFlTo8wHNLTUzfZ9ECs5NesE4N0jTvX/sGQiMC/0OvyxAMgVVjKNYYS3LcYqNrtaZHXNSvgX3eaz9CXyWA14IFhB+XegEUgZAnHUlQqk0ONsK99t4qP5mndPZkzlGlNLV6Wu5WlQYfRIB60DnDijHodwlvIlUbZAdmPC3+d2B/bEL9hyb3jq7XeDdriMwZJPmE5USmziRTL6xoBq43LrSbb20djkeONI0ovqNIgO/va6uDBaBQCTdQESjvJUZm4EJDY3FFBWlG9UMMT8bDs+t0fytCGE2eeiU5RmQ50bnzk8CUNOUZ1mByaM83WqkOq/UjKi3C/p37kDG7LPYnHL3L9Kd6sU08PvpVzRk4ROpGKeiwm9wn4s+HfrtCHcouRiIqAZWcgSu0NM3oA+P6MNlZBn2LRvCuTEpvK3YvKeGSSyOVFZtTcAn9LbecHET+D/UBsasoKDYsDrUf9caJhVp6TyBCx/3IsVced2FdXgPO5jfTBf4X8wtJW7oNrksBhKb4CDAeKVQpykPvLyr8fTQ7aaXGWf1IO5YNsWGAQCMv6x8sjOiYzQ0bcPDtS7s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(346002)(396003)(376002)(366004)(478600001)(4326008)(54906003)(2616005)(2906002)(956004)(31696002)(66476007)(186003)(38100700002)(83380400001)(5660300002)(26005)(31686004)(53546011)(8676002)(6916009)(66556008)(6486002)(36756003)(316002)(86362001)(16576012)(66946007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0UzRWhVK01Vb2JEUU9McXI3U0tsQU1ManBTRmFIT2luNTRQRjVUVnRMdVc4?=
 =?utf-8?B?c1lQTTVndyt1ZHhyWGl5dFJZR000UXM1alR6a2o0Uy9xVWRYTWttWG00ZDlK?=
 =?utf-8?B?TTN3dFhYZkJEL3ZESVA2R2lFWFQ4ZW9uWExVUU5wejBZVkdHbzRaUmpJbktk?=
 =?utf-8?B?SEhkOW9SRU1hMzlCT1NNQ1JxVDdJZmxvMUNLMHR0WmhvUFh6Y0VrQXhYREk3?=
 =?utf-8?B?ZEhEaEJDY3gyZTU5bnJGWnIrcTUyYjkrSm9rVzFzTE5JUkJwMlJjS1ZQcm9k?=
 =?utf-8?B?cW5ZcmNLVU5iUFQ5ZlBscDhlbW1qazU1VVhyUnNQamtHOEw5NkJjRHBocXZM?=
 =?utf-8?B?dTJEVllOdWFibmpIN3I5cGN2dFdzemtsREVCU0U2TUN1VVA5REJSazZJN05w?=
 =?utf-8?B?b2NZTmNURnJHQlpQa0VKbTRVSGpMMlJRSXVVQ0FiQ2w5SjBOczNLbmxuTVdW?=
 =?utf-8?B?dzFYVWZLdXZyR0RocnZzVTk3d2hBMVVhbktrRmNPcllDRHFhd3lFV3FKUTdw?=
 =?utf-8?B?akFFRFVHaFljQ0prTEhIbXpVZkxyaFBIQk9VSFBYY1h0cXBTbExnc2d2aHQr?=
 =?utf-8?B?c3IyOTUrV3VLVmY4RG93ajVuV29uNThxR2VZYXJyZWlaTUhqc0tnb09RcHND?=
 =?utf-8?B?eTlMTVR0RGtsTzZyNC9QQ3YvblRsSlYrNWVPZ3B0Vmw4TXIvUEMzV016emdy?=
 =?utf-8?B?R0NvcGRXdUVTeFdZZnROajdHYlRJNkZ5NWRuc2N4NEZ3UzNPa3ZuYitESzlX?=
 =?utf-8?B?MUdnOVlwbHd4aUVjSTBZaU94SFU5YTd1VlZHaTdDdFVackJyeEpZVStJaGxM?=
 =?utf-8?B?ZDhTSXd5SDVxRWNkdGdpaGpaVnB0UDRiamJKOWJJcjBUMUJJKzNvdk4xTHgx?=
 =?utf-8?B?MzR4QUZwQm5OMTFER1owOHVLR2pjdlE5eUpVS3NrZnR4UEdOM2pKaVptTTJi?=
 =?utf-8?B?aHg4V3VNTWFLSndld1AvR2lDOU9IN0hoUk1pL0VaN2pMZlZSdGdXMUZWeUVL?=
 =?utf-8?B?T0N5OERKcUJCTXNPVG9wTEFVdEpmZ0ozanpoaFNRUC9xYkFQT3V3bFE0Z1Br?=
 =?utf-8?B?WmZFeXQyK2FaN1owVlczMTFLaVhBMDAweDY4Tm15a2ZkZTB1OG1td2VXem5M?=
 =?utf-8?B?K1FnSWlUZU1ESGhDZStjMkt0Ym56NFJuYStUaUMvRHliS1ByazZrQUc2UVEv?=
 =?utf-8?B?ZW9PUDJHUUQ5am0ybHdGaWpRVjg0Q011aWJJRkwzVlBvallhTURUaTFpaC9M?=
 =?utf-8?B?dldKemxzZUwxZTRHUk5zUThDNk8wODBtdmZkOU0zVmJ0cmtYNFJDT21sbStS?=
 =?utf-8?B?UkpGYTlBQi8vTmJ5aU1kekljWDhmdUYxL2xrRmg1MGZSTm0xbVJqbFBDckQy?=
 =?utf-8?B?bmZnaFI3cTRXNWUyQS95bnoyWWlDM3llUVltOEM4OFl4aFdEZUJsc0taeDRD?=
 =?utf-8?B?L1RESkNDMGh4eFdNY2Z4c1RSMFI2U2ZRMXBWRHZWK1lnRTBVd2Q0MzhxRmg2?=
 =?utf-8?B?eHJBbmlEZGRNUlZRdUNZeEQrVTMvb09lVTdySmt5SnBNVlhpSDluNHgxcERs?=
 =?utf-8?B?TU80TlNTbXprQlFBZTM1MExrd29LOUZSVDhjaEJFNjZyVTkxejVSaUpnbFR3?=
 =?utf-8?B?cm4rQllDY0NPSmFPZ1B0RXQ4d2dwNUZUNVh4c1ZZSjV6MnU1YUZXclVUcFJt?=
 =?utf-8?B?d29yZmF1dnU5QjFLR01Scnl1QlpTZzRIOE5Kb1hIV084VjA4dlMwZ3pqN3Nh?=
 =?utf-8?Q?C+LoPr1vqAsmHKBQvW02orAj8zjLW1iycdA2NxB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f15d9d-f260-435d-26b7-08d9415d7d35
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 15:40:03.8834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YBnYTiXa0x064T+eX2IaJP/tq+fl0aH50QvR71B06dG3b8nvwa2fFPJHpRjaereit/xB4PaS5PiUlVuyyPh6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 01.07.2021 16:09, Anthony PERARD wrote:
> And thus avoiding checking for those variable over and over again.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
in its present shape since all you do is move existing logic. But I
wonder if I could talk you into ...

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -56,6 +56,28 @@ include scripts/Kbuild.include
>  ifneq ($(root-make-done),y)
>  # section to run before calling Rules.mk, but only once.
>  
> +ifneq ($(origin crash_debug),undefined)
> +$(error "You must use 'make menuconfig' to enable/disable crash_debug now.")
> +endif
> +ifeq ($(origin debug),command line)
> +$(warning "You must use 'make menuconfig' to enable/disable debug now.")
> +endif
> +ifneq ($(origin frame_pointer),undefined)
> +$(error "You must use 'make menuconfig' to enable/disable frame_pointer now.")
> +endif
> +ifneq ($(origin kexec),undefined)
> +$(error "You must use 'make menuconfig' to enable/disable kexec now.")
> +endif
> +ifneq ($(origin lock_profile),undefined)
> +$(error "You must use 'make menuconfig' to enable/disable lock_profile now.")
> +endif
> +ifneq ($(origin perfc),undefined)
> +$(error "You must use 'make menuconfig' to enable/disable perfc now.")
> +endif
> +ifneq ($(origin verbose),undefined)
> +$(error "You must use 'make menuconfig' to enable/disable verbose now.")
> +endif

... doing away with the misleading mentioning of just "menuconfig" here.
There are various other *config targets, many of which are also suitable
for the purpose. Personally I've used menuconfig (in Linux) the last
time perhaps 15 years ago, and hence I have almost forgotten about its
existence. IOW at the very least I'd see us insert "e.g." everywhere.

Jan


