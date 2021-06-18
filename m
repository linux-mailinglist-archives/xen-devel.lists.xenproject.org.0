Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E833ACBCF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 15:12:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144621.266163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEI4-0007C7-Qi; Fri, 18 Jun 2021 13:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144621.266163; Fri, 18 Jun 2021 13:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luEI4-00079w-NA; Fri, 18 Jun 2021 13:12:08 +0000
Received: by outflank-mailman (input) for mailman id 144621;
 Fri, 18 Jun 2021 13:12:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luEI2-00079o-Pw
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 13:12:06 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f959973b-9252-4a73-a8d1-c61ea922ee22;
 Fri, 18 Jun 2021 13:12:05 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-DeaJU68mOImYFa9rDvEjlw-2; Fri, 18 Jun 2021 15:12:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Fri, 18 Jun
 2021 13:12:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 13:12:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0125.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Fri, 18 Jun 2021 13:12:00 +0000
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
X-Inumbo-ID: f959973b-9252-4a73-a8d1-c61ea922ee22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624021924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgG07cRJC9rjNIy0sCCs9w4UGZnvYXPjD+nBqdwXsQA=;
	b=lNjBHCxo3T0MV0+gtEBSZRRQYU5hJUvVjyr/p6BvnHhu3o9DHUn5QZld+E1LEevYsaM1MB
	1/imuU/rYclIzmvFbfvKKpAn1FnCU8IGrvv4bnf+QgekNyaxLV7hh5rTZzj43ZPE3WHKK1
	Hzj5Dltx+lc5N3eND7p3Rw7tGr8zzjM=
X-MC-Unique: DeaJU68mOImYFa9rDvEjlw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/Yu9DY+9IYIKReECdgEMdzI0by1PEyL5JvAFGYKigAwDmX/0wN1E9nuVZnTXnM1PRxf0NCcgGiOXNof5Ez4MpnclLodJkHyOXRRKxhSCw36WfvMNxYzetBFE86+pPGq90OGbaEvfX+ubaQ1tp2kO6DZCEKa7JkNQFSmaEKZ5a4/OslX/Jl5ncZ1RuabdWIaWrMWqE3Dui4mBS86ovYr4u8x6l2ehrXFVBD5h4L/82U8JXGb7uO3mrI4qIaT8+7Ss5VuTRqWi3Pi6pdfI4waXy9fd6IwNyY98AbXv9U5Y1A9wKdXFxhfJ5TqPzAXuvlvD6InStfR2wj10fVoGL5Jxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxmM7mI43q5nKOuc7n+9LSefo/HVyKynhrajXY2Sq2Q=;
 b=JtTOkLT91vrkeKlSb2y+qArWOOU2PDC/6YNX8DNh3qalweXB0IkqE25blLe6dCqHIHoTkzPcnLZ7O6zobV7zGzCLZ0XxPcs/i2JI0/ofgHHSCY/5KSsW4VzXq9tm0gRsjhWt4dYJabDyloFFEEEJNpgBHfnYzUqMJDfV2DetfLA2GnxVWfh7dcWMch9l1BpEL4Y309LVMaZJ7d5/gY1d4meBYauwKTiecXoI2fk13hJ4IgwgrsnKPetR62H6Va5/YtAs+q0ZHEhYFHJ58OJPUOe7PFcI6vFt7meJSwNXkWxFtrCJywKFFCuo6I1wRlWNrhllxMMLLH1nnYwFU2b+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/5] x86/HVM: wire up multicalls
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
 <c3c5df61-32f8-1ffa-aac4-0c83d620d385@suse.com>
 <511f161f-75b8-f23b-c6ba-cd7afe303760@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c46915cb-15a4-10ca-a566-b892eb8dc4f1@suse.com>
Date: Fri, 18 Jun 2021 15:11:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <511f161f-75b8-f23b-c6ba-cd7afe303760@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0125.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 725e831e-8842-4a5c-ab6e-08d9325aa890
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43514AFDB462D96CBC0AE727B30D9@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rBVUHLKhliHvmjeB2FdXoZgKO6Q/1z79fVv8kTl4k+Ss8HAF7R587xs4sJ4fIQ18gumvHqcu/LDgFSt8OvMYqXK4IMFvWRE3UObsxQvLnOJBUI1NnXOBG45TEWiZFIcXy2PyemXHfgeRUL+AhmXy0TNISehyDId/v8C3AB81igEPA7NactPDGsEOCqkortHw5EtRdlXjI8LEDQ6eWkEwZYNQwy8PXnoDRjYH8Z7uEMH8APPce2k0D/QnS76p+JuI37eSrsz3kVdpvWKYbRMOZvtS8kVvpeedoqUsumMVsx56dppezbgSPvV1yLMD8Ho9aj38G+8Kbe1sy8pBtn5nBIJ+sq1bTqjZc//jk/L1h/MlymaV3m6G6DBVKAu7lRPK3KjGwfjlH4YKTLG7Xuy2uDi2+Z2myhSwLpD+lAGh3GQblY83FUY41vdCTNWvLrhg0QfisGIr6oro1Qi38RDrpxHYyPd9SQDcFprSOIB76MxlfIU2eKd4p5/MsL/mZTjviBQLv7oxU1zkWLPBja1/YH+48teqXtIZgjCQ7Jm9EAnSqhWZ5DhFE4EghMniMYOrhn9QG30eUio+mjaLBfhYpTBk3jZaZf80T6WOo+zpYs7Drlwf5uhn+FArW4UdLrIWrBfPH14kBi/W5Ff+Lf62QOfohL7+5C8eGhWgFIo3ludXn4f9IrFQuxdH85bd8L+JYnZuAnT0lkXyn73A+mljfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(39840400004)(366004)(136003)(5660300002)(38100700002)(956004)(6916009)(8676002)(8936002)(53546011)(16576012)(316002)(66556008)(186003)(66946007)(54906003)(83380400001)(2906002)(66476007)(4326008)(16526019)(2616005)(31696002)(26005)(6486002)(86362001)(31686004)(478600001)(36756003)(156664002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+rvObwhLpLml0lCuOmFkgDq557DuRtfDq1g/jMxCC58raOLEUMUEEMPEfyv2?=
 =?us-ascii?Q?qIllVR5ABHmQKb4Nc6Ibxi3SyslzRvnuXoMDVig2106TJf3sSbzrU13NZJwk?=
 =?us-ascii?Q?G5m30W3IMIHPg71F3WbO8v/XD5+1q67ROldzOhOICVeOKZMCOuErjVsxU0/C?=
 =?us-ascii?Q?8SIaXBiPYWwYUlP1h/5huMy3K3FroDhDC/1Ck183fgIzqfpvCD/4aaCjmAnm?=
 =?us-ascii?Q?w9oBRJmqfu2CqRlamO3yFsFkepAojzAG6N7dzmT21GysLADQLCEydxj1RR4n?=
 =?us-ascii?Q?CD7kFKD1QL8wgybkjlwzJwVP1zBkOTIjIB/n0/qntL+E/SsfFcFxh/bA6T39?=
 =?us-ascii?Q?ekriPpmYMJFCaF8MlAr6x27FgNdDRMDbkpHF43hfc4Z06ttxj/UVD/DccFb3?=
 =?us-ascii?Q?IJJyddAYoKQ/Bz99y46T6YWveIcRKDsU2+d9FjLjgQ8yGYGFSmPnRPSQDdxa?=
 =?us-ascii?Q?OAsjOhItW0Ij6FtPNqZRsFVLtCBofeTaGrBLYrexjS5/Qh/9ER0lY88JH1ic?=
 =?us-ascii?Q?X9VUOFdxngXMoYSeNIHlX68g9Y4Rh4UTd6soZCRPB4DKNHz5lm3KmrHwM59/?=
 =?us-ascii?Q?jB/aWcxlOS3V3v75rUtLoEVYVxIvW702FnswujX4dEzMdGgv6g46gcqd7noO?=
 =?us-ascii?Q?Yk6rOX4EExKPKBSxtIn+xeCit6Cv4xYjhJdzEBWbkieQxAVqPbM3VwAOjA0M?=
 =?us-ascii?Q?bLyFR54k/a4b1ViVz2EGveRHdLitglvF5o74kW1ycSM5WLkeJ0tw0JAuqSxG?=
 =?us-ascii?Q?KBJc6B0ld0/1eB/Rca2fQHUt9uOBUYOpa0Ve3tBQjdk6RcviDB+MaXjwSHCq?=
 =?us-ascii?Q?Hx3P8n+VfELq7Zr6eqzQvbRwqZnvVquCqHgIawwlMT2J0TaopJ6PTRn0A5jf?=
 =?us-ascii?Q?zda6gMlpYki5BKM8Mdu7ZmaIrtDFG04zDiPYrNbxFjPJm74sL8qLsaDtQuMB?=
 =?us-ascii?Q?hO6B8nWQxMU1QquzmJdPSL8ugmvdcntx2M8MydFIn7gSqzvpst1LKyTPa03T?=
 =?us-ascii?Q?ESofdMUwzE6GABhwBeHYt3amCXwGFXBEbVtJiaYSxxQWNtS417xk/0biwZIS?=
 =?us-ascii?Q?hHVo4QIA0QtBrTkY5bXO7HLefjck3vX2Wg2MBEyVADWJ3iT8qnR9wYM82hGD?=
 =?us-ascii?Q?d/AEPZAE/aAiVcWUwZT3wB+91L1sfcXXBp4bHcIZ5pqsCmrzSx1gTIUGSQe7?=
 =?us-ascii?Q?3zcLBDUsq1xhfFQ1xCzrTvk4mZxob+LkjU09knyx/pAAZ4jHst0EJclYR9W/?=
 =?us-ascii?Q?VPF/wSclpRDlYR9eyW1IQVx6uEc/wjX13YlJr6DK1LWiHC/ndCK2jcHGLVMY?=
 =?us-ascii?Q?Blk/osXOsioOniniiZBBuAnn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 725e831e-8842-4a5c-ab6e-08d9325aa890
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 13:12:00.7214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rgy4NvxXd8lKDc4DyVspKSK4JGKpP11/qlVvAzykL5HRDxLXriTyDilsKRARgOLxuKBHl3J17x5NeJfJ5UleXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 18.06.2021 15:02, Andrew Cooper wrote:
> On 18/06/2021 11:23, Jan Beulich wrote:
>> To be able to use them from, in particular, the tool stack, they need to
>> be supported for all guest types. Note that xc_resource_op() already
>> does, so would not work without this on PVH Dom0.
>=20
> I'm not a fan of multicalls as a concept - they're mostly a layering
> violation adding substantial complexity - and frankly, working around a
> Linux kernel/user ABI error is a terrible reason to make this change.

While I agree with the latter, I don't think there's much complexity
here, and there are certainly savings in terms of mode switch between
guest and hypervisor when you can batch up arbitrary calls (and not
just sufficiently similar ones with built-in batching).

>> @@ -334,6 +336,39 @@ int hvm_hypercall(struct cpu_user_regs *
>>      return curr->hcall_preempted ? HVM_HCALL_preempted : HVM_HCALL_comp=
leted;
>>  }
>> =20
>> +enum mc_disposition hvm_do_multicall_call(struct mc_state *state)
>> +{
>> +    struct vcpu *curr =3D current;
>> +    hypercall_fn_t *func =3D NULL;
>> +
>> +    if ( hvm_guest_x86_mode(curr) =3D=3D 8 )
>> +    {
>> +        struct multicall_entry *call =3D &state->call;
>> +
>> +        if ( call->op < ARRAY_SIZE(hvm_hypercall_table) )
>> +            func =3D array_access_nospec(hvm_hypercall_table, call->op)=
.native;
>> +        if ( func )
>> +            call->result =3D func(call->args[0], call->args[1], call->a=
rgs[2],
>> +                                call->args[3], call->args[4], call->arg=
s[5]);
>> +        else
>> +            call->result =3D -ENOSYS;
>> +    }
>> +    else
>> +    {
>> +        struct compat_multicall_entry *call =3D &state->compat_call;
>> +
>> +        if ( call->op < ARRAY_SIZE(hvm_hypercall_table) )
>> +            func =3D array_access_nospec(hvm_hypercall_table, call->op)=
.compat;
>> +        if ( func )
>> +            call->result =3D func(call->args[0], call->args[1], call->a=
rgs[2],
>> +                                call->args[3], call->args[4], call->arg=
s[5]);
>> +        else
>> +            call->result =3D -ENOSYS;
>> +    }
>> +
>> +    return !hvm_get_cpl(curr) ? mc_continue : mc_preempt;
>=20
> This is ported across from XSA-213, but even for PV guests, it was just
> defence in depth IIRC for any cases we hadn't spotted, changing privilege=
.
>=20
> There is no pagetable accounting in HVM guests to become confused by a
> privilege change, and hvm_get_cpl() isn't totally free.=C2=A0 Any kernel
> which puts VCPUOP_initialise in a multicall gets to keep all resulting
> pieces.
>=20
> I think this wants to be just "return mc_continue;"

I had it this way first, but I think the state setting hypercalls
ought to be similarly protected. In fact I did this adjustment at
the last moment before sending, after having looked at Arm code.
If we don't want it here, it ought to go away there as well, and
then also for PV (where then only IRET would need special casing).

> If so, Begrudingly acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, I'll take this for the moment (ignoring the "if so"), but
I'll wait some to see whether the above wants further discussing.

Jan


