Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E016A45DE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:20:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502716.774625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfIJ-0005Mz-OA; Mon, 27 Feb 2023 15:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502716.774625; Mon, 27 Feb 2023 15:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfIJ-0005Ic-L6; Mon, 27 Feb 2023 15:20:03 +0000
Received: by outflank-mailman (input) for mailman id 502716;
 Mon, 27 Feb 2023 15:20:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWfIH-00052m-Tv
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:20:01 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2073.outbound.protection.outlook.com [40.107.13.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33179330-b6b2-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 16:19:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7101.eurprd04.prod.outlook.com (2603:10a6:800:12e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 15:19:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 15:19:31 +0000
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
X-Inumbo-ID: 33179330-b6b2-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpUI80c6wyG8P9po8PoSKsSR6nqlsIV4VLfVRf0xN+3kTZQeBp2uS7lZChpZKaARqdcbFi2x0ixYt/PxQskMnES810djB4d3GPu1zi0Gtdn+yCWJboPHCqjmqLHLAoMpgkjt7OKX3+06cGc14DV2naWalPEhWX8E3+ob0fcvWCJfzE0tgOqo5xHhhM2xHJMuKsBgCTei+YCa5/q651Zo/Q9jkg2ck9K1ZEIyneeDGJXrhSUNR35teKHYDSEyXc2LsXidV2ZOLiHpwPQZPIuHAAB9MPlg+/6R2x2Dmx25DpG0OK1E491Jy2YDRPxmFvwyw/Zqs/jRsBLXKf3+kfvpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SuU/FIvvPOZbW+8xr9unHNx2CZukdMGge2w3DZNDZY=;
 b=kRBgyEpZjuMDc0gM/njQGWQwHTz9jkseDA+51xQMUJscJpy6gmbzmwO0GEKxSKUWi7US6F2hLxc/hH3MmKBSLSgj6abJoKZP3g4XicWz6k9QoITgCUMTdsAHdGJgnBkjvx6LFCTqZvbrPdgzCG6XBBi+ls7Pt1rQAJaC+vXePg2DH32z3fchf7W2oSQB4ssiE7qxQDN91aYTyJtWFAxZMS97MslhPMM2KyoZ2iaGUCv29bDgMhk1SmV2TNI72PxXhh65VVtEvisQykJ4eS16MI0d2SsUxtZTeZTc496Yl5Yy1Cpqw81eqYREJxJwHU7COHLNWvRG1ktUCUYToZaw6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SuU/FIvvPOZbW+8xr9unHNx2CZukdMGge2w3DZNDZY=;
 b=2wnAuYNExjLzuckwNgmYRI3eOj4bribYKjoOm0T9xcwR3lU0AOjEo/dpebglmdRRbem5Mab70tkrmiftrwSeo4yqRqjQXrfddeWqiVcLUyMzC0dVtVyg7B4r8xIhlZfOzn/v7srUZPdDCsKF4w2ieAUHc+AxYxA+jtJ6EFt5hbwOeQPQXJBKQIwtjG3ID9EDhvU0vC/GqOs3fipydc0f2zdEREqj2a+E7FZx7zIwf5j64wBl8vUbLPizMleBjVbpR+kmABQZNPRXV9FPLGzzCYNggrFlHbaVSFpFbxve6VTeIhT5Pemkqul0TSuQ2KJ2oA3YakLJIWhi2OtGDwjhZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a37cdfda-f516-2098-2b1a-bb8a69a049ae@suse.com>
Date: Mon, 27 Feb 2023 16:19:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
 <a145fbbfb166d9f6bd4859b669d23a1f52004b2b.1677250203.git.oleksii.kurochko@gmail.com>
 <fcd149ee-b95e-4488-c1c1-c2122843fa5b@suse.com>
In-Reply-To: <fcd149ee-b95e-4488-c1c1-c2122843fa5b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6a80d2-01a7-4222-2b48-08db18d605de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fok70gFPJuSvDDRjOLiaOr3WTw4tRKjU0olMP3H3erNo3BPecrEjU3+xqAIeKLEqLgBcptGd1pSXelNBGGJhkeDse7JDcqW0F0kG0cbn1kvAgR6+aGg18US+vjn68qNaXJs4hgojykaoYNnaSGpCboVhUxw8MvGGnk3crYHd7TsFj04zITHukvIwyg2MvfTZtuu7mMT1YZZWikmnG9cfsFoWL7T4TfMPG5aK1afLspprh+tjpgb1/N92U8M+WRrBsdrX4VK4hztV1Vt5SHiDqCRmUY2Nc8dsMb5Br3kb/onXmb2VyTG0NW5lyg01GYiE3Notld4YpSCkr5X6WYkjlXmDtS6vNqE2T9ARqgkcl/l41WpD3lg058H2UIASEimEBX7VCDR3AI0uSvVaBrCeZandptM6Xcz0LqQajGu54iqcbrRlUX/Yy1wUXttscNHg4VzNNhRs2yx8cKMwsfqb0tRqTtucIVY/IQqzwItYZuEkjUIW20DeOlIvH3YHaRMlhEPMXL8Cwfk9e4LPt6wy4OL1gKDwxo+nHPuWGjmXVL0g3iCBURyM2ZHL6TqkRrfKixDNr96h/mEDsgmU6Z9L+NX3LZM3pbm8YFv24+AmB9fcLaACcpfQp7ypa0fpzeB4kJ4ozpbViT9+AjXUBp9ynI5SwN/GW79955PYVwK3RI3n90A0MLFTY2XErPglBEiC2l1a71KMdfOnemul/V2TzO4ANd2ZbMWsBe/Ls0BJWlo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(39850400004)(366004)(136003)(451199018)(26005)(6512007)(186003)(53546011)(6506007)(86362001)(36756003)(38100700002)(31696002)(2616005)(41300700001)(66946007)(66556008)(66476007)(4326008)(6916009)(8676002)(2906002)(8936002)(4744005)(31686004)(5660300002)(6486002)(54906003)(316002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGhvZnVwQjlkV3Z6OE9SbFlobXd4YlVMTmdNa2E0WEtXQTg5eXpPZlZFckt4?=
 =?utf-8?B?UlZ5M2xiYTlEUW9yWEVGcGp2Y3FKT0R3bGZ1Z3czc2ZXQUJvL0tuWDVLMi9I?=
 =?utf-8?B?cFlVMUxYdzh6aCtjbElGS3dvdjZDQkNCZ0M2ckpVQWtPd0hqRXRSUEdCK0kx?=
 =?utf-8?B?TGliZlJMMGt5cUxjb3NNMXRCek1Bb0d6NWc4cnhmck1GdEVxbHIrekZVMThR?=
 =?utf-8?B?Ums1Um1abDRCUXNZSGdJUFlhRXlMT0FiamlRY0V1aTVXelBWZUp0RXU5Q05y?=
 =?utf-8?B?QllUd2pFVlRtcWk0MkhKZzk1ekdGMVF1YXNPY1NRV2RvbnZFSzlIa0MvSXBk?=
 =?utf-8?B?aUI2dGdqTnlLTEtKN2V4ck0rM0M1VUo0TEFOc2NidkNZekY2c3JONVQ2VG1H?=
 =?utf-8?B?ay9BZUpWR1dJWlJDMUZoT0hiWWpOZk01SlljTlJKOURFOUtiUVZYR2ZtTFhL?=
 =?utf-8?B?dytnN1RRZTlXTXV1N1dTTTZpdFlzUk9FcVh1blM1TDdlUmllVlJOdlh6NXBQ?=
 =?utf-8?B?dDBBMWdsbll3QnRQaEFkd2E3OFgwZ3JzR2RpVEhEUHBLbnRFa0RZdFlFVFZs?=
 =?utf-8?B?SWtxYS9aWFRkV2hROTBRS1ZibHZGWW5hLzJtZUlYaHNuM1d2QkhyYXpUNWVE?=
 =?utf-8?B?MWV0Yk9tc1VZTmhZR25CK2NiNTVXdkhjVmhDVFBVSU9jUDdVQnhFWTFISERU?=
 =?utf-8?B?Vjd1RFdRUjY1cVNzVm50enlqMEQxZUxMTVA5OW54aUhDdjFkRWJ5TGIrNEZW?=
 =?utf-8?B?NDc0MDIrdTBQam1iOGpRVlVUT1lPdnUyVU1KMGJTbnczazFwMCs2OC8vSHQ5?=
 =?utf-8?B?N0d0d3UzVldWUGVGQ25pQnZOWFVnSVZmaGp2cmZJRFAxMGdSZVNnQjVPM2JZ?=
 =?utf-8?B?YVRMOE5GdVhsWTMvY3RaRUx1M0h6QkxlOWVDZVlvblRIS0RIMjlzdWxYM3RD?=
 =?utf-8?B?T1RSN0xsREtyNnFyOUNCdEhESGNvVzNaa21jSk9wT1c2TU92NXp6K2F2NzBj?=
 =?utf-8?B?elVOSVRhendOc2lDT25rKzZYMXVqbFRCeEZUQnRwRk9TZTBNOEx2bS96Yzdk?=
 =?utf-8?B?KzFraEp3K2xlUGdYMTBKNTA4UU5KanM0UEhNUHhQNTcvTTQwMW1INmEwYVRo?=
 =?utf-8?B?c0dhR3FFU1lJMjVTNUtIMWU4c01RdFNDT0JIMGxwWTZMVUtlanlzT2NjbFp6?=
 =?utf-8?B?VHdsU05udUxsY2tWRjBYMTUwU1Z5T2p5Rk5zdVZnUVEyb1A5emZzMng5TGt1?=
 =?utf-8?B?K1JUZzUzcmFWMjVSM2RGcC9nQzQwRU5Zb0lIeGVkbHg4VjB3TTlGSmVpMkU0?=
 =?utf-8?B?QTd1bVRVN1NpUCtzOXgxSVB5bDlVRlU3aVJuamFpUkFsQVN3Q1A3WThuVzF6?=
 =?utf-8?B?Z3VzWEJ4UG9MaDdTT2hmRFBCaGdHNGt4OWdlaWsxaGFkWVNPUU1DbDdZSHFv?=
 =?utf-8?B?bmVobEVOOHI2YitaNWsxTCsrYkRGakcrZ3QvWmFoSjFhNlpwOGdvNm9IcDYw?=
 =?utf-8?B?MGNBQW41eVdwTjJUWE12ZmduL1BwbFdpM2hzUWR1SC9jTDArblptaFFHR1M1?=
 =?utf-8?B?Smc4eVFjY1RHUUVrWUgvbTJFM0NaWjFkdk1vTUJBV2w1aitRQzVhc0FRVWxx?=
 =?utf-8?B?RFpSc1JxWC9GUWxxZzB0WEZ5cXU2MlpvQStFOW9JN1JJUXFVWHNlVEVrNXd1?=
 =?utf-8?B?bXBpT2NSZXdqUHNvZmdFY3pUY0lsbEIyeWVBRzg1dkI3ZFVLNW44ejJpR2tm?=
 =?utf-8?B?SDBhakt6cDRIcytBT0dsWlF1MEZRRmhLZDlMeXh6dXJQOXZoYzgveDNHSmlL?=
 =?utf-8?B?OU5KdzAyZXVxbXZTL29Sa2diUWxxN3VHS3RTcWtvZ3BqUEp6bTIwOHl1aUJ6?=
 =?utf-8?B?M2QydktOWGtySjhkU055UzVmRTFPTVVoQkp2NEZmZFZkTzNlcDAwNldTZC90?=
 =?utf-8?B?VUxFc2paRS9FRERCT0VnNnJBbEkwcnhXakdBOFNYNGN2ZHVuU3AzQTB5RUhE?=
 =?utf-8?B?N1crTVpzZlRsc1JMekxDNGJOd2lrZ0hkdTBnU0lSZjFkU3FlaDZsR0V3bDRy?=
 =?utf-8?B?b3d1WUU0SitCbXZNZ3hoRGtraDNQZUxRbVg0ejZqNTBQU1RLMUpCZDZCSFJM?=
 =?utf-8?Q?FHfOxJqhGUZd42kNJ90WWt9uT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6a80d2-01a7-4222-2b48-08db18d605de
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:19:31.3101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDCQWo7sQQHGGm+hcSShnv+fdaPyxaXA+f1YYeTa4UTyi+NHmcTvBmeiILYL4XjJjqyQ4KtNudbs8I1jSCj2Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7101

On 27.02.2023 16:12, Jan Beulich wrote:
> On 24.02.2023 16:06, Oleksii Kurochko wrote:
>> +static void __attribute__((section(".entry")))
>> +_setup_initial_pagetables(pte_t *second, pte_t *first, pte_t *zeroeth,
> 
> Why the special section (also again further down)?

Looking at patch 2 it occurred to me that you probably mean __init here.

Jan

