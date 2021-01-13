Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F912F547B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 22:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66766.118726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kznTY-0001QZ-Hq; Wed, 13 Jan 2021 21:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66766.118726; Wed, 13 Jan 2021 21:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kznTY-0001QA-En; Wed, 13 Jan 2021 21:14:44 +0000
Received: by outflank-mailman (input) for mailman id 66766;
 Wed, 13 Jan 2021 21:14:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFkA=GQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kznTW-0001Q1-VL
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 21:14:43 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4714251f-1f0b-41a5-a3c1-0be277920575;
 Wed, 13 Jan 2021 21:14:41 +0000 (UTC)
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
X-Inumbo-ID: 4714251f-1f0b-41a5-a3c1-0be277920575
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610572481;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dD5t94Zwy7EKKfYFM4UIQG3lkeH84WIiAt3rmqWrOzE=;
  b=YGb4Ok9yHgh0zl+2U7kuub0g/AYwmNBtqFGqQyOdgHr76hOWCQQbXPuL
   cVx/ZbyXzNrUNONIG4LHHPoaSFhVaGDT6uCULsmfg0lb75tq3fI/EOv6b
   BqFS/xPXBKeBxVZq59zPGx3LTXNibBq5whXvdw14wQ7dcFWmHb1Q4uxaW
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Kph/OicY9qz5zQJs5oWYIvqr2g7WKjCapJL9CX47EGCVJDLn1DqeOjWiSUp4qYz6ZJ8HSMFcA5
 Z+1+MixX781smbztudr7IGltbcOrfqMxISWdH3vTRNbQuArxJ/tMLUbhlhVSQ8+MwOKea4Uyr+
 ZgEEuVVUybn1IhpOJ4MF0xNMdMRzUQdHwqZ7ehUevWONDDMCGPDUlCanpFEWv7NttMoeMlLwSZ
 mstNysM++zqmFfhkKg4SoTRoodKJkEniVZUQ1pGKcAjdBH22KuKKsmgbaoyWbcRBgvig8LSrfD
 tuM=
X-SBRS: 5.2
X-MesageID: 35410921
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,345,1602561600"; 
   d="scan'208";a="35410921"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFxSFRKfRWVyKgXaw16FZT6nDOeuuc1lih/s5PNinOmZ44VZ2A65H+4E4GQUV6bphuji/cq9CIfrnqRoNTWRSNXJIUSbtQg9FbOUw9FLw9j26RA31RHJrX1kMWTEKUMJj3fMgpopbTcc6gbqv6lbRYxTO0ub7+LLD5mcmW99a8eA/yFwUdpTFcY40sYbl34gIGO/yQTO1FIK7Fg5Lphjy62jOLmebC/F1/rhGH7kfJLwTuhu6D2nm46GTNYTkKyn0hAg4NIdZSSPLj/s2QSwhRtRcR3DpGN7BOf30WtkKwXWVUasfXDshTJDMWVLRbyNahj8nVXnA2uR/9NUojN0tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dD5t94Zwy7EKKfYFM4UIQG3lkeH84WIiAt3rmqWrOzE=;
 b=G1K4glsR8/Tn3idhAzQbE5Tfk1nwPdoFalD6kk6MGo9kQGjWcHffphoDDq9oI5c37v/YnoydmFfVOLjWrh1+92O3AvnJT4y1/xR5roQoEUWxBSaqFDC9B88CklGkzwOxteQyf8FLAkAfe4D+FFqrSb1gHXAWy8Ali4wmEO4Vg63IMHPcA9zULbz4B7pwVb/zp6+uKNiXVW6C89Oq8O4H/2uxx6YKkCNKZUYAXb8KxpVzTc+oy+4fTEK77HKFCRYBJDf8KjbliJCmVdwX6G0gNkZbHzt2Nj1sIq9z7G6JdU6xsVqmSeRAdSkVXueRFhZ/H6QgQIbcGH90s2neXWy8Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dD5t94Zwy7EKKfYFM4UIQG3lkeH84WIiAt3rmqWrOzE=;
 b=L4Nvk/Wi+fmEoBArvwEV9fhkqqO4kgBipTPJrY8uNPJL479lT7kGWzQJH+dCIsEV6eGNc/xEqSUqlbnI2HHj0wmEVQ9QGEXH4EcCUqGuUaycZLre8lbe2RyKHqNr0aIj7Pobqua8UlbpoQy3vUMF34jyTFODI1VXwK9XxdOH9is=
Subject: Re: [PATCH] kconfig: ensure strndup() declaration is visible
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>
References: <5db4e135-16e9-db1d-3e04-c0145f9f39bd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <97e838a5-950d-4a66-6212-4bd87be31877@citrix.com>
Date: Wed, 13 Jan 2021 21:14:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <5db4e135-16e9-db1d-3e04-c0145f9f39bd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0459.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::15) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b391bf75-412b-4a12-a995-08d8b8083c1d
X-MS-TrafficTypeDiagnostic: BY5PR03MB5064:
X-Microsoft-Antispam-PRVS: <BY5PR03MB50645B31AEB27F66E59E7DA5BAA90@BY5PR03MB5064.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sSPPbi8n9AopsH3xA+VgMx1e08QoZTufDdKpFpcG0aX2uq8OYd3wQluS9pbhkuC1MgWNNRQtbLnIyCUGRuRMA16yiOdtOncrKFFbfjzNAN3g9hou9T133kiKhrRdRpCaFl4zPG8XeiOKJ4yiiTpmWz8ah8Hr3upp94NlRE1Hin9nNp7ni5K615BNaCIz/vS4+a4f4JoxIkej6J6Pa73UX/3z+xthiafNyhBZ/EMXnebBT/jkWttbzUdn+UnXW6gWjzcMxicu9Wi2fgE2BvYHwhbquh7Xz6jLYkfWzxStoCdMPU49KGb9EMw3ab810++SXIAPbSq74ntlu1/fYO9HkRceXPk7lCFqtHxnZM/FvIFrwjaQw2D6N7hzic6/z8ZfJv841m8NTnJMkF9wUs5L+kkby2KyFsmDZ7J0xc2z0ynz0dkHbeK6lQSKxMULmeFq4t+Ztab561zCNXJlH5LaSsoV6OsJ7sl4pVEyxE0kpzo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(8676002)(26005)(4326008)(6486002)(5660300002)(2616005)(316002)(110136005)(31696002)(83380400001)(16526019)(478600001)(2906002)(66556008)(6666004)(66476007)(4744005)(53546011)(186003)(36756003)(956004)(86362001)(66946007)(8936002)(31686004)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 1rciB5ENq2dHrcvOJ90DuMbE7Wm4J9DLMcrpyxFWMtK6U9bdGnFzTmm+pPC4dMuXKv4u8ppEERMsLF6tIDQsGBXDMayFo1Q1P92np+VONnXhQ4w/HBQOo1cIHuoZocpe87bHTHAJxjsHQQaPeVLtOIILLE/p5mmepFIIin4juPREipoaUHDm3Z6D8QjWWi49darnpRRU33Kn+K/NV3svp2ueF0uCyXvdxsubtitQqnxwAj5Z5nXEWAupCENh+58wr/sniKMnTkDIm+j7fBJ33JmYu5H7tzXly6zRoNl6E6E0z0bflo21P/QO8OQdOZ/o5IQNcZDtNVnVb8mtle5fMyDIOFXdxzhoC4NYICDFnppvxRQi1Fqii0Snbl/3Y6qaT8XI8ZUxy9R9vClT9ZQbwGsRH1BvT3x6EJaN7ib9zQ9P0QLQ+Ws7HMDrQEdihicBSyLjguqtITo9+llXlnOgJ/8v4WHHUcHs23BFbsgSde/SqDKnFQnf9Vxkn264Jk+4eLyK9k4lXOeRlvJ6P+OEeUZEFYPdd4JmovYZmoQUkvjSAr6u5UdJ8Fvxzrw+2E4eICoAxS3CJ1NvfItd4PaPT74ByQlUaAIuLcD+gcPVKJKWEglVkAAedBJP1h8ZFAbiJIi+LKKYE9v7SRu1cQEFzHdPubZiHGE7/DyZs4pcquIzxM61zvTB5W0vpnNDtb81IhcDJ3B3IPtmyLYHYFwuFogn9GNlKRiwwiovQzlZ2FL8MD9YfP5J3UssADyevc1rHXx4Pnrx0DtonfBDiiJI84HZ3TCiKfMOvZsuz85BlV5IqC+Yp+/Tm38kMhuXCmFqLsD260NcIs7ltigv10uAIga+HB8tqBHe6J8r8pXGPUjzXrSywmni61xJILIGgUyZEzaUhDfQNZbmb3cPW5CtsoLKJxi64duL2WndntKUIJk=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 21:14:37.9921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: b391bf75-412b-4a12-a995-08d8b8083c1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrAWReICwIRvSJ68BSUubZUkJYB9mRJtauX+8eQSsl0cjIoqfyG402ExpcX+Gv3HtQKdyTKswVO8whJMxGZWtwowlJRYpIr/hdotBuZItm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5064
X-OriginatorOrg: citrix.com

On 11/01/2021 14:42, Jan Beulich wrote:
> Its guard was updated such that it is visible by default when POSIX 2008
> was adopted by glibc. It's not visible by default on older glibc.
>
> Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

