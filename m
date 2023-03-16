Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 345CB6BCB3E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 10:43:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510447.788081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pck8X-0005cR-H7; Thu, 16 Mar 2023 09:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510447.788081; Thu, 16 Mar 2023 09:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pck8X-0005aV-CF; Thu, 16 Mar 2023 09:43:05 +0000
Received: by outflank-mailman (input) for mailman id 510447;
 Thu, 16 Mar 2023 09:43:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pck8U-0005aP-Pc
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 09:43:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0eeb724-c3de-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 10:43:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8852.eurprd04.prod.outlook.com (2603:10a6:20b:42f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 09:42:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 09:42:59 +0000
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
X-Inumbo-ID: f0eeb724-c3de-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cACrpsoDDR1KA7fngdU21Tv4aEgry9fkieAwoxaqpByVO/qc1bfEGGzs1KXplWxpVh8huQN0Q7ky+WPbK2qhmDWTQDq0fRK6TTVAzU/ic5vy4V/3LBO19Yb1ogMcbpBvIH9Dpng+xIWtnqTCXG+EafosxPhH4WlwBsZ7Qdf2z+cY3f+e9IzRkN5LPWPdyoh/K+XCyohALWDF+aQNpxBDkCveBLlkSWEqBTAvOcMnfTqkt8bCjkgVoq/vx+qztaWbTAaXt28pJ7WeyOrfAyWnilj+VxrKXXDHvOePPLq0aePHV13Rm/RvVRgUgG2IxxnxYMES7WQBSDT3JLhNKu75TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLhy1bR6bdzsjeaBtMnuQUEBfIN6raiUp6zxFWckhi8=;
 b=Rv9FMVMl1ikdESHC0h+coPbXgMF2qbSPJFpy0LPjVsCDtvT1CPNvA6DBHLvvyDmu8N6GRk/bRF1jb8J4Cz1SLV8SEKEBHuEwflMkRroddbcdusB+NV29WVhv/9BsJvsAEZT8+YB8S9eq4V03/yH/aqzudA7ZIujuCYDCo7YfUbrsSlhqhA1a+n5/zzNEv/BPI2czOETi6PB7iU8NSU+L7P2ML7Ui8JvsIcjXdTYtJH2oPf2Ho//U9LQL1YSagv7cfX3/rCMT1JWy522vXsN75LwRyG8S4eBP3RAiQAtQEAV5WYwyTcPRGF/OOAyp5x+AHWqXt0ih52ZHVcvbO9qiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLhy1bR6bdzsjeaBtMnuQUEBfIN6raiUp6zxFWckhi8=;
 b=So2T85qApzJy6wXKzY9SGsnkir2CpNpogp/UI8+Zr9Xy20G6C2Rt7HFaZAfcdl9RZHWLnSozCkzIllq3dP48NVFWqp8coR6dDKEhu6eaOhBKOTUsFSUfumQF2H6IzQ90OT04uBmGoOz9g0ssmJ4AypE43A9s8ZHVwyVhl1Wl0EkgBS8PeW+cKeyHBC32AU4cs+XzAbixULSy7ycXoA2cqUgCqFo34J+WP4rzmeeXaBUCNDUcC4G23mycGqlAktD4otvejS6kOji3g6EUO4+xTM2UkdYSJQwC+fk0sUjSr9R1nzevCLL1YDGKRrTFJOeVzp3o9SSVwEXtgO8A7rwafw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df607690-0bfb-94a3-fac6-5e20f183dc20@suse.com>
Date: Thu, 16 Mar 2023 10:42:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to gsi
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Huang Rui
 <ray.huang@amd.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-7-ray.huang@amd.com> <ZBHz7PpUbKM69Xxe@Air-de-Roger>
 <alpine.DEB.2.22.394.2303151729590.3462@ubuntu-linux-20-04-desktop>
 <e8843d7a-eecc-373c-a6b3-6a893bc0eb2a@suse.com>
 <ZBLg8WB8HCoZvwz5@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBLg8WB8HCoZvwz5@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4457c9-a2d6-498d-18b5-08db2602d424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JmIfOTE7LEIg/mhVn/CsHrYb0U8BNFsw93g+3HY934EmXvAef9Vrr4c7d5v2rdYrvQQllcwQgdh4NjXNJvcbrN1zQQv8ijaHtRer9njFJXO5kd0QNgFX81DXxuGt+uF6+3CVEKElik28szuox6wiiIVBVSaJS15b7YccnXXWqy6v8A/sm//n82J6Kk2s0aje+s79Q5Ko56XJFFg+FKBLCMid2dJ1JibKJTIIeMmOyrTy7eMQH0EElzWjrjHNPSGGP9nE7MIzo4/WMV5yzXWNOCjobtN9TxcjnTda5LkEy8Udh0YAMqAdAFzjkDaoyQYHrIVXnXAoPgpsxpTG/4jogVObGQ5kLlK1ElP+aug1JrMFBa0TmdxmsHt8sFoJ6yQblPXf57Jvyx+OQF1KaPBjKI0XbqVICgSx8YuX3LapJlSJAq16VzS9fKaLMDJI5+9i4iztkKc+e9dhBkodMNLBM/FmO4/pGX+L7aeQ8wasVOmdBMzCAatS0EuShuw+qT+p+MgpTLDZ32lZUSGEqPqehKIaWehTAlTY6waVWMrKFr405WZ4gbbyIn2DU54L7f6oqY/7e3IPnNLLNq1E7vmjAhW3VaWpJhm860gA5kurOwf4fJ3SWhZCj5K9zQNqBJQSgNxByUhqOHAd517bR25FS0Wr0KQitZpUQ/p2Z54CtNiNn0cLUhrOCaoeFV5JkfvTFsAUkXG973JUWCuwOr/dscvR9IXwUquAG4UGYfl1nww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199018)(31686004)(36756003)(5660300002)(41300700001)(7416002)(8936002)(2906002)(31696002)(38100700002)(86362001)(478600001)(6486002)(66556008)(66476007)(6916009)(8676002)(66946007)(4326008)(6506007)(2616005)(54906003)(316002)(186003)(6512007)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OC9HU1BucEQ2SlNhSGMvc0tlZFRXUWR0dGZhL1B1eHUwc0dML21zQlJNb2do?=
 =?utf-8?B?Z29Namd1aWFuRFdLeWhQU0tWd1ZlNThmTDFSRVltUDd3S2RFVEJBUWhzTXlt?=
 =?utf-8?B?UW9jYy9CcWZ0WWVvRkFuVGs4cnVuN2ZOaHVPak92ZHZkcmp6cUtnakFRUGYr?=
 =?utf-8?B?MHU0VWdWVGtrRHBoRWVQWUJaVHBBdHZ0U2NTUEZrSFhUTytPWW8wK1lsQlE4?=
 =?utf-8?B?cEZuTlNFejhrdFVQUlJNNjNwVGdoN21hV1RnSkNwWTRnWCt0cW5RYVFGNzBT?=
 =?utf-8?B?Yms4MXVZZEtPN0Z3TmNEd29ReHArK0l0VXVSbnBraFB0T0dSVlBJM09EaVpa?=
 =?utf-8?B?TnIvamw5bGowRlVkTHJvTEc2dE05S2YrUkVscERkYjhURi9IbGp5M3VOZFJ5?=
 =?utf-8?B?dW5aMXZtbi9IZGJ5cmxSaGlobktObEd5V1c2NUdoV0pNY1lLZjVueENyQy9H?=
 =?utf-8?B?UFRLbGxha3k4RWM4YWNQWVRHVDdid2xRbXkvM2ZEWU1hRUtzeUI2MThDdXla?=
 =?utf-8?B?blVBbmVGNURLbHU3S0htc3gvS0lhbWpoZ1UwSzZoRml4Rzg0Y3hWeXJnOWcz?=
 =?utf-8?B?NEFqbUtWOCt2c0xQYzhxMlBxQVhzR0VNcFVwdk5kdVVEMmx5V05Rc0xyUlBI?=
 =?utf-8?B?S1FSTlNWWmxWaVh5RExyemRZTk15VjAvRUxOY2x6SWlWRVkrbktJUTEzMitV?=
 =?utf-8?B?NlFuUzBRZFpxTVIzRjAxa25hU2RSWEZrTERoY0s0amlVcFFwM2kxcDJXdWUz?=
 =?utf-8?B?blIvMGRPbVp5Y1RWTTZRZUdHalhEa2RTREN4N05yTDVpUVFxK1lCQ01CZE1X?=
 =?utf-8?B?UnMvbkpoRXZXTmFEbjFMVW14K0d1MXhZaW1ab1lVMmprWDAyanBVbFlhZkp4?=
 =?utf-8?B?cTRPOXFNd2ZrNUVhRGpKcUVoRnZaZmJmU3F5bTVFS3BzN3JzUTJlVFFBdWZ1?=
 =?utf-8?B?dnlFSFlFUDk1U0tlUXRNQUFuMFBUUWx1WTkwbTJEcFdQS3ZkTVEyY00rUVJ2?=
 =?utf-8?B?TVFsMGRPL2ZNVm91MWtSZkxFa1JxS2c1bkFncWVmazIrVjl6SnZxb2p3OVpD?=
 =?utf-8?B?MENlV1p1V2RvVlZOcGVDNk1lUlJvMHVVVG1pQnY3QW5mbktFQ0VuMFF3UjJn?=
 =?utf-8?B?d2JyNjFMMXRyVmREOG54N2NKY1l4ZjJRSzRkeGt5QmhKc0ZwdUR3QlpsT1li?=
 =?utf-8?B?M25WbFJDS1YyblQ0dHhBMHJzNjZvNkdSNG4waVllc0dNR1J4L2pHYUVkV0xE?=
 =?utf-8?B?eXhvR1c3Z3c1bmNsYXhyYzY4WXdxYlZueVRFVGNjYW52d3RFaE9FQW5QQ2lR?=
 =?utf-8?B?Y01jZUdJM3lXaTVyaGFkUm92enZjQjFwa0RkWEtLVnZZWUZNOG56VzZndWpH?=
 =?utf-8?B?ejN1Vm1hdDUvTzROZFY5N0E0cmlwSzQrdy81ZTRuSXJDb0NROTcwK2wrWHNM?=
 =?utf-8?B?VGpONlFoWWFsQ21NN1ZYdHIvNW96V3p0eVVSdWE3VHltSjJ4UHpDK0VwaWJU?=
 =?utf-8?B?eGkzc2NFVXVsS1F4ckcyMG1BN1YzWVc1M0JadG9lQ1FlTkVNOFQ1RGlDUWNp?=
 =?utf-8?B?MW1TQXAwcGsvQnVML1NGRGdDYnBaYjlydXN1a29JckNFNFc2dGpUT3RWc2JF?=
 =?utf-8?B?a25CRHJIRTdqQkEwZVFuOWdKRlAwSzJxVVAraXdjdVpWSFhpZFJWNk1oYWhL?=
 =?utf-8?B?bmtpZDRidnhzVUE5V3hlSUtkSjNPWWpDWjc2TjkxWUduN2VocXhsM1I0ajI4?=
 =?utf-8?B?bFhIRUdMTXREWWJhWW4wS2dZNkcxVmU3M1NQRHZ5ME1BM2tjQUluK1Q4ejJH?=
 =?utf-8?B?OUpmNDEvSExRS3FHSklrZmpIaVoyejFWN2hBRGlWeFpjaEtLVHREZDBwU1FG?=
 =?utf-8?B?Sk4wN244L3FkdGY5US8wdEo1bDdCMG9kOFVHa1VDYjJPMkJNc3ZIMUJWWXdm?=
 =?utf-8?B?MVEyMitBY2lpV2tKMS8vM3ZMRFBoWmFmK3d0cXFaK1JIaFZ6ZjdrTEV0OVJp?=
 =?utf-8?B?OEhtTFg0Z0F5RzNzeWw1OXQ4UzlHMWxvKzUyQ2lWK0xxa1Z3U2Y5WVp3ZHJR?=
 =?utf-8?B?dDJuN2dwaTIxUnBXbmFHcmJtajlPQWFoaGdLOGluRFdXUzYvWnNFbm11YXNQ?=
 =?utf-8?Q?WHsjGeV77IOjkdScpqvFIO49V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4457c9-a2d6-498d-18b5-08db2602d424
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 09:42:59.5232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wX69pXXD77KaRgO/IsALCsLtVvdfyRcTUqbHBo3sWAlFZC6cr/GPn3OjxECD5VyIPPOovgTECQXMp6W+8AiS5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8852

On 16.03.2023 10:27, Roger Pau Monné wrote:
> On Thu, Mar 16, 2023 at 09:55:03AM +0100, Jan Beulich wrote:
>> On 16.03.2023 01:44, Stefano Stabellini wrote:
>>> On Wed, 15 Mar 2023, Roger Pau Monné wrote:
>>>> On Sun, Mar 12, 2023 at 03:54:55PM +0800, Huang Rui wrote:
>>>>> From: Chen Jiqian <Jiqian.Chen@amd.com>
>>>>>
>>>>> Use new xc_physdev_gsi_from_irq to get the GSI number
>>>>>
>>>>> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
>>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>>> ---
>>>>>  tools/libs/light/libxl_pci.c | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
>>>>> index f4c4f17545..47cf2799bf 100644
>>>>> --- a/tools/libs/light/libxl_pci.c
>>>>> +++ b/tools/libs/light/libxl_pci.c
>>>>> @@ -1486,6 +1486,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>>>>>          goto out_no_irq;
>>>>>      }
>>>>>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
>>>>> +        irq = xc_physdev_gsi_from_irq(ctx->xch, irq);
>>>>
>>>> This is just a shot in the dark, because I don't really have enough
>>>> context to understand what's going on here, but see below.
>>>>
>>>> I've taken a look at this on my box, and it seems like on
>>>> dom0 the value returned by /sys/bus/pci/devices/SBDF/irq is not
>>>> very consistent.
>>>>
>>>> If devices are in use by a driver the irq sysfs node reports either
>>>> the GSI irq or the MSI IRQ (in case a single MSI interrupt is
>>>> setup).
>>>>
>>>> It seems like pciback in Linux does something to report the correct
>>>> value:
>>>>
>>>> root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
>>>> 74
>>>> root@lcy2-dt107:~# xl pci-assignable-add 00:14.0
>>>> root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
>>>> 16
>>>>
>>>> As you can see, making the device assignable changed the value
>>>> reported by the irq node to be the GSI instead of the MSI IRQ, I would
>>>> think you are missing something similar in the PVH setup (some pciback
>>>> magic)?
>>>>
>>>> Albeit I have no idea why you would need to translate from IRQ to GSI
>>>> in the way you do in this and related patches, because I'm missing the
>>>> context.
>>>
>>> As I mention in another email, also keep in mind that we need QEMU to
>>> work and QEMU calls:
>>> 1) xc_physdev_map_pirq (this is also called from libxl)
>>> 2) xc_domain_bind_pt_pci_irq
>>>
>>>
>>> In this case IRQ != GSI (IRQ == 112, GSI == 28). Sysfs returns the IRQ
>>> in Linux (112), but actually xc_physdev_map_pirq expects the GSI, not
>>> the IRQ. If you look at the implementation of xc_physdev_map_pirq,
>>> you'll the type is "MAP_PIRQ_TYPE_GSI" and also see the check in Xen
>>> xen/arch/x86/irq.c:allocate_and_map_gsi_pirq:
>>>
>>>     if ( index < 0 || index >= nr_irqs_gsi )
>>>     {
>>>         dprintk(XENLOG_G_ERR, "dom%d: map invalid irq %d\n", d->domain_id,
>>>                 index);
>>>         return -EINVAL;
>>>     }
>>>
>>> nr_irqs_gsi < 112, and the check will fail.
>>>
>>> So we need to pass the GSI to xc_physdev_map_pirq. To do that, we need
>>> to discover the GSI number corresponding to the IRQ number.
>>
>> That's one possible approach. Another could be (making a lot of assumptions)
>> that a PVH Dom0 would pass in the IRQ it knows for this interrupt and Xen
>> then translates that to GSI, knowing that PVH doesn't have (host) GSIs
>> exposed to it.
> 
> I don't think Xen can translate a Linux IRQ to a GSI, as that's a
> Linux abstraction Xen has no part in.

Well, I was talking about whatever Dom0 and Xen use to communicate. I.e.
if at all I might have meant pIRQ, but now that you mention ...

> The GSIs exposed to a PVH dom0 are the native (host) ones, as we
> create an emulated IO-APIC topology that mimics the physical one.
> 
> Question here is why Linux ends up with a IRQ != GSI, as it's my
> understanding on Linux GSIs will always be identity mapped to IRQs, and
> the IRQ space up to the last possible GSI is explicitly reserved for
> this purpose.

... this I guess pIRQ was a PV-only concept, and it really ought to be
GSI in the PVH case. So yes, it then all boils down to that Linux-
internal question.

Jan

