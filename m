Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5497426AE9
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 14:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204700.359861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYp5W-0007au-2h; Fri, 08 Oct 2021 12:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204700.359861; Fri, 08 Oct 2021 12:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYp5V-0007Y1-UW; Fri, 08 Oct 2021 12:34:57 +0000
Received: by outflank-mailman (input) for mailman id 204700;
 Fri, 08 Oct 2021 12:34:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aYfl=O4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYp5U-0007Xs-2w
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 12:34:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c52b9eb-b1c3-4484-953b-8bf1ea7abecb;
 Fri, 08 Oct 2021 12:34:52 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-xu8jvV-TPeqrdm4yTVSPCw-1; Fri, 08 Oct 2021 14:34:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 12:34:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 12:34:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0030.eurprd08.prod.outlook.com (2603:10a6:20b:c0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 12:34:48 +0000
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
X-Inumbo-ID: 2c52b9eb-b1c3-4484-953b-8bf1ea7abecb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633696491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFn0lOiiW0WLh6vRi6H380V5FrGFAIi+h1wxCPTCcas=;
	b=Cis/ZqtXrVhMbP01EBre8wH0cdTXfKIQ/pOW+eY38PmRlJ3wLmgOWBH31tEIzVoWe67wNk
	CTTLxXX/O+3owyAboMcmyQPXFf1S4/9ETblz78bD6TcUbubSKBtvYq6/NDoog158t2TxEx
	MTYZcFVuuA5tRJhpdXDNHA0OriUXc3M=
X-MC-Unique: xu8jvV-TPeqrdm4yTVSPCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTXuPNoy3ahBt25PNv6fNU90owJp4Bebb81mGGuXzFcJ5kWptgzJr0sigWhy/8l85DRt9i/CZXW/BmzFm6RWn3EjVsAAIYGtji6hAskQS7ALLl2R84VDcM0Q2Fb4EUp3BkkEeLCuYEcVFZZOAzomfyoSiL/zoV8LFJ3OhO+vYQEc2avQaF7hkILSXSU9ahGzUXOIu5f5fOKkNV6e93Z/zEPNFK1s08z0yjrsdIZRWE9ui02DhTmF8dr7/tt+MBpn5Rh6W0tYjEQcOkA69haRMTV2uBXj5p1GnVniD+UZoQryEzMqwu6hQ1f/CEeN7RDuEMtUsaRZZazDIiRJ8XRkfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFn0lOiiW0WLh6vRi6H380V5FrGFAIi+h1wxCPTCcas=;
 b=VKkw/qDmSqmCmv7tiE3xmkQHN4Mm5GzToSNR5cU6M3REBFYNXO85gr9dReWNst/xhMcOrLbf64qual59w6ceH3bUNaDpe34GKvlGRZsFzgDYd9g89aQzmhR7s1XmIIhwB5UeRZsK3f25MUTL2b5wVShRAzxIyf5OnXJCHMeI7I90EwlKdS3PNE/f+8/DKVgmVAddEmKRgyMWovXtjggnLw4vAH33IHiJq1mseiqg+TLXy8kPKCdH7Ax1MxpepJQBGtwwSWQk7mgz8G4xKCxiiNEqo7czXCWvTzGYw4Ct/Gt+0toD63xcsWCV/ANvC1F5jx4u+QFBbRta/0d8J/fUTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86/build: suppress EFI-related tool chain checks upon
 local $(MAKE) recursion
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8457d422-4db9-59b9-d0c9-663430dad955@suse.com>
 <YWAmz5+5cufR1lKi@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32d36905-4e43-440e-765a-6637a9955afb@suse.com>
Date: Fri, 8 Oct 2021 14:34:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWAmz5+5cufR1lKi@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0030.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f52bacb-0219-4b1a-1af6-08d98a58046e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59018AB60328956AF606C224B3B29@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Xs7bP34LzlymhvHseVEs1O3GqBHmDfUwGvR+E4/rSO0ghE3UtQ9ztBdjDM80dtNPFDxgGgGQOnOgB24Ca623va6HVNIuOgc6/kxPIVAwTlj1JSNTrBWk+6BQI5zHZAyEmX4q98H8gSfBvmO1VSoYVj0H5dPoFobHoqi9L0fx4uUmdXhcy9iigc6npJmuC03Rv5huwWulLYdP+saG04QiUFppdOzN+19L/6QZK4UCXy/7ZCxJTJHKFSpRwrvRR49ciTOJhDfwNfLmpuFAU2UeoZR4fEC6+6Qq6gqdb2iC730zPrpaVorqxJyFCODuKpg8v45gFOIfpfHaOfkaHx/slGZiFazUV5v2IeuvpyZEpxTH9iN1XhdWXotdTl4yqkbdBOgjobhkxyAelQlp2wHnCa5dYzsCj08cc6n/12TWisC/fyeZp0QS68ZWGW0dogPDvG6abOaZZOTq2/awXxLlpi+mCzha9GPpjJyCSBBVapZfPsARruMBzFOCr/tZXu/tKdewRFaL7l1yx1Scy75LCQiLAzTmd7l5OPwAPlZBHfgl4o1pcfW/Jjc3m2s8rM6UG1Z1V6h8md/+rQWeTWEqUr90ERuU+DXjRM+QC7yjKiIlSwhrDvCxtKbJh/ruRbOz0V9L8IKa/uDZd9hYp8qI+XgpggpSsiFN2CIGb3CrG9W+y1AR1riF6gH8K7OzADvQrRlUaMUJ2cRwF/QXlHD80SeveTcfxcBMUcDSiXENAYOcXo2Zaa0ma38oBkBEmcX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(31686004)(31696002)(38100700002)(36756003)(8936002)(53546011)(5660300002)(956004)(8676002)(186003)(26005)(66476007)(2616005)(2906002)(54906003)(316002)(16576012)(6486002)(508600001)(66556008)(6916009)(4326008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDRvM1kxNEtobmpwL0dYci9QTWhEWFNwdmZQSVVGS3grUkloUm5ObW9mR3Jq?=
 =?utf-8?B?dDZwZUtHL2kwNVFsTXZBVFhjdi9scE51c0pQbjM5MUU0VHcxc0g4YkIreEFR?=
 =?utf-8?B?UDRpVHp5MmM2M0l5aXV5V1VLcGlCL0FJTitEY2VRbWNISmIzbHZmYWpiV1RE?=
 =?utf-8?B?dG5sZkVkY3IrTGFpUEg5elltNGV5Z1VrdmhXOHFwZS9MWE1NYUU5U1hEcHNm?=
 =?utf-8?B?U1lEMVpMTDB1OEpBdVJySnc5SFcwcHV2YThhdEdMckx5NEZFbk8yU3ZJZEt1?=
 =?utf-8?B?YkxvVGhidC9YbHd2aWdXQzNQQWhEMzNzakV4MTRiSk1aQ1NzUDdTQm5sbGI3?=
 =?utf-8?B?dnp0UjRzUXZEVWJjaVRNN0FqOWpGQ3F3VkNpdzk0aEorMW5OYzArbEZzL0FK?=
 =?utf-8?B?Qk5KTVRVMXZEZUZEZENlOHgxU1VJKzZVTCtvZzVaVnhzQzNxL080dExDZVBo?=
 =?utf-8?B?aDd4SmFZTG1YL2trL1kzWm13bWYrcmhJM2c1eFA2T2NwTlJ0WFJhcjZFZEhw?=
 =?utf-8?B?bElWNTQvT3F4RE40aWJUb1h5N2YwS0hEYVJFZjNEMVRsKzE0cHo4V3Q4OW1C?=
 =?utf-8?B?L2Zickc4TzNMcHF5NlZVeFE3U01YZmdBYWM0ZE5LZ0ZXamtTUDY1emJkQ0Ns?=
 =?utf-8?B?aytSZ3pucW4vQko3NTljSHFFRC9YTXp2Q09BSmtUVGtSandQZjhyWGpZa2Ry?=
 =?utf-8?B?ZWJMOHkvU3NPRDZoUzYvUERERFJhZ0xTeXQzdWlIZ3lMc1NuQmltdzNmTW5P?=
 =?utf-8?B?bWRrd013aTRnaEhqQkV3dWZXSUpGSmR5NUhPcDR3VmRmT2cvaDQzSnB1eDd3?=
 =?utf-8?B?aXpER1NaemZVNDNMWFZlVSt2TFc0dSsycXhvWTV6czFiL1VKcUh0ZnFyeTJi?=
 =?utf-8?B?Qkp5Yml0MWdFQS96U2Q5YkVGbGVpeUcvb1BXblhPMThEa0J0WE5kQUx3N3Ja?=
 =?utf-8?B?bkpWRzV6NWl2UkxtcFpQTmZjNUNoTUh5RFdMajFWSEdMUjNOa1pDTFo0cGhN?=
 =?utf-8?B?V0pXYXFBdytPYy9HdzBtZXhlUUhlMDBYS0wzaHlGWDdjazBscFRxVWZaS3kz?=
 =?utf-8?B?OU82d1dyWTB2SmZpZlYwdHBHQm5CRGlRYkdkN0xEeWdDK1E2R1puSGVKajJY?=
 =?utf-8?B?ajdYa3lUdGZHeU5WTkM5Y2pCaDBWQWZsOXZBdVJlclhKbkg0d09ROERTNHo2?=
 =?utf-8?B?QVd1MnNSWWNKNGV0K095OHhsL0lmL0xyN01wdTRpVkkzTVdRNlF0QkpSbC9B?=
 =?utf-8?B?eUczOTAyWnFEaFh3T2FRdWpkV3JndEt3VnZaYWh6Mm84Q0JCU1BFWFFWU2F0?=
 =?utf-8?B?Y0VkVEdQbGw0Nm9ZbDVPditGMkhaekNhcXVERCtJZ09mOHdxaEl5NzFwV2Q5?=
 =?utf-8?B?aDQvWGRiZm1NMURmZlFlbENwZ0dFdGJiek9rd2dselQ0OEVjT1VjZ2U1T2dn?=
 =?utf-8?B?MmluZitPUFR0LzFBTGtYUmlRdUwxNFNjYmNsaTRkRUpncmJXVFhkdlJuNVZk?=
 =?utf-8?B?VEE2SGVRbmViVjB2OXpBRGZUb0VzTzNMejg0U05hTzA0UldDUElPUGNvTURj?=
 =?utf-8?B?VThvdlZFZGJhZk1BMkpzdHl6S2g1cVMyandsTW16eExybk4yNjlwYWM1ZWd5?=
 =?utf-8?B?NDlkM29zcFRvd2J5VTJzKysvbnV3eVVNZUdZdGVpeFh3K2J1eWRLdHc1NmtJ?=
 =?utf-8?B?RXg3QlhTVDRUU2dGRGsxVUMrVUg4NllVQ0xKS0xqOEUxY3VNOCtUQXZPNGNW?=
 =?utf-8?Q?/aIGch+7EL3XkMYPApLj6f/TdxGU1kCfnzBxZlX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f52bacb-0219-4b1a-1af6-08d98a58046e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 12:34:48.7224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0FzgPi+3LuQ73Ooz8hJxbgYqCMcvy/8v5GBGtrdjG/TR3r6J2QIUTuVLdTXmzsjy7py4QHn1x/HTN8FQkEw8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

On 08.10.2021 13:09, Anthony PERARD wrote:
> On Tue, Sep 21, 2021 at 05:43:38PM +0200, Jan Beulich wrote:
>> The xen-syms and xen.efi linking steps are serialized only when the
>> intermediate note.o file is necessary. Otherwise both may run in
>> parallel. This in turn means that the compiler / linker invocations to
>> create efi/check.o / efi/check.efi may also happen twice in parallel.
>> Obviously it's a bad idea to have multiple producers of the same output
>> race with one another - every once in a while one may e.g. observe
>>
>> objdump: efi/check.efi: file format not recognized
>>
>> We don't need this EFI related checking to occur when producing the
>> intermediate symbol and relocation table objects, and we have an easy
>> way of suppressing it: Simply pass in "efi-y=", overriding the
>> assignments done in the Makefile and thus forcing the tool chain checks
>> to be bypassed.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.

>> ---
>> Obviously the real (but more involved) solution would be to do away with
>> the recursive $(MAKE) invocations, by breaking up the long linking
>> rules. Representing them instead through multiple smaller rules with
>> suitable dependencies is certainly possible (and might even reduce
>> redundancy).
> 
> There is an alternative to that. Linux have a script which does the kind
> of step we do. So maybe doing the same and move the recipe into a script
> would work too? This would allow to share the recipe between x86 and Arm
> as the link phase of xen-syms is nearly identical. But to avoid calling
> make from the script we would have to duplicate the recipe of %.o:%.S.
> The xen.efi rules is still x86 only and I don't know whether we could
> use the same script as for xen-syms.

Hmm, maybe. The main aspect I'm not sure about is that, as you say, we
have two linking targets while Linux has just one. If there are no
interdependencies regardless of build mode, doing what you suggest may
be fine. If there were interdependencies, your approach may lead to
serialization of both rules, while breaking up may allow large parts to
get carried out in parallel.

Also, not exactly fitting the pattern above, lines like

	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o

when split up allow both objects to (continue to) be built in parallel;
arranging for this from a script may be more involved (albeit my knowledge
of how make works is lacking here - maybe an instance invoked from a shell
script can use the parent make's job server just as well as one invoked
from a Makefile). As you may imply, I don't think we should be duplicating
the %.o:%.S rule, but indeed have make deal with this.

Jan


