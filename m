Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5707DBAAD
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 14:25:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625102.974023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxSGN-0004J8-Rx; Mon, 30 Oct 2023 13:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625102.974023; Mon, 30 Oct 2023 13:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxSGN-0004GO-Oj; Mon, 30 Oct 2023 13:25:03 +0000
Received: by outflank-mailman (input) for mailman id 625102;
 Mon, 30 Oct 2023 13:25:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxSGM-0004Ex-8G
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 13:25:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b81f45fb-7727-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 14:24:57 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7016.eurprd04.prod.outlook.com (2603:10a6:20b:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 30 Oct
 2023 13:24:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 13:24:55 +0000
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
X-Inumbo-ID: b81f45fb-7727-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMPzl8IG0ZyPSFXID7fupXxqzpRvod9KdyDj1e5E4kAmkP4F/4h5BW8o391wwwWioqyavkEZtLL2PnQAzYRyrIDHSSRCuyJpSck59U8VRM0rnP8Uacp5IhHAWia6XWlGJBPaFpdqHO/hDy5/9w5TNzyfjquYfj3ppZfk82jFSRha5p2nt5tS5pqST54ODphmRucyrQ3oAX7XHv0kuHH2ftyEVBVElBaja3iVebuPAkHhkSaIPfkjHw4mAz22GaykcAwm+TmzMDlRTiE/SqFvCQZhEJrM7IRsYYmDmv9JbvJ1G2rl6xcfuU+wqoJOGRVQH8AfXzzOK3jL7K0TsStz+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNh4ROXv79CnE2jtd3XjBPdvjNoTnh7ZaDC1XhyUUZo=;
 b=YFFeQYjeIzxeSQyk/Z0ga0aJismotuKQtc04iv7kzePRgvcfk1ULoSV8VVeRHjmERuiAXVPiuNeIip3+iOtVNfVhE1ZWgC2r9ncxvPb9mfnQDZVRwA2Ga/i/GsSSs6tR4FT/Jn4byJo/f7PiTzeNKiscCcWKgQ7+muUuADFXo2K7Jfv9SNzdZEDtlXhC3IeOcq+0iSfmr+IL7dfPFMCtkJ3II5wwuy7CDCDEnClnZL/svd2mLArkJk68c3Ss1GbvN2J0kP7h7vAD5W279Y96NHeIko2UMlrat6JVy6FvpWZF+X4z+R/nhdN8QrymTCfV2P4vXCD9TOPaYYOJIyHA6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNh4ROXv79CnE2jtd3XjBPdvjNoTnh7ZaDC1XhyUUZo=;
 b=NaphmTcKK14cLn21SgPMZBrt7Y9/cz3UM/PhYOGUVt4n6rcAf4ck8+uZgXjeOWztD1Y2cTAFIpl6nuqGrSBHZJy8CLszNbOTZr/QXuUT78fyn6pwMJm+Tk9W1dq+83SgcUO/IKd/86neYN+wFtWthx2x59zAIJCKNvUBW9cJ2+iRVvJ2Nzf98ktPEvkSL3ytYcvLESo4t9yT6MaA3HHe54foZqUlTezhegRvjO1Ad+QZEeiORYDPNwH1FxA0akJNateddaITRAnAl+niuubL7JBLSC10bpg7Axf2cT6mNQcq4xZ1Mnxm1rbWkA9IvKQgblzVruqm/ERqCem5MfFkXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b4f8517-43ca-a573-c88c-7c9097c365e0@suse.com>
Date: Mon, 30 Oct 2023 14:24:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] xenoprof: move asm/ include
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <4fda4793-6fdc-70e6-575d-062f72c8c0dc@suse.com>
In-Reply-To: <4fda4793-6fdc-70e6-575d-062f72c8c0dc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 588f498b-416f-4d9c-2880-08dbd94b9afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q7WN/lNZCkD99+vEZRVx+HNxXen8Q/jeyUFUCHVRILvrGeOeB2h4Tl17e0Oa/66XzsD4fSghsheYjZ3LjQCt/CHnr/Ixrtk9l1HDA9UghFm2eH2NH6KT30LNcOfAtzgEzIlW1DDPP/UmzN1iPcVfE2bBBDQsCPucs+MgMdQhgSmYcmMCPZsjMaCyw/X+udz66OxPDze9x9gUEzxY1bTBMjn7fhJvf93YrAysRWpwPX3+qYGcO+Qqy1/3p8ysc1B15DiHx5NTfQe529XibCWP45tzPHd80vp2m1AX+UKb2yQEE2sEQLCNh86BgaUaraV9DYGEB0MVW7sGxLI3UCXKg26tdFpf8fI6eiMRl3qvxmAyXjhPJBF3pUadfq9FgZeLAiwROI3/xUIX6yMXLogwbYPBUbzGZTk2lY1SNpqoN571TuBf2zJRZFBHdkj3SR70f59wZtsZGZT3NbKaYvm9wRw195/iSKV5ljz7P1XTy+a7pfw+s52hvE/eRHi1cvS9UWm5jDiM+1eulN3CYmUqYPGd+mx2X1R6kFcrq9FPQC9aGkLfCWjexXRGft+5TPPAr0DcIjEpoY4APRNoW5gJheIb3Ik+GQ9m8GyYZp18moB3p1T/7KVcISWtJybcNEruVQmn5R0OjLpUi6VKaucHbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(41300700001)(2906002)(86362001)(38100700002)(54906003)(66476007)(66556008)(6916009)(83380400001)(6486002)(53546011)(316002)(66946007)(31696002)(7416002)(4326008)(5660300002)(8936002)(2616005)(36756003)(8676002)(478600001)(6506007)(6512007)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y05JMXhKRUlXSEZGbW03YXFTSHB3TWhVK1ZmUnVKMFFWNFkxc0haV3NyNGg5?=
 =?utf-8?B?ZjFvcnJsV0tuOXNxZjVneTZJZFFxbEoyZ1kzakplQit6V1lkb21LRXpkNUVN?=
 =?utf-8?B?a1FKY2tPT2NBSzBudnJBYXZURTlHcElDMUlyWnZWaGQrZGNlWjR6WllGRnVp?=
 =?utf-8?B?NEpaalZvYml2Ly9Sa0IyYm5FVW1NNmtTWDd6R1ozK0ZSdjY4c051RFRnd2Mv?=
 =?utf-8?B?a1RldUJ1OUVUc2FuaGtqTmQ0MXNaY3c3ZDN4U3dyNUw4ZzROa0c1Z3hDRDI2?=
 =?utf-8?B?OTZyV0VPTWlRTERVUnJIUnZobVROT2VjNEhPNElrRk1ZVFlvT2RrTGlPbC9r?=
 =?utf-8?B?K3dUU3hWMVowMExWR3J4QVFyUERBbEZKbnFoNFMzUzJIaE1lcEJIWEl5Z0Zy?=
 =?utf-8?B?MExwSGdRbVNXQVBtYlBoZUE3elNnd0ZEOTBHZXo3a0U2eDRBdmplQnVDUHJw?=
 =?utf-8?B?bFMyZkR3NkdrTkIrZmJWbTNueTFXcGJLM0pJYy94QytaOG01NkI1aEM2Ymhp?=
 =?utf-8?B?NUN4Yms2YTc2TkUzaHVoNFp3OVk0aHdGSVE3Zms4MHJNK094UUhwVmF0UWlZ?=
 =?utf-8?B?YWl3N0M4Z1NaV001bU1WRGpzNks0bXZzdUJTQWUzRzAxU0ZLTnB3ak9jYXg1?=
 =?utf-8?B?TVRqVWRYcGN4YnF6azRWUEZma0ZFcTM2VTVFUEtkTEUzbHVkSDFucHc0eE1u?=
 =?utf-8?B?QmwzakdRNndQa05xeU1hc05hVjBaWTdWbmI2OUlvbHdJa2N6dnNUY0x5ZExh?=
 =?utf-8?B?MVZrTzM3OGNIeXRNMEFLbnJhTllUSkFpOGppWm1MUUliQ09TM1U0YzF5NitH?=
 =?utf-8?B?MlhpV1JuaDhTUW9xOTJONXRscTdycjJ6QThtbTl6ZUIyMFFRc08yZ3VIajRO?=
 =?utf-8?B?d2xxVTkyUVBXRWNKUGRScktrcE5mYWlIQVlIQ1Vpd3pWd2d3aGovSXNMMGo4?=
 =?utf-8?B?MmhieEp6V1pDMlJDVElUbGU5TTVQZy9BK3B1VVkyTGVrdURkRHB4bmVPY3k5?=
 =?utf-8?B?cHVlUjFqVWsybkk5OUxCRTZPNlhTd0xTNS9SRFllaXgzWVRCL1FNSTNEdENy?=
 =?utf-8?B?ZmQ4K0RHazhUeXJUaTQ4VEZEQmNTMDR5VU1FV3diYVlLS0lIczkrOUgxRDRW?=
 =?utf-8?B?OGR2aFY1SDQvT0czOHNhY1YzTjNYVkd6b1JrbFUzbDdHd25OcDVrckpnc2dx?=
 =?utf-8?B?VituS0xXampxSElRekYwZEw0Z0phS1RmNTZHVlZUQnFHTVBXMVVDb0dvYWpY?=
 =?utf-8?B?M0M2ODNjRlVQY2pobUw5RTJydkR2UVMvenNWUHRpYnBqT09pWXB1YjhLUFU1?=
 =?utf-8?B?d0N6UU5OVExHeCt2c09OV0Z2SnpSam1nL0NPd2QrTWVSUTNmdHN5VHNkZVZU?=
 =?utf-8?B?MFp6ZWxNYzd3bDA1TVdsbnladmlRc2lXb3AzSGs4VnFzb1E4YVg0dFUzb2x2?=
 =?utf-8?B?Y2M5WE9VWGZrdjlTdzJFVkZobVJkL3lQY1VaUC85bTRIU2FLaHRCbTBPOXJE?=
 =?utf-8?B?alZjYTJ2MEVxaU9mOUVKV05VRVhpSnliY1hMQmtaeHhvK2I0VWZycERJdnRN?=
 =?utf-8?B?UlhScitpR0NudE9BMUZmNFZHZnJLNEhmdmVZaEhpdzVDc1Q2Tzh0R1BvNGtP?=
 =?utf-8?B?Zk1OL0RLbS9ocWpBZWtOaElHdzdzKzVuL2d5VEoyYnRxaStWZ0lLYUhzb1Br?=
 =?utf-8?B?L3BzT2dISkcxY1lBRTdEMExuM1dRRlBzMjByRzNsNEtkUWJ6NFg2VDdSZmJX?=
 =?utf-8?B?UGhwS3dhK04wcisxNldKc1JjclVoNGNweFoyVnVJTTN3NjhoY3dTUEFsTjV2?=
 =?utf-8?B?QXJpSzJDMEZGaE5OKzJMeUhrUkpFL0lHN255OHZ3dW9NTWtCVGRRTnJrZlFo?=
 =?utf-8?B?UUUwQmg0V0hQOXpBbmsydjJIMVNieWdnVEpMZlBVbFllZjNrMWRld05Hem1s?=
 =?utf-8?B?UDY2Z1dJOVE2ai9tekRqcmZLSU51bUVSMkFiYXUxaW9jUE9VUzJ2MG5kWk50?=
 =?utf-8?B?Z3QrSFN4OGh3WUFDbk5CS21aenNMT2VtbU1aTElWQmZ2TG9zU1NobzFnSDJJ?=
 =?utf-8?B?RDVITktyVytEbEhXSkdMeDdQd1MrOG10NzE3dVBSTzJGUHdGMUNERGlHcnY2?=
 =?utf-8?Q?9pgcef0bAi0pt41Zhlx7utqc2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588f498b-416f-4d9c-2880-08dbd94b9afb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:24:55.0052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjrTx16ffQ7hbX4xEcKZ9rTSoiKxeBUOOvirDXn5/pb/bEwTJbkXm4RW+Zj29nBq9zH29lciXLcPal7mgutOPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7016

On 30.10.2023 14:19, Jan Beulich wrote:
> There's no need for xen/xenoprof.h to include the arch header when the
> respective config option is off. The only compensation needed is for
> svm.c to explicitly include the arch header instead of the common one
> (matching what vmx.c and traps.c do).
> 
> With that Arm's header can be deleted, and neither RISC-V nor PPC will
> need to introduce one.
> 
> While there also adjust and move the (prior) inclusion of inttypes.h.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/arm/include/asm/xenoprof.h
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -#ifndef __ASM_XENOPROF_H__
> -#define __ASM_XENOPROF_H__
> -
> -#endif /* __ASM_XENOPROF_H__ */
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */

First time that I notice a shortcoming in quilt that I would not have run
into if I used git: quilt can't express deletion of an empty file;
arch/ppc/include/asm/xenoprof.h wants deleting as well.

Jan

