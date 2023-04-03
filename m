Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7496D4303
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 13:09:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517383.802615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjI3x-0006gN-3o; Mon, 03 Apr 2023 11:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517383.802615; Mon, 03 Apr 2023 11:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjI3x-0006dW-0a; Mon, 03 Apr 2023 11:09:25 +0000
Received: by outflank-mailman (input) for mailman id 517383;
 Mon, 03 Apr 2023 11:09:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W/KQ=72=citrix.com=prvs=450b71a79=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjI3v-0006dQ-GU
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 11:09:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa06ae9f-d20f-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 13:09:20 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Apr 2023 07:09:14 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 11:09:12 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Mon, 3 Apr 2023
 11:09:12 +0000
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
X-Inumbo-ID: fa06ae9f-d20f-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680520160;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=v4J3NCj80jQPpfZWL0DWy5puK/iCxs6yTjvQS4+UW8Y=;
  b=HPA5GIvpmEiwDkhU3W3O8zcbeQIGLiQxOxevDrQi7/uJH8ErnHpq1uOc
   KbpNxBx+dM7Ibz4vPQWXK43Sh9h6YQYY3Vq5Gt7nxaFUhBKPT4CemjoNT
   oRlg8Hb5Y389Xgm99b2dugxe79LtYI+fop0tjugQtp9XpAqTcQpl379He
   M=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 104022316
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:c6a9tKhJsotYJd8aklRHjhV4X161VREKZh0ujC45NGQN5FlHY01je
 htvD22OaPvbNDT8eop0a4uz/UwG6sWAzt5gSFQ4rn09Q3sb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT4AeFzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQyBiokMTGMud6szYiFWM8xps4EMsT0adZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluS0WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHunANhIT+TmnhJsqEXC1C8sI0cYbnC2+9OlhU7mae5bM
 XVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9UXuA8p+EoDX0PjIaRUcdYQcUQA1D5MPsyLzflTrKR9dnVauq1Nv8HGiqx
 yjQ9HRnwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBb8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:ALJMR6ww4tx7TFt2b3TPKrPxTegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICOgqTM6ftWzd1FdAQ7sD0WKP+UyCJ8S6zJ8n6U
 4CSdkDNDSTNykcsS+S2mDRfbcdKZu8gcaVbI/lvgpQpGpRGsVdBmlCe2Sm+hocfng9OXN1Lu
 vr2iIBzADQCUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T+c2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdkDXI4XIL0TvP2FWYiXzsrYjQQy87MdNIgcZ8fgHC40Qtkdlg2O
 YTtljp/6Z/PFflpmDQ9tLIXxZlmg6dpmcjq/caizh6XZEFYLFcgIQD9Ad+EYsGHgj99Ic7ed
 MeRf301bJzSxe3fnrZtm5gzJiFWWkyJA6PRgw4tsmcw1Ft7QVE5npd4PZasmYL9Zo7RZUBzf
 /DKL5UmLZHSdJTRb5hBc8aKPHHRFDlcFbpCia/MF7nHKYINzbmsJjs+og44+msZdgh0IYyop
 LcS1lV3FRCNH4GMff+nKGjzyq9A1lUBV/Wu4NjDtlCy/HBrYPQQGy+oAtEqbrknx0daverKc
 pbdqgmR8MLFlGeaLqh7zeOJKW6FkNuLvH9muxLL25m8fi7XbHCh6j8TMv5AobLPHINZl7fa0
 FzLwQbYv8wo3yWZg==
X-IronPort-AV: E=Sophos;i="5.98,314,1673931600"; 
   d="scan'208";a="104022316"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvvgfIZ7HE4PDCUUdyqVH/IDs0l3vXHznj9PPIL0J9zvMjGbcOJoQy02KBiWEA+P/ehA5GsQvypLTUchucUjvNlNsrRQ08VQui7I682ikN0DjBzUG5Qsl7FpOnBd7cEY3sIvVRR9kb6u+C7YyHCjUObNqCQYMZz9sqI86RO5q/sKZKLYW5GFWSKLwZnJzwTdidkcncw9TIVS1duWzn67Qi5meJM2plEm80X4w3Q+7I/RPTYDz+XEnTOAIy57bNuSLyEnibd+Mfdhs1VcrGHaDhX2sx1n1M1C6B0gwa99lwgr+1r8mw/jaDQy/f/60EYcDI2PgaVDdzT9HCP511jjGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t14AAj2zeHUEhhx/uWYA+ay1WChw3nkDJJQ/8Wx9Pg8=;
 b=mJ8dVNHlcA+Sy/uERac9nF3krVvp8bOhZNGZAxFP8CmFF7ecw9aZ8qxlnSvQfmf1P5p2d8QLYFrSYD9svbwAdpGJYjJb8f4Ok8nyQ3Z7ufhu/R999vFfk5duKQ9dB2xfCnADeE2JZIZkLsYO56L0/dwfkbAXrCSwnFNnDzV2EcSusU4p9YWaV/ouuJieoX3HdqDnMsksZRKJxACXQWwA9GDXO4cK8B9kwB5/jEIoUIpTKYODp8BVxhfPTcsNnig2Ab3NQOYeJwItv5QSJh4tyqehFcu2E4BKN6RPxx+VmxpS9/pj/x+TvMj/cAl1G87OMnHZY/X3NZr/2okB15KZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t14AAj2zeHUEhhx/uWYA+ay1WChw3nkDJJQ/8Wx9Pg8=;
 b=DcKHQO47nOrDSL1rEl6GlJ1zhYy5O4CNf+7VDyvEDtVeHi9adu5d4KdZaCPiXm3KHGm14bVpjozVYHcsZ8mccRECNkreIGk4rPHIOg3/YxMGOkATUOTVTsKjmjyO4qEi1HVgV16gSt0UgS3G7j8fAyzZgQopQkIvwXaVeZQLdps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 3 Apr 2023 13:09:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Message-ID: <ZCqz0YCFUifIlthC@Air-de-Roger>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <8f2fa47d-89b7-b39c-e60f-edee1de5ca82@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f2fa47d-89b7-b39c-e60f-edee1de5ca82@suse.com>
X-ClientProxiedBy: LO4P123CA0575.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::7) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5469:EE_
X-MS-Office365-Filtering-Correlation-Id: 58fa5742-ebc5-4235-149f-08db3433dacb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Akg7sTkmdu0g0OCYDZAN0JLnGuWcu0q7GLckNjWEPIl4oHCmMYCkXSEOkGRjKZIih3Hy8utzauxtgm8HT0amNQGh+Mf+eWV6w/WxFaENt9L5zbxCGGY+MTta02gP/RGEfEk9Bd5vAY8mfwS0WnfNOfjQYAQBwgPc4UhzcJwAf2fUE2WH4bcpukcPrKhNZllSCzlGtoOV17JHWxp6Sgx9ROXlP9d0+I4RN7uxPCTpePpH6snBA5KlUu3sBu2J9ZZhq9MmoYj2XrLeGeL8m37cmT0oY3DqnZ9q0xk7vSdW8KSCUy4vMkwF+mzKKjIhWrFITEuRNUDli7ifxEml0xpveVw/aVZ2qN6uV6JCrP52nPzoelPU/gnEuRZEWRYm++HyDJKdAhixN6rA4zXYcHNlWSfTK/mP0uQmZqofeIbJueDs0L5hPFklTFKrgRiShU4c7GfyUky0VLd0zVDEPLii7ELEsoOCuYLGl+k6vr6O5y9xL5DJNYQXLp33AGcfqI92wl/aNJxmVetJ9pBFzbYmXsdQ6QyEDwEaewXHZpKi1pSe1Ayyq//DHBe9lSrbcmHj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(86362001)(85182001)(33716001)(2906002)(6486002)(83380400001)(186003)(6512007)(6506007)(9686003)(26005)(6666004)(4326008)(6916009)(478600001)(8676002)(66946007)(66556008)(66476007)(82960400001)(5660300002)(38100700002)(41300700001)(316002)(54906003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUxhSVlRWStmbThEUkdGdlAxdTN1MDZJZFo5dGFGUE5PNW1PdS82QlMxRWZh?=
 =?utf-8?B?Mk1ZL0dSaE1TYXRjU0FxOEVHb3hzaElsZEtXVmp5WXN3YnhnbGc1dU5QWmxs?=
 =?utf-8?B?Y2dYdjVjMG1BMlFJWmhkMU9LL05BaXZWd1QrbUpGTGh1dVR3USttN1kwSGJU?=
 =?utf-8?B?YUN1d3owaGJNQzc0NVFHRTlCbVoxUzd0aUQ4SDRGUnFoV2hPaDAwZ09XQ215?=
 =?utf-8?B?R245OGRxb0dQa1NkWTIxL3V2VUpnUy8wLzFaRWl6ZjFxSE13eGV2OWxJUWlT?=
 =?utf-8?B?TVltblZyeldzMGozNC9WTVJTYjNQSG0vRVgrQ1Mrb2ZMa280emJ1TjJKVUpL?=
 =?utf-8?B?SlR6VVRDa0dvL1hmR2x6V1FGYWN2V2l6aEVxWkptVytxL1VEWVlVUFIra2NG?=
 =?utf-8?B?UFFFOTZ1NmhvSVNLQXI0di9heGRRVVRhbG5CSkVYVHBRdnJ6ZVZaVUNrT2lt?=
 =?utf-8?B?MEN0d09JZEhBT0VUU25VZDVNU2Y0bTJmSUtJNktubm5RWDBmSGZ3RXI3OGU0?=
 =?utf-8?B?QUVrNExIVEM3YVhsYWZjSmcxeDNiRUFaSzZFLzB0TW01UkF2cXNxcy9CNGpw?=
 =?utf-8?B?TEJSbkplZFc2VFk3dWtnNU1oYlkxaUFiNTBIL0VKREI2SVdaaWpyMGd5TzNv?=
 =?utf-8?B?TTNTMWNrUmxnRHp1bURISk1KZGVxVzYwdktlRnlRODg1N0J2c3pEcStDaG9t?=
 =?utf-8?B?R1paMFN1V054Q2lsN2RDbUZkSkJ6YTJVQ1FnbTJ3T21rTGp2Njg1WUthTVJa?=
 =?utf-8?B?VTBmNFRCMzNFblNOUFNsT1o4cGFUTnd1bTF0WDk2dmxyZUlyWEp4T2d3QTFS?=
 =?utf-8?B?RCtqZVZDUzcwZ1VtTWxSd1hYeVRHSnU1WFpEbDhQcUdtWGpMNW5wd0pIKzJF?=
 =?utf-8?B?TFBBUEY2WFA1dXhyaEZhMzB6eWoxSjhJZUtHZVM1b0JacnpTVDgwWUxJZVk5?=
 =?utf-8?B?K1E4OTNHZkVXaXlDejNuUGcrWnhpaHNNVGo0T0h5TjkvWkFpS2U2RS9aNzNt?=
 =?utf-8?B?U05sb1VNcnVDQUN3U2FKT2laY2p4V1FGUzlPZFVPYkxFVnRXMTV0Y0tmWTEx?=
 =?utf-8?B?RzFad3o0RnF3MXlnOXNvcW5tK2FnVEI0Z1IrdFJPaXIrUG1jKzlXTnRteE16?=
 =?utf-8?B?Sk5zd1FzSEZCRGprbTVxZWNncDd0dE9ldWdpY09DWFRnOTQ0eThXajFsR3lk?=
 =?utf-8?B?OUtseVJtQmJoZElYa0ZSL1I3NmttRjZUQVBJbTZwMGl6ZmtYb3BrTUNnajhU?=
 =?utf-8?B?RkFtcWlYVWtLU0RRd3hiUmdQV25KQ045UlZMYXJsYnVFTjRNLytoUVNEVjNB?=
 =?utf-8?B?ZVNsUmNvYUdWN1BPQURvR2Mwb2R5Z3JIdkZoL3hvVkxaWWNRWG5xT3MvTHBH?=
 =?utf-8?B?OGdLMzRGTlh4eVYyMjh0WWFkKzFKUVlvS1ZObDdvblpFcnNNTGpRRkJ6bzFq?=
 =?utf-8?B?VWtwaldXajRqNUlUdGE2S21qclZOaCtubGM4STdrcmJmOWRJV3QxZDZjOC9t?=
 =?utf-8?B?OFpJSDRySmlrOGVRUVhyazNTeXprSk9xaUhBMmMzTFVwRXJSMHRDdG9HV1dS?=
 =?utf-8?B?RHY4T25JOS9SSGQzY0ZFNVBhblJMVlpFQXU2WHFGRmx6UFlGWWN5Y0Q2RUw4?=
 =?utf-8?B?SHhEV01PTmdkUjg3M1J5NFhZUmdUMUd4VUVlVG1iQmVTQlZxaHVrc0Q4TU5w?=
 =?utf-8?B?OHNPeE13cmNjaGxjbnN6ZlV0ZW55OHlZellsd2RhdHVYaXJZS0hwZ1hOTUVl?=
 =?utf-8?B?cUI4anBZdFQ2cnBTVWladUhWQms2TUo4WTBraDMyKzYzcmV3Kzcwa1RUMFV2?=
 =?utf-8?B?SGhndXR6WC9OVjArL0xZSmM0OE9TVmhaS0E5MUdXWktNS0k5aVdaclphcHRu?=
 =?utf-8?B?UzlnL1lqaStIQ2tKM0dXQUxrK3Y0bGNoSHMzWnVOOTJNSTczdkU4VmlmUDUv?=
 =?utf-8?B?ZlFzMzA2UytSc0x0TzNzUmtlMXVKTngxR0dxMkpodW5HODBCRU9VMmhxMGpY?=
 =?utf-8?B?OE1lbktPQjVKZ3locFk5UVlmcDZkMk4zV2NkdVBTZjdTNXdjbGQzV1hyaUw3?=
 =?utf-8?B?Sk14ejFxOFo1Ky9BTDBXR2g1Y01Vckk3RG5qUDcwSzhZNGZFc0JZbzcvNmJB?=
 =?utf-8?B?MTllQUZObUtvVkFLamZVWnp2TTA4QVF6c0NReEhFeFQ4OTFBTml1LzJtOHdY?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lejQw9zKMxEMnfcRK+qkS9rnF6cGzoNe18E0jRMV3JiU138QnkEeXFTshpoTKcKABmi2eikSqkPixwi3takHBWBBxNB0nVGitVdlzTga/dPvLoVzqoIieY1LovtF3N3ZZhYhz3YhOCIOW3SVtwGUDwes06nkFkjrc/M5/Qk/s6ZsgV8FJxksrO9XvRB5jI7tUE0pD5KvZOuiXIJnWqcF3HgLOoOYKrY3yD8k4Nzc2Ypmk1veMA80E1L6EXNXxyH3z1Fow/Nt7I/5aHkbWyiPGLx20y3LjOMotePYezKkNLV8u+LcRSn5Te2UNuVGNof+WFquH6VxTZHzbY1i3s8dsXfXVM6ZDxwDdqsykxtRDC+6XpD2bbwoIkUfZpx3ue53ATbpqTROfCt3PDC2EHYaBJ9NedPQjQVkou7Es5ISQTeoU/Ex33lsJ94lWaKViBxab2WVe84aXDyHR4HLtcY4tgrQ9SaIORPTXWvcQdZ5KvEceEj9Wixv1JKRq9BXxFsElMUzeIyWWslB7Ze/5rc/PN3NO2cxWcFVcgQihdu/PK1lcO80q5RqZiGF9sOoveD7psURVtUbd2zHQvgTNk5gC8e6xG0g4/j90swqbfEtYPSrog6Hew/NcqM0FmsIoC26Tdph/61kUNHLMTiRihDJTTMLBxy7arFvmedLk3tjkMjI2Wu80tUiDJ1DXCkGsCt/0qIDFGeWZ4Hop89Dxe9SMbSGCpxVpnLJ836FzwXmmE+vf8aaEUvmLqqnLJ+JuHd8eAXrhzgXWPRfgJSlDrb73gpklIKCUVe8BmGNQHAAZofi7FQpdScfaQja5tpcAsnN
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fa5742-ebc5-4235-149f-08db3433dacb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 11:09:12.5348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lpLMQ8Z7Ntr6GVcLgbwRZKFq184XxS9nt3ilPLqY2nijENSFfjjXRiQypU1i1Hau5AGfKYVUTXN2uUrSLoRJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5469

On Thu, Mar 30, 2023 at 12:40:38PM +0200, Jan Beulich wrote:
> ... in order to also intercept Dom0 accesses through the alias ports.
> 
> Also stop intercepting accesses to the CMOS ports if we won't ourselves
> use the CMOS RTC, because of there being none.

So it's fine for dom0 to switch off NMIs if Xen isn't using the RTC?
Seems like a weird side-effect of Xen not using the RTC (seeing as we
would otherwise mask bit 8 from dom0 RTC accesses).

Also I'm worried that when Xen doesn't intercept RTC ports accesses
from dom0 could be interrupted for example by the vCPU being scheduled
out, so a vCPU might perform a write to the index port, and be
scheduled out, leaving the RTC in an undefined state.

I've read claims online that the RTC is not reset by the firmware, and
since it has a battery the state is kept across reboots, so
interrupting an access like that cold leave the RTC in a broken state
across reboots.

> Note that rtc_init() deliberately uses 16 as the upper loop bound,
> despite probe_cmos_alias() using 8: The higher bound is benign now, but
> would save us touching the code (or, worse, missing to touch it) in case
> the lower one was doubled.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v5: Simplify logic in is_cmos_port(). Limit the scope of a local
>     variable. Adjust a comment that's being moved.
> v4: Also conditionally mask top bit for guest index port accesses. Add
>     missing adjustments to rtc_init(). Re-work to avoid recursive
>     read_lock(). Also adjust guest_io_{read,write}(). Re-base.
> v3: Re-base over change to earlier patch.
> v2: Re-base.
> 
> --- a/xen/arch/x86/hvm/rtc.c
> +++ b/xen/arch/x86/hvm/rtc.c
> @@ -27,7 +27,7 @@
>  #include <asm/hvm/vpt.h>
>  #include <asm/hvm/io.h>
>  #include <asm/hvm/save.h>
> -#include <asm/current.h>
> +#include <asm/iocap.h>
>  #include <xen/trace.h>
>  #include <public/hvm/params.h>
>  
> @@ -836,10 +836,18 @@ void rtc_init(struct domain *d)
>  
>      if ( !has_vrtc(d) )
>      {
> -        if ( is_hardware_domain(d) )
> -            /* Hardware domain gets mediated access to the physical RTC. */
> -            register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
> -        return;
> +        unsigned int port;
> +
> +        if ( !is_hardware_domain(d) )
> +            return;
> +
> +        /*
> +         * Hardware domain gets mediated access to the physical RTC/CMOS (of
> +         * course unless we don't use it ourselves, for there being none).
> +         */
> +        for ( port = RTC_PORT(0); port < RTC_PORT(0) + 0x10; port += 2 )
> +            if ( is_cmos_port(port, 2, d) )
> +                register_portio_handler(d, port, 2, hw_rtc_io);

You seem to have dropped a return from here, as for PVH dom0 the
initialization below shouldn't be done.

>      }
>  
>      spin_lock_init(&s->lock);
> --- a/xen/arch/x86/include/asm/mc146818rtc.h
> +++ b/xen/arch/x86/include/asm/mc146818rtc.h
> @@ -9,6 +9,10 @@
>  
>  extern spinlock_t rtc_lock;             /* serialize CMOS RAM access */
>  
> +struct domain;
> +bool is_cmos_port(unsigned int port, unsigned int bytes,
> +                  const struct domain *d);
> +
>  /**********************************************************************
>   * register summary
>   **********************************************************************/
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -220,7 +220,7 @@ static bool admin_io_okay(unsigned int p
>          return false;
>  
>      /* We also never permit direct access to the RTC/CMOS registers. */
> -    if ( port <= RTC_PORT(1) && port + bytes > RTC_PORT(0) )
> +    if ( is_cmos_port(port, bytes, d) )
>          return false;
>  
>      return ioports_access_permitted(d, port, port + bytes - 1);
> @@ -290,7 +290,7 @@ static uint32_t guest_io_read(unsigned i
>          {
>              sub_data = pv_pit_handler(port, 0, 0);
>          }
> -        else if ( port == RTC_PORT(0) || port == RTC_PORT(1) )
> +        else if ( is_cmos_port(port, 1, currd) )
>          {
>              sub_data = rtc_guest_read(port);
>          }
> @@ -436,7 +436,7 @@ static void guest_io_write(unsigned int
>          {
>              pv_pit_handler(port, (uint8_t)data, 1);
>          }
> -        else if ( port == RTC_PORT(0) || port == RTC_PORT(1) )
> +        else if ( is_cmos_port(port, 1, currd) )
>          {
>              rtc_guest_write(port, data);
>          }
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2131,37 +2131,36 @@ int __hwdom_init xen_in_range(unsigned l
>  static int __hwdom_init cf_check io_bitmap_cb(
>      unsigned long s, unsigned long e, void *ctx)
>  {
> -    struct domain *d = ctx;
> +    const struct domain *d = ctx;
>      unsigned int i;
>  
>      ASSERT(e <= INT_MAX);
>      for ( i = s; i <= e; i++ )
> -        __clear_bit(i, d->arch.hvm.io_bitmap);
> +        /*
> +         * Accesses to RTC ports also need to be trapped in order to keep
> +         * consistency with hypervisor accesses.
> +         */
> +        if ( !is_cmos_port(i, 1, d) )
> +            __clear_bit(i, d->arch.hvm.io_bitmap);
>  
>      return 0;
>  }
>  
>  void __hwdom_init setup_io_bitmap(struct domain *d)
>  {
> -    int rc;
> +    if ( !is_hvm_domain(d) )
> +        return;
>  
> -    if ( is_hvm_domain(d) )
> -    {
> -        bitmap_fill(d->arch.hvm.io_bitmap, 0x10000);
> -        rc = rangeset_report_ranges(d->arch.ioport_caps, 0, 0x10000,
> -                                    io_bitmap_cb, d);
> -        BUG_ON(rc);
> -        /*
> -         * NB: we need to trap accesses to 0xcf8 in order to intercept
> -         * 4 byte accesses, that need to be handled by Xen in order to
> -         * keep consistency.
> -         * Access to 1 byte RTC ports also needs to be trapped in order
> -         * to keep consistency with PV.
> -         */
> -        __set_bit(0xcf8, d->arch.hvm.io_bitmap);
> -        __set_bit(RTC_PORT(0), d->arch.hvm.io_bitmap);
> -        __set_bit(RTC_PORT(1), d->arch.hvm.io_bitmap);
> -    }
> +    bitmap_fill(d->arch.hvm.io_bitmap, 0x10000);
> +    if ( rangeset_report_ranges(d->arch.ioport_caps, 0, 0x10000,
> +                                io_bitmap_cb, d) )
> +        BUG();
> +
> +    /*
> +     * We need to trap 4-byte accesses to 0xcf8 (see admin_io_okay(),
> +     * guest_io_read(), and guest_io_write()).
> +     */
> +    __set_bit(0xcf8, d->arch.hvm.io_bitmap);
>  }
>  
>  /*
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1234,7 +1234,10 @@ static unsigned long get_cmos_time(void)
>          if ( seconds < 60 )
>          {
>              if ( rtc.sec != seconds )
> +            {
>                  cmos_rtc_probe = false;
> +                acpi_gbl_FADT.boot_flags &= ~ACPI_FADT_NO_CMOS_RTC;
> +            }
>              break;
>          }
>  
> @@ -1249,6 +1252,77 @@ static unsigned long get_cmos_time(void)
>      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
>  }
>  
> +static unsigned int __ro_after_init cmos_alias_mask;
> +
> +static int __init cf_check probe_cmos_alias(void)
> +{
> +    unsigned int offs;
> +
> +    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
> +        return 0;
> +
> +    for ( offs = 2; offs < 8; offs <<= 1 )
> +    {
> +        unsigned int i;
> +        bool read = true;
> +
> +        for ( i = RTC_REG_D + 1; i < 0x80; ++i )
> +        {
> +            uint8_t normal, alt;
> +            unsigned long flags;
> +
> +            if ( i == acpi_gbl_FADT.century )
> +                continue;
> +
> +            spin_lock_irqsave(&rtc_lock, flags);
> +
> +            normal = CMOS_READ(i);
> +            if ( inb(RTC_PORT(offs)) != i )
> +                read = false;
> +
> +            alt = inb(RTC_PORT(offs + 1));
> +
> +            spin_unlock_irqrestore(&rtc_lock, flags);
> +
> +            if ( normal != alt )
> +                break;
> +
> +            process_pending_softirqs();
> +        }
> +        if ( i == 0x80 )
> +        {
> +            cmos_alias_mask |= offs;
> +            printk(XENLOG_INFO "CMOS aliased at %02x, index %s\n",
> +                   RTC_PORT(offs), read ? "r/w" : "w/o");

I would consider making this a DEBUG message, not sure it's that
useful for a normal end user, and printing to the console can be slow.

> +        }
> +    }
> +
> +    return 0;
> +}
> +__initcall(probe_cmos_alias);
> +
> +bool is_cmos_port(unsigned int port, unsigned int bytes, const struct domain *d)
> +{
> +    unsigned int offs;
> +
> +    if ( !is_hardware_domain(d) ||
> +         !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) )
> +        return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);
> +
> +    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
> +        return false;
> +
> +    for ( offs = 2; offs <= cmos_alias_mask; offs <<= 1 )
> +    {
> +        if ( !(offs & cmos_alias_mask) )
> +            continue;
> +        if ( port <= RTC_PORT(offs | 1) && port + bytes > RTC_PORT(offs) )
> +            return true;
> +    }

Maybe I'm confused, but doesn't this loop start at RTC_PORT(2), and
hence you need to check for the RTC_PORT(0,1) pair outside of the
loop?

> +
> +    return false;
> +}
> +
>  /* Helpers for guest accesses to the physical RTC. */
>  unsigned int rtc_guest_read(unsigned int port)
>  {
> @@ -1256,23 +1330,25 @@ unsigned int rtc_guest_read(unsigned int
>      unsigned long flags;
>      unsigned int data = ~0;
>  
> -    switch ( port )
> +    switch ( port & ~cmos_alias_mask )

Given that the call is gated with is_cmos_port() it would be clearer
to just use RTC_PORT(1) as the mask here IMO.

Thanks, Roger.

