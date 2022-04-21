Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9497050A411
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 17:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310320.527099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhYiN-000077-QU; Thu, 21 Apr 2022 15:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310320.527099; Thu, 21 Apr 2022 15:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhYiN-0008Vx-L5; Thu, 21 Apr 2022 15:27:27 +0000
Received: by outflank-mailman (input) for mailman id 310320;
 Thu, 21 Apr 2022 15:27:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhYiL-0008NL-Nt
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 15:27:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b40db7f-c187-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 17:27:24 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-piUo11GlMqmKW5UDfZ4oRQ-2; Thu, 21 Apr 2022 17:27:22 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR0402MB3875.eurprd04.prod.outlook.com (2603:10a6:208:9::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 15:27:20 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 15:27:20 +0000
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
X-Inumbo-ID: 8b40db7f-c187-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650554844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=copdA8uvOE43E5lPgCqr3yQRhyGX6TzQLV52e+UNrss=;
	b=hWCks8M9P2ZAXLs+mskFXT7uXRYUsi/TnNKOdwhok4b9sKv1N3UW1HZX5nDzv7UDfGcvLD
	1o1hPXy+hwWdM01D6LbDBQrCDxFuCZmEE8Cs4DoxMg8PovNaeoWZN5GqF5hZZPOROUXRgy
	bPRPJfOQV1kF0cbKFi6uZf1zT0C3T2g=
X-MC-Unique: piUo11GlMqmKW5UDfZ4oRQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAI+kh2DcfFnWd1BkkDOdcjWwYy/N/RkZpsoZwIBm4gqcakUY3rsSy5PCpcpwBr3eYuDwgFK4pAqqZObEs1tWcPvspORZpoFgPARucT6grPkLf4H2EKPpzMyiMGnl1V7fRd/wju3l+iJ+mDQxg3q6eCViLE+3FTHeAjkgrIodBTllqXgVK6im4/bbMTdwvkdw34N6cN5VfQRAwmAHT1OwNONVt3wETv/rQT77q0Z6uMQGLSEbRh0To6PemeHq/T2CbVgIHz2C7Ri4OZDJoeNTBZfWbjNXEAFeudzpnc4cL+g1cDaH11nt5U3lOBsSytqBkj1ERiS5oakqvSzq7+CWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgdXwCqaJbPWuWtnR11tCjs4kwvUL8Uz0zSvosnP2DM=;
 b=ga6itI8Ul+ZM9QqSTu2i6HwePZ1A2lqrcA741xU5sPnZwoUSOI9Qnr0OeRV6soXPgJktxGTJxmnOcmeWemHNAHcPHFx7iVnh3eXmARpGk+EIzFPlZhOgEfBdreSHYzBgxrSIe1+75cXmzGvN+Pypw/cH09ocKnexAahYLxhu2duHVdEJ3laqXhWIXW+SCcsCtW3+U+1nLAV6bssFm0Eqm5QiKTIBq8RI59/+bOptoFhrbCsr5ddr8Iie1W38ILPpapH8HoQ+sHYU6fWQrIKwvxCvhWJ7wVTVklHNBSUocnj52eDNbWTnnhrEUHVULWzorxKabKD+hN0TK4pbmUqiJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b7e3ecbe-6c2e-94f9-58c6-ae49652e6a29@suse.com>
Date: Thu, 21 Apr 2022 17:27:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220331092717.9023-1-roger.pau@citrix.com>
 <20220331092717.9023-4-roger.pau@citrix.com>
 <0bb48681-a78f-d32e-f989-822dd5e54b70@suse.com>
 <YmF2Zw13O6oaAT0k@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmF2Zw13O6oaAT0k@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0070.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c52249a-4efe-4e2e-38a0-08da23ab6cd6
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3875:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3875F7E2336474A6DD53FF30B3F49@AM0PR0402MB3875.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JJl0lWQBKl4kNCNkBOMc1D8sW+CThEe76aSjKTBft1yMPjgGDo2rm9x4OGNnjBzRqu0uvlWrChCWbF7dW/F+MZgHp2liFsI4ogiCRcg3h+pn+LuZIZY2Akln67D2ncOqIupI7ReD4gpNWyAy1v4JcYfexGO8xHwo9eoeHkUIFEjEfjSoG3CaiHP93rkkhYQrv4JBmnER/pAose8sEUmLFPB4BZfGLpPeqqYbmwk9YaWSsIFjW6aKEXy4Yscm/c+R77ImQBH+IyGIrz6ULQxb2DoFAqOAP1MTKKema1jRzExcL1wVcN0k3QWpsf/o/0SB4jZV2XWMYdjZ7HgKrdf6W1giFhbYUlYYN18aKg3gw+xvnV8MuVyvOiQCHOARAdBpUdxoxUQlccOuBaSBzdFlo/dgOyqiJ7w0IPnYdG2M7prAWPopEdO7hSob3ATerhzEcyDWiva3S5InwXmvq4Nl/ESWsC9Kdza6HOuakaFn0qeQ72ALtTaFG3AloauTqSFU2BW1GEVckqSHD3UZfrzVysvrHqqRGHpsAUPL3578A8Lg9as/gJQqe5D5JcOrnzwBoXcpdz1GcpRsjbFOAMXJMbWDyxbJuuu17C1Yc/4hVXHelzTcLh0rhpvCCeurcR4tKRAi4GCRNQmlIFIkvfoJeswLiyYSSb092V77nRhvVnE4u3fSw3ISMGaBh1bMDRxsBr8voJuUNwQNKZpadYKnysCL8S7Qyupehq60jMQzPY4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(36756003)(6512007)(86362001)(6486002)(83380400001)(508600001)(31696002)(8676002)(4326008)(38100700002)(26005)(66476007)(31686004)(66556008)(186003)(6916009)(6506007)(2906002)(316002)(53546011)(8936002)(5660300002)(2616005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2VPqbFuiDjR+rOiVD1UjwAOVXgi1vZ5lhdpUlog3F6bZVWuw2HNMggQ2b3Mz?=
 =?us-ascii?Q?S3bgrAP5Jc2JAW3dNxLVVFfD8SOApSN0mlTUmyYyJUuRULzRjcM2qI82M/gN?=
 =?us-ascii?Q?2ZtLM7c1ViWa1auHZDdfyvPCNs9dUKDjujlYcW6iL+TGIyuJOF14INjNm1UP?=
 =?us-ascii?Q?2bsKGFo+rGSV5KeSLNrUIFdM//PoLUHahlu0ME9UFbXjICnyaAGBT+cN91vX?=
 =?us-ascii?Q?RIwIaFcJsfv7WTuARR0FXNzpdmzexR3gTwVvGvUAcTFx+zHRjE4ovAmZRDoL?=
 =?us-ascii?Q?ie6wIgmHa6yyB9p8UMdvSKWfMxc6Ow1nnZcSRMyFPsevBFyKauEfByHpv4n3?=
 =?us-ascii?Q?LSEBY/ksS05k8wwDqjKUGJG46tQJSryscssVfCuMw853LZNIol8NFjrAHnYt?=
 =?us-ascii?Q?vDiEmq8V7MEpgqTb3RKogh483p4kIsECkxrf12xhLrrgWEoE0eZVUyUgcChD?=
 =?us-ascii?Q?ovgwxg2J5aw3o+IvTSxkUpt1ZRKttsMQDLNc+/Cszlm1N15EX/HKUG6OHkMi?=
 =?us-ascii?Q?LHXnNoEMX9uFchv7dHHxjtoVJAXz/oQ5VB4SpwabpNY1q4PNx8inhFRlmgkw?=
 =?us-ascii?Q?FQ+4O2JJ+coWteH/obItJiIxnP3yQ3OL8bWAq1ih8ZoL6gOkONRJPWBivFnt?=
 =?us-ascii?Q?AJA8EiQHkqn8c7x2x8vJgcwsD63kxoj0WJwrJ4t5p6bauSj8p06vovgoV0mF?=
 =?us-ascii?Q?j7xEIyrnguAeJKxCwZqnPTe+20AfMol95+ErjaYp56G12yOHC7EF8l54Gtp/?=
 =?us-ascii?Q?/TPiC2lqU99hNcn2OI6WIbKdKnJdY5D8sB9vg0LERwCgmYZkdYjEFll6YXqz?=
 =?us-ascii?Q?kn2RJ0GcBGHG97sdJlbfpwfJ8y35c4JQaDRFGZ4CA+9i8+y3mvyySgZPRW6h?=
 =?us-ascii?Q?FZEiDXCykWFyQ/7p1TTwx88aUulZJaCSvYHOJ1/Ubz6upe1hhZnKgz4aDDTN?=
 =?us-ascii?Q?H49T1QoTExUTnGCsSlurrsskFaqL8133vIgHWpLJFUynurt8zBFroQUeEv/N?=
 =?us-ascii?Q?IohqNFvN3ZNMuTja9NXCTpLGc7qcTZG0h3fhEZ7XBe7hywWJn6uQkJlkJ3QS?=
 =?us-ascii?Q?2nxXd+GrA64orwJwZWE8DOK8Cp3YO+166huLFzvUhN82ZUdOYZsdK4dsjm4R?=
 =?us-ascii?Q?VUkgi85VDaFzlWk2dSN9ZT1pn7yEKoournBdH5TbCk74TeLrCVAAOptvanCH?=
 =?us-ascii?Q?m91mKStzv8V90q+4ZoCtJTGmc6+Fhfn1XUQSiIAiACcT0gZY1U9Hq007L+Y8?=
 =?us-ascii?Q?CnsW+MtkdX+3NjbcGIxxHfoGYZwa7KJleoNDi9PyLPMqCvuj5q0NuzK3MDJh?=
 =?us-ascii?Q?BG40ACDUxVg/NsuZW0RAeGe9aqsw5XI//DOg/DCAN/tgIoDAB5UwdpKEit7g?=
 =?us-ascii?Q?COpxLuOoNqnk995A/O8+/lmvWOYjUA4v9aJFWm6XQXj/qJCsGzxjJl7YGf31?=
 =?us-ascii?Q?hZePPfpjkqTRAzND2gDG452wMo5b+0guMTbqTJN8YJoBbNiIfI6I7Ng2dLR6?=
 =?us-ascii?Q?R9Psan4hUO/mEr3MAoTkfUXLYXQPRJokoTjw7hn1ofqYrMwu+5GD8bmnl2dr?=
 =?us-ascii?Q?7z7hq5hT1/XKiwA/CcKVvejq5csw2JhJ1PEJ2RHbtmsPEBKLg2HW2bo7CY4S?=
 =?us-ascii?Q?+pF+EQ9jwXT3HDocFvbzGWWCD8VHLFnkLf+oh56EGT2KeVSKPNxu5aNkpue/?=
 =?us-ascii?Q?Lj80gx7YqIc/dujwpxJQ13LEK4q8ISgG+1JRA4R6HPL47q9nEHJCY1ft5Twc?=
 =?us-ascii?Q?1Sb//HlufQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c52249a-4efe-4e2e-38a0-08da23ab6cd6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 15:27:19.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpgxMxF+jLzAbsDZ1k3BYqHN3k7XC/mRwWWRS4VnxUBok83nnpmL/IkeVP1K04GJbtKvakf3XPNcScJJcGJvzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3875

On 21.04.2022 17:21, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 21, 2022 at 11:50:16AM +0200, Jan Beulich wrote:
>> On 31.03.2022 11:27, Roger Pau Monne wrote:
>>> Expose VIRT_SSBD to guests if the hardware supports setting SSBD in
>>> the LS_CFG MSR (a.k.a. non-architectural way). Different AMD CPU
>>> families use different bits in LS_CFG, so exposing VIRT_SPEC_CTRL.SSBD
>>> allows for an unified way of exposing SSBD support to guests on AMD
>>> hardware that's compatible migration wise, regardless of what
>>> underlying mechanism is used to set SSBD.
>>>
>>> Note that on AMD Family 17h (Zen 1) the value of SSBD in LS_CFG is
>>> shared between threads on the same core, so there's extra logic in
>>> order to synchronize the value and have SSBD set as long as one of the
>>> threads in the core requires it to be set. Such logic also requires
>>> extra storage for each thread state, which is allocated at
>>> initialization time.
>>
>> So where exactly is the boundary? If I'm not mistaken Zen2 is also
>> Fam17 (and only Zen3 is Fam19), yet here and elsewhere you look to
>> take Zen1 =3D=3D Fam17.
>=20
> Right, but Zen2 already has AMD_SSBD (ie: SPEC_CTRL), so it's not
> using this logic.
>=20
> The AMD whitepaper is more clear about this: any Fam17h processor that
> is using the non-architectural MSRs to set SSBD and has more than 1
> logical processor for each logical core must synchronize the setting
> of SSBD.
>=20
> I think just dropping the mention of Zen 1 in the commit message
> should remove your concerns?

Or keep it, but qualify it by saying that Zen2 isn't expected to take
this path because of having SSBD. But iirc SSBD was introduced to
Zen2 only by a ucode update, so such a description should not be wrong
wrt such not-up-to-date systems.

>> Just one further nit on the code:
>>
>>> +static struct ssbd_core {
>>> +    spinlock_t lock;
>>> +    unsigned int count;
>>> +} *ssbd_core;
>>> +static unsigned int __ro_after_init ssbd_max_cores;
>>> +#define AMD_ZEN1_MAX_SOCKETS 2
>>
>> This #define looks to render ...
>>
>>> +bool __init amd_setup_legacy_ssbd(void)
>>> +{
>>> +	unsigned int i;
>>> +
>>> +	if (boot_cpu_data.x86 !=3D 0x17 || boot_cpu_data.x86_num_siblings <=
=3D 1)
>>> +		return true;
>>> +
>>> +	/*
>>> +	 * One could be forgiven for thinking that c->x86_max_cores is the
>>> +	 * correct value to use here.
>>> +	 *
>>> +	 * However, that value is derived from the current configuration, and
>>> +	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
>>> +	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
>>> +	 */
>>> +	if (boot_cpu_data.extended_cpuid_level >=3D 0x80000008) {
>>> +		ssbd_max_cores =3D 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
>>> +		ssbd_max_cores /=3D boot_cpu_data.x86_num_siblings;
>>> +	}
>>> +	if (!ssbd_max_cores)
>>> +		return false;
>>> +
>>> +	/* Max is two sockets for Fam17h hardware. */
>>> +	ssbd_core =3D xzalloc_array(struct ssbd_core,
>>> +	                          ssbd_max_cores * AMD_ZEN1_MAX_SOCKETS);
>>
>> ... largely redundant the comment here; if anywhere I think the comment
>> would want to go next to the #define.
>=20
> I guess I should also rename the define to FAM17H instead of ZEN1, as
> all Fam17h is limited to two sockets, then the comment can be removed
> as I think the define is self-explanatory.

Yes, this rename would help both eliminate my confusion as well as the
need for the comment.

Jan


