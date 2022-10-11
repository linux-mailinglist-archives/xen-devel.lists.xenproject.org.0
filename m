Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AAA5FB34F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 15:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420241.664914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiFCQ-00010A-TD; Tue, 11 Oct 2022 13:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420241.664914; Tue, 11 Oct 2022 13:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiFCQ-0000xa-Q7; Tue, 11 Oct 2022 13:21:34 +0000
Received: by outflank-mailman (input) for mailman id 420241;
 Tue, 11 Oct 2022 13:21:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiFCP-0000xT-JL
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 13:21:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f1ac112-4967-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 15:21:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 13:21:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Tue, 11 Oct 2022
 13:21:30 +0000
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
X-Inumbo-ID: 9f1ac112-4967-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3wOkGMwTjfT1ALFEoVlVJwKJN1uGgtFAZrNQcFoQGd710KwpkXQwg3BmWZd/lIhvlmmTpI+vnx0v4Wtt5CUMf4GSrbHqOq2/aRn1lcxBBW60JZ5JlHbahtmk3uRFHJV+fjKbxYpp7364pvK7/bhReoBaGlqyttgNPdu/3YbL4KJiZYCBHJd7DxMIvrPF4ZJ5jXCcruAIOYlT3fvcaYjPvk5su9cpVcTH4TGV5hmncUAP95ND18fNJxKhVdG7Ar/j7uvIGskBps/CFLhj9l2YD5Mek/EKQr7PBfFtThGP0s+0LMdtTCKpFde/ua0/eCMyt1WuFcP7dswZsh3CXV4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqwqqaA9FVLMp5U2TPTFMwQk9XAGEadfa7OT1geaFg4=;
 b=SI6DGWBUC918FY49TZO1pFyT5ES9gLS+VUPsfkkUwB6HJdewYN/DZLr/6Kqn2MsLXMkZi8yUZcSDIKx7xcLR7qNXfDorcXE2iKYZ79/qXBbxl35BePy6tysNxMW/6/qf8qu4SjpEsdHbTxjKUniKMQs9zXfRwfmgjPmtNTelTkKMoEanhpKEim0N/lRLJCWcTZxfjjGbFV2fMjMZl3PyiJXuLzKSvEe5x6LjpM3VsuEMlUKofNS16q019O9zlH098RBwrztqZ4i04ct0qmiogP8s7ZWgLzgJbxak24DSkw6wSf49IGSAW1DQay8Cw8pcVREJpLylnQj4ikhevljELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqwqqaA9FVLMp5U2TPTFMwQk9XAGEadfa7OT1geaFg4=;
 b=k5ZBPsh7oYTo0OvMbWfw/HXXf7raSgm4zLN3mGpP9GTkFmf/G7KFw/pWx4zQ+QZ5LkQJxdepjmgSH5Ty1crIecmZg89pAXto2iu9VZ5ny4u2WIUQkIhtLy4J+AA4uh1i8ziIHt9q4iecbtLz+OUO+LJyh5AeYEvDT77j7wCvvr2o2BCaIMXYY6RqQSiK0Ec457SAWusex5z5qXfaEKnMibFwAdDap/t64n6JyHeQPpTqT+49ZCeMXjRtwObcs4geLBCuTIHESu+eyVYaetnZiZrfKtK7CKLAjwLgQOZbn+i1wH+lhUaWW2vBUF7ldmKwRGi1RbVuDEnsGbyzsALNRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <591495f4-28f1-f50e-b426-d7fbfc7e2f87@suse.com>
Date: Tue, 11 Oct 2022 15:21:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.15.4
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: 605846ac-935b-4807-cf31-08daab8b8280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HpTJcrIQf7qUG8hXU4tApjVVQpvL8yw1fCvX21Qu4MT2OzUjIed2vNNCoqVwQWEPaqru12ScTeaHOqVcKr9zpXY2ijU5uSsXYLqerd5Rel+Jlny1f567qUcg425qdxdg87bq1HR5BoYg9rk5DYOuBBg6PhBgzVsxd0XBUuIO9m2G9UeTiCXv1HPBGM8MQAa4DjcNKickYkDJX5xjzUlNC7/YO9n1dFW+ADimYZ1uVxfN9nk/8gSDK0lPM3w7yZKsGJKCpFL7XZHoLSJPhjGBkmVP2GdUKWiiePC3eV2NMgiuY17CkbAUYWH9x4bRTLbVBKtSvxYRsnt8QH+GTD7p/65C1013sKwHNmQKVUrlY0Hnra7vFfLi8g1+FaO+RnmCax8x0d9oJs2GXEa2F5SQXxAKClBSlXkkLVujPVxShLy061aqRmHMe+d0CsNdMneQpFu0O0o70ov5itZij0UYjbc3iE+7x9GGZ97KtstuBc7MZE4dokESksKI+7IPGIkdruuP7w+EMGampOA+I7cUfgC3ns/qGDZVngnIBSEHiyKUBy4+BiZFD+R817+T3odRIdZzxLTWMpJe0ja/DqqIvRL2hDHpAdMT4gRVdQjmV3hAEYY8KWow3Bf28yrTVXCZtIOadlWgBZPSOHNkfJld+2LcBsImuEGS0skKO4OgxLlufI4JVqs2ikVNuMilJ1ZB11muJ2J8bE3BqtHz+R4SuGMZcIAiYuI8ibe1LZWryMC/ci9wC4Iuf4Br/Se8P3zHQtEiBKwHEA+n29rJZnfBS21/er0PMobRPr6/YDZjvAo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199015)(66476007)(36756003)(38100700002)(66556008)(4326008)(7116003)(31696002)(316002)(66946007)(86362001)(8676002)(54906003)(2906002)(6512007)(4744005)(41300700001)(6916009)(8936002)(5660300002)(186003)(2616005)(478600001)(6486002)(26005)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGc0TytUVjlOb01NUldsa29UTWw5NUlYQURaWUVUOFV5WGdsVmFUUThFWUpm?=
 =?utf-8?B?Z2cxUm5RVjAwSGphdVd6OHNoOVZPUGY3RVdWOVZIL1MwczB4d3VVZzk2MFM1?=
 =?utf-8?B?elVPOG80c3B0dkxJTHI3eU1Od1BiUWJLT3c5czlqM3ZCQk0xVmNQL0hiVWhk?=
 =?utf-8?B?b0d6a2R0dkxUcmFxS2x5R2lDTU5SOWM1Wm1zMkI2VVRmdmk0SWUyRThIR3hL?=
 =?utf-8?B?ZmMvMFl6aHl0dTJIUG9mSmFKTUd0ZWlxUWpDajJJSlI1dEh3R3d3MGwrY0do?=
 =?utf-8?B?dDlGVktXM1RmZ0h1YWdabDVzZFBvdE5vUnU4dXM2dXVsQnZtazY3RUhXOVc0?=
 =?utf-8?B?WnZ4L2IrYzJ5Q0x2K3l5QXZHSmxtU2NPT0hmZ3FJZ2ZEOHdNcElwZCtOL2d5?=
 =?utf-8?B?d0lyUHpMd2dRZ0dBVG1nWEtVN0JKZ09GNU02YXFmU0VTRGFHS2s5Q09UTXVS?=
 =?utf-8?B?aWZMWjJVVTd4MVVQaitkL2hlMDJIMU9LNjJkazFZYk9iMU9WMTg4TUpMN0pG?=
 =?utf-8?B?MzAwMWkvZmttczJHOVBBSmgxOWdWczEzT0ZrcDlwTFU3TTl2Mnl5bVVLL1kz?=
 =?utf-8?B?QlNmY1V4aW5JSDUydExiR0NlN2FWWmNpaUdjRFR2UU1FV3JkcnR4SkF4M1VC?=
 =?utf-8?B?WTVPWWVTQ3loLzY5RDhwOFhTNUpvV1hHMjFuTDhDTU5ReTdjZ1FpbmtJR3cv?=
 =?utf-8?B?RFhBM1EzSmI3UHUvazZiOTJoM2kwY1VrVG9STnZVd0h5b1V4SFcwRkQvVEYx?=
 =?utf-8?B?UmJBQUF4aVErRWxnMkZQZldIZ1g5WmlENkpwMWxtb3V2OHJEZkpnTkZJZnlu?=
 =?utf-8?B?emRSSnVCSlNVQjJPWXhmMjVSNHBYYzBQN3dONktPNGdyZVFNQ2NqQmUxU1RG?=
 =?utf-8?B?cThXWFZZSWpuYm84NTRZOERMVDQwL2JCSlR2VjBrZ1hVb3pOQ1J1aloxMzEv?=
 =?utf-8?B?U1RrQWVkdC9kNjc1M0hYMmlWSlB3djQxa2s5aXpJMGVpWWYvWVROTUR3OXFp?=
 =?utf-8?B?ZEJzMHhYVHhBVG56WU1Fb2ZkSFl4WVpTTERmZjdCVmtaejdpNkprZllhWFRP?=
 =?utf-8?B?UkxqQTBjZFpHTkx6clBMcC9BYW11VlRnRnBBSW1TaDZ5S3RFUTgrYkxYNStm?=
 =?utf-8?B?OGdrakpHbVAxZ0hrOTREYkRqcWNqNFh4Z1VyVnRvYTA0bXJUK0RRaGZvOG9S?=
 =?utf-8?B?M2pZUzFIOE5UZTZYS0oyV1JMZGVLK3dUN01yRHh4WWlpMHMyVTQrL1owUXdQ?=
 =?utf-8?B?RVJDVVZselJ1NkU2c000NDhSbHhyV1J6QmJYOERUTnRCdVJyazFLM0svd3M0?=
 =?utf-8?B?NXpFLzJRYzlWK1Uya2xkcFRBNVIzQk9IV080ZjN2b3drNlloSGRaV3gveWVT?=
 =?utf-8?B?VXNKU09zM1ExMjliV1JueFA2aUptRjVJb0xkZUZGZld0cUpOVmphWEpYSytB?=
 =?utf-8?B?QmtrT043aGI2UVlxdFpObVhaT2JmQVZBMXk3ek1OazFVWjkyQXI0S2ptdnVS?=
 =?utf-8?B?Yyt0OUprQmNRUU1PSmRKMjdDbjdXbUNxakQ4WlVrNEozRDViTHBQeStWRE0z?=
 =?utf-8?B?Rlk4VnNZUUtOK2tMMHdLTFhNUEtlUXpiUU1lM1JDVHFtQ20zL1VhbmRWNFJz?=
 =?utf-8?B?SllUYkJwZzhBTzdrQ1pTS2JnOUVoZS9IOTV0VmhJWThEN3p5WU1jK29kUVdI?=
 =?utf-8?B?QlpQZXUxODUyVm00TjNwWlFnZUdyTGtTREtEUm5TMER3bVRMV3dvc3JZeEwr?=
 =?utf-8?B?WnhDNzYrYzhkQlZCWGtzRlBBcnErNWtMbzJUR25KeXh1YUQzSjFoOW1jQVpq?=
 =?utf-8?B?K0trQ3JDYStsalowREtoQjhYKzMwQVhDazN1Y2RsMlhDcDNsRVpiaFpld3k2?=
 =?utf-8?B?SE5NWDZLTjhxTTZRRGtGQW8wb2lBNjFpV2JKSW94MlIzdXF3Q2JBZERrS0tw?=
 =?utf-8?B?Rld6eVFlSGhwbVBLcDh4VkJjb0NwUU9YdVhMeXkvMW1IVGYzTkplYk91ZWhx?=
 =?utf-8?B?UklRZE8wcUplZlVzZ0U1Tk5LVG5sNzNGYnAxMC9VVTcwQnlGVTUwQlptRlZv?=
 =?utf-8?B?WE9RSUJsdW8ybVpDUmFkbUZmYzM1ZTNkTVJIZ1pZQytUMDRLcFp0Sk5rTUJ6?=
 =?utf-8?Q?scIqaHG5e4w53h3X/FY23vjOk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605846ac-935b-4807-cf31-08daab8b8280
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 13:21:30.7129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10i6eYgTLd4RqdoXEjXe4Iq+HpzWRjZKpQK9TQUP5QydR8TD9qIg/32M5mp/vRIQpuDOd8UZbNfe8VV9N4nOGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824

All,

the release is due around the end of the month. Since 4.15's general
support period has ended earlier this month, this is going to be the
final XenProject-coordinated release from this branch.

Please point out backports you find missing from the respective staging
branch, but which you consider relevant.

Jan

