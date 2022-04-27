Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B091511872
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315083.533441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhvA-0001xc-GR; Wed, 27 Apr 2022 13:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315083.533441; Wed, 27 Apr 2022 13:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhvA-0001vm-CA; Wed, 27 Apr 2022 13:41:32 +0000
Received: by outflank-mailman (input) for mailman id 315083;
 Wed, 27 Apr 2022 13:41:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njhv8-0001vd-TW
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:41:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be09ef1d-c62f-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 15:41:29 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-ylW9FP6ZNDCsgBXwYPmDtw-1; Wed, 27 Apr 2022 15:41:28 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR0402MB3924.eurprd04.prod.outlook.com (2603:10a6:208:7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 13:41:26 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 13:41:26 +0000
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
X-Inumbo-ID: be09ef1d-c62f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651066889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1MaTZqv83n78hfpNPMFFru7Eoqv0EEc5hXN5LJ0Q0c=;
	b=AH3KmLEf+YLmMbZgaS9L8KH8KppjtozHjZ0JcgFZ49bIgzNus96toNvtV3ZzkPRHbh4pNU
	y/SHrdXoB97OD+2aj2bjAaGehGH2jP/RjUxTA9u04kMHio5kvCYEt537RimgdKFEdCavlH
	ItDSo3CybIaGoWATO4WkVUsSMx9/HDY=
X-MC-Unique: ylW9FP6ZNDCsgBXwYPmDtw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWciRfbw9ivg5I9llN29LMA25ZQM8GPB7LcnBoEjZGEKp7eYMlr75j3H2netaFIjU0Ap1q4LZ/5rE+cBkQeJIlpZ+/wo6mLsYkBWJ2yKIqmWX5UaqMXdWOnfhvwnjJSX3Y1uJK7aQbOqCe73J0/4fWW6XQogPPt6GQai7rCvtJKCc8NHqx3HDcCcfDsS2rC2pdOaEtnprCofZnB3+jHDmgkAHZZtxruC63Opn3ws2fRkJLc8Dx/3BGMBVeIs2Peyn+jSb5i6oGo5rLshR0F5/IYwtmvIyZF4kX9PdFSJftUSemZU4DS7hLRJOjolyK8nwQ4G4bfiF87vZPwZwit4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDt1QrWH1q4K1WrV0YJ+3InjJdZzI0wFqbANhOyodeI=;
 b=KeIToGRepSL+11LQ7vEBPOl5E+GUp/Lv7ZSXB16ORCHtkKgCVtVXYKJMIz9gtHHfLSURjCLH8wyrlRWngNbGZhIJCtYBFFfBea+Zt75N3KekaiW2k3n2TiPfGO9H9YptwCEpz746yVBbcWJy6bM8KHZ1VHZGN9j8IRicNLASpLk2bz3o/eKLzqFQtn2jy0Bkh5DEPtsJlHFiUdflAMub/25opI/vWmPYsAdUwOxN7hv1yDCjXdvmuOZdhKcRhRa5EpnI4U5WwN5KSG6NNM4I39Y7/hHKY16PVtBpnNuS9wmzqJVNtquNsLzj15I4dEU7lTIwlDM5RoBB4JadzXwZ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47b50c64-b8bd-df95-9de9-175780c50e0b@suse.com>
Date: Wed, 27 Apr 2022 15:41:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/4] mwait-idle: add 'preferred_cstates' module argument
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
 <7c15016f-cc57-f128-4b79-79c820f3196c@suse.com>
 <Ymk7BjXdyiMUGoc8@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ymk7BjXdyiMUGoc8@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efab0d4f-a92c-485e-c482-08da2853a03c
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3924:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB39243E0BDE62980EE5C5870DB3FA9@AM0PR0402MB3924.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3C2VRtAzHqyYsvxsuCKl+7Rzn13N8+XDTQBmkoDJP6GocnAePu2+g2SZTjOo4QeuJsFrsR0H8nOsS1u6S74opIWwLoUW7lPyTQ2rbiubT6f8hYk277rFgIrul8I7rg6HkjeyeFGqlsfFm0XRpHWNHkFmjusFuQn6vX4fFKVya72Lo7cPXp07/iFeoT+ibNSI7w6+XrpXSAYSHsAgd/BuD8+CVWBsESteH7Sj3S9nIjXVkhkSrRdQgxTySLrwsI0wfrWkjCcPiJwbFI7SsTcZDWR9X0LFkaM9f/N2rJAVK8TP/BdDyZqdGGWqfwbgTQtUQeVKCbw7NWHPLcI9DVwBkvVVgmmjW68AYKBVmyBtCoqF0iw+WEnWgdVf9srlgYEUqmVlH+otuXfv+K1LDeCK7Xh2ZcLwKCFTcz4wO8o92tLE5pMIL7EYK8aFHkpo6iDlhufEiinqub1TpXxoWZreS+Rl27TNIQxb2aFjJOzfFswtUj3KehzbZlqOMhhGWb3Nom5098T9mztY+TiPAfnKF1HeasMUhUn5C+Jt34NTJ6DvhtVGFAwjQy2JSCKqMtIVn1W8j3CJHWnJNzhByvJmWi8OjplmQggVKTm/fsEve/Sl7uT0+nzdMIRFM15pE5TIdK9WpwQm495ve5tmC0Dn183+VXXQ89y21hqy6M0g8UIdIXT+iXV+551bV3BITYjfi7D6Hi90T7/G/kJMfTEnRybj+ToYfc8HQ5JLDej9zwidD22UtzLcCj+GRS6pv7sB01169bRV2hvdu3W+1D4zNTNs2Xrjs2V303Cd9G4lxoAHbE+HWI8xkcGXBaUMwF9K4GSt4UE7RbKcqgXq5pW+lA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(8936002)(186003)(83380400001)(6486002)(31686004)(66946007)(6916009)(4326008)(66556008)(66476007)(2906002)(54906003)(8676002)(53546011)(316002)(26005)(38100700002)(2616005)(6512007)(31696002)(6506007)(508600001)(5660300002)(84970400001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S55C/O3LvyOrC6UgM3FNl43lSebtiwtORRVqQJAAWuGLDFJ4rWDf6rQwuc5Y?=
 =?us-ascii?Q?QcY71yeJklhiL6Iacyuz+X9QC9wALn5Od212Lh49Duenrta+9Yl53ctuS80G?=
 =?us-ascii?Q?eL4r5geFf19RDd7OPkhPNKMJxWHzq0yQyeh3eBK7LZoOGPCzg3BviNzeOaLc?=
 =?us-ascii?Q?6C66NhrSq69OzkGPRHFG+8QazizFtA/8PoUTlaWpmz46ivm2Bd3xRvMB2BOI?=
 =?us-ascii?Q?D76oSI1Mz+EGeGJk8vYLODCPQJHZpCNbU2tqKympAv1suMtknhbbRh2X5NMr?=
 =?us-ascii?Q?oV7WQc+CxKBoQkziDTRkbR0+KwKd9EcTkYNw0YmYBJQ096AcJ0pjX52z9Ybe?=
 =?us-ascii?Q?dxCPvYhSPGpjZ/zvHpLOdfLxnx9ywdAlq2X65k7LhIvb5aQYx6QmURbzWh5f?=
 =?us-ascii?Q?WCFcdhaRZ6oq3zYiQARY7LHF/L4lYxOIKVSXwNhnFr1G/v/Quft0cHSG9B+D?=
 =?us-ascii?Q?syDKiIvzmG8Sbn9pQu/H6aucXKsxQAfRXZJWatdlufUC5RSlrp/R2C26bwG8?=
 =?us-ascii?Q?JbglYs8Qr0Gf3OmIOuhU/AD7nSYhOckDexVz4uXVQvdr8Ydj4FzE2dJtTw3B?=
 =?us-ascii?Q?zUbyJwKzPrcaP+q2N+7PC3xMrM7GP9yyJh7JSLe82RBIN48ReGqmYwRTczIk?=
 =?us-ascii?Q?4LRqJgpDfkwEuvi54SS0MLTCXHgjiVDk0FtYzlZkqmV9oFraVhV/kF9e/vdh?=
 =?us-ascii?Q?fx/ptAUOpw+sXaZbAZh9u5ZLwk0LbITW7ubPvGBLktByJDHEFwrMqYDjPUE1?=
 =?us-ascii?Q?HB9Ai331MTDKtl3uIN76UucF3c7iR7tlS1PcZqDCwsYDUX9t4CKJ89LB0ris?=
 =?us-ascii?Q?1zlBOHRdcsggXqEafJ6bE2kyKjJNFUHVAT8y03Et4uIeWHREnf8xAkFqOfM8?=
 =?us-ascii?Q?AoY+xfG7WjV/4uQigkXGPlY8WwMGnhRG8jj9x5uOCC9/GOqhemK5JHR2/4yp?=
 =?us-ascii?Q?4AqtD/9O6aW9bXzzIBNwFfiQd08uoEkOZQd8oE1eSWuZU+n5M9sx/+JyuZhN?=
 =?us-ascii?Q?49NkxAhuw96G1sI1tvy+pvG7KNIvawnnb6YdOz0A0v5bpGNGX2nrPVMaGL5e?=
 =?us-ascii?Q?+M3mXdCk1XskmoAfa13aDcCUcZFJ1RR4JYiXZh91p8tPzovzsER/zg+34Qfo?=
 =?us-ascii?Q?h782AF9CKcGC2EbJ9kayyYEOF2BJpAtff5Q5r3YHoM5Udj0mkn86Smi3LyVw?=
 =?us-ascii?Q?AGPnZgY5hi+SC8fDujEUUu6GuuzLbAc+lEBaQLgKraKTFzW4R30djLK7HGjX?=
 =?us-ascii?Q?/gaYwAeE2NL2irTJmE/WAT8pmdo2CbZrBJtgC9JEDKtViv6Cwzip4VktO27h?=
 =?us-ascii?Q?IOVvDb+6gNfwv8cXB2BN/+Tmw2QcorODnrQMDeXACs0sqjOhazI/Mr9CPd2D?=
 =?us-ascii?Q?lNPKTxvPMQrlg9EQwxT08+083uGkx1roeIsxsUkSDsqXLukeUAjpAltvOZj8?=
 =?us-ascii?Q?U73Fzn7tpawiXlZxzjDjeCGMqKIMNWpH521PnVZ91dp7gLykcz/3d+tABcPu?=
 =?us-ascii?Q?aS8+SnCM/DgFlnZ1xl1w1+FPf2bhdyYxD219lUzxeMHlO4DJQTo6gqrFaEWM?=
 =?us-ascii?Q?3BgkDfVLVOKVW8enesbiufnoELv4khlYmqKKXQDA78AUllwiZY394nb43ZAN?=
 =?us-ascii?Q?jFgFFHoOTKS1/Nd3mPgywpLL1mLOpp9ZYhXI3VgJKFcLcfENGtOfsJUm7oP+?=
 =?us-ascii?Q?Nd8itQTM5oEe36dTX7v4sUedoNGaQzV+iGI5/cdfYZLlhkn1LRRYJC8LTFfx?=
 =?us-ascii?Q?QEyy1O2P6g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efab0d4f-a92c-485e-c482-08da2853a03c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 13:41:26.3642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJkLMf3YqjxyANjwlIFpSCtQJ6mqWpI+mb9NCHsKwF6+ATrDQbjyaPuWvhcik1cDacp+g0TCjecFvtgW7yMzvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3924

On 27.04.2022 14:45, Roger Pau Monn=C3=A9 wrote:
> On Tue, Apr 26, 2022 at 12:05:28PM +0200, Jan Beulich wrote:
>> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>>
>> On Sapphire Rapids Xeon (SPR) the C1 and C1E states are basically mutual=
ly
>> exclusive - only one of them can be enabled. By default, 'intel_idle' dr=
iver
>> enables C1 and disables C1E. However, some users prefer to use C1E inste=
ad of
>> C1, because it saves more energy.
>>
>> This patch adds a new module parameter ('preferred_cstates') for enablin=
g C1E
>> and disabling C1. Here is the idea behind it.
>>
>> 1. This option has effect only for "mutually exclusive" C-states like C1=
 and
>>    C1E on SPR.
>> 2. It does not have any effect on independent C-states, which do not req=
uire
>>    other C-states to be disabled (most states on most platforms as of to=
day).
>> 3. For mutually exclusive C-states, the 'intel_idle' driver always has a
>>    reasonable default, such as enabling C1 on SPR by default. On other
>>    platforms, the default may be different.
>> 4. Users can override the default using the 'preferred_cstates' paramete=
r.
>> 5. The parameter accepts the preferred C-states bit-mask, similarly to t=
he
>>    existing 'states_off' parameter.
>> 6. This parameter is not limited to C1/C1E, and leaves room for supporti=
ng
>>    other mutually exclusive C-states, if they come in the future.
>>
>> Today 'intel_idle' can only be compiled-in, which means that on SPR, in =
order
>> to disable C1 and enable C1E, users should boot with the following kerne=
l
>> argument: intel_idle.preferred_cstates=3D4
>>
>> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
 da0e58c038e6
>>
>> Enable C1E (if requested) not only on the BSP's socket / package.
>=20
> Maybe we should also add a note here that the command line option for
> Xen is preferred-cstates instead of intel_idle.preferred_cstates?
>=20
> I think this is a bad interface however, we should have a more generic
> option (ie: cstate-mode =3D 'performance |=C2=A0powersave') so that users
> don't have to fiddle with model specific C state masks.

Performance vs powersave doesn't cover it imo, especially if down
the road more states would appear which can be controlled this way.
I don't think there's a way around providing _some_ way to control
things one a per-state level. When porting this over, I too didn't
like this interface very much, but I had no good replacement idea.

>> --- unstable.orig/xen/arch/x86/cpu/mwait-idle.c
>> +++ unstable/xen/arch/x86/cpu/mwait-idle.c
>> @@ -82,6 +82,18 @@ boolean_param("mwait-idle", opt_mwait_id
>> =20
>>  static unsigned int mwait_substates;
>> =20
>> +/*
>> + * Some platforms come with mutually exclusive C-states, so that if one=
 is
>> + * enabled, the other C-states must not be used. Example: C1 and C1E on
>> + * Sapphire Rapids platform. This parameter allows for selecting the
>> + * preferred C-states among the groups of mutually exclusive C-states -=
 the
>> + * selected C-states will be registered, the other C-states from the mu=
tually
>> + * exclusive group won't be registered. If the platform has no mutually
>> + * exclusive C-states, this parameter has no effect.
>> + */
>> +static unsigned int __ro_after_init preferred_states_mask;
>> +integer_param("preferred-cstates", preferred_states_mask);
>> +
>>  #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
>>  /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only C1. *=
/
>>  static unsigned int lapic_timer_reliable_states =3D (1 << 1);
>> @@ -96,6 +108,7 @@ struct idle_cpu {
>>  	unsigned long auto_demotion_disable_flags;
>>  	bool byt_auto_demotion_disable_flag;
>>  	bool disable_promotion_to_c1e;
>> +	bool enable_promotion_to_c1e;
>=20
> I'm confused by those fields, shouldn't we just have:
> promotion_to_c1e =3D true |=C2=A0false?
>=20
> As one field is the negation of the other:
> enable_promotion_to_c1e =3D !disable_promotion_to_c1e
>=20
> I know this is code from Linux, but would like to understand why two
> fields are needed.

This really is a tristate; Linux is now changing their global variable
to an enum, but we don't have an equivalent of that global variable.

Jan


