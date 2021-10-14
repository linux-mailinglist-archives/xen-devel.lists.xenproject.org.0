Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E0642D633
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 11:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209188.365568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxAL-0003rU-1L; Thu, 14 Oct 2021 09:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209188.365568; Thu, 14 Oct 2021 09:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxAK-0003pS-Ro; Thu, 14 Oct 2021 09:36:44 +0000
Received: by outflank-mailman (input) for mailman id 209188;
 Thu, 14 Oct 2021 09:36:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maxAJ-0003pH-HX
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 09:36:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c9f9cb9-2cd2-11ec-81b8-12813bfff9fa;
 Thu, 14 Oct 2021 09:36:42 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-1FgFa47IOaOpFTv1HxVXtA-1; Thu, 14 Oct 2021 11:36:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 09:36:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 09:36:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0105.eurprd04.prod.outlook.com (2603:10a6:20b:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 09:36:36 +0000
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
X-Inumbo-ID: 3c9f9cb9-2cd2-11ec-81b8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634204201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JpEfSN4rLnshqbeqpiXp5hdq02H1BC/zqMK216bXNMc=;
	b=RAqOKPiufecFbwD7CqnY96IQ59HO/hS3hGPIp3LnmHRxILHIB0haH+Wcz9dEZxROq6/it/
	KeXTmIHYrywn0AfhzOt777l4v6BI9eku2jZdkkhgf38I1XaC3OAk1laD0blb/1YrBM7qf9
	dn0zVQEzwoMksZSON3U64gLIByE7+8o=
X-MC-Unique: 1FgFa47IOaOpFTv1HxVXtA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gItKd5CCWtfafsvGuTyW9UvtAXXvxnec/xVjTI/AwlvyDXTU+RSfkKt6dZjI/Ue1OvrgsgGgeoL7pSbRbCVleyCMtbGMu/SS8wuXmZlnhlWGXSjePT2gGEBnwLrnvPyGYJ7TumqW9xGXsElX38Tvzxp8hdhT7CslitQB6LQ+jsDaytm/EEsCqfaGUKruyH////NmgT6PqcCO1ob9mDMh03YJjfwRY7kYKzCLNhjZpMuY9Aal9DffCKzcuL0lkmPVzfewzk7mBOWHk0Vw89I9PaGgLLKM7Gkr/ghsQUnZJ4F8mF51iwseKFD1wgZteCs1IYiQ334zdMqgtAEo3q5E/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpEfSN4rLnshqbeqpiXp5hdq02H1BC/zqMK216bXNMc=;
 b=EiyR/yEKrtBw89a4opO4H/3zQ25uT7RBV7mv4bwAvkZKSl0X+IqNOnz4ij5jJsVDN5F6XuSeMhqfzFKztTFUreTFYv4iUPi1f//qfQoF/B7Alw43p2uD+Jl4XrRZSgI+qoQL5mse2QB5J/V2K9QQjM6YprHZGvtXsty9lQegRoQi8ns99topfy/Ql9Q6thfTmxp750dO+IyKo7LmBlqlRtGvnqfTp8Zrc+pCqDlrIYdL5WRn+leKmg/bzMnzpCqT+1U/6UWfofqg6u4xFCcD4xPX4TRSfslmNnMcUr3ZrfnNHGAC1Wy/uHp90n3vJ1L0ooxbz0SNDBUwoa5nyL4CHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 46/51] build: replace $(BASEDIR) by $(srctree)
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-47-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <84ab3325-3615-f4e2-1151-7b1ce96716cb@suse.com>
Date: Thu, 14 Oct 2021 11:36:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-47-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0105.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e9f1268-a6a3-4b2d-5e18-08d98ef61e20
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165B1015D7D0482B3110DC6B3B89@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Li2s9vAqrHkxbOW8pcV0oS6zs6DDTzmWgcEkUCRfACJgulJWAVhf1hQa0g+GY9F8TwjrEYGJrRKEULEQpCPsm5ixsAHCiRx/+Rf4XcLmFb/aeV5/N+zeZQ0dFULnI6wo5oFqFQFPweZwTgQKlPBTkPyhQHPhJpGG3OXs9kF9aNfykmc+TCjM9QAxMw3GdMaEIr0FGJ9T1VMqRl+QOKx0mv1/dEv1CcKzkNt2A3JSo7oAbG8h6FQc5D6qWpISP5Ra2Sp3TP3d8cNIPPD2a+tiyR/UjYkCRrhlcTqtqp+IF21PY/dRgA4rPqPlHoI+Mu23drvMmjXRW4ffX06tg/CbyEabzzht5Lt3Xg0OBNfyrbrWSYwMkHVK4GFn8GqmAS9Im8OUDMIXoYuKmdkcJhuww07z/0Fk997tMhENzFO7Wvz6A86jHVjs6IH7vAsrczQUAj4Js+wSoBXYQwwzEjMBDQg5LpQTYkAJPXuRFb9rVfqalsKaVlFKULiifwjqdPNXj+0HEtrE4pHIUgIe1k7ym6+KXfznXXlLQGfllR1sOIE4dLRjiYWv36s5fzJHbzu5+DK5jSEerCeYbICt3Dbw/cDPEjHVo4MXc5IcwGrJVhtCBGlZ43QIvuRjCVQ8qhoy6CjQijHqepJYN4WYj/itTdI82Oeiy7wazqPCJHsO7sCaTpKSyGaBWESTvPDiC285QOS2ll/h8grxIOlbIRC1iBW0doRt8of26tS0vEdBWrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(31696002)(31686004)(86362001)(8936002)(4326008)(508600001)(26005)(53546011)(6916009)(186003)(956004)(2616005)(2906002)(54906003)(5660300002)(16576012)(316002)(4744005)(8676002)(66556008)(7416002)(66476007)(66946007)(36756003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXFtdlhGSUxMVFlPUFpKTVJ6QVh6UENXeTVCT0R1b2Ftb3ZqblJxTVBXMGZF?=
 =?utf-8?B?eXRXY05MQkNnNzZ5UUhPK2FuTHJ3TDRlKzFpN21oK3FWbmVFYTBvZVlNUmda?=
 =?utf-8?B?bXlBZHlwNE1wYWtrb2g2M3dxaXRVNTZZeVJBUldNVnFMTmE2UWpQUGtOYmdR?=
 =?utf-8?B?M3ZkcmNzc1RiYWliRmhad01PT3hRWVNpVnArWWtKa0ZuTkt5ZGtwM2lZUEtU?=
 =?utf-8?B?L0dVQ2Y2MEZzRzZlR1NQSlMraDNaMnZUU0p4a3ZnL1FsVjdxNUhFeEtNeitO?=
 =?utf-8?B?VW1qckZkRVZaUFNZQnlMMHVjTzVVWWluLzBzbWFRdTRudEFwaFFlYmdkT3o0?=
 =?utf-8?B?TnRMT2RDc1NBaUVrZit3RXdldU00bUFJOXFzam1KWkdJa1EwdjBsMXRvZFpx?=
 =?utf-8?B?WW5XSU9WTS9PNFlKbGlpeVJBdlhIazZ2N1hvQi9LQnZpZHBYRE1rREgxSTk2?=
 =?utf-8?B?ckkwZHlJN01Ha2poUXQ3QW53OGVsT21wYUFBNDZJNFhwbGFTd2pnY3JmRHZa?=
 =?utf-8?B?RzBBNVcvRU1jZkdvalplZ2lVODBOVlUvRWFZbmhzVlFGRHlLVmF4QjFISDdU?=
 =?utf-8?B?WktNR3FoNk5qRzV0UlJtYzB2cFA0VjNnTHltd3puL21VU1pRMWFrUlhOWUth?=
 =?utf-8?B?OVZsUGNnZGpZOTc2T0h5WW9EYWNqQno0eE84d25HNzk4aFExOHFKU2FmOXZL?=
 =?utf-8?B?S044bnMxcElxaVIxdXQzR2dyT3lhVkF1NlU2d1RjeWFMay9TUkxZRlpKUGZ4?=
 =?utf-8?B?blFrczYwMGpqN3JjZkk5cmwrU3ZCcVhSWTRJZ2VoYk5PYUF4bS9RSDVCUE1P?=
 =?utf-8?B?MlFyVFdsWE9VczZuWkV5NjY2MFUyNUkzWjI3ZXdEQjF4RTF4RVFBWHdscXFC?=
 =?utf-8?B?RWJwejFoc0dyNzFmS0plTy8zRTBYTUFKdEF5Y25yZ2VTRitBSjIwMW1xTml5?=
 =?utf-8?B?Z1RFRzZYYmFDSzN3M2xpN2g2Q1J3cm5XV0pWQ2NkUTJGNnByczFIOXFnVDJV?=
 =?utf-8?B?MFRVc0NCK3hOZWZLeTNiZ0dIeE9QMS9WRFRyUWtRSkxhMzdGdllrR0ZRRjB0?=
 =?utf-8?B?cmZtUEc0eXdPekZMYTZQaitzUjI1R2gwWTdQSEhzOTRleEh1bXNVNjZuT21z?=
 =?utf-8?B?UGZhS2tzdytEeUdVUmlZV0RBK0hlZHd3MWFzdnMyL1ZiaWhBdzhMU0wzL0tF?=
 =?utf-8?B?WDVDV25FcnpJWVhLRWUxYkx0Um8yV0FRNHVjSC9pVmxOSXlMV2VEd21KS01F?=
 =?utf-8?B?dDVaNzRWTTkrckE1eEM3WFlzNjlqTVRCSXBkQUoyNDMrZGZ4N2N2bU5jWCtF?=
 =?utf-8?B?WTZndmlkZkxBajN1WG51a085MlV1c2NJNmN4NEtGdnhURTdSYjFNd3lRcVZD?=
 =?utf-8?B?Q2FuTzR4VmdBVHVSbm14OHpScUVuaXM5Qm1COHdqTzJpOE1lU255QlZ3SDZo?=
 =?utf-8?B?QjBqMDgyWFB1VnZUMmZXSFZsb2UxZE94ckhwRXp3cWx0QTJUclZpVU8yUW5H?=
 =?utf-8?B?NFltZW1EVGFoeTEyR2hMTmhORllyRDJoODdpNU5RYWlDcFgxNDFkZnhUazA5?=
 =?utf-8?B?TFcvbHBZUDBoRGxURVVEakpDMjF5T2h3aC9ybVF0Rmp5SWRucXN1T1NMTW03?=
 =?utf-8?B?UytKLytDamcrcytQQnFNdkNMVFhCYjNTRzdsWGxvQWIwWTY5c0x2dUZQTnlH?=
 =?utf-8?B?QW14NGJoZjQyK2YyanVJV0tGeDlRckRFNVdPZVNTNWtzbWpBRkhvL0NlZDMr?=
 =?utf-8?Q?dYaydbEM8oauoX03po0EiK1RQsRjT58rTv4TmLC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9f1268-a6a3-4b2d-5e18-08d98ef61e20
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 09:36:36.9521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/Uv4ukOJz3mTqwUkhudoAxY/Z3rVetznVWfaGi2ZOxPoGxQSXnA0x/rpEU0DgsrNLbkRVPh2NfFatxvdszk5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 24.08.2021 12:50, Anthony PERARD wrote:
> $(srctree) is a better description for the source directory than
> $(BASEDIR) that has been used for both source and build directory
> (which where the same).
> 
> "clean" is still changing directory, so we need to use absolute path
> for it.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'm curious though why this was split from patch 44. It doesn't look
to me as if patch 45 would have changed anything that's related here.

Jan


