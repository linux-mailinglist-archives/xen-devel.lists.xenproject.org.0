Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FD451D12B
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 08:21:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322621.544008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmrLA-00087i-Qm; Fri, 06 May 2022 06:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322621.544008; Fri, 06 May 2022 06:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmrLA-00084E-Nt; Fri, 06 May 2022 06:21:24 +0000
Received: by outflank-mailman (input) for mailman id 322621;
 Fri, 06 May 2022 06:21:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmrL9-000848-PB
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 06:21:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf553445-cd04-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 08:21:21 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-ssxPRdBzNTCJ9Wp8D0gS2g-1; Fri, 06 May 2022 08:21:21 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB4012.eurprd04.prod.outlook.com (2603:10a6:5:1a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Fri, 6 May
 2022 06:21:20 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 06:21:20 +0000
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
X-Inumbo-ID: bf553445-cd04-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651818082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+pGjnbweYaHA4xayDkkEXpE+qb//DH67g+T0OmdbJA=;
	b=a7lc0JtovLBgwleFOxkGNrqBth1fgJ02a/Ivb2jTAcm/oUzRLhpGa4VIuHr095yNKEmKfj
	juenPzuO22RkNplqSfr6ap7vQLcgQtOIjLtf6jqZodvZ2mrVIR9osZzXYXfdevXcmBCR/y
	EawsCalsTxC5tdS1Q337pbD6q5xyCWY=
X-MC-Unique: ssxPRdBzNTCJ9Wp8D0gS2g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNsTm+VxutYSou4lX50b/dwxWoyM5xdYPDiMAXSSDE37PdV91nPTIvqxLrLZdAY0JRlICw15JbHUtrbxIobnIFOw3o72d4DdG2ZM1ELLaCEO5gCKBJGnViTD1qbOLUPT/CzZLliY7WQrjrFJqpmD79N5m87I+VwRE0L7SM3HRBL39Z5eqfaVTmAppECE7v8cWGR1FuPzzBfIH9P9IlBaLQzzP+tqN2RcpfX0gLFJe/9i9k9Uruwl+AbOMvtuQ3oc/H0pLHIwWfLxl9N8XpvrMuGgsE6FwCkidEOp6Mo8KzB/F4P8fUnzd0yg0MrBjuobppAid3oAkUdhiP+qh2ad0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5iYyXUBKqtr61nfZQ7cUsWxfB4MPrsV9/ZPu50W9QA=;
 b=LddJzEKQ0YPqxLJx8KqORlkEaNvCLdRXwIXsPJEHHFD8AsDy7wGwlDO+Bquus+UtswVdC7mQBw+2nlgAqO+f8BOYm00SVcAtTamXsHAV9Y9TEvtCSqeySv7m5+1lHlgZvQ/aOKeVePtL7wt+/8YXfA+OkG2eEEuR1WYm6ypVEL+YiAZhLvQxMznif8bqUOoHPV/AGJ73GBaEUn7AkgdUcKRs9/ei232N2i2TsP9lpkUAlrjMwHvwCQ80pS8rTcPZAme0/buh2TeLLCprF4nNTk3aAhnsOq3SZEV6fSiw7WGzucq0ldR37zYdL9uuoIIouGNf9ewn6w3GuIocAomd0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e7eef54-975f-4c2b-2ab0-bcd16289a0c1@suse.com>
Date: Fri, 6 May 2022 08:21:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] PCI: don't allow "pci-phantom=" to mark real devices as
 phantom functions
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <02804746-c5e3-aada-7096-fbb9d04ca952@suse.com>
 <cf8f2a73-f464-fb60-27d8-238996b50f55@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cf8f2a73-f464-fb60-27d8-238996b50f55@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb2603da-b6a6-40dd-76d1-08da2f28a2ca
X-MS-TrafficTypeDiagnostic: DB7PR04MB4012:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB401256735EAFD5BED7E66579B3C59@DB7PR04MB4012.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QcQT48w79fzpm51YhtjHxJpc0+UzRMOLs6sbZwjj7wawC5PdZs9ac4ohAaFjQhSIn1FhfHRnUSpmeZ6RSA6m55Fb3v0VCjxLFn4BRE3twN1wNN06VLqEYpS6z7cfnpzt1lkCfa4Yi2THjspX3Foxg6cYtoiU8rG21oWcG/CNFGQ1F9IoKKrmrwe7BThOD0bbRSXF9+DbJ0lIsRgqifBeIhMoVM+cVV9/rNzXXVsgvhchuiZR8M1w+NI0lKTAp+Kxv026DjSl9pMOpwAIA+e1RhL4KA8Gckwu/Qk5P/K2LtNYlv5LVLlYpAEYyqrX6EvlH9HulVPy+ObylF6n5Et7PYVwdmJjvtlAqwGNZ1hwD6qJfL07zlPg/n8QEr/jvHKZ+kGx6NjOyKCOeScunEsiu6SLB7NUGPJTo2cNQdZRm3s0UvizZoBXb5a+NOyuFg4YGmwdZmkWfwFBXYv5m3ubilfMc2V7Ud1t1qnMzTbOW4nQWaKYgSzEirUA5d8FuOyiRbDIN9TMVIBgkHvCW9BTWN9+I0++qQude2vBvqMWRBG6wqvzPXhM4WKG7jD1YbjhDYIlcZ/t3ACAIr48V+UDmy/2ryV9KuQ91NO+Tup/9Udz0zHaDFhMk1BZJ6COQCdiEb4yVm0/rxxd6WJWcft5p9loKu9iPJyJoBXWHHVVd8jAf7S8FnwoTk/Kcdg4FTugVnP7xC7Ip02yrIsWhseXI7JrPH6x8zqHAK7Lx86mQAMdX3CkEBgWy7T7rK2h6Ml7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(31686004)(508600001)(6506007)(38100700002)(53546011)(2616005)(6486002)(36756003)(8936002)(2906002)(54906003)(6512007)(26005)(186003)(86362001)(31696002)(66556008)(66476007)(4326008)(8676002)(5660300002)(66946007)(6916009)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/dn65tCrhXOwJcjDb+9+yG6er3KuWux6D3dajKf85E3F6EBgBhprmtioZbBr?=
 =?us-ascii?Q?Bhr0RDLBuu/VMSuJ0qTfoNN9oEhkQfjKpQZOY02cliWelqre1gYpipsYFvwi?=
 =?us-ascii?Q?QpYLeF8eN946dAre9SJ7HwYcRSUK9MoX5CtMvPcjRnfYZ7nNlnkdHs2PX30U?=
 =?us-ascii?Q?CXRt0btsgcVWHwwgbaZJa3JxHbMpxubjP1ZTXdr309Mcz5wgrDgupdiDfxwi?=
 =?us-ascii?Q?Nkj03C1e3y3QrydA3PL5aF8xRQUUodWHC4vHhLML7OxdDfJd3lSs8TE+BK+Q?=
 =?us-ascii?Q?9p7BSyXgx1LypNBStlhlQp805Q/lSLj0MUqhhrN1FTxI7H718TZIBpPH+Ltc?=
 =?us-ascii?Q?LCo4JI/+Oj8CxWPaqd1xDQHwUp+obCBJKJmNZBvPfDwheUl+WLHSLNaRybPN?=
 =?us-ascii?Q?mw7vr9rg362Bi7Ha4FhNXvlDvWnxtFRztiC21N2CGpGDxQp0ohqFXA1jTiT1?=
 =?us-ascii?Q?qsI8aZ6d4ODuGrDtp102tSnkHnI2CXXnzg+v/zzNChDSDQtcOkFQ2L0Oeug3?=
 =?us-ascii?Q?Hat0LW/iISzi5jVcLJAiL6PX8SQu40rrtmN88S0h3Nrqe7YmfkxrcROxA+IM?=
 =?us-ascii?Q?GlPA4+llcVAxZrI3Bv6lN/aAHXBTN/MTtF+cAvIy458aVC3u0/9EIBVgd+eU?=
 =?us-ascii?Q?FeUkZmB4sPmzzKT/IsjX36kXazGKsuZSa1ckl4zS8VSn6DNK8VIzDtQzceo9?=
 =?us-ascii?Q?HYAXQtDC3bN08Z3QgyPqgWiK0PuzUMXR8G0MHmwGkeWb8zqsmnooY4B6OUGc?=
 =?us-ascii?Q?Is1TBzk5r+3WV1E8GkwVBqhcH3EFdXTrx7HS8Gh+W8BEOfSlSWNIJgEL/YMi?=
 =?us-ascii?Q?yobKuzNYA0VEMyD632+f50C0yhmcjUBlnu+VHLwGWCAUPUIe9WAmjybGSwsD?=
 =?us-ascii?Q?mH2Yo0wvcRyhMHLH08Lf//REh/o49gZ2QpMe0Pwc2BEAMGnlxljLjsnjta2e?=
 =?us-ascii?Q?Vdl0uIdBiNRHwvuzn85e2Xo47lF+dIE3oq5AHSlZyvm7jILQKD1LJCdLU2Vl?=
 =?us-ascii?Q?bghlrWd3vb/9/C+3oNttNToVGCpAM+0011mZ51SX3Dk1f2Jq8BrQ8NxrHmi/?=
 =?us-ascii?Q?YX0i78UGjONBFKgSikbsXawN4GdNPH2XkP/RoyLKCY+lRE6ttxEo9O1QBzwV?=
 =?us-ascii?Q?L0zSIPeaKg3iaCvxq13slTKDHWby8ihQqDMNis1HODl9LwHK+VHQ/X/RC6Gl?=
 =?us-ascii?Q?ZUftsdhKHn74g1cIEBmt74St2/q66k2myvVOi5RcllaQUllumbQAe2SaUg1E?=
 =?us-ascii?Q?32NhYoWSKhbeUCmLoq+oyKCMFjLTnxh9uYjNQA+BtyvsutYoY2s+OljwjMrt?=
 =?us-ascii?Q?I9eZTF2cfxs7zcA2W8Vn5408+6DMxZo8BYtxC5ccIm5CvoJkJZnWlSucWfWP?=
 =?us-ascii?Q?IBWDN9/t+SS/G+lNDsd1QhoxFSfyueprIFB/j4W6Q2AP3H3/3NcO0FqBQtyk?=
 =?us-ascii?Q?s1UhhnBzyO0g/YHqm9mxDqcbVNjoTPb9MRDk8sBW5fydePOH6xOJv3nRU2/Y?=
 =?us-ascii?Q?BF49j+k3OKWKEZLKpMas9q9ne9+F9r/bqtobshprGnx2h2JIR326sIlwIjiu?=
 =?us-ascii?Q?8eLKw6EWd80dpCMtstRkzqrkAiUxeA1U1Q9QLF4wMx4Hzc1wLkEgczREKCQt?=
 =?us-ascii?Q?R0D7LrFmdmcSFB85AyoqeNlbcPfAOeKKgYyTsneq/mSaIrPohIRGXqaudXt9?=
 =?us-ascii?Q?0bv7WBXZZPyF3l24Q1dSNj9aJq5p74Ly9+NKZPOYW6KxkJUg1w8WO9zFzMkv?=
 =?us-ascii?Q?w47nnUUpXA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2603da-b6a6-40dd-76d1-08da2f28a2ca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 06:21:20.3970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vDNtZLFcfkoDqsP8NtG8W4Ro+heq4+4+E9CKwDF8bSvcQJqngZJPLwFJcQm0Z9gkXFX6QEkW7wcQ6S/+n85mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4012

On 05.05.2022 21:10, Andrew Cooper wrote:
> On 29/04/2022 14:05, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachment=
s unless you have verified the sender and know the content is safe.
>>
>> IOMMU code mapping / unmapping devices and interrupts will misbehave if
>> a wrong command line option declared a function "phantom" when there's a
>> real device at that position. Warn about this and adjust the specified
>> stride (in the worst case ignoring the option altogether).
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -451,7 +451,24 @@ static struct pci_dev *alloc_pdev(struct
>>                           phantom_devs[i].slot =3D=3D PCI_SLOT(devfn) &&
>>                           phantom_devs[i].stride > PCI_FUNC(devfn) )
>>                      {
>> -                        pdev->phantom_stride =3D phantom_devs[i].stride=
;
>> +                        pci_sbdf_t sbdf =3D pdev->sbdf;
>> +                        unsigned int stride =3D phantom_devs[i].stride;
>> +
>> +                        while ( (sbdf.fn +=3D stride) > PCI_FUNC(devfn)=
 )
>=20
> I'm fairly sure this doesn't do what you want it to.
>=20
> .fn is a 3 bit bitfield, meaning the +=3D will be truncated before the
> compare.

And this is precisely what I'm after: I want to stop once the value
has wrapped.

>> +                        {
>> +                            if ( pci_conf_read16(sbdf, PCI_VENDOR_ID) =
=3D=3D 0xffff &&
>> +                                 pci_conf_read16(sbdf, PCI_DEVICE_ID) =
=3D=3D 0xffff )
>> +                                continue;
>> +                            stride <<=3D 1;
>> +                            printk(XENLOG_WARNING
>> +                                   "%pp looks to be a real device; bump=
ing %04x:%02x:%02x stride to %u\n",
>> +                                   &sbdf, phantom_devs[i].seg,
>> +                                   phantom_devs[i].bus, phantom_devs[i]=
.slot,
>> +                                   stride);
>> +                            sbdf =3D pdev->sbdf;
>> +                        }
>> +                        if ( PCI_FUNC(stride) )
>=20
> This is an obfuscated way of writing stride < 8.

And intentionally so, matching a few other similar instances elsewhere.
An open-coded 8 here doesn't really make clear where that 8 would be
coming from. The use of PCI_FUNC(), otoh, documents what's meant.

> Given the printk(), if we actually find an 8-function device, what gets
> printed (AFAICT) will be "bumping to 8" when in fact we mean "totally
> ignoring the option".=C2=A0 I think this really wants an else clause.

Yes, "bumping to 8" is what is being printed in that case. I did
realize the slight anomaly when writing the code and I observed
(verified) it also in testing. But I didn't see a good reason for an
"else" here - 8 being mentioned in the log message is clear enough
for anyone vaguely understanding phantom functions. But if you strongly
think we need to make the code yet larger and indentation yet
unhelpfully deeper, then I will (begrudgingly) do what you ask for. But
please explicitly confirm.

Jan


