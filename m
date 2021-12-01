Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB824649BA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 09:31:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235669.408806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msL1A-0005po-A5; Wed, 01 Dec 2021 08:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235669.408806; Wed, 01 Dec 2021 08:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msL1A-0005mn-5j; Wed, 01 Dec 2021 08:31:08 +0000
Received: by outflank-mailman (input) for mailman id 235669;
 Wed, 01 Dec 2021 08:31:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msL18-0005mb-67
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 08:31:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0633c628-5281-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 09:31:05 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-VIb3C_EIPiSsYwvBa4_jCQ-1; Wed, 01 Dec 2021 09:31:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 08:31:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 08:31:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.21 via Frontend Transport; Wed, 1 Dec 2021 08:31:01 +0000
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
X-Inumbo-ID: 0633c628-5281-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638347464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6HmHY5dE76DUzj/x5lhUEGUhmeyoavbxIoxMRJL3dts=;
	b=eH9kKqw7jJKf1+iJvCCuuLFRKBhd/pisQ9SSndsntkz0DNbVNYJxYUGHkpLUbMll2k2vwM
	0QVlP5oY2xmgslWuZUrpvAPt0cjxzqkUR6wDw/ywggmiQpK+yfLKBW96TD5dSmX2/ZxPE8
	SaDvcBn4acvLFwiMeTtMH+Zl2cF+hoc=
X-MC-Unique: VIb3C_EIPiSsYwvBa4_jCQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRpUowk1/BoJ3bqdx/w083Mv8CCg84VRfRXsTXkQfhUQehuqk9ZQiVjbXot7hLBoiM5ywir9d73qBYvUf8Ig+04WZ6ApFRBmqJCnTVpPke6mVwcHWPrUf3fvP0gOnuBVhyo3vtngFUOSVrGOPLRCejzv9QjytTdqS8DrJ3nH6FFNg8EJhX+WEztJvKZxEmh77NpzKx9OuOoKlmDgj1EVGK4qFmy5zfAjOfr5NZieys80PXczi6Rtk0MxlQBmftFjYFd50QSwiw+1GMkYhqFTaixwH/jOsLs8+4vwhoHOFvy+//ZbA6InOcFq2wpH7FoT5YKz39FNky+aHmsrG+zkTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdjsxFx9RDSocv7m53yughdCPL2k95NBFvazzjrlZUc=;
 b=GaApeQOU1UHXDfUCSKzBGNZfmObhGxwymYzPw3cRVtZEM+QQuQ9gZxvXID3KyBIHrhM67ukcvFtafu+IljaHqkXJb6jSR8eoSxPj2Iskdl8DAz3gr750vyOSX47iQPjwCPb27yQsdWpbYmerTnVVCG4lkruj0F772L2havlJiirUtLNDenqQowwwuu31OGSsZSHw4QrSeipeO/kfIIw6PFlUDQ+p8Yn9ERKJwBV8GOOd6eqdnVSeJ+PWePrug4iEbJYlAN/K0s7Aumewhu688j1QloqwzKFUimFG+9tjq97PZXdSC0MHfA0D4fdglspf2/rcvxxLoPnNcNOMXgZf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ded8ef9f-9435-1b5e-32a0-1b7e93b15a52@suse.com>
Date: Wed, 1 Dec 2021 09:31:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/3] x86/vPMU: invoke <vendor>_vpmu_initialise() through a
 hook as well
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
 <66e64fc5-34f1-7877-42b1-3533136f56ab@suse.com>
 <35e2dab8-e274-839c-23a8-25f4c121cd08@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <35e2dab8-e274-839c-23a8-25f4c121cd08@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0018.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3678e741-a3f6-430c-1b35-08d9b4a4e8ea
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039AC69F81487CCC9E02115B3689@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aucNVPeubcg1DxtrUBDZ4O3TRbpy/ebRGQWtKYyN3DEwFoKixVjhS6B3KPHaCJZvKKndqj21KN1lCtTRB8LahECcGk96eRoBBiiGn6JtPw8ITokJbdi4IllK8cDeblHhlYKXhu8lLqApBUD4HmVqkvGceiDleAfJk3t6hQxQTc9mRIKMjtKd0DT5yc+mXE6fVt4A/k/yXbg+ytXDNWJ64joEOvpjAojD9+vvQXRG9A3TMRK+fYTAWEc/eB4UwKoF0s/PSNvHkG3pqlW/+ZnL2OIyLbkZHlcLfjjyuAt3Pm6krz2531G2LsNtM3eHlhIXK1avRsc+hWuC0vUovKcc2SNduX6eOdgXC4b3g5rbBPcVNbQW6K7F0dgBJorS8q8ucFip9+JJvCjQl8XFoPugnhCajKP3+bXOxw4THNFlw5R8YcWDCPix+ShvZJM5p2UQgE0KW3JQp4Gd7wNS9kUi10y0M3I6+6Lx1f179Yn/CxtKXnShEZgH0vJfZoUdOROGqvcQSGqhfI6+ao8yAuK5S9ONL1B8LHJPNzPI4uFXopTusiPyjOieUpsuBtKpvKyzk5KQoELgmM65qi5jUm5/nphpPC3ZxQx5W6wdl0NJdZ3vhbyiAr5hmA+HR8WG8w+jrrhNwT6zGZau4g8UgQDSYDrH/Jyg5TQp33wffG/Rz89zEiTe03eSEpYbJcKz3b2asWZ7fUV/seLQEbedcikt4eSp9QrB+sjaqCUU4B+NnXdcRTT4FN4RnjbR0mgGfKVh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(6916009)(83380400001)(66476007)(5660300002)(956004)(4326008)(8676002)(36756003)(66556008)(6486002)(16576012)(86362001)(26005)(508600001)(31686004)(38100700002)(316002)(54906003)(66946007)(186003)(2906002)(2616005)(8936002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3pkxj37sTwhtWhg/KCqxtn/R3Clt8O7G+sN8f+IP63vAqLCw7CM+KLmjMv7f?=
 =?us-ascii?Q?TbqKuWsKDg0U+zjxuomrlPPZ4RpRolIA4f7GJtFRrYynpQmaM+YcB/NNqgnw?=
 =?us-ascii?Q?8ip/fYkAZ1ZuttvG6ljWCIzoB8EXqLVudrcrMHJrY4nn1j2u2yoXyUBxoSat?=
 =?us-ascii?Q?i1lHWPlm3oHA5POdtpYprh8ZlFtELsuC/ucTsYghnJ/OYQQFsG+D8QTlAEqe?=
 =?us-ascii?Q?2HnbpmaCv+HH6yzkmCTLeCRj+UMedW9JJn3/BpsksrGtcEd3GaQs97VcoNbr?=
 =?us-ascii?Q?3pZQgmQNC+nsQ0QxI+7iIIfXjoMPv7/9fxEQHHmXagKAaypPDkV5d1eehIIc?=
 =?us-ascii?Q?Qjh1CX3//mXxAzhXluqS1HvWZHGuikEXlxjani5xnwJ8KAckpPQ5sYWOacPu?=
 =?us-ascii?Q?JWdpjSQGalThfATvWRsSaVrvG+UnnX5GkTWWE2p4/4xfkKNhwiCnX4SfBHgT?=
 =?us-ascii?Q?9qBFGvoteRkw7kCe9ESiaQwfmdLQyxc66cQ1CfeNbL9J8MJPTeOnQ2OsdNtc?=
 =?us-ascii?Q?jujGCoodHg4MCfQTQ+4PoRQOregcCfTOdFk+iMQL4xpQ4EOGer7tsovVY0yX?=
 =?us-ascii?Q?3TS+cwHxgB+fm++cW2BG6k+v2OINv+VZKbKBnUJc220mtqvqJKhIIx/JdUDo?=
 =?us-ascii?Q?L+hJqSvc4HfHDeQhAUcIziRblCv1jq+6Y89+L2DADC8rANDQxAhWIz2HExYD?=
 =?us-ascii?Q?7CaCg4F/VnguYXjAgl5QvY9Im0SIHflAGl7aOP6MxFzrRzkOxWinmgNtE398?=
 =?us-ascii?Q?MGxtbJ++L0ZBH5hMhn2YU9BY53fpAQ94nXo03EzdguH1K7hDM7/WD00vZnzY?=
 =?us-ascii?Q?nWjJaL/FdGPlMnn2lesVRpxGV2HgdsCXTReoZ7BYoxQS0RtgLNoFgV4kThta?=
 =?us-ascii?Q?UXPdFK6btQsS0gb6V8+WJhN4xb14GphHetPDQS1uxZbPnRA9kJH6FFG9sYyi?=
 =?us-ascii?Q?HqkK8HPXIpvWcc/4ix7qjtv0/O9DjXXLJ4G9G+VK5OLpiL5KAeEGAWrerv1I?=
 =?us-ascii?Q?Z+aXahrUeRIDmKBmFORRrlK+V5NQxaSBkSQrkiVvPjiF3xl2yUR9SjpnGN5a?=
 =?us-ascii?Q?moSc58EiRLmjPVAqOKUod+p+AqBspXvXZK0cDOs26g3IE0Oz5q+qdZ2jpeVZ?=
 =?us-ascii?Q?lB2+MWsCLh78HX5K1CJvmRufvvxFZ37TDewvCGgdCv4gZqAVRgorqgk2M2Tu?=
 =?us-ascii?Q?AQYWfHUVmqcEncfcVSWjaJLNtWK4T2z9R6MyMYxaHylragOQfF/zB5mVDh1x?=
 =?us-ascii?Q?xNfv7QIOXYvYy4vqAD0ebn04aA3Y1ser2rgNn+G6JA/MU4f7t//MqmWBzMDg?=
 =?us-ascii?Q?xGQ2x7jEmUSHq57q+I8IjyI+GevjVowhSEEz+y5iLuEp7pVO+j/lXcXkaln4?=
 =?us-ascii?Q?mjzLs4nAvVjXCy8B4QU6IBNZcIzKKmkaBUBTND03iVRquniM69be1pREhPBh?=
 =?us-ascii?Q?uc23VsifFaLLZlAVtuY1VtDQMU4bJu/nHcqDmcEPof6QpP9AlRG7lwdD9pmS?=
 =?us-ascii?Q?It+KQpYTimCXmetKxVBUH1ViTu0viM87nI8SIl01HKGGl1zjWX1ZI5NGo3V9?=
 =?us-ascii?Q?PFBQAa4hIVNYczS7cDCrRdrY4wIKldWqkwOzQ+Dy5mL7jXzTtTpFJROJVSSw?=
 =?us-ascii?Q?yaIWlryAUhkewaWX8rUrO3I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3678e741-a3f6-430c-1b35-08d9b4a4e8ea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 08:31:02.6707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1oNDttBNK1dTRkO62Ku6h/BXqd4qMsy9c10gQlrvvlm1xF0C3KPDTuQrls7WrluQ4HUgkCSsPxFdnbUCQqWgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 30.11.2021 22:18, Andrew Cooper wrote:
> On 29/11/2021 09:10, Jan Beulich wrote:
>> --- a/xen/arch/x86/cpu/vpmu.c
>> +++ b/xen/arch/x86/cpu/vpmu.c
>> @@ -480,12 +470,17 @@ static int vpmu_arch_initialise(struct v
>>          return -EINVAL;
>>      }
>> =20
>> -    vpmu->hw_lapic_lvtpc =3D PMU_APIC_VECTOR | APIC_LVT_MASKED;
>> -
>> +    ret =3D alternative_call(vpmu_ops.initialise, v);
>>      if ( ret )
>> +    {
>>          printk(XENLOG_G_WARNING "VPMU: Initialization failed for %pv\n"=
, v);
>> +        return ret;
>> +    }
>> +
>> +    vpmu->hw_lapic_lvtpc =3D PMU_APIC_VECTOR | APIC_LVT_MASKED;
>> +    vpmu_set(vpmu, VPMU_INITIALIZED);
>=20
> It occurs to me that if, in previous patch, you do:
>=20
> =C2=A0=C2=A0=C2=A0 if ( ret )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk(XENLOG_G_WARNING "VPMU:=
 Initialization failed for %pv\n", v);
> +=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpmu_set(vpmu, VPMU_INITIALIZ=
ED);
>=20
> then you don't need to undo the adjustments in
> {svm,vmx}_vpmu_initialise() in this patch.

I actually had it that way first, until noticing it was wrong. It can
be done only here because it if only here where the XENPMU_MODE_OFF
checks move from the vendor functions into here.

> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although
> preferably with the VPMU_INITIALIZED adjustment.

Thanks; as said, that adjustment can't be done in patch 1 just yet.
But I did add the missing trailing commas.

Jan


