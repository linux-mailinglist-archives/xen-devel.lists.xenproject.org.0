Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5BE7295D1
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545787.852358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Yj2-0001x1-DQ; Fri, 09 Jun 2023 09:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545787.852358; Fri, 09 Jun 2023 09:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Yj2-0001uM-9v; Fri, 09 Jun 2023 09:48:08 +0000
Received: by outflank-mailman (input) for mailman id 545787;
 Fri, 09 Jun 2023 09:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q7Yj1-0001uG-2a
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:48:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb771e8a-06aa-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 11:48:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9962.eurprd04.prod.outlook.com (2603:10a6:10:4c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 09:47:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 09:47:35 +0000
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
X-Inumbo-ID: bb771e8a-06aa-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXHdYjzYYF7EqAHPaa+dUQmIoouk1WJih+CMyiL8zzxqjutLcYmm63fgufxHlTU/X2DHdzZBVz8x6n1i85x9r3xNjIFSP1b+K6Ef3NbepbgY6IGKcSuOVgUwrkp5PsSaXx0DZnzTB76zP8tEHk2EqbjKJmBmSS36bNdBxmpHRpqhoJ4I6vWzC+HtVL1vx9Ie/mzUL5zxmPQG7MxAqrD3gMFODnbfIPBx8RgZXaPpmb0pQDnlKwW4LKAkn/Nalu4uxUrX9J+RtZkQbw/K5Cl5X2JgLIRHxiK7JMVjfxKXwUO07R3cSdDCb4k7G3WuHkGkqU2g6U5N2bgbNdVJPOn3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFjd+GCVzXTAW7Y23VnBIz8RizZRzYtdgZQjws2wBpI=;
 b=ApLuT61/yHAKdZrLZ7/FO7+MfTmeBTlTXaAkAHIqsUHKPNLHoCrF/YMldYZTAyILrkJRR4YdZTH83PkxIuIE7fHDdaNKgjZTckG14vzdyWiX2lgn5eHJFv/L6U6voO8x8BCcJoGv5hNG+z4v3sEtuunPFPR94UV57kmVrFSTTHCKyHtuH2rDnd6At+HBWljxLhjhjhOldo3hX33Z+sNeH7KfBSHu5dMn/6dW7ra2e/qXjdzh6XcyidsZ3Z4GDsg1K+8gnSRtx9bVJNMcHHf451vVKjHW8ztTAjnbe1on/sPPHyCtDQMQ75hj93tccoTOe68ya704fvgbGyw8oJiOtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFjd+GCVzXTAW7Y23VnBIz8RizZRzYtdgZQjws2wBpI=;
 b=UAGu5AIgx1KZmdnV2fv7zOpXT+826VHJ2i5io+QA04TcqmG8QJbrhR2MKrJJPoVU4fZowrgscVV1uUh3SRkuU5d4pWYmuhW5AcMx3AyeVX4zya5PzSJqlzUWF3hT0p3mwXlDH64ARUgmrw620IlKLbgRMoUFbOySQn26jmeoDXOj/PHCQRlphd2Yy9SKlJqm4AU1VS4KOR5JIQ0H8shoCj1iLtlUojzy4gcKUFC98RR58KW9H0OedveYR+MfRbB3lRw4q6VaZuaRkGkaDb+1DfJwcsqWk5dAc8uvLUpco/LZuSoZ/UDvdAcvqEUw6IFa+dz5TjeOGOmR7UGZ5VNS9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <13d13f3a-26b7-ea99-8ba3-f868cee1e3ac@suse.com>
Date: Fri, 9 Jun 2023 11:47:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Roberto Bagnara <bagnara@cs.unipr.it>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <8314e0fc-4ead-40fa-ef7b-4da8ce0655b4@suse.com>
 <80a512ac-d90e-930a-7ef7-8ebb5a80e801@bugseng.com>
 <968ba799-8fe4-e22f-b678-64e52f789026@suse.com>
 <9df8560d-4b06-2ab4-b09a-30241dd19676@cs.unipr.it>
 <4f5e33e7-9606-2cc7-79ec-c03cc724b6c6@suse.com>
 <8efd91fd-bb36-9073-654f-fef32d0da443@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8efd91fd-bb36-9073-654f-fef32d0da443@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9962:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a3f43c-e649-416e-4506-08db68ce8dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/3o5C/by/ph3EOUz7w0SMAhMlnZcv7i2JRoeaNdcf6nhREfQ30HHrW9CpysAcLAFeV1YFYdhAKtnks6L+xvtR1UPGQai4mWp7NnLL6R57gwLWhBSOftoYjZTKb69NCl0zRPJaSAIQ8klV7fgwwkL2RzKN/fmvn8jPMmmKea17Ida4rev88gpVmUivYIAVrkQufIU5L65WJYRrgvW2UYCHlpcDo2iQ/eQsuYjKJZA+EoWgI1YTT/c6QGyhOocv0VW4aA/KXa4MdO7plyD842pKY3RKhFHUJKhd3WLb4NZZRFm4sIIAx2oPaSTEjiPmKiDTQdORD+VTEi+lLEN8xafoekCvoJnlBWevxM9r/qTq3xHgbRSIETxgRbHl5t/+zCz6KAUG8TDwHELUWt/kFecy8JoowOgeRUwrp429JZ3LXFY7a0fqAgIBpaHVdPOCAUmLyB0KFpC2boKyLK4O+2o6ERo/oPCQTHYIkVwFZZSE581ELOwQh60x2Hy/+Tfzbsnw3Jz8h8H2HaL0O1PThMpFmB5SWcH3xRYSFUt+6lXMYQMHx1SOSAyrrWctvUINwCPAnsjYqiOWyiDRnxYW9tBbb+e+DrxfMgn4gDr2lYRVnl5F1FaynVOn7AL7tUrQOS32NhJpJoIkkw8zv758lvfPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199021)(53546011)(6512007)(2616005)(26005)(66946007)(6506007)(186003)(4326008)(83380400001)(66556008)(31686004)(66476007)(6916009)(6486002)(316002)(31696002)(478600001)(54906003)(36756003)(2906002)(8936002)(8676002)(86362001)(5660300002)(41300700001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elhBNFVyWUQ2VmhGb0tPWHNvTHVpWVhrUXgzWDB5UkJPUms4OGhpdGNQRkpV?=
 =?utf-8?B?L3lVc2czN1Vna21JeGJMcGpmVkVHWmlaVUNWK1VHUWozZTB5L3cySXdvY2oz?=
 =?utf-8?B?UzNqOC9VdFlwa1N5SjhRbFRsSnQ5d0JXa3B4Uk9qbFVkSDAwVExIcFZUNWQ1?=
 =?utf-8?B?WUc5VzE2cHJoY1FWcENTVVg2Y29zb2V3M21VUmpVR1JYZ3lEWnBEM0xyQ3dt?=
 =?utf-8?B?dkM4V1N5bk5yL1Z4ZzhOZTFSYzhrWC8xdVJ5TkpPbXNzeC94L2lCeWhLTlEv?=
 =?utf-8?B?cys5SDU0aFg3ZHBWeHNxU0NsYSt6cG9iRzFoRGl5TnBIeUhKSzVacktEV0ZI?=
 =?utf-8?B?Y0RpTmJKSzc0RjVsRUt0aFFMSzByQVl3S21wUEtmOFR6Y3pTQ0xGTUVjdU5S?=
 =?utf-8?B?MnFmVUMrUDdjUk9HOG9QMExLNWkvRENvYmtmRVp4ZkwwZDQ1blRmMGZjYkdN?=
 =?utf-8?B?ZjFpZnVPUW04ZEhNQXF3Mk1ZM1JQU056T0FaWUNuajJ2RTJpcERwY0M1QTVK?=
 =?utf-8?B?dEFJeC84b2pnSGZBUHZJanQ4cXkrcVpVZ010WFFNYnc3aXpTUFN2eFpDdE9y?=
 =?utf-8?B?Zlh4dmlKWXpNcmRvN0lPMGVoR3E4bTBSUjROU1E3ZmNoVkdIWHFZd2JtQ3Ux?=
 =?utf-8?B?WFFkVXVSWHZBY05TUU5aNjlQNkZiRU9kVjZUNXk3enJZUjdpSjJOcUpyNkVI?=
 =?utf-8?B?V3oyMVFhR2ljZ0tJNVM5WXRLWUVQQVNZK3ZqejB3WERCNzZub0drdXV5TGdv?=
 =?utf-8?B?R0s0QVJXZ1o5NFJCYWFMdzZyeFQvM1Z3amkxMmt0OVZ3WHVIYnZCbjVHa3JP?=
 =?utf-8?B?T3cxazBBOHV1YVNwcXUwZ1RjQmlKQllKUGIyMldoWDR5NHV1S04rNDBDOXQr?=
 =?utf-8?B?dWhOV3BOZVpWK0lFV0kyejdWVHI2c0kzUzhSMmhFb1FkS2R1M092ZlVCa25G?=
 =?utf-8?B?cjVUN0ZENmxsMnRTVTNucFQrNU5SRnNjQ0lFQmdwV3laaFhXVW9OR2h6K3Fl?=
 =?utf-8?B?T1lnbVI5V0puelVVUTZjY3owNmt4VjU1U3dBNTBJamRIMUxjcU5NenNmRDNU?=
 =?utf-8?B?ZjB5YmpMQjdkWUpPOWxTeWxTcHRYdGo4bERvbFpXQjV4QTQ5ajdiK1VJK3Vt?=
 =?utf-8?B?ZmY5SExqMjQycFVHSEV6SDVkcG05c3RYQjZ3TXdhbjYxaVFnNTF6U3FETG1Y?=
 =?utf-8?B?N0tNYS9UMHFIYjFWb20rSHpPTnV1a2tZMDJkdWpKSDFtNHhsTkl6S0tBdnIw?=
 =?utf-8?B?SHVZbHlkRklKcWNMVVVUUjRveUFTWDZXSXFMSnNvcmpQbzlOOVJHMk5LYm9a?=
 =?utf-8?B?ZjcvTEdubFU2T1VtenVHeGdpSFJnNE5YdzFCV0p6c1ROTEU1elZZRlJ0Q0E4?=
 =?utf-8?B?SFVzN2dUUmxDNWF0MFFsWENLdHhOVlV1aE9xcjlwODNlbmtCb3NNZ2RRTjNN?=
 =?utf-8?B?bklMRWxZODRHKzdOeVRVMW9DLytpa21zVzY2blVaUjVuRGd3SUo3NU5wSElH?=
 =?utf-8?B?blh6L1grM0hWNDdtdmVPbXB6Z1hhSVhsZ1gzVTgwQVd2dmR3U1p5QTVIUTBX?=
 =?utf-8?B?MkNzeURDS2tvYzFYWHl2YkdYTTYzaSsxYkFuVEZPRmlOVmlxODlYZGtOWEx0?=
 =?utf-8?B?OUdtVjZkZW5hVXZ0QWdJNTREMUZMRkxBSDRsZit3Rks1bXBVZVFrTmN6UGt4?=
 =?utf-8?B?ZGlDNk14VjkzUTJNQmxiZ29Xcmw0Z21iTlVzYlhGdXRYRXJjOGd6TmFTdTM5?=
 =?utf-8?B?OGcvTHFxdnBWTkd6QnFWNGZtQXFKTk4rVllob0txMjl5S2QrQUlKVU5seVU3?=
 =?utf-8?B?bjlLZE1NelpDUW9tMnd1Q0xOd0hDU3VMT25oOWRzL1Q5Uk5aNG1WOUNzNnd6?=
 =?utf-8?B?Rkk5VXN3S3RYSDRnUXkwWDQyQzBMNHFGOVBlalNJanEydkF1K2gxSzlKTHpL?=
 =?utf-8?B?NUxSN3dmYjVMbTRLclpoeENMaDFrOWNuOGNVWWR1YTZjbzkrQkNjNTg4MjRN?=
 =?utf-8?B?eVlHaHJPR3hETEFaeXgweWM3bmVrN2RwMHBvZDZUNGRhN1ZZMkZZd3JVM3Jx?=
 =?utf-8?B?bHZUMkc0TEFjQ3A1a0RIMVBJRjhUNTVPbXBIMFhnU3dZRUpZOWwvR2FQWWFy?=
 =?utf-8?Q?eKHgG0XHhrEYiz3Upxm62O/v7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a3f43c-e649-416e-4506-08db68ce8dd1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:47:35.5895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJx5zQZDIRVdM95lGsN1EgegTm2Mnes8xx66DMtlQYIq/qn477DHAA0X5eWpTo9QLeh6BkqJhXFhqpxQ1s7XoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9962

On 09.06.2023 11:36, Michal Orzel wrote:
> On 09/06/2023 10:54, Jan Beulich wrote:
>> On 08.06.2023 14:18, Roberto Bagnara wrote:
>>> On 07/06/23 09:39, Jan Beulich wrote:
>>>> On 05.06.2023 15:26, Roberto Bagnara wrote:
>>>>> On 05/06/23 11:28, Jan Beulich wrote:
>>>>>> On 05.06.2023 07:28, Roberto Bagnara wrote:
>>>>>>> U6) Empty declarations.
>>>>>
>>>>> Examples:
>>>>>
>>>>> xen/arch/arm/arm64/lib/find_next_bit.c:57.29:
>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>>
>>>>> xen/arch/arm/arm64/lib/find_next_bit.c:103.34:
>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>
>>>> Looks like these could be taken care of by finally purging our
>>>> EXPORT_SYMBOL() stub.
>>>>
>>>>> xen/arch/arm/include/asm/vreg.h:143.26:
>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>>
>>>>> xen/arch/arm/include/asm/vreg.h:144.26:
>>>>> empty declaration (ill-formed for the C99 standard, ISO/IEC 9899:1999 Section 6.7: "An empty declaration." [STD.emptdecl]). Tool used is `/usr/bin/aarch64-linux-gnu-gcc-12'
>>>>
>>>> I'm having trouble spotting anything suspicious there.
>>>
>>> The macro expands to definitions of inline functions
>>> and after the macro invocation there is a ";".
>>>
>>> The preprocessed code is then:
>>>
>>> static inline void foo() { ... }
>>> ;
>>>
>>> where the final ";" is an empty declaration not allowed by
>>> the C99 language standard.
>>
>> Oh, I see.
>>
>>> Removing the ";" after the macro invocation is a possible solution,
>>> but other possibilities exist if this is strongly unwanted.
>>
>> We have other macros to instantiate functions, and there no stray
>> semicolons are used. I think this wants doing the same way here, but it
>> being Arm code the ultimate say is with the Arm maintainers.
> Apart from vreg.h the same applies to TLB_HELPER of arm32/arm64.
> I think also TYPE_SAFE would want to be fixed.

Indeed. For this last one I wonder though whether it wouldn't be better
to continue to permit (really: require) the semicolon at the use sites,
by putting the typedef-s last and omitting the semicolon in the macro
definitions.

Jan

