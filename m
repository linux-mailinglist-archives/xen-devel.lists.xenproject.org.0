Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDAD5E9A65
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 09:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411422.654344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ociT5-0002h1-3I; Mon, 26 Sep 2022 07:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411422.654344; Mon, 26 Sep 2022 07:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ociT5-0002eC-0Z; Mon, 26 Sep 2022 07:23:55 +0000
Received: by outflank-mailman (input) for mailman id 411422;
 Mon, 26 Sep 2022 07:23:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ociT3-0002e6-5V
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 07:23:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ad93b74-3d6c-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 09:23:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8209.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 07:23:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 07:23:48 +0000
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
X-Inumbo-ID: 2ad93b74-3d6c-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGJWT5U0Donpj9lIieDH8NW8DfKu6JAZbXnP782bTU2YFUrpNy6UDFLUbbPghX/QOmnArhHyiFSW9j6lExss+6K9HaRRIkUdDhIQbfn2kWvUs6Lg59Qm4YRk9FIRj+0uoO9gLrKkt5nTKmws8Sfxwz4DwCzB616uITfsdar9rUdPEMam1J3y7Poz67NE9EWY+QOiIEXscCdCON4BtMczIXtVoX3tZcqsMaCXciOA64uqHvwMtUkyy80vMdr1+xykYqktF7TTtd83p7/YFMi63Ttyk+FPfskqOov/boSkWJvssmZe548hEgaPH8vyWSUKFu0RcqL+KLxWdJ7fJR6O9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mbHJwnSnW+enGqsvXm/WdU8Os6gkhLRXZQyKs93iA8=;
 b=RvnvJTL0I6Hx2xshJupp4dnD1+03z6yHBglITNNqe1HGQMAU+pkLVSSkUs682B4IukDIIzzf8g62DkKIEDq1ab+uumtbHZXZFSoq3Mpigq6PLCl5xN+aQz4uT4B/2kcZtCmRPPMfbYU268AYnsOKhzAA/ZhNFy1CEjSgl0Cn6IbmTj8r6OqtOFC6mj8M8kayabnqXi1QOHJxmZhBH/uWDqCVSCNXI0CwZpSoagaR4hrkMyQr37PMxggXTHv4bYRdd8yGXumyuFDCU2B3rjUvCJdt3ReaHNTlNxl1TGgn2EdbZ4AJ047Fvez4xGYCWeY9pphOYHi58qiUa/JFbSqfig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mbHJwnSnW+enGqsvXm/WdU8Os6gkhLRXZQyKs93iA8=;
 b=gjV9ICk8nvaMzQJX0HQX7i7OuMNg8xsSThgk5omUbmcJ2Q+QEyJItcFNRqrirpRIJWqmkxHNw49etVceV3sS+dYvoU65rt7jQ5rG+hQwzAsihUbBCoSbSl/LlC3sf75U9wgGpF1Ncl4zVuPA15PygL+ySuBQSl0M50oyAXzySPiK6cpseNtGG2VL+iGike8usv8pQ5JSurUw1oZgiQolEBm8ETw43x0N01s+0VALa4GF07QfFSJ42QE8WzpO1ey1fjYOlY1FjS6hbPpC6Slx3vgwR0BLeA/xXlhBNpx5ZG34xvYsFjucK/+672ojTQ8fedHm+4lMNTPzOdJ0TbOUyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c29c23ce-1255-3b40-2353-b243ff04007a@suse.com>
Date: Mon, 26 Sep 2022 09:23:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Design session "grant v3"
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <YyxmQf+q0BqsX8Nb@mail-itl>
 <cb4829d0-ca64-9f41-8a0f-48cf6ce84040@suse.com>
 <767eeb85-40ab-70f6-2d0f-f81af0a65f6e@suse.com>
 <192f76e1-4f5a-34e7-84e7-a78da531607a@suse.com>
 <12ef0abb-2158-faf7-76d7-61e165060d0c@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <12ef0abb-2158-faf7-76d7-61e165060d0c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: ea49b183-9d73-4322-c54e-08da9f900def
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oKMXtAaT4+qOOJgLAfsUU14Nsou43Ht9HrMjLuVMEQ4ZMJi5oeQwAkvA2CZXOUa2C9NBNs/suNYk2qugGvy0Sd0dze2yRxezLAr8bo9Ev8rT7cLKgu8Z6sxRZX4ZKyBhdFILleeb/iDuYfZJ8YqhWHtuMJr0b6rT6djno9mf3DkQHfMqhhnIlXNQV137ug/oxSnPs1oeNtu/yN8IRlZcABwnTh7aZ6e6Uf3iBcNwehZiTKKu6f9lzk/+Av1b6JNmlupOFobrS21SzAegS+thJiecc9vbRpHliV73WHKFbS+iFHFnkC25RoO815+F0KPECPTzkg+zB5CbS/6s8RLbs6wXYaRNyDRVoZ8ym/29KzNT5H2fp+9mtvZPbi4Me3JuMuQlZY8vzBWrS6+Vh8J8vHyKzHPPkioxkZxxoNo1XJhvDNHRWVxKVjrQMtAVnZpSxukf87NPJV2svTPmdWqTt4fFxAlW12+BDGqkcA3Ljzqg0cBzoS8LNzHIs6tUafqPRgKnPtojNXXblnfHWjxQs4x/rMaOqBdw9IzR/i9eGbYXBaU+RE6NN49xPE5dKsnLSaCb4NyCNHiGQye9CDv5T6PRG7uLHKR0HcZA5lQTUiOhwbx0uU3Fl1uT8xsv3RSjvjW3aPaL2oepSDo9C40AUvNQzYK5uwuPEl5RXcT04BMHlXNq/GJcJkrG8arh9CYI6IJx/j2QqOqGgLRL5U3W5xm24hPn5/w0HkQQiiL4nfz5b/ngznPF0Mn2Ru1r1WMZ36re/2KoXcRASN7vqD/OueNumdyyPCHSjQ9B4rpcGoc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199015)(6666004)(41300700001)(53546011)(6506007)(8936002)(6862004)(26005)(6512007)(5660300002)(83380400001)(36756003)(66574015)(38100700002)(2906002)(186003)(2616005)(478600001)(6636002)(54906003)(37006003)(31686004)(66899012)(316002)(86362001)(6486002)(8676002)(31696002)(4326008)(66556008)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXdUOEVkVU93Y3pTdjJ6ekt4cm92c3hYbmlIMklzWWRtOFJ4Um9rZ2EzOFYz?=
 =?utf-8?B?YVZwMmxSTndJZnRBY0hEWnZtVElCNkxQT25LUlJOTTB1d0pXbmJYcGNScGxE?=
 =?utf-8?B?dkhpSmlKRmloaVptdjdyZm1HaWZGN3QwbkhueXU2MEVCSk82ajk2a0wxbjJX?=
 =?utf-8?B?NS9mTHRVSDU2YVd2MUtBSnFTSkp5TTAyT0NING1VUUpyTHc0Z3BSOVR2aDhT?=
 =?utf-8?B?OFBOaEtnWGRHQ1VqVUYzTkEvcGJyOE5xbC9qMHV3bWlWODhGQStDUjJoYkk0?=
 =?utf-8?B?NFNQWmZqMUJxRGlQelNxOC9qZnowSlVCWDAvMGNNWkdJUkJGWW4rZVZYejdJ?=
 =?utf-8?B?Q1hSb0NSUDdTVmIralZibWd6aHlHUngyaEIzTXo0dFJJVnhFTXF5UWxJV0FO?=
 =?utf-8?B?NXlqN2lxb0tyakE3UVZtK1plL2FyS2l4cHVCT1A5Q3IrQnBDck5TdDlSenUy?=
 =?utf-8?B?b0p0Wnc5YmFQcWVpQUlvdFpWOExkSVRId2ppTjl5QnBUWS9vN0xyU2QvL2Ez?=
 =?utf-8?B?ZlFOVHRyNGx5QitkbkFHUDZjNnZkRGl6OS9ZQzFORHd6Z0U5ZjFHRXY3dlhy?=
 =?utf-8?B?eTNKKzBwK0VKV09iNitpR2JUWEVBMk1LcWprMFJqby9LR3VqZGZieFZSbnU0?=
 =?utf-8?B?Q0tuS2tOSjhzSmtYMnpZY1BZbmFocFpOOThNMUVsbG90UmRJLzlrYU4rdm1Z?=
 =?utf-8?B?c2M0cm8xNHVDKy9zWTZPWGpBKzFhWlk0OHBqMnJEMGJtaGpuenVDSFplMm15?=
 =?utf-8?B?WlluQjE1dmM4enBRUTJzWXhnZUFoL1RvWDBIekh3RW1TOElLMkRKbUQrNTJv?=
 =?utf-8?B?aitJK2NxbDRsTWcwcFR1bTdvTys4S0NJS0wxS0RLTUFvck82dU1lRXNvWTJr?=
 =?utf-8?B?SnVoT3NrQlNDSklsMlQxaDd2Qm1XOG42dkpSZG1qY3JVUHF2WEg3SG42WkhZ?=
 =?utf-8?B?UmdIWm5qMEZBeFFKVHJ2M051eGpYMFpTazJjYzI2clI2eEsrQ1p2SXdlRkxY?=
 =?utf-8?B?TjIyOXQvY2duaTMxQXgwVGhyaGdEbktacTdrdzl5S2cvcldBRk1mN0wzbDc4?=
 =?utf-8?B?WTVBN1VpMyt5U2UzVnROblpNK3h1M1NVNDUxZjBDcGRFRmtzdHhraU9oOW8w?=
 =?utf-8?B?cUtkQ1VBMENzZnRsSW9rQ09IMmw2cUw4dXd5UWc1V3ZnWHlsWGEvM2ppb1g4?=
 =?utf-8?B?K2hXUnJnTmNQWm0wcDdWMWpHTnhSWE10aDhiSGNqS2w1a0JLV29VUGNGcks0?=
 =?utf-8?B?VVJ3Vjk5NGJzL3NiSkU1WUd4NS9IcURKS3psRnlwRi9jbGZiUjhibFdEUG5I?=
 =?utf-8?B?bFIzUHplVWltNUZCWUxmUE05Zlk3VWhZSDA3QUZRWnhtTGFPRC9GakZHYmRM?=
 =?utf-8?B?QkowWk1OdWlPUHRUbHZGdVJZc1MyUGRHeWc2T3VyZ3VtYjFjalFvU2xFNWZQ?=
 =?utf-8?B?bGEvT3FUclBFLzBndnBYZVEzNnhEUWE1eEdIdi8zb2EvaEYwMk1mdjRZRWNa?=
 =?utf-8?B?SnRPVnMzQ3JjT3k4R1dOeGRSbUIwYW9FbE5PTlFhZU5nVmkxVkZieEtXSG01?=
 =?utf-8?B?TGxGTzFOeWpScVgySGhPOFk5emI3Q3VkRDF1dW5BWlJvR2wwZFNuaGFheFhP?=
 =?utf-8?B?QlQ1RTVXZytLWWNNelQvSWdtY2NtMnJtUFlOR1owSmRtV2tFOFRmdzZGaTJ1?=
 =?utf-8?B?b1BKOVQ4M1JjR3c1aWdidDNKVHFBaGZic2k4MzU4ZUpJa0c3UmI4WGpKZk45?=
 =?utf-8?B?KzBHUlVJa0RzdU1PUjVldmZNbFkzY1B6Mnh2aUU4SVFNem5rZkZaWS9ZQ2pj?=
 =?utf-8?B?SVpnYklTNkdVTnRDbCtpTHVBK1NTTzF2QWFEUmtKSTF3SGtTRERTeGNvOTVa?=
 =?utf-8?B?UWRmcjdmeHlkNE1GVi96YUlwUC9XSytxcGc3ZU9IVzZHSnJXc0tlVE9DcHN2?=
 =?utf-8?B?Mm9VM1pCV2poVkk5d01JVU1KMDk5N2RjemE0UkM2VXlHdjVBT3l1YkVLamNH?=
 =?utf-8?B?Q3VGZXMzTDFqaEdUcXJibThHZDhVN0FZTUJpTERRaFVSeDR5WlRvTStQU1lO?=
 =?utf-8?B?OFdTMXZFbitldzRkNXYydnB3U2R6aytsME5DWUtJMVV4Sm9zY2R6VFJTaXNX?=
 =?utf-8?Q?2qvcCb0HW8SoGJxrA9i/0mWLS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea49b183-9d73-4322-c54e-08da9f900def
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 07:23:48.5520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NAqJzn/GGimuLqj2RyUsquhmE7K/BppgpyM1Qb5BEwjWFKQewcYPc6EZIpU/BtrytAmMCF3sVDNmzyxoF1oEgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8209

On 26.09.2022 09:04, Juergen Gross wrote:
> On 26.09.22 08:57, Jan Beulich wrote:
>> On 23.09.2022 11:31, Juergen Gross wrote:
>>> On 22.09.22 20:43, Jan Beulich wrote:
>>>> On 22.09.2022 15:42, Marek Marczykowski-Górecki wrote:
>>>>> Yann:   can backend refuse revoking?
>>>>> Jürgen: it shouldn't be this way, but revoke could be controlled by feature flag; revoke could pass scratch page per revoke call (more flexible control)
>>>>
>>>> A single scratch page comes with the risk of data corruption, as all
>>>> I/O would be directed there. A sink page (for memory writes) would
>>>> likely be okay, but device writes (memory reads) can't be done from
>>>> a surrogate page.
>>>
>>> I don't see that problem.
>>>
>>> In case the grant is revoked due to a malicious/buggy backend, you can't
>>> trust the I/O data anyway.
>>
>> I agree for the malicious case, but I'm less certain when is come to
>> buggy backends. Some bugs (like not unmapping a grant) aren't putting
>> the data at risk.
> 
> In case the data page can't be used for anything else, what would be the
> point of revoking the grant? The page would leak in both cases (revoking
> or not).

Sure, but don't you agree it would be better for the guest to have a way
to cleanly shut down in case it notices a misbehaving backend, rather
than having its data corrupted in the process? Of course a guest won't
be able to tell malicious from buggy, but what to do in such a case
ought to be a guest policy, not behavior forced upon it from the outside.
Then again I guess "pass scratch page per revoke call" is meant to cover
that already, i.e. leaving it to the guest how to actually deal with a
failed revoke.

>>>>> Jürgen: we should consider interface to mapping large pages ("map this area as a large page if backend shared it as large page")
>>>>
>>>> s/backend/frontend/ I guess?
>>>
>>> Yes.
>>>
>>> But large pages have another downside: The backend needs to know it is a large
>>> page, otherwise it might get confused. So while this sounds like a nice idea, it
>>> is cumbersome in practice. But maybe someone is coming up with a nice idea how
>>> to solve that.
>>
>> Couldn't that simply be a new GTF_superpage flag, with the size
>> encoded along the lines of AMD IOMMUs encode superpages (setting all
>> but the top-most of the bits not used for the actual frame address)
>> in the address part of the entry?
> 
> Of course that would be possible, but using the feature would be limited
> to backends having been modified to test that new flag. In the end both
> sides would need to negotiate the feature usability.

Isn't it to be expected that this might need negotiating? Strictly speaking
it might not need to be: The backend's map request (for a sufficiently
large number of grants all in one go) could be checked for being all
contiguous in the applicably address spaces. That wouldn't require the
frontend to advertise anything. But an unaware frontend wouldn't be very
likely to produce suitable I/O requests in the first place, I suspect.

Jan

