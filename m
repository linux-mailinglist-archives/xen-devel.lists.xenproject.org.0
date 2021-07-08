Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F33B3BF35F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 03:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152798.282268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Icp-0005aD-8E; Thu, 08 Jul 2021 01:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152798.282268; Thu, 08 Jul 2021 01:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1Icp-0005XU-4o; Thu, 08 Jul 2021 01:14:47 +0000
Received: by outflank-mailman (input) for mailman id 152798;
 Thu, 08 Jul 2021 01:14:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFbg=MA=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1m1Icn-0005XO-LO
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 01:14:45 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1fbf00e-4eca-4344-90d5-2930bf12521e;
 Thu, 08 Jul 2021 01:14:44 +0000 (UTC)
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
X-Inumbo-ID: e1fbf00e-4eca-4344-90d5-2930bf12521e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625706884;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=83CwrkJjyOJ+U+ABfCUkVz9hB90og2+hFf3Fo7UbmwM=;
  b=U1tRJrbA8qz3qa3rw5H6GZl+QrvsCeRFWln8aNaJNnm5jEeVfoWrswDH
   O8jre4EFGBqgxi2ia+wh5w1KXpldxhLzwTZwZNIBO9wuM/Af/xfGaFJvs
   iy+77O2ymZyFma4KSSdrOvRAMTrP8xOI2uHEugw7yiPxA5QzrQzhmwiU7
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GQpsNhA0uFDkRYuYQENDswi2iA8K+3SjLbWDIjD5MzXJS6w8gRRuXPDZLbwUF1gYuBKBFkZjSA
 y2gQnCKrvMixv7BE3eTmhjEV3lxkDH7jBE4vusyP7qoo8WhdPMmmSyuoQuMTFXxXvOKeXfgnfZ
 EfDLI05/EpPKuU90gHT9NBPB0bYvh9oDduVRrBKHy1UadAiMlcKcVzzXzom1Eb2pyCGwSx6ttU
 5AxVXraNMoh8rItL/duyBMEEf4NIPlr86GZIPPoiNVDT3jmq9CyVkY7D9ayt3/YKCXGWh1m66C
 TlE=
X-SBRS: 5.1
X-MesageID: 48170263
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:sTxbaakYTo+cLl0I9Ysxuhu9/t7pDfPCimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPlICPoqTMiftW7dyRWVxeBZnPffKljbehEWmdQtrp
 uIH5IOceEYSGIK8PoSgzPIYOrIouP3iJxA7N22pxwGIHAIGsMQmjuRSDzrdHGeLDM2dabRf6
 Dsg/avyQDQHUj/Iv7LfEXsCIP41qz2fd/dEFE7Li9izDPLoSKj6bb8HRTd9hACUwlXybNn1W
 TeiQT26oiqrvn+k3bnpi7uxqUTvOGk5spIBcSKhMRQAjLwijywbIAkf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDy+IiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ/u1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh7rD3xHklVKvoIRiKr7zOSI
 JVfYfhDbdtABOnhknizyxSKIfGZAVrIv/uKXJyyPB80FBt7TpEJgUjtZQidtppzuN1d3B+3Z
 WyDk1frsAEciYnV9MIOA4/e7rANoXse2OADIvAGyWqKEk4U0i946Ifpo9Fv92XRA==
X-IronPort-AV: E=Sophos;i="5.84,222,1620705600"; 
   d="scan'208";a="48170263"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEWTiu25+uQ5HUexNW6UlJOFdWqvhmqUJc45RsibWoapr3SdWbYSMZBmDWFq3AKC3zyQdE8UgsPmf4oHPBpfVU0yflSKbMbDxZ71+6ruPWKXGWpAmmb8LcSYrcqBM2Ng5ywoYk8csBDH1r+dnoZwt1thp2VVxbdha2o9lq7i6dv1/dUbe1gRHVHuiUOf9WeiCuWpUyOYQAP6XGl1wE1AVDyNbYh7ijCnWW6mxZmcQfQ8Cli34PAFgG2XNR6R7sdvB8CMZkkWn6CLitZpObmPo/vG6657ou+0C6AVPQD+QGonVRplVNSvPTrKjyFXGYjZcaulL5kbRJoHdQNSVT90zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+uE/GoEh5pA47/oqCoiIZu3SZACAEBjH1E1VYzbE74=;
 b=CUvhvOfYOAL8p6xBenIiWsznlQziw8wAt1enhCAmZY79pBzPcdyNqTAO92n0KhC+NIDbtviQRQS+AbTYDI9zkbKM1B1f/dxltAySXfQx/9VAHTfYObtrDbavSl5lcTpcyr/zO95k9HtcVWOnxt3/AfVVVdQ0ISIq3R05tcNUR9aFAd/voebGOIGuDa6UJX2AvBDmQb5Ymrd975hXzqtvRmBx/RBL8oYT8Qw7vM13gOsP67QuLIdM+EeYNrKCA1HaxsViC0q9qX8G6u9coa0mdBxUNtaoKm2n/i1xckbg61SKdv+dmF4uAL6uCvZ9v0dF0pVefWp0mfXw0pKOBH3hMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+uE/GoEh5pA47/oqCoiIZu3SZACAEBjH1E1VYzbE74=;
 b=tqioW3EHpAovJhzQyFQ9NudWPtWWhwn9+xmNs3J9qAnNCafHRmxHTj0aUCueMapRWJwDIFX3dSiuOBj3Mw4TUzGQxpvabzmYDK1PQWkpb8gXAloL9teCtw2SyI0dWvkKcpx4uHcnHN0NKZQs+l/Ra1Cjs6PwnYaNSZ+dNxlHYEo=
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: <iwj@xenproject.org>, <wl@xen.org>, <george.dunlap@citrix.com>,
	<julien@xen.org>, <sstabellini@kernel.org>, <jgross@suse.com>,
	<christian.lindig@citrix.com>, <dave@recoil.org>,
	<xen-devel@lists.xenproject.org>
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
 <56e4d04a-dc79-ecc2-5ed0-0afef09077e7@suse.com>
 <8567bc8e-27a5-2f56-2765-e9b249764aff@citrix.com>
 <5dfb0321-ca52-5464-8bbb-c29d329d24cf@citrix.com>
 <ea392b06-6277-ced8-0cbc-40967fc1ca61@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <9e44dee6-a7c0-e139-4eda-a483b2ba16b3@citrix.com>
Date: Thu, 8 Jul 2021 02:14:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <ea392b06-6277-ced8-0cbc-40967fc1ca61@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0362.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::14) To BN3PR03MB2401.namprd03.prod.outlook.com
 (2a01:111:e400:7bbc::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95cc9367-b7ff-4119-d5cb-08d941adbf91
X-MS-TrafficTypeDiagnostic: BN6PR03MB2626:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB2626D32AFD2E3AA76EFF1C12E4199@BN6PR03MB2626.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HTe5kO0qWw3BrX+HK6vbkkzwEdu8f7s999bZc98M+xJaWv3e0FGrHRSQD+ZKfuF+MNQEbWf5oOdrf0FfW6yl6coqbrrqQrXzGdcuSqS7TA3nltiLa47l2eOebisTUvLOwQT7Xq/dhEbxzYZwr7M3fJnivETMWi8BoCyOqnY1dCyCA/OZWPUp+qfU2rBByHV4MqOCFIaOC5wJaA/Ibm21r5iN0Q9/Dj23pxden0g/ptMUSJygrdCsjXzt2+w8xp3MM9GAPw2+KgZcTMaAdMi7t1MRh1tf5DbNg0fidA/M2Y6VDEe7R8Cqk83dTSIz+PKg0eWLKdi/TSvH/wc6+UpkCm+LpzshLFhiiGC+4m6wswaLcZ8YB0s53yIQoqUXacY4Z0QmzCo0gWUXd4vjNDlrC9rREBomzhQziiuUjhltU9WlDdT2k9WLI2PrdLLwCJh08H90lzSdF2fS9A9atT0d0RhPbiJ6sJd7qTQqgQUvwseFLtA5DOZ7YsCVeAvA9Nqd3nQauJ6sx8+b0M2I+l5k+4b8gNry7+oM/thwIosrcsfkM4g5KCnd6QOhKPhTsLzRcTiouwMsRSW1KmojxgAP9JYdG8uLFEwBVQ3kiMaZt57wwwCkuLFDu/TutIDybHgtLHJMunV32rFgOCNp2E9U+8rDwyvcYrhlB8fxOFB010KajwDCDLPCStNIZsTiSLQo7Vi7ldD+kdTvyg/z0Tka9FKAzM6Cssx4169pl3FsuNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR03MB2401.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(66556008)(66476007)(478600001)(16576012)(83380400001)(6666004)(8936002)(8676002)(110136005)(44832011)(66946007)(5660300002)(2616005)(186003)(31696002)(86362001)(36756003)(956004)(38100700002)(53546011)(26005)(6486002)(2906002)(31686004)(316002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXJyaExJMmFvZ0puVC83ZlVFeHVCSGozcTQrZXpYQk5xdE5pQ00wNE9EbFF6?=
 =?utf-8?B?Ukd4VGg2OUp4Y1UyUkpCV0pxR1JVcSt6ZGhUSUxTK1RYMVIzc01wOWtnYjhK?=
 =?utf-8?B?Z1Y3alA2MWhxNkhIeEtvNVZ3TTNjUkJtcTJmc2J6dGliVVN6TGRqZW5aR3Ro?=
 =?utf-8?B?NnlhU0pOQUNxQktjZWZPdGxOMmJ3OWRWelZUN1cyRmo3V1FhZVRjTXRVWHNi?=
 =?utf-8?B?bklhenNXcDNRZTFkYTNNQkhWK0pQTmZqdjltYXBMTmxhNFBVSDE0VW1qdVNm?=
 =?utf-8?B?cE53TURmZ1ZLYXFNOFk4azlTQXVjM2RyaDhocHp2QndPc0h3V3NwT0tFSnZR?=
 =?utf-8?B?d2xsTmJ6MndrS3Y1d0lQSXpPdjRBTTFBVFdTUGc2UHpTNEprVkJrVUNsaHh2?=
 =?utf-8?B?c0M5TjJ3MEN2Y0krUkhMUHl4WU10Q0RxaFZVTDNmbXUvTzVqbVhZVkNiWjJI?=
 =?utf-8?B?aytrRXBZZnVYZkFzTERYR2xzaVBaZzNyVjdVWmd0M0FqcXduTHFoNUpoNTRt?=
 =?utf-8?B?akFzbC9CdXd2NmYzL0VxOWtGMGJoeFZTcEFpbHl1bk1KMHJlZ3dUWkthZUQ2?=
 =?utf-8?B?SllXRjJESjMyT2llY2U4TXNDYmlEQW40L2U3ZnlmVmhLMU9YanhjVUNXMXFS?=
 =?utf-8?B?eWpBRlZtMHdqYkhHcWRmZHhXbjlnZnh0UFR0L2YwdmE2djNFb3VIcnVOcUc2?=
 =?utf-8?B?bmxZOTRTeUxOZzVsZ3NMOHd1cFVYQWtrNXBDMjhVRHZkYXRzWnViRGx3V0Y3?=
 =?utf-8?B?RGZhRElBVnZtNi9tQndiYTl4Q1E4akRmYTlFM1BaRGlMMVovUkt5SFA2THZH?=
 =?utf-8?B?SkN2VzZHOGcrMG95bW1naHN4aWRlTm8zUXNnaGt0cUZBenhnOHJkbGxrV09q?=
 =?utf-8?B?RXA1aTBUWXJKRzhFN3BSNFhLWHNrRE1NUG9VaWo1U3hmaml0TUZOa0FKZlMz?=
 =?utf-8?B?M3ozSEJiYjRNSTI3MWh5amFwYk1MS3N4a1NmSWpIK3N4eDJQNlVwSGZsUzBz?=
 =?utf-8?B?SU9PZ0labVhuWForeTExUDk1dk9XQW9JZmR0VkRjbUN3a2tOTEtqQm5qYnU3?=
 =?utf-8?B?b1pWTnRpVDZXVEZyRzFXWGdiSkxXWDlCTTZ5TVp1YlVPbHd0cGdMVnJVNXFR?=
 =?utf-8?B?WVJoclAxOUNuNy80Ny8yd0dDNDRGb2ExYlJQT2JUTzdRejFuczVyT2hHSnBB?=
 =?utf-8?B?NHVnVFpQOGxLTGErbm1HQUh4bVd1cC9wNC91R0NtV3c3MCtjZVFKcE0vcWNo?=
 =?utf-8?B?M2pEWEttU0YzQ0FHeVFra0l2c2ZNVnQxbDBFaFozM0JqTkZaTS81T0dkcitK?=
 =?utf-8?B?SVpwdWhYUGN4bllSV1RkV2lQa0VsaG0vb2JxNC8yZzBncnZpemxlTVFPeUxG?=
 =?utf-8?B?YW5kdXgyZzdTcExMbUVHSTVTaE84NC8yM25KcE1lMU9VWlRXbWNKZzVRemw2?=
 =?utf-8?B?SGFFc2w3SWkrT09MbExyc3pweWd5T2tuN2l0NThzZWNmZ3c1TCtQQWFUaUpB?=
 =?utf-8?B?amlKUE5rak1aYW4zRnZUR1V4ZVd4TXcxeWtvd0l3TFZQTFZIaytkWDY2aTJv?=
 =?utf-8?B?dkdrZ2RVTFRLZWxuZHpqUktlSHRqMnhtZlZKMG1nSWROWjg0OTNnbjY5Qk40?=
 =?utf-8?B?Y1FBWjBPMVl4RzlIMEIwbWtpWFhXVlRUai9KQTY4SFN6a0xvcmNJaWRvVFU2?=
 =?utf-8?B?Q0R2S3JKRWN2aG9YYkxESGdrQkNOQVYzNDUxU3ltNzNkVDRhRE5GdEd2eDB2?=
 =?utf-8?Q?cSIcS1dySdasriDD/aJkj3gqn9QX1EQb+aOu/nG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cc9367-b7ff-4119-d5cb-08d941adbf91
X-MS-Exchange-CrossTenant-AuthSource: BN3PR03MB2401.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 01:14:35.0548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olCAdGDduddyNozFhC4BQxPjtm/b9R9ihHVgYfbBxW0cz6vng+BoKlpVK6Ep4TdOMjL1tGIXBUNpHLkwX5leLMM8HxYy9aV+WFJjE/72g4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2626
X-OriginatorOrg: citrix.com

On 08/07/2021 02:11, Andrew Cooper wrote:
> On 08/07/2021 02:08, Igor Druzhinin wrote:
>> On 07/07/2021 10:19, Andrew Cooper wrote:
>>> On 07/07/2021 08:46, Jan Beulich wrote:
>>>>> --- a/tools/include/xenctrl.h
>>>>> +++ b/tools/include/xenctrl.h
>>>>> @@ -1385,7 +1385,7 @@ int xc_domain_ioport_permission(xc_interface
>>>>> *xch,
>>>>>      int xc_domain_irq_permission(xc_interface *xch,
>>>>>                                 uint32_t domid,
>>>>> -                             uint8_t pirq,
>>>>> +                             uint32_t pirq,
>>>>>                                 uint8_t allow_access);
>>>> Take the opportunity and also change "allow_access" to bool? Or is
>>>> use of bool prohibited in external interfaces?
>>>
>>> We've got bool's in the interface already.
>>
>> Where exactly? I couldn't find a single "bool".
> 
> $ git grep -w bool -- :/tools/include/xen*.h
> ../tools/include/xenctrl.h:1844:                          uint32_t
> domid, bool restore,
> ../tools/include/xenctrl.h:1846:                          unsigned int
> nr_features, bool pae, bool itsc,
> ../tools/include/xenctrl.h:1847:                          bool
> nested_virt, const struct xc_xend_cpuid *xend);
> ../tools/include/xenctrl.h:1954:int
> xc_altp2m_get_domain_state(xc_interface *handle, uint32_t dom, bool *state);
> ../tools/include/xenctrl.h:1955:int
> xc_altp2m_set_domain_state(xc_interface *handle, uint32_t dom, bool state);
> 
> and loads more.

Are we ok to have different types in ABI interface and in libxc
function prototype then? Because I was referring to ABI structures.

Igor


