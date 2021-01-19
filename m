Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BE22FBA96
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 15:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70450.126436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sSh-0001hU-Nc; Tue, 19 Jan 2021 14:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70450.126436; Tue, 19 Jan 2021 14:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sSh-0001h5-K4; Tue, 19 Jan 2021 14:58:27 +0000
Received: by outflank-mailman (input) for mailman id 70450;
 Tue, 19 Jan 2021 14:58:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jC7I=GW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1sSf-0001h0-SA
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 14:58:25 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e167a9e2-0688-4ffb-8fbc-393b139cbc8f;
 Tue, 19 Jan 2021 14:58:24 +0000 (UTC)
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
X-Inumbo-ID: e167a9e2-0688-4ffb-8fbc-393b139cbc8f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611068304;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Jadt5f7dRcj9ozN/s8Ele8yDReEE17wGp0Yv2i+UGlg=;
  b=Ndq7CJ4oJOBNqLJMTlWOqLKni5kKsr66Ozu19H2mnwBKpe2bTym8ihsR
   Hu6gN+47GsYrfu0xs6l2FU99ycvmUMjLlE81eH+0QWGMHSf+lIOMh0wNY
   txQza6QN0yerdZZOcdyz1nlbyxjHybcPf3V79/Re0dgFnQ1uOxmbKZ8nc
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s++miZYxC6NJIl1iinYg9Hcr6X8QBy5uHzSr0T4cVcvGVwM2FvWNzdiGVs0K3q2fCNUxBeHuBn
 QFUhqpoXz2mBuSKJEW4ZnSQy29WHvuBVDja3cnnZ+P0oU/UGU0ate1EbUxgWAH5yDPdTPUX2ah
 cR8wDAKLdCpxu2bwY2HbW/7mqgIWEAZmkBxyEn3phTeFvBpOKXWKW2+mX5v2mPa+zTl+TjqJdX
 V6ftwZiCu7iV2erwf0T7/+VliukH4vmYbCLtbQyfPPcHBN1RWz0CIMBv7Ln82PllqlTOPyPlJ1
 mwU=
X-SBRS: 5.2
X-MesageID: 35378375
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,359,1602561600"; 
   d="scan'208";a="35378375"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJsmNXVjMzzWDRILZZ7pbdJh5R49DW7/51fD1dushPRhluj4aeHKleVQ4UFQg6ilVU1ywbsIr7hl+gdXnfNimODjqVhQpwZMCPmEgW5neNxCr1XLRYe+s/elNJsqVUnGe8I4aFm0JDMzzMuHesDLmeOtlosAbCldjf9RwvkS50Ds+oOM3pYg+njhyPWOOJDgHK5dJOmy4FzrieLvVVAqlQUwORDhEi8zMX/Ge9yv2nBZft+UT48bDDjh1nG7Kr5MHLzoCstTinNM/leTqe6/ChkU4v5Z49pN7ElSXUHh2A4w/g8uXSyewGcG5UuLEY6et4xAX8YsRHT+3JycP70WfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTDr9KUtJcoAcSIvdox0n3vqGTHIL3tdLx8qQLqmAms=;
 b=ff9Uo1CerkewTbdSpIcgmZTLWqy5EoMBUv8dl5xOjwzo2QICdrjN+EU02I/Y3W6bqqQNHlVY71jZs0poLutpS97Onc5k766LNto9zDWeY5xcGPUJVeUYX3ieB/OQK3WWoIfhQhl0fpK/qdognLOQCA1AHKNXhAoBuIugYfzLUQjCDd+tY/3GoWwaJtdqg+RU2cxSUCbc5B9uyg2RdDqqBWSlGbBDgLZSo1/sVixoayzt9Rvlnwny4kSBto61DTxvKW2wO9BGrjiaHNdQPTlCbiMGqQVjEarZwM/Z3Q3rW7S9u658OJgQsRML91RIfZjUW0kuBOwFInS+x/zSi1DCrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTDr9KUtJcoAcSIvdox0n3vqGTHIL3tdLx8qQLqmAms=;
 b=PSnYTTXOojbT6aVpOahaUBUBHHtR5GDjC9rH8ZHKOc555RszLsYmj0X/dyPpOvn95JDXpCJkEHAMv6O8rtedPM1ei7v1H4v0++Osi5oL9hGywFet9kgAKyqeK3JEF1qwAtVv5L7RwaMUY/xtvbL7jrp7tCjlYZRr4eW1nfSQopE=
Date: Tue, 19 Jan 2021 15:58:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Marek Kasiewicz
	<marek.kasiewicz@3mdeb.com>, Norbert =?utf-8?B?S2FtacWEc2tp?=
	<norbert.kaminski@3mdeb.com>, Michal Zygowski <michal.zygowski@3mdeb.com>,
	Piotr Krol <piotr.krol@3mdeb.co>, Krystian Hebel <krystian.hebel@3mdeb.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Rich Persaud
	<persaur@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 2/3] x86/smpboot: Allow making an INIT IPI conditional
Message-ID: <20210119145814.ctjgh5aekxaapztv@Air-de-Roger>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
 <20210115231046.31785-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210115231046.31785-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: PR1PR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa6899b9-e583-4283-c236-08d8bc8aa8b7
X-MS-TrafficTypeDiagnostic: DM5PR03MB3369:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB336996BB025A7817871099CD8FA30@DM5PR03MB3369.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qi1iXKbLZBL4hAFBs1uOgqNfUjRfkbVw8OwlBvNelT6CSg5jW/JbYo2Nuw1Vnr7Jrvt19bQnAxASUbvUzEl+oESDJfx8Qiyssz8lcRAhtQOqPD6bh30zujXUcx/P6vtUeUVWFvph1voIcs018Q/QseLmUpBZhjNO9Q2iaKTzZsFBgB3+olsFOkKnXw6SEMG3z+DUyj+zjPdpob6p3FZHQX01GM8JGF3xt1jQU54YygV2O+piHQ6dKtfg6zPrM2DGqWGXnFX/QgjahQbp8KalK8+m8oL9K3rxP88UPRTGvARj2cXC0C7+zQznBsuFyY1u+9FoX87dTUMAjbLfEL1slK62dc4KZXJmTyzSIy+MU/K//qIUNzeBwQpsBQ51l60+ar6sZLYiZwiQ9mgwWo+IKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(6862004)(66946007)(6496006)(33716001)(6666004)(86362001)(66476007)(9686003)(26005)(1076003)(16526019)(186003)(6486002)(54906003)(5660300002)(66556008)(8676002)(4744005)(2906002)(4326008)(316002)(478600001)(85182001)(7416002)(8936002)(6636002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dG9qZUxWNkhqdzVxRDVMME41S2cvNnZLWmFMbWVsVVlHWWNsUjUwVCtJTTh1?=
 =?utf-8?B?bTFwbXJMbGQvNG1oMjZGL3ZySlppZGk5WXRMQmlPVWNac0FWaHlVdnVnOWRX?=
 =?utf-8?B?Qnd3bVlRTHMzanErWTZGempDd1I2ckVHN0dTamFiRm1YN2tyTEx6YjAyR0pl?=
 =?utf-8?B?VUt6ZVA3dU1yMGRwNnVqYThHMEpYMjI4ekNnQk41TnBBV3hSbGJQaFlXODBj?=
 =?utf-8?B?Y0ZTclRFajdPeFpjTW5jem53NUYySkxPb0lRRy9xRi9Tc0J6VVpmMzNodUhz?=
 =?utf-8?B?RTJic3dKU2xHWmprOHMzZDhQblFaZmxxNCtGUmtrWXlRd21OVzFTZ0V0OUtv?=
 =?utf-8?B?ZjN1UktDclJWN0JtT0ovNFFnNFE1QU1jaXlPM1d5N09TdTBuOGQwbTB1a09l?=
 =?utf-8?B?ZjBxZVdtZWVXYzBaQlNwWUxPK282Y003cCtoNE9tZnBOSmdENk13U3hpOVBU?=
 =?utf-8?B?L1RXMm9Ob1hnay9OcDM1K3IyZEVFUmFtYzhNNFpnUEFRbFVNOGVXbGNDS0d3?=
 =?utf-8?B?ZTloa2RhMEZ5Y2hBenBRQzJMNEl6d05xNm5HODlzT0tsSDdNSWFqVXdkb3ht?=
 =?utf-8?B?d3RZZktOUzE3Zjdhc0xyWG1NTXVFL25YZFhPWWVGZXlkaVZ4TmJxOHB4WkFw?=
 =?utf-8?B?WWI3SkRsd0RHTWc1aWtXTlEvZjBWR1RIM0E3aDNRMFVWY0FxS1Y3cmE1cWJQ?=
 =?utf-8?B?bFVFTEtybXpCdW5NbWwvc3dLZVJPNkhtdEpFWkNEb2l4RmZiQ21wVENXdXRN?=
 =?utf-8?B?UHZnMy82aC9LU2lraHlnQTBsc3V6dm9XQ21wdjdDSE91QitWODBoS0Y3Q1FQ?=
 =?utf-8?B?UUNHRjBpLy9KWFNuQmd4eWtTWVpsYmVhcnJzRWxOWjREQ3FIOVFXQTBFOVF1?=
 =?utf-8?B?YmhiSVpBRGxONTlDNHFZc2NRRG1Oc3M3Rm4wU2tmaUNnN2FXcEF1U0FoZEU5?=
 =?utf-8?B?M2N6NFFnZy9QNXJMMGtRT0psWVlNUDNOWDJxamtBRmxRaHN2amFYbVozUkl0?=
 =?utf-8?B?dmRvQXIyVkpvMHNFd1hsS2gyN0lnaUhqUm9kZmNaSWsvWnhITExCVUIyVzZk?=
 =?utf-8?B?eFdmOWNsWm5CVVBSODdUTzJXaGFsekhNQzllUEh3SWtBc255cG9aQSt3MEla?=
 =?utf-8?B?NmZqVk5lTDAwbkdFM1lqZjJBTVlSSElCZjJYUU94bWU1WG5LQkQ1TjZPMElL?=
 =?utf-8?B?bm5BWEtUc2o0SmR5cWR1T3BBREt6SVJmOGJ4Ylh1dW5BN2ZoeHB3ZjhuanB2?=
 =?utf-8?B?dG1PbDlaVzdKVmVRZXAzZk5TamNYWmNMbEN0TFdCNzNaYjlnZGFZTFRPN2V2?=
 =?utf-8?Q?N52UkyzPpO07R2jJk2hFY3/CxSMFC4NpMK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6899b9-e583-4283-c236-08d8bc8aa8b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 14:58:19.6323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QVQ00HNqjZkib7XMptQRRd48cOUl1D1JoX9AJLqO39BmbyDlvXyQc2uusQG1UwA5CX5IZMubRR9jMq/LTCwhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3369
X-OriginatorOrg: citrix.com

On Fri, Jan 15, 2021 at 11:10:45PM +0000, Andrew Cooper wrote:
> A subsequent change is going to introduce SKINIT support, wherein the APs will
> be already be in the wait-for-SIPI state, and an INIT must not be sent.
> 
> Introduce a send_INIT boolean, so we can control sending an INIT IPI
> separately from sending SIPIs.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm not opposed to introduce this, but maybe it would be better to
move it to a separate helper? send_init(unsigned int apicid); or some
such?

Would reduce one level of indentation.

Thanks, Roger.

