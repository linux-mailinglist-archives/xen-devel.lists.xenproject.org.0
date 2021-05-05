Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC89373BAF
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 14:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123108.232222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGxC-0006Tj-5n; Wed, 05 May 2021 12:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123108.232222; Wed, 05 May 2021 12:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGxC-0006RM-2r; Wed, 05 May 2021 12:48:38 +0000
Received: by outflank-mailman (input) for mailman id 123108;
 Wed, 05 May 2021 12:48:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yav=KA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1leGxB-0006RG-1r
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 12:48:37 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e24f13bd-3293-45b7-be89-05d61d0f1ec5;
 Wed, 05 May 2021 12:48:35 +0000 (UTC)
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
X-Inumbo-ID: e24f13bd-3293-45b7-be89-05d61d0f1ec5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620218915;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uRfkGFXvA/niCniY+UP1shJd0l1okzMlrQBGV5Yheyk=;
  b=JFMgKYbGiZ9w//6fdIyFieGiu9i+oGJ4U3tI3J2gCrPB/dvcr4IcQUmG
   uyz5EG2J6SdsHL3DL24onZKjYe6aN2RB+v/5gs5Wiho0oRnLcDw0cdFpj
   ODcow4J2jLV6uRoDNNw/8+XFGueMoYmmlnbrFt5O9ivxNRXKb8kagzPTn
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Z9ygEBp4flUhp/PoZOetOKPAwIRDwpSFB3P5f9krA4fwvrv4LA23BZC8aV0HGxYtpcNeJPMOGD
 /ceYYbNtAcWSw1R09+1l06lrSbf/yDOgzuTn6tE6hkJ1a3YlFhT2d5D8EIHD+8uHGnzbalCuSG
 caIhuEckjrzyv9xzmvEOsno3jRwHhqNus9OkVM3W/3+FX2+VYHD+7jb4BjW3MJUL/GflWDvukO
 DuH89nyOhNZCWfcf+zkU/8iNLZksBiHaovgTlsroVLNR05GjfMHsEPP/lYDJtFUfWqhUoh511Z
 pHA=
X-SBRS: 5.1
X-MesageID: 44630970
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:b52ZXKp4K/VZ7T4snOPqkhYaV5v5L9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LR+iLNwAZ6JWg76tGy0aLxz9IeK+UyFJwTS1M54kZ
 1hfa93FcHqATFB5/rSzQGkH78br+Wv37uvgY7loUtFaSFPR+Ve4xxiCgCde3cGITVuIZYiDp
 KT6o5milObCBcqR/+2DHUEQOTPzuej/P7bSCULGgI97022hS6ogYSQLzGjwhwcXzlTqI1Sk1
 TtrgqR3MSemsD+8DDw/Sv575NamNzuo+EzefCku4wuBRjHziqtbIRlcbWesD4yu/HH0idXrP
 D85y0OEu42x3TNfnykgRaF4Xie7B8er0XM5HXdoXz/rdf3TDg3YvAx+75xQ1/ixGcL+PRfuZ
 g7uF6xht5sIj7r2BnZ3ZzuUSpnk0KlyEBS6tI7vjhkfqY1LINKoZd3xjIyLL4wWBjUxaoAC+
 dUAMTV9J9tACmnRkGchGVpzdC2N05DZyuucwwHssyR5TBcgGp0+Use3NAehXcN7vsGOuF529
 g=
X-IronPort-AV: E=Sophos;i="5.82,274,1613451600"; 
   d="scan'208";a="44630970"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGosTBbUazwChBWkWRQwmEIIG2XbvE5u/jdlzEulTuHFAYbqm1GQR+87suKbvBZeF6uYa2wwTu4grQpmd1nWT7yqd69wzbn+LGD008y7OgnQ12wnZalGSkMBRG4HDdC7QqKBl/DkSWNgG/2/7wmOMI21FoL5KteoaqK/NN/4wqgdkzYWJ8l+8XomVZAcfZQufcpucrF7NTnUZXIfJUIBuflRMSLVpHXE+jqB9BbpHC63XDESDu3zQ3k3qNXTYlyqdwC/8SUp7MXnHODGGjTkPO6MjUoHxzoQz9XU+0nDW2ery0K/h4v3QTLznQchs+F9Y95InMwTf5hsibC9AHhDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ub4M/GWmyHWtkeJT2tdNFtjKNc4K3WCG6uiAH6ukya8=;
 b=VURdLGdke9j39ashAI/3tZTSBxHSn+ULVuW2Cqbs/pKg3eTo0WGbdiDYrFtzLizLayn9Fl6On4zvq3Bjgq81hG5/HS2kjG2FN6fLdfwHkeJYD8fmwuEEFOJiJyPZV4mPitxMCiVX9jMvlKlTLLzpLCwmDTZBsOdp7/BY2YCLT5pkyGq7qQGA92/YcePQLPs73rD167PWi8D9r829RO2QXw3FeAUv6e1p3b8jk4YxywAWgYNSmoDAZrJU4vDbnFeKnFeOBdm26Yw/Ji0n2yAWeyUyqUnwKNH8h6njO5g37mYrp/2aOLKHqNDKKWayEXIKcpvoUTCl9+130Y2Dpfo+WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ub4M/GWmyHWtkeJT2tdNFtjKNc4K3WCG6uiAH6ukya8=;
 b=BfzYRIhE03DPBQU+jycr1bjJ218/gCSNxKk48hz1B7CJmTLjs8TUM2ZIvWnrhOBFsKCgIW/HoRu2yL96Y6IkK5hMct+VwO75RT6HLWjdTPVIRVd40Xb5Pgi2Z4UE0zDeZzCoCLCapqUOWGqu/XpUjO/9lCQFzWgTgfbaYL+SJew=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20210504185322.19306-1-andrew.cooper3@citrix.com>
 <YJJiWLqGoHLSnj01@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libs/guest: Don't hide the indirection on xc_cpu_policy_t
Message-ID: <deb19b01-aa07-6faf-42c8-67fe372ede64@citrix.com>
Date: Wed, 5 May 2021 13:48:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YJJiWLqGoHLSnj01@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0270.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05700939-50cf-4fc9-02f2-08d90fc416ec
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5664:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5664637D7684FC93FB1BD451BA599@SJ0PR03MB5664.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XIlR5qmxTx4KwPrmDysTT1ZEUhJki0wOIFDZw27Tq89zno/b+F9v1iHIWKkTvVR3Tpes4nj83/zOtwTuGn4txktZwm17m1mGFz1QUugey8Tu7wZlhP+lz9DPghGz+8Zr++wZ725iXCHfiOstS/cjOEOOcoxHGiazhJ2sBt92G2xjSHkfk/V3ay43ra9rKIMCUAH0ThvaSkOouG8wha7FZfzDPjM0CZ5J5IFRjrHwFYYpYUh/VerkQE7uJ1iqubQ8gL8t/pxwpSzAciWagIHeTczjjLfrPbNSKrQ3SKu5S3rc5V5W5w2HznAi6xO4XmGRtnScDfzVoVS9Yi+45auz59gtC4YPlznm2K70TxOr+M9Ve1MYWp1N66vK7XYOnBlf/3mQZLpEUJujiUcOhyM0Pw65BD5Bhb1aADMW9/qp9uC+wHyk8zGf15C7Ob636aTW8myzSQYx12+iGCc5cUaAaqLSFhIm7mBbE5+OEYoCDrZ1Ybe61GfN3JP83zmRcv/504JM0umHB0wjKZWGw17/6OsXOJ/ra4G0QsMiaOX4uH66vgES0cRWsDP/55gNxd8zqgOUEuoT23wI831zDlTNqscy0qUrl7x/uDEEKAogDHXCdbVapYu6wEFxuUhrnQVHr+wzvUoJ/xKExGtJm+G+ShU+qYjgbgASomD6rdVDgIsTnPK5Hr+U4zonFGS1rKVF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(956004)(6636002)(2616005)(66556008)(54906003)(36756003)(26005)(4326008)(37006003)(31686004)(478600001)(316002)(66946007)(16576012)(66476007)(5660300002)(2906002)(6862004)(16526019)(53546011)(186003)(31696002)(6486002)(6666004)(38100700002)(8936002)(8676002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L0U3NW5QdURFVDNLZXRJazd2YU9RdXRLZ0NMSHFKblNFekZGekMvREJNY0R2?=
 =?utf-8?B?THpwWG0ySkZ4L1k3THVjS1h0eE5ad3dhY0RWb1dKMVB2TVZIeGZMTDhFbHpG?=
 =?utf-8?B?bHhYU0x3cCtCM2k3YWRETmxjNnFRTzcvWDFucW5xQ1dERkk4MnJWOUZzMUla?=
 =?utf-8?B?Z0F2OXA3WE9iQXBnV1BRY0xWemRzNHcyZUZiMnFUUitVUitsM2NOWUFBb1R3?=
 =?utf-8?B?dXJ5ZUt3eXNEbGdVQldrVHZ0aTc1SGRsRExFS0ZKWkhWRGNYc3o4OGEyWWc3?=
 =?utf-8?B?WExPL2x0UXc2VS9yeUJUZDkyZ0Z3Z0dJNVh2Yk56RFRqdjQyNkI2N2ZuSGNz?=
 =?utf-8?B?b2crRWtIYmR5RFlIdXdkQXVyV2o0ejAvNnNNOExTbnhJMXQwaG5TVTZuV3hO?=
 =?utf-8?B?VTF5YkFnWVpqTDdGYytIN0djUHpucVhzNE0rV25qQmw2S2pXRndkOWZWNW1D?=
 =?utf-8?B?WVE3R1lZci9LbDRvdVBFTkk4Sm9QOUtjeVZweU54Z1Bva0RDWStpNVhPUGVL?=
 =?utf-8?B?cVVJYUFlam95NWdKRndCQWJkc3M4WlVyN2J5b2xLUkVNSE8vT3Q0U0p1QlJZ?=
 =?utf-8?B?VXcyQ3M4UEpjelpSNzlxMHRpSUR4T25Oem81OVZQazhlVW1wLzFjMEZPRE9x?=
 =?utf-8?B?bEozZGcyamdXdW55NWhKZTNjWUV4NXc4UkpiWmFEWUZTcmppUUJ6TDQ3OHpE?=
 =?utf-8?B?Nmo4cVhJRDRka2Nlck8yYlM0UVQ0eFZBeUdvREh2UzEvVkxVTTFCbE0rZkcx?=
 =?utf-8?B?eFJFdkUyMHNvS3hnZHpBSjZ0aXF1RUFCZ2o5K3hRZUp1MGRpZ3dsajNWbXIr?=
 =?utf-8?B?LzRLZUo1Y1o5YjgvNDV1S2hlYnVjTUNEam9ucmoxeURTZlBEWnFCeFBJOUxa?=
 =?utf-8?B?OFhyWHZEazlQMmQ4bTVLb1ZFREl0dzVmanduNzJpY05ZRjlKWXNBS0tOVFVF?=
 =?utf-8?B?SnBsNm9ibVdyanhObFJOb0ZiblBIcEJnbXZIdDJxZGh0VFk5WEdBYXlKZG9G?=
 =?utf-8?B?MVI3ejZvZEM0UTNwdHU5aHAxY2U0OFQxV2ozTStRWG5IVTYySkw0MHlkMExR?=
 =?utf-8?B?clhjTGozZzByb2kyemJxTHdobmRNS3l0T2p1TElPU2JVQWd6Wk9pajhOTDR6?=
 =?utf-8?B?TTN4UFZWK2M5VFVBMUR2WXVhdERzK2JxYXhxRFpVN2xjdmRBazg2MVFSUFZl?=
 =?utf-8?B?amZYMENvcDk5ekhlWmJNaHYxdU8xZ3RhTU8xcTRudGZsT3VLWjh5RzFkOWVi?=
 =?utf-8?B?M3ZjL081WDdWMnN5Z0lSZmtqV1A1Tjc5YVNFd05pRExObGt4cm9USzdwQkhG?=
 =?utf-8?B?RGNYd25mSE44RjFRdk5nN3U0d3V2Q2hGRkcrYU96VEUxb3h3RC9rRTFreGJE?=
 =?utf-8?B?cWt4M1N0TytQcjJvb25WL0FKdno3OFhsSkRrYkRsbUY3UGNQUHdpNEpwb3Jh?=
 =?utf-8?B?WGRhTEhoZ2FWdElhL1I3NzFXQlFxNXkwMW05MUQwTlpacW9OUDlpY3hRa3hI?=
 =?utf-8?B?YXQzY3ZxR3UrUVhHSmowTlJZTVVzUWx6SjV5QVFTM0VzZVh2U3V0VzRld1E3?=
 =?utf-8?B?UVh6cnV2RVJ0L2RmTTlYRFVycjcxNzJnbUVVUFFxWTVsaHFiZmF0c0cweHVU?=
 =?utf-8?B?NHhyS3dXdzZ3SlA2SFNORkxub0xCRjl3TjJaWW1USm9TV2VrdFkydmM2VFlj?=
 =?utf-8?B?U09lY3ZpTElza1krc2xOME9tNXdjN1BPOHZiemk0YkVUM0x6QlM5d2t1WjJ1?=
 =?utf-8?Q?t74ZmeaalU0+F3Ihs5WFcMFgOa2kxzbQPNxgjdz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05700939-50cf-4fc9-02f2-08d90fc416ec
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 12:48:32.3827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzU4VP/DSTLQc8IztBH8aMJviFEmSRCzqZ/BVtdEaCyMl9wqfVu7bDR5gOVmEJnfWYtvsQviSzMJ8d+z8tR64X4uwIH2R/kU/e4qwKFsGA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5664
X-OriginatorOrg: citrix.com

On 05/05/2021 10:16, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 04, 2021 at 07:53:22PM +0100, Andrew Cooper wrote:
>> It is bad form in C, perhaps best demonstrated by trying to read
>> xc_cpu_policy_destroy(), and causes const qualification to have
>> less-than-obvious behaviour (the hidden pointer becomes const, not the t=
hing
>> it points at).
> Would this also affect cpuid_leaf_buffer_t and msr_entry_buffer_t
> which hide an array behind a typedef?

They're a total pain because in userspace, they're plain arrays, and in
Xen, they're GUEST_HANDLE's.

Hiding arrays in a typedef like that (unlike hiding pointers) doesn't
change the interaction with const.

So the code there is correct AFAICT, even if it doesn't appear so.

>> xc_cpu_policy_set_domain() needs to drop its (now normal) const qualific=
ation,
>> as the policy object is modified by the serialisation operation.
>>
>> This also shows up a problem with the x86_cpu_policies_are_compatible(),=
 where
>> the intermediate pointers are non-const.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> Discovered while trying to start the integration into XenServer.  This w=
ants
>> fixing ASAP, before futher uses get added.
>>
>> Unsure what to do about x86_cpu_policies_are_compatible().  It would be =
nice
>> to have xc_cpu_policy_is_compatible() sensibly const'd, but maybe that m=
eans
>> we need a struct const_cpu_policy and that smells like it is spiralling =
out of
>> control.
> Not sure TBH, I cannot think of any alternative right now, but
> introducing a const_cpu_policy feels kind of code duplication.

At least this is all internals.=C2=A0 We've got time and flexibility to
experiment.

~Andrew


