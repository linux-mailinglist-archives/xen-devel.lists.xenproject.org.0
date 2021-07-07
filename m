Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614543BEA40
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 17:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152356.281484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1956-0003Rj-LU; Wed, 07 Jul 2021 15:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152356.281484; Wed, 07 Jul 2021 15:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1956-0003OE-Gm; Wed, 07 Jul 2021 15:03:20 +0000
Received: by outflank-mailman (input) for mailman id 152356;
 Wed, 07 Jul 2021 15:03:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m1955-0003O5-0A
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 15:03:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75ece05c-df34-11eb-8508-12813bfff9fa;
 Wed, 07 Jul 2021 15:03:18 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-80JDRWLfN7CyG9mwRfNygQ-1;
 Wed, 07 Jul 2021 17:03:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Wed, 7 Jul
 2021 15:03:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 15:03:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0083.eurprd04.prod.outlook.com (2603:10a6:208:be::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 7 Jul 2021 15:03:13 +0000
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
X-Inumbo-ID: 75ece05c-df34-11eb-8508-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625670197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Um7SSxksIO7x1ptRIJN1kMJiYNi1cluHX54IQUjSJ4c=;
	b=H6oBXVvycpITw6eNjh4WAHLuZN8cJi/jxwHai9oTz5XUI+RDRAxI/3esQ0m3wQ6BDA8+MU
	Ub20vDQTjyqAIn+cThgHDmI39AZX7jVSkl7F1D30+sh65HVJJKUXYqfXA+cW9KA2IXTg3w
	ezDStbgjUDGV5LiLNqFJh54Jy22oYfQ=
X-MC-Unique: 80JDRWLfN7CyG9mwRfNygQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lmb+BOUa3q1Xu1nFvXk5nmz+v2yY0Vk5QqVpjdJnYevbPKO/EtUWkwQouhR94OOBfWR3oWzB9UXt9CYhBHPZ9xIS/Pm8Wvs9gI+W8kNAkdiW3LJJDidfZKNc9QpTg45Vb6hClmW0goQa+ckBTSeB0vlw2FGvyjDK7t5bK1fiZ8H5IBm+agj4H41QbXaJ1j+CUHtw0E3lSUbk0llbbAu9xBhPfMkQHOuax/tu570pMFSt1znDxPu8BDZIONoi3sPvewtPFrIudIIMztsYLZEcD5CFm8NCdMVSbOGos/6+jEu6zIfSypkWtP+ugTTJiGziSapy2dAwbADwcwDexV5+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Um7SSxksIO7x1ptRIJN1kMJiYNi1cluHX54IQUjSJ4c=;
 b=O15bh5yw2b1wu4v42HjUZnuij0NCx9ltqlp2z4LmEQM4iF89CsllhPKukY8sNsF24Gr74RA+I/F00mywcWYJrP2HTovcmIxYS2FwnUMgX7zwyDafWvdATJtml/epU9Ypqw9QM+mQdzK8ZlaK8zKo1RA7Hl83Eb/PKH0cWcGI2ulU1fXv1wZhMXIxjSpFoesodcm01wujLEQU3+Mf0pW25gQAXynIYBMk18SI9ff6j4fLIXUM43k6iJW4QBxoSdg0X/gUIQ+dMOKBvz4JwkvFNHxFe214z4+HqY+OSWSNGFY/cZD1/wXBuF29eIzRShE8P++61AKGR9/NWYW7x/L2Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 09/31] build: clean "lib.a"
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-10-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb2c21cc-b801-6d94-5762-7f9e35793998@suse.com>
Date: Wed, 7 Jul 2021 17:03:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-10-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0083.eurprd04.prod.outlook.com
 (2603:10a6:208:be::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aefe260-102e-401f-1a76-08d9415857ed
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703780ECCDE8197B088E5FB8B31A9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cS3yvDHA8b2VEWwaK4Fg00vTKh7XyeSSU+u5F2PWDW3KbilDjmxknlAZUYcB0CZp0tbLa7hNcFK+oBUHHZFIz/7V79aA0handq2C2tg7JLRy7AFcLOQEsKbxBnv+XM1MQoyoOb/x5Y2RMLRoexfz/BftimgoLWG+k5mn+gzNr4lCXxW3fKE/FW476+vcbDu9dIQsjqsNrztVf7B2Zn6ApsQrIf6Qw1+BbVEiQhT/lmCgo86VGZ2V2K2oazKX2yCikwredokHynABhfiynrlweDEzAhB305X4CCgPr8YWMuaM7tUJIzZ8/TeHzABKhVC0FDsGqkKpJLIMpH5Y1UDdvgZ5yNeLJtpsdLI4aWLNrq9x9VcjuvUGni8Dr0a5dBh6ylSkbARvLQn6UXKlPjBJj1e/xrPL6CrSb435TvAZBHNhoFLQIK+pg1YgIyozDhCSWxNbZ6xqaQrij3LJmac9slh8sIOLHQ9oQLNQ+a/t3JtiBvRF/IJucTxVjQcqbwgm/cSj59K7t0h2DRbmIcq9BFpeDFbFx8vA+bx4PxCDgsD1WqlXd+Sw4RxA/veAU2DicSIntHtE85TDrX+GJy6bqy6SjXkOsv8DHdAc2Sy/e/Zx2q/Vj6eYoQAf4MzY5Jh30QcsQVVLXuipkhT+XrRQ4Mhn+Roa9cWLIlDWjD3WpSalkJu/ZR1d4+GhUwCnFl/r/TsFVdXZRIzMahE181ZB0vKw+lXODVYVBTM9dDUbTmE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(366004)(376002)(346002)(39850400004)(4326008)(186003)(36756003)(53546011)(2616005)(6916009)(8676002)(956004)(38100700002)(31696002)(31686004)(5660300002)(66556008)(66946007)(54906003)(6486002)(66476007)(86362001)(8936002)(26005)(4744005)(2906002)(478600001)(16576012)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTI4d09uRTdhb0FBNG96WTdwZHNJZEZKUmROS2tCVXhwUUNqT2lCVURFdDdF?=
 =?utf-8?B?M3ltWDBQTGZFeCs3aDllQmFGS3FKbHMvNHFZbjFrYjgwaDZtTCtXcWdhQ2hs?=
 =?utf-8?B?dzgvR1VTOTR4b0gzTzdWWWw5b2NRZ2k2ckRBRWQrci84dTRZdUltZ21MdUlL?=
 =?utf-8?B?UUVmcFVWVlVHL2NGVWlxc2g2TGxuZnpGQ0p5dHVBVStaNk9ENnBKck5LU1RZ?=
 =?utf-8?B?Z1hlN3p3Q3I2TmtJd0Z6bnJFK3N6UzZMRWlDMG1YZ21EbnZWMDhubDE4Zll0?=
 =?utf-8?B?amVjako5WG1QSjZ4MURiZDdwdzlYZDhnVXpuTUFqcjZKVE02ZmJ2N0I5cnJN?=
 =?utf-8?B?TmZaamRHeFJqOVFZUHJESUZnVzVwU3lSSEs2LytHOUlsdS9JWTU2NFRaOWpZ?=
 =?utf-8?B?WnJ1MHZWU0xleUliZGxoR0oyT0hPbW1Vc09LcHA2bm9OWklVR3YzYjJQQWlT?=
 =?utf-8?B?bzVMdWJnd2E5dGZReUtZL2xQdlZaLzJIcC93T08yWjhIbTkvdVMrRXkwZWI0?=
 =?utf-8?B?SnpQQmU4U05DNExVeWNlN01NVGwwUHdLQkJUdXR0V1hVSWdlRjFod2cyZlIw?=
 =?utf-8?B?N3c1d2lZNjhhZWx0ZVRkUU9ZUm1BQWpHZDJRemRzWEpHcDJtNENPeUxwWUox?=
 =?utf-8?B?UzdvaHRPL3p6NnF1K0tKaUtKYkFNZ2VvUHFrdU5qV2FCMWZheDk4eUdRU1RH?=
 =?utf-8?B?MWNObmZ6OElZcmg3czcrVG1VMzZMV3JwcEE0UXpkUzJMVGpENkg3cmwzZUxl?=
 =?utf-8?B?RUpOSzNoVUdaZVlQOWpWd01Fb1ZyWjdQTWpROXV0eFJhaHpsdVhocmR1VjFm?=
 =?utf-8?B?Y0RVR256bFZ4Z3JUV3psZEtXQ0ZrWWhrVXVBcDB5UHFqMW9QaHZiaEpoVG1n?=
 =?utf-8?B?bi9raUFWMU1jck5iT0pqRE1VS1piL3piVVVCU0xRRTYyUW5oL0llT1pNc3N6?=
 =?utf-8?B?TzAvMmNwY3N3RzQzSWVSbVJzbW9CSkViWDJwL2N6RXVlTDlHa05BK3BLeWcw?=
 =?utf-8?B?bTFZOS9UWEgyUndiSnBUMjBHZk9haHdUSXlRR0o5MkN6QXdNTlB4VmpSMnZ1?=
 =?utf-8?B?Y0VqeXBVS0NtWndEZ09JM01CdDJIemxqWGdJaE93TDBUOUZxSURRRnZSYWc0?=
 =?utf-8?B?Vzh5R2NEUms3QldRV1YwbVQyVCszeUhDb1E5a3UrTXBSK3htUm5FOE9DUEQz?=
 =?utf-8?B?MzZiVXU5RmE0WHdybm5BUkt5d1ZZNlllMmJDYmVicWZOT2s4MzBDNG1MV2hs?=
 =?utf-8?B?ZkpSUmVGV0pmdFNjQXg0UnoyRDYwSWU1amlHWkMwai9uZHFFQW9UK1FOUmo3?=
 =?utf-8?B?TWdNOThWN3lOUWx2M01Gbkd1NldSMFE0N01VcG5ndGtGMmQ1NmtIbWZ5Y0gx?=
 =?utf-8?B?a3BXek9BSkZ5eHBmVWdVN29WNEhxUk5KVWh6VzNSRW5ubURocEQ0M3ZMZkFP?=
 =?utf-8?B?dGdpUjRPQUJ6NXhmcE4wZjBVODU1VTlLZWZUOG8wVDdqdjJteXNWVERsNDds?=
 =?utf-8?B?bWphNHhSdWw3b1RQQytXZ1VUcTFCYy9TVzVXVmhjVzZ5TGtDaFg0NGF4d2dn?=
 =?utf-8?B?ZUdySUY2S2xnWWYvN2lJeVV0TUVwQWNLYmZaYWZsMW0vbkxLWGFLL0dFaUxz?=
 =?utf-8?B?ak9NRWt6UWlBbzBMYnllcDhiSTFwaHE0MVEwTTBOeWZ0VXFCaThVVmNHdEZr?=
 =?utf-8?B?M3ZqVmVKbjNnUGVGMVV6UzU4RUJLWHVQZXVhSXNObThlcjJ5NWJCcXJaZjRu?=
 =?utf-8?Q?id7jiJlb1OAGlMsYE9UapHwXbm9wtlfgestpMFH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aefe260-102e-401f-1a76-08d9415857ed
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 15:03:13.9009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+tJYOmSb+3NOFm0RSAzJcvtV0DQ/vNo/3K17E7u+ukHVK7tbSwDY3B4LE95UqWI9zXsu55kd+VWKKzGSGGy3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 01.07.2021 16:09, Anthony PERARD wrote:
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Hmm, I was clearly under the impression (or at least assuming)
that $(targets) would be included in what gets cleaned by the
general rule. But it looks I was wrong with this:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


