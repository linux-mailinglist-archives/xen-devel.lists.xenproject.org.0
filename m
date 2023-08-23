Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AE9785180
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 09:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589003.920681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYiIN-0008My-Cl; Wed, 23 Aug 2023 07:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589003.920681; Wed, 23 Aug 2023 07:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYiIN-0008Jw-9D; Wed, 23 Aug 2023 07:28:51 +0000
Received: by outflank-mailman (input) for mailman id 589003;
 Wed, 23 Aug 2023 07:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AP4=EI=citrix.com=prvs=59274c529=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qYiIL-0008Jq-M6
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 07:28:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b16144c8-4186-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 09:28:47 +0200 (CEST)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2023 03:28:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6102.namprd03.prod.outlook.com (2603:10b6:208:31c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 07:28:39 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 07:28:39 +0000
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
X-Inumbo-ID: b16144c8-4186-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692775727;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=74I7GoTmOxm/kbTPQTbF7c619ja+kyE1davo/UZFABA=;
  b=O3P5jWVnoLWlJ5upO8kOOg06l52BDUTAF/i3zUYro0T46sczM7+gh+4R
   mRhB6/n2TyjFlcOJ7iuH8kDvCoABbIjM3lAIvAU0IZagT6tGkBP94RQ4K
   kqctyIYY7WsDax5DWE1t1DR9LODfIyCpK0X9AzNL6SXgDrLGBEKSSEnxz
   s=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 120780658
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9/4aCKLzvKghtI8vFE+RU5QlxSXFcZb7ZxGr2PjKsXjdYENS0DYDz
 zEeC2rQOfuDY2f2fNoia9u190kDu8fdytdjHVRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gZlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4uM01Mq
 tsRdApRYwmCg/mz+u/haeNj05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGNnWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHmjB9JKSuDonhJsqH+0zWpOUjcGaWPli+m2pxa5dthZK
 WVBr0LCqoB3riRHVOLVURC0rWSFtRlaQNdKGuM77gClwLfb+AufCS4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9JmgEfjIAUQoD7PHpvY4ogxTACN1kFcadjNf4BDXxy
 DCitzUlivMYistj/6em+VHKhRq8q56PSRQ6ji3MRX6s5A59YI+jZqSr5ELd4PIGK5yWJnGeu
 FAUls7Y6/oBZaxhjwSISeQJWbquvvCMNWSFhUY1RsdwsTOw53SkYIZcpilkI1tkOdoFfjmvZ
 1LPvQRW59lYO37CgbJLXr9dwv8ClcDIfekJnNiOBjaSSvCdrDO6wRw=
IronPort-HdrOrdr: A9a23:QMga46tQxCGHFCWLXo9eAItj7skDeNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-Talos-CUID: 9a23:K8Rq8m3p0JMXf2h+ZGSH+bxfQ/IJcCL6xSvqf0KhCGJyTYfIE3ya9/Yx
X-Talos-MUID: 9a23:q7fT8gpPNzdp7ehMyR4ezxNFP8E1uY6+NHhTu4UJlpGDGCZ2OR7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="120780658"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FL0bGzHCaMV92QIUTbMcOLi4DJ2wHMJeqWaWm2mTytZH+RvhnuE7eGOxUt+QRKXbDa9vwpyNfYUQ13QGY9aQ0vL/sAv7kc0uvvA7EbQOqecFil83ikeRYsB2f4jZQoVWpS4Xz1l1uGpYVN7HprOYDY+xURacoUU2LhEDJqN1oj4kQaGQwpCut5JYLimFIzFaPTdYZ6BKskL+VV8TaM5K1OT4n1DG8pZn//9qpB+q5o0ThnSNoPV/PDtRz9splqvcjOkLO6275o+Vnm4ft+B6TYePzjmYSEYVZTz/zve/DCur35LD/C9yyKryPa61JrWT7UhDZ+UenQBlvFbZSBFHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYeb64JCwWvXk7Z2bH5oaqf4AGb0MMwXWawtvf0cB9E=;
 b=dTrXIwIOA05njw0xdV6aDlNfVQd3+TlEYwEY4tIy7LP9UhLokJ9+gP5G8UtIm/+DUqeflM4ifPOVVagGIy5Ur+hfx6JW2K9JU80aygavj0cv1S8sUTYZE1NyF8d4jZK7phveSBCbcfP806KTjUGKZlZfYuVT6sRbnWOIWIj77ej491zFLotNu3i+Ruswe2IMy18RZq76lxxjbjHr84KkTBdX8fBEJr0iRtDqgfQ7qhempe71k+3avrmpfynM7Dri56T/H2Q4jpC4ltJ63MZf4E5DOJ1oo7WJBNi7QFruia33IHIML7eYS6oRKuao80ck8dVIXSfNHpGQG9m+uWfPPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYeb64JCwWvXk7Z2bH5oaqf4AGb0MMwXWawtvf0cB9E=;
 b=aI9I6ppyi26u8YZsDwlC40TjD9tHvXv/3ztvXaU4RDN7n2sNWG/rVJom+q9iSZTEBVBxzbAoWzUzTPeb4GuhuDX/E6mC1vjJnauc8sQ5dLLNtD868VxNQ093TYJSbD9/XRMM3O0XkTfoW/+dzYWWSKFIWR8hQncJd4ycl5jgWuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <694049ad-e259-6cdd-19a1-dc4b3c4a57d7@citrix.com>
Date: Wed, 23 Aug 2023 08:28:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2] xen/hypercalls: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com>
In-Reply-To: <7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0216.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6d3275-c726-4ff3-2bc4-08dba3aa91b7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5kodF7lFsJPEn072Ooq5wKoIiaP+uCs8bl4cTO/NT3K4FncuSH8Tqk7Fi3IX0iywW3zVDSKZDu9EffkNx3zSU+Q2NlfEPHEiBsZCASv7IVC9xW0MOklCRmLB8j3yEEY9oQflwI4TaxkY203bxAtcFfc392d66DzSMnvGP9PXzIYBsBH8yweqZ736p6/gGsMwxS0P12RmvStcMzmpAMjd0WublC30DURyX0Nrm1/khnAAx/+dAscI9vnriRmzDEn+q7Xds1Z1mqAos+TaeD1pddVXL8iWVks7hpVKDa8kMSWCIEUGN/A+reF6VgFQ4AzfkacjEj/gY1Z5fVWmOfQn479D1gAsMG1PEY63YfTeWWI1SBabKPammc8Odthx+ljP11nU3kWgdzMqCJfWKy+XhHcekIBhNB/WQO2Edz+MfVIkePHLSSIQTTBrJUC0TKr211H3vuG54raa63Rhtdo3jUdjQmFVLLzzMv2l5rtn1LVzU+J2hhJ4vXwEcSuf4/cpLr8J5tjZV1PszHvKNv3FrX3cfPqn2VgzpTFY186qfaFzqw8NOvHo84XvUpPd79JO2aredvlh05zYkzfANKLFwx2mcywaAPliruyToXwY95ITf0oV5RO/hrMYKH1D56kbnkU0mJmMN3Z5cLVphqfCLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(186009)(451199024)(1800799009)(2616005)(6506007)(6486002)(316002)(53546011)(4326008)(8676002)(8936002)(66946007)(66556008)(66476007)(54906003)(41300700001)(6512007)(26005)(5660300002)(6666004)(478600001)(31686004)(83380400001)(31696002)(36756003)(86362001)(82960400001)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk5PUWdQQjFpMVhnTVJRZVE5b01jMXFSVC92c2J2d1pOelJUR0dlNzBWdld6?=
 =?utf-8?B?bkNMRlFpdW5rTHF1cUprNGY1M0hkb2NkZHIvaGtVTWljRUtNbG9OMFhJM0RB?=
 =?utf-8?B?YzZMSGdIT0phY2ZmZ1ZYLzNWVUJtKzZ4dHJYZUNIbVEyR2xjY3ZBSzNYVkhl?=
 =?utf-8?B?UThHOTk3U3ZQZ1h3SExqMG9EcW1DYVRVSDg5aVh2YkZmdC9KVno3dDBmMEFN?=
 =?utf-8?B?c05EeGhLRlVra1BmYTNOZUlibHRQelZ5S3NjeUltTjhrOUpEVjU0MFpTckpF?=
 =?utf-8?B?UkJjRS8zR0VGRUgrL3hlVjFSc0R5K0R4WTBDWCt2K2pFSHdXUWgvWTlrUzJp?=
 =?utf-8?B?Wi9GdWxCYm9CNWlRVW8yUVhQMm9aU1lFKzREN1hsb2ZNSnpWaGxFTkxYWDM0?=
 =?utf-8?B?SVdFOVdGQ1BvWVNFT3VDc3AreWJOMEJTTkRhSzdqVDRPdzlvcXhuRnorWmV2?=
 =?utf-8?B?c01xZGxtTmZGcGdsUTRXYUdnQWlWWmtTT25hTGorUTI4TXA5Q25pQlRvRWk4?=
 =?utf-8?B?UVJVWERmU29qMklvUUwwOUNvbVlybEMvclhlU1BVV1B1V3hIZXVjS1JLT0tX?=
 =?utf-8?B?dy9lSm4xSU13eHFTdy9kSG1jMEVZZlRac1JwdFF4Si9aTXFVdlBBVlFhTTA5?=
 =?utf-8?B?aGJFUHprZ1hPdHdmL2JkRWtpdDFvaWZ0OEpFcCtoVW5QZmljOHRBSVpCTVRt?=
 =?utf-8?B?cEk1dkFnM0lkMXg4R1Y0ZGc4SE5GZUxENG40RW4xTkdIK3JmODFMa2IzZlBx?=
 =?utf-8?B?L01mYWk1aTRCa1NOSXptcUtzbEdIMzljSE9peU5FVFJyNFEySktST2Z1Z2FD?=
 =?utf-8?B?RkFZMzh3WTNrOHh5YUZ4T2RjR1cvdUtJU2cvVjRBeUV4dkZlb09XZEFVajVT?=
 =?utf-8?B?Ti9ocHVyTGJjOWhjUGE2NXdZZlF6OHR0OXp3cEVGdmhlSmJidUYwM2tiRzB6?=
 =?utf-8?B?Ukw2UkR5MFNsbFVzdnVubWJUOERSUHdaY1JrajFQWUdaY0xkeEE5TW8zTytJ?=
 =?utf-8?B?OUlsUElPY21CQ3dpUWpPQ2lLY3ZuMkcvY1dSOVJBaTBTK2orU2JoNkNSbHFh?=
 =?utf-8?B?bUIrS1o2cXp4WE1LQlorNWs1dC9pWlJWNVJHb2o0Y0VKQitxTHVKMjBsRGM1?=
 =?utf-8?B?NDBFcys1TEQzK3ZPc29DNG1DKzRKWkZldzluVVd4U21qTktYc0Z5R1IwZ3VE?=
 =?utf-8?B?TERZR3BLUittcDdmOE5KSVp6bEszK3pzNU5KUFFLZU1FUThERHR4TlRaeUVY?=
 =?utf-8?B?d0NFWm1TQ1IwWEpYWnRLQ0RZSXpMc041azIrbFpoU1NFRUFOdk56TkxTOE05?=
 =?utf-8?B?NVI5NFV0RzdUMTVsMWVuS2gxQTVnRjhpays4UHlWUEJsa0F0aHNBakF4NXVX?=
 =?utf-8?B?dmpmVjNBK3lKQVg1NGJNRlNRajY2MzFiRTI4bWxpTXpwZGN0TFlJS05NR1Y0?=
 =?utf-8?B?dndpNm5XMXhmTDNtbXNKVmRIVU0reVZjNTkvV3NBNWFyclJtR3lpK2dWZzU3?=
 =?utf-8?B?Uk9HVm1CTWJiMFdoYUQ3NWh5aG1YQ0VzRTFONlFubEFtNEVnNzRqeFFVNzJJ?=
 =?utf-8?B?Qk9Wdys3SnkwS29RY1dvU0dTeExpZy9ZM0lGODFEa3NERWtwdXRzZkhVUmF4?=
 =?utf-8?B?amhkMWlvVUpuWmRRSkVSOHl2U05EeFdiNGJKTUZwa1dVNndjTXJEN0l6Rm9o?=
 =?utf-8?B?TDZsUVdCN1M1MENMbHZwenJwdEJnM1RQcGxWQnlYditsTXFvT2tmKytBWDNY?=
 =?utf-8?B?MzQ0U2hvZ2lwcUNnTmF0a1E5cWROWXNZdnZOaWoxVkZVa21zRnNvQm90NVVN?=
 =?utf-8?B?T3ZsUXVBeHMzRC9CbytyS2U1clVCOTV6SUVuRnR2SFhPcjRRc3VEWlVjUGg1?=
 =?utf-8?B?bDZ2amg1NG5wWlA5SHNpTGVkMStIcW55K095ZXJqeVZoTlA2L1lsY0ozbjcr?=
 =?utf-8?B?a08ya0dhQThzNVVwb0E2dVBwRG02bkw2QXVaKzUvNlR4enJYckZia3IzQTd3?=
 =?utf-8?B?Z0FqbSswRm9hMXZ5Vy8wUEI2QWJjalVkeE1Db1FpVitqQkRrQktQWG5uaXlI?=
 =?utf-8?B?clJvWXlxbjRHSUlpYVc3aVR1UUVqQXVsdThCc1FobzFtYXZuSzBRa0R6UThG?=
 =?utf-8?B?V211RXVjc2JoMHM5TGN0K05GMmJROHlkbFU3UGtpbnB3UmloTkVOdC8zRmpF?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UEkKs/rdWKPPJXxpo9PMSxdY5EjRtFOIi4naBwTMTQc/lsY2CIEscZ3Xr5B4r/Czt9sBNwjrrBmV90cZT+Tw8nycEWidjA8GbwZv5gizgPQ+vre+NU7hgIU2ofGLsQb7ybY0DYzwOue7MTXedebAgyaQTQTp6EkcHbPn+NLvqMrEoGPoqfOGlSQ4MceMkwNM2jDL3ZZNwtYnTLS8nk40KT+nA1K6IcfMltYsM9i2kDuPM6zUYYDla8yUIRg8iCAZ/2TYRn/XbVmiDlRfM07VZbNPrGjqzp8PbZxQW2+t2//paevIcVPfqMFKlxA6GgA6nNrGOhJqBC81bLrNvNqW8jBIm3VY7W+vRloliBIGh0SFzbpZf/tUosP+2EQCNgYCmQqCCnDOQK74Xw8JsorUp7pn231fgxHm5KM+G04CjEgfkiwTdp8i6/nE5XsaXLPJTbnpHXONMi312EwFqeirQSSAWFu8RksiAOs1XJwg13fAsG/SeqFWxZuiEgd3TUhNU29xEq17q7bTvVtiQKo6rpqcZrkG2R/ut8Dh0zxWtSpPQz7waNyjMXa8hYKecOQqYDj6unKeiVK2sAopSlEYIDaHBujSGbThRk36zkJi1CITn0BRpkfuU2tSb3+ATrwQPPAQH+pcsoq9tQD0uj7KnlWo+10ugk067KTa4qOut5ENmRZ+sm8uYoXRnQS6Mb4vGGRRip2HS24jO7iSH3mxLeYrmtK+Xs2+qvhzmfFBN9l7PbYtO0SWlOxa0iCaevyZM936AzKaoxVYPT3Xe+VXq/2+JNUyLHyg+gz/ZBHVen4PeFN3ujmOGIQX4VVBj4+Vh//BTSUZ4iSBhpyQ+mbYHJq7jEhqorlsrBVEanZHGvIklboih9AOcXMoqFEpsWKe
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6d3275-c726-4ff3-2bc4-08dba3aa91b7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 07:28:39.0336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHAroHpjtiyPXHNWBP3OH7R4NqOu0fEKA59HsHGrRXn++S3/MTl681VFSVGWeaPwkS/bCIng8ABeyYHuNcDesTyFQGsD8RHDxbOZZ8UQ4dY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6102

On 23/08/2023 8:04 am, Federico Serafini wrote:
> Make function declarations and definitions consistent to address
> violations of MISRA C:2012 Rule 8.3 ("All declarations of an object or
> function shall use the same names and type qualifiers").
>
> No functional change.
>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes in v2:
> - change compat_grant_table_op() definition instead of the declaration;
> - use unsigned int for multicall()'s parameter in accordance with XEN coding
>   style.

Nack.

You were correct in v1, and the request to change it was erroneous.

> diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
> index 6d361ddfce..d1892fd14f 100644
> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -135,8 +135,8 @@ xenoprof_op(int op, void *arg)
>  #ifdef CONFIG_COMPAT
>  prefix: compat
>  set_timer_op(uint32_t lo, int32_t hi)
> -multicall(multicall_entry_compat_t *call_list, uint32_t nr_calls)
> -memory_op(unsigned int cmd, void *arg)
> +multicall(multicall_entry_compat_t *call_list, unsigned int nr_calls)

This, unfortunately for many reasons, is an ABI with guests.

It is buggy that the entire file doesn't use unsigned long (i.e. one
full GPR width) to begin with.  It these types alone which cause
explicit truncation of the guest-provided hypercall parameter values.

But it is even more buggy to take something that at least truncates to a
fixed width, and replace it with something that explicitly does not have
a fixed width.

~Andrew

