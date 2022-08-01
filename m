Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFF75867E2
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 13:02:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378687.612020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oITBl-0000HO-Bk; Mon, 01 Aug 2022 11:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378687.612020; Mon, 01 Aug 2022 11:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oITBl-0000FX-8z; Mon, 01 Aug 2022 11:02:21 +0000
Received: by outflank-mailman (input) for mailman id 378687;
 Mon, 01 Aug 2022 11:02:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oITBj-0000FR-Vc
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 11:02:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68dab445-1189-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 13:02:18 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU2PR04MB8677.eurprd04.prod.outlook.com (2603:10a6:10:2dc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Mon, 1 Aug
 2022 11:02:17 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a%4]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 11:02:17 +0000
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
X-Inumbo-ID: 68dab445-1189-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJUZRwZVPAeTgiiE2hVj0/aGGzxPw3iurSCasjx63s920b4PbZpCtbIR5E38qaNNkANxL0MLub55lMzs0wagSYhpX3oDml4pAUXN5k6ASIrYUvyHynMLLDa/MsG7fJSxTHDgS0/Zczt/jH2+tlz3bDpp5eGohPcYA09OYS/oGk6ZHfbBf78+gjCIz1P6u5xrymnkHEggXBN185pNBh66yZr81/imwCig6hmA/rtc46oDW6o8jxrGqr/HBNQXYpbETUrTzWCXIUWln9NZ6V/VXQtKEFmAg/nV4sVBQHqTZrehxrTtXarqGQWxT4JD5BrlOIK03bdiJcLM/g4sJI6I/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFIA8bg01IggligMdL9rmyK4dzg2+r+xoKYewqwRoVo=;
 b=LR8qDhd1fGb8rHE856sOZ7pK1TysQUGR1fAJ8rAlJhHJaeh5MoJfWOF+v65tg4fW28Wj8G+iOgFpqtgcr0zXBfUcgp/Rfl55AHXuuUgV59qZao2vXeDiNtTUi9GXEp8h7+QjMVnUxOwxryKb55AVj1klQEC6SNsXO9PMbxy/J1vHevVsDltv4YTA0AuNyuerkndc2fFh99GFMpSDsPC3VGB18tBC7vXEm4NYzR6TPwcewaK0w58PQEHJNLbTJ/eofp4Ks0u4UtNyzoT5HftUBcauxP16ta0DjXcc+EVZXY/gRPV1ppyU8LUSW/ojIcO38dCz/8Iao/eKAYRwfpSHbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFIA8bg01IggligMdL9rmyK4dzg2+r+xoKYewqwRoVo=;
 b=pjlpXzucnVyiT+3Zcc/pI0aaA6IC72Ap4TZPqgZAdkYe1Bk8x3GoFhqM3NDRPkqFWRcQKe2ASJo6GpptgRiF9FFIxdEhc/mMBoIiqt6kmquN7tqTcq7HQ5Rl9o09hkQOek3TtjhI2BL6c20l3yz6idzpzcYkNDWw+NKzu4g1sI+7CGKISbIScsznmJ+pBvG9iLDz8qiXIc5LLQTBORKHs1po2D4+aS52gw1Qu4tCM1VcdyWy05hNjsQ4bvIULFetHnYBRfSq9M3cc/Qbc15hS2if5OoyjLagT10R1zkxFNA+t68CUAQXI3Hs03IyMz+1W59KJvwTrPS4VZsts+tsSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4e717a7c-f5b8-74e3-e830-a75c9b5b211b@suse.com>
Date: Mon, 1 Aug 2022 13:02:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm64: efibind: fix MISRA C 2012 Directive 4.10
 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220801104311.1634742-1-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220801104311.1634742-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4961111a-98ad-4877-ef94-08da73ad4c3e
X-MS-TrafficTypeDiagnostic: DU2PR04MB8677:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oYd04AucT7rboxS580tMcCYEvx2KEp54NAbjFF3hfNWIdKVUR0fqm9fILUSNfklAqbb09fUeKjGj2yE9yRpuoqRNFrbblwvlwPWeL8enbmXXDIJeBzXbRIsEKFOTGA/LO9Fd/BsvSmQLwJP2mQrUbRGmbwj/EW2AGnkBCt7G4EhjbpdA3OYEkYkAvrk3qdrh3wqQY8qmUIqERDhZEi19Tp+DyqxKUbgl0pyI/2FBpi74GdrhbIxX4TepLSVrjw3q0NTBpc07XRANRjLIy+SRfOpVkP6QV72HvD6ue8P1bgPHYTRaE2gqUs/7Yh1T517rRZUgcrXMZ1KT/M9o5wh7uzRlK0F2LuUXnJDS9zk7tDw7LrPMpMa1KFmEfnLkBl6u0GiOICLUUwpvtTA4Z/Va9oMPWBL94eNZUaMJhiKxvYMGvNQsL1XeT7t4bvqsDXVeAa7aCxAqI2ee/DOA/ja7/ay2Fwt2+KIULhe9T6zYfnA1SWwpnptkkgYxk1/vgAG8u3r0RrOWNMBYpDs41MjSd45DTGVXYkf5KwjKT9SlWf31xh5TzeVlMl8RV9RJKEgJPTTqJ7k0Wb+hGuYvNZhHDLIEHyPul43xoQrq9bv5J4e85YmXOdygbUBaIlwqWFf6v3qBkE2bsEKS+tf4zZK4cwREep1Bg1QlPuGf5Twzmr7A07pg7G6969dGpGN2y6u2n8EWhy8aW3e2oqPQhScRYw+DXtolSE+Ny2gnxnqhgn2AFErRWBlbI5yhQyBcXXmy2FPW/zbw+PTxwK9Q0xl6Fv0MbWZtF5U5GqqfyBrinD+0DkincJtRE5WXRbDpEQ7xXZmZHvVkOtwzWHYxP5UezA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(39860400002)(396003)(136003)(366004)(38100700002)(31686004)(186003)(6512007)(2906002)(36756003)(54906003)(41300700001)(6916009)(316002)(86362001)(66476007)(66556008)(66946007)(83380400001)(478600001)(8676002)(6486002)(4326008)(4744005)(5660300002)(31696002)(26005)(6506007)(2616005)(53546011)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1JiT3duZUpwUENIR2xyZHJiTDIzZUFUY0xiOGJ1N2VKKzBWVTVxc0ZlN0xQ?=
 =?utf-8?B?UEFVTEhQQzUwNW4rZnNrV1AvMHBjUHNFMWRpcXR5REZ6eHJtQUtRR1V2WWZU?=
 =?utf-8?B?aVV2dGFIZXM5cGQyOVNheUtmY1dDVm44Nk9vRG5FK05uSklDM1VkWmtoVDcy?=
 =?utf-8?B?K0lQTTAwZ1ljZ2JKWHRUaC9FVjFPZzQwNXViS1JMUTk2S3ZJWm9GME5INEYv?=
 =?utf-8?B?dituL0I0SzBUWkU0WHAwbXB3SnF3NVBBWEVSaTlLR3MzN0ZvWENXL1dYcGpl?=
 =?utf-8?B?TnhNckprK095Nm8xK2tBaUxGZldSOTVSdXJNQ25NV28rNFVTY2luKzFDY29V?=
 =?utf-8?B?VGs4MXY2aHhWOWkrdnEwZzBldm5tMGNWNEx6blFZTFd0ak4zL0RmR1F6di9h?=
 =?utf-8?B?cCtZVWpERUhmSkYzRVNuMi9pbThZZzN1MkViMTE5MGxsUW8zVG9JWTd1WU9W?=
 =?utf-8?B?Rm55emNhVFhub25iSmFIdEo2TzRPU3JqUzdhcGxzZU5RZU0xYmxlZHBmNVk0?=
 =?utf-8?B?a3B2SnZaSFRNa1NwaEcrZnJYVjBhQW1ieTFlMGVpWDZ2Rkw5aHh2bmZLTm82?=
 =?utf-8?B?cTl6S05GN0F1MG9HN2IyMkZsbUtjRkFvSlRSV1lCcDNLWVNzNlQ5UEFqblFn?=
 =?utf-8?B?YmZob0Ftby93TWc5a1hkeEJUb1NkUGRvY2l4L1lZK0tuYW92S3ZtOGhRazBw?=
 =?utf-8?B?OEZHdHpkTjM3YjUxQmJHSHA3N043cG5EcDh3emlYWXhIWVBwbG5OamxDbTV5?=
 =?utf-8?B?enpuYmdWVEd0RytsMTM3Nnk1SDJsd3lLYUp0YnRCdXRjUGZwaDB4dmZ3cExE?=
 =?utf-8?B?RVQ4NlErZHRuRFNzMW90ZVhCbkZ5a0tIQSs5dE9NUFUyczYxOHZpWUlIK1dh?=
 =?utf-8?B?Q0ZUYmNldzZKcEx6Zm9IRUx1aXV2cUY4bUpERmlDd0VtVmJqYlhhRm0vYzI2?=
 =?utf-8?B?RHhhV1lYaUFieTZtYkVmRWExbVNtOWovcWpwbk9HbnA1OE0zclZRaUFOU0xJ?=
 =?utf-8?B?VVUzTjlTVHVEVUF3ZFRZS1lwKzJid3pTR0dLZitWWkRZaUxUZkcvVC9BZGNC?=
 =?utf-8?B?bVBLeEp5Z08zcTV2dFFmUzJkQlM5RUNENEJrNUpnaU1MdXRBTS9UMzZvQ3Iw?=
 =?utf-8?B?UER6Nktpc1pMWHZhUGlISS9DdUF0V2NSaWdWamV6MTRGSWhxMU9oUkNtTWlz?=
 =?utf-8?B?dW5rUzA1MGpmZEN5Q2t1NE8xblRVaXFicWl3RXQvV0dwaGhCbTBNemUzMS82?=
 =?utf-8?B?YlRXRDgxanN0VEZXSFNXTjU0UUhiRlVMSXc3aG0vWE1hZjV1cFRzT0k5MHJQ?=
 =?utf-8?B?all5eHJ3Skp0TnI0SlpaS1BZSmF4d3diT21ScWo2Rmc0SkVVSFl1RzJGcGpH?=
 =?utf-8?B?b3E2ZmlTcjl5dGZDK3V6dk0vcW1JakVGdEMwUG5jblFsQzRTcFVRTXcyclJu?=
 =?utf-8?B?R0xnSEdnUHkveFVRdnF0b1NHaVdITmRSNVprYlF6bXRYUkZLK2xHZ3ZmWXlq?=
 =?utf-8?B?b2t5cmpFZERkYlRLdGlzS05YQjhuNjJWVFVmYWhtWlJzQXpma2RHdUM1K1p5?=
 =?utf-8?B?cnlobEFpT25la2E2VGxQOEtWOVk4anZFYlFvSVlKa0FnUXhCdm9yMktMemxM?=
 =?utf-8?B?T0xZZmJUTUgvK01TVWR5enZGdU55UXh3eFdBUnlGR2hpbTQrZytTR1o1SDNl?=
 =?utf-8?B?MXJzVkdLdEdqbjUzZ3FHTk04ZThBRGo0QjBMSFV2Yy8wKzArQThqMWtRWHF1?=
 =?utf-8?B?VWZUN0ROdTJmRGd1cXo0UHdwbG9ZU1dGbzR6SFlCcndlM1JNa1dpN1VzNDA5?=
 =?utf-8?B?YXUwWmNFMnFMcFhJUjNwcHh0eFhlTFgvMzNNZFZaeWxhY0szQnpLZWZTRTVt?=
 =?utf-8?B?ZmVTbzdMSzFmZm5vanBRZW9tT0NNeHB3S3k3TmFyV0NXN21nSEN1Q0xOMlJC?=
 =?utf-8?B?dDNtOGpuR1Vzc3VwTGx1Y09CYVhOb1NpR2o3c0wzMkdTN2ZrdmtvMWVraEJp?=
 =?utf-8?B?cCs0K0NvNkxzZkFDdCs5aDZXcDBFU3daUnh6bmpLU1laMzNyOGJRZG0yWkEy?=
 =?utf-8?B?dHhZeUpGRGhvZ3ZjTlRWcGR4Q1dYMVZuV2ttOGN4OCtVSDNURmlsYzV3dTJZ?=
 =?utf-8?Q?0jFKtInA5OUbO2rlxV+65LWhZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4961111a-98ad-4877-ef94-08da73ad4c3e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 11:02:17.3794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWEjrsPcffWMLB4apIXHb5Z6isj/OnspM9IIkNxyn9MNmfgZjtAsxtZzonLvrvPs+qygTmLHmdBHFNaB0v+DWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8677

On 01.08.2022 12:43, Xenia Ragiadakou wrote:
> Prevent header file from being included more than once by adding ifndef guard.

If such a change is to be made, please also adjust the x86-64 instance of
the header.

However, these headers are inherited from the gnu-efi package, and hence
should see as little customization as possible (you may have noticed
that we didn't even correct the bogus "Module Name:" value in the x86-64
header). While for this particular change I'm not outright opposed, such
an exception to the usual handling would want recording in the
description. Actually - at least the x86-64 header has meanwhile gained
a guard in gnu-efi, so that one likely will want importing instead of
adding a custom one. (I'm looking only at 3.0.14, which I have readily
available - there may be a guard even for aarch64 in an up-to-date
version, so please double check.)

Jan

