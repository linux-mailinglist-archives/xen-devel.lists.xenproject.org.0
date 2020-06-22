Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763AA2035DD
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 13:39:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnKmU-0005d9-Jy; Mon, 22 Jun 2020 11:38:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnKmS-0005d4-FP
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 11:38:28 +0000
X-Inumbo-ID: e28ec146-b47c-11ea-be7b-12813bfff9fa
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e28ec146-b47c-11ea-be7b-12813bfff9fa;
 Mon, 22 Jun 2020 11:38:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGA1KykcibwSxYi4X/rLpz9CTNUq0aoSyBS2pLkDU1+4JN1kOPcdgyUHYozl7BM7bTPZ66To0gE6CjtJ2+eARmgmLJeix7xp1Vm8pCWQG9KdA4VGawQkBAQgM65AyScRg89iqoO2wn4g9NlbOpsvEy4pny5YaCyf5P6hOo68sq8Zb2XoIOiIk22Bjv0vm8Azq2hFtCaVbCvj3aewGhG4sVOQ6W45Ea3pRpVuF2RNib5sH1SMzPUH75IxrE22X1EC8mJ0b1UJem8nmp1wnW8y+D4yLug7TUVwgBYe6EZEeB6wM+zTGiVbqUxJmyWw0KB3fTWKDeTAEZzMSmEfSNDsQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8Cd6J/K4V4jsqO+vKKXl7+fwVhRT2ulpMtyVF9SAro=;
 b=PrVBDXRnULYzWfTbKsC76CEPTaB2vNODuAQtSp1OaxPW3OLkja9hg5X7F8rShT69W1TTDgGEEiZQpZFfvhrKHar+vyFegcHHdsiAc5AvvLkvmdE2Fxrm8UDzWHP9YO29i5e1Q9YTX2ueAlidm+KvyTZIti0VMOYumLjlI+Nluf01yL5WT6ZQ1sFdOWS4ZUkVie4SKO1XWFpymVmjOKEKwes1yC6Duq6QOy4pF6ztOaDeN2BY3kRCsm3gth3xHqNrjrEhnCI3sFh2Zk/EAxpkuUokGANYNBU3YKwOJ4U/0cPzDRq14RB6uEFkkN+PW35aqiPR9fLYEfCvkl3lCzZDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8Cd6J/K4V4jsqO+vKKXl7+fwVhRT2ulpMtyVF9SAro=;
 b=lvORNLSfYwJfIv1N4npzAJk2QUb8H1qx8d3jGfhIZDKk74os8kdU78aiXgfnZnWIVGYoH+2BMeiE7NAnaLRRnFh0SKQDRXZy7xlglb0MUNsXQt12btAvmq5Vn9W4D+5bc58S9/j72dqisoj8L69gk4+/5fvMz+dLBeYF33QcluZpDSmFS+6P0eUIvlrTyiXfXdkVCi8kIDNw3iMTs+gKhSldorE+CQde6Bt6re8DFLAjYh1PJoPZ3pSTdBsZZDQAjY1Fjwxwubwd4K/mNE4eNeLy4bBYQrX/dggG+Kj4RZetD75RQqTIc3ukRnZnKPP7GC8W1B6EzckhvTfz57PcLw==
Authentication-Results: starlab.io; dkim=none (message not signed)
 header.d=none;starlab.io; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3184.eurprd04.prod.outlook.com (2603:10a6:802:9::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 11:38:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::3de3:8e44:3eee:8600%6]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 11:38:24 +0000
Subject: Re: [RFC XEN PATCH 19/23] riscv: Add the lib directory
To: Bobby Eshleman <bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <65b894a039c4097a25a8d0b19e56646574159b14.1579615303.git.bobbyeshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8e76ed4b-6d96-40ad-54bc-4243e6d12915@suse.com>
Date: Mon, 22 Jun 2020 13:38:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <65b894a039c4097a25a8d0b19e56646574159b14.1579615303.git.bobbyeshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0114.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.99] (37.24.206.209) by
 AM0PR06CA0114.eurprd06.prod.outlook.com (2603:10a6:208:ab::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 11:38:24 +0000
X-Originating-IP: [37.24.206.209]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29f86139-1a3a-4a7d-8f5f-08d816a0c61b
X-MS-TrafficTypeDiagnostic: VI1PR04MB3184:
X-Microsoft-Antispam-PRVS: <VI1PR04MB3184FA31E3BBAD668D94F06EB3970@VI1PR04MB3184.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WwzxEIponUsjjxUEVIeXJ0N6yVZj7+f2DSC9WuM63MkEea3wYuAJUbQZmw5dggvxR9RHIfTsVTbp2r5sbTkaBMe4s1ZHL3QvBJru1A28hVCZbSXlfMHPpeJvViq2/6g94U12fGhSOaJ6rYwxx4dBVvMRvwi/fDuH2Fwj9UdJw7Z9blpb8uge0GKzGZ0rNy0OlKHb7nPbEZVyAoxeSJkhzIbYIwT/sfn2etIhW44CIEpEs9cDRupgPyKXi1a7q92hx0DycgqxW1ZelBDjbks1SXtYJe/yUSz9fA4wkkSi5km6hcHm4jx0zBmboDT1ggAbRCc3TuXGpSKbFJi7rVtSjaWZLBuDhl0++Bo04Ac78WjfwqfIlA7/SQvggZ/zLWYX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(136003)(366004)(39860400002)(396003)(376002)(66556008)(54906003)(6916009)(558084003)(5660300002)(66946007)(66476007)(2906002)(31696002)(4326008)(36756003)(86362001)(6486002)(8676002)(956004)(6666004)(7416002)(26005)(16526019)(186003)(53546011)(52116002)(31686004)(16576012)(478600001)(316002)(8936002)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: FGYZr99cA0uW/1CjdKVemzZLn1GddIqRj9jGNkP6UTPgSPLXCkPDoxM4c1LQubX5AvlzUbt4EOOO5ku9Nj+UmWT2rl0Wk7bACB7HTH6lELmS9lGUCe/UqxLx5YrMDayLTCuN1UT7+BACnBqY5RXHOjxx4XoZ4oWMonR8ITG/+TzI1GX2o2E2YOClQ+xaBJdvhB1l751cHaqjAs+aoBqiI2ePv41pfS58tH5clATUaPBvmVjb4s7IpRdqrJtVEFZh53xRM01FmsTNI5LcgEHvdpESjM7T4S34eJsBqDNwpEy5TEOA1Y7F6aO/CRoN69FGAQ916esKKqoKq8phuBm9BXmfjgOO69DduRnuZNYEhTpR5iwoM0Ny9PDscHQyV2+cmHGv+BA+9hLEZV5iF8AOKfJXT9ja2a4EIOxshbbPjWXDrD0xkTGRRuHkJd01eE/H5ac2el3G+9ugrQntOCpuNfMovtlwHZUgeLW6mATOEpo=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f86139-1a3a-4a7d-8f5f-08d816a0c61b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 11:38:24.8018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XbDx04FhF3eOG4xJ0oAnzjq91+H3SVPHcb3raHCAbjpGu3F4DrV/KJU210T0ljJIRaCUe1ta94zzIqoqDKrJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3184
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.01.2020 02:58, Bobby Eshleman wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Add the lib directory with find_next_bit support.
> 
> This was taken from Linux

As was Arm64's - the two definitely would want folding.

Jan

