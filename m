Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CA533D5FE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 15:44:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98329.186462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAvj-0001Tg-RY; Tue, 16 Mar 2021 14:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98329.186462; Tue, 16 Mar 2021 14:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAvj-0001TH-O7; Tue, 16 Mar 2021 14:44:19 +0000
Received: by outflank-mailman (input) for mailman id 98329;
 Tue, 16 Mar 2021 14:44:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kyr7=IO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lMAvh-0001TC-Ou
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 14:44:18 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7803fcb7-5b9b-40a9-a706-fadc4572ec0b;
 Tue, 16 Mar 2021 14:44:16 +0000 (UTC)
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
X-Inumbo-ID: 7803fcb7-5b9b-40a9-a706-fadc4572ec0b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615905856;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vq1kxDCErFH3ye2opvEmexZIwiPef/LOJbwpjbGKkD4=;
  b=IsaeW2F87+sNGldiK2+3rxGq8IPPWH0HLqJUiZDxK7H4hwg4gf53UVB0
   WyfLsL7CuyIH4KzCi2d4GCfNYRf7JoYFXWV7w+aAe6km2M5Ikb0LVAwVl
   Hhkq/JR54OP8YH0misfzP4kaXXorPMV+WiE4IKhXLsfpWNubWWaR1sSWk
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VM6CGPCsYCA3ByD412LBUHkRIwcgEDGq0dW2i5G6Q5p1QE87BCv5DX6ZE3vmWC39xLL4emk/Q4
 lBKT1PKibpXFPtNrKzEFmv8lHSPAIr8DDYKMJtPLjqdHua8a7LwBgLA5QMXIS2Qiyjn1DGPRmh
 W4duAoLFd7YlCN26kcqbiv3KXBss2cGOpKxvbwmkxSL3IyddJ9GbIVgkxMJ9PcN9vkWdzBs0/5
 dHg41zI4AWRRxZD91jRe+70t5WS9zQurG9yKmjyX0mCKTnC1Usv/r5TGK71wV7+9Opm1syqR/2
 R3g=
X-SBRS: 5.2
X-MesageID: 40819300
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wV8VD63j5FdizruToKyViQqjBDkkLtp033Aq2lEZdDV+dMuEm8
 ey2MkKzBOcskd0ZFgMkc2NUZPwI0/02oVy5eAqXIuKeCnDlC+WIJp57Y3kqgePJwTb+vRG3a
 ltN4hSYeeaMXFAgcz34Ba1Hr8bqbG62ZulnOLPi0pqJDsaCJ1I1RtzCQqQDyRNNWx7LKc5D5
 aV645moDetaB0sAviTO39tZYj+juyOvI76Z1o8CwQ/7g6VgXeT9KfiCBSDxH4lOQ9n8PMA8X
 XPkxG826Wosf2n6jK07QDuxqUTvNPgz9dZbfbgtvQo
X-IronPort-AV: E=Sophos;i="5.81,251,1610427600"; 
   d="scan'208";a="40819300"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkcjwPHUm5DSsIYvii5O9YAS7G/H7mfLtP33MNSEqwqJw/xhhq1Sj+Az4NbHl+6keEm5kxeciUPyg8MsXaA3n7EOWpEYIfTfIuvO8wDm8fNnv5MtjzokNxkkL+yuymQ3KqFAhUa3n9G6n1I1hpNm1FhhtligH59fH257/4FlGHl/6zc15t3m1GQEAK9Y98oiwDNZq5qbS34TsEvQwJ2dpVRmdAX5FPVLIf89zZivhjwd3ssQNr8WikIMTkKfP606yc8uqbpXEJzDaja4CUyjOlCim23vue5xKmSSJJpxm3Q8W5pG4ctxtJkcwVDV5W73riutAuagBkCINFbVabCyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vq1kxDCErFH3ye2opvEmexZIwiPef/LOJbwpjbGKkD4=;
 b=Fr/sSlQTvg3bCJ9jAlD4cR/y1OlvlmDqEzaFJoeAeRz/gYlUouU3Xc1fKFUSgKXcwNwIM4POflGXFK/c8XQBxuH4uGNYqrik/AsEGcX/qsJp6OaZvG/+QPohaus+9qsCANJuv/nKMkzkRnRU2FZLYtGoKf1jcGNhDtBdH7HBpBGekfRzjfdngEkLgdaTlEqiFa/HW5IopUo6fljGZwiPLFknK01Kw/FE/WuqYyQb8NLq8+Lbhbh59Z4xnWUCXZcLpxQDMdwpTEouALJ0737NBRe76Uqyxohpc2IoMQ+ALRf/I9qHsZ5pIL9TQy66dghntvdp7ZHYJdawaTFXU0FiMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vq1kxDCErFH3ye2opvEmexZIwiPef/LOJbwpjbGKkD4=;
 b=xVLG+AbOE5ESVOPStiocKguEJ23a0FnuqYc2zAsJZ2DJ6QEs+Gi8w/z6cs0JxL6sFhNXXxELpg+n5lcu7ouhMZvYiJr+ILg4N5yu6miqM+tLZWiYnoFFRy6LkvVENvsx7CHyLQJpHClhe0Lz/Njvl9eb2kO4nqYRG9LRACH1YMs=
Subject: Re: AMD Ryzen 4000 (Mobile) cpufreq issues
To: Jan Beulich <jbeulich@suse.com>, Dylanger Daly
	<dylangerdaly@protonmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <s6DNE-pStgBNMxxe8WkUZJbkqMyjdifBDHA_3gMGdC6oE1rweg8Au8ZPHaDFkvT0ETGykePtDj02LphVIWtdfyFQ9ZBFMjKJq6UNzY4BiAc=@protonmail.com>
 <bf29b7f0-d687-9f32-0a59-57562bf5261b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <16899023-31e7-44b1-a0e2-a40f7771c889@citrix.com>
Date: Tue, 16 Mar 2021 14:44:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <bf29b7f0-d687-9f32-0a59-57562bf5261b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0319.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::19) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dd6c643-edc3-42de-3f68-08d8e889f673
X-MS-TrafficTypeDiagnostic: BN9PR03MB6028:
X-Microsoft-Antispam-PRVS: <BN9PR03MB60288518CC8F9BE4745E90BBBA6B9@BN9PR03MB6028.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIat6vjzrAosqFNG7hcCTZoSvqEqFbRiXLKV3OIARASGDTTz+iqMInwDgEtylu2nmvWpd2ZtS2KahiNjsvo68EC7x1NEm0RQSCFN40vgidksfgcttIURaTvPI20HoVzpxrVENRE7bihFL0ShbMEi9Sj+q2VsTjXJANHV1AXgPTygT4UuuPq6Yq0jLGy0gCWXFaL/2CnnQ3RlztIG8TaQfLBp3X+W+1WGPeLsemZfo3ufE7vMCH/xGoDJCfbxqaA2e/R01EPX2qzRmHLgdtWiPnsU3221dTR/eI8zHzrhcGGMvUk8n4HxTfRZza9pBG0dPu+G86hzISZsFcPrX2YFBoS3rSUCpZ7b8efeZylrYMJiEGbYYKts1fChGZAudjr8lwt64gpqTJl1+vo1kRp6u4Tm/J7ILeo3hbm2n6OESNG+cCLgAYEdFvLCstFGuRI9WAWc3pGGxRU91RtCYq1PgmXbX3rFZHNtPUsMirxGxlHIYMNXLauTf5z0dblHyt7Uj/iWCCYZZvYDdfhLWYrEXhVp3AVras9a5dqxH/llZwurHjaX7quLuE3/VVtH+AppigJfDHi5SJPOad1l62JUjfiv5CkADg2HFizeaCiIhCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(956004)(36756003)(66946007)(53546011)(2616005)(8676002)(186003)(66476007)(110136005)(26005)(31686004)(31696002)(316002)(16576012)(86362001)(66556008)(6666004)(2906002)(8936002)(6486002)(5660300002)(478600001)(4744005)(4326008)(16526019)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WDZ3TTlUcm92YTBtRng3am00MnM5UG4vSlJDcEN2bDB5VHZXUGNZNUI0anRj?=
 =?utf-8?B?SHBDWkJRV3MvL0c2Rk0vT2tzK3I5NU9RQXFRdGNDTXB1cy95QkhwVkdzTGNk?=
 =?utf-8?B?R3FNQzUxRXk2N0tHWmo2N1l3akVUMmdhUmwzOHJtV0VtVnB6eG9aNFNtYWVl?=
 =?utf-8?B?MWE1aDBkU2dyN3p4TXVobm5ld2FtWEE3TW0wU3JQWnNyZnk1WnhZMjlmZldX?=
 =?utf-8?B?bUVKL25IeE9iaTZuT0xkU1plaWdQVDlLbHFRaHpEdkl1WUM1UXNaRXNRMUdC?=
 =?utf-8?B?YzNkb0wwaEdzVVd1Q1EwdkVRKzlYekdLQitZTlhTUytBZmxRcEtTTzVTSzJU?=
 =?utf-8?B?WGRUNStnK3VXaXd6WUkyOXl0M0hYZko0YUxmdzQvdHpONnM3OW5RNjhSR3hp?=
 =?utf-8?B?NXV5MksxRi92MFB5ektkVHY1QnUzVVZsSkEzUjg4blJ6WGNxSHJadXphckN6?=
 =?utf-8?B?cTdlbW05NEFHZDRnWDBSMTdTQlFrZ1JnTHo5RUY3dXFqTDk3eUdYME9mQ1FN?=
 =?utf-8?B?NjMvRUtBUVhMeFhGTTJQMEhLRzJ2L21ORlNIVnllMHNVNXVlaHhGZmhkK0lx?=
 =?utf-8?B?RTJPR3Yyc0tGM1JoaWc5TEtranYzUFEyalpFYS9tSlpqM1czK3JNK0haTkxw?=
 =?utf-8?B?N2xTcm04ZUtYMjVPMW1DODNuV1haQ00rS0pjMUhrWVhJdzhyemRNSTRnREFP?=
 =?utf-8?B?dmx2TEc5NGdRbStLaVowbGlKMEI0dytZMzZrOWhsV3FBUFRDc3dmb3dTdWZ0?=
 =?utf-8?B?dXlvdFNoTFl4NkJKZUxWMzNWZWgzN2xCWXdCcmY0NGVjazFOZEljUDhVZm1i?=
 =?utf-8?B?ZkdSdDZnajVoNlVSamQ4UU5CUDYzaGV0S0hSdWs5aHNuck04MHl0ZzMwOTB1?=
 =?utf-8?B?T0ZjTlJCR1hud21kRVBJMk1JSDJlbXlCYlVzRS83UUpBOXNHM3EzTmpNcSt0?=
 =?utf-8?B?cjIxNHp1SmFXcVhXcFdVOGtDeXFHSmZySUlaZ0xhWTkweTNYSXl5WVg5WXpo?=
 =?utf-8?B?SVllVGl5RzJLV2FmZ2hHMWs3REFMVUYreEV2YXJhcmNSTW9JM1AyRmswK2o4?=
 =?utf-8?B?eC9ReEdyU3MvMVhqK1JoMFR1MFJGNXRyRWorbHFXMlowb21ZWVN1SGtVUVNG?=
 =?utf-8?B?aWwxcGI1Y3E1SDNPTDJHNjhzRXZLeDhLb0J4Z3lvQ2FkaVlzeGNaakJJVWgz?=
 =?utf-8?B?YVpIN3BzK3hRTmdBcFlGVW1iS3U5VFpOUWRxMTl5UDlZNjZGWklHY2RXWTh0?=
 =?utf-8?B?RlZvWWUxUUUxZGZyNmJYK2d4dDRwTnZ1dWxuL2s4RnhQWTVRcFo2VmhBWUZm?=
 =?utf-8?B?djlUQnJHSkNPalNkQk5VMC9TWHZLVWY4aWdvWnhxM2grK3UwZmYyWkUzQlFR?=
 =?utf-8?B?NDcwdldNS2JLWVBBQUlvUEdmTGxWc3FFMFV0c2x0WjlFUjJSdlFkTkx4TG1L?=
 =?utf-8?B?TXg2b0RCWFJnaGJseUhXSmxvalNUcHpCUk5ya1VMUUFjYzRvTzFFbDBPbkRB?=
 =?utf-8?B?UldJNy9MbncxZmVSMlpJNlh6RVpPYmZMald1UXZsQmNiLy9vMVVSV3lmM3ZF?=
 =?utf-8?B?Z3lieDJJbmQ5dmRqOS90Sk5YbnJtZWlNblEwaHgzUDZCVkFUQmFIWE5RbFBS?=
 =?utf-8?B?KzFzYzFpRXlIZHdjS01wL3EveTVTU1hKQ3VxZXplaWVtNk15WGRRVUhtOERt?=
 =?utf-8?B?NzJaaC8rUEpHbkgyMWJGdTFsMVpUQ1JvaVJGRXJxaFV5MmdoaUo5ZDRHbHFM?=
 =?utf-8?Q?au2/dYmffX0QFkHVg5CMv0ZZPnwF85gN6sDUwC7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd6c643-edc3-42de-3f68-08d8e889f673
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 14:44:11.8505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TquZ269X92l1iUJQ4FrjEz+F9XskKvhL1GWb9SQlE43Bce6+TLX2wwf6MresMeYjQmUYiE6iH0lcnQgtUbfqlB7jLUJ8nJaa6ZzaBVp92c8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6028
X-OriginatorOrg: citrix.com

On 16/03/2021 14:30, Jan Beulich wrote:
> On 16.03.2021 04:02, Dylanger Daly wrote:
>> It appears AMD Ryzen 4000 based CPUs are not supported by `xenpm`, running `xenpm get-cpufreq-states` returns nothing and `get-cpufreq-para` returns `failed to get cpufreq parameter`
>>
>> This was somewhat expected as Ryzen 4000 series CPUs are quite new, so as a workaround I tried putting `cpufreq=dom0-kernel dom0_max_vcpus=8 dom0_vcpus_pin` onto CMDLINE, from what I've read this should essentially pass control for CPU frequency scaling down to dom0's kernel (5.11.4).
> Just fyi, seeing that you found a solution for your problem: I
> firmly believe "cpufreq=dom0-kernel" should never have been
> introduced. I'm not surprised at all if, as it looks, it stopped
> working at some point.

I agree that cpufreq=dom0-kernel can't reasonably work.

Lets just take it out - it doesn't serve any good tricking people into
thinking it might plausibly work.

~Andrew

