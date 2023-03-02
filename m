Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B977F6A7CCF
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 09:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504726.777067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXePe-00016k-Ri; Thu, 02 Mar 2023 08:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504726.777067; Thu, 02 Mar 2023 08:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXePe-00013u-Op; Thu, 02 Mar 2023 08:35:42 +0000
Received: by outflank-mailman (input) for mailman id 504726;
 Thu, 02 Mar 2023 08:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qSkR=62=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pXePc-00013o-S8
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 08:35:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3513af59-b8d5-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 09:35:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7208.eurprd04.prod.outlook.com (2603:10a6:10:1a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Thu, 2 Mar
 2023 08:35:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 08:35:34 +0000
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
X-Inumbo-ID: 3513af59-b8d5-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwiqhTADC363VoLCTj64kcJF6vscLBzBR2htI5Xo9S/heGOZ2xwtpo+vzlNR6nmetrz0CGrkrZhNu6ApfCGTPeMIfiXkqJrciv3xe5phpJ7v3vUs0CGyd+Ce6puSZKmCtJ0FE9MAQq0JgtcFsDGAyrPpsRo1hO4D0dzlFgMu31tsehKuj+dbHg4378jhjhOY++BE4vLgp010vxWy0lKmhiI40UOHZmndDvtovKLosyoKHepGbaCfHyJ8j3Yhv7cXLa5Ll31uFXgIo0xwXTvhhT+G0s0fZlBUme1SHUsTsUKqxEslzx0DKwMN/MptZ5xKqBTTYVnd288G6pK4FDWeaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21IoVljNvPXy39DMbxlaeVo53U5NEfNK6NJbPt7u9ng=;
 b=ULsLDKXIzHC6K2VjqpSDMavP8LTP+EEfxJyHzl2QAkef2KjDY8+Y3CTRLGTuhPmA45R46s3o6eqdYPBjmxH8Sedi5NFelJ3Y/Gskf27TM3Gry6jLWLZbEpzl4NUwv1wfEgADOjPCGAqQnic6xfWe8jpVXjZ5xgxKzCYNXtf9ypSS5Vht1Vic2ZrUt42f8eCUehBvsprp4BrxkD4robTSXl6JZzGz8p4gPO4ZG7MjWs+pvu5WZcLflbdXhFfWTP5kDzPnJKL7gRlCsxjywewElhjggafPvx8XYcbXpwP8Qiy2zd04nAoEEnqjMRpFfJ8UBQjxtfBmB8ypMJZOK1liEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21IoVljNvPXy39DMbxlaeVo53U5NEfNK6NJbPt7u9ng=;
 b=Id7YUWy1Z22Phfnw1p3RCqhLvIOom8NnVUmhsHB1YHNoqgFp6D0sMQ/OmnJjuiYWFtjGBmlp5dNdjsmMkDvsM4AdU/2ALgwvCyr1nJq0qUUzQbSq9RdL560Msw2RSyg7w5Cv2IVpcQMrdAMgkfu38rEIISiVBktIL7sJKHG3s9WT1jk8YeqQvWxGzqSXwhoS2LTvDNFxFboh6H79kqHU98TSPcvrUWQAM9R/mU5ornYrniURqmKh03/rtSzPv4TnvAwpxRHljC60FM32IGTYEiEG0o0hInlCzr+r0uXjnF/UPtia0stXXLT2DV42aCGONDpdLkY1iOAKq6iA3NSupA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa65b90a-5875-9306-692d-d3221afe785a@suse.com>
Date: Thu, 2 Mar 2023 09:35:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: memory access atomicity during HVM insn emulation on x86
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f6c7db-d4a5-46ec-ba40-08db1af9177b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rqYehhTCGML0BWOJZiAIb1S35sX6fvGK3dvLeXOLCzXnm0Tf/ZGQV6EDLXm4eG79UjZGpw5OQGhP+pm6qzyHpBR7ytEujesyQhxLutWXZHInOA8djhirT5uK1ZxySsjlVbbOXtRujKhMjEcurUDVCaGcsDmaAttEpnk6oNChmfzUkfq8RKgmmaAj1dJLEP5LohzEqBghUNlnGS7NmeOqkANIrycctjnm0m7G5M4RNP27hS3HYvyqZE88bsyPXAsMbn11UpqCmSgJ7B5I0QI5IEHk1AokMuy3XTSLex68tLBcpKpxw/D/Nm+fv1KJgd2RXp/FEHNM/VdhbvivjKIx8j0dYFwyvDn8QacAfglM5N+aHpXm15zGnyfiuzzAkKOw8RQAAPauAGA8UlXJUK1+/wl8TVwlQXyqmZYyld6vuP+HXRZ72JD8vliJReZnDqzenlXDjktmXqhRiD7R5+pohl3V0vE0jWRAvue070jGej9cXVwvhEgIQFGllPZwB1+f21qa5Uq0x4sMSBxWWlraS3PR2AaKdF3AiOIwXQcPziNqWGTDHRqAkw2neMm3JH9dggGB8U4LkWE3QPkiLgsenHHt/3FRM1CJdbckZDYw94qZ0y3fo38PnYaLvLNu4UEkJnrloUUCLtOfyq/D77Ki6Z/J/r12SKfNYlxB+AKHRVJ3aCY5T78YVJialtjvmVObuEUzWgnulKl1gDsank/VQZCNEnQOrhpkpBjkiAmHNp4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199018)(31686004)(66899018)(83380400001)(478600001)(54906003)(316002)(8676002)(36756003)(4326008)(38100700002)(6506007)(6916009)(26005)(6512007)(186003)(6486002)(5660300002)(66476007)(31696002)(66946007)(66556008)(2616005)(86362001)(2906002)(8936002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVFLbXAvbnRIUFVoQ0s3ZVhPQkRlWm0yd3hmRnBoRG1YN3c5MEYwUWxyb2lr?=
 =?utf-8?B?VS9kZFRVUGEvRjVWaHlMZGp3aEg5TStWUU9UaXlXRDl2TGNqekwydGZPNmxu?=
 =?utf-8?B?MVI3b01rTTRaLysrQStaZW5CejZNWWJsaTF3cmQvQ2NIZGU2Z0hCRGVEVDVO?=
 =?utf-8?B?eUhzdXRDa1JSVENWL3RXdHphbTd2ZXVWSlFtblkweHpXczhCcEU1ckxzL3Fs?=
 =?utf-8?B?aDNMUDhPZCt5REM2Z1BsZ3ZGZjRXQkdjR0VQNW9GOEhOWXFVVGNRR1AyY0F3?=
 =?utf-8?B?VGZEbWZ5Rlh6U3RMOGxEZ1dqY1NXOSt2cUplWmw0Zm1ZNHlSb0VjYUM4SGow?=
 =?utf-8?B?RUV4OVZLTkN2Y0Njenp0V0I5OUxXQzFJUWk4OEpkZ1J2enU1ak5RYndpWkRt?=
 =?utf-8?B?dU92NURvYmlXSXBlTlRmSldtZVhRdmlUMkxXSW5GZ2xYNjQ1TU5ESHN3R09O?=
 =?utf-8?B?SFVMSnhRZkZ5SXVBM0JIYUp2bG45UnpONnNLbWRvWmRmNi85MG9uWjZVMG41?=
 =?utf-8?B?Skw5Mll5WXpjaUV4RGhTc3VNNUdHRmdSWEV3ZW13N0ZCQlp1Ulg1alNXZWRq?=
 =?utf-8?B?MitWd0o1bHBEeWpobDNGK2xFOW4rT0o5Y3J1SU96RDVDWmtYbVc5UkkwWFpt?=
 =?utf-8?B?eEp3emF4MWNsa0ZwOEZnUWo2Nm1UdngxVnJLZysvWTVaLzJRSjlud1hsRjUy?=
 =?utf-8?B?c2ltT3pkZnFaaTAxOXc2Q3IvaHEvUDJ4S296UWk1b0UxenpMNXVGeFAwMnNP?=
 =?utf-8?B?dDNHOVJKMkFHN2MxMVhiR1NJdEVpZGxPclZZc2M4OWRLOEIzWHhkeVpCelJQ?=
 =?utf-8?B?c2V2NTNTaUs3c2hhU3lZb3RHanJtcTBIVmN0cDhabGNmTHo1WThFT2RyVlUz?=
 =?utf-8?B?NHV6UzlNRzN4cHVBWERRamtsSlFsNXBqTDA4ZlFzOGtwSGFKMnJpeHNkSEts?=
 =?utf-8?B?Y3RNZFN0ak9EeUR3QkVqVS83dUJuSTIrK29HZEs1d0VScU1GYWNHWGRpVW8r?=
 =?utf-8?B?Y3VKUWhOWGdjd003blJINnVxVGNQTHVkRkE2SEk4VjlxMDMyd1k4MmFvYTg1?=
 =?utf-8?B?c3I1aFNjdVpJY2FKQVJ2cnJpLzd1Q1JrRkFMbEVkcTdJT2pReUd5bXZXNGMw?=
 =?utf-8?B?b0RyVzE3d0NvbU4vVzl3bEsweUoxTTMrV3ZRNEF3Y3VIcjh2bGNELzh6QVhE?=
 =?utf-8?B?VUhtZWthZU1hNUk0SXBPeHNQWjFpQjFhOUJnTlBoM25xUmFUSTVnUGpnckVr?=
 =?utf-8?B?dEswRlFvbTJWTUhqY3NyRG5GZmsvUk1tMHRKOHIwRTJ3SzV6djNSUm1EWVVr?=
 =?utf-8?B?UStOMWo2UmRnRCtqS1NjdXp5RXJkaUdYSG5DRjdSdXJNaDhYNTRIc3phNjA2?=
 =?utf-8?B?NlJ5YTF5NDRCYzF5dDRDSnVJWUdIZ2ZvZ3hrcXdEb3ZhblBBNHZ1aCtoTytP?=
 =?utf-8?B?TmZOTXh3WFRjYldCVWZTYlQ2a1pEYVBKMFp3VDlEdzNrSHJKZEpiUXJ5NytR?=
 =?utf-8?B?TFhEMENlUFdJaHFpRThBQnU2TlExbE5kV1Q1dktzSm5xakpWU1lVcGRMMVND?=
 =?utf-8?B?cnRhalpjTEpiejNSdStUOEZTSXI4Nm1BRTI3anFFSVZUVFdlVGwrcXBNSHhx?=
 =?utf-8?B?OFNRUCtXRURoWTVsai9CdzlGS1c5dTBRYi9BRDcyV3FGM2R3R1pWaWZ5SXFO?=
 =?utf-8?B?TkUxT1NxZE94emFnOTRLamxQa2s2VGhvSXI1TlhDYzZ0UjB4VStmZVlxTDNO?=
 =?utf-8?B?QWNoVnA1U2ZuM0Z6eWFkV3RHZ016MjIrZjZjMEhaTGd1YXd5Yld2bjN4bUZy?=
 =?utf-8?B?MW9hLzVhWFBieFBONGI2MXhwdVp6M1ZiVUdhS24yK2VTTjdmdCs5Y1lRSkxG?=
 =?utf-8?B?eDlEUGJVOEJ0M2x3aisvY1Vvd3o0Y3VjNUwybmwySTRoUFBOTVl1ZHJlTVNY?=
 =?utf-8?B?b2gxckV6QjAvd0pndGd1WGxoNFRRa2oyUVNReWxVOGxiaWxDblZhOWVOMklz?=
 =?utf-8?B?c1cwU21xOW1JMEV0VHZCTnBMTnh2OWlnU2wwNmcxMW9OVlZ6NVBuZmR1cEtq?=
 =?utf-8?B?dUM4TFFGUCtSaldjeng5UjRWcXVSSm9DTDh2Wi9DbnY3WnN4ekprNkJrSHRE?=
 =?utf-8?Q?eCoH551NQQMCbYcjMi9L/TwUH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f6c7db-d4a5-46ec-ba40-08db1af9177b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 08:35:34.7470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ema+8A6IrOyIIWIejjOc6szKWsNFDU8vlD2KJSDhRSSYuTAQqmtmRk71UCquziXVOCap3R0kajMWJdiUH4YsVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7208

Hello,

in (I think) Intel SDM version 076 a new guarantee of atomicity of certain
aligned 16-byte accesses appeared. While initially I thought this would be
another special case we need to invent a solution for (it still is, in
certain cases, as per further down), I had to realize that we don't even
guarantee atomicity of smaller accesses, including as simple ones as plain
16-, 32-, or 64-bit moves. All read/write operations are handled by the
very generic __hvm_copy(), which invokes memcpy() / memset(), which in
turn do byte-wise copies unless the compiler decides to inline the
operations (which from all I can tell it won't normally do for the uses in
__hvm_copy()).

The question here is whether to make __hvm_copy() handle the guaranteed-
aligned cases specially, or whether to avoid making use of that function
in those cases (i.e. deal with the cases in linear_{read,write}()). Both
options have their downsides (complicating a core function vs duplicating
a certain amount of code).

As to 16-byte atomic accesses: The SDM doesn't restrict this to WB memory.
As a result, in order to implement this correctly, we cannot just utilize
the rmw() or blk() hooks, as these expect to operate on guest RAM (which
they can map and then access directly). Instead the path invoking the
device model will also need to cope. Yet the ioreq interface is limited
to 64 bits of data at a time (except for the data_is_ptr case, which imo
has to be considered inherently non-atomic). So it looks to me that as a
prereq to fully addressing the issue in the hypervisor we need an
extension to the ioreq interface.

Thoughts anyone?

Thanks, Jan

