Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5105D30906E
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 00:05:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78571.142990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5cpj-0002b7-7Q; Fri, 29 Jan 2021 23:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78571.142990; Fri, 29 Jan 2021 23:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5cpj-0002ai-3R; Fri, 29 Jan 2021 23:05:43 +0000
Received: by outflank-mailman (input) for mailman id 78571;
 Fri, 29 Jan 2021 23:05:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5cpg-0002aW-Vq
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 23:05:41 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d6cbbc1-45c5-4958-b245-009e35fcd7b4;
 Fri, 29 Jan 2021 23:05:39 +0000 (UTC)
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
X-Inumbo-ID: 9d6cbbc1-45c5-4958-b245-009e35fcd7b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611961539;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vKpbeZol6SMxiPszJgGOcP0G8cllNe+8ynG2DFmutWE=;
  b=O/NflPXbdyFzof64OraeFmtcRJu5DEIJp5wnvvztoJZgOrwyEL2VW12n
   Mrmfox4kTU2RyPP8uNzpU843c8mOcjecNCl6tiBo6QSFW0k3AhV8OzXbZ
   Q388o9hm+DuvcoY+NFHCsIo8GOaW5vJ++ZI4zElXus6E9W5cWgICie5ZD
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: opinFsGygOKMs5DSYkQUf4Av8hj16tJeeqcEEzSFBf501Ehc9dNeGL+iBVRclaqrLueAAawHyJ
 THhTFHhSFr8wTE+/wGfExpb7kVFmJYwUaZADG5ubRP2/jOoEFv0+ojgpemtphKOzd7M/9n2yqF
 FhJxWlh8sNF7q3e4fktpGd44KEruvbfW3MrwuaILpJEGB5KyK8JjTsiHZHKZTEUJHxWvxKkrQU
 eWHULtPlIhuQWuBuL+mnpfmoZmEMDJEJyFppLwiRM8gRprMedmBonKwzkXXlejH+Zy2tEEReMD
 XUE=
X-SBRS: 5.2
X-MesageID: 36189689
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,386,1602561600"; 
   d="scan'208";a="36189689"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lB0nEsNToeVse6sqMsdcLw648VS9fr+JJG/ricVs2VpRDuIuMzPILn8Ka2H/1GZg9EsZ1bnyqp52JTM4s+dDp9X40v68u2p2Tp//j/frOcyEgYF2T74JZDSVCCaP2R9P/KijIG9iegABlqgVR+auVc7+KDW5YOctViY9GSgajKXW2adu9Zl0tkJiXZP/yMD4SjX5UgvVwmEpgZjfzkfQPnXUKiXatn0EgIC6DCLaamFI+TjFjm2v63Mjdk1r5lvr9t/gBuzRkq4sKb35h1jqQXdezNzNeHn8XGAu6udcncFbmwq9oq+JdCH+KVTMjx2YGWiiGVvPWQsv8Yq2d+NXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKpbeZol6SMxiPszJgGOcP0G8cllNe+8ynG2DFmutWE=;
 b=gNtWYymF2jTAloaXaK54FGHNmjyrNKeZPnwTCE3x21j1ku1zUFS3IN1Oo6f4ZhEX+AQQL8xgB2iYJ9jin7taI6ygrUnwcUhYsy4hMGpKD6+XkybUtSdcfZqsZfRVM8zfIc/KysrwcfJweO/i14tWviWZFygcU2PALj5EqzFnv+tv+9DGPs+dDTfVllu2p1K1r9X/0ZiDHgbreETcteps1sdnoXQWiLJPk69Ubr6HiFHdk/wdg5LPmeFEFzqLxyJ94YiAul/I+1LjVn+VEABCHA7vZY0g7P+bjJLPOlayTF/i5KuIuRIVOTMxakUSVlhK2mxn3vANP8xb3mKwHO4gKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKpbeZol6SMxiPszJgGOcP0G8cllNe+8ynG2DFmutWE=;
 b=K0F0w41tJub8Dr6P9uyiAs04fW2a8Q1rPKMGrDkzs2q4AWi5SWtUFqnS8nDTgmVbHWNtJuIMT7wUKIJrC0xSyHUBuQMF1ybPsnn5m2p75otlltXNTdZmU7VuMsoZwc013NQK4b+tDdOpNLVpwPDYvObVZCi3w8D1ocLyMEmWhAw=
Subject: Re: [PATCH v2] libs/light: make it build without setresuid()
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-11-bouyer@netbsd.org>
 <69db20b1-b464-cc6d-3b26-711950cc81d7@citrix.com>
 <20210129230110.GA3543@antioche.eu.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <effea1ec-8f2e-7cf9-267d-8369e4d84701@citrix.com>
Date: Fri, 29 Jan 2021 23:05:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210129230110.GA3543@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0303.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::27) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 625df12f-e916-40d9-94be-08d8c4aa6010
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5568:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5568274D32E9E78DC27E3461BAB99@SJ0PR03MB5568.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VPzfx2LUybBD14H/vxyvcyrvOBklZFtHNQT6iRHwIMHBwUISmsnajXaFSF62I6ykoki+EZoPgLnRb2GLr64tBj1qJoYtC7ERj1r+3m79bfhRMp/zgwTuUXt+GAo2gIzQ3M2tEjibeULDnj2jaAs7mb0M+WNulO7sntUkaXV0kok7ehQ780gEYWY74rnYG86gK/VqkK4qYuNj5vfOtLkjYMq3J1KdLQt6Oz13a2ahEwAuy6M6fGVUHPz6tMKpenPrM+LNcu3h+sh1n+i5XRHmYnciHJOmjEn1NxprXuDqQDQmu8UuSzoD6FLlRPhE4POG5D2bvBAQmBPo1nTcXh82/SAydDLKPcVvu4Bpv2R5YoYrCnc3fYeviq9GR25sRfwmhTVQXxdxwQxKr7JJcUUtj9F3t/8yf6NFQhNIrsjrToGQJfX1Lopcu8+6ks51bv3v5Km9lJeUtbTO4sN6w6eh1Ysm9Ofyhf0POGsUnAVZdFgtxDosZt0jC5adHEAwUcvgcI2EKaQ8/eW8IOmbQo+yjVudBfnIHIvL2l3KTs+MCZuXW6r4A30ITT/xLnF5NtTZ8EO6vzX1wKWeOlKINVPOWU6nTWVclddC7ULOCzaQeIzv4h1JPDpbOOEfumsigrb7nDiqslTonqRD5scOo4YbnAl6J66yZbYwc5Eo5wGQvGzNAJkn4yYKHWqlvVBpXt13
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(4326008)(8936002)(8676002)(6666004)(36756003)(6486002)(4744005)(83380400001)(956004)(107886003)(31696002)(186003)(16526019)(31686004)(966005)(66556008)(66476007)(2906002)(478600001)(6916009)(5660300002)(53546011)(66946007)(26005)(86362001)(16576012)(54906003)(316002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eWpaV25ZbWlpclVXTG5pWlVEcFV0eHlCNUNqckkrWFk3N1FvdVdWY1Eva1E0?=
 =?utf-8?B?VEliRVY4a1dBQThyZkhhZkFRd01CcVYrN1AwcjFFU2tqVDVEYnpxcUNGTXdi?=
 =?utf-8?B?N0svRW4xR3ptOUVWaWhIby9YUExrOEdLMjRuaXM0dTUyNis1SGM4NEZZTURq?=
 =?utf-8?B?cHJUMnRjQnNSUnNza3hsbHlkSWdvRjZHL2lrNGExalJETUVhYkVKb0dkR01E?=
 =?utf-8?B?dWtDbWhuRUFtR0tycUIyaWIva1lJYXNtUmJxVDZUd2IxQmNHRWgrSXFkNzF5?=
 =?utf-8?B?bGhhZGU2RXc3V0d0aWpWdnlxUnBJKzdDUEwrdTZYcTFCYzgwOUh1WWxkTkxX?=
 =?utf-8?B?aXpybHR4UTBOVUJrS29HZHlJMkVYZ1IxWHJVVUg1cUR2VWFZN3R4MHZ4NHNq?=
 =?utf-8?B?SzF6MW41OC8rTmgxc25RS0tzVFVBa0krWmw0c2FPenliaU5TRFJidGYxU3Fh?=
 =?utf-8?B?Rkh2Z1oyNHdxck9UTzJ2ZVppU3BTRFNZeEJYWEJJUVhvSzQ3WWhDTzRxRzlD?=
 =?utf-8?B?ZW5ySkp0akQrTlFlTlFOdCt0WjRLWGVSdUZTd05qdkVhNTZhSkI2SDRlZGgv?=
 =?utf-8?B?VzMyMzFQNnVGWlVZamFWc1hqVmptMzJHSnBya0gxZ3Q1STRjaEVDU2JNeTQ3?=
 =?utf-8?B?a3JZQW5WR2p4SEVSSi9aK3dzRWozbDVMYkw0U3VrbXpFaTV0TkVDMnVCMHFP?=
 =?utf-8?B?TEZlVFVDMkFvdE9wY3ZLTXd0WUkvd2JTUGozMFZ6ZXRMYi9xNlVXYUMwazk5?=
 =?utf-8?B?SnNqM1VaMEZnS3pvcUx4L0pVUzJ6aTlLajcwdi9zTUNobUNWaG9yZTd1S2lV?=
 =?utf-8?B?ckZKV1ZleU12QXkxSU9CaUV4dU9rb3pXRElKaUNrMk1YdGtiek5XQlVVbkQx?=
 =?utf-8?B?MzhDNXBXdFkzZDg5L0dOaVNYK1FsK1RqUThOenB5amt6UElaTWY5bG82OTBx?=
 =?utf-8?B?MVhtWWhib0JOS0V0WjFYRC9XRFpsbzRuc2cxTytUVEF3QWNwOUJjNHYyNFVL?=
 =?utf-8?B?MTEzN3QxTzZVNWxGNXY5RVYyZk4xNTRlYThLRWdKbklYaUJCUUc5VDlicWpZ?=
 =?utf-8?B?ZUVvSXNuSVNuU2ZqSFAzTWVLOXF3K1QzcnlHL0lMbXVRNEtjQUFERWdseHlx?=
 =?utf-8?B?THUyMWlLMGE0NlBSN1B1RzZuRVI0VjlGWEV6dVhvOEFuRGQ0MktUYmIrOU5m?=
 =?utf-8?B?eUQ1WUs3cUJ4TWFyU3dRamcwYUx1aDdRK3VYeHZ3YWVUSmNnUk1pcXVWdlAy?=
 =?utf-8?B?WDErUHBsRGkyNmh1Sjlkc0FqNXVDS1QzTkp1cW1OZDdJY0xOY2RDaVp5SDYx?=
 =?utf-8?B?dk9rTjU4dUMvRXZETmI0QytRTEs5bWdNc1RZaFAzTUtNdzcxYlNKcE00S2hV?=
 =?utf-8?B?K2hIdVlYRFFrTFM5S1E2bTI5dWcxUTVWY3pIRHZtNUthcEEzNUVpNnlGTWhi?=
 =?utf-8?B?WE9EMWNERTkwNWpqcTg2eXRSZVVlbmVRTi9JeTVBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 625df12f-e916-40d9-94be-08d8c4aa6010
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 23:05:31.0217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npWfxUKpPdyGsk8wQfB6NVPlZYkZdv9srXj0bV2r7C5LZ9oOIqKNkbKDzLL+azGCDCaKSv0kPIOf5AcUuOGanqBZkUWTZdcUyCPWENVzWgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5568
X-OriginatorOrg: citrix.com

On 29/01/2021 23:01, Manuel Bouyer wrote:
> On Fri, Jan 29, 2021 at 10:51:14PM +0000, Andrew Cooper wrote:
>> Given the freeze, and discussions on IRC, I have committed most of this
>> series.
> thanks
>
>> This particular patch doesn't compile, but I fixed it up.
>>
>> Still outstanding are "NetBSD: use system-provided headers", the
> I just sent a v3 of this patch

You accidentally labelled it v2, but I'm sure we can cope.

>
>> followon patches requested in "libs/light: pass some infos to qemu", and
> will try to get at it tomorow
>
>> "xenpmd.c: use dynamic allocation" which failed like this:
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/996140268
> It looks like I don't have access to this page, could you share the
> content ?

urgh - have the permissions broken themselves again...

xenpmd.c:115:13: error: implicit declaration of function 'asprintf'
[-Werror=implicit-function-declaration]

It needs an include of stdio.h, and/or some form of #define _GNU_SOURCE.

~Andrew

