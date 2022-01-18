Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8412549280F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258541.445347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pCx-0001Lp-CA; Tue, 18 Jan 2022 14:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258541.445347; Tue, 18 Jan 2022 14:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pCx-0001J5-8f; Tue, 18 Jan 2022 14:11:35 +0000
Received: by outflank-mailman (input) for mailman id 258541;
 Tue, 18 Jan 2022 14:11:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9pCw-0001Iz-00
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:11:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89d76c2d-7868-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 15:11:32 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-e6IM-UZZNmyCiWcS_OHoxw-1; Tue, 18 Jan 2022 15:11:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4173.eurprd04.prod.outlook.com (2603:10a6:803:47::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 14:11:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 14:11:29 +0000
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
X-Inumbo-ID: 89d76c2d-7868-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642515092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkrATZkogV5dYH78q4Xf8RG02xN0uAFaU98dSXY8AoY=;
	b=OfgAw9LuPKcZCtmmdquafm2/T20l/sLw15sHlScoGCNqO4YLRVcJ67fxsG+5vRCkKrDchP
	5jCeINJ66fajdhK2iA9XVA25j5JhbxuzAAjgZtiVYULCAcXeYGeI8+BPg793dXXZLATP/0
	9ZD3nzWJTATSh6/vN2sZkmzR45onCTM=
X-MC-Unique: e6IM-UZZNmyCiWcS_OHoxw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhOGbIhfaLecuRUY93coZAL8ylVAJ2GzAG4l0OLAu+mrRJsC20rEPC/dNVtHmGS0KtOLXD0ZU9NDkbwpPzOOtEQvKKQHAIcSdmedLMPhM5j+cN/1xHafgWEwhQ3S9cce/hMwaGx6CujHIDR8xU+LjlcqtlwFkQ0kOXepI+PXhAEv01Oeu/Hr6MJoCqb8K7eUM6UJ2i/ghzOnHYNlg2xf2H28lyJtyPD8mR9OG1hk4oXMjZgeaRIRE4suVanUjyGTzEXVOWPUmiz8XGRCOnnUrSM2DpJaqKT2VxMF1xQKUuHqJ2mD1ObdcU2+AddD9GAANmLqq+rJxI8EUAuSVmIn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoPkVXf6WvDD8510zSmkNj5376jmeCzr0LeqNmW1j0k=;
 b=fwYyvQ/m+XAYhpgzjOquowdPWBWQTdtzviOxtTiqkRa978VPh8fDiPK6rSorU1+yIs8YN9Mehd2/rPPu9gqXZsiv+uLIAaBF82r9XkkyrRpuvcGwb7pDkVCtqZChBqPdlRmvGyKeyBd2eBmTSGYpMeDYgcJ7S9XZGE3uAhZKKCGnaQJXEGod4OGBgF76JOilYbbnGOl/0Tj0bdzB6GmWzGIX74dBP2ch88yuEf0QhMlZyaXXQVZouqM+8WXAP8gcnn1dMSetnXV9J+3DXJQwfrhvrsro1xdwBbwaR71MobBL4GsefO+eGB4UPUZ+GoJN/Xglephr4fZKbkB99A87sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee3bccb6-591d-233c-22ea-e3f95256b056@suse.com>
Date: Tue, 18 Jan 2022 15:11:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] x86/mwait-idle: adjust the SKX C6 parameters if PC6
 is disabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
 <aa7dc2e4-6a80-dd7a-81d6-92690f6e0bfb@suse.com>
 <YeabFE5v5tQvM0eP@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YeabFE5v5tQvM0eP@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5P194CA0003.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44a4d4ed-9dbc-4979-763e-08d9da8c6c3b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4173:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB417389EF07F785B432420261B3589@VI1PR04MB4173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	58q7dL+N4FTclgi743BRdOC5mzt34IkPISRJoUED6NrGLrazQPb6fnLpwqRidYG74ktAC+grNUy0AA9PV+vXnxL2SuawC1Scap2M494Zt5l+SkP7zG3x0vQ6nzXh6jmIULif6ZAXsKVjVeQRZPZDIYIM+KBvh2M1kbghfB3nnw2fDpfb0ARV7uKt2+JQ42dzdpxzvQT91hACKQ89VrjMhMepcyn1bZ1TZVh55tQq2qJUHpUNO2KLCXr+XpHYZVmXVYuwmdKQs2qlIXXjXRPFEcgvdqX10wzr3jhbmP50j+gjYRp/iF6ZU3fd6EsTEn/m9vDbrgXc5XabcXQX/aOPSbnu5zPPCTO2d9iiLZJD6JcE6C/dKRyaZM0Kt5OwzsdSwc7bJ+ZYrPiDko3PSTyzVbobBg5JDQI2Z302p03ND3cbtyBseoiaEYR0AUqEBDafRnqh9SHkelDBD4cHF4Jn+CpbLVgtsoiGOYoOP0REajTutmb73wBw5KT9nri5//juryJ5cYtMMWed2S/82AE6Q15FEgQf0h4A8Ie3oxFbqyJFhE4tPQZnW1U/HuLtwLqJIOs46HkN6q8A8PehNy0K57boBLJ8lZlMX8QDFJE0GECyhUSim2IGLiMNU7DSdV63EjBQUqrNIP8tG+i2ozgyHogbfJ5pLolkrm64BbZ8mVny+HlQMIcklhND672UX6ev6bWyLKqzbYem5Pl5JLSh3tgXqlm1s/oXfGERkbjrcFugqg0I42juZ931QbB8Zl866e2qHrad7UeYrq5gCtIl20jG9ToFtJC/pobejrNRftnFVhq44+0SUX/XKcII1EoC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(6486002)(316002)(54906003)(26005)(966005)(53546011)(2616005)(66946007)(66556008)(508600001)(36756003)(66476007)(6916009)(6506007)(86362001)(83380400001)(45080400002)(5660300002)(6512007)(4326008)(8676002)(38100700002)(8936002)(2906002)(31686004)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J60lGmyMjdWFrWut/t24sS/oZwRLh45CzMBRuKK7aKKEk8FPix6Z5+29u4te?=
 =?us-ascii?Q?FeSN02F+REh/5/Sz/4YMPwVxHSn18jRyKSOOK07yImje0Py/wd1iSfPHQ0yP?=
 =?us-ascii?Q?sdS/bZ+1RETx51tRSe2ixxDUp/wg2HwBeyY9kwzbFlcaTCoa83OSjeH0WgYM?=
 =?us-ascii?Q?jhoTDHXwpX0K36v/8jS6nx08KG8o57sXpDIHgouykJhd4D0yyFzfhtRM3OJP?=
 =?us-ascii?Q?fTNSzyp2vj4SdJ3l1mAlJNGNG5mlJgUx8piaUQcHGGfPpkP13O/UsQx29lLu?=
 =?us-ascii?Q?MALXVQI1IuyO78zLQngM1rLfqMA+w8EbVuwq78ezilvyh9yBz2iVv2erdgc5?=
 =?us-ascii?Q?NLS0FuxPop4G4S6i9t/7cq7SvufAgFSLL07ud5PJSV+v76u/M8pveq2pxKDa?=
 =?us-ascii?Q?m5gZEHkIJ0NJISb6qKyXXall1zi+gYvay39IJWznKnBArp+M0O+ctqO+Nbu7?=
 =?us-ascii?Q?cQbZ5zLeipTN6BM0QwmAIWI5MxFzeBLOnad1YptC3rmGzEoXIXv5rcPLpsoj?=
 =?us-ascii?Q?QVzBRaulIYiq9SeSP67aWCK4xvUt0qJnD0LpgKmyZ1kns/x5AW7aHQA5AFOv?=
 =?us-ascii?Q?pSs6bPINMKGcgoAq9c3irsvffKDeEs4lNBPkXY+tCBJbz6iCK+iyRqWu0BKH?=
 =?us-ascii?Q?JZoPYAsm47Xg03oOrJxwJip5YWQZV+aT0dKf1XyIyYxzmuxGUe2rS97hP+um?=
 =?us-ascii?Q?mbscISou8zzhpcVLDvkkzrvUXxDtPKnA/SqL5B3urTpc6hsoPwKou/R1pkMJ?=
 =?us-ascii?Q?koaNv3nKRQTEvybom2zuVsqKsDFN17HE3W8lePzOSFpYe7ltzOrD/Vr0U+TM?=
 =?us-ascii?Q?k4tq5cIkLz1LIsJ0erHAn43VTzDNE7jy2lfqPqMJTr64e8VoRJM7bMu5L5HD?=
 =?us-ascii?Q?RpSjOmT9+IaynhW18pnSCsAYJFNhqaOuGVreaoZ9ORThvPtUkNC+4vXgD+tg?=
 =?us-ascii?Q?3e9wuRvKX2Zo6HiEwfZqGc9vnl7t9PtKnOgfTke+PX4ZdSq86Jc4kEV7gZVV?=
 =?us-ascii?Q?CbF7uTxDHet251uUdctKQHkbheMO/Ah6bZbu8wLU/lDnmbz4Eyg74crcIV5M?=
 =?us-ascii?Q?Rcp1ZdXVqA22U4NF2aAqsPaPqIb2jsn3pmUPZ16mnIpQi7F6UFbmboGWVc9d?=
 =?us-ascii?Q?AGsa3WX0b4UdkKyCWcs/oOVct+kQFT/PLdc1GfGdEess5f1QEdjDbm+poZwG?=
 =?us-ascii?Q?STOWWUfeQrHUdKvQkEphrRyDsYClykTYxrsHV006hTxTF6CpGOqKcmBjay8O?=
 =?us-ascii?Q?2cJNupo9VPAkiV8pcorJoft8B3sl25Vtlj0WCl31V8TZjq6kbeX6xPK4a4Rw?=
 =?us-ascii?Q?Pl30wUnNinp91pxHxXArH3lNZEGb09IZfpbjfEZhHgq2QGwJXYJaNXu46r5A?=
 =?us-ascii?Q?YL0fvxb0S6Wd7MuHPz9ao9gcY38vmFsoNVAPhoTWBoTjqewXzkUlOUHIqG1L?=
 =?us-ascii?Q?U4pyCg5kcOJ93wwBcT//AOGBAXxnW3v6Dxut1liqFv9eRkpthRvlrNU3Ufu5?=
 =?us-ascii?Q?mWeXmk+8E+GHXjLVIZO4katoJKWnstV7WQs4opW/yribBR0vy0AfHz1hQI9i?=
 =?us-ascii?Q?KidLDtJAm6dRaJ3zMUlz/iU0WnhSZehtjga5P0qGMCu4zeHEeX0fFn4HVE59?=
 =?us-ascii?Q?Fv5Ck3VKm6hPZtoVFKLn4MM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a4d4ed-9dbc-4979-763e-08d9da8c6c3b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 14:11:29.8657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVneu/pEagV7Mst5tDtlgjEea3lXthplyY5hrFY8srqRCV6HSuR+lzQXz6Y1aZuVFt9InKyy5HHY8ipylbOzXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4173

On 18.01.2022 11:48, Roger Pau Monn=C3=A9 wrote:
> On Mon, Sep 06, 2021 at 03:02:12PM +0200, Jan Beulich wrote:
>> From: Chen Yu <yu.c.chen@intel.com>
>>
>> Because cpuidle assumes worst-case C-state parameters, PC6 parameters
>> are used for describing C6, which is worst-case for requesting CC6.
>> When PC6 is enabled, this is appropriate. But if PC6 is disabled
>> in the BIOS, the exit latency and target residency should be adjusted
>> accordingly.
>>
>> Exit latency:
>> Previously the C6 exit latency was measured as the PC6 exit latency.
>> With PC6 disabled, the C6 exit latency should be the one of CC6.
>>
>> Target residency:
>> With PC6 disabled, the idle duration within [CC6, PC6) would make the
>> idle governor choose C1E over C6. This would cause low energy-efficiency=
.
>> We should lower the bar to request C6 when PC6 is disabled.
>>
>> To fill this gap, check if PC6 is disabled in the BIOS in the
>> MSR_PKG_CST_CONFIG_CONTROL(0xe2) register. If so, use the CC6 exit laten=
cy
>> for C6 and set target_residency to 3 times of the new exit latency. [Thi=
s
>> is consistent with how intel_idle driver uses _CST to calculate the
>> target_residency.] As a result, the OS would be more likely to choose C6
>> over C1E when PC6 is disabled, which is reasonable, because if C6 is
>> enabled, it implies that the user cares about energy, so choosing C6 mor=
e
>> frequently makes sense.
>>
>> The new CC6 exit latency of 92us was measured with wult[1] on SKX via NI=
C
>> wakeup as the 99.99th percentile. Also CLX and CPX both have the same CP=
U
>> model number as SkX, but their CC6 exit latencies are similar to the SKX
>> one, 96us and 89us respectively, so reuse the SKX value for them.
>>
>> There is a concern that it might be better to use a more generic approac=
h
>> instead of optimizing every platform. However, if the required code
>> complexity and different PC6 bit interpretation on different platforms
>> are taken into account, tuning the code per platform seems to be an
>> acceptable tradeoff.
>>
>> Link: https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fintel.github.io%2Fwult%2F&amp;data=3D04%7C01%7Croger.pau%40citrix.com%7Cc=
df115e71eb14429868408d97136a902%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%=
7C637665301851513469%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DD9sIoe%2BFAvia3OuRs=
T19VAxkTqrlnPHnKqTSKiW6pRM%3D&amp;reserved=3D0 # [1]
>> Suggested-by: Len Brown <len.brown@intel.com>
>> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
>> Reviewed-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> [ rjw: Subject and changelog edits ]
>> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> [Linux commit: 64233338499126c5c31e07165735ab5441c7e45a]
>>
>> Pull in Linux'es MSR_PKG_CST_CONFIG_CONTROL. Alongside the dropping of
>> "const" from skx_cstates[] add __read_mostly, and extend that to other
>> similar non-const tables.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> @@ -1161,6 +1161,36 @@ static void __init sklh_idle_state_table
>>  }
>> =20
>>  /*
>> + * skx_idle_state_table_update - Adjust the Sky Lake/Cascade Lake
>> + * idle states table.
>> + */
>> +static void __init skx_idle_state_table_update(void)
>> +{
>> +	unsigned long long msr;
>> +
>> +	rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr);
>> +
>> +	/*
>> +	 * 000b: C0/C1 (no package C-state support)
>> +	 * 001b: C2
>> +	 * 010b: C6 (non-retention)
>> +	 * 011b: C6 (retention)
>> +	 * 111b: No Package C state limits.
>> +	 */
>> +	if ((msr & 0x7) < 2) {
>=20
> I wouldn't mind adding this mask field to msr-index.h.

This wouldn't buy us much since - as per the original Linux change - the
manifest constant then still wouldn't be used here.

Jan


