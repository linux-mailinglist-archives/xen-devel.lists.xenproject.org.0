Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8333F7AED
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 18:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172541.314840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIw5r-0004n5-Sy; Wed, 25 Aug 2021 16:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172541.314840; Wed, 25 Aug 2021 16:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIw5r-0004kT-Pm; Wed, 25 Aug 2021 16:49:39 +0000
Received: by outflank-mailman (input) for mailman id 172541;
 Wed, 25 Aug 2021 16:49:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACUI=NQ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mIw5p-0004kN-OE
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 16:49:37 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6defcd68-05c4-11ec-a988-12813bfff9fa;
 Wed, 25 Aug 2021 16:49:36 +0000 (UTC)
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
X-Inumbo-ID: 6defcd68-05c4-11ec-a988-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629910176;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sSD7xVJL7ahHbsiWfJfr4XJLwjTlpquc6eKWG7Ww09A=;
  b=Rkd0GeRXjDOpgLT9ZHxzdoPA/1zZYmbGgaPV7a3C+PAhiKCqbvygDLXe
   Fn2LhcPHnjpNptYU0WyMVJgYBaN4/acMSrqMLpx3awPuM3L7Qb31DMR5O
   OJeXgifszWnO/nz93PaxSfxSLU6yaJQQKWSoS6I4w5eQdR6DMasz7D917
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: r0kEU9FsFgKc61yHRkhMP+HtYCRtl8aCogwLxg4wXuN2wugHDnG8eRoZphQ+hMaBzecQjI98Ty
 Zi4iNC/p0ENdVy7zFmlStBg+a/IoLHn8o3KAtJQKVtaelC98gAc/0fVkisM6SCRjmZJlZECIHk
 wtO2xiaSoGZQW/dM8nUxJwQeRalsYemx0wbfjuoa/2Qk0lprIo2dsHa/VkG7Woe5N6qgxg19/q
 e5/Qa2ABCLKj/fn6lrvgEu1Nrbf1Da5ropGaBIOmxgUL3yvv0MMUdMOqv9VETtUgW1mY26e0Z9
 Fdi8Oi3pDLgDqib+sqV2vE7x
X-SBRS: 5.1
X-MesageID: 51291983
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YWeNZ6kHVelEUqtXRczuHIy4xQHpDfOiimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPtICPoqTMiftW7dyReVxeBZnPbfKljbdREWmdQtrZ
 uIH5IOb+EYSGIK9/oSgzPIY+rIouP3iZxA7N22pxwGLXAIGtNdBkVCe2Km+yVNNXh77PECZf
 yhD6R81lidkDgsH7+G7i5vZZm8mzSHruOoXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6c60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKeQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8AAk3DsJQ7LgpOCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Qs1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgt/DWVZAV2Iv66eDlEhiTMuAIm2kyRjnFohPD3p01wsa7UEPJ/lr
 352s0CrsA8cicUBZgNT9vpD/HHUlAk7Hr3QRSvyG/cZdU60kT22tbKCYUOlZSXkaMzvewPcb
 T6IR5lXD0JCg7T4fPn5uwDzvmKehTnYQjQ
X-IronPort-AV: E=Sophos;i="5.84,351,1620705600"; 
   d="scan'208";a="51291983"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLXQXEr0b7i93cNMorp8gQtHdh42aCbrZyMln6i2E8J0b9ML2/724Rz1A1hUX6hYZoBogJIZBqgZ5EaVczA2Lng85kfO96oqlByc11RZJhazr+hHyi8IRLCKICe/YuEHVzzTRMIQdNHdpvVUIR2bI3++vIAz7SmIQu+4bfou46umX6d1KuwGjRDmuJO1PvBT0sgRRIWuFbcWZgyKzw2y3PoYAJb51HXW9y8demUtkctEzKn1VmSDUJ38/BJQ/PhvWUtOFLGa9+/KIwQi7RbmAf94OxhncyXQw7ma2l58w1W9jb5oLQX8fe51+miqPcwknz0G1afZ76g+wjoDWNBD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2J6Iia5k5bATlDvnLUA0oX+Q7p+at0L6fvq3tynrx8=;
 b=TxoHoY4g4bps3NxATh0LbfK+MXATRnjBJbDacBxJwBthMWJrSQxo/ZWj9ZsDbLbMQSczmjltJDUNj8ek5Q5RGkOqrOIrNys0HWN54raNCDbMApFj1jzc4btkit9xO07YSLsmNNTqx3ie12LKMXcqQmxmLGD0HA70Hby37xuQgyXI6AgpiEIJ22+oeq6Y0rN6teCaarCPX1e2Tx99nPNpy/k0PZB0dI6935DRvzztlnCGGHGB7JXno8Ox/ETCpHVRG+e7svKpp2EXEg8+DLUdFoZvTAeVPFeGLK5X6aI9TtpiY+Qu7zMWMYQ+4DQQv0jpYEuYtfbIzfre2bzEH3L2gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2J6Iia5k5bATlDvnLUA0oX+Q7p+at0L6fvq3tynrx8=;
 b=dsu7Dfb3gs7iToWnflJwvt2dwP6GQ4+pvsG/YxEvSujBdTJX1ZAPhADNcHQm4UcjUHnKfZgL3FdFvnJ3LzRdfTqSnek3cAs7HG4oCNABwM6IJJXPXlAf5CWzOqCXPttzqgDE5wxOYIiFM66NKDMIiIX+9Jig6PR9KLi9tEbiFxc=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>
References: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
 <45de5185-b514-8c52-6922-4c587818c698@citrix.com>
 <3125583f-b965-7746-d833-c197857cd7d7@citrix.com>
 <15fb708e-e03d-bc4a-a0bd-72b81d26c6da@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/xstate: reset cached register values on resume
Message-ID: <930a3c79-ddf3-2b95-495d-8d4f229c9fb9@citrix.com>
Date: Wed, 25 Aug 2021 17:49:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <15fb708e-e03d-bc4a-a0bd-72b81d26c6da@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0346.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3628807-fe6e-4044-11e6-08d967e85042
X-MS-TrafficTypeDiagnostic: BYAPR03MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3861AB9968F4718742227C0CBAC69@BYAPR03MB3861.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 44zDVw/Tpvh3nesKFmd2SGIxbQZuVtDSwcRrvoDMZ8BUw9lld6xE063lp5Sbumr0Z0rzU7TR1qS1eJSmq8b7REEZXM7/aSm4QqDcjWzVYyKpT04A8MoELyJhlcx81EcQZ8kw8pUnLXH+vMLZTIvlKGgTn4+UIkqAhWZtFNNkk8EQwSbhXEijc5ha7TX0i8VZzHTQWP/zZOh7N0Az6ZmzYCu9l7MTNCh0qfFgpVe2G3efy0JFkh9E6pkbGOjlbsDCeQk0au49rhJVBfkOmzjjiFQJqRpLyM9TRlX+6gCm8jFF4XUBZc4H6t7y8fIiT0ig9/72IK7vAxEwvVhH5BnU35I3dVYKxc6g5emoa7fO7KhXacSu+bi0LOxaTmbDLL+bWSE2aqXA7Urkc7otbmuEtvBBUJRRRcPCJOlNQrcLsQYJlcFrs5eC/9C1Mlc2XA+WQmgeqFtBbvaZ6GvVU1B/OK2JbWxpNOIyFwZ1n4nmRFVkaI32Nq+v7U3ODDiX9PuqnDm00VqDvk+iMeoCEGIGMOha17HkDHUr/xd6qi8Rvf+PRXR1yEL9seV5g/BJqTUs+Lif2+BYqxG/skEj1+ln4BFACOpHHQNLBDQsNU/SyUNh535BceOgLr+WIBT/jhUiSHWBhwrqQZlaGGYG9OeARdmI6jiIjWlynEASN+IH5kU97tgBQfiMhkCyUPblvB8i6Rt0fkFSA+RpAJdIl7oV8fZoBz7ve6ytI7mv8lj2ElM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(31686004)(2616005)(4326008)(6916009)(956004)(26005)(186003)(38100700002)(5660300002)(16576012)(31696002)(86362001)(316002)(8676002)(2906002)(8936002)(53546011)(6666004)(66476007)(66556008)(478600001)(66946007)(36756003)(66574015)(83380400001)(6486002)(54906003)(55236004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm5FWVVMbW9Yb2ZnQTYxZlBQOEdHcWdaZVNwRC9zRkhkbmdkRVN6TFpCSi9V?=
 =?utf-8?B?TmNvQTUyRHMxR0lQSmNrL241RFZzZHBDVnFNS1dOZWZJSTRJYU1BOFB2dklI?=
 =?utf-8?B?VURIOEJIUlFqN2lkZkFRZkk2WEdlSnBXUE1WS3c3SE9xcjZvcFBDazcyWkw1?=
 =?utf-8?B?NzZjVDhJTUxJN1crMFFRb3lLZ3hXU3AyQm1NbTdLcUV0bGxnSnBDNlhDSVhw?=
 =?utf-8?B?ZzNXcUovd3dmclAwcmhPWFcwY1pFQXRnNG1jRW1UcWJYSVBTeU83Z1NWWTlH?=
 =?utf-8?B?N0RXSVVKamxxOUdJSzd5cHN3QmhkM1lUbEpMV2tKbmtsSEVubm9meWQ2MEty?=
 =?utf-8?B?VFNKcmZVU0J5SXl2TXI5ZURIdktGVGRWTG1Scjg3S3ZSRzh3ZFhrZzJsVnVz?=
 =?utf-8?B?L0FYcGJmVlMxbzdQczZLdG02SjA0M1o5eFBjUk4xeDlkdHoraTMvL0JvakRu?=
 =?utf-8?B?NTJUMUM4M2ozN1pBMW1BUlJwY1UvbnROTFRYeUhjRnZpOURrQlFQZUxzUWZZ?=
 =?utf-8?B?QnFQRzA0WGdjYm9mWXRVMXFmdUVwY2hwUFFla0czSlJnYmNteVRla01ia2hL?=
 =?utf-8?B?eStaSnhTWE0zc1NtS0ZoR2Q3ZDFEVDIrVlY2SCtnODZ2WWtGNXBKUnE4N3Er?=
 =?utf-8?B?dEJ6bDVDQXNjRHZtTDNsSmdKbnEzVnRjMVNYUmhxRHZUWnNOSkI1b0RhWjdI?=
 =?utf-8?B?aEZ6cDFoUmZ1OHY3R2tMMG5GdHlJV1JEa0M3ckF3QTVEVXZTMVd1aC9GRjYz?=
 =?utf-8?B?emk0WUxHY3l5L3ZHV0ovbHBpZUNNMmdERjdsWXRDRnZPNkVHNWQ2UXlDZm10?=
 =?utf-8?B?SWZTZm51WW9iUDVDTm1Ba2s3MlV6YW9UR3pEaFpxTVhnRmN4bnFNUmtqdDQw?=
 =?utf-8?B?YXJaWXkyMWkvT3d5TlFsa1dEVTRkYXpKbWx2enc4anZzdTlaYlhpbk43U1or?=
 =?utf-8?B?WktBbjE1WkNvaXR6d2MzeGg2ZmdlL0FCTlIzdCt5eUlRcGdSNXl6VnN3dTZT?=
 =?utf-8?B?d3dSanRCZUM3dDdJNStEenUrdFQycUF2bWtxbVI2Vk45dFBWNlpjL1NkR2NY?=
 =?utf-8?B?R3BIMXZid2lLdUk2NXQ4MW02cmkzT3c4U21PYXc4YzdwN1NLbm1LUXVNNHFx?=
 =?utf-8?B?TDBaRHZkdDZPY1ErYURUd0lpUzllanQ1ZGhlM0wwdFoyK0ZlallRMkxLaE1y?=
 =?utf-8?B?VzVKRWV6dzVSaDlOSEtsN3F6UlZmYkRHY0htbHZMclFvb1FJcDdBNnlHOXFF?=
 =?utf-8?B?Rk5ob3FBQlM4ZTllUTZMdmxOc3FkYkNNNkNpeHJKZUx6U2hSWlBOa1FTOEl4?=
 =?utf-8?B?SmJjd1Q2WWJZL1lqV0ZoaGlBSDNuU001VUZlajBtcHpPNGJWMW5GZDh0ZERw?=
 =?utf-8?B?TFR2ZmtnN1FaY0VFdnpvTkZUZUM0S0Rrc2dDK0I2L01DMDZ5VE1HMGQ1aElO?=
 =?utf-8?B?K2ZjVnlUblQwY0hZekI2eDEwNVFwSmZtcXV2YmdMck9FUGZXaC9BRGZ0M0lu?=
 =?utf-8?B?bFNBM1laUlNKYkZQYTJiYi9CT1ZwYk4vVEE2L28yTnNuQlplbzVLUFFkakVt?=
 =?utf-8?B?WlQyN0M2SmQ2eDIydkpCUFc5YVNqazFtUSs1ZzhMUHdZMW9yYzViZ1UrcExY?=
 =?utf-8?B?NjFyaW5IWEp1eXBrUE51RWFQYS9kRXhRUk9hTzh3RmcxdG5EbWVzYTJ1eGRS?=
 =?utf-8?B?a3dpbTZhd1JFRDRFZ1VtR2tDc0EwQnQzbmVtZkxTbUJOUTdvWW9adCswOVlE?=
 =?utf-8?Q?GK71GPHWXQDDfPVKMX54zN0wBHScbvjYoAdvi7O?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3628807-fe6e-4044-11e6-08d967e85042
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 16:49:32.9344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkgWKOV0MFISnwuo8bcqvw+GNm1OUmp6rmyh+MdLNCSCnejxaBnW7Sg1LBwcFj1SPRC5Zf+l/l2ryd/is8cGlzOEgWU96swk/zrejymjYEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3861
X-OriginatorOrg: citrix.com

On 25/08/2021 16:02, Jan Beulich wrote:
> On 24.08.2021 23:11, Andrew Cooper wrote:
>> On 18/08/2021 13:44, Andrew Cooper wrote:
>>> On 18/08/2021 12:30, Marek Marczykowski-G=C3=B3recki wrote:
>>>> set_xcr0() and set_msr_xss() use cached value to avoid setting the
>>>> register to the same value over and over. But suspend/resume implicitl=
y
>>>> reset the registers and since percpu areas are not deallocated on
>>>> suspend anymore, the cache gets stale.
>>>> Reset the cache on resume, to ensure the next write will really hit th=
e
>>>> hardware. Choose value 0, as it will never be a legitimate write to
>>>> those registers - and so, will force write (and cache update).
>>>>
>>>> Note the cache is used io get_xcr0() and get_msr_xss() too, but:
>>>> - set_xcr0() is called few lines below in xstate_init(), so it will
>>>>   update the cache with appropriate value
>>>> - get_msr_xss() is not used anywhere - and thus not before any
>>>>   set_msr_xss() that will fill the cache
>>>>
>>>> Fixes: aca2a985a55a "xen: don't free percpu areas during suspend"
>>>> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethin=
gslab.com>
>>> I'd prefer to do this differently.=C2=A0 As I said in the thread, there=
 are
>>> other registers such as MSR_TSC_AUX which fall into the same category,
>>> and I'd like to make something which works systematically.
>> Ok - after some searching, I think we have problems with:
>>
>> cpu/common.c:47:DEFINE_PER_CPU(struct cpuidmasks, cpuidmasks);
> Don't we have a problem here even during initial boot? I can't see
> the per-CPU variable to get filled by what the registers hold.

No, I don't think so, but it is a roundabout route.

>  If
> the register started out non-zero (the default on AMD iirc, as it's
> not really masks there) but the first value to be written was zero,
> we'd skip the write.

There is cpuidmask_defaults which does get filled from the MSRs on boot.

AMD are real CPUID settings, while Intel is an and-mask.=C2=A0 i.e. they're
both non-zero (unless someone does something silly with the command line
arguments, and I don't expect Xen to be happy booting if the leaves all
read 0).

Each early_init_*() has an explicit ctxt_switch_levelling(NULL) call
which, given non-zero content in cpuidmask_defaults should latch each
one appropriately in the the per-cpu variable.

Thinking about it some more, we load cpuidmask_defaults in IDLE and HVM
context, while PV guests (even PV dom0) will have non-default
cpuidmask's, so with a PV dom0, things ought to correct themselves
fairly promptly after S3, but not as early as we expect.

>> cpu/common.c:120:static DEFINE_PER_CPU(uint64_t, msr_misc_features);
> Almost the same here - we only initialize the variable on the BSP
> afaics.

No - way way way worse, I think.

For all APs, we write 0 or MSR_MISC_FEATURES_CPUID_FAULTING into
MSR_INTEL_MISC_FEATURES_ENABLES, which amongst other things turns off
Fast String Enable.

I think it might be time to expand the "MSR consistency across the
system" logic from test-tsx to rather more MSRs..

>> msr.c:35:DEFINE_PER_CPU(uint32_t, tsc_aux);
> And again no boot time setup at all for this one as it looks. Not=20
> sure how likely it is for firmware or bootloaders to use this MSR
> (and then leave it non-zero).

Regular firmware I'd expect it to be 0.=C2=A0 Linuxboot, I'd expect whateve=
r
value Linux last left in there for userspace.

~Andrew


