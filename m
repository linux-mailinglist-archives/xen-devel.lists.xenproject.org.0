Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAD73D95B8
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 21:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161781.296902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8onq-0007TJ-UG; Wed, 28 Jul 2021 19:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161781.296902; Wed, 28 Jul 2021 19:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8onq-0007QA-Qp; Wed, 28 Jul 2021 19:01:14 +0000
Received: by outflank-mailman (input) for mailman id 161781;
 Wed, 28 Jul 2021 19:01:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1ltT=MU=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m8ono-0007Q4-L1
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 19:01:12 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2aa60052-efd6-11eb-97e4-12813bfff9fa;
 Wed, 28 Jul 2021 19:01:10 +0000 (UTC)
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
X-Inumbo-ID: 2aa60052-efd6-11eb-97e4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627498870;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/aDyO0z9TsrqBwOMoovjkHxyClB+bWGt4GlD8AKwWPU=;
  b=dM3blbLaGoqlk/whDUaDXH9sLaXVHlp5XhtAntoMF/KjUnKs9sH1vPfQ
   D2MJbIBbiSk5+9o00woV/osz9+WpCi0IcH2u4NpJamqQvE7iKAw3B9GeH
   rK8hs9egk1UuPwTF9pouqsDVKvbLQpFbqVi5br2Va4AGkfJoaB27JEu0X
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: S7EeMT2aLjyxTlhq56JHsjVZPnoLQfcpVp4gF/M0QVk6ivhol2l3mBCmOmeWCumhYL585g//Ap
 EK8i+9mnTsudLDEAqQjhmxTaXZ8l9vGTMK93/nSODvN4Ic6XjbS5PDXysg/lUlcmQaWiQUyWh2
 G+EmAsFplSn1WX3tJ1X+nquMLKdzXltfXTHUJQsBVlGq2PezHn8KIZWmDNPfv6XCPyxDxY3r4L
 Jwa/1Vr6o9GW+v3LvcT0sYNqCVw/UHJQPEtUvOStPxNkmisLAlGXKdWSViwy7JfrIIDfHsPCeq
 q9yT/hbcq3L/NSWZyRmUvQ3H
X-SBRS: 5.1
X-MesageID: 49297560
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:41c5+6w67MCqLZTT7+I8KrPxrOskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjlfZquz+8K3WB3B8bcYOCGghrVEGgG1+rfKlLbalbDH4JmpM
 Fdmu1FeaDN5DtB/LXHCWuDYq4dKbC8mcjC74qurAYOPHRXguNbnmBE426gYz1LrWJ9dOME/f
 Snl696TnabCA4qhpPRPAh1YwGPnayEqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD69jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbUz11rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAxyL5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwtmrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGagoBW+q3qYp0PJGbBfqBb0fbligS+3UoJjHfw/fZv2kvpr/kGOsF5D4
 2uCNUbqFlMJvVmJ56VSt1xGvdepwT2MFvx2VmpUCPa/Zc8SjnwQq7MkcEIDd6RCeo1JbsJ6d
 j8uQBjxCEPk3yHM7zH4HQMyGGWfFmA
X-IronPort-AV: E=Sophos;i="5.84,276,1620705600"; 
   d="scan'208";a="49297560"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFC0U7zWXQ76bjpPvzMQZcGvIN/Z71u4GIggUnYt5B3uxArRL47gC78fWyI8vphXHsllWBpXqPtYGoLUhg7duaV6gnWnJBFYV+XnNYnqVLHm5ZVSURniCoPVvlL031cfjbZwMw1Zk5llPA+A3J0E5hAj6//c09wbTlrvUqP8e5w0X3AZXUC+rJUNe/3x0R+cRFtgOIxKkaZojKjI5qwJs0qoYDvWCid/ncb5Uj1+YvyKKbGM+Rze2+8xzfp8ZzEwW7e8hPGm/HtALxw8mx9YVBpnuAFiRQi/vGv39dimAmjQecdxDa8hQlBtCFg96zW5b92dHr5Y3cNF1nJCIDS07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aDyO0z9TsrqBwOMoovjkHxyClB+bWGt4GlD8AKwWPU=;
 b=gkKFWo6itcEWG2e99X+m+ubMTFw2l1IhGKazW65f5xqcDIDgIEmSWsikrErlMI1XB2+XpL3FryjlemkkvaJliew5LG/25CwUpjYovcim1T+wd9uHuPUxbqkYFsAMuoNQSMNn06s+5O+iZoLi5O93gw/ScYwt3ofYbGJ+7qsscUcVFpg/kHyTuk5nhkfqDV9pmKgxiYexGDWKV8oEMcTiqvwnvLFQz1TtOaUwVZWOhaE+FthsxJEnBmfn2oslVODeKPaJtarZT5dX3j/c0kR0vq1DCz0M+wm4/wokg6XWkfmre4qjL6uZ4DqU1H8XjW8C8BKfnmqvkLHvjQrqOTIiuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aDyO0z9TsrqBwOMoovjkHxyClB+bWGt4GlD8AKwWPU=;
 b=Ksiq6StrtOfOR3gBAplpivtz8IxVoqvD6CPKu3RvJdbaVdahQTN4LPLHaoh+ZrXCblkwRzDSP0gte+1tfhAL42FN8K6ocP0VPgaYkeLYPqUukImus6y0aEW8phs5pELJelUegK8EpWOR1WPv9QKpsNldBCxuZeBXclkecsnXOR4=
To: Julien Grall <julien@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
Message-ID: <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
Date: Wed, 28 Jul 2021 20:00:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d266ff71-0e9b-4328-f74c-08d951fa0965
X-MS-TrafficTypeDiagnostic: BYAPR03MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4552F25BA34B6305D3122112BAEA9@BYAPR03MB4552.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c9h7ETdMekOKeBYU4EypW1fPwDmojpST9CyDF+u38qLV/4VFzcAEN3aqXFrKw1CyJZs1H9YS9AjOeKdoxs//DDKXu7ZycKw/CSgOMscRlxxY1GP9ZZM9Z5CbiA5FctxJp2Edq8QJYpe989nHmxKisahHEdZkhsTJ4mySvVukJdBi96D5+CkqhR4yIavZg/6FYyjYBmje0oo4ZkamXtEtPmW/NkgwwES8tvcuF0lohIX5aJ52FYMy1AkQfbQzyTs9pI3/FR84YZCra2YC1eiutHQfx3m9P078qCAziH3znD18qHpVQGqh4v53ywGECFe/XzxguQuBe3mlulgRnP6hpwpw42TpNp+/Ud19nJLPzplpw4CwaG8pRNepnBcXYsGth/V69yAQfTgoadgUSSZ9VZcQDWDe1e80750FXDn1rnvHs9j9eMCNcewtzwPV/6mNFpTLUbGJHiTCWKv9keju2VtXe9EK82GVW93ZaOS5K6FhhgWMRd7GYcjOFxtjhpHHdFRh+GWJ3u8UXa/1hgaYngTQ2+2TJBon1eLZWEjXI49LFURJ/UQ2ikFbRZf0S7LoW6reCA9owXWOb71cQAlId40+bd+1of1kxoGznvTpyLWQexFqmlIKfzDMEenGVF1GeCN5aoR6ASxOcRGUwnRQOP1K0CniwxoFZ2TVT6siU+nDINZbI6s0SusZlQn+qBpqtFS323NS4a7KFKOaCpkfdsUBj/ooRv2z+hunCMlwLaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(54906003)(66556008)(36756003)(2616005)(16576012)(26005)(956004)(53546011)(186003)(5660300002)(7416002)(110136005)(4326008)(316002)(86362001)(8676002)(66946007)(38100700002)(31696002)(6486002)(8936002)(6666004)(508600001)(31686004)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3VTVDd4RFhUaHp6eWFITjFmRUczbEJ0ZWVPeHhWVENhRkFIYUlzajFFcVpr?=
 =?utf-8?B?UmlyUTB5b3NITU9peFZ6UkFTSWhkUTNlN0JoVUZENjJDU0NFQkw4SHZDNmZ6?=
 =?utf-8?B?cWM1SkQ1RmVkdUNSaE9kY2VtenF6NC9lQmNYU1BTWXZUakl6RXM3NTZLS2VZ?=
 =?utf-8?B?UE1IRFhETWtxZk5sZ3NyWjJrSzVRUVVBRDlvdGtBZWNlRWF0QkJWbkF6Qm15?=
 =?utf-8?B?SzZTajVoMzZJZjdMSGRiK20zbnNubkl4akpRS3dBSlVTa1dsV2xCRXNKT0pE?=
 =?utf-8?B?aHlGUDRpYnpqZndvbGg2U0t6L24xQ0pUU2xmVHFWY1JySEQ4SThYU2RoUjBi?=
 =?utf-8?B?REpER0xCb2p2UkE3QmhyZTE0ZzcyVVNVczFkMkhRdEU5cEY3LzBTdUVhYkdn?=
 =?utf-8?B?UGRQMVBGSFNtQXFzYUlKb2ZkWEhvT2UyNXErNCtZY1M3T1VKWnhjc1hwZ1o3?=
 =?utf-8?B?V1dDelpkWjc5bFNYcGRFVXZucGlhVzN5NWc2aXJvLzVPVkE0U1RsK2ZINjVC?=
 =?utf-8?B?ampSOXZiNlZoUHRwanNscTh4M0NhMU1DY0NzZjF5S1JxMno2QkQ0Nmw3bjZF?=
 =?utf-8?B?OU5TOUdkc3ZFZzYvMWhyM2RZWDN0cktFMm56b0doTVRqWGp1VVVCNHQ2TlJG?=
 =?utf-8?B?Z3duUlJVS3BBaG0vRHZUditsaTAxV0NLSENSd1JzVzF2ekd2bVlrYlN4Mmxk?=
 =?utf-8?B?ZkJNblNHclRJODlSVzFjck1zZWV0MURFMjVSR2RGMFFneVpyajFiQ0tBVjhM?=
 =?utf-8?B?bEhwZHJWbTB0aHBFdnJCS0Q3Zy9YT2F6N1JGc3dONGd5UXpIY1dIRzdhWUVm?=
 =?utf-8?B?QnJ4ZmZtSVl5Q2hIWEx5UzNRY2k5VDduMnZSWEJHblNCd01BYTR5Ym5wMy83?=
 =?utf-8?B?RjJCdkpwZDJCRjdnb2IwTGFyWGtqQUpteWxROWhIZVdOd0tGWGhjR3c5T0Yz?=
 =?utf-8?B?NkhyS1RKN2VJVDNSa2o5Q3ZWRFlPY0FmbzA5K3MzVHpiYzZmSTkxbG1WTFRP?=
 =?utf-8?B?MlVmZEJNTjdjT21FYzR1enk4L2FUZHd3S1lHTk9JMTY3eUFBOHVKRzUvcW1i?=
 =?utf-8?B?YWkyZ0JJNDZDdk8zQW4rYW9iOXdyWXNrN09PM2htVDlheTJ5azYrM3hTU3Vw?=
 =?utf-8?B?MTdEcGYyNWhvaHFKSFhvWUxVellUMW0yVDdPMDZuOHh2YnJjRTVxZElqbnJV?=
 =?utf-8?B?UDArUUtiM3RmSzZNQWEyS2p4YmdhcThEYkZnaFhwNGlUOSthMWxPNXJ3UkxY?=
 =?utf-8?B?aXpwdGc0Wnh2aUw5NS90cEZLd0R1U2xrZUJmcTlkcnN2SVMrR0xtbGgyV2dj?=
 =?utf-8?B?V09CNWxON0JkL2pkQTJkVXhNaWM5eERrOUdWWHdQdEhlQ1RhbVRzUWJLZ3pQ?=
 =?utf-8?B?dytPMVlMOTFxQ25IK0I3TWNyUzZlMUR0UnRwc3BrUitSS0R3K2d5cFpKcGNz?=
 =?utf-8?B?MStZUTRzcDA4VmdjcjdrYUV1VlJYVHFFMWNMeDNrRU82Yk5TVnZpdDBhQ2Fz?=
 =?utf-8?B?cS9jUWRmeXF1MklnTDQ4Uks0RFE3S1YrWm94Y0dQT2hJRXVWWDlOZXExcFlR?=
 =?utf-8?B?eEZJVEdqaFRSREtxaW1rVGJkVVU1RzlZWU4zQVZFaDJ6cE8xdG9NRlh0Z01J?=
 =?utf-8?B?bXZKZzFWTkR3QXRrdzBSVnF5eVdqaGY4VW1BU0RMcmVLMVZtcmZKTjRldFds?=
 =?utf-8?B?ckRYZUtaS0E2OEZYSWN3bXE0K2I3eGEzbHhRS090b0MyL1NEejU5ZGFIdE9K?=
 =?utf-8?Q?wU7U5zEuja1fSHb1JKvHzXXRfHOuyqTtPhCJsnG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d266ff71-0e9b-4328-f74c-08d951fa0965
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 19:00:59.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DoK/H3ebPJ9Nz/07N0BzzfQr9U0YuSXgSOcZlxcVHbpwbgUzwHZ7JjWUXFYQhp8z0MbxIXACG3D6ajvfTJmlbi0pelTANhpTSrutyELypKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4552
X-OriginatorOrg: citrix.com

On 28/07/2021 18:27, Julien Grall wrote:
> Hi Andrew,
>
> On 28/07/2021 18:19, Andrew Cooper wrote:
>> On 28/07/2021 17:18, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Add XENMEM_get_unallocated_space hypercall which purpose is to
>>> query hypervisor to find regions of guest physical address space
>>> which are unused and can be used to create grant/foreign mappings
>>> instead of wasting real pages from the domain memory for
>>> establishing these mappings. The problem with the current Linux
>>> on Xen on Arm behaviour is if we want to map some guest memory
>>> regions in advance or to perform cache mappings in the backend
>>> we might run out of memory in the host (see XSA-300).
>>> This of course, depends on the both host and guest memory sizes.
>>>
>>> The "unallocated space" can't be figured out precisely by
>>> the domain on Arm without hypervisor involvement:
>>> - not all device I/O regions are known by the time domain starts
>>> =C2=A0=C2=A0 creating grant/foreign mappings
>>> - the Dom0 is not aware of memory regions used for the identity
>>> =C2=A0=C2=A0 mappings needed for the PV drivers to work
>>> In both cases we might end up re-using these regions by
>>> a mistake. So, the hypervisor which maintains the P2M for the domain
>>> is in the best position to provide "unallocated space".
>>
>> I'm afraid this does not improve the situation.
>>
>> If a guest follows the advice from XENMEM_get_unallocated_space, and
>> subsequently a new IO or identity region appears, everything will
>> explode, because the "safe area" wasn't actually safe.
>>
>> The safe range *must* be chosen by the toolstack, because nothing else
>> can do it safely or correctly.
>
> The problem is how do you size it? In particular, a backend may map
> multiple time the same page (for instance if the page is granted twice).

The number of mapped grants is limited by the size of the maptrack table
in Xen, which is a toolstack input to the domaincreate hypercall.=C2=A0
Therefore, the amount of space required is known and bounded.

There are a handful of other frames required in the current ABI (shared
info, vcpu info, etc).

The areas where things do become fuzzy is things like foreign mappings,
acquire_resource, etc for the control domain, which are effectively
unbounded from the domain's point of view.

For those, its entirely fine to say "here 128G of safe mapping space" or
so.=C2=A0 Even the quantity of mapping dom0 can make is limited by the shad=
ow
memory pool and the number of pagetables Xen is willing to expend on the
second stage translation tables.

>
>>
>> Once a safe range (or ranges) has been chosen, any subsequent action
>> which overlaps with the ranges must be rejected, as it will violate the
>> guarantees provided.
>>
>> Furthermore, the ranges should be made available to the guest via normal
>> memory map means.=C2=A0 On x86, this is via the E820 table, and on ARM I
>> presume the DTB.=C2=A0 There is no need for a new hypercall.
>
> Device-Tree only works if you have a guest using it. How about ACPI?

ACPI inherits E820 from x86 (its a trivial format), and UEFI was also
based on it.

But whichever...=C2=A0 All firmware interfaces have a memory map.

> To me the hypercall solution at least:
> =C2=A0 1) Avoid to have to define the region on every single firmware tab=
le

There is only ever one.

> =C2=A0 2) Allow to easily extend after the guest run

The safe ranges can't be changed (safely).=C2=A0 This is the same problem a=
s
needing to know things like your PCI apertures ahead of time, or where
the DIMM hotplug regions are.

Having the guest physmap be actually dynamic is the cause of so many
bugs (inc security) and misfeatures in Xen.=C2=A0 Guests cannot and do no
cope with things being fully dynamic, because that's not how real
hardware works.=C2=A0 What you get is layers and layers of breakage on top =
of
each other, rather than a working system.

The size of mapping space is a limit, just like maxphysaddr, or the PCI
apertures, or MMCFG space, etc.=C2=A0 You can make it large by default (as =
it
doesn't consume resource when not being used), but any guest OS isn't
going to tolerate it morphing during runtime.

~Andrew


