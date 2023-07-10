Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456EF74CCBC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 08:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560917.877087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIkIR-0006ly-EK; Mon, 10 Jul 2023 06:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560917.877087; Mon, 10 Jul 2023 06:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIkIR-0006jv-BI; Mon, 10 Jul 2023 06:22:55 +0000
Received: by outflank-mailman (input) for mailman id 560917;
 Mon, 10 Jul 2023 06:22:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qIkIP-0006jn-JE
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 06:22:53 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32f41698-1eea-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 08:22:52 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 10 Jul
 2023 06:22:50 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 06:22:48 +0000
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
X-Inumbo-ID: 32f41698-1eea-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIsejwIZ2WYvW9PYXgaKkxwJI6loXxjm5WRbdX4iF4q6WndiW3o6j65phpLhdOUdipOysw1O1VwViSzsL3BEGvVl/s7M+C/djtAkE8v0SRewZkzyY1ZLHei3uJQqCPmplJB21iLDstypyKeG+ssrNgvHJPJHcrUzK06IxN7lleKjjMfuQXr8Gb+QApnYoMp1L2kgi5aGGFzHgg5PpNU8vXjiMaVjRXsVUDnZf4O1LHPeZhWlYlHIsOhBijpRLbRZ8Ir/iVr5Vvwc2o4XKJToTZMgjM1Yfof1+B5mhIW4hXvvZeTEwieGu2u9K2olRATGYoPJGBYDph5XYs0pWGgjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPg0p2XJ4w47nEbh++4J8FpBJq0K82oHesJLvIjo3uA=;
 b=T9Gn1/TYRkPYsH4fPn68oBHEIA6tuJ1xfdTRgKCW6ojOcIH4Jsv6kRWztQGrbpAakDiibXXebIHSpyZCEs4WiEta25+LS4loRaYJ606BtByXqtb05QaAa9+QSn0DwINsHxHb+BFP9cuOy+fbNVp/FtJbVsS24ANE7TqFGz7BlpAGrdd/+Es9xOZh2ok2MofO1T75VT6VZ0b+Jc4DiyxlbTaVHCbh4K9zLWHZBjL5WpbpmhSpJZvoz3+1UFg1zYZtpFIfet5Ug5pFx5vfTULGu9En6U1ATFDhcpwgqXflSEj34qmPVSxEPKdcLAT2fARg2e4/p9U8rS4waWm4WegLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPg0p2XJ4w47nEbh++4J8FpBJq0K82oHesJLvIjo3uA=;
 b=fBBWL811NJegGyOJ+CTkKnImhgohlDeknh+Euw9pZOelJRnfooocbZ+p8RQ6iOg9udGl7PP1qbQR4lXT6M4eryLXXXdzEfybls5vtukn3T7Z/WEt7zCwPCnIsf/Q0C6u++ty0P8aJxv2vPXjPBcScm7Mi7yWdtarJ1wFAAxVzTVDocMJZljYmL5z04ztwmjhGdpi40g4CaLz+b+0gEf6g9f2tOg3YnssXs5NOH0CGRBgSAPR2dLF3aE9u0DBoAi99tM5rY+fOsaAdK1pRdiSwcZqAezNcDL7QtYfCa/fmu4LkYphwbZ+PfSxSNnOaYUke9kqdhD5OH0xaHbBRFx5Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <754b3015-d3e5-b734-bda6-266c599625a2@suse.com>
Date: Mon, 10 Jul 2023 08:22:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v2] x86: make function declarations consistent with
 definitions
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <1b2d5be30c0e4f335e59dce6e7c001cb0805d702.1688465215.git.federico.serafini@bugseng.com>
 <a16cdb60-1307-636e-1473-e5388e8f79d9@suse.com>
 <alpine.DEB.2.22.394.2307051604380.761183@ubuntu-linux-20-04-desktop>
 <2c7d71cb-067d-8dac-3ee4-3af42b2756f3@suse.com>
 <alpine.DEB.2.22.394.2307061506560.761183@ubuntu-linux-20-04-desktop>
 <e6fb3b99-d59a-eceb-024a-8b791ef20129@suse.com>
 <alpine.DEB.2.22.394.2307071425040.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307071425040.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e11212-c717-4a90-1f7c-08db810e1503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XnSYCh7EuNRIc9+atYw9wKYYBp/aQKEgmIh4tqwdZZpnSCs6fWH+u4xPSIkGEP6gAbiWv0mgZwzQB+sVKxg6AgjeoDZ66rFuYIBAPaodPN9KC3X+Dh3V/UUR68IJSh9EJYBkeKof2jOJ76CF9v1+fU42+DOuc4FIVpvuT7KSlRuD4fa8C5IIzM42gq2XEz77rtEq31QPqcdEimOghO+HqF/uGxkWrmhBpAy080Xd66GfcPF6ukFTbD1RuDNkzZPmBAnPLvawsbEw/UHqM02YdSEis6ssJyYB5Weh7Q/gwYUt3+cz+LNEz4hiwGahQGdU8T2UmJrYMROaV54jopl5zkbNdG9mYxpw/CHSjSTZpDfW63U3qRgtOHorfQGJ+q7a5LbXn+q35AwL0LCkYC1/IccoaPyYHX7IyxWFW8gS7DdrDziTdXae2Ygq7WYz79FGITHjMM59eyQbL9TNgAkXk+oFFBv460zULw8hWOx8H2QDIDgRO3cvDTc2VzZYTlwIiD8iaqFeWqPnp+gEu4EMa2HmJrB4vVMv4fXQiLpifikZN4p0V2GMH2gGMEjIj/ku6ExfXBGwQL0kARo/xtdmWL+13kM6+njTMg87cW/MI8uugPFg/E56UtfEqUKfoHvrE+XFTzcyJzYw374JUTBBXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199021)(2906002)(41300700001)(8936002)(8676002)(36756003)(7416002)(5660300002)(31696002)(86362001)(6512007)(6486002)(478600001)(83380400001)(186003)(53546011)(4326008)(2616005)(6916009)(54906003)(66476007)(31686004)(66556008)(66946007)(6506007)(26005)(38100700002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3VXVkNEMEFaS1BYakhzWEZoeEwrZWljL3F1SGhQRGRiOW4vNy8zTjlta29t?=
 =?utf-8?B?dW16b0NDTkJWdnJYeHNJbjNwS1F4c3JNTUxHK3Z6SGtRdXdKbTlrbk9nTlg2?=
 =?utf-8?B?Skc4VG04N0ROdWdDcGZwZmRIU1YyeDFMZWtyWWY4UXJsS1lMZnJYZjJDQTl6?=
 =?utf-8?B?SGkrVGNzRjZKZFRtR2h2a2RKNGhuMWVWSXFuMGdCRGRNZUlEWUdvL01jQm44?=
 =?utf-8?B?dWZLS2dlTzFZSzVFWEZvUEc0eVU4eDA0WjdMc3RFdFJ0cjhVTEV6bjVKbkZm?=
 =?utf-8?B?dEw1ZEhoMjlTbWlCa0hGWnhKNTN1WkV5ODM0eXV0K29aaXpnMTZic3czTy9v?=
 =?utf-8?B?S1hjOVB4STJ4bXZraHdreS8zSEdZNkY4ditlYVlZY1d2ZXEvRVdSeWloSjlI?=
 =?utf-8?B?Wmk4a2VRNUVXaXFtbUdWRFNxOXJzVzFDd09hQk9FSU5oZ24rMm95L0tnRjlN?=
 =?utf-8?B?K3ZHT0g5M0pHcnRHWmV4cTVvTUlGeDFCa0pNd1RyY0RFSE5kUkVXYXF6dmsw?=
 =?utf-8?B?N3g1SFc4cTZZWWRDZ01rbTh3Q2JFNmg0QUtxdWNPbnd3YWpKVU9KejloS0xO?=
 =?utf-8?B?ejhSWTY3N29rZVdvMFY3ZXFNZTNDVS9mMWt3TE5ITWlsS2piRm5CTTlpT2lw?=
 =?utf-8?B?aEEyVWIyWjJ3c0ZuMDU1UVVXRFJTN2FnMWRNajdWdFFudGxFSUljY2E4Y2VW?=
 =?utf-8?B?ZmFja1hTVVNlS1B5c3MydUZCYkNZeGkrcUZEbWw2WTd3dVFCMkhIb2llVUh0?=
 =?utf-8?B?ZGtvUU9Ea1liU2N3eUVHWFcySFU0QXNRYjB2TGp4NmdVNXZacG5DUDU0Z2l6?=
 =?utf-8?B?ckcrL09Mcm5VcDJkTk9wSXNPbkVETmtUV2RhbU93cW5MUmdYZjRQSkJ4akph?=
 =?utf-8?B?K0NUcHV0YUFsdXk4VW5IMG8wVEhuRTRRb1ZUcmk3cHhsazhqT2g3ckZaeStJ?=
 =?utf-8?B?dGZGYSs1bWNkNTlVS290b0JPVkNJMWpvL3RIaDZQWisxUjV0TExiaDFXR1M1?=
 =?utf-8?B?aWFhUGphK0pVVFRTV2J5SmZvRXFraUc5WXlRU3VuZjJJdG5IM2pMNHBKSnFk?=
 =?utf-8?B?ZmZmYTVSd1BVVmZSdkRuZUgzUFhrM1dUeVYveitxSVZQQlFGUGlZOFp4SDRl?=
 =?utf-8?B?WURqY3RDODhIc3JKdVdtWStXS1AyNFlxSTJFdUNtMjRSdy9XZ0NyNFI2eXR4?=
 =?utf-8?B?OUpIR1h4UTU2N3hlVml4SUgram44dnlVRlp5a2JSa0I1SlgxVFYvUkdCYzZp?=
 =?utf-8?B?bzNaOWRHRExaenVDVHlRVXZqb3FReDdYTG5Tai9uQ0lLcVJtS2lrMUhqNkd0?=
 =?utf-8?B?a1NybVBaRTVqNTFyUXV2T2Y1cHlZcFhZbHY5MXNmQmdsbkxKc2ZReUdST0ly?=
 =?utf-8?B?UklxbG9KRmZmOENCenEwUWxHTTMxTFNvNjEySFBFbGRWT3hmQkx1NHpwbHZm?=
 =?utf-8?B?VFllOGJ6R21kNHVQK2ZPRG9JNDJ3ejhzYmo4SFZGaGM5RFNnUFFKTmxDYTl3?=
 =?utf-8?B?clFhUEMvdWl2ekJxWkxFU01pZVBrREpqNCtUeHZqeTRPSHB4alBLNkJvNXN5?=
 =?utf-8?B?cGVsak80ZFZ6RER4SWxER1N2a0JpakVCemdWWllNZFBsSjRCTjRtMkVZMW81?=
 =?utf-8?B?QlNTRENPZWQ0eHBzOVpDc3h0R0dqZVo5VkJCaU5qNlVMUnZOdjFuTXRMSTFC?=
 =?utf-8?B?c3ViVFowRmFZUjVzUnp3d0x2ZzBpM1E0ZU8yMGVQSWpNYzdCaDNRMzJmS0Mv?=
 =?utf-8?B?YmdZY1Nnak9MOUxUMWorUlRRYVpSTnA3K3FMTGdObGJVbnY4T2YyZmRtYTVJ?=
 =?utf-8?B?M1UreER1VFNTcGJ2UHVEb2YvVHNDbnVZdG5PaUU4cVRIQmF1MWZ4VGZrQmQ3?=
 =?utf-8?B?MXBUcHN6ckozelAyTWpIdm9pRFpYZU1YYkwxcDFjUE9WMFBRNU5GbDRNZHc0?=
 =?utf-8?B?RHBaODUzWWgva1NRRUcrUGpDVVdXdWRkTnRScUl3Y0N1d2owUEN4dmhuR1d4?=
 =?utf-8?B?NzhnQ1ZUVTdQVTg4aml6WG41aUszSzY5T041MFJ4dDcwUmJZYjNzWkhIZEpL?=
 =?utf-8?B?ZkdaV2FkbG9xRnh6Q0xoelRBYzFFS1ZvdjFkK2RETlc4emV2SDcrVm5SOTZ1?=
 =?utf-8?Q?1F8Z2+oaDCEcEzJBwFtw7X3c6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e11212-c717-4a90-1f7c-08db810e1503
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 06:22:48.6084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLbyr9CksBDfWMXIb69umV24FfaB7oHMXTUO5tv7RDeS3VzGurz3BVVuUl8h+YlWgKTcMeWRefopY3V5AcjlTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733

On 07.07.2023 23:28, Stefano Stabellini wrote:
> On Fri, 7 Jul 2023, Jan Beulich wrote:
>> On 07.07.2023 00:29, Stefano Stabellini wrote:
>>> On Thu, 6 Jul 2023, Jan Beulich wrote:
>>>> On 06.07.2023 01:22, Stefano Stabellini wrote:
>>>>> On Tue, 4 Jul 2023, Jan Beulich wrote:
>>>>>> On 04.07.2023 12:23, Federico Serafini wrote:
>>>>>>> Change mechanically the parameter names and types of function
>>>>>>> declarations to be consistent with the ones used in the corresponding
>>>>>>> definitions so as to fix violations of MISRA C:2012 Rule 8.3 ("All
>>>>>>> declarations of an object or function shall use the same names and type
>>>>>>> qualifiers") and MISRA C:2012 Rule 8.2 ("Function types shall be in
>>>>>>> prototype form with named parameters").
>>>>>>>
>>>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>>>
>>>>>> On top of my earlier remark (when this was part of a series):
>>>>>
>>>>> I am not addressing specifically this comment. I am trying to build a
>>>>> common understanding on how to do things so that we can go faster in the
>>>>> future.
>>>>>
>>>>> In general, as discussed at Xen Summit, in order to successfully merge
>>>>> large numbers of changes in the coming weeks we should try to keep
>>>>> mechanical changes mechanical. Separate non-mechanical changes into
>>>>> different patches.
>>>>>
>>>>> This patch is large but mechanical. If I understand you correctly, you
>>>>> are asking:
>>>>> 1) to split the patch into smaller patches
>>>>> 2) make a couple of non-mechanical changes described below
>>>>>
>>>>>
>>>>> For 1), in my opinion it is not necessary as long as all changes remain
>>>>> mechanical. If some changes are not mechanical they should be split out.
>>>>> So if you are asking non-mechanical changes in 2), then 2) should be
>>>>> split out but everything else could stay in the same patch.
>>>>>
>>>>> If you'd still like the patch to be split, OK but then you might want to
>>>>> suggest exactly how it should be split because it is not obvious: all
>>>>> changes are similar, local, and mechanical. I for one wouldn't know how
>>>>> you would like this patch to be split.
>>>>
>>>> So I gave a clear reason and guideline how to split: To reduce the Cc
>>>> list of (because of requiring fewer acks for) individual patches, and
>>>> to separate (possibly) controversial from non-controversial changes.
>>>> This then allows "easy" changes to go in quickly.
>>>>
>>>> I realize that what may be controversial may not always be obvious,
>>>> but if in doubt this can be addressed in a v2 by simply omitting such
>>>> changes after a respective comment was given (see also below).
>>>
>>> So the guideline is to separate by maintainership, e.g.
>>> x86/arm/common/vpci
>>>
>>> Also separate out anything controversial and/or that receives feedback
>>> so it is not mechanical/straightforward anymore.
>>>
>>>
>>>>> For 2), I would encourage you to consider the advantage of keeping the
>>>>> changes as-is in this patch, then send out a patch on top the way you
>>>>> prefer. That is because it costs you more time to describe how you
>>>>> would like these lines to be changed in English and review the full
>>>>> patch a second time, than change them yourself and anyone could ack them
>>>>> (feel free to CC me).
>>>>>
>>>>> For clarity: I think it is totally fine that you have better suggestions
>>>>> on parameter names. I am only pointing out that providing those
>>>>> suggestions as feedback in an email reply is not a very efficient way to
>>>>> get it done.
>>>>
>>>> What you suggest results in the same code being touched twice to
>>>> achieve the overall goal (satisfy Misra while at the same time not
>>>> making the code any worse than it already is). I'd like to avoid this
>>>> whenever possible, so my preference would be that if the English
>>>> description isn't clear, then the respective change would best be
>>>> omitted (and left to be addressed separately).
>>>
>>> Yes, I think that would work. Basically the process could look like
>>> this:
>>>
>>> - contributor sends out a patch with a number of mechanical changes
>>> - reviewer spots a couple of things better done differently
>>> - reviewer replies with "drop this change, I'll do it" no further
>>>   explanation required
>>> - in parallel: contributor sends out v2 without those changes for the
>>>   reviewer to ack
>>> - in parallel: reviewer sends out his favorite version of the changes
>>>   for anyone to ack (assuming he is the maintainer)
>>
>> For this last point, I don't see it needing to happen in parallel.
>> Reviewers may be busy with other things, and making less mechanical
>> changes can easily be done a little later. The overall count of
>> violations is still going to decrease.
> 
> OK. Another suggestion along these lines is that if a revision of a
> patch is OK except for 2 changes, those 2 changes could be removed on
> commit to avoid another re-submit and re-review.
> 
> E.g. a patch has 50 fixes. 2 of these fixes are wrong, the rest are OK.
> The maintainer/committer commits the patch with 48 fixes, removing the 2
> unwanted fixes.

Sure, no concern in this regard from my side.

Jan

> Keep in mind that resubmissions of these MISRA C patches also cause more
> work for the reviewers/maintainers. I think we should try to find ways
> to decrease the overall workload of everyone involved.


