Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCD662932F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 09:20:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443806.698563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ourBK-0001Jp-9M; Tue, 15 Nov 2022 08:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443806.698563; Tue, 15 Nov 2022 08:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ourBK-0001GO-5z; Tue, 15 Nov 2022 08:20:34 +0000
Received: by outflank-mailman (input) for mailman id 443806;
 Tue, 15 Nov 2022 08:20:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ourBI-0001GI-KE
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 08:20:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d8f4694-64be-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 09:20:30 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8530.eurprd04.prod.outlook.com (2603:10a6:20b:421::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Tue, 15 Nov
 2022 08:20:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 08:20:28 +0000
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
X-Inumbo-ID: 5d8f4694-64be-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5L4dZ6qYj60G0j129Wqb0SvPT+WySyz7baDw0CcHAIsBUS4E38By588TfJeh2Zn9CS2cUEX1JhMBKLsmJIebcXGW3ufjhJvyasSydNSNCcuS4+9lb40ptFvLE94nHnBhhTnBiADzb3tZcpyLhBziuGPI4k4OpsXl3mNPX0DL/zIUogNiP+LREyUHZLYQAHRi40S9lLq5OLqZATlVChfGDfRPNFsaDK+rfDZVJixZ0rFJGBxysYANMOhnMkycRTPGPhrHll7ZNI+LhpexyGNElxPKJq7YXwZDSjK6tLY1j70Pl/tLyH0e83S6RBt1czvCBkPkOoS42zOf6YS3dsu/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NrMQWQpsJWf84Jjz+ieaDYt3V1RLtE/GIc6r42vWaE=;
 b=Y8/DUcHiP9Ip7f2yyQAPkNH0eB74Khz/nzCU8oGjiZdUY9XbvQkQ2sNyYoVR75ZbB0MvCXpPZS8DJmPcPlg/dHrgewjN4VRlpCsVE16hHTpT4Jlg1pmxR8ecPmJevhRl2SYHZWe6WBawJ4wD1ec4z1hwtX3SGVeyGBlLpMEqcUXtTZaKjT/stBPm2jI++JG9aaIjwMduHJmiuPfF0Vp8co+/vb1LC+PKqZa/5M5dt0LkpxmL6THhrsF4KTrGIbhWXize8Bu1dqZxQlk2TQuUXint5fAoSfAsMJWdZdeJz3/JbchJmzZ3PfjQAz4pPzfhTEG9qf65u22kcck4BBP+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NrMQWQpsJWf84Jjz+ieaDYt3V1RLtE/GIc6r42vWaE=;
 b=1qLfCUqTqd20RoNVBtHseYY09hsHe91JQFBCoYuTG+BOVLlcD0zVT8FzkOjqQT1tsV7yJpwl2NUTsx8e/WVoRwv2xkFKmJARhVf36PALEthpIjcMYwnfAkiVCRqc4xzCkLSSE+i4gR2+hQWBAz727QOPMblXmSy1jomta7Idk6nf/kofn4X055Jgm+gIfItfYrg4ijXfCNvxsXSZWyWjhnjuL8AD70snARjNFF9nxoLVU21qHddsnyFiNt2LWUkDXAuh5MrvAKMu15uhBYpO5mAIbH50x72GurniwcQufydmf76eLURLMB949SBftti95B+0tTizrZFwl2ou6VXx6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <871defd6-be9b-4e6e-9347-3788265267ec@suse.com>
Date: Tue, 15 Nov 2022 09:20:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [linux-5.4 test] 174765: tolerable FAIL - PUSHED
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-174765-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-174765-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 76146dd0-0a19-4cf4-6135-08dac6e2414b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ygqj9utIT5zPoPkyMezUYu2YEtkUGOnwfv5FwpJ4ZP2+Xi4h801qoPjhwz2p98SlztOICx8bDos1SGuDamMhS2WhPzRc5Kajf9LytaTbh7JoSAaIOoy5ppq05morP9tFM14qqX1OelHr75zwAQ7glvXZnnnIBVGYaxeaCztQj0V3o9e3klI6hVaLJXyVUMbEDk5Mu2cn8R3krXfKOpKoaCC4RTpTp+DTLY+gSr9ZW/DEqqUbHRsEvKqg2/AjCjBJ/J26NytsZZHJvQmPiy396W/MOZWKaGVqOh4bmhIABSATU+ysNWhmQ6sqjPVgil+d7wF8FrNr1J7Z3GxRPulhEie4sUN5em8DVWnA9L1NSet12O66fvk+qMFcElxpXL+eZ3CeHkFQQ368e14Y8hVOuP1Qsx9L31oSCLuHFKbL/xLm5YSmccdRfA5cDguJuTMgclVbPso96JnSRIY1AOJXxO0USNBLH3MCeiqpNBzL3CCwL55MY61k8Ip8lMM2LNDEw64q4cEbm8tDJP0m44Qapb/d23TSHUyqQzFyD6+CoYMJ4wKejcz1zlJmX3+BN3CFfmzb/bMev+wVPEkKjjxHGo3iOFwibMPKfsrMcFGga6l9q87TyjLhHOGV4CE0xLmk6fpuh25l4NFFMdiLZyn9W4niqsaExrEX0Pz9kilcH/7iLZXLGq2xePnvrisaAkwHhH7IwrI9Ym17zh5ukdSPBX84p3i+uaG2GBE7mUx3JJ483ps4zpKESurtwA1wjtXDKxpmGhzKrcZKCemTKS3VgCd2oHwIQZznGrf1b7vOxNc2kxj+R5tnk8Rm68LQcU0lRjXfPC89Q4EksExZxgcm51orvqm9Z2AezYanYhvYQ5U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199015)(31686004)(86362001)(31696002)(36756003)(2906002)(8936002)(38100700002)(83380400001)(2616005)(186003)(6916009)(316002)(478600001)(966005)(6486002)(53546011)(8676002)(66946007)(5660300002)(4326008)(41300700001)(66476007)(6506007)(66556008)(26005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2xDUGhPSmg2dEtUZmpxZ0dZK1E5c2E1RnRXbEY3bStSMmw1MEZFNTVQTWFJ?=
 =?utf-8?B?NCtVek10angxdWV5SDRWcTk3L0N0d3lUdjRnK016eUJKVTljZE04RVFIQzFO?=
 =?utf-8?B?TC82SVJsOWFjUFEveTZVaDlaUllUdndkRG52TGlmSWR4b3R0Tnl3SHdYQ1Zn?=
 =?utf-8?B?ZndYNTgwekREOEozcjlrbTZNVElONDRwTnFOd1RvWU1zRjBMMVV5c3M5T2Fo?=
 =?utf-8?B?dmlQckZVREhPWnhYcDRGVVRTNUZUMDVHci9teFZSYkJoUmxSRkpSVG1kUVRT?=
 =?utf-8?B?bElKWm5uaVRsdUhNZ012M0twRlF0YjNQbm9xaHRWYi9iS0ozaDAwS04vOTA4?=
 =?utf-8?B?ekRjMWFQbTVnd3B0YTJjVWtsT0lqaytRZVZvemZuQURqdG1FRnBGekxjeU9N?=
 =?utf-8?B?ZTl5OFhGZUpUR2VXa1EzY2tHamtEVU1JeEJQRFRpUTNYM1MxU0U3c0RZTnFk?=
 =?utf-8?B?ODRuSXprT2E4VUN6bnV0RE12TjFYc1hQbitYMHhrdDUxckp4YkRweTJUVWEy?=
 =?utf-8?B?WS95VDEzeW5RWGk0QUpBTU43N1Z3MTk4Y3FGYjVTNkxKdElhdXEyWWFOL3JF?=
 =?utf-8?B?YnZIb0ZxdHo2cUN1RlBIYy9yMUVOcXpZN2F5SXZ4RWVBK2hCaS92OVl6S1Ez?=
 =?utf-8?B?b3dKdzNOdGFDK0Y5UjloMUxyZi84WE5hN0R6ZmE2SThrT0RmeGl4ZWx2SEhL?=
 =?utf-8?B?V29weHdFSW5GdmlwZHV1VURoU3U1cURpNkdBaWZZWEZnd1pYOE93N3ZHN1M1?=
 =?utf-8?B?MGNUM1JDcm9WUnl6N2dGS1Y4cFRYb2JPZ0p6S0V0dm5QU3JLWnQvWCtRSCsw?=
 =?utf-8?B?RSt5VzBzdlVHQW1JNHlQNXFVbmFWTUFoTXI3bks2RWxiK080UC9VbXdnOHp5?=
 =?utf-8?B?UDdabEFkU2tBRFdEaU5VZGRIbTBWci8vaGFYc0laYnJMNkdobEVSc2FEV1VX?=
 =?utf-8?B?bFQ4YndCZVliZ3k5L2NkOUtjWVVqdVRjampaaFN2cWVuL3FGN2RZWXRtWDJz?=
 =?utf-8?B?S3I5blVKYVlWZzVLdEhENFVPQzhmQWNKQ1FTWHFmN1AxSGxGSC9UblZmN3Jk?=
 =?utf-8?B?SEJUd1VYa25ibWpmTmZ2YXhqSjJKY0VUNWJlNnJhRHJ6a3JXeXF5dmRMNUVQ?=
 =?utf-8?B?VTV5bTRVcStib3loS3laTGtqK29JN3FvaVFCeCsxcURLNUwzTTVLSko1T1Aw?=
 =?utf-8?B?RitBTGNGUUl1c0tuT0Y3RFhOM3NPU0lBa21UblBFSkhWSksyV29tcm4wNlh0?=
 =?utf-8?B?bmxNZjdqWnJmR25GVmUvVzZCOEVveEttbld0bUxOK0hHWlZKQ1ZEalFvUmw0?=
 =?utf-8?B?azNjYVhrYkw4QWw0YzFNT2VkUzdBNmNlQ1NCNHJhWDJIWi9IcXlNNEJncW8z?=
 =?utf-8?B?Z0duVXh2T1V4akFmSWpWQjBFUVZ4ZjFzb3RaL0tpbnhuWUVwQnNEWTZ2WERo?=
 =?utf-8?B?K0FxcGJiSU1WdVkrK0VHemx5ZzZWTC9CQnVVaUdyLzB1cWZaVUc4Z0haekgx?=
 =?utf-8?B?eWVrUXI5SURBUHk0Q3V2SmRpQjZWUFBQVUhoUEVMRkJTN0NQS1Nyb3Zhb3Yv?=
 =?utf-8?B?VkY2OVJYT2dEYUtmdUZKdVJ3b1hwREx1V1dSSkZsUDY0dUIrSlZWQjY5UHJP?=
 =?utf-8?B?WDlDMkhKN0NFVXNEcFErV25zd1ZaWkNiMEZ1dzczcTlhY3lvYkh0TnRtOGVk?=
 =?utf-8?B?YUJyMjRaRXpiZ2R5VEVXSXNGN1V0cW1ZeGpxNlVIdVYzQkFPaFRueHpwV2Nx?=
 =?utf-8?B?WnQ4NEFtNHhON0FRK2IrL3hjaTdhRFZLK0o3Mk5VaHEwcHBxUDRxb3laUUlS?=
 =?utf-8?B?NnNZQmhkTElDYTIxMy8rbVRCbFo0VFhtbTNYYnJZVVpXNHBJRERIdWwrWXRJ?=
 =?utf-8?B?UmRLY3dIQ2haZnBjY2R2c1lycDNXd0tPdVVIYW93dWVwNldQSmRXR1JHY0wr?=
 =?utf-8?B?RWVvUEE0SVlUcExDVkU5Nk5lbTJnazJIbTg1Y0txOGMyWmxqYUZuenV1dTk1?=
 =?utf-8?B?aW03M3ZNWkl1WXNkbEZ0Q3VxaVBINTJ4bVc4N2FBZS93MWIxbzJTSHhEZnAv?=
 =?utf-8?B?YkdEUXB0VHluUXVPTSt4eXFNZFdhL2NTQ0grZGMwT1g3VWphZDBzQ253N3ph?=
 =?utf-8?Q?L8L8BydFtoC5N44YsSAj8LsXH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76146dd0-0a19-4cf4-6135-08dac6e2414b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 08:20:28.7651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRvcSks2UMKlqBuI0khaSojHWdZ6HOtNr8KWXXzxa2uxSBEQrthM8vr2CSLmEIJPn+Fe+Rf9sJEhFChg9DSqOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8530

On 14.11.2022 20:09, osstest service owner wrote:
> flight 174765 linux-5.4 real [real]
> flight 174771 linux-5.4 real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/174765/
> http://logs.test-lab.xenproject.org/osstest/logs/174771/
> 
> Failures :-/ but no regressions.
> 
> Tests which are failing intermittently (not blocking):
>  test-armhf-armhf-examine      5 host-install             broken pass in 174758
>  test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail in 174758 pass in 174765
>  test-armhf-armhf-libvirt-raw 13 guest-start      fail in 174758 pass in 174765
>  test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail in 174758 pass in 174771-retest
>  test-amd64-i386-qemuu-rhel6hvm-amd  7 xen-install          fail pass in 174758
>  test-armhf-armhf-xl-credit2  14 guest-start                fail pass in 174758
>  test-amd64-i386-xl-qemuu-debianhvm-amd64 20 guest-start/debianhvm.repeat fail pass in 174758
>  test-armhf-armhf-libvirt-qcow2 13 guest-start              fail pass in 174758
>  test-armhf-armhf-xl-rtds     18 guest-start/debian.repeat  fail pass in 174758

Wow, that's an awful lot of recurring but not entirely "stable" failures.
I wonder whether pushing in such a case is really warranted.

Jan

