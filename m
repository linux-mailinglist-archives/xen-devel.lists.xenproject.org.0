Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867634D5D23
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 09:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288848.489930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaTw-0000rv-21; Fri, 11 Mar 2022 08:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288848.489930; Fri, 11 Mar 2022 08:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaTv-0000q6-Ug; Fri, 11 Mar 2022 08:18:39 +0000
Received: by outflank-mailman (input) for mailman id 288848;
 Fri, 11 Mar 2022 08:18:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSaTu-0000q0-GR
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 08:18:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9bf93d9-a113-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 09:18:37 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-nmD2GCCqOGa5EGffebEb9Q-1; Fri, 11 Mar 2022 09:18:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3756.eurprd04.prod.outlook.com (2603:10a6:8:12::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 08:18:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 08:18:34 +0000
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
X-Inumbo-ID: d9bf93d9-a113-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646986717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEMrupQxHKXScyxV+gcQit/P6hG0ObWUOL/SvpRO9m0=;
	b=GYPbQsTnX0zf/PRZxlreD7txaswLkHTQmo7Y/7gB9YN209oj5azATjpYK3/c1C3zqdyUJk
	T97iTgzdPo/o7su1PW+oO+EjpvLiZ+T81LKb6//QlSO/mv+70lMZUX4F0NrVWjPLNnRhEH
	8NFV3m/ZPiXExh3/LzzDu2fPzdC/8w0=
X-MC-Unique: nmD2GCCqOGa5EGffebEb9Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LH87ZTVCXBbA1XnRnC2aoRImnLn30WzurGQzdNJAuHedeaiue4/bGnY9qX8FupbadnNGyCvPFt2rivc5CbkkTYE/yvwgCyow5kuMpzMg7ypQzUQ9YGSzYni9HGESa/ZrIbj1b5H8CDpse1dQ0jyZtSvGDbU6+cv7MV2ESglDdPBcJZayJYqNPXleznb0kluI0rtuMmElj7VlfI2ZQuzsB29pyUDvz1WsCtX7/oGEUBr/GAn6VBQsWfp0Ct9K8VIxno6z/vEhNYpHCg+MK9Vk1XAYNLLEcyJqgMeGEmLdsSzAZh1AvzPzSnMfQ16jM9pGnQlPVKrJDQEjjuIE9ZDFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFAvEK9VlK6CHPGYBUtNcbmWwHUOBj8Z9Dz/0FXC03A=;
 b=ZLE7JL7vv3Ge6yQoQO+H5eKvTUrG3LTBzOtig9u9kFHKTtV4wooQuFS/7vvLz/C6wdCXd8Ms5G/no2g2LNZY9NC4l5Ue5XKH+JFMiPpWWFJIjS/mbrZQxKnppAilYUgSs2/YprVTGblSUAsRfxo/kwCwAB5VmgKlMsRRCUHqqt6B3EMjVkbEp0UP4QG9qhNE3RuR8tEpZBkmZm9JxDaRgpiwwe1xbNLo3fxVeISwX3TjUElhD1+WPv5nYgtfg/+ZrbMmA2v8MmTU+dHX2vVTTysSrQD63qn03cKWdJdxzyN3ZhKlzNfDhMTq6912mkz5ejTPKZ2SF/mxYDSnw0WsOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44f928c0-b3fa-ed5b-4622-dd5cb044d459@suse.com>
Date: Fri, 11 Mar 2022 09:18:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 3/3] livepatch: correctly handle altinstruction sections
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, doebel@amazon.de,
 xen-devel@lists.xenproject.org
References: <20220310150834.98815-1-roger.pau@citrix.com>
 <20220310150834.98815-4-roger.pau@citrix.com>
 <2e2781eb-2c62-1c93-ef8e-75054a213fb8@suse.com>
 <YisEZ2gYrVIAozYU@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YisEZ2gYrVIAozYU@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0093.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c82bc159-0358-4a2a-65ec-08da0337bc3f
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3756:EE_
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB3756A53C68B46F02567D7C16B30C9@DB3PR0402MB3756.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F8O21EV2HZbVBZoQMi/PPfUZpDreYXleLl/ZFVbfmax/NmS+xezkO1S7wIzuDJbUenKvWH2IGfpQRtz3p9jkGCTcb4kjl0GBE09jyFORg1IkgfzRKKVEo0mV6pK9EsdeWEvAtDmskVqPCC66LoJHGdLAVTzHtPKCj8XTXDTgkz/ItRYw/pVAdrmOh9FFXEYL4HMOOZ3saWrpCr83MuTKl1byqcWoDT9AHHo9IAR8pTRe6N2hv0jXD5p2NepQornW1KL9VTRLVbfp/3bPWHwDJ4POcIZu+FUsPfeYlsADq5+8VH5OX+mhuXX0Gr2VRNOLJ3/XmfyX9r1pSJH6rFfpL3YOxTmXkcW5kgSzRO9cD0vAIEgJi4yaKhqXGaT1uV9tVG1Na0fOjncIHPw7aC6zLDlrLlBOwPDePqyzD4Mz+Mh9E97ai9B3vUl0jgmkyLjVtw0l4lezVeP8HzWav1O37uXB+aPlHNtNhefd4tcJnT1jdbY3qct0ReAoNnXdhO/kzBlxYZSGwvsLptBuKR0tDEGvVHlnfaCfUDpru6z2OA3KAc4SM3CI0YIW6313ttPEb9PYRnD0Wq5oql0guT/eA1GzBkx3ZVKNlhCTQQ92Ufdl4Z/uyzm+lfBDIzbeldojCzNw4AZaTMV91hN0Z768WsQOT03GHlCtLA1JqyWqc9VXcRqA5QyAYANlpNf1QXXls1S/8GsN3tXpf1ILEH9D2Xi9yhSqUDR3WnCLLXfkoVDR6Uq9WCj65cR1q3/BQ2FH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6916009)(508600001)(316002)(66476007)(66946007)(38100700002)(66556008)(4326008)(8676002)(2906002)(6486002)(83380400001)(6506007)(6666004)(31686004)(6512007)(53546011)(186003)(2616005)(26005)(5660300002)(8936002)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uB/wems8mnU0/ZU7JQydlPrTr7LRJWl1KnzH5U5pmmXBGLhiMAduHkMEgfbH?=
 =?us-ascii?Q?Xyjg7dfdhWEpHm6zC6db8hArGcIY/uIhv5kYYWCQCLuLGB6YYin+aUsF/5Xy?=
 =?us-ascii?Q?ewf1CXOfJHDpoFhn92kwcNysjVRifACzTzqI+zj8zM6oFUhzgieFESqSaxQ7?=
 =?us-ascii?Q?JjtbUWhz49Ih8JZb536JUI9h/Jzrfv8nFehMbZeGgu+nC1y6w2LJa185JOyC?=
 =?us-ascii?Q?WVw9LYcZn8M6vxlbjR91JHgJhpFlhtuFDWNhYRZeexm7iWo5Aqy7pY1RnV5d?=
 =?us-ascii?Q?x7J0uEOmSMrdj5ScXv7g7gqgAbYrJPvJvK/dEKLFQaO69PczVs0bhrhN6W2X?=
 =?us-ascii?Q?6kCCPEclWWa6NqeZmpvd4WrDOcD+gSvPCxlIe98fOfCqAXyp1SaH1mWct9Q6?=
 =?us-ascii?Q?W+SYpia8QlU/zcAyh+eOd3CFM1YGYHNrRF6YBI7b1Rb1rTZI7akQIuZqM8UQ?=
 =?us-ascii?Q?qMNBwjA/pZg7bJ6v/qxY/JxTehYIogR3tG4PaJFP2xKmGzyZZZ1LjhLGqyFH?=
 =?us-ascii?Q?mh1IavRXGc4bPzCwb7UvGvIICae1tpQwGlZ09ws1HBiqJoX0VSOv918iO8yp?=
 =?us-ascii?Q?AAYg5Ar6k/zNYXkO9s1SOfnILSrgOJ6YzY5EjFJuQsYqF+SkLzeeJO+YoLko?=
 =?us-ascii?Q?B/0SfWVyI39BTO/UzjbflVhCmB+Mt6IKptXcAX1KvVf6bnuvXfKsv8EEQSaI?=
 =?us-ascii?Q?SI7u15/03KFWO9wMX1OyyWk7Hctvzd4mEDX1frupUOhcLN7UTl+074mtUcj9?=
 =?us-ascii?Q?fHZLsxwyIIqp9sCmY9oK4pCpeptCDJtatCp4JHLYUOcToZwoBD2N+sbgK09X?=
 =?us-ascii?Q?RaoXx6EDaKXLh05lXOmybTIung1wskJod8s3RMcKF0N11Y/11Xx91yk2Mm//?=
 =?us-ascii?Q?WBi5sJ9/1qEou/iBqgkbdE2/wLwNdMen33saw2ZvNNNXf95e0mdfhcSAcjXK?=
 =?us-ascii?Q?4cL0UObF66FUiHV0MjPkU4E70zS/gmOIkhR4T42GDgKUJOr5BMJtGmAFdDhe?=
 =?us-ascii?Q?u28hps6X/IHm33LI1JimFqYVdlUeNVQf4fCn4MYQiq5M0XOQNMvcvYlNree5?=
 =?us-ascii?Q?4ABzBDeMF4r/8JJtC0xaXhtk28ecZhZW3Cls/81rWZ6znxstpsBgJqVwXAN7?=
 =?us-ascii?Q?SNfDffsdKiHPXOJS+oMpaOk9zjBdsqPmN+qcTwj+4NvN5bcN/Kc3HLM1JwWn?=
 =?us-ascii?Q?FmWIwxXmiv5bAVrc0i5wN28e5c/y2d3z6hV0SiNuxzeirlHVQHWwi6MVyLK+?=
 =?us-ascii?Q?XI2/zsRX5EmZAR4mOx4EnaErCCNgh5jO5PUNvEQ5JAPo1U+Jo+r8v9hsZLwT?=
 =?us-ascii?Q?0FzzxBLBBaxsvg8FdkLsYIg4yGHWUxbb8HKEVUm60rzTN3o/s1xFi2bjFlE8?=
 =?us-ascii?Q?g1ggjOC/PaxyIHpqy8okMkQ1f1FUqnIPqDR59Xe70Mljb4iqxrpT82QNpOym?=
 =?us-ascii?Q?1n5IfpjJHiIXERaMdepKDD9mQ4wW2Bcv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82bc159-0358-4a2a-65ec-08da0337bc3f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 08:18:34.4264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTZ/QqOJ5ovJOzOMDs4XYfQ3DavRbRmv8dgwGdrcHGeslVExw22CO9eDfbWrpdH1TGzhZS3jCeLkZUFjhBnoIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3756

On 11.03.2022 09:12, Roger Pau Monn=C3=A9 wrote:
> On Fri, Mar 11, 2022 at 08:35:18AM +0100, Jan Beulich wrote:
>> On 10.03.2022 16:08, Roger Pau Monne wrote:
>>> --- a/common.c
>>> +++ b/common.c
>>> @@ -249,19 +249,22 @@ int is_text_section(struct section *sec)
>>>  		(sec->sh.sh_flags & SHF_EXECINSTR));
>>>  }
>>> =20
>>> +#define SEC_MATCH(n) !strncmp(sec->name, n, strlen(n) - 1)
>>>  int is_rodata_section(struct section *sec)
>>>  {
>>>  	return sec->sh.sh_type =3D=3D SHT_PROGBITS &&
>>>  	       !(sec->sh.sh_flags & (SHF_EXECINSTR | SHF_WRITE)) &&
>>> -	       !strncmp(sec->name, ".rodata", 7);
>>> +	       (SEC_MATCH(".rodata") || SEC_MATCH(".data.ro_after_init"));
>>>  }
>>> =20
>>>  int is_init_section(struct section *sec)
>>>  {
>>>  	return sec->sh.sh_type =3D=3D SHT_PROGBITS &&
>>>  	       (sec->sh.sh_flags & SHF_ALLOC) &&
>>> -	       !strncmp(sec->name, ".init", 5);
>>> +	       (SEC_MATCH(".init") || SEC_MATCH(".text.startup") ||
>>> +	        SEC_MATCH(".altinstr") || SEC_MATCH(".ctors"));
>>
>> Having dealt with this recently - what about .init_array? Modern gcc
>> prefers that over .ctors. Of course the question is whether either
>> really needs dealing with here - these sections, to my knowledge,
>> appear only with gcov support enabled. Not sure that's a case where
>> livepatching is actually expected to be used.
>=20
> .init_array will match the .init comparison, and thus is already
> handled.

Oh, I guess I should have looked at what SEC_MATCH() actually does.

> Regarding .ctors, it's certainly an .init section, so it doesn't hurt
> to get added here in any case? (regardless of us only knowing it being
> used for code coverage so far)

It certainly doesn't hurt, sure.

Jan


