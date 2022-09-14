Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5416B5B820D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 09:33:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406827.649214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYMt3-0002D2-6N; Wed, 14 Sep 2022 07:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406827.649214; Wed, 14 Sep 2022 07:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYMt3-00029Z-3S; Wed, 14 Sep 2022 07:32:45 +0000
Received: by outflank-mailman (input) for mailman id 406827;
 Wed, 14 Sep 2022 07:32:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYMt2-00029T-8U
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 07:32:44 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150055.outbound.protection.outlook.com [40.107.15.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60794c13-33ff-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 09:32:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9469.eurprd04.prod.outlook.com (2603:10a6:102:2b4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 07:32:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 07:32:22 +0000
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
X-Inumbo-ID: 60794c13-33ff-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWp7YDWzP/r7hapucOFYW0w5mbztWyxofd3w5UHg2srVAcCTc0A7gjyDOFB8ULEtOO5nsSiUHtVZKwd6cPqVKEpnlkwMBN0jQLg3l3LizirgL+FVvMAuDrRSpQiTgaRAjwqymxsYF04qX12TEvqLnQvH+SNS0zWpAqi1Idbd62oUDpz4NmsjgEtzALGKU283MKPUFxHtTg0vhh7ok83HuQ0UnmRn5m+aAnbbW+8Ldc3jQpn88Dg4keBuXDnZ5Oi7BAMpxx4s8edUd8jxVsw44yexZLaYpTX8kbhmxxR3DLoJY2S8NzkMY6hC5vWlOlf8q5Y7OzdlZYJjOJSf8MiUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VhwirDIUo3r33hIMDz5bvGs4vRBoNpPcNecpcQv3z0=;
 b=B2vrQeJdHfCxiKIS8dVkbUcRww34Xfoff3jllqWiwiTDzIaGapeH9H2yXLFyY9Y5kdZYhvdcFEjrNtMKkfnjZzzbV1Y8IvYDOPQmhp1LTYEa8SouaBhYT55WBmfdtPZTyzH4vv3sjRob7S2uZW4PYolIFfK44khX/BcxaPBIvLA1l71oNIvMTHLCAAO3Zm/f0naj1afU9NJNnfS+NaaVSNPHEGn3mdDLEyiVc796VMczsgTSSZ7GoDH8bZ6wrTfUbzgJIovPXzKiqvr0mQpdqbfzVrMC2R1QZxU7Er11+ft6PhSV09pRZs7lCmgek0cEbcdtsKQwWOi7zMUfwppZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VhwirDIUo3r33hIMDz5bvGs4vRBoNpPcNecpcQv3z0=;
 b=micZOSEKY9HWc5gQdJhGHKFAMDIu049HnWOVLmhLTFapc1jAY/tw17T2dCkLAF9YbcsNZalHc8Z/MPHrCLAm7OdUJFQGnfIbyEZLeWO6yvu7BeMUT+PS2v5vspd/NuemzBPEudULllOwd0A7D6Se196I42xlmKDQrLz3LJUUFsWQVZHTQfx9n7SikKXMA1KFXe5m0PLyqhtor8Z/nCPfs4IHnAXXfzhUxTCd4x89+113vK2y/jZMDbgSXjZVXmak0NhjuxXvTPMNGueSt9H0DqvssQgUAgozg4UAfkm6gH9dSpNT9GCS/3T630DS7SPl4tNMc08KI4Y17RRKprgjPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6e399a4-a5b4-0b70-313e-f5b07136c00b@suse.com>
Date: Wed, 14 Sep 2022 09:32:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Setting constant-time mode CPU flag
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <YxFk2GaIQVCAFsyi@itl-email>
 <1d7b9e30-975b-b49f-fe09-e2aeda9e2af6@suse.com>
 <1b85702f-7efd-b13f-40d4-615750e20f4c@citrix.com>
 <YyCSIxyH4hDmTXIh@itl-email> <037151d0-0920-5d99-9932-df044729c00a@suse.com>
 <YyC8PMxsQyRp07vW@itl-email> <61f083c8-34c7-563b-b010-8d8d0286da6a@suse.com>
 <YyF3UoneRmBGQSHo@itl-email> <62f0ebdb-d06b-f361-40e9-711258c03a56@suse.com>
 <YyF+mRpYDxEPG/59@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YyF+mRpYDxEPG/59@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: dde9e119-f94f-4496-42e9-08da96234370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PVhbhnHV0TtLiC6YK1OhBiJknCFnpHjNwPASYiTajZLTHUsqb86nkcKjmK0SUzYnnYwIizHBb678us4oeiHnf+EOmDmFPM/uJuUDOhTxwZdMdEtV26QoBF5KluxUQcJ6+NqjbteiIt+l1lBb/3GZSKWcuNN5b05tLTn+BgxMYSeVeOvrdC2wwbfPkS/URwwjXD6hkhzMPQ2zsr6OYNbRjb6A/cO1nNcfxWcQ6nb7HTkL2Wue6jYSGaATwpAnPiP7e7IWaQZNGv2pSJdiu6V/I4RGecvqMomjfHode4HjwuuSw6lmv+SVbWOPNPhOKSWDtjjpm/Mq3nwbrGlPj+FWuWISkvzMwvWaogofjNlX4gKZboZ2CWdlcKIjDbwWZs5IN4G7fWIyVhrkzCl1TjCbmiHFnJ1QigMTtUxYMbfFmbQZ/gUjmn2yt156Ay1nbunVVV2E+wDNfhpE9M6ddSTiWVU/9uZfYNScqs2HMpejntk89N4YNfZkDIIr7nZi9e1SYfsk5s9rRiNmDW3XXD6oBzSoPDE15DyBljs5E20D7NHxRC+XmnsfVRH1bVUaXdlWMT0uBvamgGmjdahWz0XiOA6bUYEuYYbjwRVGLk2Sm00E2Ic061vz/YMgxjH91T0HVxtoHy37RPS5M/uctIzkGmPfblBWl8TyWKY1xSkMcsP1xFKLg3XP5XuVG5WlB8W8TnDw1ZJiDlzriDauHouTKzpBagyqz4QPk4qRXJobAFA0mXXI0fKiC+F8or7vJ3nd98rYP7sK4sJZ30C/QV/YNpYt88yzfKalz7UbSRuNSW1n6aelDMgVDIDDVb2iiUOOx6OHoPIQM5rnjtPsOEzDyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199015)(66556008)(6916009)(316002)(66476007)(66946007)(6506007)(6512007)(53546011)(36756003)(26005)(6486002)(5660300002)(8936002)(54906003)(86362001)(478600001)(31696002)(2616005)(966005)(2906002)(4326008)(8676002)(31686004)(83380400001)(41300700001)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHBzeXdHRktpZ3dEQU04azNJVURHRDJjMmZZQ3Y1Sk8xZ3BLVDdRUXErRlAy?=
 =?utf-8?B?VFdBMDZTVkh1blltMCt6c3diUjREdUxiWDIwZmM3K0kvRitoWGczb2Z4VzY5?=
 =?utf-8?B?OXJlVWc1TkJpcHU4S2JNMmsxV2dMYzU5V2twZ2djN1ZWL0srREhvNi9yODRB?=
 =?utf-8?B?eGZEU1Zyb0hTVnJkcFh3ZmttMWhtczlvRkljSStEQ1dRRTBxbG05eTlwNndn?=
 =?utf-8?B?Y084UWdXUXRVc0tmRGlwTExidzZTcUg4TUZsOTlJWndGODBhL0F3NmV6eFlp?=
 =?utf-8?B?QTVEVVZ1S0gxckg3dEtxRGFvYWJ0SkJaUU9aWjBIRzlRblZJczNkbk5oZEZT?=
 =?utf-8?B?WTNZNHVyQzFEc3ViMDJJSGVzbW1GS2xZRkNheTVFMTlsNE5xVkVMMGFWak8w?=
 =?utf-8?B?TDNEa1AxVHdyYnhGZWE0aVNkUmU2QVhNbHJSZWl6VnBWeGw0ZFpnMmxnU1JJ?=
 =?utf-8?B?LzVmYjl4WERRVnJwQndTb2tFeXdxeEhlTml1N1hiY3djT0J4UGhoczUwOXNr?=
 =?utf-8?B?RlE4aE5WdEdqaUVnUTBzYVIvR1VQaUpCdGFpM052Q0JRaU5rUk9jRjhjeXJO?=
 =?utf-8?B?Z01jNWhqNmcrbk5pSVN2ZmNvNHZ1WklONkl4eWtJOEFHV3hvSWlQcGdtWGxa?=
 =?utf-8?B?ZmlZbnhjTVBsZnpZQldRcSsrdjZMbU5iS1l0SGRiN2tOeGE3aGhUVmxidFZW?=
 =?utf-8?B?SjVoZnI3dzdxUUFGNE1MSGdWd2NwTTdxNWxHY3RKb2kzZ1pKeVpFVmtkeW1S?=
 =?utf-8?B?L0wvZDNhWS9WSVhaV0J2UkhEdGlrUFlLNTMyaFE0a0JFeklnOXNpNU1pYXJo?=
 =?utf-8?B?eEswRmpyTmVOcDQ2UzFUZnhScURHNmtidFBjT2phTzJVbmJWbnZEM1JGc3pq?=
 =?utf-8?B?WE51elNJc0xrNHBjVVliQW4zaXJReXo2QzduWkUvYXZaaERLUU9zd3pyWVVM?=
 =?utf-8?B?TGV4TWp5NUNVZmFzWXlxWmlkRkFFK1VJNFlCWDRPdlVRK0ZTN2gwcVRpT2dZ?=
 =?utf-8?B?elR6ZnNqdDVoOTFGbUpqU3Roa29aRGpwem1kcjhCRlBxc0ErWnZ2Sk5RN0xK?=
 =?utf-8?B?VFE5d2g3UnFXOW91Zi93SnFwTXN1TkpYRk5oTUdhdUxpSG5HSTFBSzhNSWZq?=
 =?utf-8?B?Wkgwb1RHdmtHRnNNYXJvOFRtd0JudHlpOXlNRy9sQ250bjl0NE1FZUpVS0kr?=
 =?utf-8?B?VkJlNGhrMkRRTlRsc3UyODkrS3lla1NnQnVxUk1pb2c4SEEwOGd6UG1JOURQ?=
 =?utf-8?B?d3p0WnBLV1IxN0UzQ3hibEs2RlVyTVFpcXlVNi9hV2JWQmhxUGtUVUJ1aFNq?=
 =?utf-8?B?WnVmUzNoajMxd0hYcnFRTksrekM3UVRvM2JVRTlkdk00QVZQTlNFMXJQbG1k?=
 =?utf-8?B?SStMakV2MnE0MUFlMS80QmxQcFZUL0JnSHQyLzJNbFVjbm5nMEZjdGlOTGFa?=
 =?utf-8?B?SmtjMmdkOHZ5cFl4eVFFNVZJVithM3g2dDlwaThHdG1INWRORVNLdW5md2Vq?=
 =?utf-8?B?MDZmVVVpaytsRjJ6UU5RckxEUjIzUnhUdEhLYUJ6VXJPakF0UEhMUjRRZkxY?=
 =?utf-8?B?V1hXQjJPbVo0RENQbmRsZUNDVVRxZzllaGhpY0V2cjRybC8vZlZES3d4ZkpL?=
 =?utf-8?B?cEFvVnBKUHJvdWlBbHZPUXhVT0QrUXJyRlJITEloOG9HdWtoQzdSemdGMlI4?=
 =?utf-8?B?UVdXNEpSaGtINEVtOWZ1aks2VWVTdnY4SkVNOThRWDNwZU9tK2V5WTh4VWtM?=
 =?utf-8?B?SzhSTHJzUHVkNHhqK0tTUGdRcHZsbU9xN3JNZEpOSHM2b1NXNEk3M2NGc0hQ?=
 =?utf-8?B?UlBvM0oxelY5dzlEdytKNlQrUDh3RTUvRmt4amZvRkQxQ0VPai85UTJQNHZP?=
 =?utf-8?B?TWMvOVhTRU5kV0NxNm1vWWk2RC9tVi9hMG1sWEpqamEyTnpTcjg1Y2haNTE3?=
 =?utf-8?B?SHZ5ajV2UlhQQUFPUzhVd0pKZnl6c3RxSlRtaFZ0eUozdkJlbnpndktFbHVz?=
 =?utf-8?B?WGppU0RuVjI2c3NnK05TZk91VUY1VHlhUmllQy9ZYWE3S2ZwVjdNZmVzWXZW?=
 =?utf-8?B?NnNBTDA3MUVoeHNVTkhySlM2MEExNlY2UGwrT3l6M1lPNnRValBpcjJtUjZQ?=
 =?utf-8?Q?SnowKCSfpOIREwtf8GVtiMgAE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde9e119-f94f-4496-42e9-08da96234370
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 07:32:22.7205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZqIjebGmRYBboHMElv0/lz+o4zNALZ23RlcHtwojANn8kRzp7yedRtFrLbiZyMtny55Max+8aQaGNv+MOnrJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9469

On 14.09.2022 09:11, Demi Marie Obenour wrote:
> On Wed, Sep 14, 2022 at 08:44:25AM +0200, Jan Beulich wrote:
>> On 14.09.2022 08:40, Demi Marie Obenour wrote:
>>> On Wed, Sep 14, 2022 at 08:36:02AM +0200, Jan Beulich wrote:
>>>> On 13.09.2022 19:22, Demi Marie Obenour wrote:
>>>>> On Tue, Sep 13, 2022 at 04:47:24PM +0200, Jan Beulich wrote:
>>>>>> On 13.09.2022 16:22, Demi Marie Obenour wrote:
>>>>>>> On Tue, Sep 06, 2022 at 10:01:00AM +0000, Andrew Cooper wrote:
>>>>>>>> On 06/09/2022 10:52, Jan Beulich wrote:
>>>>>>>>> On 02.09.2022 04:05, Demi Marie Obenour wrote:
>>>>>>>>>> On Intel chips (Ice Lake and later) and ARM64, a bit needs to be set in
>>>>>>>>>> a CPU register to enforce constant-time execution.  Linux plans to set
>>>>>>>>>> this bit by default; Xen should do the same.  See
>>>>>>>>>> https://lore.kernel.org/lkml/YwgCrqutxmX0W72r@gmail.com/T/ for details.
>>>>>>>>>> I recommend setting the bit unconditionally and ignoring guest attempts
>>>>>>>>>> to change it.
>>>>>>>>> I don't think we ought to set it by default; I can see reasons why kernels
>>>>>>>>> may want to set it by default (providing a way to turn it off). In Xen
>>>>>>>>> what I think we need is exposure of the bit to be guest-controllable.
>>>>>>>>
>>>>>>>> We absolutely should not have it set by default.  It's a substantial
>>>>>>>> overhead for something that is only applicable to code which otherwise
>>>>>>>> crafted to be constant-time.
>>>>>>>
>>>>>>> Either Xen needs to set the bit by default, or guests need to both know
>>>>>>> the bit needs to be set and be able set it.  Otherwise code that *is*
>>>>>>> intended to be constant-time has no way to protect itself.
>>>>>>>
>>>>>>>> As for why Xen doesn't enumerate/virtualise it, that's because
>>>>>>>> virtualising MSR_ARCH_CAPS for guests is still not working yet, so the
>>>>>>>> feature can't be enumerated yet even if we did support context switching it.
>>>>>>>
>>>>>>> Intel and ARM64 guarantee that CPUs that do not enumerate this flag
>>>>>>> behave as if it is set unconditionally.
>>>>>>
>>>>>> I'm not qualified to talk about the Arm side, but may I ask what you've
>>>>>> derived this statement from for Intel? The doc page referenced by the
>>>>>> link you did provide (still in context above) specifically further links
>>>>>> to a page listing instruction with data operand independent timing. All
>>>>>> other instructions, as I conclude, have variable timing unless the bit
>>>>>> in ARCH_CAPS enumerates DOITM and then the new MSR bit (of the same name)
>>>>>> is set.
>>>>>
>>>>> My understanding is that only instructions in the constant-time subset
>>>>> are ever guaranteed to be constant time.
>>>>
>>>> Hmm, yes, I did overlook respective wording in the doc.
>>>>
>>>>>  On architectures where DOITM
>>>>> is not enumerated, this guarantee is unconditional.
>>>>
>>>> I have to admit I'm suspicious of this "guarantee".
>>>
>>> Do you mean that previous CPUs had a vulnerability that has no fix?
>>
>> I'm not sure I'd call it a vulnerability, but at least if going back far
>> enough in history I think you'll find insns on the list which don't have
>> invariant timing. Like with other documentation on e.g. speculation
>> issues I take it that Intel simply doesn't consider sufficiently old
>> CPUs relevant anymore for such new documents.
> 
> Any examples?

The one I easily recall in truly ancient, so maybe of only limited
significance: MUL on 486 and older.

Jan

