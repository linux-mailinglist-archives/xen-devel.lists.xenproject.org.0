Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C3771DCC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 12:13:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577987.905154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSxEz-00029z-1l; Mon, 07 Aug 2023 10:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577987.905154; Mon, 07 Aug 2023 10:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSxEy-000280-V4; Mon, 07 Aug 2023 10:13:32 +0000
Received: by outflank-mailman (input) for mailman id 577987;
 Mon, 07 Aug 2023 10:13:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSxEx-00027u-PZ
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 10:13:31 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e2800eb-350b-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 12:13:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7304.eurprd04.prod.outlook.com (2603:10a6:10:1ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 10:13:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 10:13:27 +0000
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
X-Inumbo-ID: 0e2800eb-350b-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2WVDbHpNT9nPkkerPnwGeepGx49zwJv3qm7vdhHAmokvUuAxKmXXKMDS0cSvrMASfMLBXAifMGk0K0Pj/Rw6POU1v8RuuzOsMaw6Bmfb5teuaYNySH4k0cV7oJ2iwC+desrcn+r57MAIAwZqk0Fbmd8Hd2UX6tFz4IZVq7QxhbH8QRWfV/JScJKmZIBG3uYQ2sL53YQB47PrbuSamR0AscS7YheNH/h1J9UN2Lmd2KZH+zOfB6ZcTgFdsppbisWVEmXFekIyGWAti6YH0Y1jz2RtM52F555c8EApjTiZk5Z00FmkWZTxjUB+BqbiucUuaCPCkIYU3/Ro7ThIoaI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TL3SuqiL/U8QplvnRFiosj3Muf1Pmyzyij/ftdbvSw=;
 b=L8naNky6YqL9QZFxzgvwVdfqQklCn4I/k/TTSVoiZoJTWz8VXY5lvIS+Qy+i1oIeLNv1q9Gd0+cowvGu7aGtNkFo9SElHVjaZEmmzo6RydpbP/aVomg8yZ/OsaD9pPZJWlSwnWIDWWx8Obrf3DHk4Bj/zXKo9Whyc9mY8Wsjj9gW6weKQht03sDVLXptdg2CNWjluHnL4DaRYwjwmHsBbIiJk1NcX1Al4pL1N9hTcfihOiCzvDH6h1hLw4S71jSWOIYL2fFC15W2yHokqPZQjn0JFm6btmrjC8ZlDqCbGQO2XTVNBD/UrMrIKu/G/x/oFsJFsRf8xEzQroqW4tuwvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TL3SuqiL/U8QplvnRFiosj3Muf1Pmyzyij/ftdbvSw=;
 b=iDx7yy+xrrQuDgW0UyC4xdS00Ryfm+R97s/7EPrVEYTCtDt89cEIr+TRZklGNrt4/18DcoBIzrUiGm2PKIx758rlyYnrTFSFulABl68HbxeOF25BgbiIMe9Yu3XJ/nSOS3qkzzho0qp4QLWksAZcVpvyafGC7f36IMBOKqxi4WJCxtHwMahdZUovkfcFDCXcBSCfCjUCqE1vx3dOaeO7yxP2X2k77hgV7G1/PIfuXRsHzP/Kzl3jCNrT9pqQzv24h8WTMuC6BZFQoamBOqEh5iGKIqVkstRX2sqgLjmQtj+kXW/jlQSgSxejJu+hh8R8N1VUU9tVxZIXVGMLYwsxDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
Date: Mon, 7 Aug 2023 12:13:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: c0bdb0da-1217-4baf-05b3-08db972ef10c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hqFhU2MYNQDbLA7JiirX0bGulapNMLSLcXiDHw1BRtPQ955BYMQ4s/ejmnkhFhD/Z8r+DXRvISYrSDtuDqurYfwCtditIDHZqgkshINhxf/ayir66bOhJU9Fl0LbvvpS5zWzl5Pgc/jpGGO+Dq++Ns1mAx6ru/Z2pNzQCzEI3Aa+iZrygGN6g485//hOhwKpb4DOIaSY6Hz6UosmGP6NV48YGagTJrng28UwkntSbBV7225DgooidHzubEZ2Kd/+hnHOT2Anrux77F96zu4S/HeJkq9f61fKDHF0EyNiPMKprnLmbTYREa4P9gJECZiWaG5qC0uleSeHhF5wleSP9sn4mhmQqbJj/9MWw5ynysP9mnqevE2MrGG4B8E0n8LneDA+zIjX1Wdk22c/G93E5UMACJhn+mEUjPSfuPkGUth5+3ntr+WBQPHkdzVksSaugA+HlHHLg3f1PC23WQRHMlY5fA+ju4PAkf+TOFF4p1XGCvC03If4iIXJzCNr04eQWST3w1je5rAHJzGJZaBwHIg4rVuukPJljgtYi1+hf+K0FrFkGkfSBue/tuxdEPBdLqIoD65t2AiXusu1ySsqQWcL0eNPiLy7TrtfVWqS6iygXx2Uwe2Z/OKcFz4uxLSV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(366004)(39850400004)(136003)(451199021)(186006)(1800799003)(2616005)(36756003)(6512007)(4326008)(316002)(86362001)(6916009)(478600001)(54906003)(38100700002)(66946007)(6486002)(66476007)(66556008)(31696002)(53546011)(6506007)(41300700001)(26005)(8676002)(84970400001)(8936002)(66899021)(2906002)(83380400001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1liKzFwU1lYb3V0eWRnaTB1enJNL2xqSEQvOHhUa1RPbG1EeDBwQU4vMnVE?=
 =?utf-8?B?bGNIbVIzcEp2MHVoeVg5MjY5cVJIK2tMUFMwc2RnTzJ6Ym1RYTJEQ2dsSzUw?=
 =?utf-8?B?T3pqWDBibHhrdGhYcWFtMmxkL3JvQTNxcTVlNTY0c0RmQnpZVWs0YkNTSzJ0?=
 =?utf-8?B?ZTJyUkRTekNEcHFmMjZFSnkrbGdYZGZNV3lZY2Z4bXA2RW9NTmQ1MTVMVDFR?=
 =?utf-8?B?RzNBU1k2YmQ1Ym5FOWN0MjZqb2t3Wk9MWU53a1ZPYk53T2E4TlNjcjJCUVNw?=
 =?utf-8?B?U2liTW12ZnM4U3daMHlBSFE5ZTVVckRSNm1MWHdwaVg2RDd6TWhhSnBJZVNs?=
 =?utf-8?B?NjRhL3JoQ3JTZlg2eG9GajV1QXM4ZzNoSmc1RjJoZWh3NUNIZFN1UzZtb3ZT?=
 =?utf-8?B?U2F6Uk9NRFhUa21BSm82YmU1ejgvejdKTEpscEJXbmxQUitFRGU2YjVaTklv?=
 =?utf-8?B?aGVDZkpXeXpQUTVpS25xOGo5WkZhR1diWW04RGVxSnZxdzVCYXBBS1I0bG80?=
 =?utf-8?B?Yk00cWdVRFdmeXJwK3VoUnpUR1llakticzA4SEw3c3YyOUx6UGprdzB0WHIz?=
 =?utf-8?B?YlJONmtuYSt3WGxMa3NEQkNGb1hNcjVPM0g5MS9QdDF5Ykk5SWJjWm5kNnN2?=
 =?utf-8?B?dHdONzVmNWVUUXB5bkc5V3QyRGJ3ejZBc0RnWjNxQnBOSEdqTDRNWkdRTXB3?=
 =?utf-8?B?b05CN0xPK1dxanlpbmFnSmxtWDBxYTNwSW5Nclh0OWVXbHp1azJVMlR0MlVQ?=
 =?utf-8?B?L1pRbHo2MW8vbXl3NmY2MlVkRmNNc09OZ3o1OWZGM2d1UFduUXpocDhVN0J6?=
 =?utf-8?B?ZkxFUlA3WVllWWw5ZTE4SlZJYWZWN1AzZnhtNWgrRStMaFAvWVRzZm9LUUhh?=
 =?utf-8?B?cjVpakxRWUtuZlBsWldnSUdoQkpnMjhUck9PUGJpMm9PWmt4SXhJcElkeFhS?=
 =?utf-8?B?eVJybjlQYTVlOFJ1QjlaU2UweXJmNEorODA0TFUreWZpbStpRjVTWCtiSUhz?=
 =?utf-8?B?VmI5eWRHMlF3Nm9PSXpHWmhJQ25zNlNXZFlTb0h2MVRNV0wrNURCS2FYOTkz?=
 =?utf-8?B?b3htb2VNM25DK3gvMkZMdUc3SzlPS0hNTEd1a1JDQVV1aWFvdWhyTzJaY1V3?=
 =?utf-8?B?ZUFOeU9EUDJrd0xtZXEyNDVoY25sODJvNkY3T2w1L2lwSFB4TUNHWDNQNzdw?=
 =?utf-8?B?NUM4ck84Yy9pM05iZEl5WTFqbWEvVXZJTmlhbHp4R0VwWGcrQXF5NDZRYUY5?=
 =?utf-8?B?dzRRK3dTdStsTUQyNElwWG5iMkpCaGk4SFpZTDN3QkhERmk5bGovVS9FVmNN?=
 =?utf-8?B?UldSZyt1Tko2SUN1KzBHZ3llbjlDaVBLaUVVWUZxbDdFZDBDTll6M3Y1amVo?=
 =?utf-8?B?dVQ1ZzM0dXNjQlpYTkRaYWpvYVNIWkJKblZPZjFBZWJualljZEZ0L0REc1Bl?=
 =?utf-8?B?a1MxSmRielMwaDIzSUF5b01vVGxTNWNwZHZDY3h3NktHcFhGTnRUaExFOEMz?=
 =?utf-8?B?UVJRRGlsbWRCWUhmZG9ObGs0SU85bjZGbE1BZU9NekV5Mmg2YWtPV2krd0FT?=
 =?utf-8?B?VDUvUVVzSHJ5SDRlR0h1Q0tQakk3c0pPNEZ6cGhqS3E4Vkp2MGQ3bnY2bUpQ?=
 =?utf-8?B?OEplMkRENWVVY1BIYklBbVU0SDJRTkM0a1dHbWl0ZGd3SjNaK0hqZkRsR3hh?=
 =?utf-8?B?UUZiS0JwRVdCcVA2K1hKeUsxVG1VOTNvU2FDTGdIVjR5YWNWdTIyY0VVdlEv?=
 =?utf-8?B?Z1BTb0c4eWJGQnEwU1BYWFRtMkRzRWVITVJQdkhpWHAwTzA2T3JPbzlKTnJ2?=
 =?utf-8?B?Mi8wVkNUVkx6MjY5MmFpUXE4d2R2UUE1dDdhYk1CWlJ5dkJiMS84OWR5dytQ?=
 =?utf-8?B?VkJtVVl3QUJmOTQrcFhxVmFrVi9Mak5OUXk3emwxWUF2WU5zY3R1NmZzVW9O?=
 =?utf-8?B?VCtzZHhPa0xPajUvVURXcXdOTmp5dU9QZTkyUEtkcGV6RlExNGlTQTRtYktp?=
 =?utf-8?B?WklxeEJIdHFoY3p6elIrRldYUC8wTENuM2RSZkNtazF6QVB0VWg2QWtWYWxU?=
 =?utf-8?B?MWIzYUZyS0pnMzRQczFDY3M3YWtkd1BWTC84QnBZQzQ2UFB3b3RDNElnTnJL?=
 =?utf-8?Q?on7OaUrO2M5oZHhKsr50AInRV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bdb0da-1217-4baf-05b3-08db972ef10c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 10:13:27.2390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxxihD3MgxaDbOgIYcUQoiMkdPErX/d1WRNyE2lVuaAY627L6napp5nD/Iijx94zgp0V55gAQlHeq6bIrZErtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7304

On 07.08.2023 11:38, Simon Gaiser wrote:
> It seems some firmwares put dummy entries in the ACPI MADT table for non
> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
> 0xff. Linux already has code to handle those cases both in
> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
> same check to Xen.

I'm afraid it doesn't become clear to me what problem you're trying to
solve.

> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
> @@ -87,14 +87,17 @@ acpi_parse_x2apic(struct acpi_subtable_header *header, const unsigned long end)
>  	if (BAD_MADT_ENTRY(processor, end))
>  		return -EINVAL;
>  
> +	/* Ignore entries with invalid apicid */
> +	if (processor->local_apic_id == 0xffffffff)
> +		return 0;
> +
>  	/* Don't register processors that cannot be onlined. */
>  	if (madt_revision >= 5 &&
>  	    !(processor->lapic_flags & ACPI_MADT_ENABLED) &&
>  	    !(processor->lapic_flags & ACPI_MADT_ONLINE_CAPABLE))
>  		return 0;
>  
> -	if ((processor->lapic_flags & ACPI_MADT_ENABLED) ||
> -	    processor->local_apic_id != 0xffffffff || opt_cpu_info) {
> +	if ((processor->lapic_flags & ACPI_MADT_ENABLED) || opt_cpu_info) {
>  		acpi_table_print_madt_entry(header);
>  		log = true;
>  	}

In particular you're now suppressing log messages which may be relevant.

The one issue that I'm aware of (and that I use a local hack to deal
with; see bottom) is excess verbosity.

Jan

--- unstable.orig/xen/arch/x86/mpparse.c
+++ unstable/xen/arch/x86/mpparse.c
@@ -809,8 +809,13 @@ int mp_register_lapic(u32 id, bool enabl
 	};
 	
 	if (MAX_APICS <= id) {
-		printk(KERN_WARNING "Processor #%d invalid (max %d)\n",
-			id, MAX_APICS);
+		static u32 max_warn = -1;
+
+		if (id <= max_warn) {
+			printk(KERN_WARNING "Processor #%d invalid (max %d)\n",
+			       id, MAX_APICS);
+			max_warn = id - 1;
+		}
 		return -EINVAL;
 	}
 


