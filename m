Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3B63477CA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 13:00:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100954.192682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP2Ba-0003vG-I6; Wed, 24 Mar 2021 12:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100954.192682; Wed, 24 Mar 2021 12:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP2Ba-0003uu-Eu; Wed, 24 Mar 2021 12:00:30 +0000
Received: by outflank-mailman (input) for mailman id 100954;
 Wed, 24 Mar 2021 12:00:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1/+=IW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lP2BZ-0003up-8q
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 12:00:29 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a53f500e-b021-499b-8b1c-149e9e2185c8;
 Wed, 24 Mar 2021 12:00:28 +0000 (UTC)
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
X-Inumbo-ID: a53f500e-b021-499b-8b1c-149e9e2185c8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616587228;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=t6wvSlpQsqxftjGsA1WHAsFYEeiVRbmY8ZzMgmoe3+g=;
  b=CEdbrkSYTkNZJtDncXdVDgKaW6t0CJfDG0rqhFKYJOJvDFp5re0/tj3G
   q5XUpNvhqeG4JqaA4h/SVVO8ac6+jrjNoQpV2C5JwGBHLbyP3CIz08Hg0
   8zPiN5N3Yk2bnRdzQ1aKVxgyKkekV1yspmxM5i7oTK00Eh+hMmjNtvvBn
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: n+SrZKed3vXnwNdCl1/9buBcNVaNduqpkKdH6mFEuac9Ux0RIlatG6Pww4Nmn+nBP7Y/0aYqQO
 /lJGG/Dg60MjPj1ybiwx30tuFlQ3jGhP5QcoODPLNlkAAIeevt+nu1zipautI+WnW9t3C6Lobs
 gxZ5q6NBhEqxbzRYfdThBUWWdnF9e4DYbso0n66rdEtPYtrEmg4Mjo0M45PsA7+a+43t3vLgTM
 XivIPa2kWRykq5B7ddD/qhYiHp2r7AJEo4/LFBaXfvlKDSGmB8CLl5r6I8FCz8/y8ijoR8Tow5
 AKY=
X-SBRS: 5.2
X-MesageID: 41446609
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
X-IronPort-AV: E=Sophos;i="5.81,274,1610427600"; 
   d="scan'208";a="41446609"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bp35+Ql5yaigwdEQAjoddiDMe/RBFQo1z77Ix5aCEDHJiORIfS/ryR/2L3hM7Vv17fOvR0GxEcdbS9PQ/CDXYTGHUf4z4daBP0+hMrJZMf1r3ACdDBKN7qNadWt7fHM/2+k/K+4BijnLTo5tfVjNuQpb4WEqhHqpzR/bZaHxymrvGIrHPlGlDvRGqfPb5KUP+H7NVQAP13bDOGeIzTZisrkp3nqYvek/i/YjfgRDs0KKRmdgHvL+Ke0ozqmWns5DfTpbEW3MITXwNEFCcn05zI5fAmJvbE+kLN8Y8p9dSmIEIFHngt9707GD9R6cdQTmmB+uMtB9yxSq5FZuJa+2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpymExJ2J58IxTRvdDuHwd6ww014fUnnbEjpZF0BPH8=;
 b=NoTEI9UQPeY79xnbiwbjLSJjj5BQbP2w+MN/yXHT8K2AtfEWFvU2bjFD6dPWL7HCdsac9mjSHGGvxCFK7qMCHxeInNK0zWK6JOXb6EB9eR93vxlODYUCzud7GZL8UgQ8QZ7k/wr/556xM9Pgaq0rkCSNlh6y5aSsVhAS5vI+h5EtHOmwhMsbG+/5FPZGgBTOTUDM0AnP0psAnlK5u2HsNIljjlL6fse+zf/q0odYYn+PVAN0rcumHnrnOqobsy26tCxdCuQbYr/qKHbKvbgqTacaUTXkJUZkENbufGOx8yhgEpJtKBd6rlBVzwjn3UdgLmOqNpJ86uwzyNN4PzCsqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpymExJ2J58IxTRvdDuHwd6ww014fUnnbEjpZF0BPH8=;
 b=t9jdrP7pIixBx3gm+yCwujzbNTpHcKYKCuWxQqWrZ7SGr3QA0pWddVwVVVAayVBlbp+vku99B/JvPy2XD+ppMVg34wF7ZhQ5xfGmcq4neVFQtG8+X3af1cEMaVqEbuPtKSejA+WG0gYdJ8R92Tih4YtNKjokXNKgFR5cTS1sgqc=
Subject: Re: [ANNOUNCE] Xen 4.15 - release status, branching tomorrow
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Ian Jackson
	<iwj@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, <community.manager@xenproject.org>,
	Committers <committers@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?=
	<frederic.pierret@qubes-os.org>
References: <24666.1682.595069.435575@mariner.uk.xensource.com>
 <0bfab829-3841-b2cd-96f9-874340cf75c2@suse.com>
 <24666.7414.232768.961456@mariner.uk.xensource.com>
 <f0c1df6d-2fcc-11b7-1a90-9a0aa2019686@suse.com>
 <24666.8820.146895.73948@mariner.uk.xensource.com>
 <CABfawhnTBmjJbckoCSsDicday_txM98LZLEc3o_rLL-FQ=t+1A@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0e205db4-e3a8-97c3-6952-fd4c500876f3@citrix.com>
Date: Wed, 24 Mar 2021 12:00:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <CABfawhnTBmjJbckoCSsDicday_txM98LZLEc3o_rLL-FQ=t+1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0271.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::6) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b51697c5-4582-4b33-5e38-08d8eebc677f
X-MS-TrafficTypeDiagnostic: BN7PR03MB4388:
X-Microsoft-Antispam-PRVS: <BN7PR03MB438860E13B99120E9357FDDCBA639@BN7PR03MB4388.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cAvdFcBQ6CAnf4SUEjgHnL84zDhem4VWuY/H1BKuPhY8pwRqojvF1dKfYMswtEX8K31zal9B8N8NUBx6i+DHIJRqGI5gytx+9vQsQPkMV4lxn/gQ7FT3W8uK/f9I04sVf3iK4eWi+EIbxY5NBbKs5QTNNfy8gooJ5Di+2HM3hLo5bsOzTMKU+BZea6/lpfDE0+6WJaT5VeuUPe1fb92h0EKhpl9p9NYco/ptdjZ6ynoE/IJuoBjIRY35fBXnpcgLrPWsvCFarUj6X+E0qzv1qQFEKrHOMis6oMnfMEC9a6YxZXb8llK+L4/7M4aqwK4Z2pwuXXzEhqx9h5BZEYm/WEpZgvNCn/lR2vnS4jUnBSzIyhZnL2XmgaQfNIVvW0o4sPyWxb7+oLbuYqDFC0OpBFoYULfzdxtRu/mn/GP+OmjkASuLqTY5srjNefhrst9j0UnmZcVzNsWZI8P2P31vlDIfohv0G25lHGcQJ0BNI3veHCZqwJsTYF35DBYQxytpe+ELxFtoqVjAausDJlUJG8XQKOpk3RGpEbn260amWxKAkEDzYJsuJvsDNu4fXOTxzWbovabQFWFvq1rTAP4L2R4PUlSpVlvf0FFI2Ohd1dCsHoBd9tUZq/qHT95DKJqr0Odaas6peZ+LPMk9NDCbG6ith1jLDWGFnWShzwaFuO4zziFxJtOT0qbe8lBe+wN7ts7lzqZqYwN1cq/2bCX4wg6bbwYfupy8frNWMO50KMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(86362001)(66556008)(66476007)(31686004)(66946007)(2616005)(36756003)(956004)(4744005)(8936002)(8676002)(38100700001)(5660300002)(31696002)(53546011)(6486002)(478600001)(2906002)(16526019)(316002)(4326008)(110136005)(54906003)(6666004)(16576012)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YXV5clhBdjhvQ0toc3ZvVTUyZmluUXR1RmJtZG56Z1dSYVAzZ2E0L3BQVHBQ?=
 =?utf-8?B?SXFGVFRMeStZU2NMSVF3TGFlN2pYOVFaMGJaT1lOeDJHbmdJTlVMRzFIbTNM?=
 =?utf-8?B?M1FnWm1MQUd2WTlpTnZtRmFEenpnRzlFUHZqTm1RL0h5ZHgxSVdGTHd3MUI0?=
 =?utf-8?B?alBIaytxYW0rY1cxUFFvNkZ6c09UcjlUd3h2dE4yY2d4QmpxQktaMzc0MllX?=
 =?utf-8?B?SWlnRmFDTVJId2ZSRGtMV0hjTWo4cXJjYVlMNW1tTEV3VEg5cnJBbytyelNP?=
 =?utf-8?B?dWVVSFNKa3RReFpZeE1xdk1lTkV3ZC9ScDBWYllSSlkwdVlCcWtxS0lKNHE3?=
 =?utf-8?B?UzRRT094NmVHYUNWT29BSHlEV1ptNi9kOUFyMjREOEthY0loYWtIejNFWmhB?=
 =?utf-8?B?SDJIOGNtODhxUHd3di9Vd08ycCtwWVJpcTJTTWtzdnRwUGl4VDBmV3NENzFh?=
 =?utf-8?B?a3lmQzlId0xUZzMwMnNLTVZTL2U1UU82bm9XQTNlVjRqUTIyWGxDcGFadWl4?=
 =?utf-8?B?cEUyOHJxZEJPNXA5ZFVENFd2ZzVpUGsvSnZsd3dISVYxM0wvbkxiM0NNeDFS?=
 =?utf-8?B?UDhkMlZ1OU43a1VmbkVWeDM0UGJNcGNTSU5lWDhqNnJIQ1JpNDZWTXNGZGZu?=
 =?utf-8?B?K2lLYm50aDZ2ZXJWQWQya3gyS0xEL3dFcFpjOEN2U3NRalF4SG5HeDNGUnpm?=
 =?utf-8?B?ZUQ4UndBQjBXUDZLL2xJNUt1WTdlSGdmcVhTSEhVRHVlYkJQYnE0elFNYTJl?=
 =?utf-8?B?bDlac3hrNEdHVFZTYnU3TmU1UFlVWVJBYnluQmNsbk44b1JFSzRGcDNzWjBp?=
 =?utf-8?B?WEpuOXNFQ2RYUWFYSjhLMWVuMHhwekgwc2JFVStUYWRhdDdycmxnaFRROWxX?=
 =?utf-8?B?MUdWdFc2QWRxMlUydmRabmlIYmZLbHBKTG9VT3lFQmNwV2lueUZZSS8rcGlB?=
 =?utf-8?B?ZHhiS1B0bm9CYklSMXJWWmpoNHhCUUZNWXMrYzAvSW5ZUTlnY0Z5eGxtSGZh?=
 =?utf-8?B?U0FuNVdOdllJdCtyZkZUWVFwVXhsTGVVTjFXV0dhNGZzcFBkNWhGZ1hjWkJC?=
 =?utf-8?B?Mzkyd1o1eVhBVTFHNXU2b3ZycVFQMDF6ZnBkaUZYRFcyN3hZOHJSQ3NMYklq?=
 =?utf-8?B?L2NveUdPYjdHSk44NWlmVVYwRmZYcTg3MVJsbWI4Tmh1ZzF5Q2plRmE5UXNq?=
 =?utf-8?B?a2lMV25RQ1QvNWZhYXF0cmFMRDhReUFnU2FsQjMwL2wyU0xrdjRiRzJxV3RU?=
 =?utf-8?B?RGhFcHlUaXZOSXdEOCtlL0g5aVJsNWZidkx4SFRSekY3NE0vNlg2eE1jWVQy?=
 =?utf-8?B?QjVTQmptSnZGY253bEZhamZobGZtTmFhbllNTXF4QmN5ZERCNUU4SEZtbTZk?=
 =?utf-8?B?eXNpODNOa0Z0bHpYR2xXbEYycFlsMVFveW1VMExpaWdHT01yNUFKeEhhOE1I?=
 =?utf-8?B?OWw3bHU3WUltcXJWSnk4ZnNwYWZ3b21GaGNMR2Vpejk0MVo4eDZReWhYRkpC?=
 =?utf-8?B?RmU0Rjl6QTYraWhQVEROYUkxQzB0OFdvSGd3cnAzQy84bTBKRnVwdWhCSU8z?=
 =?utf-8?B?My9UOTVkUW5nL0dnaFZWdlNGeTZsVXdTZ2h2em0xYmFEVGxkZzNiNitwNVA2?=
 =?utf-8?B?RlViSFBIby8yVW9ma203SEdWNjVUaG1zV1VubVFBM0hZdWdnVmhYTzdVY0lU?=
 =?utf-8?B?ZXZGVTNmbnM3MGJCOFZxSlRxWDc2b0RtYkNLUTFQd2ZjWk8xak9nQkthcGNV?=
 =?utf-8?Q?m50qC3yt8aPABhkTTD/EtLW5KUJ1s6IYzerAhEZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b51697c5-4582-4b33-5e38-08d8eebc677f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 12:00:23.1277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gp71JAQhipi7gdzRvZLfQK++uD+pZpLAseCOaKkzJyLa2X1lOgYE/Hy5Wl1xB8QOuHYApzKo438xusftOUILYLJieHpOxZO7qLMtUmTNGQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4388
X-OriginatorOrg: citrix.com

On 24/03/2021 11:48, Tamas K Lengyel wrote:
>> The revert seems unattractive.  Your suggested command line option
>> sounds like a good workaround to me.  Under the circumstances it seems
>> like it should default to the old behaviour, as I think you are
>> suggesting.
>>
>> So I am be inclined to ask if you, Jan, would prepare a patch
>> implementing such an option.  Anyone else have any opinions ?
> I've replied to Jan's patch as well. IMHO having the option but
> leaving things broken without the option set is a bad user experience
> as we don't have a way to tell the user when the option is needing to
> be set during install. Asking users to see if Xen crashes during boot
> is a bad user experience as part of the setup. There should be an
> automatic fallback to try enabling the legacy option if things don't
> work without it.

I agree.  I will try to make a fix with does the right thing and doesn't
require users to play blind guesswork to get their system booting.

~Andrew

