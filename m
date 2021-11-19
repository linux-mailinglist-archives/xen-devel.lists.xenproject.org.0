Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0472457023
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 14:56:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227957.394409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4NL-0001yU-9v; Fri, 19 Nov 2021 13:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227957.394409; Fri, 19 Nov 2021 13:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4NL-0001vm-6s; Fri, 19 Nov 2021 13:56:23 +0000
Received: by outflank-mailman (input) for mailman id 227957;
 Fri, 19 Nov 2021 13:56:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo4NJ-0001vg-Cs
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 13:56:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7881d1f3-4940-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 14:56:19 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-chFN-VpxOi63mylV6c1PCw-1; Fri, 19 Nov 2021 14:56:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Fri, 19 Nov
 2021 13:56:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 13:56:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR04CA0042.eurprd04.prod.outlook.com (2603:10a6:20b:46a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 13:56:14 +0000
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
X-Inumbo-ID: 7881d1f3-4940-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637330178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ww7DjeOjXT7M3/ugM3CtYXns9ejuTOCuAT/N7ojpj/4=;
	b=Ga4n/wwcSTFVC4wQuenpevGA5PfsrggQvaHuEeYtYbDtczxbKY4GqGM0VR0kl3GEXPMK5y
	zKHafZuLpCgNXyUVsKZ/6gDTLANsvQYbB0ZV3k55RfElv9CIMVOUpOBPyi4m8oWppEAinL
	Zz9ZynYlG8aR5I3SfVXdZ7yOz/cf4O0=
X-MC-Unique: chFN-VpxOi63mylV6c1PCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+GbAxfo9/57+hkbjQfIi5MvP5C+DSbOzsAg2pdTQdTmcUIA22hx8V1HYvI/2B4RwWXNYepalZt9l5FtDxnMB2ZRAJSZE8SPRjuwIxi4I5pvM4cKBSmtjoWo/QU0ORlPTcqXpVH528//VtDDokbQ+43aWa32mrEZvI4ND63Kb0+wm/xLHcE9fhB/HiwmsYQML5G7pYtOCWhkN/a3bW6FYzRUTocwg5lUZZOXGijGhX70yEK3fmxBjXXatuVo7fFw5dqYv6jyDdKOIJ57B35MBSIm4yjjvyKnOb4typbEZoMFpOcarazY43qP1PXxFiJxm+JlC5jXBp6ze3NExMJRdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ww7DjeOjXT7M3/ugM3CtYXns9ejuTOCuAT/N7ojpj/4=;
 b=nFQfBvt7CwVFFW/fUQY/2D907kzDuuyONe8Nh/b2GcVx1BZOoJBSbh0I9WMkA0NVljv9gyA9h5jOVIakQd2cnjcedmdhuzJiIOXmTiQbWNKcvSueaef8isGK9o0ss+P8A2HhtKp8+G1+9MYVUmc265K48zzXv4fj2+kiYgX60vRoYP0A2/MFbcm1RBjrZ5EO28C0DiOn8shkCcWL69FRrgl0bB2+lk9uH3tJJN5eZOSC4lDEU16z08U8WrTAixXzdsn+ZC7R9s3XDN5U3SizNag2UHY+MFFtwJvVDzdbL5tgjtQDJMhpaeyoBKN+9ZxCDAeOLDnV0k/lDuH2xE3JQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f659a29e-f006-ddc5-53b4-236eb261e1ea@suse.com>
Date: Fri, 19 Nov 2021 14:56:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 00/11] PCI devices passthrough on Arm, part 3
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211105065629.940943-1-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105065629.940943-1-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0042.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa9d9591-acf8-47ae-9de4-08d9ab645a76
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2333866591A1A99E97F8467BB39C9@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E4JmcoG2zeHO3+w6M5ExgnxmMUhr8dvFBXqYQmR6Iqgw8+11gwPXxKlgv/S9T6IYlB67wc7djdH+hI5z6h1N4eYIF/cbOCnEIBQRO2gv6FDuZojoRHU03DfB1/k52z/gc0ysUPOyutusJjIfchnDehVJimO0YPkVEjE12J43xlZSgD33J//8yk9nl3jVdr2Hcq6jfSSAJvjMt+RvZeyD+QCctymty1WMqwI8kuk9VsjCC4TTttrfPZtP5SVGAOgGTROYX657iXU0XMySakH6bCFczdnJCVkZYyQtGU8FadzHuVPR8Lp0LwJTPoofoyI3VODCLh6A0sguSgi5TJ9DZJ+Z2Qmmj+ff2FqtjpvLQjylsou3aUm/QN+N78JoHfcriLziCnLE8yExFJ2oJDxXTtBHXJXDWoQ6z8gSBahls6WDbgELjEm5Pj5tz86A1VNGUsDX/rRySu7V4suYYFFwaRLtq6o3UUPDs51JDDWuk6IEMKUfS0aqAdNb5oeQV85WvBYiVuOEItsCAlSRPLtpqDmug30GRRZTeMQHSPUAjKqO4JmOtj0OhE038ReOtGBGTyMELPqLy1qtp+50aMSTxmqbHcTmQz3dANqbnkmLnMZYqA/nYJe1Y0ND+ss8oOGL4tKNvXnstAkwdqBsoFarOy4YMPLRUq4Y7L4vjhyp82bvNgJFJiF2opqq/690P3oE433CLWXjd2Fb4nHQ+/UXMmi/A4G9QpHLMbmMAiJBqUk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(186003)(508600001)(2616005)(7416002)(6916009)(956004)(66476007)(66946007)(66556008)(36756003)(86362001)(53546011)(6486002)(31696002)(83380400001)(38100700002)(5660300002)(4326008)(2906002)(316002)(16576012)(8936002)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHBaUnFoSmxIV3IwVWNiWjBDUWR3Vm5aREJPTzJNM3dtNnVkNmdBSVNaV0VI?=
 =?utf-8?B?WFBHNFgxa3ZmOGdxMi9pRmVWemFuK3JyaThHVnR0dUU0MGoyTlRtTm5saVBG?=
 =?utf-8?B?cG5pVUhDRmd2c0ZHc3pUKzZVLy9JejEralE4c3VPanBTZWorOEZZbEdIUkN1?=
 =?utf-8?B?QXNBK0tSaGpMeTlvUmp2bWRRRExVNnlLTXdURWFaTzhlTjBlb28yY0JaMmhl?=
 =?utf-8?B?R05Ldmlxb0cxMFlTK012SkVlR3ppNEw2VmNWWU5xMVJuazUzZTY1NnNLSk0r?=
 =?utf-8?B?Mm1QeXBPMmNPdWkzeTkvTGpMamZ1WkJkb0xSK3BkWDhSTVVRaG5IdXR6QU5h?=
 =?utf-8?B?aE5LcUxhRnIyOFp4Wk1sSjQybngrby92V1lUVWp4RjQ1cG5FZlJpcE9LSDJ6?=
 =?utf-8?B?TU1TYllONXpSRUpyR0grckhSeWx1UDRTeEpiZ1NVVDNaRnVTZmpteGdGaTFI?=
 =?utf-8?B?Q25LajhYbTdpUmQ1VmhoV0pwSjF1MzBBZTFubGltcE9LaDdKOFljMTNscHVw?=
 =?utf-8?B?bDc0aE43NHU3bzh1cWhjd3B0bVhBT2FobjB2TEJaQjduSHlhb3RWYmdtL1dT?=
 =?utf-8?B?VXM4RTI3cFFvK2xaR0RDL0lFZHd6VzVsT0tZd2Y5Y1RoVmQ3OHNzaE4yTnU1?=
 =?utf-8?B?d0dhb2k1UHR4N0RpOHhpTDd4cS9GdHhab1REVEpaL0ZRQkFRdGlrSTY4TnRu?=
 =?utf-8?B?dHdNdWE1ejFLUytKdUZyRHUvY1lRVmRpN2VvOSt0VFZaUHBIaWZVWDJWdXMv?=
 =?utf-8?B?ei9nQWZuM0wwdFZkaFUyR2hjSEJMM3FGNXl2WnFjMWxmSkFxdWxBRC8ySDdO?=
 =?utf-8?B?NHRETi9kUXJlSnFuRkkzT3k1RHU1bVdTdXorNlQ0eEhOQmdYNnR2SDc3YnBR?=
 =?utf-8?B?V3NTNEhjR3c5VDBZdVJ4Ly9YR1N1Ti9udzhVNCtzNmd2WnFFMWVWaksvaWlH?=
 =?utf-8?B?V1lxVjdOb3NGT3Fma3NLZCtmTjh2UjN6NTRZR2RhbG43dm1iRWFTUWdod2dk?=
 =?utf-8?B?bDBHUlN5MGxlamVuK3NZK3pLWVRNMDA1Q3VoQXFKa1J3Z0ZaWDhmWVhVTElu?=
 =?utf-8?B?RXd2cXlFMCtxcEp3RUdpUWVZdC9GcmFGdHlPdDdVeWp2WlJXZWFla0ViQ2kr?=
 =?utf-8?B?VDZsQ1Q2OTZhWXpWSU5NS3hVK2N6cTJUd1JZaWEydlQwVVFwcVl5SWFmY1BB?=
 =?utf-8?B?NnhIWHpmMCtHVEpMTWlJdnlXN0pxTG5SdXNQTEJibHlFL1NEdHVaYk1zNjJj?=
 =?utf-8?B?TlNQdVdibGN2NWVHYmlHUnRiTXgzdldZdHBzRmJHcGk1c0daSVMwcXpVcG92?=
 =?utf-8?B?UzRnZmhNU3R1SmZTRWROTHdhdHE3anNPNFhnR0M3ZGdQT2lYR3AzdFJucExx?=
 =?utf-8?B?ZzFxM2UvVTQxVGIrMTVDMDRwL0lvMHJ4Yk8wZEhHYnlldm9mVm01eXlrTkdK?=
 =?utf-8?B?bEt3STVodHMyUmw2ZXl0Q2g5WkR4WDdIOUZTRnZ0VmtuY3dmcmRoS3I2RWhH?=
 =?utf-8?B?c1dSRmtDNmJBdE1YeWlrS2ZadDVJb2M5ZTk2S1dkRnY5S3I4Q0NEaE9VS0d2?=
 =?utf-8?B?d29pZlJYcHE5dEd6L0l6WERqeXNMbk1LN21uOWRiNis4TGx5aTQyVHdyemg3?=
 =?utf-8?B?Z2pwMFMveWovd2FlTjdvcmdHUTVLK1UvTlBabFMvcjBxczZkdk1qcEg2UENQ?=
 =?utf-8?B?eFMzcTQwelM0cmxscS9hM0VSUE52cnMwK2xRNjhvYWYvYVc1R2hNeDJab0dj?=
 =?utf-8?B?UUlHdVcvN1hWUjgyQkZJbnE4Qkt2cjV1L0VCY3dMWDVHUkhjNXpTQ2o5RGpw?=
 =?utf-8?B?dW5lYkVQWmVmSHZwWkY4dmRzdi9vMjA0OUpzb1p0RHBrZy9ab2JMczNSemVI?=
 =?utf-8?B?ZCs0Vi9ZQjg0bXlCWWtlSHZXeGlqa1IzdkZVWks4VzJOcDNNQnlHQ1QwazJP?=
 =?utf-8?B?N0JOdEVZUHVpSkM1Y1l3Q2lBZTBEMnZrZEJraThRZ3ZUMUFDUmo5RXZGVVF3?=
 =?utf-8?B?VHF0WERWWjBKNVlSUkd5MmRUYjBSMS9NaFlsdk51NVY2bHlKTnB0a0N1THBi?=
 =?utf-8?B?L3c3Y2ZTT2oxbG0zOWhTSUlsZTFOOE9URkgvdkxWUDNMQVhrRXQrRnpQeHlj?=
 =?utf-8?B?TXRwZ3IyRFJIVFVuTm1KVHF5WmlBL3Qxby9YcmlpT0hacCtwZ0tBZ2NXNHh6?=
 =?utf-8?Q?7dRpdFBl4zaHAo6UHDBtygU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9d9591-acf8-47ae-9de4-08d9ab645a76
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 13:56:15.4417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77qhZdFSvRP7Iau2QlTimGIfe8WMAOub7LKpaLHAI+OI7UfdR+d9Z/8B9DIhIBZ3dGJ+JWnwqfEWY6w5nnpkqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Hi, all!
> 
> This patch series is focusing on vPCI and adds support for non-identity
> PCI BAR mappings which is required while passing through a PCI device to
> a guest. The highlights are:
> 
> - Add relevant vpci register handlers when assigning PCI device to a domain
>   and remove those when de-assigning. This allows having different
>   handlers for different domains, e.g. hwdom and other guests.
> 
> - Emulate guest BAR register values based on physical BAR values.
>   This allows creating a guest view of the registers and emulates
>   size and properties probe as it is done during PCI device enumeration by
>   the guest.
> 
> - Instead of handling a single range set, that contains all the memory
>   regions of all the BARs and ROM, have them per BAR.
> 
> - Take into account guest's BAR view and program its p2m accordingly:
>   gfn is guest's view of the BAR and mfn is the physical BAR value as set
>   up by the host bridge in the hardware domain.
>   This way hardware doamin sees physical BAR values and guest sees
>   emulated ones.
> 
> The series also adds support for virtual PCI bus topology for guests:
>  - We emulate a single host bridge for the guest, so segment is always 0.
>  - The implementation is limited to 32 devices which are allowed on
>    a single PCI bus.
>  - The virtual bus number is set to 0, so virtual devices are seen
>    as embedded endpoints behind the root complex.
> 
> The series was also tested on:
>  - x86 PVH Dom0 and doesn't break it.
>  - x86 HVM with PCI passthrough to DomU and doesn't break it.
> 
> Thank you,
> Oleksandr
> 
> Oleksandr Andrushchenko (11):
>   vpci: fix function attributes for vpci_process_pending
>   vpci: cancel pending map/unmap on vpci removal
>   vpci: make vpci registers removal a dedicated function
>   vpci: add hooks for PCI device assign/de-assign
>   vpci/header: implement guest BAR register handlers
>   vpci/header: handle p2m range sets per BAR
>   vpci/header: program p2m with guest BAR view
>   vpci/header: emulate PCI_COMMAND register for guests
>   vpci/header: reset the command register when adding devices
>   vpci: add initial support for virtual PCI bus topology
>   xen/arm: translate virtual PCI bus topology for guests

If I'm not mistaken by the end of this series a guest can access a
device handed to it. I couldn't find anything dealing with the
uses of vpci_{read,write}_hw() and vpci_hw_{read,write}*() to cover
config registers not covered by registered handlers. IMO this should
happen before patch 5: Before any handlers get registered the view a
guest would have would be all ones no matter which register it
accesses. Handler registration would then "punch holes" into this
"curtain", as opposed to Dom0, where handler registration hides
previously visible raw hardware registers.

Jan


