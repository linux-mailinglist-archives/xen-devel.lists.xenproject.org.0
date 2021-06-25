Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F413B4957
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 21:47:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147404.271694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwrmF-000480-Ez; Fri, 25 Jun 2021 19:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147404.271694; Fri, 25 Jun 2021 19:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwrmF-000463-BW; Fri, 25 Jun 2021 19:46:11 +0000
Received: by outflank-mailman (input) for mailman id 147404;
 Fri, 25 Jun 2021 19:46:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwrmD-00045x-VT
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 19:46:10 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce364d74-a0dd-4fc2-8d37-0c587b3e106d;
 Fri, 25 Jun 2021 19:46:08 +0000 (UTC)
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
X-Inumbo-ID: ce364d74-a0dd-4fc2-8d37-0c587b3e106d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624650368;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1n716Ac/clSahlyuPtUMEaUjD+dpUbwVP9vxaUNAkJM=;
  b=JJrMRsGjo9rQtBR5X71dDCnmm9C4bvncjlfj94RmitUhnC7rR0UEp0ek
   nIKshUp8Lelz6xkigreN7ywUTYkss5Mqcxidwj/b0sAulV5pZEw4mzSLF
   fFpAYexKHK1wz1hsgz4cuw/ymn3KPuqP7Tv28nCxk2RuAVxmbr+HhJTba
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: W7ryesnrZ1mT1NU/MBQPMVkjvyPqNeADJhCd5EeJD37rj1dbSNwn7ttmbLBLsKdp+EPLHfGkkf
 UdwEKMu2dN2r1k5ICbV2jbo7gYZ2jYgJU9QYNiMBAc+4QFbNL+Hbdxva/HkBTHh47ivCSqYTRQ
 Uhdw0KuraUYsH2lIRlRrj2FLKh0Enx10EhlTZcwi6QBU4jyyqA8TcaU4gldRfsGmdJ6ZhLiBgs
 ttwL6n7prkAcrbEz3n8fLdKwMyON4n2SrrmaZDO1ZE/zmCJKzzH1u/eJETDiP+XqqTX6Xv5oxw
 ij8=
X-SBRS: 5.1
X-MesageID: 47374235
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:SoEy6qmy7ORh252OlFc0rY1HKp7pDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.83,299,1616472000"; 
   d="scan'208";a="47374235"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9jMG6TQkiAivg3RsHAI5M8bcWM3adZtDQX556dMiog8VyqzqozvgWnwSmPnToU6C6CseX375qCketkP78gb8oeRvT2nF/LDXeMJBVfERukc5SKQZ76ZUIFvdizFM5fWnY/4d7KZAPt19JGy2tYqV6USEs2V/CJ9rDwQJMohgCMNU1zLtzpnv2n1TF3watRK8Grb8fniQzoVsENfApqxEbVyvOgJ+CjQj6RRKk4VZ99uQLHTEp6uqzACu78UAD9WVVkeay9Zy5SlH6/6B20bYcQEA5lQTpRG8WYzNGb5JTk9K/efLH5c97n/ROs7Eu7DySlDwi9O8ibCC52XitHo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSNxHExedVhCZK4HiV9874ynzIwZDWceReo04kMqWPg=;
 b=lPco/B9WwbzuQTLcdgNrGJtJGTBsnWxUhubeUbMQAOxzyKnJDdoHFZ2WwsKF7nIiqPq9DBkyEZ0uKxo+EytGgGalt3m2HQfQNr0a/eTvtMqBMOkAFyD/7d07JgcI3tqpoo+fFGK5rDjDr+EtnRKN0jpTuNFp/ejVZ2J8NmvOrxgFJ0NVk+6bktJZe1F5fuDUFZlCUVXGOdPOqD8ruR5SbrcWv3ppGsVE8oxMAvcZ6o5TdANzTFnUbBwQcy1Wx3Vi6mMcnMCVULrfdPzHbJW8oVPrJylgI2edj5U5WfuIyIKtqXXMYNL6zo/EDhO0tfQasfOpOZVsu90M2i+MQpWGCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSNxHExedVhCZK4HiV9874ynzIwZDWceReo04kMqWPg=;
 b=HiDzfObAiFQeqMHTKtWMkzHzxdSDkFwBhuIaiAJsR9gvQ39eK8KQdEnr6azojLCMa/xtdHyCR1YVlEtHAdYegDQ5QZNrOeHZ+WlHzyblhMKSq8O0jTQF4TyaxCBShAabzYs8//lHh4vMvMfNaNku01rchYwfoyR2VudtR5Tonlc=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <03512f29-7a4e-70ff-271b-7d65ed471935@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 12/12] SUPPORT.md: write down restriction of 32-bit tool
 stacks
Message-ID: <f3a758a2-a8a9-60a3-92c9-1a490084dbb6@citrix.com>
Date: Fri, 25 Jun 2021 20:45:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <03512f29-7a4e-70ff-271b-7d65ed471935@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0413.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8159c283-4a38-40ce-bfa6-08d93811dddd
X-MS-TrafficTypeDiagnostic: BYAPR03MB4360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4360798DA090CC80E6CDFDCFBA069@BYAPR03MB4360.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u3rZaLIIQfa/+FZSjvL1R5ohtw6wKRRN6yKDcpjpbtDc2g2X6CTIwmGDWCQXs8vCBmsAsTmOQnEiHomUi6/l+GcqDnBpogwCWXfKpX39QM7UPxH1Rp8q42ll+fDqDrZJl8BV8d3hHZB2ptYs5a7vgbnHJ4ZsjkG7acQZO7rBFtFWK4VP040QnkFGURSS2cKsN5H7ySHTWzzx2nDOfykVphtyEmGCg0tpHCJRYy2zpU/Phmfeux1GhqhTwGP+RgkbF+CfZtqR2zXHocax4574QNjQM5CAkLku3fD36F6FdiOjqkiqcf73/h0jAsveDzMmA3YjDmTcSzX9kG4xFue6DqwYCvIweJe2ATi1aS5mMTKHY669riUTcooYO5TjWfmPayJaz4+od7B/JVhXEWWmuzC5rWT5Hf7H9dPsq4iSx6uDbyfl73UTH2GVu2FL/MdZdKAWSDGWufnHPX8IFCsD10ZKqSzq6+hfAiagMo6/EW8O9Dtfy5P+wH5ohr/IJe2YvzOIn82zkf+5aTbJFQYLJNHnqAmPXMWQqBT9DhcvG5nWKwWloT0vwTqO0KdtuIiSsB5UqBVBsJ3uKVqPzfaauRy9PeuIa/IG0pgma5SWD13OjpINk75x+cRyNtNUulQw680/rxy4d43131sPYeTHxv53jUojaDvfsteXUejktwxkjqUUdJGZSzwh/bMEY6YT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(38100700002)(6666004)(956004)(83380400001)(86362001)(2616005)(31696002)(110136005)(8676002)(478600001)(31686004)(54906003)(8936002)(6486002)(66946007)(66556008)(66476007)(5660300002)(316002)(16576012)(36756003)(4326008)(53546011)(186003)(16526019)(26005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkF0OERsMVVzMEg4aWV4RTZKVDh5bkNaTWxiU0lrbklvNmFHS2hwTUs0VUVk?=
 =?utf-8?B?Q2IrcEhRbEtXWW9SL2Y4RkdrQWQwR1dwM2d1eVEraWVCWklwVkFIa1pLbEV3?=
 =?utf-8?B?VWkvWm1XOXFjcXBYSmoxcG5PdktyYlZjVGRHTkFxSVJDZlZneWpJSURPeERa?=
 =?utf-8?B?cXlPVTJXWGlhKzlUTXIwN2U4UG1CaG1tdkFsNlNPbXVOZ0NXNy9SL2JWamow?=
 =?utf-8?B?Ykdxd2pacWlzYXJTZ0Z6K2pXTzlRMmRwVjhSYVU0N09aVTBSNVpDKytLdGpN?=
 =?utf-8?B?azlFWTQwWko4cFMwRkRVNjlxR2FweWlDQW9xbHc0Z2pIdUdUdkxzUzBQb1ZK?=
 =?utf-8?B?NkV2MUgyWnVTVXU5Z21LekZMQlFLM1BHdi8xb0Zta2ZDUUJHZzMyMUVkTDJk?=
 =?utf-8?B?R1MyaS8xVWFZQjlXam5iNnVGekFuaUZ2ekliYzQ3c3ljOFQ3Qk1mNFE3VG41?=
 =?utf-8?B?TGZCZHF2ZkEydHF4YlUzdXdKSEVsUHo1eWdTSG84UEZTdmE3ZDgyTTBCMEVN?=
 =?utf-8?B?S2Z0aFhab2g2L1RLRHZMVGFHZ0lnaDh2Q3lFOFhnM0hjVlBQbjRDT1RYV2U1?=
 =?utf-8?B?U0hQRDAxa0FER0U3VFBJQzlXVzhRYjNmTWhFMEJjTDBhZ24wZ0R4b1ZDbVhn?=
 =?utf-8?B?bWxEeFBxbjZwc3p5cyt4ZzlPM213NjJGQkNFZU1uSnZ2d3pIU01nbFRrcysw?=
 =?utf-8?B?V1JvMTRFTkpGRjBEK2xjSmlaQ3ZBOVNIVkRTVmhDa283UVNZa3FyODBIckZK?=
 =?utf-8?B?SGExN0RvQTQxbEk1ZFgzd2VYaHVnbVMrSVVxaE9Ib2k2TjUvRWNjK0hPSElO?=
 =?utf-8?B?U2lDMy81MzFXVzcwZy9jaW9maHlwOHYyeXFPR0Jzeld3NjJ2OVo3Mi81Q05z?=
 =?utf-8?B?SFE4a3hGZVJtcXc3UmpuMVU3RVlBc0pSWlROSVpKVFYrSDRwTFg5WWQyTm5u?=
 =?utf-8?B?SkFDUDF1VTBWMG1EOFpTZGpIRnd0amNZTDFzZzU0Nm5UT3IxUlhscml0VEpv?=
 =?utf-8?B?RGV4UWFJcnhXdkphOUJENW5DVEVsZU9ndFZSdG8vc2xaZUY3cHNqME4rNlBk?=
 =?utf-8?B?b0dMTHJpeUFvVW9rODRzTlN1WEZDUUYxQ1VJVlI3WmFmMVpQR0Z6V3FVL3pL?=
 =?utf-8?B?TlpvRjNJaFcvVXNGdVRQSzE5eVNNTmxGUjJWUVpzNjM1Y1gzREpIVHlwcjlB?=
 =?utf-8?B?Q3RSblY2alFtQXBwNmtkZ3pLTmJoL1NjdjlrL1piTEVKZTR6ejNpZS80WEJ4?=
 =?utf-8?B?YzJjYWtpZ3k0Zm1TWk04OTV3aDZEeGZ6VXZpQXBmTnMzRzVwS2dEUDZGbkFa?=
 =?utf-8?B?aFFCMTJEdTY3cG5YR0t0QWVxK3VHTHV3YktIY1htMjAzbnRObjZVQTRvOGc2?=
 =?utf-8?B?aWozZFhQVWNsVktWZGVyMEtaSmxSRUd3dTJqamlyZWk1VFZKZmRQRGxaY3gx?=
 =?utf-8?B?YmRseVUrY3lYYnFxNHlWOGFWa1E3MndybXJoZkk0bXI0RlVyU0Vza3lVVldm?=
 =?utf-8?B?MWtwWlFMUmhjWG1DeVFpZ044SUIwVXdJaFB5dTh0eGxsU0V6ZVZDRm9EYlBk?=
 =?utf-8?B?R1F3RW8xWGhMMjlvbFJ2NlVrc0NMS3ExM3pGQTIwQ0QxY2JuSkVmajZTaU5u?=
 =?utf-8?B?dWZyTmsyUHUwWklKOU40Szg0OTJ2Z1A2RURkT0owRW5EcmdpNEM3Uy9ad0VU?=
 =?utf-8?B?Smsyck8wZXpabmdvanoxQUg2Mm4rbGZ5bjVNYXNoa05PQ1UyYXV1L3Z3TnVV?=
 =?utf-8?Q?WudLTB/n6SZJwbChBrjDaB0vFuBfu9E08HvxL2u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8159c283-4a38-40ce-bfa6-08d93811dddd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 19:46:03.8781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipGPETwB844D9bsKmZmmAu906UYDlR9mjg0M2eb9jC2W3HSsdLOBg/O9sfHmeU4MLoPh4LbVwVip+EZ8jwFvZruIcRntzlVjTPmLqwi05KM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4360
X-OriginatorOrg: citrix.com

On 25/06/2021 14:24, Jan Beulich wrote:
> Let's try to avoid giving the impression that 32-bit tool stacks are as
> capable as 64-bit ones.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -131,6 +131,11 @@ ARM only has one guest type at the momen
> =20
>  ## Toolstack
> =20
> +While 32-bit builds of the tool stack are generally supported, restricti=
ons
> +apply in particular when running on top of a 64-bit hypervisor.

Actually, this isn't true, and in a way which helps us right now.

PV32 isn't security supported, and neither ARM nor x86 support dom0
bitness !=3D Xen bitness.=C2=A0 On x86, it doesn't remotely work because of=
 the
pointer size mismatch, and while this was bodged in a horrifying way in
the ARM ABI, I doubt anyone is in a hurry to turn that into a supported
configuration.

That said, it is my intent with the ABIv2 changes for a 32bit toolstack,
under 64bit guest kernel, under 64bit or 128bit Xen (yes - RISCV-128 is
already a thing being discussed) to function.

>   For example,
> +very large guests aren't supported in this case.

The wording here wants to be careful, because under certain readings,
you've just dropped security support for 32bit toolstacks.

What we actually mean is "a toolstack with bitness < Xen is not expected
to be able to manage very large domains correctly, and don't pester us
with bugs when it doesn't work because we won't fix them".

Whereas we will fix security issues which only happen to manifest in
32bit builds of the toolstack.


>   This includes guests giving
> +the appearance of being large, by altering their own memory layouts.

I'd drop sentence.=C2=A0 Its an internal detail of a corner case which we'r=
e
expecting to remove in the future, and "the guest kernel can DoS itself"
isn't interesting.

~Andrew


