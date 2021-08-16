Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDD13EDD1D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 20:33:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167475.305696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFhPG-0001yr-17; Mon, 16 Aug 2021 18:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167475.305696; Mon, 16 Aug 2021 18:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFhPF-0001wl-Tx; Mon, 16 Aug 2021 18:32:17 +0000
Received: by outflank-mailman (input) for mailman id 167475;
 Mon, 16 Aug 2021 18:32:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Flmd=NH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFhPE-0001wf-L9
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 18:32:16 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 161b342e-b5e2-41f8-bef6-6ee4d9037384;
 Mon, 16 Aug 2021 18:32:14 +0000 (UTC)
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
X-Inumbo-ID: 161b342e-b5e2-41f8-bef6-6ee4d9037384
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629138734;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nSZ6GGW4N2MsPrIhY5ytWlKRnTwUYmKAZrG4hv0VyIg=;
  b=eXe7oid8eY4nurEGI2w6Fbd72qgURpv4UNtDjsGLoWG3K4+iJVgL6jlx
   VuEy12mjWl47wrj0PgpHStyP7WxiK02mxAiIuttE/1IW4gR4kXy0e58mN
   uCi+c0pYnXJuPOi9vdWkBEjwMGJ9+nFyPOZagzCQIN7Ob4XkiF1X7dVPZ
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: m9n+MaCjuueQ0l/BH9mgwhbrP22MWVzs7gaElf9GLpokgineD4mH3ubMYL6Em4M9eoeZTgPg0P
 IYv1ZqwtsON2s2CE6EHY2Xu1u1j+FAjDADKP5IZjIkn0QrYKOGJfNpwnRiyjqKX2E+JpOFCSYp
 AmTWhf3wi3+dZoTe0j8NSwjrwbqWUwOMACbEIbGwgKYASSLRXQScaaa0DxZJBCzTTGkRomXMJ4
 TFWxki6FEL5AmICFEU2+h0S71r6HCfq4w+LJFoIyWrM52R6zBHhthJJhPMjXzk/6UJl7zIlJ1L
 68rNCqSBTvErAoeoMwA5VqcK
X-SBRS: 5.1
X-MesageID: 50554937
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:amTtK6EXm5fuai8SpLqFaJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HlBEDyewKjyXcT2/hvAV7CZnibhILMFuBfBOTZskbd8kHFh4hgPO
 JbAtVD4b7LfCtHZKTBkXGF+r8bqbHtms3Y5pa9vgJQpENRGsZdBm9Ce3am+yZNNXB77PQCZf
 +hD4Z81kCdkSN9VLXLOpBJZZmMm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTij9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZgA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKRvZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDvwnVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLZU5nghBgp/DWQZAV0Iv/fKXJy4/B9kgIm30yR9nFogPD2xRw7hcoAo/Au3Z
 W3Dkxq/Is+BPP+I5gNX9vo7KOMeyXwqCn3QRWvyGLcZeo60kL22urKCYoOlZeXkbwzvdcPcc
 f6IRxlXVBbQTOnNSTJ5uwQzizw
X-IronPort-AV: E=Sophos;i="5.84,326,1620705600"; 
   d="scan'208";a="50554937"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JB8Tt+OO+Kw2w94wTCXGrzJc+I2fioaH1ohqWCk3bVjvR+C6Noq87Sm8PaDNOD+CbuLJEa7+/J7L1y50zCpX6jkaDLi5j+LAMabc24AKi1kFN9pr32VFyp6vLYnFGqEgckytq4Be/DF9sA0NPUJJvzHhqu95qr0Ro0XXb5srGZrFXLMJqNeYNXtcOS19+YG+BT2ZY+P/cJLMU67xWw1dQVdMXSSLKxkTh+99MvzxriI58L1+6K+8K70dcIu6eZPsVmmUZbvO6sgj3BrN0ogwhYEv6eUL5PD5su3A/iqjunB/FYHtvNRW2Ygg/nitStgefe8TyrtIprvnzg9rGYT26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSZ6GGW4N2MsPrIhY5ytWlKRnTwUYmKAZrG4hv0VyIg=;
 b=Wrhm889Ed8VTzcsD50ZiZV3cMi0WerdZIMS3CHU4U9kvz+lP83yhlNxhJZFI8pIM8bkhrI/b+34pDSN+SdKz8Jfn6auj1ztSyoq5iYhR7sRxWdPW99l35f7MiJhO6piWGC1uy5uo3SIoooSNjjBDrDLOZSi0LRsq9MU0y0TZE/gWtxe9+uqJ9nucwevs8Ro1lUj+h7g/8IDl5yVTfdDAmMQzxrfK+ExbB8P/+w9vnIPigIpDVeXHVSmb//BeYM0Zl+Ng3j9WysbF5RJEFwC4epmP9aTMmW13WroHmrTqez1jaQYeRli27IQ9/w2294o8g2TaC9iSOjQ4+i9d1GHUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSZ6GGW4N2MsPrIhY5ytWlKRnTwUYmKAZrG4hv0VyIg=;
 b=JrbBEWy4v3pfZJHuDQYNxy5sIemXTH514EUQZy9dcAx/C51C8sGA+WjEgEUd8EGP501IGaxVXwtvdTgNLU0WsMHpitCGk3toiBM5mf8d0JqV0AxF5V+i/lSSdPXYcB35A3JSWW1hrJl/S5LERV2u3l0epSq0aa6CKpIdYV29uxw=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <d01563bc-ae9c-fe91-b313-19a30af09170@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] IOMMU/x86: don't map IO-APICs for PV Dom0
Message-ID: <2edfe6a7-a69a-df75-a11d-ee8348235c54@citrix.com>
Date: Mon, 16 Aug 2021 19:31:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d01563bc-ae9c-fe91-b313-19a30af09170@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO3P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f52c1c5f-e1e7-47bb-8d0f-08d960e426b9
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5759:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB57591BDFB2C529D8AEF41249BAFD9@SJ0PR03MB5759.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c7pIWk8axAp6ADevyMwtO1kLE121+63AgA1+85GoRTroXSu7KZ118PtGtAmQ2toMFlruEZLz2hKpcNwAPRAgvfvjpG2HGK/Pf4sR8PaH5a+BszUHkC/HLW7JY8jZegYWiEHUhQ+9dsvY9PyuML4WzcO2BG7OtzvN8q5x6EHWomdmAO1pqjeVlzCRQ9thAqW5BOunthHyQx115TvvFCuRITVhS48u+2TQhAMxNZ7U7OkxP6lxbxM1kSknyT7EmITChGJAv+YoMq89e32WwvmlsCB6YHvG8NWGkVqCmbAxwGmdrQer619p7E2lT+b9B/fFCyhNq6k1sKIw8VMSDm+uuXSozaBxfxQsHI+ax55fCGIYEWBsGfZoX99UC4ZQyW81TB29u6Ln6UjhRG3R5l1SIKcyiiHy1xe/SGwG+twH/w2PRJrsSQ41N6bpVvAVB4XPOd1Y9vyt2ZGYnBvcm6Iodpvbu15TWc9c3oVi0MjPBgQ8CQLc29ybo3rqNPIF3UkseJRxagRyX5jbMUXk475sbmNKPFcyCZQsM48I8StXiapo6wnQD6Y+cf1sqB2oA7ZpeSs1AJ3kTQNBQpJi7GIZ2ltZ9xlBksEkqFsd3OvnZfyajhgPbh99hZKiwn8xvGkmhAZftIfO93iyrM5jKWkjVAUHMpeMTkj5E8f2oz5gG9zXZKu8icCu5dL58AHwrodEWuM+nk9UB6Jt9QxThi+L/gtS9L1RLen4LItJ2youzOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(8676002)(2906002)(508600001)(186003)(36756003)(53546011)(4326008)(66946007)(6666004)(26005)(66476007)(66556008)(38100700002)(2616005)(86362001)(16576012)(316002)(110136005)(956004)(54906003)(31686004)(6486002)(31696002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDRFS2ltekFIanlFY1FGbVFMdmhCcTdCQlRrRkZSWXFMZzlNc0FhdmRkTHVu?=
 =?utf-8?B?cEdjVGdSTlB0TXdpMUZTa2hYa2I0SmtWUWdELzR3Qzhmb3ZGbEhUclFUald3?=
 =?utf-8?B?a0FIaERBdGdvV1VjSjhEbjV6SURuaEZnaG55MjA5NWE4YnRGY25VYXJYSFEv?=
 =?utf-8?B?dXd3QnVQc1NDUXpYczlDVnFXOE92SnBGa2Y2bCtKa2x2QmkvSE84MFBvbE9Z?=
 =?utf-8?B?K2huL0V0VXR3ZkZBYU00ZWlzVXc4VGZ2aVFQNzJlZisrOWgreG5aKzNTMHhl?=
 =?utf-8?B?UHJYeHkxM2o5dlpqY1dtQllRWWRvTDJsZkIrT1N5eWxsVlEyWkNhVEtsdDlO?=
 =?utf-8?B?dnJCYlhLUm5pMnU3RlcwTWkzU1lRYUEvdnVFS3U3Mjg3WW5FYzRORDZ0YWdI?=
 =?utf-8?B?clA4cGJzeE8yK3VDN1NRUXp4bGs4SE5PUU5pdjVJNi91N0FtM0dZZTB2UGE0?=
 =?utf-8?B?VzdqRVJYNm1JV0Jvd0Z0VnRPYkQvSGR0UEdmcm9MSHlNTHRUZ2VXdEYwa09i?=
 =?utf-8?B?emJNcWk3VWR2WldCSm5TQ3gwK0JzWjV3bGQyQW1lN2R6VFdrQ3VRVXFXbmpp?=
 =?utf-8?B?azhyQTIycWh0blUxSndJQ3dleDduL1ovS0V6NjRBZXR3RkpkNG1aQldBTzIz?=
 =?utf-8?B?dkJIWlF5VGpxOXZNK1dvdUw5dE9pblpZc2VPV0FRRXY1VkQ3ek9xbmV2Q0da?=
 =?utf-8?B?MU5hdGsvalpETUkyRm1HS3Ezcng4MDFtUGVnZk9XNjBzcUZ0UlVPSWpRakNx?=
 =?utf-8?B?TmNIUTloTmdsTlVRai9RWDZUVXhSb0tIbVlwZXFmeXhucWJONXRBb1pYbUVP?=
 =?utf-8?B?QTY1U3dRdUpUZy8ydXJ0cUFZbXdZTXR4YWxiUjUyUmVsYWI5N2hUREw2N2pl?=
 =?utf-8?B?ZWVtMVUzVzk5Y25FODRhdzRRSmRwTUdxMWZOOHhPUEtCSnhRZ0J2dzNLMk5N?=
 =?utf-8?B?d0czWGNDNkJ6NVdpbTZSMldrdnJjTGdnOFBGSmFWVFFaQ0dNenBuQlh2aThh?=
 =?utf-8?B?MVBMNWlUYlRxWGR0TzZTbnlBNGF5ejdObWZNT0x2TDc4UTdmd0h0VFVWa25k?=
 =?utf-8?B?R2pTTDN5TFJVUDZrY1VrT0dPUU5uOFN6T2lKbzdXZWFUdkM3YjkxTGtXc24w?=
 =?utf-8?B?RmprU09kcTFnQUF0aERlUnNUWmQ4aVdCMmhucDZReWJLaW5FUzVRRFdVbHRS?=
 =?utf-8?B?Z003T0s5L3NiSjh4YiswUUNMejVxYjloV3ltc2dFNXFiVk5SdnhlY3N0cDZI?=
 =?utf-8?B?S2hFazBiNWE2NWRjcmdROEFTa28wbmJEU3hZZFlhanVjaitCMGFCaDdWYTVj?=
 =?utf-8?B?NTJ3R0tONEk5cHpjNFU0WVI5TmQrSUZvYnBCVEtYZWZ6ZSt5T0tqckVPRnlQ?=
 =?utf-8?B?VWNyVm9tNzBvVi9SaEVBVnk1ZTRkQVVaZlU4Mjl3MWdsUWlKK0x4YXFnLzk5?=
 =?utf-8?B?NWxvWDAzMm5OT09nck1SbEVLdWZUL2FCWTJvTTBZZUlSYUk3YjQzNUpGSjRP?=
 =?utf-8?B?amtiY3V2VXh6UDVEOWpCREdTRWFyUk1INy9QVVFaTlpWSHFJcDZXNE1zUktJ?=
 =?utf-8?B?OVViNHV2d2NTVm9wbFdMNFd5RlVJV3dHMGZkczFzM1loMkE4b3g1Q1VwaEV1?=
 =?utf-8?B?Uy9VWDkwRlF4Q3c3bmJScEZ2Z2czbExhUUFJcTN6N2o2SWZnSnhxb0pXN0Ra?=
 =?utf-8?B?K3dGY1NRbVFTTUc5NXZpR21xY2xwZUg2OFltR0VDdG55aTNUN0NKMFBFMnRN?=
 =?utf-8?Q?6Payh1AOJqavHZGPAB/evpH787t4KTW3NFlNsfF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f52c1c5f-e1e7-47bb-8d0f-08d960e426b9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 18:32:06.9109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFmr92+hev/J47cK+AzD0MP1kH9OZep9Vrp+eMoMm/DgGTLOzvjV+FW/oLrSITwQRAP15nXrGDWcQeV4iPzhMgdAIa2XibyZHpPeaHcD5hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5759
X-OriginatorOrg: citrix.com

On 16/08/2021 16:31, Jan Beulich wrote:
> While already the case for PVH, there's no reason to treat PV
> differently here (except of course where to take the addresses from).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Honestly, this is already a mess but I think the change is making things
worse rather than better.

To start with, IO-APIC windows are 1k not 4k, except that no-one added a
"4k safe" flag because IO-APICs weren't mapped into userspace by Linux
at the time.

More generally though, if something is safe to let dom0 map in the CPU
pagetables, it is safe to go in the IOMMU pagetables.=C2=A0 Conversely, if
it's not safe to go in one, it's not safe to go in either.

Mappings (or at least mapability) of everything/anything should be
uniform between the CPU and IOMMU pagetables for any kind of sanity to
prevail.

This is most easily demonstrated with PVH dom0 and shared vs split EPT
tables.=C2=A0 Split vs shared is an internal choice within Xen, and shouldn=
't
cause in any change in static DMA behaviour (obviously - there is
transient difference with logdirty but that's not relevant here).

~Andrew


