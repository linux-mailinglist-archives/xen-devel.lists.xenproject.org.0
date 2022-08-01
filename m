Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D855866B3
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 11:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378604.611877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIROB-0005iv-NJ; Mon, 01 Aug 2022 09:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378604.611877; Mon, 01 Aug 2022 09:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIROB-0005gV-KF; Mon, 01 Aug 2022 09:07:03 +0000
Received: by outflank-mailman (input) for mailman id 378604;
 Mon, 01 Aug 2022 09:07:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oIROB-0005gP-2I
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 09:07:03 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00054.outbound.protection.outlook.com [40.107.0.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e00245c-1179-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 11:07:01 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Mon, 1 Aug
 2022 09:07:00 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::f1f6:f171:49e9:b68a%4]) with mapi id 15.20.5482.014; Mon, 1 Aug 2022
 09:07:00 +0000
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
X-Inumbo-ID: 4e00245c-1179-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+CUIazvkX34zkqW4ginLi3zasXsn4KtefG7cWu/Cjt0fwtasKLjTgZ2JJIgF8EI7gwSyEaC4vM9nMEuvKVGRXoZYdRHNulqb8vRaXT9CowQ1FKDf78S5zFcDz0osnsBu3SgXntVuim8csYVWSsArkIZuRx2XVsFy9HB6s0VrZB6V6KwKqeFT3EwHy5Ly1h+dVGIAR6fIg6Zuj70hk4ZUGfP8oq7hvwW3ni1VC8cxqoxRZHYiBnTcdk6YN1+6LoisJ7kNJl1EDWEt3WJd7S5nKZkC7djbk5ZcqZ32Kz24+r3HMcMppfeGhMyup6JEm8gNWYk+JAS1it4tagzKJIqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7w+BobUZhLOb9LJWRhNH3RkNNVbl6lqgpwIPyYK4jI=;
 b=UXk/5p7nTbiNoDQ2oFYHoWc02jolw8D/fwyXzVpEQos/1PgZjNbT4Fgp3ttk5gGwTpP/4MzONsG7XhNCouk7kZreaxamPu+g4/SefcYYHvbGIKn2Wg/MqbvUDM10w0kyRtqF1HoFQ6cOIQ1CyveAiaRIKfL0020eDz0YwEsZtbUPKlTxLlzZhynKInTQPJyQTgtAQBN3fYOzogCYsG/6dft8AtOVMQCfefwlqgxfE9KUHbXLnOBbtW9uVlIr/QH3IpKdKiw5pp1WigKNBmstRw7HLOEzGL6ImY/apLfeX68PW5qOOXHhD1Svx2gaHU7tBdo/+VOLT65bRwv54zQU/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7w+BobUZhLOb9LJWRhNH3RkNNVbl6lqgpwIPyYK4jI=;
 b=eDUecLdh39pRbXORq0fsIJQc3Lgji9sH21GGJUM1kDMfNg+THsKZyaAnZv5bpzbwuOZ7/504bWwQ29+ij6eIx6RemQ9Y434pltXDu6Ru3to4qOswJHTXpJRswLXwlCdnMD+4nkwiZ52DFVdLJcJTFC0OwLJOSjQSpKBcMqXXT7JPi7gmu4deMUKukCkAMbCuRULwAaM+KwXT7+IuHm27zribkYbQqMlqctvSChEc6m8xOrY9nDxUXcXb+BUQg4GK9WLMVIg/E+VL/qF3zdIt6eeZNT105KC2wRUwllDjp8Qd8yZcsYDi7xFwbIoeF4YkJnCxxg4XmJVMHc5zy/3sAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <230338bf-b709-f2dd-bc8f-80052e98233b@suse.com>
Date: Mon, 1 Aug 2022 11:06:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
 <08606914-f5f4-8415-51a2-f6a5e1c54d20@suse.com>
 <db39670c-7e36-2cf5-a87b-92d10d3aac18@xen.org>
 <7bcf8fac-df56-2032-0057-2b7c671e59be@suse.com>
 <16b1c490-1d8f-1c35-496a-a60fb1404fc3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <16b1c490-1d8f-1c35-496a-a60fb1404fc3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0009.eurprd05.prod.outlook.com
 (2603:10a6:203:91::19) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44a5bf9a-34cb-445c-de2c-08da739d3178
X-MS-TrafficTypeDiagnostic: AM9PR04MB8081:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l0li44vVnFpySkpPyTUZl0OwBBymmjO8ZlbRbs6NrAuaWjruyVosipyUZDeP7mfYOJ0vcFsVDPdTm/xLz6LYbX7WqE8q+kZ/AGx3HTuRSTlLNbo2KYJa9YNkGWs30q/uB2R8uh4GIpAJ4lMHomV8AY8cz6ns6ALAwvs50HjUlWKSUWpFh028B6XD7b1FnI1MwrPt5UOsqGRTMspBsomB5mPG74FYoyhFohVGgsrvnZ4NCWA48oqCD/2T8JxJDTenmMH+Ti+uAi7K6OkJBnqr7LgI9vUvSUDPYYyrw8+Uhhc3e8c9u6KTLB2LwAW6AXD0AKH07x7unfaf1qWXtSPHY5dDKuVE5HwM54HnmLA2zX/XYeFNfCV46C7Eb79lkG9IX5FYvgIMwKB6b615QD2pmQ0iLosEH+na0G8QB+elccjvlLaogAv7mlQPmDCwmJY4ezixKGbtwpSJwbmc0fot42xJyLOBbkIHxgc5f5UowfO4x+jaOIgXQQvlDO1MrR2NPVku8dxAxvM/j/g4cRoxnaLPXGOz/RWnNy3KPitwbYm1pLXQB7LPigqtFta5UJAS2U94xD9zlz5swtfrqz5mtF0Wry0bFUULC/wv8t0kPUne7u3djzmXHYBb4+LFqe/VvzK71gsc4BuO4d8iYx0HovTOfh+mjOwyyfzm7g+bgJOZemOlq5+PbDAhd3+QDbomM+5QXWaRKhbKSed6c1EcAmOY7UZmsLd8XmAHfhpxr6u6j895bMW9y3mp/Habv4hnfEm1eT5Fb1WVrSsgtqkXb8TB7kRawxnxTqj7gfmEOBW4MzekH2JIk5NkJn1shLol79yjuOLKGOYfgB2a1znu5GBJeD7i1s21ilBTRK8oPsbXTvAsNHQZ5/gwOjVjzLnjw5demdL25PExnjTy7UDqqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(39860400002)(346002)(136003)(396003)(6512007)(36756003)(966005)(478600001)(5660300002)(31686004)(2616005)(38100700002)(54906003)(6916009)(53546011)(41300700001)(26005)(6486002)(8676002)(66556008)(66476007)(4326008)(66946007)(8936002)(6506007)(2906002)(31696002)(83380400001)(86362001)(186003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTM3VXNlajZhOTRweXB3Ui93OXA4d2pudzUxcXo5THNaZ2tCOUd0Y1VsakdS?=
 =?utf-8?B?Sk1PY2N2eXZBMXU1cDU4UXJoOGxEQWI4QzRpK055eU5zVTdhNUVaczJFT3pD?=
 =?utf-8?B?dlZ3bzY0M0xmNTIvWDV0eExuTFlzb29XQ2JkNnR1RVl2OXpiNklybE1FMFAw?=
 =?utf-8?B?SjJ4ZnlyckQ3a2RUc0xxcFZ3QWhsUC80Qi91SlVLak90UmhqMW9GYkJBUFVn?=
 =?utf-8?B?cUxlTjBSdnQ0OXB1QURyZWFGRzJzVEE4UDBLVEpwNFRKMEZEY0JQZmRrcGh2?=
 =?utf-8?B?N2xkc20wQklQZ2pVUUVURGF3cWRsL21pa1NvSEZQRDRVd3JndmhYdytlV3l1?=
 =?utf-8?B?TFRZVkVla1FmTGh5OFR5OUdWYTFqS3VlbGs4cm1IL3ZTQzZubzE4SnRocm4x?=
 =?utf-8?B?RFhlREd5SHc4bGpqcnFDS0pnV05xNFE4SVJpZE9rcXpmUlMyTkNmUGRlR1dZ?=
 =?utf-8?B?bmY2NnlDeHVrdDlGczhZSmV5UHQrRmVOODNqUmc0NGs4ckNVUXRJRWZwcnNS?=
 =?utf-8?B?dWpZb3RTUDJ1K1JKeEVyVG9YdThVdnBLekpYZVR6WXNTZHNOelNlZzdVMnox?=
 =?utf-8?B?S0dQVWtrdHhydGxhSXFNUjZFRFgrZ3Q5Zks3WDNGcTBoUTB3NHorSUhoanl0?=
 =?utf-8?B?cGs1VGg1cHluZXkrNSt1WG5MZmI0UGNpSUsrZzNNa0xUbEo4QXVML1NETWhS?=
 =?utf-8?B?eHljMkNNaHBoRDlPbGtwY0JhdzRQL0VsUlg2a090WXZ0VXFPcTZDR21MeW5z?=
 =?utf-8?B?OEFhOWkvb0xnK1BrSFpIVlBWcGNWck5uVDdWSnh0ZXA4MDdyQ0ZreU5xVHhs?=
 =?utf-8?B?NGl3NkliYWZNODFNSDdsTlREYTVad2pBbmw4YzgwRjNxMXR6RW5wV0JET3Vy?=
 =?utf-8?B?d3VUNXhSUnRBdGN5SS9sNWMvK0lFeHpoaWN6S2k0eGdpOXBxNWxxYjBWQW1q?=
 =?utf-8?B?bVgzbStSckVucjBVWnVHMzlJZjFXVFdtQVF4Z1lWTlN5cEphdXdVUkZvMU1p?=
 =?utf-8?B?QS9Ed3dzY2lWUmRQR1BiOTAvdStRa2svYlJCWDRUeUxBRzNXZnEyT1VTWnVV?=
 =?utf-8?B?UVcxSHpWMVpNL1pFWGEvMTRjWlZJWnpPeEtJWXZTTG1mZUNsaDhvSktYWW5y?=
 =?utf-8?B?M244dGFTbGgrT3RvMDFmOGMvdENJMlo5RUJDQ0JJTzBxUnlVcEIzT0xJcU9B?=
 =?utf-8?B?WklrWGtROUEwQlY2aWg3WWh6V0I3MFRvNXFqWUw3Nk0ySTRqREFPU1ExU3pl?=
 =?utf-8?B?Z0J5Q2duMDZyV3VyWHRHcGFOR3F3SWRpbmkxNzdVY3hhUWxiSTZ6Q2RBSDF6?=
 =?utf-8?B?VzY5azZxWlJmeVljL3lWRHVNZFJncUFPN1FWTGdnZGc2b1g5dmhXVWsxSjhk?=
 =?utf-8?B?aHVRTHc2UHorUER0MGNzWFZMKyt5TXZoWEkxbFlybm15aHBJc0diTEFmYXdE?=
 =?utf-8?B?emh0TlMxUWN1NkwxVVBqQVpXeVZaVkVEaGUrK1lMY0YzVS9lcit0SjNCZzFz?=
 =?utf-8?B?MkFJVm1qRy8rRjVkR0JUdGZQNjliZnhsVitMRW9WU0RKWlRmUUtSTGxCNTJN?=
 =?utf-8?B?K3VoeXNVY1ZtUWtpejlrYmF3RlVGU3NZdlhEelhUUTVteC8rYmFad3ZFM1h1?=
 =?utf-8?B?Z2pFRDVsejg5YWtwV3RTcUZpTTZuWVB5ekRqdzVDTHhiQm4xdnVEUUFwTHpw?=
 =?utf-8?B?d2FZTDlVbnVuZWh1eEovRUtUOU1SSmMyaUMycnNERVk2eFFacVRUbVBkOStU?=
 =?utf-8?B?bzVXaDVPR0E0RUV1dUx1QUZCQTZLYjlESDNVRUxZdllYb1Q2RzFaRmhObGNL?=
 =?utf-8?B?M0toQUxndHlhNUovOW04YU04alUvdTkzeEE3L0Z2amtOTTI5M25ZV3NiaDZq?=
 =?utf-8?B?RWdSWnBQY0NDWEFJQTJkQ216bC9WTXUrZEk3NG1lTDVFWUZFUzJyZkFycmU3?=
 =?utf-8?B?Wm1RWjc0dys2eGp5dnVnS0hpVnh5OCsrZEptYjBQcUNXVWFtd1g3M1Y0NGVz?=
 =?utf-8?B?bk5xdXNtOGJsT3M4VE9vV2xMMWNKYmFWcWtrenFyMmc4NXVscUxJUjBlSjZw?=
 =?utf-8?B?N2ZST25lSGd4Q0kzZ0hwdEhMcUtPR0RvNUlzVzMrTXVlcGdEbGRvVWJMaS9Y?=
 =?utf-8?Q?BXmRTL7Lbdf0578tMh5owPZAg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a5bf9a-34cb-445c-de2c-08da739d3178
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 09:07:00.4504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ORGaDCl1tVgJi2hZaJen5VgME+d9/XbZbCKtxK1nIMCKDtFkrc1SGxswF251Qt1GGrQTlhUqwWyrhzYenUYxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081

On 01.08.2022 10:43, Julien Grall wrote:
> (+ Committers)
> 
> Hi Jan,
> 
> On 01/08/2022 09:36, Jan Beulich wrote:
>> On 29.07.2022 19:36, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 29/07/2022 07:22, Jan Beulich wrote:
>>>> On 29.07.2022 03:04, osstest service owner wrote:
>>>>> branch xen-unstable-smoke
>>>>> xenbranch xen-unstable-smoke
>>>>> job build-amd64-libvirt
>>>>> testid libvirt-build
>>>>>
>>>>> Tree: libvirt git://xenbits.xen.org/libvirt.git
>>>>> Tree: libvirt_keycodemapdb https://gitlab.com/keycodemap/keycodemapdb.git
>>>>> Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
>>>>> Tree: qemuu git://xenbits.xen.org/qemu-xen.git
>>>>> Tree: xen git://xenbits.xen.org/xen.git
>>>>>
>>>>> *** Found and reproduced problem changeset ***
>>>>>
>>>>>     Bug is in tree:  xen git://xenbits.xen.org/xen.git
>>>>>     Bug introduced:  66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>>>     Bug not present: f732240fd3bac25116151db5ddeb7203b62e85ce
>>>>>     Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/171909/
>>>>>
>>>>>
>>>>>     commit 66dd1c62b2a3c707bd5c55750d10a8223fbd577f
>>>>>     Author: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>     Date:   Fri Jul 15 22:20:24 2022 +0300
>>>>>     
>>>>>         libxl: Add support for Virtio disk configuration
>>>>
>>>> Just in case you didn't notice it: Something's wrong here. I didn't look
>>>> at the details at all. Please advise whether a fix will soon arrive or
>>>> whether we should revert for the time being.
>>>
>>> We had discussion on IRC about this today. This is an issue in libvirt
>>> rather than Xen. So I think a revert is not warrant here.
>>>
>>> Instead, it was suggested to force push because it is going to take some
>>> times to fix libvirt (see more below).
>>>
>>> Oleksandr already sent a patch to fix libvirt [1]. The problem is even
>>> if this is accepted, our testing branch for libvirt is 2 years behind
>>> because they switched to Meson and Osstest has not been adapted to the
>>> new build system.
>>>
>>> Anthony kindly offered to update Osstest.
>>>
>>> Regarding force pushing, I am waiting for the Osstest result to confirm
>>> that only the libvirt tests are failing in staging (we already have the
>>> results for smoke). So my plan is to force push on Monday.
>>>
>>> Please let me know on Monday morning if you have some concerns with this
>>> approach.
>>
>> Actually I do - if we force push, the libvirt failure will stick, and
>> hence potential further regressions introduced there would not be noticed.
> 
> Well... We haven't had any push in libvirt for the past 2 years. So to 
> me it shows that nobody really care about the testing done. Therefore, I 
> don't see the problem if we don't spot further regressions.

I don't understand, or maybe I did express myself ambiguously: I'm not
talking about libvirt regressions (in their code base), but about changes
in our code regressing libvirt.

> If we don't force push, we have two solutions:
>    1) Revert Oleksandr's series
>    2) Leave it until we have Osstest fixed *and* Oleksandr's patch 
> reached libvirt.
> 
> The former is not an option for me, because Oleksandr's series is not at 
> fault. So this leave us to 2).
> 
> So what's your proposal?

It's still 1), no matter that I agree that Oleksandr's series is not
directly at fault.

Jan

