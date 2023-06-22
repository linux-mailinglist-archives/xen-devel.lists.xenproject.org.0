Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526F3739A4F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 10:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553399.863924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFtu-00037P-31; Thu, 22 Jun 2023 08:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553399.863924; Thu, 22 Jun 2023 08:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCFtt-00035b-VU; Thu, 22 Jun 2023 08:42:45 +0000
Received: by outflank-mailman (input) for mailman id 553399;
 Thu, 22 Jun 2023 08:42:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCFts-00035V-5l
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 08:42:44 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf9cb40b-10d8-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 10:42:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7362.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 08:42:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 08:42:38 +0000
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
X-Inumbo-ID: bf9cb40b-10d8-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHzcTsWZ+FbuA+ulL7DmUrmXM8KfiKH+hJ3xLGK7z2Au1fvtW+00ASKdZZlaJahdI4oSn4+AXatjkaCDFT/GdYtv/me+9O8C7Sx0FY2IDD8MtNDPjydB1K+xkQLwy04BOIC5zNu2YTCjizNijIpkT9gwAfmyufr/3Rq2ZGfmRo//JNiBT3AAINKg79BvLqnZG1UNflr0ln54p0+Fyk//EAiwt1eH/6G/tPz0+qGQfDqXiBrZc8qzmVG8umh2SA/Je8vt7hCGIah75f1c/gisL2mjZYINygqxtgx9++gbIUyMv2RkTpGqXchy/WXoGXVzERklnPiotGJMepQJlyCh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ya5OBKa4U4pXsz1gQtJ+XEYBNA4mQKe7sGf8wtHMzhs=;
 b=EzsEzyaBrV1yx8yf1Rtx+r4qYSLXVD5XxvxF6HO7kuslAHAyTMeys4RmwaDBL8PcpABotMvw6u52azkcMU8eKN09mZ0sKupxvNc6VeGwZTJBZpXAQDoE0CYpf+mqlnqcU9W/DXHRFhM5t3SGdceE0EiHzjEtwv+/fMgcw9G8Cmbw0UQGgw2FiKMroLFk1SMiKOIJ7XtaMf6FxZStexAcDZbw/uTpFIDz/aIK2XC6vFXk+JWf7Utlb443Plx38wFWwrZVjOp+zRwlUttLRgJS5jdpf/pdC2+KsOQRriEc5s5VRmihYS5V6Md2rfuMICd8TokKMOMEPQ4IedcWFDgNhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ya5OBKa4U4pXsz1gQtJ+XEYBNA4mQKe7sGf8wtHMzhs=;
 b=myHJS5NkZhE0WF6vt9eE/jIUyvHKCbpQsxkZcjzGKFJZIo4uQtkPqJq8cPRKdX10rf4gqSdcwIGieYtiwYLA1h1sIAEIvTeW3e6YlGPrJ2CNO8QJBLops1vJ0cYbKN55ajetzOMaBQtUvUFVojH79axKNshe9kfL7uIx7IamDz9Y/5JjXAq0rIBjHJM4Eu65DzZWqGHvRYQkmXD+9dBlNDY8sDftHYkqJxQHT1ziju5OuWK8a/IKaDVgkGSAenqSz4CjXsCCgMMJ41gyF1WnetGJgwkwfwQsPEFghizJzxZgtum6YSYPLQutYQec0oNZkXyjQO2yv+oCX2ELZ2MOTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da182694-a43b-c811-5124-deabd0f8f657@suse.com>
Date: Thu, 22 Jun 2023 10:42:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] xen/types: Rework stdint vs __{u,s}$N types
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230621211200.4132989-1-andrew.cooper3@citrix.com>
 <20230621211200.4132989-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230621211200.4132989-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e4b681d-b245-416a-854b-08db72fca220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qbw+0zqw6msTlz1IcEWJR0nhzNIgFemFVXc0lmiVOVpaa1WpRixMaRtdFCvQbfD1qZkSxKG6Jq2Nu1GAJwP4LGIHJM63LAX1sZO02jjyFG6GqN2m7ZKzOmvhEgmzJYAF2ZRQeXxgMgSsMBRaeOXTtjrOVAP+57xfelGQ70B3jDHL3DA2l4MvabLLOiE9wfO0NDxWs8qdG2e1SNp5SxCDgNe6/ieGhM55W7dAhCvps8l+Ny6nb2lkHTrDMZwJ/R/EbwWpwrS6DmvSpnT6jBiPt729l8wTcDNfLSI0ahAWmWmT23PSZ1btZkL6wNDfZeDihdwdDy6cc+ypLDw9a2/bW1eUTW+AKub3TG98/+1TcX6elyW9qSgTOvNp9m/Yra8JevEhEuDSl30MZe3MfCNjvc5QoBcErR0wXrpxgYIEfadWOPf/NYexclWMgi4nLKOgsVW5DBYAF8BDn/VmWHLO3d15B3sxsFezLmV8q7xqGTUgH2W+Avmvo3vWlu2I+Mjzgzuzt5dOYtNauwE4DYSLAYfHQ+BHqCnaGfh+wWcvzgQlvTu2+N62DTre7AWvs0P3YJON30JwAlsbNvrTtmv0HQCi9Dx62/+Oc7kc5I2869CDbTGmhfmr1wCdgHVqi0ZUH36I3qgpFVzHPXsFWrziAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199021)(86362001)(38100700002)(316002)(4326008)(66556008)(66476007)(66946007)(6916009)(41300700001)(8676002)(5660300002)(31696002)(8936002)(2906002)(7416002)(186003)(26005)(6512007)(6506007)(36756003)(83380400001)(53546011)(2616005)(31686004)(54906003)(478600001)(6486002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clpzbTFCUjlqVnhnQUVKckgxMnJWdGFBbGNLZ3lrcmZZUS9Ecm9VRjdIMFox?=
 =?utf-8?B?aFV1VTNhVXFKN1lGQTJ5L1JpQU5xOWZGRGZzMHJjRmRXOVBESUI3Mm9xRnNJ?=
 =?utf-8?B?Y3B0Y051bDcvUThocHlFRE1Ja0Y4Vk1CUFYzRUJtcEFpNVVoTndMVGV5OUgz?=
 =?utf-8?B?c2FKK3NDWi9ncVlZdzMxOVpmOVpqSUdINGVMbnJuRFdybEFCUzM1OVlxN21B?=
 =?utf-8?B?YVR0aVZ2N1drRUVUV3JnVW8wWjRQL1podVdySDZCdXc5Qk50bUhGZ0tBTm5j?=
 =?utf-8?B?STZBb1NMd3MxYStMZHdFWWtlUzhwNGhnNm1xUEUzYjRDZE9ha3l0MUVXZmJi?=
 =?utf-8?B?L2VKZTFSQVdoNWlSZXA5Ym5kWHZVOFJWbXpUYlVINllCRHJDRFh5eTVLRG1Q?=
 =?utf-8?B?UmNaQXRZNUFRR2IweUtZSFlwa2FzN3NkYWh0MS9TMCtkZHBOelpMenUyODlj?=
 =?utf-8?B?QmlqWndDbEFEUThoN1ZGajdhbGd2YkFqeFQzeUt3aUhyc1ZvTm1EVmkwMGxx?=
 =?utf-8?B?YXRKN3dSSm5oN0dtdWwwa2g2MU9JQW9PejlvczB6SWtKc3ozTW1UZFE5THNu?=
 =?utf-8?B?SVFSWTFnRHJhZHh2UjRDWXJkUXBXNnVFak01NEJjOUkxektlY1dXdU42WWNK?=
 =?utf-8?B?bTJMTEtPMjZoL3h6S1VQZ2FHWGxXOHFlMGVUYjE2R1RJTjl2OUlaVkJGUnBj?=
 =?utf-8?B?YTJ0bmxqOXF0NW1aTE9WbTdEWFZjWTh3UlgwVEQ1S3RGQ0d5dXBZSjBONllK?=
 =?utf-8?B?YTZXckwyQjFvWXNNMXhLNVpoVWVNUUUzdmpTdE93cFNHOHpmSDRMcG9lT3Uz?=
 =?utf-8?B?Y2tuU0tnWjlwbTN5cFR6NDh5enZURjJ4RHBYMGFDbFRtbDlJTHRzNzZTanZu?=
 =?utf-8?B?SThEamNkaDdMZXhHd0xma2hlT21HekxBc0FvUWxqK2hiZXhWZGNoaFJVQXdw?=
 =?utf-8?B?Yjd6Q0p5RXljbWJLRWlhaUxVOE5YV1lpNXFoV0N3bHVsYVh0OFFaVCthSFJ3?=
 =?utf-8?B?VUp2ck56b2N5dDY4bE8wRlJ5UkdaM2c0SVV3ZU8yZ2ZOZmloMEgwcHFYNjZu?=
 =?utf-8?B?SXZGLzh6MlVDejhrNmcxMDFSYzRTNlhrSFlnU2xvZGJ4T2V6emhXeW1ndGJv?=
 =?utf-8?B?OWphN0l5YTBwNmY2QlNWTWpEY25pcjdYMm03clU5bldsN2ljbjNGWXJJa2VM?=
 =?utf-8?B?bXRGeHFFMEZjWFIrWVJNcUtKL1RlNEhWQzRmUWZWZFNmekV1QitBK1d3RVgy?=
 =?utf-8?B?T0hsRDRNL1pzZ1dSSHA3R0J3SW1Edk9tUUxCWklLVVArVUtLTlFmZ084MkdH?=
 =?utf-8?B?K2xkSHhUU01seFk3NldBYnEzbVlib013MVgvcUo3MUdQYUN3MlVoVW9PbmNu?=
 =?utf-8?B?VTA2NlFrZnlua2I0Mk9aSmRCUS9qUGxhWms0eFVTNXZocm5kNUs0NTRLeTAw?=
 =?utf-8?B?T21wV0pTemk1eUpMVCt6N082NVZJUFJCcW4yTGxscXo1MVlLb3NXVE1FSUt3?=
 =?utf-8?B?d283d1NSalZFZ2o4M0YrLytIUU4rQ0hEa1kraFBpcStCMjh4cjRpWGt2WmhK?=
 =?utf-8?B?cjRhdVhZdDhnTGxWY2lKeTVxVm5iTmxvM2lvSkM5QytzSXlXcGhUQXlzY3Y0?=
 =?utf-8?B?QkVuTU5hSW5zMzlUTkUxOE5nUDRUcDlYN3QxdlhoM1VWeTJ5bnFKUXJOZWVC?=
 =?utf-8?B?RWJnRHpBOVNGdWN0cERENm9CRHorbEUvZFYzeDdCZlUwV0JKNzlCdUE3Ukhw?=
 =?utf-8?B?ZVBWWEJzN29IeUZycmNXVkg0aVFtYis0d0JaZTViQ0ZycE5aN2lHZXFJd2lS?=
 =?utf-8?B?K2FHaXc4amhNUWIwcUI3Z1l6eFoxVW03QkxsNW9qb2dtWVVMQk9sVmdDME5E?=
 =?utf-8?B?ZXVKVis3MWdxVC9ORkhqWStQMG9COWNmQXNrdkltenNJZmpFc211VEJaaVFM?=
 =?utf-8?B?RlBnU0ZFMWIxLzQ5SHFCb3kvaVBvM2hmTHpmVmhLQUdIUU0rUDNhQVVGR1Vl?=
 =?utf-8?B?QThWR0ZWK1Q2VVI3b01UVzRsZllBcDNCdzRFdUFydHd0UGVnMGZoVEpCYmRL?=
 =?utf-8?B?OUZnMklWRksrbDVwdUVaMy9iVDlNUWt0TXNPZFlHbG9ZcDhsYVVDcTlTM1d4?=
 =?utf-8?Q?pYlFQwuTd/VJf9I16tTte8Aw8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4b681d-b245-416a-854b-08db72fca220
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 08:42:38.1745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBej7eeVSEwLiKg6aaefCB67+JcxrJsebQ3SED/EX/vLzsA1iedRdb2TpyVa02Y572GoCM6F6gFzaXdzhSqolw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7362

On 21.06.2023 23:12, Andrew Cooper wrote:
> A different option would be to sort out the stdint types ahead of including
> <asm/types.h>, which can either be done by introducing a <asm/stdint.h> or
> upping the minimum compiler version for x86; a task which is massively
> overdue.

As per my patch moving in this same direction, I strongly think this is
the direction we want to take. (I don't see a reason to introduce
asm/stdint.h for this - the logic you put in x86'es asm/types.h can
well be put in xen/types.h as well, suitably limited by a slightly more
involved #if than you have it now.)

Personally I think using "mode" attributes for the fallbacks would be
the more widely compatible way, but I'm not going to object to your
approach avoiding them. It would feel more safe though if without using
that attribute the fallback wasn't tied to __INT8_TYPE__ being defined
(but instead directly to being on very old gcc).

As to upping the minimal gcc version for x86: While I'm pretty sure I'm
considered the hindering factor here, I continue to think that my
"blocking" request isn't unreasonable at all: We want to establish
clear criteria, by which we can then also go in the future. And we want
to make clear what, if any, baseline requirements are acceptable to put
up beyond consideration of just binutils and compilers (basic utilities,
make, perl, python, etc).

Jan

