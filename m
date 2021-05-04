Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D85FD372A01
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:23:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122245.230542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldu4u-0003ZU-Iy; Tue, 04 May 2021 12:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122245.230542; Tue, 04 May 2021 12:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldu4u-0003Z3-F0; Tue, 04 May 2021 12:23:04 +0000
Received: by outflank-mailman (input) for mailman id 122245;
 Tue, 04 May 2021 12:23:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldu4s-0003Yy-Q8
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:23:02 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6114fd68-ecda-4180-a314-1999fd255265;
 Tue, 04 May 2021 12:23:01 +0000 (UTC)
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
X-Inumbo-ID: 6114fd68-ecda-4180-a314-1999fd255265
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620130981;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9xtblkDgLvYducoKyVExRfpS8OwrmDeEK0SdwZ/nGm8=;
  b=YotQ4jrZM5Z2oc0TZvhp+AiWPHAxalrNXbhSXI25eHzuSf0EOFOcbPJN
   G1yEZuWu9qpAiOp1bFkfVcYyLpq+0LfRNVrnUxglNJk1P1fGucuJwLRZ2
   wI3xu9pNqrQKnyjNHUyh7lKm9hn6Axic5jNyqLTa6dyYDTeph3aFSE/qy
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: m/21pzff3LChsq4P2PJIdFHelrqEGJGG1ocwZqdj/ldD+A3VwEWj4kiChTzGLyKzZcm0aVJga0
 H5JxILQGnAREzflmqTIS6m1/m2gs8/Fpbdyy7qJvj62aQ6J3KLAhBYtwFYwXNT1q01jH4UAvya
 x/CblzM9x2vew7sJYkrklWvl61ze8g7+FIWt43IkoW2U7hrUlVMAEGVv28EnxT97STbDpPl8yf
 cT7neZuyIRXYG2f0i2hKs18yy0qu7nMTi5b8W5d+D9XABQD8siDleSOlDZipo2Aw3nzYC7FWCB
 cWI=
X-SBRS: 5.1
X-MesageID: 42824116
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QYBxKa0KXlVq5CrMqDxscQqjBWhyeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035hz/IUXIPOeTBDr0VHYSb1KwKnD53nbGyP4/vNAzq
 sIScJDIfD5EFQSt6nHySaiFdJI+re62YSJocub8Ht3VwFtbMhbnmVEIyKWCFd/SgUDJbdRLv
 qhz/FKrTahZngbB/7TbhU4dtPOusHRk9beaQMGbiRN1CC1kTiq5LTmeiLovSs2bjUn+9Yf2F
 mAqSPVzOGJs/a3yhjTvlWjlah+qZ/a5fZoQOCJgsgRAD3whgivf5QJYcz+gBkF5NuBxXxvvN
 7QowoxH8kb0QKsQkiF5SHD9iOl8DEy52TswVWV6EGT3vDRdXYBJOdqwad6GyGpj3YIjZVH/4
 9gm1+9jd5xCyjNmSzsjuK4Ly1Cpw6PjlcJ1dIIg2c3a/p4VJZh6bYx0WlyC5k6ECfz+OkcYZ
 JTJfCZ3vpQfF+ABkqp2FVH8ZipVnQ3KB+MXlIPjMyTyyRXh3B01SIjtbUioks=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="42824116"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ey5WQvElTLwxfzirp71Lm/+uO0yMPHFJZX9oNvi8AbrDmwBcd7+dvg+djSbKmyPoLIergF0RCh6hofn2y/1bz+WZf/NfMuvK9xkJe29UqhikweXpQD49TB2QAtMCNQC8LAX4ohzAKdzsCzguzrGQNI4a2AX5gh+6zyP3FyD22ScPj0uCT5L1BfJjbcXDWY5TGed7iLQwkupUaghduWWpmTfocgdBFvRftfHZ/c5L1U0AmHKQlfHauJCHuY8vhPmtVxbyL58NGqL3ugHDZm27s9vq50z9dP2SY/b3PAK9158lyKhO+zwnRxXc3zxrFoRsPX0DQNhLhHEhkWFyFl5jkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7REod0m7+vTu2xuv4UEbFuo5xAcchj2VKo+YFBu1Ml8=;
 b=U8XG3rYC2Uly3jIBYooQ1A6cpnB/4inGrZ37ADTAzjZfUdzjFLUB8tGXKXXDJi1zDe897bT1Iu0m/7aDzw63LH6ZkyvBgjaA2qJDhfcZQ5BxERWarBUCAvhS9OAaiUUm5Oor3vd3BOMMSJMxOmqOcf/ezq4smQNIXkRj8eX9PBp2/jZ7135K6GjKkbccjHSFf31LI3zJE1yLQboXyISc22f4rnsoHy2gjSI5pxHuattI9k0VGPMgfwfXd46AuzUzcgx6ky7ZFeH0Ap+rjdn9mgOLSRTHvLTYGhPyMkZtoGB4uHCt6Xt/bEteRI7z1bO4KT/TRDvHtuQbhpNIgn5EfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7REod0m7+vTu2xuv4UEbFuo5xAcchj2VKo+YFBu1Ml8=;
 b=J+pd9ztl1i9dT6vD7eWU3+eoueWZIv8oZnwZOeyos0PpoGYcqfE4F8V52Dk4O5uTDTjKWk7heBmiNY2OhemCg3iRRvNwyo7FnlyLx2ATDxdf6dD4wh13Ak2a9ViUHSJVR+GIDfborBhJC72JWvuTLmiFRtRVa8sp3xgjhHNxf8M=
Subject: Re: [PATCH 3/5] x86/xstate: Rework xstate_ctxt_size() as
 xstate_uncompressed_size()
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-4-andrew.cooper3@citrix.com>
 <4deac8bb-3252-36e0-b728-b78c2132984b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0015b645-3e76-8a03-4a5f-b81edff43623@citrix.com>
Date: Tue, 4 May 2021 13:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <4deac8bb-3252-36e0-b728-b78c2132984b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0234.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6138f3c2-31c6-4a30-26be-08d90ef75a10
X-MS-TrafficTypeDiagnostic: BYAPR03MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4552FB2C7796F19A5810E251BA5A9@BYAPR03MB4552.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /meDXzhl3zkMIxcy0n5J5eGHd8fQJglZ4nbhPzNNGYnEykD9VA+hJRfIYhZJ4HCeHxwo0OEvmmWu7hl3OQxiv1wWUU2VsCoptlDMsFr/ouz95Zw6uila6yaVRyPltDhKSqBYRmrKQzhGagF3HnU3NTRUvWPOQ4vprUyMlZjPvSoX2s3Q1zvV4DJQCAzvdNFqc1jmwNPihNkCc7oHtR2nLboyvJCCaIC0iLApEFV5CeQP7AbD33CyS2bR0Bn4qo0nZMbrzRjheUzBi04EyjWdGTb0x8gorBpgi7TK80O9+Qksa5hgIESAUqJBS/YCLSMVZS+y18vuZKf8paqzK2S5INaGqKS/sm/+ELNgUUtWMhttRQbbLdSjiZ3VJxCa0Kr8XWwGm1IQ/LW6WPa4/DpHE+EkifKWpDtepTCqFKuySYP+gAR7dpw2Lt85ZVuUEsBvUiNQj9PZFOGqr7dhigiEF75ZtpgN/jndEVJ3Oic64P5zmSs/r4Uon8r1Q4sULT/kr7+kfMGvVsA7NRTmgN8c+tOh1gb7SQ9cs6tpelIYzy5i382N9+V2sDMBUQntaVflnjXOLTvGXWXUgouIk81SmVRJZzPlFpFNBHboLv9uAstgAH9riKibnMBLLRVM9sna0LPop6uARui6Vkxod40aB2hAHL8iBiBUWtYM3S/TpbPfsZIGIk3xCFtTKUChA7Ts
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(186003)(26005)(316002)(16526019)(8676002)(6916009)(53546011)(54906003)(66556008)(6666004)(66476007)(31686004)(8936002)(66946007)(38100700002)(5660300002)(16576012)(956004)(2616005)(4326008)(478600001)(4744005)(2906002)(83380400001)(36756003)(31696002)(86362001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QTM4N2IyV041ZWlZVFljRmxITUJnVXFqcEdqcXc3S3ljTkZzRko3UXhzSCt0?=
 =?utf-8?B?YzF5MzVUaDIrSHZYUEpRalpUb1FaNkpKL0diSjVSU25MQVdLVHNGYkY2VkEv?=
 =?utf-8?B?WUxYT2pyNkxJWjRhYVRRdjArUmZUZGttM3NTRFZOdEVhVEhZVkZwdE9yWFcv?=
 =?utf-8?B?WmdYcSsxaUNqcy9Eak5JWXpMVjlraGRqdXFWdmtCMld6WHJFbUVMakRFdStD?=
 =?utf-8?B?MGhoVzlMRzFnS2UyS2RZejFkb3hsVi9waHE5TnZXVHRoQ010QXc3MU9vM0tQ?=
 =?utf-8?B?bVdxcE0vS0I2U1E4dTg0dElUeWlJK2F4RkRwOUlyTzBBaDdxRzdpYkZNVnJl?=
 =?utf-8?B?UDAydHkvMGRZYS9Kb080Mkd5bU1CMEZkWjJFK3F2Yzk2eUw1SHlPaXpWL2Zw?=
 =?utf-8?B?N0lsUzRSSEQ1TmZTcVBsNEE4NkhpbjZ3ZWtQOWNKMWJKeVRoZXh3SFJRYy9Z?=
 =?utf-8?B?RFllMHVNTlJ1NGhacmsvUmQ5Z2ltRFBrUmVSdWlRaUQyc20yWXdwanV1c0h6?=
 =?utf-8?B?L2NHRGVxb1AzT2syZ1VZNGVTa3g4ZXlHNXhpOEs3QjlaOFR4dHlrUmpPQzYy?=
 =?utf-8?B?WUR1dW5BWlNzekpvK2N6NU5NSXBGak1wSUVSdjBFb1RwVlJIQ014SUhYQnhj?=
 =?utf-8?B?am9uSEppRmdWWFF5ZDU5S0c1T2Fod1RIT0lZeHdYQjZtd1NzSjZqc2Q1cFJa?=
 =?utf-8?B?U3RRRm85SHhydGFRQXdUK3JlcGx4V0FtRytWZnBVZTJ4d2JNbEhVdWFSUy90?=
 =?utf-8?B?bVVhMzNWZDh4NXE5bzFZd0REMm43VHVDaUtEOHRtMjAxc3NuN1ZvVjFYK09a?=
 =?utf-8?B?UXRxN0NmbWJlK2tiOHFWRnlKUUZzbEZ5YW13cy9RVzlDTnRMWTQzWDVLS095?=
 =?utf-8?B?UTlUd2NIbk1qME5jdTBORkd0M3VHRHIwSDRxZXZhMXN4SVNtd1RIYlVIZVls?=
 =?utf-8?B?Yk5DYmxVcjUycHFadC93aTZzalZtK3oxUzF2Szk5QU9DUzRNNGJrcE9TS1Iw?=
 =?utf-8?B?VkQrTWFwWFJkYXR2T3ArRlQ5c2RMQTdKTmZWTlpTbCtGcjRKcVZCOExhZ2Y2?=
 =?utf-8?B?R2NRWnpSWDNDRW5KTm1nTnpuWHlmdXF3NFp5MHBtRjJDczlKWFhFbm4zWTVW?=
 =?utf-8?B?aUUxNkZGanRVbHRJeTBUYWI4NzgwRVNlSkN2V280S2NObEhMU0FaR2xMMTMz?=
 =?utf-8?B?bWwyc1ZwK2o5UzA1VlByOGpYUmdkTmRFSldJdTBmUXpCd1BIdWFXOWY1NHR2?=
 =?utf-8?B?ODNOOTY0NXVXcGJXMGNFU2dtQUdJckVqK1d1Vk9TYnFabzE1TElTM09jSXpG?=
 =?utf-8?B?YzZOYlI2MTZNb0czTHQxQ1ozK3JLa2djdHdkR2pYRldBTDJ5WGVlenNuakpz?=
 =?utf-8?B?K01mMEo0Rkg3VW4zdzFMMm5vK3NNS2dIMlA4VVRzRklTbEIxZU1vN0FnUW1S?=
 =?utf-8?B?djA2L28wdVhWN3h4OElzSENDYXQ0aGx6Y1pmSngzeWtKUmZiWFBQSDFMb25r?=
 =?utf-8?B?ZlluYkMzQzRjU2RIT0VFOFFxNWx3bXBQbFhnWVNpbEg2QytwSjl3Mlp5RHFv?=
 =?utf-8?B?anR4OWpsQnMrV2tCbWljdmhYUm5HZXRObjFmRFFybWJqUVpUYnJ1R1c2YnBT?=
 =?utf-8?B?ZEU5aHBRTFhFa2VvTHpXTXpTTUNaOHZQU0owaEczOC93NXBmNkxXc1hhOWh2?=
 =?utf-8?B?VjNFb3NaazhtT3NMMUNxWlJ2Z2ZnZG5pSlI2ajJ5RHlGZEtkZmpWTGhZN3pr?=
 =?utf-8?Q?Q3B9sbAG7CJFqSBfx9u1iQXlT2j/Hsw1HWinHlO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6138f3c2-31c6-4a30-26be-08d90ef75a10
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 12:22:58.1374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3mJ47ajHDB1QQucKj4LxXL03yIXIMD3wqG+ar9/niSBBBtEoXIuKsBopRxkrsARoMPwbISBV/HFHWKZKpRDAE6dUikTeKCo9GVd6AswUZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4552
X-OriginatorOrg: citrix.com

On 04/05/2021 13:20, Jan Beulich wrote:
> On 03.05.2021 17:39, Andrew Cooper wrote:
>> @@ -568,16 +568,38 @@ static unsigned int hw_uncompressed_size(uint64_t xcr0)
>>      return size;
>>  }
>>  
>> -/* Fastpath for common xstate size requests, avoiding reloads of xcr0. */
>> -unsigned int xstate_ctxt_size(u64 xcr0)
>> +unsigned int xstate_uncompressed_size(uint64_t xcr0)
> Since you rewrite the function anyway, and since taking into account
> the XSS-controlled features here is going to be necessary as well
> (even if just down the road, but that's what your ultimate goal is
> from all I can tell), how about renaming the parameter to "xstates"
> or "states" at the same time?

I'm working on some cleanup of terminology, which I haven't posted yet.

For this one, I'm not sure.  For uncompressed size, we genuinely mean
user states only.  When there's a suitable constant to use, this will
gain an assertion.

~Andrew

