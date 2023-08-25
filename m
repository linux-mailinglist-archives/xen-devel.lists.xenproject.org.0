Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F23788211
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590754.923139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZSBE-0001zy-5Q; Fri, 25 Aug 2023 08:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590754.923139; Fri, 25 Aug 2023 08:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZSBE-0001xm-2S; Fri, 25 Aug 2023 08:28:32 +0000
Received: by outflank-mailman (input) for mailman id 590754;
 Fri, 25 Aug 2023 08:28:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qZSBB-0001xf-Vg
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:28:29 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20620.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5db794d8-4321-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 10:28:28 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7885.eurprd04.prod.outlook.com (2603:10a6:102:ce::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:28:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 08:28:25 +0000
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
X-Inumbo-ID: 5db794d8-4321-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSuun+BhA21AtfUzdd/G9WHdpTseyYka45rudcquI/kLz18sygtTsHJpHmiWvPxNFnSiEeUfVIndOBDnzqWOXiNx65rP4QYuCDH5qK5ORsDGeP0pzUlCpnqFzLHNUKrWOkxrHeGwiknxXl4V/4h+cNmZn/eBdYkftArBVKUxu3i9Zd7S4ieGuERUSyMIMn99POvxzdVITyQk4p2yEVK5KzYCkULhNmMGcChnUwY29wWy8y6QRozCeIhFnP9Mc43esxxspuDsCtDJ80PMbaWR1wbgAUmLIE26IukZf29FwKg8JjM8NbA5DFYjVfU2oi2AUzaJGnpePRLu6CDC+sYKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhU3D4cBeKzTMHJRkhxsFZi1AH/9cCcdV7wLjCUi+yE=;
 b=mBvroUnl1DMDPWDsNbeag0Iq3pXopVtqQyqaiMunCiNoHC4TW8j5+PLOyF4zaSsxLdNff2oBhxl9j6mZXLtE3upXZdbkM31HrJhfbZveUkDy2NwAkb99n+VwrKS7Hi2+m/TAiveCZRxE2S7cKI72fdQmIRRlvwvD13IMuFmNs76vuWCll6wChAArVyeHkxGyCv1PWoaZq1jaV13I6nPJ9wbJh8FZrHe2iznyKJXOJ4ElhKBbFChAzOBHWBO9GMSh7iIcA0FOMKr/s1XR59KShucCNx0KNZBlYbaryHQfU3+NcMjspB5GAXe8bcG2D1AXOq9+Bakl+vRSrtsfhUUdCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhU3D4cBeKzTMHJRkhxsFZi1AH/9cCcdV7wLjCUi+yE=;
 b=pP8UKYOirjz9Bfsa4Fohi7Kisrm7ROl9ni+BdHJoULYgL/2JwNmC4OUon+0Cp24q3/fB3X8UVvzaS1CSkPSfRbgUSeYPt9vWYVCk/9TZJlf2EmgAz9qyCCZbvRfSxq9b7g/vYMMqxyX0TqSDVOfdltJ80WxF921xYOKbNbx8XmgSqkYqdC1ylAaNHSie68pDJdl+VzUzLzfWbEgN0DQn5mgmabtOurIHZnWC6KX4sapnrs16qyt451lpgU2Ef14i7OkmGbrvHSjVTGGvLjx6TQejHNInrLRpBUOByxcQ77MENlFIBTcvmHaP1Ljt9fycGMnk713I0g7ah4MqMPkE6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <906c34d2-4e62-7819-2ce3-e88caf7152b4@suse.com>
Date: Fri, 25 Aug 2023 10:28:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: xen-analysis ECLAIR support
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: nicola.vetrini@bugseng.com, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com, luca.fancellu@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2308241453470.6458@ubuntu-linux-20-04-desktop>
 <aec70a33-b5b7-0bcb-52db-15162407c8bb@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aec70a33-b5b7-0bcb-52db-15162407c8bb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: cd10cd96-c303-4821-e5ce-08dba545408d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/9/7NkTzWnw5+HhhKvilxq+ojE/gTsKwzkmIHLB/kjKhB+7Sfq4d3Qsu/O9jyYOvAvaXGvrGHhM6XkzenrjsovhX6xZ54GmIwx6lYRGXgZAHIZVNJRHA7Q7NoUvbdsNqyvn1km72qJjrnjBNR2rFr3F+4VYLptCagizB5PBa1IBZlR7PS5JHQjxsF4ZsxYJi4Fv0qgouUAllOcosju8ek5o1ekLX5IbSeqPQOKOdVe1v77ozmPwlwshh7kmYhqeowVFAjW5yvGeKstz/WrBLqEIH5YYjSFqgfujKjgEkh+v9hlsnS1OGK6Kqtm3E4JS92Jag6TqaMYcd4RZ7f6SKt6VHl+WBq3naPA14qlhLSAT8H+WWmgU80sfC8dAnfJaLT3TPZlTQcdnzK0lgGpaS6tn9gJ6I+/21Zdw1yx75lzUOo/aNr0FT6PRtJo0xR8ZcYvmy3T5m92DuWm6ge7Tr7ud2hHvNthvFglAfsTU8rRiMDgolfUZ+04ifVRYloD04M6XlXU6u8p3PuAGQYi25dRle7JvXCjgY4BO4jirgrD6H0Y38OZAgqEYPqmYlm0WDSaodCGNh5SnACBdu1Bbs8ftagnGm4OzxP0OCYjSnwBsb3UJcvZDRT2nnD6zkht1+vyR8vY5O6lXs5GGjLu2OZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(6506007)(66556008)(66946007)(66476007)(316002)(6916009)(478600001)(26005)(38100700002)(41300700001)(53546011)(86362001)(6486002)(31696002)(2906002)(6512007)(31686004)(4326008)(8676002)(8936002)(2616005)(5660300002)(3480700007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1htYjhsWlVMejRBQkpVZDRGMmQzZkxxQ25NdGtpTnN4S0Y3Z2R5clJPL3RW?=
 =?utf-8?B?WkFaQkpkaXdlbi9PR3ZzSklydHU4TDl3S0V6YXRJTjYwL1B2bHdsYkVQNmVE?=
 =?utf-8?B?VlVBL0hKRVRZMmJhUUVXN0M5Z250SU5pS1o2WUM0R0xsSEhBK1BQeTNPeXc0?=
 =?utf-8?B?REV0RS9idkxtZzRqbE5lZHZwV3BhNmxNN3FZR2pGLzlIUlAwbXVUdnBCZ0xR?=
 =?utf-8?B?REVZUm5vSU9Lamw3MElHc1REQnRQRnFscGxvZEZjcFlaN01UajQ2L3RkcVY5?=
 =?utf-8?B?eFFQdk9XUlN0SHJqMlFpQWNUaGEvcVJKbFY1THlqNC8zTXNvM21nUHV1V2xy?=
 =?utf-8?B?UUw1c1dHN1k0d1p0WXVNV3NBc05YOTdTd3NoSDR0YUxZcG4ySEN0cnE0SGRW?=
 =?utf-8?B?VGxJUkNKRHF3MHV6QWt2a3hteDFHVWZ3aUdESW43c2FDVWQzUWR5SklubEpY?=
 =?utf-8?B?WTZsbmwzbGRwbi9XQ3pqMFF1Zk5oVHI5c05EN2d1ck5pMlpPM284bUxUMWlt?=
 =?utf-8?B?R09xS3Y0alMrcG9ZT2R0bE5iK2tFL3JDSTZYaWc1bGxpZjlweGk3VGcxQUZa?=
 =?utf-8?B?ZmtIRXk3NlJiZHcyMWFFamFTanRPT2k2WndXRW5oTXhOSGYwUURnWWw3aXl5?=
 =?utf-8?B?RFZaUU5uUGJ5bWw0NjY4ODlZeGpVNC8zZ282MzZrKy9velBLUmtzQVc0bWVj?=
 =?utf-8?B?M25ydW10ZUV0OXptYlFCKzRLKzZkOHZxL3JxSUpkaG1yNVRrSDc4YnRvYjJu?=
 =?utf-8?B?SXhSZWgxTkYvT0t5YmVhUUlCbnlSUW5nTkRPcStMVDRUZnYxN056M1pocXVw?=
 =?utf-8?B?THY5K0x0clI3cWFIZUpjdk9FMzh4YnhFTVhLMm9OWEJ0aTkweCtxWjhYS0hZ?=
 =?utf-8?B?R1VGbU84Rjhvd0pZaHVxMGlhcXN4MnRhWENrb3Q2YkVZVjY0WGxIa2NuMjN4?=
 =?utf-8?B?OVdyazFhOXVQKzBrZjhKbm5YaUxMcjFLSDl2Ulkxd3ZiRlBoS3d6WnBWYUFD?=
 =?utf-8?B?TzZpd0NiU0dBN1BzNUZQRitGU3RMdVdXVm5OMXQzUTFsMFRmdWZHcms0Vk1p?=
 =?utf-8?B?YVRQTjZsMnY2LzhnWUxWSmF3bS9OUXczWkRNL2lCL0xHOWFUUnNjMm5aRWNC?=
 =?utf-8?B?OEhyQ0hKbE5oOVN6T3YvM3FhbFpWMHdSWnI2VlQ3T1VUVE5qTTY3WkdIOXZS?=
 =?utf-8?B?OHNkYWRCN25Kd05ySjdHTGNWKzF5SkFQb3hCaWFzVUhNbVRpd3MwaVE4Vk1n?=
 =?utf-8?B?T1dRRE9PVWlsTjNEZUVIOEdnMW5DcXE2RDRXM2VXaHVXSjBDMmdhNks0Rm1j?=
 =?utf-8?B?MWQrMGMxZW9HdFM3emtiRWVaZmppVEJHbFZJZHF6aHg4N3lwaEJnVVppek9m?=
 =?utf-8?B?dFNlZUg4R1NWd3BXOW5yZXF1SnZqdUxsZWRjMXlBRFA2aGdnZmJMMjZuc2pJ?=
 =?utf-8?B?cVRPUUV5akZ6NVNGS09kWlJSdU5Rb0x6VmxZdzNwWVBlWFhtTFY3UHcwU015?=
 =?utf-8?B?OUJVTVVDZGFaK1VPZHpBb3BlWExDbldGdWQ4WFNYb2RMM21Cc3krYVVtenhP?=
 =?utf-8?B?WmJ1YnZZN24rSUh6dTRQNlg4RzN0U1Y3K1ZMczdaTjVCSWZMNHE0d2k1NUJ5?=
 =?utf-8?B?UERuK3l1TGNtajIxSVprUElaZ05iM0lleDhaSHF1a0RXUnk0V1g1Zy9CTTNq?=
 =?utf-8?B?WWZFR2IveksyVEtoRXRxNGQ3ZUJvN3BOai81cDVTWFVKU0xXRGw3a0FOMEJG?=
 =?utf-8?B?ekI4cUtqcnF5ZENKQUVLS05xcnc4QkxndlhhK2NETnhqY05UajYzR3AyeTNv?=
 =?utf-8?B?eS8ycFJid1lIaEVxTW0vdFRGSjc0QlY3c0FMcjIrNmYrNVI3RTRMQ2xqVDlT?=
 =?utf-8?B?VkdPNE9tUndmb2ZQTlpHek8rME4rUmhaSTFkZlFkRVRmLzYzTEdkRVl0UDhk?=
 =?utf-8?B?ZE1uVTdUdzBWYkYrQ0drQ1dMYkxQTDNtTTNmOHI0KzlqeHhOK0ppdEYybG1M?=
 =?utf-8?B?K2g1TVVNZ2E2MlhMenBacGQrcWtobG9uNXExY2kySFBIVmFPa241LzdqZUt5?=
 =?utf-8?B?VTFuWXdXbEhlelA3b29YYnprVDAyYndnTUpqMlpBQTRMZFROYlNBb1BWdFBw?=
 =?utf-8?Q?wRieHddNSK7GXxzSsNPcAk4bz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd10cd96-c303-4821-e5ce-08dba545408d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:28:25.8850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MO/v2gjEfLTCYKRWRTYa/1MzeZCWxsl/OyWVpxtgaIP2/uPDWtM/zOkV5W/aDcV328Y0SVFzdgEc0W/wf5uKmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7885

On 25.08.2023 10:18, Michal Orzel wrote:
> Hi Stefano,
> 
> On 25/08/2023 00:24, Stefano Stabellini wrote:
>>
>>
>> Hi Luca,
>>
>> We are looking into adding ECLAIR support for xen-analysis so that we
>> can use the SAF-n-safe tags also with ECLAIR.
>>
>> One question that came up is about multi-line statements. For instance,
>> in a case like the following:
>>
>> diff --git a/xen/common/inflate.c b/xen/common/inflate.c
>> index 8fa4b96d12..8bdc9208da 100644
>> --- a/xen/common/inflate.c
>> +++ b/xen/common/inflate.c
>> @@ -1201,6 +1201,7 @@ static int __init gunzip(void)
>>      magic[1] = NEXTBYTE();
>>      method   = NEXTBYTE();
>>
>> +    /* SAF-1-safe */
>>      if (magic[0] != 037 ||
>>          ((magic[1] != 0213) && (magic[1] != 0236))) {
>>          error("bad gzip magic numbers");
>>
>>
>> Would SAF-1-safe cover both 037, and also 0213 and 0213?
>> Or would it cover only 037?
>>
>> We haven't use SAFE-n-safe extensively through the codebase yet but
>> my understanding is that SAFE-n-safe would cover the entire statement of
>> the following line, even if it is multi-line. Is that also your
>> understanding? Does it work like that with cppcheck?
> Looking at the docs and the actual script, only the single line below SAF comment is excluded.
> So in your case you would require:
> 
> /* SAF-1-safe */
> if (magic[0] != 037 ||
>     /* SAF-1-safe */
>     ((magic[1] != 0213) && (magic[1] != 0236))) {
>     error("bad gzip magic numbers");

Or (perhaps more neatly):

    /* SAF-1-safe */
    if (magic[0] != 037 || (magic[1] != 0213 && magic[1] != 0236)) {
        error("bad gzip magic numbers");

Jan

