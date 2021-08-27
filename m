Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5306F3F993A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 14:53:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173648.316807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJbLi-0005Cx-1x; Fri, 27 Aug 2021 12:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173648.316807; Fri, 27 Aug 2021 12:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJbLh-0005AT-UD; Fri, 27 Aug 2021 12:52:45 +0000
Received: by outflank-mailman (input) for mailman id 173648;
 Fri, 27 Aug 2021 12:52:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4Ba=NS=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJbLh-0005AN-4C
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 12:52:45 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab98fb68-0735-11ec-aaba-12813bfff9fa;
 Fri, 27 Aug 2021 12:52:44 +0000 (UTC)
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
X-Inumbo-ID: ab98fb68-0735-11ec-aaba-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630068763;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bor4mHy0ZMKCn9p7ISHO6wN8h6iZExosoXJLSANvU+k=;
  b=LFcN4czY7HE8IH+gtb9H04pE/Pd/HulRarwckB/ldWglGQvwsEBj5AWe
   g4FxWW04yz+IkHG9+RxuuMwbaexKNdYdkWDk9contUSIArHsC99epkhx1
   oUxLOjP4vhAWzLVeEmBYQgQlPMC98QQUa4AGKDlmrL/1SvCJQX9PPApsj
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aWs/6rw0Q5LSIxDo4zKC5p9GAMOawCjAOS/T3BMHrKBm6RGPRoYUymx/9QWKraQlJQdpM7kVQv
 UH53p3AOdVkevRA5o5RzczfTkMACKvlquLCJoP53a9Rm18ZydPcDq9xuBievJTiwitjKdeygb9
 cOnWfW9EmjMN9sVO03I2LmREeW2OFxTwu46ygw0iNMevRndxE9JIlB782A7A0TmZCOpMnFG3BX
 n/9KvNwOKEfQ/mE4X5ZL4X4EukfOt1u7s7XgtXXjWjR2keOex5XA+s04Rpx1PsADOYqOYrLrhm
 D0J8LF/UOSHeOxa2qN32ubK+
X-SBRS: 5.1
X-MesageID: 51071760
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wAqSDKnIkacWfEOT/AAjtUWf97npDfO7imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPtICPoqTMiftW7dyReVxeBZnPbfKljbdREWmdQtrZ
 uIH5IOb+EYSGIK9/oSgzPIY+rIouP3iZxA7N22pxwGLXAIGtNdBkVCe2Km+yVNNXh77PECZf
 yhD6R81lidkDgsH7+G7i5vZZm8mzSHruOrXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6T60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKfQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8AAk3DsJQ7LgpOSfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Rs1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgu/DWVZAV3Iv66eDlHhiTMuAIm20yRjnFohfD3p01wtq7UEPJ/lq
 L52s0CrsA8cicUBZgNTNvpD/HHU1Aleii8RF56F26XXZ3vC0i93qIf349Fk91CWKZ4hqfay6
 6xHW+xiwYJCjTT4Iu1rcV2ziw=
X-IronPort-AV: E=Sophos;i="5.84,356,1620705600"; 
   d="scan'208";a="51071760"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5TSgG0FQ3wvK0JK4IuDw4rmzJwS5tWQwe39qx7XoWdEwLzZzZ44EZx+Co3LHedGLbCs2El3cszbSciNf8iFwcHhFBelEEX1xk1qlIFDzfEZjCEektQeEqUttnB7Zh0NPy5T4sv7lGzVYs9kI3AN3A30nQxzHFaxqD/369UuKz6rXFiL3oZekTKijfmXAxbrTFYGDl0Q3nmKwEJJXJJmxYCAXaRYUspADBaNDrohbWZfHCFoEvEYjn2t6sZRRSXFW0/V/K7kD+OzLryU3Iemx9VmvidskNQMbKrEzogV6rHQNjgsvjJo+yGjqbZxrzMOoAmWJM/VBeOweztFikXmqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bor4mHy0ZMKCn9p7ISHO6wN8h6iZExosoXJLSANvU+k=;
 b=dltptcsuZ9R1yRUSVitHK1HHmzXI1lkLipBFoULvl9aBGW4jye/vz6/KhEpG0GHde8MZk8ww5FcDzYbOAXgyCkSfrJLVF1H/YSve9Z/DEKwZa5vkmuDHqGGpNR8AkQpESCSdkkQxCvs99Pa9/ErGeJa3L+lAiVWUAHru/jsa9OOei4YTvmUbjYVNCeh6rUApPkhjGy6dP5MIvwFb5mBGTQjTWZsbNr2VY0A/sXnhwy+etnJbRYRECX4pMW4DRpawBdbpqMrf7Shu7xwTFMSpqwmM5O9PAwSQ++teWOe3SwzQl0WlWDiH7TmPtTtgN8hDWGy9C6D0/yG4uvxF3s4E9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bor4mHy0ZMKCn9p7ISHO6wN8h6iZExosoXJLSANvU+k=;
 b=ii5p3gcBhJsR/1PTW/tQizlIF2UhTQaiVMeQXMokAOdxLsCc6l+yPdTChSzMzgOfXyjsZOruZyiYFc1P3VnRej6VCVo8B/gSCvNaQnb2uKIe9BMWX+PiOTDROTF8rXDY4772XcmUowFJt92ugpC1lhvu96WX1MyYN7h2Ora/vn4=
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a1724918-94bf-748f-5c4b-5a3ec176368f@xen.org>
 <dc1e3e1f-f7b1-6f73-3a16-804496952df5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: HVM guest only bring up a single vCPU
Message-ID: <615b2d88-1b15-1884-0d4a-d70ae867ce57@citrix.com>
Date: Fri, 27 Aug 2021 13:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <dc1e3e1f-f7b1-6f73-3a16-804496952df5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0252.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d70d4b2-b50a-49b9-e76c-08d969598d7b
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6391:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB63915C3413E84F0353BFE36ABAC89@SJ0PR03MB6391.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9CWcsYFfRFV0rub6nC1fKiW7GYJsniqFgF/GXeYxu33PvKEb3g9Xa/WYDK+iziNLrgwVUD+9lVA5lesQ5u9qcwLDLeNcLBn9lNYaBJhwLAzqnz1SLeU74GbW5/EySp7l8sBcVWLK1EectOjkO6P77/sH7iBcjo2WXENdGIJe4KDQe9M0l1R3uJU9gjQ5Eg7U5yYHvqyXrfoBR/RLffqo+aOVpEV98QQZutrN0y7NX+Uq1jkj910mTFEO8znURqiPd00Ru/G0tOTTA8yjNsNr41/3VDdW+pbRfcMEu+fClGC44kDzpHGzdEB28aFu5A19ASzucsFgFRWii7mtpetqnvl885SMTyz0FZE/3hq3c9ghP2wZczFl0DtsSgSA1VwUwl3xaqYYo3lOseGnB4MVR2OCIOEo7k9smGGAT3bNBwjPRVROmSRgSyQvthPCGXoGCza6B9WKsGVigR5LF6dTUNGeSO2vJ81Ek0ZXjHzsNw007HfpRzTxcfYzuiJP4Qlx76zRnKhsyP6HA48K4LFNMv48kdF8QpW1JqdRbCMNOqxSy1h5uLT3BDA5xNA3q4fzzLXmP2OsPK9V+QVfEljKGAyDhJSskdHT39zppQHf/bP01Ck7i+tmBRvWKjI9OdqXuW3We1qpJQmW0a8E73HUjXU6Km8liJLf4e/alfA0nmZmo4KHCQkeEVRX8KprRi3gXnQ34JpcRFAyBl0rYiJsSwKCthLHXM9aLhtgxQvM85I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(53546011)(5660300002)(2906002)(31696002)(956004)(6666004)(4326008)(55236004)(86362001)(8676002)(186003)(31686004)(83380400001)(26005)(508600001)(38100700002)(316002)(36756003)(66476007)(2616005)(66946007)(6486002)(16576012)(66556008)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1hHSTJBMllhZ2pTYnVxM0Q0d2wvdEsyNXFGOTNxZXorSThYNGN4QXY2dHM4?=
 =?utf-8?B?bklKUFRZSnYyMmprcVl6M3dWY1A0dTJ4VktPQjNjc2ZncWlCV0dmcy9LMFZH?=
 =?utf-8?B?TFlkUjFHQkxJaGdCNHpnczg2Y2xPOWZwYVAxL3dzN2hwVGF3K2EzbDYxcGhV?=
 =?utf-8?B?KzRaWkxVS0pOb2tOVzdRRHJDMllnUlR2Y3dncnk0dU9NdUJ6UWoyQlluYlI0?=
 =?utf-8?B?YzZCaWlyR1UwUXZGQlhqOVh4amJRZXVxS1FXWHBhZThqV1FaVFR1aDhYeEtq?=
 =?utf-8?B?UGcwNzZzaUFVVjFFR2JHdll3NytRSjRtUklCRmlhM2pITm01b05zY2h4d0xq?=
 =?utf-8?B?SHBUSjU1cmlwQW1DbTBZUDZINUM4ZGVma0RyTGdOUHg3TDU2c0xqZks5bk9s?=
 =?utf-8?B?bUhEN05RQlYwUVZ6eEIxMVZDZHMvUGgvWDFNV1pqNDZZMTVCS0YwVG9mYWN5?=
 =?utf-8?B?WmM3bUlpQjZWNmxtUWd4c0ZBV0dXWTdoWGZUWElvYlBhV0hkRm5qL3VFWE9h?=
 =?utf-8?B?Y2YrQVFZTjZ3Qk9lL2RhdmFvSTF2Y091ckE5MTVZQStLSklhZm1yalR6T2ZL?=
 =?utf-8?B?OEVkSzliZUptTlVqcStONjlFWXl0dWpUYmUzRkpPdnFtclFud2xoQWpzMERF?=
 =?utf-8?B?TTErNDF4NmFFZVlhY2JwQmtMVDZTWHpmaWd1cFc1bzNBS2oreEp1bU9aUko2?=
 =?utf-8?B?akZGMXFBV09rQ2QyeEQzd29xaHEzNFZjK2hIRFBNM29KZmxrT0IwS1QyTUU1?=
 =?utf-8?B?VVhlK1o0QURPR0Uwc0x0Nmg0eGllVUZxQ0Yrd3VDTnVHS0Q2SFVtTGdsVnBG?=
 =?utf-8?B?aHB1NXVjTGh3c3FBMlQ0R1VwSzd4WHNIY242bmFQWTNkYlI2VGlOTi9sUVdU?=
 =?utf-8?B?V0tYb1VXV2dNSDFVUjlLUlRmdDk4TVR5SEJSQTFwY09POG52d3l2OVlJTEs3?=
 =?utf-8?B?TUMvaTRZcXRad1lLZHdrZ2ZkYjBBTm96NVZKaXRTcU5EZGxLQzNmTXMxOWlj?=
 =?utf-8?B?ZytSSkltcE1BOVR4OUtIandCaEx5SHF4emFISFBIV1FsNjhhK2QvYlFuZVN3?=
 =?utf-8?B?YmpYb2ZEYjRSbDhab3hmYkZCcEtncHQ0cG5EVStvSkhIMjJSUUdYWnN6clFP?=
 =?utf-8?B?M2hRdDJKU1RkMEV3azdRclI0NkFxUVZBMGRxL3h6NUtiSjlTejAxYzA1NzVF?=
 =?utf-8?B?S1hNSFlNaW1DSEhEWlFkOC9FUFlBVkhUNzRjSjNRUElmOUgwT0tNWHMwS3lS?=
 =?utf-8?B?UXlIWmlTcXhhSTdTalVkR0hrWTJOdU9WN0k2cWVzK2Zyb0ozSkRBTUJhVVNk?=
 =?utf-8?B?elZOSXlVTGNFVngxWWEvYzVycUlBNVpZNEdROWtlMEQ0VHowek5HUFJDT2dm?=
 =?utf-8?B?alVBbFBBbm85VjVzelNhd0NLTkVmUGRDL3dDNEhsMDdYQTYyVFZnYTM0RnRy?=
 =?utf-8?B?azNTcTFPMXlIVjdra2lnM05xUlozT3hWU2F6RmNVNnR0YkZQVmZsRG9uVGlL?=
 =?utf-8?B?VGs5cXZkL0F0L3RSZzdHUXFMUVhvM0llaWdjWURsdmwxb0xWRUNhYUt2ZTZu?=
 =?utf-8?B?Nk1ZRUsrYWVoOXkxOFljQXdnc0xlY1Y5QUw0dlBUaEM3T1NYVjR4bDEwTGhm?=
 =?utf-8?B?RUx4YXZEVXFGSXVyOVJDK3lPRk1wZmtUZmhBNWFCemdqUDlKUDJlZ2d0RTdW?=
 =?utf-8?B?Z3dONlNMYzR3T0NOV2hJaFFxQ2ZLdm9pM3hPTjlKS3hoQUNxZ1FRLzFMWVN1?=
 =?utf-8?Q?PJ4Hz3e3w8pFejJD/dM/Rse8/ZheLfK+xQeQcUY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d70d4b2-b50a-49b9-e76c-08d969598d7b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 12:52:39.8178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xj5YBK6mZnDWZHeBe+kwu5p9TDzw9hYi5KqZOHGkDH1zr99H2rvJQ/qyl6lRQSBjJiHbA1yYEv9fZDCHOl1qT8nKoSBSdEGqiXgJKpYpBWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6391
X-OriginatorOrg: citrix.com

On 27/08/2021 10:26, Jan Beulich wrote:
> On 26.08.2021 23:00, Julien Grall wrote:
>> Digging down, Linux will set smp_num_siblings to 0 (via=20
>> detect_ht_early()) and as a result will skip all the CPUs. The value is=
=20
>> retrieve from a CPUID leaf. So it sounds like we don't set the leaft=20
>> correctly.
> Xen leaves leaf 1 EBX[23:16] untouched from what the tool stack
> passes. The tool stack doubles the value coming from hardware
> (or qemu in your case), unless the result would overflow. Hence
> it would look to me as if the value coming from qemu has got to
> be zero. Which is perfectly fine if HTT is off, just that
> libxenguest isn't prepared for this. Could you see whether the
> patch below helps (making our hack even hackier)?
>
> Jan
>
> libxenguest/x86: ensure CPUID[1].EBX[32:16] is non-zero for HVM
>
> We unconditionally set HTT, so merely doubling the value read from
> hardware isn't going to be correct if that value is zero.
>
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I don't particularly like this, but I don't like any of the junk we
currently have here.

This codepath ought to be limited to virtual environments which have
given us garbage in p->basic.lppp in the first place.

Therefore, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> I question the doubling in the first place, as that leads to absurd
> values when the underlying hardware has a value larger than 1 here.

It's broken for several reasons, perhaps most obviously because it is a
gross assumption that all systems look like a Intel Core/Xeon with
Hyperthreading.

The right way to fix this is to pack the APIC IDs tightly (which
actually lets us break the 128 vcpu barrier without vIOMMU), and adjust
the SMT mask in leaf 0xd to compensate.

We need a slide of 8 on the APIC IDs to do AMD legacy topology by the
book, but as we've not had that before, I'm quite tempted to leave
implementing that algorithm to whomever first actually needs it.

> I'd be inclined to suggest to double the value only if the incoming value
> has bit 0 set. And then we'd want to also deal with the case of both
> bit 0 and bit 7 being set (perhaps by clearing bit 0 in this case).

Honestly, until someone starts the "lets do topology correctly,
following Intel and AMD's topology algorithms", I recommend not
tinkering.=C2=A0 It is incredibly fragile logic.

~Andrew


