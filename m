Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B6F4F29BE
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 12:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298688.508922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgPk-0005oz-To; Tue, 05 Apr 2022 10:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298688.508922; Tue, 05 Apr 2022 10:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgPk-0005mU-Qa; Tue, 05 Apr 2022 10:27:56 +0000
Received: by outflank-mailman (input) for mailman id 298688;
 Tue, 05 Apr 2022 10:27:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbgPj-0005mO-Qx
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 10:27:56 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bd192f2-b4cb-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 12:27:53 +0200 (CEST)
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
X-Inumbo-ID: 0bd192f2-b4cb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649154473;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2PGknIrglFtUDln2TCqEDHxUo4FAZrdPAz6DGG5+jg0=;
  b=FlykEXhyHj26Bh25O5VGANMLqwJySXZ/1Y4BnUAs3HQj+oPeBWvgbKdQ
   wcBY9RZD8HweBZScPLzBghwcTlIBUbTlcgiD72+0zb/GveMfk3iUbI7yA
   gs3xIAPm6jrZA7K11DSMJB01ju6h/xqVgdvxyQJTmzc6kLms2uwda8bQR
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68029405
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mfjPnqC2HslliBVW/9zjw5YqxClBgxIJ4kV8jS/XYbTApDN2hjdTz
 jEYWD/TOPqPamagft8kYInjoEMPv8LSyINkQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jh39Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhQk
 dRtkpe8FzsXN/f+o9gYaBN3MHlhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGjG9q15wWQJ4yY
 eJJVWtDMAvQcSdxBWxGGaAumMPwij7gJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHMKYzT2J43e9nNjFlCnwWJ8RPLCg//ssi1qWrkQZBQcKT1K9rb+8g1SnRtNEA
 0UO/2wlqq1a3E62StjwWTWorXjCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAKKUcSaClCShEKi+QPu6lq0EiJFIw6Vvfo0JulQlkc3
 gxmsgAf3rQzqsUHiZmF9Ar1uA6pnZLmbVYqs1C/sn2e0it1Y4usZoqN4Ffd7OpdIIvxcmRtr
 EToiODFsrlQUMjleDilBbxUQer3v6rt3Cj02wYHInU3y9i6F5dPl6h06So2GkpmO91sldTBM
 B6K4lM5CHO+0RKXgU5Lj2CZVp9CIUvIT42NuhXogjxmOMUZmOivpnwGWKJo9zqx+HXAaIlmU
 XthTe6iDGwBFYNsxyesSuEW3NcDn35ilDuJHcymk0/7jdJygUJ5r59fbTNiichjssu5TPj9q
 Y4DZ6NmNT0BOAEBXsUn2dFKdg1bRZTKLZv3t9ZWZoa+zvlOQwkc5wvq6ep5IeRNxv0N/s+Rp
 y3VchIImTLX2CycQS3XOy8LVV8adcsmxZ7NFXd3ZgjANrlKSdvH0ZrzgLNsJON9qbM6kaAvJ
 xTHEu3Zaslypv380211RbH2rZB4dQTtggSLPiG/ZyM4cYImTAvMkuIItCO1nMXSJkJbbfcDn
 oA=
IronPort-HdrOrdr: A9a23:Oqt+MKwPrGPOTnpMQVGLKrPxwuskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WBxB8bZYOCCggqVxe5ZnO7fKlHbaknDH6tmpN
 tdmstFeazN5DpB/L7HCWCDer5KqrT3k9HLuQ6d9QYXcegDUdAf0+4TMHfjLqQZfnggOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpYfHHfFAlEii8eV57HzzcZdQ60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="68029405"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8D2iR9wkmNH8D1EF4aoibn68bqh13y3wWVUHIlMPgGWeYFNiAmcbc0PlJH5j3VyWs4OhcbEJHCC947+EkxYHIoHl/TqZy9MRVAQjsCQQXgPcc45irBpnQ5r74dXOOhak05ky1B1A/p3spqQAmEVQjOdnInhkdjlD5db2Yehz/4d+/ZUOwx0apeiXvZs3gzxcelF3oGroJu+I/iI8ReQ3D5IaosFDaEZoOSl7+yqIcsmg4vb2g1I4RA71VNIazhABJNDBZgAcQGUxc++VxD+f0t2RWMinkhCkxyo/2vlE8pdTrKEAtiy61L7JpL7OWwXQqAOuHR7SfXIjQU6w9L0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYVut/VAL22ydjAROR+Mnb1G9/oiCc3JqVynNIb93J8=;
 b=cKatRWN7uFOyVbIT0q4rDOYgGhXvr4uM1LbEcOwpjdeR5XCEmGNxhPqWc5oAaChmCMUzcH2U3FnK9pdyF63ouedJSP+NSKN3e2m8Zt9zkrpR21lKchOBV2IzPBQKwU+s6REKP7j4Hs4rUtVhl3fr3l7Y3+geJL3o9pNuG6+XgH7Res2pIterAhOvRsVVdZNRDbw09gZEgsnL018nzRjene9muQ5ToiT6caCom0mA6Jzh0egGSs/jH4vSVKaId7pFhux+Wyva1A1lkVjF9gB1LBTYJuXhQ0FVXY/xLHMKJ8pSZwXeYdx8JRG3TVSe4+1yz4UMefzH02VN7u/pgEiWag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYVut/VAL22ydjAROR+Mnb1G9/oiCc3JqVynNIb93J8=;
 b=XNE7BOY1jaE6HyjJ3vN8tmCGdDj+WUnYJ/+pbeSYmHvmBGvl5/ASzb4iAXHA/NXx8zxDaVinGcViROPqsgQv0474qaCngFGUdasaQSTEXwRsvNF8BrzMyd9CWz4TtgpDpBjzQVa/qsM4xNK+3PYfV8YqZ1MQGSgW7/G/d8yRs+g=
Date: Tue, 5 Apr 2022 12:27:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH v4 3/8] x86/EFI: retrieve EDID
Message-ID: <YkwZnBIOQ/jwzq9Y@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
X-ClientProxiedBy: LO4P123CA0450.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5419886c-ca9f-4c71-0ebd-08da16eeed32
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6517:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6517EF3384C5A8B8F9BF1DD78FE49@SJ0PR03MB6517.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EuG5uOaNh+4OtdQKMggfQK1zR37s8IQaYaMapYQIYAJaED+thkTfuVkzMpCEm02qVrdK8uEzLY8b8FZElmWdAvVVJSTzbwrue3H78PtR9OnQEkPrOBBMXwR5ILwqpMD6OD/XfyMRdGKi7IQSXe7DKmZEClrb8GZxt1+GN4+tdGgKRzU20Ndv5mZepYFHzPSgMRpLgEN81OZK2ia8hkXhDycafr7nv0pcqDn7Kj+6yh25sV4wnvWehRosXS0GvPtX7ZCCBzMmUsHgnHDgp1myIjIEIJsrTZx+gyWXHPO+ytAZMplBVawt/G8iIdvzJHgcJbmTapVH9jjRfeP2hmtoU6GuhjW+ZZFOMXKIRmwrImPv2yMyDfme/qhsF4kMdWcHgGhGq87arqA8XOvD1ecPnBO4Ea62PXXalGAjOkIhmu34wDFncBV2H7eMxdges5QZGLFiwXFjoXVe/JMpZoTE+4spt9cAAxHrbgA2EOzvkHFpIkFzS15qF6Dyta6W5vVPDWcw4/cLjCixS83nzl+cY7PuSotL2fvFJWTh3oYdhhjUiC+b4YnBO0JGYzc9zXbEE5xsGbUFtDufTvwuRafsWUTujwx0tt5XW7VBKZ4oMjSR5xSBaGfGBid7anrntiLzf1nS3CEQ7GJomIr8X46rIS+rNxZPezNF/h02EvsI1MvVsWs1Z53AMy1zjKyY5HHWs3vvLYodf8H5SwyZqxxRyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(4326008)(508600001)(8676002)(86362001)(2906002)(8936002)(82960400001)(5660300002)(9686003)(38100700002)(6512007)(66556008)(54906003)(186003)(33716001)(26005)(6666004)(6506007)(66946007)(6486002)(66476007)(316002)(83380400001)(85182001)(6916009)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXhWaWlaQ01OZnF3UWtVenNrU2JVMGI3aTl0UGZYekp0WnNwWTFBRnQvS2pn?=
 =?utf-8?B?QVJqbmQvWkFEVE1uK3pFa2wzRjMwUzhaU0VMbG9KakJEN3VrcTlBZWtWZ0g2?=
 =?utf-8?B?L3J5bkxpcFh1SUpxTTJaSmc4cFZwYUhGZ2UxK2pyYm4zQ0E2T1ZYMWM1Qk1u?=
 =?utf-8?B?aGhhczhsSWRYamlraXZpYW9RNEdWeUUxemZJRS9aT1p0czVTQlZZb3hHelQ3?=
 =?utf-8?B?N1dvQ0NBN2YvdXdpUkgzck1MdUpQL0tkZE44cm5mREZ6eWFBYVZycVdweTNE?=
 =?utf-8?B?c3FTbU9xckdUS2s2SVNpRk9OV0ErVzgwOEZJZ3A4Tkw0by9BSW9mRkRzV1hH?=
 =?utf-8?B?dGQ4MXNrSHBOSnFDeUFUQTJnS0ZCbytEci81WDQwYWpqM29uZXplMkl2aTh2?=
 =?utf-8?B?QW1kRGkrUXF0WVA1QkpvZXgveFNLTjdrSXVBYUdhMUpLRWIvcVg2NUV5dERq?=
 =?utf-8?B?djNsTlNYQ010YjRNeEd0RGZia0YxQVdVSld1dFRHOG5WdjRJVk45MTQvNnMr?=
 =?utf-8?B?UDIyZlN4dmx3aEYrQmhsbVZieVJBeHZMWW95d1VUcEhvQnFNUHRhWEYrTnR3?=
 =?utf-8?B?cnVmL2dZOHJBZEwyT3pFVG5IK2UwaExQS0thWDF0NmZOM24xMlJQbUFpdUtK?=
 =?utf-8?B?Rmg2N055VVl0dWZIMER1K0NxK2wvMnZ5c1prNDlXK2ozdTdpU1NEbmtmODRh?=
 =?utf-8?B?ZXRzUVRsTkNsVlpwQTN2cmtNMXZ2T1VQZzZEV2V2TEpnNjMzOFFlSzVuTFYx?=
 =?utf-8?B?THEyTW9nNEYwZ293UU54RjI3aUFuQ2lKbFFBU1l2aUVZSmdKdVBDS3A2VG9G?=
 =?utf-8?B?NjFjN0VaN3pUU2pXczJMdzk2dktxMU95a3Btak5pTDBudjYzWlo4bVNxZkxq?=
 =?utf-8?B?V0NIVm1IeXpFcVpwTjk1MUxON1VVMFF3eWJNMnRVdFQxNGpWSGkxVkNHMXhU?=
 =?utf-8?B?THE0czR5eHhFT1ZXei9hdHBWWVJlQndjTHRkL0V1NUpuaWc5Qm1Ya2JWTUx4?=
 =?utf-8?B?L1UwMjJvOUMxc25ENlFjK0xsdDhJTWF6U3hEODZreTV4ZFFVMy95NW05VnZ0?=
 =?utf-8?B?VHF4dC9tMlhxMkNLOG9CYnJQK1p6c3hvZVYvL1dLUEJEVlFTRThJVHU0VlNZ?=
 =?utf-8?B?bXU3NjJERm01UDhEMkU5T3h3bWUzT2lYQU11TEpaUkZ6SENOZTMwRHF1TW9k?=
 =?utf-8?B?TzhVQ2FXaVRNSmtOdGZLbmM5WkdyQ2VvWWQ0UU51Q2JpOFVRd3FRMmh1dUQv?=
 =?utf-8?B?UGFQR1I0ZU13SzFHRUJHejhvVlRnRUhrcEJ1VHhQYll6YWpiUFFxM09FNTBt?=
 =?utf-8?B?RTVtSzJDNHVkM1hySUk2b3BMM3RGbWxOcWcxQWp5YUoyY0tSeTl5d0MveG5W?=
 =?utf-8?B?ZVB6UkpqMmRwOUlZZHByWW9VbmhGS1dXelJ5SVY5QWJWamNKNElITjJhanpr?=
 =?utf-8?B?MDYwR3RXVkdvcWRCMEE0NGo3VFMydUczSGhZcmk5ZXkxRUlzQ0FaS3czcUhK?=
 =?utf-8?B?RjFGdWpKbmJMRTd5MGtPWmwwWEg5OWU2blZnN1lCTW5xTVlWVndsL0VtRDVX?=
 =?utf-8?B?UDZiTXFycVVvdXZhMzIzQWRGVVNucGZzU3lQL0ZlMnc4VjBKSGFUVkk4WUtm?=
 =?utf-8?B?VlN0N3BYSG1zQUZvZnhVSytzTkxZQTUrSmpxVVBnSXkxbk8xdGkwNHY4a2Jr?=
 =?utf-8?B?dmd1NkRYckxueTJwY0JzSWRSbzQ3RFlMcG1jd1lzMFlkRHk0d2c4NUZoZnAy?=
 =?utf-8?B?ZVk3ZzJLcm9DOGprUTk3VndOUXZ5QitGQzZaQUFNYUpWOHc5TXRkTW45ZFMy?=
 =?utf-8?B?bHQ4bFE4RXJvRlRYOGZOVDRKSUMvcHdBSlhKQkJWQ0VlcDh4YUVLN1dWK05Y?=
 =?utf-8?B?VmlhWGtDRk5PVHpEbWdYWTdVcDRMdmpuKy9yUHorTUdSd21zN0RXSzA2R1Bl?=
 =?utf-8?B?ZmFNYXZZTjJ2WGtHK0xGa2FDM0pFYVM0L2R1V1RNdUsvRDJkOENSMVZ4RExB?=
 =?utf-8?B?NVdvS2xZUXRCNDBUU2ZsZlVzK2dIajZBSlRtV1UrL29LWGdtVmFzZHY2YW92?=
 =?utf-8?B?ckxmYldxTk5rb2daWGc1QmEyQzZxc3BaQXQydnBqNnFqT0YvdjU1WlNhWW1t?=
 =?utf-8?B?SFlDeUthclMvdHgyejM2M3dOaDJmN2ZwaVhXUlQ2N2YxVk55TGFTQktvZlgw?=
 =?utf-8?B?bnNIZ0FrU0NRY2R6d3pROG45Q25yWThYK0JNQXcyczduTXYzMHg2R3drNkVq?=
 =?utf-8?B?SnhMNEpKaUJzaTFPK2w3WkEycy9xNzd2SmJhV2hTWk5JS2RydTVPdVJvUGg2?=
 =?utf-8?B?SWI1YzhGVVhiN20xbUF6ODdPd05CWVA2dkdTQndjQlcrQ1BLakttY1dDR0gw?=
 =?utf-8?Q?wbYjKyz2gLz9lH/Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5419886c-ca9f-4c71-0ebd-08da16eeed32
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 10:27:46.5417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5Y+C6kuqIvXEP4nFqbJG476eErxy/Sow+nhe4aVW49NDVz7P9p8caiOpgimAlIgBZalfsJZINT816vBZ7wF0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6517
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 11:45:36AM +0200, Jan Beulich wrote:
> When booting directly from EFI, obtaining this information from EFI is
> the only possible way. And even when booting with a boot loader
> interposed, it's more clean not to use legacy BIOS calls for this
> purpose. (The downside being that there are no "capabilities" that we
> can retrieve the EFI way.)
> 
> To achieve this we need to propagate the handle used to obtain the
> EFI_GRAPHICS_OUTPUT_PROTOCOL instance for further obtaining an
> EFI_EDID_*_PROTOCOL instance, which has been part of the spec since 2.5.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Setting boot_edid_caps to zero isn't desirable, but arbitrarily setting
> one or both of the two low bits also doesn't seem appropriate.
> 
> GrUB also checks an "agp-internal-edid" variable. As I haven't been able
> to find any related documentation, and as GrUB being happy about the
> variable being any size (rather than at least / precisely 128 bytes),
> I didn't follow that route.
> ---
> v3: Re-base.
> v2: New.
> 
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -464,6 +464,10 @@ static void __init efi_arch_edd(void)
>  {
>  }
>  
> +static void __init efi_arch_edid(EFI_HANDLE gop_handle)
> +{
> +}
> +
>  static void __init efi_arch_memory_setup(void)
>  {
>  }
> --- a/xen/arch/x86/boot/video.S
> +++ b/xen/arch/x86/boot/video.S
> @@ -922,7 +922,14 @@ store_edid:
>          pushw   %dx
>          pushw   %di
>  
> -        cmpb    $1, bootsym(opt_edid)   # EDID disabled on cmdline (edid=no)?
> +        movb    bootsym(opt_edid), %al
> +        cmpw    $0x1313, bootsym(boot_edid_caps) # Data already retrieved?
> +        je      .Lcheck_edid
> +        cmpb    $2, %al                 # EDID forced on cmdline (edid=force)?
> +        jne     .Lno_edid
> +
> +.Lcheck_edid:
> +        cmpb    $1, %al                 # EDID disabled on cmdline (edid=no)?
>          je      .Lno_edid
>  
>          leaw    vesa_glob_info, %di
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -568,6 +568,49 @@ static void __init efi_arch_video_init(E
>  #endif
>  }
>  
> +#ifdef CONFIG_VIDEO
> +static bool __init copy_edid(const void *buf, unsigned int size)
> +{
> +    /*
> +     * Be conservative - for both undersized and oversized blobs it is unclear
> +     * what to actually do with them. The more that unlike the VESA BIOS
> +     * interface we also have no associated "capabilities" value (which might
> +     * carry a hint as to possible interpretation).
> +     */
> +    if ( size != ARRAY_SIZE(boot_edid_info) )
> +        return false;
> +
> +    memcpy(boot_edid_info, buf, size);
> +    boot_edid_caps = 0;
> +
> +    return true;
> +}
> +#endif
> +
> +static void __init efi_arch_edid(EFI_HANDLE gop_handle)
> +{
> +#ifdef CONFIG_VIDEO
> +    static EFI_GUID __initdata active_guid = EFI_EDID_ACTIVE_PROTOCOL_GUID;
> +    static EFI_GUID __initdata discovered_guid = EFI_EDID_DISCOVERED_PROTOCOL_GUID;

Is there a need to make those static?

I think this function is either called from efi_start or
efi_multiboot, but there aren't multiple calls to it? (also both
parameters are IN only, so not to be changed by the EFI method?

I have the feeling setting them to static is done because they can't
be set to const?

> +    EFI_EDID_ACTIVE_PROTOCOL *active_edid;
> +    EFI_EDID_DISCOVERED_PROTOCOL *discovered_edid;
> +    EFI_STATUS status;
> +
> +    status = efi_bs->OpenProtocol(gop_handle, &active_guid,
> +                                  (void **)&active_edid, efi_ih, NULL,
> +                                  EFI_OPEN_PROTOCOL_GET_PROTOCOL);
> +    if ( status == EFI_SUCCESS &&
> +         copy_edid(active_edid->Edid, active_edid->SizeOfEdid) )
> +        return;

Isn't it enough to just call EFI_EDID_ACTIVE_PROTOCOL_GUID?

From my reading of the UEFI spec this will either return
EFI_EDID_OVERRIDE_PROTOCOL_GUID or EFI_EDID_DISCOVERED_PROTOCOL_GUID.
If EFI_EDID_OVERRIDE_PROTOCOL is set it must be used, and hence
falling back to EFI_EDID_DISCOVERED_PROTOCOL_GUID if
EFI_EDID_ACTIVE_PROTOCOL_GUID cannot be parsed would likely mean
ignoring EFI_EDID_OVERRIDE_PROTOCOL?

> +    status = efi_bs->OpenProtocol(gop_handle, &discovered_guid,
> +                                  (void **)&discovered_edid, efi_ih, NULL,
> +                                  EFI_OPEN_PROTOCOL_GET_PROTOCOL);
> +    if ( status == EFI_SUCCESS )
> +        copy_edid(discovered_edid->Edid, discovered_edid->SizeOfEdid);
> +#endif
> +}
> +
>  static void __init efi_arch_memory_setup(void)
>  {
>      unsigned int i;
> @@ -729,6 +772,7 @@ static void __init efi_arch_flush_dcache
>  void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>  {
>      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop;
> +    EFI_HANDLE gop_handle;
>      UINTN cols, gop_mode = ~0, rows;
>  
>      __set_bit(EFI_BOOT, &efi_flags);
> @@ -742,11 +786,15 @@ void __init efi_multiboot2(EFI_HANDLE Im
>                             &cols, &rows) == EFI_SUCCESS )
>          efi_arch_console_init(cols, rows);
>  
> -    gop = efi_get_gop();
> +    gop = efi_get_gop(&gop_handle);
>  
>      if ( gop )
> +    {
>          gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
>  
> +        efi_arch_edid(gop_handle);
> +    }
> +
>      efi_arch_edd();
>      efi_arch_cpu();
>  
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -118,7 +118,7 @@ static bool read_section(const EFI_LOADE
>  
>  static void efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable);
>  static void efi_console_set_mode(void);
> -static EFI_GRAPHICS_OUTPUT_PROTOCOL *efi_get_gop(void);
> +static EFI_GRAPHICS_OUTPUT_PROTOCOL *efi_get_gop(EFI_HANDLE *gop_handle);
>  static UINTN efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
>                                 UINTN cols, UINTN rows, UINTN depth);
>  static void efi_tables(void);
> @@ -758,7 +758,7 @@ static void __init efi_console_set_mode(
>          StdOut->SetMode(StdOut, best);
>  }
>  
> -static EFI_GRAPHICS_OUTPUT_PROTOCOL __init *efi_get_gop(void)
> +static EFI_GRAPHICS_OUTPUT_PROTOCOL __init *efi_get_gop(EFI_HANDLE *gop_handle)
>  {
>      EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *mode_info;
>      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
> @@ -783,7 +783,10 @@ static EFI_GRAPHICS_OUTPUT_PROTOCOL __in
>              continue;
>          status = gop->QueryMode(gop, gop->Mode->Mode, &info_size, &mode_info);
>          if ( !EFI_ERROR(status) )
> +        {
> +            *gop_handle = handles[i];
>              break;
> +        }
>      }
>      if ( handles )
>          efi_bs->FreePool(handles);
> @@ -1222,6 +1225,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
>      if ( use_cfg_file )
>      {
>          EFI_FILE_HANDLE dir_handle;
> +        EFI_HANDLE gop_handle;
>          UINTN depth, cols, rows, size;
>  
>          size = cols = rows = depth = 0;
> @@ -1230,7 +1234,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
>                                 &cols, &rows) == EFI_SUCCESS )
>              efi_arch_console_init(cols, rows);
>  
> -        gop = efi_get_gop();
> +        gop = efi_get_gop(&gop_handle);
>  
>          /* Get the file system interface. */
>          dir_handle = get_parent_handle(loaded_image, &file_name);
> @@ -1360,7 +1364,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
>          dir_handle->Close(dir_handle);
>  
>          if ( gop && !base_video )
> +        {
>              gop_mode = efi_find_gop_mode(gop, cols, rows, depth);
> +
> +            efi_arch_edid(gop_handle);
> +        }
>      }
>  
>      /* Get the number of boot modules specified on the DT or an error (<0) */
> @@ -1387,7 +1395,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
>  
>      efi_arch_edd();
>  
> -    /* XXX Collect EDID info. */
>      efi_arch_cpu();
>  
>      efi_tables();
> --- a/xen/include/efi/efiprot.h
> +++ b/xen/include/efi/efiprot.h
> @@ -724,5 +724,52 @@ struct _EFI_GRAPHICS_OUTPUT_PROTOCOL {
>    EFI_GRAPHICS_OUTPUT_PROTOCOL_BLT         Blt;
>    EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE        *Mode;
>  };
> +
> +/*
> + * EFI EDID Discovered Protocol
> + * UEFI Specification Version 2.5 Section 11.9
> + */
> +#define EFI_EDID_DISCOVERED_PROTOCOL_GUID \
> +    { 0x1C0C34F6, 0xD380, 0x41FA, { 0xA0, 0x49, 0x8a, 0xD0, 0x6C, 0x1A, 0x66, 0xAA} }
> +
> +typedef struct _EFI_EDID_DISCOVERED_PROTOCOL {
> +    UINT32   SizeOfEdid;
> +    UINT8   *Edid;
> +} EFI_EDID_DISCOVERED_PROTOCOL;
> +
> +/*
> + * EFI EDID Active Protocol
> + * UEFI Specification Version 2.5 Section 11.9
> + */
> +#define EFI_EDID_ACTIVE_PROTOCOL_GUID \
> +    { 0xBD8C1056, 0x9F36, 0x44EC, { 0x92, 0xA8, 0xA6, 0x33, 0x7F, 0x81, 0x79, 0x86} }
> +
> +typedef struct _EFI_EDID_ACTIVE_PROTOCOL {
> +    UINT32   SizeOfEdid;
> +    UINT8   *Edid;
> +} EFI_EDID_ACTIVE_PROTOCOL;
> +
> +/*
> + * EFI EDID Override Protocol
> + * UEFI Specification Version 2.5 Section 11.9
> + */
> +#define EFI_EDID_OVERRIDE_PROTOCOL_GUID \
> +    { 0x48ECB431, 0xFB72, 0x45C0, { 0xA9, 0x22, 0xF4, 0x58, 0xFE, 0x04, 0x0B, 0xD5} }
> +
> +INTERFACE_DECL(_EFI_EDID_OVERRIDE_PROTOCOL);
> +
> +typedef
> +EFI_STATUS
> +(EFIAPI *EFI_EDID_OVERRIDE_PROTOCOL_GET_EDID) (
> +  IN      struct _EFI_EDID_OVERRIDE_PROTOCOL   *This,
> +  IN      EFI_HANDLE                           *ChildHandle,
> +  OUT     UINT32                               *Attributes,
> +  IN OUT  UINTN                                *EdidSize,
> +  IN OUT  UINT8                               **Edid);
> +
> +typedef struct _EFI_EDID_OVERRIDE_PROTOCOL {
> +    EFI_EDID_OVERRIDE_PROTOCOL_GET_EDID  GetEdid;
> +} EFI_EDID_OVERRIDE_PROTOCOL;
> +
>  #endif

FWIW, EFI_EDID_OVERRIDE_PROTOCOL_GUID is not used by the patch, so I
guess it's introduced for completeness (or because it's used by
further patches).

Thanks, Roger.

