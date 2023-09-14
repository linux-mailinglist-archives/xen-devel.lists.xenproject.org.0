Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFCE79FC11
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 08:34:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602057.938411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgfuS-0005Mr-3i; Thu, 14 Sep 2023 06:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602057.938411; Thu, 14 Sep 2023 06:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgfuS-0005Kf-0n; Thu, 14 Sep 2023 06:33:04 +0000
Received: by outflank-mailman (input) for mailman id 602057;
 Thu, 14 Sep 2023 06:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgfuR-0005JH-5n
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 06:33:03 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe16::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cec0435-52c8-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 08:33:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7344.eurprd04.prod.outlook.com (2603:10a6:800:1a1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 06:32:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 06:32:57 +0000
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
X-Inumbo-ID: 8cec0435-52c8-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcxUnurvx9UABXA6KqtfmaYeA0b5GAPXwhd0xxL492WC+RDj3DH107RLmjNF8u6jlPZRk/zYKQ4+O7iVCA0IYjO4fHDdz2xs4hAd6kr3v+YoHPEUWIZcWRK9E9JxBAoW3QXYt4FtHK9IMtyPn1YpJhFBVGdsY6BivPdZQ0VjhEZMx8YKYExvlNIzucEu4tw83NuPCEsPBsiil1YLNKwxWuYqTysZ8Ftl+hVZGTuLs21iR4He6e2RzL1XMy+jqrWK5got2zdQ1Q3200HP7Lda0GnH5lb3mj44eWvm/UfoQ7/IKZEOwTWQTOIuaNg4/A52OB3ycFOHf3vahZnpvxz8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZgfkgbebb0WuQodGwibDCd5fguaGtt3PRhAHB/noX0=;
 b=l751iv/DZsZZX2hlqwryjVBk6qCVKs1QF0TGbGKO/RDHLZFMfKuVeUTIYe5RBAiAhAbkfwIeAoxJQmK2lGLu9IMOFH52CbmtREtAU8F1rr2WcoggJmjf289WNGIVUyTl6fAwin1uPhbhp5zqPqafcrzr8sS1Ui8pjfju4xt2SB2dffYEE6jzgJ1b/AQxiB9AjimlmnpE7mDzhDeClTdDnxA5b+1Qg5CxGPLjk6E8v0U8wjuGvmQEdNL68q2bhT48dVF5ZqORZaKZQjxO9rXXTYEJ6MZvcCtTwo2MVRhP75O4/7WZAU7TbyXFn3SdMai4elLNfe36bIJTMsZWDlqJtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZgfkgbebb0WuQodGwibDCd5fguaGtt3PRhAHB/noX0=;
 b=fZsqgBVMfFw7gFNiDYtBkVS2I0j0GECSv7geC0KA37oRvztt/L24gFMxmDCGhbZ/EKvZh/4oGIBEdqFpkfbPSN6mDvaILuM89/G9iE+cJbERklskf+bH4gLB3pz0OwCNduhrsx9P4oAaOCvUUdSgrUgn7T9dtk2pwKwo+JgzENXLMfRIefwwYafLIwS34oWDDiqkZt/6zVjj7UWlkW7XnLaeDCq82XyMRA1oV35m/rNVHvjpk6wmWiq0sfeyJSWTaHlKSsjRhYIexfmCL2D5okgzL7NxVkqcKQW1QOQCv+x2VgstR+ZgBrtqI1szBEpAKS9NjdSJYqOGYt23oVR1cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dfbbf38c-8651-5396-c966-365fe954df48@suse.com>
Date: Thu, 14 Sep 2023 08:32:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 for-4.18?] x86: support data operand independent timing
 mode
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
 <e4ab7415-cf72-4c04-93dd-fd393f49f6f5@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e4ab7415-cf72-4c04-93dd-fd393f49f6f5@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 858e9895-f602-4b1b-2d33-08dbb4ec6f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h6VmipQGLhf98qw06VljAnPPXbGCPmPTw+4BHLlVSzHUkHXE+MfOuqobnE7fSRqCX5PuAVDX9KM6Rvqym9OvCA2C2gcBjIe+clDw/qscaoGj/vQDUm7b6svh+4zbmQ5DRm/SL3T/kaJVibyCcjzi5EpjYLGvwPYVfvu7yjSI/48HUm+TrWMe9G+zRDwjf2WAJFKaYP8RPUjcnfxmhH4UiC1iNeLHBXAGTXYPn2Yo5o8D+fmxtWcvB0CV02lKjiVx5CsZvMK41nyopYYUH0xuOIJyrzXJovTMBLPRYIfiNkLizfH/ry1TYrB982G0mohJ6iBcpS250weO1s9n4j7v/VWKWyWE/Fe7tVWKS/2dNw2FwGO7febrGTdviQlIF25ngCia6V2e3UmBHkwPDRGxckVRkN4VgCtQ+wj5FsBFr7cLSOhKxGDmPRvEjHFco75OWiBe/8BEoTeY+GlR66+u8lq5qv8tolWcIvYaYHWzXwmB3hA/pDAIkjJOZKFmietGvPgEmT8dBfJ7SQQq4a4o+s7h0KUepYAXktd9fYHESPYXpwehCRTx1pVXZi/1+pwu9Z7wFME/KWesG2eTMyLyat+AAOEYd4B93Kbq6u+vq4FFBXa/So4lG43CjgJ2MBYp9TR8PK3BNrFW+v47rH1GhIvlWh8m9xdJfu69z/11EjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(346002)(136003)(376002)(366004)(186009)(451199024)(1800799009)(31696002)(86362001)(8936002)(8676002)(4326008)(5660300002)(2906002)(6512007)(36756003)(6506007)(53546011)(6486002)(26005)(2616005)(38100700002)(966005)(478600001)(83380400001)(31686004)(66476007)(41300700001)(6916009)(316002)(54906003)(66946007)(66556008)(60764002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGVPVTZtQ3B2Y01GS2gwd3JVY1M2ejJyeE1RdGZOYjdoSFJuUVowNzNsWGdC?=
 =?utf-8?B?SUVzd0dCMEljVGVEWWFEeWtNK2JDaHdLQ2NnUHUxeG95bEl6cWcyZU5jc3lo?=
 =?utf-8?B?bDRIZjlock42KyszcGJ6RXJ4Rng3aFZsYVVrSUVpNXZHek1aY2YrQTRueGlj?=
 =?utf-8?B?Y3RDRTl3L0t1ZFpPV1BrL09EVWtKdGtHNmFQWmY3b05mMlY0aElhZXNoaU1Z?=
 =?utf-8?B?OVFLQzgwdlhPb1NhZHR1WGlpK1c5dGk0aEJrdGtScDB0RU14Y1pHSXJLRWFU?=
 =?utf-8?B?Y0pxU0JidjNMbDNMZHpCWHhHb1ZBc0hBV1dqZzZuVVNldXV2cnFZUDBnTjBS?=
 =?utf-8?B?TWxwenlzeGt1VmZXdHEvTGFhUkdoajhVYTQ4blJYSG03OFpwS3pCWXFHZ2FC?=
 =?utf-8?B?akJ3SEt2QVp4TExUVEtSQ3hTZkd0TXE4NVNGQ2t0SjgxZUNQYitaS1BFZ0dV?=
 =?utf-8?B?N2l3Si94d2RaMmVkcm5Za3Y5WS8rckhhdGExL2FlRm5EeTVQSnEvZzdVamF0?=
 =?utf-8?B?QkZiaHdJaFBCK0VJUXRjMVpNcnN0YTZneEZpdktXZHBLK3RCYVdNTVhUV05j?=
 =?utf-8?B?N2ZRbCthK0xVUkVkSHZqQzgrM0F1c3dzVHFVUGRxWHQrRjBqUHM2eFdmY0ND?=
 =?utf-8?B?NHk5VWhJbjllRVJRaUUyRERhNFZPNjNNbnRjUCs2R21RSGJHSjVadFhMTFZ1?=
 =?utf-8?B?MThwY3h0NVRyRDJ0RndTNk9BU3cyNWdtWFgzMlAyRm1DMkFTSDVhTkh4UXF1?=
 =?utf-8?B?OUFTbXJWMTRLaWJaWkVDc3dNby82cUZMUjJLZDJlR05Xb29XMkRsUzAvNXl0?=
 =?utf-8?B?ZDdwelQ5eUZ0bWYxblB1bVFHSFgrZ0U1ekEyMW1laUFSc0JpRllrcHE5bXZk?=
 =?utf-8?B?N0xYN0NUZFhDL3BWL3F2OGNlWnNjbktYT1oxTlQvOEFXdXI2RDRNVEVGajlQ?=
 =?utf-8?B?b3hQclJhTU1QbFFHc24rVHlpQk8wak5pYTliNnpTZWc4UUF0OE02bDRGSWxR?=
 =?utf-8?B?MWUxbzdiS0pxWEVBdnNMQVhrSGdQN09DdjJFRHplVEE4ajM4UDJ1WDlhYUM4?=
 =?utf-8?B?L2g0TG9INGo4dXNuY0pNUVJSV21GenNJb2w2L0w4cm52ampjY21XbGJFQUN4?=
 =?utf-8?B?MWV6b1VINkNibU9hL2I4RUoyeHByTUM0cThIUmhRaGJRd1QzcjNTRHl0Zk92?=
 =?utf-8?B?bHgzWTFOTWZXSC81NjQzVUluaytiT3RzOFpkWkxMa3BvcVc1dlZWVmo3YjVS?=
 =?utf-8?B?TTNyR09BazE5Nnk0QS82N3VQMFB2VFpkN2ZwVDN0ZnNBQXRkc3NEUTNWSjI1?=
 =?utf-8?B?YlRsc2Q2cGQwV21pTTNIUWxNWW1rc2pWSkNFUGNGSkZ3M1gydHBPNGlsN0JR?=
 =?utf-8?B?Sm41MWZ4YktqVkw0R2hvUTlDQ2VibHRzK1RsbUp0WDU4TVBJYU54akNhV2t1?=
 =?utf-8?B?bTI2YTdqV2pzbWlFSStOY2VueENIeDRVdG95MXBySzJ0VHFyK1Flb09pZkg3?=
 =?utf-8?B?T2FrMzFmRm5JMzkxa1RHRFBWMUtwSzlMNHp1WWtiMkt1dkxFMlB5U2pjN2hE?=
 =?utf-8?B?YldOa0VRNzFZZ2k4Y0JKczlzU3pabWt4YXdWeDdCNXZQTjBxbkl1TTMzd0k3?=
 =?utf-8?B?K1U5TGIxVmtNZFJIejVvT0d1QVJ5STBvZjlqVU1VbVFtaTBVT3NHWWxLcDN4?=
 =?utf-8?B?b2hJRVYvMlJ2b3RYYy85bVVSYXFsTkM1d21ISUVQL0daSFNLVEx1L1plWVha?=
 =?utf-8?B?TFhIMlQ5clBOQW5XbDFXTHNOWWVPbHlUcVBUb0pRU0lKajcvT3JRRXgrQjNC?=
 =?utf-8?B?UndFeGpHMEc3ODhRZjhtYTlNMTc3MHcyRERFUnFVczZwZ1dlRzFUVG9wRytt?=
 =?utf-8?B?YzVjU2RTR0lQZm5vTVRwU0F1V2hPcnJOU210K3RxWDR4Y1hwRDlLNm85Ym9w?=
 =?utf-8?B?QVg5emI1Qktid1VXeG1XSGNSalp6THh2Y2thdlZWWVlQZDRPWHdxdlhOSldL?=
 =?utf-8?B?ek8zVjA2RHM3NGttc0QrV3lyaVFML2Y0ck90MEhzUGtuYmpkWFV2cDB3dENC?=
 =?utf-8?B?WDlaY1k1Rksxei95cjZKOW9ZL1d0KzRYTmREWm9CWktrM2o3WFlTRzQ0VGow?=
 =?utf-8?Q?ctVwQONTu9QP4gZhBueMLe4xn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858e9895-f602-4b1b-2d33-08dbb4ec6f73
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 06:32:57.9211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDzBubFbCNM900p0qSUkMZJJv/ieVsfMlch0CMJ3Ehcxz8i54vpynadkzq+n6srafu/igqYnbOV7/wgF8ajk8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7344

On 13.09.2023 19:56, Julien Grall wrote:
> On 11/09/2023 16:01, Jan Beulich wrote:
>> [1] specifies a long list of instructions which are intended to exhibit
>> timing behavior independent of the data they operate on. On certain
>> hardware this independence is optional, controlled by a bit in a new
>> MSR. Provide a command line option to control the mode Xen and its
>> guests are to operate in, with a build time control over the default.
>> Longer term we may want to allow guests to control this.
> 
> If I read correctly the discussion on the previous version. There was 
> some concern with this version of patch. I can't find anything public 
> suggesting that the concerned were dismissed. Do you have any pointer?

Well, I can point to the XenServer patch queue, which since then has
gained a patch of similar (less flexible) functionality (and seeing
the similarity I was puzzled by this patch, which was posted late
for 4.17, not having gone in quite some time ago). This to me
demonstrates that the original concerns were "downgraded". It would
of course still be desirable to have guests control the behavior for
themselves, but that's a more intrusive change left for the future.

Beyond that I guess I need to have Andrew speak for himself.

>> Since Arm64 supposedly also has such a control, put command line option
>> and Kconfig control in common files.
>>
>> [1] https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html
>>
>> Requested-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This may be viewed as a new feature, and hence be too late for 4.18. It
>> may, however, also be viewed as security relevant, which is why I'd like
>> to propose to at least consider it.
>>
>> Slightly RFC, in particular for whether the Kconfig option should
>> default to Y or N.
> 
> I am not entirely sure. I understand that DIT will help in the 
> cryptographic case but it is not clear to me what is the performance impact.

The entire purpose of the bit is to have a performance impact, slowing
down execution when fastpaths could be taken, but shouldn't to achieve
the named goal. I have no numbers though, and like you I can only go
from what the referenced documentation says.

>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -204,6 +204,28 @@ void ctxt_switch_levelling(const struct
>>   		alternative_vcall(ctxt_switch_masking, next);
>>   }
>>   
>> +static void setup_doitm(void)
>> +{
>> +    uint64_t msr;
>> +
>> +    if ( !cpu_has_doitm )
> 
> I am not very familiar with the feature. If it is not present, then can 
> we guarantee that the instructions will be executed in constant time?

_We_ cannot guarantee anything. It is only hardware vendors who can. As a
result I can only again refer you to the referenced documentation. It
claims that without the bit being supported in hardware, an extensive
list of insns is going to expose data operand independent performance.

> If not, I think we should taint Xen and/or print a message if the admin 
> requested to use DIT. This would make clear that the admin is trying to 
> do something that doesn't work.

Tainting Xen on all hardware not exposing the bit would seem entirely
unreasonable to me. If we learned of specific cases where the vendor
promises are broken, we could taint there, sure. I guess that would be
individual XSAs / CVEs then for each instance.

Jan

