Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBF37DBB7B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 15:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625136.974093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxT0J-0000Wm-Pp; Mon, 30 Oct 2023 14:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625136.974093; Mon, 30 Oct 2023 14:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxT0J-0000V6-N3; Mon, 30 Oct 2023 14:12:31 +0000
Received: by outflank-mailman (input) for mailman id 625136;
 Mon, 30 Oct 2023 14:12:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxT0I-0000V0-Rk
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 14:12:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c25ae52-772e-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 15:12:29 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8338.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 30 Oct
 2023 14:12:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 14:12:00 +0000
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
X-Inumbo-ID: 5c25ae52-772e-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCcmqJMIDm4L6witGpNfqFxH9ZlCAv7SE02jf5zjeC7lhHiVAzr4VZ5HKoJA0uOI4miTJwnGCsPtnml2AES1iKMOSvrRGz5Lpct5bYYRdyQQDGT5oscNYCvtg+YtUxJtN5bvd5XWPnz3cgQModHFWl4IZmSJSrZSBAKFxRr60SxvEmLje7NqJzXzMKumgtanJ8MbvZdtCvLeuGeLzPfqlTsbHeCigbzPiJHhx27NFxPASSpb7A/AfnlnuSCrDR339oRiP+3dx01kfeGXgT8bS4Xx33VEZu83dvjCYtrvE+JkMrtK8Mv6+U8lgBYIF754sropr+5cohBnb/fs95fveA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26FFgfDy+XeQ9w/5g7cx/xYQJAeK+xLT3MfRJCPlin0=;
 b=JLlbnVuVOQGU0sghhpYfpKZW2/UL4Da54ZAALxxbSKQ8VCesJE6mcq0n0oyVguEk+ot4iZDDMZeAVcNkEWyv2c1CirhZVFSBXXCp9vDkpKW0yVwdn2TE769oug/SlddgGzpRwLdSmEdosf3p888rEmFW7EHWTK1rOdYxtyswZnNPiwEgaFopniC/a/yG7+Y5aPRdRusCEPQH8vPGJr2lY5UV1khDRWK3X+gFF9e319JHc3pKg37HgaiP37y60Y4iHl2b4CSlY96XDPR1uFvpFzWpf7zmQPDwxQfQHS59Ez/owA2dkVmlwV9o6c02fiuVBytBBZ0nVylCVbq89Zn9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26FFgfDy+XeQ9w/5g7cx/xYQJAeK+xLT3MfRJCPlin0=;
 b=S33mficFlsGLCTJSUWkQuGmOsoM+403rWSjDexIjTSaALHuPGdPbwpY/4imYVpkNu/7EkW+KPKNR7uG8bVfxbt0t8h8wzKiQtXp3Xks2Au1WjN2atDJi1oTY0tM8AXpk7Y8NlHdo0i7+LFGxS2+VO8xT9A12EcCSz6iX/A1iuCEZyUxNrdPjSNEBKsxgknjittAxAw+4+C2fuusLXvdiOdMNz2NG/jLUqzm0274GpACd9f3h4/7TC8QHs/4MZptm6yEvkWa9QMmlh8bwjBL+MHClYqxjc9zGRtNAqjaUTrgQayRmDylqxXPTNYqWiAGZWSsmCckrq4nwHWz9fyNFQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <705d59cf-0e3f-0224-dfc3-be60d446d2e0@suse.com>
Date: Mon, 30 Oct 2023 15:12:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/x2apic: remove usage of ACPI_FADT_APIC_CLUSTER
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231024102630.47691-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231024102630.47691-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: a01d3a27-f8f7-4544-e369-08dbd9522ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lnI7CY2QZ/BzT1tuoivheXXgIdvJZJJvRK9pxLz3rVyi5t6oJ5xVRsrgpSWDFVAseOBDiOS4dri/z/2PT8D+QUP9OhtczTOuQMYl1hcGJp7wNeQr3aHsCephUXf8wrtGPMnVOpVND0SabhHpvgW+o4ng03rR4WF7HhVN7ogpCT1llN36+ntBFhm96BKoMFzLtOs7sDcRDExzl+OgZnKqgMdZ0nLc42NtdZc0cOvU3EaUEcghWm5OAd3YG0X5d15FAVj5wByU9yliU7dll4aEteo8B44FFnrgR/AwfH2xdD0YEtIfKmx/MXlwcM5tTtNIxrMlO2tbjpii84JpNt1N1pxYIYHV+fmGv/aUKhSMQv1VFZeVO8Qh2ACpryBgbY9lXi0D3gj/e0te/u9gDD5mCmalijIsQfYrHxWdFPXOhMhPVGUPtBwEhu7utqbzmqlXOltDjtV8URGP8e65DZWIgf8kVyQ8sNNrJy2m6DgoCJXlWENeIZ4idbqdHWrFg8NYF9zF/uY1g8tJKDf/vuAs+H4815Us/UUvPStTU6TiLcRkGarNJwHJldZT3GPhA9RXu/Pusnu+d5OPTA4a+Qw+HxtVuB9ZoiEcYEosqYy71LOKz1ybkyeti9vVTAmjv7kGaF/5tnMZA06MmcEXDucOHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(4326008)(6512007)(53546011)(2616005)(6506007)(8676002)(8936002)(478600001)(26005)(41300700001)(66476007)(5660300002)(4744005)(6486002)(66556008)(86362001)(38100700002)(6916009)(31696002)(54906003)(66946007)(316002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVd0Y0lmOUtyUElkSjhFUnZndnI3Ti83Z0g2bzFZOWZqNVhTK1NSVUMwTXB2?=
 =?utf-8?B?UkphSlM3dHAwZ01xakVIMG1KcEo0aUdya0l6blJza2tpSzhOZlRhOG5hQ00y?=
 =?utf-8?B?TGthWVNEQUFlZzJPRGRmNUN0QkRoY0tPeldPdTZWNU1ycjlZbWEvc29DV2Ro?=
 =?utf-8?B?b1dubU10RUZRQlVZeE8xK1RRYWNjelVZQW1IbzlEWnBWRWhoa0E5WUVIVUly?=
 =?utf-8?B?RmF3eUY1dHlJK1p1M3piSXE0R0Fqa2ZIR1Rib3ZuSy9Rc3lGZHBOcVhZOE9s?=
 =?utf-8?B?Y2NxZ3FoYzJqZjdEVUswRWk2WlAwWVRuR3JIMTdYT01Ycm1FQkhQOUFxVXFT?=
 =?utf-8?B?K2ZyUFdwZXlja1VDT2Y4SjBJVElyUlFBR0ZhYW9iMkNwMlhwZzIrQlB6bWdr?=
 =?utf-8?B?eSswbDhNL3BYKzhtUkVKeEYza2RaRHZuUXNIQjY0T0lMcjNBM0dVNDdvZTlt?=
 =?utf-8?B?bk1QSnVZMk1TVWVwYnRCTVZ6NFpvWHZKRjRJZXpsaTdzQjdmOTJKNXVjY0ZF?=
 =?utf-8?B?bUFmczNra21EZVZ0TWJrZjV5SzdTOEowamhwWko1K3M1cjFqSS8yd2k3S25S?=
 =?utf-8?B?UkdtNXN3NnQxcWN6cTFDL2x1U2VvQzRKZ2JOSDc4UlpDRHBBQldWSUgwdnpj?=
 =?utf-8?B?QnZKbFdySytCNm4wb1dtU2h2bHE0TUg2emFEUGdET0JDVUpxU3dYaG9QT3Zh?=
 =?utf-8?B?UmwyUVBoRDlGVWQxNzlBV2RkSDR3bWtSQ1hSL2pBTHgwSTAwR0MrZENLb1Y0?=
 =?utf-8?B?anNDWmhvUzVCdFVBSVNBbFdMQm0wZjEwV3VmYkRCMzV5WkdDY2dBM2N1SFBB?=
 =?utf-8?B?WVUvMHBReWtacGt0MjBqTFhsQUwxMkZQVXQ4RjluVDNLdG1UVml2MHZSNllG?=
 =?utf-8?B?T2NhVkNGQ3N0eEovdjFiR0IrbkhJSTJhRTJkUkt3bmtsM2h6cjBvS09KOGp1?=
 =?utf-8?B?bnhGZHpkN2V0Z084amlGN2JlZjVuVWRJWjQ4T1g5WWwvNGI4NzlObURMQ2Nv?=
 =?utf-8?B?clJFWnBYRWREOWE1S1ZFejVwSFdualV0am9QcjNJb3JrdklpYlhZWjA0clB0?=
 =?utf-8?B?N1F6clkwMzU3MWJUS2FuRUJ6YUoyYy9pS2FSQ0dsaC9oZ2hHdEpkeEhOUW1Z?=
 =?utf-8?B?em9ObktwZko0NzJoaHhrY3Zhdlloc2JMc2JOUW8rTnB4S1hDVUZMMFIrMGRr?=
 =?utf-8?B?QTI2Y2svTXVyWFFRakZTc3IrcUV6aDJRU1pmM0V1MXEyNWxEQVF1UkJya1lP?=
 =?utf-8?B?czdvSWZjVEVKd2lMMUR2bks3ZjJIdlFtK25PVlRpSFg0Y1BKaFdjaWZadXQ4?=
 =?utf-8?B?eGlmRlZ0ZXY2eU02UUVXZVdSdU1oU0xZSE1lbGRNRm84WnoxY29PZDdQSHdw?=
 =?utf-8?B?RGtpZ0hQUmZ3VXFpYlFLd2wwODBsaC80bElEaCtNekprN3dSYTBUUjZ4L3d6?=
 =?utf-8?B?ZVlVQkRrNmtuUWhwY24vUTBGdTRVQWNFSEM2MlA0K012bU05by9BRlZkNnVX?=
 =?utf-8?B?akVUTXJ4V3Fza3FhNG9PNU5UNTViVHp6T3lEblZuRW9laUhVemtsYTBnTmZo?=
 =?utf-8?B?M3M5ekN3dmFoeGMyM2dZbFluUlpLbEJaUmk2Qklvc0pZdGo0UDFzYzBFeGtC?=
 =?utf-8?B?NzI1aXJMU0o4OXRWN0QxNW42dkhxL0M3Y0dlZGg1dllHK1B6YkIrdFF1MkhH?=
 =?utf-8?B?NWZYSTREK0dkV2IrNEpVT0N6aHlyRXRUSm1PSDdGMXNpQ1hya2ZDMFl5dkRS?=
 =?utf-8?B?MzAwSjJGdVV0VjlOZ3Q5a3RNUnpGWjk0K3RSeTJMbGNWMkVvVkJFeE9CQ0NV?=
 =?utf-8?B?czhuR1hRcnJhR3dJWEE4OTB5NkZMQ0gzOGtsQWFKeVJLdnorMkwzQzFQRytT?=
 =?utf-8?B?SVlyQlAxcUNLRGErckVoUDFsM2R2ak5WSWFuUjRKVVNibVgvQVRQNEJ0aHhR?=
 =?utf-8?B?eHBuaUovdHJtWlBNaEdCWUNXQkEvTVE1blZzN1owcGpLV1RSWTFFaHZwdlhu?=
 =?utf-8?B?Q1h1NlgxSnlHQkZIQWhXUDYyR1RCQjQ0M3haWHBMa3hkdEpsK01GTmE0SkZu?=
 =?utf-8?B?aEl5azNEcHhnUXV1NDRtbUI4dzFyR2s3N0xUT090em84TlFkVmxSWEVZdEZU?=
 =?utf-8?Q?by7cxCaxw4b24+2Mi+I6rA12R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a01d3a27-f8f7-4544-e369-08dbd9522ec6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 14:11:59.9738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alpN7d2cmlw2O4PL/xP7xpq2A/87HvI8V+HSgBLbEDDdEDdLqdrRJ9GFrgSff6Pls1rdPH15CAtDOz1Zdx6xgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8338

On 24.10.2023 12:26, Roger Pau Monne wrote:
> The ACPI FADT APIC_CLUSTER flag mandates that when the interrupt delivery is
> Logical mode APIC must be configured for Cluster destination model.  However in
> apic_x2apic_probe() such flag is incorrectly used to gate whether Physical mode
> can be used.
> 
> Since Xen when in x2APIC mode only uses Logical mode together with Cluster
> model completely remove checking for ACPI_FADT_APIC_CLUSTER, as Xen always
> fulfills the requirement signaled by the flag.
> 
> Fixes: eb40ae41b658 ('x86/Kconfig: add option for default x2APIC destination mode')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



