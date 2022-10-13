Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7E5FD811
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 13:05:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421861.667536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiw16-0003Ae-A9; Thu, 13 Oct 2022 11:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421861.667536; Thu, 13 Oct 2022 11:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiw16-00038A-77; Thu, 13 Oct 2022 11:04:44 +0000
Received: by outflank-mailman (input) for mailman id 421861;
 Thu, 13 Oct 2022 11:04:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0LZ=2O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiw14-000384-VO
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 11:04:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6445594-4ae6-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 13:04:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8711.eurprd04.prod.outlook.com (2603:10a6:10:2de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 11:04:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 11:04:40 +0000
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
X-Inumbo-ID: d6445594-4ae6-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5zBxPFkpc9m7nzwPbsUgrB1H02RPuYGFPFd19dxZ6xR0zZx0QziY6HwJM6n5/djj9sTxONgKHrziCGOrqmeivt8FMzolGBCoGuDcl4pVbad0I2p/pRH32dGma/fbtnPlBS4HEvj399cm3y1TLdEGpr3XqfmktYB55Cilp3uWOtVmsGd5m0d1CaRgc6xyhGX2va1kcFZx6H4K9KBhtKhKcz6GI2S2HMf2c07UnrXFa6lIHHsK7S/unSjSsP1lSTFXjae3ZQ/nxp5iadGpLropFXFyfT/1SWePAKNr1x4sJoCBXChl2w+QS627H72kDhmNgEguwYu9FmtTbNYMp/Q9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wj9hkEPfZbilBstNTw+St8QZ5chhYXD3rDXCRvKu/H4=;
 b=kbxMBCn1zKKZsz5/xQpijWDIGcdraWONNLCTu8KMVAXjGvAe8vjL1FRu4RrJXsXJozyQDbNTl9DP8VO3Cv/nGFsiqyDf8XbD0kUiojtj8Ae5ajaJQf4wag1DYME7jumqkWk9eu/ncTL2qZkmwmGHJoNEJGi6HJ3z1dTVyR6XcLNUraiNULwOw3uCr3iCUWunQTWR0N+buPixuA91vbwsNJlEdyS6QID+UtUsLGE5EGwcZEuffYIybIhMIUHxbSMz1hvW9oPm77iqKSBZjfrxxJtlJzzy3mDHTtxIAVkGMsLuR38nBhgg6g6Ax1k4t+xZHwiGsxJWcpROloZEhetamA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wj9hkEPfZbilBstNTw+St8QZ5chhYXD3rDXCRvKu/H4=;
 b=ww8f1R4dkdEh3PBrIj/8vQ2DpFgsxcJPL3cgWty9z1udjlw9FMX5XM9R5lYCyYW+oQ8sqF7Odn4NDTUYQqJWpxblc1UgpO4disHU+kB2K2ILfxGZFbGCgZOzPuW4kmA+4XT58WFx3SdP36FsTUFI0QGgcpilwv/ERgK1gD+kFFWS5AtFl9gBunBixF1jlToljLoNCKWInPBfLehrFwISWOohNTEGcymBVmoCI3FtQ7WpM3MHTnKVuVCXDNfdSgSXvtiZIiKxILSUViN/05XH1EuifX/okNW3yu3K3GVuDLzdgOXq8bpAIYbWuzJ47ibKyzXF3Q+PcdRcPIGzuIfVIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03419318-275a-1f9d-6e00-1a3489659f22@suse.com>
Date: Thu, 13 Oct 2022 13:04:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
 <c1020b65-491f-e1c5-3ef3-7edb99e0435c@xen.org>
 <AS8PR08MB7991F3222D1C616AEF9C771092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <2c2b3e8f-34fc-1ef2-c086-233964e29e43@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2c2b3e8f-34fc-1ef2-c086-233964e29e43@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8711:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7938a9-ef2d-4186-ee43-08daad0ab9b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	trSEE4qnp+nFXBMoXujS85ullyNb/NQ/sk0X61Id5+iZV19Lpx2rxUbonW6I0osQdYCCB4Xl4aAvXf2HgrIFeFTbYJTYXEMEvLypz9vkwb5qN4YHt8tTC7N7q8dU2lZdKe/xdP6CbEUrx2EDWFdx95IIjk1Kj8IZNf5rFroJ40Ub0YLyMwPQ1+4I9ByfZATxoUTCIO/uf7RwutZRLv0N+/Vavlm3ol13rdHIFsN6nfZ7lA+4DS2G8UrtD/+Ok6AQ+gNLcwbSt+OgqEHljRSXWgfVj6iGykrNhWbPorVVz+TBzLgvTrTncNrBa84BCDfApyuRoxsZmW8jiWoRnd8SvphbABuAcWmTQR76Qx+RETrRNhE5gf/tfg3OzH2brqrN7Efr/KtbQOTRcdT8wWMK7lSS/yo1kllTKPXaQrFb/TLZkeWY6bIQJPfRoyaUPgZSACq66UvHc+kfnx7GKaVydXoqQP19J4+1uNTq3xtXvhII+O9enpisbKK1n5JbinrJPVzvBB1uNf3vNV705MBrL+US6deeST7SSP3UmHDUa69Q6meTNUaQQdSBUqVG4UryxSRcTyI8BtgWLK/Itq1L0Boi7PCt6RvZXRd1+mAU72rYTf9XjG7/i5uHytKJV6H0wzPNluYjffs+xxMi+j2W2b4TKJki+UsGUra2GiZgqk1kT/6QeH+5KV4scW8PaBUtklKEegFIKLzjT/gMwxqhXcmgIB3B9qMmOi9YVffQCk0rmZxd5DFtsaO04VhiGq9mSYZdCbbsagpe0mT5igT3ciQqLVx6pqKg2Ce5GaGzGQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199015)(31686004)(2906002)(5660300002)(4326008)(316002)(66946007)(86362001)(8676002)(66556008)(66476007)(54906003)(36756003)(4744005)(478600001)(8936002)(31696002)(41300700001)(83380400001)(6512007)(2616005)(110136005)(6506007)(6486002)(53546011)(186003)(38100700002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjBOUDhjcktKVVhSOWR6WHg0WnVoMjZyV21JVTYwQ2lDS1R2OHZZdzM3cVhK?=
 =?utf-8?B?anRXcVlwME45T0x5a1ZZOE9HWk1UYlozOFlSbDJFUEdPWUhMM0hRZGwvczJ1?=
 =?utf-8?B?NXo2dDdjV1plc1pGQjE4ZWNKTitDSzZVWjk1WCtpNWF0NnpEanZnU3JncVZH?=
 =?utf-8?B?L2xvVitvK0JZS044c2Jhd05vbW5icEJrcGVXbWJvUE51OUZBQkZkOEhMNG1O?=
 =?utf-8?B?QnZCcFFwM3puU2dUY1N1V2MxYmRpd09VS3NqcitoMDVKSUxDY0NhcExlT0lW?=
 =?utf-8?B?SlFBaHgxbHNxbHNKNHlxdDVoeE5oejh4OHBTRVRrZUNtWGx5b1dQZjhJSVFF?=
 =?utf-8?B?d2VGSFozRi9oZ0luOG1CQVRuMEc1Y3ZDMVJwTy9FMGNZZFRXU1l5Ym5kaFVG?=
 =?utf-8?B?UTBxM1RRcWNqcGdTR1g1R1NOMTNCTFQvWGlFQWV2Y2tDUGVjYXlzb25tN2o5?=
 =?utf-8?B?Q3VYTCtnYkY5cE44Q3lLVkxqekc0NUk4cGFnb0F6T1JqOVJVSjF2V1VtN09Z?=
 =?utf-8?B?RTc0WFRYZTBJTVlKbDJQSXhaSXYxUG12YlBpV0tOSTM4MHlvZkhXNng4SjNG?=
 =?utf-8?B?NjBFdHhvdHgveTZnSTQ1bjZKalZEL3Aydy8zNGtZMjNsc2gzSFZyQksrbnJn?=
 =?utf-8?B?amRGUVNCT0FnQUlieURDb3RNZHpjeEcrZWlFUUtpVW5uY1NnUFVCbXk5dS9L?=
 =?utf-8?B?ZHlHdWhyTFJHNlFsK2ltWW5NY0w0SUZ0R29DSEwvaUpXQ1d0S1lNejhhSW0w?=
 =?utf-8?B?QitzQmc5d3lWTFdMZmJ2YVFobDVSTFlxMG5CWXAxMDJ4Q09yUnVCdW5JVlV5?=
 =?utf-8?B?ZkkzL05BU2Nzczc2R1lldWV4bXVpTGhvMUgwVXI5QTRkZFVmSUVOT0QrZTRy?=
 =?utf-8?B?dkVhUzBUMDdnUGhoU0E4bEhHbm9pVTZYUFN1by9sQUg2OTlTN1VDT0pReWl1?=
 =?utf-8?B?RVN0Zi9uTjkydEgyRG9JRURZN05QZVlaNnZnaGM5bGxtNGs2YmFWVStaVEp4?=
 =?utf-8?B?ZkkyeE8yNU5pejRzSi9hZ1I5TU9RMEJsZCtLZTYyT3VwYi82Q3Q5RDBnTWUw?=
 =?utf-8?B?Q0huTHN2dDJlM1hjTHBlUWZta1FNa0lHWE00ZVEvMTZicCtkYW5UWGd2bFA5?=
 =?utf-8?B?Skg4SVRGdG42S2FRSU14akk3eHB2dDh2N0dzV20xU3UyYVJSOEZRaU1ZdWtV?=
 =?utf-8?B?cWtGeDNocWpZblpJUnZQVUNJOG9NQUFVTDdKMlN0NXVCM0RsUHVxdTRxZ0Nm?=
 =?utf-8?B?NXRTeHpYRjRGWHJRSlp4RGVnOHhDd1M4eXJ6NVRRQ0swQ01QcmxYNGQrOFhB?=
 =?utf-8?B?UE1nVkFHVlJOMnlsL0QzZmVDRnZWZ1UzVm90TXVFL0UyTkRuUnV6eEdlaU92?=
 =?utf-8?B?UHI0N1VXNmErUVcybVBldmkwNFArZ2NoZzFYQlBMa2xiTXUzUjJKU1pxcFRa?=
 =?utf-8?B?aVRFa0RqalRZcXdsdk9nMDN1bktJeWg4YXZmV3MvNzZMcy9BWEJtS3ZhTmQz?=
 =?utf-8?B?SEhlbm50Vzh1ekpZd2V2TDIwS2pRMGlSVmlhUGF6bmthNjB3NFYzdHJKYVVP?=
 =?utf-8?B?NjQzZWlWRG9mOWU2aFZySkNaV3BHdy9JRzhoYzMzcEZtYjRSOHhnQzNxbExk?=
 =?utf-8?B?SldkbDIzbk1SeS8wVCt6WldaRnhFT1VDL0o0aEFtekdxVWQyUVBpNVRoUWla?=
 =?utf-8?B?bWd4M3hBUGp3QmxUSGVIdTJUd3V4ZWpWRnRQa0lSeVJFSFlpZk1UK2dBRTQ2?=
 =?utf-8?B?SUhzT1A1citlQVR4WmMxdEgzNmN2Q1BVeEdFRDNnSmFOMEpxS1hNcU1CLzFn?=
 =?utf-8?B?VnUyMHI5QzczWmdpczhtWjgzZXpiUWVmQnA3dG1ubkdPZnB0d1JzT1R4eDBF?=
 =?utf-8?B?TTYvTWJsY3NMb3g0dXFxTHdDUExIMXcyUm9qUG95UUpRVEFuWmtUbktlQWYx?=
 =?utf-8?B?YTZBSjF3UmNvRHdWdlpkQjZXU2hIMmtYYllSREpxSFRoaWhmY1JuYkdLMmFI?=
 =?utf-8?B?dXl4NWpTTkNKaWZ4VzR1eTRMcFk1OWVpVWJERWlkUDRjWUhPRW5zcWhYczJM?=
 =?utf-8?B?YWtFbUlyR00wTFJTTnpGOCszN3pLYS9FRHFxMG13WG4rdlROREFZTzczQ2Ji?=
 =?utf-8?Q?NBPW9gUJ4Dm9FedHhO/bzcEPU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7938a9-ef2d-4186-ee43-08daad0ab9b0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 11:04:40.3942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i++u25J0yfnZT3Dt+p0imO0yfIfwCItUhshgxq5XniAO1m5f/UDWeSg5lONgMIbm5oYI7e8msdbvFu5Bnen9JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8711

On 13.10.2022 12:58, Julien Grall wrote:
> On 13/10/2022 10:21, Henry Wang wrote:
>>> -----Original Message-----
>>> From: Julien Grall <julien@xen.org>
>>> Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
>>> arch_domain_create()
>>>
>>> On 13/10/2022 09:38, Henry Wang wrote:
>>>> Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
>>>> when the domain is created. Considering the worst case of page tables
>>>
>>> Can you describe in the commit message what is the worst case scenario?
>>
>> The two pages will be consecutive but not necessarily in the same L3 page
>> table so the worst case is 4 + 2, is that correct?
> 
> So I agree that the worse case is 6. But I don't understand what you 
> mean by '4 + 2' here.

Assuming you have 4 (N) page table levels, isn't it 7 (1 + 2 * (N - 1))?
Or is the root table not taken from the p2m pool?

Jan

