Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C472F8154
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 17:58:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68448.122576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0SQE-00056m-8y; Fri, 15 Jan 2021 16:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68448.122576; Fri, 15 Jan 2021 16:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0SQE-00056N-5e; Fri, 15 Jan 2021 16:58:02 +0000
Received: by outflank-mailman (input) for mailman id 68448;
 Fri, 15 Jan 2021 16:58:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0SQB-00055z-TH
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 16:58:00 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 361e0c61-ff5d-4f84-a7d1-16ed6acbaff5;
 Fri, 15 Jan 2021 16:57:58 +0000 (UTC)
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
X-Inumbo-ID: 361e0c61-ff5d-4f84-a7d1-16ed6acbaff5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610729878;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yzkwoYg3SXykeIJMqqEolxHLo7eRn65CZhtxF85TpYw=;
  b=aCaLLZXXHWfxYl9qr2wV1xXEhocQbObZWOTsvgT5dT6kK9vlJJXUMlPy
   w+33T3+LYjp3HEvFaMwJPi/1ewyjE3CTHMA4ag29EHcwNFDR09a2fLNb8
   QNkeKQcy8CJZy6Wc/JmWtBc+YHwGr4hZIBujEGPj0deeujnFJouq5iZG7
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1gjDKJK4DAchNSydPaLbazclgOyCsND9xYx0Y0mVv0yJfYlDf3ySE1myjBlVjprcEP3hWvUrng
 N8fGOoETTBFAyz6QCWUVBvlBA1R8a2w8yD7hqVYEyApf7KLIXuzmCpyYRa1IdLaeJyTMmtac3d
 StuEnwd43wUWj1559yS179yy8vzCxoaS4pUd4VI/gvxwAGvu84da1Zm5t0ZOrQ+vh5H7CfBlQT
 BuOGUgdkCUwnJtUkEM5VVKYcE4Oo8zyil1uS6/jgXU8KP+d9PBeh8FCv7qdJs2G7KQ5vmn3Gpw
 r+A=
X-SBRS: 5.2
X-MesageID: 36486329
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="36486329"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErPDdVYwBD6UANOnVroEXqpPRb7x/qAN+xEoKlde0SZFZcSNDVDNFvpuCqCFOM88sUrBkWADwc+5U0m98TX5WqQvIIYPZsAXBkVAtnj43DHGRwsSib/tKi6SRU7XT/zliL1QlcrIHyl8QjX1ACTtWfazmAP/VoSlIbSt5aBUxhUPku1AKUvK8LOquTVlgBxSWxP3AFDh9jA4EZPC5HQoqMa3rqsOko4wGMEz2UMOyjXXPnuF2ZLkcxM+eiaT0OIc+08BSksPPytcj7iu3kyV49GktclxidrPbh0AdXtX69fZk6hQpVtYngZSSMHW7JuOP6wy1Xw5msMJ1LIKZbidgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKvlSnsqHYc9aXs1UVn+X1jWn9cUUHdrTLlA66JsQ38=;
 b=YR1xGrckkBt/lFaqVs/BAHpS+eA41a2U1mJj+6Iak3VjRc5SpirNb3thWUX7/eyGPtu0NRCAw3hUCUMkndfHh/bU+wprHzx106ito3G1HzuW1cqrj8fk7TKX69L21It0qt0iSb8N3oMt/QfGgTEpf34uIN1VHTtFPytycyOmovkN772IlwbR04U3hizoaD+F8+RDlRhUWeXRPBDRpQ5n2DzN+TKp8+PF1mrq5Jc+DrjJ4cQMPu/lLpRkWj+/0biPPLIlB5vuqCqDvwhdnSj3wbY8PPHkpArJVgMY4rjJCWzU6pz1aPqX5AfTGr6RTHb4pUlTRAqnflJHRmpDK1wBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKvlSnsqHYc9aXs1UVn+X1jWn9cUUHdrTLlA66JsQ38=;
 b=nxn5QvU6ZsDX4LuQv+sOIzN2OuhX/JtZ81eqY+dbbT7UobSynrZ4iRHUmYuP28/fE8Cz9QJhV0+gdqUPNlGSpRrHrD6SZNqIwvJ5KqTcE6dI2MoVJrcS2v1gYbSoBhEuQykPRFnioGNj+pTbrvykAXph3+L0T4liLP8bv1mE59Q=
Subject: Re: [PATCH v3 1/7] xen/gnttab: Rework resource acquisition
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, Hubert
 Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-2-andrew.cooper3@citrix.com>
 <6321bce7-1826-be38-622e-088d492fb0c9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a96bed35-df20-e77b-1b98-593aa5649ad9@citrix.com>
Date: Fri, 15 Jan 2021 16:57:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <6321bce7-1826-be38-622e-088d492fb0c9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0220.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::9) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f95ce0ea-efbc-4f46-9efb-08d8b976b386
X-MS-TrafficTypeDiagnostic: BY5PR03MB5111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5111475A2A0B7F9F127D965CBAA70@BY5PR03MB5111.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0xwBXj0cPZ5sXD8U8fPld/44gPkRQFOYDTfKzcrmZB8pdxygCgmfTYdRTlTrcvxoc0+LPwK8hDO0T4NEpbKI7PXohrRtzTpFtqFT8/Hc1C+EqcMS07q+PNShIjrYEaHo9cgKJSYPrs4IKK7ODFSDQ/XRzkVSYk+2QzdcQIr64QwaktX04P8oC+Tbsf0ZXvKCjJW7UoSzbj58DWGUvYTPSOfwFdLyV5BU2noA2S4+2pLlU2my8evSZl166EXpnFT9NXmrDkx9GkwBzOI6uxNxL4XqnrdqTBLBdBSmbCr2cKgokVM7REexrnMJfrM0pWojjiLqM2jsEB9HNpL1ZxB4wu0hPIn6FP3q4cNj2k/19WOBkbPp7FlduJpVmrbGsjJxanITfTnxv7jB5SRlafSGj6+PqZz369wwcH7rn7d1fYzK7iuBRZaW+w9y0tV5aaxefKb/7ftt+4q1G9g1L9nF2JUDk5MmI0IObm4mmirJJFA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(86362001)(956004)(54906003)(8936002)(16576012)(5660300002)(316002)(4326008)(6666004)(36756003)(66476007)(31686004)(66946007)(6486002)(16526019)(2906002)(7416002)(2616005)(66556008)(53546011)(31696002)(478600001)(6916009)(83380400001)(186003)(26005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MkR2QzVzRXB1R0dqZUZhdTZtTkZMWks5cURwUGJjSVZiUWpYMGRIR056d1Ft?=
 =?utf-8?B?UXFBclNSZE1xUFpWZWRyd0JwQzdyQng4V0lqeGRFSXNBM2pNcFRlL0JBQWZH?=
 =?utf-8?B?dlpkYldQcFBjeDZXdmtueS9tZm1rd0ZId0piZ2JqNXdFQWRxN2FPRml5L2dK?=
 =?utf-8?B?M2hqZmRvVGhjSGltYm1TTlhrVzdnRDRCT0JVT01CSmx5QlFXdjFYQWRhQlhI?=
 =?utf-8?B?clZlMlVBVnVvQ3NHbDVzWWJDZWRzWGlIU1dYRXZGbHVZVUgveUV3UXh1czIy?=
 =?utf-8?B?K0RoTzZZOEY0Q2tveEF4a0toWEs5OWhqclhPc1BxaUNCOTAwTm0yWitpQlhM?=
 =?utf-8?B?akt4QUVEZEJ5OUlYWC9aZmVBb1FELy9jNm4ydDg0UElQeDduWG8rdTc0azZz?=
 =?utf-8?B?SDF1d3NJZ3RycnBybkJQNWowdXZhUHBOUjMzR0hjbm5jTkxiNzJJVHhhNHMx?=
 =?utf-8?B?K00reUNPRGZpV1hhLy9UWHpDYWU5N1RwalRoZEJsWVVVZlRRNU5JMjVacTlL?=
 =?utf-8?B?TXpSNWl0bXA1b2dKOWNjRTBOYjNqd29WbHNxZTVOUXF2eFhSZS9EdlRTVW5C?=
 =?utf-8?B?YlVERmdVMEQ2WjFYdzBBUTNSVEFYNC9FTE94enJVQ2V4Y3NicU5Zbzd0WkJp?=
 =?utf-8?B?QUpCL25kbk5lRVhTYjRFaWtMVVVIUSswcXJVNUxXZFZFUHJrbVc5VFNVTXpT?=
 =?utf-8?B?S0Fsd3h3NWpuR2xiSEJDSUxiSkNiRXkyT0t4YjRST1czdDB2ZVVCSytrbndH?=
 =?utf-8?B?OXlraExJRkFaQWFrYjlJNVdjNWtMc1Bic2NUcUpLYUpIVUgxb0dHY3pTbzl2?=
 =?utf-8?B?bW9nYTA5Z256YWorblQ3KzJ0Y0p1SGNFblpQa2ZObnBIY25pL05kdldNWlNC?=
 =?utf-8?B?SHNIS1FaU21GUllUcDRqazhVT0M2MmhMRkNXc01nQzFPREVYa2dmeS85UFp4?=
 =?utf-8?B?N0ZzTyt3ZGhvc084YjhMdXJRcURDMXYvazNtL3ZSSlFhbnU3WlRSRldPeHNk?=
 =?utf-8?B?aHRNcFY1QzdldUZXOGduaEYzNjRQTzFyV1l5RTdGWlpQaWNBWEY0VnhpK3NZ?=
 =?utf-8?B?WEVsNEpEQmk1RWxJTWRFOXpRYTJPQ1ZHaHJGdmhrc0oxc05yKzZvdTNWV0lK?=
 =?utf-8?B?UFJFZnBxdlFoV29tZmFEcGpjaTlrR3hVQUowZ1FlTDVTYnlSYUI2ZkdTVzN6?=
 =?utf-8?B?VUpuVU5nYm83MjdOdzlwS3RSUVpQNUZHQkFvNThVeTBJRmJOM2tQdzBNbWEr?=
 =?utf-8?B?RytWcjE1cTJ1b2c3VmJOalk5a1MwYmFXZmhYZUFKNGwvVzBpU1E2ZXpIeSsw?=
 =?utf-8?Q?et9x5298cbFL2uKxPOTsqFeUVWmDH0rpUF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f95ce0ea-efbc-4f46-9efb-08d8b976b386
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 16:57:54.4237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71IFZWOAXn0Gp47atYz9oqaPa6R9pJO+fvVv0beqN4aoWlB2aJW+Rn8eBDpu1eWnVAYgqpd40OMomKhpCc+Q9xiC/CIcbbQIRXF5HESf0fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5111
X-OriginatorOrg: citrix.com

On 15/01/2021 11:56, Jan Beulich wrote:
>> +    /* Grow table if necessary. */
>> +    grant_write_lock(gt);
>> +    rc = -EINVAL;
>> +    switch ( id )
>> +    {
>> +    case XENMEM_resource_grant_table_id_shared:
>> +        vaddrs = gt->shared_raw;
>> +        rc = gnttab_get_shared_frame_mfn(d, tot_frames - 1, &tmp);
> ... this will degenerate (and still cause an error) when frame
> is also zero, and will cause undue growing of the table when
> frame is non-zero yet not overly large.

Urgh, yes - that is why I had the check.

In which case I retract my change between v2 and v3 here.

> As indicated before, I'm of the clear opinion that here - like
> elsewhere - a number of zero frames requested means that no
> action be taken at all, and success be returned.

The general world we work in (POSIX) agrees with my opinion over yours
when it comes to this matter.

I spent a lot of time and effort getting this logic correct in v2, and I
do not have any further time to waste adding complexity to support a
non-existent corner case, nor is it reasonable to further delay all the
work which is depending on this series.  This entire mess is already too
damn complicated, without taking extra complexity.

Entertaining the idea of supporting 0 length requests is really not as
simple as you seem to think it is, and is a large part of why I'm
stubbornly refusing to do so.

I am going to commit this patch (with some of the other minor adjustments).

If you wish to add the extra complexity yourself, you are welcome to all
the unit tests I put together which exercise the complexity, but I will
not ack the resulting change.

~Andrew

