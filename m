Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4C94E7511
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 15:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294799.501435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkxr-0005PD-IE; Fri, 25 Mar 2022 14:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294799.501435; Fri, 25 Mar 2022 14:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkxr-0005NO-F3; Fri, 25 Mar 2022 14:30:55 +0000
Received: by outflank-mailman (input) for mailman id 294799;
 Fri, 25 Mar 2022 14:30:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nXkxq-0005NG-MC
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 14:30:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d00ec0a-ac48-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 15:30:53 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-4N7K-f0fPc-g6E4tGMo83Q-1; Fri, 25 Mar 2022 15:30:49 +0100
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by VE1PR04MB6654.eurprd04.prod.outlook.com (2603:10a6:803:129::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 25 Mar
 2022 14:30:47 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::5413:50c3:f5e8:d90f]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::5413:50c3:f5e8:d90f%9]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 14:30:47 +0000
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
X-Inumbo-ID: 2d00ec0a-ac48-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648218653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RcMAAhdZCotWsPuQHx6W3jbutQvXH9hJ2Q2bCP+o778=;
	b=MyAR4OK/Iukg+DMk6x9pBX0b4TgD9xHql+A/NAmNc8GDt7qvyNYddFYfglyDEyD/+wUY2n
	WKseB8AlNuUNkw0eWXXGjRAXRK1kEqZXfMAUwchO0ED7eLTXCV/u9Br3Geojxia72j7fXb
	H84QRMWdTW4s6USFA0+PY3g9WGxSdjY=
X-MC-Unique: 4N7K-f0fPc-g6E4tGMo83Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUJfI7EFRaDu33eAiv9awdvOYkeVGERjSw8xM8evP2aqovr0y3IB430BT6z0B8kT+gw0p/0zaYsdMiem7Mj/fLM/LzR/J+oZeO8KTwiXLiHTcHGq+4U4RJ35qdqCTAg9Lv0tBSuup0LOhZ5hxP3mUhwhVIelYDPEhsWCsa0d5gwtbShmx/V1Md6jucmuAT1qghaI2OgPQ52L7arUeRZNGv4jDNFmTUILfYn8g89pLDma78605ABOhrbZ0acKG2CUT4RmLSrIbLngPIgJkLdfBJga0ibdeqWaHrD6jPlCIOoFeMIGLh4/amk3sFFmJRn0WLF1eg5OgzN4iycwinVwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcMAAhdZCotWsPuQHx6W3jbutQvXH9hJ2Q2bCP+o778=;
 b=PaYziWJ1unFeJD8VU+QCO6tFRVl2dlpSes5rIqp/HLfpglys4icNJEeOJ/SPmhK1Tv5q/gHKJ8F7AdFEXf4zpDG6zC5UdhmypYhX2Gqc8HaaUwSX1V/OiUN6uCXU5FaLtuVTPQQrkjLtuqjDQySk9KNNwuB2WqreM80H6afe/mA65auaws9rrW/5RU67UBqU7yCq1rmY3tbN5fu7QpMBZTVLsme3tMf7SeT+9EB4wyhMbkvte5isI9KptAsJyn2x8IHXU+cZoUNY1vBlw/ky1/IuEK0qk4QeY5i52O1wvjGpS9npPGutX5bQ/4ZrRpgJrOA7eGH0E/zg6iHZr0xUtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af599193-441d-b02f-c747-328576ab50f9@suse.com>
Date: Fri, 25 Mar 2022 15:30:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <Michal.Orzel@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com>
 <d797474e-97c0-7545-c68f-1378a3b2fbd9@suse.com>
 <E6DE6BBA-EBA6-4279-A79D-22942D6F5840@arm.com>
 <d9378506-1686-169a-0eb0-0076910e98bb@suse.com>
 <052D20CA-ED64-452C-86A6-0B33343A7AC6@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <052D20CA-ED64-452C-86A6-0B33343A7AC6@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0026.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::31) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a8cfc87-6f27-48ba-1527-08da0e6c0d82
X-MS-TrafficTypeDiagnostic: VE1PR04MB6654:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB66546E73433D9090E1D4E3C0B31A9@VE1PR04MB6654.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vjc8SwkV/haz+5LJMT7F3YuGMY62D0M0O21JTsmCowphpgDp0q2h6MMhcBJ2jRu8gOk1j7b1DmN2uCZ8fWI/vzErv0vzZOURMQ9xTS6fRiHKjK9/o5RZEeHhSQpYEqTYrhbhdHlnHP5s9Q4e14p058cwxzY23nTV2ybpR11arzUkhuaHp0cEF3t1GiY7NhvsdsxtFOcI+haq7cg6U2gf0aB57rt6KMwOFLXkoV6pBfe/FrsxI50ClUt4bc44TCqdW39sfXwlzW0m3N/E0igu9WRn57Tib1ob/jZj29ZYkkVZ4ANNs1CbD+EKreY5J0PiuDz5aMVqFPIQEAMxxmxsxJk+3VzWgDIuUf64mx5t4yM+l0BucREa7Ec3N/b0/bv0cQLuZgyC1v1mCzllMCVNEfTyqZWB567GwMnA6Qf8RAqK0trxGxsn1KLasMAPY2mdDePLml6tz5T3RpjjdqVoijB3YteOokBzLhP7+U74XafrRCQfoYY1Ah1y3U8PKWiuR9LW3rYuxmL+jrl0jshW+ccUu2eHQ4HXxNaRk8JoQiHvTmEv+ynN4UIupfhcV9637vhFu8FdimosYc0yIzOnrSneOZM7WL/klNWP3aFeiUoWqohMFlm35zvKb91AlpUURPQHqh/qEy0f0wcoTe4vzOqL9iSaEJI/NlOMCad/1/7gpkYyI7p5cdoRbDDHP63H8RmLA/N8kE8K9zxs9C9F99iw5yy+qx6Yjz7H4YQHVoQsR5nd3JLlkiU1wRtD8663
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(31696002)(508600001)(6506007)(6512007)(26005)(53546011)(186003)(2616005)(83380400001)(6486002)(36756003)(6916009)(31686004)(8936002)(66946007)(2906002)(86362001)(66556008)(38100700002)(66476007)(4326008)(8676002)(5660300002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGpUNGhsT0pnRmlycW5xeTg1QWdUZVpKYmV0WVI5TWFHU2J5TWZGZHFjZ014?=
 =?utf-8?B?eHZmUmdjekh6cmZQOWdkVXJ4VWJJWUZodlRpbldqR2kxd1hlbnpkSlFBZlRX?=
 =?utf-8?B?azA0elhDWUxZUElVbnloVkkyYW4rQURuZVZHTkRSZ1dFWThTZWNhWUcrQmRk?=
 =?utf-8?B?RFREU1I4WklRWjdQSkJuWHN2d3dJUThoYmtnVTMzTVNXTURaaHFKOXFrakhm?=
 =?utf-8?B?cGZkSkxIdmNNclRkWGc0TUFLaUk5MXA5b2srVS9UWDd5bjU2QW9VSEpaU0RN?=
 =?utf-8?B?YjI3S0hPL1V6ekMzcUdabXhYcDdnU2ZqdFlZbU5KcVNINm5vYVJjaWg0RE9D?=
 =?utf-8?B?R3FyaU1XQ1IyR2p2Rm5XWlhESVFoUS9hU21NQjlqdFFwV003eURYUjRKRzMz?=
 =?utf-8?B?SnpiMzhlY2JuL0lnZmNXSnMwaWVIWkt0bXdyRjMxVUtJczR1b3BUalIzeDg4?=
 =?utf-8?B?S1JmSEdLWGtkaDlxU2RyWTVUcmEwMXd5RFhmMHpaK1dnQU9MNHdvQ0hHdFBW?=
 =?utf-8?B?NTJZdjM3ZUxmYVBIZzZVeTFKQ3AxNEFERTNNdkpLTGdGTHFEdU15d2UrZUZZ?=
 =?utf-8?B?Z3NRMzNwYks2K3IrcWx2a3lkRlVSa3RUVi9GT3hjYjRlSmVndFJSUVlsTkFp?=
 =?utf-8?B?cDlleGptZzg2NkZnOXJWUUJEOC9pelVkNXR1aWVLY2JJQ0IxNUFZMFVEQlIv?=
 =?utf-8?B?WXhrQkJrSHU2Zm9KdW95NWR3K1ZsMmtNVmJvdHRrRXZSNU4xUjgvTnFzQU9P?=
 =?utf-8?B?ZC91c0FaUTVlM1pMaWZENndlZlJQdlhlR1l1aXlyQ1JQVUlaeFdPbUp3ajU1?=
 =?utf-8?B?SzA1c0VTMVBadVhiR1diVzF5d3BHeXNyZDAzc1NRL3NHdUZvZXIySzJJdmdT?=
 =?utf-8?B?dVFJQVAxTGhFU3NYd3FMdzBHSmhlcDhKS2FFTStoRDFQZ2N4SjJBekhneDN5?=
 =?utf-8?B?Z1M0U2xuYk5PNGFRR0cxd3cxRlUzdDJEMkFvdTBiQ3VqWGx6ZkxQRGZ4L044?=
 =?utf-8?B?cFZHMEFlZU44OXNwZi9CM09JL2VGOWt5RFdtZGwyRDNiamhoSHJBZENYWk5x?=
 =?utf-8?B?a1Ezakk4NjVicElBT2plZ00rM3Bxak1nYkpxUFlBS3JNL3VLZnprYmk4Z0xo?=
 =?utf-8?B?ckpBL1pzNXZXa3kvKzNGQTU3ZGttSE9QaUZHV0U5enpkM1c5ZkhheEk4dnBK?=
 =?utf-8?B?VWlIWisxajJLMHRWUzM1OE5CM283L25lQkl0U0MyWkd6QlNwTXlLdFpaMmd1?=
 =?utf-8?B?eTZRbjVnQ2tzblE2SjZGb043bHJ2OU9iOVltVzYwVFRMZ2puNGZCUlJVR2pX?=
 =?utf-8?B?QThtRjVPOWlXMnFidkFydEJrNGFmYS83WklERkNyK080a0NiUTBBUjVJUXhs?=
 =?utf-8?B?RGpBejc0MERwRTZZVkdSYXdac0pka1huWVVzTURVYmFzMkVRVisrRjZ4bEE2?=
 =?utf-8?B?R1QvaFZBWERNTHhpeERvU0kySXlZNXpDdEUxanNqS0hlSjcxLzBCSExOSytv?=
 =?utf-8?B?Z0RSbFhUZmJzdVBOWjF6VU1rcWlRU2VRNVJ6UENrdFkrK0ROSDNiYkZkTDcr?=
 =?utf-8?B?Z1o3MXExTXhwckZjMlNJQm02Y0txOTZQZE1wRVpRbUEwVWthalJZeXhEbWFy?=
 =?utf-8?B?UnFPR3ZheVkyWjBlSEtLc3BnelNuellnaVpSMUxuVTZtQjFmNTRQenVibkZM?=
 =?utf-8?B?bnBqbFRyUmVBV1ozV1RxUDlOd3pJTHd4cUdrSmR2alNQbnlpVjN4SmdEdDNr?=
 =?utf-8?B?dVRJVEUvTmIzZDk1RDdzNGVYaFJZSnEwQkdRRFhUcnhpV2k1TlMxaExZd1dC?=
 =?utf-8?B?SlNIM3hpTnd6eGNCS3RCSndZb3JVOER6SjdvaWgwNjh3eklNbE1wbzFETWZJ?=
 =?utf-8?B?Z2VXRWJyQW5PNE9YUWFWdThBUVZFbW43b3Rldjd1RHRwRUpjUzRGekFBeVZU?=
 =?utf-8?Q?nchBhamCx5Wq9vCgL+HrGx2WhnIB3XQB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8cfc87-6f27-48ba-1527-08da0e6c0d82
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 14:30:47.4263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UJUkV/NTGpIUaIsU9XREzbYO6gTU8EX0mS+v/0ZPfptXzYNEwUU9tqvsIh6Dg/YySjOlFDrJ13Kl/xzOkDZMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6654

On 25.03.2022 15:28, Bertrand Marquis wrote:
>> On 25 Mar 2022, at 15:10, Jan Beulich <jbeulich@suse.com> wrote:
>> On 25.03.2022 13:57, Bertrand Marquis wrote:
>>>> On 25 Mar 2022, at 12:43, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 24.03.2022 12:04, Bertrand Marquis wrote:
>>>>> --- a/xen/include/xen/kconfig.h
>>>>> +++ b/xen/include/xen/kconfig.h
>>>>> @@ -8,6 +8,10 @@
>>>>> * these only work with boolean option.
>>>>> */
>>>>>
>>>>> +/* cppcheck is failing to parse the macro so use a dummy one */
>>>>> +#ifdef CPPCHECK
>>>>> +#define IS_ENABLED(option) option
>>>>> +#else
>>>>> /*
>>>>> * Getting something that works in C and CPP for an arg that may or may
>>>>> * not be defined is tricky.  Here, if we have "#define CONFIG_BOOGER 1"
>>>>> @@ -27,5 +31,6 @@
>>>>> * otherwise.
>>>>> */
>>>>> #define IS_ENABLED(option) config_enabled(option)
>>>>> +#endif
>>>>
>>>> What are the consequences of this workaround on the code actually
>>>> being checked? Does this perhaps lead to certain portions of code
>>>> being skipped while checking?
>>>
>>> Cppcheck is not optimising the code but looking at the syntax so the
>>> consequence here is that cppcheck is checking some code which might
>>> be optimised out by the compiler. This is not optimal but still it should
>>> analyse properly the code.
>>
>> Aren't you saying so merely because all uses of IS_ENABLED() in our
>> sources so far are in if()? It would seem to me that when used in #if
>> (as can be found in Linux, which hence means could be the case in our
>> tree as well sooner or later) sections of code might either be skipped
>> or syntax errors may result. Or wait - IS_ENABLED() does itself kind
>> of rely on the respective CONFIG_* to expand to a numeric value; when
>> expanding to a string, I guess the compiler would also warn about the
>> resulting construct when used in if() (and reject any uses with #if).
> 
> I am not quite sure I am following what you are saying (or asking).

I first tried to clarify what I'm concerned about, but then said that
apparently there is no reason to be concerned. I'm sorry if this didn't
come across quite clear enough. Bottom line - no request for any
change here.

Jan

> I say that most use cases are if (IS_ENABLED(x)) so from the syntax point
> of view it is ok to not do exactly as IS_ENABLED really does. And
> cppcheck is checking the code not the result.
> Now it would be better to do it right but the point of the patch is to enable
> cppcheck not make it perfect on the first shot.
> 
> Cheers
> Bertrand
> 
>>
>> Jan
>>
> 


