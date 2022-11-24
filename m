Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFA06374C7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 10:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447888.704507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy8C6-0007yf-Ak; Thu, 24 Nov 2022 09:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447888.704507; Thu, 24 Nov 2022 09:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy8C6-0007wo-7K; Thu, 24 Nov 2022 09:06:54 +0000
Received: by outflank-mailman (input) for mailman id 447888;
 Thu, 24 Nov 2022 09:06:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fS9R=3Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oy8C5-0007vT-Ca
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 09:06:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7d00::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5596d4e4-6bd7-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 10:06:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9392.eurprd04.prod.outlook.com (2603:10a6:102:2ab::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Thu, 24 Nov
 2022 09:06:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 09:06:49 +0000
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
X-Inumbo-ID: 5596d4e4-6bd7-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aF5jYbU7BD4Um5SCzIevs3VWhHp3a0LxvWuEOUbv0OlgDipSp2ltT0u+CtJxsgV0+pEdEoSXdQl1drS/xJdcPpGK7P3hzlMbGdywM5NZGQmlruKr7HFNqstmmDRtPczleTg9hFC5zhOi5zWsDfOlRLXzWahAbIDFPOBUVSdmAUN+XW9bhNThmMMVl97c8+y/ORdqT6TYXxvljdBdnsmfocrcXlJDvMogg7NrhKch7c1NM2H12sC1BmE0Nuo8YiWCkvwAxHRH8Eh9mlmYR1TjWenDxEnxQNm1fM7hp+r89RypmSFjpDku4HwWT2qvTmJIei8EnTq2vJys+RK8ebmssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlgS9y3dPfl/htubr3kT3GwI+dfAQ+fglh8R0sG3A+M=;
 b=dZiYU1wctHEuHZPuY5AebrPXrDpdRFGTnAHjlXLf5/SYwtdg4hpnevT4nI3gNXyIZCvu7ngkgU1fvnerdgSatLGaa0UWeoNeWoTscPTJ9bXteQOzQA3YoCoRIfXKON/6cc6VqTAu77gqOtzuLInfVg2BxwOXzGf+OCd/AByMSetdyX/Ev+iODA0oGbEoy3mgYp/lxrRYD07+wsZQ/31TYXy7roqpS9X03iNbhoCCNPEBfumAec6WtKhT4LSYxrR9xxWogS75ZW/uRoOQE4FpJ7tWflaqIbKlEiL5X5i/Z/gHPXvi5HU2/G5quEQQxWdxzGwGYKthwxmyEVQh9lsMuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlgS9y3dPfl/htubr3kT3GwI+dfAQ+fglh8R0sG3A+M=;
 b=IiZqANoACA1S2HO2iB2ZbA5EYdBLTNPxQoOk9L7YKWDYkSPVJ+MsutijDcubFvLYySXng7nFkL3FUtyjQjcX/in+mOgyr6jdzqvOpSZ5jLS8oGWsuPatQI1ehnsnu1xgJyk4S4pJP/ANIxay6PewJUpdxEr8jbTuoRGgtRpagql7rN66MMJGYVbogUQIEMqQa4uRQexx0kHlj7lvehzSzPaDSPAjLV4s8dykcrXHVJ7pA3i2VHIl5cvOIYnGPHJo49PFNikCyWPoqY2MwjL3nC491rWeIt/YNBBhC0Qk96DU+yHSlW6JOjiBrXtykihs+lh3f04P6k3GmJlolj7VLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c6fcef00-1d3e-4365-acde-092421d5a3b9@suse.com>
Date: Thu, 24 Nov 2022 10:06:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
 <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
 <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
 <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
 <Y34L/MwSFGUsSe2I@Air-de-Roger>
 <351a6e54-8002-aef0-993a-c6b8bdcc1e8e@suse.com>
 <Y38ugExH9uGdw83a@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y38ugExH9uGdw83a@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: e2af263b-fd6f-4f87-c8cd-08dacdfb38a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1IgOly/CYCDPXQRdhtQuYcDtuwMwAjt16+qVBCn8dYTf0ckdZTbfe0aAv3XYFR84MsjsiNFmfd/+DO1EbUNao3lSuVrmQJVPYOlDU4n8PtJhxRcUdPsLevqRcBrnFcjmHT+eAHVVWGXu8ADv1EpTfn50w1FQX2MjNqsVDDSrOfAu2TIgaXqS/205znd0nBkVa8AqPaUmhnz7K0KWQYnHkXQhPl05w19VxIaF03KtOeu+BK/MrZzjWiYrMduHQKH9cfeqFba6hPhcUGGRxtnNQqPV31y9uev3wikdqwt2SNTVXvpc2caWg2m/GTKD7qlU1IamTXByu/ho+32MXwVKDlgBHCgOv/DovVJSXToaZg/9J7U1eG6Cvj47MXgm7WPwSeuxlRZnEjb650u7qJB2YAkcztF0uBgkcO78eg4JGs1oLnm6fJVfRw06zjglAFOpWJeLejpuj7ASwLGneWOd74PRko5OvJm5lb+ngHMerc0+2LjSPt4BMIXWkDhSUnmtiQcOW37H3+lTT8Crt7CJeoNrxxc40jJblEzYxJzDtCZ0n6MD7ctBesIGP0hRHiM3VsA1aRKR9/gCd2bL7wEln3PoKibfMdQ6p/pfKfEHkXMYpS+xZ+HCsHkrS2htGA3vwzX6GHB4gN6sgBFc/9lTbpIT1TjT/35nmok6zsLliCfzeQQ0t2XyqeWn5K4GmpDhQ7S4BVCqmI8iMcOTX/ILNBqfuGEW59NbfYNccPq8dBvbvMNg4oSklyQFbJoxVPWTuprbqKG7Yq+/M0wry9D5Jg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(36756003)(6916009)(8676002)(2616005)(66946007)(6512007)(66556008)(4326008)(5660300002)(41300700001)(66476007)(6486002)(316002)(966005)(54906003)(26005)(53546011)(2906002)(8936002)(6506007)(478600001)(66899015)(186003)(31686004)(4744005)(38100700002)(83380400001)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWZKQ3pFVldqcjlraFc5cHhMcnZTNEtDcUlaUUp6bm1TeVZGaVBxRHQrejVl?=
 =?utf-8?B?Y2lCczlESm4rbEVqbEtEeXZiRnAwS0F5MHVVVG1ObndaUUFJd0FCQ0xXTGNz?=
 =?utf-8?B?NmplM2Q5MVI4OFJTWWlPREJweVYxZDNNU2V0aXBLc3VhNy91WHVuZFJQZndD?=
 =?utf-8?B?R1lZTkdmbXZTNFhZVFdBMVpxb3VmQnhUTlFCaHExTkZRTFRHRG5rSVNDbUlY?=
 =?utf-8?B?VmY2aFYrQnpDTWhxdGcremsydkZVYmY5dGRZOWxscGJkVkg2K2xlKy9GN2Iw?=
 =?utf-8?B?U3E0bWF2Mmd1NkRhVktxYUtIejV5elBTeVVJL2o0SWZka3dxeDFsZ1cvaFUy?=
 =?utf-8?B?dmVZSXFrTk95MVkyalFrWHdKeHhwRVlIakxwQ1NLMldHS3JzMzFoZXBtdGhu?=
 =?utf-8?B?MzZ5MytOVUg1b0plRnJBWDZxbXVxbUJKdUFFMnJnREFTRGZESS9lMjEweHdk?=
 =?utf-8?B?eUZHdExUcWZIM3EvVkdUd1k5aDVRYmhOYzBHdWNic24yZjV2bFJxR0s5cUM0?=
 =?utf-8?B?cGRhODE0VkZ5ajdRR094aHJOSlRwdStIbnU5K2Q0OUZSeXh4NVZVSjZIWVdH?=
 =?utf-8?B?ald3a0toUE1BRXlCajA3UGt0SEd5N29URUVRc1lnSXdJc1FhT0Y4K1RtWTU2?=
 =?utf-8?B?Z2Y1aDF2d3RjS085NWxrOEdaUnl3ZVRRU0t4Y0RhT2N3TzVibnM0bmpVQmhm?=
 =?utf-8?B?OUFTRnZMZk1SdFlSU1d0ZFZPSmxxNmhLUW8vVHljdzhDLzFmU0FXUVpsUlN6?=
 =?utf-8?B?RlNraGtKSE1ySVJkYWhXWDM2NHZaaVl4ZFVpSUN4WWdsaWU5Ny8ybDdSaUdQ?=
 =?utf-8?B?Z2NhSXhtaVpESFhieUEzNnVxck85SDhWZE5RK3dNWFZKWkpTYnVBNkMySHZN?=
 =?utf-8?B?NEUvSU40K3hqWnR5NC8vbUM1bGRjemtiQjZmazRrcTZ3UTUvQzJBVFlmeXRo?=
 =?utf-8?B?KzhiRTZjbUpSVis3RVFpUDZ5YWExRHNLdXVlb0RsQlVhYy9ZemFkM2RPSldQ?=
 =?utf-8?B?bFJzdkoyNUpaYThEejliWW5MREtqaUI4aUp0bVdiS2tWZGJPOForZ3NpL005?=
 =?utf-8?B?dXRZYXpMMDgrelhmTkFJUWxUblYwZk1KMnhKZ1IrMGtFUnlENVE0OHVBMWYw?=
 =?utf-8?B?L1ZvallxTXJxd1RIdkRFZmtmRE13MXN6T3ZyR3J3Ym5sVGJXOGpVU09iRkR0?=
 =?utf-8?B?dUswaGIyeCsxVHVRV1kyMm1ZeTAyVUU3VEFJdXZyVXd5S2hvcnNLbW84YVN4?=
 =?utf-8?B?RDZ3eGw2cjZLZFVGOVZqWGZGcEh6Sjh6TkgxVjRUSlRDRjUwZXhkMGpqaGVk?=
 =?utf-8?B?MzFtdVMxbjdvK2lUbng5K1o2cmZjbVJpUXF0N2pHNnV3emJMbFhDdjEvbEVQ?=
 =?utf-8?B?TmpzQmJERm1sS3g1dkdYRjJjZTB6R2M3bTB3ZDA2Q04xbExTVG1rOW42WHBx?=
 =?utf-8?B?dDZKaWhnLzVoTTZaVXBwTmVzOWF0Z2xyZ21ueDdBcjU3VVliK3lCYmdNektQ?=
 =?utf-8?B?RlJvMVJEY21SQXpJTnFtaGMxZW9CZjYyWUlSV0RNT25FN0pBaGpZeFRRZHZF?=
 =?utf-8?B?WkR1ZlgvV0t1Z0hxMGMrVG1JaG1sYW94YnQzOHFvRHJ5SDdmNlBIaGs0ZHYy?=
 =?utf-8?B?c242SjV4OWlhOC9UcTlOZlEwK20wa1dMYllaZ2IyWndtUElpcmpvUTBSRndu?=
 =?utf-8?B?ekxqVW96d1JsenlxcC8yYjAvd1pGU1RYbFFVL2JOdlNIdVdzNE1hY3R4eWtY?=
 =?utf-8?B?VWsvSkMrTUgrVi9Gcy9PV1FsVG5ORmszZ2tsZ09FTDJxWklaSWU1d3BIZzM4?=
 =?utf-8?B?eEdON1JpMTRXVGpESnI4T0piMGNIY2NKWkFkdHcva3lSWVdIMkt4aktzcVc1?=
 =?utf-8?B?cXFxbXo5U3NOUVAySHVzZCsrYjFjSXp1b2ZJck5SM0d3MTlqdU9tZytobVZM?=
 =?utf-8?B?MmlUQk1sVGtmaVF6SW1qL2hlTkt0L3VRTGhLeS93ZTZWVUh5MFQrM280aVJW?=
 =?utf-8?B?aFI1TWJlSTMrQjY1WXpQaHNMM2RGMncrK0MvdEZlYkpheGZRZVVRelJKZysw?=
 =?utf-8?B?Y0FTSEVGVkpXOWtVYzBETEsydHF3azZkWkpmMTh0ZXFLOW1QMXU5U3FoQ2ox?=
 =?utf-8?Q?/qWTUdaaaYxXtB/LJP9vbIO+T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2af263b-fd6f-4f87-c8cd-08dacdfb38a6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 09:06:49.8223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FuQf5Tjz2CU3/lSKcBSY9C5hUkGu2CvcIJjmzpP3aEj5NJP7iY3qrE7PWfJhSzbgAzke5eqlO8D2ndZcxpn5pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9392

On 24.11.2022 09:42, Roger Pau Monné wrote:
> On Thu, Nov 24, 2022 at 08:59:00AM +0100, Jan Beulich wrote:
>> One related question here is whether vlapic_do_init() shouldn't have
>> the non-architectural side effect of clearing evtchn_upcall_pending.
>> While this again violates the principle of the hypervisor only ever
>> setting that bit, it would deal with the risk of no further event
>> injection once the flag is set, considering that vlapic_do_init()
>> clears IRR (and ISR).
> 
> That would seem sensible to me, and was kind of what I was suggesting
> in:
> 
> https://lore.kernel.org/xen-devel/Y3eO0bMKRPYJc2yQ@Air-de-Roger/

Oh, I didn't read it that way, as there you said "when it is enabled",
whereas here I'm suggesting to do so when it is being (re)initialized.
But, as said both above and in the reply, we'd need to be sure of the
resulting behavioral change (kind of an ABI one) being acceptable.

Jan

