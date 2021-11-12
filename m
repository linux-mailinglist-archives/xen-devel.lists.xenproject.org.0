Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D6144E4B3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 11:35:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225134.388822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTuI-0001Ib-PQ; Fri, 12 Nov 2021 10:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225134.388822; Fri, 12 Nov 2021 10:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTuI-0001Gl-LZ; Fri, 12 Nov 2021 10:35:42 +0000
Received: by outflank-mailman (input) for mailman id 225134;
 Fri, 12 Nov 2021 10:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTuH-0001Gf-5S
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 10:35:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47b97679-43a4-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 11:35:40 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-9Z2bPb42MLK0ePcbrXD0fg-1;
 Fri, 12 Nov 2021 11:35:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Fri, 12 Nov
 2021 10:35:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 10:35:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0383.eurprd06.prod.outlook.com (2603:10a6:20b:460::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Fri, 12 Nov 2021 10:35:37 +0000
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
X-Inumbo-ID: 47b97679-43a4-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636713339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XG3qY1iaoPl8VMHGNUgx/ML8ri1nTSSSlBsBMk+pyr0=;
	b=WCCYaoHyswdWM26g0hwHt73ZvUvidcJiOfmmjLhg2tdy5cHiMk32JvqrdyD+zqqelyMpFC
	98TNAEvli23aVKPiPHF6wQY6CBnbuYDSguW+6tWKMDv7A+fHOjIKmKPiOAwmwoTqYXwe7V
	CBQv2ctuKqigHYn5g06eIY2Bob7eg1M=
X-MC-Unique: 9Z2bPb42MLK0ePcbrXD0fg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MA9TqMN0soGT7hxPOgssPi0u9NNIR5aAFSSND8axZjGteBTINp2/Dm9qiAUWfpFpZgFGmnp9jTHPVgmAXNvmXMMG9wnzZvn7zXM63j+ZjaMjUl3uaNGIZxBaE2iFkhsoRffplKX0DoGQXSe1gfoDewNBJN7/EUYPlMuHzYqQ4HT4DiEkvG0BAC56NC6ppGZvSEk5P/9GPEmMB3XhqK+r7ZxDdJcpbtHumypQDgJed3DQ4bsWHqoBEQXB+82FbtMRWB/dgzd7Ci/tRUsBIO2ILnRegBuJezLx2pumOCtlMAQhHNUFQZu8dQv5/cB4uONb8tkegQdDspTZ0XX3LQukUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XG3qY1iaoPl8VMHGNUgx/ML8ri1nTSSSlBsBMk+pyr0=;
 b=Tm45uUiUUWFTi9ArowLmBSbNeJ2I9/qhLMJ1on03V6SwtDelYAjjQu/mMyIEZamfEqHym2KKY3ri7wStPNxIdddyN9Y3HGnO02LlBj68tgyLfwo8FMXsPfRwSB/JdTYIv8BZW+8izkVB3f1BHxZ01e9/z0KgnTytR+mbs7sn1P2y/cGm0EBVFJwoOR54osRT+SDnFVLnufHWB6NQ/TN+fzOyW5EIGMzKCU6LoZAtcjZMwT0K5xV4uDhoL6g1e8/L2gUNAwgXV6W+FfNr3It/++SGfat8jUMxRhbxKdMQOo8f4UHMSF7fEj30PeqxlFenPs4NFZieW0CqEg946tKXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ff41dec2-80a7-f1b1-8913-ee23e88174bb@suse.com>
Date: Fri, 12 Nov 2021 11:35:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/5] xen/wait: Remove indirect jump
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211111175740.23480-1-andrew.cooper3@citrix.com>
 <20211111175740.23480-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211111175740.23480-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0383.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d57f1f4-8b77-4199-eee1-08d9a5c82a77
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB704055993E3C05826AEBC67CB3959@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TBhx3X8NBdbhR5yUEjh+5uUZ3SQ50cfufrqIbD+okS4MmnOLiPNsLuX16zvCyO79m6zq3YEjXvAgyX/TSYvmUlBQNYtiiBXI+y12enn8sVZpIN6oxbhCKa2I9mESIK96A2YQN0a7zzA51k8tzUC5MYlSgB0jqfOAGEllukIE27JTdsYxJ2LNsDteVOurLFdBxS6F2F6KNbfnRbBB4PYuSE4sp+mtDKh3wOP8YcV70YwCU3ZMUBBnJ0TQgXUwQVB0BS2+wPggPOTFz6g3ivHUfvDvrtdYc6P+kfLXV+9TzjtiQbB0Za2eAOmVMWl+XU6Eq/wIRcRs8JN10p8ACAF9JFpJEii+zk+PGpY9uFoN1nprF9fo7JIZfkuEFk5BWKFTQvbr8c8MjILAFWF/Hkk/FVgYWrs8Lx6sYDeh9UKdA7wikfHkOTS6InWO2pUjNz2juoRTs2b+40I5ZYzxLc349f8JVGkxwciovD9nwQk4Amn1aC+RelfZ8mrWIeYJf7TFKZVeA/K7oiZPA+qy7SpbSz4emBp7eQgKnSMJ1wg45YVlV39jPRSF6E6Smjwm130slBkkp1cGaxB4s5ms3CWFJG5cJVIGvQXZhDRRS/ulmbTg5ocBvlYZb5ZFer30oc1Qb+HnixVkepH+2owu9wO4HmKbZjuLTXZ1uhrwRdEssLcRy7oDtD7uQyfNTOXyQRP93DQ6g2H7pxDlJWJ64bg8MFUGw97MaKgjDZ14Yfs18Mc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(186003)(2616005)(26005)(508600001)(38100700002)(36756003)(66476007)(66946007)(6486002)(4744005)(8936002)(86362001)(4326008)(2906002)(66556008)(6916009)(53546011)(316002)(5660300002)(54906003)(16576012)(8676002)(31696002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnNhczNwNlNUMEhhZ1hGaU9vZ2tMQVZrVWtoWkpsZWdwQ2JieURsTUJXTXRK?=
 =?utf-8?B?SzJpT0xsZDhBYVkyZEhlb3piWG8wYmhaUS85bm0yNVllTGJ6dE9DbjNWV3R5?=
 =?utf-8?B?cW9HSk41ZjZ2VXRvT0Eza0F5VE9TR1ZSbGFPT2p4WE5wVkVvMWxyd3pOcnQ5?=
 =?utf-8?B?VUlLMmxXTFB4UDg1cHM5cm1WV3FZWURXQWlIUmRjSGZ0TlY2eVFibGtNaklB?=
 =?utf-8?B?Q3doNzFCKzYvUFB0QVRoby9iSnc1Yk1lUW4yRG5nSlE0YTZ0bXBTVHJsNWdG?=
 =?utf-8?B?QXFQdERBSFludHRqQ3d4TXg1TENyMjBnd1RlMWlJQ2hPaGlKb3p5TC9ob0Jv?=
 =?utf-8?B?M2M2UWNacXhzQkVQZTN1QnpxMWZkSFRzQ2F1UTlvSmdEVHhZWTNDcXdraVBq?=
 =?utf-8?B?QWVjTE1ZNGFpSlhPb0Y3VXZqTWl1MkRNZ2I5UXp5V25TTnNBUGhzSkV0UGQ5?=
 =?utf-8?B?cWYrTjl1ZEd1d2t1VXIvT2ZZRlJId2EvWndXN3Z2dE5YNU1mUTdpQVZ3YXdy?=
 =?utf-8?B?bXBqWXhFYzRkU0ZsZ2F5UkxRa0QyYUsyazVKcDRiQ0Z2SzNudmErdFkyd0tP?=
 =?utf-8?B?MU0zWk9VanNkRzlNSEJBZlVSVUdnbUdjaFFPVXUwV1VucDgvekZzTWgxd2Zy?=
 =?utf-8?B?bS9HcGNONS9CQjlNZDhNM2k2RkFmRWd1U2l1ZDVPZ2FDSnNtV0ZmcTZRVWQ5?=
 =?utf-8?B?OU9NZmd1STdIdExnUElka3JwWmdwVDBRRm5JTXdLMzZsK0Vrc2kvVGNYUzVW?=
 =?utf-8?B?WWJXY3pSZGlhbkFpN3BqaHpmZkM3N25lNEhmbGlsQldCZm0rTGYxNWN1SEVj?=
 =?utf-8?B?cDNsNE1nSEwrd3NrQWdDdVdGaThjSHMxVGs3MWg1a0Z4VStybVpBQ3JSRnBz?=
 =?utf-8?B?ZVVNcE84ODRjUnc5QlR2SElzWHJubDZQOGFWWGxzYlcyVTcrQkFUZ2ZObkJJ?=
 =?utf-8?B?bVdwNUNaVjZhQkdxdWU1Sy96NnI4WFNhTVVONXVkNTArY05KMjhVQTdsLzAr?=
 =?utf-8?B?STFGaldqSFZhNkFhbXNJYWhhZjRuMVZLNnB3SzlFQkt5dXZZZit6VTZlTDJv?=
 =?utf-8?B?eFFZUVpueGxBTkhKNHFjdmQ2Tk42L09VVGpaWFQrdXlHcmN2ZUYwak9mb284?=
 =?utf-8?B?SFBhVFpiWGlVZGVDbHZVQ0Q2V1pqbGlyUDRsdENsVEhUNldaU3hqenVISkZn?=
 =?utf-8?B?bE02UGVRVWw0L0xHU0pMeWxNejUwSXZMT0xTWGdjZERXZDNVZVhVT1A3bmRx?=
 =?utf-8?B?TkRiUXB6NnhkcmlQRHp0UTF5NzA0VFY3RGFWWTBmZURzbWk1VTdHVjBIMHFG?=
 =?utf-8?B?M29uNjB6a1FYMnVLUTV3d2lkNklYdERYWkFiSm9iaW41LzAvSUswbjZDaW0w?=
 =?utf-8?B?NGRXWFdmcEg1ZFdkZHN5VUg4TWVWRW5acTRuVUcyNTE0ZUpidDFGWEZUS08v?=
 =?utf-8?B?blZ0SVlQS25ETk14R3pGckZPTVVrUUM3OVhvaU1RL2I1ZDkxK05xRUZOL2Ev?=
 =?utf-8?B?dFdkeUc3OHFMM2oxWkxwbmdhUWtMWUk3eWxhR3ZtRXA0ZVpMTjBlZmlCOVhu?=
 =?utf-8?B?a1pxRnh3SGpVdVE2b1lBK25xbnkzMHBwU0IvNlBLV2cxRWpnckNNb1NpeVA3?=
 =?utf-8?B?V0JDdmtsZFYreU0vMTQxUCs4c3ZNN09ZdEJxdmwzTkJDS2Z1K05wUUdTZWRo?=
 =?utf-8?B?WHQ4dkkxczZ3TEhRVDIwZnBVS0JvMzRORWZqUUxUYTRheWR4bHYyNVVKL2Zv?=
 =?utf-8?B?K0djUDhlRHlob09xalJXTHBORHJzekhKbVc4aTRpY0MwQ2NDSE40Vzlsc0h2?=
 =?utf-8?B?dmF3Ymk1RWhqcVlvN3MwT1BMbE5kdXRjMWFzMnl2RVhSS2VmU0o5YW5EYThX?=
 =?utf-8?B?aW00eFBCK0pvYVNtTFNaWjRKak00dEJ5RCtIdlRqTGU0MzBwR1l6czQzZSt5?=
 =?utf-8?B?MTYwdTJyZnpNQXpBMWVCeFlPODBJNnZydlpPMkt4T1JNUldZdFNrN01uRmJP?=
 =?utf-8?B?MDNmUHdhL0h2NE1DSHpRYk9SSjZCc0MzTGVwYm8xRlVoVE5HOStYejNFdFZR?=
 =?utf-8?B?ajZJVTk5ZVlsdGZOZFprSzR4ZDN5WkEwdHpXTHl2ckdqK3M2TmpXcjhMbVdK?=
 =?utf-8?B?ekJYV215Zm9sN2d4ZlJTVVVBL2duK2V5VmVNL2xCdU00TU12ZFE1aEdLam5S?=
 =?utf-8?Q?4m+2xp1Z4RE2C5eSjgOa8/A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d57f1f4-8b77-4199-eee1-08d9a5c82a77
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 10:35:37.5760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8ixqONDHS1WQ0JOYzkYE2/M1nGH8L7TGR2bW1WOjHQxwGPxPWDet8nh+MtJXgfZfALYisNlZ5ehDs7judCK0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 11.11.2021 18:57, Andrew Cooper wrote:
> There is no need for this to be an indirect jump at all.  Execution always
> returns to a specific location, so use a direct jump instead.
> 
> Use a named label for the jump.  As both 1 and 2 have disappeared as labels,
> rename 3 to skip to better describe its purpose.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


