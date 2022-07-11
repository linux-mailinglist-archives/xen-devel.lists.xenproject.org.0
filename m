Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881C656FEBC
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 12:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364995.594980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAqUX-0000E1-6m; Mon, 11 Jul 2022 10:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364995.594980; Mon, 11 Jul 2022 10:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAqUX-0000AX-34; Mon, 11 Jul 2022 10:18:13 +0000
Received: by outflank-mailman (input) for mailman id 364995;
 Mon, 11 Jul 2022 10:18:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAqUW-0000AR-5x
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 10:18:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3de4160-0102-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 12:18:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9568.eurprd04.prod.outlook.com (2603:10a6:102:26e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 10:18:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 10:18:08 +0000
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
X-Inumbo-ID: c3de4160-0102-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuiuzZ2XZiuUrr819rtCdXumtBOAcheYrmOcZmVbfgf8nvfjZSKae6sJQZbnbrbjbTgXUyVL+z+dvjkkVRzu37Uq5xpytEMKolg5gy5+Fcb9PbHpQwp2vimJtiitw6Qfmr2053/rr+sZ7Q21rHxc1c2toqGoMffzitCyGqTid7W/gL92CmhAFz4LABkG4REd4DMc/H4v9c4fKgpi+x01IwtSvST6eAmsu6eYD3mP3wcva/uDDG42n1jxnfHRC5HC5cv0GmZVWmyCHoZAyB3Pj7N9u/Mmsnvfxygt1MZGrrO8FL96sqijJJkPQFMX7LYW3BYym0QpyMnK5fKUmRb2dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtKYZMysepxFqdQWhwaNCzg3kFQr5pPutYk61gpWAzg=;
 b=dkPhFLZ4eLV1idZTgxBJhy/VJdxjcEAmJn46VpKqVqfl8BwyjDktIGjKA2bf1c0XSc2jAMnTu25XYLEeM1v/17gpP9kUQlcv0ioFXcDdEhghPqtSNppj10O6PvLNqdf+nZI1UfmkSJK9e2yOYORmhzKaw8DtsR0MY8OswNfIc658zvlNXO9rqX3eEvHdRNEcIaIqGs1Y2qtywolxhM/tz5VZSCPkvvQqNYiwouGTzlrBoIAXN1sZ6jF/mukG0NvYWw82J67zy2qggydvfvtaLNn8QYOXa8BO2LsZ3PnDOrj9YqVcY2bga3DAwt9r4gUu1pZywf/WuplDbmRu5jk+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtKYZMysepxFqdQWhwaNCzg3kFQr5pPutYk61gpWAzg=;
 b=2m9FGefg+pFHVU9YeUnTb64NJaFRFmHiMU1hchdfQnhKfMuf8MVlE1rhr5kPY7oprjwt2JNk4CCVUkYaEAk81gkHTbcIeku6sBo4Q+Ew6J1w5poiLaN63SIVqVNXfZ5LupOn4P1JIdgPwa5J3lp3JKVnxYbirvJC775uRGHz3CxatZXDPNQSpa4WvlKMX6noeDcGCJRH1gkGJTnr6D1ZCPLHXmmlmHvDqfpsumQC7BEg+3obLw0o3Q2JaygXZHzTmBloG6Smq/DMeFe8q7myG0iMcaZXq5rTd4ZAPOU6nZ5sUa5FIf75hqTdElBUJrqAsG+fox3mHVgtgOidXaIDXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48f157d0-ed5d-b584-fcff-1425c137335a@suse.com>
Date: Mon, 11 Jul 2022 12:18:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 5/9] xen: generate hypercall interface related code
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220324140139.5899-1-jgross@suse.com>
 <20220324140139.5899-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220324140139.5899-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CWLP123CA0164.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:88::32) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0724b647-f790-4c2c-8dc1-08da6326a6bc
X-MS-TrafficTypeDiagnostic: PA4PR04MB9568:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NrPes/42KiapD4rXqgYm8uSaPlDONItEF/1Ctfo/ZLCsOpUCao29O+U5lvz1K0lEIvyacfyXdur7L0gYh0N4Ec9a1KKFfalUPvwIXP0kmfBL3B7xINOa5AlJUtEa3W9F+PEOHSgBPT1LS8DSJGruGMyzaI4sTwzl8MClxeIm3aGlysvdTelUzmLMKKL/0nOhuQ78Vz+K6xMvKCm/3udIqdeBycbwrQTe6jRg4RLVQAE5vo7PowjYVb/rEUEFiVRnYyFq2cq5Pq9Uu3u4nU1urc1o4JcWDJ5Qr2L9NYffBllgzNO1kido/LLJQRJfqKW02H1sxSMhkkJf7WyiO09k1OgOWXLebRW+pcH/TMdoNV5Eu2Q5u1yw5+CLmBgwQ5CKxcGjM1645OnCdCgHQRsXxSlQRofOXZvUDnqqRQfDWjQGviU4wxce/Rn9F4aLSq00Bl5OgpQ8zl079S3lPcCT9slUwkU6Nwg0O4lAOFOz3CyNpJ6AvuTPKIyoJzbN7xoDC6zlBwtZghT8f5omhvBlKL+4q33zrXOPJD2lLJhJA86zdOwLo70VHD9qKjXNe/iwGEhsIaRZfwph/GrLhvs/EjlnE2wlUjR59jvLtxw2JPGV88GvYjqzztPaJKZOVaIbQXniYzwyc1SvF8/bDmPBzSPIrT3PiqjQlWxLu5nUjjv/L2vDqnePN3OH2dM8wOGzvSuVti4HEoHFk4h4XrzwaU7gWTLK6dZMOL8Vjuyhsu4XjJn7Zlo72YBOQd8Zp9jwdXQtOETIOW8Or5E1cJCc+OPUNxIqemBUo1L59tN8hjz93qS89t6y/77RmoZujTP5cP5Q5723qgxZAjUOtB+0hoHGJSHa8GfNaFgHF7lJERg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(39860400002)(136003)(376002)(366004)(2906002)(6486002)(478600001)(186003)(36756003)(31686004)(2616005)(86362001)(31696002)(316002)(5660300002)(110136005)(54906003)(4326008)(8676002)(66556008)(66476007)(66946007)(8936002)(53546011)(6506007)(38100700002)(41300700001)(6512007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmFobGhQN1RnK21oaENvb2JOWXlUcWdvMmNwbVZMSytLalNwVUx6VEFOK0Fx?=
 =?utf-8?B?Z0N0Q283SkhoVWYrTHhvaGtTeVdkWSs5OTArMG81dnRidE8wU3hYd2F5Wi9z?=
 =?utf-8?B?QTh2SXFwcjdsckRLZ1ozTTBsWkE3U1k5SjVaamYyVXpseGJMRk56c3BnanhR?=
 =?utf-8?B?QVdNRWR6Ti9WbEZDTVNKYVBHK2tWVG9oa3c1Uzk4VGF5aGdEK1pyUmxjOUhP?=
 =?utf-8?B?MThEVTcrd3YxSCtuMnRQbzM0RFdndFFvTjhPV2pDb1psK3FaVmpoOWVERWpG?=
 =?utf-8?B?b2t1ZnNDWXpCd2RaUGNWU2tCMjZwdWlzbDNDQm81TSs5VGdsamtOVHkrNk9Y?=
 =?utf-8?B?N2lqU01RSWVGTWhMNFlVRlBVSVV4eVhTb3l5MURpKzl5VTRwR3NNOC9HSHV0?=
 =?utf-8?B?MHI5MzRkK293YW1CTzJTL1p6Vk1NV1plMDFTdXlNUXJvdG5mVnRwL3FBblZu?=
 =?utf-8?B?cHFBNGxzSy9xSWJxL0hBc0x3UTlURFdzbFpaRUhrSnBXbmJhV0ZobkUyL3gy?=
 =?utf-8?B?UzYwMDNUOXBTWnlZeTJ4WDhCYmlLK1lHT1hUU1NKcGlqdkM4QzdSa0UxcitN?=
 =?utf-8?B?eEU2ZkhVbnQrRThPaGt0cWdBejZZVnEzM0RnVFV4M2NVYUtnMDE5c2xRTFIr?=
 =?utf-8?B?L1oyOTJrODhMZEE3dmYwOHMvOFVaUUlIZFB4dkIrR2hYSTlqY09XM3IxcEla?=
 =?utf-8?B?MnFuQzhNZ2lwbG84MUJ2MVNpZWdXYjZXRjJiWVRCdThBTXd2NjhWSjFxUlVy?=
 =?utf-8?B?Nk50dTExSDdXeWVxQ2JXazZ3VmVYU24wL2U0QUpPWFNkVGxWeVN2NWlXczhW?=
 =?utf-8?B?Z1Zuc2s0ZGRNYVBMTWtHK3l6Z0lkRWNFSWMwUnNaQ3lMRGlkSXp6VjM4QVBM?=
 =?utf-8?B?ZTBNemV0SDZyMHdSakVabjJzTjZoMlpWQ1RCQ3hlbUtiWjJ1ZUJqaHVCcnBT?=
 =?utf-8?B?c1QwY1R6Z1liTnNUSXRlL3NUL3AzeXEvdGlrNUFuKzJncDVEZ2Rqb1V1TmJj?=
 =?utf-8?B?R0tpTGZNbVJpQlNXZFVnV0l1L2pqSTRETVBCdHFia1BOUmFnbW1WaEx5Q1I2?=
 =?utf-8?B?YWVLRC82eXJTZlpSRit5WjZ0Y3ZKR0VIQkVEY2ZlakljQm8zVGNyTSs4VE10?=
 =?utf-8?B?MmV3dW42ME9Xb0Y1Q2xQRjVPa2hNaEY4UnNiaUhKaDUxT0g4RWNwVEd0U1pD?=
 =?utf-8?B?RjlNU1pLYVBsazlTaVRvbUlhWEFObkk3aElDRXVKcGNtc0F6ckdhci9NMXhu?=
 =?utf-8?B?TS96OE9ERGpUVzBaTFBvU0ZyL1VhdGJwUlRhcGV4b2d3N3p0Z2dxOUxDbkNO?=
 =?utf-8?B?OGJXVUdtVWY3Ym1TeG9SQXBMenJBM24rUG42WFNzemNHcnIyeXJENDJVWGRu?=
 =?utf-8?B?Ym54UjQ1TnhYR1g5cUp0bmdacjl3UEdsMzlqOG1FelRCVU1WY0JtMnhDcUcw?=
 =?utf-8?B?ck5YWWIvL08vNk14REdNSCtPVW5xdVRlMWNwckhaQlMrcU9XQUo4MGVxbHF3?=
 =?utf-8?B?V2ZycXNJTHYzWWlZb3Q3M2ZrV2JxdVZKMGUycHROaWVlMkhucHdFZUswV25C?=
 =?utf-8?B?WEYvaU5Ua2RkY0cydWRmUFI1cURZdzh4WnZQUTBoeENFbkMxV3VCWHZZckpS?=
 =?utf-8?B?YVMyQmR4LzZRR1hZRm4ycGQ5UVZDVUhlSnk2bmI2OEZBNUJkSlBiekxHVHAz?=
 =?utf-8?B?czZoSTlzNWRtZTk0dW9Qck91MmJNUVBWWFZsUHVGaldueExKWGFORWRIVmJ6?=
 =?utf-8?B?Y0FaS3JkR1oxZGhqaEVJekhDN2VBTjVaUk5LdTM0bWNrcW93VnoxalVHY3Vh?=
 =?utf-8?B?ZG9pL0ZONXhEZGFLM214dVQ0b1NSc2ZXMVJWUWEvZkFmcExVbTV3enhzSWZm?=
 =?utf-8?B?Q2ZPdk9saFJOQlFSZkFhaktMR2J6MVhkMjdWbVI3dVMxLzZ1Q2pEMm0wVitC?=
 =?utf-8?B?Ujk1R3FCRm90OGlSQ0ZvTlBiUGVKMDNTWmxuNjZTMFhTNHE4a0lOYjlqYjdF?=
 =?utf-8?B?b3FjbzlkVWdQL1dPV0t1amNDY1p0b1pHS0xJUEh3TDJCZVZBV1lCbi93ZXpT?=
 =?utf-8?B?VEtWRTVIZ2lCWEp6NmJiV2xabTM1bXUyc1dqTkhUbFYvK09sZ3lrS3g4MW9v?=
 =?utf-8?Q?OdjUa9LEV5hoqeWw6QGdT0Rmq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0724b647-f790-4c2c-8dc1-08da6326a6bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 10:18:08.5503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vD2vmdy5Zf506aDh/RFsPF6rNqo5W1SH89LrUux7XBo2oAyVrl4/yv+XiUtKv5UtbuqlnvwLOZhElX7MMZxIKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9568

On 24.03.2022 15:01, Juergen Gross wrote:
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -77,6 +77,18 @@ $(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) $(obj)/config/
>  	cat $(filter %.h,$^) >$@.new
>  	mv -f $@.new $@
>  
> +quiet_cmd_genhyp = GEN     $@
> +define cmd_genhyp
> +    awk -f $(srctree)/scripts/gen_hypercall.awk <$< >$@
> +endef
> +
> +all: $(obj)/xen/hypercall-defs.h
> +
> +$(obj)/xen/hypercall-defs.h: $(obj)/hypercall-defs.i $(srctree)/scripts/gen_hypercall.awk FORCE
> +	$(call if_changed,genhyp)
> +
> +targets += xen/hypercall-defs.h
> +
>  ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
>  
>  all: $(obj)/headers.chk $(obj)/headers99.chk $(obj)/headers++.chk
> @@ -132,3 +144,4 @@ all: lib-x86-all
>  endif
>  
>  clean-files := compat config generated headers*.chk xen/lib/x86/cpuid-autogen.h
> +clean-files += xen/hypercall-defs.h hypercall-defs.i

I've committed this as-is (with just fuzz suitably resolved), despite
being uncertain whether xen/hypercall-defs.h - being part of targets -
actually needs enumerating here (anymore).

Jan

