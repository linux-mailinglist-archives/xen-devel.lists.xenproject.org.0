Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC5C316745
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 13:59:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83590.155901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9p4Y-00024I-Vm; Wed, 10 Feb 2021 12:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83590.155901; Wed, 10 Feb 2021 12:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9p4Y-00023t-SQ; Wed, 10 Feb 2021 12:58:22 +0000
Received: by outflank-mailman (input) for mailman id 83590;
 Wed, 10 Feb 2021 12:58:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08uA=HM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l9p4Y-00023o-AW
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 12:58:22 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcf6e080-0927-4f31-ac19-9487c25a0af7;
 Wed, 10 Feb 2021 12:58:20 +0000 (UTC)
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
X-Inumbo-ID: fcf6e080-0927-4f31-ac19-9487c25a0af7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612961900;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=41Vdhg3SptdnpWxAfI6sAP+UXQNkHECufq/USFIug5Q=;
  b=UgVGDw8hZ/c8fWGKip5D4br0SU+x9t4F6Yqk+KKsCOqBwH/du++esEsY
   7jiHm8HcFCixQyuazP2GxqE0+ujPz/RQQsvn3LgN59go/oyuDdEfi6ikT
   ObZFEvpXwGIFDRih+t1Mf90UhTka4gFBERGuOs8Cc1ElyFvrHjxVWm2Xx
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mmI2HU8iDsZ+ZDvUYJqnDm7ognZ8bl2KD1kr2C4ujJEcmF7zEgzbdn//fcONBXPRqNjThHnhNp
 2ZWHUnt2IQaSBt4UnxQi3HOPi/KRtvS2MvirXhcBmu7IHsssTWIk7KN70kV+llON7CbPXH91cL
 E6fp1Op9xdhVx/Fw5hAYesnWQIueCVCIqSRoAg2E484bG6UuVk1Mhks/8QI0UdG7rzpEho4uDZ
 FMnUUqrcaadKyrFMcyfVjPmpsfxpvpAUvNWKu5LCv+kUrdTgm1I5aa1eOQqkkA2iVEKQK3Y3cM
 8X8=
X-SBRS: 5.2
X-MesageID: 37321311
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,168,1610427600"; 
   d="scan'208";a="37321311"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUxq07yNxR/wdw/4xWZjwxPrXPpgNYI8+aFmZWTKavuF+bySgI7u9Fl23bHbSkzVSumlH/Lzl0/iiFfYFTTOzbvqTGSbcnAJLCRxHJHqL+J0u3VyW61U6CHQ+p8VI47lxU972iVMQCqJP2uAKOQIUlCCT02LLL678BH6gSorfTrfuo0zoW/rKsoeHoD/PBnznxo5d9yVby3v/BWoXbwNc8C0cJ4XyWBmTVUsgaFBYlz8wybPY/2v32iX1GZXKGgoQ3EbmhfwSCM1OUI77W+rkydfzwKUqB+d80GJxT39WsBeppkRNPJyFCnWRz2ffWutT1wYs32kiaZCtKLcqiNJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmLS1XXA8+GOCyTy3cOL5oRSgP2O+b1POeq3ZqBmk+E=;
 b=EESNuh4msTMWI7USWUcpyV2w5CUyM6x36VL4D2946EQe9sSaR6i2V7wYEw/DfopN1YIBXVy5F+zNGaYTl7sbIwKHFawi9NJLbvGIcT1LzKiHT7WoOFN0L3WHjIGYZvqNkxuf+9HWjV3FwfckdqhVdyRhX/tWZFlnJ2ZQrFFOq3ew07ejLgx5NAOeqYvBy3pl7MaBMmv+M5h+hY0rqveWI1/AfXmkEhRa6ZRVoxLNi+aKYnrYWxPrGyBAX3fQAL6ioB2jXiuz55bqmmngG5+HEdzfHPl+zrYubGkaJSfbKDpdyWcNHOFlQKaflAVCRoosC6f0BxE+1qrXndRaV2Ucqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmLS1XXA8+GOCyTy3cOL5oRSgP2O+b1POeq3ZqBmk+E=;
 b=eKxVAhmQrpPR0prr2fze6a9Cuw9i16zv/zTcTcb+fDierKjRuiTWhf3m428H2cCHBRbpRvwrVYtULv+akKWrD0rndnnOKdgSQ7t5b8iuEFpohOjdGCkFyp5WXZhcNfcDGFM+Cf4WZOydt1WmEKEeapXOwjM0MELV9v71yXoOrOI=
Subject: Re: [PATCH for-4.15] x86/ucode/amd: Fix OoB read in
 cpu_request_microcode()
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210209234019.3827-1-andrew.cooper3@citrix.com>
 <0cb0e48b-68d9-3de1-42e1-9a75ac2795d7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cb9b52fe-f43b-a45e-2a38-88d422763f5d@citrix.com>
Date: Wed, 10 Feb 2021 12:58:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <0cb0e48b-68d9-3de1-42e1-9a75ac2795d7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 781d03c3-5f07-4453-4b50-08d8cdc38852
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5663:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB56637FAA1778EE81F2AFC1C1BA8D9@SJ0PR03MB5663.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RzR830HdkI/du8euD6cVhrF5iC+tHgCJGOEuKMPFRvzCPhezwFTcbsfj9Rkcuz9vPTC45aWjouErmst1lPVfQzfdRwt9UmfmghNM5PdtZVwEqmrQdki55Yfru9Qekl8awGg63iIvfC2TW6Xifvt0PoY6WzMJ3ri+JNbbqEgQiXY/Lz6s4rBKLMDzZNIzBhNQRGLJxJDlXn0rQXlV0hHjYhaGV7/zIvEFP+gEYOrIodzmbRfqvNDwed28o+Mdj3RDR+jQ5vDogn+ueK5nnDPIXT5rneLu0tZHIz4Zk+f3LA3kZnAKYRa4p+NTiBhoSeEYLyWE08nvNTa20+5YZytj8puiIDHE3RQGoyKj2rOqvhzYBpe2Wl+CoAXWuu9x2lFDFdxYgxADqARdj6jtNioac1qj1N78HU8HurVestPimtcHKOPDVKy8Vo9ErMtvf1UtT3hZFe27uJ5L5GkfhHA3GQgg/XfnrT7VDYRaNO/5SGltjlg4qJOEbgWFXlTtw3K/fqiuMvHgOWM7GsRaOPGQ3s68cw1vofOqo30qcBwAcPIij04auoFopQ7QyFaGF8I2kE1tO+BOFcptFMy91Wy5q29VtFnsFKu3H3ePuaXjL34=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(478600001)(83380400001)(5660300002)(66946007)(66556008)(66476007)(54906003)(6916009)(8676002)(6666004)(4326008)(8936002)(16576012)(316002)(31686004)(86362001)(31696002)(36756003)(53546011)(26005)(16526019)(2616005)(2906002)(186003)(956004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZU0rSE1RSCt6UVRPenBhaktmQkxTRFJucWk2VkZQczhGZUJoNmtFS29yVXl3?=
 =?utf-8?B?YXBmQzBxUmZOOXo5ZVNkTnJTRkdTSUcwUTlGYTZWV1RibkFYN3ZQc0NVSVAy?=
 =?utf-8?B?UXpLY21jelNiWVB5dGJFSk9XWEhEeSs3SndtWTFta2tKUkNUNTJnMER6MWxx?=
 =?utf-8?B?TlJZbWdCeDF2Q3djeU5Ub0ZCTEFqNUFFZjVxNFNPckE0MThFdzJ3LzNtT09U?=
 =?utf-8?B?cEpRVVJ0RDc0bGNKQXhiV0NWc2xEbmtMbGl5aEh6UjVRNFBtWm9iazZDcDdR?=
 =?utf-8?B?VVNWL0lmZEtueTB0WCtXNVBYcWtDb1BBYmFDemNLbVc5RFhZWE9RWjFFT0wy?=
 =?utf-8?B?QVZHbkZNSW9xRjFtWTlWMW9PTUFjL1pSNjBvRFFZVThwSUNwcHZjMGZGN2ZK?=
 =?utf-8?B?SlN4d2xwUXpTSGY1QytxaGFxek04d1JGSUVDYTNGOWVTbklTV3VTTW1DTm56?=
 =?utf-8?B?LzNrTDV2M1VSYUZzZnNBZWZ3QVhuNWZ4Q2Q1THJhS21pK3ZaYldteXVoRnIy?=
 =?utf-8?B?bFBHejBrcS95cVRST0ZFUnNGYVpkM3FhaG1WMm1XQjFhYVdYVDkxbG1FRGp4?=
 =?utf-8?B?UmtzVkZRcXFtdnk5ME5jT2FnSGxvbWtxbGQ0WEZ6RE5hZE9qOVpDajR5dUVU?=
 =?utf-8?B?MXNKUDQ2NkVLSXR5ZGsvZk5laG9pMW9iQldVcG8zNkhFVWxkTFdZSkI5RGQw?=
 =?utf-8?B?dFg3VlRPSTFMNSsvbC9aWUN0TStkZVRheEVBbWhIOHZlbmUwZjdaK09leGV6?=
 =?utf-8?B?MjA0MHNrZ2R1eEE5RVBISE5XZTFjeXlkeDNGeVkyRE0rZDdLbjBnSlI4RVIy?=
 =?utf-8?B?RDFwNlF5a0tkcHRkcFhMckhwTFplZTlLREh2NnFNMVRkZmhzWDdaUmVEUlNT?=
 =?utf-8?B?WVVEN29JMWw5TldLR05WeGp1SWtxUkpHWXB4YW5zK25PV3dXL1lmcnRZMzNO?=
 =?utf-8?B?N2Z1VWFsTk5nUW1ISTdBZ2YrdnBxdE02cHJzc3d1Mm5ySnNMdDg3NFZLbzg1?=
 =?utf-8?B?WFU5eGcvZ0Y4UXFjNk9XMHZuSzhGNk80RFlnZVBQcU40dXUyaWtZekVJNzVT?=
 =?utf-8?B?MUhsaFMwcmY1WjlvbTBQaGpKaHYwckduajVVWkYyVWlYVEFKRTNxMWExTm1R?=
 =?utf-8?B?Ynh3bU9YSEl2RTcweEk3NlJZNnBuL0Zmbm5TTVNvQWpubGE1Zy9xS1dFMUJR?=
 =?utf-8?B?Z1lmZkZEVHQ4c2d0VE9jSzhZVUowRmRSL2lwc2kvdmpld2ZMZXpQOHg3czlh?=
 =?utf-8?B?KzZidGoyNk1UZVh3WUVyYnVWWCtwYWR6OVNSaytRTlJxOEs5WmxMTStCeFVa?=
 =?utf-8?B?OFIveTZZT29nY1J4eUxOUG9icHlOSUEweUhOTGRDK0NCL21Za0Jneno2ZWwv?=
 =?utf-8?B?czA5bTBCRWtQT3QwRHpQQW4ycXVycnVobjFaSEptb0Z0T1llSFEyQURRa1VP?=
 =?utf-8?B?czdtSWlaUkFsci9McmpnUFRrZ3VvTXI4QysvRWVBYkJsaFdjZlh4dlRuY2Vh?=
 =?utf-8?B?TWRsdzN2azh2UzNBL3NnbDh0cHZwOUxvTWR2ZERxc0o2K1NGUnQzR3NzMVFE?=
 =?utf-8?B?MHVUZDZ0VThtOGxmais0ajRmSEhLRmtBcWNGck96WDFXVnh2VmF0ZFhoTnVK?=
 =?utf-8?B?ckRhaWlqanNMM3daNGk4VXRCbnVNcitqc2JDazFIYk05Vy9EYzhFNFJaYW9o?=
 =?utf-8?B?eENGdGV5d08yUGVBYWdMcENLeDYxMjJaVlNiYTRoeDY3S0t4VWdwRkxKWTRo?=
 =?utf-8?Q?VGAiWFAXssZ0vPBjHoNUVzZHnE1CK6Nch5YuJ9j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 781d03c3-5f07-4453-4b50-08d8cdc38852
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 12:58:16.5994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUxoEpwqLAdSspvJeIsVO6h7eS+FUyQEa3pW5GD1Uwe8RicmqYPGXWj7cP2rbxjbv/Hi+UJ0mOBMLxSC6QUpryPup6DxNclJi9I7MlUKV3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5663
X-OriginatorOrg: citrix.com

On 10/02/2021 11:00, Jan Beulich wrote:
> On 10.02.2021 00:40, Andrew Cooper wrote:
>> verify_patch_size() is a maximum size check, and doesn't have a minimum bound.
>>
>> If the microcode container encodes a blob with a length less than 64 bytes,
>> the subsequent calls to microcode_fits()/compare_header() may read off the end
>> of the buffer.
>>
>> Fixes: 4de936a38a ("x86/ucode/amd: Rework parsing logic in cpu_request_microcode()")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- a/xen/arch/x86/cpu/microcode/amd.c
>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>> @@ -349,6 +349,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
>>              if ( size < sizeof(*mc) ||
>>                   (mc = buf)->type != UCODE_UCODE_TYPE ||
>>                   size - sizeof(*mc) < mc->len ||
>> +                 mc->len < sizeof(struct microcode_patch) ||
> I was inclined to suggest to use <= here, but I guess a blob
> with 1 byte of data is as bogus as one with 0 bytes of data.

Yeah - its unfortunate.  On the Intel side, we've got a fairly rigorous
set of sanity checks we can perform on the blob, and on the AMD side we
appear to have nothing.

This at least prevents our minimal header checks from causing OoB accesses.

~Andrew

