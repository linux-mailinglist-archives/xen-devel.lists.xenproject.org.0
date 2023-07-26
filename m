Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245437635CA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 14:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570428.892191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOdEC-0002iI-SI; Wed, 26 Jul 2023 12:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570428.892191; Wed, 26 Jul 2023 12:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOdEC-0002fb-PV; Wed, 26 Jul 2023 12:02:52 +0000
Received: by outflank-mailman (input) for mailman id 570428;
 Wed, 26 Jul 2023 12:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOdEB-0002fV-Mm
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 12:02:51 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe16::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57165d8d-2bac-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 14:02:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6796.eurprd04.prod.outlook.com (2603:10a6:10:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 12:02:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 12:02:46 +0000
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
X-Inumbo-ID: 57165d8d-2bac-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XG20joKvqirFTaCqE1USMXW+UEHo9/wejWM+phgtkdp6M63x0sYIDHgqM/VDrChdSHE1mkiebjvTEdFH8XlUmFILTdWRVX9EDmcFeLCeMbjy6eOd5DC2x0ab3ywhfhQJs3vbbh7quhWsWbixa8pMvIBSZ/5LCFS1y7peLk5U0VrSXu44IwyCmWdwsMfslWbDbuKjVzcFdn3w3ay3KgXlhKuBJjmwUZLjmbGLUK7C/vD1yKJHKMK+iVbVfMq+Gf4zD0axBY1fQueGN7c4kwhzbDL9ZGQ09Lhp1Nz2H2Ud9gtAJK0B5aJWAI/EmTLalrzczEeWh5umiav8i5EHHQpfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RG9VRrX54zmq5tzgSL5KgTqxGYFT+5kJRwPkBC3Tx+Q=;
 b=NW7cWyLgj+Wl9EOS/Ml6gIQFayRY8XL120Y/l0WheSTa/JmpcVHoAjn8B2UAQcGPgoLIPH834mWc150oDrkDeO7flmZDbNrj55HhDsZnFEqyaR5yfZQbiRTde1JvEeMh8cMYxJw6LaFuSN5yZpQssYTlppmwrrWlHcHxPdJe9rH/t/fe4uEhrj9DlMmdCPG+Xh6Nkg7G4BuYZfA4ccSHBMydvwRqX4mBRAhRs6h/B4DQUyup/HsI3O6XtzZmyy7OOcqaY05Z39q7ow8bt7RDM1GEimdh4W/2C7Sm8IiBreNwJSnXP9TyP5cu5ZdSYf1G8mfV46vgEJ/px6OqRXSmBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RG9VRrX54zmq5tzgSL5KgTqxGYFT+5kJRwPkBC3Tx+Q=;
 b=hw3wO3H3UyczgFvxuX0f4LwB5suNQ4otBZaqUYmY44DF3FYRca0qvCzjLOSMLGbUXfHHkO8mCtSQGeoncugCa+wk3KGAPmsXyzDcaGPt15HaN47zXCVaBuFqqK4JqCW2wl0/7ljKeZBjO3JbKWih2WDpD9SkYZCB9n9ZK5DelIIBnHXVi2jMLtM390jUj0HJY9yPeSSn10DsDNREm84O1F4d0UJ7P2ApwXOgO26uhXU5IlOefjzGZtpHe7RxWEBtHwC5K0WLL7CPbDE1m73NMBVGPBCkb5V6m+oFSdDrQF02sge8tTw8hBLu1CoSnSIEFcfcqqpVL8NMx05Q9/kHZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c07a7651-b45a-a6f9-8dcd-f4237a51d2ca@suse.com>
Date: Wed, 26 Jul 2023 14:02:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 0/4] xen: address violations of MISRA C:2012 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1690368810.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1690368810.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 30be8ee8-5d08-4bda-bc26-08db8dd0399f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hB77DYbrAbW/N3j6U3Lr5NaMgVPP7zixI4tpPt51PzItUjnSC8vyuLHB/XuGbwk1H0Lsac1+g1xwqxczd5oFC3KMzSo1RI3EYYBxB7gAvZeotzsm55TJqJ8/As+bAf5XHMN25ghhdtwxgFFmJkmWYxrlP93c7J9getiPs6DvIYd+RhcltcAvUePQiPIrtacMB3FDHfG+eQfp6ko+bkaNXnQV0jb2yQiWnJuahiuN9O0o6vzLmdk7kfOfF4enroRwPYfQ5wJMaH/ccWL+EM6DEt9SZq/GVg42mymL8SoHScKPTslVUIQYpQMchwhHVNS29X+RZZ2ySctSTWKjXb675/5Hrd0dSPcMFcGJ574FT6oO3X9e1u/pnROhrL3pdvABQGSSY2LSPtTIomvL+Za1wbgJEIYh9pMGA6myh0G3TlR2Az2NPrEBwt9GCpr26QgTBwqo8pjwkWO6oThExi9eVVZZ2yvfuwcwOdSgksYKpw5epR/VfwuROtjdGUSZx8GakutjewzoB+tkh5NLSSLV6gWUULwwsbrEjjOWu2fgdMRCYTg9SFG8AzyzzVNfpEpsPiq38X6Sw05wPohyKbJiQ16gEN7Fidy+Th8XUDPg5Pqb2TzYbGGLwdQNeMnRHNSFt0PbXB3RmQ3Hj8zpg6mX+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199021)(31686004)(6512007)(6486002)(54906003)(478600001)(83380400001)(36756003)(86362001)(31696002)(2906002)(66556008)(2616005)(66476007)(53546011)(186003)(6506007)(26005)(38100700002)(66946007)(6916009)(316002)(4326008)(41300700001)(8936002)(8676002)(7416002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3Y3ZU5NS1RaaTVpSnRBclQ4V04yRnB6UjA1SzRVczRQYk9qMmtJV0FENitP?=
 =?utf-8?B?d3VyK1NoeWN5Q1lYRzU5QUUrV0crUzFNVTNUaDVVQkV4aXJiYVRyZURWYmhw?=
 =?utf-8?B?NTBBWERNbHo2WHJ3YkFOblN0c0R2VGpESjI0WjhGbCtmd0Y2VVhZbTZ5cTJa?=
 =?utf-8?B?UzNQOTNUR1kxVkR1QlFPcnBIWk4zVWNmTUsyTW9odTlmWk1FQmtyT0RGblVW?=
 =?utf-8?B?TmcyV2pjNVVNWEpGZlhSTE5CZDZ3bndjaWpWZnJmZGRKYkRoV0xxQm16L245?=
 =?utf-8?B?TmltT2VJbXRCaHNHU3dCRlpxR25TTWJZOENtY1kxNmJNd280QUM3bWFXT21x?=
 =?utf-8?B?NXhJUmN5YTY0VFJsejc4eVhBSk9KdGlyU2pJY0hjZXpZR2w4a1NZblVuUC9U?=
 =?utf-8?B?dXkxVzZ2Nk0zbjNmNElTOGVhaytLSEZ1RGs1WS9nUmMrQkdTd0FpKzRPSmZW?=
 =?utf-8?B?MkRSL0ZkaXAybFBqUFQ1YXdNNXBScHRvdGYySEtlZnZNdW9Vd3F0YnlRUnpF?=
 =?utf-8?B?Y0J5YmtFR1B3cnBkN2FxVmdaOVcwZ0NUbGZtcnZDdjJYaGdqSjRTRHJsTXEw?=
 =?utf-8?B?NkpDSDMvYkltMXBIam1TQ1l1WmljcXNZM2I2dDZ2blpwd1FGTDZPYU9qOFYx?=
 =?utf-8?B?OUF5ekJPQjJFdjJJSXVSYXl3Rm84M3luRU1Zb2gzME5CbTRsbkVHMVlKTjVP?=
 =?utf-8?B?Z3d0bThsRmhuSnFKQkJ4NHl3RmpNMWZ4OVRGVEpicitRWjJzbmpvc0h2UWZV?=
 =?utf-8?B?ajltdUo4V0tJSnVTc2NhejlhM2thbmdNSDhVbWdYeklnYkRSVWlZRFZoM0RH?=
 =?utf-8?B?SW8vcUt4UkNYZXpGZmpxc0VsVFdLblN2YmJsU1pxeDdPOXVxZ0d4dzk4TnZx?=
 =?utf-8?B?a3lZeWgzL3VhVWdldkR3MUlWWlh4bVhOalpCdU9zRi92L3IvYVJrcmNWa3Z2?=
 =?utf-8?B?M2hqaVhZeHE3YVhmNkJ2R0hmekhzK1NBNmlDa0p4dVJjdThVUVJHKzE0a3hz?=
 =?utf-8?B?S2FreWtRaXdZL1lFV0ZrQ3dnTDNRSkloMGgrMnlMK0M2cTNTa0JaUHdmNXkw?=
 =?utf-8?B?R2JDT1EyRUJZUEI2aVJHRm02VVFKSCsycldoNzFCR1ZxREx0ZzVkZjJKUlFE?=
 =?utf-8?B?RiszV2FtQlJWS1NqWnJSd3hCZFlRcGd4cVRLRTlSUEIvTmZmQXh2aWo5OFcy?=
 =?utf-8?B?N0diU1N2aUc1dVBXa2NzSWJMZG5heXp4U1A4T2JHdm9CYzlCUHZtaTN3cFdj?=
 =?utf-8?B?QUpjK0g3Z2FTQUJTdjJQYWQ0STh6SHNjYWtBNGRvdktLajNqQmVEUjBscWlp?=
 =?utf-8?B?T3czRTJ2bFZHazlxSVhoRUxzYU4ra2FyOWVJZURlVkZMNWhMbGNoRGt5aGJt?=
 =?utf-8?B?b2ZqYXlDYm1xVWZHR1kzODVOdGRiNzQ4Y3c2REJERHlnZmNObXV4K3lZanl2?=
 =?utf-8?B?RzlBZi96WWJyeUdpOU5Zc3ZBVnZaSHJqenJJL3NURzUwZTV2UHNiZmhjemd6?=
 =?utf-8?B?SjI1aEU0Tk5zWHAyaUhNK29tS2ZKbjdRZDgxUjU3bEdFM3FwN0Z1cFFWMDU5?=
 =?utf-8?B?WkdKWGNoVDNRbkFTV2Y3TnBuQUlnSUxrRnJlczR2QXhaTVdqMDlEdVBYZWlp?=
 =?utf-8?B?QWxSaWJYVndGeVNCTzBtcW9SV3lJNkFnQXFpYzAvVkFTOWZWN3h1anozbk9W?=
 =?utf-8?B?YjhDQjNEQmoyQVFYS3o4azRRNVVpamxyeENPNTVEd0prNzV4WmJaVlFtWjZ4?=
 =?utf-8?B?NndVZXlVdGhIdThleVFOTXJxYnhJUXA0UFNNYXlNUGZEK3ZMWi96RmZSQTRn?=
 =?utf-8?B?K3lCditleFNSMnRGYmpnV2dZQ3lHV3lBVWZJV3M0MG5RVXoxM280SkEvTURM?=
 =?utf-8?B?em1scUgxN1U2d28vTzRGeTFVYk10VmVMZnRmeDVHc2s0VExMdCtDY3ZKdTlQ?=
 =?utf-8?B?ZUk3VGcwMXNVcE5wKy9LczVzN0grVUpJVkJhME9OQVZFazVKQmY1M3Q0czBw?=
 =?utf-8?B?emZmdlFTMXRDUVhnOUhYMjlqWXl2ZDhuczc3UXZJM1F6QlBvajR1MmRxRG9m?=
 =?utf-8?B?c0VzNDBQYlhLeEdpcVNrbVA0ek9FaVdlWCtzYmZRTllqWmYzeWhDK2Y4Z0JG?=
 =?utf-8?Q?SeW7iCHof4E7qUypZjqBtsw+N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30be8ee8-5d08-4bda-bc26-08db8dd0399f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 12:02:46.3827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mb981W9QqnGUZSp9KAodOy2ppnvl+kgwnIRiD0F95FTxVGxYDOYeMTUfyw8kzLt6AF+e7SiznGMrNq2UxDv7AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6796

On 26.07.2023 13:03, Simone Ballarin wrote:
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline
> states:
> "A 'u' or 'U' suffix shall be applied to all integer constants that are
> represented in an unsigned type".
> 
> These violations are caused by the missing "u" or "U" suffix in unsigned
> integer constants, such as:
> 
> xen/arch/x86/hvm/hypercall.c:132.17-132.26
> if ( (eax & 0x80000000) && is_viridian_domain(currd) )
> 
> If a rule is not met, changes are needed in order to achieve compliance.
> The patches in this series achieve compliance for MISRA C:2012 Rule 7.2 by
> adding the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Gianluca Luparini (4):
>   x86/vmx: address violations of MISRA C:2012 Rule 7.2
>   xen/vpci: address violations of MISRA C:2012 Rule 7.2
>   x86/viridian: address violations of MISRA C:2012 Rule 7.2
>   xen/x86: address violations of MISRA C:2012 Rule 7.2

Looks like this is v4 of a previously larger series, where fair parts have
gone in already?

Jan

