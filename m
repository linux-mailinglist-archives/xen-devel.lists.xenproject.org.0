Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6283F3F9AAC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173705.316914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJca5-0002nQ-2G; Fri, 27 Aug 2021 14:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173705.316914; Fri, 27 Aug 2021 14:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJca4-0002jv-TL; Fri, 27 Aug 2021 14:11:40 +0000
Received: by outflank-mailman (input) for mailman id 173705;
 Fri, 27 Aug 2021 14:11:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4Ba=NS=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJca3-0002jn-AX
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:11:39 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1503d5e-0740-11ec-aad0-12813bfff9fa;
 Fri, 27 Aug 2021 14:11:38 +0000 (UTC)
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
X-Inumbo-ID: b1503d5e-0740-11ec-aad0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630073498;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WEdWqpK8C+AkptAg9G3Bnp0MzbqZWft+tXejkmoKH0M=;
  b=Py8paMky6gpg/f9Q1SJtjtAl/vYiXSFQFEQbhzNx4nvsmRaiwtblenr5
   D073OoYFD9ErCksBoRxQKXxfPnalQNQKiChe73stzSS5534qsxYbO6H7l
   ZTNHWNGx6KRfDMIDaFK+fX1/vN2dF1s9PFTrF52gU6KlJU+UZlCfmF+u7
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CuadnjwJkXRDPpK8CHPAE7rvFF9TxyeINjdf83Pogkv/T43iUoZaLjfiD8cRx4lxayiw4VdT9I
 hdBcplPe3Oc3oLjDaUIRxn1Zryux7FiWVexEJPUDoQnvHUQNK2/PvZqze4AlPynx7L5Or3Z5iM
 UTQvbJhmaHGPQ4yrt18u0xxHxZiZP8LomV9A0ZgU+b8mUFeOWKR+ulaWE+ihned8UvoBQ60aBh
 BzBWEAcUye6xtpiS708fs7dqFERpghe5K8XdD2ga7WPAjUCJS3wQ65ZGkfpGGxBERXWXWur+NE
 79s4AsR3s3YhhSwOAq+x6z2d
X-SBRS: 5.1
X-MesageID: 51443229
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IAh31qF1er54Mc5RpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.84,356,1620705600"; 
   d="scan'208";a="51443229"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYGba16iAjUtSDToVfjZVAINPnsBeYZwyacVu9nirTVKNobHoQ+ifOeE1U/n1QX7a8yo3DKLNv3jF2vfGiM364akdrfO9zZBU7BC4hiyqEHse/JovEXn2CtqyptgMxVnF/vp7Cr6tW5iD54ZShuAcoqTKSy5s3MYPN+cJBcuIWgcYrJsh2Sq2th0bQwLt7EqMCPg5L8VqFdUJN7Pz/GQNBdewyih3GefrFUuGksH6IbW5i2SUysoFEZWeVkS6+FcXWSi3ieQboxo1/aQ3gTNcxdnW6TCJVcjqlzkc7kYygIKLzZJfkW1Hll5bgGSe0cKFK1Hz3uGF6mThYWyZqocQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Mqrkah/0CpO1s5pop6urhDZdZNvHIy8hXn4h4jrE+4=;
 b=SJD6O5tlUcPjIbyG5C2lBrhVuqvpyz8VrHIImlXFBVYnPqzz5LG+Hh8QWKPKL6EK91dfCzZi5t/iebXVuvRNU+lXbCDGMjIAiJhns2Bqt+K6FLUTlHGLzPsCQ3vXB5jidZeAofFurfeqh58zQj6p6/DTdB+sW8WLFff5tURlA8QEz5Gr+N1JeJuezO+mirVoIuUdUynPGABrz+uLWQdO4LehK04NOqyZmOtqAtiVTJvNaaugN2t3jmTLtko9wD5+InmlEbp9M5W15djsBmewKdJWkewybBiI8D69yJH2lrKIu4ZAEJMXy1FyO2XArGpwYXv80E0iv0uBpGVe60BYRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Mqrkah/0CpO1s5pop6urhDZdZNvHIy8hXn4h4jrE+4=;
 b=I/S5aVN+qJlfMalyLn5zlCamXot2DICnA8SHBlLnqjVSWiJ2+8sPETvpm9oxCzsGIPPKSDaF3MDETtjqek1MlrJKYvDQ1T+m/toxB8Ncz+3eZCS9mKcS0TYxzKHBP0AA9PnT1Z7qxjD6zfq+leUzW4luuE4gEzPHlKdUcoDlwHI=
Subject: Re: [PATCH] xen/domain: Fix label position in domain_teardown()
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210827140108.6633-1-andrew.cooper3@citrix.com>
 <71fe27f0-7aec-03ec-1628-531c13f92357@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c6251c5e-c118-e69d-fd6c-6a369141ce3f@citrix.com>
Date: Fri, 27 Aug 2021 15:11:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <71fe27f0-7aec-03ec-1628-531c13f92357@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::30) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fe1d8f5-23a1-4c1e-c5fd-08d969649273
X-MS-TrafficTypeDiagnostic: BYAPR03MB4679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB467996D435341EC015F62A18BAC89@BYAPR03MB4679.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K6egGOoCwx03VKd/4LxlMDq1lvF0pKgqCPpSmaVd2k94ygI/giSo2db2OIHOEQAFll3Y6419y2JOrPvZCZDHFNGJbsUTepJbdEiI+SNF3OV5xYmhru2JyC38DH5EjW5wfd87AT1DDo8shjyh3YjRPkb1Eq7yRfT8JVcOjcPw7D0nVtMh5nVNGvQLzNJsDLiyZHQOMLiRz76B2YCVOKoYaV8py8xbSQ/kBONy2Z1EcrxbBmIxsY8tro5Vc180Dq+5lQc9jSg197d6wIZoAhR9VAecZsbyeeNxI2LTh8hNMOIEfQmq6dq6wA+lGMx1WtIHHwYgMx8Vzs1Duvy5VkqF7UssXCK01aML7xGcwSD6ff3DqKzVnGJovRupN5hbdxkoHURvQV+LWHvtJkQLvevuaQPEpfLxCMUYQhwXia+Vk/SqNa2bnBCsXy4Q/vYzm4K2VUl4+XgJ1U3J/mBSYmbGQWhlBesIh+BTv3mo9qeCmg8Qs+JU+tBAoh7tKrPhOHHTXVjOVlDRKh7ocxP8YhMkCjLttMMGsuPpgd/mD8woeMSkJY8MzeVPMbxLPahCUZ+s/kRphHqf79famjz1zaFExIr0M6auJ2+XTPHeJcpDBhIFKQ+phn/8iZOGypfIyrfdJ6IAnjUn8R3OsqZlPVEMJobsT1jRGPBDHUzkiJvgKVRNPyeZBwJ+aSjKFo+Lk90kLeOV/KprPRmbEGtO5X/qXsvO3FN8/+3IQLBJO0X+a9k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(6666004)(31696002)(6486002)(83380400001)(31686004)(36756003)(4326008)(86362001)(186003)(26005)(8676002)(6916009)(2906002)(38100700002)(8936002)(478600001)(53546011)(66556008)(956004)(2616005)(55236004)(5660300002)(66946007)(54906003)(316002)(66476007)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3R1QThxL014Ry9rMzhUYzhNdXllaE1KejJrTXpYZW9ZT0tDRXpFQW9aVUpU?=
 =?utf-8?B?a0dZc1JlSnpKcy95UGp2Z2ZFRVY0STJwaU1KT1RFU0lMZi8rS2N6bnBaSWhp?=
 =?utf-8?B?L1BUdGI4cHRsbWg2dXB1WUJSZmtVK3J4NnB1QnpPcFZMeEovV29qdWtMdThV?=
 =?utf-8?B?YXhiajJwZnNDUEJWUm12V014Y0o4Q0JWa1dmeWN6dVlLOHRrUUNTVytGalU2?=
 =?utf-8?B?VXNnQU5OSjkzc2dUMXpQbDRnc0ZqbENQOTdmamVPMmVDYUk3Zkk4c2FOT3FL?=
 =?utf-8?B?SFFwbHhmaVNCdGFnQ2JzVHpDc1Z5cUNaTWErbzM2TVpKUW8vQ3ZlL3R3WDRR?=
 =?utf-8?B?SGVnbFo1aXh1TVlSbGhoWHRpOVYzdTlMbFlYbFNKRS9kYTdGQytxbWVWVjQz?=
 =?utf-8?B?bktGa0x3U0ZHOUdJRno5WkpwcFQ2Vk5xU1Y4TkpxUDhWMFhFS0puRDVSOWJt?=
 =?utf-8?B?RlU3NEZacEtZYjRhQyt4RHNCZWVQUDlVU0w0bmwyYWhiTHZhbUh3T0U0cnlx?=
 =?utf-8?B?N0RKQkEvSDhsZjhKaldVVUtkSDlGL1g4bXJuVjYyUXNoY25KNkE0MjFIN0dU?=
 =?utf-8?B?OUljekd6c0dIdExEa1NLUFhWWGg4ZFJxZFdNMzF4NUFWNUZlTW84SzZtZmxt?=
 =?utf-8?B?eDJLeXhmUjRrK2JTeDZOY2V3V1BnOHFSaXovQ0pMSFUySVUwaEkvSmRvMjlO?=
 =?utf-8?B?S0JnMytYdFQvK1pLbEY2VDJ2ZlEzN0RmVDNkWnpsMlBqWUV6NVArbzdGRXUy?=
 =?utf-8?B?U3RWcGpWNlZFQmNGVHdSODljYUdCUUtoaHl2cjQ5UXlYQzNzcnhBVjQ2NGRC?=
 =?utf-8?B?ZGZDQjFyVjVDbVZvVUJZMzdVdHpMbHlHaG1MYkxuU0VIcllMZHNQV1Uwb2pL?=
 =?utf-8?B?Zjd0RkwvdTFJcFBaOEY0S21IWllOSHBNcm50MjIrUE5Ib1VVeGkxK1JvTmEz?=
 =?utf-8?B?WWkydTQyTW5QdHpVa29lc1FQL0haREF0VmpZTDVteE1sVHVTZ3hpdjRVUTV2?=
 =?utf-8?B?b0thaUQ1ZlNoWVpYZjRNYUVDVkZTZno4TVdrSFFoQytUaHBVV092anFEb1V6?=
 =?utf-8?B?WUQzYldVYW5VMndQLzlSTXhkSFJ4QTIrMUliYkVhSDhGMUQ3YlJWd2ZuVTlL?=
 =?utf-8?B?MU92Z1doajlxUHR1M25YdWxJSXZ1cTZJN25EdlRDbG5DakpDa2UxY2pUU3V1?=
 =?utf-8?B?RUlUSEZ5c3NaRThpZjBkaU41WlhsSlBPZWpUNVZ0Y1RBSjNwbjRSVjdWRVlq?=
 =?utf-8?B?UmFhRXV0ZnIzT202bndXU0ZtRHFLUC9EU3lqMVpGWmE5MmJOajJhZEhISVFu?=
 =?utf-8?B?RElTNTZhNGJFWE5QTXBRVjJQalNRblBPTWI2YkVFWWF5TmxwcXp6ZUJtQjB6?=
 =?utf-8?B?cTlVOGk3aVVIdHYxdFlKYWJrWlhiZXJNUEFDekMzdmF4dzR6T0tJSW1XWlN6?=
 =?utf-8?B?RitQeWt0NFQ2ekYzUmlYUFVoTjNMMkd6QVFGZ2kyZUpFenNTa01uR1dWdGJ6?=
 =?utf-8?B?ZFN1U3k0d3AvaWJyYUlBbUwxTzJhazFHSUQ2WmVMdmpEbE8wdlk0L2t1bGV2?=
 =?utf-8?B?TFlYMnFLNWxRRENCS3NuZTUwL0dJL01wcUliOEJhWVBuNkxQS2ZxeVdiWXdI?=
 =?utf-8?B?SnduRlVyRnIzclRhVWdKMlV5WURsM1JmUWVWMHZmNFFZTEhnY2VMRHg2bnkz?=
 =?utf-8?B?T29ESmQzY3RBVHlqTnlMMzgrUVdOdjRGcEhxRThqU0EvU0o0UG91aVhvWU0v?=
 =?utf-8?Q?WeMmFuwEJSl+h5ZslL2ufQ7F8RrwcNntev76IX7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe1d8f5-23a1-4c1e-c5fd-08d969649273
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 14:11:32.5432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouYR/Oy48X69f/7FJJICE9fl+HaxjcSUO9s+H2MHwl79FMeSVFh56tx0cyVNmdkNWlTo94r1YhzeOlbQHBmT570m/7O7LhnhV3uU5wYhrIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4679
X-OriginatorOrg: citrix.com

On 27/08/2021 15:07, Jan Beulich wrote:
> On 27.08.2021 16:01, Andrew Cooper wrote:
>> As explained in the comments, a progress label wants to be before the function
>> it refers to for the higher level logic to make sense.  As it happens, the
>> effects are benign because gnttab_mappings is immediately adjacent to teardown
>> in terms of co-routine exit points.
>>
>> There is and will always be a corner case with 0.  Help alleviate this
>> visually (at least slightly) with a BUILD_BUG_ON() to ensure the property
>> which makes this function do anything useful.
>>
>> There is also a visual corner case when changing from PROGRESS() to
>> PROGRESS_VCPU().  The important detail is to check that there is a "return
>> rc;" logically between each PROGRESS*() marker.
>>
>> Fixes: b1ee10be5625 ("gnttab: add preemption check to gnttab_release_mappings()")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> Despite the Fixes: tag I don't really view this as requiring backport.
> Then again it would need to go to 4.15 only. Will need to make up my
> mind ...

I'd prefer you to backport it.  Nothing good will come of having this
difference between 4.15 and 4.16.

Amongst other things, I'm not willing to bet we've found all the long
running loops during teardown.  After all, the gnttab one was staring me
in the face for years doing domain creation/destruction cleanup, before
I actually spotted it.

~Andrew

