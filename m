Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E63D9427
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 19:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161758.296862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8nDz-00055x-08; Wed, 28 Jul 2021 17:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161758.296862; Wed, 28 Jul 2021 17:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8nDy-00054M-Sg; Wed, 28 Jul 2021 17:20:06 +0000
Received: by outflank-mailman (input) for mailman id 161758;
 Wed, 28 Jul 2021 17:20:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1ltT=MU=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m8nDx-00050O-SP
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 17:20:06 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fb3e5aa-d38d-4aa8-915c-590b5f69682f;
 Wed, 28 Jul 2021 17:20:04 +0000 (UTC)
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
X-Inumbo-ID: 6fb3e5aa-d38d-4aa8-915c-590b5f69682f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627492804;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aESIgYl5RkyukkPyd6SQZJEdf3h4ujcqBFpOv/NYrqo=;
  b=bTfDTU7qwldcO6Z8h0w8RhaUcnP2UDSehWZep5FDo4P0NVXFlAicrU8d
   A7u9UgDzx8uQQNoTK9rtp69QlaHKd/dTUii68dy0V44f89KLdmcAsU6o0
   QAOEAooGnPCxsulpQXSDpXDUipj5zqf/4t1GkznM3ESa9oocyGNHqHc+f
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: N33zesdd0XuSe4ETvDVUK2rafuDaZBWIYNShFY6EPGC6yEBK0KRAZkaK88kzcSiUT0Gx+8qbWR
 LRAsubPMK4StrCmn8OJWE5CMtmpJ74lBQE3tS0oQotgmhZ7PeVe96GHubFILGPQTEPqV1wa1OR
 PxKQg2WXlpFQ8i4kf7KB8XtBsHJ1rGa3YEhhfGEEwriZzKeBTyKqhHP7Rh5fSv6NfHrGg/7gZV
 ff4xyx5Kjqql0H0NsumobJHeepbSC0rqgwe0mLOSCW25ofcn2s7hr8QX19WD3aCDqG8RPc9oKJ
 zJ0POtyFMzJNcLm8cqkKkmCj
X-SBRS: 5.1
X-MesageID: 49676814
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:krdOVKi1nL9MB+o7yKuOGOGV1HBQX6F23DAbv31ZSRFFG/FwyP
 rOoB1L73HJYWgqN03IwerwRZVoMkmsiaKdgLNhcotKOTON1VdAQ7sSlLcKrweQeREWs9Qtr5
 uIEJIORuEYb2IK9foSiTPQe71NoKjlzEnrv5ak854Hd3APV0gU1XYeNu/tKDwQeOApP+tdKL
 Osou584xawc3Ueacq2QlMfWfLYmtHNnJX6JTYbGh8O8mC1/HOVwY+/NyLd8gYVUjtJz7tn23
 PCiRbF6qKqtOz+4gPA1lXU849dlLLau5h+7Y23+4oowwfX+0KVjbdaKvq/VfcO0aeSAWMR4Z
 zxStEbTp1OAj3qDzmISFDWqnbdOX4VmgHfIBmj8DreiP28fSk9DcVZg4Jfb1/212oM1esMi5
 5j7iahrJxQAgrHnCPho/7ydz8vuHaVjBMZ4LQuZ1o2a/pDVFaUl/1DwKodKuZwIAvqrI8gC+
 VgF8fa+bJfdk6bdWnQui11zMWrRWlbJGbMfqEugL3d79FtpgEw86LY/r1rol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdDv6GyWrKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFFdVr3Q7dU7iAdCHmJdL7hfOSmOgWimF8LAV27Fp/rnnALb7OyyKT14j18OmvvUEG8XeH+
 2+PZpHasWTW1cG2bw5qDEWfqMiZUX2fPdlyerTamj+1v4jcLeaxtAzWMyjVobQLQ==
X-IronPort-AV: E=Sophos;i="5.84,276,1620705600"; 
   d="scan'208";a="49676814"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhSjVQGz7gRpLN0YfxvAc9VyuCQCUJbkPZZ51VSgj4DNlMkhp+CmtdXlvJV7MIrNsyRIn8p8+aAeGcHRrMES707kh4oYz8fpzJ4Y+eHkkMtIH5lk9Fcyn5iZ0m/W178J17kmYckM2EhNPfJc9TM3IHQSRpbuWm7nbPlGBBTtjuMXAq25qozNiKLbG38fmkhUEibM7Lq3F3YFRAO/G2vFUWsyMft0OQKhTxyJa+xcmJWv0wtRaBfTf+7bogj3XvrKrPF0fOPMUtYLhtnqO/F4/7mfLu8jSV+XpK/qOzPL4YN+WvSKzTx2GohHEYnRqszPWwpulbV5Qbi1sYfiPqSDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpD/u0stljuACje8jkhoC0jvXnWfpDWm8aFuDyMFUKw=;
 b=LO+Sr1TpLkeA1rSY5aj518KMGfROdT8i4RncxOD4cZ2PnZ6jRFxCiFQM4D/N19dHEsVKMmMIMVlYhTB2RFmP5kCqpw8OUVG9dDky8djfkQ0rL6J0VDUijlJT3Y3OeD0lEepcj9GnGENIwmp0gNiNFH2DIdRGRym5hN7zoJpOWcb4vO/nay7lZtlYjUZIP/s9287qXtNH+cHh8s+eeGgDOSjHARkUREXtXF0Yc0OZ2Dk9rcFl7AFI5R1B0RETNv5UoXj+QVEIfFgZCSHEMmyIu+Mc+SKRE0GljpDJ5GaAoUgJynlR+KekNt9LGbtTAV8VJ/l4xWKE8Rse+7L2TnWd4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpD/u0stljuACje8jkhoC0jvXnWfpDWm8aFuDyMFUKw=;
 b=dA7iLUQF3MZRnll/5H/diYEYFGnjMRMnjiVdnwagdB5UvilCgxIJywzCjyIQJwUh1RU3ucCGN8DcGVlptCozV0YgKjakPnXPF9rWaR5QRNOUvTA7uNNFoXf5olOfHnfUQf26QTp5PCfyUxIag9mz+lZ4eHr9E9zGLxbdGJt1Y8g=
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
Message-ID: <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
Date: Wed, 28 Jul 2021 18:19:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0117.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ad40eae-ab19-4dff-0c5a-08d951ebedab
X-MS-TrafficTypeDiagnostic: BYAPR03MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4168E4692A30E64FCC952E31BAEA9@BYAPR03MB4168.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DfDBqjllj/G8UbOktCBz7Ojl+gh798H89odFQ1nnRljpFppo8hwaL8BT2aZ2bL0u1Yn4X7xNk9uuZpzfHurcEGAj79A2NvHPOo6God7lPpGfbEPYhuoRsu96nwYlewSZvfxL4+qFbIGnuJl4vuZ70WvSeeAWtfMFl9J+gh2+K4kdm+5J7JanXCXkS8OMdaZs5FVVsWq2aXp7LQElzlrJZAGh4vZsONP0uSHG1dtJ4HPfij6h/rAYNXG9JnQvEL+gUcUF2hk7UXpGDjVI0ceWWMRlQVWfbYLhDE0r7GFE36G+TxL/5FAEBKwHsESXcEaRgCjJ4Zwt8+kMuVpS+2UeRDtoyBR6c8qM7L5nsV5EFpD+kRiiTKJfjTY2xIjSmZX/HKrpuR9aJNvNXDEa5m1mTUMEVyzIHt+cRNdNPe3wnubJUlAkS5qJvpt44HxoBOk6XonhgLmeNacCGzZz+ENENg46eMccYN+lpRMkRHIZZuZCgPM6pRKWBhBkxzbJjllZRW+RB/DfO8/FAjXXEoNjReLvNCtQ38CpTrQ79/VRiiKOSkK2WyarrvmwP/8isQuh7UBem1I2maNGIbywlUxbOgX1BwMgH31i/Mz9VlNNTZxuy8/MbphEP2knd7pZJot4POqPBlkErXHzzS+B4NC797aIXwchiJaTd1v6fPK6Z9zQG27Xb5yDpvBv3/s+bbBe+jwwrqNppY1MD2Cg0acpxJLAeGmWfcW+EnGgKF6Trrs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(38100700002)(66946007)(4326008)(186003)(54906003)(66476007)(66556008)(36756003)(31686004)(31696002)(26005)(316002)(6666004)(478600001)(8936002)(8676002)(7416002)(83380400001)(2906002)(6486002)(53546011)(5660300002)(16576012)(86362001)(956004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2ZrQUtHNStPU3BPeFRvTDNsZmZlVTlFanZTTkpnMkpGMDlHTUhiQ3pzMmZE?=
 =?utf-8?B?YU54SzhTWktodVNsNU8ybnpaT0w5ekdIazluNXE5dytqSTVKcVI0UDVrd2hR?=
 =?utf-8?B?VGxrcEdwVlp3LzdGOHRDUlMwMWZxUndsaEFvZ3IvZUltbmxYa2FKZGd0djJY?=
 =?utf-8?B?b0dDdUZ6dmZSMS9LeG1UNThUWVlwRXBOK2tsaWRmUGR0aE1ZZ29sUHptRm51?=
 =?utf-8?B?ZEV2ZERVTjNIY3hvYXVCcXpEUGMyOS9mSlZpdnNzbjZuSlI4TC85ODN5WEVN?=
 =?utf-8?B?azRsc1dRcWxMVG0ybDJGUWFGNEZPcEtjY3FTMGdpU2pka2wxa0cwUWY5VTFN?=
 =?utf-8?B?NzNuQTdqZGRQY0hMd3p5MUJZWlQ2bWUzdm9aUGxDUUJCdFl6eWxYRWhCSHRR?=
 =?utf-8?B?OEZObFJLV1N2R1JkVGFZRnNxRjRFRXJNMlVTTEY5ZkZ5clFuYWRURGxqcGNZ?=
 =?utf-8?B?eTEvZXRGUlBwaENmTm4ySGdjdmt1MW0xNDQyNHVpd0N0dDNrZHdOcTFpZTZL?=
 =?utf-8?B?RFdKTnV4VkhiQ1p5Tzg4dHFxQ0lZbFE3TFpVZzhSOHZOTFpkZVdGV1F3VURj?=
 =?utf-8?B?VHhrbUoxRGZ0NzNCYkpubjVaY1RwUnZ2RU1TelJYaW82VFFSV3gybDVCeGdH?=
 =?utf-8?B?RFpWcy9UR2haYlIyalZkNVdJbUxxR2dmaVNwQlhxak9CZmIxM3RHUVNKSjNx?=
 =?utf-8?B?SEQ1T0J3RCtUVE40MC94cnBXdk12OThTd2lmaVZWUkpiRElvMmZFd3VZbXQ5?=
 =?utf-8?B?dythd1FDZDhVRDVxbVdGc1NkcFRtMHhqdXkrSytPSHhOWGJ2VmxMWUw2NSt4?=
 =?utf-8?B?VlVvNFAzbFNidit3Z1VRQTJlSHJ5SW0zNkJOMFdYYnJTMUlMTngxMUNIR09i?=
 =?utf-8?B?SjJSbC93WllwOUFPV0drZHdTWjAwNHFQSUpVNksvY1VpOUFkaEF4YUU5UGFC?=
 =?utf-8?B?ZWgyaTBuWUlJZjZKdXZ0cGs5OWlaUTR1MFlQamlRR1c4L3FYY1M0L1ZCaEZL?=
 =?utf-8?B?RUxmQzhGTHI1djgwQ2UwMEE3TzJNZ205cVpmOEdodjdCVUJCUjEzVEREZzJF?=
 =?utf-8?B?eEpOVFk3d1A2TTJjS3NWTnVYK3NkTlE3QWxKZSs1ZDdmckZKLysreDJhOCsz?=
 =?utf-8?B?VVdhV2pvdjVKUnVTUGVxaWErKzQ4MGJQWGRMb0dXWmc4UkZSSUsyTDRlM2ZP?=
 =?utf-8?B?azNUY3BXaGxqaE8wRnFmYTZEL1ZFNUFYN2tIMWwxaWE2VExrVnJTNVd6Yncv?=
 =?utf-8?B?c2I1Mm5HVGJNNTBON2Y2Y0ptczUwMkpXWFpCQ3VrcHdkOE1rUjcrVFVnMEtj?=
 =?utf-8?B?ZWVJTmZWUzFPSHlLY0hCYU9qc1diOFQxZVhmVXBnTUlBbDZCM2dNUENjeEsx?=
 =?utf-8?B?MGc3QnVkeEJpUGorMXNUbkNTZU5rTmQ5cnFWRk1jM3k4QWRwWTNqOXBFRVlF?=
 =?utf-8?B?STJyZUVFRmc5RmxjZXpDNm5TZ0RzOFJpVFIrY2xmRlJvZkh1eWI5c1RrSTAw?=
 =?utf-8?B?U0ZCUS9ZaUViS0JyOCsrZ01iWTM0NU8wQzVIeG40eGhYaEI2M2tKNGM1R1Zs?=
 =?utf-8?B?QXZta0s2ZFd0dE9LTFBwbUxLYml1K2xzOFhRZ0VjVmhxRTFpSC9CVU1PcGE0?=
 =?utf-8?B?a252cG5PNjMyVVp4YXJzVzZnM2NGbDY5b005RjNPRVpzMjlFcVEybGZwdXpX?=
 =?utf-8?B?ZW54UTh6aVF6ZXU5QVY0cXdzZnh0dHpHTzkvY0k1ZXlmSlVVWFpJa3FpVjR0?=
 =?utf-8?Q?KS9CJ89If/jvtxeO3JmINZ4juOR+COxXHYg77xg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad40eae-ab19-4dff-0c5a-08d951ebedab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 17:19:59.8908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlWxAGeMnxAah4F+vceKEKu/9GzdhJpaDK3xq8R8p+mJmAKwVeDVrHR6kJ4i+73Ff+ijppwFHm8yaRO9kLDtOM3FknfrGzOqj8FKXy0U3DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4168
X-OriginatorOrg: citrix.com

On 28/07/2021 17:18, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Add XENMEM_get_unallocated_space hypercall which purpose is to
> query hypervisor to find regions of guest physical address space
> which are unused and can be used to create grant/foreign mappings
> instead of wasting real pages from the domain memory for
> establishing these mappings. The problem with the current Linux
> on Xen on Arm behaviour is if we want to map some guest memory
> regions in advance or to perform cache mappings in the backend
> we might run out of memory in the host (see XSA-300).
> This of course, depends on the both host and guest memory sizes.
>
> The "unallocated space" can't be figured out precisely by
> the domain on Arm without hypervisor involvement:
> - not all device I/O regions are known by the time domain starts
>   creating grant/foreign mappings
> - the Dom0 is not aware of memory regions used for the identity
>   mappings needed for the PV drivers to work
> In both cases we might end up re-using these regions by
> a mistake. So, the hypervisor which maintains the P2M for the domain
> is in the best position to provide "unallocated space".

I'm afraid this does not improve the situation.

If a guest follows the advice from XENMEM_get_unallocated_space, and
subsequently a new IO or identity region appears, everything will
explode, because the "safe area" wasn't actually safe.

The safe range *must* be chosen by the toolstack, because nothing else
can do it safely or correctly.

Once a safe range (or ranges) has been chosen, any subsequent action
which overlaps with the ranges must be rejected, as it will violate the
guarantees provided.

Furthermore, the ranges should be made available to the guest via normal
memory map means.=C2=A0 On x86, this is via the E820 table, and on ARM I
presume the DTB.=C2=A0 There is no need for a new hypercall.

>
> The arch code is in charge of finding these regions and filling
> in corresponding array in new helper arch_get_unallocated_space().
>
> This patch implements common and Arm parts, the x86 specific bits
> are left uniplemented for now.

Leaving x86 for now is fine by me.

> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 0e07335..8a70fe0 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1635,6 +1635,24 @@ unsigned long get_upper_mfn_bound(void)
>      return max_page - 1;
>  }
> =20
> +#define GPFN_ALIGN_TO_GB(x) (((x) + (1UL << 18) - 1) & (~((1UL << 18) - =
1)))
> +
> +int arch_get_unallocated_space(struct domain *d,
> +                               struct xen_unallocated_region *regions,
> +                               unsigned int *nr_regions)
> +{
> +    /*
> +     * Everything not mapped into P2M could be treated as unused. Taking=
 into
> +     * the account that we have a lot of unallocated space above max_map=
ped_gfn
> +     * and in order to simplify things, just provide a single 8GB memory
> +     * region aligned to 1GB boundary for now.
> +     */
> +    regions->start_gpfn =3D GPFN_ALIGN_TO_GB(domain_get_maximum_gpfn(d) =
+ 1);

To drive home my earlier point, this is racy and cannot be fixed in Xen.

You don't (and cannot) hold the p2m lock until the guest has acted upon
the information provided, so it is guaranteed stale by the time the
guest can inspect the results.=C2=A0 In the concurrent meantime, a wide ran=
ge
of operations can change max_gpfn.

The only way to get a value the guest can use is to choose it before
hand, and have Xen enforce that the nominated range(s) remain safe.

~Andrew


