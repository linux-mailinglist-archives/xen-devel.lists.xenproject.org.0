Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D3D50B6A4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 13:56:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310850.527811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhrth-00064H-CY; Fri, 22 Apr 2022 11:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310850.527811; Fri, 22 Apr 2022 11:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhrth-00061y-9E; Fri, 22 Apr 2022 11:56:25 +0000
Received: by outflank-mailman (input) for mailman id 310850;
 Fri, 22 Apr 2022 11:56:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhrtf-00061s-0v
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 11:56:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a16878e-c233-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 13:56:21 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-1FQcOTp-MMiSMZ9psKjy2Q-1; Fri, 22 Apr 2022 13:56:20 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5919.eurprd04.prod.outlook.com (2603:10a6:803:eb::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 11:56:18 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 11:56:18 +0000
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
X-Inumbo-ID: 3a16878e-c233-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650628581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I4LwGOpsUZw5E+FSj4xztBrtq4Yu5US9sbJqhXKUb2U=;
	b=CvAMkBJ1/dpvc0TYbh627bFr12FoRO63cVNfwR+Vhasw7svzx8Xcr7vBBp0exFx2qhNDCT
	mRxl6dykW8RfxzN43vSJMvAYm+xUd4kfYGl5JZNb51dsNstwbOCjahgGEK2QWTS5DmQznQ
	Oi8C38egm+qaRdwgifgmQkf3t2vBEkM=
X-MC-Unique: 1FQcOTp-MMiSMZ9psKjy2Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIN4LH0ARMZtldEf7zwpDZXToNYdR+4ROlThNC7tBz3ggqTbk9sCImR8aMWhsWc/zdC/rXLHIfSlAbNHuPpvI5emBO/kuR8Pdm2JUeV3QW4IxzBJEju9Hb9dr+Yhj3WOX7w4Zz1V9Se+KkylcXPUzgLxOYa95Ro0IUVWiXFoAzR5fVZ6U47QVL9g4+SX9vX/oWhlek/6SlkYW0uyctJTgqDJDUjGslzZy/ox8Kgo6k3/GVznU2K7pet+QacDfPHHxYQVhFQ6MFx9dxgIEAZid6DlAZ/dBU5084GwqXKlQkHyEiEREMEa5EM/JUNBNr4soJNruysfDn8UeKp6GUs+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYHP4Hj8cxj8+b8AVmKuZOBskLoXp/nmnzhsHZ5kjsY=;
 b=QSryXgmoBkqL57HckJYsXXyXFvI3vbLDrUvEIvRVTM0V793apV5uh3Vo4fmVHsdbxe84X7iaf1+GPPpNeNwUOFWU0gL9hNziRxqsdunu01mfgBGpS1vUi/wAympSwSH7ZGD52X1K/ZKmDQVBxx5LQKVjOsMnz8NTmAUUj8fDUdBEjfVZHJSFTYfEeMVGIsb0WXsFjeX6mKBp0Z0SpS5IUt4TH9MTy7ud84TZjdhMk8nBkP8xOk6O6qA5jVWzXiNOpiuNg+P9GuPSyBNlTxF5vx0tdHdqEav1kGprsxRnW56w7QvVNGC3uEa8DONJwnz1er7VXJPeLaW5D1P+DcmTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <65e4428d-f89b-88c6-885c-7c0347e52861@suse.com>
Date: Fri, 22 Apr 2022 13:56:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH RFC] x86+libxl: correct p2m (shadow) memory pool size
 calculation
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <c5844665-8ed7-d91f-a41c-9e4eb3e2bcc2@suse.com>
 <YmKOMC1TcQQUB6Lx@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmKOMC1TcQQUB6Lx@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR03CA0008.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 154f6063-0505-4654-ad4f-08da24571c70
X-MS-TrafficTypeDiagnostic: VI1PR04MB5919:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5919E6FB991E935659F36D2AB3F79@VI1PR04MB5919.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nUcYFblhAJvCSELdNpH+QPMqfHnoKD3f0pwv5g78mA8rD/JFaNhH/4NVUP1MffVW1TdP9rrOzc+GyR85yjt0zReLfuDK20qv7Q1r3LLri/G6ETqSAhScgRK6ifD4PlTGmyx0ayKkKrNA7De31YPSaOgz8y0XE4Lh48PVsdqP2pa0takxyCdfxHQNZKZCF8zcEAs4uCT8ozA2FLvVowpvQNH44nG0lSzMAGlsQDtzJvonjsq9hxLCdNJFuVQCChR4y0y6aX3i4EqpNANbNHaOqJLlYBHxSrORa4pPfMt1MEd/x4C1WTg/BnPtjWo6xR8LecTB6tIvfp9KTGDmXD9zSbgdR3ggpxcp8HRUxd4g2j//l6lX51JH9n6qum2aQ2ktk7MFjcTrxW/oguN2TNYMIJlL9yeYbO1DtXiVJL0DfOFxmCAKqXIEJ+NH2MjtleUDh//BHCwUleEm7ezWtWX0cQyv9QlYmviwrhwooDtzCEA7okc6BfbYfvFYPN+m78Nfp1YSHicFsCF10/7sB28pjavqBzdbL3lj2rLvvLCFhQGxuQg7B1oYOe7lCAMD/X0Mmj8h9peaEA8CsEIuRnk9cbylGKSn3mLmtedphv9Opl0Up358jKkQaaP2U1RXJh1fcRGTDsu2CsISAUij8bcTeIDvjCS6CWWnJHBMyYsOMUNSQyxxlFoSK2tN0YGC3eq19Ir3IYK2bFZEVQPrRTw3uplQb7eKXKBdrLFDIxACswU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(8936002)(38100700002)(86362001)(508600001)(2906002)(26005)(6512007)(53546011)(8676002)(5660300002)(6506007)(4326008)(66556008)(66476007)(54906003)(6916009)(186003)(83380400001)(316002)(6486002)(36756003)(2616005)(31686004)(107886003)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nahM/jX6RiSiqc1VsfCM3ZttaPTC2qRh4/F6SJJc6snX8Gx3jodTCq8YEsKE?=
 =?us-ascii?Q?635S7TGMb1TD5Rsqur35aO+BvC9FEgbdPQMPjHgPDlvYt4/eoD5SCDWDgSy3?=
 =?us-ascii?Q?QW4JH++N46q9KTwf2T+Ninhryv6Ne2p89XhYpAec9fL/l+ihZDN57wMy9dFm?=
 =?us-ascii?Q?+tadcCbFVkA3Gr/mt/RqUItQUsH9oCua8bhGGwNBo0/lMLAbMPM7mW4QI3KQ?=
 =?us-ascii?Q?F+o69PT6MWV1CYAJbVd8JE25cc6Ob0ltmy+puDbtdx1elTVRm1whH5fqn5EC?=
 =?us-ascii?Q?RQCp8GTFwuRH1j0uXHLB19YFeI0R8mCmFPNk03MjdYVtpRUJd3GqDsNCF3c+?=
 =?us-ascii?Q?0aheIRT9VHuD+xrc5ccNxHrl+WRFt30BoZaZTS963dD2eiHFCKvSu7EHJHwn?=
 =?us-ascii?Q?GQdiAnj4ybM/b6aQoU7H8xZDm/cyxXbG47ZWM8ri+rAmHaOSVlTbLIKwfQt5?=
 =?us-ascii?Q?p6TJRCUdMZgvCtFF5IIII2mXHGBPxdFyMs0G+I5Hymv+nT09Mz7xASH2cfzz?=
 =?us-ascii?Q?OxIh/aiIwyXFpwi5YzFQEWIefAfB1wVinEglRWnTHLScxVHVLjOL/DGMs7bL?=
 =?us-ascii?Q?l0kYwy9h6PDqn0HqnTeMAgvOAmG0Ni7Bt5Av/ppfx6eZ1rAIF8DhL4HPz6sW?=
 =?us-ascii?Q?51+EEQHrNu1ZYBKCXxZL+eJpXg7l/3XUcQdoHCAOx5xrOSwvXePlPaANwlD+?=
 =?us-ascii?Q?CvAn8sVK4jSRBUXVDB467l8wb9NUUHGZ7zdPLu/hK66pd1TyK96o+lTWl1jf?=
 =?us-ascii?Q?VD3UJ0x+wpUgivYHGUPoNZHLMNUC3qUEXNTxNNrsYU4RB9HMp0Nt/VH01vXn?=
 =?us-ascii?Q?q0O9mRjv6C/FI6mWvVieyTPhLEspQbdtQcKDmj2SwMPLzE6j8lUrFBp5aQfC?=
 =?us-ascii?Q?0dC53mhKN4K8OKYiXfWkV3/S8xPbBlRgze3XmmA36F3rnbfCUNaiwzV5rupn?=
 =?us-ascii?Q?1Mw2/wME3QZOeU8235WmHYcsU36ReJR3j7Mgt2LPEDTG2MNdVEkUx8wnZzys?=
 =?us-ascii?Q?MkZshJp9bL4mLW9499rQPWmcoK32AbrAuqjF5nSwiq6RNi2glP3zOqQMQfw1?=
 =?us-ascii?Q?56BxemWX/dER4HtJQuu4kUWeRRMelGunqMdujNMMf5VQk+KL7BHBu+U5pp6u?=
 =?us-ascii?Q?kGPCioGvsBiUNV0uzUTo5ALS1HQapLDusZL3M5ElHzIpurfKTRkmJjl7qLqB?=
 =?us-ascii?Q?t9lIiYMrtk0Snf4XHVRcED+qQtMl4Z2QhRYhuAnTTTBwqABYh6XpjNQ9wF5p?=
 =?us-ascii?Q?oQfvGJl7KZHk/7R5AuQ4Og8mhrBXp3qe5Vcychbpz+WhOzXtSHn0Y9bj1fka?=
 =?us-ascii?Q?B5v/G3xJtUTtnkDfAyxqc2T238VZWoIZpbp75Op9IbQCPhJdYbZFVPAeew+u?=
 =?us-ascii?Q?pSaXFBcGFgKSAKIOWPm19Y0RmDvDFMjqB0ljXC1z843qX2z+tmjKvhpFrWLN?=
 =?us-ascii?Q?MCNCOdv/xGBXvHni6W60HGg9X3A0VLvzIAjXxS0bgN0gZSGHKk66BSLrbSmZ?=
 =?us-ascii?Q?biKLnEV2ks2BUAQIzgkp/1XbowrgL2vIrqLg7QEPYdRzHDwHqe/WqhxXUvUW?=
 =?us-ascii?Q?cE00DySQ/Ga8hlXPep2EtNkFsNnnWPekaDeLVnHAg80qP+eX88utqJNFM7OG?=
 =?us-ascii?Q?8/90Rt3OVbMn49bYLj3BFWN+13vg4sFHXgPJQNNoD2e4D5USL14f5FL235Ls?=
 =?us-ascii?Q?Jz3V708OFTnBj6C2Wk5qsNL3G45mrk/4cHerrAGaz1loTB/AwKTUXFJQ81kL?=
 =?us-ascii?Q?ZptKJ6JFfw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 154f6063-0505-4654-ad4f-08da24571c70
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 11:56:18.5798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmVq8bQLrZDHZm/NwZAXbAYWNxpC+xxA+CqZuP0ci4nyvcix28BfWoA/HhwtEPje4RhZO5TbA5v75Kq2OwX/YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5919

On 22.04.2022 13:14, Roger Pau Monn=C3=A9 wrote:
> On Fri, Apr 22, 2022 at 12:57:03PM +0200, Jan Beulich wrote:
>> The reference "to shadow the resident processes" is applicable to
>> domains (potentially) running in shadow mode only. Adjust the
>> calculations accordingly.
>>
>> In dom0_paging_pages() also take the opportunity and stop open-coding
>> DIV_ROUND_UP().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: I'm pretty sure I can't change a public libxl function (deprecated
>>      or not) like this, but I also don't know how I should go about
>>      doing so (short of introducing a brand new function and leaving the
>>      existing one broken).
>=20
> You have to play with LIBXL_API_VERSION, see for example:
>=20
> 1e3304005e libxl: Make libxl_retrieve_domain_configuration async
>=20
>>
>> --- a/tools/include/libxl_utils.h
>> +++ b/tools/include/libxl_utils.h
>> @@ -23,7 +23,10 @@ const
>>  #endif
>>  char *libxl_basename(const char *name); /* returns string from strdup *=
/
>> =20
>> -unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb,=
 unsigned int smp_cpus);
>> +unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb,
>> +                                               unsigned int smp_cpus,
>> +                                               libxl_domain_type type,
>> +                                               bool hap);
>=20
> Iff we are to change this anyway, we might as well rename the
> function and introduce a proper
> libxl_get_required_{paging,p2m}_memory?
>=20
> It seems wrong to have a function explicitly named 'shadow' that takes
> a 'hap' parameter.
>=20
> If you introduce a new function there's no need to play with the
> LIBXL_API_VERSION and you can just add a new LIBXL_HAVE_FOO define.

With the original function deprecated, I don't see why I'd need to
make a new public function - my fallback plan was (as also suggested
by J=C3=BCrgen) to make a new internal function.

Jan


