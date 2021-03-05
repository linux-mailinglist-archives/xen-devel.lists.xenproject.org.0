Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1B32EF4F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 16:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93855.177301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lICfl-0007Gv-Ac; Fri, 05 Mar 2021 15:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93855.177301; Fri, 05 Mar 2021 15:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lICfl-0007GY-7E; Fri, 05 Mar 2021 15:47:25 +0000
Received: by outflank-mailman (input) for mailman id 93855;
 Fri, 05 Mar 2021 15:47:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w+o=ID=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lICfj-0007GT-PA
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 15:47:23 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca871292-58e2-47d2-88bd-5b218e6620df;
 Fri, 05 Mar 2021 15:47:22 +0000 (UTC)
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
X-Inumbo-ID: ca871292-58e2-47d2-88bd-5b218e6620df
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614959242;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cBvmCpWeivhct2l3cWCJCAq+equeVvw0k7lCfio0RFo=;
  b=e+UKLPSAdC2FjnDRDb3KTA73FfubqFu49PSZU3g2dNCSpx9b237Q43DH
   +ZlhFZYhcMIatYeLexrieBrBNZ3RJhePYEQxMPYxONxkb3/4gmTO+67KN
   xOX7cVlNpjTA1zp4ShnK7HfkEWpuqhdhW5JvyNHp47GkmvWa3oE8ZXvHM
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eoluYMCfTLpbChRQx9AB3M27GVRXl6vrUfWtX/AmCXKBvwAy3OHyQy5BnJIDUg20VIPeizooyA
 iAC1zrJHeRGxLUqmRwOUXbTL75caeVihBrDCmX2mnXM5gyHoS8iZpuloxGZmEX/0dAeIACJoyw
 z8OrroT1r4rHoau7+7krLgD3xG8ddEWHaeAAR8Awa50pCkJq09mS8QhWXpdON1V5miQMm/c/nt
 4C8gWsKC4zoppJ/WrDzzX85r2JGI1Bcw+kYgE3iA4dwp1ICrdojdmakMbHWHNnhBI/z7bBA/Ue
 FaU=
X-SBRS: 5.2
X-MesageID: 38638124
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,225,1610427600"; 
   d="scan'208";a="38638124"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7cPw6nhmrEx+/2SGcs2B6dAEGq4uXzX+gah/zJD5Mc4k4hu1vQCQJdLdoaqsZ7ozaOKMIOXPrY2bmOpYS7ua6JUTQf8LfZFQG0rioWAfJAJPPkOw7DX+eiuhmDLXGfY8NlUCBOw34rz6/twlUyf5jqOkKfD2castnFurVmXQi+hUD5tMFAtqQJNA12f7ImRgh7WgHTRXF5dGfCaU+xbwiEDLelMirtJLHYMxQS0JeNOcOcfD9moBl/R5h0ooBZPe9EAXEhHtXunv+QaeGZlcxGmcywKNF2Xyr6oYGpO42t0015xk6wEJ7edCde+me+kpcyF67Jh3Tb5CPLVvfPGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBvmCpWeivhct2l3cWCJCAq+equeVvw0k7lCfio0RFo=;
 b=TUjjdwJb+N4Zx4eC35j2/93J/yAvDVCFyU1J0AWxBlA5OvrlwzprSWZf9dW58yRttlIRdGEZtFoVlzAdWVP62/rUXzKVLfQkUM2G9fmKck571Ly4h+RSugoS4/zqdByjjLS1tEm8pB8UK2So4J/cbQrmyl0sGGUMv5Em4anIjzxnzkJQek4NEOMWkTDASJBpmC58Z2yUJ0SXy1BvyodqhQbNVPv95vBaco1FwWXR7ixCDULn2VoLIRap29NK8GQvDh4Lk0mvA2utiPDAw0Ra4igFqaz8VIvcb6IQpbbMyaODzm4Dm3ij3cc/zd4173/eHiuV6IcNmQTAK3AtSMXs0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBvmCpWeivhct2l3cWCJCAq+equeVvw0k7lCfio0RFo=;
 b=NBxpNHYJ3VEdpgklr6f6W3RnBMWLBdmfN0/V1gG8TvQIm1xNrkoZedoaYDyzylrJXfe46qdv+rkjeB1jMIRzs+sDZR5nnb+hJkAF+bzcN0mRZv7+ha9K5n4f5V9hsfOd0AfzSpZN00IOcce2kKAHshBrt5H26l5YZuloXBXPlQc=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
 <3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path"
 optimization when running virtualized
Message-ID: <2e09dfd0-5da4-bdcc-900b-d40a112d832b@citrix.com>
Date: Fri, 5 Mar 2021 15:47:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0496.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee10b90e-086d-4447-d23b-08d8dfedf428
X-MS-TrafficTypeDiagnostic: BYAPR03MB4741:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB474165D633A371A7E64768A8BA969@BYAPR03MB4741.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bLTRl0Nmltg/gcPBTLGPpytt06/6/btTaNb02dJOzH58Hs4vlUh+IqjhGtpFOQM6GubHPxv9npkMVcXJrcWSSOAnvSmGYkwJVMcXzWe/BaMhQdgULueKQRAINzB9MWgCqlp06ELvZ+2tShtQDtqlIN1OxR1y9gRab/hvD3oMmNj7Wqc/O39hwesoH8Ougp7kAZwMGA4s9or9xV1QaWXVhSGJq4GmaKc06d9j2SX9zPfwlBizP5srvCQbU5it+ZhHOH0kzuXSPoRcUkKD6Hq2lqHkKpanPqq7UWLsM1B2axZUAz6kWW8IOIG89eEcLhgpqmiuvmeYpGHYLpvV9QRYBR6u1qEh9n7mmX+6sgcxz3tCM6Zp7QefTIRXyC242qSU6h5ALmIA/0ou+YKsD2OO8uqdjnDbQgS0fd2KgkVypcURIsA3OLBA8IjuA4K/eXLyDZtyoKQZsWpJcO2Xv0ey7HgoKdnZ7j079UT658wq7i+8A16rXJlOgb7Xc9gk74mzrcNYD6uXOvUQ/tLaEjcqoLvp0boJE8IqUf/SEHq+Y0mx4e3yxxN7wCGF/reQCzJkk2B57uUsaUdpcJ3UUWu+7dG0q8zEtBri6eqhNA7zhcw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(66476007)(2906002)(8676002)(36756003)(186003)(478600001)(316002)(31696002)(6666004)(16526019)(4326008)(66556008)(26005)(110136005)(6486002)(86362001)(16576012)(54906003)(53546011)(8936002)(956004)(31686004)(5660300002)(83380400001)(66946007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2RLSkFhcTl4ZUJtL2JFb0UwZVJCdndDOWVsZmYzbnplUmF2WDN0R3ZpSXln?=
 =?utf-8?B?UGRIV3owUGhVdXFHM2NkZ0NFVVdScmNrM3FBMzNIenJ1cCs2UmFvNFM0b0py?=
 =?utf-8?B?STExb2dWcUdmUXFGTzRYNUZ6Z2hVb2V0ckNTM3d0N0tFaUg4eGczN25iSHNY?=
 =?utf-8?B?S0oyR2tONVlyaUFRTHZBT3hpSVNLNUlNaTE0djkrRW9XWVIxTmpsOENJcytZ?=
 =?utf-8?B?T2Y5TG5WOHZlYXFzeGNDRThHT3BCS2pCcHdDcFpUMFpqSDBjdTMrZThaSFMx?=
 =?utf-8?B?TkkxSlR4ekpZYWcyT0ZnbXJ6MFowb3phb0NuS1V1cmdINGYybVZKMnJCRFV1?=
 =?utf-8?B?R0RFRWpBdEZINnh0YlVPZVJRbkMvTUpoZllEL3hOLzR5UDJPV3ZpRm9xVHFL?=
 =?utf-8?B?a2l4eEpLd0lrL3AvYTUrdFlseVN2QU43YnZLNXk1U0ZrTzlXdjNXWVRvbldt?=
 =?utf-8?B?dlhuaEE0SElTL3FCNU5BYkF4ZnBtQ0FBZU1XS3draUt0RVlTUFNXc3k0dlB3?=
 =?utf-8?B?UU5MMndRa05VMDFYUkUzRURsTGpDRFJ2SzNXRnlHWnBSWHExYWUza3AwWTVt?=
 =?utf-8?B?Q24yLzB6cy9CM2NFbzU0QXd6ckZVMVBzUmhHRTdleCtpakJtRzNobXBGR0Rm?=
 =?utf-8?B?bUJnNUhUeU9sZG1MSGlUNmQ1emZHd05QMkw1Z1NITTBzNStvcEtzQVN5Yk1T?=
 =?utf-8?B?ZWhGV2lMQWJ3TWlDdEhhVC9XS2V4MEFSNW1vZU9GRzdNb3E4dHhZU1c5ZTNk?=
 =?utf-8?B?dmhPVWtwaXhLbStxSVgvd0RmV1NoTXcyVjJCdksxdEZld2JpajE3K1hYZ2xa?=
 =?utf-8?B?ZExaNDNUb0NXNU42T2NncU9oSVhHcklRQUtvdk9YY1ZUdG9MNlpFUUIrTFRB?=
 =?utf-8?B?eEhqWW1BNnA4bHZVaVl2STFCSXBDaUZwa0o4Vi9nWHVVVldGcmxxSFpwcVpL?=
 =?utf-8?B?MGNLT1Z6VnRtSXZjc3pxSnBBZ0oxVDUvNEpsVGFoVmtVTTZsdlllUEJLM3I1?=
 =?utf-8?B?MnVUbzhzQjJMWFVZUmkzZE5vR3diNS9qd1A1bkNtdmdaQ3RhYUZBc0t5RUFV?=
 =?utf-8?B?aHdadVZrS096dDl2ODA4S2FhVHlYQndwK2V5VXl3K0VxaUswTXR3QmtaazlF?=
 =?utf-8?B?bFBONnJ4SEFVZ0lsdzJvQTROYklTU1RlTzk0L2tOdnpiNEliamZUdEpKbUY3?=
 =?utf-8?B?RmZFK3JuUUxHYStObzdGcXFXUm5aMXRwVFpsc0Q2TFJDckphZXdyZ1lRU1Q2?=
 =?utf-8?B?dlVqYU9BYmNUQnBtbGlZV2VYcFFSeVR1a1pjejRTV2xNSFJ6T2d4RjZ5SC9n?=
 =?utf-8?B?WXVPbDdsb0hKaXFvQXUwWVRHRytUSEhwOGh6MnVtcVJzanZ1K3ZzOEJxZXMv?=
 =?utf-8?B?ZjJ1M3ZoTzhyWlh0MUVvVnFLV2JWUTU5aTN5VVBEYTV5ekgrWVlnOTY1VWdV?=
 =?utf-8?B?ak5ORXVGY3F6a3JRRVIwN0xCYkhOd2ZZSjVaZ2ZtT2JHRlFSVEMvUDg0andv?=
 =?utf-8?B?eThncm1yd1FWRGlQMzJrSlJ4ZUtrTGVEd2xGOGMzZU9BNU1UNmpadmV5UmlI?=
 =?utf-8?B?V2JBRXFEWnhnSHJrZ2VpeS9vTTVrb0h5dWkyOG1zTWZtRE5BS1Z1RFVoZmI2?=
 =?utf-8?B?dWpyRXRmc0ZFOWptSDlBVmZjTnYzMW5nMzRlOXVyUUs3WHZBZHN1aURJQVFP?=
 =?utf-8?B?eUZmRWpsTXJpS01aU0VvTWtIYzRyLzloYXRqUlZQbkRwRzRUL2l6UmRJenpv?=
 =?utf-8?Q?gGtAFfcZQIyPGZ44v2ag68y/fzUEMDu3rmqc08Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee10b90e-086d-4447-d23b-08d8dfedf428
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 15:47:17.2772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5694hESdV9DPhphaHdeaKeeGNUb/c92JCTsTWkh8c1cnlSE0OojkXZLJqOKfIqqI8522JE6VDRIKvrT0/R82pgTVy+6f+xfs+QIqOzUYeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4741
X-OriginatorOrg: citrix.com

On 05/03/2021 15:37, Jan Beulich wrote:
> We can't make correctness of our own behavior dependent upon a
> hypervisor underneath us correctly telling us the true physical address
> with hardware uses. Without knowing this, we can't be certain reserved
> bit faults can actually be observed. Therefore, besides evaluating the
> number of address bits when deciding whether to use the optimization,
> also check whether we're running virtualized ourselves.

I think it would be helpful to point out why we can't even probe at boot
- the behaviour may genuinely change as we migrate, and if we ever end
up on an IceLake system levelled down for compatibility with older CPUs,
the "paddr_bits < PADDR_BITS" check will malfunction in an unsafe way.

>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This wants backporting to stable releases, so I would recommend for 4.15
even at this point.

~Andrew


