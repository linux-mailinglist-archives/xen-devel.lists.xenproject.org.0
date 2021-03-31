Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F4035060F
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 20:13:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104036.198546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRfKE-0006u9-A1; Wed, 31 Mar 2021 18:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104036.198546; Wed, 31 Mar 2021 18:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRfKE-0006tk-6c; Wed, 31 Mar 2021 18:12:18 +0000
Received: by outflank-mailman (input) for mailman id 104036;
 Wed, 31 Mar 2021 18:12:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7d7x=I5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRfKC-0006tf-Jv
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 18:12:16 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76e4dc11-0d39-42a6-a0ba-7000beba1a97;
 Wed, 31 Mar 2021 18:12:15 +0000 (UTC)
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
X-Inumbo-ID: 76e4dc11-0d39-42a6-a0ba-7000beba1a97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617214334;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S75VCIDzg9DLy89De3wL8GHe5A3GMvEHgcvxZBLGdHw=;
  b=fktpfX1fsq7eGHD5D1Bcx/ek/EDMaT6k4zWsulnaU+fm/is79fjMXW4R
   UyU6eQ/lk/Bjk0yq2tw6gAO1I7PVo8n9ERHCaTkkniC7DvednZ3XNZxYU
   Pwm/Uy4pFYTAhqbWnD57JLBsCMaNcqYga80zcHfjGQK5qoAU0VBQEMlZr
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s/Y7P3PHJJoRkPhPDvDvuI15fC1QmnwBE94pMPyHrMuTbM3/4oKVrySjn6Srmo8sNL5lrX97qz
 Wuv1adJVFsgYyFjDd8WRJxq4kNYo78ZYfuPCbfFwCZTItdY6K/rnP8ZvJ5ec3L0AMd/UkeAYw4
 egaiWHh0wvTBIod76wlSy280iRIBDkO88d/7p1Sn5pGBKdTuPm/SUFFyXVyRA4OR+tuUC4QOZi
 qt2W9S8L+YgY8SIiPBHeXJ818DMGevHIlGZPn6gYvY2lOvGa7O1fPcVgrIQp5p5V+wTyK6H9jM
 5YU=
X-SBRS: 5.2
X-MesageID: 40595913
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:J5wVjalmKOtZaLBPnXZ2GoYp2PvpDfOFj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLNxAZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 ldWoBEIpnLAVB+5PyU3CCRGdwt2cTC1aiui/vXwXsFd3ARV4hL6QBlBgGHVmh/QwdbDZQ0fa
 Dsm/ZvjTymZHgRc4CHFmAINtKz6+HjubDHRVo9BxAh4BSTlj/A0t7HOjWRwxt2aUI2/Z4M6m
 7A+jaJg5mLl9Ge5lvi23TI75JQ8eGRhedrIMCXkMAaJnHNp2+TFf9ccoaPtjw0v+2jgWxC+L
 KnzntQXLUQ11rqYmq3rRHxsjOQtwoG1n74xVeUxVvlrMDpLQhKcvZpuINDfhPVr3cnpdF3uZ
 g7uV6xipw/N2KloA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJ8Cv47bWzHwbFiNN
 MrINDX5f5Qf1/fRWvepHNTzNulWWl2NguaQ3IFptee31Ft7TFE5npd4PZasmYL9Zo7RZUBzf
 /DKL5UmLZHSdJTSq5hGuEbQ4+SBnbWSRzBdEKeSG6XVJ0vCjbokdra8b817OaldNgj150pgq
 nMV1teqCo8YETrBcqS3IBa8xzETWmnNA6diP121txcgPnRVbDrOSqMRBQFiM27ucgSBcXdRr
 KyNfttcrreBFqrPbwM8xz1WpFUJ3VbetYSoMwHV1WHpd+OLoXrs+fcYevCPbaFK0dhZkrPRl
 84GBTjLsRJ6U6mHlXihgLKZn/rckvjuZRqEKbb+OAXwJMXNpJFtxUUjVjR3LDJFRRy9ogNOG
 duKrLula224UOs+3zT0mlvMh1BSlpO7K74SHNMrw8SO0byebIO0u/vPlx67T+iHFtSXsnWGA
 lQqxBL4qqxNYWX3j1nIcmgKHimg3wao2+qQ58QlraY39rsfoo1A/8dKepMPDSOMyYwuA5x7E
 9fdQcPRybkZ0/ToJTgqKZROcbyWJ1XhhyxLctdtHTF3H/s2v0Hdz88RD6hUcmenAA0YSFb72
 cBqpM3sf6nhSulL3c5jaAeNlBBAV7nW45uPUCieJhenKztdUVLaVqywRaeix01ZwPRhh0vr2
 T8MCyZfuzKCFJBunZelr3n6k9wa3/1RTMAVllnq4FnUWzJtnFvuNX7GJabwi+fbEAPzfoaNy
 yAaTwOIhl2z9TyzxKNni2efE9WjKkGL6jYDL45davU1W7oIIqUlbseF/s8xucsCPn+9usKW/
 mYYQmbMXfxDP4owRWcojIgNDNvoHcp1fPu1xuN1hny4FcvRf7TKk9hXbcVPpWV6HXlXe+B1N
 Fhls0u1NHARVnZe5qD0+XafjRDIhTcrSq/SPwps4ldueY3uKFoF5fWXDPU3Bh8rVgDBdaxkF
 lbTLVw4bjHNIMqZcAUdi5D9lcildiELiIQw0XLK/57eUtog27QPtuP7baNtKEmBVeZohDsfV
 aY6C9Q8p7+Ll++/K9fD7h1J2tYaEIxsis/uOyDcpDdEwWseaVI+kGgPnq0bb9aT+yEFNwr32
 RHysDNm/XScSzynB3Ut398JKlF9m68W8O8AA6WA4dzgqqHEEXJhrHv+dK5iTf8VCCyZEsZj5
 BUbEB4VLUxthAyyIksljWoQqP5okg5g0JT7DFumFnqwJWn6g7gbDR7GBychI5XUzlVOmWJis
 qA8fHw7gWM3AR4
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40595913"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyvPJizSFtmCUEhLaV9gUEoY8Mag9i0s+/nzaJL2eacPbh5jSwOrDXudv+ibbk9Kz4cSRiHBY1ElDZT4hA1ycMLnNr3W4JjTRcunx6kMEVqr+TP5RtxbKfb9Lq21+eUfdYpO5WdDFuuw5eIGyQJQ71qfOlgCsSYUuK6AiMEr8f4KLC5s5PEku6h29VT9FowOPPS9kzG03XEZM2kDB6iR1g+jOSU+F73bRO7innya+sHRmrK17XpIqq7uQWOhdp73cBA8XVYEXNqTAQHEheR0EGWPX7KsUw6eswcIZNzGmbJ4ivCgNNnoUROWRMgFTDNySTKy1ubi8UPc34eT1+AotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqJ82BC8tToa5rQwqn4fcXS2D7dcS2uhCCHczhIgWUc=;
 b=f4Q21wwW+6+/gdV6piNFBLi7CJW/f5PSG2C5EYbWQRHGKAESUFRA4nQUOMnK2sJOz6f1ZKuOyw6zy/t8wCSMylsdGYStl+gZf+H0pOxfjKTJM2Ut+v8RNtrNPxT6iL5ohwROj4uu/RXY6srlao2faCdZY49fJ2vP16Ma15X0bxMDvvpvlL3wdzImk0ggLln7Mz5ke7Jq394Dh7P7R9o4HqCMiZbItzNySvxSUj89QDFR/MCiSUtPYGAss6lTj7xjq/9T0muPyWBouYVWiL5LS5fMzp/+fLHCj6LyshPd7rFZHHhJB0ZjBxAnJbV1ZWUAa1McBmvf2wlrWnsp8XwXRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqJ82BC8tToa5rQwqn4fcXS2D7dcS2uhCCHczhIgWUc=;
 b=A/l2tcnUgE4LDr44Qw3RaXCx5CEAd3aN6QEHVzWsWlXOPkKd6CUSGM7QqekPbC9HYsrkoP2BNGZ6Q8rif4p8Z2mS+r1l50QuztB9JMmxcVso3PGl6bRJYiHqF6jwNB3DojqEsiMRFdagXs9Z6E7I9lpXiljdpmaayk8V+owoMso=
Subject: Re: [PATCH 01/21] libxl: don't ignore the return value from
 xc_cpuid_apply_policy
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-2-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <02dd3e4b-a5a1-dbdb-e887-bf0cdf1132e8@citrix.com>
Date: Wed, 31 Mar 2021 19:12:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0452.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::32) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c823477-ad5b-4e7a-5c9b-08d8f470809b
X-MS-TrafficTypeDiagnostic: BN9PR03MB6025:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR03MB6025F8FA5B167E6FB2EDB583BA7C9@BN9PR03MB6025.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i8xfE48n4dntbLnfKReTG4gfP/WYZQDRECyFjB5IKhyezkzvIngijIqQeY6V1WzpGSz/vIADch4vAZiOF4IlYrhAjUEGWkOsnhe2BYxtKshtwopw0pUbA3bYBPUO4zC9tlwnb7nyYDLz7KCZ/Hckqn65Fws2TnbSjkAZAajbErK3i1A01xV0rFv31yUdnyUNVwe+CyQ8Mt1ouRIZRf1RrYFLaBvmTQjd3O5PusrRGD6bV/4UNLDfyyNDUoLxm/QbJxyb1peAavBKt0oJVtrwsr9CXEM5ElQPcxMTwUAf2vck2sEFgoTArFF1kY2+u8tJbuIsduY3DUGSjZKl88+NOo7It+QyENcKo92xaM1nlscLt+/G8yMZPguJulrdqFbPt9EnXgYJeFTOWwAXVHGfyzNVeRYpuU9C0y8h2xBTm5a86oBP3e/q7ktsiJX8CmHm43JUDmgSY6QtoOTRb8MZCMj5oe7Pn78v8U/lz1xPNjv6bApWiosq2ZwScWskmLMPSH0qfIcwbnQAnf+YlqO74t1s7sa140ErVlfbjw87K+fQszH/szoBsuMr28PJiQkJK/VhMU7UkU5kt1HL3pCWHjs6JMtR0gqSFol75KQJFocOqTVVfi3y3y1i95SMOIPYMooZQgmL+PwEVFCp/HibqEGk0gZR7zEZmpqvPQO849LxAtjOumuJtlrvjS1PcI7fXvkUeaLJ5l6rD//VKiY8W8d/L7ttQJ8gOCGTt6ch90s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(16576012)(54906003)(53546011)(31696002)(2906002)(16526019)(478600001)(66556008)(66476007)(6486002)(4326008)(86362001)(26005)(31686004)(4744005)(5660300002)(316002)(83380400001)(38100700001)(6666004)(186003)(956004)(8676002)(8936002)(107886003)(66946007)(2616005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dWRPckIwNUtGUEVRZVJHR1FnU05BVmlMMTNNTnZrNW5mcnFUMjdZRFBlVWkw?=
 =?utf-8?B?N20yZXlCRUFLREM0VStoeERuRitwK0F0ME9oSEhvN3BaMmJrR1NxelVOQ3RY?=
 =?utf-8?B?dG1wSFNpbTFoOUNSQjZIazlaVG1HU0l6TTRQNXdjbFZrQlJydm4veU1sNFgx?=
 =?utf-8?B?R0xlNHFpQWtPdENVR1VySVI1d3JhNWRTQ1BWUy9BTVp5blljbVBWenFEcmp0?=
 =?utf-8?B?UlJ3ejVBcUZrQlIzcWVpR2ZzNEdsTmp0VDdtUEFrOXNwb0IvNkRQZW1TdkF2?=
 =?utf-8?B?ZGZyVW52K1ZPcmNBRnRrZU9NYkJFaUVNMEtRNFUzb09ySkI4eTRBWmFGaFpD?=
 =?utf-8?B?cVRvU2U5azJJWFJSWjdkWm05cW91MW1iOXBCdzJia0hEL1BDYkhPcFJzcU1s?=
 =?utf-8?B?ZU9JSEVSNFlLZTgycjFLeDZTMk5pSm9yWkxMMG5keXNGK295b20vcUg1aE5m?=
 =?utf-8?B?WnhEeGVabUFWTjUwZDZXME1ocHpteHM5U0pTb3NONUNqcFB4RzZSd3d0TGlj?=
 =?utf-8?B?N3ppSlF4dXV4MlpjSjU1d3YvekxNc3BUVlJ4ajkxY01HTGtPT2Y3dnkwWVNO?=
 =?utf-8?B?MVg4d1dRdjFtOVEzY2g1TlRZRVhnM3ZhaTFTV3llUW5xU0VMTE1aN2M5VmZY?=
 =?utf-8?B?akoxOVlWZWNBTWlIajJXb0ttN3lBT0JibFZuUi9aZUlYMHNCVXFlQ3VwZmNJ?=
 =?utf-8?B?Z2plVnMxdnplNmFianJFbGtQY0ovcmNLZlp4ZVJtQThUNmxiY0JVOTZtSmxD?=
 =?utf-8?B?c0NMZGtrVnJIYk1HalJNRGYzUCtpVm5aeUcxYmFnUjkreWtMUStDRURydWZS?=
 =?utf-8?B?YWMySVhBbEJVQnB2bGZVa3FUSnVoSDQvVkU0OVBPTmQzZzk4NU5QWVlaQ1la?=
 =?utf-8?B?S2ZFTWYxbEpBZzd5UUwvZGFQODd2MVF3Y1E2eHZJUFM1QndzdmRLajBVTTVw?=
 =?utf-8?B?Wkt2NEZTZThtQ2lMT2d6aHRBaExFRUxsQ2xhZ2VtN3hoRlNSZlNRY3F4NmNC?=
 =?utf-8?B?emFOd2pmSTRCeVFOOVd0eGVmTVZIdkorbGVpbnp4eDNORUxacEdGNVZVY29R?=
 =?utf-8?B?YXpxWmRpYVlIOXJXTzNBcnVSeGJxSlRib2s4cTZBSzBMa3BZTzI4MkVTTXdl?=
 =?utf-8?B?M21sTkFQZFRoTGFIM2dTYVl6NnZGNXgrZGhXNElyVTBCWVAxWTZqRHdYWkxk?=
 =?utf-8?B?Z1NMU1pTWFZsY1J2LzY0VjRNSndsbkEwRmRBZEtNd2NEL253dUdVUFloaDN3?=
 =?utf-8?B?VlJQQzVKbUx4N3BZaTM4WE1Hd1BTMGdaeExmMFlUdFdzN0JtUk5KdnBIZjBI?=
 =?utf-8?B?RXZmeVozVkwxUU10MmdmM3pNQm9KdkZqemwwelFVbUFaSGFUVkZ0Nk9oa0xB?=
 =?utf-8?B?dENwVk4wUVJpNE1LQXBBd09od1h3QTF4dnBYSGROSlArN2ZsTDgwSHBNRFRE?=
 =?utf-8?B?bk5DZzhuazFDcUJNOGFHdXJ5bjV5Y1g2SHN6NUwvZ2l6TjBjVFl0SlVBTExB?=
 =?utf-8?B?M3U4ckpxVHBsM3hHZ091Y1BRaEhCcFl3Tk5maWFaVW9maTI1alZ0aFpFTUVO?=
 =?utf-8?B?UlQ3ZjVLSFRWdWsza2o1T0RnMXNlTGg5QW9kcUNqTGozZW1DWU5QOThmZisv?=
 =?utf-8?B?cjhhZmJoSEU4WmZuOGRqWC9JTGpkR3pWV056b1AvRWwvMkNtK2cxL25NUjR6?=
 =?utf-8?B?YklHMXVOV1k3UlNqOHQ5b2NCTnZkQVJybkV0a0xTT3JNUG4vdmIvZEdSbTAv?=
 =?utf-8?Q?S4oiu/lSjx7hYBpilBIomoA5TFTKzdSAbjbkIZJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c823477-ad5b-4e7a-5c9b-08d8f470809b
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 18:12:10.7882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SL5u7OhqS4VoSVoGPvxgqTXuj1XHDqMXi1kLgZ7U96idKXS/kcmSRHFx/coysC7fYaF7NeoohQU6bLX1tGywvHoRRjE54jGSuZqKg5x9fpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6025
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> @@ -462,8 +464,13 @@ void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
>      itsc = (libxl_defbool_val(info->disable_migrate) ||
>              info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
>  
> -    xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
> -                          pae, itsc, nested_virt, info->cpuid);
> +    rc = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
> +                               pae, itsc, nested_virt, info->cpuid);
> +    if (rc)
> +        LOGE(ERROR, "Failed to apply CPUID policy");

If we are planning to take this patch, then you need to convert from xc
errors (-errno) to libxl errors here, or the caller is going to receive
gibberish.

~Andrew

> +
> +    GC_FREE;
> +    return rc;
>  }


