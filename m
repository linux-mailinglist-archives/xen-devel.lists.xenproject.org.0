Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169714D44CB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 11:35:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288270.488866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSG8u-0004z0-NJ; Thu, 10 Mar 2022 10:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288270.488866; Thu, 10 Mar 2022 10:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSG8u-0004xB-KJ; Thu, 10 Mar 2022 10:35:36 +0000
Received: by outflank-mailman (input) for mailman id 288270;
 Thu, 10 Mar 2022 10:35:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSG8t-0004x5-Md
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 10:35:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0760a20-a05d-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 11:35:33 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-oH1Bu1arM9-b9920fu-VHg-1; Thu, 10 Mar 2022 11:35:32 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by VE1PR04MB6734.eurprd04.prod.outlook.com (2603:10a6:803:121::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Thu, 10 Mar
 2022 10:35:30 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 10:35:30 +0000
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
X-Inumbo-ID: d0760a20-a05d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646908533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OzV0hcvi28ysZA0Wsm1hJezLS60mrXHpfPR0s8jgrGY=;
	b=PrAxa/l4K0w9E/yq3b9FlFgjYqZISINowBuv/ezHVSIMRnczC4eQ+2s5qob1J+XIVgHX7Y
	A6vUJ5DRfKJhwYfgP1cJo6v0ahkKAnvyUM2f6VFzYBaZ5CP1F40E2iB7X9WSU5m/GnDqt7
	s0abISEOqd9maNi2jCBuhq6OY+5DYrY=
X-MC-Unique: oH1Bu1arM9-b9920fu-VHg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eH2CO1Y/lXU0fp0SlzP1GKxp4j1y/F/CYfyoyA6DLfH9E+scGdhbiP2tn3artp8NN+Pe0TkfnQ1wbbrDgHcq5+EVTPaMX62hu2J4us9axMWxLM7N2IvSddMwindfItRcaOMLj8YtYaI1xWGMuvItfVdC4H+WbuYOfI2iySRTIlYooQLx0vIODdVgAi7tjTE8xM+K4p77ji1/JQPzNOJ/kpHjV1erNBivlsXJgAtKKfoZJ7QjXmWF8SD+k29ENtN3bnWlnKNSkw9OWfCzewmDwdKeq5jx0KOowwzTcUF3pfkb84rCPJ9lh3GCLEkd88Gefz9vHWmRIMhbMMCGWO4Vsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20CME50G/wqua2ecLLQuG4muwszWL3eObGtwOOp5zgo=;
 b=RYdduU+/dYgfUKLycxp1+TGlokEmfHh0LpcAaACU0H95+IjNfvlYLE/RaZ9eOz50EwVwxqWj3SHB7TLFX1dqjVk6TJBkOx4EBxbM/KucINYNSOfm/V046A9TMXFOPPz0IkhBIKFx5LVpPfkUkY8akROz5Uxd6jwEIURlAcs0fm85Dvrhn28IhAAivF+nc8latPAi5lS3xX+2hhGMagyygFEug2tlvjXvEFyl+9ju57WB5jbK53yqV+nxkw/QMcD8vUNKEgp90R2wtABwttTAn0Ojm2QYa/SMYtGYturLF9WE7z1eUxuSDWCatQHKn//UcEF1KGKKCtfoPHSdP17zmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cab2a003-5112-42d0-3d2c-3758c895e52a@suse.com>
Date: Thu, 10 Mar 2022 11:35:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: preparations for 4.16.1
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b9be95eb-7a6e-9f1b-6b68-6d08d6329cd1@suse.com>
 <6f8ccbb3-d384-bedd-8fb2-18aab570b588@suse.com>
 <41020867-eaa4-839c-3380-00bd91c5299b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <41020867-eaa4-839c-3380-00bd91c5299b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::12) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3380c3ea-3734-443b-8531-08da0281b2b4
X-MS-TrafficTypeDiagnostic: VE1PR04MB6734:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6734794530627628CB46ED5DB30B9@VE1PR04MB6734.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VMu2zVHYqup6DWMVY7QLJVD6wMT3lxf30sMEXjvPUIaunKWhRQTsEj/7eVx4i3U3mLCcUK0tHQcqINymo16jclPxf+hHPppjCrK1XzhiWjxPR7ug2gBuj3e1swkdhrfj14ap1BE6IzQDi+5GdCNaK9yAWqb5z6VTAPaZA5FOQ+bZ1xCPqN9GLilpDbGTg8pOfnpCbDDyPpb10xOTxylG3RL0rjrdJCQCzyO4dZuRIDfdI9zPJLxW39WbAHsAvw8ad+d1t1mRolCGznornQ2kdwIHGW7mOGK2gO4ltXtps+bnyhGaoPhFvlQ+MQhFiI02tgn3k+vkLnkwBRpzE7Wkusdvndz36cxYbFTQhVXkdLJpH18AXC2wLjrkyuApR1IqKPujoGGQ7RqG96cjGWQZqkluW6YJbE9fdwnLA6mHbOw4v0tw+lVvptnFbkCPR3+dEr1zOf5XocThhUiuvxW2LefzpBZhboNX6pW3StAsLrnku+SsHzcxpJN6RLo5z/Lp8hFwuWKSIV2UKTyHYDaI38gyCYhkJUWrd1jKF2R/3aGQU8LJO1pPcQ7uWeXodMWlr7BfnqOIbDAnC1qd5XkkWEFpxrpVDCiGlM0YlBnBgOWdsd9mkdmrawbxYrdkc4ZSuU9koZ4Cf59fBy3dKQUbaq8qWziNLqlBDRkTPKhXSoAYYOGqo4pHi1XkBeFHj8heb0ItY/pBs1qT51156WIEny4xBjce6cbyFbWfEMXhux4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(6512007)(5660300002)(6506007)(53546011)(2616005)(26005)(186003)(2906002)(86362001)(38100700002)(7116003)(31696002)(8936002)(316002)(508600001)(31686004)(6486002)(6916009)(54906003)(4326008)(66476007)(8676002)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lbF85d3205fkLA0uCpzHlZ3bKQ41AJ1sYlrSSM79zrN9jfnssndNfhl8bklI?=
 =?us-ascii?Q?Wv1D9Zb1qIrBYcEC0QrDvTZh/yIV2WyBRctwBFi8P7zwBKFPB+1WNeUakhKS?=
 =?us-ascii?Q?KH0mLkpSslCzVVzuTRoakpkHFW+lldBsKcsGJvc5DWEN5V+3BwjKHfjvHOQH?=
 =?us-ascii?Q?qw8sQE4OfMAjOVtr7NB4Qfu40R0j/ix5eCVBTpINLn8NJySvwM30YGqTHGsE?=
 =?us-ascii?Q?FgqlEDS3Wd9TYjmrHi4BazPmbRvDplKmNX6w7ZaXfvNYNZvZMJES30zmax+Z?=
 =?us-ascii?Q?htc3NqMcYtdWSoHEZfTzQF4qRV901WgvcsQ4+dW/w4bnzHnwteUGKEbq0LnT?=
 =?us-ascii?Q?o47SzQG1REUFRWFeMyzw2Jbbn+8wJulqai2VsUy/lRb6yjX4fuoI90iHuwDb?=
 =?us-ascii?Q?GTV/BUCftmm1X+oUTdWEsfODhlQFg0g8f0DCk+0K7qqoBjY8n5Q1tSbzVF9C?=
 =?us-ascii?Q?Duzf3seF3Y3EWBSTrhE0mLWO0UpzvxXteDgKdJtM+3oqfGd8F0e1cFKnZju4?=
 =?us-ascii?Q?64jjS+5jGOCwp6FodHJTBrMcx4xJvhhlMPCLByECYiGha1kus+W3ZOq6O45U?=
 =?us-ascii?Q?AUelY4SQ4sM8YXjsAUl9u+SWDdG3gcaeQdUd9f8Xl8XVZZK1QGWrtvODHmd0?=
 =?us-ascii?Q?4y0Vt49xZCeTjTcxqy5p9hIRUb+mj98J09DQTOT+qbEDeEIxiOIbaGLPlDZ/?=
 =?us-ascii?Q?z8iFBmnxthg4pKHLqJ27vkIxZZ/yuwxNz5rSw3MQcjggDa8Zo9Jw/kpD+PN9?=
 =?us-ascii?Q?JCc5ufWU7NtPoKnwxb6UPxK6aLYwV/rzS6KbEe2OophxKDFpxon8tRDbolx8?=
 =?us-ascii?Q?u3dssnNEML/jlgKyGfwJ6jVKsBIgfv1u0X6jmMh6hVHTsu+QO5PsihchktmJ?=
 =?us-ascii?Q?Tc1aykzDFvWnRCKXqyKDhReF9blDeuN1AlbE1MoIkt2M1CplbxePRKs62GOs?=
 =?us-ascii?Q?mavqOrJdGLFQAhFF+8WyEDp5fGpEHa6Wtir1ARNxiwj2rg98q25FmG3OihW2?=
 =?us-ascii?Q?ZCvQVoSWZVk5x4hIpFOiyEWpxlHV8ZQdkhACMPJONwhpY/wlWr9c/na/sFtF?=
 =?us-ascii?Q?jWqBoU7yKDHuYDdRH31N5Wko8pPUDfkDbVceBNM9LYLt4zC67gALE6xlSmLn?=
 =?us-ascii?Q?5ImFByhBorQK29BzMS7SBWmCd5LaYW9HDPB87XH0gCnfrMMHdqY1xF/A/Evk?=
 =?us-ascii?Q?HmHTimOqli20Sv9r3MVSqx7DS26QBxwf09TNEuJspC0D/jDtxLqDZxSufqre?=
 =?us-ascii?Q?QQF2bNx3ukpHjiSEZiXCZd28GUwSVa9W2Vuk8SBnSVlbu/hQV1PeBZAwDEDc?=
 =?us-ascii?Q?LDxRgiIEJWZEo11jq20QIj26ZUurmlTZ7r1BhTyRmjFTj/xrVFj2bIkD0DMZ?=
 =?us-ascii?Q?vpqloimGuh82+N0I3CPPgP+Fa62GVYjdKmsybLJJ2miSS/4ExJ7lKF/nNkLG?=
 =?us-ascii?Q?OtjvWrIHB3zJ1Nq2PX/OL+Q+okvHyw+q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3380c3ea-3734-443b-8531-08da0281b2b4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 10:35:30.2151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNX9XntCdkk4bVRprF2mcaRu0DcndkayDciI6BZs8i/Wg1aVrSGEljN1ugfWEdY6BUhlMYinMowz+1J/eCFIsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6734

On 10.03.2022 11:20, Andrew Cooper wrote:
> On 10/03/2022 09:01, Jan Beulich wrote:
>> On 10.03.2022 09:57, Jan Beulich wrote:
>>> Please point out backports you find missing from the respective staging
>>> branch, but which you consider relevant. One I have queued already, but
>>> which I'd like to put in only once the pending fix to it ("x86: avoid
>>> SORT_BY_INIT_PRIORITY with old GNU ld") has also landed in staging, is
>>>
>>> 4b7fd8153ddf x86: fold sections in final binaries
>> Actually the other one I'm aware of is
>>
>> 7d9589239ec0 x86/CET: Fix S3 resume with shadow stacks active
>>
>> which Andrew promised to provide a suitable backport for.
>=20
> So now XSA-398 is public, I can say what that slightly cryptically meant.
>=20
> The CET S3 fix depends on one of the code rearrangements introduced in
> the CET-IBT work.=C2=A0 We were intending to have CET-IBT backported for =
the
> tuesday embargo (didn't go to plan), after which the S3 fix would be a
> trivial backport to 4.14 and later.

I was indeed wondering. Even if this didn't work out in time, aiui the
plan still is to have that backported (without going the manual annotation
route). Do you expect this to be feasible in time (and not at the last
minute) for 4.16.1?

Jan


