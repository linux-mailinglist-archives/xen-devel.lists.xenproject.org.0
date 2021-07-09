Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0973C1F64
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 08:36:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153421.283471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1k6T-0002qt-0s; Fri, 09 Jul 2021 06:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153421.283471; Fri, 09 Jul 2021 06:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1k6S-0002oN-U4; Fri, 09 Jul 2021 06:35:12 +0000
Received: by outflank-mailman (input) for mailman id 153421;
 Fri, 09 Jul 2021 06:35:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lQXj=MB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m1k6S-0002oH-3d
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 06:35:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ceb781be-e07f-11eb-85d2-12813bfff9fa;
 Fri, 09 Jul 2021 06:35:10 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-RZR042R5O32_2tJPYc3sbw-1; Fri, 09 Jul 2021 08:35:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Fri, 9 Jul
 2021 06:35:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.022; Fri, 9 Jul 2021
 06:35:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.11 via Frontend Transport; Fri, 9 Jul 2021 06:35:04 +0000
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
X-Inumbo-ID: ceb781be-e07f-11eb-85d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625812509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+AqiIWTysBKJojy2RXCG6sPRdvypnGNnb8IKWgMX/g=;
	b=U7KZ3BTlTDLUMFeXYCUorET2aMvNcAe3HDHooNcNy1q2fmGJry/nGcf7c+YEtb7vEOWiMa
	vdnOJks+XSid9iWETXFWz7g/XBLN6Zc+DHMIzvNLBM/2YEHCpvewxAEU9HE0UY3Qd+3YGd
	mruRTbYU62JEEKUEWYHt3JZxNaqeUHU=
X-MC-Unique: RZR042R5O32_2tJPYc3sbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2IsWZLnsi1ZfXVIDG9mlRePMfzI6jHbXXUrJnrpm42NHLighznhtMiCoQZrr5vGhD/N3SxtDbmIQgYzeBW5vDY6wDuM+XbRt1ydwtH4vVFu88YaV99PrJcsI3V3QL0++dQmUYzS8mJMbGvEPwxpr62fmqyrb61yewkuYIRwzAZ1PXLK/0LJ96zadO5ust9PVQAsFEMCftw6jQAAvSNP0j1GtAD492m0XZQU+Tzp5RAwGtPo8wO9aqXbaiUDXJee2m6PkAfZ9IZ2sx4NfQLSlLxe8siv87uv/GXsYN0pyGXQR1LKvJc15BydRnJCSHrZtdtxIVJkteSN0J9z0QVYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+AqiIWTysBKJojy2RXCG6sPRdvypnGNnb8IKWgMX/g=;
 b=gWiM0p27mzez+tu0VkJ+LH7KirF8ESCcluzCeZ+WpTE1YYZrt516x1GPN7QSS1Dyj5k11r1dG/RWgpE9Vo3TDrpj1nF0xJp0COqOVu0rf5BhzaQvyTl5m0j73L7QR5RsdyRXMym6QxGLon8rfCvMpD+JrD4wmHUokSSCdp588RG+nbhwu1o00bDAEQiBlG3vXyLZDU3fqmMS3W4Ycxj8JxsPudQ3Xb8KBrRnWSf8lqQzVkkVfrCRy3+Fl85GqcGHLf+4gatX3oByZIt7dRMyCRjxgn9zcLtcuu1MZrtif2j5IbzBfH9sz18XUckcc9OMBsYVI7TIS/Qo71+N0SnLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 0/2] Introducing Hyperlaunch capability design
 (formerly: DomB mode of dom0less)
To: Christopher Clark <christopher.w.clark@gmail.com>,
 dpsmith@apertussolutions.com
Cc: andrew.cooper3@citrix.com, stefano.stabellini@xilinx.com,
 jgrall@amazon.com, Julien.grall.oss@gmail.com, iwj@xenproject.org,
 wl@xen.org, george.dunlap@citrix.com, persaur@gmail.com,
 Bertrand.Marquis@arm.com, roger.pau@citrix.com, luca.fancellu@arm.com,
 paul@xen.org, adam.schwalm@starlab.io, scott.davis@starlab.io,
 Christopher Clark <christopher.clark@starlab.io>,
 xen-devel@lists.xenproject.org
References: <20210514034101.3683-1-christopher.w.clark@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c420fd7a-c8f9-03d4-760d-f619a927531f@suse.com>
Date: Fri, 9 Jul 2021 08:35:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210514034101.3683-1-christopher.w.clark@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e139d08-d3ce-4f01-81a1-08d942a3b009
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB444541C24E1FEE29BBF4DC13B3189@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DbQEVjcRrUUXUa5TB8Agt9Oncun+hYIwNsfikM3lH1fC4HsW926XTghKq81ed6+6NomN5xUCYU6KSHk9Mz7HNh42oy8XU+GeqV35xAjwLuOEBhNR5/tWa7VzAE6DfraVdJeyRJtm3NRKOWHYQ+H4NYGUcdNynyU8j5L3s9MAhoiQEjmtgj3/w3knf7nVjO4/wrTjXdMENCE6llLnkajFsneG+mDT1P8JpbkJsFqIlhleN+hjA9Ktn4DiijRms3cOxOUg8sPLO5F1tvud/nFyxyAi6P1YuoqTyfRoGq6kc+TCF5H3Hb2sxSDcAYdsQuiB5jEx+pRWGiuc0PxOUILEZRtnIJ/Xls9fED/FK6BeRSqfgFBdY2uSgi37vV+qVqb76nUoAqSSIq811G9za0HkKnqbJqFAc47mp2Nnn6kb7bY1F4OI9u7kAnVC8ZzWeTG45VhNL3U40aHImodGMnEHygGkIKoevM+EpLHhwzhtNp2txKV8LbwY5zS4T/AKGJrAGS1+skjiJBVFjMZszyIgL7902j/wZYGv3vDiqUw1v5xzuFj5dWg4ye1zqdWM7HuHydaFft8UVoDF35g7ppeU/FVVZ2UufLPU8n/TEpeVyyAeiRJZPF2Q6P7oBwFBJHsjk0n9xRxAlQOFPp/aWWZsUB5H4dPQJwzPkWN/7Gf5OnS16F4y7W+2948e2rzwqc0jFDSsyaWQ7hmyRN7ougd6LVIbswxNHJDV54xTC5RmZqHOuYSG3/7Kf6CyJImgHGVz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(136003)(376002)(366004)(396003)(346002)(26005)(316002)(8676002)(186003)(36756003)(4744005)(2616005)(86362001)(83380400001)(6486002)(31686004)(38100700002)(956004)(8936002)(4326008)(478600001)(53546011)(66476007)(2906002)(16576012)(66946007)(5660300002)(31696002)(7416002)(66556008)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEdvYkhUM0d6blJ1emswSW1qQXdpakJodGQ4Ry9WLy9BUDNxbHZ1NUUwZ1JO?=
 =?utf-8?B?RHlZWkFkQzlNQWNFQ3h0SU1UR0pNOG9XVko3M0pGZTE2bGZicXAxZXppUVpq?=
 =?utf-8?B?dXZUUkRXRGdUVysySWxFVXJFaDJkZW5pc0k1OVZxV3FrTFRvVXVKVk5BOXpn?=
 =?utf-8?B?dVJwZGRKZnBzWlZxMUtpUTJTc1E1b3pLQlhqdWt6UzY1bFJIdEl3dS9Mb0Nr?=
 =?utf-8?B?bE8vYzYzTjdEelNzdjN3eHVDNUZsSVB6RlBuUEt0REdNWTYxWFBwVFNHZGVP?=
 =?utf-8?B?NFRXZjlZV1RyN0I3ZENRc1k2TjlUbXNsay9qR2ZhYzI2dFp3NW1nR21RQ2pV?=
 =?utf-8?B?WGpLUGpoYmRic0RKTnZUZTIycVFYR0xodlA0bWtjUDlvaERQTG53UTZ2Z1gv?=
 =?utf-8?B?cW9HSnZ4NCs3SU9xQTFId3RkWGhVWTdSSG5lS1B0OXRoa0k0YlpwOTdtaXhP?=
 =?utf-8?B?Z3NRZmg5djdLN3dqdzNLZDVJYThoQzBqSStBODFIQldzQWQvUWt0bFM2QUtr?=
 =?utf-8?B?Ukh3Y3pXR3dXMWN3MlVheXlCVlFTUG1VUHhDSnpQMkFWaHUyOVNBNXRKV2Y5?=
 =?utf-8?B?ZWxaQ0NKRTZvQVFQMnNSaXZGRDlLdVM4N2dHQTVMOUZRR2d6YlhNeExsRC94?=
 =?utf-8?B?blhGUFFydEdTZGxiU3luaEJhdTV6blgzWnVadHBnRlFUVUo5b29mcVFLdE9u?=
 =?utf-8?B?a1lrb0NBU2doNzkzWDNPQ2NMT2ZjUTRyaVREQXE2THZheWtlU09kWEVSWk5m?=
 =?utf-8?B?MzBoY0t4SFZweFRyMTJuUEZUMEpTWUpMUm12Si9SSnhtSWIyRk9KNWlRM2M2?=
 =?utf-8?B?VkV5VHdZbWlCS1NweVhIeVQvUm9GNXdWUVFKSDNPcUU1UVJrdHcrT3owVEFH?=
 =?utf-8?B?K3AwNTRHREdtRlZNOTF3NFpRWmI1MDZnNkJidlhhWHB6c0oyWHltNTJHQTJo?=
 =?utf-8?B?dnJ4U1lDaS9VTWNpaXVuKzN4a2J4YThEQndTK2laUEk0R3NuNHVQY0RON2dz?=
 =?utf-8?B?VEFmSjVFdjUySEF2Z2FJb0pFaVBNZ3BTUGtjbEJxR1lGN3g0TVhFdEVNZmdP?=
 =?utf-8?B?R3E2bWk2QlVUdnRlL0VPTE9nNUlSbmFOQlVicVE0ZFpMS0NoZVlGU3gzSi9P?=
 =?utf-8?B?L3ZyejRPZndGSEhMcG1abmNrNmtKVVhuSWdnN1Y3Rlo1YURHTHBmUkszcy92?=
 =?utf-8?B?cHFhREwydnYxTm9JbHNtbnNVOTZZa2V1QXZJa3FwT3Faa2d1NUtPbXFvamJ4?=
 =?utf-8?B?eFM0bFFiWUVONkI0U0FjZGdMUlA0dWNrc2JPZWtwbCtiWDhaTVY4VFYwTnhQ?=
 =?utf-8?B?VzBUcEh5ancyYXZwZEpjSE1IMkhaZGVseHR0ZE9CRXExSXl4RktYWjdpbWJ6?=
 =?utf-8?B?ZnNaRHNZSC9qa0w3cExZNWtjMWVHdmVLak5nU1dEUTFFZXZrSDNxVUtrZURW?=
 =?utf-8?B?MCt6dXV2c1g2TUJrL2RUV0FMUzRqejZyUzQwYnR1OWhWQko3NUNGVTN3VkMy?=
 =?utf-8?B?eUg4bVhHazU1blVwU1J3WmM4L09lZlU5aWt4SzltNWJsLy9tTlZ3cEdlRFpL?=
 =?utf-8?B?UXVNTy9GS3gzQ3doRG1RRXRadlBNWXVueENlM3JESmVYYlYrTTd1M3pCM3Np?=
 =?utf-8?B?K004U29Ib21aZlRZUnA2Sko3SWdIcXd0ZDZkdDl0VEpuQTl6L2cyb3k0T1Jo?=
 =?utf-8?B?eVF4MHNMZHZwQS9Sd2dTUjJDZFBFdVNIb0Z5TFd6K3NSeVVVTHZZVUtWNXJy?=
 =?utf-8?Q?d1uNMo7iqKDT6b+L5//SshcevKDu2XSFnU469G5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e139d08-d3ce-4f01-81a1-08d942a3b009
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 06:35:05.2819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+xfvsahvRkxE+EzPn1ysJuib77zHURL7sYn3euC3liD0D3mQBmHBYGL3V/If3dyEC/R1y3KkrlRFCkXebwJRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

On 14.05.2021 05:40, Christopher Clark wrote:
> We are submitting for inclusion in the Xen documentation:
> 
> - the Hyperlaunch design document, and
> - the Hyperlaunch device tree design document
> 
> to describe a new method for launching the Xen hypervisor.
> 
> The Hyperlaunch feature builds upon prior dom0less work,
> to bring a flexible and security-minded means to launch a
> variety of VM configurations as part of the startup of Xen.
> 
> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> Signed-off by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> 
> Daniel P. Smith (2):
>   docs/designs/launch: hyperlaunch design document
>   docs/designs/launch: hyperlaunch device tree

As settled on during the community call yesterday I've committed
these. I have to admit though that I would have found it nice if
there wouldn't have been a need to massage the patches: git
legitimately complained about trailing whitespace in quite a few
locations.

Jan


